Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D689DB0FB87
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 22:34:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6997510E02D;
	Wed, 23 Jul 2025 20:34:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TOIBXAyu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F0FE10E02D
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 20:34:07 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NDxGmn002720
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 20:34:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=go4w6pisezM
 +fmrLJT459t96/m/WbzFkmudzTaE8Fpo=; b=TOIBXAyunTGCoyU9O0+JrziAopK
 PRYLvkqmUc4pYsmtcy8e9DIZzT2sFMbuODU/dH6qrA8bArv2OaLkBwrp6CbT2s4O
 ZDF1kSUtaKWmpXXPANSLKjJ4aBWWuE+1z0y2ChxaawQa0D+Q8a+4o7Mfjz+j4oHo
 VGI7CJ2BFfEyMbhoecKf4EyFA2xx8yocvBB9H7GdUKNuT81cTfKkeqbeJd5G5lKA
 KSdGYL8eFSSbTX5Vua7p05Btr8nXas9/aoCseiWKxpY0IVCILrx/a4lMpQRiv3j7
 H6DFxFoKfCN193E8Istnf5Tun0tSFeKGc3P8HGFiVfRiKiI3ajsKjywRFVQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48313kh3vp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 20:34:06 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6fb5720eb48so23907796d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 13:34:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753302845; x=1753907645;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=go4w6pisezM+fmrLJT459t96/m/WbzFkmudzTaE8Fpo=;
 b=LEwyLep4bG6W7nGO2BJNRJP24JfHfyEUwFDbCbIcY7mVw5IjSrKpqTrShA4fuFcy7U
 8seivdYwWH+Z196AfQiR1wRFIlDIseDxgulo9CCsMiB+B14IW3mUpZJwprnmMjjTVFrt
 d4XUy6ZLODUFFQKdfNS0QoNW2g5cP94CpF9y9ZtSzDj5uxP5TU3pmJ7ZsV779/E8rAhQ
 Gm+EfmANqNUkUMR9yD/wdthLXRarL5z/rsSXaHsUabF2gksKSLrcKNsrJoo9NFCxdLIF
 ikCtwkBIEe+FOKdkea+f5fnujhWNqTfhaB9mbAcmDznDrRmF7HPychSVBqg/MR1hd991
 D2tg==
X-Gm-Message-State: AOJu0YxiP5WwD69OuXRWZ8fJWV6I0M37MLT1jlE4lNLXawdHQAmZdEES
 sSU6Ck8Jm9vWyVnWXo6i180JX3Qdkz1Ahc3LXYOSIY4LPn+o4aydlkq1Nsh+2D6aCLBL9OoyIkE
 lPEddDSN/kyU0KbCmW7CmgO6R8MIGiOE6v+7bgx+J9rdHOgQWgvpzLSzupg19o/KUldAEwI1GtF
 kzQuE=
X-Gm-Gg: ASbGncvT02Xe52YnK8u4/mMMHn2PEf9XyjaQpMk+Gw6KDOwxlG6yVGBWPvCdEqkkGaD
 CxO4t+XugDdFuk3q0cKBqlo7EJl5rUvNmA78T1LS9MBPUhcqwPT6ypDoxHwJEFRed/JNXOOstSA
 C9apq9FXPLt4eiiNn8a37YOPz294BB3wXuoTz2AtJfSXNuwLSufhnpPxH6+IX91PnBvvan+0zes
 LmIlWIC40MeKMxSfpCIrcN2o8INQgCPZ2Hw2n5WEwJN8rXoSXk28hqfr0gV/k5WhKHCVQOQgcT8
 lr1hZVs7WZKXzawuO6glPLxELULagGNw7QbamC/FUwD/bUidUpI=
X-Received: by 2002:a05:6214:627:b0:705:2781:df3d with SMTP id
 6a1803df08f44-706eb4d2467mr108285126d6.0.1753302845365; 
 Wed, 23 Jul 2025 13:34:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8VTSyv68wujrKZl+LBtm1rzipjAkQC2pZQlbR1Bf3Ipp3TNep0+rs/9z89WCJhtGvp+l5RQ==
X-Received: by 2002:a05:6a21:6d99:b0:23d:34f2:3a22 with SMTP id
 adf61e73a8af0-23d48db2762mr6286089637.7.1753302511486; 
 Wed, 23 Jul 2025 13:28:31 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-761b05e4029sm21283b3a.97.2025.07.23.13.28.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 13:28:31 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] drm/msm: Defer fd_install in SUBMIT ioctl
Date: Wed, 23 Jul 2025 13:28:22 -0700
Message-ID: <20250723202825.18902-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250723202825.18902-1-robin.clark@oss.qualcomm.com>
References: <20250723202825.18902-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE3NSBTYWx0ZWRfXz6F/aTHbgVfy
 x0HSxJJT88hNim/1TPrZDSMhov1OLtuIh8lM7cp5M+f8gdd1ZTGkapHpB5L0jQkZs6O/GA3BLMs
 8ZRdMpv7IjfZ8RfsrOhHaiqu+oh9gq+LhAymOxasI+R+KF6T9rU57/+oYgGJw5O64igxQv3hSwX
 rI8e9BOrMe4qNOZbe7OEObLnpj/6HGwc9Fl28lat5+HczjD4CIWiWE1QsKkaoFkt9YcA5XhjktX
 vuiJBnCE5P2uDXwprW3mGRPf614Sev6+OhxWg8B8HDFNmLqHn5XLuh22aeudaTyQpOP8TA6ZlJX
 1Cdf+u7i2NuxytJAFq7nVTDMKbz9WoPPGYlCNt8TM/zvTJY69zDKJGrs4YNYvrkC8Q751GM6dli
 sxc4OqcyaJSs5tO4X1QwWY17mo3Yi242ni/vk6jnuyO0SBW7PhUxaRzRVowZpgPAOmRPkG+a
X-Proofpoint-ORIG-GUID: umTrm0pWGl1dSVLksCB-Rmo2uU4L2fR9
X-Proofpoint-GUID: umTrm0pWGl1dSVLksCB-Rmo2uU4L2fR9
X-Authority-Analysis: v=2.4 cv=C/TpyRP+ c=1 sm=1 tr=0 ts=6881473e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=p_L9ESIXKxyW_a9_XK8A:9
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 mlxscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230175
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

Avoid fd_install() until there are no more potential error paths, to
avoid put_unused_fd() after the fd is made visible to userspace.

Fixes: 68dc6c2d5eec ("drm/msm: Fix submit error-path leaks")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 0ac4c199ec93..bfea19baf6d9 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -770,12 +770,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 
 	if (ret == 0 && args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
 		sync_file = sync_file_create(submit->user_fence);
-		if (!sync_file) {
+		if (!sync_file)
 			ret = -ENOMEM;
-		} else {
-			fd_install(out_fence_fd, sync_file->file);
-			args->fence_fd = out_fence_fd;
-		}
 	}
 
 	if (ret)
@@ -813,10 +809,14 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 out_unlock:
 	mutex_unlock(&queue->lock);
 out_post_unlock:
-	if (ret && (out_fence_fd >= 0)) {
-		put_unused_fd(out_fence_fd);
+	if (ret) {
+		if (out_fence_fd >= 0)
+			put_unused_fd(out_fence_fd);
 		if (sync_file)
 			fput(sync_file->file);
+	} else if (sync_file) {
+		fd_install(out_fence_fd, sync_file->file);
+		args->fence_fd = out_fence_fd;
 	}
 
 	if (!IS_ERR_OR_NULL(submit)) {
-- 
2.50.1

