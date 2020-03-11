Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B59180C8E
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 00:37:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E356E91E;
	Tue, 10 Mar 2020 23:36:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D8B36E2E4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 13:32:12 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id v11so15863222wrm.9
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 06:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HeZhEFDuq9vAf3YrsH58c6ajDgF1KJMao8e9xvb76ak=;
 b=Cl5WIx0SWL3mkmHBotvh68aPZUwqccmexq1TuljgK8kz1HMrBfDHTqEFnrNjEEozDX
 usjp0+9VYK3dNKRj3Os1mhErTd1mdWXE2lIGPHaKXGySPFttnAgZNFd2FmlHnqtR+AEd
 kiWF7oVKaBN0T6dvaqRELy3ikMIXMIbQpbdzD2m7Ate+WWOiaakeWw+CD2TG+jBqkK91
 i0X7lokChKesEqtaK7N41vHFATfQXvOwUIHCjOdiRqyC8EQ4Q7QiajnXHi78F8G/dH14
 Y4ZZopyBs4jMb2Z8ksn2l97psQZQ+Gs0qAL/OciuKSemZ71NNw969LX6XYXHdKuEH+Kn
 dgpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HeZhEFDuq9vAf3YrsH58c6ajDgF1KJMao8e9xvb76ak=;
 b=Kq1+gmlPFToMI+N4QVfZKRN3nLHHWtnwo+jZpbdrOHtgcPUYF9mbCEeCT4yRgs7UNL
 uK5qpP9aFSkt4Ku+UnMi+vCyM6jED4Act3lhl9yVw1BS9RNxUgqXRzy1GO2jvM59tdNS
 Jfip6kdpTUzTp282unLg0xu2SRjHQnzt5Z/NhOTNbJe6pPx9YHEZZItmycFBqxKOBPe/
 gi2Djj/i4O562r1A4MdcNbslJMt7KW746l/qcrYUv6p0AjROhM10w0SR7HQ6sKobY0Qq
 4lCBVfv6h9XUG68gwFE3VkEcz/eX4JSL9UDZfFB+bWmTd5MSW5Rxi6ztYz58SBO1CDbj
 K2PA==
X-Gm-Message-State: ANhLgQ1J/XePG9qJSRHTeuEWCZgExKv3/2MagmJkLsVLavAWga4iwHeR
 B2dswa83giQltiCnxaKvyb8=
X-Google-Smtp-Source: ADFU+vtAa4Oqn/2X3mZ1BZjCGgSIjD0DXb6X6XYM57n50tIAehJuKCsYZt6c0Tvuhze/6YQ4CBr9Zg==
X-Received: by 2002:adf:ffc9:: with SMTP id x9mr1034015wrs.398.1583847130700; 
 Tue, 10 Mar 2020 06:32:10 -0700 (PDT)
Received: from localhost.localdomain ([197.248.222.210])
 by smtp.googlemail.com with ESMTPSA id o7sm14047141wrx.60.2020.03.10.06.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 06:32:10 -0700 (PDT)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: airlied@linux.ie, daniel@ffwll.ch,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 17/17] drm: convert .debugfs_init() hook to return void.
Date: Tue, 10 Mar 2020 16:31:21 +0300
Message-Id: <20200310133121.27913-18-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200310133121.27913-1-wambui.karugax@gmail.com>
References: <20200310133121.27913-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 10 Mar 2020 23:36:13 +0000
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
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As a result of commit 987d65d01356 (drm: debugfs: make
drm_debugfs_create_files() never fail) and changes to various debugfs
functions in drm/core and across various drivers, there is no need for
the drm_driver.debugfs_init() hook to have a return value. Therefore,
declare it as void.

This also includes refactoring all users of the .debugfs_init() hook to
return void across the subsystem.

v2: include changes to the hook and drivers that use it in one patch to
prevent driver breakage and enable individual successful compilation of
this change.

