Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36258AFEB47
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 16:09:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4480410E7F3;
	Wed,  9 Jul 2025 14:09:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ibxh073e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D87F110E7F3
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 14:09:08 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 569Coi91012557
 for <dri-devel@lists.freedesktop.org>; Wed, 9 Jul 2025 14:09:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=/d3R6mnm1I4BAdLDWhYywDzK+yEimTdQcJV
 Hid63KMc=; b=Ibxh073epcP9IdnE8N2pbRLR1mXt0xUZ+k93DUYGd7b347B/rCg
 fU5ccPD5xgjTmGZz4Zt4n5qNbi5SGS7n/uaqahry7eJ1RpUKASWtE4RYIWi3AZ5U
 V8wD0hbTnRs8XfcHEh3PgWFcLzW+06eCXrw1W4FHMC2Nr1Ese//OwKKXBfIFaBro
 cmjACq9x0lPUjE+MRUni7ZiTGqfIPl7hV4ogSmIBNOFf6zDYGeifKYfojpPkYlh0
 WqQcbj8qCHThegKpMZTD13I49WTE68ucClh8byMil5ljb6BEtQZs6ocvDNzUTQ80
 nAbnlA6neCFC8CJHo6Vivq1fKhViInDmdYQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucn4v2h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jul 2025 14:09:07 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-3132c1942a1so8281990a91.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jul 2025 07:09:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752070146; x=1752674946;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/d3R6mnm1I4BAdLDWhYywDzK+yEimTdQcJVHid63KMc=;
 b=vtdrcN0KmIZpP5vx7HUuSXewXbNm8CUDzCdhu1Bm2oUwCSTmoMHhCXMEzhmglsl21y
 1aQj2enT4XEqUltefyKhYsAoydHU4qw88PLyPN/4W9OwfEDDIZ3KwpjIIaqfTWpCPkrs
 PYjGFqMqqNdfNSLMAeom63f8wRJmtu5zp84efOHiTcU67frqSUr+mwFi/tRykTpsa5et
 t/wlModj/iwPRiO6DR/wuPBlvei8HVpzFnaS9dbTS1E0r+RaKTykjH02IeiFjRcqslQm
 ry6PTfChs46vUdTbyYVsijUAjo/42XgHeJeBiIl4ErjbglHxT1Inn4pME3hfknDidOgV
 z+hg==
X-Gm-Message-State: AOJu0YzagmxxWjBL9CmlZsyGZlNLWN3Hcy6qXiPJwUHdg+sQ/yx6ac1q
 t1HYoV7SBASstoLxIuOsv6QSXMqVJ81mBzqHLNC9AdVDtPRlU354AGdQVmUMNlHnacWILeOrPnU
 d/LP2QuRnCiivkGVJ5/5kVlFIzp1aLx/rECWbgzHdpcv5xqFsvycXsX3+jkHWMBq2etgKprteYy
 wUAQ4=
X-Gm-Gg: ASbGnct5wPEVcB6bKY6xXLTsAhLA4s3Vifqigbhl4tT97BWanqTIqFtpBS2wJ+R/xB5
 ZsxGSxi+p0kG6fTo6l5jXS3UpedQCLKPp9AR8GvPU4qnqrPZwKRhCprvkznJlW1GYZWHPzozsJ5
 5N02Xa/L3p7eqCQlb4fOUOopu6ZYbsHGO0nopyShZCKHN/E8P5ySYRPyL1rXXdZZ/yYeGMu6R2n
 B2c6qAWtdiN0C0zNWqhFZgG56yAz54vrcIpjS4GaIR2HJZwSNUSM1Q/AoP3FkUrDZUs4cWrvbP5
 sXsOVXoZnmfrWcicRkPGRIUVV7kavbsiTA==
X-Received: by 2002:a17:90a:e7d0:b0:311:f2f6:44ff with SMTP id
 98e67ed59e1d1-31c2fdaefbcmr4683210a91.17.1752070146359; 
 Wed, 09 Jul 2025 07:09:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMafukcX25WYJC16FEhi5PetBHsygYdFgLzh1SAK8KFse3W5EKQBerKIx1xEL84lugAaP6Ww==
