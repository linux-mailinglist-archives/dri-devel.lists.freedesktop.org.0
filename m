Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E85174A5A8
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 23:11:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7CE810E4E4;
	Thu,  6 Jul 2023 21:11:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1636B10E4DB;
 Thu,  6 Jul 2023 21:11:15 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-55b83ae9be2so876440a12.2; 
 Thu, 06 Jul 2023 14:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688677875; x=1691269875;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BV96mxd+srX+OmMYfGzJZuBt/IJjPpB1ekuseWxFc30=;
 b=PapwDs5XykHAfKytxV4OBqt9Kw0t9fjmDFAZr3GhZiBrKNoHs6LhYRcH787EAoODGO
 CLXSsnXQm+bZBFHCOS4FNOKL58AxmU/Nh2n44a6YWW7S6dRgL4YZM9LpevyFAytsOw7x
 lWBDm7FSX47FBayscuF6tgzKk9AIyca005CpiuVRiUgYrcJuCoaxxia9tkyGcWyPM44e
 9DTLfHfMpeQOTS4Go+J7cMDzRXefjbB1KXJ6Wp91yIp1smceSU4cjo37rBMO97fhIILg
 Spn18CuUyIO4+pBAsPeO22cuokUh137EfvXYgSUVFUkXmsWw4ty0qSLbAlsEr46AEaKy
 8TDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688677875; x=1691269875;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BV96mxd+srX+OmMYfGzJZuBt/IJjPpB1ekuseWxFc30=;
 b=i8rKV78RW3QwMtKTpIDfS5a0X8Kci8ZFg54DS1qcIxUDgpljz8rKKIc/nfrXUKCVil
 7S2evTf+aTvB1mTSFApb8me/Me+wQcyhRndIXXHTPlAx2FdxZIoF8wwb8Rkv48AwIxbj
 wmkkW4L7JGDC97tmFvouM+bzMbp4XBzuK92EUzGspUZELtmcp5Y4JwCUR4/ANk7SQKTp
 YgFp+GkKPzyQSfGx9ULY6cbSr+hscDi2Y2f81Q76IEuUjcpGmTbRgD0T2T4M64EuB86q
 OLOuuSxNI+q7GUM/jYxBKtEc5AOrv2ekEerfijLJhI2pMEAPHYCeHsly+Mk0yPfCrdGC
 AGeQ==
X-Gm-Message-State: ABy/qLbFGWoLOLEROPfrlvtmPmp+/jlBjxBuSWPVISpneQ0tUnr9u26V
 3sl8ilm0eeL4OUhW+M3jlCFxfMZ7gF0=
X-Google-Smtp-Source: APBJJlEfQH8gocuc4X1YA9AsGilJy+yqfYZsZE+zavyMvVrGJDjeXufu1I/LM3+iWUWJ0nPwwBsAqA==
X-Received: by 2002:a05:6a21:7896:b0:12a:82a0:687e with SMTP id
 bf22-20020a056a21789600b0012a82a0687emr3326594pzc.60.1688677874960; 
 Thu, 06 Jul 2023 14:11:14 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 n25-20020a62e519000000b00682a839d0aesm1654358pff.112.2023.07.06.14.11.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jul 2023 14:11:14 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 09/12] drm/msm/adreno: Add adreno family
