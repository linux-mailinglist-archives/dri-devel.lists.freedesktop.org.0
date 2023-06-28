Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 245AB74199C
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jun 2023 22:36:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3AEB10E3AB;
	Wed, 28 Jun 2023 20:35:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16DB410E39E
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 20:35:45 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4fb7dc16ff0so84806e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 13:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687984543; x=1690576543;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WTStrivCNcXaZeJsJ9HCMtB7JzMW0D/pb8rIoHXnbSo=;
 b=e1LDB3wMXkkJFGjEbTsKA9LAi2JNLsQ2Fkv9z6nFmOqDmtSIwmUXexKgZcnkBaKlm3
 8vDfea+l2JtotBarM704SaLFR7mOHcG6gw+WlaccggRimcNfXFpS9UfS/9qupPDImkFv
 IwmZyarCuLAsRCf+TaU6AgtboocqHZshwpzhsKsZGK6d2Pb4eVp+27aHUNb5ysOpu4aW
 Pg6e8rgDBSTi668zmavh9XZz67VyDwACro6IBltqGcot/DSnQXp8AgXqN0TeHVoaG0bM
 MtSFfV0zwsa2JeHsd1XI+IZ/UChzvyUQfOhwrq/ZcX5YHGdlDpdO5ZjEUt1rWajjMLVV
 8aZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687984543; x=1690576543;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WTStrivCNcXaZeJsJ9HCMtB7JzMW0D/pb8rIoHXnbSo=;
 b=CQUJFhfpvHsG+CuM+nqseb7B0XesakghenMAwoW+Aw2h+gtHS6b7oPJmN0EpmINoue
 eKrDx0js5jitwwPqcyxMJ9qGuOxEyrJUzUQU4tvf3mGb0ZFqllXmteRjoydhhfX9YMzo
 ijzH8PRzfITKemD9rOIPSkO1UBSdhJhlinA9dOQZqmoKeACKdjPi/6WUalYEUYeftCHS
 FRdHaN8OQcqFuVlWnZddcqSE+7ZASSJ0TgiTO5JUk74Dyv+qhiL/NMGMMvCczq4xZRXj
 5UZUAHLYsKm3p3/ciIOoFaE6x6bqRfXlZe6Lt8gxWPDd/9jYH7yKwmFZ6pEvxPi3yGrG
 Rf3A==
X-Gm-Message-State: AC+VfDxDGl4UXRb8d7bNWGc5l5RXVt0xQ+m8J2d+gkK8HrPgWHHyHsg/
 YzCkqc/XR17PG8bYJgiEbIP2xA==
X-Google-Smtp-Source: ACHHUZ5PtvfgSNoOsMlw4Qo6CT85SlGampHXL1WBtW5hwHS65WQ8PQexL/OQPDz9/Igf4rmXdnBD5Q==
X-Received: by 2002:a05:6512:224f:b0:4fb:7b4c:d38c with SMTP id
 i15-20020a056512224f00b004fb7b4cd38cmr7121546lfu.60.1687984543257; 
 Wed, 28 Jun 2023 13:35:43 -0700 (PDT)
Received: from [192.168.1.101] (abyk82.neoplus.adsl.tpnet.pl. [83.9.30.82])
 by smtp.gmail.com with ESMTPSA id
 m25-20020a056512015900b004fb86c89fa1sm753363lfo.135.2023.06.28.13.35.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jun 2023 13:35:42 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 28 Jun 2023 22:35:12 +0200
Subject: [PATCH 12/14] drm/msm/a6xx: Add A740 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-a7xx_drmmsm-v1-12-a7f4496e0c12@linaro.org>
References: <20230628-topic-a7xx_drmmsm-v1-0-a7f4496e0c12@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v1-0-a7f4496e0c12@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687984524; l=17191;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=un7k6J2OW0N+CR6sbEuhCMSjHtr8qQJfzDui0P5WZ/w=;
 b=VdFR5pdGSMqOvjp7L1mdulaP7C59e/eOBPPbdmFFVPlwEsSsRkPf7g94xaDIoc3AUE9XXbV6c
 O2fyK65yQA7BbiV4RXHfWozaODHHGiK6miT1edoJZ1bLHQ4ILJiNfzD
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A740 builds upon the A730 IP, shuffling some values and registers
around. More differences will appear when things like BCL are
implemented.

