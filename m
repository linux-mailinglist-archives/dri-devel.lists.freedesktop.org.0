Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBF96BCB10
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 10:38:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6595910E136;
	Thu, 16 Mar 2023 09:37:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8773510E0A4;
 Thu, 16 Mar 2023 09:37:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2CCD01FE06;
 Thu, 16 Mar 2023 09:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678959461; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BVCZuoinCm5dkHSGaZCqVuJxY9/WWI8IltqiuzMumX0=;
 b=Ik/QOh+bbKXT8qYEbBgp6cBvCnoYVsO6kLpYVvacP06xMyvr20TMsSAFhjMkjgtmUuOAlL
 /2HE1/TlZjBYjzhzokFJA68dW5Wv45lOw2d+A40K9AYBN+1DncbTMz2G0FIcUBKLkKJ7VX
 aJUJKTrixD1YSOm1Yi26QsF7mKfmamQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678959461;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BVCZuoinCm5dkHSGaZCqVuJxY9/WWI8IltqiuzMumX0=;
 b=fJCpLCDDl5+q1QvO5hurZDifiqkvp3T3ilw9uipGYXS44KdVzTBxOuxdr3KqIU0SzqK9Le
 ZGy0ehdnBtheSYAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F25A413A71;
 Thu, 16 Mar 2023 09:37:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YFJeOmTjEmSORwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 16 Mar 2023 09:37:40 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, javierm@redhat.com
Subject: [PATCH 06/10] drm/radeon: Fix coding style in fbdev emulation
Date: Thu, 16 Mar 2023 10:37:34 +0100
Message-Id: <20230316093738.28866-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230316093738.28866-1-tzimmermann@suse.de>
References: <20230316093738.28866-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the coding style in several places in the fbdev-emulation
code. Also rename functions and structure file by comments. No
functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/radeon/radeon_fb.c | 81 +++++++++++++++++-------------
 1 file changed, 46 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_fb.c b/drivers/gpu/drm/radeon/radeon_fb.c
index 152563c6e55a..f55aaea10406 100644
--- a/drivers/gpu/drm/radeon/radeon_fb.c
+++ b/drivers/gpu/drm/radeon/radeon_fb.c
@@ -40,7 +40,7 @@
 
 #include "radeon.h"
 
-static void radeonfb_destroy_pinned_object(struct drm_gem_object *gobj)
+static void radeon_fbdev_destroy_pinned_object(struct drm_gem_object *gobj)
 {
 	struct radeon_bo *rbo = gem_to_radeon_bo(gobj);
 	int ret;
@@ -54,9 +54,9 @@ static void radeonfb_destroy_pinned_object(struct drm_gem_object *gobj)
 	drm_gem_object_put(gobj);
 }
 
-static int radeonfb_create_pinned_object(struct drm_fb_helper *fb_helper,
-					 struct drm_mode_fb_cmd2 *mode_cmd,
-					 struct drm_gem_object **gobj_p)
+static int radeon_fbdev_create_pinned_object(struct drm_fb_helper *fb_helper,
+					     struct drm_mode_fb_cmd2 *mode_cmd,
+					     struct drm_gem_object **gobj_p)
 {
 	const struct drm_format_info *info;
 	struct radeon_device *rdev = fb_helper->dev->dev_private;
@@ -113,64 +113,71 @@ static int radeonfb_create_pinned_object(struct drm_fb_helper *fb_helper,
 			dev_err(rdev->dev, "FB failed to set tiling flags\n");
 	}
 
-
 	ret = radeon_bo_reserve(rbo, false);
 	if (unlikely(ret != 0))
-		goto out_unref;
+		goto err_radeon_fbdev_destroy_pinned_object;
 	/* Only 27 bit offset for legacy CRTC */
 	ret = radeon_bo_pin_restricted(rbo, RADEON_GEM_DOMAIN_VRAM,
 				       ASIC_IS_AVIVO(rdev) ? 0 : 1 << 27,
 				       NULL);
 	if (ret) {
 		radeon_bo_unreserve(rbo);
-		goto out_unref;
+		goto err_radeon_fbdev_destroy_pinned_object;
 	}
 	if (fb_tiled)
 		radeon_bo_check_tiling(rbo, 0, 0);
 	ret = radeon_bo_kmap(rbo, NULL);
 	radeon_bo_unreserve(rbo);
 	if (ret)
-		goto out_unref;
+		goto err_radeon_fbdev_destroy_pinned_object;
 
 	*gobj_p = gobj;
 	return 0;
-out_unref:
-	radeonfb_destroy_pinned_object(gobj);
+
+err_radeon_fbdev_destroy_pinned_object:
+	radeon_fbdev_destroy_pinned_object(gobj);
 	*gobj_p = NULL;
 	return ret;
 }
 
-static int
-radeonfb_open(struct fb_info *info, int user)
+/*
+ * Fbdev ops and struct fb_ops
+ */
+
+static int radeon_fbdev_fb_open(struct fb_info *info, int user)
 {
 	struct drm_fb_helper *fb_helper = info->par;
 	struct radeon_device *rdev = fb_helper->dev->dev_private;
-	int ret = pm_runtime_get_sync(rdev->ddev->dev);
+	int ret;
+
+	ret = pm_runtime_get_sync(rdev->ddev->dev);
+	if (ret < 0 && ret != -EACCES)
+		goto err_pm_runtime_mark_last_busy;
 
-	if (ret < 0 && ret != -EACCES) {
-		pm_runtime_mark_last_busy(rdev->ddev->dev);
-		pm_runtime_put_autosuspend(rdev->ddev->dev);
-		return ret;
-	}
 	return 0;
+
+err_pm_runtime_mark_last_busy:
+	pm_runtime_mark_last_busy(rdev->ddev->dev);
+	pm_runtime_put_autosuspend(rdev->ddev->dev);
+	return ret;
 }
 
