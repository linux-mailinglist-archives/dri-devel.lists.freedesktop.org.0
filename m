Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DC2544BC4
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 14:24:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82B7A11BE7C;
	Thu,  9 Jun 2022 12:24:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15B2F11BE6B
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 12:23:58 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id a29so9210183lfk.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jun 2022 05:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T5UE8pNjgaTtZjA09LDBokilylt3Cka4hR72elnAkyQ=;
 b=KqQeQ3wvWGw5HAKIdtNTJrurF65J3ACl+ubzeie16fg5RubTBUJFhi6jx12cVx8uz5
 c06qqVshbB/+LYK4ehr/WlwlAu2EvkcxAez2ZueRWLfUESHuqzGP65qbxwa9LkraWOhX
 x1mDvbthgKfOrqPCn0RmhNeEKmr9w3s+kiDZ3AONuBJvMbycubQXSF1BBJiLjlRd+vkD
 OrE+RTPgjwberZF7o1NiYAj/7yN2ZeEpMCNy58qTlItfn+xze43Ey77iWVGtUq2G20BK
 QadNENhcw2l9y4HCkh/Zn7V/k44ntTXSz5PJXBVyt82jAJQDHUuQkW1cELhRoQ4v/z9a
 98xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T5UE8pNjgaTtZjA09LDBokilylt3Cka4hR72elnAkyQ=;
 b=zgYQYVTboeVJIyr/wqiUrWwt+HrjmdRn3eZr3AR5E9+8FvqubdLfypBI3Ct43eTN5m
 G0Tya4GajcvHJt5pM0rEKdJr8EPvOl/DrE+KWRCnG2pV/RsEtI2cFh90A/VT7iq1MIgK
 7gQj3dBhMmkkrAAGArvoNgP5e9T85X5GJhxSqvFqoj/oH5XesrWO/4q8bk/BNwYg9d45
 i6/HaGyldSBRJ1GK/hSQUJfy63DoZATAnTO0wqi6BqksgJpDHtSU/y7tYxB7Lcv7uVnN
 zoaNccBZRcD4BjBJBvrLgEZr0TEid11+mAJCn6ggeWKmTidERpOYNZHGZhLRErfUr+VS
 Yikg==
X-Gm-Message-State: AOAM530G20I0+XXSb08mFeEk5iVahqUfM/HMp4OHjuqZFYGfAfYj1MgL
 kHd8CaqAxBKlx946w7DPSXrSoQ==
X-Google-Smtp-Source: ABdhPJxoGinU8/ujJzRNORYcoXxk7vjwlYEFPUEN/nwlTwP3Z2ZEvpJB39SS7PG3doDmvDGSfOG2Eg==
X-Received: by 2002:a19:431c:0:b0:479:2053:178e with SMTP id
 q28-20020a19431c000000b004792053178emr18046892lfa.117.1654777437167; 
 Thu, 09 Jun 2022 05:23:57 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 f11-20020a056512360b00b0047daa133decsm32421lfs.166.2022.06.09.05.23.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 05:23:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 06/14] drm/msm/hdmi: drop unused GPIO support
Date: Thu,  9 Jun 2022 15:23:42 +0300
Message-Id: <20220609122350.3157529-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
References: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, kernel test robot <lkp@intel.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The HDMI driver has code to configure extra GPIOs, which predates
pinctrl support. Nowadays all platforms should use pinctrl instead.
Neither of upstreamed Qualcomm platforms uses these properties, so it's
safe to drop them.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c     | 66 +++++++----------------------
 drivers/gpu/drm/msm/hdmi/hdmi.h     | 13 +-----
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c | 62 ++-------------------------
 3 files changed, 21 insertions(+), 120 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 7267167d5ef1..6d79f1b910a5 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -233,6 +233,20 @@ static struct hdmi *msm_hdmi_init(struct platform_device *pdev)
 		hdmi->pwr_clks[i] = clk;
 	}
 
+	hdmi->hpd_gpiod = devm_gpiod_get_optional(&pdev->dev, "hpd", GPIOD_IN);
+	/* This will catch e.g. -EPROBE_DEFER */
+	if (IS_ERR(hdmi->hpd_gpiod)) {
+		ret = PTR_ERR(hdmi->hpd_gpiod);
+		DRM_DEV_ERROR(&pdev->dev, "failed to get hpd gpio: (%d)\n", ret);
+		goto fail;
+	}
+
+	if (!hdmi->hpd_gpiod)
+		DBG("failed to get HPD gpio");
+
+	if (hdmi->hpd_gpiod)
+		gpiod_set_consumer_name(hdmi->hpd_gpiod, "HDMI_HPD");
+
 	pm_runtime_enable(&pdev->dev);
 
 	hdmi->workq = alloc_ordered_workqueue("msm_hdmi", 0);
