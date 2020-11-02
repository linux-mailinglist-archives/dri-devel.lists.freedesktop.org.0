Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B16622A3EB6
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:16:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C2C66EC1B;
	Tue,  3 Nov 2020 08:15:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E3A6EB87;
 Mon,  2 Nov 2020 19:37:19 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id c20so12021986pfr.8;
 Mon, 02 Nov 2020 11:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ZRihqyzxKN6U53cyWaF4ykM/A4JEQRA8PuaspMJ28/U=;
 b=VhV2/b0kSjyvBF4e0P4CQ5ONfSRjjh03eqMR7TWjGb2DMvlf2BS2zxkz2Q5FmsyY10
 uoFdIjVEjkWIUK304LYPJpu8qEepNb+QZOdQ4guwaUzEDm3BK2MImLmHEZM/z+PXeGf3
 UugCgwCO+fc7EMuJ8g/rB7AkPjCH6QjD/tmQDZ9U37Cz445UH2u1QqpbzC5fHxsLXT1a
 PJIt4Gu4RQY0KqD7Jf/bOTiFsR+endW0Bs8RjFtEGSE8ec1v9ZhWQxV8g9s190jQF73R
 a//sRCiH7j/76oi1f4R/XPDQxPjN7hh4iz+a49Dhc+qnZ5Ze/fH1qoPRdk8Rr9Lqx6MM
 Dr9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZRihqyzxKN6U53cyWaF4ykM/A4JEQRA8PuaspMJ28/U=;
 b=WWgNuFyWiQoA5K9lllHpRLrWTN5HJp59++LaiKg1I+syQPfZNewCVOWaJ19CTrk3nU
 FGIlypAi8CpJkocXA8BEpwvNPnxHWn0g2CRthdgHKoRwAU5fYlkUYEVZR6A0vaOZgH0A
 pOq0prpxzfgG441kooWAyXPOqUA5dPTLiRB/xioxtxPAORfIhZxeNRtiBQZPIvmDXIid
 F8rYLt1RgwjAYvHvAfBV7AnyLV7CcYXn8jCaTuSYCeFoLul85OfYySa4Xgz9guWTYj+7
 MoRprrlqgF1iNZwJU11ZzK7dpC22xiy/xMtSer6gD6Bz84hjGyrqCk+PeXRiiykwocFC
 6L+A==
X-Gm-Message-State: AOAM531/td//Ngh61qfEK0vJyj1MZyBftTKnQdhFlzfqTyfdmNxxAq4/
 K8VYonp0lZWY6wL9PiaA9wE=
X-Google-Smtp-Source: ABdhPJyLgjD7bJnvvyrbjxV+BHQ7+L86eu03s5YSvuL5SC0cqxuyHRSD0O7ld1sCZlob1kHkDpqXIQ==
X-Received: by 2002:a63:443:: with SMTP id 64mr2826982pge.127.1604345838819;
 Mon, 02 Nov 2020 11:37:18 -0800 (PST)
Received: from localhost ([160.202.157.3])
 by smtp.gmail.com with ESMTPSA id a23sm3166795pgv.35.2020.11.02.11.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 11:37:18 -0800 (PST)
Date: Tue, 3 Nov 2020 01:07:12 +0530
From: Deepak R Varma <mh12gx2825@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] drm/amdgpu/amdgpu: use "*" adjacent to data name
Message-ID: <a42902031c797779324031367818a06df6b660ab.1604345594.git.mh12gx2825@gmail.com>
References: <6ad41a97d7805124d2e31c70d96c846cf0d21524.1604345594.git.mh12gx2825@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6ad41a97d7805124d2e31c70d96c846cf0d21524.1604345594.git.mh12gx2825@gmail.com>
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:14:24 +0000
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
Cc: melissa.srw@gmail.com, gregkh@linuxfoundation.org, mh12gx2825@gmail.com,
 daniel.vetter@ffwll.ch
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When declaring pointer data, the "*" symbol should be used adjacent to
the data name as per the coding standards. This resolves following
issues reported by checkpatch script:
	ERROR: "foo *   bar" should be "foo *bar"
	ERROR: "foo * bar" should be "foo *bar"
	ERROR: "foo*            bar" should be "foo *bar"
	ERROR: "(foo*)" should be "(foo *)"

Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c     |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c           |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c          |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c          | 14 +++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c         |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_test.c         |  8 ++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c          |  6 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c        |  4 ++--
 9 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
