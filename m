Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 046C4A69157
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 15:55:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4836010E517;
	Wed, 19 Mar 2025 14:55:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DD5gzNWO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD1110E517;
 Wed, 19 Mar 2025 14:55:30 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-223a7065ff8so52483225ad.0; 
 Wed, 19 Mar 2025 07:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742396130; x=1743000930; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4wPGaWcXKTbzClNRHPWqQd+Vb852kmbrt/TxmjiMN1w=;
 b=DD5gzNWO712ixDFHFPShHeGAuf8Mp1tiI1eNz20VG+4mS8CRAokpszZuTpBBFl6k9I
 TMQybyWeWQCLa8DnGh/vQNwvHvMy7FvBFQVLecbof7s6MLR13OnyrrmhTQ4v3/WEqYmS
 pPlayynnVJJvS0UEXB53HuDoEZqlU0JoD/qhddNgYr+MUrXtrBMNPusazso6eecDj0Pp
 KU4v9TY6KbUEgJKQEwE4T9wmKJM9JMUAcbpTRDf3qsZ/U2ObEhraTpgh4PZFWxdsS8UG
 qd2baDrZPMqVqal4log7IFg5PWQ7kHKt3FYmNNDB2IY3zcHEnHvLruNaVqpHxjLq7hpc
 /Dsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742396130; x=1743000930;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4wPGaWcXKTbzClNRHPWqQd+Vb852kmbrt/TxmjiMN1w=;
 b=W0LX+9E0Nd+W0vL/kFyIXRbp4mTmUt0VxHiaC9cjFaxdhrQmlTtR9k9oL1rq6RxqPq
 Wcug9wX6aOg3/r1qm8v7lEaFCZS/MeocU8KFykS+XU8pPGV4rXp/iQ94MpltbOVVVc99
 Gtq8aSPocIN87W44zX0sr4d7IS6IgUSpkJAiGZKIUEiMIJlBbPE9hqSgu9VZD3hRFE2r
 3yeFveo0TULRxdbELniBOXEr3OT15MkEj+hHdq3TP2t0th8xGMeZAKTUk10vYCBVeOyv
 hpyJz8t8GpYbHXcM7O5VMZAAK/dXEkG/NwNOW+LntBR8MgHIFkkmBLUaCjXXibRenVhM
 rDyw==
X-Gm-Message-State: AOJu0YwZ6wGPqSluiB07EK3maGUaNnLOFck9lHXlXddhAMTGECURmLZO
 bPNekNx2gjJq3I6ZG5gXSIvmX1Io5qLQXeRb4mP+r2883I2Cg3GRkAdKrA==
X-Gm-Gg: ASbGnctd5LJr9R1iGYvK7kkNvk37POkG5FeO/8uxLZHoqP486rLewQwm2fZzJgbVoEF
 sV6x2fGQfiUVQMzgCd5zuBptrshRrMGbHo99Ro+Lxd8qvkedZaY4J+ahXWetfxPJnp2yw3qgzzE
 Nk73O3+JexfZKeltF016q401/z3OXLuZBaeM9u5RuMagk7ArRQoUSimriOV80oqs5USku3cjnNR
 WwL1KF7PjS50HxhvL5xmnuK9y7KBVqszjiCZ68qwQFsjBLA9YcJPTml+Z8PFZtW2Y4CfgOhk3PB
 t8wlNG8PgstWnqkx0ZqkrvLn+JT1aglM7J3ObaQabXOC8woUj88mAu/d0x6+VKBDwrguEqvvAsV
 R92n5nLbJfFb/wxzaiuo=
X-Google-Smtp-Source: AGHT+IEknE7Ed11x/ibgJ5QzQpkMpm252egUeMoODkBeiFxQuKrCkeotsKLzvKSZOSTQOIHwRjMeQQ==
X-Received: by 2002:a05:6a20:840b:b0:1f5:b25b:7995 with SMTP id
 adf61e73a8af0-1fbebf6618dmr5806194637.24.1742396129676; 
 Wed, 19 Mar 2025 07:55:29 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af56ea7c741sm10931259a12.52.2025.03.19.07.55.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 07:55:29 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Arnd Bergmann <arnd@arndb.de>, Jonathan Marek <jonathan@marek.ca>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Eugene Lepshy <fekz115@gmail.com>, linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 12/34] drm/msm: Use drm_gpuvm types more
