Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6E7160541
	for <lists+dri-devel@lfdr.de>; Sun, 16 Feb 2020 19:15:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD91C6E47E;
	Sun, 16 Feb 2020 18:15:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60C316E46D
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2020 18:15:39 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id r19so16216151ljg.3
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2020 10:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M576Y01Az48NWOqCNh5DN/YDcZWavtf35b6+dPcXGTk=;
 b=gZ9WP5CcdrghC+ukDbXDAeh1kCxoRfVDDhtYvgZI5hpMLqbWi5zVdLOlsNBRnOStSP
 mPtzcxssX4wN2peaZBX7GXQJoW2LZZumFy7biE+3WlucCAohrN41+5FlFlIQIOSNNJRA
 r9hksG9/hz0XpoXGsRQEJ8TUHvdSKWya0lVAEUVyTOh4ZZ1+3Kqu4les5eK44yeTDN5x
 vQsZyHcoZdOO7AGHHBOez8PyxivvNNbexGjIzo1KMpy59tRLs+ZxbyMMTkafvj+w/lwt
 FAXLeiwSF3FFpWVDYvSAGjXsVE8SEey4DqegEtsOBRRhj1tIJqXiKvo/80XvJd5L4O5u
 Q6IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=M576Y01Az48NWOqCNh5DN/YDcZWavtf35b6+dPcXGTk=;
 b=FRsc81IWVvOlQtj7cpk8b3zWqSQAsGkEfySIvmBr9Sum0WEtHO01YJEpdZ1JiNH8wl
 zgIcsVgbh/3Inu8gKVm/8aRk9D0tIsUp6XzHXmhcWjaj/2vQYGAzzb++6bzrba2zj8HD
 XgXPrf5Hb7RvbtXXoYaJILIWq/whY92LfuQReVd95K8+8qCwWOL+fK162+OeQI3QBFhD
 LdgOMLmju7FOxDVa4yL3vQkmWryuk4FPwzidol0HDT/JkIQEShtYsSrb6OLCEnMnIPDl
 c6/+FkeXJSkc+XwRM1327jPLYOixV6eya9lhMCNkNsM/yTJR4SREydE+Cuu/s4l1k576
 rt/Q==
X-Gm-Message-State: APjAAAVwtNmcMFxRQNTA9jxzvLYYG2jhgm2a9ABQmc1cxO1Fif2BknwH
 Qqa8sou+gU9I2OWFm08Jv9k=
X-Google-Smtp-Source: APXvYqyDwVpMc2gasRlyFfrK1g7kFEUVRNpPpv3Evz79tUnzi3bdDHfsXOT+loxfVFDLyfIY2V+WxA==
X-Received: by 2002:a2e:909a:: with SMTP id l26mr7450153ljg.209.1581876937673; 
 Sun, 16 Feb 2020 10:15:37 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 u15sm6157431lfl.87.2020.02.16.10.15.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2020 10:15:37 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v3 3/5] dt-bindings: display: convert panel-dpi to DT schema
Date: Sun, 16 Feb 2020 19:15:11 +0100
Message-Id: <20200216181513.28109-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200216181513.28109-1-sam@ravnborg.org>
References: <20200216181513.28109-1-sam@ravnborg.org>
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

v3:
  - added yaml document terminator "..."
  - always require a specific binding - panel-dpi (based on feedback from Rob)
  - use "power-supply" for the supply property, and made it mandatory
    "power-supply" is the standard property for panels

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maxime Ripard <mripard@kernel.org>
---
 .../bindings/display/panel/panel-dpi.txt      | 50 -------------
 .../bindings/display/panel/panel-dpi.yaml     | 72 +++++++++++++++++++
 2 files changed, 72 insertions(+), 50 deletions(-)
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
index 000000000000..40079fc24a63
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
@@ -0,0 +1,72 @@
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
+    description:
+      Shall contain a panel specific compatible and "panel-dpi"
+      in that order.
+    items:
+      - {}
+      - const: panel-dpi
+
+  backlight: true
+  enable-gpios: true
+  height-mm: true
+  label: true
+  panel-timing: true
+  port: true
+  power-supply: true
+  reset-gpios: true
+  width-mm: true
+
+required:
+  - panel-timing
+  - power-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    panel@0 {
+        compatible = "osddisplays,osd057T0559-34ts", "panel-dpi";
+        label = "osddisplay";
+        power-supply = <&vcc_supply>;
+
+        backlight = <&backlight>;
+
+        port {
+            lcd_in: endpoint {
+                remote-endpoint = <&dpi_out>;
+            };
+        };
+        panel-timing {
+            clock-frequency = <9200000>;
+            hactive = <800>;
+            vactive = <480>;
+            hfront-porch = <8>;
+            hback-porch = <4>;
+            hsync-len = <41>;
+            vback-porch = <2>;
+            vfront-porch = <4>;
+            vsync-len = <10>;
+
+            hsync-active = <0>;
+            vsync-active = <0>;
+            de-active = <1>;
+            pixelclk-active = <1>;
+        };
+    };
+
+...
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
