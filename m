Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAA39E80B0
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2024 17:18:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC88610E1F8;
	Sat,  7 Dec 2024 16:17:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jkhez5b8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 484BC10E1F8;
 Sat,  7 Dec 2024 16:17:58 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-21636268e43so2438975ad.2; 
 Sat, 07 Dec 2024 08:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733588277; x=1734193077; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R+JRnuXWhs08a+EDcfxe9pz6gKmsttHNz1O4hAWOZL4=;
 b=jkhez5b8I+3YpYzrXIZyQ5feNgTqvvQm29mXBLVrIvN1bM4YCAZLbxaD+Du+NNkxr2
 hDuR5trRSApSqj9IFsJdlZJBYSWGLIG8THVXVf8Z8K3GJ0LEihpIWz/uJ3NTeTjnuACL
 +IxXXlF1KOlPlCl6lPDAP8PdL5HddKLouBIeoeNyN6zOyh90XgzneceQHh7/Mk5P67+r
 3InVCWK54sUtMmggRzgdvKgyBkSQgF4vzewumod9CHhdZLqsGGqc6jpQKPwuwZNh/afj
 NBwwBdThgVeXZmUTB/VqKwGsH26DIXF+1GXHc+gUEGFBQaFkvr7jDsuo0d5x0UXirfzE
 b2nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733588277; x=1734193077;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R+JRnuXWhs08a+EDcfxe9pz6gKmsttHNz1O4hAWOZL4=;
 b=jrFAJE2xJXxIDxFyVjHwugoT+DodqsmLAhUJGdvj7lED3LkJJpWVx1E2goPxqyu+oB
 xbOVmAt/MoP81BeFUpy3vgJxlr7wKvTjMVzD0x66fX3527LVpcWHDnwgwMvgcchkGz3e
 1HpnOX+eyjRMGKcA9pNUyAzcYazCQhYviusS1sg5+nlCkbVxBFzp6fN221BWvrFUvb5N
 jUFEishv0p8godfhI16LLVDXSZHlakn9bTQGC9+ssOj/lPC+SUpPuKQA49uR8WxrjqLn
 DeMF2cgnYap7hKKUrMUY+LIphEIx1/yr0S2HLcX5bm2NVJ1baO5JkYLnikC7AGBp19fW
 338A==
X-Gm-Message-State: AOJu0YzxNOkQg/NSARPK1dAlCt7fz61fSUsuUhZ/7mqyJb1rvGGyjv5x
 R/KLF2fOXZGmscYChDKoLWm/irhO4mhUM+nMlGkP69LBj9y2mkpYaetf4Q==
X-Gm-Gg: ASbGncuql7UnWOWnuVQxYVsebnaqVjWxg+CdvYeTrcPpCZRhiCFfzR9ZNJFH18Zfq85
 6XvIRhbicfyR0wLNOA2HU8ZACFiCCVJUjC/UPAeLSWsMBefyqRUVy0y3S+kswXSh92UngBM5gqH
 baCmNjbNOXCD+x70D/UX/SKCTo+PY4c6sy77JlJ9hF3Sr/6OUKBMCh+vyWrUoYlPHGw/64vfrpP
 DT4O2rPS+0lh4Bqpzjfo5bsQrilX0vGz2q/QYumGu06PWtKNUTc0NzQnbFbzBrRH4Mih7UnHrW5
 YKEOsgPQ
X-Google-Smtp-Source: AGHT+IG9kI0ztCUDfXNin59RhS1SMZptcg9CT3wutjyCGL0/XL321SAxTI+pVyQfhJ5c7y9ro+Ja0g==
X-Received: by 2002:a17:903:1cc:b0:216:3083:d03d with SMTP id
 d9443c01a7336-2163083de10mr21530565ad.44.1733588277012; 
 Sat, 07 Dec 2024 08:17:57 -0800 (PST)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-216316d811asm10111915ad.212.2024.12.07.08.17.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2024 08:17:56 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paloma Arellano <quic_parellan@quicinc.com>,
 Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Carl Vanderlip <quic_carlv@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [RFC 11/24] drm/msm: Use drm_gpuvm types more
Date: Sat,  7 Dec 2024 08:15:11 -0800
Message-ID: <20241207161651.410556-12-robdclark@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241207161651.410556-1-robdclark@gmail.com>
References: <20241207161651.410556-1-robdclark@gmail.com>
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

Most of the driver code doesn't need to reach in to msm specific fields,
so just use the drm_gpuvm/drm_gpuva types directly.  This should
hopefully improve commonality with other drivers and make the code
easier to understand.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c         |  6 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |  6 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c         |  6 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h         |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         | 14 ++--
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c     |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       | 16 ++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       |  4 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   |  6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h   |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h     |  2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c      | 11 +--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c      | 11 +--
 drivers/gpu/drm/msm/dsi/dsi_host.c            |  6 +-
 drivers/gpu/drm/msm/msm_drv.h                 | 19 ++---
 drivers/gpu/drm/msm/msm_fb.c                  | 14 ++--
 drivers/gpu/drm/msm/msm_gem.c                 | 84 +++++++++----------
 drivers/gpu/drm/msm/msm_gem.h                 | 53 +++++-------
 drivers/gpu/drm/msm/msm_gem_submit.c          |  4 +-
 drivers/gpu/drm/msm/msm_gem_vma.c             | 72 +++++++---------
 drivers/gpu/drm/msm/msm_gpu.c                 | 19 +++--
 drivers/gpu/drm/msm/msm_gpu.h                 | 10 +--
 drivers/gpu/drm/msm/msm_kms.c                 |  4 +-
 drivers/gpu/drm/msm/msm_kms.h                 |  2 +-
 drivers/gpu/drm/msm/msm_submitqueue.c         |  2 +-
 27 files changed, 187 insertions(+), 200 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
index e0f2e9c77976..93a4eb38b88d 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
@@ -113,7 +113,7 @@ static int a2xx_hw_init(struct msm_gpu *gpu)
 	uint32_t *ptr, len;
 	int i, ret;
 
-	a2xx_gpummu_params(gpu->vm->mmu, &pt_base, &tran_error);
+	a2xx_gpummu_params(to_msm_vm(gpu->vm)->mmu, &pt_base, &tran_error);
 
 	DBG("%s", gpu->name);
 
@@ -466,11 +466,11 @@ static struct msm_gpu_state *a2xx_gpu_state_get(struct msm_gpu *gpu)
 	return state;
 }
 
-static struct msm_gem_vm *
+static struct drm_gpuvm *
 a2xx_create_vm(struct msm_gpu *gpu, struct platform_device *pdev)
 {
 	struct msm_mmu *mmu = a2xx_gpummu_new(&pdev->dev, gpu);
-	struct msm_gem_vm *vm;
+	struct drm_gpuvm *vm;
 
 	vm = msm_gem_vm_create(gpu->dev, mmu, "gpu", SZ_16M, 0xfff * SZ_64K, true);
 
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 4814c470e3a1..51f1915758af 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1789,8 +1789,10 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 		return ERR_PTR(ret);
 	}
 
