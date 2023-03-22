Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 512546C481D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 11:47:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56AE210E8EE;
	Wed, 22 Mar 2023 10:47:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B044B10E8EE
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 10:47:43 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 o6-20020a17090a9f8600b0023f32869993so19265916pjp.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 03:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1679482063;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+FF2ESmiiihfdUKZ1gHccbyU50W0AbxwPHMUw+YJ4po=;
 b=nfLgwSYCb6c8k79DrPtmV/SnDKXeLf/SKbimoDCIuB9DzO+ChXJZp0SJ7NLDZL6aes
 PCUUEnUHd8ePkTydG75UrPkpsXgNp9vW5OAGozkn4XjPWoyrEhEaqx+nnscCaLNN2q/O
 nMZMU0IOrkSM7450xgpev38xoUB/TVGcA1HeE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679482063;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+FF2ESmiiihfdUKZ1gHccbyU50W0AbxwPHMUw+YJ4po=;
 b=5RWu04dF4jtmZnLxlv1XORXcIubUyKIsSzn0AmchuJnA2GQNPZdMdg23sX1nkVaAiR
 GqAlgicZ+SClKi307G5VP8OwRVedG4tNAQfFVxKNtZo0QzLPGkNsLN97bjf5XMRmk8tB
 K42qmzwTxZLUDYm/p8O8nO667oa4ShYfbYGxl3wwydAYou1hkcH9OLmiZWDymKc+h/83
 YLoIIUAV7X9u+8zWUnIoPpduA7DrRmb6T6EH1v3qFtjrScF9mKl8PesxnqLrKqiLpA8T
 FIzb4MiyNSx6PP69pFDJzrjsW8p5pal4+hbbQkjDVFFfHxzqUKZ+BhncCyS8PTzP+HVP
 WKcQ==
X-Gm-Message-State: AO0yUKXg7LXlM7fsO8lkA88+Br6kgBXMzufIOjS1V2XLcUOSfCQ2mOoZ
 +tpmMhEec7oihNP4rtkvUPuiDA==
X-Google-Smtp-Source: AK7set95cBQsa0keVL6mVamcmGVinLOyF+09EHb16w+HRk9NSY7l9YPI2xwhYoVj3l1Hu5DSdYYBAA==
X-Received: by 2002:a17:90a:56:b0:23f:ebf2:d3de with SMTP id
 22-20020a17090a005600b0023febf2d3demr3016122pjb.27.1679482063289; 
 Wed, 22 Mar 2023 03:47:43 -0700 (PDT)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:343d:79bf:55f9:1da5])
 by smtp.gmail.com with ESMTPSA id
 hg4-20020a17090b300400b002340d317f3esm9508742pjb.52.2023.03.22.03.47.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 03:47:43 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Prashant Malani <pmalani@chromium.org>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>
Subject: [PATCH v14 10/10] drm/bridge: it6505: Register Type C mode switches
Date: Wed, 22 Mar 2023 18:46:39 +0800
Message-Id: <20230322104639.221402-11-treapking@chromium.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
In-Reply-To: <20230322104639.221402-1-treapking@chromium.org>
References: <20230322104639.221402-1-treapking@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Marek Vasut <marex@denx.de>, chrome-platform@lists.linux.dev,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, Pin-yen Lin <treapking@chromium.org>,
 Allen Chen <allen.chen@ite.com.tw>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Register USB Type-C mode switches when the "mode-switch" property and
relevant port are available in Device Tree. Configure the "lane_swap"
state based on the entered alternate mode for a specific Type-C
connector, which ends up updating the lane swap registers of the it6505
chip.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

Changes in v14:
- Fix style issues

Changes in v13:
- Fix style issues

Changes in v12:
- Fixes style issues in it6505 driver
- Replaced &it6505->client->dev with it6505->dev
- Updated the error logs when parsing data-lanes property

Changes in v11:
- Added back "data-lanes" parsing logics
- Removed Kconfig dependency
- Updated the usage of the private data

Changes in v7:
- Fixed style issues in it6505 driver
- Removed the redundant sleep in it6505 driver
- Removed DT property validation in it6505 driver
- Rebased to drm-misc-next
- Extracted common codes to another commit

Changes in v6:
- Changed it6505_typec_mux_set callback function to accommodate with
  the latest drm-misc patches
- Changed the driver implementation to accommodate with the new binding
- Squashed to a single patch

 drivers/gpu/drm/bridge/ite-it6505.c | 190 +++++++++++++++++++++++++++-
 1 file changed, 183 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index d4bc388b68ac..28d07fd7486b 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -17,6 +17,8 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/types.h>
