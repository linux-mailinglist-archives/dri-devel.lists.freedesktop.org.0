Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4ECF90DD62
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 22:23:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F074510E7BE;
	Tue, 18 Jun 2024 20:23:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iB3FJ96j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5B9610E0C3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 14:00:21 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2eabd22d3f4so65210471fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 07:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718719220; x=1719324020; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pq6Yfp+kXuwWjkVTMffVNFCMFuU+SGEaW56q4iKxBz4=;
 b=iB3FJ96j4Jx//0vX4j9F5/xwEoArWzRxA2org3fcvCeBGjiHgKnD8Hm0SsngCfbVqp
 tejokvJD4GbRhwoCpPR5ePXW3ITutUP5KBs9Nhb2Sd2gGYQbEQy32NMHO8kk5FgvYlmc
 4v6NCodm0bYtjGr6CJbRFGqy+denL0AqIeBiMYryX63fK7+iZ4Y3g+bkqQIx2M/Jtyya
 qcmBgg12JpwAuKNK2NhZOduPwDwMSOSSf9guG9GkJFQTtlOrVdABFlJkdw4yncWT7rS1
 DDtlRafR89rVhiaejP8j8ePMCql2wyRt4BF/NICtfaDXnkXCEentBKGrzfJ6CBZUd0PV
 9nYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718719220; x=1719324020;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pq6Yfp+kXuwWjkVTMffVNFCMFuU+SGEaW56q4iKxBz4=;
 b=uxMFkc/kmcSiBkzDsdeFKEjs2gJ3MQ84EZQOZUBoYJ8WVLxJjMF1CipYRoWyVGaoWL
 AhVXNYgp3UNUthrIi2HsT4mgWKCryGYXjZ7lOHxX8nvze9BvK1YMm3gQToa+uaaZvQgn
 ecJu0MVjzEKL9FDcTew7uNv3fdPwotHeErsBya16dVWO3n/b6DU1OCo6ggXB2Qje2G9x
 cpBHjYt2trwr1/lDwJ0UrnwYCgqB5jtd3w8JwZQZmG1+EOUD9/OT6N9Uq5DPRfX/ltS/
 C7abQDwF1Kl6+tBDrSdXGpXrJi83xQhAkefJEg3iMdO97kX20Vw5VWBqQvWzt9TW6iQQ
 07+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWp9WWaZDXeciKIPfVfdcEiXXcX9sP0XZP43IejWXrrcT2+h0xgCp8tPo6a9f+bSONS52UC2voeshLX5s90KQ6DqFoCD8moIeKtw5/t261E
X-Gm-Message-State: AOJu0YzsXV43hEtTvUeXT5JjiOcV4jzc3eaVxWwQdNBwiZtn7JJOhgIR
 PnctiRlH52EFim3TcsjjnmvT4743c7OeayGEaEh13tC+wJdx9vEt27r8dQwJ
X-Google-Smtp-Source: AGHT+IEIc2idIrMoCRSMpb70Qx8ivNcZJAnEoJ4kpGJ1qvn9RY/NxJohVfT7t3cUTk1JitYhqXeL/g==
X-Received: by 2002:a2e:7205:0:b0:2eb:f9a1:7dd6 with SMTP id
 38308e7fff4ca-2ec0e5b5844mr80733881fa.3.1718719219550; 
 Tue, 18 Jun 2024 07:00:19 -0700 (PDT)
Received: from [127.0.1.1] (mm-167-232-122-178.mgts.dynamic.pppoe.byfly.by.
 [178.122.232.167]) by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb72da156sm7731278a12.22.2024.06.18.07.00.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 07:00:19 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Tue, 18 Jun 2024 16:59:48 +0300
Subject: [PATCH v3 14/23] power: supply: max77705: Add charger driver for
 Maxim 77705
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-starqltechn_integration_upstream-v3-14-e3f6662017ac@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718719185; l=34495;
 i=dsankouski@gmail.com; s=20240618; h=from:subject:message-id;
 bh=hKVjmHg9fPappw6Ge/EdwOBFJeuWIpNZ6cWmDemYKw8=;
 b=xfxQadM+f4Z/jGSyjeHbx9fCbIOIfVRWeUMeqh1I4IKNwLQMEIYvF/fRaLke7MY7m6tZWyLC2
 d+pny78wduhDySBTNMcMO8qTJZwEYPVeMZvR8QkjYBQVAnu01+bjNvI
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

Add driver for Maxim 77705 switch-mode charger (part of max77705
MFD driver) providing power supply class information to userspace.

The driver is configured through DTS (battery and system related
settings). Also, POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOLTAGE property
is writable, which allows to configure charge end at less than 100%

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 drivers/power/supply/Kconfig            |   6 +
 drivers/power/supply/Makefile           |   1 +
 drivers/power/supply/max77705_charger.c | 772 ++++++++++++++++++++++++++++++++
 include/linux/mfd/max77705_charger.h    | 225 ++++++++++
 4 files changed, 1004 insertions(+)

diff --git a/drivers/power/supply/Kconfig b/drivers/power/supply/Kconfig
index 3e31375491d5..47ca8cc00a80 100644
--- a/drivers/power/supply/Kconfig
+++ b/drivers/power/supply/Kconfig
@@ -552,6 +552,12 @@ config CHARGER_MAX77693
 	help
 	  Say Y to enable support for the Maxim MAX77693 battery charger.
 
+config CHARGER_MAX77705
+	tristate "Maxim MAX77705 battery charger driver"
+	depends on MFD_MAX77705
+	help
+	  Say Y to enable support for the Maxim MAX77705 battery charger.
+
 config CHARGER_MAX77976
 	tristate "Maxim MAX77976 battery charger driver"
 	depends on I2C
diff --git a/drivers/power/supply/Makefile b/drivers/power/supply/Makefile
index 58b567278034..dbec648c78c9 100644
--- a/drivers/power/supply/Makefile
+++ b/drivers/power/supply/Makefile
@@ -77,6 +77,7 @@ obj-$(CONFIG_CHARGER_MAX14577)	+= max14577_charger.o
 obj-$(CONFIG_CHARGER_DETECTOR_MAX14656)	+= max14656_charger_detector.o
 obj-$(CONFIG_CHARGER_MAX77650)	+= max77650-charger.o
 obj-$(CONFIG_CHARGER_MAX77693)	+= max77693_charger.o
