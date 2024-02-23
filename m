Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 438CC861EC2
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 22:22:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59BC810ECD9;
	Fri, 23 Feb 2024 21:22:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kUmUeB76";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E8F110ECD6
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 21:21:59 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a3ee69976c9so133325066b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 13:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708723318; x=1709328118; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+hQ3SpYizIIEdO8h/cb2gS2gZ6yJ1jbKnG/M424eunA=;
 b=kUmUeB76C0i2Y8ww9cqCowA8Wjk3tevDI1M8piLTM/1ufTFTGQrkQkZIPECplkgygj
 GvIv8laA+fb9LtnRmpsX79hGYhq4g+zVglJ2smwRNq3HLswvMXFZ5qNqpPfrpxuI6AA7
 huRXbeJJYFym0AQ1IxslKi0WI6/uhMQOMe6jZc8Oq5Q+RRlgafbU+nZW+6QRczkAEo4X
 ge+BKOlw0xkGHmZ58nbgEGB4vkfCpCLVg2W5ZqTjWoPXeqiH2lbSL8paLyO3Wa7voYzQ
 qxSJDDG5Mu33PRSAXDcHcXXOAPQOBz94hbb6mv/c+csfw4JJUscRPBzAgBuHViC0cIs8
 kocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708723318; x=1709328118;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+hQ3SpYizIIEdO8h/cb2gS2gZ6yJ1jbKnG/M424eunA=;
 b=YkKOWpLvi/hLtnEGSxKEuFkOjF5AbDMtaO/bte5I+XfXNpjaE6Lc/MfsITkz4PVxT5
 mXOgnYBjwNKfAHbLWPK5259RZ76mrj0Ennb/l/LnWyCnpP3K8WNc3PwW+SEsvXOYdfaW
 r1MscZGe7k3sUFo3ZtL/CQ4QzNLilJfiPDD6z3tfbTA2Y9+xgU++sa1j/W4SQCWkdQ0J
 a0KAW0Pc60SptqqIoHRRRuqU5Po0Hx2/VeqC3ek8A3eeuWEGJnAIQKDkYIW9hmn59Bjv
 Ww/638HYhfU9ErPLfzZnTZnd4c0rsWoK4cBSYk3MYxS47U6OxhemCR8P5payUvacspQG
 ZDxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7N43aS2sD/q3CsgHrE8YprH1EStCXLChJjDxqPLeHR8P0Wzn7YnGrGR5yvfhBAqFXaXRPdbN3ZJleskYsFxaBtAc4Zxt2Eh+BXejd9YE+
X-Gm-Message-State: AOJu0Yy7PUSvFZySd4RLhe6S2kzuPJMHtj3jx1EaA/KUboSEVhXo1QNY
 0fuM8UpDoUOr7/8dV0fZAy7ABqTqZnJEPTQ6SDiifzM0nrHixfKlFHxA2MFO0v0=
X-Google-Smtp-Source: AGHT+IGT2W+inJ5mu4XwVKxW6JI0EEqx3LbPDQ4lO11OsxNs4YZ2Cy/N+nePCCx8UipRF2D18K6sEQ==
X-Received: by 2002:a17:906:b24c:b0:a3e:d20a:f1d9 with SMTP id
 ce12-20020a170906b24c00b00a3ed20af1d9mr640449ejb.11.1708723318103; 
 Fri, 23 Feb 2024 13:21:58 -0800 (PST)
Received: from [10.167.154.1] (078088045141.garwolin.vectranet.pl.
 [78.88.45.141]) by smtp.gmail.com with ESMTPSA id
 mj8-20020a170906af8800b00a3ee9305b02sm4091226ejb.20.2024.02.23.13.21.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Feb 2024 13:21:57 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 23 Feb 2024 22:21:41 +0100
