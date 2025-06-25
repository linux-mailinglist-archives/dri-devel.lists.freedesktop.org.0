Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E83AE8D5E
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 20:58:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6B2910E7CD;
	Wed, 25 Jun 2025 18:58:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HQ2KRNFV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AAEA10E7D4
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:49 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PCa59O021079
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=BEMRIRtPgB7
 xj7eLCSE0ieGk3YZPnc78Gz5XX/Mz3mY=; b=HQ2KRNFVzgHdRLB15LaR2n7rCIq
 DnEXyjQAhx7gJdmYIYh2GKjQ72x1vtNs1ah96RWUMn+XgPLDT16NMrBy88B8Dz19
 ScTYonCVUsUfs82L6rHD7zNJTcVlICjfAeaN+pcXrDvVvzQux9XOHol9Vvaw/JSX
 VJYvdAhlwBtE3oHVYb1GffkqyDr817jEyY92gnPcQaGcEV7E1kVvh+pwxCWxeFWp
 wXQIiPl3tmipsXWYY+kLceU9u64Edc9V5Lwwxdch5BlJqfQ72s6MRGBqTnna8T7q
 JZzhttO741kiNWreYCw+WKokD24+5RumYjxNM4/QLsFbdzmv63xfkro361w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b40s2p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:48 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2358de17665so1743035ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 11:58:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750877927; x=1751482727;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BEMRIRtPgB7xj7eLCSE0ieGk3YZPnc78Gz5XX/Mz3mY=;
 b=HYg7ELzxtEb6ajT7hHyfGcQDk+C85QxtJtZKLPXn7Azi0CZ7UlTfPTMM1jg4frWjh5
 npXQUFy7N6FrQQ54XETvEgly1DCestudQ4Lh/mCPzpzq0lUGb/fb8wZBFb4BuKpOfqVM
 2Amw44U16R7phvzLJpBM3/hkoBtaKpUjOHaNwAVd3kew7V4JbB7620+BYZtiaIU+9PyH
 +mXZIqG8JnozEm0bNoRuEfdLSZDI24qrkuhxsuO3Z7J3QNZLSFesm+DtPmoPxfYcOiTK
 bdgGmCfZ6wheWjJugmalI69d18O4G7UkK8X+cyf9w0LNiJQbzyfierwYefEE5vugYJCq
 uy6A==
X-Gm-Message-State: AOJu0YyQ9wqmNH/C9Svbn17OxXeMrVc9vIDfK64epGlN0UE4g6zS2FfY
 X5yWO1zqRlq/fwQpF9XMdAGuysFUdfgqXkWwaEU2ADoYqecPlwA1f5aHPArPiK4CDbCJPyQ58Q1
 Kxg1as1cBjD+x8dwleabqivVNlVY+fv96HJq/drwW28344PKUOTVOL6X/KyI2M+nK6E7PY/IwW0
 /H3c4=
X-Gm-Gg: ASbGncsoga5WUzocy6jiPvkkmB9doLST3OAC37VxGgY8tZDGJGi6jCYLhOQ/UZQ06gi
 FHdBT4KJFcz4g4OXbk9JobVWx61IEMMGd9jp3dqzooGW1SbJXG/7XvnUA39aUrCBbtW5/5N0ru4
 Ut77xqzdtBHyJsKZXfEfh8YfQpOsewckCr9JV3zRydfWiUYYi9AQv+yLsxhl8+8wq30N6kOUJJg
 PI8T1HOueYEt7VxE5nbzVPyWVHkSDnIa4DKn8o6tWa203Pi9QOx0pMJyxwrWwD/mM4GlOeSKt+e
 Dh3SPeFrGirwGny5aQ7+nzbZumA0ENE+
X-Received: by 2002:a17:903:228a:b0:235:f70:fd44 with SMTP id
 d9443c01a7336-23823fe14f8mr72556765ad.21.1750877927353; 
 Wed, 25 Jun 2025 11:58:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFuXPf9rljBk9fO9uMHuDT5eLJ/AwD6fL7woWfRkVupOMVq+NgBkPNYRPET7WG+oVc3xFc5Q==
X-Received: by 2002:a17:903:228a:b0:235:f70:fd44 with SMTP id
 d9443c01a7336-23823fe14f8mr72556455ad.21.1750877926896; 
 Wed, 25 Jun 2025 11:58:46 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d868f878sm144060625ad.184.2025.06.25.11.58.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 11:58:46 -0700 (PDT)
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
Subject: [PATCH v7 16/42] drm/msm: Split out helper to get iommu prot flags
Date: Wed, 25 Jun 2025 11:47:09 -0700
Message-ID: <20250625184918.124608-17-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfXyWMpS9eufU9d
 0lZdh7M1tamFPiSzPHo6V/C5X4Auz2LvZtic4pdadTLxFYgEQKnBFg7JQ3Yb8B6cH/v7d5NLZJf
 MMpbAvba5K18+thwIN7xSfUTHnb952K7JBdS7NYxSfvMJDXSEFB4Sv5RnSFLY2x7L6kCs/4TUSY
 zDX9rqbMYiBQ0/dXz1/9SD916P9EnWS3OQ8A0QNGV4jVFWhv+bzrE2aE05w75Cj6V1NJ5YKphNE
 orTYh0Vwxz1xG/v1Laz1SLW1r2HZSZNFsks56rVfH77k9lBm9TjAbvf7pMj7bkGOvm1cx4pC8+J
 wSk13BFPitRqv23BcSRxaFU4TkiK06+o1NXfW8jD2f2Pu853xTA3b+NOhArNBY0fmFMWrh0R3m9
 7BHzUVcBz7ExKuX30IPpLpXV/+WbYyg2TR8AK7g2N/xOtHRBH5n+ip4mc8gT0DYrqQCy1Eh8
X-Proofpoint-ORIG-GUID: fneiYrr_GgNfMWPHfoqtKefl_dUKrgMc
X-Proofpoint-GUID: fneiYrr_GgNfMWPHfoqtKefl_dUKrgMc
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=685c46e8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=isCY8TonHXl0-fnU9HAA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250143
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

We'll re-use this in the vm_bind path.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 12 ++++++++++--
 drivers/gpu/drm/msm/msm_gem.h |  1 +
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 87949d0e87bf..09c40a7e04ac 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -466,10 +466,9 @@ static struct drm_gpuva *get_vma_locked(struct drm_gem_object *obj,
 	return vma;
 }
 
-int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma)
+int msm_gem_prot(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct page **pages;
 	int prot = IOMMU_READ;
 
 	if (!(msm_obj->flags & MSM_BO_GPU_READONLY))
@@ -485,6 +484,15 @@ int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma)
 	else if (prot == 2)
 		prot |= IOMMU_USE_LLC_NWA;
 
+	return prot;
+}
+
+int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma)
+{
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
+	struct page **pages;
+	int prot = msm_gem_prot(obj);
+
 	msm_gem_assert_locked(obj);
 
 	pages = msm_gem_get_pages_locked(obj, MSM_MADV_WILLNEED);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 557b6804181f..278ec34c31fc 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -158,6 +158,7 @@ struct msm_gem_object {
 #define to_msm_bo(x) container_of(x, struct msm_gem_object, base)
 
 uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj);
+int msm_gem_prot(struct drm_gem_object *obj);
 int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma);
 void msm_gem_unpin_locked(struct drm_gem_object *obj);
 void msm_gem_unpin_active(struct drm_gem_object *obj);
-- 
2.49.0

