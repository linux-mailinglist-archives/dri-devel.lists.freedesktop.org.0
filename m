Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 448C0751B7D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 10:25:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE2610E63A;
	Thu, 13 Jul 2023 08:25:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 535BB10E630
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 08:25:30 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrch-0005z5-05; Thu, 13 Jul 2023 10:24:27 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrcg-00E4k1-1N; Thu, 13 Jul 2023 10:24:26 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrcf-004VhW-4Q; Thu, 13 Jul 2023 10:24:25 +0200
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
Subject: [PATCH 13/17] drm/minor: Rename struct drm_minor::dev to drm
Date: Thu, 13 Jul 2023 10:24:04 +0200
Message-Id: <20230713082408.2266984-14-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
References: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=59479;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=N6f0/7tXGDbwZz3LatdgKgVIdnoag4xLCb22whl4MLQ=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkr7Sav41Xh8uL4P0xQYyc36DtcPRlCYU/TE277
 YH+A5hU1kCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK+0mgAKCRCPgPtYfRL+
 ToW8B/9aECPxeZmxOqP4b24EAES/8gzGW4pu/V65v54QS0VG8plBF1fv6MHcZ4/OnuG8zja6QDP
 z7sGBJBKTETVs5rSFc7sKweeLLvnJ+l9JVJMLqE5ixCSSH9qCk4HjRbz3cVV5lOIjx0qsqErTeN
 4Izng5jBUXoCqYN3iW3CunN3jzsI9yaQAwv0md2CPCMrPFCXor2xT3PfvW+5JU+qCnsXYBAdLCO
 uhPLEy73GoRp1jsfnOZW6KUzCAMEnyFptzBjw12e2PWhl1koAEZQwozIbTGcSAtDiAXwlWi6FNK
 Pfe9JNCWrvfN2559b0rxHlEqIyaUpOvsMQfyoS/ZEHBuHmYr
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
 drivers/accel/drm_accel.c                     | 16 +++++++-------
 drivers/accel/ivpu/ivpu_debugfs.c             | 16 +++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c    |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c       | 12 +++++-----
 drivers/gpu/drm/arm/malidp_drv.c              |  4 ++--
 drivers/gpu/drm/armada/armada_debugfs.c       |  2 +-
 drivers/gpu/drm/drm_agpsupport.c              |  2 +-
 drivers/gpu/drm/drm_atomic.c                  |  2 +-
 drivers/gpu/drm/drm_auth.c                    |  8 +++----
 drivers/gpu/drm/drm_client.c                  |  2 +-
 drivers/gpu/drm/drm_debugfs.c                 |  7 +++---
 drivers/gpu/drm/drm_drv.c                     | 14 ++++++------
 drivers/gpu/drm/drm_file.c                    | 22 +++++++++----------
 drivers/gpu/drm/drm_framebuffer.c             |  2 +-
 drivers/gpu/drm/drm_gem.c                     |  2 +-
 drivers/gpu/drm/drm_gem_vram_helper.c         |  2 +-
 drivers/gpu/drm/drm_ioc32.c                   |  2 +-
 drivers/gpu/drm/drm_ioctl.c                   |  4 ++--
 drivers/gpu/drm/drm_mipi_dbi.c                |  2 +-
 drivers/gpu/drm/drm_sysfs.c                   |  2 +-
 drivers/gpu/drm/drm_vm.c                      | 18 +++++++--------
 drivers/gpu/drm/etnaviv/etnaviv_drv.c         |  4 ++--
 .../drm/i915/display/intel_display_debugfs.c  |  4 ++--
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  2 +-
 drivers/gpu/drm/i915/i915_debugfs.c           |  6 ++---
 drivers/gpu/drm/i915/i915_sysfs.c             |  2 +-
 drivers/gpu/drm/loongson/lsdc_debugfs.c       |  4 ++--
 drivers/gpu/drm/loongson/lsdc_gem.c           |  2 +-
 drivers/gpu/drm/loongson/lsdc_output_7a2000.c |  2 +-
 drivers/gpu/drm/msm/adreno/a5xx_debugfs.c     |  4 ++--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c      |  2 +-
 drivers/gpu/drm/msm/dp/dp_debug.c             |  2 +-
 drivers/gpu/drm/msm/msm_debugfs.c             | 14 +++++++-----
 drivers/gpu/drm/msm/msm_drv.c                 |  2 +-
 drivers/gpu/drm/msm/msm_perf.c                |  4 ++--
 drivers/gpu/drm/msm/msm_rd.c                  |  4 ++--
 drivers/gpu/drm/nouveau/nouveau_debugfs.c     |  8 +++----
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  2 +-
 drivers/gpu/drm/omapdrm/omap_debugfs.c        |  6 ++---
 drivers/gpu/drm/pl111/pl111_debugfs.c         |  2 +-
 drivers/gpu/drm/qxl/qxl_debugfs.c             |  6 ++---
 drivers/gpu/drm/radeon/radeon_drv.c           |  2 +-
 drivers/gpu/drm/sti/sti_drv.c                 |  4 ++--
 drivers/gpu/drm/tegra/drm.c                   |  4 ++--
 drivers/gpu/drm/tegra/dsi.c                   |  2 +-
 drivers/gpu/drm/tegra/hdmi.c                  |  2 +-
 drivers/gpu/drm/tegra/sor.c                   |  4 ++--
 drivers/gpu/drm/tilcdc/tilcdc_drv.c           |  4 ++--
 drivers/gpu/drm/tiny/arcpgu.c                 |  2 +-
 drivers/gpu/drm/v3d/v3d_debugfs.c             |  3 ++-
 drivers/gpu/drm/vc4/vc4_bo.c                  |  2 +-
 drivers/gpu/drm/vc4/vc4_debugfs.c             |  2 +-
 drivers/gpu/drm/vc4/vc4_hvs.c                 |  2 +-
 drivers/gpu/drm/vc4/vc4_v3d.c                 |  2 +-
 drivers/gpu/drm/virtio/virtgpu_debugfs.c      |  6 ++---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |  2 +-
 include/drm/drm_file.h                        |  2 +-
 58 files changed, 139 insertions(+), 135 deletions(-)

