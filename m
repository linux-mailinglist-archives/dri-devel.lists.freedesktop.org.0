Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B82ACF6AD
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 20:32:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFBDB10E961;
	Thu,  5 Jun 2025 18:32:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RAU+I33u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D172210E878
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 18:32:30 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555IEkGx004284
 for <dri-devel@lists.freedesktop.org>; Thu, 5 Jun 2025 18:32:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=pRucYDqGv/m
 aZtfEL5JUnKr0yOuvQGJ3l3EY7Z9RO/I=; b=RAU+I33usmA4f5r8pB/+83MjQkd
 nKgsaG2tXLsDYbppqPQXrhFQ9cEOS3ywU/JfEcPn+zjix7z2kjfQelMFU2j74uQs
 WEA/QJWQLT8jZHTTf3FivbTD81qu0lJCsAxVd0myzt53FUz2AGloc6iT/38hTF5b
 zqGtx//1a3B1gKH6HLqgqGVQBancscjVIpqlRmFjuch/EFy0CJ3QZ7AeILzljkv2
 tPjht7o4fWU/Mx5i8oRTR+WHjRUqfQ7ywMMaNclDNB93Q4lXNA6Ji99IQEHSYSI7
 IHXDSCx38TBNVsdCHjhUzCoQ+dGwAewCnnwFGaUZ6ruPo93RoRS3lrqmExQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8s2c41-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 18:32:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-235dd77d11fso12141265ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 11:32:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749148349; x=1749753149;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pRucYDqGv/maZtfEL5JUnKr0yOuvQGJ3l3EY7Z9RO/I=;
 b=meI1g9r/7eVDSO4l1B3XNaxjQvgtJJ1W2wofhN+Z5UC6yn4m8ahlJ4X30kEplY9lJL
 wfUzxc9dG26JpIUekbvcc1rvxUW2NNt9ORJomq7Ww41yhnh+Uy11D1jkLM1Q+VZ2l2iC
 AoSMxSTx1HelrKbgyPe8L59zD3E9C9FHm7DLwqCmMBLUoZUam3VVKQQVZUUuBBttK1An
 LuKgt7bd+c9XzNtLSDoQ0Mpf4bTbu/C0Ym9AvouEIswBMU5zaY1/3RR2ZphsJmuTUt5X
 kD1D1+PKYBBC3hcustyQvQhSywgEyyJID0M0Pgu4ziWtl0zRgno44QSDCBuUUQ/O+Foa
 f6Cg==
X-Gm-Message-State: AOJu0Yz3Y7U10Q0+IN5xUrYfzrvvLG6qc5SYJwTkHyst1L5mMg0MccQb
 +6zJafvezeU3nkbfkfIy6ewxaDeXX1QGle74HO5vUcQRUJ9a4gw5BiNDG44X+GPDGW9iADlRCFW
 wcIwtRJefezgLHGgdXczwoPBnQt1U3QmuHiYX1I1MHXsDeyNhW5Z7AxK5Ip9QTHYZAQuLjSVzA7
 ZB6kI=
X-Gm-Gg: ASbGncujOrmUoOE+MkhxsQlPgUIObdZ/4YylEGpz65xwHH8tqifJkWSEBF2sK0BBQek
 ssChNTLSbpD3MslNPLeMZYZ5/yKigjsCD4zgGa1m5CFC5dqJDvDdQOnRWrfoCtS5B7RFaUEzSDK
 pzO9bW1DBL6aCPzklSTvEsVtiheFp6RxtFsPoMkU/w2r8ENxeV8+JxMYvXcwu7svzFxbmK8D8VY
 qeH3YpC+nI+/At0RtjrxiB89jeAU71qov2h7GLDUQK4+Nlb+SDP6rti27N3E2PawCrCPgjSPa/9
 OO30UqVU9L8VsO/pTRpEkQ==
X-Received: by 2002:a17:902:f70c:b0:234:9fed:ccb2 with SMTP id
 d9443c01a7336-23601d22bcfmr6076355ad.29.1749148349354; 
 Thu, 05 Jun 2025 11:32:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZPYl3bi4wrAR9P4qs263RGT6xV2qooQoNsSl5TQxnW+d38CFd1PSGOkF9JdpsRdaUXFkAvA==
