Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABFE6F6A77
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 13:52:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DC8410E2E0;
	Thu,  4 May 2023 11:52:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3198410E154;
 Thu,  4 May 2023 11:52:11 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-50bc0ced1d9so571023a12.0; 
 Thu, 04 May 2023 04:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683201129; x=1685793129;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=o1N8U/01wRT8HTMCbcIfBbQAAUu9NYYmhpQRQDgVHEM=;
 b=XxJgVL7bf0XXuVvrkVczDIuWBKnrwNFdJisTSHwAUmdmtkYqa8+bwxjBQ3jv3IsmCy
 S8aKGnRlMzFfitJzhCqjfqhN60DgKh43oNa5KL89BUJG/AoaOE4XwQITCQ+KnbAAKorS
 4RH4GutbMZxmjgyVMk4o6yEWby7ODGHDshyurCYlyjZ5NKK5CHLD/vFPVcyPUZsmaS+W
 MKSnvWja9ST56k9wu9fwP4KOsqI3s3nKmhpQKDeeeNdgn2WtNG3OZbId3gE4jLHuYiqX
 SiWIigwvohE/ihilyXerGhEmyoNxyfSoDKEdpDZwhiU4mTsDZagwm8VDYNtjj4vyMf5Y
 hTBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683201129; x=1685793129;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o1N8U/01wRT8HTMCbcIfBbQAAUu9NYYmhpQRQDgVHEM=;
 b=KwX4iLARU5OJ3Hlb24FVnSA9vZBtTqRq3C0vpAx0kwRGjkbvGlzfyxPUnOz7S8ekwz
 UjKRE+Gw++yw6I+kVnRt4ArG2eVk7DT7pEGrr5xN/3Zeok4Fq1RjeEpGN44jbi1PaYMz
 C9IiKFjzIjeZDVVvAsMlTx7D+bH4Et5s1ZkPabuLhkfVQkeYW9K9ITMAsR3zkJC2Bp4s
 8jukb10cxU1+6vIRISYOSzztcuQs9g9dAeEbIYhdwdgWV4l5+SHNLW+HGQQ0Vou70/oP
 vEJX+vXoyUJIy/qgYiYxKzTmgdUViOoWiYifN/nZ5v1p5tW2dYQnoU5kErjKNdHTT62+
 wPig==
X-Gm-Message-State: AC+VfDwdPdYZksrI7fzmSkc57zYtSISL1Sr2HoLUvKbPs1r34S2ff+qu
 v6wLc9tfBS5gav3Jt0UDtv4=
X-Google-Smtp-Source: ACHHUZ6cszBdpJ6HDRGrOYMg9P7j4xv4uDqRHc916zGgjNDpUR6mWGZi8WfzYmbl0f4Bx34+SsCBWA==
X-Received: by 2002:a17:907:9720:b0:94a:76f6:8e52 with SMTP id
 jg32-20020a170907972000b0094a76f68e52mr6437901ejc.35.1683201129228; 
 Thu, 04 May 2023 04:52:09 -0700 (PDT)
Received: from able.fritz.box (p4fc2092b.dip0.t-ipconnect.de. [79.194.9.43])
 by smtp.gmail.com with ESMTPSA id
 hx27-20020a170906847b00b009659ecdf29fsm1061741ejc.1.2023.05.04.04.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 04:52:08 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: francois.dugast@intel.com, felix.kuehling@amd.com,
 arunpravin.paneerselvam@amd.com, thomas_os@shipmail.org, dakr@redhat.com,
 luben.tuikov@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 05/13] drm/amdgpu: use drm_exec for MES testing
Date: Thu,  4 May 2023 13:51:51 +0200
Message-Id: <20230504115159.2245-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230504115159.2245-1-christian.koenig@amd.com>
References: <20230504115159.2245-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Start using the new component here as well.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c | 86 +++++++++++--------------
 1 file changed, 39 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
index f0f00466b59f..bfa9006600dd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
@@ -22,6 +22,7 @@
  */
 
 #include <linux/firmware.h>
+#include <drm/drm_exec.h>
 
 #include "amdgpu_mes.h"
 #include "amdgpu.h"
