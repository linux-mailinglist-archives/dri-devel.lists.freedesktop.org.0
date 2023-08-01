Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA3476B06E
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 12:10:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55EA710E102;
	Tue,  1 Aug 2023 10:10:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com
 [61.152.239.71])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1680710E033
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 10:10:37 +0000 (UTC)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
 by fd01.gateway.ufhost.com (Postfix) with ESMTP id BDD158086;
 Tue,  1 Aug 2023 18:10:33 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 1 Aug
 2023 18:10:33 +0800
Received: from xiaofei.localdomain (180.164.60.184) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 1 Aug
 2023 18:10:33 +0800
From: Keith Zhao <keith.zhao@starfivetech.com>
To: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>
Subject: [PATCH v1 v1 2/7] dt-bindings: display: Add yamls for JH7110 display
 system
Date: Tue, 1 Aug 2023 18:10:25 +0800
Message-ID: <20230801101030.2040-3-keith.zhao@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230801101030.2040-1-keith.zhao@starfivetech.com>
References: <20230801101030.2040-1-keith.zhao@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Shengyang Chen <shengyang.chen@starfivetech.com>,
 Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 Jagan Teki <jagan@edgeble.ai>, Rob
 Herring <robh+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Keith Zhao <keith.zhao@starfivetech.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Jack Zhu <jack.zhu@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Shawn Guo <shawnguo@kernel.org>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

StarFive SoCs JH7110 display system:
lcd-controller bases verisilicon dc8200 IP,
and hdmi bases Innosilicon IP.
Add bindings for them.

Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
---
 .../starfive/starfive,display-subsystem.yaml  |  41 +++++++
 .../starfive/starfive,jh7110-dc8200.yaml      | 107 ++++++++++++++++++
 .../starfive/starfive,jh7110-inno-hdmi.yaml   |  92 +++++++++++++++
 3 files changed, 240 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/starfive/st=
arfive,display-subsystem.yaml
 create mode 100644 Documentation/devicetree/bindings/display/starfive/st=
arfive,jh7110-dc8200.yaml
 create mode 100644 Documentation/devicetree/bindings/display/starfive/st=
arfive,jh7110-inno-hdmi.yaml

