Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 177166F99BC
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 18:26:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1332210E1FF;
	Sun,  7 May 2023 16:26:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3B1710E1D9
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 16:26:35 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDT-0001li-Ns; Sun, 07 May 2023 18:26:31 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDS-001nCb-RV; Sun, 07 May 2023 18:26:30 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDS-002Agq-4e; Sun, 07 May 2023 18:26:30 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 19/53] drm/fsl-dcu: Convert to platform remove callback
 returning void
Date: Sun,  7 May 2023 18:25:42 +0200
Message-Id: <20230507162616.1368908-20-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1747;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=CzWRQlFRXvdkeV3ss06LaVEr5UYl3veXf4uwAJ0mK38=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkV9D593nUTIJqc7iVjuvQkupPVfWpZ+q9MDVws
 W+j6thrNP2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFfQ+QAKCRCPgPtYfRL+
 TiD6CACt3iEgttlT5lyoMibtEjyNlv1hlpIfQxB5HlcbWd+RnZ15jMT7/K74kvZI1CE3HbHnYLw
 G6bx5lsRdZNDzEA3waow87QDY3QWmiLagZ0KiqZGLgody8gzVy/9SSvE99KnQIj9tmnMVUUYIwR
 UYaD0rylkVB7jFvvZIEMIc1lZMQtE0p26How2bdErSGztsuhMC/y5gvT1WPyBJC++rEFnmJjsKU
 VjLLrwqSVDO9SF3CH6m3GT5l8VRlga3lPDnGGAHJzUXNABAAAqz7gL2GEiWmxh6gpgvNfsTdORz
 9+FAEcs15yTEf8xhKr6ieiDaPpYjCbGQWm5NckkR89VH7V7c
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
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
index 8579c7629f5e..532c326b4ec9 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
@@ -346,7 +346,7 @@ static int fsl_dcu_drm_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int fsl_dcu_drm_remove(struct platform_device *pdev)
+static void fsl_dcu_drm_remove(struct platform_device *pdev)
 {
 	struct fsl_dcu_drm_device *fsl_dev = platform_get_drvdata(pdev);
 
@@ -354,13 +354,11 @@ static int fsl_dcu_drm_remove(struct platform_device *pdev)
 	drm_dev_put(fsl_dev->drm);
 	clk_disable_unprepare(fsl_dev->clk);
 	clk_unregister(fsl_dev->pix_clk);
-
-	return 0;
 }
 
 static struct platform_driver fsl_dcu_drm_platform_driver = {
 	.probe		= fsl_dcu_drm_probe,
-	.remove		= fsl_dcu_drm_remove,
+	.remove_new	= fsl_dcu_drm_remove,
 	.driver		= {
 		.name	= "fsl-dcu",
 		.pm	= &fsl_dcu_drm_pm_ops,
-- 
2.39.2

