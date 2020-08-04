Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6894423B31A
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 04:59:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DEF06E40F;
	Tue,  4 Aug 2020 02:59:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A71666E40F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 02:59:12 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-YVuH0wcWOrGY8cKdrPH26w-1; Mon, 03 Aug 2020 22:59:07 -0400
X-MC-Unique: YVuH0wcWOrGY8cKdrPH26w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D439D100CD01;
 Tue,  4 Aug 2020 02:59:05 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 81E058AD1C;
 Tue,  4 Aug 2020 02:59:03 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 59/59] drm/ttm: rename ttm_mem_reg to ttm_resource.
Date: Tue,  4 Aug 2020 12:56:32 +1000
Message-Id: <20200804025632.3868079-60-airlied@gmail.com>
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

This name better reflects what the object does. I didn't rename
all the pointers it seemed too messy.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c   |  6 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h    |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 46 +++++++++----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       | 10 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  | 12 ++---
 drivers/gpu/drm/drm_gem_vram_helper.c         |  6 +--
 drivers/gpu/drm/nouveau/nouveau_bo.c          | 28 +++++------
 drivers/gpu/drm/nouveau/nouveau_bo.h          | 14 +++---
 drivers/gpu/drm/nouveau/nouveau_bo0039.c      |  4 +-
 drivers/gpu/drm/nouveau/nouveau_bo5039.c      |  2 +-
 drivers/gpu/drm/nouveau/nouveau_bo74c1.c      |  2 +-
 drivers/gpu/drm/nouveau/nouveau_bo85b5.c      |  2 +-
 drivers/gpu/drm/nouveau/nouveau_bo9039.c      |  2 +-
 drivers/gpu/drm/nouveau/nouveau_bo90b5.c      |  2 +-
 drivers/gpu/drm/nouveau/nouveau_boa0b5.c      |  2 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h         |  2 +-
 drivers/gpu/drm/nouveau/nouveau_mem.c         |  8 ++--
 drivers/gpu/drm/nouveau/nouveau_mem.h         | 10 ++--
 drivers/gpu/drm/nouveau/nouveau_sgdma.c       |  4 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c         |  8 ++--
 drivers/gpu/drm/nouveau/nv17_fence.c          |  2 +-
 drivers/gpu/drm/nouveau/nv50_fence.c          |  2 +-
 drivers/gpu/drm/qxl/qxl_drv.h                 |  2 +-
 drivers/gpu/drm/qxl/qxl_ttm.c                 | 14 +++---
 drivers/gpu/drm/radeon/radeon.h               |  2 +-
 drivers/gpu/drm/radeon/radeon_object.c        |  2 +-
 drivers/gpu/drm/radeon/radeon_object.h        |  2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c           | 28 +++++------
 drivers/gpu/drm/radeon/radeon_vm.c            |  2 +-
 drivers/gpu/drm/ttm/ttm_agp_backend.c         |  2 +-
 drivers/gpu/drm/ttm/ttm_bo.c                  | 26 +++++------
 drivers/gpu/drm/ttm/ttm_bo_util.c             | 46 +++++++++----------
 drivers/gpu/drm/ttm/ttm_range_manager.c       |  4 +-
 drivers/gpu/drm/ttm/ttm_tt.c                  |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c            |  4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h           |  4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c |  4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c      |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_thp.c           |  6 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c    |  8 ++--
 include/drm/ttm/ttm_bo_api.h                  | 10 ++--
 include/drm/ttm/ttm_bo_driver.h               | 42 ++++++++---------
 include/drm/ttm/ttm_tt.h                      | 10 ++--
 45 files changed, 202 insertions(+), 202 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index 8b600b804f34..fb1415488579 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -171,7 +171,7 @@ void amdgpu_gtt_mgr_fini(struct amdgpu_device *adev)
  *
  * Check if a mem object has already address space allocated.
  */
-bool amdgpu_gtt_mgr_has_gart_addr(struct ttm_mem_reg *mem)
+bool amdgpu_gtt_mgr_has_gart_addr(struct ttm_resource *mem)
 {
 	return mem->mm_node != NULL;
 }
@@ -189,7 +189,7 @@ bool amdgpu_gtt_mgr_has_gart_addr(struct ttm_mem_reg *mem)
 static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
 			      struct ttm_buffer_object *tbo,
 			      const struct ttm_place *place,
-			      struct ttm_mem_reg *mem)
+			      struct ttm_resource *mem)
 {
 	struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
 	struct amdgpu_gtt_node *node;
@@ -250,7 +250,7 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
  * Free the allocated GTT again.
  */
 static void amdgpu_gtt_mgr_del(struct ttm_resource_manager *man,
-			       struct ttm_mem_reg *mem)
+			       struct ttm_resource *mem)
 {
 	struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
 	struct amdgpu_gtt_node *node = mem->mm_node;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index ce98df5b0c21..43f4966331dd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1268,11 +1268,11 @@ int amdgpu_bo_get_metadata(struct amdgpu_bo *bo, void *buffer,
  */
 void amdgpu_bo_move_notify(struct ttm_buffer_object *bo,
 			   bool evict,
-			   struct ttm_mem_reg *new_mem)
+			   struct ttm_resource *new_mem)
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->bdev);
 	struct amdgpu_bo *abo;
-	struct ttm_mem_reg *old_mem = &bo->mem;
+	struct ttm_resource *old_mem = &bo->mem;
 
 	if (!amdgpu_bo_is_amdgpu_bo(bo))
 		return;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
