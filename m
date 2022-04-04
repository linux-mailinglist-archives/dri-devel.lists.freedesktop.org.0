Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5334F1A2E
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 22:45:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC22910E285;
	Mon,  4 Apr 2022 20:45:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFC6210E32C
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 20:45:47 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id cs16so2731034qvb.8
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 13:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0PBdmR/zKvptHeuRQXb8zsJ4jC5AreNbKL1bP4FxayE=;
 b=X9Jqq8K5fc++UcNh6nAvy/B/jR19NxgF3vJe3aThl3NqUJb84eSShdhWGxi631/YMO
 rUMK1KkfKRJ1CzUOETRqzRm/lhiwRevt4syPxTUL3DlGWv0hfArXbB8krU7evAvMLAlH
 Rwy0mtf1zl3ii4ff/aMZoqoa8/6e+0gUYiXUMXN6vt9KbgvSIJmDJAzDdjOFRUvzu1JC
 E7I6lfjCrWigYL4/XxFwrz/Lwu9BGAVGNoBKbZ8gJFF66uSnD5hlEi0hRE5Q9T+RY4yW
 +rMXTA1kota0YDBcMpY27M1l8uRSQIdeNtT5yjT3EgyLTenGfY66bxSMZevEGgbeoczG
 vm0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0PBdmR/zKvptHeuRQXb8zsJ4jC5AreNbKL1bP4FxayE=;
 b=F9S2LMg5R14xFSqWBOqxAi5VhkI2nvPJBEzL1lqYYYMWVlq3lLvNP+KA0tRo+koA3z
 DHu1Es/fK/wDZBVdZ6kAG9OxZAsL4MBEOh7Qff/u2u0XFkSFZ5OTulRmByUHP2L+0Xia
 Uzjv83Q/Rsf+Nnfravbfvfkb8lqNxzZaH8OcagHR+QuMbdnI80LARK6K5hzeJVl4+cj1
 F8zGcb5SZ3Mz7DI0DusoU7aTj+hhMGoj/n9bpDcXNliPIxk73ApHvoIxhU86WoBlMqhn
 9/cZWJ99zZ781IxIgKwt1W1TGfAb5exEr+AugUZMCxJn/BlzniZBrK3lM4Xp1kJyeK7n
 qBUw==
X-Gm-Message-State: AOAM531q7A3/Ypd9PVGcVcKggfuHo3iUntkasOGH+m46s1oYf+TRpY0V
 HztPbaCegWKKAiYX1Q5Qt8A=
X-Google-Smtp-Source: ABdhPJxxZzhFf1HE/bD7jQPFK+16jnf0RVJrKt0iBNGFmkYOAOBkUUQrJk8F1DwHnZyqVX/zq/I2Aw==
X-Received: by 2002:ad4:596f:0:b0:443:c443:c7b6 with SMTP id
 eq15-20020ad4596f000000b00443c443c7b6mr1364806qvb.112.1649105146951; 
 Mon, 04 Apr 2022 13:45:46 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f4:7cc:26a1:e446:de76:c0b8])
 by smtp.googlemail.com with ESMTPSA id
 m10-20020a05622a054a00b002eb965bbc3esm9630548qtx.93.2022.04.04.13.45.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 13:45:46 -0700 (PDT)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Subject: [PATCH v5 3/9] drm: vkms: Rename `vkms_composer` to `vkms_frame_info`
Date: Mon,  4 Apr 2022 17:45:09 -0300
Message-Id: <20220404204515.42144-4-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220404204515.42144-1-igormtorrente@gmail.com>
References: <20220404204515.42144-1-igormtorrente@gmail.com>
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
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, leandro.ribeiro@collabora.com,
 Melissa Wen <mwen@igalia.com>, dri-devel@lists.freedesktop.org,
 tales.aparecida@gmail.com, ~lkcamp/patches@lists.sr.ht,
 Igor Torrente <igormtorrente@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changes the name of this struct to a more meaningful name.
A name that represents better what this struct is about.

Composer is the code that do the compositing of the planes.
This struct contains information on the frame used in the output
composition. Thus, vkms_frame_info is a better name to represent
this.

V5: Fix a commit message typo(Melissa Wen).

