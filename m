Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5766F6F99DF
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 18:27:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EE9610E285;
	Sun,  7 May 2023 16:26:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA5E610E208
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 16:26:44 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDd-0002NJ-Es; Sun, 07 May 2023 18:26:41 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDc-001nF2-M3; Sun, 07 May 2023 18:26:40 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDb-002Aii-UE; Sun, 07 May 2023 18:26:39 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jyri Sarha <jyri.sarha@iki.fi>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 47/53] drm/tilcdc: Convert to platform remove callback
 returning void
Date: Sun,  7 May 2023 18:26:10 +0200
Message-Id: <20230507162616.1368908-48-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1813;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=wQYiy0fDSmEVU6s8ZTX35+j1+tLPKcW8seo/kSoEsOc=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkV9EboLQqKyB+U1xLhuk5p7gL/ni0E4o4pg86T
 S2yEzzh8s2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFfRGwAKCRCPgPtYfRL+
 Th7oCACxD509e7JwbenUizQEG8m6LJ8klYLaV8DS4EANoZeooHsDAqMs1CmKG+5BHKZ9XjeSHQO
 zpr0xEAKz652qGxQR9wIqGxlA1ret2zuYymhXvd9NrDjzMUQA+4gWHPat9hTWCPRGC5XFhESt2q
 PQ5vJOqyfS1SOJHrdX8M+BW0/cyd0Q3rg2rHSDzM0t9+VHAVeM0kuu0UtVukQ2PVU+lnSMHO14L
 gWz7W9bNfooPDYVupdEyBgoaTJtGXqdS0ECBVGmKGvXwWV/brn9MzSk+eH7c7sucfavv/2X+llq
 /ofROSbDnTWtEXl+Wn2jYzgBMIi13MiBR5xrnh5bx2dNb0ei
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomba@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/tilcdc/tilcdc_panel.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_panel.c b/drivers/gpu/drm/tilcdc/tilcdc_panel.c
index 2729e16bc053..9aefd010acde 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_panel.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_panel.c
@@ -374,7 +374,7 @@ static int panel_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int panel_remove(struct platform_device *pdev)
+static void panel_remove(struct platform_device *pdev)
 {
 	struct tilcdc_module *mod = dev_get_platdata(&pdev->dev);
 	struct panel_module *panel_mod = to_panel_module(mod);
@@ -387,8 +387,6 @@ static int panel_remove(struct platform_device *pdev)
 
 	tilcdc_module_cleanup(mod);
 	kfree(panel_mod->info);
-
-	return 0;
 }
 
 static const struct of_device_id panel_of_match[] = {
@@ -398,7 +396,7 @@ static const struct of_device_id panel_of_match[] = {
 
 static struct platform_driver panel_driver = {
 	.probe = panel_probe,
-	.remove = panel_remove,
+	.remove_new = panel_remove,
 	.driver = {
 		.name = "tilcdc-panel",
 		.of_match_table = panel_of_match,
-- 
2.39.2

