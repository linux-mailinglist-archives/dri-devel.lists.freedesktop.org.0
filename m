Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BCAC8B1EB
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 18:04:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D173510E69D;
	Wed, 26 Nov 2025 17:04:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S3OXo0kU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 761C810E69D
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 17:04:33 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4775ae5684fso33765865e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 09:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764176672; x=1764781472; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=z0OD6Tul6N7Ac9c9vQK1/GWaIUr26ez2juaXAYXKN8s=;
 b=S3OXo0kUnAE5jrkV8DFgBeL7JZ9KcPIZNb1bgQJtwkXiMro7fU2DMgu1LKrwKTUid2
 +RgqdLYT2tSvZtp8Kqook+HOOOfnnrU+UZjhOoWS+SVWk7Ttl+xq1hKJBtvcyHGWZa93
 3/jdUg3LQCpUedGLXvAd+SM1IC7BGWua4aVKHlXpw5ZYtjcLEEg/w82o05Um6A74YxUL
 9is5sa2uOFXE/VFNUhAHmD3f3NlOKLZZzQeQE6nHaJzLyPXsv88UKMzfUi4PjpJlVaGG
 aa4gFUCss4y6runUBaJ9PvnPtdgZPM/Y5iDdD077iGj0raoM279FCw//LRaIehykpoJi
 Pmtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764176672; x=1764781472;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=z0OD6Tul6N7Ac9c9vQK1/GWaIUr26ez2juaXAYXKN8s=;
 b=kyI7hiyxMCT5IJDphNa5GZWcK+QwSXDBwjcWhW7ZSno+Lrbi0jYT0i7fJjmSmoldMc
 5WuK6QVWbWhlgpbnejbCwo9FdxC1+GA0LoX1N9sBo5FOCaAptGIG6so2EkaWe3XsJoR+
 2molnWl5q7qNFRzy0WdW+StFOoJ2rVWLRUmKwyA3mAe12GoTsr66Hcm1GkUdpg70jDXv
 uFAKyTONQRwLvaulOxB02DGX2yG/aU47FfXfGfCsPM6IAxYrCuO07hHEVyout7aACm7z
 sCisR4BYchMY1+VdSw9C+6IyrPragMufv1cXWpjm1MEO2RdNMGCwG9HntgZCTYEjKPc4
 Y1Xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVueRaG/Xuuav7VMc8YHzuI+WOk/EK2z5MLw3//zKdqLL639Vmnf7PWPDthHlxrSsHQ76oPxq5C4c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwoDdTxj277fTc5wfvaW64uuJhgsIIjoZbqd/MSKisVdldK3iIo
 DzZRQsL+R7gZhpBfilp2Ps+CLCuibu1LEC3yC/X6Rb9+5UkScmzgHYJq
X-Gm-Gg: ASbGncueFMKFGkx4x5SvvRSOmhfI9vOnoYXfa494RZLkzQBLcmzipmKnJXaZB9skeEJ
 a952IkaIfGlioz70h3j0skiBDESMeSdcmnU75q5Y5xwIz6/FsMca6QkCi9/9LddK6g3y6Tzsdn3
 2Br9a9HAo8D4GByqPbSfpI2Gstq+VxexyG7RGr07jm2yxAh5hYO8Vvidw8LPUOcsDY08ybWSSUv
 /gwcFmU5GtqfOy4WDEtyeXlwgbghs7+HtgsPh3alIpkrqhmUj4YElKeU6fYIqaLxQm4EQTNvb4Z
 obEdLIM1UWE2J7VxPn0owtxVzQ89dsQ2o43cF7gcUC0WmFpdPo/5PsM0dyZQQdYovzTJss8dIsm
 5nMaStIqKT8oxXRIRRBmOUGYzFBaCJhwQOSzSM/IQrNVQ04qaYvymKcERBqrDOnVwbJXDYv0y5A
 eCSMOlDkVP61cq/+WulNujvzixp6COdu22A2eAnFbrbQ+yad/9NQvz
X-Google-Smtp-Source: AGHT+IGuGmBOIwj1mx/KDvXaUjKyWYx4qrXMEWM/RRovenW6LKvpiCaIe8KXa+I1aqRc59MHCZfA+Q==
X-Received: by 2002:a5d:5888:0:b0:42b:3b55:8908 with SMTP id
 ffacd0b85a97d-42cc1d22c70mr20850453f8f.51.1764176671730; 
 Wed, 26 Nov 2025 09:04:31 -0800 (PST)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([5.225.141.247])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7f2e574sm41252799f8f.3.2025.11.26.09.04.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Nov 2025 09:04:31 -0800 (PST)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Wed, 26 Nov 2025 18:03:49 +0100
Subject: [PATCH v5 1/3] dt-bindings: display: sitronix,st7920: Add DT
 schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-st7920-v5-1-64eda5267d35@gmail.com>
References: <20251126-st7920-v5-0-64eda5267d35@gmail.com>
In-Reply-To: <20251126-st7920-v5-0-64eda5267d35@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add binding for Sitronix ST7920 display.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 .../bindings/display/sitronix,st7920.yaml          | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/sitronix,st7920.yaml b/Documentation/devicetree/bindings/display/sitronix,st7920.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..c4f006fc41e1f472939725bd82b86a649f9b3f56
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sitronix,st7920.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/sitronix,st7920.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sitronix ST7920 LCD Display Controllers
+
+maintainers:
+  - Iker Pedrosa <ikerpedrosam@gmail.com>
+
+description:
+  The Sitronix ST7920 is a controller for monochrome dot-matrix graphical LCDs,
+  most commonly used for 128x64 pixel displays.
+
+properties:
+  compatible:
+    const: sitronix,st7920
+
+  reg:
+    maxItems: 1
+
+  vdd-supply:
+    description: Regulator that provides 5V Vdd power supply
+
+  reset-gpios:
+    maxItems: 1
+
+  spi-max-frequency:
+    maximum: 600000
+
+required:
+  - compatible
+  - reg
+  - spi-max-frequency
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        display@0 {
+            compatible = "sitronix,st7920";
+            reg = <0>;
+            vdd-supply = <&reg_5v>;
+            reset-gpios = <&gpio 25 GPIO_ACTIVE_LOW>;
+            spi-max-frequency = <600000>;
+            spi-cs-high;
+        };
+    };

-- 
2.52.0

