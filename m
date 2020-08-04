Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AACC823B319
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 04:59:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 913766E413;
	Tue,  4 Aug 2020 02:59:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 345DB6E40D
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 02:59:08 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-OEQEfE8SPgGH6l0UVVrjlw-1; Mon, 03 Aug 2020 22:59:04 -0400
X-MC-Unique: OEQEfE8SPgGH6l0UVVrjlw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20CE0100CD00;
 Tue,  4 Aug 2020 02:59:03 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 131CB8AD1C;
 Tue,  4 Aug 2020 02:59:00 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 58/59] drm/ttm: rename ttm_mem_type_manager ->
 ttm_resource_manager.
Date: Tue,  4 Aug 2020 12:56:31 +1000
Message-Id: <20200804025632.3868079-59-airlied@gmail.com>
In-Reply-To: <20200804025632.3868079-1-airlied@gmail.com>
References: <20200804025632.3868079-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
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
Cc: sroland@vmware.com, christian.koenig@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com, kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

This name makes a lot more sense, since these are about managing
driver resources rather than just memory ranges.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c    |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c   | 36 +++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c       |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  8 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  | 36 +++++-----
 drivers/gpu/drm/drm_gem_vram_helper.c         |  4 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c         | 46 ++++++-------
 drivers/gpu/drm/nouveau/nouveau_ttm.h         |  6 +-
 drivers/gpu/drm/qxl/qxl_ttm.c                 |  4 +-
 drivers/gpu/drm/radeon/radeon_gem.c           |  2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c           |  4 +-
 drivers/gpu/drm/ttm/ttm_bo.c                  | 66 +++++++++----------
 drivers/gpu/drm/ttm/ttm_bo_util.c             | 26 ++++----
 drivers/gpu/drm/ttm/ttm_bo_vm.c               |  2 +-
 drivers/gpu/drm/ttm/ttm_range_manager.c       | 28 ++++----
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           | 20 +++---
 drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c | 26 ++++----
 drivers/gpu/drm/vmwgfx/vmwgfx_thp.c           | 26 ++++----
 include/drm/ttm/ttm_bo_api.h                  |  6 +-
 include/drm/ttm/ttm_bo_driver.h               | 60 ++++++++---------
 23 files changed, 210 insertions(+), 210 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
index e24f421e5553..478f67498a17 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
@@ -517,7 +517,7 @@ int amdgpu_amdkfd_get_dmabuf_info(struct kgd_dev *kgd, int dma_buf_fd,
 uint64_t amdgpu_amdkfd_get_vram_usage(struct kgd_dev *kgd)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)kgd;
-	struct ttm_mem_type_manager *vram_man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
+	struct ttm_resource_manager *vram_man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
 
 	return amdgpu_vram_mgr_usage(vram_man);
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 9829640e1769..ecd051976bce 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -299,7 +299,7 @@ static void amdgpu_cs_get_threshold_for_moves(struct amdgpu_device *adev,
 {
 	s64 time_us, increment_us;
 	u64 free_vram, total_vram, used_vram;
-	struct ttm_mem_type_manager *vram_man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
+	struct ttm_resource_manager *vram_man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
 	/* Allow a maximum of 200 accumulated ms. This is basically per-IB
 	 * throttling.
 	 *
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index 71461d652fcc..8b600b804f34 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -25,13 +25,13 @@
 #include "amdgpu.h"
 
 struct amdgpu_gtt_mgr {
-	struct ttm_mem_type_manager manager;
+	struct ttm_resource_manager manager;
 	struct drm_mm mm;
 	spinlock_t lock;
 	atomic64_t available;
 };
 
-static inline struct amdgpu_gtt_mgr *to_gtt_mgr(struct ttm_mem_type_manager *man)
+static inline struct amdgpu_gtt_mgr *to_gtt_mgr(struct ttm_resource_manager *man)
 {
 	return container_of(man, struct amdgpu_gtt_mgr, manager);
 }
@@ -54,7 +54,7 @@ static ssize_t amdgpu_mem_info_gtt_total_show(struct device *dev,
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = ddev->dev_private;
-	struct ttm_mem_type_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_TT);
+	struct ttm_resource_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_TT);
 	return snprintf(buf, PAGE_SIZE, "%llu\n",
 			man->size * PAGE_SIZE);
 }
@@ -72,7 +72,7 @@ static ssize_t amdgpu_mem_info_gtt_used_show(struct device *dev,
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = ddev->dev_private;
-	struct ttm_mem_type_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_TT);
+	struct ttm_resource_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_TT);
 	return snprintf(buf, PAGE_SIZE, "%llu\n",
 			amdgpu_gtt_mgr_usage(man));
 }
@@ -82,7 +82,7 @@ static DEVICE_ATTR(mem_info_gtt_total, S_IRUGO,
 static DEVICE_ATTR(mem_info_gtt_used, S_IRUGO,
 	           amdgpu_mem_info_gtt_used_show, NULL);
 
-static const struct ttm_mem_type_manager_func amdgpu_gtt_mgr_func;
+static const struct ttm_resource_manager_func amdgpu_gtt_mgr_func;
 /**
  * amdgpu_gtt_mgr_init - init GTT manager and DRM MM
  *
@@ -93,7 +93,7 @@ static const struct ttm_mem_type_manager_func amdgpu_gtt_mgr_func;
  */
 int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
 {
-	struct ttm_mem_type_manager *man;
+	struct ttm_resource_manager *man;
 	struct amdgpu_gtt_mgr *mgr;
 	uint64_t start, size;
 	int ret;
@@ -108,7 +108,7 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
 	man->available_caching = TTM_PL_MASK_CACHING;
 	man->default_caching = TTM_PL_FLAG_CACHED;
 
-	ttm_mem_type_manager_init(man, gtt_size >> PAGE_SHIFT);
+	ttm_resource_manager_init(man, gtt_size >> PAGE_SHIFT);
 
 	start = AMDGPU_GTT_MAX_TRANSFER_SIZE * AMDGPU_GTT_NUM_TRANSFER_WINDOWS;
 	size = (adev->gmc.gart_size >> PAGE_SHIFT) - start;
@@ -128,7 +128,7 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
 	}
 
 	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_TT, &mgr->manager);
-	ttm_mem_type_manager_set_used(man, true);
+	ttm_resource_manager_set_used(man, true);
 	return 0;
 }
 
@@ -142,13 +142,13 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
  */
 void amdgpu_gtt_mgr_fini(struct amdgpu_device *adev)
 {
-	struct ttm_mem_type_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_TT);
+	struct ttm_resource_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_TT);
 	struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
 	int ret;
 
-	ttm_mem_type_manager_set_used(man, false);
+	ttm_resource_manager_set_used(man, false);
 
-	ret = ttm_mem_type_manager_force_list_clean(&adev->mman.bdev, man);
+	ret = ttm_resource_manager_force_list_clean(&adev->mman.bdev, man);
 	if (ret)
 		return;
 
@@ -159,7 +159,7 @@ void amdgpu_gtt_mgr_fini(struct amdgpu_device *adev)
 	device_remove_file(adev->dev, &dev_attr_mem_info_gtt_total);
 	device_remove_file(adev->dev, &dev_attr_mem_info_gtt_used);
 
-	ttm_mem_type_manager_cleanup(man);
+	ttm_resource_manager_cleanup(man);
 	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_TT, NULL);
 	kfree(mgr);
 }
@@ -186,7 +186,7 @@ bool amdgpu_gtt_mgr_has_gart_addr(struct ttm_mem_reg *mem)
  *
  * Dummy, allocate the node but no space for it yet.
  */
-static int amdgpu_gtt_mgr_new(struct ttm_mem_type_manager *man,
+static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
 			      struct ttm_buffer_object *tbo,
 			      const struct ttm_place *place,
 			      struct ttm_mem_reg *mem)
