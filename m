Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0BE557927
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 13:57:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 197AF10F0B4;
	Thu, 23 Jun 2022 11:57:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3528C10F0B4
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 11:57:05 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id c205so12166099pfc.7
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 04:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UZWfJ752kc+t8aGqGoGN9WPNVsXJx7j2Dc8hIIKuA2o=;
 b=EActnLdjvvqGDkCaG32pGPOvrmd1nCjsfo5yX4TTPwuTGPZKpuQygWidoC99NoH/jw
 pfgKEcKWWpWiHpP8nKEZ7MoHv3m90UAOkFUfJhEWhUAtpTdIZYd715FJWKpr/HJeDiJl
 v38El1CTBosDzlSUC9bdEYPW/j7FghOZfNYuskJxm4HCsLaGR0A2eOQkf1Uw7irJYVZL
 OJCblUTbEZ5YlBffx8Y8WAueJzJs5u0oDpOCD1dx0JoLjTmJwZI2TOY79XZllG0orT1F
 t0DP14l+A+P4XRh2k6+nPHOGvtTb0lImxwtuqe0NMK1q9Tb+/L5b7qxp0Ib8l4JSfATK
 2FAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UZWfJ752kc+t8aGqGoGN9WPNVsXJx7j2Dc8hIIKuA2o=;
 b=wOkAqsm8ZYVSiMFiH0Uluic+XdRpiKg9Rmp0ZN984gmV8o+yvsZrje2vAiPFN394ub
 PHsY2S6za4qc7y0/PTPa77tLA+5nxtdM+3Ksp7OukUimGLNqG+tl8yTnffGGgQOD6FNa
 D9OIpnUfF018YoD1e6PRhh1X2g0W0XMv41tJkpwKErHXrLg8HFahkqhthzuUAOq8/8V2
 3yiEFVaApeyqkxzHrUE8prK4WGO3GUM+dmCdGB89zJeBTLf8HuyyaBUv2V1E38ubs4pA
 ViDoNA3ORzLrZE2tzGJk8EZjcGM4SuSSRrAgghWvbkrf8teRf4Up0y/G5ELuC/kG70ZB
 +ORA==
X-Gm-Message-State: AJIora957zIW+B9VtRi2yp94POUZdHRlb9SKcL1PUui28k0HSa5ml3bE
 9p1esBgXKx6KTJmbnR/My1k=
X-Google-Smtp-Source: AGRyM1ubs8VpG0o6KlXH9gFHqx1a6+yUNsZFsQkNW63tTM/owYhRGBwj7yyyc48Zb53DaP/LopKrfw==
X-Received: by 2002:a63:3507:0:b0:40c:fc09:b293 with SMTP id
 c7-20020a633507000000b0040cfc09b293mr7479467pga.454.1655985424688; 
 Thu, 23 Jun 2022 04:57:04 -0700 (PDT)
Received: from RD-3580-24288.rt.l (111-71-94-93.emome-ip.hinet.net.
 [111.71.94.93]) by smtp.gmail.com with ESMTPSA id
 t6-20020a63b246000000b003fbfe88be17sm15016516pgo.24.2022.06.23.04.56.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jun 2022 04:57:04 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
Subject: [PATCH v3 00/14] Add Mediatek MT6370 PMIC support
Date: Thu, 23 Jun 2022 19:56:17 +0800
Message-Id: <20220623115631.22209-1-peterwu.pub@gmail.com>
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

This patch series add Mediatek MT6370 PMIC support. The MT6370 is a
highly-integrated smart power management IC, which includes a single
cell Li-Ion/Li-Polymer switching battery charger, a USB
Type-C & Power Delivery (PD) controller, dual Flash LED current sources,
a RGB LED driver, a backlight WLED driver, a display bias driver and a
general LDO for portable devices.

Among with this we took some changes and refined the device tree files to
comply with DT specifications.

Thank you,
ChiaEn Wu

---
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
	- Change "/schemas/" to "../" in every reference of all MT6370 modules 
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
  dt-bindings: leds: Add Mediatek MT6370 flashlight
  leds: flashlight: mt6370: Add Mediatek MT6370 flashlight support

ChiYuan Huang (8):
  dt-bindings: usb: Add Mediatek MT6370 TCPC
  dt-bindings: leds: mt6370: Add Mediatek mt6370 current sink type LED
    indicator
  dt-bindings: backlight: Add Mediatek MT6370 backlight
  dt-bindings: mfd: Add Mediatek MT6370
  mfd: mt6370: Add Mediatek MT6370 support
  usb: typec: tcpci_mt6370: Add Mediatek MT6370 tcpci driver
  regulator: mt6370: Add mt6370 DisplayBias and VibLDO support
  leds: mt6370: Add Mediatek MT6370 current sink type LED Indicator
    support

ChiaEn Wu (4):
  dt-bindings: power: supply: Add Mediatek MT6370 Charger
  iio: adc: mt6370: Add Mediatek MT6370 support
  power: supply: mt6370: Add Mediatek MT6370 charger driver
  video: backlight: mt6370: Add Mediatek MT6370 support

 .../leds/backlight/mediatek,mt6370-backlight.yaml  |   92 ++
 .../bindings/leds/mediatek,mt6370-flashlight.yaml  |   41 +
 .../bindings/leds/mediatek,mt6370-indicator.yaml   |   77 ++
 .../devicetree/bindings/mfd/mediatek,mt6370.yaml   |  280 +++++
 .../power/supply/mediatek,mt6370-charger.yaml      |   87 ++
 .../bindings/usb/mediatek,mt6370-tcpc.yaml         |   36 +
 drivers/iio/adc/Kconfig                            |    9 +
 drivers/iio/adc/Makefile                           |    1 +
 drivers/iio/adc/mt6370-adc.c                       |  275 +++++
 drivers/leds/Kconfig                               |   11 +
 drivers/leds/Makefile                              |    1 +
 drivers/leds/flash/Kconfig                         |    9 +
 drivers/leds/flash/Makefile                        |    1 +
 drivers/leds/flash/leds-mt6370-flash.c             |  657 ++++++++++++
 drivers/leds/leds-mt6370.c                         |  989 +++++++++++++++++
 drivers/mfd/Kconfig                                |   13 +
 drivers/mfd/Makefile                               |    1 +
 drivers/mfd/mt6370.c                               |  358 +++++++
 drivers/power/supply/Kconfig                       |   11 +
 drivers/power/supply/Makefile                      |    1 +
 drivers/power/supply/mt6370-charger.c              | 1132 ++++++++++++++++++++
 drivers/regulator/Kconfig                          |    8 +
 drivers/regulator/Makefile                         |    1 +
 drivers/regulator/mt6370-regulator.c               |  388 +++++++
 drivers/usb/typec/tcpm/Kconfig                     |    8 +
 drivers/usb/typec/tcpm/Makefile                    |    1 +
 drivers/usb/typec/tcpm/tcpci_mt6370.c              |  212 ++++
 drivers/video/backlight/Kconfig                    |    9 +
 drivers/video/backlight/Makefile                   |    1 +
 drivers/video/backlight/mt6370-backlight.c         |  346 ++++++
 include/dt-bindings/iio/adc/mediatek,mt6370_adc.h  |   18 +
 31 files changed, 5074 insertions(+)
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
 create mode 100644 drivers/power/supply/mt6370-charger.c
 create mode 100644 drivers/regulator/mt6370-regulator.c
 create mode 100644 drivers/usb/typec/tcpm/tcpci_mt6370.c
 create mode 100644 drivers/video/backlight/mt6370-backlight.c
 create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6370_adc.h

-- 
2.7.4

