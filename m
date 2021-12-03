Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DE04675B4
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 11:54:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6039D73387;
	Fri,  3 Dec 2021 10:54:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB6F73387
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 10:54:44 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id DDA115801B5;
 Fri,  3 Dec 2021 05:54:43 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 03 Dec 2021 05:54:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=papnQLN6kuKJh
 GVlBpWhtZ/bEI61Bangn/0IZ9/SwkY=; b=k/QWXH0eVM9TY42Gqpglr6DTV9V4l
 DtEEEe+NBqBiW+zUZQF0oYasz68+G4aQ1OP0zjy20s5+f1XWCJ3Dc0M06iF+TKD9
 JYWvBv0pgDLuWThh99HQI+JqJjLTcHvqZEWhdx2vMtPMB4HbotgOcT1r1APVoExo
 cJAPLAFbzUnlI6fNa7iLks6CvACjmX7c/IgpuFoQWwTwUNapiyxXa9CdYPqNSmmu
 TK7SJo+1Jngr6gdAyAHGewyd6RWhStlG/UlsNqd0kWQZjo4SqSYa2yDbvsvc3Zf6
 +n8HhP4Sykzm2oMNhFHtKsUCNWsdh9vv92PNwrOIKMQgo5A4xhPFQDTug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=papnQLN6kuKJhGVlBpWhtZ/bEI61Bangn/0IZ9/SwkY=; b=EYaOBgIx
 /Zy47Kj08Wp+208cmYL39iB40Jeuo0liL+NHFnYwyQPlorocz2rPpU02L2uDaYIG
 m4eC8vh8dIagbUiWvV5wB3DrToGB7NdqZQJHxc1c0bMY9ray78iJy1mth8simPDB
 3ShUVgNMLb/bv3KxeuqAyd+yTEoh4GXsC3w52wski4sD/PeelcBFhODwVDjak3ha
 ZAe+BhG+VG7unfJM8H8OYWq3CfaAi4FlmbaadWaXVIogGhe7K+Zq08USaLrKN1q5
 DCb6DaL7hgxLAo8hrE+AUS6jqEU0J7i5bNy227rNRjph1H6/S3D/t3ei/oNkiBTI
 Vvl9L2bAtQ5VNg==
X-ME-Sender: <xms:c_epYUCdkcYLdWKk_-_cfvL4C_6txeZlyi5SMLsIu8sKImwscLCY7Q>
 <xme:c_epYWiQPR4XXLhl12CrGRVCE4qqjc0410jpfBAIDI3OkcYFhn-Aupd0p9iyoxDip
 sPycJTNW3YnNH8b1Sk>
X-ME-Received: <xmr:c_epYXlENHdmi6ZgMrnxPOVLr1ua9QcNVgWxWJWyb-s-Eb7ypVF0ttsNSskprxI_GukO7cfRGkIrxshs-Jxu3X2wzb5jIUej0BOIoYJm3vRqjw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrieejgddvvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:c_epYaxJNQmSMVTc8xBCS8zaO9FyldN8nSzgu-0XGTdx0CcEmZAOmg>
 <xmx:c_epYZSqtBotnJvhM4NGAs573neVsSNnVzg5jezVzKy4pZC6jCmw6g>
 <xmx:c_epYVY1hMn44QWJ4uV8TrQMdBrfOTm1v6MSUA2whS1pdx8HCbhpsA>
 <xmx:c_epYW8tIMAegJijd9B7111AFjjQFOPDZek1cWJ0fgb3JG9Gbr7t6Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Dec 2021 05:54:43 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 10/11] drm/vc4: hdmi: Support HDMI YUV output
Date: Fri,  3 Dec 2021 11:54:19 +0100
Message-Id: <20211203105420.573494-11-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211203105420.573494-1-maxime@cerno.tech>
References: <20211203105420.573494-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Werner Sembach <wse@tuxedocomputers.com>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In addition to the RGB444 output, the BCM2711 HDMI controller supports
the YUV444 and YUV422 output formats.

