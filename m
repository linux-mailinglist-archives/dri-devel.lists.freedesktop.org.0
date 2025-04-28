Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B03A9FB19
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 22:57:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FEF110EA54;
	Mon, 28 Apr 2025 20:57:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Dpxq8007";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D618F10EA4E;
 Mon, 28 Apr 2025 20:57:41 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-b170c99aa49so2976798a12.1; 
 Mon, 28 Apr 2025 13:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745873861; x=1746478661; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zY1avGRqORwj7W2bUyBF8WM5IlOJxuqb8uwI4O2Hev0=;
 b=Dpxq8007YOmDhArL8AnHFlsFEnfkTaVPy8s/4OsuQl+x6FtNRH8TPkSLCb3c4GDvKu
 iDmmOJG3oLch9BzM1MEWmYPorrBxblRDWT7oFCajYJl1kPPSRCGAVZW222E4AYvQTeYg
 4GvBPo9H2r+Ij4nTkcRAQaB2s5wIN7g4Dz1WDWJ2fSeucMVh/gRpSrCgU8YRAI/B7KC8
 e2NQZdkSUuXXDw3NIO9t/cvZYKGnOfzJqpSc/mtWDvs2xQ2UXCeR82OrBsGe/4gtK7f2
 TueyidRg/faC7dlKhUu7RmIdncnr1ZqzWf/Clbjcv0oFhWxZmALWeuD2dH9ePR7jqxmu
 RZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745873861; x=1746478661;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zY1avGRqORwj7W2bUyBF8WM5IlOJxuqb8uwI4O2Hev0=;
 b=SsO7ApsZXhqKiMW+TpluQW+PzGzUr2Ypmx7Z9T5+5136Txv30xAXjZkXveqgKuHfi0
 vXQ7he9xQ/HB7Ld7m2vKNU9ZKntn9rhxUM9y1gB+RA2o8k9iK/OzfZktH+aeRAA8wzqt
 zdEmZ0KFVe4/1jSjjIw3ZvvawxaLzUkaaOG6svY3hfA8GfCfhesKIy4qhLnySTFHdJ4V
 uLrGim/q6Kc1z2TR7xCJWNl1UkPjcMfRhGH9l8IuBOkVfPAiAgTwvPbTLEsWq/KcnxHp
 LVBcDMD3wOlgiMNBPZ855wMNAecW6+tmW3/GDEYIWeiuoCFZGh25EibzSoeqYXNUsKrt
 xkcg==
X-Gm-Message-State: AOJu0YzaHxxpp4DkgecrXj/CxlSW7/HVloVwcnHIgBe8GsbSlwOyAqp2
 yY7NHItPxkp2hpzmsnaIqO3W7FD4FNh/59DdqfujFFRD54K2YAKRgTPb1A==
X-Gm-Gg: ASbGncvhKj/r9RdHHxYqqFhBZ89KYtJhqYW1ujZp4RItYGAbEJzP1m0qrjO8wNdUYRe
 yZbHe20LtxWyPmMG4411U/ku/XHW++rQouWs1ofi0EliQ5+8GO9kutkDbsAOg8HqtTRdp4nmb7W
 qH7WMHIjJ3A3X6vLPj7QiC0N7g5BDUKfa7PMY5clam54+Ofeko67J2Q8xCOH48h1Ve56K76F5wI
 kMvMGSGJeuL6PYeyWAfF3+BLp04WdesX4APX7lRD5QlZ5qyD1c/rwFaBOufsmaz0wzIjJvGKLNf
 9reqBjEkBGuswHVsTns42CIFg08hXVFz0MlEZw8/ao/Y4p3372tyGdfLsrkwJm1LnP+mZZXDaFp
 /2uVgnH8O03AW0sg=
X-Google-Smtp-Source: AGHT+IHGblZmjYEovhWRsH3Z4hP/77P++HOl6hbzbI8bABh5qSjrrzi0UekkDjCe28bJpEdMz/aiqw==
X-Received: by 2002:a17:90b:5210:b0:2ff:6bd0:ff26 with SMTP id
 98e67ed59e1d1-30a23e375a5mr275743a91.34.1745873860976; 
 Mon, 28 Apr 2025 13:57:40 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-309f7760d7fsm7697761a91.21.2025.04.28.13.57.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 13:57:40 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 24/33] drm/msm: Crashdec support for sparse
Date: Mon, 28 Apr 2025 13:54:31 -0700
Message-ID: <20250428205619.227835-25-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428205619.227835-1-robdclark@gmail.com>
References: <20250428205619.227835-1-robdclark@gmail.com>
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

From: Rob Clark <robdclark@chromium.org>

