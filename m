Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FE3A2DAFF
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 06:07:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75CD010E489;
	Sun,  9 Feb 2025 05:07:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iU4xhSxz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A5AF10E487
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 05:07:18 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5450475df18so1029941e87.2
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 21:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739077637; x=1739682437; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wQN0+9Nxsmop3hssFFkRG5gm+YC2hGLzkxVXuFrHYbk=;
 b=iU4xhSxzjhkYvaI88ECGYccj3ggLlBltkyOJkmZ0i2dZQFHt2HDSYTc8xeEt/t7haT
 Ri9H2mtgJC2nTswz2mrDZZnaxE2OnkDfdSHP93rKjNfIXo7Lq0gqYxLXs49Gb4CRLQwW
 gzoCpWxFKF3Z2+YH1jWJw9EPqaT5AFd6rjJ3xZmahKGjs/l6afmcF1IgVISJ37J4KURj
 ZgbBlmr6HRqU9Gcvf0KdlEFAXoWrCl9CuUcGrG4yXC56FVBbxcAVsys5mLvIYVuVIZA4
 l7T24KFgXA7sVf6F3S4EIioHjpjDyrTmEgH56iwOibKPgPj9Dmf61r1DH1wW5FijjXA+
 +a9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739077637; x=1739682437;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wQN0+9Nxsmop3hssFFkRG5gm+YC2hGLzkxVXuFrHYbk=;
 b=DfHkC4dVXhGIQFLyYs/6rvjN9E+5SQ5YkGDes4paQTqP8RWDNT+Lz/uAZBDS5KoDsO
 VZ+8cKwdy8dta0MeuWjiHEM9o9XuZdZ9P665l1xHOKuzWVkw7ZjySBhLRmIvnY1FQ8Aq
 JYKx138fQTFB3FtyOM+5HQwtB4vRV4nGCXKzF12Ib570f+GmXjxv5anTQAdL1CPug5DB
 ygkOYBD3CW8hketjKTDSj4I5uIFo5tVMGnwY0F1gtsrnVLaCqlnqMo0sszQBgoVjl2WR
 yUxJ3PYliS7WrNK19d5lgUBvvHm240SK/BnllQqYcmJeR7XRtRHhT/FEPymwPcoHLRC3
 FEpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUddEH4A+jYvSjQUliruQr55qGPCfYFYDKWplpP0O0lwy5Sa/0df+ygFCmVkStQuuX4l1F6+mJCAY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxI5N2SN3R08W40XMV1rsHwWrqt/4MueCYQ1iFhOAg0+Sy/Zpgh
 h/kh/FDlrTawQdcraOadNPS0z5zh+4RKkgQOi8VTWtn4cP9NnHZJK6Hu4z5COYs=
X-Gm-Gg: ASbGnctVqX1tVa1qQS9+pg2zaLQhm2HTES2iRa+H14UlLRrBgsTtJcMSGsR3ORkCTvQ
 Ar86ilrXkEWI9PO278RGh+1Ks2rieq7oNKZJf9ygQrd24IHXOB75l/lZixsBHyewShKKkzkPlXD
 i5kmwyJIjEDGJsiLO9Opu9kLk9udcKqsgsUBHNA8YxOzpy66eq34edaStNrzJKDb5CchnZhlH8j
 gHvu4uneAKIjeb36zcdVjOv6KVN8qZLZhC7EkoDUQ5hX57KChPR+jsQg9oic2o2pispgfKe07qT
 N7hHsBRV+WOSIcNGiiKyFn8=
X-Google-Smtp-Source: AGHT+IGp/15rtM4WUZVM/z/LrVJYA8lGK9lfX+FXcNamZzHbk22gzs/jyxYxDerRvXrH1oHxGPPxwg==
X-Received: by 2002:a05:6512:a8b:b0:545:ba7:26f5 with SMTP id
 2adb3069b0e04-5450ba727f9mr21247e87.46.1739077636734; 
 Sat, 08 Feb 2025 21:07:16 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54506ef1733sm245576e87.1.2025.02.08.21.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 21:07:15 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 09 Feb 2025 07:04:57 +0200
Subject: [PATCH v4 13/16] drm/msm/hdmi: drop hpd-gpios support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-fd-hdmi-hpd-v4-13-6224568ed87f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4525;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=bHZ+8WYzHrJJ+NgSrs9nDogjdV+FFAB38y+PAaB4SrI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqDfjEbNj1xGsfjY7qcPtcbZDe1Jbntpt8hWtV
 hNun8j5xyGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6g34wAKCRCLPIo+Aiko
 1YBbB/45QpIZuxWXosnWOeO5OFPRAW5AOBQIRXJZ52Pls3macQD9qAauDoCLtSI0iEPZ1daMbp3
 1OVi92DXGwz97C4/PmsoKMPx5BQwNffqYcI7dNWDKqHloG4VlYE0s1SJa4iuK3MuKTFo8E2mpsS
 1YBn+MHA2vVYBmeRywRkL66hJ8cwM1mnj1198W5nPfmHnEmeaVBnu06JNzphQuZ8m1eoMBHKh8A
 wyqYM8UFd4zJAflGWp6pGBDvF4W4ksxmxT1PPjRRZ1koPeK8qsOyu+t1pjZtswtWuw7Z5jc8GkY
 P6r9iHbbQoTA+vCKc9bqisiHcxZc8wU3qXxNJYpWV6VRdLN5
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
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c | 52 +++----------------------------------
 3 files changed, 6 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 3d10fe6f8545198365a047b2f5652081703101aa..abe2c9e1df550a36914ed19f51e7b86e5d3d24c0 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -352,17 +352,9 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
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
index fb64652162b6c5e6e2fe3357b89c40e2a28aa47e..a40d69ae328ced8b9f7411cf809a3fa8641dca33 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -51,8 +51,6 @@ struct hdmi {
 	struct clk_bulk_data *pwr_clks;
 	struct clk *extp_clk;
 
-	struct gpio_desc *hpd_gpiod;
-
 	struct hdmi_phy *phy;
 	struct device *phy_dev;
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index a42ed26a5b7c7d916d543aa2920754347903062a..d63f0fd96f0c00bbe07a13f8ead26f05a5133084 100644
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
@@ -144,8 +141,10 @@ void msm_hdmi_hpd_irq(struct drm_bridge *bridge)
 	}
 }
 
-static enum drm_connector_status detect_reg(struct hdmi *hdmi)
+enum drm_connector_status msm_hdmi_bridge_detect(struct drm_bridge *bridge)
 {
+	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
+	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	u32 hpd_int_status = 0;
 	int ret;
 
@@ -161,48 +160,3 @@ static enum drm_connector_status detect_reg(struct hdmi *hdmi)
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
2.39.5

