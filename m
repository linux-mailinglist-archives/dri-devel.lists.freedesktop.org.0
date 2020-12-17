Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B88422DDFAF
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:33:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B90D889B96;
	Fri, 18 Dec 2020 08:32:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78A026E1E8
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 18:08:05 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id o13so36636269lfr.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NPg1w2DR5eMyAkXLEYAgM0DhmSswmR16R9xg6OBJrEU=;
 b=nkF+iMWd2D18LAmBTCIwtU2mDZP0zXq/sXeXggWmstD6smNexa3bjchhTfshiS0o7G
 oLmwg4S9HtO3XjPOisi7BhMGg26lEhHKo/YWrSj7HE5KivqNjiVWzCOW1twz3Sfp8J1S
 3/lWxgEbnzxealoOjdtEXsX8Zkk6OpCeXCVFcHODsG21x3GZLaG92URbYAdfC6ssy6kf
 24fqZNlBZ9PlaEzwlE9BKKqUQN19NM4OCSHMhh6Zi0hu/YoacfRo9zQbjJ8w1/YKo6oU
 Jxk2BMt5NmCVaUAsH4RrrdWJxIcnODKZ7qgUOVVzfjxcNwXjuEj+GTt4s7ORwuqoGVtU
 H/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NPg1w2DR5eMyAkXLEYAgM0DhmSswmR16R9xg6OBJrEU=;
 b=MjOfABRc2XpgKpOhCoRlRDmG4ckpkoXmR6S3P3Duc6lnWUZpAtyFYm5Ms1N+WvT+Pq
 6Yxlu9zIJ0ybTxiHaT6kATYe7c8G9i+eaJMeQ6Na5s6BJgJuNdnrw/EYmQjI5kaJ79Zj
 eFN9Dt9TH7xbii3XrSHOC1ThyKc6TwHHv3lXSFv7QcHZtFwK3Fjz3Hsjaz0C2NIaSUp0
 bGl/wkZu8flwS8PP5jWSyWrgwhVu220OLWWdW3YcQWPlFoDjc2/AyXsiulQLBKvbCIrz
 D/HW5ZZiXlHHZveFZfP18XbPBZ58o/u3Zm+NXf7XRlzQctp6rTblnHmuMyK/yBEX8srp
 36jg==
X-Gm-Message-State: AOAM531PkvxIdCqoyvOJmogLbllGbrvbO2iWIn5Eglv3kXDIU7KiJoZ9
 ST4WrEl544FxI7P0QEInAM0=
X-Google-Smtp-Source: ABdhPJyWVspKwDFpdTG3ptSPxdKYC957uJFicjy0kWd3L0BaBe6TiemLf7O2G/UXW5M6+NeV0ma/zg==
X-Received: by 2002:a2e:3a04:: with SMTP id h4mr242567lja.156.1608228483947;
 Thu, 17 Dec 2020 10:08:03 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.08.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 10:08:03 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Kevin Hilman <khilman@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v2 38/48] drm/tegra: g3d: Support OPP and power management
Date: Thu, 17 Dec 2020 21:06:28 +0300
Message-Id: <20201217180638.22748-39-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 18 Dec 2020 08:31:48 +0000
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
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add OPP and add PM support to the GR3D driver. This is required for
enabling system-wide DVFS and supporting dynamic power management using
a generic power domain.

Tested-by: Peter Geis <pgwipeout@gmail.com>
Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/gr3d.c | 264 +++++++++++++++++++++++++++++++----
 1 file changed, 238 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gr3d.c b/drivers/gpu/drm/tegra/gr3d.c
index b0b8154e8104..11c38af584ee 100644
--- a/drivers/gpu/drm/tegra/gr3d.c
+++ b/drivers/gpu/drm/tegra/gr3d.c
@@ -10,8 +10,12 @@
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_opp.h>
+#include <linux/pm_runtime.h>
 #include <linux/reset.h>
 
