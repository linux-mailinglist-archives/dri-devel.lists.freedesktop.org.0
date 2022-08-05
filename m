Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2494C58A72C
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 09:32:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7888AB2214;
	Fri,  5 Aug 2022 07:28:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 199CCB2D1C
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Aug 2022 07:07:18 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id ha11so1921203pjb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Aug 2022 00:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=jDAc+aMF+FtZiiik9vhKVfAHjJLLW4EwqnGWn9B83Ew=;
 b=T9xkux3pMlHeFfX87zWp3vrLGiOpyfQCVcpMoHLJITE7eIYq9H4aDrs1SCdpMLDQ6e
 L6LlloQIPKK2Cr8BiJQSKHeGy0RPPZ4nx2O4eIsOU067bHEyEg+pNPrjWgXNMqr4iNnn
 zLx9Txv/GG7y5iP7BU8Fydifdcoy4JGCrzqF4pfqceW76rAXSCWCx9Gj08g+ZnMuvG/7
 BsDjRQMMMAziTD9CUwXUzHNaSx1Wn+51rD6hESZ7FIMMewAKvzA5+UuZ0+a57vYqYJhH
 k2vMwHxSVb4IELeMOVJbx7+X2kmM8Lc6bFlqZqJ4KdZWQPXfgni/WcF7PTGAYpaZXCDf
 0mDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=jDAc+aMF+FtZiiik9vhKVfAHjJLLW4EwqnGWn9B83Ew=;
 b=oQXwQNoZg5+S2TGMbNYJDJZDLjeJIJIeoegxVmyfBh67m5qxo5RWQbzKmDT1Mfy/Mx
 Fh8Rt0QAt2ogLk5xgF473mRnJ+gYBRHyiLGsFtJWyKMN5B2v6AHrqW21DlQGE5mxy5pE
 0gYR9GyJEWgmT4MFf5lwWOrjgk7oBK63t7yfHHIqohpgFBbmGe8IKLAu6IMF9mTDdGqW
 EyZ/iI8mNS9n7UMIT8/j3JPzAbjNVVKePWchpSg0Kp9V5CHhPDC8vm+QsctXPBdPfyL4
 lXopfyIVbiBPYlfXkkyedXLr6ZJO0eHhnQ5o0zfqu+jTlN2c29lAwCkyuEmzOd6X324t
 YFsA==
X-Gm-Message-State: ACgBeo1lo6HjQB2JEiD1bcMpZFHW61IqtYsCi+GThoeqCQOtW9BsGPRC
 /kG2+RH2jEeb7xdGzwJHmg8=
X-Google-Smtp-Source: AA6agR47feXupDHnpVpBAWuXh3e2o2kp6c2rqYkxAXZdksraqSXgK8h4d323UWINnJT4RMi4oOBNSA==
X-Received: by 2002:a17:902:778a:b0:16c:a1c9:7b14 with SMTP id
 o10-20020a170902778a00b0016ca1c97b14mr5597546pll.116.1659683238236; 
 Fri, 05 Aug 2022 00:07:18 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-229-62.emome-ip.hinet.net.
 [42.72.229.62]) by smtp.gmail.com with ESMTPSA id
 i5-20020a056a00224500b00525343b5047sm2191616pfu.76.2022.08.05.00.07.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 00:07:17 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de, andy.shevchenko@gmail.com
Subject: [PATCH v7 07/13] mfd: mt6370: Add MediaTek MT6370 support
Date: Fri,  5 Aug 2022 15:06:04 +0800
Message-Id: <20220805070610.3516-8-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220805070610.3516-1-peterwu.pub@gmail.com>
References: <20220805070610.3516-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 szunichen@gmail.com, alice_chen@richtek.com, linux-pm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cy_huang@richtek.com, chiaen_wu@richtek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ChiYuan Huang <cy_huang@richtek.com>

