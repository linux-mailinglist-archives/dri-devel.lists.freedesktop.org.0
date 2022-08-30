Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7B85A5A2E
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 05:41:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1050F10E9F3;
	Tue, 30 Aug 2022 03:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C822710E9F3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 03:41:13 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id 69so7866519pgb.13
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 20:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=XZRFVxasDVXXPTfv/lGT5hPcHgNLG3wH8AQQYSGVOn0=;
 b=THOUneR64v3tlyVUM5vKHd7RESODShVHr0oqdLV+tcjf8VcI5Ysfq90VA0NuV4ylKL
 Uvl0o3giqVj5adaFUmpNmGoZ1gF0W0I4FMb+9mD0y1Kyl05zOtJGLPzelM74fqxWHp/r
 H4fXx5+ZjrayySJzoY5QQuqnfZsU7LxcGyTxiebW5ACTAmAoqjCmxXpavOEHxqMfIJFc
 vpiNxOB/5GcjRlz5Yt/5zjYJoEEwdv02KgEQFy4nQGoRVmtMZbqi0++WMwv5OioO8MA5
 h87td/J5XQRNUCEjSIn3g60nu/PPbiDpjFHxfxETzTUnPH/1y3lkX7wnPbkH2bJ9LdGp
 kqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=XZRFVxasDVXXPTfv/lGT5hPcHgNLG3wH8AQQYSGVOn0=;
 b=1RzZCNvEUy35qVJNfy1KsKt+BKEckIittTIU7rWW9VXK8ALFUQEunInjh7QiikgyqB
 KT6cps56mH6G74DQHdCYer5ZgK12hrNmZDRr1rATGSVJRvfYoklsyRrucN4iBYRR1Tju
 G6FsPy/xRzJt1HtUv0SBtiYeCilAsWOLM6Z248KVtWKfPnfJl+rHeFRXQd1LZR/ZUARt
 T76ySFSfF6uo8f85ida5FgdPJOj/FEJQi2nIiz5DvFt1tDT6RqbcH8CgIRID1kRYOhtt
 ZNy4Fqb1BfgbzVG51xB8Fz42yO4jdfIG7P0d2IVZRLBhkq3uF4vA1YNtzxQU6QHWKTpj
 it0w==
X-Gm-Message-State: ACgBeo1u5sN5ftMSVgOoi1N7F/GykPQQgnPL9x2/6vD7IH8vHe8ON30+
 F0leTVlBh9f1LdO+hDBQ5oI=
X-Google-Smtp-Source: AA6agR4+JKvAffch8TpeJxlSEYvockRo3r5A9JM5ru35+1u/uBGvjHutYzvdaUym6AmDomEaFNwilQ==
X-Received: by 2002:a05:6a00:1d1a:b0:537:d750:65b5 with SMTP id
 a26-20020a056a001d1a00b00537d75065b5mr16582975pfx.85.1661830873398; 
 Mon, 29 Aug 2022 20:41:13 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-77-88-242.emome-ip.hinet.net.
 [42.77.88.242]) by smtp.gmail.com with ESMTPSA id
 a6-20020a170902ecc600b0016ed5266a5csm8439577plh.170.2022.08.29.20.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Aug 2022 20:41:12 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, jic23@kernel.org, lars@metafoo.de,
 deller@gmx.de, broonie@kernel.org, mazziesaccount@gmail.com,
 andriy.shevchenko@linux.intel.com
Subject: [PATCH v9 02/10] dt-bindings: leds: mt6370: Add MediaTek MT6370
 current sink type LED indicator
Date: Tue, 30 Aug 2022 11:40:34 +0800
Message-Id: <20220830034042.9354-3-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220830034042.9354-2-peterwu.pub@gmail.com>
References: <20220830034042.9354-2-peterwu.pub@gmail.com>
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
 alice_chen@richtek.com, linux-pm@vger.kernel.org, linux-iio@vger.kernel.org,
 szunichen@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, cy_huang@richtek.com,
 andy.shevchenko@gmail.com, chiaen_wu@richtek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ChiYuan Huang <cy_huang@richtek.com>

Add MediaTek MT6370 current sink type LED indicator binding documentation.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
---
 .../bindings/leds/mediatek,mt6370-indicator.yaml   | 81 ++++++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml

diff --git a/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
new file mode 100644
index 0000000..204b103
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
2.7.4

