Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2EF6A0809
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 13:07:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D29E10EB66;
	Thu, 23 Feb 2023 12:07:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D89C610E4CA
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 12:06:58 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id i9so13332534lfc.6
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 04:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SfCORXPcL+h5lz5tUo1IeF01Q1PtyLtEsTTqCRkpbtc=;
 b=m1hEhlxagvqU+X4OQkEzMFcRfrqsr1fXwx/quu8B/Mi64Ed4HE3d88kofupNBQ9VLC
 8g4VX/eMCm4p811Oqojx7WoO6bqtxIX/5dc1W4uykUFOoh30sApoanGTZqugnJ/mUEPO
 prmDL+d/pefj9Y1GUq625J9mZ3trvIkSllUW1XuZvD6JZg5y+ji4RGH1r8CauPsY8FnG
 EN59tWb2pbu+IqOxf/l6X8V2HnBlz0IzWzaDgnvuU6GJ9NtlJSGXJqYsfbHQtfCJtjOT
 P4PHXntQoJJjY6A9JcTWjDs1wagfLPF9C8uodBqRMsahOF/dpi4wakY3kWI6lXv8zzTd
 6owA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SfCORXPcL+h5lz5tUo1IeF01Q1PtyLtEsTTqCRkpbtc=;
 b=Iw8lgFoR8WgH392oX4XDpH3pUzThmGJ6cFzQIAl9sPfqW8CqpwmeNVPmWEzQM/q6V2
 jlsEZtf0k+QjzJ7O8kw+Y/FfPf7F8CJNRUq5C9hZWS8osEPaQM323+zO7wO4OVqYpAtw
 t7LeHffOFedGbjnQQ8TkYCPKagUDCUT70zpYA7Hj5104dGHgcyXHs0cTr9oSLJ+icIkO
 LXF1wSY5xDwIXv/wMyHNr6bEqktg7Sa4hI/u+bhGU25x/00kusP3d100dHYGrPnRx1NY
 cFDv1GDjMI/DOh/RWcJIgrOYQ3j+H4R4Jyu8iQ097tT+XZQ88w+khyaw9nbnd6+HB+EO
 i2mg==
X-Gm-Message-State: AO0yUKUkFaaV0ru+yOTyhsysnMk+jesqDpcaAKEIozTCVrKHxeFAGGfT
 U7VTzsT09fTrVL2hnsSNC4Cf5g==
X-Google-Smtp-Source: AK7set96Z0IikrlkjsFKvBy1HZU/L1ayL/YAvTC+3zS7v0b3E+52quOUWToH9WOZeKzVGV5DJLGivg==
X-Received: by 2002:a05:6512:3f05:b0:4d8:86c1:4771 with SMTP id
 y5-20020a0565123f0500b004d886c14771mr3926322lfa.6.1677154017193; 
 Thu, 23 Feb 2023 04:06:57 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
 by smtp.gmail.com with ESMTPSA id
 h23-20020a2ea497000000b0029599744c02sm414838lji.75.2023.02.23.04.06.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 04:06:56 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 23 Feb 2023 13:06:42 +0100
Subject: [PATCH v3 08/15] drm/msm/a6xx: Add support for A619_holi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v3-8-5be55a336819@linaro.org>
References: <20230223-topic-gmuwrapper-v3-0-5be55a336819@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v3-0-5be55a336819@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677154003; l=5033;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=MYCmAcgrqxscwupX3STzV6AcutfLVBuoAIsGBJpJO2M=;
 b=f5CIErDJ6neIbmSo2eANhxIuE4KTjLQCvCxu+O+2Np2QaAR+SuynfgZ/ISxfq9kiOEdip8FhUPkO
 SvOltBL7BwHPRyZXBGMJVawNyxJZEo9UJ9geSsVCfUMhap6gXx6J
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
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A619_holi is a GMU-less variant of the already-supported A619 GPU.
It's present on at least SM4350 (holi) and SM6375 (blair). No mesa
changes are required. Add the required kernel-side support for it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 43 +++++++++++++++++++++++++--------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  5 ++++
 2 files changed, 38 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index a8b727b82389..0859a6f463f9 100644
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
@@ -814,8 +816,8 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	if (adreno_is_a618(adreno_gpu))
 		return;
 
-	if (adreno_is_a619(adreno_gpu)) {
-		/* HBB = 14 */
+	if (adreno_is_a619(adreno_gpu) && !adreno_is_a619_holi(adreno_gpu)) {
+		/* HBB = 14 on A619, default 0 on A619_holi */
 		hbb_lo = 1;
 	}
 
@@ -1029,7 +1031,12 @@ static int hw_init(struct msm_gpu *gpu)
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
@@ -1038,6 +1045,9 @@ static int hw_init(struct msm_gpu *gpu)
 
 	gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_CNTL, 0);
 
+	if (adreno_is_a619_holi(adreno_gpu))
+		a6xx_sptprac_enable(gmu);
+
 	/*
 	 * Disable the trusted memory range - we don't actually supported secure
 	 * memory rendering at this point in time and we don't want to block off
@@ -1315,7 +1325,8 @@ static void a6xx_dump(struct msm_gpu *gpu)
 #define GBIF_CLIENT_HALT_MASK	BIT(0)
 #define GBIF_ARB_HALT_MASK	BIT(1)
 #define VBIF_RESET_ACK_TIMEOUT	100
-#define VBIF_RESET_ACK_MASK	0x00f0
+#define VBIF_RESET_ACK_MASK	0xF0
+#define GPR0_GBIF_HALT_REQUEST	0x1E0
 
 static void a6xx_recover(struct msm_gpu *gpu)
 {
@@ -1372,10 +1383,16 @@ static void a6xx_recover(struct msm_gpu *gpu)
 
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
@@ -1797,6 +1814,9 @@ static int a6xx_pm_resume(struct msm_gpu *gpu)
 	if (ret)
 		goto err;
 
+	if (adreno_is_a619_holi(adreno_gpu))
+		a6xx_sptprac_enable(gmu);
+
 err:
 	mutex_unlock(&a6xx_gpu->gmu.lock);
 
@@ -1851,6 +1871,9 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
 
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
2.39.2

