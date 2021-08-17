Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3ABA3EE274
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 03:30:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AE946E0B7;
	Tue, 17 Aug 2021 01:30:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A517F6E0A6
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 01:30:11 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id s3so1180356ljp.11
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 18:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FkG4sMPXwxROAnasUKlubsKj8ibY8pO32zaa+5UhL6Y=;
 b=TRuCHWVHXB0t+gtHELJJ0ZmBrbYHJfVL04GaPrfPDy2zh6EZvmog3AX42ISb0soozM
 Tt/BW47uNUBYrddiu4CIHS/6w6G7WmyhDPd5lndbh3/7VSDggDsha9yyY6qctF+nYYLJ
 3CupLPdMGnrEfGz9Mx19GJanHDUPJWnt26WIi/oLNLngfMuWnvL1StH5kNivHrLZkZOc
 Hvu3y5YXxXrM6/x3ABDlhXslZHm5OhKDf/946u8H792zL+jA+d/i+ddwWIPVc4NKCyj3
 7Uv03X7FrgWKN8VWesxsFf3AVpl732N4VlIMj4hWSgkmSIdXsD71zDQuJECPmv4MAPjg
 Jsnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FkG4sMPXwxROAnasUKlubsKj8ibY8pO32zaa+5UhL6Y=;
 b=rZ1rQhfCHBFDQfQwAr782aOFBTVacQzYM2H5sH05+5bKWH+g5ZoMCfuLH8RG0sZ8WR
 +Ap1EUTCcbMzBsWdeec2ypXnCtAPEtlYHjQmEDL+TZ4EwraxJ+4bC0EOa0hcLIxKYiIa
 hETtDgiCS5FVS/BUmNeGegkJ7ZxuJ5j4YkKTwobGpD+cNctvFuL0x4n3NRp0BmLJV7ko
 mDxl3UWpQ1iXr65wPmAZ3eingUeiZrw7xulDRF05NGcEazXWH8v5c/lUJWL8DGI3f+9z
 niXRIVyqP/T9crMQs3GncRrk3pQJShiE/mjsHKNU8wRk8DVhmBMi2cFh47zgB0jMXDBy
 wWSA==
X-Gm-Message-State: AOAM532VmsVe71Azskx/f2U7J08nAjjBSXbbzPoegfauq6BoOrxmARIT
 Iz5LOgM+reTVgQyvZIL4644=
X-Google-Smtp-Source: ABdhPJxZoeVDGYwsPWTTLzcrhmSCVcqAwZVOSeAQvdR5Mw7pqYkgR8H0hNOeibM9RBus5UG00EJvjA==
X-Received: by 2002:a2e:1546:: with SMTP id 6mr847902ljv.283.1629163809878;
 Mon, 16 Aug 2021 18:30:09 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.gmail.com with ESMTPSA id g30sm46607lfj.298.2021.08.16.18.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 18:30:09 -0700 (PDT)
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
Subject: [PATCH v8 07/34] clk: tegra: Support runtime PM and power domain
Date: Tue, 17 Aug 2021 04:27:27 +0300
Message-Id: <20210817012754.8710-8-digetx@gmail.com>
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

The Clock-and-Reset controller resides in a core power domain on NVIDIA
Tegra SoCs.  In order to support voltage scaling of the core power domain,
we hook up DVFS-capable clocks to the core GENPD for managing of the
GENPD's performance state based on the clock changes.

Some clocks don't have any specific physical hardware unit that backs
them, like root PLLs and system clock and they have theirs own voltage
requirements.  This patch adds new clk-device driver that backs the clocks
and provides runtime PM functionality for them.  A virtual clk-device is
created for each such DVFS-capable clock at the clock's registration time
by the new tegra_clk_register() helper.  Driver changes clock's device
GENPD performance state based on clk-rate notifications.

In result we have this sequence of events:

  1. Clock driver creates virtual device for selective clocks, enables
     runtime PM for the created device and registers the clock.
  2. Clk-device driver starts to listen to clock rate changes.
  3. Something changes clk rate or enables/disables clk.
  4. CCF core propagates the change through the clk tree.
  5. Clk-device driver gets clock rate-change notification or GENPD core
     handles prepare/unprepare of the clock.
  6. Clk-device driver changes GENPD performance state on clock rate
     change.
  7. GENPD driver changes voltage regulator state change.
  8. The regulator state is committed to hardware via I2C.

