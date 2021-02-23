Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D84323004
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 18:56:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92F986EA0B;
	Tue, 23 Feb 2021 17:56:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEBC96EA0B
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 17:56:15 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id v1so23473088wrd.6
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 09:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fmehHvZhMVDRp8KKz/HzZdJwk6qFdxkh0ZiJ6WUqRTs=;
 b=VtX2Fgwd6U1v4F5I6Y/LLmPG0Dpo3zvW5FBOCRdHW6nZX/pQgTeDlM7ZzO6U+joDha
 eae+Tq6D4w124K+oy9Q8WFaAMjQ7w/voqutmDb6h+eouH7c3rKjDrWU0aOynzbR2skWy
 //xsbYhqSatedcZXH3j94bhpPTUpxBQExSq635GK/O9qTPvNhja2XvrbTQxeSxszDiFv
 lyrtXjE9b2L081JZiY8gRj2ZIokchUwyrkZ8QE1uVchPVzJAqC0Cxxrq0cZrmfVxdDwr
 R8yWUngkEcGqTSIg1otjdLrExoCTv3RuPvXVqVZcXtwfyt9gKOZAAwekAc1WAhUXrqmA
 BYIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fmehHvZhMVDRp8KKz/HzZdJwk6qFdxkh0ZiJ6WUqRTs=;
 b=eOleyjenOLmzLshygEjGzHlWyxnBcrB3WJTSi3/HtO4cL6sx+GO/IF77Bc0sPOWtva
 r+ahDHoP7UPCmWasWCMi3weiosQGto85wo/RJsbBlu4HklPyx2WaQrgIGyN3C1AIwrYR
 yfs70qmgtrjTG7ecxcZDpbIPryTVhEnpFAn4JXyhC8OSUxT87TqP840R1FCJBXTktTau
 J5N2MgEGl64P/Vt4uzMIaPhazo1N5vQ40SYcv2q2UHp7pLgBCV9GOCbEWHUYmfkH2JRh
 FgKukWxkrdkJK7K47q+OmuPKBviytaJ5dTHrEBuHWvbQrPliMii2uhhjQnJioNde5q2D
 8C/A==
X-Gm-Message-State: AOAM5316pvIhs9gZLnGBIcb9oKxwfDLFT8aqGYMbmuqNUuKuYQCLmjyD
 llz4nryHAe7bnqDJHTuets4=
X-Google-Smtp-Source: ABdhPJynQ8QPCGPpwmHMyo1xsK78NTXRJyQ7ahNUGgSkl/ECzTBNLrykpndgTLZVyGzE0Lq0LsE1TQ==
X-Received: by 2002:a5d:558b:: with SMTP id i11mr28088540wrv.125.1614102974461; 
 Tue, 23 Feb 2021 09:56:14 -0800 (PST)
Received: from localhost.localdomain
 (2a01cb0008bd270084c09ff22cc10cb2.ipv6.abo.wanadoo.fr.
 [2a01:cb00:8bd:2700:84c0:9ff2:2cc1:cb2])
 by smtp.gmail.com with ESMTPSA id g9sm2779815wrp.14.2021.02.23.09.56.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 09:56:14 -0800 (PST)
From: Adrien Grassein <adrien.grassein@gmail.com>
To: 
Subject: [PATCH v4 2/2] drm/bridge: Introduce LT8912 DSI to HDMI bridge
Date: Tue, 23 Feb 2021 18:56:07 +0100
Message-Id: <20210223175607.431796-3-adrien.grassein@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210223175607.431796-1-adrien.grassein@gmail.com>
References: <20210223175607.431796-1-adrien.grassein@gmail.com>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 narmstrong@baylibre.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org, robert.foss@linaro.org,
 a.hajda@samsung.com, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com,
 Adrien Grassein <adrien.grassein@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Lontium Lt8912 is a DSI to HDMI bridge.

