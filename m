Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 590236D307A
	for <lists+dri-devel@lfdr.de>; Sat,  1 Apr 2023 13:55:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA0DA10E2B3;
	Sat,  1 Apr 2023 11:55:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21A6B10E245
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Apr 2023 11:55:14 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id g19so19114078lfr.9
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Apr 2023 04:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680350113;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/AveNVS90BbixbsT3Hw8pttX0Kjo8MGgQJUSc1CubkM=;
 b=r1VMGlD/JaOY6H5LFK+DfCNncPEUrIsfr37GCejQxyn9nPaiQeWtrtUXXf8s4GKOxi
 7ty6QNq5iMmE9h5VJ5YJ/9lBSaak0AvuacYALS3RJcLOsPAB1JnOKlvMIe6JAaaAO9hT
 VKJuK4H54UnJZWFT0IRBAC06taxKql7RZopJFULhPd2eL6TdTPEksMeRF/nOtyyl+PKj
 Ix7T/I8x3GjEOH2uNcTuPELtsMIpq1pf/cMy2aNxUunkJ7W0XAZYWt12DAa3BDd1vPhM
 ocTU9MKHXUTONkrHei0sZ1yqMaKZW0NXcsNFby+2SMMFMHfjJ3bLLpVhnOpnKVi5JPvr
 BuPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680350113;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/AveNVS90BbixbsT3Hw8pttX0Kjo8MGgQJUSc1CubkM=;
 b=bUg5Vj8RrSXzzfNQV6JKVnuyJVByh6JrsUO0o0QCMDcO9B0geIg3yExCgQ0KkR7rtE
 JXdq6nefrqhkPhtPX3nE8m7UKsvwHWt/9xXzKim5mHTmpgzwy9gPmD4QZLNGeBdYMgnO
 /MkgN8Pk1fuhGgRsLmNQvDW9fEZJsB2rvWJP5ewn2Xr74O/um6MBRqgI4UYz0FrWBzbk
 m8XTXNlpVkqAMBs7sltNfxQoqCziY5GElrIc1hD6LbHPiuelk6KYTwH2rw4vHTp6XHV3
 fcoHJgFYa7uBbaVFszsjFfktGZNwQBLVhCn3ddb7VDpFpzlmVG0KUevGTq9HrSCfnzNz
 CuZg==
X-Gm-Message-State: AAQBX9fNdQ8O2zywA/hSCJA47lgm+bkAwa8uCbsh1xpPdPkTpEC+2R27
 aHwIDMbjO2x52mJR1po+D89MRg==
X-Google-Smtp-Source: AKy350b+H5PJ6wJk2RC5hbU8BM+KikBw2ugOy6n/cQlKZQllD0i5N1c9g6IyUSzGSJ4+T4jGJgyvMQ==
X-Received: by 2002:ac2:44b0:0:b0:4b6:e494:a98d with SMTP id
 c16-20020ac244b0000000b004b6e494a98dmr8979801lfm.44.1680350113699; 
 Sat, 01 Apr 2023 04:55:13 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 w8-20020ac254a8000000b004e83f386878sm786737lfk.153.2023.04.01.04.55.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Apr 2023 04:55:13 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 01 Apr 2023 13:54:46 +0200
Subject: [PATCH v6 09/15] drm/msm/a6xx: Add support for A619_holi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v6-9-2034115bb60c@linaro.org>
References: <20230223-topic-gmuwrapper-v6-0-2034115bb60c@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v6-0-2034115bb60c@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680350084; l=5408;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Mkcr01HfBHaztD2wRr44pOp8RNWCI4HsPdHfNo0D/wo=;
 b=UQ+2LdTXuXfrYvTQ8BtWQnex4mYwBwZIQknk3Xa6cSTH5bvgmW3PBRU2MbRbeDqT9Is67ONfppNt
 8/28R+FJAR6X3tMgOZCNYlneY6cFmLeC+jXJ3j1WYbKfwI1z9YNZ
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
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 47 ++++++++++++++++++++++++++-------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  5 ++++
 2 files changed, 43 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 17e314a745c3..2d68b7488b1b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -614,14 +614,16 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 		return;
 
 	/* Disable SP clock before programming HWCG registers */
