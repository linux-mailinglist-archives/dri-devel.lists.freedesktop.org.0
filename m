Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B24EE2CB6CF
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 09:21:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 077E26EA42;
	Wed,  2 Dec 2020 08:20:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCC506E544
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 13:13:01 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 347EF5805BC;
 Tue,  1 Dec 2020 08:13:01 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 01 Dec 2020 08:13:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=gjirH4tCkOMp3
 2nOf7b6jHsguy0OwGB4w7Pts1s2yUo=; b=bCqLvx6/TYNLN9xTgv8/5i2uRxzZ4
 096e6nHj+nJpcgV2WRqR6hKYRtO6pgAijZXJRqxXFtslHk9Na5GnMZmL6QI7sJDR
 7PvQIGEAEqtVdrKfYh15HZSm2vNY/yBZ0BDJMDc+HiG/lxL/wfJ9eoPadC6qCbRO
 thJBzPc17rU2DHe+s08vdBI+96oGCENev04pgMrWFDarFZN2zaLWX79T6wDnhBkS
 EOSZNFsGrvsT8hAtNSC125n9XY/C6qJRb1R3lP8iyJaatKNM5Iy0gXAD9xt6Qrx7
 ietmuJMhLEsafIwkzwKA5Vca4XVSQgIGBCNHDOpn1TZFTrnAzI9q24rlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=gjirH4tCkOMp32nOf7b6jHsguy0OwGB4w7Pts1s2yUo=; b=NrAFCyLK
 46an0wjqom9WpX6UzD4F2v+aR16f/uvPAzw5UKckCZkJRbUaodHy+9+UHSsNA7d7
 SquYYHHqXjUUJn8P3os7MWSDJh0tZtwOZytHMo1lUaHnwGxgZJKBbY8/m3if+hcD
 fLaMLoOarsneFF8/Pl+17mo7SXtpUrIwrvuZW4PTgqBRpOlqEiVMr6DC6JcSaosr
 8mEqv5ZkZg42KEl+IaJlH8J+dqZfGyBFsFbU1z2jAsw29FnxAIWjfesJhIXDkT1X
 2vISgYp4no2pnAdD4Pgj71cKdG+Kid8C0G5u7BQfXUeqOfQ+V56mzMqsVcYcSWlT
 F5vtbnZPxHALoQ==
X-ME-Sender: <xms:XEHGX9mx-zPLI5J9rv7jwhL8qaaUSxfEh5fdPvkQB9ClVT2MJr7cuA>
 <xme:XEHGX43L9a1zwraBT9RB4hBbfOTGafvFqPS7PjhcnbpwA6GCrXAuQTdnIvuM8ihiI
 O9Kd2ziVFWsDVxdaA0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeivddgheduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:XEHGXzqx5Mmjas_Shpc9XrqGeHLZJclgQl2PQUn2Zw3XSKPATiviEQ>
 <xmx:XEHGX9n99F_wePVfigSp_Ws6J5AvG2ZcOn9Tume7rg-ZSl6U35O8dA>
 <xmx:XEHGX73PsGUdK7QZThCcB3bM8r6kDrudcAE_hb310INEWOKIbqA85A>
 <xmx:XUHGX0JcalIqK9lNCOckUuxl1q3LfJOHckHyaGgJ8mAOnJn7ak0Cyw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9DB661080067;
 Tue,  1 Dec 2020 08:13:00 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 7/7] drm/vc4: hdmi: Enable 10/12 bpc output
Date: Tue,  1 Dec 2020 14:12:49 +0100
Message-Id: <20201201131249.438273-8-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201201131249.438273-1-maxime@cerno.tech>
References: <20201201131249.438273-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 02 Dec 2020 08:19:47 +0000
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
Cc: linux-rpi-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
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
index b5a97931af30..47768f582261 100644
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
 	drm_atomic_helper_connector_tv_reset(connector);
 }
@@ -226,12 +240,20 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
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
@@ -497,6 +519,7 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi, bool enable)
 }
 
 static void vc4_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
+				 struct drm_connector_state *state,
 				 struct drm_display_mode *mode)
 {
 	bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
@@ -540,7 +563,9 @@ static void vc4_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 	HDMI_WRITE(HDMI_VERTB0, vertb_even);
 	HDMI_WRITE(HDMI_VERTB1, vertb);
 }
+
 static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
+				 struct drm_connector_state *state,
 				 struct drm_display_mode *mode)
 {
 	bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
@@ -560,6 +585,9 @@ static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 					mode->crtc_vsync_end -
 					interlaced,
 					VC4_HDMI_VERTB_VBP));
+	unsigned char gcp;
+	bool gcp_en;
+	u32 reg;
 
 	HDMI_WRITE(HDMI_VEC_INTERFACE_XBAR, 0x354021);
 	HDMI_WRITE(HDMI_HORZA,
@@ -585,6 +613,39 @@ static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
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
 
@@ -722,7 +783,7 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 		   VC4_HDMI_SCHEDULER_CONTROL_IGNORE_VSYNC_PREDICTS);
 
 	if (vc4_hdmi->variant->set_timings)
-		vc4_hdmi->variant->set_timings(vc4_hdmi, mode);
+		vc4_hdmi->variant->set_timings(vc4_hdmi, conn_state, mode);
 }
 
 static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encoder,
@@ -843,6 +904,14 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
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
