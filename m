Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E8E33F414
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 16:44:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 284236E5C6;
	Wed, 17 Mar 2021 15:44:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB9CB6E7DC
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 15:44:02 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id BB1AE580CE9;
 Wed, 17 Mar 2021 11:44:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 17 Mar 2021 11:44:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=a2AhStmxM0xhk
 9AgsXaC+LW/nNvo7Sdw5nPkPXprYdg=; b=itUFGPR0EQaGLJaoqNxyLb4sG5KM3
 FuuW43yaVQaJbX0N6L5YJMp/nquQjEkkDp4JvmNP3K9RzfZf72kyziYGLQ8A4hux
 P4j5btaykla3+XyPQPOzEiRJgYaeUSV5wUvec1oqVXNknICcLi4/8nVIQJFxtXzQ
 7eCDrdGkO2kX5MrawSu5d1DjEpujRVXbeYrejdTuAaL4bwiQPc5pY5L3wVZ1O9Ao
 twbctjfW78nKA/Ra4dulQS1SqlT2r7QtB99eBfhN6BbRtSeO7up8H+naeL6fdQtE
 qkT3xa8J+k8Z6BV2utE+49Q8snvz2WHJ92AIH/wzZ7wiJSEANm+F66KOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=a2AhStmxM0xhk9AgsXaC+LW/nNvo7Sdw5nPkPXprYdg=; b=sP4CtAJ2
 akcw3JOq7FlaS18EJ8L9OPiqUlwv4GwVHmaDCIixbkq9hv+X7jp5RWg+zZc1andm
 NBLza0rODpSq8g2S98lO+0Ma3KMDzQlYqj9sQojl8Rxiql6OzauwUvxHU6owlvA3
 fri+UUFMXRTuYwt88zxGtxLBowBjc3ypYtXyfqC72haDkBJOvJS8I1mBzifdUCJe
 BvnxZZm/H4hQf2bvrmcgf6/D2/6F+4dLCNtaIAf/ViwZYEknE6qjbF/k1tpeqPLW
 rdG38dmNJuCnpUGXAuBtzP0YZKOsnlpYrsdmA6aQeUdp96DZjNGnoqmPWLMdwbB0
 Xv9OsNUJG+vR+A==
X-ME-Sender: <xms:wCNSYKn2q-jC2B8FFDvu9EPw-owLqP9Y6ZGc9kaE1SVApOl4p8LqsA>
 <xme:wCNSYBxdFetActsZXzyJQAT-Fy_LDUi1aTBC7IXxaTZSaM_jo-vHVKTNxUUUZXiRU
 1qiN4TXXpXT75sviVA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefgedgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:wCNSYFjCtAjc8AwodNSfbFy9naa7qP2axVe3qe_atkqgzSjWXwsZ8Q>
 <xmx:wCNSYGW8XFZZl9yeceoyYR-vqJuP1PY2GniVIGJfLzB6JDYwTzm4ZQ>
 <xmx:wCNSYH3-2WizYdzzSfjyDIC2EiBM_DkRsnxJSx5ozosIuMkdfvaWyw>
 <xmx:wCNSYP4cGML2KsVnaFocsp3bNUiDo0nrQUY2Hh7X2Zl0opF6PkrIag>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 08E3A240065;
 Wed, 17 Mar 2021 11:43:59 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 03/18] drm/bridge: dw-hdmi: Use helpers
Date: Wed, 17 Mar 2021 16:43:37 +0100
Message-Id: <20210317154352.732095-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317154352.732095-1-maxime@cerno.tech>
References: <20210317154352.732095-1-maxime@cerno.tech>
MIME-Version: 1.0
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
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 141 +++++-----------------
 1 file changed, 28 insertions(+), 113 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index d010c9c525d9..39b380453183 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -29,6 +29,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_hdmi.h>
 #include <drm/drm_of.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
@@ -801,92 +802,6 @@ void dw_hdmi_audio_disable(struct dw_hdmi *hdmi)
 }
 EXPORT_SYMBOL_GPL(dw_hdmi_audio_disable);
 
