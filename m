Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 609D896DC7E
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 16:51:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30A0110E8ED;
	Thu,  5 Sep 2024 14:51:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bo8M8kd2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EDEC10E8EC;
 Thu,  5 Sep 2024 14:51:43 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-53568ffc525so1173855e87.0; 
 Thu, 05 Sep 2024 07:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725547901; x=1726152701; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=AqntLGjYPor0NbgJDgNk1OXPGF33LiTpH6N+ESpdJz4=;
 b=bo8M8kd2OmQd6iQ5W1CuD0mUgMwOydRacClwNTeQBA8184ttX+1q8H8oseVgFMdzBw
 0rQTiqMr8264sVdLU5DONIla0NEnC2AF20WyIPDzq/EBkjkY15s/FLB/DtKLTAaa7aRL
 PZb4A8A/GHejxSlfDrIyjjM5ztn7fZiPkLPXxvzUOibD2Ll6IErdXjSs+ggnIUrxbgw2
 bctVpfRd0+ub5R378GhtkrSGb/4yGCSIsgTwljQPN9vReIJWQdGlDaU850MSWtIyjooV
 sqgshH2Dx6tOvxCdsTqyHbdbfwXGkTqAG5Y1zZNqEc3rvdYCGT6vFqbzXKjxOHaaczOR
 BWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725547901; x=1726152701;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AqntLGjYPor0NbgJDgNk1OXPGF33LiTpH6N+ESpdJz4=;
 b=nw5eji2+s713uS52DL/IsM4IOkAEyj2sboOnNSiMsB6ZyV5AykS8lJylNd+ux6mk8T
 4OL+A8I17jDS1U3sur1+tLJVF3atCRLxoZw9SNwRDHEhWZgG+OAu7tw1h4tGk4HSP4j4
 Tr21bHmpT25jduuxN12Fe8ybQzwDM2wzBxRijt4s3OAk22wMx3TgYXMMAsaDomPn1XoF
 ZZW2K5Dia/Qx4UjdlFO/hwbqmCDUPLSXoWn9WofgQVEsLJ+5ajm8ItHS7GwEVoABSW9c
 JNMx4gL6nHwbVBW4xgn2bE2HEveIrPLJVStCM24wFu021BKN7Hlwe/ZAqf0nLpPXKV+E
 1jMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2S2mPde00Yawfqon8os67aqJR5Rv4rUXP14VAGYQwn4m/GT5p3rJvB+xjjLUlz+aWLRTvhcx49co=@lists.freedesktop.org,
 AJvYcCXxavdg8fkk0VCuVE6WB5/x32wPi/L60dQiB5y/mMlQIdlllbVHctd1iALqmiBKDQoMmkSEMWw1gODC@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+DBbmZ9MQFcLKnOXe4+QBJHbORsoNGsSGe3M1yoIsL+iUoWK/
 dpnDO7b0N8XeZH+dxyNDWgUMmtyEx7pk8a3GOv8L6oydNi0X9UI8
X-Google-Smtp-Source: AGHT+IGuqlfnbvJEmdMPKEjrYPueG0gM/sgbEhcDtNsaxXjtL2F4Gjq53ZKSKFnr8EzM0tSP05A/IA==
X-Received: by 2002:a05:6512:ea1:b0:52e:9c69:b25b with SMTP id
 2adb3069b0e04-53546b2a85fmr13786261e87.28.1725547901198; 
 Thu, 05 Sep 2024 07:51:41 -0700 (PDT)
Received: from [192.168.1.17] (host-87-16-167-153.retail.telecomitalia.it.
 [87.16.167.153]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3cc52b376sm1320732a12.7.2024.09.05.07.51.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 07:51:40 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 05 Sep 2024 16:51:27 +0200
Subject: [PATCH v3 09/10] drm/msm/A6xx: Enable preemption for A750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-preemption-a750-t-v3-9-fd947699f7bc@gmail.com>
References: <20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com>
In-Reply-To: <20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com>
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
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725547882; l=3440;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=XcMZAmkU4knaQLdm3eWeeDEi3HiarURn/gAJXIVtoOk=;
 b=30Jegu5hUWliIXJrIkrDfYMpCrnjH799i8f13v/kXPtYWQx4tC6ag61QW8gHtR+CkiEDHIFWR
 JIy1UIJt3/SA9N+bFLKChlaPffBDX//+W+uCx1fV3wdVDQz5g3Xb8DC
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

Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 3 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 6 +++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 1 +
 drivers/gpu/drm/msm/msm_drv.c             | 4 ++++
 4 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 316f23ca9167..0e3041b29419 100644
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
index 512ff443bd2e..8b4fa17f6003 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2547,6 +2547,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	struct a6xx_gpu *a6xx_gpu;
 	struct adreno_gpu *adreno_gpu;
 	struct msm_gpu *gpu;
+	extern int enable_preemption;
 	bool is_a7xx;
 	int ret;
 
@@ -2585,7 +2586,10 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
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
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 87098567483b..d1cd53f05de6 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -56,6 +56,7 @@ enum adreno_family {
 #define ADRENO_QUIRK_LMLOADKILL_DISABLE		BIT(2)
 #define ADRENO_QUIRK_HAS_HW_APRIV		BIT(3)
 #define ADRENO_QUIRK_HAS_CACHED_COHERENT	BIT(4)
+#define ADRENO_QUIRK_PREEMPTION			BIT(5)
 
 /* Helper for formating the chip_id in the way that userspace tools like
  * crashdec expect.
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 9c33f4e3f822..7c64b20f5e3b 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -58,6 +58,10 @@ static bool modeset = true;
 MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=on (default), 0=disable)");
 module_param(modeset, bool, 0600);
 
+int enable_preemption = -1;
+MODULE_PARM_DESC(enable_preemption, "Enable preemption (A7xx only) (1=on , 0=disable, -1=auto (default))");
+module_param(enable_preemption, int, 0600);
+
 #ifdef CONFIG_FAULT_INJECTION
 DECLARE_FAULT_ATTR(fail_gem_alloc);
 DECLARE_FAULT_ATTR(fail_gem_iova);

-- 
2.46.0

