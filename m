Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F14D55792A
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 13:57:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C14910F271;
	Thu, 23 Jun 2022 11:57:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AACF310F271
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 11:57:17 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id d14so15116137pjs.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 04:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pUBtsagIsVkX8Y3XaZ3P+E6UwRwPnXULrf1i7+CDAYk=;
 b=HUqGrLrAyQxEgyQxCKoJIayS2tvkFNjWmplRFdMK1iO8SGvV4tEinbq75vS0cBu5PL
 XgH273UsGvrqERUSGbu1r2oXrED2leZrGYtEVo7qB3dvfMdJkIM4QNUiOCViKrqBKKgX
 +qDBGXPT+Bmxkeqj6riTOkA5nfRjIzvi0v/2xZQ94J62XosDTuvDJ+1o441hzQbp4wEi
 1sp+DfsLwVjXFCMItlbeV6Zp3Fjs1t673VTr81jY6v6sDO5ISthwJ7oAib9DPrpPwqEB
 gJxrgu+AL5vyQnvSC5RyMwUirmtWNXgEGoSuXIIfbAFnbcho4bJx66zLGRJtwJyw6vHI
 38Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pUBtsagIsVkX8Y3XaZ3P+E6UwRwPnXULrf1i7+CDAYk=;
 b=ZK/2mqLLrYACivpwUw3qkwavkp3C/WlAUGxZYcfB4rQf6RW/BSkp801CnJXdPhUI8d
 YhmZn8AYIrutgydaSqz0XioXd6XPah1Dp6WX02+6/sbrn1XQMEOPeEW9WcTujR3bMK8c
 SR53DK67FrBTgPhL3aVKMgXQHjfr5Tg7Ezi6r+WWDybFQllWFe/FFIKVuoPxdUOHLB7m
 sTLXo3T7ZWPOKiUvPxZ5Iq71SrKU9PEkHKHroijXOkWKNemcHBpT/7QopFHoxvvfr6gc
 3yzEP1xqHW5jIOhq+RS6mipB19vUsASBBCoCDcNJv6vcH5ezgom+gmqRqOKVz9ZlOkC8
 lCTA==
X-Gm-Message-State: AJIora9TimsdURili2jha86k26iRgVIudolEciaJqXbubtQQVMwLkOVY
 TUVbkQhAm02jXAnL/Mo4yyA=
X-Google-Smtp-Source: AGRyM1vhaWgaoShKoMGABtGUhnYLtLbNBz5rjPqyBvlkLjDrmroIA6VhBGVRXbYC4LbB1KTob0Elvw==
X-Received: by 2002:a17:902:ea04:b0:16a:1f33:cb0d with SMTP id
 s4-20020a170902ea0400b0016a1f33cb0dmr21465257plg.103.1655985437347; 
 Thu, 23 Jun 2022 04:57:17 -0700 (PDT)
Received: from RD-3580-24288.rt.l (111-71-94-93.emome-ip.hinet.net.
 [111.71.94.93]) by smtp.gmail.com with ESMTPSA id
 t6-20020a63b246000000b003fbfe88be17sm15016516pgo.24.2022.06.23.04.57.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jun 2022 04:57:17 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
Subject: [PATCH v3 02/14] dt-bindings: power: supply: Add Mediatek MT6370
 Charger
Date: Thu, 23 Jun 2022 19:56:19 +0800
Message-Id: <20220623115631.22209-3-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220623115631.22209-1-peterwu.pub@gmail.com>
References: <20220623115631.22209-1-peterwu.pub@gmail.com>
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

Add Mediatek MT6370 Charger binding documentation.

Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
---

v3
- Add items and remove maxItems of io-channels
- Add io-channel-names and describe each item
- Add "unevaluatedProperties: false" in "usb-otg-vbus-regulator"
- Rename "enable-gpio" to "enable-gpios" in "usb-otg-vbus-regulator"
---
 .../power/supply/mediatek,mt6370-charger.yaml      | 87 ++++++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml

diff --git a/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml b/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml
new file mode 100644
index 0000000..f138db6
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/supply/mediatek,mt6370-charger.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT6370 Battery Charger
+
+maintainers:
+  - ChiaEn Wu <chiaen_wu@richtek.com>
+
+description: |
+  This module is part of the MT6370 MFD device.
+  Provides Battery Charger, Boost for OTG devices and BC1.2 detection.
+
+properties:
+  compatible:
+    const: mediatek,mt6370-charger
+
+  interrupts:
+    description: |
+      Specify what irqs are needed to be handled by MT6370 Charger driver. IRQ
+      "MT6370_IRQ_CHG_MIVR", "MT6370_IRQ_ATTACH" and "MT6370_IRQ_OVPCTRL_UVP_D"
+      are required.
+    items:
+      - description: BC1.2 done irq
+      - description: usb plug in irq
+      - description: mivr irq
+
+  interrupt-names:
+    items:
+      - const: attach_i
+      - const: uvp_d_evt
+      - const: mivr
+
+  io-channels:
+    description: |
+      Use ADC channel to read VBUS, IBUS, IBAT, etc., info.
+    minItems: 1
+    items:
+      - description: |
+          VBUS voltage with lower accuracy (+-75mV) but higher measure
+          range (1~22V)
+      - description: |
+          VBUS voltage with higher accuracy (+-30mV) but lower measure
+          range (1~9.76V)
+      - description: the main system input voltage
+      - description: battery voltage
+      - description: battery temperature-sense input voltage
+      - description: IBUS current (required)
+      - description: battery current
+      - description: |
+          regulated output voltage to supply for the PWM low-side gate driver
+          and the bootstrap capacitor
+      - description: IC junction temperature
+
+  io-channel-names:
+    items:
+      - const: vbusdiv5
+      - const: vbusdiv2
+      - const: vsys
+      - const: vbat
+      - const: ts_bat
+      - const: ibus
+      - const: ibat
+      - const: chg_vddp
+      - const: temp_jc
+
+  usb-otg-vbus-regulator:
+    type: object
+    description: OTG boost regulator.
+    unevaluatedProperties: false
+    $ref: /schemas/regulator/regulator.yaml#
+
+    properties:
+      enable-gpios:
+        maxItems: 1
+
+required:
+  - compatible
+  - interrupts
+  - interrupt-names
+  - io-channels
+
+additionalProperties: false
+
+...
-- 
2.7.4

