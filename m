Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E69477455
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 15:20:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC9AA112231;
	Thu, 16 Dec 2021 14:20:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 427D3112223
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 14:20:18 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id j18so1193724wrd.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 06:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YrKN5DbP3tF7B6hFIrfEo5mYENu69A0Fv9aG7HeGCks=;
 b=GowwpdYcxMrR/7UsxvqTpLxYpz+85sgdenzTuNEucaJDx+aCQO/wyui2taD/ATw49J
 JaCiTJZ5gvK0UkVE8YocNSQeEbmDwNJtAp3qtlmESVfM4Lpn252q1oYW8lfMVCGBh7RZ
 gdVL07K7ULTbJVJqPgbBkhTQlVqFY0fDT0VmfEPgj09jFYA1kJZGH1yOh1QCatoDeEUq
 hIf0pgg47iptqqug6yUwX8DLtf9el/LSuBwRd/gF/KayEVivzkhmF4kzlKGRxyAYcfxR
 //M1P/kvHc9wGC8rzc89rttwSOOzoehQ4uZ9CFtLwMcJTLmCS1uwQaZZkJnrGCphk2d7
 FXaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YrKN5DbP3tF7B6hFIrfEo5mYENu69A0Fv9aG7HeGCks=;
 b=Mb7UUCJsJwBAmZxcTah0rPibSw3e6BCI5swiGG1In6e3lNfiP/98YbJKkH38zeJlxo
 q8Na6cCtrv2rSrFWQSgyDfyazoZ+Q9Ie7DC1kp8a3Wh28Rsw4e1RTd6LE1v2zKuWkdyv
 1jYaP1DIoC/YW6eSuGf+XYGg7972ekuKu6Re5tc9dq5Z8Umhc0j1uCvNNpBsSvfIN7Mt
 tfuO+529SXjGaHTeQ20sgry+vZkuj0H7JyA+XDbksU1U/0k4tdQ2EhT2NtOx5O0rBMkZ
 Mw5lz1p66c/P3lnE9WXgVv/EH0ZBWnjKqZQzCYONPqxpqfpH7JqEywm0JqsrBkxgb80L
 bg4Q==
X-Gm-Message-State: AOAM532fmhBcjihg1TaJf2XbMJp7/fisNYa+/3EU2tJpih6+7bnmCzhW
 jf48h+6QUcCEqX7JkH38b2Q=
X-Google-Smtp-Source: ABdhPJw21F6zP0nEivdEmEmCFxADuNqijCQrIZRcrCCn0XLH9ZjQdeC5vKROj2sUmbxJrp09D/KZbA==
X-Received: by 2002:a05:6000:49:: with SMTP id
 k9mr4312422wrx.190.1639664415397; 
 Thu, 16 Dec 2021 06:20:15 -0800 (PST)
Received: from localhost ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id l3sm4730855wmq.46.2021.12.16.06.20.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 06:20:14 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3] dt-bindings: display: tegra: Convert to json-schema
Date: Thu, 16 Dec 2021 15:20:12 +0100
Message-Id: <20211216142012.1479213-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

Convert the Tegra host1x controller bindings from the free-form text
format to json-schema.

This also adds the missing display-hub DT bindings that were not
previously documented.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Sorry Rob for making you look at this again. However, I think it's much
cleaner than earlier versions of this because of the split into separate
YAML files, so hopefully it's not too bad. I've got a couple of DT fixes
in the Tegra tree that will allow this to successfully validate all of
these host1x and child nodes.

Note that some of these can possibly be moved into a different directory
now since they aren't all that display-related, but I'll do that in a
separate patch to keep this simpler to review.

Changes in v3:
- split into separate YAML files for simplicity
- add display-hub DT bindings

Changes in v2:
- use additionalProperties instead of unevaluatedProperties where
  sufficient
