Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9B59D2D34
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 18:57:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 296BE10E69F;
	Tue, 19 Nov 2024 17:56:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jOvsie5O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F2A610E35A
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 17:56:49 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4315df7b43fso11329485e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 09:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732039007; x=1732643807; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TvcxrBjE8Ya+6nKD+reAX7BzLkcovY8zpP7D9Dufu8s=;
 b=jOvsie5ODy6ORsBc0CKRnrcZmc5rCqsF+dhzesAqlE6PgLeS/lZkLy7g3QeFmL2cFe
 gqimcrYLbxw+oDM7wSzG4GDLqGm8scB5eq7Ol0zqwIpm5reSXPdo6uDScPgq8+HrQaqt
 zMCS65c1dxB9WuAbQ1/y3+H3hOW2jp3CRdyGMfnTXVnA72t4jrg2YI8AW8cXpGJ3hImk
 IIEppSpBWCVlu6UvxYSk+5FyL6i/8jeqHTsqTWBBDcxF2jQ7jtTkVLJPavJP7rHiF0gC
 7EcUMlBHNIyZZ7aRNbJwQE690jXUwdZWnmQC1oTe4+ewO3SHh2K6160CUq5LwS2MiLJ+
 2x0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732039007; x=1732643807;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TvcxrBjE8Ya+6nKD+reAX7BzLkcovY8zpP7D9Dufu8s=;
 b=HioKT4pTbeAkKBWksQb/mb9mV+R6ydb06L/KjitKt5usUIaK18ebsN89H2ENxM1mjc
 ni8/nLHl1PIeszztB8DGreqjAVKRK6Z/cgtwURIcmDiTyayaSLUKthq9eeP+UY4b19QM
 NJA/XIkODQY3QQgKBi+tOr2IaNrKgmmSewOlVdkf/Z9SEKBbucVCZolkW0rN16ZyuzBo
 R5vWZ6CeU7wgok6+CU5wcHJCE2+BrGcMEj618dAF/VXPnvpXzCjb4H67DuhIykGUC6gA
 U8UNzUPLKMfvEmw87eMn4NWjMvy4orW6MPfP3U7bkgGoz+fo+PDCjv5n0S4S+FUymS8r
 GBVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJvFE5vhZDQ9/eEM9kNwZB29Jqigv1ZW8DVD1RKWb3oyP9iuLmS2YByMH0xXdD7VSdCVBmtvUhWM4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxum/qaQacmtfWIZW1hy08xWVlb1jENbvpS7HCppYOyMlcnIeJu
 UQ7f4CIq+fJVr0TzCh5Pw6Nqef4htnxARCleUfGGXtTeRevLR0xcqkkeB8KgauA=
X-Google-Smtp-Source: AGHT+IGJ6SMbLsuvIbUQvyMjL/mTN4J7c8RlBSzGTWfBeFIThfOc4xtQI8YH+x4EjBiCjt9kcGEbSg==
X-Received: by 2002:a05:600c:3508:b0:42c:b750:1a1e with SMTP id
 5b1f17b1804b1-432df67959dmr153185785e9.0.1732039007389; 
 Tue, 19 Nov 2024 09:56:47 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432da27fe68sm208302275e9.24.2024.11.19.09.56.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 09:56:47 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 19 Nov 2024 18:56:37 +0100
Subject: [PATCH v2 02/11] drm/msm: adreno: rename quirks that are features
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241119-topic-sm8x50-gpu-bw-vote-v2-2-4deb87be2498@linaro.org>
References: <20241119-topic-sm8x50-gpu-bw-vote-v2-0-4deb87be2498@linaro.org>
In-Reply-To: <20241119-topic-sm8x50-gpu-bw-vote-v2-0-4deb87be2498@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Connor Abbott <cwabbott0@gmail.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10146;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=I07ngYL9Ra1f9h+CP4yA7pd1FaT3h7r+nDReMCfjPD8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnPNFXvsfG19CuOcSshzsLLrl9P5JiCVdB6NQYWhe+
 leGk+k2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZzzRVwAKCRB33NvayMhJ0aqAD/
 9BdW9LZzIoIYl35jeVi9cqCgNGXipLp/slLxcES64BRqOg55WgP8C+mC9AQY0K2p40Vh9Km2z9+QXA
 FonK8lkCmQXlP8i+4UWolxNN5NeQ0TXbzWqovX6t3o26ubGTzeciItmtaR99LfzgRTNVp6EmpUUFME
 BYXQRayCUWbyjQfpS62gs+vxwc0AdTaBe18Eh/rfbowEmWxH25J9Btc/LrVIubMwDHtqAz+REGSKui
 bQG7Gv4+Z2w7m8v35UYqWAqJ7bTl8tFTKYZvo0tGCW7lKu1CZji0ZrIAyzTBhrsZljUUzRpCaAqxCA
 tSGA3yTLPI8U2MdzektRPFBSEfQU/TlTwSNdFhxdNTAacs1HCHpXnSXATf38I2HsT4OR8f9zynEg/n
 PZqJ67Lv+iOnZx3ESzZ6ublhomHwSM3zL/Nua3WhLwh7S8jABMdjsAJueh7DuQu1ngJPkiqvBZPDUk
 aVwH27cPcNRTGmDdMefC5vJGwmcI39uedMVCyJ2TeO3ZA7tENg1xvJgn2anAM5rCSzQx2gKlMNGpnI
 gFqPqxsD5SzgmFhy397X7jvBeEGSTxdQqGrxyQDGa+YfhDY0OwsvX3dvvGIf8zaLTPPvYf3RgV1NfY
 rKhaYudkqE+JEI+cQm8DQ5SvLjRBeJWr7QeNLTowDyOSKUUOpJLrSGER9tew==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

