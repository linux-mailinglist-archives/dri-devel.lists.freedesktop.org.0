Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E101292C1
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 09:11:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49A9F6E1FB;
	Mon, 23 Dec 2019 08:10:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 645EF6E328
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 08:47:59 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 960144B8C;
 Thu, 19 Dec 2019 03:47:58 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 19 Dec 2019 03:47:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=f/6gp5wwWYtOOUfH1vEcuGBcuM
 RIDfIpgkrCgJeqe2Q=; b=iZnEik9/1ZwK+NT/pu/GmUDoe5JZDlzA3kyuZt9LeU
 3GMmUAAM8reVuYKiXyubB2JM/JQCPg3+msWdDcM+TQHzrevlWSh/ytjPonE6W9u+
 TVZsUySaYi1+rx0C3ikLiOFFvqoLPyXDT/01h/dFCn8BHCJZC/NfnPRtzvBN/cdk
 x8BkNVpKnmnut4B+gutGfmJAOEjaECYxHmcQkUFQ+RNnPGtQkpODNSyeNsxwiOyC
 LRiCftEw+aAaOtvuzPDe9u7BWDJZwVfEAkKo9rqeAPaStxw7xDOUw5xgwrPkrBcc
 gkXYoCLdPmGGlXhaCPSUiduhJ46OWcfSK1XgJ20CxRLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=f/6gp5wwWYtOOUfH1
 vEcuGBcuMRIDfIpgkrCgJeqe2Q=; b=I2KszSzWFHoalRDblzYxwLXf7OfuhFTRm
 E704adWf8nojRl3JTVvpBw8iCBiUieLHt7z83YN99RpTEJz7dNmcuNb4UMYgEvFp
 FxZx9u+KuQI1f8AgjLc6Ul+SH02SMB88kBehBNLtKI2JmQoGhRaT6lYfQIDv+tBW
 OUq1WPRxHfizzHdvYFO8dsB7nK0DSl5XP0hPZQZsaA/naHEibyiBfJpYyUNVpNBJ
 IvcMu1BCQ405qXZHMX59G7ubJ7eFofxCCLaF81kx2VH16KopxrNlxtFVZju9Gqu0
 lxq6YhVG3JHwzbGGCJzAT1LOwyt+SjkEck10KLjxSH7j25h8eC5mg==
X-ME-Sender: <xms:PTn7Xc3EWq2DkQuoX1go8mqSKF8VlHtnyzcn2HZ-2LB6BydRmiXlrw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddutddguddvfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucffohhmrghinh
 epuggvvhhitggvthhrvggvrdhorhhgnecukfhppeeltddrkeelrdeikedrjeeinecurfgr
 rhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghhnecuvehluh
 hsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:PTn7XctITK8d6jPIlkyz87fzd0f1hnbkhHtVgUF7W1CcPwEfkckQ_g>
 <xmx:PTn7XUFTl7IbQRLZn5epIARjmYpQEt_eTYBXSDYAy3swuPH4igHfIg>
 <xmx:PTn7XTxleQSW0TM2WuMzT7h__8_teOoe9TOQoIsn39A4paSt4aPmqw>
 <xmx:Pjn7Xc33R7hclbBEZcPFnEyxRLaTocY4A_QIz0EQ7cPIYbjmwMF8qg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 25B0230609D7;
 Thu, 19 Dec 2019 03:47:57 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sean Paul <seanpaul@chromium.org>, Maxime Ripard <mripard@kernel.org>
Subject: [PATCH] dt-bindings: display: Convert Allwinner display pipeline to
 schemas
Date: Thu, 19 Dec 2019 09:47:55 +0100
Message-Id: <20191219084755.944642-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 23 Dec 2019 08:10:46 +0000
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Allwinner SoCs have a display engine composed of several controllers
assembled differently depending on the SoC, the number and type of output
they have, and the additional features they provide. A number of those are
supported in Linux, with the matching bindings.

Now that we have the DT validation in place, let's split into separate file
and convert the device tree bindings for those controllers to schemas.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../allwinner,sun4i-a10-display-backend.yaml  | 268 ++++++++
 .../allwinner,sun4i-a10-display-engine.yaml   | 114 ++++
 .../allwinner,sun4i-a10-display-frontend.yaml | 116 ++++
 .../display/allwinner,sun4i-a10-hdmi.yaml     | 159 +++++
 .../display/allwinner,sun4i-a10-tcon.yaml     | 560 +++++++++++++++
 .../allwinner,sun4i-a10-tv-encoder.yaml       |  62 ++
 .../display/allwinner,sun6i-a31-drc.yaml      | 115 ++++
 .../allwinner,sun8i-a83t-de2-mixer.yaml       |  96 +++
 .../display/allwinner,sun8i-a83t-dw-hdmi.yaml | 251 +++++++
 .../allwinner,sun8i-a83t-hdmi-phy.yaml        |  77 +++
 .../display/allwinner,sun8i-r40-tcon-top.yaml | 258 +++++++
 .../display/allwinner,sun9i-a80-deu.yaml      | 110 +++
 .../bindings/display/sunxi/sun4i-drm.txt      | 637 ------------------
 13 files changed, 2186 insertions(+), 637 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-backend.yaml
 create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml
 create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-frontend.yaml
 create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun4i-a10-hdmi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
 create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tv-encoder.yaml
 create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun6i-a31-drc.yaml
 create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
 create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-dw-hdmi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-hdmi-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
 create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun9i-a80-deu.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-backend.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-backend.yaml
