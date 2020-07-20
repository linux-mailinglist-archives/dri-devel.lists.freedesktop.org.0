Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20181226FC4
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 22:35:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58F3089E03;
	Mon, 20 Jul 2020 20:35:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA5989E03
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 20:35:20 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id h22so21675151lji.9
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 13:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x2zJYpgDs4IU0fc9VR3TdzhXdQh+0MOJRer0pywnXKA=;
 b=KhkPtvIsDLUNIupaXYNs8UBWIwdZ5u3Ek5KzfJqFq/S0YjXqGAPiLmgJ8ef90Q0q9l
 zXaUKRTw8YvweSdBStgruLCIAPSNwXiiOKMzP+FUmVd7CdH8+m8yks4w7YQbA735nY1m
 Dhf9ftDAXtFClaNUWPGxg4atllIYzWU1vQzjQNFS68jYxjRmHMURVEL84OdGJXRjD8A3
 i0FQSxlq89LbYuIqg68lCArt8ML/2QEDRwashMf9J5pQxQ5kx6s9bm+weCDzNzh4qu3X
 HhdCiEb6DWrcAlOQBt/OQjjqRBzPgposiQLdr7rFarZ4M8llrLhhmOkGZCMiM0ItgmBD
 zt2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x2zJYpgDs4IU0fc9VR3TdzhXdQh+0MOJRer0pywnXKA=;
 b=j3aIcyCaD7FbIswHvigVRmOFZe/fRDpm5T0fYRgNLFSGeE7ZCO9kcSrWm50geL0vjM
 ZiflEnGRrt3zuBs6irXVMHn5JrQ1ti6ZmBrglpH8mlPFfYGQMrLfnaSCaCuuFaMlF8jH
 okyoq1E5x4g5O1NSMy9lLgEe+KpTZJ6B0cR1DulJeM/gUm/JdLbdLckSU/bSQnuTcgs/
 /fsN+TnoiNIzDswRt59Acd9hbppJMT6FoQpWAj7srTDHrapL5TT4A8ow+vdcX2MPiCCg
 NDm9xuH6p6Q6LRl3YdsVz/poipze6kT0VZ/E/puQgqEFI4ZJGAY1wMHAYyuGGDAcjl0w
 ishg==
X-Gm-Message-State: AOAM530xHWBtZE0ftkRIsS8r2BWLEIs9MZgXDPa0glNz98SM1YvB0V9n
 PRERLpHY4Q9L1PVWOrrT46iWhQ==
X-Google-Smtp-Source: ABdhPJzvwrDIcDCCe4LB9xTwr68FXr5R+zlTi94XLknZf5DVBVuutopYN4TgqjOAlrk4Du5owjyogQ==
X-Received: by 2002:a2e:8718:: with SMTP id m24mr11490351lji.253.1595277319177; 
 Mon, 20 Jul 2020 13:35:19 -0700 (PDT)
Received: from localhost.bredbandsbolaget
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id y24sm3435076ljy.91.2020.07.20.13.35.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 13:35:18 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2 v1] dt-bindings: backlight: Add Kinetic KTD253 bindings
Date: Mon, 20 Jul 2020 22:35:05 +0200
Message-Id: <20200720203506.3883129-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds device tree bindings for the Kinetic KTD253
white LED backlight driver.

Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../leds/backlight/kinetic,ktd253.yaml        | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml
new file mode 100644
index 000000000000..610bf9a0e270
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/kinetic,ktd253.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Kinetic Technologies KTD253 one-wire backlight
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+description: |
+  The Kinetic Technologies KTD253 is a white LED backlight that is
+  controlled by a single GPIO line. If you just turn on the backlight
+  it goes to maximum backlight then you can set the level of backlight
+  using pulses on the enable wire.
+
+properties:
+  compatible:
+    const: kinetic,ktd253
+
+  gpios:
+    description: GPIO to use to enable/disable and dim the backlight.
+    maxItems: 1
+
+  default-brightness:
+    description: Default brightness level on boot. 0 is off.
+    minimum: 0
+    maximum: 255
+
+  max-brightness:
+    description: Maximum brightness that is allowed during runtime.
+    minimum: 0
+    maximum: 255
+
+required:
+  - compatible
+  - gpios
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    backlight {
+        compatible = "kinetic,ktd253";
+        gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>;
+        default-on;
+        default-brightness = <160>;
+    };
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
