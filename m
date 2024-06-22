Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8E291366D
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 00:02:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07CF310EDEC;
	Sat, 22 Jun 2024 22:02:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jap0IvgQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C8910EDEA
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2024 22:02:24 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2ebe6495aedso31578421fa.0
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2024 15:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719093742; x=1719698542; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IStmo6xiSWG0asaFWCQdK/NUgiLLAmlGd9tuwPv/Qx0=;
 b=jap0IvgQ5s4cOYNrNKVBFOBlLsphQmr/HDWmG9xno82X3/4q6nU09FgafhKi/G7pTk
 abApBwWDiGXGxwnCi9/ihDcTBCL8YEYCf0zR1B2MeiWTfU1QQIB85tbRLiGONbbWeiZk
 U1cIIDzbLaUaRKBgemrkla76Yg64vAUEIZUDwumE6Z2qK18GbiGgXQPvroSjwXJrTYD7
 uYDFVYe9odl53JAS7uDPwvo4pyb1+wEAJ/gFNFZqs8LDcelOkErlQZvW6zokg6sG8wYJ
 G1Fhuqjz0upW8kqwfJHifnHh0DfHmph5E/5ASSLF8WEGP1PBL2z6ErPP30T10z1Sn7cH
 6WlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719093742; x=1719698542;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IStmo6xiSWG0asaFWCQdK/NUgiLLAmlGd9tuwPv/Qx0=;
 b=G2b+Lvr8j3AH/0TxLIh4Iv45C+aeUaCmvjo+wTBtD6FniXOKoCpu12ipW6fkoESO2x
 zR654wcOf1YdTvSZKhSWFbfVGmLJJXXBW2Fza543eMTa5OOFj94J09krU+d4LWX9FPl/
 WfT8lWTDGvHUU/PLuRSBaaaIc4YNAEtFRwaXDvlxIRJDRtpWPreCcTuGGZszz8VNmTuW
 3N8JrNl5rATKBr4WTfi2CwaFMVhhsg3ktPWN6/++NWeMd5/QWRguL92t+pPyckqoK139
 FlKDi3mpPVmbHqswCcW+fx68cZ11N1ZBurhOrOYR4URltA98JLYdojMIwqd7RCJjNtVa
 381w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVspO11RYFuPzBhK9bPOTnfR6so0LraYZJy+ph15ASDZEuzMd6bNt6P8WNnhnf4ARtyZxljKoTPZFcq24gImTF3+OzUVIzq+xN4RH1C3xSP
X-Gm-Message-State: AOJu0Yz3PqOT2xKrENnDmiJcag6Jp4J1Nk2OG6lLyZk1JjO8DE8Tv0iU
 WtpPGWxhjxgfK6YB2XB4Bre6U1vp38nfAzwywivUBEQbes6+6v1zvszKkVGeDLs=
X-Google-Smtp-Source: AGHT+IGZw2H42wRxJ9RELBzDAP73A8ArscgXWtc/kskvhjttQIpurWMQBXx/wCa9YqSVGmJ+FU/ycA==
X-Received: by 2002:a2e:bb91:0:b0:2ec:5d83:32da with SMTP id
 38308e7fff4ca-2ec5d833347mr723941fa.49.1719093742334; 
 Sat, 22 Jun 2024 15:02:22 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec55e56ea5sm2502051fa.112.2024.06.22.15.02.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jun 2024 15:02:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 23 Jun 2024 01:02:18 +0300
Subject: [PATCH v3 05/13] drm/msm/hdmi: switch to clk_bulk API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240623-fd-hdmi-hpd-v3-5-8645a64cbd63@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4314;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=qMMhEiJGtMf2g7v1irJOBZTZd4gqQt3vmkW+yduYJ5w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmd0noBQU1rT1FyJzLhckR2v0eX7J4AfLxZpRoy
 d67H5nPZKiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZndJ6AAKCRCLPIo+Aiko
 1daxB/4iHvTDj3eKXXuQIHW9ezTQ5XvP0B+X2hJ8MSDqBPVuF1y3b3M6piEYFQyVphx44+S2XHM
 EuHs3LUkO5BU2Konqk2/BrVIZyEnRkHJk6y4e8jeMQ3WH8RIFf/IEGrjn7qGWmc1nA2BeNH+Bhe
 MKV4a258b5NCYtAvBqaUZjyS8PZKedfmpHbItgRdGorqa7YBH6HBBw4IZ/U2pAJac0rK2mKcDwT
 JO91ws3loQkpjWNFoF1NtKmSeISaos4OYIForCVkGtVB8oBpID9SMadU45F5KrdMuRTRlkWZIJc
 B2h05d1J89ERRbDb60mu/8yToRHCMfhHEc0kTy/1dN3XSJXY
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