Let's add support for them in the driver, but still use RGB as the
preferred format.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c      | 133 +++++++++++++++++++++++++---
 drivers/gpu/drm/vc4/vc4_hdmi.h      |   8 ++
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h |   6 ++
 drivers/gpu/drm/vc4/vc4_regs.h      |  16 ++++
 4 files changed, 153 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 3d649fbc480a..04eb1ab9dad3 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -329,6 +329,7 @@ static void vc4_hdmi_connector_reset(struct drm_connector *connector)
 
 	new_state->base.max_bpc = 8;
 	new_state->base.max_requested_bpc = 8;
+	new_state->output_format = VC4_HDMI_OUTPUT_RGB;
 	drm_atomic_helper_connector_tv_reset(connector);
 }
 
@@ -344,6 +345,7 @@ vc4_hdmi_connector_duplicate_state(struct drm_connector *connector)
 		return NULL;
 
 	new_state->pixel_rate = vc4_state->pixel_rate;
+	new_state->output_format = vc4_state->output_format;
 	__drm_atomic_helper_connector_duplicate_state(connector, &new_state->base);
 
 	return &new_state->base;
@@ -487,11 +489,32 @@ static void vc4_hdmi_write_infoframe(struct drm_encoder *encoder,
 		DRM_ERROR("Failed to wait for infoframe to start: %d\n", ret);
 }
 
+static void vc4_hdmi_avi_infoframe_colorspace(struct hdmi_avi_infoframe *frame,
+					      enum vc4_hdmi_output_format fmt)
+{
+	switch (fmt) {
+	case VC4_HDMI_OUTPUT_RGB:
+		fallthrough;
+	case VC4_HDMI_OUTPUT_YUV420:
+		fallthrough;
+	case VC4_HDMI_OUTPUT_YUV422:
+		fallthrough;
+	case VC4_HDMI_OUTPUT_YUV444:
+		frame->colorspace = fmt;
+		break;
+
+	default:
+		break;
+	}
+}
+
 static void vc4_hdmi_set_avi_infoframe(struct drm_encoder *encoder)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	struct drm_connector *connector = &vc4_hdmi->connector;
 	struct drm_connector_state *cstate = connector->state;
+	struct vc4_hdmi_connector_state *vc4_state =
+		conn_state_to_vc4_hdmi_conn_state(cstate);
 	const struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
 	union hdmi_infoframe frame;
 	int ret;
@@ -511,6 +534,7 @@ static void vc4_hdmi_set_avi_infoframe(struct drm_encoder *encoder)
 					   HDMI_QUANTIZATION_RANGE_FULL :
 					   HDMI_QUANTIZATION_RANGE_LIMITED);
 	drm_hdmi_avi_infoframe_colorimetry(&frame.avi, cstate);
+	vc4_hdmi_avi_infoframe_colorspace(&frame.avi, vc4_state->output_format);
 	drm_hdmi_avi_infoframe_bars(&frame.avi, cstate);
 
 	vc4_hdmi_write_infoframe(encoder, &frame);
@@ -809,6 +833,38 @@ static const u16 vc5_hdmi_csc_full_rgb_to_limited_rgb[3][4] = {
 	{ 0x0000, 0x0000, 0x1b80, 0x0400 },
 };
 
