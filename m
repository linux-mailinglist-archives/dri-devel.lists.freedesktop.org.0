Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5C8592B15
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 11:02:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F6295C86;
	Mon, 15 Aug 2022 09:02:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3393E112BA7
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 09:01:45 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id p18so5852219plr.8
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 02:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=FJfewIna3Ib507R/A7jMdp8TpFWTpq/l1JZjoGjf4xY=;
 b=LrhmmIBT1IN9alApQeIXw8XXjB2a/StrgKLNPxuvGgh0by6k4EagGqVqPtncf4nB2b
 IibTd1aq/wlR5oQQxknOZFyb0mbJfmA4c224AT4kqAAe5HGORM7Mon0f4cVMhPdDoqHX
 912GoUnBPVkVO9pOn86dZCZDJ+XJfYzzaxgU3ICrO4YwWPgiM6Gw5502XYjGCgEM4xVZ
 ixoAQ0dra+XJVE+9rGITxdfZQfSDGAqdfFkWV1nnI38PzT1Y6u8TsjTiH6DV44nk3Gye
 oPfTj3SsU3KUCSLrkgEshVEVYFdJ3d4po482hBUKPE//tbZQtGL8rkhFRqC9vCN4VH6l
 aL+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=FJfewIna3Ib507R/A7jMdp8TpFWTpq/l1JZjoGjf4xY=;
 b=3oSOHut6l6xvLHT4yYAvnblbWBjrXVof/Z/Yrj1GNhIDeOzD7OAuD271F6p4Xkefu4
 vtAd3RM660ARI8TD75zBRhfIb3rOex+swOSraPMYKdKNNRuTFRiwg8viWVL5XHy2vVzD
 keN/tsPEjF8YjhJPDJrYWFDiWFQYkIH0dAI8NDKJKND814uNYrkNPqc8pzORjXipTIs9
 xBd0a1dqNaGz6mf5Q3DrF6KRsUGsAuWVGJKoOccRhnrLR4Zc//XCmhdZJJxA3s86UfP2
 vo6ngjG8vUPRP/mGl7Tpo6i85YrUMkADehv5oMhggyLPX1YJaU8go9CvZwzc38Iax5dB
 I3XQ==
X-Gm-Message-State: ACgBeo3apSXi1pzFCqsZwJpV/U77LQCeGaCKB20xjKvLtHwWEtvCvEVg
 tE9uT4PjACgaRPbLfxtRmb4=
X-Google-Smtp-Source: AA6agR4i9U6xldbiIpmBJnNEFcpG5XKe02KhOmos8VjB8n8TJwGH9VeK+FnTbFbrGW0qj8Jf4+S2zA==
X-Received: by 2002:a17:90b:1a81:b0:1f4:f9ff:9028 with SMTP id
 ng1-20020a17090b1a8100b001f4f9ff9028mr27803616pjb.44.1660554104220; 
 Mon, 15 Aug 2022 02:01:44 -0700 (PDT)
Received: from DESKTOP-IBN2BAQ.localdomain ([123.110.155.185])
 by smtp.gmail.com with ESMTPSA id
 a17-20020a656411000000b00412a708f38asm5491612pgv.35.2022.08.15.02.01.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 02:01:43 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 linux@roeck-us.net, heikki.krogerus@linux.intel.com, deller@gmx.de,
 broonie@kernel.org, mazziesaccount@gmail.com, lgirdwood@gmail.com,
 andriy.shevchenko@linux.intel.com
Subject: [RESEND PATCH v8 00/12] Add MediaTek MT6370 PMIC support
Date: Mon, 15 Aug 2022 17:01:13 +0800
Message-Id: <20220815090125.27705-1-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

I apologize for using the wrong mail list to send the wrong emails
for the last v8 patchset...

This patch series add MediaTek MT6370 PMIC support and add a index macro
to <linear_range.h>. The MT6370 is a highly-integrated smart power management
IC, which includes a single cell Li-Ion/Li-Polymer switching battery charger,
a USB Type-C & Power Delivery (PD) controller, dual Flash LED current sources,
a RGB LED driver, a backlight WLED driver, a display bias driver and a
general LDO for portable devices.

First, in this series of patches,
'dt-binding: mfd', 'mfd driver' has been applied by Lee in the v7.
https://lore.kernel.org/all/YvJdpq0MWNPQZw5c@google.com/
https://lore.kernel.org/all/YvJdxEpC2cB58Bq9@google.com/

