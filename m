Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 739E22E91CF
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 09:39:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32118896E9;
	Mon,  4 Jan 2021 08:39:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4487C89B96;
 Fri,  1 Jan 2021 16:58:09 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id s15so11248741plr.9;
 Fri, 01 Jan 2021 08:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=7eakgo8QJNSQOzZIp+kIaMol/JySCEaf1ptbvEAaka0=;
 b=DHzNSUdvyWGgCdH/SvWiCsESLnMfgYC/Qbc8CIEcqHoxqaru1aKzzfk8A9sBn5wvsG
 MIDRwm0er7cZAcPNY2mE4+mtDbknzjXm43fnYcOb1U11EgHjgga4/gfufvavm0NBqP+y
 OcWjBDwLp+tHWtA+pBTwQCQYBVh4pUDGfLh54yMKewA0b7tWVjzCXHs8MuEiMC7Sg4bz
 Tslq0Xhmjp5WQDk/k4rROsXHti8aAqbazzO5SspRw+obRGrKxd3evdGHYCIGXGR8T0Vb
 Mf3gIEIos2/O2XKzc9f1WBkkXTA1APCm3M29sv3UqR95xy87Ng0dPz4TIAykuWWOz9D9
 xDtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=7eakgo8QJNSQOzZIp+kIaMol/JySCEaf1ptbvEAaka0=;
 b=HMXXNaFuH96tkeYt5zfjIyUAdtrkjtbdwynkirdA+p6L/nLmzdK8Y6lh/lnbsXBmF1
 d58GsHTak6YDU0r8PZrIxe2ZeziBBnTvgbAOBWMrAi/xgoVgM/JN14b8zX823+kwR5pA
 aMF/XUQ2H9Eh/AGYGO89MdSWmTrIFfBbtKoO2dCkVR5YLMwib4cnj3ChneKFwuZWsapB
 /3uxvLGo6C1v5UBm7y3hVkzLlRV7EzWu3Axp6RsfmsC5NQSLKBZWceWAFlsOGlsKNvXx
 8bsCrTo4Lu511WUvdqPiHwxCVGyE/paUSSKqOJE0Rm5froMwTT3LS2hN8oCDhxH7y+/3
 nZkQ==
X-Gm-Message-State: AOAM533Rc3crPu/PXAlWKWU5UiprF8wPf41uSBMNGybXGiU4wtcyQ920
 NLO8ZTpY7Fn1/IpsAyYuYBc=
X-Google-Smtp-Source: ABdhPJxj836hq8IHDM7wBHmGNMR++3q92xi77JSpCMFpBgRNCI8v5QOGIWumKF44tZ/O5Tx8//m4QA==
X-Received: by 2002:a17:90b:4b0a:: with SMTP id
 lx10mr18398745pjb.205.1609520288920; 
 Fri, 01 Jan 2021 08:58:08 -0800 (PST)
Received: from localhost.localdomain ([43.255.31.23])
 by smtp.gmail.com with ESMTPSA id 84sm50002729pfy.9.2021.01.01.08.57.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jan 2021 08:58:08 -0800 (PST)
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
Subject: [PATCH 12/31] mmc: sdhci-msm: convert to use devm_pm_opp_* API
Date: Fri,  1 Jan 2021 16:54:48 +0000
Message-Id: <20210101165507.19486-13-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210101165507.19486-1-tiny.windzz@gmail.com>
References: <20210101165507.19486-1-tiny.windzz@gmail.com>
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
from sdhci_msm_host.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/mmc/host/sdhci-msm.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 094ef95f5ecc..490ba5d68f72 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -261,7 +261,6 @@ struct sdhci_msm_host {
 	struct clk_bulk_data bulk_clks[4]; /* core, iface, cal, sleep clocks */
 	unsigned long clk_rate;
 	struct mmc_host *mmc;
-	struct opp_table *opp_table;
 	bool use_14lpp_dll_reset;
 	bool tuning_done;
 	bool calibration_done;
@@ -2215,6 +2214,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 	const struct sdhci_msm_offset *msm_offset;
 	const struct sdhci_msm_variant_info *var_info;
 	struct device_node *node = pdev->dev.of_node;
+	struct opp_table *opp_table;
 
 	host = sdhci_pltfm_init(pdev, &sdhci_msm_pdata, sizeof(*msm_host));
 	if (IS_ERR(host))
@@ -2283,16 +2283,16 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 	if (ret)
 		goto bus_clk_disable;
 
-	msm_host->opp_table = dev_pm_opp_set_clkname(&pdev->dev, "core");
-	if (IS_ERR(msm_host->opp_table)) {
-		ret = PTR_ERR(msm_host->opp_table);
+	opp_table = devm_pm_opp_set_clkname(&pdev->dev, "core");
+	if (IS_ERR(opp_table)) {
+		ret = PTR_ERR(opp_table);
 		goto bus_clk_disable;
 	}
 
 	/* OPP table is optional */
-	ret = dev_pm_opp_of_add_table(&pdev->dev);
+	ret = devm_pm_opp_of_add_table(&pdev->dev);
 	if (ret) {
-		dev_pm_opp_put_clkname(msm_host->opp_table);
+		devm_pm_opp_put_clkname(&pdev->dev, opp_table);
 		if (ret != -ENODEV) {
 			dev_err(&pdev->dev, "Invalid OPP table in Device tree\n");
 			goto bus_clk_disable;
@@ -2317,7 +2317,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 	ret = clk_bulk_prepare_enable(ARRAY_SIZE(msm_host->bulk_clks),
 				      msm_host->bulk_clks);
 	if (ret)
-		goto opp_cleanup;
+		goto bus_clk_disable;
 
 	/*
 	 * xo clock is needed for FLL feature of cm_dll.
@@ -2462,9 +2462,6 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 clk_disable:
 	clk_bulk_disable_unprepare(ARRAY_SIZE(msm_host->bulk_clks),
 				   msm_host->bulk_clks);
-opp_cleanup:
-	dev_pm_opp_of_remove_table(&pdev->dev);
-	dev_pm_opp_put_clkname(msm_host->opp_table);
 bus_clk_disable:
 	if (!IS_ERR(msm_host->bus_clk))
 		clk_disable_unprepare(msm_host->bus_clk);
@@ -2483,8 +2480,6 @@ static int sdhci_msm_remove(struct platform_device *pdev)
 
 	sdhci_remove_host(host, dead);
 
-	dev_pm_opp_of_remove_table(&pdev->dev);
-	dev_pm_opp_put_clkname(msm_host->opp_table);
 	pm_runtime_get_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
