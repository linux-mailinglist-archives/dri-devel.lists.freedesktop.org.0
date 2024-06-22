Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A043B91367E
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 00:02:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A718210EDF3;
	Sat, 22 Jun 2024 22:02:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Gwq4gflC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B692D10EDF2
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2024 22:02:28 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2ec002caeb3so39013401fa.2
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2024 15:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719093747; x=1719698547; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=slg0qL1615VPI0XhTFhgJhcThug3uChho064CYgmjts=;
 b=Gwq4gflCiaKWqKLfJhsJeWcJ0nHxx53I/R7ktz+GRA3fLhUiJ1w/2lHHirVjmO0WiL
 j1rya/Xm7uyQtHP4NmyUkgSHeKu5xCFQ3/boij10JjhWaAYyqJ9cPdSoR280MkyLSWy8
 rIEbh/pNj0gp7LhZTEN/UALIx99kcgrHcF4fF8AJz8Krn2j+c2r2QtZAEBMFn6YKcCAx
 mB78juJfrTjpX6IGJ2cUquCERba+KJ2sOGkLWjX4jk5yxzZ0uxrPU9Py3shVhAQVZhCl
 5CugdIXguwDYWp3iWpNnwJCprZNLR+AZnxbADbTlpw8K8pPV3eDKBph7tVL4TWcHjtNn
 D8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719093747; x=1719698547;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=slg0qL1615VPI0XhTFhgJhcThug3uChho064CYgmjts=;
 b=hsuH/qDni/f/XgpVuHiiM7m4ZypjZGeYb5VVemnwFFtf7Mhf5saFgY/NCickAMyTnB
 N5o1kq6+EjXNUDidlK+0K2vrtTG8vpn/1bV25G00IcPKuO8tTSSHszmIlsQQF+SPd1EL
 mUiNJXRXvWDpSD/+wRpPAkMiNe0kYvf2HEbBO10GVnjB59KDkWtogvyaI2DWC+Nr/rNy
 bwpRawpzeRcYhKZJFrJLLgSdO2mmAgxXaUoW8UNpkja3RM9UfQ/c1cZ2EsmfaalFUO6j
 RwYbs/umUSFWVYTq8aTvVSNswyFRsEfn4PG+CAMR2wTxOpCFBPE2oFoC2MfCiWhzZ6CW
 3V6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8vQyEZG1szYTo4uKYI/agdvrhNFsyH2FUR9TWaKc+eGebmc6aNy6TbjMXog0Xs/XNDdvcb1h7bK+hIYSK7fwtP2j8xgsXtkzcvhOcmgOs
X-Gm-Message-State: AOJu0YwC5RyBU/sVtsHapKJWm0dksB2tDxEENw6WcgMMu/4silGGdIUi
 nMDrYT3HdUM2JWkS/EU94oq486DrRwYvIfAVpXSpBnEsW4hxdmBVbgyOFbdjbuc=
X-Google-Smtp-Source: AGHT+IGlPIj5UFpVQffFP/O71H4/VkTdmWVZVeEYyLy33LbFBbp/GGAmyVjfwBO4mNKfN+aZKytF1w==
X-Received: by 2002:a2e:9dd2:0:b0:2ec:1810:e50a with SMTP id
 38308e7fff4ca-2ec579c7736mr10820961fa.32.1719093746800; 
 Sat, 22 Jun 2024 15:02:26 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec55e56ea5sm2502051fa.112.2024.06.22.15.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jun 2024 15:02:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 23 Jun 2024 01:02:24 +0300
Subject: [PATCH v3 11/13] drm/msm/hdmi: drop hpd-gpios support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240623-fd-hdmi-hpd-v3-11-8645a64cbd63@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4367;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=IKMVsya9o4vBvDRk/2sR0JSKyG59n+7WHe8B9IcbVug=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmd0npCD6Z1JlEKMd5Xt6fWP/5+MYZxbs0Pns8Z
 tA3YnXppWKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZndJ6QAKCRCLPIo+Aiko
 1TrtB/4ntzjJ9mo6sr4ZpNbnT+nE7xDo1MbRSkh0RHfGqJk18duXSZbmag5HLSZQfjFdnZNmULO
 TR0lTwPMsirdvHzUlwHY0sSl6Bz0jbVoInwVNzhQ86mo23bgr67ncHJuugx7VYbQmZZ0/nz44OY
 +CL98Yb4ipuv82HksLGHqe01zIk/wvKjFLKuZylljbZPCpv71Nx8IxMArk1cIPqB4oe28YgDoX5
 KdVCRO482mNPGqvuWNDNPFfgVxGbrgrcWwwGV3XqfaWxO7O2V/2WHpsUcfObIf3viYEDqDiK0YM
 8xRuiYfmRxEmUZvertIk8Yz9uUtb+z2qeh+4HbanVSlW+7LB
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

