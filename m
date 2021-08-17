Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2393EE294
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 03:31:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 566E56E0D0;
	Tue, 17 Aug 2021 01:30:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38FF26E0AC
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 01:30:21 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id u22so7021860lfq.13
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 18:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k6wZmbvyoOODmDB1eS3EojW3e6c3WvdIEBtZgihohcY=;
 b=oiQWq+nux4+zptjwYqkSUqT6reuYtWPbbeKWpD+4jDk+debF03Ibv8vr4yhOx8RfaO
 2HyTR4ucgdbR8eYD3+WZBBoM3iHyO5Qtvo8GcR/aU+shOyUFaJrwyMB1ngodlB7opxfq
 DtgP1QJbVFm0euFBHBEBdQ5EmyerLhyOezJr4yjgD5I0X3bld9dvm8UtzrubqaYQg3UR
 xc1owqqK1Mirih5m9CbRWRI1E8Z3GEVhNkBEN8Z2eXbkP6iJp5F3ppv5V9uXu65VlJtq
 gZWveh8xa5Pcyc/NawLm7vNohrtUuhzn8vAHUzaATgMo8z7OqFFIOK4Bwhj9cAxKhvmT
 57Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k6wZmbvyoOODmDB1eS3EojW3e6c3WvdIEBtZgihohcY=;
 b=IqLE9bwmC+Dz8l07Xc2Y2KE3mNIQPIr7GemPE30PbTn/JFUWjfSgR/IavXTY1kHj4b
 QZC508BSJRAGLXVhLF45/kcCxwM3KdHnCxNtT/nrp6BI6NiKY2qwWDgVNJE19fYjwOn0
 slXC5BBOK2UCGeV6E7JsSxNEHF/7CdMcwYpllv8jO6P4w4czAIYWFNSRc6GVmGYvOSsr
 hZVewo25MtSAXh4jpESqRhlhbWQsd/iTRB2kNXWKRUrOqZG7Z0ReT8cT4jiOOqoG7VZ/
 MJFIJFrmmKdKubFMbMJoWvytqIEf0G5CCfRQlNAhyA/ddMxZnCzXeygjtqnOgA9izeBt
 dsTQ==
X-Gm-Message-State: AOAM531vsaB4mAVxUpyo1VIewG70xNmoBdcwYcmZMTqXJn+Hmfr2RRFG
 aJ9UhKv2y+IzlQNipQ4bQ18=
X-Google-Smtp-Source: ABdhPJz2P8HI2g8pJeC2bXhTXI0IlF2Re5ElTRuVyTPYC8t1ONoFbo0iOVp7gTUDLZ4XNsAiFS3FDg==
X-Received: by 2002:ac2:498f:: with SMTP id f15mr499844lfl.595.1629163819477; 
 Mon, 16 Aug 2021 18:30:19 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.gmail.com with ESMTPSA id g30sm46607lfj.298.2021.08.16.18.30.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 18:30:19 -0700 (PDT)
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
Subject: [PATCH v8 15/34] drm/tegra: gr3d: Support power management
Date: Tue, 17 Aug 2021 04:27:35 +0300
Message-Id: <20210817012754.8710-16-digetx@gmail.com>
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

Add power management to the GR3D driver.

Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
Tested-by: Paul Fertser <fercerpav@gmail.com> # PAZ00 T20
Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20 and TK1 T124
Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/gr3d.c | 393 ++++++++++++++++++++++++++++++-----
 1 file changed, 339 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gr3d.c b/drivers/gpu/drm/tegra/gr3d.c
index 24442ade0da3..4bb11dff5e74 100644
--- a/drivers/gpu/drm/tegra/gr3d.c
+++ b/drivers/gpu/drm/tegra/gr3d.c
@@ -5,32 +5,48 @@
  */
 
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/host1x.h>
 #include <linux/iommu.h>
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
 #include "gem.h"
 #include "gr3d.h"
 
+enum {
+	RST_GR3D_MC,
+	RST_GR3D,
+	RST_GR3D2_MC,
+	RST_GR3D2,
+	RST_GR3D_MAX,
+};
+
 struct gr3d_soc {
 	unsigned int version;
+	unsigned int num_clocks;
+	unsigned int num_resets;
 };
 
 struct gr3d {
 	struct tegra_drm_client client;
 	struct host1x_channel *channel;
-	struct clk *clk_secondary;
-	struct clk *clk;
-	struct reset_control *rst_secondary;
-	struct reset_control *rst;
 
 	const struct gr3d_soc *soc;
+	struct clk_bulk_data *clocks;
+	unsigned int nclocks;
+	struct reset_control_bulk_data resets[RST_GR3D_MAX];
+	unsigned int nresets;
+	bool legacy_pd;
 
 	DECLARE_BITMAP(addr_regs, GR3D_NUM_REGS);
 };
