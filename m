Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAA627812B
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 09:09:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5199F6EC12;
	Fri, 25 Sep 2020 07:09:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44DAC6EB3F
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 15:31:14 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 257F3E09;
 Thu, 24 Sep 2020 11:31:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 24 Sep 2020 11:31:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=8pE2R5Fiw7TEd
 3DnL1qSJEEFtVj1nXtqKhSdwKb2YR0=; b=MNJTKirhjwGMnBMdcUPI3cy1qnjTh
 uyiTwJAN2L4JvvLAEOD6E8trj3PwndOZhwXco0iahbaIFuCQFxJxCkPkHfgDv5qd
 8ZdJRJbSMvIa7MduHgFmmrfhURd7zrBg4o1HwNyqgp9WmxlIEerrNd/ugT134IFE
 +3E4IjQFMirTAvrMVenZip5VWLyAXl/n+9pc5dQAD3OEz0ea92vwTAawaKMzOmWK
 Rg+ai1xbpSK8/6OpaWZYAYntrN4wopiqDC2/kZEpHIGlaMIfSWK8QgNfLSH/YaKU
 X9uToHOguET2q0/Mqz41A7ZMmcSqTpx4d+uhgM49tkuIr2+8AMWuj82UA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=8pE2R5Fiw7TEd3DnL1qSJEEFtVj1nXtqKhSdwKb2YR0=; b=Q8XuIT59
 RGTUe1eyiXECxxVW/1Nq9h+YGFoEJEnRDIu2oINVxrTGvF9MlbWEuFlMMu1WANDC
 hRWf0wr4UYGruoQOwyUYyQvTUxnHXI+ZHTSzgAzWEhjNSgF3Qk7kWhkIYPjpby3f
 gttZoTSxMBDACotBVDPmNEoQaCpLNI3Cewv7Uwn5+usYUbGBMkTYVRwROXLEgMVb
 wwOajvcr1xUDfJKFcFH86rAEgvQXrKFKADjN6Hlkt9ADr/LkpXXY2k7YXEHJDy78
 YVDNdYnvlJ53kumpOkzQadcVpwUNNFvlaqfidSbBefksXbCVPYGLPpTMOLUwni7e
 Wrgm9KfCO0Vgcw==
X-ME-Sender: <xms:wLtsX3pIJ-tpKX-aSOf0cCtCLrx0E6V0-mGw5CfvuskFivv8dw898g>
 <xme:wLtsXxqURU8rIMxN-vg1q1z4qrRFCTC1K9EKU5pwLdFhI_ljTtK042lIQrb1G67CM
 teugZuVML8AFn7UkX4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudekgdeltdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpeegnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:wLtsX0PDB0-mGJCEl-6LqwJ5gRZn2RErssZtcGNRP-XsLplDyqAVdA>
 <xmx:wLtsX67BYwD6ytjHKBorqXbWRCxcVTUSnu-JEqW1RguUGHtWTlnYww>
 <xmx:wLtsX26PJ3czxeQ8_sToyjmckB4Ny827IiDVsodqO90yIv9XvCLzBw>
 <xmx:wLtsXzzZaF5BMY2zzbIaKQwlKn6AxNi1aqrfDrOJ0g_7Ykez8uHGDe3xUEk>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 55FAE3280065;
 Thu, 24 Sep 2020 11:31:12 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH 6/6] drm/vc4: hdmi: Enable 10/12 bpc output
Date: Thu, 24 Sep 2020 17:31:01 +0200
Message-Id: <2ffc66ac87e69829037033db7c16741b75efddcd.1600961400.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.0400f261220da59b7ef16523e267aeaa5e06b648.1600961400.git-series.maxime@cerno.tech>
References: <cover.0400f261220da59b7ef16523e267aeaa5e06b648.1600961400.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 25 Sep 2020 07:09:24 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The BCM2711 supports higher bpc count than just 8, so let's support it in
our driver.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c      | 68 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/vc4/vc4_hdmi.h      |  1 +-
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h |  9 ++++-
 3 files changed, 77 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 21d20c8494e8..1c4dc774d56e 100644
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
 
@@ -177,6 +188,9 @@ static void vc4_hdmi_connector_reset(struct drm_connector *connector)
 
 	kfree(connector->state);
 
+	conn_state->base.max_bpc = 8;
+	conn_state->base.max_requested_bpc = 8;
+
 	__drm_atomic_helper_connector_reset(connector, &conn_state->base);
 	drm_atomic_helper_connector_tv_reset(connector);
 }
@@ -224,12 +238,20 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
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
+	drm_connector_attach_max_bpc_property(connector, 8, 16);
 
 	connector->polled = (DRM_CONNECTOR_POLL_CONNECT |
 			     DRM_CONNECTOR_POLL_DISCONNECT);
@@ -495,6 +517,7 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi, bool enable)
 }
 
 static void vc4_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
+				 struct drm_connector_state *state,
 				 struct drm_display_mode *mode)
 {
 	bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
@@ -538,7 +561,9 @@ static void vc4_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 	HDMI_WRITE(HDMI_VERTB0, vertb_even);
 	HDMI_WRITE(HDMI_VERTB1, vertb);
 }
+
 static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
+				 struct drm_connector_state *state,
 				 struct drm_display_mode *mode)
 {
 	bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
@@ -558,6 +583,9 @@ static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 					mode->crtc_vsync_end -
 					interlaced,
 					VC4_HDMI_VERTB_VBP));
+	unsigned char gcp;
+	bool gcp_en;
+	u32 reg;
 
 	HDMI_WRITE(HDMI_VEC_INTERFACE_XBAR, 0x354021);
 	HDMI_WRITE(HDMI_HORZA,
@@ -583,6 +611,39 @@ static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
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
 
@@ -720,7 +781,7 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 		   VC4_HDMI_SCHEDULER_CONTROL_IGNORE_VSYNC_PREDICTS);
 
 	if (vc4_hdmi->variant->set_timings)
-		vc4_hdmi->variant->set_timings(vc4_hdmi, mode);
+		vc4_hdmi->variant->set_timings(vc4_hdmi, conn_state, mode);
 }
 
 static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encoder,
@@ -821,6 +882,11 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
 		pixel_rate *= 2;
 
+	if (conn_state->max_bpc == 12)
+		pixel_rate *= 150 / 100;
+	else if (conn_state->max_bpc == 10)
+		pixel_rate *= 125 / 100;
+
 	if (pixel_rate > vc4_hdmi->variant->max_pixel_clock)
 		return -EINVAL;
 
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index dbe2393ae043..af45b0d81dec 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -75,6 +75,7 @@ struct vc4_hdmi_variant {
 
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
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