Second, the LED RGB driver is based on Andy Shevchenko's patch which moves
led_init_default_state_get() to the global header.
https://lore.kernel.org/all/20220805154907.32263-3-andriy.shevchenko@linux.intel.com/

In addition, we added a macro to the <<linear_range.h> for declaring the
linear_range struct simply (see patch v8-0006) and made some changes for
MT6370 drivers (see v8 section of the change log below).

Thank you,
ChiaEn Wu
---
Changes in v8:
- In Patch 06/12:
	- Add linear_range_idx macro for declaring the linear_range
	  struct simply.

- In Patch 09/12:
	- Remove MT6370_CHG_LINEAR_RANGE() macro, and change to use
	  LINEAR_RANGE_IDX() macro

- In Patch 10/12:
	- Add include header file <linux/leds.h>
	- Remove useless 'enum mt6370_state' because of using 'enum led_default_state'
	- Revise the calculation of 'val' in 'mt6370_gen_breath_pattern()'
	- Replace the medthod of getting default-state by using
	  led_init_default_state_get()

- In Patch 11/12:
	- Add missing 'dependency config' in Kconfig
	- Revise all multi-line comments

- In Patch 12/12:
	- Add missing header file <linux/property.h>
	- Remove useledd header file <linux/of_device.h>
	- Revise the comment of 'mt6370_check_vendor_info()'


Changes in v7:
- In Patch 05/13:
	- Add the second compatible string for 'mt6372'
	- Add 'mediatek,bled-exponential-mode-enable' property for enable the
	  exponential mode of backlight brightness
	- Add validation for the maximum value of 'default-brightness' and
	  'max-brightness'

- In Patch 07/13:
	- Move '#define MT6370_REG_MAXADDR' to the next line of
	  '#define MT6370_REG_CHG_MASK1'
	- Rename 'MT6370_REG_ADDRLEN' to 'MT6370_MAX_ADDRLEN'

- In Patch 08/13:
	- Revise 'devm_add_action_or_reset(dev, ...)' to one line
	- Revise 'return regmap_update_bits(...)' with using positive
	  conditional

- In Patch 09/13:
	- Add AICR(100mA ~ 350mA), ICHG(100mA ~ 800mA) macros
	- Remove 400mA AICR and 900mA ICHG macros
	- Revise using 'if-else' to 'switch-case' in mt6370_adc_read_scale()
	  where the adc channel is ibus or ibat

- In Patch 10/13:
	- Revise the method to enable/disable irq
	- Revise all 'if (ret < 0)' to 'if (ret)' after using
	  mt6370_chg_field_set/get()
	- Revise all 'OTG' text again

- In Patch 11/13:
	- Add the comment for the union of 'struct mt6370_led'
	- Revise the wrong description of 'Authors'
	- Revise some typos (e.g. led --> LED)
	- Revise 'if (!fwnode_property_read_string())' to
	  'ret = fwnode_property_read_string()'
	- Replace 'memcpy(...)' with 'put_unaligned_be24()' in
	  mt6370_gen_breath_pattern()
	- Replace all 'LED_OFF' with 0
	- Remove the redundant assignment in mt6370_mc_pattern_clear()

- In Patch 12/13:
	- Fix the indentation.
	- For the well defined macro, the parenthesis is needed for input parameters.
	- Replace some dev_warn to dev_info in 'init_flash_properties'.
	- Add sentinel comment for the terminator entry of of_device_id.
	- Use priv->fled_torch_used directly.
	- Delete 0 in {}.
	- Use _uA instead of _UA in definition.
	- Refine the description.
	- Use usleep_range instead of udelay.
	- Rename config to LEDS_MT6370_FLASH.
	- Add missing ">" in copyright.
	- Change the Kconfig order

- In Patch 13/13:
	- Add support 'exponential mode' property parsing
	- Add 'return dev_err_probe()' after 'if (IS_ERR(priv->enable_gpio))'
	- Add 'mt6372' compatible string
	- Revise Kconfig help text
	- Revise update()/get() for supporting 16384 steps (MT6372)
	- Revise all shift usages form using 'ffs() and fls()' to defining the
	  _SHIFT macros.
	- Revise 'brightness ? 1 : 0' to '!!brightness' in gpiod_set_value()


Changes in v6:
- In Patch 03/13:
	- Add 'reg' property of led of multi-led to prevent checking
	  error.

