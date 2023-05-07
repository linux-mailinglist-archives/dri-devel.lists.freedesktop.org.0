Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FAC6F99EC
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 18:27:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D7BB10E29E;
	Sun,  7 May 2023 16:27:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C00A10E222
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 16:26:39 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDR-0001eo-Mk; Sun, 07 May 2023 18:26:29 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDQ-001nC0-HI; Sun, 07 May 2023 18:26:28 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDP-002AgL-Rl; Sun, 07 May 2023 18:26:27 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 12/53] drm/bridge: nwl-dsi: Convert to platform remove
 callback returning void
Date: Sun,  7 May 2023 18:25:35 +0200
Message-Id: <20230507162616.1368908-13-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1659;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=3zR5t3zdMW3365XlnzO/Z8IlMTrqK4KOlVlOFzp1Fc4=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkV9DxQD0IPuV1DexjmK4NGsy+Em9xwXS6WuRQD
 4Gu7YWbGCOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFfQ8QAKCRCPgPtYfRL+
 TgbKB/9VzRDsas8nqWOy2XHxgXS3kSZafEaPOSzZjKVEWjagcntJC6iiM28i+Y1PmC7QRZyqoW5
 iAvIJkE4G30gfP00jfGzjVI0X4/OzECg8YNMHJ6nBEXtwh8OLMYcqROOmzbGOrg0zV4umRDdMaP
 afgGPnfRDD+gr/FEcwyxS+J+oWRC70ikvtyvpAYFeEPJT31VWiVjC5mRPeeKcA4p6SbPCrItdrv
 TINo3ZI6+FFbrAoll80EdEZfim3zhjOJOKyzPDx6AR3c2ysqK3cfBLF2LCWSrEkfRhTCM5VL01o
 rD8TTdTfQXtkn0l+L8ifciaBv9Th2NyAweUx/32gqwwi4RPF
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
 drivers/gpu/drm/bridge/nwl-dsi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index 6dc2a4e191d7..4a5f5c4f5dcc 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -1199,7 +1199,7 @@ static int nwl_dsi_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int nwl_dsi_remove(struct platform_device *pdev)
+static void nwl_dsi_remove(struct platform_device *pdev)
 {
 	struct nwl_dsi *dsi = platform_get_drvdata(pdev);
 
@@ -1207,12 +1207,11 @@ static int nwl_dsi_remove(struct platform_device *pdev)
 	mipi_dsi_host_unregister(&dsi->dsi_host);
 	drm_bridge_remove(&dsi->bridge);
 	pm_runtime_disable(&pdev->dev);
-	return 0;
 }
 
 static struct platform_driver nwl_dsi_driver = {
 	.probe		= nwl_dsi_probe,
-	.remove		= nwl_dsi_remove,
+	.remove_new	= nwl_dsi_remove,
 	.driver		= {
 		.of_match_table = nwl_dsi_dt_ids,
 		.name	= DRV_NAME,
-- 
2.39.2

