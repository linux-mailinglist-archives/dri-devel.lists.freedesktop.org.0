Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1B370A7E7
	for <lists+dri-devel@lfdr.de>; Sat, 20 May 2023 14:20:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BA6F10E17D;
	Sat, 20 May 2023 12:20:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A1810E183
 for <dri-devel@lists.freedesktop.org>; Sat, 20 May 2023 12:20:10 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4f2676d62a2so4638123e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 20 May 2023 05:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684585208; x=1687177208;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7C+pF8/usv1l1aChGNQR22UTA4iPCLNRGIL2U/8hoPQ=;
 b=xRL2hYc9fz49jfQzIFlXHz7XXIUI1FmTddnlV58/YxqJ3iWsfGCXU0Ips8Bix5L24Q
 7ZZB4ewjfl44QJhu3e18IQ4heMhRjE2HrbhoJHv3eRu77qqvUSLErSF7qRudrvbHSitg
 zo4JpXtsnCOFO4FALuI0xbfiTdMwJ/3TEtOvZW0onULbZ3/m+FSq4tpL9ueefVbDhNSS
 S4BAo/vDtXIuZK5W4+dd6pkGdG0+EJc67WjIyG7D6aUqdFhqxw5HOzEs4eusmE5xq0Ny
 c/868fUCYuWjUAkIQi+NZ36Nw3CVLGS5QiwLtIGD+5gUj9DPm+9vNOnDDSKnsdONP8F9
 oweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684585208; x=1687177208;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7C+pF8/usv1l1aChGNQR22UTA4iPCLNRGIL2U/8hoPQ=;
 b=A9z6opNxuhYTj5+SRNUD1aPsW7RA4wMr19d8qvMJwgyFQEoEaeKqqgXkx9b4mwdrLZ
 8zBVCt63NitQRLeF/nC5sr2MwLD/UwKiKyhp72Qc1CeUgMdbssZR6QRi7MHBsikaGJUj
 cplCuOap8EzFEprl5V1xEYR7bF6oqdN2xI414ajJ7zIoL7Kt4qN0+hfh4jDQsPaXKsuh
 thvB5DyIXmac/WB9nGwLGZo+P2CXFgapkWDzCgXCKtSUkB+iOi5Ys7IlNx0Go5btm/AP
 DECjk+2vcqbi2iX6h0CByXZC3jc+uwhYA8Y6rIKHcJpeJo/yyA4cgqIAGvCD1mVhd0e7
 2Gzw==
X-Gm-Message-State: AC+VfDwvbwrLzzT5DTI8AUcFgI3qoiTWXIQGodphv8eclHNISDF1orjO
 Jvxbip+PZPQd+bUyamNI0j4KOg==
X-Google-Smtp-Source: ACHHUZ4HaFarkyJ562V7MPn0azOi753aioOSwyfY5XJbL3LQrdHlCSCgEqH2xSeB9b8TW8pau9KmiA==
X-Received: by 2002:ac2:5506:0:b0:4dd:a73f:aede with SMTP id
 j6-20020ac25506000000b004dda73faedemr1859870lfk.10.1684585208428; 
 Sat, 20 May 2023 05:20:08 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
 by smtp.gmail.com with ESMTPSA id
 y6-20020ac24466000000b004f37bd02a89sm244766lfl.287.2023.05.20.05.20.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 May 2023 05:20:08 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 20 May 2023 14:19:53 +0200
Subject: [PATCH v7 13/18] drm/msm/a6xx: Add A610 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v7-13-ecc7aab83556@linaro.org>
References: <20230223-topic-gmuwrapper-v7-0-ecc7aab83556@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v7-0-ecc7aab83556@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684585186; l=11126;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=mqhO+VDc3oGlH46wfwjgdQ8dOM9g+DIEMLNtt31EsOw=;
 b=zIeMdwjZBsK4lOIdCLHy+AJkUPlkiqVLyY7dZfMAOodJUHYNvvFcDuseL5EHHfN5KlJW9y14+
 YkvTwqp3ROUCrNOwEYVWBeFVyw/3lQ3cd1DGb8p/8EKv+73imGVc2SD
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A610 is one of (if not the) lowest-tier SKUs in the A6XX family. It
features no GMU, as it's implemented solely on SoCs with SMD_RPM.
What's more interesting is that it does not feature a VDDGX line
either, being powered solely by VDDCX and has an unfortunate hardware
quirk that makes its reset line broken - after a couple of assert/
deassert cycles, it will hang for good and will not wake up again.

