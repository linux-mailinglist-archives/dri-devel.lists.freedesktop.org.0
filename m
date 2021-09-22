Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39ED4415368
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 00:26:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A9D36E06D;
	Wed, 22 Sep 2021 22:26:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A1766E067;
 Wed, 22 Sep 2021 22:26:16 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id 145so3913420pfz.11;
 Wed, 22 Sep 2021 15:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QdsNozFfegJc7Gw4XXISRW8X5y2CYMI+i3aZCCS/gQY=;
 b=ZoKYLvyQC33eO/6kLkZGMKiALQ7GGH66UD73dQamCUqJsHNxiOF3ykc/lW97FbW86w
 7uIzwyhqluSjrW1gNBSZ2IDhtnGUYOAAsLklJHNt0nJm33XnzvDM9gEurk3Y7tRdupdK
 tJPDQ6EEyxy/v7eiM6OB3gXS5MgYqMnCwaFytRNvGNk3VJdZncaobmSbqNtQZJINjZMz
 f5gKPsQpQIw0gmhENXs2hmbnTTyK0IxOR2I8I5eQnwcolpCaFNARde6c3dUzMpgGymaK
 MHvno+iMwGZ6UqWbolqtGeVSo5a3AXBKXJXQ8s0tc38axIWKlXcBS7yxgBJX/F2DtfrW
 knlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QdsNozFfegJc7Gw4XXISRW8X5y2CYMI+i3aZCCS/gQY=;
 b=grr+16QOR2WlfZ8DEyEJu5suc6Ez/Jjpsp82OVLS9B8kY/NzpiEccjg8uLciYSfB4b
 84w94LaDiI80Oli9hIO3JiBsI5bFbzbCK00uBsXbG60SMGNZNBPj0EbCqIGvZhJ266EA
 KOyQ3jA+vVl4EI6sYrdGYwhljCQJdEMCJqpbW2RfaHEwaUK4DEKhS3b9NjOrv3bnxgqE
 PxKdL8a1SFzKHHO+QAI4eYwvC7heECFvzKArRMt1yJy2w2BRPqPcLFli6qKpJ3bkN2u2
 Gu4D77rEYjKT1OTBBNM/mrKRnJCwszs3ft7n4mnWu6a1BsXG/t7A+Ebqns6VkaNevECI
 l8lQ==
X-Gm-Message-State: AOAM532sTLfake6VKPZ1BuOjNlMZw/Phs97szBSUYXbva+zplnQIgg1p
 bNVURiXjSRIJKYD7PAYyDAqDN9fcp4M=
X-Google-Smtp-Source: ABdhPJxhEHAewZtpf9dSvferK3LRHBXQTw9MVPqJtfp5LzKXGatDUflPZ5mdhDMSL/y0y91JjxxUrQ==
X-Received: by 2002:aa7:96b5:0:b0:447:96bd:e467 with SMTP id
 g21-20020aa796b5000000b0044796bde467mr983184pfk.41.1632349574864; 
 Wed, 22 Sep 2021 15:26:14 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 p4sm3679254pgc.15.2021.09.22.15.26.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 15:26:14 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jonathan Marek <jonathan@marek.ca>, Dave Airlie <airlied@redhat.com>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/3] drm/msm: Extend gpu devcore dumps with pgtbl info
Date: Wed, 22 Sep 2021 15:30:23 -0700
Message-Id: <20210922223029.495772-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210922223029.495772-1-robdclark@gmail.com>
References: <20210922223029.495772-1-robdclark@gmail.com>
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
 drivers/gpu/drm/msm/msm_gpu.c           | 10 ++++++++++
 drivers/gpu/drm/msm/msm_gpu.h           |  8 ++++++++
 drivers/gpu/drm/msm/msm_iommu.c         | 17 +++++++++++++++++
 drivers/gpu/drm/msm/msm_mmu.h           |  2 ++
 5 files changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 42e522a60623..d3718982be77 100644
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
+		drm_printf(p, "  - ttbr0: %.16llx\n", info->pgtbl_ttbr0);
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
index a7a5a53536a8..32a859307e81 100644
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
+	u64 pgtbl_ttbr0;
+	u64 ptes[4];
+	int asid;
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index eed2a762e9dd..1bd985b56e35 100644
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

