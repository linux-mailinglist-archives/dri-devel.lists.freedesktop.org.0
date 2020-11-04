Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E92682A78E1
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:21:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 502046E9F4;
	Thu,  5 Nov 2020 08:20:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF3636E23B
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 16:50:14 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id 11so4151847ljf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 08:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kCuTBwtWaV5rTPzoo97NAJ/dzAFCROA+rv3htyyQcDo=;
 b=UuiLj6/s+EbDYa/k+dq5ICVHOVkfl+n+aBMKyJdQroB1c7U/3wlg8tbKMa9NufljZz
 1qqywuQhA7+ARKHWT23DNmeSg5KwQlgWhrqYAnL2Y9fU3A8V0MWzD+RtbYaXVu7dYbAR
 YMFifnmzQMZPFMtIKJTi3/+7lxsZP5TzL7GMUDSC1+kiZlhyz7K6Vt7oEbZV5o6Swv/9
 wW2FJhZ5rRxPclHHaYwDcrqxQktl8h4NNiXop+M0L4WMLMDHCQ1MStAauHYFooiApJ0X
 /v9iT7aRlkQeaJedAcWHrDfLrI+Y+od8DlrhQGMR6X/SvRt838FuuYRoRcws8v0CzCWk
 DFLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kCuTBwtWaV5rTPzoo97NAJ/dzAFCROA+rv3htyyQcDo=;
 b=Juq8SEF66dBGK2CCdvvgl590idoaWqfuTRwI9kqS2IPnjfBRKrJe1RYc8ghEOPYuAm
 SgY2Qw9Qyj86chP8raDJJlSgEsRGmoWZWBmNukTlnCQI5tFOeMY0+EGlWOzZomMf5VIT
 dhhmKnH6bII/6GuRHIbXpUXtEmIXxTh1mVuQh8AqNLOOhAC+rzw+/JFKGVMnKfxRDDIW
 AniCMMZxd6YwwktMg23FgAoGApapz6+zHT306pYAsJJzgeNWi5tHFHoVZBpcsZBYzueo
 BJx3cYegWz4h7CRB4OD8Y+iBZfvLs7jcW7FhbFyBdDWtqZUwB/eOPwbYEYXLBEqvqeVI
 KguQ==
X-Gm-Message-State: AOAM530IaMiKm1oYxm6LesSlgfuJlo8N3yYF2cNxElgfCTFzhvuI9Bvt
 ov062Zv8axuenmKA4yaGMbg=
X-Google-Smtp-Source: ABdhPJyBUPK9Ebs2gdg0YBD5JQIDXdruDICmmtpi6jK+P/Q54GwEGbgCzW/PrSD2DKRzlIHw8ZM3rA==
X-Received: by 2002:a2e:9c84:: with SMTP id x4mr10585644lji.326.1604508613360; 
 Wed, 04 Nov 2020 08:50:13 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.gmail.com with ESMTPSA id m2sm454587lfo.25.2020.11.04.08.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 08:50:12 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>,
 Viresh Kumar <vireshk@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v7 36/47] memory: tegra20-emc: Add devfreq support
Date: Wed,  4 Nov 2020 19:49:12 +0300
Message-Id: <20201104164923.21238-37-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201104164923.21238-1-digetx@gmail.com>
References: <20201104164923.21238-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 05 Nov 2020 08:20:03 +0000
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add devfreq support to the Tegra20 EMC driver. Memory utilization
statistics will be periodically polled from the memory controller and
appropriate minimum clock rate will be selected by the devfreq governor.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/Kconfig       |  2 +
 drivers/memory/tegra/tegra20-emc.c | 92 ++++++++++++++++++++++++++++++
 2 files changed, 94 insertions(+)

diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
index ac3dfe155505..76e9a3b10839 100644
--- a/drivers/memory/tegra/Kconfig
+++ b/drivers/memory/tegra/Kconfig
@@ -12,6 +12,8 @@ config TEGRA20_EMC
 	tristate "NVIDIA Tegra20 External Memory Controller driver"
 	default y
 	depends on TEGRA_MC && ARCH_TEGRA_2x_SOC
+	select DEVFREQ_GOV_SIMPLE_ONDEMAND
+	select PM_DEVFREQ
 	select PM_OPP
 	help
 	  This driver is for the External Memory Controller (EMC) found on
diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index 5e10aa97809f..9946b957bb01 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -8,6 +8,7 @@
 #include <linux/clk.h>
 #include <linux/clk/tegra.h>
 #include <linux/debugfs.h>
+#include <linux/devfreq.h>
 #include <linux/err.h>
 #include <linux/interconnect-provider.h>
 #include <linux/interrupt.h>
@@ -102,6 +103,10 @@
 
 #define EMC_FBIO_CFG5_DRAM_WIDTH_X16		BIT(4)
 
