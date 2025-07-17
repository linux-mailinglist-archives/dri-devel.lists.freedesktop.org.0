Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83879B0906E
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 17:19:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E463810E842;
	Thu, 17 Jul 2025 15:19:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="C3Qcr1D1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0971110E843
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 15:19:37 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HCsV9v021557
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 15:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=wdkJ8bz+kx17ne/rgHDgW3wfkXF5IySByRD
 4qnNkc5o=; b=C3Qcr1D1NEUcWP6EY+2mlCyQQfNqpNFXdRT6CEeOShwlyLY6upG
 NvYLb8oYruljiKwllG+0oOpWRm6Ism6qOlxpuxMRtt3rT08fg7JMwOM21fy0t0u+
 n8nEuIS24IeIrah6IxzHQ7SIGbZwJjH+VgieZ8kamfe6db/JnNVH+cKMm/fjGxd+
 psGrYB00jA2ANjF48EhZIh7q/wW5I1fkpcEO+HCGF4kJKt1ff/CY1/kScqmkbZsQ
 sDaRcHIrFnC6DB2E/1XhysUcmcGPyd5QIH8fee7wewLZ3zD2pVFwtQTrJ7SPvkPW
 Ez2aNx0AhXPfvRejnGaUCKBYGyd5fDVAOSQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu8g1b5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 15:19:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-3138c50d2a0so1561676a91.2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 08:19:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752765575; x=1753370375;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wdkJ8bz+kx17ne/rgHDgW3wfkXF5IySByRD4qnNkc5o=;
 b=QJsgnRx6tqLJUFFZ4djyaDXolI310kDYN7U9iwVUkYeDIelF+XAAXaEeZrMYcPWpwq
 yP2UYlWyOzWfvzJt15X5d9g1i0FCTYZ9w3wJWB9Vn6S5ma2lkfLjmBk+Sd//MmNPqiEo
 qFdXX2e3Zoi+ETLTfv+oAavjEQ+fckCD/NqvQOivHd2d90b4BROf0u8tOuLSbk8XykKd
 Stkuu6S6t4NHD5G5lAw+q/Aqb5GjIRYPhCG+4kqfcBqpkVMMyRYViVtzGVrZ+kxYKlQC
 2JIX0YxsX37A+G9IRon1ZJe+6QeDDl7b5aYF4r1v9fgtzJklBzbNdOHjEKw16YJTUTk+
 AoSw==
X-Gm-Message-State: AOJu0YzmrHv6PUdZBeXdST2PdpOQrrPJ8Sr4VZUe15pW+h20pm76/13x
 FYX96qJpAvKzOQ8Z1Hzb3PnRZUoJVkpX5ShtH6k+kdeOkuC7bV1blBxAzqnOprp2b5uJ9BCaakQ
 aYgEmUBJCxX5MwNQ+G9G8GCSng6a7qdUBBCrsilJjp01k6q7OQ3M27q8GZEkfLVJJrpovgaM4jz
 Y2Y+c=
X-Gm-Gg: ASbGncu92nVM0LwaD9o9Q4poyfVknZqpsDdyz/hIA40cY6JgWxtfE6IOKJ3SD5NmdLE
 EPISTO4mVKniieN19LKIcc5DdTGT81/OiKJooywLkdntu4a+gKLILSI8lCA1QOkCZib/o2WPW2r
 pOPHqvrnhcpfvk9ubR7AWIrraq7g0WAbcHtMiGZzGHQ5ByxNi2LqPIElWv9QznwWI2icFQ6sXvR
 68kR7oq7wolbvMUoGDSiPf6VEesBJWYk1c1H2eEGN9/U/ENlaKcQ9NGEhpoK1XD08KBopT5Ht+4
 n6/R1gzH4nF5kdA7wEQQk5sar5ah6yn2VruXuocKjWzwXZ7FbYQ=
X-Received: by 2002:a17:90b:3a91:b0:311:9c1f:8516 with SMTP id
 98e67ed59e1d1-31caf85e029mr5009414a91.15.1752765575380; 
 Thu, 17 Jul 2025 08:19:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJBlIDvX0IMhzg5s1vxarPavrcpaAW/SghWPjLESXyVamMIaNFxD+9sBYlLjBFgfg4OT5j9g==
X-Received: by 2002:a17:90b:3a91:b0:311:9c1f:8516 with SMTP id
 98e67ed59e1d1-31caf85e029mr5009375a91.15.1752765574859; 
 Thu, 17 Jul 2025 08:19:34 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31caf7c32f7sm1708090a91.16.2025.07.17.08.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jul 2025 08:19:34 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: Fix pagetables setup/teardown serialization
