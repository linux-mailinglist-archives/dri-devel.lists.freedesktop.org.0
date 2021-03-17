Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 648C433F415
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 16:44:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D3E56E7E6;
	Wed, 17 Mar 2021 15:44:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAB036E5C3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 15:44:02 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9BA8E580CE7;
 Wed, 17 Mar 2021 11:44:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 17 Mar 2021 11:44:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=sIFqD/81G+Jzv
 YdcfonsNODJum5o8giV1j2x13Dd3Kw=; b=V3yuCT0MabSVMOWSy3sFZ2vpLAO27
 bQ9i11TYMGouoUfMKf4LXbTcbhRMm3Bpdwvnod5FpxVJ8ThjLOcd3LvLTaL+U2HF
 89k93ZlHFpisAOb4m+lYGf6RjuJvMksS9iUTAnM5HDq45TMkQlvnl9Dz7hq9eJ6K
 fWDvjlrh0v0HCVSeWm5oAzpkGRjQoUUFiXUvg1kqpt28pSsnkx6vZkhV3shmrgiq
 Np3K3D5FKqhSnt2f6231CtMfv/YLpP+Ymx+Nlb9Fiwemu7v39xQG7TwxQc84IMSA
 80xDRIa3CcS1ESr3KlZDDqZj4m+YCRIPTaDHWBVJ8JWF49aW08Fv5nadQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=sIFqD/81G+JzvYdcfonsNODJum5o8giV1j2x13Dd3Kw=; b=w1e8tCMr
 Y8f/bmpp0wVmkgVg2eCu2vQAlS/i6cPXGGL7VS/QwAfD0NEdZGlewT6/lDESltQG
 wzPP9ZAiXA+APiu2rDzYlWq5hiY2sAunv++o+3h6dPAHvlAjavEeYcbJN/bYnjit
 WOFF3dfNnY6vOo0P5KcNPFWpStvV/NOMdWw4EhMgR50EHCFDRbn+uN3doA6gS47Y
 SVOJxriJdYzEYOP/UiFZVZM/iEA5JoCh5cTYuYiyOcBesFgrrJjQsDeUTNkPRTos
 kRYn82w2kUIjwecBwOWBSWyij2d4LjkG3sCIQeqFF88sdyNIAG2zT/osJd7VTia5
 SKRAgd0L/z76pQ==
X-ME-Sender: <xms:viNSYIWyPwUUpGvKeODSahN00zSJLcdMiFTtmChhJCa2zUvUyF09sw>
 <xme:viNSYKaOPjgwCBJWIFY80txP7a5uK6KMCqAPyOFNKvNRXSmdkgA0v4Pymng7EpA74
 pmUgwoN5zMifoJ7WHk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefgedgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:viNSYG0WFUm62-d3MtnZwzjntub1zFgHhKtoiXrZa3bL3KWbyZGsYQ>
 <xmx:viNSYEjIMpFiVWrZLHhmaulT4MiksywKc10mlx7SEylH64OMoY7jmg>
 <xmx:viNSYCYK2wzk1pbpZWc0yTFXkQ7_jxMQj6XsZhCZ0iIj5UU0GFHB6A>
 <xmx:wCNSYC2pyal0iOUKjqwbfCS2xzF908dw4aTAJBExGQiIQ1QU7__Gyg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6207324005D;
 Wed, 17 Mar 2021 11:43:58 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 02/18] drm/bridge: Add HDMI output fmt helper
Date: Wed, 17 Mar 2021 16:43:36 +0100
Message-Id: <20210317154352.732095-3-maxime@cerno.tech>
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

The atomic_get_output_bus_fmts bridge callback is there to list the
available formats for output by decreasing order of preference.

On HDMI controllers, we have a fairly static list that will depend on
what the HDMI sink is capable of and the BPC our controller can output.

