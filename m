Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C92571497D4
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2020 21:35:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53D496E919;
	Sat, 25 Jan 2020 20:35:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D5E6E919
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jan 2020 20:35:16 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id j26so6486904ljc.12
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jan 2020 12:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tL5tN7BFhbx/5tBSxqRSV1CCaw7I2keWgntLNIP9XUE=;
 b=uGJ3SPCGt95PJiZuyAS37YHpzd5r2ksAGnaD/G41dqNDoJTPwwHoLcgAcO1Afp5NHx
 cUzXQDeBfxxIb4NKrE1qAyaEtLs+mh2yH5UxhZZIltO5NRD1xc5/cHSyt38+qJ86247Z
 HlIPzO7XoziaPRwIRXatslmW8DeB6rY/F6HobjLs11YRr/wsYcHJGEawW6nZ+BfMuWJy
 nEvcTCW2XDrQM4CglQkNgETJHN4i3u5HR+GBpps+vz2T6pLc8iQ9xYycAq2xT/Ziqub9
 bWX28yH43zucr1d7hA1ZCs2CqWE0VCvEZGVLh1jMk5gqMeCwwZIUDgDnrEfq7L7+HfeC
 vnwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tL5tN7BFhbx/5tBSxqRSV1CCaw7I2keWgntLNIP9XUE=;
 b=PjyhA7vlpeUAYAgLNErWlAauU6XtOj/kOwwHsjf5XfUeEjCj4YpvPm31I5r+k2TFCv
 qpl39btoY4snGlMs4HNvoDyUG+0isP1SvgcXTJi8+vrtjioDd7BUerSu20Q7ZnJ+Mxq7
 dqn0qI8N4AA8FeflxXuC9RWjqIgk8311I4qgPctqBjDcmeuvYEoxyQqXajR5wh91K7DF
 WhzCgTEpDxmGgXpe/33wrivoPVsVF8SqqLDFO/IewTVETf0HcIOZMfiLCN+dJ7SPOtV4
 s8KIgWbXCCcyy+yYeWcceMYmHVYHImeaWHe8GUyS8m9YliEFdHrxOho2MRk1Pv1aMULI
 DNLQ==
X-Gm-Message-State: APjAAAVzO6j7ERAzAR7WQl/FEotHadOwwTCDquEyrTPSDlxK/l5E0RMS
 gjfb7yaJtr+JyuTM9JZ8YGePwSZZdiU=
X-Google-Smtp-Source: APXvYqxhs2nVMYDobyqfXD72yB1NwAL0FeIkeK0VmLND8fACDPFyDqDMS49/8OoBfGoC1MDs6u+plQ==
X-Received: by 2002:a2e:9691:: with SMTP id q17mr5890243lji.91.1579984514704; 
 Sat, 25 Jan 2020 12:35:14 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 u17sm5393937ljk.62.2020.01.25.12.35.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jan 2020 12:35:14 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v2 3/3] dt-bindings: display: convert panel-dpi to DT schema
Date: Sat, 25 Jan 2020 21:34:54 +0100
Message-Id: <20200125203454.7450-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200125203454.7450-1-sam@ravnborg.org>
References: <20200125203454.7450-1-sam@ravnborg.org>
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
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With panel-timing converted, now convert the single
remaining .txt user in panel/ of panel-timing to DT schema.

v2:
  - Drop Thierry as maintainer, as this is not a general panel binding
    and I have no acks.
  - Drop requirement for a panel- specific binding - "panel-dpi" is enough
  - Updated example

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maxime Ripard <mripard@kernel.org>
---
 .../bindings/display/panel/panel-dpi.txt      | 50 -------------
 .../bindings/display/panel/panel-dpi.yaml     | 71 +++++++++++++++++++
 2 files changed, 71 insertions(+), 50 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/panel-dpi.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-dpi.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.txt b/Documentation/devicetree/bindings/display/panel/panel-dpi.txt
deleted file mode 100644
index 6b203bc4d932..000000000000
--- a/Documentation/devicetree/bindings/display/panel/panel-dpi.txt
+++ /dev/null
@@ -1,50 +0,0 @@
-Generic MIPI DPI Panel
-======================
-
-Required properties:
-- compatible: "panel-dpi"
-
-Optional properties:
-- label: a symbolic name for the panel
-- enable-gpios: panel enable gpio
-- reset-gpios: GPIO to control the RESET pin
-- vcc-supply: phandle of regulator that will be used to enable power to the display
-- backlight: phandle of the backlight device
-
-Required nodes:
-- "panel-timing" containing video timings
-  (Documentation/devicetree/bindings/display/panel/display-timing.txt)
-- Video port for DPI input
-
-Example
--------
-
-lcd0: display@0 {
-        compatible = "samsung,lte430wq-f0c", "panel-dpi";
-        label = "lcd";
-
-        backlight = <&backlight>;
-
-        port {
-            lcd_in: endpoint {
-                    remote-endpoint = <&dpi_out>;
-            };
-        };
-
-        panel-timing {
-                clock-frequency = <9200000>;
-                hactive = <480>;
-                vactive = <272>;
-                hfront-porch = <8>;
-                hback-porch = <4>;
-                hsync-len = <41>;
-                vback-porch = <2>;
-                vfront-porch = <4>;
-                vsync-len = <10>;
-
-                hsync-active = <0>;
-                vsync-active = <0>;
-                de-active = <1>;
-                pixelclk-active = <1>;
-        };
-};
diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
new file mode 100644
index 000000000000..a8e37318ec05
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/panel-dpi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic MIPI DPI Panel
+
+maintainers:
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    contains:
+      const: panel-dpi
+    description:
+      Shall contain "panel-dpi" in addition to an optional panel-specific
+      compatible string defined in individual panel bindings.
+      "panel-dpi" can be used alone, thus no dedicated binding file
+      is required for each and every panel.
+
+  vcc-supply:
+    description: |
+      Regulator that will be used to enable power to the display
+
+  label: true
+  enable-gpios: true
+  reset-gpios: true
+  backlight: true
+  panel-timing: true
+  port: true
+
+required:
+  - panel-timing
+
+additionalProperties: false
+
+examples:
+  - |
+    panel@0 {
+      compatible = "panel-dpi";
+      label = "lcd";
+      vcc-supply = <&vcc_supply>;
+
+      backlight = <&backlight>;
+
+      port {
+        lcd_in: endpoint {
+          remote-endpoint = <&dpi_out>;
+        };
+      };
+      panel-timing {
+        clock-frequency = <9200000>;
+        hactive = <800>;
+        vactive = <480>;
+        hfront-porch = <8>;
+        hback-porch = <4>;
+        hsync-len = <41>;
+        vback-porch = <2>;
+        vfront-porch = <4>;
+        vsync-len = <10>;
+
+        hsync-active = <0>;
+        vsync-active = <0>;
+        de-active = <1>;
+        pixelclk-active = <1>;
+      };
+    };
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
