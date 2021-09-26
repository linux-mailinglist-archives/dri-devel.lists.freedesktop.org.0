Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E24F418BEA
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 00:43:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC5086E5D1;
	Sun, 26 Sep 2021 22:42:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB7B16E5B4
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Sep 2021 22:42:48 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id e15so68611681lfr.10
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Sep 2021 15:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TplqdteIbqpMA+cRsM4zt2txSdRrivaAa9SZu7q2V5k=;
 b=DT8SqkTx9xz6k5lBqurvLVNFLdDdNs18xHEmnjZRBgAU1JSad+bgMJ81V3A4GmsmTZ
 XowmCira9qNyl8dSJVMy/CQy5BcPRZhPsuaAFiu1jL+qX/a5eYq2O+sQc7xSfauFkP4m
 +pn2x9DI/qGMzxHWuTKSB+M18jvc1+XJaBhC0YuMgopcrO0gn/8p6tvkSyfDLx93MaOx
 qYRNA8NToNmautjcGGBRmv4GKJFBj6OsUDIAu7dXCDn704AXf/iCp0Sr82+qnR3FufLx
 PrZkoA1pl/W18qvaRpoqzCfJZzgnN2nvFdueq1mSh2rjjCQLbwpO0RJnPPH2g2WgZ0Hm
 IHkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TplqdteIbqpMA+cRsM4zt2txSdRrivaAa9SZu7q2V5k=;
 b=RvXTOmDvjKspHrTbzdu/Vixdi7IVjbk7pwbRC1AHiiVuzVAHugr0EHRYXa2WfZgflc
 JH/fEc6H2taShr+J22k1GNlLRkyWptSAow6bvxOXWinHtRTWy/NJQ9B8dDWYQY0B9HZs
 9zseLLgHkGn48PQHgIAJsw8y1p0e8HmTBuZxUsH6mA+sJTthZRUQaJitJAMtMz7yvfYN
 3Yfba9oV/FJ7lTirPR/iFSAZ814pAO2EXdk+oN4etmoTR2/0val5BEZ+dacqdJfx5oBi
 IJBvC6hOpNzW/3DsTCS/XCJmGrcjudfx5C0t1s82NmrLZqMALQWA4b2AJ1IMf2c95Dx6
 4aGw==
X-Gm-Message-State: AOAM532xKh+JHXYZCFROfKAFDRh5GT3gpnn6d+a718UTnfSORvk3L4cX
 EaEiJ9doqgw9tZxORcVfjUo=
X-Google-Smtp-Source: ABdhPJwlAUBpizVFZGBDDXF0eyht6X+0wdQr4/CTF3bROuR6FynrfMDO6KQYCL2y/DdbHgZuQiB3yw==
X-Received: by 2002:a05:6512:750:: with SMTP id
 c16mr21689714lfs.21.1632696167148; 
 Sun, 26 Sep 2021 15:42:47 -0700 (PDT)
Received: from localhost.localdomain (46-138-80-108.dynamic.spd-mgts.ru.
 [46.138.80.108])
 by smtp.gmail.com with ESMTPSA id m10sm1408899lfr.272.2021.09.26.15.42.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:42:46 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org,
 linux-mmc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 David Heidelberg <david@ixit.cz>
Subject: [PATCH v13 18/35] pwm: tegra: Add runtime PM and OPP support
Date: Mon, 27 Sep 2021 01:40:41 +0300
Message-Id: <20210926224058.1252-19-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210926224058.1252-1-digetx@gmail.com>
References: <20210926224058.1252-1-digetx@gmail.com>
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

The PWM on Tegra belongs to the core power domain and we're going to
enable GENPD support for the core domain. Now PWM must be resumed using
runtime PM API in order to initialize the PWM power state. The PWM clock
rate must be changed using OPP API that will reconfigure the power domain
performance state in accordance to the rate. Add runtime PM and OPP
support to the PWM driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/pwm/pwm-tegra.c | 88 ++++++++++++++++++++++++++++++++---------
 1 file changed, 70 insertions(+), 18 deletions(-)

diff --git a/drivers/pwm/pwm-tegra.c b/drivers/pwm/pwm-tegra.c
index 11a10b575ace..afb5ecde007e 100644
--- a/drivers/pwm/pwm-tegra.c
+++ b/drivers/pwm/pwm-tegra.c
@@ -42,12 +42,16 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/pm_opp.h>
 #include <linux/pwm.h>
 #include <linux/platform_device.h>
 #include <linux/pinctrl/consumer.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/reset.h>
 
+#include <soc/tegra/common.h>
+
 #define PWM_ENABLE	(1 << 31)
 #define PWM_DUTY_WIDTH	8
 #define PWM_DUTY_SHIFT	16
@@ -145,7 +149,7 @@ static int tegra_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 		required_clk_rate =
 			(NSEC_PER_SEC / period_ns) << PWM_DUTY_WIDTH;
 
-		err = clk_set_rate(pc->clk, required_clk_rate);
+		err = dev_pm_opp_set_rate(pc->dev, required_clk_rate);
 		if (err < 0)
 			return -EINVAL;
 