This GPU requires mesa changes for proper rendering, and lots of them
at that. The command streams are quite far away from any other A6XX
GPU and hence it needs special care. This patch was validated both
by running an (incomplete) downstream mesa with some hacks (frames
rendered correctly, though some instructions made the GPU hangcheck
which is expected - garbage in, garbage out) and by replaying RD
traces captured with the downstream KGSL driver - no crashes there,
ever.

Add support for this GPU on the kernel side, which comes down to
pretty simply adding A612 HWCG tables, altering a few values and
adding a special case for handling the reset line.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 101 +++++++++++++++++++++++++----
 drivers/gpu/drm/msm/adreno/adreno_device.c |  12 ++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |   8 ++-
 3 files changed, 108 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 7eaebcefcb2a..ca055bff23c8 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -252,6 +252,56 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	a6xx_flush(gpu, ring);
 }
 
+const struct adreno_reglist a612_hwcg[] = {
+	{REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
+	{REG_A6XX_RBBM_CLOCK_DELAY_SP0, 0x00000081},
+	{REG_A6XX_RBBM_CLOCK_HYST_SP0, 0x0000f3cf},
+	{REG_A6XX_RBBM_CLOCK_CNTL_TP0, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_TP0, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL3_TP0, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL4_TP0, 0x00022222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_TP0, 0x11111111},
+	{REG_A6XX_RBBM_CLOCK_DELAY2_TP0, 0x11111111},
+	{REG_A6XX_RBBM_CLOCK_DELAY3_TP0, 0x11111111},
+	{REG_A6XX_RBBM_CLOCK_DELAY4_TP0, 0x00011111},
+	{REG_A6XX_RBBM_CLOCK_HYST_TP0, 0x77777777},
+	{REG_A6XX_RBBM_CLOCK_HYST2_TP0, 0x77777777},
+	{REG_A6XX_RBBM_CLOCK_HYST3_TP0, 0x77777777},
+	{REG_A6XX_RBBM_CLOCK_HYST4_TP0, 0x00077777},
+	{REG_A6XX_RBBM_CLOCK_CNTL_RB0, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_RB0, 0x01202222},
+	{REG_A6XX_RBBM_CLOCK_CNTL_CCU0, 0x00002220},
+	{REG_A6XX_RBBM_CLOCK_HYST_RB_CCU0, 0x00040f00},
+	{REG_A6XX_RBBM_CLOCK_CNTL_RAC, 0x05522022},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_RAC, 0x00005555},
+	{REG_A6XX_RBBM_CLOCK_DELAY_RAC, 0x00000011},
+	{REG_A6XX_RBBM_CLOCK_HYST_RAC, 0x00445044},
+	{REG_A6XX_RBBM_CLOCK_CNTL_TSE_RAS_RBBM, 0x04222222},
+	{REG_A6XX_RBBM_CLOCK_MODE_VFD, 0x00002222},
+	{REG_A6XX_RBBM_CLOCK_MODE_GPC, 0x02222222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_HLSQ_2, 0x00000002},
+	{REG_A6XX_RBBM_CLOCK_MODE_HLSQ, 0x00002222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_TSE_RAS_RBBM, 0x00004000},
+	{REG_A6XX_RBBM_CLOCK_DELAY_VFD, 0x00002222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_GPC, 0x00000200},
+	{REG_A6XX_RBBM_CLOCK_DELAY_HLSQ, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_HYST_TSE_RAS_RBBM, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_HYST_VFD, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_HYST_GPC, 0x04104004},
+	{REG_A6XX_RBBM_CLOCK_HYST_HLSQ, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_CNTL_UCHE, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_HYST_UCHE, 0x00000004},
+	{REG_A6XX_RBBM_CLOCK_DELAY_UCHE, 0x00000002},
+	{REG_A6XX_RBBM_ISDB_CNT, 0x00000182},
+	{REG_A6XX_RBBM_RAC_THRESHOLD_CNT, 0x00000000},
+	{REG_A6XX_RBBM_SP_HYST_CNT, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_CNTL_GMU_GX, 0x00000222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_GMU_GX, 0x00000111},
+	{REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555},
+	{},
+};
+
 /* For a615 family (a615, a616, a618 and a619) */
 const struct adreno_reglist a615_hwcg[] = {
 	{REG_A6XX_RBBM_CLOCK_CNTL_SP0,  0x02222222},
@@ -602,6 +652,8 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 
 	if (adreno_is_a630(adreno_gpu))
 		clock_cntl_on = 0x8aa8aa02;
+	else if (adreno_is_a610(adreno_gpu))
+		clock_cntl_on = 0xaaa8aa82;
 	else
 		clock_cntl_on = 0x8aa8aa82;
 
@@ -612,13 +664,15 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 		return;
 
 	/* Disable SP clock before programming HWCG registers */
-	gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 1, 0);
+	if (!adreno_is_a610(adreno_gpu))
+		gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 1, 0);
 
 	for (i = 0; (reg = &adreno_gpu->info->hwcg[i], reg->offset); i++)
 		gpu_write(gpu, reg->offset, state ? reg->value : 0);
 
 	/* Enable SP clock */