+/*
+ * Conversion between Full Range RGB and Full Range YUV422 using the
+ * BT.709 Colorspace
+ *
+ * [  0.212639  0.715169  0.072192  0   ]
+ * [ -0.117208 -0.394207  0.511416  128 ]
+ * [  0.511416 -0.464524 -0.046891  128 ]
+ *
+ * Matrix is signed 2p13 fixed point, with signed 9p6 offsets
+ */
+static const u16 vc5_hdmi_csc_full_rgb_to_full_yuv422_bt709[3][4] = {
+	{ 0x06ce, 0x16e3, 0x024f, 0x0000 },
+	{ 0xfc41, 0xf364, 0x105e, 0x2000 },
+	{ 0x105e, 0xf124, 0xfe81, 0x2000 },
+};
+
+/*
+ * Conversion between Full Range RGB and Full Range YUV444 using the
+ * BT.709 Colorspace
+ *
+ * [ -0.117208 -0.394207  0.511416  128 ]
+ * [  0.511416 -0.464524 -0.046891  128 ]
+ * [  0.212639  0.715169  0.072192  0   ]
+ *
+ * Matrix is signed 2p13 fixed point, with signed 9p6 offsets
+ */
+static const u16 vc5_hdmi_csc_full_rgb_to_full_yuv444_bt709[3][4] = {
+	{ 0xfc41, 0xf364, 0x105e, 0x2000 },
+	{ 0x105e, 0xf124, 0xfe81, 0x2000 },
+	{ 0x06ce, 0x16e3, 0x024f, 0x0000 },
+};
+
 static void vc5_hdmi_set_csc_coeffs(struct vc4_hdmi *vc4_hdmi,
 				    const u16 coeffs[3][4])
 {
@@ -826,19 +882,53 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 			       struct drm_connector_state *state,
 			       const struct drm_display_mode *mode)
 {
+	struct vc4_hdmi_connector_state *vc4_state =
+		conn_state_to_vc4_hdmi_conn_state(state);
 	unsigned long flags;
+	u32 if_cfg = 0;
+	u32 if_xbar = 0x543210;
+	u32 csc_chan_ctl = 0;
 	u32 csc_ctl = VC5_MT_CP_CSC_CTL_ENABLE | VC4_SET_FIELD(VC4_HD_CSC_CTL_MODE_CUSTOM,
 							       VC5_MT_CP_CSC_CTL_MODE);
 
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 
-	HDMI_WRITE(HDMI_VEC_INTERFACE_XBAR, 0x354021);
+	switch (vc4_state->output_format) {
+	case VC4_HDMI_OUTPUT_YUV444:
+		vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_to_full_yuv444_bt709);
+		break;
 
-	if (!vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode))
-		vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_to_limited_rgb);
-	else
-		vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_unity);
+	case VC4_HDMI_OUTPUT_YUV422:
+		csc_ctl |= VC4_SET_FIELD(VC5_MT_CP_CSC_CTL_FILTER_MODE_444_TO_422_STANDARD,
+					 VC5_MT_CP_CSC_CTL_FILTER_MODE_444_TO_422) |
+			VC5_MT_CP_CSC_CTL_USE_444_TO_422 |
+			VC5_MT_CP_CSC_CTL_USE_RNG_SUPPRESSION;
 
+		csc_chan_ctl |= VC4_SET_FIELD(VC5_MT_CP_CHANNEL_CTL_OUTPUT_REMAP_LEGACY_STYLE,
+					      VC5_MT_CP_CHANNEL_CTL_OUTPUT_REMAP);
+
+		if_cfg |= VC4_SET_FIELD(VC5_DVP_HT_VEC_INTERFACE_CFG_SEL_422_FORMAT_422_LEGACY,
+					VC5_DVP_HT_VEC_INTERFACE_CFG_SEL_422);
+
+		vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_to_full_yuv422_bt709);
+		break;
+
+	case VC4_HDMI_OUTPUT_RGB:
+		if_xbar = 0x354021;
+
+		if (!vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode))
+			vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_to_limited_rgb);
+		else
+			vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_unity);
+		break;
+
+	default:
+		break;
+	}
+
+	HDMI_WRITE(HDMI_VEC_INTERFACE_CFG, if_cfg);
+	HDMI_WRITE(HDMI_VEC_INTERFACE_XBAR, if_xbar);
+	HDMI_WRITE(HDMI_CSC_CHANNEL_CTL, csc_chan_ctl);
 	HDMI_WRITE(HDMI_CSC_CTL, csc_ctl);
 
 	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
@@ -1277,13 +1367,16 @@ vc4_hdmi_encoder_clock_valid(struct vc4_hdmi *vc4_hdmi,
 
 static unsigned long
 vc4_hdmi_encoder_compute_mode_clock(const struct drm_display_mode *mode,
-				    unsigned int bpc)
+				    unsigned int bpc, unsigned int fmt)
 {
 	unsigned long clock = mode->crtc_clock * 1000;
 
 	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
 		clock = clock * 2;
 
+	if (fmt == VC4_HDMI_OUTPUT_YUV422)
+		clock = clock * 2 / 3;
+
 	return clock * bpc / 8;
 }
 
