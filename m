Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 747798C9CF5
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 14:13:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0483C10E650;
	Mon, 20 May 2024 12:13:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RimYDHAK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE96B10E5FF
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 12:12:50 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-51f4d2676d1so3393734e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 05:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716207169; x=1716811969; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ysfCdKt8g8bGfjsoWFvFbNI8t+pMGg62WwygxK0izmw=;
 b=RimYDHAKbiN41piUm8AQAOL6hVzHi1z/+ZE0B3Jb/H9acKG9qCDCdCsowpJS+vbR3b
 nT2a8spEnwW2cIWSUZVkiCEF4/4tsvYYoWM11jrNGjAmRo9N+i6Uvv0om35Ej6VZb45s
 kW/xpSZ3onCNVWqiiJyIscGlmg9mLoo7ZKBq57eGe/fAOmYLrPJBqwOts2hApbaN4Vni
 KN0wssYat5yGkx38L5mMkNnbmZ0OnSiObBFOTVJKlaav3mnRQprlUb0ebGJVVG3kj+Ve
 8utlT1ch0nzGWr6zJRfP+K3Jb2QknTu+SNxvNgi/a5aWWa+xb2k9Sk76LUxLGHWlyQmj
 I15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716207169; x=1716811969;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ysfCdKt8g8bGfjsoWFvFbNI8t+pMGg62WwygxK0izmw=;
 b=MtT6uyH3YK8OPFF1lrh61p8grNfeTxixLl+Yoc/xa1/SRa0tx/4yrVJ0vUWScWcFG/
 zJIANWogwmPtY+QUDtso9sBAmrlVAIhM5tCYQZc32vKUQ1TJyowqmHcVUmSAWMAu1tQe
 gO/eq/LqMTTIJzlWFWjaRqexJA4QdzBFsnZ4ZXXycIIpttSCiv2d0ZT7r7Zx17dbuPOj
 Qe/kM98i38tmo3LGl6BkW22Bg/rtanFzAQwASyCFy7tE1D5lL0RKb99mLepftBQ7QP4k
 vYMDqKgMhn25gcRx7KkRUSnxbD79NF6qqsZ/h6MmUoG5j6HcM2CA+IGdILjHAv24bx9D
 /Few==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqhEkvEdOFqhNJiCIdtBJ4OnGnUbOS2YIJbc+31acnuSy3AwCNQZ5L0/0SO1wkJLVl26t6BcUtORtnNwFWDhmNzKmXzFcJomui65W2ch0L
X-Gm-Message-State: AOJu0YwEnn65OCKJ+wMsvWQi7wyG6NoFO4UBxVMyiV2izOowqMVRBikj
 JSnLt3JEsVXmWKEU9SH0B4CrjGTAx7GtYeoXgdCmN2ODPATRWCArN4/H9y1Rk3w=
X-Google-Smtp-Source: AGHT+IHomdlhT0R7x+VWgORURBT++pY/a+92GrLNJK5gnD81Lb5FGu542a+qfIiNe6AtTazsYvEvFw==
X-Received: by 2002:ac2:4c19:0:b0:518:ae8f:b573 with SMTP id
 2adb3069b0e04-52210275e37mr16875901e87.61.1716207168910; 
 Mon, 20 May 2024 05:12:48 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f35ad6c0sm4273682e87.30.2024.05.20.05.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 May 2024 05:12:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 20 May 2024 15:12:45 +0300
