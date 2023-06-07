Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEB0725358
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 07:31:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32FE910E423;
	Wed,  7 Jun 2023 05:31:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id BF8DB10E423
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 05:30:57 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8AxnOoPFoBk_wcAAA--.77S3;
 Wed, 07 Jun 2023 13:30:55 +0800 (CST)
Received: from openarena.loongson.cn (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8AxZuQNFoBkiN8DAA--.14158S2; 
 Wed, 07 Jun 2023 13:30:54 +0800 (CST)
From: Sui Jingfeng <suijingfeng@loongson.cn>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Paul Cercueil <paul@crapouillou.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH] drm: gem: add an option for supporting the dma-coherent
 hardware.
Date: Wed,  7 Jun 2023 13:30:53 +0800
Message-Id: <20230607053053.345101-1-suijingfeng@loongson.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8AxZuQNFoBkiN8DAA--.14158S2
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW3WF4fJF45JF1fZFyDXF1DJwc_yoWfWF48pF
 sxCryjgrW8tFWfKr17Aa1ku3W3Cw4fJay8Cr98Xwn3Cw1rCF17Zr98Cr1UXFWUJr1xZF1S
 q3ZFyFyfA3WUCFXCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUU9Fb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
 AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
 XVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
 AKI48JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v2
 6r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
 CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF
 0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
 AIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2
 KfnxnUUI43ZEXa7IU8X_-PUUUUU==
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
Cc: linux-renesas-soc@vger.kernel.org, loongson-kernel@lists.loongnix.cn,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The single map_noncoherent member of struct drm_gem_dma_object may not
sufficient for describing the backing memory of the GEM buffer object.

Especially on dma-coherent systems, the backing memory is both cached
coherent for multi-core CPUs and dma-coherent for peripheral device.
Say architectures like X86-64, LoongArch64, Loongson Mips64, etc.

Whether a peripheral device is dma-coherent or not can be
implementation-dependent. The single map_noncoherent option is not enough
to reflect real hardware anymore. For example, the Loongson LS3A4000 CPU
and LS2K2000/LS2K1000 SoC, peripheral device of such hardware platform
allways snoop CPU's cache. Doing the allocation with dma_alloc_coherent
function is preferred. The return buffer is cached, it should not using
the default write-combine mapping. While with the current implement, there
no way to tell the drm core to reflect this.

This patch adds cached and coherent members to struct drm_gem_dma_object.
which allow driver implements to inform the core. Introducing new mappings
while keeping the original default behavior unchanged.

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/drm_fb_dma_helper.c       | 11 +++++------
 drivers/gpu/drm/drm_fbdev_dma.c           |  2 +-
 drivers/gpu/drm/drm_gem_dma_helper.c      | 20 ++++++++++++++++----
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c |  5 ++++-
 drivers/gpu/drm/rcar-du/Kconfig           |  2 --
 drivers/gpu/drm/rcar-du/rcar_du_kms.c     |  4 +++-
 include/drm/drm_gem_dma_helper.h          |  7 +++++--
 7 files changed, 34 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c b/drivers/gpu/drm/drm_fb_dma_helper.c
