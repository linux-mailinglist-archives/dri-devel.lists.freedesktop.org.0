Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3327DF81A
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 17:57:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B3610E943;
	Thu,  2 Nov 2023 16:57:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA90810E93C
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 16:57:18 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qyb0G-000359-TN; Thu, 02 Nov 2023 17:57:08 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qyb0F-0067Eu-Mr; Thu, 02 Nov 2023 17:57:07 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qyb0F-00Bjbt-DP; Thu, 02 Nov 2023 17:57:07 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alexey Brodkin <abrodkin@synopsys.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 02/16] drm/arcpgu: Convert to platform remove callback
 returning void
Date: Thu,  2 Nov 2023 17:56:43 +0100
Message-ID: <20231102165640.3307820-20-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
References: <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1735;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=8IXUgGCF6C80h2YF2swlAqHfQmqmsgiKQye0ljgGTbk=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlQ9TL8jfhkxBRXuaZ/PIMQNID0wSQIuZfre2kc
 EvdyFfsaZCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZUPUywAKCRCPgPtYfRL+
 TpCRB/0aNRsdpFy5YeaixP6eQautflOM9WBkWIiA9DpsfOYKZlQZhLOBkoxBSZ3K7veOxYtCj/N
 32XBntg+Hh8/6rWXzEEfv0Y4UYQNAEU0XFSoUPfSeKalZolPYc6Dy9DIQlFKV7jUOlWVkoCFgsZ
 htNqGzjI3DrxwYJ6qhJuUdc9os5awqln22y27LLEdf0ojNhhkLJqCcw0mre5dQ3nm8aQIkUkbhv
 stocZEHL7Vzht+9qFuljwBf7cA2ZTfWl7tVjKijthAndA+hYiz49U/DTZwgKtil7GW3sA5X+Wky
 Rd+jXqIUqmOVbY6td7spxOsTpaXJWPnETpVrgG3kAttP3yXm
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
Cc: Jyri Sarha <jyri.sarha@iki.fi>, kernel@pengutronix.de,
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

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jyri Sarha <jyri.sarha@iki.fi>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/tiny/arcpgu.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index e5b10e41554a..4f8f3172379e 100644
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
2.42.0

