Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC2AA69197
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 15:56:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDF9510E53C;
	Wed, 19 Mar 2025 14:56:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RhMEkxiD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7293910E535;
 Wed, 19 Mar 2025 14:56:07 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-22359001f1aso26135715ad.3; 
 Wed, 19 Mar 2025 07:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742396166; x=1743000966; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2iJJUPboSKZ/bv7FjvwLTYQiRkvsdluYBcqCTVGU80Q=;
 b=RhMEkxiDmAtZK+AY8WG5iEu4grzoBrQ2VJeOPeRnUScghKp0ZAOfWcSGNAqDM7GwJ5
 jBcuXlhC1A3i2g61BLXBUX4fOlDA2VVcb3wWkl4+2CYmO9iKx4oLM478DiQ5w9WSIWv/
 4nBR/wXh6uRru0/vMic4/jmi1nMkDyl5QK78DyNIcN+wdjLdsrlM5UCzQXo1zINdxIGb
 3mAoXj/irL3mgDSUtRUXIETQEm6iTkWxwtRy5XZzOYliVFOqg3VvWR8K2AZNE+8Vl+JM
 HbNwo/+mEi5vnIRQL5kEDSvmKUzk7zRC0fnJaT4379u/lD0Xkbn3AYxU25z2X032M0ar
 qN+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742396166; x=1743000966;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2iJJUPboSKZ/bv7FjvwLTYQiRkvsdluYBcqCTVGU80Q=;
 b=eqycUCAGJwRhAsfWHio+Bvp7EX5/YDrSo6v7KFp3H1PcIVMZKDo24WUB4LsfrRLzap
 a3aBruGAxyjsTzAG4TMGZmFdFgtXd51tpYwwJiETJp8Kg7L1ZIWGEjPVLJNan3+yyc8a
 7LlvzELIW1BJN3jLNt4Q3/g53jcSHUoqwghYQDmm6TL6pE3K0ZeL8VGF42ZFH9NN68D2
 pRXM9O6WSd4EqUkLWuAMhEu2NcUjdGszFoebZ8VAs2t4Em/1cEjGPSj9ld2O3p2sadTZ
 vWRW3uc08AHUxKdtldkAOo/1+omdm0GgRNkkJfBk/ka5+YUz0Ervu3OmUYqij/MFVjIp
 twag==
X-Gm-Message-State: AOJu0YycZIykc6eOIDbBsR3KDFivfSGc7495TuMT3EJDgviXF1r18a2s
 8hdIBx+cBHxvk6G3GpiEefWRzdPLUSbTjUVaaJ64/3qhQwpBUovilS3KBg==
X-Gm-Gg: ASbGncsMiLSDdifXKQ+AT/K9wsIFLLmBDk5lT1cKIyMyE9z1+08ccZVQ80q9eJGQ7Ws
 8PXvtJYAfrI47FafGMmCdTOXC6GUVmsQHTyW0r/Cu0WH/+pUUO+KsBhFaq/zHgfnbRN1bZ1BxqJ
 4K9y4XOhbuM6OgH2WkEReZ0OoYC/EsPaaEXLhiYsVB9WD7MTf0uq9poNC5vq8yP8X/bPVrL73RI
 qMkRiSaH2C4uoQwEAOHQ8pyyihHnvjOpCCakLk08DRnykzPD2ExlxjEK85ColTM9Ss/85CdLTEC
 i5OoatlVAIhVGZgdeI5OVeOBYYI1J55HqogiBLKEIgg5rCgz30p0uvJVrqjeBTGxMmfpfflCD1u
 fQhW01p9ullPQpnhkpwY=
X-Google-Smtp-Source: AGHT+IHerem0/qAVd8w9wdi6CqAo+LURLK868SOtur7NURzmdVJu7fqFKbLZ4OivC08XjLdtTOT8uw==
X-Received: by 2002:a05:6a21:78a2:b0:1f5:80a3:b008 with SMTP id
 adf61e73a8af0-1fbecd36bd5mr5863055637.32.1742396166652; 
 Wed, 19 Mar 2025 07:56:06 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af56ea041e7sm9254606a12.44.2025.03.19.07.56.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 07:56:06 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 32/34] drm/msm: Crashdec support for sparse
Date: Wed, 19 Mar 2025 07:52:44 -0700
Message-ID: <20250319145425.51935-33-robdclark@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250319145425.51935-1-robdclark@gmail.com>
References: <20250319145425.51935-1-robdclark@gmail.com>
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
 drivers/gpu/drm/msm/msm_gpu.c | 73 +++++++++++++++++++++++++----------
 1 file changed, 52 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index e35125d88466..aca943dc0cd7 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -257,6 +257,50 @@ static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
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
+		struct drm_gpuva *vma;
+		unsigned cnt = 0;
+
+		mutex_lock(&to_msm_vm(submit->vm)->vm_lock);
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
+		mutex_unlock(&to_msm_vm(submit->vm)->vm_lock);
+	} else {
+		state->bos = kcalloc(submit->nr_bos,
+			sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
+
+		for (int i = 0; state->bos && i < submit->nr_bos; i++) {
+			struct drm_gem_object *obj = submit->bos[i].obj;
+			bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
+
+			msm_gpu_crashstate_get_bo(state, obj, submit->bos[i].iova,
+						  dump, 0, obj->size);
+		}
+	}
+}
+
 static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 		struct msm_gem_submit *submit, char *comm, char *cmd)
 {
@@ -279,30 +323,17 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 	state->cmd = kstrdup(cmd, GFP_KERNEL);
 	state->fault_info = gpu->fault_info;
 
-	if (submit) {
-		extern bool rd_full;
-		int i;
-
-		if (state->fault_info.ttbr0) {
-			struct msm_gpu_fault_info *info = &state->fault_info;
-			struct msm_mmu *mmu = to_msm_vm(submit->vm)->mmu;
-
-			msm_iommu_pagetable_params(mmu, &info->pgtbl_ttbr0,
-						   &info->asid);
-			msm_iommu_pagetable_walk(mmu, info->iova, info->ptes);
-		}
+	if (submit && state->fault_info.ttbr0) {
+		struct msm_gpu_fault_info *info = &state->fault_info;
+		struct msm_mmu *mmu = to_msm_vm(submit->vm)->mmu;
 
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
2.48.1

