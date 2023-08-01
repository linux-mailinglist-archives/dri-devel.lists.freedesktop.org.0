Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5179576B28F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 13:03:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAE3F10E3D9;
	Tue,  1 Aug 2023 11:03:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC35710E3BC
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 11:03:00 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qQn9K-0006gE-Oo; Tue, 01 Aug 2023 13:02:46 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qQn9I-000MZL-W7; Tue, 01 Aug 2023 13:02:45 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qQn9I-009bbg-B2; Tue, 01 Aug 2023 13:02:44 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Liviu Dudau <liviu.dudau@arm.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Danilo Krummrich <dakr@redhat.com>, Deepak R Varma <drv@mailo.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Thierry Reding <treding@nvidia.com>, Jani Nikula <jani.nikula@intel.com>,
 Jyri Sarha <jyri.sarha@iki.fi>
Subject: [PATCH v2 11/12] drm/sprd: Convert to platform remove callback
 returning void
Date: Tue,  1 Aug 2023 13:02:38 +0200
Message-Id: <20230801110239.831099-12-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230801110239.831099-1-u.kleine-koenig@pengutronix.de>
References: <20230801110239.831099-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3420;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=arbQuMb9VgivfA81jG0Rml7nKD7fQkRc8kbNMt1pbBk=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkyOXA13g6xno6rr42s7pRZqBqeWCRpDrqrmnlD
 zPbjRyPc+WJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZMjlwAAKCRCPgPtYfRL+
 Tl2JB/0dwESBpXlQnsSBKxO4cnJRXDMqsHZk6hrf0wvMj/4O76b6U9QJ3WrZk4Sy7QPdvCdvChQ
 ELRA/tDF1/0fPLQwljuYAqo/Ql8ME39x9wcSWirPW7HdHUG4/CqY3K12D4viqH4FcunPsbaSzgv
 r4p+1BLJIFSTCMfOzPydFsnYjTf4FE4mb5IsGMJKY9+BKMg7JNJGBOB+djnosgVOpjlzaNMh77W
 VajvXIKGbQHH7N4gIwNhzNodLKA6AvxSzGqNbseLCbALx8PZiajXDvkS61K9ODrcXqunUMiI1WD
 hcXvBTgmVJPX6I3Hh0p8y+6ooUku6c+I0QLa1wRvDakmKWHM
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

Trivially convert the sprd drm drivers from always returning zero in the
remove callback to the void returning variant.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jyri Sarha <jyri.sarha@iki.fi>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/sprd/sprd_dpu.c | 6 ++----
 drivers/gpu/drm/sprd/sprd_drm.c | 5 ++---
 drivers/gpu/drm/sprd/sprd_dsi.c | 6 ++----
 3 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c b/drivers/gpu/drm/sprd/sprd_dpu.c
index 48183bbd0590..deb3bb96e2a8 100644
--- a/drivers/gpu/drm/sprd/sprd_dpu.c
+++ b/drivers/gpu/drm/sprd/sprd_dpu.c
@@ -859,16 +859,14 @@ static int sprd_dpu_probe(struct platform_device *pdev)
 	return component_add(&pdev->dev, &dpu_component_ops);
 }
 
-static int sprd_dpu_remove(struct platform_device *pdev)
+static void sprd_dpu_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &dpu_component_ops);
-
-	return 0;
 }
 
 struct platform_driver sprd_dpu_driver = {
 	.probe = sprd_dpu_probe,
-	.remove = sprd_dpu_remove,
+	.remove_new = sprd_dpu_remove,
 	.driver = {
 		.name = "sprd-dpu-drv",
 		.of_match_table = dpu_match_table,
diff --git a/drivers/gpu/drm/sprd/sprd_drm.c b/drivers/gpu/drm/sprd/sprd_drm.c
index 0aa39156f2fa..a74cd0caf645 100644
--- a/drivers/gpu/drm/sprd/sprd_drm.c
+++ b/drivers/gpu/drm/sprd/sprd_drm.c
@@ -138,10 +138,9 @@ static int sprd_drm_probe(struct platform_device *pdev)
 	return drm_of_component_probe(&pdev->dev, component_compare_of, &drm_component_ops);
 }
 
-static int sprd_drm_remove(struct platform_device *pdev)
+static void sprd_drm_remove(struct platform_device *pdev)
 {
 	component_master_del(&pdev->dev, &drm_component_ops);
-	return 0;
 }
 
 static void sprd_drm_shutdown(struct platform_device *pdev)
@@ -164,7 +163,7 @@ MODULE_DEVICE_TABLE(of, drm_match_table);
 
 static struct platform_driver sprd_drm_driver = {
 	.probe = sprd_drm_probe,
-	.remove = sprd_drm_remove,
+	.remove_new = sprd_drm_remove,
 	.shutdown = sprd_drm_shutdown,
 	.driver = {
 		.name = "sprd-drm-drv",
diff --git a/drivers/gpu/drm/sprd/sprd_dsi.c b/drivers/gpu/drm/sprd/sprd_dsi.c
index d7b143a75601..0b69c140eab3 100644
--- a/drivers/gpu/drm/sprd/sprd_dsi.c
+++ b/drivers/gpu/drm/sprd/sprd_dsi.c
@@ -1051,18 +1051,16 @@ static int sprd_dsi_probe(struct platform_device *pdev)
 	return mipi_dsi_host_register(&dsi->host);
 }
 
-static int sprd_dsi_remove(struct platform_device *pdev)
+static void sprd_dsi_remove(struct platform_device *pdev)
 {
 	struct sprd_dsi *dsi = dev_get_drvdata(&pdev->dev);
 
 	mipi_dsi_host_unregister(&dsi->host);
-
-	return 0;
 }
 
 struct platform_driver sprd_dsi_driver = {
 	.probe = sprd_dsi_probe,
-	.remove = sprd_dsi_remove,
+	.remove_new = sprd_dsi_remove,
 	.driver = {
 		.name = "sprd-dsi-drv",
 		.of_match_table = dsi_match_table,
-- 
2.39.2