Date: Thu,  6 Jul 2023 14:10:42 -0700
Message-ID: <20230706211045.204925-10-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706211045.204925-1-robdclark@gmail.com>
References: <20230706211045.204925-1-robdclark@gmail.com>
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Sometimes it is useful to know the sub-generation (or "family").  And in
any case, this helps us get away from infering the generation from the
numerical chip-id.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 31 ++++++++++++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 11 +++---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 46 ++++++++++++++++------
 3 files changed, 70 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index b7f70cfe6081..dcd6363ac7b0 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -23,6 +23,7 @@ module_param_named(allow_vram_carveout, allow_vram_carveout, bool, 0600);
 static const struct adreno_info gpulist[] = {
 	{
 		.rev   = ADRENO_REV(2, 0, 0, 0),
+		.family = ADRENO_2XX_GEN1,
 		.revn  = 200,
 		.fw = {
 			[ADRENO_FW_PM4] = "yamato_pm4.fw",
@@ -33,6 +34,7 @@ static const struct adreno_info gpulist[] = {
 		.init  = a2xx_gpu_init,
 	}, { /* a200 on i.mx51 has only 128kib gmem */
 		.rev   = ADRENO_REV(2, 0, 0, 1),
+		.family = ADRENO_2XX_GEN1,
 		.revn  = 201,
 		.fw = {
 			[ADRENO_FW_PM4] = "yamato_pm4.fw",
@@ -43,6 +45,7 @@ static const struct adreno_info gpulist[] = {
 		.init  = a2xx_gpu_init,
 	}, {
 		.rev   = ADRENO_REV(2, 2, 0, ANY_ID),
+		.family = ADRENO_2XX_GEN2,
 		.revn  = 220,
 		.fw = {
 			[ADRENO_FW_PM4] = "leia_pm4_470.fw",
@@ -53,6 +56,7 @@ static const struct adreno_info gpulist[] = {
 		.init  = a2xx_gpu_init,
 	}, {
 		.rev   = ADRENO_REV(3, 0, 5, ANY_ID),
+		.family = ADRENO_3XX,
 		.revn  = 305,
 		.fw = {
 			[ADRENO_FW_PM4] = "a300_pm4.fw",
@@ -63,6 +67,7 @@ static const struct adreno_info gpulist[] = {
 		.init  = a3xx_gpu_init,
 	}, {
 		.rev   = ADRENO_REV(3, 0, 6, 0),
+		.family = ADRENO_3XX,
 		.revn  = 307,        /* because a305c is revn==306 */
 		.fw = {
 			[ADRENO_FW_PM4] = "a300_pm4.fw",
@@ -73,6 +78,7 @@ static const struct adreno_info gpulist[] = {
 		.init  = a3xx_gpu_init,
 	}, {
 		.rev   = ADRENO_REV(3, 2, ANY_ID, ANY_ID),
+		.family = ADRENO_3XX,
 		.revn  = 320,
 		.fw = {
 			[ADRENO_FW_PM4] = "a300_pm4.fw",
@@ -83,6 +89,7 @@ static const struct adreno_info gpulist[] = {
 		.init  = a3xx_gpu_init,
 	}, {
 		.rev   = ADRENO_REV(3, 3, 0, ANY_ID),
+		.family = ADRENO_3XX,
 		.revn  = 330,
 		.fw = {
 			[ADRENO_FW_PM4] = "a330_pm4.fw",
@@ -93,6 +100,7 @@ static const struct adreno_info gpulist[] = {
 		.init  = a3xx_gpu_init,
 	}, {
 		.rev   = ADRENO_REV(4, 0, 5, ANY_ID),
+		.family = ADRENO_4XX,
 		.revn  = 405,
 		.fw = {
 			[ADRENO_FW_PM4] = "a420_pm4.fw",
@@ -103,6 +111,7 @@ static const struct adreno_info gpulist[] = {
 		.init  = a4xx_gpu_init,
 	}, {
 		.rev   = ADRENO_REV(4, 2, 0, ANY_ID),
+		.family = ADRENO_4XX,
 		.revn  = 420,
 		.fw = {
 			[ADRENO_FW_PM4] = "a420_pm4.fw",
@@ -113,6 +122,7 @@ static const struct adreno_info gpulist[] = {
 		.init  = a4xx_gpu_init,
 	}, {
 		.rev   = ADRENO_REV(4, 3, 0, ANY_ID),
+		.family = ADRENO_4XX,
 		.revn  = 430,
 		.fw = {
 			[ADRENO_FW_PM4] = "a420_pm4.fw",
@@ -123,6 +133,7 @@ static const struct adreno_info gpulist[] = {
 		.init  = a4xx_gpu_init,
 	}, {
 		.rev   = ADRENO_REV(5, 0, 6, ANY_ID),
+		.family = ADRENO_5XX,
 		.revn = 506,
 		.fw = {
 			[ADRENO_FW_PM4] = "a530_pm4.fw",
@@ -140,6 +151,7 @@ static const struct adreno_info gpulist[] = {
 		.zapfw = "a506_zap.mdt",
 	}, {
 		.rev   = ADRENO_REV(5, 0, 8, ANY_ID),
+		.family = ADRENO_5XX,
 		.revn = 508,
 		.fw = {
 			[ADRENO_FW_PM4] = "a530_pm4.fw",
@@ -156,6 +168,7 @@ static const struct adreno_info gpulist[] = {
 		.zapfw = "a508_zap.mdt",
 	}, {
 		.rev   = ADRENO_REV(5, 0, 9, ANY_ID),
+		.family = ADRENO_5XX,
 		.revn = 509,
 		.fw = {
 			[ADRENO_FW_PM4] = "a530_pm4.fw",
@@ -173,6 +186,7 @@ static const struct adreno_info gpulist[] = {
 		.zapfw = "a512_zap.mdt",
 	}, {
 		.rev   = ADRENO_REV(5, 1, 0, ANY_ID),
+		.family = ADRENO_5XX,
 		.revn = 510,
 		.fw = {
 			[ADRENO_FW_PM4] = "a530_pm4.fw",
@@ -187,6 +201,7 @@ static const struct adreno_info gpulist[] = {
 		.init = a5xx_gpu_init,
 	}, {
 		.rev   = ADRENO_REV(5, 1, 2, ANY_ID),
+		.family = ADRENO_5XX,
 		.revn = 512,
 		.fw = {
 			[ADRENO_FW_PM4] = "a530_pm4.fw",
@@ -203,6 +218,7 @@ static const struct adreno_info gpulist[] = {
 		.zapfw = "a512_zap.mdt",
 	}, {
 		.rev = ADRENO_REV(5, 3, 0, 2),
+		.family = ADRENO_5XX,
 		.revn = 530,
 		.fw = {
 			[ADRENO_FW_PM4] = "a530_pm4.fw",
@@ -221,6 +237,7 @@ static const struct adreno_info gpulist[] = {
 		.zapfw = "a530_zap.mdt",
 	}, {
 		.rev = ADRENO_REV(5, 4, 0, ANY_ID),
+		.family = ADRENO_5XX,
 		.revn = 540,
 		.fw = {
 			[ADRENO_FW_PM4] = "a530_pm4.fw",
@@ -238,6 +255,7 @@ static const struct adreno_info gpulist[] = {
 		.zapfw = "a540_zap.mdt",
 	}, {
 		.rev = ADRENO_REV(6, 1, 0, ANY_ID),
+		.family = ADRENO_6XX_GEN1,
 		.revn = 610,
 		.fw = {
 			[ADRENO_FW_SQE] = "a630_sqe.fw",
@@ -263,6 +281,7 @@ static const struct adreno_info gpulist[] = {
 		),
 	}, {
 		.rev = ADRENO_REV(6, 1, 8, ANY_ID),
+		.family = ADRENO_6XX_GEN1,
 		.revn = 618,
 		.fw = {
 			[ADRENO_FW_SQE] = "a630_sqe.fw",
@@ -280,6 +299,7 @@ static const struct adreno_info gpulist[] = {
 	}, {
 		.machine = "qcom,sm4350",
 		.rev = ADRENO_REV(6, 1, 9, ANY_ID),
+		.family = ADRENO_6XX_GEN1,
 		.revn = 619,
 		.fw = {
 			[ADRENO_FW_SQE] = "a630_sqe.fw",
@@ -298,6 +318,7 @@ static const struct adreno_info gpulist[] = {
 	}, {
 		.machine = "qcom,sm6375",
 		.rev = ADRENO_REV(6, 1, 9, ANY_ID),
+		.family = ADRENO_6XX_GEN1,
 		.revn = 619,
 		.fw = {
 			[ADRENO_FW_SQE] = "a630_sqe.fw",
@@ -315,6 +336,7 @@ static const struct adreno_info gpulist[] = {
 		),
 	}, {
 		.rev = ADRENO_REV(6, 1, 9, ANY_ID),
+		.family = ADRENO_6XX_GEN1,
 		.revn = 619,
 		.fw = {
 			[ADRENO_FW_SQE] = "a630_sqe.fw",
@@ -335,6 +357,7 @@ static const struct adreno_info gpulist[] = {
 		),
 	}, {
 		.rev = ADRENO_REV(6, 3, 0, ANY_ID),
+		.family = ADRENO_6XX_GEN1,
 		.revn = 630,
 		.fw = {
 			[ADRENO_FW_SQE] = "a630_sqe.fw",
@@ -348,6 +371,7 @@ static const struct adreno_info gpulist[] = {
 		.hwcg = a630_hwcg,
 	}, {
 		.rev = ADRENO_REV(6, 4, 0, ANY_ID),
+		.family = ADRENO_6XX_GEN2,
 		.revn = 640,
 		.fw = {
 			[ADRENO_FW_SQE] = "a630_sqe.fw",
@@ -365,6 +389,7 @@ static const struct adreno_info gpulist[] = {
 		),
 	}, {
 		.rev = ADRENO_REV(6, 5, 0, ANY_ID),
+		.family = ADRENO_6XX_GEN3,
 		.revn = 650,
 		.fw = {
 			[ADRENO_FW_SQE] = "a650_sqe.fw",
@@ -386,6 +411,7 @@ static const struct adreno_info gpulist[] = {
 		),
 	}, {
 		.rev = ADRENO_REV(6, 6, 0, ANY_ID),
+		.family = ADRENO_6XX_GEN4,
 		.revn = 660,
 		.fw = {
 			[ADRENO_FW_SQE] = "a660_sqe.fw",
@@ -401,6 +427,7 @@ static const struct adreno_info gpulist[] = {
 		.address_space_size = SZ_16G,
 	}, {
 		.rev = ADRENO_REV(6, 3, 5, ANY_ID),
+		.family = ADRENO_6XX_GEN4,
 		.fw = {
 			[ADRENO_FW_SQE] = "a660_sqe.fw",
 			[ADRENO_FW_GMU] = "a660_gmu.bin",
@@ -419,6 +446,7 @@ static const struct adreno_info gpulist[] = {
 		),
 	}, {
 		.rev = ADRENO_REV(6, 8, 0, ANY_ID),
+		.family = ADRENO_6XX_GEN2,
 		.revn = 680,
 		.fw = {
 			[ADRENO_FW_SQE] = "a630_sqe.fw",
@@ -432,6 +460,7 @@ static const struct adreno_info gpulist[] = {
 		.hwcg = a640_hwcg,
 	}, {
 		.rev = ADRENO_REV(6, 9, 0, ANY_ID),
+		.family = ADRENO_6XX_GEN4,
 		.fw = {
 			[ADRENO_FW_SQE] = "a660_sqe.fw",
 			[ADRENO_FW_GMU] = "a690_gmu.bin",
@@ -641,7 +670,7 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 	DBG("Found GPU: %u.%u.%u.%u", config.rev.core, config.rev.major,
 		config.rev.minor, config.rev.patchid);
 
-	priv->is_a2xx = config.rev.core == 2;
+	priv->is_a2xx = info->family < ADRENO_3XX;
 	priv->has_cached_coherent =
 		!!(info->quirks & ADRENO_QUIRK_HAS_CACHED_COHERENT);
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 2e62a7ce9f13..75ff7fb46099 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -1079,8 +1079,13 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	u32 speedbin;
 	int ret;
 
+	adreno_gpu->funcs = funcs;
+	adreno_gpu->info = adreno_info(config->rev);
+	adreno_gpu->rev = *rev;
+
 	/* Only handle the core clock when GMU is not in use (or is absent). */
-	if (adreno_has_gmu_wrapper(adreno_gpu) || config->rev.core < 6) {
+	if (adreno_has_gmu_wrapper(adreno_gpu) ||
+	    adreno_gpu->info->family < ADRENO_6XX_GEN1) {
 		/*
 		 * This can only be done before devm_pm_opp_of_add_table(), or
 		 * dev_pm_opp_set_config() will WARN_ON()
@@ -1096,10 +1101,6 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 			devm_pm_opp_set_clkname(dev, "core");
 	}
 
-	adreno_gpu->funcs = funcs;
-	adreno_gpu->info = adreno_info(config->rev);
-	adreno_gpu->rev = *rev;
-
 	if (adreno_read_speedbin(dev, &speedbin) || !speedbin)
 		speedbin = 0xffff;
 	adreno_gpu->speedbin = (uint16_t) (0xffff & speedbin);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 6066cfaaea52..2fa14dcd4e40 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -29,6 +29,25 @@ enum {
 	ADRENO_FW_MAX,
 };
 
+/**
+ * @enum adreno_family: identify generation and possibly sub-generation
+ *
+ * In some cases there are distinct sub-generations within a major revision
+ * so it helps to be able to group the GPU devices by generation and if
+ * necessary sub-generation.
+ */
+enum adreno_family {
+	ADRENO_2XX_GEN1,  /* a20x */
+	ADRENO_2XX_GEN2,  /* a22x */
+	ADRENO_3XX,
+	ADRENO_4XX,
+	ADRENO_5XX,
+	ADRENO_6XX_GEN1,  /* a630 family */
+	ADRENO_6XX_GEN2,  /* a640 family */
+	ADRENO_6XX_GEN3,  /* a650 family */
+	ADRENO_6XX_GEN4,  /* a660 family */
+};
+
 #define ADRENO_QUIRK_TWO_PASS_USE_WFI		BIT(0)
 #define ADRENO_QUIRK_FAULT_DETECT_MASK		BIT(1)
 #define ADRENO_QUIRK_LMLOADKILL_DISABLE		BIT(2)
@@ -63,6 +82,7 @@ extern const struct adreno_reglist a660_hwcg[], a690_hwcg[];
 struct adreno_info {
 	const char *machine;
 	struct adreno_rev rev;
+	enum adreno_family family;
 	uint32_t revn;
 	const char *fw[ADRENO_FW_MAX];
 	uint32_t gmem;
@@ -188,14 +208,14 @@ static inline bool adreno_is_a2xx(const struct adreno_gpu *gpu)
 {
 	if (WARN_ON_ONCE(!gpu->info))
 		return false;
-	return (gpu->info->revn < 300);
+	return gpu->info->family < ADRENO_2XX_GEN2;
 }
 
 static inline bool adreno_is_a20x(const struct adreno_gpu *gpu)
 {
 	if (WARN_ON_ONCE(!gpu->info))
 		return false;
-	return (gpu->info->revn < 210);
+	return gpu->info->family == ADRENO_2XX_GEN1;
 }
 
 static inline bool adreno_is_a225(const struct adreno_gpu *gpu)
@@ -338,29 +358,31 @@ static inline int adreno_is_a690(const struct adreno_gpu *gpu)
 /* check for a615, a616, a618, a619 or any a630 derivatives */
 static inline int adreno_is_a630_family(const struct adreno_gpu *gpu)
 {
-	return adreno_is_revn(gpu, 630) ||
-		adreno_is_revn(gpu, 615) ||
-		adreno_is_revn(gpu, 616) ||
-		adreno_is_revn(gpu, 618) ||
-		adreno_is_revn(gpu, 619);
+	if (WARN_ON_ONCE(!gpu->info))
+		return false;
+	return gpu->info->family == ADRENO_6XX_GEN1;
 }
 
 static inline int adreno_is_a660_family(const struct adreno_gpu *gpu)
 {
-	return adreno_is_a660(gpu) || adreno_is_a690(gpu) || adreno_is_7c3(gpu);
+	if (WARN_ON_ONCE(!gpu->info))
+		return false;
+	return gpu->info->family == ADRENO_6XX_GEN4;
 }
 
 /* check for a650, a660, or any derivatives */
 static inline int adreno_is_a650_family(const struct adreno_gpu *gpu)
 {
-	return adreno_is_revn(gpu, 650) ||
-		adreno_is_revn(gpu, 620) ||
-		adreno_is_a660_family(gpu);
+	if (WARN_ON_ONCE(!gpu->info))
+		return false;
+	return gpu->info->family >= ADRENO_6XX_GEN3;
 }
 
 static inline int adreno_is_a640_family(const struct adreno_gpu *gpu)
 {
-	return adreno_is_a640(gpu) || adreno_is_a680(gpu);
+	if (WARN_ON_ONCE(!gpu->info))
+		return false;
+	return gpu->info->family == ADRENO_6XX_GEN2;
 }
 
 u64 adreno_private_address_space_size(struct msm_gpu *gpu);
-- 
2.41.0

