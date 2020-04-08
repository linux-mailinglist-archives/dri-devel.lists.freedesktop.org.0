Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A261A29CB
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 21:52:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BC656EAD9;
	Wed,  8 Apr 2020 19:52:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12F5C6EAD4
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 19:51:57 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id v16so9035476ljg.5
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Apr 2020 12:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gts8IBK9sE8CfYbVSsVTkwe650OyDr0ovRiE3fWcD5w=;
 b=fy7py9mJ7xLW9YoKJCavc0rM7N1S2ZJ1i2xWM6bPxAfKhwNLe085VmXMVqSFZ/BUuh
 DsNmYNbLxMgblA74MbUTxY9fwU+cpiKnMoMbWVD00TAjeB0Nmjygu+/zH+ynalzvQYqR
 zdhs8r3/xXKItmbxdnF1Ea7WfXCkPe532WQ0fDXtCBsUSN7CEl/cskfKB43sw2Bbd5Ec
 8AEsA/JTiSn90W1GSBIKwnO7MZyCbB/DBy3zNIaxBIR2fkMORHKNEOb0xoMT/WyDxjR2
 uPEyG7llbcRBVWdqT+KsVUNzsnmxmj74vkKpcu1SJFg/h8fDSN0x745/5wZ71wEVMq6u
 zOLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gts8IBK9sE8CfYbVSsVTkwe650OyDr0ovRiE3fWcD5w=;
 b=ILIBWa3E74acKSQSxBzl7cNHfGicdlGGMB4tzeW1WWf4zwcJIsrbVdcvbZATRjjVbT
 LZm+A1NEiw0P88yKh21h9by1hEteINQBaS3DgAW4J4M5RBXXzpVO/EqVctAZFRwBP2wZ
 Qiu+0xmx+hsmyMVgcdv3MFDaQXgdGkCnIXehqCY6NWhQzT00mvfg1lmhIPEyEPug1w5M
 vdC9ZzwYcOvQLvrbsm8fSB9rBjYT7oRP+8CmMiPrjhgazNVKULocUOFXHTMuVmai1BG7
 oguSa8ZvAOV84Nnpk5ehPoATAbOGdmgOu4upAwfVneanL8XIJdOLqK8EY0cVjvsBXl3g
 EQYA==
X-Gm-Message-State: AGi0PuY6IevDHwtkHr5edx3UDVrHPzcsLq0+T08bgrMfUZa4iohnhhWJ
 BBh5vDGPnCab6CV1oVjW1SEa065PGIU=
X-Google-Smtp-Source: APiQypKE90E7N2o/yHSibcHm+rJeb50Ogag0nb6GTjwrAzUJENGsLHHdGJo+6lW9xokMMiEI0l9e3Q==
X-Received: by 2002:a2e:900c:: with SMTP id h12mr3845652ljg.290.1586375515137; 
 Wed, 08 Apr 2020 12:51:55 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 i20sm3961304lfe.15.2020.04.08.12.51.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 12:51:54 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v2 13/36] dt-bindings: display: convert kingdisplay,
 kd035g6-54nt to DT Schema
Date: Wed,  8 Apr 2020 21:50:46 +0200
Message-Id: <20200408195109.32692-14-sam@ravnborg.org>
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
Cc: Paul Cercueil <paul@crapouillou.net>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v2:
  - Drop use of spi-slave.yaml (Maxime)
  - Introduce unevaluatedProperties (Maxime)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Paul Cercueil <paul@crapouillou.net>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../panel/kingdisplay,kd035g6-54nt.txt        | 42 ------------
 .../panel/kingdisplay,kd035g6-54nt.yaml       | 65 +++++++++++++++++++
 2 files changed, 65 insertions(+), 42 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.txt b/Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.txt
deleted file mode 100644
index fa9596082e44..000000000000
--- a/Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-King Display KD035G6-54NT 3.5" (320x240 pixels) 24-bit TFT LCD panel
-
-Required properties:
-- compatible: should be "kingdisplay,kd035g6-54nt"
-- power-supply: See panel-common.txt
-- reset-gpios: See panel-common.txt
-
-Optional properties:
-- backlight: see panel-common.txt
-
-The generic bindings for the SPI slaves documented in [1] also apply.
-
-The device node can contain one 'port' child node with one child
-'endpoint' node, according to the bindings defined in [2]. This
-node should describe panel's video bus.
-
-[1]: Documentation/devicetree/bindings/spi/spi-bus.txt
-[2]: Documentation/devicetree/bindings/graph.txt
-
-Example:
-
-&spi {
-	panel@0 {
-		compatible = "kingdisplay,kd035g6-54nt";
-		reg = <0>;
-
-		spi-max-frequency = <3125000>;
-		spi-3wire;
-		spi-cs-high;
-
-		reset-gpios = <&gpe 2 GPIO_ACTIVE_LOW>;
-
-		backlight = <&backlight>;
-		power-supply = <&ldo6>;
-
-		port {
-			panel_input: endpoint {
-				remote-endpoint = <&panel_output>;
-			};
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.yaml b/Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.yaml
new file mode 100644
index 000000000000..6960036975fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/kingdisplay,kd035g6-54nt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: King Display KD035G6-54NT 3.5" (320x240 pixels) 24-bit TFT LCD panel
+
+description: |
+  The panel must obey the rules for a SPI slave device as specified in
+  spi/spi-controller.yaml
+
+maintainers:
+  - Paul Cercueil <paul@crapouillou.net>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: kingdisplay,kd035g6-54nt
+
+  backlight: true
+  port: true
+  power-supply: true
+  reg: true
+  reset-gpios: true
+
+required:
+  - compatible
+  - power-supply
+  - reset-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "kingdisplay,kd035g6-54nt";
+            reg = <0>;
+
+            spi-max-frequency = <3125000>;
+            spi-3wire;
+            spi-cs-high;
+
+            reset-gpios = <&gpe 2 GPIO_ACTIVE_LOW>;
+
+            backlight = <&backlight>;
+            power-supply = <&ldo6>;
+
+            port {
+                panel_input: endpoint {
+                    remote-endpoint = <&panel_output>;
+                };
+            };
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