References: https://lists.freedesktop.org/archives/dri-devel/2020-February/257183.html
Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/arc/arcpgu_drv.c          |  3 +--
 drivers/gpu/drm/arm/hdlcd_drv.c           |  3 +--
 drivers/gpu/drm/arm/malidp_drv.c          |  3 +--
 drivers/gpu/drm/drm_atomic.c              |  3 +--
 drivers/gpu/drm/drm_client.c              |  4 +---
 drivers/gpu/drm/drm_crtc_internal.h       |  2 +-
 drivers/gpu/drm/drm_debugfs.c             | 12 +++---------
 drivers/gpu/drm/drm_framebuffer.c         |  4 +---
 drivers/gpu/drm/drm_gem_vram_helper.c     |  6 +-----
 drivers/gpu/drm/drm_internal.h            |  2 +-
 drivers/gpu/drm/drm_mipi_dbi.c            |  6 +-----
 drivers/gpu/drm/etnaviv/etnaviv_drv.c     |  4 +---
 drivers/gpu/drm/msm/adreno/a5xx_debugfs.c |  6 ++----
 drivers/gpu/drm/msm/adreno/a5xx_gpu.h     |  2 +-
 drivers/gpu/drm/msm/msm_debugfs.c         | 12 +++---------
 drivers/gpu/drm/msm/msm_debugfs.h         |  2 +-
 drivers/gpu/drm/msm/msm_gpu.h             |  2 +-
 drivers/gpu/drm/nouveau/nouveau_debugfs.c |  6 ++----
 drivers/gpu/drm/nouveau/nouveau_debugfs.h |  8 +++-----
 drivers/gpu/drm/omapdrm/omap_debugfs.c    |  4 +---
 drivers/gpu/drm/omapdrm/omap_drv.h        |  2 +-
 drivers/gpu/drm/pl111/pl111_debugfs.c     |  4 +---
 drivers/gpu/drm/pl111/pl111_drm.h         |  2 +-
 drivers/gpu/drm/qxl/qxl_debugfs.c         | 21 +++++++--------------
 drivers/gpu/drm/qxl/qxl_drv.h             | 13 +++++--------
 drivers/gpu/drm/qxl/qxl_ttm.c             |  6 ++----
 drivers/gpu/drm/sti/sti_drv.c             |  3 +--
 drivers/gpu/drm/tegra/drm.c               |  3 +--
 drivers/gpu/drm/tilcdc/tilcdc_drv.c       |  4 +---
 drivers/gpu/drm/v3d/v3d_debugfs.c         |  3 +--
 drivers/gpu/drm/v3d/v3d_drv.h             |  2 +-
 drivers/gpu/drm/vc4/vc4_debugfs.c         |  4 +---
 drivers/gpu/drm/vc4/vc4_drv.h             |  2 +-
 drivers/gpu/drm/virtio/virtgpu_debugfs.c  |  3 +--
 drivers/gpu/drm/virtio/virtgpu_drv.h      |  2 +-
 include/drm/drm_client.h                  |  2 +-
 include/drm/drm_drv.h                     |  2 +-
 include/drm/drm_gem_vram_helper.h         |  2 +-
 include/drm/drm_mipi_dbi.h                |  2 +-
 39 files changed, 58 insertions(+), 118 deletions(-)

diff --git a/drivers/gpu/drm/arc/arcpgu_drv.c b/drivers/gpu/drm/arc/arcpgu_drv.c
index 660b25f9588e..c05d001163e0 100644
--- a/drivers/gpu/drm/arc/arcpgu_drv.c
+++ b/drivers/gpu/drm/arc/arcpgu_drv.c
@@ -137,12 +137,11 @@ static struct drm_info_list arcpgu_debugfs_list[] = {
 	{ "clocks", arcpgu_show_pxlclock, 0 },
 };
 
-static int arcpgu_debugfs_init(struct drm_minor *minor)
+static void arcpgu_debugfs_init(struct drm_minor *minor)
 {
 	drm_debugfs_create_files(arcpgu_debugfs_list,
 				 ARRAY_SIZE(arcpgu_debugfs_list),
 				 minor->debugfs_root, minor);
-	return 0;
 }
 #endif
 
diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index bd0ad6f46a97..194419f47c5e 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -224,12 +224,11 @@ static struct drm_info_list hdlcd_debugfs_list[] = {
 	{ "clocks", hdlcd_show_pxlclock, 0 },
 };
 
-static int hdlcd_debugfs_init(struct drm_minor *minor)
+static void hdlcd_debugfs_init(struct drm_minor *minor)
 {
 	drm_debugfs_create_files(hdlcd_debugfs_list,
 				 ARRAY_SIZE(hdlcd_debugfs_list),
 				 minor->debugfs_root, minor);
-	return 0;
 }
 #endif
 
diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index 37d92a06318e..def8c9ffafca 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -548,7 +548,7 @@ static const struct file_operations malidp_debugfs_fops = {
 	.release = single_release,
 };
 
-static int malidp_debugfs_init(struct drm_minor *minor)
+static void malidp_debugfs_init(struct drm_minor *minor)
 {
 	struct malidp_drm *malidp = minor->dev->dev_private;
 
@@ -557,7 +557,6 @@ static int malidp_debugfs_init(struct drm_minor *minor)
 	spin_lock_init(&malidp->errors_lock);
 	debugfs_create_file("debug", S_IRUGO | S_IWUSR, minor->debugfs_root,
 			    minor->dev, &malidp_debugfs_fops);
-	return 0;
 }
 
 #endif //CONFIG_DEBUG_FS
diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index c0056d9cc139..965173fd0ac2 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1641,11 +1641,10 @@ static const struct drm_info_list drm_atomic_debugfs_list[] = {
 	{"state", drm_state_info, 0},
 };
 
-int drm_atomic_debugfs_init(struct drm_minor *minor)
+void drm_atomic_debugfs_init(struct drm_minor *minor)
 {
 	drm_debugfs_create_files(drm_atomic_debugfs_list,
 				 ARRAY_SIZE(drm_atomic_debugfs_list),
 				 minor->debugfs_root, minor);
-	return 0;
 }
 #endif
diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index 82fbdee407b2..8cb93f5209a4 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -457,12 +457,10 @@ static const struct drm_info_list drm_client_debugfs_list[] = {
 	{ "internal_clients", drm_client_debugfs_internal_clients, 0 },
 };
 
-int drm_client_debugfs_init(struct drm_minor *minor)
+void drm_client_debugfs_init(struct drm_minor *minor)
 {
 	drm_debugfs_create_files(drm_client_debugfs_list,
 				 ARRAY_SIZE(drm_client_debugfs_list),
 				 minor->debugfs_root, minor);
-
-	return 0;
 }
 #endif
diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
index 16f2413403aa..1b620ba9244b 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -224,7 +224,7 @@ int drm_mode_dirtyfb_ioctl(struct drm_device *dev,
 /* drm_atomic.c */
 #ifdef CONFIG_DEBUG_FS
 struct drm_minor;
-int drm_atomic_debugfs_init(struct drm_minor *minor);
+void drm_atomic_debugfs_init(struct drm_minor *minor);
 #endif
 
 int __drm_atomic_helper_disable_plane(struct drm_plane *plane,
diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index e13f21642f88..2bea22130703 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -207,7 +207,6 @@ int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 {
 	struct drm_device *dev = minor->dev;
 	char name[64];
-	int ret;
 
 	INIT_LIST_HEAD(&minor->debugfs_list);
 	mutex_init(&minor->debugfs_lock);
@@ -227,14 +226,9 @@ int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 		drm_client_debugfs_init(minor);
 	}
 
-	if (dev->driver->debugfs_init) {
-		ret = dev->driver->debugfs_init(minor);
-		if (ret) {
-			DRM_ERROR("DRM: Driver failed to initialize "
-				  "/sys/kernel/debug/dri.\n");
-			return ret;
-		}
-	}
+	if (dev->driver->debugfs_init)
+		dev->driver->debugfs_init(minor);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index 46be88271fe5..0375b3d7f8d0 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -1207,12 +1207,10 @@ static const struct drm_info_list drm_framebuffer_debugfs_list[] = {
 	{ "framebuffer", drm_framebuffer_info, 0 },
 };
 
-int drm_framebuffer_debugfs_init(struct drm_minor *minor)
+void drm_framebuffer_debugfs_init(struct drm_minor *minor)
 {
 	drm_debugfs_create_files(drm_framebuffer_debugfs_list,
 				 ARRAY_SIZE(drm_framebuffer_debugfs_list),
 				 minor->debugfs_root, minor);
-
-	return 0;
 }
 #endif
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index c8bcc8609650..76506bedac11 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -1042,18 +1042,14 @@ static const struct drm_info_list drm_vram_mm_debugfs_list[] = {
  *
  * @minor: drm minor device.
  *
- * Returns:
- * 0 on success, or
- * a negative error code otherwise.
  */
-int drm_vram_mm_debugfs_init(struct drm_minor *minor)
+void drm_vram_mm_debugfs_init(struct drm_minor *minor)
 {
 #if defined(CONFIG_DEBUG_FS)
 	drm_debugfs_create_files(drm_vram_mm_debugfs_list,
 				 ARRAY_SIZE(drm_vram_mm_debugfs_list),
 				 minor->debugfs_root, minor);
 #endif
-	return 0;
 }
 EXPORT_SYMBOL(drm_vram_mm_debugfs_init);
 
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 5714a78365ac..8b9e8bbca9b1 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -235,4 +235,4 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
 /* drm_framebuffer.c */
 void drm_framebuffer_print_info(struct drm_printer *p, unsigned int indent,
 				const struct drm_framebuffer *fb);
-int drm_framebuffer_debugfs_init(struct drm_minor *minor);
+void drm_framebuffer_debugfs_init(struct drm_minor *minor);
diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 558baf989f5a..113a767442d3 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -1308,10 +1308,8 @@ static const struct file_operations mipi_dbi_debugfs_command_fops = {
  * controller or getting the read command values.
  * Drivers can use this as their &drm_driver->debugfs_init callback.
  *
- * Returns:
- * Zero on success, negative error code on failure.
  */
-int mipi_dbi_debugfs_init(struct drm_minor *minor)
+void mipi_dbi_debugfs_init(struct drm_minor *minor)
 {
 	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(minor->dev);
 	umode_t mode = S_IFREG | S_IWUSR;
@@ -1320,8 +1318,6 @@ int mipi_dbi_debugfs_init(struct drm_minor *minor)
 		mode |= S_IRUGO;
 	debugfs_create_file("command", mode, minor->debugfs_root, dbidev,
 			    &mipi_dbi_debugfs_command_fops);
-
-	return 0;
 }
 EXPORT_SYMBOL(mipi_dbi_debugfs_init);
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index a65d30a48a9d..a39735316ca5 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -231,13 +231,11 @@ static struct drm_info_list etnaviv_debugfs_list[] = {
 		{"ring", show_each_gpu, 0, etnaviv_ring_show},
 };
 
-static int etnaviv_debugfs_init(struct drm_minor *minor)
+static void etnaviv_debugfs_init(struct drm_minor *minor)
 {
 	drm_debugfs_create_files(etnaviv_debugfs_list,
 				 ARRAY_SIZE(etnaviv_debugfs_list),
 				 minor->debugfs_root, minor);
-
-	return 0;
 }
 #endif
 
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c b/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
index 011ab6353dbb..8cae2ca4af6b 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
@@ -148,12 +148,12 @@ reset_set(void *data, u64 val)
 DEFINE_SIMPLE_ATTRIBUTE(reset_fops, NULL, reset_set, "%llx\n");
 
 
-int a5xx_debugfs_init(struct msm_gpu *gpu, struct drm_minor *minor)
+void a5xx_debugfs_init(struct msm_gpu *gpu, struct drm_minor *minor)
 {
 	struct drm_device *dev;
 
 	if (!minor)
-		return 0;
+		return;
 
 	dev = minor->dev;
 
@@ -163,6 +163,4 @@ int a5xx_debugfs_init(struct msm_gpu *gpu, struct drm_minor *minor)
 
 	debugfs_create_file("reset", S_IWUGO, minor->debugfs_root, dev,
 			    &reset_fops);
-
-	return 0;
 }
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.h b/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
index 833468ce6b6d..54868d4e3958 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
@@ -41,7 +41,7 @@ struct a5xx_gpu {
 #define to_a5xx_gpu(x) container_of(x, struct a5xx_gpu, base)
 
 #ifdef CONFIG_DEBUG_FS
-int a5xx_debugfs_init(struct msm_gpu *gpu, struct drm_minor *minor);
+void a5xx_debugfs_init(struct msm_gpu *gpu, struct drm_minor *minor);
 #endif
 
 /*
diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index 6378157e1fff..ee2e270f464c 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -214,11 +214,10 @@ int msm_debugfs_late_init(struct drm_device *dev)
 	return ret;
 }
 
-int msm_debugfs_init(struct drm_minor *minor)
+void msm_debugfs_init(struct drm_minor *minor)
 {
 	struct drm_device *dev = minor->dev;
 	struct msm_drm_private *priv = dev->dev_private;
-	int ret;
 
 	drm_debugfs_create_files(msm_debugfs_list,
 				 ARRAY_SIZE(msm_debugfs_list),
@@ -227,13 +226,8 @@ int msm_debugfs_init(struct drm_minor *minor)
 	debugfs_create_file("gpu", S_IRUSR, minor->debugfs_root,
 		dev, &msm_gpu_fops);
 
-	if (priv->kms && priv->kms->funcs->debugfs_init) {
-		ret = priv->kms->funcs->debugfs_init(priv->kms, minor);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
+	if (priv->kms && priv->kms->funcs->debugfs_init)
+		priv->kms->funcs->debugfs_init(priv->kms, minor);
 }
 #endif
 
diff --git a/drivers/gpu/drm/msm/msm_debugfs.h b/drivers/gpu/drm/msm/msm_debugfs.h
index 2b91f8c178ad..ef58f66abbb3 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.h
+++ b/drivers/gpu/drm/msm/msm_debugfs.h
@@ -8,7 +8,7 @@
 #define __MSM_DEBUGFS_H__
 
 #ifdef CONFIG_DEBUG_FS
-int msm_debugfs_init(struct drm_minor *minor);
+void msm_debugfs_init(struct drm_minor *minor);
 #endif
 
 #endif /* __MSM_DEBUGFS_H__ */
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index be5bc2e8425c..6ccae4ba905c 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -57,7 +57,7 @@ struct msm_gpu_funcs {
 	void (*show)(struct msm_gpu *gpu, struct msm_gpu_state *state,
 			struct drm_printer *p);
 	/* for generation specific debugfs: */
-	int (*debugfs_init)(struct msm_gpu *gpu, struct drm_minor *minor);
+	void (*debugfs_init)(struct msm_gpu *gpu, struct drm_minor *minor);
 #endif
 	unsigned long (*gpu_busy)(struct msm_gpu *gpu);
 	struct msm_gpu_state *(*gpu_state_get)(struct msm_gpu *gpu);
diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
index 15a3d40edf02..63cb5e432f8a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -217,7 +217,7 @@ static const struct nouveau_debugfs_files {
 	{"pstate", &nouveau_pstate_fops},
 };
 
-int
+void
 nouveau_drm_debugfs_init(struct drm_minor *minor)
 {
 	struct nouveau_drm *drm = nouveau_drm(minor->dev);
@@ -240,12 +240,10 @@ nouveau_drm_debugfs_init(struct drm_minor *minor)
 	 */
 	dentry = debugfs_lookup("vbios.rom", minor->debugfs_root);
 	if (!dentry)
-		return 0;
+		return;
 
 	d_inode(dentry)->i_size = drm->vbios.length;
 	dput(dentry);
-
-	return 0;
 }
 
 int
diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.h b/drivers/gpu/drm/nouveau/nouveau_debugfs.h
index 8909c010e8ea..77f0323b38ba 100644
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.h
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.h
@@ -18,15 +18,13 @@ nouveau_debugfs(struct drm_device *dev)
 	return nouveau_drm(dev)->debugfs;
 }
 
-extern int  nouveau_drm_debugfs_init(struct drm_minor *);
+extern void  nouveau_drm_debugfs_init(struct drm_minor *);
 extern int  nouveau_debugfs_init(struct nouveau_drm *);
 extern void nouveau_debugfs_fini(struct nouveau_drm *);
 #else
-static inline int
+static inline void
 nouveau_drm_debugfs_init(struct drm_minor *minor)
-{
-       return 0;
-}
+{}
 
 static inline int
 nouveau_debugfs_init(struct nouveau_drm *drm)
diff --git a/drivers/gpu/drm/omapdrm/omap_debugfs.c b/drivers/gpu/drm/omapdrm/omap_debugfs.c
index ed63dcced79a..b57fbe8a0ac2 100644
--- a/drivers/gpu/drm/omapdrm/omap_debugfs.c
+++ b/drivers/gpu/drm/omapdrm/omap_debugfs.c
@@ -80,7 +80,7 @@ static struct drm_info_list omap_dmm_debugfs_list[] = {
 	{"tiler_map", tiler_map_show, 0},
 };
 
-int omap_debugfs_init(struct drm_minor *minor)
+void omap_debugfs_init(struct drm_minor *minor)
 {
 	drm_debugfs_create_files(omap_debugfs_list,
 				 ARRAY_SIZE(omap_debugfs_list),
@@ -90,8 +90,6 @@ int omap_debugfs_init(struct drm_minor *minor)
 		drm_debugfs_create_files(omap_dmm_debugfs_list,
 					 ARRAY_SIZE(omap_dmm_debugfs_list),
 					 minor->debugfs_root, minor);
-
-	return 0;
 }
 
 #endif
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.h b/drivers/gpu/drm/omapdrm/omap_drv.h
index 7c4b66efcaa7..8a1fac680138 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.h
+++ b/drivers/gpu/drm/omapdrm/omap_drv.h
@@ -82,6 +82,6 @@ struct omap_drm_private {
 };
 
 
-int omap_debugfs_init(struct drm_minor *minor);
+void omap_debugfs_init(struct drm_minor *minor);
 
 #endif /* __OMAPDRM_DRV_H__ */
diff --git a/drivers/gpu/drm/pl111/pl111_debugfs.c b/drivers/gpu/drm/pl111/pl111_debugfs.c
index 5595b19c91ce..26ca8cdf3e60 100644
--- a/drivers/gpu/drm/pl111/pl111_debugfs.c
+++ b/drivers/gpu/drm/pl111/pl111_debugfs.c
@@ -51,12 +51,10 @@ static const struct drm_info_list pl111_debugfs_list[] = {
 	{"regs", pl111_debugfs_regs, 0},
 };
 
-int
+void
 pl111_debugfs_init(struct drm_minor *minor)
 {
 	drm_debugfs_create_files(pl111_debugfs_list,
 				 ARRAY_SIZE(pl111_debugfs_list),
 				 minor->debugfs_root, minor);
-
-	return 0;
 }
diff --git a/drivers/gpu/drm/pl111/pl111_drm.h b/drivers/gpu/drm/pl111/pl111_drm.h
index 77d2da9a8a7c..ba399bcb792f 100644
--- a/drivers/gpu/drm/pl111/pl111_drm.h
+++ b/drivers/gpu/drm/pl111/pl111_drm.h
@@ -84,6 +84,6 @@ struct pl111_drm_dev_private {
 
 int pl111_display_init(struct drm_device *dev);
 irqreturn_t pl111_irq(int irq, void *data);
-int pl111_debugfs_init(struct drm_minor *minor);
+void pl111_debugfs_init(struct drm_minor *minor);
 
 #endif /* _PL111_DRM_H_ */
diff --git a/drivers/gpu/drm/qxl/qxl_debugfs.c b/drivers/gpu/drm/qxl/qxl_debugfs.c
index a4f4175bbdbe..88123047fdd4 100644
--- a/drivers/gpu/drm/qxl/qxl_debugfs.c
+++ b/drivers/gpu/drm/qxl/qxl_debugfs.c
@@ -79,36 +79,30 @@ static struct drm_info_list qxl_debugfs_list[] = {
 #define QXL_DEBUGFS_ENTRIES ARRAY_SIZE(qxl_debugfs_list)
 #endif
 
-int
+void
 qxl_debugfs_init(struct drm_minor *minor)
 {
 #if defined(CONFIG_DEBUG_FS)
-	int r;
 	struct qxl_device *dev =
 		(struct qxl_device *) minor->dev->dev_private;
 
 	drm_debugfs_create_files(qxl_debugfs_list, QXL_DEBUGFS_ENTRIES,
 				 minor->debugfs_root, minor);
 
-	r = qxl_ttm_debugfs_init(dev);
-	if (r) {
-		DRM_ERROR("Failed to init TTM debugfs\n");
-		return r;
-	}
+	qxl_ttm_debugfs_init(dev);
 #endif
-	return 0;
 }
 
-int qxl_debugfs_add_files(struct qxl_device *qdev,
-			  struct drm_info_list *files,
-			  unsigned int nfiles)
+void qxl_debugfs_add_files(struct qxl_device *qdev,
+			   struct drm_info_list *files,
+			   unsigned int nfiles)
 {
 	unsigned int i;
 
 	for (i = 0; i < qdev->debugfs_count; i++) {
 		if (qdev->debugfs[i].files == files) {
 			/* Already registered */
-			return 0;
+			return;
 		}
 	}
 
@@ -116,7 +110,7 @@ int qxl_debugfs_add_files(struct qxl_device *qdev,
 	if (i > QXL_DEBUGFS_MAX_COMPONENTS) {
 		DRM_ERROR("Reached maximum number of debugfs components.\n");
 		DRM_ERROR("Report so we increase QXL_DEBUGFS_MAX_COMPONENTS.\n");
-		return -EINVAL;
+		return;
 	}
 	qdev->debugfs[qdev->debugfs_count].files = files;
 	qdev->debugfs[qdev->debugfs_count].num_files = nfiles;
@@ -126,5 +120,4 @@ int qxl_debugfs_add_files(struct qxl_device *qdev,
 				 qdev->ddev.primary->debugfs_root,
 				 qdev->ddev.primary);
 #endif
-	return 0;
 }
diff --git a/drivers/gpu/drm/qxl/qxl_drv.h b/drivers/gpu/drm/qxl/qxl_drv.h
index 27e45a2d6b52..435126facc9b 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.h
+++ b/drivers/gpu/drm/qxl/qxl_drv.h
@@ -190,9 +190,6 @@ struct qxl_debugfs {
 	unsigned int num_files;
 };
 
-int qxl_debugfs_add_files(struct qxl_device *rdev,
-			     struct drm_info_list *files,
-			     unsigned int nfiles);
 int qxl_debugfs_fence_init(struct qxl_device *rdev);
 
 struct qxl_device;
@@ -442,8 +439,8 @@ int qxl_garbage_collect(struct qxl_device *qdev);
 
 /* debugfs */
 
-int qxl_debugfs_init(struct drm_minor *minor);
-int qxl_ttm_debugfs_init(struct qxl_device *qdev);
+void qxl_debugfs_init(struct drm_minor *minor);
+void qxl_ttm_debugfs_init(struct qxl_device *qdev);
 
 /* qxl_prime.c */
 int qxl_gem_prime_pin(struct drm_gem_object *obj);
@@ -461,9 +458,9 @@ int qxl_gem_prime_mmap(struct drm_gem_object *obj,
 int qxl_irq_init(struct qxl_device *qdev);
 irqreturn_t qxl_irq_handler(int irq, void *arg);
 
-int qxl_debugfs_add_files(struct qxl_device *qdev,
-			  struct drm_info_list *files,
-			  unsigned int nfiles);
+void qxl_debugfs_add_files(struct qxl_device *qdev,
+			   struct drm_info_list *files,
+			   unsigned int nfiles);
 
 int qxl_surface_id_alloc(struct qxl_device *qdev,
 			 struct qxl_bo *surf);
diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
index 62a5e424971b..93a2eb14844b 100644
--- a/drivers/gpu/drm/qxl/qxl_ttm.c
+++ b/drivers/gpu/drm/qxl/qxl_ttm.c
@@ -322,7 +322,7 @@ static int qxl_mm_dump_table(struct seq_file *m, void *data)
 }
 #endif
 
-int qxl_ttm_debugfs_init(struct qxl_device *qdev)
+void qxl_ttm_debugfs_init(struct qxl_device *qdev)
 {
 #if defined(CONFIG_DEBUG_FS)
 	static struct drm_info_list qxl_mem_types_list[QXL_DEBUGFS_MEM_TYPES];
@@ -343,8 +343,6 @@ int qxl_ttm_debugfs_init(struct qxl_device *qdev)
 			qxl_mem_types_list[i].data = qdev->mman.bdev.man[TTM_PL_PRIV].priv;
 
 	}
-	return qxl_debugfs_add_files(qdev, qxl_mem_types_list, i);
-#else
-	return 0;
+	qxl_debugfs_add_files(qdev, qxl_mem_types_list, i);
 #endif
 }
diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_drv.c
index 5ab36f6001fc..3f9db3e3f397 100644
--- a/drivers/gpu/drm/sti/sti_drv.c
+++ b/drivers/gpu/drm/sti/sti_drv.c
@@ -92,7 +92,7 @@ static struct drm_info_list sti_drm_dbg_list[] = {
 	{"fps_get", sti_drm_fps_dbg_show, 0},
 };
 
-static int sti_drm_dbg_init(struct drm_minor *minor)
+static void sti_drm_dbg_init(struct drm_minor *minor)
 {
 	drm_debugfs_create_files(sti_drm_dbg_list,
 				 ARRAY_SIZE(sti_drm_dbg_list),
@@ -102,7 +102,6 @@ static int sti_drm_dbg_init(struct drm_minor *minor)
 			    minor->dev, &sti_drm_fps_fops);
 
 	DRM_INFO("%s: debugfs installed\n", DRIVER_NAME);
-	return 0;
 }
 
 static const struct drm_mode_config_funcs sti_mode_config_funcs = {
diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 6ec224f3d824..d4f51b5c7ee5 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -839,12 +839,11 @@ static struct drm_info_list tegra_debugfs_list[] = {
 	{ "iova", tegra_debugfs_iova, 0 },
 };
 
-static int tegra_debugfs_init(struct drm_minor *minor)
+static void tegra_debugfs_init(struct drm_minor *minor)
 {
 	drm_debugfs_create_files(tegra_debugfs_list,
 				 ARRAY_SIZE(tegra_debugfs_list),
 				 minor->debugfs_root, minor);
-	return 0;
 }
 #endif
 
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index 3f7071eb9c78..78c1877d13a8 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -478,7 +478,7 @@ static struct drm_info_list tilcdc_debugfs_list[] = {
 		{ "mm",   tilcdc_mm_show,   0 },
 };
 
-static int tilcdc_debugfs_init(struct drm_minor *minor)
+static void tilcdc_debugfs_init(struct drm_minor *minor)
 {
 	struct tilcdc_module *mod;
 
@@ -489,8 +489,6 @@ static int tilcdc_debugfs_init(struct drm_minor *minor)
 	list_for_each_entry(mod, &module_list, list)
 		if (mod->funcs->debugfs_init)
 			mod->funcs->debugfs_init(mod, minor);
-
-	return 0;
 }
 #endif
 
diff --git a/drivers/gpu/drm/v3d/v3d_debugfs.c b/drivers/gpu/drm/v3d/v3d_debugfs.c
index 57dded6a3957..2b0ea5f8febd 100644
--- a/drivers/gpu/drm/v3d/v3d_debugfs.c
+++ b/drivers/gpu/drm/v3d/v3d_debugfs.c
@@ -258,11 +258,10 @@ static const struct drm_info_list v3d_debugfs_list[] = {
 	{"bo_stats", v3d_debugfs_bo_stats, 0},
 };
 
-int
+void
 v3d_debugfs_init(struct drm_minor *minor)
 {
 	drm_debugfs_create_files(v3d_debugfs_list,
 				 ARRAY_SIZE(v3d_debugfs_list),
 				 minor->debugfs_root, minor);
-	return 0;
 }
diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index ac2603334587..e0775c884553 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -316,7 +316,7 @@ struct drm_gem_object *v3d_prime_import_sg_table(struct drm_device *dev,
 						 struct sg_table *sgt);
 
 /* v3d_debugfs.c */
-int v3d_debugfs_init(struct drm_minor *minor);
+void v3d_debugfs_init(struct drm_minor *minor);
 
 /* v3d_fence.c */
 extern const struct dma_fence_ops v3d_fence_ops;
diff --git a/drivers/gpu/drm/vc4/vc4_debugfs.c b/drivers/gpu/drm/vc4/vc4_debugfs.c
index 1835f12337ec..4fbbf980a299 100644
--- a/drivers/gpu/drm/vc4/vc4_debugfs.c
+++ b/drivers/gpu/drm/vc4/vc4_debugfs.c
@@ -20,7 +20,7 @@ struct vc4_debugfs_info_entry {
  * Called at drm_dev_register() time on each of the minors registered
  * by the DRM device, to attach the debugfs files.
  */
-int
+void
 vc4_debugfs_init(struct drm_minor *minor)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(minor->dev);
@@ -33,8 +33,6 @@ vc4_debugfs_init(struct drm_minor *minor)
 		drm_debugfs_create_files(&entry->info, 1,
 					 minor->debugfs_root, minor);
 	}
-
-	return 0;
 }
 
 static int vc4_debugfs_regset32(struct seq_file *m, void *unused)
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 139d25a8328e..3b1f02efefbe 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -759,7 +759,7 @@ void vc4_crtc_get_margins(struct drm_crtc_state *state,
 			  unsigned int *top, unsigned int *bottom);
 
 /* vc4_debugfs.c */
-int vc4_debugfs_init(struct drm_minor *minor);
+void vc4_debugfs_init(struct drm_minor *minor);
 #ifdef CONFIG_DEBUG_FS
 void vc4_debugfs_add_file(struct drm_device *drm,
 			  const char *filename,
diff --git a/drivers/gpu/drm/virtio/virtgpu_debugfs.c b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
index e27120d512b0..3221520f61f0 100644
--- a/drivers/gpu/drm/virtio/virtgpu_debugfs.c
+++ b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
@@ -72,11 +72,10 @@ static struct drm_info_list virtio_gpu_debugfs_list[] = {
 
 #define VIRTIO_GPU_DEBUGFS_ENTRIES ARRAY_SIZE(virtio_gpu_debugfs_list)
 
-int
+void
 virtio_gpu_debugfs_init(struct drm_minor *minor)
 {
 	drm_debugfs_create_files(virtio_gpu_debugfs_list,
 				 VIRTIO_GPU_DEBUGFS_ENTRIES,
 				 minor->debugfs_root, minor);
-	return 0;
 }
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index c1824bdf2418..824f9f15926c 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -379,6 +379,6 @@ struct drm_gem_object *virtgpu_gem_prime_import_sg_table(
 	struct sg_table *sgt);
 
 /* virgl debugfs */
-int virtio_gpu_debugfs_init(struct drm_minor *minor);
+void virtio_gpu_debugfs_init(struct drm_minor *minor);
 
 #endif
diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
index 3ed5dee899fd..7402f852d3c4 100644
--- a/include/drm/drm_client.h
+++ b/include/drm/drm_client.h
@@ -188,6 +188,6 @@ int drm_client_modeset_dpms(struct drm_client_dev *client, int mode);
 	drm_for_each_connector_iter(connector, iter) \
 		if (connector->connector_type != DRM_MODE_CONNECTOR_WRITEBACK)
 
-int drm_client_debugfs_init(struct drm_minor *minor);
+void drm_client_debugfs_init(struct drm_minor *minor);
 
 #endif
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 97109df5beac..c6ae888c672b 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -323,7 +323,7 @@ struct drm_driver {
 	 *
 	 * Allows drivers to create driver-specific debugfs files.
 	 */
-	int (*debugfs_init)(struct drm_minor *minor);
+	void (*debugfs_init)(struct drm_minor *minor);
 
 	/**
 	 * @gem_free_object: deconstructor for drm_gem_objects
diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index 0f6e47213d8d..b63bcd1b996d 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -196,7 +196,7 @@ static inline struct drm_vram_mm *drm_vram_mm_of_bdev(
 	return container_of(bdev, struct drm_vram_mm, bdev);
 }
 
-int drm_vram_mm_debugfs_init(struct drm_minor *minor);
+void drm_vram_mm_debugfs_init(struct drm_minor *minor);
 
 /*
  * Helpers for integration with struct drm_device
diff --git a/include/drm/drm_mipi_dbi.h b/include/drm/drm_mipi_dbi.h
index 33f325f5af2b..30ebdfd8a51f 100644
--- a/include/drm/drm_mipi_dbi.h
+++ b/include/drm/drm_mipi_dbi.h
@@ -192,7 +192,7 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
 })
 
 #ifdef CONFIG_DEBUG_FS
-int mipi_dbi_debugfs_init(struct drm_minor *minor);
+void mipi_dbi_debugfs_init(struct drm_minor *minor);
 #else
 #define mipi_dbi_debugfs_init		NULL
 #endif
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