Half of the current "Quirks" are in fact features, so rename
the defines with FEAT instead of QUIRK.

They will be moved in a separate bitfield in a second time.

No functional changes.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c  | 62 +++++++++++++++---------------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  4 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  7 ++--
 4 files changed, 38 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 0c560e84ad5a53bb4e8a49ba4e153ce9cf33f7ae..825c820def315968d508973c8ae40c7c7b646569 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -743,7 +743,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		},
 		.gmem = SZ_512K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
+		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT,
 		.init = a6xx_gpu_init,
 		.zapfw = "a615_zap.mbn",
 		.a6xx = &(const struct a6xx_info) {
@@ -769,7 +769,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		},
 		.gmem = SZ_512K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
+		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT,
 		.init = a6xx_gpu_init,
 		.a6xx = &(const struct a6xx_info) {
 			.protect = &a630_protect,
@@ -839,7 +839,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		},
 		.gmem = SZ_512K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
+		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT,
 		.init = a6xx_gpu_init,
 		.zapfw = "a615_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
@@ -864,8 +864,8 @@ static const struct adreno_info a6xx_gpus[] = {
 		},
 		.gmem = SZ_512K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
-			  ADRENO_QUIRK_HAS_HW_APRIV,
+		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT |
+			  ADRENO_FEAT_HAS_HW_APRIV,
 		.init = a6xx_gpu_init,
 		.zapfw = "a620_zap.mbn",
 		.a6xx = &(const struct a6xx_info) {
@@ -892,7 +892,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		},
 		.gmem = SZ_1M,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
+		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT,
 		.init = a6xx_gpu_init,
 		.zapfw = "a630_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
@@ -911,7 +911,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		},
 		.gmem = SZ_1M,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
+		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT,
 		.init = a6xx_gpu_init,
 		.zapfw = "a640_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
@@ -934,8 +934,8 @@ static const struct adreno_info a6xx_gpus[] = {
 		},
 		.gmem = SZ_1M + SZ_128K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
-			ADRENO_QUIRK_HAS_HW_APRIV,
+		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT |
+			ADRENO_FEAT_HAS_HW_APRIV,
 		.init = a6xx_gpu_init,
 		.zapfw = "a650_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
@@ -961,8 +961,8 @@ static const struct adreno_info a6xx_gpus[] = {
 		},
 		.gmem = SZ_1M + SZ_512K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
-			ADRENO_QUIRK_HAS_HW_APRIV,
+		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT |
+			ADRENO_FEAT_HAS_HW_APRIV,
 		.init = a6xx_gpu_init,
 		.zapfw = "a660_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
@@ -981,8 +981,8 @@ static const struct adreno_info a6xx_gpus[] = {
 		},
 		.gmem = SZ_1M + SZ_512K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
-			ADRENO_QUIRK_HAS_HW_APRIV,
+		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT |
+			ADRENO_FEAT_HAS_HW_APRIV,
 		.init = a6xx_gpu_init,
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a690_hwcg,
@@ -1000,8 +1000,8 @@ static const struct adreno_info a6xx_gpus[] = {
 		},
 		.gmem = SZ_512K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
-			ADRENO_QUIRK_HAS_HW_APRIV,
+		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT |
+			ADRENO_FEAT_HAS_HW_APRIV,
 		.init = a6xx_gpu_init,
 		.zapfw = "a660_zap.mbn",
 		.a6xx = &(const struct a6xx_info) {
@@ -1028,7 +1028,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		},
 		.gmem = SZ_2M,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
+		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT,
 		.init = a6xx_gpu_init,
 		.zapfw = "a640_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
@@ -1046,8 +1046,8 @@ static const struct adreno_info a6xx_gpus[] = {
 		},
 		.gmem = SZ_4M,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
-			ADRENO_QUIRK_HAS_HW_APRIV,
+		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT |
+			ADRENO_FEAT_HAS_HW_APRIV,
 		.init = a6xx_gpu_init,
 		.zapfw = "a690_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
@@ -1331,7 +1331,7 @@ static const struct adreno_info a7xx_gpus[] = {
 		},
 		.gmem = SZ_128K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
