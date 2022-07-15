Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BBF575FFE
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jul 2022 13:26:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B0714BF76;
	Fri, 15 Jul 2022 11:26:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC55014BF76
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 11:26:27 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id x21so2979331plb.3
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 04:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gxyNAIdF8uVow3H1XhXBwg96o/plsRwQuCipoy5Ry9E=;
 b=HUVakAht3QYDlCi6rTyHeuImXIMd379d6m8rZFlB3sH4E5dxdvR2GCC4cEqBq0hWHO
 3mZAFFKklsIBUVZeEziNcYCKl3zu29jSR49coEkq/NEsl8fliMu4Gps15q5kYqP7H2x2
 pBJFKtAwkAm0YIsjRhHfrikU+jVoPijPUxfVIVn4JjFXKSyP/NBe/eprcI6/hgR03rQJ
 ETmc1N5Q2qEArmwE5va/IgZTPbmV9zI22+JK2uCOFMjlRhq72MCfo1oJCOvIr7sI8vRB
 fkkJ6hSHZzzEKAWLjQfbpocJ6mU2MF42oDM8TC5eEwin4rpIj5+HZnjfPYFWo1igXxvk
 ylpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gxyNAIdF8uVow3H1XhXBwg96o/plsRwQuCipoy5Ry9E=;
 b=B0GR6fpJ9UD96OGeFmt2SOhd+8VLUpkFlNgRBBItxM8S151wUBOvlAFy0+7SR6lj4R
 UWbg0yIw5wHJMtD6teDHnfDAyRhARqNYmOWWU4ke61JouFqanVmYtfj0F0UJDaqKEhEH
 CCY27fHRF853I9b9Pu4XsIsNtW8IFf+ryrXRk9kQ/80ffr66VMUHA2hlT54VvIj+Nupt
 YkrVlYGKeb2h98/lEFvaOTt3PzP9veCLNZBAIgnbJnrXIuuB4EuzRPZk55TW9fknQkZY
 3k8XUZvM0FLL9eUvFayCoul/3qUJI0uR/GBn3dzoav5goRCWG6sOKlByU3It60pHFEyQ
 jCig==
X-Gm-Message-State: AJIora90sg97ewGjbbLOoGbz+rG56oo1pmSlN5iZcikJ20L0qDvv/yBi
 TKrejyAC6pJ3yy1xsQ2qCzg=
X-Google-Smtp-Source: AGRyM1vAeOtUIfstbiXdFTS8IM2qsuNBcIlE5ZGLviTu+LOg0TWAQB6D3c0+uhw6k8SiuBspFKiMsA==
X-Received: by 2002:a17:902:7487:b0:16b:d8ae:7e33 with SMTP id
 h7-20020a170902748700b0016bd8ae7e33mr12804578pll.21.1657884382451; 
 Fri, 15 Jul 2022 04:26:22 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-159-86.emome-ip.hinet.net.
 [42.72.159.86]) by smtp.gmail.com with ESMTPSA id
 a5-20020aa78e85000000b00525b61f4792sm3550604pfr.109.2022.07.15.04.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jul 2022 04:26:21 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
Subject: [PATCH v5 00/13] Add MediaTek MT6370 PMIC support
Date: Fri, 15 Jul 2022 19:25:54 +0800
Message-Id: <20220715112607.591-1-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
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

This patch series add MediaTek MT6370 PMIC support. The MT6370 is a
highly-integrated smart power management IC, which includes a single
cell Li-Ion/Li-Polymer switching battery charger, a USB
Type-C & Power Delivery (PD) controller, dual Flash LED current sources,
a RGB LED driver, a backlight WLED driver, a display bias driver and a
general LDO for portable devices.

