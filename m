Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C35852144DE
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jul 2020 12:28:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0D7D6E3FE;
	Sat,  4 Jul 2020 10:28:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83CC86E3FE
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jul 2020 10:28:19 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id t25so35185522lji.12
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Jul 2020 03:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=egNFN6wJrz0fv/icBKiyuH1pCdcaQPddX7ketsRVnQg=;
 b=hsKozLejW0y6oPXqOwCX5ttyKK6gpKN6Gl+ycH9VzvqOme6O0vjxw2/BzOATxx1WDW
 bGpSGu+ZcTSU7+VOP6tLEJ4F+z96ZUh6kCkGebwAn3eFaqz42kF9Lt8EqvzUmlKp+x1N
 Wv8NPj6SYKwLzbzcdLyqq6Pthloo2iqbDPMDqgYBT3V+T9q1Yd6z4DTfZR9/c3Y6G580
 3LDtL0B/vpTnmN55gGAaE7dPiX1USrKvaUTz2SNdzmzKcJJnloaPhVBo7d7DLb00QBK3
 VJc00Tou3qCsYaZYQuX9cXReQzfM+IZ2nhmG5w8GFHMEG+njhEB51OVG9lL+4s1IgOXr
 yrtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=egNFN6wJrz0fv/icBKiyuH1pCdcaQPddX7ketsRVnQg=;
 b=Ailso7EEiyXXk3WmxbBsr6nmxPhoP7+CsvnBu1N5+iE18JExdx8658mtNUxVAftHd+
 /11cJ06LUc4mAdwADrysz6B7Iv1y2l5bStkt7+5ciY+sWxKcyPWVLVpZZ8ZYy25YB+7f
 4wKgevHCXaaOc/nJJ0kSup5geF4DcqdBv78jyhJksvr8qGuKa+ffV40h3+0QdCBTiuXF
 QFD1Zrf1YG5K1HFhz7SvxCBX0mtb1g9m58yIXdWvcEJX5+UiES+13KpU3ExNrvdFSgvN
 Wi8KI5Q7OupgHot8ODsQ3qXtp1eShaPMgpqGrgNymi0/p0Wwgtn+eNvflQiWibz7O1oB
 a8yA==
X-Gm-Message-State: AOAM532c8wXG2JbXuAQ70iRVWV7U6VbKvwCYAL/Ne9HcbPY/kmI7LtEi
 BxRsyz+JTcVfQAT9/RJFZiywofCh3bU=
X-Google-Smtp-Source: ABdhPJxSL2bWyY24MD/8MmpUA0uTMWzddwS25odkoGDYFZTW0NB6X94wPllX9qd9L92eRx6TGueG9g==
X-Received: by 2002:a2e:a54a:: with SMTP id e10mr22733699ljn.198.1593858497688; 
 Sat, 04 Jul 2020 03:28:17 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:4025:a614:1d5c:b7bc])
 by smtp.gmail.com with ESMTPSA id z23sm5366913ljz.3.2020.07.04.03.28.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 03:28:17 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Rob Herring <robh@kernel.org>
Subject: [PATCH v3 2/3] dt-bindings: display: convert samsung,
 s6e8aa0 to DT Schema
Date: Sat,  4 Jul 2020 12:28:05 +0200
Message-Id: <20200704102806.735713-3-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200704102806.735713-1-sam@ravnborg.org>
References: <20200704102806.735713-1-sam@ravnborg.org>
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
Cc: Chris Zhong <zyw@rock-chips.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v2:
  - Add missing types (Rob)
  - Fix example to specify panel@0 (Rob)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/samsung,s6e8aa0.txt         |  56 ----------
 .../display/panel/samsung,s6e8aa0.yaml        | 100 ++++++++++++++++++
 2 files changed, 100 insertions(+), 56 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.txt b/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.txt