-static bool hdmi_bus_fmt_is_rgb(unsigned int bus_format)
-{
-	switch (bus_format) {
-	case MEDIA_BUS_FMT_RGB888_1X24:
-	case MEDIA_BUS_FMT_RGB101010_1X30:
-	case MEDIA_BUS_FMT_RGB121212_1X36:
-	case MEDIA_BUS_FMT_RGB161616_1X48:
-		return true;
-
-	default:
-		return false;
-	}
-}
-
-static bool hdmi_bus_fmt_is_yuv444(unsigned int bus_format)
-{
-	switch (bus_format) {
-	case MEDIA_BUS_FMT_YUV8_1X24:
-	case MEDIA_BUS_FMT_YUV10_1X30:
-	case MEDIA_BUS_FMT_YUV12_1X36:
-	case MEDIA_BUS_FMT_YUV16_1X48:
-		return true;
-
-	default:
-		return false;
-	}
-}
-
-static bool hdmi_bus_fmt_is_yuv422(unsigned int bus_format)
-{
-	switch (bus_format) {
-	case MEDIA_BUS_FMT_UYVY8_1X16:
-	case MEDIA_BUS_FMT_UYVY10_1X20:
-	case MEDIA_BUS_FMT_UYVY12_1X24:
-		return true;
-
-	default:
-		return false;
-	}
-}
-
-static bool hdmi_bus_fmt_is_yuv420(unsigned int bus_format)
-{
-	switch (bus_format) {
-	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
-	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
-	case MEDIA_BUS_FMT_UYYVYY12_0_5X36:
-	case MEDIA_BUS_FMT_UYYVYY16_0_5X48:
-		return true;
-
-	default:
-		return false;
-	}
-}
-
-static int hdmi_bus_fmt_color_depth(unsigned int bus_format)
-{
-	switch (bus_format) {
-	case MEDIA_BUS_FMT_RGB888_1X24:
-	case MEDIA_BUS_FMT_YUV8_1X24:
-	case MEDIA_BUS_FMT_UYVY8_1X16:
-	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
-		return 8;
-
-	case MEDIA_BUS_FMT_RGB101010_1X30:
-	case MEDIA_BUS_FMT_YUV10_1X30:
-	case MEDIA_BUS_FMT_UYVY10_1X20:
-	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
-		return 10;
-
-	case MEDIA_BUS_FMT_RGB121212_1X36:
-	case MEDIA_BUS_FMT_YUV12_1X36:
-	case MEDIA_BUS_FMT_UYVY12_1X24:
-	case MEDIA_BUS_FMT_UYYVYY12_0_5X36:
-		return 12;
-
-	case MEDIA_BUS_FMT_RGB161616_1X48:
-	case MEDIA_BUS_FMT_YUV16_1X48:
-	case MEDIA_BUS_FMT_UYYVYY16_0_5X48:
-		return 16;
-
-	default:
-		return 0;
-	}
-}
-
 /*
  * this submodule is responsible for the video data synchronization.
  * for example, for RGB 4:4:4 input, the data map is defined as
@@ -967,8 +882,8 @@ static int is_color_space_conversion(struct dw_hdmi *hdmi)
 	struct hdmi_data_info *hdmi_data = &hdmi->hdmi_data;
 	bool is_input_rgb, is_output_rgb;
 
-	is_input_rgb = hdmi_bus_fmt_is_rgb(hdmi_data->enc_in_bus_format);
-	is_output_rgb = hdmi_bus_fmt_is_rgb(hdmi_data->enc_out_bus_format);
+	is_input_rgb = drm_hdmi_bus_fmt_is_rgb(hdmi_data->enc_in_bus_format);
+	is_output_rgb = drm_hdmi_bus_fmt_is_rgb(hdmi_data->enc_out_bus_format);
 
 	return (is_input_rgb != is_output_rgb) ||
 	       (is_input_rgb && is_output_rgb && hdmi_data->rgb_limited_range);
@@ -976,11 +891,11 @@ static int is_color_space_conversion(struct dw_hdmi *hdmi)
 
 static int is_color_space_decimation(struct dw_hdmi *hdmi)
 {
-	if (!hdmi_bus_fmt_is_yuv422(hdmi->hdmi_data.enc_out_bus_format))
+	if (!drm_hdmi_bus_fmt_is_yuv422(hdmi->hdmi_data.enc_out_bus_format))
 		return 0;
 
-	if (hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_in_bus_format) ||
-	    hdmi_bus_fmt_is_yuv444(hdmi->hdmi_data.enc_in_bus_format))
+	if (drm_hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_in_bus_format) ||
+	    drm_hdmi_bus_fmt_is_yuv444(hdmi->hdmi_data.enc_in_bus_format))
 		return 1;
 
 	return 0;
@@ -988,11 +903,11 @@ static int is_color_space_decimation(struct dw_hdmi *hdmi)
 
 static int is_color_space_interpolation(struct dw_hdmi *hdmi)
 {
-	if (!hdmi_bus_fmt_is_yuv422(hdmi->hdmi_data.enc_in_bus_format))
+	if (!drm_hdmi_bus_fmt_is_yuv422(hdmi->hdmi_data.enc_in_bus_format))
 		return 0;
 
-	if (hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_out_bus_format) ||
-	    hdmi_bus_fmt_is_yuv444(hdmi->hdmi_data.enc_out_bus_format))
+	if (drm_hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_out_bus_format) ||
+	    drm_hdmi_bus_fmt_is_yuv444(hdmi->hdmi_data.enc_out_bus_format))
 		return 1;
 
 	return 0;
@@ -1012,8 +927,8 @@ static void dw_hdmi_update_csc_coeffs(struct dw_hdmi *hdmi)
 	unsigned i;
 	u32 csc_scale = 1;
 
-	is_input_rgb = hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_in_bus_format);
-	is_output_rgb = hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_out_bus_format);
+	is_input_rgb = drm_hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_in_bus_format);
+	is_output_rgb = drm_hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_out_bus_format);
 
 	if (!is_input_rgb && is_output_rgb) {
 		if (hdmi->hdmi_data.enc_out_encoding == V4L2_YCBCR_ENC_601)
@@ -1061,7 +976,7 @@ static void hdmi_video_csc(struct dw_hdmi *hdmi)
 	else if (is_color_space_decimation(hdmi))
 		decimation = HDMI_CSC_CFG_DECMODE_CHROMA_INT_FORMULA3;
 
-	switch (hdmi_bus_fmt_color_depth(hdmi->hdmi_data.enc_out_bus_format)) {
+	switch (drm_hdmi_bus_fmt_color_depth(hdmi->hdmi_data.enc_out_bus_format)) {
 	case 8:
 		color_depth = HDMI_CSC_SCALE_CSC_COLORDE_PTH_24BPP;
 		break;
@@ -1100,10 +1015,10 @@ static void hdmi_video_packetize(struct dw_hdmi *hdmi)
 	struct hdmi_data_info *hdmi_data = &hdmi->hdmi_data;
 	u8 val, vp_conf;
 
-	if (hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_out_bus_format) ||
-	    hdmi_bus_fmt_is_yuv444(hdmi->hdmi_data.enc_out_bus_format) ||
-	    hdmi_bus_fmt_is_yuv420(hdmi->hdmi_data.enc_out_bus_format)) {
-		switch (hdmi_bus_fmt_color_depth(
+	if (drm_hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_out_bus_format) ||
+	    drm_hdmi_bus_fmt_is_yuv444(hdmi->hdmi_data.enc_out_bus_format) ||
+	    drm_hdmi_bus_fmt_is_yuv420(hdmi->hdmi_data.enc_out_bus_format)) {
+		switch (drm_hdmi_bus_fmt_color_depth(
 					hdmi->hdmi_data.enc_out_bus_format)) {
 		case 8:
 			color_depth = 4;
@@ -1121,8 +1036,8 @@ static void hdmi_video_packetize(struct dw_hdmi *hdmi)
 		default:
 			output_select = HDMI_VP_CONF_OUTPUT_SELECTOR_BYPASS;
 		}
-	} else if (hdmi_bus_fmt_is_yuv422(hdmi->hdmi_data.enc_out_bus_format)) {
-		switch (hdmi_bus_fmt_color_depth(
+	} else if (drm_hdmi_bus_fmt_is_yuv422(hdmi->hdmi_data.enc_out_bus_format)) {
+		switch (drm_hdmi_bus_fmt_color_depth(
 					hdmi->hdmi_data.enc_out_bus_format)) {
 		case 0:
 		case 8:
@@ -1641,7 +1556,7 @@ static void hdmi_config_AVI(struct dw_hdmi *hdmi,
 	/* Initialise info frame from DRM mode */
 	drm_hdmi_avi_infoframe_from_display_mode(&frame, connector, mode);
 
