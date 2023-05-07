Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E026F99E5
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 18:27:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C4C10E275;
	Sun,  7 May 2023 16:27:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1270410E236
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 16:26:40 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDV-0001s8-Tn; Sun, 07 May 2023 18:26:33 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDU-001nD1-DM; Sun, 07 May 2023 18:26:32 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDS-002Agy-Lf; Sun, 07 May 2023 18:26:30 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 21/53] drm/imx/dcss: Convert to platform remove callback
 returning void
Date: Sun,  7 May 2023 18:25:44 +0200
Message-Id: <20230507162616.1368908-22-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1795;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=8QCnUZlvXPTd47a8W8x+3k75pn2h7bblLfemtxDr4sc=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkV9D8NLTLML+jR52jrQgBCDWZdlqjokiu8FizP
 6XBcumWWI+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFfQ/AAKCRCPgPtYfRL+
 Tq0YB/9T7wpxwOmq2Lm/xHfQqGhIC6jN3pD6Pp+qUHl44kQf5UYA0IAjnqr2Vmz2hvaY4EvJ/H7
 MATIikJHqX8MlQ+S+QckLmVZsS4FpddbVEN7IPhyAvi78HCOG8h1cbAFfPOnri4ylvHV7FUp/o1
 H/G0UHjTIYj3lm/JE8MB3BE4touviAgXBb9edPhKmZCVZJsV/5QURL7z5skF8BSpkvryUuapjcI
 Fb9rEyC/ja3HqZ7jbCkdTDSV62gezTH/iE/GmxCtkxMjQortiaI/S4ezjGPSe6L4zJ1rgBmXsGS
 Dpod/0JXL0vFOLRB86+2DXRSridVIhV0UDevfEfqKLM/ibMH
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
Cc: dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
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
 drivers/gpu/drm/imx/dcss/dcss-drv.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-drv.c b/drivers/gpu/drm/imx/dcss/dcss-drv.c
index 4f2291610139..3400ec23cae5 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-drv.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-drv.c
@@ -79,7 +79,7 @@ static int dcss_drv_platform_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int dcss_drv_platform_remove(struct platform_device *pdev)
+static void dcss_drv_platform_remove(struct platform_device *pdev)
 {
 	struct dcss_drv *mdrv = dev_get_drvdata(&pdev->dev);
 
@@ -87,8 +87,6 @@ static int dcss_drv_platform_remove(struct platform_device *pdev)
 	dcss_dev_destroy(mdrv->dcss);
 
 	kfree(mdrv);
-
-	return 0;
 }
 
 static struct dcss_type_data dcss_types[] = {
@@ -112,7 +110,7 @@ MODULE_DEVICE_TABLE(of, dcss_of_match);
 
 static struct platform_driver dcss_platform_driver = {
 	.probe	= dcss_drv_platform_probe,
-	.remove	= dcss_drv_platform_remove,
+	.remove_new = dcss_drv_platform_remove,
 	.driver	= {
 		.name = "imx-dcss",
 		.of_match_table	= dcss_of_match,
-- 
2.39.2