deleted file mode 100644
index 9e766c5f86da..000000000000
--- a/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.txt
+++ /dev/null
@@ -1,56 +0,0 @@
-Samsung S6E8AA0 AMOLED LCD 5.3 inch panel
-
-Required properties:
-  - compatible: "samsung,s6e8aa0"
-  - reg: the virtual channel number of a DSI peripheral
-  - vdd3-supply: core voltage supply
-  - vci-supply: voltage supply for analog circuits
-  - reset-gpios: a GPIO spec for the reset pin
-  - display-timings: timings for the connected panel as described by [1]
-
-Optional properties:
-  - power-on-delay: delay after turning regulators on [ms]
-  - reset-delay: delay after reset sequence [ms]
-  - init-delay: delay after initialization sequence [ms]
-  - panel-width-mm: physical panel width [mm]
-  - panel-height-mm: physical panel height [mm]
-  - flip-horizontal: boolean to flip image horizontally
-  - flip-vertical: boolean to flip image vertically
-
-The device node can contain one 'port' child node with one child
-'endpoint' node, according to the bindings defined in [2]. This
-node should describe panel's video bus.
-
-[1]: Documentation/devicetree/bindings/display/panel/display-timing.txt
-[2]: Documentation/devicetree/bindings/media/video-interfaces.txt
-
-Example:
-
-	panel {
-		compatible = "samsung,s6e8aa0";
-		reg = <0>;
-		vdd3-supply = <&vcclcd_reg>;
-		vci-supply = <&vlcd_reg>;
-		reset-gpios = <&gpy4 5 0>;
-		power-on-delay= <50>;
-		reset-delay = <100>;
-		init-delay = <100>;
-		panel-width-mm = <58>;
-		panel-height-mm = <103>;
-		flip-horizontal;
-		flip-vertical;
-
-		display-timings {
-			timing0: timing-0 {
-				clock-frequency = <57153600>;
-				hactive = <720>;
-				vactive = <1280>;
-				hfront-porch = <5>;
-				hback-porch = <5>;
-				hsync-len = <5>;
-				vfront-porch = <13>;
-				vback-porch = <1>;
-				vsync-len = <2>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.yaml
new file mode 100644
index 000000000000..f155074726d2
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,s6e8aa0.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S6E8AA0 AMOLED LCD 5.3 inch panel
+
+maintainers:
+  - Andrzej Hajda <a.hajda@samsung.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: samsung,s6e8aa0
+
+  reg: true
+  reset-gpios: true
+  display-timings: true
+
+  vdd3-supply:
+    description: core voltage supply
+
+  vci-supply:
+    description: voltage supply for analog circuits
+ 
+  power-on-delay:
+    description: delay after turning regulators on [ms]
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  reset-delay:
+    description: delay after reset sequence [ms]
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  init-delay:
+    description: delay after initialization sequence [ms]
+
+  panel-width-mm:
+    description: physical panel width [mm]
+
+  panel-height-mm:
+    description: physical panel height [mm]
+
+  flip-horizontal:
+    description: boolean to flip image horizontally
+    type: boolean
+
+  flip-vertical:
+    description: boolean to flip image vertically
+    type: boolean
+
+required:
+  - compatible
+  - reg
+  - vdd3-supply 
+  - vci-supply
+  - reset-gpios
+  - display-timings
+
+additionalProperties: false
+
+examples:
+  - |
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "samsung,s6e8aa0";
+            reg = <0>;
+            vdd3-supply = <&vcclcd_reg>;
+            vci-supply = <&vlcd_reg>;
+            reset-gpios = <&gpy4 5 0>;
+            power-on-delay= <50>;
+            reset-delay = <100>;
+            init-delay = <100>;
+            panel-width-mm = <58>;
+            panel-height-mm = <103>;
+            flip-horizontal;
+            flip-vertical;
+
+            display-timings {
+                timing0: timing-0 {
+                    clock-frequency = <57153600>;
+                    hactive = <720>;
+                    vactive = <1280>;
+                    hfront-porch = <5>;
+                    hback-porch = <5>;
+                    hsync-len = <5>;
+                    vfront-porch = <13>;
+                    vback-porch = <1>;
+                    vsync-len = <2>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
