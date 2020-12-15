Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4CC2DBD25
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 09:56:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 339AA6E0CB;
	Wed, 16 Dec 2020 08:56:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED0216E409
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 15:42:59 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id EBEE7762;
 Tue, 15 Dec 2020 10:42:58 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 15 Dec 2020 10:42:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=IZ4lvMzcau9uk
 wpPLt+uXwSOzZYau7NYcmgLaj3RRwk=; b=Z0e6xszQnevNY0NCzLZBYoGqBAc0F
 1BUMZcrpYpIG+UtO09G6ZXjfans4cDmoFRwto5yk03jEI36MY0Li80A1Vkbzb83p
 AHbAqC+DV2kX9GZmZKlN0V0EopUs8+1Lu6XNARjQYKLqSzeLGcIKQaO0SEcQfEvj
 s8etHe6zRXZyWh2ip9pV72gIVZW9U1BixS8qdfwXWP9jX0iHMgBcMQA8aftWBwea
 dEIC83DcH9CIg8r3zH43RHOoqxDnmlbjrkQ6bpjmHLrFMU/nqdOghBDsQsuR66Py
 Besq9LTFQSNo/yDO6DS2h3tEXoE488SUULD2D05W9C03zHbtLB2mqrh7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=IZ4lvMzcau9ukwpPLt+uXwSOzZYau7NYcmgLaj3RRwk=; b=fu+/mvAE
 QjBzit1AtFx8PhUncxfEPvX1gTFouVHtkxFZrqqSLRgaqFyUf7IeI5QndVpCneHG
 8rCscGC/cpedh2y95/JJ3Kz17kZrSsrq8K9T2+33dbl9aP3B12IbJdvbmqH/zLVi
 NzZBZMDCUBMyHSRcmJeVxg3i/cng9GkXz9zItvw8zZBSJNTDELRPHyhAbn/x/oeB
 cW4nnHcEDFc7SyLx0e5K1tzgXWbfPmg2H21UPqdh6hYmofBt5g00U2VSk1ExWE0S
 LcXzdj66k9woyKAbE4KPvTf+Uar7k8AIVpxLav5D1CuWjuSHWSVZUw41jrNW5uej
 FdFx6i7ymc/nJg==
X-ME-Sender: <xms:gtnYX-4qRJLGfulYxn31Xyr8Xavv-R83A2XIX3CS9S1qw8ulhJRw_Q>
 <xme:gtnYX3439sQ_i7L6Zn4leRQTGGb3vXAq80tGiHrz3HFDQ0Uv4NEH2JTGYGlnmccdw
 CG74DT0Wrsg9Y2R2zQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeltddgkeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepgeenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:gtnYX9csOXaCVZ_xi-Rrg9ekavhdhOFa3CvieD024am80qCceYbxsQ>
 <xmx:gtnYX7KtuMFwzYhLxsyarIPDy0-Q-MORrW_LijEHZzUZ4ZktHIr8pQ>
 <xmx:gtnYXyKlCyBwdoDu8IJEGfGG3OLsaNyKsJqHgdFJlbr0GdVkRsr9Jg>
 <xmx:gtnYXx_5-J_2jBxqq-mGSZnjaM63TXx5zwoYpgl-AYvB4s2OHluSgSqGvLE>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1C0BA240065;
 Tue, 15 Dec 2020 10:42:58 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v7 9/9] drm/vc4: hdmi: Enable 10/12 bpc output
Date: Tue, 15 Dec 2020 16:42:43 +0100
Message-Id: <20201215154243.540115-10-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201215154243.540115-1-maxime@cerno.tech>
References: <20201215154243.540115-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 16 Dec 2020 08:55:47 +0000
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
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The BCM2711 supports higher bpc count than just 8, so let's support it in
our driver.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c      | 70 ++++++++++++++++++++++++++++-
 drivers/gpu/drm/vc4/vc4_hdmi.h      |  1 +
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h |  9 ++++
 3 files changed, 79 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 41897b8e9d51..2e5449b25ce4 100644
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
 