-	if (!adreno_has_gmu_wrapper(adreno_gpu))
+	if (!adreno_has_gmu_wrapper(adreno_gpu) ||
+	     adreno_is_a619_holi(adreno_gpu))
 		gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 1, 0);
 
 	for (i = 0; (reg = &adreno_gpu->info->hwcg[i], reg->offset); i++)
 		gpu_write(gpu, reg->offset, state ? reg->value : 0);
 
 	/* Enable SP clock */
-	if (!adreno_has_gmu_wrapper(adreno_gpu))
+	if (!adreno_has_gmu_wrapper(adreno_gpu) ||
+	     adreno_is_a619_holi(adreno_gpu))
 		gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 0, 1);
 
 	gpu_write(gpu, REG_A6XX_RBBM_CLOCK_CNTL, state ? clock_cntl_on : 0);
@@ -814,6 +816,9 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	if (adreno_is_a618(adreno_gpu))
 		return;
 
+	if (adreno_is_a619_holi(adreno_gpu))
+		hbb_lo = 0;
+
 	if (adreno_is_a640_family(adreno_gpu))
 		amsbc = 1;
 
@@ -1031,7 +1036,12 @@ static int hw_init(struct msm_gpu *gpu)
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
@@ -1040,6 +1050,9 @@ static int hw_init(struct msm_gpu *gpu)
 
 	gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_CNTL, 0);
 
+	if (adreno_is_a619_holi(adreno_gpu))
+		a6xx_sptprac_enable(gmu);
+
 	/*
 	 * Disable the trusted memory range - we don't actually supported secure
 	 * memory rendering at this point in time and we don't want to block off
@@ -1295,7 +1308,8 @@ static void a6xx_dump(struct msm_gpu *gpu)
 #define GBIF_CLIENT_HALT_MASK	BIT(0)
 #define GBIF_ARB_HALT_MASK	BIT(1)
 #define VBIF_RESET_ACK_TIMEOUT	100
-#define VBIF_RESET_ACK_MASK	0x00f0
+#define VBIF_RESET_ACK_MASK	0xF0
+#define GPR0_GBIF_HALT_REQUEST	0x1E0
 
 static void a6xx_recover(struct msm_gpu *gpu)
 {
@@ -1359,10 +1373,16 @@ static void a6xx_recover(struct msm_gpu *gpu)
 
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
@@ -1377,7 +1397,10 @@ static void a6xx_recover(struct msm_gpu *gpu)
 		/* Clear the halts */
 		gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
 
-		gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, 0);
+		if (adreno_is_a619_holi(adreno_gpu))
+			gpu_write(gpu, 0x18, 0);
+		else
+			gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, 0);
 
 		/* This *really* needs to go through before we do anything else! */
 		mb();
@@ -1733,6 +1756,9 @@ static int a6xx_pm_resume(struct msm_gpu *gpu)
 	if (ret)
 		goto err_mem_clk;
 
+	if (adreno_is_a619_holi(adreno_gpu))
+		a6xx_sptprac_enable(gmu);
+
 	/* If anything goes south, tear the GPU down piece by piece.. */
 	if (ret) {
 err_mem_clk:
@@ -1798,6 +1824,9 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
 
 	mutex_lock(&a6xx_gpu->gmu.lock);
 
+	if (adreno_is_a619_holi(adreno_gpu))
+		a6xx_sptprac_disable(gmu);
+
 	clk_disable_unprepare(gpu->ebi1_clk);
 
 	clk_bulk_disable_unprepare(gpu->nr_clocks, gpu->grp_clks);
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
2.40.0

