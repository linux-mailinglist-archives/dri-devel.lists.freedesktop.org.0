Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9FC91366B
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 00:02:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F03F10EDE5;
	Sat, 22 Jun 2024 22:02:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JcYZ2le0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E8E10EDEC
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2024 22:02:24 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2ec58040f39so4840421fa.2
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2024 15:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719093743; x=1719698543; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=M7hDmykrt2ZsXc+hmL2IVvYAewI1x1XZlh8sOCSDu6Q=;
 b=JcYZ2le0fiZuawd+vyCmtP27X3sOglRySi1fXEpyMuLWmG1zecL0Ra+CggH1IeNpu/
 Z4IoKG1f64arAOcVTip5zxzdzxRhJucjXnVdDseg2N+S7RNz4RqdByv3GIJSwxR8N5Fy
 MUppdu+wCrH/k5GNNVRcyVQCpXUUfm/V/NbLtO9WnCpAIDh/g1KLWNUmtKqcyL3kreuA
 xMYHk4qHvi7IkMMTekPi5y3/rt0BYh9AjnDFGRNtHyi/BvWO5+1J3pFIjZ+vgzq1uR6U
 5IIR0k2VC4sV2cBX1rr16KWcdNkE4uXfY+XUtl8aDiyLkXaC+tvRC2HUg7Ij7sTwCcux
 Vhnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719093743; x=1719698543;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M7hDmykrt2ZsXc+hmL2IVvYAewI1x1XZlh8sOCSDu6Q=;
 b=fEYAC5gi2P7LzF4F3oG20scwkvyQpcP5UOxAXaTt5zUpBgkeYGsuAuR15ry8xwIf2L
 k2ctYl+vyLmJXKdh5mgnl2Q8Z4X0oLup0tfIFZ/FCTQwVdyBwDvNk2eGeSA4VTyoEsDL
 qKxduusBwaI3o2nhquAp4g78NwO9OOvQUAfsGLZ7LYWHJOefTIbMh4ITqWl/knNd+I7/
 VD3tzMPpp3BINOuOuju9F+tL7g3YrHGHzEeYRsCUHnJYWLlLCb2sS/3rnyZ7xgyk8meH
 UnICCWo84yI1OuuOMewPC45LJT+TPb/nD7U6bM/+6wCJ/E1Sjc0WHZvdDAo0F46+yrsw
 6ydw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVb+AUNBkZrEHpVTn3y/GmBlbjz2MAM4L9GWka4eMW9pIZLd3eiMMtBoprbFTPvs2B35UgmuMP74OfEdvmoqmisIq/YT88m4jXYQ8wLSxXx
X-Gm-Message-State: AOJu0YyN7Eu0GWsP/RFQX/8mnWDMAP245N6oo1Gb28hP+KFYirPWi3x3
 1xw6PPPaen7Qi+dD5GniDM60TRfyrY6t3TYQO1YFO+TVBHpieBrsNPMfPEXEucE=
X-Google-Smtp-Source: AGHT+IGMDkcXd01ktZF/S0kaLc34zRhGg164j2CXXcedc1M4wVD1mpuhAD7z+e5dXh/RK99uNWUzOw==
X-Received: by 2002:a2e:9209:0:b0:2eb:ea62:179c with SMTP id
 38308e7fff4ca-2ec59587b4amr7367111fa.53.1719093743010; 
 Sat, 22 Jun 2024 15:02:23 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec55e56ea5sm2502051fa.112.2024.06.22.15.02.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jun 2024 15:02:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 23 Jun 2024 01:02:19 +0300
Subject: [PATCH v3 06/13] drm/msm/hdmi: switch to pm_runtime_resume_and_get()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240623-fd-hdmi-hpd-v3-6-8645a64cbd63@linaro.org>
References: <20240623-fd-hdmi-hpd-v3-0-8645a64cbd63@linaro.org>
In-Reply-To: <20240623-fd-hdmi-hpd-v3-0-8645a64cbd63@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2669;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Cbv9GuAgvf3OlG8nZVtZC4tgrmDTjBkPfIcahMH6TZ0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmd0noKRQoEnzMVJt0pHda4tP7PkcR9J2EWmuxU
 2N0uAYXiwSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZndJ6AAKCRCLPIo+Aiko
 1VLTB/481ZB16vlXyVjafhAnp+jfETZwyHPWvh3Z1uJqQp33jr1iO2n9vmJ5zesmI/DQaDk285k
 QhoEVabTrrqwRU025RkUDlogx2AOpRWEwvQ/Adu/xhFP9oV74Ru9X9oOWoCiwiMQokV8t3VT6EB
 JaYIepgYGTSYYokeafI0VmiGpWMte3mKP3AKMA8dwtpiRdy/85jlA31nh2zvPkUVRc/mVLOb2P6
 4kcdD07qiOc2NMezmwhwVxrPcjG/Q74N3QRZXOuk6kDjhIAZon0ppyiv7HEEd1Ti/8yBib8vWbi
 2bEPi+DWYiawy45L90ETwVjmswoCeBQxvJGEV/AICLtfDIII
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
index f1790dedf451..34085fd9739b 100644
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
index 36266aa626dc..fc21ad3b01dc 100644
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
 	uint32_t hpd_int_status = 0;
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
index 88a3423b7f24..d5acae752300 100644
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
2.39.2