Subject: [PATCH v2 5/7] drm/msm/adreno: Add A702 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240219-topic-rb1_gpu-v2-5-2d3d6a0db040@linaro.org>
References: <20240219-topic-rb1_gpu-v2-0-2d3d6a0db040@linaro.org>
In-Reply-To: <20240219-topic-rb1_gpu-v2-0-2d3d6a0db040@linaro.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708723303; l=11199;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=/obkr4MMIdqspTXLmZcuivEDxO3xqayOzHksqJVGMAk=;
 b=iGpmkAcmm3fUbJiZftbO7EpEpe4DIzzUNqVGtKPVhzZmXwEUWIJSo4843rvERaJTE7dZTmzfM
 ZSadIeZnX4KBEFOGTgBXMmMGV/r2k1BMLZgPIPpwlsGsHhXVhyfXeRV
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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

The A702 is a weird mix of 600 and 700 series.. Perhaps even a
testing ground for some A7xx features with good ol' A6xx silicon.
It's basically A610 that's been beefed up with some new registers
and hw features (like APRIV!), that was then cut back in size,
memory bus and some other ways.

Add support for it, tested with QCM2290 / RB1.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 92 +++++++++++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 18 ++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 16 +++++-
 3 files changed, 117 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index c9c55e2ea584..2a491a486ca1 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -837,6 +837,65 @@ const struct adreno_reglist a690_hwcg[] = {
 	{}
 };
 
+const struct adreno_reglist a702_hwcg[] = {
+	{ REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x22222222 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_SP0, 0x00000081 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_SP0, 0x0000f3cf },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_TP0, 0x22222222 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL2_TP0, 0x22222222 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL3_TP0, 0x22222222 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL4_TP0, 0x00022222 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_TP0, 0x11111111 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY2_TP0, 0x11111111 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY3_TP0, 0x11111111 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY4_TP0, 0x00011111 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_TP0, 0x77777777 },
+	{ REG_A6XX_RBBM_CLOCK_HYST2_TP0, 0x77777777 },
+	{ REG_A6XX_RBBM_CLOCK_HYST3_TP0, 0x77777777 },
+	{ REG_A6XX_RBBM_CLOCK_HYST4_TP0, 0x00077777 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_RB0, 0x22222222 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL2_RB0, 0x01202222 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_CCU0, 0x00002220 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_RB_CCU0, 0x00040f00 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_RAC, 0x05522022 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL2_RAC, 0x00005555 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_RAC, 0x00000011 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_RAC, 0x00445044 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_TSE_RAS_RBBM, 0x04222222 },
+	{ REG_A6XX_RBBM_CLOCK_MODE_VFD, 0x00002222 },
+	{ REG_A6XX_RBBM_CLOCK_MODE_GPC, 0x02222222 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_HLSQ_2, 0x00000002 },
+	{ REG_A6XX_RBBM_CLOCK_MODE_HLSQ, 0x00002222 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_TSE_RAS_RBBM, 0x00004000 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_VFD, 0x00002222 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_GPC, 0x00000200 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_HLSQ, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_TSE_RAS_RBBM, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_VFD, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_GPC, 0x04104004 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_HLSQ, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_UCHE, 0x22222222 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_UCHE, 0x00000004 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_UCHE, 0x00000002 },
+	{ REG_A6XX_RBBM_ISDB_CNT, 0x00000182 },
+	{ REG_A6XX_RBBM_RAC_THRESHOLD_CNT, 0x00000000 },
+	{ REG_A6XX_RBBM_SP_HYST_CNT, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_GMU_GX, 0x00000222 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_GMU_GX, 0x00000111 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_FCHE, 0x00000222 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_FCHE, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_FCHE, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_GLC, 0x00222222 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_GLC, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_GLC, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_MHUB, 0x00000002 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_MHUB, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_MHUB, 0x00000000 },
+	{}
+};
+
 const struct adreno_reglist a730_hwcg[] = {
 	{ REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x02222222 },
 	{ REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02022222 },
@@ -968,6 +1027,8 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 		clock_cntl_on = 0x8aa8aa02;
 	else if (adreno_is_a610(adreno_gpu))
 		clock_cntl_on = 0xaaa8aa82;
+	else if (adreno_is_a702(adreno_gpu))
+		clock_cntl_on = 0xaaaaaa82;
 	else
 		clock_cntl_on = 0x8aa8aa82;
 
@@ -989,14 +1050,14 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 		return;
 
 	/* Disable SP clock before programming HWCG registers */
-	if (!adreno_is_a610(adreno_gpu) && !adreno_is_a7xx(adreno_gpu))
+	if (!adreno_is_a610_family(adreno_gpu) && !adreno_is_a7xx(adreno_gpu))
 		gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 1, 0);
 
 	for (i = 0; (reg = &adreno_gpu->info->hwcg[i], reg->offset); i++)
 		gpu_write(gpu, reg->offset, state ? reg->value : 0);
 
 	/* Enable SP clock */
