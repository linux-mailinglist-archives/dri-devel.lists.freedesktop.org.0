Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A4C48D978
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 15:08:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B71210E500;
	Thu, 13 Jan 2022 14:08:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7978A10E54D
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 14:08:00 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 63F0C5807F1;
 Thu, 13 Jan 2022 09:07:59 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 13 Jan 2022 09:07:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=64eRg1IVMe6Vk
 MVXGclnEjr75K7EQR+B22TN6BtoIto=; b=WjyZ0+EXXDNKn6ZdyeHD2PkWX80QC
 8tLMTB4MelGfJkLpzNxFnbxQnS6uHhEMGgg5DKqpnoCaK1GEJZPpqYvD6IEK28Ve
 G/QWYp55OJQRd4oxDpHULPZDNDU7DDNE/08+lpEEuWyo8/PUFmV9DVKJPPRSxLSW
 t0mQfFQ14xhUdTNTLMFA9NiBDE5QmlkIwf0npwAasIA4donnb1ig+mFPEvcCqQsa
 0ehEd/AkoOigDuGuJ+A0DRTl7SL7NOW8DzVtb1OIEg12ClOzhbG+adWlhSg5nYmY
 pSMJj97rtME5gn3Hu2y3jNti4xD+a2GtHQ6S4f5R/ZHtK3pBPWGLPALsw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=64eRg1IVMe6VkMVXGclnEjr75K7EQR+B22TN6BtoIto=; b=Hfa4aoaL
 23TDMNAPMN84lrosOdX099wQVVUniLMPRjUf/liSJ94O5U9m0qWQ/tK3avAobqAP
 k50WBMioSzWLP7uMo64Fr47ahYYSzCltaaqFqoq+sKa5/lQJSQ5B3GFRooMw2Pmk
 2Ce3mGmaWmdJU4BBEKjSTkeY0VXqvyVYM1MrJIhV0UV9plnYpTwnpQWxHa6CQWem
 rzFS5MMbOvfs/j3sKbS56hnHYZvD24Oee6a7SnSbn+LApDnKMdZzOLteO9W9cEMS
 LRtUzZdEe4l6npODojGZEQZQmDOtIMgGzbMUHzTQFZ2agiNIAYz+1KtrynbJ0BPq
 k4Wq71yhkVd1Pg==
X-ME-Sender: <xms:PzLgYf3QA1Q9qpPP62ATp_Ome5RDXwxL0LPT7aL9XNT40DYb0uLKeQ>
 <xme:PzLgYeFllYqAnVQ_bLQ1S5zq_SaEiHwxrx_H5ox5f1-vv5kzzTfHKaSrccURIQ0vi
 cVDzHDIoHjLDIOTbLE>
X-ME-Received: <xmr:PzLgYf7e8DuVA6hp5AvmQ5_ZGZ7Z61XAlzdJYFjUD3VA6T8S3wLuPEKiXxTXmD2ZE3Of0_c4GXtKwTpMFLvtuhEjdytpRbUSljJ-ZW4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrtdefgdehlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:PzLgYU2S8gh4f3Sdf2qqUrN4E_ej0RqKvXHd4A5vJUsUxAqUQmDGWg>
 <xmx:PzLgYSE9-Z-cm2561Uv7ttY6JSor4UixhDjRDy8WgRVtO5TA0OBfuw>
 <xmx:PzLgYV9JXYO3r1t2FRnjUEsACNHggKNvQRSMiB2mBy18Y8ib9BwcSA>
 <xmx:PzLgYa9ZHTQTKw5Zykdoub790b5gRGFqnUpAkkgJD5zle2vOVIyDGw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Jan 2022 09:07:58 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 16/16] drm/vc4: hdmi: Support HDMI YUV output
Date: Thu, 13 Jan 2022 15:07:20 +0100
Message-Id: <20220113140720.1678907-17-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220113140720.1678907-1-maxime@cerno.tech>
References: <20220113140720.1678907-1-maxime@cerno.tech>
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
 Werner Sembach <wse@tuxedocomputers.com>, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In addition to the RGB444 output, the BCM2711 HDMI controller supports
