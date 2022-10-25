Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A993960D0CF
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 17:38:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7F9010E169;
	Tue, 25 Oct 2022 15:38:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt
 [193.136.128.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 002EF10E3E3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 15:38:37 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 45FBA6008777;
 Tue, 25 Oct 2022 16:38:36 +0100 (WEST)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
 tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
 with LMTP id E-UtSeaQ8SqG; Tue, 25 Oct 2022 16:38:31 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt
 [IPv6:2001:690:2100:1::b3dd:b9ac])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id BCFB36008763;
 Tue, 25 Oct 2022 16:38:31 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
 s=mail; t=1666712311;
 bh=mOfuX1v6w2LK1O2hWFLzbZ86Qnb8CAZ7MrjT98fuOTU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=GViLoP3XavVcSCe4Bh5eRxFAdoK/oT8OkGKG1ahNLuL7Ixis1CS0QhtmriO2eJUHH
 U7dzow6t8JYKGvAweJz5Pv8xUCP7u47dkVCTFjmB+o7W5SsA0YdVQ7ibw2SP2s3SLu
 UOys7kLQwyWBxui/2qoFOiHxPvkELwcsB7v6hx4k=
Received: from localhost.localdomain (unknown [89.207.171.77])
 (Authenticated sender: ist187313)
 by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 249A636007E;
 Tue, 25 Oct 2022 16:38:17 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: 
Subject: [PATCH v2 1/4] dt-bindings: display: Add bindings for JDI LPM102A188A
Date: Tue, 25 Oct 2022 16:37:45 +0100
Message-Id: <20221025153746.101278-2-diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221025153746.101278-1-diogo.ivo@tecnico.ulisboa.pt>
References: <20221025153746.101278-1-diogo.ivo@tecnico.ulisboa.pt>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Changes in v2:
 - removed the touch screen property

 .../display/panel/jdi,lpm102a188a.yaml        | 94 +++++++++++++++++++
 1 file changed, 94 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/jdi,lpm102a188a.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/jdi,lpm102a188a.yaml b/Documentation/devicetree/bindings/display/panel/jdi,lpm102a188a.yaml
new file mode 100644
index 000000000000..2f4d27a309a7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/jdi,lpm102a188a.yaml
@@ -0,0 +1,94 @@
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
2.38.1

