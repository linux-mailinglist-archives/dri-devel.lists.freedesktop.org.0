Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BB9AE8D83
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 20:59:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C86210E7EF;
	Wed, 25 Jun 2025 18:59:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GyqZn3Ah";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D098310E7E9
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:13 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PGEPtO015531
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=/oopH5gDR7c
 AO8FzYui8Gj2RGY+GaRhFrU3dbHaafIQ=; b=GyqZn3Ah4Eyb1K33C7BUKXpTbfE
 lpjMl0j0xTRqzWViPqsieAUgKlh1HqgeDJrhCPHf9reWB+WNCrWZRnX8jbYldDv3
 MC3+2wNws95wfa3MdLWXzk0D4x+J9wT7r+1GxFs6nIPWSjp9DNnU4mFQ+BTxnl6c
 rwzx9yaOyBd628iRtvBKK8wqIxncx49oVo8aPixyaJvAjw9DeFpVaINYYoDkssqK
 1quoU8Xxpoj+gUj126pAyVmRsznsLaUhaiFeIqyicE+Z271MAEQzmn6Vvbsdemt5
 5mxuqG6BeCs2iioiXpZ/CqCRYOCIm7Utodv0GC1CpcvFfUDBP/zhHJZ0SSg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec26b69a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:13 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b34abbcdcf3so92748a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 11:59:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750877952; x=1751482752;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/oopH5gDR7cAO8FzYui8Gj2RGY+GaRhFrU3dbHaafIQ=;
 b=WK7ZObUVGiI9v28ZO4Gp89A+ZXDoVUhXUQhPLLp5SrqkkONx5PAeh3gUDTmYJk4giG
 r0IgowgfsmV8Qu7peEUC9bhnw1ZzS0c2+x4CVMHpUzCk6Sme6j18p28x/j3xyZkGB2Lm
 Coi1MHQmS3N9zzuxuUAC2uQBjJ8FAUtrprkVCK6sXZg8g1YzbWdK7p5AhdAGqbN+gnJd
 fdMymThgDFXHf/IdCA7yLCWr8J6e8xibpQibIQMHwCoy/TUXIfq6mLWgSZTnDsY3ZHTf
 byQzGtTdmMIyNfL4NvnumHs3LtabD89oWtso7QnpyxcP/21evAnK3wpWmTW/oWbAKbEk
 jL5g==
X-Gm-Message-State: AOJu0Yy0N9qDhhxN3Q1XnO3q+ZJAhSQXIs2eYMUbQEt+wUiDsdmns6hx
 88tURsR0ees2pnIPonYAzUnXez2LF4pnQGS+OlQP+E9pcKqbarxx28tkpU6pei+SfADRdVRR/JF
 U5hNLWdTKToxMdl2wQCfD6AeO1HsVfKeUSkpFmtprCpAiMSz42L9ZwKWOb9B3z4sUnIPJk2ghZx
 aijbM=
X-Gm-Gg: ASbGncsiaAYoh+Gq+8mqOf3rbtD+g46PyM5WKIeVsP8nUj0LoQDHHOClBCcWjLZDyTF
 4Dc76FP5eSaVxTfWQR/auF6xvbR8i5NVRyWO+wbmMXR758s+8xX2tShC1IH0oDaqHaA+wmJeWU0
 qTIlpc6RE9U4/7i+PkocM5yjUr9iGNaE94mPEUbmvp7C2ZmQD6pKgiO12NL9LsR4CRgheE+ZFLv
 uITySfexY0nQKrO1cKkqvBrc4U3I9xy9VWnupqgn9k9l39nxHu99FTOkOYau/kzfoeEDFZu9hZE
 2WxFP8jTiBQ+01SPSExOJHGQFtFnVZlC
X-Received: by 2002:a05:6a20:93a1:b0:21d:85c:2906 with SMTP id
 adf61e73a8af0-2208c0f86famr1158131637.13.1750877951996; 
 Wed, 25 Jun 2025 11:59:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWIdPg+envjhgu3e9+Irxral3EyOd30mUU3HTCbj+pgsTzao4HrOoniYO2KTzay3GBl6mVLQ==
