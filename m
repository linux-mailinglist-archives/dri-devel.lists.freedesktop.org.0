Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E47B43A718
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 00:46:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADA3B6E2E6;
	Mon, 25 Oct 2021 22:46:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AD536E2DF
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 22:46:04 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id g36so15199695lfv.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 15:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=epiJBkohh4ZmYg/r7+Q6DcSDeXTiYkOM/HNEWohJN6I=;
 b=fZyLIi0aIAT00OpdUucYqOwlAsX5cCCXM5RWlmQfUKyTjDIjzWcZNAorNVXBiOvKQm
 3EMtlDPmhJyGde/fZUgV7V2nDrXsK6Rxb1Xo8NGnAEiaFg1GEmtsFMpHFlNzNukuPuDn
 iY79vApNej2tFRb+oK7SXuPisFBknI3Rb6dr2rw6qzUxZmhM25SC5Hmt2WboAjevktQE
 NHP4p/3yFDqth6LzhnQCkUHVbYu38oa4Xrhd1LWoixL/jFrXV0kLtF1UQr0OYBCJYU49
 UrL9XPxndsB2vDtqGyvzu0mstMnzqF6Q2iggiMiPP+f2DEt86xf55O1IQKJNeLHvTxYC
 ccRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=epiJBkohh4ZmYg/r7+Q6DcSDeXTiYkOM/HNEWohJN6I=;
 b=JzSlSmO3XsZ0pAfgtJqx0HzLY9ZgYkCtLElu8+eeotDqQeTEnDcR3DL7p41gr2M4Uh
 XqIxOx33xhQ7LjiisAxKP/TulJx+t2FCCXyfRTM0m/+ZymZ9ihaEGCBIIIcxlD1s7i1d
 7NZIrwYTYovOnghrkhWJFQJTyZtHglXJU7dv3k7/2C2C1wEELSRG9wsTUSHDnBuql6Yo
 y/Ull5HTGp0psUyRcGLxD9N5KtyG5q9TzmAdtspX6Js/tgfvwLuGAubeK2xDcZZSogAG
 dm/haG5Lc8jDHmzGTvswgOrJA+fSLxR9GvdGp1SlxsEj3XLrll9NCKWQrOd2cmN3xDt6
 dJQg==
X-Gm-Message-State: AOAM531KPLQi86d9JEWgQmNH5CzClO/rbTofS7H8vE2Dfhmy8g43Avnw
 +9IERIF79Sf8N/diC1hhofg=
X-Google-Smtp-Source: ABdhPJzPX/j5y0aukgUmWgucha8iyYlLr1g0M5v+R9wgHMvCixTzhkoI2jsuvKhy9SRjHOmyulDISA==
X-Received: by 2002:a05:6512:23a5:: with SMTP id
 c37mr589407lfv.19.1635201962919; 
 Mon, 25 Oct 2021 15:46:02 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id t20sm2040956lft.240.2021.10.25.15.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 15:46:02 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-mmc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, David Heidelberg <david@ixit.cz>
Subject: [PATCH v14 18/39] usb: chipidea: tegra: Add runtime PM and OPP support
Date: Tue, 26 Oct 2021 01:40:11 +0300
Message-Id: <20211025224032.21012-19-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211025224032.21012-1-digetx@gmail.com>
References: <20211025224032.21012-1-digetx@gmail.com>
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

The Tegra USB controller belongs to the core power domain and we're going
to enable GENPD support for the core domain. Now USB controller must be
resumed using runtime PM API in order to initialize the USB power state.
We already support runtime PM for the CI device, but CI's PM is separated
from the RPM managed by tegra-usb driver. Add runtime PM and OPP support
to the driver.

Acked-by: Peter Chen <peter.chen@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/usb/chipidea/ci_hdrc_tegra.c | 55 ++++++++++++++++++++++++----
 1 file changed, 48 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
index 60361141ac04..0fff1e4407ca 100644
--- a/drivers/usb/chipidea/ci_hdrc_tegra.c
+++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
@@ -7,6 +7,7 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/reset.h>
 
 #include <linux/usb.h>
@@ -15,6 +16,8 @@
 #include <linux/usb/of.h>
 #include <linux/usb/phy.h>
 
+#include <soc/tegra/common.h>
+
 #include "../host/ehci.h"
 
 #include "ci.h"
@@ -278,6 +281,8 @@ static int tegra_usb_probe(struct platform_device *pdev)
 	if (!usb)
 		return -ENOMEM;
 
+	platform_set_drvdata(pdev, usb);
+
 	soc = of_device_get_match_data(&pdev->dev);
 	if (!soc) {
 		dev_err(&pdev->dev, "failed to match OF data\n");
@@ -296,11 +301,17 @@ static int tegra_usb_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	err = clk_prepare_enable(usb->clk);
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to enable clock: %d\n", err);
+	err = devm_pm_runtime_enable(&pdev->dev);
+	if (err)
+		return err;
+
+	err = devm_tegra_core_dev_init_opp_table_common(&pdev->dev);
+	if (err)
+		return err;
+
+	err = pm_runtime_resume_and_get(&pdev->dev);
+	if (err)
 		return err;
-	}
 
 	if (device_property_present(&pdev->dev, "nvidia,needs-double-reset"))
 		usb->needs_double_reset = true;
@@ -320,8 +331,6 @@ static int tegra_usb_probe(struct platform_device *pdev)
 	if (err)
 		goto fail_power_off;
 
-	platform_set_drvdata(pdev, usb);
-
 	/* setup and register ChipIdea HDRC device */
 	usb->soc = soc;
 	usb->data.name = "tegra-usb";
@@ -350,7 +359,8 @@ static int tegra_usb_probe(struct platform_device *pdev)
 phy_shutdown:
 	usb_phy_shutdown(usb->phy);
 fail_power_off:
-	clk_disable_unprepare(usb->clk);
+	pm_runtime_put_sync_suspend(&pdev->dev);
+
 	return err;
 }
 
@@ -360,15 +370,46 @@ static int tegra_usb_remove(struct platform_device *pdev)
 
 	ci_hdrc_remove_device(usb->dev);
 	usb_phy_shutdown(usb->phy);
+
+	pm_runtime_put_sync_suspend(&pdev->dev);
+	pm_runtime_force_suspend(&pdev->dev);
+
+	return 0;
+}
+
+static int __maybe_unused tegra_usb_runtime_resume(struct device *dev)
+{
+	struct tegra_usb *usb = dev_get_drvdata(dev);
+	int err;
+
+	err = clk_prepare_enable(usb->clk);
+	if (err < 0) {
+		dev_err(dev, "failed to enable clock: %d\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
+static int __maybe_unused tegra_usb_runtime_suspend(struct device *dev)
+{
+	struct tegra_usb *usb = dev_get_drvdata(dev);
+
 	clk_disable_unprepare(usb->clk);
 
 	return 0;
 }
 
+static const struct dev_pm_ops tegra_usb_pm = {
+	SET_RUNTIME_PM_OPS(tegra_usb_runtime_suspend, tegra_usb_runtime_resume,
+			   NULL)
+};
+
 static struct platform_driver tegra_usb_driver = {
 	.driver = {
 		.name = "tegra-usb",
 		.of_match_table = tegra_usb_of_match,
+		.pm = &tegra_usb_pm,
 	},
 	.probe = tegra_usb_probe,
 	.remove = tegra_usb_remove,
-- 
2.33.1