adreno_is_a740_family is added in preparation for more A7xx GPUs,
the logic checks will be valid resulting in smaller diffs.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 72 +++++++++++++++++++--------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 79 +++++++++++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c      | 27 ++++++++++
 drivers/gpu/drm/msm/adreno/adreno_device.c | 13 +++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    |  6 ++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 15 +++++-
 6 files changed, 181 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 9593a4e216d6..78268f96eec7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -516,6 +516,7 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	struct platform_device *pdev = to_platform_device(gmu->dev);
 	void __iomem *pdcptr = a6xx_gmu_get_mmio(pdev, "gmu_pdc");
+	u32 seqmem0_drv0_reg = REG_A6XX_RSCC_SEQ_MEM_0_DRV0;
 	void __iomem *seqptr = NULL;
 	uint32_t pdc_address_offset;
 	bool pdc_in_aop = false;
@@ -549,21 +550,26 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 	gmu_write_rscc(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_ADDR, 0);
 	gmu_write_rscc(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_DATA + 2, 0);
 	gmu_write_rscc(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_ADDR + 2, 0);
-	gmu_write_rscc(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_DATA + 4, 0x80000000);
+	gmu_write_rscc(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_DATA + 4,
+		       adreno_is_a740_family(adreno_gpu) ? 0x80000021 : 0x80000000);
 	gmu_write_rscc(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_ADDR + 4, 0);
 	gmu_write_rscc(gmu, REG_A6XX_RSCC_OVERRIDE_START_ADDR, 0);
 	gmu_write_rscc(gmu, REG_A6XX_RSCC_PDC_SEQ_START_ADDR, 0x4520);
 	gmu_write_rscc(gmu, REG_A6XX_RSCC_PDC_MATCH_VALUE_LO, 0x4510);
 	gmu_write_rscc(gmu, REG_A6XX_RSCC_PDC_MATCH_VALUE_HI, 0x4514);
 
+	/* The second spin of A7xx GPUs messed with some register offsets.. */
+	if (adreno_is_a740_family(adreno_gpu))
+		seqmem0_drv0_reg = REG_A7XX_RSCC_SEQ_MEM_0_DRV0_A740;
+
 	/* Load RSC sequencer uCode for sleep and wakeup */
 	if (adreno_is_a650_family(adreno_gpu) ||
 	    adreno_is_a7xx(adreno_gpu)) {
-		gmu_write_rscc(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0, 0xeaaae5a0);
-		gmu_write_rscc(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0 + 1, 0xe1a1ebab);
-		gmu_write_rscc(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0 + 2, 0xa2e0a581);
-		gmu_write_rscc(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0 + 3, 0xecac82e2);
-		gmu_write_rscc(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0 + 4, 0x0020edad);
+		gmu_write_rscc(gmu, seqmem0_drv0_reg, 0xeaaae5a0);
+		gmu_write_rscc(gmu, seqmem0_drv0_reg + 1, 0xe1a1ebab);
+		gmu_write_rscc(gmu, seqmem0_drv0_reg + 2, 0xa2e0a581);
+		gmu_write_rscc(gmu, seqmem0_drv0_reg + 3, 0xecac82e2);
+		gmu_write_rscc(gmu, seqmem0_drv0_reg + 4, 0x0020edad);
 	} else {
 		gmu_write_rscc(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0, 0xa7a506a0);
 		gmu_write_rscc(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0 + 1, 0xa1e6a6e7);
@@ -767,8 +773,8 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	u32 fence_range_lower, fence_range_upper;
+	u32 chipid, chipid_min = 0;
 	int ret;
-	u32 chipid;
 
 	/* Vote veto for FAL10 */
 	if (adreno_is_a650_family(adreno_gpu) || adreno_is_a7xx(adreno_gpu)) {
@@ -827,10 +833,27 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 	 */
 	gmu_write(gmu, REG_A6XX_GMU_CM3_CFG, 0x4052);
 
-	chipid = adreno_gpu->rev.core << 24;
-	chipid |= adreno_gpu->rev.major << 16;
-	chipid |= adreno_gpu->rev.minor << 12;
-	chipid |= adreno_gpu->rev.patchid << 8;
+	/* NOTE: A730 may also fall in this if-condition with a future GMU fw update. */
+	if (adreno_is_a7xx(adreno_gpu) && !adreno_is_a730(adreno_gpu)) {
+		/* A7xx GPUs have obfuscated chip IDs. Use constant maj = 7 */
+		chipid = FIELD_PREP(GENMASK(31, 24), 0x7);
+
+		/* The min part has a 1-1 mapping for each GPU SKU */
+		if (adreno_is_a740(adreno_gpu))
+			chipid_min = 2; /* GEN7_2_x */
+		else
+			return -EINVAL;
+
+		chipid |= FIELD_PREP(GENMASK(23, 16), chipid_min);
+
+		/* Get the patchid (which may vary) from the device tree */
+		chipid |= FIELD_PREP(GENMASK(15, 8), adreno_gpu->rev.patchid);
+	} else {
+		chipid = adreno_gpu->rev.core << 24;
+		chipid |= adreno_gpu->rev.major << 16;
+		chipid |= adreno_gpu->rev.minor << 12;
+		chipid |= adreno_gpu->rev.patchid << 8;
+	}
 
 	if (adreno_is_a7xx(adreno_gpu)) {
 		gmu_write(gmu, REG_A6XX_GMU_GENERAL_10, chipid);
@@ -893,17 +916,23 @@ static void a6xx_gmu_irq_disable(struct a6xx_gmu *gmu)
 
 static void a6xx_gmu_rpmh_off(struct a6xx_gmu *gmu)
 {
-	u32 val;
+	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
+	u32 val, seqmem_off = 0;
+
+	/* The second spin of A7xx GPUs messed with some register offsets.. */
+	if (adreno_is_a740_family(adreno_gpu))
+		seqmem_off = 4;
 
 	/* Make sure there are no outstanding RPMh votes */
-	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS0_DRV0_STATUS, val,
-		(val & 1), 100, 10000);
-	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS1_DRV0_STATUS, val,
-		(val & 1), 100, 10000);
-	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS2_DRV0_STATUS, val,
-		(val & 1), 100, 10000);
-	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS3_DRV0_STATUS, val,
-		(val & 1), 100, 1000);
+	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS0_DRV0_STATUS + seqmem_off,
+		val, (val & 1), 100, 10000);
+	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS1_DRV0_STATUS + seqmem_off,
+		val, (val & 1), 100, 10000);
+	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS2_DRV0_STATUS + seqmem_off,
+		val, (val & 1), 100, 10000);
+	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS3_DRV0_STATUS + seqmem_off,
+		val, (val & 1), 100, 1000);
 }
 
 /* Force the GMU off in case it isn't responsive */