@@ -1291,11 +1384,11 @@ static int
 vc4_hdmi_encoder_compute_clock(struct vc4_hdmi *vc4_hdmi,
 			       struct vc4_hdmi_connector_state *vc4_state,
 			       const struct drm_display_mode *mode,
-			       unsigned int bpc)
+			       unsigned int bpc, unsigned int fmt)
 {
 	unsigned long clock;
 
-	clock = vc4_hdmi_encoder_compute_mode_clock(mode, bpc);
+	clock = vc4_hdmi_encoder_compute_mode_clock(mode, bpc, fmt);
 	if (vc4_hdmi_encoder_clock_valid(vc4_hdmi, clock) != MODE_OK)
 		return -EINVAL;
 
@@ -1304,6 +1397,27 @@ vc4_hdmi_encoder_compute_clock(struct vc4_hdmi *vc4_hdmi,
 	return 0;
 }
 
+static int
+vc4_hdmi_encoder_compute_config(struct vc4_hdmi *vc4_hdmi,
+				struct vc4_hdmi_connector_state *vc4_state,
+				const struct drm_display_mode *mode)
+{
+	struct drm_connector_state *conn_state = &vc4_state->base;
+	unsigned int format;
+	int ret;
+
+	format = VC4_HDMI_OUTPUT_RGB;
+	ret = vc4_hdmi_encoder_compute_clock(vc4_hdmi,
+					     vc4_state, mode,
+					     conn_state->max_bpc,
+					     format);
+	if (ret)
+		return ret;
+
+	vc4_state->output_format = format;
+	return ret;
+}
+
 #define WIFI_2_4GHz_CH1_MIN_FREQ	2400000000ULL
 #define WIFI_2_4GHz_CH1_MAX_FREQ	2422000000ULL
 
@@ -1337,8 +1451,7 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 		pixel_rate = mode->clock * 1000;
 	}
 
-	ret = vc4_hdmi_encoder_compute_clock(vc4_hdmi, vc4_state, mode,
-					     conn_state->max_bpc);
+	ret = vc4_hdmi_encoder_compute_config(vc4_hdmi, vc4_state, mode);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 2b6aaafc020a..92402915ec98 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -117,6 +117,13 @@ struct vc4_hdmi_audio {
 	bool streaming;
 };
 
