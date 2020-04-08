Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 864781A29F7
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 21:52:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 378016EAF3;
	Wed,  8 Apr 2020 19:52:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 729236EAEB
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 19:52:17 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id z26so4884779ljz.11
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Apr 2020 12:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oOzyULiNbeFY2/JVqESTmUOi0tZ1RaKtlAJLXAU+LTo=;
 b=o4qSji+YcgSMO5471iBf0AUlY0576dAVfve1ngk5X9BrdczLd+14WTl1f06KYKayF9
 xaRa+KssaLXwpRpf0gr7GkGBFem3/wXxpzIePd9NLa0I/suWy5nm1nQs7NbgI9Diux1V
 T8czXwaXlp3DK3gftrFkK1mP2+cgV8UXo6Eq4HHVTIinuIF5plU7wBRL/iGvUmWHWT6Y
 KC2/qFC4yRRP1cKoDrqO7YgAouUP3WHkLZk2+yZM0XBiBbBkMH64U7I/GFOYm6bJuvBm
 vnwJeY+J7+MiQw1Z1vS5RI4rUCnCPY4hM1qxbcxbCKWQN5dEKS0/lwMdHKX9JGsyqV8f
 58ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=oOzyULiNbeFY2/JVqESTmUOi0tZ1RaKtlAJLXAU+LTo=;
 b=cl4EssjV/P6fPxxDDclvJi8l66WRGIX/0onRoxWnOtM3pBk1+2X9C+kZqPEI6iGEwD
 3oXdVxONZaKnherU3Y4/a5tKTpxsg1DhGXh/mkS2Th9ZZ1nJDYLBINJ/LDU2WQcGeAVb
 72Y/kymB11BFMpI5YQdhAKspGRdoWv1kRxsNAmacoO5EWwNcGdM6wLr5GtN2FnS8gWfp
 3bKOp6vojaIzDM0LaGodstDdwAkNtI6YXOzx51mjhKUzxho6EGiKh3QHYECCXSFZGlsM
 FSdV5OoMFdq0xJ0eOClRAKWYGlczvtFQxGRqUeZD7F8nR4VWMIoVdPfCUwy/OMDteQ7p
 h+aw==
X-Gm-Message-State: AGi0PuayryOs9Eq4BlYzUADCfXBs2yIePxBE7AAGVmiYpl4hiThIX4VL
 wwjb2GuUccjYJKmHmxFZwUhfmB0KjEM=
X-Google-Smtp-Source: APiQypKlM5BqCZJI+5XgYDDIl17PJ4FdUjhU+cKX3qCB2UaV8cDpfNaFDPbQUZ6d9zYt1Us1kAc7GQ==
X-Received: by 2002:a2e:7606:: with SMTP id r6mr5846746ljc.118.1586375535469; 
 Wed, 08 Apr 2020 12:52:15 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 i20sm3961304lfe.15.2020.04.08.12.52.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 12:52:15 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v2 32/36] dt-bindings: display: convert sharp,
 lq150x1lg11 to DT Schema
Date: Wed,  8 Apr 2020 21:51:05 +0200
Message-Id: <20200408195109.32692-33-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200408195109.32692-1-sam@ravnborg.org>
References: <20200408195109.32692-1-sam@ravnborg.org>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Peter Rosin <peda@axentia.se>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/sharp,lq150x1lg11.txt       | 36 ------------
 .../display/panel/sharp,lq150x1lg11.yaml      | 58 +++++++++++++++++++
 2 files changed, 58 insertions(+), 36 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq150x1lg11.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq150x1lg11.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/sharp,lq150x1lg11.txt b/Documentation/devicetree/bindings/display/panel/sharp,lq150x1lg11.txt
deleted file mode 100644
index 0f57c3143506..000000000000
--- a/Documentation/devicetree/bindings/display/panel/sharp,lq150x1lg11.txt
+++ /dev/null
@@ -1,36 +0,0 @@
-Sharp 15" LQ150X1LG11 XGA TFT LCD panel
-
-Required properties:
-- compatible: should be "sharp,lq150x1lg11"
-- power-supply: regulator to provide the VCC supply voltage (3.3 volts)
-
-Optional properties:
-- backlight: phandle of the backlight device
-- rlud-gpios: a single GPIO for the RL/UD (rotate 180 degrees) pin.
-- sellvds-gpios: a single GPIO for the SELLVDS pin.
-
-If rlud-gpios and/or sellvds-gpios are not specified, the RL/UD and/or SELLVDS
-pins are assumed to be handled appropriately by the hardware.
-
-Example:
-
-	backlight: backlight {
-		compatible = "pwm-backlight";
-		pwms = <&pwm 0 100000>;                      /* VBR */
-
-		brightness-levels = <0 20 40 60 80 100>;
-		default-brightness-level = <2>;
-
-		power-supply = <&vdd_12v_reg>;               /* VDD */
-		enable-gpios = <&gpio 42 GPIO_ACTIVE_HIGH>;  /* XSTABY */
-	};
-
-	panel {
-		compatible = "sharp,lq150x1lg11";
-
-		power-supply = <&vcc_3v3_reg>;               /* VCC */
-
-		backlight = <&backlight>;
-		rlud-gpios = <&gpio 17 GPIO_ACTIVE_HIGH>;    /* RL/UD */
-		sellvds-gpios = <&gpio 18 GPIO_ACTIVE_HIGH>; /* SELLVDS */
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/sharp,lq150x1lg11.yaml b/Documentation/devicetree/bindings/display/panel/sharp,lq150x1lg11.yaml
new file mode 100644
index 000000000000..92f2d12f4f4c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sharp,lq150x1lg11.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/sharp,lq150x1lg11.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sharp 15" LQ150X1LG11 XGA TFT LCD panel
+
+maintainers:
+  - Peter Rosin <peda@axentia.se>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: sharp,lq150x1lg11
+
+  power-supply: true
+  backlight: true
+
+  rlud-gpios:
+    maxItems: 1
+    description: |
+      GPIO for the RL/UD (rotate 180 degrees) pin.
+      If rlud-gpios and/or sellvds-gpios are not specified,
+      the RL/UD and/or SELLVDS pins are assumed to be handled
+      appropriately by the hardware.
+
+  sellvds-gpios:
+    maxItems: 1
+    description: |
+      GPIO for the SELLVDS pin.
+      If rlud-gpios and/or sellvds-gpios are not specified,
+      the RL/UD and/or SELLVDS pins are assumed to be handled
+      appropriately by the hardware.
+
+required:
+  - compatible
+  - power-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    panel {
+        compatible = "sharp,lq150x1lg11";
+
+        power-supply = <&vcc_3v3_reg>;               /* VCC */
+
+        backlight = <&backlight>;
+        rlud-gpios = <&gpio 17 GPIO_ACTIVE_HIGH>;    /* RL/UD */
+        sellvds-gpios = <&gpio 18 GPIO_ACTIVE_HIGH>; /* SELLVDS */
+    };
+
+...
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
