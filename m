Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF142D2614
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 09:33:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FBAA6E976;
	Tue,  8 Dec 2020 08:32:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C7056E849
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 13:40:03 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id B66BD58036C;
 Mon,  7 Dec 2020 08:40:02 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 07 Dec 2020 08:40:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=viwvE8wkMa9WU
 uZKYv/L+rbNhIKw+nwn99BEyV4UZbQ=; b=nakTnnRHYysuHXHsYRpFdR2DRNYya
 0BLtyxeD6i8wDx0VqBEBmZevclUYM584sIUItL6iv2GM8nxYkizRFU4vMQGnuhso
 oBySEYmBqcPFQRHULdpxy1vWG69orkAnqPQLw/aCrgvkBo92Ifc0UrfbNSw1DW+i
 6T13/+7apUDdp1yYNttGvDj0Yvu0QE+wOkPQWjRxiHVy3novBYHBLS8tDK2vIlmF
 HZSYS2PH4HUqkXKfyhGv66tfdjwLd0hVjffKbPErqssTy1Bg/y/zNRhL3C5GoncO
 HbVFiP0NHYFFZVQFGgtll34oG5JEi4rL5CSIkPBs5uhxEJQcXFOZS19pQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=viwvE8wkMa9WUuZKYv/L+rbNhIKw+nwn99BEyV4UZbQ=; b=ksvAWGlR
 29ckjdaoI8EmK5k9CHYPlXU1O5m6RE8V0ohJjHGzQkayEljnJ6BUe7Mlor70L3JR
 FwNKmmSmc1ejzkhp/3QUKSwJuW15uNr4T3zMGa8ciakHsuB6Bb+aB+81vNgptuRJ
 Vc1w9dJ18VKVrfsDoARNB18f2CVoDuLe+jrAEfuZ9U+go6wWjIGGau1GhOAQYibd
 MXGdIDqIdUz43bvXN9GTELrGnG0miNgPP8o9IgOSFW2Tf2amryh5mhQ35naHi3vN
 xtDdERuAHScLdVhWkps9MHw1g8Z1NuIdsQITA/eyHthKJh7vshm0FnI+mHbvDkTS
 jKxbY8GCWk9Q/A==
X-ME-Sender: <xms:sjDOX8H74t8nVW6CcYtdf3jUtykKauRR1HpWCw_c5DEoWHzdH9SqRA>
 <xme:sjDOX1Wztv2i43gMLUppSfwPe5sQvL9PemWtopV0385lMaQvsKbpfiwzjYQqojrgJ
 EsB6FVHLupbnrpwOxA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejgedgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepjeenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:sjDOX2IRpSucZJIK7T8wXDvNh5I5sEMf-0Y4UoSqwkJtro6dIkWcZw>
 <xmx:sjDOX-HeISoP17jDPSyRQq8CxRwHq5vGPskeJc5gdE_c53b5DssHHg>
 <xmx:sjDOXyXQWTDrBsjgMGtkAoedsbNT96SBm6C-U5n8uCJ9QBPPMJSjeA>
 <xmx:sjDOX2oWIzc-J5Vm_NRcsb4lmxPNmA-y0eg7MQpspusXxF9s6FbFoQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 05065108006B;
 Mon,  7 Dec 2020 08:40:01 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 8/8] drm/vc4: hdmi: Enable 10/12 bpc output
Date: Mon,  7 Dec 2020 14:39:48 +0100
Message-Id: <20201207133948.2109194-9-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201207133948.2109194-1-maxime@cerno.tech>
References: <20201207133948.2109194-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 08 Dec 2020 08:32:06 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The BCM2711 supports higher bpc count than just 8, so let's support it in
our driver.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c      | 71 ++++++++++++++++++++++++++++-
 drivers/gpu/drm/vc4/vc4_hdmi.h      |  1 +
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h |  9 ++++
 3 files changed, 80 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index e759ebd5fa34..8006bddc8fbb 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -76,6 +76,17 @@
 #define VC5_HDMI_VERTB_VSPO_SHIFT		16
 #define VC5_HDMI_VERTB_VSPO_MASK		VC4_MASK(29, 16)
 