index e01e8903741e..5ddb6cf96030 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
@@ -283,7 +283,7 @@ int amdgpu_bo_get_metadata(struct amdgpu_bo *bo, void *buffer,
 			   uint64_t *flags);
 void amdgpu_bo_move_notify(struct ttm_buffer_object *bo,
 			   bool evict,
-			   struct ttm_mem_reg *new_mem);
+			   struct ttm_resource *new_mem);
 void amdgpu_bo_release_notify(struct ttm_buffer_object *bo);
 int amdgpu_bo_fault_reserve_notify(struct ttm_buffer_object *bo);
 void amdgpu_bo_fence(struct amdgpu_bo *bo, struct dma_fence *fence,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index cae7eada7215..682172d59f60 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -183,9 +183,9 @@ static int amdgpu_verify_access(struct ttm_buffer_object *bo, struct file *filp)
  * Assign the memory from new_mem to the memory of the buffer object bo.
  */
 static void amdgpu_move_null(struct ttm_buffer_object *bo,
-			     struct ttm_mem_reg *new_mem)
+			     struct ttm_resource *new_mem)
 {
-	struct ttm_mem_reg *old_mem = &bo->mem;
+	struct ttm_resource *old_mem = &bo->mem;
 
 	BUG_ON(old_mem->mm_node != NULL);
 	*old_mem = *new_mem;
@@ -202,7 +202,7 @@ static void amdgpu_move_null(struct ttm_buffer_object *bo,
  */
 static uint64_t amdgpu_mm_node_addr(struct ttm_buffer_object *bo,
 				    struct drm_mm_node *mm_node,
-				    struct ttm_mem_reg *mem)
+				    struct ttm_resource *mem)
 {
 	uint64_t addr = 0;
 
@@ -222,7 +222,7 @@ static uint64_t amdgpu_mm_node_addr(struct ttm_buffer_object *bo,
  * @offset: The offset that drm_mm_node is used for finding.
  *
  */
-static struct drm_mm_node *amdgpu_find_mm_node(struct ttm_mem_reg *mem,
+static struct drm_mm_node *amdgpu_find_mm_node(struct ttm_resource *mem,
 					       uint64_t *offset)
 {
 	struct drm_mm_node *mm_node = mem->mm_node;
@@ -250,7 +250,7 @@ static struct drm_mm_node *amdgpu_find_mm_node(struct ttm_mem_reg *mem,
  * the physical address for local memory.
  */
 static int amdgpu_ttm_map_buffer(struct ttm_buffer_object *bo,
-				 struct ttm_mem_reg *mem,
+				 struct ttm_resource *mem,
 				 struct drm_mm_node *mm_node,
 				 unsigned num_pages, uint64_t offset,
 				 unsigned window, struct amdgpu_ring *ring,
@@ -474,8 +474,8 @@ int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
  */
 static int amdgpu_move_blit(struct ttm_buffer_object *bo,
 			    bool evict, bool no_wait_gpu,
-			    struct ttm_mem_reg *new_mem,
-			    struct ttm_mem_reg *old_mem)
+			    struct ttm_resource *new_mem,
+			    struct ttm_resource *old_mem)
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->bdev);
 	struct amdgpu_bo *abo = ttm_to_amdgpu_bo(bo);
@@ -534,10 +534,10 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
  */
 static int amdgpu_move_vram_ram(struct ttm_buffer_object *bo, bool evict,
 				struct ttm_operation_ctx *ctx,
-				struct ttm_mem_reg *new_mem)
+				struct ttm_resource *new_mem)
 {
-	struct ttm_mem_reg *old_mem = &bo->mem;
-	struct ttm_mem_reg tmp_mem;
+	struct ttm_resource *old_mem = &bo->mem;
+	struct ttm_resource tmp_mem;
 	struct ttm_place placements;
 	struct ttm_placement placement;
 	int r;
@@ -590,10 +590,10 @@ static int amdgpu_move_vram_ram(struct ttm_buffer_object *bo, bool evict,
  */
 static int amdgpu_move_ram_vram(struct ttm_buffer_object *bo, bool evict,
 				struct ttm_operation_ctx *ctx,
-				struct ttm_mem_reg *new_mem)
+				struct ttm_resource *new_mem)
 {
-	struct ttm_mem_reg *old_mem = &bo->mem;
-	struct ttm_mem_reg tmp_mem;
+	struct ttm_resource *old_mem = &bo->mem;
+	struct ttm_resource tmp_mem;
 	struct ttm_placement placement;
 	struct ttm_place placements;
 	int r;
@@ -636,7 +636,7 @@ static int amdgpu_move_ram_vram(struct ttm_buffer_object *bo, bool evict,
  * Called by amdgpu_bo_move()
  */
 static bool amdgpu_mem_visible(struct amdgpu_device *adev,
-			       struct ttm_mem_reg *mem)
+			       struct ttm_resource *mem)
 {
 	struct drm_mm_node *nodes = mem->mm_node;
 
@@ -646,7 +646,7 @@ static bool amdgpu_mem_visible(struct amdgpu_device *adev,
 	if (mem->mem_type != TTM_PL_VRAM)
 		return false;
 
-	/* ttm_mem_reg_ioremap only supports contiguous memory */
+	/* ttm_resource_ioremap only supports contiguous memory */
 	if (nodes->size != mem->num_pages)
 		return false;
 
@@ -661,11 +661,11 @@ static bool amdgpu_mem_visible(struct amdgpu_device *adev,
  */
 static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
 			  struct ttm_operation_ctx *ctx,
-			  struct ttm_mem_reg *new_mem)
+			  struct ttm_resource *new_mem)
 {
 	struct amdgpu_device *adev;
 	struct amdgpu_bo *abo;
-	struct ttm_mem_reg *old_mem = &bo->mem;
+	struct ttm_resource *old_mem = &bo->mem;
 	int r;
 
 	/* Can't move a pinned BO */
@@ -747,7 +747,7 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
  *
  * Called by ttm_mem_io_reserve() ultimately via ttm_bo_vm_fault()
  */
-static int amdgpu_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct ttm_mem_reg *mem)
+static int amdgpu_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct ttm_resource *mem)
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bdev);
 	struct drm_mm_node *mm_node = mem->mm_node;
@@ -771,7 +771,7 @@ static int amdgpu_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct ttm_mem_
 			return -EINVAL;
 		/* Only physically contiguous buffers apply. In a contiguous
 		 * buffer, size of the first mm_node would match the number of
-		 * pages in ttm_mem_reg.
+		 * pages in ttm_resource.
 		 */
 		if (adev->mman.aper_base_kaddr &&
 		    (mm_node->size == mem->num_pages))
@@ -1116,7 +1116,7 @@ static int amdgpu_ttm_gart_bind(struct amdgpu_device *adev,
  * This handles binding GTT memory to the device address space.
  */
 static int amdgpu_ttm_backend_bind(struct ttm_tt *ttm,
-				   struct ttm_mem_reg *bo_mem)
+				   struct ttm_resource *bo_mem)
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(ttm->bdev);
 	struct amdgpu_ttm_tt *gtt = (void*)ttm;
@@ -1167,7 +1167,7 @@ int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo)
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->bdev);
 	struct ttm_operation_ctx ctx = { false, false };
 	struct amdgpu_ttm_tt *gtt = (void*)bo->ttm;
-	struct ttm_mem_reg tmp;
+	struct ttm_resource tmp;
 	struct ttm_placement placement;
 	struct ttm_place placements;
 	uint64_t addr, flags;
@@ -1507,7 +1507,7 @@ bool amdgpu_ttm_tt_is_readonly(struct ttm_tt *ttm)
  *
  * Figure out the flags to use for a VM PDE (Page Directory Entry).
  */
-uint64_t amdgpu_ttm_tt_pde_flags(struct ttm_tt *ttm, struct ttm_mem_reg *mem)
+uint64_t amdgpu_ttm_tt_pde_flags(struct ttm_tt *ttm, struct ttm_resource *mem)
 {
 	uint64_t flags = 0;
 
@@ -1533,7 +1533,7 @@ uint64_t amdgpu_ttm_tt_pde_flags(struct ttm_tt *ttm, struct ttm_mem_reg *mem)
  * Figure out the flags to use for a VM PTE (Page Table Entry).
  */
 uint64_t amdgpu_ttm_tt_pte_flags(struct amdgpu_device *adev, struct ttm_tt *ttm,
-				 struct ttm_mem_reg *mem)
+				 struct ttm_resource *mem)
 {
 	uint64_t flags = amdgpu_ttm_tt_pde_flags(ttm, mem);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 3db29ae1f802..36b024fd077e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -63,7 +63,7 @@ struct amdgpu_mman {
 
 struct amdgpu_copy_mem {
 	struct ttm_buffer_object	*bo;
-	struct ttm_mem_reg		*mem;
+	struct ttm_resource		*mem;
 	unsigned long			offset;
 };
 
@@ -72,13 +72,13 @@ void amdgpu_gtt_mgr_fini(struct amdgpu_device *adev);
 int amdgpu_vram_mgr_init(struct amdgpu_device *adev);
 void amdgpu_vram_mgr_fini(struct amdgpu_device *adev);
 
-bool amdgpu_gtt_mgr_has_gart_addr(struct ttm_mem_reg *mem);
+bool amdgpu_gtt_mgr_has_gart_addr(struct ttm_resource *mem);
 uint64_t amdgpu_gtt_mgr_usage(struct ttm_resource_manager *man);
 int amdgpu_gtt_mgr_recover(struct ttm_resource_manager *man);
 
 u64 amdgpu_vram_mgr_bo_visible_size(struct amdgpu_bo *bo);
 int amdgpu_vram_mgr_alloc_sgt(struct amdgpu_device *adev,
-			      struct ttm_mem_reg *mem,
+			      struct ttm_resource *mem,
 			      struct device *dev,
 			      enum dma_data_direction dir,
 			      struct sg_table **sgt);
@@ -142,9 +142,9 @@ bool amdgpu_ttm_tt_userptr_invalidated(struct ttm_tt *ttm,
 				       int *last_invalidated);
 bool amdgpu_ttm_tt_is_userptr(struct ttm_tt *ttm);
 bool amdgpu_ttm_tt_is_readonly(struct ttm_tt *ttm);
-uint64_t amdgpu_ttm_tt_pde_flags(struct ttm_tt *ttm, struct ttm_mem_reg *mem);
+uint64_t amdgpu_ttm_tt_pde_flags(struct ttm_tt *ttm, struct ttm_resource *mem);
 uint64_t amdgpu_ttm_tt_pte_flags(struct amdgpu_device *adev, struct ttm_tt *ttm,
-				 struct ttm_mem_reg *mem);
+				 struct ttm_resource *mem);
 
 int amdgpu_ttm_debugfs_init(struct amdgpu_device *adev);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 71e005cf2952..8bc2253939be 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -1765,7 +1765,7 @@ int amdgpu_vm_bo_update(struct amdgpu_device *adev, struct amdgpu_bo_va *bo_va,
 	struct amdgpu_vm *vm = bo_va->base.vm;
 	struct amdgpu_bo_va_mapping *mapping;
 	dma_addr_t *pages_addr = NULL;
-	struct ttm_mem_reg *mem;
+	struct ttm_resource *mem;
 	struct drm_mm_node *nodes;
 	struct dma_fence **last_update;
 	struct dma_resv *resv;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index b227e380094f..44f20b30420e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -272,7 +272,7 @@ static u64 amdgpu_vram_mgr_vis_size(struct amdgpu_device *adev,
 u64 amdgpu_vram_mgr_bo_visible_size(struct amdgpu_bo *bo)
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
-	struct ttm_mem_reg *mem = &bo->tbo.mem;
+	struct ttm_resource *mem = &bo->tbo.mem;
 	struct drm_mm_node *nodes = mem->mm_node;
 	unsigned pages = mem->num_pages;
 	u64 usage;
@@ -292,13 +292,13 @@ u64 amdgpu_vram_mgr_bo_visible_size(struct amdgpu_bo *bo)
 /**
  * amdgpu_vram_mgr_virt_start - update virtual start address
  *
- * @mem: ttm_mem_reg to update
+ * @mem: ttm_resource to update
  * @node: just allocated node
  *
  * Calculate a virtual BO start address to easily check if everything is CPU
  * accessible.
  */
-static void amdgpu_vram_mgr_virt_start(struct ttm_mem_reg *mem,
+static void amdgpu_vram_mgr_virt_start(struct ttm_resource *mem,
 				       struct drm_mm_node *node)
 {
 	unsigned long start;
@@ -324,7 +324,7 @@ static void amdgpu_vram_mgr_virt_start(struct ttm_mem_reg *mem,
 static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 			       struct ttm_buffer_object *tbo,
 			       const struct ttm_place *place,
-			       struct ttm_mem_reg *mem)
+			       struct ttm_resource *mem)
 {
 	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
 	struct amdgpu_device *adev = mgr->adev;
@@ -440,7 +440,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
  * Free the allocated VRAM again.
  */
 static void amdgpu_vram_mgr_del(struct ttm_resource_manager *man,
-				struct ttm_mem_reg *mem)
+				struct ttm_resource *mem)
 {
 	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
 	struct amdgpu_device *adev = mgr->adev;
@@ -480,7 +480,7 @@ static void amdgpu_vram_mgr_del(struct ttm_resource_manager *man,
  * Allocate and fill a sg table from a VRAM allocation.
  */
 int amdgpu_vram_mgr_alloc_sgt(struct amdgpu_device *adev,
-			      struct ttm_mem_reg *mem,
+			      struct ttm_resource *mem,
 			      struct device *dev,
 			      enum dma_data_direction dir,
 			      struct sg_table **sgt)
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index e3660d00987d..b410930d94a0 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -653,7 +653,7 @@ static void drm_gem_vram_bo_driver_evict_flags(struct drm_gem_vram_object *gbo,
 
 static void drm_gem_vram_bo_driver_move_notify(struct drm_gem_vram_object *gbo,
 					       bool evict,
-					       struct ttm_mem_reg *new_mem)
+					       struct ttm_resource *new_mem)
 {
 	struct ttm_bo_kmap_obj *kmap = &gbo->kmap;
 
@@ -1020,7 +1020,7 @@ static void bo_driver_evict_flags(struct ttm_buffer_object *bo,
 
 static void bo_driver_move_notify(struct ttm_buffer_object *bo,
 				  bool evict,
-				  struct ttm_mem_reg *new_mem)
+				  struct ttm_resource *new_mem)
 {
 	struct drm_gem_vram_object *gbo;
 
@@ -1034,7 +1034,7 @@ static void bo_driver_move_notify(struct ttm_buffer_object *bo,
 }
 
 static int bo_driver_io_mem_reserve(struct ttm_bo_device *bdev,
-				    struct ttm_mem_reg *mem)
+				    struct ttm_resource *mem)
 {
 	struct drm_vram_mm *vmm = drm_vram_mm_of_bdev(bdev);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index aebec45b8416..80d22a98950b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -666,7 +666,7 @@ nouveau_bo_evict_flags(struct ttm_buffer_object *bo, struct ttm_placement *pl)
 
 static int
 nouveau_bo_move_prep(struct nouveau_drm *drm, struct ttm_buffer_object *bo,
-		     struct ttm_mem_reg *reg)
+		     struct ttm_resource *reg)
 {
 	struct nouveau_mem *old_mem = nouveau_mem(&bo->mem);
 	struct nouveau_mem *new_mem = nouveau_mem(reg);
@@ -698,7 +698,7 @@ nouveau_bo_move_prep(struct nouveau_drm *drm, struct ttm_buffer_object *bo,
 
 static int
 nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, int evict, bool intr,
-		     bool no_wait_gpu, struct ttm_mem_reg *new_reg)
+		     bool no_wait_gpu, struct ttm_resource *new_reg)
 {
 	struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
 	struct nouveau_channel *chan = drm->ttm.chan;
@@ -708,7 +708,7 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, int evict, bool intr,
 
 	/* create temporary vmas for the transfer and attach them to the
 	 * old nvkm_mem node, these will get cleaned up after ttm has
-	 * destroyed the ttm_mem_reg
+	 * destroyed the ttm_resource
 	 */
 	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA) {
 		ret = nouveau_bo_move_prep(drm, bo, new_reg);
@@ -744,7 +744,7 @@ nouveau_bo_move_init(struct nouveau_drm *drm)
 		s32 oclass;
 		int (*exec)(struct nouveau_channel *,
 			    struct ttm_buffer_object *,
-			    struct ttm_mem_reg *, struct ttm_mem_reg *);
+			    struct ttm_resource *, struct ttm_resource *);
 		int (*init)(struct nouveau_channel *, u32 handle);
 	} _methods[] = {
 		{  "COPY", 4, 0xc5b5, nve0_bo_move_copy, nve0_bo_move_init },
@@ -805,7 +805,7 @@ nouveau_bo_move_init(struct nouveau_drm *drm)
 
 static int
 nouveau_bo_move_flipd(struct ttm_buffer_object *bo, bool evict, bool intr,
-		      bool no_wait_gpu, struct ttm_mem_reg *new_reg)
+		      bool no_wait_gpu, struct ttm_resource *new_reg)
 {
 	struct ttm_operation_ctx ctx = { intr, no_wait_gpu };
 	struct ttm_place placement_memtype = {
@@ -814,7 +814,7 @@ nouveau_bo_move_flipd(struct ttm_buffer_object *bo, bool evict, bool intr,
 		.flags = TTM_PL_FLAG_TT | TTM_PL_MASK_CACHING
 	};
 	struct ttm_placement placement;
-	struct ttm_mem_reg tmp_reg;
+	struct ttm_resource tmp_reg;
 	int ret;
 
 	placement.num_placement = placement.num_busy_placement = 1;
@@ -842,7 +842,7 @@ nouveau_bo_move_flipd(struct ttm_buffer_object *bo, bool evict, bool intr,
 
 static int
 nouveau_bo_move_flips(struct ttm_buffer_object *bo, bool evict, bool intr,
-		      bool no_wait_gpu, struct ttm_mem_reg *new_reg)
+		      bool no_wait_gpu, struct ttm_resource *new_reg)
 {
 	struct ttm_operation_ctx ctx = { intr, no_wait_gpu };
 	struct ttm_place placement_memtype = {
@@ -851,7 +851,7 @@ nouveau_bo_move_flips(struct ttm_buffer_object *bo, bool evict, bool intr,
 		.flags = TTM_PL_FLAG_TT | TTM_PL_MASK_CACHING
 	};
 	struct ttm_placement placement;
-	struct ttm_mem_reg tmp_reg;
+	struct ttm_resource tmp_reg;
 	int ret;
 
 	placement.num_placement = placement.num_busy_placement = 1;
@@ -878,7 +878,7 @@ nouveau_bo_move_flips(struct ttm_buffer_object *bo, bool evict, bool intr,
 
 static void
 nouveau_bo_move_ntfy(struct ttm_buffer_object *bo, bool evict,
-		     struct ttm_mem_reg *new_reg)
+		     struct ttm_resource *new_reg)
 {
 	struct nouveau_mem *mem = new_reg ? nouveau_mem(new_reg) : NULL;
 	struct nouveau_bo *nvbo = nouveau_bo(bo);
@@ -910,7 +910,7 @@ nouveau_bo_move_ntfy(struct ttm_buffer_object *bo, bool evict,
 }
 
 static int
-nouveau_bo_vm_bind(struct ttm_buffer_object *bo, struct ttm_mem_reg *new_reg,
+nouveau_bo_vm_bind(struct ttm_buffer_object *bo, struct ttm_resource *new_reg,
 		   struct nouveau_drm_tile **new_tile)
 {
 	struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
@@ -946,11 +946,11 @@ nouveau_bo_vm_cleanup(struct ttm_buffer_object *bo,
 static int
 nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
 		struct ttm_operation_ctx *ctx,
-		struct ttm_mem_reg *new_reg)
+		struct ttm_resource *new_reg)
 {
 	struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
 	struct nouveau_bo *nvbo = nouveau_bo(bo);
-	struct ttm_mem_reg *old_reg = &bo->mem;
+	struct ttm_resource *old_reg = &bo->mem;
 	struct nouveau_drm_tile *new_tile = NULL;
 	int ret = 0;
 
@@ -1019,7 +1019,7 @@ nouveau_bo_verify_access(struct ttm_buffer_object *bo, struct file *filp)
 }
 
 static int
-nouveau_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct ttm_mem_reg *reg)
+nouveau_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct ttm_resource *reg)
 {
 	struct nouveau_drm *drm = nouveau_bdev(bdev);
 	struct nvkm_device *device = nvxx_device(&drm->client.device);
@@ -1099,7 +1099,7 @@ nouveau_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct ttm_mem_reg *reg)
 }
 
 static void
-nouveau_ttm_io_mem_free(struct ttm_bo_device *bdev, struct ttm_mem_reg *reg)
+nouveau_ttm_io_mem_free(struct ttm_bo_device *bdev, struct ttm_resource *reg)
 {
 	struct nouveau_drm *drm = nouveau_bdev(bdev);
 	struct nouveau_mem *mem = nouveau_mem(reg);
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.h b/drivers/gpu/drm/nouveau/nouveau_bo.h
index 52489ce7d029..aecb7481df0d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.h
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.h
@@ -139,28 +139,28 @@ nouveau_bo_new_pin_map(struct nouveau_cli *cli, u64 size, int align, u32 flags,
 
 int nv04_bo_move_init(struct nouveau_channel *, u32);
 int nv04_bo_move_m2mf(struct nouveau_channel *, struct ttm_buffer_object *,
-		      struct ttm_mem_reg *, struct ttm_mem_reg *);
+		      struct ttm_resource *, struct ttm_resource *);
 
 int nv50_bo_move_init(struct nouveau_channel *, u32);
 int nv50_bo_move_m2mf(struct nouveau_channel *, struct ttm_buffer_object *,
-		      struct ttm_mem_reg *, struct ttm_mem_reg *);
+		      struct ttm_resource *, struct ttm_resource *);
 
 int nv84_bo_move_exec(struct nouveau_channel *, struct ttm_buffer_object *,
-		      struct ttm_mem_reg *, struct ttm_mem_reg *);
+		      struct ttm_resource *, struct ttm_resource *);
 
 int nva3_bo_move_copy(struct nouveau_channel *, struct ttm_buffer_object *,
-		      struct ttm_mem_reg *, struct ttm_mem_reg *);
+		      struct ttm_resource *, struct ttm_resource *);
 
 int nvc0_bo_move_init(struct nouveau_channel *, u32);
 int nvc0_bo_move_m2mf(struct nouveau_channel *, struct ttm_buffer_object *,
-		      struct ttm_mem_reg *, struct ttm_mem_reg *);
+		      struct ttm_resource *, struct ttm_resource *);
 
 int nvc0_bo_move_copy(struct nouveau_channel *, struct ttm_buffer_object *,
-		      struct ttm_mem_reg *, struct ttm_mem_reg *);
+		      struct ttm_resource *, struct ttm_resource *);
 
 int nve0_bo_move_init(struct nouveau_channel *, u32);
 int nve0_bo_move_copy(struct nouveau_channel *, struct ttm_buffer_object *,
-		      struct ttm_mem_reg *, struct ttm_mem_reg *);
+		      struct ttm_resource *, struct ttm_resource *);
 
 #define NVBO_WR32_(b,o,dr,f) nouveau_bo_wr32((b), (o)/4 + (dr), (f))
 #define NVBO_RD32_(b,o,dr)   nouveau_bo_rd32((b), (o)/4 + (dr))
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo0039.c b/drivers/gpu/drm/nouveau/nouveau_bo0039.c
index bf7ae2cecaf6..7390132129fe 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo0039.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo0039.c
@@ -36,7 +36,7 @@
 
 static inline uint32_t
 nouveau_bo_mem_ctxdma(struct ttm_buffer_object *bo,
-		      struct nouveau_channel *chan, struct ttm_mem_reg *reg)
+		      struct nouveau_channel *chan, struct ttm_resource *reg)
 {
 	if (reg->mem_type == TTM_PL_TT)
 		return NvDmaTT;
@@ -45,7 +45,7 @@ nouveau_bo_mem_ctxdma(struct ttm_buffer_object *bo,
 
 int
 nv04_bo_move_m2mf(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
-		  struct ttm_mem_reg *old_reg, struct ttm_mem_reg *new_reg)
+		  struct ttm_resource *old_reg, struct ttm_resource *new_reg)
 {
 	struct nvif_push *push = chan->chan.push;
 	u32 src_ctxdma = nouveau_bo_mem_ctxdma(bo, chan, old_reg);
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo5039.c b/drivers/gpu/drm/nouveau/nouveau_bo5039.c
index f9b9b85abe44..4c75c7b3804c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo5039.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo5039.c
@@ -37,7 +37,7 @@
 
 int
 nv50_bo_move_m2mf(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
-		  struct ttm_mem_reg *old_reg, struct ttm_mem_reg *new_reg)
+		  struct ttm_resource *old_reg, struct ttm_resource *new_reg)
 {
 	struct nouveau_mem *mem = nouveau_mem(old_reg);
 	struct nvif_push *push = chan->chan.push;
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo74c1.c b/drivers/gpu/drm/nouveau/nouveau_bo74c1.c
index 1b5fd78ddcba..ed6c09d67840 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo74c1.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo74c1.c
@@ -34,7 +34,7 @@
 
 int
 nv84_bo_move_exec(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
-		  struct ttm_mem_reg *old_reg, struct ttm_mem_reg *new_reg)
+		  struct ttm_resource *old_reg, struct ttm_resource *new_reg)
 {
 	struct nouveau_mem *mem = nouveau_mem(old_reg);
 	struct nvif_push *push = chan->chan.push;
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo85b5.c b/drivers/gpu/drm/nouveau/nouveau_bo85b5.c
index f0df172b029e..dec29b2d8bb2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo85b5.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo85b5.c
@@ -38,7 +38,7 @@
 
 int
 nva3_bo_move_copy(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
-		  struct ttm_mem_reg *old_reg, struct ttm_mem_reg *new_reg)
+		  struct ttm_resource *old_reg, struct ttm_resource *new_reg)
 {
 	struct nouveau_mem *mem = nouveau_mem(old_reg);
 	struct nvif_push *push = chan->chan.push;
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo9039.c b/drivers/gpu/drm/nouveau/nouveau_bo9039.c
index 52fefb37064c..776b04976cdf 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo9039.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo9039.c
@@ -36,7 +36,7 @@
 
 int
 nvc0_bo_move_m2mf(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
-		  struct ttm_mem_reg *old_reg, struct ttm_mem_reg *new_reg)
+		  struct ttm_resource *old_reg, struct ttm_resource *new_reg)
 {
 	struct nvif_push *push = chan->chan.push;
 	struct nouveau_mem *mem = nouveau_mem(old_reg);
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo90b5.c b/drivers/gpu/drm/nouveau/nouveau_bo90b5.c
index 34b79d561c7f..8499f58213e3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo90b5.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo90b5.c
@@ -31,7 +31,7 @@
 
 int
 nvc0_bo_move_copy(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
-		  struct ttm_mem_reg *old_reg, struct ttm_mem_reg *new_reg)
+		  struct ttm_resource *old_reg, struct ttm_resource *new_reg)
 {
 	struct nouveau_mem *mem = nouveau_mem(old_reg);
 	struct nvif_push *push = chan->chan.push;
diff --git a/drivers/gpu/drm/nouveau/nouveau_boa0b5.c b/drivers/gpu/drm/nouveau/nouveau_boa0b5.c
index 394e29012e50..575212472e7a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_boa0b5.c
+++ b/drivers/gpu/drm/nouveau/nouveau_boa0b5.c
@@ -36,7 +36,7 @@
 
 int
 nve0_bo_move_copy(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
-		  struct ttm_mem_reg *old_reg, struct ttm_mem_reg *new_reg)
+		  struct ttm_resource *old_reg, struct ttm_resource *new_reg)
 {
 	struct nouveau_mem *mem = nouveau_mem(old_reg);
 	struct nvif_push *push = chan->chan.push;
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index ae76a5865a5a..f63ac72aa556 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -157,7 +157,7 @@ struct nouveau_drm {
 		atomic_t validate_sequence;
 		int (*move)(struct nouveau_channel *,
 			    struct ttm_buffer_object *,
-			    struct ttm_mem_reg *, struct ttm_mem_reg *);
+			    struct ttm_resource *, struct ttm_resource *);
 		struct nouveau_channel *chan;
 		struct nvif_object copy;
 		int mtrr;
diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
index b1bb542d3115..269d8707acc3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
@@ -92,7 +92,7 @@ nouveau_mem_fini(struct nouveau_mem *mem)
 }
 
 int
-nouveau_mem_host(struct ttm_mem_reg *reg, struct ttm_dma_tt *tt)
+nouveau_mem_host(struct ttm_resource *reg, struct ttm_dma_tt *tt)
 {
 	struct nouveau_mem *mem = nouveau_mem(reg);
 	struct nouveau_cli *cli = mem->cli;
@@ -130,7 +130,7 @@ nouveau_mem_host(struct ttm_mem_reg *reg, struct ttm_dma_tt *tt)
 }
 
 int
-nouveau_mem_vram(struct ttm_mem_reg *reg, bool contig, u8 page)
+nouveau_mem_vram(struct ttm_resource *reg, bool contig, u8 page)
 {
 	struct nouveau_mem *mem = nouveau_mem(reg);
 	struct nouveau_cli *cli = mem->cli;
@@ -173,7 +173,7 @@ nouveau_mem_vram(struct ttm_mem_reg *reg, bool contig, u8 page)
 }
 
 void
-nouveau_mem_del(struct ttm_mem_reg *reg)
+nouveau_mem_del(struct ttm_resource *reg)
 {
 	struct nouveau_mem *mem = nouveau_mem(reg);
 	nouveau_mem_fini(mem);
@@ -183,7 +183,7 @@ nouveau_mem_del(struct ttm_mem_reg *reg)
 
 int
 nouveau_mem_new(struct nouveau_cli *cli, u8 kind, u8 comp,
-		struct ttm_mem_reg *reg)
+		struct ttm_resource *reg)
 {
 	struct nouveau_mem *mem;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.h b/drivers/gpu/drm/nouveau/nouveau_mem.h
index f6d039e73812..3fe1cfed57a1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.h
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.h
@@ -7,7 +7,7 @@ struct ttm_dma_tt;
 #include <nvif/vmm.h>
 
 static inline struct nouveau_mem *
-nouveau_mem(struct ttm_mem_reg *reg)
+nouveau_mem(struct ttm_resource *reg)
 {
 	return reg->mm_node;
 }
@@ -21,10 +21,10 @@ struct nouveau_mem {
 };
 
 int nouveau_mem_new(struct nouveau_cli *, u8 kind, u8 comp,
-		    struct ttm_mem_reg *);
-void nouveau_mem_del(struct ttm_mem_reg *);
-int nouveau_mem_vram(struct ttm_mem_reg *, bool contig, u8 page);
-int nouveau_mem_host(struct ttm_mem_reg *, struct ttm_dma_tt *);
+		    struct ttm_resource *);
+void nouveau_mem_del(struct ttm_resource *);
+int nouveau_mem_vram(struct ttm_resource *, bool contig, u8 page);
+int nouveau_mem_host(struct ttm_resource *, struct ttm_dma_tt *);
 void nouveau_mem_fini(struct nouveau_mem *);
 int nouveau_mem_map(struct nouveau_mem *, struct nvif_vmm *, struct nvif_vma *);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_sgdma.c b/drivers/gpu/drm/nouveau/nouveau_sgdma.c
index c3ccf661b7a6..eef75c53a197 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sgdma.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sgdma.c
@@ -26,7 +26,7 @@ nouveau_sgdma_destroy(struct ttm_tt *ttm)
 }
 
 static int
-nv04_sgdma_bind(struct ttm_tt *ttm, struct ttm_mem_reg *reg)
+nv04_sgdma_bind(struct ttm_tt *ttm, struct ttm_resource *reg)
 {
 	struct nouveau_sgdma_be *nvbe = (struct nouveau_sgdma_be *)ttm;
 	struct nouveau_mem *mem = nouveau_mem(reg);
@@ -60,7 +60,7 @@ static struct ttm_backend_func nv04_sgdma_backend = {
 };
 
 static int
-nv50_sgdma_bind(struct ttm_tt *ttm, struct ttm_mem_reg *reg)
+nv50_sgdma_bind(struct ttm_tt *ttm, struct ttm_resource *reg)
 {
 	struct nouveau_sgdma_be *nvbe = (struct nouveau_sgdma_be *)ttm;
 	struct nouveau_mem *mem = nouveau_mem(reg);
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index d6ad0977dc7d..9e96b6ff24cf 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -32,7 +32,7 @@
 #include <core/tegra.h>
 
 static void
-nouveau_manager_del(struct ttm_resource_manager *man, struct ttm_mem_reg *reg)
+nouveau_manager_del(struct ttm_resource_manager *man, struct ttm_resource *reg)
 {
 	nouveau_mem_del(reg);
 }
@@ -41,7 +41,7 @@ static int
 nouveau_vram_manager_new(struct ttm_resource_manager *man,
 			 struct ttm_buffer_object *bo,
 			 const struct ttm_place *place,
-			 struct ttm_mem_reg *reg)
+			 struct ttm_resource *reg)
 {
 	struct nouveau_bo *nvbo = nouveau_bo(bo);
 	struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
@@ -72,7 +72,7 @@ static int
 nouveau_gart_manager_new(struct ttm_resource_manager *man,
 			 struct ttm_buffer_object *bo,
 			 const struct ttm_place *place,
-			 struct ttm_mem_reg *reg)
+			 struct ttm_resource *reg)
 {
 	struct nouveau_bo *nvbo = nouveau_bo(bo);
 	struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
@@ -95,7 +95,7 @@ static int
 nv04_gart_manager_new(struct ttm_resource_manager *man,
 		      struct ttm_buffer_object *bo,
 		      const struct ttm_place *place,
-		      struct ttm_mem_reg *reg)
+		      struct ttm_resource *reg)
 {
 	struct nouveau_bo *nvbo = nouveau_bo(bo);
 	struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
diff --git a/drivers/gpu/drm/nouveau/nv17_fence.c b/drivers/gpu/drm/nouveau/nv17_fence.c
index cd1e87a528a4..6b697ee6bc0e 100644
--- a/drivers/gpu/drm/nouveau/nv17_fence.c
+++ b/drivers/gpu/drm/nouveau/nv17_fence.c
@@ -78,7 +78,7 @@ nv17_fence_context_new(struct nouveau_channel *chan)
 {
 	struct nv10_fence_priv *priv = chan->drm->fence;
 	struct nv10_fence_chan *fctx;
-	struct ttm_mem_reg *reg = &priv->bo->bo.mem;
+	struct ttm_resource *reg = &priv->bo->bo.mem;
 	u32 start = reg->start * PAGE_SIZE;
 	u32 limit = start + reg->size - 1;
 	int ret = 0;
diff --git a/drivers/gpu/drm/nouveau/nv50_fence.c b/drivers/gpu/drm/nouveau/nv50_fence.c
index ebb740686b44..49b46f51073c 100644
--- a/drivers/gpu/drm/nouveau/nv50_fence.c
+++ b/drivers/gpu/drm/nouveau/nv50_fence.c
@@ -37,7 +37,7 @@ nv50_fence_context_new(struct nouveau_channel *chan)
 {
 	struct nv10_fence_priv *priv = chan->drm->fence;
 	struct nv10_fence_chan *fctx;
-	struct ttm_mem_reg *reg = &priv->bo->bo.mem;
+	struct ttm_resource *reg = &priv->bo->bo.mem;
 	u32 start = reg->start * PAGE_SIZE;
 	u32 limit = start + reg->size - 1;
 	int ret;
diff --git a/drivers/gpu/drm/qxl/qxl_drv.h b/drivers/gpu/drm/qxl/qxl_drv.h
index 9691449aefdb..aae90a9ee1db 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.h
+++ b/drivers/gpu/drm/qxl/qxl_drv.h
@@ -350,7 +350,7 @@ int qxl_mode_dumb_mmap(struct drm_file *filp,
 int qxl_ttm_init(struct qxl_device *qdev);
 void qxl_ttm_fini(struct qxl_device *qdev);
 int qxl_ttm_io_mem_reserve(struct ttm_bo_device *bdev,
-			   struct ttm_mem_reg *mem);
+			   struct ttm_resource *mem);
 
 /* qxl image */
 
diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
index 1c06fe780815..dc31f3fea33c 100644
--- a/drivers/gpu/drm/qxl/qxl_ttm.c
+++ b/drivers/gpu/drm/qxl/qxl_ttm.c
@@ -71,7 +71,7 @@ static void qxl_evict_flags(struct ttm_buffer_object *bo,
 }
 
 int qxl_ttm_io_mem_reserve(struct ttm_bo_device *bdev,
-			   struct ttm_mem_reg *mem)
+			   struct ttm_resource *mem)
 {
 	struct qxl_device *qdev = qxl_get_qdev(bdev);
 
@@ -111,7 +111,7 @@ struct qxl_ttm_tt {
 };
 
 static int qxl_ttm_backend_bind(struct ttm_tt *ttm,
-				struct ttm_mem_reg *bo_mem)
+				struct ttm_resource *bo_mem)
 {
 	struct qxl_ttm_tt *gtt = (void *)ttm;
 
@@ -163,9 +163,9 @@ static struct ttm_tt *qxl_ttm_tt_create(struct ttm_buffer_object *bo,
 }
 
 static void qxl_move_null(struct ttm_buffer_object *bo,
-			     struct ttm_mem_reg *new_mem)
+			     struct ttm_resource *new_mem)
 {
-	struct ttm_mem_reg *old_mem = &bo->mem;
+	struct ttm_resource *old_mem = &bo->mem;
 
 	BUG_ON(old_mem->mm_node != NULL);
 	*old_mem = *new_mem;
@@ -174,9 +174,9 @@ static void qxl_move_null(struct ttm_buffer_object *bo,
 
 static int qxl_bo_move(struct ttm_buffer_object *bo, bool evict,
 		       struct ttm_operation_ctx *ctx,
-		       struct ttm_mem_reg *new_mem)
+		       struct ttm_resource *new_mem)
 {
-	struct ttm_mem_reg *old_mem = &bo->mem;
+	struct ttm_resource *old_mem = &bo->mem;
 	int ret;
 
 	ret = ttm_bo_wait(bo, ctx->interruptible, ctx->no_wait_gpu);
@@ -192,7 +192,7 @@ static int qxl_bo_move(struct ttm_buffer_object *bo, bool evict,
 
 static void qxl_bo_move_notify(struct ttm_buffer_object *bo,
 			       bool evict,
-			       struct ttm_mem_reg *new_mem)
+			       struct ttm_resource *new_mem)
 {
 	struct qxl_bo *qbo;
 	struct qxl_device *qdev;
diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
index b7c3fb2bfb54..cc4f58d16589 100644
--- a/drivers/gpu/drm/radeon/radeon.h
+++ b/drivers/gpu/drm/radeon/radeon.h
@@ -2857,7 +2857,7 @@ int radeon_vm_clear_invalids(struct radeon_device *rdev,
 			     struct radeon_vm *vm);
 int radeon_vm_bo_update(struct radeon_device *rdev,
 			struct radeon_bo_va *bo_va,
-			struct ttm_mem_reg *mem);
+			struct ttm_resource *mem);
 void radeon_vm_bo_invalidate(struct radeon_device *rdev,
 			     struct radeon_bo *bo);
 struct radeon_bo_va *radeon_vm_bo_find(struct radeon_vm *vm,
diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
index f3dee01250da..bb7582afd803 100644
--- a/drivers/gpu/drm/radeon/radeon_object.c
+++ b/drivers/gpu/drm/radeon/radeon_object.c
@@ -775,7 +775,7 @@ int radeon_bo_check_tiling(struct radeon_bo *bo, bool has_moved,
 
 void radeon_bo_move_notify(struct ttm_buffer_object *bo,
 			   bool evict,
-			   struct ttm_mem_reg *new_mem)
+			   struct ttm_resource *new_mem)
 {
 	struct radeon_bo *rbo;
 
diff --git a/drivers/gpu/drm/radeon/radeon_object.h b/drivers/gpu/drm/radeon/radeon_object.h
index 60275b822f79..44b47241ee42 100644
--- a/drivers/gpu/drm/radeon/radeon_object.h
+++ b/drivers/gpu/drm/radeon/radeon_object.h
@@ -165,7 +165,7 @@ extern int radeon_bo_check_tiling(struct radeon_bo *bo, bool has_moved,
 				bool force_drop);
 extern void radeon_bo_move_notify(struct ttm_buffer_object *bo,
 				  bool evict,
-				  struct ttm_mem_reg *new_mem);
+				  struct ttm_resource *new_mem);
 extern int radeon_bo_fault_reserve_notify(struct ttm_buffer_object *bo);
 extern int radeon_bo_get_surface_reg(struct radeon_bo *bo);
 extern void radeon_bo_fence(struct radeon_bo *bo, struct radeon_fence *fence,
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 05b5f29f2b61..a068d6960c23 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -166,9 +166,9 @@ static int radeon_verify_access(struct ttm_buffer_object *bo, struct file *filp)
 }
 
 static void radeon_move_null(struct ttm_buffer_object *bo,
-			     struct ttm_mem_reg *new_mem)
+			     struct ttm_resource *new_mem)
 {
-	struct ttm_mem_reg *old_mem = &bo->mem;
+	struct ttm_resource *old_mem = &bo->mem;
 
 	BUG_ON(old_mem->mm_node != NULL);
 	*old_mem = *new_mem;
@@ -177,8 +177,8 @@ static void radeon_move_null(struct ttm_buffer_object *bo,
 
 static int radeon_move_blit(struct ttm_buffer_object *bo,
 			bool evict, bool no_wait_gpu,
-			struct ttm_mem_reg *new_mem,
-			struct ttm_mem_reg *old_mem)
+			struct ttm_resource *new_mem,
+			struct ttm_resource *old_mem)
 {
 	struct radeon_device *rdev;
 	uint64_t old_start, new_start;
@@ -233,11 +233,11 @@ static int radeon_move_blit(struct ttm_buffer_object *bo,
 static int radeon_move_vram_ram(struct ttm_buffer_object *bo,
 				bool evict, bool interruptible,
 				bool no_wait_gpu,
-				struct ttm_mem_reg *new_mem)
+				struct ttm_resource *new_mem)
 {
 	struct ttm_operation_ctx ctx = { interruptible, no_wait_gpu };
-	struct ttm_mem_reg *old_mem = &bo->mem;
-	struct ttm_mem_reg tmp_mem;
+	struct ttm_resource *old_mem = &bo->mem;
+	struct ttm_resource tmp_mem;
 	struct ttm_place placements;
 	struct ttm_placement placement;
 	int r;
@@ -278,11 +278,11 @@ static int radeon_move_vram_ram(struct ttm_buffer_object *bo,
 static int radeon_move_ram_vram(struct ttm_buffer_object *bo,
 				bool evict, bool interruptible,
 				bool no_wait_gpu,
-				struct ttm_mem_reg *new_mem)
+				struct ttm_resource *new_mem)
 {
 	struct ttm_operation_ctx ctx = { interruptible, no_wait_gpu };
-	struct ttm_mem_reg *old_mem = &bo->mem;
-	struct ttm_mem_reg tmp_mem;
+	struct ttm_resource *old_mem = &bo->mem;
+	struct ttm_resource tmp_mem;
 	struct ttm_placement placement;
 	struct ttm_place placements;
 	int r;
@@ -315,11 +315,11 @@ static int radeon_move_ram_vram(struct ttm_buffer_object *bo,
 
 static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
 			  struct ttm_operation_ctx *ctx,
-			  struct ttm_mem_reg *new_mem)
+			  struct ttm_resource *new_mem)
 {
 	struct radeon_device *rdev;
 	struct radeon_bo *rbo;
-	struct ttm_mem_reg *old_mem = &bo->mem;
+	struct ttm_resource *old_mem = &bo->mem;
 	int r;
 
 	r = ttm_bo_wait(bo, ctx->interruptible, ctx->no_wait_gpu);
@@ -376,7 +376,7 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
 	return 0;
 }
 
-static int radeon_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct ttm_mem_reg *mem)
+static int radeon_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct ttm_resource *mem)
 {
 	struct radeon_device *rdev = radeon_get_rdev(bdev);
 
@@ -544,7 +544,7 @@ static void radeon_ttm_tt_unpin_userptr(struct ttm_tt *ttm)
 }
 
 static int radeon_ttm_backend_bind(struct ttm_tt *ttm,
-				   struct ttm_mem_reg *bo_mem)
+				   struct ttm_resource *bo_mem)
 {
 	struct radeon_ttm_tt *gtt = (void*)ttm;
 	uint32_t flags = RADEON_GART_PAGE_VALID | RADEON_GART_PAGE_READ |
diff --git a/drivers/gpu/drm/radeon/radeon_vm.c b/drivers/gpu/drm/radeon/radeon_vm.c
index f60fae0aed11..71e2c3785ab9 100644
--- a/drivers/gpu/drm/radeon/radeon_vm.c
+++ b/drivers/gpu/drm/radeon/radeon_vm.c
@@ -911,7 +911,7 @@ static void radeon_vm_fence_pts(struct radeon_vm *vm,
  */
 int radeon_vm_bo_update(struct radeon_device *rdev,
 			struct radeon_bo_va *bo_va,
-			struct ttm_mem_reg *mem)
+			struct ttm_resource *mem)
 {
 	struct radeon_vm *vm = bo_va->vm;
 	struct radeon_ib ib;
diff --git a/drivers/gpu/drm/ttm/ttm_agp_backend.c b/drivers/gpu/drm/ttm/ttm_agp_backend.c
index 38f1351140e2..09fe80e215c5 100644
--- a/drivers/gpu/drm/ttm/ttm_agp_backend.c
+++ b/drivers/gpu/drm/ttm/ttm_agp_backend.c
@@ -48,7 +48,7 @@ struct ttm_agp_backend {
 	struct agp_bridge_data *bridge;
 };
 
-static int ttm_agp_bind(struct ttm_tt *ttm, struct ttm_mem_reg *bo_mem)
+static int ttm_agp_bind(struct ttm_tt *ttm, struct ttm_resource *bo_mem)
 {
 	struct ttm_agp_backend *agp_be = container_of(ttm, struct ttm_agp_backend, ttm);
 	struct page *dummy_read_page = ttm_bo_glob.dummy_read_page;
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 48840a3cf4c4..1ea5de976ec3 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -145,7 +145,7 @@ static inline uint32_t ttm_bo_type_flags(unsigned type)
 }
 
 static void ttm_bo_add_mem_to_lru(struct ttm_buffer_object *bo,
-				  struct ttm_mem_reg *mem)
+				  struct ttm_resource *mem)
 {
 	struct ttm_bo_device *bdev = bo->bdev;
 	struct ttm_resource_manager *man;
@@ -268,7 +268,7 @@ void ttm_bo_bulk_move_lru_tail(struct ttm_lru_bulk_move *bulk)
 EXPORT_SYMBOL(ttm_bo_bulk_move_lru_tail);
 
 static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
-				  struct ttm_mem_reg *mem, bool evict,
+				  struct ttm_resource *mem, bool evict,
 				  struct ttm_operation_ctx *ctx)
 {
 	struct ttm_bo_device *bdev = bo->bdev;
@@ -642,7 +642,7 @@ static int ttm_bo_evict(struct ttm_buffer_object *bo,
 			struct ttm_operation_ctx *ctx)
 {
 	struct ttm_bo_device *bdev = bo->bdev;
-	struct ttm_mem_reg evict_mem;
+	struct ttm_resource evict_mem;
 	struct ttm_placement placement;
 	int ret = 0;
 
@@ -841,7 +841,7 @@ static int ttm_mem_evict_first(struct ttm_bo_device *bdev,
 
 static int ttm_bo_mem_get(struct ttm_buffer_object *bo,
 			  const struct ttm_place *place,
-			  struct ttm_mem_reg *mem)
+			  struct ttm_resource *mem)
 {
 	struct ttm_resource_manager *man = ttm_manager_type(bo->bdev, mem->mem_type);
 
@@ -852,7 +852,7 @@ static int ttm_bo_mem_get(struct ttm_buffer_object *bo,
 	return man->func->get_node(man, bo, place, mem);
 }
 
-void ttm_bo_mem_put(struct ttm_buffer_object *bo, struct ttm_mem_reg *mem)
+void ttm_bo_mem_put(struct ttm_buffer_object *bo, struct ttm_resource *mem)
 {
 	struct ttm_resource_manager *man = ttm_manager_type(bo->bdev, mem->mem_type);
 
@@ -870,7 +870,7 @@ EXPORT_SYMBOL(ttm_bo_mem_put);
  */
 static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
 				 struct ttm_resource_manager *man,
-				 struct ttm_mem_reg *mem,
+				 struct ttm_resource *mem,
 				 bool no_wait_gpu)
 {
 	struct dma_fence *fence;
@@ -907,7 +907,7 @@ static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
  */
 static int ttm_bo_mem_force_space(struct ttm_buffer_object *bo,
 				  const struct ttm_place *place,
-				  struct ttm_mem_reg *mem,
+				  struct ttm_resource *mem,
 				  struct ttm_operation_ctx *ctx)
 {
 	struct ttm_bo_device *bdev = bo->bdev;
@@ -988,7 +988,7 @@ static bool ttm_bo_mt_compatible(struct ttm_resource_manager *man,
  */
 static int ttm_bo_mem_placement(struct ttm_buffer_object *bo,
 				const struct ttm_place *place,
-				struct ttm_mem_reg *mem,
+				struct ttm_resource *mem,
 				struct ttm_operation_ctx *ctx)
 {
 	struct ttm_bo_device *bdev = bo->bdev;
@@ -1036,7 +1036,7 @@ static int ttm_bo_mem_placement(struct ttm_buffer_object *bo,
  */
 int ttm_bo_mem_space(struct ttm_buffer_object *bo,
 			struct ttm_placement *placement,
-			struct ttm_mem_reg *mem,
+			struct ttm_resource *mem,
 			struct ttm_operation_ctx *ctx)
 {
 	struct ttm_bo_device *bdev = bo->bdev;
@@ -1114,7 +1114,7 @@ static int ttm_bo_move_buffer(struct ttm_buffer_object *bo,
 			      struct ttm_operation_ctx *ctx)
 {
 	int ret = 0;
-	struct ttm_mem_reg mem;
+	struct ttm_resource mem;
 
 	dma_resv_assert_held(bo->base.resv);
 
@@ -1140,7 +1140,7 @@ static int ttm_bo_move_buffer(struct ttm_buffer_object *bo,
 
 static bool ttm_bo_places_compat(const struct ttm_place *places,
 				 unsigned num_placement,
-				 struct ttm_mem_reg *mem,
+				 struct ttm_resource *mem,
 				 uint32_t *new_flags)
 {
 	unsigned i;
@@ -1163,7 +1163,7 @@ static bool ttm_bo_places_compat(const struct ttm_place *places,
 }
 
 bool ttm_bo_mem_compat(struct ttm_placement *placement,
-		       struct ttm_mem_reg *mem,
+		       struct ttm_resource *mem,
 		       uint32_t *new_flags)
 {
 	if (ttm_bo_places_compat(placement->placement, placement->num_placement,
@@ -1732,7 +1732,7 @@ int ttm_bo_swapout(struct ttm_bo_global *glob, struct ttm_operation_ctx *ctx)
 	if (bo->mem.mem_type != TTM_PL_SYSTEM ||
 	    bo->ttm->caching_state != tt_cached) {
 		struct ttm_operation_ctx ctx = { false, false };
-		struct ttm_mem_reg evict_mem;
+		struct ttm_resource evict_mem;
 
 		evict_mem = bo->mem;
 		evict_mem.mm_node = NULL;
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 8ef0de8e36c5..496158acd5b9 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -52,10 +52,10 @@ void ttm_bo_free_old_node(struct ttm_buffer_object *bo)
 
 int ttm_bo_move_ttm(struct ttm_buffer_object *bo,
 		   struct ttm_operation_ctx *ctx,
-		    struct ttm_mem_reg *new_mem)
+		    struct ttm_resource *new_mem)
 {
 	struct ttm_tt *ttm = bo->ttm;
-	struct ttm_mem_reg *old_mem = &bo->mem;
+	struct ttm_resource *old_mem = &bo->mem;
 	int ret;
 
 	if (old_mem->mem_type != TTM_PL_SYSTEM) {
@@ -127,7 +127,7 @@ static int ttm_mem_io_evict(struct ttm_resource_manager *man)
 }
 
 int ttm_mem_io_reserve(struct ttm_bo_device *bdev,
-		       struct ttm_mem_reg *mem)
+		       struct ttm_resource *mem)
 {
 	struct ttm_resource_manager *man = ttm_manager_type(bdev, mem->mem_type);
 	int ret;
@@ -149,7 +149,7 @@ int ttm_mem_io_reserve(struct ttm_bo_device *bdev,
 }
 
 void ttm_mem_io_free(struct ttm_bo_device *bdev,
-		     struct ttm_mem_reg *mem)
+		     struct ttm_resource *mem)
 {
 	if (--mem->bus.io_reserved_count)
 		return;
@@ -163,7 +163,7 @@ void ttm_mem_io_free(struct ttm_bo_device *bdev,
 int ttm_mem_io_reserve_vm(struct ttm_buffer_object *bo)
 {
 	struct ttm_resource_manager *man = ttm_manager_type(bo->bdev, bo->mem.mem_type);
-	struct ttm_mem_reg *mem = &bo->mem;
+	struct ttm_resource *mem = &bo->mem;
 	int ret;
 
 	if (mem->bus.io_reserved_vm)
@@ -181,7 +181,7 @@ int ttm_mem_io_reserve_vm(struct ttm_buffer_object *bo)
 
 void ttm_mem_io_free_vm(struct ttm_buffer_object *bo)
 {
-	struct ttm_mem_reg *mem = &bo->mem;
+	struct ttm_resource *mem = &bo->mem;
 
 	if (!mem->bus.io_reserved_vm)
 		return;
@@ -191,8 +191,8 @@ void ttm_mem_io_free_vm(struct ttm_buffer_object *bo)
 	ttm_mem_io_free(bo->bdev, mem);
 }
 
-static int ttm_mem_reg_ioremap(struct ttm_bo_device *bdev,
-			       struct ttm_mem_reg *mem,
+static int ttm_resource_ioremap(struct ttm_bo_device *bdev,
+			       struct ttm_resource *mem,
 			       void **virtual)
 {
 	struct ttm_resource_manager *man = ttm_manager_type(bdev, mem->mem_type);
@@ -226,8 +226,8 @@ static int ttm_mem_reg_ioremap(struct ttm_bo_device *bdev,
 	return 0;
 }
 
-static void ttm_mem_reg_iounmap(struct ttm_bo_device *bdev,
-				struct ttm_mem_reg *mem,
+static void ttm_resource_iounmap(struct ttm_bo_device *bdev,
+				struct ttm_resource *mem,
 				void *virtual)
 {
 	struct ttm_resource_manager *man;
@@ -300,13 +300,13 @@ static int ttm_copy_ttm_io_page(struct ttm_tt *ttm, void *dst,
 
 int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
 		       struct ttm_operation_ctx *ctx,
-		       struct ttm_mem_reg *new_mem)
+		       struct ttm_resource *new_mem)
 {
 	struct ttm_bo_device *bdev = bo->bdev;
 	struct ttm_resource_manager *man = ttm_manager_type(bdev, new_mem->mem_type);
 	struct ttm_tt *ttm = bo->ttm;
-	struct ttm_mem_reg *old_mem = &bo->mem;
-	struct ttm_mem_reg old_copy = *old_mem;
+	struct ttm_resource *old_mem = &bo->mem;
+	struct ttm_resource old_copy = *old_mem;
 	void *old_iomap;
 	void *new_iomap;
 	int ret;
@@ -319,10 +319,10 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
 	if (ret)
 		return ret;
 
-	ret = ttm_mem_reg_ioremap(bdev, old_mem, &old_iomap);
+	ret = ttm_resource_ioremap(bdev, old_mem, &old_iomap);
 	if (ret)
 		return ret;
-	ret = ttm_mem_reg_ioremap(bdev, new_mem, &new_iomap);
+	ret = ttm_resource_ioremap(bdev, new_mem, &new_iomap);
 	if (ret)
 		goto out;
 
@@ -390,9 +390,9 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
 	}
 
 out1:
-	ttm_mem_reg_iounmap(bdev, old_mem, new_iomap);
+	ttm_resource_iounmap(bdev, old_mem, new_iomap);
 out:
-	ttm_mem_reg_iounmap(bdev, &old_copy, old_iomap);
+	ttm_resource_iounmap(bdev, &old_copy, old_iomap);
 
 	/*
 	 * On error, keep the mm node!
@@ -502,7 +502,7 @@ static int ttm_bo_ioremap(struct ttm_buffer_object *bo,
 			  unsigned long size,
 			  struct ttm_bo_kmap_obj *map)
 {
-	struct ttm_mem_reg *mem = &bo->mem;
+	struct ttm_resource *mem = &bo->mem;
 
 	if (bo->mem.bus.addr) {
 		map->bo_kmap_type = ttm_bo_map_premapped;
@@ -526,7 +526,7 @@ static int ttm_bo_kmap_ttm(struct ttm_buffer_object *bo,
 			   unsigned long num_pages,
 			   struct ttm_bo_kmap_obj *map)
 {
-	struct ttm_mem_reg *mem = &bo->mem;
+	struct ttm_resource *mem = &bo->mem;
 	struct ttm_operation_ctx ctx = {
 		.interruptible = false,
 		.no_wait_gpu = false
@@ -631,11 +631,11 @@ EXPORT_SYMBOL(ttm_bo_kunmap);
 int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
 			      struct dma_fence *fence,
 			      bool evict,
-			      struct ttm_mem_reg *new_mem)
+			      struct ttm_resource *new_mem)
 {
 	struct ttm_bo_device *bdev = bo->bdev;
 	struct ttm_resource_manager *man = ttm_manager_type(bdev, new_mem->mem_type);
-	struct ttm_mem_reg *old_mem = &bo->mem;
+	struct ttm_resource *old_mem = &bo->mem;
 	int ret;
 	struct ttm_buffer_object *ghost_obj;
 
@@ -692,10 +692,10 @@ EXPORT_SYMBOL(ttm_bo_move_accel_cleanup);
 
 int ttm_bo_pipeline_move(struct ttm_buffer_object *bo,
 			 struct dma_fence *fence, bool evict,
-			 struct ttm_mem_reg *new_mem)
+			 struct ttm_resource *new_mem)
 {
 	struct ttm_bo_device *bdev = bo->bdev;
-	struct ttm_mem_reg *old_mem = &bo->mem;
+	struct ttm_resource *old_mem = &bo->mem;
 
 	struct ttm_resource_manager *from = ttm_manager_type(bdev, old_mem->mem_type);
 	struct ttm_resource_manager *to = ttm_manager_type(bdev, new_mem->mem_type);
diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
index 22de9f209449..7442d811f867 100644
--- a/drivers/gpu/drm/ttm/ttm_range_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
@@ -57,7 +57,7 @@ static inline struct ttm_range_manager *to_range_manager(struct ttm_resource_man
 static int ttm_range_man_get_node(struct ttm_resource_manager *man,
 				  struct ttm_buffer_object *bo,
 				  const struct ttm_place *place,
-				  struct ttm_mem_reg *mem)
+				  struct ttm_resource *mem)
 {
 	struct ttm_range_manager *rman = to_range_manager(man);
 	struct drm_mm *mm = &rman->mm;
@@ -96,7 +96,7 @@ static int ttm_range_man_get_node(struct ttm_resource_manager *man,
 }
 
 static void ttm_range_man_put_node(struct ttm_resource_manager *man,
-				   struct ttm_mem_reg *mem)
+				   struct ttm_resource *mem)
 {
 	struct ttm_range_manager *rman = to_range_manager(man);
 
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 9d1c7177384c..1ccf1ef050d6 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -316,7 +316,7 @@ void ttm_tt_unbind(struct ttm_tt *ttm)
 	}
 }
 
-int ttm_tt_bind(struct ttm_tt *ttm, struct ttm_mem_reg *bo_mem,
+int ttm_tt_bind(struct ttm_tt *ttm, struct ttm_resource *bo_mem,
 		struct ttm_operation_ctx *ctx)
 {
 	int ret = 0;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index 1e59c019affa..3229451d0706 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -1135,14 +1135,14 @@ void vmw_bo_swap_notify(struct ttm_buffer_object *bo)
  * vmw_bo_move_notify - TTM move_notify_callback
  *
  * @bo: The TTM buffer object about to move.
- * @mem: The struct ttm_mem_reg indicating to what memory
+ * @mem: The struct ttm_resource indicating to what memory
  *       region the move is taking place.
  *
  * Detaches cached maps and device bindings that require that the
  * buffer doesn't move.
  */
 void vmw_bo_move_notify(struct ttm_buffer_object *bo,
-			struct ttm_mem_reg *mem)
+			struct ttm_resource *mem)
 {
 	struct vmw_buffer_object *vbo;
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index aa763c6b1146..871ad738dadb 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -793,7 +793,7 @@ extern void vmw_resource_unreserve(struct vmw_resource *res,
 				   struct vmw_buffer_object *new_backup,
 				   unsigned long new_backup_offset);
 extern void vmw_query_move_notify(struct ttm_buffer_object *bo,
-				  struct ttm_mem_reg *mem);
+				  struct ttm_resource *mem);
 extern int vmw_query_readback_all(struct vmw_buffer_object *dx_query_mob);
 extern void vmw_resource_evict_all(struct vmw_private *dev_priv);
 extern void vmw_resource_unbind_list(struct vmw_buffer_object *vbo);
@@ -878,7 +878,7 @@ extern void vmw_bo_fence_single(struct ttm_buffer_object *bo,
 extern void *vmw_bo_map_and_cache(struct vmw_buffer_object *vbo);
 extern void vmw_bo_unmap(struct vmw_buffer_object *vbo);
 extern void vmw_bo_move_notify(struct ttm_buffer_object *bo,
-			       struct ttm_mem_reg *mem);
+			       struct ttm_resource *mem);
 extern void vmw_bo_swap_notify(struct ttm_buffer_object *bo);
 extern struct vmw_buffer_object *
 vmw_user_bo_noref_lookup(struct ttm_object_file *tfile, u32 handle);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
index c8fe6e9cf092..3fea7a6c7cfa 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
@@ -53,7 +53,7 @@ static struct vmwgfx_gmrid_man *to_gmrid_manager(struct ttm_resource_manager *ma
 static int vmw_gmrid_man_get_node(struct ttm_resource_manager *man,
 				  struct ttm_buffer_object *bo,
 				  const struct ttm_place *place,
-				  struct ttm_mem_reg *mem)
+				  struct ttm_resource *mem)
 {
 	struct vmwgfx_gmrid_man *gman = to_gmrid_manager(man);
 	int id;
@@ -85,7 +85,7 @@ static int vmw_gmrid_man_get_node(struct ttm_resource_manager *man,
 }
 
 static void vmw_gmrid_man_put_node(struct ttm_resource_manager *man,
-				   struct ttm_mem_reg *mem)
+				   struct ttm_resource *mem)
 {
 	struct vmwgfx_gmrid_man *gman = to_gmrid_manager(man);
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
index c8441030637a..c0f156078dda 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
@@ -855,7 +855,7 @@ int vmw_query_readback_all(struct vmw_buffer_object *dx_query_mob)
  * states from the device.
  */
 void vmw_query_move_notify(struct ttm_buffer_object *bo,
-			   struct ttm_mem_reg *mem)
+			   struct ttm_resource *mem)
 {
 	struct vmw_buffer_object *dx_query_mob;
 	struct ttm_bo_device *bdev = bo->bdev;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
index 6cac7b091205..f594e2e6ab7e 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
@@ -29,7 +29,7 @@ static struct vmw_thp_manager *to_thp_manager(struct ttm_resource_manager *man)
 static int vmw_thp_insert_aligned(struct drm_mm *mm, struct drm_mm_node *node,
 				  unsigned long align_pages,
 				  const struct ttm_place *place,
-				  struct ttm_mem_reg *mem,
+				  struct ttm_resource *mem,
 				  unsigned long lpfn,
 				  enum drm_mm_insert_mode mode)
 {
@@ -47,7 +47,7 @@ static int vmw_thp_insert_aligned(struct drm_mm *mm, struct drm_mm_node *node,
 static int vmw_thp_get_node(struct ttm_resource_manager *man,
 			    struct ttm_buffer_object *bo,
 			    const struct ttm_place *place,
-			    struct ttm_mem_reg *mem)
+			    struct ttm_resource *mem)
 {
 	struct vmw_thp_manager *rman = to_thp_manager(man);
 	struct drm_mm *mm = &rman->mm;
@@ -107,7 +107,7 @@ static int vmw_thp_get_node(struct ttm_resource_manager *man,
 
 
 static void vmw_thp_put_node(struct ttm_resource_manager *man,
-			     struct ttm_mem_reg *mem)
+			     struct ttm_resource *mem)
 {
 	struct vmw_thp_manager *rman = to_thp_manager(man);
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index 3a141a08d4bd..7247347a9bca 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -539,7 +539,7 @@ const struct vmw_sg_table *vmw_bo_sg_table(struct ttm_buffer_object *bo)
 }
 
 
-static int vmw_ttm_bind(struct ttm_tt *ttm, struct ttm_mem_reg *bo_mem)
+static int vmw_ttm_bind(struct ttm_tt *ttm, struct ttm_resource *bo_mem)
 {
 	struct vmw_ttm_tt *vmw_be =
 		container_of(ttm, struct vmw_ttm_tt, dma_ttm.ttm);
@@ -711,7 +711,7 @@ static int vmw_verify_access(struct ttm_buffer_object *bo, struct file *filp)
 	return vmw_user_bo_verify_access(bo, tfile);
 }
 
-static int vmw_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct ttm_mem_reg *mem)
+static int vmw_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct ttm_resource *mem)
 {
 	struct vmw_private *dev_priv = container_of(bdev, struct vmw_private, bdev);
 
@@ -741,7 +741,7 @@ static int vmw_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct ttm_mem_reg
  * vmw_move_notify - TTM move_notify_callback
  *
  * @bo: The TTM buffer object about to move.
- * @mem: The struct ttm_mem_reg indicating to what memory
+ * @mem: The struct ttm_resource indicating to what memory
  *       region the move is taking place.
  *
  * Calls move_notify for all subsystems needing it.
@@ -749,7 +749,7 @@ static int vmw_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct ttm_mem_reg
  */
 static void vmw_move_notify(struct ttm_buffer_object *bo,
 			    bool evict,
-			    struct ttm_mem_reg *mem)
+			    struct ttm_resource *mem)
 {
 	vmw_bo_move_notify(bo, mem);
 	vmw_query_move_notify(bo, mem);
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index 15958dff11d2..247d4f803443 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -81,7 +81,7 @@ struct ttm_bus_placement {
 
 
 /**
- * struct ttm_mem_reg
+ * struct ttm_resource
  *
  * @mm_node: Memory manager node.
  * @size: Requested size of memory region.
@@ -94,7 +94,7 @@ struct ttm_bus_placement {
  * buffer object.
  */
 
-struct ttm_mem_reg {
+struct ttm_resource {
 	void *mm_node;
 	unsigned long start;
 	unsigned long size;
@@ -187,7 +187,7 @@ struct ttm_buffer_object {
 	 * Members protected by the bo::resv::reserved lock.
 	 */
 
-	struct ttm_mem_reg mem;
+	struct ttm_resource mem;
 	struct file *persistent_swap_storage;
 	struct ttm_tt *ttm;
 	bool evicted;
@@ -316,12 +316,12 @@ int ttm_bo_wait(struct ttm_buffer_object *bo, bool interruptible, bool no_wait);
  * ttm_bo_mem_compat - Check if proposed placement is compatible with a bo
  *
  * @placement:  Return immediately if buffer is busy.
- * @mem:  The struct ttm_mem_reg indicating the region where the bo resides
+ * @mem:  The struct ttm_resource indicating the region where the bo resides
  * @new_flags: Describes compatible placement found
  *
  * Returns true if the placement is compatible
  */
-bool ttm_bo_mem_compat(struct ttm_placement *placement, struct ttm_mem_reg *mem,
+bool ttm_bo_mem_compat(struct ttm_placement *placement, struct ttm_resource *mem,
 		       uint32_t *new_flags);
 
 /**
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index d1eff7de4fa3..576c91c85a6b 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -55,7 +55,7 @@ struct ttm_resource_manager_func {
 	 * @bo: Pointer to the buffer object we're allocating space for.
 	 * @placement: Placement details.
 	 * @flags: Additional placement flags.
-	 * @mem: Pointer to a struct ttm_mem_reg to be filled in.
+	 * @mem: Pointer to a struct ttm_resource to be filled in.
 	 *
 	 * This function should allocate space in the memory type managed
 	 * by @man. Placement details if
@@ -79,20 +79,20 @@ struct ttm_resource_manager_func {
 	int  (*get_node)(struct ttm_resource_manager *man,
 			 struct ttm_buffer_object *bo,
 			 const struct ttm_place *place,
-			 struct ttm_mem_reg *mem);
+			 struct ttm_resource *mem);
 
 	/**
 	 * struct ttm_resource_manager member put_node
 	 *
 	 * @man: Pointer to a memory type manager.
-	 * @mem: Pointer to a struct ttm_mem_reg to be filled in.
+	 * @mem: Pointer to a struct ttm_resource to be filled in.
 	 *
 	 * This function frees memory type resources previously allocated
 	 * and that are identified by @mem::mm_node and @mem::start. May not
 	 * be called from within atomic context.
 	 */
 	void (*put_node)(struct ttm_resource_manager *man,
-			 struct ttm_mem_reg *mem);
+			 struct ttm_resource *mem);
 
 	/**
 	 * struct ttm_resource_manager member debug
@@ -251,7 +251,7 @@ struct ttm_bo_driver {
 	 */
 	int (*move)(struct ttm_buffer_object *bo, bool evict,
 		    struct ttm_operation_ctx *ctx,
-		    struct ttm_mem_reg *new_mem);
+		    struct ttm_resource *new_mem);
 
 	/**
 	 * struct ttm_bo_driver_member verify_access
@@ -277,7 +277,7 @@ struct ttm_bo_driver {
 	 */
 	void (*move_notify)(struct ttm_buffer_object *bo,
 			    bool evict,
-			    struct ttm_mem_reg *new_mem);
+			    struct ttm_resource *new_mem);
 	/* notify the driver we are taking a fault on this BO
 	 * and have reserved it */
 	int (*fault_reserve_notify)(struct ttm_buffer_object *bo);
@@ -294,9 +294,9 @@ struct ttm_bo_driver {
 	 * are balanced.
 	 */
 	int (*io_mem_reserve)(struct ttm_bo_device *bdev,
-			      struct ttm_mem_reg *mem);
+			      struct ttm_resource *mem);
 	void (*io_mem_free)(struct ttm_bo_device *bdev,
-			    struct ttm_mem_reg *mem);
+			    struct ttm_resource *mem);
 
 	/**
 	 * Return the pfn for a given page_offset inside the BO.
@@ -508,7 +508,7 @@ ttm_flag_masked(uint32_t *old, uint32_t new, uint32_t mask)
  * @bo: Pointer to a struct ttm_buffer_object. the data of which
  * we want to allocate space for.
  * @proposed_placement: Proposed new placement for the buffer object.
- * @mem: A struct ttm_mem_reg.
+ * @mem: A struct ttm_resource.
  * @interruptible: Sleep interruptible when sliping.
  * @no_wait_gpu: Return immediately if the GPU is busy.
  *
@@ -523,10 +523,10 @@ ttm_flag_masked(uint32_t *old, uint32_t new, uint32_t mask)
  */
 int ttm_bo_mem_space(struct ttm_buffer_object *bo,
 		     struct ttm_placement *placement,
-		     struct ttm_mem_reg *mem,
+		     struct ttm_resource *mem,
 		     struct ttm_operation_ctx *ctx);
 
-void ttm_bo_mem_put(struct ttm_buffer_object *bo, struct ttm_mem_reg *mem);
+void ttm_bo_mem_put(struct ttm_buffer_object *bo, struct ttm_resource *mem);
 
 int ttm_bo_device_release(struct ttm_bo_device *bdev);
 
@@ -722,16 +722,16 @@ int ttm_resource_manager_force_list_clean(struct ttm_bo_device *bdev,
  */
 
 int ttm_mem_io_reserve(struct ttm_bo_device *bdev,
-		       struct ttm_mem_reg *mem);
+		       struct ttm_resource *mem);
 void ttm_mem_io_free(struct ttm_bo_device *bdev,
-		     struct ttm_mem_reg *mem);
+		     struct ttm_resource *mem);
 /**
  * ttm_bo_move_ttm
  *
  * @bo: A pointer to a struct ttm_buffer_object.
  * @interruptible: Sleep interruptible if waiting.
  * @no_wait_gpu: Return immediately if the GPU is busy.
- * @new_mem: struct ttm_mem_reg indicating where to move.
+ * @new_mem: struct ttm_resource indicating where to move.
  *
  * Optimized move function for a buffer object with both old and
  * new placement backed by a TTM. The function will, if successful,
@@ -745,7 +745,7 @@ void ttm_mem_io_free(struct ttm_bo_device *bdev,
 
 int ttm_bo_move_ttm(struct ttm_buffer_object *bo,
 		    struct ttm_operation_ctx *ctx,
-		    struct ttm_mem_reg *new_mem);
+		    struct ttm_resource *new_mem);
 
 /**
  * ttm_bo_move_memcpy
@@ -753,7 +753,7 @@ int ttm_bo_move_ttm(struct ttm_buffer_object *bo,
  * @bo: A pointer to a struct ttm_buffer_object.
  * @interruptible: Sleep interruptible if waiting.
  * @no_wait_gpu: Return immediately if the GPU is busy.
- * @new_mem: struct ttm_mem_reg indicating where to move.
+ * @new_mem: struct ttm_resource indicating where to move.
  *
  * Fallback move function for a mappable buffer object in mappable memory.
  * The function will, if successful,
@@ -767,7 +767,7 @@ int ttm_bo_move_ttm(struct ttm_buffer_object *bo,
 
 int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
 		       struct ttm_operation_ctx *ctx,
-		       struct ttm_mem_reg *new_mem);
+		       struct ttm_resource *new_mem);
 
 /**
  * ttm_bo_free_old_node
@@ -784,7 +784,7 @@ void ttm_bo_free_old_node(struct ttm_buffer_object *bo);
  * @bo: A pointer to a struct ttm_buffer_object.
  * @fence: A fence object that signals when moving is complete.
  * @evict: This is an evict move. Don't return until the buffer is idle.
- * @new_mem: struct ttm_mem_reg indicating where to move.
+ * @new_mem: struct ttm_resource indicating where to move.
  *
  * Accelerated move function to be called when an accelerated move
  * has been scheduled. The function will create a new temporary buffer object
@@ -795,7 +795,7 @@ void ttm_bo_free_old_node(struct ttm_buffer_object *bo);
  */
 int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
 			      struct dma_fence *fence, bool evict,
-			      struct ttm_mem_reg *new_mem);
+			      struct ttm_resource *new_mem);
 
 /**
  * ttm_bo_pipeline_move.
@@ -803,14 +803,14 @@ int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
  * @bo: A pointer to a struct ttm_buffer_object.
  * @fence: A fence object that signals when moving is complete.
  * @evict: This is an evict move. Don't return until the buffer is idle.
- * @new_mem: struct ttm_mem_reg indicating where to move.
+ * @new_mem: struct ttm_resource indicating where to move.
  *
  * Function for pipelining accelerated moves. Either free the memory
  * immediately or hang it on a temporary buffer object.
  */
 int ttm_bo_pipeline_move(struct ttm_buffer_object *bo,
 			 struct dma_fence *fence, bool evict,
-			 struct ttm_mem_reg *new_mem);
+			 struct ttm_resource *new_mem);
 
 /**
  * ttm_bo_pipeline_gutting.
diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index 5e2393fe42c6..241cc40839ed 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -30,7 +30,7 @@
 #include <linux/types.h>
 
 struct ttm_tt;
-struct ttm_mem_reg;
+struct ttm_resource;
 struct ttm_buffer_object;
 struct ttm_operation_ctx;
 
@@ -53,14 +53,14 @@ struct ttm_backend_func {
 	 * struct ttm_backend_func member bind
 	 *
 	 * @ttm: Pointer to a struct ttm_tt.
-	 * @bo_mem: Pointer to a struct ttm_mem_reg describing the
+	 * @bo_mem: Pointer to a struct ttm_resource describing the
 	 * memory type and location for binding.
 	 *
 	 * Bind the backend pages into the aperture in the location
 	 * indicated by @bo_mem. This function should be able to handle
 	 * differences between aperture and system page sizes.
 	 */
-	int (*bind) (struct ttm_tt *ttm, struct ttm_mem_reg *bo_mem);
+	int (*bind) (struct ttm_tt *ttm, struct ttm_resource *bo_mem);
 
 	/**
 	 * struct ttm_backend_func member unbind
@@ -179,11 +179,11 @@ void ttm_dma_tt_fini(struct ttm_dma_tt *ttm_dma);
  * ttm_ttm_bind:
  *
  * @ttm: The struct ttm_tt containing backing pages.
- * @bo_mem: The struct ttm_mem_reg identifying the binding location.
+ * @bo_mem: The struct ttm_resource identifying the binding location.
  *
  * Bind the pages of @ttm to an aperture location identified by @bo_mem
  */
-int ttm_tt_bind(struct ttm_tt *ttm, struct ttm_mem_reg *bo_mem,
+int ttm_tt_bind(struct ttm_tt *ttm, struct ttm_resource *bo_mem,
 		struct ttm_operation_ctx *ctx);
 
 /**
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
