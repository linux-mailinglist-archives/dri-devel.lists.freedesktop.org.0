Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B68B28DA39
	for <lists+dri-devel@lfdr.de>; Wed, 14 Oct 2020 09:04:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C82E16EA14;
	Wed, 14 Oct 2020 07:04:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 047EB6E8B3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 08:52:18 +0000 (UTC)
X-UUID: ac52facbdf994553950c95397a372348-20201013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=LgLY/RtRL3wW3PxxLCV6LQWDzcshpKNteHKF0VL2tfw=; 
 b=KglA+R6zAALkEZJzToHfM23LDZGo8XHGamgub+9SjRfiGEk0ZH+jGdWNvGjrcM1uiLxZeNjsIaqkPsn8zs0TxvKWbdt4xGhsQY/on/ySB/cCPdD+x0TfEBLqf5MRzVk4da7pDQmhA7FeQpUUyR9v4m64XxRccCGGTWAwEIomUeA=;
X-UUID: ac52facbdf994553950c95397a372348-20201013
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <chunfeng.yun@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 215579076; Tue, 13 Oct 2020 16:52:13 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 13 Oct 2020 16:52:12 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 13 Oct 2020 16:52:12 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 7/8] dt-bindings: usb: convert mediatek,
 mtu3.txt to YAML schema
Date: Tue, 13 Oct 2020 16:52:06 +0800
Message-ID: <20201013085207.17749-7-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201013085207.17749-1-chunfeng.yun@mediatek.com>
References: <20201013085207.17749-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Wed, 14 Oct 2020 07:03:59 +0000
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Min Guo <min.guo@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 linux-mediatek@lists.infradead.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert mediatek,mtu3.txt to YAML schema mediatek,mtu3.yaml

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: new patch
---
 .../devicetree/bindings/usb/mediatek,mtu3.txt | 108 ---------
 .../bindings/usb/mediatek,mtu3.yaml           | 227 ++++++++++++++++++
 2 files changed, 227 insertions(+), 108 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/mediatek,mtu3.txt
 create mode 100644 Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt b/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt
