Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 665AA6BFC40
	for <lists+dri-devel@lfdr.de>; Sat, 18 Mar 2023 20:08:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE72510E0CC;
	Sat, 18 Mar 2023 19:08:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D88610E058
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 19:08:31 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdbuf-0001o0-UX; Sat, 18 Mar 2023 20:08:21 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdbue-0054EH-AE; Sat, 18 Mar 2023 20:08:20 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdbud-005wZK-6T; Sat, 18 Mar 2023 20:08:19 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 11/19] drm/bridge: lvds-codec: Convert to platform remove
 callback returning void
Date: Sat, 18 Mar 2023 20:07:56 +0100
Message-Id: <20230318190804.234610-12-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318190804.234610-1-u.kleine-koenig@pengutronix.de>
References: <20230318190804.234610-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1685;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=SVLCg0j2jmMWLC7kq7k43Us2gCMuVufSOkCBmvnFhz8=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFgwGR2kueJa/f70mXolx6bCGuq9odV8IvYTEv
 5uW/2aDde6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBYMBgAKCRCPgPtYfRL+
 TkeLB/sF8mjAl7ENEER8XPlHpMSBroOmMsN9MQdptHLhJx1y3RFRMKNNfP4ogwFfIEgUQif/lb/
 lTef7ADYlyFmrWhwDA0C0VzipQgiGTHjPr2F6QDGXXQuZ/1upYreWaZjDVcgw05hZeHcCBXfx1n
 eUyyWReEk3oPjlpGSpsJbyMPVrcRFQy33eJD8XfHkPhNJSeT8CY41KINBWW+vs7TK2BzK7+Oueu
 1ed+NKopLtXbKCpv9iJtXT9P4eozPF2zX8C4/rkPqbgLjsAzYrmBGzzETIfuJ08HheM4B87fm+B
 gwYx2tgwn71O24XUsedOHRO1pEtd3p2UieeLryrc5S5vI+CN
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
 drivers/gpu/drm/bridge/lvds-codec.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
index 39e7004de720..67368f23d4aa 100644
--- a/drivers/gpu/drm/bridge/lvds-codec.c
+++ b/drivers/gpu/drm/bridge/lvds-codec.c
@@ -215,13 +215,11 @@ static int lvds_codec_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int lvds_codec_remove(struct platform_device *pdev)
+static void lvds_codec_remove(struct platform_device *pdev)
 {
 	struct lvds_codec *lvds_codec = platform_get_drvdata(pdev);
 
 	drm_bridge_remove(&lvds_codec->bridge);
-
-	return 0;
 }
 
 static const struct of_device_id lvds_codec_match[] = {
@@ -243,7 +241,7 @@ MODULE_DEVICE_TABLE(of, lvds_codec_match);
 
 static struct platform_driver lvds_codec_driver = {
 	.probe	= lvds_codec_probe,
-	.remove	= lvds_codec_remove,
+	.remove_new = lvds_codec_remove,
 	.driver		= {
 		.name		= "lvds-codec",
 		.of_match_table	= lvds_codec_match,
-- 
2.39.2

