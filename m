Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 793FE118274
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 09:40:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AC5F89D02;
	Tue, 10 Dec 2019 08:40:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA9E16E48E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 14:51:42 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id o9so5906557plk.6
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2019 06:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wkr31BcuGIKRbU/y5I32iuJXAa0HvWpiYxphQuZXBlE=;
 b=Kwn0aCF5ZAc/IReb3eYAE5BovnP2NQIg3KZttdyuQpFoRA6sttmjYM3JI3rX2oX4gt
 kHQT0Yro/Ir4VC3wWDlfs6qpZ2OTQPaEjyKN4SQDP40EXFG9QIxC0BnlMAT7oSwmSUYd
 BEIibXETEjLBycnz0mvhs1GtZE3jn9aCRr6eQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wkr31BcuGIKRbU/y5I32iuJXAa0HvWpiYxphQuZXBlE=;
 b=gwKrqmIfq94sU6kBZqvLnWTmk/do2Cw5WSMg6EhC4qI+qHsy5yMBG9jGidE6QDBGS+
 tjxspQkyAXmZpt+HFZkHWm3fb/Ll4mbJFtRAOqGXFG0txYOdWmH1YrqOXXSoUCijUWIu
 Pkq23Jakkvenl0jyaYVuiHsKPu0d3K+Ye37l6U64vn3yNQ4PAblWA/CAzW35pG094Htn
 wLaslTjDTePUT6R38nlfPeaD9DitpYp+NqAS1xKPNl9MyIvNzXTndvvKGjcNOmtVzXAz
 Q9gbz0lF39wFw800Fd4a54sSaadmKDZ3kokqyYvvDBuUYZSH4IUQD+myFm1cISXlEWXT
 L0TA==
X-Gm-Message-State: APjAAAWdUdlEQ1htoT9t7aYOZYbuUrx6hx7UIJlx9c8aLsBMwAUXXqwn
 fdCibQzIfH8Ld0bxyy1Udtp5Q3mHI83hmQ==
X-Google-Smtp-Source: APXvYqwsMOja5csTw+BFyRrAWrm09PKT+KRpdPz2sq8cN/9kiu2drYyM/M61zfXNEaSyKHkzxkF9Ag==
X-Received: by 2002:a17:902:9a97:: with SMTP id
 w23mr30145463plp.79.1575903101988; 
 Mon, 09 Dec 2019 06:51:41 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:b852:bd51:9305:4261])
 by smtp.gmail.com with ESMTPSA id k16sm29143119pfh.97.2019.12.09.06.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2019 06:51:41 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH RESEND 2/4] drm: bridge: anx7688: Add anx7688 bridge driver
 support.
Date: Mon,  9 Dec 2019 22:50:14 +0800
Message-Id: <20191209145016.227784-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.24.0.393.g34dc348eaf-goog
In-Reply-To: <20191209145016.227784-1-hsinyi@chromium.org>
References: <20191209145016.227784-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 10 Dec 2019 08:40:04 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 Archit Taneja <architt@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nicolas Boichat <drinkcat@chromium.org>

ANX7688 is a HDMI to DP converter (as well as USB-C port controller),
that has an internal microcontroller.

The only reason a Linux kernel driver is necessary is to reject
resolutions that require more bandwidth than what is available on
the DP side. DP bandwidth and lane count are reported by the bridge
via 2 registers on I2C.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/bridge/Kconfig            |   9 +
 drivers/gpu/drm/bridge/Makefile           |   1 +
 drivers/gpu/drm/bridge/analogix-anx7688.c | 203 ++++++++++++++++++++++
 3 files changed, 213 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/analogix-anx7688.c

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 34362976cd6f..1f3fc6bec842 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -16,6 +16,15 @@ config DRM_PANEL_BRIDGE
 menu "Display Interface Bridges"
 	depends on DRM && DRM_BRIDGE
 