-	gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 0, 1);
+	if (!adreno_is_a610(adreno_gpu))
+		gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 0, 1);
 
 	gpu_write(gpu, REG_A6XX_RBBM_CLOCK_CNTL, state ? clock_cntl_on : 0);
 }
@@ -806,6 +860,13 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	/* Unknown, introduced with A640/680 */
 	u32 amsbc = 0;
 
+	if (adreno_is_a610(adreno_gpu)) {
+		/* HBB = 14 */
+		hbb_lo = 1;
+		min_acc_len = 1;
+		ubwc_mode = 1;
+	}
+
 	/* a618 is using the hw default values */
 	if (adreno_is_a618(adreno_gpu))
 		return;
@@ -1073,13 +1134,13 @@ static int hw_init(struct msm_gpu *gpu)
 	a6xx_set_hwcg(gpu, true);
 
 	/* VBIF/GBIF start*/
-	if (adreno_is_a640_family(adreno_gpu) ||
+	if (adreno_is_a610(adreno_gpu) ||
+	    adreno_is_a640_family(adreno_gpu) ||
 	    adreno_is_a650_family(adreno_gpu)) {
 		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE0, 0x00071620);
 		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE1, 0x00071620);
 		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE2, 0x00071620);
 		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE3, 0x00071620);
-		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE3, 0x00071620);
 		gpu_write(gpu, REG_A6XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x3);
 	} else {
 		gpu_write(gpu, REG_A6XX_RBBM_VBIF_CLIENT_QOS_CNTL, 0x3);
@@ -1107,18 +1168,26 @@ static int hw_init(struct msm_gpu *gpu)
 	gpu_write(gpu, REG_A6XX_UCHE_FILTER_CNTL, 0x804);
 	gpu_write(gpu, REG_A6XX_UCHE_CACHE_WAYS, 0x4);
 
-	if (adreno_is_a640_family(adreno_gpu) ||
-	    adreno_is_a650_family(adreno_gpu))
+	if (adreno_is_a640_family(adreno_gpu) || adreno_is_a650_family(adreno_gpu)) {
 		gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_2, 0x02000140);
-	else
+		gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_1, 0x8040362c);
+	} else if (adreno_is_a610(adreno_gpu)) {
+		gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_2, 0x00800060);
+		gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_1, 0x40201b16);
+	} else {
 		gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_2, 0x010000c0);
