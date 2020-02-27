Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9061117241C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 17:57:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB3836E955;
	Thu, 27 Feb 2020 16:57:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F1B16E954
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 16:57:14 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id E83BF804D5;
 Thu, 27 Feb 2020 17:57:07 +0100 (CET)
Date: Thu, 27 Feb 2020 17:57:06 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [RFC 0/8] MIPS: CI20: add HDMI out support
Message-ID: <20200227165706.GA20296@ravnborg.org>
References: <cover.1582744379.git.hns@goldelico.com>
 <20200227122325.GA7587@ravnborg.org>
 <8EE60F87-415A-44EA-AA49-632E232095FF@goldelico.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8EE60F87-415A-44EA-AA49-632E232095FF@goldelico.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=r_1tXGB3AAAA:8 a=ztCEdXhiAAAA:8 a=VwQbUJbxAAAA:8 a=gEfo2CItAAAA:8
 a=d1djM_hZJe2JQW3CVLEA:9 a=dIJnsna9mnJheyWd:21 a=5nUNmSr-nzSVR-qf:21
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=t8nPyN_e6usw4ciXM-Pk:22
 a=nCm3ceeH17rKjHWsMeRo:22 a=AjGcO6oz07-iQ99wixmX:22
 a=sptkURWiP4Gy88Gu7hUp:22
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Paul Boddie <paul@boddie.org.uk>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Paul Burton <paulburton@kernel.org>, linux-gpio@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Andi Kleen <ak@linux.intel.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, kernel@pyra-handheld.com,
 letux-kernel@openphoenux.org, "Eric W. Biederman" <ebiederm@xmission.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nikolaus.

> >> Zubair Lutfullah Kakakhel (2):
> >>  dt-bindings: video: Add jz4780-lcd binding
> >>  dt-bindings: video: Add jz4780-hdmi binding
> >> 
> >> .../bindings/display/ingenic-jz4780-hdmi.txt  |  41 ++++++
> >> .../bindings/display/ingenic-jz4780-lcd.txt   |  39 ++++++
> > New bindings in DT Schema format please...
> > We want to have then in a formal launguage so we can use these
> > to verify the DT files.
> 
> Yes, I know. And I fully support the goal.
> 
> But I personally do not have the time to learn the (IMHO brain-twisting)
> way the Schema format is working. Especially, I am not interested
> in becoming volunteer translator for .txt based schemas developed
> by someone else.
> 
> So I hope that someone from the community can and is willing to do
> that.

I went ahead and typed them - please review and use these if OK.

	Sam

From 6fee276807dfe4a502ff760e7c7840480d275052 Mon Sep 17 00:00:00 2001
From: Sam Ravnborg <sam@ravnborg.org>
Date: Thu, 27 Feb 2020 17:18:29 +0100
Subject: [PATCH 1/2] dt-bindings: display: add ingenic-jz4780-lcd DT Schema

Add DT bindings for the LCD controller on the jz4780 SoC
Based on .txt binding from Zubair Lutfullah Kakakhel

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Cc: H. Nikolaus Schaller <hns@goldelico.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
---
 .../bindings/display/ingenic-jz4780-lcd.yaml  | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.yaml

diff --git a/Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.yaml b/Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.yaml
new file mode 100644
index 000000000000..c71415a3a342
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/ingenic-jz4780-lcd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bindings for Ingenic JZ4780 LCD Controller
+
+maintainers:
+  - Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
+  - H. Nikolaus Schaller <hns@goldelico.com>
+
+description: |
+  LCD Controller is the Display Controller for the Ingenic JZ4780 SoC
+
+properties:
+  compatible:
+    items:
+      - const: ingenic,jz4780-lcd
+
+  reg:
+    maxItems: 1
+    description: the address & size of the LCD controller registers
+
+  interrupts:
+    maxItems: 1
+    description: Specifies the interrupt provided by parent
+
+  clocks:
+    maxItems: 2
+    description: Clock specifiers for the JZ4780_CLK_TVE JZ4780_CLK_LCD0PIXCLK
+
+  clock-names:
+    items:
+      - const: lcd_clk
+      - const: lcd_pixclk
+
+  port:
+    type: object
+    description: |
+      A port node with endpoint definitions as defined in
+      Documentation/devicetree/bindings/media/video-interfaces.txt
+
+required:
+    - compatible
+    - reg
+    - interrupts
+    - clocks
+    - clock-names
+    - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/jz4780-cgu.h>
+    lcd: jz4780-lcdk@0x13050000 {
+        compatible = "ingenic,jz4780-lcd";
+        reg = <0x13050000 0x1800>;
+
+        clocks = <&cgu JZ4780_CLK_TVE>, <&cgu JZ4780_CLK_LCD0PIXCLK>;
+        clock-names = "lcd_clk", "lcd_pixclk";
+
+        interrupt-parent = <&intc>;
+        interrupts = <31>;
+
+        jz4780_lcd_out: port {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            jz4780_out_hdmi: endpoint@0 {
+                reg = <0>;
+                remote-endpoint = <&hdmi_in_lcd>;
+            };
+        };
+    };
+
+...
-- 
2.20.1

From f4d01a657e07d468eb0bc811ed8edae0b58d66d7 Mon Sep 17 00:00:00 2001
From: Sam Ravnborg <sam@ravnborg.org>
Date: Thu, 27 Feb 2020 17:52:34 +0100
Subject: [PATCH 2/2] dt-bindings: display: add ingenic-jz4780-ihdmi DT Schema

Add DT bindings for the hdmi driver for the Ingenic JZ4780 SoC.
Based on .txt binding from Zubair Lutfullah Kakakhel

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Cc: H. Nikolaus Schaller <hns@goldelico.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
---
 .../bindings/display/ingenic-jz4780-hdmi.yaml | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml

diff --git a/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml b/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml
new file mode 100644
index 000000000000..9b71c427bd69
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/ingenic-jz4780-hdmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bindings for Ingenic JZ4780 HDMI Transmitter
+
+maintainers:
+  - Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
+  - H. Nikolaus Schaller <hns@goldelico.com>
+
+description: |
+  The HDMI Transmitter in the Ingenic JZ4780 is a Synopsys DesignWare HDMI 1.4
+  TX controller IP with accompanying PHY IP.
+
+allOf:
+  - $ref: panel/panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: ingenic,jz4780-hdmi
+
+  reg:
+    maxItems: 1
+    description: the address & size of the LCD controller registers
+
+  reg-io-width:
+    const: 4
+
+  interrupts:
+    maxItems: 1
+    description: Specifies the interrupt provided by parent
+
+  clocks:
+    maxItems: 2
+    description: Clock specifiers for isrf and iahb clocks
+
+  clock-names:
+    items:
+      - const: isfr
+      - const: iahb
+
+  ddc-i2c-bus: true
+  ports: true
+
+required:
+    - compatible
+    - clocks
+    - clock-names
+    - ports
+    - reg-io-width
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/jz4780-cgu.h>
+
+    hdmi: hdmi@10180000 {
+        compatible = "ingenic,jz4780-hdmi";
+        reg = <0x10180000 0x8000>;
+        reg-io-width = <4>;
+        ddc-i2c-bus = <&i2c4>;
+        interrupt-parent = <&intc>;
+        interrupts = <3>;
+        clocks = <&cgu JZ4780_CLK_HDMI>, <&cgu JZ4780_CLK_AHB0>;
+        clock-names = "isfr", "iahb";
+
+        ports {
+            hdmi_in: port {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                hdmi_in_lcd: endpoint@0 {
+                    reg = <0>;
+                    remote-endpoint = <&jz4780_out_hdmi>;
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
