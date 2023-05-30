Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F33F71573F
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 09:42:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D81C10E35C;
	Tue, 30 May 2023 07:42:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED3F910E35C
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 07:42:25 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1q3tzp-0001zQ-CU; Tue, 30 May 2023 09:42:21 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1q3tzo-003owx-41; Tue, 30 May 2023 09:42:20 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1q3tzm-009Oeg-Tw; Tue, 30 May 2023 09:42:18 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH] drm/panel-edp: Convert to platform remove callback returning
 void
Date: Tue, 30 May 2023 09:42:16 +0200
Message-Id: <20230530074216.2195962-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2271;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=PxDcFGefuzaVLF+4lAcecsU9qknMtXPqyr2LFQex+gI=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkdajXg0tb8DxqMZxkmCY7kmih2Vtet+t0vzmtQ
 AVGXtax2/KJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZHWo1wAKCRCPgPtYfRL+
 Tm3tB/9na0m5I3nT9H5VlCR3PalMwmAKWdMQhp/h/cKsWxFeR+feOoDq3kYtH4/JdP/TvxrswUV
 qtatmAcxjyzKmr2S5NRUgncXiciWHFjXR/NJu1+t+yhZmSniyfx4POmenYjbQN9cmBrbaAGWKuQ
 B3y3cvSqQ+ps6vf+EVz+Cecnk20prqNGD59mKjvFJUaWXfGtPRF/AILY3OaDPktt+yGf7HjvANj
 Pp7DDIEnYjIqSzt9co1suq5pxyKYu+a5wrtOu3u3VN1C57NBzoF5miAOIqQpcNne1up/trumrxR
 7Gy0JsQoZOPFUw5N96MX4CQXvVz0RQnwWldfq4tTZt1LIzlk
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
Cc: kernel@pengutronix.de, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code.  However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

panel_edp_remove() always returned zero, so convert it to return void
without any loss and then just drop the return from
panel_edp_platform_remove().

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/panel/panel-edp.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index e23ddab2126e..fbd114b4f0be 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -903,7 +903,7 @@ static int panel_edp_probe(struct device *dev, const struct panel_desc *desc,
 	return err;
 }
 
-static int panel_edp_remove(struct device *dev)
+static void panel_edp_remove(struct device *dev)
 {
 	struct panel_edp *panel = dev_get_drvdata(dev);
 
@@ -918,8 +918,6 @@ static int panel_edp_remove(struct device *dev)
 
 	kfree(panel->edid);
 	panel->edid = NULL;
-
-	return 0;
 }
 
 static void panel_edp_shutdown(struct device *dev)
@@ -1934,9 +1932,9 @@ static int panel_edp_platform_probe(struct platform_device *pdev)
 	return panel_edp_probe(&pdev->dev, id->data, NULL);
 }
 
-static int panel_edp_platform_remove(struct platform_device *pdev)
+static void panel_edp_platform_remove(struct platform_device *pdev)
 {
-	return panel_edp_remove(&pdev->dev);
+	panel_edp_remove(&pdev->dev);
 }
 
 static void panel_edp_platform_shutdown(struct platform_device *pdev)
@@ -1957,7 +1955,7 @@ static struct platform_driver panel_edp_platform_driver = {
 		.pm = &panel_edp_pm_ops,
 	},
 	.probe = panel_edp_platform_probe,
-	.remove = panel_edp_platform_remove,
+	.remove_new = panel_edp_platform_remove,
 	.shutdown = panel_edp_platform_shutdown,
 };
 

base-commit: ac9a78681b921877518763ba0e89202254349d1b
-- 
2.39.2

