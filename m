Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A538C3C72
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 09:50:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6AFF10E43F;
	Mon, 13 May 2024 07:50:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="fzLM/kG1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81BA910E43F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 07:50:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 81FEA2000F;
 Mon, 13 May 2024 07:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1715586634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=235lKbc5F9x8ehSN9onJwGNWhXHykU3vjNOA59kjvYQ=;
 b=fzLM/kG1nHy57PGoffb07/y1ku9KeFzG56q9saqgr9gygEtRnlMTdEo+PQMU85L50iiZwY
 zM37X7j1vCQawLvRq4L1WZJoqsg89vfQM/krA4BnCw93fCAu984b7GIe7qTOp1Z5LsGpeZ
 a26ri71gTzKOCR7qhSwFfwB++kCKtSfDAGcRN3+XVkfBafRLbe8xY/UT+MjhA6vaYL+qNm
 ZkqtjNDFf/OevW3zOhjBYpVw1jo3x0juJARrnHCIk4obicKJtaOv869IcVKU5FVd0JjB38
 0zt49yZqMySmy9LWxbJ9ie290R9OqKtaLAgmlmVZqbD9/Q23pUr9hRTZxSRWVQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 13 May 2024 09:50:22 +0200
Subject: [PATCH v7 01/17] drm/vkms: Code formatting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240513-yuv-v7-1-380e9ffec502@bootlin.com>
References: <20240513-yuv-v7-0-380e9ffec502@bootlin.com>
In-Reply-To: <20240513-yuv-v7-0-380e9ffec502@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org, 
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>, 
 pekka.paalanen@haloniitty.fi
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com, Louis Chauvet <louis.chauvet@bootlin.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4941;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=a1sckBM8E6wq3ndQUDNJANScNUrzo41l6q22HGf3lnU=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmQcZBNRP3q+gkbtdeR5bk34JcfbC2yvwVSgHou
 mOx+FUneQqJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZkHGQQAKCRAgrS7GWxAs
 4vTeD/9KTjHvx4CgbeewMZecdFso8kna8nOd2XWZcJyNyOWzjii3AB5nk4FYY+00RRaPXOU8yzu
 cfeLNxYXay7bdZxyPRbJr4SViTC1cnSh92ZFP3k7Ovfm7SJSawupsL1WFOd5TvbAeyrwEtXi9hY
 mOBeWg7IQOigWjt5nep2edYldRraAZPfrvsUKbbOVSvtfRHnVO74/9xkqlBpaXz+wCxTEIHgoMV
 bById7EKcsdYzTuwoHuSFeozWy3GAtQQL5z/xFDwnZK9zkg/r7Y2OO+7ZImsDS5m6dTZFqXHeat
 4Ym5Nfq+HhOFzqJSNdgxFhIRSDBp/Kqpkb81vlqYrSkzWiBEOtOklZfyr7tjTDYwGOKlQMYxdqu
 aiOYWjWlD0Aau8YOzAt0Uc079fUo10eQKqLmgdvO6tT6cXZuGYWn8PGL57Hl3B3Fbe/6bovOQqL
 AqOU4PGt8vequ4M41Npn72PH9e4VUvm0SQnBnaFzMlJ35kOAGPSqJONpbxanSwqXCUC92XuxcT/
 X7oPrEAtwZldQwBj8e2MrKKBjFDZA/hkADxJQ6MZK0w34nSDhk71nc5OQeyzHSxr7uFHV3QSgvm
 UoWuOUCLNuFJHM5d/yeviIxT8alR8dWiyAr8xnzq+FYGHHFQtuWJVUb4G4pnGlXrYNvd6mc89Mg
 6+0m0Wt9NtiIEZQ==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Few no-op changes to remove double spaces and fix wrong alignments.

Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Reviewed-by: Maíra Canal <mcanal@igalia.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 10 +++++-----
 drivers/gpu/drm/vkms/vkms_crtc.c     |  6 ++----
 drivers/gpu/drm/vkms/vkms_drv.c      |  3 +--
 drivers/gpu/drm/vkms/vkms_plane.c    |  8 ++++----
 4 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index e7441b227b3c..c6d9b4a65809 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -96,7 +96,7 @@ static u16 lerp_u16(u16 a, u16 b, s64 t)
 	s64 a_fp = drm_int2fixp(a);
 	s64 b_fp = drm_int2fixp(b);
 
