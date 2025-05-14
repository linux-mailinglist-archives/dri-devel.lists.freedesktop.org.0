Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA392AB73A8
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 19:57:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEA7810E6FE;
	Wed, 14 May 2025 17:57:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="he2Cokzu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5819D10E6F9;
 Wed, 14 May 2025 17:57:20 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-22e09f57ed4so13899675ad.0; 
 Wed, 14 May 2025 10:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747245439; x=1747850239; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1j2RUJnwVC+vYKJSWO/0XWvYj35FTt1kwRlO+Xy2fTs=;
 b=he2CokzuNXJFPK6K8eHqA88+WFbiCt1sdZpK2NWUizt1Nve1lpyAyEOsEOYOarZtm2
 qvlinD24L9el9StcdglC6d8PqUG069sVWWOMZ3aREb4+G9GBfM4vdG2jXgvicpYnYQHF
 REyPzzBf9nZBEY014YIeH1CsKrbI/7o3bGUtMHEDKg8vBVcuE3rUw408zWT6PWpqJIKO
 C/cBg9iWB+ZaHzdQIe80fJRQlZEDqKAJeCHXQBkKe4YHKHYVNwlpDhODbwLjdCMFVkV+
 XjiDxCov4B39e7wJZxpM3RaCn3Hz+1V0oOq4ht2Pe6R4Y7mFWej3pbvU2SKOkIh5bJ1X
 KfHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747245439; x=1747850239;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1j2RUJnwVC+vYKJSWO/0XWvYj35FTt1kwRlO+Xy2fTs=;
 b=Fw37TRh/jmckXLtE+ETCrjeswQLataibIwcU0FoK6I1rkOc9UJwW13SFyXTBJra+J1
 FBE3mmdL+joIcb+WbiusmgppqeqMjgXFZBl8L995mS67R+Xi7xrIk6OV3qyhhFChrQyj
 Lb/8Hu8g7mPjg9sfTBLaWA8249PGQxQGrmzGwImdkONh0acXWu+/KVxQmK3sZAwANEl9
 na8al3D6bO4tZLTw8sWwo5edO3PdbbwtpH55zl7Hk/BI7icqr7X9OGiWTrNDpPDFusy1
 ibEVIwdyp651WxzEbGBODHW+6N130/FjywwmPToO+JGwGvqH9+ESoaHPpsMZcmLMPlIj
 FekA==
X-Gm-Message-State: AOJu0YxPNzRZV1sYxwLmMN/gX91gShNI213exd1IvAGWkWSNbpa4830C
 D8IYgn8GGeePyF+gCOBJK1SFtlOUdOtkY8Kh5LZKLbZGLT7AlLgpmooLl/2j2A==
X-Gm-Gg: ASbGncsd2IRjnwPRkiHhquLJb6SRatz4YJAxc1nNN6pY4kzbibKEHDkjmXsi1Up4Shg
 Ip3x4aykSjgyA0yUD+9J9BbFZCosngbVU37oKd9O7xTIa/eUNoGXh+8Mj998+zHJlEakYf+hRTp
 6WskE3hYmMMK/LcbDoIut4eNLOGn77Zr/Fx+UJA5e74BCoDObnu/5Cl9luE88yg6PqdD3Ylw9bb
 x1YhdL1r8Qc/eB4mK+Xie9WwlfA+zsC3i3ORDhWBgmct2dYZXb3P60Pguta458Udfw/KuNflYE3
 64iC9aNn5fzT1Y6Xqx2Ddh+H7lImNepLl/XhpptVmG1h0S7kf3aT0Tmc427vGffgtQ33ml+FJHw
 AGRXsld0FGsNqixlBJZf2neBKhQ==
