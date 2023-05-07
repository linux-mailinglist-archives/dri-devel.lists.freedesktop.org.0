Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 521386F99DB
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 18:27:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B8C10E284;
	Sun,  7 May 2023 16:26:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F5E210E23B
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 16:26:40 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDS-0001j8-LH; Sun, 07 May 2023 18:26:30 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDR-001nCJ-Vu; Sun, 07 May 2023 18:26:29 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDR-002Agb-27; Sun, 07 May 2023 18:26:29 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 15/53] drm/bridge: thc63lvd1024: Convert to platform remove
 callback returning void
Date: Sun,  7 May 2023 18:25:38 +0200
Message-Id: <20230507162616.1368908-16-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1635;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=Ic76M4VTTSlOXuvE6Vhc9SPsqmsW6NQH4QEoa1JX0To=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkV9D0SqtGxVWorqlYjd93M/u80niW0t0RBjKEE
 wN0+MRCG7GJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFfQ9AAKCRCPgPtYfRL+
 TjYyB/9hHoo8r9l0mnwug7Os/lUQISAt6SgqR0cfSnkm0n1jNHOnkJV8kXBWUPXzUxcnzzTVKvl
 Jz81nHTTG6Txabh2XupdLpRVDT7pF1GartKjIsJvv2aB57SxPjw0cM+FNISIF0zCOr5hIYHL4ml
 pIJ2zDxIMoLQ61n7E6AtugsUU3I0EpvX0FOy/UQhhYvtVzinwh+yHTAGcbp230gNrwj6W8HYjLc
 UTtBghTswzTrBib0ktZJtWhrCHofElY1KSzG3LNubdey7W0Jwkp8Sy/ElF9q1V5wZcWBGkEWFXb
 +QVZ46NxSRQqZG/IQIi5rWCuKVmvk52neqoYZpqhrG8Lp8eV
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
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>
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
 drivers/gpu/drm/bridge/thc63lvd1024.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/thc63lvd1024.c b/drivers/gpu/drm/bridge/thc63lvd1024.c
index e21078b2f8b5..d4c1a601bbb5 100644
--- a/drivers/gpu/drm/bridge/thc63lvd1024.c
+++ b/drivers/gpu/drm/bridge/thc63lvd1024.c
@@ -230,13 +230,11 @@ static int thc63_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int thc63_remove(struct platform_device *pdev)
+static void thc63_remove(struct platform_device *pdev)
 {
 	struct thc63_dev *thc63 = platform_get_drvdata(pdev);
 
 	drm_bridge_remove(&thc63->bridge);
-
-	return 0;
 }
 
 static const struct of_device_id thc63_match[] = {
@@ -247,7 +245,7 @@ MODULE_DEVICE_TABLE(of, thc63_match);
 
 static struct platform_driver thc63_driver = {
 	.probe	= thc63_probe,
-	.remove	= thc63_remove,
+	.remove_new = thc63_remove,
 	.driver	= {
 		.name		= "thc63lvd1024",
 		.of_match_table	= thc63_match,
-- 
2.39.2