In this series of patches, we based on Andy Shevchenko's mfd patch used to
adjust the Makefile order.
(https://lore.kernel.org/all/20220616182524.7956-2-andriy.shevchenko@linux.intel.com/)
Among with this, we took some changes for MT6370 and refined the MT6370 device
tree files to comply with DT specifications.

"[PATCH v5 06/13] dt-bindings: mfd: Add MediaTek MT6370" depends on previous
DT binding patches, so before applying this patch, please apply other DT
patches first. Thanks!

Thank you,
ChiaEn Wu

---
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
	- Refine descriptions.
	- Refine the macro name.
	- Refine the bracket and blanks.

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
  leds: flashlight: mt6370: Add MediaTek MT6370 flashlight support

ChiYuan Huang (7):
  dt-bindings: usb: Add MediaTek MT6370 TCPC
  dt-bindings: leds: mt6370: Add MediaTek MT6370 current sink type LED
    indicator
  dt-bindings: backlight: Add MediaTek MT6370 backlight
  dt-bindings: mfd: Add MediaTek MT6370
  mfd: mt6370: Add MediaTek MT6370 support
  usb: typec: tcpci_mt6370: Add Mediatek MT6370 tcpci driver
  leds: mt6370: Add MediaTek MT6370 current sink type LED Indicator
    support

ChiaEn Wu (4):
  dt-bindings: power: supply: Add MediaTek MT6370 Charger
  iio: adc: mt6370: Add MediaTek MT6370 support
  power: supply: mt6370: Add MediaTek MT6370 charger driver
  video: backlight: mt6370: Add MediaTek MT6370 support

 .../leds/backlight/mediatek,mt6370-backlight.yaml  |   92 ++
 .../bindings/leds/mediatek,mt6370-flashlight.yaml  |   41 +
 .../bindings/leds/mediatek,mt6370-indicator.yaml   |   77 ++
 .../devicetree/bindings/mfd/mediatek,mt6370.yaml   |  280 ++++++
 .../power/supply/mediatek,mt6370-charger.yaml      |   88 ++
 .../bindings/usb/mediatek,mt6370-tcpc.yaml         |   36 +
 drivers/iio/adc/Kconfig                            |   12 +
 drivers/iio/adc/Makefile                           |    1 +
 drivers/iio/adc/mt6370-adc.c                       |  273 +++++
 drivers/leds/Kconfig                               |   14 +
 drivers/leds/Makefile                              |    1 +
 drivers/leds/flash/Kconfig                         |   12 +
 drivers/leds/flash/Makefile                        |    1 +
 drivers/leds/flash/leds-mt6370-flash.c             |  661 ++++++++++++
 drivers/leds/leds-mt6370.c                         |  994 ++++++++++++++++++
 drivers/mfd/Kconfig                                |   16 +
 drivers/mfd/Makefile                               |    1 +
 drivers/mfd/mt6370.c                               |  281 ++++++
 drivers/mfd/mt6370.h                               |   99 ++
 drivers/power/supply/Kconfig                       |   14 +
 drivers/power/supply/Makefile                      |    1 +
 drivers/power/supply/mt6370-charger.c              | 1062 ++++++++++++++++++++
 drivers/usb/typec/tcpm/Kconfig                     |   11 +
 drivers/usb/typec/tcpm/Makefile                    |    1 +
 drivers/usb/typec/tcpm/tcpci_mt6370.c              |  207 ++++
 drivers/video/backlight/Kconfig                    |   12 +
 drivers/video/backlight/Makefile                   |    1 +
 drivers/video/backlight/mt6370-backlight.c         |  339 +++++++
 include/dt-bindings/iio/adc/mediatek,mt6370_adc.h  |   18 +
 29 files changed, 4646 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml
 create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml
 create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
 create mode 100644 Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml
 create mode 100644 drivers/iio/adc/mt6370-adc.c
 create mode 100644 drivers/leds/flash/leds-mt6370-flash.c
 create mode 100644 drivers/leds/leds-mt6370.c
 create mode 100644 drivers/mfd/mt6370.c
 create mode 100644 drivers/mfd/mt6370.h
 create mode 100644 drivers/power/supply/mt6370-charger.c
 create mode 100644 drivers/usb/typec/tcpm/tcpci_mt6370.c
 create mode 100644 drivers/video/backlight/mt6370-backlight.c
 create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6370_adc.h

-- 
2.7.4