@@ -155,14 +171,20 @@ static const struct tegra_drm_client_ops gr3d_ops = {
 
 static const struct gr3d_soc tegra20_gr3d_soc = {
 	.version = 0x20,
+	.num_clocks = 1,
+	.num_resets = 2,
 };
 
 static const struct gr3d_soc tegra30_gr3d_soc = {
 	.version = 0x30,
+	.num_clocks = 2,
+	.num_resets = 4,
 };
 
 static const struct gr3d_soc tegra114_gr3d_soc = {
 	.version = 0x35,
+	.num_clocks = 1,
+	.num_resets = 2,
 };
 
 static const struct of_device_id tegra_gr3d_match[] = {
@@ -278,9 +300,132 @@ static const u32 gr3d_addr_regs[] = {
 	GR3D_GLOBAL_SAMP23SURFADDR(15),
 };
 
+static void gr3d_del_link(void *link)
+{
+	device_link_del(link);
+}
+
+static int gr3d_init_power(struct device *dev, struct gr3d *gr3d)
+{
+	const u32 link_flags = DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME;
+	const char *opp_genpd_names[] = { "3d0", "3d1", NULL };
+	struct device **opp_virt_dev;
+	struct device_link *link;
+	struct device *pd_dev;
+	unsigned int i;
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
+		return 0;
+	}
+
+	/*
+	 * The PM domain core automatically attaches a single power domain,
+	 * otherwise it skips attaching completely. We have a single domain
+	 * on Tegra20 and two domains on Tegra30+.
+	 */
+	if (dev->pm_domain)
+		return 0;
+
+	err = devm_pm_opp_attach_genpd(dev, opp_genpd_names, &opp_virt_dev);
+	if (err)
+		return err;
+
+	for (i = 0; opp_genpd_names[i]; i++) {
+		pd_dev = opp_virt_dev[i];
+		if (!pd_dev) {
+			dev_err(dev, "failed to get %s power domain\n",
+				opp_genpd_names[i]);
+			return -EINVAL;
+		}
+
+		link = device_link_add(dev, pd_dev, link_flags);
+		if (!link) {
+			dev_err(dev, "failed to link to %s\n", dev_name(pd_dev));
+			return -EINVAL;
+		}
+
+		err = devm_add_action_or_reset(dev, gr3d_del_link, link);
+		if (err)
+			return err;
+	}
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
+static int gr3d_get_clocks(struct device *dev, struct gr3d *gr3d)
+{
+	int err;
+
+	err = devm_clk_bulk_get_all(dev, &gr3d->clocks);
+	if (err < 0) {
+		dev_err(dev, "failed to get clock: %d\n", err);
+		return err;
+	}
+	gr3d->nclocks = err;
+
+	if (gr3d->nclocks != gr3d->soc->num_clocks) {
+		dev_err(dev, "invalid number of clocks: %u\n", gr3d->nclocks);
+		return -ENOENT;
+	}
+
+	return 0;
+}
+
+static int gr3d_get_resets(struct device *dev, struct gr3d *gr3d)
+{
+	int err;
+
+	gr3d->nresets = gr3d->soc->num_resets;
+	gr3d->resets[RST_GR3D2_MC].id = "mc2";
+	gr3d->resets[RST_GR3D_MC].id = "mc";
+	gr3d->resets[RST_GR3D2].id = "3d2";
+	gr3d->resets[RST_GR3D].id = "3d";
+
+	err = devm_reset_control_bulk_get_optional_exclusive_released(
+				dev, gr3d->nresets, gr3d->resets);
+	if (err) {
+		dev_err(dev, "failed to get reset: %d\n", err);
+		return err;
+	}
+
+	if (WARN_ON(!gr3d->resets[RST_GR3D].rstc) ||
+	    WARN_ON(!gr3d->resets[RST_GR3D2].rstc && gr3d->nresets == 4))
+		return -ENOENT;
+
+	return 0;
+}
+
 static int gr3d_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
 	struct host1x_syncpt **syncpts;
 	struct gr3d *gr3d;
 	unsigned int i;
@@ -290,56 +435,33 @@ static int gr3d_probe(struct platform_device *pdev)
 	if (!gr3d)
 		return -ENOMEM;
 
+	platform_set_drvdata(pdev, gr3d);
+
 	gr3d->soc = of_device_get_match_data(&pdev->dev);
 
 	syncpts = devm_kzalloc(&pdev->dev, sizeof(*syncpts), GFP_KERNEL);
 	if (!syncpts)
 		return -ENOMEM;
 
-	gr3d->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(gr3d->clk)) {
-		dev_err(&pdev->dev, "cannot get clock\n");
-		return PTR_ERR(gr3d->clk);
-	}
-
-	gr3d->rst = devm_reset_control_get(&pdev->dev, "3d");
-	if (IS_ERR(gr3d->rst)) {
-		dev_err(&pdev->dev, "cannot get reset\n");
-		return PTR_ERR(gr3d->rst);
-	}
+	err = gr3d_get_clocks(&pdev->dev, gr3d);
+	if (err)
+		return err;
 
-	if (of_device_is_compatible(np, "nvidia,tegra30-gr3d")) {
-		gr3d->clk_secondary = devm_clk_get(&pdev->dev, "3d2");
-		if (IS_ERR(gr3d->clk_secondary)) {
-			dev_err(&pdev->dev, "cannot get secondary clock\n");
-			return PTR_ERR(gr3d->clk_secondary);
-		}
+	err = gr3d_get_resets(&pdev->dev, gr3d);
+	if (err)
+		return err;
 
-		gr3d->rst_secondary = devm_reset_control_get(&pdev->dev,
-								"3d2");
-		if (IS_ERR(gr3d->rst_secondary)) {
-			dev_err(&pdev->dev, "cannot get secondary reset\n");
-			return PTR_ERR(gr3d->rst_secondary);
-		}
-	}
+	err = gr3d_init_power(&pdev->dev, gr3d);
+	if (err)
+		return err;
 
-	err = tegra_powergate_sequence_power_up(TEGRA_POWERGATE_3D, gr3d->clk,
-						gr3d->rst);
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to power up 3D unit\n");
+	err = devm_pm_opp_register_set_opp_helper(&pdev->dev, gr3d_set_opp);
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
+	err = devm_tegra_core_dev_init_opp_table_simple(&pdev->dev);
+	if (err)
+		return err;
 
 	INIT_LIST_HEAD(&gr3d->client.base.list);
 	gr3d->client.base.ops = &gr3d_client_ops;
@@ -352,20 +474,28 @@ static int gr3d_probe(struct platform_device *pdev)
 	gr3d->client.version = gr3d->soc->version;
 	gr3d->client.ops = &gr3d_ops;
 
+	pm_runtime_enable(&pdev->dev);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 200);
+
 	err = host1x_client_register(&gr3d->client.base);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to register host1x client: %d\n",
 			err);
