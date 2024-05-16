Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CC68C771B
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 15:05:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BD9910ECF8;
	Thu, 16 May 2024 13:05:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="m2JIY/T7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E1110ECEE
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 13:05:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 25B3FC0008;
 Thu, 16 May 2024 13:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1715864713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cX8s4dgS2RrTUUoJEi7rl/OnaPd6xhS+2Ny907fZNcM=;
 b=m2JIY/T7P4Mo3hO1Egwg5xhLPVJ9N5aYi9iolTr24tTRAq+qfBCUeVkze9bJfVrsehNYEu
 OKVeJqsfGmMiH0CDWgNXEa92F8maVYcc4gs5Jnwv2qfBPEOZTf+JUSSDWkdXW371x7r3A3
 /eh4sLjzCfu/bVP3OA/REMdcQm3E6rGJMmN78R7Ua1YUEVvG8iXCqoZQEXOSFwb1922DNz
 yrSG9EqieDNBU1NNSeIJY9QODnrxneQSK83TkNSGZ8tV4cBOg408hU7toBIBChkURaxdJB
 nyFQG0XDoPkBi4CJg2phau/nhG1H9znb4EKxvXnSQqSPI676NlgyMHsZ3sFO+Q==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 16 May 2024 15:04:46 +0200
Subject: [PATCH v8 01/17] drm/vkms: Code formatting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240516-yuv-v8-1-cf8d6f86430e@bootlin.com>
References: <20240516-yuv-v8-0-cf8d6f86430e@bootlin.com>
In-Reply-To: <20240516-yuv-v8-0-cf8d6f86430e@bootlin.com>
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
 bh=dHZ1IzsxPVmyWWUeG+eZL7CVMTGSdI3sCjouIUqPt4A=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmRgR/6/Zm7ZBcQgwSbwUMnOGne8K68WqJwdTX1
 HwcrcGR2hKJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZkYEfwAKCRAgrS7GWxAs
 4qO1D/9/OLNkII9qvmj0+ylOy9YnvtlAzKN8jD39qkC/MG+rXBtdEMC/ENmIT7Q2S1Ru/7nk6Rf
 z65cuZT5DBLJIbUq08EbaR+aXnsn8X7QJ1Ga9LsxrbDu3IjJRckSHaMB24VNA21YTvmo/TOjVyX
 +z/jYC6qgkMG2sIMYAgtgOVjUYVNYQgI9g7TX+zmvSn8pe3iOSK6fIQTmggtmSNceb922gp6rKU
 i2ehijYpakFQByZ7HL+gHbmSDo6iRkk1vfv5ZJwHK6i94y+9QQtd1RglAKMas2yQ1TzqzrMlieR
 aR+MkMGD9Xm4jj99AkYCqimBUqDDVXjGZPHzFhqQzxyC0g+GysrC8OyRQ6tS3chw4y93HyzD8FM
 5NaO+iYZMatbeIU2qaT0JSfpoKgak2KUHtU0JsbxiOC5zrQmTGPqkok95ECKgb47lYQQ5xo8L7H
 JyObt21EciR8A4TaxmEdmdBOafrgSqCgXQRm5CczvCqydRoeZcu6o+iYFN9TUEET/QJ8hy2yjGJ
 LrvxGHotKhE6wa7+pQDt1awSlBFUUrj8uZ8mV5aML0qQqMk4nq3k8sod8EGPjmSlNmOgS93Jhlo
 ck61p/+tKgw69sb/xZCBklF/bmTTkGOOn9r2xrLbw0vxVGolN+77LZWJdbm+0uLO2tnsDx7WFhX
 zG0U+HzZQrjvdhA==
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
index 40b4d084e3ce..06e28305d660 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -188,8 +188,7 @@ static int vkms_crtc_atomic_check(struct drm_crtc *crtc,
 		return ret;
 
 	drm_for_each_plane_mask(plane, crtc->dev, crtc_state->plane_mask) {
-		plane_state = drm_atomic_get_existing_plane_state(crtc_state->state,
-								  plane);
+		plane_state = drm_atomic_get_existing_plane_state(crtc_state->state, plane);
 		WARN_ON(!plane_state);
 
 		if (!plane_state->visible)
@@ -205,8 +204,7 @@ static int vkms_crtc_atomic_check(struct drm_crtc *crtc,
 
 	i = 0;
 	drm_for_each_plane_mask(plane, crtc->dev, crtc_state->plane_mask) {
-		plane_state = drm_atomic_get_existing_plane_state(crtc_state->state,
-								  plane);
+		plane_state = drm_atomic_get_existing_plane_state(crtc_state->state, plane);
 
 		if (!plane_state->visible)
 			continue;
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 8dc9dc13896e..6860bee8e981 100644
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

