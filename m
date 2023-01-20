Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0D2675C9A
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 19:19:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5706310E390;
	Fri, 20 Jan 2023 18:19:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5904510EA4E
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 12:39:07 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id bj3so5520701pjb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 04:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UwPb45S4zck4WbXwQFmAg4Xm6xKrl+WSTMeV0mCeNHE=;
 b=RxsRwu6VwViLl0V73U0fHLgIp3yEFGAVMnnTPe/cqQ4kOTRAgbZivTpCQ75V6IjU85
 L2y8uymJOmAiBUWpSy1gyrevBHjegZpZP7cYNnWQJ7Dapik5untY8wPtOHes4EH79JUd
 o7hpVU/aJUS9qu0kuYostfxenVOHn+bIVpHsVVjhqlfHcf799MEJa5RXNP/fQEc1Shsa
 LAKBZexvU/uhODmepBOqNEkEbox4UkflDQIN4eJyenO7r7fTJ99mxg3uABPp6bJMJhGN
 AuyFZGSfjAwg0yHO/CKf6cNIOYX/BxFF2V1kHn4hjG7GK2H0LUqKk20meh9kGem9xJ05
 Bwsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UwPb45S4zck4WbXwQFmAg4Xm6xKrl+WSTMeV0mCeNHE=;
 b=pSELTg/UbecVFqFKi5KhisqAbGubiextm+gKIuMKgFjFjDUduji3vWlBB63GWHQycI
 ZEDyN3MG6yYXastwOXSZvF+/xifwO6ATpfGnOFO8WHYsxqHrdNL5T6HM9FE+IW2g23oy
 YYW8GpMgEvc3YPGyFkb2lTEwt9otRSfls4/grnRgciJ7xRercbc9Txs9c6q4Tvbq6Amk
 W6mH71S2V7Vgp9kA05L+t/3Im7JEQ9mZUI9E6VVgnR9stnLQlI8hpjVjSR6wA8i+L662
 z4zh5TU6pxbUH+eydeGJ/dzq9dMuVZMtHI3I7t9WHRLUKYFYPRN2TjAp3gVlcQTZiG7q
 cJ+A==
X-Gm-Message-State: AFqh2koiYPBM/8AviIY6+Msz/IyhOvQRfdqDPHJw3i0lFTXkPyL9fKkL
 gcz6mQpK5SJl/5rw0FHSUmo=
X-Google-Smtp-Source: AMrXdXu6pObqvl76QfZIflRoyTvuicFFnNoT0voDnB1PyYO8xPA+yC10yQ/nR2VUT7qpp3NkPdMWzg==
X-Received: by 2002:a17:90b:4a0c:b0:22a:3c8:9d1 with SMTP id
 kk12-20020a17090b4a0c00b0022a03c809d1mr2832809pjb.32.1674218346867; 
 Fri, 20 Jan 2023 04:39:06 -0800 (PST)
Received: from localhost.localdomain (n220246252084.netvigator.com.
 [220.246.252.84]) by smtp.gmail.com with ESMTPSA id
 p23-20020a17090a0e5700b002271b43e528sm1131044pja.33.2023.01.20.04.39.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 04:39:06 -0800 (PST)
From: Jianhua Lu <lujianhua000@gmail.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Helge Deller <deller@gmx.de>
Subject: [PATCH v8 1/2] dt-bindings: leds: backlight: Add Kinetic KTZ8866
 backlight
Date: Fri, 20 Jan 2023 20:38:56 +0800
Message-Id: <20230120123857.16124-1-lujianhua000@gmail.com>
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

Changes in v8:
  - Rename current ramping time. 
  - Rename led ramping time. 

 .../leds/backlight/kinetic,ktz8866.yaml       | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
new file mode 100644
index 000000000000..950d5d819b4d
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
+  kinetic,current-ramp-delay-ms:
+    description: LED current ramping delay time in milliseconds.
+    enum: [2, 4, 8, 16, 32, 64, 128, 192, 256, 320, 384, 448, 512, 576, 640]
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

