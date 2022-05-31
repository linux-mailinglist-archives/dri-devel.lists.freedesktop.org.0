Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 230E15395BE
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 19:58:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4B9A112854;
	Tue, 31 May 2022 17:58:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC77112E5E
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 13:14:50 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id s188so17368720oie.4
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 06:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2QW6EAQHfNGL3WRo5wHoHfZuTn8wkaAQDQ0iJvuyzQA=;
 b=OLVbMS5aoY87mxnSycXmD2wtXm2Mw0QCuyvLSgjQpa0QfWDFCWo7nuiee+CNmHScUn
 qqEl1yimn/40zQQ+utzsNWdhbJbUBVNdiDA65W2lMKxTZG2VxmLjgPMht0pk33pCKkYh
 +EpNEoRwxbYzDOKIdgGdBceTbwhNgbzL+I8xMt6aQuC7H9ngLmVwNe1ReMsd+VJhHXIm
 TNrFS8jUl5cLZ1ySfr6b/1mlHPAYcbx3ro5xO6IZeVWuphrY0/36XgT1BBp095nZBtZm
 8WsSnBTI7hQuh0LyQTmMv0N/rDuNMtIUD4mNdUrrC5tqwMI5eyMp+UwSakNaNyG0xCua
 BA+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2QW6EAQHfNGL3WRo5wHoHfZuTn8wkaAQDQ0iJvuyzQA=;
 b=ckSEUpgEyN8mZKMiPPPNggiXNKMHD1D4ioHgnR1OAkWKxIfVHSPxCpdOffZyFkPgEH
 E+t2lFy2lGn1x4XLgOY+sPJTCKxOhN4gDBwrk48akwkQj729uclm6ID/a6yYSV0Ug5J/
 AF99Qq0i6mWdUlTEpbNEO9GSJkwsw+2zh+vmdVJy4WnfimcGjF1m3qmR8GG/VwO5S+o7
 uND5I+berU8vzRuICKk3TgfKuZsW74sf1docRifEN4/xed7kjYMiStiihRjSFa601Ml7
 T3lBZ8tLMqUgtlVxo5Vr9QInFplozktrF1BwOXhhW3W+Lhx8wKdeyHWeBa7PT0rZpat4
 v2lQ==
X-Gm-Message-State: AOAM53105Fy7TNZ6hS2LnlMxZ6bb4ehk7bgxCfLHqZoYLS0TFShUm3eY
 qeoZs9nCWJspya2xCI71XGhqpFZnMXU=
X-Google-Smtp-Source: ABdhPJxsuxDHP/pmK6/ZpzwirH4LQRf2G5qEDeq0z6Qvx0oDoCGu5cKrPHsiVYN87QI7Qo3UTb+JCA==
X-Received: by 2002:a17:90a:1150:b0:1e3:2d6b:7a8e with SMTP id
 d16-20020a17090a115000b001e32d6b7a8emr4843817pje.188.1653995984469; 
 Tue, 31 May 2022 04:19:44 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-220-172.emome-ip.hinet.net.
 [42.72.220.172]) by smtp.gmail.com with ESMTPSA id
 cm24-20020a056a00339800b00518142f8c37sm10751608pfb.171.2022.05.31.04.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 04:19:44 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
Subject: [RESEND 06/14] dt-bindings: mfd: Add Mediatek MT6370 binding
Date: Tue, 31 May 2022 19:18:52 +0800
Message-Id: <20220531111900.19422-7-peterwu.pub@gmail.com>
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

