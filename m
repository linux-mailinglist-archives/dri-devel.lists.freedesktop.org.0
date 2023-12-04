Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA84D803435
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 14:16:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28C1A10E1C0;
	Mon,  4 Dec 2023 13:15:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F33B10E257
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 13:15:03 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-50be10acaf9so2382368e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 05:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701695702; x=1702300502; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0rE6lhBU7YLvWGChwbplqtvJzXDkEUrBtUu71JJ4hyI=;
 b=h6wPkaFuBn1MEBLluNz/WlYczjU5gN9wPX3b5PRfBzEk+CWr3IYEKY2Y+HCEdxqAsU
 8ZcUpFGUVMnVidJQvAp/G7o/FnpL0cfk8Iv18NnuzkKpLAR2qmDV46xen4ylVmK4tZoO
 p/2icKSM7eJZgzzXm5JvPzKMeBC+0FehyKTeik5gtg4iWQvjF2/7uGeQM7Xoh0rRcaDi
 z9P0HSNodI4pZ5PVbD7EhiaTeHGjKRHsy4CoSIk4piB6FMX7HJDGn2ZI7UzMP5fIcfqo
 rU31gGGyokU8Bu31ZlcUZhlhnr/CKWbBpc/UKnLGF8cBuYNxof/zy7QSLxhS4Tgb8QRl
 YllQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701695702; x=1702300502;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0rE6lhBU7YLvWGChwbplqtvJzXDkEUrBtUu71JJ4hyI=;
 b=YIx5uto1liyNu2mEaMPm+pc2NDTjRdjycPX/uBSeJUg6xXMc+CuVyPHTej+a3I5GSu
 AYKWBtOQUJo67ppt+/JSU2P50FHzKjuAQhxUKTxzdyKQy55Ia2fZ+VcQcOGYrA12hM01
 XgtvqcEYk1xGs90k69yLXU7U3t+fiHYCUoSaN+ViLTwyl6PqMdZVdki140oo+sC/NoqM
 0xTqR4H1CxmbvV0yzW2Kk0j5UqoPbQ/Aao0b0Xva/B2doFY6n0eWPpXyPMtRwrhBtsMZ
 fTszUh5uZHTfHZvqQhTfgY8MzzdaFhTgE/mXSkzSdW5wa3EU1sq8ILZgKZQCsPYJV7gD
 R7fw==
X-Gm-Message-State: AOJu0YzI9DvyTbrZq6gEKqvOCdmAE5mJmjYTrZU171jYLfg4CLu1xNu2
 On1E9xniYUg9XYrzXVuCSw8jVA==
X-Google-Smtp-Source: AGHT+IFhS7Tf1dloTzZjb34BlPCcQ69FT8FWAktyroXLOjwsZdZD5JVL1divOdF9b6UIbfLL9pfO2Q==
X-Received: by 2002:a19:f808:0:b0:50b:fe40:ada5 with SMTP id
 a8-20020a19f808000000b0050bfe40ada5mr262480lff.2.1701695701645; 
 Mon, 04 Dec 2023 05:15:01 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyyykxt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::227]) by smtp.gmail.com with ESMTPSA id
 br25-20020a056512401900b0050bc59642casm1251924lfb.286.2023.12.04.05.15.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 05:15:01 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 7/7] Revert "drm: Introduce pixel_source DRM plane property"
Date: Mon,  4 Dec 2023 15:13:54 +0200
Message-ID: <20231204131455.19023-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231204131455.19023-1-dmitry.baryshkov@linaro.org>
References: <20231204131455.19023-1-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit e50e5fed41c7eed2db4119645bf3480ec43fec11.

