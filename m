Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 430BA192812
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 13:19:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C32E86E847;
	Wed, 25 Mar 2020 12:19:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5057F6E7D9
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 10:38:37 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id a81so1945964wmf.5
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 03:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=EzOA88IPnqtfpe/48GPuflQNR0kYjwA+VSvKhhJrxps=;
 b=RsGdMY8IvlSnAyG0MzIkhchfOXRHnz2dyXPRTkAmdwR5Sa9twAHcAGWe9qyGKH7sFo
 mxxkmrp3kY9sgPF9DXmJNhevLM4IHDd3xR7Drk0z6tK17xIIwmWpONvnx6msWUP/YJkH
 wiRxrnH/pQG8F4aUsOiA/SlkA72KVr9g/YULwRFtQQVECRj71W8OVYA1WHURheRC1svq
 +9YHK6ESY5j8KbqcOZ9fHdSwZ/1han8PUzEYbVwGNk8MATWwv+wrjd17c5jM56zOSw9h
 PMu/51uwxJ425YHNf9Iy5g7FwAuIVBDpXRz7uE5ZMg2comkxccRQzi3cQ92sZffi8rpP
 Jfrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=EzOA88IPnqtfpe/48GPuflQNR0kYjwA+VSvKhhJrxps=;
 b=TEtV7eMBNcnquQlUstlmUxNuA1CKHW8pZXKa88ZQjipp7mJRe2M92mE4po548+Dl1R
 EypW2muukBIAeNyJtTmmnMU+91iK6+YuYa3cKgOl4q/cZ/BKKeD/UODo0FVJuTppTq2O
 0dTteHV42ZXab6cU900Nv9gGN7gTYth1DfUCFk+i68RHJYXo1uVVfqkgfxVOcPcNTJ3A
 ZmldKI+76V0oiCCSKc1HyrEwl2eVB+Uqh/JfNCV2ydIPYFQOkGE4g9VT0osBlFRBknHA
 Le+g56vEzN3L5jcC57Ovi05tKbHwVrH21T2VfcCa6YRmK9S8+n+wKzXHAoS7Z8AQ082k
 ySqQ==
X-Gm-Message-State: ANhLgQ2ti8RToWIhmgIuhfupscF8hYxlM+LnFp1coI9LYHynwyaj6BIy
 TULZd3UNflK6HWwnfrzavXQ=
X-Google-Smtp-Source: ADFU+vuLT8aCFByvpsLDF8ub9Jibc1JcFf94p8oOJbCJ7SMUFWAVz+SXA2LWU40cK+9fXNGYdVX9NQ==
X-Received: by 2002:a1c:2e04:: with SMTP id u4mr2936248wmu.185.1585132715841; 
 Wed, 25 Mar 2020 03:38:35 -0700 (PDT)
