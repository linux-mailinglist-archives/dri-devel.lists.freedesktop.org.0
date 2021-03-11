Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD02337D9B
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 20:22:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C8376EBA7;
	Thu, 11 Mar 2021 19:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 638FD6EBA2;
 Thu, 11 Mar 2021 19:21:49 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id 18so41600823lff.6;
 Thu, 11 Mar 2021 11:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vS3wm59f4le8Afl6ZxS24ZfUERlBzy5l7ZL5c21NVPM=;
 b=ovb1OGelbwsWHZhjkB/hXxtb7alfZoynt3GMhzu/X2EYeIQ6iY53mX80dM4lGDlTut
 3XyH7YcDubvhXrL5wLJqDQdGQF2vE4kWFBVIis8q97MPMgwInRcAmwuAx5Le+JYYSh7/
 99ZiXVtlsZpkQZAzYmoopwXXYNU8gTTvILjTksIqR30ilUkd+6NpAi0Am1jXKeCeSns2
 XeGrfumTAUKiZZQaezh5nRmmXVGjB3ETev8Qzu1E1lDU59+TwfYUZXIWVA+arp9vU0f9
 1ETr7Ba1sI9l6n0fIL8Jd72pjVS6rMGM6E+fr4i3yAPoRnEn1WnoyKRbrdflrn6jy9I8
 fw8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vS3wm59f4le8Afl6ZxS24ZfUERlBzy5l7ZL5c21NVPM=;
 b=QzyL4WjNVypUjGI5WyDYqm5jJyPam49I03MLfO1FeGKAzuG30iTj+1yu5Hf3pishrW
 7DvnW3KO+nOAFNUoNSLcOwwAl2QM5AAe56dsppsGknyevyL5d30s+WxjnotKEPplGFCq
 g8hosBPIW1kWC32ZTgELmcIeRBbwd/mMqgf71uJAqZ7PebcZX7ZZnTI9gDXfWTk5u1sb
 KpSl59vb1LKMk9Y8+UnP5BjiAA8mngxoB3RI7xe3Kd18Qmq2LQ0FJCMzkrPl6wlGgw5b
 Wy3hkd/n1GE7VmssyB9oM0JttxoBol1YBtkorqF7Rb5DVUIs/PgveuusurShvI+RbATu
 5Q/w==
X-Gm-Message-State: AOAM532ozrcNC3znDSO7ZWPeV/RcnZueCYF12twuNOPTKN89iKqFk0LE
 gWQpPaFouEWNA3lG7WE1oeI=
X-Google-Smtp-Source: ABdhPJzntqJWCV8jEXSv+Jg4d79qCuNVeO2Gug3geWDV+HxIFiGLE5uafyLevg9iFn3sfJ5i0IRz8Q==
X-Received: by 2002:ac2:4d8e:: with SMTP id g14mr3116344lfe.572.1615490507805; 
 Thu, 11 Mar 2021 11:21:47 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id u14sm1121153lfl.40.2021.03.11.11.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 11:21:47 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Qiang Yu <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH v2 09/14] mmc: sdhci-msm: Convert to use resource-managed OPP
 API
Date: Thu, 11 Mar 2021 22:21:00 +0300
Message-Id: <20210311192105.14998-10-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210311192105.14998-1-digetx@gmail.com>
References: <20210311192105.14998-1-digetx@gmail.com>
MIME-Version: 1.0
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
Cc: linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
 lima@lists.freedesktop.org, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yangtao Li <tiny.windzz@gmail.com>

Use resource-managed OPP API to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/mmc/host/sdhci-msm.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 5e1da4df096f..af3f7bd764e8 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -264,7 +264,6 @@ struct sdhci_msm_host {
 	struct clk_bulk_data bulk_clks[5];
 	unsigned long clk_rate;
 	struct mmc_host *mmc;
-	struct opp_table *opp_table;
 	bool use_14lpp_dll_reset;
 	bool tuning_done;
 	bool calibration_done;
@@ -2483,6 +2482,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 	const struct sdhci_msm_offset *msm_offset;
 	const struct sdhci_msm_variant_info *var_info;
 	struct device_node *node = pdev->dev.of_node;
+	struct opp_table *opp_table;
 
 	host = sdhci_pltfm_init(pdev, &sdhci_msm_pdata, sizeof(*msm_host));
 	if (IS_ERR(host))
@@ -2551,17 +2551,17 @@ static int sdhci_msm_probe(struct platform_device *pdev)
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
 	if (ret && ret != -ENODEV) {
 		dev_err(&pdev->dev, "Invalid OPP table in Device tree\n");
-		goto opp_put_clkname;
+		goto bus_clk_disable;
 	}
 
 	/* Vote for maximum clock rate for maximum performance */
@@ -2587,7 +2587,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 	ret = clk_bulk_prepare_enable(ARRAY_SIZE(msm_host->bulk_clks),
 				      msm_host->bulk_clks);
 	if (ret)
-		goto opp_cleanup;
+		goto bus_clk_disable;
 
 	/*
 	 * xo clock is needed for FLL feature of cm_dll.
@@ -2732,10 +2732,6 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 clk_disable:
 	clk_bulk_disable_unprepare(ARRAY_SIZE(msm_host->bulk_clks),
 				   msm_host->bulk_clks);
-opp_cleanup:
-	dev_pm_opp_of_remove_table(&pdev->dev);
-opp_put_clkname:
-	dev_pm_opp_put_clkname(msm_host->opp_table);
 bus_clk_disable:
 	if (!IS_ERR(msm_host->bus_clk))
 		clk_disable_unprepare(msm_host->bus_clk);
@@ -2754,8 +2750,6 @@ static int sdhci_msm_remove(struct platform_device *pdev)
 
 	sdhci_remove_host(host, dead);
 
-	dev_pm_opp_of_remove_table(&pdev->dev);
-	dev_pm_opp_put_clkname(msm_host->opp_table);
 	pm_runtime_get_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