-	if (hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_out_bus_format)) {
+	if (drm_hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_out_bus_format)) {
 		drm_hdmi_avi_infoframe_quant_range(&frame, connector, mode,
 						   hdmi->hdmi_data.rgb_limited_range ?
 						   HDMI_QUANTIZATION_RANGE_LIMITED :
@@ -1652,17 +1567,17 @@ static void hdmi_config_AVI(struct dw_hdmi *hdmi,
 			HDMI_YCC_QUANTIZATION_RANGE_LIMITED;
 	}
 
-	if (hdmi_bus_fmt_is_yuv444(hdmi->hdmi_data.enc_out_bus_format))
+	if (drm_hdmi_bus_fmt_is_yuv444(hdmi->hdmi_data.enc_out_bus_format))
 		frame.colorspace = HDMI_COLORSPACE_YUV444;
-	else if (hdmi_bus_fmt_is_yuv422(hdmi->hdmi_data.enc_out_bus_format))
+	else if (drm_hdmi_bus_fmt_is_yuv422(hdmi->hdmi_data.enc_out_bus_format))
 		frame.colorspace = HDMI_COLORSPACE_YUV422;
-	else if (hdmi_bus_fmt_is_yuv420(hdmi->hdmi_data.enc_out_bus_format))
+	else if (drm_hdmi_bus_fmt_is_yuv420(hdmi->hdmi_data.enc_out_bus_format))
 		frame.colorspace = HDMI_COLORSPACE_YUV420;
 	else
 		frame.colorspace = HDMI_COLORSPACE_RGB;
 
 	/* Set up colorimetry */
-	if (!hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_out_bus_format)) {
+	if (!drm_hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_out_bus_format)) {
 		switch (hdmi->hdmi_data.enc_out_encoding) {
 		case V4L2_YCBCR_ENC_601:
 			if (hdmi->hdmi_data.enc_in_encoding == V4L2_YCBCR_ENC_XV601)
@@ -1864,8 +1779,8 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
 
 	vmode->mtmdsclock = vmode->mpixelclock;
 
-	if (!hdmi_bus_fmt_is_yuv422(hdmi->hdmi_data.enc_out_bus_format)) {
-		switch (hdmi_bus_fmt_color_depth(
+	if (!drm_hdmi_bus_fmt_is_yuv422(hdmi->hdmi_data.enc_out_bus_format)) {
+		switch (drm_hdmi_bus_fmt_color_depth(
 				hdmi->hdmi_data.enc_out_bus_format)) {
 		case 16:
 			vmode->mtmdsclock = vmode->mpixelclock * 2;
@@ -1879,7 +1794,7 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
 		}
 	}
 
-	if (hdmi_bus_fmt_is_yuv420(hdmi->hdmi_data.enc_out_bus_format))
+	if (drm_hdmi_bus_fmt_is_yuv420(hdmi->hdmi_data.enc_out_bus_format))
 		vmode->mtmdsclock /= 2;
 
 	dev_dbg(hdmi->dev, "final tmdsclock = %d\n", vmode->mtmdsclock);
@@ -1930,7 +1845,7 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
 	 * When we're setting a YCbCr420 mode, we need
 	 * to adjust the horizontal timing to suit.
 	 */
-	if (hdmi_bus_fmt_is_yuv420(hdmi->hdmi_data.enc_out_bus_format)) {
+	if (drm_hdmi_bus_fmt_is_yuv420(hdmi->hdmi_data.enc_out_bus_format)) {
 		hdisplay /= 2;
 		hblank /= 2;
 		h_de_hs /= 2;
@@ -2766,7 +2681,7 @@ static const struct drm_bridge_funcs dw_hdmi_bridge_funcs = {
 	.attach = dw_hdmi_bridge_attach,
 	.detach = dw_hdmi_bridge_detach,
 	.atomic_check = dw_hdmi_bridge_atomic_check,
-	.atomic_get_output_bus_fmts = dw_hdmi_bridge_atomic_get_output_bus_fmts,
+	.atomic_get_output_bus_fmts = drm_atomic_helper_bridge_hdmi_get_output_bus_fmts,
 	.atomic_get_input_bus_fmts = dw_hdmi_bridge_atomic_get_input_bus_fmts,
 	.atomic_enable = dw_hdmi_bridge_atomic_enable,
 	.atomic_disable = dw_hdmi_bridge_atomic_disable,
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
