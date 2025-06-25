Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE0AAE8D8B
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 20:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B4410E7F3;
	Wed, 25 Jun 2025 18:59:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pFGV5HrF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC97710E7E5
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:12 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PANnbU021706
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=DtgSsqvS9NG
 lueSPRpKpNF02UHsYVqSrf4yaa+KHu3E=; b=pFGV5HrFiVHgGbMsigNsiN34XeL
 V85NrU2arxrLMhWzSknYErzNud7rFy1AoxahQ50iQ5MV+R3gcPYOGziCAxFYskJW
 4qwK1MuxSf6SEQQ3ait4roeXZnj9GpvXSCMm8CHWBTNN+CIOxEtmyOG/FG8bG5rY
 y120oAcUqDBgx4ETAdMbMeA900xZlCIhad1KInMlEKwtglPCG046esCod4mk2epg
 RfmUXOhQPu4wjcjGJEynqnzN4/wReZvmYTnjG3jOZg3ugKVKfaByMk8PP1FlBRFP
 bdUcjX5uSbiMn1JVjhS4vBzuUi2QTWzZI5Ts9JqyU8M63AwZyRxu3UM9Dhw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rq15bq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:12 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-312df02acf5so955015a91.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 11:59:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750877950; x=1751482750;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DtgSsqvS9NGlueSPRpKpNF02UHsYVqSrf4yaa+KHu3E=;
 b=iKsVrkfw9USVzOo/POHxPVpAyW4lIi1pyWUyN7wooYaPuLbPCJYyse2ys1MgfYi+Kh
 2Cj+Xw1h9XNXbiBpoa3xAp5Agq+1GXm764z/GwEYw+JpQzDydau8FV4sO0M3qc+LF+d9
 nE/tF8N84h7FMhyoIVUTDwylFnWPmY2tnpODsBazZ8U7+muIHML2W6tllabN4Hng49Ua
 3Ej+uzKa4qpyXvH0lqD60zu2VpqJ7KduBaTQciexlNrqj7RmBFJpMtLvwxF+5reQFxVm
 eHQ3Z+zFMhzn7k7Iar3GeesDiecSvdARTLWqocDe+MvDy2KGnbHDRTGSiuNpV/kqiCeT
 2mOQ==
X-Gm-Message-State: AOJu0Ywnxs0dMTtE1btL38OXrysC241AVW+7hFGfrkeBUeA0zCJRWhF2
 YfIFe1zZ1Zd7Xhd5d9wPCzRibmMsTQuvrMvAwv+L8OweL/P3NzadTP24OKX1CXjFwBWcBHT2ktX
 4cR4Dl/J0mbAMWmtPn8DcFeSzP1HjFbsScxAmownvHalVdxC+3Npz+aCYCrmqLak4OwFOarV0vW
 iZDJo=
X-Gm-Gg: ASbGncuXsIYWKVVo3Ir5l7OArILQ9Zd9zv1pJbs4Al4D8PMOWwReuf7aSH6xkAR16ae
 cKvrd2hdI+grpubJr5o9huNoVhdqHUUfyDZny4Kwx09hjtyowiynlF2ni9PSg/kaRv4281bKcqm
 +G4ZzgCYKZkl2/G5e7hQzA/z7dlt19y29Hx5rpOqpa7SMSSX/cf6vf0KrhWUDW8czS4lgkQ1i+e
 EjnQpnECtW1hA8p2J+B3u6Gbd52tfvHDbSYHidCw2wxH5lRMpgpWEBGQnvBFsscPqBfCCzKyA+t
 ZcEgtgxfQxYJfBFxJRIf3Ot6p9uFJQsS
X-Received: by 2002:a17:90b:5884:b0:310:c8ec:4192 with SMTP id
 98e67ed59e1d1-316e2336f18mr798539a91.10.1750877950566; 
 Wed, 25 Jun 2025 11:59:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbp4SKrEY9d8JIbSkMB6p5URNqdjm5cGwlxWoVGnHIftvqm3YVrqyP0ZrvpIQrI+VVUGZoBA==
X-Received: by 2002:a17:90b:5884:b0:310:c8ec:4192 with SMTP id
 98e67ed59e1d1-316e2336f18mr798499a91.10.1750877950074; 
 Wed, 25 Jun 2025 11:59:10 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-315f539e6ccsm2331259a91.17.2025.06.25.11.59.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 11:59:09 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 32/42] drm/msm: Support IO_PGTABLE_QUIRK_NO_WARN_ON
Date: Wed, 25 Jun 2025 11:47:25 -0700
Message-ID: <20250625184918.124608-33-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685c4700 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=MLfKQGWeMraaM-6YArcA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX3YI3SZ100UEs
 ahd58aw8Axu9CPv3amwzs5JZbdA5MpazM3VLhPp3wM4Lwb2cTXbiQ5PgWHlknVQYC/i+yNKW4XZ
 sfKts9pds0EjOZyVkszzQL+XyRrQNCD99PEKwO6J+Cd6LiV0eHKmwnENI7YCoDf3L7I3DA/nYF0
 fpxDLWstLy0qy0hDjkboOHgGcbW+GuPqE3gUluWYUkUUkqZPH1IlnfEUkqtutOJGEdL6e9btVJO
 80ArMM0pkqkBTVoir+tfn/lSA4zUtZGO74AvN2BsitOQl0UxN7MQm84At838S3SXASTtqUjMBNC
 R6S+DV6QZa1TOXUmhIHLUmzhTbvWZGx2cWEBbDxaBGVXEtpf1/C7RR36ZqOO/0xspG4AnDRyXpU
 xnaEHr8FhooENyg7nZCrg50Hi64Fm2io6f+ZiDlQihRw7qrjSfpiL6pBPWRLsXKJ/Hr9Vua5
X-Proofpoint-ORIG-GUID: K_OOKOont0Fk-LlwU6AtajQJ4WUn5T0f
X-Proofpoint-GUID: K_OOKOont0Fk-LlwU6AtajQJ4WUn5T0f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=945 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250143
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
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  2 +-
 drivers/gpu/drm/msm/msm_iommu.c       | 23 ++++++++++++++++++-----
 drivers/gpu/drm/msm/msm_mmu.h         |  2 +-
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index f0e37733c65d..83fba02ca1df 100644
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
index 756bd55ee94f..1c068592f9e9 100644
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

