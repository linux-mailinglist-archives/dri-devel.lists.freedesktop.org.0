Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E553495130
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 16:16:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F52C10E3F0;
	Thu, 20 Jan 2022 15:16:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8BA910E439
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 15:16:42 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 786412B00152;
 Thu, 20 Jan 2022 10:16:41 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 20 Jan 2022 10:16:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; bh=mZfVeEFGmjquV4
 oaqI8IGBHh7wZEfR7YNgwEzuJPoD4=; b=BVRoI5fWy5brz7Gb0a7wAWxdWiqh+S
 fl9Z3xT7uJgXQfiCHvMV7s2XHfvdz0QbNX8H94v8+tygLLI4RoLtsva+OcqsFxrJ
 0IV/41n0BwVlkqrwrGrvkFUby8rRid31MtDcgW0ytVnoSCIcEfN9ovpnXJGNFIrW
 iA8drl0K4FbdKU5esO/Rp/Nf+oD2MD7MkSghjP24YvCQvUP3dk03biOc0H+dJ+6Z
 9irNpt9yTzK8P+14sXe2eS6/W9RaScVkF0EXWdL6tBXN9EfxDL71CRV/XT66RHUr
 +bpQZztYrC5pzZD+IdzSt+iQPqKyAxCTvO1pGL02nNaKN4FeLIOnlWtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=mZfVeEFGmjquV4oaqI8IGBHh7wZEfR7YNgwEzuJPo
 D4=; b=f05EBAoadCdS74dKHTsZ30XwSyPs5a5Y0tnhRPjWR8EkZy2AzgzInmqk7
 SYf1XJ8MTNtEMGvWSvlyZ4/MmZoH/05HO4O+zFHmsh1YVPmlhkfVo2Qb6CYMwYqE
 /q3kfYxExn0e4kkk6wtTPqoER1d0EKlWq6OlNOpd3yTEIzf+OTo2zOjmOoiA7Lm3
 IgM3upYp8A5cAlSO1KnSSZzUgt08NUdmFp2yEwFyBcqkw+0nRTiaPCk7B5Vdt72y
 8SiYVQ+3Sfwi3MVMY4t/pFNMU3dKe3GpvDkmigk0HssaSS+zTGq3K5LG8JeAb5vK
 p5uXU455uFbGcG0cq6VzncUFDx2/Q==
X-ME-Sender: <xms:2HzpYYaDAbHWmzY3RnijP-ZMD7NkW_8G0dcgusI3k2l4JacLzvb0zQ>
 <xme:2HzpYTaATXX3T4JSeyAYuJhh1pO_gTaRky89aduEq3frDWCLHQQHQo3ak_u89wzVC
 WhEiMwjtrO5qGBoB2k>
X-ME-Received: <xmr:2HzpYS9zWJD_D5Ur9pgQG_Nl4k8mWwGRxVqjbq6OsrFGfgG4ziA-UIQeGlzRd9vuiuJy8YczDGJHbtppNQJWN7ACOTDd7V8Uz0n2haQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfefgeei
 keeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:2HzpYSqxXCPrEO5kpOAEGNdRNVMmtuZtju3RCPvER7wZPncWGHcRZQ>
 <xmx:2HzpYTrvnlANnkKKbwbeamWf7ea2DdDErpNOj88i2ohz-t5YBni5fA>
 <xmx:2HzpYQSU-HRfrt5yw0cv2vN28KlASTjT4rBv2H6odwaDlUQl-sV9Ew>
 <xmx:2XzpYQjE52yxQv55YW2a5UyZfDpwpdYIATWCjNxuTmwaXcJS-NHGFYhMeYI>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jan 2022 10:16:40 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v4 03/16] drm/edid: Split deep color modes between RGB and
 YUV444
Date: Thu, 20 Jan 2022 16:16:12 +0100
Message-Id: <20220120151625.594595-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120151625.594595-1-maxime@cerno.tech>
References: <20220120151625.594595-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The current code assumes that the RGB444 and YUV444 formats are the
same, but the HDMI 2.0 specification states that:

   The three DC_XXbit bits above only indicate support for RGB 4:4:4 at
   that pixel size. Support for YCBCR 4:4:4 in Deep Color modes is
   indicated with the DC_Y444 bit. If DC_Y444 is set, then YCBCR 4:4:4
   is supported for all modes indicated by the DC_XXbit flags.

So if we have YUV444 support and any DC_XXbit flag set but the DC_Y444
flag isn't, we'll assume that we support that deep colour mode for
YUV444 which breaks the specification.

In order to fix this, let's split the edid_hdmi_dc_modes field in struct
drm_display_info into two fields, one for RGB444 and one for YUV444.

Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Fixes: d0c94692e0a3 ("drm/edid: Parse and handle HDMI deep color modes.")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c |  2 +-
 drivers/gpu/drm/drm_edid.c                     |  7 ++++---
 drivers/gpu/drm/i915/display/intel_hdmi.c      |  4 ++--
 drivers/gpu/drm/radeon/radeon_connectors.c     |  2 +-
 include/drm/drm_connector.h                    | 12 +++++++++---
 5 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
