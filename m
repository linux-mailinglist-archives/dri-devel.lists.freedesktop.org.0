Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E09E8ACF6BA
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 20:32:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A7C810E8A8;
	Thu,  5 Jun 2025 18:32:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oLDwzUCy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C3AA10E96A
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 18:32:50 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555GxKxd004238
 for <dri-devel@lists.freedesktop.org>; Thu, 5 Jun 2025 18:32:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=BEMRIRtPgB7
 xj7eLCSE0ieGk3YZPnc78Gz5XX/Mz3mY=; b=oLDwzUCyVCYeLYOHG2XBA209dTT
 ReThbQhzhxZSY4hH7BkyN+uKBchW68D7jC2DHKFOGc9VT+CWaWW6x2XIMHHPM1sj
 C3PgRM44WTpZoRW/bWD/+AyyiofyH+Cf2A7FE7pvAkynok4XyfWUdXr0QswTRCBb
 1xW01ojnVMoCvmzEOJsq2tuMFCCsssT09JwbgQ4/I1AjvrSbYf62U8wpJrGhlj53
 m9Qjb3aniJJsciAM02OlBWI9MxF1uMXlGtFlzGKJoIt54YIYoxoYAh70LhS6DyjO
 UiR3jDbHmkbc92Q9vx5ks2zFoobl9kKLjh3f5Rrdwnw9mwXATV/LLTf/QAQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8s2c5f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 18:32:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-234906c5e29so14797985ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 11:32:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749148369; x=1749753169;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BEMRIRtPgB7xj7eLCSE0ieGk3YZPnc78Gz5XX/Mz3mY=;
 b=qnkVnustS4cNJWUZ6ri+Jgc4KnPn9qQyHcT9FdLwVF+sLZkHkWGHY7zd6egKlZkksv
 2ZELRpkvQhjaF9R5vufaJg5eukLgLA3JHZUUxZ/SJFAPD2zIRbryEwWcKnazAIRSC6TN
 t173wZEEBfdp4d+8NwBFEbiLrus8/zaH5/A5xgdLb/JbncX1zIuDY5Gys9w++6uCM7X7
 ADHX+Y4hFC59XXKgcUrgZp1/MJIn2GWBHN/QFdPiuwBFhhWo8WXnbZ8pEfbyim9WSNtQ
 cLaAjmgRNng0B5DTqmsQo7osoUxs4SD2VAP+RjZZxbbZPxWqL2Ze7+ZEW8IB1rUGoqi6
 Fe2A==
X-Gm-Message-State: AOJu0Yz4h0/SiOMhsb8R32VlMaiVdDy2hjy56k4yTd5I23M9uXxWZdmd
 JHHiTF+rZ2m7oKEbvgtesbbfmMA4/YKtEpXfeV0LmGqFsyShvoYMi7EuQ63Tuy3smvAqAPAUxhw
 /V7Ee+1wPy6TG0zi9AJe7XlNPt12bGFgxfl0Shr4c1C9k/XPqjRVzhgemf6kZKNypO5odpRmcZU
 G7zew=
X-Gm-Gg: ASbGncsk+AP2okcWQeRCr0OKWcRdfTGyihFRKtbVLbxefNdiUMUJyqhWU9PJsycEn+X
 CX/WoYh5RMV6xe++FmWqnH8mgWiosfvXOAVO2pq9XptVU5JvIaN7SxMedlHUBR63WGmLOBjSinV
 I1BRY1rBdz2rU8Imtu9AiMcup+Gf6v+VVX1m7Ya0vE3bB47wxzDmip2eGMyY4qGsdmyBle4ASPm
 XfmMnrwR3SvN0CUU0ymFwyxmgBRReAPvovzpJh9Rv+87ALCe9p47pgeWNYIpHcoh0a24V5dXxIu
 IbseNRTYgdE3aSQp0OUxl1Rex0fxZ9Hu
X-Received: by 2002:a17:903:2392:b0:235:1ae7:a99c with SMTP id
 d9443c01a7336-23601d712a6mr6064975ad.32.1749148369019; 
 Thu, 05 Jun 2025 11:32:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYILqDVPmHZvxHv/qNui1W3IQVf5p494cYJFRBE2nev6jIvXhPxt31NUKQzkFHvGjIuiZeCw==
X-Received: by 2002:a17:903:2392:b0:235:1ae7:a99c with SMTP id
 d9443c01a7336-23601d712a6mr6064655ad.32.1749148368674; 
 Thu, 05 Jun 2025 11:32:48 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506d21802sm122518805ad.215.2025.06.05.11.32.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 11:32:48 -0700 (PDT)
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
Subject: [PATCH v6 14/40] drm/msm: Split out helper to get iommu prot flags
Date: Thu,  5 Jun 2025 11:28:59 -0700
Message-ID: <20250605183111.163594-15-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
References: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vx7L6Cn5dCkaCfNTuZqLEY9qZLkShyQl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfX1KaWQzHEiOsg
 zoiSJLoqSEHXsfpCnuqiUli8qrXe1vraz7d6Xs/51sPB7YDdC+HxiBwLFyiOnIBSfyF3C3pDn3T
 cmwTzBv6TZUvtHTEjU0wuydkffAbfKAsPIvSoaRXMIpaKdvESo5GQQl2Ai95cWQdDJwU/Q2JfRA
 CqI5mqWxW84JvOTP8QdM9GIPuTOP6JrNxejoOK64LgnOPXwBBxd7lS8lQnx9ybYDTF49bGz8639
 p3Jidtfi6zN2KGnT/kmEt3jITbenLKoV26vBLr7JLc/D3TFogL1ZC1d7IwoIaFPZeHE/kWrM+7j
 DS2n16up/G3D3nYinfp/MqNRuhy/GqvRDkaZIsIEie3EG1YYUBA6WxfeeKpBE51Jf9fB3LRgJQo
 DYdR+Yr7kTdZk6d6+Uq0seGEGfMB4D2d1G7B+ThPMs1o9RmPVnGParjfISydhLQFOjPe2dvU
X-Authority-Analysis: v=2.4 cv=RdWQC0tv c=1 sm=1 tr=0 ts=6841e2d2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=isCY8TonHXl0-fnU9HAA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: vx7L6Cn5dCkaCfNTuZqLEY9qZLkShyQl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 spamscore=0 mlxlogscore=999 classifier=spam authscore=0
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

