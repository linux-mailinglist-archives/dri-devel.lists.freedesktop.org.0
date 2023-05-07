Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 621886F99D8
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 18:27:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C136E10E26D;
	Sun,  7 May 2023 16:26:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6296310E22E
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 16:26:38 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDX-0001zz-8U; Sun, 07 May 2023 18:26:35 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDV-001nDJ-P3; Sun, 07 May 2023 18:26:33 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDU-002AhN-Sk; Sun, 07 May 2023 18:26:32 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 26/53] drm/logicvc: Convert to platform remove callback
 returning void
Date: Sun,  7 May 2023 18:25:49 +0200
Message-Id: <20230507162616.1368908-27-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1876;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=gDyK9dCRZKv2ugOYv+9odT8amOlhOfegrOYa7zlRmSs=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkV9ECk/RRbelgk/M4CBC6tKwOWBdRw4Wa818WS
 o/kqmUFfRqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFfRAgAKCRCPgPtYfRL+
 TgLZB/4hrOerFHu1lphie0c6g88xeD2r5jJ8W8sBhYxzcvXi2RM+IQAQW0m95hN7MvO9fM8lO3m
 ka1CFQz5mqb9X8H0gn/X/R4aEXRCwWIFLp9hKFdmmnf0E7EkTQY84xG66pPhUjZwY0EL2W9dr9D
 5n0twmpiSu0unKCuFBpvd4JMToD9APxALA1ufV8TlR94iaU1uPrGO+J0uK7I/OLibNgEO8hEuAa
 nrb04mAcVeSZJ08TAZ9svO0vr96MMZMXKjjmr/IKxr7Z/Mwwl9T0eWyCjN/r69tJ6P6Hupw/UHd
 Pwnw+UmJHU4qjTQEOsVDij9ftiftJzB6Z9EvFNqaXTOZNpzw
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
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
 drivers/gpu/drm/logicvc/logicvc_drm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/logicvc/logicvc_drm.c b/drivers/gpu/drm/logicvc/logicvc_drm.c
index 2fb23697740a..b97bc254dbfa 100644
--- a/drivers/gpu/drm/logicvc/logicvc_drm.c
+++ b/drivers/gpu/drm/logicvc/logicvc_drm.c
@@ -466,7 +466,7 @@ static int logicvc_drm_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int logicvc_drm_remove(struct platform_device *pdev)
+static void logicvc_drm_remove(struct platform_device *pdev)
 {
 	struct logicvc_drm *logicvc = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
@@ -480,8 +480,6 @@ static int logicvc_drm_remove(struct platform_device *pdev)
 	logicvc_clocks_unprepare(logicvc);
 
 	of_reserved_mem_device_release(dev);
-
-	return 0;
 }
 
 static const struct of_device_id logicvc_drm_of_table[] = {
@@ -493,7 +491,7 @@ MODULE_DEVICE_TABLE(of, logicvc_drm_of_table);
 
 static struct platform_driver logicvc_drm_platform_driver = {
 	.probe		= logicvc_drm_probe,
-	.remove		= logicvc_drm_remove,
+	.remove_new	= logicvc_drm_remove,
 	.driver		= {
 		.name		= "logicvc-drm",
 		.of_match_table	= logicvc_drm_of_table,
-- 
2.39.2

