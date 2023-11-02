Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE6A7DF81E
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 17:57:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6C2810E946;
	Thu,  2 Nov 2023 16:57:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D2610E945
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 16:57:28 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qyb0I-00035m-7y; Thu, 02 Nov 2023 17:57:10 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qyb0H-0067FL-Da; Thu, 02 Nov 2023 17:57:09 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qyb0H-00BjcP-3f; Thu, 02 Nov 2023 17:57:09 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Thierry Reding <treding@nvidia.com>, Marian Cichy <m.cichy@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Dan Carpenter <error27@gmail.com>
Subject: [PATCH v3 10/16] drm/imx: lcdc: Convert to platform remove callback
 returning void
Date: Thu,  2 Nov 2023 17:56:51 +0100
Message-ID: <20231102165640.3307820-28-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
References: <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1803;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=lOvzbw92fAzSV2lgBBJM743KZFY98FZ3XUbiqkFSjak=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlQ9TUNH/iOBmK8XmFSMbzr74VAyCBxzow8xCve
 F453+OOt/CJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZUPU1AAKCRCPgPtYfRL+
 TpEBB/9honWD/V2l8tgd2BzG+Mx88Z4hB6wWh8yVfMHA/Rb6E4IglUBT9RZxluD4K4rCeyc143f
 utgdz5zdorzgw6NECq+aeUWyXmSlUphQylG8sRZ7O5MV35Y32q7Keo1eRT6FzfnQRSPKYPB9omU
 l5DJbu+ylvUw88maXo2Jl59iwWThlgkRPcPskbGNEBAX54sfUJlrRxU6wGUlWCye+7U3DNvsuVo
 js9hEB2YOnLLxNVJLRJcoEsjsNkaqU730wD9WIMv9MHCIQqgjLMqlyLujPNb5bSCGINwbDCy0Kb
 43KpNlp2Vh0kTDGc6d7KVw1ZSBUlhZ/j/T/VYekalNgEo1Vv
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
Cc: linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 NXP Linux Team <linux-imx@nxp.com>, dri-devel@lists.freedesktop.org
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
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
index 22b65f4a0e30..0902983374d0 100644
--- a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
+++ b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
@@ -515,14 +515,12 @@ static int imx_lcdc_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int imx_lcdc_remove(struct platform_device *pdev)
+static void imx_lcdc_remove(struct platform_device *pdev)
 {
 	struct drm_device *drm = platform_get_drvdata(pdev);
 
 	drm_dev_unregister(drm);
 	drm_atomic_helper_shutdown(drm);
-
-	return 0;
 }
 
 static void imx_lcdc_shutdown(struct platform_device *pdev)
@@ -536,7 +534,7 @@ static struct platform_driver imx_lcdc_driver = {
 		.of_match_table = imx_lcdc_of_dev_id,
 	},
 	.probe = imx_lcdc_probe,
-	.remove = imx_lcdc_remove,
+	.remove_new = imx_lcdc_remove,
 	.shutdown = imx_lcdc_shutdown,
 };
 module_platform_driver(imx_lcdc_driver);
-- 
2.42.0

