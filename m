Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8155CB1B8AE
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 18:43:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2555110E6C6;
	Tue,  5 Aug 2025 16:43:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fDHe3jex";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 435C810E6C6
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 16:43:14 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575EI9QI020917
 for <dri-devel@lists.freedesktop.org>; Tue, 5 Aug 2025 16:43:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=hv30jdihqjoTZ5O1+BHgicFjeP5thjFR90f
 +0mrcaKc=; b=fDHe3jexkYZwPPGKJy7F2swAdK4gcYfVaZ2ysGacXOy+4tdFXPX
 UWGqAluR34H6so0S3k1StKae49FO0PgTZ0lBdtJ5ST5pvar71nQ1plGOGjZ7zrm1
 Dj1SyALsRk3iiHPlzHthrzAOqlnHDD8LAOsZsZAW2ZNYkrYUdLpPV87JBp4ewleY
 GpnL6AFbZ1pPtaWjf9TKAor+IJLaneI0uhjT62LXdzSSYkKrNo49+GZBIyTuCqG4
 0ytLr5TYRg3cJ0oXO8LL64VDY40AhqU55OmfJ1oG9Iig85nvYASXoBJmIjRKg+9Q
 K+ql863nrxDU1Z7ECEzlC70WtINCktNPlaA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4898cjsgnb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Aug 2025 16:43:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-24283069a1cso18452795ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Aug 2025 09:43:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754412193; x=1755016993;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hv30jdihqjoTZ5O1+BHgicFjeP5thjFR90f+0mrcaKc=;
 b=DtQNniMXznR53DkWftqIeCJPN63D1uS2E0259Yo+BkyBvdmU9cgl/M4lhDtDfnGit0
 ZUQ8E/AibGskilwuUX+NpwJtuFvw1KvqsuunVNk3+G5dFfDIp6zCdnyxK/rTVh2oO8TQ
 NT0IH1IbCxqmfxf8mAC2mIWLl7BYYR+MyEwNN5lmQTJhHYUu2Py2ZbMpogWjtIj9/GZq
 oq6NS6I6FLyD6SwXNLVRQVnQ5QtuNVfahTRSqTRSYfvm7Ovi72u1GMWQnuyOMgIxQHiX
 mWf2LEEMapDhctwrXvWosY2DNLNmWoqArlgetntWk4sImE+Ev2mg+8DHiL8xSEs11O+6
 EWQQ==
X-Gm-Message-State: AOJu0YyFEcID+xWaisMFd1qs+BePChJ1xpfz4BQ8pyYj1c3akRmjAFIc
 o5L012Be29xvy4husG62pxdABLm3cdHaMgHldfFLpaxuOPqRg00tbUtp6+j487cxcswDorP9RQy
 Fj8Q8K5wJotCrRXVLv6FtkK6l/MtzZ/bY4VuNKlxY3c1yD60gvmi9i4xXrBQSl2CkFVHj6NXYSd
 7ZqsA=
X-Gm-Gg: ASbGnctPZA/Pr0XZKA3mayFCkzqjRe56gQXRYuCZjVMFFyFLqgBqKeNWDq48wXgRRAP
 uTrBWQA0OeeAofTRhpq+zqtssPXe7U44kJZVTAscRqTxPT0ZvuVO8FB2XU4buGzagw7APH05Mmh
 Qt9bFK5WaV1Awf2pTYUra5vhl4o2IXmChdenG1nApY6siN7lTkADJ+S02Y+kLZDBgFhEEoQnRXe
 9kxp/r+q30WScWm4c+2J0i8imerHru1e1Twh13RWVbgbssFuTD+cPcbr7rimCJGufy5JVXreInK
 4MhUQZq/JO1+M95Qqt0F/vRtPtoYe7kkKYgY6/ig0Pvf7r21RrY=
X-Received: by 2002:a17:902:e889:b0:23d:fa76:5c3b with SMTP id
 d9443c01a7336-24246f721fbmr218343725ad.22.1754412192650; 
 Tue, 05 Aug 2025 09:43:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG19NECaSamtKmV1ToEgyAxx1m7KHOpQTVdLiTHMDu1lnYZHtJCITz8j/23vDlW8kqUI1HB9w==
X-Received: by 2002:a17:902:e889:b0:23d:fa76:5c3b with SMTP id
 d9443c01a7336-24246f721fbmr218343185ad.22.1754412192122; 
 Tue, 05 Aug 2025 09:43:12 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1f0e81dsm137414025ad.46.2025.08.05.09.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 09:43:11 -0700 (PDT)
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
Subject: [PATCH] drm/msm: Fix a few comments
Date: Tue,  5 Aug 2025 09:43:08 -0700
Message-ID: <20250805164308.23894-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MNBgmNZl c=1 sm=1 tr=0 ts=689234a1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=EUspDBNiAAAA:8 a=q6EcQpUjypoMYbJrLQEA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: azHQY9SzhaKniyMgJbkKugUyzmJkItUy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDExNiBTYWx0ZWRfX8MiY4wgRmPGb
 aYlInHHMwEOqrf6yuYt47s4/AGCHGKpHdzWXWzqWWMhI2EeymHCf2BxDPpJeaxOITkDCaE9eUng
 L7AXsFtdVkiEmpRZhQ5tkA4zNRFKZDQvmzYt9dutQt0qoZffZiDBm8XwQwzTLDYFKT6ORuwKDTQ
 cWAn2hBZ5thXensCBvUHVS8g+JLOzZhsLLt/AxFiKm6mjgHQYURCr4Uytd1kud2BmT51UM24nAp
 w5D5Div7+R1bkdF1t4kKYuHDEgvDiD+ex++7GzP8/ZJ1JGU+8bZsvGw6JZNyQY78fWs6JcQ8TLd
 D134psliOgHUpfNQdHXBdEDuSqdjnIx1k3NaPCieefReKzVQX44Fr7TwGIbfWRrJZAkTw4kYuus
 /YaRzFS3WHoczfwKA2/J1JwzvPx8u5Al5SX1oCelvjDyvYlnbmtgTjBAd/nBcPSjpHEHSX7l
X-Proofpoint-GUID: azHQY9SzhaKniyMgJbkKugUyzmJkItUy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 spamscore=0 mlxscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508050116
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

Fix a couple comments which had become (partially) obsolete or incorrect
with the gpuvm conversion.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.h     | 2 +-
 drivers/gpu/drm/msm/msm_gem_vma.c | 5 +----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 88239da1cd72..751c3b4965bc 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -100,7 +100,7 @@ struct msm_gem_vm {
 	 *
 	 * Only used for kernel managed VMs, unused for user managed VMs.
 	 *
-	 * Protected by @mm_lock.
+	 * Protected by vm lock.  See msm_gem_lock_vm_and_obj(), for ex.
 	 */
 	struct drm_mm mm;
 
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index dc54c693b28d..d1f5bb2e0a16 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -319,13 +319,10 @@ msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt)
 		mutex_lock(&vm->mmu_lock);
 
 	/*
-	 * NOTE: iommu/io-pgtable can allocate pages, so we cannot hold
+	 * NOTE: if not using pgtable preallocation, we cannot hold
 	 * a lock across map/unmap which is also used in the job_run()
 	 * path, as this can cause deadlock in job_run() vs shrinker/
 	 * reclaim.
-	 *
-	 * Revisit this if we can come up with a scheme to pre-alloc pages
-	 * for the pgtable in map/unmap ops.
 	 */
 	ret = vm_map_op(vm, &(struct msm_vm_map_op){
 		.iova = vma->va.addr,
-- 
2.50.1