deleted file mode 100644
index a82ca438aec1..000000000000
--- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt
+++ /dev/null
@@ -1,108 +0,0 @@
-The device node for Mediatek USB3.0 DRD controller
-
-Required properties:
- - compatible : should be "mediatek,<soc-model>-mtu3", "mediatek,mtu3",
-	soc-model is the name of SoC, such as mt8173, mt2712 etc,
-	when using "mediatek,mtu3" compatible string, you need SoC specific
-	ones in addition, one of:
-	- "mediatek,mt8173-mtu3"
- - reg : specifies physical base address and size of the registers
- - reg-names: should be "mac" for device IP and "ippc" for IP port control
- - interrupts : interrupt used by the device IP
- - power-domains : a phandle to USB power domain node to control USB's
-	mtcmos
- - vusb33-supply : regulator of USB avdd3.3v
- - clocks : a list of phandle + clock-specifier pairs, one for each
-	entry in clock-names
- - clock-names : must contain "sys_ck" for clock of controller,
-	the following clocks are optional:
-	"ref_ck", "mcu_ck" and "dma_ck";
- - phys : see usb-hcd.yaml in the current directory
- - dr_mode : should be one of "host", "peripheral" or "otg",
-	refer to usb/generic.txt
-
-Optional properties:
- - #address-cells, #size-cells : should be '2' if the device has sub-nodes
-	with 'reg' property
- - ranges : allows valid 1:1 translation between child's address space and
-	parent's address space
- - extcon : external connector for vbus and idpin changes detection, needed
-	when supports dual-role mode.
-	it's considered valid for compatibility reasons, not allowed for
-	new bindings, and use "usb-role-switch" property instead.
- - vbus-supply : reference to the VBUS regulator, needed when supports
-	dual-role mode.
-	it's considered valid for compatibility reasons, not allowed for
-	new bindings, and put into a usb-connector node.
-	see connector/usb-connector.yaml.
- - pinctrl-names : a pinctrl state named "default" is optional, and need be
-	defined if auto drd switch is enabled, that means the property dr_mode
-	is set as "otg", and meanwhile the property "mediatek,enable-manual-drd"
-	is not set.
- - pinctrl-0 : pin control group
-	See: Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
-
- - maximum-speed : valid arguments are "super-speed", "high-speed" and
-	"full-speed"; refer to usb/generic.txt
- - usb-role-switch : use USB Role Switch to support dual-role switch, but
-	not extcon; see usb/generic.txt.
- - enable-manual-drd : supports manual dual-role switch via debugfs; usually
-	used when receptacle is TYPE-A and also wants to support dual-role
-	mode.
- - wakeup-source: enable USB remote wakeup of host mode.
- - mediatek,syscon-wakeup : phandle to syscon used to access the register
-	of the USB wakeup glue layer between SSUSB and SPM; it depends on
-	"wakeup-source", and has two arguments:
-	- the first one : register base address of the glue layer in syscon;
-	- the second one : hardware version of the glue layer
-		- 1 : used by mt8173 etc
-		- 2 : used by mt2712 etc
- - mediatek,u3p-dis-msk : mask to disable u3ports, bit0 for u3port0,
-	bit1 for u3port1, ... etc;
-
-additionally the properties from usb-hcd.yaml (in the current directory) are
-supported.
-
-Sub-nodes:
-The xhci should be added as subnode to mtu3 as shown in the following example
-if host mode is enabled. The DT binding details of xhci can be found in:
-Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt
-
-The port would be added as subnode if use "usb-role-switch" property.
-	see graph.txt
-
-Example:
-ssusb: usb@11271000 {
-	compatible = "mediatek,mt8173-mtu3";
-	reg = <0 0x11271000 0 0x3000>,
-	      <0 0x11280700 0 0x0100>;
-	reg-names = "mac", "ippc";
-	interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_LOW>;
-	phys = <&phy_port0 PHY_TYPE_USB3>,
-	       <&phy_port1 PHY_TYPE_USB2>;
-	power-domains = <&scpsys MT8173_POWER_DOMAIN_USB>;
-	clocks = <&topckgen CLK_TOP_USB30_SEL>, <&clk26m>,
-		 <&pericfg CLK_PERI_USB0>,
-		 <&pericfg CLK_PERI_USB1>;
-	clock-names = "sys_ck", "ref_ck";
-	vusb33-supply = <&mt6397_vusb_reg>;
-	vbus-supply = <&usb_p0_vbus>;
-	extcon = <&extcon_usb>;
-	dr_mode = "otg";
-	wakeup-source;
-	mediatek,syscon-wakeup = <&pericfg 0x400 1>;
-	#address-cells = <2>;
-	#size-cells = <2>;
-	ranges;
-
-	usb_host: xhci@11270000 {
-		compatible = "mediatek,mt8173-xhci";
-		reg = <0 0x11270000 0 0x1000>;
-		reg-names = "mac";
-		interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_LOW>;
-		power-domains = <&scpsys MT8173_POWER_DOMAIN_USB>;
-		clocks = <&topckgen CLK_TOP_USB30_SEL>, <&clk26m>;
-		clock-names = "sys_ck", "ref_ck";
-		vusb33-supply = <&mt6397_vusb_reg>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
new file mode 100644
index 000000000000..57ef2ced9f31
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
@@ -0,0 +1,227 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2020 MediaTek
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/mediatek,mtu3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek USB3 DRD Controller Device Tree Bindings
+
+maintainers:
+  - Chunfeng Yun <chunfeng.yun@mediatek.com>
+
+description: |
+  The DRD controller has a glue layer IPPC (IP Port Control), and its host is
+  based on xHCI.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt2712-mtu3
+          - mediatek,mt8173-mtu3
+          - mediatek,mt8183-mtu3
+      - const: mediatek,mtu3
+
+  reg:
+    items:
+      - description: the registers of device MAC
+      - description: the registers of IP Port Control
+
+  reg-names:
+    items:
+      - const: mac
+      - const: ippc
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    description: A phandle to USB power domain node to control USB's MTCMOS
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 4
+    items:
+      - description: Controller clock used by normal mode
+      - description: Reference clock used by low power mode etc
+      - description: Mcu bus clock for register access
+      - description: DMA bus clock for data transfer
+
+  clock-names:
+    minItems: 1
+    maxItems: 4
+    items:
+      - const: sys_ck  #required, the following ones are optional
+      - const: ref_ck
+      - const: mcu_ck
+      - const: dma_ck
+
+  phys:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: List of all the USB PHYs used
+
+  vusb33-supply:
+    description: Regulator of USB AVDD3.3v
+
+  vbus-supply:
+    $ref: /connector/usb-connector.yaml#
+    deprecated: true
+    description: |
+      Regulator of USB VBUS5v, needed when supports dual-role mode.
+      Particularly, if use an output GPIO to control a VBUS regulator, should
+      model it as a regulator. See bindings/regulator/fixed-regulator.yaml
+      It's considered valid for compatibility reasons, not allowed for
+      new bindings, and put into a usb-connector node.
+
+  dr_mode:
+    description: See usb/generic.txt
+    enum: [host, peripheral, otg]
+    default: otg
+
+  maximum-speed:
+    description: See usb/generic.txt
+    enum: [super-speed-plus, super-speed, high-speed, full-speed]
+
+  "#address-cells":
+    enum: [1, 2]
+
+  "#size-cells":
+    enum: [1, 2]
+
+  ranges: true
+
+  pinctrl-0:
+    description: A phandle to the default pinctrl state
+
+  pinctrl-names:
+    description: Usually it's needed when use IDDIG/VBUS pin.
+      See pinctrl/pinctrl-bindings.txt
+    const: default
+
+  extcon:
+    deprecated: true
+    description: |
+      Phandle to the extcon device detecting the IDDIG/VBUS state, neede
+      when supports dual-role mode.
+      It's considered valid for compatibility reasons, not allowed for
+      new bindings, and use "usb-role-switch" property instead.
+
+  usb-role-switch:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: Support role switch. See usb/generic.txt
+    type: boolean
+
+  connector:
+    $ref: /connector/usb-connector.yaml#
+    description:
+      Connector for dual role switch, especially for "gpio-usb-b-connector"
+    type: object
+
+  port:
+    description: |
+      Any connector to the data bus of this controller should be modelled
+      using the OF graph bindings specified, if the "usb-role-switch"
+      property is used. See graph.txt
+    type: object
+
+  enable-manual-drd:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      supports manual dual-role switch via debugfs; usually used when
+      receptacle is TYPE-A and also wants to support dual-role mode.
+    type: boolean
+
+  wakeup-source:
+    description: enable USB remote wakeup, see power/wakeup-source.txt
+    type: boolean
+
+  mediatek,syscon-wakeup:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    maxItems: 1
+    description: |
+      A phandle to syscon used to access the register of the USB wakeup glue
+      layer between xHCI and SPM, the field should always be a multiple of
+      3 cells long.
+
+      items:
+        - description:
+            The first cell represents a phandle to syscon
+        - description:
+            The second cell represents the register base address of the glue
+            layer in syscon
+        - description:
+            The third cell represents the hardware version of the glue layer,
+            1 is used by mt8173 etc, 2 is used by mt2712 etc
+          enum: [1, 2]
+
+  mediatek,u3p-dis-msk:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: The mask to disable u3ports, bit0 for u3port0,
+      bit1 for u3port1, ... etc
+
+# Required child node when support dual-role
+patternProperties:
+  "^usb@[0-9a-f]+$":
+    type: object
+    $ref: /usb/mediatek,mtk-xhci.yaml#
+    description: |
+      The xhci should be added as subnode to mtu3 as shown in the following
+      example if the host mode is enabled.
+
+dependencies:
+  connector: [ 'usb-role-switch' ]
+  port: [ 'usb-role-switch' ]
+  wakeup-source: [ 'mediatek,syscon-wakeup' ]
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - clocks
+  - clock-names
+  - phys
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/phy/phy.h>
+    #include <dt-bindings/power/mt8173-power.h>
+
+    ssusb: usb@11271000 {
+        compatible = "mediatek,mt8173-mtu3", "mediatek,mtu3";
+        reg = <0x11271000 0x3000>, <0x11280700 0x0100>;
+        reg-names = "mac", "ippc";
+        interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_LOW>;
+        phys = <&phy_port0 PHY_TYPE_USB3>, <&phy_port1 PHY_TYPE_USB2>;
+        power-domains = <&scpsys MT8173_POWER_DOMAIN_USB>;
+        clocks = <&topckgen CLK_TOP_USB30_SEL>;
+        clock-names = "sys_ck";
+        vusb33-supply = <&mt6397_vusb_reg>;
+        vbus-supply = <&usb_p0_vbus>;
+        extcon = <&extcon_usb>;
+        dr_mode = "otg";
+        wakeup-source;
+        mediatek,syscon-wakeup = <&pericfg 0x400 1>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        xhci: usb@11270000 {
+            compatible = "mediatek,mt8173-xhci", "mediatek,mtk-xhci";
+            reg = <0x11270000 0x1000>;
+            reg-names = "mac";
+            interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_LOW>;
+            power-domains = <&scpsys MT8173_POWER_DOMAIN_USB>;
+            clocks = <&topckgen CLK_TOP_USB30_SEL>, <&clk26m>;
+            clock-names = "sys_ck", "ref_ck";
+            vusb33-supply = <&mt6397_vusb_reg>;
+        };
+    };
+...
-- 
2.18.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