diff --git a/drivers/accel/drm_accel.c b/drivers/accel/drm_accel.c
index 4a9baf02439e..871606023f95 100644
--- a/drivers/accel/drm_accel.c
+++ b/drivers/accel/drm_accel.c
@@ -55,7 +55,7 @@ static int accel_name_info(struct seq_file *m, void *data)
 {
 	struct drm_info_node *node = (struct drm_info_node *) m->private;
 	struct drm_minor *minor = node->minor;
-	struct drm_device *dev = minor->dev;
+	struct drm_device *dev = minor->drm;
 	struct drm_master *master;
 
 	mutex_lock(&dev->master_mutex);
@@ -89,7 +89,7 @@ static const struct drm_info_list accel_debugfs_list[] = {
  */
 void accel_debugfs_init(struct drm_minor *minor, int minor_id)
 {
-	struct drm_device *dev = minor->dev;
+	struct drm_device *dev = minor->drm;
 	char name[64];
 
 	INIT_LIST_HEAD(&minor->debugfs_list);
@@ -195,13 +195,13 @@ static struct drm_minor *accel_minor_acquire(unsigned int minor_id)
 	spin_lock_irqsave(&accel_minor_lock, flags);
 	minor = idr_find(&accel_minors_idr, minor_id);
 	if (minor)
-		drm_dev_get(minor->dev);
+		drm_dev_get(minor->drm);
 	spin_unlock_irqrestore(&accel_minor_lock, flags);
 
 	if (!minor) {
 		return ERR_PTR(-ENODEV);
-	} else if (drm_dev_is_unplugged(minor->dev)) {
-		drm_dev_put(minor->dev);
+	} else if (drm_dev_is_unplugged(minor->drm)) {
+		drm_dev_put(minor->drm);
 		return ERR_PTR(-ENODEV);
 	}
 
@@ -210,7 +210,7 @@ static struct drm_minor *accel_minor_acquire(unsigned int minor_id)
 
 static void accel_minor_release(struct drm_minor *minor)
 {
-	drm_dev_put(minor->dev);
+	drm_dev_put(minor->drm);
 }
 
 /**
@@ -234,7 +234,7 @@ int accel_open(struct inode *inode, struct file *filp)
 	if (IS_ERR(minor))
 		return PTR_ERR(minor);
 
-	dev = minor->dev;
+	dev = minor->drm;
 
 	atomic_fetch_inc(&dev->open_count);
 
@@ -264,7 +264,7 @@ static int accel_stub_open(struct inode *inode, struct file *filp)
 	if (IS_ERR(minor))
 		return PTR_ERR(minor);
 
-	new_fops = fops_get(minor->dev->driver->fops);
+	new_fops = fops_get(minor->drm->driver->fops);
 	if (!new_fops) {
 		err = -ENODEV;
 		goto out;
diff --git a/drivers/accel/ivpu/ivpu_debugfs.c b/drivers/accel/ivpu/ivpu_debugfs.c
index 5e5996fd4f9f..9e45beba88b5 100644
--- a/drivers/accel/ivpu/ivpu_debugfs.c
+++ b/drivers/accel/ivpu/ivpu_debugfs.c
@@ -22,7 +22,7 @@ static int bo_list_show(struct seq_file *s, void *v)
 	struct drm_info_node *node = (struct drm_info_node *)s->private;
 	struct drm_printer p = drm_seq_file_printer(s);
 
-	ivpu_bo_list(node->minor->dev, &p);
+	ivpu_bo_list(node->minor->drm, &p);
 
 	return 0;
 }
@@ -30,7 +30,7 @@ static int bo_list_show(struct seq_file *s, void *v)
 static int fw_name_show(struct seq_file *s, void *v)
 {
 	struct drm_info_node *node = (struct drm_info_node *)s->private;
-	struct ivpu_device *vdev = to_ivpu_device(node->minor->dev);
+	struct ivpu_device *vdev = to_ivpu_device(node->minor->drm);
 
 	seq_printf(s, "%s\n", vdev->fw->name);
 	return 0;
@@ -39,7 +39,7 @@ static int fw_name_show(struct seq_file *s, void *v)
 static int fw_trace_capability_show(struct seq_file *s, void *v)
 {
 	struct drm_info_node *node = (struct drm_info_node *)s->private;
-	struct ivpu_device *vdev = to_ivpu_device(node->minor->dev);
+	struct ivpu_device *vdev = to_ivpu_device(node->minor->drm);
 	u64 trace_hw_component_mask;
 	u32 trace_destination_mask;
 	int ret;
@@ -58,7 +58,7 @@ static int fw_trace_capability_show(struct seq_file *s, void *v)
 static int fw_trace_config_show(struct seq_file *s, void *v)
 {
 	struct drm_info_node *node = (struct drm_info_node *)s->private;
-	struct ivpu_device *vdev = to_ivpu_device(node->minor->dev);
+	struct ivpu_device *vdev = to_ivpu_device(node->minor->drm);
 	/**
 	 * WA: VPU_JSM_MSG_TRACE_GET_CONFIG command is not working yet,
 	 * so we use values from vdev->fw instead of calling ivpu_jsm_trace_get_config()
@@ -79,7 +79,7 @@ static int fw_trace_config_show(struct seq_file *s, void *v)
 static int last_bootmode_show(struct seq_file *s, void *v)
 {
 	struct drm_info_node *node = (struct drm_info_node *)s->private;
-	struct ivpu_device *vdev = to_ivpu_device(node->minor->dev);
+	struct ivpu_device *vdev = to_ivpu_device(node->minor->drm);
 
 	seq_printf(s, "%s\n", (vdev->pm->is_warmboot) ? "warmboot" : "coldboot");
 
@@ -89,7 +89,7 @@ static int last_bootmode_show(struct seq_file *s, void *v)
 static int reset_counter_show(struct seq_file *s, void *v)
 {
 	struct drm_info_node *node = (struct drm_info_node *)s->private;
-	struct ivpu_device *vdev = to_ivpu_device(node->minor->dev);
+	struct ivpu_device *vdev = to_ivpu_device(node->minor->drm);
 
 	seq_printf(s, "%d\n", atomic_read(&vdev->pm->reset_counter));
 	return 0;
@@ -98,7 +98,7 @@ static int reset_counter_show(struct seq_file *s, void *v)
 static int reset_pending_show(struct seq_file *s, void *v)
 {
 	struct drm_info_node *node = (struct drm_info_node *)s->private;
-	struct ivpu_device *vdev = to_ivpu_device(node->minor->dev);
+	struct ivpu_device *vdev = to_ivpu_device(node->minor->drm);
 
 	seq_printf(s, "%d\n", atomic_read(&vdev->pm->in_reset));
 	return 0;
@@ -272,7 +272,7 @@ static const struct file_operations ivpu_reset_engine_fops = {
 
 void ivpu_debugfs_init(struct drm_minor *minor)
 {
-	struct ivpu_device *vdev = to_ivpu_device(minor->dev);
+	struct ivpu_device *vdev = to_ivpu_device(minor->drm);
 
 	drm_debugfs_create_files(vdev_debugfs_list, ARRAY_SIZE(vdev_debugfs_list),
 				 minor->debugfs_root, minor);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 56dc69bc8b89..cdd9b84f420a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2738,7 +2738,7 @@ long amdgpu_drm_ioctl(struct file *filp,
 	struct drm_file *file_priv = filp->private_data;
 	struct drm_device *dev;
 	long ret;
-	dev = file_priv->minor->dev;
+	dev = file_priv->minor->drm;
 	ret = pm_runtime_get_sync(dev->dev);
 	if (ret < 0)
 		goto out;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
index 13d7413d4ca3..f881434f045f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
@@ -55,7 +55,7 @@ static const char *amdgpu_ip_name[AMDGPU_HW_IP_NUM] = {
 
 void amdgpu_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 {
-	struct amdgpu_device *adev = drm_to_adev(file->minor->dev);
+	struct amdgpu_device *adev = drm_to_adev(file->minor->drm);
 	struct amdgpu_fpriv *fpriv = file->driver_priv;
 	struct amdgpu_vm *vm = &fpriv->vm;
 
@@ -87,7 +87,7 @@ void amdgpu_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 	 */
 
 	drm_printf(p, "pasid:\t%u\n", fpriv->vm.pasid);
-	drm_printf(p, "drm-driver:\t%s\n", file->minor->dev->driver->name);
+	drm_printf(p, "drm-driver:\t%s\n", file->minor->drm->driver->name);
 	drm_printf(p, "drm-pdev:\t%04x:%02x:%02x.%d\n", domain, bus, dev, fn);
 	drm_printf(p, "drm-client-id:\t%Lu\n", vm->immediate.fence_context);
 	drm_printf(p, "drm-memory-vram:\t%llu KiB\n", stats.vram/1024UL);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
index d733fa6e7477..bcdff2307e73 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
@@ -238,12 +238,12 @@ static int amdgpu_xcp_dev_alloc(struct amdgpu_device *adev)
 			return ret;
 
 		/* Redirect all IOCTLs to the primary device */
-		adev->xcp_mgr->xcp[i].rdev = p_ddev->render->dev;
-		adev->xcp_mgr->xcp[i].pdev = p_ddev->primary->dev;
+		adev->xcp_mgr->xcp[i].rdev = p_ddev->render->drm;
+		adev->xcp_mgr->xcp[i].pdev = p_ddev->primary->drm;
 		adev->xcp_mgr->xcp[i].driver = (struct drm_driver *)p_ddev->driver;
 		adev->xcp_mgr->xcp[i].vma_offset_manager = p_ddev->vma_offset_manager;
-		p_ddev->render->dev = ddev;
-		p_ddev->primary->dev = ddev;
+		p_ddev->render->drm = ddev;
+		p_ddev->primary->drm = ddev;
 		p_ddev->vma_offset_manager = ddev->vma_offset_manager;
 		p_ddev->driver = &amdgpu_partition_driver;
 		adev->xcp_mgr->xcp[i].ddev = p_ddev;
@@ -342,8 +342,8 @@ void amdgpu_xcp_dev_unplug(struct amdgpu_device *adev)
 	for (i = 0; i < MAX_XCP; i++) {
 		p_ddev = adev->xcp_mgr->xcp[i].ddev;
 		drm_dev_unplug(p_ddev);
-		p_ddev->render->dev = adev->xcp_mgr->xcp[i].rdev;
-		p_ddev->primary->dev = adev->xcp_mgr->xcp[i].pdev;
+		p_ddev->render->drm = adev->xcp_mgr->xcp[i].rdev;
+		p_ddev->primary->drm = adev->xcp_mgr->xcp[i].pdev;
 		p_ddev->driver =  adev->xcp_mgr->xcp[i].driver;
 		p_ddev->vma_offset_manager = adev->xcp_mgr->xcp[i].vma_offset_manager;
 	}
diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index b23ca9b90b7c..adad8ba01d6b 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -547,13 +547,13 @@ static const struct file_operations malidp_debugfs_fops = {
 
 static void malidp_debugfs_init(struct drm_minor *minor)
 {
-	struct malidp_drm *malidp = drm_to_malidp(minor->dev);
+	struct malidp_drm *malidp = drm_to_malidp(minor->drm);
 
 	malidp_error_stats_init(&malidp->de_errors);
 	malidp_error_stats_init(&malidp->se_errors);
 	spin_lock_init(&malidp->errors_lock);
 	debugfs_create_file("debug", S_IRUGO | S_IWUSR, minor->debugfs_root,
-			    minor->dev, &malidp_debugfs_fops);
+			    minor->drm, &malidp_debugfs_fops);
 }
 
 #endif //CONFIG_DEBUG_FS
diff --git a/drivers/gpu/drm/armada/armada_debugfs.c b/drivers/gpu/drm/armada/armada_debugfs.c
index 29f4b52e3c8d..3a2c09681013 100644
--- a/drivers/gpu/drm/armada/armada_debugfs.c
+++ b/drivers/gpu/drm/armada/armada_debugfs.c
@@ -18,7 +18,7 @@
 static int armada_debugfs_gem_linear_show(struct seq_file *m, void *data)
 {
 	struct drm_info_node *node = m->private;
-	struct drm_device *dev = node->minor->dev;
+	struct drm_device *dev = node->minor->drm;
 	struct armada_private *priv = drm_to_armada_dev(dev);
 	struct drm_printer p = drm_seq_file_printer(m);
 
diff --git a/drivers/gpu/drm/drm_agpsupport.c b/drivers/gpu/drm/drm_agpsupport.c
index a4ad6fd13abc..9d023f53b599 100644
--- a/drivers/gpu/drm/drm_agpsupport.c
+++ b/drivers/gpu/drm/drm_agpsupport.c
@@ -127,7 +127,7 @@ EXPORT_SYMBOL(drm_legacy_agp_acquire);
 int drm_legacy_agp_acquire_ioctl(struct drm_device *dev, void *data,
 				 struct drm_file *file_priv)
 {
-	return drm_legacy_agp_acquire((struct drm_device *)file_priv->minor->dev);
+	return drm_legacy_agp_acquire((struct drm_device *)file_priv->minor->drm);
 }
 
 /*
diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index dfcd7aa474b7..ab851e7b1a41 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1835,7 +1835,7 @@ static const struct drm_debugfs_info drm_atomic_debugfs_list[] = {
 
 void drm_atomic_debugfs_init(struct drm_minor *minor)
 {
-	drm_debugfs_add_files(minor->dev, drm_atomic_debugfs_list,
+	drm_debugfs_add_files(minor->drm, drm_atomic_debugfs_list,
 			      ARRAY_SIZE(drm_atomic_debugfs_list));
 }
 #endif
diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index c37032bccd0f..012ed4b9ce6d 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -64,9 +64,9 @@
 static bool drm_is_current_master_locked(struct drm_file *fpriv)
 {
 	lockdep_assert_once(lockdep_is_held(&fpriv->master_lookup_lock) ||
-			    lockdep_is_held(&fpriv->minor->dev->master_mutex));
+			    lockdep_is_held(&fpriv->minor->drm->master_mutex));
 
-	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
+	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->drm->master;
 }
 
 /**
@@ -332,7 +332,7 @@ int drm_dropmaster_ioctl(struct drm_device *dev, void *data,
 
 int drm_master_open(struct drm_file *file_priv)
 {
-	struct drm_device *dev = file_priv->minor->dev;
+	struct drm_device *dev = file_priv->minor->drm;
 	int ret = 0;
 
 	/* if there is no current master make this fd it, but do not create
@@ -353,7 +353,7 @@ int drm_master_open(struct drm_file *file_priv)
 
 void drm_master_release(struct drm_file *file_priv)
 {
-	struct drm_device *dev = file_priv->minor->dev;
+	struct drm_device *dev = file_priv->minor->drm;
 	struct drm_master *master;
 
 	mutex_lock(&dev->master_mutex);
diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index 3b82635dc9ff..4b0d753ec32f 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -518,7 +518,7 @@ static const struct drm_debugfs_info drm_client_debugfs_list[] = {
 
 void drm_client_debugfs_init(struct drm_minor *minor)
 {
-	drm_debugfs_add_files(minor->dev, drm_client_debugfs_list,
+	drm_debugfs_add_files(minor->drm, drm_client_debugfs_list,
 			      ARRAY_SIZE(drm_client_debugfs_list));
 }
 #endif
diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 4542eed896dd..9cb888faa479 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -191,7 +191,7 @@ static const struct file_operations drm_debugfs_fops = {
 void drm_debugfs_create_files(const struct drm_info_list *files, int count,
 			      struct dentry *root, struct drm_minor *minor)
 {
-	struct drm_device *dev = minor->dev;
+	struct drm_device *dev = minor->drm;
 	struct drm_info_node *tmp;
 	int i;
 
@@ -221,7 +221,7 @@ EXPORT_SYMBOL(drm_debugfs_create_files);
 int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 		     struct dentry *root)
 {
-	struct drm_device *dev = minor->dev;
+	struct drm_device *dev = minor->drm;
 	struct drm_debugfs_entry *entry, *tmp;
 	char name[64];
 
@@ -230,7 +230,8 @@ int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 	sprintf(name, "%d", minor_id);
 	minor->debugfs_root = debugfs_create_dir(name, root);
 
-	drm_debugfs_add_files(minor->dev, drm_debugfs_list, DRM_DEBUGFS_ENTRIES);
+	drm_debugfs_add_files(minor->drm, drm_debugfs_list,
+			      DRM_DEBUGFS_ENTRIES);
 
 	if (drm_drv_uses_atomic_modeset(dev)) {
 		drm_atomic_debugfs_init(minor);
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 12687dd9e1ac..fc1d47e08427 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -103,7 +103,7 @@ static void drm_minor_alloc_release(struct drm_device *dev, void *data)
 	struct drm_minor *minor = data;
 	unsigned long flags;
 
-	WARN_ON(dev != minor->dev);
+	WARN_ON(dev != minor->drm);
 
 	put_device(minor->kdev);
 
@@ -127,7 +127,7 @@ static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
 		return -ENOMEM;
 
 	minor->type = type;
-	minor->dev = dev;
+	minor->drm = dev;
 
 	idr_preload(GFP_KERNEL);
 	if (type == DRM_MINOR_ACCEL) {
@@ -243,13 +243,13 @@ struct drm_minor *drm_minor_acquire(unsigned int minor_id)
 	spin_lock_irqsave(&drm_minor_lock, flags);
 	minor = idr_find(&drm_minors_idr, minor_id);
 	if (minor)
-		drm_dev_get(minor->dev);
+		drm_dev_get(minor->drm);
 	spin_unlock_irqrestore(&drm_minor_lock, flags);
 
 	if (!minor) {
 		return ERR_PTR(-ENODEV);
-	} else if (drm_dev_is_unplugged(minor->dev)) {
-		drm_dev_put(minor->dev);
+	} else if (drm_dev_is_unplugged(minor->drm)) {
+		drm_dev_put(minor->drm);
 		return ERR_PTR(-ENODEV);
 	}
 
@@ -258,7 +258,7 @@ struct drm_minor *drm_minor_acquire(unsigned int minor_id)
 
 void drm_minor_release(struct drm_minor *minor)
 {
-	drm_dev_put(minor->dev);
+	drm_dev_put(minor->drm);
 }
 
 /**
@@ -1036,7 +1036,7 @@ static int drm_stub_open(struct inode *inode, struct file *filp)
 	if (IS_ERR(minor))
 		return PTR_ERR(minor);
 
-	new_fops = fops_get(minor->dev->driver->fops);
+	new_fops = fops_get(minor->drm->driver->fops);
 	if (!new_fops) {
 		err = -ENODEV;
 		goto out;
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 883d83bc0e3d..1f8b2e5b122b 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -150,7 +150,7 @@ bool drm_dev_needs_global_mutex(struct drm_device *dev)
 struct drm_file *drm_file_alloc(struct drm_minor *minor)
 {
 	static atomic64_t ident = ATOMIC_INIT(0);
-	struct drm_device *dev = minor->dev;
+	struct drm_device *dev = minor->drm;
 	struct drm_file *file;
 	int ret;
 
@@ -208,7 +208,7 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
 
 static void drm_events_release(struct drm_file *file_priv)
 {
-	struct drm_device *dev = file_priv->minor->dev;
+	struct drm_device *dev = file_priv->minor->drm;
 	struct drm_pending_event *e, *et;
 	unsigned long flags;
 
@@ -247,7 +247,7 @@ void drm_file_free(struct drm_file *file)
 	if (!file)
 		return;
 
-	dev = file->minor->dev;
+	dev = file->minor->drm;
 
 	drm_dbg_core(dev, "comm=\"%s\", pid=%d, dev=0x%lx, open_count=%d\n",
 		     current->comm, task_pid_nr(current),
@@ -298,7 +298,7 @@ void drm_file_free(struct drm_file *file)
 static void drm_close_helper(struct file *filp)
 {
 	struct drm_file *file_priv = filp->private_data;
-	struct drm_device *dev = file_priv->minor->dev;
+	struct drm_device *dev = file_priv->minor->drm;
 
 	mutex_lock(&dev->filelist_mutex);
 	list_del(&file_priv->lhead);
@@ -332,7 +332,7 @@ static int drm_cpu_valid(void)
  */
 int drm_open_helper(struct file *filp, struct drm_minor *minor)
 {
-	struct drm_device *dev = minor->dev;
+	struct drm_device *dev = minor->drm;
 	struct drm_file *priv;
 	int ret;
 
@@ -417,7 +417,7 @@ int drm_open(struct inode *inode, struct file *filp)
 	if (IS_ERR(minor))
 		return PTR_ERR(minor);
 
-	dev = minor->dev;
+	dev = minor->drm;
 	if (drm_dev_needs_global_mutex(dev))
 		mutex_lock(&drm_global_mutex);
 
@@ -484,7 +484,7 @@ int drm_release(struct inode *inode, struct file *filp)
 {
 	struct drm_file *file_priv = filp->private_data;
 	struct drm_minor *minor = file_priv->minor;
-	struct drm_device *dev = minor->dev;
+	struct drm_device *dev = minor->drm;
 
 	if (drm_dev_needs_global_mutex(dev))
 		mutex_lock(&drm_global_mutex);
@@ -524,7 +524,7 @@ int drm_release_noglobal(struct inode *inode, struct file *filp)
 {
 	struct drm_file *file_priv = filp->private_data;
 	struct drm_minor *minor = file_priv->minor;
-	struct drm_device *dev = minor->dev;
+	struct drm_device *dev = minor->drm;
 
 	drm_close_helper(filp);
 
@@ -568,7 +568,7 @@ ssize_t drm_read(struct file *filp, char __user *buffer,
 		 size_t count, loff_t *offset)
 {
 	struct drm_file *file_priv = filp->private_data;
-	struct drm_device *dev = file_priv->minor->dev;
+	struct drm_device *dev = file_priv->minor->drm;
 	ssize_t ret;
 
 	ret = mutex_lock_interruptible(&file_priv->event_read_lock);
@@ -981,7 +981,7 @@ EXPORT_SYMBOL(drm_show_memory_stats);
 void drm_show_fdinfo(struct seq_file *m, struct file *f)
 {
 	struct drm_file *file = f->private_data;
-	struct drm_device *dev = file->minor->dev;
+	struct drm_device *dev = file->minor->drm;
 	struct drm_printer p = drm_seq_file_printer(m);
 
 	drm_printf(&p, "drm-driver:\t%s\n", dev->driver->name);
@@ -1016,7 +1016,7 @@ EXPORT_SYMBOL(drm_show_fdinfo);
  */
 struct file *mock_drm_getfile(struct drm_minor *minor, unsigned int flags)
 {
-	struct drm_device *dev = minor->dev;
+	struct drm_device *dev = minor->drm;
 	struct drm_file *priv;
 	struct file *file;
 
diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index 882a8b1eaa16..f987c018b65d 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -1224,7 +1224,7 @@ static const struct drm_debugfs_info drm_framebuffer_debugfs_list[] = {
 
 void drm_framebuffer_debugfs_init(struct drm_minor *minor)
 {
-	drm_debugfs_add_files(minor->dev, drm_framebuffer_debugfs_list,
+	drm_debugfs_add_files(minor->drm, drm_framebuffer_debugfs_list,
 			      ARRAY_SIZE(drm_framebuffer_debugfs_list));
 }
 #endif
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index ce9a8a3d281c..5e4c465ac73f 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1084,7 +1084,7 @@ EXPORT_SYMBOL(drm_gem_mmap_obj);
 int drm_gem_mmap(struct file *filp, struct vm_area_struct *vma)
 {
 	struct drm_file *priv = filp->private_data;
-	struct drm_device *dev = priv->minor->dev;
+	struct drm_device *dev = priv->minor->drm;
 	struct drm_gem_object *obj = NULL;
 	struct drm_vma_offset_node *node;
 	int ret;
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 54e53ca19482..da351a6816cf 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -989,7 +989,7 @@ static const struct drm_debugfs_info drm_vram_mm_debugfs_list[] = {
  */
 void drm_vram_mm_debugfs_init(struct drm_minor *minor)
 {
-	drm_debugfs_add_files(minor->dev, drm_vram_mm_debugfs_list,
+	drm_debugfs_add_files(minor->drm, drm_vram_mm_debugfs_list,
 			      ARRAY_SIZE(drm_vram_mm_debugfs_list));
 }
 EXPORT_SYMBOL(drm_vram_mm_debugfs_init);
diff --git a/drivers/gpu/drm/drm_ioc32.c b/drivers/gpu/drm/drm_ioc32.c
index 49a743f62b4a..2b0d3eb060d2 100644
--- a/drivers/gpu/drm/drm_ioc32.c
+++ b/drivers/gpu/drm/drm_ioc32.c
@@ -972,7 +972,7 @@ long drm_compat_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 {
 	unsigned int nr = DRM_IOCTL_NR(cmd);
 	struct drm_file *file_priv = filp->private_data;
-	struct drm_device *dev = file_priv->minor->dev;
+	struct drm_device *dev = file_priv->minor->drm;
 	drm_ioctl_compat_t *fn;
 	int ret;
 
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 8e9afe7af19c..188fa010a356 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -771,7 +771,7 @@ long drm_ioctl_kernel(struct file *file, drm_ioctl_t *func, void *kdata,
 		      u32 flags)
 {
 	struct drm_file *file_priv = file->private_data;
-	struct drm_device *dev = file_priv->minor->dev;
+	struct drm_device *dev = file_priv->minor->drm;
 	int retcode;
 
 	if (drm_dev_is_unplugged(dev))
@@ -821,7 +821,7 @@ long drm_ioctl(struct file *filp,
 	unsigned int in_size, out_size, drv_size, ksize;
 	bool is_driver_ioctl;
 
-	dev = file_priv->minor->dev;
+	dev = file_priv->minor->drm;
 
 	if (drm_dev_is_unplugged(dev))
 		return -ENODEV;
diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 7b85ebaac7c8..75019ccfc024 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -1449,7 +1449,7 @@ static const struct file_operations mipi_dbi_debugfs_command_fops = {
  */
 void mipi_dbi_debugfs_init(struct drm_minor *minor)
 {
-	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(minor->dev);
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(minor->drm);
 	umode_t mode = S_IFREG | S_IWUSR;
 
 	if (dbidev->dbi.read_commands)
diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index 6ad7b54c8f13..d52c2c0f24ee 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -546,7 +546,7 @@ struct device *drm_sysfs_minor_alloc(struct drm_minor *minor)
 		kdev->type = &drm_sysfs_device_minor;
 	}
 
-	kdev->parent = minor->dev->dev;
+	kdev->parent = minor->drm->dev;
 	kdev->release = drm_sysfs_release;
 	dev_set_drvdata(kdev, minor);
 
diff --git a/drivers/gpu/drm/drm_vm.c b/drivers/gpu/drm/drm_vm.c
index 87c9fe55dec7..022837fee2a1 100644
--- a/drivers/gpu/drm/drm_vm.c
+++ b/drivers/gpu/drm/drm_vm.c
@@ -111,7 +111,7 @@ static vm_fault_t drm_vm_fault(struct vm_fault *vmf)
 {
 	struct vm_area_struct *vma = vmf->vma;
 	struct drm_file *priv = vma->vm_file->private_data;
-	struct drm_device *dev = priv->minor->dev;
+	struct drm_device *dev = priv->minor->drm;
 	struct drm_local_map *map = NULL;
 	struct drm_map_list *r_list;
 	struct drm_hash_item *hash;
@@ -230,7 +230,7 @@ static vm_fault_t drm_vm_shm_fault(struct vm_fault *vmf)
 static void drm_vm_shm_close(struct vm_area_struct *vma)
 {
 	struct drm_file *priv = vma->vm_file->private_data;
-	struct drm_device *dev = priv->minor->dev;
+	struct drm_device *dev = priv->minor->drm;
 	struct drm_vma_entry *pt, *temp;
 	struct drm_local_map *map;
 	struct drm_map_list *r_list;
@@ -300,7 +300,7 @@ static vm_fault_t drm_vm_dma_fault(struct vm_fault *vmf)
 {
 	struct vm_area_struct *vma = vmf->vma;
 	struct drm_file *priv = vma->vm_file->private_data;
-	struct drm_device *dev = priv->minor->dev;
+	struct drm_device *dev = priv->minor->drm;
 	struct drm_device_dma *dma = dev->dma;
 	unsigned long offset;
 	unsigned long page_nr;
@@ -336,7 +336,7 @@ static vm_fault_t drm_vm_sg_fault(struct vm_fault *vmf)
 	struct vm_area_struct *vma = vmf->vma;
 	struct drm_local_map *map = vma->vm_private_data;
 	struct drm_file *priv = vma->vm_file->private_data;
-	struct drm_device *dev = priv->minor->dev;
+	struct drm_device *dev = priv->minor->drm;
 	struct drm_sg_mem *entry = dev->sg;
 	unsigned long offset;
 	unsigned long map_offset;
@@ -405,7 +405,7 @@ static void drm_vm_open_locked(struct drm_device *dev,
 static void drm_vm_open(struct vm_area_struct *vma)
 {
 	struct drm_file *priv = vma->vm_file->private_data;
-	struct drm_device *dev = priv->minor->dev;
+	struct drm_device *dev = priv->minor->drm;
 
 	mutex_lock(&dev->struct_mutex);
 	drm_vm_open_locked(dev, vma);
@@ -440,7 +440,7 @@ static void drm_vm_close_locked(struct drm_device *dev,
 static void drm_vm_close(struct vm_area_struct *vma)
 {
 	struct drm_file *priv = vma->vm_file->private_data;
-	struct drm_device *dev = priv->minor->dev;
+	struct drm_device *dev = priv->minor->drm;
 
 	mutex_lock(&dev->struct_mutex);
 	drm_vm_close_locked(dev, vma);
@@ -464,7 +464,7 @@ static int drm_mmap_dma(struct file *filp, struct vm_area_struct *vma)
 	struct drm_device_dma *dma;
 	unsigned long length = vma->vm_end - vma->vm_start;
 
-	dev = priv->minor->dev;
+	dev = priv->minor->drm;
 	dma = dev->dma;
 	DRM_DEBUG("start = 0x%lx, end = 0x%lx, page offset = 0x%lx\n",
 		  vma->vm_start, vma->vm_end, vma->vm_pgoff);
@@ -523,7 +523,7 @@ static resource_size_t drm_core_get_reg_ofs(struct drm_device *dev)
 static int drm_mmap_locked(struct file *filp, struct vm_area_struct *vma)
 {
 	struct drm_file *priv = filp->private_data;
-	struct drm_device *dev = priv->minor->dev;
+	struct drm_device *dev = priv->minor->drm;
 	struct drm_local_map *map = NULL;
 	resource_size_t offset = 0;
 	struct drm_hash_item *hash;
@@ -637,7 +637,7 @@ static int drm_mmap_locked(struct file *filp, struct vm_area_struct *vma)
 int drm_legacy_mmap(struct file *filp, struct vm_area_struct *vma)
 {
 	struct drm_file *priv = filp->private_data;
-	struct drm_device *dev = priv->minor->dev;
+	struct drm_device *dev = priv->minor->drm;
 	int ret;
 
 	if (drm_dev_is_unplugged(dev))
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index ea55f6b7b744..f08fbdae5c8e 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -199,7 +199,7 @@ static int etnaviv_ring_show(struct etnaviv_gpu *gpu, struct seq_file *m)
 static int show_unlocked(struct seq_file *m, void *arg)
 {
 	struct drm_info_node *node = (struct drm_info_node *) m->private;
-	struct drm_device *dev = node->minor->dev;
+	struct drm_device *dev = node->minor->drm;
 	int (*show)(struct drm_device *dev, struct seq_file *m) =
 			node->info_ent->data;
 
@@ -209,7 +209,7 @@ static int show_unlocked(struct seq_file *m, void *arg)
 static int show_each_gpu(struct seq_file *m, void *arg)
 {
 	struct drm_info_node *node = (struct drm_info_node *) m->private;
-	struct drm_device *dev = node->minor->dev;
+	struct drm_device *dev = node->minor->drm;
 	struct etnaviv_drm_private *priv = dev->dev_private;
 	struct etnaviv_gpu *gpu;
 	int (*show)(struct etnaviv_gpu *gpu, struct seq_file *m) =
diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index a4b818da32ed..5448d08cabef 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -36,7 +36,7 @@
 
 static inline struct drm_i915_private *node_to_i915(struct drm_info_node *node)
 {
-	return to_i915(node->minor->dev);
+	return to_i915(node->minor->drm);
 }
 
 static int i915_frontbuffer_tracking(struct seq_file *m, void *unused)
@@ -1084,7 +1084,7 @@ void intel_display_debugfs_register(struct drm_i915_private *i915)
 		debugfs_create_file(intel_display_debugfs_files[i].name,
 				    S_IRUGO | S_IWUSR,
 				    minor->debugfs_root,
-				    to_i915(minor->dev),
+				    to_i915(minor->drm),
 				    intel_display_debugfs_files[i].fops);
 	}
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index 89ef6b44aa03..ec403396fd3e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -1024,7 +1024,7 @@ int i915_gem_mmap(struct file *filp, struct vm_area_struct *vma)
 {
 	struct drm_vma_offset_node *node;
 	struct drm_file *priv = filp->private_data;
-	struct drm_device *dev = priv->minor->dev;
+	struct drm_device *dev = priv->minor->drm;
 	struct drm_i915_gem_object *obj = NULL;
 	struct i915_mmap_offset *mmo = NULL;
 
diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index 76ccd4e03e31..e05521958262 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -56,7 +56,7 @@
 
 static inline struct drm_i915_private *node_to_i915(struct drm_info_node *node)
 {
-	return to_i915(node->minor->dev);
+	return to_i915(node->minor->drm);
 }
 
 static int i915_capabilities(struct seq_file *m, void *data)
@@ -846,12 +846,12 @@ void i915_debugfs_register(struct drm_i915_private *dev_priv)
 	i915_debugfs_params(dev_priv);
 
 	debugfs_create_file("i915_forcewake_user", S_IRUSR, minor->debugfs_root,
-			    to_i915(minor->dev), &i915_forcewake_fops);
+			    to_i915(minor->drm), &i915_forcewake_fops);
 	for (i = 0; i < ARRAY_SIZE(i915_debugfs_files); i++) {
 		debugfs_create_file(i915_debugfs_files[i].name,
 				    S_IRUGO | S_IWUSR,
 				    minor->debugfs_root,
-				    to_i915(minor->dev),
+				    to_i915(minor->drm),
 				    i915_debugfs_files[i].fops);
 	}
 
diff --git a/drivers/gpu/drm/i915/i915_sysfs.c b/drivers/gpu/drm/i915/i915_sysfs.c
index e88bb4f04305..ccc0a6ddf7ff 100644
--- a/drivers/gpu/drm/i915/i915_sysfs.c
+++ b/drivers/gpu/drm/i915/i915_sysfs.c
@@ -41,7 +41,7 @@
 struct drm_i915_private *kdev_minor_to_i915(struct device *kdev)
 {
 	struct drm_minor *minor = dev_get_drvdata(kdev);
-	return to_i915(minor->dev);
+	return to_i915(minor->drm);
 }
 
 static int l3_access_valid(struct drm_i915_private *i915, loff_t offset)
diff --git a/drivers/gpu/drm/loongson/lsdc_debugfs.c b/drivers/gpu/drm/loongson/lsdc_debugfs.c
index b9c2e6b1701f..7b1d16535105 100644
--- a/drivers/gpu/drm/loongson/lsdc_debugfs.c
+++ b/drivers/gpu/drm/loongson/lsdc_debugfs.c
@@ -33,7 +33,7 @@ static int lsdc_identify(struct seq_file *m, void *arg)
 static int lsdc_show_mm(struct seq_file *m, void *arg)
 {
 	struct drm_info_node *node = (struct drm_info_node *)m->private;
-	struct drm_device *ddev = node->minor->dev;
+	struct drm_device *ddev = node->minor->drm;
 	struct drm_printer p = drm_seq_file_printer(m);
 
 	drm_mm_print(&ddev->vma_offset_manager->vm_addr_space_mm, &p);
@@ -96,7 +96,7 @@ static struct drm_info_list lsdc_debugfs_list[] = {
 
 void lsdc_debugfs_init(struct drm_minor *minor)
 {
-	struct drm_device *ddev = minor->dev;
+	struct drm_device *ddev = minor->drm;
 	struct lsdc_device *ldev = to_lsdc(ddev);
 	unsigned int n = ARRAY_SIZE(lsdc_debugfs_list);
 	unsigned int i;
diff --git a/drivers/gpu/drm/loongson/lsdc_gem.c b/drivers/gpu/drm/loongson/lsdc_gem.c
index a4029fd72df9..dc54514fec74 100644
--- a/drivers/gpu/drm/loongson/lsdc_gem.c
+++ b/drivers/gpu/drm/loongson/lsdc_gem.c
@@ -282,7 +282,7 @@ void lsdc_gem_init(struct drm_device *ddev)
 int lsdc_show_buffer_object(struct seq_file *m, void *arg)
 {
 	struct drm_info_node *node = (struct drm_info_node *)m->private;
-	struct drm_device *ddev = node->minor->dev;
+	struct drm_device *ddev = node->minor->drm;
 	struct lsdc_device *ldev = to_lsdc(ddev);
 	struct lsdc_bo *lbo;
 	unsigned int i;
diff --git a/drivers/gpu/drm/loongson/lsdc_output_7a2000.c b/drivers/gpu/drm/loongson/lsdc_output_7a2000.c
index 9b230c56d6bd..7cc01623e389 100644
--- a/drivers/gpu/drm/loongson/lsdc_output_7a2000.c
+++ b/drivers/gpu/drm/loongson/lsdc_output_7a2000.c
@@ -113,7 +113,7 @@ static const struct lsdc_reg32 ls7a2000_hdmi1_encoder_regs[] = {
 static int ls7a2000_hdmi_encoder_regs_show(struct seq_file *m, void *data)
 {
 	struct drm_info_node *node = (struct drm_info_node *)m->private;
-	struct drm_device *ddev = node->minor->dev;
+	struct drm_device *ddev = node->minor->drm;
 	struct lsdc_device *ldev = to_lsdc(ddev);
 	const struct lsdc_reg32 *preg;
 
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c b/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
index 169b8fe688f8..712c6f71d4ab 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
@@ -70,7 +70,7 @@ static void roq_print(struct msm_gpu *gpu, struct drm_printer *p)
 static int show(struct seq_file *m, void *arg)
 {
 	struct drm_info_node *node = m->private;
-	struct drm_device *dev = node->minor->dev;
+	struct drm_device *dev = node->minor->drm;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct drm_printer p = drm_seq_file_printer(m);
 	void (*show)(struct msm_gpu *gpu, struct drm_printer *p) =
@@ -148,7 +148,7 @@ void a5xx_debugfs_init(struct msm_gpu *gpu, struct drm_minor *minor)
 	if (!minor)
 		return;
 
-	dev = minor->dev;
+	dev = minor->drm;
 
 	drm_debugfs_create_files(a5xx_debugfs_list,
 				 ARRAY_SIZE(a5xx_debugfs_list),
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index b7039b5102d6..ca75251682f0 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -230,7 +230,7 @@ static void mdp5_kms_destroy(struct msm_kms *kms)
 static int smp_show(struct seq_file *m, void *arg)
 {
 	struct drm_info_node *node = m->private;
-	struct drm_device *dev = node->minor->dev;
+	struct drm_device *dev = node->minor->drm;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
 	struct drm_printer p = drm_seq_file_printer(m);
diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
index 3bba901afe33..dce9a70b74bb 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.c
+++ b/drivers/gpu/drm/msm/dp/dp_debug.c
@@ -254,7 +254,7 @@ struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
 	debug->link = link;
 	debug->panel = panel;
 	debug->dev = dev;
-	debug->drm_dev = minor->dev;
+	debug->drm_dev = minor->drm;
 	debug->connector = connector;
 
 	dp_debug = &debug->dp_debug;
diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index a0a936f80ae3..f198996998c3 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -212,7 +212,7 @@ DEFINE_DEBUGFS_ATTRIBUTE(shrink_fops,
 static int msm_gem_show(struct seq_file *m, void *arg)
 {
 	struct drm_info_node *node = m->private;
-	struct drm_device *dev = node->minor->dev;
+	struct drm_device *dev = node->minor->drm;
 	struct msm_drm_private *priv = dev->dev_private;
 	int ret;
 
@@ -230,7 +230,7 @@ static int msm_gem_show(struct seq_file *m, void *arg)
 static int msm_mm_show(struct seq_file *m, void *arg)
 {
 	struct drm_info_node *node = m->private;
-	struct drm_device *dev = node->minor->dev;
+	struct drm_device *dev = node->minor->drm;
 	struct drm_printer p = drm_seq_file_printer(m);
 
 	drm_mm_print(&dev->vma_offset_manager->vm_addr_space_mm, &p);
@@ -241,7 +241,7 @@ static int msm_mm_show(struct seq_file *m, void *arg)
 static int msm_fb_show(struct seq_file *m, void *arg)
 {
 	struct drm_info_node *node = m->private;
-	struct drm_device *dev = node->minor->dev;
+	struct drm_device *dev = node->minor->drm;
 	struct drm_framebuffer *fb, *fbdev_fb = NULL;
 
 	if (dev->fb_helper && dev->fb_helper->fb) {
@@ -278,13 +278,15 @@ static int late_init_minor(struct drm_minor *minor)
 
 	ret = msm_rd_debugfs_init(minor);
 	if (ret) {
-		DRM_DEV_ERROR(minor->dev->dev, "could not install rd debugfs\n");
+		DRM_DEV_ERROR(minor->drm->dev,
+			      "could not install rd debugfs\n");
 		return ret;
 	}
 
 	ret = msm_perf_debugfs_init(minor);
 	if (ret) {
-		DRM_DEV_ERROR(minor->dev->dev, "could not install perf debugfs\n");
+		DRM_DEV_ERROR(minor->drm->dev,
+			      "could not install perf debugfs\n");
 		return ret;
 	}
 
@@ -303,7 +305,7 @@ int msm_debugfs_late_init(struct drm_device *dev)
 
 void msm_debugfs_init(struct drm_minor *minor)
 {
-	struct drm_device *dev = minor->dev;
+	struct drm_device *dev = minor->drm;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct dentry *gpu_devfreq;
 
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 11ff297db886..f9b890422980 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1059,7 +1059,7 @@ static const struct drm_ioctl_desc msm_ioctls[] = {
 
 static void msm_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 {
-	struct drm_device *dev = file->minor->dev;
+	struct drm_device *dev = file->minor->drm;
 	struct msm_drm_private *priv = dev->dev_private;
 
 	if (!priv->gpu)
diff --git a/drivers/gpu/drm/msm/msm_perf.c b/drivers/gpu/drm/msm/msm_perf.c
index 3d3da79fec2a..cb0243671944 100644
--- a/drivers/gpu/drm/msm/msm_perf.c
+++ b/drivers/gpu/drm/msm/msm_perf.c
@@ -198,7 +198,7 @@ static const struct file_operations perf_debugfs_fops = {
 
 int msm_perf_debugfs_init(struct drm_minor *minor)
 {
-	struct msm_drm_private *priv = minor->dev->dev_private;
+	struct msm_drm_private *priv = minor->drm->dev_private;
 	struct msm_perf_state *perf;
 
 	/* only create on first minor: */
@@ -209,7 +209,7 @@ int msm_perf_debugfs_init(struct drm_minor *minor)
 	if (!perf)
 		return -ENOMEM;
 
-	perf->dev = minor->dev;
+	perf->dev = minor->drm;
 
 	mutex_init(&perf->read_lock);
 	priv->perf = perf;
diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
index 8d5687d5ed78..430783cf4974 100644
--- a/drivers/gpu/drm/msm/msm_rd.c
+++ b/drivers/gpu/drm/msm/msm_rd.c
@@ -250,7 +250,7 @@ static struct msm_rd_state *rd_init(struct drm_minor *minor, const char *name)
 	if (!rd)
 		return ERR_PTR(-ENOMEM);
 
-	rd->dev = minor->dev;
+	rd->dev = minor->drm;
 	rd->fifo.buf = rd->buf;
 
 	mutex_init(&rd->read_lock);
@@ -266,7 +266,7 @@ static struct msm_rd_state *rd_init(struct drm_minor *minor, const char *name)
 
 int msm_rd_debugfs_init(struct drm_minor *minor)
 {
-	struct msm_drm_private *priv = minor->dev->dev_private;
+	struct msm_drm_private *priv = minor->drm->dev_private;
 	struct msm_rd_state *rd;
 	int ret;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
index 99d022a91afc..0c57e3b426b4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -38,7 +38,7 @@ static int
 nouveau_debugfs_vbios_image(struct seq_file *m, void *data)
 {
 	struct drm_info_node *node = (struct drm_info_node *) m->private;
-	struct nouveau_drm *drm = nouveau_drm(node->minor->dev);
+	struct nouveau_drm *drm = nouveau_drm(node->minor->drm);
 	int i;
 
 	for (i = 0; i < drm->vbios.length; i++)
@@ -50,7 +50,7 @@ static int
 nouveau_debugfs_strap_peek(struct seq_file *m, void *data)
 {
 	struct drm_info_node *node = m->private;
-	struct nouveau_drm *drm = nouveau_drm(node->minor->dev);
+	struct nouveau_drm *drm = nouveau_drm(node->minor->drm);
 	int ret;
 
 	ret = pm_runtime_get_sync(drm->dev->dev);
@@ -227,14 +227,14 @@ static const struct nouveau_debugfs_files {
 void
 nouveau_drm_debugfs_init(struct drm_minor *minor)
 {
-	struct nouveau_drm *drm = nouveau_drm(minor->dev);
+	struct nouveau_drm *drm = nouveau_drm(minor->drm);
 	struct dentry *dentry;
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(nouveau_debugfs_files); i++) {
 		debugfs_create_file(nouveau_debugfs_files[i].name,
 				    S_IRUGO | S_IWUSR,
-				    minor->debugfs_root, minor->dev,
+				    minor->debugfs_root, minor->drm,
 				    nouveau_debugfs_files[i].fops);
 	}
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index ca3bb8075357..5af878525516 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1185,7 +1185,7 @@ long
 nouveau_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 {
 	struct drm_file *filp = file->private_data;
-	struct drm_device *dev = filp->minor->dev;
+	struct drm_device *dev = filp->minor->drm;
 	long ret;
 
 	ret = pm_runtime_get_sync(dev->dev);
diff --git a/drivers/gpu/drm/omapdrm/omap_debugfs.c b/drivers/gpu/drm/omapdrm/omap_debugfs.c
index a3d470468e5b..025b1cc7dcf5 100644
--- a/drivers/gpu/drm/omapdrm/omap_debugfs.c
+++ b/drivers/gpu/drm/omapdrm/omap_debugfs.c
@@ -20,7 +20,7 @@
 static int gem_show(struct seq_file *m, void *arg)
 {
 	struct drm_info_node *node = (struct drm_info_node *) m->private;
-	struct drm_device *dev = node->minor->dev;
+	struct drm_device *dev = node->minor->drm;
 	struct omap_drm_private *priv = dev->dev_private;
 
 	seq_printf(m, "All Objects:\n");
@@ -34,7 +34,7 @@ static int gem_show(struct seq_file *m, void *arg)
 static int mm_show(struct seq_file *m, void *arg)
 {
 	struct drm_info_node *node = (struct drm_info_node *) m->private;
-	struct drm_device *dev = node->minor->dev;
+	struct drm_device *dev = node->minor->drm;
 	struct drm_printer p = drm_seq_file_printer(m);
 
 	drm_mm_print(&dev->vma_offset_manager->vm_addr_space_mm, &p);
@@ -46,7 +46,7 @@ static int mm_show(struct seq_file *m, void *arg)
 static int fb_show(struct seq_file *m, void *arg)
 {
 	struct drm_info_node *node = (struct drm_info_node *) m->private;
-	struct drm_device *dev = node->minor->dev;
+	struct drm_device *dev = node->minor->drm;
 	struct drm_fb_helper *helper = dev->fb_helper;
 	struct drm_framebuffer *fb;
 
diff --git a/drivers/gpu/drm/pl111/pl111_debugfs.c b/drivers/gpu/drm/pl111/pl111_debugfs.c
index 6744fa16f464..51a90b04bd25 100644
--- a/drivers/gpu/drm/pl111/pl111_debugfs.c
+++ b/drivers/gpu/drm/pl111/pl111_debugfs.c
@@ -33,7 +33,7 @@ static const struct {
 static int pl111_debugfs_regs(struct seq_file *m, void *unused)
 {
 	struct drm_info_node *node = (struct drm_info_node *)m->private;
-	struct drm_device *dev = node->minor->dev;
+	struct drm_device *dev = node->minor->drm;
 	struct pl111_drm_dev_private *priv = dev->dev_private;
 	int i;
 
diff --git a/drivers/gpu/drm/qxl/qxl_debugfs.c b/drivers/gpu/drm/qxl/qxl_debugfs.c
index 2d9ed3b94574..3fd8e02066c1 100644
--- a/drivers/gpu/drm/qxl/qxl_debugfs.c
+++ b/drivers/gpu/drm/qxl/qxl_debugfs.c
@@ -39,7 +39,7 @@ static int
 qxl_debugfs_irq_received(struct seq_file *m, void *data)
 {
 	struct drm_info_node *node = (struct drm_info_node *) m->private;
-	struct qxl_device *qdev = to_qxl(node->minor->dev);
+	struct qxl_device *qdev = to_qxl(node->minor->drm);
 
 	seq_printf(m, "%d\n", atomic_read(&qdev->irq_received));
 	seq_printf(m, "%d\n", atomic_read(&qdev->irq_received_display));
@@ -53,7 +53,7 @@ static int
 qxl_debugfs_buffers_info(struct seq_file *m, void *data)
 {
 	struct drm_info_node *node = (struct drm_info_node *) m->private;
-	struct qxl_device *qdev = to_qxl(node->minor->dev);
+	struct qxl_device *qdev = to_qxl(node->minor->drm);
 	struct qxl_bo *bo;
 
 	list_for_each_entry(bo, &qdev->gem.objects, list) {
@@ -87,7 +87,7 @@ void
 qxl_debugfs_init(struct drm_minor *minor)
 {
 #if defined(CONFIG_DEBUG_FS)
-	struct qxl_device *dev = to_qxl(minor->dev);
+	struct qxl_device *dev = to_qxl(minor->drm);
 
 	drm_debugfs_create_files(qxl_debugfs_list, QXL_DEBUGFS_ENTRIES,
 				 minor->debugfs_root, minor);
diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index 39cdede460b5..41abd4e232c4 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -494,7 +494,7 @@ long radeon_drm_ioctl(struct file *filp,
 	struct drm_file *file_priv = filp->private_data;
 	struct drm_device *dev;
 	long ret;
-	dev = file_priv->minor->dev;
+	dev = file_priv->minor->drm;
 	ret = pm_runtime_get_sync(dev->dev);
 	if (ret < 0) {
 		pm_runtime_put_autosuspend(dev->dev);
diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_drv.c
index 346c151e87be..d6d9d09addaa 100644
--- a/drivers/gpu/drm/sti/sti_drv.c
+++ b/drivers/gpu/drm/sti/sti_drv.c
@@ -73,7 +73,7 @@ DEFINE_SIMPLE_ATTRIBUTE(sti_drm_fps_fops,
 static int sti_drm_fps_dbg_show(struct seq_file *s, void *data)
 {
 	struct drm_info_node *node = s->private;
-	struct drm_device *dev = node->minor->dev;
+	struct drm_device *dev = node->minor->drm;
 	struct drm_plane *p;
 
 	list_for_each_entry(p, &dev->mode_config.plane_list, head) {
@@ -98,7 +98,7 @@ static void sti_drm_dbg_init(struct drm_minor *minor)
 				 minor->debugfs_root, minor);
 
 	debugfs_create_file("fps_show", S_IRUGO | S_IWUSR, minor->debugfs_root,
-			    minor->dev, &sti_drm_fps_fops);
+			    minor->drm, &sti_drm_fps_fops);
 
 	DRM_INFO("%s: debugfs installed\n", DRIVER_NAME);
 }
diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 6cfea8bef59b..35df1987d023 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -830,7 +830,7 @@ static void tegra_drm_postclose(struct drm_device *drm, struct drm_file *file)
 static int tegra_debugfs_framebuffers(struct seq_file *s, void *data)
 {
 	struct drm_info_node *node = (struct drm_info_node *)s->private;
-	struct drm_device *drm = node->minor->dev;
+	struct drm_device *drm = node->minor->drm;
 	struct drm_framebuffer *fb;
 
 	mutex_lock(&drm->mode_config.fb_lock);
@@ -851,7 +851,7 @@ static int tegra_debugfs_framebuffers(struct seq_file *s, void *data)
 static int tegra_debugfs_iova(struct seq_file *s, void *data)
 {
 	struct drm_info_node *node = (struct drm_info_node *)s->private;
-	struct drm_device *drm = node->minor->dev;
+	struct drm_device *drm = node->minor->drm;
 	struct tegra_drm *tegra = drm->dev_private;
 	struct drm_printer p = drm_seq_file_printer(s);
 
diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 467f797fa65a..c222b18b1215 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -201,7 +201,7 @@ static int tegra_dsi_show_regs(struct seq_file *s, void *data)
 	struct drm_info_node *node = s->private;
 	struct tegra_dsi *dsi = node->info_ent->data;
 	struct drm_crtc *crtc = dsi->output.encoder.crtc;
-	struct drm_device *drm = node->minor->dev;
+	struct drm_device *drm = node->minor->drm;
 	unsigned int i;
 	int err = 0;
 
diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 7f994d79fd72..f9f454f0c755 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -1059,7 +1059,7 @@ static int tegra_hdmi_show_regs(struct seq_file *s, void *data)
 	struct drm_info_node *node = s->private;
 	struct tegra_hdmi *hdmi = node->info_ent->data;
 	struct drm_crtc *crtc = hdmi->output.encoder.crtc;
-	struct drm_device *drm = node->minor->dev;
+	struct drm_device *drm = node->minor->drm;
 	unsigned int i;
 	int err = 0;
 
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 2bc0f6668b30..9d13ad637cb9 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -1489,7 +1489,7 @@ static int tegra_sor_show_crc(struct seq_file *s, void *data)
 	struct drm_info_node *node = s->private;
 	struct tegra_sor *sor = node->info_ent->data;
 	struct drm_crtc *crtc = sor->output.encoder.crtc;
-	struct drm_device *drm = node->minor->dev;
+	struct drm_device *drm = node->minor->drm;
 	int err = 0;
 	u32 value;
 
@@ -1651,7 +1651,7 @@ static int tegra_sor_show_regs(struct seq_file *s, void *data)
 	struct drm_info_node *node = s->private;
 	struct tegra_sor *sor = node->info_ent->data;
 	struct drm_crtc *crtc = sor->output.encoder.crtc;
-	struct drm_device *drm = node->minor->dev;
+	struct drm_device *drm = node->minor->drm;
 	unsigned int i;
 	int err = 0;
 
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index fe56beea3e93..25029ee2d50e 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -430,7 +430,7 @@ static const struct {
 static int tilcdc_regs_show(struct seq_file *m, void *arg)
 {
 	struct drm_info_node *node = (struct drm_info_node *) m->private;
-	struct drm_device *dev = node->minor->dev;
+	struct drm_device *dev = node->minor->drm;
 	struct tilcdc_drm_private *priv = dev->dev_private;
 	unsigned i;
 
@@ -451,7 +451,7 @@ static int tilcdc_regs_show(struct seq_file *m, void *arg)
 static int tilcdc_mm_show(struct seq_file *m, void *arg)
 {
 	struct drm_info_node *node = (struct drm_info_node *) m->private;
-	struct drm_device *dev = node->minor->dev;
+	struct drm_device *dev = node->minor->drm;
 	struct drm_printer p = drm_seq_file_printer(m);
 	drm_mm_print(&dev->vma_offset_manager->vm_addr_space_mm, &p);
 	return 0;
diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index e5b10e41554a..14c558fbb397 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -339,7 +339,7 @@ static int arcpgu_unload(struct drm_device *drm)
 static int arcpgu_show_pxlclock(struct seq_file *m, void *arg)
 {
 	struct drm_info_node *node = (struct drm_info_node *)m->private;
-	struct drm_device *drm = node->minor->dev;
+	struct drm_device *drm = node->minor->drm;
 	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(drm);
 	unsigned long clkrate = clk_get_rate(arcpgu->clk);
 	unsigned long mode_clock = arcpgu->pipe.crtc.mode.crtc_clock * 1000;
diff --git a/drivers/gpu/drm/v3d/v3d_debugfs.c b/drivers/gpu/drm/v3d/v3d_debugfs.c
index 54a9cfbb5a7d..f726ebbfdf14 100644
--- a/drivers/gpu/drm/v3d/v3d_debugfs.c
+++ b/drivers/gpu/drm/v3d/v3d_debugfs.c
@@ -246,5 +246,6 @@ static const struct drm_debugfs_info v3d_debugfs_list[] = {
 void
 v3d_debugfs_init(struct drm_minor *minor)
 {
-	drm_debugfs_add_files(minor->dev, v3d_debugfs_list, ARRAY_SIZE(v3d_debugfs_list));
+	drm_debugfs_add_files(minor->drm, v3d_debugfs_list,
+			      ARRAY_SIZE(v3d_debugfs_list));
 }
diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index 54ff7922ae4d..c25fed030bd5 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -989,7 +989,7 @@ int vc4_get_tiling_ioctl(struct drm_device *dev, void *data,
 
 int vc4_bo_debugfs_init(struct drm_minor *minor)
 {
-	struct drm_device *drm = minor->dev;
+	struct drm_device *drm = minor->drm;
 	struct vc4_dev *vc4 = to_vc4_dev(drm);
 
 	if (!vc4->v3d)
diff --git a/drivers/gpu/drm/vc4/vc4_debugfs.c b/drivers/gpu/drm/vc4/vc4_debugfs.c
index 1af0432ee6a1..99de3a8c645d 100644
--- a/drivers/gpu/drm/vc4/vc4_debugfs.c
+++ b/drivers/gpu/drm/vc4/vc4_debugfs.c
@@ -21,7 +21,7 @@
 void
 vc4_debugfs_init(struct drm_minor *minor)
 {
-	struct vc4_dev *vc4 = to_vc4_dev(minor->dev);
+	struct vc4_dev *vc4 = to_vc4_dev(minor->drm);
 	struct drm_device *drm = &vc4->base;
 
 	drm_WARN_ON(drm, vc4_hvs_debugfs_init(minor));
diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 552142320e2d..0096d13f8a45 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -760,7 +760,7 @@ static irqreturn_t vc4_hvs_irq_handler(int irq, void *data)
 
 int vc4_hvs_debugfs_init(struct drm_minor *minor)
 {
-	struct drm_device *drm = minor->dev;
+	struct drm_device *drm = minor->drm;
 	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	struct vc4_hvs *hvs = vc4->hvs;
 
diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
index 72edeb2d3d78..91b0166821bc 100644
--- a/drivers/gpu/drm/vc4/vc4_v3d.c
+++ b/drivers/gpu/drm/vc4/vc4_v3d.c
@@ -401,7 +401,7 @@ static int vc4_v3d_runtime_resume(struct device *dev)
 
 int vc4_v3d_debugfs_init(struct drm_minor *minor)
 {
-	struct drm_device *drm = minor->dev;
+	struct drm_device *drm = minor->drm;
 	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	struct vc4_v3d *v3d = vc4->v3d;
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_debugfs.c b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
index 853dd9aa397e..4ff9e206fefc 100644
--- a/drivers/gpu/drm/virtio/virtgpu_debugfs.c
+++ b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
@@ -44,7 +44,7 @@ static void virtio_gpu_add_int(struct seq_file *m, const char *name, int value)
 static int virtio_gpu_features(struct seq_file *m, void *data)
 {
 	struct drm_info_node *node = (struct drm_info_node *)m->private;
-	struct virtio_gpu_device *vgdev = node->minor->dev->dev_private;
+	struct virtio_gpu_device *vgdev = node->minor->drm->dev_private;
 
 	virtio_gpu_add_bool(m, "virgl", vgdev->has_virgl_3d);
 	virtio_gpu_add_bool(m, "edid", vgdev->has_edid);
@@ -69,7 +69,7 @@ static int
 virtio_gpu_debugfs_irq_info(struct seq_file *m, void *data)
 {
 	struct drm_info_node *node = (struct drm_info_node *) m->private;
-	struct virtio_gpu_device *vgdev = node->minor->dev->dev_private;
+	struct virtio_gpu_device *vgdev = node->minor->drm->dev_private;
 
 	seq_printf(m, "fence %llu %lld\n",
 		   (u64)atomic64_read(&vgdev->fence_drv.last_fence_id),
@@ -81,7 +81,7 @@ static int
 virtio_gpu_debugfs_host_visible_mm(struct seq_file *m, void *data)
 {
 	struct drm_info_node *node = (struct drm_info_node *)m->private;
-	struct virtio_gpu_device *vgdev = node->minor->dev->dev_private;
+	struct virtio_gpu_device *vgdev = node->minor->drm->dev_private;
 	struct drm_printer p;
 
 	if (!vgdev->has_host_visible) {
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 8b24ecf60e3e..25bb12aa059c 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -1262,7 +1262,7 @@ static long vmw_generic_ioctl(struct file *filp, unsigned int cmd,
 						 unsigned long))
 {
 	struct drm_file *file_priv = filp->private_data;
-	struct drm_device *dev = file_priv->minor->dev;
+	struct drm_device *dev = file_priv->minor->drm;
 	unsigned int nr = DRM_IOCTL_NR(cmd);
 	unsigned int flags;
 
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 966912053cb0..de9422281487 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -77,7 +77,7 @@ struct drm_minor {
 	int index;			/* Minor device number */
 	int type;                       /* Control or render or accel */
 	struct device *kdev;		/* Linux device */
-	struct drm_device *dev;
+	struct drm_device *drm;
 
 	struct dentry *debugfs_root;
 
-- 
2.39.2

