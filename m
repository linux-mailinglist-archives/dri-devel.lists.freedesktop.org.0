Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C9DB2E00C
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 16:56:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2943510E774;
	Wed, 20 Aug 2025 14:56:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ghvo5thU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C26AD10E770;
 Wed, 20 Aug 2025 14:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755701784; x=1787237784;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ug87RkAt9QcOpyPK0L1jq8xaAAoIVSFC6IRlZO3ZZ68=;
 b=Ghvo5thUzFL907ebHiqIcreIhzR1OOxffBQ3iNZLNweAFp4cmjY9/WW3
 zbO3PSDDq7l70vkfd8UrRK8X4S4ADDcU6QImjL67TEDB5LaKehIr1hz+Z
 GU7cfJziyhd9o2qBxJVEGuxJKkR4r7UrMp1ONFP3XwZs94Nmaz+/DNOSi
 rOsQlG0Z7tJv+UNuKpNuzTVS8g9Fm6nyUBrNwm612Kqps5zDU/A7fawYb
 /P7yOKh8emg+ZNp8Ltk8eQ/yWfcPlO1M8VMzV8DCCbbDw62O7EH/dVN13
 A9CoEv7SicZ7X7ILj2Ed0nsyqcsqeSdUYRgo7Ik80U37tzdyGxregYaLS w==;
X-CSE-ConnectionGUID: aUb6SV2hSgqaifDnI4J6MA==
X-CSE-MsgGUID: aVmPjLO4Sjy/8PMmzPGHzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57923133"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="57923133"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 07:56:23 -0700
X-CSE-ConnectionGUID: fHJu74PbTI+wJNWn/Ye7Ig==
X-CSE-MsgGUID: SM58/Pu8S/eQ+uY70G368g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="167653777"
Received: from himal-super-server.iind.intel.com ([10.190.239.34])
 by fmviesa007.fm.intel.com with ESMTP; 20 Aug 2025 07:56:20 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Matt Coster <matt.coster@imgtec.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/gpuvm: Rename 'map' to 'op' in drm_gpuvm_map_req
Date: Wed, 20 Aug 2025 20:53:35 +0530
Message-Id: <20250820152335.2899501-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Renamed 'map' to 'op' in drm_gpuvm_map_req for clarity and added
corresponding documentation. No functional changes introduced.

Fixes: baf1638c0956 ("drm/gpuvm: Introduce drm_gpuvm_madvise_ops_create")
Fixes: 000a45dce7ad ("drm/gpuvm: Pass map arguments through a struct")
Suggested-by: Boris Brezillon <bbrezillon@kernel.org>
Suggested-by: Danilo Krummrich <dakr@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matt Coster <matt.coster@imgtec.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/drm_gpuvm.c            | 36 +++++++++++++-------------
 drivers/gpu/drm/imagination/pvr_vm.c   |  8 +++---
 drivers/gpu/drm/msm/msm_gem_vma.c      | 16 ++++++------
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |  8 +++---
 drivers/gpu/drm/panthor/panthor_mmu.c  |  8 +++---
 drivers/gpu/drm/xe/xe_vm.c             |  8 +++---
 include/drm/drm_gpuvm.h                |  4 +--
 7 files changed, 44 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 39f934a91a7b..e9aaf9b287e7 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -552,11 +552,11 @@
  *				  struct drm_gem_object *obj, u64 offset)
  *	{
  *		struct drm_gpuvm_map_req map_req = {
- *		        .map.va.addr = addr,
- *	                .map.va.range = range,
- *	                .map.gem.obj = obj,
- *	                .map.gem.offset = offset,
- *	           };
+ *		        .op.va.addr = addr,
+ *	                .op.va.range = range,
+ *	                .op.gem.obj = obj,
+ *	                .op.gem.offset = offset,
+ *	        };
  *		struct drm_gpuva_ops *ops;
  *		struct drm_gpuva_op *op
  *		struct drm_gpuvm_bo *vm_bo;