X-Received: by 2002:a17:90a:e7d0:b0:311:f2f6:44ff with SMTP id
 98e67ed59e1d1-31c2fdaefbcmr4683150a91.17.1752070145827; 
 Wed, 09 Jul 2025 07:09:05 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c3017ca4csm2200198a91.31.2025.07.09.07.09.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 07:09:05 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Arnd Bergmann <arnd@arndb.de>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: Fix build with KMS disabled
Date: Wed,  9 Jul 2025 07:08:38 -0700
Message-ID: <20250709140838.144599-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=686e7803 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=isCY8TonHXl0-fnU9HAA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: YTfmyuYGHsccZIuOD1r4VV8Ut9wcH4Th
X-Proofpoint-ORIG-GUID: YTfmyuYGHsccZIuOD1r4VV8Ut9wcH4Th
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDEyNyBTYWx0ZWRfX+hX9Hxrbx+RX
 fhzpn0rkUUJVZBI/ZKaQVqdqss/qfFT3VdaES5UTDCKvr0mAqa2OsvFgRw5hmqbVaMVtjNTMc/m
 J4zvMyraxzpxBx5Y4bJzfHRDdQsGEhG+EWjghGsBVlqU8uH08zrQ2mEW2vgkU4qgkyTpM2DselW
 XXge/AtYwTHaoywi+AhCwym14uJBC4j7BOKvQrSLHCPlW99P+1J8TIuQE7IEVaXBShXSy1poj1g
 siu+jOjR/GJdwaJP18bY99tOEliYjNJadDdHyOf9WDE9SR/ArHKR9aqZ4kHUOWikFSBYfmR/FlD
 okhVot3okaFbswuTYmG7VYI6/youHqmZmCbXNGZBihc09kFqgQx3OQsLoPWfNsdCVH+5jBrqPtn
 c7oX6hHHSkcLFMU0myaXAYh9tLGUgyeHLsMmTr4+edaumRs49i5EuByOqqx19NEEgmJpdQRV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_03,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507090127
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

When commit 98290b0a7d60 ("drm/msm: make it possible to disable
KMS-related code.") was rebased on top of commit 3bebfd53af0f ("drm/msm:
Defer VMA unmap for fb unpins"), the additional use of msm_kms was
overlooked, resulting in a build break when KMS is disabled.  Add some
additional ifdef to fix that.

Reported-by: Arnd Bergmann <arnd@arndb.de>
Fixes: 98290b0a7d60 ("drm/msm: make it possible to disable KMS-related code.")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 33d3354c6102..c853ab3a2cda 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -96,7 +96,6 @@ void msm_gem_vma_get(struct drm_gem_object *obj)
 void msm_gem_vma_put(struct drm_gem_object *obj)
 {
 	struct msm_drm_private *priv = obj->dev->dev_private;
-	struct drm_exec exec;
 
 	if (atomic_dec_return(&to_msm_bo(obj)->vma_ref))
 		return;
@@ -104,9 +103,13 @@ void msm_gem_vma_put(struct drm_gem_object *obj)
 	if (!priv->kms)
 		return;
 
+#ifdef CONFIG_DRM_MSM_KMS
+	struct drm_exec exec;
+
 	msm_gem_lock_vm_and_obj(&exec, obj, priv->kms->vm);
 	put_iova_spaces(obj, priv->kms->vm, true, "vma_put");
 	drm_exec_fini(&exec);     /* drop locks */
+#endif
 }
 
 /*
@@ -664,9 +667,13 @@ int msm_gem_set_iova(struct drm_gem_object *obj,
 
 static bool is_kms_vm(struct drm_gpuvm *vm)
 {
+#ifdef CONFIG_DRM_MSM_KMS
 	struct msm_drm_private *priv = vm->drm->dev_private;
 
 	return priv->kms && (priv->kms->vm == vm);
+#else
+	return false;
+#endif
 }
 
 /*
-- 
2.50.0

