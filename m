Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 052CF653619
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 19:23:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE1E10E46A;
	Wed, 21 Dec 2022 18:23:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 865D410E46A
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 18:22:57 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id u19so38790985ejm.8
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 10:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=c4dv6oXXbV7Yt+cuvCfN1yeTgdyhuF7tNIy93Tdm9mk=;
 b=DmVkimDCv1RMHx8zNuIr0hVmUGcTSb6GmmNA4S40jRxR8n2siE7MVgu9/4G99YQOvq
 BXKc0yzlEVQM1wbj++xgOfvEjtQzyojxRa6Jcg5NzYpjuBPCMyAxOx01rNGUEQI8ARFb
 cfgwgcipt0NQQRLyATWpmqRXROFfgwjaNDhtlr4QE48N2XM3UtwPWLj9ijXkycxSXWDi
 AbNZxOh/ewYd5eFLYB/Z38fmuu+x8IlXUFInWxwAlShXdAZ5TIJBTCKaV7BRzu1jBs0h
 jPsHVDr4NQRpJK9hz1mmq+9omqRZoNPd2pj6++AfWOrMbpfsZE9WigNk61ANNiaGKp1r
 Tx9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c4dv6oXXbV7Yt+cuvCfN1yeTgdyhuF7tNIy93Tdm9mk=;
 b=gBY24soUMpgPOGeGbPE93LDb5ACv35LLR+K1i9yGzmWqj3WQLq/JMHs3Gnb32a9wE6
 GnlcikW2DrK9nw1wNc5HFKxkND1ABxh9bvZdPZnJdg4UB+BVV4rwai6M1Pe/EWQPcgeO
 npQkGs/+GSqtBvOfLV964V7jpg6uHEV2udx0tTCdckRIYK8M9H/eOJPRHvyn/B54nAYG
 fH2E6Po9BCVnNOJAH9Oid+IePLxCKKvI6RWkorb+ywyh/KLPd56mMNGq/peVLQDF1tfD
 WX7JOMUBKJfYv6JprZrBJMeSJ5v5LcTeaPHvE1NTdxnQ/jKnP0FRRAcJy7rp8PW0Uymp
 hJjQ==
X-Gm-Message-State: AFqh2kprFe5D/xqf/cmPJXAdmmIvtQD4c+g3cuuTNpIgDCh+I/RrrFmQ
 szT1+m8u86JJ6RqFPUp7oFSS3r2O2cc=
X-Google-Smtp-Source: AMrXdXs1vg0yOHrTah3eRj6np8cbFX7VZxcmDGffGyzNYZCO/0Y9P7kTis2rdk8JzcuufMDtYQCr1w==
X-Received: by 2002:a17:907:970a:b0:7c0:fd1a:79ee with SMTP id
 jg10-20020a170907970a00b007c0fd1a79eemr3338905ejc.63.1671646976095; 
 Wed, 21 Dec 2022 10:22:56 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a17090682c900b007c09d37eac7sm7352055ejy.216.2022.12.21.10.22.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 10:22:55 -0800 (PST)
Message-ID: <245d4cd5-819c-8c6f-c448-107936ec9e88@gmail.com>
Date: Wed, 21 Dec 2022 19:22:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v5 04/12] dt-bindings: display: rockchip: convert
 dw_mipi_dsi_rockchip.txt to yaml
To: heiko@sntech.de
References: <7f883643-c796-029f-ba38-73532325632d@gmail.com>
Content-Language: en-US
In-Reply-To: <7f883643-c796-029f-ba38-73532325632d@gmail.com>
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
Cc: linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org,
 jernej.skrabec@gmail.com, krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-usb@vger.kernel.org, hjc@rock-chips.com, robert.foss@linaro.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 andrzej.hajda@intel.com, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com,
 devicetree@vger.kernel.org, philippe.cornu@foss.st.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert dw_mipi_dsi_rockchip.txt to yaml.

Changed:
  add clock-master property
  file name
  requirements

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 .../display/rockchip/dw_mipi_dsi_rockchip.txt |  94 ----------
 .../rockchip/rockchip,dw-mipi-dsi.yaml        | 173 ++++++++++++++++++
 2 files changed, 173 insertions(+), 94 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/rockchip/dw_mipi_dsi_rockchip.txt
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml

