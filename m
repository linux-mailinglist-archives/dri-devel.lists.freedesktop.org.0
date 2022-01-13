Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF2248D96A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 15:07:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B37310E347;
	Thu, 13 Jan 2022 14:07:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BE3C10E347
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 14:07:33 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id A63B45807F4;
 Thu, 13 Jan 2022 09:07:32 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 13 Jan 2022 09:07:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
 mZfVeEFGmjquV4oaqI8IGBHh7wZEfR7YNgwEzuJPoD4=; b=P3EZEDUtCQWLAKSD
 CFrDtGe3tYKxbmByirnGNfOIab51n9zvyHWqzRc7jbGr/Q2x7Sd1QBj5ASR9Jw8h
 KMGlyTEVknGHoMsifFt05d2FmI4j2usLpq4Dqi+dACtyu/fUDW/1e78sSZei7ia0
 3+SsbZu55EYvDVLmbIf19qERyYckfbqLLMYv+Ma2UAbjWi4h6BFJWGo4JnykIctI
 xNbHiv9pNxNIvK+PY+d35SFVIsAKmhbf8eXjsYTVJ+l8Rqsx+udpO3LucPq3/uLs
 7dYJ9ZJD2Ja1xLGSzhmYsk2UdxSnwXY6uevp/araHwCj2GEKQmVzNYPLSi229//d
 xHTKYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=mZfVeEFGmjquV4oaqI8IGBHh7wZEfR7YNgwEzuJPo
 D4=; b=RjgO8WnFFPX+Tjl7XuyGI7LyB7wCYObHmA5HL5Cry7uTIiyU5pm+T77HP
 d7GP/7epUydMg/WmO/xM8o/+M7t7UZHhDz2ZSPdwXDyOIuAsLlxPORw1aa349hH1
 pJf1bAM+S7zTtv7wT/1G65aKcwzlTQJ14NMsIzEIOYk8DsArngng9pGQ84Kx3S5y
 8XE9qyD9oirbeNxq0w2RcN6mScqUGAqklM0WkVY+1lKkcLLYgnbUtD/r4By/C52c
 Q/53vfmAagCjrbpFEY72gLZTw4wUQxgvh+pIfxHn/gKDYOYaT7kG8akAj9RNatjz
 upz+OjlOwRi0BaAiukW9MG57OZ07A==
X-ME-Sender: <xms:JDLgYfOQetyVJF-U326-BCpiaXTgh9PYmV9qUQhjvQeLbdPYKv1ZVg>
 <xme:JDLgYZ8lZKAmS4vAKoZ_w2KAJDgSucFH5v33zX1XvKk4N-v74ibE30VRDK04qqGo7
 4NL-MDaKS7xDgYexig>
X-ME-Received: <xmr:JDLgYeQ2ZcyQl-IM5TcOcnWuorYv4QLuSzOhRuzKewX9D5CK_fPwWW6bvWHQnKRblckUDDqvHw9dsbUEQ5Z-b2tszJfGJjA7fep6D2M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrtdefgdehlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfefgeei
 keeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:JDLgYTujfI37xPuszYz8-BjtmXJJ6jmJIZAagqJlsfF0Id8pfpO56Q>
 <xmx:JDLgYXdGYBnkR_C5Hlxtqzer8QTp27JbEeaEcLv9OUCXuqLBEo5yJQ>
 <xmx:JDLgYf2G5_Wkw9QzEmcrx_QP740x6Sttx0Ehr_V8PM-1BfYqApV2hw>
 <xmx:JDLgYYVkUVB1x4U2o1VkDD04jUPNTUP6LyYXw1uQV2uZvyLajTVI7A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Jan 2022 09:07:31 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 03/16] drm/edid: Split deep color modes between RGB and
 YUV444
Date: Thu, 13 Jan 2022 15:07:07 +0100
Message-Id: <20220113140720.1678907-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220113140720.1678907-1-maxime@cerno.tech>
References: <20220113140720.1678907-1-maxime@cerno.tech>
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
 Werner Sembach <wse@tuxedocomputers.com>, dri-devel@lists.freedesktop.org,
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

