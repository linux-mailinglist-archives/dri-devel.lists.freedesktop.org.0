Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3FD751B75
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 10:25:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F35EA10E62A;
	Thu, 13 Jul 2023 08:25:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F40A882AF
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 08:25:04 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrcc-0005qM-R1; Thu, 13 Jul 2023 10:24:22 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrca-00E4j9-SO; Thu, 13 Jul 2023 10:24:20 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrca-004Vgo-2c; Thu, 13 Jul 2023 10:24:20 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Julia Lawall <julia.lawall@inria.fr>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sui Jingfeng <suijingfeng@loongson.cn>,
 Luben Tuikov <luben.tuikov@amd.com>, Jani Nikula <jani.nikula@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Sean Paul <seanpaul@chromium.org>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 02/17] drm/bridge: Rename struct drm_bridge::dev to drm
Date: Thu, 13 Jul 2023 10:23:53 +0200
Message-Id: <20230713082408.2266984-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
References: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=31782;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=OLbP+/dafnwf7T/HvWfsTcUifbKiVQWgJbT8z8cwjS0=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkr7SDo/2b8wxYPmz5GWLYqbT2QJ+Lv1+e0NZfQ
 GFeBIgCenSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK+0gwAKCRCPgPtYfRL+
 TgOyB/4jhUIjQt/reZlb3UtyQXF/4hX/WR+OkShsR33I0s6VrleIPjV5q/zFZ5Rq3x++G2onODO
 88nueEI2nHUKek+Ox2HMD18EDkR6CFEWJdYzI2Xb7XL02yHmoGD0/LOhEhikL3HGskvVqqyJg+o
 2MzV/GVjrLlsZDwB3vjZOPCAV9vULGxOtAQYUgOOpWTWunwrnrOaQOiYKyCDu9jbKQkW0V1XjmS
 9d5mq8gSlgqB4HhrKAhM5u/TH3Z2ySO6P5xBbLc32aqJIKc2E6ow49BIIVJmxwAjGsyuMupNC+R
 O6hqhVgZ1oYuCwmKDakHvABtricbYBd6RJ3h9AwqCqU6jJg9
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

"dev" is usually used for struct device pointers. Using it for struct
drm_device pointers is irritating (for me at least). Replace it
by "drm" and adapt all users.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |  2 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c |  4 ++--
 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c |  4 ++--
 drivers/gpu/drm/bridge/analogix/anx7625.c          |  6 +++---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c     |  2 +-
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    | 14 +++++++-------
 drivers/gpu/drm/bridge/chrontel-ch7033.c           |  4 ++--
 drivers/gpu/drm/bridge/ite-it6505.c                |  8 ++++----
 drivers/gpu/drm/bridge/lontium-lt8912b.c           |  6 +++---
 drivers/gpu/drm/bridge/lontium-lt9611.c            |  4 ++--
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |  2 +-
 .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   |  6 +++---
 drivers/gpu/drm/bridge/nxp-ptn3460.c               |  5 +++--
 drivers/gpu/drm/bridge/panel.c                     |  4 ++--
 drivers/gpu/drm/bridge/parade-ps8640.c             |  5 +++--
 drivers/gpu/drm/bridge/sii902x.c                   |  6 +++---
 drivers/gpu/drm/bridge/simple-bridge.c             |  2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |  6 +++---
 drivers/gpu/drm/bridge/tc358767.c                  |  6 +++---
 drivers/gpu/drm/bridge/tc358768.c                  |  2 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |  7 ++++---
 drivers/gpu/drm/bridge/ti-tfp410.c                 |  6 +++---
 drivers/gpu/drm/drm_bridge.c                       | 14 +++++++-------
 drivers/gpu/drm/i2c/tda998x_drv.c                  |  2 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |  4 ++--
 drivers/gpu/drm/mcde/mcde_dsi.c                    |  2 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                  |  8 ++++----
 drivers/gpu/drm/meson/meson_dw_hdmi.c              |  2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |  6 +++---
 drivers/gpu/drm/xlnx/zynqmp_dp.c                   |  2 +-
 include/drm/drm_bridge.h                           |  4 ++--
 31 files changed, 79 insertions(+), 76 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 2254457ab5d0..52da4df1cc52 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -864,7 +864,7 @@ static int adv7511_connector_init(struct adv7511 *adv)
 		adv->connector.polled = DRM_CONNECTOR_POLL_CONNECT |
 				DRM_CONNECTOR_POLL_DISCONNECT;
 
