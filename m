Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA29418BED
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 00:43:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F78D6E5CE;
	Sun, 26 Sep 2021 22:42:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 657066E5B4
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Sep 2021 22:42:38 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id z24so69310894lfu.13
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Sep 2021 15:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OcjaPyxUOcH+Po9iWB7z9kNYrbD1HMHOoC8A400eowg=;
 b=B/1SQbkQzQvcGa6GJvUUhrvmdh9l2xcO1q60SJLG2NDbsZn2+7hp/Cpl7Brc/gUHY7
 tj44ouv242snxyzO7rXwZ6VWYUYmOmSjJc+xhQVni/bhUfFDukT/JILp+Y/LINNsewBS
 SSjs7XVEAz49Gh8QZtwvIZCgiIJ4yIsdu7WTgXgXZHiIWlBLmDyBgwPT1h1cmiVLrp5g
 21jahb7McUbBys86dq1WH4onNnDAEzF3qUy3Usw4/z2rzcrY9Ezks9VQjjY0QTL8jy/P
 hVnqJ3fSsl8MH0N0tcs3tYxn2zFTFiqIjKnYq4pT9eKQIAC4Jf5bMFQTIki3x/RYTNvJ
 Wm/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OcjaPyxUOcH+Po9iWB7z9kNYrbD1HMHOoC8A400eowg=;
 b=J1S6NkLQtaoy4WjAZigd6qfp6eORonXrCRy85umZm0ktypvk46OjymnpVpxqgQD11i
 VsNap3giuK3QD+9GBELnzPbSpqnVYL04mgqZFfjKYn3NKlHhWvz7yYylSMPiHQeh2ikV
 qbaEM1G2daZF1JHf5Mj9l7mCh0vU7cQpddyBTHmIsXvQi7n1D95h3pbjj1cdaEEtPUW3
 4PS4n4s4hoGw4R1/z88uBB2HpJ3rtJzT5WY1MtlMxNTWd0nyiN5vzMde5mgbBINgoSQE
 YSlnTvuSAhIlSYDRvIQBAr5K3YU1V6nJou8Ds4oKRIGV1lEiNyAirelDRe9MDP91uTrz
 sflA==
X-Gm-Message-State: AOAM531MyJHCyuPVKEv/vBkoNPYraBDoSbdmaLckRhLiRj4ofM/lSOkF
 ndWLFAIs6PZhTfZ8hoYVXpc=
X-Google-Smtp-Source: ABdhPJyv30B7zTUSlLsmVpeuzJtai/wNeA11G01ou381MLjtPMWxO1Kci30gEvYasXgsryMESLsM5g==
X-Received: by 2002:ac2:561a:: with SMTP id v26mr20856130lfd.500.1632696156656; 
 Sun, 26 Sep 2021 15:42:36 -0700 (PDT)
Received: from localhost.localdomain (46-138-80-108.dynamic.spd-mgts.ru.
 [46.138.80.108])
 by smtp.gmail.com with ESMTPSA id m10sm1408899lfr.272.2021.09.26.15.42.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:42:36 -0700 (PDT)
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
Subject: [PATCH v13 09/35] gpu: host1x: Add runtime PM and OPP support
Date: Mon, 27 Sep 2021 01:40:32 +0300
Message-Id: <20210926224058.1252-10-digetx@gmail.com>
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

Add runtime PM and OPP support to the Host1x driver. For the starter we
will keep host1x always-on because dynamic power management require a major
refactoring of the driver code since lot's of code paths are missing the
RPM handling and we're going to remove some of these paths in the future.

Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
Tested-by: Paul Fertser <fercerpav@gmail.com> # PAZ00 T20
Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20 and TK1 T124
Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/host1x/debug.c         |  15 +++
 drivers/gpu/host1x/dev.c           | 151 +++++++++++++++++++++++------
 drivers/gpu/host1x/dev.h           |   3 +-
 drivers/gpu/host1x/hw/channel_hw.c |  44 ++++-----
 drivers/gpu/host1x/intr.c          |   3 -
 drivers/gpu/host1x/syncpt.c        |   5 +-
 6 files changed, 165 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/host1x/debug.c b/drivers/gpu/host1x/debug.c
index 8a14880c61bb..18d9c8d206e3 100644
--- a/drivers/gpu/host1x/debug.c
+++ b/drivers/gpu/host1x/debug.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/debugfs.h>
+#include <linux/pm_runtime.h>
 #include <linux/seq_file.h>
 #include <linux/uaccess.h>
 