X-Received: by 2002:a05:6a20:93a1:b0:21d:85c:2906 with SMTP id
 adf61e73a8af0-2208c0f86famr1158098637.13.1750877951514; 
 Wed, 25 Jun 2025 11:59:11 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-749c882cd82sm4868690b3a.86.2025.06.25.11.59.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 11:59:11 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 33/42] drm/msm: Support pgtable preallocation
Date: Wed, 25 Jun 2025 11:47:26 -0700
Message-ID: <20250625184918.124608-34-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX8VD/5VOTdRUX
 wXYX/mi/o80nQ60ThiWpEly6uINtDujY0rn1c54eImL7QTZOOjAfvsYhzgfZqrvIl5nHnnUs1nS
 5X2LPRjbHhuScrWYe9U20qeltASFrHc1Na2uKVZsdNc0EaXQ0mG8ucDv8kJUfBASgp0syjf3kxx
 w2PC2EXnpJAzYaxvoo6Db58zlSAG0oEb+RxCAazqGNaiR0z1A8dzqgkW7/0gcBPWP5X6QANP205
 gsgWf0fnJcQsQvqqo6UTrP4A804u9f4IA7Dc/f7vqSyNvFxZEilcnxRXhvNCSDCfF6KGLR2jNAt
 YPkhDxZ3ZmrKHs6395ZoEYevm3UTuNuEpq2DNNSegeY0LNXdAErxJMGBnefi5ZW4yIhHq3nbmPG
 IGL2wDHDIoae4nlti6nTW0M/ZpeksDZc+hFoYyJpTFGGI8XAykfcgr3jhSNkHO6r4YYTR+SI
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685c4701 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=7CQSdrXTAAAA:8 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=FDPAursefL7ktZtO0vwA:9
 a=bFCP_H2QrGi7Okbo017w:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: GtJINKCLfkOVF1jsgnA2ZWJOm4H73df3
X-Proofpoint-ORIG-GUID: GtJINKCLfkOVF1jsgnA2ZWJOm4H73df3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250143
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

Introduce a mechanism to count the worst case # of pages required in a
VM_BIND op.

Note that previously we would have had to somehow account for
allocations in unmap, when splitting a block.  This behavior was removed
in commit 33729a5fc0ca ("iommu/io-pgtable-arm: Remove split on unmap
behavior)"

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.h   |   1 +
 drivers/gpu/drm/msm/msm_iommu.c | 191 +++++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/msm_mmu.h   |  34 ++++++
 3 files changed, 225 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 945a235d73cf..46c7ddbc2dce 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -7,6 +7,7 @@
 #ifndef __MSM_GEM_H__
 #define __MSM_GEM_H__
 
+#include "msm_mmu.h"
 #include <linux/kref.h>
 #include <linux/dma-resv.h>
 #include "drm/drm_exec.h"
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 1c068592f9e9..bfee3e0dcb23 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -6,6 +6,7 @@
 
 #include <linux/adreno-smmu-priv.h>
 #include <linux/io-pgtable.h>
+#include <linux/kmemleak.h>
 #include "msm_drv.h"
 #include "msm_mmu.h"
 
@@ -14,6 +15,8 @@ struct msm_iommu {
 	struct iommu_domain *domain;
 	atomic_t pagetables;
 	struct page *prr_page;
+
+	struct kmem_cache *pt_cache;
 };
 
 #define to_msm_iommu(x) container_of(x, struct msm_iommu, base)
