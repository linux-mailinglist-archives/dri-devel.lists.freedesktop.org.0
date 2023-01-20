Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E23675C98
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 19:19:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30FD410E38F;
	Fri, 20 Jan 2023 18:19:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 513F08916D
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 15:50:26 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id o13so6006980pjg.2
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 07:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ifz3vDvAEZ7BS42gIpHTFMzrz22EW4dCog2+fKqAMLc=;
 b=h5wWDnI4mu+2WaMB0V6kZe+MaCszFySNtwk1wV9PkALf7br2lcsHhs6/izaBZwFkn5
 jRm2JNU9hyZ6skEnL97rpTa2d+49yxfOX5DwNk/t31dYjFVbFtsBumcLWbg+vou9R0eu
 OXwNEvMOjFhBB7BxHdx9o4wfJLhfInYPofZaykiRHXjvQK/UtxoIkG2/ae/eUMZ7whXB
 e6ZP44jhBc8QU7/YcuxUwULgHDzJCIoNOaGcGq3jXqLhyY4zmDr43mfvP3xkwZQ6LF1u
 LUQnbEA3WWlY2WdbHSRD+XXoHSyKwn6aOeIfWRUXUrl64RH9iFX3AVL85i9TeJQzsSEy
 zBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ifz3vDvAEZ7BS42gIpHTFMzrz22EW4dCog2+fKqAMLc=;
 b=AOo8Z3Qk09y159PLQoHyF95WDsNlLL5eU1Jr2mXTJZnDOcv+nUjo2TVIB+7ZGhgpje
 sDCBG5UHI5V6SGWmSCZMRZG3Kdzah6vku7q7EzqsLlQgcONtCvYgCwPjUogr90LPeezD
 yXpQSqF4dZREWNCrCdvi9NJZ/ouVlV1jEQrH83uAcc3wpUp1WtEn2QivGYQSEhlPEptr
 sJMBrnF/A2VgNw6KZb8nw2plXozKLUOWfMi4btiladY01DI2x+H5v/35iLToesh7dCE4
 V9x5czw/87DE7G5hPOEW4WL8oy1xOEDCWXrVqfMEq1NzJ3J1j36FRVB8t2goAWbw29VP
 R+5A==
X-Gm-Message-State: AFqh2krxU0rPkprQCGvIvhyCl4jqpbdcIzFzB5zs4O1N6te8RaIv0NI6
 hIdFM7xpGd+cK3WGq/h2uBg=
X-Google-Smtp-Source: AMrXdXurnIoilt6fN2sw9uvaZYbWJ6iIHk57f5fmjv34pWqyznNfo6PJJyMgiSTYY9REG2JkqaV4JQ==
X-Received: by 2002:a17:903:449:b0:189:6ab3:9e75 with SMTP id
 iw9-20020a170903044900b001896ab39e75mr14309167plb.15.1674229825960; 
 Fri, 20 Jan 2023 07:50:25 -0800 (PST)
Received: from localhost.localdomain (n220246252084.netvigator.com.
 [220.246.252.84]) by smtp.gmail.com with ESMTPSA id
 p9-20020a170902780900b00188fc6766d6sm27012824pll.219.2023.01.20.07.50.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 07:50:25 -0800 (PST)
From: Jianhua Lu <lujianhua000@gmail.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Helge Deller <deller@gmx.de>
Subject: [PATCH v9 1/2] dt-bindings: leds: backlight: Add Kinetic KTZ8866
 backlight
Date: Fri, 20 Jan 2023 23:50:17 +0800
Message-Id: <20230120155018.15376-1-lujianhua000@gmail.com>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jianhua Lu <lujianhua000@gmail.com>, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add Kinetic KTZ8866 backlight binding documentation.

Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

Changes in v8:
  - Rename current ramping time. 
  - Rename led ramping time. 

Changes in v9:
  - Add Krzysztof's R-b.
  - Add missing 1μs to the enum of "kinetic,led-enable-ramp-delay-ms".

 .../leds/backlight/kinetic,ktz8866.yaml       | 76 +++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
new file mode 100644
index 000000000000..e1191453c2f0
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
@@ -0,0 +1,76 @@
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
+  kinetic,current-ramp-delay-ms:
+    description: |
+      LED current ramping delay time in milliseconds, note that the
+      case 1 will be mapped to 1μs.
+    enum: [1, 2, 4, 8, 16, 32, 64, 128, 192, 256, 320, 384, 448, 512, 576, 640]
+
+  kinetic,led-enable-ramp-delay-ms:
+    description: |
+      LED on/off ramping delay time in milliseconds, note that the case 0 will be
+      mapped to 512μs because ktz8866 can't ramp faster than it.
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
+        kinetic,current-ramp-delay-ms = <128>;
+        kinetic,led-enable-ramp-delay-ms = <1>;
+        kinetic,enable-lcd-bias;
+    };
-- 
2.39.1