the YUV444 and YUV422 output formats.

Let's add support for them in the driver, but still use RGB as the
preferred format.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c      | 289 ++++++++++++++++++++++++++--
 drivers/gpu/drm/vc4/vc4_hdmi.h      |  14 ++
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h |   6 +
 drivers/gpu/drm/vc4/vc4_regs.h      |  16 ++
 4 files changed, 309 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index b7783fba1b51..bda6c578b30b 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -99,15 +99,30 @@
 
 #define HDMI_14_MAX_TMDS_CLK   (340 * 1000 * 1000)
 
+static const char * const output_format_str[] = {
+	[VC4_HDMI_OUTPUT_RGB]		= "RGB",
+	[VC4_HDMI_OUTPUT_YUV420]	= "YUV 4:2:0",
+	[VC4_HDMI_OUTPUT_YUV422]	= "YUV 4:2:2",
+	[VC4_HDMI_OUTPUT_YUV444]	= "YUV 4:4:4",
+};
+
+static const char *vc4_hdmi_output_fmt_str(enum vc4_hdmi_output_format fmt)
+{
+	if (fmt >= ARRAY_SIZE(output_format_str))
+		return "invalid";
+
+	return output_format_str[fmt];
+}
 
 static unsigned long long
 vc4_hdmi_encoder_compute_mode_clock(const struct drm_display_mode *mode,
-				    unsigned int bpc);
+				    unsigned int bpc, enum vc4_hdmi_output_format fmt);
 
 static bool vc4_hdmi_mode_needs_scrambling(const struct drm_display_mode *mode,
-					   unsigned int bpc)
+					   unsigned int bpc,
+					   enum vc4_hdmi_output_format fmt)
 {
-	unsigned long long clock = vc4_hdmi_encoder_compute_mode_clock(mode, bpc);
+	unsigned long long clock = vc4_hdmi_encoder_compute_mode_clock(mode, bpc, fmt);
 
 	return clock > HDMI_14_MAX_TMDS_CLK;
 }
