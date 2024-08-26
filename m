Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC6995F7C8
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 19:16:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C22510E276;
	Mon, 26 Aug 2024 17:16:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FVP7+1D9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A90B910E275;
 Mon, 26 Aug 2024 17:16:06 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-20231aa8908so35454615ad.0; 
 Mon, 26 Aug 2024 10:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724692566; x=1725297366; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cgk9ZwZd91vOVt90fIiETgBR9DeXKbUMnWSmPau0W5M=;
 b=FVP7+1D9SvRG0zCbY4cXj8X/LY5IGFAMLThAD0U6Y02ryQS8i3J9M5t5zpcKyOUP/r
 QeuwNfcdpsKnE1UE7+MAQ8bfOkZJr+LnBKYEnu8NTbcBdLtaEhSSxXwbhRV7pIOeHo/b
 8ZIlkiQRc+WcN++XirwARaT+u/hka+07WA/5K7nrYfblpaBiT5I3VqYLMk56gsnbF1Sk
 HX6h1MgfPZGzO9TcdedbwGSgFYFHRWUyJkJ1ND9DpcR0viCgEXGAs+l9moY63cbRU/vW
 u4gyNeB10rRK+DGQGroY3w/BCfIH3OYfShFXBP9bpRCoPoPWmeA71xUUEggDcBgfud2P
 W5Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724692566; x=1725297366;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cgk9ZwZd91vOVt90fIiETgBR9DeXKbUMnWSmPau0W5M=;
 b=CTpMQ/vyJWbi8pub8wGEabiFwUxsas2DX09Dbo0TuZDmhDKwSbXKj/fxhRf8oe6Jmc
 yZKXzLbOlPsAcSJw4ZO69W9pQPRyj4AaFpJSh9C5KByXn5YdZPaD/FxHYjpQbRF3tlL/
 cO/yBcjMksw1SbH2OM1RrEbDORIPfN3jpJXoYU3XAbdClDRurJQZFE3ZxaICWtZaXPmN
 ebTp4amGgAK/6tr1it9A4iI7B8Eyt/F6Mo+FRL7aKZrai+O6Ef3APEJ7SqC5I2Z+2kw5
 jI767hgWK2SGHdjLhWE4XExSJlL1Cpp/0sOlEKY+iPYIquT/DYDVBfUK5VFoaTmc91Yq
 d8nA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFTtCfDQlo7xXi5buqaPGNJ3ZzK/j/g2sCHk/nl8cwIbJPcqYZoJl9Cs7GgTW7u07Qc9h3Xzobj0me@lists.freedesktop.org,
 AJvYcCX5nwd4+J//t8rUQ5BlOIOtjHnq50ZEHsNbJ8FLKfVeCuyCSGLDzqByI7CEPttYeAVeZsuV6z2FQLE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxLD9u16CyiKKeD/BsgN1RBy8t24+6qdRp7PgKQDOn0nynkr0i
 8yp5OtTaY65h5kw3B2UmhwMSN/zZ3XtFbisZOKdi+GsK8NwhFgDm
X-Google-Smtp-Source: AGHT+IHGL1MOQ7nhSehnfvO75y0Ls4GPWtSRbqyg7KY7kq6ZyQvUf9DWVxti63QNaWSL53DiyLEF1A==
X-Received: by 2002:a17:903:186:b0:202:244e:a0cc with SMTP id
 d9443c01a7336-204df4d3543mr2327305ad.45.1724692565761; 
 Mon, 26 Aug 2024 10:16:05 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-203855dbd96sm69825935ad.175.2024.08.26.10.16.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2024 10:16:05 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org (open list:DRM DRIVER for Qualcomm Adreno GPUs), 
 dri-devel@lists.freedesktop.org (open list:DRM DRIVER for Qualcomm Adreno
 GPUs), 
 freedreno@lists.freedesktop.org (open list:DRM DRIVER for Qualcomm Adreno
 GPUs), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 4/4] drm/msm: Extend gpu devcore dumps with pgtbl info
Date: Mon, 26 Aug 2024 10:15:41 -0700
Message-ID: <20240826171546.6777-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240826171546.6777-1-robdclark@gmail.com>
References: <20240826171546.6777-1-robdclark@gmail.com>
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

