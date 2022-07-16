Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 197365770A6
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 20:18:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B154F113D77;
	Sat, 16 Jul 2022 18:18:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB3A0113D77
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jul 2022 18:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=fRv5IazbEX1G4rl/pdT9Is/ggOr0HHq+PBI6C89pU6Q=;
 b=DwTf1UUCu06OSuI5F49ipt/z9cJe2jJDDs2c4hfbbrjVEb1+6XGFIiqgJC7+a/aPTZVMi6ogbeYV/
 YpUs1ARxYG0MI/nKHZAZ5op5buv4J1R6WfxL+MQANwfJbJ9n+HRDr5sNDSjepCKFaUDxlT2NzO59yH
 YQ22DPU7cnL4cSLAF7ffJwOepvAgDkNRhAotjnc6168voLu++qLKLa8C8I2kPHrcdQaBnLVcxHnYfq
 J51PHBXBi1SLjeroCQ2plR/BDcod42WFP/9cA9EGbW3b0ET2O9nzEgKVOMM3ywrl9jmAeu8hoDS+g1
 ul9YpfsEFqMtgIb/8NsSqLblVhx6Ygw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=fRv5IazbEX1G4rl/pdT9Is/ggOr0HHq+PBI6C89pU6Q=;
 b=15H9qKLqV6SzOwxFfK+bZSRwePfhnGiMMSAmXF8KRzu1Ez6OdvtEOunLYS3Mgerm6ciUaRLGWMAny
 DkKkZmcCQ==
X-HalOne-Cookie: e37afb58957b93e896159eb72d450001c8765f30
X-HalOne-ID: a4df0be8-0533-11ed-a917-d0431ea8a290
Received: from mailproxy1.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id a4df0be8-0533-11ed-a917-d0431ea8a290;
 Sat, 16 Jul 2022 18:18:08 +0000 (UTC)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 02/11] drm: Rename CONFIG_DRM_LEGACY to CONFIG_DRM_DRI1
Date: Sat, 16 Jul 2022 20:17:41 +0200
Message-Id: <20220716181750.3874838-3-sam@ravnborg.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220716181750.3874838-1-sam@ravnborg.org>
References: <20220716181750.3874838-1-sam@ravnborg.org>
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
Cc: Sam Ravnborg <sam@ravnborg.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The rename is done to make it more obvious what is DRI1 drivers
and what is other type of legacy.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 arch/powerpc/configs/pmac32_defconfig |  2 +-
 arch/powerpc/configs/ppc6xx_defconfig |  2 +-
 drivers/char/agp/Makefile             |  2 +-
 drivers/char/agp/agp.h                |  2 +-
 drivers/gpu/drm/Kconfig               | 10 ++++-----
 drivers/gpu/drm/Makefile              |  6 ++---
 drivers/gpu/drm/drm_file.c            |  4 ++--
 drivers/gpu/drm/drm_internal.h        |  2 +-
 drivers/gpu/drm/drm_ioc32.c           | 12 +++++-----
 drivers/gpu/drm/drm_ioctl.c           |  2 +-
 drivers/gpu/drm/drm_legacy.h          | 32 +++++++++++++--------------
 drivers/gpu/drm/drm_pci.c             |  4 ++--
 drivers/gpu/drm/drm_vblank.c          |  8 +++----
 drivers/gpu/drm/drm_vm.c              |  2 +-
 include/drm/drm_auth.h                |  2 +-
 include/drm/drm_device.h              |  2 +-
 include/drm/drm_drv.h                 |  4 ++--
 include/drm/drm_file.h                |  2 +-
 include/drm/drm_legacy.h              |  2 +-
 19 files changed, 51 insertions(+), 51 deletions(-)

diff --git a/arch/powerpc/configs/pmac32_defconfig b/arch/powerpc/configs/pmac32_defconfig
index 13885ec563d1..47bb0e8018e4 100644
--- a/arch/powerpc/configs/pmac32_defconfig
+++ b/arch/powerpc/configs/pmac32_defconfig
@@ -187,7 +187,7 @@ CONFIG_AGP=m
 CONFIG_AGP_UNINORTH=m
 CONFIG_DRM=m
 CONFIG_DRM_RADEON=m
