Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE0B751B7A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 10:25:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00AA810E191;
	Thu, 13 Jul 2023 08:25:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B279510E627
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 08:25:13 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrcf-0005tH-0u; Thu, 13 Jul 2023 10:24:25 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrce-00E4jg-6F; Thu, 13 Jul 2023 10:24:24 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrcd-004VhH-J9; Thu, 13 Jul 2023 10:24:23 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Julia Lawall <julia.lawall@inria.fr>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sui Jingfeng <suijingfeng@loongson.cn>,
 Luben Tuikov <luben.tuikov@amd.com>, Jani Nikula <jani.nikula@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Sean Paul <seanpaul@chromium.org>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 09/17] drm/fb_helper: Rename struct drm_fb_helper::dev to drm
Date: Thu, 13 Jul 2023 10:24:00 +0200
Message-Id: <20230713082408.2266984-10-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
References: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=23631;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=xSJu93MIjI+hWgjzviz4RYJps8GL31qyS6/8poE4srI=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkr7STMYljckdZaJtlrW2i6XHvv9221mJNEWUMW
 Zthnc3pIs6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK+0kwAKCRCPgPtYfRL+
 ToIXB/92GI9vleZJDV83IJmuIZWg3DLFArCA6PiIksLimJGQyALTP1zv5SUZ6THmONgurp/2Xni
 J1lBZVDYd+AXaeuQymu6hcjZKpd+2Chj2pKxJv9D/szVg9mTf5qQQjMsjChLibtbSxG8xEwiKrN
 UZ3UtuiiBTpBa3Awoo7dt8SNXieOlyk3bhS7dWRXrLJvLa63XfE52p/lNJrcXlCe2sxhnEs4cPS
 7UAU35nfMGpjbcQbgJhebJIxcKbtkXloX+E/82wHyGyhXYfJAyUw+9tcfP0hSsPiB/13ie06vcV
 OEXSlokfEdKtfhsF+hVlnrfaGngxSlTy6Bd6OPmCIau0ZD/Q
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

"dev" is usually used for struct device pointers. Using it for struct
drm_device pointers is irritating (for me at least). Replace it
by "drm" and adapt all users.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/armada/armada_fbdev.c      |  2 +-
 drivers/gpu/drm/drm_fb_helper.c            | 56 +++++++++++-----------
 drivers/gpu/drm/drm_fbdev_dma.c            |  8 ++--
 drivers/gpu/drm/drm_fbdev_generic.c        | 10 ++--
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c  |  4 +-
 drivers/gpu/drm/gma500/fbdev.c             |  2 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c |  6 +--
 drivers/gpu/drm/msm/msm_fbdev.c            |  4 +-
 drivers/gpu/drm/omapdrm/omap_fbdev.c       |  4 +-
 drivers/gpu/drm/radeon/radeon_fbdev.c      | 10 ++--
 drivers/gpu/drm/tegra/fbdev.c              |  4 +-
 include/drm/drm_fb_helper.h                | 10 ++--
 12 files changed, 60 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/armada/armada_fbdev.c b/drivers/gpu/drm/armada/armada_fbdev.c
