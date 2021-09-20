Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC126412243
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 20:12:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8027F6E804;
	Mon, 20 Sep 2021 18:12:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B3D86E7DA
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 18:12:17 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id z24so45173035lfu.13
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 11:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i4Ar1sKgIFsBbBlQEbxczmgkR6jb9rRmAkGMRfPTYAk=;
 b=mY5wnNnE7C7b4jXCWdli891fQntygZdUQeYPwUMRDB6ZMyqRCJf723PJLO7/0YYhQy
 6tLQcSsV39ymktaCKCy0a9eC+r3jS17v9i9n3vYeBUUR8Z6G3GowLp5SiqqFjI/eyZD5
 oc1jIZj8A8mjMX4lh9A7puV6s/R3xAfv1YIkcbHqTcSs+MaHg3HBcdzu1n84ams1sN75
 f4icawPtouqCRrgxX1P8pLsyz53WZU0GG6V1d4ogBya/oqJrz47PgLPOky2t/6RGwtp5
 j2MSIbQGzlimfAKB0p3040mab86CivoookJF44JbItedDHT1isJYn/uI3H+72bepWQSX
 6Eog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i4Ar1sKgIFsBbBlQEbxczmgkR6jb9rRmAkGMRfPTYAk=;
 b=43unuJb+c0foOr/LP8ByafJwIVjUt1yQe1EOn0Ad0Mc7DYcrmFxs/KRu5pdNlOdklY
 0BydsLHO9wTdP+6BMIFeHwDkXUqp/0cd1C/05h9gsHNIl7GpReCQUuGTLlAi90eDkJkQ
 6vJ4a+8TWb5hB9/cuQlCVsOSX69F1/C08onlVu8OVT8yiH/eBwM9ADmwql4q5rK1wn3Z
 DNum+n/3McAoK7L/iLAiqR2R3WOk7ZXWeHmatncLZLJurJv51QZXrq+zKbxPT3ki1i+E
 i07+UOVFmIy3RUZdscOvf48wHych/H4uiF3vFkVt8su+nyIDTLSemBNJwtqkL8B2yAUi
 gZfA==
X-Gm-Message-State: AOAM532mBD6v+dnL0gnsm8ay6c2haHX2CI0d9c+a+Kxsqy+Jf56lwC9L
 5Gh9aroIH9j+/ZtPcf1RLVk=
X-Google-Smtp-Source: ABdhPJy/6vlmh9+lSzgZrzcQlnIshSuuab/OVeywj0cRHUtiBGQKp2zWvxcZuDyjSa3l7JZJUdD4kA==
X-Received: by 2002:a05:6512:3f96:: with SMTP id
 x22mr19475879lfa.389.1632161535111; 
 Mon, 20 Sep 2021 11:12:15 -0700 (PDT)
Received: from localhost.localdomain (46-138-151-206.dynamic.spd-mgts.ru.
 [46.138.151.206])
 by smtp.gmail.com with ESMTPSA id u3sm1775677lju.107.2021.09.20.11.12.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 11:12:14 -0700 (PDT)
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
 Rob Herring <robh+dt@kernel.org>,
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
Subject: [PATCH v12 13/35] drm/tegra: gr2d: Support generic power domain and
 runtime PM
Date: Mon, 20 Sep 2021 21:11:23 +0300
Message-Id: <20210920181145.19543-14-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210920181145.19543-1-digetx@gmail.com>
References: <20210920181145.19543-1-digetx@gmail.com>
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

Add runtime power management and support generic power domains.

Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
Tested-by: Paul Fertser <fercerpav@gmail.com> # PAZ00 T20
Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20 and TK1 T124
Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/gr2d.c | 155 +++++++++++++++++++++++++++++++++--
 1 file changed, 147 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
index de288cba3905..13df8f118f75 100644
--- a/drivers/gpu/drm/tegra/gr2d.c
+++ b/drivers/gpu/drm/tegra/gr2d.c
@@ -7,11 +7,21 @@
 #include <linux/iommu.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/reset.h>
