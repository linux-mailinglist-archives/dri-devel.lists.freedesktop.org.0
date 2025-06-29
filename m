Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFB0AED05D
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 22:16:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5880410E0E4;
	Sun, 29 Jun 2025 20:16:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="B73z6o3N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B949710E11E
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:18 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55T5dZ60002037
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=eRArZHg5kja
 6OQg/YP1uRgtCqLo62Lhjfwd+5rkVLKM=; b=B73z6o3NUOnTBeLRUz/v4CmCQuC
 NG0NvTygtQIVavwWwnSyU+uTSygQRtJT5ZZoQXGzz83y7ou/2k0HwoL0MboB2Hq6
 COEAlCbEjz/+hUcF64VO1IUF4pktiFoPpWxBerjO019dh06E8Gjtur8f4ErBeQiy
 CDIN18t6q/1/2slPbQrTJpzHMu+dGxmJRUDQEVbUHfocOyDpIoaq97VkBrky8R+9
 19/Tn43glh9WVt9wJzVC/9YAdiq4AM+L8uxkNE5kA/J8CpKCPs9zyiKMvfe8VUPk
 VCmCEn7B+XGmnU9GnEKJ4/SE50uQcWQku2UQ1UewhRHwJ4gUIh0WAldycXg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j95htk4p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-235dd77d11fso10449245ad.0
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 13:16:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751228177; x=1751832977;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eRArZHg5kja6OQg/YP1uRgtCqLo62Lhjfwd+5rkVLKM=;
 b=d2SpGgS4UAYPhUT/27Oab3Wz7uVRxa+DelBxL3NWIqAxKIGV0LUtZxG3p6WyMU8LLT
 r/+aG+YSw7APsS1JmrJOSKwZURqXOLAU33RBGgqpov0GUcExvqOAKNEdEvrprTJMEpj5
 4gTcmBzXRZmRtIlFZ9w7o83rTkxOegh2F2VrNqab1a5CC0dpo1dN2NLfq7GDLn8ikkjX
 FQOsqovP20h0TkBwcjE0Jcp6cuI+Ovhpft6ZVGgTBFjsskbbpIv5hYHflbgLKpY+wX+o
 b7eMr+5pDn/kW28Ugxs1lmcSVbHXOcZvOwM1e66EpZFzySZgYfQL79+HjAGAinr/IszD
 aD8Q==
X-Gm-Message-State: AOJu0YzFoecBIl5CvVz2eA6Wfx78K2uWP376UzLt/Z57Uf4peXcHOba+
 ErM5q2q6cPw9+syUxyY8CtwwS0SNIoEzDZcpU/MNAfbf6rYb8RaOYYFtipoc1VTh24rar3wkMtj
 Yug6DmnNyF4mgDiVEgTZftb2FxqwTWsLTC826SWyZx8ZfjWgKKZo8PakU4nADS6VvE6ILd1ZbE+
 a9Tqo=
X-Gm-Gg: ASbGnctlT17b9j0uaZ78CQO/m+8jgM+Um192HxjWzCQ5WBVtqKX/xjl1BZifptAwBu+
 xGj1NNPY7C+IgS+TfI3DRaX/AjnKInR7WJjzBiJcQQtjAAzQH18SIH8RJGv9p5a0iEBFTDDyLao
 1vQm7WGkefaUOGxxFw2C7wnz4klqynDMdIwVrBtocNlD1LzwYiJdh29PbCzlLIaQcRzKWdzc/L2
 0t3CM2JsAz4ePQ5gqBLlNAvOwzJh3MNm1dhMnTZ3lflEE9jwnmHFAOUtnburPFTTwUpRrvcM8pX
 5bTZ8gwXrXSYMLgD9phcK8rt+SuBwt2ogA==
X-Received: by 2002:a17:902:ce87:b0:235:7c6:ebbf with SMTP id
 d9443c01a7336-23ac46342d3mr183275235ad.35.1751228177200; 
 Sun, 29 Jun 2025 13:16:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtZqvQxwClmeSyChDksjaanlaNbbsqfLSli1B/K5dWQvgddHns82/yR5/PricjffDUOwiSEw==
X-Received: by 2002:a17:902:ce87:b0:235:7c6:ebbf with SMTP id
 d9443c01a7336-23ac46342d3mr183274885ad.35.1751228176702; 
 Sun, 29 Jun 2025 13:16:16 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb39bf26sm64300085ad.107.2025.06.29.13.16.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 13:16:16 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
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
Subject: [PATCH v9 09/42] drm/msm: Collapse vma close and delete
Date: Sun, 29 Jun 2025 13:12:52 -0700
Message-ID: <20250629201530.25775-10-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MSBTYWx0ZWRfX+0Ps1MxeGy4J
 ZAk1s52E/zbRkJdOgCCgyiP4DDriDPYYDtpFJExTnECj2jvg9x74EI0SFira2208LxKgvwgYtzE
 oj1DmpxpjK8c7/iqQIYi15qdPQ7Ipqknpke0siR4R/bW7AhKFLKogjRgON3xSxxABq1BfN6Jnzh
 XA8jlSlYjOlDheSx5aDwbJp76gA7mAhxBByviok4BHbpZ3p8sPuJelBxWiSx5vhk4HnJ9SeuKoQ
 OuoyDbbIqkiage8zE373WeMqKwAsWBE9WaR1XIUWOePmfymRK5yMCgxT6br/qC/9aitmuT308Em
 HHy14r1Sl7BXnTM29rhG+W7NrId0ABsUxzhRWuHVr3F1QM8GEWy9M2W3tjKMQ7lxNYo1GMR+wBP
 pWc+fyql4b4ZCgj92tCDjDf/z2TaSVXPgiwJu7rq+X/D+kNuWLA3vXaV6kz592R8F8V84j8g
X-Proofpoint-ORIG-GUID: jlWW0nwKE7_hXlUMUMi3wf2u06KQD1IM
X-Authority-Analysis: v=2.4 cv=EuHSrTcA c=1 sm=1 tr=0 ts=68619f12 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=RIvuzEnNBJp2qadMtJ0A:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: jlWW0nwKE7_hXlUMUMi3wf2u06KQD1IM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=990 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290171
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