Supporting simultaneous check of native HPD and the external GPIO proved
to be less stable than just native HPD. Drop the hpd-gpios support,
leaving just the native HPD support. In case the native HPD doesn't work
the user is urged to switch to specifying the HPD property to the
hdmi-connector device.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c     | 14 +++-------
 drivers/gpu/drm/msm/hdmi/hdmi.h     |  2 --
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c | 53 +++----------------------------------
 3 files changed, 7 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 5ba9a23ef122..97faa7d26cc9 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -443,17 +443,9 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(hdmi->extp_clk),
 				     "failed to get extp clock\n");
 
-	hdmi->hpd_gpiod = devm_gpiod_get_optional(&pdev->dev, "hpd", GPIOD_IN);
-	/* This will catch e.g. -EPROBE_DEFER */
-	if (IS_ERR(hdmi->hpd_gpiod))
-		return dev_err_probe(dev, PTR_ERR(hdmi->hpd_gpiod),
-				     "failed to get hpd gpio\n");
-
-	if (!hdmi->hpd_gpiod)
-		DBG("failed to get HPD gpio");
-
-	if (hdmi->hpd_gpiod)
-		gpiod_set_consumer_name(hdmi->hpd_gpiod, "HDMI_HPD");
+	if (of_find_property(dev->of_node, "hpd-gpios", NULL) ||
+	    of_find_property(dev->of_node, "hpd-gpio", NULL))
+		dev_warn(dev, "hpd-gpios is not supported anymore, please migrate to the hdmi-connector\n");
 
 	ret = msm_hdmi_get_phy(hdmi);
 	if (ret) {
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 1c2e46d38792..6faf4397ed58 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -52,8 +52,6 @@ struct hdmi {
 	struct clk_bulk_data *pwr_clks;
 	struct clk *extp_clk;
 
-	struct gpio_desc *hpd_gpiod;
-
 	struct hdmi_phy *phy;
 	struct device *phy_dev;
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index 32e447267e3b..d3353c6148ed 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
@@ -69,9 +69,6 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 	int ret;
 	unsigned long flags;
 
-	if (hdmi->hpd_gpiod)
-		gpiod_set_value_cansleep(hdmi->hpd_gpiod, 1);
-
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret)
 		return ret;
@@ -144,8 +141,11 @@ void msm_hdmi_hpd_irq(struct drm_bridge *bridge)
 	}
 }
 
-static enum drm_connector_status detect_reg(struct hdmi *hdmi)
+enum drm_connector_status msm_hdmi_bridge_detect(
+		struct drm_bridge *bridge)
 {
+	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
+	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	uint32_t hpd_int_status = 0;
 	int ret;
 
@@ -161,48 +161,3 @@ static enum drm_connector_status detect_reg(struct hdmi *hdmi)
 	return (hpd_int_status & HDMI_HPD_INT_STATUS_CABLE_DETECTED) ?
 			connector_status_connected : connector_status_disconnected;
 }
-
-#define HPD_GPIO_INDEX	2
-static enum drm_connector_status detect_gpio(struct hdmi *hdmi)
-{
-	return gpiod_get_value(hdmi->hpd_gpiod) ?
-			connector_status_connected :
-			connector_status_disconnected;
-}
-
-enum drm_connector_status msm_hdmi_bridge_detect(
-		struct drm_bridge *bridge)
-{
-	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
-	struct hdmi *hdmi = hdmi_bridge->hdmi;
-	enum drm_connector_status stat_gpio, stat_reg;
-	int retry = 20;
-
-	/*
-	 * some platforms may not have hpd gpio. Rely only on the status
-	 * provided by REG_HDMI_HPD_INT_STATUS in this case.
-	 */
-	if (!hdmi->hpd_gpiod)
-		return detect_reg(hdmi);
-
-	do {
-		stat_gpio = detect_gpio(hdmi);
-		stat_reg  = detect_reg(hdmi);
-
-		if (stat_gpio == stat_reg)
-			break;
-
-		mdelay(10);
-	} while (--retry);
-
-	/* the status we get from reading gpio seems to be more reliable,
-	 * so trust that one the most if we didn't manage to get hdmi and
-	 * gpio status to agree:
-	 */
-	if (stat_gpio != stat_reg) {
-		DBG("HDMI_HPD_INT_STATUS tells us: %d", stat_reg);
-		DBG("hpd gpio tells us: %d", stat_gpio);
-	}
-
-	return stat_gpio;
-}

-- 
2.39.2