This adds support for the MediaTek MT6370 SubPMIC. MediaTek MT6370 is a
SubPMIC consisting of a single cell battery charger with ADC monitoring,
RGB LEDs, dual channel flashlight, WLED backlight driver, display bias
voltage supply, one general purpose LDO, and the USB Type-C & PD controller
complies with the latest USB Type-C and PD standards.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
---

v7
- Move '#define MT6370_REG_MAXADDR' to the next line of
  '#define MT6370_REG_CHG_MASK1'
- Rename 'MT6370_REG_ADDRLEN' to 'MT6370_MAX_ADDRLEN'
---
 drivers/mfd/Kconfig  |  16 +++
 drivers/mfd/Makefile |   1 +
 drivers/mfd/mt6370.c | 312 +++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/mfd/mt6370.h |  99 ++++++++++++++++
 4 files changed, 428 insertions(+)
 create mode 100644 drivers/mfd/mt6370.c
 create mode 100644 drivers/mfd/mt6370.h

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 9566341..0666bda 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -938,6 +938,22 @@ config MFD_MT6360
 	  PMIC part includes 2-channel BUCKs and 2-channel LDOs
 	  LDO part includes 4-channel LDOs
 
+config MFD_MT6370
+	tristate "MediaTek MT6370 SubPMIC"
+	select MFD_CORE
+	select REGMAP_I2C
+	select REGMAP_IRQ
+	depends on I2C
+	help
+	  Say Y here to enable MT6370 SubPMIC functional support.
+	  It consists of a single cell battery charger with ADC monitoring, RGB
+	  LEDs, dual channel flashlight, WLED backlight driver, display bias
+	  voltage supply, one general purpose LDO, and the USB Type-C & PD
+	  controller complies with the latest USB Type-C and PD standards.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called "mt6370".
+
 config MFD_MT6397
 	tristate "MediaTek MT6397 PMIC Support"
 	select MFD_CORE
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 8c69867..81dbed3 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -173,6 +173,7 @@ obj-$(CONFIG_MFD_MAX8998)	+= max8998.o max8998-irq.o
 obj-$(CONFIG_MFD_MP2629)	+= mp2629.o
 
 obj-$(CONFIG_MFD_MT6360)	+= mt6360-core.o
+obj-$(CONFIG_MFD_MT6370)	+= mt6370.o
 mt6397-objs			:= mt6397-core.o mt6397-irq.o mt6358-irq.o
 obj-$(CONFIG_MFD_MT6397)	+= mt6397.o
 
