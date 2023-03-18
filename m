Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F736BFC4E
	for <lists+dri-devel@lfdr.de>; Sat, 18 Mar 2023 20:09:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5020D10E4A6;
	Sat, 18 Mar 2023 19:08:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D4710E12A
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 19:08:34 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdbug-0001pu-Er; Sat, 18 Mar 2023 20:08:22 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdbuf-0054Eh-On; Sat, 18 Mar 2023 20:08:21 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdbuf-005wZj-1H; Sat, 18 Mar 2023 20:08:21 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sandor Yu <Sandor.yu@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 kernel test robot <lkp@intel.com>
Subject: [PATCH 16/19] drm/bridge: dw-hdmi-gp-audio: Convert to platform
 remove callback returning void
Date: Sat, 18 Mar 2023 20:08:01 +0100
Message-Id: <20230318190804.234610-17-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318190804.234610-1-u.kleine-koenig@pengutronix.de>
References: <20230318190804.234610-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1632;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=CK4312iQmxUjk5KoELpHfCBaBm8/7p+d9lIH6x1T4PM=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFgwMRqnCKsbPTsBqZP6FKcY1gzTtQrdOzw919
 yOaNWvPwB6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBYMDAAKCRCPgPtYfRL+
 TiEGCACdSYaWtCcBv4p2FWIQw3vD+llgKzg7y+MdnyoG2/4RDwWqrq6FyfQGNZcLtq0fPSQRxJ4
 9DAd8gdx8Qznz3R2BI1KuqJL3QSUuLfBiv9Wt8XC2JYvYOkk8VUHHwXglVXe5f3swvkDrZ85NQp
 zSCu+pPpM3os+ETvDMqVf4f/qDhkKxRhSy27R+qqjq7mhS/VVC8HA0Vm8o23Su4rV1rwzSxyVnr
 k6yVE61qZ5FNpZTBBQ3uWiyphyDA9SvEOu3Co1ge1c7uFcwp7NcPwnnEW/RRbtOKkE3nAP025fN
 6XuR6i9pcJhkKY/TKZkDrrWpYEHv6Cjyx0qXnyb4V/xALgPN
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
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c
index 557966239677..423762da2ab4 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c
@@ -172,18 +172,16 @@ static int snd_dw_hdmi_probe(struct platform_device *pdev)
 	return PTR_ERR_OR_ZERO(dw->audio_pdev);
 }
 
-static int snd_dw_hdmi_remove(struct platform_device *pdev)
+static void snd_dw_hdmi_remove(struct platform_device *pdev)
 {
 	struct snd_dw_hdmi *dw = platform_get_drvdata(pdev);
 
 	platform_device_unregister(dw->audio_pdev);
-
-	return 0;
 }
 
 static struct platform_driver snd_dw_hdmi_driver = {
 	.probe	= snd_dw_hdmi_probe,
-	.remove	= snd_dw_hdmi_remove,
+	.remove_new = snd_dw_hdmi_remove,
 	.driver	= {
 		.name = DRIVER_NAME,
 	},
-- 
2.39.2

