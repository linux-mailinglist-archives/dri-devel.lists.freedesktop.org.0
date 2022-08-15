Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B7459FFB6
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 18:44:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 776D1BBFB0;
	Wed, 24 Aug 2022 16:43:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBEE012A5A8
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 09:02:10 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id 73so6028249pgb.9
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 02:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=bLncMqn5cD6+J/xX/xBdFyZqAOyug656xJDHPfwOkJA=;
 b=B3PG0JekDy3pCohcjyZlsPZudH+m/iJ1KWaYWvohvsPxeOPhjsADSikmXZzn7BKP7E
 lLS4kEpcONkErZml7Bnu0PKDS4hcf5JXDwIGYBVzyq3vmPB3tZguxDHAIlFrBsqL1y/v
 T0R5r8u+2vTD6MYbvzU7sgbO12EE/MZh/9u2GIcOyP4xoAlRANwEIA0embBg4huJxb0j
 IkBAqpOiE69ZZKp+8Fp+A+QMwT7z2x2fPAtZYha4wvxhJrNpcudNMv77grRHrwMcH9nM
 m5DWGqKTbfO35oAdRaync3CM+JBI4/tLiclNU4Yg6+rwjeXBqEHBi1o5QX3bbq/6JAzt
 30RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=bLncMqn5cD6+J/xX/xBdFyZqAOyug656xJDHPfwOkJA=;
 b=qV6tPiheojRDSZSANhIH+6UAwM73P0QvEC6CidV5V8EF1omXzV+FvpaxSGTvhqCXN6
 AAsLH64nFYS2opoGkmvlS8MiwS5PMfh0qTQEMnLP+T6qjA0aok76lVGqrciVveNELR8U
 InOqhG0vaMs4ASwPr/sv4vHXMiswOQmCI7VN3OnIBqgCqGSBvB8Ug4HiL9z+8LxsPvzb
 +s0F4Kng0CXRhPUyto6pStho3Y9uGTsdbeu3iM+RklHfVWsLibOOK99h/PcNdSkAxR9f
 bykapSy3lib4kFEu8O8Hwp2vbQthHZfe9N7yGKJSf0jGCXr4fr/tE5rSaSs029ylz6RV
 PkNg==
X-Gm-Message-State: ACgBeo3EMHT0CQa3EVuDQYuYXs+tyQo8IedJC722vZkY78fNLdK0DPMf
 SFJAX457SB5V4gvyAV7/N7U=
X-Google-Smtp-Source: AA6agR5L3UutCR6SuoZH/M6NAJC5jzQgd1eK9rcw7szj3wmG5QtaNzGvWYIm3llE3iJTVl3LqhHAQQ==
X-Received: by 2002:a63:91c4:0:b0:41c:ce66:8ab7 with SMTP id
 l187-20020a6391c4000000b0041cce668ab7mr12815928pge.602.1660554130162; 
 Mon, 15 Aug 2022 02:02:10 -0700 (PDT)
Received: from DESKTOP-IBN2BAQ.localdomain ([123.110.155.185])
 by smtp.gmail.com with ESMTPSA id
 a17-20020a656411000000b00412a708f38asm5491612pgv.35.2022.08.15.02.02.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 02:02:09 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 linux@roeck-us.net, heikki.krogerus@linux.intel.com, deller@gmx.de,
 broonie@kernel.org, mazziesaccount@gmail.com, lgirdwood@gmail.com,
 andriy.shevchenko@linux.intel.com
Subject: [RESNED PATCH v8 03/12] dt-bindings: leds: mt6370: Add MediaTek
 MT6370 current sink type LED indicator
Date: Mon, 15 Aug 2022 17:01:16 +0800
Message-Id: <20220815090125.27705-4-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220815090125.27705-1-peterwu.pub@gmail.com>
References: <20220815090125.27705-1-peterwu.pub@gmail.com>
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

From: ChiYuan Huang <cy_huang@richtek.com>

Add MediaTek MT6370 current sink type LED indicator binding documentation.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
---
 .../leds/mediatek,mt6370-indicator.yaml       | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml

diff --git a/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
new file mode 100644
index 000000000000..204b103ffc2c
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/mediatek,mt6370-indicator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LED driver for MT6370 PMIC from MediaTek Integrated.
+
+maintainers:
+  - Alice Chen <alice_chen@richtek.com>
+
+description: |
+  This module is part of the MT6370 MFD device.
+  Add MT6370 LED driver include 4-channel RGB LED support Register/PWM/Breath Mode
+
+allOf:
+  - $ref: leds-class-multicolor.yaml#
+
+properties:
+  compatible:
+    const: mediatek,mt6370-indicator
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^multi-led@[0-3]$":
+    type: object
+
+    properties:
+      reg:
+        enum: [0, 1, 2, 3]
+
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+    patternProperties:
+      "^led@[0-2]$":
+        type: object
+        $ref: common.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          reg:
+            enum: [0, 1, 2]
+
+        required:
+          - reg
+          - color
+
+    required:
+      - reg
+      - color
+      - "#address-cells"
+      - "#size-cells"
+
+  "^led@[0-3]$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        enum: [0, 1, 2, 3]
+
+    required:
+      - reg
+      - color
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
-- 
2.34.1

