Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA5A418C65
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 00:44:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 063B66E7E6;
	Sun, 26 Sep 2021 22:44:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 964EE6E5CF
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Sep 2021 22:42:52 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id y26so29088914lfa.11
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Sep 2021 15:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xyfv+bs1PqRnjMFL4Pq5e7XkvADOaeyFEUXpxII4rIo=;
 b=izvFqpS38K4FCvT7p/zbvtPiyuSbxhHUIKmFwiK3flubJCAqcxp4mNup9FVUVBz10D
 BaZc9dN4ud4sqdRa9IoE73Rp8graQE+SahQXeY7IOPhoiS+N7m/KkaLm5SMLR/4w0aPj
 fg0tSmIcoWmarUWnmFwz5LastPqVxXfW5RPHers47MYDvxqf9Dfl+4Dzr9cGHY8HAHvi
 m1pK+t0poPBYPw4Zax6XbCAaoqMfiQU1/4WQ2Ay9/Kl6f34wy3fZuLPXoagHgox/5bTL
 A3v8DwV12vmHFdpkQGfAGPyI+CZr5nITAm+9lMD11iMI6Zznv2S5aOtjHIE18/Dsuru5
 Ijuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xyfv+bs1PqRnjMFL4Pq5e7XkvADOaeyFEUXpxII4rIo=;
 b=GntJgPn0m1NHCTtm0OxRdO0cr3/xKStWOAfXg44KnpP3dqH0E7h4CqLjfl+F75eEc5
 wr8ulnODBlXZvHm0IXi+k/KiuVSjhUJCrndOM399vI2kHtyogKflePAXX2C5G24OB/z2
 4pTjzzu6sSfgaBwHQNcJJQ9Lv0iKhjO0eGKZdSsBmzKsTpu3xnZxVjOh3rzfDOGhHRp8
 kmgxdnoWeNEvxd1OGFtR/IUUMKxx3HBExOtQUdogQoV1JBrGFVhVBYAo6V/3NnTQRPkN
 cXgn7UiNs0zMQgBCrxpPDgH0jxlSGSyppnn1NTV80Pyf8ZKAXfVp3SQbcc9iYRzrt8Qb
 wR4w==
X-Gm-Message-State: AOAM533wrx6jojTqOIXXJzm1SYgwDEH+vDiRBaD4bXs0HGvhHASIMNTc
 kut0U+JI2zrQCGtp/hy24So=
X-Google-Smtp-Source: ABdhPJwFcgY1e/EpRbZGqJyBjJ81B0If7emAzTEomlL5PaZAh/GdNeqs2BhIjIoVoXBk8gQvMR+6HA==
X-Received: by 2002:a2e:5005:: with SMTP id e5mr24744959ljb.471.1632696170675; 
 Sun, 26 Sep 2021 15:42:50 -0700 (PDT)
Received: from localhost.localdomain (46-138-80-108.dynamic.spd-mgts.ru.
 [46.138.80.108])
 by smtp.gmail.com with ESMTPSA id m10sm1408899lfr.272.2021.09.26.15.42.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:42:50 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org,
 linux-mmc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 David Heidelberg <david@ixit.cz>
Subject: [PATCH v13 21/35] spi: tegra20-slink: Add OPP support
Date: Mon, 27 Sep 2021 01:40:44 +0300
Message-Id: <20210926224058.1252-22-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210926224058.1252-1-digetx@gmail.com>
References: <20210926224058.1252-1-digetx@gmail.com>
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

The SPI on Tegra belongs to the core power domain and we're going to
enable GENPD support for the core domain. Now SPI driver must use OPP
API for driving the controller's clock rate because OPP API takes care
of reconfiguring the domain's performance state in accordance to the
rate. Add OPP support to the driver.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/spi/spi-tegra20-slink.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-tegra20-slink.c b/drivers/spi/spi-tegra20-slink.c
index 3226c4e1c7c0..eea1853010e8 100644
--- a/drivers/spi/spi-tegra20-slink.c
+++ b/drivers/spi/spi-tegra20-slink.c
@@ -18,12 +18,15 @@
 #include <linux/kthread.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/reset.h>
 #include <linux/spi/spi.h>
 
+#include <soc/tegra/common.h>
+
 #define SLINK_COMMAND			0x000
 #define SLINK_BIT_LENGTH(x)		(((x) & 0x1f) << 0)
 #define SLINK_WORD_SIZE(x)		(((x) & 0x1f) << 5)
@@ -680,7 +683,7 @@ static int tegra_slink_start_transfer_one(struct spi_device *spi,
 	bits_per_word = t->bits_per_word;
 	speed = t->speed_hz;
 	if (speed != tspi->cur_speed) {
-		clk_set_rate(tspi->clk, speed * 4);
+		dev_pm_opp_set_rate(tspi->dev, speed * 4);
 		tspi->cur_speed = speed;
 	}
 
@@ -1082,6 +1085,11 @@ static int tegra_slink_probe(struct platform_device *pdev)
 	init_completion(&tspi->xfer_completion);
 
 	pm_runtime_enable(&pdev->dev);
+
+	ret = devm_tegra_core_dev_init_opp_table_common(&pdev->dev);
+	if (ret)
+		goto exit_pm_disable;
+
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "pm runtime get failed, e = %d\n", ret);
-- 
2.32.0