diff --git a/Documentation/devicetree/bindings/display/rockchip/dw_mipi_dsi_rockchip.txt b/Documentation/devicetree/bindings/display/rockchip/dw_mipi_dsi_rockchip.txt
deleted file mode 100644
index 9a223df85..000000000
--- a/Documentation/devicetree/bindings/display/rockchip/dw_mipi_dsi_rockchip.txt
+++ /dev/null
@@ -1,94 +0,0 @@
-Rockchip specific extensions to the Synopsys Designware MIPI DSI
-================================
-
-Required properties:
-- #address-cells: Should be <1>.
-- #size-cells: Should be <0>.
-- compatible: one of
-	"rockchip,px30-mipi-dsi", "snps,dw-mipi-dsi"
-	"rockchip,rk3288-mipi-dsi", "snps,dw-mipi-dsi"
-	"rockchip,rk3399-mipi-dsi", "snps,dw-mipi-dsi"
-	"rockchip,rk3568-mipi-dsi", "snps,dw-mipi-dsi"
-- reg: Represent the physical address range of the controller.
-- interrupts: Represent the controller's interrupt to the CPU(s).
-- clocks, clock-names: Phandles to the controller's pll reference
-  clock(ref) when using an internal dphy and APB clock(pclk).
-  For RK3399, a phy config clock (phy_cfg) and a grf clock(grf)
-  are required. As described in [1].
-- rockchip,grf: this soc should set GRF regs to mux vopl/vopb.
-- ports: contain a port node with endpoint definitions as defined in [2].
-  For vopb,set the reg = <0> and set the reg = <1> for vopl.
-- video port 0 for the VOP input, the remote endpoint maybe vopb or vopl
-- video port 1 for either a panel or subsequent encoder
-
-Optional properties:
-- phys: from general PHY binding: the phandle for the PHY device.
-- phy-names: Should be "dphy" if phys references an external phy.
-- #phy-cells: Defined when used as ISP phy, should be 0.
-- power-domains: a phandle to mipi dsi power domain node.
-- resets: list of phandle + reset specifier pairs, as described in [3].
-- reset-names: string reset name, must be "apb".
-
-[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-[2] Documentation/devicetree/bindings/media/video-interfaces.txt
-[3] Documentation/devicetree/bindings/reset/reset.txt
-
-Example:
-	mipi_dsi: mipi@ff960000 {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		compatible = "rockchip,rk3288-mipi-dsi", "snps,dw-mipi-dsi";
-		reg = <0xff960000 0x4000>;
-		interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cru SCLK_MIPI_24M>, <&cru PCLK_MIPI_DSI0>;
-		clock-names = "ref", "pclk";
-		resets = <&cru SRST_MIPIDSI0>;
-		reset-names = "apb";
-		rockchip,grf = <&grf>;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			mipi_in: port@0 {
-				reg = <0>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				mipi_in_vopb: endpoint@0 {
-					reg = <0>;
-					remote-endpoint = <&vopb_out_mipi>;
-				};
-				mipi_in_vopl: endpoint@1 {
-					reg = <1>;
-					remote-endpoint = <&vopl_out_mipi>;
-				};
-			};
-
-			mipi_out: port@1 {
-				reg = <1>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				mipi_out_panel: endpoint {
-					remote-endpoint = <&panel_in_mipi>;
-				};
-			};
-		};
-
-		panel {
-			compatible ="boe,tv080wum-nl0";
-			reg = <0>;
-
-			enable-gpios = <&gpio7 3 GPIO_ACTIVE_HIGH>;
-			pinctrl-names = "default";
-			pinctrl-0 = <&lcd_en>;
-			backlight = <&backlight>;
-
-			port {
-				panel_in_mipi: endpoint {
-					remote-endpoint = <&mipi_out_panel>;
-				};
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml
new file mode 100644
index 000000000..441e283b8
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml
@@ -0,0 +1,173 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-mipi-dsi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip specific extensions to the Synopsys Designware MIPI DSI
+
+maintainers:
+  - Sandy Huang <hjc@rock-chips.com>
+  - Heiko Stuebner <heiko@sntech.de>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - rockchip,px30-mipi-dsi
+          - rockchip,rk3288-mipi-dsi
+          - rockchip,rk3399-mipi-dsi
+          - rockchip,rk3568-mipi-dsi
+      - const: snps,dw-mipi-dsi
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 4
+
+  clock-names:
+    oneOf:
+      - minItems: 2
+        items:
+          - const: ref
+          - const: pclk
+          - const: phy_cfg
+          - const: grf
+      - const: pclk
+
+  clock-master:
+    type: boolean
+    description:
+      As described in the general dual-dsi devicetree binding the panel should
+      define two input ports and point each of them to one of the used
+      dsi-controllers, as well as declare one of them as clock-master.
+
+  rockchip,grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      This SoC uses GRF regs to switch between vopl/vopb.
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    const: dphy
+
+  "#phy-cells":
+    const: 0
+    description:
+      Defined when in use as ISP phy.
+
+  power-domains:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - rockchip,grf
+
+allOf:
+  - $ref: ../bridge/snps,dw-mipi-dsi.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,px30-mipi-dsi
+              - rockchip,rk3568-mipi-dsi
+
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+
+        clock-names:
+          maxItems: 1
+
+      required:
+        - phys
+        - phy-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3288-mipi-dsi
+
+    then:
+      properties:
+        clocks:
+          maxItems: 2
+
+        clock-names:
+          maxItems: 2
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3399-mipi-dsi
+
+    then:
+      properties:
+        clocks:
+          minItems: 4
+
+        clock-names:
+          minItems: 4
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rk3288-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    mipi_dsi: dsi@ff960000 {
+      compatible = "rockchip,rk3288-mipi-dsi", "snps,dw-mipi-dsi";
+      reg = <0xff960000 0x4000>;
+      interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&cru SCLK_MIPIDSI_24M>, <&cru PCLK_MIPI_DSI0>;
+      clock-names = "ref", "pclk";
+      resets = <&cru SRST_MIPIDSI0>;
+      reset-names = "apb";
+      rockchip,grf = <&grf>;
+
+      ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        mipi_in: port@0 {
+          reg = <0>;
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          mipi_in_vopb: endpoint@0 {
+            reg = <0>;
+            remote-endpoint = <&vopb_out_mipi>;
+          };
+          mipi_in_vopl: endpoint@1 {
+            reg = <1>;
+            remote-endpoint = <&vopl_out_mipi>;
+          };
+        };
+
+        mipi_out: port@1 {
+          reg = <1>;
+
+          mipi_out_panel: endpoint {
+            remote-endpoint = <&panel_in_mipi>;
+          };
+        };
+      };
+    };
--
2.20.1

