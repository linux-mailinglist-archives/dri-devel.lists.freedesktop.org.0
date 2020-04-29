Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0861BD4DD
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 08:45:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B60E6ECA1;
	Wed, 29 Apr 2020 06:45:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-blr-01.qualcomm.com (alexa-out-blr-01.qualcomm.com
 [103.229.18.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4723F6E9C3;
 Wed, 29 Apr 2020 05:45:35 +0000 (UTC)
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA;
 29 Apr 2020 11:15:32 +0530
Received: from harigovi-linux.qualcomm.com ([10.204.66.157])
 by ironmsg02-blr.qualcomm.com with ESMTP; 29 Apr 2020 11:15:19 +0530
Received: by harigovi-linux.qualcomm.com (Postfix, from userid 2332695)
 id 5F3662BC3; Wed, 29 Apr 2020 11:15:18 +0530 (IST)
From: Harigovindan P <harigovi@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v11 1/2] drm/panel: add support for rm69299 visionox panel
 driver
Date: Wed, 29 Apr 2020 11:15:14 +0530
Message-Id: <20200421045508.21137-2-harigovi@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200421045508.21137-1-harigovi@codeaurora.org>
References: <20200421045508.21137-1-harigovi@codeaurora.org>
MIME-Version: 1.0
X-Patchwork-Submitter: Harigovindan P <harigovi@codeaurora.org>
X-Patchwork-Id: 11500435
Received: from mail.kernel.org (pdx-korg-mail-1.web.codeaurora.org
 [172.30.200.123]) by pdx-korg-patchwork-2.web.codeaurora.org (Postfix) with
 ESMTP id 99BA681 for <patchwork-linux-arm-msm@patchwork.kernel.org>;
 Tue, 21 Apr 2020 04:55:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18]) by
 mail.kernel.org (Postfix) with ESMTP id 86EDC208E4 for
 <patchwork-linux-arm-msm@patchwork.kernel.org>;
 Tue, 21 Apr 2020 04:55:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand id
 S1726104AbgDUEzS (ORCPT <rfc822;
 patchwork-linux-arm-msm@patchwork.kernel.org>);
 Tue, 21 Apr 2020 00:55:18 -0400
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:1302 "EHLO
 alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
 with ESMTP id S1725880AbgDUEzS (ORCPT <rfc822; linux-arm-msm@vger.kernel.org>);
 Tue, 21 Apr 2020 00:55:18 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130]) by
 alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA;
 21 Apr 2020 10:25:12 +0530
Received: from harigovi-linux.qualcomm.com ([10.204.66.157]) by
 ironmsg01-blr.qualcomm.com with ESMTP; 21 Apr 2020 10:25:11 +0530
Received: by harigovi-linux.qualcomm.com (Postfix, from userid 2332695) id
 2A3942A55; Tue, 21 Apr 2020 10:25:11 +0530 (IST)
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
X-Mailman-Approved-At: Wed, 29 Apr 2020 06:45:00 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: sean@poorly.run, Matthias Kaehlcke <mka@chromium.org>,
 seanpaul@chromium.org, Harigovindan P <harigovi@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for Visionox panel driver.

Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
---

Changes in v2:
	- Dropping redundant space in Kconfig(Sam Ravnborg).
	- Changing structure for include files(Sam Ravnborg).
	- Removing backlight related code and functions(Sam Ravnborg).
	- Removing repeated printing of error message(Sam Ravnborg).
	- Adding drm_connector as an argument for get_modes function.
Changes in v3:
	- Adding arguments for drm_panel_init to support against mainline.
Changes in v4:
	- Removing error messages from regulator_set_load.
	- Removing dev struct entry.
	- Removing checks.
	- Dropping empty comment lines.
Changes in v5:
	- Removing unused struct member variables.
	- Removing blank lines.
	- Fixed indentation.
	- Invoking dsi_detach and panel_remove while early exiting from probe.
