Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 974BA2A78F2
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:21:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A7BD6EA0D;
	Thu,  5 Nov 2020 08:20:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD5B16E852
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 23:45:22 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id 23so300836ljv.7
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 15:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tYmWkaHosByI64aAoFLlLhjUXs+kckBxEWCVl+oFpnc=;
 b=cTrA1BoDRRykWx9zrvi5obCOxdvzunJb1sNBzUS/mcjrUtEa0+OzONd+O15pGvdZ0z
 zBeH778gsYKpZq7LRWlM5Vt1qWg20PxNUNt+/Lo6XsZZ6IkpZ4J/oi07gvnEN5zw0V2g
 hDv6oetsgS1Flk+b2d7xMVPsKRtN0xrZ0ZbREvLURa2UCDa0InHRAL3btrYjlBHrQf9x
 kab0o7jG9XmfeqisiGfq9zO8Eku/FIApF0E/cp6z/UTnE9ZCvjpmwu7ZmMdmC2/OcSts
 FLwsPBTrlhfC/v/RcZ5Aw9Wvv9Fbo9xc4HLrPGRT6zaGcrg2jicEtdmO54vZ7kS60J68
 bqOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tYmWkaHosByI64aAoFLlLhjUXs+kckBxEWCVl+oFpnc=;
 b=O6QtBZI9SZao/A+WNeSjydNm+AObmEsYcjo1NYjK7r5kGto2sjhL5jlnk5UNjag5kn
 BclWzf7Wbn65PSOYauxvi6udhwCR4Ur5lh0CG7z4iuqR8kkAGWQqdTTQPnUFgE89b5go
 Ni1TGsQ/JM4Ha3yrmJVzTIsfq2lGB01xDRH+9jgYo22Gvtjd1Sl2bZC36FL8sw3P/qDb
 aQHgDfsHvqGr7Ei6O1icLLYICmDUmGwp+X2GpKmNdCAnWJVUIF0oNlm2Fufxp26Gu3Lf
 mYT0sO66AAkwkXVeH8NbRvz09LjrVnk1tplY1wOs/2KeZCws+akEWYAxYFy0Zfppxn9B
 2xYw==
X-Gm-Message-State: AOAM531e+Ujkm0r7pE6N0LHkSWR+Un2ZfL+MsG7v5bi4xo/9Nlsh7GkT
 EK9ie6qMIqw3Rz5pn7DZbpQ=
X-Google-Smtp-Source: ABdhPJzB7OlTS2WBx4RcVvxyMeKXhRQqSie6w2ltFjOQXHq4Xe9ynHa2INELgNdxnVC+IqPTlugvxQ==
X-Received: by 2002:a2e:7018:: with SMTP id l24mr134995ljc.313.1604533521220; 
 Wed, 04 Nov 2020 15:45:21 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.gmail.com with ESMTPSA id m6sm640725ljc.112.2020.11.04.15.45.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 15:45:20 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Alan Stern <stern@rowland.harvard.edu>, Peter Chen <Peter.Chen@nxp.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Peter Geis <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>
Subject: [PATCH v1 18/30] pwm: tegra: Support OPP and core voltage scaling
Date: Thu,  5 Nov 2020 02:44:15 +0300
Message-Id: <20201104234427.26477-19-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201104234427.26477-1-digetx@gmail.com>
References: <20201104234427.26477-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 05 Nov 2020 08:20:02 +0000
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
Cc: devel@driverdev.osuosl.org, linux-pwm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add OPP and SoC core voltage scaling support to the Tegra PWM driver.
This is required for enabling system-wide DVFS on older Tegra SoCs.

Tested-by: Peter Geis <pgwipeout@gmail.com>
Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/pwm/Kconfig     |  1 +
 drivers/pwm/pwm-tegra.c | 84 +++++++++++++++++++++++++++++++++++++++--
 2 files changed, 82 insertions(+), 3 deletions(-)

diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index 63be5362fd3a..61d35ef759f2 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -509,6 +509,7 @@ config PWM_SUN4I
 config PWM_TEGRA
 	tristate "NVIDIA Tegra PWM support"
 	depends on ARCH_TEGRA || COMPILE_TEST
+	select PM_OPP
 	help
 	  Generic PWM framework driver for the PWFM controller found on NVIDIA
 	  Tegra SoCs.
diff --git a/drivers/pwm/pwm-tegra.c b/drivers/pwm/pwm-tegra.c
index 1daf591025c0..96c253127ff3 100644
--- a/drivers/pwm/pwm-tegra.c
+++ b/drivers/pwm/pwm-tegra.c
@@ -42,12 +42,15 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/pm_opp.h>
 #include <linux/pwm.h>
 #include <linux/platform_device.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/slab.h>
 #include <linux/reset.h>
 
+#include <soc/tegra/common.h>
+
 #define PWM_ENABLE	(1 << 31)
 #define PWM_DUTY_WIDTH	8
 #define PWM_DUTY_SHIFT	16
@@ -145,7 +148,7 @@ static int tegra_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 		required_clk_rate =
 			(NSEC_PER_SEC / period_ns) << PWM_DUTY_WIDTH;
 
-		err = clk_set_rate(pc->clk, required_clk_rate);
+		err = dev_pm_opp_set_rate(pc->dev, required_clk_rate);
 		if (err < 0)
 			return -EINVAL;
 
