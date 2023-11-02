Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0419E7DF817
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 17:57:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2BFD10E940;
	Thu,  2 Nov 2023 16:57:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E6710E93E
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 16:57:20 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qyb0I-000381-H9; Thu, 02 Nov 2023 17:57:10 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qyb0I-0067FW-0y; Thu, 02 Nov 2023 17:57:10 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qyb0H-00Bjcl-Ny; Thu, 02 Nov 2023 17:57:09 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v3 13/16] drm/meson: Convert to platform remove callback
 returning void
Date: Thu,  2 Nov 2023 17:56:54 +0100
Message-ID: <20231102165640.3307820-31-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
References: <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1919;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=fTCgeG8D3r24mPhaDqET6D9T7D0QbFJghvuSAARj8M8=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlQ9TYIjO1+70sN6Yiz3+MVdT0lSg9thUez+jFX
 Ej2s/15KOaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZUPU2AAKCRCPgPtYfRL+
 TncICAC38V4qAo1DtPCUBId7a9LgQZcf0pNV2nIpntNvOOt+ubXsT2Y09QjrDFA0X4Cz1QtyJZB
 pgYpezDiy2iYB2juJxDdc7/gwUeoshFsr3V44ie43vPnXM5spMmziRYW+d37hdgbOgK04QV3fwD
 6q+N1nlPiw8BDLeALE0rtutcMZDFViAd83WB4Hqlj2ieBhricJ5cf8HTPCDt/c25AU/slDu3urX
 czDiq5w0QsECfQP2bL3esSs5Cli1q8weyamxNNuTZCDITYn4gojvsBwPRMU1UUBfTH8Ocs//M+P
 oZR3udcV3M8GpNFkSi6ofcmu3kD8SuIIgrt5lcpVKIpX37m9
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
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
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
index e5fe4e994f43..a6bc1bdb3d0d 100644
--- a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
+++ b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
@@ -323,13 +323,11 @@ static int meson_dw_mipi_dsi_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int meson_dw_mipi_dsi_remove(struct platform_device *pdev)
+static void meson_dw_mipi_dsi_remove(struct platform_device *pdev)
 {
 	struct meson_dw_mipi_dsi *mipi_dsi = platform_get_drvdata(pdev);
 
 	dw_mipi_dsi_remove(mipi_dsi->dmd);
-
-	return 0;
 }
 
 static const struct of_device_id meson_dw_mipi_dsi_of_table[] = {
@@ -340,7 +338,7 @@ MODULE_DEVICE_TABLE(of, meson_dw_mipi_dsi_of_table);
 
 static struct platform_driver meson_dw_mipi_dsi_platform_driver = {
 	.probe		= meson_dw_mipi_dsi_probe,
-	.remove		= meson_dw_mipi_dsi_remove,
+	.remove_new	= meson_dw_mipi_dsi_remove,
 	.driver		= {
 		.name		= DRIVER_NAME,
 		.of_match_table	= meson_dw_mipi_dsi_of_table,
-- 
2.42.0

