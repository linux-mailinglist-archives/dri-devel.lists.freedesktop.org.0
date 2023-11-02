Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8049B7DF81F
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 17:57:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7364110E948;
	Thu,  2 Nov 2023 16:57:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B69F10E949
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 16:57:30 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qyb0K-0003A5-K6; Thu, 02 Nov 2023 17:57:12 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qyb0I-0067Fg-Eg; Thu, 02 Nov 2023 17:57:10 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qyb0I-00Bjct-50; Thu, 02 Nov 2023 17:57:10 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Robert Foss <rfoss@kernel.org>, Deepak R Varma <drv@mailo.com>,
 Rob Herring <robh@kernel.org>, Thierry Reding <treding@nvidia.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Steven Price <steven.price@arm.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v3 15/16] drm/sprd: Convert to platform remove callback
 returning void
Date: Thu,  2 Nov 2023 17:56:56 +0100
Message-ID: <20231102165640.3307820-33-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
References: <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3420;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=VxJvr4f6QljoYinaDVR7sRRBq4n859TQRQmjcTqBcV0=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlQ9Ta+bV0MmYn0HfgKAuPOXrLAsMI9TAjm2UOS
 V63/b1Ft4mJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZUPU2gAKCRCPgPtYfRL+
 Tj8YCACCPEka16svBs3GG0AkHuVXMYA6Ukoi1lxvC9iZlJdZLkF+YVWf1Wdznc70b+i95supdYH
 uc4tD7nj9dPjBo8ooysmfC6r79BQLZ5U2ncsIMHOn+Wgz28Ef1sl69wN9/OeDnqxmZu/ob0i3xV
 mCNiU+ezukTLKDW18RxUE+q3oeBqdL/eUJzSYiigeX2xCW7JSqBQzrlqHQzrirPX/6HV7Cd9hyA
 WtFlSuEEc/0enyzSze5DCg4pLnWDtQosrZIL8BZDYiD8isPpfzNidMyUUcKellOo6vY4EnI//mD
 ejw9u7meJAl3I8IV18e8CciITp5fM8aWZJJDQS8IcNVnYjEf
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
Cc: Jyri Sarha <jyri.sarha@iki.fi>, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org
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
2.42.0

