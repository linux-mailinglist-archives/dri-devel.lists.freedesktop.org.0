Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D0BA2DAF2
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 06:07:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 116F110E471;
	Sun,  9 Feb 2025 05:07:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vXmAC31S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C41010E471
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 05:07:06 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5401e6efffcso3399520e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 21:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739077625; x=1739682425; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=R0fvdO4R1nURbqAvtpU5cS7Y2T0kdgB8Gv4vtNNxca0=;
 b=vXmAC31SL+C0PpRceIjFBlKOR6NC2UR/3K14AQQr20MyUH5PA+5iAqRqm6bDHjXwww
 oz4h0jBJH9IMJyE/0+TWnnhB+J+oO546S6R1XeaFCpfqOfvgCoo1CEvuwTepNQTwbGKo
 +Gt7LQR/6SzZOgKu7cKEx4PIhb7UjJMoER/3taQFK/8Dat8Iog4jRo42heUh9Si3dOfI
 PEGiGhoaNXbamU6BlcYs67duUHF9PI3qjxqxvf+MdV7n2b3LDWPL1QyYH4McRqrS3Ssc
 D4uWMkSpuHm5EA5JSr8Qjelz+tDgMHNzY4ViQC3U05gRxrChm/WedQ0WJ0BxIQ4mgRLo
 wGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739077625; x=1739682425;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R0fvdO4R1nURbqAvtpU5cS7Y2T0kdgB8Gv4vtNNxca0=;
 b=lov23wr8xbAC8MrbvMduyP68ppw/YZxnunczIPOljHj0MRvi7z/qkW2POC6N+5CmvK
 xRaiTYmvgAa66mZoFQA+jivYRaez+h7AJFoS3i17j0zNrS6rslw6szE5Onlz2p2a89S0
 WeLo3vCMmJjBE0VggE1H6PmaO27kfnSv2dW7hXENMmSSVAN7YavfGCsNTKG2QvBWpgGm
 aPB/9RWbsly+xYqtEqHO3rxkv1qzuAbOF70/vlWTHqmVzwSQcbgw14L1OQr+Ndl1znOi
 EiYYnH+u+YA6OUgHgPJ65/3GLZsgSlHM59jWjEip7sVFWrMEVFvH6xD+ryZP3X9RqQCd
 Tuag==
X-Forwarded-Encrypted: i=1;
 AJvYcCUglc9m9xNxEf++15d6Efx2A2kwz7rRwodDbm2IKmRcu9v48FjLR6ogernQv8UBRO8E5Q7e/IjLbEM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8992xNIOuKEejMWPUA9PvFHP88FF6aqGOjXn75THDpaVXpf4v
 c537uNFBjk5IuA7omxakpz6qDNffKtURou7Fll5FHszu+5UY0g0noIDqidnggsE=
X-Gm-Gg: ASbGncsPsmFE+AyR4qbDa5OTh9dh/Mg7rfJTzm10x9Jm83ZtZwlkC0n/nHbZ6uRU0ZQ
 SmaboEsJ5zG9Cx3WJ6vJGcTaGpOFMlGxUqXSPzZWT2gJVZHPY0RyFoktYrqVAo/One1UJws7f8I
 AIef+SdSLbeMNzD9sQ3ZD/QGNF7Y5C8/AaHjU9B6+x3xrgN+/1ot2Zp4oeLghoUkgRW6JCrirAR
 E1w7/Cb+j4KJPeX4kcUX4K7FNUapVH3dHfbnTUzYvVKPcwTJGZG4w+gEfCfMFBnq+sdyd8KIJ5u
 +3PwsoJ50tOmwQ85DA2LvdE=
X-Google-Smtp-Source: AGHT+IHvHK9pE/lJ1sbvSikM6yxevJJhOW+toCBmWw7PDK+wzGYcNkAt2K57E9sTUMAV9Ze/PJqhag==
X-Received: by 2002:a05:6512:2821:b0:545:6a2:e52 with SMTP id
 2adb3069b0e04-54506a20ff4mr841140e87.13.1739077624656; 
 Sat, 08 Feb 2025 21:07:04 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54506ef1733sm245576e87.1.2025.02.08.21.07.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 21:07:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 09 Feb 2025 07:04:52 +0200