@@ -52,6 +53,11 @@ static int show_channel(struct host1x_channel *ch, void *data, bool show_fifo)
 {
 	struct host1x *m = dev_get_drvdata(ch->dev->parent);
 	struct output *o = data;
+	int err;
+
+	err = pm_runtime_resume_and_get(m->dev);
+	if (err < 0)
+		return err;
 
 	mutex_lock(&ch->cdma.lock);
 	mutex_lock(&debug_lock);
@@ -64,6 +70,8 @@ static int show_channel(struct host1x_channel *ch, void *data, bool show_fifo)
 	mutex_unlock(&debug_lock);
 	mutex_unlock(&ch->cdma.lock);
 
+	pm_runtime_put(m->dev);
+
 	return 0;
 }
 
@@ -71,9 +79,14 @@ static void show_syncpts(struct host1x *m, struct output *o)
 {
 	struct list_head *pos;
 	unsigned int i;
+	int err;
 
 	host1x_debug_output(o, "---- syncpts ----\n");
 
+	err = pm_runtime_resume_and_get(m->dev);
+	if (err < 0)
+		return;
+
 	for (i = 0; i < host1x_syncpt_nb_pts(m); i++) {
 		u32 max = host1x_syncpt_read_max(m->syncpt + i);
 		u32 min = host1x_syncpt_load(m->syncpt + i);
@@ -101,6 +114,8 @@ static void show_syncpts(struct host1x *m, struct output *o)
 					    base_val);
 	}
 
+	pm_runtime_put(m->dev);
+
 	host1x_debug_output(o, "\n");
 }
 
diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index fbb6447b8659..595b91099e3e 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -6,14 +6,18 @@
  */
 
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/of.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 
+#include <soc/tegra/common.h>
+
 #define CREATE_TRACE_POINTS
 #include <trace/events/host1x.h>
 #undef CREATE_TRACE_POINTS
@@ -190,6 +194,9 @@ static void host1x_setup_sid_table(struct host1x *host)
 	const struct host1x_info *info = host->info;
 	unsigned int i;
 
+	if (!info->has_hypervisor)
+		return;
+
 	for (i = 0; i < info->num_sid_entries; i++) {
 		const struct host1x_sid_entry *entry = &info->sid_table[i];
 
@@ -347,6 +354,27 @@ static void host1x_iommu_exit(struct host1x *host)
 	}
 }
 
+static int host1x_get_resets(struct host1x *host)
+{
+	int err;
+
+	host->resets[0].id = "mc";
+	host->resets[1].id = "host1x";
+	host->nresets = ARRAY_SIZE(host->resets);
+
+	err = devm_reset_control_bulk_get_optional_exclusive_released(
+				host->dev, host->nresets, host->resets);
+	if (err) {
+		dev_err(host->dev, "failed to get reset: %d\n", err);
+		return err;
+	}
+
+	if (WARN_ON(!host->resets[1].rstc))
+		return -ENOENT;
+
+	return 0;
+}
+
 static int host1x_probe(struct platform_device *pdev)
 {
 	struct host1x *host;
@@ -423,12 +451,9 @@ static int host1x_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	host->rst = devm_reset_control_get(&pdev->dev, "host1x");
-	if (IS_ERR(host->rst)) {
-		err = PTR_ERR(host->rst);
-		dev_err(&pdev->dev, "failed to get reset: %d\n", err);
+	err = host1x_get_resets(host);
+	if (err)
 		return err;
-	}
 
 	err = host1x_iommu_init(host);
 	if (err < 0) {
@@ -443,22 +468,10 @@ static int host1x_probe(struct platform_device *pdev)
 		goto iommu_exit;
 	}
 
-	err = clk_prepare_enable(host->clk);
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to enable clock\n");
-		goto free_channels;
-	}
-
-	err = reset_control_deassert(host->rst);
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to deassert reset: %d\n", err);
-		goto unprepare_disable;
-	}
-
 	err = host1x_syncpt_init(host);
 	if (err) {
 		dev_err(&pdev->dev, "failed to initialize syncpts\n");
-		goto reset_assert;
+		goto free_channels;
 	}
 
 	err = host1x_intr_init(host, syncpt_irq);
@@ -467,10 +480,18 @@ static int host1x_probe(struct platform_device *pdev)
 		goto deinit_syncpt;
 	}
 
-	host1x_debug_init(host);
+	pm_runtime_enable(&pdev->dev);
+
+	err = devm_tegra_core_dev_init_opp_table_common(&pdev->dev);
+	if (err)
+		goto pm_disable;
 
-	if (host->info->has_hypervisor)
-		host1x_setup_sid_table(host);
+	/* the driver's code isn't ready yet for the dynamic RPM */
+	err = pm_runtime_resume_and_get(&pdev->dev);
+	if (err)
+		goto pm_disable;
+
+	host1x_debug_init(host);
 
 	err = host1x_register(host);
 	if (err < 0)