Signed-off-by: Adrien Grassein <adrien.grassein@gmail.com>
---
 MAINTAINERS                             |   1 +
 drivers/gpu/drm/bridge/Kconfig          |  14 +
 drivers/gpu/drm/bridge/Makefile         |   1 +
 drivers/gpu/drm/bridge/lontium-lt8912.c | 764 ++++++++++++++++++++++++
 4 files changed, 780 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/lontium-lt8912.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 1e4d49f9dfea..fda331610c35 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10464,6 +10464,7 @@ LONTIUM LT8912 MIPI TO HDMI BRIDGE
 M:	Adrien Grassein <adrien.grassein@gmail.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/display/bridge/lontium,lt8912.yaml
+F:	drivers/gpu/drm/bridge/lontium-lt8912.c
 
 LSILOGIC MPT FUSION DRIVERS (FC/SAS/SPI)
 M:	Sathya Prakash <sathya.prakash@broadcom.com>
diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index e4110d6ca7b3..5b36d4b86e3c 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -48,6 +48,20 @@ config DRM_DISPLAY_CONNECTOR
 	  on ARM-based platforms. Saying Y here when this driver is not needed
 	  will not cause any issue.
 
+config DRM_LONTIUM_LT8912
+	tristate "Lontium LT8912 DSI/HDMI bridge"
+	depends on OF
+	select DRM_PANEL_BRIDGE
+	select DRM_KMS_HELPER
+	select REGMAP_I2C
+	help
+	  Driver for Lontium LT8912 DSI to HDMI bridge
+	  chip driver.
+	  Please say Y if you have such hardware.
+
+	  Say M here if you want to support this hardware as a module.
+	  The module will be named "lontium-lt8912".
+
 config DRM_LONTIUM_LT9611
 	tristate "Lontium LT9611 DSI/HDMI bridge"
 	select SND_SOC_HDMI_CODEC if SND_SOC
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index 86e7acc76f8d..5a1b201cea1f 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -2,6 +2,7 @@
 obj-$(CONFIG_DRM_CDNS_DSI) += cdns-dsi.o
 obj-$(CONFIG_DRM_CHRONTEL_CH7033) += chrontel-ch7033.o
 obj-$(CONFIG_DRM_DISPLAY_CONNECTOR) += display-connector.o
+obj-$(CONFIG_DRM_LONTIUM_LT8912) += lontium-lt8912.o
 obj-$(CONFIG_DRM_LONTIUM_LT9611) += lontium-lt9611.o
 obj-$(CONFIG_DRM_LONTIUM_LT9611UXC) += lontium-lt9611uxc.o
 obj-$(CONFIG_DRM_LVDS_CODEC) += lvds-codec.o