X-Received: by 2002:a17:902:f70c:b0:234:9fed:ccb2 with SMTP id
 d9443c01a7336-23601d22bcfmr6075895ad.29.1749148348947; 
 Thu, 05 Jun 2025 11:32:28 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506cf47c0sm122361975ad.175.2025.06.05.11.32.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 11:32:28 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 07/40] drm/msm: Collapse vma close and delete
Date: Thu,  5 Jun 2025 11:28:52 -0700
Message-ID: <20250605183111.163594-8-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
References: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 21WzS33x8xqmoXyf6m0WXqGccwZI8o-H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfX38MN+AcITYWn
 uvf7tSUnkE9uUbtsYy6tCIgipmObvhHX68i+RqJSRfeknYm3QvwBTgqjOI6+eKqsR4PVi+BefTB
 5Fhy98TUc4dxLodhg/fLi8Zjwe+WKu4K+4Qzp/fdHUK1mtKSPkBG+L8eawwrqJgOO4e/bhyH40l
 yo0RMzcbJum/E/2tvj/7VL2sm3N1KXKWN5drkZpNu9cxH8AHt5sSBqgHoKQ1A2UvQAC8CR2GVgn
 6frPjkMwvj3nNAEg6QdOBvyIccQwDdcuBrSrGQRE7EwwVe/Kd8y+XCrspmI2LZNnl/X/YBZV32L
 1UDj44K1zPCdcepyAch+W26DDJdOF0rDabpJ8wH+ajM2sqYkfxYvIpRvB3mZ58TKvwlIP3r8A5z
 QVzNk4pvhPhkjqlVS6s5noAVZhSrSoStNXthakj1q31/ThyrzKwNKHTSiZaDYEy9XcEitppC
X-Authority-Analysis: v=2.4 cv=RdWQC0tv c=1 sm=1 tr=0 ts=6841e2be cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=RIvuzEnNBJp2qadMtJ0A:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 21WzS33x8xqmoXyf6m0WXqGccwZI8o-H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 spamscore=0 mlxlogscore=984 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050165
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

This fits better drm_gpuvm/drm_gpuva.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c     | 16 +++-------------
 drivers/gpu/drm/msm/msm_gem_vma.c |  2 ++
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 29247911f048..4c10eca404e0 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -353,15 +353,6 @@ static struct msm_gem_vma *lookup_vma(struct drm_gem_object *obj,
 	return NULL;
 }
 
-static void del_vma(struct msm_gem_vma *vma)
-{
-	if (!vma)
-		return;
-
-	list_del(&vma->list);
-	kfree(vma);
-}
-
 /*
  * If close is true, this also closes the VMA (releasing the allocated
  * iova range) in addition to removing the iommu mapping.  In the eviction
@@ -372,11 +363,11 @@ static void
 put_iova_spaces(struct drm_gem_object *obj, bool close)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct msm_gem_vma *vma;
+	struct msm_gem_vma *vma, *tmp;
 
 	msm_gem_assert_locked(obj);
 
-	list_for_each_entry(vma, &msm_obj->vmas, list) {
+	list_for_each_entry_safe(vma, tmp, &msm_obj->vmas, list) {
 		if (vma->vm) {
 			msm_gem_vma_purge(vma);
 			if (close)
@@ -395,7 +386,7 @@ put_iova_vmas(struct drm_gem_object *obj)
 	msm_gem_assert_locked(obj);
 
 	list_for_each_entry_safe(vma, tmp, &msm_obj->vmas, list) {
-		del_vma(vma);
+		msm_gem_vma_close(vma);
 	}
 }
 
@@ -564,7 +555,6 @@ static int clear_iova(struct drm_gem_object *obj,
 
 	msm_gem_vma_purge(vma);
 	msm_gem_vma_close(vma);
-	del_vma(vma);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 6d18364f321c..ca29e81d79d2 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -102,8 +102,10 @@ void msm_gem_vma_close(struct msm_gem_vma *vma)
 	spin_unlock(&vm->lock);
 
 	vma->iova = 0;
+	list_del(&vma->list);
 
 	msm_gem_vm_put(vm);
+	kfree(vma);
 }
 
 /* Create a new vma and allocate an iova for it */
-- 
2.49.0

