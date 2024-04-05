Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6383889982E
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 10:41:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1512113A8C;
	Fri,  5 Apr 2024 08:41:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OnLNQsmX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D97CF10ECEA
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 08:41:40 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2d6eedf3e99so29177161fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Apr 2024 01:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712306499; x=1712911299; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=yrIDGJdQyN3Qs3kdMSMKwxSvCzhRkNvUk3FQRrR3UEA=;
 b=OnLNQsmXSobOlOrRtIowCyCRS3CrNTfVOMAk8yCkIaVz4e+yHAE1fs18PuTY4h+Mrp
 sUDFPThCekS7xg9/oEAexqeM7hWA6OVlOqG2qzJCoR46NrGxFu5nT04R9D6EOmmT7Cm4
 PehgPFzJC7TKfIIviZvIlx3wcEPoOnatJ9DqI6zbKKrJsWNXzBXaamiGtITZxw8uRFWB
 Hs0DTEtPc3vLOggCVsuGNkbwCJyPZ5sl0dUwvi2v7mg0w0B7XlZzB9h4l4p2l/ccQfGR
 wGN3HyniqbohMrylmHdYVuiXSKoiRewCbnaf8n6r9db/7bBlDNh8UFDA7FAme3Qg5gPQ
 gewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712306499; x=1712911299;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yrIDGJdQyN3Qs3kdMSMKwxSvCzhRkNvUk3FQRrR3UEA=;
 b=O1qhJzPgflvWuXxR/GV2i5/sfkQBnbQ2JuV8AAG0KV6IpSS6oc1obPz5VksgUU3e4/
 p4pnJrgaBGCQQJ8r3pyGBDQ4dbE472RGv/MBGmOu3gVSqP9aatHyPnYFRsAML7zqj/mR
 BlHkQVlG5e83nlPWOaInt7be5MgIkSZZa+gycdgYgeNtAuDnbr0kJ8csZAzmr0TgLzLu
 8yB5Ak5qV2fLMqr5jyP/l1YioGz+8Xp9WF/vrJFtmQdFFISVGqpCjGsEEZCxq2pxLMUe
 QX0YCcGuqi6YK/ZbTLJWp+PqNgZSIYng39DRERg+0T+HJj1SQeII9hFgqB+2p8NZPfJb
 PJ1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQ5RWlbmOkA3m96/LQHyLDJF1teuVrvz8tpx2fzcJr4zENAk8OYAldLRFLk1pmHRrskGtAR6G21sTqiES3bHLM1M3/kKGhMqeHoKiuIbC1
X-Gm-Message-State: AOJu0YzD2nJwWZrYfmYstJRP+RPOWqjyuFp49GaRU6+cGfv8BlwYJ5bT
 IAzm/soa/4DJITN97dMGEPMPZiuxNng9GAA/ZOI8w+RNw7PawA3wqwWMhcxawy0=
X-Google-Smtp-Source: AGHT+IFBziklUtc+FbW+7LRtWCnnN6zKDAY/PIgp9Ri894zGj6uc53DW8wEcUxIz/7mcsRZTdjd/7g==
X-Received: by 2002:a05:651c:1047:b0:2d6:fc27:2e9b with SMTP id
 x7-20020a05651c104700b002d6fc272e9bmr485092ljm.25.1712306499038; 
 Fri, 05 Apr 2024 01:41:39 -0700 (PDT)
Received: from [127.0.1.1] (netpanel-87-246-222-101.pol.akademiki.lublin.pl.
 [87.246.222.101]) by smtp.gmail.com with ESMTPSA id
 y3-20020a05651c020300b002d429304a20sm116880ljn.8.2024.04.05.01.41.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Apr 2024 01:41:38 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 05 Apr 2024 10:41:32 +0200
Subject: [PATCH 4/6] drm/msm/adreno: Implement SMEM-based speed bin
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240405-topic-smem_speedbin-v1-4-ce2b864251b1@linaro.org>
References: <20240405-topic-smem_speedbin-v1-0-ce2b864251b1@linaro.org>
In-Reply-To: <20240405-topic-smem_speedbin-v1-0-ce2b864251b1@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.13-dev-0438c
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On recent (SM8550+) Snapdragon platforms, the GPU speed bin data is
abstracted through SMEM, instead of being directly available in a fuse.

Add support for SMEM-based speed binning, which includes getting
"feature code" and "product code" from said source and parsing them
to form something that lets us match OPPs against.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  8 +++---
 drivers/gpu/drm/msm/adreno/adreno_device.c |  2 ++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 39 +++++++++++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 12 ++++++---
 4 files changed, 51 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 4cbdfabbcee5..6776fd80f7a6 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2890,13 +2890,15 @@ static u32 fuse_to_supp_hw(const struct adreno_info *info, u32 fuse)
 	return UINT_MAX;
 }
 