@@ -1013,7 +1042,8 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 
 	/* Use a known rate to bring up the GMU */
 	clk_set_rate(gmu->core_clk, 200000000);
-	clk_set_rate(gmu->hub_clk, 150000000);
+	clk_set_rate(gmu->hub_clk, adreno_is_a740_family(adreno_gpu) ?
+		     200000000 : 150000000);
 	ret = clk_bulk_prepare_enable(gmu->nr_clocks, gmu->clocks);
 	if (ret) {
 		pm_runtime_put(gmu->gxpd);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index bf8c8de62aa7..fac325217a7e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -894,6 +894,64 @@ const struct adreno_reglist a730_hwcg[] = {
 	{},
 };
 
+const struct adreno_reglist a740_hwcg[] = {
+	{ REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x02222222 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x22022222 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_SP0, 0x003cf3cf },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_SP0, 0x00000080 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_TP0, 0x22222220 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL2_TP0, 0x22222222 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL3_TP0, 0x22222222 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL4_TP0, 0x00222222 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_TP0, 0x77777777 },
+	{ REG_A6XX_RBBM_CLOCK_HYST2_TP0, 0x77777777 },
+	{ REG_A6XX_RBBM_CLOCK_HYST3_TP0, 0x77777777 },
+	{ REG_A6XX_RBBM_CLOCK_HYST4_TP0, 0x00077777 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_TP0, 0x11111111 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY2_TP0, 0x11111111 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY3_TP0, 0x11111111 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY4_TP0, 0x00011111 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_UCHE, 0x22222222 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL2_UCHE, 0x00222222 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_UCHE, 0x00000444 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_UCHE, 0x00000222 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_RB0, 0x22222222 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL2_RB0, 0x01002222 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_CCU0, 0x00002220 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_RB_CCU0, 0x44000f00 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_RAC, 0x25222022 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL2_RAC, 0x00555555 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_RAC, 0x00000011 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_RAC, 0x00440044 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_TSE_RAS_RBBM, 0x04222222 },
+	{ REG_A7XX_RBBM_CLOCK_MODE2_GRAS, 0x00000222 },
+	{ REG_A7XX_RBBM_CLOCK_MODE_BV_GRAS, 0x00222222 },
+	{ REG_A6XX_RBBM_CLOCK_MODE_GPC, 0x02222223 },
+	{ REG_A6XX_RBBM_CLOCK_MODE_VFD, 0x00222222 },
+	{ REG_A7XX_RBBM_CLOCK_MODE_BV_GPC, 0x00222222 },
+	{ REG_A7XX_RBBM_CLOCK_MODE_BV_VFD, 0x00002222 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_TSE_RAS_RBBM, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_GPC, 0x04104004 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_VFD, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_TSE_RAS_RBBM, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_GPC, 0x00000200 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_VFD, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_MODE_HLSQ, 0x00002222 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_HLSQ, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_HLSQ, 0x00000000 },
+	{ REG_A7XX_RBBM_CLOCK_MODE_BV_LRZ, 0x55555552 },
+	{ REG_A7XX_RBBM_CLOCK_HYST2_VFD, 0x00000000 },
+	{ REG_A7XX_RBBM_CLOCK_MODE_CP, 0x00000222 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL, 0x8aa8aa82 },
+	{ REG_A6XX_RBBM_ISDB_CNT, 0x00000182 },
+	{ REG_A6XX_RBBM_RAC_THRESHOLD_CNT, 0x00000000 },
+	{ REG_A6XX_RBBM_SP_HYST_CNT, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_GMU_GX, 0x00000222 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_GMU_GX, 0x00000111 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555 },
+	{},
+};
+
 static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -901,7 +959,7 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 	const struct adreno_reglist *reg;
 	unsigned int i;