-	ret = drm_connector_init(bridge->dev, &adv->connector,
+	ret = drm_connector_init(bridge->drm, &adv->connector,
 				 &adv7511_connector_funcs,
 				 DRM_MODE_CONNECTOR_HDMIA);
 	if (ret < 0) {
diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
index 72ab2ab77081..abb37a523499 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
@@ -536,7 +536,7 @@ static int anx6345_bridge_attach(struct drm_bridge *bridge,
 	/* Register aux channel */
 	anx6345->aux.name = "DP-AUX";
 	anx6345->aux.dev = &anx6345->client->dev;
-	anx6345->aux.drm_dev = bridge->dev;
+	anx6345->aux.drm_dev = bridge->drm;
 	anx6345->aux.transfer = anx6345_aux_transfer;
 
 	err = drm_dp_aux_register(&anx6345->aux);
@@ -545,7 +545,7 @@ static int anx6345_bridge_attach(struct drm_bridge *bridge,
 		return err;
 	}
 
-	err = drm_connector_init(bridge->dev, &anx6345->connector,
+	err = drm_connector_init(bridge->drm, &anx6345->connector,
 				 &anx6345_connector_funcs,
 				 DRM_MODE_CONNECTOR_eDP);
 	if (err) {
diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
index 06a3e3243e19..0b66b72a5913 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
@@ -905,7 +905,7 @@ static int anx78xx_bridge_attach(struct drm_bridge *bridge,
 	/* Register aux channel */
 	anx78xx->aux.name = "DP-AUX";
 	anx78xx->aux.dev = &anx78xx->client->dev;
-	anx78xx->aux.drm_dev = bridge->dev;
+	anx78xx->aux.drm_dev = bridge->drm;
 	anx78xx->aux.transfer = anx78xx_aux_transfer;
 
 	err = drm_dp_aux_register(&anx78xx->aux);
@@ -914,7 +914,7 @@ static int anx78xx_bridge_attach(struct drm_bridge *bridge,
 		return err;
 	}
 
-	err = drm_connector_init(bridge->dev, &anx78xx->connector,
+	err = drm_connector_init(bridge->drm, &anx78xx->connector,
 				 &anx78xx_connector_funcs,
 				 DRM_MODE_CONNECTOR_DisplayPort);
 	if (err) {
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 8b985efdc086..9156c74a7b3b 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1483,7 +1483,7 @@ static int _anx7625_hpd_polling(struct anx7625_data *ctx,
 	anx7625_start_dp_work(ctx);
 
 	if (!ctx->pdata.panel_bridge && ctx->bridge_attached)
-		drm_helper_hpd_irq_event(ctx->bridge.dev);
+		drm_helper_hpd_irq_event(ctx->bridge.drm);
 
 	return 0;
 }
@@ -1601,7 +1601,7 @@ static void anx7625_work_func(struct work_struct *work)
 		goto unlock;
 
 	if (ctx->bridge_attached)
-		drm_helper_hpd_irq_event(ctx->bridge.dev);
+		drm_helper_hpd_irq_event(ctx->bridge.drm);
 
 unlock:
 	mutex_unlock(&ctx->lock);
@@ -2185,7 +2185,7 @@ static int anx7625_bridge_attach(struct drm_bridge *bridge,
 		return -ENODEV;
 	}
 
-	ctx->aux.drm_dev = bridge->dev;
+	ctx->aux.drm_dev = bridge->drm;
 	err = drm_dp_aux_register(&ctx->aux);
 	if (err) {
 		dev_err(dev, "failed to register aux channel: %d\n", err);
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index f50d65f54314..6314047d47b1 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -612,7 +612,7 @@ static int cdns_dsi_bridge_attach(struct drm_bridge *bridge,
 	struct cdns_dsi *dsi = input_to_dsi(input);
 	struct cdns_dsi_output *output = &dsi->output;
 
-	if (!drm_core_check_feature(bridge->dev, DRIVER_ATOMIC)) {
+	if (!drm_core_check_feature(bridge->drm, DRIVER_ATOMIC)) {
 		dev_err(dsi->base.dev,
 			"cdns-dsi driver is only compatible with DRM devices supporting atomic updates");
 		return -ENOTSUPP;
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index ecb935e46b62..d102db6d4c65 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -812,7 +812,7 @@ static void cdns_mhdp_fw_cb(const struct firmware *fw, void *context)
 	spin_unlock(&mhdp->start_lock);
 	if (bridge_attached) {
 		if (mhdp->connector.dev)
-			drm_kms_helper_hotplug_event(mhdp->bridge.dev);
+			drm_kms_helper_hotplug_event(mhdp->bridge.drm);
 		else
 			drm_bridge_hpd_notify(&mhdp->bridge, cdns_mhdp_detect(mhdp));
 	}
@@ -1703,7 +1703,7 @@ static int cdns_mhdp_connector_init(struct cdns_mhdp_device *mhdp)
 
 	conn->polled = DRM_CONNECTOR_POLL_HPD;
 
-	ret = drm_connector_init(bridge->dev, conn, &cdns_mhdp_conn_funcs,
+	ret = drm_connector_init(bridge->drm, conn, &cdns_mhdp_conn_funcs,
 				 DRM_MODE_CONNECTOR_DisplayPort);
 	if (ret) {
 		dev_err(mhdp->dev, "Failed to initialize connector with drm\n");
@@ -1738,7 +1738,7 @@ static int cdns_mhdp_attach(struct drm_bridge *bridge,
 
 	dev_dbg(mhdp->dev, "%s\n", __func__);
 
-	mhdp->aux.drm_dev = bridge->dev;
+	mhdp->aux.drm_dev = bridge->drm;
 	ret = drm_dp_aux_register(&mhdp->aux);
 	if (ret < 0)
 		return ret;
@@ -2057,7 +2057,7 @@ static void cdns_mhdp_atomic_enable(struct drm_bridge *bridge,
 
 	mhdp_state = to_cdns_mhdp_bridge_state(new_state);
 
-	mhdp_state->current_mode = drm_mode_duplicate(bridge->dev, mode);
+	mhdp_state->current_mode = drm_mode_duplicate(bridge->drm, mode);
 	drm_mode_set_name(mhdp_state->current_mode);
 
 	dev_dbg(mhdp->dev, "%s: Enabling mode %s\n", __func__, mode->name);
@@ -2142,7 +2142,7 @@ cdns_mhdp_bridge_atomic_destroy_state(struct drm_bridge *bridge,
 	cdns_mhdp_state = to_cdns_mhdp_bridge_state(state);
 
 	if (cdns_mhdp_state->current_mode) {
-		drm_mode_destroy(bridge->dev, cdns_mhdp_state->current_mode);
+		drm_mode_destroy(bridge->drm, cdns_mhdp_state->current_mode);
 		cdns_mhdp_state->current_mode = NULL;
 	}
 
@@ -2377,7 +2377,7 @@ static void cdns_mhdp_modeset_retry_fn(struct work_struct *work)
 	mutex_unlock(&conn->dev->mode_config.mutex);
 
 	/* Send Hotplug uevent so userspace can reprobe */
-	drm_kms_helper_hotplug_event(mhdp->bridge.dev);
+	drm_kms_helper_hotplug_event(mhdp->bridge.drm);
 }
 
 static irqreturn_t cdns_mhdp_irq_handler(int irq, void *data)
@@ -2445,7 +2445,7 @@ static void cdns_mhdp_hpd_work(struct work_struct *work)
 		if (ret < 0)
 			schedule_work(&mhdp->modeset_retry_work);
 		else
-			drm_kms_helper_hotplug_event(mhdp->bridge.dev);
+			drm_kms_helper_hotplug_event(mhdp->bridge.drm);
 	} else {
 		drm_bridge_hpd_notify(&mhdp->bridge, cdns_mhdp_detect(mhdp));
 	}
diff --git a/drivers/gpu/drm/bridge/chrontel-ch7033.c b/drivers/gpu/drm/bridge/chrontel-ch7033.c
index a854eb84e399..9c12e1652e4a 100644
--- a/drivers/gpu/drm/bridge/chrontel-ch7033.c
+++ b/drivers/gpu/drm/bridge/chrontel-ch7033.c
@@ -263,7 +263,7 @@ static void ch7033_hpd_event(void *arg, enum drm_connector_status status)
 {
 	struct ch7033_priv *priv = arg;
 
-	if (priv->bridge.dev)
+	if (priv->bridge.drm)
 		drm_helper_hpd_irq_event(priv->connector.dev);
 }
 
@@ -296,7 +296,7 @@ static int ch7033_bridge_attach(struct drm_bridge *bridge,
 
 	drm_connector_helper_add(connector,
 				 &ch7033_connector_helper_funcs);
-	ret = drm_connector_init_with_ddc(bridge->dev, &priv->connector,
+	ret = drm_connector_init_with_ddc(bridge->drm, &priv->connector,
 					  &ch7033_connector_funcs,
 					  priv->next_bridge->type,
 					  priv->next_bridge->ddc);
diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 504d51c42f79..e2340000ba11 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -2387,8 +2387,8 @@ static void it6505_irq_hpd(struct it6505 *it6505)
 		it6505_link_reset_step_train(it6505);
 	}
 
-	if (it6505->bridge.dev)
-		drm_helper_hpd_irq_event(it6505->bridge.dev);
+	if (it6505->bridge.drm)
+		drm_helper_hpd_irq_event(it6505->bridge.drm);
 }
 
 static void it6505_irq_hpd_irq(struct it6505 *it6505)
@@ -2727,7 +2727,7 @@ static void it6505_extcon_work(struct work_struct *work)
 		pm_runtime_put_sync(dev);
 		reinit_completion(&it6505->extcon_completion);
 
-		drm_helper_hpd_irq_event(it6505->bridge.dev);
+		drm_helper_hpd_irq_event(it6505->bridge.drm);
 		memset(it6505->dpcd, 0, sizeof(it6505->dpcd));
 		DRM_DEV_DEBUG_DRIVER(dev, "power off it6505 success!");
 	}
@@ -2883,7 +2883,7 @@ static int it6505_bridge_attach(struct drm_bridge *bridge,
 	}
 
 	/* Register aux channel */
-	it6505->aux.drm_dev = bridge->dev;
+	it6505->aux.drm_dev = bridge->drm;
 
 	ret = drm_dp_aux_register(&it6505->aux);
 
diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index 4eaea67fb71c..d275d2cb6a86 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -520,8 +520,8 @@ static void lt8912_bridge_hpd_cb(void *data, enum drm_connector_status status)
 {
 	struct lt8912 *lt = data;
 
-	if (lt->bridge.dev)
-		drm_helper_hpd_irq_event(lt->bridge.dev);
+	if (lt->bridge.drm)
+		drm_helper_hpd_irq_event(lt->bridge.drm);
 }
 
 static int lt8912_bridge_connector_init(struct drm_bridge *bridge)
@@ -538,7 +538,7 @@ static int lt8912_bridge_connector_init(struct drm_bridge *bridge)
 				    DRM_CONNECTOR_POLL_DISCONNECT;
 	}
 
-	ret = drm_connector_init(bridge->dev, connector,
+	ret = drm_connector_init(bridge->drm, connector,
 				 &lt8912_connector_funcs,
 				 lt->hdmi_port->type);
 	if (ret)
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 5163e5224aad..89b91faf4c83 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -435,8 +435,8 @@ static irqreturn_t lt9611_irq_thread_handler(int irq, void *dev_id)
 		regmap_write(lt9611->regmap, 0x8207, 0x3f);
 	}
 
-	if (irq_flag3 & 0xc0 && lt9611->bridge.dev)
-		drm_kms_helper_hotplug_event(lt9611->bridge.dev);
+	if (irq_flag3 & 0xc0 && lt9611->bridge.drm)
+		drm_kms_helper_hotplug_event(lt9611->bridge.drm);
 
 	/* video input changed */
 	if (irq_flag0 & 0x01) {
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 22c84d29c2bc..9189d2c3cdc8 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -347,7 +347,7 @@ static int lt9611uxc_connector_init(struct drm_bridge *bridge, struct lt9611uxc
 
 	drm_connector_helper_add(&lt9611uxc->connector,
 				 &lt9611uxc_bridge_connector_helper_funcs);
-	ret = drm_connector_init(bridge->dev, &lt9611uxc->connector,
+	ret = drm_connector_init(bridge->drm, &lt9611uxc->connector,
 				 &lt9611uxc_bridge_connector_funcs,
 				 DRM_MODE_CONNECTOR_HDMIA);
 	if (ret) {
diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
index 460db3c8a08c..5c6edf47c1e0 100644
--- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
+++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
@@ -214,7 +214,7 @@ static int ge_b850v3_lvds_create_connector(struct drm_bridge *bridge)
 	drm_connector_helper_add(connector,
 				 &ge_b850v3_lvds_connector_helper_funcs);
 
-	ret = drm_connector_init(bridge->dev, connector,
+	ret = drm_connector_init(bridge->drm, connector,
 				 &ge_b850v3_lvds_connector_funcs,
 				 DRM_MODE_CONNECTOR_DisplayPort);
 	if (ret) {
@@ -234,8 +234,8 @@ static irqreturn_t ge_b850v3_lvds_irq_handler(int irq, void *dev_id)
 				  STDP4028_DPTX_IRQ_STS_REG,
 				  STDP4028_DPTX_IRQ_CLEAR);
 
-	if (ge_b850v3_lvds_ptr->bridge.dev)
-		drm_kms_helper_hotplug_event(ge_b850v3_lvds_ptr->bridge.dev);
+	if (ge_b850v3_lvds_ptr->bridge.drm)
+		drm_kms_helper_hotplug_event(ge_b850v3_lvds_ptr->bridge.drm);
 
 	return IRQ_HANDLED;
 }
diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/bridge/nxp-ptn3460.c
index d81920227a8a..27b01a2c216e 100644
--- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
+++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
@@ -233,8 +233,9 @@ static int ptn3460_bridge_attach(struct drm_bridge *bridge,
 	}
 
 	ptn_bridge->connector.polled = DRM_CONNECTOR_POLL_HPD;
-	ret = drm_connector_init(bridge->dev, &ptn_bridge->connector,
-			&ptn3460_connector_funcs, DRM_MODE_CONNECTOR_LVDS);
+	ret = drm_connector_init(bridge->drm, &ptn_bridge->connector,
+				 &ptn3460_connector_funcs,
+				 DRM_MODE_CONNECTOR_LVDS);
 	if (ret) {
 		DRM_ERROR("Failed to initialize connector with drm\n");
 		return ret;
diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 9316384b4474..d5ce29a74910 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -73,7 +73,7 @@ static int panel_bridge_attach(struct drm_bridge *bridge,
 	drm_connector_helper_add(connector,
 				 &panel_bridge_connector_helper_funcs);
 
-	ret = drm_connector_init(bridge->dev, connector,
+	ret = drm_connector_init(bridge->drm, connector,
 				 &panel_bridge_connector_funcs,
 				 panel_bridge->connector_type);
 	if (ret) {
@@ -86,7 +86,7 @@ static int panel_bridge_attach(struct drm_bridge *bridge,
 	drm_connector_attach_encoder(&panel_bridge->connector,
 					  bridge->encoder);
 
-	if (bridge->dev->registered) {
+	if (bridge->drm->registered) {
 		if (connector->funcs->reset)
 			connector->funcs->reset(connector);
 		drm_connector_register(connector);
diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 8161b1a1a4b1..804fe0c6d276 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -482,14 +482,15 @@ static int ps8640_bridge_attach(struct drm_bridge *bridge,
 	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
 		return -EINVAL;
 
-	ps_bridge->aux.drm_dev = bridge->dev;
+	ps_bridge->aux.drm_dev = bridge->drm;
 	ret = drm_dp_aux_register(&ps_bridge->aux);
 	if (ret) {
 		dev_err(dev, "failed to register DP AUX channel: %d\n", ret);
 		return ret;
 	}
 
-	ps_bridge->link = device_link_add(bridge->dev->dev, dev, DL_FLAG_STATELESS);
+	ps_bridge->link = device_link_add(bridge->drm->dev, dev,
+					  DL_FLAG_STATELESS);
 	if (!ps_bridge->link) {
 		dev_err(dev, "failed to create device link");
 		ret = -EINVAL;
diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index 2bdc5b439beb..1370a09c0efe 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -421,7 +421,7 @@ static int sii902x_bridge_attach(struct drm_bridge *bridge,
 {
 	struct sii902x *sii902x = bridge_to_sii902x(bridge);
 	u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
-	struct drm_device *drm = bridge->dev;
+	struct drm_device *drm = bridge->drm;
 	int ret;
 
 	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
@@ -907,8 +907,8 @@ static irqreturn_t sii902x_interrupt(int irq, void *data)
 
 	mutex_unlock(&sii902x->mutex);
 
-	if ((status & SII902X_HOTPLUG_EVENT) && sii902x->bridge.dev) {
-		drm_helper_hpd_irq_event(sii902x->bridge.dev);
+	if ((status & SII902X_HOTPLUG_EVENT) && sii902x->bridge.drm) {
+		drm_helper_hpd_irq_event(sii902x->bridge.drm);
 		drm_bridge_hpd_notify(&sii902x->bridge, (status & SII902X_PLUGGED_STATUS)
 								? connector_status_connected
 								: connector_status_disconnected);
diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index d85d9ee463b8..3b94fa14de4b 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -121,7 +121,7 @@ static int simple_bridge_attach(struct drm_bridge *bridge,
 
 	drm_connector_helper_add(&sbridge->connector,
 				 &simple_bridge_con_helper_funcs);
-	ret = drm_connector_init_with_ddc(bridge->dev, &sbridge->connector,
+	ret = drm_connector_init_with_ddc(bridge->drm, &sbridge->connector,
 					  &simple_bridge_con_funcs,
 					  sbridge->info->connector_type,
 					  sbridge->next_bridge->ddc);
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 22d43136cbe7..10d414c750a7 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2584,7 +2584,7 @@ static int dw_hdmi_connector_create(struct dw_hdmi *hdmi)
 
 	drm_connector_helper_add(connector, &dw_hdmi_connector_helper_funcs);
 
-	drm_connector_init_with_ddc(hdmi->bridge.dev, connector,
+	drm_connector_init_with_ddc(hdmi->bridge.drm, connector,
 				    &dw_hdmi_connector_funcs,
 				    DRM_MODE_CONNECTOR_HDMIA,
 				    hdmi->ddc);
@@ -3135,8 +3135,8 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
 			status == connector_status_connected ?
 			"plugin" : "plugout");
 
-		if (hdmi->bridge.dev) {
-			drm_helper_hpd_irq_event(hdmi->bridge.dev);
+		if (hdmi->bridge.drm) {
+			drm_helper_hpd_irq_event(hdmi->bridge.drm);
 			drm_bridge_hpd_notify(&hdmi->bridge, status);
 		}
 	}
diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index eaa7edb080fa..8e6cba732d3e 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1672,7 +1672,7 @@ static int tc_edp_bridge_attach(struct drm_bridge *bridge,
 {
 	u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
 	struct tc_data *tc = bridge_to_tc(bridge);
-	struct drm_device *drm = bridge->dev;
+	struct drm_device *drm = bridge->drm;
 	int ret;
 
 	if (tc->panel_bridge) {
@@ -2034,7 +2034,7 @@ static irqreturn_t tc_irq_handler(int irq, void *arg)
 		dev_err(tc->dev, "syserr %x\n", stat);
 	}
 
-	if (tc->hpd_pin >= 0 && tc->bridge.dev) {
+	if (tc->hpd_pin >= 0 && tc->bridge.drm) {
 		/*
 		 * H is triggered when the GPIO goes high.
 		 *
@@ -2048,7 +2048,7 @@ static irqreturn_t tc_irq_handler(int irq, void *arg)
 			h ? "H" : "", lc ? "LC" : "");
 
 		if (h || lc)
-			drm_kms_helper_hotplug_event(tc->bridge.dev);
+			drm_kms_helper_hotplug_event(tc->bridge.drm);
 	}
 
 	regmap_write(tc->regmap, INTSTS_G, val);
diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index 819a4b6ec2a0..cd99ea5ccddc 100644
--- a/drivers/gpu/drm/bridge/tc358768.c
+++ b/drivers/gpu/drm/bridge/tc358768.c
@@ -531,7 +531,7 @@ static int tc358768_bridge_attach(struct drm_bridge *bridge,
 {
 	struct tc358768_priv *priv = bridge_to_tc358768(bridge);
 
-	if (!drm_core_check_feature(bridge->dev, DRIVER_ATOMIC)) {
+	if (!drm_core_check_feature(bridge->drm, DRIVER_ATOMIC)) {
 		dev_err(priv->dev, "needs atomic updates support\n");
 		return -ENOTSUPP;
 	}
diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index c499a14d0b98..2e7e1adbc355 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -725,10 +725,11 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
 	int ret;
 
-	pdata->aux.drm_dev = bridge->dev;
+	pdata->aux.drm_dev = bridge->drm;
 	ret = drm_dp_aux_register(&pdata->aux);
 	if (ret < 0) {
-		drm_err(bridge->dev, "Failed to register DP AUX channel: %d\n", ret);
+		drm_err(bridge->drm,
+			"Failed to register DP AUX channel: %d\n", ret);
 		return ret;
 	}
 
@@ -744,7 +745,7 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
 		return 0;
 
-	pdata->connector = drm_bridge_connector_init(pdata->bridge.dev,
+	pdata->connector = drm_bridge_connector_init(pdata->bridge.drm,
 						     pdata->bridge.encoder);
 	if (IS_ERR(pdata->connector)) {
 		ret = PTR_ERR(pdata->connector);
diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index 22b07260a78e..3d8ecc6d78ef 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -107,8 +107,8 @@ static void tfp410_hpd_work_func(struct work_struct *work)
 
 	dvi = container_of(work, struct tfp410, hpd_work.work);
 
-	if (dvi->bridge.dev)
-		drm_helper_hpd_irq_event(dvi->bridge.dev);
+	if (dvi->bridge.drm)
+		drm_helper_hpd_irq_event(dvi->bridge.drm);
 }
 
 static void tfp410_hpd_callback(void *arg, enum drm_connector_status status)
@@ -151,7 +151,7 @@ static int tfp410_attach(struct drm_bridge *bridge,
 
 	drm_connector_helper_add(&dvi->connector,
 				 &tfp410_con_helper_funcs);
-	ret = drm_connector_init_with_ddc(bridge->dev, &dvi->connector,
+	ret = drm_connector_init_with_ddc(bridge->drm, &dvi->connector,
 					  &tfp410_con_funcs,
 					  dvi->next_bridge->type,
 					  dvi->next_bridge->ddc);
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index c3d69af02e79..cdc373f56ce6 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -305,13 +305,13 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 	if (!encoder || !bridge)
 		return -EINVAL;
 
-	if (previous && (!previous->dev || previous->encoder != encoder))
+	if (previous && (!previous->drm || previous->encoder != encoder))
 		return -EINVAL;
 
-	if (bridge->dev)
+	if (bridge->drm)
 		return -EBUSY;
 
-	bridge->dev = encoder->dev;
+	bridge->drm = encoder->dev;
 	bridge->encoder = encoder;
 
 	if (previous)
@@ -334,7 +334,7 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 			goto err_detach_bridge;
 		}
 
-		drm_atomic_private_obj_init(bridge->dev, &bridge->base,
+		drm_atomic_private_obj_init(bridge->drm, &bridge->base,
 					    &state->base,
 					    &drm_bridge_priv_state_funcs);
 	}
@@ -346,7 +346,7 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 		bridge->funcs->detach(bridge);
 
 err_reset_bridge:
-	bridge->dev = NULL;
+	bridge->drm = NULL;
 	bridge->encoder = NULL;
 	list_del(&bridge->chain_node);
 
@@ -367,7 +367,7 @@ void drm_bridge_detach(struct drm_bridge *bridge)
 	if (WARN_ON(!bridge))
 		return;
 
-	if (WARN_ON(!bridge->dev))
+	if (WARN_ON(!bridge->drm))
 		return;
 
 	if (bridge->funcs->atomic_reset)
@@ -377,7 +377,7 @@ void drm_bridge_detach(struct drm_bridge *bridge)
 		bridge->funcs->detach(bridge);
 
 	list_del(&bridge->chain_node);
-	bridge->dev = NULL;
+	bridge->drm = NULL;
 }
 
 /**
diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
index 40bcd9067e69..f01e28ed5831 100644
--- a/drivers/gpu/drm/i2c/tda998x_drv.c
+++ b/drivers/gpu/drm/i2c/tda998x_drv.c
@@ -1372,7 +1372,7 @@ static int tda998x_bridge_attach(struct drm_bridge *bridge,
 		return -EINVAL;
 	}
 
-	return tda998x_connector_init(priv, bridge->dev);
+	return tda998x_connector_init(priv, bridge->drm);
 }
 
 static void tda998x_bridge_detach(struct drm_bridge *bridge)
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 5ec75e9ba499..e74f946c7e4e 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -230,7 +230,7 @@ static int ingenic_drm_update_pixclk(struct notifier_block *nb,
 static void ingenic_drm_bridge_atomic_enable(struct drm_bridge *bridge,
 					     struct drm_bridge_state *old_bridge_state)
 {
-	struct ingenic_drm *priv = drm_device_get_priv(bridge->dev);
+	struct ingenic_drm *priv = drm_device_get_priv(bridge->drm);
 
 	regmap_write(priv->map, JZ_REG_LCD_STATE, 0);
 
@@ -261,7 +261,7 @@ static void ingenic_drm_crtc_atomic_enable(struct drm_crtc *crtc,
 static void ingenic_drm_bridge_atomic_disable(struct drm_bridge *bridge,
 					      struct drm_bridge_state *old_bridge_state)
 {
-	struct ingenic_drm *priv = drm_device_get_priv(bridge->dev);
+	struct ingenic_drm *priv = drm_device_get_priv(bridge->drm);
 	unsigned int var;
 
 	regmap_update_bits(priv->map, JZ_REG_LCD_CTRL,
diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
index db82b38600b2..7d75eda3a1e7 100644
--- a/drivers/gpu/drm/mcde/mcde_dsi.c
+++ b/drivers/gpu/drm/mcde/mcde_dsi.c
@@ -1051,7 +1051,7 @@ static int mcde_dsi_bridge_attach(struct drm_bridge *bridge,
 				  enum drm_bridge_attach_flags flags)
 {
 	struct mcde_dsi *d = bridge_to_mcde_dsi(bridge);
-	struct drm_device *drm = bridge->dev;
+	struct drm_device *drm = bridge->drm;
 
 	if (!drm_core_check_feature(drm, DRIVER_ATOMIC)) {
 		dev_err(d->dev, "we need atomic updates\n");
diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 64eee77452c0..35762532c29f 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1822,8 +1822,8 @@ static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
 	spin_unlock_irqrestore(&mtk_dp->irq_thread_lock, flags);
 
 	if (status & MTK_DP_THREAD_CABLE_STATE_CHG) {
-		if (mtk_dp->bridge.dev)
-			drm_helper_hpd_irq_event(mtk_dp->bridge.dev);
+		if (mtk_dp->bridge.drm)
+			drm_helper_hpd_irq_event(mtk_dp->bridge.drm);
 
 		if (!mtk_dp->train_info.cable_plugged_in) {
 			mtk_dp_disable_sdp_aui(mtk_dp);
@@ -2119,7 +2119,7 @@ static int mtk_dp_bridge_attach(struct drm_bridge *bridge,
 		return -EINVAL;
 	}
 
-	mtk_dp->aux.drm_dev = bridge->dev;
+	mtk_dp->aux.drm_dev = bridge->drm;
 	ret = drm_dp_aux_register(&mtk_dp->aux);
 	if (ret) {
 		dev_err(mtk_dp->dev,
@@ -2141,7 +2141,7 @@ static int mtk_dp_bridge_attach(struct drm_bridge *bridge,
 		}
 	}
 
-	mtk_dp->drm_dev = bridge->dev;
+	mtk_dp->drm_dev = bridge->drm;
 
 	mtk_dp_hwirq_enable(mtk_dp, true);
 
diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 18a0f4f4638c..6e2f393afc17 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -568,7 +568,7 @@ static irqreturn_t dw_hdmi_top_thread_irq(int irq, void *dev_id)
 		dw_hdmi_setup_rx_sense(dw_hdmi->hdmi, hpd_connected,
 				       hpd_connected);
 
-		drm_helper_hpd_irq_event(dw_hdmi->bridge->dev);
+		drm_helper_hpd_irq_event(dw_hdmi->bridge->drm);
 		drm_bridge_hpd_notify(dw_hdmi->bridge,
 				      hpd_connected ? connector_status_connected
 						    : connector_status_disconnected);
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 9b1391d27ed3..706d29f74c55 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -21,7 +21,7 @@ void msm_hdmi_bridge_destroy(struct drm_bridge *bridge)
 
 static void msm_hdmi_power_on(struct drm_bridge *bridge)
 {
-	struct drm_device *dev = bridge->dev;
+	struct drm_device *dev = bridge->drm;
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	const struct hdmi_platform_config *config = hdmi->config;
@@ -53,7 +53,7 @@ static void msm_hdmi_power_on(struct drm_bridge *bridge)
 
 static void power_off(struct drm_bridge *bridge)
 {
-	struct drm_device *dev = bridge->dev;
+	struct drm_device *dev = bridge->drm;
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	const struct hdmi_platform_config *config = hdmi->config;
@@ -271,7 +271,7 @@ static enum drm_mode_status msm_hdmi_bridge_mode_valid(struct drm_bridge *bridge
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	const struct hdmi_platform_config *config = hdmi->config;
-	struct msm_drm_private *priv = bridge->dev->dev_private;
+	struct msm_drm_private *priv = bridge->drm->dev_private;
 	struct msm_kms *kms = priv->kms;
 	long actual, requested;
 
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 0a7b466446fb..bd0f07ce9e62 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1056,7 +1056,7 @@ static int zynqmp_dp_aux_init(struct zynqmp_dp *dp)
 
 	dp->aux.name = "ZynqMP DP AUX";
 	dp->aux.dev = dp->dev;
-	dp->aux.drm_dev = dp->bridge.dev;
+	dp->aux.drm_dev = dp->bridge.drm;
 	dp->aux.transfer = zynqmp_dp_aux_transfer;
 
 	return drm_dp_aux_register(&dp->aux);
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index bf964cdfb330..fd4ddc04d7f9 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -709,8 +709,8 @@ enum drm_bridge_ops {
 struct drm_bridge {
 	/** @base: inherit from &drm_private_object */
 	struct drm_private_obj base;
-	/** @dev: DRM device this bridge belongs to */
-	struct drm_device *dev;
+	/** @drm: DRM device this bridge belongs to */
+	struct drm_device *drm;
 	/** @encoder: encoder to which this bridge is connected */
 	struct drm_encoder *encoder;
 	/** @chain_node: used to form a bridge chain */
-- 
2.39.2