@@ -1131,34 +1132,29 @@ int amdgpu_mes_ctx_map_meta_data(struct amdgpu_device *adev,
 				 struct amdgpu_mes_ctx_data *ctx_data)
 {
 	struct amdgpu_bo_va *bo_va;
-	struct ww_acquire_ctx ticket;
-	struct list_head list;
-	struct amdgpu_bo_list_entry pd;
-	struct ttm_validate_buffer csa_tv;
 	struct amdgpu_sync sync;
+	struct drm_exec exec;
 	int r;
 
 	amdgpu_sync_create(&sync);
-	INIT_LIST_HEAD(&list);
-	INIT_LIST_HEAD(&csa_tv.head);
 
-	csa_tv.bo = &ctx_data->meta_data_obj->tbo;
-	csa_tv.num_shared = 1;
-
-	list_add(&csa_tv.head, &list);
-	amdgpu_vm_get_pd_bo(vm, &list, &pd);
-
-	r = ttm_eu_reserve_buffers(&ticket, &list, true, NULL);
-	if (r) {
-		DRM_ERROR("failed to reserve meta data BO: err=%d\n", r);
-		return r;
+	drm_exec_init(&exec, false);
+	drm_exec_while_not_all_locked(&exec) {
+		r = drm_exec_prepare_obj(&exec,
+					 &ctx_data->meta_data_obj->tbo.base,
+					 0);
+		if (likely(!r))
+			r = amdgpu_vm_lock_pd(vm, &exec);
+		drm_exec_continue_on_contention(&exec);
+                if (unlikely(r))
+			goto error_fini_exec;
 	}
 
 	bo_va = amdgpu_vm_bo_add(adev, vm, ctx_data->meta_data_obj);
 	if (!bo_va) {
-		ttm_eu_backoff_reservation(&ticket, &list);
 		DRM_ERROR("failed to create bo_va for meta data BO\n");
-		return -ENOMEM;
+		r = -ENOMEM;
+		goto error_fini_exec;
 	}
 
 	r = amdgpu_vm_bo_map(adev, bo_va, ctx_data->meta_data_gpu_addr, 0,
@@ -1168,33 +1164,35 @@ int amdgpu_mes_ctx_map_meta_data(struct amdgpu_device *adev,
 
 	if (r) {
 		DRM_ERROR("failed to do bo_map on meta data, err=%d\n", r);
-		goto error;
+		goto error_del_bo_va;
 	}
 
 	r = amdgpu_vm_bo_update(adev, bo_va, false);
 	if (r) {
 		DRM_ERROR("failed to do vm_bo_update on meta data\n");
-		goto error;
+		goto error_del_bo_va;
 	}
 	amdgpu_sync_fence(&sync, bo_va->last_pt_update);
 
 	r = amdgpu_vm_update_pdes(adev, vm, false);
 	if (r) {
 		DRM_ERROR("failed to update pdes on meta data\n");
-		goto error;
+		goto error_del_bo_va;
 	}
 	amdgpu_sync_fence(&sync, vm->last_update);
 
 	amdgpu_sync_wait(&sync, false);
-	ttm_eu_backoff_reservation(&ticket, &list);
+	drm_exec_fini(&exec);
 
 	amdgpu_sync_free(&sync);
 	ctx_data->meta_data_va = bo_va;
 	return 0;
 
-error:
+error_del_bo_va:
 	amdgpu_vm_bo_del(adev, bo_va);
-	ttm_eu_backoff_reservation(&ticket, &list);
+
+error_fini_exec:
+	drm_exec_fini(&exec);
 	amdgpu_sync_free(&sync);
 	return r;
 }
@@ -1205,34 +1203,28 @@ int amdgpu_mes_ctx_unmap_meta_data(struct amdgpu_device *adev,
 	struct amdgpu_bo_va *bo_va = ctx_data->meta_data_va;
 	struct amdgpu_bo *bo = ctx_data->meta_data_obj;
 	struct amdgpu_vm *vm = bo_va->base.vm;
-	struct amdgpu_bo_list_entry vm_pd;
-	struct list_head list, duplicates;
-	struct dma_fence *fence = NULL;
-	struct ttm_validate_buffer tv;
-	struct ww_acquire_ctx ticket;
-	long r = 0;
-
-	INIT_LIST_HEAD(&list);
-	INIT_LIST_HEAD(&duplicates);
-
-	tv.bo = &bo->tbo;
-	tv.num_shared = 2;
-	list_add(&tv.head, &list);
-
-	amdgpu_vm_get_pd_bo(vm, &list, &vm_pd);
-
-	r = ttm_eu_reserve_buffers(&ticket, &list, false, &duplicates);
-	if (r) {
-		dev_err(adev->dev, "leaking bo va because "
-			"we fail to reserve bo (%ld)\n", r);
-		return r;
+	struct dma_fence *fence;
+	struct drm_exec exec;
+	long r;
+
+	drm_exec_init(&exec, false);
+	drm_exec_while_not_all_locked(&exec) {
+		r = drm_exec_prepare_obj(&exec,
+					 &ctx_data->meta_data_obj->tbo.base,
+					 0);
+		if (likely(!r))
+			r = amdgpu_vm_lock_pd(vm, &exec);
+		drm_exec_continue_on_contention(&exec);
+                if (unlikely(r))
+			goto out_unlock;
 	}
 
 	amdgpu_vm_bo_del(adev, bo_va);
 	if (!amdgpu_vm_ready(vm))
 		goto out_unlock;
 
-	r = dma_resv_get_singleton(bo->tbo.base.resv, DMA_RESV_USAGE_BOOKKEEP, &fence);
+	r = dma_resv_get_singleton(bo->tbo.base.resv, DMA_RESV_USAGE_BOOKKEEP,
+				   &fence);
 	if (r)
 		goto out_unlock;
 	if (fence) {
@@ -1251,7 +1243,7 @@ int amdgpu_mes_ctx_unmap_meta_data(struct amdgpu_device *adev,
 out_unlock:
 	if (unlikely(r < 0))
 		dev_err(adev->dev, "failed to clear page tables (%ld)\n", r);
-	ttm_eu_backoff_reservation(&ticket, &list);
+	drm_exec_fini(&exec);
 
 	return r;
 }
-- 
2.34.1