-	gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_1, 0x8040362c);
+		gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_1, 0x8040362c);
+	}
 
 	if (adreno_is_a660_family(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_CP_LPAC_PROG_FIFO_SIZE, 0x00000020);
 
 	/* Setting the mem pool size */
-	gpu_write(gpu, REG_A6XX_CP_MEM_POOL_SIZE, 128);
+	if (adreno_is_a610(adreno_gpu)) {
+		gpu_write(gpu, REG_A6XX_CP_MEM_POOL_SIZE, 48);
+		gpu_write(gpu, REG_A6XX_CP_MEM_POOL_DBG_ADDR, 47);
+	} else
+		gpu_write(gpu, REG_A6XX_CP_MEM_POOL_SIZE, 128);
 
 	/* Setting the primFifo thresholds default values,
 	 * and vccCacheSkipDis=1 bit (0x200) for A640 and newer
@@ -1129,6 +1198,8 @@ static int hw_init(struct msm_gpu *gpu)
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00200200);
 	else if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
+	else if (adreno_is_a610(adreno_gpu))
+		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00080000);
 	else
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00180000);
 
@@ -1144,8 +1215,10 @@ static int hw_init(struct msm_gpu *gpu)
 	a6xx_set_ubwc_config(gpu);
 
 	/* Enable fault detection */
-	gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL,
-		(1 << 30) | 0x1fffff);
+	if (adreno_is_a610(adreno_gpu))
+		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x3ffff);
+	else
+		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x1fffff);
 
 	gpu_write(gpu, REG_A6XX_UCHE_CLIENT_PF, 1);
 
@@ -1675,7 +1748,7 @@ void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_
 	struct msm_gpu *gpu = &adreno_gpu->base;
 
 	if (adreno_is_a619_holi(adreno_gpu)) {
-		gpu_write(gpu, 0x18, GPR0_GBIF_HALT_REQUEST);
+		gpu_write(gpu, REG_A6XX_RBBM_GPR0_CNTL, GPR0_GBIF_HALT_REQUEST);
 		spin_until((gpu_read(gpu, REG_A6XX_RBBM_VBIF_GX_RESET_STATUS) &
 				(VBIF_RESET_ACK_MASK)) == VBIF_RESET_ACK_MASK);
 	} else if (!a6xx_has_gbif(adreno_gpu)) {
@@ -1709,6 +1782,10 @@ void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_
 
 void a6xx_gpu_sw_reset(struct msm_gpu *gpu, bool assert)
 {
+	/* 11nm chips (e.g. ones with A610) have hw issues with the reset line! */
+	if (adreno_is_a610(to_adreno_gpu(gpu)))
+		return;
+
 	gpu_write(gpu, REG_A6XX_RBBM_SW_RESET_CMD, assert);
 	/* Add a barrier to avoid bad surprises */
 	mb();
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index b133755a56c4..2c2cdbdada4d 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -253,6 +253,18 @@ static const struct adreno_info gpulist[] = {
 		.quirks = ADRENO_QUIRK_LMLOADKILL_DISABLE,
 		.init = a5xx_gpu_init,
 		.zapfw = "a540_zap.mdt",
+	}, {
+		.rev = ADRENO_REV(6, 1, 0, ANY_ID),
+		.revn = 610,
+		.name = "A610",
+		.fw = {
+			[ADRENO_FW_SQE] = "a630_sqe.fw",
+		},
+		.gmem = (SZ_128K + SZ_4K),
+		.inactive_period = 500,
+		.init = a6xx_gpu_init,
+		.zapfw = "a610_zap.mdt",
+		.hwcg = a612_hwcg,
 	}, {
 		.rev = ADRENO_REV(6, 1, 8, ANY_ID),
 		.revn = 618,
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 432fee5c1516..7a5d595d4b99 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -55,7 +55,8 @@ struct adreno_reglist {
 	u32 value;
 };
 
-extern const struct adreno_reglist a615_hwcg[], a630_hwcg[], a640_hwcg[], a650_hwcg[], a660_hwcg[];
+extern const struct adreno_reglist a612_hwcg[], a615_hwcg[], a630_hwcg[], a640_hwcg[], a650_hwcg[];
+extern const struct adreno_reglist a660_hwcg[];
 
 struct adreno_info {
 	struct adreno_rev rev;
@@ -242,6 +243,11 @@ static inline int adreno_is_a540(struct adreno_gpu *gpu)
 	return gpu->revn == 540;
 }
 
+static inline int adreno_is_a610(struct adreno_gpu *gpu)
+{
+	return gpu->revn == 610;
+}
+
 static inline int adreno_is_a618(struct adreno_gpu *gpu)
 {
 	return gpu->revn == 618;

-- 
2.40.1