- In Patch 08/13:
	- Convert tcpci as device resource managed with
	  'devm_add_action_or_reset' api.
	- Refine remvoe callback.
	- Refine the commit text from 'this commit add' to 'add'.

- In Patch 09/13:
	- Using 'struct device *dev = &pdev->dev' in probe()
	- Revise the sixth parameter of regmap_read_poll_timeout() by
	  Replacing '1000' with 'MILLI'
	- Revise the units of three macros
	- MT6370_AICR_400MA --> MT6370_AICR_400_mA
	- MT6370_ICHG_500MA --> MT6370_ICHG_500_mA
	- MT6370_ICHG_900MA --> MT6370_ICHG_900_mA

- In patch 10/13:
	- Remove the varable (*psy_desc) of struct mt6370_priv
	- Remove the deprecated usb type (POWER_SUPPLY_TYPE_USB_CDP and
	  POWER_SUPPLY_TYPE_USB_DCP)
	- Remove useless remove()
	- Revise all units from mini- to micro-
	- Revise get/set power_supply_prop (change to directly return get/set
	  regmap_field)
	- Revise probe() and use devm_add_action_or_reset() for handling of the
	  workqueue/delayed_work/mutex
	- Revise mt6370_chg_psy_desc
		- Add '.name = "mt6370-charger"'
		- Use 'static const'

- In patch 11/13:
	- Remove the 'ko' from mt6370 led Kconfig description.
	- Add both authors for Alice and ChiYuan.
	- Use pdata to distinguish the code from mt6370/71 to mt6372.
	- Instead of 'state' define, use the 'state' enum.
	- Fix the typo for 'MT6372_PMW_DUTY'.
	- For pwm_duty define, replace with bit macro - 1.
	- Refine all the labels from 'out' to 'out_unlock'.
	- Use struct 'dev' variable and 'dev_err_probe' to optimize the LOC.
	- Revise for the array initialization from {0} to {}.
	- Move into rgb folder and rename file name to 'leds-mt6370-rgb'.
	- Refine the 'comma' usage in struct/enum.

- In patch 12/13:
	- Use 'GENMASK' instead of 'BIT'.
	- Use dev_err_probe to decrease LOC.
	- Use 'dev' variable to make probe function more clean.
	- Refine the return of _mt6370_flash_brightness_set function.
	- Refine the descriptions.
	- Use mt6370_clamp() instead of clamp_align().
	- Use device resource managed API for v4l2 flash_release.


Changes in v5:
- In patch 07/13:
	- Add the comma in the last REGMAP_IRQ_REG_LINE(),
	  DEFINE_RES_IRQ_NAMED() and MFD_CELL_RES()
	- Add the prefix in the first parameter of all mfd_cell
	- Move enum and struct mt6370_info to mt6370.h
	- Remove struct device *dev in struct mt6370_info
	- Revise the description of Kconfig help text
	- Revise MODULE_DESCRIPTION()

- In patch 08/13:
	- Add comma for the last index of mt6370_reg_init.
	- Use dev_err_probe to decrease LOC.
	- Use 'dev' variable to make probe function more clean.
	- Refine kconfig text.
	- Remove both 'else' in set_vbus callback.
	- Remove comma for of_device_id if the assigned member is only one.

- In patch 09/13:
	- Replace using snprintf() with sysfs_emit() in mt6370_adc_read_label()
	- Remove macro ADC_CONV_TIME_US
	- Revise all variable ordering
	- Revise the description of Kconfig help text
	- Revise MODULE_DESCRIPTION()

- In patch 10/13:
	- Replace unsigned int type of pwr_rdy with bool in
	  mt6370_chg_set_online()
	- Remove redundant 'else' in mt6370_chg_field_get()
	- Revise 'if-else' in mt6370_chg_field_set()
	- Revise 'if' condition in mt6370_chg_enable_irq()
	- Revise all text 'otg' --> 'OTG'
	- Revise MT6370_MIVR_IBUS_TH_100_MA --> MT6370_MIVR_IBUS_TH_100_mA
	- Revise the description of Kconfig help text

- In patch 12/13:
	- Refine the coding style.
	- Use "dev" instead of "&pdev->dev".

- In patch 13/13:
	- Add missed <mod_devicetable.h>
	- Add struct device *dev in probe() to make code cleaning
	- Remove useless including header file <gpio/driver.h>, <of.h>
	- Remove useless variable uasage in mt6370_init_backlight_properties()
	- Remove redundant checking enable_gpio in mt6370_bl_update_status()
	- Remove redundant parentheses in mt6370_bl_get_brightness()
	- Revise the description of Kconfig help text
	- Revise the calculation of hys_th_steps


