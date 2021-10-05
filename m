Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96292422C0B
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 17:12:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6F816E429;
	Tue,  5 Oct 2021 15:12:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF01D6F5DE;
 Tue,  5 Oct 2021 15:12:07 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id y5so2536300pll.3;
 Tue, 05 Oct 2021 08:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U5xnEbhfhj61beE3+fA67pEiROAPJXxy08V2QR5u2+Q=;
 b=i2UkZprCgUbxgED+mE9NNYlCrsOyFziGRNBYfDlIkee5aZlyUOAzVHjHeKsIKJ3bEL
 Io+MEfw2L6035YBZam/xnZ9C9xPAtOP4rwJks3eS5Y550WNr2rRPCxyI8tPFA5ByfAS5
 sUTzLncoYGG4teG7SZiHt2+cjDhys8pI7AO/A2BxZqqUHCKYww14j+kC0umGH3nPxAvX
 ZZ0O0bjrZrAkaBzGU3ieFywKdzm04hlp7t9t1AYZLUQhqvKB8xL0R/CofaqaENwVEA4w
 jxLVcwSP7el4twryc9ZIbr9W5GEcjsk18PHehx0Ytp2vWvVSPFB5kkvVv54EAuYBVz1+
 cGlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U5xnEbhfhj61beE3+fA67pEiROAPJXxy08V2QR5u2+Q=;
 b=cdpf+8Pnvzlkgm/t/UpSlsdop5VbVE8P4HSs+CVYpf8ixhpsDpdhAQW9+ZeB+zjj2a
 roK27W+bMpbGzjE1oF61MIiF/eoPbA4DS20MDQbUmOI9YFqZ5RwW6MhcWKZUTTIyKbKk
 yW1s4FbSLqWye5Ttvm3tDmBdENf54FS9r61Iqug+phnyxARni1HgcfzHiQAsQA+J8Wqo
 4SF1rwqIKDDHOIw1gyIG6XZHHcN6n62RZnLCP3yxd81fDGdfDp2HIiHRZkIfwLGzMiCl
 RJldVVsjbp7bVyzHoVqb9kke3CgAAeqreKudfqE7hmntmNRg8PWh4ENcZMK9OR0IZm94
 5l2A==
X-Gm-Message-State: AOAM53283rz1euCWzfv+q7luVKbrm/I1tSinllbNbk22TjZBKI7gnt35
 G/2mM0l+Y7HsZC1uMC1Dnczqz1KFISM=
X-Google-Smtp-Source: ABdhPJysc5AIcVDOyoSIyIXBuk8VJrPrZ2y4PLlsoKfQxxwLyv+cdhwrCz9VK6Juinqd1t9fPoW73A==
X-Received: by 2002:a17:902:ab93:b0:13d:e3b5:7ec2 with SMTP id
 f19-20020a170902ab9300b0013de3b57ec2mr5698488plr.26.1633446726696; 
 Tue, 05 Oct 2021 08:12:06 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 m22sm18666113pfo.176.2021.10.05.08.12.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 08:12:05 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Yangtao Li <tiny.windzz@gmail.com>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 3/3] drm/msm: Extend gpu devcore dumps with pgtbl info
Date: Tue,  5 Oct 2021 08:16:27 -0700
Message-Id: <20211005151633.1738878-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211005151633.1738878-1-robdclark@gmail.com>
References: <20211005151633.1738878-1-robdclark@gmail.com>
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
v2: Fix build error on 32b/armv7

 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 10 ++++++++++
 drivers/gpu/drm/msm/msm_gpu.c           | 10 ++++++++++
 drivers/gpu/drm/msm/msm_gpu.h           |  8 ++++++++
 drivers/gpu/drm/msm/msm_iommu.c         | 17 +++++++++++++++++
 drivers/gpu/drm/msm/msm_mmu.h           |  2 ++
 5 files changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 42e522a60623..7bac86b01f30 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -707,6 +707,16 @@ void adreno_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
 		drm_printf(p, "  - dir: %s\n", info->flags & IOMMU_FAULT_WRITE ? "WRITE" : "READ");
 		drm_printf(p, "  - type: %s\n", info->type);
 		drm_printf(p, "  - source: %s\n", info->block);
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
index 8a3a592da3a4..d1a16642ecd5 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -284,6 +284,16 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 	if (submit) {
 		int i, nr = 0;
 
+		if (state->fault_info.smmu_info.ttbr0) {
+			struct msm_gpu_fault_info *info = &state->fault_info;
+			struct msm_mmu *mmu = submit->aspace->mmu;
+
+			msm_iommu_pagetable_params(mmu, &info->pgtbl_ttbr0,
+						   &info->asid);
+			msm_iommu_pagetable_walk(mmu, info->iova, info->ptes,
+						 ARRAY_SIZE(info->ptes));
+		}
+
 		/* count # of buffers to dump: */
 		for (i = 0; i < submit->nr_bos; i++)
 			if (should_dump(submit, i))
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 0e132795123f..ab4c80065ac5 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -78,6 +78,14 @@ struct msm_gpu_fault_info {
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
index bcaddbba564d..0f2924fd2524 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -116,6 +116,23 @@ int msm_iommu_pagetable_params(struct msm_mmu *mmu,
 	return 0;
 }
 
+int msm_iommu_pagetable_walk(struct msm_mmu *mmu, unsigned long iova,
+			     u64 *ptes, int num_ptes)
+{
+	struct msm_iommu_pagetable *pagetable;
+
+	if (mmu->type != MSM_MMU_IOMMU_PAGETABLE)
+		return -EINVAL;
+
+	pagetable = to_pagetable(mmu);
+
+	if (!pagetable->pgtbl_ops->pgtable_walk)
+		return -EINVAL;
+
+	return pagetable->pgtbl_ops->pgtable_walk(pagetable->pgtbl_ops, iova,
+						  ptes, &num_ptes);
+}
+
 static const struct msm_mmu_funcs pagetable_funcs = {
 		.map = msm_iommu_pagetable_map,
 		.unmap = msm_iommu_pagetable_unmap,
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index de158e1bf765..519b749c61af 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -58,5 +58,7 @@ void msm_gpummu_params(struct msm_mmu *mmu, dma_addr_t *pt_base,
 
 int msm_iommu_pagetable_params(struct msm_mmu *mmu, phys_addr_t *ttbr,
 		int *asid);
+int msm_iommu_pagetable_walk(struct msm_mmu *mmu, unsigned long iova,
+			     u64 *ptes, int num_ptes);
 
 #endif /* __MSM_MMU_H__ */
-- 
2.31.1

