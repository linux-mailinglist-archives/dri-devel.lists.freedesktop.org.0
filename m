Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4676F99CA
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 18:27:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F60510E208;
	Sun,  7 May 2023 16:26:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4665910E222
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 16:26:44 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDd-0002NU-Ms; Sun, 07 May 2023 18:26:41 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDc-001nF5-Sl; Sun, 07 May 2023 18:26:40 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDc-002Ail-5j; Sun, 07 May 2023 18:26:40 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alexey Brodkin <abrodkin@synopsys.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 48/53] drm/tiny: Convert to platform remove callback returning
 void
Date: Sun,  7 May 2023 18:26:11 +0200
Message-Id: <20230507162616.1368908-49-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1636;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=YBWtrG3wx/uqLLlEiAeg9FqxCra+wH9O9gIXPtRKyGU=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkV9Ec4lbjiJrzAtey6HhHPKlo2qIjI1BqX2cjI
 OX1QQSNqQqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFfRHAAKCRCPgPtYfRL+
 TtwSB/9h9ZcS35pUGgxUS59cDYpIfirsfj2dH3bgS8Jn7xdaR7uugdvFZsjpOYAU/GUUIko+8c1
 k3CyU0oLABszbYLxmgBiLtvurugO2kSMFe4od3Y406o7f5qTJiv8WITWd/fGSyA9JXsWsXNlJXy
 g895P2yBmf4dev/PyG0zjjGuZfmVDp+s8Ga1DG+bBWS5GWasUUr71ywt6B2R5lgDbFVfE/TMisg
 OQYsuJXOmuWJwde4ofEIoe5mmcdqAYCmlez4JpFnp/4rxLdx0xq7XByr7V4i6UDc5l+ela7n/A5
 e590VSbQuSNBTXyu+/QsCZ7L6Gk2Tv0PwnMQ8Jr9vzOz+axe
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

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/tiny/arcpgu.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index 611bbee15071..a1f998a85ce8 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -404,14 +404,12 @@ static int arcpgu_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int arcpgu_remove(struct platform_device *pdev)
+static void arcpgu_remove(struct platform_device *pdev)
 {
 	struct drm_device *drm = platform_get_drvdata(pdev);
 
 	drm_dev_unregister(drm);
 	arcpgu_unload(drm);
-
-	return 0;
 }
 
 static const struct of_device_id arcpgu_of_table[] = {
@@ -423,7 +421,7 @@ MODULE_DEVICE_TABLE(of, arcpgu_of_table);
 
 static struct platform_driver arcpgu_platform_driver = {
 	.probe = arcpgu_probe,
-	.remove = arcpgu_remove,
+	.remove_new = arcpgu_remove,
 	.driver = {
 		   .name = "arcpgu",
 		   .of_match_table = arcpgu_of_table,
-- 
2.39.2