diff --git a/Documentation/devicetree/bindings/display/starfive/starfive,=
display-subsystem.yaml b/Documentation/devicetree/bindings/display/starfi=
ve/starfive,display-subsystem.yaml
new file mode 100644
index 000000000..86018a8e6
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/starfive/starfive,display=
-subsystem.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/starfive/starfive,display-sub=
system.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Starfive DRM master device
+
+maintainers:
+  - Keith Zhao <keith.zhao@starfivetech.com>
+  - ShengYang Chen <shengyang.chen@starfivetech.com>
+
+description:
+  The Starfive DRM master device is a virtual device needed to list all
+  display controller or other display interface nodes that comprise the
+  graphics subsystem.
+
+properties:
+  compatible:
+    const: starfive,display-subsystem
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description: |
+      Should contain a list of phandles pointing to display interface po=
rts
+      of display controller devices. Display controller definitions as d=
efined
+      in Documentation/devicetree/bindings/display/starfive/
+      starfive,jh7110-dc8200.yaml
+
+required:
+  - compatible
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    display-subsystem {
+        compatible =3D "starfive,display-subsystem";
+        ports =3D <&dc_out>;
+    };
diff --git a/Documentation/devicetree/bindings/display/starfive/starfive,=
jh7110-dc8200.yaml b/Documentation/devicetree/bindings/display/starfive/s=
tarfive,jh7110-dc8200.yaml
new file mode 100644
index 000000000..bebe2050c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/starfive/starfive,jh7110-=
dc8200.yaml
@@ -0,0 +1,107 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/starfive/starfive,jh7110-dc82=
00.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive display controller
+
+description:
+  The StarFive SoC uses the display controller based on Verisilicon IP
+  to transfer the image data from a video memory
+  buffer to an external LCD interface.
+
+maintainers:
+  - Keith Zhao <keith.zhao@starfivetech.com>
+
+properties:
+  compatible:
+    const: starfive,jh7110-dc8200
+
+  reg:
+    maxItems: 3
+
+  interrupts:
+    items:
+      - description: The interrupt will be generated when DC finish one =
frame
+
+  clocks:
+    items:
+      - description: Clock for display system noc bus.
+      - description: Pixel clock for display channel 0.
+      - description: Pixel clock for display channel 1.
+      - description: Clock for axi interface of display controller.
+      - description: Core clock for display controller.
+      - description: Clock for ahb interface of display controller.
+      - description: External HDMI pixel clock.
+      - description: Parent clock for pixel clock
+
+  clock-names:
+    items:
+      - const: vout_noc_disp
+      - const: vout_pix0
+      - const: vout_pix1
+      - const: vout_axi
+      - const: vout_core
+      - const: vout_vout_ahb
+      - const: hdmitx0_pixel
+      - const: vout_dc8200
+
+  resets:
+    items:
+      - description: Reset for axi interface of display controller.
+      - description: Reset for ahb interface of display controller.
+      - description: Core reset of display controller.
+
+  reset-names:
+    items:
+      - const: vout_axi
+      - const: vout_ahb
+      - const: vout_core
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      A port node with endpoint definitions as defined in
+      Documentation/devicetree/bindings/media/video-interfaces.txt.
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
+    dc8200: lcd-controller@29400000 {
+        compatible =3D "starfive,jh7110-dc8200";
+        reg =3D <0x29400000 0x100>, <0x29400800 0x2000>, <0x295b0000 0x9=
0>;
+        interrupts =3D <95>;
+        clocks =3D <&syscrg 60>,
+               <&voutcrg 7>,
+               <&voutcrg 8>,
+               <&voutcrg 4>,
+               <&voutcrg 5>,
+               <&voutcrg 6>,
+               <&hdmitx0_pixelclk>,
+               <&voutcrg 1>;
+        clock-names =3D "vout_noc_disp", "vout_pix0", "vout_pix1",
+                      "vout_axi", "vout_core", "vout_vout_ahb",
+                      "hdmitx0_pixel","vout_dc8200";
+        resets =3D <&voutcrg 0>, <&voutcrg 1>, <&voutcrg 2>;
+        reset-names =3D "vout_axi", "vout_ahb", "vout_core";
+        dc_out: port {
+            #address-cells =3D <1>;
+            #size-cells =3D <0>;
+            dc_out_hdmi: endpoint@0 {
+                reg =3D <0>;
+                remote-endpoint =3D <&hdmi_in_dc>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/display/starfive/starfive,=
jh7110-inno-hdmi.yaml b/Documentation/devicetree/bindings/display/starfiv=
e/starfive,jh7110-inno-hdmi.yaml
new file mode 100644
index 000000000..f6927acf6
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/starfive/starfive,jh7110-=
inno-hdmi.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/starfive/starfive,jh7110-inno=
-hdmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Starfive JH7110 HDMI controller
+
+description:
+  The StarFive JH7110 SoC uses the HDMI signal transmiter based on innos=
ilicon IP
+  to generate HDMI signal from its input and transmit the signal to the =
screen.
+
+maintainers:
+  - Keith Zhao <keith.zhao@starfivetech.com>
+
+properties:
+  compatible:
+    const: "starfive,jh7110-inno-hdmi"
+
+  reg:
+    minItems: 1
+
+  interrupts:
+    items:
+      - description: The HDMI hot plug detection interrupt.
+
+  clocks:
+    items:
+      - description: System clock of HDMI module.
+      - description: Mclk clock of HDMI audio.
+      - description: Bclk clock of HDMI audio.
+      - description: Pixel clock generated by HDMI module.
+
+  clock-names:
+    items:
+      - const: sysclk
+      - const: mclk
+      - const: bclk
+      - const: pclk
+
+  resets:
+    items:
+      - description: Reset for HDMI module.
+
+  reset-names:
+    items:
+      - const: hdmi_tx
+
+  '#sound-dai-cells':
+    const: 0
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      Should contain a remote endpoint phandle of display controller dev=
ice.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - '#sound-dai-cells'
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    hdmi: hdmi@29590000 {
+        compatible =3D "starfive,jh7110-inno-hdmi";
+        reg =3D <0x29590000 0x4000>;
+        interrupts =3D <99>;
+        clocks =3D <&voutcrg 17>,
+               <&voutcrg 15>,
+               <&voutcrg 16>,
+               <&hdmitx0_pixelclk>;
+        clock-names =3D "sysclk", "mclk","bclk","pclk";
+        resets =3D <&voutcrg 9>;
+        reset-names =3D "hdmi_tx";
+        #sound-dai-cells =3D <0>;
+        hdmi_in: port {
+            #address-cells =3D <1>;
+            #size-cells =3D <0>;
+            hdmi_in_dc: endpoint@0 {
+                reg =3D <0>;
+                remote-endpoint =3D <&dc_out_hdmi>;
+            };
+        };
+    };
--=20
2.34.1

