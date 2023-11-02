Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3810A7DF810
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 17:57:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41A9F10E93C;
	Thu,  2 Nov 2023 16:57:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A7710E938
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 16:57:15 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qyb0I-000367-5K; Thu, 02 Nov 2023 17:57:10 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qyb0H-0067FO-Jx; Thu, 02 Nov 2023 17:57:09 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qyb0H-00BjcT-Ag; Thu, 02 Nov 2023 17:57:09 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Edmund Dea <edmund.j.dea@intel.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 11/16] drm/kmb: Convert to platform remove callback
 returning void
Date: Thu,  2 Nov 2023 17:56:52 +0100
Message-ID: <20231102165640.3307820-29-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
References: <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1873;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=meNOPUqSnuedinMtH81QBGABLwSA9YLPHWESSKe0Dik=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlQ9TWZqs7sBUPode9MRg280adBlX+A9X3KekLA
 u4MYdY4DASJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZUPU1gAKCRCPgPtYfRL+
 TqsICACPUY4zjDJdwFdaiSZmbasd34jpN//CDBM5j3tu5WXKYUkL3rXqiOlD7FBa3XBDomGEEj+
 UgxwBIN6lX72VV6pf1gLWAutmXUlOr92GyhGwyOiFbl7/Sbn185IUxnBlLBtm+XNmNsRbHQ6RLl
 vtM6/DDnoDJ+dd6pDIOLx/IY7w/H/hxOxUWdoekudWKNMbkz6HgZVZqHCRB/0FdUKiq6UD+/+Q3
 bzHLr41x3VL6IoY3FJmTV8+QzD9ZIkSAfBHCCOV8tPKkT2JZACB7+VAg2ySUxMG5GlxRqmcy1Ag
 sZj7wOpajTx46L2psNXjEyV66ssFr4qszAzzaBwsr45Is3aE
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jyri Sarha <jyri.sarha@iki.fi>,
 kernel@pengutronix.de, dri-devel@lists.freedesktop.org
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

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jyri Sarha <jyri.sarha@iki.fi>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/kmb/kmb_drv.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index 24035b53441c..169b83987ce2 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -448,7 +448,7 @@ static const struct drm_driver kmb_driver = {
 	.minor = DRIVER_MINOR,
 };
 
-static int kmb_remove(struct platform_device *pdev)
+static void kmb_remove(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct drm_device *drm = dev_get_drvdata(dev);
@@ -473,7 +473,6 @@ static int kmb_remove(struct platform_device *pdev)
 	/* Unregister DSI host */
 	kmb_dsi_host_unregister(kmb->kmb_dsi);
 	drm_atomic_helper_shutdown(drm);
-	return 0;
 }
 
 static int kmb_probe(struct platform_device *pdev)
@@ -621,7 +620,7 @@ static SIMPLE_DEV_PM_OPS(kmb_pm_ops, kmb_pm_suspend, kmb_pm_resume);
 
 static struct platform_driver kmb_platform_driver = {
 	.probe = kmb_probe,
-	.remove = kmb_remove,
+	.remove_new = kmb_remove,
 	.driver = {
 		.name = "kmb-drm",
 		.pm = &kmb_pm_ops,
-- 
2.42.0