new file mode 100644
index 000000000000..d941c9cf07df
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-backend.yaml
@@ -0,0 +1,268 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/allwinner,sun4i-a10-display-backend.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A10 Display Engine Backend Device Tree Bindings
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <mripard@kernel.org>
+
+description: |
+  The display engine backend exposes layers and sprites to the system.
+
+properties:
+  compatible:
+    enum:
+      - allwinner,sun4i-a10-display-backend
+      - allwinner,sun5i-a13-display-backend
+      - allwinner,sun6i-a31-display-backend
+      - allwinner,sun7i-a20-display-backend
+      - allwinner,sun8i-a23-display-backend
+      - allwinner,sun8i-a33-display-backend
+      - allwinner,sun9i-a80-display-backend
+
+  reg:
+    minItems: 1
+    maxItems: 2
+    items:
+      - description: Display Backend registers
+      - description: SAT registers
+
+  reg-names:
+    minItems: 1
+    maxItems: 2
+    items:
+      - const: be
+      - const: sat
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 3
+    maxItems: 4
+    items:
+      - description: The backend interface clock
+      - description: The backend module clock
+      - description: The backend DRAM clock
+      - description: The SAT clock
+
+  clock-names:
+    minItems: 3
+    maxItems: 4
+    items:
+      - const: ahb
+      - const: mod
+      - const: ram
+      - const: sat
+
+  resets:
+    minItems: 1
+    maxItems: 2
+    items:
+      - description: The Backend reset line
+      - description: The SAT reset line
+
+  reset-names:
+    minItems: 1
+    maxItems: 2
+    items:
+      - const: be
+      - const: sat
+
+  # FIXME: This should be made required eventually once every SoC will
+  # have the MBUS declared.
+  interconnects:
+    maxItems: 1
+
+  # FIXME: This should be made required eventually once every SoC will
+  # have the MBUS declared.
+  interconnect-names:
+    const: dma-mem
+
+  ports:
+    type: object
+    description: |
+      A ports node with endpoint definitions as defined in
+      Documentation/devicetree/bindings/media/video-interfaces.txt. The
+      first port should be the input endpoints, the second one the
+      output.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - ports
+
+additionalProperties: false
+
+if:
+  properties:
+    compatible:
+      contains:
+        const: allwinner,sun8i-a33-display-backend
+
+then:
+  properties:
+    reg:
+      maxItems: 2
+
+    reg-names:
+      maxItems: 2
+
+    clocks:
+      maxItems: 4
+
+    clock-names:
+      maxItems: 4
+
+    resets:
+      maxItems: 2
+
+    reset-names:
+      maxItems: 2
+
+  required:
+    - reg-names
+    - reset-names
+
+else:
+  properties:
+    reg:
+      maxItems: 1
+
+    reg-names:
+      maxItems: 1
+
+    clocks:
+      maxItems: 3
+
+    clock-names:
+      maxItems: 3
+
+    resets:
+      maxItems: 1
+
+    reset-names:
+      maxItems: 1
+
+examples:
+  - |
+    /*
+     * This comes from the clock/sun4i-a10-ccu.h and
+     * reset/sun4i-a10-ccu.h headers, but we can't include them since
+     * it would trigger a bunch of warnings for redefinitions of
+     * symbols with the other example.
+     */
+
+    #define CLK_AHB_DE_BE0	42
+    #define CLK_DRAM_DE_BE0	140
+    #define CLK_DE_BE0		144
+    #define RST_DE_BE0		5
+
+    display-backend@1e60000 {
+        compatible = "allwinner,sun4i-a10-display-backend";
+        reg = <0x01e60000 0x10000>;
+        interrupts = <47>;
+        clocks = <&ccu CLK_AHB_DE_BE0>, <&ccu CLK_DE_BE0>,
+                 <&ccu CLK_DRAM_DE_BE0>;
+        clock-names = "ahb", "mod",
+                      "ram";
+        resets = <&ccu RST_DE_BE0>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <0>;
+
+                endpoint@0 {
+                    reg = <0>;
+                    remote-endpoint = <&fe0_out_be0>;
+                };
+
+                endpoint@1 {
+                    reg = <1>;
+                    remote-endpoint = <&fe1_out_be0>;
+                };
+            };
+
+            port@1 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <1>;
+
+                endpoint@0 {
+                    reg = <0>;
+                    remote-endpoint = <&tcon0_in_be0>;
+                };
+
+                endpoint@1 {
+                    reg = <1>;
+                    remote-endpoint = <&tcon1_in_be0>;
+                };
+            };
+        };
+    };
+
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    /*
+     * This comes from the clock/sun8i-a23-a33-ccu.h and
+     * reset/sun8i-a23-a33-ccu.h headers, but we can't include them
+     * since it would trigger a bunch of warnings for redefinitions of
+     * symbols with the other example.
+     */
+
+    #define CLK_BUS_DE_BE	40
+    #define CLK_BUS_SAT		46
+    #define CLK_DRAM_DE_BE	84
+    #define CLK_DE_BE		85
+    #define RST_BUS_DE_BE	21
+    #define RST_BUS_SAT		27
+
+    display-backend@1e60000 {
+        compatible = "allwinner,sun8i-a33-display-backend";
+        reg = <0x01e60000 0x10000>, <0x01e80000 0x1000>;
+        reg-names = "be", "sat";
+        interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&ccu CLK_BUS_DE_BE>, <&ccu CLK_DE_BE>,
+                 <&ccu CLK_DRAM_DE_BE>, <&ccu CLK_BUS_SAT>;
+        clock-names = "ahb", "mod",
+                      "ram", "sat";
+        resets = <&ccu RST_BUS_DE_BE>, <&ccu RST_BUS_SAT>;
+        reset-names = "be", "sat";
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                endpoint {
+                    remote-endpoint = <&fe0_out_be0>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                endpoint {
+                    remote-endpoint = <&drc0_in_be0>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml
new file mode 100644
index 000000000000..3900e3dd2f38
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml
@@ -0,0 +1,114 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/allwinner,sun4i-a10-display-engine.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A10 Display Engine Pipeline Device Tree Bindings
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <mripard@kernel.org>
+
+description: |
+  The display engine pipeline (and its entry point, since it can be
+  either directly the backend or the frontend) is represented as an
+  extra node.
+
+  The Allwinner A10 Display pipeline is composed of several components
+  that are going to be documented below:
+
+  For all connections between components up to the TCONs in the
+  display pipeline, when there are multiple components of the same
+  type at the same depth, the local endpoint ID must be the same as
+  the remote component's index. For example, if the remote endpoint is
+  Frontend 1, then the local endpoint ID must be 1.
+
+  Frontend 0  [0] ------- [0]  Backend 0  [0] ------- [0]  TCON 0
+              [1] --   -- [1]             [1] --   -- [1]
+                    \ /                         \ /
+                     X                           X
+                    / \                         / \
+              [0] --   -- [0]             [0] --   -- [0]
+  Frontend 1  [1] ------- [1]  Backend 1  [1] ------- [1]  TCON 1
+
+  For a two pipeline system such as the one depicted above, the lines
+  represent the connections between the components, while the numbers
+  within the square brackets corresponds to the ID of the local endpoint.
+
+  The same rule also applies to DE 2.0 mixer-TCON connections:
+
+  Mixer 0  [0] ----------- [0]  TCON 0
+           [1] ----   ---- [1]
+                   \ /
+                    X
+                   / \
+           [0] ----   ---- [0]
+  Mixer 1  [1] ----------- [1]  TCON 1
+
+properties:
+  compatible:
+    enum:
+      - allwinner,sun4i-a10-display-engine
+      - allwinner,sun5i-a10s-display-engine
+      - allwinner,sun5i-a13-display-engine
+      - allwinner,sun6i-a31-display-engine
+      - allwinner,sun6i-a31s-display-engine
+      - allwinner,sun7i-a20-display-engine
+      - allwinner,sun8i-a23-display-engine
+      - allwinner,sun8i-a33-display-engine
+      - allwinner,sun8i-a83t-display-engine
+      - allwinner,sun8i-h3-display-engine
+      - allwinner,sun8i-r40-display-engine
+      - allwinner,sun8i-v3s-display-engine
+      - allwinner,sun9i-a80-display-engine
+      - allwinner,sun50i-a64-display-engine
+      - allwinner,sun50i-h6-display-engine
+
+  allwinner,pipelines:
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/phandle-array
+      - minItems: 1
+        maxItems: 2
+    description: |
+      Available display engine frontends (DE 1.0) or mixers (DE
+      2.0/3.0) available.
+
+required:
+  - compatible
+  - allwinner,pipelines
+
+additionalProperties: false
+
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - allwinner,sun4i-a10-display-engine
+          - allwinner,sun6i-a31-display-engine
+          - allwinner,sun6i-a31s-display-engine
+          - allwinner,sun7i-a20-display-engine
+          - allwinner,sun8i-a83t-display-engine
+          - allwinner,sun8i-r40-display-engine
+          - allwinner,sun9i-a80-display-engine
+          - allwinner,sun50i-a64-display-engine
+
+then:
+  properties:
+    allwinner,pipelines:
+      maxItems: 2
+
+else:
+  properties:
+    allwinner,pipelines:
+      maxItems: 1
+
+examples:
+  - |
+      de: display-engine {
+          compatible = "allwinner,sun4i-a10-display-engine";
+          allwinner,pipelines = <&fe0>, <&fe1>;
+      };
+
+...
diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-frontend.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-frontend.yaml
new file mode 100644
index 000000000000..36be41b492bb
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-frontend.yaml
@@ -0,0 +1,116 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/allwinner,sun4i-a10-display-frontend.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A10 Display Engine Frontend Device Tree Bindings
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <mripard@kernel.org>
+
+description: |
+  The display engine frontend does formats conversion, scaling,
+  deinterlacing and color space conversion.
+
+properties:
+  compatible:
+    enum:
+      - allwinner,sun4i-a10-display-frontend
+      - allwinner,sun5i-a13-display-frontend
+      - allwinner,sun6i-a31-display-frontend
+      - allwinner,sun7i-a20-display-frontend
+      - allwinner,sun8i-a23-display-frontend
+      - allwinner,sun8i-a33-display-frontend
+      - allwinner,sun9i-a80-display-frontend
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: The frontend interface clock
+      - description: The frontend module clock
+      - description: The frontend DRAM clock
+
+  clock-names:
+    items:
+      - const: ahb
+      - const: mod
+      - const: ram
+
+  # FIXME: This should be made required eventually once every SoC will
+  # have the MBUS declared.
+  interconnects:
+    maxItems: 1
+
+  # FIXME: This should be made required eventually once every SoC will
+  # have the MBUS declared.
+  interconnect-names:
+    const: dma-mem
+
+  resets:
+    maxItems: 1
+
+  ports:
+    type: object
+    description: |
+      A ports node with endpoint definitions as defined in
+      Documentation/devicetree/bindings/media/video-interfaces.txt. The
+      first port should be the input endpoints, the second one the
+      outputs.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sun4i-a10-ccu.h>
+    #include <dt-bindings/reset/sun4i-a10-ccu.h>
+
+    fe0: display-frontend@1e00000 {
+        compatible = "allwinner,sun4i-a10-display-frontend";
+        reg = <0x01e00000 0x20000>;
+        interrupts = <47>;
+        clocks = <&ccu CLK_AHB_DE_FE0>, <&ccu CLK_DE_FE0>,
+                 <&ccu CLK_DRAM_DE_FE0>;
+        clock-names = "ahb", "mod",
+                      "ram";
+        resets = <&ccu RST_DE_FE0>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            fe0_out: port@1 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <1>;
+
+                fe0_out_be0: endpoint@0 {
+                    reg = <0>;
+                    remote-endpoint = <&be0_in_fe0>;
+                };
+
+                fe0_out_be1: endpoint@1 {
+                    reg = <1>;
+                    remote-endpoint = <&be1_in_fe0>;
+                };
+            };
+        };
+    };
+
+
+...
diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-hdmi.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-hdmi.yaml
new file mode 100644
index 000000000000..c5b3f00d2e67
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-hdmi.yaml
@@ -0,0 +1,159 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/allwinner,sun4i-a10-hdmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A10 HDMI Controller Device Tree Bindings
+
+description: |
+  The HDMI Encoder supports the HDMI video and audio outputs, and does
+  CEC. It is one end of the pipeline.
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <mripard@kernel.org>
+
+properties:
+  compatible:
+    oneOf:
+      - const: allwinner,sun4i-a10-hdmi
+      - const: allwinner,sun5i-a10s-hdmi
+      - const: allwinner,sun6i-a31-hdmi
+      - items:
+        - const: allwinner,sun7i-a20-hdmi
+        - const: allwinner,sun5i-a10s-hdmi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    oneOf:
+      - items:
+        - description: The HDMI interface clock
+        - description: The HDMI module clock
+        - description: The first video PLL
+        - description: The second video PLL
+
+      - items:
+        - description: The HDMI interface clock
+        - description: The HDMI module clock
+        - description: The HDMI DDC clock
+        - description: The first video PLL
+        - description: The second video PLL
+
+  clock-names:
+    oneOf:
+      - items:
+        - const: ahb
+        - const: mod
+        - const: pll-0
+        - const: pll-1
+
+      - items:
+        - const: ahb
+        - const: mod
+        - const: ddc
+        - const: pll-0
+        - const: pll-1
+
+  resets:
+    maxItems: 1
+
+  dmas:
+    items:
+      - description: DDC Transmission DMA Channel
+      - description: DDC Reception DMA Channel
+      - description: Audio Transmission DMA Channel
+
+  dma-names:
+    items:
+      - const: ddc-tx
+      - const: ddc-rx
+      - const: audio-tx
+
+  ports:
+    type: object
+    description: |
+      A ports node with endpoint definitions as defined in
+      Documentation/devicetree/bindings/media/video-interfaces.txt. The
+      first port should be the input endpoint. The second should be
+      the output, usually to an HDMI connector.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - dmas
+  - dma-names
+
+if:
+  properties:
+    compatible:
+      contains:
+        const: allwinner,sun6i-a31-hdmi
+
+then:
+  properties:
+    clocks:
+      maxItems: 5
+
+    clock-names:
+      maxItems: 5
+
+  required:
+    - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sun4i-a10-ccu.h>
+    #include <dt-bindings/dma/sun4i-a10.h>
+    #include <dt-bindings/reset/sun4i-a10-ccu.h>
+
+    hdmi: hdmi@1c16000 {
+        compatible = "allwinner,sun4i-a10-hdmi";
+        reg = <0x01c16000 0x1000>;
+        interrupts = <58>;
+        clocks = <&ccu CLK_AHB_HDMI0>, <&ccu CLK_HDMI>,
+                 <&ccu CLK_PLL_VIDEO0_2X>,
+                 <&ccu CLK_PLL_VIDEO1_2X>;
+        clock-names = "ahb", "mod", "pll-0", "pll-1";
+        dmas = <&dma SUN4I_DMA_NORMAL 16>,
+               <&dma SUN4I_DMA_NORMAL 16>,
+               <&dma SUN4I_DMA_DEDICATED 24>;
+        dma-names = "ddc-tx", "ddc-rx", "audio-tx";
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            hdmi_in: port@0 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <0>;
+
+                hdmi_in_tcon0: endpoint@0 {
+                    reg = <0>;
+                    remote-endpoint = <&tcon0_out_hdmi>;
+                };
+
+                hdmi_in_tcon1: endpoint@1 {
+                    reg = <1>;
+                    remote-endpoint = <&tcon1_out_hdmi>;
+                };
+            };
+
+            hdmi_out: port@1 {
+                reg = <1>;
+            };
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
new file mode 100644
index 000000000000..c2a118fc9058
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
@@ -0,0 +1,560 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/allwinner,sun4i-a10-tcon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A10 Timings Controller (TCON) Device Tree Bindings
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <mripard@kernel.org>
+
+description: |
+  The TCON acts as a timing controller for RGB, LVDS and TV
+  interfaces.
+
+properties:
+  "#clock-cells":
+    const: 0
+
+  compatible:
+    oneOf:
+      - const: allwinner,sun4i-a10-tcon
+      - const: allwinner,sun5i-a13-tcon
+      - const: allwinner,sun6i-a31-tcon
+      - const: allwinner,sun6i-a31s-tcon
+      - const: allwinner,sun7i-a20-tcon
+      - const: allwinner,sun8i-a23-tcon
+      - const: allwinner,sun8i-a33-tcon
+      - const: allwinner,sun8i-a83t-tcon-lcd
+      - const: allwinner,sun8i-a83t-tcon-tv
+      - const: allwinner,sun8i-r40-tcon-tv
+      - const: allwinner,sun8i-v3s-tcon
+      - const: allwinner,sun9i-a80-tcon-lcd
+      - const: allwinner,sun9i-a80-tcon-tv
+
+      - items:
+        - const: allwinner,sun50i-a64-tcon-lcd
+        - const: allwinner,sun8i-a83t-tcon-lcd
+
+      - items:
+        - const: allwinner,sun50i-a64-tcon-tv
+        - const: allwinner,sun8i-a83t-tcon-tv
+
+      - items:
+        - const: allwinner,sun8i-h3-tcon-tv
+        - const: allwinner,sun8i-a83t-tcon-tv
+
+      - items:
+        - const: allwinner,sun50i-h6-tcon-tv
+        - const: allwinner,sun8i-r40-tcon-tv
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 3
+
+  clock-names:
+    minItems: 1
+    maxItems: 3
+
+  clock-output-names:
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/string-array
+      - maxItems: 1
+    description:
+      Name of the LCD pixel clock created.
+
+  dmas:
+    maxItems: 1
+
+  resets:
+    minItems: 1
+    maxItems: 2
+
+  reset-names:
+    minItems: 1
+    maxItems: 2
+
+  ports:
+    type: object
+    description: |
+      A ports node with endpoint definitions as defined in
+      Documentation/devicetree/bindings/media/video-interfaces.txt. The
+      first port should be the input endpoint, the second one the
+      outputs.
+
+      The output may have multiple endpoints. TCON can have 1 or 2
+      channels, usually with the first channel being used for the
+      panels interfaces (RGB, LVDS, etc.), and the second being used
+      for the outputs that require another controller (TV Encoder,
+      HDMI, etc.). The endpoints will take an extra property,
+      allwinner,tcon-channel, to specify the channel the endpoint is
+      associated to. If that property is not present, the endpoint
+      number will be used as the channel number.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - ports
+
+additionalProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun4i-a10-tcon
+              - allwinner,sun5i-a13-tcon
+              - allwinner,sun6i-a31-tcon
+              - allwinner,sun6i-a31s-tcon
+              - allwinner,sun7i-a20-tcon
+
+    then:
+      properties:
+        clocks:
+          maxItems: 3
+
+        clock-names:
+          items:
+            - const: ahb
+            - const: tcon-ch0
+            - const: tcon-ch1
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun8i-a23-tcon
+              - allwinner,sun8i-a33-tcon
+              - allwinner,sun8i-a83t-tcon-lcd
+              - allwinner,sun8i-v3s-tcon
+              - allwinner,sun9i-a80-tcon-lcd
+
+    then:
+      properties:
+        clocks:
+          maxItems: 2
+
+        clock-names:
+          items:
+            - const: ahb
+            - const: tcon-ch0
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun8i-a83t-tcon-tv
+              - allwinner,sun8i-r40-tcon-tv
+              - allwinner,sun9i-a80-tcon-tv
+
+    then:
+      properties:
+        clocks:
+          maxItems: 2
+
+        clock-names:
+          items:
+            - const: ahb
+            - const: tcon-ch1
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun5i-a13-tcon
+              - allwinner,sun6i-a31-tcon
+              - allwinner,sun6i-a31s-tcon
+              - allwinner,sun7i-a20-tcon
+              - allwinner,sun8i-a23-tcon
+              - allwinner,sun8i-a33-tcon
+              - allwinner,sun8i-v3s-tcon
+              - allwinner,sun9i-a80-tcon-lcd
+              - allwinner,sun4i-a10-tcon
+              - allwinner,sun8i-a83t-tcon-lcd
+
+    then:
+      required:
+        - "#clock-cells"
+        - clock-output-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - const: allwinner,sun9i-a80-tcon-lcd
+
+    then:
+      properties:
+        resets:
+          items:
+            - description: TCON Reset Line
+            - description: TCON eDP Reset Line
+
+        reset-names:
+          items:
+            - const: lcd
+            - const: edp
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - const: allwinner,sun6i-a31-tcon
+              - const: allwinner,sun6i-a31s-tcon
+              - const: allwinner,sun7i-a20-tcon
+              - const: allwinner,sun8i-a23-tcon
+              - const: allwinner,sun8i-a33-tcon
+              - const: allwinner,sun8i-a83t-tcon-lcd
+              - const: allwinner,sun9i-a80-tcon-lcd
+              - const: allwinner,sun9i-a80-tcon-tv
+
+    then:
+      properties:
+        resets:
+          items:
+            - description: TCON Reset Line
+            - description: TCON LVDS Reset Line
+
+        reset-names:
+          items:
+            - const: lcd
+            - const: lvds
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - const: allwinner,sun6i-a31-tcon
+              - const: allwinner,sun6i-a31s-tcon
+              - const: allwinner,sun8i-a23-tcon
+              - const: allwinner,sun8i-a33-tcon
+
+    then:
+      properties:
+        clocks:
+          maxItems: 2
+
+        clock-names:
+          items:
+            - const: lvds-alt
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun4i-a10-tcon
+              - allwinner,sun5i-a13-tcon
+              - allwinner,sun6i-a31-tcon
+              - allwinner,sun6i-a31s-tcon
+              - allwinner,sun7i-a20-tcon
+              - allwinner,sun8i-a23-tcon
+              - allwinner,sun8i-a33-tcon
+
+    then:
+      required:
+        - dmas
+
+examples:
+  - |
+    #include <dt-bindings/dma/sun4i-a10.h>
+
+    /*
+     * This comes from the clock/sun4i-a10-ccu.h and
+     * reset/sun4i-a10-ccu.h headers, but we can't include them since
+     * it would trigger a bunch of warnings for redefinitions of
+     * symbols with the other example.
+     */
+
+    #define CLK_AHB_LCD0	56
+    #define CLK_TCON0_CH0	149
+    #define CLK_TCON0_CH1	155
+    #define RST_TCON0		11
+
+    lcd-controller@1c0c000 {
+        compatible = "allwinner,sun4i-a10-tcon";
+        reg = <0x01c0c000 0x1000>;
+        interrupts = <44>;
+        resets = <&ccu RST_TCON0>;
+        reset-names = "lcd";
+        clocks = <&ccu CLK_AHB_LCD0>,
+                 <&ccu CLK_TCON0_CH0>,
+                 <&ccu CLK_TCON0_CH1>;
+        clock-names = "ahb",
+                      "tcon-ch0",
+                      "tcon-ch1";
+        clock-output-names = "tcon0-pixel-clock";
+        #clock-cells = <0>;
+        dmas = <&dma SUN4I_DMA_DEDICATED 14>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <0>;
+
+                endpoint@0 {
+                    reg = <0>;
+                    remote-endpoint = <&be0_out_tcon0>;
+                };
+
+                endpoint@1 {
+                    reg = <1>;
+                    remote-endpoint = <&be1_out_tcon0>;
+                };
+            };
+
+            port@1 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <1>;
+
+                endpoint@1 {
+                    reg = <1>;
+                    remote-endpoint = <&hdmi_in_tcon0>;
+                    allwinner,tcon-channel = <1>;
+                };
+            };
+        };
+    };
+
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    /*
+     * This comes from the clock/sun6i-a31-ccu.h and
+     * reset/sun6i-a31-ccu.h headers, but we can't include them since
+     * it would trigger a bunch of warnings for redefinitions of
+     * symbols with the other example.
+     */
+
+    #define CLK_AHB1_LCD0	47
+    #define CLK_LCD0_CH0	127
+    #define CLK_LCD0_CH1	129
+    #define RST_AHB1_LCD0	27
+
+    lcd-controller@1c0c000 {
+        compatible = "allwinner,sun6i-a31-tcon";
+        reg = <0x01c0c000 0x1000>;
+        interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+        dmas = <&dma 11>;
+        resets = <&ccu RST_AHB1_LCD0>;
+        reset-names = "lcd";
+        clocks = <&ccu CLK_AHB1_LCD0>,
+                 <&ccu CLK_LCD0_CH0>,
+                 <&ccu CLK_LCD0_CH1>;
+        clock-names = "ahb",
+                      "tcon-ch0",
+                      "tcon-ch1";
+        clock-output-names = "tcon0-pixel-clock";
+        #clock-cells = <0>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <0>;
+
+                endpoint@0 {
+                    reg = <0>;
+                    remote-endpoint = <&drc0_out_tcon0>;
+                };
+
+                endpoint@1 {
+                    reg = <1>;
+                    remote-endpoint = <&drc1_out_tcon0>;
+                };
+            };
+
+            port@1 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <1>;
+
+                endpoint@1 {
+                    reg = <1>;
+                    remote-endpoint = <&hdmi_in_tcon0>;
+                    allwinner,tcon-channel = <1>;
+                };
+            };
+        };
+    };
+
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    /*
+     * This comes from the clock/sun9i-a80-ccu.h and
+     * reset/sun9i-a80-ccu.h headers, but we can't include them since
+     * it would trigger a bunch of warnings for redefinitions of
+     * symbols with the other example.
+     */
+
+    #define CLK_BUS_LCD0	102
+    #define CLK_LCD0		58
+    #define RST_BUS_LCD0	22
+    #define RST_BUS_EDP		24
+
+    lcd-controller@3c00000 {
+        compatible = "allwinner,sun9i-a80-tcon-lcd";
+        reg = <0x03c00000 0x10000>;
+        interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&ccu CLK_BUS_LCD0>, <&ccu CLK_LCD0>;
+        clock-names = "ahb", "tcon-ch0";
+        resets = <&ccu RST_BUS_LCD0>, <&ccu RST_BUS_EDP>;
+        reset-names = "lcd", "edp";
+        clock-output-names = "tcon0-pixel-clock";
+        #clock-cells = <0>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                endpoint {
+                    remote-endpoint = <&drc0_out_tcon0>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+            };
+        };
+    };
+
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    /*
+     * This comes from the clock/sun8i-a83t-ccu.h and
+     * reset/sun8i-a83t-ccu.h headers, but we can't include them since
+     * it would trigger a bunch of warnings for redefinitions of
+     * symbols with the other example.
+     */
+
+    #define CLK_BUS_TCON0	36
+    #define CLK_TCON0		85
+    #define RST_BUS_TCON0	22
+    #define RST_BUS_LVDS	31
+
+    lcd-controller@1c0c000 {
+        compatible = "allwinner,sun8i-a83t-tcon-lcd";
+        reg = <0x01c0c000 0x1000>;
+        interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&ccu CLK_BUS_TCON0>, <&ccu CLK_TCON0>;
+        clock-names = "ahb", "tcon-ch0";
+        clock-output-names = "tcon-pixel-clock";
+        #clock-cells = <0>;
+        resets = <&ccu RST_BUS_TCON0>, <&ccu RST_BUS_LVDS>;
+        reset-names = "lcd", "lvds";
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <0>;
+
+                endpoint@0 {
+                    reg = <0>;
+                    remote-endpoint = <&mixer0_out_tcon0>;
+                };
+
+                endpoint@1 {
+                    reg = <1>;
+                    remote-endpoint = <&mixer1_out_tcon0>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+            };
+        };
+    };
+
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    /*
+     * This comes from the clock/sun8i-r40-ccu.h and
+     * reset/sun8i-r40-ccu.h headers, but we can't include them since
+     * it would trigger a bunch of warnings for redefinitions of
+     * symbols with the other example.
+     */
+
+    #define CLK_BUS_TCON_TV0	73
+    #define RST_BUS_TCON_TV0	49
+
+    tcon_tv0: lcd-controller@1c73000 {
+        compatible = "allwinner,sun8i-r40-tcon-tv";
+        reg = <0x01c73000 0x1000>;
+        interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&ccu CLK_BUS_TCON_TV0>, <&tcon_top 0>;
+        clock-names = "ahb", "tcon-ch1";
+        resets = <&ccu RST_BUS_TCON_TV0>;
+        reset-names = "lcd";
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <0>;
+
+                endpoint@0 {
+                    reg = <0>;
+                    remote-endpoint = <&tcon_top_mixer0_out_tcon_tv0>;
+                };
+
+                endpoint@1 {
+                    reg = <1>;
+                    remote-endpoint = <&tcon_top_mixer1_out_tcon_tv0>;
+                };
+            };
+
+            tcon_tv0_out: port@1 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <1>;
+
+                endpoint@1 {
+                    reg = <1>;
+                    remote-endpoint = <&tcon_top_hdmi_in_tcon_tv0>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tv-encoder.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tv-encoder.yaml
new file mode 100644
index 000000000000..5d5d39665119
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tv-encoder.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/allwinner,sun4i-a10-tv-encoder.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A10 TV Encoder Device Tree Bindings
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <mripard@kernel.org>
+
+properties:
+  compatible:
+    const: allwinner,sun4i-a10-tv-encoder
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  port:
+    type: object
+    description:
+      A port node with endpoint definitions as defined in
+      Documentation/devicetree/bindings/media/video-interfaces.txt. The
+      first port should be the input endpoint, usually coming from the
+      associated TCON.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - resets
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    tve0: tv-encoder@1c0a000 {
+        compatible = "allwinner,sun4i-a10-tv-encoder";
+        reg = <0x01c0a000 0x1000>;
+        clocks = <&ahb_gates 34>;
+        resets = <&tcon_ch0_clk 0>;
+
+        port {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            tve0_in_tcon0: endpoint@0 {
+                reg = <0>;
+                remote-endpoint = <&tcon0_out_tve0>;
+            };
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-drc.yaml b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-drc.yaml
new file mode 100644
index 000000000000..ecde659f932d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-drc.yaml
@@ -0,0 +1,115 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/allwinner,sun6i-a31-drc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A31 Dynamic Range Controller Device Tree Bindings
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <mripard@kernel.org>
+
+description: |
+  The DRC (Dynamic Range Controller) allows to dynamically adjust
+  pixel brightness/contrast based on histogram measurements for LCD
+  content adaptive backlight control.
+
+properties:
+  compatible:
+    enum:
+      - allwinner,sun6i-a31-drc
+      - allwinner,sun6i-a31s-drc
+      - allwinner,sun8i-a23-drc
+      - allwinner,sun8i-a33-drc
+      - allwinner,sun9i-a80-drc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: The DRC interface clock
+      - description: The DRC module clock
+      - description: The DRC DRAM clock
+
+  clock-names:
+    items:
+      - const: ahb
+      - const: mod
+      - const: ram
+
+  resets:
+    maxItems: 1
+
+  ports:
+    type: object
+    description: |
+      A ports node with endpoint definitions as defined in
+      Documentation/devicetree/bindings/media/video-interfaces.txt. The
+      first port should be the input endpoints, the second one the
+      outputs.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    #include <dt-bindings/clock/sun6i-a31-ccu.h>
+    #include <dt-bindings/reset/sun6i-a31-ccu.h>
+
+    drc0: drc@1e70000 {
+        compatible = "allwinner,sun6i-a31-drc";
+        reg = <0x01e70000 0x10000>;
+        interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&ccu CLK_AHB1_DRC0>, <&ccu CLK_IEP_DRC0>,
+                 <&ccu CLK_DRAM_DRC0>;
+        clock-names = "ahb", "mod",
+                      "ram";
+        resets = <&ccu RST_AHB1_DRC0>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            drc0_in: port@0 {
+                reg = <0>;
+
+                drc0_in_be0: endpoint {
+                    remote-endpoint = <&be0_out_drc0>;
+                };
+            };
+
+            drc0_out: port@1 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <1>;
+
+                drc0_out_tcon0: endpoint@0 {
+                    reg = <0>;
+                    remote-endpoint = <&tcon0_in_drc0>;
+                };
+
+                drc0_out_tcon1: endpoint@1 {
+                    reg = <1>;
+                    remote-endpoint = <&tcon1_in_drc0>;
+                };
+            };
+        };
+    };
+
+
+...
diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
new file mode 100644
index 000000000000..bdc538acc1c9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-de2-mixer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner Display Engine 2.0 Mixer Device Tree Bindings
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <mripard@kernel.org>
+
+properties:
+  compatible:
+    enum:
+      - allwinner,sun8i-a83t-de2-mixer-0
+      - allwinner,sun8i-a83t-de2-mixer-1
+      - allwinner,sun8i-h3-de2-mixer-0
+      - allwinner,sun8i-r40-de2-mixer-0
+      - allwinner,sun8i-r40-de2-mixer-1
+      - allwinner,sun8i-v3s-de2-mixer
+      - allwinner,sun50i-a64-de2-mixer-0
+      - allwinner,sun50i-a64-de2-mixer-1
+      - allwinner,sun50i-h6-de3-mixer-0
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: The mixer interface clock
+      - description: The mixer module clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: mod
+
+  resets:
+    maxItems: 1
+
+  ports:
+    type: object
+    description: |
+      A ports node with endpoint definitions as defined in
+      Documentation/devicetree/bindings/media/video-interfaces.txt. The
+      first port should be the input endpoints, the second one the
+      output.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sun8i-de2.h>
+    #include <dt-bindings/reset/sun8i-de2.h>
+
+    mixer0: mixer@1100000 {
+        compatible = "allwinner,sun8i-a83t-de2-mixer-0";
+        reg = <0x01100000 0x100000>;
+        clocks = <&display_clocks CLK_BUS_MIXER0>,
+                 <&display_clocks CLK_MIXER0>;
+        clock-names = "bus",
+                      "mod";
+        resets = <&display_clocks RST_MIXER0>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            mixer0_out: port@1 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <1>;
+
+                mixer0_out_tcon0: endpoint@0 {
+                    reg = <0>;
+                    remote-endpoint = <&tcon0_in_mixer0>;
+                };
+
+                mixer0_out_tcon1: endpoint@1 {
+                    reg = <1>;
+                    remote-endpoint = <&tcon1_in_mixer0>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-dw-hdmi.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-dw-hdmi.yaml
new file mode 100644
index 000000000000..1a10bce0fd06
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-dw-hdmi.yaml
@@ -0,0 +1,251 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A83t DWC HDMI TX Encoder Device Tree Bindings
+
+description: |
+  The HDMI transmitter is a Synopsys DesignWare HDMI 1.4 TX controller
+  IP with Allwinner\'s own PHY IP. It supports audio and video outputs
+  and CEC.
+
+  These DT bindings follow the Synopsys DWC HDMI TX bindings defined
+  in Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt with
+  the following device-specific properties.
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <mripard@kernel.org>
+
+properties:
+  "#phy-cells":
+    const: 0
+
+  compatible:
+    oneOf:
+      - const: allwinner,sun8i-a83t-dw-hdmi
+      - items:
+          - const: allwinner,sun8i-h3-dw-hdmi
+          - const: allwinner,sun8i-a83t-dw-hdmi
+      - items:
+          - const: allwinner,sun8i-r40-dw-hdmi
+          - const: allwinner,sun8i-a83t-dw-hdmi
+      - items:
+          - const: allwinner,sun50i-a64-dw-hdmi
+          - const: allwinner,sun8i-a83t-dw-hdmi
+      - const: allwinner,sun50i-h6-dw-hdmi
+
+  reg:
+    maxItems: 1
+
+  reg-io-width:
+    const: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 3
+    maxItems: 6
+    items:
+      - description: Bus Clock
+      - description: Register Clock
+      - description: TMDS Clock
+      - description: HDMI CEC Clock
+      - description: HDCP Clock
+      - description: HDCP Bus Clock
+
+  clock-names:
+    minItems: 3
+    maxItems: 6
+    items:
+      - const: iahb
+      - const: isfr
+      - const: tmds
+      - const: cec
+      - const: hdcp
+      - const: hdcp-bus
+
+  resets:
+    minItems: 1
+    maxItems: 2
+    items:
+      - description: HDMI Controller Reset
+      - description: HDCP Reset
+
+  reset-names:
+    minItems: 1
+    maxItems: 2
+    items:
+      - const: ctrl
+      - const: hdcp
+
+  phys:
+    maxItems: 1
+    description:
+      Phandle to the DWC HDMI PHY.
+
+  phy-names:
+    const: phy
+
+  ports:
+    type: object
+    description:
+      A port node with endpoint definitions as defined in
+      Documentation/devicetree/bindings/media/video-interfaces.txt. The
+      first port should be the input endpoint, usually coming from the
+      associated TCON. The second should be the output, usually to an
+      HDMI connector.
+
+  hvcc-supply:
+    description:
+      The VCC power supply of the controller
+
+required:
+  - compatible
+  - reg
+  - reg-io-width
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - phys
+  - phy-names
+  - ports
+
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - allwinner,sun50i-h6-dw-hdmi
+
+then:
+  properties:
+    clocks:
+      minItems: 6
+
+    clock-names:
+      minItems: 6
+
+    resets:
+      minItems: 2
+
+    reset-names:
+      minItems: 2
+
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    /*
+     * This comes from the clock/sun8i-a83t-ccu.h and
+     * reset/sun8i-a83t-ccu.h headers, but we can't include them since
+     * it would trigger a bunch of warnings for redefinitions of
+     * symbols with the other example.
+     */
+    #define CLK_BUS_HDMI	39
+    #define CLK_HDMI		93
+    #define CLK_HDMI_SLOW	94
+    #define RST_BUS_HDMI1	26
+
+    hdmi@1ee0000 {
+        compatible = "allwinner,sun8i-a83t-dw-hdmi";
+        reg = <0x01ee0000 0x10000>;
+        reg-io-width = <1>;
+        interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&ccu CLK_BUS_HDMI>, <&ccu CLK_HDMI_SLOW>,
+                 <&ccu CLK_HDMI>;
+        clock-names = "iahb", "isfr", "tmds";
+        resets = <&ccu RST_BUS_HDMI1>;
+        reset-names = "ctrl";
+        phys = <&hdmi_phy>;
+        phy-names = "phy";
+        pinctrl-names = "default";
+        pinctrl-0 = <&hdmi_pins>;
+        status = "disabled";
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                endpoint {
+                    remote-endpoint = <&tcon1_out_hdmi>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+            };
+        };
+    };
+
+    /* Cleanup after ourselves */
+    #undef CLK_BUS_HDMI
+    #undef CLK_HDMI
+    #undef CLK_HDMI_SLOW
+
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    /*
+     * This comes from the clock/sun50i-h6-ccu.h and
+     * reset/sun50i-h6-ccu.h headers, but we can't include them since
+     * it would trigger a bunch of warnings for redefinitions of
+     * symbols with the other example.
+     */
+    #define CLK_BUS_HDMI	126
+    #define CLK_BUS_HDCP	137
+    #define CLK_HDMI		123
+    #define CLK_HDMI_SLOW	124
+    #define CLK_HDMI_CEC	125
+    #define CLK_HDCP		136
+    #define RST_BUS_HDMI_SUB	57
+    #define RST_BUS_HDCP	62
+
+    hdmi@6000000 {
+        compatible = "allwinner,sun50i-h6-dw-hdmi";
+        reg = <0x06000000 0x10000>;
+        reg-io-width = <1>;
+        interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&ccu CLK_BUS_HDMI>, <&ccu CLK_HDMI_SLOW>,
+                 <&ccu CLK_HDMI>, <&ccu CLK_HDMI_CEC>,
+                 <&ccu CLK_HDCP>, <&ccu CLK_BUS_HDCP>;
+        clock-names = "iahb", "isfr", "tmds", "cec", "hdcp",
+                      "hdcp-bus";
+        resets = <&ccu RST_BUS_HDMI_SUB>, <&ccu RST_BUS_HDCP>;
+        reset-names = "ctrl", "hdcp";
+        phys = <&hdmi_phy>;
+        phy-names = "phy";
+        pinctrl-names = "default";
+        pinctrl-0 = <&hdmi_pins>;
+        status = "disabled";
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                endpoint {
+                    remote-endpoint = <&tcon_top_hdmi_out_hdmi>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+            };
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-hdmi-phy.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-hdmi-phy.yaml
new file mode 100644
index 000000000000..bba4ffea87ec
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-hdmi-phy.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-hdmi-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A83t HDMI PHY Device Tree Bindings
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <mripard@kernel.org>
+
+properties:
+  "#phy-cells":
+    const: 0
+
+  compatible:
+    enum:
+      - allwinner,sun8i-a83t-hdmi-phy
+      - allwinner,sun8i-h3-hdmi-phy
+      - allwinner,sun8i-r40-hdmi-phy
+      - allwinner,sun50i-a64-hdmi-phy
+      - allwinner,sun50i-h6-hdmi-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 2
+    maxItems: 4
+    items:
+      - description: Bus Clock
+      - description: Module Clock
+      - description: Parent of the PHY clock
+      - description: Second possible parent of the PHY clock
+
+  clock-names:
+    minItems: 2
+    maxItems: 4
+    items:
+      - const: bus
+      - const: mod
+      - const: pll-0
+      - const: pll-1
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: phy
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sun8i-a83t-ccu.h>
+    #include <dt-bindings/reset/sun8i-a83t-ccu.h>
+
+    hdmi_phy: hdmi-phy@1ef0000 {
+        compatible = "allwinner,sun8i-a83t-hdmi-phy";
+        reg = <0x01ef0000 0x10000>;
+        clocks = <&ccu CLK_BUS_HDMI>, <&ccu CLK_HDMI_SLOW>;
+        clock-names = "bus", "mod";
+        resets = <&ccu RST_BUS_HDMI0>;
+        reset-names = "phy";
+        #phy-cells = <0>;
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
new file mode 100644
index 000000000000..4130f5280e10
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
@@ -0,0 +1,258 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/allwinner,sun8i-r40-tcon-top.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner R40 TCON TOP Device Tree Bindings
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <mripard@kernel.org>
+
+description: |
+  TCON TOPs main purpose is to configure whole display pipeline. It
+  determines relationships between mixers and TCONs, selects source
+  TCON for HDMI, muxes LCD and TV encoder GPIO output, selects TV
+  encoder clock source and contains additional TV TCON and DSI gates.
+
+  It allows display pipeline to be configured in very different ways:
+
+                                  / LCD0/LVDS0
+                   / [0] TCON-LCD0
+                   |              \ MIPI DSI
+   mixer0          |
+          \        / [1] TCON-LCD1 - LCD1/LVDS1
+           TCON-TOP
+          /        \ [2] TCON-TV0 [0] - TVE0/RGB
+   mixer1          |                  \
+                   |                   TCON-TOP - HDMI
+                   |                  /
+                   \ [3] TCON-TV1 [1] - TVE1/RGB
+
+  Note that both TCON TOP references same physical unit. Both mixers
+  can be connected to any TCON. Not all TCON TOP variants support all
+  features.
+
+properties:
+  "#clock-cells":
+    const: 1
+
+  compatible:
+    enum:
+      - allwinner,sun8i-r40-tcon-top
+      - allwinner,sun50i-h6-tcon-top
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 2
+    maxItems: 6
+    items:
+      - description: The TCON TOP interface clock
+      - description: The TCON TOP TV0 clock
+      - description: The TCON TOP TVE0 clock
+      - description: The TCON TOP TV1 clock
+      - description: The TCON TOP TVE1 clock
+      - description: The TCON TOP MIPI DSI clock
+
+  clock-names:
+    minItems: 2
+    maxItems: 6
+    items:
+      - const: bus
+      - const: tcon-tv0
+      - const: tve0
+      - const: tcon-tv1
+      - const: tve1
+      - const: dsi
+
+  clock-output-names:
+    minItems: 1
+    maxItems: 3
+    description: >
+      The first item is the name of the clock created for the TV0
+      channel, the second item is the name of the TCON TV1 channel
+      clock and the third one is the name of the DSI channel clock.
+
+  resets:
+    maxItems: 1
+
+  ports:
+    type: object
+    description: |
+      A ports node with endpoint definitions as defined in
+      Documentation/devicetree/bindings/media/video-interfaces.txt. 6
+      ports should be defined:
+        * port 0 is input for mixer0 mux
+        * port 1 is output for mixer0 mux
+        * port 2 is input for mixer1 mux
+        * port 3 is output for mixer1 mux
+        * port 4 is input for HDMI mux
+        * port 5 is output for HDMI mux
+
+      All output endpoints for mixer muxes and input endpoints for
+      HDMI mux should have reg property with the id of the target
+      TCON, as shown in above graph (0-3 for mixer muxes and 0-1 for
+      HDMI mux). All ports should have only one endpoint connected to
+      remote endpoint.
+
+required:
+  - "#clock-cells"
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - clock-output-names
+  - resets
+  - ports
+
+additionalProperties: false
+
+if:
+  properties:
+    compatible:
+      contains:
+        const: allwinner,sun50i-h6-tcon-top
+
+then:
+  clocks:
+    maxItems: 2
+
+  clock-output-names:
+    maxItems: 1
+
+else:
+  clocks:
+    maxItems: 6
+
+  clock-output-names:
+    maxItems: 3
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    #include <dt-bindings/clock/sun8i-r40-ccu.h>
+    #include <dt-bindings/reset/sun8i-r40-ccu.h>
+
+      tcon_top: tcon-top@1c70000 {
+          compatible = "allwinner,sun8i-r40-tcon-top";
+          reg = <0x01c70000 0x1000>;
+          clocks = <&ccu CLK_BUS_TCON_TOP>,
+                   <&ccu CLK_TCON_TV0>,
+                   <&ccu CLK_TVE0>,
+                   <&ccu CLK_TCON_TV1>,
+                   <&ccu CLK_TVE1>,
+                   <&ccu CLK_DSI_DPHY>;
+          clock-names = "bus",
+                        "tcon-tv0",
+                        "tve0",
+                        "tcon-tv1",
+                        "tve1",
+                        "dsi";
+          clock-output-names = "tcon-top-tv0",
+                               "tcon-top-tv1",
+                               "tcon-top-dsi";
+          resets = <&ccu RST_BUS_TCON_TOP>;
+          #clock-cells = <1>;
+
+          ports {
+              #address-cells = <1>;
+              #size-cells = <0>;
+
+              tcon_top_mixer0_in: port@0 {
+                  reg = <0>;
+
+                  tcon_top_mixer0_in_mixer0: endpoint {
+                      remote-endpoint = <&mixer0_out_tcon_top>;
+                  };
+              };
+
+              tcon_top_mixer0_out: port@1 {
+                  #address-cells = <1>;
+                  #size-cells = <0>;
+                  reg = <1>;
+
+                  tcon_top_mixer0_out_tcon_lcd0: endpoint@0 {
+                      reg = <0>;
+                  };
+
+                  tcon_top_mixer0_out_tcon_lcd1: endpoint@1 {
+                      reg = <1>;
+                  };
+
+                  tcon_top_mixer0_out_tcon_tv0: endpoint@2 {
+                      reg = <2>;
+                      remote-endpoint = <&tcon_tv0_in_tcon_top_mixer0>;
+                  };
+
+                  tcon_top_mixer0_out_tcon_tv1: endpoint@3 {
+                      reg = <3>;
+                      remote-endpoint = <&tcon_tv1_in_tcon_top_mixer0>;
+                  };
+              };
+
+              tcon_top_mixer1_in: port@2 {
+                  #address-cells = <1>;
+                  #size-cells = <0>;
+                  reg = <2>;
+
+                  tcon_top_mixer1_in_mixer1: endpoint@1 {
+                      reg = <1>;
+                      remote-endpoint = <&mixer1_out_tcon_top>;
+                  };
+              };
+
+              tcon_top_mixer1_out: port@3 {
+                  #address-cells = <1>;
+                  #size-cells = <0>;
+                  reg = <3>;
+
+                  tcon_top_mixer1_out_tcon_lcd0: endpoint@0 {
+                      reg = <0>;
+                  };
+
+                  tcon_top_mixer1_out_tcon_lcd1: endpoint@1 {
+                      reg = <1>;
+                  };
+
+                  tcon_top_mixer1_out_tcon_tv0: endpoint@2 {
+                      reg = <2>;
+                      remote-endpoint = <&tcon_tv0_in_tcon_top_mixer1>;
+                  };
+
+                  tcon_top_mixer1_out_tcon_tv1: endpoint@3 {
+                      reg = <3>;
+                      remote-endpoint = <&tcon_tv1_in_tcon_top_mixer1>;
+                  };
+              };
+
+              tcon_top_hdmi_in: port@4 {
+                  #address-cells = <1>;
+                  #size-cells = <0>;
+                  reg = <4>;
+
+                  tcon_top_hdmi_in_tcon_tv0: endpoint@0 {
+                      reg = <0>;
+                      remote-endpoint = <&tcon_tv0_out_tcon_top>;
+                  };
+
+                  tcon_top_hdmi_in_tcon_tv1: endpoint@1 {
+                      reg = <1>;
+                      remote-endpoint = <&tcon_tv1_out_tcon_top>;
+                  };
+              };
+
+              tcon_top_hdmi_out: port@5 {
+                  reg = <5>;
+
+                  tcon_top_hdmi_out_hdmi: endpoint {
+                      remote-endpoint = <&hdmi_in_tcon_top>;
+                  };
+              };
+          };
+      };
+
+...
diff --git a/Documentation/devicetree/bindings/display/allwinner,sun9i-a80-deu.yaml b/Documentation/devicetree/bindings/display/allwinner,sun9i-a80-deu.yaml
new file mode 100644
index 000000000000..effc72f628e4
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/allwinner,sun9i-a80-deu.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/allwinner,sun9i-a80-deu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A80 Detail Enhancement Unit Device Tree Bindings
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <mripard@kernel.org>
+
+description: |
+  The DEU (Detail Enhancement Unit), found in the Allwinner A80 SoC,
+  can sharpen the display content in both luma and chroma channels.
+
+properties:
+  compatible:
+    const: allwinner,sun9i-a80-deu
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: The DEU interface clock
+      - description: The DEU module clock
+      - description: The DEU DRAM clock
+
+  clock-names:
+    items:
+      - const: ahb
+      - const: mod
+      - const: ram
+
+  resets:
+    maxItems: 1
+
+  ports:
+    type: object
+    description: |
+      A ports node with endpoint definitions as defined in
+      Documentation/devicetree/bindings/media/video-interfaces.txt. The
+      first port should be the input endpoints, the second one the
+      outputs.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    #include <dt-bindings/clock/sun9i-a80-de.h>
+    #include <dt-bindings/reset/sun9i-a80-de.h>
+
+    deu0: deu@3300000 {
+        compatible = "allwinner,sun9i-a80-deu";
+        reg = <0x03300000 0x40000>;
+        interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&de_clocks CLK_BUS_DEU0>,
+                 <&de_clocks CLK_IEP_DEU0>,
+                 <&de_clocks CLK_DRAM_DEU0>;
+        clock-names = "ahb",
+                      "mod",
+                      "ram";
+        resets = <&de_clocks RST_DEU0>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            deu0_in: port@0 {
+                reg = <0>;
+
+                deu0_in_fe0: endpoint {
+                    remote-endpoint = <&fe0_out_deu0>;
+                };
+            };
+
+            deu0_out: port@1 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <1>;
+
+                deu0_out_be0: endpoint@0 {
+                    reg = <0>;
+                    remote-endpoint = <&be0_in_deu0>;
+                };
+
+                deu0_out_be1: endpoint@1 {
+                    reg = <1>;
+                    remote-endpoint = <&be1_in_deu0>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
deleted file mode 100644
index 31ab72cba3d4..000000000000
--- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
+++ /dev/null
@@ -1,637 +0,0 @@
-Allwinner A10 Display Pipeline
-==============================
-
-The Allwinner A10 Display pipeline is composed of several components
-that are going to be documented below:
-
-For all connections between components up to the TCONs in the display
-pipeline, when there are multiple components of the same type at the
-same depth, the local endpoint ID must be the same as the remote
-component's index. For example, if the remote endpoint is Frontend 1,
-then the local endpoint ID must be 1.
-
-    Frontend 0  [0] ------- [0]  Backend 0  [0] ------- [0]  TCON 0
-		[1] --   -- [1]             [1] --   -- [1]
-		      \ /                         \ /
-		       X                           X
-		      / \                         / \
-		[0] --   -- [0]             [0] --   -- [0]
-    Frontend 1  [1] ------- [1]  Backend 1  [1] ------- [1]  TCON 1
-
-For a two pipeline system such as the one depicted above, the lines
-represent the connections between the components, while the numbers
-within the square brackets corresponds to the ID of the local endpoint.
-
-The same rule also applies to DE 2.0 mixer-TCON connections:
-
-    Mixer 0  [0] ----------- [0]  TCON 0
-	     [1] ----   ---- [1]
-		     \ /
-		      X
-		     / \
-	     [0] ----   ---- [0]
-    Mixer 1  [1] ----------- [1]  TCON 1
-
-HDMI Encoder
-------------
-
-The HDMI Encoder supports the HDMI video and audio outputs, and does
-CEC. It is one end of the pipeline.
-
-Required properties:
-  - compatible: value must be one of:
-    * allwinner,sun4i-a10-hdmi
-    * allwinner,sun5i-a10s-hdmi
-    * allwinner,sun6i-a31-hdmi
-  - reg: base address and size of memory-mapped region
-  - interrupts: interrupt associated to this IP
-  - clocks: phandles to the clocks feeding the HDMI encoder
-    * ahb: the HDMI interface clock
-    * mod: the HDMI module clock
-    * ddc: the HDMI ddc clock (A31 only)
-    * pll-0: the first video PLL
-    * pll-1: the second video PLL
-  - clock-names: the clock names mentioned above
-  - resets: phandle to the reset control for the HDMI encoder (A31 only)
-  - dmas: phandles to the DMA channels used by the HDMI encoder
-    * ddc-tx: The channel for DDC transmission
-    * ddc-rx: The channel for DDC reception
-    * audio-tx: The channel used for audio transmission
-  - dma-names: the channel names mentioned above
-
-  - ports: A ports node with endpoint definitions as defined in
-    Documentation/devicetree/bindings/media/video-interfaces.txt. The
-    first port should be the input endpoint. The second should be the
-    output, usually to an HDMI connector.
-
-DWC HDMI TX Encoder
--------------------
-
-The HDMI transmitter is a Synopsys DesignWare HDMI 1.4 TX controller IP
-with Allwinner's own PHY IP. It supports audio and video outputs and CEC.
-
-These DT bindings follow the Synopsys DWC HDMI TX bindings defined in
-Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt with the
-following device-specific properties.
-
-Required properties:
-
-  - compatible: value must be one of:
-    * "allwinner,sun8i-a83t-dw-hdmi"
-    * "allwinner,sun50i-a64-dw-hdmi", "allwinner,sun8i-a83t-dw-hdmi"
-    * "allwinner,sun50i-h6-dw-hdmi"
-  - reg: base address and size of memory-mapped region
-  - reg-io-width: See dw_hdmi.txt. Shall be 1.
-  - interrupts: HDMI interrupt number
-  - clocks: phandles to the clocks feeding the HDMI encoder
-    * iahb: the HDMI bus clock
-    * isfr: the HDMI register clock
-    * tmds: TMDS clock
-    * cec: HDMI CEC clock (H6 only)
-    * hdcp: HDCP clock (H6 only)
-    * hdcp-bus: HDCP bus clock (H6 only)
-  - clock-names: the clock names mentioned above
-  - resets:
-    * ctrl: HDMI controller reset
-    * hdcp: HDCP reset (H6 only)
-  - reset-names: reset names mentioned above
-  - phys: phandle to the DWC HDMI PHY
-  - phy-names: must be "phy"
-
-  - ports: A ports node with endpoint definitions as defined in
-    Documentation/devicetree/bindings/media/video-interfaces.txt. The
-    first port should be the input endpoint. The second should be the
-    output, usually to an HDMI connector.
-
-Optional properties:
-  - hvcc-supply: the VCC power supply of the controller
-
-DWC HDMI PHY
-------------
-
-Required properties:
-  - compatible: value must be one of:
-    * allwinner,sun8i-a83t-hdmi-phy
-    * allwinner,sun8i-h3-hdmi-phy
-    * allwinner,sun8i-r40-hdmi-phy
-    * allwinner,sun50i-a64-hdmi-phy
-    * allwinner,sun50i-h6-hdmi-phy
-  - reg: base address and size of memory-mapped region
-  - clocks: phandles to the clocks feeding the HDMI PHY
-    * bus: the HDMI PHY interface clock
-    * mod: the HDMI PHY module clock
-  - clock-names: the clock names mentioned above
-  - resets: phandle to the reset controller driving the PHY
-  - reset-names: must be "phy"
-
-H3, A64 and R40 HDMI PHY require additional clocks:
-  - pll-0: parent of phy clock
-  - pll-1: second possible phy clock parent (A64/R40 only)
-
-TV Encoder
-----------
-
-The TV Encoder supports the composite and VGA output. It is one end of
-the pipeline.
-
-Required properties:
- - compatible: value should be "allwinner,sun4i-a10-tv-encoder".
- - reg: base address and size of memory-mapped region
- - clocks: the clocks driving the TV encoder
- - resets: phandle to the reset controller driving the encoder
-
-- ports: A ports node with endpoint definitions as defined in
-  Documentation/devicetree/bindings/media/video-interfaces.txt. The
-  first port should be the input endpoint.
-
-TCON
-----
-
-The TCON acts as a timing controller for RGB, LVDS and TV interfaces.
-
-Required properties:
- - compatible: value must be either:
-   * allwinner,sun4i-a10-tcon
-   * allwinner,sun5i-a13-tcon
-   * allwinner,sun6i-a31-tcon
-   * allwinner,sun6i-a31s-tcon
-   * allwinner,sun7i-a20-tcon
-   * allwinner,sun8i-a23-tcon
-   * allwinner,sun8i-a33-tcon
-   * allwinner,sun8i-a83t-tcon-lcd
-   * allwinner,sun8i-a83t-tcon-tv
-   * allwinner,sun8i-r40-tcon-tv
-   * allwinner,sun8i-v3s-tcon
-   * allwinner,sun9i-a80-tcon-lcd
-   * allwinner,sun9i-a80-tcon-tv
-   * "allwinner,sun50i-a64-tcon-lcd", "allwinner,sun8i-a83t-tcon-lcd"
-   * "allwinner,sun50i-a64-tcon-tv", "allwinner,sun8i-a83t-tcon-tv"
-   * allwinner,sun50i-h6-tcon-tv, allwinner,sun8i-r40-tcon-tv
- - reg: base address and size of memory-mapped region
- - interrupts: interrupt associated to this IP
- - clocks: phandles to the clocks feeding the TCON.
-   - 'ahb': the interface clocks
-   - 'tcon-ch0': The clock driving the TCON channel 0, if supported
- - resets: phandles to the reset controllers driving the encoder
-   - "lcd": the reset line for the TCON
-   - "edp": the reset line for the eDP block (A80 only)
-
- - clock-names: the clock names mentioned above
- - reset-names: the reset names mentioned above
- - clock-output-names: Name of the pixel clock created, if TCON supports
-   channel 0.
-
-- ports: A ports node with endpoint definitions as defined in
-  Documentation/devicetree/bindings/media/video-interfaces.txt. The
-  first port should be the input endpoint, the second one the output
-
-  The output may have multiple endpoints. TCON can have 1 or 2 channels,
-  usually with the first channel being used for the panels interfaces
-  (RGB, LVDS, etc.), and the second being used for the outputs that
-  require another controller (TV Encoder, HDMI, etc.). The endpoints
-  will take an extra property, allwinner,tcon-channel, to specify the
-  channel the endpoint is associated to. If that property is not
-  present, the endpoint number will be used as the channel number.
-
-For TCONs with channel 0, there is one more clock required:
-   - 'tcon-ch0': The clock driving the TCON channel 0
-For TCONs with channel 1, there is one more clock required:
-   - 'tcon-ch1': The clock driving the TCON channel 1
-
-When TCON support LVDS (all TCONs except TV TCONs on A83T, R40 and those found
-in A13, H3, H5 and V3s SoCs), you need one more reset line:
-   - 'lvds': The reset line driving the LVDS logic
-
-And on the A23, A31, A31s and A33, you need one more clock line:
-   - 'lvds-alt': An alternative clock source, separate from the TCON channel 0
-                 clock, that can be used to drive the LVDS clock
-
-TCON TOP
---------
-
-TCON TOPs main purpose is to configure whole display pipeline. It determines
-relationships between mixers and TCONs, selects source TCON for HDMI, muxes
-LCD and TV encoder GPIO output, selects TV encoder clock source and contains
-additional TV TCON and DSI gates.
-
-It allows display pipeline to be configured in very different ways:
-
-                                / LCD0/LVDS0
-                 / [0] TCON-LCD0
-                 |              \ MIPI DSI
- mixer0          |
-        \        / [1] TCON-LCD1 - LCD1/LVDS1
-         TCON-TOP
-        /        \ [2] TCON-TV0 [0] - TVE0/RGB
- mixer1          |                  \
-                 |                   TCON-TOP - HDMI
-                 |                  /
-                 \ [3] TCON-TV1 [1] - TVE1/RGB
-
-Note that both TCON TOP references same physical unit. Both mixers can be
-connected to any TCON. Not all TCON TOP variants support all features.
-
-Required properties:
-  - compatible: value must be one of:
-    * allwinner,sun8i-r40-tcon-top
-    * allwinner,sun50i-h6-tcon-top
-  - reg: base address and size of the memory-mapped region.
-  - clocks: phandle to the clocks feeding the TCON TOP
-    * bus: TCON TOP interface clock
-    * tcon-tv0: TCON TV0 clock
-    * tve0: TVE0 clock (R40 only)
-    * tcon-tv1: TCON TV1 clock (R40 only)
-    * tve1: TVE0 clock (R40 only)
-    * dsi: MIPI DSI clock (R40 only)
-  - clock-names: clock name mentioned above
-  - resets: phandle to the reset line driving the TCON TOP
-  - #clock-cells : must contain 1
-  - clock-output-names: Names of clocks created for TCON TV0 channel clock,
-    TCON TV1 channel clock (R40 only) and DSI channel clock (R40 only), in
-    that order.
-
-- ports: A ports node with endpoint definitions as defined in
-    Documentation/devicetree/bindings/media/video-interfaces.txt. 6 ports should
-    be defined:
-    * port 0 is input for mixer0 mux
-    * port 1 is output for mixer0 mux
-    * port 2 is input for mixer1 mux
-    * port 3 is output for mixer1 mux
-    * port 4 is input for HDMI mux
-    * port 5 is output for HDMI mux
-    All output endpoints for mixer muxes and input endpoints for HDMI mux should
-    have reg property with the id of the target TCON, as shown in above graph
-    (0-3 for mixer muxes and 0-1 for HDMI mux). All ports should have only one
-    endpoint connected to remote endpoint.
-
-DRC
----
-
-The DRC (Dynamic Range Controller), found in the latest Allwinner SoCs
-(A31, A23, A33, A80), allows to dynamically adjust pixel
-brightness/contrast based on histogram measurements for LCD content
-adaptive backlight control.
-
-
-Required properties:
-  - compatible: value must be one of:
-    * allwinner,sun6i-a31-drc
-    * allwinner,sun6i-a31s-drc
-    * allwinner,sun8i-a23-drc
-    * allwinner,sun8i-a33-drc
-    * allwinner,sun9i-a80-drc
-  - reg: base address and size of the memory-mapped region.
-  - interrupts: interrupt associated to this IP
-  - clocks: phandles to the clocks feeding the DRC
-    * ahb: the DRC interface clock
-    * mod: the DRC module clock
-    * ram: the DRC DRAM clock
-  - clock-names: the clock names mentioned above
-  - resets: phandles to the reset line driving the DRC
-
-- ports: A ports node with endpoint definitions as defined in
-  Documentation/devicetree/bindings/media/video-interfaces.txt. The
-  first port should be the input endpoints, the second one the outputs
-
-Display Engine Backend
-----------------------
-
-The display engine backend exposes layers and sprites to the
-system.
-
-Required properties:
-  - compatible: value must be one of:
-    * allwinner,sun4i-a10-display-backend
-    * allwinner,sun5i-a13-display-backend
-    * allwinner,sun6i-a31-display-backend
-    * allwinner,sun7i-a20-display-backend
-    * allwinner,sun8i-a23-display-backend
-    * allwinner,sun8i-a33-display-backend
-    * allwinner,sun9i-a80-display-backend
-  - reg: base address and size of the memory-mapped region.
-  - interrupts: interrupt associated to this IP
-  - clocks: phandles to the clocks feeding the frontend and backend
-    * ahb: the backend interface clock
-    * mod: the backend module clock
-    * ram: the backend DRAM clock
-  - clock-names: the clock names mentioned above
-  - resets: phandles to the reset controllers driving the backend
-
-- ports: A ports node with endpoint definitions as defined in
-  Documentation/devicetree/bindings/media/video-interfaces.txt. The
-  first port should be the input endpoints, the second one the output
-
-On the A33, some additional properties are required:
-  - reg needs to have an additional region corresponding to the SAT
-  - reg-names need to be set, with "be" and "sat"
-  - clocks and clock-names need to have a phandle to the SAT bus
-    clocks, whose name will be "sat"
-  - resets and reset-names need to have a phandle to the SAT bus
-    resets, whose name will be "sat"
-
-DEU
----
-
-The DEU (Detail Enhancement Unit), found in the Allwinner A80 SoC,
-can sharpen the display content in both luma and chroma channels.
-
-Required properties:
-  - compatible: value must be one of:
-    * allwinner,sun9i-a80-deu
-  - reg: base address and size of the memory-mapped region.
-  - interrupts: interrupt associated to this IP
-  - clocks: phandles to the clocks feeding the DEU
-    * ahb: the DEU interface clock
-    * mod: the DEU module clock
-    * ram: the DEU DRAM clock
-  - clock-names: the clock names mentioned above
-  - resets: phandles to the reset line driving the DEU
-
-- ports: A ports node with endpoint definitions as defined in
-  Documentation/devicetree/bindings/media/video-interfaces.txt. The
-  first port should be the input endpoints, the second one the outputs
-
-Display Engine Frontend
------------------------
-
-The display engine frontend does formats conversion, scaling,
-deinterlacing and color space conversion.
-
-Required properties:
-  - compatible: value must be one of:
-    * allwinner,sun4i-a10-display-frontend
-    * allwinner,sun5i-a13-display-frontend
-    * allwinner,sun6i-a31-display-frontend
-    * allwinner,sun7i-a20-display-frontend
-    * allwinner,sun8i-a23-display-frontend
-    * allwinner,sun8i-a33-display-frontend
-    * allwinner,sun9i-a80-display-frontend
-  - reg: base address and size of the memory-mapped region.
-  - interrupts: interrupt associated to this IP
-  - clocks: phandles to the clocks feeding the frontend and backend
-    * ahb: the backend interface clock
-    * mod: the backend module clock
-    * ram: the backend DRAM clock
-  - clock-names: the clock names mentioned above
-  - resets: phandles to the reset controllers driving the backend
-
-- ports: A ports node with endpoint definitions as defined in
-  Documentation/devicetree/bindings/media/video-interfaces.txt. The
-  first port should be the input endpoints, the second one the outputs
-
-Display Engine 2.0 Mixer
-------------------------
-
-The DE2 mixer have many functionalities, currently only layer blending is
-supported.
-
-Required properties:
-  - compatible: value must be one of:
-    * allwinner,sun8i-a83t-de2-mixer-0
-    * allwinner,sun8i-a83t-de2-mixer-1
-    * allwinner,sun8i-h3-de2-mixer-0
-    * allwinner,sun8i-r40-de2-mixer-0
-    * allwinner,sun8i-r40-de2-mixer-1
-    * allwinner,sun8i-v3s-de2-mixer
-    * allwinner,sun50i-a64-de2-mixer-0
-    * allwinner,sun50i-a64-de2-mixer-1
-    * allwinner,sun50i-h6-de3-mixer-0
-  - reg: base address and size of the memory-mapped region.
-  - clocks: phandles to the clocks feeding the mixer
-    * bus: the mixer interface clock
-    * mod: the mixer module clock
-  - clock-names: the clock names mentioned above
-  - resets: phandles to the reset controllers driving the mixer
-
-- ports: A ports node with endpoint definitions as defined in
-  Documentation/devicetree/bindings/media/video-interfaces.txt. The
-  first port should be the input endpoints, the second one the output
-
-
-Display Engine Pipeline
------------------------
-
-The display engine pipeline (and its entry point, since it can be
-either directly the backend or the frontend) is represented as an
-extra node.
-
-Required properties:
-  - compatible: value must be one of:
-    * allwinner,sun4i-a10-display-engine
-    * allwinner,sun5i-a10s-display-engine
-    * allwinner,sun5i-a13-display-engine
-    * allwinner,sun6i-a31-display-engine
-    * allwinner,sun6i-a31s-display-engine
-    * allwinner,sun7i-a20-display-engine
-    * allwinner,sun8i-a23-display-engine
-    * allwinner,sun8i-a33-display-engine
-    * allwinner,sun8i-a83t-display-engine
-    * allwinner,sun8i-h3-display-engine
-    * allwinner,sun8i-r40-display-engine
-    * allwinner,sun8i-v3s-display-engine
-    * allwinner,sun9i-a80-display-engine
-    * allwinner,sun50i-a64-display-engine
-    * allwinner,sun50i-h6-display-engine
-
-  - allwinner,pipelines: list of phandle to the display engine
-    frontends (DE 1.0) or mixers (DE 2.0/3.0) available.
-
-Example:
-
-panel: panel {
-	compatible = "olimex,lcd-olinuxino-43-ts";
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	port {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		panel_input: endpoint {
-			remote-endpoint = <&tcon0_out_panel>;
-		};
-	};
-};
-
-connector {
-	compatible = "hdmi-connector";
-	type = "a";
-
-	port {
-		hdmi_con_in: endpoint {
-			remote-endpoint = <&hdmi_out_con>;
-		};
-	};
-};
-
-hdmi: hdmi@1c16000 {
-	compatible = "allwinner,sun5i-a10s-hdmi";
-	reg = <0x01c16000 0x1000>;
-	interrupts = <58>;
-	clocks = <&ccu CLK_AHB_HDMI>, <&ccu CLK_HDMI>,
-		 <&ccu CLK_PLL_VIDEO0_2X>,
-		 <&ccu CLK_PLL_VIDEO1_2X>;
-	clock-names = "ahb", "mod", "pll-0", "pll-1";
-	dmas = <&dma SUN4I_DMA_NORMAL 16>,
-	       <&dma SUN4I_DMA_NORMAL 16>,
-	       <&dma SUN4I_DMA_DEDICATED 24>;
-	dma-names = "ddc-tx", "ddc-rx", "audio-tx";
-
-	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		port@0 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <0>;
-
-			hdmi_in_tcon0: endpoint {
-				remote-endpoint = <&tcon0_out_hdmi>;
-			};
-		};
-
-		port@1 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <1>;
-
-			hdmi_out_con: endpoint {
-				remote-endpoint = <&hdmi_con_in>;
-			};
-		};
-	};
-};
-
-tve0: tv-encoder@1c0a000 {
-	compatible = "allwinner,sun4i-a10-tv-encoder";
-	reg = <0x01c0a000 0x1000>;
-	clocks = <&ahb_gates 34>;
-	resets = <&tcon_ch0_clk 0>;
-
-	port {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		tve0_in_tcon0: endpoint@0 {
-			reg = <0>;
-			remote-endpoint = <&tcon0_out_tve0>;
-		};
-	};
-};
-
-tcon0: lcd-controller@1c0c000 {
-	compatible = "allwinner,sun5i-a13-tcon";
-	reg = <0x01c0c000 0x1000>;
-	interrupts = <44>;
-	resets = <&tcon_ch0_clk 1>;
-	reset-names = "lcd";
-	clocks = <&ahb_gates 36>,
-		 <&tcon_ch0_clk>,
-		 <&tcon_ch1_clk>;
-	clock-names = "ahb",
-		      "tcon-ch0",
-		      "tcon-ch1";
-	clock-output-names = "tcon-pixel-clock";
-
-	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		tcon0_in: port@0 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <0>;
-
-			tcon0_in_be0: endpoint@0 {
-				reg = <0>;
-				remote-endpoint = <&be0_out_tcon0>;
-			};
-		};
-
-		tcon0_out: port@1 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <1>;
-
-			tcon0_out_panel: endpoint@0 {
-				reg = <0>;
-				remote-endpoint = <&panel_input>;
-			};
-
-			tcon0_out_tve0: endpoint@1 {
-				reg = <1>;
-				remote-endpoint = <&tve0_in_tcon0>;
-			};
-		};
-	};
-};
-
-fe0: display-frontend@1e00000 {
-	compatible = "allwinner,sun5i-a13-display-frontend";
-	reg = <0x01e00000 0x20000>;
-	interrupts = <47>;
-	clocks = <&ahb_gates 46>, <&de_fe_clk>,
-		 <&dram_gates 25>;
-	clock-names = "ahb", "mod",
-		      "ram";
-	resets = <&de_fe_clk>;
-
-	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		fe0_out: port@1 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <1>;
-
-			fe0_out_be0: endpoint {
-				remote-endpoint = <&be0_in_fe0>;
-			};
-		};
-	};
-};
-
-be0: display-backend@1e60000 {
-	compatible = "allwinner,sun5i-a13-display-backend";
-	reg = <0x01e60000 0x10000>;
-	interrupts = <47>;
-	clocks = <&ahb_gates 44>, <&de_be_clk>,
-		 <&dram_gates 26>;
-	clock-names = "ahb", "mod",
-		      "ram";
-	resets = <&de_be_clk>;
-
-	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		be0_in: port@0 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <0>;
-
-			be0_in_fe0: endpoint@0 {
-				reg = <0>;
-				remote-endpoint = <&fe0_out_be0>;
-			};
-		};
-
-		be0_out: port@1 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <1>;
-
-			be0_out_tcon0: endpoint@0 {
-				reg = <0>;
-				remote-endpoint = <&tcon0_in_be0>;
-			};
-		};
-	};
-};
-
-display-engine {
-	compatible = "allwinner,sun5i-a13-display-engine";
-	allwinner,pipelines = <&fe0>;
-};
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
