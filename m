Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB3E2E91EC
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 09:39:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DF7089C28;
	Mon,  4 Jan 2021 08:39:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA61089895;
 Sun,  3 Jan 2021 03:56:59 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id hk16so8356902pjb.4;
 Sat, 02 Jan 2021 19:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=UYvvP6SStchIhnOCc/d2wO2luke2y75zaTjf1k4T2Gc=;
 b=lRhaXcQf+r5f3C6MFuktoCpUcGXDv+WzTWpQU9uFbd8tMxVgdzi2F19mlgk0WTSzWw
 JSQJKBV1A7YHffSJVtpzhAStCmrKxZu8eaQTwaBrcUyEE5ZWRfAVuujWCcwbTq+nG5y0
 BtJ76pMOyL9ReowwYpmf6+rp3LBpSFZe9qFLaMxKC8Hsp0GY53GUvx5y7X3E+JQ4301L
 khHs5diQLNpB08Ncf58Hi15L0rbkiF6I3AxLUixuXNY4sEn6/1bf4prjKGaySV4PZld8
 kzZuISyPM92YQI2xQjm4qXT9E+lfwtKHbAyAneEkLXc5gdFyETACmNQDvJ8lSSKw2KBq
 zgpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=UYvvP6SStchIhnOCc/d2wO2luke2y75zaTjf1k4T2Gc=;
 b=rYwlNf1ZI5bu20Xk0vTPk6e3ABNAfsUe/cp/GR6/Dk33YHKsFLDY60q/BThyn1A8aY
 r7F+mJz1Zz0sNTn/wr+4xKYI92QshB5XVHosTovEz6uHT2Y2YEaFxHv+Z0ElZJA9Ysd4
 gkeGJ4+w3bpVL7OlLM3iuBsUa0NTzDHWz7vlsSq1RmaYQRwd5vQFqvrb0vTectLltuzF
 Z7tGSyJw27Sg/HFHqJ3qtyGF/ZN8Ntsk2qmKWcYvTFOfdWbsuhgPwtluvt/uujhQe3je
 RDmrkjnUNBd8rfJbZ5hKAvTjKeLiH4KvdHOy5O2K/XEbsy0Jlj7Rpzum0+2Fn3h7/qcs
 TJyA==
X-Gm-Message-State: AOAM5318yLVrIz72SHPynm3pE4YvoEC5o/jdJetn7C9BE5W/Z9zbZRe1
 WAsMg8tyGRcTNpFz/rFSckM=
X-Google-Smtp-Source: ABdhPJx3h+oZWgPqlK+4gKf036fKNpQsVwd9V4GzEO/e57owVPNM0pZq32dnWf5IdKt6unK4FXIp7Q==
X-Received: by 2002:a17:90b:68e:: with SMTP id
 m14mr23932071pjz.228.1609646219284; 
 Sat, 02 Jan 2021 19:56:59 -0800 (PST)
Received: from localhost.localdomain ([43.255.31.23])
 by smtp.gmail.com with ESMTPSA id iq3sm17030533pjb.57.2021.01.02.19.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jan 2021 19:56:58 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: myungjoo.ham@samsung.com, kyungmin.park@samsung.com, cw00.choi@samsung.com,
 krzk@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 digetx@gmail.com, thierry.reding@gmail.com, jonathanh@nvidia.com,
 yuq825@gmail.com, airlied@linux.ie, daniel@ffwll.ch, robdclark@gmail.com,
 sean@poorly.run, robh@kernel.org, tomeu.vizoso@collabora.com,
 steven.price@arm.com, alyssa.rosenzweig@collabora.com,
 stanimir.varbanov@linaro.org, agross@kernel.org,
 bjorn.andersson@linaro.org, mchehab@kernel.org, lukasz.luba@arm.com,
 adrian.hunter@intel.com, ulf.hansson@linaro.org, vireshk@kernel.org,
 nm@ti.com, sboyd@kernel.org, broonie@kernel.org,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, rjw@rjwysocki.net,
 jcrouse@codeaurora.org, hoegsberg@google.com, eric@anholt.net,
 tzimmermann@suse.de, marijn.suijten@somainline.org, gustavoars@kernel.org,
 emil.velikov@collabora.com, jonathan@marek.ca, akhilpo@codeaurora.org,
 smasetty@codeaurora.org, airlied@redhat.com, masneyb@onstation.org,
 kalyan_t@codeaurora.org, tanmay@codeaurora.org, tiny.windzz@gmail.com,
 ddavenport@chromium.org, jsanka@codeaurora.org, rnayak@codeaurora.org,
 tongtiangen@huawei.com, miaoqinglang@huawei.com, khsieh@codeaurora.org,
 abhinavk@codeaurora.org, chandanu@codeaurora.org, groeck@chromium.org,
 varar@codeaurora.org, mka@chromium.org, harigovi@codeaurora.org,
 rikard.falkeborn@gmail.com, natechancellor@gmail.com,
 georgi.djakov@linaro.org, akashast@codeaurora.org, parashar@codeaurora.org,
 dianders@chromium.org
Subject: [PATCH 30/31] PM / devfreq: exynos: convert to use devm_pm_opp_* API
Date: Sun,  3 Jan 2021 03:56:39 +0000
Message-Id: <20210103035639.24076-1-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 04 Jan 2021 08:39:01 +0000
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
Cc: linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use devm_pm_opp_* API to simplify code, and remove opp_table
from exynos_bus.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/devfreq/exynos-bus.c | 42 ++++++++----------------------------
 1 file changed, 9 insertions(+), 33 deletions(-)