+		.quirks = ADRENO_FEAT_HAS_HW_APRIV,
 		.init = a6xx_gpu_init,
 		.zapfw = "a702_zap.mbn",
 		.a6xx = &(const struct a6xx_info) {
@@ -1355,9 +1355,9 @@ static const struct adreno_info a7xx_gpus[] = {
 		},
 		.gmem = SZ_2M,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
-			  ADRENO_QUIRK_HAS_HW_APRIV |
-			  ADRENO_QUIRK_PREEMPTION,
+		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT |
+			  ADRENO_FEAT_HAS_HW_APRIV |
+			  ADRENO_FEAT_PREEMPTION,
 		.init = a6xx_gpu_init,
 		.zapfw = "a730_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
@@ -1377,9 +1377,9 @@ static const struct adreno_info a7xx_gpus[] = {
 		},
 		.gmem = 3 * SZ_1M,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
-			  ADRENO_QUIRK_HAS_HW_APRIV |
-			  ADRENO_QUIRK_PREEMPTION,
+		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT |
+			  ADRENO_FEAT_HAS_HW_APRIV |
+			  ADRENO_FEAT_PREEMPTION,
 		.init = a6xx_gpu_init,
 		.zapfw = "a740_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
@@ -1400,9 +1400,9 @@ static const struct adreno_info a7xx_gpus[] = {
 		},
 		.gmem = 3 * SZ_1M,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
-			  ADRENO_QUIRK_HAS_HW_APRIV |
-			  ADRENO_QUIRK_PREEMPTION,
+		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT |
+			  ADRENO_FEAT_HAS_HW_APRIV |
+			  ADRENO_FEAT_PREEMPTION,
 		.init = a6xx_gpu_init,
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a740_hwcg,
@@ -1422,9 +1422,9 @@ static const struct adreno_info a7xx_gpus[] = {
 		},
 		.gmem = 3 * SZ_1M,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
-			  ADRENO_QUIRK_HAS_HW_APRIV |
-			  ADRENO_QUIRK_PREEMPTION,
+		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT |
+			  ADRENO_FEAT_HAS_HW_APRIV |
+			  ADRENO_FEAT_PREEMPTION,
 		.init = a6xx_gpu_init,
 		.zapfw = "gen70900_zap.mbn",
 		.a6xx = &(const struct a6xx_info) {
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 019610341df1506c89f44e86b8d1deeb27d61857..2ebd3fac212576a1507e0b6afe2560cd0408dd89 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2478,7 +2478,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	adreno_gpu->gmu_is_wrapper = of_device_is_compatible(node, "qcom,adreno-gmu-wrapper");
 
 	adreno_gpu->base.hw_apriv =
-		!!(config->info->quirks & ADRENO_QUIRK_HAS_HW_APRIV);
+		!!(config->info->quirks & ADRENO_FEAT_HAS_HW_APRIV);
 
 	/* gpu->info only gets assigned in adreno_gpu_init() */
 	is_a7xx = config->info->family == ADRENO_7XX_GEN1 ||
@@ -2495,7 +2495,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	}
 
 	if ((enable_preemption == 1) || (enable_preemption == -1 &&
-	    (config->info->quirks & ADRENO_QUIRK_PREEMPTION)))
+	    (config->info->quirks & ADRENO_FEAT_PREEMPTION)))
 		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_a7xx, 4);
 	else if (is_a7xx)
 		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_a7xx, 1);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 9ffe91920fbfb4841b28aabec9fbde94539fdd83..09d4569f77528c2a20cabc814668c4c930dd07f1 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -207,7 +207,7 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 
 	priv->is_a2xx = info->family < ADRENO_3XX;
 	priv->has_cached_coherent =
-		!!(info->quirks & ADRENO_QUIRK_HAS_CACHED_COHERENT);
+		!!(info->quirks & ADRENO_FEAT_HAS_CACHED_COHERENT);
 
 	gpu = info->init(drm);
 	if (IS_ERR(gpu)) {
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index e71f420f8b3a8e6cfc52dd1c4d5a63ef3704a07f..8782c25e8a393ec7d9dc23ad450908d039bd08c5 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -54,9 +54,10 @@ enum adreno_family {
 #define ADRENO_QUIRK_TWO_PASS_USE_WFI		BIT(0)
 #define ADRENO_QUIRK_FAULT_DETECT_MASK		BIT(1)
 #define ADRENO_QUIRK_LMLOADKILL_DISABLE		BIT(2)
-#define ADRENO_QUIRK_HAS_HW_APRIV		BIT(3)
-#define ADRENO_QUIRK_HAS_CACHED_COHERENT	BIT(4)
-#define ADRENO_QUIRK_PREEMPTION			BIT(5)
+
+#define ADRENO_FEAT_HAS_HW_APRIV		BIT(3)
+#define ADRENO_FEAT_HAS_CACHED_COHERENT		BIT(4)
+#define ADRENO_FEAT_PREEMPTION			BIT(5)
 
 /* Helper for formating the chip_id in the way that userspace tools like
  * crashdec expect.

-- 
2.34.1

