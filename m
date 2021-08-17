Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4ED3EE290
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 03:30:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A116E0CC;
	Tue, 17 Aug 2021 01:30:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09A626E0B8
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 01:30:27 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id n7so30327275ljq.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 18:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gwm4vp8rjsWjjGf8PWBUulpfDpYNBiPAbn25BacEPVI=;
 b=Fy8KLmK2MoY/leSpwNqjHGVp48kRMOP+zK0R/VkPTKJXa6g4LXq1IAxsbBdgx9XyB2
 Lm4fBoFQcvh6TRV/uZuzuZrJi61xAAxe5uZzXfbyRE4HzXVVCesvQKmQyKka5icgdAQg
 MYbGj85PiqGMJ/wZC6EhwGoa6Rat5q0i6TVwuVOVlBnh1N/GcJcDHbYmk84r/2gXwltl
 fpYjeSZBD7Ghuug6wq9nQLucom+sLNoQszbwctdjOH9VNzyM1rB2+B7VCbl6Wfo5feu9
 8rNpaujmlpMX+klV4qjnKV2TL7Vip/w2/yIJG8wYoKXgY5BTp+hRDzT8uEsG0CUu+mYz
 io5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gwm4vp8rjsWjjGf8PWBUulpfDpYNBiPAbn25BacEPVI=;
 b=C//IpdLgijp19ryfmkJKG1NiLJ0TWxjuf7yHOpXpbPHyY1IntD5y4fWtS6cbwmPrDV
 4eyrngGO0y7ygPA1vSpyIqHNbVtbDWeXfc7qpGWMZE0ndaM5/49z0qvAe9rNPhXn67Ja
 zQ5iuj8QFrCI+IQv9O4M4NjGPuUwh8Oem+m2AlSnkBg5NT7wD6b3LcTDI/z5Z0/rSItF
 /xfcYZp1cf1q7WKW0StOMbaiQZjsrdQseLslTJRRyhEuDbO4XifVhK8NoOtFL5hfxnF2
 ij89gZltkmI6FXMC9UiL9+t5mDOqGnRaxF8PP7hJ/wivCVYeUgvCSWeYqp+GmCASKruL
 OYpw==
X-Gm-Message-State: AOAM532sgVk2o5mnxn1A788tCtk5aKFlSsiVB0aBUop43kRmXyyhOt0h
 LHPKyzBfO4N/Itxufz8UT5A=
X-Google-Smtp-Source: ABdhPJy+goByVOHZLAqSVCo0afpBXrtrvBCR0ezq6OWZlwehQ2YkImXl+HsmkceKK7965D+ImAdEuQ==
X-Received: by 2002:a05:651c:118:: with SMTP id
 a24mr878911ljb.158.1629163825346; 
 Mon, 16 Aug 2021 18:30:25 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.gmail.com with ESMTPSA id g30sm46607lfj.298.2021.08.16.18.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 18:30:25 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: [PATCH v8 20/34] mmc: sdhci-tegra: Add runtime PM and OPP support
Date: Tue, 17 Aug 2021 04:27:40 +0300
Message-Id: <20210817012754.8710-21-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817012754.8710-1-digetx@gmail.com>
References: <20210817012754.8710-1-digetx@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The SDHCI on Tegra belongs to the core power domain and we're going to
enable GENPD support for the core domain. Now SDHCI must be resumed using
runtime PM API in order to initialize the SDHCI power state. The SDHCI
clock rate must be changed using OPP API that will reconfigure the power
domain performance state in accordance to the rate. Add runtime PM and OPP
support to the SDHCI driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/mmc/host/sdhci-tegra.c | 146 ++++++++++++++++++++++++---------
 1 file changed, 105 insertions(+), 41 deletions(-)

diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
index 387ce9cdbd7c..a3583359c972 100644
--- a/drivers/mmc/host/sdhci-tegra.c
+++ b/drivers/mmc/host/sdhci-tegra.c
@@ -15,6 +15,8 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/pinctrl/consumer.h>
+#include <linux/pm_opp.h>
+#include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/mmc/card.h>
@@ -24,6 +26,8 @@
 #include <linux/gpio/consumer.h>
 #include <linux/ktime.h>
 
+#include <soc/tegra/common.h>
+
 #include "sdhci-pltfm.h"
 #include "cqhci.h"
 
@@ -123,6 +127,12 @@
 					 SDHCI_TRNS_BLK_CNT_EN | \
 					 SDHCI_TRNS_DMA)
 
