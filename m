Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34AD090DD57
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 22:22:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B89F10E7B3;
	Tue, 18 Jun 2024 20:22:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BQDS3JeA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD8F10E0C3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 14:00:30 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-57cfe600cbeso767769a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 07:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718719229; x=1719324029; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=eJjzPFzeK4OTnNmyhk2Z69T0Mv/GEdnDyv14Qjd1AMA=;
 b=BQDS3JeAr9CPatxMRNExJqg/60eLA5+/55sR9mfhPJBMwCsrCCQEc4n66YIKBvZzdu
 ZhOl09LpDuyfO531IdDbUrANu/g7lDoDr6Us93FISYFaIGuF8s8RI8WyRQFHO+KU25y3
 q8NwPZoX6XtzEj7dFZnrxCkgkkmR5dZXOEsg8D3Zmzm4l+2T0bWzDxj/SyQMZQnaYAgV
 X0Kpp9x82JggkloLcUst5fa+oRmuLbCxXsufyLqFEClXZb/dtGgZgstENlKCLQmJuQUp
 JRovQlPGOD85a0DM7urywxQMVwE8GmiogWgIFJtXnlaMVnDm4EAVZvVaYrCNltJcwWIE
 qc5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718719229; x=1719324029;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eJjzPFzeK4OTnNmyhk2Z69T0Mv/GEdnDyv14Qjd1AMA=;
 b=wxH2BKbO14xZAgktjDuD3oNGRVFwI2LenUXedPPsQht3x1LV40JHyOpgHeMlgb5tIX
 +7PXu9IuggoF7J692JkGFCS8/avNvqwRZebaxZ42LECLZSuQ+MKMZcl+89TSQfPFwyBl
 Q4dJ+ngGLzEAF6UW+/QLjB/jDx1q0eOVS5O+qnqUJQQicY+zypkUhm2nPLPETGlBbypV
 PdVjnPuI+IbzFSdR3nxyfl7rDmNIKATXDCbr79tRzLsDphOd/gz0IWbIHAjB8rf/xbbK
 FYFYbe7Vn/ZSL1k6rbEkat2r8oDGA5wRNUP5S4yuQbcdunxiZIkLdd9sB8FmG3O1aNv5
 ysOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/+zPsCm79JSbeifCzJYpYTpFkJu0T4xCbSE8QiEw/GrKMsQxY5i8XdaSe7icsnZ8EaFtoHQDWYlpXdRamRg1b5lU+JAdu80XePhyGSlng
X-Gm-Message-State: AOJu0YxqKtRE/olmdn0fd+fMZ2htDNxqM1l7OcrLFjrXrqdfPPLRersd
 i6DEyirHgEp55by7NpkPt0V/nASPmnPOeZHeO7vL0yDCCVnIug4qtukWXw==
X-Google-Smtp-Source: AGHT+IF4ZzHLI9V3+LTX7+JTibxZTfVLCoXIxk/IYmJanCqg5Sh7sZ08YDb/9Oipl6vdG3BZDB9ekA==
X-Received: by 2002:a50:ab4a:0:b0:578:6c19:4801 with SMTP id
 4fb4d7f45d1cf-57cbd6a70e9mr8232702a12.22.1718719228794; 
 Tue, 18 Jun 2024 07:00:28 -0700 (PDT)
Received: from [127.0.1.1] (mm-167-232-122-178.mgts.dynamic.pppoe.byfly.by.
 [178.122.232.167]) by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb72da156sm7731278a12.22.2024.06.18.07.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 07:00:28 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Tue, 18 Jun 2024 16:59:52 +0300
Subject: [PATCH v3 18/23] regulator: add s2dos05 regulator support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-starqltechn_integration_upstream-v3-18-e3f6662017ac@gmail.com>
References: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
In-Reply-To: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
To: Sebastian Reichel <sre@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Chanwoo Choi <cw00.choi@samsung.com>, phone-devel@vger.kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718719185; l=12895;
 i=dsankouski@gmail.com; s=20240618; h=from:subject:message-id;
 bh=uZejq3wX3OBYE+9S5+uNP8az/DWpQYHhHiLxkXJUgAg=;
 b=5XtWTi2CQq9/wixtulx+pvi4NO3P+hcgPgRzF8p95jBWt9lMboWJtUeAdy8U69KlHIY638Q7u
 vUZauNkhQbHBrjHjjmEPIjCHoFB1/7esgo0w4z1F6LxEg9G5mvxG1nM
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=6pMMVVDDReSiRgPCbMOUauN5nS3ty4Sf5b7a2gi4x0M=
X-Mailman-Approved-At: Tue, 18 Jun 2024 20:22:03 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

