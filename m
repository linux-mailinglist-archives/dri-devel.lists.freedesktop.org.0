Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B4F8FD734
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 22:10:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C67910E81C;
	Wed,  5 Jun 2024 20:10:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vjfgihwn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49BCE10E807
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 20:10:29 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-57a2f032007so242488a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2024 13:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717618227; x=1718223027; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hB/7Kb1VW4gFTXC7Yg+4jPgSlPqTTRx/zg0Jbjaqk2Q=;
 b=vjfgihwntthsxrrbWL44AQm+xVs9cDwgDG+Ll2TJHdfawWDZI74wYFBFhoQD1Rz/NL
 mAhOdxK3biVIUorI3DLMdDIOvdG3kB+r3P8lV4GQDp/ktg/PPgUeJQX9NFJtckyr2Auo
 ltenO57SD+IKrL8gf49O9TMR7nV7sPb4LVlMUxWjy+W5nrUixcB80MoUO3ar+cjc9byo
 Z6Hm+7IBTLvUA2rspkj9RVoE1+Q5r/SdqLxVVmgeYn7b7qSqQqEdYG8/9gZJxfODzUQC
 LEm/32EpRUlNq+PEmcSCX6NRLSyHpnZkg8mEtmDkEEqX7dxo6o87Q6jrXyw7WZS/9gzV
 qnEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717618227; x=1718223027;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hB/7Kb1VW4gFTXC7Yg+4jPgSlPqTTRx/zg0Jbjaqk2Q=;
 b=he0Ar+2FoVn9N4K2s+AlqQv64jSE31jMCDy+ddmioIL/bOix7auJBTp05JprtA2qbS
 ruHrLcVv0GhUP8xZVQwUTzhCFtAANmxRxfbRXxWmLYnny/hx5UMy2vx7MTGbCT6WvJ1O
 B3bJCWHP/wsAJJ47B2+lWsdYvBTRUw89AP/A+T7reY4GR9vOGhZi+3POwS+XppYfs8ex
 YpMGj46c476jIp6VQ/3pGPdEbOG2hvKFm9mTOe1iEvdhQ5Rd3TrKjDqT4nIwm5nz4ssb
 0foXhS9mfXXNMU7popBFzMQ4SnlCAapeHF90Qi7l72uvDhdv0jIHmSr2zHLnEgsGtPZI
 jPxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaMUmyfOjC0WnOLaHI++6TqYp/YKnbvdsYbEW2zVZmeQad0paz0QRHbPlZP8PotRq5O97gP8GumVSy/ESwPwu8g4l4hkTPKujBWSV6KZGb
X-Gm-Message-State: AOJu0Yyjm6TZ5RdDUteSHj4er+AsNSDhJbFnbGS3d/BCATb/dkzUbx45
 ejhMPMPcaDIaa3aRMDdBFhXIvYjkQ7HEoG8+0BGPA6Q8sGvbB9ccVFnGSyTOFyY=
X-Google-Smtp-Source: AGHT+IE1HK1zb72A1yjGoZvPGwo5Mrz8Ux6oOc+nkRD2t2RiWJ2159E6+Z5bPtsUlRepkwL8ZiNiyg==
X-Received: by 2002:a50:a455:0:b0:578:6c3e:3b8f with SMTP id
 4fb4d7f45d1cf-57a8b67c37fmr2448706a12.2.1717618227416; 
 Wed, 05 Jun 2024 13:10:27 -0700 (PDT)
Received: from [127.0.1.1] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57a31be4e36sm9717473a12.53.2024.06.05.13.10.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 13:10:27 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 05 Jun 2024 22:10:16 +0200
Subject: [PATCH v2 3/7] drm/msm/adreno: Implement SMEM-based speed bin
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240605-topic-smem_speedbin-v2-3-8989d7e3d176@linaro.org>
References: <20240605-topic-smem_speedbin-v2-0-8989d7e3d176@linaro.org>
In-Reply-To: <20240605-topic-smem_speedbin-v2-0-8989d7e3d176@linaro.org>
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
X-Mailer: b4 0.14-dev
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

