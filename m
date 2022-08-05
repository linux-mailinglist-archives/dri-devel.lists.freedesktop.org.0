Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D8F58A716
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 09:31:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8701B20F1;
	Fri,  5 Aug 2022 07:27:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE5D6B2C00
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Aug 2022 07:06:41 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id s206so1968186pgs.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Aug 2022 00:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=pmhuNMasJsnu7yKY0wuXEG96SXA8koMOiIgc3LgLhpU=;
 b=nUlwmtCvyVIkUwCwb6FYP3vJvjibV6gtLqk5691mn09kCOpvxtqcf/X3aaqPq73n0h
 gfoTh4fmoixiCbHkxMuoru52yn+aL/1ZAiIQwoDo6BWxGhVoHixErdA3g4OfzgSkst3S
 hVp2R5uSGPZOF8lJwF2xzlIQSWrhGUTn50GXDFou46aamCYgQtT2/EBmjeI1qT21RK/Q
 iqrfyIBzuzVRfeKzTzioJhdCgFbgYNGMUWjgbAyXRL/KL1le2J2T0z5AyqfHnF9AvZvJ
 B7QTSNRJBWT0zTCK7Mv1KF0s9s97xGZinY28RGBwMN5oLSm/FoTO+Ku8vQ5rFJRdzeK9
 7+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=pmhuNMasJsnu7yKY0wuXEG96SXA8koMOiIgc3LgLhpU=;
 b=dXgxGD14mpJnGxTyvu6oAH/VgCUh03tb/rqFtlGenW/wJgU50nMIsKKGN4VuvjKrTw
 zSHF+08VG7UcdWP7QWspQVsg5xyL0TpGLkKNiKJmNHsS4y/htHJo9h6UEXq1rZqXF3HN
 roaxUCwQDNqVq6n0GNQWmHe+OdO9W4b8tDjXNGr4OIoHnAtlPsdy9D2rz74qQy85A3+/
 LAOBiP5mQkhUrzOY2A6yopKXBgN0FYGqzg/RMByH3+L6+mTYOrf8u1HCIGme69SleTo0
 5wH3fStMZztGh7lrnmyK1F4zhn+HgJjwZLSZQd/D3jsHCmoiE4ze3sG4fIh2vvWECxsh
 8owg==
X-Gm-Message-State: ACgBeo3FeHFPT2f0qrW8AHUmVXKoG+PqNCYOlnZhJs0bHRIXtWrPZ4gh
 X11Et3ulitoHNr+qdV8cx268u110iR4=
X-Google-Smtp-Source: AA6agR6VhklBvSJn5TuPSCr+CU65YQsvP3bd0sBs9mhahisDn9MbyeQJH4+Lgy3EsUMzfnMT/INjcw==
X-Received: by 2002:a05:6a00:1709:b0:52e:677b:702b with SMTP id
 h9-20020a056a00170900b0052e677b702bmr5696757pfc.19.1659683201418; 
 Fri, 05 Aug 2022 00:06:41 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-229-62.emome-ip.hinet.net.
 [42.72.229.62]) by smtp.gmail.com with ESMTPSA id
 i5-20020a056a00224500b00525343b5047sm2191616pfu.76.2022.08.05.00.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 00:06:41 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de, andy.shevchenko@gmail.com
Subject: [PATCH v7 02/13] dt-bindings: power: supply: Add MediaTek MT6370
 Charger
Date: Fri,  5 Aug 2022 15:05:59 +0800
Message-Id: <20220805070610.3516-3-peterwu.pub@gmail.com>
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
 cy_huang@richtek.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 chiaen_wu@richtek.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ChiaEn Wu <chiaen_wu@richtek.com>

Add MediaTek MT6370 Charger binding documentation.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
---
 .../power/supply/mediatek,mt6370-charger.yaml      | 88 ++++++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml

diff --git a/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml b/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml
new file mode 100644
index 0000000..bd09a0a
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/supply/mediatek,mt6370-charger.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6370 Battery Charger
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
+    minItems: 1
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