diff --git a/drivers/mfd/mt6370.c b/drivers/mfd/mt6370.c
new file mode 100644
index 0000000..cf19cce
--- /dev/null
+++ b/drivers/mfd/mt6370.c
@@ -0,0 +1,312 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2022 Richtek Technology Corp.
+ *
+ * Author: ChiYuan Huang <cy_huang@richtek.com>
+ */
+
+#include <linux/bits.h>
+#include <linux/bitfield.h>
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+
+#include "mt6370.h"
+
+#define MT6370_REG_DEV_INFO	0x100
+#define MT6370_REG_CHG_IRQ1	0x1C0
+#define MT6370_REG_CHG_MASK1	0x1E0
+#define MT6370_REG_MAXADDR	0x1FF
+
+#define MT6370_VENID_MASK	GENMASK(7, 4)
+
+#define MT6370_NUM_IRQREGS	16
+#define MT6370_USBC_I2CADDR	0x4E
+#define MT6370_MAX_ADDRLEN	2
+
+#define MT6370_VENID_RT5081	0x8
+#define MT6370_VENID_RT5081A	0xA
+#define MT6370_VENID_MT6370	0xE
+#define MT6370_VENID_MT6371	0xF
+#define MT6370_VENID_MT6372P	0x9
+#define MT6370_VENID_MT6372CP	0xB
+
+static const struct regmap_irq mt6370_irqs[] = {
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_DIRCHGON, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_TREG, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_AICR, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_MIVR, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_PWR_RDY, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_FL_CHG_VINOVP, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_VSYSUV, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_VSYSOV, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_VBATOV, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_VINOVPCHG, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_TS_BAT_COLD, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_TS_BAT_COOL, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_TS_BAT_WARM, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_TS_BAT_HOT, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_TS_STATC, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_FAULT, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_STATC, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_TMR, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_BATABS, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_ADPBAD, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_RVP, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_TSHUTDOWN, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_IINMEAS, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_ICCMEAS, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHGDET_DONE, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_WDTMR, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_SSFINISH, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_RECHG, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_TERM, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_IEOC, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_ADC_DONE, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_PUMPX_DONE, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_BST_BATUV, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_BST_MIDOV, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_BST_OLP, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_ATTACH, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_DETACH, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_HVDCP_STPDONE, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_HVDCP_VBUSDET_DONE, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_HVDCP_DET, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHGDET, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_DCDT, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_DIRCHG_VGOK, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_DIRCHG_WDTMR, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_DIRCHG_UC, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_DIRCHG_OC, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_DIRCHG_OV, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_OVPCTRL_SWON, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_OVPCTRL_UVP_D, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_OVPCTRL_UVP, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_OVPCTRL_OVP_D, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_OVPCTRL_OVP, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED_STRBPIN, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED_TORPIN, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED_TX, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED_LVF, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED2_SHORT, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED1_SHORT, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED2_STRB, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED1_STRB, 8),
+	REGMAP_IRQ_REG_LINE(mT6370_IRQ_FLED2_STRB_TO, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED1_STRB_TO, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED2_TOR, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED1_TOR, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_OTP, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_VDDA_OVP, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_VDDA_UV, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_LDO_OC, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_BLED_OCP, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_BLED_OVP, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_DSV_VNEG_OCP, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_DSV_VPOS_OCP, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_DSV_BST_OCP, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_DSV_VNEG_SCP, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_DSV_VPOS_SCP, 8),
+};
+
+static const struct regmap_irq_chip mt6370_irq_chip = {
+	.name		= "mt6370-irqs",
+	.status_base	= MT6370_REG_CHG_IRQ1,
+	.mask_base	= MT6370_REG_CHG_MASK1,
+	.num_regs	= MT6370_NUM_IRQREGS,
+	.irqs		= mt6370_irqs,
+	.num_irqs	= ARRAY_SIZE(mt6370_irqs),
+};
+
+static const struct resource mt6370_regulator_irqs[] = {
+	DEFINE_RES_IRQ_NAMED(MT6370_IRQ_DSV_VPOS_SCP, "db_vpos_scp"),
+	DEFINE_RES_IRQ_NAMED(MT6370_IRQ_DSV_VNEG_SCP, "db_vneg_scp"),
+	DEFINE_RES_IRQ_NAMED(MT6370_IRQ_DSV_BST_OCP, "db_vbst_ocp"),
+	DEFINE_RES_IRQ_NAMED(MT6370_IRQ_DSV_VPOS_OCP, "db_vpos_ocp"),
+	DEFINE_RES_IRQ_NAMED(MT6370_IRQ_DSV_VNEG_OCP, "db_vneg_ocp"),
+	DEFINE_RES_IRQ_NAMED(MT6370_IRQ_LDO_OC, "ldo_oc"),
+};
+
+static const struct mfd_cell mt6370_devices[] = {
+	MFD_CELL_OF("mt6370-adc",
+		    NULL, NULL, 0, 0, "mediatek,mt6370-adc"),
+	MFD_CELL_OF("mt6370-charger",
+		    NULL, NULL, 0, 0, "mediatek,mt6370-charger"),
+	MFD_CELL_OF("mt6370-flashlight",
+		    NULL, NULL, 0, 0, "mediatek,mt6370-flashlight"),
+	MFD_CELL_OF("mt6370-indicator",
+		    NULL, NULL, 0, 0, "mediatek,mt6370-indicator"),
+	MFD_CELL_OF("mt6370-tcpc",
+		    NULL, NULL, 0, 0, "mediatek,mt6370-tcpc"),
+	MFD_CELL_RES("mt6370-regulator", mt6370_regulator_irqs),
+};
+
+static const struct mfd_cell mt6370_exclusive_devices[] = {
+	MFD_CELL_OF("mt6370-backlight",
+		    NULL, NULL, 0, 0, "mediatek,mt6370-backlight"),
+};
+
+static const struct mfd_cell mt6372_exclusive_devices[] = {
+	MFD_CELL_OF("mt6370-backlight",
+		    NULL, NULL, 0, 0, "mediatek,mt6372-backlight"),
+};
+
+static int mt6370_check_vendor_info(struct device *dev, struct regmap *rmap,
+				    int *vid)
+{
+	unsigned int devinfo;
+	int ret;
+
+	ret = regmap_read(rmap, MT6370_REG_DEV_INFO, &devinfo);
+	if (ret)
+		return ret;
+
+	*vid = FIELD_GET(MT6370_VENID_MASK, devinfo);
+	switch (*vid) {
+	case MT6370_VENID_RT5081:
+	case MT6370_VENID_RT5081A:
+	case MT6370_VENID_MT6370:
+	case MT6370_VENID_MT6371:
+	case MT6370_VENID_MT6372P:
+	case MT6370_VENID_MT6372CP:
+		return 0;
+	default:
+		dev_err(dev, "Unknown Vendor ID 0x%02x\n", devinfo);
+		return -ENODEV;
+	}
+}
+
+static int mt6370_regmap_read(void *context, const void *reg_buf,
+			      size_t reg_size, void *val_buf, size_t val_size)
+{
+	struct mt6370_info *info = context;
+	const u8 *u8_buf = reg_buf;
+	u8 bank_idx, bank_addr;
+	int ret;
+
+	bank_idx = u8_buf[0];
+	bank_addr = u8_buf[1];
+
+	ret = i2c_smbus_read_i2c_block_data(info->i2c[bank_idx], bank_addr,
+					    val_size, val_buf);
+	if (ret < 0)
+		return ret;
+
+	if (ret != val_size)
+		return -EIO;
+
+	return 0;
+}
+
+static int mt6370_regmap_write(void *context, const void *data, size_t count)
+{
+	struct mt6370_info *info = context;
+	const u8 *u8_buf = data;
+	u8 bank_idx, bank_addr;
+	int len = count - MT6370_MAX_ADDRLEN;
+
+	bank_idx = u8_buf[0];
+	bank_addr = u8_buf[1];
+
+	return i2c_smbus_write_i2c_block_data(info->i2c[bank_idx], bank_addr,
+					      len, data + MT6370_MAX_ADDRLEN);
+}
+
+static const struct regmap_bus mt6370_regmap_bus = {
+	.read		= mt6370_regmap_read,
+	.write		= mt6370_regmap_write,
+};
+
+static const struct regmap_config mt6370_regmap_config = {
+	.reg_bits		= 16,
+	.val_bits		= 8,
+	.reg_format_endian	= REGMAP_ENDIAN_BIG,
+	.max_register		= MT6370_REG_MAXADDR,
+};
+
+static int mt6370_probe(struct i2c_client *i2c)
+{
+	struct mt6370_info *info;
+	struct i2c_client *usbc_i2c;
+	struct regmap *regmap;
+	struct device *dev = &i2c->dev;
+	int ret, vid;
+
+	info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	usbc_i2c = devm_i2c_new_dummy_device(dev, i2c->adapter,
+					     MT6370_USBC_I2CADDR);
+	if (IS_ERR(usbc_i2c))
+		return dev_err_probe(dev, PTR_ERR(usbc_i2c),
+				     "Failed to register USBC I2C client\n");
+
+	/* Assign I2C client for PMU and TypeC */
+	info->i2c[MT6370_PMU_I2C] = i2c;
+	info->i2c[MT6370_USBC_I2C] = usbc_i2c;
+
+	regmap = devm_regmap_init(dev, &mt6370_regmap_bus,
+				  info, &mt6370_regmap_config);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap),
+				     "Failed to init regmap\n");
+
+	ret = mt6370_check_vendor_info(dev, regmap, &vid);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to check vendor info\n");
+
+	ret = devm_regmap_add_irq_chip(dev, regmap, i2c->irq,
+				       IRQF_ONESHOT, -1, &mt6370_irq_chip,
+				       &info->irq_data);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add irq chip\n");
+
+	switch (vid) {
+	case MT6370_VENID_MT6372P:
+	case MT6370_VENID_MT6372CP:
+		ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO,
+					   mt6372_exclusive_devices,
+					   ARRAY_SIZE(mt6372_exclusive_devices),
+					   NULL, 0,
+					   regmap_irq_get_domain(info->irq_data));
+		break;
+	default:
+		ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO,
+					   mt6370_exclusive_devices,
+					   ARRAY_SIZE(mt6370_exclusive_devices),
+					   NULL, 0,
+					   regmap_irq_get_domain(info->irq_data));
+		break;
+	}
+
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add the exclusive devices\n");
+
+	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO,
+				    mt6370_devices, ARRAY_SIZE(mt6370_devices),
+				    NULL, 0,
+				    regmap_irq_get_domain(info->irq_data));
+}
+
+static const struct of_device_id mt6370_match_table[] = {
+	{ .compatible = "mediatek,mt6370" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, mt6370_match_table);
+
+static struct i2c_driver mt6370_driver = {
+	.driver = {
+		.name = "mt6370",
+		.of_match_table = mt6370_match_table,
+	},
+	.probe_new = mt6370_probe,
+};
+module_i2c_driver(mt6370_driver);
+
+MODULE_AUTHOR("ChiYuan Huang <cy_huang@richtek.com>");
+MODULE_DESCRIPTION("MediaTek MT6370 SubPMIC Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/mfd/mt6370.h b/drivers/mfd/mt6370.h
new file mode 100644
index 0000000..094e59e
--- /dev/null
+++ b/drivers/mfd/mt6370.h
@@ -0,0 +1,99 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2022 Richtek Technology Corp.
+ *
+ * Author: ChiYuan Huang <cy_huang@richtek.com>
+ */
+
+#ifndef __MFD_MT6370_H__
+#define __MFD_MT6370_H__
+
+/* IRQ definitions */
+#define MT6370_IRQ_DIRCHGON		0
+#define MT6370_IRQ_CHG_TREG		4
+#define MT6370_IRQ_CHG_AICR		5
+#define MT6370_IRQ_CHG_MIVR		6
+#define MT6370_IRQ_PWR_RDY		7
+#define MT6370_IRQ_FL_CHG_VINOVP	11
+#define MT6370_IRQ_CHG_VSYSUV		12
+#define MT6370_IRQ_CHG_VSYSOV		13
+#define MT6370_IRQ_CHG_VBATOV		14
+#define MT6370_IRQ_CHG_VINOVPCHG	15
+#define MT6370_IRQ_TS_BAT_COLD		20
+#define MT6370_IRQ_TS_BAT_COOL		21
+#define MT6370_IRQ_TS_BAT_WARM		22
+#define MT6370_IRQ_TS_BAT_HOT		23
+#define MT6370_IRQ_TS_STATC		24
+#define MT6370_IRQ_CHG_FAULT		25
+#define MT6370_IRQ_CHG_STATC		26
+#define MT6370_IRQ_CHG_TMR		27
+#define MT6370_IRQ_CHG_BATABS		28
+#define MT6370_IRQ_CHG_ADPBAD		29
+#define MT6370_IRQ_CHG_RVP		30
+#define MT6370_IRQ_TSHUTDOWN		31
+#define MT6370_IRQ_CHG_IINMEAS		32
+#define MT6370_IRQ_CHG_ICCMEAS		33
+#define MT6370_IRQ_CHGDET_DONE		34
+#define MT6370_IRQ_WDTMR		35
+#define MT6370_IRQ_SSFINISH		36
+#define MT6370_IRQ_CHG_RECHG		37
+#define MT6370_IRQ_CHG_TERM		38
+#define MT6370_IRQ_CHG_IEOC		39
+#define MT6370_IRQ_ADC_DONE		40
+#define MT6370_IRQ_PUMPX_DONE		41
+#define MT6370_IRQ_BST_BATUV		45
+#define MT6370_IRQ_BST_MIDOV		46
+#define MT6370_IRQ_BST_OLP		47
+#define MT6370_IRQ_ATTACH		48
+#define MT6370_IRQ_DETACH		49
+#define MT6370_IRQ_HVDCP_STPDONE	51
+#define MT6370_IRQ_HVDCP_VBUSDET_DONE	52
+#define MT6370_IRQ_HVDCP_DET		53
+#define MT6370_IRQ_CHGDET		54
+#define MT6370_IRQ_DCDT			55
+#define MT6370_IRQ_DIRCHG_VGOK		59
+#define MT6370_IRQ_DIRCHG_WDTMR		60
+#define MT6370_IRQ_DIRCHG_UC		61
+#define MT6370_IRQ_DIRCHG_OC		62
+#define MT6370_IRQ_DIRCHG_OV		63
+#define MT6370_IRQ_OVPCTRL_SWON		67
+#define MT6370_IRQ_OVPCTRL_UVP_D	68
+#define MT6370_IRQ_OVPCTRL_UVP		69
+#define MT6370_IRQ_OVPCTRL_OVP_D	70
+#define MT6370_IRQ_OVPCTRL_OVP		71
+#define MT6370_IRQ_FLED_STRBPIN		72
+#define MT6370_IRQ_FLED_TORPIN		73
+#define MT6370_IRQ_FLED_TX		74
+#define MT6370_IRQ_FLED_LVF		75
+#define MT6370_IRQ_FLED2_SHORT		78
+#define MT6370_IRQ_FLED1_SHORT		79
+#define MT6370_IRQ_FLED2_STRB		80
+#define MT6370_IRQ_FLED1_STRB		81
+#define mT6370_IRQ_FLED2_STRB_TO	82
+#define MT6370_IRQ_FLED1_STRB_TO	83
+#define MT6370_IRQ_FLED2_TOR		84
+#define MT6370_IRQ_FLED1_TOR		85
+#define MT6370_IRQ_OTP			93
+#define MT6370_IRQ_VDDA_OVP		94
+#define MT6370_IRQ_VDDA_UV		95
+#define MT6370_IRQ_LDO_OC		103
+#define MT6370_IRQ_BLED_OCP		118
+#define MT6370_IRQ_BLED_OVP		119
+#define MT6370_IRQ_DSV_VNEG_OCP		123
+#define MT6370_IRQ_DSV_VPOS_OCP		124
+#define MT6370_IRQ_DSV_BST_OCP		125
+#define MT6370_IRQ_DSV_VNEG_SCP		126
+#define MT6370_IRQ_DSV_VPOS_SCP		127
+
+enum {
+	MT6370_USBC_I2C = 0,
+	MT6370_PMU_I2C,
+	MT6370_MAX_I2C
+};
+
+struct mt6370_info {
+	struct i2c_client *i2c[MT6370_MAX_I2C];
+	struct regmap_irq_chip_data *irq_data;
+};
+
+#endif /* __MFD_MT6375_H__ */
-- 
2.7.4