Date: Wed, 19 Mar 2025 07:52:24 -0700
Message-ID: <20250319145425.51935-13-robdclark@gmail.com>
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
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       | 21 +++--
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
 drivers/gpu/drm/msm/msm_gem.c                 | 82 +++++++++----------
 drivers/gpu/drm/msm/msm_gem.h                 | 53 ++++++------
 drivers/gpu/drm/msm/msm_gem_submit.c          |  4 +-
 drivers/gpu/drm/msm/msm_gem_vma.c             | 72 +++++++---------
 drivers/gpu/drm/msm/msm_gpu.c                 | 21 +++--
 drivers/gpu/drm/msm/msm_gpu.h                 | 10 +--
 drivers/gpu/drm/msm/msm_kms.c                 |  6 +-
 drivers/gpu/drm/msm/msm_kms.h                 |  2 +-
 drivers/gpu/drm/msm/msm_submitqueue.c         |  2 +-
 27 files changed, 192 insertions(+), 202 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
index 94c49ed057cd..c4c723a0bf1a 100644
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
index cce95ad3cfb8..9dd7dea84a4a 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1786,8 +1786,10 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
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
index 259a589a827d..32711c4967f7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1259,6 +1259,8 @@ int a6xx_gmu_stop(struct a6xx_gpu *a6xx_gpu)
 
 static void a6xx_gmu_memory_free(struct a6xx_gmu *gmu)
 {
+	struct msm_mmu *mmu = to_msm_vm(gmu->vm)->mmu;
+
 	msm_gem_kernel_put(gmu->hfi.obj, gmu->vm);
 	msm_gem_kernel_put(gmu->debug.obj, gmu->vm);
 	msm_gem_kernel_put(gmu->icache.obj, gmu->vm);
@@ -1266,8 +1268,8 @@ static void a6xx_gmu_memory_free(struct a6xx_gmu *gmu)
 	msm_gem_kernel_put(gmu->dummy.obj, gmu->vm);
 	msm_gem_kernel_put(gmu->log.obj, gmu->vm);
 
-	gmu->vm->mmu->funcs->detach(gmu->vm->mmu);
-	msm_gem_vm_put(gmu->vm);
+	mmu->funcs->detach(mmu);
+	drm_gpuvm_put(gmu->vm);
 }
 
 static int a6xx_gmu_memory_alloc(struct a6xx_gmu *gmu, struct a6xx_gmu_bo *bo,
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index cceda7d9c33a..5da36226b93d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -62,7 +62,7 @@ struct a6xx_gmu {
 	/* For serializing communication with the GMU: */
 	struct mutex lock;
 
-	struct msm_gem_vm *vm;
+	struct drm_gpuvm *vm;
 
 	void __iomem *mmio;
 	void __iomem *rscc;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index a124249f7a1d..4811be5a7c29 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -120,7 +120,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 	if (ctx->seqno == ring->cur_ctx_seqno)
 		return;
 
-	if (msm_iommu_pagetable_params(ctx->vm->mmu, &ttbr, &asid))
+	if (msm_iommu_pagetable_params(to_msm_vm(ctx->vm)->mmu, &ttbr, &asid))
 		return;
 
 	if (adreno_gpu->info->family >= ADRENO_7XX_GEN1) {
@@ -2243,7 +2243,7 @@ static void a6xx_gpu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
 	mutex_unlock(&a6xx_gpu->gmu.lock);
 }
 
-static struct msm_gem_vm *
+static struct drm_gpuvm *
 a6xx_create_vm(struct msm_gpu *gpu, struct platform_device *pdev)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -2261,12 +2261,12 @@ a6xx_create_vm(struct msm_gpu *gpu, struct platform_device *pdev)
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
@@ -2546,8 +2546,10 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 
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
index 0ba1819833ab..0f71703f6ec7 100644
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
@@ -259,9 +259,10 @@ void adreno_check_and_reenable_stall(struct adreno_gpu *adreno_gpu)
 	if (!adreno_gpu->stall_enabled &&
 			ktime_after(ktime_get(), adreno_gpu->stall_reenable_time) &&
 			!READ_ONCE(gpu->crashstate)) {
+		struct msm_mmu *mmu = to_msm_vm(gpu->vm)->mmu;
 		adreno_gpu->stall_enabled = true;
 
-		gpu->vm->mmu->funcs->set_stall(gpu->vm->mmu, true);
+		mmu->funcs->set_stall(mmu, true);
 	}
 	spin_unlock_irqrestore(&adreno_gpu->fault_stall_lock, flags);
 }
@@ -275,6 +276,7 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 			 struct adreno_smmu_fault_info *info, const char *block,
 			 u32 scratch[4])
 {
+	struct msm_mmu *mmu = to_msm_vm(gpu->vm)->mmu;
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	const char *type = "UNKNOWN";
 	bool do_devcoredump = info && (info->fsr & ARM_SMMU_FSR_SS) &&
@@ -287,9 +289,10 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 	 */
 	spin_lock_irqsave(&adreno_gpu->fault_stall_lock, irq_flags);
 	if (adreno_gpu->stall_enabled) {
+
 		adreno_gpu->stall_enabled = false;
 
-		gpu->vm->mmu->funcs->set_stall(gpu->vm->mmu, false);
+		mmu->funcs->set_stall(mmu, false);
 	}
 	adreno_gpu->stall_reenable_time = ktime_add_ms(ktime_get(), 500);
 	spin_unlock_irqrestore(&adreno_gpu->fault_stall_lock, irq_flags);
@@ -299,7 +302,7 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 	 * it now.
 	 */
 	if (!do_devcoredump) {
-		gpu->vm->mmu->funcs->resume_translation(gpu->vm->mmu);
+		mmu->funcs->resume_translation(mmu);
 	}
 
 	/*
@@ -394,7 +397,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		return 0;
 	case MSM_PARAM_FAULTS:
 		if (ctx->vm)
-			*value = gpu->global_faults + ctx->vm->faults;
+			*value = gpu->global_faults + to_msm_vm(ctx->vm)->faults;
 		else
 			*value = gpu->global_faults;
 		return 0;
@@ -404,12 +407,12 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
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
index 7dbe09817edc..a76f4c62deee 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -642,11 +642,11 @@ void adreno_show_object(struct drm_printer *p, void **ptr, int len,
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
index 32e208ee946d..3b02f4d1a7a5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -566,7 +566,7 @@ static void dpu_encoder_phys_wb_prepare_wb_job(struct dpu_encoder_phys *phys_enc
 		struct drm_writeback_job *job)
 {
 	const struct msm_format *format;
-	struct msm_gem_vm *vm;
+	struct drm_gpuvm *vm;
 	struct dpu_hw_wb_cfg *wb_cfg;
 	int ret;
 	struct dpu_encoder_phys_wb *wb_enc = to_dpu_encoder_phys_wb(phys_enc);
@@ -619,7 +619,7 @@ static void dpu_encoder_phys_wb_cleanup_wb_job(struct dpu_encoder_phys *phys_enc
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
index bb5db6da636a..a9cd215cfd33 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1098,17 +1098,17 @@ static void _dpu_kms_mmu_destroy(struct dpu_kms *dpu_kms)
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
index 3578f52048a5..fbf9c1fd6cfb 100644
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
index d5b5628bee24..9326ed3aab04 100644
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
index 9dca0385a42d..b6e6bd1f95ee 100644
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
index 16335ebd21e4..2d1699b7dc93 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -143,7 +143,7 @@ struct msm_dsi_host {
 
 	/* DSI 6G TX buffer*/
 	struct drm_gem_object *tx_gem_obj;
-	struct msm_gem_vm *vm;
+	struct drm_gpuvm *vm;
 
 	/* DSI v2 TX buffer */
 	void *tx_buf;
@@ -1146,7 +1146,7 @@ int dsi_tx_buf_alloc_6g(struct msm_dsi_host *msm_host, int size)
 	uint64_t iova;
 	u8 *data;
 
-	msm_host->vm = msm_gem_vm_get(priv->kms->vm);
+	msm_host->vm = drm_gpuvm_get(priv->kms->vm);
 
 	data = msm_gem_kernel_new(dev, size, MSM_BO_WC,
 					msm_host->vm,
@@ -1194,7 +1194,7 @@ void msm_dsi_tx_buf_free(struct mipi_dsi_host *host)
 
 	if (msm_host->tx_gem_obj) {
 		msm_gem_kernel_put(msm_host->tx_gem_obj, msm_host->vm);
-		msm_gem_vm_put(msm_host->vm);
+		drm_gpuvm_put(msm_host->vm);
 		msm_host->tx_gem_obj = NULL;
 		msm_host->vm = NULL;
 	}
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index ad509403f072..b77fd2c531c3 100644
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
index 7901871c66cc..a0c15cca9245 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -71,7 +71,7 @@ static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *file)
 			      msecs_to_jiffies(1000));
 
 	msm_gem_lock(obj);
