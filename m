Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B08EE732373
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 01:22:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FE3310E574;
	Thu, 15 Jun 2023 23:22:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 512D210E568
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 23:21:41 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f640e48bc3so11252697e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 16:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686871299; x=1689463299;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=L+TVhBBKRUS2B/z8pS7wjP7swdoiJrJVs5F8KW7VIYM=;
 b=WV8n5HFl5rBMncwRQgxWFtUGnZvsSUJAk14Qygq5K/fTGLN9SXB3p2pM3AONYV2eRR
 nWPHVuR3fIJk7+DTgIGp31tnAl2qja+52rui9M+JCAxZ8PB+Z01D/zZLK3427nj/Sf7r
 Zm/PsV+3NBN+eYLYFmYZACGDtHO4cevmrrFfDcqIVmHRJ0zWn+RLhufwZFjpH39nZnzA
 pfRylr+GqtkIKmj9nq71JxApn8vHr7nhy4TMlLX7fsxTJncyraEThweMrBzUvq45mTrq
 eK5uN5UDUTOYhrj+Fg1QpXKxJbLn/VvyT8eieWEzFvqiSddoijBWYAN2yrqhogdlpjlc
 hgrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686871299; x=1689463299;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L+TVhBBKRUS2B/z8pS7wjP7swdoiJrJVs5F8KW7VIYM=;
 b=bp2Q+/Jmx88WbWDV/+5x3dF0UwU1loJRG/jP9REDMgReuyplsH2SQgBw1v7sFGtjVP
 h5ufT6K+Idggwi4J7AEU48S+II1jsGD2jKN2m6nD3Mdd0q6pJyvzhtzDiXdokkHBtlX6
 6N3kjAuo8L3xb3RMkU8dCPs71h3rsVh5S7UJhGk3v9umfQTv1XObBUFNXiVcBiLKfpu/
 23JzeeIX0WMbnw34P3xau5hY14QHlryFQzir/hYvdsRBRIIEHJtZaTHeyAU41+EcHF+1
 WGztvEUiwchyLcS3XCPEuM8y59ggZOvh2ZZf/tzHUIZNpwaFqcQ6uoLcMLjj/MptTBAL
 E1+A==
X-Gm-Message-State: AC+VfDzb21y/fcliOdxdcGZpZ35MscXPskhAaFegakZKoplYWhODiLXJ
 p3lFHEPkrrypDU19pwsRux8RgA==
X-Google-Smtp-Source: ACHHUZ4n36pYAckaRYbqmGsxTzHTFoV5ax5z5iMVD0zHb+446aB8zkIuGFCiXjQAg0ZUIdpQBbM+Ig==
X-Received: by 2002:a19:8c02:0:b0:4f8:4961:6aa9 with SMTP id
 o2-20020a198c02000000b004f849616aa9mr99387lfd.8.1686871299682; 
 Thu, 15 Jun 2023 16:21:39 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
 by smtp.gmail.com with ESMTPSA id
 u25-20020a056512041900b004f24ee39661sm2744852lfk.137.2023.06.15.16.21.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 16:21:39 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 16 Jun 2023 01:20:55 +0200
Subject: [PATCH v9 14/20] drm/msm/a6xx: Add support for A619_holi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v9-14-890d8f470c8b@linaro.org>
References: <20230223-topic-gmuwrapper-v9-0-890d8f470c8b@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v9-0-890d8f470c8b@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686871277; l=4063;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=ATtA2V/YLegt8/q2Uu20SduFtLhbxHciiWCX+CGAu+4=;
 b=+ygqn6qEEI4gFIhGSWrLrM1KaKJPg06Dr12/WJ1UnxAa0ImLj7nrdziLC4Pk++hsQ2h46rcD1
 uFozTkkHrmlBhpfeAT7V7g3aGQIeZGhKeI9WaoHdKYl8hAYqmIk5rPx
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
index b91fc02eb08c..2ca9e0440396 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -911,6 +911,9 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	if (adreno_is_a618(adreno_gpu))
 		return;
 
+	if (adreno_is_a619_holi(adreno_gpu))
+		hbb_lo = 0;
+
 	if (adreno_is_a640_family(adreno_gpu))
 		amsbc = 1;
 
@@ -1135,7 +1138,12 @@ static int hw_init(struct msm_gpu *gpu)
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
@@ -1144,6 +1152,9 @@ static int hw_init(struct msm_gpu *gpu)
 
 	gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_CNTL, 0);
 
+	if (adreno_is_a619_holi(adreno_gpu))
+		a6xx_sptprac_enable(gmu);
+
 	/*
 	 * Disable the trusted memory range - we don't actually supported secure
 	 * memory rendering at this point in time and we don't want to block off
@@ -1760,12 +1771,18 @@ static void a6xx_llc_slices_init(struct platform_device *pdev,
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
+		gpu_write(gpu, REG_A6XX_RBBM_GPR0_CNTL, GPR0_GBIF_HALT_REQUEST);
+		spin_until((gpu_read(gpu, REG_A6XX_RBBM_VBIF_GX_RESET_STATUS) &
+				(VBIF_RESET_ACK_MASK)) == VBIF_RESET_ACK_MASK);
+	} else if (!a6xx_has_gbif(adreno_gpu)) {
 		gpu_write(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL0, VBIF_XIN_HALT_CTRL0_MASK);
 		spin_until((gpu_read(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL1) &
 				(VBIF_XIN_HALT_CTRL0_MASK)) == VBIF_XIN_HALT_CTRL0_MASK);
@@ -1861,6 +1878,9 @@ static int a6xx_pm_resume(struct msm_gpu *gpu)
 	if (ret)
 		goto err_bulk_clk;
 
+	if (adreno_is_a619_holi(adreno_gpu))
+		a6xx_sptprac_enable(gmu);
+
 	/* If anything goes south, tear the GPU down piece by piece.. */
 	if (ret) {
 err_bulk_clk:
@@ -1920,6 +1940,9 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
 	/* Drain the outstanding traffic on memory buses */
 	a6xx_bus_clear_pending_transactions(adreno_gpu, true);
 
+	if (adreno_is_a619_holi(adreno_gpu))
+		a6xx_sptprac_disable(gmu);
+
 	clk_bulk_disable_unprepare(gpu->nr_clocks, gpu->grp_clks);
 
 	pm_runtime_put_sync(gmu->gxpd);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index de0b03a4b594..efd35b7bc4cf 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -263,6 +263,11 @@ static inline int adreno_is_a619(const struct adreno_gpu *gpu)
 	return adreno_is_revn(gpu, 619);
 }
 
+static inline int adreno_is_a619_holi(const struct adreno_gpu *gpu)
+{
+	return adreno_is_a619(gpu) && adreno_has_gmu_wrapper(gpu);
+}
+
 static inline int adreno_is_a630(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 630);

-- 
2.41.0