@@ -280,7 +295,7 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 		struct drm_display_mode *mode;
 
 		list_for_each_entry(mode, &connector->probed_modes, head) {
-			if (vc4_hdmi_mode_needs_scrambling(mode, 8)) {
+			if (vc4_hdmi_mode_needs_scrambling(mode, 8, VC4_HDMI_OUTPUT_RGB)) {
 				drm_warn_once(drm, "The core clock cannot reach frequencies high enough to support 4k @ 60Hz.");
 				drm_warn_once(drm, "Please change your config.txt file to add hdmi_enable_4kp60.");
 			}
@@ -337,6 +352,7 @@ static void vc4_hdmi_connector_reset(struct drm_connector *connector)
 
 	new_state->base.max_bpc = 8;
 	new_state->base.max_requested_bpc = 8;
+	new_state->output_format = VC4_HDMI_OUTPUT_RGB;
 	drm_atomic_helper_connector_tv_reset(connector);
 }
 
@@ -353,6 +369,7 @@ vc4_hdmi_connector_duplicate_state(struct drm_connector *connector)
 
 	new_state->pixel_rate = vc4_state->pixel_rate;
 	new_state->output_bpc = vc4_state->output_bpc;
+	new_state->output_format = vc4_state->output_format;
 	__drm_atomic_helper_connector_duplicate_state(connector, &new_state->base);
 
 	return &new_state->base;
@@ -496,11 +513,38 @@ static void vc4_hdmi_write_infoframe(struct drm_encoder *encoder,
 		DRM_ERROR("Failed to wait for infoframe to start: %d\n", ret);
 }
 
+static void vc4_hdmi_avi_infoframe_colorspace(struct hdmi_avi_infoframe *frame,
+					      enum vc4_hdmi_output_format fmt)
+{
+	switch (fmt) {
+	case VC4_HDMI_OUTPUT_RGB:
+		frame->colorspace = HDMI_COLORSPACE_RGB;
+		break;
+
+	case VC4_HDMI_OUTPUT_YUV420:
+		frame->colorspace = HDMI_COLORSPACE_YUV420;
+		break;
+
+	case VC4_HDMI_OUTPUT_YUV422:
+		frame->colorspace = HDMI_COLORSPACE_YUV422;
+		break;
+
+	case VC4_HDMI_OUTPUT_YUV444:
+		frame->colorspace = HDMI_COLORSPACE_YUV444;
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
@@ -520,6 +564,7 @@ static void vc4_hdmi_set_avi_infoframe(struct drm_encoder *encoder)
 					   HDMI_QUANTIZATION_RANGE_FULL :
 					   HDMI_QUANTIZATION_RANGE_LIMITED);
 	drm_hdmi_avi_infoframe_colorimetry(&frame.avi, cstate);
+	vc4_hdmi_avi_infoframe_colorspace(&frame.avi, vc4_state->output_format);
 	drm_hdmi_avi_infoframe_bars(&frame.avi, cstate);
 
 	vc4_hdmi_write_infoframe(encoder, &frame);
@@ -622,7 +667,9 @@ static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
 	if (!vc4_hdmi_supports_scrambling(encoder, mode))
 		return;
 
-	if (!vc4_hdmi_mode_needs_scrambling(mode, vc4_hdmi->output_bpc))
+	if (!vc4_hdmi_mode_needs_scrambling(mode,
+					    vc4_hdmi->output_bpc,
+					    vc4_hdmi->output_format))
 		return;
 
 	drm_scdc_set_high_tmds_clock_ratio(vc4_hdmi->ddc, true);
@@ -818,6 +865,38 @@ static const u16 vc5_hdmi_csc_full_rgb_to_limited_rgb[3][4] = {
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
@@ -835,19 +914,53 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
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
@@ -973,6 +1086,15 @@ static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 		break;
 	}
 
+	/*
+	 * YCC422 is always 36-bit and not considered deep colour so
+	 * doesn't signal in GCP.
+	 */
+	if (vc4_state->output_format == VC4_HDMI_OUTPUT_YUV422) {
+		gcp = 4;
+		gcp_en = false;
+	}
+
 	reg = HDMI_READ(HDMI_DEEP_COLOR_CONFIG_1);
 	reg &= ~(VC5_HDMI_DEEP_COLOR_CONFIG_1_INIT_PACK_PHASE_MASK |
 		 VC5_HDMI_DEEP_COLOR_CONFIG_1_COLOR_DEPTH_MASK);
@@ -1270,12 +1392,97 @@ static void vc4_hdmi_encoder_atomic_mode_set(struct drm_encoder *encoder,
 
 	mutex_lock(&vc4_hdmi->mutex);
 	vc4_hdmi->output_bpc = vc4_state->output_bpc;
+	vc4_hdmi->output_format = vc4_state->output_format;
 	memcpy(&vc4_hdmi->saved_adjusted_mode,
 	       &crtc_state->adjusted_mode,
 	       sizeof(vc4_hdmi->saved_adjusted_mode));
 	mutex_unlock(&vc4_hdmi->mutex);
 }
 
+static bool
+vc4_hdmi_sink_supports_format_bpc(const struct vc4_hdmi *vc4_hdmi,
+				  const struct drm_display_info *info,
+				  const struct drm_display_mode *mode,
+				  unsigned int format, unsigned int bpc)
+{
+	struct drm_device *dev = vc4_hdmi->connector.dev;
+	u8 vic = drm_match_cea_mode(mode);
+
+	if (vic == 1 && bpc != 8) {
+		drm_dbg(dev, "VIC1 requires a bpc of 8, got %u\n", bpc);
+		return false;
+	}
+
+	if (!info->is_hdmi &&
+	    (format != VC4_HDMI_OUTPUT_RGB || bpc != 8)) {
+		drm_dbg(dev, "DVI Monitors require an RGB output at 8 bpc\n");
+		return false;
+	}
+
+	switch (format) {
+	case VC4_HDMI_OUTPUT_RGB:
+		drm_dbg(dev, "RGB Format, checking the constraints.\n");
+
+		if (!(info->color_formats & DRM_COLOR_FORMAT_RGB444))
+			return false;
+
+		if (bpc == 10 && !(info->edid_hdmi_rgb444_dc_modes & DRM_EDID_HDMI_DC_30)) {
+			drm_dbg(dev, "10 BPC but sink doesn't support Deep Color 30.\n");
+			return false;
+		}
+
+		if (bpc == 12 && !(info->edid_hdmi_rgb444_dc_modes & DRM_EDID_HDMI_DC_36)) {
+			drm_dbg(dev, "12 BPC but sink doesn't support Deep Color 36.\n");
+			return false;
+		}
+
+		drm_dbg(dev, "RGB format supported in that configuration.\n");
+
+		return true;
+
+	case VC4_HDMI_OUTPUT_YUV422:
+		drm_dbg(dev, "YUV422 format, checking the constraints.\n");
+
+		if (!(info->color_formats & DRM_COLOR_FORMAT_YCBCR422)) {
+			drm_dbg(dev, "Sink doesn't support YUV422.\n");
+			return false;
+		}
+
+		if (bpc != 12) {
+			drm_dbg(dev, "YUV422 only supports 12 bpc.\n");
+			return false;
+		}
+
+		drm_dbg(dev, "YUV422 format supported in that configuration.\n");
+
+		return true;
+
+	case VC4_HDMI_OUTPUT_YUV444:
+		drm_dbg(dev, "YUV444 format, checking the constraints.\n");
+
+		if (!(info->color_formats & DRM_COLOR_FORMAT_YCBCR444)) {
+			drm_dbg(dev, "Sink doesn't support YUV444.\n");
+			return false;
+		}
+
+		if (bpc == 10 && !(info->edid_hdmi_ycbcr444_dc_modes & DRM_EDID_HDMI_DC_30)) {
+			drm_dbg(dev, "10 BPC but sink doesn't support Deep Color 30.\n");
+			return false;
+		}
+
+		if (bpc == 12 && !(info->edid_hdmi_ycbcr444_dc_modes & DRM_EDID_HDMI_DC_36)) {
+			drm_dbg(dev, "12 BPC but sink doesn't support Deep Color 36.\n");
+			return false;
+		}
+
+		drm_dbg(dev, "YUV444 format supported in that configuration.\n");
+
+		return true;
+	}
+
+	return false;
+}
+
 static enum drm_mode_status
 vc4_hdmi_encoder_clock_valid(const struct vc4_hdmi *vc4_hdmi,
 			     unsigned long long clock)
@@ -1297,13 +1504,17 @@ vc4_hdmi_encoder_clock_valid(const struct vc4_hdmi *vc4_hdmi,
 
 static unsigned long long
 vc4_hdmi_encoder_compute_mode_clock(const struct drm_display_mode *mode,
-				    unsigned int bpc)
+				    unsigned int bpc,
+				    enum vc4_hdmi_output_format fmt)
 {
 	unsigned long long clock = mode->crtc_clock * 1000;
 
 	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
 		clock = clock * 2;
 
+	if (fmt == VC4_HDMI_OUTPUT_YUV422)
+		bpc = 8;
+
 	return clock * bpc / 8;
 }
 
@@ -1311,11 +1522,11 @@ static int
 vc4_hdmi_encoder_compute_clock(const struct vc4_hdmi *vc4_hdmi,
 			       struct vc4_hdmi_connector_state *vc4_state,
 			       const struct drm_display_mode *mode,
-			       unsigned int bpc)
+			       unsigned int bpc, unsigned int fmt)
 {
 	unsigned long long clock;
 
-	clock = vc4_hdmi_encoder_compute_mode_clock(mode, bpc);
+	clock = vc4_hdmi_encoder_compute_mode_clock(mode, bpc, fmt);
 	if (vc4_hdmi_encoder_clock_valid(vc4_hdmi, clock) != MODE_OK)
 		return -EINVAL;
 
@@ -1324,11 +1535,56 @@ vc4_hdmi_encoder_compute_clock(const struct vc4_hdmi *vc4_hdmi,
 	return 0;
 }
 
+static int
+vc4_hdmi_encoder_compute_format(const struct vc4_hdmi *vc4_hdmi,
+				struct vc4_hdmi_connector_state *vc4_state,
+				const struct drm_display_mode *mode,
+				unsigned int bpc)
+{
+	struct drm_device *dev = vc4_hdmi->connector.dev;
+	const struct drm_connector *connector = &vc4_hdmi->connector;
+	const struct drm_display_info *info = &connector->display_info;
+	unsigned int format;
+
+	drm_dbg(dev, "Trying with an RGB output\n");
+
+	format = VC4_HDMI_OUTPUT_RGB;
+	if (vc4_hdmi_sink_supports_format_bpc(vc4_hdmi, info, mode, format, bpc)) {
+		int ret;
+
+		ret = vc4_hdmi_encoder_compute_clock(vc4_hdmi, vc4_state,
+						     mode, bpc, format);
+		if (!ret) {
+			vc4_state->output_format = format;
+			return 0;
+		}
+	}
+
+	drm_dbg(dev, "Failed, Trying with an YUV422 output\n");
+
+	format = VC4_HDMI_OUTPUT_YUV422;
+	if (vc4_hdmi_sink_supports_format_bpc(vc4_hdmi, info, mode, format, bpc)) {
+		int ret;
+
+		ret = vc4_hdmi_encoder_compute_clock(vc4_hdmi, vc4_state,
+						     mode, bpc, format);
+		if (!ret) {
+			vc4_state->output_format = format;
+			return 0;
+		}
+	}
+
+	drm_dbg(dev, "Failed. No Format Supported for that bpc count.\n");
+
+	return -EINVAL;
+}
+
 static int
 vc4_hdmi_encoder_compute_config(const struct vc4_hdmi *vc4_hdmi,
 				struct vc4_hdmi_connector_state *vc4_state,
 				const struct drm_display_mode *mode)
 {
+	struct drm_device *dev = vc4_hdmi->connector.dev;
 	struct drm_connector_state *conn_state = &vc4_state->base;
 	unsigned int max_bpc = clamp_t(unsigned int, conn_state->max_bpc, 8, 12);
 	unsigned int bpc;
@@ -1337,17 +1593,18 @@ vc4_hdmi_encoder_compute_config(const struct vc4_hdmi *vc4_hdmi,
 	for (bpc = max_bpc; bpc >= 8; bpc -= 2) {
 		drm_dbg(dev, "Trying with a %d bpc output\n", bpc);
 
-		ret = vc4_hdmi_encoder_compute_clock(vc4_hdmi, vc4_state,
-						     mode, bpc);
+		ret = vc4_hdmi_encoder_compute_format(vc4_hdmi, vc4_state,
+						      mode, bpc);
 		if (ret)
 			continue;
 
 		vc4_state->output_bpc = bpc;
 
 		drm_dbg(dev,
-			"Mode %ux%u @ %uHz: Found configuration: bpc: %u, clock: %llu\n",
+			"Mode %ux%u @ %uHz: Found configuration: bpc: %u, fmt: %s, clock: %llu\n",
 			mode->hdisplay, mode->vdisplay, drm_mode_vrefresh(mode),
 			vc4_state->output_bpc,
+			vc4_hdmi_output_fmt_str(vc4_state->output_format),
 			vc4_state->pixel_rate);
 
 		break;
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 05d2b0eeaa9b..f015ae80c5d4 100644
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
@@ -222,6 +229,12 @@ struct vc4_hdmi {
 	 * outside of KMS hooks. Protected by @mutex.
 	 */
 	unsigned int output_bpc;
+
+	/**
+	 * @output_format: Copy of @vc4_connector_state.output_format
+	 * for use outside of KMS hooks. Protected by @mutex.
+	 */
+	enum vc4_hdmi_output_format output_format;
 };
 
 static inline struct vc4_hdmi *
@@ -242,6 +255,7 @@ struct vc4_hdmi_connector_state {
 	struct drm_connector_state	base;
 	unsigned long long		pixel_rate;
 	unsigned int 			output_bpc;
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
index 33410718089e..c8210247cf24 100644
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
2.34.1