-static int
-radeonfb_release(struct fb_info *info, int user)
+static int radeon_fbdev_fb_release(struct fb_info *info, int user)
 {
 	struct drm_fb_helper *fb_helper = info->par;
 	struct radeon_device *rdev = fb_helper->dev->dev_private;
 
 	pm_runtime_mark_last_busy(rdev->ddev->dev);
 	pm_runtime_put_autosuspend(rdev->ddev->dev);
+
 	return 0;
 }
 
-static const struct fb_ops radeonfb_ops = {
+static const struct fb_ops radeon_fbdev_fb_ops = {
 	.owner = THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
-	.fb_open = radeonfb_open,
-	.fb_release = radeonfb_release,
+	.fb_open = radeon_fbdev_fb_open,
+	.fb_release = radeon_fbdev_fb_release,
 	.fb_read = drm_fb_helper_cfb_read,
 	.fb_write = drm_fb_helper_cfb_write,
 	.fb_fillrect = drm_fb_helper_cfb_fillrect,
@@ -178,10 +185,14 @@ static const struct fb_ops radeonfb_ops = {
 	.fb_imageblit = drm_fb_helper_cfb_imageblit,
 };
 
-static int radeonfb_create(struct drm_fb_helper *helper,
-			   struct drm_fb_helper_surface_size *sizes)
+/*
+ * Fbdev helpers and struct drm_fb_helper_funcs
+ */
+
+static int radeon_fbdev_fb_helper_fb_probe(struct drm_fb_helper *fb_helper,
+					   struct drm_fb_helper_surface_size *sizes)
 {
-	struct radeon_device *rdev = helper->dev->dev_private;
+	struct radeon_device *rdev = fb_helper->dev->dev_private;
 	struct fb_info *info;
 	struct drm_framebuffer *fb = NULL;
 	struct drm_mode_fb_cmd2 mode_cmd;
@@ -200,7 +211,7 @@ static int radeonfb_create(struct drm_fb_helper *helper,
 	mode_cmd.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
 							  sizes->surface_depth);
 
-	ret = radeonfb_create_pinned_object(helper, &mode_cmd, &gobj);
+	ret = radeon_fbdev_create_pinned_object(fb_helper, &mode_cmd, &gobj);
 	if (ret) {
 		DRM_ERROR("failed to create fbcon object %d\n", ret);
 		return ret;
@@ -209,7 +220,7 @@ static int radeonfb_create(struct drm_fb_helper *helper,
 	rbo = gem_to_radeon_bo(gobj);
 
 	/* okay we have an object now allocate the framebuffer */
-	info = drm_fb_helper_alloc_info(helper);
+	info = drm_fb_helper_alloc_info(fb_helper);
 	if (IS_ERR(info)) {
 		ret = PTR_ERR(info);
 		goto out;
@@ -231,11 +242,11 @@ static int radeonfb_create(struct drm_fb_helper *helper,
 	}
 
 	/* setup helper */
-	helper->fb = fb;
+	fb_helper->fb = fb;
 
 	memset_io(rbo->kptr, 0x0, radeon_bo_size(rbo));
 
-	info->fbops = &radeonfb_ops;
+	info->fbops = &radeon_fbdev_fb_ops;
 
 	tmp = radeon_bo_gpu_offset(rbo) - rdev->mc.vram_start;
 	info->fix.smem_start = rdev->mc.aper_base + tmp;
@@ -243,7 +254,7 @@ static int radeonfb_create(struct drm_fb_helper *helper,
 	info->screen_base = rbo->kptr;
 	info->screen_size = radeon_bo_size(rbo);
 
-	drm_fb_helper_fill_info(info, helper, sizes);
+	drm_fb_helper_fill_info(info, fb_helper, sizes);
 
 	/* Use default scratch pixmap (info->pixmap.flags = FB_PIXMAP_SYSTEM) */
 
@@ -274,7 +285,7 @@ static int radeon_fbdev_destroy(struct drm_device *dev, struct drm_fb_helper *fb
 
 	if (fb) {
 		if (fb->obj[0]) {
-			radeonfb_destroy_pinned_object(fb->obj[0]);
+			radeon_fbdev_destroy_pinned_object(fb->obj[0]);
 			fb->obj[0] = NULL;
 			drm_framebuffer_unregister_private(fb);
 			drm_framebuffer_cleanup(fb);
@@ -287,8 +298,8 @@ static int radeon_fbdev_destroy(struct drm_device *dev, struct drm_fb_helper *fb
 	return 0;
 }
 
-static const struct drm_fb_helper_funcs radeon_fb_helper_funcs = {
-	.fb_probe = radeonfb_create,
+static const struct drm_fb_helper_funcs radeon_fbdev_fb_helper_funcs = {
+	.fb_probe = radeon_fbdev_fb_helper_fb_probe,
 };
 
 int radeon_fbdev_init(struct radeon_device *rdev)
@@ -312,7 +323,7 @@ int radeon_fbdev_init(struct radeon_device *rdev)
 	if (!fb_helper)
 		return -ENOMEM;
 
-	drm_fb_helper_prepare(rdev->ddev, fb_helper, bpp_sel, &radeon_fb_helper_funcs);
+	drm_fb_helper_prepare(rdev->ddev, fb_helper, bpp_sel, &radeon_fbdev_fb_helper_funcs);
 
 	ret = drm_fb_helper_init(rdev->ddev, fb_helper);
 	if (ret)
-- 
2.39.2

