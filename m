Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B5AACF6E0
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 20:33:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CA9E10E9FB;
	Thu,  5 Jun 2025 18:33:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ClyghPom";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 896C710E9C6
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 18:33:12 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555HisVL027442
 for <dri-devel@lists.freedesktop.org>; Thu, 5 Jun 2025 18:33:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=DtgSsqvS9NG
 lueSPRpKpNF02UHsYVqSrf4yaa+KHu3E=; b=ClyghPomOFoMdTdJzGxve7TKXHN
 3OQUYa+lC3FIecHp1y+SfCYVCczz7kP0u2EisRTkMBKeg/Fhh10uMMHFbVjIzh1Q
 Edh0I7kadwComP87m3bhTriUzqyr83vu1PIFmN60gfewQ94d9+4anjazQQ7A2IOF
 oeBEThjo659CyseoxQMEROIrKvsLB7NGcpLlaUxf2DYnP9WyPRCFFWAdJZloxcYm
 1E46HAjYohF0bgJpxj6/A3tvT75v4bGsfa1mTssWN0Ce62ZZbvRMYPBw5vNUL5i6
 eakOoYJaiuu1rBi3jjf01tXi8Ry8cELlkRZC9TsZvD2HYOU/bssjqYHLNew==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8ta9nj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 18:33:12 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-235c897d378so11995215ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 11:33:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749148391; x=1749753191;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DtgSsqvS9NGlueSPRpKpNF02UHsYVqSrf4yaa+KHu3E=;
 b=FgwEwM95pT4ApA2TX3Lk3TZoJ800iU3lkOScNqgmUFCZQDxqjNQRGUaRYozBi7Zaos
 0Lp5Z/0VbHGgc58k/g6/dQjDXwzg483gPq8a0YZZYt4yd78Nx8izRrJYkMu+6/k8e6CN
 6CHJJZWc1HDmb1jBgv3DCocz6v3fXeaipL4WLCpE+N7xwGTL09yrWT0nXbZvj7uhP+rL
 92Wa2Bz5T0ay3ZqzjWORyZ5k8Rm1cgAhlJouKhMdQ/X+C5/Uox5/0h9QDWs9108RS4kL
 +nvYKFx/5K5m1+ZiAG/dl/HboRo3i3swJEdzV3YHDL3luMrgk3z82lCy8F5bhY5LjFiX
 QD8w==
X-Gm-Message-State: AOJu0YzwisxfrDHSVZqB46aUeGhhe6YzwYtkAC5QIXhDd/aLNKsZ51ix
 VD3WP9tivPuzc0dlzCiobhzMvW4khcfM7weQaweaGIQ5FnuM/BieYFnxGD3Vb4UIF0orqrgFu6j
 JDC1USVPRO+Gp80Jl0A/6i/7e3P039j24nfcUbiwu4kBkEdmQD35h8s6aASWluEFluCuUIId33d
 6KcqI=
X-Gm-Gg: ASbGncuweXJc/YAEbJajUL6IJH/ZDkTjseh84nQLzQuxXRHvxwxDOgOXSRC3evk8Mou
 GVmmoZ7fvh0QjMAwJjn6kDiIrhtvFvnY3W1/pnJWBg4Z46DKI+MV2EFEazTGvREqpTmIuoodGZj
 1haAAL4Ibq1O3uxQd8gkvhO6K8UsMNCi2CgrXJAyliKjCWuM/3Ia5bnRYp+B9ZWlihrH8zRb4js
 S5v1f5+DDMTSMzgXDGDyw3YuSdIuYobst5QYUc6teVzpYyiBSfJ771YQtcMcNLHsIoOqsl9Eevl
 DpKQ70t877SWvSlV9FK9k19IChDV7R8n
X-Received: by 2002:a17:902:ecd0:b0:234:d7c5:a0ea with SMTP id
 d9443c01a7336-23601e76032mr5573145ad.24.1749148390873; 
 Thu, 05 Jun 2025 11:33:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOxX7OAxfRTU4dE4awOTuujPdjFcN3dyi4/iEto+JK4TWIehfBEilrFztqx0wPx+KLj25mqA==
X-Received: by 2002:a17:902:ecd0:b0:234:d7c5:a0ea with SMTP id
 d9443c01a7336-23601e76032mr5572585ad.24.1749148390362; 
 Thu, 05 Jun 2025 11:33:10 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506cd3407sm122902075ad.141.2025.06.05.11.33.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 11:33:09 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 30/40] drm/msm: Support IO_PGTABLE_QUIRK_NO_WARN_ON
Date: Thu,  5 Jun 2025 11:29:15 -0700
Message-ID: <20250605183111.163594-31-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
References: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eJQTjGp1 c=1 sm=1 tr=0 ts=6841e2e8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=MLfKQGWeMraaM-6YArcA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: EWGx1k3ZN2w8mfUeGEiD8cfeJX6C7boj
X-Proofpoint-GUID: EWGx1k3ZN2w8mfUeGEiD8cfeJX6C7boj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2MyBTYWx0ZWRfX+1snslSlVNaC
 oaOhhSuQOvwW3DAwn3J/5ObpM7vyLqNOURHxrBTsd3RFKlDOB7ealAgcKQucfBW+9PQpU5VrbYM
 fFRQRC4BZv6FVlVWJtbecemzD/lPuG+xkT77jO7SY3j1eXTqi/MZ2mlExemaLPgV7jLa3FubpRQ
 XR9NkmXtSehkJHvlb6k9hms0zDRVl22kukzCeOeI3KcmLtohwCCc/aWijX8N903Lu25zKvnMsMn
 v2ug2/CtOgsGMsrfq7+iiK+DzuwvzopdD5FjPNqz+8o8nMzm00BcaYgNS8uhGqtKiC3/eNv3Ua5
 Pv7nyZEPUZ0H8diDwtprKGztVhc43NzP90WMdHLwbccDD/Xl0KjskwgaJREt7WRpsfFNzyYlinL
 6bWdTeudEwZXxYc2R+i0o/Hd1OiJOmdXcIB0b8mq9sE2ayo1n1RAMicQsA9Wf7Ko6dTOpgL0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 mlxlogscore=955 impostorscore=0 spamscore=0
 phishscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050163
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