@@ -181,6 +184,10 @@ static int tegra_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	 * before writing the register. Otherwise, keep it enabled.
 	 */
 	if (!pwm_is_enabled(pwm)) {
+		err = dev_pm_opp_set_rate(pc->dev, pc->clk_rate);
+		if (err < 0)
+			return err;
+
 		err = clk_prepare_enable(pc->clk);
 		if (err < 0)
 			return err;
@@ -191,9 +198,12 @@ static int tegra_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 
 	/*
 	 * If the PWM is not enabled, turn the clock off again to save power.
+	 * Remove OPP performance/voltage vote after disabling the clock.
 	 */
-	if (!pwm_is_enabled(pwm))
+	if (!pwm_is_enabled(pwm)) {
 		clk_disable_unprepare(pc->clk);
+		dev_pm_opp_set_rate(pc->dev, 0);
+	}
 
 	return 0;
 }
@@ -204,6 +214,10 @@ static int tegra_pwm_enable(struct pwm_chip *chip, struct pwm_device *pwm)
 	int rc = 0;
 	u32 val;
 
+	rc = dev_pm_opp_set_rate(pc->dev, pc->clk_rate);
+	if (rc < 0)
+		return rc;
+
 	rc = clk_prepare_enable(pc->clk);
 	if (rc < 0)
 		return rc;
@@ -225,6 +239,7 @@ static void tegra_pwm_disable(struct pwm_chip *chip, struct pwm_device *pwm)
 	pwm_writel(pc, pwm->hwpwm, val);
 
 	clk_disable_unprepare(pc->clk);
+	dev_pm_opp_set_rate(pc->dev, 0);
 }
 
 static const struct pwm_ops tegra_pwm_ops = {
@@ -234,6 +249,60 @@ static const struct pwm_ops tegra_pwm_ops = {
 	.owner = THIS_MODULE,
 };
 
+static void tegra_pwm_deinit_opp_table(void *data)
+{
+	struct device *dev = data;
+	struct opp_table *opp_table;
+
+	opp_table = dev_pm_opp_get_opp_table(dev);
+	dev_pm_opp_of_remove_table(dev);
+	dev_pm_opp_put_regulators(opp_table);
+	dev_pm_opp_put_opp_table(opp_table);
+}
+
+static int devm_tegra_pwm_init_opp_table(struct device *dev)
+{
+	struct opp_table *opp_table;
+	const char *rname = "core";
+	int err;
+
+	/* voltage scaling is optional */
+	if (device_property_present(dev, "core-supply"))
+		opp_table = dev_pm_opp_set_regulators(dev, &rname, 1);
+	else
+		opp_table = dev_pm_opp_get_opp_table(dev);
+
+	if (IS_ERR(opp_table))
+		return dev_err_probe(dev, PTR_ERR(opp_table),
+				     "failed to prepare OPP table\n");
+
+	/*
+	 * OPP table presence is optional and we want the set_rate() of OPP
+	 * API to work similarly to clk_set_rate() if table is missing in a
+	 * device-tree.  The add_table() errors out if OPP is missing in DT.
+	 */
+	if (device_property_present(dev, "operating-points-v2")) {
+		err = dev_pm_opp_of_add_table(dev);
+		if (err) {
+			dev_err(dev, "failed to add OPP table: %d\n", err);
+			goto put_table;
+		}
+	}
+
+	err = devm_add_action(dev, tegra_pwm_deinit_opp_table, dev);
+	if (err)
+		goto remove_table;
+
+	return 0;
+
+remove_table:
+	dev_pm_opp_of_remove_table(dev);
+put_table:
+	dev_pm_opp_put_regulators(opp_table);
+
+	return err;
+}
+
 static int tegra_pwm_probe(struct platform_device *pdev)
 {
 	struct tegra_pwm_chip *pwm;
@@ -258,8 +327,12 @@ static int tegra_pwm_probe(struct platform_device *pdev)
 	if (IS_ERR(pwm->clk))
 		return PTR_ERR(pwm->clk);
 
+	ret = devm_tegra_pwm_init_opp_table(&pdev->dev);
+	if (ret)
+		return ret;
+
 	/* Set maximum frequency of the IP */
-	ret = clk_set_rate(pwm->clk, pwm->soc->max_frequency);
+	ret = dev_pm_opp_set_rate(pwm->dev, pwm->soc->max_frequency);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Failed to set max frequency: %d\n", ret);
 		return ret;
@@ -309,6 +382,10 @@ static int tegra_pwm_remove(struct platform_device *pdev)
 	if (WARN_ON(!pc))
 		return -ENODEV;
 
+	err = dev_pm_opp_set_rate(pc->dev, pc->clk_rate);
+	if (err < 0)
+		return err;
+
 	err = clk_prepare_enable(pc->clk);
 	if (err < 0)
 		return err;
@@ -375,6 +452,7 @@ static struct platform_driver tegra_pwm_driver = {
 		.name = "tegra-pwm",
 		.of_match_table = tegra_pwm_of_match,
 		.pm = &tegra_pwm_pm_ops,
+		.sync_state = tegra_soc_device_sync_state,
 	},
 	.probe = tegra_pwm_probe,
 	.remove = tegra_pwm_remove,
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
