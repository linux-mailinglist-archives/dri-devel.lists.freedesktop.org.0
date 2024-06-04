Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F3A8FA6ED
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 02:20:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E36610E119;
	Tue,  4 Jun 2024 00:20:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XxT2+9SB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 328AB10E119;
 Tue,  4 Jun 2024 00:20:26 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2eaae2a6dc1so29427281fa.0; 
 Mon, 03 Jun 2024 17:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717460424; x=1718065224; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FrlYSwM264hBhCwGHb/m41CgMyXslmsh35MYvVUqi8A=;
 b=XxT2+9SBobl3KWr8fyzG0sXHojbNkbUJoz35VHCvwAuPOIX+UuNXQK9dWQB3id5/b8
 5k3CeX5BC7WC6hlugRB80rgfDDWv4lsjXxEzoFJAY+FswYXXIG+6mu/QuGlIvODop8/2
 O4fF9RAGUXZSLKWo+ETEuG3WSfs3Dvb+icnrT1yKVFIcEx6Sj+zXHNEpeh3+9UhZGb23
 W3rlkosA1WT4wMZ4iQj7qvS16/d0IdqFeA8vvDkOoekt4Nhra04UBGyRZGNCt5fTEbve
 ENWhk64/jqfsMgYb1/1YIkdZ8G2LqWHg7bQH5t0HAJx21vLVifeediL+uu6EN2VmS2op
 jOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717460424; x=1718065224;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FrlYSwM264hBhCwGHb/m41CgMyXslmsh35MYvVUqi8A=;
 b=S6VyUIWULIQuoFrLMD/rt5DcMZs4Ni471qqZeYFdb07Dfvso+9VNluSjdUMo+NktCu
 hE7+qw/bV+UD/ezrkyLdRjNA/ehX8YpWFGKatMgI65OPPu+UktUVKntIHNjcHKTJQZ/q
 4/jHWRB+kbAEoqJfefgpW2kt3BVpeulZRlb9Yrhm03LuLDsALlN/LkZBFrvKKtCj1UsL
 h6WX2b4CMLVAEkoOOSVDpof77BKl9U1JPHiFXyOGNEgpDrkxWjEl7IyqNs5e5lJhwnUV
 kvQMcWiz5rQ5Yk57g1vG4p8VdbdoUFDwvUUv01ru9lNnnkA8L6DiUQS09wSZnN3wsks5
 6BAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVi1OcfMbUJQOAyalIZigcVft6UeaksWKIO/W+zoiOjdAW40DhlGetUyUwzo1aoZlXjUFBLhwX3IoK7vzpE3CmhJmiGFIiKgFPR+sQw61dFDCS+z5ETWxrMrTNrlSLK60yLjWjzlH5dvqAFZ1gIu86g
X-Gm-Message-State: AOJu0Yz0q2NrsLacMTBCaj5PCGwdtPAWv+y9mo9atl+0+OvaVHeteRT8
 jnTVtVfSi+x+1ydjWnnlUUCf48MqpgRp3I7dVMmZCLOFj6JMd3G/
X-Google-Smtp-Source: AGHT+IEp36/GJZadTs7r0++UDOWUpMWtX/2Qmis14sRY9Qqow+5m9MHDZ3vP6c0LUYFDSEprPYX4Bg==
X-Received: by 2002:a2e:988f:0:b0:2ea:79b2:1839 with SMTP id
 38308e7fff4ca-2ea950e77f9mr89339561fa.2.1717460423516; 
 Mon, 03 Jun 2024 17:20:23 -0700 (PDT)
Received: from [192.168.1.130] (51B6DB6F.dsl.pool.telekom.hu. [81.182.219.111])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57a31bb828dsm6244325a12.33.2024.06.03.17.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jun 2024 17:20:22 -0700 (PDT)
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Date: Tue, 04 Jun 2024 02:20:21 +0200
Subject: [PATCH] drm/msm/adreno: Add support for Adreno 505 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240604-a505-v1-1-82ee1c04d200@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMRdXmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDMwNj3URTA1PdVFNzYwvLJDPDFKNEJaDSgqLUtMwKsDHRsbW1AG085/9
 WAAAA
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Daniil Titov <daniilt971@gmail.com>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
X-Mailer: b4 0.13.0
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