-CONFIG_DRM_LEGACY=y
+CONFIG_DRM_DRI1=y
 CONFIG_DRM_R128=m
 CONFIG_FB=y
 CONFIG_FB_OF=y
diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
index b622ecd73286..5616b669e6ab 100644
--- a/arch/powerpc/configs/ppc6xx_defconfig
+++ b/arch/powerpc/configs/ppc6xx_defconfig
@@ -694,7 +694,7 @@ CONFIG_AGP=y
 CONFIG_AGP_UNINORTH=y
 CONFIG_DRM=m
 CONFIG_DRM_RADEON=m
-CONFIG_DRM_LEGACY=y
+CONFIG_DRM_DRI1=y
 CONFIG_DRM_TDFX=m
 CONFIG_DRM_R128=m
 CONFIG_DRM_MGA=m
diff --git a/drivers/char/agp/Makefile b/drivers/char/agp/Makefile
index 90ed8c789e48..360e8e9dde98 100644
--- a/drivers/char/agp/Makefile
+++ b/drivers/char/agp/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 agpgart-y := backend.o generic.o isoch.o
 
-ifeq ($(CONFIG_DRM_LEGACY),y)
+ifeq ($(CONFIG_DRM_DRI1),y)
 agpgart-$(CONFIG_COMPAT)	+= compat_ioctl.o
 agpgart-y			+= frontend.o
 endif
diff --git a/drivers/char/agp/agp.h b/drivers/char/agp/agp.h
index bb09d64cd51e..97802b076d80 100644
--- a/drivers/char/agp/agp.h
+++ b/drivers/char/agp/agp.h
@@ -186,7 +186,7 @@ int agp_add_bridge(struct agp_bridge_data *bridge);
 void agp_remove_bridge(struct agp_bridge_data *bridge);
 
 /* Frontend routines. */
-#if IS_ENABLED(CONFIG_DRM_LEGACY)
+#if IS_ENABLED(CONFIG_DRM_DRI1)
 int agp_frontend_initialize(void);
 void agp_frontend_cleanup(void);
 #else
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 1c91e1e861a5..024081480fcf 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -402,10 +402,10 @@ config DRM_HYPERV
 
 	 If M is selected the module will be called hyperv_drm.
 
-# Keep legacy drivers last
+# Keep legacy DRI1 drivers last
 
-menuconfig DRM_LEGACY
-	bool "Enable legacy drivers (DANGEROUS)"
+menuconfig DRM_DRI1
+	bool "Enable legacy DRI1 drivers (DANGEROUS)"
 	depends on DRM && MMU
 	help
 	  Enable legacy DRI1 drivers. Those drivers expose unsafe and dangerous
@@ -419,7 +419,7 @@ menuconfig DRM_LEGACY
 
 	  Unless you have strong reasons to go rogue, say "N".
 
-if DRM_LEGACY
+if DRM_DRI1
 
 config DRM_TDFX
 	tristate "3dfx Banshee/Voodoo3+"
@@ -478,7 +478,7 @@ config DRM_SAVAGE
 	  Choose this option if you have a Savage3D/4/SuperSavage/Pro/Twister
 	  chipset. If M is selected the module will be called savage.
 
-endif # DRM_LEGACY
+endif # DRM_DRI1
 
 config DRM_EXPORT_FOR_TESTS
 	bool
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 25016dcab55e..dd7f296ef9b8 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -18,9 +18,9 @@ drm-y       :=	drm_aperture.o drm_auth.o drm_cache.o \
 		drm_syncobj.o drm_lease.o drm_writeback.o drm_client.o \
 		drm_client_modeset.o drm_atomic_uapi.o \
 		drm_managed.o drm_vblank_work.o
-drm-$(CONFIG_DRM_LEGACY) += drm_agpsupport.o drm_bufs.o drm_context.o drm_dma.o \
-			    drm_hashtab.o drm_irq.o drm_legacy_misc.o drm_lock.o \
-			    drm_memory.o drm_scatter.o drm_vm.o
+drm-$(CONFIG_DRM_DRI1) += drm_agpsupport.o drm_bufs.o drm_context.o drm_dma.o \
+			  drm_hashtab.o drm_irq.o drm_legacy_misc.o drm_lock.o \
+			  drm_memory.o drm_scatter.o drm_vm.o
 drm-$(CONFIG_DRM_LIB_RANDOM) += lib/drm_random.o
 drm-$(CONFIG_COMPAT) += drm_ioc32.o
 drm-$(CONFIG_DRM_PANEL) += drm_panel.o
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index c6781afe41cf..a48bce8fe85e 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -255,7 +255,7 @@ void drm_file_free(struct drm_file *file)
 		  (long)old_encode_dev(file->minor->kdev->devt),
 		  atomic_read(&dev->open_count));
 