Altough the Solid Fill planes patchset got all reviews and
acknowledgements, it doesn't fulfill requirements for the new uABI. It
has neither corresponding open-source userspace implementation nor the
IGT tests coverage. Reverting this patchset until userspace obligations
are fulfilled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_atomic_state_helper.c |  1 -
 drivers/gpu/drm/drm_atomic_uapi.c         |  4 -
 drivers/gpu/drm/drm_blend.c               | 94 -----------------------
 drivers/gpu/drm/drm_plane.c               | 19 +----
 include/drm/drm_blend.h                   |  2 -
 include/drm/drm_plane.h                   | 21 -----
 6 files changed, 4 insertions(+), 137 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 311b04edf742..54975de44a0e 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -252,7 +252,6 @@ void __drm_atomic_helper_plane_state_reset(struct drm_plane_state *plane_state,
 
 	plane_state->alpha = DRM_BLEND_ALPHA_OPAQUE;
 	plane_state->pixel_blend_mode = DRM_MODE_BLEND_PREMULTI;
-	plane_state->pixel_source = DRM_PLANE_PIXEL_SOURCE_FB;
 
 	if (plane->color_encoding_property) {
 		if (!drm_object_property_get_default_value(&plane->base,
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index bd7140531948..aee4a65d4959 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -562,8 +562,6 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 		state->src_w = val;
 	} else if (property == config->prop_src_h) {
 		state->src_h = val;
-	} else if (property == plane->pixel_source_property) {
-		state->pixel_source = val;
 	} else if (property == plane->alpha_property) {
 		state->alpha = val;
 	} else if (property == plane->blend_mode_property) {
@@ -652,8 +650,6 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
 		*val = state->src_w;
 	} else if (property == config->prop_src_h) {
 		*val = state->src_h;
-	} else if (property == plane->pixel_source_property) {
-		*val = state->pixel_source;
 	} else if (property == plane->alpha_property) {
 		*val = state->alpha;
 	} else if (property == plane->blend_mode_property) {
diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
index fce734cdb85b..6e74de833466 100644
--- a/drivers/gpu/drm/drm_blend.c
+++ b/drivers/gpu/drm/drm_blend.c
@@ -185,25 +185,6 @@
  *		 plane does not expose the "alpha" property, then this is
  *		 assumed to be 1.0
  *
- * pixel_source:
- *	pixel_source is set up with drm_plane_create_pixel_source_property().
- *	It is used to toggle the active source of pixel data for the plane.
- *	The plane will only display data from the set pixel_source -- any
- *	data from other sources will be ignored.
- *
- *	For non-framebuffer sources, if pixel_source is set to a non-framebuffer
- *	and non-NONE source, and the corresponding source property is NULL, then
- *	the atomic commit should return an error.
- *
- *	Possible values:
- *
- *	"NONE":
- *		No active pixel source.
- *		Committing with a NONE pixel source will disable the plane.
- *
- *	"FB":
- *		Framebuffer source set by the "FB_ID" property.
- *
  * Note that all the property extensions described here apply either to the
  * plane or the CRTC (e.g. for the background color, which currently is not
  * exposed and assumed to be black).
@@ -634,78 +615,3 @@ int drm_plane_create_blend_mode_property(struct drm_plane *plane,
 	return 0;
 }
 EXPORT_SYMBOL(drm_plane_create_blend_mode_property);
-
-static const struct drm_prop_enum_list drm_pixel_source_enum_list[] = {
-	{ DRM_PLANE_PIXEL_SOURCE_NONE, "NONE" },
-	{ DRM_PLANE_PIXEL_SOURCE_FB, "FB" },
-};
-
-/**
- * drm_plane_create_pixel_source_property - create a new pixel source property
- * @plane: DRM plane
- * @extra_sources: Bitmask of additional supported pixel_sources for the driver.
- *		   DRM_PLANE_PIXEL_SOURCE_FB and DRM_PLANE_PIXEL_SOURCE_NONE will
- *		   always be enabled as supported sources.
- *
- * This creates a new property describing the current source of pixel data for the
- * plane. The pixel_source will be initialized as DRM_PLANE_PIXEL_SOURCE_FB by default.
- *
- * Drivers can set a custom default source by overriding the pixel_source value in
- * drm_plane_funcs.reset()
- *
- * The property is exposed to userspace as an enumeration property called
- * "pixel_source" and has the following enumeration values:
- *
- * "NONE":
- *	No active pixel source
- *
- * "FB":
- *	Framebuffer pixel source
- *
- * Returns:
- * Zero on success, negative errno on failure.
- */
-int drm_plane_create_pixel_source_property(struct drm_plane *plane,
-					   unsigned long extra_sources)
-{
-	struct drm_device *dev = plane->dev;
-	struct drm_property *prop;
-	static const unsigned int valid_source_mask = BIT(DRM_PLANE_PIXEL_SOURCE_FB) |
-						      BIT(DRM_PLANE_PIXEL_SOURCE_NONE);
-	int i;
-
-	/* FB is supported by default */
-	unsigned long supported_sources = extra_sources |
-					  BIT(DRM_PLANE_PIXEL_SOURCE_FB) |
-					  BIT(DRM_PLANE_PIXEL_SOURCE_NONE);
-
-	if (WARN_ON(supported_sources & ~valid_source_mask))
-		return -EINVAL;
-
-	prop = drm_property_create(dev, DRM_MODE_PROP_ENUM | DRM_MODE_PROP_ATOMIC, "pixel_source",
-			hweight32(supported_sources));
-
-	if (!prop)
-		return -ENOMEM;
-
-	for (i = 0; i < ARRAY_SIZE(drm_pixel_source_enum_list); i++) {
-		int ret;
-
-		if (!test_bit(drm_pixel_source_enum_list[i].type, &supported_sources))
-			continue;
-
-		ret = drm_property_add_enum(prop, drm_pixel_source_enum_list[i].type,
-				drm_pixel_source_enum_list[i].name);
-		if (ret) {
-			drm_property_destroy(dev, prop);
-
-			return ret;
-		}
-	}
-
-	drm_object_attach_property(&plane->base, prop, DRM_PLANE_PIXEL_SOURCE_FB);
-	plane->pixel_source_property = prop;
-
-	return 0;
-}
-EXPORT_SYMBOL(drm_plane_create_pixel_source_property);
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index c8dbe5ae60cc..9e8e4c60983d 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -953,14 +953,6 @@ bool drm_any_plane_has_format(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_any_plane_has_format);
 
-static bool drm_plane_needs_disable(struct drm_plane_state *state, struct drm_framebuffer *fb)
-{
-	if (state->pixel_source == DRM_PLANE_PIXEL_SOURCE_NONE)
-		return true;
-
-	return state->pixel_source == DRM_PLANE_PIXEL_SOURCE_FB && fb == NULL;
-}
-
 /*
  * __setplane_internal - setplane handler for internal callers
  *
@@ -983,8 +975,8 @@ static int __setplane_internal(struct drm_plane *plane,
 
 	WARN_ON(drm_drv_uses_atomic_modeset(plane->dev));
 
-	/* No visible data means shut it down */
-	if (drm_plane_needs_disable(plane->state, fb)) {
+	/* No fb means shut it down */
+	if (!fb) {
 		plane->old_fb = plane->fb;
 		ret = plane->funcs->disable_plane(plane, ctx);
 		if (!ret) {
@@ -1035,8 +1027,8 @@ static int __setplane_atomic(struct drm_plane *plane,
 
 	WARN_ON(!drm_drv_uses_atomic_modeset(plane->dev));
 
-	/* No visible data means shut it down */
-	if (drm_plane_needs_disable(plane->state, fb))
+	/* No fb means shut it down */
+	if (!fb)
 		return plane->funcs->disable_plane(plane, ctx);
 
 	/*
@@ -1109,9 +1101,6 @@ int drm_mode_setplane(struct drm_device *dev, void *data,
 		return -ENOENT;
 	}
 
-	if (plane->state)
-		plane->state->pixel_source = DRM_PLANE_PIXEL_SOURCE_FB;
-
 	if (plane_req->fb_id) {
 		fb = drm_framebuffer_lookup(dev, file_priv, plane_req->fb_id);
 		if (!fb) {
diff --git a/include/drm/drm_blend.h b/include/drm/drm_blend.h
index 122bbfbaae33..88bdfec3bd88 100644
--- a/include/drm/drm_blend.h
+++ b/include/drm/drm_blend.h
@@ -58,6 +58,4 @@ int drm_atomic_normalize_zpos(struct drm_device *dev,
 			      struct drm_atomic_state *state);
 int drm_plane_create_blend_mode_property(struct drm_plane *plane,
 					 unsigned int supported_modes);
-int drm_plane_create_pixel_source_property(struct drm_plane *plane,
-					   unsigned long extra_sources);
 #endif
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index bc0176ba25be..c6565a6f9324 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -40,12 +40,6 @@ enum drm_scaling_filter {
 	DRM_SCALING_FILTER_NEAREST_NEIGHBOR,
 };
 
-enum drm_plane_pixel_source {
-	DRM_PLANE_PIXEL_SOURCE_NONE,
-	DRM_PLANE_PIXEL_SOURCE_FB,
-	DRM_PLANE_PIXEL_SOURCE_MAX
-};
-
 /**
  * struct drm_plane_state - mutable plane state
  *
@@ -126,14 +120,6 @@ struct drm_plane_state {
 	/** @hotspot_y: y offset to mouse cursor hotspot */
 	int32_t hotspot_x, hotspot_y;
 
-	/**
-	 * @pixel_source:
-	 *
-	 * Source of pixel information for the plane. See
-	 * drm_plane_create_pixel_source_property() for more details.
-	 */
-	enum drm_plane_pixel_source pixel_source;
-
 	/**
 	 * @alpha:
 	 * Opacity of the plane with 0 as completely transparent and 0xffff as
@@ -727,13 +713,6 @@ struct drm_plane {
 	 */
 	struct drm_plane_state *state;
 
-	/*
-	 * @pixel_source_property:
-	 * Optional pixel_source property for this plane. See
-	 * drm_plane_create_pixel_source_property().
-	 */
-	struct drm_property *pixel_source_property;
-
 	/**
 	 * @alpha_property:
 	 * Optional alpha property for this plane. See
-- 
2.42.0