@@ -409,20 +423,6 @@ static struct hdmi_platform_config hdmi_tx_8996_config = {
 		.hpd_freq      = hpd_clk_freq_8x74,
 };
 
-static const struct {
-	const char *name;
-	const bool output;
-	const int value;
-	const char *label;
-} msm_hdmi_gpio_pdata[] = {
-	{ "qcom,hdmi-tx-ddc-clk", true, 1, "HDMI_DDC_CLK" },
-	{ "qcom,hdmi-tx-ddc-data", true, 1, "HDMI_DDC_DATA" },
-	{ "qcom,hdmi-tx-hpd", false, 1, "HDMI_HPD" },
-	{ "qcom,hdmi-tx-mux-en", true, 1, "HDMI_MUX_EN" },
-	{ "qcom,hdmi-tx-mux-sel", true, 0, "HDMI_MUX_SEL" },
-	{ "qcom,hdmi-tx-mux-lpm", true, 1, "HDMI_MUX_LPM" },
-};
-
 /*
  * HDMI audio codec callbacks
  */
@@ -534,7 +534,7 @@ static int msm_hdmi_bind(struct device *dev, struct device *master, void *data)
 	struct hdmi_platform_config *hdmi_cfg;
 	struct hdmi *hdmi;
 	struct device_node *of_node = dev->of_node;
-	int i, err;
+	int err;
 
 	hdmi_cfg = (struct hdmi_platform_config *)
 			of_device_get_match_data(dev);
@@ -546,42 +546,6 @@ static int msm_hdmi_bind(struct device *dev, struct device *master, void *data)
 	hdmi_cfg->mmio_name     = "core_physical";
 	hdmi_cfg->qfprom_mmio_name = "qfprom_physical";
 
-	for (i = 0; i < HDMI_MAX_NUM_GPIO; i++) {
-		const char *name = msm_hdmi_gpio_pdata[i].name;
-		struct gpio_desc *gpiod;
-
-		/*
-		 * We are fetching the GPIO lines "as is" since the connector
-		 * code is enabling and disabling the lines. Until that point
-		 * the power-on default value will be kept.
-		 */
-		gpiod = devm_gpiod_get_optional(dev, name, GPIOD_ASIS);
-		/* This will catch e.g. -PROBE_DEFER */
-		if (IS_ERR(gpiod))
-			return PTR_ERR(gpiod);
-		if (!gpiod) {
-			/* Try a second time, stripping down the name */
-			char name3[32];
-
-			/*
-			 * Try again after stripping out the "qcom,hdmi-tx"
-			 * prefix. This is mainly to match "hpd-gpios" used
-			 * in the upstream bindings.
-			 */
-			if (sscanf(name, "qcom,hdmi-tx-%s", name3))
-				gpiod = devm_gpiod_get_optional(dev, name3, GPIOD_ASIS);
-			if (IS_ERR(gpiod))
-				return PTR_ERR(gpiod);
-			if (!gpiod)
-				DBG("failed to get gpio: %s", name);
-		}
-		hdmi_cfg->gpios[i].gpiod = gpiod;
-		if (gpiod)
-			gpiod_set_consumer_name(gpiod, msm_hdmi_gpio_pdata[i].label);
-		hdmi_cfg->gpios[i].output = msm_hdmi_gpio_pdata[i].output;
-		hdmi_cfg->gpios[i].value = msm_hdmi_gpio_pdata[i].value;
-	}
-
 	dev->platform_data = hdmi_cfg;
 
 	hdmi = msm_hdmi_init(to_platform_device(dev));
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 736f348befb3..a6c88d157bc3 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -19,17 +19,9 @@
 #include "msm_drv.h"
 #include "hdmi.xml.h"
 
-#define HDMI_MAX_NUM_GPIO	6
-
 struct hdmi_phy;
 struct hdmi_platform_config;
 
