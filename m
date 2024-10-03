Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D60898F3D4
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 18:13:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 124D410E8C4;
	Thu,  3 Oct 2024 16:13:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ONG8sW0X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1422F10E8C2;
 Thu,  3 Oct 2024 16:13:19 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a9909dff33dso186583366b.2; 
 Thu, 03 Oct 2024 09:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727971997; x=1728576797; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=NKJFRuukzHMdicXNTKn9DNH9WIRDTQEFbWKyZAU8kdY=;
 b=ONG8sW0XzM45jd3RYAykz+QTqdFQCGenWvX3Kw1gfAjD37ewqKq/QN7OuUApeNXyKP
 q4DVPJrjFFqEvpas1djOiUdp0jHAcetzRhTy2GU/ZtkAtXcc9ZTOku0kem7f4ITKtqt2
 JcjgtpEAcKq2Go27n5sj3Waec9Xjy2x+1payrFFaB/MwNOyOIjgCYo2HNrQXaq+X9MnM
 MV94CpgIuDy6sAffefIS0M90s0Z9NR0NQzbuC8u0uUvntmQ6EbMLLEbGvesCdFhtCotJ
 eBbbVZzXjEup6giAyQ/P5XOkgW9aGoq1WAXOIrU4zc5ZIbmJOoGFWCPc8nQ/PLAWVnp/
 CHlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727971997; x=1728576797;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NKJFRuukzHMdicXNTKn9DNH9WIRDTQEFbWKyZAU8kdY=;
 b=t28C+mL9+Thj7cLxi1rYDWJE4nieQVbRqoNJbXqb08xUq12Fmg0rvRegsUwX/3vmO8
 Fa+eOCuUkD92xyX8dvO1EbCnbKxRD6E/QyGv5QzlJNKDR+DhENxXzza5TYQ6S5bDKPmm
 JNXj77SIHPbZDZgyHURZGKynhnar2ZiEhzY8dgtWlgIVwCjWfWYLRpoA3XiXB9LVd7xz
 fw29MQxhURyj+Y5Uglnb4gKD5FUwSZfqPVwkJSUxb8UgB+6TsUnEuJ+8NjfKXHofZKRa
 RJ+o8JHXdSMn1yYgtpba7veC7MCG263Uz/mggrppfL0+li54hy7bXaP95Kc9bOkZVoWj
 ashA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUq7SziJoooO66AA23Z+knfvHSxyW5jUHrjOpR0pVjtlI3d6HpUQQSJ4EE810V9hziIboeiH0sU3GE=@lists.freedesktop.org,
 AJvYcCXHoyQu8nd3/S9ZSQ2XHuK479c4lV4mHhLHdjfPJ5x2EgSvxDAS8KVmJmjI6GClkwJTprt7L0XWHI0G@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/qxVxW1Nc1nkJsH0gyQzOXaDa2iA5dOXsD1BxtLvnVO4VYfEJ
 X/ITFN14PlNeZsPiK2im1h9McwItz3tP1IzammgIcbo3kPI0fs7S
X-Google-Smtp-Source: AGHT+IHcNU+ucBCkSRq9sRA5jDmhMoPbP9eCdmVwT7A5aCxRX32s1cRNWnQ5GXUoPvz7ueJoYdS17g==
X-Received: by 2002:a17:907:3fa4:b0:a93:d5d3:def6 with SMTP id
 a640c23a62f3a-a98f821ea56mr645715566b.19.1727971997234; 
 Thu, 03 Oct 2024 09:13:17 -0700 (PDT)