We rely on fact that DVFS is not needed for Tegra I2C.  Hence I2C
subsystem stays independent from the clk power management and there
are no deadlock spots in the sequence.

Currently all clocks are registered very early during kernel boot when the
device driver core isn't available yet.  The clk-device can't be created
at that time.  This patch splits the registration of the clocks in two
phases:

  1. Register all essential clocks which don't use RPM and are needed
     during early boot.

  2. Register at a later boot time the rest of clocks.

This patch adds power management support for Tegra20 and Tegra30 clocks.

Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
Tested-by: Paul Fertser <fercerpav@gmail.com> # PAZ00 T20
Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20 and TK1 T124
Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clk/tegra/Makefile      |   1 +
 drivers/clk/tegra/clk-device.c  | 222 ++++++++++++++++++++++++++++++++
 drivers/clk/tegra/clk-pll.c     |   2 +-
 drivers/clk/tegra/clk-super.c   |   2 +-
 drivers/clk/tegra/clk-tegra20.c |  39 ++++--
 drivers/clk/tegra/clk-tegra30.c |  70 ++++++----
 drivers/clk/tegra/clk.c         |  64 +++++++++
 drivers/clk/tegra/clk.h         |   2 +
 8 files changed, 366 insertions(+), 36 deletions(-)
 create mode 100644 drivers/clk/tegra/clk-device.c

diff --git a/drivers/clk/tegra/Makefile b/drivers/clk/tegra/Makefile
index 7b1816856eb5..a0715cdfc1a4 100644
--- a/drivers/clk/tegra/Makefile
+++ b/drivers/clk/tegra/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-y					+= clk.o
 obj-y					+= clk-audio-sync.o
+obj-y					+= clk-device.o
 obj-y					+= clk-dfll.o
 obj-y					+= clk-divider.o
 obj-y					+= clk-periph.o