+
+#include <soc/tegra/common.h>
 
 #include "drm.h"
 #include "gem.h"
 #include "gr2d.h"
 
+enum {
+	RST_MC,
+	RST_GR2D,
+	RST_GR2D_MAX,
+};
+
 struct gr2d_soc {
 	unsigned int version;
 };
@@ -21,6 +31,9 @@ struct gr2d {
 	struct host1x_channel *channel;
 	struct clk *clk;
 
+	struct reset_control_bulk_data resets[RST_GR2D_MAX];
+	unsigned int nresets;
+
 	const struct gr2d_soc *soc;
 
 	DECLARE_BITMAP(addr_regs, GR2D_NUM_REGS);
@@ -101,16 +114,24 @@ static int gr2d_open_channel(struct tegra_drm_client *client,
 			     struct tegra_drm_context *context)
 {
 	struct gr2d *gr2d = to_gr2d(client);
+	int err;
 
 	context->channel = host1x_channel_get(gr2d->channel);
 	if (!context->channel)
 		return -ENOMEM;
 
+	err = pm_runtime_resume_and_get(client->base.dev);
+	if (err) {
+		host1x_channel_put(context->channel);
+		return err;
+	}
+
 	return 0;
 }
 
 static void gr2d_close_channel(struct tegra_drm_context *context)
 {
+	pm_runtime_put_sync(context->client->base.dev);
 	host1x_channel_put(context->channel);
 }
 
@@ -190,6 +211,27 @@ static const u32 gr2d_addr_regs[] = {
 	GR2D_VA_BASE_ADDR_SB,
 };
 
+static int gr2d_get_resets(struct device *dev, struct gr2d *gr2d)
+{
+	int err;
+
+	gr2d->resets[RST_MC].id = "mc";
+	gr2d->resets[RST_GR2D].id = "2d";
+	gr2d->nresets = RST_GR2D_MAX;
+
+	err = devm_reset_control_bulk_get_optional_exclusive_released(
+				dev, gr2d->nresets, gr2d->resets);
+	if (err) {
+		dev_err(dev, "failed to get reset: %d\n", err);
+		return err;
+	}
+
+	if (WARN_ON(!gr2d->resets[RST_GR2D].rstc))
+		return -ENOENT;
+
+	return 0;
+}
+
 static int gr2d_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -202,6 +244,8 @@ static int gr2d_probe(struct platform_device *pdev)
 	if (!gr2d)
 		return -ENOMEM;
 
+	platform_set_drvdata(pdev, gr2d);
+
 	gr2d->soc = of_device_get_match_data(dev);
 
 	syncpts = devm_kzalloc(dev, sizeof(*syncpts), GFP_KERNEL);
@@ -214,11 +258,9 @@ static int gr2d_probe(struct platform_device *pdev)
 		return PTR_ERR(gr2d->clk);
 	}
 
-	err = clk_prepare_enable(gr2d->clk);
-	if (err) {
-		dev_err(dev, "cannot turn on clock\n");
+	err = gr2d_get_resets(dev, gr2d);
+	if (err)
 		return err;
-	}
 
 	INIT_LIST_HEAD(&gr2d->client.base.list);
 	gr2d->client.base.ops = &gr2d_client_ops;
@@ -231,20 +273,31 @@ static int gr2d_probe(struct platform_device *pdev)
 	gr2d->client.version = gr2d->soc->version;
 	gr2d->client.ops = &gr2d_ops;
 
+	pm_runtime_enable(dev);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_set_autosuspend_delay(dev, 200);
+
+	err = devm_tegra_core_dev_init_opp_table_common(dev);
+	if (err)
+		goto disable_rpm;
+
 	err = host1x_client_register(&gr2d->client.base);
 	if (err < 0) {
 		dev_err(dev, "failed to register host1x client: %d\n", err);
-		clk_disable_unprepare(gr2d->clk);
-		return err;
+		goto disable_rpm;
 	}
 
 	/* initialize address register map */
 	for (i = 0; i < ARRAY_SIZE(gr2d_addr_regs); i++)
 		set_bit(gr2d_addr_regs[i], gr2d->addr_regs);
 
