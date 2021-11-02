Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E374D442594
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 03:20:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 719466F8AA;
	Tue,  2 Nov 2021 02:20:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5FF26F8A5
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 02:20:10 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id o12so6921863qtv.4
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Nov 2021 19:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=usp.br; s=usp-google;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :content-transfer-encoding;
 bh=TeHGklbsWJ2iSzr/5MHFyU8553eNgPnreRe65lH6NhU=;
 b=BZwfWggd+/dvjEMDdNmiEIqpxvWCv6b4m28LKY5geUgyiIj794SoJpPfXVxERVaEI9
 tLyML6H4F7sl5fxcmB6LPxYyUJJsbKaQOIUz8Zvn6hRiYi51XMqVI83OsGive+XfWcn3
 QajSdbJixF+6l492FHi5cEgzbKkIc9vef/TzbcUIkE0UQ9vqThJI8iFO/cpHNYmSnpKp
 ZiLI8y6C/rhnu2m9dolNE/THLnOqAcomq3TkQL8i+M2q2r+PlvMFS8VpxIirV6daZOf0
 Nf5K8geoGMhdgWWgwwcXrU+VTHG3Yo7TDJv79ZLb44O1ZkewXOhJ95WSBN9wKm9t0uke
 ittA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding;
 bh=TeHGklbsWJ2iSzr/5MHFyU8553eNgPnreRe65lH6NhU=;
 b=WS2n7K3yIxdUfh5IQiAMyJ8t9EoR91TRw+6BbcWVQFPn8XXv+T7fgbIgn1UwihbkE+
 OtEvzWSiXdCUA9gCOCgLV9WG5weOY1eWq+bko7BwNgJhj1OKPWh8ETHe3cj/o7XmLKD/
 Mg6Prt34D+oto5n+6WVFvcX2rfct+nbW9t4rObbjbIU7BXjFY8ziqgs0ge5DNtfiN8sF
 +UjA7EdJk6FrROxxUT06GKvIL2VnZmlH8+Qs+pS4l7ezAXipRUgsTCoHU7t1lbRVcW7r
 vdOETviqGB0hjjymndjCkMU9wBs30ynF/DitxcqNieNh4OLZoo1r3+3bBFIt9bbttqU7
 wgqg==
X-Gm-Message-State: AOAM532z4D2uvdsM8YSK2STyfzrQ0rBq/tmf8iLAO8cATEbRkGG4eQVR
 GPb1JZBMwCgEZYhBpS/1WGxoug==
X-Google-Smtp-Source: ABdhPJx/+fhidZPfS99qL6EEqlinvO5UtYVgf0uJS1+T+dApyVeMcfKWjGbA05SOC+8r94GMNJ5T6Q==
X-Received: by 2002:a05:622a:2c3:: with SMTP id a3mr9430222qtx.3.1635819609361; 
 Mon, 01 Nov 2021 19:20:09 -0700 (PDT)
Received: from fedora ([187.64.134.142])
 by smtp.gmail.com with ESMTPSA id v16sm1371671qtw.90.2021.11.01.19.20.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 19:20:09 -0700 (PDT)
Date: Mon, 1 Nov 2021 23:20:03 -0300
From: =?iso-8859-1?Q?Ma=EDra?= Canal <maira.canal@usp.br>
To: inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, airlied@linux.ie, daniel@ffwll.ch,
 krzysztof.kozlowski@canonical.com
Subject: [PATCH] drm/exynos: Replace legacy gpio interface for gpiod interface
Message-ID: <YYCgU9BfmnCgYIvO@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Considering the current transition of the GPIO subsystem, remove all
dependencies of the legacy GPIO interface (linux/gpio.h and linux
/of_gpio.h) and replace it with the descriptor-based GPIO approach.

Signed-off-by: Maíra Canal <maira.canal@usp.br>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 42 +++++++++----------------
 1 file changed, 14 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 8d137857818c..b0b1acb7e712 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -13,7 +13,6 @@
 #include <linux/gpio/consumer.h>
 #include <linux/irq.h>
 #include <linux/of_device.h>