Subject: [PATCH 3/7] drm/msm/dsi: drop unused GPIOs handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240520-dpu-handle-te-signal-v1-3-f273b42a089c@linaro.org>
References: <20240520-dpu-handle-te-signal-v1-0-f273b42a089c@linaro.org>
In-Reply-To: <20240520-dpu-handle-te-signal-v1-0-f273b42a089c@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2856;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=rKkxO/lH6VpF+CCryG3++2dVVJ5mwyRiM1XPXMMRWI0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmSz48whrcH+G+Y7A7SrCydEtSWnF9KCJNWrmEg
 kKKqYPwNQOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZks+PAAKCRCLPIo+Aiko
 1eQpB/94158/wJyOWfLDV0Z6d6SXbqHQElNXHbY5O9n2TVdDk3LZpRgff/s6AQy7qFOEzDRawi5
 TJIONXw4zoHGvBQL1mgGl2FYLp2dHnzmPUyIKnKP4Q9tJpOq68pMl/bwKC4rIhgPX0BN1Ttdozj
 qWzaKfy4SEtVOXY+dT+PO6oYWu/WRpK+OVvxfRUA4Mk95NM+bJfIp5McDKEk+E++yfDswn+lQ5m
 M/4nHKLRZZf/azIu0L8WfUMeFO1ieZGCdyGiV4tZTQ2E3VHrX4V+TDo4ucqZWhKQh4laJk/czYi
 h6fnsgwg/OEDhqveD8XUerJduuRxDXme4HxmqzuAwqMrroQ1
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

Neither disp-enable-gpios nor disp-te-gpios are defined in the schema.
None of the board DT files use those GPIO pins. Drop them from the
driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 37 -------------------------------------
 1 file changed, 37 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index a50f4dda5941..c4d72562c95a 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -7,7 +7,6 @@
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
-#include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
 #include <linux/mfd/syscon.h>
 #include <linux/of.h>
@@ -130,9 +129,6 @@ struct msm_dsi_host {
 
 	unsigned long src_clk_rate;
 
-	struct gpio_desc *disp_en_gpio;
-	struct gpio_desc *te_gpio;
-
 	const struct msm_dsi_cfg_handler *cfg_hnd;
 
 	struct completion dma_comp;
@@ -1613,28 +1609,6 @@ static irqreturn_t dsi_host_irq(int irq, void *ptr)
 	return IRQ_HANDLED;
 }
 
-static int dsi_host_init_panel_gpios(struct msm_dsi_host *msm_host,
-			struct device *panel_device)
-{
-	msm_host->disp_en_gpio = devm_gpiod_get_optional(panel_device,
-							 "disp-enable",
-							 GPIOD_OUT_LOW);
-	if (IS_ERR(msm_host->disp_en_gpio)) {
-		DBG("cannot get disp-enable-gpios %ld",
-				PTR_ERR(msm_host->disp_en_gpio));
-		return PTR_ERR(msm_host->disp_en_gpio);
-	}
-
-	msm_host->te_gpio = devm_gpiod_get_optional(panel_device, "disp-te",
-								GPIOD_IN);
-	if (IS_ERR(msm_host->te_gpio)) {
-		DBG("cannot get disp-te-gpios %ld", PTR_ERR(msm_host->te_gpio));
-		return PTR_ERR(msm_host->te_gpio);
-	}
-
-	return 0;
-}
-
 static int dsi_host_attach(struct mipi_dsi_host *host,
 					struct mipi_dsi_device *dsi)
 {
@@ -1651,11 +1625,6 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
 	if (dsi->dsc)
 		msm_host->dsc = dsi->dsc;
 
-	/* Some gpios defined in panel DT need to be controlled by host */
-	ret = dsi_host_init_panel_gpios(msm_host, &dsi->dev);
-	if (ret)
-		return ret;
-
 	ret = dsi_dev_attach(msm_host->pdev);
 	if (ret)
 		return ret;
@@ -2422,9 +2391,6 @@ int msm_dsi_host_power_on(struct mipi_dsi_host *host,
 	dsi_sw_reset(msm_host);
 	dsi_ctrl_enable(msm_host, phy_shared_timings, phy);
 
-	if (msm_host->disp_en_gpio)
-		gpiod_set_value(msm_host->disp_en_gpio, 1);
-
 	msm_host->power_on = true;
 	mutex_unlock(&msm_host->dev_mutex);
 
@@ -2454,9 +2420,6 @@ int msm_dsi_host_power_off(struct mipi_dsi_host *host)
 
 	dsi_ctrl_disable(msm_host);
 
-	if (msm_host->disp_en_gpio)
-		gpiod_set_value(msm_host->disp_en_gpio, 0);
-
 	pinctrl_pm_select_sleep_state(&msm_host->pdev->dev);
 
 	cfg_hnd->ops->link_clk_disable(msm_host);

-- 
2.39.2