diff --git a/drivers/clk/tegra/clk-device.c b/drivers/clk/tegra/clk-device.c
new file mode 100644
index 000000000000..1399eaba1c91
--- /dev/null
+++ b/drivers/clk/tegra/clk-device.c
@@ -0,0 +1,222 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/mutex.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_opp.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+
+#include <soc/tegra/common.h>
+
+#include "clk.h"
+
+/*
+ * This driver manages performance state of the core power domain for the
+ * independent PLLs and system clocks.  We created a virtual clock device
+ * for such clocks, see tegra_clk_register().
+ */
+
+struct tegra_clk_device {
+	struct notifier_block clk_nb;
+	struct device *dev;
+	struct clk_hw *hw;
+	struct mutex lock;
+};
+
+static int tegra_clock_set_pd_state(struct tegra_clk_device *clk_dev,
+				    unsigned long rate)
+{
+	struct device *dev = clk_dev->dev;
+	struct dev_pm_opp *opp;
+	unsigned int pstate;
+
+	opp = dev_pm_opp_find_freq_ceil(dev, &rate);
+	if (opp == ERR_PTR(-ERANGE)) {
+		dev_dbg(dev, "failed to find ceil OPP for %luHz\n", rate);
+		opp = dev_pm_opp_find_freq_floor(dev, &rate);
+	}
+
+	if (IS_ERR(opp)) {
+		dev_err(dev, "failed to find OPP for %luHz: %pe\n", rate, opp);
+		return PTR_ERR(opp);
+	}
+
+	pstate = dev_pm_opp_get_required_pstate(opp, 0);
+	dev_pm_opp_put(opp);
+
+	return dev_pm_genpd_set_performance_state(dev, pstate);
+}
+
+static int tegra_clock_change_notify(struct notifier_block *nb,
+				     unsigned long msg, void *data)
+{
+	struct clk_notifier_data *cnd = data;
+	struct tegra_clk_device *clk_dev;
+	int err = 0;
+
+	clk_dev = container_of(nb, struct tegra_clk_device, clk_nb);
+
+	mutex_lock(&clk_dev->lock);
+	switch (msg) {
+	case PRE_RATE_CHANGE:
+		if (cnd->new_rate > cnd->old_rate)
+			err = tegra_clock_set_pd_state(clk_dev, cnd->new_rate);
+		break;
+
+	case ABORT_RATE_CHANGE:
+		err = tegra_clock_set_pd_state(clk_dev, cnd->old_rate);
+		break;
+
+	case POST_RATE_CHANGE:
+		if (cnd->new_rate < cnd->old_rate)
+			err = tegra_clock_set_pd_state(clk_dev, cnd->new_rate);
+		break;
+
+	default:
+		break;
+	}
+	mutex_unlock(&clk_dev->lock);
+
+	return notifier_from_errno(err);
+}
+
+static int tegra_clock_sync_pd_state(struct tegra_clk_device *clk_dev)
+{
+	unsigned long rate;
+	int ret = 0;
+
+	mutex_lock(&clk_dev->lock);
+
+	if (!pm_runtime_status_suspended(clk_dev->dev)) {
+		rate = clk_hw_get_rate(clk_dev->hw);
+		ret = tegra_clock_set_pd_state(clk_dev, rate);
+	}
+
+	mutex_unlock(&clk_dev->lock);
+
+	return ret;
+}
+
+static int tegra_clock_probe(struct platform_device *pdev)
+{
+	struct tegra_clk_device *clk_dev;
+	struct device *dev = &pdev->dev;
+	struct clk *clk;
+	int err;
+
+	if (!dev->pm_domain)
+		return -EINVAL;
+
+	clk_dev = devm_kzalloc(dev, sizeof(*clk_dev), GFP_KERNEL);
+	if (!clk_dev)
+		return -ENOMEM;
+
+	clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+
+	clk_dev->dev = dev;
+	clk_dev->hw = __clk_get_hw(clk);
+	clk_dev->clk_nb.notifier_call = tegra_clock_change_notify;
+	mutex_init(&clk_dev->lock);
+
+	platform_set_drvdata(pdev, clk_dev);
+
+	err = devm_tegra_core_dev_init_opp_table_simple(dev);
+	if (err)
+		return err;
+
+	err = clk_notifier_register(clk, &clk_dev->clk_nb);
+	if (err) {
+		dev_err(dev, "failed to register clk notifier: %d\n", err);
+		return err;
+	}
+
+	/*
+	 * The driver is attaching to a potentially active/resumed clock, hence
+	 * we need to sync the power domain performance state in a accordance to
+	 * the clock rate if clock is resumed.
+	 */
+	err = tegra_clock_sync_pd_state(clk_dev);
+	if (err)
+		goto unreg_clk;
+
+	return 0;
+
+unreg_clk:
+	clk_notifier_unregister(clk, &clk_dev->clk_nb);
+
+	return err;
+}
+
+static __maybe_unused int tegra_clock_pm_suspend(struct device *dev)
+{
+	struct tegra_clk_device *clk_dev = dev_get_drvdata(dev);
+
+	/*
+	 * Power management of the clock is entangled with the Tegra PMC
+	 * GENPD because PMC driver enables/disables clocks for toggling
+	 * of the PD's on/off state.
+	 *
+	 * The PMC GENPD is resumed in NOIRQ phase, before RPM of the clocks
+	 * becomes available, hence PMC can't use clocks at the early resume
+	 * phase if RPM is involved. For example when 3d clock is enabled,
+	 * it may enable the parent PLL clock that needs to be RPM-resumed.
+	 *
+	 * Secondly, the PLL clocks may be enabled by the low level suspend
+	 * code, so we need to assume that PLL is in enabled state during
+	 * suspend.
+	 *
+	 * We will keep PLLs and system clock resumed during suspend time.
+	 * All PLLs on all SoCs are low power and system clock is always-on,
+	 * so practically not much is changed here.
+	 */
+
+	return clk_prepare(clk_dev->hw->clk);
+}
+
+static __maybe_unused int tegra_clock_pm_resume(struct device *dev)
+{
+	struct tegra_clk_device *clk_dev = dev_get_drvdata(dev);
+
+	clk_unprepare(clk_dev->hw->clk);
+
+	return 0;
+}
+
+static void tegra_clock_shutdown(struct platform_device *pdev)
+{
+	struct tegra_clk_device *clk_dev = platform_get_drvdata(pdev);
+
+	clk_prepare(clk_dev->hw->clk);
+}
+
+static const struct dev_pm_ops tegra_clock_pm = {
+	SET_SYSTEM_SLEEP_PM_OPS(tegra_clock_pm_suspend,
+				tegra_clock_pm_resume)
+};
+
+static const struct of_device_id tegra_clock_match[] = {
+	{ .compatible = "nvidia,tegra20-sclk" },
+	{ .compatible = "nvidia,tegra30-sclk" },
+	{ .compatible = "nvidia,tegra30-pllc" },
+	{ .compatible = "nvidia,tegra30-plle" },
+	{ .compatible = "nvidia,tegra30-pllm" },
+	{ }
+};
+
+static struct platform_driver tegra_clock_driver = {
+	.driver = {
+		.name = "tegra-clock",
+		.of_match_table = tegra_clock_match,
+		.pm = &tegra_clock_pm,
+		.suppress_bind_attrs = true,
+	},
+	.probe = tegra_clock_probe,
+	.shutdown = tegra_clock_shutdown,
+};
+builtin_platform_driver(tegra_clock_driver);
diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index eaa079c177c3..131efc53659d 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -1914,7 +1914,7 @@ static struct clk *_tegra_clk_register_pll(struct tegra_clk_pll *pll,
 	/* Data in .init is copied by clk_register(), so stack variable OK */
 	pll->hw.init = &init;
 
-	return clk_register(NULL, &pll->hw);
+	return tegra_clk_register(&pll->hw);
 }
 
 struct clk *tegra_clk_register_pll(const char *name, const char *parent_name,
diff --git a/drivers/clk/tegra/clk-super.c b/drivers/clk/tegra/clk-super.c
index 6099c6e9acd4..d1af4817051e 100644
--- a/drivers/clk/tegra/clk-super.c
+++ b/drivers/clk/tegra/clk-super.c
@@ -226,7 +226,7 @@ struct clk *tegra_clk_register_super_mux(const char *name,
 	/* Data in .init is copied by clk_register(), so stack variable OK */
 	super->hw.init = &init;
 
-	clk = clk_register(NULL, &super->hw);
+	clk = tegra_clk_register(&super->hw);
 	if (IS_ERR(clk))
 		kfree(super);
 
diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index 3664593a5ba4..cf92c0f4db61 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -710,13 +710,6 @@ static void tegra20_super_clk_init(void)
 			      NULL);
 	clks[TEGRA20_CLK_CCLK] = clk;
 
-	/* SCLK */
-	clk = tegra_clk_register_super_mux("sclk", sclk_parents,
-			      ARRAY_SIZE(sclk_parents),
-			      CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
-			      clk_base + SCLK_BURST_POLICY, 0, 4, 0, 0, NULL);
-	clks[TEGRA20_CLK_SCLK] = clk;
-
 	/* twd */
 	clk = clk_register_fixed_factor(NULL, "twd", "cclk", 0, 1, 4);
 	clks[TEGRA20_CLK_TWD] = clk;
@@ -1146,13 +1139,39 @@ static void __init tegra20_clock_init(struct device_node *np)
 	tegra20_periph_clk_init();
 	tegra20_audio_clk_init();
 
-	tegra_init_dup_clks(tegra_clk_duplicates, clks, TEGRA20_CLK_CLK_MAX);
-
 	tegra_add_of_provider(np, tegra20_clk_src_onecell_get);
-	tegra_register_devclks(devclks, ARRAY_SIZE(devclks));
 
 	tegra_clk_apply_init_table = tegra20_clock_apply_init_table;
 
 	tegra_cpu_car_ops = &tegra20_cpu_car_ops;
 }
 CLK_OF_DECLARE(tegra20, "nvidia,tegra20-car", tegra20_clock_init);
