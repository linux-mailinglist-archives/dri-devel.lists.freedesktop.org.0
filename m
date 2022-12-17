Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D728C64F9D2
	for <lists+dri-devel@lfdr.de>; Sat, 17 Dec 2022 16:24:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D97CD10E16B;
	Sat, 17 Dec 2022 15:24:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7FA510E0CA
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Dec 2022 15:23:56 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id tz12so12495214ejc.9
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Dec 2022 07:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:content-language:cc:to:subject:from
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V5C933pTuq+Mf4mWhgt6H3RBoCaasPgQ7m231aVL8Ao=;
 b=emffBAWs/M+CDQGo0gGvBU1U4ddTAi4afzvkLJhFkOOHmzYxQPiB5ovCUuBnyYDtzZ
 pdYQOGjF+uwUE2QUGUJYmGpLvRLN6/WRxCSa5eF6qC2eDRMe8L1ErsFnuv7hg0hcC8Qa
 2YcXdw8wwa3YaRD6olsWVm9KIhuVsuXSp9T1IzRMfdB7RR5XqMEC0USF1eazHx2zd5nx
 9g64lvI+CSIiNmq54kb15RCEnEoIGcV81xk6MdDAEZaFeZzJbWZvIqWcdcTgicmwGqU6
 r5L2ZTgvgqxao5COSLtCgNPGRS7i3tM3m4dPX+rwZLbM/cB2T9xPsiB7+Ofl6OzmA/qB
 EA7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:content-language:cc:to:subject:from
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=V5C933pTuq+Mf4mWhgt6H3RBoCaasPgQ7m231aVL8Ao=;
 b=7gIsnx2fPSlhEMCQMGZqsLBsHFSp5abqbV0AcNW12HWCaGvgmt24dFqB0JLYy8y/nt
 KzjQ0JvhW0exasxvy7eo9TyUKLammdz/MwvaZHoKb9rbgfnT1o11efud/m+Oeh4BV5az
 oAKfedJ6WuKwi4leCTeAvhz6iE9b/6mn5mfyE+lo0Da1Xmva+iGniWNB+3D/AItWYHL2
 Pdc3mC4tyNcYvWocwrK16TzBhkJm3jUS9S4S59ZhgLg9FJVKNtmiriM9C1vPNfIIRHhH
 HC1iqvaAG4qYMv12OLyvhAlJ/PHh+ZiIkjz+pojkNZvPZTJn7SpPaUjjaY9lx/3yZ0IL
 gNXg==
X-Gm-Message-State: ANoB5plzsT0EUdhDA1ERso1m4PDiHoQpoB0zx5QxbUNhBUkNgxm9Zx2i
 OoJRIcKBb0sswGG1q51MBoo=
X-Google-Smtp-Source: AA0mqf6sX3Bf+D4CLaAll86D+5GyiILFVYoUJSzDaBxsNuEV1cFrjEs4+L6K6BS5jLXQM5PL07Mo+Q==
X-Received: by 2002:a17:906:9f1e:b0:7c0:7d35:e9db with SMTP id
 fy30-20020a1709069f1e00b007c07d35e9dbmr43554654ejc.15.1671290635488; 
 Sat, 17 Dec 2022 07:23:55 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 i4-20020a170906250400b0078d22b0bcf2sm2070732ejb.168.2022.12.17.07.23.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Dec 2022 07:23:55 -0800 (PST)
Message-ID: <dea33013-ae1b-a8b2-5287-68a52f5ce028@gmail.com>
Date: Sat, 17 Dec 2022 16:23:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v2] dt-bindings: display: rockchip: convert rockchip-lvds.txt
 to YAML
To: heiko@sntech.de
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
 hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert rockchip-lvds.txt to YAML.

Changed:
  Add power-domains property.
  Requirements between PX30 and RK3288

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---

Changed V2:
  Fix title