@@ -181,8 +185,8 @@ static int tegra_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	 * before writing the register. Otherwise, keep it enabled.
 	 */
 	if (!pwm_is_enabled(pwm)) {
-		err = clk_prepare_enable(pc->clk);
-		if (err < 0)
+		err = pm_runtime_resume_and_get(pc->dev);
+		if (err)
 			return err;
 	} else
 		val |= PWM_ENABLE;
@@ -193,7 +197,7 @@ static int tegra_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	 * If the PWM is not enabled, turn the clock off again to save power.
 	 */
 	if (!pwm_is_enabled(pwm))
-		clk_disable_unprepare(pc->clk);
+		pm_runtime_put(pc->dev);
 
 	return 0;
 }
@@ -204,8 +208,8 @@ static int tegra_pwm_enable(struct pwm_chip *chip, struct pwm_device *pwm)
 	int rc = 0;
 	u32 val;
 
-	rc = clk_prepare_enable(pc->clk);
-	if (rc < 0)
+	rc = pm_runtime_resume_and_get(pc->dev);
+	if (rc)
 		return rc;
 
 	val = pwm_readl(pc, pwm->hwpwm);
@@ -224,7 +228,7 @@ static void tegra_pwm_disable(struct pwm_chip *chip, struct pwm_device *pwm)
 	val &= ~PWM_ENABLE;
 	pwm_writel(pc, pwm->hwpwm, val);
 
-	clk_disable_unprepare(pc->clk);
+	pm_runtime_put_sync(pc->dev);
 }
 
 static const struct pwm_ops tegra_pwm_ops = {
@@ -256,11 +260,23 @@ static int tegra_pwm_probe(struct platform_device *pdev)
 	if (IS_ERR(pwm->clk))
 		return PTR_ERR(pwm->clk);
 
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = devm_tegra_core_dev_init_opp_table_common(&pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret)
+		return ret;
+
 	/* Set maximum frequency of the IP */
-	ret = clk_set_rate(pwm->clk, pwm->soc->max_frequency);
+	ret = dev_pm_opp_set_rate(pwm->dev, pwm->soc->max_frequency);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Failed to set max frequency: %d\n", ret);
-		return ret;
+		goto put_pm;
 	}
 
 	/*
@@ -278,7 +294,7 @@ static int tegra_pwm_probe(struct platform_device *pdev)
 	if (IS_ERR(pwm->rst)) {
 		ret = PTR_ERR(pwm->rst);
 		dev_err(&pdev->dev, "Reset control is not found: %d\n", ret);
-		return ret;
+		goto put_pm;
 	}
 
 	reset_control_deassert(pwm->rst);
@@ -291,34 +307,67 @@ static int tegra_pwm_probe(struct platform_device *pdev)
 	if (ret < 0) {
 		dev_err(&pdev->dev, "pwmchip_add() failed: %d\n", ret);
 		reset_control_assert(pwm->rst);
-		return ret;
+		goto put_pm;
 	}
 
+	pm_runtime_put(&pdev->dev);
+
 	return 0;
+put_pm:
+	pm_runtime_put(&pdev->dev);
+	return ret;
 }
 
 static int tegra_pwm_remove(struct platform_device *pdev)
 {
 	struct tegra_pwm_chip *pc = platform_get_drvdata(pdev);
+	int err;
 
 	pwmchip_remove(&pc->chip);
 
+	err = pm_runtime_resume_and_get(pc->dev);
+	if (err)
+		return err;
+
 	reset_control_assert(pc->rst);
+	pm_runtime_put(pc->dev);
 
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
-static int tegra_pwm_suspend(struct device *dev)
+static int __maybe_unused tegra_pwm_runtime_suspend(struct device *dev)
 {
-	return pinctrl_pm_select_sleep_state(dev);
+	struct tegra_pwm_chip *pc = dev_get_drvdata(dev);
+	int err;
+
+	clk_disable_unprepare(pc->clk);
+
+	err = pinctrl_pm_select_sleep_state(dev);
+	if (err) {
+		clk_prepare_enable(pc->clk);
+		return err;
+	}
+
+	return 0;
 }
 
-static int tegra_pwm_resume(struct device *dev)
+static int __maybe_unused tegra_pwm_runtime_resume(struct device *dev)
 {
-	return pinctrl_pm_select_default_state(dev);
+	struct tegra_pwm_chip *pc = dev_get_drvdata(dev);
+	int err;
+
+	err = pinctrl_pm_select_default_state(dev);
+	if (err)
+		return err;
+
+	err = clk_prepare_enable(pc->clk);
+	if (err) {
+		pinctrl_pm_select_sleep_state(dev);
+		return err;
+	}
+
+	return 0;
 }
-#endif
 
 static const struct tegra_pwm_soc tegra20_pwm_soc = {
 	.num_channels = 4,
@@ -344,7 +393,10 @@ static const struct of_device_id tegra_pwm_of_match[] = {
 MODULE_DEVICE_TABLE(of, tegra_pwm_of_match);
 
 static const struct dev_pm_ops tegra_pwm_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(tegra_pwm_suspend, tegra_pwm_resume)
+	SET_RUNTIME_PM_OPS(tegra_pwm_runtime_suspend, tegra_pwm_runtime_resume,
+			   NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
 };
 
 static struct platform_driver tegra_pwm_driver = {
-- 
2.32.0