+#define VC5_HDMI_DEEP_COLOR_CONFIG_1_INIT_PACK_PHASE_SHIFT	8
+#define VC5_HDMI_DEEP_COLOR_CONFIG_1_INIT_PACK_PHASE_MASK	VC4_MASK(10, 8)
+
+#define VC5_HDMI_DEEP_COLOR_CONFIG_1_COLOR_DEPTH_SHIFT		0
+#define VC5_HDMI_DEEP_COLOR_CONFIG_1_COLOR_DEPTH_MASK		VC4_MASK(3, 0)
+
+#define VC5_HDMI_GCP_CONFIG_GCP_ENABLE		BIT(31)
+
+#define VC5_HDMI_GCP_WORD_1_GCP_SUBPACKET_BYTE_1_SHIFT	8
+#define VC5_HDMI_GCP_WORD_1_GCP_SUBPACKET_BYTE_1_MASK	VC4_MASK(15, 8)
+
 # define VC4_HD_M_SW_RST			BIT(2)
 # define VC4_HD_M_ENABLE			BIT(0)
 
@@ -179,6 +190,9 @@ static void vc4_hdmi_connector_reset(struct drm_connector *connector)
 
 	kfree(connector->state);
 
+	conn_state->base.max_bpc = 8;
+	conn_state->base.max_requested_bpc = 8;
+
 	__drm_atomic_helper_connector_reset(connector, &conn_state->base);
 
 	if (connector->state)
@@ -228,12 +242,20 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
 				    vc4_hdmi->ddc);
 	drm_connector_helper_add(connector, &vc4_hdmi_connector_helper_funcs);
 
+	/*
+	 * Some of the properties below require access to state, like bpc.
+	 * Allocate some default initial connector state with our reset helper.
+	 */
+	if (connector->funcs->reset)
+		connector->funcs->reset(connector);
+
 	/* Create and attach TV margin props to this connector. */
 	ret = drm_mode_create_tv_margin_properties(dev);
 	if (ret)
 		return ret;
 
 	drm_connector_attach_tv_margin_properties(connector);
+	drm_connector_attach_max_bpc_property(connector, 8, 12);
 
 	connector->polled = (DRM_CONNECTOR_POLL_CONNECT |
 			     DRM_CONNECTOR_POLL_DISCONNECT);
@@ -499,6 +521,7 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi, bool enable)
 }
 
 static void vc4_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
+				 struct drm_connector_state *state,
 				 struct drm_display_mode *mode)
 {
 	bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
@@ -542,7 +565,9 @@ static void vc4_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 	HDMI_WRITE(HDMI_VERTB0, vertb_even);
 	HDMI_WRITE(HDMI_VERTB1, vertb);
 }
+
 static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
+				 struct drm_connector_state *state,
 				 struct drm_display_mode *mode)
 {
 	bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
@@ -562,6 +587,9 @@ static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 					mode->crtc_vsync_end -
 					interlaced,
 					VC4_HDMI_VERTB_VBP));
+	unsigned char gcp;
+	bool gcp_en;
+	u32 reg;
 
 	HDMI_WRITE(HDMI_VEC_INTERFACE_XBAR, 0x354021);
 	HDMI_WRITE(HDMI_HORZA,
@@ -587,6 +615,39 @@ static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 	HDMI_WRITE(HDMI_VERTB0, vertb_even);
 	HDMI_WRITE(HDMI_VERTB1, vertb);
 
+	switch (state->max_bpc) {
+	case 12:
+		gcp = 6;
+		gcp_en = true;
+		break;
+	case 10:
+		gcp = 5;
+		gcp_en = true;
+		break;
+	case 8:
+	default:
+		gcp = 4;
+		gcp_en = false;
+		break;
+	}
+
+	reg = HDMI_READ(HDMI_DEEP_COLOR_CONFIG_1);
+	reg &= ~(VC5_HDMI_DEEP_COLOR_CONFIG_1_INIT_PACK_PHASE_MASK |
+		 VC5_HDMI_DEEP_COLOR_CONFIG_1_COLOR_DEPTH_MASK);
+	reg |= VC4_SET_FIELD(2, VC5_HDMI_DEEP_COLOR_CONFIG_1_INIT_PACK_PHASE) |
+	       VC4_SET_FIELD(gcp, VC5_HDMI_DEEP_COLOR_CONFIG_1_COLOR_DEPTH);
+	HDMI_WRITE(HDMI_DEEP_COLOR_CONFIG_1, reg);
+
+	reg = HDMI_READ(HDMI_GCP_WORD_1);
+	reg &= ~VC5_HDMI_GCP_WORD_1_GCP_SUBPACKET_BYTE_1_MASK;
+	reg |= VC4_SET_FIELD(gcp, VC5_HDMI_GCP_WORD_1_GCP_SUBPACKET_BYTE_1);
+	HDMI_WRITE(HDMI_GCP_WORD_1, reg);
+
+	reg = HDMI_READ(HDMI_GCP_CONFIG);
+	reg &= ~VC5_HDMI_GCP_CONFIG_GCP_ENABLE;
+	reg |= gcp_en ? VC5_HDMI_GCP_CONFIG_GCP_ENABLE : 0;
+	HDMI_WRITE(HDMI_GCP_CONFIG, reg);
+
 	HDMI_WRITE(HDMI_CLOCK_STOP, 0);
 }
 