@@ -186,6 +197,8 @@ static void vc4_hdmi_connector_reset(struct drm_connector *connector)
 	if (!new_state)
 		return;
 
+	new_state->base.max_bpc = 8;
+	new_state->base.max_requested_bpc = 8;
 	drm_atomic_helper_connector_tv_reset(connector);
 }
 
@@ -232,12 +245,20 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
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
@@ -506,6 +527,7 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi, bool enable)
 }
 
 static void vc4_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
+				 struct drm_connector_state *state,
 				 struct drm_display_mode *mode)
 {
 	bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
@@ -549,7 +571,9 @@ static void vc4_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 	HDMI_WRITE(HDMI_VERTB0, vertb_even);
 	HDMI_WRITE(HDMI_VERTB1, vertb);
 }
+
 static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
+				 struct drm_connector_state *state,
 				 struct drm_display_mode *mode)
 {
 	bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
@@ -569,6 +593,9 @@ static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 					mode->crtc_vsync_end -
 					interlaced,
 					VC4_HDMI_VERTB_VBP));
+	unsigned char gcp;
+	bool gcp_en;
+	u32 reg;
 
 	HDMI_WRITE(HDMI_VEC_INTERFACE_XBAR, 0x354021);
 	HDMI_WRITE(HDMI_HORZA,
@@ -594,6 +621,39 @@ static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
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
 
@@ -731,7 +791,7 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 		   VC4_HDMI_SCHEDULER_CONTROL_IGNORE_VSYNC_PREDICTS);
 
 	if (vc4_hdmi->variant->set_timings)
-		vc4_hdmi->variant->set_timings(vc4_hdmi, mode);
+		vc4_hdmi->variant->set_timings(vc4_hdmi, conn_state, mode);
 }
 
 static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encoder,
@@ -852,6 +912,14 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
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
 	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
 		pixel_rate = pixel_rate * 2;
 
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 60c53d7c9bad..4c8994cfd932 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -77,6 +77,7 @@ struct vc4_hdmi_variant {
 
 	/* Callback to configure the video timings in the HDMI block */
 	void (*set_timings)(struct vc4_hdmi *vc4_hdmi,
+			    struct drm_connector_state *state,
 			    struct drm_display_mode *mode);
 
 	/* Callback to initialize the PHY according to the connector state */
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h b/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
index 96d764ebfe67..401863cb8c98 100644
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
@@ -229,6 +232,9 @@ static const struct vc4_hdmi_register __maybe_unused vc5_hdmi_hdmi0_fields[] = {
 	VC4_HDMI_REG(HDMI_VERTB1, 0x0f8),
 	VC4_HDMI_REG(HDMI_MAI_CHANNEL_MAP, 0x09c),
 	VC4_HDMI_REG(HDMI_MAI_CONFIG, 0x0a0),
+	VC4_HDMI_REG(HDMI_DEEP_COLOR_CONFIG_1, 0x170),
+	VC4_HDMI_REG(HDMI_GCP_CONFIG, 0x178),
+	VC4_HDMI_REG(HDMI_GCP_WORD_1, 0x17c),
 	VC4_HDMI_REG(HDMI_HOTPLUG, 0x1a8),
 
 	VC5_DVP_REG(HDMI_CLOCK_STOP, 0x0bc),
@@ -305,6 +311,9 @@ static const struct vc4_hdmi_register __maybe_unused vc5_hdmi_hdmi1_fields[] = {
 	VC4_HDMI_REG(HDMI_VERTB1, 0x0f8),
 	VC4_HDMI_REG(HDMI_MAI_CHANNEL_MAP, 0x09c),
 	VC4_HDMI_REG(HDMI_MAI_CONFIG, 0x0a0),
+	VC4_HDMI_REG(HDMI_DEEP_COLOR_CONFIG_1, 0x170),
+	VC4_HDMI_REG(HDMI_GCP_CONFIG, 0x178),
+	VC4_HDMI_REG(HDMI_GCP_WORD_1, 0x17c),
 	VC4_HDMI_REG(HDMI_HOTPLUG, 0x1a8),
 
 	VC5_DVP_REG(HDMI_CLOCK_STOP, 0x0bc),
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