Subject: [PATCH v4 08/16] drm/msm/hdmi: switch to pm_runtime_resume_and_get()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-fd-hdmi-hpd-v4-8-6224568ed87f@linaro.org>
References: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
In-Reply-To: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2832;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=8ggrOHMoONGuV72hshgJDWyRmMWrabWT+tktxkICLQM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqDfibvp8G2Mg6U4kntY4TDix+sHhUGkYjpmgS
 NNb+V0lzKmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6g34gAKCRCLPIo+Aiko
 1ZOuCACuIdGuV1z9z9UzxMNBCcGvD/1jN1gxNpsw6zo3qtvGjKRkgE29wRh+70PdHygdsSuJJND
 MQki8GKKIOtm2TMfh+6qLFk75iGLCdaFZeZxBXNCF7DXEBgAgtcHrGCRf8V59wZBCedv3aG+Fjv
 cXg7zqX6S7kZCGzN1etDHpsvbm9+otPbTE3VJ6zkIpDpBw7N1ufN+sm3I2juhcTvXxEDP1hmjxx
 o9YPIO/P3wB5ewBaRYJco7WQme9QVlQs3/YzNlYGghVOo21A0xb0tA9h+FqcQDj+rB+MVHq7t+U
 jSh9lS5oE/Md0BKq6r34Tr65Q/5WqHuA8FJ7DSqmCc1TROtB
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The pm_runtime_get_sync() function is a bad choise for runtime power
management. Switch HDMI driver to pm_runtime_resume_and_get() and add
proper error handling, while we are at it.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c |  2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    | 12 ++++++++++--
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c    |  6 +++++-
 3 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 6c5bbd772700b0362f884a737598d7bf419adf9b..d7d5d3755fb853377aa999e2a830debf54afe984 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -21,7 +21,7 @@ static void msm_hdmi_power_on(struct drm_bridge *bridge)
 	const struct hdmi_platform_config *config = hdmi->config;
 	int ret;
 
-	pm_runtime_get_sync(&hdmi->pdev->dev);
+	pm_runtime_resume_and_get(&hdmi->pdev->dev);
 
 	ret = regulator_bulk_enable(config->pwr_reg_cnt, hdmi->pwr_regs);
 	if (ret)
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index e253c1408dd1c6dcd7e94506f0b8edcfd4a9a159..d77c68914c5f525cf12971c1058b1abc33792b24 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
@@ -85,7 +85,12 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 	if (hdmi->hpd_gpiod)
 		gpiod_set_value_cansleep(hdmi->hpd_gpiod, 1);
 
-	pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "runtime resume failed: %d\n", ret);
+		goto fail;
+	}
+
 	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
 	if (ret)
 		goto fail;
@@ -178,7 +183,10 @@ static enum drm_connector_status detect_reg(struct hdmi *hdmi)
 	u32 hpd_int_status = 0;
 	int ret;
 
-	pm_runtime_get_sync(&hdmi->pdev->dev);
+	ret = pm_runtime_resume_and_get(&hdmi->pdev->dev);
+	if (ret)
+		goto out;
+
 	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
 	if (ret)
 		goto out;
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
index 03120c54ced686dcd2ddfe809dd9c9011f608235..667573f1db7c6bfef6c75828b5c581c147a86d0d 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
@@ -58,7 +58,11 @@ int msm_hdmi_phy_resource_enable(struct hdmi_phy *phy)
 	struct device *dev = &phy->pdev->dev;
 	int i, ret = 0;
 
-	pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "runtime resume failed: %d\n", ret);
+		return ret;
+	}
 
 	ret = regulator_bulk_enable(cfg->num_regs, phy->regs);
 	if (ret) {

-- 
2.39.5

