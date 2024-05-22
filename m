Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF43C8CBF9E
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 12:51:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAE5F10F4D5;
	Wed, 22 May 2024 10:51:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yJj4nTN9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A8F10F4C0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 10:51:05 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-52232d0e5ceso6479848e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 03:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716375063; x=1716979863; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IAmphMNQpXqW8eT1O41Bu5TdohycNUyawz5wYr1vHd8=;
 b=yJj4nTN9s/Kd50GyoM6k+4pXBIpLouT/fDfFCOu/LwbUw84FBUulMJ43/5ynebEbFM
 Ojb8oVhezr3IowsD/cfkHWIgc83SalTzqRaNV+JFRQkDOzKTtCclt/jWTr4EpncibnH/
 8EENdtOjyioiROS2AkC6KBxbpgd/k28Iu5rxcncPnwLmURRh5JBLxQ/V8p+Qg96AsCeW
 pfh+xto0Mme2w1LvtBKIdAm7yF4b/RXWkh4GK0CDmoHRIKWM+QmWzSNuKSp9QH4mTL+a
 aoU3Ippc6e/p/LAXily0SQbULEeoPoD/Hsn44a9BKqqS6BltmD+hpbQFOq754D3dpk9+
 AaMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716375063; x=1716979863;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IAmphMNQpXqW8eT1O41Bu5TdohycNUyawz5wYr1vHd8=;
 b=NlaBortSSpndFQYpT397nnN5NLoZq8a7cmzCArIITTl3NsdQFfS28CIsQlgIwrk+MI
 fCPMrP/ix66np5uOPhed34InIHAMHbyJSZjDMdfWBVUDXcS4+jJ1SDaLEkWaie/6FWGa
 3hCY8rom05O6MurGEoMm1nZ+KcCaiOEMyABMI/yfMEiBRAp1TZL50bJQgm3e/ktQlVZW
 WFpiNXQP8R4Tj8vZEpcqCcdijAI1yfhLeW2mZNwPMJWfCQ9LRIJkYwhHtuqm5N3FNcdR
 O8TfJFkUtWiwvV9pyI7Smmdu4mwqAjxU3G1Y7/+owko2YA2PErt3zpMxfQwfX2NgrUZx
 /p8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWOs+EHP7RFO7TJphY34EGFcKzy0+2cS7cH+9cW0FjzIOvN9N85lc45UA5imNlmpnbfUOuxE4eEArq+v9KD53/MxjVHtGM4YLW8wWnxvA6
X-Gm-Message-State: AOJu0Yz/jV7v35kA848UPCWGn6wnE7ZcjX0V8YrnT1lx4MOurMEeQ1U+
 IIDUQu9peeyCgGPSDLCY3t7UjzAHXywHwCty67xLzjOVVGpSOAOmgW5IZRuOXvM=
X-Google-Smtp-Source: AGHT+IFvKJh7JOYXQJKM2qi5VIh0iYd/BGRN6yDP29LSOK7OX2zXaEKTsibdu8B9a2dC6ZHLhKrCjQ==
X-Received: by 2002:a19:6a09:0:b0:51d:5f0b:816f with SMTP id
 2adb3069b0e04-526bf35c690mr832319e87.15.1716375063679; 
 Wed, 22 May 2024 03:51:03 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52431778ec8sm1279126e87.194.2024.05.22.03.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 03:51:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 May 2024 13:50:59 +0300
Subject: [PATCH v2 07/14] drm/msm/hdmi: switch to pm_runtime_resume_and_get()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240522-fd-hdmi-hpd-v2-7-c30bdb7c5c7e@linaro.org>
References: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
In-Reply-To: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2613;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=rVRKl0jVYPeqcqz91TQ881Equ4F+ZgpwdiZXFz89P0g=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmTc4QmHQVBTWzpD8Jbi0KRzPokGAEgSr3P4vPX
 6mb04s1+KiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZk3OEAAKCRCLPIo+Aiko
 1fSQCACsc4K3scUWB77PU9aHBfrcHuUnWfl6JI/ujLNtLgxLO3Gc1GO2QfCPmY0NwhqA29kIB18
 vJ21o26KCmZINsMjIV/y7yFwUEX+oa4+2d39ZLu/s1YkR1wasrTckdY0sPYebJxxkNc9JAjaO0p
 ofgIEbCuajfb1AJFLf+ygf9ALiPRqLlVVM3rWvN/sxeHKiahb+TE4NbHaUzdTCas5RCFj5rDVQj
 QQz2mdlVfmrp82eJwicfGToeL6X2DSvkTQ1UtsBCEt/a0Bo5uUd42ND5xfcWVrxZSEwox3LzVDh
 W9TTH9jpEtbTPnHu8fjEp4MQknreKmXwj8w06V01FkXAesNB
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c |  2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    | 12 ++++++++++--
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c    |  6 +++++-
 3 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index fb99328107dd..d1b35328b6e8 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -19,7 +19,7 @@ static void msm_hdmi_power_on(struct drm_bridge *bridge)
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

