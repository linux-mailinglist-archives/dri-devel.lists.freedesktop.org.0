Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6188AE8D89
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 20:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 455C510E7F2;
	Wed, 25 Jun 2025 18:59:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fzcpaVVY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D488F10E7E8
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:09 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PBrJPK021010
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=YGw3pq0xuYX
 eB0bxqdCW/EyRGUrXHxJgo02Bi+E/25I=; b=fzcpaVVYOQkPu+AqJEW5xxL+2Dr
 sJP3/k/nXVodPhaR9Z9hZrRWY4HMU8w72ygsq5YB1dpf13DKZvItcuz5f+wAi/VP
 hOkxdqxdmV04cGSmv0e4Ir5FV3NVrrAmO+78pQZnaYgFKyN/+tdvGxwTqxv1cVgy
 I8xv22yU/UiN2LtRjtwIVKf+E+4NpmGe+N/fm0xsD0hk2coNB8Ywp9hChf14zoPX
 LFp0IMswHz3huuewD0tzkhUC3dnTqqDRiqHA9/gc1wIEbt0YW65/VVjz/K/coDHz
 ULLt+3jqg5VHX70xrK6un1LsCfZSL0CPM8mxbFZv8n8PpoqyPCw8Q2jDsug==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfwy7tu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:08 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b32010b3cc0so80611a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 11:59:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750877947; x=1751482747;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YGw3pq0xuYXeB0bxqdCW/EyRGUrXHxJgo02Bi+E/25I=;
 b=C3VrVwLByDlQd/P0orpwIvkYnUyrSwYF7gTR9IKzxf7RVpSq7S6pLGeNhImY+3PdYd
 V/9SeFlWh3HQFXR97105OQkQ9els3js31/byeEWZtavpcbUQICttYp3wdiWmbBvcVAiJ
 wdQscDJ4gFqjkzoZJZ+lTK8pGoWNp29pDBhy8dlaWG+drrqPDjYiN3YVaGMh9Ax+jwQZ
 MNO+FxQUQhRdjlV2RWYXwTZ+/HOhaX0oqQlmyyL5E2bPT5UijHe/WV2qSF/XGX/OwWOG
 efwfC6I86Mc0l/KTs/iLceJDYmW+GhMMXX0bvX1hASSUj9H09NYxZ9PgzwB0tut+v60Y
 Bj2g==
X-Gm-Message-State: AOJu0YxY6SK/a5Rn8fQHX6VE0JVy5y6Ug60UAkx51/TK7OacK55ACvIL
 WFr4iIFS+4FEodhfZeKA/71RO0L+8v7G4kOxQoon0BhQMHn1tDpb3XrLM8btwbcFlSYFIWJUF1r
 gP8oDxthVRzrDsR43Z//nzfRcHoe+bl4TRLz9FSpwE+kiPQrwGYThGlxgerSwQkPrij+MLhoo9I
 u+v+o=
X-Gm-Gg: ASbGnctCCz71zINP+3IUw9OLUywCXH5ghBjPHZiLfpOLh1lGoyo9dfArhXtufw4fehw
 Gua7XrvUgJ0TqIFznAniW1vKara+fK9RPTcxC9sYvkRjFu0GDij3gBiN6GUsoBzavlRdRgTfURU
 yGEdKoJI9cMM5NOAqqEbe9h55YmSw2goKCixmRtM5AKiJXXIdKQRH3ycTFmjSPC82ICnnxTsB8m
 gklOi8u50X4VnEryUqg1hvLXEr2J9YxLBC91W2YCHhmOcIsgqywc/pEHQSVoLYI5RFEd8tJq3RQ
 EmpQ2q/3UgwQ7MDyPWZkjJVy9niJC8nS
X-Received: by 2002:a17:903:2bcb:b0:234:8a4a:adb4 with SMTP id
 d9443c01a7336-238240f5674mr63435535ad.21.1750877947523; 
 Wed, 25 Jun 2025 11:59:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWujkmyQJzCosZxG0/o9huVMzGmefy+6BjUnqrS3MSq6Cgpe4WC/Xv+9jKHpehtNVJ8NIU0w==
