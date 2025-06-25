Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C06CAE8D46
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 20:58:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE3910E7D1;
	Wed, 25 Jun 2025 18:58:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ui1VBoV+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7CCF10E7C7
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:29 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PAQvmj001165
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=pRucYDqGv/m
 aZtfEL5JUnKr0yOuvQGJ3l3EY7Z9RO/I=; b=Ui1VBoV+IXmMp6fl+lfP2dmVQoz
 K0nEfJCd/5Zr4mZvaokKx6Fii7Tyn889iyNEhz5PDYfWySxA49w42Z7kHSlXhjTj
 p+TQqBv5MqOxoPx74BjGy0of1mVxkZKb8F5kS4bF1Dzrl8tnl5e7DC5EyVlVQJWX
 cJMEv28as7h5bYJz7ULR7h/T9U8U8uP6b0152ZYXx5MLp2LdCcXRyDlr54LFNpkg
 YDR8DApCPgQZzmoxNKNeYZq6Ec/BC3vHJO0Jx67tTWWcwsYNjSisMtmLqt8x771G
 Dc/0NXGyfZV+cCS3AWSkOTctvOQbTaXLSeUvbCaS6OO+74BA29wSfJIu1pQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g7tdasph-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:29 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b31bc3128fcso226822a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 11:58:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750877908; x=1751482708;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pRucYDqGv/maZtfEL5JUnKr0yOuvQGJ3l3EY7Z9RO/I=;
 b=MGH8ABaZH+rSmRgiCenQbCi5XU3iDLkc3Yn9w3MDXmsmdQL5u9D1LpFElSuf5CaFWK
 qovdyq9pco4d3MKatRr63djG2V3E2zwSJZw7Iy4MTfJ7wmUbwpX1qcfRCxjRlQRu13hE
 pZiZmBTj/mNp3scxIOP7h3Fsiz75boygM1wZGGrmlRn+/dlLvv0qvOXfm1y3Ikq0WcWn
 WqE31w25poFneK+3Ss4YAjHCdCGueBnOKOg5AXB+mrGX6DSFABnR0fq7GUVOCFnPquzK
 MXDntMAkiGuZCyT/2AQzikNU3k0qxwtdZMfR71KoqXLGiefTlKxKUo7H98h3fTpLfq8Z
 WNbA==
X-Gm-Message-State: AOJu0YzfyLVP+aWBWvhyT/rO0xXPPtriicGObxI0qN2ioY8lPb8YvYhU
 6QJ6HHwD3tflVWh7pZI7NpLp4BCc8yma3DNB9DxcsHcDFC6JDI4tTh5vZn0osTGlQT460qiihUQ
 l5PuCW5np4XZnDVlxgBXzg5ibhVkZgc68mKJqkvMF6GmREeFJJU7wBYgbUDk1GifNZb+O6FA0zu
 n34PY=
X-Gm-Gg: ASbGncuBqtK38HW8m7lCUetRMMoDquy+YIfPSbwZ343ATpSYj8k9hsVi/Lwbi9aP1K3
 dT+ZPyBZg7pyPWZIR8wLpzg+jMB160iX13oFbwtU0bJ9JYxy2zfyobdUAwTC+/DIbv+TKC1b+9b
 ctKzZPJ40pF+s1AvKPV97bOjWRX4FNw0kxz+0tC5WseyUHWNi0hSmtISlKPcf35bU3+H21y0CNT
 qe/Aqe4W4+E6N3WY9Tgb9Gk/lPidVQ6df1zcYC+OrW5eJHE7ikc5hCNJKUp0BiDL9ehoGQdl0hP
 Apzv54Leh5jNNkh5dXve+G3pqLTvOWtj
X-Received: by 2002:a05:6a20:2455:b0:215:dfee:bb70 with SMTP id
 adf61e73a8af0-2207f318fe2mr8507917637.29.1750877908104; 
 Wed, 25 Jun 2025 11:58:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOvgejDLBkS6INLNWDK/Gkek/+S3lKYyWdUsJlq2UMYP86RfIoua6q9zR3X9TSiP+SVESMTg==
X-Received: by 2002:a05:6a20:2455:b0:215:dfee:bb70 with SMTP id
 adf61e73a8af0-2207f318fe2mr8507887637.29.1750877907712; 
 Wed, 25 Jun 2025 11:58:27 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b31f118f7d5sm11937530a12.12.2025.06.25.11.58.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 11:58:27 -0700 (PDT)
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
Subject: [PATCH v7 09/42] drm/msm: Collapse vma close and delete
Date: Wed, 25 Jun 2025 11:47:02 -0700
Message-ID: <20250625184918.124608-10-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CPYqXQrD c=1 sm=1 tr=0 ts=685c46d5 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=RIvuzEnNBJp2qadMtJ0A:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX/BpP4tc9EUz7
 3+0DVGgVVl603uwwJmePqMEnlgKVIYxGs3rc/qDUW2uTp3L9b6vwWvnOZOcH/aNItJrR2MHuXA3
 A+fserAr5b+MdVPUTYtsNT8YNUcSFBiUt75RSywy3UEg5o3wSKd2kYaVUzJXbu3McYK3TG/CtET
 dJ8kWhamKuhuQOsoqiXEdRgxWv3ck9OdTkGIzlV3uXX1fS+22pFSYuOibcL4wujnxUANgG+R21j
 jlswaob6SstiEDEA8KMu01Up0JJU33SqH7s13dmo9RbXg4KLlFCx4rLr5IG49nVqe7t10j1f2Xu
 RL90fxGpi/bcCTxh3XmjIldsVX2E3BIU4nSDz5BXjn2gyXzu83kAXTIe+RpAZFBwWrcE6fkHMPD
 nwoVyq0ZTiukLTTSz+Shr4RgN28eXGJoIW4AR5E4P57jzNjZZNqYl6P9KYEyROmrkH8BiX84
X-Proofpoint-GUID: KXXx8lVL0iEoN_f2p3s4DxNQSNeV8mZn
X-Proofpoint-ORIG-GUID: KXXx8lVL0iEoN_f2p3s4DxNQSNeV8mZn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 mlxlogscore=976 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

