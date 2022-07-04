Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59797565B9F
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:20:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4EB310F264;
	Mon,  4 Jul 2022 16:15:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA5E10E00A
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 05:39:40 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 g16-20020a17090a7d1000b001ea9f820449so12514870pjl.5
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Jul 2022 22:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F2096TrnLrOi6TQb9sd3IJckHfJM0dfj6pjilL2XtYM=;
 b=pjM3xzgFjRLnvs0GNNP7U7Ho1tjYTsycSoDgKS+B8pXnIAlALkP94GE39gDetj0q3s
 NTdLpK4M5lo/Sw1JSPl6flBHrQpzwzPuTUO/oFUoxkwrdcqFGMjOM5JVz3VDzgxGHbZX
 j/YUkTWidr9mv27vyO2xCaoeyp29+CwrnHrOINV9dyWRWaNAsCrwotcp5abLEdUyzhpW
 rHxVpdqjUzBAo0jSILyNfqWgGjwXkDZY7tZPwB+XqgH+b6vw5n5ytQUHfwIrIPsBVlNs
 xJRlgMNzPZjsJqMU2/cO8lexo9LRf8L+Jhp2WT5G0ZRUS+rQBTm0FwBlEiGWve+uP9Zs
 eGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F2096TrnLrOi6TQb9sd3IJckHfJM0dfj6pjilL2XtYM=;
 b=Q8RR2koIfDTwi77x9Pip4q4z6ONxtzJcZ6iE3x64rbVwXUtY6yXT0qp5RMhs3+Ltib
 0WX+z4Gpt7cGvNYgcRqaa8360BdPyh5/j5VE4il1gv3wETTSBtPsRuuB36X6mLUPViev
 wMpS7TPY73j3LLzjJxI1sQpmBdm7h9Z4KGbras+ygHKlCcTMIUlVe4PNAB0/HrLwWqOL
 sI1o+ESVvtLvT3AdKdyHY2yFyHPWGqmv171XnwUD0gySesKwsIQHgAmHWHT3wdVDItzm
 +7oUO8oal76+xxInZG2LWC1rR/aPQr42Hz/B5WVBfjN0iWqcgGBPlgkc7pQHQTNXG/a1
 rBsQ==
X-Gm-Message-State: AJIora/9phJbjMmeO3UevDN4+bfATAwnAN3prOGocnGeDx0ZUFnpQxL6
 PBfOyvwscRSUjn7B8WPySoBXXE+ct9E=
X-Google-Smtp-Source: AGRyM1sH6S0WrfyDcm8NZMoUo/7mjXv+ixMV1mBqBrskO5QOtg8rGX9FFCrdxOCNJMaAXwW18XTOfg==
X-Received: by 2002:a17:90a:af98:b0:1ef:1d10:c052 with SMTP id
 w24-20020a17090aaf9800b001ef1d10c052mr33374468pjq.111.1656913180400; 
 Sun, 03 Jul 2022 22:39:40 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-4-255.emome-ip.hinet.net.
 [42.72.4.255]) by smtp.gmail.com with ESMTPSA id
 h24-20020a635318000000b0040dffa7e3d7sm13904507pgb.16.2022.07.03.22.39.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 22:39:40 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
Subject: [PATCH v4 02/13] dt-bindings: power: supply: Add Mediatek MT6370
 Charger
Date: Mon,  4 Jul 2022 13:38:50 +0800
Message-Id: <20220704053901.728-3-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220704053901.728-1-peterwu.pub@gmail.com>
References: <20220704053901.728-1-peterwu.pub@gmail.com>
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

v4:
- Add minItems of "io-channel-names"
- Replace text "Mediatek" with "MediaTek"
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