+#include <soc/tegra/common.h>
 #include <soc/tegra/pmc.h>
 
 #include "drm.h"
@@ -31,6 +35,9 @@ struct gr3d {
 	struct reset_control *rst;
 
 	const struct gr3d_soc *soc;
+	struct clk_bulk_data clocks[2];
+	unsigned int nclocks;
+	bool legacy_pd;
 
 	DECLARE_BITMAP(addr_regs, GR3D_NUM_REGS);
 };
@@ -278,10 +285,120 @@ static const u32 gr3d_addr_regs[] = {
 	GR3D_GLOBAL_SAMP23SURFADDR(15),
 };
 
+static void gr3d_pm_runtime_release(void *dev)
+{
+	pm_runtime_put(dev);
+	pm_runtime_disable(dev);
+}
+
+static int gr3d_link_power_domain(struct device *dev, struct device *pd_dev)
+{
+	const u32 link_flags = DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME;
+	struct device_link *link;
+	int err;
+
+	link = device_link_add(dev, pd_dev, link_flags);
+	if (!link) {
+		dev_err(dev, "failed to link to %s\n", dev_name(pd_dev));
+		return -EINVAL;
+	}
+
+	err = devm_add_action_or_reset(dev, (void *)device_link_del, link);
+	if (err)
+		return err;
+
+	return 0;
+}
+
+static int devm_gr3d_init_power(struct device *dev, struct gr3d *gr3d)
+{
+	const char *opp_genpd_names[] = { "3d0", "3d1", NULL };
+	struct device **opp_virt_dev;
+	struct opp_table *opp_table;
+	unsigned int i, num_domains;
+	struct device *pd_dev;
+	int err;
+
+	err = of_count_phandle_with_args(dev->of_node, "power-domains",
+					 "#power-domain-cells");
+	if (err < 0) {
+		if (err != -ENOENT)
+			return err;
+
+		/*
+		 * Older device-trees don't use GENPD. In this case we should
+		 * toggle power domain manually.
+		 */
+		gr3d->legacy_pd = true;
+		goto power_up;
+	}
+
+	num_domains = err;
+
+	/*
+	 * The PM domain core automatically attaches a single power domain,
+	 * otherwise it skips attaching completely. We have a single domain
+	 * on Tegra20 and two domains on Tegra30+.
+	 */
+	if (dev->pm_domain)
+		goto power_up;
+
+	opp_table = devm_pm_opp_attach_genpd(dev, opp_genpd_names, &opp_virt_dev);
+	if (IS_ERR(opp_table))
+		return PTR_ERR(opp_table);
+
+	for (i = 0; opp_genpd_names[i]; i++) {
+		pd_dev = opp_virt_dev[i];
+		if (!pd_dev) {
+			dev_err(dev, "failed to get %s power domain\n",
+				opp_genpd_names[i]);
+			return -EINVAL;
+		}
+
+		err = gr3d_link_power_domain(dev, pd_dev);
+		if (err)
+			return err;
+	}
+
+power_up:
+	pm_runtime_enable(dev);
+	err = pm_runtime_get_sync(dev);
+	if (err < 0) {
+		gr3d_pm_runtime_release(dev);
+		return err;
+	}
+
+	err = devm_add_action_or_reset(dev, gr3d_pm_runtime_release, dev);
+	if (err)
+		return err;
+
+	return 0;
+}
+
+static int gr3d_set_opp(struct dev_pm_set_opp_data *data)
+{
+	struct gr3d *gr3d = dev_get_drvdata(data->dev);
+	unsigned int i;
+	int err;
+
+	for (i = 0; i < gr3d->nclocks; i++) {
+		err = clk_set_rate(gr3d->clocks[i].clk, data->new_opp.rate);
+		if (err) {
+			dev_err(data->dev, "failed to set %s rate to %lu: %d\n",
+				gr3d->clocks[i].id, data->new_opp.rate, err);
+			return err;
+		}
+	}
+
+	return 0;
+}
+
 static int gr3d_probe(struct platform_device *pdev)
 {
+	struct tegra_core_opp_params opp_params = {};
 	struct device_node *np = pdev->dev.of_node;
 	struct host1x_syncpt **syncpts;
+	struct opp_table *opp_table;
 	struct gr3d *gr3d;
 	unsigned int i;
 	int err;
@@ -290,6 +407,8 @@ static int gr3d_probe(struct platform_device *pdev)
 	if (!gr3d)
 		return -ENOMEM;
 
+	platform_set_drvdata(pdev, gr3d);
+
 	gr3d->soc = of_device_get_match_data(&pdev->dev);
 
 	syncpts = devm_kzalloc(&pdev->dev, sizeof(*syncpts), GFP_KERNEL);
@@ -302,7 +421,11 @@ static int gr3d_probe(struct platform_device *pdev)
 		return PTR_ERR(gr3d->clk);
 	}
 