The dw-hdmi driver already has that code done in a fairly generic
manner, so let's turn that code into an helper for all the HDMI
controllers to reuse.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 127 ----------------------
 drivers/gpu/drm/drm_bridge.c              | 118 ++++++++++++++++++++
 include/drm/drm_bridge.h                  |   6 +
 3 files changed, 124 insertions(+), 127 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index dda4fa9a1a08..d010c9c525d9 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2514,133 +2514,6 @@ static int dw_hdmi_connector_create(struct dw_hdmi *hdmi)
  * DRM Bridge Operations
  */
 
-/*
- * Possible output formats :
- * - MEDIA_BUS_FMT_UYYVYY16_0_5X48,
- * - MEDIA_BUS_FMT_UYYVYY12_0_5X36,
- * - MEDIA_BUS_FMT_UYYVYY10_0_5X30,
- * - MEDIA_BUS_FMT_UYYVYY8_0_5X24,
- * - MEDIA_BUS_FMT_YUV16_1X48,
- * - MEDIA_BUS_FMT_RGB161616_1X48,
- * - MEDIA_BUS_FMT_UYVY12_1X24,
- * - MEDIA_BUS_FMT_YUV12_1X36,
- * - MEDIA_BUS_FMT_RGB121212_1X36,
- * - MEDIA_BUS_FMT_UYVY10_1X20,
- * - MEDIA_BUS_FMT_YUV10_1X30,
- * - MEDIA_BUS_FMT_RGB101010_1X30,
- * - MEDIA_BUS_FMT_UYVY8_1X16,
- * - MEDIA_BUS_FMT_YUV8_1X24,
- * - MEDIA_BUS_FMT_RGB888_1X24,
- */
-
-/* Can return a maximum of 11 possible output formats for a mode/connector */
-#define MAX_OUTPUT_SEL_FORMATS	11
-
-static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
-					struct drm_bridge_state *bridge_state,
-					struct drm_crtc_state *crtc_state,
-					struct drm_connector_state *conn_state,
-					unsigned int *num_output_fmts)
-{
-	struct drm_connector *conn = conn_state->connector;
-	struct drm_display_info *info = &conn->display_info;
-	struct drm_display_mode *mode = &crtc_state->mode;
-	u8 max_bpc = conn_state->max_requested_bpc;
-	bool is_hdmi2_sink = info->hdmi.scdc.supported ||
-			     (info->color_formats & DRM_COLOR_FORMAT_YCRCB420);
-	u32 *output_fmts;
-	unsigned int i = 0;
-
-	*num_output_fmts = 0;
-
-	output_fmts = kcalloc(MAX_OUTPUT_SEL_FORMATS, sizeof(*output_fmts),
-			      GFP_KERNEL);
-	if (!output_fmts)
-		return NULL;
-
-	/* If dw-hdmi is the only bridge, avoid negociating with ourselves */
-	if (list_is_singular(&bridge->encoder->bridge_chain)) {
-		*num_output_fmts = 1;
-		output_fmts[0] = MEDIA_BUS_FMT_FIXED;
-
-		return output_fmts;
-	}
-
-	/*
-	 * If the current mode enforces 4:2:0, force the output but format
-	 * to 4:2:0 and do not add the YUV422/444/RGB formats
-	 */
-	if (conn->ycbcr_420_allowed &&
-	    (drm_mode_is_420_only(info, mode) ||
-	     (is_hdmi2_sink && drm_mode_is_420_also(info, mode)))) {
-
-		/* Order bus formats from 16bit to 8bit if supported */
-		if (max_bpc >= 16 && info->bpc == 16 &&
-		    (info->hdmi.y420_dc_modes & DRM_EDID_YCBCR420_DC_48))
-			output_fmts[i++] = MEDIA_BUS_FMT_UYYVYY16_0_5X48;
-
-		if (max_bpc >= 12 && info->bpc >= 12 &&
-		    (info->hdmi.y420_dc_modes & DRM_EDID_YCBCR420_DC_36))
-			output_fmts[i++] = MEDIA_BUS_FMT_UYYVYY12_0_5X36;
-
-		if (max_bpc >= 10 && info->bpc >= 10 &&
-		    (info->hdmi.y420_dc_modes & DRM_EDID_YCBCR420_DC_30))
-			output_fmts[i++] = MEDIA_BUS_FMT_UYYVYY10_0_5X30;
-
-		/* Default 8bit fallback */
-		output_fmts[i++] = MEDIA_BUS_FMT_UYYVYY8_0_5X24;
-
-		*num_output_fmts = i;
-
-		return output_fmts;
-	}
-
-	/*
-	 * Order bus formats from 16bit to 8bit and from YUV422 to RGB
-	 * if supported. In any case the default RGB888 format is added
-	 */
-
-	if (max_bpc >= 16 && info->bpc == 16) {
-		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
-			output_fmts[i++] = MEDIA_BUS_FMT_YUV16_1X48;
-
-		output_fmts[i++] = MEDIA_BUS_FMT_RGB161616_1X48;
-	}
-
-	if (max_bpc >= 12 && info->bpc >= 12) {
-		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
-			output_fmts[i++] = MEDIA_BUS_FMT_UYVY12_1X24;
-
-		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
-			output_fmts[i++] = MEDIA_BUS_FMT_YUV12_1X36;
-
-		output_fmts[i++] = MEDIA_BUS_FMT_RGB121212_1X36;
-	}
-
-	if (max_bpc >= 10 && info->bpc >= 10) {
-		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
-			output_fmts[i++] = MEDIA_BUS_FMT_UYVY10_1X20;
-
-		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
-			output_fmts[i++] = MEDIA_BUS_FMT_YUV10_1X30;
-
-		output_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
-	}
-
-	if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
-		output_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
-
-	if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
-		output_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
-
-	/* Default 8bit RGB fallback */
-	output_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
-
-	*num_output_fmts = i;
-
-	return output_fmts;
-}
-
 /*
  * Possible input formats :
  * - MEDIA_BUS_FMT_RGB888_1X24
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 64f0effb52ac..253cbca1c19e 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1035,6 +1035,124 @@ int drm_atomic_bridge_chain_check(struct drm_bridge *bridge,
 }
 EXPORT_SYMBOL(drm_atomic_bridge_chain_check);
 
+/* Can return a maximum of 11 possible output formats for a mode/connector */
+#define MAX_OUTPUT_SEL_FORMATS	11
+
+/**
+ * drm_bridge_helper_hdmi_atomic_get_output_bus_fmts() - Lists the output formats for an HDMI sink
+ * @bridge: bridge control structure
+ * @bridge_state: bridge state
+ * @crtc_state: CRTC state
+ * @conn_state: connector state
+ * @num_output_fmts: number of formats returned
+ *
+ * Returns the supported bus formats on the output end of an HDMI
+ * bridge. The returned array is allocated with kmalloc and will thus
+ * need to be freed. Formats will be listed in decreasing preference
+ * order, the framework eventually picking the highest preference
+ * available across all the bridges.
+ *
+ * RETURNS:
+ * an array of MEDIA_FMT_* on success, NULL on failure
+ */
+u32 *drm_atomic_helper_bridge_hdmi_get_output_bus_fmts(struct drm_bridge *bridge,
+						       struct drm_bridge_state *bridge_state,
+						       struct drm_crtc_state *crtc_state,
+						       struct drm_connector_state *conn_state,
+						       unsigned int *num_output_fmts)
+{
+	struct drm_connector *conn = conn_state->connector;
+	struct drm_display_info *info = &conn->display_info;
+	struct drm_display_mode *mode = &crtc_state->mode;
+	u8 max_bpc = conn_state->max_requested_bpc;
+	bool is_hdmi2_sink = info->hdmi.scdc.supported ||
+			     (info->color_formats & DRM_COLOR_FORMAT_YCRCB420);
+	u32 *output_fmts;
+	unsigned int i = 0;
+
+	*num_output_fmts = 0;
+
+	output_fmts = kcalloc(MAX_OUTPUT_SEL_FORMATS, sizeof(*output_fmts),
+			      GFP_KERNEL);
+	if (!output_fmts)
+		return NULL;
+
+	/*
+	 * If the current mode enforces 4:2:0, force the output but format
+	 * to 4:2:0 and do not add the YUV422/444/RGB formats
+	 */
+	if (conn->ycbcr_420_allowed &&
+	    (drm_mode_is_420_only(info, mode) ||
+	     (is_hdmi2_sink && drm_mode_is_420_also(info, mode)))) {
+
+		/* Order bus formats from 16bit to 8bit if supported */
+		if (max_bpc >= 16 && info->bpc == 16 &&
+		    (info->hdmi.y420_dc_modes & DRM_EDID_YCBCR420_DC_48))
+			output_fmts[i++] = MEDIA_BUS_FMT_UYYVYY16_0_5X48;
+
+		if (max_bpc >= 12 && info->bpc >= 12 &&
+		    (info->hdmi.y420_dc_modes & DRM_EDID_YCBCR420_DC_36))
+			output_fmts[i++] = MEDIA_BUS_FMT_UYYVYY12_0_5X36;
+
+		if (max_bpc >= 10 && info->bpc >= 10 &&
+		    (info->hdmi.y420_dc_modes & DRM_EDID_YCBCR420_DC_30))
+			output_fmts[i++] = MEDIA_BUS_FMT_UYYVYY10_0_5X30;
+
+		/* Default 8bit fallback */
+		output_fmts[i++] = MEDIA_BUS_FMT_UYYVYY8_0_5X24;
+
+		*num_output_fmts = i;
+
+		return output_fmts;
+	}
+
+	/*
+	 * Order bus formats from 16bit to 8bit and from YUV422 to RGB
+	 * if supported. In any case the default RGB888 format is added
+	 */
+
+	if (max_bpc >= 16 && info->bpc == 16) {
+		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
+			output_fmts[i++] = MEDIA_BUS_FMT_YUV16_1X48;
+
+		output_fmts[i++] = MEDIA_BUS_FMT_RGB161616_1X48;
+	}
+
+	if (max_bpc >= 12 && info->bpc >= 12) {
+		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
+			output_fmts[i++] = MEDIA_BUS_FMT_UYVY12_1X24;
+
+		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
+			output_fmts[i++] = MEDIA_BUS_FMT_YUV12_1X36;
+
+		output_fmts[i++] = MEDIA_BUS_FMT_RGB121212_1X36;
+	}
+
+	if (max_bpc >= 10 && info->bpc >= 10) {
+		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
+			output_fmts[i++] = MEDIA_BUS_FMT_UYVY10_1X20;
+
+		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
+			output_fmts[i++] = MEDIA_BUS_FMT_YUV10_1X30;
+
+		output_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
+	}
+
+	if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
+		output_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
+
+	if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
+		output_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
+
+	/* Default 8bit RGB fallback */
+	output_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
+
+	*num_output_fmts = i;
+
+	return output_fmts;
+}
+EXPORT_SYMBOL_GPL(drm_atomic_helper_bridge_hdmi_get_output_bus_fmts);
+
 /**
  * drm_bridge_detect - check if anything is attached to the bridge output
  * @bridge: bridge control structure
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 2195daa289d2..1d801d77e90a 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -868,6 +868,12 @@ drm_atomic_helper_bridge_propagate_bus_fmt(struct drm_bridge *bridge,
 					u32 output_fmt,
 					unsigned int *num_input_fmts);
 
+u32 *drm_atomic_helper_bridge_hdmi_get_output_bus_fmts(struct drm_bridge *bridge,
+						       struct drm_bridge_state *bridge_state,
+						       struct drm_crtc_state *crtc_state,
+						       struct drm_connector_state *conn_state,
+						       unsigned int *num_output_fmts);
+
 enum drm_connector_status drm_bridge_detect(struct drm_bridge *bridge);
 int drm_bridge_get_modes(struct drm_bridge *bridge,
 			 struct drm_connector *connector);
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