In the case of iova fault triggered devcore dumps, include additional
debug information based on what we think is the current page tables,
including the TTBR0 value (which should match what we have in
adreno_smmu_fault_info unless things have gone horribly wrong), and
the pagetable entries traversed in the process of resolving the
faulting iova.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 10 ++++++++++
 drivers/gpu/drm/msm/msm_gpu.c           |  9 +++++++++
 drivers/gpu/drm/msm/msm_gpu.h           |  8 ++++++++
 drivers/gpu/drm/msm/msm_iommu.c         | 22 ++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_mmu.h           |  3 ++-
 5 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 1c6626747b98..3848b5a64351 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -864,6 +864,16 @@ void adreno_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
 		drm_printf(p, "  - dir=%s\n", info->flags & IOMMU_FAULT_WRITE ? "WRITE" : "READ");
 		drm_printf(p, "  - type=%s\n", info->type);
 		drm_printf(p, "  - source=%s\n", info->block);
+
+		/* Information extracted from what we think are the current
+		 * pgtables.  Hopefully the TTBR0 matches what we've extracted
+		 * from the SMMU registers in smmu_info!
+		 */
+		drm_puts(p, "pgtable-fault-info:\n");
+		drm_printf(p, "  - ttbr0: %.16llx\n", (u64)info->pgtbl_ttbr0);
+		drm_printf(p, "  - asid: %d\n", info->asid);
+		drm_printf(p, "  - ptes: %.16llx %.16llx %.16llx %.16llx\n",
+			   info->ptes[0], info->ptes[1], info->ptes[2], info->ptes[3]);
 	}
 
 	drm_printf(p, "rbbm-status: 0x%08x\n", state->rbbm_status);
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 3666b42b4ecd..bf2f8b2a7ccc 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -281,6 +281,15 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 	if (submit) {
 		int i;
 
+		if (state->fault_info.ttbr0) {
+			struct msm_gpu_fault_info *info = &state->fault_info;
+			struct msm_mmu *mmu = submit->aspace->mmu;
+
+			msm_iommu_pagetable_params(mmu, &info->pgtbl_ttbr0,
+						   &info->asid);
+			msm_iommu_pagetable_walk(mmu, info->iova, info->ptes);
+		}
+
 		state->bos = kcalloc(submit->nr_bos,
 			sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 1f02bb9956be..82e838ba8c80 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -101,6 +101,14 @@ struct msm_gpu_fault_info {
 	int flags;
 	const char *type;
 	const char *block;
+
+	/* Information about what we think/expect is the current SMMU state,
+	 * for example expected_ttbr0 should match smmu_info.ttbr0 which
+	 * was read back from SMMU registers.
+	 */
+	phys_addr_t pgtbl_ttbr0;
+	u64 ptes[4];
+	int asid;
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 2a94e82316f9..3e692818ba1f 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -195,6 +195,28 @@ struct iommu_domain_geometry *msm_iommu_get_geometry(struct msm_mmu *mmu)
 	return &iommu->domain->geometry;
 }
 
+int
+msm_iommu_pagetable_walk(struct msm_mmu *mmu, unsigned long iova, uint64_t ptes[4])
+{
+	struct msm_iommu_pagetable *pagetable;
+	struct arm_lpae_io_pgtable_walk_data wd = {};
+
+	if (mmu->type != MSM_MMU_IOMMU_PAGETABLE)
+		return -EINVAL;
+
+	pagetable = to_pagetable(mmu);
+
+	if (!pagetable->pgtbl_ops->pgtable_walk)
+		return -EINVAL;
+
+	pagetable->pgtbl_ops->pgtable_walk(pagetable->pgtbl_ops, iova, &wd);
+
+	for (int i = 0; i < ARRAY_SIZE(wd.ptes); i++)
+		ptes[i] = wd.ptes[i];
+
+	return 0;
+}
+
 static const struct msm_mmu_funcs pagetable_funcs = {
 		.map = msm_iommu_pagetable_map,
 		.unmap = msm_iommu_pagetable_unmap,
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index 88af4f490881..96e509bd96a6 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -53,7 +53,8 @@ static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
 struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent);
 
 int msm_iommu_pagetable_params(struct msm_mmu *mmu, phys_addr_t *ttbr,
-		int *asid);
+			       int *asid);
+int msm_iommu_pagetable_walk(struct msm_mmu *mmu, unsigned long iova, uint64_t ptes[4]);
 struct iommu_domain_geometry *msm_iommu_get_geometry(struct msm_mmu *mmu);
 
 #endif /* __MSM_MMU_H__ */
-- 
2.46.0

