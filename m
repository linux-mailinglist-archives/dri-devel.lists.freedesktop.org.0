Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2056F99F7
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 18:28:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B180E10E2BB;
	Sun,  7 May 2023 16:27:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D5610E208
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 16:26:46 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDT-0001iS-KY; Sun, 07 May 2023 18:26:31 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDR-001nC9-Gv; Sun, 07 May 2023 18:26:29 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDQ-002AgW-IW; Sun, 07 May 2023 18:26:28 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Minghao Chi <chi.minghao@zte.com.cn>, Mark Brown <broonie@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 14/53] drm/bridge: synopsys: Convert to platform remove
 callback returning void
Date: Sun,  7 May 2023 18:25:37 +0200
Message-Id: <20230507162616.1368908-15-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4543;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=RmALSi7arc8L/LkIjMqDVXDgMpkLumx6TXSe9TsFeJU=;
 b=owGbwMvMwMXY3/A7olbonx/jabUkhpTwC58/hpS9v9M9bZegTfHSJ2naO28tSFPhbzU5Gc4vm
 xSVKTe/k9GYhYGRi0FWTJHFvnFNplWVXGTn2n+XYQaxMoFMYeDiFICJTK9m/5/4unXF3h5RizlX
 qkv3hav8mKntZrAuuClAI0T3+zzP9g2/rP+etvd16CjymHV66/lvfBwH446EfvyrbBpj1/dMori
 kqVyWi9FZoa/aL0IhpeZcXkfIQvd6R+fciQ1ebNvCjgjUveQS3RmzLDDux2W+6iIBkVV5jyeJZn
 WwVWYLxTbVTxKw+fF/2e0/hmV52V37XBmfMVf8XrqjMsI37oHE5ut3tt56wLLEZMq9Zc53vtS8y
 2VZvztb7n/BuTeyKXKvf6YYtPxeni+rU372Y+RDtRU+8RNf/DoyZ+F9/4+hqUJKnfLiV/lPPrkZ
 aBM4I0IsyfivdsC/OxwRM2PmJU/aUJbXqpinNldq5/J1AA==
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

Trivially convert the synopsis bridge drivers from always returning zero
in the remove callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c | 6 ++----
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c       | 6 ++----
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c  | 6 ++----
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c | 6 ++----
 4 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
index 4efb62bcdb63..67b8d17a722a 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
@@ -584,13 +584,11 @@ static int snd_dw_hdmi_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int snd_dw_hdmi_remove(struct platform_device *pdev)
+static void snd_dw_hdmi_remove(struct platform_device *pdev)
 {
 	struct snd_dw_hdmi *dw = platform_get_drvdata(pdev);
 
 	snd_card_free(dw->card);
-
-	return 0;
 }
 
 #if defined(CONFIG_PM_SLEEP) && defined(IS_NOT_BROKEN)
@@ -625,7 +623,7 @@ static SIMPLE_DEV_PM_OPS(snd_dw_hdmi_pm, snd_dw_hdmi_suspend,
 
 static struct platform_driver snd_dw_hdmi_driver = {
 	.probe	= snd_dw_hdmi_probe,
-	.remove	= snd_dw_hdmi_remove,
+	.remove_new = snd_dw_hdmi_remove,
 	.driver	= {
 		.name = DRIVER_NAME,
 		.pm = PM_OPS,
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
index c8f44bcb298a..9389ce526eb1 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
@@ -296,19 +296,17 @@ static int dw_hdmi_cec_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int dw_hdmi_cec_remove(struct platform_device *pdev)
+static void dw_hdmi_cec_remove(struct platform_device *pdev)
 {
 	struct dw_hdmi_cec *cec = platform_get_drvdata(pdev);
 
 	cec_notifier_cec_adap_unregister(cec->notify, cec->adap);
 	cec_unregister_adapter(cec->adap);
-
-	return 0;
 }
 
 static struct platform_driver dw_hdmi_cec_driver = {
 	.probe	= dw_hdmi_cec_probe,
-	.remove	= dw_hdmi_cec_remove,
+	.remove_new = dw_hdmi_cec_remove,
 	.driver = {
 		.name = "dw-hdmi-cec",
 	},
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
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
index d751820c6da6..26c187d20d97 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
@@ -216,18 +216,16 @@ static int snd_dw_hdmi_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int snd_dw_hdmi_remove(struct platform_device *pdev)
+static void snd_dw_hdmi_remove(struct platform_device *pdev)
 {
 	struct platform_device *platform = dev_get_drvdata(&pdev->dev);
 
 	platform_device_unregister(platform);
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

