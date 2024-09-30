Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B9998A60E
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 15:53:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1834810E50F;
	Mon, 30 Sep 2024 13:53:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DdfKqTiW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD65E10E50E;
 Mon, 30 Sep 2024 13:53:00 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-5c896b9b4e0so1961611a12.3; 
 Mon, 30 Sep 2024 06:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727704379; x=1728309179; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=UcDFJwhFLvVfPmPv2/FHaJHKAbewBbg+EsVPbTO1gVo=;
 b=DdfKqTiWGRFNUY8r5j/fzqzv/TxLPj7bqIh2XfSRn4xOtLqM0EI60ldZscA+phPY4c
 QRRDyYJ20dZeGV5injz31mSDGvNTBBvOs9319zQQsuWWkTSnwCwG5jyW6Y3OjG/TOBqQ
 1elm8ebsLsYrZuxUsdCYpka+GYjsW11tkw4RZIFQkQASn0WR1LnUVGlIHD0G5ppUtkrn
 2N07VvMjhgTUeS02Ljyvq7DeuxQFOoJ3GEIBTfy1+/D7viVdyBUufoaXhc2QAFebG1h+
 sp3QA6r9FSub/qBphfd7hlKJUWxiErPnsrV1irdx3S4B8o1y1aOyOb81nke0JDP0u3U7
 0A1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727704379; x=1728309179;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UcDFJwhFLvVfPmPv2/FHaJHKAbewBbg+EsVPbTO1gVo=;
 b=StDhE769pomLKygBFKSv4VuPuCLYQWteOkf/NTJA6rLfG4GXvcnfIqbjB7YmoolJH6
 87pc631VNq7Ms6xtI6zmtn+xGmw2wTDH2T3iZF3PH43princrfKBrH60/pIuHwuZBKoM
 drQuATcWBA4W3nN4S7TLwiyKRoJV4vcN6CT0WVygVBF1Pv1EqbJ/5OPJULWRgvVmbbYA
 ZWF0iunpY1l+sdBoR4IHJMQBxd+D7ROvW118n+rhxeXQwOyan6u4sSfTanyw60Lskl4b
 EdtlF1kal9LbttV8WNxLYi7jt+pzczjvtRBc+1cCWFYDN/wx96qLdDoG2Wv7QHeoZsKw
 MdKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiLjNPVHc3hTVc144sYqkCw4/7qcUbKCwxeZ6b2/+X8n7LFvJo6k8NoI/jHtY5FInFyvSX82ioNdl2@lists.freedesktop.org,
 AJvYcCXSloPnOyJtsvxra7LCU6lDIYMKBVVzlxWWqYHw5elTFWb+3Ak0mNVTCvfnvKMM5Djeq44eBCYSNII=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyB3x/jRJWVwxPhtiKp7DU7dFVtRAYkusGX0s57IRxVDy/dSMs+
 SlFasv+P4H1y6lsvi6MG/RDIgoVdJd5dptLxVw70aofVd0X4lPgh
X-Google-Smtp-Source: AGHT+IH8gsPCkKHhKBantAB3eRoUCZP14jJljiol7upU63dcVQ1G+EI4dcRCELjVqPqc414+GDvqow==
X-Received: by 2002:a05:6402:520e:b0:5c8:8610:98b0 with SMTP id
 4fb4d7f45d1cf-5c886109966mr7775163a12.27.1727704379074; 
 Mon, 30 Sep 2024 06:52:59 -0700 (PDT)
Received: from [192.168.1.17] (host-95-250-55-22.retail.telecomitalia.it.
 [95.250.55.22]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88245ea57sm4507540a12.55.2024.09.30.06.52.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 06:52:58 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Mon, 30 Sep 2024 15:52:46 +0200
Subject: [PATCH v7 11/12] drm/msm/a6xx: Enable preemption for a750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-preemption-a750-t-v7-11-47803c7a5a64@gmail.com>
References: <20240930-preemption-a750-t-v7-0-47803c7a5a64@gmail.com>
In-Reply-To: <20240930-preemption-a750-t-v7-0-47803c7a5a64@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727704357; l=6298;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=v6B4qmUJBsuB41vVTIX8n9r0BxOexKUVJScDHt92rI8=;
 b=IU2tkVpM6i1rJVydvzIOhaHq4YWV4yREzGkTdNK9qBK2DBmHQq+nG/St5qwljs4dn9Z5c4kH/
 OmAx7svbP+UBYcjtvG66FXDUB4tVBOascpk7p8lyKPSad7O7mvpclxn
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

For now only on a750 as other targets require testing.

Add the "preemption_enabled" module parameter to override this for other
a7xx targets.

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