---
 .../display/rockchip/rockchip-lvds.txt        |  92 ----------
 .../display/rockchip/rockchip-lvds.yaml       | 157 ++++++++++++++++++
 2 files changed, 157 insertions(+), 92 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip-lvds.txt
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip-lvds.yaml

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-lvds.txt b/Documentation/devicetree/bindings/display/rockchip/rockchip-lvds.txt
deleted file mode 100644
index aaf8c44cf..000000000
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip-lvds.txt
+++ /dev/null
@@ -1,92 +0,0 @@
-Rockchip RK3288 LVDS interface
-================================
-
-Required properties:
-- compatible: matching the soc type, one of
-	- "rockchip,rk3288-lvds";
-	- "rockchip,px30-lvds";
-
-- reg: physical base address of the controller and length
-	of memory mapped region.
-- clocks: must include clock specifiers corresponding to entries in the
-	clock-names property.
-- clock-names: must contain "pclk_lvds"
-
-- avdd1v0-supply: regulator phandle for 1.0V analog power
-- avdd1v8-supply: regulator phandle for 1.8V analog power
-- avdd3v3-supply: regulator phandle for 3.3V analog power
-
-- rockchip,grf: phandle to the general register files syscon
-- rockchip,output: "rgb", "lvds" or "duallvds", This describes the output interface
-
-- phys: LVDS/DSI DPHY (px30 only)
-- phy-names: name of the PHY, must be "dphy" (px30 only)
-
-Optional properties:
-- pinctrl-names: must contain a "lcdc" entry.
-- pinctrl-0: pin control group to be used for this controller.
-
-Required nodes:
-
-The lvds has two video ports as described by
-	Documentation/devicetree/bindings/media/video-interfaces.txt
-Their connections are modeled using the OF graph bindings specified in
-	Documentation/devicetree/bindings/graph.txt.
-
-- video port 0 for the VOP input, the remote endpoint maybe vopb or vopl
-- video port 1 for either a panel or subsequent encoder
-
-Example:
-
-lvds_panel: lvds-panel {
-	compatible = "auo,b101ean01";
-	enable-gpios = <&gpio7 21 GPIO_ACTIVE_HIGH>;
-	data-mapping = "jeida-24";
-
-	ports {
-		panel_in_lvds: endpoint {
-			remote-endpoint = <&lvds_out_panel>;
-		};
-	};
-};
-
-For Rockchip RK3288:
-
-	lvds: lvds@ff96c000 {
-		compatible = "rockchip,rk3288-lvds";
-		rockchip,grf = <&grf>;
-		reg = <0xff96c000 0x4000>;
-		clocks = <&cru PCLK_LVDS_PHY>;
-		clock-names = "pclk_lvds";
-		pinctrl-names = "lcdc";
-		pinctrl-0 = <&lcdc_ctl>;
-		avdd1v0-supply = <&vdd10_lcd>;
-		avdd1v8-supply = <&vcc18_lcd>;
-		avdd3v3-supply = <&vcca_33>;
-		rockchip,output = "rgb";
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			lvds_in: port@0 {
-				reg = <0>;
-
-				lvds_in_vopb: endpoint@0 {
-					reg = <0>;
-					remote-endpoint = <&vopb_out_lvds>;
-				};
-				lvds_in_vopl: endpoint@1 {
-					reg = <1>;
-					remote-endpoint = <&vopl_out_lvds>;
-				};
-			};
-
-			lvds_out: port@1 {
-				reg = <1>;
-
-				lvds_out_panel: endpoint {
-					remote-endpoint = <&panel_in_lvds>;
-				};
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-lvds.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-lvds.yaml
new file mode 100644
index 000000000..f05901633
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-lvds.yaml
@@ -0,0 +1,157 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/rockchip/rockchip-lvds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip low-voltage differential signal (LVDS) transmitter
+
+maintainers:
+  - Sandy Huang <hjc@rock-chips.com>
+  - Heiko Stuebner <heiko@sntech.de>
+
+properties:
+  compatible:
+    enum:
+      - rockchip,px30-lvds
+      - rockchip,rk3288-lvds
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: pclk_lvds
+
+  avdd1v0-supply:
+    description: Regulator phandle for 1.0V analog power.
+
+  avdd1v8-supply:
+    description: Regulator phandle for 1.8V analog power.
+
+  avdd3v3-supply:
+    description: Regulator phandle for 3.3V analog power.
+
+  rockchip,grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the general register files syscon.
+
+  rockchip,output:
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [rgb, lvds, duallvds]
+    description: This describes the output interface.
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    const: dphy
+
+  pinctrl-names:
+    const: lcdc
+
+  pinctrl-0: true
+
+  power-domains:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Video port 0 for the VOP input, the remote endpoint maybe vopb or vopl.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Video port 1 for either a panel or subsequent encoder.
+
+    required:
+      - port@0
+      - port@1
+
+additionalProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,px30-lvds
+
+    then:
+      required:
+        - phys
+        - phy-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3288-lvds
+
+    then:
+      required:
+        - reg
+        - clocks
+        - clock-names
+        - avdd1v0-supply
+        - avdd1v8-supply
+        - avdd3v3-supply
+
+required:
+  - compatible
+  - rockchip,grf
+  - rockchip,output
+  - ports
+
+examples:
+  - |
+    #include <dt-bindings/clock/rk3288-cru.h>
+
+    lvds: lvds@ff96c000 {
+      compatible = "rockchip,rk3288-lvds";
+      reg = <0xff96c000 0x4000>;
+      clocks = <&cru PCLK_LVDS_PHY>;
+      clock-names = "pclk_lvds";
+      avdd1v0-supply = <&vdd10_lcd>;
+      avdd1v8-supply = <&vcc18_lcd>;
+      avdd3v3-supply = <&vcca_33>;
+      pinctrl-names = "lcdc";
+      pinctrl-0 = <&lcdc_ctl>;
+      rockchip,grf = <&grf>;
+      rockchip,output = "rgb";
+
+      ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        lvds_in: port@0 {
+          reg = <0>;
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          lvds_in_vopb: endpoint@0 {
+            reg = <0>;
+            remote-endpoint = <&vopb_out_lvds>;
+          };
+          lvds_in_vopl: endpoint@1 {
+            reg = <1>;
+            remote-endpoint = <&vopl_out_lvds>;
+          };
+        };
+
+        lvds_out: port@1 {
+          reg = <1>;
+
+          lvds_out_panel: endpoint {
+            remote-endpoint = <&panel_in_lvds>;
+          };
+        };
+      };
+    };
--
2.20.1