index c16a2704ced6..f3160b951df3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
@@ -175,7 +175,7 @@ int amdgpu_connector_get_monitor_bpc(struct drm_connector *connector)
 
 			/* Check if bpc is within clock limit. Try to degrade gracefully otherwise */
 			if ((bpc == 12) && (mode_clock * 3/2 > max_tmds_clock)) {
-				if ((connector->display_info.edid_hdmi_dc_modes & DRM_EDID_HDMI_DC_30) &&
+				if ((connector->display_info.edid_hdmi_rgb444_dc_modes & DRM_EDID_HDMI_DC_30) &&
 				    (mode_clock * 5/4 <= max_tmds_clock))
 					bpc = 10;
 				else
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 5085ef08c22d..471b577dca79 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5075,21 +5075,21 @@ static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
 
 	if (hdmi[6] & DRM_EDID_HDMI_DC_30) {
 		dc_bpc = 10;
-		info->edid_hdmi_dc_modes |= DRM_EDID_HDMI_DC_30;
+		info->edid_hdmi_rgb444_dc_modes |= DRM_EDID_HDMI_DC_30;
 		DRM_DEBUG("%s: HDMI sink does deep color 30.\n",
 			  connector->name);
 	}
 
 	if (hdmi[6] & DRM_EDID_HDMI_DC_36) {
 		dc_bpc = 12;
-		info->edid_hdmi_dc_modes |= DRM_EDID_HDMI_DC_36;
+		info->edid_hdmi_rgb444_dc_modes |= DRM_EDID_HDMI_DC_36;
 		DRM_DEBUG("%s: HDMI sink does deep color 36.\n",
 			  connector->name);
 	}
 
 	if (hdmi[6] & DRM_EDID_HDMI_DC_48) {
 		dc_bpc = 16;
-		info->edid_hdmi_dc_modes |= DRM_EDID_HDMI_DC_48;
+		info->edid_hdmi_rgb444_dc_modes |= DRM_EDID_HDMI_DC_48;
 		DRM_DEBUG("%s: HDMI sink does deep color 48.\n",
 			  connector->name);
 	}
@@ -5106,6 +5106,7 @@ static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
 
 	/* YCRCB444 is optional according to spec. */
 	if (hdmi[6] & DRM_EDID_HDMI_DC_Y444) {
+		info->edid_hdmi_ycbcr444_dc_modes = info->edid_hdmi_rgb444_dc_modes;
 		DRM_DEBUG("%s: HDMI sink does YCRCB444 in deep color.\n",
 			  connector->name);
 	}
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 96e508ddc4af..52f6dc248453 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -1912,7 +1912,7 @@ static bool intel_hdmi_sink_bpc_possible(struct drm_connector *connector,
 		if (ycbcr420_output)
 			return hdmi->y420_dc_modes & DRM_EDID_YCBCR420_DC_36;
 		else
-			return info->edid_hdmi_dc_modes & DRM_EDID_HDMI_DC_36;
+			return info->edid_hdmi_rgb444_dc_modes & DRM_EDID_HDMI_DC_36;
 	case 10:
 		if (!has_hdmi_sink)
 			return false;
@@ -1920,7 +1920,7 @@ static bool intel_hdmi_sink_bpc_possible(struct drm_connector *connector,
 		if (ycbcr420_output)
 			return hdmi->y420_dc_modes & DRM_EDID_YCBCR420_DC_30;
 		else
-			return info->edid_hdmi_dc_modes & DRM_EDID_HDMI_DC_30;
+			return info->edid_hdmi_rgb444_dc_modes & DRM_EDID_HDMI_DC_30;
 	case 8:
 		return true;
 	default:
diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
index 607ad5620bd9..1546abcadacf 100644
--- a/drivers/gpu/drm/radeon/radeon_connectors.c
+++ b/drivers/gpu/drm/radeon/radeon_connectors.c
@@ -204,7 +204,7 @@ int radeon_get_monitor_bpc(struct drm_connector *connector)
 
 			/* Check if bpc is within clock limit. Try to degrade gracefully otherwise */
 			if ((bpc == 12) && (mode_clock * 3/2 > max_tmds_clock)) {
-				if ((connector->display_info.edid_hdmi_dc_modes & DRM_EDID_HDMI_DC_30) &&
+				if ((connector->display_info.edid_hdmi_rgb444_dc_modes & DRM_EDID_HDMI_DC_30) &&
 					(mode_clock * 5/4 <= max_tmds_clock))
 					bpc = 10;
 				else
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index b501d0badaea..eaf0ef5f1843 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -592,10 +592,16 @@ struct drm_display_info {
 	bool rgb_quant_range_selectable;
 
 	/**
-	 * @edid_hdmi_dc_modes: Mask of supported hdmi deep color modes. Even
-	 * more stuff redundant with @bus_formats.
+	 * @edid_hdmi_dc_rgb444_modes: Mask of supported hdmi deep color modes
+	 * in RGB 4:4:4. Even more stuff redundant with @bus_formats.
 	 */
-	u8 edid_hdmi_dc_modes;
+	u8 edid_hdmi_rgb444_dc_modes;
+
+	/**
+	 * @edid_hdmi_dc_ycbcr444_modes: Mask of supported hdmi deep color
+	 * modes in YCbCr 4:4:4. Even more stuff redundant with @bus_formats.
+	 */
+	u8 edid_hdmi_ycbcr444_dc_modes;
 
 	/**
 	 * @cea_rev: CEA revision of the HDMI sink.
-- 
2.34.1

