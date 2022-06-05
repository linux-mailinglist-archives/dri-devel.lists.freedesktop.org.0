Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD4F53DCA1
	for <lists+dri-devel@lfdr.de>; Sun,  5 Jun 2022 17:48:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A761A11211F;
	Sun,  5 Jun 2022 15:48:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1079389CF6
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Jun 2022 15:48:31 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id kq6so11649284ejb.11
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Jun 2022 08:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gSYeiZ7oUoMxWDDyeJI1yXrT7W0Sy61MVFDPsaXV1bw=;
 b=WOYvsyocINozIHqGcfRiCpnuqcO4IrGyPzXIEjOe29K935TN4PJbwbDyoTUny9WQNQ
 RUWn5k0OHVPlgc992Cpzpl/gY0yIi0g8DJJZDwK8NK/5Bv6Pt6jrnlR7PTDrEpKU7964
 FA2bfzY4YtAXFUElGKZCogRhqQblkOhzz+iAJf3P1zfYmniTa8XTJDV1UEJ7EsWcP+2c
 2WhZXCQo7rJ7/UzNeE2xCP+kk57+BwRW6XITzWGxorfiha4lNPtIEp5QUQj5C040yX7w
 SkbngIF9Lcdj6n0UtEwcfab39l9n0sOabxeSy2IyL00bdzBV5L68pShN/lrcYqTzfhoI
 FPfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gSYeiZ7oUoMxWDDyeJI1yXrT7W0Sy61MVFDPsaXV1bw=;
 b=3GsUmx40NzdfO/THlWp7nbnL1NINEdhM7FK+JjwRImFouy2/gLAqVVbbAKjviUFVbQ
 TcmpCYvKRWMG7ulqHFofnEXIp6O7T35bnX5xTumPOQx0wdCSZoezyGOgpReACqehazdx
 +H/1skVntyfofVmmK5p77srqeK6YUxAESzC1WQdBOK9Uts8tk4NQOYNfnKlQQS5SaW8r
 Ko87uObe9EktbgkKAlfyBUBD2iE5UAjmxcfPWpIjhE82xaIfRSUf7Og80gKcXVlvcazX
 0rNDBtffyymjcV5NahHpUvrTTV5S5Empnim/UcVTBJrtQdPKz2kS5zQ6n+UuK25YyaJo
 4weQ==
X-Gm-Message-State: AOAM532xzGQ75qQDD6D5CWosUQdwuw7pxZJfRXIRUrQbPrWc448xeJeX
 E0W1AZ88UQtet4Zu0GDJdyk=
X-Google-Smtp-Source: ABdhPJyvaw+jUONXuZAqYG6ccuSBvU2Jo+1Jj8wzG47cJpWoDIljKct9zXPGtXnTQqA2gDZU9TFoIg==
X-Received: by 2002:a17:907:3d8a:b0:710:c2e8:79f2 with SMTP id
 he10-20020a1709073d8a00b00710c2e879f2mr7042974ejc.577.1654444109397; 
 Sun, 05 Jun 2022 08:48:29 -0700 (PDT)
Received: from orangepi3.mydomain.example ([195.234.74.2])
 by smtp.gmail.com with ESMTPSA id
 y24-20020a170906071800b006feed200464sm5329004ejb.131.2022.06.05.08.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jun 2022 08:48:28 -0700 (PDT)
From: Roman Stratiienko <r.stratiienko@gmail.com>
X-Google-Original-From: Roman Stratiienko <roman.o.stratiienko@globallogic.com>
To: mripard@kernel.org, wens@csie.org, jernej.skrabec@gmail.com,
 airlied@linux.ie, daniel@ffwll.ch, samuel@sholland.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, megi@xff.cz
Subject: [PATCH] drm/sun4i: sun8i: Add support for pixel blend mode property
Date: Sun,  5 Jun 2022 15:47:31 +0000
Message-Id: <20220605154731.17362-1-roman.o.stratiienko@globallogic.com>
X-Mailer: git-send-email 2.30.2
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
Cc: Roman Stratiienko <roman.o.stratiienko@globallogic.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allwinner DE2 and DE3 hardware support 3 pixel blend modes:
"None", "Pre-multiplied", "Coverage"

Add the blend mode property and route it to the appropriate registers.

Note:
"force_premulti" parameter was added to handle multi-overlay channel
cases in future changes. It must be set to true for cases when more
than 1 overlay layer is used within a channel and at least one of the
overlay layers within a group uses premultiplied blending mode.

Test:
Manually tested all the modes using kmsxx python wrapper with and
without 'force_premulti' flag enabled.

Signed-off-by: Roman Stratiienko <roman.o.stratiienko@globallogic.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.h    |  2 ++
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 48 ++++++++++++++++++++-----
 drivers/gpu/drm/sun4i/sun8i_ui_layer.h |  5 +++
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 49 ++++++++++++++++++++++----
 drivers/gpu/drm/sun4i/sun8i_vi_layer.h |  5 +++
 5 files changed, 94 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index ebfc276b2464..5c05907e26fb 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -65,6 +65,8 @@
 #define SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(n)	(0xf << ((n) << 2))
 #define SUN8I_MIXER_BLEND_ROUTE_PIPE_SHIFT(n)	((n) << 2)
 