Changes in v6:
	- Changed "35597" to "rm69299" for power_on function.
	- Removing rm69299_config since it supports single type of panel for now.
	- Fixed alignment.
	- Using goto statements when regulator_set_load fails.
Changes in v7:
	- Added new goto statement when regulator_set_load fails.
Changes in v8,v9,v10:
	- Had changes in first patch, did not make any change in panel driver.
Changes in v11:
	- Fixing checkpatch script errors.
	- Updated assignment of panel.dev property in  probe.

 drivers/gpu/drm/panel/Kconfig                 |   8 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-visionox-rm69299.c    | 304 ++++++++++++++++++
 3 files changed, 313 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-visionox-rm69299.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index d56258b9fcaf..4b6131f5893d 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -444,6 +444,14 @@ config DRM_PANEL_TRULY_NT35597_WQXGA
 	  Say Y here if you want to enable support for Truly NT35597 WQXGA Dual DSI
 	  Video Mode panel
 
+config DRM_PANEL_VISIONOX_RM69299
+	tristate "Visionox RM69299"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	help
+	  Say Y here if you want to enable support for Visionox
+	  RM69299  DSI Video Mode panel.
+
 config DRM_PANEL_XINPENG_XPP055C272
 	tristate "Xinpeng XPP055C272 panel driver"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 2335a1e32ae0..8eac3e6fa82c 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -47,4 +47,5 @@ obj-$(CONFIG_DRM_PANEL_TPO_TD028TTEC1) += panel-tpo-td028ttec1.o
 obj-$(CONFIG_DRM_PANEL_TPO_TD043MTEA1) += panel-tpo-td043mtea1.o
 obj-$(CONFIG_DRM_PANEL_TPO_TPG110) += panel-tpo-tpg110.o
 obj-$(CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA) += panel-truly-nt35597.o
+obj-$(CONFIG_DRM_PANEL_VISIONOX_RM69299) += panel-visionox-rm69299.o
 obj-$(CONFIG_DRM_PANEL_XINPENG_XPP055C272) += panel-xinpeng-xpp055c272.o
diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
new file mode 100644
index 000000000000..3ef4cc80044a
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
@@ -0,0 +1,304 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/delay.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/gpio/consumer.h>
+#include <linux/regulator/consumer.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_print.h>
+
+struct visionox_rm69299 {
+	struct drm_panel panel;
+	struct regulator_bulk_data supplies[2];
+	struct gpio_desc *reset_gpio;
+	struct mipi_dsi_device *dsi;
+	bool prepared;
+	bool enabled;
+};
+
+static inline struct visionox_rm69299 *panel_to_ctx(struct drm_panel *panel)
+{
+	return container_of(panel, struct visionox_rm69299, panel);
+}
+
+static int visionox_rm69299_power_on(struct visionox_rm69299 *ctx)
+{
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * Reset sequence of visionox panel requires the panel to be
+	 * out of reset for 10ms, followed by being held in reset
+	 * for 10ms and then out again
+	 */
+	gpiod_set_value(ctx->reset_gpio, 1);
+	usleep_range(10000, 20000);
+	gpiod_set_value(ctx->reset_gpio, 0);
+	usleep_range(10000, 20000);
+	gpiod_set_value(ctx->reset_gpio, 1);
+	usleep_range(10000, 20000);
+
+	return 0;
+}
+
+static int visionox_rm69299_power_off(struct visionox_rm69299 *ctx)
+{
+	gpiod_set_value(ctx->reset_gpio, 0);
+
+	return regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+}
+
+static int visionox_rm69299_unprepare(struct drm_panel *panel)
+{
+	struct visionox_rm69299 *ctx = panel_to_ctx(panel);
+	int ret;
+
+	ctx->dsi->mode_flags = 0;
+
+	ret = mipi_dsi_dcs_write(ctx->dsi, MIPI_DCS_SET_DISPLAY_OFF, NULL, 0);
+	if (ret < 0)
+		DRM_DEV_ERROR(ctx->panel.dev,
+			"set_display_off cmd failed ret = %d\n", ret);
+
+	/* 120ms delay required here as per DCS spec */
+	msleep(120);
+
+	ret = mipi_dsi_dcs_write(ctx->dsi, MIPI_DCS_ENTER_SLEEP_MODE, NULL, 0);
+	if (ret < 0) {
+		DRM_DEV_ERROR(ctx->panel.dev,
+			"enter_sleep cmd failed ret = %d\n", ret);
+	}
+
+	ret = visionox_rm69299_power_off(ctx);
+
+	ctx->prepared = false;
+	return ret;
+}
+
+static int visionox_rm69299_prepare(struct drm_panel *panel)
+{
+	struct visionox_rm69299 *ctx = panel_to_ctx(panel);
+	int ret;
+
+	if (ctx->prepared)
+		return 0;
+
+	ret = visionox_rm69299_power_on(ctx);
+	if (ret < 0)
+		return ret;
+
+	ctx->dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]){ 0xfe, 0x00 }, 2);
+	if (ret < 0) {
+		DRM_DEV_ERROR(ctx->panel.dev,
+			"cmd set tx 0 failed, ret = %d\n", ret);
+		goto power_off;
+	}
+
+	ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]){ 0xc2, 0x08 }, 2);
+	if (ret < 0) {
+		DRM_DEV_ERROR(ctx->panel.dev,
+			"cmd set tx 1 failed, ret = %d\n", ret);
+		goto power_off;
+	}
+
+	ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]){ 0x35, 0x00 }, 2);
+	if (ret < 0) {
+		DRM_DEV_ERROR(ctx->panel.dev,
+			"cmd set tx 2 failed, ret = %d\n", ret);
+		goto power_off;
+	}
+
+	ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]){ 0x51, 0xff }, 2);
+	if (ret < 0) {
+		DRM_DEV_ERROR(ctx->panel.dev,
+			"cmd set tx 3 failed, ret = %d\n", ret);
+		goto power_off;
+	}
+
+	ret = mipi_dsi_dcs_write(ctx->dsi, MIPI_DCS_EXIT_SLEEP_MODE, NULL, 0);
+	if (ret < 0) {
+		DRM_DEV_ERROR(ctx->panel.dev,
+			"exit_sleep_mode cmd failed ret = %d\n", ret);
+		goto power_off;
+	}
+
+	/* Per DSI spec wait 120ms after sending exit sleep DCS command */
+	msleep(120);
+
+	ret = mipi_dsi_dcs_write(ctx->dsi, MIPI_DCS_SET_DISPLAY_ON, NULL, 0);
+	if (ret < 0) {
+		DRM_DEV_ERROR(ctx->panel.dev,
+			"set_display_on cmd failed ret = %d\n", ret);
+		goto power_off;
+	}
+
+	/* Per DSI spec wait 120ms after sending set_display_on DCS command */
+	msleep(120);
+
+	ctx->prepared = true;
+
+	return 0;
+
+power_off:
+	return ret;
+}
+
+static const struct drm_display_mode visionox_rm69299_1080x2248_60hz = {
+	.name = "1080x2248",
+	.clock = 158695,
+	.hdisplay = 1080,
+	.hsync_start = 1080 + 26,
+	.hsync_end = 1080 + 26 + 2,
+	.htotal = 1080 + 26 + 2 + 36,
+	.vdisplay = 2248,
+	.vsync_start = 2248 + 56,
+	.vsync_end = 2248 + 56 + 4,
+	.vtotal = 2248 + 56 + 4 + 4,
+	.vrefresh = 60,
+	.flags = 0,
+};
+
+static int visionox_rm69299_get_modes(struct drm_panel *panel,
+				      struct drm_connector *connector)
+{
+	struct visionox_rm69299 *ctx = panel_to_ctx(panel);
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_create(connector->dev);
+	if (!mode) {
+		DRM_DEV_ERROR(ctx->panel.dev,
+			"failed to create a new display mode\n");
+		return 0;
+	}
+
+	connector->display_info.width_mm = 74;
+	connector->display_info.height_mm = 131;
+	drm_mode_copy(mode, &visionox_rm69299_1080x2248_60hz);
+	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
+	drm_mode_probed_add(connector, mode);
+
+	return 1;
+}
+
+static const struct drm_panel_funcs visionox_rm69299_drm_funcs = {
+	.unprepare = visionox_rm69299_unprepare,
+	.prepare = visionox_rm69299_prepare,
+	.get_modes = visionox_rm69299_get_modes,
+};
+
+static int visionox_rm69299_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct visionox_rm69299 *ctx;
+	int ret;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	mipi_dsi_set_drvdata(dsi, ctx);
+
+	ctx->panel.dev = dev;
+	ctx->dsi = dsi;
+
+	ctx->supplies[0].supply = "vdda";
+	ctx->supplies[1].supply = "vdd3p3";
+
+	ret = devm_regulator_bulk_get(ctx->panel.dev, ARRAY_SIZE(ctx->supplies),
+				      ctx->supplies);
+	if (ret < 0)
+		return ret;
+
+	ctx->reset_gpio = devm_gpiod_get(ctx->panel.dev,
+					"reset", GPIOD_OUT_LOW);
+	if (IS_ERR(ctx->reset_gpio)) {
+		DRM_DEV_ERROR(dev, "cannot get reset gpio %ld\n",
+			PTR_ERR(ctx->reset_gpio));
+		return PTR_ERR(ctx->reset_gpio);
+	}
+
+	drm_panel_init(&ctx->panel, dev, &visionox_rm69299_drm_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+	ctx->panel.dev = dev;
+	ctx->panel.funcs = &visionox_rm69299_drm_funcs;
+	drm_panel_add(&ctx->panel);
+
+	dsi->lanes = 4;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_LPM |
+		MIPI_DSI_CLOCK_NON_CONTINUOUS;
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0) {
+		DRM_DEV_ERROR(dev, "dsi attach failed ret = %d\n", ret);
+		goto err_dsi_attach;
+	}
+
+	ret = regulator_set_load(ctx->supplies[0].consumer, 32000);
+	if (ret) {
+		DRM_DEV_ERROR(dev,
+			"regulator set load failed for vdda supply ret = %d\n",
+			ret);
+		goto err_set_load;
+	}
+
+	ret = regulator_set_load(ctx->supplies[1].consumer, 13200);
+	if (ret) {
+		DRM_DEV_ERROR(dev,
+			"regulator set load failed for vdd3p3 supply ret = %d\n",
+			ret);
+		goto err_set_load;
+	}
+
+	return 0;
+
+err_set_load:
+	mipi_dsi_detach(dsi);
+err_dsi_attach:
+	drm_panel_remove(&ctx->panel);
+	return ret;
+}
+
+static int visionox_rm69299_remove(struct mipi_dsi_device *dsi)
+{
+	struct visionox_rm69299 *ctx = mipi_dsi_get_drvdata(dsi);
+
+	mipi_dsi_detach(ctx->dsi);
+	mipi_dsi_device_unregister(ctx->dsi);
+
+	drm_panel_remove(&ctx->panel);
+	return 0;
+}
+
+static const struct of_device_id visionox_rm69299_of_match[] = {
+	{
+		.compatible = "visionox,rm69299-1080p-display",
+	}
+};
+MODULE_DEVICE_TABLE(of, visionox_rm69299_of_match);
+
+static struct mipi_dsi_driver visionox_rm69299_driver = {
+	.driver = {
+		.name = "panel-visionox-rm69299",
+		.of_match_table = visionox_rm69299_of_match,
+	},
+	.probe = visionox_rm69299_probe,
+	.remove = visionox_rm69299_remove,
+};
+module_mipi_dsi_driver(visionox_rm69299_driver);
+
+MODULE_DESCRIPTION("Visionox RM69299 DSI Panel Driver");
+
-- 
2.25.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