+#include <linux/usb/typec_dp.h>
+#include <linux/usb/typec_mux.h>
 #include <linux/wait.h>
 
 #include <crypto/hash.h>
@@ -27,6 +29,7 @@
 #include <drm/drm_bridge.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_of.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
@@ -401,6 +404,11 @@ struct debugfs_entries {
 	const struct file_operations *fops;
 };
 
+struct it6505_typec_port_data {
+	bool dp_connected;
+	bool lane_swap;
+};
+
 struct it6505 {
 	struct drm_dp_aux aux;
 	struct drm_bridge bridge;
@@ -454,6 +462,9 @@ struct it6505 {
 	struct delayed_work delayed_audio;
 	struct it6505_audio_data audio;
 	struct dentry *debugfs;
+	struct completion mux_register;
+	struct drm_dp_typec_switch_desc switch_desc;
+	struct it6505_typec_port_data *port_data;
 
 	/* it6505 driver hold option */
 	bool enable_drv_hold;
@@ -3345,12 +3356,162 @@ static void it6505_shutdown(struct i2c_client *client)
 		it6505_lane_off(it6505);
 }
 
+static void it6505_typec_ports_update(struct it6505 *it6505)
+{
+	unsigned int i;
+
+	/* Check if both ports available and do nothing to retain the current one */
+	if (it6505->port_data[0].dp_connected && it6505->port_data[1].dp_connected)
+		return;
+
+	for (i = 0; i < 2; i++) {
+		if (it6505->port_data[i].dp_connected)
+			it6505->lane_swap = it6505->port_data[i].lane_swap;
+	}
+}
+
+static int it6505_typec_mux_set(struct typec_mux_dev *mux,
+				struct typec_mux_state *state)
+{
+	struct drm_dp_typec_port_data *port = typec_mux_get_drvdata(mux);
+	struct it6505 *it6505 = port->data;
+	struct device *dev = it6505->dev;
+	struct drm_dp_typec_switch_desc switch_desc = it6505->switch_desc;
+	bool old_dp_connected, new_dp_connected;
+
+	if (switch_desc.num_typec_switches == 1)
+		return 0;
+
+	mutex_lock(&it6505->extcon_lock);
+	wait_for_completion(&it6505->mux_register);
+
+	old_dp_connected = it6505->port_data[0].dp_connected ||
+			   it6505->port_data[1].dp_connected;
+
+	it6505->port_data[port->port_num].dp_connected =
+		state->alt &&
+		state->alt->svid == USB_TYPEC_DP_SID &&
+		state->alt->mode == USB_TYPEC_DP_MODE;
+
+	dev_dbg(dev, "mux_set dp_connected: c0=%d, c1=%d\n",
+		it6505->port_data[0].dp_connected, it6505->port_data[1].dp_connected);
+
+	new_dp_connected = it6505->port_data[0].dp_connected ||
+			   it6505->port_data[1].dp_connected;
+
+	if (it6505->enable_drv_hold) {
+		dev_dbg(dev, "enable driver hold\n");
+		goto unlock;
+	}
+
+	it6505_typec_ports_update(it6505);
+
+	if (!old_dp_connected && new_dp_connected) {
+		int ret = pm_runtime_get_sync(dev);
+
+		/*
+		 * pm_runtime_force_suspend() disables runtime PM when the
+		 * system enters suspend state. But on system resume, mux_set
+		 * can be triggered before pm_runtime_force_resume() re-enables
+		 * runtime PM. This makes the bridge stay powered off if the
+		 * downstream display is connected when the system is suspended.
+		 * Handling the error here to make sure the bridge is powered
+		 * on, and leave the PM runtime usage count incremented so
+		 * the future runtime PM calls is balanced.
+		 */
+		if (ret < 0)
+			it6505_poweron(it6505);
+
+		complete_all(&it6505->extcon_completion);
+	}
+
+	if (old_dp_connected && !new_dp_connected) {
+		reinit_completion(&it6505->extcon_completion);
+		pm_runtime_put_sync(dev);
+		if (it6505->bridge.dev)
+			drm_helper_hpd_irq_event(it6505->bridge.dev);
+		memset(it6505->dpcd, 0, sizeof(it6505->dpcd));
+	}
+
+unlock:
+	mutex_unlock(&it6505->extcon_lock);
+	return 0;
+}
+
+static void it6505_unregister_typec_switches(struct it6505 *it6505)
+{
+	drm_dp_unregister_typec_switches(&it6505->switch_desc);
+}
+
+static int it6505_register_typec_switches(struct device *dev, struct it6505 *it6505)
+{
+	struct device_node *port_node = of_graph_get_port_by_id(dev->of_node, 1);
+	struct drm_dp_typec_switch_desc *switch_desc = &it6505->switch_desc;
+	int ret;
+	u32 dp_lanes[4];
+	unsigned int i, num_lanes;
+
+	ret = drm_dp_register_typec_switches(dev, &port_node->fwnode,
+					     &it6505->switch_desc, it6505,
+					     it6505_typec_mux_set);
+	if (ret)
+		return ret;
+
+	it6505->port_data = devm_kcalloc(dev, switch_desc->num_typec_switches,
+					 sizeof(struct it6505_typec_port_data),
+					 GFP_KERNEL);
+	if (!it6505->port_data) {
+		ret = -ENOMEM;
+		goto unregister_mux;
+	}
+
+	for (i = 0; i < switch_desc->num_typec_switches; i++) {
+		struct drm_dp_typec_port_data *port = &switch_desc->typec_ports[i];
+		struct fwnode_handle *fwnode = port->fwnode;
+
+		ret = fwnode_property_count_u32(fwnode, "data-lanes");
+		if (ret < 0) {
+			dev_err(dev,
+				"Error on getting data lanes count from %pfwP: %d\n",
+				fwnode, ret);
+			goto unregister_mux;
+		}
+		if (ret > 2) {
+			dev_err(dev,
+				"Invalid data lanes count for mode switches from %pfwP: %d\n",
+				fwnode, ret);
+			ret = -EINVAL;
+			goto unregister_mux;
+		}
+		num_lanes = ret;
+
+		ret = fwnode_property_read_u32_array(fwnode, "data-lanes",
+						     dp_lanes, num_lanes);
+		if (ret) {
+			dev_err(dev,
+				"Failed to read the data-lanes variable: %d\n",
+				ret);
+			goto unregister_mux;
+		}
+
+		it6505->port_data[i].lane_swap = (dp_lanes[0] >= 2);
+	}
+	complete_all(&it6505->mux_register);
+
+	return 0;
+
+unregister_mux:
+	complete_all(&it6505->mux_register);
+	it6505_unregister_typec_switches(it6505);
+	return ret;
+}
+
 static int it6505_i2c_probe(struct i2c_client *client)
 {
 	struct it6505 *it6505;
 	struct device *dev = &client->dev;
 	struct extcon_dev *extcon;
-	int err, intp_irq;
+	int err, intp_irq, ret;
 
 	it6505 = devm_kzalloc(&client->dev, sizeof(*it6505), GFP_KERNEL);
 	if (!it6505)
@@ -3367,14 +3528,28 @@ static int it6505_i2c_probe(struct i2c_client *client)
 
 	/* get extcon device from DTS */
 	extcon = extcon_get_edev_by_phandle(dev, 0);
-	if (PTR_ERR(extcon) == -EPROBE_DEFER)
-		return -EPROBE_DEFER;
-	if (IS_ERR(extcon)) {
-		dev_err(dev, "can not get extcon device!");
-		return PTR_ERR(extcon);
+	ret = PTR_ERR_OR_ZERO(extcon);
+	if (ret == -EPROBE_DEFER)
+		return ret;
+
+	if (ret) {
+		if (ret != -ENODEV)
+			dev_warn(dev, "Cannot get extcon device: %d\n", ret);
+
+		it6505->extcon = NULL;
+	} else {
+		it6505->extcon = extcon;
 	}
 
-	it6505->extcon = extcon;
+	init_completion(&it6505->mux_register);
+	ret = it6505_register_typec_switches(dev, it6505);
+	if (ret != -ENODEV)
+		dev_warn(dev, "Didn't register Type-C switches, err: %d\n", ret);
+
+	if (ret && !it6505->extcon) {
+		dev_err(dev, "Both extcon and Type-C switch are not registered.\n");
+		return -EINVAL;
+	}
 
 	it6505->regmap = devm_regmap_init_i2c(client, &it6505_regmap_config);
 	if (IS_ERR(it6505->regmap)) {
@@ -3446,6 +3621,7 @@ static void it6505_i2c_remove(struct i2c_client *client)
 	it6505_debugfs_remove(it6505);
 	it6505_poweroff(it6505);
 	it6505_remove_edid(it6505);
+	it6505_unregister_typec_switches(it6505);
 }
 
 static const struct i2c_device_id it6505_id[] = {
-- 
2.40.0.rc1.284.g88254d51c5-goog