@@ -27,6 +30,9 @@ struct msm_iommu_pagetable {
 	unsigned long pgsize_bitmap;	/* Bitmap of page sizes in use */
 	phys_addr_t ttbr;
 	u32 asid;
+
+	/** @root_page_table: Stores the root page table pointer. */
+	void *root_page_table;
 };
 static struct msm_iommu_pagetable *to_pagetable(struct msm_mmu *mmu)
 {
@@ -282,7 +288,145 @@ msm_iommu_pagetable_walk(struct msm_mmu *mmu, unsigned long iova, uint64_t ptes[
 	return 0;
 }
 
+static void
+msm_iommu_pagetable_prealloc_count(struct msm_mmu *mmu, struct msm_mmu_prealloc *p,
+				   uint64_t iova, size_t len)
+{
+	u64 pt_count;
+
+	/*
+	 * L1, L2 and L3 page tables.
+	 *
+	 * We could optimize L3 allocation by iterating over the sgt and merging
+	 * 2M contiguous blocks, but it's simpler to over-provision and return
+	 * the pages if they're not used.
+	 *
+	 * The first level descriptor (v8 / v7-lpae page table format) encodes
+	 * 30 bits of address.  The second level encodes 29.  For the 3rd it is
+	 * 39.
+	 *
+	 * https://developer.arm.com/documentation/ddi0406/c/System-Level-Architecture/Virtual-Memory-System-Architecture--VMSA-/Long-descriptor-translation-table-format/Long-descriptor-translation-table-format-descriptors?lang=en#BEIHEFFB
+	 */
+	pt_count = ((ALIGN(iova + len, 1ull << 39) - ALIGN_DOWN(iova, 1ull << 39)) >> 39) +
+		   ((ALIGN(iova + len, 1ull << 30) - ALIGN_DOWN(iova, 1ull << 30)) >> 30) +
+		   ((ALIGN(iova + len, 1ull << 21) - ALIGN_DOWN(iova, 1ull << 21)) >> 21);
+
+	p->count += pt_count;
+}
+
+static struct kmem_cache *
+get_pt_cache(struct msm_mmu *mmu)
+{
+	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
+	return to_msm_iommu(pagetable->parent)->pt_cache;
+}
+
+static int
+msm_iommu_pagetable_prealloc_allocate(struct msm_mmu *mmu, struct msm_mmu_prealloc *p)
+{
+	struct kmem_cache *pt_cache = get_pt_cache(mmu);
+	int ret;
+
+	p->pages = kvmalloc_array(p->count, sizeof(p->pages), GFP_KERNEL);
+	if (!p->pages)
+		return -ENOMEM;
+
+	ret = kmem_cache_alloc_bulk(pt_cache, GFP_KERNEL, p->count, p->pages);
+	if (ret != p->count) {
+		p->count = ret;
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static void
+msm_iommu_pagetable_prealloc_cleanup(struct msm_mmu *mmu, struct msm_mmu_prealloc *p)
+{
+	struct kmem_cache *pt_cache = get_pt_cache(mmu);
+	uint32_t remaining_pt_count = p->count - p->ptr;
+
+	kmem_cache_free_bulk(pt_cache, remaining_pt_count, &p->pages[p->ptr]);
+	kvfree(p->pages);
+}
+
+/**
+ * alloc_pt() - Custom page table allocator
+ * @cookie: Cookie passed at page table allocation time.
+ * @size: Size of the page table. This size should be fixed,
+ * and determined at creation time based on the granule size.
+ * @gfp: GFP flags.
+ *
+ * We want a custom allocator so we can use a cache for page table
+ * allocations and amortize the cost of the over-reservation that's
+ * done to allow asynchronous VM operations.
+ *
+ * Return: non-NULL on success, NULL if the allocation failed for any
+ * reason.
+ */
+static void *
+msm_iommu_pagetable_alloc_pt(void *cookie, size_t size, gfp_t gfp)
+{
+	struct msm_iommu_pagetable *pagetable = cookie;
+	struct msm_mmu_prealloc *p = pagetable->base.prealloc;
+	void *page;
+
+	/* Allocation of the root page table happening during init. */
+	if (unlikely(!pagetable->root_page_table)) {
+		struct page *p;
+
+		p = alloc_pages_node(dev_to_node(pagetable->iommu_dev),
+				     gfp | __GFP_ZERO, get_order(size));
+		page = p ? page_address(p) : NULL;
+		pagetable->root_page_table = page;
+		return page;
+	}
+
+	if (WARN_ON(!p) || WARN_ON(p->ptr >= p->count))
+		return NULL;
+
+	page = p->pages[p->ptr++];
+	memset(page, 0, size);
+
+	/*
+	 * Page table entries don't use virtual addresses, which trips out
+	 * kmemleak. kmemleak_alloc_phys() might work, but physical addresses
+	 * are mixed with other fields, and I fear kmemleak won't detect that
+	 * either.
+	 *
+	 * Let's just ignore memory passed to the page-table driver for now.
+	 */
+	kmemleak_ignore(page);
+
+	return page;
+}
+
+
+/**
+ * free_pt() - Custom page table free function
+ * @cookie: Cookie passed at page table allocation time.
+ * @data: Page table to free.
+ * @size: Size of the page table. This size should be fixed,
+ * and determined at creation time based on the granule size.
+ */
+static void
+msm_iommu_pagetable_free_pt(void *cookie, void *data, size_t size)
+{
+	struct msm_iommu_pagetable *pagetable = cookie;
+
+	if (unlikely(pagetable->root_page_table == data)) {
+		free_pages((unsigned long)data, get_order(size));
+		pagetable->root_page_table = NULL;
+		return;
+	}
+
+	kmem_cache_free(get_pt_cache(&pagetable->base), data);
+}
+
 static const struct msm_mmu_funcs pagetable_funcs = {
+		.prealloc_count = msm_iommu_pagetable_prealloc_count,
+		.prealloc_allocate = msm_iommu_pagetable_prealloc_allocate,
+		.prealloc_cleanup = msm_iommu_pagetable_prealloc_cleanup,
 		.map = msm_iommu_pagetable_map,
 		.unmap = msm_iommu_pagetable_unmap,
 		.destroy = msm_iommu_pagetable_destroy,
@@ -333,6 +477,17 @@ static const struct iommu_flush_ops tlb_ops = {
 static int msm_gpu_fault_handler(struct iommu_domain *domain, struct device *dev,
 		unsigned long iova, int flags, void *arg);
 
+static size_t get_tblsz(const struct io_pgtable_cfg *cfg)
+{
+	int pg_shift, bits_per_level;
+
+	pg_shift = __ffs(cfg->pgsize_bitmap);
+	/* arm_lpae_iopte is u64: */
+	bits_per_level = pg_shift - ilog2(sizeof(u64));
+
+	return sizeof(u64) << bits_per_level;
+}
+
 struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent, bool kernel_managed)
 {
 	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(parent->dev);
@@ -369,8 +524,34 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent, bool kernel_m
 
 	if (!kernel_managed) {
 		ttbr0_cfg.quirks |= IO_PGTABLE_QUIRK_NO_WARN;
+
+		/*
+		 * With userspace managed VM (aka VM_BIND), we need to pre-
+		 * allocate pages ahead of time for map/unmap operations,
+		 * handing them to io-pgtable via custom alloc/free ops as
+		 * needed:
+		 */
+		ttbr0_cfg.alloc = msm_iommu_pagetable_alloc_pt;
+		ttbr0_cfg.free  = msm_iommu_pagetable_free_pt;
+
+		/*
+		 * Restrict to single page granules.  Otherwise we may run
+		 * into a situation where userspace wants to unmap/remap
+		 * only a part of a larger block mapping, which is not
+		 * possible without unmapping the entire block.  Which in
+		 * turn could cause faults if the GPU is accessing other
+		 * parts of the block mapping.
+		 *
+		 * Note that prior to commit 33729a5fc0ca ("iommu/io-pgtable-arm:
+		 * Remove split on unmap behavior)" this was handled in
+		 * io-pgtable-arm.  But this apparently does not work
+		 * correctly on SMMUv3.
+		 */
+		WARN_ON(!(ttbr0_cfg.pgsize_bitmap & PAGE_SIZE));
+		ttbr0_cfg.pgsize_bitmap = PAGE_SIZE;
 	}
 
+	pagetable->iommu_dev = ttbr1_cfg->iommu_dev;
 	pagetable->pgtbl_ops = alloc_io_pgtable_ops(ARM_64_LPAE_S1,
 		&ttbr0_cfg, pagetable);
 
@@ -414,7 +595,6 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent, bool kernel_m
 	/* Needed later for TLB flush */
 	pagetable->parent = parent;
 	pagetable->tlb = ttbr1_cfg->tlb;
-	pagetable->iommu_dev = ttbr1_cfg->iommu_dev;
 	pagetable->pgsize_bitmap = ttbr0_cfg.pgsize_bitmap;
 	pagetable->ttbr = ttbr0_cfg.arm_lpae_s1_cfg.ttbr;
 
@@ -522,6 +702,7 @@ static void msm_iommu_destroy(struct msm_mmu *mmu)
 {
 	struct msm_iommu *iommu = to_msm_iommu(mmu);
 	iommu_domain_free(iommu->domain);
+	kmem_cache_destroy(iommu->pt_cache);
 	kfree(iommu);
 }
 
@@ -596,6 +777,14 @@ struct msm_mmu *msm_iommu_gpu_new(struct device *dev, struct msm_gpu *gpu, unsig
 		return mmu;
 
 	iommu = to_msm_iommu(mmu);
+	if (adreno_smmu && adreno_smmu->cookie) {
+		const struct io_pgtable_cfg *cfg =
+			adreno_smmu->get_ttbr1_cfg(adreno_smmu->cookie);
+		size_t tblsz = get_tblsz(cfg);
+
+		iommu->pt_cache =
+			kmem_cache_create("msm-mmu-pt", tblsz, tblsz, 0, NULL);
+	}
 	iommu_set_fault_handler(iommu->domain, msm_gpu_fault_handler, iommu);
 
 	/* Enable stall on iommu fault: */
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index c70c71fb1a4a..76d7dcc1c977 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -9,8 +9,16 @@
 
 #include <linux/iommu.h>
 
+struct msm_mmu_prealloc;
+struct msm_mmu;
+struct msm_gpu;
+
 struct msm_mmu_funcs {
 	void (*detach)(struct msm_mmu *mmu);
+	void (*prealloc_count)(struct msm_mmu *mmu, struct msm_mmu_prealloc *p,
+			       uint64_t iova, size_t len);
+	int (*prealloc_allocate)(struct msm_mmu *mmu, struct msm_mmu_prealloc *p);
+	void (*prealloc_cleanup)(struct msm_mmu *mmu, struct msm_mmu_prealloc *p);
 	int (*map)(struct msm_mmu *mmu, uint64_t iova, struct sg_table *sgt,
 			size_t off, size_t len, int prot);
 	int (*unmap)(struct msm_mmu *mmu, uint64_t iova, size_t len);
@@ -25,12 +33,38 @@ enum msm_mmu_type {
 	MSM_MMU_IOMMU_PAGETABLE,
 };
 
+/**
+ * struct msm_mmu_prealloc - Tracking for pre-allocated pages for MMU updates.
+ */
+struct msm_mmu_prealloc {
+	/** @count: Number of pages reserved. */
+	uint32_t count;
+	/** @ptr: Index of first unused page in @pages */
+	uint32_t ptr;
+	/**
+	 * @pages: Array of pages preallocated for MMU table updates.
+	 *
+	 * After a VM operation, there might be free pages remaining in this
+	 * array (since the amount allocated is a worst-case).  These are
+	 * returned to the pt_cache at mmu->prealloc_cleanup().
+	 */
+	void **pages;
+};
+
 struct msm_mmu {
 	const struct msm_mmu_funcs *funcs;
 	struct device *dev;
 	int (*handler)(void *arg, unsigned long iova, int flags, void *data);
 	void *arg;
 	enum msm_mmu_type type;
+
+	/**
+	 * @prealloc: pre-allocated pages for pgtable
+	 *
+	 * Set while a VM_BIND job is running, serialized under
+	 * msm_gem_vm::mmu_lock.
+	 */
+	struct msm_mmu_prealloc *prealloc;
 };
 
 static inline void msm_mmu_init(struct msm_mmu *mmu, struct device *dev,
-- 
2.49.0