+
+/*
+ * Clocks that use runtime PM can't be created at the CLK_OF_DECLARE
+ * stage because drivers base isn't initialized yet, and thus platform
+ * devices can't be created for the clocks.  Hence we need to split the
+ * registration of the clocks into two phases.  The first phase registers
+ * essential clocks which don't require RPM and are actually used during
+ * early boot.  The second phase registers clocks which use RPM and this
+ * is done when device drivers core API is ready.
+ */
+static int __init tegra20_init_runtime_pm_clocks(void)
+{
+	struct clk *clk;
+
+	if (!of_machine_is_compatible("nvidia,tegra20"))
+		return 0;
+
+	clk = tegra_clk_register_super_mux("sclk", sclk_parents,
+			      ARRAY_SIZE(sclk_parents),
+			      CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
+			      clk_base + SCLK_BURST_POLICY, 0, 4, 0, 0, NULL);
+	clks[TEGRA20_CLK_SCLK] = clk;
+
+	tegra_init_dup_clks(tegra_clk_duplicates, clks, TEGRA20_CLK_CLK_MAX);
+	tegra_register_devclks(devclks, ARRAY_SIZE(devclks));
+
+	return 0;
+}
+postcore_initcall_sync(tegra20_init_runtime_pm_clocks);
diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index 64121bc66d85..a8ca313f3c6f 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -812,11 +812,6 @@ static void __init tegra30_pll_init(void)
 {
 	struct clk *clk;
 
-	/* PLLC */
-	clk = tegra_clk_register_pll("pll_c", "pll_ref", clk_base, pmc_base, 0,
-				     &pll_c_params, NULL);
-	clks[TEGRA30_CLK_PLL_C] = clk;
-
 	/* PLLC_OUT1 */
 	clk = tegra_clk_register_divider("pll_c_out1_div", "pll_c",
 				clk_base + PLLC_OUT, 0, TEGRA_DIVIDER_ROUND_UP,
@@ -826,11 +821,6 @@ static void __init tegra30_pll_init(void)
 				0, NULL);
 	clks[TEGRA30_CLK_PLL_C_OUT1] = clk;
 
-	/* PLLM */
-	clk = tegra_clk_register_pll("pll_m", "pll_ref", clk_base, pmc_base,
-			    CLK_SET_RATE_GATE, &pll_m_params, NULL);
-	clks[TEGRA30_CLK_PLL_M] = clk;
-
 	/* PLLM_OUT1 */
 	clk = tegra_clk_register_divider("pll_m_out1_div", "pll_m",
 				clk_base + PLLM_OUT, 0, TEGRA_DIVIDER_ROUND_UP,
@@ -880,9 +870,6 @@ static void __init tegra30_pll_init(void)
 			       ARRAY_SIZE(pll_e_parents),
 			       CLK_SET_RATE_NO_REPARENT,
 			       clk_base + PLLE_AUX, 2, 1, 0, NULL);
-	clk = tegra_clk_register_plle("pll_e", "pll_e_mux", clk_base, pmc_base,
-			     CLK_GET_RATE_NOCACHE, &pll_e_params, NULL);
-	clks[TEGRA30_CLK_PLL_E] = clk;
 }
 
 static const char *cclk_g_parents[] = { "clk_m", "pll_c", "clk_32k", "pll_m",
@@ -971,14 +958,6 @@ static void __init tegra30_super_clk_init(void)
 			      NULL);
 	clks[TEGRA30_CLK_CCLK_LP] = clk;
 
