Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DFE618EAF
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 04:17:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DC5310E05C;
	Fri,  4 Nov 2022 03:16:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B31B10E048
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 03:16:51 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id y203so3403190pfb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Nov 2022 20:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3MRMByNf7k1ZHiaI3QTdRSrBekgD40L2iROgUZ5uSwA=;
 b=kn5gvq2nrh87nFzuFuY6dVbazF8Hi8NdRiuOx4gRYg9AQWQQHCKmg+d0zVIAOTZV2A
 K7AKz09rqNSqWIMCmU9oocVnb68WUSypRUQhJfemiQNjXhT00i8PQSXHoOnIJlo2uzYf
 Ifn2y6n0eh+yAEanl9UptTp1Y9fSPPL0YAhl4LxY+93uCHhp3s6DJievO+da7EDk54KA
 MUpqT5vgqe05BVh7cg5iKndCll1rguGwXw18OU6EW5xx16j5nkvSh+heZFd4oUpXz59Q
 t96KnAs1iGJ8wn4UEyJEJQb0x1PQ5FSGCNP5LYLtvbn6g+tsaFkxaJD+qKPATtrtYCSB
 NJNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3MRMByNf7k1ZHiaI3QTdRSrBekgD40L2iROgUZ5uSwA=;
 b=c+edfrwPFcGh9oAxlXqNNRCIXAoLPqbCip2nzR+4Lb/8yZldd9GQmaTBxBlM5xtlMy
 KQX5t+b54N8UaQWCXCvFxiKIqy7lomBizVKwQcubxUpxrzxS+fbkEvLvpA0RtWmyCp4H
 sLmwdQQtDe0nPXZKcIUyhWysNo5bPliFcvN7rBhz8eKCh9trIANI5wzTQA6sKIH8jnBa
 O5EtZ/FlqyghAkswhRJC0z6WMhttKFjVcjFTYBSWW/tGWTV44wlM0ItI1AI/WB5JMyBP
 yOea+ftPeXWmj84pMHpKPzrappvDBSY6c5YC9i9+nCMQfgI1PG5FuTIGyKzfoc0I4PS4
 wirA==
X-Gm-Message-State: ACrzQf032N5tNPLyj/zqPSDkweIEBMozLFIhEC2iB3TXf5Rbub4ka7gA
 lx+BciBMXbfuYKpGtLSf7to=
X-Google-Smtp-Source: AMsMyM7IsmRWsIkspiRm/ltGOwN2ChryJ7mWpUG6msavi3or+BuI5Jqj9A8llaVwXjJZ7/vvZz65eA==
X-Received: by 2002:a63:5b5c:0:b0:440:8531:d3f6 with SMTP id
 l28-20020a635b5c000000b004408531d3f6mr29507088pgm.114.1667531810656; 
 Thu, 03 Nov 2022 20:16:50 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com
 ([2620:15c:9d:2:a6ae:11ff:fe11:fcc3])
 by smtp.gmail.com with ESMTPSA id
 s3-20020a63ff43000000b004702eca61fcsm1078655pgk.36.2022.11.03.20.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 20:16:50 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Helge Deller <deller@gmx.de>, Tony Lindgren <tony@atomide.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Sebastian Reichel <sre@kernel.org>
Subject: [PATCH RESEND 02/13] omapfb: panel-sony-acx565akm: remove support for
 platform data
Date: Thu,  3 Nov 2022 20:16:31 -0700
Message-Id: <20221103-omapfb-gpiod-v1-2-cba1fae5a77c@gmail.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
In-Reply-To: <20221103-omapfb-gpiod-v1-0-cba1fae5a77c@gmail.com>
References: <20221103-omapfb-gpiod-v1-0-cba1fae5a77c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.11.0-dev-28747
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
Cc: linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are no users of panel_acx565akm_platform_data in the mainline
kernel so support for it can be removed from the panel driver.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 .../omap2/omapfb/displays/panel-sony-acx565akm.c   | 45 +++-------------------
 include/video/omap-panel-data.h                    | 16 --------
 2 files changed, 6 insertions(+), 55 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
index c0965bee12c5..0c81d3ff4197 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
@@ -23,7 +23,6 @@
 #include <linux/of_gpio.h>
 
 #include <video/omapfb_dss.h>
-#include <video/omap-panel-data.h>
 
 #define MIPID_CMD_READ_DISP_ID		0x04
 #define MIPID_CMD_READ_RED		0x06
@@ -688,32 +687,6 @@ static struct omap_dss_driver acx565akm_ops = {
 	.get_resolution	= omapdss_default_get_resolution,
 };
 
-static int acx565akm_probe_pdata(struct spi_device *spi)
-{
-	const struct panel_acx565akm_platform_data *pdata;
-	struct panel_drv_data *ddata = dev_get_drvdata(&spi->dev);
-	struct omap_dss_device *dssdev, *in;
-
-	pdata = dev_get_platdata(&spi->dev);
-
-	ddata->reset_gpio = pdata->reset_gpio;
-
-	in = omap_dss_find_output(pdata->source);
-	if (in == NULL) {
-		dev_err(&spi->dev, "failed to find video source '%s'\n",
-				pdata->source);
-		return -EPROBE_DEFER;
-	}
-	ddata->in = in;
-
-	ddata->datapairs = pdata->datapairs;
-
-	dssdev = &ddata->dssdev;
-	dssdev->name = pdata->name;
-
-	return 0;
-}
-
 static int acx565akm_probe_of(struct spi_device *spi)
 {
 	struct panel_drv_data *ddata = dev_get_drvdata(&spi->dev);
@@ -741,6 +714,9 @@ static int acx565akm_probe(struct spi_device *spi)
 
 	dev_dbg(&spi->dev, "%s\n", __func__);
 
+	if (!spi->dev.of_node)
+		return -ENODEV;
+
 	spi->mode = SPI_MODE_3;
 
 	ddata = devm_kzalloc(&spi->dev, sizeof(*ddata), GFP_KERNEL);
@@ -753,18 +729,9 @@ static int acx565akm_probe(struct spi_device *spi)
 
 	mutex_init(&ddata->mutex);
 
-	if (dev_get_platdata(&spi->dev)) {
-		r = acx565akm_probe_pdata(spi);
-		if (r)
-			return r;
-	} else if (spi->dev.of_node) {
-		r = acx565akm_probe_of(spi);
-		if (r)
-			return r;
-	} else {
-		dev_err(&spi->dev, "platform data missing!\n");
-		return -ENODEV;
-	}
+	r = acx565akm_probe_of(spi);
+	if (r)
+		return r;
 
 	if (gpio_is_valid(ddata->reset_gpio)) {
 		r = devm_gpio_request_one(&spi->dev, ddata->reset_gpio,
diff --git a/include/video/omap-panel-data.h b/include/video/omap-panel-data.h
index 42b77249ee14..b7733150b55c 100644
--- a/include/video/omap-panel-data.h
+++ b/include/video/omap-panel-data.h
@@ -52,20 +52,4 @@ struct panel_dpi_platform_data {
 	int enable_gpio;
 };
 
-/**
- * panel_acx565akm platform data
- * @name: name for this display entity
- * @source: name of the display entity used as a video source
- * @reset_gpio: gpio to reset the panel (or -1)
- * @datapairs: number of SDI datapairs
- */
-struct panel_acx565akm_platform_data {
-	const char *name;
-	const char *source;
-
-	int reset_gpio;
-
-	int datapairs;
-};
-
 #endif /* __OMAP_PANEL_DATA_H */

-- 
b4 0.11.0-dev-28747