-#include <linux/of_gpio.h>
 #include <linux/of_graph.h>
 #include <linux/phy/phy.h>
 #include <linux/regulator/consumer.h>
@@ -265,7 +264,7 @@ struct exynos_dsi {
 	struct clk **clks;
 	struct regulator_bulk_data supplies[2];
 	int irq;
-	int te_gpio;
+	struct gpio_desc *te_gpio;
 
 	u32 pll_clk_rate;
 	u32 burst_clk_rate;
@@ -1298,14 +1297,14 @@ static void exynos_dsi_enable_irq(struct exynos_dsi *dsi)
 {
 	enable_irq(dsi->irq);
 
-	if (gpio_is_valid(dsi->te_gpio))
-		enable_irq(gpio_to_irq(dsi->te_gpio));
+	if (dsi->te_gpio)
+		enable_irq(gpiod_to_irq(dsi->te_gpio));
 }
 
 static void exynos_dsi_disable_irq(struct exynos_dsi *dsi)
 {
-	if (gpio_is_valid(dsi->te_gpio))
-		disable_irq(gpio_to_irq(dsi->te_gpio));
+	if (dsi->te_gpio)
+		disable_irq(gpiod_to_irq(dsi->te_gpio));
 
 	disable_irq(dsi->irq);
 }
@@ -1335,29 +1334,20 @@ static int exynos_dsi_register_te_irq(struct exynos_dsi *dsi,
 	int ret;
 	int te_gpio_irq;
 
-	dsi->te_gpio = of_get_named_gpio(panel->of_node, "te-gpios", 0);
-	if (dsi->te_gpio == -ENOENT)
-		return 0;
-
-	if (!gpio_is_valid(dsi->te_gpio)) {
-		ret = dsi->te_gpio;
-		dev_err(dsi->dev, "cannot get te-gpios, %d\n", ret);
+	dsi->te_gpio = devm_gpiod_get_optional(dsi->dev, "te", GPIOD_IN);
+	if (IS_ERR(dsi->te_gpio)) {
+		dev_err(dsi->dev, "gpio request failed with %ld\n",
+				PTR_ERR(dsi->te_gpio));
 		goto out;
 	}
 
-	ret = gpio_request(dsi->te_gpio, "te_gpio");
-	if (ret) {
-		dev_err(dsi->dev, "gpio request failed with %d\n", ret);
-		goto out;
-	}
-
-	te_gpio_irq = gpio_to_irq(dsi->te_gpio);
+	te_gpio_irq = gpiod_to_irq(dsi->te_gpio);
 
 	ret = request_threaded_irq(te_gpio_irq, exynos_dsi_te_irq_handler, NULL,
 				   IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN, "TE", dsi);
 	if (ret) {
 		dev_err(dsi->dev, "request interrupt failed with %d\n", ret);
-		gpio_free(dsi->te_gpio);
+		gpiod_put(dsi->te_gpio);
 		goto out;
 	}
 
@@ -1367,10 +1357,9 @@ static int exynos_dsi_register_te_irq(struct exynos_dsi *dsi,
 
 static void exynos_dsi_unregister_te_irq(struct exynos_dsi *dsi)
 {
-	if (gpio_is_valid(dsi->te_gpio)) {
-		free_irq(gpio_to_irq(dsi->te_gpio), dsi);
-		gpio_free(dsi->te_gpio);
-		dsi->te_gpio = -ENOENT;
+	if (dsi->te_gpio) {
+		free_irq(gpiod_to_irq(dsi->te_gpio), dsi);
+		gpiod_put(dsi->te_gpio);
 	}
 }
 
@@ -1745,9 +1734,6 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	if (!dsi)
 		return -ENOMEM;
 
-	/* To be checked as invalid one */
-	dsi->te_gpio = -ENOENT;
-
 	init_completion(&dsi->completed);
 	spin_lock_init(&dsi->transfer_lock);
 	INIT_LIST_HEAD(&dsi->transfer_list);
-- 
2.31.1