-	if (!adreno_is_a610(adreno_gpu) && !adreno_is_a7xx(adreno_gpu))
+	if (!adreno_is_a610_family(adreno_gpu) && !adreno_is_a7xx(adreno_gpu))
 		gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 0, 1);
 
 	gpu_write(gpu, REG_A6XX_RBBM_CLOCK_CNTL, state ? clock_cntl_on : 0);
@@ -1224,7 +1285,7 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
 	const u32 *regs = a6xx_protect;
 	unsigned i, count, count_max;
 
-	if (adreno_is_a650(adreno_gpu)) {
+	if (adreno_is_a650(adreno_gpu) || adreno_is_a702(adreno_gpu)) {
 		regs = a650_protect;
 		count = ARRAY_SIZE(a650_protect);
 		count_max = 48;
@@ -1320,6 +1381,12 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 		gpu->ubwc_config.rgb565_predicator = 1;
 		gpu->ubwc_config.uavflagprd_inv = 2;
 	}
+
+	if (adreno_is_a702(gpu)) {
+		gpu->ubwc_config.highest_bank_bit = 14;
+		gpu->ubwc_config.min_acc_len = 1;
+		gpu->ubwc_config.ubwc_mode = 2;
+	}
 }
 
 static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
@@ -1453,7 +1520,7 @@ static bool a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
 		return false;
 
 	/* A7xx is safe! */
-	if (adreno_is_a7xx(adreno_gpu))
+	if (adreno_is_a7xx(adreno_gpu) || adreno_is_a702(adreno_gpu))
 		return true;
 
 	/*
@@ -1671,7 +1738,7 @@ static int hw_init(struct msm_gpu *gpu)
 	a6xx_set_hwcg(gpu, true);
 
 	/* VBIF/GBIF start*/
