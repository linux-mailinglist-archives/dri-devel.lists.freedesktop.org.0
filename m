Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F89C675C97
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 19:19:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4ABA10E38D;
	Fri, 20 Jan 2023 18:19:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE3EB10E9FF
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 09:47:37 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id r18so3672357pgr.12
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 01:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rPcOeTgKA9sFp6sSVwUMHgyKLqDrFQAyiFwiVpjLuSc=;
 b=V/AmSrPbxbBAdPP/f05pbBgJQSBg36+auPUDMf8w2+eqdExEerGXZ/06QwEOayvHud
 6vBxPxxoEDZg98CjuC0dNk7oM3tF0r+434LHeuGQf84FWmm690TOUVsZCOZ6MAeJV0+3
 qRC6VI5ZVrK4outXs1w3w3D/cGvETGZD22m7gILA9t/X1lvFPaUwJlhaNIRJfSEVuZPB
 R6ccCThYFlhZdSKwwrRaY2X8NUkaqaJmXw1Xes60LQLuda91Sp3A0jMXMWtiDwiPMSuP
 F4hsnlKEqCmcsFvY7TKnDc2ATNY/IaYWefQF8xyp3ZEi7NL9RFLIDO9d15r8aZIG7x/C
 LWiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rPcOeTgKA9sFp6sSVwUMHgyKLqDrFQAyiFwiVpjLuSc=;
 b=6zfnfjFwcAVlOLaF3jHO6oaU+O9E3J6oqCkSU3o/usoRlpKNAsA8riDR/Bk0iEaz+A
 jpoMsA31u9YWv8A/W29o5zIIctWUZbb3Ju0DUoYN4k9IMHZ5xt8MwxIRK0CSyFlqlzn+
 iVqhqQg6llu/Qdyy6y1ssP3nmJGlP43H9W0HZuz+3rKozeRd8o4EFtjdCnUNBsyPiv7P
 a/uX24k3yXBlqRgqvbQl1r3GXPNWaiuM6+h01pcQpgYG5J+CVqGcMIwUkChe4w6GaWn5
 Iujf8CCMLjMs+sIyQbOx4C931CJeKe//mtTjl47zxepM45RneFCB96xRssNEbQ/slGp7
 AjKA==
X-Gm-Message-State: AFqh2kq52fr7dC/woM9H4caXlYlp6lmNo8GwX9LilIvSoh9vDZvtNcV/
 OA7NNK9it9Y7JEFQnGNn/uXidI0xEpE=
X-Google-Smtp-Source: AMrXdXvu2Nl2zxBEaAW5n4+lP+XXPnmrE/mONOPpF1bQtyhemIsleknFhv9g6Xd70UYaBXE9V43iQA==
X-Received: by 2002:aa7:850c:0:b0:580:ccae:291c with SMTP id
 v12-20020aa7850c000000b00580ccae291cmr14963503pfn.24.1674208057319; 
 Fri, 20 Jan 2023 01:47:37 -0800 (PST)
Received: from localhost.localdomain (n220246252084.netvigator.com.
 [220.246.252.84]) by smtp.gmail.com with ESMTPSA id
 u5-20020a626005000000b005815017d348sm19308863pfb.179.2023.01.20.01.47.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 01:47:36 -0800 (PST)
From: Jianhua Lu <lujianhua000@gmail.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Helge Deller <deller@gmx.de>
Subject: [PATCH v7 1/2] dt-bindings: leds: backlight: Add Kinetic KTZ8866
 backlight
Date: Fri, 20 Jan 2023 17:47:27 +0800
Message-Id: <20230120094728.19967-1-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 20 Jan 2023 18:19:29 +0000
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jianhua Lu <lujianhua000@gmail.com>, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add Kinetic KTZ8866 backlight binding documentation.

Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
---
Changes in v2:
  - Remove "items" between "compatible" and "const: kinetic,ktz8866".
  - Change "additionalProperties" to "unevaluatedProperties".

Changes in v3:
  - Add Krzysztof's R-b.

Changes in v4:
  - Drop Krzysztof's R-b.
  - Add some new properties.

Changes in v5:
  - Add missing enum under property description.
  - Rename uncorrect properties.

Changes in v6:
  - Correct wrong property suffix and description.

Changes in v7:
  - Add vddpos and vddeg supply.
  - Use enable-gpios instead of defining enable pin.

 .../leds/backlight/kinetic,ktz8866.yaml       | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
new file mode 100644
index 000000000000..b1d0ade0dfb6
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/kinetic,ktz8866.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Kinetic Technologies KTZ8866 backlight
+
+maintainers:
+  - Jianhua Lu <lujianhua000@gmail.com>
+
+description: |
+  The Kinetic Technologies KTZ8866 is a high efficiency 6-channels-current-sinks
+  led backlight with dual lcd bias power.
+  https://www.kinet-ic.com/ktz8866/
+
+allOf:
+  - $ref: common.yaml#
+
+properties:
+  compatible:
+    const: kinetic,ktz8866
+
+  vddpos-supply:
+    description: positive boost supply regulator.
+
+  vddneg-supply:
+    description: negative boost supply regulator.
+
+  enable-gpios:
+    description: GPIO to use to enable/disable the backlight (HWEN pin).
+    maxItems: 1
+
+  current-num-sinks:
+    description: number of the LED current sinks' channels.
+    enum: [1, 2, 3, 4, 5, 6]
+
+  current-ramping-time-ms:
+    description: LED current ramping time in milliseconds.
+    enum: [2, 4, 8, 16, 32, 64, 128, 192, 256, 320, 384, 448, 512, 576, 640]
+
+  led-ramping-time-ms:
+    description: |
+      LED on/off ramping time in milliseconds, note that the case 0 will be mapped
+      to 512μs because ktz8866 can't ramp faster than it.
+    enum: [0, 1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384]
+
+  kinetic,enable-lcd-bias:
+    description: Set if we want to output bias power supply for LCD.
+    type: boolean
+
+required:
+  - compatible
+  - vddpos-supply
+  - vddneg-supply
+  - enable-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    backlight {
+        compatible = "kinetic,ktz8866";
+
+        vddpos-supply = <&bl_vddpos_5p5>;
+        vddneg-supply = <&bl_vddneg_5p5>;
+        enable-gpios = <&tlmm 139 GPIO_ACTIVE_HIGH>;
+        current-num-sinks = <5>;
+        current-ramping-time-ms = <128>;
+        led-ramping-time-ms = <1>;
+        kinetic,enable-lcd-bias;
+    };
-- 
2.39.1