Reviewed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 87 ++++++++++++++--------------
 drivers/gpu/drm/vkms/vkms_drv.h      |  6 +-
 drivers/gpu/drm/vkms/vkms_plane.c    | 38 ++++++------
 3 files changed, 66 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 82f79e508f81..2d946368a561 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -11,11 +11,11 @@
 #include "vkms_drv.h"
 
 static u32 get_pixel_from_buffer(int x, int y, const u8 *buffer,
-				 const struct vkms_composer *composer)
+				 const struct vkms_frame_info *frame_info)
 {
 	u32 pixel;
-	int src_offset = composer->offset + (y * composer->pitch)
-				      + (x * composer->cpp);
+	int src_offset = frame_info->offset + (y * frame_info->pitch)
+					    + (x * frame_info->cpp);
 
 	pixel = *(u32 *)&buffer[src_offset];
 
@@ -26,24 +26,24 @@ static u32 get_pixel_from_buffer(int x, int y, const u8 *buffer,
  * compute_crc - Compute CRC value on output frame
  *
  * @vaddr: address to final framebuffer
- * @composer: framebuffer's metadata
+ * @frame_info: framebuffer's metadata
  *
  * returns CRC value computed using crc32 on the visible portion of
  * the final framebuffer at vaddr_out
  */
 static uint32_t compute_crc(const u8 *vaddr,
-			    const struct vkms_composer *composer)
+			    const struct vkms_frame_info *frame_info)
 {
 	int x, y;
 	u32 crc = 0, pixel = 0;
-	int x_src = composer->src.x1 >> 16;
-	int y_src = composer->src.y1 >> 16;
-	int h_src = drm_rect_height(&composer->src) >> 16;
-	int w_src = drm_rect_width(&composer->src) >> 16;
+	int x_src = frame_info->src.x1 >> 16;
+	int y_src = frame_info->src.y1 >> 16;
+	int h_src = drm_rect_height(&frame_info->src) >> 16;
+	int w_src = drm_rect_width(&frame_info->src) >> 16;
 
 	for (y = y_src; y < y_src + h_src; ++y) {
 		for (x = x_src; x < x_src + w_src; ++x) {
-			pixel = get_pixel_from_buffer(x, y, vaddr, composer);
+			pixel = get_pixel_from_buffer(x, y, vaddr, frame_info);
 			crc = crc32_le(crc, (void *)&pixel, sizeof(u32));
 		}
 	}
@@ -98,8 +98,8 @@ static void x_blend(const u8 *xrgb_src, u8 *xrgb_dst)
  * blend - blend value at vaddr_src with value at vaddr_dst
  * @vaddr_dst: destination address
  * @vaddr_src: source address
- * @dst_composer: destination framebuffer's metadata
- * @src_composer: source framebuffer's metadata
+ * @dst_frame_info: destination framebuffer's metadata
+ * @src_frame_info: source framebuffer's metadata
  * @pixel_blend: blending equation based on plane format
  *
  * Blend the vaddr_src value with the vaddr_dst value using a pixel blend
@@ -111,33 +111,33 @@ static void x_blend(const u8 *xrgb_src, u8 *xrgb_dst)
  * pixel color values
  */
 static void blend(void *vaddr_dst, void *vaddr_src,
-		  struct vkms_composer *dst_composer,
-		  struct vkms_composer *src_composer,
+		  struct vkms_frame_info *dst_frame_info,
+		  struct vkms_frame_info *src_frame_info,
 		  void (*pixel_blend)(const u8 *, u8 *))
 {
 	int i, j, j_dst, i_dst;
 	int offset_src, offset_dst;
 	u8 *pixel_dst, *pixel_src;
 
-	int x_src = src_composer->src.x1 >> 16;
-	int y_src = src_composer->src.y1 >> 16;
+	int x_src = src_frame_info->src.x1 >> 16;
+	int y_src = src_frame_info->src.y1 >> 16;
 
-	int x_dst = src_composer->dst.x1;
-	int y_dst = src_composer->dst.y1;
-	int h_dst = drm_rect_height(&src_composer->dst);
-	int w_dst = drm_rect_width(&src_composer->dst);
+	int x_dst = src_frame_info->dst.x1;
+	int y_dst = src_frame_info->dst.y1;
+	int h_dst = drm_rect_height(&src_frame_info->dst);
+	int w_dst = drm_rect_width(&src_frame_info->dst);
 
 	int y_limit = y_src + h_dst;
 	int x_limit = x_src + w_dst;
 
 	for (i = y_src, i_dst = y_dst; i < y_limit; ++i) {
 		for (j = x_src, j_dst = x_dst; j < x_limit; ++j) {
-			offset_dst = dst_composer->offset
-				     + (i_dst * dst_composer->pitch)
-				     + (j_dst++ * dst_composer->cpp);
-			offset_src = src_composer->offset
-				     + (i * src_composer->pitch)
-				     + (j * src_composer->cpp);
+			offset_dst = dst_frame_info->offset
+				     + (i_dst * dst_frame_info->pitch)
+				     + (j_dst++ * dst_frame_info->cpp);
+			offset_src = src_frame_info->offset
+				     + (i * src_frame_info->pitch)
+				     + (j * src_frame_info->cpp);
 
 			pixel_src = (u8 *)(vaddr_src + offset_src);
 			pixel_dst = (u8 *)(vaddr_dst + offset_dst);
@@ -149,32 +149,33 @@ static void blend(void *vaddr_dst, void *vaddr_src,
 	}
 }
 
-static void compose_plane(struct vkms_composer *primary_composer,
-			  struct vkms_composer *plane_composer,
+static void compose_plane(struct vkms_frame_info *primary_plane_info,
+			  struct vkms_frame_info *plane_frame_info,
 			  void *vaddr_out)
 {
-	struct drm_framebuffer *fb = &plane_composer->fb;
+	struct drm_framebuffer *fb = &plane_frame_info->fb;
 	void *vaddr;
 	void (*pixel_blend)(const u8 *p_src, u8 *p_dst);
 
-	if (WARN_ON(dma_buf_map_is_null(&primary_composer->map[0])))
+	if (WARN_ON(dma_buf_map_is_null(&primary_plane_info->map[0])))
 		return;
 
-	vaddr = plane_composer->map[0].vaddr;
+	vaddr = plane_frame_info->map[0].vaddr;
 
 	if (fb->format->format == DRM_FORMAT_ARGB8888)
 		pixel_blend = &alpha_blend;
 	else
 		pixel_blend = &x_blend;
 
-	blend(vaddr_out, vaddr, primary_composer, plane_composer, pixel_blend);
+	blend(vaddr_out, vaddr, primary_plane_info,
+	      plane_frame_info, pixel_blend);
 }
 
 static int compose_active_planes(void **vaddr_out,
-				 struct vkms_composer *primary_composer,
+				 struct vkms_frame_info *primary_plane_info,
 				 struct vkms_crtc_state *crtc_state)
 {
-	struct drm_framebuffer *fb = &primary_composer->fb;
+	struct drm_framebuffer *fb = &primary_plane_info->fb;
 	struct drm_gem_object *gem_obj = drm_gem_fb_get_obj(fb, 0);
 	const void *vaddr;
 	int i;
@@ -187,10 +188,10 @@ static int compose_active_planes(void **vaddr_out,
 		}
 	}
 
-	if (WARN_ON(dma_buf_map_is_null(&primary_composer->map[0])))
+	if (WARN_ON(dma_buf_map_is_null(&primary_plane_info->map[0])))
 		return -EINVAL;
 
-	vaddr = primary_composer->map[0].vaddr;
+	vaddr = primary_plane_info->map[0].vaddr;
 
 	memcpy(*vaddr_out, vaddr, gem_obj->size);
 
@@ -199,8 +200,8 @@ static int compose_active_planes(void **vaddr_out,
 	 * ((primary <- overlay) <- cursor)
 	 */
 	for (i = 1; i < crtc_state->num_active_planes; i++)
-		compose_plane(primary_composer,
-			      crtc_state->active_planes[i]->composer,
+		compose_plane(primary_plane_info,
+			      crtc_state->active_planes[i]->frame_info,
 			      *vaddr_out);
 
 	return 0;
@@ -222,7 +223,7 @@ void vkms_composer_worker(struct work_struct *work)
 						composer_work);
 	struct drm_crtc *crtc = crtc_state->base.crtc;
 	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
-	struct vkms_composer *primary_composer = NULL;
+	struct vkms_frame_info *primary_plane_info = NULL;
 	struct vkms_plane_state *act_plane = NULL;
 	bool crc_pending, wb_pending;
 	void *vaddr_out = NULL;
@@ -250,16 +251,16 @@ void vkms_composer_worker(struct work_struct *work)
 	if (crtc_state->num_active_planes >= 1) {
 		act_plane = crtc_state->active_planes[0];
 		if (act_plane->base.base.plane->type == DRM_PLANE_TYPE_PRIMARY)
-			primary_composer = act_plane->composer;
+			primary_plane_info = act_plane->frame_info;
 	}
 
-	if (!primary_composer)
+	if (!primary_plane_info)
 		return;
 
 	if (wb_pending)
 		vaddr_out = crtc_state->active_writeback->data[0].vaddr;
 
-	ret = compose_active_planes(&vaddr_out, primary_composer,
+	ret = compose_active_planes(&vaddr_out, primary_plane_info,
 				    crtc_state);
 	if (ret) {
 		if (ret == -EINVAL && !wb_pending)
@@ -267,7 +268,7 @@ void vkms_composer_worker(struct work_struct *work)
 		return;
 	}
 
-	crc32 = compute_crc(vaddr_out, primary_composer);
+	crc32 = compute_crc(vaddr_out, primary_plane_info);
 
 	if (wb_pending) {
 		drm_writeback_signal_completion(&out->wb_connector, 0);
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 0eeea6f93733..2e6342164bef 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -27,7 +27,7 @@ struct vkms_writeback_job {
 	struct dma_buf_map data[DRM_FORMAT_MAX_PLANES];
 };
 
-struct vkms_composer {
+struct vkms_frame_info {
 	struct drm_framebuffer fb;
 	struct drm_rect src, dst;
 	struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
@@ -39,11 +39,11 @@ struct vkms_composer {
 /**
  * vkms_plane_state - Driver specific plane state
  * @base: base plane state
- * @composer: data required for composing computation
+ * @frame_info: data required for composing computation
  */
 struct vkms_plane_state {
 	struct drm_shadow_plane_state base;
-	struct vkms_composer *composer;
+	struct vkms_frame_info *frame_info;
 };
 
 struct vkms_plane {
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 32409e15244b..a56b0f76eddd 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -24,20 +24,20 @@ static struct drm_plane_state *
 vkms_plane_duplicate_state(struct drm_plane *plane)
 {
 	struct vkms_plane_state *vkms_state;
-	struct vkms_composer *composer;
+	struct vkms_frame_info *frame_info;
 
 	vkms_state = kzalloc(sizeof(*vkms_state), GFP_KERNEL);
 	if (!vkms_state)
 		return NULL;
 
-	composer = kzalloc(sizeof(*composer), GFP_KERNEL);
-	if (!composer) {
-		DRM_DEBUG_KMS("Couldn't allocate composer\n");
+	frame_info = kzalloc(sizeof(*frame_info), GFP_KERNEL);
+	if (!frame_info) {
+		DRM_DEBUG_KMS("Couldn't allocate frame_info\n");
 		kfree(vkms_state);
 		return NULL;
 	}
 
-	vkms_state->composer = composer;
+	vkms_state->frame_info = frame_info;
 
 	__drm_gem_duplicate_shadow_plane_state(plane, &vkms_state->base);
 
@@ -54,12 +54,12 @@ static void vkms_plane_destroy_state(struct drm_plane *plane,
 		/* dropping the reference we acquired in
 		 * vkms_primary_plane_update()
 		 */
-		if (drm_framebuffer_read_refcount(&vkms_state->composer->fb))
-			drm_framebuffer_put(&vkms_state->composer->fb);
+		if (drm_framebuffer_read_refcount(&vkms_state->frame_info->fb))
+			drm_framebuffer_put(&vkms_state->frame_info->fb);
 	}
 
-	kfree(vkms_state->composer);
-	vkms_state->composer = NULL;
+	kfree(vkms_state->frame_info);
+	vkms_state->frame_info = NULL;
 
 	__drm_gem_destroy_shadow_plane_state(&vkms_state->base);
 	kfree(vkms_state);
@@ -99,7 +99,7 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
 	struct vkms_plane_state *vkms_plane_state;
 	struct drm_shadow_plane_state *shadow_plane_state;
 	struct drm_framebuffer *fb = new_state->fb;
-	struct vkms_composer *composer;
+	struct vkms_frame_info *frame_info;
 
 	if (!new_state->crtc || !fb)
 		return;
@@ -107,15 +107,15 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
 	vkms_plane_state = to_vkms_plane_state(new_state);
 	shadow_plane_state = &vkms_plane_state->base;
 
-	composer = vkms_plane_state->composer;
-	memcpy(&composer->src, &new_state->src, sizeof(struct drm_rect));
-	memcpy(&composer->dst, &new_state->dst, sizeof(struct drm_rect));
-	memcpy(&composer->fb, fb, sizeof(struct drm_framebuffer));
-	memcpy(&composer->map, &shadow_plane_state->data, sizeof(composer->map));
-	drm_framebuffer_get(&composer->fb);
-	composer->offset = fb->offsets[0];
-	composer->pitch = fb->pitches[0];
-	composer->cpp = fb->format->cpp[0];
+	frame_info = vkms_plane_state->frame_info;
+	memcpy(&frame_info->src, &new_state->src, sizeof(struct drm_rect));
+	memcpy(&frame_info->dst, &new_state->dst, sizeof(struct drm_rect));
+	memcpy(&frame_info->fb, fb, sizeof(struct drm_framebuffer));
+	memcpy(&frame_info->map, &shadow_plane_state->data, sizeof(frame_info->map));
+	drm_framebuffer_get(&frame_info->fb);
+	frame_info->offset = fb->offsets[0];
+	frame_info->pitch = fb->pitches[0];
+	frame_info->cpp = fb->format->cpp[0];
 }
 
 static int vkms_plane_atomic_check(struct drm_plane *plane,
-- 
2.30.2

