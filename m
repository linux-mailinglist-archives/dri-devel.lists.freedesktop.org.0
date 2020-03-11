Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A792D182A7C
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 09:08:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 505946EA3B;
	Thu, 12 Mar 2020 08:08:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4D496E967
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 09:50:58 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id 37so882305pgm.11
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 02:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=pxequpjmYge8y8coKc2oD702ZaGxAg1gYGpyQ7iwEsw=;
 b=mYHuEoVpkqaAaxE6hq3AROX/9SGM4cXSh58Zlo8onEMVd929ji9QBTiyqj9a1/m/KD
 tg3YTIXpePAHAYtdq5CaH1NRqVA83DpR4pOyMk0z5zPmiV9mFG1J23Fx2Vln23Ri55dd
 4uqzSvoUuyddgYVnxhc8p+/x5IoGiN8l1RIyifZ6VzGM5p2/BRniWYs1SlNNZgZ31174
 aBvkKm0UVeqCxuevRGQDnED+hS23/JoUqN1AJRNqfcWbiE2qEfVRPTeBUS+iXrHfyP3S
 abeiNV8fTWjH8Crz2kRqw0S5tKviKRQWOGF/4+0sAvM0LSn/7ishXtB5Vm074znGivsa
 Io9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=pxequpjmYge8y8coKc2oD702ZaGxAg1gYGpyQ7iwEsw=;
 b=G++SGiYQP/MKAOs8cKo9emiseD4acE7MG5eUdCrEazGXhsJtWIC4vU+UHk22br4Ras
 /6WG39t7BFB9BZXDMAq+HYa0PHlPlcQu/RLJTSvpZCcn8htBAR+AqZsEGYF+gLDyJQn9
 e0KW2y2XUgTRENXIYBtSjThQVZeSqMb2UW61YDiz385Pw8ZO/oAbT/5CRY3eKegxv7to
 hy0SvP5Ld4C5NhjlQaIxkTcXHGgToQEpFCokl1ASKLt6X2OL3/Y3K0EarFvfwN75CmXf
 mstQ8fmY7Heaod5oV1c3A0MSSGcVzHUnXHxY6piDS7a7gv2mo3qSZMQc1smbMVtWCBsF
 6d5g==
X-Gm-Message-State: ANhLgQ2N+0PRik5AvKEPvUGbt52OEL5yHEGdNw0dzXF6+5RP+ZDF/6F9
 ERK4qXU4vPOvPoeUSW3oM6kHHyYpx7c=
X-Google-Smtp-Source: ADFU+vsewtU/LU24H7PgjmiV1TIBCRSMKNXQgPX0SrCucnd2BNzHQK6mypL/4a54OPT3nbPxlIhB2g==
X-Received: by 2002:a62:194c:: with SMTP id 73mr1990618pfz.159.1583920258141; 
 Wed, 11 Mar 2020 02:50:58 -0700 (PDT)
Received: from inforce-server-Z9PE-D8-WS.routereb3c90.com ([106.51.138.45])
 by smtp.gmail.com with ESMTPSA id w25sm49919222pfi.106.2020.03.11.02.50.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 11 Mar 2020 02:50:57 -0700 (PDT)
From: Vinay Simha BN <simhavcs@gmail.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 2/2] display/drm/bridge: tc358775 DSI/LVDS driver
Date: Wed, 11 Mar 2020 15:18:25 +0530
Message-Id: <1583920112-2680-2-git-send-email-simhavcs@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583920112-2680-1-git-send-email-simhavcs@gmail.com>
References: <1583920112-2680-1-git-send-email-simhavcs@gmail.com>
X-Mailman-Approved-At: Thu, 12 Mar 2020 08:08:13 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Vinay Simha BN <simhavcs@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dsi2lvds tc358775 bridge driver added
Tested in apq8016, ifc6309 board and panel
auo,b101xtn01

Signed-off-by: Vinay Simha BN <simhavcs@gmail.com>
---
v1:
 Initial version

v2:
* Andrzej Hajda review comments incorporated
  SPDX identifier
  development debug removed
  alphabetic order headers
  u32 instead of unit32_t
  magic numbers to macros for CLRSI and mux registers
  ignored return value