-	platform_set_drvdata(pdev, gr2d);
-
 	return 0;
+
+disable_rpm:
+	pm_runtime_dont_use_autosuspend(dev);
+	pm_runtime_disable(dev);
+
+	return err;
 }
 
 static int gr2d_remove(struct platform_device *pdev)
@@ -259,15 +312,101 @@ static int gr2d_remove(struct platform_device *pdev)
 		return err;
 	}
 
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+
+	return 0;
+}
+
+static int __maybe_unused gr2d_runtime_suspend(struct device *dev)
+{
+	struct gr2d *gr2d = dev_get_drvdata(dev);
+	int err;
+
+	host1x_channel_stop(gr2d->channel);
+	reset_control_bulk_release(gr2d->nresets, gr2d->resets);
+
+	/*
+	 * GR2D module shouldn't be reset while hardware is idling, otherwise
+	 * host1x's cmdproc will stuck on trying to access any G2 register
+	 * after reset. GR2D module could be either hot-reset or reset after
+	 * power-gating of the HEG partition. Hence we will put in reset only
+	 * the memory client part of the module, the HEG GENPD will take care
+	 * of resetting GR2D module across power-gating.
+	 *
+	 * On Tegra20 there is no HEG partition, but it's okay to have
+	 * undetermined h/w state since userspace is expected to reprogram
+	 * the state on each job submission anyways.
+	 */
+	err = reset_control_acquire(gr2d->resets[RST_MC].rstc);
+	if (err) {
+		dev_err(dev, "failed to acquire MC reset: %d\n", err);
+		goto acquire_reset;
+	}
+
+	err = reset_control_assert(gr2d->resets[RST_MC].rstc);
+	reset_control_release(gr2d->resets[RST_MC].rstc);
+	if (err) {
+		dev_err(dev, "failed to assert MC reset: %d\n", err);
+		goto acquire_reset;
+	}
+
 	clk_disable_unprepare(gr2d->clk);
 
 	return 0;
+
+acquire_reset:
+	reset_control_bulk_acquire(gr2d->nresets, gr2d->resets);
+	reset_control_bulk_deassert(gr2d->nresets, gr2d->resets);
+
+	return err;
 }
 
+static int __maybe_unused gr2d_runtime_resume(struct device *dev)
+{
+	struct gr2d *gr2d = dev_get_drvdata(dev);
+	int err;
+
+	err = reset_control_bulk_acquire(gr2d->nresets, gr2d->resets);
+	if (err) {
+		dev_err(dev, "failed to acquire reset: %d\n", err);
+		return err;
+	}
+
+	err = clk_prepare_enable(gr2d->clk);
+	if (err) {
+		dev_err(dev, "failed to enable clock: %d\n", err);
+		goto release_reset;
+	}
+
+	/* this is a reset array which deasserts both 2D MC and 2D itself */
+	err = reset_control_bulk_deassert(gr2d->nresets, gr2d->resets);
+	if (err) {
+		dev_err(dev, "failed to deassert reset: %d\n", err);
+		goto disable_clk;
+	}
+
+	return 0;
+
+disable_clk:
+	clk_disable_unprepare(gr2d->clk);
+release_reset:
+	reset_control_bulk_release(gr2d->nresets, gr2d->resets);
+
+	return err;
+}
+
+static const struct dev_pm_ops tegra_gr2d_pm = {
+	SET_RUNTIME_PM_OPS(gr2d_runtime_suspend, gr2d_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
+};
+
 struct platform_driver tegra_gr2d_driver = {
 	.driver = {
 		.name = "tegra-gr2d",
 		.of_match_table = gr2d_match,
+		.pm = &tegra_gr2d_pm,
 	},
 	.probe = gr2d_probe,
 	.remove = gr2d_remove,
-- 
2.32.0

