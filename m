Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5A7B4870B
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 10:28:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21BFB10E488;
	Mon,  8 Sep 2025 08:28:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hoVmBKWL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EBDC10E48C
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 08:28:25 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587Lu3Al023900
 for <dri-devel@lists.freedesktop.org>; Mon, 8 Sep 2025 08:28:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xqC7Zy6ivxrAZNOluQq2nuWFwYW/k4m65npdWDnVVQ8=; b=hoVmBKWLwzy1eYqU
 v0eb9D8MOdTyHaLmDMzqaIxahQ+ODRYx04pYNp+aB1tl21xhPOSUdVmFieXf9WEy
 r8w5lnPmbJ3+dW51NiavAI+5paOGVSVVfmGaIHX4zm3YXl3vKJhtlBFdZ8Yqs/b3
 KZDWFY2asSMQsT/+QvfcF4MsM4qIBEqA9yzDmZSiGQqx4xAIqQpWkhQl9x0kbcJm
 h1ty7WyiUxb82GdmddRrAF3X3hiO9LmELDLBT2mF9Y07Twkj+x0k/2znsho5KZXh
 Zh7RzQE5pXYn5NDr8gE7jT39DBpnjxaHC9Zm+Z3tBLwXrYOgwp34tEraMn6jZhY5
 GzGIfw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8a3q5e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 08:28:24 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-77250c660d3so3938010b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 01:28:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757320104; x=1757924904;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xqC7Zy6ivxrAZNOluQq2nuWFwYW/k4m65npdWDnVVQ8=;
 b=M/P1mqe5TuhoRGkbjfEfWz4cZOV3m5biaL0FxGpKCTANK4MHq8FdtJQsyWv7UQFqI+
 v00g1aX/PoVLGQZ/XuMYrTAHJoGOrhlyCiJIc3ioDJl/xA3+T7alp47/+QohiatliD71
 s3v6ZfSEVok8tpRY4rxRG7hKxj2/601TFQYjiyz3TOySTT0NGqF48YfKsaydKYsLHx29
 CaI6AF2O+3DFpcb2oXhQR4OnkRrKIw3dr/2yfeMy0uvmGYB5K41rgBuUaTtZ9xufm9e9
 pP9d64dV+8eXW4fdVg/mtbwe2gEelLLgOFXNYzpzxpXg998FPXVbD4mjxwHlbEaQHgxR
 cExg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCZZLBt9jAjdLPs5pDVi04BKuvpCpUlW4NXel8RrfVawxU0NJceO8t/9lyi7DnCoIysm4dO3dajH0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxteAlj+QSpGLouLq5wB1ODdnuJAT2XnDIXFN1GpN0MX4OYXj3W
 XIxV2JTWTtTO7OdVDItxZ+YDInTCaEeHrji1j+I+UCbs9Q0TAasa9ZcUQRedSPyOsKfY0cpNE7t
 4Jz6oV/0vJrdnbE/TsiJxh5TnoNAsjo9FQLy3oFMto+sic9cr81XlgXvJl5XFNH0Xuy/9tJU=
X-Gm-Gg: ASbGncv4lnALfk4BhMWj0ZG3l2sqBa18WVVJLTm7cPoz37c63xOUihHv5EkNPN1yGye
 dvNjC57Rd7mrhAPIixM27oa1mgcZIFQWkLzWpYI7fHqrmGDgPxUNHt1Fl9hxqiXwR0YL2QVTBKj
 8ZyR3h1R7QqlYvy8BzdM/8r3Pzdndsz5Iyt+Q+HKTSmQxQk6LO2dSyiMFtSlyJ3n9QSM1RPNgij
 o+YkuJJ9j51z5SgkvF++73yddybTr7LPpMAqYNemdZF6HNGVtIUZ59GXjgyaZwGL+odktNqQSkD
 7ezKg89M9jJsqzvnMzNX+SG58uvrx2OY8BoJG52Q2iheVdl74v6ps2FXc4yP+Hhb
X-Received: by 2002:a05:6a00:ccc:b0:736:3ea8:4805 with SMTP id
 d2e1a72fcca58-7742dd10e6emr8094350b3a.7.1757320103575; 
 Mon, 08 Sep 2025 01:28:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVxoyp2PRB+QVncUti3N2Wj7nrXH65ckYK0eniIMm9C8JT1Cyw/QQPJ8BNF4g/yzey4I9VCA==
X-Received: by 2002:a05:6a00:ccc:b0:736:3ea8:4805 with SMTP id
 d2e1a72fcca58-7742dd10e6emr8094308b3a.7.1757320102764; 
 Mon, 08 Sep 2025 01:28:22 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a26bc9csm29157523b3a.18.2025.09.08.01.28.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 01:28:22 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 13:57:07 +0530
Subject: [PATCH v2 14/16] drm/msm/a6xx: Make crashstate capture IFPC safe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-ifpc-support-v2-14-631b1080bf91@oss.qualcomm.com>
References: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
In-Reply-To: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757320036; l=4450;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=RujJUh0j4TEd2cIlAXEv6xdDosDvLPvDu1U8gcvWuDk=;
 b=5wro+WXTeqUixun67HjZQHEfABVu5UwSfZexitnxpMZK1qDmqI4AcxqupwnbNFFAEV9nxDgAC
 ix3JnxBJNeeDvaqbrFlgfHPOoaTjF5SNLyOGy3hjlTLZwtzr6q1qA6P
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68be93a8 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=yKEZsNg54XTt07RPwjwA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: yE-WC2_2mU7SBCHuRgjQ4S40Y66OHsZt
X-Proofpoint-ORIG-GUID: yE-WC2_2mU7SBCHuRgjQ4S40Y66OHsZt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX2kV66sEtS1v/
 pzc/3dsHy+8Dh9IudLzMyGXC/yfNg7QL2MujfjIovnNj6s6QwR2cA1+WCqUwRWnWUD9J7VN+Khw
 YyvtaP3vPuUC2uxq/7tRvxpBsWRD5DPVW6xIcncqXs6y6NA6BNzqqSDWBtIdv/PNsNxmorwFnwL
 ciXy+fVCZzprToqyySrpqxD+D/XFJW9j9lHh9irgZDLL+S+6zzKoaaoh1qHlY9WAo0rm2rhbL7/
 grczJRGjQHhnWjvTZJ2EJhd9zyipeZu7kl/BHmI6cSc8x3V8m2G4ZDFS56Pw4gaZA3X1A4KG/wI
 nviWXECDCoGiGOog/AQCOhhNGNjcoVTjAeA7vslw5qcgpWAGduwosCc69ZEpKaQUMpH5jEAfv3O
 6gRGE+dl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039
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

