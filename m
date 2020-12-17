Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA462DDFC6
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:33:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24E5A89BAF;
	Fri, 18 Dec 2020 08:32:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D77E96E1F8
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 18:08:00 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id o13so36635608lfr.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aGHKx42MfDPDBxR4DOfvxOz7/Acf8JGv695v+njpFiw=;
 b=APzhHWryK80KbNYYXej8HpuMRxROpNpavnwx1kCJM5bBVa+TdnqcKt2RdY4SHrVcMt
 W32uT9CDUxgZFM5ZaDWbgo1obHaTQ1kGwhJG++8pUONg2zS9xnH2pzU8uyJ6hB+j4PGX
 1MqSTqHOmRR4oxYHzrG398GEVxIjKP0fRVqwZMLdKEqIdB1HPy2mp9iXuZShti/PjFyY
 zg1UQpEpkEy5lqEu4XzkhaFTH8uLVwRO4o9uco4kum/fI3IXc3ln3x8P6KAG8+NBMkxm
 aBvJj5J91tJlBSHYLO4l1LvQKn29JZGFsLwDihxkT203GN1ZlQqTQLh5/Nq0qb56d/Sx
 uI/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aGHKx42MfDPDBxR4DOfvxOz7/Acf8JGv695v+njpFiw=;
 b=M+QQUBIeQItkLuwzxCDM5UBb2S7EFdY90Imzf4E69Tkk6Izio1/J87AVtJcDHngckn
 ZLX6k9lzqARLu9iWVdu/6s3Gm4o57fcv4dKL4CtK3jQb4FeImb76u41KzOMwfZmiHTAG
 LiTxCBDNw6t3r9YKTUEU53jyGJmZbtQdtg9MPSCTJ0VnQJTMk3xUaJqmYYUMPqFLCN3q
 vw3sK4gVP0Ad8FbzQjMrXgyMq/RGX0Zdbus6fU7KGgwsZssYR1119SGtUlWzX7DxH3Fi
 2IhctqOwZ9iTZdGFMhq2mIA0zASY6u7KNTtGHfZ/hmhKHEYQwGp62+8O7q9dFn1y7Tux
 e0LA==
X-Gm-Message-State: AOAM532r5wjd8nVFiK5/NkbYxf+cK3i2xQ5Fqbxhlpt2L3nv1yKE2yBq
 tN1spbJSYeWriCBYIbPVtsI=
X-Google-Smtp-Source: ABdhPJxkb6RUPIBzwYQiSBrp+AitBo6hp1cBKHpnuOhqRgnsIEu24oMo56Vx5VfhUm4ap09nC3WDZg==
X-Received: by 2002:a19:be16:: with SMTP id o22mr15087043lff.109.1608228479360; 
 Thu, 17 Dec 2020 10:07:59 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 10:07:58 -0800 (PST)
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
Subject: [PATCH v2 34/48] gpu: host1x: Support power management
Date: Thu, 17 Dec 2020 21:06:24 +0300
Message-Id: <20201217180638.22748-35-digetx@gmail.com>
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

Add suspend/resume and generic power domain support to the Host1x driver.
This is required for enabling system-wide DVFS and supporting dynamic
power management using a generic power domain.

Tested-by: Peter Geis <pgwipeout@gmail.com>
Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/host1x/dev.c | 102 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 91 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index d0ebb70e2fdd..c1525cffe7b1 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/of.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 
 #define CREATE_TRACE_POINTS
@@ -417,7 +418,7 @@ static int host1x_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	host->rst = devm_reset_control_get(&pdev->dev, "host1x");
+	host->rst = devm_reset_control_get_exclusive_released(&pdev->dev, "host1x");
 	if (IS_ERR(host->rst)) {
 		err = PTR_ERR(host->rst);
 		dev_err(&pdev->dev, "failed to get reset: %d\n", err);
@@ -437,16 +438,15 @@ static int host1x_probe(struct platform_device *pdev)
 		goto iommu_exit;
 	}
 
-	err = clk_prepare_enable(host->clk);
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to enable clock\n");
-		goto free_channels;
-	}
+	pm_runtime_enable(&pdev->dev);
+	err = pm_runtime_get_sync(&pdev->dev);
+	if (err < 0)
+		goto rpm_disable;
 
 	err = reset_control_deassert(host->rst);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to deassert reset: %d\n", err);
-		goto unprepare_disable;
+		goto rpm_disable;
 	}
 
 	err = host1x_syncpt_init(host);
@@ -485,9 +485,10 @@ static int host1x_probe(struct platform_device *pdev)
 	host1x_syncpt_deinit(host);
 reset_assert:
 	reset_control_assert(host->rst);
-unprepare_disable:
-	clk_disable_unprepare(host->clk);
-free_channels:
+rpm_disable:
+	pm_runtime_put(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+
 	host1x_channel_list_free(&host->channel_list);
 iommu_exit:
 	host1x_iommu_exit(host);
@@ -504,16 +505,95 @@ static int host1x_remove(struct platform_device *pdev)
 	host1x_intr_deinit(host);
 	host1x_syncpt_deinit(host);
 	reset_control_assert(host->rst);
-	clk_disable_unprepare(host->clk);
+	pm_runtime_put(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
 	host1x_iommu_exit(host);
 
 	return 0;
 }
 
+static int __maybe_unused host1x_runtime_suspend(struct device *dev)
+{
+	struct host1x *host = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(host->clk);
+	reset_control_release(host->rst);
+
+	return 0;
+}
+
+static int __maybe_unused host1x_runtime_resume(struct device *dev)
+{
+	struct host1x *host = dev_get_drvdata(dev);
+	int err;
+
+	err = reset_control_acquire(host->rst);
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
+	return 0;
+
+release_reset:
+	reset_control_release(host->rst);
+
+	return err;
+}
+
+static __maybe_unused int host1x_suspend(struct device *dev)
+{
+	struct host1x *host = dev_get_drvdata(dev);
+	int err;
+
+	host1x_syncpt_save(host);
+
+	err = pm_runtime_force_suspend(dev);
+	if (err < 0)
+		return err;
+
+	return 0;
+}
+
+static __maybe_unused int host1x_resume(struct device *dev)
+{
+	struct host1x *host = dev_get_drvdata(dev);
+	struct host1x_channel *channel;
+	unsigned int index;
+	int err;
+
+	err = pm_runtime_force_resume(dev);
+	if (err < 0)
+		return err;
+
+	host1x_syncpt_restore(host);
+
+	for_each_set_bit(index, host->channel_list.allocated_channels,
+			 host->info->nb_channels) {
+		channel = &host->channel_list.channels[index];
+		host1x_hw_channel_init(host, channel, channel->id);
+	}
+
+	return 0;
+}
+
+static const struct dev_pm_ops host1x_pm = {
+	SET_RUNTIME_PM_OPS(host1x_runtime_suspend, host1x_runtime_resume,
+			   NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(host1x_suspend, host1x_resume)
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
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