- drop redundant $ref and add missing maxItems properties
- drop documentation for standard properties
- remove status properties from example
- drop spurious comments

 .../display/tegra/nvidia,tegra114-mipi.txt    |  41 --
 .../display/tegra/nvidia,tegra114-mipi.yaml   |  74 +++
 .../display/tegra/nvidia,tegra124-dpaux.yaml  | 149 +++++
 .../display/tegra/nvidia,tegra124-sor.yaml    | 209 ++++++
 .../display/tegra/nvidia,tegra124-vic.yaml    |  71 ++
 .../display/tegra/nvidia,tegra186-dc.yaml     |  85 +++
 .../tegra/nvidia,tegra186-display.yaml        | 310 +++++++++
 .../tegra/nvidia,tegra186-dsi-padctl.yaml     |  46 ++
 .../display/tegra/nvidia,tegra20-dc.yaml      | 174 +++++
 .../display/tegra/nvidia,tegra20-dsi.yaml     | 174 +++++
 .../display/tegra/nvidia,tegra20-epp.yaml     |  57 ++
 .../display/tegra/nvidia,tegra20-gr2d.yaml    |  58 ++
 .../display/tegra/nvidia,tegra20-gr3d.yaml    | 109 +++
 .../display/tegra/nvidia,tegra20-hdmi.yaml    | 116 ++++
 .../display/tegra/nvidia,tegra20-host1x.txt   | 622 ------------------
 .../display/tegra/nvidia,tegra20-host1x.yaml  | 334 ++++++++++
 .../display/tegra/nvidia,tegra20-isp.yaml     |  55 ++
 .../display/tegra/nvidia,tegra20-mpe.yaml     |  58 ++
 .../display/tegra/nvidia,tegra20-tvo.yaml     |  51 ++
 .../display/tegra/nvidia,tegra20-vi.yaml      | 151 +++++
 .../display/tegra/nvidia,tegra210-csi.yaml    |  52 ++
 .../pinctrl/nvidia,tegra124-dpaux-padctl.txt  |  59 --
 22 files changed, 2333 insertions(+), 722 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.txt
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-dpaux.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-sor.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-vic.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-dc.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-display.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-dsi-padctl.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-epp.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr2d.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr3d.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-isp.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-mpe.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-tvo.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-dpaux-padctl.txt

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.txt
deleted file mode 100644
index e4a25cedc5cf..000000000000
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.txt
+++ /dev/null
@@ -1,41 +0,0 @@
-NVIDIA Tegra MIPI pad calibration controller
-
-Required properties:
-- compatible: "nvidia,tegra<chip>-mipi"
-- reg: Physical base address and length of the controller's registers.
-- clocks: Must contain an entry for each entry in clock-names.
-  See ../clocks/clock-bindings.txt for details.
-- clock-names: Must include the following entries:
-  - mipi-cal
-- #nvidia,mipi-calibrate-cells: Should be 1. The cell is a bitmask of the pads
-  that need to be calibrated for a given device.
-
-User nodes need to contain an nvidia,mipi-calibrate property that has a
-phandle to refer to the calibration controller node and a bitmask of the pads
-that need to be calibrated.
-
-Example:
-
-	mipi: mipi@700e3000 {
-		compatible = "nvidia,tegra114-mipi";
-		reg = <0x700e3000 0x100>;
-		clocks = <&tegra_car TEGRA114_CLK_MIPI_CAL>;
-		clock-names = "mipi-cal";
-		#nvidia,mipi-calibrate-cells = <1>;
-	};
-
-	...
-
-	host1x@50000000 {
-		...
-
-		dsi@54300000 {
-			...
-
-			nvidia,mipi-calibrate = <&mipi 0x060>;
-
-			...
-		};
-
-		...
-	};
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml
new file mode 100644
index 000000000000..d5ca8cf86e8e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra114-mipi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra MIPI pad calibration controller
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+properties:
+  $nodename:
+    pattern: "^mipi@[0-9a-f]+$"
+
+  compatible:
+    enum:
+      - nvidia,tegra114-mipi
+      - nvidia,tegra210-mipi
+      - nvidia,tegra186-mipi
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: module clock
+
+  clock-names:
+    items:
+      - const: mipi-cal
+
+  power-domains:
+    maxItems: 1
+
+  "#nvidia,mipi-calibrate-cells":
+    description: The number of cells in a MIPI calibration specifier.
+      Should be 1. The single cell specifies a bitmask of the pads that
+      need to be calibrated for a given device.
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    const: 1
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - "#nvidia,mipi-calibrate-cells"
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra114-car.h>
+
+    mipi@700e3000 {
+        compatible = "nvidia,tegra114-mipi";
+        reg = <0x700e3000 0x100>;
+        clocks = <&tegra_car TEGRA114_CLK_MIPI_CAL>;
+        clock-names = "mipi-cal";
+        #nvidia,mipi-calibrate-cells = <1>;
+    };
+
+    dsia: dsi@54300000 {
+        compatible = "nvidia,tegra114-dsi";
+        reg = <0x54300000 0x00040000>;
+        clocks = <&tegra_car TEGRA114_CLK_DSIA>,
+                 <&tegra_car TEGRA114_CLK_DSIALP>,
+                 <&tegra_car TEGRA114_CLK_PLL_D_OUT0>;
+        clock-names = "dsi", "lp", "parent";
+        resets = <&tegra_car 48>;
+        reset-names = "dsi";
+        nvidia,mipi-calibrate = <&mipi 0x060>; /* DSIA & DSIB pads */
+    };
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-dpaux.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-dpaux.yaml
new file mode 100644
index 000000000000..7df2b355b19b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-dpaux.yaml
@@ -0,0 +1,149 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra124-dpaux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra DisplayPort AUX Interface
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+description: |
+  The Tegra Display Port Auxiliary (DPAUX) pad controller manages two
+  pins which can be assigned to either the DPAUX channel or to an I2C
+  controller.
+
+  When configured for DisplayPort AUX operation, the DPAUX controller
+  can also be used to communicate with a DisplayPort device using the
+  AUX channel.
+
+properties:
+  $nodename:
+    pattern: "^dpaux@[0-9a-f]+$"
+
+  compatible:
+    oneOf:
+      - enum:
+          - nvidia,tegra124-dpaux
+          - nvidia,tegra210-dpaux
+          - nvidia,tegra186-dpaux
+          - nvidia,tegra194-dpaux
+
+      - items:
+          - const: nvidia,tegra132-dpaux
+          - const: nvidia,tegra124-dpaux
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: clock input for the DPAUX hardware
+      - description: reference clock
+
+  clock-names:
+    items:
+      - const: dpaux
+      - const: parent
+
+  resets:
+    items:
+      - description: module reset
+
+  reset-names:
+    items:
+      - const: dpaux
+
+  power-domains:
+    maxItems: 1
+
+  i2c-bus:
+    description: Subnode where I2C slave devices are listed. This
+      subnode must be always present. If there are no I2C slave
+      devices, an empty node should be added. See ../../i2c/i2c.yaml
+      for more information.
+    type: object
+
+  vdd-supply:
+    description: phandle of a supply that powers the DisplayPort
+      link
+
+patternProperties:
+  "^pinmux-[a-z0-9]+$":
+    description:
+      Since only three configurations are possible, only three child
+      nodes are needed to describe the pin mux'ing options for the
+      DPAUX pads. Furthermore, given that the pad functions are only
+      applicable to a single set of pads, the child nodes only need
+      to describe the pad group the functions are being applied to
+      rather than the individual pads.
+    type: object
+    properties:
+      groups:
+        const: dpaux-io
+
+      function:
+        enum:
+          - aux
+          - i2c
+          - off
+
+    additionalProperties: false
+
+    required:
+      - groups
+      - function
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra210-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    dpaux: dpaux@545c0000 {
+        compatible = "nvidia,tegra210-dpaux";
+        reg = <0x545c0000 0x00040000>;
+        interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&tegra_car TEGRA210_CLK_DPAUX>,
+                 <&tegra_car TEGRA210_CLK_PLL_DP>;
+        clock-names = "dpaux", "parent";
+        resets = <&tegra_car 181>;
+        reset-names = "dpaux";
+        power-domains = <&pd_sor>;
+        status = "disabled";
+
+        state_dpaux_aux: pinmux-aux {
+            groups = "dpaux-io";
+            function = "aux";
+        };
+
+        state_dpaux_i2c: pinmux-i2c {
+            groups = "dpaux-io";
+            function = "i2c";
+        };
+
+        state_dpaux_off: pinmux-off {
+            groups = "dpaux-io";
+            function = "off";
+        };
+
+        i2c-bus {
+            #address-cells = <1>;
+            #size-cells = <0>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-sor.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-sor.yaml
new file mode 100644
index 000000000000..afc283796653
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-sor.yaml
@@ -0,0 +1,209 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra124-sor.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra SOR Output Encoder
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+description: |
+  The Serial Output Resource (SOR) can be used to drive HDMI, LVDS, eDP
+  and DP outputs.
+
+  See ../pinctrl/nvidia,tegra124-dpaux-padctl.txt for information
+  regarding the DPAUX pad controller bindings.
+
+properties:
+  $nodename:
+    pattern: "^sor@[0-9a-f]+$"
+
+  compatible:
+    oneOf:
+      - enum:
+          - nvidia,tegra124-sor
+          - nvidia,tegra210-sor
+          - nvidia,tegra210-sor1
+          - nvidia,tegra186-sor
+          - nvidia,tegra186-sor1
+          - nvidia,tegra194-sor
+
+      - items:
+          - const: nvidia,tegra132-sor
+          - const: nvidia,tegra124-sor
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 5
+    maxItems: 6
+
+  clock-names:
+    minItems: 5
+    maxItems: 6
+
+  resets:
+    items:
+      - description: module reset
+
+  reset-names:
+    items:
+      - const: sor
+
+  power-domains:
+    maxItems: 1
+
+  avdd-io-hdmi-dp-supply:
+    description: I/O supply for HDMI/DP
+
+  vdd-hdmi-dp-pll-supply:
+    description: PLL supply for HDMI/DP
+
+  hdmi-supply:
+    description: +5.0V HDMI connector supply
+
+  # Tegra186 and later
+  nvidia,interface:
+    description: index of the SOR interface
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+
+  nvidia,ddc-i2c-bus:
+    description: phandle of an I2C controller used for DDC EDID
+      probing
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+
+  nvidia,hpd-gpio:
+    description: specifies a GPIO used for hotplug detection
+    maxItems: 1
+
+  nvidia,edid:
+    description: supplies a binary EDID blob
+    $ref: "/schemas/types.yaml#/definitions/uint8-array"
+
+  nvidia,panel:
+    description: phandle of a display panel
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+
+  nvidia,xbar-cfg:
+    description: 5 cells containing the crossbar configuration.
+      Each lane of the SOR, identified by the cell's index, is
+      mapped via the crossbar to the pad specified by the cell's
+      value.
+    $ref: "/schemas/types.yaml#/definitions/uint32-array"
+
+  # optional when driving an eDP output
+  nvidia,dpaux:
+    description: phandle to a DispayPort AUX interface
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra186-sor
+              - nvidia,tegra194-sor
+    then:
+      properties:
+        clocks:
+          items:
+            - description: clock input for the SOR hardware
+            - description: SOR output clock
+            - description: input for the pixel clock
+            - description: reference clock for the SOR clock
+            - description: safe reference clock for the SOR clock
+                during power up
+            - description: SOR pad output clock
+
+        clock-names:
+          items:
+            - const: sor
+            - enum:
+                - source # deprecated
+                - out
+            - const: parent
+            - const: dp
+            - const: safe
+            - const: pad
+    else:
+      properties:
+        clocks:
+          items:
+            - description: clock input for the SOR hardware
+            - description: SOR output clock
+            - description: input for the pixel clock
+            - description: reference clock for the SOR clock
+            - description: safe reference clock for the SOR clock
+                during power up
+
+        clock-names:
+          items:
+            - const: sor
+            - enum:
+                - source # deprecated
+                - out
+            - const: parent
+            - const: dp
+            - const: safe
+
+  - if:
+      not:
+        properties:
+          contains:
+            const: nvidia,panel
+    then:
+      required:
+        - hdmi-supply
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - avdd-io-hdmi-dp-supply
+  - vdd-hdmi-dp-pll-supply
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra210-car.h>
+    #include <dt-bindings/gpio/tegra-gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    sor0: sor@54540000 {
+        compatible = "nvidia,tegra210-sor";
+        reg = <0x54540000 0x00040000>;
+        interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&tegra_car TEGRA210_CLK_SOR0>,
+                 <&tegra_car TEGRA210_CLK_SOR0_OUT>,
+                 <&tegra_car TEGRA210_CLK_PLL_D_OUT0>,
+                 <&tegra_car TEGRA210_CLK_PLL_DP>,
+                 <&tegra_car TEGRA210_CLK_SOR_SAFE>;
+        clock-names = "sor", "out", "parent", "dp", "safe";
+        resets = <&tegra_car 182>;
+        reset-names = "sor";
+        pinctrl-0 = <&state_dpaux_aux>;
+        pinctrl-1 = <&state_dpaux_i2c>;
+        pinctrl-2 = <&state_dpaux_off>;
+        pinctrl-names = "aux", "i2c", "off";
+        power-domains = <&pd_sor>;
+
+        avdd-io-hdmi-dp-supply = <&avdd_1v05>;
+        vdd-hdmi-dp-pll-supply = <&vdd_1v8>;
+        hdmi-supply = <&vdd_hdmi>;
+
+        nvidia,ddc-i2c-bus = <&hdmi_ddc>;
+        nvidia,hpd-gpio = <&gpio TEGRA_GPIO(CC, 1) GPIO_ACTIVE_LOW>;
+    };
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-vic.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-vic.yaml
new file mode 100644
index 000000000000..37bb5ddc1963
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-vic.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra124-vic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra Video Image Composer
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+properties:
+  $nodename:
+    pattern: "^vic@[0-9a-f]+$"
+
+  compatible:
+    oneOf:
+      - enum:
+          - nvidia,tegra124-vic
+          - nvidia,tegra210-vic
+          - nvidia,tegra186-vic
+          - nvidia,tegra194-vic
+
+      - items:
+          - const: nvidia,tegra132-vic
+          - const: nvidia,tegra124-vic
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: clock input for the VIC hardware
+
+  clock-names:
+    items:
+      - const: vic
+
+  resets:
+    items:
+      - description: module reset
+
+  reset-names:
+    items:
+      - const: vic
+
+  power-domains:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+  interconnects:
+    description: Description of the interconnect paths for the VIC;
+      see ../interconnect/interconnect.txt for details.
+    items:
+      - description: memory read client for VIC
+      - description: memory write client for VIC
+
+  interconnect-names:
+    items:
+      - const: dma-mem # read
+      - const: write
+
+  dma-coherent: true
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-dc.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-dc.yaml
new file mode 100644
index 000000000000..265a60d79d89
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-dc.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra186-dc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra186 (and later) Display Controller
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+properties:
+  $nodename:
+    pattern: "^display@[0-9a-f]+$"
+
+  compatible:
+    enum:
+      - nvidia,tegra186-dc
+      - nvidia,tegra194-dc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: display controller pixel clock
+
+  clock-names:
+    items:
+      - const: dc
+
+  resets:
+    items:
+      - description: display controller reset
+
+  reset-names:
+    items:
+      - const: dc
+
+  power-domains:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+  interconnects:
+    description: Description of the interconnect paths for the
+      display controller; see ../interconnect/interconnect.txt
+      for details.
+
+  interconnect-names:
+    items:
+      - const: dma-mem # read-0
+      - const: read-1
+
+  nvidia,outputs:
+    description: A list of phandles of outputs that this display
+      controller can drive.
+    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+
+  nvidia,head:
+    description: The number of the display controller head. This
+      is used to setup the various types of output to receive
+      video data from the given head.
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - power-domains
+  - nvidia,outputs
+  - nvidia,head
+
+# see nvidia,tegra186-display.yaml for examples
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-display.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-display.yaml
new file mode 100644
index 000000000000..8c0231345529
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-display.yaml
@@ -0,0 +1,310 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra186-display.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra186 (and later) Display Hub
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+properties:
+  $nodename:
+    pattern: "^display-hub@[0-9a-f]+$"
+
+  compatible:
+    enum:
+      - nvidia,tegra186-display
+      - nvidia,tegra194-display
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 2
+    maxItems: 3
+
+  clock-names:
+    minItems: 2
+    maxItems: 3
+
+  resets:
+    items:
+      - description: display hub reset
+      - description: window group 0 reset
+      - description: window group 1 reset
+      - description: window group 2 reset
+      - description: window group 3 reset
+      - description: window group 4 reset
+      - description: window group 5 reset
+
+  reset-names:
+    items:
+      - const: misc
+      - const: wgrp0
+      - const: wgrp1
+      - const: wgrp2
+      - const: wgrp3
+      - const: wgrp4
+      - const: wgrp5
+
+  power-domains:
+    maxItems: 1
+
+  ranges:
+    maxItems: 1
+
+patternProperties:
+  "^display@[0-9a-f]+$":
+    type: object
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nvidia,tegra186-display
+    then:
+      properties:
+        clocks:
+          items:
+            - description: display core clock
+            - description: display stream compression clock
+            - description: display hub clock
+
+        clock-names:
+          items:
+            - const: disp
+            - const: dsc
+            - const: hub
+    else:
+      properties:
+        clocks:
+          items:
+            - description: display core clock
+            - description: display hub clock
+
+        clock-names:
+          items:
+            - const: disp
+            - const: hub
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - power-domains
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra186-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/memory/tegra186-mc.h>
+    #include <dt-bindings/power/tegra186-powergate.h>
+    #include <dt-bindings/reset/tegra186-reset.h>
+
+    display-hub@15200000 {
+        compatible = "nvidia,tegra186-display";
+        reg = <0x15200000 0x00040000>;
+        resets = <&bpmp TEGRA186_RESET_NVDISPLAY0_MISC>,
+                 <&bpmp TEGRA186_RESET_NVDISPLAY0_WGRP0>,
+                 <&bpmp TEGRA186_RESET_NVDISPLAY0_WGRP1>,
+                 <&bpmp TEGRA186_RESET_NVDISPLAY0_WGRP2>,
+                 <&bpmp TEGRA186_RESET_NVDISPLAY0_WGRP3>,
+                 <&bpmp TEGRA186_RESET_NVDISPLAY0_WGRP4>,
+                 <&bpmp TEGRA186_RESET_NVDISPLAY0_WGRP5>;
+        reset-names = "misc", "wgrp0", "wgrp1", "wgrp2",
+                      "wgrp3", "wgrp4", "wgrp5";
+        clocks = <&bpmp TEGRA186_CLK_NVDISPLAY_DISP>,
+                 <&bpmp TEGRA186_CLK_NVDISPLAY_DSC>,
+                 <&bpmp TEGRA186_CLK_NVDISPLAYHUB>;
+        clock-names = "disp", "dsc", "hub";
+        status = "disabled";
+
+        power-domains = <&bpmp TEGRA186_POWER_DOMAIN_DISP>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        ranges = <0x15200000 0x15200000 0x40000>;
+
+        display@15200000 {
+            compatible = "nvidia,tegra186-dc";
+            reg = <0x15200000 0x10000>;
+            interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&bpmp TEGRA186_CLK_NVDISPLAY_P0>;
+            clock-names = "dc";
+            resets = <&bpmp TEGRA186_RESET_NVDISPLAY0_HEAD0>;
+            reset-names = "dc";
+
+            power-domains = <&bpmp TEGRA186_POWER_DOMAIN_DISP>;
+            interconnects = <&mc TEGRA186_MEMORY_CLIENT_NVDISPLAYR &emc>,
+                            <&mc TEGRA186_MEMORY_CLIENT_NVDISPLAYR1 &emc>;
+            interconnect-names = "dma-mem", "read-1";
+            iommus = <&smmu TEGRA186_SID_NVDISPLAY>;
+
+            nvidia,outputs = <&dsia &dsib &sor0 &sor1>;
+            nvidia,head = <0>;
+        };
+
+        display@15210000 {
+            compatible = "nvidia,tegra186-dc";
+            reg = <0x15210000 0x10000>;
+            interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&bpmp TEGRA186_CLK_NVDISPLAY_P1>;
+            clock-names = "dc";
+            resets = <&bpmp TEGRA186_RESET_NVDISPLAY0_HEAD1>;
+            reset-names = "dc";
+
+            power-domains = <&bpmp TEGRA186_POWER_DOMAIN_DISPB>;
+            interconnects = <&mc TEGRA186_MEMORY_CLIENT_NVDISPLAYR &emc>,
+                            <&mc TEGRA186_MEMORY_CLIENT_NVDISPLAYR1 &emc>;
+            interconnect-names = "dma-mem", "read-1";
+            iommus = <&smmu TEGRA186_SID_NVDISPLAY>;
+
+            nvidia,outputs = <&dsia &dsib &sor0 &sor1>;
+            nvidia,head = <1>;
+        };
+
+        display@15220000 {
+            compatible = "nvidia,tegra186-dc";
+            reg = <0x15220000 0x10000>;
+            interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&bpmp TEGRA186_CLK_NVDISPLAY_P2>;
+            clock-names = "dc";
+            resets = <&bpmp TEGRA186_RESET_NVDISPLAY0_HEAD2>;
+            reset-names = "dc";
+
+            power-domains = <&bpmp TEGRA186_POWER_DOMAIN_DISPC>;
+            interconnects = <&mc TEGRA186_MEMORY_CLIENT_NVDISPLAYR &emc>,
+                            <&mc TEGRA186_MEMORY_CLIENT_NVDISPLAYR1 &emc>;
+            interconnect-names = "dma-mem", "read-1";
+            iommus = <&smmu TEGRA186_SID_NVDISPLAY>;
+
+            nvidia,outputs = <&sor0 &sor1>;
+            nvidia,head = <2>;
+        };
+    };
+
+  - |
+    #include <dt-bindings/clock/tegra194-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/memory/tegra194-mc.h>
+    #include <dt-bindings/power/tegra194-powergate.h>
+    #include <dt-bindings/reset/tegra194-reset.h>
+
+    display-hub@15200000 {
+        compatible = "nvidia,tegra194-display";
+        reg = <0x15200000 0x00040000>;
+        resets = <&bpmp TEGRA194_RESET_NVDISPLAY0_MISC>,
+                 <&bpmp TEGRA194_RESET_NVDISPLAY0_WGRP0>,
+                 <&bpmp TEGRA194_RESET_NVDISPLAY0_WGRP1>,
+                 <&bpmp TEGRA194_RESET_NVDISPLAY0_WGRP2>,
+                 <&bpmp TEGRA194_RESET_NVDISPLAY0_WGRP3>,
+                 <&bpmp TEGRA194_RESET_NVDISPLAY0_WGRP4>,
+                 <&bpmp TEGRA194_RESET_NVDISPLAY0_WGRP5>;
+        reset-names = "misc", "wgrp0", "wgrp1", "wgrp2",
+                      "wgrp3", "wgrp4", "wgrp5";
+        clocks = <&bpmp TEGRA194_CLK_NVDISPLAY_DISP>,
+                 <&bpmp TEGRA194_CLK_NVDISPLAYHUB>;
+        clock-names = "disp", "hub";
+        status = "disabled";
+
+        power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISP>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        ranges = <0x15200000 0x15200000 0x40000>;
+
+        display@15200000 {
+            compatible = "nvidia,tegra194-dc";
+            reg = <0x15200000 0x10000>;
+            interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&bpmp TEGRA194_CLK_NVDISPLAY_P0>;
+            clock-names = "dc";
+            resets = <&bpmp TEGRA194_RESET_NVDISPLAY0_HEAD0>;
+            reset-names = "dc";
+
+            power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISP>;
+            interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR &emc>,
+                            <&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR1 &emc>;
+            interconnect-names = "dma-mem", "read-1";
+
+            nvidia,outputs = <&sor0 &sor1 &sor2 &sor3>;
+            nvidia,head = <0>;
+        };
+
+        display@15210000 {
+            compatible = "nvidia,tegra194-dc";
+            reg = <0x15210000 0x10000>;
+            interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&bpmp TEGRA194_CLK_NVDISPLAY_P1>;
+            clock-names = "dc";
+            resets = <&bpmp TEGRA194_RESET_NVDISPLAY0_HEAD1>;
+            reset-names = "dc";
+
+            power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISPB>;
+            interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR &emc>,
+                            <&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR1 &emc>;
+            interconnect-names = "dma-mem", "read-1";
+
+            nvidia,outputs = <&sor0 &sor1 &sor2 &sor3>;
+            nvidia,head = <1>;
+        };
+
+        display@15220000 {
+            compatible = "nvidia,tegra194-dc";
+            reg = <0x15220000 0x10000>;
+            interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&bpmp TEGRA194_CLK_NVDISPLAY_P2>;
+            clock-names = "dc";
+            resets = <&bpmp TEGRA194_RESET_NVDISPLAY0_HEAD2>;
+            reset-names = "dc";
+
+            power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISPC>;
+            interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR &emc>,
+                            <&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR1 &emc>;
+            interconnect-names = "dma-mem", "read-1";
+
+            nvidia,outputs = <&sor0 &sor1 &sor2 &sor3>;
+            nvidia,head = <2>;
+        };
+
+        display@15230000 {
+            compatible = "nvidia,tegra194-dc";
+            reg = <0x15230000 0x10000>;
+            interrupts = <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&bpmp TEGRA194_CLK_NVDISPLAY_P3>;
+            clock-names = "dc";
+            resets = <&bpmp TEGRA194_RESET_NVDISPLAY0_HEAD3>;
+            reset-names = "dc";
+
+            power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISPC>;
+            interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR &emc>,
+                            <&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR1 &emc>;
+            interconnect-names = "dma-mem", "read-1";
+
+            nvidia,outputs = <&sor0 &sor1 &sor2 &sor3>;
+            nvidia,head = <3>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-dsi-padctl.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-dsi-padctl.yaml
new file mode 100644
index 000000000000..4a12710e2a2f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-dsi-padctl.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra186-dsi-padctl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra MIPI DSI pad controller
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+properties:
+  $nodename:
+    pattern: "^padctl@[0-9a-f]+$"
+
+  compatible:
+    const: nvidia,tegra186-dsi-padctl
+
+  reg:
+    maxItems: 1
+
+  resets:
+    items:
+      - description: module reset
+
+  reset-names:
+    items:
+      - const: dsi
+
+allOf:
+  - $ref: "/schemas/reset/reset.yaml"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/reset/tegra186-reset.h>
+
+    padctl@15880000 {
+        compatible = "nvidia,tegra186-dsi-padctl";
+        reg = <0x15880000 0x10000>;
+        resets = <&bpmp TEGRA186_RESET_DSI>;
+        reset-names = "dsi";
+    };
+
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
new file mode 100644
index 000000000000..eeffb8d7c597
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
@@ -0,0 +1,174 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-dc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra Display Controller
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+properties:
+  $nodename:
+    pattern: "^dc@[0-9a-f]+$"
+
+  compatible:
+    oneOf:
+      - enum:
+          - nvidia,tegra20-dc
+          - nvidia,tegra30-dc
+          - nvidia,tegra114-dc
+          - nvidia,tegra124-dc
+          - nvidia,tegra210-dc
+
+      - items:
+          - const: nvidia,tegra124-dc
+          - const: nvidia,tegra132-dc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    items:
+      - description: display controller pixel clock
+      - description: parent clock # optional
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: dc
+      - const: parent # optional
+
+  resets:
+    items:
+      - description: module reset
+
+  reset-names:
+    items:
+      - const: dc
+
+  interconnect-names: true
+  interconnects: true
+
+  iommus:
+    maxItems: 1
+
+  nvidia,head:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: The number of the display controller head. This is used to setup the various
+      types of output to receive video data from the given head.
+
+  nvidia,outputs:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: A list of phandles of outputs that this display controller can drive.
+
+  rgb:
+    type: object
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra20-dc
+              - nvidia,tegra30-dc
+              - nvidia,tegra114-dc
+    then:
+      properties:
+        interconnects:
+          items:
+            - description: window A memory client
+            - description: window B memory client
+            - description: window B memory client (vertical filter)
+            - description: window C memory client
+            - description: cursor memory client
+
+        interconnect-names:
+          items:
+            - const: wina
+            - const: winb
+            - const: winb-vfilter
+            - const: winc
+            - const: cursor
+
+        rgb:
+          description: Each display controller node has a child node, named "rgb", that represents
+            the RGB output associated with the controller.
+          type: object
+          properties:
+            nvidia,ddc-i2c-bus:
+              $ref: /schemas/types.yaml#/definitions/phandle
+              description: phandle of an I2C controller used for DDC EDID probing
+
+            nvidia,hpd-gpio:
+              description: specifies a GPIO used for hotplug detection
+              maxItems: 1
+
+            nvidia,edid:
+              $ref: /schemas/types.yaml#/definitions/uint8-array
+              description: supplies a binary EDID blob
+
+            nvidia,panel:
+              $ref: /schemas/types.yaml#/definitions/phandle
+              description: phandle of a display panel
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra124-dc
+    then:
+      properties:
+        interconnects:
+          minItems: 4
+          items:
+            - description: window A memory client
+            - description: window B memory client
+            - description: window C memory client
+            - description: cursor memory client
+            - description: window D memory client
+            - description: window T memory client
+
+        interconnect-names:
+          minItems: 4
+          items:
+            - const: wina
+            - const: winb
+            - const: winc
+            - const: cursor
+            - const: wind
+            - const: wint
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra20-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    dc@54200000 {
+        compatible = "nvidia,tegra20-dc";
+        reg = <0x54200000 0x00040000>;
+        interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&tegra_car TEGRA20_CLK_DISP1>;
+        clock-names = "dc";
+        resets = <&tegra_car 27>;
+        reset-names = "dc";
+    };
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml
new file mode 100644
index 000000000000..abab8783db1b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml
@@ -0,0 +1,174 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-dsi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra Display Serial Interface
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+properties:
+  $nodename:
+    pattern: "^dsi@[0-9a-f]+$"
+
+  compatible:
+    oneOf:
+      - enum:
+          - nvidia,tegra20-dsi
+          - nvidia,tegra30-dsi
+          - nvidia,tegra114-dsi
+          - nvidia,tegra124-dsi
+          - nvidia,tegra210-dsi
+          - nvidia,tegra186-dsi
+
+      - items:
+          - const: nvidia,tegra132-dsi
+          - const: nvidia,tegra124-dsi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 2
+    maxItems: 3
+
+  clock-names:
+    minItems: 2
+    maxItems: 3
+
+  resets:
+    items:
+      - description: module reset
+
+  reset-names:
+    items:
+      - const: dsi
+
+  power-domains:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  avdd-dsi-csi-supply:
+    description: phandle of a supply that powers the DSI controller
+
+  nvidia,mipi-calibrate:
+    description: Should contain a phandle and a specifier specifying
+      which pads are used by this DSI output and need to be
+      calibrated. See nvidia,tegra114-mipi.yaml for details.
+    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+
+  nvidia,ddc-i2c-bus:
+    description: phandle of an I2C controller used for DDC EDID
+      probing
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+
+  nvidia,hpd-gpio:
+    description: specifies a GPIO used for hotplug detection
+    maxItems: 1
+
+  nvidia,edid:
+    description: supplies a binary EDID blob
+    $ref: "/schemas/types.yaml#/definitions/uint8-array"
+
+  nvidia,panel:
+    description: phandle of a display panel
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+
+  nvidia,ganged-mode:
+    description: contains a phandle to a second DSI controller to
+      gang up with in order to support up to 8 data lanes
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+
+patternProperties:
+  "^panel@[0-9]+$":
+    type: object
+    properties:
+      reg:
+        maxItems: 1
+
+    required:
+      - reg
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra20-dsi
+              - nvidia,tegra30-dsi
+    then:
+      properties:
+        clocks:
+          items:
+            - description: DSI module clock
+            - description: input for the pixel clock
+
+        clock-names:
+          items:
+            - const: dsi
+            - const: parent
+    else:
+      properties:
+        clocks:
+          items:
+            - description: DSI module clock
+            - description: low-power module clock
+            - description: input for the pixel clock
+
+        clock-names:
+          items:
+            - const: dsi
+            - const: lp
+            - const: parent
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nvidia,tegra186-dsi
+    then:
+      required:
+        - interrupts
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra186-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/tegra186-powergate.h>
+    #include <dt-bindings/reset/tegra186-reset.h>
+
+    dsi@15300000 {
+        compatible = "nvidia,tegra186-dsi";
+        reg = <0x15300000 0x10000>;
+        interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&bpmp TEGRA186_CLK_DSI>,
+                 <&bpmp TEGRA186_CLK_DSIA_LP>,
+                 <&bpmp TEGRA186_CLK_PLLD>;
+        clock-names = "dsi", "lp", "parent";
+        resets = <&bpmp TEGRA186_RESET_DSI>;
+        reset-names = "dsi";
+
+        power-domains = <&bpmp TEGRA186_POWER_DOMAIN_DISP>;
+    };
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-epp.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-epp.yaml
new file mode 100644
index 000000000000..d6c45a385c89
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-epp.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-epp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra Encoder Pre-Processor
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+properties:
+  $nodename:
+    pattern: "^epp@[0-9a-f]+$"
+
+  compatible:
+    enum:
+      - nvidia,tegra20-epp
+      - nvidia,tegra30-epp
+      - nvidia,tegra114-epp
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    items:
+      - description: module reset
+
+  reset-names:
+    items:
+      - const: epp
+
+  iommus:
+    maxItems: 1
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra20-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    epp@540c0000 {
+        compatible = "nvidia,tegra20-epp";
+        reg = <0x540c0000 0x00040000>;
+        interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&tegra_car TEGRA20_CLK_EPP>;
+        resets = <&tegra_car 19>;
+        reset-names = "epp";
+    };
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr2d.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr2d.yaml
new file mode 100644
index 000000000000..9135b38d534a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr2d.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-gr2d.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA 2D graphics engine
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+properties:
+  $nodename:
+    pattern: "^gr2d@[0-9a-f]+$"
+
+  compatible:
+    enum:
+      - nvidia,tegra20-gr2d
+      - nvidia,tegra30-gr2d
+      - nvidia,tegra114-gr2d
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: module clock
+
+  resets:
+    items:
+      - description: module reset
+
+  reset-names:
+    items:
+      - const: 2d
+
+  iommus:
+    maxItems: 1
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra20-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    gr2d@54140000 {
+        compatible = "nvidia,tegra20-gr2d";
+        reg = <0x54140000 0x00040000>;
+        interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&tegra_car TEGRA20_CLK_GR2D>;
+        resets = <&tegra_car 21>;
+        reset-names = "2d";
+    };
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr3d.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr3d.yaml
new file mode 100644
index 000000000000..d8f7f1e6f2b4
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr3d.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-gr3d.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA 3D graphics engine
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+properties:
+  $nodename:
+    pattern: "^gr3d@[0-9a-f]+$"
+
+  compatible:
+    enum:
+      - nvidia,tegra20-gr3d
+      - nvidia,tegra30-gr3d
+      - nvidia,tegra114-gr3d
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    maxItems: 2
+
+  resets:
+    minItems: 1
+    maxItems: 2
+
+  reset-names:
+    minItems: 1
+    maxItems: 2
+
+  iommus:
+    minItems: 1
+    maxItems: 2
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nvidia,tegra30-gr3d
+    then:
+      properties:
+        clocks:
+          items:
+            - description: primary module clock
+            - description: secondary module clock
+
+        clock-names:
+          items:
+            - const: 3d
+            - const: 3d2
+
+        resets:
+          items:
+            - description: primary module reset
+            - description: secondary module reset
+
+        reset-names:
+          items:
+            - const: 3d
+            - const: 3d2
+
+        iommus:
+          maxItems: 2
+    else:
+      properties:
+        clocks:
+          items:
+            - description: module clock
+
+        clock-names:
+          items:
+            - const: 3d
+
+        resets:
+          items:
+            - description: module reset
+
+        reset-names:
+          items:
+            - const: 3d
+
+        iommus:
+          maxItems: 1
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra20-car.h>
+
+    gr3d@54180000 {
+        compatible = "nvidia,tegra20-gr3d";
+        reg = <0x54180000 0x00040000>;
+        clocks = <&tegra_car TEGRA20_CLK_GR3D>;
+        resets = <&tegra_car 24>;
+        reset-names = "3d";
+    };
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.yaml
new file mode 100644
index 000000000000..4384803b9017
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.yaml
@@ -0,0 +1,116 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-hdmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra HDMI Output Encoder
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+properties:
+  $nodename:
+    pattern: "^hdmi@[0-9a-f]+$"
+
+  compatible:
+    oneOf:
+      - enum:
+          - nvidia,tegra20-hdmi
+          - nvidia,tegra30-hdmi
+          - nvidia,tegra114-hdmi
+          - nvidia,tegra124-hdmi
+
+      - items:
+          - const: nvidia,tegra132-hdmi
+          - const: nvidia,tegra124-hdmi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: module clock
+      - description: parent clock
+
+  clock-names:
+    items:
+      - const: hdmi
+      - const: parent
+
+  resets:
+    items:
+      - description: module reset
+
+  reset-names:
+    items:
+      - const: hdmi
+
+  hdmi-supply:
+    description: supply for the +5V HDMI connector pin
+
+  vdd-supply:
+    description: regulator for supply voltage
+
+  pll-supply:
+    description: regulator for PLL
+
+  nvidia,ddc-i2c-bus:
+    description: phandle of an I2C controller used for DDC EDID
+      probing
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+
+  nvidia,hpd-gpio:
+    description: specifies a GPIO used for hotplug detection
+    maxItems: 1
+
+  nvidia,edid:
+    description: supplies a binary EDID blob
+    $ref: "/schemas/types.yaml#/definitions/uint8-array"
+
+  nvidia,panel:
+    description: phandle of a display panel
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - pll-supply
+  - vdd-supply
+  - nvidia,ddc-i2c-bus
+  - nvidia,hpd-gpio
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra124-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/gpio/tegra-gpio.h>
+
+    hdmi@54280000 {
+        compatible = "nvidia,tegra124-hdmi";
+        reg = <0x54280000 0x00040000>;
+        interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&tegra_car TEGRA124_CLK_HDMI>,
+                 <&tegra_car TEGRA124_CLK_PLL_D2_OUT0>;
+        clock-names = "hdmi", "parent";
+        resets = <&tegra_car 51>;
+        reset-names = "hdmi";
+
+        hdmi-supply = <&vdd_5v0_hdmi>;
+        pll-supply = <&vdd_hdmi_pll>;
+        vdd-supply = <&vdd_3v3_hdmi>;
+
+        nvidia,ddc-i2c-bus = <&hdmi_ddc>;
+        nvidia,hpd-gpio = <&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
+    };
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
deleted file mode 100644
index 8a6d3e1ee306..000000000000
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
+++ /dev/null
@@ -1,622 +0,0 @@
-NVIDIA Tegra host1x
-
-Required properties:
-- compatible: "nvidia,tegra<chip>-host1x"
-- reg: Physical base address and length of the controller's registers.
-  For pre-Tegra186, one entry describing the whole register area.
-  For Tegra186, one entry for each entry in reg-names:
-    "vm" - VM region assigned to Linux
-    "hypervisor" - Hypervisor region (only if Linux acts as hypervisor)
-- interrupts: The interrupt outputs from the controller.
-- #address-cells: The number of cells used to represent physical base addresses
-  in the host1x address space. Should be 1.
-- #size-cells: The number of cells used to represent the size of an address
-  range in the host1x address space. Should be 1.
-- ranges: The mapping of the host1x address space to the CPU address space.
-- clocks: Must contain one entry, for the module clock.
-  See ../clocks/clock-bindings.txt for details.
-- resets: Must contain an entry for each entry in reset-names.
-  See ../reset/reset.txt for details.
-- reset-names: Must include the following entries:
-  - host1x
-
-Each host1x client module having to perform DMA through the Memory Controller
-should have the interconnect endpoints set to the Memory Client and External
-Memory respectively.
-
-The host1x top-level node defines a number of children, each representing one
-of the following host1x client modules:
-
-- mpe: video encoder
-
-  Required properties:
-  - compatible: "nvidia,tegra<chip>-mpe"
-  - reg: Physical base address and length of the controller's registers.
-  - interrupts: The interrupt outputs from the controller.
-  - clocks: Must contain one entry, for the module clock.
-    See ../clocks/clock-bindings.txt for details.
-  - resets: Must contain an entry for each entry in reset-names.
-    See ../reset/reset.txt for details.
-  - reset-names: Must include the following entries:
-    - mpe
-
-  Optional properties:
-  - interconnects: Must contain entry for the MPE memory clients.
-  - interconnect-names: Must include name of the interconnect path for each
-    interconnect entry. Consult TRM documentation for information about
-    available memory clients, see MEMORY CONTROLLER section.
-
-- vi: video input
-
-  Required properties:
-  - compatible: "nvidia,tegra<chip>-vi"
-  - reg: Physical base address and length of the controller registers.
-  - interrupts: The interrupt outputs from the controller.
-  - clocks: clocks: Must contain one entry, for the module clock.
-    See ../clocks/clock-bindings.txt for details.
-  - Tegra20/Tegra30/Tegra114/Tegra124:
-    - resets: Must contain an entry for each entry in reset-names.
-      See ../reset/reset.txt for details.
-    - reset-names: Must include the following entries:
-      - vi
-  - Tegra210:
-    - power-domains: Must include venc powergate node as vi is in VE partition.
-
-  ports (optional node)
-  vi can have optional ports node and max 6 ports are supported. Each port
-  should have single 'endpoint' child node. All port nodes are grouped under
-  ports node. Please refer to the bindings defined in
-  Documentation/devicetree/bindings/media/video-interfaces.txt
-
-  csi (required node)
-  Tegra210 has CSI part of VI sharing same host interface and register space.
-  So, VI device node should have CSI child node.
-
-    - csi: mipi csi interface to vi
-
-      Required properties:
-      - compatible: "nvidia,tegra210-csi"
-      - reg: Physical base address offset to parent and length of the controller
-        registers.
-      - clocks: Must contain entries csi, cilab, cilcd, cile, csi_tpg clocks.
-        See ../clocks/clock-bindings.txt for details.
-      - power-domains: Must include sor powergate node as csicil is in
-        SOR partition.
-
-      channel (optional nodes)
-      Maximum 6 channels are supported with each csi brick as either x4 or x2
-      based on hw connectivity to sensor.
-
-      Required properties:
-      - reg: csi port number. Valid port numbers are 0 through 5.
-      - nvidia,mipi-calibrate: Should contain a phandle and a specifier
-        specifying which pads are used by this CSI port and need to be
-	calibrated. See also ../display/tegra/nvidia,tegra114-mipi.txt.
-
-      Each channel node must contain 2 port nodes which can be grouped
-      under 'ports' node and each port should have a single child 'endpoint'
-      node.
-
-        ports node
-        Please refer to the bindings defined in
-        Documentation/devicetree/bindings/media/video-interfaces.txt
-
-        ports node must contain below 2 port nodes.
-        port@0 with single child 'endpoint' node always a sink.
-        port@1 with single child 'endpoint' node always a source.
-
-        port@0 (required node)
-        Required properties:
-        - reg: 0
-
-	  endpoint (required node)
-	  Required properties:
-	  - data-lanes: an array of data lane from 1 to 8. Valid array
-	    lengths are 1/2/4/8.
-	  - remote-endpoint: phandle to sensor 'endpoint' node.
-
-        port@1 (required node)
-        Required properties:
-        - reg: 1
-
-	  endpoint (required node)
-	  Required properties:
-	  - remote-endpoint: phandle to vi port 'endpoint' node.
-
-  Optional properties:
-  - interconnects: Must contain entry for the VI memory clients.
-  - interconnect-names: Must include name of the interconnect path for each
-    interconnect entry. Consult TRM documentation for information about
-    available memory clients, see MEMORY CONTROLLER section.
-
-- epp: encoder pre-processor
-
-  Required properties:
-  - compatible: "nvidia,tegra<chip>-epp"
-  - reg: Physical base address and length of the controller's registers.
-  - interrupts: The interrupt outputs from the controller.
-  - clocks: Must contain one entry, for the module clock.
-    See ../clocks/clock-bindings.txt for details.
-  - resets: Must contain an entry for each entry in reset-names.
-    See ../reset/reset.txt for details.
-  - reset-names: Must include the following entries:
-    - epp
-
-  Optional properties:
-  - interconnects: Must contain entry for the EPP memory clients.
-  - interconnect-names: Must include name of the interconnect path for each
-    interconnect entry. Consult TRM documentation for information about
-    available memory clients, see MEMORY CONTROLLER section.
-
-- isp: image signal processor
-
-  Required properties:
-  - compatible: "nvidia,tegra<chip>-isp"
-  - reg: Physical base address and length of the controller's registers.
-  - interrupts: The interrupt outputs from the controller.
-  - clocks: Must contain one entry, for the module clock.
-    See ../clocks/clock-bindings.txt for details.
-  - resets: Must contain an entry for each entry in reset-names.
-    See ../reset/reset.txt for details.
-  - reset-names: Must include the following entries:
-    - isp
-
-  Optional properties:
-  - interconnects: Must contain entry for the ISP memory clients.
-  - interconnect-names: Must include name of the interconnect path for each
-    interconnect entry. Consult TRM documentation for information about
-    available memory clients, see MEMORY CONTROLLER section.
-
-- gr2d: 2D graphics engine
-
-  Required properties:
-  - compatible: "nvidia,tegra<chip>-gr2d"
-  - reg: Physical base address and length of the controller's registers.
-  - interrupts: The interrupt outputs from the controller.
-  - clocks: Must contain one entry, for the module clock.
-    See ../clocks/clock-bindings.txt for details.
-  - resets: Must contain an entry for each entry in reset-names.
-    See ../reset/reset.txt for details.
-  - reset-names: Must include the following entries:
-    - 2d
-
-  Optional properties:
-  - interconnects: Must contain entry for the GR2D memory clients.
-  - interconnect-names: Must include name of the interconnect path for each
-    interconnect entry. Consult TRM documentation for information about
-    available memory clients, see MEMORY CONTROLLER section.
-
-- gr3d: 3D graphics engine
-
-  Required properties:
-  - compatible: "nvidia,tegra<chip>-gr3d"
-  - reg: Physical base address and length of the controller's registers.
-  - clocks: Must contain an entry for each entry in clock-names.
-    See ../clocks/clock-bindings.txt for details.
-  - clock-names: Must include the following entries:
-    (This property may be omitted if the only clock in the list is "3d")
-    - 3d
-      This MUST be the first entry.
-    - 3d2 (Only required on SoCs with two 3D clocks)
-  - resets: Must contain an entry for each entry in reset-names.
-    See ../reset/reset.txt for details.
-  - reset-names: Must include the following entries:
-    - 3d
-    - 3d2 (Only required on SoCs with two 3D clocks)
-
-  Optional properties:
-  - interconnects: Must contain entry for the GR3D memory clients.
-  - interconnect-names: Must include name of the interconnect path for each
-    interconnect entry. Consult TRM documentation for information about
-    available memory clients, see MEMORY CONTROLLER section.
-
-- dc: display controller
-
-  Required properties:
-  - compatible: "nvidia,tegra<chip>-dc"
-  - reg: Physical base address and length of the controller's registers.
-  - interrupts: The interrupt outputs from the controller.
-  - clocks: Must contain an entry for each entry in clock-names.
-    See ../clocks/clock-bindings.txt for details.
-  - clock-names: Must include the following entries:
-    - dc
-      This MUST be the first entry.
-    - parent
-  - resets: Must contain an entry for each entry in reset-names.
-    See ../reset/reset.txt for details.
-  - reset-names: Must include the following entries:
-    - dc
-  - nvidia,head: The number of the display controller head. This is used to
-    setup the various types of output to receive video data from the given
-    head.
-
-  Each display controller node has a child node, named "rgb", that represents
-  the RGB output associated with the controller. It can take the following
-  optional properties:
-  - nvidia,ddc-i2c-bus: phandle of an I2C controller used for DDC EDID probing
-  - nvidia,hpd-gpio: specifies a GPIO used for hotplug detection
-  - nvidia,edid: supplies a binary EDID blob
-  - nvidia,panel: phandle of a display panel
-  - interconnects: Must contain entry for the DC memory clients.
-  - interconnect-names: Must include name of the interconnect path for each
-    interconnect entry. Consult TRM documentation for information about
-    available memory clients, see MEMORY CONTROLLER section.
-
-- hdmi: High Definition Multimedia Interface
-
-  Required properties:
-  - compatible: "nvidia,tegra<chip>-hdmi"
-  - reg: Physical base address and length of the controller's registers.
-  - interrupts: The interrupt outputs from the controller.
-  - hdmi-supply: supply for the +5V HDMI connector pin
-  - vdd-supply: regulator for supply voltage
-  - pll-supply: regulator for PLL
-  - clocks: Must contain an entry for each entry in clock-names.
-    See ../clocks/clock-bindings.txt for details.
-  - clock-names: Must include the following entries:
-    - hdmi
-      This MUST be the first entry.
-    - parent
-  - resets: Must contain an entry for each entry in reset-names.
-    See ../reset/reset.txt for details.
-  - reset-names: Must include the following entries:
-    - hdmi
-
-  Optional properties:
-  - nvidia,ddc-i2c-bus: phandle of an I2C controller used for DDC EDID probing
-  - nvidia,hpd-gpio: specifies a GPIO used for hotplug detection
-  - nvidia,edid: supplies a binary EDID blob
-  - nvidia,panel: phandle of a display panel
-
-- tvo: TV encoder output
-
-  Required properties:
-  - compatible: "nvidia,tegra<chip>-tvo"
-  - reg: Physical base address and length of the controller's registers.
-  - interrupts: The interrupt outputs from the controller.
-  - clocks: Must contain one entry, for the module clock.
-    See ../clocks/clock-bindings.txt for details.
-
-- dsi: display serial interface
-
-  Required properties:
-  - compatible: "nvidia,tegra<chip>-dsi"
-  - reg: Physical base address and length of the controller's registers.
-  - clocks: Must contain an entry for each entry in clock-names.
-    See ../clocks/clock-bindings.txt for details.
-  - clock-names: Must include the following entries:
-    - dsi
-      This MUST be the first entry.
-    - lp
-    - parent
-  - resets: Must contain an entry for each entry in reset-names.
-    See ../reset/reset.txt for details.
-  - reset-names: Must include the following entries:
-    - dsi
-  - avdd-dsi-supply: phandle of a supply that powers the DSI controller
-  - nvidia,mipi-calibrate: Should contain a phandle and a specifier specifying
-    which pads are used by this DSI output and need to be calibrated. See also
-    ../display/tegra/nvidia,tegra114-mipi.txt.
-
-  Optional properties:
-  - nvidia,ddc-i2c-bus: phandle of an I2C controller used for DDC EDID probing
-  - nvidia,hpd-gpio: specifies a GPIO used for hotplug detection
-  - nvidia,edid: supplies a binary EDID blob
-  - nvidia,panel: phandle of a display panel
-  - nvidia,ganged-mode: contains a phandle to a second DSI controller to gang
-    up with in order to support up to 8 data lanes
-
-- sor: serial output resource
-
-  Required properties:
-  - compatible: Should be:
-    - "nvidia,tegra124-sor": for Tegra124 and Tegra132
-    - "nvidia,tegra132-sor": for Tegra132
-    - "nvidia,tegra210-sor": for Tegra210
-    - "nvidia,tegra210-sor1": for Tegra210
-    - "nvidia,tegra186-sor": for Tegra186
-    - "nvidia,tegra186-sor1": for Tegra186
-  - reg: Physical base address and length of the controller's registers.
-  - interrupts: The interrupt outputs from the controller.
-  - clocks: Must contain an entry for each entry in clock-names.
-    See ../clocks/clock-bindings.txt for details.
-  - clock-names: Must include the following entries:
-    - sor: clock input for the SOR hardware
-    - out: SOR output clock
-    - parent: input for the pixel clock
-    - dp: reference clock for the SOR clock
-    - safe: safe reference for the SOR clock during power up
-
-    For Tegra186 and later:
-    - pad: SOR pad output clock (on Tegra186 and later)
-
-    Obsolete:
-    - source: source clock for the SOR clock (obsolete, use "out" instead)
-
-  - resets: Must contain an entry for each entry in reset-names.
-    See ../reset/reset.txt for details.
-  - reset-names: Must include the following entries:
-    - sor
-
-  Required properties on Tegra186 and later:
-  - nvidia,interface: index of the SOR interface
-
-  Optional properties:
-  - nvidia,ddc-i2c-bus: phandle of an I2C controller used for DDC EDID probing
-  - nvidia,hpd-gpio: specifies a GPIO used for hotplug detection
-  - nvidia,edid: supplies a binary EDID blob
-  - nvidia,panel: phandle of a display panel
-  - nvidia,xbar-cfg: 5 cells containing the crossbar configuration. Each lane
-    of the SOR, identified by the cell's index, is mapped via the crossbar to
-    the pad specified by the cell's value.
-
-  Optional properties when driving an eDP output:
-  - nvidia,dpaux: phandle to a DispayPort AUX interface
-
-- dpaux: DisplayPort AUX interface
-  - compatible : Should contain one of the following:
-    - "nvidia,tegra124-dpaux": for Tegra124 and Tegra132
-    - "nvidia,tegra210-dpaux": for Tegra210
-  - reg: Physical base address and length of the controller's registers.
-  - interrupts: The interrupt outputs from the controller.
-  - clocks: Must contain an entry for each entry in clock-names.
-    See ../clocks/clock-bindings.txt for details.
-  - clock-names: Must include the following entries:
-    - dpaux: clock input for the DPAUX hardware
-    - parent: reference clock
-  - resets: Must contain an entry for each entry in reset-names.
-    See ../reset/reset.txt for details.
-  - reset-names: Must include the following entries:
-    - dpaux
-  - vdd-supply: phandle of a supply that powers the DisplayPort link
-  - i2c-bus: Subnode where I2C slave devices are listed. This subnode
-    must be always present. If there are no I2C slave devices, an empty
-    node should be added. See ../../i2c/i2c.txt for more information.
-
-  See ../pinctrl/nvidia,tegra124-dpaux-padctl.txt for information
-  regarding the DPAUX pad controller bindings.
-
-- vic: Video Image Compositor
-  - compatible : "nvidia,tegra<chip>-vic"
-  - reg: Physical base address and length of the controller's registers.
-  - interrupts: The interrupt outputs from the controller.
-  - clocks: Must contain an entry for each entry in clock-names.
-    See ../clocks/clock-bindings.txt for details.
-  - clock-names: Must include the following entries:
-    - vic: clock input for the VIC hardware
-  - resets: Must contain an entry for each entry in reset-names.
-    See ../reset/reset.txt for details.
-  - reset-names: Must include the following entries:
-    - vic
-
-  Optional properties:
-  - interconnects: Must contain entry for the VIC memory clients.
-  - interconnect-names: Must include name of the interconnect path for each
-    interconnect entry. Consult TRM documentation for information about
-    available memory clients, see MEMORY CONTROLLER section.
-
-Example:
-
-/ {
-	...
-
-	host1x {
-		compatible = "nvidia,tegra20-host1x", "simple-bus";
-		reg = <0x50000000 0x00024000>;
-		interrupts = <0 65 0x04   /* mpcore syncpt */
-			      0 67 0x04>; /* mpcore general */
-		clocks = <&tegra_car TEGRA20_CLK_HOST1X>;
-		resets = <&tegra_car 28>;
-		reset-names = "host1x";
-
-		#address-cells = <1>;
-		#size-cells = <1>;
-
-		ranges = <0x54000000 0x54000000 0x04000000>;
-
-		mpe {
-			compatible = "nvidia,tegra20-mpe";
-			reg = <0x54040000 0x00040000>;
-			interrupts = <0 68 0x04>;
-			clocks = <&tegra_car TEGRA20_CLK_MPE>;
-			resets = <&tegra_car 60>;
-			reset-names = "mpe";
-		};
-
-		vi@54080000 {
-			compatible = "nvidia,tegra210-vi";
-			reg = <0x0 0x54080000 0x0 0x700>;
-			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
-			assigned-clocks = <&tegra_car TEGRA210_CLK_VI>;
-			assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_C4_OUT0>;
-
-			clocks = <&tegra_car TEGRA210_CLK_VI>;
-			power-domains = <&pd_venc>;
-
-			#address-cells = <1>;
-			#size-cells = <1>;
-
-			ranges = <0x0 0x0 0x54080000 0x2000>;
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-					imx219_vi_in0: endpoint {
-						remote-endpoint = <&imx219_csi_out0>;
-					};
-				};
-			};
-
-			csi@838 {
-				compatible = "nvidia,tegra210-csi";
-				reg = <0x838 0x1300>;
-				assigned-clocks = <&tegra_car TEGRA210_CLK_CILAB>,
-						  <&tegra_car TEGRA210_CLK_CILCD>,
-						  <&tegra_car TEGRA210_CLK_CILE>,
-						  <&tegra_car TEGRA210_CLK_CSI_TPG>;
-				assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_P>,
-							 <&tegra_car TEGRA210_CLK_PLL_P>,
-							 <&tegra_car TEGRA210_CLK_PLL_P>;
-				assigned-clock-rates = <102000000>,
-						       <102000000>,
-						       <102000000>,
-						       <972000000>;
-
-				clocks = <&tegra_car TEGRA210_CLK_CSI>,
-					 <&tegra_car TEGRA210_CLK_CILAB>,
-					 <&tegra_car TEGRA210_CLK_CILCD>,
-					 <&tegra_car TEGRA210_CLK_CILE>,
-					 <&tegra_car TEGRA210_CLK_CSI_TPG>;
-				clock-names = "csi", "cilab", "cilcd", "cile", "csi_tpg";
-				power-domains = <&pd_sor>;
-
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				channel@0 {
-					reg = <0>;
-					nvidia,mipi-calibrate = <&mipi 0x001>;
-
-					ports {
-						#address-cells = <1>;
-						#size-cells = <0>;
-
-						port@0 {
-							reg = <0>;
-							imx219_csi_in0: endpoint {
-								data-lanes = <1 2>;
-								remote-endpoint = <&imx219_out0>;
-							};
-						};
-
-						port@1 {
-							reg = <1>;
-							imx219_csi_out0: endpoint {
-								remote-endpoint = <&imx219_vi_in0>;
-							};
-						};
-					};
-				};
-			};
-		};
-
-		epp {
-			compatible = "nvidia,tegra20-epp";
-			reg = <0x540c0000 0x00040000>;
-			interrupts = <0 70 0x04>;
-			clocks = <&tegra_car TEGRA20_CLK_EPP>;
-			resets = <&tegra_car 19>;
-			reset-names = "epp";
-		};
-
-		isp {
-			compatible = "nvidia,tegra20-isp";
-			reg = <0x54100000 0x00040000>;
-			interrupts = <0 71 0x04>;
-			clocks = <&tegra_car TEGRA20_CLK_ISP>;
-			resets = <&tegra_car 23>;
-			reset-names = "isp";
-		};
-
-		gr2d {
-			compatible = "nvidia,tegra20-gr2d";
-			reg = <0x54140000 0x00040000>;
-			interrupts = <0 72 0x04>;
-			clocks = <&tegra_car TEGRA20_CLK_GR2D>;
-			resets = <&tegra_car 21>;
-			reset-names = "2d";
-		};
-
-		gr3d {
-			compatible = "nvidia,tegra20-gr3d";
-			reg = <0x54180000 0x00040000>;
-			clocks = <&tegra_car TEGRA20_CLK_GR3D>;
-			resets = <&tegra_car 24>;
-			reset-names = "3d";
-		};
-
-		dc@54200000 {
-			compatible = "nvidia,tegra20-dc";
-			reg = <0x54200000 0x00040000>;
-			interrupts = <0 73 0x04>;
-			clocks = <&tegra_car TEGRA20_CLK_DISP1>,
-				 <&tegra_car TEGRA20_CLK_PLL_P>;
-			clock-names = "dc", "parent";
-			resets = <&tegra_car 27>;
-			reset-names = "dc";
-
-			interconnects = <&mc TEGRA20_MC_DISPLAY0A &emc>,
-					<&mc TEGRA20_MC_DISPLAY0B &emc>,
-					<&mc TEGRA20_MC_DISPLAY0C &emc>,
-					<&mc TEGRA20_MC_DISPLAYHC &emc>;
-			interconnect-names = "wina",
-					     "winb",
-					     "winc",
-					     "cursor";
-
-			rgb {
-				status = "disabled";
-			};
-		};
-
-		dc@54240000 {
-			compatible = "nvidia,tegra20-dc";
-			reg = <0x54240000 0x00040000>;
-			interrupts = <0 74 0x04>;
-			clocks = <&tegra_car TEGRA20_CLK_DISP2>,
-				 <&tegra_car TEGRA20_CLK_PLL_P>;
-			clock-names = "dc", "parent";
-			resets = <&tegra_car 26>;
-			reset-names = "dc";
-
-			interconnects = <&mc TEGRA20_MC_DISPLAY0AB &emc>,
-					<&mc TEGRA20_MC_DISPLAY0BB &emc>,
-					<&mc TEGRA20_MC_DISPLAY0CB &emc>,
-					<&mc TEGRA20_MC_DISPLAYHCB &emc>;
-			interconnect-names = "wina",
-					     "winb",
-					     "winc",
-					     "cursor";
-
-			rgb {
-				status = "disabled";
-			};
-		};
-
-		hdmi {
-			compatible = "nvidia,tegra20-hdmi";
-			reg = <0x54280000 0x00040000>;
-			interrupts = <0 75 0x04>;
-			clocks = <&tegra_car TEGRA20_CLK_HDMI>,
-				 <&tegra_car TEGRA20_CLK_PLL_D_OUT0>;
-			clock-names = "hdmi", "parent";
-			resets = <&tegra_car 51>;
-			reset-names = "hdmi";
-			status = "disabled";
-		};
-
-		tvo {
-			compatible = "nvidia,tegra20-tvo";
-			reg = <0x542c0000 0x00040000>;
-			interrupts = <0 76 0x04>;
-			clocks = <&tegra_car TEGRA20_CLK_TVO>;
-			status = "disabled";
-		};
-
-		dsi {
-			compatible = "nvidia,tegra20-dsi";
-			reg = <0x54300000 0x00040000>;
-			clocks = <&tegra_car TEGRA20_CLK_DSI>,
-				 <&tegra_car TEGRA20_CLK_PLL_D_OUT0>;
-			clock-names = "dsi", "parent";
-			resets = <&tegra_car 48>;
-			reset-names = "dsi";
-			status = "disabled";
-		};
-	};
-
-	...
-};
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
new file mode 100644
index 000000000000..fd0262a0d653
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
@@ -0,0 +1,334 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-host1x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra host1x controller
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+description: The host1x top-level node defines a number of children, each
+  representing one of the host1x client modules defined in this binding.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - nvidia,tegra20-host1x
+          - nvidia,tegra30-host1x
+          - nvidia,tegra114-host1x
+          - nvidia,tegra124-host1x
+          - nvidia,tegra210-host1x
+          - nvidia,tegra186-host1x
+          - nvidia,tegra194-host1x
+
+      - items:
+          - const: nvidia,tegra132-host1x
+          - const: nvidia,tegra124-host1x
+
+  reg:
+    minItems: 1
+    maxItems: 2
+
+  reg-names:
+    minItems: 1
+    maxItems: 2
+
+  interrupts:
+    items:
+      - description: host1x syncpoint interrupt
+      - description: host1x general interrupt
+    minItems: 1
+
+  interrupt-names:
+    items:
+      - const: syncpt
+      - const: host1x
+    minItems: 1
+
+  '#address-cells':
+    description: The number of cells used to represent physical base addresses
+      in the host1x address space.
+    enum: [1, 2]
+
+  '#size-cells':
+    description: The number of cells used to represent the size of an address
+      range in the host1x address space.
+    enum: [1, 2]
+
+  ranges:
+    maxItems: 1
+
+  clocks:
+    description: Must contain one entry, for the module clock. See
+      ../clocks/clock-bindings.txt for details.
+
+  clock-names:
+    items:
+      - const: host1x
+
+  resets:
+    description: Must contain an entry for each entry in reset-names. See
+      ../reset/reset.txt for details.
+
+  reset-names:
+    items:
+      - const: host1x
+
+  iommus:
+    maxItems: 1
+
+  interconnects:
+    description: Description of the interconnect paths for the host1x
+      controller; see ../interconnect/interconnect.txt for details.
+    items:
+      - description: memory read client for host1x
+
+  interconnect-names:
+    description: A list of names identifying each entry listed in the
+      "interconnects" property.
+    items:
+      - const: dma-mem # read
+
+required:
+  - compatible
+  - interrupts
+  - interrupt-names
+  - '#address-cells'
+  - '#size-cells'
+  - ranges
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+
+additionalProperties:
+  type: object
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra186-host1x
+              - nvidia,tegra194-host1x
+    then:
+      properties:
+        reg-names:
+          items:
+            - const: hypervisor
+            - const: vm
+
+        reg:
+          items:
+            - description: physical base address and length of the register
+                region assigned to the VM
+            - description: physical base address and length of the register
+                region used by the hypervisor
+
+      required:
+        - reg-names
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra20-car.h>
+    #include <dt-bindings/gpio/tegra-gpio.h>
+
+    host1x@50000000 {
+        compatible = "nvidia,tegra20-host1x";
+        reg = <0x50000000 0x00024000>;
+        interrupts = <0 65 0x04   /* mpcore syncpt */
+                      0 67 0x04>; /* mpcore general */
+        interrupt-names = "syncpt", "host1x";
+        clocks = <&tegra_car TEGRA20_CLK_HOST1X>;
+        clock-names = "host1x";
+        resets = <&tegra_car 28>;
+        reset-names = "host1x";
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        ranges = <0x54000000 0x54000000 0x04000000>;
+
+        mpe@54040000 {
+            compatible = "nvidia,tegra20-mpe";
+            reg = <0x54040000 0x00040000>;
+            interrupts = <0 68 0x04>;
+            clocks = <&tegra_car TEGRA20_CLK_MPE>;
+            resets = <&tegra_car 60>;
+            reset-names = "mpe";
+        };
+
+        vi@54080000 {
+            compatible = "nvidia,tegra20-vi";
+            reg = <0x54080000 0x00040000>;
+            interrupts = <0 69 0x04>;
+            clocks = <&tegra_car TEGRA20_CLK_VI>;
+            resets = <&tegra_car 100>;
+            reset-names = "vi";
+        };
+
+        epp@540c0000 {
+            compatible = "nvidia,tegra20-epp";
+            reg = <0x540c0000 0x00040000>;
+            interrupts = <0 70 0x04>;
+            clocks = <&tegra_car TEGRA20_CLK_EPP>;
+            resets = <&tegra_car 19>;
+            reset-names = "epp";
+        };
+
+        isp@54100000 {
+            compatible = "nvidia,tegra20-isp";
+            reg = <0x54100000 0x00040000>;
+            interrupts = <0 71 0x04>;
+            clocks = <&tegra_car TEGRA20_CLK_ISP>;
+            resets = <&tegra_car 23>;
+            reset-names = "isp";
+        };
+
+        gr2d@54140000 {
+            compatible = "nvidia,tegra20-gr2d";
+            reg = <0x54140000 0x00040000>;
+            interrupts = <0 72 0x04>;
+            clocks = <&tegra_car TEGRA20_CLK_GR2D>;
+            resets = <&tegra_car 21>;
+            reset-names = "2d";
+        };
+
+        gr3d@54180000 {
+            compatible = "nvidia,tegra20-gr3d";
+            reg = <0x54180000 0x00040000>;
+            clocks = <&tegra_car TEGRA20_CLK_GR3D>;
+            resets = <&tegra_car 24>;
+            reset-names = "3d";
+        };
+
+        dc@54200000 {
+            compatible = "nvidia,tegra20-dc";
+            reg = <0x54200000 0x00040000>;
+            interrupts = <0 73 0x04>;
+            clocks = <&tegra_car TEGRA20_CLK_DISP1>;
+            clock-names = "dc";
+            resets = <&tegra_car 27>;
+            reset-names = "dc";
+
+            rgb {
+            };
+        };
+
+        dc@54240000 {
+            compatible = "nvidia,tegra20-dc";
+            reg = <0x54240000 0x00040000>;
+            interrupts = <0 74 0x04>;
+            clocks = <&tegra_car TEGRA20_CLK_DISP2>;
+            clock-names = "dc";
+            resets = <&tegra_car 26>;
+            reset-names = "dc";
+
+            rgb {
+            };
+        };
+
+        hdmi@54280000 {
+            compatible = "nvidia,tegra20-hdmi";
+            reg = <0x54280000 0x00040000>;
+            interrupts = <0 75 0x04>;
+            clocks = <&tegra_car TEGRA20_CLK_HDMI>,
+                     <&tegra_car TEGRA20_CLK_PLL_D_OUT0>;
+            clock-names = "hdmi", "parent";
+            resets = <&tegra_car 51>;
+            reset-names = "hdmi";
+
+            hdmi-supply = <&vdd_5v0_hdmi>;
+            pll-supply = <&vdd_hdmi_pll>;
+            vdd-supply = <&vdd_3v3_hdmi>;
+
+            nvidia,ddc-i2c-bus = <&hdmi_ddc>;
+            nvidia,hpd-gpio = <&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
+        };
+
+        tvo@542c0000 {
+            compatible = "nvidia,tegra20-tvo";
+            reg = <0x542c0000 0x00040000>;
+            interrupts = <0 76 0x04>;
+            clocks = <&tegra_car TEGRA20_CLK_TVO>;
+        };
+
+        dsi@54300000 {
+            compatible = "nvidia,tegra20-dsi";
+            reg = <0x54300000 0x00040000>;
+            clocks = <&tegra_car TEGRA20_CLK_DSI>,
+                     <&tegra_car TEGRA20_CLK_PLL_D_OUT0>;
+            clock-names = "dsi", "parent";
+            resets = <&tegra_car 48>;
+            reset-names = "dsi";
+        };
+    };
+
+  - |
+    #include <dt-bindings/clock/tegra210-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/memory/tegra210-mc.h>
+
+    host1x@50000000 {
+        compatible = "nvidia,tegra210-host1x";
+        reg = <0x50000000 0x00024000>;
+        interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>, /* mpcore syncpt */
+                     <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>; /* mpcore general */
+        interrupt-names = "syncpt", "host1x";
+        clocks = <&tegra_car TEGRA210_CLK_HOST1X>;
+        clock-names = "host1x";
+        resets = <&tegra_car 28>;
+        reset-names = "host1x";
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        ranges = <0x54000000 0x54000000 0x01000000>;
+        iommus = <&mc TEGRA_SWGROUP_HC>;
+
+        vi@54080000 {
+            compatible = "nvidia,tegra210-vi";
+            reg = <0x54080000 0x00000700>;
+            interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+            assigned-clocks = <&tegra_car TEGRA210_CLK_VI>;
+            assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_C4_OUT0>;
+
+            clocks = <&tegra_car TEGRA210_CLK_VI>;
+            power-domains = <&pd_venc>;
+
+            #address-cells = <1>;
+            #size-cells = <1>;
+
+            ranges = <0x0 0x54080000 0x2000>;
+
+            csi@838 {
+                compatible = "nvidia,tegra210-csi";
+                reg = <0x838 0x1300>;
+                assigned-clocks = <&tegra_car TEGRA210_CLK_CILAB>,
+                                  <&tegra_car TEGRA210_CLK_CILCD>,
+                                  <&tegra_car TEGRA210_CLK_CILE>,
+                                  <&tegra_car TEGRA210_CLK_CSI_TPG>;
+                assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_P>,
+                                         <&tegra_car TEGRA210_CLK_PLL_P>,
+                                         <&tegra_car TEGRA210_CLK_PLL_P>;
+                assigned-clock-rates = <102000000>,
+                                       <102000000>,
+                                       <102000000>,
+                                       <972000000>;
+
+                clocks = <&tegra_car TEGRA210_CLK_CSI>,
+                         <&tegra_car TEGRA210_CLK_CILAB>,
+                         <&tegra_car TEGRA210_CLK_CILCD>,
+                         <&tegra_car TEGRA210_CLK_CILE>,
+                         <&tegra_car TEGRA210_CLK_CSI_TPG>;
+                clock-names = "csi", "cilab", "cilcd", "cile", "csi_tpg";
+                power-domains = <&pd_sor>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-isp.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-isp.yaml
new file mode 100644
index 000000000000..f94f30830bbf
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-isp.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-isp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra ISP processor
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+properties:
+  compatible:
+    enum:
+      - nvidia,tegra20-isp
+      - nvidia,tegra30-isp
+      - nvidia,tegra210-isp
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: module clock
+
+  resets:
+    items:
+      - description: module reset
+
+  reset-names:
+    items:
+      - const: isp
+
+  iommus:
+    maxItems: 1
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra20-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    isp@54100000 {
+        compatible = "nvidia,tegra20-isp";
+        reg = <0x54100000 0x00040000>;
+        interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&tegra_car TEGRA20_CLK_ISP>;
+        resets = <&tegra_car 23>;
+        reset-names = "isp";
+    };
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-mpe.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-mpe.yaml
new file mode 100644
index 000000000000..4dbbba3678ae
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-mpe.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-mpe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra Video Encoder
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+properties:
+  $nodename:
+    pattern: "^mpe@[0-9a-f]+$"
+
+  compatible:
+    enum:
+      - nvidia,tegra20-mpe
+      - nvidia,tegra30-mpe
+      - nvidia,tegra114-mpe
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: module clock
+
+  resets:
+    items:
+      - description: module reset
+
+  reset-names:
+    items:
+      - const: mpe
+
+  iommus:
+    maxItems: 1
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra20-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    mpe@54040000 {
+        compatible = "nvidia,tegra20-mpe";
+        reg = <0x54040000 0x00040000>;
+        interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&tegra_car TEGRA20_CLK_MPE>;
+        resets = <&tegra_car 60>;
+        reset-names = "mpe";
+    };
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-tvo.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-tvo.yaml
new file mode 100644
index 000000000000..c1d4c6fe923f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-tvo.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-tvo.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra TV Encoder Output
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+properties:
+  $nodename:
+    pattern: "^tvo@[0-9a-f]+$"
+
+  compatible:
+    enum:
+      - nvidia,tegra20-tvo
+      - nvidia,tegra30-tvo
+      - nvidia,tegra114-tvo
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: module clock
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra20-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    tvo@542c0000 {
+        compatible = "nvidia,tegra20-tvo";
+        reg = <0x542c0000 0x00040000>;
+        interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&tegra_car TEGRA20_CLK_TVO>;
+    };
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
new file mode 100644
index 000000000000..5cb2d9964c05
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
@@ -0,0 +1,151 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-vi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra Video Input controller
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+properties:
+  $nodename:
+    pattern: "^vi@[0-9a-f]+$"
+
+  compatible:
+    oneOf:
+      - const: nvidia,tegra20-vi
+      - const: nvidia,tegra30-vi
+      - const: nvidia,tegra114-vi
+      - const: nvidia,tegra124-vi
+      - items:
+          - const: nvidia,tegra132-vi
+          - const: nvidia,tegra124-vi
+      - const: nvidia,tegra210-vi
+      - const: nvidia,tegra186-vi
+      - const: nvidia,tegra194-vi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    items:
+      - description: module reset
+
+  reset-names:
+    items:
+      - const: vi
+
+  iommus:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  avdd-dsi-csi-supply:
+    description: DSI/CSI power supply. Must supply 1.2 V.
+
+patternProperties:
+  "^csi@[0-9a-f]+$":
+    type: object
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra20-vi
+              - nvidia,tegra30-vi
+              - nvidia,tegra114-vi
+              - nvidia,tegra124-vi
+    then:
+      required:
+        - resets
+        - reset-names
+    else:
+      required:
+        - power-domains
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra20-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    vi@54080000 {
+        compatible = "nvidia,tegra20-vi";
+        reg = <0x54080000 0x00040000>;
+        interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&tegra_car TEGRA20_CLK_VI>;
+        resets = <&tegra_car 100>;
+        reset-names = "vi";
+    };
+
+  - |
+    #include <dt-bindings/clock/tegra210-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    vi@54080000 {
+        compatible = "nvidia,tegra210-vi";
+        reg = <0x54080000 0x00000700>;
+        interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+        assigned-clocks = <&tegra_car TEGRA210_CLK_VI>;
+        assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_C4_OUT0>;
+
+        clocks = <&tegra_car TEGRA210_CLK_VI>;
+        power-domains = <&pd_venc>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        ranges = <0x0 0x54080000 0x2000>;
+
+        csi@838 {
+            compatible = "nvidia,tegra210-csi";
+            reg = <0x838 0x1300>;
+            assigned-clocks = <&tegra_car TEGRA210_CLK_CILAB>,
+                              <&tegra_car TEGRA210_CLK_CILCD>,
+                              <&tegra_car TEGRA210_CLK_CILE>,
+                              <&tegra_car TEGRA210_CLK_CSI_TPG>;
+            assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_P>,
+                                     <&tegra_car TEGRA210_CLK_PLL_P>,
+                                     <&tegra_car TEGRA210_CLK_PLL_P>;
+            assigned-clock-rates = <102000000>,
+                                   <102000000>,
+                                   <102000000>,
+                                   <972000000>;
+
+            clocks = <&tegra_car TEGRA210_CLK_CSI>,
+                     <&tegra_car TEGRA210_CLK_CILAB>,
+                     <&tegra_car TEGRA210_CLK_CILCD>,
+                     <&tegra_car TEGRA210_CLK_CILE>,
+                     <&tegra_car TEGRA210_CLK_CSI_TPG>;
+            clock-names = "csi", "cilab", "cilcd", "cile", "csi_tpg";
+            power-domains = <&pd_sor>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml
new file mode 100644
index 000000000000..fa07a40d1004
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra210-csi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra CSI controller
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+properties:
+  $nodename:
+    pattern: "^csi@[0-9a-f]+$"
+
+  compatible:
+    enum:
+      - nvidia,tegra210-csi
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: module clock
+      - description: A/B lanes clock
+      - description: C/D lanes clock
+      - description: E lane clock
+      - description: test pattern generator clock
+
+  clock-names:
+    items:
+      - const: csi
+      - const: cilab
+      - const: cilcd
+      - const: cile
+      - const: csi_tpg
+
+  power-domains:
+    maxItems: 1
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - power-domains
+
+# see nvidia,tegra20-vi.yaml for an example
diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-dpaux-padctl.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-dpaux-padctl.txt
deleted file mode 100644
index e0e886b73527..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-dpaux-padctl.txt
+++ /dev/null
@@ -1,59 +0,0 @@
-Device tree binding for NVIDIA Tegra DPAUX pad controller
-========================================================
-
-The Tegra Display Port Auxiliary (DPAUX) pad controller manages two pins
-which can be assigned to either the DPAUX channel or to an I2C
-controller.
-
-This document defines the device-specific binding for the DPAUX pad
-controller. Refer to pinctrl-bindings.txt in this directory for generic
-information about pin controller device tree bindings. Please refer to
-the binding document ../display/tegra/nvidia,tegra20-host1x.txt for more
-details on the DPAUX binding.
-
-Pin muxing:
------------
-
-Child nodes contain the pinmux configurations following the conventions
-from the pinctrl-bindings.txt document.
-
-Since only three configurations are possible, only three child nodes are
-needed to describe the pin mux'ing options for the DPAUX pads.
-Furthermore, given that the pad functions are only applicable to a
-single set of pads, the child nodes only need to describe the pad group
-the functions are being applied to rather than the individual pads.
-
-Required properties:
-- groups: Must be "dpaux-io"
-- function: Must be either "aux", "i2c" or "off".
-
-Example:
---------
-
-	dpaux@545c0000 {
-		...
-
-		state_dpaux_aux: pinmux-aux {
-			groups = "dpaux-io";
-			function = "aux";
-		};
-
-		state_dpaux_i2c: pinmux-i2c {
-			groups = "dpaux-io";
-			function = "i2c";
-		};
-
-		state_dpaux_off: pinmux-off {
-			groups = "dpaux-io";
-			function = "off";
-		};
-	};
-
-	...
-
-	i2c@7000d100 {
-		...
-		pinctrl-0 = <&state_dpaux_i2c>;
-		pinctrl-1 = <&state_dpaux_off>;
-		pinctrl-names = "default", "idle";
-	};
-- 
2.34.1

