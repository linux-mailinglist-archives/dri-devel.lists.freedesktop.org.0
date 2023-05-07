Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C953E6F99F2
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 18:27:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5ACC10E2A8;
	Sun,  7 May 2023 16:27:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECF1810E236
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 16:26:47 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDf-0002St-Lm; Sun, 07 May 2023 18:26:43 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDe-001nFb-Tt; Sun, 07 May 2023 18:26:42 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDd-002Aj7-Uo; Sun, 07 May 2023 18:26:41 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Hyun Kwon <hyun.kwon@xilinx.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH 53/53] drm/xlnx/zynqmp_dpsub: Convert to platform remove
 callback returning void
Date: Sun,  7 May 2023 18:26:16 +0200
Message-Id: <20230507162616.1368908-54-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1811;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=1OFs8gq9rcSiY3GC5R+mWCCoyWzrijWJ9r/w+MBqonM=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkV9EiTx+gk5mp2TKtlfxQrqKj9xImTutMUGqlq
 xnaa0ezCZyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFfRIgAKCRCPgPtYfRL+
 TjZ7B/44JNFHQi7+aKJ3eO+2lyO5+Em+POl0KA03pQ4VsKrqTw+ZawNSVn+nSm3rFfQkbZSLBkE
 2TZaYI1DDTeuPOSOyJUg2emUJYdnoo8kYLgSd7FznkF4sZ0SUiq3JQ8EV3lBXu1I0r41QU5dAJK
 wETBQ8O2eaPInIKYtugHbGQ9ei0n5UdEmC+p5O12jJ3M7JW75HTc1XLef2iAkdX/kA1rD5/izpw
 d2LJepHvVtIUup6BZ9F/UY/D+ZKZVX73GXFOsBxGyxaB7o37fnptz4VB4/RAfb90y0vXFLreX5S
 w3/gSGgXMtP3retHvz5gXqNCeMKw3AOj4ouY4QQviGaQD/6p
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
Cc: kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
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

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
index bab862484d42..9d64a8d98372 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
@@ -280,7 +280,7 @@ static int zynqmp_dpsub_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int zynqmp_dpsub_remove(struct platform_device *pdev)
+static void zynqmp_dpsub_remove(struct platform_device *pdev)
 {
 	struct zynqmp_dpsub *dpsub = platform_get_drvdata(pdev);
 
@@ -298,8 +298,6 @@ static int zynqmp_dpsub_remove(struct platform_device *pdev)
 
 	if (!dpsub->drm)
 		zynqmp_dpsub_release(dpsub);
-
-	return 0;
 }
 
 static void zynqmp_dpsub_shutdown(struct platform_device *pdev)
@@ -320,7 +318,7 @@ MODULE_DEVICE_TABLE(of, zynqmp_dpsub_of_match);
 
 static struct platform_driver zynqmp_dpsub_driver = {
 	.probe			= zynqmp_dpsub_probe,
-	.remove			= zynqmp_dpsub_remove,
+	.remove_new		= zynqmp_dpsub_remove,
 	.shutdown		= zynqmp_dpsub_shutdown,
 	.driver			= {
 		.name		= "zynqmp-dpsub",
-- 
2.39.2