* Laurent Pinchart review comments incorporated
  mdelay to usleep_range
  bus_formats added
---
 drivers/gpu/drm/bridge/Kconfig    |  10 +
 drivers/gpu/drm/bridge/Makefile   |   1 +
 drivers/gpu/drm/bridge/tc358775.c | 688 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 699 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/tc358775.c

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 8397bf7..d5528fa 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -133,6 +133,16 @@ config DRM_TOSHIBA_TC358767
 	---help---
 	  Toshiba TC358767 eDP bridge chip driver.
 
+config DRM_TOSHIBA_TC358775
+        tristate "Toshiba TC358775 LVDS bridge"
+        depends on OF
+        select DRM_KMS_HELPER
+        select REGMAP_I2C
+        select DRM_PANEL
+	select DRM_MIPI_DSI
+        ---help---
+          Toshiba TC358775 LVDS bridge chip driver.
+
 config DRM_TI_TFP410
 	tristate "TI TFP410 DVI/HDMI bridge"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index 1eb5376..9b2c512 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_DRM_SII9234) += sii9234.o
 obj-$(CONFIG_DRM_THINE_THC63LVD1024) += thc63lvd1024.o
 obj-$(CONFIG_DRM_TOSHIBA_TC358764) += tc358764.o
 obj-$(CONFIG_DRM_TOSHIBA_TC358767) += tc358767.o
+obj-$(CONFIG_DRM_TOSHIBA_TC358775) += tc358775.o
 obj-$(CONFIG_DRM_I2C_ADV7511) += adv7511/
 obj-$(CONFIG_DRM_TI_SN65DSI86) += ti-sn65dsi86.o
 obj-$(CONFIG_DRM_TI_TFP410) += ti-tfp410.o
diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
new file mode 100644
index 0000000..28b828e
--- /dev/null
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -0,0 +1,688 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * tc358775 DSI to LVDS bridge driver
+ *
+ * Copyright (C) 2020 InforceComputing
+ * Author: Vinay Simha BN <vinaysimha@inforcecomputing.com>
+ *
+ */
+#define DEBUG
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/slab.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_dp_helper.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_of.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
+
+#define FLD_MASK(start, end)    (((1 << ((start) - (end) + 1)) - 1) << (end))
+#define FLD_VAL(val, start, end) (((val) << (end)) & FLD_MASK(start, end))
+
+/* Registers */
+
+/* DSI D-PHY Layer Registers */
+#define D0W_DPHYCONTTX  0x0004  /* Data Lane 0 DPHY Tx Control */
+#define CLW_DPHYCONTRX  0x0020  /* Clock Lane DPHY Rx Control */
+#define D0W_DPHYCONTRX  0x0024  /* Data Lane 0 DPHY Rx Control */
+#define D1W_DPHYCONTRX  0x0028  /* Data Lane 1 DPHY Rx Control */
+#define D2W_DPHYCONTRX  0x002C  /* Data Lane 2 DPHY Rx Control */
+#define D3W_DPHYCONTRX  0x0030  /* Data Lane 3 DPHY Rx Control */
+#define COM_DPHYCONTRX  0x0038  /* DPHY Rx Common Control */
+#define CLW_CNTRL       0x0040  /* Clock Lane Control */
+#define D0W_CNTRL       0x0044  /* Data Lane 0 Control */
+#define D1W_CNTRL       0x0048  /* Data Lane 1 Control */
+#define D2W_CNTRL       0x004C  /* Data Lane 2 Control */
+#define D3W_CNTRL       0x0050  /* Data Lane 3 Control */
+#define DFTMODE_CNTRL   0x0054  /* DFT Mode Control */
+
+/* DSI PPI Layer Registers */
+#define PPI_STARTPPI    0x0104  /* START control bit of PPI-TX function. */
+#define PPI_BUSYPPI     0x0108
+#define PPI_LINEINITCNT 0x0110  /* Line Initialization Wait Counter  */
+#define PPI_LPTXTIMECNT 0x0114
+#define PPI_LANEENABLE  0x0134  /* Enables each lane at the PPI layer. */
+#define PPI_TX_RX_TA    0x013C  /* DSI Bus Turn Around timing parameters */
+
+/* Analog timer function enable */
+#define PPI_CLS_ATMR    0x0140  /* Delay for Clock Lane in LPRX  */
+#define PPI_D0S_ATMR    0x0144  /* Delay for Data Lane 0 in LPRX */
+#define PPI_D1S_ATMR    0x0148  /* Delay for Data Lane 1 in LPRX */
+#define PPI_D2S_ATMR    0x014C  /* Delay for Data Lane 2 in LPRX */
+#define PPI_D3S_ATMR    0x0150  /* Delay for Data Lane 3 in LPRX */
+
+#define PPI_D0S_CLRSIPOCOUNT    0x0164  /* For lane 0 */
+#define PPI_D1S_CLRSIPOCOUNT    0x0168  /* For lane 1 */
+#define PPI_D2S_CLRSIPOCOUNT    0x016C  /* For lane 2 */
+#define PPI_D3S_CLRSIPOCOUNT    0x0170  /* For lane 3 */
+
+#define CLS_PRE         0x0180  /* Digital Counter inside of PHY IO */
+#define D0S_PRE         0x0184  /* Digital Counter inside of PHY IO */
+#define D1S_PRE         0x0188  /* Digital Counter inside of PHY IO */
+#define D2S_PRE         0x018C  /* Digital Counter inside of PHY IO */
+#define D3S_PRE         0x0190  /* Digital Counter inside of PHY IO */
+#define CLS_PREP        0x01A0  /* Digital Counter inside of PHY IO */
+#define D0S_PREP        0x01A4  /* Digital Counter inside of PHY IO */
+#define D1S_PREP        0x01A8  /* Digital Counter inside of PHY IO */
+#define D2S_PREP        0x01AC  /* Digital Counter inside of PHY IO */
+#define D3S_PREP        0x01B0  /* Digital Counter inside of PHY IO */
+#define CLS_ZERO        0x01C0  /* Digital Counter inside of PHY IO */
+#define D0S_ZERO        0x01C4  /* Digital Counter inside of PHY IO */
+#define D1S_ZERO        0x01C8  /* Digital Counter inside of PHY IO */
+#define D2S_ZERO        0x01CC  /* Digital Counter inside of PHY IO */
+#define D3S_ZERO        0x01D0  /* Digital Counter inside of PHY IO */
+
+#define PPI_CLRFLG      0x01E0  /* PRE Counters has reached set values */
+#define PPI_CLRSIPO     0x01E4  /* Clear SIPO values, Slave mode use only. */
+#define HSTIMEOUT       0x01F0  /* HS Rx Time Out Counter */
+#define HSTIMEOUTENABLE 0x01F4  /* Enable HS Rx Time Out Counter */
+#define DSI_STARTDSI    0x0204  /* START control bit of DSI-TX function */
+#define DSI_BUSYDSI     0x0208
+#define DSI_LANEENABLE  0x0210  /* Enables each lane at the Protocol layer. */
+#define DSI_LANESTATUS0 0x0214  /* Displays lane is in HS RX mode. */
+#define DSI_LANESTATUS1 0x0218  /* Displays lane is in ULPS or STOP state */
+
+#define DSI_INTSTATUS   0x0220  /* Interrupt Status */
+#define DSI_INTMASK     0x0224  /* Interrupt Mask */
+#define DSI_INTCLR      0x0228  /* Interrupt Clear */
+#define DSI_LPTXTO      0x0230  /* Low Power Tx Time Out Counter */
+
+#define DSIERRCNT       0x0300  /* DSI Error Count */
+#define APLCTRL         0x0400  /* Application Layer Control */
+#define RDPKTLN         0x0404  /* Command Read Packet Length */
+
+#define VPCTRL          0x0450  /* Video Path Control */
+#define HTIM1           0x0454  /* Horizontal Timing Control 1 */
+#define HTIM2           0x0458  /* Horizontal Timing Control 2 */
+#define VTIM1           0x045C  /* Vertical Timing Control 1 */
+#define VTIM2           0x0460  /* Vertical Timing Control 2 */
+#define VFUEN           0x0464  /* Video Frame Timing Update Enable */
+
+/* Mux Input Select for LVDS LINK Input */
+#define LV_MX0003        0x0480  /* Bit 0 to 3 */
+#define LV_MX0407        0x0484  /* Bit 4 to 7 */
+#define LV_MX0811        0x0488  /* Bit 8 to 11 */
+#define LV_MX1215        0x048C  /* Bit 12 to 15 */
+#define LV_MX1619        0x0490  /* Bit 16 to 19 */
+#define LV_MX2023        0x0494  /* Bit 20 to 23 */
+#define LV_MX2427        0x0498  /* Bit 24 to 27 */
+#define LV_MX(b0, b1, b2, b3)	(FLD_VAL(b0, 4, 0) | FLD_VAL(b1, 12, 8) | \
+				FLD_VAL(b2, 20, 16) | FLD_VAL(b3, 28, 24))
+
+/* Input bit numbers used in mux registers */
+enum {
+	LVI_R0,
+	LVI_R1,
+	LVI_R2,
+	LVI_R3,
+	LVI_R4,
+	LVI_R5,
+	LVI_R6,
+	LVI_R7,
+	LVI_G0,
+	LVI_G1,
+	LVI_G2,
+	LVI_G3,
+	LVI_G4,
+	LVI_G5,
+	LVI_G6,
+	LVI_G7,
+	LVI_B0,
+	LVI_B1,
+	LVI_B2,
+	LVI_B3,
+	LVI_B4,
+	LVI_B5,
+	LVI_B6,
+	LVI_B7,
+	LVI_HS,
+	LVI_VS,
+	LVI_DE,
+	LVI_L0
+};
+
+#define LVCFG           0x049C  /* LVDS Configuration  */
+#define LVPHY0          0x04A0  /* LVDS PHY 0 */
+#define LVPHY1          0x04A4  /* LVDS PHY 1 */
+#define SYSSTAT         0x0500  /* System Status  */
+#define SYSRST          0x0504  /* System Reset  */
+/* GPIO Registers */
+#define GPIOC           0x0520  /* GPIO Control  */
+#define GPIOO           0x0524  /* GPIO Output  */
+#define GPIOI           0x0528  /* GPIO Input  */
+
+/* I2C Registers */
+#define I2CTIMCTRL      0x0540  /* I2C IF Timing and Enable Control */
+#define I2CMADDR        0x0544  /* I2C Master Addressing */
+#define WDATAQ          0x0548  /* Write Data Queue */
+#define RDATAQ          0x054C  /* Read Data Queue */
+
+/* Chip ID and Revision ID Register */
+#define IDREG           0x0580
+
+#define LPX_PERIOD		4
+#define TTA_GET			0x40000
+#define TTA_SURE		6
+
+#define TC358775XBG_ID  0x00007500
+
+/* Debug Registers */
+#define DEBUG00         0x05A0  /* Debug */
+#define DEBUG01         0x05A4  /* LVDS Data */
+
+#define DSI_CLEN_BIT		BIT(0)
+#define DIVIDE_BY_3		3 /* PCLK=DCLK/3 */
+#define LVCFG_LVEN_BIT		BIT(0)
+
+#define L0EN BIT(1)
+
+
+#define TC358775_VPCTRL_VSDELAY__MASK	0x3FF00000
+#define TC358775_VPCTRL_VSDELAY__SHIFT	20
+static inline u32 TC358775_VPCTRL_VSDELAY(uint32_t val)
+{
+	return ((val) << TC358775_VPCTRL_VSDELAY__SHIFT) &
+			TC358775_VPCTRL_VSDELAY__MASK;
+}
+
+#define TC358775_VPCTRL_OPXLFMT__MASK	0x00000100
+#define TC358775_VPCTRL_OPXLFMT__SHIFT	8
+static inline u32 TC358775_VPCTRL_OPXLFMT(uint32_t val)
+{
+	return ((val) << TC358775_VPCTRL_OPXLFMT__SHIFT) &
+			TC358775_VPCTRL_OPXLFMT__MASK;
+}
+
+#define TC358775_VPCTRL_MSF__MASK	0x00000001
+#define TC358775_VPCTRL_MSF__SHIFT	0
+static inline u32 TC358775_VPCTRL_MSF(uint32_t val)
+{
+	return ((val) << TC358775_VPCTRL_MSF__SHIFT) &
+			TC358775_VPCTRL_MSF__MASK;
+}
+
+#define TC358775_LVCFG_PCLKDIV__MASK	0x000000f0
+#define TC358775_LVCFG_PCLKDIV__SHIFT	4
+static inline u32 TC358775_LVCFG_PCLKDIV(uint32_t val)
+{
+	return ((val) << TC358775_LVCFG_PCLKDIV__SHIFT) &
+			TC358775_LVCFG_PCLKDIV__MASK;
+}
+
+#define TC358775_LVCFG_LVDLINK__MASK                         0x00000002
+#define TC358775_LVCFG_LVDLINK__SHIFT                        0
+static inline u32 TC358775_LVCFG_LVDLINK(uint32_t val)
+{
+	return ((val) << TC358775_LVCFG_LVDLINK__SHIFT) &
+			TC358775_LVCFG_LVDLINK__MASK;
+}
+
+static const char * const regulator_names[] = {
+	"vdd",
+	"vddio"
+};
+
+struct tc_data {
+	struct i2c_client	*i2c;
+
+	struct device		*dev;
+	struct regmap		*regmap;
+
+	struct drm_bridge	bridge;
+	struct drm_connector	connector;
+	struct drm_panel	*panel;
+
+	enum drm_connector_status status;
+	struct device_node *host_node;
+	struct mipi_dsi_device *dsi;
+	u8 num_dsi_lanes;
+
+	struct regulator_bulk_data supplies[ARRAY_SIZE(regulator_names)];
+	struct gpio_desc	*reset_gpio;
+	struct gpio_desc	*stby_gpio;
+	u32                     rev;
+	u8                      dual_link; /* single-link or dual-link */
+};
+
+static inline struct tc_data *bridge_to_tc(struct drm_bridge *b)
+{
+	return container_of(b, struct tc_data, bridge);
+}
+
+static inline struct tc_data *connector_to_tc(struct drm_connector *c)
+{
+	return container_of(c, struct tc_data, connector);
+}
+
+static void tc_bridge_pre_enable(struct drm_bridge *bridge)
+{
+	struct tc_data *tc = bridge_to_tc(bridge);
+	struct device *dev = &tc->dsi->dev;
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(tc->supplies), tc->supplies);
+	if (ret < 0) {
+		dev_err(dev, "regulator enable failed, %d\n", ret);
+		return;
+	}
+	usleep_range(10000, 20000);
+
+	gpiod_set_value(tc->stby_gpio, 0);
+	usleep_range(10, 20);
+
+	gpiod_set_value(tc->reset_gpio, 0);
+	usleep_range(10000, 20000);
+
+	drm_panel_prepare(tc->panel);
+}
+
+static void tc_bridge_disable(struct drm_bridge *bridge)
+{
+	struct tc_data *tc = bridge_to_tc(bridge);
+	struct device *dev = &tc->dsi->dev;
+	int ret;
+
+	ret = regulator_bulk_disable(ARRAY_SIZE(tc->supplies), tc->supplies);
+	if (ret < 0)
+		dev_err(dev, "regulator disable failed, %d\n", ret);
+	usleep_range(30000, 40000);
+
+	drm_panel_disable(tc->panel);
+}
+
+static void tc_bridge_post_disable(struct drm_bridge *bridge)
+{
+	struct tc_data *tc = bridge_to_tc(bridge);
+
+	gpiod_set_value(tc->stby_gpio, 1);
+	usleep_range(10, 20);
+
+	gpiod_set_value(tc->reset_gpio, 1);
+	usleep_range(10000, 20000);
+
+	drm_panel_unprepare(tc->panel);
+}
+
+static int d2l_write(struct tc_data *tc, u16 reg, u32 data)
+{
+	int ret = 0;
+
+	ret = regmap_bulk_write(tc->regmap, reg, (u32[]) {data}, 1);
+
+	return ret;
+}
+
+static void tc_bridge_enable(struct drm_bridge *bridge)
+{
+	struct tc_data *tc = bridge_to_tc(bridge);
+	int ret;
+	u32 hbpr, hpw, htime1, hfpr, hsize, htime2;
+	u32 vbpr, vpw, vtime1, vfpr, vsize, vtime2;
+	u32 val = 0;
+	u16 bus_formats;
+	struct drm_display_mode *mode;
+
+	mode = &bridge->encoder->crtc->state->adjusted_mode;
+
+	hbpr = 0;
+	hpw  = mode->hsync_end - mode->hsync_start;
+	vbpr = 0;
+	vpw  = mode->vsync_end - mode->vsync_start;
+
+	htime1 = (hbpr << 16) + hpw;
+	vtime1 = (vbpr << 16) + vpw;
+
+	hfpr = mode->hsync_start - mode->hdisplay;
+	hsize = mode->hdisplay;
+	vfpr = mode->vsync_start - mode->vdisplay;
+	vsize = mode->vdisplay;
+
+	htime2 = (hfpr << 16) + hsize;
+	vtime2 = (vfpr << 16) + vsize;
+
+	ret = regmap_read(tc->regmap, IDREG, &tc->rev);
+	if (ret) {
+		dev_err(tc->dev, "can not read device ID: %d\n", ret);
+		return;
+	}
+	dev_info(tc->dev, "DSI2LVDS Chip ID.%02x Revision ID. %02x\n",
+			(tc->rev>>8)&0xFF, (tc->rev)&0xFF);
+
+	d2l_write(tc, SYSRST, 0x000000FF);
+	usleep_range(30000, 40000);
+
+	d2l_write(tc, PPI_TX_RX_TA, TTA_GET | TTA_SURE);
+	d2l_write(tc, PPI_LPTXTIMECNT, LPX_PERIOD);
+	d2l_write(tc, PPI_D0S_CLRSIPOCOUNT, 3);
+	d2l_write(tc, PPI_D1S_CLRSIPOCOUNT, 3);
+	d2l_write(tc, PPI_D2S_CLRSIPOCOUNT, 3);
+	d2l_write(tc, PPI_D3S_CLRSIPOCOUNT, 3);
+
+	val = ((L0EN << tc->num_dsi_lanes) - L0EN) | DSI_CLEN_BIT;
+	d2l_write(tc, PPI_LANEENABLE, val);
+	d2l_write(tc, DSI_LANEENABLE, val);
+
+	d2l_write(tc, PPI_STARTPPI, 0x00000001);
+	d2l_write(tc, DSI_STARTDSI, 0x00000001);
+
+	val = TC358775_VPCTRL_VSDELAY(21); //TODO : to set the dynamic value
+
+	bus_formats = tc->connector.display_info.bus_formats[0];
+
+	if (bus_formats == MEDIA_BUS_FMT_RGB888_1X7X4_SPWG
+		|| bus_formats == MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA) {
+		/* RGB888 */
+		val |= TC358775_VPCTRL_OPXLFMT(1);
+		d2l_write(tc, VPCTRL, val);
+	} else {
+		/* RGB666 */
+		val |= TC358775_VPCTRL_MSF(1);
+		d2l_write(tc, VPCTRL, val);
+	}
+
+	d2l_write(tc, HTIM1, htime1);
+	d2l_write(tc, VTIM1, vtime1);
+	d2l_write(tc, HTIM2, htime2);
+	d2l_write(tc, VTIM2, vtime2);
+
+	d2l_write(tc, VFUEN, 0x00000001);
+	d2l_write(tc, SYSRST, 0x00000004);
+	d2l_write(tc, LVPHY0, 0x00040006);
+
+	/* default jeida-24 */
+	if (bus_formats == MEDIA_BUS_FMT_RGB888_1X7X4_SPWG) {
+		/* vesa-24, TODO jeida-18*/
+		d2l_write(tc, LV_MX0003, LV_MX(LVI_R0, LVI_R1, LVI_R2, LVI_R3));
+		d2l_write(tc, LV_MX0407, LV_MX(LVI_R4, LVI_R7, LVI_R5, LVI_G0));
+		d2l_write(tc, LV_MX0811, LV_MX(LVI_G1, LVI_G2, LVI_G6, LVI_G7));
+		d2l_write(tc, LV_MX1215, LV_MX(LVI_G3, LVI_G4, LVI_G5, LVI_B0));
+		d2l_write(tc, LV_MX1619, LV_MX(LVI_B6, LVI_B7, LVI_B1, LVI_B2));
+		d2l_write(tc, LV_MX2023, LV_MX(LVI_B3, LVI_B4, LVI_B5, LVI_L0));
+		d2l_write(tc, LV_MX2427, LV_MX(LVI_HS, LVI_VS, LVI_DE, LVI_R6));
+	}
+
+	d2l_write(tc, VFUEN, 0x00000001);
+
+	val = TC358775_LVCFG_PCLKDIV(DIVIDE_BY_3) | LVCFG_LVEN_BIT;
+	if (tc->dual_link)
+		val |= TC358775_LVCFG_LVDLINK(1);
+
+	d2l_write(tc, LVCFG, val);
+
+	drm_panel_enable(tc->panel);
+}
+
+static int tc_connector_get_modes(struct drm_connector *connector)
+{
+	struct tc_data *tc = connector_to_tc(connector);
+	struct edid *edid;
+	unsigned int count;
+
+	if (tc->panel && tc->panel->funcs && tc->panel->funcs->get_modes) {
+		count = tc->panel->funcs->get_modes(tc->panel, connector);
+		if (count > 0)
+			return count;
+	}
+
+	edid = drm_get_edid(connector, tc->i2c->adapter);
+	if (!edid)
+		return 0;
+
+	drm_connector_update_edid_property(connector, edid);
+	count = drm_add_edid_modes(connector, edid);
+	kfree(edid);
+
+	return count;
+}
+
+static int tc_connector_mode_valid(struct drm_connector *connector,
+				   struct drm_display_mode *mode)
+{
+	struct tc_data *tc = connector_to_tc(connector);
+
+	/* Maximum pixel clock speed 135MHz-single-link/270MHz-dual-link */
+	if ((mode->clock > 135000 && tc->dual_link == 0) ||
+	    (mode->clock > 270000 && tc->dual_link == 1))
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
+static struct drm_encoder *
+tc_connector_best_encoder(struct drm_connector *connector)
+{
+	struct tc_data *tc = connector_to_tc(connector);
+
+	return tc->bridge.encoder;
+}
+
+static const struct drm_connector_helper_funcs tc_connector_helper_funcs = {
+	.get_modes = tc_connector_get_modes,
+	.mode_valid = tc_connector_mode_valid,
+	.best_encoder = tc_connector_best_encoder,
+};
+
+static const struct drm_connector_funcs tc_connector_funcs = {
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_connector_cleanup,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+int tc358775_parse_dt(struct device_node *np, struct tc_data *tc)
+{
+	u32 num_lanes;
+	u8 dual_link;
+
+	of_property_read_u8(np, "tc,dual-link", &dual_link);
+	of_property_read_u32(np, "tc,dsi-lanes", &num_lanes);
+
+	if (num_lanes < 1 || num_lanes > 4)
+		return -EINVAL;
+
+	tc->num_dsi_lanes = num_lanes;
+	tc->dual_link = dual_link;
+
+	tc->host_node = of_graph_get_remote_node(np, 0, 0);
+	if (!tc->host_node)
+		return -ENODEV;
+
+	of_node_put(tc->host_node);
+
+	return 0;
+}
+
+int tc358775_attach_dsi(struct tc_data *tc)
+{
+	struct device *dev = &tc->i2c->dev;
+	struct mipi_dsi_host *host;
+	struct mipi_dsi_device *dsi;
+	int ret = 0;
+	const struct mipi_dsi_device_info info = { .type = "tc358775",
+							.channel = 0,
+							.node = NULL,
+						};
+
+	host = of_find_mipi_dsi_host_by_node(tc->host_node);
+	if (!host) {
+		dev_err(dev, "failed to find dsi host\n");
+		return -EPROBE_DEFER;
+	}
+
+	dsi = mipi_dsi_device_register_full(host, &info);
+	if (IS_ERR(dsi)) {
+		dev_err(dev, "failed to create dsi device\n");
+		ret = PTR_ERR(dsi);
+		goto err_dsi_device;
+	}
+
+	tc->dsi = dsi;
+
+	dsi->lanes = tc->num_dsi_lanes;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO;
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
+static int tc_bridge_attach(struct drm_bridge *bridge)
+{
+	struct tc_data *tc = bridge_to_tc(bridge);
+	struct drm_device *drm = bridge->dev;
+	int ret;
+
+	/* Create LVDS connector */
+	drm_connector_helper_add(&tc->connector, &tc_connector_helper_funcs);
+	ret = drm_connector_init(drm, &tc->connector, &tc_connector_funcs,
+				 DRM_MODE_CONNECTOR_LVDS);
+	if (ret)
+		return ret;
+
+	if (tc->panel)
+		drm_panel_attach(tc->panel, &tc->connector);
+
+	drm_connector_attach_encoder(&tc->connector, tc->bridge.encoder);
+
+	ret = tc358775_attach_dsi(tc);
+
+	return ret;
+}
+
+static const struct drm_bridge_funcs tc_bridge_funcs = {
+	.attach = tc_bridge_attach,
+	.pre_enable = tc_bridge_pre_enable,
+	.enable = tc_bridge_enable,
+	.disable = tc_bridge_disable,
+	.post_disable = tc_bridge_post_disable,
+};
+
+static const struct regmap_config tc_regmap_config = {
+	.name = "tc358775",
+	.reg_bits = 16,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = 0x05A8,
+	.cache_type = REGCACHE_RBTREE,
+	.reg_format_endian = REGMAP_ENDIAN_BIG,
+	.val_format_endian = REGMAP_ENDIAN_LITTLE,
+};
+
+static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
+{
+	struct device *dev = &client->dev;
+	struct tc_data *tc;
+	int ret;
+	unsigned int i;
+
+	tc = devm_kzalloc(dev, sizeof(*tc), GFP_KERNEL);
+	if (!tc)
+		return -ENOMEM;
+
+	tc->dev = dev;
+	tc->i2c = client;
+	tc->status = connector_status_connected;
+
+	/* port@1 is the output port */
+	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &tc->panel, NULL);
+	if (ret && ret != -ENODEV)
+		return ret;
+
+	ret = tc358775_parse_dt(dev->of_node, tc);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < ARRAY_SIZE(tc->supplies); i++)
+		tc->supplies[i].supply = regulator_names[i];
+
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(tc->supplies),
+				      tc->supplies);
+	if (ret < 0)
+		dev_err(dev, "failed to init regulator, ret=%d\n", ret);
+
+	tc->stby_gpio = devm_gpiod_get(dev, "stby", GPIOD_OUT_HIGH);
+	if (IS_ERR(tc->stby_gpio)) {
+		ret = PTR_ERR(tc->stby_gpio);
+		dev_err(dev, "cannot get stby-gpio %d\n", ret);
+		return ret;
+	}
+
+	tc->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(tc->reset_gpio)) {
+		ret = PTR_ERR(tc->reset_gpio);
+		dev_err(dev, "cannot get reset-gpios %d\n", ret);
+		return ret;
+	}
+
+	tc->regmap = devm_regmap_init_i2c(client, &tc_regmap_config);
+	if (IS_ERR(tc->regmap)) {
+		ret = PTR_ERR(tc->regmap);
+		dev_err(dev, "Failed to initialize regmap: %d\n", ret);
+		return ret;
+	}
+
+	tc->bridge.funcs = &tc_bridge_funcs;
+	tc->bridge.of_node = dev->of_node;
+	drm_bridge_add(&tc->bridge);
+
+	i2c_set_clientdata(client, tc);
+
+	return 0;
+}
+
+static int tc_remove(struct i2c_client *client)
+{
+	struct tc_data *tc = i2c_get_clientdata(client);
+
+	drm_bridge_remove(&tc->bridge);
+
+	return 0;
+}
+
+static const struct i2c_device_id tc358775_i2c_ids[] = {
+	{ "tc358775", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, tc358775_i2c_ids);
+
+static const struct of_device_id tc358775_of_ids[] = {
+	{ .compatible = "toshiba,tc358775", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, tc358775_of_ids);
+
+static struct i2c_driver tc358775_driver = {
+	.driver = {
+		.name = "tc358775",
+		.of_match_table = tc358775_of_ids,
+	},
+	.id_table = tc358775_i2c_ids,
+	.probe = tc_probe,
+	.remove	= tc_remove,
+};
+module_i2c_driver(tc358775_driver);
+
+MODULE_AUTHOR("Vinay Simha BN <vinaysimha@inforcecomputing.com>");
+MODULE_DESCRIPTION("tc358775 LVDS encoder driver");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
