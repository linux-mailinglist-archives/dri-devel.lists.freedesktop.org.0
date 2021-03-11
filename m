Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E07DE337D98
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 20:22:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D626EBA5;
	Thu, 11 Mar 2021 19:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 187D86EB7B;
 Thu, 11 Mar 2021 19:21:48 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id n16so41668497lfb.4;
 Thu, 11 Mar 2021 11:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZgYus6DBQosirfGlNEj0LdZlOnHUTyxoaJZjhLGd/L0=;
 b=iG68xEJ1rPKedzgVFT+WFb3HOW7Gq+Djdt4N7bEIPXrY9qQ81UtM3SGWhY7lko0aKU
 ZBXk8wrYsxuXPbR3wY0UYjlzy4Si8tI8r8Enwl8FISf93ghhhdhVLGL/ws9liY2n0ytH
 jG1n80WJrja62xahZ9IxijE7hDRWWUmqZzfASYmKSN7bRiytOZYdcZAC+bC2aZ5gRKTR
 t/uzxRhHJllBBM89fni9KjIZOLgofci5BXjngnoHCLSY07o0IYFa8lb6SY7ASr/PpIP6
 bciNluyH5C4JrVZvso0u0rpIp7RAUMiEgTS1miIbDSfgjw3TXyWqq/uCFOXJwb5ktcUF
 Islg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZgYus6DBQosirfGlNEj0LdZlOnHUTyxoaJZjhLGd/L0=;
 b=b7BQl0Me0diIOw3bQNyv7sTH9M/R2jhz9BClbD/c2ypX/gUOt0BRBe+stCICg64mIj
 Co0hZdM9eec/3atSiFhu+ltPy4xtk1Ih+ds0X4OEgJg6TB0rYVtC3dsRs9zmduAvmRS2
 f2WkpU+RHvE88XxSkY+9iyB3xlnd98Yi6vUfZQ15Or4e0FBHf4DWkQfowqLG8PzMPe2p
 4gv4uztbh4GU1wHdM0p6ItgH8Mt1pAb8Hz4+aYIdYQJYe5ys1mwaJPvVNshe5gVk4nTC
 LYBJ/eGDon5PrW4LFm40jlO+VWRTDqpp3r2PKPx5WgJS4qc9FgMHF2NaTotOGjAkxUAk
 kqWw==
X-Gm-Message-State: AOAM532WSIbtw8SZjbU/eCOdBOpxIHUTg0HfqXuMuVcb1mhd1OgOYCxQ
 2f6MUkZB+NvGbvrMYIAp2mY=
X-Google-Smtp-Source: ABdhPJygLYQbFH51/pquuKZaD25I4ennvq32DKK7qa95SUOL6itcbaAkb19H3NvAx4bH2GUqkfVBog==
X-Received: by 2002:ac2:53a1:: with SMTP id j1mr3121899lfh.298.1615490506564; 
 Thu, 11 Mar 2021 11:21:46 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id u14sm1121153lfl.40.2021.03.11.11.21.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 11:21:46 -0800 (PST)
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
Subject: [PATCH v2 08/14] spi: spi-qcom-qspi: Convert to use resource-managed
 OPP API
Date: Thu, 11 Mar 2021 22:20:59 +0300
Message-Id: <20210311192105.14998-9-digetx@gmail.com>
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
Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/spi/spi-qcom-qspi.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/spi/spi-qcom-qspi.c b/drivers/spi/spi-qcom-qspi.c
index 1dbcc410cd35..f14801dd5120 100644
--- a/drivers/spi/spi-qcom-qspi.c
+++ b/drivers/spi/spi-qcom-qspi.c
@@ -142,7 +142,6 @@ struct qcom_qspi {
 	struct clk_bulk_data *clks;
 	struct qspi_xfer xfer;
 	struct icc_path *icc_path_cpu_to_qspi;
-	struct opp_table *opp_table;
 	unsigned long last_speed;
 	/* Lock to protect data accessed by IRQs */
 	spinlock_t lock;
@@ -459,6 +458,7 @@ static int qcom_qspi_probe(struct platform_device *pdev)
 	struct device *dev;
 	struct spi_master *master;
 	struct qcom_qspi *ctrl;
+	struct opp_table *opp_table;
 
 	dev = &pdev->dev;
 
@@ -530,14 +530,14 @@ static int qcom_qspi_probe(struct platform_device *pdev)
 	master->handle_err = qcom_qspi_handle_err;
 	master->auto_runtime_pm = true;
 
-	ctrl->opp_table = dev_pm_opp_set_clkname(&pdev->dev, "core");
-	if (IS_ERR(ctrl->opp_table))
-		return PTR_ERR(ctrl->opp_table);
+	opp_table = devm_pm_opp_set_clkname(&pdev->dev, "core");
+	if (IS_ERR(opp_table))
+		return PTR_ERR(opp_table);
 	/* OPP table is optional */
-	ret = dev_pm_opp_of_add_table(&pdev->dev);
+	ret = devm_pm_opp_of_add_table(&pdev->dev);
 	if (ret && ret != -ENODEV) {
 		dev_err(&pdev->dev, "invalid OPP table in device tree\n");
-		goto exit_probe_put_clkname;
+		return ret;
 	}
 
 	pm_runtime_use_autosuspend(dev);
@@ -549,10 +549,6 @@ static int qcom_qspi_probe(struct platform_device *pdev)
 		return 0;
 
 	pm_runtime_disable(dev);
-	dev_pm_opp_of_remove_table(&pdev->dev);
-
-exit_probe_put_clkname:
-	dev_pm_opp_put_clkname(ctrl->opp_table);
 
 	return ret;
 }
@@ -560,14 +556,11 @@ static int qcom_qspi_probe(struct platform_device *pdev)
 static int qcom_qspi_remove(struct platform_device *pdev)
 {
 	struct spi_master *master = platform_get_drvdata(pdev);
-	struct qcom_qspi *ctrl = spi_master_get_devdata(master);
 
 	/* Unregister _before_ disabling pm_runtime() so we stop transfers */
 	spi_unregister_master(master);
 
 	pm_runtime_disable(&pdev->dev);
-	dev_pm_opp_of_remove_table(&pdev->dev);
-	dev_pm_opp_put_clkname(ctrl->opp_table);
 
 	return 0;
 }
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
