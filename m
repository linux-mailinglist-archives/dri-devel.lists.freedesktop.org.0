Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EADA05395BD
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 19:58:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 862AB112850;
	Tue, 31 May 2022 17:58:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB25112AA4
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 11:19:51 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 v11-20020a17090a4ecb00b001e2c5b837ccso2298299pjl.3
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 04:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lVCUf7UwKal2eUwczXgEX6YxihaKUqsjAaTp8vrMqa8=;
 b=q8GZYSvNTidEWkuBQIIpkA5unaMsxo6MwA5dYmrK+Nf+cMdnmzv3dt7lwy+A+C85uK
 kFvmZTZNOsS9PT4ZYBCm2FhlxPclbIUJj7HVrdmM/MpEYK03QA14a/3FxfOs70hO60VJ
 B/0TsOD6e3dtGD5jkhahF0C/GYZ7p9CN2qAUov9LQlx5fL2Jou9EEgTk4ksruQbvWKiF
 dv6RF4v0ZiI2O4A0PK/tStysCqsFnMw8/Be7JEgjcPdFBuZaUopE+zhJ5ISK5Iz6Kx5z
 nrm4br+c4cukJbIfMPFt04HxD3iKTsSWhEn3LSN8s8oJJBXR/cq5rzmAGCfzOHn3wzKe
 7DKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lVCUf7UwKal2eUwczXgEX6YxihaKUqsjAaTp8vrMqa8=;
 b=wH2Ab4BLltRDqZksFlSzwOYw88FWYiurBFMVpfCVFaI2fq3tLghTVpawwNSf5cwRzU
 p2A2f1BntnQsiHgFRkXGZdm7J2lWeXJ8dOTdf/xTHocAysi3j9X3XyNfDr5Cx3l0s0bN
 fYsQKVbcBR0VLz47i29VwW/bYfG7N7S8n/Rjh9MGwnGfbFXjGNPm0OfcsPGVxIVjYWL7
 hDzfUd5R2FI+5lvA99BR9eU4JhM3OtEq1gVea5kOjPcaJ2q6T5g/AwPcLYEWb1l5AdxZ
 3NS+hwxuszWy+W+sfvg5GARnNM7p7mle1zCOB6dZO1o6ccaTq+sgNYW+qwp78f17hd41
 qCnQ==
X-Gm-Message-State: AOAM533+KBbcG6nzF1zNq/XmXE9fOii4O+qBHTVv5ljeFJfdLeNYgLwQ
 Q6GHDR6oNRvHmoZzF4FP+cV4t6l8T4Q=
X-Google-Smtp-Source: ABdhPJz9scdkoQc9wAnHKjY3ELARtEhi14aWXx6SrBSlCoPMHLIyvPIPOOoNGZw71TgwL2jbrBrl1A==
X-Received: by 2002:a17:90b:4f82:b0:1e0:4852:bc5d with SMTP id
 qe2-20020a17090b4f8200b001e04852bc5dmr28231877pjb.64.1653995990802; 
 Tue, 31 May 2022 04:19:50 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-220-172.emome-ip.hinet.net.
 [42.72.220.172]) by smtp.gmail.com with ESMTPSA id
 cm24-20020a056a00339800b00518142f8c37sm10751608pfb.171.2022.05.31.04.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 04:19:50 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
Subject: [RESEND 07/14] mfd: mt6370: Add Mediatek MT6370 support
Date: Tue, 31 May 2022 19:18:53 +0800
Message-Id: <20220531111900.19422-8-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220531111900.19422-1-peterwu.pub@gmail.com>
References: <20220531111900.19422-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 31 May 2022 17:57:56 +0000
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
 alice_chen@richtek.com, linux-pm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cy_huang@richtek.com, chiaen_wu@richtek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 peterwu.pub@gmail.com, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ChiYuan Huang <cy_huang@richtek.com>