-	u32 val, clock_cntl_on;
+	u32 val, clock_cntl_on, cgc_mode;
 
 	if (!adreno_gpu->info->hwcg)
 		return;
@@ -914,8 +972,10 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 		clock_cntl_on = 0x8aa8aa82;
 
 	if (adreno_is_a7xx(adreno_gpu)) {
+		cgc_mode = adreno_is_a740_family(adreno_gpu) ? 0x20222 : 0x20000;
+
 		gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_MODE_CNTL,
-			  state ? 0x20000 : 0);
+			  state ? cgc_mode : 0);
 		gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_DELAY_CNTL,
 			  state ? 0x10111 : 0);
 		gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_HYST_CNTL,
@@ -1179,7 +1239,7 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
 		count = ARRAY_SIZE(a660_protect);
 		count_max = 48;
 		BUILD_BUG_ON(ARRAY_SIZE(a660_protect) > 48);
-	} else if (adreno_is_a730(adreno_gpu)) {
+	} else if (adreno_is_a730(adreno_gpu) || adreno_is_a740(adreno_gpu)) {
 		regs = a730_protect;
 		count = ARRAY_SIZE(a730_protect);
 		count_max = 48;
@@ -1252,7 +1312,8 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 
 	if (adreno_is_a650(adreno_gpu) ||
 	    adreno_is_a660(adreno_gpu) ||
-	    adreno_is_a730(adreno_gpu)) {
+	    adreno_is_a730(adreno_gpu) ||
+	    adreno_is_a740_family(adreno_gpu)) {
 		/* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
 		hbb_lo = 3;
 		amsbc = 1;
@@ -1545,6 +1606,7 @@ static int hw_init(struct msm_gpu *gpu)
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
+	u64 gmem_range_min;
 	int ret;
 
 	if (!adreno_has_gmu_wrapper(adreno_gpu)) {
@@ -1635,11 +1697,13 @@ static int hw_init(struct msm_gpu *gpu)
 
 	if (!(adreno_is_a650_family(adreno_gpu) ||
 	      adreno_is_a730(adreno_gpu))) {
+		gmem_range_min = adreno_is_a740_family(adreno_gpu) ? SZ_16M : SZ_1M;
+
 		/* Set the GMEM VA range [0x100000:0x100000 + gpu->gmem - 1] */
-		gpu_write64(gpu, REG_A6XX_UCHE_GMEM_RANGE_MIN, 0x00100000);
+		gpu_write64(gpu, REG_A6XX_UCHE_GMEM_RANGE_MIN, gmem_range_min);
 
 		gpu_write64(gpu, REG_A6XX_UCHE_GMEM_RANGE_MAX,
-			0x00100000 + adreno_gpu->gmem - 1);
+			gmem_range_min + adreno_gpu->gmem - 1);
 	}
 
 	if (adreno_is_a7xx(adreno_gpu))
@@ -1704,7 +1768,8 @@ static int hw_init(struct msm_gpu *gpu)
 	a6xx_set_ubwc_config(gpu);
 
 	/* Enable fault detection */
