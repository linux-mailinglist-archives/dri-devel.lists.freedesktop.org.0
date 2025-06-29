Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A85AECD32
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 16:07:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 547AC10E2B9;
	Sun, 29 Jun 2025 14:07:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QPdaBB5h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7727310E221
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:47 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TB0JlG010328
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=F07tE0vJpnj
 OaneIx6xxhc1GKaxYebaabLke4Ul+Piw=; b=QPdaBB5hrC5+N8q6hltq84lHPeI
 Xj0aupFFxgYu9O8n6GvJGuJJMOZ8sWyDulg0DYlfizNU/cII7eGLH1nJ9R1bO/Wt
 EqdF1eymGEPaug/rhx+q56CR1/MKZ24g4I1qMSH1pOcHn5F0422qezn7jtt1tZzV
 wA19yvtexLscyLfDA4TplCkXFUXInYxtQeLa6Kw1/h9A3kX9YbQJ8vEd5FSQXKs+
 tNnP+C83fQCvXWtkPXr9q3bW3kUDCpJ9vLZ07+J/pq7OPCxSD0Zya6Z8S0AO1iN1
 7HsdI9zS7L8Zsau/wEI45fg5Ys4kTzFyXMzOZsFW5ywDiFPP/UrCc9KkECQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9a5xr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:46 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2363bb41664so25719165ad.0
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 07:07:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751206065; x=1751810865;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F07tE0vJpnjOaneIx6xxhc1GKaxYebaabLke4Ul+Piw=;
 b=oZJLtesZjdh5OH1RJs230yc4H1pXlfby54Vb5hgAz0syRG0BhCY2nfGHR5Wq7/J5hf
 RJgmje3sdUOy/cE0Q5MWzbBq5rYWzv3omw1GpyXDIWS/YYxieGUf1rXwnzpJmCeoWqUL
 R1E2zvsj03zjbajTtDLL45nSUIN62RjUtiZmXHqo4tymBK3qWXYst0kyfHPw4gRoeo0D
 5pwRsTGXU1QpkxbAyi6Ov+34soTAZpjtaj0na9ZipKC/c7O4epRhKky9YE8Xp8PnyHrK
 OUg+WClFRyX/Kp+AFneHw7pfeZQ4POkogZjJ2l/ou6E6Wij7b7972n5rw/ARwpEeVzxk
 cdaA==
X-Gm-Message-State: AOJu0YzT78fNaLO4xsglGM0iVZq8IATYuG9FvGIFL1W/liHBoH1yYm40
 77kyPyaHoEqt9+/blnKxgjKOszKAX+b/lROjCL0c6khKsHf9URPtWs4sCCm6tH0vqtpemneu5la
 dPyy+T1TwajYsFmMVLDKyB7Ca5d+TeKVgenig3K10h4n0Ed6jQFimhcQPbphux0lz/rrTLv7sHk
 oyOHA=
X-Gm-Gg: ASbGncvOQo1jKIsapWWLNjBeJdf0SkYAo8y0n8hHR7A3dPpLNOwIqYQzncXraKT/z84
 A4SrAPi9RAUJ/tMOJSEs0rIATErrjgecZTM8/EBXO9Pz5V9HYkdXKKhXX8kIPr84liVvoPiU1Ts
 LUmJc92guDrFh3KbvVjfYSbPm/UiW4XboxCSpujs5Uo1tT1X6snurvQ9wH+82WW68r0uvT2vbad
 QHvPVpcHiW2RlB/01pVOYF9Vv6z4Um2z3vrpcz079IKtUB16jju5Fe9YFS3CTRXeQYu+4ANYv1w
 ONiL9Al6sbuf1zoRdsna45Oo7IVgzB6P
X-Received: by 2002:a17:902:e5d2:b0:237:e3bc:7691 with SMTP id
 d9443c01a7336-23ac59ab6a4mr170031755ad.13.1751206065122; 
 Sun, 29 Jun 2025 07:07:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEU2ZoZF1wsNzdvTcLhOOZH0w2oac4X1cVf9/aBLg0ihQ3Sg5MG0OwPeKZY+JtNgKAyuZME+g==
X-Received: by 2002:a17:902:e5d2:b0:237:e3bc:7691 with SMTP id
 d9443c01a7336-23ac59ab6a4mr170031235ad.13.1751206064693; 
 Sun, 29 Jun 2025 07:07:44 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb2e1bc3sm58755845ad.28.2025.06.29.07.07.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 07:07:44 -0700 (PDT)
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
Subject: [PATCH v8 16/42] drm/msm: Split out helper to get iommu prot flags
Date: Sun, 29 Jun 2025 07:03:19 -0700
Message-ID: <20250629140537.30850-17-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=686148b2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=8Ft5guHMEotweHOT_P0A:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: M2XOaNfvk5HUSzohtKqKl7f7kjaguYTo
X-Proofpoint-GUID: M2XOaNfvk5HUSzohtKqKl7f7kjaguYTo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOCBTYWx0ZWRfXy62Rlixy7SF3
 eGSvyumV6o/0lG+8pI7KtreF9rp8dhe/afrm9Vb6Z1nWG1YkkeXIb6Z7Nn0Ps8TudX4zLXybPOP
 JUh+DSfeMER7/aA2HFF3PC6eEyQrMNDDSS722n5VmVpQTsvuu83J6AKzHxlWYNFszyQYOZguOUW
 KiA55WYJ919LOZO4Sb+P41Y+2B9mjIzm9Gz72zlScCjLJxHL1xv7DNJ+Pp3mI9HJe7HJDgfH7rl
 5nNNd308C9aMC3FSdxk9rlwmtUTlArC88kVAKH/t7Nud1c6P++x40AdzLPL0Y/mhVjQwKSXry1h
 nEn/w5Hod5ZSsrrKHI0YeZbaY6R7Ow8mrjr0u4tEMFDmSSyB6HACo25wvhelpRKrKEit5VHkkNh
 zgj7GprVapku3rtTH67KsN7ria0S660JGOzBdSmSafcvRUdHCc3hwNljb3ZVKOPxnq51ReSw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290118
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
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 12 ++++++++++--
 drivers/gpu/drm/msm/msm_gem.h |  1 +
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 763bafcff4cc..20d5e4b4d057 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -462,10 +462,9 @@ static struct drm_gpuva *get_vma_locked(struct drm_gem_object *obj,
 	return vma;
 }
 
-int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma)
+int msm_gem_prot(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct page **pages;
 	int prot = IOMMU_READ;
 
 	if (!(msm_obj->flags & MSM_BO_GPU_READONLY))
@@ -477,6 +476,15 @@ int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma)
 	if (msm_obj->flags & MSM_BO_CACHED_COHERENT)
 		prot |= IOMMU_CACHE;
 
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
index 892e4132fa72..a18872ab1393 100644
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
2.50.0