Add Mediatek MT6370 MFD support.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 drivers/mfd/Kconfig  |  13 +++
 drivers/mfd/Makefile |   1 +
 drivers/mfd/mt6370.c | 273 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 287 insertions(+)
 create mode 100644 drivers/mfd/mt6370.c

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 3b59456f5545..d9a7524a3e0e 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -937,6 +937,19 @@ config MFD_MT6360
 	  PMIC part includes 2-channel BUCKs and 2-channel LDOs
 	  LDO part includes 4-channel LDOs
 
+config MFD_MT6370
+	tristate "Mediatek MT6370 SubPMIC"
+	select MFD_CORE
+	select REGMAP_I2C
+	select REGMAP_IRQ
+	depends on I2C
+	help
+	  Say Y here to enable MT6370 SubPMIC functional support.
+	  It integrate single cell battery charger with adc monitoring, RGB
+	  LEDs, dual channel flashlight, WLED backlight driver, display bias
+	  voltage supply, one general purpose LDO, and cc logic
+	  controller with USBPD commmunication capable.
+
 config MFD_MT6397
 	tristate "MediaTek MT6397 PMIC Support"
 	select MFD_CORE
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 858cacf659d6..62b27125420e 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -242,6 +242,7 @@ obj-$(CONFIG_INTEL_SOC_PMIC_BXTWC)	+= intel_soc_pmic_bxtwc.o
 obj-$(CONFIG_INTEL_SOC_PMIC_CHTWC)	+= intel_soc_pmic_chtwc.o
 obj-$(CONFIG_INTEL_SOC_PMIC_CHTDC_TI)	+= intel_soc_pmic_chtdc_ti.o
 obj-$(CONFIG_MFD_MT6360)	+= mt6360-core.o
+obj-$(CONFIG_MFD_MT6370)	+= mt6370.o
 mt6397-objs			:= mt6397-core.o mt6397-irq.o mt6358-irq.o
 obj-$(CONFIG_MFD_MT6397)	+= mt6397.o
 obj-$(CONFIG_INTEL_SOC_PMIC_MRFLD)	+= intel_soc_pmic_mrfld.o
