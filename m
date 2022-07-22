Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E12AC57DF67
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 12:24:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 290129336D;
	Fri, 22 Jul 2022 10:24:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83F339336D
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 10:24:40 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id f65so4056052pgc.12
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 03:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ekeWjhe/vPlnrj6pxUuMZnIHCtjnr0IEqSQkbPzm4zM=;
 b=RH7X2NIbX5C5sI3T8aekKbPZ0/NIAzMUdJdSJRLokbHjPB0oviakIsJpWXt1wJdedt
 ePMqrqSsYipgX7yTBRz9wfWhCOeC4cES/ZNO5j7CiHLg+7LGpJaPkLLjs2TvvE8Aatmj
 xuJ6qkIZC0FIttjNritzdnY9ZpAXgKtL/P6+GUeiaqh/oK1Qa5RI4npwHZlC8QMrd9s3
 ouF2FQyimpkIgT40neCOIHwrG9IIHLxLLEw3oha+qUQ6pX/ECwcQw9ybzLcT2MZX9/6h
 pr/vJqYQbMOPwMsmJypD9RYFFoXuxeh3dbT8Nt49y/s7HnBmnJlIhGIlPSxGu7i3nKzY
 9iLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ekeWjhe/vPlnrj6pxUuMZnIHCtjnr0IEqSQkbPzm4zM=;
 b=R4lc0zms3L5QkaP1Aw3APK4Kr6a55Tqug247UMUDzAAf9L3bz2doKGzmHf5y2ho20a
 ME58wCYeHmzWIqDI6YeaGOlM+QlZa3QZpYVRt2UbYqywx1M/WwFMz3af39D7aI94qK6V
 BVqf6btDnPcHacA/Hh0lFecKzOlVYNhsVYJSzTp91zObRVH5NE+NkEQJ0bPRXxlhezwE
 yekatyH7wEu6DQf0KjfT2rqwzrL8Ik7Gz2ZvSq+9h+wYS+Wq9RcSkACTriOBKl5zzADp
 i2HB29VqWpmt8knJu7A68F54guG1KFijYjqFlIGEVc4m4t4Imo0KVNIdCSeRdXXb7u3u
 kOAw==
X-Gm-Message-State: AJIora/ex5ws2UtAqYJL8v/4IX77/zFYccYw9lrhgCITS22V3/l0Ro3o
 KbMlsE0y64++cMl//iH+t5a6QHfQ0uc=
X-Google-Smtp-Source: AGRyM1uemeXZnT3uHoO82fOsUMvcRsClMKdWf1rGpgn2xGzw/Mm4P6q511HqEiot5ye8kMmcfxP3/Q==
X-Received: by 2002:a05:6a00:1d18:b0:52a:c350:6538 with SMTP id
 a24-20020a056a001d1800b0052ac3506538mr2831187pfx.7.1658485480028; 
 Fri, 22 Jul 2022 03:24:40 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-73-82-239.emome-ip.hinet.net.
 [42.73.82.239]) by smtp.gmail.com with ESMTPSA id
 h189-20020a6283c6000000b00528d620eb58sm3614551pfe.17.2022.07.22.03.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 03:24:39 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de, andy.shevchenko@gmail.com
Subject: [PATCH v6 03/13] dt-bindings: leds: mt6370: Add MediaTek MT6370
 current sink type LED indicator
Date: Fri, 22 Jul 2022 18:23:57 +0800
Message-Id: <20220722102407.2205-4-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220722102407.2205-1-peterwu.pub@gmail.com>
References: <20220722102407.2205-1-peterwu.pub@gmail.com>
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

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

v6
- Add 'reg' property of led of multi-led to prevent checking error.
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