@@ -724,7 +785,7 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 		   VC4_HDMI_SCHEDULER_CONTROL_IGNORE_VSYNC_PREDICTS);
 
 	if (vc4_hdmi->variant->set_timings)
-		vc4_hdmi->variant->set_timings(vc4_hdmi, mode);
+		vc4_hdmi->variant->set_timings(vc4_hdmi, conn_state, mode);
 }
 
 static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encoder,
@@ -845,6 +906,14 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 		pixel_rate = mode->clock * 1000;
 	}
 
+	if (conn_state->max_bpc == 12) {
+		pixel_rate = pixel_rate * 150;
+		do_div(pixel_rate, 100);
+	} else if (conn_state->max_bpc == 10) {
+		pixel_rate = pixel_rate * 125;
+		do_div(pixel_rate, 100);
+	}
+
 	if (pixel_rate > vc4_hdmi->variant->max_pixel_clock)
 		return -EINVAL;
 
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 6cc5b6652cca..720914761261 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -77,6 +77,7 @@ struct vc4_hdmi_variant {
 
 	/* Callback to configure the video timings in the HDMI block */
 	void (*set_timings)(struct vc4_hdmi *vc4_hdmi,
+			    struct drm_connector_state *state,
 			    struct drm_display_mode *mode);
 
 	/* Callback to initialize the PHY according to the mode */
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h b/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
index 7c6b4818f245..013fd57febd8 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
@@ -59,9 +59,12 @@ enum vc4_hdmi_field {
 	 */
 	HDMI_CTS_0,
 	HDMI_CTS_1,
+	HDMI_DEEP_COLOR_CONFIG_1,
 	HDMI_DVP_CTL,
 	HDMI_FIFO_CTL,
 	HDMI_FRAME_COUNT,
+	HDMI_GCP_CONFIG,
+	HDMI_GCP_WORD_1,
 	HDMI_HORZA,
 	HDMI_HORZB,
 	HDMI_HOTPLUG,
@@ -229,6 +232,9 @@ static const struct vc4_hdmi_register vc5_hdmi_hdmi0_fields[] = {
 	VC4_HDMI_REG(HDMI_VERTB1, 0x0f8),
 	VC4_HDMI_REG(HDMI_MAI_CHANNEL_MAP, 0x09c),
 	VC4_HDMI_REG(HDMI_MAI_CONFIG, 0x0a0),
+	VC4_HDMI_REG(HDMI_DEEP_COLOR_CONFIG_1, 0x170),
+	VC4_HDMI_REG(HDMI_GCP_CONFIG, 0x178),
+	VC4_HDMI_REG(HDMI_GCP_WORD_1, 0x17c),
 	VC4_HDMI_REG(HDMI_HOTPLUG, 0x1a8),
 
 	VC5_DVP_REG(HDMI_CLOCK_STOP, 0x0bc),
@@ -305,6 +311,9 @@ static const struct vc4_hdmi_register vc5_hdmi_hdmi1_fields[] = {
 	VC4_HDMI_REG(HDMI_VERTB1, 0x0f8),
 	VC4_HDMI_REG(HDMI_MAI_CHANNEL_MAP, 0x09c),
 	VC4_HDMI_REG(HDMI_MAI_CONFIG, 0x0a0),
+	VC4_HDMI_REG(HDMI_DEEP_COLOR_CONFIG_1, 0x170),
+	VC4_HDMI_REG(HDMI_GCP_CONFIG, 0x178),
+	VC4_HDMI_REG(HDMI_GCP_WORD_1, 0x17c),
 	VC4_HDMI_REG(HDMI_HOTPLUG, 0x1a8),
 
 	VC5_DVP_REG(HDMI_CLOCK_STOP, 0x0bc),
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
