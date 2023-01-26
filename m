Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E3867CFCC
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 16:17:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC7B10E939;
	Thu, 26 Jan 2023 15:17:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B889210E29D
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 15:17:38 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id y19so2159751edc.2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 07:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=upy4MRvp9Kt/ddpgWUPDLF13dE04SASDh6jVpt0wfAc=;
 b=KV9CH+3A3ckz1Y/qVGQ6AcZGeMztw3ivg+NgIdIokMBURNRLy/+fRuU2LkCZBcov9c
 TNhHyrZpwYs2wOfnVfZ0MwVakN837gMKzxfc4n5p1JtDR5/MqVpxlYvyvhGvKTFIDwCA
 WzeFaeRdHtQMPrA2shkz0iBszAIPdE8GR+I39zWEvNdOU+LdgqoHkuT0/Eq1P08UZSMv
 hi0IisFpHrZQ9kE45gSVMTTM+FssILwMefm9mZ3jTq/37XtmznpZru5kA7fQqyLkDWCA
 F73gGFjm9b4HvPLlHOTW5MSSFO7fdDc+8Km4KPR7TwG9iXnNY71czwqtgsrRN1EHBu88
 7KMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=upy4MRvp9Kt/ddpgWUPDLF13dE04SASDh6jVpt0wfAc=;
 b=B+hwJynp/+eA3eMH1qrsRnV1/mauao9YyuBvmS7xJH6HszHsZgpqMp1L87Sqknxsow
 ZW7JGuxQApZ1g1Sq5tiOlOepRiQMRiH5QNRwTjMJ1VIk0DtE/CsF+Qvy1H2uHbnqGwId
 aPN73KdttQGE5CZWm1SuZR64o3N38GhDhFy/AHrldRbk6k4/ZfS+Q+H+rvdqJGb/zCar
 nb3dugCPIkmlvDXcON/GG/006+IFNPMQoE0FuwUCMAm5uWKxBopd7Mb4zlG+tU0IVOFO
 IFYDBJM6mtgI9t/iXhGmCSG7BtqLJxeHzIX/g23uc3o4YQ5siVTImf0RnIp3/Y9zhxj8
 0mFw==
X-Gm-Message-State: AO0yUKVG/wZrh1DlW20AW1nFXaMjoWAJo5DvTJpv4hW0ML/bXHGvH7A5
 yIDaRLUZ/CEnwivVq1ZTVIB/Ow==
X-Google-Smtp-Source: AK7set9LdHL3UgkRrrt0osz8oT3IdC0SwMrUQAsOk2G0awIh5rCwPVIjmXIv+ToWKTYJgpmBX6HD9Q==
X-Received: by 2002:a05:6402:274b:b0:4a0:b978:452f with SMTP id
 z11-20020a056402274b00b004a0b978452fmr5430959edd.14.1674746258323; 
 Thu, 26 Jan 2023 07:17:38 -0800 (PST)
Received: from localhost.localdomain (abyk108.neoplus.adsl.tpnet.pl.
 [83.9.30.108]) by smtp.gmail.com with ESMTPSA id
 a16-20020aa7d910000000b00463bc1ddc76sm842808edr.28.2023.01.26.07.17.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 07:17:38 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Subject: [PATCH 07/14] drm/msm/a6xx: Add support for A619_holi
Date: Thu, 26 Jan 2023 16:16:11 +0100
Message-Id: <20230126151618.225127-8-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126151618.225127-1-konrad.dybcio@linaro.org>
References: <20230126151618.225127-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Nathan Chancellor <nathan@kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A619_holi is a GMU-less variant of the already-supported A619 GPU.
It's present on at least SM4350 (holi) and SM6375 (blair). No mesa
changes are required. Add the required kernel-side support for it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 37 +++++++++++++++++-----
 drivers/gpu/drm/msm/adreno/adreno_device.c | 13 ++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  5 +++
 3 files changed, 47 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 158d6453cf3e..3c349e97b3a6 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -614,14 +614,14 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 		return;
 
 	/* Disable SP clock before programming HWCG registers */
-	if (!adreno_has_gmu_wrapper(adreno_gpu))
+	if ((!adreno_has_gmu_wrapper(adreno_gpu) || adreno_is_a619_holi(adreno_gpu)))
 		gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 1, 0);
 
 	for (i = 0; (reg = &adreno_gpu->info->hwcg[i], reg->offset); i++)
 		gpu_write(gpu, reg->offset, state ? reg->value : 0);
 
 	/* Enable SP clock */
-	if (!adreno_has_gmu_wrapper(adreno_gpu))
+	if ((!adreno_has_gmu_wrapper(adreno_gpu) || adreno_is_a619_holi(adreno_gpu)))
 		gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 0, 1);
 
 	gpu_write(gpu, REG_A6XX_RBBM_CLOCK_CNTL, state ? clock_cntl_on : 0);