+config DRM_ANALOGIX_ANX7688
+	tristate "Analogix ANX7688 bridge"
+	select DRM_KMS_HELPER
+	select REGMAP_I2C
+	---help---
+	  ANX7688 is a transmitter to support DisplayPort over USB-C for
+	  smartphone and tablets.
+	  This driver only supports the HDMI to DP component of the chip.
+
 config DRM_ANALOGIX_ANX78XX
 	tristate "Analogix ANX78XX bridge"
 	select DRM_KMS_HELPER
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index 4934fcf5a6f8..7a1e0ec032e6 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_DRM_ANALOGIX_ANX7688) += analogix-anx7688.o
 obj-$(CONFIG_DRM_ANALOGIX_ANX78XX) += analogix-anx78xx.o
 obj-$(CONFIG_DRM_CDNS_DSI) += cdns-dsi.o
 obj-$(CONFIG_DRM_DUMB_VGA_DAC) += dumb-vga-dac.o
diff --git a/drivers/gpu/drm/bridge/analogix-anx7688.c b/drivers/gpu/drm/bridge/analogix-anx7688.c
new file mode 100644
index 000000000000..5a3a2251c1c5
--- /dev/null
+++ b/drivers/gpu/drm/bridge/analogix-anx7688.c
@@ -0,0 +1,203 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * ANX7688 HDMI->DP bridge driver
+ *
+ * Copyright 2016 Google LLC
+ */
+
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_crtc.h>
+
+/* Register addresses */
+#define VENDOR_ID_REG 0x00
+#define DEVICE_ID_REG 0x02
+
+#define FW_VERSION_REG 0x80
+
+#define DP_BANDWIDTH_REG 0x85
+#define DP_LANE_COUNT_REG 0x86
+
+#define VENDOR_ID 0x1f29
+#define DEVICE_ID 0x7688
+
+/* First supported firmware version (0.85) */
+#define MINIMUM_FW_VERSION 0x0085
+
+struct anx7688 {
+	struct drm_bridge bridge;
+	struct i2c_client *client;
+	struct regmap *regmap;
+
+	bool filter;
+};
+
+static inline struct anx7688 *bridge_to_anx7688(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct anx7688, bridge);
+}
+
+static bool anx7688_bridge_mode_fixup(struct drm_bridge *bridge,
+				      const struct drm_display_mode *mode,
+				      struct drm_display_mode *adjusted_mode)
+{
+	struct anx7688 *anx7688 = bridge_to_anx7688(bridge);
+	u8 regs[2];
+	u8 dpbw, lanecount;
+	int totalbw, requiredbw;
+	int ret;
+
+	if (!anx7688->filter)
+		return true;
+
+	/* Read both regs 0x85 (bandwidth) and 0x86 (lane count). */
+	ret = regmap_bulk_read(anx7688->regmap, DP_BANDWIDTH_REG, regs, 2);
+	if (ret < 0) {
+		dev_err(&anx7688->client->dev,
+			"Failed to read bandwidth/lane count\n");
+		return false;
+	}
+	dpbw = regs[0];
+	lanecount = regs[1];
+
+	/* Maximum 0x19 bandwidth (6.75 Gbps Turbo mode), 2 lanes */
+	if (dpbw > 0x19 || lanecount > 2) {
+		dev_err(&anx7688->client->dev,
+			"Invalid bandwidth/lane count (%02x/%d)\n",
+			dpbw, lanecount);
+		return false;
+	}
+
+	/* Compute available bandwidth (kHz) */
+	totalbw = dpbw * lanecount * 270000 * 8 / 10;
+
+	/* Required bandwidth (8 bpc, kHz) */
+	requiredbw = mode->clock * 8 * 3;
+
+	dev_dbg(&anx7688->client->dev,
+		"DP bandwidth: %d kHz (%02x/%d); mode requires %d Khz\n",
+		totalbw, dpbw, lanecount, requiredbw);
+
+	if (totalbw == 0) {
+		dev_warn(&anx7688->client->dev,
+			 "Bandwidth/lane count are 0, not rejecting modes\n");
+		return true;
+	}
+
+	return totalbw >= requiredbw;
+}
+
+static const struct drm_bridge_funcs anx7688_bridge_funcs = {
+	.mode_fixup	= anx7688_bridge_mode_fixup,
+};
+
+static const struct regmap_config anx7688_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
+static int anx7688_i2c_probe(struct i2c_client *client,
+			     const struct i2c_device_id *id)
+{
+	struct anx7688 *anx7688;
+	struct device *dev = &client->dev;
+	int ret;
+	u8 buffer[4];
+	u16 vendor, device, fwversion;
+
+	anx7688 = devm_kzalloc(dev, sizeof(*anx7688), GFP_KERNEL);
+	if (!anx7688)
+		return -ENOMEM;
+
+#if IS_ENABLED(CONFIG_OF)
+	anx7688->bridge.of_node = client->dev.of_node;
+#endif
+
+	anx7688->client = client;
+	i2c_set_clientdata(client, anx7688);
+
+	anx7688->regmap =
+		devm_regmap_init_i2c(client, &anx7688_regmap_config);
+
+	/* Read both vendor and device id (4 bytes). */
+	ret = regmap_bulk_read(anx7688->regmap, VENDOR_ID_REG, buffer, 4);
+	if (ret) {
+		dev_err(dev, "Failed to read chip vendor/device id\n");
+		return ret;
+	}
+
+	vendor = (u16)buffer[1] << 8 | buffer[0];
+	device = (u16)buffer[3] << 8 | buffer[2];
+	if (vendor != VENDOR_ID || device != DEVICE_ID) {
+		dev_err(dev, "Invalid vendor/device id %04x/%04x\n",
+			vendor, device);
+		return -ENODEV;
+	}
+
+	ret = regmap_bulk_read(anx7688->regmap, FW_VERSION_REG, buffer, 2);
+	if (ret) {
+		dev_err(&client->dev, "Failed to read firmware version\n");
+		return ret;
+	}
+
+	fwversion = (u16)buffer[0] << 8 | buffer[1];
+	dev_info(dev, "ANX7688 firwmare version %02x.%02x\n",
+		 buffer[0], buffer[1]);
+
+	/* FW version >= 0.85 supports bandwidth/lane count registers */
+	if (fwversion >= MINIMUM_FW_VERSION) {
+		anx7688->filter = true;
+	} else {
+		/* Warn, but not fail, for backwards compatibility. */
+		dev_warn(dev,
+			 "Old ANX7688 FW version (%02x.%02x), not filtering\n",
+			 buffer[0], buffer[1]);
+	}
+
+	anx7688->bridge.funcs = &anx7688_bridge_funcs;
+	drm_bridge_add(&anx7688->bridge);
+
+	return 0;
+}
+
+static int anx7688_i2c_remove(struct i2c_client *client)
+{
+	struct anx7688 *anx7688 = i2c_get_clientdata(client);
+
+	drm_bridge_remove(&anx7688->bridge);
+
+	return 0;
+}
+
+static const struct i2c_device_id anx7688_id[] = {
+	{ "anx7688", 0 },
+	{ /* sentinel */ }
+};
+
+MODULE_DEVICE_TABLE(i2c, anx7688_id);
+
+#if IS_ENABLED(CONFIG_OF)
+static const struct of_device_id anx7688_match_table[] = {
+	{ .compatible = "analogix,anx7688", },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, anx7688_match_table);
+#endif
+
+static struct i2c_driver anx7688_driver = {
+	.driver = {
+		   .name = "anx7688",
+		   .of_match_table = of_match_ptr(anx7688_match_table),
+		  },
+	.probe = anx7688_i2c_probe,
+	.remove = anx7688_i2c_remove,
+	.id_table = anx7688_id,
+};
+
+module_i2c_driver(anx7688_driver);
+
+MODULE_DESCRIPTION("ANX7688 SlimPort Transmitter driver");
+MODULE_AUTHOR("Nicolas Boichat <drinkcat@chromium.org>");
+MODULE_LICENSE("GPL v2");
-- 
2.24.0.393.g34dc348eaf-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
