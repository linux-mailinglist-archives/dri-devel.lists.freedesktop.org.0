Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D1D714AEC
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 15:53:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13B1810E2AE;
	Mon, 29 May 2023 13:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF79610E2AB
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 13:52:44 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4f004cc54f4so3702457e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 06:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685368363; x=1687960363;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qFYsjcpB0Nba4u0VqORGhd4E3cIiBrU4W4oXEsIChBs=;
 b=RMWt3A1XwbC22/nrZGneoME8qUo9Uk1/nwlsoBBoDVsjR5keDACzXx0Kq13uKfskdH
 NRDJvbukCDqz9v2XYQ8H5L86iEcrZhlqNkxNygotPsv84Wtyr6egUkI4+4lscSpvrkG1
 uJIZpKGLnqKYSmCzchIkzuPeTq+o/FdDsc60f9V6wHM/13r+RN+Lf/iiWw0J0rLC7zrU
 CQmAX33pXI+N2jLEuWO0TQwhDpnnit1bGWmBI9wLvsn6m9OO4CI7mMQixxe9iwtg8wi+
 qKNJ0/DGSCY2fcabAwh1kVPJceAWmRdAU7C5EpbF98ZWuaHTgYkP89YAVHEzzgZShhKT
 C2BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685368363; x=1687960363;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qFYsjcpB0Nba4u0VqORGhd4E3cIiBrU4W4oXEsIChBs=;
 b=LWDRk+3nuuT/NPqcOQCOcVY78qSINtEPOh9cWUzNrKhXOtZM4zD1JYlhbzY4froyw/
 TG0JqzOX0Uhtx8pZtrisElpayNjDJbcpZM/BnhB2KOLhuvO52rkhnbzL86bCeddfPSZc
 FfvKeeg/tXyei65MXLHIjiwBYtgt50QQu2L/5TrGdv0CwftNIzU13zoEzkxBSlGetBbg
 kqaOvhjceSsXcyS1lZOvH6I2eAhybGUMCloOe1sPOXHJbvDhjKiyWUNWNeHCU3aTk6Fh
 VKDkAHGrSVFyJNBXDVueMvEKealsEUXU2rPYlRJYvWA+znTwt4FPsy6k5LzPqjy6T8nE
 RUDw==
X-Gm-Message-State: AC+VfDzYvCQsng22yYY6AJ/y296R/JO+aPkxJZlsalYM5oG9VTmbUIkh
 hdTdFCnGpCNzFa6/bXL4jpAgTA==
X-Google-Smtp-Source: ACHHUZ7PwBY9aHIEnE3Eoae3OkmnxByaBhoLuVpOLtAEsue08zOC9k1KcBFVwBJFdbuRC8/fP5ImQA==
X-Received: by 2002:ac2:5635:0:b0:4f4:d0ab:97e0 with SMTP id
 b21-20020ac25635000000b004f4d0ab97e0mr3419132lff.20.1685368362943; 
 Mon, 29 May 2023 06:52:42 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
 by smtp.gmail.com with ESMTPSA id
 c16-20020ac25310000000b004f2532cfbc1sm4700lfh.81.2023.05.29.06.52.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 May 2023 06:52:42 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 29 May 2023 15:52:31 +0200
Subject: [PATCH v8 12/18] drm/msm/a6xx: Add support for A619_holi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v8-12-69c68206609e@linaro.org>
References: <20230223-topic-gmuwrapper-v8-0-69c68206609e@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v8-0-69c68206609e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1685368343; l=4010;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=aKOKSCJ6t3/Hd9vl27cppwKNdpDBx2SmjHodX0JtW8A=;
 b=vp5j5jt5ELZFOf833i3i+IWDRtEHW/GspmcVxCdLf0R0JQFI8wRsHvq7+nPvtfsa8pGmTCMg2
 dv92MFLRe8xBZSIQ5vW8kFquo5y3clTs54kq40TgaslWQY8S40YzuVu
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

