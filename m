Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A30F57602B
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jul 2022 13:27:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C349114BFFF;
	Fri, 15 Jul 2022 11:27:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB11B18A001
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 11:27:21 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 z12-20020a17090a7b8c00b001ef84000b8bso11296917pjc.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 04:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K33rLB6DGvF9cfDTQ4Vx/57WmFMD9/ZvqfJKnqH2i/8=;
 b=SnyK4u2LmtP7bxjZMnYgbDpPj9h9Iv34YaKabwFpMrOg4CKwSzJumQpNq6EnYvs7qu
 Dtt6lcLgiMKjqtahgbdAH4T01cGkjY/KSKs6UIv5Q04a8fPDahG1sJjMrxpCtR9Bcff+
 8F0i1NI2x9SuhBGiuLKEl5mN4qrjkClnHpNUgGyImWlX9i3tVyJpu0avRubbk7p9CvF4
 cmwuxwqVjx2/Ie9uxcMOTujAbEsVyBwMFlmgwO7/3uMikEmTNdI+3qdDrJIkQrv/V9fJ
 GKvG0+J8o0p3agAyB2Z8RvpS0B8cz2ghkMl6Vn7T13gu54dow5BYyLhnAFlqci4W+QQy
 IAWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K33rLB6DGvF9cfDTQ4Vx/57WmFMD9/ZvqfJKnqH2i/8=;
 b=PwysuMHzK4J2go0g5OLKL4oVjOX0l9aj+O+Zy/BbmVAV9So/gtq9gLeRLJK3mzoghn
 4Qn/rCdcva6dfyCuAItRZOJoWCGoZ8keMhWrPg/MbvIJqUcsr1V13MaWn6N7ZNfg38Sd
 QE9ONCMv3kmCRxAEoB+kzt1qqjtJncJyRmUhp9/Pn/3OeFsxjAxke1fz9qFk6Zpmu5C+
 4BsFb9h7fN+F103TYFpx0mtTi/RzQQfJyphZtRUHxnDZJSyeMAXCwdBbJowaehlgOElo
 4h5aKzmZqkwE9RqOwbwUwizshdEpWcGHjk8MVnwj5unogKcgqMDNunOIEFlAXXJ20roy
 pg6w==
X-Gm-Message-State: AJIora87k9duqOxhJ0bChzEpQ2Kjv701UB+ycKzPo4YWyzR40+PWiu1T
 8F4E4d+KWi4wtVhzwfp/Y/0=
X-Google-Smtp-Source: AGRyM1u6T0+Pc5dNfQqyGBK2JNlI85+pD6YFt/MN4+m+Bn7/1uz8oN+42aifmdfELsAOD9JggddE/w==
X-Received: by 2002:a17:90b:28d:b0:1f0:47:ca83 with SMTP id
 az13-20020a17090b028d00b001f00047ca83mr21077605pjb.176.1657884441316; 
 Fri, 15 Jul 2022 04:27:21 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-159-86.emome-ip.hinet.net.
 [42.72.159.86]) by smtp.gmail.com with ESMTPSA id
 a5-20020aa78e85000000b00525b61f4792sm3550604pfr.109.2022.07.15.04.27.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jul 2022 04:27:20 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
Subject: [PATCH v5 10/13] power: supply: mt6370: Add MediaTek MT6370 charger
 driver
Date: Fri, 15 Jul 2022 19:26:04 +0800
Message-Id: <20220715112607.591-11-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220715112607.591-1-peterwu.pub@gmail.com>
References: <20220715112607.591-1-peterwu.pub@gmail.com>
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

From: ChiaEn Wu <chiaen_wu@richtek.com>

MediaTek MT6370 is a SubPMIC consisting of a single cell battery charger
with ADC monitoring, RGB LEDs, dual channel flashlight, WLED backlight
driver, display bias voltage supply, one general purpose LDO, and the
USB Type-C & PD controller complies with the latest USB Type-C and PD
standards.

This adds MediaTek MT6370 Charger driver support. The charger module
of MT6370 supports High-Accuracy Voltage/Current Regulation,
Average Input Current Regulation, Battery Temperature Sensing,
Over-Temperature Protection, DPDM Detection for BC1.2.

Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
---

v5
- Replace unsigned int type of pwr_rdy with bool in
  mt6370_chg_set_online()
- Remove redundant 'else' in mt6370_chg_field_get()
- Revise 'if-else' in mt6370_chg_field_set()
- Revise 'if' condition in mt6370_chg_enable_irq()
- Revise all text 'otg' --> 'OTG'
- Revise MT6370_MIVR_IBUS_TH_100_MA --> MT6370_MIVR_IBUS_TH_100_mA
- Revise the description of Kconfig help text
---
 drivers/power/supply/Kconfig          |   14 +
 drivers/power/supply/Makefile         |    1 +
 drivers/power/supply/mt6370-charger.c | 1062 +++++++++++++++++++++++++++++++++
 3 files changed, 1077 insertions(+)
 create mode 100644 drivers/power/supply/mt6370-charger.c

diff --git a/drivers/power/supply/Kconfig b/drivers/power/supply/Kconfig
index 1aa8323..591deb8 100644
--- a/drivers/power/supply/Kconfig
+++ b/drivers/power/supply/Kconfig
@@ -619,6 +619,20 @@ config CHARGER_MT6360
 	  Average Input Current Regulation, Battery Temperature Sensing,
 	  Over-Temperature Protection, DPDM Detection for BC1.2.
 
+config CHARGER_MT6370
+	tristate "MediaTek MT6370 Charger Driver"
+	depends on MFD_MT6370
+	depends on REGULATOR
+	select LINEAR_RANGES
+	help
+	  Say Y here to enable MT6370 Charger Part.
+	  The device supports High-Accuracy Voltage/Current Regulation,
+	  Average Input Current Regulation, Battery Temperature Sensing,
+	  Over-Temperature Protection, DPDM Detection for BC1.2.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called "mt6370-charger".
+
 config CHARGER_QCOM_SMBB
 	tristate "Qualcomm Switch-Mode Battery Charger and Boost"
 	depends on MFD_SPMI_PMIC || COMPILE_TEST