Due to the product code being ignored in the context of Adreno on
production parts (as of SM8650), hardcode it to SOCINFO_PC_UNKNOWN.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  8 +++---
 drivers/gpu/drm/msm/adreno/adreno_device.c |  2 ++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 41 +++++++++++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 12 ++++++---
 4 files changed, 53 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 973872ad0474..3f84417ff027 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2894,13 +2894,15 @@ static u32 fuse_to_supp_hw(const struct adreno_info *info, u32 fuse)
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
@@ -3060,7 +3062,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 
 	a6xx_llc_slices_init(pdev, a6xx_gpu, is_a7xx);
 
-	ret = a6xx_set_supported_hw(&pdev->dev, config->info);
+	ret = a6xx_set_supported_hw(adreno_gpu, &pdev->dev, config->info);
 	if (ret) {
 		a6xx_llc_slices_destroy(a6xx_gpu);
 		kfree(a6xx_gpu);
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
index 074fb498706f..055072260b3d 100644
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
@@ -1057,9 +1060,39 @@ void adreno_gpu_ocmem_cleanup(struct adreno_ocmem *adreno_ocmem)
 			   adreno_ocmem->hdl);
 }
 
-int adreno_read_speedbin(struct device *dev, u32 *speedbin)
+int adreno_read_speedbin(struct adreno_gpu *adreno_gpu,
+			 struct device *dev, u32 *fuse)
 {
-	return nvmem_cell_read_variable_le_u32(dev, "speed_bin", speedbin);
+	u32 fcode;
+	int ret;
+
+	/*
+	 * Try reading the speedbin via a nvmem cell first
+	 * -ENOENT means "no nvmem-cells" and essentially means "old DT" or
+	 * "nvmem fuse is irrelevant", simply assume it's fine.
+	 */
+	ret = nvmem_cell_read_variable_le_u32(dev, "speed_bin", fuse);
+	if (!ret)
+		return 0;
+	else if (ret != -ENOENT)
+		return dev_err_probe(dev, ret, "Couldn't read the speed bin fuse value\n");
+
+#ifdef CONFIG_QCOM_SMEM
+	/*
+	 * Only check the feature code - the product code only matters for
+	 * proto SoCs unavailable outside Qualcomm labs, as far as GPU bin
+	 * matching is concerned.
+	 *
+	 * Ignore EOPNOTSUPP, as not all SoCs expose this info through SMEM.
+	 */
+	ret = qcom_smem_get_feature_code(&fcode);
+	if (!ret) {
+		*fuse = ADRENO_SKU_ID(fcode);
+	} else if (ret != -EOPNOTSUPP)
+		return dev_err_probe(dev, ret, "Couldn't get feature code from SMEM\n");
+#endif
+
+	return 0;
 }
 
 int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
@@ -1098,9 +1131,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
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
index 77526892eb8c..8f2b70eaf6ad 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -81,7 +81,12 @@ extern const struct adreno_reglist a612_hwcg[], a615_hwcg[], a630_hwcg[], a640_h
 extern const struct adreno_reglist a660_hwcg[], a690_hwcg[], a702_hwcg[], a730_hwcg[], a740_hwcg[];
 
 struct adreno_speedbin {
-	uint16_t fuse;
+	/* <= 16-bit for NVMEM fuses, 32b for SOCID values */
+	uint32_t fuse;
+/* As of SM8650, PCODE on production SoCs is meaningless wrt the GPU bin */
+#define ADRENO_SKU_ID_FCODE		GENMASK(15, 0)
+#define ADRENO_SKU_ID(fcode)	(SOCINFO_PC_UNKNOWN << 16 | fcode)
+
 	uint16_t speedbin;
 };
 
@@ -136,7 +141,7 @@ struct adreno_gpu {
 	struct msm_gpu base;
 	const struct adreno_info *info;
 	uint32_t chip_id;
-	uint16_t speedbin;
+	uint32_t speedbin;
 	const struct adreno_gpu_funcs *funcs;
 
 	/* interesting register offsets to dump: */
@@ -519,7 +524,8 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 			 struct adreno_smmu_fault_info *info, const char *block,
 			 u32 scratch[4]);
 
-int adreno_read_speedbin(struct device *dev, u32 *speedbin);
+int adreno_read_speedbin(struct adreno_gpu *adreno_gpu,
+			 struct device *dev, u32 *speedbin);
 
 /*
  * For a5xx and a6xx targets load the zap shader that is used to pull the GPU

-- 
2.43.0

