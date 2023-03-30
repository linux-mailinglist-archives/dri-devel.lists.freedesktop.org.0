Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D6D6D1321
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 01:26:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EFCC10E2A9;
	Thu, 30 Mar 2023 23:26:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E44510F0B6
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 23:25:35 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id x17so26680197lfu.5
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 16:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680218735;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=jMYlGeM0Pum7ZWZdlHUkAZRW+tOVgC4i2VoiIZndCqI=;
 b=iuC4ERq9SpHi8DfCS6jg+ET0Pl9MP9M9QXPXPL6e9p2Tss0ixwXHpFxrBqiTsPn8cZ
 rjKkQ23LgEMT1ixZk4xcEUaCoazHpbzKQ7ISMxLJ6Rbsip058e6pJivm50Cpbom4W2ej
 vPl8HsVeTPZI+x0Bret0qv3mGCymS/8K1/ztxinG0I/3QiHJyo8ImUtgjOW99RCSvIFd
 W4xBHqVmw6TMe6ZN6vyZ1EQfhdHeci64crX2zOMJIVU2R4QxhFr71cgDpG0eo+jDndQD
 kyLh7IOBLyfLRgia4Z1P9Oh372lKd9vJVLlc+qKtV7Bp5yNINGeoyIfJap+WnEhGEzt5
 zgsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680218735;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jMYlGeM0Pum7ZWZdlHUkAZRW+tOVgC4i2VoiIZndCqI=;
 b=4bSsGhwLndqR5vy32YxuEmlf6Hw4BthK758Ow0R3j9toKuKAql1z/vEaXn3cwJZ6a8
 V9CsMtSAGuD3DC3t7kSxpGiS5qFDnsZZOG/8yzyqs+ywISSIjMWyvScDA+zrc18ApePc
 /d76EkrUHPqmEANSzUKRHcaHYh+LlSdbsdsvUUvmdJHrpNTdoZ7f9NCAYe6dnzXz2qC0
 +23wJQENg+UdufK2Nh1NFMPZ3BY8GwQr4ectpo6Hsn1D3lP94Ok+YkbocWBvaOeryb2n
 eeQTdq5cqW8GA5pRAK3gYpn/TcxrE9LJ0alWmi7ZdUq+ubqNqgvnHABX8j4VvjrmFcqq
 fLkw==
X-Gm-Message-State: AAQBX9cKH7FB6xWLnZySwNQHu4j/C8iovUJeL5kEqwNbUGGsed95nFPB
 gR0BU/iDu0tsL39cmhDWc2TtqQ==
X-Google-Smtp-Source: AKy350at/mgLBXHIOXRHgytcnWi+bbIg3F5qc4Q9D25p2zwzCSNWlD2HCLChnasjq6YanmBpdZ56sw==
X-Received: by 2002:ac2:484a:0:b0:4dd:a73f:aede with SMTP id
 10-20020ac2484a000000b004dda73faedemr6777961lfy.10.1680218734912; 
 Thu, 30 Mar 2023 16:25:34 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 g26-20020ac2539a000000b004dda80cabf0sm127241lfh.172.2023.03.30.16.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 16:25:34 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 31 Mar 2023 01:25:23 +0200
Subject: [PATCH v5 09/15] drm/msm/a6xx: Add support for A619_holi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v5-9-bf774b9a902a@linaro.org>
References: <20230223-topic-gmuwrapper-v5-0-bf774b9a902a@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v5-0-bf774b9a902a@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680218720; l=5408;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=BOvli+a8A2NKtDDU27JWYXOoc6fVy8bQjLNL9lXnjH8=;
 b=FgsFs8n/V/d+jQnCzG92Ptu3ZTvQMOL2mUrgIV+5E/e4Idd6AEDiQ0TXDGUDJXjUe7BchnRJVX5a
 2kU6QSPIBI7PHlIrdmpZudf06ckm6PFCwtbGOo65Hk7CCYXmIiki
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
index 30dae3ddc1c5..d5ec57985387 100644
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
 
@@ -1015,7 +1020,12 @@ static int hw_init(struct msm_gpu *gpu)
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
@@ -1024,6 +1034,9 @@ static int hw_init(struct msm_gpu *gpu)
 
 	gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_CNTL, 0);
 
+	if (adreno_is_a619_holi(adreno_gpu))
+		a6xx_sptprac_enable(gmu);
+
 	/*
 	 * Disable the trusted memory range - we don't actually supported secure
 	 * memory rendering at this point in time and we don't want to block off
@@ -1298,7 +1311,8 @@ static void a6xx_dump(struct msm_gpu *gpu)
 #define GBIF_CLIENT_HALT_MASK	BIT(0)
 #define GBIF_ARB_HALT_MASK	BIT(1)
 #define VBIF_RESET_ACK_TIMEOUT	100
-#define VBIF_RESET_ACK_MASK	0x00f0
+#define VBIF_RESET_ACK_MASK	0xF0
+#define GPR0_GBIF_HALT_REQUEST	0x1E0
 
 static void a6xx_recover(struct msm_gpu *gpu)
 {
@@ -1362,10 +1376,16 @@ static void a6xx_recover(struct msm_gpu *gpu)
 
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
@@ -1380,7 +1400,10 @@ static void a6xx_recover(struct msm_gpu *gpu)
 		/* Clear the halts */
 		gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
 
-		gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, 0);
+		if (adreno_is_a619_holi(adreno_gpu))
+			gpu_write(gpu, 0x18, 0);
+		else
+			gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, 0);
 
 		/* This *really* needs to go through before we do anything else! */
 		mb();
@@ -1786,6 +1809,9 @@ static int a6xx_pm_resume(struct msm_gpu *gpu)
 	if (ret)
 		goto err_mem_clk;
 
+	if (adreno_is_a619_holi(adreno_gpu))
+		a6xx_sptprac_enable(gmu);
+
 	/* If anything goes south, tear the GPU down piece by piece.. */
 	if (ret) {
 err_mem_clk:
@@ -1851,6 +1877,9 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
 
 	mutex_lock(&a6xx_gpu->gmu.lock);
 
+	if (adreno_is_a619_holi(adreno_gpu))
+		a6xx_sptprac_disable(gmu);
+
 	clk_disable_unprepare(gpu->ebi1_clk);
 
 	clk_bulk_disable_unprepare(gpu->nr_clocks, gpu->grp_clks);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 2c0f0ef094cb..92ece15ec7d8 100644
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

