Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF612E91E2
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 09:39:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 561ED89C86;
	Mon,  4 Jan 2021 08:39:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FA0B89B96;
 Fri,  1 Jan 2021 16:57:31 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id be12so11269936plb.4;
 Fri, 01 Jan 2021 08:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QL0c76+cwCn5yAglt4+zElDUfZaRHbJPLdQTpoHhGYU=;
 b=Y+9lv5dWbKyYAJ/ClVSP+pv2PArsQGJbQyWRu/qeU0DsmqfM/l6jym2jIpyQs6Q9kc
 fK2JZc8R1HS+FdKlGTBwTD6w154PkNUoQsxXlA+AjkS7ktlWmSoj4kj3Oswcqrjn7nZY
 EyusFgrUe4EkcEt+y+fxOw4/NLHq2hoaoCCJPTDXmzwinzvgs2M9XW29sduIARVNhuYN
 U3fT23BVJGGji0bj1iLiFoz6LhEXd6tPCdArUefuUAQ67n255WViuLvmGdJMrlBWTvCC
 pOJzc8rePC/1iGfZGark1bEF7g2brAm4KZLt6S26/OA3nsOztMquCasEoMM1LoHDK+ZH
 olaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QL0c76+cwCn5yAglt4+zElDUfZaRHbJPLdQTpoHhGYU=;
 b=JMyc6qHJj3cWUfyifO2famAj2q/PUB7gm+WGUdq99Hlu3vlL6x5Rn8VCSDu2FzmMm6
 lz/9E2GA2giQcJYe6pgeNsSWTfEDfSy+0E1jiZfp1sfhG3SyTOKm/BfZwBIo2wyGHRNV
 emiV9UWL1fRL7uFQpmFEWpPqT1eJbIspwP767lyAFEPZ4d5pOCFPIZr1xmONMh77eGy6
 16iRz+Kk3A2+K3n2xV+uClZM69eU4ZhuB9bABNSXbtmICXNXBMn0nFZS3nxHpC6qGSIz
 efu0kCr55nwiNnKeLOq/UeqMui0RhFKJDMq86+uLJU0vH0Uo+FkzahSad8VACD619tx5
 nb/A==
X-Gm-Message-State: AOAM532V12y80sSJwxG1CDZNJexiobZ64rCRCqh3i4v/fL+f59H/OwHP
 EfrEUvKlz2aKN3ieo+ocRCw=
X-Google-Smtp-Source: ABdhPJz8LP/LmWPkCqmhUs/au5VJnTNvDp/Po/jlRpsdL+ojaJ7zXZObSKoeY8Ng0wEbtxH6eA5eBw==
X-Received: by 2002:a17:902:599d:b029:da:fcfd:7088 with SMTP id
 p29-20020a170902599db02900dafcfd7088mr61658559pli.68.1609520251243; 
 Fri, 01 Jan 2021 08:57:31 -0800 (PST)
Received: from localhost.localdomain ([43.255.31.23])
 by smtp.gmail.com with ESMTPSA id 84sm50002729pfy.9.2021.01.01.08.57.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jan 2021 08:57:30 -0800 (PST)
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
Subject: [PATCH 09/31] spi: spi-qcom-qspi: fix potential mem leak in
 spi_geni_probe()
Date: Fri,  1 Jan 2021 16:54:45 +0000
Message-Id: <20210101165507.19486-10-tiny.windzz@gmail.com>
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

Use devm_pm_opp_* API to simplify code, and we don't need
to make opp_table glabal.

Let's remove opp_table from geni_se later.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/spi/spi-geni-qcom.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 2b5a164fecb9..e330c46a9243 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -590,6 +590,7 @@ static int spi_geni_probe(struct platform_device *pdev)
 	void __iomem *base;
 	struct clk *clk;
 	struct device *dev = &pdev->dev;
+	struct opp_table *opp_table;
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
@@ -615,13 +616,13 @@ static int spi_geni_probe(struct platform_device *pdev)
 	mas->se.wrapper = dev_get_drvdata(dev->parent);
 	mas->se.base = base;
 	mas->se.clk = clk;
-	mas->se.opp_table = dev_pm_opp_set_clkname(&pdev->dev, "se");
-	if (IS_ERR(mas->se.opp_table))
-		return PTR_ERR(mas->se.opp_table);
+	opp_table = devm_pm_opp_set_clkname(dev, "se");
+	if (IS_ERR(opp_table))
+		return PTR_ERR(opp_table);
 	/* OPP table is optional */
-	ret = dev_pm_opp_of_add_table(&pdev->dev);
+	ret = devm_pm_opp_of_add_table(dev);
 	if (ret) {
-		dev_pm_opp_put_clkname(mas->se.opp_table);
+		devm_pm_opp_put_clkname(dev, opp_table);
 		if (ret != -ENODEV) {
 			dev_err(&pdev->dev, "invalid OPP table in device tree\n");
 			return ret;
@@ -677,8 +678,6 @@ static int spi_geni_probe(struct platform_device *pdev)
 	free_irq(mas->irq, spi);
 spi_geni_probe_runtime_disable:
 	pm_runtime_disable(dev);
-	dev_pm_opp_of_remove_table(&pdev->dev);
-	dev_pm_opp_put_clkname(mas->se.opp_table);
 	return ret;
 }
 
@@ -692,8 +691,6 @@ static int spi_geni_remove(struct platform_device *pdev)
 
 	free_irq(mas->irq, spi);
 	pm_runtime_disable(&pdev->dev);
-	dev_pm_opp_of_remove_table(&pdev->dev);
-	dev_pm_opp_put_clkname(mas->se.opp_table);
 	return 0;
 }
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
