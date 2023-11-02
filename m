Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A397DF820
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 17:57:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B285710E94A;
	Thu,  2 Nov 2023 16:57:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8BB810E948
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 16:57:31 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qyb0I-00035C-Ud; Thu, 02 Nov 2023 17:57:11 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qyb0G-0067F3-BJ; Thu, 02 Nov 2023 17:57:08 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qyb0G-00Bjc5-1e; Thu, 02 Nov 2023 17:57:08 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Aradhya Bhatia <a-bhatia1@ti.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Rob Herring <robh@kernel.org>,
 Zhu Wang <wangzhu9@huawei.com>
Subject: [PATCH v3 05/16] drm/bridge: cdns-mhdp8546: Convert to platform
 remove callback returning void
Date: Thu,  2 Nov 2023 17:56:46 +0100
Message-ID: <20231102165640.3307820-23-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
References: <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1899;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=g+ryyUe/ZEgxFTQcpVWhdIEhzawDf02Pcc6xLhiSJHg=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlQ9TOD4ef0Nx/cW1hylqwCv/X+kbjR/3Vcgphl
 9tQtf3sdQCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZUPUzgAKCRCPgPtYfRL+
 TpCBCACbljF4Wz6nrjcOF+WWk25pLbIJh96mzjiYzOefLKmQOxp9Kn9JrAeQFfH/4KH9vCef0Le
 iRivhUIfhw9yrg3byAK2K6HtJFPcMbxhpu+2QtHwSnGVPZNLJAkI+oY8iehFAGBbeKEZTFtKk8Q
 0ITJW8LceBLoZRhqTMHdG7KsqGvZ0lACLrxQ4F093OFAlLyAWGTp0AhWywymeqnd/xc/Ezsz5fU
 KUzjvaXxifKfxNctdyImGaGyIOFz/zx90AHdGQya//hPLi6XranJ94wBcorYRRhCmsaGYn2+GyL
 HGqro7OMk6VoYsSUPKN4qvMh79vEio/wdBj/FkHCsLf8ipJR
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
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 66c87d36ce51..7d470527455b 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -2596,7 +2596,7 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int cdns_mhdp_remove(struct platform_device *pdev)
+static void cdns_mhdp_remove(struct platform_device *pdev)
 {
 	struct cdns_mhdp_device *mhdp = platform_get_drvdata(pdev);
 	unsigned long timeout = msecs_to_jiffies(100);
@@ -2634,8 +2634,6 @@ static int cdns_mhdp_remove(struct platform_device *pdev)
 	/* Ignoring mhdp->hdcp.check_work and mhdp->hdcp.prop_work here. */
 
 	clk_disable_unprepare(mhdp->clk);
-
-	return 0;
 }
 
 static const struct of_device_id mhdp_ids[] = {
@@ -2658,7 +2656,7 @@ static struct platform_driver mhdp_driver = {
 		.of_match_table	= mhdp_ids,
 	},
 	.probe	= cdns_mhdp_probe,
-	.remove	= cdns_mhdp_remove,
+	.remove_new = cdns_mhdp_remove,
 };
 module_platform_driver(mhdp_driver);
 
-- 
2.42.0