-	put_iova_spaces(obj, &ctx->vm->base, true);
+	put_iova_spaces(obj, ctx->vm, true);
 	msm_gem_unlock(obj);
 }
 
@@ -367,8 +367,8 @@ uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj)
 	return offset;
 }
 
-static struct msm_gem_vma *lookup_vma(struct drm_gem_object *obj,
-				      struct msm_gem_vm *vm)
+static struct drm_gpuva *lookup_vma(struct drm_gem_object *obj,
+				    struct drm_gpuvm *vm)
 {
 	struct drm_gpuvm_bo *vm_bo;
 
@@ -378,13 +378,13 @@ static struct msm_gem_vma *lookup_vma(struct drm_gem_object *obj,
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
@@ -414,22 +414,20 @@ put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm, bool close)
 		drm_gpuvm_bo_get(vm_bo);
 
 		drm_gpuvm_bo_for_each_va_safe (vma, vmatmp, vm_bo) {
-			struct msm_gem_vma *msm_vma = to_msm_vma(vma);
-
-			msm_gem_vma_purge(msm_vma);
+			msm_gem_vma_purge(vma);
 			if (close)
-				msm_gem_vma_close(msm_vma);
+				msm_gem_vma_close(vma);
 		}
 
 		drm_gpuvm_bo_put(vm_bo);
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
 
@@ -438,14 +436,14 @@ static struct msm_gem_vma *get_vma_locked(struct drm_gem_object *obj,
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
@@ -502,17 +500,17 @@ void msm_gem_unpin_active(struct drm_gem_object *obj)
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
@@ -523,7 +521,7 @@ static int get_and_pin_iova_range_locked(struct drm_gem_object *obj,
 
 	ret = msm_gem_pin_vma_locked(obj, vma);
 	if (!ret) {
-		*iova = vma->base.va.addr;
+		*iova = vma->va.addr;
 		pin_obj_locked(obj);
 	}
 
@@ -535,8 +533,8 @@ static int get_and_pin_iova_range_locked(struct drm_gem_object *obj,
  * limits iova to specified range (in pages)
  */
 int msm_gem_get_and_pin_iova_range(struct drm_gem_object *obj,
-		struct msm_gem_vm *vm, uint64_t *iova,
-		u64 range_start, u64 range_end)
+				   struct drm_gpuvm *vm, uint64_t *iova,
+				   u64 range_start, u64 range_end)
 {
 	int ret;
 
@@ -548,8 +546,8 @@ int msm_gem_get_and_pin_iova_range(struct drm_gem_object *obj,
 }
 
 /* get iova and pin it. Should have a matching put */
-int msm_gem_get_and_pin_iova(struct drm_gem_object *obj,
-		struct msm_gem_vm *vm, uint64_t *iova)
+int msm_gem_get_and_pin_iova(struct drm_gem_object *obj, struct drm_gpuvm *vm,
+			     uint64_t *iova)
 {
 	return msm_gem_get_and_pin_iova_range(obj, vm, iova, 0, U64_MAX);
 }
@@ -558,10 +556,10 @@ int msm_gem_get_and_pin_iova(struct drm_gem_object *obj,
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
@@ -569,7 +567,7 @@ int msm_gem_get_iova(struct drm_gem_object *obj,
 	if (IS_ERR(vma)) {
 		ret = PTR_ERR(vma);
 	} else {
-		*iova = vma->base.va.addr;
+		*iova = vma->va.addr;
 	}
 	msm_gem_unlock(obj);
 
@@ -577,9 +575,9 @@ int msm_gem_get_iova(struct drm_gem_object *obj,
 }
 
 static int clear_iova(struct drm_gem_object *obj,
-		      struct msm_gem_vm *vm)
+		      struct drm_gpuvm *vm)
 {
-	struct msm_gem_vma *vma = lookup_vma(obj, vm);
+	struct drm_gpuva *vma = lookup_vma(obj, vm);
 
 	if (!vma)
 		return 0;
@@ -598,7 +596,7 @@ static int clear_iova(struct drm_gem_object *obj,
  * Setting an iova of zero will clear the vma.
  */
 int msm_gem_set_iova(struct drm_gem_object *obj,
-		     struct msm_gem_vm *vm, uint64_t iova)
+		     struct drm_gpuvm *vm, uint64_t iova)
 {
 	int ret = 0;
 
@@ -606,11 +604,11 @@ int msm_gem_set_iova(struct drm_gem_object *obj,
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
@@ -625,10 +623,9 @@ int msm_gem_set_iova(struct drm_gem_object *obj,
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
@@ -1241,9 +1238,9 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
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
@@ -1276,8 +1273,7 @@ void *msm_gem_kernel_new(struct drm_device *dev, uint32_t size,
 
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
index e8a670566147..998cedb24941 100644
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
index 56221dfdf551..0bc22618e9f0 100644
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
@@ -220,7 +210,7 @@ msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
 
 	drm_mm_init(&vm->mm, va_start, va_size);
 
-	return vm;
+	return &vm->base;
 
 err_free_vm:
 	kfree(vm);
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 0d466a2e9b32..4d24dcf62064 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -283,7 +283,7 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 
 		if (state->fault_info.ttbr0) {
 			struct msm_gpu_fault_info *info = &state->fault_info;
-			struct msm_mmu *mmu = submit->vm->mmu;
+			struct msm_mmu *mmu = to_msm_vm(submit->vm)->mmu;
 
 			msm_iommu_pagetable_params(mmu, &info->pgtbl_ttbr0,
 						   &info->asid);
@@ -387,7 +387,7 @@ static void recover_worker(struct kthread_work *work)
 	/* Increment the fault counts */
 	submit->queue->faults++;
 	if (submit->vm)
-		submit->vm->faults++;
+		to_msm_vm(submit->vm)->faults++;
 
 	get_comm_cmdline(submit, &comm, &cmd);
 
@@ -463,6 +463,7 @@ static void fault_worker(struct kthread_work *work)
 {
 	struct msm_gpu *gpu = container_of(work, struct msm_gpu, fault_work);
 	struct msm_gem_submit *submit;
+	struct msm_mmu *mmu = to_msm_vm(gpu->vm)->mmu;
 	struct msm_ringbuffer *cur_ring = gpu->funcs->active_ring(gpu);
 	char *comm = NULL, *cmd = NULL;
 
@@ -492,7 +493,7 @@ static void fault_worker(struct kthread_work *work)
 
 resume_smmu:
 	memset(&gpu->fault_info, 0, sizeof(gpu->fault_info));
-	gpu->vm->mmu->funcs->resume_translation(gpu->vm->mmu);
+	mmu->funcs->resume_translation(mmu);
 
 	mutex_unlock(&gpu->lock);
 }
@@ -829,10 +830,11 @@ static int get_clocks(struct platform_device *pdev, struct msm_gpu *gpu)
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
 
@@ -843,11 +845,11 @@ msm_gpu_create_private_vm(struct msm_gpu *gpu, struct task_struct *task)
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
@@ -1020,8 +1022,9 @@ void msm_gpu_cleanup(struct msm_gpu *gpu)
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
index 1f26ba00f773..d8425e6d7f5a 100644
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
@@ -234,7 +234,7 @@ struct msm_gpu {
 	void __iomem *mmio;
 	int irq;
 
-	struct msm_gem_vm *vm;
+	struct drm_gpuvm *vm;
 
 	/* Power Control: */
 	struct regulator *gpu_reg, *gpu_cx;
@@ -363,7 +363,7 @@ struct msm_context {
 	int queueid;
 
 	/** @vm: the per-process GPU address-space */
-	struct msm_gem_vm *vm;
+	struct drm_gpuvm *vm;
 
 	/** @kref: the reference count */
 	struct kref ref;
@@ -673,7 +673,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		struct msm_gpu *gpu, const struct msm_gpu_funcs *funcs,
 		const char *name, struct msm_gpu_config *config);
 
-struct msm_gem_vm *
+struct drm_gpuvm *
 msm_gpu_create_private_vm(struct msm_gpu *gpu, struct task_struct *task);
 
 void msm_gpu_cleanup(struct msm_gpu *gpu);
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 6458bd82a0cd..e82b8569a468 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -176,9 +176,9 @@ static int msm_kms_fault_handler(void *arg, unsigned long iova, int flags, void
 	return -ENOSYS;
 }
 
-struct msm_gem_vm *msm_kms_init_vm(struct drm_device *dev)
+struct drm_gpuvm *msm_kms_init_vm(struct drm_device *dev)
 {
-	struct msm_gem_vm *vm;
+	struct drm_gpuvm *vm;
 	struct msm_mmu *mmu;
 	struct device *mdp_dev = dev->dev;
 	struct device *mdss_dev = mdp_dev->parent;
@@ -212,7 +212,7 @@ struct msm_gem_vm *msm_kms_init_vm(struct drm_device *dev)
 		return vm;
 	}
 
-	msm_mmu_set_fault_handler(vm->mmu, kms, msm_kms_fault_handler);
+	msm_mmu_set_fault_handler(to_msm_vm(vm)->mmu, kms, msm_kms_fault_handler);
 
 	return vm;
 }
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index f45996a03e15..7cdb2eb67700 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -139,7 +139,7 @@ struct msm_kms {
 	atomic_t fault_snapshot_capture;
 
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
2.48.1