S2dos05 has 1 buck and 4 LDO regulators, used for powering
panel/touchscreen.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 MAINTAINERS                           |   1 +
 drivers/regulator/Kconfig             |   8 +
 drivers/regulator/Makefile            |   1 +
 drivers/regulator/s2dos05-regulator.c | 362 ++++++++++++++++++++++++++++++++++
 4 files changed, 372 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b53462684a30..bee700a5e648 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19910,6 +19910,7 @@ F:	Documentation/devicetree/bindings/regulator/samsung,s5m*.yaml
 F:	drivers/clk/clk-s2mps11.c
 F:	drivers/mfd/s2dos*.c
 F:	drivers/mfd/sec*.c
+F:	drivers/regulator/s2dos*.c
 F:	drivers/regulator/s2m*.c
 F:	drivers/regulator/s5m*.c
 F:	drivers/rtc/rtc-s5m.c
diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index d333be2bea3b..d6d6f571a65d 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1297,6 +1297,14 @@ config REGULATOR_RTQ2208
 	  and two ldos. It features wide output voltage range from 0.4V to 2.05V
 	  and the capability to configure the corresponding power stages.
 
+config REGULATOR_S2DOS05
+	tristate "SLSI S2DOS05 regulator"
+	depends on MFD_S2DOS_CORE || COMPILE_TEST
+	help
+	  This driver provides support for the voltage regulators of the S2DOS05.
+	  The S2DOS05 is a companion power management IC for the smart phones.
+	  The S2DOS05 has 4 LDOs and 1 BUCK outputs.
+
 config REGULATOR_S2MPA01
 	tristate "Samsung S2MPA01 voltage regulator"
 	depends on MFD_SEC_CORE || COMPILE_TEST
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index ba15fa5f30ad..80f889404597 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -151,6 +151,7 @@ obj-$(CONFIG_REGULATOR_RTMV20)	+= rtmv20-regulator.o
 obj-$(CONFIG_REGULATOR_RTQ2134) += rtq2134-regulator.o
 obj-$(CONFIG_REGULATOR_RTQ6752)	+= rtq6752-regulator.o
 obj-$(CONFIG_REGULATOR_RTQ2208) += rtq2208-regulator.o
+obj-$(CONFIG_REGULATOR_S2DOS05) += s2dos05-regulator.o
 obj-$(CONFIG_REGULATOR_S2MPA01) += s2mpa01.o
 obj-$(CONFIG_REGULATOR_S2MPS11) += s2mps11.o
 obj-$(CONFIG_REGULATOR_S5M8767) += s5m8767.o
