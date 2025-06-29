Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9A3AECD1D
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 16:07:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9295010E093;
	Sun, 29 Jun 2025 14:07:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MOZOc4dD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA5FF10E29B
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:25 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TCSNFM016710
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=eRArZHg5kja
 6OQg/YP1uRgtCqLo62Lhjfwd+5rkVLKM=; b=MOZOc4dDi1ck9L+QRSsR4vZJwBN
 66eV4YkdpLb9pYkCICHe++0gI4JQ3qi17ivoNbzlGqQmEq0KZtVhP/qPSAI230+N
 g7I9mBAWanm13+hoPbJcgMEQ/7YbZQNoTbQ8OXftnNproAOLI2vBTNGhX0tEpAWm
 WWdQ7ojNKt7IqYLGfxZdoalrUMTNEkKUH/ysVIOI6zA4LO5zvimkfl0smBD2vfhR
 cNWasV/YbqBqdohcaeJZNvsitE7Z11iw+kG/JqR2DCy1fRM8bSsgXVFZK/+TvpDG
 b231lke2FfeELS6npd506UWJFulJ004DvoG4D6bSLL5fFD+89CcJ8y71RaA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63k2e0d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:25 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-748e4637739so2577207b3a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 07:07:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751206044; x=1751810844;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eRArZHg5kja6OQg/YP1uRgtCqLo62Lhjfwd+5rkVLKM=;
 b=wRz/LFTU85zn+TkH33SsnZ2DGqtDLbHZ3ahDiyQU+qpTn5ulBF7IGFp6hTRu1YxkJi
 RJkDqZbncWlfQL+4yim07+oglLqZuyS2Lv3sLZteSJVpUyQC1wu2iOLN5PvnRboABtV9
 D3KQAeGfCLWqflmNpvE5zIvos9PZMJulzJOrOAZ5KJ3SV80bA7k08pGRcQ+gfDlxQdqe
 vjuhFU3YoXVjz8+B9iqtGblPDsZfyM6wYs3TP0Lhl7b/lJczW5PqIKtiTIdXzI57pKSb
 3Uj3lbhsg9P6Aa24Nybl1jn3OSCL/JACPOZYTJhXQim51seN5z9OxhL2pLfL7zLqSAL3
 P0lg==
X-Gm-Message-State: AOJu0Yw1ONRbhAc3Uhxel6JYCCgIHlCNaw4K/aIQsISDTtsz7qMPSjBJ
 Kz9Sa8G5KbDL+l/IwePAptDaoez4ldLhLi4Gvg0sL1G8yQnwCMZaRTSU4aD63CrQzR0l3uIMvPo
 AkH1naSpiruYpVzL+PKojVnPP4zpRoCys1MYiJAfVwCcC94oZewV3qitJ8i6lL1lENWewLkaaoc
 eaQTE=
X-Gm-Gg: ASbGncuIcGtLI4KQWjFTGw2vLvguF+k3ja+enl+RhKjZsyj2sksHPTEOXvYNRK21CLO
 F6QSz5KZv86j2G+zj2b1ZAjMXXcpx0FMvCbpaiWxreHxzziOeDGnVS2ZLkz4BUNn6I34Yw/OcLq
 hO65R0ruGE3d17eHLPsfkGzcZTjYdw/wCc8Z3m4ICQD9uJx0mBrQ57lx/W9QDAan78x09V3jiXj
 ur7mDDZPmdfRQRQIiQICMjCRpNrbqeYaWIPMknbditpkbnIi6EaFkTORMVXBECO2cM3B42MAPbn
 jaH4ap6b56c9AqVG/bU32gTDX9hOYyqd
X-Received: by 2002:a05:6a00:8c8a:b0:742:aed4:3e1 with SMTP id
 d2e1a72fcca58-74ae3e79e9emr15110877b3a.2.1751206044392; 
 Sun, 29 Jun 2025 07:07:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzFoHhs30uufRxyXEDa8GNhAGcI0a2y/Q4jf783ZXcR3TPwpNn70ssWWhJXCFQV5WbzR2gNQ==
X-Received: by 2002:a05:6a00:8c8a:b0:742:aed4:3e1 with SMTP id
 d2e1a72fcca58-74ae3e79e9emr15110847b3a.2.1751206043958; 
 Sun, 29 Jun 2025 07:07:23 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af541bb6csm6705036b3a.41.2025.06.29.07.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 07:07:23 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 09/42] drm/msm: Collapse vma close and delete
Date: Sun, 29 Jun 2025 07:03:12 -0700
Message-ID: <20250629140537.30850-10-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=6861489d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=RIvuzEnNBJp2qadMtJ0A:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX20kgI+QVPM0M
 nQa6ixPv8x69NNWMwWwnPFa5xz3+3eRXcDBZFVRBr592fYMTCbXUa9yd8V/wDwqUTkiBgUGqtck
 Lw8rrTEz5EsKS8ZBsWLKfUFVt83zT1FlfwmAaV82GgAXYjEzuxYeB7NstXn0FPrOjp6jNDbUTVd
 dnDeprbQzvKXoFmcb7m2jvJ91R7pTysZigROmMzhHvrUnN/YkVAYAMgYjhImmNA3sLPbN3YqbRY
 yZG79RAj5cpiaeatnMxpLGOtY2UuM6j1Dn3WA+AOd3FaPtaXwGlcqKWPOYxzLkOrCc/rRGU0w15
 MDKidsMRnjsIYH1M9Z79Lpx9j7EBqH3diMW87nrS1DDdVCUgWyUEak4dHuTPYkrBzi9o1ModQ4J
 rCMGnXN+hb/RzSyZ4+oe8nUlUsJFHuNTaNvVpWkxBiDds3iYrTRzrR8G5sfdoK+anH0Mawde
X-Proofpoint-ORIG-GUID: Q1WUoPLOTcJhIRTzgnA7vuBsEER7Pp6O
X-Proofpoint-GUID: Q1WUoPLOTcJhIRTzgnA7vuBsEER7Pp6O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=990 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290119
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
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.c     | 16 +++-------------
 drivers/gpu/drm/msm/msm_gem_vma.c |  2 ++
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 9fa830209b1e..7b0430628834 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -349,15 +349,6 @@ static struct msm_gem_vma *lookup_vma(struct drm_gem_object *obj,
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
@@ -368,11 +359,11 @@ static void
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
@@ -391,7 +382,7 @@ put_iova_vmas(struct drm_gem_object *obj)
 	msm_gem_assert_locked(obj);
 
 	list_for_each_entry_safe(vma, tmp, &msm_obj->vmas, list) {
-		del_vma(vma);
+		msm_gem_vma_close(vma);
 	}
 }
 
@@ -556,7 +547,6 @@ static int clear_iova(struct drm_gem_object *obj,
 
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
2.50.0