X-Received: by 2002:a17:903:2bcb:b0:234:8a4a:adb4 with SMTP id
 d9443c01a7336-238240f5674mr63435275ad.21.1750877947137; 
 Wed, 25 Jun 2025 11:59:07 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d86628ffsm137223375ad.156.2025.06.25.11.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 11:59:06 -0700 (PDT)
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
Subject: [PATCH v7 30/42] drm/msm: Use DMA_RESV_USAGE_BOOKKEEP/KERNEL
Date: Wed, 25 Jun 2025 11:47:23 -0700
Message-ID: <20250625184918.124608-31-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 68Wku6mzb2vSZPVnJGldG5BMaYNHYf2c
X-Proofpoint-ORIG-GUID: 68Wku6mzb2vSZPVnJGldG5BMaYNHYf2c
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685c46fc cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=isCY8TonHXl0-fnU9HAA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX/92nAf0xouAf
 d45ndZ5xgV7xILThoZ3wkbAMrLNmxtA/YVcO6dwYiyPU8U5nwmnSUfa/k0bxExLbuEjFd5p3Prg
 UiH/xOIUMXWkB7DmWfD03WpHZRh8ECU0cw0F51tp1bmzre30lBiouJIMUHyyoRrssGpKrbGOLwA
 R8FxTdM/Dfkd5R4qj+OyCx/ZVWDLPOXturd76botHuruJ1axqQK20qiJ1FXKhwLC7R+2MLSfn/q
 LxmfZjv4phvOgnpx5dCsJlaKR3w6GfONhUcykK0R/gzl4ideS62oPCgS8OMX5N1eWcFNoNlmk5z
 Uwz92yV1/eNluOLqEt+Pdr4tl82syn5DCnd8kJvLenvN7ZQ0CXO+nE4oCFCqljFwFF7GOPBv0/E
 0/RTSS+p5qvvQC3yqLH4m4cED+xuS0xBqxS3yu1lFno2aZbCy6CU+naYQ4rVANY7oJrZ5Akm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
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

Any place we wait for a BO to become idle, we should use BOOKKEEP usage,
to ensure that it waits for _any_ activity.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c          | 6 +++---
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index ec349719b49a..106fec06c18d 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -97,8 +97,8 @@ static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *file)
 	 * TODO we might need to kick this to a queue to avoid blocking
 	 * in CLOSE ioctl
 	 */
-	dma_resv_wait_timeout(obj->resv, DMA_RESV_USAGE_READ, false,
-			      msecs_to_jiffies(1000));
+	dma_resv_wait_timeout(obj->resv, DMA_RESV_USAGE_BOOKKEEP, false,
+			      MAX_SCHEDULE_TIMEOUT);
 
 	msm_gem_lock_vm_and_obj(&exec, obj, ctx->vm);
 	put_iova_spaces(obj, ctx->vm, true);
@@ -903,7 +903,7 @@ bool msm_gem_active(struct drm_gem_object *obj)
 	if (to_msm_bo(obj)->pin_count)
 		return true;
 
-	return !dma_resv_test_signaled(obj->resv, dma_resv_usage_rw(true));
+	return !dma_resv_test_signaled(obj->resv, DMA_RESV_USAGE_BOOKKEEP);
 }
 
 int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout)
diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 5faf6227584a..1039e3c0a47b 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -139,7 +139,7 @@ evict(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket)
 static bool
 wait_for_idle(struct drm_gem_object *obj)
 {
-	enum dma_resv_usage usage = dma_resv_usage_rw(true);
+	enum dma_resv_usage usage = DMA_RESV_USAGE_BOOKKEEP;
 	return dma_resv_wait_timeout(obj->resv, usage, false, 10) > 0;
 }
 
-- 
2.49.0