-	if (gpu->vm)
-		msm_mmu_set_fault_handler(gpu->vm->mmu, gpu, a5xx_fault_handler);
+	if (gpu->vm) {
+		msm_mmu_set_fault_handler(to_msm_vm(gpu->vm)->mmu, gpu,
+					  a5xx_fault_handler);
+	}
 
 	/* Set up the preemption specific bits and pieces for each ringbuffer */
 	a5xx_preempt_init(gpu);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index e278d7564642..034f9e9000fb 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1218,6 +1218,8 @@ int a6xx_gmu_stop(struct a6xx_gpu *a6xx_gpu)
 
 static void a6xx_gmu_memory_free(struct a6xx_gmu *gmu)
 {
+	struct msm_mmu *mmu = to_msm_vm(gmu->vm)->mmu;
+
 	msm_gem_kernel_put(gmu->hfi.obj, gmu->vm);
 	msm_gem_kernel_put(gmu->debug.obj, gmu->vm);
 	msm_gem_kernel_put(gmu->icache.obj, gmu->vm);
@@ -1225,8 +1227,8 @@ static void a6xx_gmu_memory_free(struct a6xx_gmu *gmu)
 	msm_gem_kernel_put(gmu->dummy.obj, gmu->vm);
 	msm_gem_kernel_put(gmu->log.obj, gmu->vm);
 
-	gmu->vm->mmu->funcs->detach(gmu->vm->mmu);
-	msm_gem_vm_put(gmu->vm);
+	mmu->funcs->detach(mmu);
+	drm_gpuvm_put(gmu->vm);
 }
 
 static int a6xx_gmu_memory_alloc(struct a6xx_gmu *gmu, struct a6xx_gmu_bo *bo,
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 5ffabc16e35a..7566e801b172 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -50,7 +50,7 @@ struct a6xx_gmu {
 	/* For serializing communication with the GMU: */
 	struct mutex lock;
 
-	struct msm_gem_vm *vm;
+	struct drm_gpuvm *vm;
 
 	void __iomem *mmio;
 	void __iomem *rscc;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 9e2721f8aff8..79a692288d18 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -120,7 +120,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 	if (ctx->seqno == ring->cur_ctx_seqno)
 		return;
 
-	if (msm_iommu_pagetable_params(ctx->vm->mmu, &ttbr, &asid))
+	if (msm_iommu_pagetable_params(to_msm_vm(ctx->vm)->mmu, &ttbr, &asid))
 		return;
 
 	if (adreno_gpu->info->family >= ADRENO_7XX_GEN1) {
@@ -2231,7 +2231,7 @@ static void a6xx_gpu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
 	mutex_unlock(&a6xx_gpu->gmu.lock);
 }
 
-static struct msm_gem_vm *
+static struct drm_gpuvm *
 a6xx_create_vm(struct msm_gpu *gpu, struct platform_device *pdev)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -2249,12 +2249,12 @@ a6xx_create_vm(struct msm_gpu *gpu, struct platform_device *pdev)
 	return adreno_iommu_create_vm(gpu, pdev, quirks);
 }
 
-static struct msm_gem_vm *
+static struct drm_gpuvm *
 a6xx_create_private_vm(struct msm_gpu *gpu)
 {
 	struct msm_mmu *mmu;
 
-	mmu = msm_iommu_pagetable_create(gpu->vm->mmu);
+	mmu = msm_iommu_pagetable_create(to_msm_vm(gpu->vm)->mmu);
 
 	if (IS_ERR(mmu))
 		return ERR_CAST(mmu);
@@ -2534,8 +2534,10 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 
 	adreno_gpu->uche_trap_base = 0x1fffffffff000ull;
 
-	if (gpu->vm)
-		msm_mmu_set_fault_handler(gpu->vm->mmu, gpu, a6xx_fault_handler);
+	if (gpu->vm) {
+		msm_mmu_set_fault_handler(to_msm_vm(gpu->vm)->mmu, gpu,
+					  a6xx_fault_handler);
+	}
 
 	a6xx_calc_ubwc_config(adreno_gpu);
 	/* Set up the preemption specific bits and pieces for each ringbuffer */
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
index 41229c60aa06..bd40d0f26e2c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
@@ -376,7 +376,7 @@ static int preempt_init_ring(struct a6xx_gpu *a6xx_gpu,
 
 	struct a7xx_cp_smmu_info *smmu_info_ptr = ptr;
 
-	msm_iommu_pagetable_params(gpu->vm->mmu, &ttbr, &asid);
+	msm_iommu_pagetable_params(to_msm_vm(gpu->vm)->mmu, &ttbr, &asid);
 
 	smmu_info_ptr->magic = GEN7_CP_SMMU_INFO_MAGIC;
 	smmu_info_ptr->ttbr0 = ttbr;
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 5f82a56f17be..3104ad878cf1 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -191,21 +191,21 @@ int adreno_zap_shader_load(struct msm_gpu *gpu, u32 pasid)
 	return zap_shader_load_mdt(gpu, adreno_gpu->info->zapfw, pasid);
 }
 
-struct msm_gem_vm *
+struct drm_gpuvm *
 adreno_create_vm(struct msm_gpu *gpu,
 		 struct platform_device *pdev)
 {
 	return adreno_iommu_create_vm(gpu, pdev, 0);
 }
 
-struct msm_gem_vm *
+struct drm_gpuvm *
 adreno_iommu_create_vm(struct msm_gpu *gpu,
 		       struct platform_device *pdev,
 		       unsigned long quirks)
 {
 	struct iommu_domain_geometry *geometry;
 	struct msm_mmu *mmu;
-	struct msm_gem_vm *vm;
+	struct drm_gpuvm *vm;
 	u64 start, size;
 
 	mmu = msm_iommu_gpu_new(&pdev->dev, gpu, quirks);
@@ -262,7 +262,9 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 	 * it now.
 	 */
 	if (!do_devcoredump) {
-		gpu->vm->mmu->funcs->resume_translation(gpu->vm->mmu);
+		struct msm_mmu *mmu = to_msm_vm(gpu->vm)->mmu;
+
+		mmu->funcs->resume_translation(mmu);
 	}
 
 	/*
@@ -357,7 +359,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		return 0;
 	case MSM_PARAM_FAULTS:
 		if (ctx->vm)
-			*value = gpu->global_faults + ctx->vm->faults;
+			*value = gpu->global_faults + to_msm_vm(ctx->vm)->faults;
 		else
 			*value = gpu->global_faults;
 		return 0;
@@ -367,12 +369,12 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 	case MSM_PARAM_VA_START:
 		if (ctx->vm == gpu->vm)
 			return UERR(EINVAL, drm, "requires per-process pgtables");
-		*value = ctx->vm->base.mm_start;
+		*value = ctx->vm->mm_start;
 		return 0;
 	case MSM_PARAM_VA_SIZE:
 		if (ctx->vm == gpu->vm)
 			return UERR(EINVAL, drm, "requires per-process pgtables");
-		*value = ctx->vm->base.mm_range;
+		*value = ctx->vm->mm_range;
 		return 0;
 	case MSM_PARAM_HIGHEST_BANK_BIT:
 		*value = adreno_gpu->ubwc_config.highest_bank_bit;
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 728e4b0def3d..53e1830c1ba6 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -611,11 +611,11 @@ void adreno_show_object(struct drm_printer *p, void **ptr, int len,
  * Common helper function to initialize the default address space for arm-smmu
  * attached targets
  */
-struct msm_gem_vm *
+struct drm_gpuvm *
 adreno_create_vm(struct msm_gpu *gpu,
 		 struct platform_device *pdev);
 
-struct msm_gem_vm *
+struct drm_gpuvm *
 adreno_iommu_create_vm(struct msm_gpu *gpu,
 		       struct platform_device *pdev,
 		       unsigned long quirks);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 2c53c937485a..7acec7a3db01 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -558,7 +558,7 @@ static void dpu_encoder_phys_wb_prepare_wb_job(struct dpu_encoder_phys *phys_enc
 		struct drm_writeback_job *job)
 {
 	const struct msm_format *format;
-	struct msm_gem_vm *vm;
+	struct drm_gpuvm *vm;
 	struct dpu_hw_wb_cfg *wb_cfg;
 	int ret;
 	struct dpu_encoder_phys_wb *wb_enc = to_dpu_encoder_phys_wb(phys_enc);
@@ -611,7 +611,7 @@ static void dpu_encoder_phys_wb_cleanup_wb_job(struct dpu_encoder_phys *phys_enc
 		struct drm_writeback_job *job)
 {
 	struct dpu_encoder_phys_wb *wb_enc = to_dpu_encoder_phys_wb(phys_enc);
-	struct msm_gem_vm *vm;
+	struct drm_gpuvm *vm;
 
 	if (!job->fb)
 		return;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index d115b79af771..6aef29590a3d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -274,7 +274,7 @@ int dpu_format_populate_plane_sizes(
 	return _dpu_format_populate_plane_sizes_linear(fmt, fb, layout);
 }
 
-static void _dpu_format_populate_addrs_ubwc(struct msm_gem_vm *vm,
+static void _dpu_format_populate_addrs_ubwc(struct drm_gpuvm *vm,
 					    struct drm_framebuffer *fb,
 					    struct dpu_hw_fmt_layout *layout)
 {
@@ -355,7 +355,7 @@ static void _dpu_format_populate_addrs_ubwc(struct msm_gem_vm *vm,
 	}
 }
 
-static void _dpu_format_populate_addrs_linear(struct msm_gem_vm *vm,
+static void _dpu_format_populate_addrs_linear(struct drm_gpuvm *vm,
 					      struct drm_framebuffer *fb,
 					      struct dpu_hw_fmt_layout *layout)
 {
@@ -373,7 +373,7 @@ static void _dpu_format_populate_addrs_linear(struct msm_gem_vm *vm,
  * @fb:                framebuffer pointer
  * @layout:            format layout structure to populate
  */
-void dpu_format_populate_addrs(struct msm_gem_vm *vm,
+void dpu_format_populate_addrs(struct drm_gpuvm *vm,
 			       struct drm_framebuffer *fb,
 			       struct dpu_hw_fmt_layout *layout)
 {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
index 989f3e13c497..127bf4f586db 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
@@ -31,7 +31,7 @@ static inline bool dpu_find_format(u32 format, const u32 *supported_formats,
 	return false;
 }
 
-void dpu_format_populate_addrs(struct msm_gem_vm *vm,
+void dpu_format_populate_addrs(struct drm_gpuvm *vm,
 			       struct drm_framebuffer *fb,
 			       struct dpu_hw_fmt_layout *layout);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 37475f2a20ac..9f5df25bd42c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1054,17 +1054,17 @@ static void _dpu_kms_mmu_destroy(struct dpu_kms *dpu_kms)
 	if (!dpu_kms->base.vm)
 		return;
 
-	mmu = dpu_kms->base.vm->mmu;
+	mmu = to_msm_vm(dpu_kms->base.vm)->mmu;
 
 	mmu->funcs->detach(mmu);
-	msm_gem_vm_put(dpu_kms->base.vm);
+	drm_gpuvm_put(dpu_kms->base.vm);
 
 	dpu_kms->base.vm = NULL;
 }
 
 static int _dpu_kms_mmu_init(struct dpu_kms *dpu_kms)
 {
-	struct msm_gem_vm *vm;
+	struct drm_gpuvm *vm;
 
 	vm = msm_kms_init_vm(dpu_kms->dev);
 	if (IS_ERR(vm))
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index 3a76b57c137c..80b9ef650585 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -34,7 +34,7 @@
  */
 struct dpu_plane_state {
 	struct drm_plane_state base;
-	struct msm_gem_vm *vm;
+	struct drm_gpuvm *vm;
 	struct dpu_sw_pipe pipe;
 	struct dpu_sw_pipe r_pipe;
 	struct dpu_sw_pipe_cfg pipe_cfg;
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 13176168ade2..f239594417ec 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -120,15 +120,16 @@ static void mdp4_destroy(struct msm_kms *kms)
 {
 	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(kms));
 	struct device *dev = mdp4_kms->dev->dev;
-	struct msm_gem_vm *vm = kms->vm;
 
 	if (mdp4_kms->blank_cursor_iova)
 		msm_gem_unpin_iova(mdp4_kms->blank_cursor_bo, kms->vm);
 	drm_gem_object_put(mdp4_kms->blank_cursor_bo);
 
-	if (vm) {
-		vm->mmu->funcs->detach(vm->mmu);
-		msm_gem_vm_put(vm);
+	if (kms->vm) {
+		struct msm_mmu *mmu = to_msm_vm(kms->vm)->mmu;
+
+		mmu->funcs->detach(mmu);
+		drm_gpuvm_put(kms->vm);
 	}
 
 	if (mdp4_kms->rpm_enabled)
@@ -380,7 +381,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(priv->kms));
 	struct msm_kms *kms = NULL;
 	struct msm_mmu *mmu;
-	struct msm_gem_vm *vm;
+	struct drm_gpuvm *vm;
 	int ret;
 	u32 major, minor;
 	unsigned long max_clk;
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index bfbec278d19a..26541d195f4b 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -198,11 +198,12 @@ static void mdp5_destroy(struct mdp5_kms *mdp5_kms);
 static void mdp5_kms_destroy(struct msm_kms *kms)
 {
 	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
-	struct msm_gem_vm *vm = kms->vm;
 
-	if (vm) {
-		vm->mmu->funcs->detach(vm->mmu);
-		msm_gem_vm_put(vm);
+	if (kms->vm) {
+		struct msm_mmu *mmu = to_msm_vm(kms->vm)->mmu;
+
+		mmu->funcs->detach(mmu);
+		drm_gpuvm_put(kms->vm);
 	}
 
 	mdp_kms_destroy(&mdp5_kms->base);
@@ -500,7 +501,7 @@ static int mdp5_kms_init(struct drm_device *dev)
 	struct mdp5_kms *mdp5_kms;
 	struct mdp5_cfg *config;
 	struct msm_kms *kms = priv->kms;
-	struct msm_gem_vm *vm;
+	struct drm_gpuvm *vm;
 	int i, ret;
 
 	ret = mdp5_init(to_platform_device(dev->dev), dev);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 6ef3aaac1450..752720f65ecf 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -143,7 +143,7 @@ struct msm_dsi_host {
 
 	/* DSI 6G TX buffer*/
 	struct drm_gem_object *tx_gem_obj;
-	struct msm_gem_vm *vm;
+	struct drm_gpuvm *vm;
 
 	/* DSI v2 TX buffer */
 	void *tx_buf;
@@ -1158,7 +1158,7 @@ int dsi_tx_buf_alloc_6g(struct msm_dsi_host *msm_host, int size)
 	uint64_t iova;
 	u8 *data;
 
-	msm_host->vm = msm_gem_vm_get(priv->kms->vm);
+	msm_host->vm = drm_gpuvm_get(priv->kms->vm);
 
 	data = msm_gem_kernel_new(dev, size, MSM_BO_WC,
 					msm_host->vm,
@@ -1206,7 +1206,7 @@ void msm_dsi_tx_buf_free(struct mipi_dsi_host *host)
 
 	if (msm_host->tx_gem_obj) {
 		msm_gem_kernel_put(msm_host->tx_gem_obj, msm_host->vm);
-		msm_gem_vm_put(msm_host->vm);
+		drm_gpuvm_put(msm_host->vm);
 		msm_host->tx_gem_obj = NULL;
 		msm_host->vm = NULL;
 	}
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 20a0f8f23490..80582c0c2bf7 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -48,8 +48,6 @@ struct msm_rd_state;
 struct msm_perf_state;
 struct msm_gem_submit;
 struct msm_fence_context;
-struct msm_gem_vm;
-struct msm_gem_vma;
 struct msm_disp_state;
 
 #define MAX_CRTCS      8
@@ -230,7 +228,7 @@ void msm_crtc_disable_vblank(struct drm_crtc *crtc);
 int msm_register_mmu(struct drm_device *dev, struct msm_mmu *mmu);
 void msm_unregister_mmu(struct drm_device *dev, struct msm_mmu *mmu);
 
-struct msm_gem_vm *msm_kms_init_vm(struct drm_device *dev);
+struct drm_gpuvm *msm_kms_init_vm(struct drm_device *dev);
 bool msm_use_mmu(struct drm_device *dev);
 
 int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
@@ -251,13 +249,14 @@ struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
 int msm_gem_prime_pin(struct drm_gem_object *obj);
 void msm_gem_prime_unpin(struct drm_gem_object *obj);
 
-int msm_framebuffer_prepare(struct drm_framebuffer *fb,
-		struct msm_gem_vm *vm, bool needs_dirtyfb);
-void msm_framebuffer_cleanup(struct drm_framebuffer *fb,
-		struct msm_gem_vm *vm, bool needed_dirtyfb);
-uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb,
-		struct msm_gem_vm *vm, int plane);
-struct drm_gem_object *msm_framebuffer_bo(struct drm_framebuffer *fb, int plane);
+int msm_framebuffer_prepare(struct drm_framebuffer *fb, struct drm_gpuvm *vm,
+			    bool needs_dirtyfb);
+void msm_framebuffer_cleanup(struct drm_framebuffer *fb, struct drm_gpuvm *vm,
+			     bool needed_dirtyfb);
+uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb, struct drm_gpuvm *vm,
+			      int plane);
+struct drm_gem_object *msm_framebuffer_bo(struct drm_framebuffer *fb,
+					  int plane);
 const struct msm_format *msm_framebuffer_format(struct drm_framebuffer *fb);
 struct drm_framebuffer *msm_framebuffer_create(struct drm_device *dev,
 		struct drm_file *file, const struct drm_mode_fb_cmd2 *mode_cmd);
diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index 6df318b73534..d267aa1cb218 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -75,9 +75,8 @@ void msm_framebuffer_describe(struct drm_framebuffer *fb, struct seq_file *m)
 
 /* prepare/pin all the fb's bo's for scanout.
  */
-int msm_framebuffer_prepare(struct drm_framebuffer *fb,
-		struct msm_gem_vm *vm,
-		bool needs_dirtyfb)
+int msm_framebuffer_prepare(struct drm_framebuffer *fb, struct drm_gpuvm *vm,
+			    bool needs_dirtyfb)
 {
 	struct msm_framebuffer *msm_fb = to_msm_framebuffer(fb);
 	int ret, i, n = fb->format->num_planes;
@@ -98,9 +97,8 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb,
 	return 0;
 }
 
-void msm_framebuffer_cleanup(struct drm_framebuffer *fb,
-		struct msm_gem_vm *vm,
-		bool needed_dirtyfb)
+void msm_framebuffer_cleanup(struct drm_framebuffer *fb, struct drm_gpuvm *vm,
+			     bool needed_dirtyfb)
 {
 	struct msm_framebuffer *msm_fb = to_msm_framebuffer(fb);
 	int i, n = fb->format->num_planes;
@@ -115,8 +113,8 @@ void msm_framebuffer_cleanup(struct drm_framebuffer *fb,
 		memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
 }
 
-uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb,
-		struct msm_gem_vm *vm, int plane)
+uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb, struct drm_gpuvm *vm,
+			      int plane)
 {
 	struct msm_framebuffer *msm_fb = to_msm_framebuffer(fb);
 	return msm_fb->iova[plane] + fb->offsets[plane];
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index a8de7b158a37..99e0ce38cd92 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -353,8 +353,8 @@ uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj)
 	return offset;
 }
 
-static struct msm_gem_vma *lookup_vma(struct drm_gem_object *obj,
-				      struct msm_gem_vm *vm)
+static struct drm_gpuva *lookup_vma(struct drm_gem_object *obj,
+				    struct drm_gpuvm *vm)
 {
 	struct drm_gpuvm_bo *vm_bo;
 
@@ -364,13 +364,13 @@ static struct msm_gem_vma *lookup_vma(struct drm_gem_object *obj,
 		struct drm_gpuva *vma;
 
 		drm_gpuvm_bo_for_each_va (vma, vm_bo) {
-			if (vma->vm == &vm->base) {
+			if (vma->vm == vm) {
 				/* lookup_vma() should only be used in paths
 				 * with at most one vma per vm
 				 */
 				GEM_WARN_ON(!list_is_singular(&vm_bo->list.gpuva));
 
-				return to_msm_vma(vma);
+				return vma;
 			}
 		}
 	}
@@ -395,11 +395,9 @@ put_iova_spaces(struct drm_gem_object *obj, bool close)
 		struct drm_gpuva *vma, *vmatmp;
 
 		drm_gpuvm_bo_for_each_va_safe (vma, vmatmp, vm_bo) {
-			struct msm_gem_vma *msm_vma = to_msm_vma(vma);
-
-			msm_gem_vma_purge(msm_vma);
+			msm_gem_vma_purge(vma);
 			if (close)
-				msm_gem_vma_close(msm_vma);
+				msm_gem_vma_close(vma);
 		}
 	}
 }
@@ -416,18 +414,16 @@ put_iova_vmas(struct drm_gem_object *obj)
 		struct drm_gpuva *vma, *vmatmp;
 
 		drm_gpuvm_bo_for_each_va_safe (vma, vmatmp, vm_bo) {
-			struct msm_gem_vma *msm_vma = to_msm_vma(vma);
-
-			msm_gem_vma_close(msm_vma);
+			msm_gem_vma_close(vma);
 		}
 	}
 }
 
-static struct msm_gem_vma *get_vma_locked(struct drm_gem_object *obj,
-		struct msm_gem_vm *vm,
-		u64 range_start, u64 range_end)
+static struct drm_gpuva *get_vma_locked(struct drm_gem_object *obj,
+					struct drm_gpuvm *vm, u64 range_start,
+					u64 range_end)
 {
-	struct msm_gem_vma *vma;
+	struct drm_gpuva *vma;
 
 	msm_gem_assert_locked(obj);
 
@@ -436,14 +432,14 @@ static struct msm_gem_vma *get_vma_locked(struct drm_gem_object *obj,
 	if (!vma) {
 		vma = msm_gem_vma_new(vm, obj, range_start, range_end);
 	} else {
-		GEM_WARN_ON(vma->base.va.addr < range_start);
-		GEM_WARN_ON((vma->base.va.addr + obj->size) > range_end);
+		GEM_WARN_ON(vma->va.addr < range_start);
+		GEM_WARN_ON((vma->va.addr + obj->size) > range_end);
 	}
 
 	return vma;
 }
 
-int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct msm_gem_vma *vma)
+int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct page **pages;
@@ -496,17 +492,17 @@ void msm_gem_unpin_active(struct drm_gem_object *obj)
 	update_lru_active(obj);
 }
 
-struct msm_gem_vma *msm_gem_get_vma_locked(struct drm_gem_object *obj,
-					   struct msm_gem_vm *vm)
+struct drm_gpuva *msm_gem_get_vma_locked(struct drm_gem_object *obj,
+					 struct drm_gpuvm *vm)
 {
 	return get_vma_locked(obj, vm, 0, U64_MAX);
 }
 
 static int get_and_pin_iova_range_locked(struct drm_gem_object *obj,
-		struct msm_gem_vm *vm, uint64_t *iova,
-		u64 range_start, u64 range_end)
+					 struct drm_gpuvm *vm, uint64_t *iova,
+					 u64 range_start, u64 range_end)
 {
-	struct msm_gem_vma *vma;
+	struct drm_gpuva *vma;
 	int ret;
 
 	msm_gem_assert_locked(obj);
@@ -517,7 +513,7 @@ static int get_and_pin_iova_range_locked(struct drm_gem_object *obj,
 
 	ret = msm_gem_pin_vma_locked(obj, vma);
 	if (!ret) {
-		*iova = vma->base.va.addr;
+		*iova = vma->va.addr;
 		pin_obj_locked(obj);
 	}
 
@@ -529,8 +525,8 @@ static int get_and_pin_iova_range_locked(struct drm_gem_object *obj,
  * limits iova to specified range (in pages)
  */
 int msm_gem_get_and_pin_iova_range(struct drm_gem_object *obj,
-		struct msm_gem_vm *vm, uint64_t *iova,
-		u64 range_start, u64 range_end)
+				   struct drm_gpuvm *vm, uint64_t *iova,
+				   u64 range_start, u64 range_end)
 {
 	int ret;
 
@@ -542,8 +538,8 @@ int msm_gem_get_and_pin_iova_range(struct drm_gem_object *obj,
 }
 
 /* get iova and pin it. Should have a matching put */
-int msm_gem_get_and_pin_iova(struct drm_gem_object *obj,
-		struct msm_gem_vm *vm, uint64_t *iova)
+int msm_gem_get_and_pin_iova(struct drm_gem_object *obj, struct drm_gpuvm *vm,
+			     uint64_t *iova)
 {
 	return msm_gem_get_and_pin_iova_range(obj, vm, iova, 0, U64_MAX);
 }
@@ -552,10 +548,10 @@ int msm_gem_get_and_pin_iova(struct drm_gem_object *obj,
  * Get an iova but don't pin it. Doesn't need a put because iovas are currently
  * valid for the life of the object
  */
-int msm_gem_get_iova(struct drm_gem_object *obj,
-		struct msm_gem_vm *vm, uint64_t *iova)
+int msm_gem_get_iova(struct drm_gem_object *obj, struct drm_gpuvm *vm,
+		     uint64_t *iova)
 {
-	struct msm_gem_vma *vma;
+	struct drm_gpuva *vma;
 	int ret = 0;
 
 	msm_gem_lock(obj);
@@ -563,7 +559,7 @@ int msm_gem_get_iova(struct drm_gem_object *obj,
 	if (IS_ERR(vma)) {
 		ret = PTR_ERR(vma);
 	} else {
-		*iova = vma->base.va.addr;
+		*iova = vma->va.addr;
 	}
 	msm_gem_unlock(obj);
 
@@ -571,9 +567,9 @@ int msm_gem_get_iova(struct drm_gem_object *obj,
 }
 
 static int clear_iova(struct drm_gem_object *obj,
-		      struct msm_gem_vm *vm)
+		      struct drm_gpuvm *vm)
 {
-	struct msm_gem_vma *vma = lookup_vma(obj, vm);
+	struct drm_gpuva *vma = lookup_vma(obj, vm);
 
 	if (!vma)
 		return 0;
@@ -592,7 +588,7 @@ static int clear_iova(struct drm_gem_object *obj,
  * Setting an iova of zero will clear the vma.
  */
 int msm_gem_set_iova(struct drm_gem_object *obj,
-		     struct msm_gem_vm *vm, uint64_t iova)
+		     struct drm_gpuvm *vm, uint64_t iova)
 {
 	int ret = 0;
 
@@ -600,11 +596,11 @@ int msm_gem_set_iova(struct drm_gem_object *obj,
 	if (!iova) {
 		ret = clear_iova(obj, vm);
 	} else {
-		struct msm_gem_vma *vma;
+		struct drm_gpuva *vma;
 		vma = get_vma_locked(obj, vm, iova, iova + obj->size);
 		if (IS_ERR(vma)) {
 			ret = PTR_ERR(vma);
-		} else if (GEM_WARN_ON(vma->base.va.addr != iova)) {
+		} else if (GEM_WARN_ON(vma->va.addr != iova)) {
 			clear_iova(obj, vm);
 			ret = -EBUSY;
 		}
@@ -619,10 +615,9 @@ int msm_gem_set_iova(struct drm_gem_object *obj,
  * purged until something else (shrinker, mm_notifier, destroy, etc) decides
  * to get rid of it
  */
-void msm_gem_unpin_iova(struct drm_gem_object *obj,
-		struct msm_gem_vm *vm)
+void msm_gem_unpin_iova(struct drm_gem_object *obj, struct drm_gpuvm *vm)
 {
-	struct msm_gem_vma *vma;
+	struct drm_gpuva *vma;
 
 	msm_gem_lock(obj);
 	vma = lookup_vma(obj, vm);
@@ -1240,9 +1235,9 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 	return ERR_PTR(ret);
 }
 
-void *msm_gem_kernel_new(struct drm_device *dev, uint32_t size,
-		uint32_t flags, struct msm_gem_vm *vm,
-		struct drm_gem_object **bo, uint64_t *iova)
+void *msm_gem_kernel_new(struct drm_device *dev, uint32_t size, uint32_t flags,
+			 struct drm_gpuvm *vm, struct drm_gem_object **bo,
+			 uint64_t *iova)
 {
 	void *vaddr;
 	struct drm_gem_object *obj = msm_gem_new(dev, size, flags);
@@ -1275,8 +1270,7 @@ void *msm_gem_kernel_new(struct drm_device *dev, uint32_t size,
 
 }
 
-void msm_gem_kernel_put(struct drm_gem_object *bo,
-		struct msm_gem_vm *vm)
+void msm_gem_kernel_put(struct drm_gem_object *bo, struct drm_gpuvm *vm)
 {
 	if (IS_ERR_OR_NULL(bo))
 		return;
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 5091892bbe2e..acb976722580 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -85,12 +85,7 @@ struct msm_gem_vm {
 };
 #define to_msm_vm(x) container_of(x, struct msm_gem_vm, base)
 
-struct msm_gem_vm *
-msm_gem_vm_get(struct msm_gem_vm *vm);
-
-void msm_gem_vm_put(struct msm_gem_vm *vm);
-
-struct msm_gem_vm *
+struct drm_gpuvm *
 msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
 		  u64 va_start, u64 va_size, bool managed);
 
@@ -117,12 +112,12 @@ struct msm_gem_vma {
 };
 #define to_msm_vma(x) container_of(x, struct msm_gem_vma, base)
 
-struct msm_gem_vma *
-msm_gem_vma_new(struct msm_gem_vm *vm, struct drm_gem_object *obj,
+struct drm_gpuva *
+msm_gem_vma_new(struct drm_gpuvm *vm, struct drm_gem_object *obj,
 		u64 range_start, u64 range_end);
-void msm_gem_vma_purge(struct msm_gem_vma *vma);
-int msm_gem_vma_map(struct msm_gem_vma *vma, int prot, struct sg_table *sgt, int size);
-void msm_gem_vma_close(struct msm_gem_vma *vma);
+void msm_gem_vma_purge(struct drm_gpuva *vma);
+int msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt, int size);
+void msm_gem_vma_close(struct drm_gpuva *vma);
 
 struct msm_gem_object {
 	struct drm_gem_object base;
@@ -167,22 +162,21 @@ struct msm_gem_object {
 #define to_msm_bo(x) container_of(x, struct msm_gem_object, base)
 
 uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj);
-int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct msm_gem_vma *vma);
+int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma);
 void msm_gem_unpin_locked(struct drm_gem_object *obj);
 void msm_gem_unpin_active(struct drm_gem_object *obj);
-struct msm_gem_vma *msm_gem_get_vma_locked(struct drm_gem_object *obj,
-					   struct msm_gem_vm *vm);
-int msm_gem_get_iova(struct drm_gem_object *obj,
-		struct msm_gem_vm *vm, uint64_t *iova);
-int msm_gem_set_iova(struct drm_gem_object *obj,
-		struct msm_gem_vm *vm, uint64_t iova);
+struct drm_gpuva *msm_gem_get_vma_locked(struct drm_gem_object *obj,
+					 struct drm_gpuvm *vm);
+int msm_gem_get_iova(struct drm_gem_object *obj, struct drm_gpuvm *vm,
+		     uint64_t *iova);
+int msm_gem_set_iova(struct drm_gem_object *obj, struct drm_gpuvm *vm,
+		     uint64_t iova);
 int msm_gem_get_and_pin_iova_range(struct drm_gem_object *obj,
-		struct msm_gem_vm *vm, uint64_t *iova,
-		u64 range_start, u64 range_end);
-int msm_gem_get_and_pin_iova(struct drm_gem_object *obj,
-		struct msm_gem_vm *vm, uint64_t *iova);
-void msm_gem_unpin_iova(struct drm_gem_object *obj,
-		struct msm_gem_vm *vm);
+				   struct drm_gpuvm *vm, uint64_t *iova,
+				   u64 range_start, u64 range_end);
+int msm_gem_get_and_pin_iova(struct drm_gem_object *obj, struct drm_gpuvm *vm,
+			     uint64_t *iova);
+void msm_gem_unpin_iova(struct drm_gem_object *obj, struct drm_gpuvm *vm);
 void msm_gem_pin_obj_locked(struct drm_gem_object *obj);
 struct page **msm_gem_pin_pages_locked(struct drm_gem_object *obj);
 void msm_gem_unpin_pages_locked(struct drm_gem_object *obj);
@@ -203,11 +197,10 @@ int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
 		uint32_t size, uint32_t flags, uint32_t *handle, char *name);
 struct drm_gem_object *msm_gem_new(struct drm_device *dev,
 		uint32_t size, uint32_t flags);
-void *msm_gem_kernel_new(struct drm_device *dev, uint32_t size,
-		uint32_t flags, struct msm_gem_vm *vm,
-		struct drm_gem_object **bo, uint64_t *iova);
-void msm_gem_kernel_put(struct drm_gem_object *bo,
-		struct msm_gem_vm *vm);
+void *msm_gem_kernel_new(struct drm_device *dev, uint32_t size, uint32_t flags,
+			 struct drm_gpuvm *vm, struct drm_gem_object **bo,
+			 uint64_t *iova);
+void msm_gem_kernel_put(struct drm_gem_object *bo, struct drm_gpuvm *vm);
 struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 		struct dma_buf *dmabuf, struct sg_table *sgt);
 __printf(2, 3)
@@ -301,7 +294,7 @@ struct msm_gem_submit {
 	struct kref ref;
 	struct drm_device *dev;
 	struct msm_gpu *gpu;
-	struct msm_gem_vm *vm;
+	struct drm_gpuvm *vm;
 	struct list_head node;   /* node in ring submit list */
 	struct drm_exec exec;
 	uint32_t seqno;		/* Sequence number of the submit on the ring */
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 14845768f7af..8a4f4c403404 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -299,7 +299,7 @@ static int submit_pin_objects(struct msm_gem_submit *submit)
 
 	for (i = 0; i < submit->nr_bos; i++) {
 		struct drm_gem_object *obj = submit->bos[i].obj;
-		struct msm_gem_vma *vma;
+		struct drm_gpuva *vma;
 
 		/* if locking succeeded, pin bo: */
 		vma = msm_gem_get_vma_locked(obj, submit->vm);
@@ -312,7 +312,7 @@ static int submit_pin_objects(struct msm_gem_submit *submit)
 		if (ret)
 			break;
 
-		submit->bos[i].iova = vma->base.va.addr;
+		submit->bos[i].iova = vma->va.addr;
 	}
 
 	/*
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index f4655ae1d71b..b37bfd80bca9 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -20,52 +20,38 @@ msm_gem_vm_free(struct drm_gpuvm *gpuvm)
 	kfree(vm);
 }
 
-
-void msm_gem_vm_put(struct msm_gem_vm *vm)
-{
-	if (vm)
-		drm_gpuvm_put(&vm->base);
-}
-
-struct msm_gem_vm *
-msm_gem_vm_get(struct msm_gem_vm *vm)
-{
-	if (!IS_ERR_OR_NULL(vm))
-		drm_gpuvm_get(&vm->base);
-
-	return vm;
-}
-
 /* Actually unmap memory for the vma */
-void msm_gem_vma_purge(struct msm_gem_vma *vma)
+void msm_gem_vma_purge(struct drm_gpuva *vma)
 {
-	struct msm_gem_vm *vm = to_msm_vm(vma->base.vm);
-	unsigned size = vma->base.va.range;
+	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
+	struct msm_gem_vm *vm = to_msm_vm(vma->vm);
+	unsigned size = vma->va.range;
 
 	/* Don't do anything if the memory isn't mapped */
-	if (!vma->mapped)
+	if (!msm_vma->mapped)
 		return;
 
-	vm->mmu->funcs->unmap(vm->mmu, vma->base.va.addr, size);
+	vm->mmu->funcs->unmap(vm->mmu, vma->va.addr, size);
 
-	vma->mapped = false;
+	msm_vma->mapped = false;
 }
 
 /* Map and pin vma: */
 int
-msm_gem_vma_map(struct msm_gem_vma *vma, int prot,
+msm_gem_vma_map(struct drm_gpuva *vma, int prot,
 		struct sg_table *sgt, int size)
 {
-	struct msm_gem_vm *vm = to_msm_vm(vma->base.vm);
+	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
+	struct msm_gem_vm *vm = to_msm_vm(vma->vm);
 	int ret;
 
-	if (GEM_WARN_ON(!vma->base.va.addr))
+	if (GEM_WARN_ON(!vma->va.addr))
 		return -EINVAL;
 
-	if (vma->mapped)
+	if (msm_vma->mapped)
 		return 0;
 
-	vma->mapped = true;
+	msm_vma->mapped = true;
 
 	/*
 	 * NOTE: iommu/io-pgtable can allocate pages, so we cannot hold
@@ -76,40 +62,44 @@ msm_gem_vma_map(struct msm_gem_vma *vma, int prot,
 	 * Revisit this if we can come up with a scheme to pre-alloc pages
 	 * for the pgtable in map/unmap ops.
 	 */
-	ret = vm->mmu->funcs->map(vm->mmu, vma->base.va.addr, sgt, size, prot);
+	ret = vm->mmu->funcs->map(vm->mmu, vma->va.addr, sgt, size, prot);
 
 	if (ret) {
-		vma->mapped = false;
+		msm_vma->mapped = false;
 	}
 
 	return ret;
 }
 
 /* Close an iova.  Warn if it is still in use */
-void msm_gem_vma_close(struct msm_gem_vma *vma)
+void msm_gem_vma_close(struct drm_gpuva *vma)
 {
-	struct msm_gem_vm *vm = to_msm_vm(vma->base.vm);
+	struct msm_gem_vm *vm = to_msm_vm(vma->vm);
+	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
 
-	GEM_WARN_ON(vma->mapped);
+	GEM_WARN_ON(msm_vma->mapped);
 
 	spin_lock(&vm->mm_lock);
-	if (vma->base.va.addr)
-		drm_mm_remove_node(&vma->node);
+	if (vma->va.addr && vm->managed)
+		drm_mm_remove_node(&msm_vma->node);
 	spin_unlock(&vm->mm_lock);
 
+	dma_resv_lock(drm_gpuvm_resv(vma->vm), NULL);
 	mutex_lock(&vm->vm_lock);
-	drm_gpuva_remove(&vma->base);
-	drm_gpuva_unlink(&vma->base);
+	drm_gpuva_remove(vma);
+	drm_gpuva_unlink(vma);
 	mutex_unlock(&vm->vm_lock);
+	dma_resv_unlock(drm_gpuvm_resv(vma->vm));
 
 	kfree(vma);
 }
 
 /* Create a new vma and allocate an iova for it */
-struct msm_gem_vma *
-msm_gem_vma_new(struct msm_gem_vm *vm, struct drm_gem_object *obj,
+struct drm_gpuva *
+msm_gem_vma_new(struct drm_gpuvm *_vm, struct drm_gem_object *obj,
 		u64 range_start, u64 range_end)
 {
+	struct msm_gem_vm *vm = to_msm_vm(_vm);
 	struct drm_gpuvm_bo *vm_bo;
 	struct msm_gem_vma *vma;
 	int ret;
@@ -154,7 +144,7 @@ msm_gem_vma_new(struct msm_gem_vm *vm, struct drm_gem_object *obj,
 	mutex_unlock(&vm->vm_lock);
 	GEM_WARN_ON(drm_gpuvm_bo_put(vm_bo));
 
-	return vma;
+	return &vma->base;
 
 err_va_remove:
 	mutex_lock(&vm->vm_lock);
@@ -186,7 +176,7 @@ static const struct drm_gpuvm_ops msm_gpuvm_ops = {
  * handles virtual address allocation, and both async and sync operations
  * are supported.
  */
-struct msm_gem_vm *
+struct drm_gpuvm *
 msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
 		  u64 va_start, u64 va_size, bool managed)
 {
@@ -219,7 +209,7 @@ msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
 
 	drm_mm_init(&vm->mm, va_start, va_size);
 
-	return vm;
+	return &vm->base;
 
 err_free_vm:
 	kfree(vm);
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index b61cc939363d..17d8be47db19 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -378,7 +378,7 @@ static void recover_worker(struct kthread_work *work)
 	/* Increment the fault counts */
 	submit->queue->faults++;
 	if (submit->vm)
-		submit->vm->faults++;
+		to_msm_vm(submit->vm)->faults++;
 
 	get_comm_cmdline(submit, &comm, &cmd);
 
@@ -454,6 +454,7 @@ static void fault_worker(struct kthread_work *work)
 {
 	struct msm_gpu *gpu = container_of(work, struct msm_gpu, fault_work);
 	struct msm_gem_submit *submit;
+	struct msm_mmu *mmu = to_msm_vm(gpu->vm)->mmu;
 	struct msm_ringbuffer *cur_ring = gpu->funcs->active_ring(gpu);
 	char *comm = NULL, *cmd = NULL;
 
@@ -483,7 +484,7 @@ static void fault_worker(struct kthread_work *work)
 
 resume_smmu:
 	memset(&gpu->fault_info, 0, sizeof(gpu->fault_info));
-	gpu->vm->mmu->funcs->resume_translation(gpu->vm->mmu);
+	mmu->funcs->resume_translation(mmu);
 
 	mutex_unlock(&gpu->lock);
 }
@@ -820,10 +821,11 @@ static int get_clocks(struct platform_device *pdev, struct msm_gpu *gpu)
 }
 
 /* Return a new address space for a msm_drm_private instance */
-struct msm_gem_vm *
+struct drm_gpuvm *
 msm_gpu_create_private_vm(struct msm_gpu *gpu, struct task_struct *task)
 {
-	struct msm_gem_vm *vm = NULL;
+	struct drm_gpuvm *vm = NULL;
+
 	if (!gpu)
 		return NULL;
 
@@ -834,11 +836,11 @@ msm_gpu_create_private_vm(struct msm_gpu *gpu, struct task_struct *task)
 	if (gpu->funcs->create_private_vm) {
 		vm = gpu->funcs->create_private_vm(gpu);
 		if (!IS_ERR(vm))
-			vm->pid = get_pid(task_pid(task));
+			to_msm_vm(vm)->pid = get_pid(task_pid(task));
 	}
 
 	if (IS_ERR_OR_NULL(vm))
-		vm = msm_gem_vm_get(gpu->vm);
+		vm = drm_gpuvm_get(gpu->vm);
 
 	return vm;
 }
@@ -1011,8 +1013,9 @@ void msm_gpu_cleanup(struct msm_gpu *gpu)
 	msm_gem_kernel_put(gpu->memptrs_bo, gpu->vm);
 
 	if (!IS_ERR_OR_NULL(gpu->vm)) {
-		gpu->vm->mmu->funcs->detach(gpu->vm->mmu);
-		msm_gem_vm_put(gpu->vm);
+		struct msm_mmu *mmu = to_msm_vm(gpu->vm)->mmu;
+		mmu->funcs->detach(mmu);
+		drm_gpuvm_put(gpu->vm);
 	}
 
 	if (gpu->worker) {
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index edbdd894adfb..ad6f14891205 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -78,8 +78,8 @@ struct msm_gpu_funcs {
 	/* note: gpu_set_freq() can assume that we have been pm_resumed */
 	void (*gpu_set_freq)(struct msm_gpu *gpu, struct dev_pm_opp *opp,
 			     bool suspended);
-	struct msm_gem_vm *(*create_vm)(struct msm_gpu *gpu, struct platform_device *pdev);
-	struct msm_gem_vm *(*create_private_vm)(struct msm_gpu *gpu);
+	struct drm_gpuvm *(*create_vm)(struct msm_gpu *gpu, struct platform_device *pdev);
+	struct drm_gpuvm *(*create_private_vm)(struct msm_gpu *gpu);
 	uint32_t (*get_rptr)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 
 	/**
@@ -226,7 +226,7 @@ struct msm_gpu {
 	void __iomem *mmio;
 	int irq;
 
-	struct msm_gem_vm *vm;
+	struct drm_gpuvm *vm;
 
 	/* Power Control: */
 	struct regulator *gpu_reg, *gpu_cx;
@@ -355,7 +355,7 @@ struct msm_context {
 	int queueid;
 
 	/** @vm: the per-process GPU address-space */
-	struct msm_gem_vm *vm;
+	struct drm_gpuvm *vm;
 
 	/** @kref: the reference count */
 	struct kref ref;
@@ -665,7 +665,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		struct msm_gpu *gpu, const struct msm_gpu_funcs *funcs,
 		const char *name, struct msm_gpu_config *config);
 
-struct msm_gem_vm *
+struct drm_gpuvm *
 msm_gpu_create_private_vm(struct msm_gpu *gpu, struct task_struct *task);
 
 void msm_gpu_cleanup(struct msm_gpu *gpu);
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 4e90efaad714..53ec3dfc5f57 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -164,9 +164,9 @@ void msm_crtc_disable_vblank(struct drm_crtc *crtc)
 	vblank_ctrl_queue_work(priv, crtc, false);
 }
 
-struct msm_gem_vm *msm_kms_init_vm(struct drm_device *dev)
+struct drm_gpuvm *msm_kms_init_vm(struct drm_device *dev)
 {
-	struct msm_gem_vm *vm;
+	struct drm_gpuvm *vm;
 	struct msm_mmu *mmu;
 	struct device *mdp_dev = dev->dev;
 	struct device *mdss_dev = mdp_dev->parent;
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 73da232237bc..79e494f954ca 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -129,7 +129,7 @@ struct msm_kms {
 	bool irq_requested;
 
 	/* mapper-id used to request GEM buffer mapped for scanout: */
-	struct msm_gem_vm *vm;
+	struct drm_gpuvm *vm;
 
 	/* disp snapshot support */
 	struct kthread_worker *dump_worker;
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 6298233c3568..8ced49c7557b 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -59,7 +59,7 @@ void __msm_context_destroy(struct kref *kref)
 		kfree(ctx->entities[i]);
 	}
 
-	msm_gem_vm_put(ctx->vm);
+	drm_gpuvm_put(ctx->vm);
 	kfree(ctx->comm);
 	kfree(ctx->cmdline);
 	kfree(ctx);
-- 
2.47.1