Now with IFPC, GX domain can collapse as soon as GPU becomes IDLE. So
add gx_is_on check before accessing any GX registers during crashstate
capture and recovery.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c       |  4 ++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 27 +++++++++++++++++++--------
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 10 +++++++---
 3 files changed, 30 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index d76b6b766d4a644d342f62435892d54ebd7192e5..81076349d69c8c13e6c6b4e1c336c2d990ebda6d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -101,6 +101,10 @@ bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu)
 	if (!gmu->initialized)
 		return false;
 
+	/* If GMU is absent, then GX power domain is ON as long as GPU is in active state */
+	if (adreno_has_gmu_wrapper(adreno_gpu))
+		return true;
+
 	val = gmu_read(gmu, REG_A6XX_GMU_SPTPRAC_PWR_CLK_STATUS);
 
 	if (adreno_is_a7xx(adreno_gpu))
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index b54c88fb27d57f81306163e699961803ff765bdb..76dd78f5c48ea818a2aa209e0c0c88bc5e8f4e06 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1537,21 +1537,25 @@ static void a6xx_recover(struct msm_gpu *gpu)
 
 	adreno_dump_info(gpu);
 
-	for (i = 0; i < 8; i++)
-		DRM_DEV_INFO(&gpu->pdev->dev, "CP_SCRATCH_REG%d: %u\n", i,
-			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(i)));
+	if (a6xx_gmu_gx_is_on(&a6xx_gpu->gmu)) {
+		/* Sometimes crashstate capture is skipped, so SQE should be halted here again */
+		gpu_write(gpu, REG_A6XX_CP_SQE_CNTL, 3);
 
-	if (hang_debug)
-		a6xx_dump(gpu);
+		for (i = 0; i < 8; i++)
+			DRM_DEV_INFO(&gpu->pdev->dev, "CP_SCRATCH_REG%d: %u\n", i,
+				gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(i)));
+
+		if (hang_debug)
+			a6xx_dump(gpu);
+
+	}
 
 	/*
 	 * To handle recovery specific sequences during the rpm suspend we are
 	 * about to trigger
 	 */
-	a6xx_gpu->hung = true;
 
-	/* Halt SQE first */
-	gpu_write(gpu, REG_A6XX_CP_SQE_CNTL, 3);
+	a6xx_gpu->hung = true;
 
 	pm_runtime_dont_use_autosuspend(&gpu->pdev->dev);
 
@@ -2412,6 +2416,13 @@ static uint32_t a6xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	if (adreno_gpu->base.hw_apriv || a6xx_gpu->has_whereami)
 		return a6xx_gpu->shadow[ring->id];
 
+	/*
+	 * This is true only on an A6XX_GEN1 with GMU, has IFPC enabled and a super old SQE firmware
+	 * without 'whereami' support
+	 */
+	WARN_ONCE((to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC),
+		"Can't read CP_RB_RPTR register reliably\n");
+
 	return ring->memptrs->rptr = gpu_read(gpu, REG_A6XX_CP_RB_RPTR);
 }
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index d5d1271fce611b60121b36f4b772d6f5e0093d2b..4c7f3c642f6ac0a397ac3b282966d25cd4488d3e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -1586,8 +1586,7 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct a6xx_gpu_state *a6xx_state = kzalloc(sizeof(*a6xx_state),
 		GFP_KERNEL);
-	bool stalled = !!(gpu_read(gpu, REG_A6XX_RBBM_STATUS3) &
-			A6XX_RBBM_STATUS3_SMMU_STALLED_ON_FAULT);
+	bool stalled;
 
 	if (!a6xx_state)
 		return ERR_PTR(-ENOMEM);
@@ -1608,15 +1607,20 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
 	}
 
 	/* If GX isn't on the rest of the data isn't going to be accessible */
-	if (!adreno_has_gmu_wrapper(adreno_gpu) && !a6xx_gmu_gx_is_on(&a6xx_gpu->gmu))
+	if (!a6xx_gmu_gx_is_on(&a6xx_gpu->gmu))
 		return &a6xx_state->base;
 
+	/* Halt SQE first */
+	gpu_write(gpu, REG_A6XX_CP_SQE_CNTL, 3);
+
 	/* Get the banks of indexed registers */
 	if (adreno_is_a7xx(adreno_gpu))
 		a7xx_get_indexed_registers(gpu, a6xx_state);
 	else
 		a6xx_get_indexed_registers(gpu, a6xx_state);
 
+	stalled = !!(gpu_read(gpu, REG_A6XX_RBBM_STATUS3) &
+			A6XX_RBBM_STATUS3_SMMU_STALLED_ON_FAULT);
 	/*
 	 * Try to initialize the crashdumper, if we are not dumping state
 	 * with the SMMU stalled.  The crashdumper needs memory access to

-- 
2.50.1