Changes in v4:
- In patch 02/13:
	- Add minItems of "io-channel-names"
	- Replace text "Mediatek" with "MediaTek"

- In patch 06/13:
	- Roll back all "$ref: " to v2 patch style (using "/schemas/...")

- In patch 07/13:
	- Replace text "Mediatek" with "MediaTek" in Kconfig
	- Replace "first break and then return" with "return directly"
	  in "mt6370_check_vendor_info()"
	- Add module name related description in Kconfig helptext
	- Add Copyright in the source code
	- Add header file "mt6370.h" for all "#define IRQ"
	- Adjust Makefile order of MT6370
	- Refine "bank_idx" and "bank_addr" in
	  "mt6375_regmap_read()" / "mt6375_regmap_write()"
	- Refine redundant "else if" in "mt6370_regmap_read()"

- In patch 08/13:
	- Replace text "Mediatek" with "MediaTek" in Kconfig
	- Replace "first ret=regulator_(dis/en)able and then return"
	  with "return directly" in "mt6370_tcpc_set_vbus()"
	- Replace header file <linux/of.h> with <linux/mod_devicetable.h>
	- Add Copyright in the source code
	- Add module name related description in Kconfig helptext
	- Remove header file <linux/of.h>
	- Refine all probe error by using dev_err_probe()

- In patch 09/13:
	- Replace text "Mediatek" with "MediaTek"
	- Replace all "first dev_err() and then return" with
	  "return dev_err_probe()"
	- Add Copyright in the source code
	- Add module name related description in Kconfig
	- Add unit suffix of macro "ADC_CONV_POLLING_TIME"
	- Add new macro "ADC_CONV_TIME_MS"
	- Adjust the position of include file <mediatek,mt6370_adc.h>
	- Adjust the postions between <linux/module.h> and
	   <linux/mod_devicetable.h>
	- Fix some incorrect characters

- In patch 10/13:
	- Replace text "Mediatek" with "MediaTek" in Kconfig and
	  MODULE_DESCRIPTION()
	- Replace "mt6370_chg_val_to_reg" and "mt6370_chg_reg_to_val"
	  with "linear_range" API
	- Replace "first break and then return" with "return directly"
	  in all cases of get/set power_supply_property
	- Replace all "first dev_err() and then return" with "return
	  dev_err_probe()"
	- Replace all "return IS_ERR(priv->rdev) ? PTR_ERR(priv->rdev) : 0"
	  with "PTR_ERR_OR_ZERO()"
	- Replace "priv->dev->of_node" with "dev_of_node()"
	- Add Copyright in the source code
	- Add module name related description in Kconfig helptext
	- Add proper unit of "MT6370_MIVR_IBUS_TH"
	- Add error check in "mt6370_chg_get_status"
	- Remove including <mediatek,mt6370_adc.h> header file
	- Remove redundant comma of every enum terminator line
	- Remove unwanted blank lines
	- Remove the useless label (toggle_cfo_exit:)
	- Remove using atomic
	- Remove using of_match_ptr()
	- Fix some incorrect characters
	- Fix updating wrong bits when using ena_gpiod of OTG regulator
	- Adjust the probe order in probe()

- In patch 11/13:
	- Replace text "Mediatek" with "MediaTek" in Kconfig
	- Replace text "const" with "constant" in Kconfig
	- Add Copyright in the source code

- In patch 12/13:
	- Replace text "Mediatek" with "MediaTek" in Kconfig
	- Add Copyright in the source code

- In patch 13/13:
	- Replace text "Mediatek" with "MediaTek" in Kconfig
	- Add Copyright in the source code
	- Revise the comment of "PWM HYS STEPS"


Changes in v3:
- Remove ADC ABI file, which is added in v2 Patch 7
- In patch 02/14:
	- Add items and remove maxItems of io-channels
	- Add io-channel-names and describe each item
	- Add "unevaluatedProperties: false" in "usb-otg-vbus-regulator"
	- Rename "enable-gpio" to "enable-gpios" in "usb-otg-vbus-regulator"

- In patch 03/14:
	- Use leds-class-multicolor.yaml instead of common.yaml.
	- Split multi-led and led node.
	- Add subdevice "led" in "multi-led".

- In patch 04/14:
	- Remove the description of enum.

