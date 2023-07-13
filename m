Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA493751B79
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 10:25:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE0D010E627;
	Thu, 13 Jul 2023 08:25:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABA4910E632
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 08:25:24 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrcg-0005yT-KS; Thu, 13 Jul 2023 10:24:26 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrcf-00E4jx-M9; Thu, 13 Jul 2023 10:24:25 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrce-004VhO-8g; Thu, 13 Jul 2023 10:24:24 +0200
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
Subject: [PATCH 11/17] drm/gem_object: Rename struct drm_gem_object::dev to drm
Date: Thu, 13 Jul 2023 10:24:02 +0200
Message-Id: <20230713082408.2266984-12-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
References: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=126676;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=diGv+3Zczl6ixPSF8uZ0PHnLj9OFOFPKrUZPiosht2Y=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkr7SWS5Ooz7U4zLRIYsdpOr3SBVU8FaQJtSLja
 4MLSNDIQamJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK+0lgAKCRCPgPtYfRL+
 TrKMB/0cRjAH9h5ZO8Xr9wyWt0bQ5Fh9wwQThPjeyrcdHCC7wMRzXad3FGlR5nObMV4+CxrsTMw
 vfEPZI8sCRJRlrgbFNlAhFY76lDTFhnAM1jM5tl5V176vz/DtqVBogNYRHfCf++Rgywxd4u/3e3
 Iw/UhlfyOtKXuk9J89BzEYKJiFryFfeORl5WGVxKS+MZbcATK+zMyHjXUuVf+v9QDFTPmHg0pr/
 RoKeFw3FUIZ+eRkolSnHktsyM6Re1uwCJqVwiyPiUZvIHs5Qic+v/kt5L8WsJDBxgeyaXJG5vRK
 8eI6yfWi7i00V2wTDauV7Rkui/GOwG+Gx3q47Ht71CFNbWve
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
 drivers/accel/ivpu/ivpu_gem.c                 |  2 +-
 drivers/accel/ivpu/ivpu_gem.h                 |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c    |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c   |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       |  2 +-
 drivers/gpu/drm/armada/armada_gem.c           |  6 +--
 drivers/gpu/drm/drm_gem.c                     | 14 +++---
 drivers/gpu/drm/drm_gem_dma_helper.c          | 11 ++---
 drivers/gpu/drm/drm_gem_shmem_helper.c        | 39 +++++++++--------
 drivers/gpu/drm/drm_gem_vram_helper.c         |  4 +-
 drivers/gpu/drm/drm_prime.c                   | 12 +++---
 drivers/gpu/drm/etnaviv/etnaviv_gem.c         | 18 ++++----
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c   |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_gem.c       | 15 ++++---
 drivers/gpu/drm/gma500/gem.c                  |  6 +--
 drivers/gpu/drm/i915/display/intel_dpt.c      |  2 +-
 drivers/gpu/drm/i915/display/intel_fb.c       |  6 +--
 .../gpu/drm/i915/display/intel_frontbuffer.c  | 18 ++++----
 .../drm/i915/display/skl_universal_plane.c    |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_clflush.c   |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  8 ++--
 drivers/gpu/drm/i915/gem/i915_gem_domain.c    |  6 +--
 drivers/gpu/drm/i915/gem/i915_gem_internal.c  |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      | 18 ++++----
 drivers/gpu/drm/i915/gem/i915_gem_object.c    | 26 +++++------
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c     |  8 ++--
 drivers/gpu/drm/i915/gem/i915_gem_phys.c      | 12 +++---
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |  4 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |  8 ++--
 drivers/gpu/drm/i915/gem/i915_gem_tiling.c    |  8 ++--
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       | 24 +++++------
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  |  4 +-
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c   | 10 ++---
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |  4 +-
 .../i915/gem/selftests/i915_gem_client_blt.c  |  2 +-
 .../drm/i915/gem/selftests/i915_gem_context.c |  4 +-
 .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |  4 +-
 .../drm/i915/gem/selftests/i915_gem_migrate.c |  2 +-
 .../drm/i915/gem/selftests/i915_gem_mman.c    |  8 ++--
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c  |  2 +-
 drivers/gpu/drm/i915/gt/shmem_utils.c         |  2 +-
 drivers/gpu/drm/i915/gvt/dmabuf.c             |  2 +-
 drivers/gpu/drm/i915/i915_gem.c               | 12 +++---
 drivers/gpu/drm/i915/i915_gem_gtt.c           |  6 +--
 drivers/gpu/drm/i915/i915_vma.c               | 10 ++---
 drivers/gpu/drm/lima/lima_gem.c               |  4 +-
 drivers/gpu/drm/loongson/lsdc_gem.c           | 12 +++---
 drivers/gpu/drm/loongson/lsdc_ttm.c           |  6 +--
 drivers/gpu/drm/mediatek/mtk_drm_gem.c        |  6 +--
 drivers/gpu/drm/msm/msm_gem.c                 | 42 +++++++++---------
 drivers/gpu/drm/msm/msm_gem_prime.c           |  2 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c          |  2 +-
 drivers/gpu/drm/nouveau/nouveau_prime.c       |  2 +-
 drivers/gpu/drm/omapdrm/omap_gem.c            | 43 ++++++++++---------
 drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c     |  4 +-
 drivers/gpu/drm/panfrost/panfrost_gem.c       |  2 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c       |  4 +-
 drivers/gpu/drm/qxl/qxl_gem.c                 |  2 +-
 drivers/gpu/drm/qxl/qxl_object.c              |  4 +-
 drivers/gpu/drm/qxl/qxl_object.h              |  2 +-
 drivers/gpu/drm/qxl/qxl_release.c             |  2 +-
 drivers/gpu/drm/qxl/qxl_ttm.c                 |  2 +-
 drivers/gpu/drm/radeon/radeon_prime.c         |  2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c   | 23 +++++-----
 drivers/gpu/drm/tegra/gem.c                   | 21 ++++-----
 drivers/gpu/drm/ttm/ttm_bo_util.c             |  2 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c               |  4 +-
 drivers/gpu/drm/v3d/v3d_bo.c                  |  4 +-
 drivers/gpu/drm/v3d/v3d_mmu.c                 |  4 +-
 drivers/gpu/drm/vc4/vc4_bo.c                  | 20 ++++-----
 drivers/gpu/drm/vc4/vc4_validate.c            |  2 +-
 drivers/gpu/drm/vc4/vc4_validate_shaders.c    |  2 +-
 drivers/gpu/drm/virtio/virtgpu_gem.c          |  6 +--
 drivers/gpu/drm/virtio/virtgpu_object.c       |  4 +-
 drivers/gpu/drm/virtio/virtgpu_prime.c        |  6 +--
 drivers/gpu/drm/virtio/virtgpu_vram.c         |  8 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c           |  3 +-
 drivers/gpu/drm/xen/xen_drm_front.c           |  4 +-
 drivers/gpu/drm/xen/xen_drm_front_gem.c       |  2 +-
 include/drm/drm_gem.h                         |  4 +-
 81 files changed, 319 insertions(+), 312 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
index 52b339aefadc..75b78e63acc3 100644
--- a/drivers/accel/ivpu/ivpu_gem.c
+++ b/drivers/accel/ivpu/ivpu_gem.c
@@ -464,7 +464,7 @@ static struct sg_table *ivpu_bo_get_sg_table(struct drm_gem_object *obj)
 	if (ret)
 		return ERR_PTR(ret);
 
-	return drm_prime_pages_to_sg(obj->dev, bo->pages, npages);
+	return drm_prime_pages_to_sg(obj->drm, bo->pages, npages);
 }
 
 static vm_fault_t ivpu_vm_fault(struct vm_fault *vmf)
diff --git a/drivers/accel/ivpu/ivpu_gem.h b/drivers/accel/ivpu/ivpu_gem.h
index 6b0ceda5f253..ae6252513fbb 100644
--- a/drivers/accel/ivpu/ivpu_gem.h
+++ b/drivers/accel/ivpu/ivpu_gem.h
@@ -99,7 +99,7 @@ static inline pgprot_t ivpu_bo_pgprot(struct ivpu_bo *bo, pgprot_t prot)
 
 static inline struct ivpu_device *ivpu_bo_to_vdev(struct ivpu_bo *bo)
 {
-	return to_ivpu_device(bo->base.dev);
+	return to_ivpu_device(bo->base.drm);
 }
 
 static inline void *ivpu_to_cpu_addr(struct ivpu_bo *bo, u32 vpu_addr)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
