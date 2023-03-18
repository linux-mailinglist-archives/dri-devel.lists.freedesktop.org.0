Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EABB86BFC44
	for <lists+dri-devel@lfdr.de>; Sat, 18 Mar 2023 20:08:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16CB610E464;
	Sat, 18 Mar 2023 19:08:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0333710E12A
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 19:08:36 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdbuf-0001ns-UU; Sat, 18 Mar 2023 20:08:21 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdbud-0054Dn-2g; Sat, 18 Mar 2023 20:08:19 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdbub-005wYp-EM; Sat, 18 Mar 2023 20:08:17 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Rahul T R <r-ravikumar@ti.com>, Jayshri Pawar <jpawar@cadence.com>
Subject: [PATCH 02/19] drm/bridge: cdns-dsi: Convert to platform remove
 callback returning void
Date: Sat, 18 Mar 2023 20:07:47 +0100
Message-Id: <20230318190804.234610-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318190804.234610-1-u.kleine-koenig@pengutronix.de>
References: <20230318190804.234610-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1871;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=eNvxOjdfxQPRMVFZafFcSaTeGH5Q8TB8svrRybsNEVk=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFgv85momXKEF45kL/UWTqVLIP0CXMtkbXttDJ
 yeFvqGHvWOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBYL/AAKCRCPgPtYfRL+
 TvDaB/918yKjxAhLAOvvzZLzT3svqOvwIuBz0/vdyxkGWsDiDChYyHUWsk47lUcxirUy39SP+yz
 cI+icjiVN7hDlR96DB1jiyC2UGs5MvUJZSVRh8xP7LllbcTeafCq9cn15z4Is/1U39lwCKbUhsF
 wQFtcwgeCzeQVaoqEOJEB2WIX+hm2mfa/o4nXU/3Up8P8+XsTvLtC3mBekRC3RODpMzNIHwe8e/
 Ou2hTMC7AXXHPA1MIYy149l1DC76YvoiyfoLRuk/8jzelsYB9f6AJRePWizu+0JHkCtvXMnddpu
 XGDQ0xv2+1IasLqbNvf4ccP4wGwhE7odeoVtKIo4VN7qDIq6
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
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index 5dbfc7226b31..f50d65f54314 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -1278,7 +1278,7 @@ static int cdns_dsi_drm_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int cdns_dsi_drm_remove(struct platform_device *pdev)
+static void cdns_dsi_drm_remove(struct platform_device *pdev)
 {
 	struct cdns_dsi *dsi = platform_get_drvdata(pdev);
 
@@ -1288,8 +1288,6 @@ static int cdns_dsi_drm_remove(struct platform_device *pdev)
 		dsi->platform_ops->deinit(dsi);
 
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static const struct of_device_id cdns_dsi_of_match[] = {
@@ -1303,7 +1301,7 @@ MODULE_DEVICE_TABLE(of, cdns_dsi_of_match);
 
 static struct platform_driver cdns_dsi_platform_driver = {
 	.probe  = cdns_dsi_drm_probe,
-	.remove = cdns_dsi_drm_remove,
+	.remove_new = cdns_dsi_drm_remove,
 	.driver = {
 		.name   = "cdns-dsi",
 		.of_match_table = cdns_dsi_of_match,
-- 
2.39.2

