Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC8D5EFC54
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 19:52:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D6A10EBA9;
	Thu, 29 Sep 2022 17:52:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt
 [193.136.128.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD6910E031
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 17:11:50 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id D36626003C1A;
 Thu, 29 Sep 2022 18:05:00 +0100 (WEST)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
 tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
 with LMTP id e9jcLLVYttq7; Thu, 29 Sep 2022 18:04:56 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id C4C766005C23;
 Thu, 29 Sep 2022 18:04:56 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
 s=mail; t=1664471096;
 bh=ll+g2rDaCObbl1dD5PlnPH9uSgkTwBiWKYOxd79ugPQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Ebc3vckAN90poPYjw2FSZ1NeG1WOJp9sjt2lTbAF2tYLcf206YosCmZNOTDTYkebG
 s+V8bJmug71aDHJcFX0vW69OdEWcHuKJkxBWc9jTYF9J5ce8oxxpj86sNNhfsZ26Xc
 xVdiWf2yEU5gKq4iR8onxQ2Vz+NTfcyvRkodWAdQ=
Received: from wslaptop.lan (unknown
 [IPv6:2001:818:dcb5:dc00:7a88:7f12:8ed8:518d])
 (Authenticated sender: ist187313)
 by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 81AD7360086;
 Thu, 29 Sep 2022 18:04:56 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: 
Subject: [PATCH 1/4] dt-bindings: display: Add bindings for JDI LPM102A188A
Date: Thu, 29 Sep 2022 18:04:59 +0100
Message-Id: <20220929170502.1034040-2-diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220929170502.1034040-1-diogo.ivo@tecnico.ulisboa.pt>
References: <20220929170502.1034040-1-diogo.ivo@tecnico.ulisboa.pt>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 29 Sep 2022 17:52:24 +0000
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 arnd@arndb.de, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 jonathanh@nvidia.com, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 robh+dt@kernel.org, thierry.reding@gmail.com, linux-tegra@vger.kernel.org,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The LPM102A188A is a 10.2" 2560x1800 IPS panel found in
the Google Pixel C.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 .../display/panel/jdi,lpm102a188a.yaml        | 100 ++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/jdi,lpm102a188a.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/jdi,lpm102a188a.yaml b/Documentation/devicetree/bindings/display/panel/jdi,lpm102a188a.yaml
new file mode 100644
index 000000000000..97f9db7152da
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/jdi,lpm102a188a.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/jdi,lpm102a188a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: JDI LPM102A188A 2560x1800 10.2" DSI Panel
+
+maintainers:
+  - Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
+
+description: |
+  This panel requires a dual-channel DSI host to operate. It supports two modes:
+  - left-right: each channel drives the left or right half of the screen
+  - even-odd: each channel drives the even or odd lines of the screen
+
+  Each of the DSI channels controls a separate DSI peripheral. The peripheral
+  driven by the first link (DSI-LINK1) is considered the primary peripheral
+  and controls the device. The 'link2' property contains a phandle to the
+  peripheral driven by the second link (DSI-LINK2).
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: jdi,lpm102a188a
+
+  reg: true
+  enable-gpios: true
+  reset-gpios: true
+  power-supply: true
+  backlight: true
+
+  ts-reset-gpios:
+    maxItems: 1
+    description: |
+      Specifier for a GPIO connected to the touchscreen reset control signal.
+      The reset signal is active low.
+
+  ddi-supply:
+    description: The regulator that provides IOVCC (1.8V).
+
+  link2:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      phandle to the DSI peripheral on the secondary link. Note that the
+      presence of this property marks the containing node as DSI-LINK1.
+
+required:
+  - compatible
+  - reg
+
+if:
+  required:
+    - link2
+then:
+  required:
+    - power-supply
+    - ddi-supply
+    - enable-gpios
+    - reset-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/gpio/tegra-gpio.h>
+
+    dsia: dsi@54300000 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        reg = <0x0 0x54300000 0x0 0x00040000>;
+
+        link2: panel@0 {
+            compatible = "jdi,lpm102a188a";
+            reg = <0>;
+        };
+    };
+
+    dsib: dsi@54400000{
+        #address-cells = <1>;
+        #size-cells = <0>;
+        reg = <0x0 0x54400000 0x0 0x00040000>;
+        nvidia,ganged-mode = <&dsia>;
+
+        link1: panel@0 {
+            compatible = "jdi,lpm102a188a";
+            reg = <0>;
+            power-supply = <&pplcd_vdd>;
+            ddi-supply = <&pp1800_lcdio>;
+            enable-gpios = <&gpio TEGRA_GPIO(V, 1) GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_LOW>;
+            link2 = <&link2>;
+            backlight = <&backlight>;
+        };
+    };
+
+...
-- 
2.37.3