-#ifdef CONFIG_DRM_LEGACY
+#ifdef CONFIG_DRM_DRI1
 	if (drm_core_check_feature(dev, DRIVER_DRI1) &&
 	    dev->driver->preclose)
 		dev->driver->preclose(dev, file);
@@ -368,7 +368,7 @@ static int drm_open_helper(struct file *filp, struct drm_minor *minor)
 	list_add(&priv->lhead, &dev->filelist);
 	mutex_unlock(&dev->filelist_mutex);
 
-#ifdef CONFIG_DRM_LEGACY
+#ifdef CONFIG_DRM_DRI1
 #ifdef __alpha__
 	/*
 	 * Default the hose
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 1fbbc19f1ac0..fd085b9ea712 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -120,7 +120,7 @@ int drm_legacy_modeset_ctl_ioctl(struct drm_device *dev, void *data,
 /* drm_irq.c */
 
 /* IOCTLS */
-#if IS_ENABLED(CONFIG_DRM_LEGACY)
+#if IS_ENABLED(CONFIG_DRM_DRI1)
 int drm_legacy_irq_control(struct drm_device *dev, void *data,
 			   struct drm_file *file_priv);
 #endif
diff --git a/drivers/gpu/drm/drm_ioc32.c b/drivers/gpu/drm/drm_ioc32.c
index 5d82891c3222..5d941f1eb231 100644
--- a/drivers/gpu/drm/drm_ioc32.c
+++ b/drivers/gpu/drm/drm_ioc32.c
@@ -163,7 +163,7 @@ static int compat_drm_setunique(struct file *file, unsigned int cmd,
 	return -EINVAL;
 }
 
