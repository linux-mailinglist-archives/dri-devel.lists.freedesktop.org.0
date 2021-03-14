Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9C633A60B
	for <lists+dri-devel@lfdr.de>; Sun, 14 Mar 2021 17:34:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4885B89FF9;
	Sun, 14 Mar 2021 16:34:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EDCC89FDE;
 Sun, 14 Mar 2021 16:34:52 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 124-20020a1c00820000b029010b871409cfso18823904wma.4; 
 Sun, 14 Mar 2021 09:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ekucTjVivEQ90zhQvUqUcTjBwjviVC3YtIBQBVEBzF4=;
 b=Qd9you/7YOWedpOG1hvsUbVfiK6yVG8ZIN1eeu8EeN0oBoynBCJqewyO2AUV65SZK4
 I3/qUxhda2DRofX+y5Vqzu7fqIzYlw2DqB+9jK9UAHSKpj5NqscMLcQGNg5ShHKQfseN
 8ivwaU4F/qGeJzS3bjBg9hwpVynsI36qfyRUWF5oAsyeMHhD9eyj9sanwrZaRgjA1csz
 yXvSdS9/m9UEcj2BykHoqz+Qc9Y3YRGVU05CVjS9XwXdFImfbjbQRIGqwNEkZjWrmoX8
 NG4olmzn8kZdcomDkFWi0DHlUc491i2dog4piB204tHMBvUEHJJW7aM4l7e/XtJyJMo5
 HACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ekucTjVivEQ90zhQvUqUcTjBwjviVC3YtIBQBVEBzF4=;
 b=QzAwhtVf2mKe+X0wzzXlIDIonCzmUJqtG8ybraky/R/viLA/cjZhFt+TILDUi1K38I
 DYYwR/H0eAzPb2Xf8Sw2Da++PNqf0Ofr4Tl5I5mEzaj7ctyfRB+cZKVB0Y/UN1RwbjZE
 ZR6/dAEyKeKxHorUEEGs8hBoQfuj2YPkl/d1WXcPZxebbwUnxVlb/QnrjK6ANzd/DwjH
 FVbQGtXkEH10J5eK9Ah+kAsXJiIKXttToX1xmIfYk9wR6F3HLLd+mDwtbIQglP3ekuUs
 1QgfAXoJLripWuPggH9v14oS59COk+zjXKrKtZaiq/lVnX1FWhV9H4nbpJiVlojHtwKH
 pnZg==
X-Gm-Message-State: AOAM531JIrRoLjmiWo49F0Uj/ahQYo/5YfH3xyiyng/FRRCS7tV47Xw6
 q03ObYStEZJUEbChnOCuuj4=
X-Google-Smtp-Source: ABdhPJxCnEzz9dJy2Xdztr6bWqPxnNPEWIx01FtULZIwAIx6ZrM+uJHA7UaOro3z3yHFaKdZAMcN2g==
X-Received: by 2002:a05:600c:4013:: with SMTP id
 i19mr16812944wmm.33.1615739690935; 
 Sun, 14 Mar 2021 09:34:50 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id o7sm15723239wrs.16.2021.03.14.09.34.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 09:34:50 -0700 (PDT)
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
Subject: [PATCH v3 10/15] mmc: sdhci-msm: Convert to use resource-managed OPP
 API
Date: Sun, 14 Mar 2021 19:34:03 +0300
Message-Id: <20210314163408.22292-11-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210314163408.22292-1-digetx@gmail.com>
References: <20210314163408.22292-1-digetx@gmail.com>
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
 drivers/mmc/host/sdhci-msm.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 5e1da4df096f..d170c919e6e4 100644
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
@@ -2551,17 +2550,15 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 	if (ret)
 		goto bus_clk_disable;
 
-	msm_host->opp_table = dev_pm_opp_set_clkname(&pdev->dev, "core");
-	if (IS_ERR(msm_host->opp_table)) {
-		ret = PTR_ERR(msm_host->opp_table);
+	ret = devm_pm_opp_set_clkname(&pdev->dev, "core");
+	if (ret)
 		goto bus_clk_disable;
-	}
 
 	/* OPP table is optional */
-	ret = dev_pm_opp_of_add_table(&pdev->dev);
+	ret = devm_pm_opp_of_add_table(&pdev->dev);
 	if (ret && ret != -ENODEV) {
 		dev_err(&pdev->dev, "Invalid OPP table in Device tree\n");
-		goto opp_put_clkname;
+		goto bus_clk_disable;
 	}
 
 	/* Vote for maximum clock rate for maximum performance */
@@ -2587,7 +2584,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 	ret = clk_bulk_prepare_enable(ARRAY_SIZE(msm_host->bulk_clks),
 				      msm_host->bulk_clks);
 	if (ret)
-		goto opp_cleanup;
+		goto bus_clk_disable;
 
 	/*
 	 * xo clock is needed for FLL feature of cm_dll.
@@ -2732,10 +2729,6 @@ static int sdhci_msm_probe(struct platform_device *pdev)
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
@@ -2754,8 +2747,6 @@ static int sdhci_msm_remove(struct platform_device *pdev)
 
 	sdhci_remove_host(host, dead);
 
-	dev_pm_opp_of_remove_table(&pdev->dev);
-	dev_pm_opp_put_clkname(msm_host->opp_table);
 	pm_runtime_get_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