-static int a6xx_set_supported_hw(struct device *dev, const struct adreno_info *info)
+static int a6xx_set_supported_hw(struct adreno_gpu *adreno_gpu,
+				 struct device *dev,
+				 const struct adreno_info *info)
 {
 	u32 supp_hw;
 	u32 speedbin;
 	int ret;
 
-	ret = adreno_read_speedbin(dev, &speedbin);
+	ret = adreno_read_speedbin(adreno_gpu, dev, &speedbin);
 	/*
 	 * -ENOENT means that the platform doesn't support speedbin which is
 	 * fine
@@ -3056,7 +3058,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 
 	a6xx_llc_slices_init(pdev, a6xx_gpu, is_a7xx);
 
-	ret = a6xx_set_supported_hw(&pdev->dev, config->info);
+	ret = a6xx_set_supported_hw(adreno_gpu, &pdev->dev, config->info);
 	if (ret) {
 		a6xx_destroy(&(a6xx_gpu->base.base));
 		return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index c3703a51287b..901ef767e491 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -6,6 +6,8 @@
  * Copyright (c) 2014,2017 The Linux Foundation. All rights reserved.
  */
 
+#include <linux/soc/qcom/socinfo.h>
+
 #include "adreno_gpu.h"
 
 bool hang_debug = false;
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 074fb498706f..0e4ff532ac3c 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -21,6 +21,9 @@
 #include "msm_gem.h"
 #include "msm_mmu.h"
 
+#include <linux/soc/qcom/smem.h>
+#include <linux/soc/qcom/socinfo.h>
+
 static u64 address_space_size = 0;
 MODULE_PARM_DESC(address_space_size, "Override for size of processes private GPU address space");
 module_param(address_space_size, ullong, 0600);
@@ -1057,9 +1060,37 @@ void adreno_gpu_ocmem_cleanup(struct adreno_ocmem *adreno_ocmem)
 			   adreno_ocmem->hdl);
 }
 
-int adreno_read_speedbin(struct device *dev, u32 *speedbin)
+int adreno_read_speedbin(struct adreno_gpu *adreno_gpu,
+			 struct device *dev, u32 *speedbin)
 {
-	return nvmem_cell_read_variable_le_u32(dev, "speed_bin", speedbin);
+	u32 fcode, pcode;
+	int ret;
+
+	/* Try reading the speedbin via a nvmem cell first */
+	ret = nvmem_cell_read_variable_le_u32(dev, "speed_bin", speedbin);
+	if (!ret && ret != -EINVAL)
+		return ret;
+
+	ret = qcom_smem_get_feature_code(&fcode);
+	if (ret) {
+		dev_err(dev, "Couldn't get feature code from SMEM!\n");
+		return ret;
+	}
+
+	ret = qcom_smem_get_product_code(&pcode);
+	if (ret) {
+		dev_err(dev, "Couldn't get product code from SMEM!\n");
+		return ret;
+	}
+
+	/* Don't consider fcode for external feature codes */
+	if (fcode <= SOCINFO_FC_EXT_RESERVE)
+		fcode = SOCINFO_FC_UNKNOWN;
+
+	*speedbin = FIELD_PREP(ADRENO_SKU_ID_PCODE, pcode) |
+		    FIELD_PREP(ADRENO_SKU_ID_FCODE, fcode);
+
+	return ret;
 }
 
 int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
@@ -1098,9 +1129,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 			devm_pm_opp_set_clkname(dev, "core");
 	}
 
-	if (adreno_read_speedbin(dev, &speedbin) || !speedbin)
+	if (adreno_read_speedbin(adreno_gpu, dev, &speedbin) || !speedbin)
 		speedbin = 0xffff;
-	adreno_gpu->speedbin = (uint16_t) (0xffff & speedbin);
+	adreno_gpu->speedbin = speedbin;
 
 	gpu_name = devm_kasprintf(dev, GFP_KERNEL, "%"ADRENO_CHIPID_FMT,
 			ADRENO_CHIPID_ARGS(config->chip_id));
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 460b399be37b..1770a9e20484 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -81,7 +81,12 @@ extern const struct adreno_reglist a612_hwcg[], a615_hwcg[], a630_hwcg[], a640_h
 extern const struct adreno_reglist a660_hwcg[], a690_hwcg[], a702_hwcg[], a730_hwcg[], a740_hwcg[];
 
 struct adreno_speedbin {
-	uint16_t fuse;
+	/* <= 16-bit for NVMEM fuses, 32b for SOCID values */
+	uint32_t fuse;
+#define ADRENO_SKU_ID_PCODE		GENMASK(31, 16)
+#define ADRENO_SKU_ID_FCODE		GENMASK(15, 0)
+#define ADRENO_SKU_ID(pcode, fcode)	(pcode << 16 | fcode)
+
 	uint16_t speedbin;
 };
 
@@ -137,7 +142,7 @@ struct adreno_gpu {
 	struct msm_gpu base;
 	const struct adreno_info *info;
 	uint32_t chip_id;
-	uint16_t speedbin;
+	uint32_t speedbin;
 	const struct adreno_gpu_funcs *funcs;
 
 	/* interesting register offsets to dump: */
@@ -520,7 +525,8 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 			 struct adreno_smmu_fault_info *info, const char *block,
 			 u32 scratch[4]);
 
-int adreno_read_speedbin(struct device *dev, u32 *speedbin);
+int adreno_read_speedbin(struct adreno_gpu *adreno_gpu,
+			 struct device *dev, u32 *speedbin);
 
 /*
  * For a5xx and a6xx targets load the zap shader that is used to pull the GPU

-- 
2.40.1