@@ -486,13 +507,14 @@ static int host1x_probe(struct platform_device *pdev)
 	host1x_unregister(host);
 deinit_debugfs:
 	host1x_debug_deinit(host);
+
+	pm_runtime_put(&pdev->dev);
+pm_disable:
+	pm_runtime_disable(&pdev->dev);
+
 	host1x_intr_deinit(host);
 deinit_syncpt:
 	host1x_syncpt_deinit(host);
-reset_assert:
-	reset_control_assert(host->rst);
-unprepare_disable:
-	clk_disable_unprepare(host->clk);
 free_channels:
 	host1x_channel_list_free(&host->channel_list);
 iommu_exit:
@@ -507,19 +529,94 @@ static int host1x_remove(struct platform_device *pdev)
 
 	host1x_unregister(host);
 	host1x_debug_deinit(host);
+
+	pm_runtime_put(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+
 	host1x_intr_deinit(host);
 	host1x_syncpt_deinit(host);
-	reset_control_assert(host->rst);
-	clk_disable_unprepare(host->clk);
 	host1x_iommu_exit(host);
 
 	return 0;
 }
 
+static int __maybe_unused host1x_runtime_suspend(struct device *dev)
+{
+	struct host1x *host = dev_get_drvdata(dev);
+	int err;
+
+	host1x_intr_stop(host);
+	host1x_syncpt_save(host);
+
+	err = reset_control_bulk_assert(host->nresets, host->resets);
+	if (err) {
+		dev_err(dev, "failed to assert reset: %d\n", err);
+		goto resume_host1x;
+	}
+
+	usleep_range(1000, 2000);
+
+	clk_disable_unprepare(host->clk);
+	reset_control_bulk_release(host->nresets, host->resets);
+
+	return 0;
+
+resume_host1x:
+	host1x_setup_sid_table(host);
+	host1x_syncpt_restore(host);
+	host1x_intr_start(host);
+
+	return err;
+}
+
+static int __maybe_unused host1x_runtime_resume(struct device *dev)
+{
+	struct host1x *host = dev_get_drvdata(dev);
+	int err;
+
+	err = reset_control_bulk_acquire(host->nresets, host->resets);
+	if (err) {
+		dev_err(dev, "failed to acquire reset: %d\n", err);
+		return err;
+	}
+
+	err = clk_prepare_enable(host->clk);
+	if (err) {
+		dev_err(dev, "failed to enable clock: %d\n", err);
+		goto release_reset;
+	}
+
+	err = reset_control_bulk_deassert(host->nresets, host->resets);
+	if (err < 0) {
+		dev_err(dev, "failed to deassert reset: %d\n", err);
+		goto disable_clk;
+	}
+
+	host1x_setup_sid_table(host);
+	host1x_syncpt_restore(host);
+	host1x_intr_start(host);
+
+	return 0;
+
+disable_clk:
+	clk_disable_unprepare(host->clk);
+release_reset:
+	reset_control_bulk_release(host->nresets, host->resets);
+
+	return err;
+}
+
+static const struct dev_pm_ops host1x_pm = {
+	SET_RUNTIME_PM_OPS(host1x_runtime_suspend, host1x_runtime_resume,
+			   NULL)
+	/* TODO: add system suspend-resume once driver will be ready for that */
+};
+
 static struct platform_driver tegra_host1x_driver = {
 	.driver = {
 		.name = "tegra-host1x",
 		.of_match_table = host1x_of_match,
+		.pm = &host1x_pm,
 	},
 	.probe = host1x_probe,
 	.remove = host1x_remove,
diff --git a/drivers/gpu/host1x/dev.h b/drivers/gpu/host1x/dev.h
index fa6d4bc46e98..41a7a63514c4 100644
--- a/drivers/gpu/host1x/dev.h
+++ b/drivers/gpu/host1x/dev.h
@@ -118,7 +118,8 @@ struct host1x {
 	struct host1x_syncpt_base *bases;
 	struct device *dev;
 	struct clk *clk;
-	struct reset_control *rst;
+	struct reset_control_bulk_data resets[2];
+	unsigned int nresets;
 
 	struct iommu_group *group;
 	struct iommu_domain *domain;
diff --git a/drivers/gpu/host1x/hw/channel_hw.c b/drivers/gpu/host1x/hw/channel_hw.c
index 1999780a7203..6b40e9af1e88 100644
--- a/drivers/gpu/host1x/hw/channel_hw.c
+++ b/drivers/gpu/host1x/hw/channel_hw.c
@@ -159,6 +159,27 @@ static void host1x_channel_set_streamid(struct host1x_channel *channel)
 #endif
 }
 
+static void host1x_enable_gather_filter(struct host1x_channel *ch)
+{
+#if HOST1X_HW >= 6
+	struct host1x *host = dev_get_drvdata(ch->dev->parent);
+	u32 val;
+
+	if (!host->hv_regs)
+		return;
+
+	val = host1x_hypervisor_readl(
+		host, HOST1X_HV_CH_KERNEL_FILTER_GBUFFER(ch->id / 32));
+	val |= BIT(ch->id % 32);
+	host1x_hypervisor_writel(
+		host, val, HOST1X_HV_CH_KERNEL_FILTER_GBUFFER(ch->id / 32));
+#elif HOST1X_HW >= 4
+	host1x_ch_writel(ch,
+			 HOST1X_CHANNEL_CHANNELCTRL_KERNEL_FILTER_GBUFFER(1),
+			 HOST1X_CHANNEL_CHANNELCTRL);
+#endif
+}
+
 static int channel_submit(struct host1x_job *job)
 {
 	struct host1x_channel *ch = job->channel;
@@ -190,6 +211,7 @@ static int channel_submit(struct host1x_job *job)
 	}
 
 	host1x_channel_set_streamid(ch);
+	host1x_enable_gather_filter(ch);
 
 	/* begin a CDMA submit */
 	err = host1x_cdma_begin(&ch->cdma, job);
@@ -249,27 +271,6 @@ static int channel_submit(struct host1x_job *job)
 	return err;
 }
 
