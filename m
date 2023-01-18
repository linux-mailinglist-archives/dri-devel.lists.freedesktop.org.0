Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F182D6733CB
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 09:36:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2D7F10E8E0;
	Thu, 19 Jan 2023 08:36:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 813DD10E742
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 13:10:14 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id 141so24485737pgc.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 05:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=d5iDPqq2wL1x5UVYS+LC8NuxcAKp2OxFDi96DZphNLQ=;
 b=bL0JpCqTuGGGtqXInCGKfaFZvmIgRwEvI7ZIhN5WHvTzz7QAufN9+18EFo1BE6d22z
 Ayk4ytDiShS5yJEUDkgXcBbPvWrej1L01bX2ZuQjtFEgdwT/PvFzOJ81f36VXGYURKDQ
 droDZSV6kpJF15ux9kOn/2uoM5Zen/ViU5/ezUDbwlx1wtTjxpT5G2KKv7qXkLCVz1C9
 96xtyIw5gtBwRnR+f4bFSefhFvsS9zdU/L9P2ZwlFoOUVTT43R4yG34iHYjdPvVvMXDg
 0FKMGD3xzTOfWJKXn0C+Z0+aq8HzZsp4xZAROLMtnf5Qfps6EZXpJASdbruCJmoc9yyM
 KA/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d5iDPqq2wL1x5UVYS+LC8NuxcAKp2OxFDi96DZphNLQ=;
 b=CCuOw9Jxovg9zZvJiJvLrT1W48yXj4JsodtwrkDJURneiy3C4dPJxOzg83SFEy0YX0
 qL0Yiua5WtnAMjTcxqWI0l8fdnHzzeBdnEJYmKUCyMpaQvjPifX3xN+6sMvGDBXKJn14
 yD3DJEo08qYj7rA1pgvCXpaA4Z4wvOWQrjo7vI8GzVw5GWdb82SlwX4w/kDGM1uMsF7z
 F8JdMwn2obRM0fkrIf4TgedMqFoCYJxESIMoUHzmMpW/QSLeOV81K6ua4NBDxUBx1lEj
 +H2Lgrj/8r1YcNUy1oNpLP+XezPnH2feH6csUu+eYNE/27v/6MkmFsisYaXh0e5N+vfi
 uwsQ==
X-Gm-Message-State: AFqh2koHnrRghdV501Y5GKIpftO6wtYjlgraQu28Y7IppUgDMfZB82mf
 +kD1eFjajIzLocBzxSHN1FI=
X-Google-Smtp-Source: AMrXdXu2yetaER0yc+qp8u9oWZL1aexMnTGa1KY3Tz1NL4YMJ3U5n7bI06w6myjw3yUh/5WCpowP2g==
X-Received: by 2002:aa7:9182:0:b0:58d:987b:2e9 with SMTP id
 x2-20020aa79182000000b0058d987b02e9mr6643081pfa.24.1674047414000; 
 Wed, 18 Jan 2023 05:10:14 -0800 (PST)
Received: from localhost.localdomain (n220246252084.netvigator.com.
 [220.246.252.84]) by smtp.gmail.com with ESMTPSA id
 l123-20020a622581000000b005818d429d98sm21959880pfl.136.2023.01.18.05.10.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 05:10:13 -0800 (PST)
From: Jianhua Lu <lujianhua000@gmail.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Helge Deller <deller@gmx.de>
Subject: [PATCH v6 1/2] dt-bindings: leds: backlight: Add Kinetic KTZ8866
 backlight
Date: Wed, 18 Jan 2023 21:10:01 +0800
Message-Id: <20230118131002.15453-1-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 19 Jan 2023 08:35:53 +0000
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
  - Remove "items" between "compatible" and "const: kinetic,ktz8866"
  - Change "additionalProperties" to "unevaluatedProperties"

Changes in v3:
  - Add Krzysztof's R-b

Changes in v4:
  - Drop Krzysztof's R-b
  - Add some new properties

Changes in v5:
  - Add missing enum under property description.
  - Rename uncorrect properties.

Changes in v6:
  - Correct wrong property suffix and description.

 .../leds/backlight/kinetic,ktz8866.yaml       | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
new file mode 100644
index 000000000000..ca0deba14523
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
@@ -0,0 +1,59 @@
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
+  The Kinetic Technologies KTZ8866 is a high efficiency 6-sinks led backlight
+  with dual lcd bias power.
+  https://www.kinet-ic.com/ktz8866/
+
+allOf:
+  - $ref: common.yaml#
+
+properties:
+  compatible:
+    const: kinetic,ktz8866
+
+  current-num-sinks:
+    description: Number of LED current sinks.
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
+  enable-lcd-bias:
+    description: Set if we want to output bias power supply for LCD.
+    type: boolean
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    backlight {
+        compatible = "kinetic,ktz8866";
+
+        pinctrl-names = "default";
+        pinctrl-0 = <&bl_en_default>;
+
+        current-num-sinks = <5>;
+        current-ramping-time-ms = <128>;
+        led-ramping-time-ms = <1>;
+        enable-lcd-bias;
+    };
-- 
2.39.1

