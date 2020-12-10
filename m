Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BBB2D5E77
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 15:49:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B573D6EA95;
	Thu, 10 Dec 2020 14:48:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B97C6EA32
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 14:23:44 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 644DD409;
 Thu, 10 Dec 2020 09:23:43 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 10 Dec 2020 09:23:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=X0Wo/XUUhxtBw
 elcx2S79x8rBRUwa+RFxWRLLJWyfZ0=; b=qGus4EieNeU4ct5905Ue0zfRRfZ11
 s0LLQcsSU7b+LVLr5m6RrSwlZkadJSywDmGoeQcHYO9oLaaIOhqCXz9Ynp/RkQ7o
 +/a+vI23MFtxjyAI3EDWYCm1qyZg5lq5WtJyduCATHL7BAo7wBjT4u5ba8wlE23t
 y37D6WO8152br5OSuG7MiOU2wK88+WN9Bl5MXwrFl4at5MldSr/GRsi8et8gJ1iB
 dgB9qAScLJZvQrV8IC8hd9Gyc9SyY+6ATpmlcf/jdxDMNqAUUdXST3i/cZYG8Ash
 QG5+EJRqztG7J2pRAeebDafs2Mg1S3cpgvRwnL2rN8vACzT6wY7T5Mf6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=X0Wo/XUUhxtBwelcx2S79x8rBRUwa+RFxWRLLJWyfZ0=; b=GFVzkmsN
 xLTJIQ8Ft1jX8BO6tdjdKfotbfHSNsbLJhvi4LDC8Avnxqm2DQ4AgtPbwQii4Mxm
 16JeyEnoUqcXhQEJE2x8WHVSzbwkdm4oloLSO1SCLn7HHH5G0om0YHPkOI7KZdRH
 4ioUkGqFm4bQLLTzg5Ka6Si8GaX/IIeDwVP0J2iWsUEgCbLQT36pnJ39cWvuoV9Z
 VuzBVQ6dwiV2kVhHx8uURurFAZZB+i6qsrM5K3uqTrJJGs6hxyRSpYR8jW7NU7c7
 rdE5nC13g5HMO/guDeqcVPwA4KqYVktN8GYnnTjS8JqIlO27ftSm40Nc8h7mInaa
 Gue/you8yGjCtA==
X-ME-Sender: <xms:bi_SXwxY69tQoYk-oz3fu10LPKwMoBv006CyYqCDM8-uDfE045Kc6w>
 <xme:bi_SX9t6oFTf2HVCvJmhwnFvwPmd8QJbsAlNpYPSInH0HNIsoulDzKBV8vg-5PI_g
 9kGWt9IWm4hMin3Tm8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudektddgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepgeenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:bi_SXx5fL7Hfb14nJn512hl8kl4ZXojSpOdzEqVxDt73d8DsZthaJw>
 <xmx:bi_SX0SHMzxuIW8kKee3AUHsreLr6rV0uwbGoy6WAFF--3zDFSJUGg>
 <xmx:bi_SX4qWVLPCIsNF1pomWVLp2CReO6eaT1em6nbH1zFAdotoxRKXVw>
 <xmx:by_SX5Y_G3g5Z5hFBvcjTMYdIsWAKhKkp16hWdU-D3EK2qhIVVdOU9TtE-0>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id A2E2624005B;
 Thu, 10 Dec 2020 09:23:42 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v6 9/9] drm/vc4: hdmi: Enable 10/12 bpc output
Date: Thu, 10 Dec 2020 15:23:29 +0100
Message-Id: <20201210142329.10640-10-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201210142329.10640-1-maxime@cerno.tech>
References: <20201210142329.10640-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 10 Dec 2020 14:48:10 +0000
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
 drivers/gpu/drm/vc4/vc4_hdmi.c      | 71 ++++++++++++++++++++++++++++-
 drivers/gpu/drm/vc4/vc4_hdmi.h      |  1 +
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h |  9 ++++
 3 files changed, 80 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 996c727278fb..e9796120e991 100644
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
 
@@ -185,6 +196,9 @@ static void vc4_hdmi_connector_reset(struct drm_connector *connector)
 	if (!new_state)
 		return;
 
+	new_state->base.max_bpc = 8;
+	new_state->base.max_requested_bpc = 8;
+
 	__drm_atomic_helper_connector_reset(connector, &new_state->base);
 	drm_atomic_helper_connector_tv_reset(connector);
 }
@@ -232,12 +246,20 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
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
@@ -503,6 +525,7 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi, bool enable)
 }
 
 static void vc4_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
+				 struct drm_connector_state *state,
 				 struct drm_display_mode *mode)
 {
 	bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
@@ -546,7 +569,9 @@ static void vc4_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 	HDMI_WRITE(HDMI_VERTB0, vertb_even);
 	HDMI_WRITE(HDMI_VERTB1, vertb);
 }
+
 static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
+				 struct drm_connector_state *state,
 				 struct drm_display_mode *mode)
 {
 	bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
@@ -566,6 +591,9 @@ static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 					mode->crtc_vsync_end -
 					interlaced,
 					VC4_HDMI_VERTB_VBP));
+	unsigned char gcp;
+	bool gcp_en;
+	u32 reg;
 
 	HDMI_WRITE(HDMI_VEC_INTERFACE_XBAR, 0x354021);
 	HDMI_WRITE(HDMI_HORZA,
@@ -591,6 +619,39 @@ static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
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
 
@@ -728,7 +789,7 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 		   VC4_HDMI_SCHEDULER_CONTROL_IGNORE_VSYNC_PREDICTS);
 
 	if (vc4_hdmi->variant->set_timings)
-		vc4_hdmi->variant->set_timings(vc4_hdmi, mode);
+		vc4_hdmi->variant->set_timings(vc4_hdmi, conn_state, mode);
 }
 
 static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encoder,
@@ -849,6 +910,14 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
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