A619_holi is a GMU-less variant of the already-supported A619 GPU.
It's present on at least SM4350 (holi) and SM6375 (blair). No mesa
changes are required. Add the required kernel-side support for it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 27 +++++++++++++++++++++++++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  5 +++++
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 0a44762dbb6d..bb04f65e6f68 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -810,6 +810,9 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	if (adreno_is_a618(adreno_gpu))
 		return;
 
+	if (adreno_is_a619_holi(adreno_gpu))
+		hbb_lo = 0;
+
 	if (adreno_is_a640_family(adreno_gpu))
 		amsbc = 1;
 
@@ -1027,7 +1030,12 @@ static int hw_init(struct msm_gpu *gpu)
 	}
 
 	/* Clear GBIF halt in case GX domain was not collapsed */
-	if (a6xx_has_gbif(adreno_gpu)) {
+	if (adreno_is_a619_holi(adreno_gpu)) {
+		gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
+		gpu_write(gpu, REG_A6XX_RBBM_GPR0_CNTL, 0);
+		/* Let's make extra sure that the GPU can access the memory.. */
+		mb();
+	} else if (a6xx_has_gbif(adreno_gpu)) {
 		gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
 		gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, 0);
 		/* Let's make extra sure that the GPU can access the memory.. */
@@ -1036,6 +1044,9 @@ static int hw_init(struct msm_gpu *gpu)
 
 	gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_CNTL, 0);
 
+	if (adreno_is_a619_holi(adreno_gpu))
+		a6xx_sptprac_enable(gmu);
+
 	/*
 	 * Disable the trusted memory range - we don't actually supported secure
 	 * memory rendering at this point in time and we don't want to block off
@@ -1656,12 +1667,18 @@ static void a6xx_llc_slices_init(struct platform_device *pdev,
 #define GBIF_CLIENT_HALT_MASK		BIT(0)
 #define GBIF_ARB_HALT_MASK		BIT(1)
 #define VBIF_XIN_HALT_CTRL0_MASK	GENMASK(3, 0)
+#define VBIF_RESET_ACK_MASK		0xF0
+#define GPR0_GBIF_HALT_REQUEST		0x1E0
 
 void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_off)
 {
 	struct msm_gpu *gpu = &adreno_gpu->base;
 
-	if (!a6xx_has_gbif(adreno_gpu)) {
+	if (adreno_is_a619_holi(adreno_gpu)) {
+		gpu_write(gpu, 0x18, GPR0_GBIF_HALT_REQUEST);
+		spin_until((gpu_read(gpu, REG_A6XX_RBBM_VBIF_GX_RESET_STATUS) &
+				(VBIF_RESET_ACK_MASK)) == VBIF_RESET_ACK_MASK);
+	} else if (!a6xx_has_gbif(adreno_gpu)) {
 		gpu_write(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL0, VBIF_XIN_HALT_CTRL0_MASK);
 		spin_until((gpu_read(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL1) &
 				(VBIF_XIN_HALT_CTRL0_MASK)) == VBIF_XIN_HALT_CTRL0_MASK);
@@ -1756,6 +1773,9 @@ static int a6xx_pm_resume(struct msm_gpu *gpu)
 	if (ret)
 		goto err_bulk_clk;
 
+	if (adreno_is_a619_holi(adreno_gpu))
+		a6xx_sptprac_enable(gmu);
+
 	/* If anything goes south, tear the GPU down piece by piece.. */
 	if (ret) {
 err_bulk_clk:
@@ -1815,6 +1835,9 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
 	/* Drain the outstanding traffic on memory buses */
 	a6xx_bus_clear_pending_transactions(adreno_gpu, true);
 
+	if (adreno_is_a619_holi(adreno_gpu))
+		a6xx_sptprac_disable(gmu);
+
 	clk_bulk_disable_unprepare(gpu->nr_clocks, gpu->grp_clks);
 
 	pm_runtime_put_sync(gmu->gxpd);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index ee5352bc5329..432fee5c1516 100644
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
2.40.1

