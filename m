Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC20D9844A2
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 13:31:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4516E10E6D9;
	Tue, 24 Sep 2024 11:31:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="E/l5z4FM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F3FD10E882;
 Tue, 24 Sep 2024 11:30:58 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a8d0d0aea3cso729806666b.3; 
 Tue, 24 Sep 2024 04:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727177456; x=1727782256; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=T83s0xZ77l7YiPJQjU4R2cbGSxzbmPdpWc03YQ0vP9s=;
 b=E/l5z4FMuC47gqbw6xzJlsPkBgufCqNsfrnEFYAly0e5HWGtxpfjzB36s28E8xgRyE
 tnjXEoVqAmxzkzMrni/If0PFpP4C7/0UhCglCgxbIOLRWI3iGzKfoOd/Cx9niUuvk8To
 4ooT0zcknH/WU9lKEDNDvvC9y7QWWvcD+k6tQzXgGBSxOAhacQaU3ONqACUQnMxkmiVu
 gflKkfQe3jr7PaYz3rWQ5zMLVFAhOWRSnN/KPUiBm1E6emlqMhK4yO6846ajQCxgjU4Y
 MaFhlhsFst9R9b41529kVm60aRnBBvXL8yv5XCdEwWvYOhHEOs0q4M+CCg9wXc2DvQud
 aUJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727177456; x=1727782256;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T83s0xZ77l7YiPJQjU4R2cbGSxzbmPdpWc03YQ0vP9s=;
 b=qxeYASTktsMRXjb1PhV7tj2SeW0TQQFZvrrFolJEhzEve4QMUkriEvCvl98V0Pphnz
 QWuIYdv2YJjvbF20tp33ycxts85EW17qSgnVd1asGa82zO/ERS+a9/O6mxCaY09egTo8
 cm4t6ILQhgEuhNgO9zS2/iR9XbMaspl0V38UMplQ9fnSlG32v4nJJEmjFiLldVkBg17U
 n7L5B8RLajRxgUFEmyQ/MFvuaNOD+chClIhLukcnu6vGts3ZDavqBIgdrTqlg6k3l0+b
 pq/CzflzGTe2alkLmlfWgz6/G/N22FBkqelD1ylxLCxsKSmKNB36mDx09J5ovmGRs5R9
 HSYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzqxoYeOMMGw1fdliD7BNaWl5hLxV1MiYYSrvnZba435bc55d2Ezn771yThNMvksvwlIeDO0OitKkJ@lists.freedesktop.org,
 AJvYcCWt38s5cTOP/Op8Vz7Qp2U0jPKO7mPmpM60NRgJTOx9J2jWXthevYXgNrRgeLhcg5H13oorbCEc+VI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpXAO0XXjL5+gHQk7DyfRbTMJxo6x6bAAtGMcBLxI211ISuCv/
 /bE6a5BfPd1l2zU1zqKGcaJhiGemr3qq6yX7WG+pOFDYLwF09OAj
X-Google-Smtp-Source: AGHT+IHzITFJBQBOI6Od6A8yXGnuggjC4ofP7uNdX7aHomBgU3s1nRHgaOTt/jI/hvsoBLh0+MUDjw==
X-Received: by 2002:a17:907:f74e:b0:a86:9c41:cfc1 with SMTP id
 a640c23a62f3a-a90d4fe01e1mr1426129666b.8.1727177456317; 
 Tue, 24 Sep 2024 04:30:56 -0700 (PDT)
