Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1D82A78FD
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:21:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 549136E9CF;
	Thu,  5 Nov 2020 08:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 743D76E02D
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 23:45:18 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id l2so200492lfk.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 15:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y282nJfAvr8vVLZChpZFCfyyX/0tuj7y7Sv22IVncUE=;
 b=KXuUE5AtEQQwD5Ono7VTFez03/G1JD8vBervS34kptx+rvhr1VPOJKtT7+tZonOL0D
 LYiql4lEs4GqTEMjuWMjwLYpFTuzD7peQA5Vfi9aqIs9BSwW3kmudaZudkIjvD3GG/19
 35ZO/3Ss9TqW3Pu9IqRkKZAi9/OgCAGJSxlUFuLZ1vwjqCl6LSiIk6U8zGc3Rpst7ZBU
 tSb27R9TT1BfZzPv4RaCODS/OrnSceZlO7o7PafTCOUpsPYAQYjH7YwoeCSVAvnna70u
 UMigQgwIBHl5gUp2Vf4C9Cl2fch5QY2p74zsV8dYlmESyGtGEyNrKFOuJIfx0oI4pYyz
 6omQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y282nJfAvr8vVLZChpZFCfyyX/0tuj7y7Sv22IVncUE=;
 b=FdINvzYbtQ7uvrbQDtS7RKQ3Qz9DnqAoS2+xDTkMHsp+o7tsjOnxwoQUfSl9VUrMlY
 52MyTraqyv9ArV4BZGU2amV93tyyft8JWw4iReF5erW1tRdMtiJ8k3a1Vhk01mUxlToN
 xJBI7A+hUkf+QL+KJF6Tb5xtCIK6yPw0G74apf/+KTlk6L3yZIYNEMzx76Sf+X/dvMNw
 6B7xU4EaEhCHATIhhrxI/15ccXgGB0tZZj60kGP8GehaW2jTxiSqju4Zd7q0EM4joFHy
 qjsVjYXGr/L+24Ut65y9SWJyC2fjRLOdnQa9BSxffE0WCWPTPArGOUZEO75M/OD03UWi
 PZkA==
X-Gm-Message-State: AOAM533m3m8geS7gTxUCJWneagrtXdPm4g7PGzNcP4Thtn8/BKWNokq6
 BAYmrewQdjdC8kTU5BiRjBw=
X-Google-Smtp-Source: ABdhPJzT6zVFairbLiWCVf6U5lDlOHXMBLgiZgoTQaSae/l2568qpJolj1IwCGuZV8j/fEZhdbtdpA==
X-Received: by 2002:a19:c6cc:: with SMTP id w195mr60492lff.24.1604533516983;
 Wed, 04 Nov 2020 15:45:16 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.gmail.com with ESMTPSA id m6sm640725ljc.112.2020.11.04.15.45.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 15:45:16 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Alan Stern <stern@rowland.harvard.edu>, Peter Chen <Peter.Chen@nxp.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Peter Geis <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>
Subject: [PATCH v1 15/30] drm/tegra: hdmi: Support OPP and SoC core voltage
 scaling
Date: Thu,  5 Nov 2020 02:44:12 +0300
Message-Id: <20201104234427.26477-16-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201104234427.26477-1-digetx@gmail.com>
References: <20201104234427.26477-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 05 Nov 2020 08:20:02 +0000
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
Cc: devel@driverdev.osuosl.org, linux-pwm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add OPP and SoC core voltage scaling support to the HDMI driver.
This is required for enabling system-wide DVFS on older Tegra SoCs.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/hdmi.c | 63 +++++++++++++++++++++++++++++++++++-
 1 file changed, 62 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index d09a24931c87..92e96990854b 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -11,6 +11,7 @@
 #include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
+#include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
@@ -1195,7 +1196,7 @@ static void tegra_hdmi_encoder_enable(struct drm_encoder *encoder)
 	h_back_porch = mode->htotal - mode->hsync_end;
 	h_front_porch = mode->hsync_start - mode->hdisplay;
 
-	err = clk_set_rate(hdmi->clk, hdmi->pixel_clock);
+	err = dev_pm_opp_set_rate(hdmi->dev, hdmi->pixel_clock);
 	if (err < 0) {
 		dev_err(hdmi->dev, "failed to set HDMI clock frequency: %d\n",
 			err);
@@ -1499,6 +1500,7 @@ static int tegra_hdmi_runtime_suspend(struct host1x_client *client)
 	usleep_range(1000, 2000);
 
 	clk_disable_unprepare(hdmi->clk);
+	dev_pm_opp_set_rate(hdmi->dev, 0);
 	pm_runtime_put_sync(dev);
 
 	return 0;
@@ -1633,6 +1635,60 @@ static irqreturn_t tegra_hdmi_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static void tegra_hdmi_deinit_opp_table(void *data)
+{
+	struct device *dev = data;
+	struct opp_table *opp_table;
+
+	opp_table = dev_pm_opp_get_opp_table(dev);
+	dev_pm_opp_of_remove_table(dev);
+	dev_pm_opp_put_regulators(opp_table);
+	dev_pm_opp_put_opp_table(opp_table);
+}
+
+static int devm_tegra_hdmi_init_opp_table(struct device *dev)
+{
+	struct opp_table *opp_table;
+	const char *rname = "core";
+	int err;
+
+	/* voltage scaling is optional */
+	if (device_property_present(dev, "core-supply"))
+		opp_table = dev_pm_opp_set_regulators(dev, &rname, 1);
+	else
+		opp_table = dev_pm_opp_get_opp_table(dev);
+
+	if (IS_ERR(opp_table))
+		return dev_err_probe(dev, PTR_ERR(opp_table),
+				    "failed to prepare OPP table\n");
+
+	/*
+	 * OPP table presence is optional and we want the set_rate() of OPP
+	 * API to work similarly to clk_set_rate() if table is missing in a
+	 * device-tree.  The add_table() errors out if OPP is missing in DT.
+	 */
+	if (device_property_present(dev, "operating-points-v2")) {
+		err = dev_pm_opp_of_add_table(dev);
+		if (err) {
+			dev_err(dev, "failed to add OPP table: %d\n", err);
+			goto put_table;
+		}
+	}
+
+	err = devm_add_action(dev, tegra_hdmi_deinit_opp_table, dev);
+	if (err)
+		goto remove_table;
+
+	return 0;
+
+remove_table:
+	dev_pm_opp_of_remove_table(dev);
+put_table:
+	dev_pm_opp_put_regulators(opp_table);
+
+	return err;
+}
+
 static int tegra_hdmi_probe(struct platform_device *pdev)
 {
 	const char *level = KERN_ERR;
@@ -1667,6 +1723,11 @@ static int tegra_hdmi_probe(struct platform_device *pdev)
 	if (IS_ERR(hdmi->clk_parent))
 		return PTR_ERR(hdmi->clk_parent);
 
+	err = devm_tegra_hdmi_init_opp_table(&pdev->dev);
+	if (err)
+		return dev_err_probe(&pdev->dev, err,
+				     "failed to initialize OPP\n");
+
 	err = clk_set_parent(hdmi->clk, hdmi->clk_parent);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to setup clocks: %d\n", err);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