-	/* SCLK */
-	clk = tegra_clk_register_super_mux("sclk", sclk_parents,
-				  ARRAY_SIZE(sclk_parents),
-				  CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
-				  clk_base + SCLK_BURST_POLICY,
-				  0, 4, 0, 0, NULL);
-	clks[TEGRA30_CLK_SCLK] = clk;
-
 	/* twd */
 	clk = clk_register_fixed_factor(NULL, "twd", "cclk_g",
 					CLK_SET_RATE_PARENT, 1, 2);
@@ -1354,13 +1333,56 @@ static void __init tegra30_clock_init(struct device_node *np)
 			     tegra30_audio_plls,
 			     ARRAY_SIZE(tegra30_audio_plls), 24000000);
 
-	tegra_init_dup_clks(tegra_clk_duplicates, clks, TEGRA30_CLK_CLK_MAX);
-
 	tegra_add_of_provider(np, tegra30_clk_src_onecell_get);
-	tegra_register_devclks(devclks, ARRAY_SIZE(devclks));
 
 	tegra_clk_apply_init_table = tegra30_clock_apply_init_table;
 
 	tegra_cpu_car_ops = &tegra30_cpu_car_ops;
 }
 CLK_OF_DECLARE(tegra30, "nvidia,tegra30-car", tegra30_clock_init);