index 469352e2d6ec..86add0f4ea4d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
@@ -1401,7 +1401,7 @@ static ATOM_VOLTAGE_OBJECT_V3 *amdgpu_atombios_lookup_voltage_object_v3(ATOM_VOL
 {
 	u32 size = le16_to_cpu(v3->sHeader.usStructureSize);
 	u32 offset = offsetof(ATOM_VOLTAGE_OBJECT_INFO_V3_1, asVoltageObj[0]);
-	u8 *start = (u8*)v3;
+	u8 *start = (u8 *)v3;
 
 	while (offset < size) {
 		ATOM_VOLTAGE_OBJECT_V3 *vo = (ATOM_VOLTAGE_OBJECT_V3 *)(start + offset);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
index b4df6460e45a..70da779a4ba7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
@@ -70,7 +70,7 @@ int amdgpu_atomfirmware_allocate_fb_scratch(struct amdgpu_device *adev)
 	struct atom_context *ctx = adev->mode_info.atom_context;
 	int index = get_index_into_master_table(atom_master_list_of_data_tables_v2_1,
 						vram_usagebyfirmware);
-	struct vram_usagebyfirmware_v2_1 *	firmware_usage;
+	struct vram_usagebyfirmware_v2_1 *firmware_usage;
 	uint32_t start_addr, size;
 	uint16_t data_offset;
 	int usage_bytes = 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 309464a8c06b..79342976fa76 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1461,7 +1461,7 @@ int amdgpu_cs_fence_to_handle_ioctl(struct drm_device *dev, void *data,
 		dma_fence_put(fence);
 		if (r)
 			return r;
-		r = drm_syncobj_get_fd(syncobj, (int*)&info->out.handle);
+		r = drm_syncobj_get_fd(syncobj, (int *)&info->out.handle);
 		drm_syncobj_put(syncobj);
 		return r;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
index c80d8339f58c..6efdd5f6427e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
@@ -450,7 +450,7 @@ int amdgpu_ctx_put(struct amdgpu_ctx *ctx)
 
 void amdgpu_ctx_add_fence(struct amdgpu_ctx *ctx,
 			  struct drm_sched_entity *entity,
-			  struct dma_fence *fence, uint64_t* handle)
+			  struct dma_fence *fence, uint64_t *handle)
 {
 	struct amdgpu_ctx_entity *centity = to_amdgpu_ctx_entity(entity);
 	uint64_t seq = centity->sequence;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index c3b1b27df153..73f563b65a15 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -806,7 +806,7 @@ int psp_xgmi_get_hive_id(struct psp_context *psp, uint64_t *hive_id)
 	struct ta_xgmi_shared_memory *xgmi_cmd;
 	int ret;
 
-	xgmi_cmd = (struct ta_xgmi_shared_memory*)psp->xgmi_context.xgmi_shared_buf;
+	xgmi_cmd = (struct ta_xgmi_shared_memory *)psp->xgmi_context.xgmi_shared_buf;
 	memset(xgmi_cmd, 0, sizeof(struct ta_xgmi_shared_memory));
 
 	xgmi_cmd->cmd_id = TA_COMMAND_XGMI__GET_HIVE_ID;
@@ -826,7 +826,7 @@ int psp_xgmi_get_node_id(struct psp_context *psp, uint64_t *node_id)
 	struct ta_xgmi_shared_memory *xgmi_cmd;
 	int ret;
 
-	xgmi_cmd = (struct ta_xgmi_shared_memory*)psp->xgmi_context.xgmi_shared_buf;
+	xgmi_cmd = (struct ta_xgmi_shared_memory *)psp->xgmi_context.xgmi_shared_buf;
 	memset(xgmi_cmd, 0, sizeof(struct ta_xgmi_shared_memory));
 
 	xgmi_cmd->cmd_id = TA_COMMAND_XGMI__GET_NODE_ID;
@@ -854,7 +854,7 @@ int psp_xgmi_get_topology_info(struct psp_context *psp,
 	if (!topology || topology->num_nodes > TA_XGMI__MAX_CONNECTED_NODES)
 		return -EINVAL;
 
-	xgmi_cmd = (struct ta_xgmi_shared_memory*)psp->xgmi_context.xgmi_shared_buf;
+	xgmi_cmd = (struct ta_xgmi_shared_memory *)psp->xgmi_context.xgmi_shared_buf;
 	memset(xgmi_cmd, 0, sizeof(struct ta_xgmi_shared_memory));
 
 	/* Fill in the shared memory with topology information as input */
@@ -898,7 +898,7 @@ int psp_xgmi_set_topology_info(struct psp_context *psp,
 	if (!topology || topology->num_nodes > TA_XGMI__MAX_CONNECTED_NODES)
 		return -EINVAL;
 
-	xgmi_cmd = (struct ta_xgmi_shared_memory*)psp->xgmi_context.xgmi_shared_buf;
+	xgmi_cmd = (struct ta_xgmi_shared_memory *)psp->xgmi_context.xgmi_shared_buf;
 	memset(xgmi_cmd, 0, sizeof(struct ta_xgmi_shared_memory));
 
 	topology_info_input = &xgmi_cmd->xgmi_in_message.get_topology_info;
@@ -962,7 +962,7 @@ static int psp_ras_load(struct psp_context *psp)
 	ret = psp_cmd_submit_buf(psp, NULL, cmd,
 			psp->fence_buf_mc_addr);
 
-	ras_cmd = (struct ta_ras_shared_memory*)psp->ras.ras_shared_buf;
+	ras_cmd = (struct ta_ras_shared_memory *)psp->ras.ras_shared_buf;
 
 	if (!ret) {
 		psp->ras.session_id = cmd->resp.session_id;
@@ -1884,7 +1884,7 @@ static int psp_execute_np_fw_load(struct psp_context *psp,
 static int psp_load_smu_fw(struct psp_context *psp)
 {
 	int ret;
-	struct amdgpu_device* adev = psp->adev;
+	struct amdgpu_device *adev = psp->adev;
 	struct amdgpu_firmware_info *ucode =
 			&adev->firmware.ucode[AMDGPU_UCODE_ID_SMC];
 	struct amdgpu_ras *ras = psp->ras.ras;
@@ -1950,7 +1950,7 @@ static int psp_np_fw_load(struct psp_context *psp)
 {
 	int i, ret;
 	struct amdgpu_firmware_info *ucode;
-	struct amdgpu_device* adev = psp->adev;
+	struct amdgpu_device *adev = psp->adev;
 
 	if (psp->autoload_supported &&
 	    !psp->pmfw_centralized_cstate_management) {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
index 15ee13c3bd9e..2697b250dc32 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
@@ -396,7 +396,7 @@ static ssize_t amdgpu_debugfs_ring_read(struct file *f, char __user *buf,
 			return result;
 
 		value = ring->ring[(*pos - 12)/4];
-		r = put_user(value, (uint32_t*)buf);
+		r = put_user(value, (uint32_t *)buf);
 		if (r)
 			return r;
 		buf += 4;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_test.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_test.c
index 2f4d5ca9894f..6042b3b81a4c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_test.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_test.c
@@ -157,10 +157,10 @@ static void amdgpu_do_test_moves(struct amdgpu_device *adev)
 					  i, *vram_start, gart_start,
 					  (unsigned long long)
 					  (gart_addr - adev->gmc.gart_start +
-					   (void*)gart_start - gtt_map),
+					   (void *)gart_start - gtt_map),
 					  (unsigned long long)
 					  (vram_addr - adev->gmc.vram_start +
-					   (void*)gart_start - gtt_map));
+					   (void *)gart_start - gtt_map));
 				amdgpu_bo_kunmap(vram_obj);
 				goto out_lclean_unpin;
 			}
@@ -203,10 +203,10 @@ static void amdgpu_do_test_moves(struct amdgpu_device *adev)
 					  i, *gart_start, vram_start,
 					  (unsigned long long)
 					  (vram_addr - adev->gmc.vram_start +
-					   (void*)vram_start - vram_map),
+					   (void *)vram_start - vram_map),
 					  (unsigned long long)
 					  (gart_addr - adev->gmc.gart_start +
-					   (void*)vram_start - vram_map));
+					   (void *)vram_start - vram_map));
 				amdgpu_bo_kunmap(gtt_obj[i]);
 				goto out_lclean_unpin;
 			}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index a5b466d3248c..4c705a89cf9b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1112,7 +1112,7 @@ static int amdgpu_ttm_backend_bind(struct ttm_bo_device *bdev,
 				   struct ttm_resource *bo_mem)
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bdev);
-	struct amdgpu_ttm_tt *gtt = (void*)ttm;
+	struct amdgpu_ttm_tt *gtt = (void *)ttm;
 	uint64_t flags;
 	int r = 0;
 
@@ -1171,7 +1171,7 @@ int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo)
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->bdev);
 	struct ttm_operation_ctx ctx = { false, false };
-	struct amdgpu_ttm_tt *gtt = (void*)bo->ttm;
+	struct amdgpu_ttm_tt *gtt = (void *)bo->ttm;
 	struct ttm_resource tmp;
 	struct ttm_placement placement;
 	struct ttm_place placements;
@@ -1433,7 +1433,7 @@ int amdgpu_ttm_tt_set_userptr(struct ttm_buffer_object *bo,
 			return -ENOMEM;
 	}
 
-	gtt = (void*)bo->ttm;
+	gtt = (void *)bo->ttm;
 	gtt->userptr = addr;
 	gtt->userflags = flags;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
index b313ce4c3e97..54182c4b3e33 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
@@ -586,8 +586,8 @@ static int amdgpu_ucode_patch_jt(struct amdgpu_firmware_info *ucode,
 {
 	const struct gfx_firmware_header_v1_0 *header = NULL;
 	const struct common_firmware_header *comm_hdr = NULL;
-	uint8_t* src_addr = NULL;
-	uint8_t* dst_addr = NULL;
+	uint8_t *src_addr = NULL;
+	uint8_t *dst_addr = NULL;
 
 	if (NULL == ucode->fw)
 		return 0;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