- In patch 05/14:
	- Rename "mediatek,bled-pwm-hys-input-threshold-steps" to
	  "mediatek,bled-pwm-hys-input-th-steps"
	- Refine "bled-pwm-hys-input-th-steps", "bled-ovp-microvolt",
	  "bled-ocp-microamp" enum values

- In patch 06/14:
	- Use " in entire patchset
	- Refine ADC description
	- Rename "enable-gpio" to "enable-gpios" in "regualtor"

- In patch 07/14:
	- Refine Kconfig help text
	- Refine error message of unknown vendor ID in
	  mt6370_check_vendor_info()
	- Refine return value handling of mt6370_regmap_read()
	- Refine all probe error by using dev_err_probe()
	- Refine "bank_idx" and "bank_addr" in mt6370_regmap_read() and
	  mt6370_regmap_write()
	- Add "#define VENID*" and drop the comments in
	  mt6370_check_vendor_info()
	- Drop "MFD" in MODULE_DESCRIPTION()

- In patch 09/14:
	- Refine Kconfig help text

- In patch 10/14:
	- Refine Kconfig help text
	- Refine all channel value in read_scale()
		a. current: uA --> mA
		b. voltage: uV --> mV
		c. temperature: degrees Celsius --> milli degrees Celsius
	- Add "default:" condition of switch statement in read_scale() and read_raw()
	- Add error message for reading ADC register failed
	- Add the comment for adc_lock
	- Add <linux/mod_devicetable.h> header file for struct of_device_id
	- Replace "adc" text with "ADC" in all of the error messages

- In patch 12/14:
	- Refine the grammer of the Kconfig.
	- Change reg mode to the const current mode.

- In patch 14/14:
	- Refine bool properties parsing (pwm-enable, ovp-shutdown, ocp-shutdown) in DT
	  parsing function
	- Refine u32 and u8 properties parsing (pwm-hys-input-th-steps, ovp-microvolt,
	  ocp-microamp), from using register value to using actual value
	- Refine error string of "channle-use" parsing failed
	- Refine Kconfig help text


Changes in v2:
- In patch 01/15:
	- Add "unevaluatedProperties: false".
	- Delete "DT bindings".
	- Refine the description to fit in 80 columns.
	- Skip the connector description.

- In patch 02/15:
	- Refine items description of interrupt-name
	- Rename "usb-otg-vbus" to "usb-otg-vbus-regulator"
	- Add constraint properties for ADC

- In patch 03/15:
	- Skip not useful description of "^(multi-)?led@[0-3]$"
	  and reg.
	- Due to the dependency, remove the mention of mfd
	  document directory.
	- Delete Soft-start property. In design aspect, we think
	  soft-restart should always be enabled, our new chip
	  has deleted the related setting register , also, we don’t
	  allow user adjust this parameter in this chip.
	- Refine the commit message.

- In patch 04/15:
	- Skip not useful description of "^led@[0-1]$" and reg.
	- Add apace after '#'.
	- Refine the commit message.

- In patch 05/15:
	- Remove "binding documentation" in subject title
	- Refine description of mt6370 backlight binding
	  document
	- Refine properties name(bled-pwm-hys-input-bit,
	  bled-ovp-microvolt, bled-ocp-microamp) and their
	  description

- In patch 06/15:
	- Refine ADC and Regulator descriptions
	- Refine include header usage in example
	- Refine node name to generic node name("pmic@34")
	- Refine led example indentation
	- Refine license of mediatek,mt6370_adc.h
	- Rename the dts example from IRQ define to number.
	- Remove mediatek,mt6370.h

- In patch 07/15:
	- Add ABI documentation for mt6370 non-standard ADC
	  sysfs interfaces.

- In patch 08/15:
	- Add all IRQ define into mt6370.c.
	- Refine include header usage

- In patch 09/15:
	- No changes.

- In patch 10/15:
	- Use 'gpiod_get_from_of_node' to replace
	  'fwnode_gpiod_get_index'.

- In patch 11/15:
	- Refine Kconfig mt6370 help text
	- Refine mask&shift to FIELD_PREP()
	- Refine mutex lock name ("lock" -> "adc_lock")
	- Refine mt6370_adc_read_scale()
	- Refine mt6370_adc_read_offset()
	- Refine mt6370_channel_labels[] by using enum to index
	  chan spec
	- Refine MT6370_ADC_CHAN()
	- Refine indio_dev->name
	- Remove useless include header files