+
+/*
+ * Clocks that use runtime PM can't be created at the CLK_OF_DECLARE
+ * stage because drivers base isn't initialized yet, and thus platform
+ * devices can't be created for the clocks.  Hence we need to split the
+ * registration of the clocks into two phases.  The first phase registers
+ * essential clocks which don't require RPM and are actually used during
+ * early boot.  The second phase registers clocks which use RPM and this
+ * is done when device drivers core API is ready.
+ */
+static int __init tegra30_init_runtime_pm_clocks(void)
+{
+	struct clk *clk;
+
+	if (!of_machine_is_compatible("nvidia,tegra30"))
+		return 0;
+
+	/* PLLC */
+	clk = tegra_clk_register_pll("pll_c", "pll_ref", clk_base, pmc_base, 0,
+				     &pll_c_params, NULL);
+	clks[TEGRA30_CLK_PLL_C] = clk;
+
+	/* PLLE */
+	clk = tegra_clk_register_plle("pll_e", "pll_e_mux", clk_base, pmc_base,
+				      CLK_GET_RATE_NOCACHE, &pll_e_params, NULL);
+	clks[TEGRA30_CLK_PLL_E] = clk;
+
+	/* PLLM */
+	clk = tegra_clk_register_pll("pll_m", "pll_ref", clk_base, pmc_base,
+				     CLK_SET_RATE_GATE, &pll_m_params, NULL);
+	clks[TEGRA30_CLK_PLL_M] = clk;
+
+	/* SCLK */
+	clk = tegra_clk_register_super_mux("sclk", sclk_parents,
+					   ARRAY_SIZE(sclk_parents),
+					   CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
+					   clk_base + SCLK_BURST_POLICY,
+					   0, 4, 0, 0, NULL);
+	clks[TEGRA30_CLK_SCLK] = clk;
+
+	tegra_init_dup_clks(tegra_clk_duplicates, clks, TEGRA30_CLK_CLK_MAX);
+	tegra_register_devclks(devclks, ARRAY_SIZE(devclks));
+
+	return 0;
+}
+postcore_initcall_sync(tegra30_init_runtime_pm_clocks);
diff --git a/drivers/clk/tegra/clk.c b/drivers/clk/tegra/clk.c
index f6cdce441cf7..868949b723c8 100644
--- a/drivers/clk/tegra/clk.c
+++ b/drivers/clk/tegra/clk.c
@@ -9,14 +9,19 @@
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/clk/tegra.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/reset-controller.h>
+#include <linux/string.h>
 
 #include <soc/tegra/fuse.h>
 
 #include "clk.h"
 
 /* Global data of Tegra CPU CAR ops */
+static struct device_node *tegra_car_np;
 static struct tegra_cpu_car_ops dummy_car_ops;
 struct tegra_cpu_car_ops *tegra_cpu_car_ops = &dummy_car_ops;
 
@@ -320,6 +325,8 @@ void __init tegra_add_of_provider(struct device_node *np,
 {
 	int i;
 
+	tegra_car_np = np;
+
 	for (i = 0; i < clk_num; i++) {
 		if (IS_ERR(clks[i])) {
 			pr_err
@@ -372,6 +379,63 @@ struct clk ** __init tegra_lookup_dt_id(int clk_id,
 		return NULL;
 }
 
+static struct device_node *tegra_clk_get_of_node(struct clk_hw *hw)
+{
+	struct device_node *np, *root;
+
+	if (!tegra_car_np)
+		return NULL;
+
+	root = of_get_child_by_name(tegra_car_np, "tegra-clocks");
+	if (!root)
+		return NULL;
+
+	for_each_child_of_node(root, np) {
+		if (strcmp(np->name, hw->init->name))
+			continue;
+
+		if (!of_device_is_compatible(np, "nvidia,tegra-clock"))
+			continue;
+
+		return np;
+	}
+
+	of_node_put(root);
+
+	return NULL;
+}
+
+struct clk *tegra_clk_register(struct clk_hw *hw)
+{
+	struct platform_device *pdev;
+	struct device *dev = NULL;
+	struct device_node *np;
+	const char *dev_name;
+
+	np = tegra_clk_get_of_node(hw);
+
+	if (!of_device_is_available(np))
+		goto put_node;
+
+	dev_name = kasprintf(GFP_KERNEL, "tegra_clk_%s", hw->init->name);
+	if (!dev_name)
+		goto put_node;
+
+	pdev = of_platform_device_create(np, dev_name, NULL);
+	if (!pdev) {
+		pr_err("%s: failed to create device for %pOF\n", __func__, np);
+		kfree(dev_name);
+		goto put_node;
+	}
+
+	dev = &pdev->dev;
+	pm_runtime_enable(dev);
+put_node:
+	of_node_put(np);
+
+	return clk_register(dev, hw);
+}
+
 tegra_clk_apply_init_table_func tegra_clk_apply_init_table;
 
 static int __init tegra_clocks_apply_init_table(void)
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 0c3ba0ccce1a..4fab4aa9fa31 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -927,4 +927,6 @@ struct clk *tegra20_clk_register_emc(void __iomem *ioaddr, bool low_jitter);
 struct clk *tegra210_clk_register_emc(struct device_node *np,
 				      void __iomem *regs);
 
+struct clk *tegra_clk_register(struct clk_hw *hw);
+
 #endif /* TEGRA_CLK_H */
-- 
2.32.0