@@ -1004,7 +1004,12 @@ static int hw_init(struct msm_gpu *gpu)
 	}
 
 	/* Clear GBIF halt in case GX domain was not collapsed */
-	if (a6xx_has_gbif(adreno_gpu)) {
+	if (adreno_is_a619_holi(adreno_gpu)) {
+		gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
+		gpu_write(gpu, 0x18, 0);
+		/* Let's make extra sure that the GPU can access the memory.. */
+		mb();
+	} else if (a6xx_has_gbif(adreno_gpu)) {
 		gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
 		gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, 0);
 		/* Let's make extra sure that the GPU can access the memory.. */
@@ -1013,6 +1018,9 @@ static int hw_init(struct msm_gpu *gpu)
 
 	gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_CNTL, 0);
 
+	if (adreno_is_a619_holi(adreno_gpu))
+		a6xx_sptprac_enable(gmu);
+
 	/*
 	 * Disable the trusted memory range - we don't actually supported secure
 	 * memory rendering at this point in time and we don't want to block off
@@ -1290,7 +1298,8 @@ static void a6xx_dump(struct msm_gpu *gpu)
 #define GBIF_CLIENT_HALT_MASK	BIT(0)
 #define GBIF_ARB_HALT_MASK	BIT(1)
 #define VBIF_RESET_ACK_TIMEOUT	100
-#define VBIF_RESET_ACK_MASK	0x00f0
+#define VBIF_RESET_ACK_MASK	0xF0
+#define GPR0_GBIF_HALT_REQUEST	0x1E0
 
 static void a6xx_recover(struct msm_gpu *gpu)
 {
@@ -1347,10 +1356,16 @@ static void a6xx_recover(struct msm_gpu *gpu)
 
 	/* Software-reset the GPU */
 	if (adreno_has_gmu_wrapper(adreno_gpu)) {
-		/* Halt the GX side of GBIF */
-		gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, GBIF_GX_HALT_MASK);
-		spin_until(gpu_read(gpu, REG_A6XX_RBBM_GBIF_HALT_ACK) &
-			   GBIF_GX_HALT_MASK);
+		if (adreno_is_a619_holi(adreno_gpu)) {
+			gpu_write(gpu, 0x18, GPR0_GBIF_HALT_REQUEST);
+			spin_until((gpu_read(gpu, REG_A6XX_RBBM_VBIF_GX_RESET_STATUS) &
+				   (VBIF_RESET_ACK_MASK)) == VBIF_RESET_ACK_MASK);
+		} else {
+			/* Halt the GX side of GBIF */
+			gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, GBIF_GX_HALT_MASK);
+			spin_until(gpu_read(gpu, REG_A6XX_RBBM_GBIF_HALT_ACK) &
+				   GBIF_GX_HALT_MASK);
+		}
 
 		/* Halt new client requests on GBIF */
 		gpu_write(gpu, REG_A6XX_GBIF_HALT, GBIF_CLIENT_HALT_MASK);
@@ -1760,6 +1775,9 @@ static int a6xx_pm_resume(struct msm_gpu *gpu)
 		if (ret)
 			return ret;
 
+		if (adreno_is_a619_holi(adreno_gpu))
+			a6xx_sptprac_enable(gmu);
+
 		mutex_unlock(&a6xx_gpu->gmu.lock);
 
 		msm_devfreq_resume(gpu);
@@ -1792,6 +1810,9 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
 
 		mutex_lock(&a6xx_gpu->gmu.lock);
 
+		if (adreno_is_a619_holi(adreno_gpu))
+			a6xx_sptprac_disable(gmu);
+
 		ret = clk_prepare_enable(gpu->ebi1_clk);
 		if (ret)
 			return ret;
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 82757f005a1a..71faeb3fd466 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -264,6 +264,19 @@ static const struct adreno_info gpulist[] = {
 		.gmem = SZ_512K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init = a6xx_gpu_init,
+	}, {
+		.rev = ADRENO_REV(6, 1, 9, 1),
+		.revn = 619,
+		.name = "A619_holi",
+		.fw = {
+			[ADRENO_FW_SQE] = "a630_sqe.fw",
+		},
+		.gmem = SZ_512K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_GMU_WRAPPER,
+		.init = a6xx_gpu_init,
+		.zapfw = "a615_zap.mdt",
+		.hwcg = a615_hwcg,
 	}, {
 		.rev = ADRENO_REV(6, 1, 9, ANY_ID),
 		.revn = 619,
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 7c5e0a90b5fb..16241368c2e4 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -252,6 +252,11 @@ static inline int adreno_is_a619(struct adreno_gpu *gpu)
 	return gpu->revn == 619;
 }
 
+static inline int adreno_is_a619_holi(struct adreno_gpu *gpu)
+{
+	return adreno_is_a619(gpu) && adreno_has_gmu_wrapper(gpu);
+}
+
 static inline int adreno_is_a630(struct adreno_gpu *gpu)
 {
 	return gpu->revn == 630;
-- 
2.39.1