+#define EMC_PWR_GATHER_CLEAR			(1 << 8)
+#define EMC_PWR_GATHER_DISABLE			(2 << 8)
+#define EMC_PWR_GATHER_ENABLE			(3 << 8)
+
 static const u16 emc_timing_registers[] = {
 	EMC_RC,
 	EMC_RFC,
@@ -157,6 +162,7 @@ struct emc_timing {
 };
 
 enum emc_rate_request_type {
+	EMC_RATE_DEVFREQ,
 	EMC_RATE_DEBUG,
 	EMC_RATE_ICC,
 	EMC_RATE_TYPE_MAX,
@@ -193,6 +199,9 @@ struct tegra_emc {
 
 	/* protect shared rate-change code path */
 	struct mutex rate_lock;
+
+	struct devfreq_simple_ondemand_data ondemand_data;
+	struct devfreq *devfreq;
 };
 
 static irqreturn_t tegra_emc_isr(int irq, void *data)
@@ -952,6 +961,88 @@ static int tegra_emc_opp_table_init(struct tegra_emc *emc)
 	return err;
 }
 
+static int tegra_emc_devfreq_target(struct device *dev, unsigned long *freq,
+				    u32 flags)
+{
+	struct tegra_emc *emc = dev_get_drvdata(dev);
+	struct dev_pm_opp *opp;
+	unsigned long rate;
+
+	opp = devfreq_recommended_opp(dev, freq, flags);
+	if (IS_ERR(opp)) {
+		dev_err(dev, "failed to find opp for %lu Hz\n", *freq);
+		return PTR_ERR(opp);
+	}
+
+	rate = dev_pm_opp_get_freq(opp);
+	dev_pm_opp_put(opp);
+
+	return emc_set_min_rate(emc, rate, EMC_RATE_DEVFREQ);
+}
+
+static int tegra_emc_devfreq_get_dev_status(struct device *dev,
+					    struct devfreq_dev_status *stat)
+{
+	struct tegra_emc *emc = dev_get_drvdata(dev);
+
+	/* freeze counters */
+	writel_relaxed(EMC_PWR_GATHER_DISABLE, emc->regs + EMC_STAT_CONTROL);
+
+	/*
+	 * busy_time:  number of clocks EMC request was accepted
+	 * total_time: number of clocks PWR_GATHER control was set to ENABLE
+	 */
+	stat->busy_time = readl_relaxed(emc->regs + EMC_STAT_PWR_COUNT);
+	stat->total_time = readl_relaxed(emc->regs + EMC_STAT_PWR_CLOCKS);
+	stat->current_frequency = clk_get_rate(emc->clk);
+
+	/* clear counters and restart */
+	writel_relaxed(EMC_PWR_GATHER_CLEAR, emc->regs + EMC_STAT_CONTROL);
+	writel_relaxed(EMC_PWR_GATHER_ENABLE, emc->regs + EMC_STAT_CONTROL);
+
+	return 0;
+}
+
+static struct devfreq_dev_profile tegra_emc_devfreq_profile = {
+	.polling_ms	= 30,
+	.target		= tegra_emc_devfreq_target,
+	.get_dev_status	= tegra_emc_devfreq_get_dev_status,
+};
+
+static int tegra_emc_devfreq_init(struct tegra_emc *emc)
+{
+	int err;
+
+	/*
+	 * PWR_COUNT is 1/2 of PWR_CLOCKS at max, and thus, the up-threshold
+	 * should be less than 50.  Secondly, multiple active memory clients
+	 * may cause over 20% of lost clock cycles due to stalls caused by
+	 * competing memory accesses.  This means that threshold should be
+	 * set to a less than 30 in order to have a properly working governor.
+	 */
+	emc->ondemand_data.upthreshold = 20;
+
+	/*
+	 * Reset statistic gathers state, select global bandwidth for the
+	 * statistics collection mode and set clocks counter saturation
+	 * limit to maximum.
+	 */
+	writel_relaxed(0x00000000, emc->regs + EMC_STAT_CONTROL);
+	writel_relaxed(0x00000000, emc->regs + EMC_STAT_LLMC_CONTROL);
+	writel_relaxed(0xffffffff, emc->regs + EMC_STAT_PWR_CLOCK_LIMIT);
+
+	emc->devfreq = devfreq_add_device(emc->dev, &tegra_emc_devfreq_profile,
+					  DEVFREQ_GOV_SIMPLE_ONDEMAND,
+					  &emc->ondemand_data);
+	if (IS_ERR(emc->devfreq)) {
+		err = PTR_ERR(emc->devfreq);
+		dev_err(emc->dev, "failed to initialize devfreq: %d", err);
+		return err;
+	}
+
+	return 0;
+}
+
 static int tegra_emc_probe(struct platform_device *pdev)
 {
 	struct device_node *np;
@@ -1019,6 +1110,7 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	tegra_emc_rate_requests_init(emc);
 	tegra_emc_debugfs_init(emc);
 	tegra_emc_interconnect_init(emc);
+	tegra_emc_devfreq_init(emc);
 
 	/*
 	 * Don't allow the kernel module to be unloaded. Unloading adds some
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