+obj-$(CONFIG_CHARGER_MAX77705)	+= max77705_charger.o
 obj-$(CONFIG_CHARGER_MAX77976)	+= max77976_charger.o
 obj-$(CONFIG_CHARGER_MAX8997)	+= max8997_charger.o
 obj-$(CONFIG_CHARGER_MAX8998)	+= max8998_charger.o
diff --git a/drivers/power/supply/max77705_charger.c b/drivers/power/supply/max77705_charger.c
new file mode 100644
index 000000000000..2b3e836d4c55
--- /dev/null
+++ b/drivers/power/supply/max77705_charger.c
@@ -0,0 +1,772 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * max77705_charger.c - Battery charger driver for the Maxim 77705
+ *
+ * Copyright (C) 2014 Samsung Electronics
+ * Krzysztof Kozlowski <krzk@kernel.org>
+ * Copyright (C) 2024 Dzmitry Sankouski <dsankouski@gmail.org>
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/debugfs.h>
+#include <linux/power_supply.h>
+#include <linux/regmap.h>
+
+#include <linux/mfd/max77705.h>
+#include <linux/mfd/max77705_charger.h>
+#include <linux/mfd/max77705-private.h>
+
+#define MAX77705_CHARGER_NAME				"max77705-charger"
+static const char *max77705_charger_model		= "max77705";
+static const char *max77705_charger_manufacturer	= "Maxim Integrated";
+static struct dentry *debugfs_file;
+
+static enum power_supply_property max77705_charger_props[] = {
+	POWER_SUPPLY_PROP_ONLINE,
+	POWER_SUPPLY_PROP_PRESENT,
+	POWER_SUPPLY_PROP_STATUS,
+	POWER_SUPPLY_PROP_CHARGE_TYPE,
+	POWER_SUPPLY_PROP_HEALTH,
+	POWER_SUPPLY_PROP_VOLTAGE_MAX_DESIGN,
+	POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOLTAGE,
+	POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT,
+	POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT,
+};
+
+static int max77705_get_online(struct regmap *regmap, int *val)
+{
+	unsigned int data;
+	int ret;
+
+	ret = regmap_read(regmap, MAX77705_CHG_REG_INT_OK, &data);
+	if (ret < 0)
+		return ret;
+
+	*val = !!(data & MAX77705_CHGIN_OK);
+
+	return 0;
+}
+
+static int max77705_get_charger_state(struct max77705_charger_data *charger)
+{
+	struct regmap *regmap = charger->max77705->regmap_charger;
+	int status = POWER_SUPPLY_STATUS_UNKNOWN;
+	unsigned int reg_data;
+
+	regmap_read(regmap, MAX77705_CHG_REG_DETAILS_01, &reg_data);
+
+	pr_debug("%s: charger status (0x%02x)\n", __func__, reg_data);
+
+	reg_data &= 0x0f;
+
+	switch (reg_data) {
+	case 0x0:
+	case MAX77705_CHARGER_CONSTANT_CURRENT:
+	case MAX77705_CHARGER_CONSTANT_VOLTAGE:
+		status = POWER_SUPPLY_STATUS_CHARGING;
+		break;
+	case MAX77705_CHARGER_END_OF_CHARGE:
+	case MAX77705_CHARGER_DONE:
+		status = POWER_SUPPLY_STATUS_FULL;
+		break;
+	case 0x05:
+	case 0x06:
+	case 0x07:
+		status = POWER_SUPPLY_STATUS_NOT_CHARGING;
+		break;
+	case 0x08:
+	case 0xA:
+	case 0xB:
+		status = POWER_SUPPLY_STATUS_DISCHARGING;
+		break;
+	default:
+		status = POWER_SUPPLY_STATUS_UNKNOWN;
+		break;
+	}
+
+	return (int)status;
+}
+
+static int max77705_get_battery_health(struct regmap *regmap, int *value)
+{
+	unsigned int bat_dtls;
+
+	regmap_read(regmap, MAX77705_CHG_REG_DETAILS_01, &bat_dtls);
+	bat_dtls = ((bat_dtls & MAX77705_BAT_DTLS) >> MAX77705_BAT_DTLS_SHIFT);
+
+	pr_debug("%s: bat_dtls(0x%x)\n", __func__, bat_dtls);
+
+	switch (bat_dtls) {
+	case MAX77705_BATTERY_NOBAT:
+		pr_debug("%s: No battery and the charger is suspended\n", __func__);
+		*value = POWER_SUPPLY_HEALTH_NO_BATTERY;
+		break;
+	case MAX77705_BATTERY_PREQUALIFICATION:
+		pr_debug("%s: battery is okay but its voltage is low(~VPQLB)\n", __func__);
+		break;
+	case MAX77705_BATTERY_DEAD:
+		pr_debug("%s: battery dead\n", __func__);
+		*value = POWER_SUPPLY_HEALTH_DEAD;
+		break;
+	case MAX77705_BATTERY_GOOD:
+	case MAX77705_BATTERY_LOWVOLTAGE:
+		*value = POWER_SUPPLY_HEALTH_GOOD;
+		break;
+	case MAX77705_BATTERY_OVERVOLTAGE:
+		pr_debug("%s: battery ovp\n", __func__);
+		*value = POWER_SUPPLY_HEALTH_OVERVOLTAGE;
+		break;
+	default:
+		pr_debug("%s: battery unknown\n", __func__);
+		*value = POWER_SUPPLY_HEALTH_UNSPEC_FAILURE;
+		break;
+	}
+
+	return 0;
+}
+
+static int max77705_get_vbus_state(struct regmap *regmap, int *value)
+{
+	int ret;
+	unsigned int charge_dtls;
+
+	ret = regmap_read(regmap, MAX77705_CHG_REG_DETAILS_00, &charge_dtls);
+	if (ret)
+		return ret;
+
+	charge_dtls = ((charge_dtls & MAX77705_CHGIN_DTLS) >>
+			MAX77705_CHGIN_DTLS_SHIFT);
+
+	switch (charge_dtls) {
+	case 0x00:
+		*value = POWER_SUPPLY_HEALTH_UNDERVOLTAGE;
+		break;
+	case 0x01:
+		*value = POWER_SUPPLY_HEALTH_UNDERVOLTAGE;
+		break;
+	case 0x02:
+		*value = POWER_SUPPLY_HEALTH_OVERVOLTAGE;
+		break;
+	case 0x03:
+		*value = POWER_SUPPLY_HEALTH_GOOD;
+		break;
+	default:
+		return 0;
+	}
+	return 0;
+}
+
+static int max77705_get_health(struct regmap *regmap, int *value)
+{
+	int ret, is_online = 0;
+
+	ret = max77705_get_online(regmap, &is_online);
+	if (ret)
+		return ret;
+	if (is_online) {
+		ret = max77705_get_vbus_state(regmap, value);
+		if (ret || (*value != POWER_SUPPLY_HEALTH_GOOD))
+			return ret;
+	}
+	ret = max77705_get_battery_health(regmap, value);
+	if (ret)
+		return ret;
+	return ret;
+}
+
+static int max77705_get_input_current(struct max77705_charger_data *charger)
+{
+	unsigned int reg_data;
+	int get_current = 0;
+	struct regmap *regmap = charger->max77705->regmap_charger;
+
+	regmap_read(regmap,
+			  MAX77705_CHG_REG_CNFG_09, &reg_data);
+	/* AND operation for removing the formal 1bit  */
+	reg_data &= MAX77705_CHG_CHGIN_LIM_MASK;
+
+	if (reg_data <= 0x3)
+		get_current = 100;
+	else if (reg_data >= 0x7F)
+		get_current = 3200;
+	else
+		get_current = (reg_data + 0x01) * 25;
+
+	dev_dbg(charger->dev, "reg:(0x%x), charging_current:(%d)\n",
+			reg_data, get_current);
+
+	return get_current;
+}
+
+static void max77705_set_input_current(struct max77705_charger_data *charger,
+					int input_current)
+{
+	int curr_step = 25;
+	u8 set_reg, set_mask, reg_data = 0;
+	struct regmap *regmap = charger->max77705->regmap_charger;
+
+	mutex_lock(&charger->charger_mutex);
+
+
+	set_reg = MAX77705_CHG_REG_CNFG_09;
+	set_mask = MAX77705_CHG_CHGIN_LIM_MASK;
+
+	if (input_current < 100) {
+		reg_data = 0x00;
+		regmap_update_bits(regmap, set_reg, set_mask, reg_data);
+	} else {
+		input_current = (input_current > 3200) ? 3200 : input_current;
+		reg_data = (input_current / curr_step) - 0x01;
+		regmap_update_bits(regmap, set_reg, set_mask, reg_data);
+	}
+
+	mutex_unlock(&charger->charger_mutex);
+	dev_dbg(charger->dev, "REG(0x%02x) DATA(0x%02x), CURRENT(%d)\n",
+		set_reg, reg_data, input_current);
+}
+
+static int max77705_get_float_voltage(struct max77705_charger_data *charger)
+{
+	unsigned int reg_data = 0;
+	int float_voltage;
+	struct regmap *regmap = charger->max77705->regmap_charger;
+
+	regmap_read(regmap, MAX77705_CHG_REG_CNFG_04, &reg_data);
+	reg_data &= 0x3F;
+	float_voltage = reg_data <= 0x04 ? reg_data * 50 + 4000 :
+					(reg_data - 4) * 10 + 4200;
+	dev_dbg(charger->dev, "battery cv reg : 0x%x, float voltage val : %d\n",
+		reg_data, float_voltage);
+
+	return float_voltage;
+}
+
+static void max77705_set_float_voltage(struct max77705_charger_data *charger,
+					int float_voltage)
+{
+	int float_voltage_mv;
+	unsigned int reg_data = 0;
+	struct regmap *regmap = charger->max77705->regmap_charger;
+
+	float_voltage_mv = float_voltage / 1000;
+	reg_data = float_voltage_mv <= 4000 ? 0x0 :
+		float_voltage_mv >= 4500 ? 0x23 :
+		(float_voltage_mv <= 4200) ? (float_voltage_mv - 4000) / 50 :
+		(((float_voltage_mv - 4200) / 10) + 0x04);
+
+	regmap_update_bits(regmap, MAX77705_CHG_REG_CNFG_04,
+				CHG_CNFG_04_CHG_CV_PRM_MASK,
+				(reg_data << CHG_CNFG_04_CHG_CV_PRM_SHIFT));
+
+	regmap_read(regmap, MAX77705_CHG_REG_CNFG_04, &reg_data);
+	dev_dbg(charger->dev, "battery cv voltage 0x%x\n", reg_data);
+}
+
+static bool max77705_check_battery(struct max77705_charger_data *charger)
+{
+	unsigned int reg_data;
+	unsigned int reg_data2;
+	struct regmap *regmap = charger->max77705->regmap_charger;
+
+
+	regmap_read(regmap, MAX77705_CHG_REG_INT_OK, &reg_data);
+
+	dev_dbg(charger->dev, "CHG_INT_OK(0x%x)\n", reg_data);
+
+	regmap_read(regmap,
+			  MAX77705_CHG_REG_DETAILS_00, &reg_data2);
+
+	dev_dbg(charger->dev, "CHG_DETAILS00(0x%x)\n", reg_data2);
+
+	if ((reg_data & MAX77705_BATP_OK) || !(reg_data2 & MAX77705_BATP_DTLS))
+		return true;
+	else
+		return false;
+}
+
+static int max77705_get_charge_type(struct regmap *regmap,
+					union power_supply_propval *val)
+{
+	unsigned int reg_data;
+
+	regmap_read(regmap, MAX77705_CHG_REG_DETAILS_01, &reg_data);
+	reg_data &= 0x0F;
+	switch (reg_data) {
+	case MAX77705_CHARGER_CONSTANT_CURRENT:
+		val->strval = "CC Mode";
+		break;
+	case MAX77705_CHARGER_CONSTANT_VOLTAGE:
+		val->strval = "CV Mode";
+		break;
+	case MAX77705_CHARGER_END_OF_CHARGE:
+		val->strval = "EOC";
+		break;
+	case MAX77705_CHARGER_DONE:
+		val->strval = "DONE";
+		break;
+	default:
+		val->strval = "NONE";
+		break;
+	}
+
+	return 0;
+}
+
+static int max77705_get_charge_current(struct max77705_charger_data *charger)
+{
+	unsigned int reg_data;
+	int get_current = 0;
+	struct regmap *regmap = charger->max77705->regmap_charger;
+
+
+	regmap_read(regmap, MAX77705_CHG_REG_CNFG_02, &reg_data);
+	reg_data &= MAX77705_CHG_CC;
+
+	get_current = reg_data <= 0x2 ? 100 : reg_data * 50;
+
+	dev_dbg(charger->dev, "reg:(0x%x), charging_current:(%d)\n",
+			reg_data, get_current);
+	return get_current;
+}
+
+static void max77705_set_charge_current(struct max77705_charger_data *charger,
+					int fast_charging_current)
+{
+	int curr_step = 50;
+	u8 set_mask, reg_data = 0;
+	struct regmap *regmap = charger->max77705->regmap_charger;
+
+	set_mask = MAX77705_CHG_CC;
+
+	if (fast_charging_current < 100) {
+		regmap_update_bits(regmap, MAX77705_CHG_REG_CNFG_02, set_mask, 0x00);
+	} else {
+		fast_charging_current =
+			(fast_charging_current > 3150) ? 3150 : fast_charging_current;
+
+		reg_data |= (fast_charging_current / curr_step);
+		regmap_update_bits(regmap, MAX77705_CHG_REG_CNFG_02, set_mask, reg_data);
+	}
+
+	dev_dbg(charger->dev, "REG(0x%02x) DATA(0x%02x), CURRENT(%d)\n",
+		MAX77705_CHG_REG_CNFG_02,
+		reg_data, fast_charging_current);
+}
+
+static int max77705_chg_set_wdtmr_en(struct max77705_charger_data *charger, bool enable)
+{
+	dev_dbg(charger->dev, "WDT en = %d\n", enable);
+	struct regmap *regmap = charger->max77705->regmap_charger;
+
+	if (enable) {
+		regmap_update_bits(regmap, MAX77705_CHG_REG_CNFG_00,
+					CHG_CNFG_00_WDTEN_MASK, CHG_CNFG_00_WDTEN_MASK);
+	} else {
+		regmap_update_bits(regmap, MAX77705_CHG_REG_CNFG_00,
+					 CHG_CNFG_00_WDTEN_MASK, 0);
+	}
+
+	return 0;
+}
+
+static void max77705_charger_initialize(struct max77705_charger_data *charger)
+{
+	u8 reg_data;
+	struct power_supply_battery_info *info;
+	struct regmap *regmap = charger->max77705->regmap_charger;
+
+	if (power_supply_get_battery_info(charger->psy_chg, &info) < 0)
+		return;
+
+	charger->bat_info = info;
+
+	/* unlock charger setting protect
+	 * slowest LX slope
+	 */
+	reg_data = MAX77705_CHGPROT_MASK | MAX77705_SLOWEST_LX_SLOPE;
+	regmap_update_bits(regmap, MAX77705_CHG_REG_CNFG_06, reg_data,
+						reg_data);
+
+	/*
+	 * fast charge timer disable
+	 * restart threshold disable
+	 * pre-qual charge disable
+	 */
+	reg_data = (MAX77705_FCHGTIME_DISABLE << CHG_CNFG_01_FCHGTIME_SHIFT) |
+			(MAX77705_CHG_RSTRT_DISABLE << CHG_CNFG_01_CHG_RSTRT_SHIFT) |
+			(MAX77705_CHG_PQEN_DISABLE << CHG_CNFG_01_PQEN_SHIFT);
+	regmap_update_bits(regmap, MAX77705_CHG_REG_CNFG_01,
+						(CHG_CNFG_01_FCHGTIME_MASK |
+						CHG_CNFG_01_CHG_RSTRT_MASK |
+						CHG_CNFG_01_PQEN_MASK),
+						reg_data);
+
+	/*
+	 * OTG off(UNO on), boost off
+	 */
+	regmap_update_bits(regmap, MAX77705_CHG_REG_CNFG_00,
+				CHG_CNFG_00_OTG_CTRL, 0);
+
+	/*
+	 * charge current 450mA(default)
+	 * otg current limit 900mA
+	 */
+	regmap_update_bits(regmap, MAX77705_CHG_REG_CNFG_02,
+				CHG_CNFG_02_OTG_ILIM_MASK,
+				MAX77705_OTG_ILIM_900 << CHG_CNFG_02_OTG_ILIM_SHIFT);
+
+	/* BAT to SYS OCP 4.80A */
+	regmap_update_bits(regmap, MAX77705_CHG_REG_CNFG_05,
+				CHG_CNFG_05_REG_B2SOVRC_MASK,
+				MAX77705_B2SOVRC_4_8A << CHG_CNFG_05_REG_B2SOVRC_SHIFT);
+	/*
+	 * top off current 150mA
+	 * top off timer 30min
+	 */
+	reg_data = (MAX77705_TO_ITH_150MA << CHG_CNFG_03_TO_ITH_SHIFT) |
+			(MAX77705_TO_TIME_30M << CHG_CNFG_03_TO_TIME_SHIFT) |
+			(MAX77705_SYS_TRACK_DISABLE << CHG_CNFG_03_SYS_TRACK_DIS_SHIFT);
+	regmap_update_bits(regmap, MAX77705_CHG_REG_CNFG_03,
+			   (CHG_CNFG_03_TO_ITH_MASK |
+			   CHG_CNFG_03_TO_TIME_MASK |
+			   CHG_CNFG_03_SYS_TRACK_DIS_MASK), reg_data);
+
+	/*
+	 * cv voltage 4.2V or 4.35V
+	 * MINVSYS 3.6V(default)
+	 */
+	if (info->voltage_max_design_uv < 0) {
+		dev_warn(charger->dev, "missing battery:voltage-max-design-microvolt\n");
+		max77705_set_float_voltage(charger, 4200000);
+	} else {
+		max77705_set_float_voltage(charger, info->voltage_max_design_uv);
+	}
+
+	/* VCHGIN : REG=4.5V, UVLO=4.7V, WCHGIN : REG=4.5V, UVLO=4.7V */
+	regmap_update_bits(regmap, MAX77705_CHG_REG_CNFG_12,
+				CHG_CNFG_12_VCHGIN_REG_MASK | CHG_CNFG_12_WCIN_REG_MASK, 0);
+
+	/* Boost mode possible in FACTORY MODE */
+	regmap_update_bits(regmap, MAX77705_CHG_REG_CNFG_07,
+				CHG_CNFG_07_REG_FMBST_MASK, MAX77705_CHG_FMBST);
+
+	/* Watchdog timer */
+	max77705_chg_set_wdtmr_en(charger, 0);
+
+	/* Active Discharge Enable */
+	regmap_update_bits(regmap, MAX77705_PMIC_REG_MAINCTRL1, 1, 1);
+
+	regmap_update_bits(regmap, MAX77705_CHG_REG_CNFG_09, MAX77705_CHG_EN, MAX77705_CHG_EN);
+
+	/* VBYPSET=5.0V */
+	regmap_update_bits(regmap, MAX77705_CHG_REG_CNFG_11, CHG_CNFG_11_VBYPSET_MASK, 0);
+
+	/* Switching Frequency : 1.5MHz */
+	regmap_update_bits(regmap, MAX77705_CHG_REG_CNFG_08, CHG_CNFG_08_REG_FSW_MASK,
+				(MAX77705_CHG_FSW_1_5MHz << CHG_CNFG_08_REG_FSW_SHIFT));
+
+	/* Auto skip mode */
+	regmap_update_bits(regmap, MAX77705_CHG_REG_CNFG_12, CHG_CNFG_12_REG_DISKIP_MASK,
+				(MAX77705_AUTO_SKIP << CHG_CNFG_12_REG_DISKIP_SHIFT));
+}
+
+static bool max77705_charger_unlock(struct max77705_charger_data *charger)
+{
+	unsigned int reg_data;
+	unsigned int chgprot;
+	int retry_cnt = 0;
+	bool need_init = false;
+	struct regmap *regmap = charger->max77705->regmap_charger;
+
+	do {
+		regmap_read(regmap, MAX77705_CHG_REG_CNFG_06,
+				  &reg_data);
+		chgprot = (reg_data & MAX77705_CHGPROT_MASK);
+		if (chgprot != MAX77705_CHGPROT_UNLOCKED) {
+			dev_err(charger->dev, "unlock err, chgprot(0x%x), retry(%d)\n",
+					chgprot, retry_cnt);
+			regmap_update_bits(regmap, MAX77705_CHG_REG_CNFG_06,
+						MAX77705_CHGPROT_MASK, MAX77705_CHGPROT_MASK);
+			need_init = true;
+			msleep(20);
+		} else
+			break;
+	} while ((chgprot != MAX77705_CHGPROT_UNLOCKED) && (++retry_cnt < 10));
+
+	return need_init;
+}
+
+static int max77705_prop_writeable(struct power_supply *psy,
+					  enum power_supply_property psp)
+{
+	return (psp == POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT) ||
+		(psp == POWER_SUPPLY_PROP_VOLTAGE_MAX_DESIGN) ||
+		(psp == POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT) ||
+		(psp == POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOLTAGE);
+}
+
+static int max77705_chg_set_property(struct power_supply *psy,
+					enum power_supply_property psp,
+					const union power_supply_propval *val)
+{
+	struct max77705_charger_data *charger = power_supply_get_drvdata(psy);
+
+	/* check unlock status before does set the register */
+	max77705_charger_unlock(charger);
+	switch (psp) {
+	case POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT:
+		max77705_set_input_current(charger, val->intval);
+		break;
+	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT:
+		max77705_set_charge_current(charger, val->intval);
+		break;
+	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOLTAGE:
+		if (val->intval > charger->bat_info->voltage_max_design_uv) {
+			dev_err(charger->dev, "%d voltage higher than max",
+				val->intval);
+			return -EINVAL;
+		}
+		max77705_set_float_voltage(charger, val->intval);
+		break;
+	default:
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static int max77705_chg_get_property(struct power_supply *psy,
+					enum power_supply_property psp,
+					union power_supply_propval *val)
+{
+	int ret = 0;
+	struct max77705_charger_data *charger = power_supply_get_drvdata(psy);
+	struct regmap *regmap = charger->max77705->regmap_charger;
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_ONLINE:
+		max77705_get_online(regmap, &val->intval);
+		break;
+	case POWER_SUPPLY_PROP_PRESENT:
+		val->intval = max77705_check_battery(charger);
+		break;
+	case POWER_SUPPLY_PROP_STATUS:
+		val->intval = max77705_get_charger_state(charger);
+		break;
+	case POWER_SUPPLY_PROP_HEALTH:
+		ret = max77705_get_health(regmap, &val->intval);
+		break;
+	case POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT:
+		val->intval = max77705_get_input_current(charger);
+		break;
+	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT:
+		val->intval = max77705_get_charge_current(charger);
+		break;
+	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOLTAGE:
+		val->intval = max77705_get_float_voltage(charger);
+		break;
+	case POWER_SUPPLY_PROP_VOLTAGE_MAX_DESIGN:
+		val->intval = charger->bat_info->voltage_max_design_uv;
+		break;
+	case POWER_SUPPLY_PROP_CHARGE_TYPE:
+		ret = max77705_get_charge_type(regmap, val);
+		break;
+	case POWER_SUPPLY_PROP_MODEL_NAME:
+		val->strval = max77705_charger_model;
+		break;
+	case POWER_SUPPLY_PROP_MANUFACTURER:
+		val->strval = max77705_charger_manufacturer;
+		break;
+	default:
+		return -EINVAL;
+	}
+	return ret;
+}
+
+static void max77705_chgin_isr_work(struct work_struct *work)
+{
+	struct max77705_charger_data *charger =
+		container_of(work, struct max77705_charger_data, chgin_work);
+	regmap_update_bits(charger->max77705->regmap_charger,
+						MAX77705_CHG_REG_INT_MASK,
+						MAX77705_CHGIN_IM, MAX77705_CHGIN_IM);
+	power_supply_changed(charger->psy_chg);
+	regmap_update_bits(charger->max77705->regmap_charger,
+						MAX77705_CHG_REG_INT_MASK,
+						MAX77705_CHGIN_IM, 0);
+}
+
+static irqreturn_t max77705_chgin_irq(int irq, void *data)
+{
+	struct max77705_charger_data *charger = data;
+
+	queue_work(charger->wqueue, &charger->chgin_work);
+
+	return IRQ_HANDLED;
+}
+
+static int max77705_debugfs_show(struct seq_file *s, void *data)
+{
+	struct max77705_charger_data *charger = s->private;
+	struct regmap *regmap = charger->max77705->regmap_charger;
+	unsigned int reg, reg_data;
+
+	seq_printf(s, "MAX77705 CHARGER IC, ver.0x%x\n", charger->pmic_ver);
+	seq_puts(s, "===================\n");
+	for (reg = 0xB0; reg <= 0xC3; reg++) {
+		regmap_read(regmap, reg, &reg_data);
+		seq_printf(s, "0x%02x:\t0x%02x\n", reg, reg_data);
+	}
+
+	seq_puts(s, "\n");
+	return 0;
+}
+
+static int max77705_debugfs_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, max77705_debugfs_show, inode->i_private);
+}
+
+static const struct file_operations max77705_debugfs_fops = {
+	.open = max77705_debugfs_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release,
+};
+
+static const struct power_supply_desc max77705_charger_power_supply_desc = {
+	.name = MAX77705_CHARGER_NAME,
+	.type		= POWER_SUPPLY_TYPE_BATTERY,
+	.properties = max77705_charger_props,
+	.num_properties = ARRAY_SIZE(max77705_charger_props),
+	.get_property = max77705_chg_get_property,
+	.set_property = max77705_chg_set_property,
+	.property_is_writeable = max77705_prop_writeable,
+};
+
+static int max77705_charger_probe(struct platform_device *pdev)
+{
+	struct max77705_dev *max77705 = dev_get_drvdata(pdev->dev.parent);
+	struct max77705_platform_data *pdata = dev_get_platdata(max77705->dev);
+	struct max77705_charger_data *charger;
+	struct regmap *regmap = max77705->regmap_charger;
+	struct power_supply_config charger_cfg = { };
+	int ret = 0;
+	unsigned int reg_data;
+
+	charger = kzalloc(sizeof(*charger), GFP_KERNEL);
+	if (!charger)
+		return -ENOMEM;
+
+	mutex_init(&charger->charger_mutex);
+
+	charger->dev = &pdev->dev;
+	charger->max77705 = max77705;
+	charger->max77705_pdata = pdata;
+
+	platform_set_drvdata(pdev, charger);
+
+	regmap_read(regmap, MAX77705_CHG_REG_INT_OK, &reg_data);
+
+	if (regmap_read
+		(max77705->regmap, MAX77705_PMIC_REG_PMICREV, &reg_data) < 0) {
+		dev_err(charger->dev,
+			"device not found on this channel (this is not an error)\n");
+		ret = -ENOMEM;
+	} else {
+		charger->pmic_ver = (reg_data & 0x7);
+		dev_dbg(charger->dev, "device found : ver.0x%x\n", charger->pmic_ver);
+	}
+
+	debugfs_file = debugfs_create_file("max77705-charger-regs",
+				0664, NULL, (void *)charger,
+				  &max77705_debugfs_fops);
+	if (!debugfs_file)
+		dev_err(charger->dev, "Failed to create debugfs file\n");
+
+	charger_cfg.drv_data = charger;
+	charger_cfg.of_node = charger->dev->of_node;
+
+	charger->psy_chg =
+		devm_power_supply_register(&pdev->dev,
+				  &max77705_charger_power_supply_desc,
+				  &charger_cfg);
+	if (IS_ERR(charger->psy_chg)) {
+		dev_err(charger->dev, "Failed to Register psy_chg\n");
+		goto err_free;
+	}
+
+	max77705_charger_initialize(charger);
+
+	charger->wqueue = create_singlethread_workqueue(dev_name(&pdev->dev));
+	if (!charger->wqueue) {
+		pr_err("%s: Fail to Create Workqueue\n", __func__);
+		goto err_free;
+	}
+	INIT_WORK(&charger->chgin_work, max77705_chgin_isr_work);
+
+	charger->irq_chgin = max77705->irq_base + MAX77705_CHG_IRQ_CHGIN_I;
+	ret = devm_request_threaded_irq(charger->dev, charger->irq_chgin, NULL,
+					max77705_chgin_irq, 0, "chgin-irq", charger);
+	if (ret < 0) {
+		pr_err("%s: fail to request chgin IRQ: %d: %d\n",
+				__func__, charger->irq_chgin, ret);
+	} else {
+		max77705_irq_unmask_subdevice(max77705, MAX77705_IRQSRC_CHG);
+	}
+
+	return 0;
+
+err_free:
+	kfree(charger);
+
+	return ret;
+}
+
+static void max77705_charger_remove(struct platform_device *pdev)
+{
+	struct max77705_charger_data *charger = platform_get_drvdata(pdev);
+	struct regmap *regmap = charger->max77705->regmap_charger;
+
+	max77705_irq_mask_subdevice(charger->max77705, MAX77705_IRQSRC_CHG);
+
+	if (regmap) {
+		u8 reg_data;
+
+		reg_data = CHG_CNFG_00_BUCK_MASK;
+		regmap_write(regmap, MAX77705_CHG_REG_CNFG_00, reg_data);
+		reg_data = max77705_convert_ma_to_chgin_ilim_value(500);
+		regmap_write(regmap, MAX77705_CHG_REG_CNFG_09, reg_data);
+		reg_data = max77705_convert_ma_to_wcin_ilim_value(320);
+		regmap_write(regmap, MAX77705_CHG_REG_CNFG_10, reg_data);
+		reg_data = CHG_CNFG_12_CHGINSEL_MASK | CHG_CNFG_12_WCINSEL_MASK;
+		regmap_write(regmap, MAX77705_CHG_REG_CNFG_12, reg_data);
+	} else {
+		dev_err(charger->dev, "no max77705 i2c client\n");
+	}
+
+	if (debugfs_file)
+		debugfs_remove(debugfs_file);
+
+	kfree(charger);
+}
+
+static const struct platform_device_id max77705_charger_id[] = {
+	{ "max77705-charger", 0, },
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, max77705_charger_id);
+
+static struct platform_driver max77705_charger_driver = {
+	.driver = {
+		.name = "max77705-charger",
+	},
+	.probe = max77705_charger_probe,
+	.remove_new = max77705_charger_remove,
+	.id_table	= max77705_charger_id,
+};
+module_platform_driver(max77705_charger_driver);
+
+MODULE_AUTHOR("Dzmitry Sankouski <dsankouski@gmail.com>");
+MODULE_DESCRIPTION("Maxim 77705 charger driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/max77705_charger.h b/include/linux/mfd/max77705_charger.h
new file mode 100644
index 000000000000..816bb63d9583
--- /dev/null
+++ b/include/linux/mfd/max77705_charger.h
@@ -0,0 +1,225 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * max77705_charger.h
+ * Samsung max77705 Charger Header
+ *
+ * Copyright (C) 2015 Samsung Electronics, Inc.
+ *
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ */
+
+#ifndef __MAX77705_CHARGER_H
+#define __MAX77705_CHARGER_H __FILE__
+
+#include <linux/mfd/core.h>
+#include <linux/mfd/max77705.h>
+#include <linux/mfd/max77705-private.h>
+#include <linux/regulator/machine.h>
+
+/* MAX77705_CHG_REG_CHG_INT */
+#define MAX77705_BYP_I                  BIT(0)
+#define MAX77705_INP_LIMIT_I		BIT(1)
+#define MAX77705_BATP_I                 BIT(2)
+#define MAX77705_BAT_I                  BIT(3)
+#define MAX77705_CHG_I                  BIT(4)
+#define MAX77705_WCIN_I                 BIT(5)
+#define MAX77705_CHGIN_I                BIT(6)
+#define MAX77705_AICL_I                 BIT(7)
+
+/* MAX77705_CHG_REG_CHG_INT_MASK */
+#define MAX77705_BYP_IM                 BIT(0)
+#define MAX77705_INP_LIMIT_IM		BIT(1)
+#define MAX77705_BATP_IM                BIT(2)
+#define MAX77705_BAT_IM                 BIT(3)
+#define MAX77705_CHG_IM                 BIT(4)
+#define MAX77705_WCIN_IM                BIT(5)
+#define MAX77705_CHGIN_IM               BIT(6)
+#define MAX77705_AICL_IM                BIT(7)
+
+/* MAX77705_CHG_REG_CHG_INT_OK */
+#define MAX77705_BYP_OK                 BIT(0)
+#define MAX77705_DISQBAT_OK		BIT(1)
+#define MAX77705_BATP_OK		BIT(2)
+#define MAX77705_BAT_OK                 BIT(3)
+#define MAX77705_CHG_OK                 BIT(4)
+#define MAX77705_WCIN_OK		BIT(5)
+#define MAX77705_CHGIN_OK               BIT(6)
+#define MAX77705_AICL_OK                BIT(7)
+
+/* MAX77705_CHG_REG_CHG_DTLS_00 */
+#define MAX77705_BATP_DTLS		BIT(0)
+#define MAX77705_WCIN_DTLS		(BIT(3) | BIT(4))
+#define MAX77705_WCIN_DTLS_SHIFT	3
+#define MAX77705_CHGIN_DTLS             (BIT(5) | BIT(6))
+#define MAX77705_CHGIN_DTLS_SHIFT       5
+
+/* MAX77705_CHG_REG_CHG_DTLS_01 */
+#define MAX77705_CHG_DTLS               (BIT(0) | BIT(1) | BIT(2) | BIT(3))
+#define MAX77705_CHG_DTLS_SHIFT         0
+#define MAX77705_BAT_DTLS               (BIT(4) | BIT(5) | BIT(6))
+#define MAX77705_BAT_DTLS_SHIFT         4
+
+/* MAX77705_CHG_REG_CHG_DTLS_02 */
+#define MAX77705_BYP_DTLS               (BIT(0) | BIT(1) | BIT(2) | BIT(3))
+#define MAX77705_BYP_DTLS_SHIFT         0
+
+/* MAX77705_CHG_REG_CHG_CNFG_00 */
+#define CHG_CNFG_00_MODE_SHIFT		        0
+#define CHG_CNFG_00_CHG_SHIFT		        0
+#define CHG_CNFG_00_UNO_SHIFT		        1
+#define CHG_CNFG_00_OTG_SHIFT		        1
+#define CHG_CNFG_00_BUCK_SHIFT		        2
+#define CHG_CNFG_00_BOOST_SHIFT		        3
+#define CHG_CNFG_00_WDTEN_SHIFT		        4
+#define CHG_CNFG_00_MODE_MASK		        (0x0F << CHG_CNFG_00_MODE_SHIFT)
+#define CHG_CNFG_00_CHG_MASK		        BIT(CHG_CNFG_00_CHG_SHIFT)
+#define CHG_CNFG_00_UNO_MASK		        BIT(CHG_CNFG_00_UNO_SHIFT)
+#define CHG_CNFG_00_OTG_MASK		        BIT(CHG_CNFG_00_OTG_SHIFT)
+#define CHG_CNFG_00_BUCK_MASK		        BIT(CHG_CNFG_00_BUCK_SHIFT)
+#define CHG_CNFG_00_BOOST_MASK		        BIT(CHG_CNFG_00_BOOST_SHIFT)
+#define CHG_CNFG_00_WDTEN_MASK		        BIT(CHG_CNFG_00_WDTEN_SHIFT)
+#define CHG_CNFG_00_UNO_CTRL			(CHG_CNFG_00_UNO_MASK | CHG_CNFG_00_BOOST_MASK)
+#define CHG_CNFG_00_OTG_CTRL			(CHG_CNFG_00_OTG_MASK | CHG_CNFG_00_BOOST_MASK)
+
+/* MAX77705_CHG_REG_CHG_CNFG_01 */
+#define CHG_CNFG_01_FCHGTIME_SHIFT			0
+#define CHG_CNFG_01_FCHGTIME_MASK			(0x7 << CHG_CNFG_01_FCHGTIME_SHIFT)
+#define MAX77705_FCHGTIME_DISABLE			0x0
+
+#define CHG_CNFG_01_CHG_RSTRT_SHIFT	4
+#define CHG_CNFG_01_CHG_RSTRT_MASK	(0x3 << CHG_CNFG_01_CHG_RSTRT_SHIFT)
+#define MAX77705_CHG_RSTRT_DISABLE	0x3
+
+#define CHG_CNFG_01_PQEN_SHIFT			7
+#define CHG_CNFG_01_PQEN_MASK			(0x1 << CHG_CNFG_01_PQEN_SHIFT)
+#define MAX77705_CHG_PQEN_DISABLE		0x0
+#define MAX77705_CHG_PQEN_ENABLE		0x1
+
+/* MAX77705_CHG_REG_CHG_CNFG_02 */
+#define CHG_CNFG_02_OTG_ILIM_SHIFT		6
+#define CHG_CNFG_02_OTG_ILIM_MASK		(0x3 << CHG_CNFG_02_OTG_ILIM_SHIFT)
+#define MAX77705_OTG_ILIM_500		0x0
+#define MAX77705_OTG_ILIM_900		0x1
+#define MAX77705_OTG_ILIM_1200		0x2
+#define MAX77705_OTG_ILIM_1500		0x3
+#define MAX77705_CHG_CC                         0x3F
+
+/* MAX77705_CHG_REG_CHG_CNFG_03 */
+#define CHG_CNFG_03_TO_ITH_SHIFT		0
+#define CHG_CNFG_03_TO_ITH_MASK			(0x7 << CHG_CNFG_03_TO_ITH_SHIFT)
+#define MAX77705_TO_ITH_150MA			0x0
+
+#define CHG_CNFG_03_TO_TIME_SHIFT		3
+#define CHG_CNFG_03_TO_TIME_MASK			(0x7 << CHG_CNFG_03_TO_TIME_SHIFT)
+#define MAX77705_TO_TIME_30M			0x3
+
+#define CHG_CNFG_03_SYS_TRACK_DIS_SHIFT		7
+#define CHG_CNFG_03_SYS_TRACK_DIS_MASK		(0x1 << CHG_CNFG_03_SYS_TRACK_DIS_SHIFT)
+#define MAX77705_SYS_TRACK_ENABLE	        0x0
+#define MAX77705_SYS_TRACK_DISABLE	        0x1
+
+/* MAX77705_CHG_REG_CHG_CNFG_04 */
+#define MAX77705_CHG_MINVSYS_MASK               0xC0
+#define MAX77705_CHG_MINVSYS_SHIFT		6
+#define MAX77705_CHG_PRM_MASK                   0x1F
+#define MAX77705_CHG_PRM_SHIFT                  0
+
+#define CHG_CNFG_04_CHG_CV_PRM_SHIFT            0
+#define CHG_CNFG_04_CHG_CV_PRM_MASK             (0x3F << CHG_CNFG_04_CHG_CV_PRM_SHIFT)
+
+/* MAX77705_CHG_REG_CHG_CNFG_05 */
+#define CHG_CNFG_05_REG_B2SOVRC_SHIFT	0
+#define CHG_CNFG_05_REG_B2SOVRC_MASK	(0xF << CHG_CNFG_05_REG_B2SOVRC_SHIFT)
+#define MAX77705_B2SOVRC_DISABLE	0x0
+#define MAX77705_B2SOVRC_4_5A		0x6
+#define MAX77705_B2SOVRC_4_8A		0x8
+#define MAX77705_B2SOVRC_5_0A		0x9
+
+/* MAX77705_CHG_CNFG_06 */
+#define CHG_CNFG_01_WDTCLR_SHIFT		0
+#define CHG_CNFG_01_WDTCLR_MASK			(0x3 << CHG_CNFG_01_WDTCLR_SHIFT)
+#define MAX77705_WDTCLR				0x01
+#define MAX77705_CHGPROT_MASK	(BIT(2) | BIT(3))
+#define MAX77705_CHGPROT_UNLOCKED	(BIT(2) | BIT(3))
+#define MAX77705_SLOWEST_LX_SLOPE	(BIT(5) | BIT(6))
+
+/* MAX77705_CHG_REG_CHG_CNFG_07 */
+#define MAX77705_CHG_FMBST			0x04
+#define CHG_CNFG_07_REG_FMBST_SHIFT		2
+#define CHG_CNFG_07_REG_FMBST_MASK		(0x1 << CHG_CNFG_07_REG_FMBST_SHIFT)
+#define CHG_CNFG_07_REG_FGSRC_SHIFT		1
+#define CHG_CNFG_07_REG_FGSRC_MASK		(0x1 << CHG_CNFG_07_REG_FGSRC_SHIFT)
+
+/* MAX77705_CHG_REG_CHG_CNFG_08 */
+#define CHG_CNFG_08_REG_FSW_SHIFT	0
+#define CHG_CNFG_08_REG_FSW_MASK	(0x3 << CHG_CNFG_08_REG_FSW_SHIFT)
+#define MAX77705_CHG_FSW_3MHz		0x00
+#define MAX77705_CHG_FSW_2MHz		0x01
+#define MAX77705_CHG_FSW_1_5MHz		0x02
+
+/* MAX77705_CHG_REG_CHG_CNFG_09 */
+#define MAX77705_CHG_CHGIN_LIM_MASK     0x7F
+#define MAX77705_CHG_EN                         0x80
+
+/* MAX77705_CHG_REG_CHG_CNFG_10 */
+#define MAX77705_CHG_WCIN_LIM                   0x3F
+
+/* MAX77705_CHG_REG_CHG_CNFG_11 */
+#define CHG_CNFG_11_VBYPSET_SHIFT		0
+#define CHG_CNFG_11_VBYPSET_MASK		(0x7F << CHG_CNFG_11_VBYPSET_SHIFT)
+
+/* MAX77705_CHG_REG_CHG_CNFG_12 */
+#define CHG_CNFG_12_CHGINSEL_SHIFT		5
+#define MAX77705_CHG_WCINSEL			BIT(CHG_CNFG_12_CHGINSEL_SHIFT)
+#define CHG_CNFG_12_CHGINSEL_MASK		BIT(CHG_CNFG_12_CHGINSEL_SHIFT)
+#define CHG_CNFG_12_WCINSEL_SHIFT		6
+#define CHG_CNFG_12_WCINSEL_MASK		BIT(CHG_CNFG_12_WCINSEL_SHIFT)
+#define CHG_CNFG_12_VCHGIN_REG_MASK		(0x3 << 3)
+#define CHG_CNFG_12_WCIN_REG_MASK		(0x3 << 1)
+#define CHG_CNFG_12_REG_DISKIP_SHIFT		0
+#define CHG_CNFG_12_REG_DISKIP_MASK		(0x1 << CHG_CNFG_12_REG_DISKIP_SHIFT)
+#define MAX77705_DISABLE_SKIP			0x1
+#define MAX77705_AUTO_SKIP			0x0
+
+/* Convert current in mA to corresponding CNFG09 value */
+inline u8 max77705_convert_ma_to_chgin_ilim_value(int cur)
+{
+	if (unlikely(cur < 0 && cur > 4000))
+		return 0;
+	return (((cur - 100) / 33) + 3);
+}
+
+/* Convert current in mA to corresponding CNFG10 value */
+inline u8 max77705_convert_ma_to_wcin_ilim_value(int cur)
+{
+	if (unlikely(cur < 0 && cur > 4000))
+		return 0;
+	return (((cur - 60) / 20) + 3);
+}
+
+struct max77705_charger_data {
+	struct device           *dev;
+	struct mutex            charger_mutex;
+
+	struct max77705_platform_data *max77705_pdata;
+	struct max77705_dev	*max77705;
+	struct power_supply_battery_info *bat_info;
+	struct workqueue_struct *wqueue;
+	struct work_struct	chgin_work;
+	int		irq_chgin;
+
+	struct power_supply	*psy_chg;
+
+	int pmic_ver;
+};
+
+#endif /* __MAX77705_CHARGER_H */

-- 
2.39.2

