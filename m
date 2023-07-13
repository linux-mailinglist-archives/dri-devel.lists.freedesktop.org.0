Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F8C751B71
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 10:25:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F89C10E609;
	Thu, 13 Jul 2023 08:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B68610E627
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 08:24:54 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrcc-0005qN-Qz; Thu, 13 Jul 2023 10:24:22 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrca-00E4jC-Uh; Thu, 13 Jul 2023 10:24:20 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrca-004Vgr-9t; Thu, 13 Jul 2023 10:24:20 +0200
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
Subject: [PATCH 03/17] drm/client_dev: Rename struct drm_client_dev::dev to drm
Date: Thu, 13 Jul 2023 10:23:54 +0200
Message-Id: <20230713082408.2266984-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
References: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=16647;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=26/+mVYFnvs0OLGBi2luQZQdlKXPa2OKS8cfFZum+lM=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkr7SF3ZCXWGiZNHFnaPG0HiOlza/jlTTLIJMRY
 h1wOM3JZ8SJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK+0hQAKCRCPgPtYfRL+
 TovbB/9E6oPX0pyE9MoTdhE9m+is6fWeafrNa5EeS7ZoiYocRBatFSNp0ejVqj/d38c2EvStMTw
 vP+qnJuyf4L2rLzqZTI5+/V08U0NcRY32+7+rRHaDan4+5+XDA9IUdrd82i0nDkS4vusL5pjYuT
 4gmDdq2LXLuFNzb+j5bcM95MAL6u9+4Ffm1FAV1FQ+e9StSovHVBhjE4NOD0UYnkw/x3VBEGd4a
 ri4lTh6hDKzu7Zd2EMWSK+G+68IVPRNv3nZ0/SgX60dSipsN1IOp4oIqi4ugIgZgQQFM9WtzbU/
 pYS1Z+Rd3/o7wHDGy6ixP0LWhXS7JQV+gXR3bcY1wf40b10+
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
 drivers/gpu/drm/armada/armada_fbdev.c     |  4 ++--
 drivers/gpu/drm/drm_client.c              | 24 ++++++++++++-----------
 drivers/gpu/drm/drm_client_modeset.c      | 24 +++++++++++------------
 drivers/gpu/drm/drm_fbdev_dma.c           |  4 ++--
 drivers/gpu/drm/drm_fbdev_generic.c       |  4 ++--
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c |  4 ++--
 drivers/gpu/drm/gma500/fbdev.c            |  4 ++--
 drivers/gpu/drm/msm/msm_fbdev.c           |  4 ++--
 drivers/gpu/drm/omapdrm/omap_fbdev.c      |  4 ++--
 drivers/gpu/drm/radeon/radeon_fbdev.c     |  4 ++--
 drivers/gpu/drm/tegra/fbdev.c             |  4 ++--
 include/drm/drm_client.h                  |  4 ++--
 12 files changed, 45 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/armada/armada_fbdev.c b/drivers/gpu/drm/armada/armada_fbdev.c
index 3943e89cc06c..241983120299 100644
--- a/drivers/gpu/drm/armada/armada_fbdev.c
+++ b/drivers/gpu/drm/armada/armada_fbdev.c
@@ -149,7 +149,7 @@ static void armada_fbdev_client_unregister(struct drm_client_dev *client)
 
 static int armada_fbdev_client_restore(struct drm_client_dev *client)
 {
-	drm_fb_helper_lastclose(client->dev);
+	drm_fb_helper_lastclose(client->drm);
 
 	return 0;
 }
