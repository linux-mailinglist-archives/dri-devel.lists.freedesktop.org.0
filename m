Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A6C89E100
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 19:03:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 084F9112E3C;
	Tue,  9 Apr 2024 17:03:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF1F0112E37
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 17:03:14 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1ruEsE-0003vV-DQ; Tue, 09 Apr 2024 19:03:06 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1ruEsC-00BKyA-Jo; Tue, 09 Apr 2024 19:03:04 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1ruEsC-00H4tU-1i;
 Tue, 09 Apr 2024 19:03:04 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] drm/imagination: Convert to platform remove callback
 returning void
Date: Tue,  9 Apr 2024 19:02:48 +0200
Message-ID: <4cf10e420863f40a268f26b9bdb0c4b53dbf3406.1712681770.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1712681770.git.u.kleine-koenig@pengutronix.de>
References: <cover.1712681770.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1930;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=ABndG8JIksgn48cHu77uEqYHzKk3gEHosBYrXk4plOk=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmFXS5X1/FCHSCExcxL8LS22tGseaxbhq9NOL98
 FBKiUipqg+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZhV0uQAKCRCPgPtYfRL+
 TjLgB/9k5p+S6KQ0pkU977hoEldzuUg+zcI+5nFrOVDWJGuHprzAZbbgprrZPcfAnruCB+7DGEd
 mEgiOBQyoxufd92gxPAbBhctNrqsloBJ07VFrqLJHrRzrd+ICnfQTV9HxDM4VWHbtEC8wcWqJZV
 YtiUks7oIkqszeSeXgkR81+L2H+BdeYZSnjlOdiAga2XIN//JlFPUUOWNhxdwYFxbEiSKVtFKzY
 m6/zSwgO7XwGJszab7LafKaui5qyjF5H7unKO3M5KoPFtXCLcu/QAjsyQZAondPwNrxBvjTgw9D
 mNkJlSYwn81/LTudj46UUA1bnSyD4c+ypRCdZaDVorl4sSgD
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.

To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/imagination/pvr_drv.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
index 5c3b2d58d766..1a0cb7aa9cea 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -1451,8 +1451,7 @@ pvr_probe(struct platform_device *plat_dev)
 	return err;
 }
 
-static int
-pvr_remove(struct platform_device *plat_dev)
+static void pvr_remove(struct platform_device *plat_dev)
 {
 	struct drm_device *drm_dev = platform_get_drvdata(plat_dev);
 	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
@@ -1469,8 +1468,6 @@ pvr_remove(struct platform_device *plat_dev)
 	pvr_watchdog_fini(pvr_dev);
 	pvr_queue_device_fini(pvr_dev);
 	pvr_context_device_fini(pvr_dev);
-
-	return 0;
 }
 
 static const struct of_device_id dt_match[] = {
@@ -1485,7 +1482,7 @@ static const struct dev_pm_ops pvr_pm_ops = {
 
 static struct platform_driver pvr_driver = {
 	.probe = pvr_probe,
-	.remove = pvr_remove,
+	.remove_new = pvr_remove,
 	.driver = {
 		.name = PVR_DRIVER_NAME,
 		.pm = &pvr_pm_ops,
-- 
2.43.0