diff --git a/drivers/power/supply/Makefile b/drivers/power/supply/Makefile
index 7f02f36..8c95276 100644
--- a/drivers/power/supply/Makefile
+++ b/drivers/power/supply/Makefile
@@ -82,6 +82,7 @@ obj-$(CONFIG_CHARGER_MAX8997)	+= max8997_charger.o
 obj-$(CONFIG_CHARGER_MAX8998)	+= max8998_charger.o
 obj-$(CONFIG_CHARGER_MP2629)	+= mp2629_charger.o
 obj-$(CONFIG_CHARGER_MT6360)	+= mt6360_charger.o
+obj-$(CONFIG_CHARGER_MT6370)	+= mt6370-charger.o
 obj-$(CONFIG_CHARGER_QCOM_SMBB)	+= qcom_smbb.o
 obj-$(CONFIG_CHARGER_BQ2415X)	+= bq2415x_charger.o
 obj-$(CONFIG_CHARGER_BQ24190)	+= bq24190_charger.o
diff --git a/drivers/power/supply/mt6370-charger.c b/drivers/power/supply/mt6370-charger.c
new file mode 100644
index 0000000..76a8c91
--- /dev/null
+++ b/drivers/power/supply/mt6370-charger.c
@@ -0,0 +1,1062 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2022 Richtek Technology Corp.
+ *
+ * Author: ChiaEn Wu <chiaen_wu@richtek.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/gpio/consumer.h>
+#include <linux/iio/consumer.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/linear_range.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/power_supply.h>
+#include <linux/regmap.h>
+#include <linux/regulator/driver.h>
+#include <linux/workqueue.h>
+
+#define MT6370_REG_CHG_CTRL1		0x111
+#define MT6370_REG_CHG_CTRL2		0x112
+#define MT6370_REG_CHG_CTRL3		0x113
+#define MT6370_REG_CHG_CTRL4		0x114
+#define MT6370_REG_CHG_CTRL5		0x115
+#define MT6370_REG_CHG_CTRL6		0x116
+#define MT6370_REG_CHG_CTRL7		0x117
+#define MT6370_REG_CHG_CTRL8		0x118
+#define MT6370_REG_CHG_CTRL9		0x119
+#define MT6370_REG_CHG_CTRL10		0x11A
+#define MT6370_REG_DEVICE_TYPE		0x122
+#define MT6370_REG_USB_STATUS1		0x127
+#define MT6370_REG_CHG_STAT		0x14A
+#define MT6370_REG_FLED_EN		0x17E
+#define MT6370_REG_CHG_STAT1		0X1D0
+#define MT6370_REG_OVPCTRL_STAT		0x1D8
+
+#define MT6370_VOBST_MASK		GENMASK(7, 2)
+#define MT6370_OTG_PIN_EN_MASK		BIT(1)
+#define MT6370_OPA_MODE_MASK		BIT(0)
+#define MT6370_OTG_OC_MASK		GENMASK(2, 0)
+
+#define MT6370_MIVR_IBUS_TH_100_mA	100000
+#define MT6370_ADC_CHAN_IBUS		5
+#define MT6370_ADC_CHAN_MAX		9
+
+enum mt6370_chg_reg_field {
+	/* MT6370_REG_CHG_CTRL2 */
+	F_IINLMTSEL, F_CFO_EN, F_CHG_EN,
+	/* MT6370_REG_CHG_CTRL3 */
+	F_IAICR, F_AICR_EN, F_ILIM_EN,
+	/* MT6370_REG_CHG_CTRL4 */
+	F_VOREG,
+	/* MT6370_REG_CHG_CTRL6 */
+	F_VMIVR,
+	/* MT6370_REG_CHG_CTRL7 */
+	F_ICHG,
+	/* MT6370_REG_CHG_CTRL8 */
+	F_IPREC,
+	/* MT6370_REG_CHG_CTRL9 */
+	F_IEOC,
+	/* MT6370_REG_DEVICE_TYPE */
+	F_USBCHGEN,
+	/* MT6370_REG_USB_STATUS1 */
+	F_USB_STAT, F_CHGDET,
+	/* MT6370_REG_CHG_STAT */
+	F_CHG_STAT, F_BOOST_STAT, F_VBAT_LVL,
+	/* MT6370_REG_FLED_EN */
+	F_FL_STROBE,
+	/* MT6370_REG_CHG_STAT1 */
+	F_CHG_MIVR_STAT,
+	/* MT6370_REG_OVPCTRL_STAT */
+	F_UVP_D_STAT,
+	F_MAX
+};
+
+struct mt6370_priv {
+	struct device *dev;
+	struct iio_channel *iio_adcs;
+	struct mutex attach_lock;
+	struct power_supply *psy;
+	struct power_supply_desc *psy_desc;
+	struct regmap *regmap;
+	struct regmap_field *rmap_fields[F_MAX];
+	struct regulator_dev *rdev;
+	struct workqueue_struct *wq;
+	struct work_struct bc12_work;
+	struct delayed_work mivr_dwork;
+	int attach;
+	int psy_usb_type;
+	bool pwr_rdy;
+};
+
+enum mt6370_usb_status {
+	MT6370_USB_STAT_NO_VBUS = 0,
+	MT6370_USB_STAT_VBUS_FLOW_IS_UNDER_GOING,
+	MT6370_USB_STAT_SDP,
+	MT6370_USB_STAT_SDP_NSTD,
+	MT6370_USB_STAT_DCP,
+	MT6370_USB_STAT_CDP,
+	MT6370_USB_STAT_MAX
+};
+
+struct mt6370_chg_field {
+	const char *name;
+	const struct linear_range *range;
+	struct reg_field field;
+};
+
+enum {
+	MT6370_RANGE_F_IAICR = 0,
+	MT6370_RANGE_F_VOREG,
+	MT6370_RANGE_F_VMIVR,
+	MT6370_RANGE_F_ICHG,
+	MT6370_RANGE_F_IPREC,
+	MT6370_RANGE_F_IEOC,
+	MT6370_RANGE_F_MAX
+};
+
+#define MT6370_CHG_LINEAR_RANGE(_rfd, _min, _min_sel, _max_sel, _step)	\
+[_rfd] = {								\
+	.min = _min,							\
+	.min_sel = _min_sel,						\
+	.max_sel = _max_sel,						\
+	.step = _step,							\
+}
+
+/* unit: mA or mV */
+static const struct linear_range mt6370_chg_ranges[MT6370_RANGE_F_MAX] = {
+	MT6370_CHG_LINEAR_RANGE(MT6370_RANGE_F_IAICR, 100, 0x0, 0x3F, 50),
+	MT6370_CHG_LINEAR_RANGE(MT6370_RANGE_F_VOREG, 3900, 0x0, 0x51, 10),
+	MT6370_CHG_LINEAR_RANGE(MT6370_RANGE_F_VMIVR, 3900, 0x0, 0x5F, 100),
+	MT6370_CHG_LINEAR_RANGE(MT6370_RANGE_F_ICHG, 900, 0x08, 0x31, 100),
+	MT6370_CHG_LINEAR_RANGE(MT6370_RANGE_F_IPREC, 100, 0x0, 0x0F, 50),
+	MT6370_CHG_LINEAR_RANGE(MT6370_RANGE_F_IEOC, 100, 0x0, 0x0F, 50),
+};
+
+#define MT6370_CHG_FIELD(_fd, _reg, _lsb, _msb)				\
+[_fd] = {								\
+	.name = #_fd,							\
+	.range = NULL,							\
+	.field = REG_FIELD(_reg, _lsb, _msb),				\
+}
+
+#define MT6370_CHG_FIELD_RANGE(_fd, _reg, _lsb, _msb)			\
+[_fd] = {								\
+	.name = #_fd,							\
+	.range = &mt6370_chg_ranges[MT6370_RANGE_##_fd],		\
+	.field = REG_FIELD(_reg, _lsb, _msb),				\
+}
+
+static const struct mt6370_chg_field mt6370_chg_fields[F_MAX] = {
+	MT6370_CHG_FIELD(F_IINLMTSEL, MT6370_REG_CHG_CTRL2, 2, 3),
+	MT6370_CHG_FIELD(F_CFO_EN, MT6370_REG_CHG_CTRL2, 1, 1),
+	MT6370_CHG_FIELD(F_CHG_EN, MT6370_REG_CHG_CTRL2, 0, 0),
+	MT6370_CHG_FIELD_RANGE(F_IAICR, MT6370_REG_CHG_CTRL3, 2, 7),
+	MT6370_CHG_FIELD(F_AICR_EN, MT6370_REG_CHG_CTRL3, 1, 1),
+	MT6370_CHG_FIELD(F_ILIM_EN, MT6370_REG_CHG_CTRL3, 0, 0),
+	MT6370_CHG_FIELD_RANGE(F_VOREG, MT6370_REG_CHG_CTRL4, 1, 7),
+	MT6370_CHG_FIELD_RANGE(F_VMIVR, MT6370_REG_CHG_CTRL6, 1, 7),
+	MT6370_CHG_FIELD_RANGE(F_ICHG, MT6370_REG_CHG_CTRL7, 2, 7),
+	MT6370_CHG_FIELD_RANGE(F_IPREC, MT6370_REG_CHG_CTRL8, 0, 3),
+	MT6370_CHG_FIELD_RANGE(F_IEOC, MT6370_REG_CHG_CTRL9, 4, 7),
+	MT6370_CHG_FIELD(F_USBCHGEN, MT6370_REG_DEVICE_TYPE, 7, 7),
+	MT6370_CHG_FIELD(F_USB_STAT, MT6370_REG_USB_STATUS1, 4, 6),
+	MT6370_CHG_FIELD(F_CHGDET, MT6370_REG_USB_STATUS1, 3, 3),
+	MT6370_CHG_FIELD(F_CHG_STAT, MT6370_REG_CHG_STAT, 6, 7),
+	MT6370_CHG_FIELD(F_BOOST_STAT, MT6370_REG_CHG_STAT, 3, 3),
+	MT6370_CHG_FIELD(F_VBAT_LVL, MT6370_REG_CHG_STAT, 5, 5),
+	MT6370_CHG_FIELD(F_FL_STROBE, MT6370_REG_FLED_EN, 2, 2),
+	MT6370_CHG_FIELD(F_CHG_MIVR_STAT, MT6370_REG_CHG_STAT1, 6, 6),
+	MT6370_CHG_FIELD(F_UVP_D_STAT, MT6370_REG_OVPCTRL_STAT, 4, 4),
+};
+
+static inline int mt6370_chg_field_get(struct mt6370_priv *priv,
+				       enum mt6370_chg_reg_field fd,
+				       unsigned int *val)
+{
+	int ret;
+	unsigned int reg_val;
+
+	ret = regmap_field_read(priv->rmap_fields[fd], &reg_val);
+	if (ret < 0)
+		return ret;
+
+	if (mt6370_chg_fields[fd].range)
+		return linear_range_get_value(mt6370_chg_fields[fd].range,
+					      reg_val, val);
+
+	*val = reg_val;
+	return 0;
+}
+
+static inline int mt6370_chg_field_set(struct mt6370_priv *priv,
+				       enum mt6370_chg_reg_field fd,
+				       unsigned int val)
+{
+	int ret;
+	bool f;
+	const struct linear_range *r;
+
+	if (mt6370_chg_fields[fd].range) {
+		r = mt6370_chg_fields[fd].range;
+
+		if (fd == F_VMIVR) {
+			ret = linear_range_get_selector_high(r, val, &val, &f);
+			if (!ret)
+				val = r->max_sel;
+		} else {
+			linear_range_get_selector_within(r, val, &val);
+		}
+	}
+
+	return regmap_field_write(priv->rmap_fields[fd], val);
+}
+
+enum {
+	MT6370_CHG_STAT_READY = 0,
+	MT6370_CHG_STAT_CHARGE_IN_PROGRESS,
+	MT6370_CHG_STAT_DONE,
+	MT6370_CHG_STAT_FAULT,
+	MT6370_CHG_STAT_MAX
+};
+
+enum {
+	MT6370_ATTACH_STAT_DETACH = 0,
+	MT6370_ATTACH_STAT_ATTACH_BC12_NOT_DONE,
+	MT6370_ATTACH_STAT_ATTACH_BC12_DONE,
+	MT6370_ATTACH_STAT_ATTACH_MAX
+};
+
+static int mt6370_chg_otg_of_parse_cb(struct device_node *of,
+				      const struct regulator_desc *rdesc,
+				      struct regulator_config *rcfg)
+{
+	struct mt6370_priv *priv = rcfg->driver_data;
+
+	rcfg->ena_gpiod = fwnode_gpiod_get_index(of_fwnode_handle(of),
+						 "enable", 0, GPIOD_OUT_LOW |
+						 GPIOD_FLAGS_BIT_NONEXCLUSIVE,
+						 rdesc->name);
+	if (IS_ERR(rcfg->ena_gpiod)) {
+		rcfg->ena_gpiod = NULL;
+		return 0;
+	}
+
+	return regmap_update_bits(priv->regmap, MT6370_REG_CHG_CTRL1,
+				  MT6370_OTG_PIN_EN_MASK,
+				  MT6370_OTG_PIN_EN_MASK);
+}
+
+static void mt6370_chg_bc12_work_func(struct work_struct *work)
+{
+	struct mt6370_priv *priv = container_of(work, struct mt6370_priv,
+						bc12_work);
+	int ret;
+	bool rpt_psy = false;
+	unsigned int attach, usb_stat;
+
+	mutex_lock(&priv->attach_lock);
+	attach = priv->attach;
+
+	switch (attach) {
+	case MT6370_ATTACH_STAT_DETACH:
+		usb_stat = 0;
+		break;
+	case MT6370_ATTACH_STAT_ATTACH_BC12_DONE:
+		ret = mt6370_chg_field_get(priv, F_USB_STAT, &usb_stat);
+		if (ret < 0) {
+			dev_err(priv->dev, "Failed to get USB status\n");
+			goto bc12_work_func_out;
+		}
+		break;
+	case MT6370_ATTACH_STAT_ATTACH_BC12_NOT_DONE:
+		ret = mt6370_chg_field_set(priv, F_USBCHGEN, attach);
+		if (ret < 0)
+			dev_err(priv->dev, "Failed to enable USB CHG EN\n");
+		goto bc12_work_func_out;
+	default:
+		dev_err(priv->dev, "Invalid attach state\n");
+		goto bc12_work_func_out;
+	}
+
+	rpt_psy = true;
+
+	switch (usb_stat) {
+	case MT6370_USB_STAT_SDP:
+		priv->psy_desc->type = POWER_SUPPLY_TYPE_USB;
+		priv->psy_usb_type = POWER_SUPPLY_USB_TYPE_SDP;
+		break;
+	case MT6370_USB_STAT_SDP_NSTD:
+		priv->psy_desc->type = POWER_SUPPLY_TYPE_USB;
+		priv->psy_usb_type = POWER_SUPPLY_USB_TYPE_DCP;
+		break;
+	case MT6370_USB_STAT_DCP:
+		priv->psy_desc->type = POWER_SUPPLY_TYPE_USB_DCP;
+		priv->psy_usb_type = POWER_SUPPLY_USB_TYPE_DCP;
+		break;
+	case MT6370_USB_STAT_CDP:
+		priv->psy_desc->type = POWER_SUPPLY_TYPE_USB_CDP;
+		priv->psy_usb_type = POWER_SUPPLY_USB_TYPE_CDP;
+		break;
+	case MT6370_USB_STAT_NO_VBUS:
+	case MT6370_USB_STAT_VBUS_FLOW_IS_UNDER_GOING:
+	default:
+		priv->psy_desc->type = POWER_SUPPLY_TYPE_USB;
+		priv->psy_usb_type = POWER_SUPPLY_USB_TYPE_UNKNOWN;
+		break;
+	}
+
+bc12_work_func_out:
+	mutex_unlock(&priv->attach_lock);
+
+	if (rpt_psy)
+		power_supply_changed(priv->psy);
+}
+
+static inline void mt6370_chg_enable_irq(struct mt6370_priv *priv,
+					 const char *irq_name, bool en)
+{
+	int irq_num;
+	struct platform_device *pdev = to_platform_device(priv->dev);
+
+	irq_num = platform_get_irq_byname(pdev, irq_name);
+	if (irq_num < 0)
+		return;
+
+	if (en)
+		enable_irq(irq_num);
+	else
+		disable_irq_nosync(irq_num);
+}
+
+static int mt6370_chg_toggle_cfo(struct mt6370_priv *priv)
+{
+	int ret;
+	unsigned int fl_strobe;
+
+	/* check if flash led in strobe mode */
+	ret = mt6370_chg_field_get(priv, F_FL_STROBE, &fl_strobe);
+	if (ret < 0) {
+		dev_err(priv->dev, "Failed to get FL_STROBE_EN\n");
+		return ret;
+	}
+
+	if (fl_strobe) {
+		dev_err(priv->dev, "Flash led is still in strobe mode\n");
+		return ret;
+	}
+
+	/* cfo off */
+	ret = mt6370_chg_field_set(priv, F_CFO_EN, 0);
+	if (ret < 0) {
+		dev_err(priv->dev, "Failed to disable CFO_EN\n");
+		return ret;
+	}
+
+	/* cfo on */
+	ret = mt6370_chg_field_set(priv, F_CFO_EN, 1);
+	if (ret < 0)
+		dev_err(priv->dev, "Failed to enable CFO_EN\n");
+
+	return ret;
+}
+
+static int mt6370_chg_read_adc_chan(struct mt6370_priv *priv, unsigned int chan,
+				    int *val)
+{
+	int ret;
+
+	if (chan >= MT6370_ADC_CHAN_MAX)
+		return -EINVAL;
+
+	ret = iio_read_channel_processed(&priv->iio_adcs[chan], val);
+	if (ret)
+		dev_err(priv->dev, "Failed to read ADC\n");
+
+	return ret;
+}
+
+static void mt6370_chg_mivr_dwork_func(struct work_struct *work)
+{
+	struct mt6370_priv *priv = container_of(work, struct mt6370_priv,
+						mivr_dwork.work);
+	int ret;
+	unsigned int mivr_stat, ibus;
+
+	ret = mt6370_chg_field_get(priv, F_CHG_MIVR_STAT, &mivr_stat);
+	if (ret < 0) {
+		dev_err(priv->dev, "Failed to get mivr state\n");
+		goto mivr_handler_out;
+	}
+
+	if (!mivr_stat)
+		goto mivr_handler_out;
+
+	ret = mt6370_chg_read_adc_chan(priv, MT6370_ADC_CHAN_IBUS, &ibus);
+	if (ret) {
+		dev_err(priv->dev, "Failed to get ibus\n");
+		goto mivr_handler_out;
+	}
+
+	if (ibus < MT6370_MIVR_IBUS_TH_100_mA) {
+		ret = mt6370_chg_toggle_cfo(priv);
+		if (ret)
+			dev_err(priv->dev, "Failed to toggle cfo\n");
+	}
+
+mivr_handler_out:
+	mt6370_chg_enable_irq(priv, "mivr", true);
+	pm_relax(priv->dev);
+}
+
+static void mt6370_chg_pwr_rdy_check(struct mt6370_priv *priv)
+{
+	int ret;
+	unsigned int pwr_rdy, otg_en;
+	union power_supply_propval val;
+
+	/* Check in OTG mode or not */
+	ret = mt6370_chg_field_get(priv, F_BOOST_STAT, &otg_en);
+	if (ret < 0) {
+		dev_err(priv->dev, "Failed to get OTG state\n");
+		return;
+	}
+
+	if (otg_en)
+		return;
+
+	ret = mt6370_chg_field_get(priv, F_UVP_D_STAT, &pwr_rdy);
+	if (ret < 0) {
+		dev_err(priv->dev, "Failed to get pwr_rdy state reg\n");
+		return;
+	}
+
+	val.intval = !pwr_rdy;
+
+	ret = power_supply_set_property(priv->psy, POWER_SUPPLY_PROP_ONLINE,
+					&val);
+	if (ret < 0)
+		dev_err(priv->dev, "Failed to start attach/detach flow\n");
+}
+
+static int mt6370_chg_get_online(struct mt6370_priv *priv,
+				 union power_supply_propval *val)
+{
+	mutex_lock(&priv->attach_lock);
+	val->intval = !!priv->attach;
+	mutex_unlock(&priv->attach_lock);
+
+	return 0;
+}
+
+static int mt6370_chg_get_status(struct mt6370_priv *priv,
+				 union power_supply_propval *val)
+{
+	int ret;
+	unsigned int chg_stat;
+	union power_supply_propval online;
+
+	ret = power_supply_get_property(priv->psy, POWER_SUPPLY_PROP_ONLINE,
+					&online);
+	if (ret < 0) {
+		dev_err(priv->dev, "Failed to get online status\n");
+		return ret;
+	}
+
+	if (!online.intval) {
+		val->intval = POWER_SUPPLY_STATUS_DISCHARGING;
+		return 0;
+	}
+
+	ret = mt6370_chg_field_get(priv, F_CHG_STAT, &chg_stat);
+	if (ret < 0)
+		return ret;
+
+	switch (chg_stat) {
+	case MT6370_CHG_STAT_READY:
+	case MT6370_CHG_STAT_FAULT:
+		val->intval = POWER_SUPPLY_STATUS_NOT_CHARGING;
+		return ret;
+	case MT6370_CHG_STAT_CHARGE_IN_PROGRESS:
+		val->intval = POWER_SUPPLY_STATUS_CHARGING;
+		return ret;
+	case MT6370_CHG_STAT_DONE:
+		val->intval = POWER_SUPPLY_STATUS_FULL;
+		return ret;
+	default:
+		val->intval = POWER_SUPPLY_STATUS_UNKNOWN;
+		return ret;
+	}
+}
+
+static int mt6370_chg_get_charge_type(struct mt6370_priv *priv,
+				      union power_supply_propval *val)
+{
+	int type, ret;
+	unsigned int chg_stat, vbat_lvl;
+
+	ret = mt6370_chg_field_get(priv, F_CHG_STAT, &chg_stat);
+	if (ret < 0)
+		return ret;
+
+	ret = mt6370_chg_field_get(priv, F_VBAT_LVL, &vbat_lvl);
+	if (ret < 0)
+		return ret;
+
+	switch (chg_stat) {
+	case MT6370_CHG_STAT_CHARGE_IN_PROGRESS:
+		if (vbat_lvl)
+			type = POWER_SUPPLY_CHARGE_TYPE_FAST;
+		else
+			type = POWER_SUPPLY_CHARGE_TYPE_TRICKLE;
+		break;
+	case MT6370_CHG_STAT_READY:
+	case MT6370_CHG_STAT_DONE:
+	case MT6370_CHG_STAT_FAULT:
+	default:
+		type = POWER_SUPPLY_CHARGE_TYPE_NONE;
+		break;
+	}
+
+	val->intval = type;
+
+	return 0;
+}
+
+static int mt6370_chg_get_ichg(struct mt6370_priv *priv,
+			       union power_supply_propval *val)
+{
+	return mt6370_chg_field_get(priv, F_ICHG, &val->intval);
+}
+
+static int mt6370_chg_get_max_ichg(struct mt6370_priv *priv,
+				   union power_supply_propval *val)
+{
+	val->intval = linear_range_get_max_value(
+			&mt6370_chg_ranges[MT6370_RANGE_F_ICHG]);
+	return 0;
+}
+
+static int mt6370_chg_get_cv(struct mt6370_priv *priv,
+			     union power_supply_propval *val)
+{
+	return mt6370_chg_field_get(priv, F_VOREG, &val->intval);
+}
+
+static int mt6370_chg_get_max_cv(struct mt6370_priv *priv,
+				 union power_supply_propval *val)
+{
+	val->intval = linear_range_get_max_value(
+			&mt6370_chg_ranges[MT6370_RANGE_F_VOREG]);
+	return 0;
+}
+
+static int mt6370_chg_get_aicr(struct mt6370_priv *priv,
+			       union power_supply_propval *val)
+{
+	return mt6370_chg_field_get(priv, F_IAICR, &val->intval);
+}
+
+static int mt6370_chg_get_mivr(struct mt6370_priv *priv,
+			       union power_supply_propval *val)
+{
+	return mt6370_chg_field_get(priv, F_VMIVR, &val->intval);
+}
+
+static int mt6370_chg_get_iprechg(struct mt6370_priv *priv,
+				  union power_supply_propval *val)
+{
+	return mt6370_chg_field_get(priv, F_IPREC, &val->intval);
+}
+
+static int mt6370_chg_get_ieoc(struct mt6370_priv *priv,
+			       union power_supply_propval *val)
+{
+	return mt6370_chg_field_get(priv, F_IEOC, &val->intval);
+}
+
+static int mt6370_chg_set_online(struct mt6370_priv *priv,
+				 const union power_supply_propval *val)
+{
+	bool pwr_rdy = !!val->intval;
+
+	mutex_lock(&priv->attach_lock);
+	if (pwr_rdy == !!priv->attach) {
+		dev_err(priv->dev, "pwr_rdy is same(%d)\n", pwr_rdy);
+		mutex_unlock(&priv->attach_lock);
+		return 0;
+	}
+
+	priv->attach = pwr_rdy;
+	mutex_unlock(&priv->attach_lock);
+
+	if (!queue_work(priv->wq, &priv->bc12_work))
+		dev_err(priv->dev, "bc12 work has already queued\n");
+
+	return 0;
+}
+
+static int mt6370_chg_set_ichg(struct mt6370_priv *priv,
+			       const union power_supply_propval *val)
+{
+	return mt6370_chg_field_set(priv, F_ICHG, val->intval);
+}
+
+static int mt6370_chg_set_cv(struct mt6370_priv *priv,
+			     const union power_supply_propval *val)
+{
+	return mt6370_chg_field_set(priv, F_VOREG, val->intval);
+}
+
+static int mt6370_chg_set_aicr(struct mt6370_priv *priv,
+			       const union power_supply_propval *val)
+{
+	return mt6370_chg_field_set(priv, F_IAICR, val->intval);
+}
+
+static int mt6370_chg_set_mivr(struct mt6370_priv *priv,
+			       const union power_supply_propval *val)
+{
+	return mt6370_chg_field_set(priv, F_VMIVR, val->intval);
+}
+
+static int mt6370_chg_set_iprechg(struct mt6370_priv *priv,
+				  const union power_supply_propval *val)
+{
+	return mt6370_chg_field_set(priv, F_IPREC, val->intval);
+}
+
+static int mt6370_chg_set_ieoc(struct mt6370_priv *priv,
+			       const union power_supply_propval *val)
+{
+	return mt6370_chg_field_set(priv, F_IEOC, val->intval);
+}
+
+static int mt6370_chg_get_property(struct power_supply *psy,
+				   enum power_supply_property psp,
+				   union power_supply_propval *val)
+{
+	struct mt6370_priv *priv = power_supply_get_drvdata(psy);
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_ONLINE:
+		return mt6370_chg_get_online(priv, val);
+	case POWER_SUPPLY_PROP_STATUS:
+		return mt6370_chg_get_status(priv, val);
+	case POWER_SUPPLY_PROP_CHARGE_TYPE:
+		return mt6370_chg_get_charge_type(priv, val);
+	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT:
+		return mt6370_chg_get_ichg(priv, val);
+	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT_MAX:
+		return mt6370_chg_get_max_ichg(priv, val);
+	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOLTAGE:
+		return mt6370_chg_get_cv(priv, val);
+	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOLTAGE_MAX:
+		return mt6370_chg_get_max_cv(priv, val);
+	case POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT:
+		return mt6370_chg_get_aicr(priv, val);
+	case POWER_SUPPLY_PROP_INPUT_VOLTAGE_LIMIT:
+		return mt6370_chg_get_mivr(priv, val);
+	case POWER_SUPPLY_PROP_PRECHARGE_CURRENT:
+		return mt6370_chg_get_iprechg(priv, val);
+	case POWER_SUPPLY_PROP_CHARGE_TERM_CURRENT:
+		return mt6370_chg_get_ieoc(priv, val);
+	case POWER_SUPPLY_PROP_TYPE:
+		val->intval = priv->psy_desc->type;
+		return 0;
+	case POWER_SUPPLY_PROP_USB_TYPE:
+		val->intval = priv->psy_usb_type;
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int mt6370_chg_set_property(struct power_supply *psy,
+				   enum power_supply_property psp,
+				   const union power_supply_propval *val)
+{
+	struct mt6370_priv *priv = power_supply_get_drvdata(psy);
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_ONLINE:
+		return mt6370_chg_set_online(priv, val);
+	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT:
+		return mt6370_chg_set_ichg(priv, val);
+	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOLTAGE:
+		return mt6370_chg_set_cv(priv, val);
+	case POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT:
+		return mt6370_chg_set_aicr(priv, val);
+	case POWER_SUPPLY_PROP_INPUT_VOLTAGE_LIMIT:
+		return mt6370_chg_set_mivr(priv, val);
+	case POWER_SUPPLY_PROP_PRECHARGE_CURRENT:
+		return mt6370_chg_set_iprechg(priv, val);
+	case POWER_SUPPLY_PROP_CHARGE_TERM_CURRENT:
+		return mt6370_chg_set_ieoc(priv, val);
+	default:
+		return -EINVAL;
+	}
+}
+
+static int mt6370_chg_property_is_writeable(struct power_supply *psy,
+					    enum power_supply_property psp)
+{
+	switch (psp) {
+	case POWER_SUPPLY_PROP_ONLINE:
+	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT:
+	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOLTAGE:
+	case POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT:
+	case POWER_SUPPLY_PROP_INPUT_VOLTAGE_LIMIT:
+	case POWER_SUPPLY_PROP_PRECHARGE_CURRENT:
+	case POWER_SUPPLY_PROP_CHARGE_TERM_CURRENT:
+		return 1;
+	default:
+		return 0;
+	}
+}
+
+static enum power_supply_property mt6370_chg_properties[] = {
+	POWER_SUPPLY_PROP_ONLINE,
+	POWER_SUPPLY_PROP_STATUS,
+	POWER_SUPPLY_PROP_CHARGE_TYPE,
+	POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT,
+	POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT_MAX,
+	POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOLTAGE,
+	POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOLTAGE_MAX,
+	POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT,
+	POWER_SUPPLY_PROP_INPUT_VOLTAGE_LIMIT,
+	POWER_SUPPLY_PROP_PRECHARGE_CURRENT,
+	POWER_SUPPLY_PROP_CHARGE_TERM_CURRENT,
+	POWER_SUPPLY_PROP_TYPE,
+	POWER_SUPPLY_PROP_USB_TYPE,
+};
+
+static enum power_supply_usb_type mt6370_chg_usb_types[] = {
+	POWER_SUPPLY_USB_TYPE_UNKNOWN,
+	POWER_SUPPLY_USB_TYPE_SDP,
+	POWER_SUPPLY_USB_TYPE_CDP,
+	POWER_SUPPLY_USB_TYPE_DCP,
+};
+
+static struct power_supply_desc mt6370_chg_psy_desc = {
+	.type = POWER_SUPPLY_TYPE_USB,
+	.properties = mt6370_chg_properties,
+	.num_properties = ARRAY_SIZE(mt6370_chg_properties),
+	.get_property = mt6370_chg_get_property,
+	.set_property = mt6370_chg_set_property,
+	.property_is_writeable = mt6370_chg_property_is_writeable,
+	.usb_types = mt6370_chg_usb_types,
+	.num_usb_types = ARRAY_SIZE(mt6370_chg_usb_types),
+};
+
+static const struct regulator_ops mt6370_chg_otg_ops = {
+	.list_voltage = regulator_list_voltage_linear,
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.set_current_limit = regulator_set_current_limit_regmap,
+	.get_current_limit = regulator_get_current_limit_regmap,
+};
+
+static const u32 mt6370_chg_otg_oc_ma[] = {
+	500000, 700000, 1100000, 1300000, 1800000, 2100000, 2400000,
+};
+
+static const struct regulator_desc mt6370_chg_otg_rdesc = {
+	.of_match = "usb-otg-vbus-regulator",
+	.of_parse_cb = mt6370_chg_otg_of_parse_cb,
+	.name = "mt6370-usb-otg-vbus",
+	.ops = &mt6370_chg_otg_ops,
+	.owner = THIS_MODULE,
+	.type = REGULATOR_VOLTAGE,
+	.min_uV = 4425000,
+	.uV_step = 25000,
+	.n_voltages = 57,
+	.vsel_reg = MT6370_REG_CHG_CTRL5,
+	.vsel_mask = MT6370_VOBST_MASK,
+	.enable_reg = MT6370_REG_CHG_CTRL1,
+	.enable_mask = MT6370_OPA_MODE_MASK,
+	.curr_table = mt6370_chg_otg_oc_ma,
+	.n_current_limits = ARRAY_SIZE(mt6370_chg_otg_oc_ma),
+	.csel_reg = MT6370_REG_CHG_CTRL10,
+	.csel_mask = MT6370_OTG_OC_MASK,
+};
+
+static int mt6370_chg_init_rmap_fields(struct mt6370_priv *priv)
+{
+	int i;
+	const struct mt6370_chg_field *fds = mt6370_chg_fields;
+
+	for (i = 0; i < F_MAX; i++) {
+		priv->rmap_fields[i] = devm_regmap_field_alloc(priv->dev,
+							       priv->regmap,
+							       fds[i].field);
+		if (IS_ERR(priv->rmap_fields[i]))
+			return dev_err_probe(priv->dev,
+					PTR_ERR(priv->rmap_fields[i]),
+					"Failed to allocate regmapfield[%s]\n",
+					fds[i].name);
+	}
+
+	return 0;
+}
+
+static int mt6370_chg_init_setting(struct mt6370_priv *priv)
+{
+	int ret;
+
+	/* Disable usb_chg_en */
+	ret = mt6370_chg_field_set(priv, F_USBCHGEN, 0);
+	if (ret < 0) {
+		dev_err(priv->dev, "Failed to disable usb_chg_en\n");
+		return ret;
+	}
+
+	/* ICHG/IEOC Workaround, ICHG can not be set less than 900mA */
+	ret = mt6370_chg_field_set(priv, F_ICHG, 900);
+	if (ret < 0) {
+		dev_err(priv->dev, "Failed to set ICHG to 900mA");
+		return ret;
+	}
+
+	/* Change input current limit selection to using IAICR results */
+	ret = mt6370_chg_field_set(priv, F_IINLMTSEL, 3);
+	if (ret < 0) {
+		dev_err(priv->dev, "Failed to set IINLMTSEL\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+#define MT6370_CHG_DT_PROP_DECL(_name, _type, _field)	\
+{							\
+	.name = "mediatek,chg-" #_name,			\
+	.type = MT6370_PARSE_TYPE_##_type,		\
+	.fd = _field,					\
+}
+
+static int mt6370_chg_init_otg_regulator(struct mt6370_priv *priv)
+{
+	struct regulator_config rcfg = {
+		.dev = priv->dev,
+		.regmap = priv->regmap,
+		.driver_data = priv,
+	};
+
+	priv->rdev = devm_regulator_register(priv->dev, &mt6370_chg_otg_rdesc,
+					     &rcfg);
+
+	return PTR_ERR_OR_ZERO(priv->rdev);
+}
+
+static int mt6370_chg_init_psy(struct mt6370_priv *priv)
+{
+	struct power_supply_config cfg = {
+		.drv_data = priv,
+		.of_node = dev_of_node(priv->dev),
+	};
+
+	priv->psy_desc = &mt6370_chg_psy_desc;
+	priv->psy_desc->name = dev_name(priv->dev);
+	priv->psy = devm_power_supply_register(priv->dev, priv->psy_desc, &cfg);
+
+	return PTR_ERR_OR_ZERO(priv->psy);
+}
+
+static irqreturn_t mt6370_attach_i_handler(int irq, void *data)
+{
+	struct mt6370_priv *priv = data;
+	unsigned int otg_en;
+	int ret;
+
+	/* Check in otg mode or not */
+	ret = mt6370_chg_field_get(priv, F_BOOST_STAT, &otg_en);
+	if (ret < 0) {
+		dev_err(priv->dev, "Failed to get otg state\n");
+		return IRQ_NONE;
+	}
+
+	if (otg_en)
+		return IRQ_HANDLED;
+
+	mutex_lock(&priv->attach_lock);
+	priv->attach = MT6370_ATTACH_STAT_ATTACH_BC12_DONE;
+	mutex_unlock(&priv->attach_lock);
+
+	if (!queue_work(priv->wq, &priv->bc12_work))
+		dev_err(priv->dev, "bc12 work has already queued\n");
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t mt6370_uvp_d_evt_handler(int irq, void *data)
+{
+	struct mt6370_priv *priv = data;
+
+	mt6370_chg_pwr_rdy_check(priv);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t mt6370_mivr_handler(int irq, void *data)
+{
+	struct mt6370_priv *priv = data;
+
+	pm_stay_awake(priv->dev);
+	mt6370_chg_enable_irq(priv, "mivr", false);
+	schedule_delayed_work(&priv->mivr_dwork, msecs_to_jiffies(200));
+
+	return IRQ_HANDLED;
+}
+
+#define MT6370_CHG_IRQ(_name)						\
+{									\
+	.name = #_name,							\
+	.handler = mt6370_##_name##_handler,				\
+}
+
+static int mt6370_chg_init_irq(struct mt6370_priv *priv)
+{
+	int i, ret;
+	const struct {
+		char *name;
+		irq_handler_t handler;
+	} mt6370_chg_irqs[] = {
+		MT6370_CHG_IRQ(attach_i),
+		MT6370_CHG_IRQ(uvp_d_evt),
+		MT6370_CHG_IRQ(mivr),
+	};
+
+	for (i = 0; i < ARRAY_SIZE(mt6370_chg_irqs); i++) {
+		ret = platform_get_irq_byname(to_platform_device(priv->dev),
+					      mt6370_chg_irqs[i].name);
+		if (ret < 0)
+			return dev_err_probe(priv->dev, ret,
+					     "Failed to get irq %s\n",
+					     mt6370_chg_irqs[i].name);
+
+		ret = devm_request_threaded_irq(priv->dev, ret, NULL,
+						mt6370_chg_irqs[i].handler,
+						IRQF_TRIGGER_FALLING,
+						dev_name(priv->dev),
+						priv);
+
+		if (ret < 0)
+			return dev_err_probe(priv->dev, ret,
+					     "Failed to request irq %s\n",
+					     mt6370_chg_irqs[i].name);
+	}
+
+	return 0;
+}
+
+static int mt6370_chg_probe(struct platform_device *pdev)
+{
+	int ret;
+	struct mt6370_priv *priv;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = &pdev->dev;
+
+	priv->regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!priv->regmap)
+		return dev_err_probe(&pdev->dev, -ENODEV,
+				     "Failed to get regmap\n");
+
+	ret = mt6370_chg_init_rmap_fields(priv);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to init regmap fields\n");
+
+	platform_set_drvdata(pdev, priv);
+
+	priv->iio_adcs = devm_iio_channel_get_all(priv->dev);
+	if (IS_ERR(priv->iio_adcs))
+		return dev_err_probe(&pdev->dev, PTR_ERR(priv->iio_adcs),
+				     "Failed to get iio adc\n");
+
+	ret = mt6370_chg_init_otg_regulator(priv);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to init otg regulator\n");
+
+	ret = mt6370_chg_init_psy(priv);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Failed to init psy\n");
+
+	mutex_init(&priv->attach_lock);
+	priv->attach = MT6370_ATTACH_STAT_DETACH;
+
+	priv->wq = create_singlethread_workqueue(dev_name(priv->dev));
+	if (IS_ERR(priv->wq))
+		return dev_err_probe(priv->dev, PTR_ERR(priv->wq),
+				     "Failed to create workqueue\n");
+
+	INIT_WORK(&priv->bc12_work, mt6370_chg_bc12_work_func);
+	INIT_DELAYED_WORK(&priv->mivr_dwork, mt6370_chg_mivr_dwork_func);
+
+	ret = mt6370_chg_init_setting(priv);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to init mt6370 charger setting\n");
+		goto probe_out;
+	}
+
+	ret = mt6370_chg_init_irq(priv);
+	if (ret)
+		goto probe_out;
+
+	mt6370_chg_pwr_rdy_check(priv);
+
+	return 0;
+
+probe_out:
+	cancel_delayed_work_sync(&priv->mivr_dwork);
+	flush_workqueue(priv->wq);
+	destroy_workqueue(priv->wq);
+	mutex_destroy(&priv->attach_lock);
+
+	return ret;
+}
+
+static int mt6370_chg_remove(struct platform_device *pdev)
+{
+	struct mt6370_priv *priv = platform_get_drvdata(pdev);
+
+	cancel_delayed_work_sync(&priv->mivr_dwork);
+	flush_workqueue(priv->wq);
+	destroy_workqueue(priv->wq);
+	mutex_destroy(&priv->attach_lock);
+
+	return 0;
+}
+
+static const struct of_device_id mt6370_chg_of_match[] = {
+	{ .compatible = "mediatek,mt6370-charger", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, mt6370_chg_of_match);
+
+static struct platform_driver mt6370_chg_driver = {
+	.probe = mt6370_chg_probe,
+	.remove = mt6370_chg_remove,
+	.driver = {
+		.name = "mt6370-charger",
+		.of_match_table = mt6370_chg_of_match,
+	},
+};
+module_platform_driver(mt6370_chg_driver);
+
+MODULE_AUTHOR("ChiaEn Wu <chiaen_wu@richtek.com>");
+MODULE_DESCRIPTION("MediaTek MT6370 Charger Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4