- In patch 12/15:
	- Refine mt6370_chg_otg_rdesc.of_match
	  ("mt6370,otg-vbus" -> "usb-otg-vbus-regulator") to match
	  DT binding

- In patch 13/15:
	- Refine Kconfig description.
	- Remove include "linux/of.h" and use
	  "linux/mod_devicetable.h".
	- Place a comma for the last element of the const
	  unsigned int array.
	- Add a comment line for the mutex 'lock'.
	- In probe function, use 'dev_err_probe' in some
	  judgement to reduce the LOC.
	- Refine include header usage.
	  BIT/GENMASK -> linux/bits.h
	  FIELD_GET -> linux/bitfield.h

- In patch 14/15:
	- Add blank line.
	- Replace container_of() with to_mt6370_led() .
	- Refine description of ramping.
	- Refine the mt6370_init_common_properties function.
	- Refine the probe return.

- In patch 15/15:
	- Refine MT6370 help text in Kconfig
	- Refine DT Parse function
	- Remove useless enum
	- Add comment for 6372 backward compatible in
	  bl_update_status() and
	  check_vendor_info()
	- Using dev_err_probe(); insteads dev_err()&return; in
	  the probe()


Alice Chen (2):
  dt-bindings: leds: Add MediaTek MT6370 flashlight
  leds: flash: mt6370: Add MediaTek MT6370 flashlight support

ChiYuan Huang (5):
  dt-bindings: usb: Add MediaTek MT6370 TCPC
  dt-bindings: leds: mt6370: Add MediaTek MT6370 current sink type LED
    indicator
  dt-bindings: backlight: Add MediaTek MT6370 backlight
  usb: typec: tcpci_mt6370: Add MediaTek MT6370 tcpci driver
  leds: rgb: mt6370: Add MediaTek MT6370 current sink type LED Indicator
    support

ChiaEn Wu (5):
  dt-bindings: power: supply: Add MediaTek MT6370 Charger
  lib: add linear range index macro
  iio: adc: mt6370: Add MediaTek MT6370 support
  power: supply: mt6370: Add MediaTek MT6370 charger driver
  video: backlight: mt6370: Add MediaTek MT6370 support

 .../backlight/mediatek,mt6370-backlight.yaml  |  121 ++
 .../leds/mediatek,mt6370-flashlight.yaml      |   41 +
 .../leds/mediatek,mt6370-indicator.yaml       |   81 ++
 .../power/supply/mediatek,mt6370-charger.yaml |   88 ++
 .../bindings/usb/mediatek,mt6370-tcpc.yaml    |   36 +
 drivers/iio/adc/Kconfig                       |   12 +
 drivers/iio/adc/Makefile                      |    1 +
 drivers/iio/adc/mt6370-adc.c                  |  305 +++++
 drivers/leds/flash/Kconfig                    |   14 +
 drivers/leds/flash/Makefile                   |    1 +
 drivers/leds/flash/leds-mt6370-flash.c        |  632 +++++++++++
 drivers/leds/rgb/Kconfig                      |   13 +
 drivers/leds/rgb/Makefile                     |    1 +
 drivers/leds/rgb/leds-mt6370-rgb.c            | 1010 +++++++++++++++++
 drivers/power/supply/Kconfig                  |   14 +
 drivers/power/supply/Makefile                 |    1 +
 drivers/power/supply/mt6370-charger.c         |  957 ++++++++++++++++
 drivers/usb/typec/tcpm/Kconfig                |   11 +
 drivers/usb/typec/tcpm/Makefile               |    1 +
 drivers/usb/typec/tcpm/tcpci_mt6370.c         |  207 ++++
 drivers/video/backlight/Kconfig               |   13 +
 drivers/video/backlight/Makefile              |    1 +
 drivers/video/backlight/mt6370-backlight.c    |  351 ++++++
 include/linux/linear_range.h                  |    8 +
 24 files changed, 3920 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml
 create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml
 create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
 create mode 100644 Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml
 create mode 100644 drivers/iio/adc/mt6370-adc.c
 create mode 100644 drivers/leds/flash/leds-mt6370-flash.c
 create mode 100644 drivers/leds/rgb/leds-mt6370-rgb.c
 create mode 100644 drivers/power/supply/mt6370-charger.c
 create mode 100644 drivers/usb/typec/tcpm/tcpci_mt6370.c
 create mode 100644 drivers/video/backlight/mt6370-backlight.c

-- 
2.34.1