diff --git a/drivers/mfd/mt6370.c b/drivers/mfd/mt6370.c
new file mode 100644
index 000000000000..a5a07be7ccc2
--- /dev/null
+++ b/drivers/mfd/mt6370.c
@@ -0,0 +1,273 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <dt-bindings/mfd/mediatek,mt6370.h>
+#include <linux/bitfield.h>
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+
+enum {
+	MT6370_USBC_I2C = 0,
+	MT6370_PMU_I2C,
+	MT6370_MAX_I2C
+};
+
+#define MT6370_REG_DEV_INFO	0x100
+#define MT6370_REG_CHG_IRQ1	0x1C0
+#define MT6370_REG_CHG_MASK1	0x1E0
+
+#define MT6370_VENID_MASK	GENMASK(7, 4)
+
+#define MT6370_NUM_IRQREGS	16
+#define MT6370_USBC_I2CADDR	0x4E
+#define MT6370_REG_ADDRLEN	2
+#define MT6370_REG_MAXADDR	0x1FF
+
+struct mt6370_info {
+	struct i2c_client *i2c[MT6370_MAX_I2C];
+	struct device *dev;
+	struct regmap *regmap;
+	struct regmap_irq_chip_data *irq_data;
+};
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
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_DSV_VPOS_SCP, 8)
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
+	DEFINE_RES_IRQ_NAMED(MT6370_IRQ_LDO_OC, "ldo_oc")
+};
+
+static const struct mfd_cell mt6370_devices[] = {
+	MFD_CELL_OF("adc", NULL, NULL, 0, 0, "mediatek,mt6370-adc"),
+	MFD_CELL_OF("charger", NULL, NULL, 0, 0, "mediatek,mt6370-charger"),
+	MFD_CELL_OF("backlight", NULL, NULL, 0, 0, "mediatek,mt6370-backlight"),
+	MFD_CELL_OF("flashlight", NULL, NULL, 0, 0, "mediatek,mt6370-flashlight"),
+	MFD_CELL_OF("indicator", NULL, NULL, 0, 0, "mediatek,mt6370-indicator"),
+	MFD_CELL_OF("tcpc", NULL, NULL, 0, 0, "mediatek,mt6370-tcpc"),
+	MFD_CELL_RES("regulator", mt6370_regulator_irqs)
+};
+
+static int mt6370_check_vendor_info(struct mt6370_info *info)
+{
+	unsigned int devinfo;
+	int ret;
+
+	ret = regmap_read(info->regmap, MT6370_REG_DEV_INFO, &devinfo);
+	if (ret)
+		return ret;
+
+	switch (FIELD_GET(MT6370_VENID_MASK, devinfo)) {
+	case 0x8: /* RT5081 */
+	case 0xA: /* RT5081A */
+	case 0xE: /* MT6370 */
+	case 0xF: /* MT6371 */
+	case 0x9: /* MT6372P */
+	case 0xB: /* MT6372CP */
+		break;
+	default:
+		dev_err(info->dev, "Not invalid value 0x%02x\n", devinfo);
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static int mt6370_regmap_read(void *context, const void *reg_buf,
+			      size_t reg_size, void *val_buf, size_t val_size)
+{
+	struct mt6370_info *info = context;
+	u8 bank_idx = *(u8 *)reg_buf, bank_addr = *(u8 *)(reg_buf + 1);
+	int ret;
+
+	ret = i2c_smbus_read_i2c_block_data(info->i2c[bank_idx], bank_addr,
+					    val_size, val_buf);
+	if (ret != val_size)
+		return ret;
+
+	return 0;
+}
+
+static int mt6370_regmap_write(void *context, const void *data, size_t count)
+{
+	struct mt6370_info *info = context;
+	u8 bank_idx = *(u8 *)data, bank_addr = *(u8 *)(data + 1);
+	int len = count - MT6370_REG_ADDRLEN;
+
+	return i2c_smbus_write_i2c_block_data(info->i2c[bank_idx], bank_addr,
+					      len, data + MT6370_REG_ADDRLEN);
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
+	int ret;
+
+	info = devm_kzalloc(&i2c->dev, sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	info->dev = &i2c->dev;
+
+	usbc_i2c = devm_i2c_new_dummy_device(&i2c->dev, i2c->adapter,
+					     MT6370_USBC_I2CADDR);
+	if (IS_ERR(usbc_i2c)) {
+		ret = PTR_ERR(usbc_i2c);
+		dev_err(&i2c->dev, "Failed to register usbc i2c client %d\n", ret);
+		return ret;
+	}
+
+	/* Assign I2C client for PMU and TypeC */
+	info->i2c[MT6370_PMU_I2C] = i2c;
+	info->i2c[MT6370_USBC_I2C] = usbc_i2c;
+
+	info->regmap = devm_regmap_init(&i2c->dev, &mt6370_regmap_bus, info,
+					&mt6370_regmap_config);
+	if (IS_ERR(info->regmap)) {
+		ret = PTR_ERR(info->regmap);
+		dev_err(&i2c->dev, "Failed to register regmap (%d)\n", ret);
+		return ret;
+	}
+
+	ret = mt6370_check_vendor_info(info);
+	if (ret) {
+		dev_err(&i2c->dev, "Failed to check vendor info (%d)\n", ret);
+		return ret;
+	}
+
+	ret = devm_regmap_add_irq_chip(&i2c->dev, info->regmap, i2c->irq,
+				       IRQF_ONESHOT, -1, &mt6370_irq_chip,
+				       &info->irq_data);
+	if (ret) {
+		dev_err(&i2c->dev, "Failed to add irq chip (%d)\n", ret);
+		return ret;
+	}
+
+	return devm_mfd_add_devices(&i2c->dev, PLATFORM_DEVID_AUTO,
+				    mt6370_devices, ARRAY_SIZE(mt6370_devices),
+				    NULL, 0,
+				    regmap_irq_get_domain(info->irq_data));
+}
+
+static const struct of_device_id mt6370_match_table[] = {
+	{ .compatible = "mediatek,mt6370", },
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
+MODULE_DESCRIPTION("MT6370 I2C MFD Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1