diff --git a/drivers/devfreq/exynos-bus.c b/drivers/devfreq/exynos-bus.c
index e689101abc93..51752e5ce980 100644
--- a/drivers/devfreq/exynos-bus.c
+++ b/drivers/devfreq/exynos-bus.c
@@ -33,7 +33,6 @@ struct exynos_bus {
 
 	unsigned long curr_freq;
 
-	struct opp_table *opp_table;
 	struct clk *clk;
 	unsigned int ratio;
 };
@@ -159,10 +158,7 @@ static void exynos_bus_exit(struct device *dev)
 
 	platform_device_unregister(bus->icc_pdev);
 
-	dev_pm_opp_of_remove_table(dev);
 	clk_disable_unprepare(bus->clk);
-	dev_pm_opp_put_regulators(bus->opp_table);
-	bus->opp_table = NULL;
 }
 
 static void exynos_bus_passive_exit(struct device *dev)
@@ -171,7 +167,6 @@ static void exynos_bus_passive_exit(struct device *dev)
 
 	platform_device_unregister(bus->icc_pdev);
 
-	dev_pm_opp_of_remove_table(dev);
 	clk_disable_unprepare(bus->clk);
 }
 
@@ -183,15 +178,13 @@ static int exynos_bus_parent_parse_of(struct device_node *np,
 	const char *vdd = "vdd";
 	int i, ret, count, size;
 
-	opp_table = dev_pm_opp_set_regulators(dev, &vdd, 1);
+	opp_table = devm_pm_opp_set_regulators(dev, &vdd, 1);
 	if (IS_ERR(opp_table)) {
 		ret = PTR_ERR(opp_table);
 		dev_err(dev, "failed to set regulators %d\n", ret);
 		return ret;
 	}
 
-	bus->opp_table = opp_table;
-
 	/*
 	 * Get the devfreq-event devices to get the current utilization of
 	 * buses. This raw data will be used in devfreq ondemand governor.
@@ -199,25 +192,20 @@ static int exynos_bus_parent_parse_of(struct device_node *np,
 	count = devfreq_event_get_edev_count(dev, "devfreq-events");
 	if (count < 0) {
 		dev_err(dev, "failed to get the count of devfreq-event dev\n");
-		ret = count;
-		goto err_regulator;
+		return count;
 	}
 	bus->edev_count = count;
 
 	size = sizeof(*bus->edev) * count;
 	bus->edev = devm_kzalloc(dev, size, GFP_KERNEL);
-	if (!bus->edev) {
-		ret = -ENOMEM;
-		goto err_regulator;
-	}
+	if (!bus->edev)
+		return -ENOMEM;
 
 	for (i = 0; i < count; i++) {
 		bus->edev[i] = devfreq_event_get_edev_by_phandle(dev,
 							"devfreq-events", i);
-		if (IS_ERR(bus->edev[i])) {
-			ret = -EPROBE_DEFER;
-			goto err_regulator;
-		}
+		if (IS_ERR(bus->edev[i]))
+			return -EPROBE_DEFER;
 	}
 
 	/*
@@ -234,12 +222,6 @@ static int exynos_bus_parent_parse_of(struct device_node *np,
 		bus->ratio = DEFAULT_SATURATION_RATIO;
 
 	return 0;
-
-err_regulator:
-	dev_pm_opp_put_regulators(bus->opp_table);
-	bus->opp_table = NULL;
-
-	return ret;
 }
 
 static int exynos_bus_parse_of(struct device_node *np,
@@ -264,7 +246,7 @@ static int exynos_bus_parse_of(struct device_node *np,
 	}
 
 	/* Get the freq and voltage from OPP table to scale the bus freq */
-	ret = dev_pm_opp_of_add_table(dev);
+	ret = devm_pm_opp_of_add_table(dev);
 	if (ret < 0) {
 		dev_err(dev, "failed to get OPP table\n");
 		goto err_clk;
@@ -276,15 +258,13 @@ static int exynos_bus_parse_of(struct device_node *np,
 	if (IS_ERR(opp)) {
 		dev_err(dev, "failed to find dev_pm_opp\n");
 		ret = PTR_ERR(opp);
-		goto err_opp;
+		goto err_clk;
 	}
 	bus->curr_freq = dev_pm_opp_get_freq(opp);
 	dev_pm_opp_put(opp);
 
 	return 0;
 
-err_opp:
-	dev_pm_opp_of_remove_table(dev);
 err_clk:
 	clk_disable_unprepare(bus->clk);
 
@@ -425,7 +405,7 @@ static int exynos_bus_probe(struct platform_device *pdev)
 	/* Parse the device-tree to get the resource information */
 	ret = exynos_bus_parse_of(np, bus);
 	if (ret < 0)
-		goto err_reg;
+		return ret;
 
 	if (passive)
 		ret = exynos_bus_profile_init_passive(bus, profile);
@@ -456,11 +436,7 @@ static int exynos_bus_probe(struct platform_device *pdev)
 	return 0;
 
 err:
-	dev_pm_opp_of_remove_table(dev);
 	clk_disable_unprepare(bus->clk);
-err_reg:
-	dev_pm_opp_put_regulators(bus->opp_table);
-	bus->opp_table = NULL;
 
 	return ret;
 }
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