+#define SUN8I_MIXER_BLEND_PREMULTIPLY_EN(pipe)	BIT(pipe)
+
 #define SUN8I_MIXER_BLEND_OUTCTL_INTERLACED	BIT(1)
 
 #define SUN50I_MIXER_BLEND_CSC_CTL_EN(ch)	BIT(ch)
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 6ccbbca3176d..29c0d9cca19a 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -58,24 +58,46 @@ static void sun8i_ui_layer_enable(struct sun8i_mixer *mixer, int channel,
 }
 
 static void sun8i_ui_layer_update_alpha(struct sun8i_mixer *mixer, int channel,
-					int overlay, struct drm_plane *plane)
+					int overlay, struct drm_plane *plane,
+					unsigned int zpos, bool force_premulti)
 {
-	u32 mask, val, ch_base;
+	u32 mask, val, ch_base, bld_base;
+	bool in_premulti, out_premulti;
 
+	bld_base = sun8i_blender_base(mixer);
 	ch_base = sun8i_channel_base(mixer, channel);
 
+	in_premulti = plane->state->pixel_blend_mode == DRM_MODE_BLEND_PREMULTI;
+	out_premulti = force_premulti || in_premulti;
+
 	mask = SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_MASK |
-		SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MASK;
+	       SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MASK |
+	       SUN8I_MIXER_CHAN_UI_LAYER_ATTR_BLEND_MASK;
 
 	val = SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA(plane->state->alpha >> 8);
 
-	val |= (plane->state->alpha == DRM_BLEND_ALPHA_OPAQUE) ?
-		SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_PIXEL :
-		SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_COMBINED;
+	if (plane->state->pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE) {
+		val |= SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_LAYER;
+	} else {
+		val |= (plane->state->alpha == DRM_BLEND_ALPHA_OPAQUE) ?
+			       SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_PIXEL :
+			       SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_COMBINED;
+
+		if (in_premulti)
+			val |= SUN8I_MIXER_CHAN_UI_LAYER_ATTR_BLEND_PREMULTI;
+	}
+
+	if (!in_premulti && out_premulti)
+		val |= SUN8I_MIXER_CHAN_UI_LAYER_ATTR_BLEND_COV2PREM;
 
 	regmap_update_bits(mixer->engine.regs,
 			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, overlay),
 			   mask, val);
+
+	regmap_update_bits(
+		mixer->engine.regs, SUN8I_MIXER_BLEND_PREMULTIPLY(bld_base),
+		SUN8I_MIXER_BLEND_PREMULTIPLY_EN(zpos),
+		out_premulti ? SUN8I_MIXER_BLEND_PREMULTIPLY_EN(zpos) : 0);
 }
 
 static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
