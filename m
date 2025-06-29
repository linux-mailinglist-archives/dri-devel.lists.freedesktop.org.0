Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6ADAECD26
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 16:07:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B48C810E2A9;
	Sun, 29 Jun 2025 14:07:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EJLTgvGv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9883510E221
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:35 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55T5w7ZZ001630
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=gBDfAmEkonF
 ZxrTQANE1o507a0jHlpQ+o9S1Q9lveGU=; b=EJLTgvGv7cM4pboAKIJUs/p0bC4
 u2ueRvFtICLimKNsS1h/VIeJUofb1d6od40yXmuGaEkw9HhzltPfGUbz6+qrncCv
 MiszvmyK/rZ5XIGyEU0XXxqNRXbUvyd+s9SjSV8MC7QQUipnzfLrBHm0rNZ6tfOO
 xT5z9oH2sFLbvpauyBPLWnvOSigzOT9YwA385m1jRebwmExy7S0NT/giJ0ZdF5JE
 DWctCccqYpzUNB2LK5fXsClVcbFNzuWlSiKqEQDqSpINBxTDB1k5pkFR4UiFytIL
 PXP9rCvvabH8QKuyaqoyei5woBqhITCbonti3xvNHvbJF2fny29dW2RwqvQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvj9qs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:35 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b31f4a9f67cso1944925a12.1
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 07:07:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751206054; x=1751810854;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gBDfAmEkonFZxrTQANE1o507a0jHlpQ+o9S1Q9lveGU=;
 b=rp2vN8qmcFOMt7pkyRH42wzcaZzwN27+Jyao5a2/bZWuH0yVtu01p3lNODBSSSxZ4g
 TAJ/8MUQhLk/64A6Ux2N6x4kkcFIMOYfKHJ+ZTL12NIoGdjytwmikCldvaDrpCM+JwiL
 vkNY5rLfxrbE5s7fy0A5slbRgfn9uGn1wrv0BOA/wsXPmA0YltrkM1tfFkDxsWf6CBYO
 Y9fN6yojKdTBTyH6OEa3WJZ8hRBiOuwxhjEP/hJwIdJHQTnETkaSkhS8kYdlU/7rnUvn
 L45Xpt4QyENSgJSVqna7rQFU0fIXlpSlvF+tSnGlbkdczMGIknxQtcNtCl7uGRn3WC2k
 9HRg==
X-Gm-Message-State: AOJu0YxP1tbroLR82R6v4mlVd0YdwXV257xJQVRuQ+74pckxPowdJc4D
 E1k2icaWz2L//GUZFUYynZxN5K0wFvf+05jyHv+KOy+ivBAwtMw5OdzLQmzpRfnckruP8Lbpr/Q
 d43+2A4wqB9wbjqxizKb+fe9TCdwxSF21lh0dfPX7P1L037u2QF1jqvQLDjRwYwT5bU1UPAJQnY
 S9kt8=
X-Gm-Gg: ASbGncvmCOWkxYSYREEGe3LbFCtF47QAZxTVwM+Ny79JfVuv2dHpNB5/7hfi57+27Wf
 ADROQHM/80rwi7sGshBWUVT7GX4t45Vh5EGu1dIJmfJviCDhXVHxq5k8tcRhOCuO9vQLuuY1a3n
 /GcwgwMiIDxH/Y5vWszwzQMulw4OZq6FD4S1YeW8Lko+EmIgzoxpPgs5jLICQpelcUYKrdyPKQu
 gc9brk2VmZsiRm0v3WnTkcoS6mx8pna4zhFnpdl9QsbFWS+1/glf30Pnhv5HjCXOj5YoXs5p9aA
 8QPcfgKPOym3kE5Xg3l+9Lp2KIzlVuL+
X-Received: by 2002:a05:6a20:a11c:b0:218:59b:b2f4 with SMTP id
 adf61e73a8af0-220a17f7369mr13582079637.42.1751206053812; 
 Sun, 29 Jun 2025 07:07:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHU+uDb51M4Be0+7RJfEMhzdKWdXH2VX5GhX5PZfc1zJAcJo7bdy/zfcmW3N5NdF26UuMWOGw==
X-Received: by 2002:a05:6a20:a11c:b0:218:59b:b2f4 with SMTP id
 adf61e73a8af0-220a17f7369mr13582043637.42.1751206053451; 
 Sun, 29 Jun 2025 07:07:33 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af54098b9sm6581953b3a.33.2025.06.29.07.07.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 07:07:33 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 12/42] drm/msm: Refcount framebuffer pins
Date: Sun, 29 Jun 2025 07:03:15 -0700
Message-ID: <20250629140537.30850-13-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: elUEEXouwu62YbU-bXaFGsyZla1C4AEh
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=686148a7 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=MhmIxDhvR8qEtQvFyXAA:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: elUEEXouwu62YbU-bXaFGsyZla1C4AEh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX+u+SCcBuR7cE
 nPRJlDNIlLfuMjOnXYK5xU4BTwTBiguBKrtXkvDEmLI7/nL4fkbfUyx8CAXlfq0V0ryX6hCBH3n
 1S5R5cvMPuTqmYSrfO+XDZt/7uwP/Ik7GcQAA2KRK07iGbk4v2tuxyMjM5Z2QMhCp3m90lTHSXy
 9apXibY97d2cUn3/MVyYvKRkdWnM+Xf664XMJrWjrgpmibxH+0ESksGwCQR21D03HZPUDxJVHMa
 oPYvUGY8Z8DygvOtuOPfNjoDZjEJf7YkVmpQCfCGLGLpZFhgkFHK66HsSkB+jJ2PJsJhs4/dBGY
 gxiQCUEwbfpUJI966Mo58bN96txaXATf25SSLDf7vbnQ38J35gGeGAKoHIp+xAMGym3bSlXBbW7
 +Ug3j0kD1qFDgY3WVBQQv3dPmtd9zGDPspxbcQEOFVm9ZdSAUX9WYOO6vXPTv1nGRRKC0qAo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290119
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

We were already keeping a refcount of # of prepares (pins), to clear the
iova array.  Use that to avoid unpinning the iova until the last cleanup
(unpin).  This way, when msm_gem_unpin_iova() actually tears down the
mapping, we won't have problems if the fb is being scanned out on
another display (for example).

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_fb.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index 8a3b88130f4d..3b17d83f6673 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -85,7 +85,8 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb, bool needs_dirtyfb)
 	if (needs_dirtyfb)
 		refcount_inc(&msm_fb->dirtyfb);
 
-	atomic_inc(&msm_fb->prepare_count);
+	if (atomic_inc_return(&msm_fb->prepare_count) > 1)
+		return 0;
 
 	for (i = 0; i < n; i++) {
 		ret = msm_gem_get_and_pin_iova(fb->obj[i], vm, &msm_fb->iova[i]);
@@ -108,11 +109,13 @@ void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb)
 	if (needed_dirtyfb)
 		refcount_dec(&msm_fb->dirtyfb);
 
+	if (atomic_dec_return(&msm_fb->prepare_count))
+		return;
+
+	memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
+
 	for (i = 0; i < n; i++)
 		msm_gem_unpin_iova(fb->obj[i], vm);
-
-	if (!atomic_dec_return(&msm_fb->prepare_count))
-		memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
 }
 
 uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb, int plane)
-- 
2.50.0