The last platform using legacy clock names for HDMI block (APQ8064)
switched to new clock names in 5.16. It's time to stop caring about old
DT, drop hand-coded helpers and switch to clk_bulk_* API.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c     | 15 +++++---------
 drivers/gpu/drm/msm/hdmi/hdmi.h     |  2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c | 39 +++++++++++++------------------------
 3 files changed, 19 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 9a39ad1847b9..34c1aac5feab 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -444,17 +444,12 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 	if (!hdmi->hpd_clks)
 		return -ENOMEM;
 
-	for (i = 0; i < config->hpd_clk_cnt; i++) {
-		struct clk *clk;
+	for (i = 0; i < config->hpd_clk_cnt; i++)
+		hdmi->hpd_clks[i].id = config->hpd_clk_names[i];
 
-		clk = msm_clk_get(pdev, config->hpd_clk_names[i]);
-		if (IS_ERR(clk))
-			return dev_err_probe(dev, PTR_ERR(clk),
-					     "failed to get hpd clk: %s\n",
-					     config->hpd_clk_names[i]);
-
-		hdmi->hpd_clks[i] = clk;
-	}
+	ret = devm_clk_bulk_get(&pdev->dev, config->hpd_clk_cnt, hdmi->hpd_clks);
+	if (ret)
+		return ret;
 
 	hdmi->extp_clk = devm_clk_get_optional(&pdev->dev, "extp");
 	if (IS_ERR(hdmi->extp_clk))
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 14472b2d6229..287e6d33fb85 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -50,7 +50,7 @@ struct hdmi {
 
 	struct regulator_bulk_data *hpd_regs;
 	struct regulator_bulk_data *pwr_regs;
-	struct clk **hpd_clks;
+	struct clk_bulk_data *hpd_clks;
 	struct clk *extp_clk;
 
 	struct gpio_desc *hpd_gpiod;
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index 7ae69b14e953..36266aa626dc 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
@@ -60,27 +60,6 @@ static void msm_hdmi_phy_reset(struct hdmi *hdmi)
 	}
 }
 
-static void enable_hpd_clocks(struct hdmi *hdmi, bool enable)
-{
-	const struct hdmi_platform_config *config = hdmi->config;
-	struct device *dev = &hdmi->pdev->dev;
-	int i, ret;
-
-	if (enable) {
-		for (i = 0; i < config->hpd_clk_cnt; i++) {
-			ret = clk_prepare_enable(hdmi->hpd_clks[i]);
-			if (ret) {
-				DRM_DEV_ERROR(dev,
-					"failed to enable hpd clk: %s (%d)\n",
-					config->hpd_clk_names[i], ret);
-			}
-		}
-	} else {
-		for (i = config->hpd_clk_cnt - 1; i >= 0; i--)
-			clk_disable_unprepare(hdmi->hpd_clks[i]);
-	}
-}
-
 int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
@@ -107,7 +86,9 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 		gpiod_set_value_cansleep(hdmi->hpd_gpiod, 1);
 
 	pm_runtime_get_sync(dev);
-	enable_hpd_clocks(hdmi, true);
+	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
+	if (ret)
+		goto fail;
 
 	msm_hdmi_set_mode(hdmi, false);
 	msm_hdmi_phy_reset(hdmi);
@@ -149,7 +130,7 @@ void msm_hdmi_hpd_disable(struct hdmi *hdmi)
 
 	msm_hdmi_set_mode(hdmi, false);
 
-	enable_hpd_clocks(hdmi, false);
+	clk_bulk_disable_unprepare(config->hpd_clk_cnt, hdmi->hpd_clks);
 	pm_runtime_put(dev);
 
 	ret = pinctrl_pm_select_sleep_state(dev);
@@ -193,14 +174,20 @@ void msm_hdmi_hpd_irq(struct drm_bridge *bridge)
 
 static enum drm_connector_status detect_reg(struct hdmi *hdmi)
 {
-	uint32_t hpd_int_status;
+	const struct hdmi_platform_config *config = hdmi->config;
+	uint32_t hpd_int_status = 0;
+	int ret;
 
 	pm_runtime_get_sync(&hdmi->pdev->dev);
-	enable_hpd_clocks(hdmi, true);
+	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
+	if (ret)
+		goto out;
 
 	hpd_int_status = hdmi_read(hdmi, REG_HDMI_HPD_INT_STATUS);
 
-	enable_hpd_clocks(hdmi, false);
+	clk_bulk_disable_unprepare(config->hpd_clk_cnt, hdmi->hpd_clks);
+
+out:
 	pm_runtime_put(&hdmi->pdev->dev);
 
 	return (hpd_int_status & HDMI_HPD_INT_STATUS_CABLE_DETECTED) ?

-- 
2.39.2

