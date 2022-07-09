Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9763A56CA5B
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 17:28:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5AB41123FE;
	Sat,  9 Jul 2022 15:28:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F9E113EE4
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 14:11:55 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id b2so1027869plx.7
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Jul 2022 07:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pdQ2fsEjyatgQ9vvMeEQJ3bDJK3UAe677Epc4PPFv8w=;
 b=CV0bMPQk8ItH4pkbeCBhmTjSl0iYuAyYokvXY9LZ/5uHlX/nyFD81/fnWh+A/HaTw7
 nSMm29z5h2PATRAh+oO0H/1vMfrT0Gh8/nQ5vWGzg+Jsn+nOO14Qkg5TJ4bwE3sbSu6f
 sVIqFL8D2NX5Jogl1krSSdY9KprULH43P4MQmp6W1xfGDjVJb74SyYq6DmQadpbVX+H5
 XiCYYWDG63Pb/3/ly/T4jhYJfuZ7vFqe1Gwb41PF2RWtihff3GOyYxd/1OUNM0917e8M
 BSvHkeZm70LrMnXMKvYSLQc7CjsS3kfpSNk2uf48cpNdtG7bU79VJBRN6kamRErW+QiB
 78AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pdQ2fsEjyatgQ9vvMeEQJ3bDJK3UAe677Epc4PPFv8w=;
 b=7FyoI8l2L5SfBH3bXrxq64jqH/M00fkj8ohxX4E5RKlx+fJvGcOOmbT7lOXtjf+lRA
 EW4bTvfQdsBifVK3EYF6fSuIGY3JFE1skBbHrlyd3NtwgPWafbZPMof6FC69NhUiIwJA
 kEbEpWP+6l9QYS/GZ5NizE+whKUrtRI48Qra23SsfLtz+8V79cN9vZjOPIJT3qG6+1aR
 HAgNtHhi+heySp4MD/d0Ur6TDihg7ghGmQE3nMTIfsWJsoBjtzt8Ge9+TFgkkR27xMfx
 En/Soq2J3/8IT409H35M+MmqdI2rOX93CB2SdHbs4XQHWl3+hGc2dw3SFviqcLwhNaK2
 LTuA==
X-Gm-Message-State: AJIora86i/i1mffQoAJewm7QevVtED+zaXNZouk355S+uTO+h+12eXvF
 MnydNWPS6aLpZJFtN1P0wpI=
X-Google-Smtp-Source: AGRyM1vCmh9u8Q/ANkSPukDU5Jbai8AHsPb3I8FAq37QmNzXcaLyoO5TWNqs+NWxGIxL2DYvz2UGIA==
X-Received: by 2002:a17:902:7290:b0:16b:b6b5:7e6c with SMTP id
 d16-20020a170902729000b0016bb6b57e6cmr9387615pll.116.1657375914734; 
 Sat, 09 Jul 2022 07:11:54 -0700 (PDT)
Received: from localhost.localdomain ([112.0.189.16])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a056a0000cb00b0052974b651b9sm1529828pfj.38.2022.07.09.07.11.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Jul 2022 07:11:54 -0700 (PDT)
From: MollySophia <mollysophia379@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Molly Sophia <mollysophia379@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] drm: panel: Add novatek nt35596s panel driver
Date: Sat,  9 Jul 2022 22:11:36 +0800
Message-Id: <20220709141136.58298-2-mollysophia379@gmail.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220709141136.58298-1-mollysophia379@gmail.com>
References: <20220709141136.58298-1-mollysophia379@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 09 Jul 2022 15:28:41 +0000
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
Cc: linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Novatek NT35596s is a generic DSI IC that drives command and video mode
panels. Add the driver for it. Currently add support for the LCD panel
from JDI connected with this IC, as found on Xiaomi Mi Mix2s phones.

Signed-off-by: MollySophia <mollysophia379@gmail.com>
---
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-jdi-fhd-nt35596s.c    | 465 ++++++++++++++++++
 3 files changed, 475 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-jdi-fhd-nt35596s.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index d5176f75248f..54e705813f98 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -222,6 +222,15 @@ config DRM_PANEL_JDI_LT070ME05000
 	  The panel has a 1200(RGB)×1920 (WUXGA) resolution and uses
 	  24 bit per pixel.
 