@@ -274,7 +296,7 @@ static void sun8i_ui_layer_atomic_update(struct drm_plane *plane,
 	sun8i_ui_layer_update_coord(mixer, layer->channel,
 				    layer->overlay, plane, zpos);
 	sun8i_ui_layer_update_alpha(mixer, layer->channel,
-				    layer->overlay, plane);
+				    layer->overlay, plane, zpos, false);
 	sun8i_ui_layer_update_formats(mixer, layer->channel,
 				      layer->overlay, plane);
 	sun8i_ui_layer_update_buffer(mixer, layer->channel,
@@ -332,8 +354,8 @@ struct sun8i_ui_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 {
 	enum drm_plane_type type = DRM_PLANE_TYPE_OVERLAY;
 	int channel = mixer->cfg->vi_num + index;
+	unsigned int plane_cnt, blend_modes;
 	struct sun8i_ui_layer *layer;
-	unsigned int plane_cnt;
 	int ret;
 
 	layer = devm_kzalloc(drm->dev, sizeof(*layer), GFP_KERNEL);
@@ -362,6 +384,16 @@ struct sun8i_ui_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 		return ERR_PTR(ret);
 	}
 
+	blend_modes = BIT(DRM_MODE_BLEND_PREMULTI) |
+		      BIT(DRM_MODE_BLEND_COVERAGE) |
+		      BIT(DRM_MODE_BLEND_PIXEL_NONE);
+
+	ret = drm_plane_create_blend_mode_property(&layer->plane, blend_modes);
+	if (ret) {
+		dev_err(drm->dev, "Couldn't add blend mode property\n");
+		return ERR_PTR(ret);
+	}
+
 	ret = drm_plane_create_zpos_property(&layer->plane, channel,
 					     0, plane_cnt - 1);
 	if (ret) {
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.h b/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
index 43c48cf7bc51..bd3c30e8058d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
@@ -46,6 +46,11 @@
 #define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_LAYER		((1) << 1)
 #define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_COMBINED	((2) << 1)
 
+#define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_BLEND_MASK	GENMASK(17, 16)
+#define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_BLEND_COVERAGE	((0) << 16)
+#define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_BLEND_COV2PREM	((1) << 16)
+#define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_BLEND_PREMULTI	((2) << 16)
+
 struct sun8i_mixer;
 
 struct sun8i_ui_layer {
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 662ba1018cc4..6581fc7d9668 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -52,21 +52,38 @@ static void sun8i_vi_layer_enable(struct sun8i_mixer *mixer, int channel,
 }
 
 static void sun8i_vi_layer_update_alpha(struct sun8i_mixer *mixer, int channel,
-					int overlay, struct drm_plane *plane)
+					int overlay, struct drm_plane *plane,
+					unsigned int zpos, bool force_premulti)
 {
-	u32 mask, val, ch_base;
+	u32 mask, val, ch_base, bld_base;
+	bool in_premulti = false, out_premulti = false;
 
 	ch_base = sun8i_channel_base(mixer, channel);
+	bld_base = sun8i_blender_base(mixer);
 
 	if (mixer->cfg->is_de3) {
+		in_premulti = plane->state->pixel_blend_mode == DRM_MODE_BLEND_PREMULTI;
+		out_premulti = force_premulti || in_premulti;
+
 		mask = SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MASK |
-		       SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_MASK;
+		       SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_MASK |
+		       SUN50I_MIXER_CHAN_VI_LAYER_ATTR_BLEND_MASK;
 		val = SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA
 			(plane->state->alpha >> 8);
 
-		val |= (plane->state->alpha == DRM_BLEND_ALPHA_OPAQUE) ?
-			SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_PIXEL :
-			SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_COMBINED;
+		if (plane->state->pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE) {
+			val |= SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_LAYER;
+		} else {
+			val |= (plane->state->alpha == DRM_BLEND_ALPHA_OPAQUE) ?
+				       SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_PIXEL :
+				       SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_COMBINED;
+
+			if (in_premulti)
+				val |= SUN50I_MIXER_CHAN_VI_LAYER_ATTR_BLEND_PREMULTI;
+		}
+
+		if (!in_premulti && out_premulti)
+			val |= SUN50I_MIXER_CHAN_VI_LAYER_ATTR_BLEND_COV2PREM;
 
 		regmap_update_bits(mixer->engine.regs,
 				   SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base,
@@ -79,6 +96,11 @@ static void sun8i_vi_layer_update_alpha(struct sun8i_mixer *mixer, int channel,
 				   SUN8I_MIXER_FCC_GLOBAL_ALPHA
 					(plane->state->alpha >> 8));
 	}
+
+	regmap_update_bits(
+		mixer->engine.regs, SUN8I_MIXER_BLEND_PREMULTIPLY(bld_base),
+		SUN8I_MIXER_BLEND_PREMULTIPLY_EN(zpos),
+		out_premulti ? SUN8I_MIXER_BLEND_PREMULTIPLY_EN(zpos) : 0);
 }
 
 static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
@@ -408,7 +430,7 @@ static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
 	sun8i_vi_layer_update_coord(mixer, layer->channel,
 				    layer->overlay, plane, zpos);
 	sun8i_vi_layer_update_alpha(mixer, layer->channel,
-				    layer->overlay, plane);
+				    layer->overlay, plane, zpos, false);
 	sun8i_vi_layer_update_formats(mixer, layer->channel,
 				      layer->overlay, plane);
 	sun8i_vi_layer_update_buffer(mixer, layer->channel,
@@ -563,6 +585,19 @@ struct sun8i_vi_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 		}
 	}
 
+	if (mixer->cfg->is_de3) {
+		unsigned int blend_modes = BIT(DRM_MODE_BLEND_PREMULTI) |
+					   BIT(DRM_MODE_BLEND_COVERAGE) |
+					   BIT(DRM_MODE_BLEND_PIXEL_NONE);
+
+		ret = drm_plane_create_blend_mode_property(&layer->plane,
+							   blend_modes);
+		if (ret) {
+			dev_err(drm->dev, "Couldn't add blend mode property\n");
+			return ERR_PTR(ret);
+		}
+	}
+
 	ret = drm_plane_create_zpos_property(&layer->plane, index,
 					     0, plane_cnt - 1);
 	if (ret) {
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.h b/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
index 9939a4cc7a52..ccf91f09f1fe 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
@@ -44,6 +44,11 @@
 #define SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MASK	GENMASK(31, 24)
 #define SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA(x)	((x) << 24)
 
+#define SUN50I_MIXER_CHAN_VI_LAYER_ATTR_BLEND_MASK	GENMASK(17, 16)
+#define SUN50I_MIXER_CHAN_VI_LAYER_ATTR_BLEND_COVERAGE	((0) << 16)
+#define SUN50I_MIXER_CHAN_VI_LAYER_ATTR_BLEND_COV2PREM	((1) << 16)
+#define SUN50I_MIXER_CHAN_VI_LAYER_ATTR_BLEND_PREMULTI	((2) << 16)
+
 #define SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_PIXEL	((0) << 1)
 #define SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_LAYER	((1) << 1)
 #define SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_COMBINED	((2) << 1)
-- 
2.30.2

