Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1889618EBD
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 04:17:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0654F10E6D4;
	Fri,  4 Nov 2022 03:17:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83AAD10E6D7
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 03:17:03 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id l2so3708916pld.13
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Nov 2022 20:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i3N39HNFiqYnjEtTIzF8MdLuTkDRvn84ONCWXTbY+Sc=;
 b=ZfixGSIH/mZRzcotLRCWziaYgI6pQe4HhPfxoaOcrlUVe6q4KuY6B/cmG83Vn0rQJW
 qPrvtysuEYTHQcjaD8j3ZuQZerWYCxN6Od3wHqNyAJbXyhjJ+3Xv56v24tqpKvIUWZ/y
 RmGovEz+53FQm/hnL27uqjRQrf7s0t7e2NcSB08424ngTrv7jNpsMRIkTZfeRSfFhreq
 2VpzeQbc5TV+h0gdqioeRjUcFKgZo+6IPYZo4CqA+F6rmpTk+t1Zyet2jtE6Z91/Pfcg
 7SGPjYk6Rs4gymMy6xOj20l+FcQKAWf4dHiPx4FxXgcOEqMC3qPUYTrky/HgHoaeP70p
 NZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i3N39HNFiqYnjEtTIzF8MdLuTkDRvn84ONCWXTbY+Sc=;
 b=OsQAprRmwbfNv2SMkCwK09im2TzvjHmwhGCP5cv1SqM7+QsgHC3612P5wuvi53yA/b
 QUiOv/2kBH/A2GI127a67bup2boJ6qI1hf+iUZiXuIgjOS01LYA2t2mJQctu67s7j6FJ
 MPvgk93MxMlpZK0aMs40rUCWcOPRBnAioQD4LUPMUV+TcQwS+mdLhClzWL59EegXPnKA
 keclemCAESqJKbCQ+0BNt7/YFyZRsFVQ0RbZQjtA2bjLjhvLuaquht6Ol8pgckZ7w8CZ
 +CF8jrf7hqid9Tig+FdOlP6vwbSCIF45wgJn1HEpQ3oC1XAjiDlb25OpcvpfTwMg+mtf
 NgaQ==
X-Gm-Message-State: ACrzQf35cz/vtDMtph2+WPKSjK+Yo/T0ykRJZIPZ9iOJ/EC/08+UUoZw
 qNAuRSwdH48P8XjT/MloBsU=
X-Google-Smtp-Source: AMsMyM7nrXImeyb+ka66vCt4Wt9iNDazA7HU2R3RzyPG8uayeoYSEucx8fEc3LM91bjy4udG/2+J7g==
X-Received: by 2002:a17:902:7849:b0:186:68b9:e1ae with SMTP id
 e9-20020a170902784900b0018668b9e1aemr33322333pln.139.1667531823059; 
 Thu, 03 Nov 2022 20:17:03 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com
 ([2620:15c:9d:2:a6ae:11ff:fe11:fcc3])
 by smtp.gmail.com with ESMTPSA id
 s3-20020a63ff43000000b004702eca61fcsm1078655pgk.36.2022.11.03.20.17.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 20:17:02 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Helge Deller <deller@gmx.de>, Tony Lindgren <tony@atomide.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Sebastian Reichel <sre@kernel.org>
Subject: [PATCH RESEND 09/13] omapfb: connector-analog-tv: remove support for
 platform data
Date: Thu,  3 Nov 2022 20:16:38 -0700
Message-Id: <20221103-omapfb-gpiod-v1-9-cba1fae5a77c@gmail.com>
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

There are no users of connector_atv_platform_data in the mainline
kernel so support for it can be removed from the panel driver.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 .../omap2/omapfb/displays/connector-analog-tv.c    | 60 +++-------------------
 include/video/omap-panel-data.h                    | 34 ------------
 2 files changed, 8 insertions(+), 86 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/displays/connector-analog-tv.c b/drivers/video/fbdev/omap2/omapfb/displays/connector-analog-tv.c