-	gr3d->rst = devm_reset_control_get(&pdev->dev, "3d");
+	gr3d->clocks[gr3d->nclocks].id = "3d";
+	gr3d->clocks[gr3d->nclocks].clk = gr3d->clk;
+	gr3d->nclocks++;
+
+	gr3d->rst = devm_reset_control_get_exclusive_released(&pdev->dev, "3d");
 	if (IS_ERR(gr3d->rst)) {
 		dev_err(&pdev->dev, "cannot get reset\n");
 		return PTR_ERR(gr3d->rst);
@@ -315,31 +438,31 @@ static int gr3d_probe(struct platform_device *pdev)
 			return PTR_ERR(gr3d->clk_secondary);
 		}
 
-		gr3d->rst_secondary = devm_reset_control_get(&pdev->dev,
-								"3d2");
+		gr3d->clocks[gr3d->nclocks].id = "3d2";
+		gr3d->clocks[gr3d->nclocks].clk = gr3d->clk_secondary;
+		gr3d->nclocks++;
+
+		gr3d->rst_secondary =
+			devm_reset_control_get_exclusive_released(&pdev->dev, "3d2");
 		if (IS_ERR(gr3d->rst_secondary)) {
 			dev_err(&pdev->dev, "cannot get secondary reset\n");
 			return PTR_ERR(gr3d->rst_secondary);
 		}
 	}
 
-	err = tegra_powergate_sequence_power_up(TEGRA_POWERGATE_3D, gr3d->clk,
-						gr3d->rst);
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to power up 3D unit\n");
+	err = devm_gr3d_init_power(&pdev->dev, gr3d);
+	if (err)
 		return err;
-	}
 
-	if (gr3d->clk_secondary) {
-		err = tegra_powergate_sequence_power_up(TEGRA_POWERGATE_3D1,
-							gr3d->clk_secondary,
-							gr3d->rst_secondary);
-		if (err < 0) {
-			dev_err(&pdev->dev,
-				"failed to power up secondary 3D unit\n");
-			return err;
-		}
-	}
+	opp_table = devm_pm_opp_register_set_opp_helper(&pdev->dev, gr3d_set_opp);
+	if (IS_ERR(opp_table))
+		return PTR_ERR(opp_table);
+
+	opp_params.init_state = true;
+
+	err = devm_tegra_core_dev_init_opp_table(&pdev->dev, &opp_params);
+	if (err && err != -ENODEV)
+		return err;
 
 	INIT_LIST_HEAD(&gr3d->client.base.list);
 	gr3d->client.base.ops = &gr3d_client_ops;
@@ -363,8 +486,6 @@ static int gr3d_probe(struct platform_device *pdev)
 	for (i = 0; i < ARRAY_SIZE(gr3d_addr_regs); i++)
 		set_bit(gr3d_addr_regs[i], gr3d->addr_regs);
 
-	platform_set_drvdata(pdev, gr3d);
-
 	return 0;
 }
 
@@ -380,23 +501,114 @@ static int gr3d_remove(struct platform_device *pdev)
 		return err;
 	}
 