-static void enable_gather_filter(struct host1x *host,
-				 struct host1x_channel *ch)
-{
-#if HOST1X_HW >= 6
-	u32 val;
-
-	if (!host->hv_regs)
-		return;
-
-	val = host1x_hypervisor_readl(
-		host, HOST1X_HV_CH_KERNEL_FILTER_GBUFFER(ch->id / 32));
-	val |= BIT(ch->id % 32);
-	host1x_hypervisor_writel(
-		host, val, HOST1X_HV_CH_KERNEL_FILTER_GBUFFER(ch->id / 32));
-#elif HOST1X_HW >= 4
-	host1x_ch_writel(ch,
-			 HOST1X_CHANNEL_CHANNELCTRL_KERNEL_FILTER_GBUFFER(1),
-			 HOST1X_CHANNEL_CHANNELCTRL);
-#endif
-}
-
 static int host1x_channel_init(struct host1x_channel *ch, struct host1x *dev,
 			       unsigned int index)
 {
@@ -278,7 +279,6 @@ static int host1x_channel_init(struct host1x_channel *ch, struct host1x *dev,
 #else
 	ch->regs = dev->regs + index * 0x100;
 #endif
-	enable_gather_filter(dev, ch);
 	return 0;
 }
 
diff --git a/drivers/gpu/host1x/intr.c b/drivers/gpu/host1x/intr.c
index 45b6be927ec4..965ba21818b1 100644
--- a/drivers/gpu/host1x/intr.c
+++ b/drivers/gpu/host1x/intr.c
@@ -297,14 +297,11 @@ int host1x_intr_init(struct host1x *host, unsigned int irq_sync)
 			 "host1x_sp_%02u", id);
 	}
 
-	host1x_intr_start(host);
-
 	return 0;
 }
 
 void host1x_intr_deinit(struct host1x *host)
 {
-	host1x_intr_stop(host);
 }
 
 void host1x_intr_start(struct host1x *host)
diff --git a/drivers/gpu/host1x/syncpt.c b/drivers/gpu/host1x/syncpt.c
index d198a10848c6..e08e331e46ae 100644
--- a/drivers/gpu/host1x/syncpt.c
+++ b/drivers/gpu/host1x/syncpt.c
@@ -143,6 +143,8 @@ void host1x_syncpt_restore(struct host1x *host)
 	for (i = 0; i < host1x_syncpt_nb_bases(host); i++)
 		host1x_hw_syncpt_restore_wait_base(host, sp_base + i);
 
+	host1x_hw_syncpt_enable_protection(host);
+
 	wmb();
 }
 
@@ -366,9 +368,6 @@ int host1x_syncpt_init(struct host1x *host)
 	host->syncpt = syncpt;
 	host->bases = bases;
 
-	host1x_syncpt_restore(host);
-	host1x_hw_syncpt_enable_protection(host);
-
 	/* Allocate sync point to use for clearing waits for expired fences */
 	host->nop_sp = host1x_syncpt_alloc(host, 0, "reserved-nop");
 	if (!host->nop_sp)
-- 
2.32.0

