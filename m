Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A03696B9F
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 18:32:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D166E10E949;
	Tue, 14 Feb 2023 17:32:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DFE010E947
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 17:32:15 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id bt8so12677869edb.12
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 09:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FSdLVHNmMe2HB1tboLV9c/DDh0PLI6EG2+aSNILAADw=;
 b=CC5wOrdDj3Tjrwj4mrcCrimbCmugwNzT3x8KcIcdYYu2cG49gyyoiMZV0VwThnskg6
 zlH0HgsB5O9UdMWb9rOcOwUTD+4iYCCeAeNFX2EATMMbDmjk9DE1TdEtCXnRzeUhVJ3h
 4tuR0gXG6CesuwaDgQPwvCc0tAgY4sNMMGYbhO/YMiUYQDA6mKJDMYRQkaIcClA6qOA/
 C1UK0Ezk88jJdb3UkJAGHUFnePZCsWumY9M7IGHzs3om/6g+NKCCatJe6Sa5ZgBXX5yC
 OYyMIRYltN7HZqzhlTZ0rwlTpCigyWCmUmu7cmP2gydDd3mGeu4cBgXRYpLMvN4MQNgP
 MTWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FSdLVHNmMe2HB1tboLV9c/DDh0PLI6EG2+aSNILAADw=;
 b=mHJBMV/127q+t7uryQqPL4QFkcGLo2MdTInYwlfAIQCJCveAxsd0wgGN5hol1aRmM1
 x8fNKS5/P53NDMdKfqbZ0iFGG0JMKmEpjbaIZNj7F7m2aw5LrfEsJzfyfS+WQyXiVZhy
 XxhNp28ruCExyUM494nmr34a+jIF/aWhyTVLrofH9GdNaDpGwAMHMZwyL4thzAEtfqzu
 u1jNwYMReFmSQ6ZCyMqvLOZvJ7ulQ6R0aL3UJLFWHKxvQVwYS9qZjvRtxVxwVayFLI20
 8TXsqpxgqYyyuSsAtJmZls8W7ueTKhhpalAMI0Tu1hwmpKVzuyS6/jED23A6Q1b9W70U
 gZvQ==
X-Gm-Message-State: AO0yUKVQW+AUbSXZ1AEouwdI8mVHdLtbqbSO5s/YYby3y8Jzp1nKW8Sp
 0z3uly7viAq0lDoOwubFDFJqXA==
X-Google-Smtp-Source: AK7set88c9VpvjWBTvfvsNkRBr5HqEQLm+fvjDlmvSA0n8UQQP2zizN+MKTqtMoYFxJpyetSHgD9PQ==
X-Received: by 2002:a50:9fad:0:b0:4ac:ccc4:3528 with SMTP id
 c42-20020a509fad000000b004acccc43528mr3696672edf.4.1676395935245; 
 Tue, 14 Feb 2023 09:32:15 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl.
 [83.9.1.117]) by smtp.gmail.com with ESMTPSA id
 w8-20020a50c448000000b0049668426aa6sm8325787edf.24.2023.02.14.09.32.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 09:32:14 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	andersson@kernel.org,
	agross@kernel.org
Subject: [PATCH v2 07/14] drm/msm/a6xx: Add support for A619_holi
Date: Tue, 14 Feb 2023 18:31:38 +0100
Message-Id: <20230214173145.2482651-8-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
References: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
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
index 75cf94b03c29..c168712a0dc4 100644
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
@@ -1007,7 +1007,12 @@ static int hw_init(struct msm_gpu *gpu)
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
@@ -1016,6 +1021,9 @@ static int hw_init(struct msm_gpu *gpu)
 
 	gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_CNTL, 0);
 
+	if (adreno_is_a619_holi(adreno_gpu))
+		a6xx_sptprac_enable(gmu);
+
 	/*
 	 * Disable the trusted memory range - we don't actually supported secure
 	 * memory rendering at this point in time and we don't want to block off
@@ -1293,7 +1301,8 @@ static void a6xx_dump(struct msm_gpu *gpu)
 #define GBIF_CLIENT_HALT_MASK	BIT(0)
 #define GBIF_ARB_HALT_MASK	BIT(1)
 #define VBIF_RESET_ACK_TIMEOUT	100
-#define VBIF_RESET_ACK_MASK	0x00f0
+#define VBIF_RESET_ACK_MASK	0xF0
+#define GPR0_GBIF_HALT_REQUEST	0x1E0
 
 static void a6xx_recover(struct msm_gpu *gpu)
 {
@@ -1350,10 +1359,16 @@ static void a6xx_recover(struct msm_gpu *gpu)
 
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
@@ -1763,6 +1778,9 @@ static int a6xx_pm_resume(struct msm_gpu *gpu)
 		if (ret)
 			return ret;
 
+		if (adreno_is_a619_holi(adreno_gpu))
+			a6xx_sptprac_enable(gmu);
+
 		mutex_unlock(&a6xx_gpu->gmu.lock);
 
 		msm_devfreq_resume(gpu);
@@ -1795,6 +1813,9 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
 
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