+enum {
+	TEGRA_CLK_BULK_SDHCI,
+	TEGRA_CLK_BULK_TMCLK,
+	TEGRA_CLK_BULK_NUM,
+};
+
 struct sdhci_tegra_soc_data {
 	const struct sdhci_pltfm_data *pdata;
 	u64 dma_mask;
@@ -171,6 +181,8 @@ struct sdhci_tegra {
 	bool enable_hwcq;
 	unsigned long curr_clk_rate;
 	u8 tuned_tap_delay;
+
+	struct clk_bulk_data clocks[TEGRA_CLK_BULK_NUM];
 };
 
 static u16 tegra_sdhci_readw(struct sdhci_host *host, int reg)
@@ -758,10 +770,15 @@ static void tegra_sdhci_set_clock(struct sdhci_host *host, unsigned int clock)
 {
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
 	struct sdhci_tegra *tegra_host = sdhci_pltfm_priv(pltfm_host);
+	struct device *dev = mmc_dev(host->mmc);
 	unsigned long host_clk;
+	int err;
 
-	if (!clock)
-		return sdhci_set_clock(host, clock);
+	if (!clock) {
+		sdhci_set_clock(host, clock);
+		dev_pm_opp_set_rate(dev, clock);
+		return;
+	}
 
 	/*
 	 * In DDR50/52 modes the Tegra SDHCI controllers require the SDHCI
@@ -776,7 +793,12 @@ static void tegra_sdhci_set_clock(struct sdhci_host *host, unsigned int clock)
 	 * from clk_get_rate() is used.
 	 */
 	host_clk = tegra_host->ddr_signaling ? clock * 2 : clock;
-	clk_set_rate(pltfm_host->clk, host_clk);
+
+	err = dev_pm_opp_set_rate(dev, host_clk);
+	if (err)
+		dev_err(dev, "failed to set clk rate to %luHz: %d\n",
+			host_clk, err);
+
 	tegra_host->curr_clk_rate = host_clk;
 	if (tegra_host->ddr_signaling)
 		host->max_clk = host_clk;
@@ -1653,6 +1675,21 @@ static int sdhci_tegra_probe(struct platform_device *pdev)
 		goto err_power_req;
 	}
 
+	tegra_host->clocks[TEGRA_CLK_BULK_SDHCI].id = NULL;
+	tegra_host->clocks[TEGRA_CLK_BULK_TMCLK].id = "tmclk";
+
+	rc = devm_clk_bulk_get_optional(&pdev->dev, TEGRA_CLK_BULK_NUM,
+					tegra_host->clocks);
+
+	/* controller clock is mandatory */
+	if (!rc && !tegra_host->clocks[TEGRA_CLK_BULK_SDHCI].clk)
+		rc = -ENOENT;
+
+	if (rc) {
+		dev_err_probe(&pdev->dev, rc, "failed to get clock\n");
+		goto err_power_req;
+	}
+
 	/*
 	 * Tegra210 has a separate SDMMC_LEGACY_TM clock used for host
 	 * timeout clock and SW can choose TMCLK or SDCLK for hardware
@@ -1669,34 +1706,19 @@ static int sdhci_tegra_probe(struct platform_device *pdev)
 	 */
 
 	if (soc_data->nvquirks & NVQUIRK_HAS_TMCLK) {
-		clk = devm_clk_get(&pdev->dev, "tmclk");
-		if (IS_ERR(clk)) {
-			rc = PTR_ERR(clk);
-			if (rc == -EPROBE_DEFER)
-				goto err_power_req;
-
-			dev_warn(&pdev->dev, "failed to get tmclk: %d\n", rc);
-			clk = NULL;
-		}
+		clk = tegra_host->clocks[TEGRA_CLK_BULK_TMCLK].clk;
+		if (!clk)
+			dev_warn(&pdev->dev, "failed to get tmclk");
 
 		clk_set_rate(clk, 12000000);
-		rc = clk_prepare_enable(clk);
-		if (rc) {
-			dev_err(&pdev->dev,
-				"failed to enable tmclk: %d\n", rc);
-			goto err_power_req;
-		}
-
-		tegra_host->tmclk = clk;
 	}
 
-	clk = devm_clk_get(mmc_dev(host->mmc), NULL);
-	if (IS_ERR(clk)) {
-		rc = dev_err_probe(&pdev->dev, PTR_ERR(clk),
-				   "failed to get clock\n");
-		goto err_clk_get;
+	clk = tegra_host->clocks[TEGRA_CLK_BULK_SDHCI].clk;
+	if (!clk) {
+		dev_err(&pdev->dev, "failed to get sdhci clock\n");
+		rc = -ENOENT;
+		goto err_power_req;
 	}
-	clk_prepare_enable(clk);
 	pltfm_host->clk = clk;
 
 	tegra_host->rst = devm_reset_control_get_exclusive(&pdev->dev,
@@ -1704,9 +1726,18 @@ static int sdhci_tegra_probe(struct platform_device *pdev)
 	if (IS_ERR(tegra_host->rst)) {
 		rc = PTR_ERR(tegra_host->rst);
 		dev_err(&pdev->dev, "failed to get reset control: %d\n", rc);
-		goto err_rst_get;
+		goto err_power_req;
 	}
 
+	rc = devm_tegra_core_dev_init_opp_table_simple(&pdev->dev);
+	if (rc)
+		goto err_power_req;
+
+	pm_runtime_enable(&pdev->dev);
+	rc = pm_runtime_resume_and_get(&pdev->dev);
+	if (rc)
+		goto err_pm_get;
+
 	rc = reset_control_assert(tegra_host->rst);
 	if (rc)
 		goto err_rst_get;
@@ -1728,9 +1759,9 @@ static int sdhci_tegra_probe(struct platform_device *pdev)
 err_add_host:
 	reset_control_assert(tegra_host->rst);
 err_rst_get:
-	clk_disable_unprepare(pltfm_host->clk);
-err_clk_get:
-	clk_disable_unprepare(tegra_host->tmclk);
+	pm_runtime_put(&pdev->dev);
+err_pm_get:
+	pm_runtime_disable(&pdev->dev);
 err_power_req:
 err_parse_dt:
 	sdhci_pltfm_free(pdev);
@@ -1747,19 +1778,44 @@ static int sdhci_tegra_remove(struct platform_device *pdev)
 
 	reset_control_assert(tegra_host->rst);
 	usleep_range(2000, 4000);
-	clk_disable_unprepare(pltfm_host->clk);
-	clk_disable_unprepare(tegra_host->tmclk);
+
+	pm_runtime_put(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
 
 	sdhci_pltfm_free(pdev);
 
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
-static int __maybe_unused sdhci_tegra_suspend(struct device *dev)
+static int __maybe_unused sdhci_tegra_runtime_suspend(struct device *dev)
+{
+	struct sdhci_host *host = dev_get_drvdata(dev);
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_tegra *tegra_host = sdhci_pltfm_priv(pltfm_host);
+
+	clk_bulk_disable_unprepare(TEGRA_CLK_BULK_NUM, tegra_host->clocks);
+
+	return 0;
+}
+
+static int __maybe_unused sdhci_tegra_runtime_resume(struct device *dev)
 {
 	struct sdhci_host *host = dev_get_drvdata(dev);
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_tegra *tegra_host = sdhci_pltfm_priv(pltfm_host);
+	int err;
+
+	err = dev_pm_opp_sync(dev);
+	if (err)
+		return err;
+
+	return clk_bulk_prepare_enable(TEGRA_CLK_BULK_NUM, tegra_host->clocks);
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int sdhci_tegra_suspend(struct device *dev)
+{
+	struct sdhci_host *host = dev_get_drvdata(dev);
 	int ret;
 
 	if (host->mmc->caps2 & MMC_CAP2_CQE) {
@@ -1774,17 +1830,22 @@ static int __maybe_unused sdhci_tegra_suspend(struct device *dev)
 		return ret;
 	}
 
-	clk_disable_unprepare(pltfm_host->clk);
+	ret = pm_runtime_force_suspend(dev);
+	if (ret) {
+		sdhci_resume_host(host);
+		cqhci_resume(host->mmc);
+		return ret;
+	}
+
 	return 0;
 }
 
-static int __maybe_unused sdhci_tegra_resume(struct device *dev)
+static int sdhci_tegra_resume(struct device *dev)
 {
 	struct sdhci_host *host = dev_get_drvdata(dev);
-	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
 	int ret;
 
-	ret = clk_prepare_enable(pltfm_host->clk);
+	ret = pm_runtime_force_resume(dev);
 	if (ret)
 		return ret;
 
@@ -1803,13 +1864,16 @@ static int __maybe_unused sdhci_tegra_resume(struct device *dev)
 suspend_host:
 	sdhci_suspend_host(host);
 disable_clk:
-	clk_disable_unprepare(pltfm_host->clk);
+	pm_runtime_force_suspend(dev);
 	return ret;
 }
 #endif
 
-static SIMPLE_DEV_PM_OPS(sdhci_tegra_dev_pm_ops, sdhci_tegra_suspend,
-			 sdhci_tegra_resume);
+static const struct dev_pm_ops sdhci_tegra_dev_pm_ops = {
+	SET_RUNTIME_PM_OPS(sdhci_tegra_runtime_suspend, sdhci_tegra_runtime_resume,
+			   NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(sdhci_tegra_suspend, sdhci_tegra_resume)
+};
 
 static struct platform_driver sdhci_tegra_driver = {
 	.driver		= {
-- 
2.32.0

