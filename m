Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C34496C51A4
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 18:03:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E47A110E9A9;
	Wed, 22 Mar 2023 17:03:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F4DD10E98D
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 17:02:33 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pf1r2-0000PL-2P; Wed, 22 Mar 2023 18:02:28 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pf1r0-005xjo-JL; Wed, 22 Mar 2023 18:02:26 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pf1qz-0075pN-W6; Wed, 22 Mar 2023 18:02:26 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 01/12] gpu: host1x: Make host1x_client_unregister() return void
Date: Wed, 22 Mar 2023 18:02:12 +0100
Message-Id: <20230322170223.410376-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322170223.410376-1-u.kleine-koenig@pengutronix.de>
References: <20230322170223.410376-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=9929;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=2b/LXVSwVlDeW8ZpQF7IIFa4doLoB6ef3XQsS/Vxdgw=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkGzSP8ivDotW//dNzpcoXmlCZPfsSMhpBXWUZc
 G3bce5nHG+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBs0jwAKCRCPgPtYfRL+
 TneKB/9zKWrYdUKgKrajsn5V+MmOp8Djsw/fmt7eqCMzPuY7YyNhZch8yJMtiGo7NN3PenKxKcM
 KjmUKeQFwO/MT8YEqhSJSzLMEqdUs+RJk1gJ5dGA4EGkS3U+1HgAYHXCfjOQ3dPD6mZIiC7Tomy
 t7PsRBnkeVOjE148IJ7yxs52CflTaS7Mr8+3Fqon/Vjt+Gm66DwtYGF0EtxT+wQCI0PEHHo44ZI
 mr/vYCJt3JWyMXQq/dp7Fp14ovQBhTexKyTxOsh9p2gpwkFNFytaBgahUVlpQzIGScnOTCRUTAp
 V4F4gVFatTU+anK8zQqVMiHhfr9Eg9Wq+zD9gFl6/qXhG4fl
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
Cc: linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
 kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This function returned zero unconditionally. Make it return no value and
simplify all callers accordingly.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/tegra/dc.c              | 7 +------
 drivers/gpu/drm/tegra/dsi.c             | 8 +-------
 drivers/gpu/drm/tegra/gr2d.c            | 8 +-------
 drivers/gpu/drm/tegra/gr3d.c            | 8 +-------
 drivers/gpu/drm/tegra/hdmi.c            | 8 +-------
 drivers/gpu/drm/tegra/hub.c             | 9 ++-------
 drivers/gpu/drm/tegra/nvdec.c           | 8 +-------
 drivers/gpu/drm/tegra/sor.c             | 8 +-------
 drivers/gpu/drm/tegra/vic.c             | 8 +-------
 drivers/gpu/host1x/bus.c                | 6 ++----
 drivers/staging/media/tegra-video/csi.c | 8 +-------
 drivers/staging/media/tegra-video/vi.c  | 8 +-------
 include/linux/host1x.h                  | 2 +-
 13 files changed, 15 insertions(+), 81 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index a67453cee883..bd108159fc2c 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -3268,12 +3268,7 @@ static int tegra_dc_remove(struct platform_device *pdev)
 	struct tegra_dc *dc = platform_get_drvdata(pdev);
 	int err;
 
-	err = host1x_client_unregister(&dc->client);
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to unregister host1x client: %d\n",
-			err);
-		return err;
-	}
+	host1x_client_unregister(&dc->client);
 
 	err = tegra_dc_rgb_remove(dc);
 	if (err < 0) {
diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index de1333dc0d86..c8a02a1024bc 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -1662,16 +1662,10 @@ static int tegra_dsi_probe(struct platform_device *pdev)
 static int tegra_dsi_remove(struct platform_device *pdev)
 {
 	struct tegra_dsi *dsi = platform_get_drvdata(pdev);
-	int err;
 
 	pm_runtime_disable(&pdev->dev);
 
-	err = host1x_client_unregister(&dsi->client);
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to unregister host1x client: %d\n",
-			err);
-		return err;
-	}
+	host1x_client_unregister(&dsi->client);
 
 	tegra_output_remove(&dsi->output);
 
diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
index e3bb4c99ed39..49b8d4953e7f 100644
--- a/drivers/gpu/drm/tegra/gr2d.c
+++ b/drivers/gpu/drm/tegra/gr2d.c
@@ -298,14 +298,8 @@ static int gr2d_probe(struct platform_device *pdev)
 static int gr2d_remove(struct platform_device *pdev)
 {
 	struct gr2d *gr2d = platform_get_drvdata(pdev);
-	int err;
 
-	err = host1x_client_unregister(&gr2d->client.base);
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to unregister host1x client: %d\n",
-			err);
-		return err;
-	}
+	host1x_client_unregister(&gr2d->client.base);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/tegra/gr3d.c b/drivers/gpu/drm/tegra/gr3d.c
index a1fd3113ea96..cd3679d8eef9 100644
--- a/drivers/gpu/drm/tegra/gr3d.c
+++ b/drivers/gpu/drm/tegra/gr3d.c
@@ -553,14 +553,8 @@ static int gr3d_probe(struct platform_device *pdev)
 static int gr3d_remove(struct platform_device *pdev)
 {
 	struct gr3d *gr3d = platform_get_drvdata(pdev);
-	int err;
 
-	err = host1x_client_unregister(&gr3d->client.base);
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to unregister host1x client: %d\n",
-			err);
-		return err;
-	}
+	host1x_client_unregister(&gr3d->client.base);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 40ec3e6cf204..6798eea317df 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -1877,14 +1877,8 @@ static int tegra_hdmi_probe(struct platform_device *pdev)
 static int tegra_hdmi_remove(struct platform_device *pdev)
 {
 	struct tegra_hdmi *hdmi = platform_get_drvdata(pdev);
-	int err;
 
-	err = host1x_client_unregister(&hdmi->client);
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to unregister host1x client: %d\n",
-			err);
-		return err;
-	}
+	host1x_client_unregister(&hdmi->client);
 
 	tegra_output_remove(&hdmi->output);
 
diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index b872527a123c..2c91dc444085 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -1178,13 +1178,8 @@ static int tegra_display_hub_remove(struct platform_device *pdev)
 {
 	struct tegra_display_hub *hub = platform_get_drvdata(pdev);
 	unsigned int i;
-	int err;
 
-	err = host1x_client_unregister(&hub->client);
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to unregister host1x client: %d\n",
-			err);
-	}
+	host1x_client_unregister(&hub->client);
 
 	for (i = 0; i < hub->soc->num_wgrps; i++) {
 		struct tegra_windowgroup *wgrp = &hub->wgrps[i];
@@ -1194,7 +1189,7 @@ static int tegra_display_hub_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 
-	return err;
+	return 0;
 }
 
 static const struct tegra_display_hub_soc tegra186_display_hub = {
diff --git a/drivers/gpu/drm/tegra/nvdec.c b/drivers/gpu/drm/tegra/nvdec.c
index 86c5818ac27b..077f3af0d0b6 100644
--- a/drivers/gpu/drm/tegra/nvdec.c
+++ b/drivers/gpu/drm/tegra/nvdec.c
@@ -550,14 +550,8 @@ static int nvdec_probe(struct platform_device *pdev)
 static int nvdec_remove(struct platform_device *pdev)
 {
 	struct nvdec *nvdec = platform_get_drvdata(pdev);
-	int err;
 
-	err = host1x_client_unregister(&nvdec->client.base);
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to unregister host1x client: %d\n",
-			err);
-		return err;
-	}
+	host1x_client_unregister(&nvdec->client.base);
 
 	falcon_exit(&nvdec->falcon);
 
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 8af632740673..d067b2d01b2e 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3981,14 +3981,8 @@ static int tegra_sor_probe(struct platform_device *pdev)
 static int tegra_sor_remove(struct platform_device *pdev)
 {
 	struct tegra_sor *sor = platform_get_drvdata(pdev);
-	int err;
 
-	err = host1x_client_unregister(&sor->client);
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to unregister host1x client: %d\n",
-			err);
-		return err;
-	}
+	host1x_client_unregister(&sor->client);
 
 	pm_runtime_disable(&pdev->dev);
 
diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index 531a71c72061..fd614756ecf8 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -540,14 +540,8 @@ static int vic_probe(struct platform_device *pdev)
 static int vic_remove(struct platform_device *pdev)
 {
 	struct vic *vic = platform_get_drvdata(pdev);
-	int err;
 
-	err = host1x_client_unregister(&vic->client.base);
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to unregister host1x client: %d\n",
-			err);
-		return err;
-	}
+	host1x_client_unregister(&vic->client.base);
 
 	falcon_exit(&vic->falcon);
 
diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index bc7271a00a94..4d16a3396c4a 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -803,7 +803,7 @@ EXPORT_SYMBOL(__host1x_client_register);
  * Removes a host1x client from its host1x controller instance. If a logical
  * device has already been initialized, it will be torn down.
  */
-int host1x_client_unregister(struct host1x_client *client)
+void host1x_client_unregister(struct host1x_client *client)
 {
 	struct host1x_client *c;
 	struct host1x *host1x;
@@ -815,7 +815,7 @@ int host1x_client_unregister(struct host1x_client *client)
 		err = host1x_del_client(host1x, client);
 		if (!err) {
 			mutex_unlock(&devices_lock);
-			return 0;
+			return;
 		}
 	}
 
@@ -832,8 +832,6 @@ int host1x_client_unregister(struct host1x_client *client)
 	mutex_unlock(&clients_lock);
 
 	host1x_bo_cache_destroy(&client->cache);
-
-	return 0;
 }
 EXPORT_SYMBOL(host1x_client_unregister);
 
diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 426e653bd55d..36ca639622c9 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -778,14 +778,8 @@ static int tegra_csi_probe(struct platform_device *pdev)
 static int tegra_csi_remove(struct platform_device *pdev)
 {
 	struct tegra_csi *csi = platform_get_drvdata(pdev);
-	int err;
 
-	err = host1x_client_unregister(&csi->client);
-	if (err < 0) {
-		dev_err(&pdev->dev,
-			"failed to unregister host1x client: %d\n", err);
-		return err;
-	}
+	host1x_client_unregister(&csi->client);
 
 	pm_runtime_disable(&pdev->dev);
 
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 11dd142c98c5..26f7aedce718 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -2041,14 +2041,8 @@ static int tegra_vi_probe(struct platform_device *pdev)
 static int tegra_vi_remove(struct platform_device *pdev)
 {
 	struct tegra_vi *vi = platform_get_drvdata(pdev);
-	int err;
 
-	err = host1x_client_unregister(&vi->client);
-	if (err < 0) {
-		dev_err(&pdev->dev,
-			"failed to unregister host1x client: %d\n", err);
-		return err;
-	}
+	host1x_client_unregister(&vi->client);
 
 	pm_runtime_disable(&pdev->dev);
 
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index 9a9de4b97a25..9c8119ed13a4 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -443,7 +443,7 @@ int __host1x_client_register(struct host1x_client *client);
 		__host1x_client_register(client);	\
 	})
 
-int host1x_client_unregister(struct host1x_client *client);
+void host1x_client_unregister(struct host1x_client *client);
 
 int host1x_client_suspend(struct host1x_client *client);
 int host1x_client_resume(struct host1x_client *client);
-- 
2.39.2