-		return err;
+		goto disable_rpm;
 	}
 
 	/* initialize address register map */
 	for (i = 0; i < ARRAY_SIZE(gr3d_addr_regs); i++)
 		set_bit(gr3d_addr_regs[i], gr3d->addr_regs);
 
-	platform_set_drvdata(pdev, gr3d);
-
 	return 0;
+
+disable_rpm:
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+
+	return err;
 }
 
 static int gr3d_remove(struct platform_device *pdev)
@@ -380,23 +510,178 @@ static int gr3d_remove(struct platform_device *pdev)
 		return err;
 	}
 
-	if (gr3d->clk_secondary) {
-		reset_control_assert(gr3d->rst_secondary);
-		tegra_powergate_power_off(TEGRA_POWERGATE_3D1);
-		clk_disable_unprepare(gr3d->clk_secondary);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+
+	return 0;
+}
+
+static int gr3d_legacy_domain_power_up(struct device *dev, const char *name,
+				       unsigned int id)
+{
+	struct gr3d *gr3d = dev_get_drvdata(dev);
+	struct reset_control *reset;
+	struct clk *clk;
+	unsigned int i;
+	int err;
+
+	/*
+	 * Tegra20 device-tree doesn't specify 3d clock name and there is only
+	 * one clock for Tegra20. Tegra30+ device-trees always specified names
+	 * for the clocks.
+	 */
+	if (gr3d->nclocks == 1) {
+		if (id == TEGRA_POWERGATE_3D1)
+			return 0;
+
+		clk = gr3d->clocks[0].clk;
+	} else {
+		for (i = 0; i < gr3d->nclocks; i++) {
+			if (WARN_ON_ONCE(!gr3d->clocks[i].id))
+				continue;
+
+			if (!strcmp(gr3d->clocks[i].id, name)) {
+				clk = gr3d->clocks[i].clk;
+				break;
+			}
+		}
+
+		if (WARN_ON_ONCE(i == gr3d->nclocks))
+			return -EINVAL;
+	}
+
+	/*
+	 * We use array of resets, which includes MC resets, and MC
+	 * reset shouldn't be asserted while hardware is gated because
+	 * MC flushing will fail for gated hardware. Hence for legacy
+	 * PD we request the individual reset separately.
+	 */
+	reset = reset_control_get_exclusive_released(dev, name);
+	if (IS_ERR(reset))
+		return PTR_ERR(reset);
+
+	err = reset_control_acquire(reset);
+	if (err) {
+		dev_err(dev, "failed to acquire %s reset: %d\n", name, err);
+	} else {
+		err = tegra_powergate_sequence_power_up(id, clk, reset);
+		reset_control_release(reset);
 	}
 
-	reset_control_assert(gr3d->rst);
-	tegra_powergate_power_off(TEGRA_POWERGATE_3D);
-	clk_disable_unprepare(gr3d->clk);
+	reset_control_put(reset);
+	if (err)
+		return err;
+
+	/*
+	 * tegra_powergate_sequence_power_up() leaves clocks enabled
+	 * while GENPD not, hence keep clock-enable balanced.
+	 */
+	clk_disable_unprepare(clk);
+
+	return 0;
+}
+
+static int gr3d_legacy_power_up(struct device *dev)
+{
+	struct gr3d *gr3d = dev_get_drvdata(dev);
+	int err;
+
+	if (gr3d->legacy_pd) {
+		err = gr3d_legacy_domain_power_up(dev, "3d",
+						  TEGRA_POWERGATE_3D);
+		if (err)
+			return err;
+
+		err = gr3d_legacy_domain_power_up(dev, "3d2",
+						  TEGRA_POWERGATE_3D1);
+		if (err)
+			return err;
+	}
 
 	return 0;
 }
 
