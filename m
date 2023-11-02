Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7274E7DF80F
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 17:57:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B2210E93A;
	Thu,  2 Nov 2023 16:57:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4215F10E936
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 16:57:15 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qyb0I-00037d-A3; Thu, 02 Nov 2023 17:57:10 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qyb0H-0067FR-Ql; Thu, 02 Nov 2023 17:57:09 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qyb0H-00BjcX-HQ; Thu, 02 Nov 2023 17:57:09 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3 12/16] drm/mediatek: Convert to platform remove callback
 returning void
Date: Thu,  2 Nov 2023 17:56:53 +0100
Message-ID: <20231102165640.3307820-30-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
References: <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2740;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=vPVDYdg/isijoE6YPNzKF40xrlgv7PsxpFXT9bLQRAU=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlQ9TXdTLtKBZj+1312vLvK/0mNoI9zOGh1FzV9
 LSjFAT0OzeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZUPU1wAKCRCPgPtYfRL+
 TjpiB/9Cy2T4g22T5hBdd59kgI5U6puqGtyqrJWwvC1qQwC6UT3euPHjdSI7NnASWlMrwTTbKax
 EasPtjwVAhk7t1N4tsrlAZik6gqx71y2a0AVeWItAwbNS4PaOEhhzadBCiw8ar+U1ziGI/Ws8LU
 VjSQqZcsGB78GJyuZS1WMjM8yUv7d03HGjWEjvLBTn4Fi0xtYboaSyDA1d9WK163f4tZrpN/GRe
 cBX+8JsKXdjTXZeWLEIx8iC9qSlhcmR1zvdUa2NgJSOB8npISrIRZeW7IQhPa02m27GdNFW6xA8
 BQGJBbqmilhpTMEFC7TjNNuFdD33HPjJJ8r69mXfmza0d2/Z
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
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c | 5 ++---
 drivers/gpu/drm/mediatek/mtk_ethdr.c            | 5 ++---
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index 6bf6367853fb..3fdef3ad4ffd 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -531,16 +531,15 @@ static int mtk_disp_ovl_adaptor_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mtk_disp_ovl_adaptor_remove(struct platform_device *pdev)
+static void mtk_disp_ovl_adaptor_remove(struct platform_device *pdev)
 {
 	component_master_del(&pdev->dev, &mtk_disp_ovl_adaptor_master_ops);
 	pm_runtime_disable(&pdev->dev);
-	return 0;
 }
 
 struct platform_driver mtk_disp_ovl_adaptor_driver = {
 	.probe		= mtk_disp_ovl_adaptor_probe,
-	.remove		= mtk_disp_ovl_adaptor_remove,
+	.remove_new	= mtk_disp_ovl_adaptor_remove,
 	.driver		= {
 		.name	= "mediatek-disp-ovl-adaptor",
 		.owner	= THIS_MODULE,
diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.c b/drivers/gpu/drm/mediatek/mtk_ethdr.c
index db7ac666ec5e..6a5d0c345aab 100644
--- a/drivers/gpu/drm/mediatek/mtk_ethdr.c
+++ b/drivers/gpu/drm/mediatek/mtk_ethdr.c
@@ -346,10 +346,9 @@ static int mtk_ethdr_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mtk_ethdr_remove(struct platform_device *pdev)
+static void mtk_ethdr_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &mtk_ethdr_component_ops);
-	return 0;
 }
 
 static const struct of_device_id mtk_ethdr_driver_dt_match[] = {
@@ -361,7 +360,7 @@ MODULE_DEVICE_TABLE(of, mtk_ethdr_driver_dt_match);
 
 struct platform_driver mtk_ethdr_driver = {
 	.probe		= mtk_ethdr_probe,
-	.remove		= mtk_ethdr_remove,
+	.remove_new	= mtk_ethdr_remove,
 	.driver		= {
 		.name	= "mediatek-disp-ethdr",
 		.owner	= THIS_MODULE,
-- 
2.42.0