@@ -249,7 +249,7 @@ static int amdgpu_gtt_mgr_new(struct ttm_mem_type_manager *man,
  *
  * Free the allocated GTT again.
  */
-static void amdgpu_gtt_mgr_del(struct ttm_mem_type_manager *man,
+static void amdgpu_gtt_mgr_del(struct ttm_resource_manager *man,
 			       struct ttm_mem_reg *mem)
 {
 	struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
@@ -272,7 +272,7 @@ static void amdgpu_gtt_mgr_del(struct ttm_mem_type_manager *man,
  *
  * Return how many bytes are used in the GTT domain
  */
-uint64_t amdgpu_gtt_mgr_usage(struct ttm_mem_type_manager *man)
+uint64_t amdgpu_gtt_mgr_usage(struct ttm_resource_manager *man)
 {
 	struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
 	s64 result = man->size - atomic64_read(&mgr->available);
@@ -280,7 +280,7 @@ uint64_t amdgpu_gtt_mgr_usage(struct ttm_mem_type_manager *man)
 	return (result > 0 ? result : 0) * PAGE_SIZE;
 }
 
-int amdgpu_gtt_mgr_recover(struct ttm_mem_type_manager *man)
+int amdgpu_gtt_mgr_recover(struct ttm_resource_manager *man)
 {
 	struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
 	struct amdgpu_gtt_node *node;
@@ -307,7 +307,7 @@ int amdgpu_gtt_mgr_recover(struct ttm_mem_type_manager *man)
  *
  * Dump the table content using printk.
  */
-static void amdgpu_gtt_mgr_debug(struct ttm_mem_type_manager *man,
+static void amdgpu_gtt_mgr_debug(struct ttm_resource_manager *man,
 				 struct drm_printer *printer)
 {
 	struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
@@ -321,7 +321,7 @@ static void amdgpu_gtt_mgr_debug(struct ttm_mem_type_manager *man,
 		   amdgpu_gtt_mgr_usage(man) >> 20);
 }
 
-static const struct ttm_mem_type_manager_func amdgpu_gtt_mgr_func = {
+static const struct ttm_resource_manager_func amdgpu_gtt_mgr_func = {
 	.get_node = amdgpu_gtt_mgr_new,
 	.put_node = amdgpu_gtt_mgr_del,
 	.debug = amdgpu_gtt_mgr_debug
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index 594687cc99ac..2763bca163e3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -631,9 +631,9 @@ static int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file
 	}
 	case AMDGPU_INFO_MEMORY: {
 		struct drm_amdgpu_memory_info mem;
-		struct ttm_mem_type_manager *vram_man =
+		struct ttm_resource_manager *vram_man =
 			ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
-		struct ttm_mem_type_manager *gtt_man =
+		struct ttm_resource_manager *gtt_man =
 			ttm_manager_type(&adev->mman.bdev, TTM_PL_TT);
 		memset(&mem, 0, sizeof(mem));
 		mem.vram.total_heap_size = adev->gmc.real_vram_size;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index ced418cba2f7..ce98df5b0c21 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -442,7 +442,7 @@ void amdgpu_bo_free_kernel(struct amdgpu_bo **bo, u64 *gpu_addr,
 static bool amdgpu_bo_validate_size(struct amdgpu_device *adev,
 					  unsigned long size, u32 domain)
 {
-	struct ttm_mem_type_manager *man = NULL;
+	struct ttm_resource_manager *man = NULL;
 
 	/*
 	 * If GTT is part of requested domains the check must succeed to
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index b190d50dc9bb..cae7eada7215 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2030,7 +2030,7 @@ void amdgpu_ttm_fini(struct amdgpu_device *adev)
  */
 void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 {
-	struct ttm_mem_type_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
+	struct ttm_resource_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
 	uint64_t size;
 	int r;
 
@@ -2252,7 +2252,7 @@ static int amdgpu_mm_dump_table(struct seq_file *m, void *data)
 	unsigned ttm_pl = (uintptr_t)node->info_ent->data;
 	struct drm_device *dev = node->minor->dev;
 	struct amdgpu_device *adev = dev->dev_private;
-	struct ttm_mem_type_manager *man = ttm_manager_type(&adev->mman.bdev, ttm_pl);
+	struct ttm_resource_manager *man = ttm_manager_type(&adev->mman.bdev, ttm_pl);
 	struct drm_printer p = drm_seq_file_printer(m);
 
 	man->func->debug(man, &p);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index c01fdb3f0458..3db29ae1f802 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -73,8 +73,8 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev);
 void amdgpu_vram_mgr_fini(struct amdgpu_device *adev);
 
 bool amdgpu_gtt_mgr_has_gart_addr(struct ttm_mem_reg *mem);
-uint64_t amdgpu_gtt_mgr_usage(struct ttm_mem_type_manager *man);
-int amdgpu_gtt_mgr_recover(struct ttm_mem_type_manager *man);
+uint64_t amdgpu_gtt_mgr_usage(struct ttm_resource_manager *man);
+int amdgpu_gtt_mgr_recover(struct ttm_resource_manager *man);
 
 u64 amdgpu_vram_mgr_bo_visible_size(struct amdgpu_bo *bo);
 int amdgpu_vram_mgr_alloc_sgt(struct amdgpu_device *adev,
@@ -86,8 +86,8 @@ void amdgpu_vram_mgr_free_sgt(struct amdgpu_device *adev,
 			      struct device *dev,
 			      enum dma_data_direction dir,
 			      struct sg_table *sgt);
-uint64_t amdgpu_vram_mgr_usage(struct ttm_mem_type_manager *man);
-uint64_t amdgpu_vram_mgr_vis_usage(struct ttm_mem_type_manager *man);
+uint64_t amdgpu_vram_mgr_usage(struct ttm_resource_manager *man);
+uint64_t amdgpu_vram_mgr_vis_usage(struct ttm_resource_manager *man);
 
 int amdgpu_ttm_init(struct amdgpu_device *adev);
 void amdgpu_ttm_late_init(struct amdgpu_device *adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index 8cc44c3d2fdd..b227e380094f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -29,7 +29,7 @@
 #include "atom.h"
 
 struct amdgpu_vram_mgr {
-	struct ttm_mem_type_manager manager;
+	struct ttm_resource_manager manager;
 	struct drm_mm mm;
 	spinlock_t lock;
 	atomic64_t usage;
@@ -37,7 +37,7 @@ struct amdgpu_vram_mgr {
 	struct amdgpu_device *adev;
 };
 
-static inline struct amdgpu_vram_mgr *to_vram_mgr(struct ttm_mem_type_manager *man)
+static inline struct amdgpu_vram_mgr *to_vram_mgr(struct ttm_resource_manager *man)
 {
 	return container_of(man, struct amdgpu_vram_mgr, manager);
 }
@@ -89,7 +89,7 @@ static ssize_t amdgpu_mem_info_vram_used_show(struct device *dev,
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = ddev->dev_private;
-	struct ttm_mem_type_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
+	struct ttm_resource_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
 	return snprintf(buf, PAGE_SIZE, "%llu\n",
 			amdgpu_vram_mgr_usage(man));
 }
@@ -107,7 +107,7 @@ static ssize_t amdgpu_mem_info_vis_vram_used_show(struct device *dev,
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = ddev->dev_private;
-	struct ttm_mem_type_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
+	struct ttm_resource_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
 	return snprintf(buf, PAGE_SIZE, "%llu\n",
 			amdgpu_vram_mgr_vis_usage(man));
 }
@@ -165,7 +165,7 @@ static const struct attribute *amdgpu_vram_mgr_attributes[] = {
 	NULL
 };
 
-static const struct ttm_mem_type_manager_func amdgpu_vram_mgr_func;
+static const struct ttm_resource_manager_func amdgpu_vram_mgr_func;
 
 /**
  * amdgpu_vram_mgr_init - init VRAM manager and DRM MM
@@ -177,7 +177,7 @@ static const struct ttm_mem_type_manager_func amdgpu_vram_mgr_func;
  */
 int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
 {
-	struct ttm_mem_type_manager *man;
+	struct ttm_resource_manager *man;
 	struct amdgpu_vram_mgr *mgr;
 	int ret;
 
@@ -190,7 +190,7 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
 	man->available_caching = TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC;
 	man->default_caching = TTM_PL_FLAG_WC;
 
-	ttm_mem_type_manager_init(man, adev->gmc.real_vram_size >> PAGE_SHIFT);
+	ttm_resource_manager_init(man, adev->gmc.real_vram_size >> PAGE_SHIFT);
 
 	man->func = &amdgpu_vram_mgr_func;
 
@@ -205,7 +205,7 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
 		DRM_ERROR("Failed to register sysfs\n");
 
 	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_VRAM, &mgr->manager);
-	ttm_mem_type_manager_set_used(man, true);
+	ttm_resource_manager_set_used(man, true);
 	return 0;
 }
 
@@ -219,13 +219,13 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
  */
 void amdgpu_vram_mgr_fini(struct amdgpu_device *adev)
 {
-	struct ttm_mem_type_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
+	struct ttm_resource_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
 	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
 	int ret;
 
-	ttm_mem_type_manager_set_used(man, false);
+	ttm_resource_manager_set_used(man, false);
 
-	ret = ttm_mem_type_manager_force_list_clean(&adev->mman.bdev, man);
+	ret = ttm_resource_manager_force_list_clean(&adev->mman.bdev, man);
 	if (ret)
 		return;
 
@@ -235,7 +235,7 @@ void amdgpu_vram_mgr_fini(struct amdgpu_device *adev)
 
 	sysfs_remove_files(&adev->dev->kobj, amdgpu_vram_mgr_attributes);
 
-	ttm_mem_type_manager_cleanup(man);
+	ttm_resource_manager_cleanup(man);
 	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_VRAM, NULL);
 	kfree(mgr);
 }
@@ -321,7 +321,7 @@ static void amdgpu_vram_mgr_virt_start(struct ttm_mem_reg *mem,
  *
  * Allocate VRAM for the given BO.
  */
-static int amdgpu_vram_mgr_new(struct ttm_mem_type_manager *man,
+static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 			       struct ttm_buffer_object *tbo,
 			       const struct ttm_place *place,
 			       struct ttm_mem_reg *mem)
@@ -439,7 +439,7 @@ static int amdgpu_vram_mgr_new(struct ttm_mem_type_manager *man,
  *
  * Free the allocated VRAM again.
  */
-static void amdgpu_vram_mgr_del(struct ttm_mem_type_manager *man,
+static void amdgpu_vram_mgr_del(struct ttm_resource_manager *man,
 				struct ttm_mem_reg *mem)
 {
 	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
@@ -573,7 +573,7 @@ void amdgpu_vram_mgr_free_sgt(struct amdgpu_device *adev,
  *
  * Returns how many bytes are used in this domain.
  */
-uint64_t amdgpu_vram_mgr_usage(struct ttm_mem_type_manager *man)
+uint64_t amdgpu_vram_mgr_usage(struct ttm_resource_manager *man)
 {
 	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
 
@@ -587,7 +587,7 @@ uint64_t amdgpu_vram_mgr_usage(struct ttm_mem_type_manager *man)
  *
  * Returns how many bytes are used in the visible part of VRAM
  */
-uint64_t amdgpu_vram_mgr_vis_usage(struct ttm_mem_type_manager *man)
+uint64_t amdgpu_vram_mgr_vis_usage(struct ttm_resource_manager *man)
 {
 	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
 
@@ -602,7 +602,7 @@ uint64_t amdgpu_vram_mgr_vis_usage(struct ttm_mem_type_manager *man)
  *
  * Dump the table content using printk.
  */
-static void amdgpu_vram_mgr_debug(struct ttm_mem_type_manager *man,
+static void amdgpu_vram_mgr_debug(struct ttm_resource_manager *man,
 				  struct drm_printer *printer)
 {
 	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
@@ -616,7 +616,7 @@ static void amdgpu_vram_mgr_debug(struct ttm_mem_type_manager *man,
 		   amdgpu_vram_mgr_vis_usage(man) >> 20);
 }
 
-static const struct ttm_mem_type_manager_func amdgpu_vram_mgr_func = {
+static const struct ttm_resource_manager_func amdgpu_vram_mgr_func = {
 	.get_node	= amdgpu_vram_mgr_new,
 	.put_node	= amdgpu_vram_mgr_del,
 	.debug		= amdgpu_vram_mgr_debug
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 2187787f397e..e3660d00987d 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -1075,10 +1075,10 @@ static int drm_vram_mm_debugfs(struct seq_file *m, void *data)
 {
 	struct drm_info_node *node = (struct drm_info_node *) m->private;
 	struct drm_vram_mm *vmm = node->minor->dev->vram_mm;
-	struct ttm_mem_type_manager *man = ttm_manager_type(&vmm->bdev, TTM_PL_VRAM);
+	struct ttm_resource_manager *man = ttm_manager_type(&vmm->bdev, TTM_PL_VRAM);
 	struct drm_printer p = drm_seq_file_printer(m);
 
-	ttm_mem_type_manager_debug(man, &p);
+	ttm_resource_manager_debug(man, &p);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index 38a0e4bd16f7..d6ad0977dc7d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -32,13 +32,13 @@
 #include <core/tegra.h>
 
 static void
-nouveau_manager_del(struct ttm_mem_type_manager *man, struct ttm_mem_reg *reg)
+nouveau_manager_del(struct ttm_resource_manager *man, struct ttm_mem_reg *reg)
 {
 	nouveau_mem_del(reg);
 }
 
 static int
-nouveau_vram_manager_new(struct ttm_mem_type_manager *man,
+nouveau_vram_manager_new(struct ttm_resource_manager *man,
 			 struct ttm_buffer_object *bo,
 			 const struct ttm_place *place,
 			 struct ttm_mem_reg *reg)
@@ -63,13 +63,13 @@ nouveau_vram_manager_new(struct ttm_mem_type_manager *man,
 	return 0;
 }
 
-const struct ttm_mem_type_manager_func nouveau_vram_manager = {
+const struct ttm_resource_manager_func nouveau_vram_manager = {
 	.get_node = nouveau_vram_manager_new,
 	.put_node = nouveau_manager_del,
 };
 
 static int
-nouveau_gart_manager_new(struct ttm_mem_type_manager *man,
+nouveau_gart_manager_new(struct ttm_resource_manager *man,
 			 struct ttm_buffer_object *bo,
 			 const struct ttm_place *place,
 			 struct ttm_mem_reg *reg)
@@ -86,13 +86,13 @@ nouveau_gart_manager_new(struct ttm_mem_type_manager *man,
 	return 0;
 }
 
-const struct ttm_mem_type_manager_func nouveau_gart_manager = {
+const struct ttm_resource_manager_func nouveau_gart_manager = {
 	.get_node = nouveau_gart_manager_new,
 	.put_node = nouveau_manager_del,
 };
 
 static int
-nv04_gart_manager_new(struct ttm_mem_type_manager *man,
+nv04_gart_manager_new(struct ttm_resource_manager *man,
 		      struct ttm_buffer_object *bo,
 		      const struct ttm_place *place,
 		      struct ttm_mem_reg *reg)
@@ -118,7 +118,7 @@ nv04_gart_manager_new(struct ttm_mem_type_manager *man,
 	return 0;
 }
 
-const struct ttm_mem_type_manager_func nv04_gart_manager = {
+const struct ttm_resource_manager_func nv04_gart_manager = {
 	.get_node = nv04_gart_manager_new,
 	.put_node = nouveau_manager_del,
 };
@@ -160,7 +160,7 @@ nouveau_ttm_init_vram(struct nouveau_drm *drm)
 	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA) {
 		/* Some BARs do not support being ioremapped WC */
 		const u8 type = mmu->type[drm->ttm.type_vram].type;
-		struct ttm_mem_type_manager *man = kzalloc(sizeof(struct ttm_mem_type_manager), GFP_KERNEL);
+		struct ttm_resource_manager *man = kzalloc(sizeof(struct ttm_resource_manager), GFP_KERNEL);
 		if (!man)
 			return -ENOMEM;
 
@@ -175,10 +175,10 @@ nouveau_ttm_init_vram(struct nouveau_drm *drm)
 		man->func = &nouveau_vram_manager;
 		man->use_io_reserve_lru = true;
 
-		ttm_mem_type_manager_init(man,
+		ttm_resource_manager_init(man,
 					  drm->gem.vram_available >> PAGE_SHIFT);
 		ttm_set_driver_manager(&drm->ttm.bdev, TTM_PL_VRAM, man);
-		ttm_mem_type_manager_set_used(man, true);
+		ttm_resource_manager_set_used(man, true);
 		return 0;
 	} else {
 		return ttm_range_man_init(&drm->ttm.bdev, TTM_PL_VRAM,
@@ -191,12 +191,12 @@ nouveau_ttm_init_vram(struct nouveau_drm *drm)
 static void
 nouveau_ttm_fini_vram(struct nouveau_drm *drm)
 {
-	struct ttm_mem_type_manager *man = ttm_manager_type(&drm->ttm.bdev, TTM_PL_VRAM);
+	struct ttm_resource_manager *man = ttm_manager_type(&drm->ttm.bdev, TTM_PL_VRAM);
 
 	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA) {
-		ttm_mem_type_manager_set_used(man, false);
-		ttm_mem_type_manager_force_list_clean(&drm->ttm.bdev, man);
-		ttm_mem_type_manager_cleanup(man);
+		ttm_resource_manager_set_used(man, false);
+		ttm_resource_manager_force_list_clean(&drm->ttm.bdev, man);
+		ttm_resource_manager_cleanup(man);
 		ttm_set_driver_manager(&drm->ttm.bdev, TTM_PL_VRAM, NULL);
 		kfree(man);
 	} else
@@ -206,10 +206,10 @@ nouveau_ttm_fini_vram(struct nouveau_drm *drm)
 static int
 nouveau_ttm_init_gtt(struct nouveau_drm *drm)
 {
-	struct ttm_mem_type_manager *man;
+	struct ttm_resource_manager *man;
 	unsigned long size_pages = drm->gem.gart_available >> PAGE_SHIFT;
 	unsigned available_caching, default_caching;
-	const struct ttm_mem_type_manager_func *func = NULL;
+	const struct ttm_resource_manager_func *func = NULL;
 	if (drm->agp.bridge) {
 		available_caching = TTM_PL_FLAG_UNCACHED |
 			TTM_PL_FLAG_WC;
@@ -229,7 +229,7 @@ nouveau_ttm_init_gtt(struct nouveau_drm *drm)
 					  true,
 					  size_pages);
 
-	man = kzalloc(sizeof(struct ttm_mem_type_manager), GFP_KERNEL);
+	man = kzalloc(sizeof(struct ttm_resource_manager), GFP_KERNEL);
 	if (!man)
 		return -ENOMEM;
 
@@ -237,24 +237,24 @@ nouveau_ttm_init_gtt(struct nouveau_drm *drm)
 	man->available_caching = available_caching;
 	man->default_caching = default_caching;
 	man->use_tt = true;
-	ttm_mem_type_manager_init(man, size_pages);
+	ttm_resource_manager_init(man, size_pages);
 	ttm_set_driver_manager(&drm->ttm.bdev, TTM_PL_TT, man);
-	ttm_mem_type_manager_set_used(man, true);
+	ttm_resource_manager_set_used(man, true);
 	return 0;
 }
 
 static void
 nouveau_ttm_fini_gtt(struct nouveau_drm *drm)
 {
-	struct ttm_mem_type_manager *man = ttm_manager_type(&drm->ttm.bdev, TTM_PL_TT);
+	struct ttm_resource_manager *man = ttm_manager_type(&drm->ttm.bdev, TTM_PL_TT);
 
 	if (drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA &&
 	    drm->agp.bridge)
 		ttm_range_man_fini(&drm->ttm.bdev, TTM_PL_TT);
 	else {
-		ttm_mem_type_manager_set_used(man, false);
-		ttm_mem_type_manager_force_list_clean(&drm->ttm.bdev, man);
-		ttm_mem_type_manager_cleanup(man);
+		ttm_resource_manager_set_used(man, false);
+		ttm_resource_manager_force_list_clean(&drm->ttm.bdev, man);
+		ttm_resource_manager_cleanup(man);
 		ttm_set_driver_manager(&drm->ttm.bdev, TTM_PL_TT, NULL);
 		kfree(man);
 	}
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.h b/drivers/gpu/drm/nouveau/nouveau_ttm.h
index 085280754b3e..eaf25461cd91 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.h
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.h
@@ -8,9 +8,9 @@ nouveau_bdev(struct ttm_bo_device *bd)
 	return container_of(bd, struct nouveau_drm, ttm.bdev);
 }
 
-extern const struct ttm_mem_type_manager_func nouveau_vram_manager;
-extern const struct ttm_mem_type_manager_func nouveau_gart_manager;
-extern const struct ttm_mem_type_manager_func nv04_gart_manager;
+extern const struct ttm_resource_manager_func nouveau_vram_manager;
+extern const struct ttm_resource_manager_func nouveau_gart_manager;
+extern const struct ttm_resource_manager_func nv04_gart_manager;
 
 struct ttm_tt *nouveau_sgdma_create_ttm(struct ttm_buffer_object *bo,
 					u32 page_flags);
diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
index b7365b2e4c7f..1c06fe780815 100644
--- a/drivers/gpu/drm/qxl/qxl_ttm.c
+++ b/drivers/gpu/drm/qxl/qxl_ttm.c
@@ -274,10 +274,10 @@ void qxl_ttm_fini(struct qxl_device *qdev)
 static int qxl_mm_dump_table(struct seq_file *m, void *data)
 {
 	struct drm_info_node *node = (struct drm_info_node *)m->private;
-	struct ttm_mem_type_manager *man = (struct ttm_mem_type_manager *)node->info_ent->data;
+	struct ttm_resource_manager *man = (struct ttm_resource_manager *)node->info_ent->data;
 	struct drm_printer p = drm_seq_file_printer(m);
 
-	ttm_mem_type_manager_debug(man, &p);
+	ttm_resource_manager_debug(man, &p);
 	return 0;
 }
 #endif
diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
index 3ec028dba739..7f5dfe04789e 100644
--- a/drivers/gpu/drm/radeon/radeon_gem.c
+++ b/drivers/gpu/drm/radeon/radeon_gem.c
@@ -224,7 +224,7 @@ int radeon_gem_info_ioctl(struct drm_device *dev, void *data,
 {
 	struct radeon_device *rdev = dev->dev_private;
 	struct drm_radeon_gem_info *args = data;
-	struct ttm_mem_type_manager *man;
+	struct ttm_resource_manager *man;
 
 	man = ttm_manager_type(&rdev->mman.bdev, TTM_PL_VRAM);
 
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 474d2161da1e..05b5f29f2b61 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -836,7 +836,7 @@ void radeon_ttm_fini(struct radeon_device *rdev)
  * isn't running */
 void radeon_ttm_set_active_vram_size(struct radeon_device *rdev, u64 size)
 {
-	struct ttm_mem_type_manager *man;
+	struct ttm_resource_manager *man;
 
 	if (!rdev->mman.initialized)
 		return;
@@ -895,7 +895,7 @@ static int radeon_mm_dump_table(struct seq_file *m, void *data)
 	unsigned ttm_pl = *(int*)node->info_ent->data;
 	struct drm_device *dev = node->minor->dev;
 	struct radeon_device *rdev = dev->dev_private;
-	struct ttm_mem_type_manager *man = ttm_manager_type(&rdev->mman.bdev, ttm_pl);
+	struct ttm_resource_manager *man = ttm_manager_type(&rdev->mman.bdev, ttm_pl);
 	struct drm_printer p = drm_seq_file_printer(m);
 
 	man->func->debug(man, &p);
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 7d10abae9a60..48840a3cf4c4 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -77,7 +77,7 @@ static inline int ttm_mem_type_from_place(const struct ttm_place *place,
 	return 0;
 }
 
-void ttm_mem_type_manager_debug(struct ttm_mem_type_manager *man,
+void ttm_resource_manager_debug(struct ttm_resource_manager *man,
 				struct drm_printer *p)
 {
 	drm_printf(p, "    use_type: %d\n", man->use_type);
@@ -88,14 +88,14 @@ void ttm_mem_type_manager_debug(struct ttm_mem_type_manager *man,
 	if (man->func && man->func->debug)
 		(*man->func->debug)(man, p);
 }
-EXPORT_SYMBOL(ttm_mem_type_manager_debug);
+EXPORT_SYMBOL(ttm_resource_manager_debug);
 
 static void ttm_bo_mem_space_debug(struct ttm_buffer_object *bo,
 					struct ttm_placement *placement)
 {
 	struct drm_printer p = drm_debug_printer(TTM_PFX);
 	int i, ret, mem_type;
-	struct ttm_mem_type_manager *man;
+	struct ttm_resource_manager *man;
 
 	drm_printf(&p, "No space for %p (%lu pages, %luK, %luM)\n",
 		   bo, bo->mem.num_pages, bo->mem.size >> 10,
@@ -108,7 +108,7 @@ static void ttm_bo_mem_space_debug(struct ttm_buffer_object *bo,
 		drm_printf(&p, "  placement[%d]=0x%08X (%d)\n",
 			   i, placement->placement[i].flags, mem_type);
 		man = ttm_manager_type(bo->bdev, mem_type);
-		ttm_mem_type_manager_debug(man, &p);
+		ttm_resource_manager_debug(man, &p);
 	}
 }
 
@@ -148,7 +148,7 @@ static void ttm_bo_add_mem_to_lru(struct ttm_buffer_object *bo,
 				  struct ttm_mem_reg *mem)
 {
 	struct ttm_bo_device *bdev = bo->bdev;
-	struct ttm_mem_type_manager *man;
+	struct ttm_resource_manager *man;
 
 	if (!list_empty(&bo->lru))
 		return;
@@ -223,7 +223,7 @@ void ttm_bo_bulk_move_lru_tail(struct ttm_lru_bulk_move *bulk)
 
 	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
 		struct ttm_lru_bulk_move_pos *pos = &bulk->tt[i];
-		struct ttm_mem_type_manager *man;
+		struct ttm_resource_manager *man;
 
 		if (!pos->first)
 			continue;
@@ -238,7 +238,7 @@ void ttm_bo_bulk_move_lru_tail(struct ttm_lru_bulk_move *bulk)
 
 	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
 		struct ttm_lru_bulk_move_pos *pos = &bulk->vram[i];
-		struct ttm_mem_type_manager *man;
+		struct ttm_resource_manager *man;
 
 		if (!pos->first)
 			continue;
@@ -272,8 +272,8 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
 				  struct ttm_operation_ctx *ctx)
 {
 	struct ttm_bo_device *bdev = bo->bdev;
-	struct ttm_mem_type_manager *old_man = ttm_manager_type(bdev, bo->mem.mem_type);
-	struct ttm_mem_type_manager *new_man = ttm_manager_type(bdev, mem->mem_type);
+	struct ttm_resource_manager *old_man = ttm_manager_type(bdev, bo->mem.mem_type);
+	struct ttm_resource_manager *new_man = ttm_manager_type(bdev, mem->mem_type);
 	int ret;
 
 	ret = ttm_mem_io_lock(old_man, true);
@@ -551,7 +551,7 @@ static void ttm_bo_release(struct kref *kref)
 	struct ttm_buffer_object *bo =
 	    container_of(kref, struct ttm_buffer_object, kref);
 	struct ttm_bo_device *bdev = bo->bdev;
-	struct ttm_mem_type_manager *man = ttm_manager_type(bdev, bo->mem.mem_type);
+	struct ttm_resource_manager *man = ttm_manager_type(bdev, bo->mem.mem_type);
 	size_t acc_size = bo->acc_size;
 	int ret;
 
@@ -768,7 +768,7 @@ static int ttm_mem_evict_wait_busy(struct ttm_buffer_object *busy_bo,
 }
 
 static int ttm_mem_evict_first(struct ttm_bo_device *bdev,
-			       struct ttm_mem_type_manager *man,
+			       struct ttm_resource_manager *man,
 			       const struct ttm_place *place,
 			       struct ttm_operation_ctx *ctx,
 			       struct ww_acquire_ctx *ticket)
@@ -843,7 +843,7 @@ static int ttm_bo_mem_get(struct ttm_buffer_object *bo,
 			  const struct ttm_place *place,
 			  struct ttm_mem_reg *mem)
 {
-	struct ttm_mem_type_manager *man = ttm_manager_type(bo->bdev, mem->mem_type);
+	struct ttm_resource_manager *man = ttm_manager_type(bo->bdev, mem->mem_type);
 
 	mem->mm_node = NULL;
 	if (!man->func || !man->func->get_node)
@@ -854,7 +854,7 @@ static int ttm_bo_mem_get(struct ttm_buffer_object *bo,
 
 void ttm_bo_mem_put(struct ttm_buffer_object *bo, struct ttm_mem_reg *mem)
 {
-	struct ttm_mem_type_manager *man = ttm_manager_type(bo->bdev, mem->mem_type);
+	struct ttm_resource_manager *man = ttm_manager_type(bo->bdev, mem->mem_type);
 
 	if (!man->func || !man->func->put_node)
 		return;
@@ -869,7 +869,7 @@ EXPORT_SYMBOL(ttm_bo_mem_put);
  * Add the last move fence to the BO and reserve a new shared slot.
  */
 static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
-				 struct ttm_mem_type_manager *man,
+				 struct ttm_resource_manager *man,
 				 struct ttm_mem_reg *mem,
 				 bool no_wait_gpu)
 {
@@ -911,7 +911,7 @@ static int ttm_bo_mem_force_space(struct ttm_buffer_object *bo,
 				  struct ttm_operation_ctx *ctx)
 {
 	struct ttm_bo_device *bdev = bo->bdev;
-	struct ttm_mem_type_manager *man = ttm_manager_type(bdev, mem->mem_type);
+	struct ttm_resource_manager *man = ttm_manager_type(bdev, mem->mem_type);
 	struct ww_acquire_ctx *ticket;
 	int ret;
 
@@ -931,7 +931,7 @@ static int ttm_bo_mem_force_space(struct ttm_buffer_object *bo,
 	return ttm_bo_add_move_fence(bo, man, mem, ctx->no_wait_gpu);
 }
 
-static uint32_t ttm_bo_select_caching(struct ttm_mem_type_manager *man,
+static uint32_t ttm_bo_select_caching(struct ttm_resource_manager *man,
 				      uint32_t cur_placement,
 				      uint32_t proposed_placement)
 {
@@ -956,7 +956,7 @@ static uint32_t ttm_bo_select_caching(struct ttm_mem_type_manager *man,
 	return result;
 }
 
-static bool ttm_bo_mt_compatible(struct ttm_mem_type_manager *man,
+static bool ttm_bo_mt_compatible(struct ttm_resource_manager *man,
 				 uint32_t mem_type,
 				 const struct ttm_place *place,
 				 uint32_t *masked_placement)
@@ -993,7 +993,7 @@ static int ttm_bo_mem_placement(struct ttm_buffer_object *bo,
 {
 	struct ttm_bo_device *bdev = bo->bdev;
 	uint32_t mem_type = TTM_PL_SYSTEM;
-	struct ttm_mem_type_manager *man;
+	struct ttm_resource_manager *man;
 	uint32_t cur_flags = 0;
 	int ret;
 
@@ -1002,7 +1002,7 @@ static int ttm_bo_mem_placement(struct ttm_buffer_object *bo,
 		return ret;
 
 	man = ttm_manager_type(bdev, mem_type);
-	if (!man || !ttm_mem_type_manager_used(man))
+	if (!man || !ttm_resource_manager_used(man))
 		return -EBUSY;
 
 	if (!ttm_bo_mt_compatible(man, mem_type, place, &cur_flags))
@@ -1049,7 +1049,7 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
 
 	for (i = 0; i < placement->num_placement; ++i) {
 		const struct ttm_place *place = &placement->placement[i];
-		struct ttm_mem_type_manager *man;
+		struct ttm_resource_manager *man;
 
 		ret = ttm_bo_mem_placement(bo, place, mem, ctx);
 		if (ret == -EBUSY)
@@ -1406,8 +1406,8 @@ int ttm_bo_create(struct ttm_bo_device *bdev,
 }
 EXPORT_SYMBOL(ttm_bo_create);
 
-int ttm_mem_type_manager_force_list_clean(struct ttm_bo_device *bdev,
-					  struct ttm_mem_type_manager *man)
+int ttm_resource_manager_force_list_clean(struct ttm_bo_device *bdev,
+					  struct ttm_resource_manager *man)
 {
 	struct ttm_operation_ctx ctx = {
 		.interruptible = false,
@@ -1449,12 +1449,12 @@ int ttm_mem_type_manager_force_list_clean(struct ttm_bo_device *bdev,
 
 	return 0;
 }
-EXPORT_SYMBOL(ttm_mem_type_manager_force_list_clean);
+EXPORT_SYMBOL(ttm_resource_manager_force_list_clean);
 
 
 int ttm_bo_evict_mm(struct ttm_bo_device *bdev, unsigned mem_type)
 {
-	struct ttm_mem_type_manager *man = ttm_manager_type(bdev, mem_type);
+	struct ttm_resource_manager *man = ttm_manager_type(bdev, mem_type);
 
 	if (mem_type == 0 || mem_type >= TTM_NUM_MEM_TYPES) {
 		pr_err("Illegal memory manager memory type %u\n", mem_type);
@@ -1466,11 +1466,11 @@ int ttm_bo_evict_mm(struct ttm_bo_device *bdev, unsigned mem_type)
 		return 0;
 	}
 
-	return ttm_mem_type_manager_force_list_clean(bdev, man);
+	return ttm_resource_manager_force_list_clean(bdev, man);
 }
 EXPORT_SYMBOL(ttm_bo_evict_mm);
 
-void ttm_mem_type_manager_init(struct ttm_mem_type_manager *man,
+void ttm_resource_manager_init(struct ttm_resource_manager *man,
 			       unsigned long p_size)
 {
 	unsigned i;
@@ -1485,7 +1485,7 @@ void ttm_mem_type_manager_init(struct ttm_mem_type_manager *man,
 		INIT_LIST_HEAD(&man->lru[i]);
 	man->move = NULL;
 }
-EXPORT_SYMBOL(ttm_mem_type_manager_init);
+EXPORT_SYMBOL(ttm_resource_manager_init);
 
 static void ttm_bo_global_kobj_release(struct kobject *kobj)
 {
@@ -1552,10 +1552,10 @@ int ttm_bo_device_release(struct ttm_bo_device *bdev)
 	struct ttm_bo_global *glob = &ttm_bo_glob;
 	int ret = 0;
 	unsigned i;
-	struct ttm_mem_type_manager *man;
+	struct ttm_resource_manager *man;
 
 	man = ttm_manager_type(bdev, TTM_PL_SYSTEM);
-	ttm_mem_type_manager_set_used(man, false);
+	ttm_resource_manager_set_used(man, false);
 	ttm_set_driver_manager(bdev, TTM_PL_SYSTEM, NULL);
 
 	mutex_lock(&ttm_global_mutex);
@@ -1582,7 +1582,7 @@ EXPORT_SYMBOL(ttm_bo_device_release);
 
 static void ttm_bo_init_sysman(struct ttm_bo_device *bdev)
 {
-	struct ttm_mem_type_manager *man = &bdev->sysman;
+	struct ttm_resource_manager *man = &bdev->sysman;
 
 	/*
 	 * Initialize the system memory buffer type.
@@ -1592,9 +1592,9 @@ static void ttm_bo_init_sysman(struct ttm_bo_device *bdev)
 	man->available_caching = TTM_PL_MASK_CACHING;
 	man->default_caching = TTM_PL_FLAG_CACHED;
 
-	ttm_mem_type_manager_init(man, 0);
+	ttm_resource_manager_init(man, 0);
 	ttm_set_driver_manager(bdev, TTM_PL_SYSTEM, man);
-	ttm_mem_type_manager_set_used(man, true);
+	ttm_resource_manager_set_used(man, true);
 }
 
 int ttm_bo_device_init(struct ttm_bo_device *bdev,
@@ -1645,7 +1645,7 @@ void ttm_bo_unmap_virtual_locked(struct ttm_buffer_object *bo)
 void ttm_bo_unmap_virtual(struct ttm_buffer_object *bo)
 {
 	struct ttm_bo_device *bdev = bo->bdev;
-	struct ttm_mem_type_manager *man = ttm_manager_type(bdev, bo->mem.mem_type);
+	struct ttm_resource_manager *man = ttm_manager_type(bdev, bo->mem.mem_type);
 
 	ttm_mem_io_lock(man, false);
 	ttm_bo_unmap_virtual_locked(bo);
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 879c8ded0cd8..8ef0de8e36c5 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -91,7 +91,7 @@ int ttm_bo_move_ttm(struct ttm_buffer_object *bo,
 }
 EXPORT_SYMBOL(ttm_bo_move_ttm);
 
-int ttm_mem_io_lock(struct ttm_mem_type_manager *man, bool interruptible)
+int ttm_mem_io_lock(struct ttm_resource_manager *man, bool interruptible)
 {
 	if (likely(!man->use_io_reserve_lru))
 		return 0;
@@ -103,7 +103,7 @@ int ttm_mem_io_lock(struct ttm_mem_type_manager *man, bool interruptible)
 	return 0;
 }
 
-void ttm_mem_io_unlock(struct ttm_mem_type_manager *man)
+void ttm_mem_io_unlock(struct ttm_resource_manager *man)
 {
 	if (likely(!man->use_io_reserve_lru))
 		return;
@@ -111,7 +111,7 @@ void ttm_mem_io_unlock(struct ttm_mem_type_manager *man)
 	mutex_unlock(&man->io_reserve_mutex);
 }
 
-static int ttm_mem_io_evict(struct ttm_mem_type_manager *man)
+static int ttm_mem_io_evict(struct ttm_resource_manager *man)
 {
 	struct ttm_buffer_object *bo;
 
@@ -129,7 +129,7 @@ static int ttm_mem_io_evict(struct ttm_mem_type_manager *man)
 int ttm_mem_io_reserve(struct ttm_bo_device *bdev,
 		       struct ttm_mem_reg *mem)
 {
-	struct ttm_mem_type_manager *man = ttm_manager_type(bdev, mem->mem_type);
+	struct ttm_resource_manager *man = ttm_manager_type(bdev, mem->mem_type);
 	int ret;
 
 	if (mem->bus.io_reserved_count++)
@@ -162,7 +162,7 @@ void ttm_mem_io_free(struct ttm_bo_device *bdev,
 
 int ttm_mem_io_reserve_vm(struct ttm_buffer_object *bo)
 {
-	struct ttm_mem_type_manager *man = ttm_manager_type(bo->bdev, bo->mem.mem_type);
+	struct ttm_resource_manager *man = ttm_manager_type(bo->bdev, bo->mem.mem_type);
 	struct ttm_mem_reg *mem = &bo->mem;
 	int ret;
 
@@ -195,7 +195,7 @@ static int ttm_mem_reg_ioremap(struct ttm_bo_device *bdev,
 			       struct ttm_mem_reg *mem,
 			       void **virtual)
 {
-	struct ttm_mem_type_manager *man = ttm_manager_type(bdev, mem->mem_type);
+	struct ttm_resource_manager *man = ttm_manager_type(bdev, mem->mem_type);
 	int ret;
 	void *addr;
 
@@ -230,7 +230,7 @@ static void ttm_mem_reg_iounmap(struct ttm_bo_device *bdev,
 				struct ttm_mem_reg *mem,
 				void *virtual)
 {
-	struct ttm_mem_type_manager *man;
+	struct ttm_resource_manager *man;
 
 	man = ttm_manager_type(bdev, mem->mem_type);
 
@@ -303,7 +303,7 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
 		       struct ttm_mem_reg *new_mem)
 {
 	struct ttm_bo_device *bdev = bo->bdev;
-	struct ttm_mem_type_manager *man = ttm_manager_type(bdev, new_mem->mem_type);
+	struct ttm_resource_manager *man = ttm_manager_type(bdev, new_mem->mem_type);
 	struct ttm_tt *ttm = bo->ttm;
 	struct ttm_mem_reg *old_mem = &bo->mem;
 	struct ttm_mem_reg old_copy = *old_mem;
@@ -570,7 +570,7 @@ int ttm_bo_kmap(struct ttm_buffer_object *bo,
 		unsigned long start_page, unsigned long num_pages,
 		struct ttm_bo_kmap_obj *map)
 {
-	struct ttm_mem_type_manager *man =
+	struct ttm_resource_manager *man =
 		ttm_manager_type(bo->bdev, bo->mem.mem_type);
 	unsigned long offset, size;
 	int ret;
@@ -600,7 +600,7 @@ EXPORT_SYMBOL(ttm_bo_kmap);
 void ttm_bo_kunmap(struct ttm_bo_kmap_obj *map)
 {
 	struct ttm_buffer_object *bo = map->bo;
-	struct ttm_mem_type_manager *man =
+	struct ttm_resource_manager *man =
 		ttm_manager_type(bo->bdev, bo->mem.mem_type);
 
 	if (!map->virtual)
@@ -634,7 +634,7 @@ int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
 			      struct ttm_mem_reg *new_mem)
 {
 	struct ttm_bo_device *bdev = bo->bdev;
-	struct ttm_mem_type_manager *man = ttm_manager_type(bdev, new_mem->mem_type);
+	struct ttm_resource_manager *man = ttm_manager_type(bdev, new_mem->mem_type);
 	struct ttm_mem_reg *old_mem = &bo->mem;
 	int ret;
 	struct ttm_buffer_object *ghost_obj;
@@ -697,8 +697,8 @@ int ttm_bo_pipeline_move(struct ttm_buffer_object *bo,
 	struct ttm_bo_device *bdev = bo->bdev;
 	struct ttm_mem_reg *old_mem = &bo->mem;
 
-	struct ttm_mem_type_manager *from = ttm_manager_type(bdev, old_mem->mem_type);
-	struct ttm_mem_type_manager *to = ttm_manager_type(bdev, new_mem->mem_type);
+	struct ttm_resource_manager *from = ttm_manager_type(bdev, old_mem->mem_type);
+	struct ttm_resource_manager *to = ttm_manager_type(bdev, new_mem->mem_type);
 
 	int ret;
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index 5ae679184eb5..c8efceef015d 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -281,7 +281,7 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
 	pgoff_t i;
 	vm_fault_t ret = VM_FAULT_NOPAGE;
 	unsigned long address = vmf->address;
-	struct ttm_mem_type_manager *man =
+	struct ttm_resource_manager *man =
 		ttm_manager_type(bdev, bo->mem.mem_type);
 
 	/*
diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
index 52d9a0ed7165..22de9f209449 100644
--- a/drivers/gpu/drm/ttm/ttm_range_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
@@ -44,17 +44,17 @@
  */
 
 struct ttm_range_manager {
-	struct ttm_mem_type_manager manager;
+	struct ttm_resource_manager manager;
 	struct drm_mm mm;
 	spinlock_t lock;
 };
 
-static inline struct ttm_range_manager *to_range_manager(struct ttm_mem_type_manager *man)
+static inline struct ttm_range_manager *to_range_manager(struct ttm_resource_manager *man)
 {
 	return container_of(man, struct ttm_range_manager, manager);
 }
 
-static int ttm_range_man_get_node(struct ttm_mem_type_manager *man,
+static int ttm_range_man_get_node(struct ttm_resource_manager *man,
 				  struct ttm_buffer_object *bo,
 				  const struct ttm_place *place,
 				  struct ttm_mem_reg *mem)
@@ -95,7 +95,7 @@ static int ttm_range_man_get_node(struct ttm_mem_type_manager *man,
 	return ret;
 }
 
-static void ttm_range_man_put_node(struct ttm_mem_type_manager *man,
+static void ttm_range_man_put_node(struct ttm_resource_manager *man,
 				   struct ttm_mem_reg *mem)
 {
 	struct ttm_range_manager *rman = to_range_manager(man);
@@ -110,7 +110,7 @@ static void ttm_range_man_put_node(struct ttm_mem_type_manager *man,
 	}
 }
 
-static const struct ttm_mem_type_manager_func ttm_range_manager_func;
+static const struct ttm_resource_manager_func ttm_range_manager_func;
 
 int ttm_range_man_init(struct ttm_bo_device *bdev,
 		       unsigned type,
@@ -119,7 +119,7 @@ int ttm_range_man_init(struct ttm_bo_device *bdev,
 		       bool use_tt,
 		       unsigned long p_size)
 {
-	struct ttm_mem_type_manager *man;
+	struct ttm_resource_manager *man;
 	struct ttm_range_manager *rman;
 
 	rman = kzalloc(sizeof(*rman), GFP_KERNEL);
@@ -133,13 +133,13 @@ int ttm_range_man_init(struct ttm_bo_device *bdev,
 
 	man->func = &ttm_range_manager_func;
 
-	ttm_mem_type_manager_init(man, p_size);
+	ttm_resource_manager_init(man, p_size);
 
 	drm_mm_init(&rman->mm, 0, p_size);
 	spin_lock_init(&rman->lock);
 
 	ttm_set_driver_manager(bdev, type, &rman->manager);
-	ttm_mem_type_manager_set_used(man, true);
+	ttm_resource_manager_set_used(man, true);
 	return 0;
 }
 EXPORT_SYMBOL(ttm_range_man_init);
@@ -147,14 +147,14 @@ EXPORT_SYMBOL(ttm_range_man_init);
 int ttm_range_man_fini(struct ttm_bo_device *bdev,
 		       unsigned type)
 {
-	struct ttm_mem_type_manager *man = ttm_manager_type(bdev, type);
+	struct ttm_resource_manager *man = ttm_manager_type(bdev, type);
 	struct ttm_range_manager *rman = to_range_manager(man);
 	struct drm_mm *mm = &rman->mm;
 	int ret;
 
-	ttm_mem_type_manager_set_used(man, false);
+	ttm_resource_manager_set_used(man, false);
 
-	ret = ttm_mem_type_manager_force_list_clean(bdev, man);
+	ret = ttm_resource_manager_force_list_clean(bdev, man);
 	if (ret)
 		return ret;
 
@@ -163,14 +163,14 @@ int ttm_range_man_fini(struct ttm_bo_device *bdev,
 	drm_mm_takedown(mm);
 	spin_unlock(&rman->lock);
 
-	ttm_mem_type_manager_cleanup(man);
+	ttm_resource_manager_cleanup(man);
 	ttm_set_driver_manager(bdev, type, NULL);
 	kfree(rman);
 	return 0;
 }
 EXPORT_SYMBOL(ttm_range_man_fini);
 
-static void ttm_range_man_debug(struct ttm_mem_type_manager *man,
+static void ttm_range_man_debug(struct ttm_resource_manager *man,
 			     struct drm_printer *printer)
 {
 	struct ttm_range_manager *rman = to_range_manager(man);
@@ -180,7 +180,7 @@ static void ttm_range_man_debug(struct ttm_mem_type_manager *man,
 	spin_unlock(&rman->lock);
 }
 
-static const struct ttm_mem_type_manager_func ttm_range_manager_func = {
+static const struct ttm_resource_manager_func ttm_range_manager_func = {
 	.get_node = ttm_range_man_get_node,
 	.put_node = ttm_range_man_put_node,
 	.debug = ttm_range_man_debug
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index b2f1e7a3b048..7645d67aa6b6 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -630,7 +630,7 @@ static int vmw_vram_manager_init(struct vmw_private *dev_priv)
 				 TTM_PL_FLAG_CACHED, TTM_PL_FLAG_CACHED,
 				 false, dev_priv->vram_size >> PAGE_SHIFT);
 #endif
-	ttm_mem_type_manager_set_used(ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM), false);
+	ttm_resource_manager_set_used(ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM), false);
 	return ret;
 }
 
@@ -1189,12 +1189,12 @@ static void vmw_master_drop(struct drm_device *dev,
  */
 static void __vmw_svga_enable(struct vmw_private *dev_priv)
 {
-	struct ttm_mem_type_manager *man = ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM);
+	struct ttm_resource_manager *man = ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM);
 
 	spin_lock(&dev_priv->svga_lock);
-	if (!ttm_mem_type_manager_used(man)) {
+	if (!ttm_resource_manager_used(man)) {
 		vmw_write(dev_priv, SVGA_REG_ENABLE, SVGA_REG_ENABLE);
-		ttm_mem_type_manager_set_used(man, true);
+		ttm_resource_manager_set_used(man, true);
 	}
 	spin_unlock(&dev_priv->svga_lock);
 }
@@ -1220,11 +1220,11 @@ void vmw_svga_enable(struct vmw_private *dev_priv)
  */
 static void __vmw_svga_disable(struct vmw_private *dev_priv)
 {
-	struct ttm_mem_type_manager *man = ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM);
+	struct ttm_resource_manager *man = ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM);
 
 	spin_lock(&dev_priv->svga_lock);
-	if (ttm_mem_type_manager_used(man)) {
-		ttm_mem_type_manager_set_used(man, false);
+	if (ttm_resource_manager_used(man)) {
+		ttm_resource_manager_set_used(man, false);
 		vmw_write(dev_priv, SVGA_REG_ENABLE,
 			  SVGA_REG_ENABLE_HIDE |
 			  SVGA_REG_ENABLE_ENABLE);
@@ -1241,7 +1241,7 @@ static void __vmw_svga_disable(struct vmw_private *dev_priv)
  */
 void vmw_svga_disable(struct vmw_private *dev_priv)
 {
-	struct ttm_mem_type_manager *man = ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM);
+	struct ttm_resource_manager *man = ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM);
 	/*
 	 * Disabling SVGA will turn off device modesetting capabilities, so
 	 * notify KMS about that so that it doesn't cache atomic state that
@@ -1257,8 +1257,8 @@ void vmw_svga_disable(struct vmw_private *dev_priv)
 	vmw_kms_lost_device(dev_priv->dev);
 	ttm_write_lock(&dev_priv->reservation_sem, false);
 	spin_lock(&dev_priv->svga_lock);
-	if (ttm_mem_type_manager_used(man)) {
-		ttm_mem_type_manager_set_used(man, false);
+	if (ttm_resource_manager_used(man)) {
+		ttm_resource_manager_set_used(man, false);
 		spin_unlock(&dev_priv->svga_lock);
 		if (ttm_bo_evict_mm(&dev_priv->bdev, TTM_PL_VRAM))
 			DRM_ERROR("Failed evicting VRAM buffers.\n");
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
index ca5037184814..c8fe6e9cf092 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
@@ -37,7 +37,7 @@
 #include <linux/kernel.h>
 
 struct vmwgfx_gmrid_man {
-	struct ttm_mem_type_manager manager;
+	struct ttm_resource_manager manager;
 	spinlock_t lock;
 	struct ida gmr_ida;
 	uint32_t max_gmr_ids;
@@ -45,12 +45,12 @@ struct vmwgfx_gmrid_man {
 	uint32_t used_gmr_pages;
 };
 
-static struct vmwgfx_gmrid_man *to_gmrid_manager(struct ttm_mem_type_manager *man)
+static struct vmwgfx_gmrid_man *to_gmrid_manager(struct ttm_resource_manager *man)
 {
 	return container_of(man, struct vmwgfx_gmrid_man, manager);
 }
 
-static int vmw_gmrid_man_get_node(struct ttm_mem_type_manager *man,
+static int vmw_gmrid_man_get_node(struct ttm_resource_manager *man,
 				  struct ttm_buffer_object *bo,
 				  const struct ttm_place *place,
 				  struct ttm_mem_reg *mem)
@@ -84,7 +84,7 @@ static int vmw_gmrid_man_get_node(struct ttm_mem_type_manager *man,
 	return -ENOSPC;
 }
 
-static void vmw_gmrid_man_put_node(struct ttm_mem_type_manager *man,
+static void vmw_gmrid_man_put_node(struct ttm_resource_manager *man,
 				   struct ttm_mem_reg *mem)
 {
 	struct vmwgfx_gmrid_man *gman = to_gmrid_manager(man);
@@ -98,11 +98,11 @@ static void vmw_gmrid_man_put_node(struct ttm_mem_type_manager *man,
 	}
 }
 
-static const struct ttm_mem_type_manager_func vmw_gmrid_manager_func;
+static const struct ttm_resource_manager_func vmw_gmrid_manager_func;
 
 int vmw_gmrid_man_init(struct vmw_private *dev_priv, int type)
 {
-	struct ttm_mem_type_manager *man;
+	struct ttm_resource_manager *man;
 	struct vmwgfx_gmrid_man *gman =
 		kzalloc(sizeof(*gman), GFP_KERNEL);
 
@@ -116,7 +116,7 @@ int vmw_gmrid_man_init(struct vmw_private *dev_priv, int type)
 	man->default_caching = TTM_PL_FLAG_CACHED;
 	/* TODO: This is most likely not correct */
 	man->use_tt = true;
-	ttm_mem_type_manager_init(man, 0);
+	ttm_resource_manager_init(man, 0);
 	spin_lock_init(&gman->lock);
 	gman->used_gmr_pages = 0;
 	ida_init(&gman->gmr_ida);
@@ -134,20 +134,20 @@ int vmw_gmrid_man_init(struct vmw_private *dev_priv, int type)
 		BUG();
 	}
 	ttm_set_driver_manager(&dev_priv->bdev, type, &gman->manager);
-	ttm_mem_type_manager_set_used(man, true);
+	ttm_resource_manager_set_used(man, true);
 	return 0;
 }
 
 void vmw_gmrid_man_fini(struct vmw_private *dev_priv, int type)
 {
-	struct ttm_mem_type_manager *man = ttm_manager_type(&dev_priv->bdev, type);
+	struct ttm_resource_manager *man = ttm_manager_type(&dev_priv->bdev, type);
 	struct vmwgfx_gmrid_man *gman = to_gmrid_manager(man);
 
-	ttm_mem_type_manager_set_used(man, false);
+	ttm_resource_manager_set_used(man, false);
 
-	ttm_mem_type_manager_force_list_clean(&dev_priv->bdev, man);
+	ttm_resource_manager_force_list_clean(&dev_priv->bdev, man);
 
-	ttm_mem_type_manager_cleanup(man);
+	ttm_resource_manager_cleanup(man);
 
 	ttm_set_driver_manager(&dev_priv->bdev, type, NULL);
 	ida_destroy(&gman->gmr_ida);
@@ -155,7 +155,7 @@ void vmw_gmrid_man_fini(struct vmw_private *dev_priv, int type)
 
 }
 
-static const struct ttm_mem_type_manager_func vmw_gmrid_manager_func = {
+static const struct ttm_resource_manager_func vmw_gmrid_manager_func = {
 	.get_node = vmw_gmrid_man_get_node,
 	.put_node = vmw_gmrid_man_put_node,
 };
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
index 4110e8309188..6cac7b091205 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
@@ -16,12 +16,12 @@
  * @lock: Manager lock.
  */
 struct vmw_thp_manager {
-	struct ttm_mem_type_manager manager;
+	struct ttm_resource_manager manager;
 	struct drm_mm mm;
 	spinlock_t lock;
 };
 
-static struct vmw_thp_manager *to_thp_manager(struct ttm_mem_type_manager *man)
+static struct vmw_thp_manager *to_thp_manager(struct ttm_resource_manager *man)
 {
 	return container_of(man, struct vmw_thp_manager, manager);
 }
@@ -44,7 +44,7 @@ static int vmw_thp_insert_aligned(struct drm_mm *mm, struct drm_mm_node *node,
 	return -ENOSPC;
 }
 
-static int vmw_thp_get_node(struct ttm_mem_type_manager *man,
+static int vmw_thp_get_node(struct ttm_resource_manager *man,
 			    struct ttm_buffer_object *bo,
 			    const struct ttm_place *place,
 			    struct ttm_mem_reg *mem)
@@ -106,7 +106,7 @@ static int vmw_thp_get_node(struct ttm_mem_type_manager *man,
 
 
 
-static void vmw_thp_put_node(struct ttm_mem_type_manager *man,
+static void vmw_thp_put_node(struct ttm_resource_manager *man,
 			     struct ttm_mem_reg *mem)
 {
 	struct vmw_thp_manager *rman = to_thp_manager(man);
@@ -123,7 +123,7 @@ static void vmw_thp_put_node(struct ttm_mem_type_manager *man,
 
 int vmw_thp_init(struct vmw_private *dev_priv)
 {
-	struct ttm_mem_type_manager *man;
+	struct ttm_resource_manager *man;
 	struct vmw_thp_manager *rman;
 
 	rman = kzalloc(sizeof(*rman), GFP_KERNEL);
@@ -134,39 +134,39 @@ int vmw_thp_init(struct vmw_private *dev_priv)
 	man->available_caching = TTM_PL_FLAG_CACHED;
 	man->default_caching = TTM_PL_FLAG_CACHED;
 
-	ttm_mem_type_manager_init(man,
+	ttm_resource_manager_init(man,
 				  dev_priv->vram_size >> PAGE_SHIFT);
 
 	drm_mm_init(&rman->mm, 0, man->size);
 	spin_lock_init(&rman->lock);
 
 	ttm_set_driver_manager(&dev_priv->bdev, TTM_PL_VRAM, &rman->manager);
-	ttm_mem_type_manager_set_used(man, true);
+	ttm_resource_manager_set_used(man, true);
 	return 0;
 }
 
 void vmw_thp_fini(struct vmw_private *dev_priv)
 {
-	struct ttm_mem_type_manager *man = ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM);
+	struct ttm_resource_manager *man = ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM);
 	struct vmw_thp_manager *rman = to_thp_manager(man);
 	struct drm_mm *mm = &rman->mm;
 	int ret;
 
-	ttm_mem_type_manager_set_used(man, false);
+	ttm_resource_manager_set_used(man, false);
 
-	ret = ttm_mem_type_manager_force_list_clean(&dev_priv->bdev, man);
+	ret = ttm_resource_manager_force_list_clean(&dev_priv->bdev, man);
 	if (ret)
 		return;
 	spin_lock(&rman->lock);
 	drm_mm_clean(mm);
 	drm_mm_takedown(mm);
 	spin_unlock(&rman->lock);
-	ttm_mem_type_manager_cleanup(man);
+	ttm_resource_manager_cleanup(man);
 	ttm_set_driver_manager(&dev_priv->bdev, TTM_PL_VRAM, NULL);
 	kfree(rman);
 }
 
-static void vmw_thp_debug(struct ttm_mem_type_manager *man,
+static void vmw_thp_debug(struct ttm_resource_manager *man,
 			  struct drm_printer *printer)
 {
 	struct vmw_thp_manager *rman = to_thp_manager(man);
@@ -176,7 +176,7 @@ static void vmw_thp_debug(struct ttm_mem_type_manager *man,
 	spin_unlock(&rman->lock);
 }
 
-const struct ttm_mem_type_manager_func vmw_thp_func = {
+const struct ttm_resource_manager_func vmw_thp_func = {
 	.get_node = vmw_thp_get_node,
 	.put_node = vmw_thp_put_node,
 	.debug = vmw_thp_debug
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index eb465e9ca0c1..15958dff11d2 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -54,7 +54,7 @@ struct ttm_place;
 
 struct ttm_lru_bulk_move;
 
-struct ttm_mem_type_manager;
+struct ttm_resource_manager;
 
 /**
  * struct ttm_bus_placement
@@ -534,14 +534,14 @@ int ttm_bo_create(struct ttm_bo_device *bdev, unsigned long size,
 		  struct ttm_buffer_object **p_bo);
 
 /**
- * ttm_mem_type_manager_init
+ * ttm_resource_manager_init
  *
  * @man: memory manager object to init
  * @p_size: size managed area in pages.
  *
  * Initialise core parts of a manager object.
  */
-void ttm_mem_type_manager_init(struct ttm_mem_type_manager *man,
+void ttm_resource_manager_init(struct ttm_resource_manager *man,
 			       unsigned long p_size);
 
 /**
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index f231fe34e744..d1eff7de4fa3 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -45,11 +45,11 @@
 
 #define TTM_MAX_BO_PRIORITY	4U
 
-struct ttm_mem_type_manager;
+struct ttm_resource_manager;
 
-struct ttm_mem_type_manager_func {
+struct ttm_resource_manager_func {
 	/**
-	 * struct ttm_mem_type_manager member get_node
+	 * struct ttm_resource_manager member get_node
 	 *
 	 * @man: Pointer to a memory type manager.
 	 * @bo: Pointer to the buffer object we're allocating space for.
@@ -69,20 +69,20 @@ struct ttm_mem_type_manager_func {
 	 * the function should return a negative error code.
 	 *
 	 * Note that @mem::mm_node will only be dereferenced by
-	 * struct ttm_mem_type_manager functions and optionally by the driver,
+	 * struct ttm_resource_manager functions and optionally by the driver,
 	 * which has knowledge of the underlying type.
 	 *
 	 * This function may not be called from within atomic context, so
 	 * an implementation can and must use either a mutex or a spinlock to
 	 * protect any data structures managing the space.
 	 */
-	int  (*get_node)(struct ttm_mem_type_manager *man,
+	int  (*get_node)(struct ttm_resource_manager *man,
 			 struct ttm_buffer_object *bo,
 			 const struct ttm_place *place,
 			 struct ttm_mem_reg *mem);
 
 	/**
-	 * struct ttm_mem_type_manager member put_node
+	 * struct ttm_resource_manager member put_node
 	 *
 	 * @man: Pointer to a memory type manager.
 	 * @mem: Pointer to a struct ttm_mem_reg to be filled in.
@@ -91,11 +91,11 @@ struct ttm_mem_type_manager_func {
 	 * and that are identified by @mem::mm_node and @mem::start. May not
 	 * be called from within atomic context.
 	 */
-	void (*put_node)(struct ttm_mem_type_manager *man,
+	void (*put_node)(struct ttm_resource_manager *man,
 			 struct ttm_mem_reg *mem);
 
 	/**
-	 * struct ttm_mem_type_manager member debug
+	 * struct ttm_resource_manager member debug
 	 *
 	 * @man: Pointer to a memory type manager.
 	 * @printer: Prefix to be used in printout to identify the caller.
@@ -104,12 +104,12 @@ struct ttm_mem_type_manager_func {
 	 * type manager to aid debugging of out-of-memory conditions.
 	 * It may not be called from within atomic context.
 	 */
-	void (*debug)(struct ttm_mem_type_manager *man,
+	void (*debug)(struct ttm_resource_manager *man,
 		      struct drm_printer *printer);
 };
 
 /**
- * struct ttm_mem_type_manager
+ * struct ttm_resource_manager
  *
  * @use_type: The memory type is enabled.
  * @flags: TTM_MEMTYPE_XX flags identifying the traits of the memory
@@ -136,7 +136,7 @@ struct ttm_mem_type_manager_func {
 
 
 
-struct ttm_mem_type_manager {
+struct ttm_resource_manager {
 	/*
 	 * No protection. Constant from start.
 	 */
@@ -145,7 +145,7 @@ struct ttm_mem_type_manager {
 	uint64_t size;
 	uint32_t available_caching;
 	uint32_t default_caching;
-	const struct ttm_mem_type_manager_func *func;
+	const struct ttm_resource_manager_func *func;
 	struct mutex io_reserve_mutex;
 	bool use_io_reserve_lru;
 	spinlock_t move_lock;
@@ -390,7 +390,7 @@ extern struct ttm_bo_global {
  * struct ttm_bo_device - Buffer object driver device-specific data.
  *
  * @driver: Pointer to a struct ttm_bo_driver struct setup by the driver.
- * @man: An array of mem_type_managers.
+ * @man: An array of resource_managers.
  * @vma_manager: Address space manager (pointer)
  * lru_lock: Spinlock that protects the buffer+device lru lists and
  * ddestroy lists.
@@ -411,8 +411,8 @@ struct ttm_bo_device {
 	/*
 	 * access via ttm_manager_type.
 	 */
-	struct ttm_mem_type_manager sysman;
-	struct ttm_mem_type_manager *man_drv[TTM_NUM_MEM_TYPES];
+	struct ttm_resource_manager sysman;
+	struct ttm_resource_manager *man_drv[TTM_NUM_MEM_TYPES];
 	/*
 	 * Protected by internal locks.
 	 */
@@ -440,7 +440,7 @@ struct ttm_bo_device {
 	bool no_retry;
 };
 
-static inline struct ttm_mem_type_manager *ttm_manager_type(struct ttm_bo_device *bdev,
+static inline struct ttm_resource_manager *ttm_manager_type(struct ttm_bo_device *bdev,
 							    int mem_type)
 {
 	return bdev->man_drv[mem_type];
@@ -448,7 +448,7 @@ static inline struct ttm_mem_type_manager *ttm_manager_type(struct ttm_bo_device
 
 static inline void ttm_set_driver_manager(struct ttm_bo_device *bdev,
 					  int type,
-					  struct ttm_mem_type_manager *manager)
+					  struct ttm_resource_manager *manager)
 {
 	bdev->man_drv[type] = manager;
 }
@@ -570,8 +570,8 @@ void ttm_bo_unmap_virtual_locked(struct ttm_buffer_object *bo);
 
 int ttm_mem_io_reserve_vm(struct ttm_buffer_object *bo);
 void ttm_mem_io_free_vm(struct ttm_buffer_object *bo);
-int ttm_mem_io_lock(struct ttm_mem_type_manager *man, bool interruptible);
-void ttm_mem_io_unlock(struct ttm_mem_type_manager *man);
+int ttm_mem_io_lock(struct ttm_resource_manager *man, bool interruptible);
+void ttm_mem_io_unlock(struct ttm_resource_manager *man);
 
 /**
  * ttm_bo_reserve:
@@ -665,7 +665,7 @@ static inline void ttm_bo_unreserve(struct ttm_buffer_object *bo)
 }
 
 /**
- * ttm_mem_type_manager_set_used
+ * ttm_resource_manager_set_used
  *
  * @man: A memory manager object.
  * @used: usage state to set.
@@ -673,13 +673,13 @@ static inline void ttm_bo_unreserve(struct ttm_buffer_object *bo)
  * Set the manager in use flag. If disabled the manager is no longer
  * used for object placement.
  */
-static inline void ttm_mem_type_manager_set_used(struct ttm_mem_type_manager *man, bool used)
+static inline void ttm_resource_manager_set_used(struct ttm_resource_manager *man, bool used)
 {
 	man->use_type = used;
 }
 
 /**
- * ttm_mem_type_manager_used
+ * ttm_resource_manager_used
  *
  * @man: Manager to get used state for
  *
@@ -687,26 +687,26 @@ static inline void ttm_mem_type_manager_set_used(struct ttm_mem_type_manager *ma
  * Returns:
  * true is used, false if not.
  */
-static inline bool ttm_mem_type_manager_used(struct ttm_mem_type_manager *man)
+static inline bool ttm_resource_manager_used(struct ttm_resource_manager *man)
 {
 	return man->use_type;
 }
 
 /**
- * ttm_mem_type_manager_cleanup
+ * ttm_resource_manager_cleanup
  *
  * @man: A memory manager object.
  *
  * Cleanup the move fences from the memory manager object.
  */
-static inline void ttm_mem_type_manager_cleanup(struct ttm_mem_type_manager *man)
+static inline void ttm_resource_manager_cleanup(struct ttm_resource_manager *man)
 {
 	dma_fence_put(man->move);
 	man->move = NULL;
 }
 
 /*
- * ttm_mem_type_manager_force_list_clean
+ * ttm_resource_manager_force_list_clean
  *
  * @bdev - device to use
  * @man - manager to use
@@ -714,8 +714,8 @@ static inline void ttm_mem_type_manager_cleanup(struct ttm_mem_type_manager *man
  * Force all the objects out of a memory manager until clean.
  * Part of memory manager cleanup sequence.
  */
-int ttm_mem_type_manager_force_list_clean(struct ttm_bo_device *bdev,
-					  struct ttm_mem_type_manager *man);
+int ttm_resource_manager_force_list_clean(struct ttm_bo_device *bdev,
+					  struct ttm_resource_manager *man);
 
 /*
  * ttm_bo_util.c
@@ -864,12 +864,12 @@ int ttm_range_man_fini(struct ttm_bo_device *bdev,
 		       unsigned type);
 
 /**
- * ttm_mem_type_manager_debug
+ * ttm_resource_manager_debug
  *
  * @man: manager type to dump.
  * @p: printer to use for debug.
  */
-void ttm_mem_type_manager_debug(struct ttm_mem_type_manager *man,
+void ttm_resource_manager_debug(struct ttm_resource_manager *man,
 				struct drm_printer *p);
 
 #endif
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