-	if (adreno_is_a610(adreno_gpu) ||
+	if (adreno_is_a610_family(adreno_gpu) ||
 	    adreno_is_a640_family(adreno_gpu) ||
 	    adreno_is_a650_family(adreno_gpu) ||
 	    adreno_is_a7xx(adreno_gpu)) {
@@ -1705,6 +1772,7 @@ static int hw_init(struct msm_gpu *gpu)
 	}
 
 	if (!(adreno_is_a650_family(adreno_gpu) ||
+	      adreno_is_a702(adreno_gpu) ||
 	      adreno_is_a730(adreno_gpu))) {
 		gmem_range_min = adreno_is_a740_family(adreno_gpu) ? SZ_16M : SZ_1M;
 
@@ -1725,7 +1793,7 @@ static int hw_init(struct msm_gpu *gpu)
 	if (adreno_is_a640_family(adreno_gpu) || adreno_is_a650_family(adreno_gpu)) {
 		gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_2, 0x02000140);
 		gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_1, 0x8040362c);
-	} else if (adreno_is_a610(adreno_gpu)) {
+	} else if (adreno_is_a610_family(adreno_gpu)) {
 		gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_2, 0x00800060);
 		gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_1, 0x40201b16);
 	} else if (!adreno_is_a7xx(adreno_gpu)) {
@@ -1740,13 +1808,18 @@ static int hw_init(struct msm_gpu *gpu)
 	if (adreno_is_a610(adreno_gpu)) {
 		gpu_write(gpu, REG_A6XX_CP_MEM_POOL_SIZE, 48);
 		gpu_write(gpu, REG_A6XX_CP_MEM_POOL_DBG_ADDR, 47);
+	} else if (adreno_is_a702(adreno_gpu)) {
+		gpu_write(gpu, REG_A6XX_CP_MEM_POOL_SIZE, 64);
+		gpu_write(gpu, REG_A6XX_CP_MEM_POOL_DBG_ADDR, 63);
 	} else if (!adreno_is_a7xx(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_CP_MEM_POOL_SIZE, 128);
 
 	/* Setting the primFifo thresholds default values,
 	 * and vccCacheSkipDis=1 bit (0x200) for A640 and newer
 	*/
-	if (adreno_is_a690(adreno_gpu))
+	if (adreno_is_a702(adreno_gpu))
+		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x0000c000);
+	else if (adreno_is_a690(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00800200);
 	else if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
@@ -1786,7 +1859,7 @@ static int hw_init(struct msm_gpu *gpu)
 		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x4fffff);
 	else if (adreno_is_a619(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x3fffff);
-	else if (adreno_is_a610(adreno_gpu))
+	else if (adreno_is_a610(adreno_gpu) || adreno_is_a702(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x3ffff);
 	else
 		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x1fffff);
@@ -1822,6 +1895,9 @@ static int hw_init(struct msm_gpu *gpu)
 		else
 			gpu_write(gpu, REG_A6XX_CP_CHICKEN_DBG, 0x1);
 		gpu_write(gpu, REG_A6XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x0);
+	} else if (adreno_is_a702(adreno_gpu)) {
+		/* Something to do with the HLSQ cluster */
+		gpu_write(gpu, REG_A6XX_CP_CHICKEN_DBG, BIT(24));
 	}
 
 	if (adreno_is_a690(adreno_gpu))
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 2ce7d7b1690d..b121abc71338 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -492,6 +492,24 @@ static const struct adreno_info gpulist[] = {
 		.zapfw = "a690_zap.mdt",
 		.hwcg = a690_hwcg,
 		.address_space_size = SZ_16G,
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x07000200),
+		.family = ADRENO_6XX_GEN1, /* NOT a mistake! */
+		.fw = {
+			[ADRENO_FW_SQE] = "a702_sqe.fw",
+		},
+		.gmem = SZ_128K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
+		.init = a6xx_gpu_init,
+		.zapfw = "a702_zap.mbn",
+		.hwcg = a702_hwcg,
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0,   0 },
+			{ 236, 1 },
+			{ 178, 2 },
+			{ 142, 3 },
+		),
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x07030001),
 		.family = ADRENO_7XX_GEN1,
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index bc14df96feb0..f451881a6ddf 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -77,7 +77,7 @@ struct adreno_reglist {
 };
 
 extern const struct adreno_reglist a612_hwcg[], a615_hwcg[], a630_hwcg[], a640_hwcg[], a650_hwcg[];
-extern const struct adreno_reglist a660_hwcg[], a690_hwcg[], a730_hwcg[], a740_hwcg[];
+extern const struct adreno_reglist a660_hwcg[], a690_hwcg[], a702_hwcg[], a730_hwcg[], a740_hwcg[];
 
 struct adreno_speedbin {
 	uint16_t fuse;
@@ -382,6 +382,20 @@ static inline int adreno_is_a690(const struct adreno_gpu *gpu)
 	return gpu->info->chip_ids[0] == 0x06090000;
 }
 
+static inline int adreno_is_a702(const struct adreno_gpu *gpu)
+{
+	return gpu->info->chip_ids[0] == 0x07000200;
+}
+
+static inline int adreno_is_a610_family(const struct adreno_gpu *gpu)
+{
+	if (WARN_ON_ONCE(!gpu->info))
+		return false;
+
+	/* TODO: A612 */
+	return adreno_is_a610(gpu) || adreno_is_a702(gpu);
+}
+
 /* check for a615, a616, a618, a619 or any a630 derivatives */
 static inline int adreno_is_a630_family(const struct adreno_gpu *gpu)
 {

-- 
2.43.2