index a9fd732f8103..0daaf9f89bab 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/connector-analog-tv.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/connector-analog-tv.c
@@ -12,7 +12,6 @@
 #include <linux/of.h>
 
 #include <video/omapfb_dss.h>
-#include <video/omap-panel-data.h>
 
 struct panel_drv_data {
 	struct omap_dss_device dssdev;
@@ -178,53 +177,15 @@ static struct omap_dss_driver tvc_driver = {
 	.set_wss		= tvc_set_wss,
 };
 
-static int tvc_probe_pdata(struct platform_device *pdev)
-{
-	struct panel_drv_data *ddata = platform_get_drvdata(pdev);
-	struct connector_atv_platform_data *pdata;
-	struct omap_dss_device *in, *dssdev;
-
-	pdata = dev_get_platdata(&pdev->dev);
-
-	in = omap_dss_find_output(pdata->source);
-	if (in == NULL) {
-		dev_err(&pdev->dev, "Failed to find video source\n");
-		return -EPROBE_DEFER;
-	}
-
-	ddata->in = in;
-
-	ddata->invert_polarity = pdata->invert_polarity;
-
-	dssdev = &ddata->dssdev;
-	dssdev->name = pdata->name;
-
-	return 0;
-}
-
-static int tvc_probe_of(struct platform_device *pdev)
-{
-	struct panel_drv_data *ddata = platform_get_drvdata(pdev);
-	struct device_node *node = pdev->dev.of_node;
-	struct omap_dss_device *in;
-
-	in = omapdss_of_find_source_for_first_ep(node);
-	if (IS_ERR(in)) {
-		dev_err(&pdev->dev, "failed to find video source\n");
-		return PTR_ERR(in);
-	}
-
-	ddata->in = in;
-
-	return 0;
-}
-
 static int tvc_probe(struct platform_device *pdev)
 {
 	struct panel_drv_data *ddata;
 	struct omap_dss_device *dssdev;
 	int r;
 
+	if (!pdev->dev.of_node)
+		return -ENODEV;
+
 	ddata = devm_kzalloc(&pdev->dev, sizeof(*ddata), GFP_KERNEL);
 	if (!ddata)
 		return -ENOMEM;
@@ -232,16 +193,11 @@ static int tvc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, ddata);
 	ddata->dev = &pdev->dev;
 
-	if (dev_get_platdata(&pdev->dev)) {
-		r = tvc_probe_pdata(pdev);
-		if (r)
-			return r;
-	} else if (pdev->dev.of_node) {
-		r = tvc_probe_of(pdev);
-		if (r)
-			return r;
-	} else {
-		return -ENODEV;
+	ddata->in = omapdss_of_find_source_for_first_ep(pdev->dev.of_node);
+	r = PTR_ERR_OR_ZERO(ddata->in);
+	if (r) {
+		dev_err(&pdev->dev, "failed to find video source\n");
+		return r;
 	}
 
 	ddata->timings = tvc_pal_timings;
diff --git a/include/video/omap-panel-data.h b/include/video/omap-panel-data.h
deleted file mode 100644
index 18172d7b97d0..000000000000
--- a/include/video/omap-panel-data.h
+++ /dev/null
@@ -1,34 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Header containing platform_data structs for omap panels
- *
- * Copyright (C) 2013 Texas Instruments
- * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
- *	   Archit Taneja <archit@ti.com>
- *
- * Copyright (C) 2011 Texas Instruments
- * Author: Mayuresh Janorkar <mayur@ti.com>
- *
- * Copyright (C) 2010 Canonical Ltd.
- * Author: Bryan Wu <bryan.wu@canonical.com>
- */
-
-#ifndef __OMAP_PANEL_DATA_H
-#define __OMAP_PANEL_DATA_H
-
-#include <video/display_timing.h>
-
-/**
- * connector_atv platform data
- * @name: name for this display entity
- * @source: name of the display entity used as a video source
- * @invert_polarity: invert signal polarity
- */
-struct connector_atv_platform_data {
-	const char *name;
-	const char *source;
-
-	bool invert_polarity;
-};
-
-#endif /* __OMAP_PANEL_DATA_H */

-- 
b4 0.11.0-dev-28747