Date: Thu, 17 Jul 2025 08:19:30 -0700
Message-ID: <20250717151931.10228-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDEzNCBTYWx0ZWRfXzAfT2hvQ6MlT
 45z6ZR4qBbQRgbYO7kmkrVAG9+7wVOe8Snyq2zepgX1Q88H8B8gMSHdgR0hNYCaewPL1qh58d2w
 iIdOlKutzx5yJLjyPt0a0/3kVjLHWgp9lrjUaZs3RYTbN211PSDUGwoXA3s/rj86tTNZbvlVKwO
 oqqLCXQsih+t0BVNohbQVmYgsJrTjUn9kRuZeDKxXa/0caqBuknsXfqAw4mKPhLReILIi1/9Qb2
 lM8C2nClUfoGyAsqV3E657VqEFPwgu/1H5NOcJ7tOQzlxRAzwzOaD3Ub8DbUr0NjD72YisHTw7a
 5GI8xKBwe/rwYfcq32ZB1ciK1qSAq2Fa6tUldNP+1Xax1wuYI47z9B9cVkDr9cieojJay0vL9qb
 t1iMsJ/APuCPheRWQwQjTHWor2sZvg3cjm2e9Ml/UFK4pwFJMSkuYdeACgZceq0yiDs9HPTU
X-Proofpoint-ORIG-GUID: w_Do4L5XyKKXr27EIiqfGOZjtdha1w3S
X-Proofpoint-GUID: w_Do4L5XyKKXr27EIiqfGOZjtdha1w3S
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=68791488 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=ufhHnk6gINzqDhHgaV0A:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170134
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

An atomic counter is not sufficient, as one task could still be in the
process of tearing things down while another task increments the counter
back up to one and begins setup again.  The race condition existed since
commit b145c6e65eb0 ("drm/msm: Add support to create a local pagetable")
but got bigger in commit dbbde63c9e9d ("drm/msm: Add PRR support").

Fixes: dbbde63c9e9d ("drm/msm: Add PRR support")
Fixes: b145c6e65eb0 ("drm/msm: Add support to create a local pagetable")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_iommu.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index cefa50192391..89cdda73711a 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -14,7 +14,9 @@
 struct msm_iommu {
 	struct msm_mmu base;
 	struct iommu_domain *domain;
-	atomic_t pagetables;
+
+	struct mutex init_lock;  /* protects pagetables counter and prr_page */
+	int pagetables;
 	struct page *prr_page;
 
 	struct kmem_cache *pt_cache;
@@ -227,7 +229,8 @@ static void msm_iommu_pagetable_destroy(struct msm_mmu *mmu)
 	 * If this is the last attached pagetable for the parent,
 	 * disable TTBR0 in the arm-smmu driver
 	 */
-	if (atomic_dec_return(&iommu->pagetables) == 0) {
+	mutex_lock(&iommu->init_lock);
+	if (--iommu->pagetables == 0) {
 		adreno_smmu->set_ttbr0_cfg(adreno_smmu->cookie, NULL);
 
 		if (adreno_smmu->set_prr_bit) {
@@ -236,6 +239,7 @@ static void msm_iommu_pagetable_destroy(struct msm_mmu *mmu)
 			iommu->prr_page = NULL;
 		}
 	}
+	mutex_unlock(&iommu->init_lock);
 
 	free_io_pgtable_ops(pagetable->pgtbl_ops);
 	kfree(pagetable);
@@ -568,9 +572,12 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent, bool kernel_m
 	 * If this is the first pagetable that we've allocated, send it back to
 	 * the arm-smmu driver as a trigger to set up TTBR0
 	 */
-	if (atomic_inc_return(&iommu->pagetables) == 1) {
+	mutex_lock(&iommu->init_lock);
+	if (iommu->pagetables++ == 0) {
 		ret = adreno_smmu->set_ttbr0_cfg(adreno_smmu->cookie, &ttbr0_cfg);
 		if (ret) {
+			iommu->pagetables--;
+			mutex_unlock(&iommu->init_lock);
 			free_io_pgtable_ops(pagetable->pgtbl_ops);
 			kfree(pagetable);
 			return ERR_PTR(ret);
@@ -595,6 +602,7 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent, bool kernel_m
 			adreno_smmu->set_prr_bit(adreno_smmu->cookie, true);
 		}
 	}
+	mutex_unlock(&iommu->init_lock);
 
 	/* Needed later for TLB flush */
 	pagetable->parent = parent;
@@ -730,7 +738,7 @@ struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks)
 	iommu->domain = domain;
 	msm_mmu_init(&iommu->base, dev, &funcs, MSM_MMU_IOMMU);
 
-	atomic_set(&iommu->pagetables, 0);
+	mutex_init(&iommu->init_lock);
 
 	ret = iommu_attach_device(iommu->domain, dev);
 	if (ret) {
-- 
2.50.1

