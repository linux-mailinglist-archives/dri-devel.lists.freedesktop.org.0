Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D78B7DF813
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 17:57:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCD2810E93F;
	Thu,  2 Nov 2023 16:57:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 782B210E940
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 16:57:20 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qyb0I-00039M-MP; Thu, 02 Nov 2023 17:57:10 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qyb0I-0067Fa-7R; Thu, 02 Nov 2023 17:57:10 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qyb0H-00Bjcp-UO; Thu, 02 Nov 2023 17:57:09 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 14/16] drm/nouveau: Convert to platform remove callback
 returning void
Date: Thu,  2 Nov 2023 17:56:55 +0100
Message-ID: <20231102165640.3307820-32-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
References: <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1738;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=XPVoJBbMBUSvYyjx4uw4bxZxhwzLEYZRiBurlJ1CeFE=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlQ9TZxTgPSo6BtSM42ZJD90Vg269nthAoWtIoB
 xljx+SeDTuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZUPU2QAKCRCPgPtYfRL+
 TrBWCACq5Sq8orLY/rMi5HzQmXpTYwnpbfEeQgUhhO/sPIobjUehgobUEuKAfyQ4YiJcChNshO8
 kVuFSRiQSQAGcc5fKNXAPWSH0ddymXhukVRrdfnHgkE9WEvPYHv19evsDkhLLnPff/VeVtzANOM
 eWEF2Of0LPyAXSddI6FM/zG1uBw6z5DBAwBVRpAscXRn6W/dzHCzK4QvKdMNiTW7FqKeBfpdtks
 mguaiuv5AO9EpiLtM2cU2YKWE9CezTsmcl1+QBijsVQzmPfHwnm9qhEe1VdAnRQ+SV5NzTxaHPl
 0YL7bP85wTIG7/QIR1kiseQR+Z0xmHBFh/5dpiwLnMPy6Ya/
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
Cc: nouveau@lists.freedesktop.org, Jyri Sarha <jyri.sarha@iki.fi>,
 kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
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

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jyri Sarha <jyri.sarha@iki.fi>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/nouveau/nouveau_platform.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_platform.c b/drivers/gpu/drm/nouveau/nouveau_platform.c
index 23cd43a7fd19..bf2dc7567ea4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_platform.c
+++ b/drivers/gpu/drm/nouveau/nouveau_platform.c
@@ -43,11 +43,10 @@ static int nouveau_platform_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int nouveau_platform_remove(struct platform_device *pdev)
+static void nouveau_platform_remove(struct platform_device *pdev)
 {
 	struct drm_device *dev = platform_get_drvdata(pdev);
 	nouveau_drm_device_remove(dev);
-	return 0;
 }
 
 #if IS_ENABLED(CONFIG_OF)
@@ -93,5 +92,5 @@ struct platform_driver nouveau_platform_driver = {
 		.of_match_table = of_match_ptr(nouveau_platform_match),
 	},
 	.probe = nouveau_platform_probe,
-	.remove = nouveau_platform_remove,
+	.remove_new = nouveau_platform_remove,
 };
-- 
2.42.0

