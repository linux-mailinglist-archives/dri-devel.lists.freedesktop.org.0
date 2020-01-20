Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDDB1432BF
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 21:07:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30BAF6EB0E;
	Mon, 20 Jan 2020 20:07:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F01E16EA92
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 20:07:09 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id q8so344877ljj.11
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 12:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/kuJ/ORP4+g5NQP/GE+6GKKCVKyl0ll30JpRdoi6mUI=;
 b=N4qJLGC+mHLDoOa+V03ddJmWtCrUqnYp/lelQvjXdWBodpfJaKSKgJtAFyXscGWlCn
 O6NW8DNmHhTMCM6THNDoTcCE3G0zC20ekhZN8AWxY4LDJUAG9r4pGiG2uotcb/sRTbgY
 iC576c7JE8HnK7FbJT9FqMaVQQTrvCOyfqOLt8Quhx46I4/knegl7A5YXIuN1s/R+ii5
 iAuhVi6ytqqGJqqwMZBlZgEaCEYF+Avpq5oB3hw80GY+mjr3RddGaxktT6l/7f38fm0I
 FrQCmQM2CN08hDn0OvF8zQWdKUVDP/E4eT6ICyfCJanylyhOcXucKjl+7k8P8jDj1+6X
 zMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/kuJ/ORP4+g5NQP/GE+6GKKCVKyl0ll30JpRdoi6mUI=;
 b=pMpDaCQCijf05bpVbP0+/HrEVEqJwqHK/1jUlnbFgJ4mINCtQYfp6QwRNR2uy4Qd+R
 NtGmbIk4Ha8lsmV84C9l/sEAsDr7+J8zMt7DU2Zf21THfAICoz4KQ732D2CBePr77QJw
 bSX9irmDyInHfSDCryuWoQo7McDBcQbGIB1FSxFv3/am2UYCSJel0h4u0kcApifLbIGh
 6ornKjVlfVy217c12FEec6HhWZ9vt2Afv5R6wMxNRSW5kb5FG/ocT9jkbTuF1AfeAnww
 qWdFD9m50y/Tjuz+rldd7j3tQauDB3XM64QJTX24xjZh07JAvXsMFjf55m0yQEzynFVb
 CYIw==
X-Gm-Message-State: APjAAAWpLY/owDl3HLMxubWI1ifora0ot4/6JK5HLL6tuNkaPgbx8ImQ
 NqolN5IP7equMx466V2wV2o=
X-Google-Smtp-Source: APXvYqxzOSkcdvvVhIic2TIHiodXwPKStxIxK5q0hSK/EiKI4O/bfEKZ1w+CxsiF0KfqjfVm29ygxQ==
X-Received: by 2002:a2e:93c9:: with SMTP id p9mr13085114ljh.136.1579550828414; 
 Mon, 20 Jan 2020 12:07:08 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 o12sm17332476ljj.79.2020.01.20.12.07.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2020 12:07:07 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v1 3/3] dt-bindings: display: convert panel-dpi to DT schema
Date: Mon, 20 Jan 2020 21:06:41 +0100
Message-Id: <20200120200641.15047-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200120200641.15047-1-sam@ravnborg.org>
References: <20200120200641.15047-1-sam@ravnborg.org>
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
Cc: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With panel-timing converted, now convert the single
remaining .txt user in panel/ of panel-timing to DT schema.

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
index 000000000000..4e19c1fd52c3
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
+  - Thierry Reding <thierry.reding@gmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    contains:
+      const: panel-dpi
+    description:
+      Shall contain "panel-dpi" in addition to a mandatory panel-specific
+      compatible string defined in individual panel bindings. The "panel-dpi"
+      value shall never be used on its own.
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
+      compatible = "samsung,lte430wq-f0c", "panel-dpi";
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
+        hactive = <480>;
+        vactive = <272>;
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