-	if (gr3d->clk_secondary) {
-		reset_control_assert(gr3d->rst_secondary);
+	return 0;
+}
+
+static int __maybe_unused gr3d_runtime_suspend(struct device *dev)
+{
+	struct gr3d *gr3d = dev_get_drvdata(dev);
+	int err;
+
+	if (gr3d->legacy_pd && gr3d->clk_secondary) {
+		err = reset_control_assert(gr3d->rst_secondary);
+		if (err) {
+			dev_err(dev, "failed to assert secondary reset: %d\n", err);
+			return err;
+		}
+
 		tegra_powergate_power_off(TEGRA_POWERGATE_3D1);
-		clk_disable_unprepare(gr3d->clk_secondary);
 	}
 
-	reset_control_assert(gr3d->rst);
-	tegra_powergate_power_off(TEGRA_POWERGATE_3D);
-	clk_disable_unprepare(gr3d->clk);
+	if (gr3d->legacy_pd) {
+		err = reset_control_assert(gr3d->rst);
+		if (err) {
+			dev_err(dev, "failed to assert reset: %d\n", err);
+			return err;
+		}
+
+		tegra_powergate_power_off(TEGRA_POWERGATE_3D);
+	}
+
+	clk_bulk_disable_unprepare(gr3d->nclocks, gr3d->clocks);
+	reset_control_release(gr3d->rst_secondary);
+	reset_control_release(gr3d->rst);
+
+	return 0;
+}
+
+static int __maybe_unused gr3d_runtime_resume(struct device *dev)
+{
+	struct gr3d *gr3d = dev_get_drvdata(dev);
+	int err;
+
+	err = reset_control_acquire(gr3d->rst);
+	if (err) {
+		dev_err(dev, "failed to acquire reset: %d\n", err);
+		return err;
+	}
+
+	err = reset_control_acquire(gr3d->rst_secondary);
+	if (err) {
+		dev_err(dev, "failed to acquire secondary reset: %d\n", err);
+		goto release_reset_primary;
+	}
+
+	if (gr3d->legacy_pd) {
+		err = tegra_powergate_sequence_power_up(TEGRA_POWERGATE_3D,
+							gr3d->clk, gr3d->rst);
+		if (err)
+			goto release_reset_secondary;
+	}
+
+	if (gr3d->legacy_pd && gr3d->clk_secondary) {
+		err = tegra_powergate_sequence_power_up(TEGRA_POWERGATE_3D1,
+							gr3d->clk_secondary,
+							gr3d->rst_secondary);
+		if (err)
+			goto release_reset_secondary;
+	}
+
+	err = clk_bulk_prepare_enable(gr3d->nclocks, gr3d->clocks);
+	if (err) {
+		dev_err(dev, "failed to enable clock: %d\n", err);
+		goto release_reset_secondary;
+	}
+
+	return 0;
+
+release_reset_secondary:
+	reset_control_release(gr3d->rst_secondary);
+
+release_reset_primary:
+	reset_control_release(gr3d->rst);
+
+	return err;
+}
+
+static __maybe_unused int gr3d_suspend(struct device *dev)
+{
+	struct gr3d *gr3d = dev_get_drvdata(dev);
+	int err;
+
+	host1x_channel_stop(gr3d->channel);
+
+	err = pm_runtime_force_suspend(dev);
+	if (err < 0)
+		return err;
 
 	return 0;
 }
 
+static const struct dev_pm_ops tegra_gr3d_pm = {
+	SET_RUNTIME_PM_OPS(gr3d_runtime_suspend, gr3d_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(gr3d_suspend, pm_runtime_force_resume)
+};
+
 struct platform_driver tegra_gr3d_driver = {
 	.driver = {
 		.name = "tegra-gr3d",
 		.of_match_table = tegra_gr3d_match,
+		.pm = &tegra_gr3d_pm,
 	},
 	.probe = gr3d_probe,
 	.remove = gr3d_remove,
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