-#if IS_ENABLED(CONFIG_DRM_LEGACY)
+#if IS_ENABLED(CONFIG_DRM_DRI1)
 typedef struct drm_map32 {
 	u32 offset;		/* Requested physical address (0 for SAREA) */
 	u32 size;		/* Requested physical size (bytes) */
@@ -308,7 +308,7 @@ static int compat_drm_getstats(struct file *file, unsigned int cmd,
 	return 0;
 }
 
-#if IS_ENABLED(CONFIG_DRM_LEGACY)
+#if IS_ENABLED(CONFIG_DRM_DRI1)
 typedef struct drm_buf_desc32 {
 	int count;		 /* Number of buffers of this size */
 	int size;		 /* Size in bytes */
@@ -618,7 +618,7 @@ static int compat_drm_dma(struct file *file, unsigned int cmd,
 }
 #endif
 
-#if IS_ENABLED(CONFIG_DRM_LEGACY)
+#if IS_ENABLED(CONFIG_DRM_DRI1)
 #if IS_ENABLED(CONFIG_AGP)
 typedef struct drm_agp_mode32 {
 	u32 mode;	/**< AGP mode */
@@ -914,13 +914,13 @@ static struct {
 #define DRM_IOCTL32_DEF(n, f) [DRM_IOCTL_NR(n##32)] = {.fn = f, .name = #n}
 	DRM_IOCTL32_DEF(DRM_IOCTL_VERSION, compat_drm_version),
 	DRM_IOCTL32_DEF(DRM_IOCTL_GET_UNIQUE, compat_drm_getunique),
-#if IS_ENABLED(CONFIG_DRM_LEGACY)
+#if IS_ENABLED(CONFIG_DRM_DRI1)
 	DRM_IOCTL32_DEF(DRM_IOCTL_GET_MAP, compat_drm_getmap),
 #endif
 	DRM_IOCTL32_DEF(DRM_IOCTL_GET_CLIENT, compat_drm_getclient),
 	DRM_IOCTL32_DEF(DRM_IOCTL_GET_STATS, compat_drm_getstats),
 	DRM_IOCTL32_DEF(DRM_IOCTL_SET_UNIQUE, compat_drm_setunique),
-#if IS_ENABLED(CONFIG_DRM_LEGACY)
+#if IS_ENABLED(CONFIG_DRM_DRI1)
 	DRM_IOCTL32_DEF(DRM_IOCTL_ADD_MAP, compat_drm_addmap),
 	DRM_IOCTL32_DEF(DRM_IOCTL_ADD_BUFS, compat_drm_addbufs),
 	DRM_IOCTL32_DEF(DRM_IOCTL_MARK_BUFS, compat_drm_markbufs),
@@ -941,7 +941,7 @@ static struct {
 	DRM_IOCTL32_DEF(DRM_IOCTL_AGP_UNBIND, compat_drm_agp_unbind),
 #endif
 #endif
-#if IS_ENABLED(CONFIG_DRM_LEGACY)
+#if IS_ENABLED(CONFIG_DRM_DRI1)
 	DRM_IOCTL32_DEF(DRM_IOCTL_SG_ALLOC, compat_drm_sg_alloc),
 	DRM_IOCTL32_DEF(DRM_IOCTL_SG_FREE, compat_drm_sg_free),
 #endif
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index ab36c689f19f..5a075f2ed045 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -560,7 +560,7 @@ static int drm_ioctl_permit(u32 flags, struct drm_file *file_priv)
 		.name = #ioctl			\
 	}
 
-#if IS_ENABLED(CONFIG_DRM_LEGACY)
+#if IS_ENABLED(CONFIG_DRM_DRI1)
 #define DRM_LEGACY_IOCTL_DEF(ioctl, _func, _flags)  DRM_IOCTL_DEF(ioctl, _func, _flags)
 #else
 #define DRM_LEGACY_IOCTL_DEF(ioctl, _func, _flags) DRM_IOCTL_DEF(ioctl, drm_invalid_op, _flags)
diff --git a/drivers/gpu/drm/drm_legacy.h b/drivers/gpu/drm/drm_legacy.h
index 70c9dba114a6..bae45f1d0e70 100644
--- a/drivers/gpu/drm/drm_legacy.h
+++ b/drivers/gpu/drm/drm_legacy.h
@@ -48,7 +48,7 @@ struct drm_open_hash;
 #define drm_hash_entry(_ptr, _type, _member) container_of(_ptr, _type, _member)
 
 /* drm_hashtab.c */
-#if IS_ENABLED(CONFIG_DRM_LEGACY)
+#if IS_ENABLED(CONFIG_DRM_DRI1)
 int drm_ht_create(struct drm_open_hash *ht, unsigned int order);
 int drm_ht_insert_item(struct drm_open_hash *ht, struct drm_hash_item *item);
 int drm_ht_just_insert_please(struct drm_open_hash *ht, struct drm_hash_item *item,
@@ -84,7 +84,7 @@ void drm_ht_remove(struct drm_open_hash *ht);
 #define DRM_KERNEL_CONTEXT		0
 #define DRM_RESERVED_CONTEXTS		1
 
-#if IS_ENABLED(CONFIG_DRM_LEGACY)
+#if IS_ENABLED(CONFIG_DRM_DRI1)
 void drm_legacy_ctxbitmap_init(struct drm_device *dev);
 void drm_legacy_ctxbitmap_cleanup(struct drm_device *dev);
 void drm_legacy_ctxbitmap_flush(struct drm_device *dev, struct drm_file *file);
@@ -96,7 +96,7 @@ static inline void drm_legacy_ctxbitmap_flush(struct drm_device *dev, struct drm
 
 void drm_legacy_ctxbitmap_free(struct drm_device *dev, int ctx_handle);
 
-#if IS_ENABLED(CONFIG_DRM_LEGACY)
+#if IS_ENABLED(CONFIG_DRM_DRI1)
 int drm_legacy_resctx(struct drm_device *d, void *v, struct drm_file *f);
 int drm_legacy_addctx(struct drm_device *d, void *v, struct drm_file *f);
 int drm_legacy_getctx(struct drm_device *d, void *v, struct drm_file *f);
@@ -114,7 +114,7 @@ int drm_legacy_getsareactx(struct drm_device *d, void *v, struct drm_file *f);
 
 #define DRM_MAP_HASH_OFFSET 0x10000000
 
-#if IS_ENABLED(CONFIG_DRM_LEGACY)
+#if IS_ENABLED(CONFIG_DRM_DRI1)
 static inline int drm_legacy_create_map_hash(struct drm_device *dev)
 {
 	return drm_ht_create(&dev->map_hash, 12);
@@ -134,7 +134,7 @@ static inline void drm_legacy_remove_map_hash(struct drm_device *dev) {}
 #endif
 
 
-#if IS_ENABLED(CONFIG_DRM_LEGACY)
+#if IS_ENABLED(CONFIG_DRM_DRI1)
 int drm_legacy_getmap_ioctl(struct drm_device *dev, void *data,
 			    struct drm_file *file_priv);
 int drm_legacy_addmap_ioctl(struct drm_device *d, void *v, struct drm_file *f);
@@ -155,7 +155,7 @@ int __drm_legacy_mapbufs(struct drm_device *, void *, int *,
 			  int (*)(void *, int, unsigned long, struct drm_buf *),
 			  struct drm_file *);
 
-#if IS_ENABLED(CONFIG_DRM_LEGACY)
+#if IS_ENABLED(CONFIG_DRM_DRI1)
 void drm_legacy_master_rmmaps(struct drm_device *dev,
 			      struct drm_master *master);
 void drm_legacy_rmmaps(struct drm_device *dev);
@@ -165,7 +165,7 @@ static inline void drm_legacy_master_rmmaps(struct drm_device *dev,
 static inline void drm_legacy_rmmaps(struct drm_device *dev) {}
 #endif
 
-#if IS_ENABLED(CONFIG_DRM_LEGACY)
+#if IS_ENABLED(CONFIG_DRM_DRI1)
 void drm_legacy_vma_flush(struct drm_device *d);
 #else
 static inline void drm_legacy_vma_flush(struct drm_device *d)
@@ -187,7 +187,7 @@ struct drm_agp_mem {
 };
 
 /* drm_agpsupport.c */
-#if IS_ENABLED(CONFIG_DRM_LEGACY) && IS_ENABLED(CONFIG_AGP)
+#if IS_ENABLED(CONFIG_DRM_DRI1) && IS_ENABLED(CONFIG_AGP)
 void drm_legacy_agp_clear(struct drm_device *dev);
 
 int drm_legacy_agp_acquire_ioctl(struct drm_device *dev, void *data,
@@ -211,7 +211,7 @@ static inline void drm_legacy_agp_clear(struct drm_device *dev) {}
 #endif
 
 /* drm_lock.c */
-#if IS_ENABLED(CONFIG_DRM_LEGACY)
+#if IS_ENABLED(CONFIG_DRM_DRI1)
 int drm_legacy_lock(struct drm_device *d, void *v, struct drm_file *f);
 int drm_legacy_unlock(struct drm_device *d, void *v, struct drm_file *f);
 void drm_legacy_lock_release(struct drm_device *dev, struct file *filp);
@@ -220,7 +220,7 @@ static inline void drm_legacy_lock_release(struct drm_device *dev, struct file *
 #endif
 
 /* DMA support */
-#if IS_ENABLED(CONFIG_DRM_LEGACY)
+#if IS_ENABLED(CONFIG_DRM_DRI1)
 int drm_legacy_dma_setup(struct drm_device *dev);
 void drm_legacy_dma_takedown(struct drm_device *dev);
 #else
@@ -232,7 +232,7 @@ static inline int drm_legacy_dma_setup(struct drm_device *dev)
 
 void drm_legacy_free_buffer(struct drm_device *dev,
 			    struct drm_buf * buf);
-#if IS_ENABLED(CONFIG_DRM_LEGACY)
+#if IS_ENABLED(CONFIG_DRM_DRI1)
 void drm_legacy_reclaim_buffers(struct drm_device *dev,
 				struct drm_file *filp);
 #else
@@ -241,7 +241,7 @@ static inline void drm_legacy_reclaim_buffers(struct drm_device *dev,
 #endif
 
 /* Scatter Gather Support */
-#if IS_ENABLED(CONFIG_DRM_LEGACY)
+#if IS_ENABLED(CONFIG_DRM_DRI1)
 void drm_legacy_sg_cleanup(struct drm_device *dev);
 int drm_legacy_sg_alloc(struct drm_device *dev, void *data,
 			struct drm_file *file_priv);
@@ -249,7 +249,7 @@ int drm_legacy_sg_free(struct drm_device *dev, void *data,
 		       struct drm_file *file_priv);
 #endif
 
-#if IS_ENABLED(CONFIG_DRM_LEGACY)
+#if IS_ENABLED(CONFIG_DRM_DRI1)
 void drm_legacy_init_members(struct drm_device *dev);
 void drm_legacy_destroy_members(struct drm_device *dev);
 void drm_legacy_dev_reinit(struct drm_device *dev);
@@ -261,20 +261,20 @@ static inline void drm_legacy_dev_reinit(struct drm_device *dev) {}
 static inline int drm_legacy_setup(struct drm_device * dev) { return 0; }
 #endif
 
-#if IS_ENABLED(CONFIG_DRM_LEGACY)
+#if IS_ENABLED(CONFIG_DRM_DRI1)
 void drm_legacy_lock_master_cleanup(struct drm_device *dev, struct drm_master *master);
 #else
 static inline void drm_legacy_lock_master_cleanup(struct drm_device *dev, struct drm_master *master) {}
 #endif
 
-#if IS_ENABLED(CONFIG_DRM_LEGACY)
+#if IS_ENABLED(CONFIG_DRM_DRI1)
 void drm_master_legacy_init(struct drm_master *master);
 #else
 static inline void drm_master_legacy_init(struct drm_master *master) {}
 #endif
 
 /* drm_pci.c */
-#if IS_ENABLED(CONFIG_DRM_LEGACY) && IS_ENABLED(CONFIG_PCI)
+#if IS_ENABLED(CONFIG_DRM_DRI1) && IS_ENABLED(CONFIG_PCI)
 int drm_legacy_irq_by_busid(struct drm_device *dev, void *data, struct drm_file *file_priv);
 void drm_legacy_pci_agp_destroy(struct drm_device *dev);
 #else
diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
index eb0656db08a2..f92c2a484ee5 100644
--- a/drivers/gpu/drm/drm_pci.c
+++ b/drivers/gpu/drm/drm_pci.c
@@ -36,7 +36,7 @@
 #include "drm_internal.h"
 #include "drm_legacy.h"
 
-#ifdef CONFIG_DRM_LEGACY
+#ifdef CONFIG_DRM_DRI1
 /* List of devices hanging off drivers with stealth attach. */
 static LIST_HEAD(legacy_dev_list);
 static DEFINE_MUTEX(legacy_dev_list_lock);
@@ -72,7 +72,7 @@ int drm_pci_set_busid(struct drm_device *dev, struct drm_master *master)
 	return 0;
 }
 
-#ifdef CONFIG_DRM_LEGACY
+#ifdef CONFIG_DRM_DRI1
 
 static int drm_legacy_pci_irq_by_busid(struct drm_device *dev, struct drm_irq_busid *p)
 {
diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index a03b03edc6d4..c33786d30afb 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -210,7 +210,7 @@ static u32 __get_vblank_counter(struct drm_device *dev, unsigned int pipe)
 		if (crtc->funcs->get_vblank_counter)
 			return crtc->funcs->get_vblank_counter(crtc);
 	}
-#ifdef CONFIG_DRM_LEGACY
+#ifdef CONFIG_DRM_DRI1
 	else if (dev->driver->get_vblank_counter) {
 		return dev->driver->get_vblank_counter(dev, pipe);
 	}
@@ -433,7 +433,7 @@ static void __disable_vblank(struct drm_device *dev, unsigned int pipe)
 		if (crtc->funcs->disable_vblank)
 			crtc->funcs->disable_vblank(crtc);
 	}
-#ifdef CONFIG_DRM_LEGACY
+#ifdef CONFIG_DRM_DRI1
 	else {
 		dev->driver->disable_vblank(dev, pipe);
 	}
@@ -1110,7 +1110,7 @@ static int __enable_vblank(struct drm_device *dev, unsigned int pipe)
 		if (crtc->funcs->enable_vblank)
 			return crtc->funcs->enable_vblank(crtc);
 	}
-#ifdef CONFIG_DRM_LEGACY
+#ifdef CONFIG_DRM_DRI1
 	else if (dev->driver->enable_vblank) {
 		return dev->driver->enable_vblank(dev, pipe);
 	}
@@ -1739,7 +1739,7 @@ static void drm_wait_vblank_reply(struct drm_device *dev, unsigned int pipe,
 
 static bool drm_wait_vblank_supported(struct drm_device *dev)
 {
-#if IS_ENABLED(CONFIG_DRM_LEGACY)
+#if IS_ENABLED(CONFIG_DRM_DRI1)
 	if (unlikely(drm_core_check_feature(dev, DRIVER_DRI1)))
 		return dev->irq_enabled;
 #endif
diff --git a/drivers/gpu/drm/drm_vm.c b/drivers/gpu/drm/drm_vm.c
index f024dc93939e..1cb5ee131e7c 100644
--- a/drivers/gpu/drm/drm_vm.c
+++ b/drivers/gpu/drm/drm_vm.c
@@ -651,7 +651,7 @@ int drm_legacy_mmap(struct file *filp, struct vm_area_struct *vma)
 }
 EXPORT_SYMBOL(drm_legacy_mmap);
 
-#if IS_ENABLED(CONFIG_DRM_LEGACY)
+#if IS_ENABLED(CONFIG_DRM_DRI1)
 void drm_legacy_vma_flush(struct drm_device *dev)
 {
 	struct drm_vma_entry *vma, *vma_temp;
diff --git a/include/drm/drm_auth.h b/include/drm/drm_auth.h
index ba248ca8866f..e126df0da509 100644
--- a/include/drm/drm_auth.h
+++ b/include/drm/drm_auth.h
@@ -146,7 +146,7 @@ struct drm_master {
 	 */
 	struct idr lessee_idr;
 	/* private: */
-#if IS_ENABLED(CONFIG_DRM_LEGACY)
+#if IS_ENABLED(CONFIG_DRM_DRI1)
 	struct drm_lock_data lock;
 #endif
 };
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index bbf7ff8aa492..5ff04e6599b7 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -297,7 +297,7 @@ struct drm_device {
 
 	/* Everything below here is for legacy driver, never use! */
 	/* private: */
-#if IS_ENABLED(CONFIG_DRM_LEGACY)
+#if IS_ENABLED(CONFIG_DRM_DRI1)
 	/* List of devices per driver for stealth attach cleanup */
 	struct list_head legacy_dev_list;
 
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index e9725295686b..45cf84b53103 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -459,8 +459,8 @@ struct drm_driver {
 	 */
 	const struct file_operations *fops;
 
-#ifdef CONFIG_DRM_LEGACY
-	/* Everything below here is for legacy driver, never use! */
+#ifdef CONFIG_DRM_DRI1
+	/* Everything below here is for DRI1 drivers, never use! */
 	/* private: */
 
 	int (*firstopen) (struct drm_device *);
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index e0a73a1e2df7..5040b0a7d1c4 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -363,7 +363,7 @@ struct drm_file {
 	struct drm_prime_file_private prime;
 
 	/* private: */
-#if IS_ENABLED(CONFIG_DRM_LEGACY)
+#if IS_ENABLED(CONFIG_DRM_DRI1)
 	unsigned long lock_count; /* DRI1 legacy lock count */
 #endif
 };
diff --git a/include/drm/drm_legacy.h b/include/drm/drm_legacy.h
index 0fc85418aad8..f84a400b884d 100644
--- a/include/drm/drm_legacy.h
+++ b/include/drm/drm_legacy.h
@@ -260,7 +260,7 @@ struct drm_agp_head {
 	unsigned long page_mask;
 };
 
-#if IS_ENABLED(CONFIG_DRM_LEGACY) && IS_ENABLED(CONFIG_AGP)
+#if IS_ENABLED(CONFIG_DRM_DRI1) && IS_ENABLED(CONFIG_AGP)
 struct drm_agp_head *drm_legacy_agp_init(struct drm_device *dev);
 int drm_legacy_agp_acquire(struct drm_device *dev);
 int drm_legacy_agp_release(struct drm_device *dev);
-- 
2.34.1