@@ -157,7 +157,7 @@ static int armada_fbdev_client_restore(struct drm_client_dev *client)
 static int armada_fbdev_client_hotplug(struct drm_client_dev *client)
 {
 	struct drm_fb_helper *fbh = drm_fb_helper_from_client(client);
-	struct drm_device *dev = client->dev;
+	struct drm_device *dev = client->drm;
 	int ret;
 
 	if (dev->fb_helper)
diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index f6292ba0e6fc..a99417748053 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -34,7 +34,7 @@
 
 static int drm_client_open(struct drm_client_dev *client)
 {
-	struct drm_device *dev = client->dev;
+	struct drm_device *dev = client->drm;
 	struct drm_file *file;
 
 	file = drm_file_alloc(dev->primary);
@@ -52,7 +52,7 @@ static int drm_client_open(struct drm_client_dev *client)
 
 static void drm_client_close(struct drm_client_dev *client)
 {
-	struct drm_device *dev = client->dev;
+	struct drm_device *dev = client->drm;
 
 	mutex_lock(&dev->filelist_mutex);
 	list_del(&client->file->lhead);
@@ -87,7 +87,7 @@ int drm_client_init(struct drm_device *dev, struct drm_client_dev *client,
 	if (funcs && !try_module_get(funcs->owner))
 		return -ENODEV;
 
-	client->dev = dev;
+	client->drm = dev;
 	client->name = name;
 	client->funcs = funcs;
 
@@ -125,7 +125,7 @@ EXPORT_SYMBOL(drm_client_init);
  */
 void drm_client_register(struct drm_client_dev *client)
 {
-	struct drm_device *dev = client->dev;
+	struct drm_device *dev = client->drm;
 
 	mutex_lock(&dev->clientlist_mutex);
 	list_add(&client->list, &dev->clientlist);
@@ -149,7 +149,7 @@ EXPORT_SYMBOL(drm_client_register);
  */
 void drm_client_release(struct drm_client_dev *client)
 {
-	struct drm_device *dev = client->dev;
+	struct drm_device *dev = client->drm;
 
 	drm_dbg_kms(dev, "%s\n", client->name);
 
@@ -257,7 +257,7 @@ drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height,
 {
 	const struct drm_format_info *info = drm_format_info(format);
 	struct drm_mode_create_dumb dumb_args = { };
-	struct drm_device *dev = client->dev;
+	struct drm_device *dev = client->drm;
 	struct drm_client_buffer *buffer;
 	struct drm_gem_object *obj;
 	int ret;
@@ -361,9 +361,10 @@ static void drm_client_buffer_rmfb(struct drm_client_buffer *buffer)
 	if (!buffer->fb)
 		return;
 
-	ret = drm_mode_rmfb(buffer->client->dev, buffer->fb->base.id, buffer->client->file);
+	ret = drm_mode_rmfb(buffer->client->drm, buffer->fb->base.id,
+			    buffer->client->file);
 	if (ret)
-		drm_err(buffer->client->dev,
+		drm_err(buffer->client->drm,
 			"Error removing FB:%u (%d)\n", buffer->fb->base.id, ret);
 
 	buffer->fb = NULL;
@@ -386,11 +387,12 @@ static int drm_client_buffer_addfb(struct drm_client_buffer *buffer,
 	fb_req.handle = handle;
 	fb_req.pitch = buffer->pitch;
 
-	ret = drm_mode_addfb(client->dev, &fb_req, client->file);
+	ret = drm_mode_addfb(client->drm, &fb_req, client->file);
 	if (ret)
 		return ret;
 
-	buffer->fb = drm_framebuffer_lookup(client->dev, buffer->client->file, fb_req.fb_id);
+	buffer->fb = drm_framebuffer_lookup(client->drm, buffer->client->file,
+					    fb_req.fb_id);
 	if (WARN_ON(!buffer->fb))
 		return -ENOENT;
 
@@ -436,7 +438,7 @@ drm_client_framebuffer_create(struct drm_client_dev *client, u32 width, u32 heig
 	 * object as DMA-buf. The framebuffer and our buffer structure are still
 	 * holding references to the GEM object to prevent its destruction.
 	 */
-	drm_mode_destroy_dumb(client->dev, handle, client->file);
+	drm_mode_destroy_dumb(client->drm, handle, client->file);
 
 	if (ret) {
 		drm_client_buffer_delete(buffer);
diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index 1b12a3c201a3..57f1f9bc5b9b 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -34,7 +34,7 @@ struct drm_client_offset {
 
 int drm_client_modeset_create(struct drm_client_dev *client)
 {
-	struct drm_device *dev = client->dev;
+	struct drm_device *dev = client->drm;
 	unsigned int num_crtc = dev->mode_config.num_crtc;
 	unsigned int max_connector_count = 1;
 	struct drm_mode_set *modeset;
@@ -76,7 +76,7 @@ static void drm_client_modeset_release(struct drm_client_dev *client)
 	unsigned int i;
 
 	drm_client_for_each_modeset(modeset, client) {
-		drm_mode_destroy(client->dev, modeset->mode);
+		drm_mode_destroy(client->drm, modeset->mode);
 		modeset->mode = NULL;
 		modeset->fb = NULL;
 
@@ -490,7 +490,7 @@ static int drm_client_pick_crtcs(struct drm_client_dev *client,
 				 struct drm_display_mode **modes,
 				 int n, int width, int height)
 {
-	struct drm_device *dev = client->dev;
+	struct drm_device *dev = client->drm;
 	struct drm_connector *connector;
 	int my_score, best_score, score;
 	struct drm_crtc **crtcs, *crtc;
@@ -568,7 +568,7 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 {
 	const int count = min_t(unsigned int, connector_count, BITS_PER_LONG);
 	unsigned long conn_configured, conn_seq, mask;
-	struct drm_device *dev = client->dev;
+	struct drm_device *dev = client->drm;
 	int i, j;
 	bool *save_enabled;
 	bool fallback = true, ret = true;
@@ -768,7 +768,7 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
 {
 	struct drm_connector *connector, **connectors = NULL;
 	struct drm_connector_list_iter conn_iter;
-	struct drm_device *dev = client->dev;
+	struct drm_device *dev = client->drm;
 	unsigned int total_modes_count = 0;
 	struct drm_client_offset *offsets;
 	unsigned int connector_count = 0;
@@ -974,7 +974,7 @@ EXPORT_SYMBOL(drm_client_rotation);
 
 static int drm_client_modeset_commit_atomic(struct drm_client_dev *client, bool active, bool check)
 {
-	struct drm_device *dev = client->dev;
+	struct drm_device *dev = client->drm;
 	struct drm_plane *plane;
 	struct drm_atomic_state *state;
 	struct drm_modeset_acquire_ctx ctx;
@@ -1064,7 +1064,7 @@ static int drm_client_modeset_commit_atomic(struct drm_client_dev *client, bool
 
 static int drm_client_modeset_commit_legacy(struct drm_client_dev *client)
 {
-	struct drm_device *dev = client->dev;
+	struct drm_device *dev = client->drm;
 	struct drm_mode_set *mode_set;
 	struct drm_plane *plane;
 	int ret = 0;
@@ -1116,7 +1116,7 @@ int drm_client_modeset_check(struct drm_client_dev *client)
 {
 	int ret;
 
-	if (!drm_drv_uses_atomic_modeset(client->dev))
+	if (!drm_drv_uses_atomic_modeset(client->drm))
 		return 0;
 
 	mutex_lock(&client->modeset_mutex);
@@ -1140,7 +1140,7 @@ EXPORT_SYMBOL(drm_client_modeset_check);
  */
 int drm_client_modeset_commit_locked(struct drm_client_dev *client)
 {
-	struct drm_device *dev = client->dev;
+	struct drm_device *dev = client->drm;
 	int ret;
 
 	mutex_lock(&client->modeset_mutex);
@@ -1165,7 +1165,7 @@ EXPORT_SYMBOL(drm_client_modeset_commit_locked);
  */
 int drm_client_modeset_commit(struct drm_client_dev *client)
 {
-	struct drm_device *dev = client->dev;
+	struct drm_device *dev = client->drm;
 	int ret;
 
 	if (!drm_master_internal_acquire(dev))
@@ -1181,7 +1181,7 @@ EXPORT_SYMBOL(drm_client_modeset_commit);
 
 static void drm_client_modeset_dpms_legacy(struct drm_client_dev *client, int dpms_mode)
 {
-	struct drm_device *dev = client->dev;
+	struct drm_device *dev = client->drm;
 	struct drm_connector *connector;
 	struct drm_mode_set *modeset;
 	struct drm_modeset_acquire_ctx ctx;
@@ -1215,7 +1215,7 @@ static void drm_client_modeset_dpms_legacy(struct drm_client_dev *client, int dp
  */
 int drm_client_modeset_dpms(struct drm_client_dev *client, int mode)
 {
-	struct drm_device *dev = client->dev;
+	struct drm_device *dev = client->drm;
 	int ret = 0;
 
 	if (!drm_master_internal_acquire(dev))
diff --git a/drivers/gpu/drm/drm_fbdev_dma.c b/drivers/gpu/drm/drm_fbdev_dma.c
index 8217f1ddc007..e4a37e6fce75 100644
--- a/drivers/gpu/drm/drm_fbdev_dma.c
+++ b/drivers/gpu/drm/drm_fbdev_dma.c
@@ -168,7 +168,7 @@ static void drm_fbdev_dma_client_unregister(struct drm_client_dev *client)
 
 static int drm_fbdev_dma_client_restore(struct drm_client_dev *client)
 {
-	drm_fb_helper_lastclose(client->dev);
+	drm_fb_helper_lastclose(client->drm);
 
 	return 0;
 }
@@ -176,7 +176,7 @@ static int drm_fbdev_dma_client_restore(struct drm_client_dev *client)
 static int drm_fbdev_dma_client_hotplug(struct drm_client_dev *client)
 {
 	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
-	struct drm_device *dev = client->dev;
+	struct drm_device *dev = client->drm;
 	int ret;
 
 	if (dev->fb_helper)
diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
index 98ae703848a0..c5d9aab52064 100644
--- a/drivers/gpu/drm/drm_fbdev_generic.c
+++ b/drivers/gpu/drm/drm_fbdev_generic.c
@@ -256,7 +256,7 @@ static void drm_fbdev_generic_client_unregister(struct drm_client_dev *client)
 
 static int drm_fbdev_generic_client_restore(struct drm_client_dev *client)
 {
-	drm_fb_helper_lastclose(client->dev);
+	drm_fb_helper_lastclose(client->drm);
 
 	return 0;
 }
@@ -264,7 +264,7 @@ static int drm_fbdev_generic_client_restore(struct drm_client_dev *client)
 static int drm_fbdev_generic_client_hotplug(struct drm_client_dev *client)
 {
 	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
-	struct drm_device *dev = client->dev;
+	struct drm_device *dev = client->drm;
 	int ret;
 
 	if (dev->fb_helper)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
index fdf65587f1fe..e7b9a13bd706 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
@@ -157,7 +157,7 @@ static void exynos_drm_fbdev_client_unregister(struct drm_client_dev *client)
 
 static int exynos_drm_fbdev_client_restore(struct drm_client_dev *client)
 {
-	drm_fb_helper_lastclose(client->dev);
+	drm_fb_helper_lastclose(client->drm);
 
 	return 0;
 }
@@ -165,7 +165,7 @@ static int exynos_drm_fbdev_client_restore(struct drm_client_dev *client)
 static int exynos_drm_fbdev_client_hotplug(struct drm_client_dev *client)
 {
 	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
-	struct drm_device *dev = client->dev;
+	struct drm_device *dev = client->drm;
 	int ret;
 
 	if (dev->fb_helper)
diff --git a/drivers/gpu/drm/gma500/fbdev.c b/drivers/gpu/drm/gma500/fbdev.c
index 955cbe9f05a7..cd5ca18750b4 100644
--- a/drivers/gpu/drm/gma500/fbdev.c
+++ b/drivers/gpu/drm/gma500/fbdev.c
@@ -270,7 +270,7 @@ static void psb_fbdev_client_unregister(struct drm_client_dev *client)
 
 static int psb_fbdev_client_restore(struct drm_client_dev *client)
 {
-	drm_fb_helper_lastclose(client->dev);
+	drm_fb_helper_lastclose(client->drm);
 
 	return 0;
 }
@@ -278,7 +278,7 @@ static int psb_fbdev_client_restore(struct drm_client_dev *client)
 static int psb_fbdev_client_hotplug(struct drm_client_dev *client)
 {
 	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
-	struct drm_device *dev = client->dev;
+	struct drm_device *dev = client->drm;
 	int ret;
 
 	if (dev->fb_helper)
diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index b933a85420f6..26bfcdc090e8 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -182,7 +182,7 @@ static void msm_fbdev_client_unregister(struct drm_client_dev *client)
 
 static int msm_fbdev_client_restore(struct drm_client_dev *client)
 {
-	drm_fb_helper_lastclose(client->dev);
+	drm_fb_helper_lastclose(client->drm);
 
 	return 0;
 }
@@ -190,7 +190,7 @@ static int msm_fbdev_client_restore(struct drm_client_dev *client)
 static int msm_fbdev_client_hotplug(struct drm_client_dev *client)
 {
 	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
-	struct drm_device *dev = client->dev;
+	struct drm_device *dev = client->drm;
 	int ret;
 
 	if (dev->fb_helper)
diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
index b7ccce0704a3..933f2353d05e 100644
--- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
+++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
@@ -258,7 +258,7 @@ static void omap_fbdev_client_unregister(struct drm_client_dev *client)
 
 static int omap_fbdev_client_restore(struct drm_client_dev *client)
 {
-	drm_fb_helper_lastclose(client->dev);
+	drm_fb_helper_lastclose(client->drm);
 
 	return 0;
 }
@@ -266,7 +266,7 @@ static int omap_fbdev_client_restore(struct drm_client_dev *client)
 static int omap_fbdev_client_hotplug(struct drm_client_dev *client)
 {
 	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
-	struct drm_device *dev = client->dev;
+	struct drm_device *dev = client->drm;
 	int ret;
 
 	if (dev->fb_helper)
diff --git a/drivers/gpu/drm/radeon/radeon_fbdev.c b/drivers/gpu/drm/radeon/radeon_fbdev.c
index ab9c1abbac97..74f8a182b02d 100644
--- a/drivers/gpu/drm/radeon/radeon_fbdev.c
+++ b/drivers/gpu/drm/radeon/radeon_fbdev.c
@@ -315,7 +315,7 @@ static void radeon_fbdev_client_unregister(struct drm_client_dev *client)
 
 static int radeon_fbdev_client_restore(struct drm_client_dev *client)
 {
-	drm_fb_helper_lastclose(client->dev);
+	drm_fb_helper_lastclose(client->drm);
 	vga_switcheroo_process_delayed_switch();
 
 	return 0;
@@ -324,7 +324,7 @@ static int radeon_fbdev_client_restore(struct drm_client_dev *client)
 static int radeon_fbdev_client_hotplug(struct drm_client_dev *client)
 {
 	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
-	struct drm_device *dev = client->dev;
+	struct drm_device *dev = client->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	int ret;
 
diff --git a/drivers/gpu/drm/tegra/fbdev.c b/drivers/gpu/drm/tegra/fbdev.c
index e74d9be981c7..93a0f4021af5 100644
--- a/drivers/gpu/drm/tegra/fbdev.c
+++ b/drivers/gpu/drm/tegra/fbdev.c
@@ -167,7 +167,7 @@ static void tegra_fbdev_client_unregister(struct drm_client_dev *client)
 
 static int tegra_fbdev_client_restore(struct drm_client_dev *client)
 {
-	drm_fb_helper_lastclose(client->dev);
+	drm_fb_helper_lastclose(client->drm);
 
 	return 0;
 }
@@ -175,7 +175,7 @@ static int tegra_fbdev_client_restore(struct drm_client_dev *client)
 static int tegra_fbdev_client_hotplug(struct drm_client_dev *client)
 {
 	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
-	struct drm_device *dev = client->dev;
+	struct drm_device *dev = client->drm;
 	int ret;
 
 	if (dev->fb_helper)
diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
index c0a14b40c039..e1f971a30c06 100644
--- a/include/drm/drm_client.h
+++ b/include/drm/drm_client.h
@@ -70,9 +70,9 @@ struct drm_client_funcs {
  */
 struct drm_client_dev {
 	/**
-	 * @dev: DRM device
+	 * @drm: DRM device
 	 */
-	struct drm_device *dev;
+	struct drm_device *drm;
 
 	/**
 	 * @name: Name of the client.
-- 
2.39.2