index 241983120299..c820eb16945b 100644
--- a/drivers/gpu/drm/armada/armada_fbdev.c
+++ b/drivers/gpu/drm/armada/armada_fbdev.c
@@ -42,7 +42,7 @@ static const struct fb_ops armada_fb_ops = {
 static int armada_fbdev_create(struct drm_fb_helper *fbh,
 	struct drm_fb_helper_surface_size *sizes)
 {
-	struct drm_device *dev = fbh->dev;
+	struct drm_device *dev = fbh->drm;
 	struct drm_mode_fb_cmd2 mode;
 	struct armada_framebuffer *dfb;
 	struct armada_gem_object *obj;
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index a8a307c1f40d..9defdfae8495 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -190,7 +190,7 @@ int drm_fb_helper_debug_leave(struct fb_info *info)
 {
 	struct drm_fb_helper *helper = info->par;
 	struct drm_client_dev *client = &helper->client;
-	struct drm_device *dev = helper->dev;
+	struct drm_device *dev = helper->drm;
 	struct drm_crtc *crtc;
 	const struct drm_crtc_helper_funcs *funcs;
 	struct drm_mode_set *mode_set;
@@ -287,7 +287,7 @@ static void drm_fb_helper_restore_work_fn(struct work_struct *ignored)
 
 	mutex_lock(&kernel_fb_helper_lock);
 	list_for_each_entry(helper, &kernel_fb_helper_list, kernel_fb_list) {
-		struct drm_device *dev = helper->dev;
+		struct drm_device *dev = helper->drm;
 
 		if (dev->switch_power_state == DRM_SWITCH_POWER_OFF)
 			continue;
@@ -372,7 +372,7 @@ static void drm_fb_helper_resume_worker(struct work_struct *work)
 
 static void drm_fb_helper_fb_dirty(struct drm_fb_helper *helper)
 {
-	struct drm_device *dev = helper->dev;
+	struct drm_device *dev = helper->drm;
 	struct drm_clip_rect *clip = &helper->damage_clip;
 	struct drm_clip_rect clip_copy;
 	unsigned long flags;
@@ -448,7 +448,7 @@ void drm_fb_helper_prepare(struct drm_device *dev, struct drm_fb_helper *helper,
 	helper->damage_clip.x1 = helper->damage_clip.y1 = ~0;
 	mutex_init(&helper->lock);
 	helper->funcs = funcs;
-	helper->dev = dev;
+	helper->drm = dev;
 	helper->preferred_bpp = preferred_bpp;
 }
 EXPORT_SYMBOL(drm_fb_helper_prepare);
@@ -516,7 +516,7 @@ EXPORT_SYMBOL(drm_fb_helper_init);
  */
 struct fb_info *drm_fb_helper_alloc_info(struct drm_fb_helper *fb_helper)
 {
-	struct device *dev = fb_helper->dev->dev;
+	struct device *dev = fb_helper->drm->dev;
 	struct fb_info *info;
 	int ret;
 
@@ -588,7 +588,7 @@ void drm_fb_helper_fini(struct drm_fb_helper *fb_helper)
 	if (!fb_helper)
 		return;
 
-	fb_helper->dev->fb_helper = NULL;
+	fb_helper->drm->fb_helper = NULL;
 
 	if (!drm_fbdev_emulation)
 		return;
@@ -838,7 +838,7 @@ static int setcmap_legacy(struct fb_cmap *cmap, struct fb_info *info)
 	u16 *r, *g, *b;
 	int ret = 0;
 
-	drm_modeset_lock_all(fb_helper->dev);
+	drm_modeset_lock_all(fb_helper->drm);
 	drm_client_for_each_modeset(modeset, &fb_helper->client) {
 		crtc = modeset->crtc;
 		if (!crtc->funcs->gamma_set || !crtc->gamma_size) {
@@ -865,7 +865,7 @@ static int setcmap_legacy(struct fb_cmap *cmap, struct fb_info *info)
 			goto out;
 	}
 out:
-	drm_modeset_unlock_all(fb_helper->dev);
+	drm_modeset_unlock_all(fb_helper->drm);
 
 	return ret;
 }
@@ -916,7 +916,7 @@ static struct drm_property_blob *setcmap_new_gamma_lut(struct drm_crtc *crtc,
 static int setcmap_atomic(struct fb_cmap *cmap, struct fb_info *info)
 {
 	struct drm_fb_helper *fb_helper = info->par;
-	struct drm_device *dev = fb_helper->dev;
+	struct drm_device *dev = fb_helper->drm;
 	struct drm_property_blob *gamma_lut = NULL;
 	struct drm_modeset_acquire_ctx ctx;
 	struct drm_crtc_state *crtc_state;
@@ -1009,7 +1009,7 @@ static int setcmap_atomic(struct fb_cmap *cmap, struct fb_info *info)
 int drm_fb_helper_setcmap(struct fb_cmap *cmap, struct fb_info *info)
 {
 	struct drm_fb_helper *fb_helper = info->par;
-	struct drm_device *dev = fb_helper->dev;
+	struct drm_device *dev = fb_helper->drm;
 	int ret;
 
 	if (oops_in_progress)
@@ -1025,7 +1025,7 @@ int drm_fb_helper_setcmap(struct fb_cmap *cmap, struct fb_info *info)
 	mutex_lock(&fb_helper->client.modeset_mutex);
 	if (info->fix.visual == FB_VISUAL_TRUECOLOR)
 		ret = setcmap_pseudo_palette(cmap, info);
-	else if (drm_drv_uses_atomic_modeset(fb_helper->dev))
+	else if (drm_drv_uses_atomic_modeset(fb_helper->drm))
 		ret = setcmap_atomic(cmap, info);
 	else
 		ret = setcmap_legacy(cmap, info);
@@ -1052,7 +1052,7 @@ int drm_fb_helper_ioctl(struct fb_info *info, unsigned int cmd,
 			unsigned long arg)
 {
 	struct drm_fb_helper *fb_helper = info->par;
-	struct drm_device *dev = fb_helper->dev;
+	struct drm_device *dev = fb_helper->drm;
 	struct drm_crtc *crtc;
 	int ret = 0;
 
@@ -1221,7 +1221,7 @@ int drm_fb_helper_check_var(struct fb_var_screeninfo *var,
 	struct drm_fb_helper *fb_helper = info->par;
 	struct drm_framebuffer *fb = fb_helper->fb;
 	const struct drm_format_info *format = fb->format;
-	struct drm_device *dev = fb_helper->dev;
+	struct drm_device *dev = fb_helper->drm;
 	unsigned int bpp;
 
 	if (in_dbg_master())
@@ -1386,7 +1386,7 @@ static int pan_display_legacy(struct fb_var_screeninfo *var,
 	int ret = 0;
 
 	mutex_lock(&client->modeset_mutex);
-	drm_modeset_lock_all(fb_helper->dev);
+	drm_modeset_lock_all(fb_helper->drm);
 	drm_client_for_each_modeset(modeset, client) {
 		modeset->x = var->xoffset;
 		modeset->y = var->yoffset;
@@ -1399,7 +1399,7 @@ static int pan_display_legacy(struct fb_var_screeninfo *var,
 			}
 		}
 	}
-	drm_modeset_unlock_all(fb_helper->dev);
+	drm_modeset_unlock_all(fb_helper->drm);
 	mutex_unlock(&client->modeset_mutex);
 
 	return ret;
@@ -1414,7 +1414,7 @@ int drm_fb_helper_pan_display(struct fb_var_screeninfo *var,
 			      struct fb_info *info)
 {
 	struct drm_fb_helper *fb_helper = info->par;
-	struct drm_device *dev = fb_helper->dev;
+	struct drm_device *dev = fb_helper->drm;
 	int ret;
 
 	if (oops_in_progress)
@@ -1442,7 +1442,7 @@ EXPORT_SYMBOL(drm_fb_helper_pan_display);
 static uint32_t drm_fb_helper_find_format(struct drm_fb_helper *fb_helper, const uint32_t *formats,
 					  size_t format_count, uint32_t bpp, uint32_t depth)
 {
-	struct drm_device *dev = fb_helper->dev;
+	struct drm_device *dev = fb_helper->drm;
 	uint32_t format;
 	size_t i;
 
@@ -1473,7 +1473,7 @@ static uint32_t drm_fb_helper_find_color_mode_format(struct drm_fb_helper *fb_he
 						     const uint32_t *formats, size_t format_count,
 						     unsigned int color_mode)
 {
-	struct drm_device *dev = fb_helper->dev;
+	struct drm_device *dev = fb_helper->drm;
 	uint32_t bpp, depth;
 
 	switch (color_mode) {
@@ -1505,7 +1505,7 @@ static int __drm_fb_helper_find_sizes(struct drm_fb_helper *fb_helper,
 				      struct drm_fb_helper_surface_size *sizes)
 {
 	struct drm_client_dev *client = &fb_helper->client;
-	struct drm_device *dev = fb_helper->dev;
+	struct drm_device *dev = fb_helper->drm;
 	int crtc_count = 0;
 	struct drm_connector_list_iter conn_iter;
 	struct drm_connector *connector;
@@ -1523,7 +1523,7 @@ static int __drm_fb_helper_find_sizes(struct drm_fb_helper *fb_helper,
 
 		drm_dbg_kms(dev, "test CRTC %u primary plane\n", drm_crtc_index(crtc));
 
-		drm_connector_list_iter_begin(fb_helper->dev, &conn_iter);
+		drm_connector_list_iter_begin(fb_helper->drm, &conn_iter);
 		drm_client_for_each_connector_iter(connector, &conn_iter) {
 			struct drm_cmdline_mode *cmdline_mode = &connector->cmdline_mode;
 
@@ -1622,7 +1622,7 @@ static int drm_fb_helper_find_sizes(struct drm_fb_helper *fb_helper,
 				    struct drm_fb_helper_surface_size *sizes)
 {
 	struct drm_client_dev *client = &fb_helper->client;
-	struct drm_device *dev = fb_helper->dev;
+	struct drm_device *dev = fb_helper->drm;
 	struct drm_mode_config *config = &dev->mode_config;
 	int ret;
 
@@ -1652,7 +1652,7 @@ static int drm_fb_helper_find_sizes(struct drm_fb_helper *fb_helper,
 static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper)
 {
 	struct drm_client_dev *client = &fb_helper->client;
-	struct drm_device *dev = fb_helper->dev;
+	struct drm_device *dev = fb_helper->drm;
 	struct drm_fb_helper_surface_size sizes;
 	int ret;
 
@@ -1759,7 +1759,7 @@ void drm_fb_helper_fill_info(struct fb_info *info,
 	 * be changed due user-space tools (e.g: pm-utils) matching against it.
 	 */
 	snprintf(info->fix.id, sizeof(info->fix.id), "%sdrmfb",
-		 fb_helper->dev->driver->name);
+		 fb_helper->drm->driver->name);
 
 }
 EXPORT_SYMBOL(drm_fb_helper_fill_info);
@@ -1795,7 +1795,7 @@ static void drm_setup_crtcs_fb(struct drm_fb_helper *fb_helper)
 	}
 	mutex_unlock(&client->modeset_mutex);
 
-	drm_connector_list_iter_begin(fb_helper->dev, &conn_iter);
+	drm_connector_list_iter_begin(fb_helper->drm, &conn_iter);
 	drm_client_for_each_connector_iter(connector, &conn_iter) {
 
 		/* use first connected connector for the physical dimensions */
@@ -1834,7 +1834,7 @@ static void drm_setup_crtcs_fb(struct drm_fb_helper *fb_helper)
 static int
 __drm_fb_helper_initial_config_and_unlock(struct drm_fb_helper *fb_helper)
 {
-	struct drm_device *dev = fb_helper->dev;
+	struct drm_device *dev = fb_helper->drm;
 	struct fb_info *info;
 	unsigned int width, height;
 	int ret;
@@ -1973,15 +1973,15 @@ int drm_fb_helper_hotplug_event(struct drm_fb_helper *fb_helper)
 		return err;
 	}
 
-	if (!fb_helper->fb || !drm_master_internal_acquire(fb_helper->dev)) {
+	if (!fb_helper->fb || !drm_master_internal_acquire(fb_helper->drm)) {
 		fb_helper->delayed_hotplug = true;
 		mutex_unlock(&fb_helper->lock);
 		return err;
 	}
 
-	drm_master_internal_release(fb_helper->dev);
+	drm_master_internal_release(fb_helper->drm);
 
-	drm_dbg_kms(fb_helper->dev, "\n");
+	drm_dbg_kms(fb_helper->drm, "\n");
 
 	drm_client_modeset_probe(&fb_helper->client, fb_helper->fb->width, fb_helper->fb->height);
 	drm_setup_crtcs_fb(fb_helper);
diff --git a/drivers/gpu/drm/drm_fbdev_dma.c b/drivers/gpu/drm/drm_fbdev_dma.c
index e4a37e6fce75..9a338a4fc5e1 100644
--- a/drivers/gpu/drm/drm_fbdev_dma.c
+++ b/drivers/gpu/drm/drm_fbdev_dma.c
@@ -19,7 +19,7 @@ static int drm_fbdev_dma_fb_open(struct fb_info *info, int user)
 	struct drm_fb_helper *fb_helper = info->par;
 
 	/* No need to take a ref for fbcon because it unbinds on unregister */
-	if (user && !try_module_get(fb_helper->dev->driver->fops->owner))
+	if (user && !try_module_get(fb_helper->drm->driver->fops->owner))
 		return -ENODEV;
 
 	return 0;
@@ -30,7 +30,7 @@ static int drm_fbdev_dma_fb_release(struct fb_info *info, int user)
 	struct drm_fb_helper *fb_helper = info->par;
 
 	if (user)
-		module_put(fb_helper->dev->driver->fops->owner);
+		module_put(fb_helper->drm->driver->fops->owner);
 
 	return 0;
 }
@@ -39,7 +39,7 @@ static void drm_fbdev_dma_fb_destroy(struct fb_info *info)
 {
 	struct drm_fb_helper *fb_helper = info->par;
 
-	if (!fb_helper->dev)
+	if (!fb_helper->drm)
 		return;
 
 	drm_fb_helper_fini(fb_helper);
@@ -77,7 +77,7 @@ static int drm_fbdev_dma_helper_fb_probe(struct drm_fb_helper *fb_helper,
 					 struct drm_fb_helper_surface_size *sizes)
 {
 	struct drm_client_dev *client = &fb_helper->client;
-	struct drm_device *dev = fb_helper->dev;
+	struct drm_device *dev = fb_helper->drm;
 	struct drm_client_buffer *buffer;
 	struct drm_gem_dma_object *dma_obj;
 	struct drm_framebuffer *fb;
diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
index c5d9aab52064..c8714729a673 100644
--- a/drivers/gpu/drm/drm_fbdev_generic.c
+++ b/drivers/gpu/drm/drm_fbdev_generic.c
@@ -18,7 +18,7 @@ static int drm_fbdev_generic_fb_open(struct fb_info *info, int user)
 	struct drm_fb_helper *fb_helper = info->par;
 
 	/* No need to take a ref for fbcon because it unbinds on unregister */
-	if (user && !try_module_get(fb_helper->dev->driver->fops->owner))
+	if (user && !try_module_get(fb_helper->drm->driver->fops->owner))
 		return -ENODEV;
 
 	return 0;
@@ -29,7 +29,7 @@ static int drm_fbdev_generic_fb_release(struct fb_info *info, int user)
 	struct drm_fb_helper *fb_helper = info->par;
 
 	if (user)
-		module_put(fb_helper->dev->driver->fops->owner);
+		module_put(fb_helper->drm->driver->fops->owner);
 
 	return 0;
 }
@@ -43,7 +43,7 @@ static void drm_fbdev_generic_fb_destroy(struct fb_info *info)
 	struct drm_fb_helper *fb_helper = info->par;
 	void *shadow = info->screen_buffer;
 
-	if (!fb_helper->dev)
+	if (!fb_helper->drm)
 		return;
 
 	fb_deferred_io_cleanup(info);
@@ -72,7 +72,7 @@ static int drm_fbdev_generic_helper_fb_probe(struct drm_fb_helper *fb_helper,
 					     struct drm_fb_helper_surface_size *sizes)
 {
 	struct drm_client_dev *client = &fb_helper->client;
-	struct drm_device *dev = fb_helper->dev;
+	struct drm_device *dev = fb_helper->drm;
 	struct drm_client_buffer *buffer;
 	struct fb_info *info;
 	size_t screen_size;
@@ -216,7 +216,7 @@ static int drm_fbdev_generic_damage_blit(struct drm_fb_helper *fb_helper,
 static int drm_fbdev_generic_helper_fb_dirty(struct drm_fb_helper *helper,
 					     struct drm_clip_rect *clip)
 {
-	struct drm_device *dev = helper->dev;
+	struct drm_device *dev = helper->drm;
 	int ret;
 
 	/* Call damage handlers only if necessary */
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
index e7b9a13bd706..c2974a6425d5 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
@@ -67,7 +67,7 @@ static int exynos_drm_fbdev_update(struct drm_fb_helper *helper,
 
 	fbi = drm_fb_helper_alloc_info(helper);
 	if (IS_ERR(fbi)) {
-		DRM_DEV_ERROR(to_dma_dev(helper->dev),
+		DRM_DEV_ERROR(to_dma_dev(helper->drm),
 			      "failed to allocate fb info.\n");
 		return PTR_ERR(fbi);
 	}
@@ -90,7 +90,7 @@ static int exynos_drm_fbdev_create(struct drm_fb_helper *helper,
 				    struct drm_fb_helper_surface_size *sizes)
 {
 	struct exynos_drm_gem *exynos_gem;
-	struct drm_device *dev = helper->dev;
+	struct drm_device *dev = helper->drm;
 	struct drm_mode_fb_cmd2 mode_cmd = { 0 };
 	unsigned long size;
 	int ret;
diff --git a/drivers/gpu/drm/gma500/fbdev.c b/drivers/gpu/drm/gma500/fbdev.c
index cd5ca18750b4..dc8eb8ae7ab1 100644
--- a/drivers/gpu/drm/gma500/fbdev.c
+++ b/drivers/gpu/drm/gma500/fbdev.c
@@ -150,7 +150,7 @@ static const struct fb_ops psb_fbdev_fb_ops = {
 static int psb_fbdev_fb_probe(struct drm_fb_helper *fb_helper,
 			      struct drm_fb_helper_surface_size *sizes)
 {
-	struct drm_device *dev = fb_helper->dev;
+	struct drm_device *dev = fb_helper->drm;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	struct fb_info *info;
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 1cc0ddc6a310..6091b47e93bb 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -156,7 +156,7 @@ static int intelfb_alloc(struct drm_fb_helper *helper,
 {
 	struct intel_fbdev *ifbdev = to_intel_fbdev(helper);
 	struct drm_framebuffer *fb;
-	struct drm_device *dev = helper->dev;
+	struct drm_device *dev = helper->drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct drm_mode_fb_cmd2 mode_cmd = {};
 	struct drm_i915_gem_object *obj;
@@ -213,7 +213,7 @@ static int intelfb_create(struct drm_fb_helper *helper,
 {
 	struct intel_fbdev *ifbdev = to_intel_fbdev(helper);
 	struct intel_framebuffer *intel_fb = ifbdev->fb;
-	struct drm_device *dev = helper->dev;
+	struct drm_device *dev = helper->drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 	struct i915_ggtt *ggtt = to_gt(dev_priv)->ggtt;
@@ -587,7 +587,7 @@ static void intel_fbdev_initial_config(void *data, async_cookie_t cookie)
 
 	/* Due to peculiar init order wrt to hpd handling this is separate. */
 	if (drm_fb_helper_initial_config(&ifbdev->helper))
-		intel_fbdev_unregister(to_i915(ifbdev->helper.dev));
+		intel_fbdev_unregister(to_i915(ifbdev->helper.drm));
 }
 
 void intel_fbdev_initial_config_async(struct drm_i915_private *dev_priv)
diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index 26bfcdc090e8..2fe73db64781 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -68,7 +68,7 @@ static const struct fb_ops msm_fb_ops = {
 static int msm_fbdev_create(struct drm_fb_helper *helper,
 		struct drm_fb_helper_surface_size *sizes)
 {
-	struct drm_device *dev = helper->dev;
+	struct drm_device *dev = helper->drm;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct drm_framebuffer *fb = NULL;
 	struct drm_gem_object *bo;
@@ -142,7 +142,7 @@ static int msm_fbdev_create(struct drm_fb_helper *helper,
 static int msm_fbdev_fb_dirty(struct drm_fb_helper *helper,
 			      struct drm_clip_rect *clip)
 {
-	struct drm_device *dev = helper->dev;
+	struct drm_device *dev = helper->drm;
 	int ret;
 
 	/* Call damage handlers only if necessary */
diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
index 933f2353d05e..9a2d19c8eff4 100644
--- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
+++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
@@ -66,7 +66,7 @@ static int omap_fbdev_pan_display(struct fb_var_screeninfo *var,
 	if (drm_can_sleep()) {
 		pan_worker(&fbdev->work);
 	} else {
-		struct omap_drm_private *priv = helper->dev->dev_private;
+		struct omap_drm_private *priv = helper->drm->dev_private;
 		queue_work(priv->wq, &fbdev->work);
 	}
 
@@ -111,7 +111,7 @@ static int omap_fbdev_create(struct drm_fb_helper *helper,
 		struct drm_fb_helper_surface_size *sizes)
 {
 	struct omap_fbdev *fbdev = to_omap_fbdev(helper);
-	struct drm_device *dev = helper->dev;
+	struct drm_device *dev = helper->drm;
 	struct omap_drm_private *priv = dev->dev_private;
 	struct drm_framebuffer *fb = NULL;
 	union omap_gem_size gsize;
diff --git a/drivers/gpu/drm/radeon/radeon_fbdev.c b/drivers/gpu/drm/radeon/radeon_fbdev.c
index 74f8a182b02d..7bad11abc7da 100644
--- a/drivers/gpu/drm/radeon/radeon_fbdev.c
+++ b/drivers/gpu/drm/radeon/radeon_fbdev.c
@@ -57,7 +57,7 @@ static int radeon_fbdev_create_pinned_object(struct drm_fb_helper *fb_helper,
 					     struct drm_gem_object **gobj_p)
 {
 	const struct drm_format_info *info;
-	struct radeon_device *rdev = fb_helper->dev->dev_private;
+	struct radeon_device *rdev = fb_helper->drm->dev_private;
 	struct drm_gem_object *gobj = NULL;
 	struct radeon_bo *rbo = NULL;
 	bool fb_tiled = false; /* useful for testing */
@@ -145,7 +145,7 @@ static int radeon_fbdev_create_pinned_object(struct drm_fb_helper *fb_helper,
 static int radeon_fbdev_fb_open(struct fb_info *info, int user)
 {
 	struct drm_fb_helper *fb_helper = info->par;
-	struct radeon_device *rdev = fb_helper->dev->dev_private;
+	struct radeon_device *rdev = fb_helper->drm->dev_private;
 	int ret;
 
 	ret = pm_runtime_get_sync(rdev->ddev->dev);
@@ -163,7 +163,7 @@ static int radeon_fbdev_fb_open(struct fb_info *info, int user)
 static int radeon_fbdev_fb_release(struct fb_info *info, int user)
 {
 	struct drm_fb_helper *fb_helper = info->par;
-	struct radeon_device *rdev = fb_helper->dev->dev_private;
+	struct radeon_device *rdev = fb_helper->drm->dev_private;
 
 	pm_runtime_mark_last_busy(rdev->ddev->dev);
 	pm_runtime_put_autosuspend(rdev->ddev->dev);
@@ -205,7 +205,7 @@ static const struct fb_ops radeon_fbdev_fb_ops = {
 static int radeon_fbdev_fb_helper_fb_probe(struct drm_fb_helper *fb_helper,
 					   struct drm_fb_helper_surface_size *sizes)
 {
-	struct radeon_device *rdev = fb_helper->dev->dev_private;
+	struct radeon_device *rdev = fb_helper->drm->dev_private;
 	struct drm_mode_fb_cmd2 mode_cmd = { };
 	struct fb_info *info;
 	struct drm_gem_object *gobj;
@@ -299,7 +299,7 @@ static const struct drm_fb_helper_funcs radeon_fbdev_fb_helper_funcs = {
 static void radeon_fbdev_client_unregister(struct drm_client_dev *client)
 {
 	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
-	struct drm_device *dev = fb_helper->dev;
+	struct drm_device *dev = fb_helper->drm;
 	struct radeon_device *rdev = dev->dev_private;
 
 	if (fb_helper->info) {
diff --git a/drivers/gpu/drm/tegra/fbdev.c b/drivers/gpu/drm/tegra/fbdev.c
index 93a0f4021af5..b287d0d190fc 100644
--- a/drivers/gpu/drm/tegra/fbdev.c
+++ b/drivers/gpu/drm/tegra/fbdev.c
@@ -69,8 +69,8 @@ static const struct fb_ops tegra_fb_ops = {
 static int tegra_fbdev_probe(struct drm_fb_helper *helper,
 			     struct drm_fb_helper_surface_size *sizes)
 {
-	struct tegra_drm *tegra = helper->dev->dev_private;
-	struct drm_device *drm = helper->dev;
+	struct tegra_drm *tegra = helper->drm->dev_private;
+	struct drm_device *drm = helper->drm;
 	struct drm_mode_fb_cmd2 cmd = { 0 };
 	unsigned int bytes_per_pixel;
 	struct drm_framebuffer *fb;
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index 4863b0f8299e..84c73a32ea44 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -104,7 +104,7 @@ struct drm_fb_helper_funcs {
 /**
  * struct drm_fb_helper - main structure to emulate fbdev on top of KMS
  * @fb: Scanout framebuffer object
- * @dev: DRM device
+ * @drm: DRM device
  * @funcs: driver callbacks for fb helper
  * @info: emulated fbdev device info struct
  * @pseudo_palette: fake palette of 16 colors
@@ -135,7 +135,7 @@ struct drm_fb_helper {
 	struct drm_client_buffer *buffer;
 
 	struct drm_framebuffer *fb;
-	struct drm_device *dev;
+	struct drm_device *drm;
 	const struct drm_fb_helper_funcs *funcs;
 	struct fb_info *info;
 	u32 pseudo_palette[17];
@@ -290,7 +290,7 @@ static inline int drm_fb_helper_init(struct drm_device *dev,
 		       struct drm_fb_helper *helper)
 {
 	/* So drivers can use it to free the struct */
-	helper->dev = dev;
+	helper->drm = dev;
 	dev->fb_helper = helper;
 
 	return 0;
@@ -298,8 +298,8 @@ static inline int drm_fb_helper_init(struct drm_device *dev,
 
 static inline void drm_fb_helper_fini(struct drm_fb_helper *helper)
 {
-	if (helper && helper->dev)
-		helper->dev->fb_helper = NULL;
+	if (helper && helper->drm)
+		helper->drm->fb_helper = NULL;
 }
 
 static inline int drm_fb_helper_blank(int blank, struct fb_info *info)
-- 
2.39.2

