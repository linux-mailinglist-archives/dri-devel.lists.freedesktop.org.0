Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09730540E99
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 20:58:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C8E910F032;
	Tue,  7 Jun 2022 18:58:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED80210F023
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 18:58:12 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id j10so29707044lfe.12
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jun 2022 11:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZRvqaLg9Fcf4jlsPh9c6YwzET9xrw630tpzPuxWOrO4=;
 b=CeOYMPInmK/MmilRJiTU8MA381dXLGAAZ6ucBnfn5n4+9ckYsuXXcpxsMToMGTXDL5
 Y3Z1W/c7mRIEcX797rMBpcYx/Acwhu1RweB+xKOdZVdXI6Jdox8ayDjoug5Po++B7Ofd
 SYwU1F8dNkOmw9QGiUmIhNxEPvxpj5Ehx3EFd3Po1IL5TSZxt0JrCKmhUCSBVlGJ7HR4
 O8lbKAZj77Nk1BTEAYfZtcs6NGiICEpqBWaQ8rfF4doHZGgaElUBWyam16qdCRk9FGXI
 9NCU65BXNUFk8zEL1CWAUlHhnKTSs8pBaVH3uVi3JLssvBXXcixtBZIk4fcsBhfjW1eR
 MCMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZRvqaLg9Fcf4jlsPh9c6YwzET9xrw630tpzPuxWOrO4=;
 b=tCjKUzyonPVnRjNjNaid00dmiczG8tBe2yCEp9ADUFHbSKco5oEH2Ox+JFIDz7V6tj
 FLRDQcCnkT+/rhTrHoLwFuUhZAyBRUp60NLkP943on66BBtRqyQfqNBY7Q6J0zjYtBop
 ew3foPtcIP6o6ZWVEorSdIzHXyxYJuwnujoEX7ovOfaH+ZDh4IMr8Vb/0KlnTtW9jOGx
 Dy0/dqEamoeYMq7FZX/6JQJCrap8O4OYfb8z4EwyoLswov/HayqbAiZO1LJpXktK83OZ
 Z0uQ39sPpBMqNNZz2IOuJkc4H4Xfs1u1MWDCBVzoXSX+2ix2hIWJDmrNPKu90PiBE8ZI
 7QJg==
X-Gm-Message-State: AOAM5323cC0Zpscfa/lSu1QLEdrATcjokB9ykOiPyzXcocciLiPt6gko
 4BAU2GqA/y+pdmC72ZTP+ZY2GSIGQk/KjTINJWlBEA==
X-Google-Smtp-Source: ABdhPJx4ZMil7KcF9WHeSOD7rwGeH9GMRYuU6TJA6G4D+9mryjqrkeAibiz1fIlGt4x0HF4D/rI7bw==
X-Received: by 2002:ac2:47f1:0:b0:479:7517:d41 with SMTP id
 b17-20020ac247f1000000b0047975170d41mr1440176lfp.254.1654628291221; 
 Tue, 07 Jun 2022 11:58:11 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 d19-20020a2eb053000000b0025587b872cesm1611668ljl.70.2022.06.07.11.58.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 11:58:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v1 3/7] drm/msm/hdmi: drop unused GPIO support
Date: Tue,  7 Jun 2022 21:58:02 +0300
Message-Id: <20220607185806.2771739-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220607185806.2771739-1-dmitry.baryshkov@linaro.org>
References: <20220607185806.2771739-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, David Heidelberg <david@ixit.cz>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The HDMI driver has code to configure extra GPIOs, which predates
pinctrl support. Nowadays all platforms should use pinctrl instead.
Neither of upstreamed Qualcomm pltforms uses these properties, so it's
safe to drop them.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c     | 61 +++++-----------------------
 drivers/gpu/drm/msm/hdmi/hdmi.h     | 13 +-----
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c | 62 ++---------------------------
 3 files changed, 17 insertions(+), 119 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index cf24e68864ba..6a22d6977ead 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -406,20 +406,6 @@ static struct hdmi_platform_config hdmi_tx_8996_config = {
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
@@ -531,7 +517,7 @@ static int msm_hdmi_bind(struct device *dev, struct device *master, void *data)
 	struct hdmi_platform_config *hdmi_cfg;
 	struct hdmi *hdmi;
 	struct device_node *of_node = dev->of_node;
-	int i, err;
+	int err;
 
 	hdmi_cfg = (struct hdmi_platform_config *)
 			of_device_get_match_data(dev);
@@ -543,41 +529,16 @@ static int msm_hdmi_bind(struct device *dev, struct device *master, void *data)
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
+	hdmi->hpd_gpiod = devm_gpiod_get_optional(dev, "hpd", GPIOD_IN);
+	/* This will catch e.g. -PROBE_DEFER */
+	if (IS_ERR(hdmi->hpd_gpiod))
+		return PTR_ERR(hdmi->hpd_gpiod);
+
+	if (!hdmi->hpd_gpiod)
+		DBG("failed to get HPD gpio");
+
+	if (hdmi->hpd_gpiod)
+		gpiod_set_consumer_name(hdmi->hpd_gpiod, "HDMI_HPD");
 
 	dev->platform_data = hdmi_cfg;
 
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