Received: from debian.home (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id i21sm9163108wmb.23.2020.03.25.03.38.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 25 Mar 2020 03:38:35 -0700 (PDT)
From: Johan Jonker <jbx6244@gmail.com>
To: heiko@sntech.de
Subject: [PATCH v4 1/2] dt-bindings: display: convert rockchip vop bindings to
 yaml
Date: Wed, 25 Mar 2020 11:38:27 +0100
Message-Id: <20200325103828.5422-1-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
X-Mailman-Approved-At: Wed, 25 Mar 2020 12:19:30 +0000
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Current dts files with 'vop' nodes are manually verified.
In order to automate this process rockchip-vop.txt
has to be converted to yaml.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
Changes v4:
  Change description
  Replace compatible oneOf by enum
  Change interrupts description
  Remove resets minItems

Changes v3:
  Change description

Changes v2:
  No new properties
---
 .../bindings/display/rockchip/rockchip-vop.txt     |  74 ------------
 .../bindings/display/rockchip/rockchip-vop.yaml    | 124 +++++++++++++++++++++
 2 files changed, 124 insertions(+), 74 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip-vop.txt
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.txt b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.txt
deleted file mode 100644
index 8b3a5f514..000000000
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.txt
+++ /dev/null
@@ -1,74 +0,0 @@
-device-tree bindings for rockchip soc display controller (vop)
-
-VOP (Visual Output Processor) is the Display Controller for the Rockchip
-series of SoCs which transfers the image data from a video memory
-buffer to an external LCD interface.
-
-Required properties:
-- compatible: value should be one of the following
-		"rockchip,rk3036-vop";
-		"rockchip,rk3126-vop";
-		"rockchip,px30-vop-lit";
-		"rockchip,px30-vop-big";
-		"rockchip,rk3066-vop";
-		"rockchip,rk3188-vop";
-		"rockchip,rk3288-vop";
-		"rockchip,rk3368-vop";
-		"rockchip,rk3366-vop";
-		"rockchip,rk3399-vop-big";
-		"rockchip,rk3399-vop-lit";
-		"rockchip,rk3228-vop";
-		"rockchip,rk3328-vop";
-
-- reg: Must contain one entry corresponding to the base address and length
-	of the register space. Can optionally contain a second entry
-	corresponding to the CRTC gamma LUT address.
-
-- interrupts: should contain a list of all VOP IP block interrupts in the
-		 order: VSYNC, LCD_SYSTEM. The interrupt specifier
-		 format depends on the interrupt controller used.
-
-- clocks: must include clock specifiers corresponding to entries in the
-		clock-names property.
-
-- clock-names: Must contain
-		aclk_vop: for ddr buffer transfer.
-		hclk_vop: for ahb bus to R/W the phy regs.
-		dclk_vop: pixel clock.
-
-- resets: Must contain an entry for each entry in reset-names.
-  See ../reset/reset.txt for details.
-- reset-names: Must include the following entries:
-  - axi
-  - ahb
-  - dclk
-
-- iommus: required a iommu node
-
-- port: A port node with endpoint definitions as defined in
-  Documentation/devicetree/bindings/media/video-interfaces.txt.
-
-Example:
-SoC specific DT entry:
-	vopb: vopb@ff930000 {
-		compatible = "rockchip,rk3288-vop";
-		reg = <0x0 0xff930000 0x0 0x19c>, <0x0 0xff931000 0x0 0x1000>;
-		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cru ACLK_VOP0>, <&cru DCLK_VOP0>, <&cru HCLK_VOP0>;
-		clock-names = "aclk_vop", "dclk_vop", "hclk_vop";
-		resets = <&cru SRST_LCDC1_AXI>, <&cru SRST_LCDC1_AHB>, <&cru SRST_LCDC1_DCLK>;
-		reset-names = "axi", "ahb", "dclk";
-		iommus = <&vopb_mmu>;
-		vopb_out: port {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			vopb_out_edp: endpoint@0 {
-				reg = <0>;
-				remote-endpoint=<&edp_in_vopb>;
-			};
-			vopb_out_hdmi: endpoint@1 {
-				reg = <1>;
-				remote-endpoint=<&hdmi_in_vopb>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml
new file mode 100644
index 000000000..bc58c5132
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml
@@ -0,0 +1,124 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/rockchip/rockchip-vop.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip SoC display controller (VOP)
+
+description:
+  VOP (Video Output Processor) is the display controller for the Rockchip
+  series of SoCs which transfers the image data from a video memory
+  buffer to an external LCD interface.
+
+maintainers:
+  - Sandy Huang <hjc@rock-chips.com>
+  - Heiko Stuebner <heiko@sntech.de>
+
+properties:
+  compatible:
+    enum:
+      - rockchip,px30-vop-big
+      - rockchip,px30-vop-lit
+      - rockchip,rk3036-vop
+      - rockchip,rk3066-vop
+      - rockchip,rk3126-vop
+      - rockchip,rk3188-vop
+      - rockchip,rk3228-vop
+      - rockchip,rk3288-vop
+      - rockchip,rk3328-vop
+      - rockchip,rk3366-vop
+      - rockchip,rk3368-vop
+      - rockchip,rk3399-vop-big
+      - rockchip,rk3399-vop-lit
+
+  reg:
+    minItems: 1
+    items:
+      - description:
+          Must contain one entry corresponding to the base address and length
+          of the register space.
+      - description:
+          Can optionally contain a second entry corresponding to
+          the CRTC gamma LUT address.
+
+  interrupts:
+    maxItems: 1
+    description:
+      The VOP interrupt is shared by several interrupt sources, such as
+      frame start (VSYNC), line flag and other status interrupts.
+
+  clocks:
+    items:
+      - description: Clock for ddr buffer transfer.
+      - description: Pixel clock.
+      - description: Clock for the ahb bus to R/W the phy regs.
+
+  clock-names:
+    items:
+      - const: aclk_vop
+      - const: dclk_vop
+      - const: hclk_vop
+
+  resets:
+    maxItems: 3
+
+  reset-names:
+    items:
+      - const: axi
+      - const: ahb
+      - const: dclk
+
+  port:
+    type: object
+    description:
+      A port node with endpoint definitions as defined in
+      Documentation/devicetree/bindings/media/video-interfaces.txt.
+
+  iommus:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rk3288-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    vopb: vopb@ff930000 {
+      compatible = "rockchip,rk3288-vop";
+      reg = <0x0 0xff930000 0x0 0x19c>,
+            <0x0 0xff931000 0x0 0x1000>;
+      interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&cru ACLK_VOP0>,
+               <&cru DCLK_VOP0>,
+               <&cru HCLK_VOP0>;
+      clock-names = "aclk_vop", "dclk_vop", "hclk_vop";
+      resets = <&cru SRST_LCDC1_AXI>,
+               <&cru SRST_LCDC1_AHB>,
+               <&cru SRST_LCDC1_DCLK>;
+      reset-names = "axi", "ahb", "dclk";
+      iommus = <&vopb_mmu>;
+      vopb_out: port {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        vopb_out_edp: endpoint@0 {
+          reg = <0>;
+          remote-endpoint=<&edp_in_vopb>;
+        };
+        vopb_out_hdmi: endpoint@1 {
+          reg = <1>;
+          remote-endpoint=<&hdmi_in_vopb>;
+        };
+      };
+    };
-- 
2.11.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