Received: from [192.168.1.17] (host-79-12-161-203.retail.telecomitalia.it.
 [79.12.161.203]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99103b314asm102382366b.103.2024.10.03.09.13.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 09:13:16 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 03 Oct 2024 18:13:00 +0200
Subject: [PATCH v8 11/12] drm/msm/a6xx: Enable preemption for tested a7xx
 targets
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241003-preemption-a750-t-v8-11-5c6cb9f256e0@gmail.com>
References: <20241003-preemption-a750-t-v8-0-5c6cb9f256e0@gmail.com>
In-Reply-To: <20241003-preemption-a750-t-v8-0-5c6cb9f256e0@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727971975; l=6216;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=p8dXQLzJR/jPRlo026VsvM4xjBwdjBGjnZtTLsi6I5U=;
 b=G6df5+75NylpuHekm/mwOE/ZF0IRDk6mgols9dNhlXQtjxK9TVajTFWNRoi56ynFAxGBMaTVo
 E6/9azpvOB6DmDOXFgpLzJJIEoGMbPiXUCP+XFf1EVek3hVO1OS4+NW
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

Add the "preemption_enabled" module parameter to override this.

Tested-by: Rob Clark <robdclark@gmail.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c  | 12 ++++++++----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  6 +++++-
 drivers/gpu/drm/msm/adreno/adreno_device.c |  4 ++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  1 +
 drivers/gpu/drm/msm/msm_submitqueue.c      |  6 +++++-
 5 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index e4d271fa89cc66f188be04206e267fabd83cca83..1c8b31627eb68bff406e70995838e418331449ef 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1204,7 +1204,8 @@ static const struct adreno_info a7xx_gpus[] = {
 		.gmem = SZ_2M,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
-			  ADRENO_QUIRK_HAS_HW_APRIV,
+			  ADRENO_QUIRK_HAS_HW_APRIV |
+			  ADRENO_QUIRK_PREEMPTION,
 		.init = a6xx_gpu_init,
 		.zapfw = "a730_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
@@ -1224,7 +1225,8 @@ static const struct adreno_info a7xx_gpus[] = {
 		.gmem = 3 * SZ_1M,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
-			  ADRENO_QUIRK_HAS_HW_APRIV,
+			  ADRENO_QUIRK_HAS_HW_APRIV |
+			  ADRENO_QUIRK_PREEMPTION,
 		.init = a6xx_gpu_init,
 		.zapfw = "a740_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
@@ -1245,7 +1247,8 @@ static const struct adreno_info a7xx_gpus[] = {
 		.gmem = 3 * SZ_1M,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
-			  ADRENO_QUIRK_HAS_HW_APRIV,
+			  ADRENO_QUIRK_HAS_HW_APRIV |
+			  ADRENO_QUIRK_PREEMPTION,
 		.init = a6xx_gpu_init,
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a740_hwcg,
@@ -1265,7 +1268,8 @@ static const struct adreno_info a7xx_gpus[] = {
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
index 2f7c93e74e097a78510700d2c6607d052cbdda66..dca9d011f09e741784ac6dc31b61841149acbae2 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2439,6 +2439,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	struct a6xx_gpu *a6xx_gpu;
 	struct adreno_gpu *adreno_gpu;
 	struct msm_gpu *gpu;
+	extern int enable_preemption;
 	bool is_a7xx;
 	int ret;
 
@@ -2477,7 +2478,10 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
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
index 2d8eef6c668b0da246edceba0c5d92041ea9a35b..30c6b949d0b197fea130c9b2b69c9362c1527737 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -56,6 +56,7 @@ enum adreno_family {
 #define ADRENO_QUIRK_LMLOADKILL_DISABLE		BIT(2)
 #define ADRENO_QUIRK_HAS_HW_APRIV		BIT(3)
 #define ADRENO_QUIRK_HAS_CACHED_COHERENT	BIT(4)
+#define ADRENO_QUIRK_PREEMPTION			BIT(5)
 
 /* Helper for formating the chip_id in the way that userspace tools like
  * crashdec expect.
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 9b3ffca3f3b471f509918edd4a2fdb0f80dfeb06..2fc3eaf81f4461990d48065f67bf5477787708e9 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -161,6 +161,8 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
 	struct msm_drm_private *priv = drm->dev_private;
 	struct msm_gpu_submitqueue *queue;
 	enum drm_sched_priority sched_prio;
+	extern int enable_preemption;
+	bool preemption_supported;
 	unsigned ring_nr;
 	int ret;
 
@@ -170,7 +172,9 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
 	if (!priv->gpu)
 		return -ENODEV;
 
-	if (flags & MSM_SUBMITQUEUE_ALLOW_PREEMPT && priv->gpu->nr_rings == 1)
+	preemption_supported = priv->gpu->nr_rings == 1 && enable_preemption != 0;
+
+	if (flags & MSM_SUBMITQUEUE_ALLOW_PREEMPT && preemption_supported)
 		return -EINVAL;
 
 	ret = msm_gpu_convert_priority(priv->gpu, prio, &ring_nr, &sched_prio);

-- 
2.46.1