Add Mediatek MT6370 binding documentation.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 .../bindings/mfd/mediatek,mt6370.yaml         | 282 ++++++++++++++++++
 .../dt-bindings/iio/adc/mediatek,mt6370_adc.h |  18 ++
 include/dt-bindings/mfd/mediatek,mt6370.h     |  83 ++++++
 3 files changed, 383 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
 create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6370_adc.h
 create mode 100644 include/dt-bindings/mfd/mediatek,mt6370.h

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
new file mode 100644
index 000000000000..96a12dce0108
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
@@ -0,0 +1,282 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/mediatek,mt6370.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT6370 SubPMIC
+
+maintainers:
+  - ChiYuan Huang <cy_huang@richtek.com>
+
+description: |
+  MT6370 is a highly-integrated smart power management IC, which includes a
+  single cell Li-Ion/Li-Polymer switching battery charger, a USB Type-C &
+  Power Delivery (PD) controller, dual flash LED current sources, a RGB LED
+  driver, a backlight WLED driver, a display bias driver and a general LDO for
+  portable devices.
+
+properties:
+  compatible:
+    const: mediatek,mt6370
+
+  reg:
+    maxItems: 1
+
+  wakeup-source: true
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+
+  adc:
+    type: object
+    description: |
+      List the compatible configurations of MT6370 ADC.
+
+    properties:
+      compatible:
+        const: mediatek,mt6370-adc
+
+      "#io-channel-cells":
+        const: 1
+
+    required:
+      - compatible
+      - '#io-channel-cells'
+
+  backlight:
+    type: object
+    $ref: /schemas/leds/backlight/mediatek,mt6370-backlight.yaml#
+
+  charger:
+    type: object
+    $ref: /schemas/power/supply/mediatek,mt6370-charger.yaml#
+
+  tcpc:
+    type: object
+    $ref: /schemas/usb/mediatek,mt6370-tcpc.yaml#
+
+  indicator:
+    type: object
+    $ref: /schemas/leds/mediatek,mt6370-indicator.yaml#
+
+  flashlight:
+    type: object
+    $ref: /schemas/leds/mediatek,mt6370-flashlight.yaml#
+
+  regulators:
+    type: object
+    description: |
+      List all supported regulators
+
+    patternProperties:
+      "^(dsvbst|vibldo)$":
+        $ref: /schemas/regulator/regulator.yaml#
+        type: object
+        unevaluatedProperties: false
+
+      "^(dsvpos|dsvneg)$":
+        $ref: /schemas/regulator/regulator.yaml#
+        type: object
+        unevaluatedProperties: false
+
+        properties:
+          enable-gpio:
+            maxItems: 1
+            description: |
+              Specify a valid 'enable' gpio for the regulator and it's optional
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+  - regulators
+  - adc
+  - backlight
+  - indicator
+  - tcpc
+  - charger
+  - flashlight
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/leds/common.h>
+    #include <dt-bindings/mfd/mediatek,mt6370.h>
+    #include <dt-bindings/iio/adc/mediatek,mt6370_adc.h>
+    #include <dt-bindings/usb/pd.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      mt6370@34 {
+        compatible = "mediatek,mt6370";
+        reg = <0x34>;
+        wakeup-source;
+        interrupts-extended = <&gpio26 3 IRQ_TYPE_LEVEL_LOW>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+
+        mt6370_adc: adc {
+          compatible = "mediatek,mt6370-adc";
+          #io-channel-cells = <1>;
+        };
+
+        backlight {
+          compatible = "mediatek,mt6370-backlight";
+          mediatek,bled-channel-use = /bits/ 8 <15>;
+        };
+
+        charger {
+          compatible = "mediatek,mt6370-charger";
+          interrupts = <MT6370_IRQ_ATTACH>, <MT6370_IRQ_OVPCTRL_UVP_D>,
+                       <MT6370_IRQ_CHG_MIVR>;
+          interrupt-names = "attach_i", "uvp_d_evt", "mivr";
+          io-channels = <&mt6370_adc MT6370_CHAN_IBUS>;
+
+          mt6370_otg_vbus: usb-otg-vbus {
+            regulator-compatible = "mt6370,otg-vbus";
+            regulator-name = "usb-otg-vbus";
+            regulator-min-microvolt = <4350000>;
+            regulator-max-microvolt = <5800000>;
+            regulator-min-microamp = <500000>;
+            regulator-max-microamp = <3000000>;
+          };
+        };
+
+        indicator {
+          compatible = "mediatek,mt6370-indicator";
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          multi-led@0 {
+            reg = <0>;
+            function = LED_FUNCTION_INDICATOR;
+            color = <LED_COLOR_ID_RGB>;
+            led-max-microamp = <24000>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            mediatek,soft-start = <3>;
+              led@0 {
+                reg = <0>;
+                color = <LED_COLOR_ID_RED>;
+              };
+              led@1 {
+                reg = <1>;
+                color = <LED_COLOR_ID_GREEN>;
+              };
+              led@2 {
+                reg = <2>;
+                color = <LED_COLOR_ID_BLUE>;
+              };
+            };
+          led@3 {
+            reg = <3>;
+            function = LED_FUNCTION_INDICATOR;
+            color = <LED_COLOR_ID_WHITE>;
+            led-max-microamp = <6000>;
+          };
+        };
+
+        flashlight {
+          compatible = "mediatek,mt6370-flashlight";
+          #address-cells = <1>;
+          #size-cells = <0>;
+          led@0 {
+            reg = <0>;
+            led-sources = <0>;
+            function = LED_FUNCTION_FLASH;
+            color = <LED_COLOR_ID_WHITE>;
+            function-enumerator = <1>;
+            led-max-microamp = <200000>;
+            flash-max-microamp = <500000>;
+            flash-max-timeout-us = <1248000>;
+          };
+          led@1 {
+            reg = <1>;
+            led-sources = <1>;
+            function = LED_FUNCTION_FLASH;
+            color = <LED_COLOR_ID_WHITE>;
+            function-enumerator = <2>;
+            led-max-microamp = <200000>;
+            flash-max-microamp = <500000>;
+            flash-max-timeout-us = <1248000>;
+          };
+        };
+
+        tcpc {
+          compatible = "mediatek,mt6370-tcpc";
+          interrupts-extended = <&gpio26 4 IRQ_TYPE_LEVEL_LOW>;
+
+          connector {
+            compatible = "usb-c-connector";
+            label = "USB-C";
+            vbus-supply = <&mt6370_otg_vbus>;
+            data-role = "dual";
+            power-role = "dual";
+            try-power-role = "sink";
+            source-pdos = <PDO_FIXED(5000, 1000, PDO_FIXED_DUAL_ROLE | PDO_FIXED_DATA_SWAP)>;
+            sink-pdos = <PDO_FIXED(5000, 2000, PDO_FIXED_DUAL_ROLE | PDO_FIXED_DATA_SWAP)>;
+            op-sink-microwatt = <10000000>;
+
+            ports {
+              #address-cells = <1>;
+              #size-cells = <0>;
+
+              port@0 {
+                reg = <0>;
+                endpoint {
+                  remote-endpoint = <&usb_hs>;
+                };
+              };
+              port@1 {
+                reg = <1>;
+                endpoint {
+                  remote-endpoint = <&usb_ss>;
+                };
+              };
+              port@2 {
+                reg = <2>;
+                endpoint {
+                  remote-endpoint = <&dp_aux>;
+                };
+              };
+            };
+          };
+        };
+
+        regulators {
+          dsvbst {
+            regulator-name = "mt6370-dsv-vbst";
+            regulator-min-microvolt = <4000000>;
+            regulator-max-microvolt = <6200000>;
+          };
+          dsvpos {
+            regulator-name = "mt6370-dsv-vpos";
+            regulator-min-microvolt = <4000000>;
+            regulator-max-microvolt = <6000000>;
+            regulator-boot-on;
+          };
+          dsvneg {
+            regulator-name = "mt6370-dsv-vneg";
+            regulator-min-microvolt = <4000000>;
+            regulator-max-microvolt = <6000000>;
+            regulator-boot-on;
+          };
+          vibldo {
+            regulator-name = "mt6370-vib-ldo";
+            regulator-min-microvolt = <1600000>;
+            regulator-max-microvolt = <4000000>;
+          };
+        };
+      };
+    };
diff --git a/include/dt-bindings/iio/adc/mediatek,mt6370_adc.h b/include/dt-bindings/iio/adc/mediatek,mt6370_adc.h
new file mode 100644
index 000000000000..18ce2fef8f9e
--- /dev/null
+++ b/include/dt-bindings/iio/adc/mediatek,mt6370_adc.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __DT_BINDINGS_MEDIATEK_MT6370_ADC_H__
+#define __DT_BINDINGS_MEDIATEK_MT6370_ADC_H__
+
+/* ADC Channel Index */
+#define MT6370_CHAN_VBUSDIV5	0
+#define MT6370_CHAN_VBUSDIV2	1
+#define MT6370_CHAN_VSYS	2
+#define MT6370_CHAN_VBAT	3
+#define MT6370_CHAN_TS_BAT	4
+#define MT6370_CHAN_IBUS	5
+#define MT6370_CHAN_IBAT	6
+#define MT6370_CHAN_CHG_VDDP	7
+#define MT6370_CHAN_TEMP_JC	8
+#define MT6370_CHAN_MAX		9
+
+#endif
diff --git a/include/dt-bindings/mfd/mediatek,mt6370.h b/include/dt-bindings/mfd/mediatek,mt6370.h
new file mode 100644
index 000000000000..df641e5d651f
--- /dev/null
+++ b/include/dt-bindings/mfd/mediatek,mt6370.h
@@ -0,0 +1,83 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __DT_BINDINGS_MEDIATEK_MT6370_H__
+#define __DT_BINDINGS_MEDIATEK_MT6370_H__
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
+#endif /* __DT_BINDINGS_MEDIATEK_MT6370_H__ */
-- 
2.25.1

