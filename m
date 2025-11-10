Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F75C4803C
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 17:39:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE29310E46B;
	Mon, 10 Nov 2025 16:38:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ns6ldHOf";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h/kVvova";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FC2410E461
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 16:38:58 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AAF3lEC1809057
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 16:38:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oes+EnLQiIXAxPUxYP+Mc2ycI3/yrDxiwXneiCBW2Ac=; b=Ns6ldHOfieujVYNh
 ghYYNnXV4LNbii660TohN4WhN+8dtFwvOhjTDagzEa0FHAHZz/xPpIgzs1zrjKiv
 upPq8U5Hx/igLzr/076pubKzv66l9wJ+jsewA9DhWsmPrm4TMR3cHzqkNxi6lSVR
 fgPWpOESTsJX8QNInYm3pTqDwuANk787cbS24AU97KwEXGw7jwn0ix70KgSUJl2W
 YucqnZw638bHZsBmDvUbsdeOXczN3M/VCRT3Bjeud0A7SKVWUdD51EeSSikdBfND
 ycnFm0L0XIXkO9n9rWLRuiTTkWY3zCEb/FMvCFWIb0cL5GuNPmovWLwGWmRg6gdH
 /XqVPA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ab5m1jkxd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 16:38:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-340c0604e3dso4128238a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 08:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762792737; x=1763397537;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=oes+EnLQiIXAxPUxYP+Mc2ycI3/yrDxiwXneiCBW2Ac=;
 b=h/kVvova04c7gkOY5aV5RXkcH/PHxbKSPJaJxQfRs8BVViQvGJNSoKa/lBJ7cdcCcV
 EmrBpI0rm4/LfFtXaqTA5MGwtQfms7hT+6nSRpv+mG1K9n3rbALFRrhrEjaq1YKdg6nC
 wuycy1DeAGj0VMCfANBbq+EFQY3vSuWV/dQYki0Z81mJxbn1BJtutl2Eea430EcIBa4v
 mLQqWqHbXtb3X+qxhRSza5yDiwDD9+1OZnQL993h9yS+k2mUfXXN0cAzl6FXDROdw0RP
 Lq6wHijm7IC8tjB3Sudb2Lfh8TFnrqvniZNyJpvPncHXrnjtB8+jxCNu2PxT7VDH23K4
 FLpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762792737; x=1763397537;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=oes+EnLQiIXAxPUxYP+Mc2ycI3/yrDxiwXneiCBW2Ac=;
 b=F2hLiFkLzbQuJvn1Y2ckmLjaV18yBtf2ipCg+108OfAouuQk+InEuCWDfuYhnZopK+
 UfAxoXhQPdSjXJFxdXbLoTr9/O9VdjCSIwCJtJb4iOXnQv9FwvUNFxcyyLcyB8VmzbZd
 cpqUl22F2dhDhUGb1AGnVMefCiJn6+XVm4I4wXSYT7rGgWQZfmoPTyYErviXE2qsmDSF
 Y0fRXJ/Rx0Wmexc2BqTyClKf4GeCT4fGCtkB2RBzl7nIZcWaNtnNDW+V/H8ud1Xy1jlD
 FoAa/GKDiAEAg2wnC+99d3SSH8ExxOBjYJFwd6IV++3/9YwPHXxPm2HcKZgDjId7GYwH
 P2yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKqZLsC9bE6d9zshMBhqEHQQXvvCFh6IceTBrG5Wnp2BB890PtP24rLwAcw/qa5kEmnSZtbXJ1LA8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLD1eAvzcwK+OeK8tVrU8ITfi0khDxI1BE1csJ6OCylEcx7ntU
 dL4Z3wBHPvUAhk6g0QH5cHDFbZI1szsqee7obfiYGbj70a+akJLF9j8qwE17MOMEsLzVs7E8EMq
 BBhLXbT1106oN0BvGCgjjOopsiZCzTgGVfOhPA8531w2us/6HHvZgPGpUAbzrNC0IZuWxDlw=
X-Gm-Gg: ASbGncu7DcvNqPPfA+XpWFzqkQUDCgD6iugvqPZS6ZxrWsBToTIebZhbODoHphhQl0/
 QxbHVvd23gFa76i+6davWQ3KNkjUVRN+eVdQXtUp4esOD+ulDZnfGl8zrSM99umDJLa3tikq1gh
 RPs44JStTcK+y1H/BhVk1Dsmq7gerHvKDfMAZ/oSp/juhBXQYHsfpevmaRh1ZyN6KqB7jvnwv46
 sbWeUJIoW8nxQetNBb822KbF+J5f9fQBjwooxRS0cZM9bqxNIh1L698G9QJIDmKPkKbHXNHIJ9E
 Lzz3b2XMGa+VePqgr5fd/nAx2ovrzD1iXIV15B9ptQ2xSGJ6ZLz73hj6Mi6hOBvGKUZN75AjJ0g
 YhkhiDkeUl1lWOw6zzVClc+s=
X-Received: by 2002:a17:90a:c10f:b0:340:b501:7b7d with SMTP id
 98e67ed59e1d1-3436cb22897mr10962380a91.14.1762792737048; 
 Mon, 10 Nov 2025 08:38:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGrUp9qwIPLGlfFgKZfxVyplHxc1TH6QJBrbZSSrUu4CbpB3XwLUpZQxF12o559s4wVWQ60Xg==
X-Received: by 2002:a17:90a:c10f:b0:340:b501:7b7d with SMTP id
 98e67ed59e1d1-3436cb22897mr10962333a91.14.1762792736515; 
 Mon, 10 Nov 2025 08:38:56 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3434c337b20sm11468922a91.13.2025.11.10.08.38.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 08:38:56 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 22:07:12 +0530