-	if (adreno_is_a730(adreno_gpu))
+	if (adreno_is_a730(adreno_gpu) ||
+	    adreno_is_a740_family(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0xcfffff);
 	else if (adreno_is_a619(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x3fffff);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index 3865cd44523c..cdb3f6e74d3e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -565,6 +565,31 @@ static void a730_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 	msg->cnoc_cmds_data[1][0] = 0x60000001;
 }
 
+static void a740_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
+{
+	msg->bw_level_num = 1;
+
+	msg->ddr_cmds_num = 3;
+	msg->ddr_wait_bitmask = 0x7;
+
+	msg->ddr_cmds_addrs[0] = cmd_db_read_addr("SH0");
+	msg->ddr_cmds_addrs[1] = cmd_db_read_addr("MC0");
+	msg->ddr_cmds_addrs[2] = cmd_db_read_addr("ACV");
+
+	msg->ddr_cmds_data[0][0] = 0x40000000;
+	msg->ddr_cmds_data[0][1] = 0x40000000;
+	msg->ddr_cmds_data[0][2] = 0x40000000;
+
+	/* TODO: add a proper dvfs table */
+
+	msg->cnoc_cmds_num = 1;
+	msg->cnoc_wait_bitmask = 0x1;
+
+	msg->cnoc_cmds_addrs[0] = cmd_db_read_addr("CN0");
+	msg->cnoc_cmds_data[0][0] = 0x40000000;
+	msg->cnoc_cmds_data[1][0] = 0x60000001;
+}
+
 static void a6xx_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 {
 	/* Send a single "off" entry since the 630 GMU doesn't do bus scaling */
@@ -625,6 +650,8 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
 		a690_build_bw_table(&msg);
 	else if (adreno_is_a730(adreno_gpu))
 		a730_build_bw_table(&msg);
+	else if (adreno_is_a740_family(adreno_gpu))
+		a740_build_bw_table(&msg);
 	else
 		a6xx_build_bw_table(&msg);
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 822a36b796eb..3ae247c0a0df 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -394,6 +394,19 @@ static const struct adreno_info gpulist[] = {
 		.zapfw = "a730_zap.mdt",
 		.hwcg = a730_hwcg,
 		.address_space_size = SZ_16G,
+	}, {
+		.rev = ADRENO_REV(7, 4, 0, ANY_ID),
+		.revn = 740,
+		.fw = {
+			[ADRENO_FW_SQE] = "a740_sqe.fw",
+			[ADRENO_FW_GMU] = "gmu_gen70200.bin",
+		},
+		.gmem = 3 * SZ_1M,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.init = a6xx_gpu_init,
+		.zapfw = "a740_zap.mdt",
+		.hwcg = a740_hwcg,
+		.address_space_size = SZ_16G,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 75c673cd75fb..4254d5ffecad 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -323,7 +323,11 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 		*value = adreno_gpu->gmem;
 		return 0;
 	case MSM_PARAM_GMEM_BASE:
-		*value = !adreno_is_a650_family(adreno_gpu) ? 0x100000 : 0;
+		if (adreno_is_a650_family(adreno_gpu) ||
+		    adreno_is_a740_family(adreno_gpu))
+			*value = 0;
+		else
+			*value = 0x100000;
 		return 0;
 	case MSM_PARAM_CHIP_ID:
 		*value =  (uint64_t)adreno_gpu->rev.patchid |
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 3e0e160761c4..8a8a462dd9ee 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -56,7 +56,7 @@ struct adreno_reglist {
 };
 
 extern const struct adreno_reglist a612_hwcg[], a615_hwcg[], a630_hwcg[], a640_hwcg[], a650_hwcg[];
-extern const struct adreno_reglist a660_hwcg[], a690_hwcg[], a730_hwcg[];
+extern const struct adreno_reglist a660_hwcg[], a690_hwcg[], a730_hwcg[], a740_hwcg[];
 
 struct adreno_info {
 	struct adreno_rev rev;
@@ -342,10 +342,21 @@ static inline int adreno_is_a730(struct adreno_gpu *gpu)
 	return adreno_cmp_rev(ADRENO_REV(7, 3, 0, ANY_ID), gpu->rev);
 }
 
+static inline int adreno_is_a740(struct adreno_gpu *gpu)
+{
+	return adreno_cmp_rev(ADRENO_REV(7, 4, 0, ANY_ID), gpu->rev);
+}
+
+/* Placeholder to make future diffs smaller */
+static inline int adreno_is_a740_family(struct adreno_gpu *gpu)
+{
+	return adreno_is_a740(gpu);
+}
+
 static inline int adreno_is_a7xx(struct adreno_gpu *gpu)
 {
 	/* Update with non-fake (i.e. non-A702) Gen 7 GPUs */
-	return adreno_is_a730(gpu);
+	return adreno_is_a730(gpu) || adreno_is_a740_family(gpu);
 }
 
 u64 adreno_private_address_space_size(struct msm_gpu *gpu);

-- 
2.41.0