-struct hdmi_gpio_data {
-	struct gpio_desc *gpiod;
-	bool output;
-	int value;
-};
-
 struct hdmi_audio {
 	bool enabled;
 	struct hdmi_audio_infoframe infoframe;
@@ -61,6 +53,8 @@ struct hdmi {
 	struct clk **hpd_clks;
 	struct clk **pwr_clks;
 
+	struct gpio_desc *hpd_gpiod;
+
 	struct hdmi_phy *phy;
 	struct device *phy_dev;
 
@@ -109,9 +103,6 @@ struct hdmi_platform_config {
 	/* clks that need to be on for screen pwr (ie pixel clk): */
 	const char **pwr_clk_names;
 	int pwr_clk_cnt;
-
-	/* gpio's: */
-	struct hdmi_gpio_data gpios[HDMI_MAX_NUM_GPIO];
 };
 
 struct hdmi_bridge {
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index 75605ddac7c4..bfa827b47989 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
@@ -60,48 +60,6 @@ static void msm_hdmi_phy_reset(struct hdmi *hdmi)
 	}
 }
 
-static int gpio_config(struct hdmi *hdmi, bool on)
-{
-	const struct hdmi_platform_config *config = hdmi->config;
-	int i;
-
-	if (on) {
-		for (i = 0; i < HDMI_MAX_NUM_GPIO; i++) {
-			struct hdmi_gpio_data gpio = config->gpios[i];
-
-			if (gpio.gpiod) {
-				if (gpio.output) {
-					gpiod_direction_output(gpio.gpiod,
-							       gpio.value);
-				} else {
-					gpiod_direction_input(gpio.gpiod);
-					gpiod_set_value_cansleep(gpio.gpiod,
-								 gpio.value);
-				}
-			}
-		}
-
-		DBG("gpio on");
-	} else {
-		for (i = 0; i < HDMI_MAX_NUM_GPIO; i++) {
-			struct hdmi_gpio_data gpio = config->gpios[i];
-
-			if (!gpio.gpiod)
-				continue;
-
-			if (gpio.output) {
-				int value = gpio.value ? 0 : 1;
-
-				gpiod_set_value_cansleep(gpio.gpiod, value);
-			}
-		}
-
-		DBG("gpio off");
-	}
-
-	return 0;
-}
-
 static void enable_hpd_clocks(struct hdmi *hdmi, bool enable)
 {
 	const struct hdmi_platform_config *config = hdmi->config;
@@ -154,11 +112,8 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 		goto fail;
 	}
 
-	ret = gpio_config(hdmi, true);
-	if (ret) {
-		DRM_DEV_ERROR(dev, "failed to configure GPIOs: %d\n", ret);
-		goto fail;
-	}
+	if (hdmi->hpd_gpiod)
+		gpiod_set_value_cansleep(hdmi->hpd_gpiod, 1);
 
 	pm_runtime_get_sync(dev);
 	enable_hpd_clocks(hdmi, true);
@@ -207,10 +162,6 @@ void msm_hdmi_hpd_disable(struct hdmi_bridge *hdmi_bridge)
 	enable_hpd_clocks(hdmi, false);
 	pm_runtime_put(dev);
 
-	ret = gpio_config(hdmi, false);
-	if (ret)
-		dev_warn(dev, "failed to unconfigure GPIOs: %d\n", ret);
-
 	ret = pinctrl_pm_select_sleep_state(dev);
 	if (ret)
 		dev_warn(dev, "pinctrl state chg failed: %d\n", ret);
@@ -269,10 +220,7 @@ static enum drm_connector_status detect_reg(struct hdmi *hdmi)
 #define HPD_GPIO_INDEX	2
 static enum drm_connector_status detect_gpio(struct hdmi *hdmi)
 {
-	const struct hdmi_platform_config *config = hdmi->config;
-	struct hdmi_gpio_data hpd_gpio = config->gpios[HPD_GPIO_INDEX];
-
-	return gpiod_get_value(hpd_gpio.gpiod) ?
+	return gpiod_get_value(hdmi->hpd_gpiod) ?
 			connector_status_connected :
 			connector_status_disconnected;
 }
@@ -282,8 +230,6 @@ enum drm_connector_status msm_hdmi_bridge_detect(
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
-	const struct hdmi_platform_config *config = hdmi->config;
-	struct hdmi_gpio_data hpd_gpio = config->gpios[HPD_GPIO_INDEX];
 	enum drm_connector_status stat_gpio, stat_reg;
 	int retry = 20;
 
@@ -291,7 +237,7 @@ enum drm_connector_status msm_hdmi_bridge_detect(
 	 * some platforms may not have hpd gpio. Rely only on the status
 	 * provided by REG_HDMI_HPD_INT_STATUS in this case.
 	 */
-	if (!hpd_gpio.gpiod)
+	if (!hdmi->hpd_gpiod)
 		return detect_reg(hdmi);
 
 	do {
-- 
2.35.1