index b4fcad0e62f7..8f7fee850cde 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
@@ -524,11 +524,11 @@ int amdgpu_amdkfd_get_dmabuf_info(struct amdgpu_device *adev, int dma_buf_fd,
 		goto out_put;
 
 	obj = dma_buf->priv;
-	if (obj->dev->driver != adev_to_drm(adev)->driver)
+	if (obj->drm->driver != adev_to_drm(adev)->driver)
 		/* Can't handle buffers from different drivers */
 		goto out_put;
 
-	adev = drm_to_adev(obj->dev);
+	adev = drm_to_adev(obj->drm);
 	bo = gem_to_amdgpu_bo(obj);
 	if (!(bo->preferred_domains & (AMDGPU_GEM_DOMAIN_VRAM |
 				    AMDGPU_GEM_DOMAIN_GTT)))
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index 12210598e5b8..9461cc8c3257 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -168,7 +168,7 @@ static struct sg_table *amdgpu_dma_buf_map(struct dma_buf_attachment *attach,
 
 	switch (bo->tbo.resource->mem_type) {
 	case TTM_PL_TT:
-		sgt = drm_prime_pages_to_sg(obj->dev,
+		sgt = drm_prime_pages_to_sg(obj->drm,
 					    bo->tbo.ttm->pages,
 					    bo->tbo.ttm->num_pages);
 		if (IS_ERR(sgt))
@@ -438,7 +438,7 @@ struct drm_gem_object *amdgpu_gem_prime_import(struct drm_device *dev,
 
 	if (dma_buf->ops == &amdgpu_dmabuf_ops) {
 		obj = dma_buf->priv;
-		if (obj->dev == dev) {
+		if (obj->drm == dev) {
 			/*
 			 * Importing dmabuf exported from out own gem increases
 			 * refcount on gem itself instead of f_count of dmabuf.
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 7da871972a8e..b3340d080e0b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -48,7 +48,7 @@ static const struct drm_gem_object_funcs amdgpu_gem_object_funcs;
 static vm_fault_t amdgpu_gem_fault(struct vm_fault *vmf)
 {
 	struct ttm_buffer_object *bo = vmf->vma->vm_private_data;
-	struct drm_device *ddev = bo->base.dev;
+	struct drm_device *ddev = bo->base.drm;
 	vm_fault_t ret;
 	int idx;
 
diff --git a/drivers/gpu/drm/armada/armada_gem.c b/drivers/gpu/drm/armada/armada_gem.c
index 26d10065d534..9d1768da4c14 100644
--- a/drivers/gpu/drm/armada/armada_gem.c
+++ b/drivers/gpu/drm/armada/armada_gem.c
@@ -41,7 +41,7 @@ static size_t roundup_gem_size(size_t size)
 void armada_gem_free_object(struct drm_gem_object *obj)
 {
 	struct armada_gem_object *dobj = drm_to_armada_gem(obj);
-	struct armada_private *priv = drm_to_armada_dev(obj->dev);
+	struct armada_private *priv = drm_to_armada_dev(obj->drm);
 
 	DRM_DEBUG_DRIVER("release obj %p\n", dobj);
 
@@ -493,7 +493,7 @@ armada_gem_prime_export(struct drm_gem_object *obj, int flags)
 	exp_info.flags = O_RDWR;
 	exp_info.priv = obj;
 
-	return drm_gem_dmabuf_export(obj->dev, &exp_info);
+	return drm_gem_dmabuf_export(obj->drm, &exp_info);
 }
 
 struct drm_gem_object *
@@ -504,7 +504,7 @@ armada_gem_prime_import(struct drm_device *dev, struct dma_buf *buf)
 
 	if (buf->ops == &armada_gem_prime_dmabuf_ops) {
 		struct drm_gem_object *obj = buf->priv;
-		if (obj->dev == dev) {
+		if (obj->drm == dev) {
 			/*
 			 * Importing our own dmabuf(s) increases the
 			 * refcount on the gem object itself.
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index c18686f434d4..ce9a8a3d281c 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -154,7 +154,7 @@ void drm_gem_private_object_init(struct drm_device *dev,
 {
 	BUG_ON((size & (PAGE_SIZE - 1)) != 0);
 
-	obj->dev = dev;
+	obj->drm = dev;
 	obj->filp = NULL;
 
 	kref_init(&obj->refcount);
@@ -195,7 +195,7 @@ EXPORT_SYMBOL(drm_gem_private_object_fini);
  */
 static void drm_gem_object_handle_free(struct drm_gem_object *obj)
 {
-	struct drm_device *dev = obj->dev;
+	struct drm_device *dev = obj->drm;
 
 	/* Remove any name for this object */
 	if (obj->name) {
@@ -216,7 +216,7 @@ static void drm_gem_object_exported_dma_buf_free(struct drm_gem_object *obj)
 static void
 drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
 {
-	struct drm_device *dev = obj->dev;
+	struct drm_device *dev = obj->drm;
 	bool final = false;
 
 	if (WARN_ON(READ_ONCE(obj->handle_count) == 0))
@@ -355,7 +355,7 @@ drm_gem_handle_create_tail(struct drm_file *file_priv,
 			   struct drm_gem_object *obj,
 			   u32 *handlep)
 {
-	struct drm_device *dev = obj->dev;
+	struct drm_device *dev = obj->drm;
 	u32 handle;
 	int ret;
 
@@ -422,7 +422,7 @@ int drm_gem_handle_create(struct drm_file *file_priv,
 			  struct drm_gem_object *obj,
 			  u32 *handlep)
 {
-	mutex_lock(&obj->dev->object_name_lock);
+	mutex_lock(&obj->drm->object_name_lock);
 
 	return drm_gem_handle_create_tail(file_priv, obj, handlep);
 }
@@ -442,7 +442,7 @@ EXPORT_SYMBOL(drm_gem_handle_create);
 void
 drm_gem_free_mmap_offset(struct drm_gem_object *obj)
 {
-	struct drm_device *dev = obj->dev;
+	struct drm_device *dev = obj->drm;
 
 	drm_vma_offset_remove(dev->vma_offset_manager, &obj->vma_node);
 }
@@ -468,7 +468,7 @@ EXPORT_SYMBOL(drm_gem_free_mmap_offset);
 int
 drm_gem_create_mmap_offset_size(struct drm_gem_object *obj, size_t size)
 {
-	struct drm_device *dev = obj->dev;
+	struct drm_device *dev = obj->drm;
 
 	return drm_vma_offset_add(dev->vma_offset_manager, &obj->vma_node,
 				  size / PAGE_SIZE);
diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
index 870b90b78bc4..ff328191cfa5 100644
--- a/drivers/gpu/drm/drm_gem_dma_helper.c
+++ b/drivers/gpu/drm/drm_gem_dma_helper.c
@@ -234,11 +234,12 @@ void drm_gem_dma_free(struct drm_gem_dma_object *dma_obj)
 		drm_prime_gem_destroy(gem_obj, dma_obj->sgt);
 	} else if (dma_obj->vaddr) {
 		if (dma_obj->map_noncoherent)
-			dma_free_noncoherent(gem_obj->dev->dev, dma_obj->base.size,
+			dma_free_noncoherent(gem_obj->drm->dev,
+					     dma_obj->base.size,
 					     dma_obj->vaddr, dma_obj->dma_addr,
 					     DMA_TO_DEVICE);
 		else
-			dma_free_wc(gem_obj->dev->dev, dma_obj->base.size,
+			dma_free_wc(gem_obj->drm->dev, dma_obj->base.size,
 				    dma_obj->vaddr, dma_obj->dma_addr);
 	}
 
@@ -428,7 +429,7 @@ struct sg_table *drm_gem_dma_get_sg_table(struct drm_gem_dma_object *dma_obj)
 	if (!sgt)
 		return ERR_PTR(-ENOMEM);
 
-	ret = dma_get_sgtable(obj->dev->dev, sgt, dma_obj->vaddr,
+	ret = dma_get_sgtable(obj->drm->dev, sgt, dma_obj->vaddr,
 			      dma_obj->dma_addr, obj->size);
 	if (ret < 0)
 		goto out;
@@ -535,11 +536,11 @@ int drm_gem_dma_mmap(struct drm_gem_dma_object *dma_obj, struct vm_area_struct *
 	if (dma_obj->map_noncoherent) {
 		vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
 
-		ret = dma_mmap_pages(dma_obj->base.dev->dev,
+		ret = dma_mmap_pages(dma_obj->base.drm->dev,
 				     vma, vma->vm_end - vma->vm_start,
 				     virt_to_page(dma_obj->vaddr));
 	} else {
-		ret = dma_mmap_wc(dma_obj->base.dev->dev, vma, dma_obj->vaddr,
+		ret = dma_mmap_wc(dma_obj->base.drm->dev, vma, dma_obj->vaddr,
 				  dma_obj->dma_addr,
 				  vma->vm_end - vma->vm_start);
 	}
diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index a783d2245599..7c0478f06558 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -144,10 +144,10 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
 	} else {
 		dma_resv_lock(shmem->base.resv, NULL);
 
-		drm_WARN_ON(obj->dev, shmem->vmap_use_count);
+		drm_WARN_ON(obj->drm, shmem->vmap_use_count);
 
 		if (shmem->sgt) {
-			dma_unmap_sgtable(obj->dev->dev, shmem->sgt,
+			dma_unmap_sgtable(obj->drm->dev, shmem->sgt,
 					  DMA_BIDIRECTIONAL, 0);
 			sg_free_table(shmem->sgt);
 			kfree(shmem->sgt);
@@ -155,7 +155,7 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
 		if (shmem->pages)
 			drm_gem_shmem_put_pages(shmem);
 
-		drm_WARN_ON(obj->dev, shmem->pages_use_count);
+		drm_WARN_ON(obj->drm, shmem->pages_use_count);
 
 		dma_resv_unlock(shmem->base.resv);
 	}
@@ -177,7 +177,7 @@ static int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
 
 	pages = drm_gem_get_pages(obj);
 	if (IS_ERR(pages)) {
-		drm_dbg_kms(obj->dev, "Failed to get pages (%ld)\n",
+		drm_dbg_kms(obj->drm, "Failed to get pages (%ld)\n",
 			    PTR_ERR(pages));
 		shmem->pages_use_count = 0;
 		return PTR_ERR(pages);
@@ -210,7 +210,7 @@ void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem)
 
 	dma_resv_assert_held(shmem->base.resv);
 
-	if (drm_WARN_ON_ONCE(obj->dev, !shmem->pages_use_count))
+	if (drm_WARN_ON_ONCE(obj->drm, !shmem->pages_use_count))
 		return;
 
 	if (--shmem->pages_use_count > 0)
@@ -261,7 +261,7 @@ int drm_gem_shmem_pin(struct drm_gem_shmem_object *shmem)
 	struct drm_gem_object *obj = &shmem->base;
 	int ret;
 
-	drm_WARN_ON(obj->dev, obj->import_attach);
+	drm_WARN_ON(obj->drm, obj->import_attach);
 
 	ret = dma_resv_lock_interruptible(shmem->base.resv, NULL);
 	if (ret)
@@ -284,7 +284,7 @@ void drm_gem_shmem_unpin(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
 
-	drm_WARN_ON(obj->dev, obj->import_attach);
+	drm_WARN_ON(obj->drm, obj->import_attach);
 
 	dma_resv_lock(shmem->base.resv, NULL);
 	drm_gem_shmem_unpin_locked(shmem);
@@ -316,7 +316,7 @@ int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
 	if (obj->import_attach) {
 		ret = dma_buf_vmap(obj->import_attach->dmabuf, map);
 		if (!ret) {
-			if (drm_WARN_ON(obj->dev, map->is_iomem)) {
+			if (drm_WARN_ON(obj->drm, map->is_iomem)) {
 				dma_buf_vunmap(obj->import_attach->dmabuf, map);
 				return -EIO;
 			}
@@ -346,7 +346,7 @@ int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
 	}
 
 	if (ret) {
-		drm_dbg_kms(obj->dev, "Failed to vmap pages, error %d\n", ret);
+		drm_dbg_kms(obj->drm, "Failed to vmap pages, error %d\n", ret);
 		goto err_put_pages;
 	}
 
@@ -384,7 +384,7 @@ void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem,
 	} else {
 		dma_resv_assert_held(shmem->base.resv);
 
-		if (drm_WARN_ON_ONCE(obj->dev, !shmem->vmap_use_count))
+		if (drm_WARN_ON_ONCE(obj->drm, !shmem->vmap_use_count))
 			return;
 
 		if (--shmem->vmap_use_count > 0)
@@ -440,11 +440,11 @@ EXPORT_SYMBOL(drm_gem_shmem_madvise);
 void drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
-	struct drm_device *dev = obj->dev;
+	struct drm_device *dev = obj->drm;
 
 	dma_resv_assert_held(shmem->base.resv);
 
-	drm_WARN_ON(obj->dev, !drm_gem_shmem_is_purgeable(shmem));
+	drm_WARN_ON(obj->drm, !drm_gem_shmem_is_purgeable(shmem));
 
 	dma_unmap_sgtable(dev->dev, shmem->sgt, DMA_BIDIRECTIONAL, 0);
 	sg_free_table(shmem->sgt);
@@ -522,7 +522,7 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
 	dma_resv_lock(shmem->base.resv, NULL);
 
 	if (page_offset >= num_pages ||
-	    drm_WARN_ON_ONCE(obj->dev, !shmem->pages) ||
+	    drm_WARN_ON_ONCE(obj->drm, !shmem->pages) ||
 	    shmem->madv < 0) {
 		ret = VM_FAULT_SIGBUS;
 	} else {
@@ -541,7 +541,7 @@ static void drm_gem_shmem_vm_open(struct vm_area_struct *vma)
 	struct drm_gem_object *obj = vma->vm_private_data;
 	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
 
-	drm_WARN_ON(obj->dev, obj->import_attach);
+	drm_WARN_ON(obj->drm, obj->import_attach);
 
 	dma_resv_lock(shmem->base.resv, NULL);
 
@@ -550,7 +550,7 @@ static void drm_gem_shmem_vm_open(struct vm_area_struct *vma)
 	 * mmap'd, vm_open() just grabs an additional reference for the new
 	 * mm the vma is getting copied into (ie. on fork()).
 	 */
-	if (!drm_WARN_ON_ONCE(obj->dev, !shmem->pages_use_count))
+	if (!drm_WARN_ON_ONCE(obj->drm, !shmem->pages_use_count))
 		shmem->pages_use_count++;
 
 	dma_resv_unlock(shmem->base.resv);
@@ -656,9 +656,10 @@ struct sg_table *drm_gem_shmem_get_sg_table(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
 
-	drm_WARN_ON(obj->dev, obj->import_attach);
+	drm_WARN_ON(obj->drm, obj->import_attach);
 
-	return drm_prime_pages_to_sg(obj->dev, shmem->pages, obj->size >> PAGE_SHIFT);
+	return drm_prime_pages_to_sg(obj->drm, shmem->pages,
+				     obj->size >> PAGE_SHIFT);
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_get_sg_table);
 
@@ -671,7 +672,7 @@ static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_
 	if (shmem->sgt)
 		return shmem->sgt;
 
-	drm_WARN_ON(obj->dev, obj->import_attach);
+	drm_WARN_ON(obj->drm, obj->import_attach);
 
 	ret = drm_gem_shmem_get_pages(shmem);
 	if (ret)
@@ -683,7 +684,7 @@ static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_
 		goto err_put_pages;
 	}
 	/* Map the pages for use by the h/w. */
-	ret = dma_map_sgtable(obj->dev->dev, sgt, DMA_BIDIRECTIONAL, 0);
+	ret = dma_map_sgtable(obj->drm->dev, sgt, DMA_BIDIRECTIONAL, 0);
 	if (ret)
 		goto err_free_sgt;
 
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index fc45a65708b7..54e53ca19482 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -395,7 +395,7 @@ static int drm_gem_vram_kmap_locked(struct drm_gem_vram_object *gbo,
 static void drm_gem_vram_kunmap_locked(struct drm_gem_vram_object *gbo,
 				       struct iosys_map *map)
 {
-	struct drm_device *dev = gbo->bo.base.dev;
+	struct drm_device *dev = gbo->bo.base.drm;
 
 	if (drm_WARN_ON_ONCE(dev, !gbo->vmap_use_count))
 		return;
@@ -552,7 +552,7 @@ static void drm_gem_vram_bo_driver_evict_flags(struct drm_gem_vram_object *gbo,
 static void drm_gem_vram_bo_driver_move_notify(struct drm_gem_vram_object *gbo)
 {
 	struct ttm_buffer_object *bo = &gbo->bo;
-	struct drm_device *dev = bo->base.dev;
+	struct drm_device *dev = bo->base.drm;
 
 	if (drm_WARN_ON_ONCE(dev, gbo->vmap_use_count))
 		return;
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 63b709a67471..f8cc88084be6 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -251,7 +251,7 @@ struct dma_buf *drm_gem_dmabuf_export(struct drm_device *dev,
 
 	drm_dev_get(dev);
 	drm_gem_object_get(obj);
-	dma_buf->file->f_mapping = obj->dev->anon_inode->i_mapping;
+	dma_buf->file->f_mapping = obj->drm->anon_inode->i_mapping;
 
 	return dma_buf;
 }
@@ -269,7 +269,7 @@ EXPORT_SYMBOL(drm_gem_dmabuf_export);
 void drm_gem_dmabuf_release(struct dma_buf *dma_buf)
 {
 	struct drm_gem_object *obj = dma_buf->priv;
-	struct drm_device *dev = obj->dev;
+	struct drm_device *dev = obj->drm;
 
 	/* drop the reference on the export fd holds */
 	drm_gem_object_put(obj);
@@ -742,14 +742,14 @@ int drm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
 	}
 
 	/* Used by drm_gem_mmap() to lookup the GEM object */
-	priv->minor = obj->dev->primary;
+	priv->minor = obj->drm->primary;
 	fil->private_data = priv;
 
 	ret = drm_vma_node_allow(&obj->vma_node, priv);
 	if (ret)
 		goto out;
 
-	ret = obj->dev->driver->fops->mmap(fil, vma);
+	ret = obj->drm->driver->fops->mmap(fil, vma);
 
 	drm_vma_node_revoke(&obj->vma_node, priv);
 out:
@@ -871,7 +871,7 @@ EXPORT_SYMBOL(drm_prime_get_contiguous_size);
 struct dma_buf *drm_gem_prime_export(struct drm_gem_object *obj,
 				     int flags)
 {
-	struct drm_device *dev = obj->dev;
+	struct drm_device *dev = obj->drm;
 	struct dma_buf_export_info exp_info = {
 		.exp_name = KBUILD_MODNAME, /* white lie for debug */
 		.owner = dev->driver->fops->owner,
@@ -911,7 +911,7 @@ struct drm_gem_object *drm_gem_prime_import_dev(struct drm_device *dev,
 
 	if (dma_buf->ops == &drm_gem_prime_dmabuf_ops) {
 		obj = dma_buf->priv;
-		if (obj->dev == dev) {
+		if (obj->drm == dev) {
 			/*
 			 * Importing dmabuf exported from our own gem increases
 			 * refcount on gem itself instead of f_count of dmabuf.
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index b5f73502e3dd..95827f55ce2b 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -19,7 +19,7 @@ static struct lock_class_key etnaviv_userptr_lock_class;
 
 static void etnaviv_gem_scatter_map(struct etnaviv_gem_object *etnaviv_obj)
 {
-	struct drm_device *dev = etnaviv_obj->base.dev;
+	struct drm_device *dev = etnaviv_obj->base.drm;
 	struct sg_table *sgt = etnaviv_obj->sgt;
 
 	/*
@@ -32,7 +32,7 @@ static void etnaviv_gem_scatter_map(struct etnaviv_gem_object *etnaviv_obj)
 
 static void etnaviv_gem_scatterlist_unmap(struct etnaviv_gem_object *etnaviv_obj)
 {
-	struct drm_device *dev = etnaviv_obj->base.dev;
+	struct drm_device *dev = etnaviv_obj->base.drm;
 	struct sg_table *sgt = etnaviv_obj->sgt;
 
 	/*
@@ -57,7 +57,7 @@ static void etnaviv_gem_scatterlist_unmap(struct etnaviv_gem_object *etnaviv_obj
 /* called with etnaviv_obj->lock held */
 static int etnaviv_gem_shmem_get_pages(struct etnaviv_gem_object *etnaviv_obj)
 {
-	struct drm_device *dev = etnaviv_obj->base.dev;
+	struct drm_device *dev = etnaviv_obj->base.drm;
 	struct page **p = drm_gem_get_pages(&etnaviv_obj->base);
 
 	if (IS_ERR(p)) {
@@ -99,11 +99,11 @@ struct page **etnaviv_gem_get_pages(struct etnaviv_gem_object *etnaviv_obj)
 	}
 
 	if (!etnaviv_obj->sgt) {
-		struct drm_device *dev = etnaviv_obj->base.dev;
+		struct drm_device *dev = etnaviv_obj->base.drm;
 		int npages = etnaviv_obj->base.size >> PAGE_SHIFT;
 		struct sg_table *sgt;
 
-		sgt = drm_prime_pages_to_sg(etnaviv_obj->base.dev,
+		sgt = drm_prime_pages_to_sg(etnaviv_obj->base.drm,
 					    etnaviv_obj->pages, npages);
 		if (IS_ERR(sgt)) {
 			dev_err(dev->dev, "failed to allocate sgt: %ld\n",
@@ -205,7 +205,7 @@ int etnaviv_gem_mmap_offset(struct drm_gem_object *obj, u64 *offset)
 	/* Make it mmapable */
 	ret = drm_gem_create_mmap_offset(obj);
 	if (ret)
-		dev_err(obj->dev->dev, "could not allocate mmap offset\n");
+		dev_err(obj->drm->dev, "could not allocate mmap offset\n");
 	else
 		*offset = drm_vma_node_offset_addr(&obj->vma_node);
 
@@ -368,7 +368,7 @@ int etnaviv_gem_cpu_prep(struct drm_gem_object *obj, u32 op,
 		struct drm_etnaviv_timespec *timeout)
 {
 	struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
-	struct drm_device *dev = obj->dev;
+	struct drm_device *dev = obj->drm;
 	bool write = !!(op & ETNA_PREP_WRITE);
 	int ret;
 
@@ -406,7 +406,7 @@ int etnaviv_gem_cpu_prep(struct drm_gem_object *obj, u32 op,
 
 int etnaviv_gem_cpu_fini(struct drm_gem_object *obj)
 {
-	struct drm_device *dev = obj->dev;
+	struct drm_device *dev = obj->drm;
 	struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
 
 	if (etnaviv_obj->flags & ETNA_BO_CACHED) {
@@ -487,7 +487,7 @@ static const struct etnaviv_gem_ops etnaviv_gem_shmem_ops = {
 void etnaviv_gem_free_object(struct drm_gem_object *obj)
 {
 	struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
-	struct etnaviv_drm_private *priv = obj->dev->dev_private;
+	struct etnaviv_drm_private *priv = obj->drm->dev_private;
 	struct etnaviv_vram_mapping *mapping, *tmp;
 
 	/* object should not be active */
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
index 3524b5811682..5bf4d1ee977f 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
@@ -22,7 +22,7 @@ struct sg_table *etnaviv_gem_prime_get_sg_table(struct drm_gem_object *obj)
 	if (WARN_ON(!etnaviv_obj->pages))  /* should have already pinned! */
 		return ERR_PTR(-EINVAL);
 
-	return drm_prime_pages_to_sg(obj->dev, etnaviv_obj->pages, npages);
+	return drm_prime_pages_to_sg(obj->drm, etnaviv_obj->pages, npages);
 }
 
 int etnaviv_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index 638ca96830e9..8ab968881110 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -24,7 +24,7 @@ static int exynos_drm_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct
 
 static int exynos_drm_alloc_buf(struct exynos_drm_gem *exynos_gem, bool kvmap)
 {
-	struct drm_device *dev = exynos_gem->base.dev;
+	struct drm_device *dev = exynos_gem->base.drm;
 	unsigned long attr = 0;
 
 	if (exynos_gem->dma_addr) {
@@ -71,7 +71,7 @@ static int exynos_drm_alloc_buf(struct exynos_drm_gem *exynos_gem, bool kvmap)
 
 static void exynos_drm_free_buf(struct exynos_drm_gem *exynos_gem)
 {
-	struct drm_device *dev = exynos_gem->base.dev;
+	struct drm_device *dev = exynos_gem->base.drm;
 
 	if (!exynos_gem->dma_addr) {
 		DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr is invalid.\n");
@@ -100,7 +100,8 @@ static int exynos_drm_gem_handle_create(struct drm_gem_object *obj,
 	if (ret)
 		return ret;
 
-	DRM_DEV_DEBUG_KMS(to_dma_dev(obj->dev), "gem handle = 0x%x\n", *handle);
+	DRM_DEV_DEBUG_KMS(to_dma_dev(obj->drm), "gem handle = 0x%x\n",
+			  *handle);
 
 	/* drop reference from allocate - handle holds it now. */
 	drm_gem_object_put(obj);
@@ -112,7 +113,7 @@ void exynos_drm_gem_destroy(struct exynos_drm_gem *exynos_gem)
 {
 	struct drm_gem_object *obj = &exynos_gem->base;
 
-	DRM_DEV_DEBUG_KMS(to_dma_dev(obj->dev), "handle count = %d\n",
+	DRM_DEV_DEBUG_KMS(to_dma_dev(obj->drm), "handle count = %d\n",
 			  obj->handle_count);
 
 	/*
@@ -270,7 +271,7 @@ struct exynos_drm_gem *exynos_drm_gem_get(struct drm_file *filp,
 static int exynos_drm_gem_mmap_buffer(struct exynos_drm_gem *exynos_gem,
 				      struct vm_area_struct *vma)
 {
-	struct drm_device *drm_dev = exynos_gem->base.dev;
+	struct drm_device *drm_dev = exynos_gem->base.drm;
 	unsigned long vm_size;
 	int ret;
 
@@ -370,7 +371,7 @@ static int exynos_drm_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct
 
 	vm_flags_set(vma, VM_IO | VM_DONTEXPAND | VM_DONTDUMP);
 
-	DRM_DEV_DEBUG_KMS(to_dma_dev(obj->dev), "flags = 0x%x\n",
+	DRM_DEV_DEBUG_KMS(to_dma_dev(obj->drm), "flags = 0x%x\n",
 			  exynos_gem->flags);
 
 	/* non-cachable as default. */
@@ -405,7 +406,7 @@ struct drm_gem_object *exynos_drm_gem_prime_import(struct drm_device *dev,
 struct sg_table *exynos_drm_gem_prime_get_sg_table(struct drm_gem_object *obj)
 {
 	struct exynos_drm_gem *exynos_gem = to_exynos_gem(obj);
-	struct drm_device *drm_dev = obj->dev;
+	struct drm_device *drm_dev = obj->drm;
 	struct sg_table *sgt;
 	int ret;
 
diff --git a/drivers/gpu/drm/gma500/gem.c b/drivers/gpu/drm/gma500/gem.c
index 4b7627a72637..70d74ae54d56 100644
--- a/drivers/gpu/drm/gma500/gem.c
+++ b/drivers/gpu/drm/gma500/gem.c
@@ -28,7 +28,7 @@
 int psb_gem_pin(struct psb_gem_object *pobj)
 {
 	struct drm_gem_object *obj = &pobj->base;
-	struct drm_device *dev = obj->dev;
+	struct drm_device *dev = obj->drm;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	u32 gpu_base = dev_priv->gtt.gatt_start;
 	struct page **pages;
@@ -73,7 +73,7 @@ int psb_gem_pin(struct psb_gem_object *pobj)
 void psb_gem_unpin(struct psb_gem_object *pobj)
 {
 	struct drm_gem_object *obj = &pobj->base;
-	struct drm_device *dev = obj->dev;
+	struct drm_device *dev = obj->drm;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	u32 gpu_base = dev_priv->gtt.gatt_start;
 	unsigned long npages;
@@ -264,7 +264,7 @@ static vm_fault_t psb_gem_fault(struct vm_fault *vmf)
 	struct drm_psb_private *dev_priv;
 
 	obj = vma->vm_private_data;	/* GEM object */
-	dev = obj->dev;
+	dev = obj->drm;
 	dev_priv = to_drm_psb_private(dev);
 
 	pobj = to_psb_gem_object(obj);
diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c b/drivers/gpu/drm/i915/display/intel_dpt.c
index b70dd87ab7fb..6122d2fd2115 100644
--- a/drivers/gpu/drm/i915/display/intel_dpt.c
+++ b/drivers/gpu/drm/i915/display/intel_dpt.c
@@ -242,7 +242,7 @@ struct i915_address_space *
 intel_dpt_create(struct intel_framebuffer *fb)
 {
 	struct drm_gem_object *obj = &intel_fb_obj(&fb->base)->base;
-	struct drm_i915_private *i915 = to_i915(obj->dev);
+	struct drm_i915_private *i915 = to_i915(obj->drm);
 	struct drm_i915_gem_object *dpt_obj;
 	struct i915_address_space *vm;
 	struct i915_dpt *dpt;
diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 4109c894abd3..e870a46ce12a 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -1885,7 +1885,7 @@ static int intel_user_framebuffer_create_handle(struct drm_framebuffer *fb,
 						unsigned int *handle)
 {
 	struct drm_i915_gem_object *obj = intel_fb_obj(fb);
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 
 	if (i915_gem_object_is_userptr(obj)) {
 		drm_dbg(&i915->drm,
@@ -1920,7 +1920,7 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 			   struct drm_i915_gem_object *obj,
 			   struct drm_mode_fb_cmd2 *mode_cmd)
 {
-	struct drm_i915_private *dev_priv = to_i915(obj->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(obj->base.drm);
 	struct drm_framebuffer *fb = &intel_fb->base;
 	u32 max_stride;
 	unsigned int tiling, stride;
@@ -2089,7 +2089,7 @@ intel_user_framebuffer_create(struct drm_device *dev,
 		return ERR_PTR(-ENOENT);
 
 	/* object is backed with LMEM for discrete */
-	i915 = to_i915(obj->base.dev);
+	i915 = to_i915(obj->base.drm);
 	if (HAS_LMEM(i915) && !i915_gem_object_can_migrate(obj, INTEL_REGION_LMEM_0)) {
 		/* object is "remote", not in local memory */
 		i915_gem_object_put(obj);
diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.c b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
index 17a7aa8b28c2..40d4a1e70c96 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.c
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
@@ -167,7 +167,7 @@ void __intel_fb_invalidate(struct intel_frontbuffer *front,
 			   enum fb_op_origin origin,
 			   unsigned int frontbuffer_bits)
 {
-	struct drm_i915_private *i915 = to_i915(front->obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(front->obj->base.drm);
 
 	if (origin == ORIGIN_CS) {
 		spin_lock(&i915->display.fb_tracking.lock);
@@ -188,7 +188,7 @@ void __intel_fb_flush(struct intel_frontbuffer *front,
 		      enum fb_op_origin origin,
 		      unsigned int frontbuffer_bits)
 {
-	struct drm_i915_private *i915 = to_i915(front->obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(front->obj->base.drm);
 
 	if (origin == ORIGIN_CS) {
 		spin_lock(&i915->display.fb_tracking.lock);
@@ -221,14 +221,14 @@ static void frontbuffer_retire(struct i915_active *ref)
 }
 
 static void frontbuffer_release(struct kref *ref)
-	__releases(&to_i915(front->obj->base.dev)->display.fb_tracking.lock)
+	__releases(&to_i915(front->obj->base.drm)->display.fb_tracking.lock)
 {
 	struct intel_frontbuffer *front =
 		container_of(ref, typeof(*front), ref);
 	struct drm_i915_gem_object *obj = front->obj;
 	struct i915_vma *vma;
 
-	drm_WARN_ON(obj->base.dev, atomic_read(&front->bits));
+	drm_WARN_ON(obj->base.drm, atomic_read(&front->bits));
 
 	spin_lock(&obj->vma.lock);
 	for_each_ggtt_vma(vma, obj) {
@@ -238,7 +238,7 @@ static void frontbuffer_release(struct kref *ref)
 	spin_unlock(&obj->vma.lock);
 
 	RCU_INIT_POINTER(obj->frontbuffer, NULL);
-	spin_unlock(&to_i915(obj->base.dev)->display.fb_tracking.lock);
+	spin_unlock(&to_i915(obj->base.drm)->display.fb_tracking.lock);
 
 	i915_active_fini(&front->write);
 
@@ -249,7 +249,7 @@ static void frontbuffer_release(struct kref *ref)
 struct intel_frontbuffer *
 intel_frontbuffer_get(struct drm_i915_gem_object *obj)
 {
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 	struct intel_frontbuffer *front;
 
 	front = __intel_frontbuffer_get(obj);
@@ -286,7 +286,7 @@ void intel_frontbuffer_put(struct intel_frontbuffer *front)
 {
 	kref_put_lock(&front->ref,
 		      frontbuffer_release,
-		      &to_i915(front->obj->base.dev)->display.fb_tracking.lock);
+		      &to_i915(front->obj->base.drm)->display.fb_tracking.lock);
 }
 
 /**
@@ -315,13 +315,13 @@ void intel_frontbuffer_track(struct intel_frontbuffer *old,
 	BUILD_BUG_ON(I915_MAX_PLANES > INTEL_FRONTBUFFER_BITS_PER_PIPE);
 
 	if (old) {
-		drm_WARN_ON(old->obj->base.dev,
+		drm_WARN_ON(old->obj->base.drm,
 			    !(atomic_read(&old->bits) & frontbuffer_bits));
 		atomic_andnot(frontbuffer_bits, &old->bits);
 	}
 
 	if (new) {
-		drm_WARN_ON(new->obj->base.dev,
+		drm_WARN_ON(new->obj->base.drm,
 			    atomic_read(&new->bits) & frontbuffer_bits);
 		atomic_or(frontbuffer_bits, &new->bits);
 	}
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index e4a398224b91..5c02b9b805e2 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -1855,7 +1855,7 @@ static bool skl_fb_scalable(const struct drm_framebuffer *fb)
 
 static bool bo_has_valid_encryption(struct drm_i915_gem_object *obj)
 {
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 
 	return intel_pxp_key_check(i915->pxp, obj, false) == 0;
 }
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
index 385ffc575b48..9086f474c386 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
@@ -72,7 +72,7 @@ static struct clflush *clflush_work_create(struct drm_i915_gem_object *obj)
 bool i915_gem_clflush_object(struct drm_i915_gem_object *obj,
 			     unsigned int flags)
 {
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 	struct clflush *clflush;
 
 	assert_object_held(obj);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index 1df74f7aa3dc..e1b4fe3ca5f1 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -94,7 +94,7 @@ static void i915_gem_dmabuf_vunmap(struct dma_buf *dma_buf,
 static int i915_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *vma)
 {
 	struct drm_i915_gem_object *obj = dma_buf_to_obj(dma_buf);
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 	int ret;
 
 	if (obj->base.size < vma->vm_end - vma->vm_start)
@@ -231,12 +231,12 @@ struct dma_buf *i915_gem_prime_export(struct drm_gem_object *gem_obj, int flags)
 			return ERR_PTR(ret);
 	}
 
-	return drm_gem_dmabuf_export(gem_obj->dev, &exp_info);
+	return drm_gem_dmabuf_export(gem_obj->drm, &exp_info);
 }
 
 static int i915_gem_object_get_pages_dmabuf(struct drm_i915_gem_object *obj)
 {
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 	struct sg_table *sgt;
 
 	assert_object_held(obj);
@@ -291,7 +291,7 @@ struct drm_gem_object *i915_gem_prime_import(struct drm_device *dev,
 	if (dma_buf->ops == &i915_dmabuf_ops) {
 		obj = dma_buf_to_obj(dma_buf);
 		/* is it from our device? */
-		if (obj->base.dev == dev &&
+		if (obj->base.drm == dev &&
 		    !I915_SELFTEST_ONLY(force_different_devices)) {
 			/*
 			 * Importing dmabuf exported from out own gem increases
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
index dfaaa8b66ac3..167c0272865a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
@@ -22,7 +22,7 @@
 
 static bool gpu_write_needs_clflush(struct drm_i915_gem_object *obj)
 {
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 
 	if (IS_DGFX(i915))
 		return false;
@@ -40,7 +40,7 @@ static bool gpu_write_needs_clflush(struct drm_i915_gem_object *obj)
 
 bool i915_gem_cpu_write_needs_clflush(struct drm_i915_gem_object *obj)
 {
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 
 	if (obj->cache_dirty)
 		return false;
@@ -430,7 +430,7 @@ i915_gem_object_pin_to_display_plane(struct drm_i915_gem_object *obj,
 				     const struct i915_gtt_view *view,
 				     unsigned int flags)
 {
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 	struct i915_vma *vma;
 	int ret;
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_internal.c b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
index 6bc26b4b06b8..28e5e6f74c8e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_internal.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
@@ -32,7 +32,7 @@ static void internal_free_pages(struct sg_table *st)
 
 static int i915_gem_object_get_pages_internal(struct drm_i915_gem_object *obj)
 {
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 	struct sg_table *st;
 	struct scatterlist *sg;
 	unsigned int npages; /* restricted by sg_alloc_table */
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index 4e7a838ab7bd..89ef6b44aa03 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -295,7 +295,7 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
 	struct vm_area_struct *area = vmf->vma;
 	struct i915_mmap_offset *mmo = area->vm_private_data;
 	struct drm_i915_gem_object *obj = mmo->obj;
-	struct drm_device *dev = obj->base.dev;
+	struct drm_device *dev = obj->base.drm;
 	struct drm_i915_private *i915 = to_i915(dev);
 	struct intel_runtime_pm *rpm = &i915->runtime_pm;
 	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
@@ -524,7 +524,7 @@ void __i915_gem_object_release_mmap_gtt(struct drm_i915_gem_object *obj)
  */
 void i915_gem_object_release_mmap_gtt(struct drm_i915_gem_object *obj)
 {
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 	intel_wakeref_t wakeref;
 
 	/*
@@ -594,7 +594,7 @@ void i915_gem_object_release_mmap_offset(struct drm_i915_gem_object *obj)
 
 		spin_unlock(&obj->mmo.lock);
 		drm_vma_node_unmap(&mmo->vma_node,
-				   obj->base.dev->anon_inode->i_mapping);
+				   obj->base.drm->anon_inode->i_mapping);
 		spin_lock(&obj->mmo.lock);
 	}
 	spin_unlock(&obj->mmo.lock);
@@ -643,7 +643,7 @@ insert_mmo(struct drm_i915_gem_object *obj, struct i915_mmap_offset *mmo)
 
 		if (pos->mmap_type == mmo->mmap_type) {
 			spin_unlock(&obj->mmo.lock);
-			drm_vma_offset_remove(obj->base.dev->vma_offset_manager,
+			drm_vma_offset_remove(obj->base.drm->vma_offset_manager,
 					      &mmo->vma_node);
 			kfree(mmo);
 			return pos;
@@ -666,7 +666,7 @@ mmap_offset_attach(struct drm_i915_gem_object *obj,
 		   enum i915_mmap_type mmap_type,
 		   struct drm_file *file)
 {
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 	struct i915_mmap_offset *mmo;
 	int err;
 
@@ -684,7 +684,7 @@ mmap_offset_attach(struct drm_i915_gem_object *obj,
 	mmo->mmap_type = mmap_type;
 	drm_vma_node_reset(&mmo->vma_node);
 
-	err = drm_vma_offset_add(obj->base.dev->vma_offset_manager,
+	err = drm_vma_offset_add(obj->base.drm->vma_offset_manager,
 				 &mmo->vma_node, obj->base.size / PAGE_SIZE);
 	if (likely(!err))
 		goto insert;
@@ -696,7 +696,7 @@ mmap_offset_attach(struct drm_i915_gem_object *obj,
 		goto err;
 
 	i915_gem_drain_freed_objects(i915);
-	err = drm_vma_offset_add(obj->base.dev->vma_offset_manager,
+	err = drm_vma_offset_add(obj->base.drm->vma_offset_manager,
 				 &mmo->vma_node, obj->base.size / PAGE_SIZE);
 	if (err)
 		goto err;
@@ -941,7 +941,7 @@ i915_gem_object_mmap(struct drm_i915_gem_object *obj,
 		     struct i915_mmap_offset *mmo,
 		     struct vm_area_struct *vma)
 {
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 	struct drm_device *dev = &i915->drm;
 	struct file *anon;
 
@@ -1065,7 +1065,7 @@ int i915_gem_mmap(struct file *filp, struct vm_area_struct *vma)
 
 int i915_gem_fb_mmap(struct drm_i915_gem_object *obj, struct vm_area_struct *vma)
 {
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 	struct drm_device *dev = &i915->drm;
 	struct i915_mmap_offset *mmo = NULL;
 	enum i915_mmap_type mmap_type;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 97ac6fb37958..8364fcf66a13 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -149,7 +149,7 @@ void __i915_gem_object_fini(struct drm_i915_gem_object *obj)
 void i915_gem_object_set_cache_coherency(struct drm_i915_gem_object *obj,
 					 unsigned int cache_level)
 {
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 
 	obj->pat_index = i915_gem_get_pat_index(i915, cache_level);
 
@@ -177,7 +177,7 @@ void i915_gem_object_set_cache_coherency(struct drm_i915_gem_object *obj,
 void i915_gem_object_set_pat_index(struct drm_i915_gem_object *obj,
 				   unsigned int pat_index)
 {
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 
 	if (obj->pat_index == pat_index)
 		return;
@@ -199,7 +199,7 @@ void i915_gem_object_set_pat_index(struct drm_i915_gem_object *obj,
 
 bool i915_gem_object_can_bypass_llc(struct drm_i915_gem_object *obj)
 {
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 
 	/*
 	 * This is purely from a security perspective, so we simply don't care
@@ -290,7 +290,7 @@ void __i915_gem_free_object_rcu(struct rcu_head *head)
 {
 	struct drm_i915_gem_object *obj =
 		container_of(head, typeof(*obj), rcu);
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 
 	i915_gem_object_free(obj);
 
@@ -302,7 +302,7 @@ static void __i915_gem_object_free_mmaps(struct drm_i915_gem_object *obj)
 {
 	/* Skip serialisation and waking the device if known to be not used. */
 
-	if (obj->userfault_count && !IS_DGFX(to_i915(obj->base.dev)))
+	if (obj->userfault_count && !IS_DGFX(to_i915(obj->base.drm)))
 		i915_gem_object_release_mmap_gtt(obj);
 
 	if (!RB_EMPTY_ROOT(&obj->mmo.offsets)) {
@@ -313,7 +313,7 @@ static void __i915_gem_object_free_mmaps(struct drm_i915_gem_object *obj)
 		rbtree_postorder_for_each_entry_safe(mmo, mn,
 						     &obj->mmo.offsets,
 						     offset) {
-			drm_vma_offset_remove(obj->base.dev->vma_offset_manager,
+			drm_vma_offset_remove(obj->base.drm->vma_offset_manager,
 					      &mmo->vma_node);
 			kfree(mmo);
 		}
@@ -437,7 +437,7 @@ static void __i915_gem_free_work(struct work_struct *work)
 static void i915_gem_free_object(struct drm_gem_object *gem_obj)
 {
 	struct drm_i915_gem_object *obj = to_intel_bo(gem_obj);
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 
 	GEM_BUG_ON(i915_gem_object_is_framebuffer(obj));
 
@@ -528,7 +528,7 @@ static bool object_has_mappable_iomem(struct drm_i915_gem_object *obj)
 {
 	GEM_BUG_ON(!i915_gem_object_has_iomem(obj));
 
-	if (IS_DGFX(to_i915(obj->base.dev)))
+	if (IS_DGFX(to_i915(obj->base.drm)))
 		return i915_ttm_resource_mappable(i915_gem_to_ttm(obj)->resource);
 
 	return true;
@@ -631,7 +631,7 @@ bool i915_gem_object_migratable(struct drm_i915_gem_object *obj)
 bool i915_gem_object_has_struct_page(const struct drm_i915_gem_object *obj)
 {
 #ifdef CONFIG_LOCKDEP
-	if (IS_DGFX(to_i915(obj->base.dev)) &&
+	if (IS_DGFX(to_i915(obj->base.drm)) &&
 	    i915_gem_object_evictable((void __force *)obj))
 		assert_object_held_shared(obj);
 #endif
@@ -650,7 +650,7 @@ bool i915_gem_object_has_struct_page(const struct drm_i915_gem_object *obj)
 bool i915_gem_object_has_iomem(const struct drm_i915_gem_object *obj)
 {
 #ifdef CONFIG_LOCKDEP
-	if (IS_DGFX(to_i915(obj->base.dev)) &&
+	if (IS_DGFX(to_i915(obj->base.drm)) &&
 	    i915_gem_object_evictable((void __force *)obj))
 		assert_object_held_shared(obj);
 #endif
@@ -677,7 +677,7 @@ bool i915_gem_object_has_iomem(const struct drm_i915_gem_object *obj)
 bool i915_gem_object_can_migrate(struct drm_i915_gem_object *obj,
 				 enum intel_region_id id)
 {
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 	unsigned int num_allowed = obj->mm.n_placements;
 	struct intel_memory_region *mr;
 	unsigned int i;
@@ -779,7 +779,7 @@ int __i915_gem_object_migrate(struct drm_i915_gem_object *obj,
 			      enum intel_region_id id,
 			      unsigned int flags)
 {
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 	struct intel_memory_region *mr;
 
 	GEM_BUG_ON(id >= INTEL_REGION_UNKNOWN);
@@ -849,7 +849,7 @@ bool i915_gem_object_needs_ccs_pages(struct drm_i915_gem_object *obj)
 	bool lmem_placement = false;
 	int i;
 
-	if (!HAS_FLAT_CCS(to_i915(obj->base.dev)))
+	if (!HAS_FLAT_CCS(to_i915(obj->base.drm)))
 		return false;
 
 	if (obj->flags & I915_BO_ALLOC_CCS_AUX)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 884a17275b3a..1ee051c25205 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -20,7 +20,7 @@
 
 enum intel_region_id;
 
-#define obj_to_i915(obj__) to_i915((obj__)->base.dev)
+#define obj_to_i915(obj__) to_i915((obj__)->base.drm)
 
 static inline bool i915_gem_object_size_2big(u64 size)
 {
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
index 89fc8ea6bcfc..8ea50a3933f3 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -18,7 +18,7 @@
 void __i915_gem_object_set_pages(struct drm_i915_gem_object *obj,
 				 struct sg_table *pages)
 {
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 	unsigned long supported = RUNTIME_INFO(i915)->page_sizes;
 	bool shrinkable;
 	int i;
@@ -96,7 +96,7 @@ void __i915_gem_object_set_pages(struct drm_i915_gem_object *obj,
 
 int ____i915_gem_object_get_pages(struct drm_i915_gem_object *obj)
 {
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 	int err;
 
 	assert_object_held_shared(obj);
@@ -192,7 +192,7 @@ static void unmap_object(struct drm_i915_gem_object *obj, void *ptr)
 
 static void flush_tlb_invalidate(struct drm_i915_gem_object *obj)
 {
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 	struct intel_gt *gt = to_gt(i915);
 
 	if (!obj->mm.tlb)
@@ -411,7 +411,7 @@ void *i915_gem_object_pin_map(struct drm_i915_gem_object *obj,
 		}
 
 		type = I915_MAP_WC;
-	} else if (IS_DGFX(to_i915(obj->base.dev))) {
+	} else if (IS_DGFX(to_i915(obj->base.drm))) {
 		type = I915_MAP_WB;
 	}
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_phys.c b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
index 76efe98eaa14..e93af6786995 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_phys.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
@@ -20,7 +20,7 @@
 static int i915_gem_object_get_pages_phys(struct drm_i915_gem_object *obj)
 {
 	struct address_space *mapping = obj->base.filp->f_mapping;
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 	struct scatterlist *sg;
 	struct sg_table *st;
 	dma_addr_t dma;
@@ -40,7 +40,7 @@ static int i915_gem_object_get_pages_phys(struct drm_i915_gem_object *obj)
 	 * to handle all possible callers, and given typical object sizes,
 	 * the alignment of the buddy allocation will naturally match.
 	 */
-	vaddr = dma_alloc_coherent(obj->base.dev->dev,
+	vaddr = dma_alloc_coherent(obj->base.drm->dev,
 				   roundup_pow_of_two(obj->base.size),
 				   &dma, GFP_KERNEL);
 	if (!vaddr)
@@ -90,7 +90,7 @@ static int i915_gem_object_get_pages_phys(struct drm_i915_gem_object *obj)
 err_st:
 	kfree(st);
 err_pci:
-	dma_free_coherent(obj->base.dev->dev,
+	dma_free_coherent(obj->base.drm->dev,
 			  roundup_pow_of_two(obj->base.size),
 			  vaddr, dma);
 	return -ENOMEM;
@@ -136,7 +136,7 @@ i915_gem_object_put_pages_phys(struct drm_i915_gem_object *obj,
 	sg_free_table(pages);
 	kfree(pages);
 
-	dma_free_coherent(obj->base.dev->dev,
+	dma_free_coherent(obj->base.drm->dev,
 			  roundup_pow_of_two(obj->base.size),
 			  vaddr, dma);
 }
@@ -146,7 +146,7 @@ int i915_gem_object_pwrite_phys(struct drm_i915_gem_object *obj,
 {
 	void *vaddr = sg_page(obj->mm.pages->sgl) + args->offset;
 	char __user *user_data = u64_to_user_ptr(args->data_ptr);
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 	int err;
 
 	err = i915_gem_object_wait(obj,
@@ -247,7 +247,7 @@ int i915_gem_object_attach_phys(struct drm_i915_gem_object *obj, int align)
 		return -EBUSY;
 
 	if (unlikely(obj->mm.madv != I915_MADV_WILLNEED)) {
-		drm_dbg(obj->base.dev,
+		drm_dbg(obj->base.drm,
 			"Attempting to obtain a purgeable object\n");
 		return -EFAULT;
 	}
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index 33d5d5178103..e127e271ca6f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -194,7 +194,7 @@ int shmem_sg_alloc_table(struct drm_i915_private *i915, struct sg_table *st,
 
 static int shmem_get_pages(struct drm_i915_gem_object *obj)
 {
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 	struct intel_memory_region *mem = obj->mm.region;
 	struct address_space *mapping = obj->base.filp->f_mapping;
 	unsigned int max_segment = i915_sg_segment_size(i915->drm.dev);
@@ -358,7 +358,7 @@ __i915_gem_object_release_shmem(struct drm_i915_gem_object *obj,
 				struct sg_table *pages,
 				bool needs_clflush)
 {
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 
 	GEM_BUG_ON(obj->mm.madv == __I915_MADV_PURGED);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index 3b094d36a0b0..b92faa05abda 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -621,9 +621,9 @@ i915_pages_create_for_stolen(struct drm_device *dev,
 
 static int i915_gem_object_get_pages_stolen(struct drm_i915_gem_object *obj)
 {
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 	struct sg_table *pages =
-		i915_pages_create_for_stolen(obj->base.dev,
+		i915_pages_create_for_stolen(obj->base.drm,
 					     obj->stolen->start,
 					     obj->stolen->size);
 	if (IS_ERR(pages))
@@ -642,7 +642,7 @@ static int i915_gem_object_get_pages_stolen(struct drm_i915_gem_object *obj)
 static void i915_gem_object_put_pages_stolen(struct drm_i915_gem_object *obj,
 					     struct sg_table *pages)
 {
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 	/* Should only be called from i915_gem_object_release_stolen() */
 
 	dbg_poison(to_gt(i915)->ggtt,
@@ -657,7 +657,7 @@ static void i915_gem_object_put_pages_stolen(struct drm_i915_gem_object *obj,
 static void
 i915_gem_object_release_stolen(struct drm_i915_gem_object *obj)
 {
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 	struct drm_mm_node *stolen = fetch_and_zero(&obj->stolen);
 
 	GEM_BUG_ON(!stolen);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_tiling.c b/drivers/gpu/drm/i915/gem/i915_gem_tiling.c
index a049ca0b7980..754080930d3e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_tiling.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_tiling.c
@@ -119,7 +119,7 @@ static bool
 i915_tiling_ok(struct drm_i915_gem_object *obj,
 	       unsigned int tiling, unsigned int stride)
 {
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 	unsigned int tile_width;
 
 	/* Linear is always fine */
@@ -183,7 +183,7 @@ static int
 i915_gem_object_fence_prepare(struct drm_i915_gem_object *obj,
 			      int tiling_mode, unsigned int stride)
 {
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
 	struct i915_vma *vma, *vn;
 	LIST_HEAD(unbind);
@@ -221,7 +221,7 @@ i915_gem_object_fence_prepare(struct drm_i915_gem_object *obj,
 
 bool i915_gem_object_needs_bit17_swizzle(struct drm_i915_gem_object *obj)
 {
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 
 	return to_gt(i915)->ggtt->bit_6_swizzle_x == I915_BIT_6_SWIZZLE_9_10_17 &&
 		i915_gem_object_is_tiled(obj);
@@ -231,7 +231,7 @@ int
 i915_gem_object_set_tiling(struct drm_i915_gem_object *obj,
 			   unsigned int tiling, unsigned int stride)
 {
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 	struct i915_vma *vma;
 	int err;
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 9227f8146a58..ad778c7c42e3 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -310,7 +310,7 @@ static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
 	__i915_refct_sgt_init(&i915_tt->cached_rsgt, bo->base.size,
 			      &tt_rsgt_ops);
 
-	i915_tt->dev = obj->base.dev->dev;
+	i915_tt->dev = obj->base.drm->dev;
 
 	return &i915_tt->ttm;
 
@@ -1042,7 +1042,7 @@ static vm_fault_t vm_fault_ttm(struct vm_fault *vmf)
 {
 	struct vm_area_struct *area = vmf->vma;
 	struct ttm_buffer_object *bo = area->vm_private_data;
-	struct drm_device *dev = bo->base.dev;
+	struct drm_device *dev = bo->base.drm;
 	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
 	intel_wakeref_t wakeref = 0;
 	vm_fault_t ret;
@@ -1110,7 +1110,7 @@ static vm_fault_t vm_fault_ttm(struct vm_fault *vmf)
 	}
 
 	if (i915_ttm_cpu_maps_iomem(bo->resource))
-		wakeref = intel_runtime_pm_get(&to_i915(obj->base.dev)->runtime_pm);
+		wakeref = intel_runtime_pm_get(&to_i915(obj->base.drm)->runtime_pm);
 
 	if (drm_dev_enter(dev, &idx)) {
 		ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
@@ -1129,15 +1129,15 @@ static vm_fault_t vm_fault_ttm(struct vm_fault *vmf)
 	 */
 	if (ret == VM_FAULT_NOPAGE && wakeref && !obj->userfault_count) {
 		obj->userfault_count = 1;
-		spin_lock(&to_i915(obj->base.dev)->runtime_pm.lmem_userfault_lock);
-		list_add(&obj->userfault_link, &to_i915(obj->base.dev)->runtime_pm.lmem_userfault_list);
-		spin_unlock(&to_i915(obj->base.dev)->runtime_pm.lmem_userfault_lock);
+		spin_lock(&to_i915(obj->base.drm)->runtime_pm.lmem_userfault_lock);
+		list_add(&obj->userfault_link, &to_i915(obj->base.drm)->runtime_pm.lmem_userfault_list);
+		spin_unlock(&to_i915(obj->base.drm)->runtime_pm.lmem_userfault_lock);
 
 		GEM_WARN_ON(!i915_ttm_cpu_maps_iomem(bo->resource));
 	}
 
 	if (wakeref & CONFIG_DRM_I915_USERFAULT_AUTOSUSPEND)
-		intel_wakeref_auto(&to_i915(obj->base.dev)->runtime_pm.userfault_wakeref,
+		intel_wakeref_auto(&to_i915(obj->base.drm)->runtime_pm.userfault_wakeref,
 				   msecs_to_jiffies_timeout(CONFIG_DRM_I915_USERFAULT_AUTOSUSPEND));
 
 	i915_ttm_adjust_lru(obj);
@@ -1146,7 +1146,7 @@ static vm_fault_t vm_fault_ttm(struct vm_fault *vmf)
 
 out_rpm:
 	if (wakeref)
-		intel_runtime_pm_put(&to_i915(obj->base.dev)->runtime_pm, wakeref);
+		intel_runtime_pm_put(&to_i915(obj->base.drm)->runtime_pm, wakeref);
 
 	return ret;
 }
@@ -1205,13 +1205,13 @@ static void i915_ttm_unmap_virtual(struct drm_i915_gem_object *obj)
 	assert_object_held_shared(obj);
 
 	if (i915_ttm_cpu_maps_iomem(bo->resource)) {
-		wakeref = intel_runtime_pm_get(&to_i915(obj->base.dev)->runtime_pm);
+		wakeref = intel_runtime_pm_get(&to_i915(obj->base.drm)->runtime_pm);
 
 		/* userfault_count is protected by obj lock and rpm wakeref. */
 		if (obj->userfault_count) {
-			spin_lock(&to_i915(obj->base.dev)->runtime_pm.lmem_userfault_lock);
+			spin_lock(&to_i915(obj->base.drm)->runtime_pm.lmem_userfault_lock);
 			list_del(&obj->userfault_link);
-			spin_unlock(&to_i915(obj->base.dev)->runtime_pm.lmem_userfault_lock);
+			spin_unlock(&to_i915(obj->base.drm)->runtime_pm.lmem_userfault_lock);
 			obj->userfault_count = 0;
 		}
 	}
@@ -1221,7 +1221,7 @@ static void i915_ttm_unmap_virtual(struct drm_i915_gem_object *obj)
 	ttm_bo_unmap_virtual(i915_gem_to_ttm(obj));
 
 	if (wakeref)
-		intel_runtime_pm_put(&to_i915(obj->base.dev)->runtime_pm, wakeref);
+		intel_runtime_pm_put(&to_i915(obj->base.drm)->runtime_pm, wakeref);
 }
 
 static const struct drm_i915_gem_object_ops i915_gem_ttm_obj_ops = {
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
index 7078af2f8f79..87d9987be741 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
@@ -121,7 +121,7 @@ void i915_ttm_adjust_gem_after_move(struct drm_i915_gem_object *obj)
 		mem_flags = i915_ttm_cpu_maps_iomem(bo->resource) ? I915_BO_FLAG_IOMEM :
 			I915_BO_FLAG_STRUCT_PAGE;
 		mem_type = bo->resource->mem_type;
-		cache_level = i915_ttm_cache_level(to_i915(bo->base.dev), bo->resource,
+		cache_level = i915_ttm_cache_level(to_i915(bo->base.drm), bo->resource,
 						   bo->ttm);
 	}
 
@@ -473,7 +473,7 @@ __i915_ttm_move(struct ttm_buffer_object *bo,
 {
 	const bool memcpy_allowed = i915_ttm_memcpy_allowed(bo, dst_mem);
 	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
-	struct drm_i915_private *i915 = to_i915(bo->base.dev);
+	struct drm_i915_private *i915 = to_i915(bo->base.drm);
 	struct i915_ttm_memcpy_work *copy_work = NULL;
 	struct i915_ttm_memcpy_arg _arg, *arg = &_arg;
 	struct dma_fence *fence = ERR_PTR(-EINVAL);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
index 1d3ebdf4069b..a0a313e75af9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
@@ -62,7 +62,7 @@ static bool i915_gem_userptr_invalidate(struct mmu_interval_notifier *mni,
 					unsigned long cur_seq)
 {
 	struct drm_i915_gem_object *obj = container_of(mni, struct drm_i915_gem_object, userptr.notifier);
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 	long r;
 
 	if (!mmu_notifier_range_blockable(range))
@@ -128,7 +128,7 @@ static void i915_gem_object_userptr_drop_ref(struct drm_i915_gem_object *obj)
 
 static int i915_gem_userptr_get_pages(struct drm_i915_gem_object *obj)
 {
-	unsigned int max_segment = i915_sg_segment_size(obj->base.dev->dev);
+	unsigned int max_segment = i915_sg_segment_size(obj->base.drm->dev);
 	struct sg_table *st;
 	struct page **pvec;
 	unsigned int num_pages; /* limited by sg_alloc_table_from_pages_segment */
@@ -386,7 +386,7 @@ i915_gem_userptr_release(struct drm_i915_gem_object *obj)
 static int
 i915_gem_userptr_dmabuf_export(struct drm_i915_gem_object *obj)
 {
-	drm_dbg(obj->base.dev, "Exporting userptr no longer allowed\n");
+	drm_dbg(obj->base.drm, "Exporting userptr no longer allowed\n");
 
 	return -EINVAL;
 }
@@ -395,7 +395,7 @@ static int
 i915_gem_userptr_pwrite(struct drm_i915_gem_object *obj,
 			const struct drm_i915_gem_pwrite *args)
 {
-	drm_dbg(obj->base.dev, "pwrite to userptr no longer allowed\n");
+	drm_dbg(obj->base.drm, "pwrite to userptr no longer allowed\n");
 
 	return -EINVAL;
 }
@@ -404,7 +404,7 @@ static int
 i915_gem_userptr_pread(struct drm_i915_gem_object *obj,
 		       const struct drm_i915_gem_pread *args)
 {
-	drm_dbg(obj->base.dev, "pread from userptr no longer allowed\n");
+	drm_dbg(obj->base.drm, "pread from userptr no longer allowed\n");
 
 	return -EINVAL;
 }
diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
index df6c9a84252c..90778bc07d67 100644
--- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
+++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
@@ -210,7 +210,7 @@ huge_pages_object(struct drm_i915_private *i915,
 
 static int fake_get_huge_pages(struct drm_i915_gem_object *obj)
 {
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 	const u64 max_len = rounddown_pow_of_two(UINT_MAX);
 	struct sg_table *st;
 	struct scatterlist *sg;
@@ -265,7 +265,7 @@ static int fake_get_huge_pages(struct drm_i915_gem_object *obj)
 
 static int fake_get_huge_pages_single(struct drm_i915_gem_object *obj)
 {
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 	struct sg_table *st;
 	struct scatterlist *sg;
 	unsigned int page_size;
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
index ff81af4c8202..ce58ec31da89 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
@@ -142,7 +142,7 @@ static int prepare_blit(const struct tiled_blits *t,
 			struct blit_buffer *src,
 			struct drm_i915_gem_object *batch)
 {
-	const int ver = GRAPHICS_VER(to_i915(batch->base.dev));
+	const int ver = GRAPHICS_VER(to_i915(batch->base.drm));
 	bool use_64b_reloc = ver >= 8;
 	u32 src_pitch, dst_pitch;
 	u32 cmd, *cs;
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
index 7021b6e9b219..4a3ad4c6f522 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
@@ -476,7 +476,7 @@ static int gpu_fill(struct intel_context *ce,
 
 static int cpu_fill(struct drm_i915_gem_object *obj, u32 value)
 {
-	const bool has_llc = HAS_LLC(to_i915(obj->base.dev));
+	const bool has_llc = HAS_LLC(to_i915(obj->base.drm));
 	unsigned int need_flush;
 	unsigned long n, m;
 	int err;
@@ -941,7 +941,7 @@ emit_rpcs_query(struct drm_i915_gem_object *obj,
 		struct intel_context *ce,
 		struct i915_request **rq_out)
 {
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 	struct i915_request *rq;
 	struct i915_gem_ww_ctx ww;
 	struct i915_vma *batch;
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
index e57f9390076c..84db924e560e 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
@@ -284,7 +284,7 @@ static int igt_dmabuf_import_same_driver(struct drm_i915_private *i915,
 		goto out_import;
 
 	/* Now try a fake an importer */
-	import_attach = dma_buf_attach(dmabuf, obj->base.dev->dev);
+	import_attach = dma_buf_attach(dmabuf, obj->base.drm->dev);
 	if (IS_ERR(import_attach)) {
 		err = PTR_ERR(import_attach);
 		goto out_import;
@@ -360,7 +360,7 @@ static int igt_dmabuf_import(void *arg)
 		goto out_dmabuf;
 	}
 
-	if (obj->base.dev != &i915->drm) {
+	if (obj->base.drm != &i915->drm) {
 		pr_err("i915_gem_prime_import created a non-i915 object!\n");
 		err = -EINVAL;
 		goto out_obj;
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
index a93a90b15907..97e73c1c21f2 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
@@ -15,7 +15,7 @@
 static int igt_fill_check_buffer(struct drm_i915_gem_object *obj,
 				 bool fill)
 {
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 	unsigned int i, count = obj->base.size / sizeof(u32);
 	enum i915_map_type map_type =
 		i915_coherent_map_type(i915, obj, false);
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
index a93d8f9f8bc1..2641a532fd84 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
@@ -94,7 +94,7 @@ static int check_partial_mapping(struct drm_i915_gem_object *obj,
 				 struct rnd_state *prng)
 {
 	const unsigned long npages = obj->base.size / PAGE_SIZE;
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 	struct i915_gtt_view view;
 	struct i915_vma *vma;
 	unsigned long offset;
@@ -188,7 +188,7 @@ static int check_partial_mappings(struct drm_i915_gem_object *obj,
 {
 	const unsigned int nreal = obj->scratch / PAGE_SIZE;
 	const unsigned long npages = obj->base.size / PAGE_SIZE;
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 	struct i915_vma *vma;
 	unsigned long page;
 	int err;
@@ -539,7 +539,7 @@ static int igt_smoke_tiling(void *arg)
 
 static int make_obj_busy(struct drm_i915_gem_object *obj)
 {
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 	struct intel_engine_cs *engine;
 
 	for_each_uabi_engine(engine, i915) {
@@ -868,7 +868,7 @@ static int wc_check(struct drm_i915_gem_object *obj)
 
 static bool can_mmap(struct drm_i915_gem_object *obj, enum i915_mmap_type type)
 {
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 	bool no_map;
 
 	if (obj->ops->mmap_offset)
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
index 37d0b0fe791d..78f11da72393 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
@@ -818,7 +818,7 @@ i915_gem_object_save_bit_17_swizzle(struct drm_i915_gem_object *obj,
 	if (obj->bit_17 == NULL) {
 		obj->bit_17 = bitmap_zalloc(page_count, GFP_KERNEL);
 		if (obj->bit_17 == NULL) {
-			drm_err(&to_i915(obj->base.dev)->drm,
+			drm_err(&to_i915(obj->base.drm)->drm,
 				"Failed to allocate memory for bit 17 record\n");
 			return;
 		}
diff --git a/drivers/gpu/drm/i915/gt/shmem_utils.c b/drivers/gpu/drm/i915/gt/shmem_utils.c
index 449c9ed44382..e0522222e0be 100644
--- a/drivers/gpu/drm/i915/gt/shmem_utils.c
+++ b/drivers/gpu/drm/i915/gt/shmem_utils.c
@@ -33,7 +33,7 @@ struct file *shmem_create_from_data(const char *name, void *data, size_t len)
 
 struct file *shmem_create_from_object(struct drm_i915_gem_object *obj)
 {
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 	enum i915_map_type map_type;
 	struct file *file;
 	void *ptr;
diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.c b/drivers/gpu/drm/i915/gvt/dmabuf.c
index 6834f9fe40cf..c6fb1a0366dc 100644
--- a/drivers/gpu/drm/i915/gvt/dmabuf.c
+++ b/drivers/gpu/drm/i915/gvt/dmabuf.c
@@ -44,7 +44,7 @@
 
 static int vgpu_gem_get_pages(struct drm_i915_gem_object *obj)
 {
-	struct drm_i915_private *dev_priv = to_i915(obj->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(obj->base.drm);
 	struct intel_vgpu *vgpu;
 	struct sg_table *st;
 	struct scatterlist *sg;
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 1f65bb33dd21..bf7c85874110 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -117,7 +117,7 @@ i915_gem_get_aperture_ioctl(struct drm_device *dev, void *data,
 int i915_gem_object_unbind(struct drm_i915_gem_object *obj,
 			   unsigned long flags)
 {
-	struct intel_runtime_pm *rpm = &to_i915(obj->base.dev)->runtime_pm;
+	struct intel_runtime_pm *rpm = &to_i915(obj->base.drm)->runtime_pm;
 	bool vm_trylock = !!(flags & I915_GEM_OBJECT_UNBIND_VM_TRYLOCK);
 	LIST_HEAD(still_in_list);
 	intel_wakeref_t wakeref;
@@ -305,7 +305,7 @@ static struct i915_vma *i915_gem_gtt_prepare(struct drm_i915_gem_object *obj,
 					     struct drm_mm_node *node,
 					     bool write)
 {
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
 	struct i915_vma *vma;
 	struct i915_gem_ww_ctx ww;
@@ -366,7 +366,7 @@ static void i915_gem_gtt_cleanup(struct drm_i915_gem_object *obj,
 				 struct drm_mm_node *node,
 				 struct i915_vma *vma)
 {
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
 
 	i915_gem_object_unpin_pages(obj);
@@ -382,7 +382,7 @@ static int
 i915_gem_gtt_pread(struct drm_i915_gem_object *obj,
 		   const struct drm_i915_gem_pread *args)
 {
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
 	unsigned long remain, offset;
 	intel_wakeref_t wakeref;
@@ -545,7 +545,7 @@ static int
 i915_gem_gtt_pwrite_fast(struct drm_i915_gem_object *obj,
 			 const struct drm_i915_gem_pwrite *args)
 {
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
 	struct intel_runtime_pm *rpm = &i915->runtime_pm;
 	unsigned long remain, offset;
@@ -908,7 +908,7 @@ i915_gem_object_ggtt_pin_ww(struct drm_i915_gem_object *obj,
 			    const struct i915_gtt_view *view,
 			    u64 size, u64 alignment, u64 flags)
 {
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
 	struct i915_vma *vma;
 	int ret;
diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.c b/drivers/gpu/drm/i915/i915_gem_gtt.c
index 7bd1861ddbdf..d1891306fa28 100644
--- a/drivers/gpu/drm/i915/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/i915_gem_gtt.c
@@ -29,7 +29,7 @@ int i915_gem_gtt_prepare_pages(struct drm_i915_gem_object *obj,
 			       struct sg_table *pages)
 {
 	do {
-		if (dma_map_sg_attrs(obj->base.dev->dev,
+		if (dma_map_sg_attrs(obj->base.drm->dev,
 				     pages->sgl, pages->nents,
 				     DMA_BIDIRECTIONAL,
 				     DMA_ATTR_SKIP_CPU_SYNC |
@@ -45,7 +45,7 @@ int i915_gem_gtt_prepare_pages(struct drm_i915_gem_object *obj,
 		 * the DMA remapper, i915_gem_shrink will return 0.
 		 */
 		GEM_BUG_ON(obj->mm.pages == pages);
-	} while (i915_gem_shrink(NULL, to_i915(obj->base.dev),
+	} while (i915_gem_shrink(NULL, to_i915(obj->base.drm),
 				 obj->base.size >> PAGE_SHIFT, NULL,
 				 I915_SHRINK_BOUND |
 				 I915_SHRINK_UNBOUND));
@@ -56,7 +56,7 @@ int i915_gem_gtt_prepare_pages(struct drm_i915_gem_object *obj,
 void i915_gem_gtt_finish_pages(struct drm_i915_gem_object *obj,
 			       struct sg_table *pages)
 {
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
 
 	/* XXX This does not prevent more requests being submitted! */
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index ffb425ba591c..1acff7929fd2 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -74,14 +74,14 @@ static void vma_print_allocator(struct i915_vma *vma, const char *reason)
 	char buf[512];
 
 	if (!vma->node.stack) {
-		drm_dbg(&to_i915(vma->obj->base.dev)->drm,
+		drm_dbg(&to_i915(vma->obj->base.drm)->drm,
 			"vma.node [%08llx + %08llx] %s: unknown owner\n",
 			vma->node.start, vma->node.size, reason);
 		return;
 	}
 
 	stack_depot_snprint(vma->node.stack, buf, sizeof(buf), 0);
-	drm_dbg(&to_i915(vma->obj->base.dev)->drm,
+	drm_dbg(&to_i915(vma->obj->base.drm)->drm,
 		"vma.node [%08llx + %08llx] %s: inserted at %s\n",
 		vma->node.start, vma->node.size, reason, buf);
 }
@@ -805,7 +805,7 @@ i915_vma_insert(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 	 * attempt to find space.
 	 */
 	if (size > end - 2 * guard) {
-		drm_dbg(&to_i915(vma->obj->base.dev)->drm,
+		drm_dbg(&to_i915(vma->obj->base.drm)->drm,
 			"Attempting to bind an object larger than the aperture: request=%llu > %s aperture=%llu\n",
 			size, flags & PIN_MAPPABLE ? "mappable" : "total", end);
 		return -ENOSPC;
@@ -985,7 +985,7 @@ intel_rotate_pages(struct intel_rotation_info *rot_info,
 		   struct drm_i915_gem_object *obj)
 {
 	unsigned int size = intel_rotation_info_size(rot_info);
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 	struct sg_table *st;
 	struct scatterlist *sg;
 	int ret = -ENOMEM;
@@ -1194,7 +1194,7 @@ intel_remap_pages(struct intel_remapped_info *rem_info,
 		  struct drm_i915_gem_object *obj)
 {
 	unsigned int size = intel_remapped_info_size(rem_info);
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.drm);
 	struct sg_table *st;
 	struct scatterlist *sg;
 	unsigned int gtt_offset = 0;
diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
index 4f9736e5f929..280311199263 100644
--- a/drivers/gpu/drm/lima/lima_gem.c
+++ b/drivers/gpu/drm/lima/lima_gem.c
@@ -22,7 +22,7 @@ int lima_heap_alloc(struct lima_bo *bo, struct lima_vm *vm)
 {
 	struct page **pages;
 	struct address_space *mapping = bo->base.base.filp->f_mapping;
-	struct device *dev = bo->base.base.dev->dev;
+	struct device *dev = bo->base.base.drm->dev;
 	size_t old_size = bo->heap_size;
 	size_t new_size = bo->heap_size ? bo->heap_size * 2 :
 		(lima_heap_init_nr_pages << PAGE_SHIFT);
@@ -150,7 +150,7 @@ static void lima_gem_free_object(struct drm_gem_object *obj)
 	struct lima_bo *bo = to_lima_bo(obj);
 
 	if (!list_empty(&bo->va))
-		dev_err(obj->dev->dev, "lima gem free bo still has va\n");
+		dev_err(obj->drm->dev, "lima gem free bo still has va\n");
 
 	drm_gem_shmem_free(&bo->base);
 }
diff --git a/drivers/gpu/drm/loongson/lsdc_gem.c b/drivers/gpu/drm/loongson/lsdc_gem.c
index 04293df2f0de..a4029fd72df9 100644
--- a/drivers/gpu/drm/loongson/lsdc_gem.c
+++ b/drivers/gpu/drm/loongson/lsdc_gem.c
@@ -54,11 +54,11 @@ static struct sg_table *lsdc_gem_prime_get_sg_table(struct drm_gem_object *obj)
 	struct ttm_tt *tt = tbo->ttm;
 
 	if (!tt) {
-		drm_err(obj->dev, "sharing a buffer without backing memory\n");
+		drm_err(obj->drm, "sharing a buffer without backing memory\n");
 		return ERR_PTR(-ENOMEM);
 	}
 
-	return drm_prime_pages_to_sg(obj->dev, tt->pages, tt->num_pages);
+	return drm_prime_pages_to_sg(obj->drm, tt->pages, tt->num_pages);
 }
 
 static void lsdc_gem_object_free(struct drm_gem_object *obj)
@@ -82,13 +82,13 @@ static int lsdc_gem_object_vmap(struct drm_gem_object *obj, struct iosys_map *ma
 
 	ret = lsdc_bo_pin(lbo, 0, NULL);
 	if (unlikely(ret)) {
-		drm_err(obj->dev, "pin %p for vmap failed\n", lbo);
+		drm_err(obj->drm, "pin %p for vmap failed\n", lbo);
 		return ret;
 	}
 
 	ret = ttm_bo_vmap(tbo, &lbo->map);
 	if (ret) {
-		drm_err(obj->dev, "ttm bo vmap failed\n");
+		drm_err(obj->drm, "ttm bo vmap failed\n");
 		lsdc_bo_unpin(lbo);
 		return ret;
 	}
@@ -107,7 +107,7 @@ static void lsdc_gem_object_vunmap(struct drm_gem_object *obj, struct iosys_map
 	struct lsdc_bo *lbo = to_lsdc_bo(tbo);
 
 	if (unlikely(!lbo->vmap_count)) {
-		drm_warn(obj->dev, "%p is not mapped\n", lbo);
+		drm_warn(obj->drm, "%p is not mapped\n", lbo);
 		return;
 	}
 
@@ -126,7 +126,7 @@ static int lsdc_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struc
 
 	ret = ttm_bo_mmap_obj(vma, tbo);
 	if (unlikely(ret)) {
-		drm_warn(obj->dev, "mmap %p failed\n", tbo);
+		drm_warn(obj->drm, "mmap %p failed\n", tbo);
 		return ret;
 	}
 
diff --git a/drivers/gpu/drm/loongson/lsdc_ttm.c b/drivers/gpu/drm/loongson/lsdc_ttm.c
index bb0c8fd43a75..8674b7d9b678 100644
--- a/drivers/gpu/drm/loongson/lsdc_ttm.c
+++ b/drivers/gpu/drm/loongson/lsdc_ttm.c
@@ -163,7 +163,7 @@ static int lsdc_bo_move(struct ttm_buffer_object *tbo,
 			struct ttm_resource *new_mem,
 			struct ttm_place *hop)
 {
-	struct drm_device *ddev = tbo->base.dev;
+	struct drm_device *ddev = tbo->base.drm;
 	struct ttm_resource *old_mem = tbo->resource;
 	struct lsdc_bo *lbo = to_lsdc_bo(tbo);
 	int ret;
@@ -254,7 +254,7 @@ static struct ttm_device_funcs lsdc_bo_driver = {
 u64 lsdc_bo_gpu_offset(struct lsdc_bo *lbo)
 {
 	struct ttm_buffer_object *tbo = &lbo->tbo;
-	struct drm_device *ddev = tbo->base.dev;
+	struct drm_device *ddev = tbo->base.drm;
 	struct ttm_resource *resource = tbo->resource;
 
 	if (unlikely(!tbo->pin_count)) {
@@ -359,7 +359,7 @@ int lsdc_bo_kmap(struct lsdc_bo *lbo)
 {
 	struct ttm_buffer_object *tbo = &lbo->tbo;
 	struct drm_gem_object *gem = &tbo->base;
-	struct drm_device *ddev = gem->dev;
+	struct drm_device *ddev = gem->drm;
 	long ret;
 	int err;
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
index a25b28d3ee90..852f1cdaf31c 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
@@ -100,7 +100,7 @@ struct mtk_drm_gem_obj *mtk_drm_gem_create(struct drm_device *dev,
 void mtk_drm_gem_free_object(struct drm_gem_object *obj)
 {
 	struct mtk_drm_gem_obj *mtk_gem = to_mtk_gem_obj(obj);
-	struct mtk_drm_private *priv = obj->dev->dev_private;
+	struct mtk_drm_private *priv = obj->drm->dev_private;
 
 	if (mtk_gem->sg)
 		drm_prime_gem_destroy(obj, mtk_gem->sg);
@@ -151,7 +151,7 @@ static int mtk_drm_gem_object_mmap(struct drm_gem_object *obj,
 {
 	int ret;
 	struct mtk_drm_gem_obj *mtk_gem = to_mtk_gem_obj(obj);
-	struct mtk_drm_private *priv = obj->dev->dev_private;
+	struct mtk_drm_private *priv = obj->drm->dev_private;
 
 	/*
 	 * Set vm_pgoff (used as a fake buffer offset by DRM) to 0 and map the
@@ -182,7 +182,7 @@ static int mtk_drm_gem_object_mmap(struct drm_gem_object *obj,
 struct sg_table *mtk_gem_prime_get_sg_table(struct drm_gem_object *obj)
 {
 	struct mtk_drm_gem_obj *mtk_gem = to_mtk_gem_obj(obj);
-	struct mtk_drm_private *priv = obj->dev->dev_private;
+	struct mtk_drm_private *priv = obj->drm->dev_private;
 	struct sg_table *sgt;
 	int ret;
 
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 635744bc4765..8866fe7297ee 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -22,7 +22,7 @@
 static dma_addr_t physaddr(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct msm_drm_private *priv = obj->dev->dev_private;
+	struct msm_drm_private *priv = obj->drm->dev_private;
 	return (((dma_addr_t)msm_obj->vram_node->start) << PAGE_SHIFT) +
 			priv->vram.paddr;
 }
@@ -49,21 +49,21 @@ static bool use_pages(struct drm_gem_object *obj)
 
 static void sync_for_device(struct msm_gem_object *msm_obj)
 {
-	struct device *dev = msm_obj->base.dev->dev;
+	struct device *dev = msm_obj->base.drm->dev;
 
 	dma_map_sgtable(dev, msm_obj->sgt, DMA_BIDIRECTIONAL, 0);
 }
 
 static void sync_for_cpu(struct msm_gem_object *msm_obj)
 {
-	struct device *dev = msm_obj->base.dev->dev;
+	struct device *dev = msm_obj->base.drm->dev;
 
 	dma_unmap_sgtable(dev, msm_obj->sgt, DMA_BIDIRECTIONAL, 0);
 }
 
 static void update_lru_active(struct drm_gem_object *obj)
 {
-	struct msm_drm_private *priv = obj->dev->dev_private;
+	struct msm_drm_private *priv = obj->drm->dev_private;
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
 	GEM_WARN_ON(!msm_obj->pages);
@@ -81,7 +81,7 @@ static void update_lru_active(struct drm_gem_object *obj)
 
 static void update_lru_locked(struct drm_gem_object *obj)
 {
-	struct msm_drm_private *priv = obj->dev->dev_private;
+	struct msm_drm_private *priv = obj->drm->dev_private;
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
 	msm_gem_assert_locked(&msm_obj->base);
@@ -97,7 +97,7 @@ static void update_lru_locked(struct drm_gem_object *obj)
 
 static void update_lru(struct drm_gem_object *obj)
 {
-	struct msm_drm_private *priv = obj->dev->dev_private;
+	struct msm_drm_private *priv = obj->drm->dev_private;
 
 	mutex_lock(&priv->lru.lock);
 	update_lru_locked(obj);
@@ -108,7 +108,7 @@ static void update_lru(struct drm_gem_object *obj)
 static struct page **get_pages_vram(struct drm_gem_object *obj, int npages)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct msm_drm_private *priv = obj->dev->dev_private;
+	struct msm_drm_private *priv = obj->drm->dev_private;
 	dma_addr_t paddr;
 	struct page **p;
 	int ret, i;
@@ -141,7 +141,7 @@ static struct page **get_pages(struct drm_gem_object *obj)
 	msm_gem_assert_locked(obj);
 
 	if (!msm_obj->pages) {
-		struct drm_device *dev = obj->dev;
+		struct drm_device *dev = obj->drm;
 		struct page **p;
 		int npages = obj->size >> PAGE_SHIFT;
 
@@ -158,7 +158,7 @@ static struct page **get_pages(struct drm_gem_object *obj)
 
 		msm_obj->pages = p;
 
-		msm_obj->sgt = drm_prime_pages_to_sg(obj->dev, p, npages);
+		msm_obj->sgt = drm_prime_pages_to_sg(obj->drm, p, npages);
 		if (IS_ERR(msm_obj->sgt)) {
 			void *ptr = ERR_CAST(msm_obj->sgt);
 
@@ -182,7 +182,7 @@ static struct page **get_pages(struct drm_gem_object *obj)
 static void put_pages_vram(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct msm_drm_private *priv = obj->dev->dev_private;
+	struct msm_drm_private *priv = obj->drm->dev_private;
 
 	spin_lock(&priv->vram.lock);
 	drm_mm_remove_node(msm_obj->vram_node);
@@ -222,15 +222,15 @@ static void put_pages(struct drm_gem_object *obj)
 static struct page **msm_gem_pin_pages_locked(struct drm_gem_object *obj,
 					      unsigned madv)
 {
-	struct msm_drm_private *priv = obj->dev->dev_private;
+	struct msm_drm_private *priv = obj->drm->dev_private;
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct page **p;
 
 	msm_gem_assert_locked(obj);
 
 	if (GEM_WARN_ON(msm_obj->madv > madv)) {
-		DRM_DEV_ERROR(obj->dev->dev, "Invalid madv state: %u vs %u\n",
-			msm_obj->madv, madv);
+		DRM_DEV_ERROR(obj->drm->dev, "Invalid madv state: %u vs %u\n",
+			      msm_obj->madv, madv);
 		return ERR_PTR(-EBUSY);
 	}
 
@@ -323,7 +323,7 @@ static vm_fault_t msm_gem_fault(struct vm_fault *vmf)
 /** get mmap offset */
 static uint64_t mmap_offset(struct drm_gem_object *obj)
 {
-	struct drm_device *dev = obj->dev;
+	struct drm_device *dev = obj->drm;
 	int ret;
 
 	msm_gem_assert_locked(obj);
@@ -489,7 +489,7 @@ int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct msm_gem_vma *vma)
 
 void msm_gem_unpin_locked(struct drm_gem_object *obj)
 {
-	struct msm_drm_private *priv = obj->dev->dev_private;
+	struct msm_drm_private *priv = obj->drm->dev_private;
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
 	msm_gem_assert_locked(obj);
@@ -509,7 +509,7 @@ void msm_gem_unpin_locked(struct drm_gem_object *obj)
  */
 void msm_gem_unpin_active(struct drm_gem_object *obj)
 {
-	struct msm_drm_private *priv = obj->dev->dev_private;
+	struct msm_drm_private *priv = obj->drm->dev_private;
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
 	mutex_lock(&priv->lru.lock);
@@ -778,7 +778,7 @@ void msm_gem_put_vaddr(struct drm_gem_object *obj)
  */
 int msm_gem_madvise(struct drm_gem_object *obj, unsigned madv)
 {
-	struct msm_drm_private *priv = obj->dev->dev_private;
+	struct msm_drm_private *priv = obj->drm->dev_private;
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
 	msm_gem_lock(obj);
@@ -804,8 +804,8 @@ int msm_gem_madvise(struct drm_gem_object *obj, unsigned madv)
 
 void msm_gem_purge(struct drm_gem_object *obj)
 {
-	struct drm_device *dev = obj->dev;
-	struct msm_drm_private *priv = obj->dev->dev_private;
+	struct drm_device *dev = obj->drm;
+	struct msm_drm_private *priv = obj->drm->dev_private;
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
 	msm_gem_assert_locked(obj);
@@ -845,7 +845,7 @@ void msm_gem_purge(struct drm_gem_object *obj)
  */
 void msm_gem_evict(struct drm_gem_object *obj)
 {
-	struct drm_device *dev = obj->dev;
+	struct drm_device *dev = obj->drm;
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
 	msm_gem_assert_locked(obj);
@@ -1025,7 +1025,7 @@ void msm_gem_describe_objects(struct list_head *list, struct seq_file *m)
 static void msm_gem_free_object(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct drm_device *dev = obj->dev;
+	struct drm_device *dev = obj->drm;
 	struct msm_drm_private *priv = dev->dev_private;
 
 	mutex_lock(&priv->obj_lock);
diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
index 5f68e31a3e4e..94f587465435 100644
--- a/drivers/gpu/drm/msm/msm_gem_prime.c
+++ b/drivers/gpu/drm/msm/msm_gem_prime.c
@@ -19,7 +19,7 @@ struct sg_table *msm_gem_prime_get_sg_table(struct drm_gem_object *obj)
 	if (WARN_ON(!msm_obj->pages))  /* should have already pinned! */
 		return ERR_PTR(-ENOMEM);
 
-	return drm_prime_pages_to_sg(obj->dev, msm_obj->pages, npages);
+	return drm_prime_pages_to_sg(obj->drm, msm_obj->pages, npages);
 }
 
 int msm_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map)
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index c2ec91cc845d..99ca043c6da4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -148,7 +148,7 @@ nouveau_bo_del_ttm(struct ttm_buffer_object *bo)
 	 * If nouveau_bo_new() allocated this buffer, the GEM object was never
 	 * initialized, so don't attempt to release it.
 	 */
-	if (bo->base.dev)
+	if (bo->base.drm)
 		drm_gem_object_release(&bo->base);
 	else
 		dma_resv_fini(&bo->base._resv);
diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c b/drivers/gpu/drm/nouveau/nouveau_prime.c
index f42c2b1b0363..b90570f26350 100644
--- a/drivers/gpu/drm/nouveau/nouveau_prime.c
+++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
@@ -32,7 +32,7 @@ struct sg_table *nouveau_gem_prime_get_sg_table(struct drm_gem_object *obj)
 {
 	struct nouveau_bo *nvbo = nouveau_gem_object(obj);
 
-	return drm_prime_pages_to_sg(obj->dev, nvbo->bo.ttm->pages,
+	return drm_prime_pages_to_sg(obj->drm, nvbo->bo.ttm->pages,
 				     nvbo->bo.ttm->num_pages);
 }
 
diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
index 6b58a5bb7b44..b2b49819484d 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem.c
@@ -133,7 +133,7 @@ struct omap_drm_usergart {
 /** get mmap offset */
 u64 omap_gem_mmap_offset(struct drm_gem_object *obj)
 {
-	struct drm_device *dev = obj->dev;
+	struct drm_device *dev = obj->drm;
 	int ret;
 	size_t size;
 
@@ -167,7 +167,7 @@ static void omap_gem_evict_entry(struct drm_gem_object *obj,
 		enum tiler_fmt fmt, struct omap_drm_usergart_entry *entry)
 {
 	struct omap_gem_object *omap_obj = to_omap_bo(obj);
-	struct omap_drm_private *priv = obj->dev->dev_private;
+	struct omap_drm_private *priv = obj->drm->dev_private;
 	int n = priv->usergart[fmt].height;
 	size_t size = PAGE_SIZE * n;
 	loff_t off = omap_gem_mmap_offset(obj) +
@@ -178,12 +178,12 @@ static void omap_gem_evict_entry(struct drm_gem_object *obj,
 		int i;
 		/* if stride > than PAGE_SIZE then sparse mapping: */
 		for (i = n; i > 0; i--) {
-			unmap_mapping_range(obj->dev->anon_inode->i_mapping,
+			unmap_mapping_range(obj->drm->anon_inode->i_mapping,
 					    off, PAGE_SIZE, 1);
 			off += PAGE_SIZE * m;
 		}
 	} else {
-		unmap_mapping_range(obj->dev->anon_inode->i_mapping,
+		unmap_mapping_range(obj->drm->anon_inode->i_mapping,
 				    off, size, 1);
 	}
 
@@ -194,7 +194,7 @@ static void omap_gem_evict_entry(struct drm_gem_object *obj,
 static void omap_gem_evict(struct drm_gem_object *obj)
 {
 	struct omap_gem_object *omap_obj = to_omap_bo(obj);
-	struct omap_drm_private *priv = obj->dev->dev_private;
+	struct omap_drm_private *priv = obj->drm->dev_private;
 
 	if (omap_obj->flags & OMAP_BO_TILED_MASK) {
 		enum tiler_fmt fmt = gem2fmt(omap_obj->flags);
@@ -220,7 +220,7 @@ static void omap_gem_evict(struct drm_gem_object *obj)
  */
 static int omap_gem_attach_pages(struct drm_gem_object *obj)
 {
-	struct drm_device *dev = obj->dev;
+	struct drm_device *dev = obj->drm;
 	struct omap_gem_object *omap_obj = to_omap_bo(obj);
 	struct page **pages;
 	int npages = obj->size >> PAGE_SHIFT;
@@ -238,7 +238,8 @@ static int omap_gem_attach_pages(struct drm_gem_object *obj)
 
 	pages = drm_gem_get_pages(obj);
 	if (IS_ERR(pages)) {
-		dev_err(obj->dev->dev, "could not get pages: %ld\n", PTR_ERR(pages));
+		dev_err(obj->drm->dev, "could not get pages: %ld\n",
+			PTR_ERR(pages));
 		return PTR_ERR(pages);
 	}
 
@@ -301,7 +302,7 @@ static void omap_gem_detach_pages(struct drm_gem_object *obj)
 
 	for (i = 0; i < npages; i++) {
 		if (omap_obj->dma_addrs[i])
-			dma_unmap_page(obj->dev->dev, omap_obj->dma_addrs[i],
+			dma_unmap_page(obj->drm->dev, omap_obj->dma_addrs[i],
 				       PAGE_SIZE, DMA_TO_DEVICE);
 	}
 
@@ -373,7 +374,7 @@ static vm_fault_t omap_gem_fault_2d(struct drm_gem_object *obj,
 		struct vm_area_struct *vma, struct vm_fault *vmf)
 {
 	struct omap_gem_object *omap_obj = to_omap_bo(obj);
-	struct omap_drm_private *priv = obj->dev->dev_private;
+	struct omap_drm_private *priv = obj->drm->dev_private;
 	struct omap_drm_usergart_entry *entry;
 	enum tiler_fmt fmt = gem2fmt(omap_obj->flags);
 	struct page *pages[64];  /* XXX is this too much to have on stack? */
@@ -450,7 +451,7 @@ static vm_fault_t omap_gem_fault_2d(struct drm_gem_object *obj,
 	err = tiler_pin(entry->block, pages, ARRAY_SIZE(pages), 0, true);
 	if (err) {
 		ret = vmf_error(err);
-		dev_err(obj->dev->dev, "failed to pin: %d\n", err);
+		dev_err(obj->drm->dev, "failed to pin: %d\n", err);
 		return ret;
 	}
 
@@ -647,7 +648,7 @@ int omap_gem_roll(struct drm_gem_object *obj, u32 roll)
 	int ret = 0;
 
 	if (roll > npages) {
-		dev_err(obj->dev->dev, "invalid roll: %d\n", roll);
+		dev_err(obj->drm->dev, "invalid roll: %d\n", roll);
 		return -EINVAL;
 	}
 
@@ -664,7 +665,7 @@ int omap_gem_roll(struct drm_gem_object *obj, u32 roll)
 		ret = tiler_pin(omap_obj->block, omap_obj->pages, npages,
 				roll, true);
 		if (ret)
-			dev_err(obj->dev->dev, "could not repin: %d\n", ret);
+			dev_err(obj->drm->dev, "could not repin: %d\n", ret);
 	}
 
 fail:
@@ -700,7 +701,7 @@ static inline bool omap_gem_is_cached_coherent(struct drm_gem_object *obj)
  */
 void omap_gem_cpu_sync_page(struct drm_gem_object *obj, int pgoff)
 {
-	struct drm_device *dev = obj->dev;
+	struct drm_device *dev = obj->drm;
 	struct omap_gem_object *omap_obj = to_omap_bo(obj);
 
 	if (omap_gem_is_cached_coherent(obj))
@@ -717,7 +718,7 @@ void omap_gem_cpu_sync_page(struct drm_gem_object *obj, int pgoff)
 void omap_gem_dma_sync_buffer(struct drm_gem_object *obj,
 		enum dma_data_direction dir)
 {
-	struct drm_device *dev = obj->dev;
+	struct drm_device *dev = obj->drm;
 	struct omap_gem_object *omap_obj = to_omap_bo(obj);
 	int i, npages = obj->size >> PAGE_SHIFT;
 	struct page **pages = omap_obj->pages;
@@ -768,7 +769,7 @@ static int omap_gem_pin_tiler(struct drm_gem_object *obj)
 
 	if (IS_ERR(block)) {
 		ret = PTR_ERR(block);
-		dev_err(obj->dev->dev, "could not remap: %d (%d)\n", ret, fmt);
+		dev_err(obj->drm->dev, "could not remap: %d (%d)\n", ret, fmt);
 		goto fail;
 	}
 
@@ -776,7 +777,7 @@ static int omap_gem_pin_tiler(struct drm_gem_object *obj)
 	ret = tiler_pin(block, omap_obj->pages, npages, omap_obj->roll, true);
 	if (ret) {
 		tiler_release(block);
-		dev_err(obj->dev->dev, "could not pin: %d\n", ret);
+		dev_err(obj->drm->dev, "could not pin: %d\n", ret);
 		goto fail;
 	}
 
@@ -805,7 +806,7 @@ static int omap_gem_pin_tiler(struct drm_gem_object *obj)
  */
 int omap_gem_pin(struct drm_gem_object *obj, dma_addr_t *dma_addr)
 {
-	struct omap_drm_private *priv = obj->dev->dev_private;
+	struct omap_drm_private *priv = obj->drm->dev_private;
 	struct omap_gem_object *omap_obj = to_omap_bo(obj);
 	int ret = 0;
 
@@ -849,7 +850,7 @@ int omap_gem_pin(struct drm_gem_object *obj, dma_addr_t *dma_addr)
  */
 static void omap_gem_unpin_locked(struct drm_gem_object *obj)
 {
-	struct omap_drm_private *priv = obj->dev->dev_private;
+	struct omap_drm_private *priv = obj->drm->dev_private;
 	struct omap_gem_object *omap_obj = to_omap_bo(obj);
 	int ret;
 
@@ -867,12 +868,12 @@ static void omap_gem_unpin_locked(struct drm_gem_object *obj)
 		if (priv->has_dmm) {
 			ret = tiler_unpin(omap_obj->block);
 			if (ret) {
-				dev_err(obj->dev->dev,
+				dev_err(obj->drm->dev,
 					"could not unpin pages: %d\n", ret);
 			}
 			ret = tiler_release(omap_obj->block);
 			if (ret) {
-				dev_err(obj->dev->dev,
+				dev_err(obj->drm->dev,
 					"could not release unmap: %d\n", ret);
 			}
 			omap_obj->dma_addr = 0;
@@ -1195,7 +1196,7 @@ void omap_gem_describe_objects(struct list_head *list, struct seq_file *m)
 
 static void omap_gem_free_object(struct drm_gem_object *obj)
 {
-	struct drm_device *dev = obj->dev;
+	struct drm_device *dev = obj->drm;
 	struct omap_drm_private *priv = dev->dev_private;
 	struct omap_gem_object *omap_obj = to_omap_bo(obj);
 
diff --git a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
index 8e194dbc9506..f00a811d716a 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
@@ -92,7 +92,7 @@ struct dma_buf *omap_gem_prime_export(struct drm_gem_object *obj, int flags)
 	exp_info.priv = obj;
 	exp_info.resv = obj->resv;
 
-	return drm_gem_dmabuf_export(obj->dev, &exp_info);
+	return drm_gem_dmabuf_export(obj->drm, &exp_info);
 }
 
 /* -----------------------------------------------------------------------------
@@ -109,7 +109,7 @@ struct drm_gem_object *omap_gem_prime_import(struct drm_device *dev,
 
 	if (dma_buf->ops == &omap_dmabuf_ops) {
 		obj = dma_buf->priv;
-		if (obj->dev == dev) {
+		if (obj->drm == dev) {
 			/*
 			 * Importing dmabuf exported from out own gem increases
 			 * refcount on gem itself instead of f_count of dmabuf.
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index 3c812fbd126f..8c3eebcad5a5 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -17,7 +17,7 @@
 static void panfrost_gem_free_object(struct drm_gem_object *obj)
 {
 	struct panfrost_gem_object *bo = to_panfrost_bo(obj);
-	struct panfrost_device *pfdev = obj->dev->dev_private;
+	struct panfrost_device *pfdev = obj->drm->dev_private;
 
 	/*
 	 * Make sure the BO is no longer inserted in the shrinker list before
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index c0123d09f699..8d4e94725310 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -323,7 +323,7 @@ int panfrost_mmu_map(struct panfrost_gem_mapping *mapping)
 	struct panfrost_gem_object *bo = mapping->obj;
 	struct drm_gem_shmem_object *shmem = &bo->base;
 	struct drm_gem_object *obj = &shmem->base;
-	struct panfrost_device *pfdev = to_panfrost_device(obj->dev);
+	struct panfrost_device *pfdev = to_panfrost_device(obj->drm);
 	struct sg_table *sgt;
 	int prot = IOMMU_READ | IOMMU_WRITE;
 
@@ -348,7 +348,7 @@ void panfrost_mmu_unmap(struct panfrost_gem_mapping *mapping)
 {
 	struct panfrost_gem_object *bo = mapping->obj;
 	struct drm_gem_object *obj = &bo->base.base;
-	struct panfrost_device *pfdev = to_panfrost_device(obj->dev);
+	struct panfrost_device *pfdev = to_panfrost_device(obj->drm);
 	struct io_pgtable_ops *ops = mapping->mmu->pgtbl_ops;
 	u64 iova = mapping->mmnode.start << PAGE_SHIFT;
 	size_t len = mapping->mmnode.size << PAGE_SHIFT;
diff --git a/drivers/gpu/drm/qxl/qxl_gem.c b/drivers/gpu/drm/qxl/qxl_gem.c
index a08da0bd9098..d3b8dae3e55e 100644
--- a/drivers/gpu/drm/qxl/qxl_gem.c
+++ b/drivers/gpu/drm/qxl/qxl_gem.c
@@ -34,7 +34,7 @@ void qxl_gem_object_free(struct drm_gem_object *gobj)
 	struct qxl_device *qdev;
 	struct ttm_buffer_object *tbo;
 
-	qdev = to_qxl(gobj->dev);
+	qdev = to_qxl(gobj->drm);
 
 	qxl_surface_evict(qdev, qobj, false);
 
diff --git a/drivers/gpu/drm/qxl/qxl_object.c b/drivers/gpu/drm/qxl/qxl_object.c
index 06a58dad5f5c..4d3f5cec26ce 100644
--- a/drivers/gpu/drm/qxl/qxl_object.c
+++ b/drivers/gpu/drm/qxl/qxl_object.c
@@ -38,7 +38,7 @@ static void qxl_ttm_bo_destroy(struct ttm_buffer_object *tbo)
 	struct qxl_device *qdev;
 
 	bo = to_qxl_bo(tbo);
-	qdev = to_qxl(bo->tbo.base.dev);
+	qdev = to_qxl(bo->tbo.base.drm);
 
 	qxl_surface_evict(qdev, bo, false);
 	WARN_ON_ONCE(bo->map_count > 0);
@@ -295,7 +295,7 @@ struct qxl_bo *qxl_bo_ref(struct qxl_bo *bo)
 static int __qxl_bo_pin(struct qxl_bo *bo)
 {
 	struct ttm_operation_ctx ctx = { false, false };
-	struct drm_device *ddev = bo->tbo.base.dev;
+	struct drm_device *ddev = bo->tbo.base.drm;
 	int r;
 
 	if (bo->tbo.pin_count) {
diff --git a/drivers/gpu/drm/qxl/qxl_object.h b/drivers/gpu/drm/qxl/qxl_object.h
index 53392cb90eec..1cc9e9d2e432 100644
--- a/drivers/gpu/drm/qxl/qxl_object.h
+++ b/drivers/gpu/drm/qxl/qxl_object.h
@@ -34,7 +34,7 @@ static inline int qxl_bo_reserve(struct qxl_bo *bo)
 	r = ttm_bo_reserve(&bo->tbo, true, false, NULL);
 	if (unlikely(r != 0)) {
 		if (r != -ERESTARTSYS) {
-			struct drm_device *ddev = bo->tbo.base.dev;
+			struct drm_device *ddev = bo->tbo.base.drm;
 
 			dev_err(ddev->dev, "%p reserve failed\n", bo);
 		}
diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
index 368d26da0d6a..e82d959a9517 100644
--- a/drivers/gpu/drm/qxl/qxl_release.c
+++ b/drivers/gpu/drm/qxl/qxl_release.c
@@ -205,7 +205,7 @@ static int qxl_release_validate_bo(struct qxl_bo *bo)
 		return ret;
 
 	/* allocate a surface for reserved + validated buffers */
-	ret = qxl_bo_check_id(to_qxl(bo->tbo.base.dev), bo);
+	ret = qxl_bo_check_id(to_qxl(bo->tbo.base.drm), bo);
 	if (ret)
 		return ret;
 	return 0;
diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
index 1a82629bce3f..708ef211be07 100644
--- a/drivers/gpu/drm/qxl/qxl_ttm.c
+++ b/drivers/gpu/drm/qxl/qxl_ttm.c
@@ -129,7 +129,7 @@ static void qxl_bo_move_notify(struct ttm_buffer_object *bo,
 	if (!qxl_ttm_bo_is_qxl_bo(bo) || !bo->resource)
 		return;
 	qbo = to_qxl_bo(bo);
-	qdev = to_qxl(qbo->tbo.base.dev);
+	qdev = to_qxl(qbo->tbo.base.drm);
 
 	if (bo->resource->mem_type == TTM_PL_PRIV && qbo->surface_id)
 		qxl_surface_evict(qdev, qbo, new_mem ? true : false);
diff --git a/drivers/gpu/drm/radeon/radeon_prime.c b/drivers/gpu/drm/radeon/radeon_prime.c
index b3cfc99f4d7e..8b2342c20909 100644
--- a/drivers/gpu/drm/radeon/radeon_prime.c
+++ b/drivers/gpu/drm/radeon/radeon_prime.c
@@ -38,7 +38,7 @@ struct sg_table *radeon_gem_prime_get_sg_table(struct drm_gem_object *obj)
 {
 	struct radeon_bo *bo = gem_to_radeon_bo(obj);
 
-	return drm_prime_pages_to_sg(obj->dev, bo->tbo.ttm->pages,
+	return drm_prime_pages_to_sg(obj->drm, bo->tbo.ttm->pages,
 				     bo->tbo.ttm->num_pages);
 }
 
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
index b8f8b45ebf59..fa91155a7dc0 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
@@ -20,7 +20,7 @@
 
 static int rockchip_gem_iommu_map(struct rockchip_gem_object *rk_obj)
 {
-	struct drm_device *drm = rk_obj->base.dev;
+	struct drm_device *drm = rk_obj->base.drm;
 	struct rockchip_drm_private *private = drm->dev_private;
 	int prot = IOMMU_READ | IOMMU_WRITE;
 	ssize_t ret;
@@ -61,7 +61,7 @@ static int rockchip_gem_iommu_map(struct rockchip_gem_object *rk_obj)
 
 static int rockchip_gem_iommu_unmap(struct rockchip_gem_object *rk_obj)
 {
-	struct drm_device *drm = rk_obj->base.dev;
+	struct drm_device *drm = rk_obj->base.drm;
 	struct rockchip_drm_private *private = drm->dev_private;
 
 	iommu_unmap(private->domain, rk_obj->dma_addr, rk_obj->size);
@@ -77,7 +77,7 @@ static int rockchip_gem_iommu_unmap(struct rockchip_gem_object *rk_obj)
 
 static int rockchip_gem_get_pages(struct rockchip_gem_object *rk_obj)
 {
-	struct drm_device *drm = rk_obj->base.dev;
+	struct drm_device *drm = rk_obj->base.drm;
 	int ret, i;
 	struct scatterlist *s;
 
@@ -87,7 +87,7 @@ static int rockchip_gem_get_pages(struct rockchip_gem_object *rk_obj)
 
 	rk_obj->num_pages = rk_obj->base.size >> PAGE_SHIFT;
 
-	rk_obj->sgt = drm_prime_pages_to_sg(rk_obj->base.dev,
+	rk_obj->sgt = drm_prime_pages_to_sg(rk_obj->base.drm,
 					    rk_obj->pages, rk_obj->num_pages);
 	if (IS_ERR(rk_obj->sgt)) {
 		ret = PTR_ERR(rk_obj->sgt);
@@ -157,7 +157,7 @@ static int rockchip_gem_alloc_dma(struct rockchip_gem_object *rk_obj,
 				  bool alloc_kmap)
 {
 	struct drm_gem_object *obj = &rk_obj->base;
-	struct drm_device *drm = obj->dev;
+	struct drm_device *drm = obj->drm;
 
 	rk_obj->dma_attrs = DMA_ATTR_WRITE_COMBINE;
 
@@ -179,7 +179,7 @@ static int rockchip_gem_alloc_buf(struct rockchip_gem_object *rk_obj,
 				  bool alloc_kmap)
 {
 	struct drm_gem_object *obj = &rk_obj->base;
-	struct drm_device *drm = obj->dev;
+	struct drm_device *drm = obj->drm;
 	struct rockchip_drm_private *private = drm->dev_private;
 
 	if (private->domain)
@@ -198,7 +198,7 @@ static void rockchip_gem_free_iommu(struct rockchip_gem_object *rk_obj)
 static void rockchip_gem_free_dma(struct rockchip_gem_object *rk_obj)
 {
 	struct drm_gem_object *obj = &rk_obj->base;
-	struct drm_device *drm = obj->dev;
+	struct drm_device *drm = obj->drm;
 
 	dma_free_attrs(drm->dev, obj->size, rk_obj->kvaddr, rk_obj->dma_addr,
 		       rk_obj->dma_attrs);
@@ -229,7 +229,7 @@ static int rockchip_drm_gem_object_mmap_dma(struct drm_gem_object *obj,
 					    struct vm_area_struct *vma)
 {
 	struct rockchip_gem_object *rk_obj = to_rockchip_obj(obj);
-	struct drm_device *drm = obj->dev;
+	struct drm_device *drm = obj->drm;
 
 	return dma_mmap_attrs(drm->dev, vma, rk_obj->kvaddr, rk_obj->dma_addr,
 			      obj->size, rk_obj->dma_attrs);
@@ -328,7 +328,7 @@ rockchip_gem_create_object(struct drm_device *drm, unsigned int size,
  */
 void rockchip_gem_free_object(struct drm_gem_object *obj)
 {
-	struct drm_device *drm = obj->dev;
+	struct drm_device *drm = obj->drm;
 	struct rockchip_drm_private *private = drm->dev_private;
 	struct rockchip_gem_object *rk_obj = to_rockchip_obj(obj);
 
@@ -426,12 +426,13 @@ int rockchip_gem_dumb_create(struct drm_file *file_priv,
 struct sg_table *rockchip_gem_prime_get_sg_table(struct drm_gem_object *obj)
 {
 	struct rockchip_gem_object *rk_obj = to_rockchip_obj(obj);
-	struct drm_device *drm = obj->dev;
+	struct drm_device *drm = obj->drm;
 	struct sg_table *sgt;
 	int ret;
 
 	if (rk_obj->pages)
-		return drm_prime_pages_to_sg(obj->dev, rk_obj->pages, rk_obj->num_pages);
+		return drm_prime_pages_to_sg(obj->drm, rk_obj->pages,
+					     rk_obj->num_pages);
 
 	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
 	if (!sgt)
diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index a4023163493d..2cb60cafdf43 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -340,7 +340,7 @@ static int tegra_bo_get_pages(struct drm_device *drm, struct tegra_bo *bo)
 
 	bo->num_pages = bo->gem.size >> PAGE_SHIFT;
 
-	bo->sgt = drm_prime_pages_to_sg(bo->gem.dev, bo->pages, bo->num_pages);
+	bo->sgt = drm_prime_pages_to_sg(bo->gem.drm, bo->pages, bo->num_pages);
 	if (IS_ERR(bo->sgt)) {
 		err = PTR_ERR(bo->sgt);
 		goto put_pages;
@@ -493,7 +493,7 @@ static struct tegra_bo *tegra_bo_import(struct drm_device *drm,
 
 void tegra_bo_free_object(struct drm_gem_object *gem)
 {
-	struct tegra_drm *tegra = gem->dev->dev_private;
+	struct tegra_drm *tegra = gem->drm->dev_private;
 	struct host1x_bo_mapping *mapping, *tmp;
 	struct tegra_bo *bo = to_tegra_bo(gem);
 
@@ -502,7 +502,8 @@ void tegra_bo_free_object(struct drm_gem_object *gem)
 		if (mapping->cache)
 			host1x_bo_unpin(mapping);
 		else
-			dev_err(gem->dev->dev, "mapping %p stale for device %s\n", mapping,
+			dev_err(gem->drm->dev,
+				"mapping %p stale for device %s\n", mapping,
 				dev_name(mapping->dev));
 	}
 
@@ -514,7 +515,7 @@ void tegra_bo_free_object(struct drm_gem_object *gem)
 						  DMA_TO_DEVICE);
 		drm_prime_gem_destroy(gem, NULL);
 	} else {
-		tegra_bo_free(gem->dev, bo);
+		tegra_bo_free(gem->drm, bo);
 	}
 
 	drm_gem_object_release(gem);
@@ -578,7 +579,7 @@ int __tegra_gem_mmap(struct drm_gem_object *gem, struct vm_area_struct *vma)
 		vm_flags_clear(vma, VM_PFNMAP);
 		vma->vm_pgoff = 0;
 
-		err = dma_mmap_wc(gem->dev->dev, vma, bo->vaddr, bo->iova,
+		err = dma_mmap_wc(gem->drm->dev, vma, bo->vaddr, bo->iova,
 				  gem->size);
 		if (err < 0) {
 			drm_gem_vm_close(vma);
@@ -668,7 +669,7 @@ static int tegra_gem_prime_begin_cpu_access(struct dma_buf *buf,
 {
 	struct drm_gem_object *gem = buf->priv;
 	struct tegra_bo *bo = to_tegra_bo(gem);
-	struct drm_device *drm = gem->dev;
+	struct drm_device *drm = gem->drm;
 
 	if (bo->pages)
 		dma_sync_sgtable_for_cpu(drm->dev, bo->sgt, DMA_FROM_DEVICE);
@@ -681,7 +682,7 @@ static int tegra_gem_prime_end_cpu_access(struct dma_buf *buf,
 {
 	struct drm_gem_object *gem = buf->priv;
 	struct tegra_bo *bo = to_tegra_bo(gem);
-	struct drm_device *drm = gem->dev;
+	struct drm_device *drm = gem->drm;
 
 	if (bo->pages)
 		dma_sync_sgtable_for_device(drm->dev, bo->sgt, DMA_TO_DEVICE);
@@ -741,13 +742,13 @@ struct dma_buf *tegra_gem_prime_export(struct drm_gem_object *gem,
 	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
 
 	exp_info.exp_name = KBUILD_MODNAME;
-	exp_info.owner = gem->dev->driver->fops->owner;
+	exp_info.owner = gem->drm->driver->fops->owner;
 	exp_info.ops = &tegra_gem_prime_dmabuf_ops;
 	exp_info.size = gem->size;
 	exp_info.flags = flags;
 	exp_info.priv = gem;
 
-	return drm_gem_dmabuf_export(gem->dev, &exp_info);
+	return drm_gem_dmabuf_export(gem->drm, &exp_info);
 }
 
 struct drm_gem_object *tegra_gem_prime_import(struct drm_device *drm,
@@ -758,7 +759,7 @@ struct drm_gem_object *tegra_gem_prime_import(struct drm_device *drm,
 	if (buf->ops == &tegra_gem_prime_dmabuf_ops) {
 		struct drm_gem_object *gem = buf->priv;
 
-		if (gem->dev == drm) {
+		if (gem->drm == drm) {
 			drm_gem_object_get(gem);
 			return gem;
 		}
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index fd9fd3d15101..3637af18b867 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -250,7 +250,7 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
 		fbo->base.base.resv = &fbo->base.base._resv;
 
 	dma_resv_init(&fbo->base.base._resv);
-	fbo->base.base.dev = NULL;
+	fbo->base.base.drm = NULL;
 	ret = dma_resv_trylock(&fbo->base.base._resv);
 	WARN_ON(!ret);
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index 4212b8c91dd4..c2e9d1f777ea 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -292,7 +292,7 @@ vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault *vmf, pgprot_t prot)
 {
 	struct vm_area_struct *vma = vmf->vma;
 	struct ttm_buffer_object *bo = vma->vm_private_data;
-	struct drm_device *ddev = bo->base.dev;
+	struct drm_device *ddev = bo->base.drm;
 	vm_fault_t ret = VM_FAULT_NOPAGE;
 	unsigned long address;
 	unsigned long pfn;
@@ -323,7 +323,7 @@ vm_fault_t ttm_bo_vm_fault(struct vm_fault *vmf)
 	struct vm_area_struct *vma = vmf->vma;
 	pgprot_t prot;
 	struct ttm_buffer_object *bo = vma->vm_private_data;
-	struct drm_device *ddev = bo->base.dev;
+	struct drm_device *ddev = bo->base.drm;
 	vm_fault_t ret;
 	int idx;
 
diff --git a/drivers/gpu/drm/v3d/v3d_bo.c b/drivers/gpu/drm/v3d/v3d_bo.c
index 8b3229a37c6d..8fb1c38424f8 100644
--- a/drivers/gpu/drm/v3d/v3d_bo.c
+++ b/drivers/gpu/drm/v3d/v3d_bo.c
@@ -30,7 +30,7 @@
  */
 void v3d_free_object(struct drm_gem_object *obj)
 {
-	struct v3d_dev *v3d = to_v3d_dev(obj->dev);
+	struct v3d_dev *v3d = to_v3d_dev(obj->drm);
 	struct v3d_bo *bo = to_v3d_bo(obj);
 
 	v3d_mmu_remove_ptes(bo);
@@ -88,7 +88,7 @@ struct drm_gem_object *v3d_create_object(struct drm_device *dev, size_t size)
 static int
 v3d_bo_create_finish(struct drm_gem_object *obj)
 {
-	struct v3d_dev *v3d = to_v3d_dev(obj->dev);
+	struct v3d_dev *v3d = to_v3d_dev(obj->drm);
 	struct v3d_bo *bo = to_v3d_bo(obj);
 	struct sg_table *sgt;
 	int ret;
diff --git a/drivers/gpu/drm/v3d/v3d_mmu.c b/drivers/gpu/drm/v3d/v3d_mmu.c
index 5a453532901f..efea2273ab93 100644
--- a/drivers/gpu/drm/v3d/v3d_mmu.c
+++ b/drivers/gpu/drm/v3d/v3d_mmu.c
@@ -87,7 +87,7 @@ int v3d_mmu_set_page_table(struct v3d_dev *v3d)
 void v3d_mmu_insert_ptes(struct v3d_bo *bo)
 {
 	struct drm_gem_shmem_object *shmem_obj = &bo->base;
-	struct v3d_dev *v3d = to_v3d_dev(shmem_obj->base.dev);
+	struct v3d_dev *v3d = to_v3d_dev(shmem_obj->base.drm);
 	u32 page = bo->node.start;
 	u32 page_prot = V3D_PTE_WRITEABLE | V3D_PTE_VALID;
 	struct sg_dma_page_iter dma_iter;
@@ -113,7 +113,7 @@ void v3d_mmu_insert_ptes(struct v3d_bo *bo)
 
 void v3d_mmu_remove_ptes(struct v3d_bo *bo)
 {
-	struct v3d_dev *v3d = to_v3d_dev(bo->base.base.dev);
+	struct v3d_dev *v3d = to_v3d_dev(bo->base.base.drm);
 	u32 npages = bo->base.base.size >> V3D_MMU_PAGE_SHIFT;
 	u32 page;
 
diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index 71a6f5e47817..54ff7922ae4d 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -132,7 +132,7 @@ static int vc4_get_user_label(struct vc4_dev *vc4, const char *name)
 static void vc4_bo_set_label(struct drm_gem_object *gem_obj, int label)
 {
 	struct vc4_bo *bo = to_vc4_bo(gem_obj);
-	struct vc4_dev *vc4 = to_vc4_dev(gem_obj->dev);
+	struct vc4_dev *vc4 = to_vc4_dev(gem_obj->drm);
 
 	lockdep_assert_held(&vc4->bo_lock);
 
@@ -166,7 +166,7 @@ static uint32_t bo_page_index(size_t size)
 static void vc4_bo_destroy(struct vc4_bo *bo)
 {
 	struct drm_gem_object *obj = &bo->base.base;
-	struct vc4_dev *vc4 = to_vc4_dev(obj->dev);
+	struct vc4_dev *vc4 = to_vc4_dev(obj->drm);
 
 	lockdep_assert_held(&vc4->bo_lock);
 
@@ -185,7 +185,7 @@ static void vc4_bo_destroy(struct vc4_bo *bo)
 
 static void vc4_bo_remove_from_cache(struct vc4_bo *bo)
 {
-	struct vc4_dev *vc4 = to_vc4_dev(bo->base.base.dev);
+	struct vc4_dev *vc4 = to_vc4_dev(bo->base.base.drm);
 
 	lockdep_assert_held(&vc4->bo_lock);
 	list_del(&bo->unref_head);
@@ -249,7 +249,7 @@ static void vc4_bo_cache_purge(struct drm_device *dev)
 
 void vc4_bo_add_to_purgeable_pool(struct vc4_bo *bo)
 {
-	struct vc4_dev *vc4 = to_vc4_dev(bo->base.base.dev);
+	struct vc4_dev *vc4 = to_vc4_dev(bo->base.base.drm);
 
 	if (WARN_ON_ONCE(vc4->is_vc5))
 		return;
@@ -263,7 +263,7 @@ void vc4_bo_add_to_purgeable_pool(struct vc4_bo *bo)
 
 static void vc4_bo_remove_from_purgeable_pool_locked(struct vc4_bo *bo)
 {
-	struct vc4_dev *vc4 = to_vc4_dev(bo->base.base.dev);
+	struct vc4_dev *vc4 = to_vc4_dev(bo->base.base.drm);
 
 	if (WARN_ON_ONCE(vc4->is_vc5))
 		return;
@@ -287,7 +287,7 @@ static void vc4_bo_remove_from_purgeable_pool_locked(struct vc4_bo *bo)
 
 void vc4_bo_remove_from_purgeable_pool(struct vc4_bo *bo)
 {
-	struct vc4_dev *vc4 = to_vc4_dev(bo->base.base.dev);
+	struct vc4_dev *vc4 = to_vc4_dev(bo->base.base.drm);
 
 	mutex_lock(&vc4->purgeable.lock);
 	vc4_bo_remove_from_purgeable_pool_locked(bo);
@@ -297,7 +297,7 @@ void vc4_bo_remove_from_purgeable_pool(struct vc4_bo *bo)
 static void vc4_bo_purge(struct drm_gem_object *obj)
 {
 	struct vc4_bo *bo = to_vc4_bo(obj);
-	struct drm_device *dev = obj->dev;
+	struct drm_device *dev = obj->drm;
 
 	WARN_ON(!mutex_is_locked(&bo->madv_lock));
 	WARN_ON(bo->madv != VC4_MADV_DONTNEED);
@@ -542,7 +542,7 @@ static void vc4_bo_cache_free_old(struct drm_device *dev)
  */
 static void vc4_free_object(struct drm_gem_object *gem_bo)
 {
-	struct drm_device *dev = gem_bo->dev;
+	struct drm_device *dev = gem_bo->drm;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_bo *bo = to_vc4_bo(gem_bo);
 	struct list_head *cache_list;
@@ -619,7 +619,7 @@ static void vc4_bo_cache_time_work(struct work_struct *work)
 
 int vc4_bo_inc_usecnt(struct vc4_bo *bo)
 {
-	struct vc4_dev *vc4 = to_vc4_dev(bo->base.base.dev);
+	struct vc4_dev *vc4 = to_vc4_dev(bo->base.base.drm);
 	int ret;
 
 	if (WARN_ON_ONCE(vc4->is_vc5))
@@ -659,7 +659,7 @@ int vc4_bo_inc_usecnt(struct vc4_bo *bo)
 
 void vc4_bo_dec_usecnt(struct vc4_bo *bo)
 {
-	struct vc4_dev *vc4 = to_vc4_dev(bo->base.base.dev);
+	struct vc4_dev *vc4 = to_vc4_dev(bo->base.base.drm);
 
 	if (WARN_ON_ONCE(vc4->is_vc5))
 		return;
diff --git a/drivers/gpu/drm/vc4/vc4_validate.c b/drivers/gpu/drm/vc4/vc4_validate.c
index 7dff3ca5af6b..1a279455e67b 100644
--- a/drivers/gpu/drm/vc4/vc4_validate.c
+++ b/drivers/gpu/drm/vc4/vc4_validate.c
@@ -356,7 +356,7 @@ validate_gl_shader_state(VALIDATE_ARGS)
 static int
 validate_tile_binning_config(VALIDATE_ARGS)
 {
-	struct drm_device *dev = exec->exec_bo->base.dev;
+	struct drm_device *dev = exec->exec_bo->base.drm;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	uint8_t flags;
 	uint32_t tile_state_size;
diff --git a/drivers/gpu/drm/vc4/vc4_validate_shaders.c b/drivers/gpu/drm/vc4/vc4_validate_shaders.c
index 9745f8810eca..a9aea68a6441 100644
--- a/drivers/gpu/drm/vc4/vc4_validate_shaders.c
+++ b/drivers/gpu/drm/vc4/vc4_validate_shaders.c
@@ -778,7 +778,7 @@ vc4_handle_branch_target(struct vc4_shader_validation_state *validation_state)
 struct vc4_validated_shader_info *
 vc4_validate_shader(struct drm_gem_dma_object *shader_obj)
 {
-	struct vc4_dev *vc4 = to_vc4_dev(shader_obj->base.dev);
+	struct vc4_dev *vc4 = to_vc4_dev(shader_obj->base.drm);
 	bool found_shader_end = false;
 	int shader_end_ip = 0;
 	uint32_t last_thread_switch_ip = -3;
diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index 7db48d17ee3a..f7e9521dda34 100644
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
@@ -117,7 +117,7 @@ int virtio_gpu_mode_dumb_mmap(struct drm_file *file_priv,
 int virtio_gpu_gem_object_open(struct drm_gem_object *obj,
 			       struct drm_file *file)
 {
-	struct virtio_gpu_device *vgdev = obj->dev->dev_private;
+	struct virtio_gpu_device *vgdev = obj->drm->dev_private;
 	struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
 	struct virtio_gpu_object_array *objs;
 
@@ -127,7 +127,7 @@ int virtio_gpu_gem_object_open(struct drm_gem_object *obj,
 	/* the context might still be missing when the first ioctl is
 	 * DRM_IOCTL_MODE_CREATE_DUMB or DRM_IOCTL_PRIME_FD_TO_HANDLE
 	 */
-	virtio_gpu_create_context(obj->dev, file);
+	virtio_gpu_create_context(obj->drm, file);
 
 	objs = virtio_gpu_array_alloc(1);
 	if (!objs)
@@ -144,7 +144,7 @@ int virtio_gpu_gem_object_open(struct drm_gem_object *obj,
 void virtio_gpu_gem_object_close(struct drm_gem_object *obj,
 				 struct drm_file *file)
 {
-	struct virtio_gpu_device *vgdev = obj->dev->dev_private;
+	struct virtio_gpu_device *vgdev = obj->drm->dev_private;
 	struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
 	struct virtio_gpu_object_array *objs;
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index c7e74cf13022..ced5a9240456 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -63,7 +63,7 @@ static void virtio_gpu_resource_id_put(struct virtio_gpu_device *vgdev, uint32_t
 
 void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo)
 {
-	struct virtio_gpu_device *vgdev = bo->base.base.dev->dev_private;
+	struct virtio_gpu_device *vgdev = bo->base.base.drm->dev_private;
 
 	virtio_gpu_resource_id_put(vgdev, bo->hw_res_handle);
 	if (virtio_gpu_is_shmem(bo)) {
@@ -86,7 +86,7 @@ void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo)
 static void virtio_gpu_free_object(struct drm_gem_object *obj)
 {
 	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
-	struct virtio_gpu_device *vgdev = bo->base.base.dev->dev_private;
+	struct virtio_gpu_device *vgdev = bo->base.base.drm->dev_private;
 
 	if (bo->created) {
 		virtio_gpu_cmd_unref_resource(vgdev, bo);
diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
index 44425f20d91a..29570a41fe7f 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -32,7 +32,7 @@ static int virtgpu_virtio_get_uuid(struct dma_buf *buf,
 {
 	struct drm_gem_object *obj = buf->priv;
 	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
-	struct virtio_gpu_device *vgdev = obj->dev->dev_private;
+	struct virtio_gpu_device *vgdev = obj->drm->dev_private;
 
 	wait_event(vgdev->resp_wq, bo->uuid_state != STATE_INITIALIZING);
 	if (bo->uuid_state != STATE_OK)
@@ -105,7 +105,7 @@ struct dma_buf *virtgpu_gem_prime_export(struct drm_gem_object *obj,
 					 int flags)
 {
 	struct dma_buf *buf;
-	struct drm_device *dev = obj->dev;
+	struct drm_device *dev = obj->drm;
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
 	int ret = 0;
@@ -149,7 +149,7 @@ struct drm_gem_object *virtgpu_gem_prime_import(struct drm_device *dev,
 
 	if (buf->ops == &virtgpu_dmabuf_ops.ops) {
 		obj = buf->priv;
-		if (obj->dev == dev) {
+		if (obj->drm == dev) {
 			/*
 			 * Importing dmabuf exported from our own gem increases
 			 * refcount on gem itself instead of f_count of dmabuf.
diff --git a/drivers/gpu/drm/virtio/virtgpu_vram.c b/drivers/gpu/drm/virtio/virtgpu_vram.c
index 25df81c02783..41b46d2f5bfd 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vram.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vram.c
@@ -6,7 +6,7 @@
 static void virtio_gpu_vram_free(struct drm_gem_object *obj)
 {
 	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
-	struct virtio_gpu_device *vgdev = obj->dev->dev_private;
+	struct virtio_gpu_device *vgdev = obj->drm->dev_private;
 	struct virtio_gpu_object_vram *vram = to_virtio_gpu_vram(bo);
 	bool unmap;
 
@@ -33,7 +33,7 @@ static int virtio_gpu_vram_mmap(struct drm_gem_object *obj,
 				struct vm_area_struct *vma)
 {
 	int ret;
-	struct virtio_gpu_device *vgdev = obj->dev->dev_private;
+	struct virtio_gpu_device *vgdev = obj->drm->dev_private;
 	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
 	struct virtio_gpu_object_vram *vram = to_virtio_gpu_vram(bo);
 	unsigned long vm_size = vma->vm_end - vma->vm_start;
@@ -70,7 +70,7 @@ struct sg_table *virtio_gpu_vram_map_dma_buf(struct virtio_gpu_object *bo,
 					     struct device *dev,
 					     enum dma_data_direction dir)
 {
-	struct virtio_gpu_device *vgdev = bo->base.base.dev->dev_private;
+	struct virtio_gpu_device *vgdev = bo->base.base.drm->dev_private;
 	struct virtio_gpu_object_vram *vram = to_virtio_gpu_vram(bo);
 	struct sg_table *sgt;
 	dma_addr_t addr;
@@ -143,7 +143,7 @@ static int virtio_gpu_vram_map(struct virtio_gpu_object *bo)
 	int ret;
 	uint64_t offset;
 	struct virtio_gpu_object_array *objs;
-	struct virtio_gpu_device *vgdev = bo->base.base.dev->dev_private;
+	struct virtio_gpu_device *vgdev = bo->base.base.drm->dev_private;
 	struct virtio_gpu_object_vram *vram = to_virtio_gpu_vram(bo);
 
 	if (!vgdev->has_host_visible)
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
index c0da89e16e6f..2270c0f33b74 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
@@ -86,7 +86,8 @@ static struct sg_table *vmw_gem_object_get_sg_table(struct drm_gem_object *obj)
 	if (vmw_tt->vsgt.sgt)
 		return vmw_tt->vsgt.sgt;
 
-	return drm_prime_pages_to_sg(obj->dev, vmw_tt->dma_ttm.pages, vmw_tt->dma_ttm.num_pages);
+	return drm_prime_pages_to_sg(obj->drm, vmw_tt->dma_ttm.pages,
+				     vmw_tt->dma_ttm.num_pages);
 }
 
 static const struct vm_operations_struct vmw_vm_ops = {
diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xen_drm_front.c
index 7e9431c50c5a..2220000f1b61 100644
--- a/drivers/gpu/drm/xen/xen_drm_front.c
+++ b/drivers/gpu/drm/xen/xen_drm_front.c
@@ -383,10 +383,10 @@ void xen_drm_front_on_frame_done(struct xen_drm_front_info *front_info,
 
 void xen_drm_front_gem_object_free(struct drm_gem_object *obj)
 {
-	struct xen_drm_front_drm_info *drm_info = obj->dev->dev_private;
+	struct xen_drm_front_drm_info *drm_info = obj->drm->dev_private;
 	int idx;
 
-	if (drm_dev_enter(obj->dev, &idx)) {
+	if (drm_dev_enter(obj->drm, &idx)) {
 		xen_drm_front_dbuf_destroy(drm_info->front_info,
 					   xen_drm_front_dbuf_to_cookie(obj));
 		drm_dev_exit(idx);
diff --git a/drivers/gpu/drm/xen/xen_drm_front_gem.c b/drivers/gpu/drm/xen/xen_drm_front_gem.c
index 3ad2b4cfd1f0..2054641d2ec1 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_gem.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_gem.c
@@ -235,7 +235,7 @@ struct sg_table *xen_drm_front_gem_get_sg_table(struct drm_gem_object *gem_obj)
 	if (!xen_obj->pages)
 		return ERR_PTR(-ENOMEM);
 
-	return drm_prime_pages_to_sg(gem_obj->dev,
+	return drm_prime_pages_to_sg(gem_obj->drm,
 				     xen_obj->pages, xen_obj->num_pages);
 }
 
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index bbc721870c13..7afda00286f6 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -285,9 +285,9 @@ struct drm_gem_object {
 	unsigned handle_count;
 
 	/**
-	 * @dev: DRM dev this object belongs to.
+	 * @drm: DRM dev this object belongs to.
 	 */
-	struct drm_device *dev;
+	struct drm_device *drm;
 
 	/**
 	 * @filp:
-- 
2.39.2