+config DRM_PANEL_JDI_NT35596S
+	tristate "JDI NT35596S Full HD DSI panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y here if you want to enable support for the JDI NT35596S
+	  DSI video mode panel as found in Xiaomi Mi Mix2s Devices.
+
 config DRM_PANEL_JDI_R63452
 	tristate "JDI R63452 Full HD DSI panel"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index ef89dada021d..a9f0ee7b9d41 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -20,6 +20,7 @@ obj-$(CONFIG_DRM_PANEL_INNOLUX_EJ030NA) += panel-innolux-ej030na.o
 obj-$(CONFIG_DRM_PANEL_INNOLUX_P079ZCA) += panel-innolux-p079zca.o
 obj-$(CONFIG_DRM_PANEL_INNOLUX_TD4328) += panel-innolux-td4328.o
 obj-$(CONFIG_DRM_PANEL_JDI_LT070ME05000) += panel-jdi-lt070me05000.o
+obj-$(CONFIG_DRM_PANEL_JDI_NT35596S) += panel-jdi-fhd-nt35596s.o
 obj-$(CONFIG_DRM_PANEL_JDI_R63452) += panel-jdi-fhd-r63452.o
 obj-$(CONFIG_DRM_PANEL_KHADAS_TS050) += panel-khadas-ts050.o
 obj-$(CONFIG_DRM_PANEL_KINGDISPLAY_KD097D04) += panel-kingdisplay-kd097d04.o