Received: from [192.168.1.17] (host-87-7-171-42.retail.telecomitalia.it.
 [87.7.171.42]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930cae0fsm72612766b.120.2024.09.24.04.30.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 04:30:56 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Tue, 24 Sep 2024 13:30:45 +0200
Subject: [PATCH v5 10/11] drm/msm/A6xx: Enable preemption for A750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240924-preemption-a750-t-v5-10-0be2bf81c187@gmail.com>
References: <20240924-preemption-a750-t-v5-0-0be2bf81c187@gmail.com>
In-Reply-To: <20240924-preemption-a750-t-v5-0-0be2bf81c187@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Antonino Maniscalco <antomani103@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727177437; l=3953;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=sm9hanaGRS16RZfX1ly7ITrlxWebFBdSbkyJsPoWlBc=;
 b=5jfqYFhN2eShGqsYyYpOlxaTj84UM3HppgBbzgf3lt8IUti4AVbDgN7q71k7ecpT0AeYM81n0
 7XPW2ONeBHJCF+NeEn+fg5T6o6TysRAytAwMTgegbVVPq8JuxZfx/aj
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
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

Initialize with 4 rings to enable preemption.

For now only on A750 as other targets require testing.

Add the "preemption_enabled" module parameter to override this for other
A7xx targets.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c  | 3 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 6 +++++-
 drivers/gpu/drm/msm/adreno/adreno_device.c | 4 ++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 1 +
 4 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 316f23ca91671d973797f2a5b69344f376707325..0e3041b2941905f1acdc9e571e0549a960a7edfa 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1240,7 +1240,8 @@ static const struct adreno_info a7xx_gpus[] = {
 		.gmem = 3 * SZ_1M,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
-			  ADRENO_QUIRK_HAS_HW_APRIV,
+			  ADRENO_QUIRK_HAS_HW_APRIV |
+			  ADRENO_QUIRK_PREEMPTION,
 		.init = a6xx_gpu_init,
 		.zapfw = "gen70900_zap.mbn",
 		.a6xx = &(const struct a6xx_info) {
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index edbcb6d229ba614be910ee70e75731538116e4a4..4760f9469613c0bf208f56be9608747b5aa75606 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2529,6 +2529,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	struct a6xx_gpu *a6xx_gpu;
 	struct adreno_gpu *adreno_gpu;
 	struct msm_gpu *gpu;
+	extern int enable_preemption;
 	bool is_a7xx;
 	int ret;
 
@@ -2567,7 +2568,10 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 		return ERR_PTR(ret);
 	}
 
-	if (is_a7xx)
+	if ((enable_preemption == 1) || (enable_preemption == -1 &&
+	    (config->info->quirks & ADRENO_QUIRK_PREEMPTION)))
+		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_a7xx, 4);
+	else if (is_a7xx)
 		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_a7xx, 1);
 	else if (adreno_has_gmu_wrapper(adreno_gpu))
 		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_gmuwrapper, 1);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index cfc74a9e2646d3de76a06bd67457d69afa49e309..9ffe91920fbfb4841b28aabec9fbde94539fdd83 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -20,6 +20,10 @@ bool allow_vram_carveout = false;
 MODULE_PARM_DESC(allow_vram_carveout, "Allow using VRAM Carveout, in place of IOMMU");
 module_param_named(allow_vram_carveout, allow_vram_carveout, bool, 0600);
 
+int enable_preemption = -1;
+MODULE_PARM_DESC(enable_preemption, "Enable preemption (A7xx only) (1=on , 0=disable, -1=auto (default))");
+module_param(enable_preemption, int, 0600);
+
 extern const struct adreno_gpulist a2xx_gpulist;
 extern const struct adreno_gpulist a3xx_gpulist;
 extern const struct adreno_gpulist a4xx_gpulist;
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 87098567483b69c21025b80f356e0a68f0e7f172..d1cd53f05de68b3873f35520655e09e82fc40449 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -56,6 +56,7 @@ enum adreno_family {
 #define ADRENO_QUIRK_LMLOADKILL_DISABLE		BIT(2)
 #define ADRENO_QUIRK_HAS_HW_APRIV		BIT(3)
 #define ADRENO_QUIRK_HAS_CACHED_COHERENT	BIT(4)
+#define ADRENO_QUIRK_PREEMPTION			BIT(5)
 
 /* Helper for formating the chip_id in the way that userspace tools like
  * crashdec expect.

-- 
2.46.1