@@ -2132,10 +2132,10 @@ op_map_cb(const struct drm_gpuvm_ops *fn, void *priv,
 		return 0;
 
 	op.op = DRM_GPUVA_OP_MAP;
-	op.map.va.addr = req->map.va.addr;
-	op.map.va.range = req->map.va.range;
-	op.map.gem.obj = req->map.gem.obj;
-	op.map.gem.offset = req->map.gem.offset;
+	op.map.va.addr = req->op.va.addr;
+	op.map.va.range = req->op.va.range;
+	op.map.gem.obj = req->op.gem.obj;
+	op.map.gem.offset = req->op.gem.offset;
 
 	return fn->sm_step_map(&op, priv);
 }
@@ -2180,12 +2180,12 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 		   const struct drm_gpuvm_map_req *req,
 		   bool madvise)
 {
-	struct drm_gem_object *req_obj = req->map.gem.obj;
+	struct drm_gem_object *req_obj = req->op.gem.obj;
 	const struct drm_gpuvm_map_req *op_map = madvise ? NULL : req;
 	struct drm_gpuva *va, *next;
-	u64 req_offset = req->map.gem.offset;
-	u64 req_range = req->map.va.range;
-	u64 req_addr = req->map.va.addr;
+	u64 req_offset = req->op.gem.offset;
+	u64 req_range = req->op.va.range;
+	u64 req_addr = req->op.va.addr;
 	u64 req_end = req_addr + req_range;
 	int ret;
 
@@ -2272,8 +2272,8 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 
 				if (madvise) {
 					struct drm_gpuvm_map_req map_req = {
-						.map.va.addr =  req_addr,
-						.map.va.range = end - req_addr,
+						.op.va.addr =  req_addr,
+						.op.va.range = end - req_addr,
 					};
 
 					ret = op_map_cb(ops, priv, &map_req);
@@ -2340,8 +2340,8 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 
 				if (madvise) {
 					struct drm_gpuvm_map_req map_req = {
-						.map.va.addr =  addr,
-						.map.va.range = req_end - addr,
+						.op.va.addr =  addr,
+						.op.va.range = req_end - addr,
 					};
 
 					return op_map_cb(ops, priv, &map_req);
@@ -2583,7 +2583,7 @@ drm_gpuvm_sm_map_exec_lock(struct drm_gpuvm *gpuvm,
 			   struct drm_exec *exec, unsigned int num_fences,
 			   struct drm_gpuvm_map_req *req)
 {
-	struct drm_gem_object *req_obj = req->map.gem.obj;
+	struct drm_gem_object *req_obj = req->op.gem.obj;
 
 	if (req_obj) {
 		int ret = drm_exec_prepare_obj(exec, req_obj, num_fences);
diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
index 3d97990170bf..983165eb3e6a 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.c
+++ b/drivers/gpu/drm/imagination/pvr_vm.c
@@ -187,10 +187,10 @@ static int pvr_vm_bind_op_exec(struct pvr_vm_bind_op *bind_op)
 	switch (bind_op->type) {
 	case PVR_VM_BIND_TYPE_MAP: {
 		const struct drm_gpuvm_map_req map_req = {
-			.map.va.addr = bind_op->device_addr,
-			.map.va.range = bind_op->size,
-			.map.gem.obj = gem_from_pvr_gem(bind_op->pvr_obj),
-			.map.gem.offset = bind_op->offset,
+			.op.va.addr = bind_op->device_addr,
+			.op.va.range = bind_op->size,
+			.op.gem.obj = gem_from_pvr_gem(bind_op->pvr_obj),
+			.op.gem.offset = bind_op->offset,
 		};
 
 		return drm_gpuvm_sm_map(&bind_op->vm_ctx->gpuvm_mgr,
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 210604181c05..9b5d003bc5a2 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -1179,10 +1179,10 @@ vm_bind_job_lock_objects(struct msm_vm_bind_job *job, struct drm_exec *exec)
 			case MSM_VM_BIND_OP_MAP:
 			case MSM_VM_BIND_OP_MAP_NULL: {
 				struct drm_gpuvm_map_req map_req = {
-					.map.va.addr = op->iova,
-					.map.va.range = op->range,
-					.map.gem.obj = op->obj,
-					.map.gem.offset = op->obj_offset,
+					.op.va.addr = op->iova,
+					.op.va.range = op->range,
+					.op.gem.obj = op->obj,
+					.op.gem.offset = op->obj_offset,
 				};
 
 				ret = drm_gpuvm_sm_map_exec_lock(job->vm, exec, 1, &map_req);
@@ -1296,10 +1296,10 @@ vm_bind_job_prepare(struct msm_vm_bind_job *job)
 			fallthrough;
 		case MSM_VM_BIND_OP_MAP_NULL: {
 			struct drm_gpuvm_map_req map_req = {
-				.map.va.addr = op->iova,
-				.map.va.range = op->range,
-				.map.gem.obj = op->obj,
-				.map.gem.offset = op->obj_offset,
+				.op.va.addr = op->iova,
+				.op.va.range = op->range,
+				.op.gem.obj = op->obj,
+				.op.gem.offset = op->obj_offset,
 			};
 
 			ret = drm_gpuvm_sm_map(job->vm, &arg, &map_req);
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index d94a85509176..314121a857e7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1277,10 +1277,10 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job,
 		case OP_MAP: {
 			struct nouveau_uvma_region *reg;
 			struct drm_gpuvm_map_req map_req = {
-				.map.va.addr = op->va.addr,
-				.map.va.range = op->va.range,
-				.map.gem.obj = op->gem.obj,
-				.map.gem.offset = op->gem.offset,
+				.op.va.addr = op->va.addr,
+				.op.va.range = op->va.range,
+				.op.gem.obj = op->gem.obj,
+				.op.gem.offset = op->gem.offset,
 			};
 
 			reg = nouveau_uvma_region_find_first(uvmm,
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 2003b91a8409..3799e2c6ea59 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -2204,10 +2204,10 @@ panthor_vm_exec_op(struct panthor_vm *vm, struct panthor_vm_op_ctx *op,
 	switch (op_type) {
 	case DRM_PANTHOR_VM_BIND_OP_TYPE_MAP: {
 		const struct drm_gpuvm_map_req map_req = {
-			.map.va.addr = op->va.addr,
-			.map.va.range = op->va.range,
-			.map.gem.obj = op->map.vm_bo->obj,
-			.map.gem.offset = op->map.bo_offset,
+			.op.va.addr = op->va.addr,
+			.op.va.range = op->va.range,
+			.op.gem.obj = op->map.vm_bo->obj,
+			.op.gem.offset = op->map.bo_offset,
 		};
 
 		if (vm->unusable) {
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index f35d69c0b4c6..66b54b152446 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2339,10 +2339,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 	case DRM_XE_VM_BIND_OP_MAP:
 	case DRM_XE_VM_BIND_OP_MAP_USERPTR: {
 		struct drm_gpuvm_map_req map_req = {
-			.map.va.addr = addr,
-			.map.va.range = range,
-			.map.gem.obj = obj,
-			.map.gem.offset = bo_offset_or_userptr,
+			.op.va.addr = addr,
+			.op.va.range = range,
+			.op.gem.obj = obj,
+			.op.gem.offset = bo_offset_or_userptr,
 		};
 
 		ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, &map_req);
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 4a22b9d848f7..751c96a817ed 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -1054,9 +1054,9 @@ struct drm_gpuva_ops {
  */
 struct drm_gpuvm_map_req {
 	/**
-	 * @op_map: struct drm_gpuva_op_map
+	 * @op: struct drm_gpuva_op_map
 	 */
-	struct drm_gpuva_op_map map;
+	struct drm_gpuva_op_map op;
 };
 
 struct drm_gpuva_ops *
-- 
2.34.1