diff --git a/drivers/regulator/s2dos05-regulator.c b/drivers/regulator/s2dos05-regulator.c
new file mode 100644
index 000000000000..3c58a1bd2262
--- /dev/null
+++ b/drivers/regulator/s2dos05-regulator.c
@@ -0,0 +1,362 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * s2dos05.c - Regulator driver for the Samsung s2dos05
+ *
+ * Copyright (C) 2016 Samsung Electronics
+ * Copyright (C) 2023 Dzmitry Sankouski <dsankouski@gmail.com>
+ *
+ */
+
+#include <linux/module.h>
+#include <linux/bug.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/slab.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/interrupt.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/machine.h>
+#include <linux/regulator/of_regulator.h>
+#include <linux/mfd/samsung/s2dos-core.h>
+#include <linux/mfd/samsung/s2dos05.h>
+#include <linux/i2c.h>
+#include <linux/debugfs.h>
+
+struct s2dos05_data {
+	struct regmap *regmap;
+	struct device *dev;
+};
+
+static int s2m_enable(struct regulator_dev *rdev)
+{
+	struct s2dos05_data *info = rdev_get_drvdata(rdev);
+	struct regmap *regmap = info->regmap;
+
+	return regmap_update_bits(regmap, rdev->desc->enable_reg,
+				  rdev->desc->enable_mask,
+					rdev->desc->enable_mask);
+}
+
+static int s2m_disable_regmap(struct regulator_dev *rdev)
+{
+	struct s2dos05_data *info = rdev_get_drvdata(rdev);
+	struct regmap *regmap = info->regmap;
+	u8 val;
+
+	if (rdev->desc->enable_is_inverted)
+		val = rdev->desc->enable_mask;
+	else
+		val = 0;
+
+	return regmap_update_bits(regmap, rdev->desc->enable_reg, rdev->desc->enable_mask,
+				   val);
+}
+
+static int s2m_is_enabled_regmap(struct regulator_dev *rdev)
+{
+	struct s2dos05_data *info = rdev_get_drvdata(rdev);
+	struct regmap *regmap = info->regmap;
+	int ret;
+	unsigned int val;
+
+	ret = regmap_read(regmap, rdev->desc->enable_reg, &val);
+	if (ret < 0)
+		return ret;
+
+	if (rdev->desc->enable_is_inverted)
+		return (val & rdev->desc->enable_mask) == 0;
+	else
+		return (val & rdev->desc->enable_mask) != 0;
+}
+
+static int s2m_get_voltage_sel_regmap(struct regulator_dev *rdev)
+{
+	struct s2dos05_data *info = rdev_get_drvdata(rdev);
+	struct regmap *regmap = info->regmap;
+	int ret;
+	unsigned int val;
+
+	ret = regmap_read(regmap, rdev->desc->vsel_reg, &val);
+	if (ret < 0)
+		return ret;
+
+	val &= rdev->desc->vsel_mask;
+
+	return val;
+}
+
+static int s2m_set_voltage_sel_regmap(struct regulator_dev *rdev,
+					unsigned int sel)
+{
+	struct s2dos05_data *info = rdev_get_drvdata(rdev);
+	struct regmap *regmap = info->regmap;
+	int ret;
+
+	ret = regmap_update_bits(regmap, rdev->desc->vsel_reg, rdev->desc->vsel_mask,
+				sel);
+	if (ret < 0)
+		goto out;
+
+	if (rdev->desc->apply_bit)
+		ret = regmap_update_bits(regmap, rdev->desc->apply_reg,
+					 rdev->desc->apply_bit,
+					 rdev->desc->apply_bit);
+	return ret;
+out:
+	pr_warn("%s: failed to set voltage_sel_regmap\n", rdev->desc->name);
+	return ret;
+}
+
+static int s2m_set_voltage_sel_regmap_buck(struct regulator_dev *rdev,
+					unsigned int sel)
+{
+	struct s2dos05_data *info = rdev_get_drvdata(rdev);
+	struct regmap *regmap = info->regmap;
+	int ret;
+
+	ret = regmap_write(regmap, rdev->desc->vsel_reg, sel);
+	if (ret < 0)
+		goto out;
+
+	if (rdev->desc->apply_bit)
+		ret = regmap_update_bits(regmap, rdev->desc->apply_reg,
+					 rdev->desc->apply_bit,
+					 rdev->desc->apply_bit);
+	return ret;
+out:
+	pr_warn("%s: failed to set voltage_sel_regmap\n", rdev->desc->name);
+	return ret;
+}
+
+static int s2m_set_voltage_time_sel(struct regulator_dev *rdev,
+				   unsigned int old_selector,
+				   unsigned int new_selector)
+{
+	int old_volt, new_volt;
+
+	/* sanity check */
+	if (!rdev->desc->ops->list_voltage)
+		return -EINVAL;
+
+	old_volt = rdev->desc->ops->list_voltage(rdev, old_selector);
+	new_volt = rdev->desc->ops->list_voltage(rdev, new_selector);
+
+	if (old_selector < new_selector)
+		return DIV_ROUND_UP(new_volt - old_volt, S2DOS05_RAMP_DELAY);
+
+	return 0;
+}
+
+static int s2m_set_active_discharge(struct regulator_dev *rdev,
+					bool enable)
+{
+	struct s2dos05_data *info = rdev_get_drvdata(rdev);
+	struct regmap *regmap = info->regmap;
+	int ret;
+	u8 val;
+
+	if (enable)
+		val = rdev->desc->active_discharge_on;
+	else
+		val = rdev->desc->active_discharge_off;
+
+	ret = regmap_update_bits(regmap, rdev->desc->active_discharge_reg,
+				rdev->desc->active_discharge_mask, val);
+	return ret;
+}
+
+static const struct regulator_ops s2dos05_ldo_ops = {
+	.list_voltage		= regulator_list_voltage_linear,
+	.map_voltage		= regulator_map_voltage_linear,
+	.is_enabled		= s2m_is_enabled_regmap,
+	.enable			= s2m_enable,
+	.disable		= s2m_disable_regmap,
+	.get_voltage_sel	= s2m_get_voltage_sel_regmap,
+	.set_voltage_sel	= s2m_set_voltage_sel_regmap,
+	.set_voltage_time_sel	= s2m_set_voltage_time_sel,
+	.set_active_discharge	= s2m_set_active_discharge,
+};
+
+static const struct regulator_ops s2dos05_buck_ops = {
+	.list_voltage		= regulator_list_voltage_linear,
+	.map_voltage		= regulator_map_voltage_linear,
+	.is_enabled		= s2m_is_enabled_regmap,
+	.enable			= s2m_enable,
+	.disable		= s2m_disable_regmap,
+	.get_voltage_sel	= s2m_get_voltage_sel_regmap,
+	.set_voltage_sel	= s2m_set_voltage_sel_regmap_buck,
+	.set_voltage_time_sel	= s2m_set_voltage_time_sel,
+	.set_active_discharge	= s2m_set_active_discharge,
+};
+
+#define _BUCK(macro)	S2DOS05_BUCK##macro
+#define _buck_ops(num)	s2dos05_buck_ops##num
+
+#define _LDO(macro)	S2DOS05_LDO##macro
+#define _REG(ctrl)	S2DOS05_REG##ctrl
+#define _ldo_ops(num)	s2dos05_ldo_ops##num
+#define _MASK(macro)	S2DOS05_ENABLE_MASK##macro
+#define _TIME(macro)	S2DOS05_ENABLE_TIME##macro
+
+#define BUCK_DESC(_name, _id, _ops, m, s, v, e, em, t, a) {	\
+	.name		= _name,				\
+	.id		= _id,					\
+	.ops		= _ops,					\
+	.type		= REGULATOR_VOLTAGE,			\
+	.owner		= THIS_MODULE,				\
+	.min_uV		= m,					\
+	.uV_step	= s,					\
+	.n_voltages	= S2DOS05_BUCK_N_VOLTAGES,		\
+	.vsel_reg	= v,					\
+	.vsel_mask	= S2DOS05_BUCK_VSEL_MASK,		\
+	.enable_reg	= e,					\
+	.enable_mask	= em,					\
+	.enable_time	= t,					\
+	.active_discharge_off = 0,				\
+	.active_discharge_on = S2DOS05_BUCK_FD_MASK,		\
+	.active_discharge_reg	= a,				\
+	.active_discharge_mask	= S2DOS05_BUCK_FD_MASK		\
+}
+
+#define LDO_DESC(_name, _id, _ops, m, s, v, e, em, t, a) {	\
+	.name		= _name,				\
+	.id		= _id,					\
+	.ops		= _ops,					\
+	.type		= REGULATOR_VOLTAGE,			\
+	.owner		= THIS_MODULE,				\
+	.min_uV		= m,					\
+	.uV_step	= s,					\
+	.n_voltages	= S2DOS05_LDO_N_VOLTAGES,		\
+	.vsel_reg	= v,					\
+	.vsel_mask	= S2DOS05_LDO_VSEL_MASK,		\
+	.enable_reg	= e,					\
+	.enable_mask	= em,					\
+	.enable_time	= t,					\
+	.active_discharge_off = 0,				\
+	.active_discharge_on = S2DOS05_LDO_FD_MASK,		\
+	.active_discharge_reg	= a,				\
+	.active_discharge_mask	= S2DOS05_LDO_FD_MASK		\
+}
+
+static struct regulator_desc regulators[S2DOS05_REGULATOR_MAX] = {
+		/* name, id, ops, min_uv, uV_step, vsel_reg, enable_reg */
+		LDO_DESC("ldo1", _LDO(1), &_ldo_ops(), _LDO(_MIN1),
+			_LDO(_STEP1), _REG(_LDO1_CFG),
+			_REG(_EN), _MASK(_L1), _TIME(_LDO), _REG(_LDO1_CFG)),
+		LDO_DESC("ldo2", _LDO(2), &_ldo_ops(), _LDO(_MIN1),
+			_LDO(_STEP1), _REG(_LDO2_CFG),
+			_REG(_EN), _MASK(_L2), _TIME(_LDO), _REG(_LDO2_CFG)),
+		LDO_DESC("ldo3", _LDO(3), &_ldo_ops(), _LDO(_MIN2),
+			_LDO(_STEP1), _REG(_LDO3_CFG),
+			_REG(_EN), _MASK(_L3), _TIME(_LDO), _REG(_LDO3_CFG)),
+		LDO_DESC("ldo4", _LDO(4), &_ldo_ops(), _LDO(_MIN2),
+			_LDO(_STEP1), _REG(_LDO4_CFG),
+			_REG(_EN), _MASK(_L4), _TIME(_LDO), _REG(_LDO4_CFG)),
+		BUCK_DESC("buck1", _BUCK(1), &_buck_ops(), _BUCK(_MIN1),
+			_BUCK(_STEP1), _REG(_BUCK_VOUT),
+			_REG(_EN), _MASK(_B1), _TIME(_BUCK), _REG(_BUCK_CFG)),
+};
+
+static int s2dos05_pmic_dt_parse_pdata(struct device *dev,
+					struct of_regulator_match *rdata,
+					unsigned int rdev_num)
+{
+	struct device_node *reg_np;
+	int err;
+
+	reg_np = of_get_child_by_name(dev->parent->of_node, "regulators");
+	if (!reg_np) {
+		dev_err(dev, "could not find regulators sub-node\n");
+		return -EINVAL;
+	}
+
+	err = of_regulator_match(dev, reg_np, rdata, rdev_num);
+	of_node_put(reg_np);
+
+	return err;
+}
+
+static int s2dos05_pmic_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct s2dos_core *iodev = dev_get_drvdata(pdev->dev.parent);
+	struct of_regulator_match *rdata = NULL;
+	struct s2dos05_data *s2dos05;
+	struct regulator_config config = { };
+	unsigned int rdev_num = ARRAY_SIZE(regulators);
+	int i;
+	int ret, err = 0;
+
+	s2dos05 = devm_kzalloc(dev, sizeof(struct s2dos05_data),
+				GFP_KERNEL);
+	if (!s2dos05) {
+		ret = -ENOMEM;
+		goto err_data;
+	}
+	platform_set_drvdata(pdev, s2dos05);
+
+	rdata = kcalloc(rdev_num, sizeof(*rdata), GFP_KERNEL);
+	if (!rdata)
+		return -ENOMEM;
+
+	for (i = 0; i < rdev_num; i++)
+		rdata[i].name = regulators[i].name;
+
+	err = s2dos05_pmic_dt_parse_pdata(dev, rdata, rdev_num);
+	if (err < 0) {
+		dev_err(dev, "Failed to parse regulators device of_node\n");
+		goto err_data;
+	}
+
+	s2dos05->regmap = iodev->regmap;
+	s2dos05->dev = dev;
+
+	for (i = 0; i < rdev_num; i++) {
+		struct regulator_dev *regulator;
+
+		config.init_data = rdata[i].init_data;
+		config.of_node = rdata[i].of_node;
+		config.dev = dev;
+		config.driver_data = s2dos05;
+		regulator = devm_regulator_register(&pdev->dev,
+						&regulators[i], &config);
+		if (IS_ERR(regulator)) {
+			ret = PTR_ERR(regulator);
+			dev_err(&pdev->dev, "regulator init failed for %d\n",
+				i);
+			goto out;
+		}
+	}
+
+out:
+	kfree(rdata);
+
+	return ret;
+
+err_data:
+	devm_kfree(dev, (void *)s2dos05);
+	kfree(s2dos05);
+
+	return ret;
+}
+
+static const struct platform_device_id s2dos05_pmic_id[] = {
+	{ "s2dos05-regulator" },
+	{ },
+};
+MODULE_DEVICE_TABLE(platform, s2dos05_pmic_id);
+
+static struct platform_driver s2dos05_platform_driver = {
+	.driver = {
+		.name = "s2dos05",
+	},
+	.probe = s2dos05_pmic_probe,
+	.id_table = s2dos05_pmic_id,
+};
+module_platform_driver(s2dos05_platform_driver);
+
+MODULE_AUTHOR("Dzmitry Sankouski <dsankouski@gmail.com>");
+MODULE_DESCRIPTION("SAMSUNG s2dos05 Regulator Driver");
+MODULE_LICENSE("GPL");

-- 
2.39.2

