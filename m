Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D40762FCF17
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jan 2021 12:22:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 100D86E17F;
	Wed, 20 Jan 2021 11:22:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 224A56E17F
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 11:22:24 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id 31so2458plb.10
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 03:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TmlonZALpi0ukqLkvV+ibJmp6x1XiVHOCHKougV5iHs=;
 b=Gk0upiSZj5X3yQHXLETNCfSNqVkyT5K+F7bKLEuG1FyVW5j7ncBDaBfTJg7uzBKYue
 IjyrVAmZnLI/nuCeGWj5UJmquU7lI1bGTdTeszIQLQIclnyU/PiHAvt3bkTgi1dtA8gO
 MoKpCQ3PmA7tRLNJn5JNFzeeEIFEkjUPsQzUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TmlonZALpi0ukqLkvV+ibJmp6x1XiVHOCHKougV5iHs=;
 b=dZwzhNj3EiabkBduQ1D7hdMoMvoJoMWW7k+gBtmuG02BNRvEvhikgrKks7j9WEAX3W
 GJIzUSVnrkwWQ1cJXUfe7gZla/6/utWNfHtVaA+CLlLRfXJqTPlpks/lIBa1CWBVkz9u
 3prFlcPNoToL1y4+C0tmuHB6rmKRTNLoyaz5yESnzjYVPxq+9eHOlCUlNF96R7C40xi8
 4mbZmUjq7jqMCHThq3GtHc6QAmPx1IPFsUTzyrf3/nTfBaub3LgimB6Q31FFDJQo5I/Q
 LKoQLy2+QJ+Dcg94KtXvkTYqia5ic3Svpu0ZsCWIxD0SbNB84lMhR/jozukfPYIfiRcB
 vgzw==
X-Gm-Message-State: AOAM530inouHo1Ma9gpGsIs49Y9S7TqvfzAw17lhL3L79dimbOZe5zyg
 SNKo4OtHJ0U+UJG6NRHlW/Rgjw==
X-Google-Smtp-Source: ABdhPJzOHDzf8//jS/8NkfH7tZUszwfQ9VbIf6lN7+/5/K+BDhbZztU+O1nXlMz3T634H4aJhhWfRg==
X-Received: by 2002:a17:90a:e393:: with SMTP id
 b19mr5173443pjz.236.1611141743605; 
 Wed, 20 Jan 2021 03:22:23 -0800 (PST)
Received: from ub-XPS-13-9350.domain.name ([103.105.103.154])
 by smtp.gmail.com with ESMTPSA id gk2sm2248341pjb.6.2021.01.20.03.22.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 03:22:22 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 2/2] drm: bridge: Add SN65DSI84 DSI to LVDS bridge
Date: Wed, 20 Jan 2021 16:51:58 +0530
Message-Id: <20210120112158.62109-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210120112158.62109-1-jagan@amarulasolutions.com>
References: <20210120112158.62109-1-jagan@amarulasolutions.com>
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
Cc: devicetree@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>, linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SN65DSI84 is a Single Channel DSI to Dual-link LVDS bridge from
Texas Instruments.

SN65DSI83, SN65DSI85 are variants of the same family of bridge
controllers.

Right now the bridge driver is supporting a single link, dual-link
support requires to initiate I2C Channel B registers.

Tested with STM32MP1 MIPI DSI host design configuration.

Signed-off-by: Matteo Lisi <matteo.lisi@engicam.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 MAINTAINERS                           |   6 +
 drivers/gpu/drm/bridge/Kconfig        |  19 +
 drivers/gpu/drm/bridge/Makefile       |   1 +
 drivers/gpu/drm/bridge/ti-sn65dsi84.c | 488 ++++++++++++++++++++++++++
 4 files changed, 514 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/ti-sn65dsi84.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 12dd1fff2a39..44750ff7640c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5984,6 +5984,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/ti/
 F:	drivers/gpu/drm/omapdrm/
 
+DRM DRIVERS FOR TI SN65DSI84 DSI TO LVDS BRIDGE
+M:	Jagan Teki <jagan@amarulasolutions.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/bridge/ti,sn65dsi84.yaml
+F:	drivers/gpu/drm/bridge/ti-sn65dsi84.c
+
 DRM DRIVERS FOR V3D
 M:	Eric Anholt <eric@anholt.net>
 S:	Supported
diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index e4110d6ca7b3..6494881bffb3 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -232,6 +232,25 @@ config DRM_TI_TFP410
 	help
 	  Texas Instruments TFP410 DVI/HDMI Transmitter driver
 
+config DRM_TI_SN65DSI84
+	tristate "TI SN65DSI84 DSI to LVDS bridge"
+	depends on OF
+	select DRM_KMS_HELPER
+	select REGMAP_I2C
+	select DRM_PANEL
+	select DRM_MIPI_DSI
+	help
+	  Texas Instruments SN65DSI84 Single Channel DSI to Dual-link LVDS
+	  bridge driver.
+
+	  Bridge decodes MIPI DSI 18bpp RGB666 and 240bpp RG888 packets and
+	  converts the formatted video data stream to a FlatLink compatible
+	  LVDS output operating at pixel clocks operating from 25 MHx to
+	  154 MHz.
+
+	  SN65DSI84 offers a Dual-Link LVDS, Single-Link LVDS interface with
+	  four data lanes per link.
+
 config DRM_TI_SN65DSI86
 	tristate "TI SN65DSI86 DSI to eDP bridge"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index 86e7acc76f8d..3906052ef639 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -20,6 +20,7 @@ obj-$(CONFIG_DRM_TOSHIBA_TC358767) += tc358767.o
 obj-$(CONFIG_DRM_TOSHIBA_TC358768) += tc358768.o
 obj-$(CONFIG_DRM_TOSHIBA_TC358775) += tc358775.o
 obj-$(CONFIG_DRM_I2C_ADV7511) += adv7511/
+obj-$(CONFIG_DRM_TI_SN65DSI84) += ti-sn65dsi84.o
 obj-$(CONFIG_DRM_TI_SN65DSI86) += ti-sn65dsi86.o
 obj-$(CONFIG_DRM_TI_TFP410) += ti-tfp410.o
 obj-$(CONFIG_DRM_TI_TPD12S015) += ti-tpd12s015.o
diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi84.c b/drivers/gpu/drm/bridge/ti-sn65dsi84.c
new file mode 100644
index 000000000000..3ed1f9a7d898
--- /dev/null
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi84.c
@@ -0,0 +1,488 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 Engicam srl
+ * Copyright (C) 2021 Amarula Solutions(India)
+ * Author: Jagan Teki <jagan@amarulasolutions.com>
+ */
+
+#include <drm/drm_of.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_print.h>
+#include <drm/drm_mipi_dsi.h>
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+
+/* sn65dsi84 registers */
+#define SN65DSI_SOFT_RESET		0x09
+#define SN65DSI_LVDS_CLK		0x0a
+#define SN65DSI_CLK_DIV			0x0b
+#define SN65DSI_CLK_PLL			0x0d
+#define SN65DSI_DSI_CFG			0x10
+#define SN65DSI_DSI_CLK_EQ		0x11
+#define SN65DSI_DSI_CLK_RANGE		0x12
+#define SN65DSI_LVDS_MODE		0x18
+#define SN65DSI_CHA_LINE_LO		0x20
+#define SN65DSI_CHA_LINE_HI		0x21
+#define SN65DSI_CHA_VIRT_LO		0x24
+#define SN65DSI_CHA_VIRT_HI		0x25
+#define SN65DSI_CHA_SYNC_DELAY_LO	0x28
+#define SN65DSI_CHA_SYNC_DELAY_HI	0x29
+#define SN65DSI_CHA_HSYNC_WIDTH_LO	0x2c
+#define SN65DSI_CHA_HSYNC_WIDTH_HI	0x2d
+#define SN65DSI_CHA_VSYNC_WIDTH_LO	0x30
+#define SN65DSI_CHA_VSYNC_WIDTH_HI	0x31
+#define SN65DSI_CHA_HBACK_PORCH		0x34
+#define SN65DSI_CHA_VBACK_PORCH		0x36
+#define SN65DSI_CHA_HFRONT_PORCH	0x38
+#define SN65DSI_CHA_VFRONT_PORCH	0x3a
+#define SN65DSI_CHA_ERR			0xe5
+
+/* sn65dsi register bits */
+#define SN65DSI_RESET_EN		BIT(0)
+#define SN65DSI_PLL_EN			BIT(0)
+#define SN65DSI_LVDS_CLK_MASK		GENMASK(3, 1)
+#define SN65DSI_LVDS_CLK_SHIFT		1
+#define SN65DSI_LVDS_CLK_SRC_DSI	BIT(0)
+#define SN65DSI_CLK_DIV_MASK		GENMASK(7, 3)
+#define SN65DSI_CLK_DIV_SHIFT		3
+#define SN65DSI_DSI_LANE_MASK		GENMASK(4, 3)
+#define SN65DSI_DSI_LANE_SHIFT		3
+#define SN65DSI_LVDS_LINK_CFG		BIT(4)
+#define SN65DSI_LVDS_CHA_24BPP		BIT(3)
+#define SN65DSI_CHA_LOW_SYNC_DELAY	0x20
+#define SN65DSI_CHA_HIGH_SYNC_DELAY	0x00
+
+struct sn65dsi {
+	struct device			*dev;
+	struct drm_bridge		bridge;
+	struct drm_bridge		*panel_bridge;
+
+	struct device_node		*host_node;
+	struct mipi_dsi_device		*dsi;
+	u8				dsi_lanes;
+
+	struct regmap			*regmap;
+	struct gpio_desc		*enable;
+};
+
+static const struct regmap_config sn65dsi_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = SN65DSI_CHA_ERR,
+	.name = "sn65dsi",
+	.cache_type = REGCACHE_RBTREE,
+};
+
+static inline struct sn65dsi *bridge_to_sn65dsi(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct sn65dsi, bridge);
+}
+
+static struct drm_display_mode *bridge_to_mode(struct drm_bridge *bridge)
+{
+	return &bridge->encoder->crtc->state->mode;
+}
+
+static void sn65dsi_setup_channels(struct sn65dsi *sn,
+				   struct drm_display_mode *mode)
+{
+	u32 hsync_len, hfront_porch, hback_porch;
+	u32 vsync_len, vfront_porch, vback_porch;
+
+	hfront_porch = mode->hsync_start - mode->hdisplay;
+	hsync_len = mode->hsync_end - mode->hsync_start;
+	hback_porch = mode->htotal - mode->hsync_end;
+
+	vfront_porch = mode->vsync_start - mode->vdisplay;
+	vsync_len = mode->vsync_end - mode->vsync_start;
+	vback_porch = mode->vtotal - mode->vsync_end;
+
+	/* cha, lower 8-bits of hdisplay */
+	regmap_write(sn->regmap, SN65DSI_CHA_LINE_LO, mode->hdisplay & 0xff);
+
+	msleep(10);
+
+	/* cha, upper 4-bits of hdisplay */
+	regmap_write(sn->regmap, SN65DSI_CHA_LINE_HI, (mode->hdisplay >> 8) & 0xff);
+
+	msleep(10);
+
+	/* cha, lower 8-bits of vdisplay */
+	regmap_write(sn->regmap, SN65DSI_CHA_VIRT_LO, mode->vdisplay & 0xff);
+
+	msleep(10);
+
+	/* cha, upper 4-bits of vdisplay */
+	regmap_write(sn->regmap, SN65DSI_CHA_VIRT_HI, (mode->vdisplay >> 8) & 0xff);
+
+	msleep(10);
+
+	/*cha, lower sync delay */
+	regmap_write(sn->regmap, SN65DSI_CHA_SYNC_DELAY_LO, SN65DSI_CHA_LOW_SYNC_DELAY);
+
+	msleep(10);
+
+	/*cha, upper sync delay */
+	regmap_write(sn->regmap, SN65DSI_CHA_SYNC_DELAY_HI, SN65DSI_CHA_HIGH_SYNC_DELAY);
+
+	msleep(10);
+
+	/* cha, lower 8-bits of hsync_len */
+	regmap_write(sn->regmap, SN65DSI_CHA_HSYNC_WIDTH_LO, hsync_len & 0xff);
+
+	msleep(10);
+
+	/* cha, upper 2-bits of hsync_len */
+	regmap_write(sn->regmap, SN65DSI_CHA_HSYNC_WIDTH_HI, (hsync_len >> 8) & 0xff);
+
+	msleep(10);
+
+	/* cha, lower 8-bits of vsync_len */
+	regmap_write(sn->regmap, SN65DSI_CHA_VSYNC_WIDTH_LO, vsync_len & 0xff);
+
+	msleep(10);
+
+	/* cha, upper 2-bits of vsync_len */
+	regmap_write(sn->regmap, SN65DSI_CHA_VSYNC_WIDTH_HI, (vsync_len >> 8) & 0xff);
+
+	msleep(10);
+
+	/* cha, hback_porch */
+	regmap_write(sn->regmap, SN65DSI_CHA_HBACK_PORCH, hback_porch & 0xff);
+
+	msleep(10);
+
+	/* cha, vback_porch */
+	regmap_write(sn->regmap, SN65DSI_CHA_VBACK_PORCH, vback_porch & 0xff);
+
+	msleep(10);
+
+	/* cha, hfront_porch */
+	regmap_write(sn->regmap, SN65DSI_CHA_HFRONT_PORCH, hfront_porch & 0xff);
+
+	msleep(10);
+
+	/* cha, vfront_porch */
+	regmap_write(sn->regmap, SN65DSI_CHA_VFRONT_PORCH, vfront_porch & 0xff);
+
+	msleep(10);
+}
+
+static int sn65dsi_get_clk_range(int min, int max, unsigned long clock,
+				 unsigned long start, unsigned long diff)
+{
+	unsigned long next;
+	int i;
+
+	for (i = min; i <= max; i++) {
+		next = start + diff;
+		if (start <= clock && clock < next)
+			return i;
+
+		start += diff;
+	}
+
+	return -EINVAL;
+}
+
+static void sn65dsi_enable(struct drm_bridge *bridge)
+{
+	struct sn65dsi *sn = bridge_to_sn65dsi(bridge);
+	struct drm_display_mode *mode = bridge_to_mode(bridge);
+	int bpp = mipi_dsi_pixel_format_to_bpp(sn->dsi->format);
+	unsigned int lanes = sn->dsi->lanes;
+	unsigned int pixel_clk = mode->clock * 1000;
+	unsigned int dsi_clk = pixel_clk * bpp / (lanes * 2);
+	unsigned int val;
+
+	/* set SOFT_RESET bit */
+	regmap_write(sn->regmap, SN65DSI_SOFT_RESET, SN65DSI_RESET_EN);
+
+	msleep(10);
+
+	/* set PLL_EN bit */
+	regmap_write(sn->regmap, SN65DSI_CLK_PLL, 0x0);
+
+	msleep(10);
+
+	/* setup lvds clock */
+	val = sn65dsi_get_clk_range(0, 5, pixel_clk, 25000000, 25000000);
+	if (val < 0) {
+		DRM_DEV_ERROR(sn->dev, "invalid LVDS clock range %d\n", val);
+		return;
+	}
+
+	regmap_update_bits(sn->regmap, SN65DSI_LVDS_CLK,
+			   SN65DSI_LVDS_CLK_MASK,
+			   val << SN65DSI_LVDS_CLK_SHIFT);
+
+	regmap_update_bits(sn->regmap, SN65DSI_LVDS_CLK,
+			   SN65DSI_LVDS_CLK_SRC_DSI,
+			   SN65DSI_LVDS_CLK_SRC_DSI);
+
+	msleep(10);
+
+	/* setup bridge clock divider */
+	val = (dsi_clk / pixel_clk) - 1;
+	regmap_update_bits(sn->regmap, SN65DSI_CLK_DIV,
+			   SN65DSI_CLK_DIV_MASK,
+			   val << SN65DSI_CLK_DIV_SHIFT);
+	msleep(10);
+
+	/* configure dsi */
+	regmap_update_bits(sn->regmap, SN65DSI_DSI_CFG,
+			   SN65DSI_DSI_LANE_MASK,
+			   lanes << SN65DSI_DSI_LANE_SHIFT);
+	msleep(10);
+
+	/* dsi clock range */
+	val = sn65dsi_get_clk_range(8, 100, dsi_clk, 40000000, 5000000);
+	if (val < 0) {
+		DRM_DEV_ERROR(sn->dev, "invalid DSI clock range %d\n", val);
+		return;
+	}
+
+	regmap_write(sn->regmap, SN65DSI_DSI_CLK_RANGE, val);
+
+	msleep(10);
+
+	/* setup lvds channels */
+	regmap_read(sn->regmap, SN65DSI_LVDS_MODE, &val);
+	if (bpp == 24)
+		val |= SN65DSI_LVDS_CHA_24BPP;
+	regmap_write(sn->regmap, SN65DSI_LVDS_MODE, val);
+
+	msleep(10);
+
+	/* TODO Channel B required to set up for dual-link LVDS */
+	sn65dsi_setup_channels(sn, mode);
+
+	/* set PLL_EN bit */
+	regmap_write(sn->regmap, SN65DSI_CLK_PLL, SN65DSI_PLL_EN);
+
+	msleep(10);
+}
+
+static void sn65dsi_disable(struct drm_bridge *bridge)
+{
+	struct sn65dsi *sn = bridge_to_sn65dsi(bridge);
+
+	/* set PLL_EN bit */
+	regmap_write(sn->regmap, SN65DSI_CLK_PLL, 0x0);
+
+	msleep(10);
+
+	/* set SOFT_RESET bit */
+	regmap_write(sn->regmap, SN65DSI_SOFT_RESET, 0x0);
+
+	msleep(10);
+}
+
+static void sn65dsi_post_disable(struct drm_bridge *bridge)
+{
+	struct sn65dsi *sn = bridge_to_sn65dsi(bridge);
+
+	gpiod_set_value_cansleep(sn->enable, 1);
+
+	msleep(10);
+
+	gpiod_set_value_cansleep(sn->enable, 0);
+
+	msleep(10);
+}
+
+static void sn65dsi_pre_enable(struct drm_bridge *bridge)
+{
+	struct sn65dsi *sn = bridge_to_sn65dsi(bridge);
+
+	gpiod_set_value_cansleep(sn->enable, 0);
+
+	msleep(10);
+
+	gpiod_set_value_cansleep(sn->enable, 1);
+
+	msleep(10);
+}
+
+static int sn65dsi_attach(struct drm_bridge *bridge, enum drm_bridge_attach_flags flags)
+{
+	struct sn65dsi *sn = bridge_to_sn65dsi(bridge);
+	struct mipi_dsi_host *host;
+	struct mipi_dsi_device *dsi;
+	const struct mipi_dsi_device_info info = { .type = "sn65dsi",
+						   .channel = 0,
+						   .node = NULL,
+						 };
+	int ret;
+
+	host = of_find_mipi_dsi_host_by_node(sn->host_node);
+	if (!host) {
+		DRM_DEV_ERROR(sn->dev, "failed to find dsi host\n");
+		return -EPROBE_DEFER;
+	}
+
+	dsi = mipi_dsi_device_register_full(host, &info);
+	if (IS_ERR(dsi)) {
+		DRM_DEV_ERROR(sn->dev, "failed to create dsi device\n");
+		return PTR_ERR(sn->dsi);
+	}
+
+	sn->dsi = dsi;
+	dsi->lanes = sn->dsi_lanes;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO;
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret) {
+		DRM_DEV_ERROR(sn->dev, "failed to attach dsi host\n");
+		goto err_dsi_attach;
+	}
+
+	return drm_bridge_attach(bridge->encoder, sn->panel_bridge,
+				 &sn->bridge, flags);
+
+err_dsi_attach:
+	mipi_dsi_device_unregister(dsi);
+	return ret;
+}
+
+static const struct drm_bridge_funcs sn65dsi_bridge_funcs = {
+	.attach		= sn65dsi_attach,
+	.pre_enable	= sn65dsi_pre_enable,
+	.enable		= sn65dsi_enable,
+	.disable	= sn65dsi_disable,
+	.post_disable	= sn65dsi_post_disable,
+};
+
+static int sn65dsi_parse_dt(struct sn65dsi *sn)
+{
+	struct device *dev = sn->dev;
+	struct device_node *endpoint, *parent;
+	struct property *prop;
+	struct drm_panel *panel;
+	int len = 0;
+	int ret;
+
+	sn->enable = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
+	if (IS_ERR(sn->enable)) {
+		DRM_DEV_ERROR(dev, "failed to get enable gpio\n");
+		return PTR_ERR(sn->enable);
+	}
+
+	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
+	if (ret < 0)
+		return ret;
+	if (!panel)
+		return -ENODEV;
+
+	sn->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
+	if (IS_ERR(sn->panel_bridge))
+		return PTR_ERR(sn->panel_bridge);
+
+	/*
+	 * To get the data-lanes of dsi, we need to access the port1 of dsi_out
+	 * from the port0 of bridge.
+	 */
+	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
+	if (endpoint) {
+		/* dsi_out node */
+		parent = of_graph_get_remote_port_parent(endpoint);
+		of_node_put(endpoint);
+		if (parent) {
+			/* dsi port 1 */
+			endpoint = of_graph_get_endpoint_by_regs(parent, 1, -1);
+			of_node_put(parent);
+			if (endpoint) {
+				prop = of_find_property(endpoint, "data-lanes", &len);
+				of_node_put(endpoint);
+				if (!prop) {
+					DRM_DEV_ERROR(dev, "failed to find data lane\n");
+					return -EPROBE_DEFER;
+				}
+			}
+		}
+	}
+
+	sn->dsi_lanes = len / sizeof(u32);
+	if (sn->dsi_lanes < 1 || sn->dsi_lanes > 4)
+		return -EINVAL;
+
+	sn->host_node = of_graph_get_remote_node(dev->of_node, 0, 0);
+	if (!sn->host_node)
+		return -ENODEV;
+
+	of_node_put(sn->host_node);
+
+	return 0;
+}
+
+static int sn65dsi_probe(struct i2c_client *client)
+{
+	struct sn65dsi *sn;
+	int ret;
+
+	sn = devm_kzalloc(&client->dev, sizeof(*sn), GFP_KERNEL);
+	if (!sn)
+		return -ENOMEM;
+
+	i2c_set_clientdata(client, sn);
+	sn->dev = &client->dev;
+
+	sn->regmap = devm_regmap_init_i2c(client, &sn65dsi_regmap_config);
+	if (IS_ERR(sn->regmap)) {
+		DRM_DEV_ERROR(&client->dev,
+			      "regmap allocation failed (ret = %d)\n", ret);
+		return PTR_ERR(sn->regmap);
+	}
+
+	ret = sn65dsi_parse_dt(sn);
+	if (ret)
+		return ret;
+
+	sn->bridge.funcs = &sn65dsi_bridge_funcs;
+	sn->bridge.of_node = client->dev.of_node;
+
+	drm_bridge_add(&sn->bridge);
+
+	return 0;
+}
+
+static int sn65dsi_remove(struct i2c_client *client)
+{
+	struct sn65dsi *sn = i2c_get_clientdata(client);
+
+	drm_bridge_remove(&sn->bridge);
+
+	return 0;
+}
+
+static struct i2c_device_id sn65dsi_i2c_id[] = {
+	{ "sn65dsi84", 0},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(i2c, sn65dsi_i2c_id);
+
+static const struct of_device_id sn65dsi_match_table[] = {
+	{.compatible = "ti,sn65dsi84"},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, sn65dsi_match_table);
+
+static struct i2c_driver sn65dsi_driver = {
+	.driver = {
+		.name = "ti-sn65dsi84",
+		.of_match_table = sn65dsi_match_table,
+	},
+	.probe_new = sn65dsi_probe,
+	.remove = sn65dsi_remove,
+	.id_table = sn65dsi_i2c_id,
+};
+module_i2c_driver(sn65dsi_driver);
+
+MODULE_AUTHOR("Jagan Teki <jagan@amarulasolutions.com>");
+MODULE_DESCRIPTION("SN65DSI84 DSI to LVDS bridge");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
