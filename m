Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7113C7FFD05
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 21:45:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0AC410E044;
	Thu, 30 Nov 2023 20:45:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 594 seconds by postgrey-1.36 at gabe;
 Thu, 30 Nov 2023 20:45:47 UTC
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B58710E02B;
 Thu, 30 Nov 2023 20:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=z3ntu;
 t=1701376552; bh=WseaproAPlHcyZYH4LuAiRPthwckItsf2rlGuhoBAh8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=cOpvtJKuilyla47tGgvTTWgfpd0VCC+MIMo9DAl/plG1RVcsxd4vHcfSVGsxB9+mj
 RllPTYEwkI+A3aF1OjOu4JlVJZsvIt7zlIwMXLqYyCM1N/SugtUh/V3nYUq+YxisdK
 WQBqDJRvLyad5tHm3acbVhDN/4Yy4sxoSeZLCMGI=
From: Luca Weiss <luca@z3ntu.xyz>
Date: Thu, 30 Nov 2023 21:35:19 +0100
Subject: [PATCH 2/3] drm/msm/adreno: Add A305B support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231130-msm8226-gpu-v1-2-6bb2f1b29e49@z3ntu.xyz>
References: <20231130-msm8226-gpu-v1-0-6bb2f1b29e49@z3ntu.xyz>
In-Reply-To: <20231130-msm8226-gpu-v1-0-6bb2f1b29e49@z3ntu.xyz>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=4468; i=luca@z3ntu.xyz;
 h=from:subject:message-id; bh=WseaproAPlHcyZYH4LuAiRPthwckItsf2rlGuhoBAh8=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBlaPIkxK4kOIZXeKxvYESMbmponpLhfG0XOxOuS
 f9QheSROLCJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZWjyJAAKCRBy2EO4nU3X
 Von4EAC25Q0VcH3QjuMCivMXLTNFnrhN96a2vx+oqUCbN7/zF9InDFWexqp1j6KNjymyzDaPn1u
 TH/pPQYdPomSWvfQf0PifhbuMpFIv5lLz4/S+zRuXlp9h761AaZPJAH8rd9LJ0Ap1cDbYQ6Ra68
 10qWUxhCUb8o/0uWdK9O8SSj6bJPEKgE0y82mnDBtm3w5cXCQLarZ8ykOa/vV6LRHhXNqSQBhtJ
 okGnrxbTxkoEsiGQTx9BTE/ih3ozm8rrdE+NuLfP2aU+RAySf0VFeka1iikvbFF4caVR6zduTWD
 AprMyCx79y7asW01ReTs5TqB/qg7B0m8ERLbDbCQX8quHiEKJBZ2zKwg3J2O4YBPvENbyH/lW6v
 zYA2PFu/Xpd+pXcJJ6r6Sc41ZPKyjcIWLjpg5V/luLEvwFscRNCnr+ejIXnazy7d0jv+k5oJOLw
 gAuepPv+bf0ZC0rYqOGC46L7xhlcuE14/bRdVP8znEB6SC3MmwWlTi5i7jm1JsYP5h34IMkmYKE
 HVR4y4/mte9ZwZwHO/z9z9m2IXguI6u3lOqjY31hjNq0n55Oq/xETklMaG+5V2OEyxyFzyOmHGs
 BjBqtZuhGw42ZGeUrDgm1nMFnsjm43aM24Ui742aSRj/Ck6clTfT8rlliikr4Yl7z8I22Iw9x/X
 j7BGDmGW4nDx/IA==
X-Developer-Key: i=luca@z3ntu.xyz; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD
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
 Luca Weiss <luca@z3ntu.xyz>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the Adreno 305B GPU that is found in MSM8226(v2) SoC.
Previously this was mistakenly claimed to be supported but using wrong
a configuration.

In MSM8226v1 there's also a A305B but with chipid 0x03000510 which
should work with the same configuration but due to lack of hardware for
testing this is not added.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c      | 15 ++++++++++++---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 15 +++++++++++----
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  5 +++++
 3 files changed, 28 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
index c86b377f6f0d..5fc29801c4c7 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
@@ -134,6 +134,13 @@ static int a3xx_hw_init(struct msm_gpu *gpu)
 		/* Set up AOOO: */
 		gpu_write(gpu, REG_A3XX_VBIF_OUT_AXI_AOOO_EN, 0x0000003c);
 		gpu_write(gpu, REG_A3XX_VBIF_OUT_AXI_AOOO, 0x003c003c);
