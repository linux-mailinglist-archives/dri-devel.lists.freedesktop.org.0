Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71214751B72
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 10:25:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C5010E628;
	Thu, 13 Jul 2023 08:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6BF410E625
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 08:24:58 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrcd-0005r3-MH; Thu, 13 Jul 2023 10:24:23 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrcd-00E4jP-0Q; Thu, 13 Jul 2023 10:24:23 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrcc-004Vh4-8e; Thu, 13 Jul 2023 10:24:22 +0200
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
Subject: [PATCH 06/17] drm/debugfs_entry: Rename struct drm_debugfs_entry::dev
 to drm
Date: Thu, 13 Jul 2023 10:23:57 +0200
Message-Id: <20230713082408.2266984-7-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
References: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=11922;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=DgS1CjufC9Jp/bZcfAXyxvJ1CLtBY8S3Y0LidXC7KTc=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkr7SNLwyjRHm3p+2YosWYeciWEyiO3bWP1b6s6
 J0NMkdJt1uJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK+0jQAKCRCPgPtYfRL+
 TveuB/4vVrmOJzB+Xm1Z6hT55LHaJpgmNnRWcuwmHnJLf+d56zX4ivWjqeOJ7+3v3btgos0n5kq
 hz44+zNctc+ZBAGnjHt1bBZNxN+706jujMbME0vQrRXmaSDqYhUpSDMCJYdZYz8MtfMSam2uAGT
 zOIhnOhSec5Z5ln77HMswWmEpq82gw9Mg/ZQU0fnPEZ525YxzNWMgIMMy2Wc7lElk/MLXFfYd46
 BTu9mM7QtBYoz1TuNrqYxdOpGJ4teI3ZcMVELpS+/2M6ej2RB/+OUFUYnNdQtqrQpqCz1kM64mo
 OiDNcjnKIkSvQjcZDqGBQOmBtw7R+BaW2DhGvMlnJbDOa+oC
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
 drivers/gpu/drm/arm/hdlcd_drv.c       | 4 ++--
 drivers/gpu/drm/drm_atomic.c          | 2 +-
 drivers/gpu/drm/drm_client.c          | 2 +-
 drivers/gpu/drm/drm_debugfs.c         | 8 ++++----
 drivers/gpu/drm/drm_framebuffer.c     | 2 +-
 drivers/gpu/drm/drm_gem_vram_helper.c | 2 +-
 drivers/gpu/drm/gud/gud_drv.c         | 2 +-
 drivers/gpu/drm/v3d/v3d_debugfs.c     | 8 ++++----
 drivers/gpu/drm/vc4/vc4_bo.c          | 2 +-
 drivers/gpu/drm/vc4/vc4_debugfs.c     | 2 +-
 drivers/gpu/drm/vc4/vc4_hvs.c         | 4 ++--
 drivers/gpu/drm/vc4/vc4_v3d.c         | 2 +-
 drivers/gpu/drm/vkms/vkms_drv.c       | 2 +-
 include/drm/drm_debugfs.h             | 4 ++--
 14 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index aa06f9838015..8d1f3b6157ed 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -194,7 +194,7 @@ static int hdlcd_setup_mode_config(struct drm_device *drm)
 static int hdlcd_show_underrun_count(struct seq_file *m, void *arg)
 {
 	struct drm_debugfs_entry *entry = m->private;
-	struct drm_device *drm = entry->dev;
+	struct drm_device *drm = entry->drm;
 	struct hdlcd_drm_private *hdlcd = drm_to_hdlcd_priv(drm);
 
 	seq_printf(m, "underrun : %d\n", atomic_read(&hdlcd->buffer_underrun_count));
@@ -207,7 +207,7 @@ static int hdlcd_show_underrun_count(struct seq_file *m, void *arg)
 static int hdlcd_show_pxlclock(struct seq_file *m, void *arg)
 {
 	struct drm_debugfs_entry *entry = m->private;
-	struct drm_device *drm = entry->dev;
+	struct drm_device *drm = entry->drm;
 	struct hdlcd_drm_private *hdlcd = drm_to_hdlcd_priv(drm);
 	unsigned long clkrate = clk_get_rate(hdlcd->clk);
 	unsigned long mode_clock = hdlcd->crtc.mode.crtc_clock * 1000;
diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 8c2ebb982972..58101873a651 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1820,7 +1820,7 @@ EXPORT_SYMBOL(drm_state_dump);
 static int drm_state_info(struct seq_file *m, void *data)
 {
 	struct drm_debugfs_entry *entry = m->private;
-	struct drm_device *dev = entry->dev;
+	struct drm_device *dev = entry->drm;
 	struct drm_printer p = drm_seq_file_printer(m);
 
 	__drm_state_dump(dev, &p, true);
diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index a99417748053..3b82635dc9ff 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -500,7 +500,7 @@ EXPORT_SYMBOL(drm_client_framebuffer_flush);
 static int drm_client_debugfs_internal_clients(struct seq_file *m, void *data)
 {
 	struct drm_debugfs_entry *entry = m->private;
-	struct drm_device *dev = entry->dev;
+	struct drm_device *dev = entry->drm;
 	struct drm_printer p = drm_seq_file_printer(m);
 	struct drm_client_dev *client;
 
diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 3a70ac678e8f..4542eed896dd 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -52,7 +52,7 @@
 static int drm_name_info(struct seq_file *m, void *data)
 {
 	struct drm_debugfs_entry *entry = m->private;
-	struct drm_device *dev = entry->dev;
+	struct drm_device *dev = entry->drm;
 	struct drm_master *master;
 
 	mutex_lock(&dev->master_mutex);
@@ -73,7 +73,7 @@ static int drm_name_info(struct seq_file *m, void *data)
 static int drm_clients_info(struct seq_file *m, void *data)
 {
 	struct drm_debugfs_entry *entry = m->private;
-	struct drm_device *dev = entry->dev;
+	struct drm_device *dev = entry->drm;
 	struct drm_file *priv;
 	kuid_t uid;
 
@@ -125,7 +125,7 @@ static int drm_gem_one_name_info(int id, void *ptr, void *data)
 static int drm_gem_name_info(struct seq_file *m, void *data)
 {
 	struct drm_debugfs_entry *entry = m->private;
-	struct drm_device *dev = entry->dev;
+	struct drm_device *dev = entry->drm;
 
 	seq_printf(m, "  name     size handles refcount\n");
 
@@ -337,7 +337,7 @@ void drm_debugfs_add_file(struct drm_device *dev, const char *name,
 	entry->file.name = name;
 	entry->file.show = show;
 	entry->file.data = data;
-	entry->dev = dev;
+	entry->drm = dev;
 
 	mutex_lock(&dev->debugfs_mutex);
 	list_add(&entry->list, &dev->debugfs_list);
diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index aff3746dedfb..38a118e51a6f 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -1204,7 +1204,7 @@ void drm_framebuffer_print_info(struct drm_printer *p, unsigned int indent,
 static int drm_framebuffer_info(struct seq_file *m, void *data)
 {
 	struct drm_debugfs_entry *entry = m->private;
-	struct drm_device *dev = entry->dev;
+	struct drm_device *dev = entry->drm;
 	struct drm_printer p = drm_seq_file_printer(m);
 	struct drm_framebuffer *fb;
 
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index b67eafa55715..fc45a65708b7 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -969,7 +969,7 @@ static struct ttm_device_funcs bo_driver = {
 static int drm_vram_mm_debugfs(struct seq_file *m, void *data)
 {
 	struct drm_debugfs_entry *entry = m->private;
-	struct drm_vram_mm *vmm = entry->dev->vram_mm;
+	struct drm_vram_mm *vmm = entry->drm->vram_mm;
 	struct ttm_resource_manager *man = ttm_manager_type(&vmm->bdev, TTM_PL_VRAM);
 	struct drm_printer p = drm_seq_file_printer(m);
 
diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
index 9d7bf8ee45f1..a613407ac2df 100644
--- a/drivers/gpu/drm/gud/gud_drv.c
+++ b/drivers/gpu/drm/gud/gud_drv.c
@@ -326,7 +326,7 @@ static struct drm_gem_object *gud_gem_prime_import(struct drm_device *drm, struc
 static int gud_stats_debugfs(struct seq_file *m, void *data)
 {
 	struct drm_debugfs_entry *entry = m->private;
-	struct gud_device *gdrm = to_gud_device(entry->dev);
+	struct gud_device *gdrm = to_gud_device(entry->drm);
 	char buf[10];
 
 	string_get_size(gdrm->bulk_len, 1, STRING_UNITS_2, buf, sizeof(buf));
diff --git a/drivers/gpu/drm/v3d/v3d_debugfs.c b/drivers/gpu/drm/v3d/v3d_debugfs.c
index 330669f51fa7..54a9cfbb5a7d 100644
--- a/drivers/gpu/drm/v3d/v3d_debugfs.c
+++ b/drivers/gpu/drm/v3d/v3d_debugfs.c
@@ -80,7 +80,7 @@ static const struct v3d_reg_def v3d_csd_reg_defs[] = {
 static int v3d_v3d_debugfs_regs(struct seq_file *m, void *unused)
 {
 	struct drm_debugfs_entry *entry = m->private;
-	struct drm_device *dev = entry->dev;
+	struct drm_device *dev = entry->drm;
 	struct v3d_dev *v3d = to_v3d_dev(dev);
 	int i, core;
 
@@ -127,7 +127,7 @@ static int v3d_v3d_debugfs_regs(struct seq_file *m, void *unused)
 static int v3d_v3d_debugfs_ident(struct seq_file *m, void *unused)
 {
 	struct drm_debugfs_entry *entry = m->private;
-	struct drm_device *dev = entry->dev;
+	struct drm_device *dev = entry->drm;
 	struct v3d_dev *v3d = to_v3d_dev(dev);
 	u32 ident0, ident1, ident2, ident3, cores;
 	int core;
@@ -189,7 +189,7 @@ static int v3d_v3d_debugfs_ident(struct seq_file *m, void *unused)
 static int v3d_debugfs_bo_stats(struct seq_file *m, void *unused)
 {
 	struct drm_debugfs_entry *entry = m->private;
-	struct drm_device *dev = entry->dev;
+	struct drm_device *dev = entry->drm;
 	struct v3d_dev *v3d = to_v3d_dev(dev);
 
 	mutex_lock(&v3d->bo_lock);
@@ -205,7 +205,7 @@ static int v3d_debugfs_bo_stats(struct seq_file *m, void *unused)
 static int v3d_measure_clock(struct seq_file *m, void *unused)
 {
 	struct drm_debugfs_entry *entry = m->private;
-	struct drm_device *dev = entry->dev;
+	struct drm_device *dev = entry->drm;
 	struct v3d_dev *v3d = to_v3d_dev(dev);
 	uint32_t cycles;
 	int core = 0;
diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index 86d629e45307..71a6f5e47817 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -70,7 +70,7 @@ static void vc4_bo_stats_print(struct drm_printer *p, struct vc4_dev *vc4)
 static int vc4_bo_stats_debugfs(struct seq_file *m, void *unused)
 {
 	struct drm_debugfs_entry *entry = m->private;
-	struct drm_device *dev = entry->dev;
+	struct drm_device *dev = entry->drm;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct drm_printer p = drm_seq_file_printer(m);
 
diff --git a/drivers/gpu/drm/vc4/vc4_debugfs.c b/drivers/gpu/drm/vc4/vc4_debugfs.c
index fac624a663ea..1af0432ee6a1 100644
--- a/drivers/gpu/drm/vc4/vc4_debugfs.c
+++ b/drivers/gpu/drm/vc4/vc4_debugfs.c
@@ -35,7 +35,7 @@ vc4_debugfs_init(struct drm_minor *minor)
 static int vc4_debugfs_regset32(struct seq_file *m, void *unused)
 {
 	struct drm_debugfs_entry *entry = m->private;
-	struct drm_device *drm = entry->dev;
+	struct drm_device *drm = entry->drm;
 	struct debugfs_regset32 *regset = entry->file.data;
 	struct drm_printer p = drm_seq_file_printer(m);
 	int idx;
diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 488a207024c7..552142320e2d 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -94,7 +94,7 @@ void vc4_hvs_dump_state(struct vc4_hvs *hvs)
 static int vc4_hvs_debugfs_underrun(struct seq_file *m, void *data)
 {
 	struct drm_debugfs_entry *entry = m->private;
-	struct drm_device *dev = entry->dev;
+	struct drm_device *dev = entry->drm;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct drm_printer p = drm_seq_file_printer(m);
 
@@ -106,7 +106,7 @@ static int vc4_hvs_debugfs_underrun(struct seq_file *m, void *data)
 static int vc4_hvs_debugfs_dlist(struct seq_file *m, void *data)
 {
 	struct drm_debugfs_entry *entry = m->private;
-	struct drm_device *dev = entry->dev;
+	struct drm_device *dev = entry->drm;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_hvs *hvs = vc4->hvs;
 	struct drm_printer p = drm_seq_file_printer(m);
diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
index 04ac7805e6d5..72edeb2d3d78 100644
--- a/drivers/gpu/drm/vc4/vc4_v3d.c
+++ b/drivers/gpu/drm/vc4/vc4_v3d.c
@@ -97,7 +97,7 @@ static const struct debugfs_reg32 v3d_regs[] = {
 static int vc4_v3d_debugfs_ident(struct seq_file *m, void *unused)
 {
 	struct drm_debugfs_entry *entry = m->private;
-	struct drm_device *dev = entry->dev;
+	struct drm_device *dev = entry->drm;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	int ret = vc4_v3d_pm_get(vc4);
 
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index a58d7e0d3078..f15f1bd51208 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -93,7 +93,7 @@ static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
 static int vkms_config_show(struct seq_file *m, void *data)
 {
 	struct drm_debugfs_entry *entry = m->private;
-	struct drm_device *dev = entry->dev;
+	struct drm_device *dev = entry->drm;
 	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
 
 	seq_printf(m, "writeback=%d\n", vkmsdev->config->writeback);
diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
index 7616f457ce70..f7c4f2774a8e 100644
--- a/include/drm/drm_debugfs.h
+++ b/include/drm/drm_debugfs.h
@@ -112,8 +112,8 @@ struct drm_debugfs_info {
  * drm_debugfs_info on a &struct drm_device.
  */
 struct drm_debugfs_entry {
-	/** @dev: &struct drm_device for this node. */
-	struct drm_device *dev;
+	/** @drm: &struct drm_device for this node. */
+	struct drm_device *drm;
 
 	/** @file: Template for this node. */
 	struct drm_debugfs_info file;
-- 
2.39.2