diff --git a/drivers/gpu/drm/bridge/lontium-lt8912.c b/drivers/gpu/drm/bridge/lontium-lt8912.c
new file mode 100644
index 000000000000..11d94da73c37
--- /dev/null
+++ b/drivers/gpu/drm/bridge/lontium-lt8912.c
@@ -0,0 +1,764 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/device.h>
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/gpio.h>
+#include <linux/of_gpio.h>
+#include <linux/regmap.h>
+
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_of.h>
+
+#include <video/videomode.h>
+
+#define I2C_MAIN 0
+#define I2C_ADDR_MAIN 0x48
+
+#define I2C_CEC_DSI 1
+#define I2C_ADDR_CEC_DSI 0x49
+
+#define I2C_MAX_IDX 2
+
+struct lt8912 {
+	struct device *dev;
+	struct drm_bridge bridge;
+	struct drm_connector connector;
+
+	struct i2c_client *i2c_client[I2C_MAX_IDX];
+	struct regmap *regmap[I2C_MAX_IDX];
+
+	struct device_node *host_node;
+	struct drm_bridge *hdmi_port;
+
+	struct mipi_dsi_device *dsi;
+
+	struct gpio_desc *gp_reset;
+
+	struct videomode mode;
+
+	u8 data_lanes;
+	bool is_power_on;
+	bool is_attached;
+};
+
+static int lt8912_write_init_config(struct lt8912 *lt)
+{
+	const struct reg_sequence seq[] = {
+		/* Digital clock en*/
+		{0x08, 0xff},
+		{0x09, 0xff},
+		{0x0a, 0xff},
+		{0x0b, 0x7c},
+		{0x0c, 0xff},
+		{0x42, 0x04},
+
+		/*Tx Analog*/
+		{0x31, 0xb1},
+		{0x32, 0xb1},
+		{0x33, 0x0e},
+		{0x37, 0x00},
+		{0x38, 0x22},
+		{0x60, 0x82},
+
+		/*Cbus Analog*/
+		{0x39, 0x45},
+		{0x3a, 0x00},
+		{0x3b, 0x00},
+
+		/*HDMI Pll Analog*/
+		{0x44, 0x31},
+		{0x55, 0x44},
+		{0x57, 0x01},
+		{0x5a, 0x02},
+
+		/*MIPI Analog*/
+		{0x3e, 0xd6},
+		{0x3f, 0xd4},
+		{0x41, 0x3c},
+		{0xB2, 0x00},
+	};
+
+	return regmap_multi_reg_write(lt->regmap[I2C_MAIN], seq, ARRAY_SIZE(seq));
+}
+
+static int lt8912_write_mipi_basic_config(struct lt8912 *lt)
+{
+	const struct reg_sequence seq[] = {
+		{0x12, 0x04},
+		{0x14, 0x00},
+		{0x15, 0x00},
+		{0x1a, 0x03},
+		{0x1b, 0x03},
+	};
+
+	return regmap_multi_reg_write(lt->regmap[I2C_CEC_DSI], seq, ARRAY_SIZE(seq));
+};
+
+static int lt8912_write_dds_config(struct lt8912 *lt)
+{
+	const struct reg_sequence seq[] = {
+		{0x4e, 0xff},
+		{0x4f, 0x56},
+		{0x50, 0x69},
+		{0x51, 0x80},
+		{0x1f, 0x5e},
+		{0x20, 0x01},
+		{0x21, 0x2c},
+		{0x22, 0x01},
+		{0x23, 0xfa},
+		{0x24, 0x00},
+		{0x25, 0xc8},
+		{0x26, 0x00},
+		{0x27, 0x5e},
+		{0x28, 0x01},
+		{0x29, 0x2c},
+		{0x2a, 0x01},
+		{0x2b, 0xfa},
+		{0x2c, 0x00},
+		{0x2d, 0xc8},
+		{0x2e, 0x00},
+		{0x42, 0x64},
+		{0x43, 0x00},
+		{0x44, 0x04},
+		{0x45, 0x00},
+		{0x46, 0x59},
+		{0x47, 0x00},
+		{0x48, 0xf2},
+		{0x49, 0x06},
+		{0x4a, 0x00},
+		{0x4b, 0x72},
+		{0x4c, 0x45},
+		{0x4d, 0x00},
+		{0x52, 0x08},
+		{0x53, 0x00},
+		{0x54, 0xb2},
+		{0x55, 0x00},
+		{0x56, 0xe4},
+		{0x57, 0x0d},
+		{0x58, 0x00},
+		{0x59, 0xe4},
+		{0x5a, 0x8a},
+		{0x5b, 0x00},
+		{0x5c, 0x34},
+		{0x1e, 0x4f},
+		{0x51, 0x00},
+	};
+
+	return regmap_multi_reg_write(lt->regmap[I2C_CEC_DSI], seq, ARRAY_SIZE(seq));
+}
+
+static int lt8912_write_rxlogicres_config(struct lt8912 *lt)
+{
+	int ret;
+
+	ret = regmap_write(lt->regmap[I2C_MAIN], 0x03, 0x7f);
+	usleep_range(10000, 20000);
+	ret |= regmap_write(lt->regmap[I2C_MAIN], 0x03, 0xff);
+
+	return ret;
+};
+
+static int lt8912_write_lvds_config(struct lt8912 *lt)
+{
+	const struct reg_sequence seq[] = {
+		{0x44, 0x30},
+		{0x51, 0x05},
+		{0x50, 0x24},
+		{0x51, 0x2d},
+		{0x52, 0x04},
+		{0x69, 0x0e},
+		{0x69, 0x8e},
+		{0x6a, 0x00},
+		{0x6c, 0xb8},
+		{0x6b, 0x51},
+		{0x04, 0xfb},
+		{0x04, 0xff},
+		{0x7f, 0x00},
+		{0xa8, 0x13},
+		{0x02, 0xf7},
+		{0x02, 0xff},
+		{0x03, 0xcf},
+		{0x03, 0xff},
+	};
+
+	return regmap_multi_reg_write(lt->regmap[I2C_CEC_DSI], seq, ARRAY_SIZE(seq));
+};
+
+static inline struct lt8912 *bridge_to_lt8912(struct drm_bridge *b)
+{
+	return container_of(b, struct lt8912, bridge);
+}
+
+static inline struct lt8912 *connector_to_lt8912(struct drm_connector *c)
+{
+	return container_of(c, struct lt8912, connector);
+}
+
+static const struct regmap_config lt8912_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = 0xff,
+};
+
+static int lt8912_init_i2c(struct lt8912 *lt, struct i2c_client *client)
+{
+	unsigned int i;
+	/*
+	 * At this time we only initialize 2 chips, but the lt8912 provides
+	 * a third interface for the audio over HDMI configuration.
+	 */
+	struct i2c_board_info info[] = {
+		{ I2C_BOARD_INFO("lt8912p0", I2C_ADDR_MAIN), },
+		{ I2C_BOARD_INFO("lt8912p1", I2C_ADDR_CEC_DSI), },
+	};
+
+	if (!lt)
+		return -ENODEV;
+
+	for (i = 0; i < ARRAY_SIZE(info); i++) {
+		if (i > 0) {
+			lt->i2c_client[i] = i2c_new_dummy_device(client->adapter,
+								 info[i].addr);
+			if (IS_ERR(lt->i2c_client[i]))
+				return PTR_ERR(lt->i2c_client[i]);
+		}
+
+		lt->regmap[i] = devm_regmap_init_i2c(lt->i2c_client[i],
+						     &lt8912_regmap_config);
+		if (IS_ERR(lt->regmap[i]))
+			return PTR_ERR(lt->regmap[i]);
+	}
+	return 0;
+}
+
+static int lt8912_free_i2c(struct lt8912 *lt)
+{
+	unsigned int i;
+
+	for (i = 1; i < I2C_MAX_IDX; i++)
+		i2c_unregister_device(lt->i2c_client[i]);
+
+	return 0;
+}
+
+static int lt8912_hard_power_on(struct lt8912 *lt)
+{
+	gpiod_set_value_cansleep(lt->gp_reset, 0);
+	msleep(20);
+
+	return 0;
+}
+
+static void lt8912_hard_power_off(struct lt8912 *lt)
+{
+	gpiod_set_value_cansleep(lt->gp_reset, 1);
+	msleep(20);
+	lt->is_power_on = false;
+}
+
+static int lt8912_video_setup(struct lt8912 *lt)
+{
+	u32 hactive, h_total, hpw, hfp, hbp;
+	u32 vactive, v_total, vpw, vfp, vbp;
+	u8 settle = 0x08;
+	int ret;
+
+	if (!lt)
+		return -EINVAL;
+
+	hactive = lt->mode.hactive;
+	hfp = lt->mode.hfront_porch;
+	hpw = lt->mode.hsync_len;
+	hbp = lt->mode.hback_porch;
+	h_total = hactive + hfp + hpw + hbp;
+
+	vactive = lt->mode.vactive;
+	vfp = lt->mode.vfront_porch;
+	vpw = lt->mode.vsync_len;
+	vbp = lt->mode.vback_porch;
+	v_total = vactive + vfp + vpw + vbp;
+
+	if (vactive <= 600)
+		settle = 0x04;
+	else if (vactive == 1080)
+		settle = 0x0a;
+
+	ret = regmap_write(lt->regmap[I2C_CEC_DSI], 0x10, 0x01);
+	ret |= regmap_write(lt->regmap[I2C_CEC_DSI], 0x11, settle);
+	ret |= regmap_write(lt->regmap[I2C_CEC_DSI], 0x18, hpw);
+	ret |= regmap_write(lt->regmap[I2C_CEC_DSI], 0x19, vpw);
+	ret |= regmap_write(lt->regmap[I2C_CEC_DSI], 0x1c, hactive & 0xff);
+	ret |= regmap_write(lt->regmap[I2C_CEC_DSI], 0x1d, hactive >> 8);
+
+	ret |= regmap_write(lt->regmap[I2C_CEC_DSI], 0x2f, 0x0c);
+
+	ret |= regmap_write(lt->regmap[I2C_CEC_DSI], 0x34, h_total & 0xff);
+	ret |= regmap_write(lt->regmap[I2C_CEC_DSI], 0x35, h_total >> 8);
+
+	ret |= regmap_write(lt->regmap[I2C_CEC_DSI], 0x36, v_total & 0xff);
+	ret |= regmap_write(lt->regmap[I2C_CEC_DSI], 0x37, v_total >> 8);
+
+	ret |= regmap_write(lt->regmap[I2C_CEC_DSI], 0x38, vbp & 0xff);
+	ret |= regmap_write(lt->regmap[I2C_CEC_DSI], 0x39, vbp >> 8);
+
+	ret |= regmap_write(lt->regmap[I2C_CEC_DSI], 0x3a, vfp & 0xff);
+	ret |= regmap_write(lt->regmap[I2C_CEC_DSI], 0x3b, vfp >> 8);
+
+	ret |= regmap_write(lt->regmap[I2C_CEC_DSI], 0x3c, hbp & 0xff);
+	ret |= regmap_write(lt->regmap[I2C_CEC_DSI], 0x3d, hbp >> 8);
+
+	ret |= regmap_write(lt->regmap[I2C_CEC_DSI], 0x3e, hfp & 0xff);
+	ret |= regmap_write(lt->regmap[I2C_CEC_DSI], 0x3f, hfp >> 8);
+
+	return ret;
+}
+
+static int lt8912_soft_power_on(struct lt8912 *lt)
+{
+	if (!lt->is_power_on) {
+		u32 lanes = lt->data_lanes;
+
+		lt8912_write_init_config(lt);
+		regmap_write(lt->regmap[I2C_CEC_DSI], 0x13, lanes & 3);
+
+		lt8912_write_mipi_basic_config(lt);
+
+		lt->is_power_on = true;
+	}
+
+	return 0;
+}
+
+static int lt8912_video_on(struct lt8912 *lt)
+{
+	int ret;
+
+	ret = lt8912_video_setup(lt);
+	if (ret < 0)
+		goto end;
+
+	ret = lt8912_write_dds_config(lt);
+	if (ret < 0)
+		goto end;
+
+	ret = lt8912_write_rxlogicres_config(lt);
+	if (ret < 0)
+		goto end;
+
+	ret = lt8912_write_lvds_config(lt);
+	if (ret < 0)
+		goto end;
+
+end:
+	return ret;
+}
+
+static enum drm_connector_status
+lt8912_connector_detect(struct drm_connector *connector, bool force)
+{
+	struct lt8912 *lt = connector_to_lt8912(connector);
+
+	return drm_bridge_detect(lt->hdmi_port);
+}
+
+static const struct drm_connector_funcs lt8912_connector_funcs = {
+	.detect = lt8912_connector_detect,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_connector_cleanup,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static enum drm_mode_status
+lt8912_connector_mode_valid(struct drm_connector *connector,
+			    struct drm_display_mode *mode)
+{
+	if (mode->clock > 150000)
+		return MODE_CLOCK_HIGH;
+
+	if (mode->hdisplay > 1920)
+		return MODE_BAD_HVALUE;
+
+	if (mode->vdisplay > 1080)
+		return MODE_BAD_VVALUE;
+
+	return MODE_OK;
+}
+
+static int lt8912_connector_get_modes(struct drm_connector *connector)
+{
+	struct edid *edid;
+	int ret, num = 0;
+	struct lt8912 *lt = connector_to_lt8912(connector);
+	u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+
+	edid = drm_bridge_get_edid(lt->hdmi_port, connector);
+	if (edid) {
+		drm_connector_update_edid_property(connector, edid);
+		num = drm_add_edid_modes(connector, edid);
+	} else
+		return ret;
+
+	ret = drm_display_info_set_bus_formats(&connector->display_info,
+					       &bus_format, 1);
+	if (ret)
+		num = ret;
+
+	kfree(edid);
+	return num;
+}
+
+static const struct drm_connector_helper_funcs lt8912_connector_helper_funcs = {
+	.get_modes = lt8912_connector_get_modes,
+	.mode_valid = lt8912_connector_mode_valid,
+};
+
+static void lt8912_bridge_mode_set(struct drm_bridge *bridge,
+				   const struct drm_display_mode *mode,
+				   const struct drm_display_mode *adj)
+{
+	struct lt8912 *lt = bridge_to_lt8912(bridge);
+
+	drm_display_mode_to_videomode(adj, &lt->mode);
+}
+
+static void lt8912_bridge_enable(struct drm_bridge *bridge)
+{
+	struct lt8912 *lt = bridge_to_lt8912(bridge);
+
+	lt8912_video_on(lt);
+}
+
+static int lt8912_attach_dsi(struct lt8912 *lt)
+{
+	struct device *dev = lt->dev;
+	struct mipi_dsi_host *host;
+	struct mipi_dsi_device *dsi;
+	int ret = -1;
+	const struct mipi_dsi_device_info info = { .type = "lt8912",
+						   .channel = 0,
+						   .node = NULL,
+						 };
+
+	host = of_find_mipi_dsi_host_by_node(lt->host_node);
+	if (!host) {
+		dev_err(dev, "failed to find dsi host\n");
+		return -EPROBE_DEFER;
+	}
+
+	dsi = mipi_dsi_device_register_full(host, &info);
+	if (IS_ERR(dsi)) {
+		ret = PTR_ERR(dsi);
+		dev_err(dev, "failed to create dsi device (%d)\n", ret);
+		goto err_dsi_device;
+	}
+
+	lt->dsi = dsi;
+
+	dsi->lanes = lt->data_lanes;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
+			  MIPI_DSI_MODE_VIDEO_BURST |
+			  MIPI_DSI_MODE_LPM |
+			  MIPI_DSI_MODE_EOT_PACKET;
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0) {
+		dev_err(dev, "failed to attach dsi to host\n");
+		goto err_dsi_attach;
+	}
+
+	return 0;
+
+err_dsi_attach:
+	mipi_dsi_device_unregister(dsi);
+err_dsi_device:
+	return ret;
+}
+
+static void lt8912_detach_dsi(struct lt8912 *lt)
+{
+	mipi_dsi_detach(lt->dsi);
+	mipi_dsi_device_unregister(lt->dsi);
+}
+
+static int lt8912_bridge_connector_init(struct drm_bridge *bridge)
+{
+	int ret;
+	struct lt8912 *lt = bridge_to_lt8912(bridge);
+	struct drm_connector *connector = &lt->connector;
+
+	connector->polled = DRM_CONNECTOR_POLL_HPD;
+
+	ret = drm_connector_init(bridge->dev, connector,
+				 &lt8912_connector_funcs,
+				 lt->hdmi_port->type);
+	if (ret)
+		goto exit;
+
+	drm_connector_helper_add(connector, &lt8912_connector_helper_funcs);
+
+	connector->dpms = DRM_MODE_DPMS_OFF;
+	drm_connector_attach_encoder(connector, bridge->encoder);
+exit:
+	return ret;
+}
+
+static int lt8912_bridge_attach(struct drm_bridge *bridge,
+				enum drm_bridge_attach_flags flags)
+{
+	struct lt8912 *lt = bridge_to_lt8912(bridge);
+	int ret;
+
+	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
+		ret = lt8912_bridge_connector_init(bridge);
+		if (ret) {
+			dev_err(lt->dev, "Failed to init bridge ! (%d)\n", ret);
+			return ret;
+		}
+	}
+
+
+	ret = lt8912_hard_power_on(lt);
+	if (ret)
+		return ret;
+
+	ret = lt8912_soft_power_on(lt);
+	if (ret)
+		goto error;
+
+	ret = lt8912_attach_dsi(lt);
+	if (ret)
+		goto error;
+
+	lt->is_attached = true;
+
+	return 0;
+
+error:
+	lt8912_hard_power_off(lt);
+	return ret;
+}
+
+static void lt8912_bridge_detach(struct drm_bridge *bridge)
+{
+	struct lt8912 *lt = bridge_to_lt8912(bridge);
+
+	if (lt->is_attached) {
+		if (lt->hdmi_port->ops & DRM_BRIDGE_OP_HPD)
+			drm_bridge_hpd_disable(lt->hdmi_port);
+		lt8912_detach_dsi(lt);
+		lt8912_hard_power_off(lt);
+	}
+}
+
+static bool lt8912_cable_is_connected(struct lt8912 *lt)
+{
+	int ret;
+	unsigned int reg_val;
+
+	ret = regmap_read(lt->regmap[I2C_MAIN], 0xC1, &reg_val);
+	if (ret)
+		return 0;
+
+	return (reg_val & BIT(7));
+}
+
+static enum drm_connector_status
+lt8912_bridge_detect(struct drm_bridge *bridge)
+{
+	struct lt8912 *lt = bridge_to_lt8912(bridge);
+
+	if (lt->hdmi_port->ops & DRM_BRIDGE_OP_DETECT)
+		return drm_bridge_detect(lt->hdmi_port);
+	else if (lt8912_cable_is_connected(lt))
+		return connector_status_connected;
+
+	return connector_status_disconnected;
+}
+
+static struct edid *lt8912_bridge_get_edid(struct drm_bridge *bridge,
+					       struct drm_connector *connector)
+{
+	struct lt8912 *lt = bridge_to_lt8912(bridge);
+
+	/*
+	 * edid must be read through the ddc bus but it must be
+	 * given to the hdmi connector node.
+	 */
+	if (lt->hdmi_port->ops & DRM_BRIDGE_OP_EDID)
+		return drm_bridge_get_edid(lt->hdmi_port, connector);
+
+	dev_warn(lt->dev, "The connected bridge does not supports DRM_BRIDGE_OP_EDID\n");
+	return NULL;
+}
+
+static const struct drm_bridge_funcs lt8912_bridge_funcs = {
+	.attach = lt8912_bridge_attach,
+	.detach = lt8912_bridge_detach,
+	.mode_set = lt8912_bridge_mode_set,
+	.enable = lt8912_bridge_enable,
+	.detect = lt8912_bridge_detect,
+	.get_edid = lt8912_bridge_get_edid,
+};
+
+static int lt8912_parse_dt(struct lt8912 *lt)
+{
+	struct gpio_desc *gp_reset;
+	struct device *dev = lt->dev;
+	int ret = 0;
+	struct device_node *port_node;
+	struct device_node *endpoint;
+
+	gp_reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(gp_reset)) {
+		ret = PTR_ERR(gp_reset);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Failed to get reset gpio: %d\n", ret);
+		return ret;
+	}
+	lt->gp_reset = gp_reset;
+
+
+	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
+	if (IS_ERR(endpoint)) {
+		ret = PTR_ERR(endpoint);
+		goto end;
+	}
+
+	lt->data_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
+	of_node_put(endpoint);
+
+	lt->host_node = of_graph_get_remote_node(dev->of_node, 0, -1);
+	if (!lt->host_node) {
+		dev_err(lt->dev, "%s: Failed to get remote port\n", __func__);
+		ret = -ENODEV;
+		goto end;
+	}
+
+	port_node = of_graph_get_remote_node(dev->of_node, 1, -1);
+	if (!port_node) {
+		dev_err(lt->dev, "%s: Failed to get connector port\n", __func__);
+		ret = -ENODEV;
+		goto err_free_host_node;
+	}
+
+	lt->hdmi_port = of_drm_find_bridge(port_node);
+	if (IS_ERR(lt->hdmi_port)) {
+		dev_err(lt->dev, "%s: Failed to get hdmi port\n", __func__);
+		ret = PTR_ERR(lt->hdmi_port);
+		of_node_put(lt->host_node);
+		goto end;
+	}
+
+	if (!of_device_is_compatible(port_node, "hdmi-connector")) {
+		dev_err(lt->dev, "%s: Failed to get hdmi port\n", __func__);
+		ret = -EINVAL;
+	}
+
+	of_node_put(port_node);
+
+end:
+	return ret;
+
+err_free_host_node:
+	of_node_put(lt->host_node);
+	return ret;
+}
+
+static int lt8912_put_dt(struct lt8912 *lt)
+{
+	of_node_put(lt->host_node);
+	return 0;
+}
+
+static int lt8912_probe(struct i2c_client *client,
+	 const struct i2c_device_id *id)
+{
+	static struct lt8912 *lt;
+	int ret = 0;
+	struct device *dev = &client->dev;
+
+	lt = devm_kzalloc(dev, sizeof(struct lt8912), GFP_KERNEL);
+	if (!lt)
+		return -ENOMEM;
+
+	lt->dev = dev;
+	lt->i2c_client[0] = client;
+
+	ret = lt8912_parse_dt(lt);
+	if (ret)
+		goto err_dt_parse;
+
+	ret = lt8912_init_i2c(lt, client);
+	if (ret)
+		goto err_i2c;
+
+	i2c_set_clientdata(client, lt);
+
+	lt->bridge.funcs = &lt8912_bridge_funcs;
+	lt->bridge.of_node = dev->of_node;
+	/*
+	 * Here we don't advertise DRM_BRIDGE_OP_HPD because HPD is not
+	 * working yet.
+	 */
+	lt->bridge.ops = (DRM_BRIDGE_OP_EDID |
+			  DRM_BRIDGE_OP_DETECT);
+
+	drm_bridge_add(&lt->bridge);
+
+	return 0;
+
+err_i2c:
+	lt8912_put_dt(lt);
+err_dt_parse:
+	return ret;
+}
+
+static int lt8912_remove(struct i2c_client *client)
+{
+	struct lt8912 *lt = i2c_get_clientdata(client);
+
+	lt8912_bridge_detach(&lt->bridge);
+	drm_bridge_remove(&lt->bridge);
+	lt8912_free_i2c(lt);
+	lt8912_put_dt(lt);
+
+	return 0;
+}
+
+static const struct of_device_id lt8912_dt_match[] = {
+	{.compatible = "lontium,lt8912"},
+	{}
+};
+MODULE_DEVICE_TABLE(of, lt8912_dt_match);
+
+static const struct i2c_device_id lt8912_id[] = {
+	{"lt8912", 0},
+	{},
+};
+MODULE_DEVICE_TABLE(i2c, lt8912_id);
+
+static struct i2c_driver lt8912_i2c_driver = {
+	.driver = {
+		.name = "lt8912",
+		.of_match_table = lt8912_dt_match,
+		.owner = THIS_MODULE,
+	},
+	.probe = lt8912_probe,
+	.remove = lt8912_remove,
+	.id_table = lt8912_id,
+};
+module_i2c_driver(lt8912_i2c_driver);
+
+MODULE_AUTHOR("Adrien Grassein <adrien.grassein@gmail.com>");
+MODULE_DESCRIPTION("lt8912 drm driver");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