+	} else if (adreno_is_a305b(adreno_gpu)) {
+		gpu_write(gpu, REG_A3XX_VBIF_IN_RD_LIM_CONF0, 0x00181818);
+		gpu_write(gpu, REG_A3XX_VBIF_IN_WR_LIM_CONF0, 0x00181818);
+		gpu_write(gpu, REG_A3XX_VBIF_OUT_RD_LIM_CONF0, 0x00000018);
+		gpu_write(gpu, REG_A3XX_VBIF_OUT_WR_LIM_CONF0, 0x00000018);
+		gpu_write(gpu, REG_A3XX_VBIF_DDR_OUT_MAX_BURST, 0x00000303);
+		gpu_write(gpu, REG_A3XX_VBIF_ROUND_ROBIN_QOS_ARB, 0x0003);
 	} else if (adreno_is_a306(adreno_gpu)) {
 		gpu_write(gpu, REG_A3XX_VBIF_ROUND_ROBIN_QOS_ARB, 0x0003);
 		gpu_write(gpu, REG_A3XX_VBIF_OUT_RD_LIM_CONF0, 0x0000000a);
@@ -230,7 +237,9 @@ static int a3xx_hw_init(struct msm_gpu *gpu)
 	gpu_write(gpu, REG_A3XX_UCHE_CACHE_MODE_CONTROL_REG, 0x00000001);
 
 	/* Enable Clock gating: */
-	if (adreno_is_a306(adreno_gpu))
+	if (adreno_is_a305b(adreno_gpu))
+		gpu_write(gpu, REG_A3XX_RBBM_CLOCK_CTL, 0xaaaaaaaa);
+	else if (adreno_is_a306(adreno_gpu))
 		gpu_write(gpu, REG_A3XX_RBBM_CLOCK_CTL, 0xaaaaaaaa);
 	else if (adreno_is_a320(adreno_gpu))
 		gpu_write(gpu, REG_A3XX_RBBM_CLOCK_CTL, 0xbfffffff);
@@ -333,7 +342,7 @@ static int a3xx_hw_init(struct msm_gpu *gpu)
 				AXXX_CP_QUEUE_THRESHOLDS_CSQ_IB1_START(2) |
 				AXXX_CP_QUEUE_THRESHOLDS_CSQ_IB2_START(6) |
 				AXXX_CP_QUEUE_THRESHOLDS_CSQ_ST_START(14));
-	} else if (adreno_is_a330(adreno_gpu)) {
+	} else if (adreno_is_a330(adreno_gpu) || adreno_is_a305b(adreno_gpu)) {
 		/* NOTE: this (value take from downstream android driver)
 		 * includes some bits outside of the known bitfields.  But
 		 * A330 has this "MERCIU queue" thing too, which might
@@ -559,7 +568,7 @@ struct msm_gpu *a3xx_gpu_init(struct drm_device *dev)
 		goto fail;
 
 	/* if needed, allocate gmem: */
-	if (adreno_is_a330(adreno_gpu)) {
+	if (adreno_is_a330(adreno_gpu) || adreno_is_a305b(adreno_gpu)) {
 		ret = adreno_gpu_ocmem_init(&adreno_gpu->base.pdev->dev,
 					    adreno_gpu, &a3xx_gpu->ocmem);
 		if (ret)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index f62ab5257e66..7028d5449956 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -55,10 +55,17 @@ static const struct adreno_info gpulist[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init  = a2xx_gpu_init,
 	}, {
-		.chip_ids = ADRENO_CHIP_IDS(
-			0x03000512,
-			0x03000520
-		),
+		.chip_ids = ADRENO_CHIP_IDS(0x03000512),
+		.family = ADRENO_3XX,
+		.fw = {
+			[ADRENO_FW_PM4] = "a330_pm4.fw",
+			[ADRENO_FW_PFP] = "a330_pfp.fw",
+		},
+		.gmem  = SZ_128K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.init  = a3xx_gpu_init,
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x03000520),
 		.family = ADRENO_3XX,
 		.revn  = 305,
 		.fw = {
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 80b3f6312116..c654f21499bb 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -247,6 +247,11 @@ static inline bool adreno_is_a305(const struct adreno_gpu *gpu)
 	return adreno_is_revn(gpu, 305);
 }
 
+static inline bool adreno_is_a305b(const struct adreno_gpu *gpu)
+{
+	return gpu->info->chip_ids[0] == 0x03000512;
+}
+
 static inline bool adreno_is_a306(const struct adreno_gpu *gpu)
 {
 	/* yes, 307, because a305c is 306 */

-- 
2.43.0

