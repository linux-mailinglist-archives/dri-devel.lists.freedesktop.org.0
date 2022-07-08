Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E2756B6CF
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:14:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D56B010E558;
	Fri,  8 Jul 2022 10:08:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1096 seconds by postgrey-1.36 at gabe;
 Fri, 08 Jul 2022 10:08:01 UTC
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2909E10E7E5
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 10:08:01 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1o9kcA-000236-7g; Fri, 08 Jul 2022 11:49:34 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1o9kc5-00582G-NP; Fri, 08 Jul 2022 11:49:33 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1o9kc8-003kzn-9q; Fri, 08 Jul 2022 11:49:32 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 1/3] drm/panel: simple: Make panel_simple_remove() return void
Date: Fri,  8 Jul 2022 11:49:20 +0200
Message-Id: <20220708094922.1408248-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708094922.1408248-1-u.kleine-koenig@pengutronix.de>
References: <20220708094922.1408248-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1855; h=from:subject;
 bh=HMUOkupOcy8U+L5hoj8w7LAML0EZ8syV67Dvj9xWwRY=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBix/2UFflY1Gs/56zEV1IeTgRGBpfwHzkECTxZj9MM
 UnMZpECJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYsf9lAAKCRDB/BR4rcrsCd+bB/
 4iZsT5rHMUBzElPuTO5iJCoOmWFH0jupa0LRwZLQFC6LKxk/2h/pOqnsOe3wGPw52/OIGjbxpLGfU7
 KmP4wPGXaR+5lkvSk0M4Qhb2MjNZMRpwH4V/QmB63bmI33+iQ+kN9VvKh5mXNk983t+NWfD4vWcVbE
 QP5fBQPifhUfd1kB4WsRocWDDVesLTRenHBShUwqXJeYfTxM4FrgsFPoMXvxbbbGUhWyj6Zvnzi8qp
 28IokOabttdlF/EXnVr3nCWwgGAUgbXYcS6AC4y6ldeV+AfA04sltDi5toYHCLT4MSKs/KwO3x0zuP
 9oUzQoCBzCFkIG8YVrk+dq7l72tFn1
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: dri-devel@lists.freedesktop.org, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

panel_simple_remove() returns zero unconditionally. Make it return no value
instead making more obvious what happens in the callers.

This is a preparation for making platform and mipi-dsi remove callbacks
return void.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/panel/panel-simple.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 4a2e580a2f7b..0a07e2849b7b 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -680,7 +680,7 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 	return err;
 }
 
-static int panel_simple_remove(struct device *dev)
+static void panel_simple_remove(struct device *dev)
 {
 	struct panel_simple *panel = dev_get_drvdata(dev);
 
@@ -692,8 +692,6 @@ static int panel_simple_remove(struct device *dev)
 	pm_runtime_disable(dev);
 	if (panel->ddc)
 		put_device(&panel->ddc->dev);
-
-	return 0;
 }
 
 static void panel_simple_shutdown(struct device *dev)
@@ -4140,7 +4138,9 @@ static int panel_simple_platform_probe(struct platform_device *pdev)
 
 static int panel_simple_platform_remove(struct platform_device *pdev)
 {
-	return panel_simple_remove(&pdev->dev);
+	panel_simple_remove(&pdev->dev);
+
+	return 0;
 }
 
 static void panel_simple_platform_shutdown(struct platform_device *pdev)
@@ -4441,7 +4441,9 @@ static int panel_simple_dsi_remove(struct mipi_dsi_device *dsi)
 	if (err < 0)
 		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", err);
 
-	return panel_simple_remove(&dsi->dev);
+	panel_simple_remove(&dsi->dev);
+
+	return 0;
 }
 
 static void panel_simple_dsi_shutdown(struct mipi_dsi_device *dsi)
-- 
2.36.1