diff --git a/drivers/gpu/drm/panel/panel-jdi-fhd-nt35596s.c b/drivers/gpu/drm/panel/panel-jdi-fhd-nt35596s.c
new file mode 100644
index 000000000000..c1bc991d4888
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-jdi-fhd-nt35596s.c
@@ -0,0 +1,465 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022 Molly Sophia <mollysophia379@gmail.com>
+ *
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/regulator/consumer.h>
+#include <linux/swab.h>
+#include <linux/backlight.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+
+struct nt35596s_panel_cmd {
+	const char data[2];
+};
+
+static const char *const nt35596s_regulator_names[] = {
+	"vddio",
+	"vddpos",
+	"vddneg",
+};
+
+static const unsigned long nt35596s_regulator_enable_loads[] = { 62000, 100000,
+								 100000 };
+
+struct nt35596s_panel_desc {
+	const struct drm_display_mode *display_mode;
+
+	unsigned int width_mm;
+	unsigned int height_mm;
+
+	unsigned long mode_flags;
+	enum mipi_dsi_pixel_format format;
+	unsigned int lanes;
+
+	unsigned int num_on_cmds;
+	const struct nt35596s_panel_cmd *on_cmds;
+};
+
+struct nt35596s_panel {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	const struct nt35596s_panel_desc *desc;
+
+	struct regulator_bulk_data
+		supplies[ARRAY_SIZE(nt35596s_regulator_names)];
+
+	struct gpio_desc *reset_gpio;
+	bool prepared;
+};
+
+static inline struct nt35596s_panel *to_nt35596s_panel(struct drm_panel *panel)
+{
+	return container_of(panel, struct nt35596s_panel, panel);
+}
+
+static int nt35596s_send_cmds(struct drm_panel *panel,
+			      const struct nt35596s_panel_cmd *cmds, int num)
+{
+	struct nt35596s_panel *pinfo = to_nt35596s_panel(panel);
+	unsigned int i;
+	int err;
+
+	for (i = 0; i < num; i++) {
+		const struct nt35596s_panel_cmd *cmd = &cmds[i];
+
+		err = mipi_dsi_dcs_write(pinfo->dsi, cmd->data[0],
+					 cmd->data + 1, 1);
+
+		if (err < 0)
+			return err;
+	}
+
+	return 0;
+}
+
+static int nt35596s_panel_power_off(struct drm_panel *panel)
+{
+	struct nt35596s_panel *pinfo = to_nt35596s_panel(panel);
+	int err = 0;
+
+	gpiod_set_value(pinfo->reset_gpio, 1);
+
+	err = regulator_bulk_disable(ARRAY_SIZE(pinfo->supplies),
+				     pinfo->supplies);
+
+	return err;
+}
+
+static int nt35596s_panel_unprepare(struct drm_panel *panel)
+{
+	struct nt35596s_panel *pinfo = to_nt35596s_panel(panel);
+	int err;
+
+	if (!pinfo->prepared)
+		return 0;
+
+	err = mipi_dsi_dcs_set_display_off(pinfo->dsi);
+	if (err < 0)
+		dev_err(panel->dev, "set_display_off cmd failed, err = %d\n",
+			err);
+
+	/* 120ms delay required here as per DCS spec */
+	msleep(120);
+
+	err = mipi_dsi_dcs_enter_sleep_mode(pinfo->dsi);
+	if (err < 0)
+		dev_err(panel->dev, "enter_sleep_mode cmd failed, err = %d\n", err);
+
+	/* 0x46 = 70ms delay */
+	msleep(70);
+
+	err = nt35596s_panel_power_off(panel);
+	if (err < 0)
+		dev_err(panel->dev, "power_off failed, err = %d\n", err);
+
+	pinfo->prepared = false;
+
+	return err;
+}
+
+static int nt35596s_panel_power_on(struct drm_panel *panel)
+{
+	struct nt35596s_panel *pinfo = to_nt35596s_panel(panel);
+	int err;
+
+	err = regulator_bulk_enable(ARRAY_SIZE(pinfo->supplies),
+				    pinfo->supplies);
+	if (err < 0) {
+		gpiod_set_value(pinfo->reset_gpio, 1);
+		return err;
+	}
+
+	gpiod_set_value(pinfo->reset_gpio, 1);
+	msleep(200);
+	gpiod_set_value(pinfo->reset_gpio, 0);
+	msleep(200);
+
+	return 0;
+}
+
+static int nt35596s_panel_prepare(struct drm_panel *panel)
+{
+	struct nt35596s_panel *pinfo = to_nt35596s_panel(panel);
+	int err;
+
+	if (pinfo->prepared)
+		return 0;
+
+	err = nt35596s_panel_power_on(panel);
+	if (err < 0) {
+		dev_err(panel->dev, "power_on failed, err = %d\n", err);
+		return err;
+	}
+
+	err = nt35596s_send_cmds(panel, pinfo->desc->on_cmds,
+				 pinfo->desc->num_on_cmds);
+	if (err < 0) {
+		dev_err(panel->dev, "failed to send dcs init codes, err = %d\n", err);
+		goto poweroff;
+	}
+
+	err = mipi_dsi_dcs_exit_sleep_mode(pinfo->dsi);
+	if (err < 0) {
+		dev_err(panel->dev, "exit_sleep_mode cmd failed, err = %d\n", err);
+		goto poweroff;
+	}
+
+	/* 0x46 = 70 ms delay */
+	msleep(70);
+
+	err = mipi_dsi_dcs_set_display_on(pinfo->dsi);
+	if (err < 0) {
+		dev_err(panel->dev, "set_display_on cmd failed, err = %d\n", err);
+		goto poweroff;
+	}
+
+	msleep(120);
+
+	pinfo->prepared = true;
+
+	return 0;
+
+poweroff:
+	nt35596s_panel_power_off(panel);
+	return err;
+}
+
+static int nt35596s_panel_get_modes(struct drm_panel *panel,
+				    struct drm_connector *connector)
+{
+	struct nt35596s_panel *pinfo = to_nt35596s_panel(panel);
+	const struct drm_display_mode *m = pinfo->desc->display_mode;
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_duplicate(connector->dev, m);
+	if (!mode) {
+		dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
+			m->hdisplay, m->vdisplay, drm_mode_vrefresh(m));
+		return -ENOMEM;
+	}
+
+	connector->display_info.width_mm = pinfo->desc->width_mm;
+	connector->display_info.height_mm = pinfo->desc->height_mm;
+
+	drm_mode_set_name(mode);
+	drm_mode_probed_add(connector, mode);
+
+	return 1;
+}
+
+static const struct drm_panel_funcs panel_funcs = {
+	.prepare = nt35596s_panel_prepare,
+	.unprepare = nt35596s_panel_unprepare,
+	.get_modes = nt35596s_panel_get_modes,
+};
+
+static const struct nt35596s_panel_cmd jdi_fhd_video_on_cmds[] = {
+	{ .data = { 0xff, 0x24 } }, { .data = { 0x9d, 0x34 } },
+	{ .data = { 0xfb, 0x01 } }, { .data = { 0xc4, 0x25 } },
+	{ .data = { 0xd1, 0x08 } }, { .data = { 0xd2, 0x84 } },
+	{ .data = { 0xff, 0x26 } }, { .data = { 0xfb, 0x01 } },
+	{ .data = { 0x03, 0x1c } }, { .data = { 0x3b, 0x08 } },
+	{ .data = { 0x6b, 0x08 } }, { .data = { 0x97, 0x08 } },
+	{ .data = { 0xc5, 0x08 } }, { .data = { 0xfb, 0x01 } },
+	{ .data = { 0xff, 0x23 } }, { .data = { 0xfb, 0x01 } },
+	{ .data = { 0x01, 0x84 } }, { .data = { 0x05, 0x2d } },
+	{ .data = { 0x06, 0x00 } }, { .data = { 0x33, 0x07 } },
+	{ .data = { 0x21, 0xee } }, { .data = { 0x22, 0xed } },
+	{ .data = { 0x23, 0xea } }, { .data = { 0x24, 0xe8 } },
+	{ .data = { 0x25, 0xe5 } }, { .data = { 0x26, 0xe2 } },
+	{ .data = { 0x27, 0xde } }, { .data = { 0x28, 0xbb } },
+	{ .data = { 0x29, 0x87 } }, { .data = { 0x2a, 0x77 } },
+	{ .data = { 0x32, 0x0c } }, { .data = { 0x13, 0x3f } },
+	{ .data = { 0x14, 0x34 } }, { .data = { 0x15, 0x2a } },
+	{ .data = { 0x16, 0x25 } }, { .data = { 0x17, 0x9d } },
+	{ .data = { 0x18, 0x9a } }, { .data = { 0x19, 0x97 } },
+	{ .data = { 0x1a, 0x94 } }, { .data = { 0x1b, 0x91 } },
+	{ .data = { 0x1c, 0x8e } }, { .data = { 0x1d, 0x8b } },
+	{ .data = { 0x1e, 0x89 } }, { .data = { 0x1f, 0x86 } },
+	{ .data = { 0x20, 0x83 } }, { .data = { 0xff, 0x22 } },
+	{ .data = { 0x00, 0x0a } }, { .data = { 0x01, 0x43 } },
+	{ .data = { 0x02, 0x5b } }, { .data = { 0x03, 0x6a } },
+	{ .data = { 0x04, 0x7a } }, { .data = { 0x05, 0x82 } },
+	{ .data = { 0x06, 0x85 } }, { .data = { 0x07, 0x80 } },
+	{ .data = { 0x08, 0x7c } }, { .data = { 0x09, 0x7c } },
+	{ .data = { 0x0a, 0x74 } }, { .data = { 0x0b, 0x71 } },
+	{ .data = { 0x0c, 0x6e } }, { .data = { 0x0d, 0x68 } },
+	{ .data = { 0x0e, 0x65 } }, { .data = { 0x0f, 0x5c } },
+	{ .data = { 0x10, 0x32 } }, { .data = { 0x11, 0x18 } },
+	{ .data = { 0x12, 0x00 } }, { .data = { 0x13, 0x00 } },
+	{ .data = { 0x1a, 0x00 } }, { .data = { 0x1b, 0x00 } },
+	{ .data = { 0x1c, 0x00 } }, { .data = { 0x1d, 0x00 } },
+	{ .data = { 0x1e, 0x00 } }, { .data = { 0x1f, 0x00 } },
+	{ .data = { 0x20, 0x00 } }, { .data = { 0x21, 0x00 } },
+	{ .data = { 0x22, 0x00 } }, { .data = { 0x23, 0x00 } },
+	{ .data = { 0x24, 0x00 } }, { .data = { 0x25, 0x00 } },
+	{ .data = { 0x26, 0x00 } }, { .data = { 0x27, 0x00 } },
+	{ .data = { 0x28, 0x00 } }, { .data = { 0x29, 0x00 } },
+	{ .data = { 0x2a, 0x00 } }, { .data = { 0x2b, 0x00 } },
+	{ .data = { 0x2f, 0x00 } }, { .data = { 0x30, 0x00 } },
+	{ .data = { 0x31, 0x00 } }, { .data = { 0x32, 0x0c } },
+	{ .data = { 0x33, 0x0c } }, { .data = { 0x34, 0x0c } },
+	{ .data = { 0x35, 0x0b } }, { .data = { 0x36, 0x09 } },
+	{ .data = { 0x37, 0x09 } }, { .data = { 0x38, 0x08 } },
+	{ .data = { 0x39, 0x05 } }, { .data = { 0x3a, 0x03 } },
+	{ .data = { 0x3b, 0x00 } }, { .data = { 0x3f, 0x00 } },
+	{ .data = { 0x40, 0x00 } }, { .data = { 0x41, 0x00 } },
+	{ .data = { 0x42, 0x00 } }, { .data = { 0x43, 0x00 } },
+	{ .data = { 0x44, 0x00 } }, { .data = { 0x45, 0x00 } },
+	{ .data = { 0x46, 0x00 } }, { .data = { 0x47, 0x00 } },
+	{ .data = { 0x48, 0x00 } }, { .data = { 0x49, 0x03 } },
+	{ .data = { 0x4a, 0x06 } }, { .data = { 0x4b, 0x07 } },
+	{ .data = { 0x4c, 0x07 } }, { .data = { 0x53, 0x01 } },
+	{ .data = { 0x54, 0x01 } }, { .data = { 0x55, 0x89 } },
+	{ .data = { 0x56, 0x00 } }, { .data = { 0x58, 0x00 } },
+	{ .data = { 0x68, 0x00 } }, { .data = { 0x84, 0xff } },
+	{ .data = { 0x85, 0xff } }, { .data = { 0x86, 0x03 } },
+	{ .data = { 0x87, 0x00 } }, { .data = { 0x88, 0x00 } },
+	{ .data = { 0xa2, 0x20 } }, { .data = { 0xa9, 0x01 } },
+	{ .data = { 0xaa, 0x12 } }, { .data = { 0xab, 0x13 } },
+	{ .data = { 0xac, 0x0a } }, { .data = { 0xad, 0x74 } },
+	{ .data = { 0xaf, 0x33 } }, { .data = { 0xb0, 0x03 } },
+	{ .data = { 0xb1, 0x14 } }, { .data = { 0xb2, 0x42 } },
+	{ .data = { 0xb3, 0x40 } }, { .data = { 0xb4, 0xa5 } },
+	{ .data = { 0xb6, 0x44 } }, { .data = { 0xb7, 0x04 } },
+	{ .data = { 0xb8, 0x14 } }, { .data = { 0xb9, 0x42 } },
+	{ .data = { 0xba, 0x40 } }, { .data = { 0xbb, 0xa5 } },
+	{ .data = { 0xbd, 0x44 } }, { .data = { 0xbe, 0x04 } },
+	{ .data = { 0xbf, 0x00 } }, { .data = { 0xc0, 0x75 } },
+	{ .data = { 0xc1, 0x6a } }, { .data = { 0xc2, 0xa5 } },
+	{ .data = { 0xc4, 0x22 } }, { .data = { 0xc5, 0x02 } },
+	{ .data = { 0xc6, 0x00 } }, { .data = { 0xc7, 0x95 } },
+	{ .data = { 0xc8, 0x8a } }, { .data = { 0xc9, 0xa5 } },
+	{ .data = { 0xcb, 0x22 } }, { .data = { 0xcc, 0x02 } },
+	{ .data = { 0xcd, 0x00 } }, { .data = { 0xce, 0xb5 } },
+	{ .data = { 0xcf, 0xaa } }, { .data = { 0xd0, 0xa5 } },
+	{ .data = { 0xd2, 0x22 } }, { .data = { 0xd3, 0x02 } },
+	{ .data = { 0xfb, 0x01 } }, { .data = { 0xff, 0x10 } },
+	{ .data = { 0x26, 0x02 } }, { .data = { 0x35, 0x00 } },
+	{ .data = { 0x51, 0xff } }, { .data = { 0x53, 0x24 } },
+	{ .data = { 0x55, 0x00 } }, { .data = { 0xb0, 0x00 } },
+};
+
+static const struct drm_display_mode jdi_fhd_video_panel_mode = {
+	.clock = (1080 + 16 + 28 + 40) * (2160 + 7 + 4 + 24) * 60 / 1000,
+
+	.hdisplay = 1080,
+	.hsync_start = 1080 + 16,
+	.hsync_end = 1080 + 16 + 28,
+	.htotal = 1080 + 16 + 28 + 40,
+
+	.vdisplay = 2160,
+	.vsync_start = 2160 + 7,
+	.vsync_end = 2160 + 7 + 4,
+	.vtotal = 2160 + 7 + 4 + 24,
+
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static const struct nt35596s_panel_desc jdi_fhd_video_panel_desc = {
+	.display_mode = &jdi_fhd_video_panel_mode,
+
+	.width_mm = 68,
+	.height_mm = 136,
+
+	.mode_flags = MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_VIDEO |
+		      MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_CLOCK_NON_CONTINUOUS |
+		      MIPI_DSI_MODE_VIDEO_BURST,
+	.format = MIPI_DSI_FMT_RGB888,
+	.lanes = 4,
+	.on_cmds = jdi_fhd_video_on_cmds,
+	.num_on_cmds = ARRAY_SIZE(jdi_fhd_video_on_cmds),
+};
+
+static int nt35596s_panel_add(struct nt35596s_panel *pinfo)
+{
+	struct device *dev = &pinfo->dsi->dev;
+	int i, err;
+
+	for (i = 0; i < ARRAY_SIZE(pinfo->supplies); i++)
+		pinfo->supplies[i].supply = nt35596s_regulator_names[i];
+
+	err = devm_regulator_bulk_get(dev, ARRAY_SIZE(pinfo->supplies),
+				      pinfo->supplies);
+	if (err < 0)
+		return dev_err_probe(dev, err, "failed to get regulators\n");
+
+	for (i = 0; i < ARRAY_SIZE(pinfo->supplies); i++) {
+		err = regulator_set_load(pinfo->supplies[i].consumer,
+					 nt35596s_regulator_enable_loads[i]);
+		if (err)
+			return dev_err_probe(
+				dev, err,
+				"failed to set regulator enable loads\n");
+	}
+
+	pinfo->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(pinfo->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(pinfo->reset_gpio),
+				     "failed to get reset gpio from DT\n");
+
+	drm_panel_init(&pinfo->panel, dev, &panel_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+
+	err = drm_panel_of_backlight(&pinfo->panel);
+	if (err)
+		return dev_err_probe(dev, err, "Failed to get backlight\n");
+
+	drm_panel_add(&pinfo->panel);
+
+	return 0;
+}
+
+static int nt35596s_panel_probe(struct mipi_dsi_device *dsi)
+{
+	struct nt35596s_panel *pinfo;
+	const struct nt35596s_panel_desc *desc;
+	int err;
+
+	pinfo = devm_kzalloc(&dsi->dev, sizeof(*pinfo), GFP_KERNEL);
+	if (!pinfo)
+		return -ENOMEM;
+
+	desc = of_device_get_match_data(&dsi->dev);
+	dsi->mode_flags = desc->mode_flags;
+	dsi->format = desc->format;
+	dsi->lanes = desc->lanes;
+	pinfo->desc = desc;
+	pinfo->dsi = dsi;
+
+	mipi_dsi_set_drvdata(dsi, pinfo);
+
+	err = nt35596s_panel_add(pinfo);
+	if (err < 0)
+		return err;
+
+	err = mipi_dsi_attach(dsi);
+	if (err < 0) {
+		drm_panel_remove(&pinfo->panel);
+		return err;
+	}
+
+	return 0;
+}
+
+static int nt35596s_panel_remove(struct mipi_dsi_device *dsi)
+{
+	struct nt35596s_panel *pinfo = mipi_dsi_get_drvdata(dsi);
+	int err;
+
+	err = drm_panel_unprepare(&pinfo->panel);
+	if (err < 0)
+		dev_err(&dsi->dev, "failed to unprepare panel: %d\n", err);
+
+	err = drm_panel_disable(&pinfo->panel);
+	if (err < 0)
+		dev_err(&dsi->dev, "failed to disable panel: %d\n", err);
+
+	err = mipi_dsi_detach(dsi);
+	if (err < 0)
+		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", err);
+
+	drm_panel_remove(&pinfo->panel);
+
+	return 0;
+}
+
+static void nt35596s_panel_shutdown(struct mipi_dsi_device *dsi)
+{
+	struct nt35596s_panel *pinfo = mipi_dsi_get_drvdata(dsi);
+
+	drm_panel_disable(&pinfo->panel);
+	drm_panel_unprepare(&pinfo->panel);
+}
+
+static const struct of_device_id nt35596s_panel_of_match[] = {
+	{ .compatible = "jdi,fhd-nt35596s", .data = &jdi_fhd_video_panel_desc },
+	{}
+};
+MODULE_DEVICE_TABLE(of, nt35596s_panel_of_match);
+
+static struct mipi_dsi_driver nt35596s_panel_driver = {
+	.driver = {
+		.name = "panel-jdi-fhd-nt35596s",
+		.of_match_table = nt35596s_panel_of_match,
+	},
+	.probe = nt35596s_panel_probe,
+	.remove = nt35596s_panel_remove,
+	.shutdown = nt35596s_panel_shutdown,
+};
+module_mipi_dsi_driver(nt35596s_panel_driver);
+
+MODULE_AUTHOR("Molly Sophia <mollysophia379@gmail.com>");
+MODULE_DESCRIPTION("DRM driver for JDI FHD nt35596s DSI panel, video mode");
+MODULE_LICENSE("GPL");
-- 
2.37.0

