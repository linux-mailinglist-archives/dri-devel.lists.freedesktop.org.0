Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4016B2A78FF
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:21:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 674CE6E9EC;
	Thu,  5 Nov 2020 08:20:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C1C6E86C
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 23:45:12 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id k25so292124lji.9
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 15:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wBjgIW7F68X1tjrcRLYGZvVGEJ77+b3TQ2Y5Po7YsD8=;
 b=Q/1ZQqq3UoVYq2tNoAZWz35b4cHyQDxKVAsJPzTE66rN/1B9Yl7BGayadd4BCoYYME
 YWNWFOJRFNL5GYtjYJRhqjzWExwSk4SqqPcY+yWq+tz23T/eRedD9g4gnFSa5M49tsOu
 0kZi9xyv/VllERNv3M0/B4Dnw7FsfRh81ZVcQnSfVrsxs4KIBXOq8WSvFIH3K1v07Xcp
 jYxgPjWeFytLCm9V8/8dxHrvpfcuqKra/CR2t8lYLpHSH9FI1iyUBE/cj/ZznRO7+bBh
 jBtD8rXOVqTZt+Q6T9meCd47iiSOSbySoeaVGuIJ8KomJYGa0xCqGpfNMhS6xqEDw60x
 +R1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wBjgIW7F68X1tjrcRLYGZvVGEJ77+b3TQ2Y5Po7YsD8=;
 b=TjxPqW4w3iXNDsxlUB3DWWKOwNy9L2ppOD5S7uE/hc+LVcHtL3JzBCdcI4aw2eKr3P
 6Sd/i2Ncv11DlCh9NcIadu4kyeqOGEr51Ii1jKc7Dvfj22robSKCxmWxiNBdJE0ewk2w
 N5mvN8CJycj92/TNFXPDTLnpCXCtNUKXeAwg99dAhwkeKY3LCqG0N0rNQau2cHFyjXna
 UzkSBTk2JyeAGqhSyZctyLEbo7JEQwRfVvZIEPgGqpWtRLVHSVzMQ7JU1QIK3e/RB5Xd
 gntkbhaKKdZYlX1tnLle+jEPKjF+rvF222h5h1kjNeiFe1dgBoOF20R1pLaloiFMGGRR
 6kig==
X-Gm-Message-State: AOAM530LJW95mtdyXyo046mOAzyB5g6qKpqyPwG/V/xSG42L5ZF9Pyk2
 SNe25oiWXCxlj++iCzrGh0c=
X-Google-Smtp-Source: ABdhPJz+kchjM0+Y+caAORBcP4bOCiZCk8hlvojmXePkcpBlA3X9hi+1uLRIu4Pe1taJjSKn5phlcg==
X-Received: by 2002:a2e:5016:: with SMTP id e22mr137752ljb.301.1604533511420; 
 Wed, 04 Nov 2020 15:45:11 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.gmail.com with ESMTPSA id m6sm640725ljc.112.2020.11.04.15.45.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 15:45:10 -0800 (PST)
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
Subject: [PATCH v1 11/30] drm/tegra: dc: Support OPP and SoC core voltage
 scaling
Date: Thu,  5 Nov 2020 02:44:08 +0300
Message-Id: <20201104234427.26477-12-digetx@gmail.com>
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

Add OPP and SoC core voltage scaling support to the display controller
driver. This is required for enabling system-wide DVFS on older Tegra
SoCs.

Tested-by: Peter Geis <pgwipeout@gmail.com>
Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/Kconfig |   1 +
 drivers/gpu/drm/tegra/dc.c    | 138 +++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/tegra/dc.h    |   5 ++
 3 files changed, 143 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/Kconfig b/drivers/gpu/drm/tegra/Kconfig
index 1650a448eabd..9eec4c3fbd3b 100644
--- a/drivers/gpu/drm/tegra/Kconfig
+++ b/drivers/gpu/drm/tegra/Kconfig
@@ -12,6 +12,7 @@ config DRM_TEGRA
 	select INTERCONNECT
 	select IOMMU_IOVA
 	select CEC_CORE if CEC_NOTIFIER
+	select PM_OPP
 	help
 	  Choose this option if you have an NVIDIA Tegra SoC.
 
diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index fd7c8828652d..babcb66a335b 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -11,9 +11,13 @@
 #include <linux/interconnect.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
+#include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 
+#include <soc/tegra/common.h>
+#include <soc/tegra/fuse.h>
 #include <soc/tegra/pmc.h>
 
 #include <drm/drm_atomic.h>
@@ -1699,6 +1703,55 @@ int tegra_dc_state_setup_clock(struct tegra_dc *dc,
 	return 0;
 }
 
+static void tegra_dc_update_voltage_state(struct tegra_dc *dc,
+					  struct tegra_dc_state *state)
+{
+	struct dev_pm_opp *opp;
+	unsigned long rate;
+	int err, min_uV;
+
+	/* OPP usage is optional */
+	if (!dc->opp_table)
+		return;
+
+	/* calculate actual pixel clock rate which depends on internal divider */
+	rate = DIV_ROUND_UP(clk_get_rate(dc->clk) * 2, state->div + 2);
+
+	/* find suitable OPP for the rate */
+	opp = dev_pm_opp_find_freq_ceil(dc->dev, &rate);
+
+	if (opp == ERR_PTR(-ERANGE))
+		opp = dev_pm_opp_find_freq_floor(dc->dev, &rate);
+
+	if (IS_ERR(opp)) {
+		dev_err(dc->dev, "failed to find OPP for %lu Hz: %ld\n",
+			rate, PTR_ERR(opp));
+		return;
+	}
+
+	min_uV = dev_pm_opp_get_voltage(opp);
+	dev_pm_opp_put(opp);
+
+	/*
+	 * Voltage scaling is optional and trying to set voltage for a dummy
+	 * regulator will error out.
+	 */
+	if (!device_property_present(dc->dev, "core-supply"))
+		return;
+
+	/*
+	 * Note that the minimum core voltage depends on the pixel clock
+	 * rate (which depends on internal clock divider of CRTC) and not on
+	 * the rate of the display controller clock. This is why we're not
+	 * using dev_pm_opp_set_rate() API and instead are managing the
+	 * voltage by ourselves.
+	 */
+	err = regulator_set_voltage(dc->core_reg, min_uV, INT_MAX);
+	if (err)
+		dev_err(dc->dev, "failed to set CORE voltage to %duV: %d\n",
+			min_uV, err);
+}
+
 static void tegra_dc_commit_state(struct tegra_dc *dc,
 				  struct tegra_dc_state *state)
 {
@@ -1738,6 +1791,8 @@ static void tegra_dc_commit_state(struct tegra_dc *dc,
 	if (err < 0)
 		dev_err(dc->dev, "failed to set clock %pC to %lu Hz: %d\n",
 			dc->clk, state->pclk, err);
+
+	tegra_dc_update_voltage_state(dc, state);
 }
 
 static void tegra_dc_stop(struct tegra_dc *dc)
@@ -2521,6 +2576,7 @@ static int tegra_dc_runtime_suspend(struct host1x_client *client)
 
 	clk_disable_unprepare(dc->clk);
 	pm_runtime_put_sync(dev);
+	regulator_disable(dc->core_reg);
 
 	return 0;
 }
@@ -2531,10 +2587,16 @@ static int tegra_dc_runtime_resume(struct host1x_client *client)
 	struct device *dev = client->dev;
 	int err;
 
+	err = regulator_enable(dc->core_reg);
+	if (err < 0) {
+		dev_err(dev, "failed to enable CORE regulator: %d\n", err);
+		return err;
+	}
+
 	err = pm_runtime_get_sync(dev);
 	if (err < 0) {
 		dev_err(dev, "failed to get runtime PM: %d\n", err);
-		return err;
+		goto disable_regulator;
 	}
 
 	if (dc->soc->has_powergate) {
@@ -2564,6 +2626,9 @@ static int tegra_dc_runtime_resume(struct host1x_client *client)
 	clk_disable_unprepare(dc->clk);
 put_rpm:
 	pm_runtime_put_sync(dev);
+disable_regulator:
+	regulator_disable(dc->core_reg);
+
 	return err;
 }
 