From: Daniil Titov <daniilt971@gmail.com>

This GPU is found on SoCs such as MSM8937 (450 MHz), MSM8940 (475 MHz),
SDM439 (650 MHz).

Signed-off-by: Daniil Titov <daniilt971@gmail.com>
Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c      | 29 +++++++++++++++++------------
 drivers/gpu/drm/msm/adreno/adreno_device.c | 17 +++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  5 +++++
 3 files changed, 39 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index c003f970189b..c0b5373e90d7 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -439,7 +439,8 @@ void a5xx_set_hwcg(struct msm_gpu *gpu, bool state)
 	const struct adreno_five_hwcg_regs *regs;
 	unsigned int i, sz;
 
-	if (adreno_is_a506(adreno_gpu) || adreno_is_a508(adreno_gpu)) {
+	if (adreno_is_a505(adreno_gpu) || adreno_is_a506(adreno_gpu) ||
+	    adreno_is_a508(adreno_gpu)) {
 		regs = a50x_hwcg;
 		sz = ARRAY_SIZE(a50x_hwcg);
 	} else if (adreno_is_a509(adreno_gpu) || adreno_is_a512(adreno_gpu)) {
@@ -483,7 +484,8 @@ static int a5xx_me_init(struct msm_gpu *gpu)
 	OUT_RING(ring, 0x00000000);
 
 	/* Specify workarounds for various microcode issues */
-	if (adreno_is_a506(adreno_gpu) || adreno_is_a530(adreno_gpu)) {
+	if (adreno_is_a505(adreno_gpu) || adreno_is_a506(adreno_gpu) ||
+	    adreno_is_a530(adreno_gpu)) {
 		/* Workaround for token end syncs
 		 * Force a WFI after every direct-render 3D mode draw and every
 		 * 2D mode 3 draw
@@ -752,10 +754,11 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 		0x00100000 + adreno_gpu->info->gmem - 1);
 	gpu_write(gpu, REG_A5XX_UCHE_GMEM_RANGE_MAX_HI, 0x00000000);
 
-	if (adreno_is_a506(adreno_gpu) || adreno_is_a508(adreno_gpu) ||
-	    adreno_is_a510(adreno_gpu)) {
+	if (adreno_is_a505(adreno_gpu) || adreno_is_a506(adreno_gpu) ||
+	    adreno_is_a508(adreno_gpu) || adreno_is_a510(adreno_gpu)) {
 		gpu_write(gpu, REG_A5XX_CP_MEQ_THRESHOLDS, 0x20);
-		if (adreno_is_a506(adreno_gpu) || adreno_is_a508(adreno_gpu))
+		if (adreno_is_a505(adreno_gpu) || adreno_is_a506(adreno_gpu) ||
+			adreno_is_a508(adreno_gpu))
 			gpu_write(gpu, REG_A5XX_CP_MERCIU_SIZE, 0x400);
 		else
 			gpu_write(gpu, REG_A5XX_CP_MERCIU_SIZE, 0x20);
@@ -771,7 +774,8 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 		gpu_write(gpu, REG_A5XX_CP_ROQ_THRESHOLDS_1, 0x40201B16);
 	}
 
-	if (adreno_is_a506(adreno_gpu) || adreno_is_a508(adreno_gpu))
+	if (adreno_is_a505(adreno_gpu) || adreno_is_a506(adreno_gpu) ||
+	    adreno_is_a508(adreno_gpu))
 		gpu_write(gpu, REG_A5XX_PC_DBG_ECO_CNTL,
 			  (0x100 << 11 | 0x100 << 22));
 	else if (adreno_is_a509(adreno_gpu) || adreno_is_a510(adreno_gpu) ||
@@ -789,8 +793,9 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	 * Disable the RB sampler datapath DP2 clock gating optimization
 	 * for 1-SP GPUs, as it is enabled by default.
 	 */
-	if (adreno_is_a506(adreno_gpu) || adreno_is_a508(adreno_gpu) ||
-	    adreno_is_a509(adreno_gpu) || adreno_is_a512(adreno_gpu))
+	if (adreno_is_a505(adreno_gpu) || adreno_is_a506(adreno_gpu) ||
+	    adreno_is_a508(adreno_gpu) || adreno_is_a509(adreno_gpu) ||
+	    adreno_is_a512(adreno_gpu))
 		gpu_rmw(gpu, REG_A5XX_RB_DBG_ECO_CNTL, 0, (1 << 9));
 
 	/* Disable UCHE global filter as SP can invalidate/flush independently */
@@ -1345,7 +1350,7 @@ static int a5xx_pm_resume(struct msm_gpu *gpu)
 	if (ret)
 		return ret;
 
-	/* Adreno 506, 508, 509, 510, 512 needs manual RBBM sus/res control */
+	/* Adreno 505, 506, 508, 509, 510, 512 needs manual RBBM sus/res control */
 	if (!(adreno_is_a530(adreno_gpu) || adreno_is_a540(adreno_gpu))) {
 		/* Halt the sp_input_clk at HM level */
 		gpu_write(gpu, REG_A5XX_RBBM_CLOCK_CNTL, 0x00000055);
@@ -1388,9 +1393,9 @@ static int a5xx_pm_suspend(struct msm_gpu *gpu)
 	u32 mask = 0xf;
 	int i, ret;
 
-	/* A506, A508, A510 have 3 XIN ports in VBIF */
-	if (adreno_is_a506(adreno_gpu) || adreno_is_a508(adreno_gpu) ||
-	    adreno_is_a510(adreno_gpu))
+	/* A505, A506, A508, A510 have 3 XIN ports in VBIF */
+	if (adreno_is_a505(adreno_gpu) || adreno_is_a506(adreno_gpu) ||
+	    adreno_is_a508(adreno_gpu) || adreno_is_a510(adreno_gpu))
 		mask = 0x7;
 
 	/* Clear the VBIF pipe before shutting down */
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index c3703a51287b..7e1ff091acaf 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -149,6 +149,23 @@ static const struct adreno_info gpulist[] = {
 		.gmem  = (SZ_1M + SZ_512K),
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init  = a4xx_gpu_init,
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x05000500),
+		.family = ADRENO_5XX,
+		.revn = 505,
+		.fw = {
+			[ADRENO_FW_PM4] = "a530_pm4.fw",
+			[ADRENO_FW_PFP] = "a530_pfp.fw",
+		},
+		.gmem = (SZ_128K + SZ_8K),
+		/*
+		 * Increase inactive period to 250 to avoid bouncing
+		 * the GDSC which appears to make it grumpy
+		 */
+		.inactive_period = 250,
+		.quirks = ADRENO_QUIRK_TWO_PASS_USE_WFI |
+			  ADRENO_QUIRK_LMLOADKILL_DISABLE,
+		.init = a5xx_gpu_init,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x05000600),
 		.family = ADRENO_5XX,
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 77526892eb8c..b80cc4772cc0 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -298,6 +298,11 @@ static inline int adreno_is_a430(const struct adreno_gpu *gpu)
 	return adreno_is_revn(gpu, 430);
 }
 
+static inline int adreno_is_a505(const struct adreno_gpu *gpu)
+{
+	return adreno_is_revn(gpu, 505);
+}
+
 static inline int adreno_is_a506(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 506);

---
base-commit: 861a3cb5a2a8480d361fa6708da24747d6fa72fe
change-id: 20240603-a505-e57389b61d2a

Best regards,
-- 
Barnabás Czémán <trabarni@gmail.com>

