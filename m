Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 291D1AED0A1
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 22:17:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 189AE10E38A;
	Sun, 29 Jun 2025 20:17:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="C205ImoM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B3E10E37A
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:17:06 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TIrIh0015161
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:17:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=+3e0ksDzZ42
 mLlKJB4uSylL2Fh/ag708LB47aoZZ0mw=; b=C205ImoMUA3PXX4VdMPfQpZQcpx
 4l/8ebb50L2HtCB2w7fMbd2JYEy6zU+YJwsD0NZm09WUDWWtzqE4BgZ1g84AEBPN
 FvP7Kl7avWNryi3+zsT0mYgQ+HibZOLRF6+EJzkGz3vUP//UyypJ0z/tiFLFqgUf
 /Tfbp4Ky0vXiqoH96aRmlkXjvWsaDfzMrXm3j32Sj9eMEUYNVITa0ybX6DWBsuW2
 VbPa9PjBosu3RvaCfW5FRlu11745OHM6HrGxv78SVQqf+QMPj6tdxxrMgTiMIn4C
 8zvS9kBF6ABT/BOY5ZAd7gyzKh/G/9zNA1DjOXAoVR0D/XlUvrlA9V9UM1w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63k2tkx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:17:05 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-7425efba1a3so4189134b3a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 13:17:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751228225; x=1751833025;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+3e0ksDzZ42mLlKJB4uSylL2Fh/ag708LB47aoZZ0mw=;
 b=Rt6dN5HVD6hFpyQXLuDxWpWBwKDJOo89ezZpUOdzVYQq3/Qqxn876PGhJG8DLYvHFZ
 O6ZmzuE2B7bMHEeGaR5XTczXjpz/gScY15S90qW6pB1zQrDLVrsB58QKv9OhYDxsaKvh
 Vxmzazvq4516Ym2RYJEsLTBpJvju2g4tmKLKHQ/iPcWzczbIhf+Ne6sq1qAGQXDFFuWX
 4xmJ1FMpZYaJUuWDyGq/nH0kBMVuuAASdKiQaj2DDtaTltchKKO0UFkn9X+kYvnPxCLA
 rHD4hklRYHyReanEEQNtWDFTJfB9L4VHCC3Owl8Z6m4VaMGkHGG4scoZSueT2f8DvHYB
 +NAA==
X-Gm-Message-State: AOJu0YywJ5Te4ki+eRYg0luFqtJkFmFiGjw/Ib+4rF6X9mxVBGaUVb5N
 XakCPa7gbv5F0xjEbEjaNtU+wZKUNFstPSrYEk7HH++9sDHmLKwrKZfGHCghX2WXs7AO4J/2NWA
 WrTfK4wvQ8Xm8r5ES67H8pIEF/UReY49vYlWY9QEimaOlB5z3VyfXpSr+FXy7hRgSlXXzf54cWi
 WMoWM=
X-Gm-Gg: ASbGncs2sgCA4ZAyyLVwlXKNaDyCN16qjomWxK32NlP17dHdFH/HGrjbq0YSrr9MbyM
 ntSweaFcc6mTnNLqZg4Cpg1fcQqktNzzixrnbD0x98LpZqOyWRUBOxBSZ7mggSabQ3SFYJ4Up0A
 AljDe9WhoT6MHnP9sxoF0AfjlKkWOt7gEibrTzbqnljWXSq2ynhKmYDtwU1sX9hmGK51EqkxsIJ
 d/UsrnEFKXgpEpsZGUljba0MrcTsfPf1OTGf5cN5JFtROoYlgqkeuKPBthdJre42JyS4XIjJcwX
 ZGdu6J0fpxfyH/RUWfI4e3h9uxf+zNNHgg==
X-Received: by 2002:a05:6a00:b52:b0:748:6a12:1b47 with SMTP id
 d2e1a72fcca58-74af7aef473mr15223421b3a.10.1751228224785; 
 Sun, 29 Jun 2025 13:17:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0f42J78b5kxB0hNvjroBKsRXjXeZuWzvQV4YS47hMUJFad/41z/IabO6ypJ/hY16UGYkV3Q==
X-Received: by 2002:a05:6a00:b52:b0:748:6a12:1b47 with SMTP id
 d2e1a72fcca58-74af7aef473mr15223388b3a.10.1751228224324; 
 Sun, 29 Jun 2025 13:17:04 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af56cb98asm7266082b3a.126.2025.06.29.13.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 13:17:03 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v9 32/42] drm/msm: Support IO_PGTABLE_QUIRK_NO_WARN_ON
Date: Sun, 29 Jun 2025 13:13:15 -0700
Message-ID: <20250629201530.25775-33-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=68619f41 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=MLfKQGWeMraaM-6YArcA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MSBTYWx0ZWRfX71PUqdOEimYG
 swzeYvd8+dxMyaTGuN+tgZehY7hN6Jbd1pja3pEbS/lnzVjZL8JdArtSSlGNI6avqytClEEk0Fu
 gFBd11VqFiKIrkcxAR0ciSmc4KASqyCUSXfzv8g32xxwXdlin7CXb9MNGGS/P5ENcyaj7FUCUl9
 DovKv8a8o26raniZA22vsBb5j0XQrxB8R41qpB8+MneLWUUNQ4NsB11Op9E+UxnSu4tx5azvRhf
 1bP19OqpTxyybV9RHBceEUad9fib2x+SQ8zjSSGUqH0aDuaA/a4HFbdNczGj5vZ6nNapj9iK0eh
 TklgEhYx5ptds5su45uYVedQ0BOApK/L1Y/3AWtaMkaJAzmpXSRFhLUfdMiSLH3NzF2jUK7ZY3/
 kOxbQjuey+MEpKOmNMbpBRpD8NOJbYX4p9Yj2eWMe7ux4KOLH/L6cchj03dlkCimwh5c8vyy
X-Proofpoint-ORIG-GUID: D01jUgWuiBpQvLCZIjkeGpyTruP6UaXA
X-Proofpoint-GUID: D01jUgWuiBpQvLCZIjkeGpyTruP6UaXA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=946 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290171
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
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  2 +-
 drivers/gpu/drm/msm/msm_iommu.c       | 23 ++++++++++++++++++-----
 drivers/gpu/drm/msm/msm_mmu.h         |  2 +-
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 62b5f294a2aa..5e115abe7692 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2280,7 +2280,7 @@ a6xx_create_private_vm(struct msm_gpu *gpu, bool kernel_managed)
 {
 	struct msm_mmu *mmu;
 
-	mmu = msm_iommu_pagetable_create(to_msm_vm(gpu->vm)->mmu);
+	mmu = msm_iommu_pagetable_create(to_msm_vm(gpu->vm)->mmu, kernel_managed);
 
 	if (IS_ERR(mmu))
 		return ERR_CAST(mmu);
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index a0c74ecdb11b..bd67431cb25f 100644
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
+		ttbr0_cfg.quirks |= IO_PGTABLE_QUIRK_NO_WARN;
+	}
+
 	pagetable->pgtbl_ops = alloc_io_pgtable_ops(ARM_64_LPAE_S1,
 		&ttbr0_cfg, pagetable);
 
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index 9d61999f4d42..04dce0faaa3a 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -51,7 +51,7 @@ static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
 	mmu->handler = handler;
 }
 
-struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent);
+struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent, bool kernel_managed);
 
 int msm_iommu_pagetable_params(struct msm_mmu *mmu, phys_addr_t *ttbr,
 			       int *asid);
-- 
2.50.0