X-Google-Smtp-Source: AGHT+IHsVOmJRx1klnJ2yuJyGk5wMMPErRkcbpwyGTeWCsRdRX6j56CPPLWf/paTis7dcMd3JihKMw==
X-Received: by 2002:a17:903:2451:b0:22e:5a9c:2853 with SMTP id
 d9443c01a7336-231b3979697mr6528095ad.12.1747245439376; 
 Wed, 14 May 2025 10:57:19 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22fc82a16afsm102236435ad.225.2025.05.14.10.57.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 10:57:18 -0700 (PDT)
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
Subject: [PATCH v4 32/40] drm/msm: Support IO_PGTABLE_QUIRK_NO_WARN_ON
Date: Wed, 14 May 2025 10:53:46 -0700
Message-ID: <20250514175527.42488-33-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514175527.42488-1-robdclark@gmail.com>
References: <20250514175527.42488-1-robdclark@gmail.com>
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

With user managed VMs and multiple queues, it is in theory possible to
trigger map/unmap errors.  These will (in a later patch) mark the VM as
unusable.  But we want to tell the io-pgtable helpers not to spam the
log.  In addition, in the unmap path, we don't want to bail early from
the unmap, to ensure we don't leave some dangling pages mapped.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  2 +-
 drivers/gpu/drm/msm/msm_iommu.c       | 23 ++++++++++++++++++-----
 drivers/gpu/drm/msm/msm_mmu.h         |  2 +-
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index b7936b83660f..f4d3210bb8ab 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2267,7 +2267,7 @@ a6xx_create_private_vm(struct msm_gpu *gpu, bool kernel_managed)
 {
 	struct msm_mmu *mmu;
 
-	mmu = msm_iommu_pagetable_create(to_msm_vm(gpu->vm)->mmu);
+	mmu = msm_iommu_pagetable_create(to_msm_vm(gpu->vm)->mmu, kernel_managed);
 
 	if (IS_ERR(mmu))
 		return ERR_CAST(mmu);
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 756bd55ee94f..237d298d0eeb 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -94,15 +94,24 @@ static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
 {
 	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
 	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
+	int ret = 0;
 
 	while (size) {
-		size_t unmapped, pgsize, count;
+		size_t pgsize, count;
+		ssize_t unmapped;
 
 		pgsize = calc_pgsize(pagetable, iova, iova, size, &count);
 
 		unmapped = ops->unmap_pages(ops, iova, pgsize, count, NULL);
-		if (!unmapped)
-			break;
+		if (unmapped <= 0) {
+			ret = -EINVAL;
+			/*
+			 * Continue attempting to unamp the remained of the
+			 * range, so we don't end up with some dangling
+			 * mapped pages
+			 */
+			unmapped = PAGE_SIZE;
+		}
 
 		iova += unmapped;
 		size -= unmapped;
@@ -110,7 +119,7 @@ static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
 
 	iommu_flush_iotlb_all(to_msm_iommu(pagetable->parent)->domain);
 
-	return (size == 0) ? 0 : -EINVAL;
+	return ret;
 }
 
 static int msm_iommu_pagetable_map_prr(struct msm_mmu *mmu, u64 iova, size_t len, int prot)
@@ -324,7 +333,7 @@ static const struct iommu_flush_ops tlb_ops = {
 static int msm_gpu_fault_handler(struct iommu_domain *domain, struct device *dev,
 		unsigned long iova, int flags, void *arg);
 
-struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
+struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent, bool kernel_managed)
 {
 	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(parent->dev);
 	struct msm_iommu *iommu = to_msm_iommu(parent);
@@ -358,6 +367,10 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
 	ttbr0_cfg.quirks &= ~IO_PGTABLE_QUIRK_ARM_TTBR1;
 	ttbr0_cfg.tlb = &tlb_ops;
 
+	if (!kernel_managed) {
+		ttbr0_cfg.quirks |= IO_PGTABLE_QUIRK_NO_WARN_ON;
+	}
+
 	pagetable->pgtbl_ops = alloc_io_pgtable_ops(ARM_64_LPAE_S1,
 		&ttbr0_cfg, pagetable);
 
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index c874852b7331..c70c71fb1a4a 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -52,7 +52,7 @@ static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
 	mmu->handler = handler;
 }
 
-struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent);
+struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent, bool kernel_managed);
 
 int msm_iommu_pagetable_params(struct msm_mmu *mmu, phys_addr_t *ttbr,
 			       int *asid);
-- 
2.49.0