index 3b535ad1b07c..93ff05041192 100644
--- a/drivers/gpu/drm/drm_fb_dma_helper.c
+++ b/drivers/gpu/drm/drm_fb_dma_helper.c
@@ -106,16 +106,15 @@ dma_addr_t drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
 EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_addr);
 
 /**
- * drm_fb_dma_sync_non_coherent - Sync GEM object to non-coherent backing
- *	memory
+ * drm_fb_dma_sync_non_coherent - Sync GEM object to cached backing memory
  * @drm: DRM device
  * @old_state: Old plane state
  * @state: New plane state
  *
  * This function can be used by drivers that use damage clips and have
- * DMA GEM objects backed by non-coherent memory. Calling this function
- * in a plane's .atomic_update ensures that all the data in the backing
- * memory have been written to RAM.
+ * DMA GEM objects backed by cached memory. Calling this function in a
+ * plane's .atomic_update ensures that all the data in the backing memory
+ * have been written to RAM.
  */
 void drm_fb_dma_sync_non_coherent(struct drm_device *drm,
 				  struct drm_plane_state *old_state,
@@ -131,7 +130,7 @@ void drm_fb_dma_sync_non_coherent(struct drm_device *drm,
 
 	for (i = 0; i < finfo->num_planes; i++) {
 		dma_obj = drm_fb_dma_get_gem_obj(state->fb, i);
-		if (!dma_obj->map_noncoherent)
+		if (dma_obj->cached && dma_obj->coherent)
 			continue;
 
 		daddr = drm_fb_dma_get_gem_addr(state->fb, state, i);
diff --git a/drivers/gpu/drm/drm_fbdev_dma.c b/drivers/gpu/drm/drm_fbdev_dma.c
index d86773fa8ab0..49fe9b284cc8 100644
--- a/drivers/gpu/drm/drm_fbdev_dma.c
+++ b/drivers/gpu/drm/drm_fbdev_dma.c
@@ -131,7 +131,7 @@ static int drm_fbdev_dma_helper_fb_probe(struct drm_fb_helper *fb_helper,
 
 	/* screen */
 	info->flags |= FBINFO_VIRTFB; /* system memory */
-	if (dma_obj->map_noncoherent)
+	if (dma_obj->cached)
 		info->flags |= FBINFO_READS_FAST; /* signal caching */
 	info->screen_size = sizes->surface_height * fb->pitches[0];
 	info->screen_buffer = map.vaddr;
diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
index 870b90b78bc4..dec1d512bdf1 100644
--- a/drivers/gpu/drm/drm_gem_dma_helper.c
+++ b/drivers/gpu/drm/drm_gem_dma_helper.c
@@ -93,7 +93,11 @@ __drm_gem_dma_create(struct drm_device *drm, size_t size, bool private)
 		drm_gem_private_object_init(drm, gem_obj, size);
 
 		/* Always use writecombine for dma-buf mappings */
-		dma_obj->map_noncoherent = false;
+		/* FIXME: This is not always true, on some dma coherent system,
+		 * cached mappings should be preferred over writecombine
+		 */
+		dma_obj->cached = false;
+		dma_obj->coherent = false;
 	} else {
 		ret = drm_gem_object_init(drm, gem_obj, size);
 	}
@@ -143,7 +147,11 @@ struct drm_gem_dma_object *drm_gem_dma_create(struct drm_device *drm,
 	if (IS_ERR(dma_obj))
 		return dma_obj;
 
-	if (dma_obj->map_noncoherent) {
+	if (dma_obj->cached && dma_obj->coherent) {
+		dma_obj->vaddr = dma_alloc_coherent(drm->dev, size,
+						    &dma_obj->dma_addr,
+						    GFP_KERNEL | __GFP_NOWARN);
+	} else if (dma_obj->cached && !dma_obj->coherent) {
 		dma_obj->vaddr = dma_alloc_noncoherent(drm->dev, size,
 						       &dma_obj->dma_addr,
 						       DMA_TO_DEVICE,
@@ -153,6 +161,7 @@ struct drm_gem_dma_object *drm_gem_dma_create(struct drm_device *drm,
 					      &dma_obj->dma_addr,
 					      GFP_KERNEL | __GFP_NOWARN);
 	}
+
 	if (!dma_obj->vaddr) {
 		drm_dbg(drm, "failed to allocate buffer with size %zu\n",
 			 size);
@@ -233,7 +242,10 @@ void drm_gem_dma_free(struct drm_gem_dma_object *dma_obj)
 			dma_buf_vunmap_unlocked(gem_obj->import_attach->dmabuf, &map);
 		drm_prime_gem_destroy(gem_obj, dma_obj->sgt);
 	} else if (dma_obj->vaddr) {
-		if (dma_obj->map_noncoherent)
+		if (dma_obj->cached && dma_obj->coherent)
+			dma_free_coherent(gem_obj->dev->dev, dma_obj->base.size,
+					  dma_obj->vaddr, dma_obj->dma_addr);
+		else if (dma_obj->cached && !dma_obj->coherent)
 			dma_free_noncoherent(gem_obj->dev->dev, dma_obj->base.size,
 					     dma_obj->vaddr, dma_obj->dma_addr,
 					     DMA_TO_DEVICE);
@@ -532,7 +544,7 @@ int drm_gem_dma_mmap(struct drm_gem_dma_object *dma_obj, struct vm_area_struct *
 	vma->vm_pgoff -= drm_vma_node_start(&obj->vma_node);
 	vm_flags_mod(vma, VM_DONTEXPAND, VM_PFNMAP);
 
-	if (dma_obj->map_noncoherent) {
+	if (dma_obj->cached) {
 		vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
 
 		ret = dma_mmap_pages(dma_obj->base.dev->dev,
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 5ec75e9ba499..a3df2f99a757 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -919,7 +919,10 @@ ingenic_drm_gem_create_object(struct drm_device *drm, size_t size)
 	if (!obj)
 		return ERR_PTR(-ENOMEM);
 
-	obj->map_noncoherent = priv->soc_info->map_noncoherent;
+	if (priv->soc_info->map_noncoherent) {
+		obj->cached = true;
+		obj->coherent = false;
+	}
 
 	return &obj->base;
 }
diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index 53c356aed5d5..dddc70c08bdc 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -2,8 +2,6 @@
 config DRM_RCAR_DU
 	tristate "DRM Support for R-Car Display Unit"
 	depends on DRM && OF
-	depends on ARM || ARM64
-	depends on ARCH_RENESAS || COMPILE_TEST
 	select DRM_KMS_HELPER
 	select DRM_GEM_DMA_HELPER
 	select VIDEOMODE_HELPERS
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index adfb36b0e815..1142d51473e6 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -386,7 +386,9 @@ struct drm_gem_object *rcar_du_gem_prime_import_sg_table(struct drm_device *dev,
 	gem_obj->funcs = &rcar_du_gem_funcs;
 
 	drm_gem_private_object_init(dev, gem_obj, attach->dmabuf->size);
-	dma_obj->map_noncoherent = false;
+
+	dma_obj->cached = false;
+	dma_obj->coherent = false;
 
 	ret = drm_gem_create_mmap_offset(gem_obj);
 	if (ret) {
diff --git a/include/drm/drm_gem_dma_helper.h b/include/drm/drm_gem_dma_helper.h
index 8a043235dad8..585ce3d4d1eb 100644
--- a/include/drm/drm_gem_dma_helper.h
+++ b/include/drm/drm_gem_dma_helper.h
@@ -16,7 +16,9 @@ struct drm_mode_create_dumb;
  *       more than one entry but they are guaranteed to have contiguous
  *       DMA addresses.
  * @vaddr: kernel virtual address of the backing memory
- * @map_noncoherent: if true, the GEM object is backed by non-coherent memory
+ * @cached: if true, the GEM object is backed by cached memory
+ * @coherent: This option only meaningful when a GEM object is cached.
+ *            If true, Sync the GEM object for DMA access is not required.
  */
 struct drm_gem_dma_object {
 	struct drm_gem_object base;
@@ -26,7 +28,8 @@ struct drm_gem_dma_object {
 	/* For objects with DMA memory allocated by GEM DMA */
 	void *vaddr;
 
-	bool map_noncoherent;
+	bool cached;
+	bool coherent;
 };
 
 #define to_drm_gem_dma_obj(gem_obj) \
-- 
2.25.1