+enum vc4_hdmi_output_format {
+	VC4_HDMI_OUTPUT_RGB,
+	VC4_HDMI_OUTPUT_YUV422,
+	VC4_HDMI_OUTPUT_YUV444,
+	VC4_HDMI_OUTPUT_YUV420,
+};
+
 /* General HDMI hardware state. */
 struct vc4_hdmi {
 	struct vc4_hdmi_audio audio;
@@ -235,6 +242,7 @@ encoder_to_vc4_hdmi(struct drm_encoder *encoder)
 struct vc4_hdmi_connector_state {
 	struct drm_connector_state	base;
 	unsigned long long		pixel_rate;
+	enum vc4_hdmi_output_format	output_format;
 };
 
 static inline struct vc4_hdmi_connector_state *
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h b/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
index fc971506bd4f..a040356b6bdc 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
@@ -54,6 +54,7 @@ enum vc4_hdmi_field {
 	HDMI_CSC_24_23,
 	HDMI_CSC_32_31,
 	HDMI_CSC_34_33,
+	HDMI_CSC_CHANNEL_CTL,
 	HDMI_CSC_CTL,
 
 	/*
@@ -119,6 +120,7 @@ enum vc4_hdmi_field {
 	HDMI_TX_PHY_POWERDOWN_CTL,
 	HDMI_TX_PHY_RESET_CTL,
 	HDMI_TX_PHY_TMDS_CLK_WORD_SEL,
+	HDMI_VEC_INTERFACE_CFG,
 	HDMI_VEC_INTERFACE_XBAR,
 	HDMI_VERTA0,
 	HDMI_VERTA1,
@@ -244,6 +246,7 @@ static const struct vc4_hdmi_register __maybe_unused vc5_hdmi_hdmi0_fields[] = {
 	VC4_HDMI_REG(HDMI_SCRAMBLER_CTL, 0x1c4),
 
 	VC5_DVP_REG(HDMI_CLOCK_STOP, 0x0bc),
+	VC5_DVP_REG(HDMI_VEC_INTERFACE_CFG, 0x0ec),
 	VC5_DVP_REG(HDMI_VEC_INTERFACE_XBAR, 0x0f0),
 
 	VC5_PHY_REG(HDMI_TX_PHY_RESET_CTL, 0x000),
@@ -289,6 +292,7 @@ static const struct vc4_hdmi_register __maybe_unused vc5_hdmi_hdmi0_fields[] = {
 	VC5_CSC_REG(HDMI_CSC_24_23, 0x010),
 	VC5_CSC_REG(HDMI_CSC_32_31, 0x014),
 	VC5_CSC_REG(HDMI_CSC_34_33, 0x018),
+	VC5_CSC_REG(HDMI_CSC_CHANNEL_CTL, 0x02c),
 };
 
 static const struct vc4_hdmi_register __maybe_unused vc5_hdmi_hdmi1_fields[] = {
@@ -324,6 +328,7 @@ static const struct vc4_hdmi_register __maybe_unused vc5_hdmi_hdmi1_fields[] = {
 	VC4_HDMI_REG(HDMI_SCRAMBLER_CTL, 0x1c4),
 
 	VC5_DVP_REG(HDMI_CLOCK_STOP, 0x0bc),
+	VC5_DVP_REG(HDMI_VEC_INTERFACE_CFG, 0x0ec),
 	VC5_DVP_REG(HDMI_VEC_INTERFACE_XBAR, 0x0f0),
 
 	VC5_PHY_REG(HDMI_TX_PHY_RESET_CTL, 0x000),
@@ -369,6 +374,7 @@ static const struct vc4_hdmi_register __maybe_unused vc5_hdmi_hdmi1_fields[] = {
 	VC5_CSC_REG(HDMI_CSC_24_23, 0x010),
 	VC5_CSC_REG(HDMI_CSC_32_31, 0x014),
 	VC5_CSC_REG(HDMI_CSC_34_33, 0x018),
+	VC5_CSC_REG(HDMI_CSC_CHANNEL_CTL, 0x02c),
 };
 
 static inline
diff --git a/drivers/gpu/drm/vc4/vc4_regs.h b/drivers/gpu/drm/vc4/vc4_regs.h
index 952f2aad0785..392b0be053f8 100644
--- a/drivers/gpu/drm/vc4/vc4_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_regs.h
@@ -774,11 +774,27 @@ enum {
 # define VC4_HD_CSC_CTL_RGB2YCC			BIT(1)
 # define VC4_HD_CSC_CTL_ENABLE			BIT(0)
 
+# define VC5_MT_CP_CSC_CTL_USE_444_TO_422	BIT(6)
+# define VC5_MT_CP_CSC_CTL_FILTER_MODE_444_TO_422_MASK \
+						VC4_MASK(5, 4)
+# define VC5_MT_CP_CSC_CTL_FILTER_MODE_444_TO_422_STANDARD \
+						3
+# define VC5_MT_CP_CSC_CTL_USE_RNG_SUPPRESSION	BIT(3)
 # define VC5_MT_CP_CSC_CTL_ENABLE		BIT(2)
 # define VC5_MT_CP_CSC_CTL_MODE_MASK		VC4_MASK(1, 0)
 
+# define VC5_MT_CP_CHANNEL_CTL_OUTPUT_REMAP_MASK \
+						VC4_MASK(7, 6)
+# define VC5_MT_CP_CHANNEL_CTL_OUTPUT_REMAP_LEGACY_STYLE \
+						2
+
 # define VC4_DVP_HT_CLOCK_STOP_PIXEL		BIT(1)
 
+# define VC5_DVP_HT_VEC_INTERFACE_CFG_SEL_422_MASK \
+						VC4_MASK(3, 2)
+# define VC5_DVP_HT_VEC_INTERFACE_CFG_SEL_422_FORMAT_422_LEGACY \
+						2
+
 /* HVS display list information. */
 #define HVS_BOOTLOADER_DLIST_END                32
 
-- 
2.33.1