@@ -2879,6 +2944,72 @@ static int tegra_dc_couple(struct tegra_dc *dc)
 	return 0;
 }
 
+static void tegra_dc_deinit_opp_table(void *data)
+{
+	struct tegra_dc *dc = data;
+
+	dev_pm_opp_of_remove_table(dc->dev);
+	dev_pm_opp_put_supported_hw(dc->opp_table);
+	dev_pm_opp_put_regulators(dc->opp_table);
+}
+
+static int devm_tegra_dc_opp_table_init(struct tegra_dc *dc)
+{
+	struct opp_table *hw_opp_table;
+	u32 hw_version;
+	int err;
+
+	/* voltage scaling is optional */
+	dc->core_reg = devm_regulator_get(dc->dev, "core");
+	if (IS_ERR(dc->core_reg))
+		return dev_err_probe(dc->dev, PTR_ERR(dc->core_reg),
+				     "failed to get CORE regulator\n");
+
+	/* legacy device-trees don't have OPP table */
+	if (!device_property_present(dc->dev, "operating-points-v2"))
+		return 0;
+
+	dc->opp_table = dev_pm_opp_get_opp_table(dc->dev);
+	if (IS_ERR(dc->opp_table))
+		return dev_err_probe(dc->dev, PTR_ERR(dc->opp_table),
+				     "failed to prepare OPP table\n");
+
+	if (of_machine_is_compatible("nvidia,tegra20"))
+		hw_version = BIT(tegra_sku_info.soc_process_id);
+	else
+		hw_version = BIT(tegra_sku_info.soc_speedo_id);
+
+	hw_opp_table = dev_pm_opp_set_supported_hw(dc->dev, &hw_version, 1);
+	err = PTR_ERR_OR_ZERO(hw_opp_table);
+	if (err) {
+		dev_err(dc->dev, "failed to set supported HW: %d\n", err);
+		goto put_table;
+	}
+
+	err = dev_pm_opp_of_add_table(dc->dev);
+	if (err) {
+		dev_err(dc->dev, "failed to add OPP table: %d\n", err);
+		goto put_hw;
+	}
+
+	err = devm_add_action(dc->dev, tegra_dc_deinit_opp_table, dc);
+	if (err)
+		goto remove_table;
+
+	dev_info(dc->dev, "OPP HW ver. 0x%x\n", hw_version);
+
+	return 0;
+
+remove_table:
+	dev_pm_opp_of_remove_table(dc->dev);
+put_hw:
+	dev_pm_opp_put_supported_hw(dc->opp_table);
+put_table:
+	dev_pm_opp_put_opp_table(dc->opp_table);
+
+	return err;
+}
+
 static int tegra_dc_probe(struct platform_device *pdev)
 {
 	struct tegra_dc *dc;
@@ -2937,6 +3068,10 @@ static int tegra_dc_probe(struct platform_device *pdev)
 		tegra_powergate_power_off(dc->powergate);
 	}
 
+	err = devm_tegra_dc_opp_table_init(dc);
+	if (err < 0)
+		return err;
+
 	dc->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(dc->regs))
 		return PTR_ERR(dc->regs);
@@ -3007,6 +3142,7 @@ struct platform_driver tegra_dc_driver = {
 	.driver = {
 		.name = "tegra-dc",
 		.of_match_table = tegra_dc_of_match,
+		.sync_state = tegra_soc_device_sync_state,
 	},
 	.probe = tegra_dc_probe,
 	.remove = tegra_dc_remove,
diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
index ba4ed35139fb..fd774fc5c2e4 100644
--- a/drivers/gpu/drm/tegra/dc.h
+++ b/drivers/gpu/drm/tegra/dc.h
@@ -13,6 +13,8 @@
 
 #include "drm.h"
 
+struct opp_table;
+struct regulator;
 struct tegra_output;
 
 #define TEGRA_DC_LEGACY_PLANES_NUM	6
@@ -107,6 +109,9 @@ struct tegra_dc {
 	struct drm_info_list *debugfs_files;
 
 	const struct tegra_dc_soc_info *soc;
+
+	struct opp_table *opp_table;
+	struct regulator *core_reg;
 };
 
 static inline struct tegra_dc *
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