+static int __maybe_unused gr3d_runtime_suspend(struct device *dev)
+{
+	struct gr3d *gr3d = dev_get_drvdata(dev);
+	int err;
+
+	host1x_channel_stop(gr3d->channel);
+
+	err = reset_control_bulk_assert(gr3d->nresets, gr3d->resets);
+	if (err) {
+		dev_err(dev, "failed to assert reset: %d\n", err);
+		return err;
+	}
+
+	usleep_range(10, 20);
+
+	/*
+	 * Older device-trees don't specify MC resets and power-gating can't
+	 * be done safely in that case. Hence we will keep the power ungated
+	 * for older DTBs. For newer DTBs, GENPD will perform the power-gating.
+	 */
+
+	clk_bulk_disable_unprepare(gr3d->nclocks, gr3d->clocks);
+	reset_control_bulk_release(gr3d->nresets, gr3d->resets);
+
+	return 0;
+}
+
+static int __maybe_unused gr3d_runtime_resume(struct device *dev)
+{
+	struct gr3d *gr3d = dev_get_drvdata(dev);
+	int err;
+
+	err = gr3d_legacy_power_up(dev);
+	if (err)
+		return err;
+
+	err = reset_control_bulk_acquire(gr3d->nresets, gr3d->resets);
+	if (err) {
+		dev_err(dev, "failed to acquire reset: %d\n", err);
+		return err;
+	}
+
+	err = dev_pm_opp_sync(dev);
+	if (err) {
+		dev_err(dev, "failed to sync OPP: %d\n", err);
+		goto release_reset;
+	}
+
+	err = clk_bulk_prepare_enable(gr3d->nclocks, gr3d->clocks);
+	if (err) {
+		dev_err(dev, "failed to enable clock: %d\n", err);
+		goto release_reset;
+	}
+
+	err = reset_control_bulk_deassert(gr3d->nresets, gr3d->resets);
+	if (err) {
+		dev_err(dev, "failed to deassert reset: %d\n", err);
+		goto disable_clk;
+	}
+
+	return 0;
+
+disable_clk:
+	clk_bulk_disable_unprepare(gr3d->nclocks, gr3d->clocks);
+release_reset:
+	reset_control_bulk_release(gr3d->nresets, gr3d->resets);
+
+	return err;
+}
+
+static const struct dev_pm_ops tegra_gr3d_pm = {
+	SET_RUNTIME_PM_OPS(gr3d_runtime_suspend, gr3d_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
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
2.32.0