-	s64 delta = drm_fixp_mul(b_fp - a_fp,  t);
+	s64 delta = drm_fixp_mul(b_fp - a_fp, t);
 
 	return drm_fixp2int(a_fp + delta);
 }
@@ -302,8 +302,8 @@ static int compose_active_planes(struct vkms_writeback_job *active_wb,
 void vkms_composer_worker(struct work_struct *work)
 {
 	struct vkms_crtc_state *crtc_state = container_of(work,
-						struct vkms_crtc_state,
-						composer_work);
+							  struct vkms_crtc_state,
+							  composer_work);
 	struct drm_crtc *crtc = crtc_state->base.crtc;
 	struct vkms_writeback_job *active_wb = crtc_state->active_writeback;
 	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
@@ -328,7 +328,7 @@ void vkms_composer_worker(struct work_struct *work)
 		crtc_state->gamma_lut.base = (struct drm_color_lut *)crtc->state->gamma_lut->data;
 		crtc_state->gamma_lut.lut_length =
 			crtc->state->gamma_lut->length / sizeof(struct drm_color_lut);
-		max_lut_index_fp = drm_int2fixp(crtc_state->gamma_lut.lut_length  - 1);
+		max_lut_index_fp = drm_int2fixp(crtc_state->gamma_lut.lut_length - 1);
 		crtc_state->gamma_lut.channel_value2index_ratio = drm_fixp_div(max_lut_index_fp,
 									       u16_max_fp);
 
@@ -367,7 +367,7 @@ void vkms_composer_worker(struct work_struct *work)
 		drm_crtc_add_crc_entry(crtc, true, frame_start++, &crc32);
 }
 
-static const char * const pipe_crc_sources[] = {"auto"};
+static const char *const pipe_crc_sources[] = { "auto" };
 
 const char *const *vkms_get_crc_sources(struct drm_crtc *crtc,
 					size_t *count)
diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 61e500b8c9da..7586ae2e1dd3 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -191,8 +191,7 @@ static int vkms_crtc_atomic_check(struct drm_crtc *crtc,
 		return ret;
 
 	drm_for_each_plane_mask(plane, crtc->dev, crtc_state->plane_mask) {
-		plane_state = drm_atomic_get_existing_plane_state(crtc_state->state,
-								  plane);
+		plane_state = drm_atomic_get_existing_plane_state(crtc_state->state, plane);
 		WARN_ON(!plane_state);
 
 		if (!plane_state->visible)
@@ -208,8 +207,7 @@ static int vkms_crtc_atomic_check(struct drm_crtc *crtc,
 
 	i = 0;
 	drm_for_each_plane_mask(plane, crtc->dev, crtc_state->plane_mask) {
-		plane_state = drm_atomic_get_existing_plane_state(crtc_state->state,
-								  plane);
+		plane_state = drm_atomic_get_existing_plane_state(crtc_state->state, plane);
 
 		if (!plane_state->visible)
 			continue;
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index dd0af086e7fa..83e6c9b9ff46 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -81,8 +81,7 @@ static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
 	drm_atomic_helper_wait_for_flip_done(dev, old_state);
 
 	for_each_old_crtc_in_state(old_state, crtc, old_crtc_state, i) {
-		struct vkms_crtc_state *vkms_state =
-			to_vkms_crtc_state(old_crtc_state);
+		struct vkms_crtc_state *vkms_state = to_vkms_crtc_state(old_crtc_state);
 
 		flush_work(&vkms_state->composer_work);
 	}
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index e5c625ab8e3e..5a8d295e65f2 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -117,10 +117,10 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
 	memcpy(&frame_info->map, &shadow_plane_state->data, sizeof(frame_info->map));
 	drm_framebuffer_get(frame_info->fb);
 	frame_info->rotation = drm_rotation_simplify(new_state->rotation, DRM_MODE_ROTATE_0 |
-						     DRM_MODE_ROTATE_90 |
-						     DRM_MODE_ROTATE_270 |
-						     DRM_MODE_REFLECT_X |
-						     DRM_MODE_REFLECT_Y);
+									  DRM_MODE_ROTATE_90 |
+									  DRM_MODE_ROTATE_270 |
+									  DRM_MODE_REFLECT_X |
+									  DRM_MODE_REFLECT_Y);
 
 	drm_rect_rotate(&frame_info->rotated, drm_rect_width(&frame_info->rotated),
 			drm_rect_height(&frame_info->rotated), frame_info->rotation);

-- 
2.43.2