Subject: [PATCH v2 06/21] drm/msm/adreno: Move gbif_halt() to adreno_gpu_func
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-kaana-gpu-support-v2-6-bef18acd5e94@oss.qualcomm.com>
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762792679; l=3692;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=8uOk6MoHQ4XtxnDe/lI2Mr7cqNt7gTyTYYefSPfwTs8=;
 b=waJ7CLv76Kc9w1AzujDl/sZEg+E5ppNZ+FHPNnfO1xxCO2UX9m5a26YORP7ypnqLm1QwDLdf4
 5QXzTH756vTAoC8HJsN/CliDpX95vxnRX4qB/i1vXAs92UcBAP7iQwr
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE0MCBTYWx0ZWRfX6bnnlDoPSFho
 2S6KBktWxhzNfxXfE2EKVe8d1OjyINBLUnjjp5LRVyycIkoLEH+5/46PzB6xQZsGt7hmifxue0H
 5lt8CBEsSMMf3C/sGkVSSTiZM10Y7SDVLwh2vj1MndmKIkS25UozumWUbvITnw3LOz4Lm/SShC0
 Ld896LtP6N4UrFjOZGCsWDGA6eWLOlSBW/Q8roCDcWB68LnOW/inTt5ei1po3s9bqnPyUJ6O/Ah
 sYsKiWyRs0wJs3iQH7LzHlXHRwRUaAD5mmNTpwTZD4TTkD6h4cPGz4LPZAa0XXecLd/Q2nqlfds
 fs6zOGiUSQY2SIO1ao5oxDs7UVe2S+FzXzPZ4mCqAHqoY5ug86N1TvljH4BjmcCUKkG/vrp1Vx+
 Ps0qgBPZ9X8S9XC9QbNBeuipB1gRtA==
X-Authority-Analysis: v=2.4 cv=TsXrRTXh c=1 sm=1 tr=0 ts=69121521 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=W_sW28Yvd0frASqVc48A:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: N-2Ctjs_UQjJiKZbXTvVER4SFhZewNFs
X-Proofpoint-GUID: N-2Ctjs_UQjJiKZbXTvVER4SFhZewNFs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100140
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

Move the gbif halt fn to adreno_gpu_func so that we can call different
implementation from common code. This will come handy when we implement
A8x layer.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c   | 4 ++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 7 +++++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 1 +
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 605bb55de8d5..306fc08492e4 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1053,7 +1053,7 @@ static void a6xx_gmu_force_off(struct a6xx_gmu *gmu)
 	/* Halt the gmu cm3 core */
 	gmu_write(gmu, REG_A6XX_GMU_CM3_SYSRESET, 1);
 
-	a6xx_bus_clear_pending_transactions(adreno_gpu, true);
+	adreno_gpu->funcs->bus_halt(adreno_gpu, true);
 
 	/* Reset GPU core blocks */
 	a6xx_gpu_sw_reset(gpu, true);
@@ -1225,7 +1225,7 @@ static void a6xx_gmu_shutdown(struct a6xx_gmu *gmu)
 	if (ret)
 		goto force_off;
 
-	a6xx_bus_clear_pending_transactions(adreno_gpu, a6xx_gpu->hung);
+	adreno_gpu->funcs->bus_halt(adreno_gpu, a6xx_gpu->hung);
 
 	/* tell the GMU we want to slumber */
 	ret = a6xx_gmu_notify_slumber(gmu);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 6856b6faf6c7..7a87f6407abf 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1584,7 +1584,7 @@ static void a6xx_recover(struct msm_gpu *gpu)
 
 	if (adreno_has_gmu_wrapper(adreno_gpu)) {
 		/* Drain the outstanding traffic on memory buses */
-		a6xx_bus_clear_pending_transactions(adreno_gpu, true);
+		adreno_gpu->funcs->bus_halt(adreno_gpu, true);
 
 		/* Reset the GPU to a clean state */
 		a6xx_gpu_sw_reset(gpu, true);
@@ -2295,7 +2295,7 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
 	mutex_lock(&a6xx_gpu->gmu.lock);
 
 	/* Drain the outstanding traffic on memory buses */
-	a6xx_bus_clear_pending_transactions(adreno_gpu, true);
+	adreno_gpu->funcs->bus_halt(adreno_gpu, true);
 
 	if (adreno_is_a619_holi(adreno_gpu))
 		a6xx_sptprac_disable(gmu);
@@ -2664,6 +2664,7 @@ const struct adreno_gpu_funcs a6xx_gpu_funcs = {
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_gmu_get_timestamp,
 	.submit_flush = a6xx_flush,
+	.bus_halt = a6xx_bus_clear_pending_transactions,
 };
 
 const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
@@ -2695,6 +2696,7 @@ const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_get_timestamp,
 	.submit_flush = a6xx_flush,
+	.bus_halt = a6xx_bus_clear_pending_transactions,
 };
 
 const struct adreno_gpu_funcs a7xx_gpu_funcs = {
@@ -2728,4 +2730,5 @@ const struct adreno_gpu_funcs a7xx_gpu_funcs = {
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_gmu_get_timestamp,
 	.submit_flush = a6xx_flush,
+	.bus_halt = a6xx_bus_clear_pending_transactions,
 };
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index eeb31fbc69ae..acdc51dbec79 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -78,6 +78,7 @@ struct adreno_gpu_funcs {
 	struct msm_gpu *(*init)(struct drm_device *dev);
 	int (*get_timestamp)(struct msm_gpu *gpu, uint64_t *value);
 	void (*submit_flush)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
+	void (*bus_halt)(struct adreno_gpu *adreno_gpu, bool gx_off);
 };
 
 struct adreno_reglist {

-- 
2.51.0