In this case, we need to iterate the VMAs looking for ones with
MSM_VMA_DUMP flag.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu.c | 96 ++++++++++++++++++++++++++---------
 1 file changed, 72 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 2eaca2a22de9..b70355fc8570 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -241,9 +241,7 @@ static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
 		if (!state_bo->data)
 			goto out;
 
-		msm_gem_lock(obj);
 		ptr = msm_gem_get_vaddr_active(obj);
-		msm_gem_unlock(obj);
 		if (IS_ERR(ptr)) {
 			kvfree(state_bo->data);
 			state_bo->data = NULL;
@@ -251,12 +249,75 @@ static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
 		}
 
 		memcpy(state_bo->data, ptr + offset, size);
-		msm_gem_put_vaddr(obj);
+		msm_gem_put_vaddr_locked(obj);
 	}
 out:
 	state->nr_bos++;
 }
 
+static void crashstate_get_bos(struct msm_gpu_state *state, struct msm_gem_submit *submit)
+{
+	extern bool rd_full;
+
+	if (!submit)
+		return;
+
+	if (msm_context_is_vmbind(submit->queue->ctx)) {
+		struct drm_exec exec;
+		struct drm_gpuva *vma;
+		unsigned cnt = 0;
+
+		drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES, 0);
+		drm_exec_until_all_locked(&exec) {
+			cnt = 0;
+
+			drm_exec_lock_obj(&exec, drm_gpuvm_resv_obj(submit->vm));
+			drm_exec_retry_on_contention(&exec);
+
+			drm_gpuvm_for_each_va (vma, submit->vm) {
+				if (!vma->gem.obj)
+					continue;
+
+				cnt++;
+				drm_exec_lock_obj(&exec, vma->gem.obj);
+				drm_exec_retry_on_contention(&exec);
+			}
+
+		}
+
+		drm_gpuvm_for_each_va (vma, submit->vm)
+			cnt++;
+
+		state->bos = kcalloc(cnt, sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
+
+		drm_gpuvm_for_each_va (vma, submit->vm) {
+			bool dump = rd_full || (vma->flags & MSM_VMA_DUMP);
+
+			/* Skip MAP_NULL/PRR VMAs: */
+			if (!vma->gem.obj)
+				continue;
+
+			msm_gpu_crashstate_get_bo(state, vma->gem.obj, vma->va.addr,
+						  dump, vma->gem.offset, vma->va.range);
+		}
+
+		drm_exec_fini(&exec);
+	} else {
+		state->bos = kcalloc(submit->nr_bos,
+			sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
+
+		for (int i = 0; state->bos && i < submit->nr_bos; i++) {
+			struct drm_gem_object *obj = submit->bos[i].obj;
+			bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
+
+			msm_gem_lock(obj);
+			msm_gpu_crashstate_get_bo(state, obj, submit->bos[i].iova,
+						  dump, 0, obj->size);
+			msm_gem_unlock(obj);
+		}
+	}
+}
+
 static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 		struct msm_gem_submit *submit, char *comm, char *cmd)
 {
@@ -279,30 +340,17 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 	state->cmd = kstrdup(cmd, GFP_KERNEL);
 	state->fault_info = gpu->fault_info;
 
-	if (submit) {
-		extern bool rd_full;
-		int i;
-
-		if (state->fault_info.ttbr0) {
-			struct msm_gpu_fault_info *info = &state->fault_info;
-			struct msm_mmu *mmu = to_msm_vm(submit->vm)->mmu;
+	if (submit && state->fault_info.ttbr0) {
+		struct msm_gpu_fault_info *info = &state->fault_info;
+		struct msm_mmu *mmu = to_msm_vm(submit->vm)->mmu;
 
-			msm_iommu_pagetable_params(mmu, &info->pgtbl_ttbr0,
-						   &info->asid);
-			msm_iommu_pagetable_walk(mmu, info->iova, info->ptes);
-		}
-
-		state->bos = kcalloc(submit->nr_bos,
-			sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
-
-		for (i = 0; state->bos && i < submit->nr_bos; i++) {
-			struct drm_gem_object *obj = submit->bos[i].obj;
-			bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
-			msm_gpu_crashstate_get_bo(state, obj, submit->bos[i].iova,
-						  dump, 0, obj->size);
-		}
+		msm_iommu_pagetable_params(mmu, &info->pgtbl_ttbr0,
+					   &info->asid);
+		msm_iommu_pagetable_walk(mmu, info->iova, info->ptes);
 	}
 
+	crashstate_get_bos(state, submit);
+
 	/* Set the active crash state to be dumped on failure */
 	gpu->crashstate = state;
 
-- 
2.49.0

