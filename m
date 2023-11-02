Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5A57DF812
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 17:57:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A02E810E93E;
	Thu,  2 Nov 2023 16:57:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3DA810E93C
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 16:57:18 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qyb0J-0003AT-AA; Thu, 02 Nov 2023 17:57:11 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qyb0I-0067Fn-MM; Thu, 02 Nov 2023 17:57:10 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qyb0I-00Bjcx-DB; Thu, 02 Nov 2023 17:57:10 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 16/16] drm/tilcdc: Convert to platform remove callback
 returning void
Date: Thu,  2 Nov 2023 17:56:57 +0100
Message-ID: <20231102165640.3307820-34-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
References: <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2221;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=kTWUZfScUoThjhGP/JQPqSimX5tKw4MRPKC8t8GPghA=;
 b=owGbwMvMwMXY3/A7olbonx/jabUkhlTnK3f8nLI8rgYrhLNe+HB95ykTuROPHzA8n9Py3TvmA
 Vt/VTp3J6MxCwMjF4OsmCKLfeOaTKsqucjOtf8uwwxiZQKZwsDFKQATMfzM/j/7mAn/Zse8+V05
 aq66AmeWvnTKZM00XMh+K9T6zlqXmjWfmcLnBnjW/L4pF7etWPleT1G6QtK1YxdWXha766nu5d2
 w5uKJM0z+V6zKWVeFhcqt0dN6cnaW881PpxUYP97lfGVrFmVtfTQtqoqBbcLzF+4hXltCQko4wq
 8mhk91CeJu3MaRkMvSv22l9JJ//rf/bTffvdc7yN5T+r7TSoVfwq+1Dlt/qY5V4W3gzhfaJehnJ
 FwUu+ZehwVr3oPXIgw+t49Jx34M/3c5dmuP7JYvPaVuKy9H7j6mF6nuwsjLbGRtXuXoH/apeesJ
 Y8sf9vJtJ/nSzv8JfOB8U9Xa9eP9Zbeu396zQ/0Sp0YFAA==
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

There is one error path in tilcdc_pdev_remove() that potentially could
yield a non-zero return code. In this case an error message describing
the failure is emitted now instead of

	remove callback returned a non-zero value. This will be ignored.

before. Otherwise there is no difference. Also note that currently
tilcdc_get_external_components() doesn't return negative values.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/tilcdc/tilcdc_drv.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index 8ebd7134ee21..137cd9f62e9f 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -570,19 +570,18 @@ static int tilcdc_pdev_probe(struct platform_device *pdev)
 						       match);
 }
 
-static int tilcdc_pdev_remove(struct platform_device *pdev)
+static void tilcdc_pdev_remove(struct platform_device *pdev)
 {
 	int ret;
 
 	ret = tilcdc_get_external_components(&pdev->dev, NULL);
 	if (ret < 0)
-		return ret;
+		dev_err(&pdev->dev, "tilcdc_get_external_components() failed (%pe)\n",
+			ERR_PTR(ret));
 	else if (ret == 0)
 		tilcdc_fini(platform_get_drvdata(pdev));
 	else
 		component_master_del(&pdev->dev, &tilcdc_comp_ops);
-
-	return 0;
 }
 
 static void tilcdc_pdev_shutdown(struct platform_device *pdev)
@@ -599,7 +598,7 @@ MODULE_DEVICE_TABLE(of, tilcdc_of_match);
 
 static struct platform_driver tilcdc_platform_driver = {
 	.probe      = tilcdc_pdev_probe,
-	.remove     = tilcdc_pdev_remove,
+	.remove_new = tilcdc_pdev_remove,
 	.shutdown   = tilcdc_pdev_shutdown,
 	.driver     = {
 		.name   = "tilcdc",
-- 
2.42.0

