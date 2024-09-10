Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC27972D33
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 11:15:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6AFF10E723;
	Tue, 10 Sep 2024 09:15:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="F0zsK2ih";
	dkim=pass (1024-bit key; unprotected) header.d=amazonses.com header.i=@amazonses.com header.b="HabZD/ue";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 814 seconds by postgrey-1.36 at gabe;
 Tue, 10 Sep 2024 09:15:16 UTC
Received: from a7-32.smtp-out.eu-west-1.amazonses.com
 (a7-32.smtp-out.eu-west-1.amazonses.com [54.240.7.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0444110E723
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 09:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1725958900;
 h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=OmatCxgesJnjo+fAi+/kdWH2x8KHlx2dhvmwXtONBbg=;
 b=F0zsK2ihdZtmROZZ6NkavKgoGVBXTTgHuYT63daVjWVm7u95LMDHpTtOl+415f89
 1CPlQXxNZFozy+RWPoy8iiHQlahatqWlT8x8A3yoAidqANLNrM0lEhYHn1y6oXgHQ6z
 P8uUJToPLATRNb6vPPFQ1m3sL/VCjCt7UL4mHxzcyk4I+aNnJKep804xO+lbV6wwxV3
 FOvGxAEH5BpPIHwFmDKIqGIP0ErssHREtO8Gh0JEziF2LaaGyla1MlJaWe9n1iXnC5A
 d2NQEVUTi3nCf4oGgsq/BhohJAc31gF9vX7TbW6pqYwmNMW0fHD4d216IzJq3drm6UK
 bnWrccNTHA==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1725958900;
 h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID;
 bh=OmatCxgesJnjo+fAi+/kdWH2x8KHlx2dhvmwXtONBbg=;
 b=HabZD/ueiM2mizNgaDIPAcGLOnS8KXta21Pfje2qrW9LbDEeilgIhBsjQBMjUyY/
 v1kwvFgS1EC+Bqp1vPxDuKJziR7WylsB8y4xqIYp6wfU6Cp0y2+LL8eBNRQ/Pt4TxEW
 x0DlWqt0b8FbUkYzCVsazyii9knl+q7usDzbV3pc=
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, shawn.sung@mediatek.com, 
 yu-chang.lee@mediatek.com, ck.hu@mediatek.com, 
 jitao.shi@mediatek.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, wenst@chromium.org, 
 kernel@collabora.com, sui.jingfeng@linux.dev, michael@walle.cc, 
 sjoerd@collabora.com, Alexandre Mergnat <amergnat@baylibre.com>, 
 Michael Walle <mwalle@kernel.org>
Subject: [PATCH v9 1/3] dt-bindings: display: mediatek: Add OF graph support
 for board path
Date: Tue, 10 Sep 2024 09:01:40 +0000
Message-ID: <01020191db2acc04-e089f151-ea7f-4cd3-8179-6f3552ee6966-000000@eu-west-1.amazonses.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240910090127.78905-1-angelogioacchino.delregno@collabora.com>
References: <20240910090127.78905-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.10-54.240.7.32
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The display IPs in MediaTek SoCs support being interconnected with
different instances of DDP IPs (for example, merge0 or merge1) and/or
with different DDP IPs (for example, rdma can be connected with either
color, dpi, dsi, merge, etc), forming a full Display Data Path that
ends with an actual display.

The final display pipeline is effectively board specific, as it does
depend on the display that is attached to it, and eventually on the
sensors supported by the board (for example, Adaptive Ambient Light
would need an Ambient Light Sensor, otherwise it's pointless!), other
than the output type.

Add support for OF graphs to most of the MediaTek DDP (display) bindings
to add flexibility to build custom hardware paths, hence enabling board
specific configuration of the display pipeline and allowing to finally
migrate away from using hardcoded paths.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Tested-by: Alexandre Mergnat <amergnat@baylibre.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Tested-by: Michael Walle <mwalle@kernel.org> # on kontron-sbc-i1200
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../arm/mediatek/mediatek,mmsys.yaml.orig     | 140 ++++++++++
 .../display/mediatek/mediatek,aal.yaml        |  40 +++
 .../display/mediatek/mediatek,aal.yaml.orig   |  93 +++++++
 .../display/mediatek/mediatek,ccorr.yaml      |  21 ++
 .../display/mediatek/mediatek,ccorr.yaml.orig |  88 ++++++
 .../display/mediatek/mediatek,color.yaml      |  22 ++
 .../display/mediatek/mediatek,color.yaml.orig |  96 +++++++
 .../display/mediatek/mediatek,dither.yaml     |  22 ++
 .../mediatek/mediatek,dither.yaml.orig        |  87 ++++++
 .../display/mediatek/mediatek,dpi.yaml        |  25 +-
 .../display/mediatek/mediatek,dpi.yaml.orig   | 122 +++++++++
 .../display/mediatek/mediatek,dsc.yaml        |  24 ++
 .../display/mediatek/mediatek,dsi.yaml        |  27 +-
 .../display/mediatek/mediatek,dsi.yaml.orig   | 126 +++++++++
 .../display/mediatek/mediatek,ethdr.yaml      |  22 ++
 .../display/mediatek/mediatek,gamma.yaml      |  19 ++
 .../display/mediatek/mediatek,gamma.yaml.orig |  96 +++++++
 .../display/mediatek/mediatek,merge.yaml      |  23 ++
 .../display/mediatek/mediatek,merge.yaml.orig | 110 ++++++++
 .../display/mediatek/mediatek,od.yaml         |  22 ++
 .../display/mediatek/mediatek,ovl-2l.yaml     |  22 ++
 .../mediatek/mediatek,ovl-2l.yaml.orig        |  78 ++++++
 .../display/mediatek/mediatek,ovl.yaml        |  22 ++
 .../display/mediatek/mediatek,ovl.yaml.orig   | 109 ++++++++
 .../display/mediatek/mediatek,postmask.yaml   |  21 ++
 .../display/mediatek/mediatek,rdma.yaml       |  22 ++
 .../display/mediatek/mediatek,rdma.yaml.orig  | 122 +++++++++
 .../display/mediatek/mediatek,ufoe.yaml       |  21 ++
 .../display/mediatek/mediatek,wdma.yaml.orig  |  76 ++++++
 .../bindings/gpu/arm,mali-bifrost.yaml.orig   | 250 ++++++++++++++++++
 .../bindings/leds/leds-mt6323.txt.orig        |  60 +++++
 .../bindings/ufs/mediatek,ufs.yaml.orig       |  71 +++++
 32 files changed, 2096 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml.orig
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml.orig
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml.orig
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml.orig
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml.orig
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml.orig
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml.orig
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml.orig
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml.orig
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml.orig
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml.orig
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml.orig
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml.orig
 create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml.orig
 create mode 100644 Documentation/devicetree/bindings/leds/leds-mt6323.txt.orig
 create mode 100644 Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml.orig

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml.orig b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml.orig
new file mode 100644
index 000000000000..90758bb5bcb1
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml.orig
@@ -0,0 +1,140 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek mmsys controller
+
+maintainers:
+  - Matthias Brugger <matthias.bgg@gmail.com>
+
+description:
+  The MediaTek mmsys system controller provides clock control, routing control,
+  and miscellaneous control in mmsys partition.
+
+properties:
+  $nodename:
+    pattern: "^syscon@[0-9a-f]+$"
+
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - mediatek,mt2701-mmsys
+              - mediatek,mt2712-mmsys
+              - mediatek,mt6765-mmsys
+              - mediatek,mt6779-mmsys
+              - mediatek,mt6795-mmsys
+              - mediatek,mt6797-mmsys
+              - mediatek,mt8167-mmsys
+              - mediatek,mt8173-mmsys
+              - mediatek,mt8183-mmsys
+              - mediatek,mt8186-mmsys
+              - mediatek,mt8188-vdosys0
+              - mediatek,mt8188-vdosys1
+              - mediatek,mt8188-vppsys0
+              - mediatek,mt8188-vppsys1
+              - mediatek,mt8192-mmsys
+              - mediatek,mt8195-vdosys1
+              - mediatek,mt8195-vppsys0
+              - mediatek,mt8195-vppsys1
+              - mediatek,mt8365-mmsys
+          - const: syscon
+
+      - description: vdosys0 and vdosys1 are 2 display HW pipelines,
+                     so mt8195 binding should be deprecated.
+        deprecated: true
+        items:
+          - const: mediatek,mt8195-mmsys
+          - const: syscon
+
+      - items:
+          - const: mediatek,mt7623-mmsys
+          - const: mediatek,mt2701-mmsys
+          - const: syscon
+
+      - items:
+          - const: mediatek,mt8195-vdosys0
+          - const: mediatek,mt8195-mmsys
+          - const: syscon
+
+  reg:
+    maxItems: 1
+
+  power-domains:
+    description:
+      A phandle and PM domain specifier as defined by bindings
+      of the power controller specified by phandle. See
+      Documentation/devicetree/bindings/power/power-domain.yaml for details.
+
+  mboxes:
+    description:
+      Using mailbox to communicate with GCE, it should have this
+      property and list of phandle, mailbox specifiers. See
+      Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
+      for details.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+
+  mediatek,gce-client-reg:
+    description:
+      The register of client driver can be configured by gce with 4 arguments
+      defined in this property, such as phandle of gce, subsys id,
+      register offset and size.
+      Each subsys id is mapping to a base address of display function blocks
+      register which is defined in the gce header
+      include/dt-bindings/gce/<chip>-gce.h.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      Output port node. This port connects the MMSYS/VDOSYS output to
+      the first component of one display pipeline, for example one of
+      the available OVL or RDMA blocks.
+      Some MediaTek SoCs support up to three display outputs per MMSYS.
+    properties:
+      endpoint@0:
+        $ref: /schemas/graph.yaml#/properties/endpoint
+        description: Output to the primary display pipeline
+
+      endpoint@1:
+        $ref: /schemas/graph.yaml#/properties/endpoint
+        description: Output to the secondary display pipeline
+
+      endpoint@2:
+        $ref: /schemas/graph.yaml#/properties/endpoint
+        description: Output to the tertiary display pipeline
+
+      required:
+        - endpoint@0
+
+required:
+  - compatible
+  - reg
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/power/mt8173-power.h>
+    #include <dt-bindings/gce/mt8173-gce.h>
+
+    mmsys: syscon@14000000 {
+        compatible = "mediatek,mt8173-mmsys", "syscon";
+        reg = <0x14000000 0x1000>;
+        power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        mboxes = <&gce 0 CMDQ_THR_PRIO_HIGHEST>,
+                 <&gce 1 CMDQ_THR_PRIO_HIGHEST>;
+        mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
+    };
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
index cf24434854ff..47ddba5c41af 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
@@ -62,6 +62,27 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     maxItems: 1
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description:
+      Input and output ports can have multiple endpoints, each of those
+      connects to either the primary, secondary, etc, display pipeline.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: AAL input port
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          AAL output to the next component's input, for example could be one
+          of many gamma, overdrive or other blocks.
+
+    required:
+      - port@0
+      - port@1
+
 required:
   - compatible
   - reg
@@ -89,5 +110,24 @@ examples:
            power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
            clocks = <&mmsys CLK_MM_DISP_AAL>;
            mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x5000 0x1000>;
+
+           ports {
+               #address-cells = <1>;
+               #size-cells = <0>;
+
+               port@0 {
+                   reg = <0>;
+                   aal0_in: endpoint {
+                       remote-endpoint = <&ccorr0_out>;
+                   };
+               };
+
+               port@1 {
+                   reg = <1>;
+                   aal0_out: endpoint {
+                       remote-endpoint = <&gamma0_in>;
+                   };
+               };
+           };
        };
     };
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml.orig b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml.orig
new file mode 100644
index 000000000000..cf24434854ff
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml.orig
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,aal.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek display adaptive ambient light processor
+
+maintainers:
+  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
+  - Philipp Zabel <p.zabel@pengutronix.de>
+
+description: |
+  Mediatek display adaptive ambient light processor, namely AAL,
+  is responsible for backlight power saving and sunlight visibility improving.
+  AAL device node must be siblings to the central MMSYS_CONFIG node.
+  For a description of the MMSYS_CONFIG binding, see
+  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+  for details.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - mediatek,mt8173-disp-aal
+          - mediatek,mt8183-disp-aal
+          - mediatek,mt8195-mdp3-aal
+      - items:
+          - enum:
+              - mediatek,mt2712-disp-aal
+              - mediatek,mt6795-disp-aal
+          - const: mediatek,mt8173-disp-aal
+      - items:
+          - enum:
+              - mediatek,mt8186-disp-aal
+              - mediatek,mt8188-disp-aal
+              - mediatek,mt8192-disp-aal
+              - mediatek,mt8195-disp-aal
+              - mediatek,mt8365-disp-aal
+          - const: mediatek,mt8183-disp-aal
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    description: A phandle and PM domain specifier as defined by bindings of
+      the power controller specified by phandle. See
+      Documentation/devicetree/bindings/power/power-domain.yaml for details.
+
+  clocks:
+    items:
+      - description: AAL Clock
+
+  mediatek,gce-client-reg:
+    description: The register of client driver can be configured by gce with
+      4 arguments defined in this property, such as phandle of gce, subsys id,
+      register offset and size. Each GCE subsys id is mapping to a client
+      defined in the header include/dt-bindings/gce/<chip>-gce.h.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/power/mt8173-power.h>
+    #include <dt-bindings/gce/mt8173-gce.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        aal@14015000 {
+           compatible = "mediatek,mt8173-disp-aal";
+           reg = <0 0x14015000 0 0x1000>;
+           interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_LOW>;
+           power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+           clocks = <&mmsys CLK_MM_DISP_AAL>;
+           mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x5000 0x1000>;
+       };
+    };
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
index 9f8366763831..fca8e7bb0cbc 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
@@ -57,6 +57,27 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     maxItems: 1
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description:
+      Input and output ports can have multiple endpoints, each of those
+      connects to either the primary, secondary, etc, display pipeline.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: CCORR input port
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          CCORR output to the input of the next desired component in the
+          display pipeline, usually only one of the available AAL blocks.
+
+    required:
+      - port@0
+      - port@1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml.orig b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml.orig
new file mode 100644
index 000000000000..9f8366763831
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml.orig
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,ccorr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek display color correction
+
+maintainers:
+  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
+  - Philipp Zabel <p.zabel@pengutronix.de>
+
+description: |
+  Mediatek display color correction, namely CCORR, reproduces correct color
+  on panels with different color gamut.
+  CCORR device node must be siblings to the central MMSYS_CONFIG node.
+  For a description of the MMSYS_CONFIG binding, see
+  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+  for details.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - mediatek,mt8183-disp-ccorr
+          - mediatek,mt8192-disp-ccorr
+      - items:
+          - const: mediatek,mt8365-disp-ccorr
+          - const: mediatek,mt8183-disp-ccorr
+      - items:
+          - enum:
+              - mediatek,mt8186-disp-ccorr
+              - mediatek,mt8188-disp-ccorr
+              - mediatek,mt8195-disp-ccorr
+          - const: mediatek,mt8192-disp-ccorr
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    description: A phandle and PM domain specifier as defined by bindings of
+      the power controller specified by phandle. See
+      Documentation/devicetree/bindings/power/power-domain.yaml for details.
+
+  clocks:
+    items:
+      - description: CCORR Clock
+
+  mediatek,gce-client-reg:
+    description: The register of client driver can be configured by gce with
+      4 arguments defined in this property, such as phandle of gce, subsys id,
+      register offset and size. Each GCE subsys id is mapping to a client
+      defined in the header include/dt-bindings/gce/<chip>-gce.h.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8183-clk.h>
+    #include <dt-bindings/power/mt8183-power.h>
+    #include <dt-bindings/gce/mt8183-gce.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        ccorr0: ccorr@1400f000 {
+            compatible = "mediatek,mt8183-disp-ccorr";
+            reg = <0 0x1400f000 0 0x1000>;
+            interrupts = <GIC_SPI 232 IRQ_TYPE_LEVEL_LOW>;
+            power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
+            clocks = <&mmsys CLK_MM_DISP_CCORR0>;
+            mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xf000 0x1000>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
index 7df786bbad20..6160439ce4d7 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
@@ -65,6 +65,28 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     maxItems: 1
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description:
+      Input and output ports can have multiple endpoints, each of those
+      connects to either the primary, secondary, etc, display pipeline.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: COLOR input port
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          COLOR output to the input of the next desired component in the
+          display pipeline, for example one of the available CCORR or AAL
+          blocks.
+
+    required:
+      - port@0
+      - port@1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml.orig b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml.orig
new file mode 100644
index 000000000000..7df786bbad20
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml.orig
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek display color processor
+
+maintainers:
+  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
+  - Philipp Zabel <p.zabel@pengutronix.de>
+
+description: |
+  Mediatek display color processor, namely COLOR, provides hue, luma and
+  saturation adjustments to get better picture quality and to have one panel
+  resemble the other in their output characteristics.
+  COLOR device node must be siblings to the central MMSYS_CONFIG node.
+  For a description of the MMSYS_CONFIG binding, see
+  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+  for details.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - mediatek,mt2701-disp-color
+          - mediatek,mt8167-disp-color
+          - mediatek,mt8173-disp-color
+          - mediatek,mt8195-mdp3-color
+      - items:
+          - enum:
+              - mediatek,mt7623-disp-color
+              - mediatek,mt2712-disp-color
+          - const: mediatek,mt2701-disp-color
+      - items:
+          - enum:
+              - mediatek,mt6795-disp-color
+              - mediatek,mt8183-disp-color
+              - mediatek,mt8186-disp-color
+              - mediatek,mt8188-disp-color
+              - mediatek,mt8192-disp-color
+              - mediatek,mt8195-disp-color
+              - mediatek,mt8365-disp-color
+          - const: mediatek,mt8173-disp-color
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    description: A phandle and PM domain specifier as defined by bindings of
+      the power controller specified by phandle. See
+      Documentation/devicetree/bindings/power/power-domain.yaml for details.
+
+  clocks:
+    items:
+      - description: COLOR Clock
+
+  mediatek,gce-client-reg:
+    description: The register of client driver can be configured by gce with
+      4 arguments defined in this property, such as phandle of gce, subsys id,
+      register offset and size. Each GCE subsys id is mapping to a client
+      defined in the header include/dt-bindings/gce/<chip>-gce.h.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/power/mt8173-power.h>
+    #include <dt-bindings/gce/mt8173-gce.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        color0: color@14013000 {
+            compatible = "mediatek,mt8173-disp-color";
+            reg = <0 0x14013000 0 0x1000>;
+            interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_LOW>;
+            power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+            clocks = <&mmsys CLK_MM_DISP_COLOR0>;
+            mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x3000 0x1000>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
index 6fceb1f95d2a..abaf27916d13 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
@@ -56,6 +56,28 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     maxItems: 1
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description:
+      Input and output ports can have multiple endpoints, each of those
+      connects to either the primary, secondary, etc, display pipeline.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: DITHER input, usually from a POSTMASK or GAMMA block.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          DITHER output to the input of the next desired component in the
+          display pipeline, for example one of the available DSC compressors,
+          DP_INTF, DSI, LVDS or others.
+
+    required:
+      - port@0
+      - port@1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml.orig b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml.orig
new file mode 100644
index 000000000000..6fceb1f95d2a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml.orig
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,dither.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek display dither processor
+
+maintainers:
+  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
+  - Philipp Zabel <p.zabel@pengutronix.de>
+
+description: |
+  Mediatek display dither processor, namely DITHER, works by approximating
+  unavailable colors with available colors and by mixing and matching available
+  colors to mimic unavailable ones.
+  DITHER device node must be siblings to the central MMSYS_CONFIG node.
+  For a description of the MMSYS_CONFIG binding, see
+  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+  for details.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - mediatek,mt8183-disp-dither
+      - items:
+          - enum:
+              - mediatek,mt8186-disp-dither
+              - mediatek,mt8188-disp-dither
+              - mediatek,mt8192-disp-dither
+              - mediatek,mt8195-disp-dither
+              - mediatek,mt8365-disp-dither
+          - const: mediatek,mt8183-disp-dither
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    description: A phandle and PM domain specifier as defined by bindings of
+      the power controller specified by phandle. See
+      Documentation/devicetree/bindings/power/power-domain.yaml for details.
+
+  clocks:
+    items:
+      - description: DITHER Clock
+
+  mediatek,gce-client-reg:
+    description: The register of client driver can be configured by gce with
+      4 arguments defined in this property, such as phandle of gce, subsys id,
+      register offset and size. Each GCE subsys id is mapping to a client
+      defined in the header include/dt-bindings/gce/<chip>-gce.h.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8183-clk.h>
+    #include <dt-bindings/power/mt8183-power.h>
+    #include <dt-bindings/gce/mt8183-gce.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        dither0: dither@14012000 {
+            compatible = "mediatek,mt8183-disp-dither";
+            reg = <0 0x14012000 0 0x1000>;
+            interrupts = <GIC_SPI 235 IRQ_TYPE_LEVEL_LOW>;
+            power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
+            clocks = <&mmsys CLK_MM_DISP_DITHER0>;
+            mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x2000 0x1000>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index 3a82aec9021c..b567e3d58aa1 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -71,13 +71,34 @@ properties:
       Output port node. This port should be connected to the input port of an
       attached HDMI, LVDS or DisplayPort encoder chip.
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: DPI input port
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: DPI output to an HDMI, LVDS or DisplayPort encoder input
+
+    required:
+      - port@0
+      - port@1
+
 required:
   - compatible
   - reg
   - interrupts
   - clocks
   - clock-names
-  - port
+
+oneOf:
+  - required:
+      - port
+  - required:
+      - ports
 
 allOf:
   - if:
@@ -100,7 +121,7 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/clock/mt8173-clk.h>
 
-    dpi0: dpi@1401d000 {
+    dpi: dpi@1401d000 {
         compatible = "mediatek,mt8173-dpi";
         reg = <0x1401d000 0x1000>;
         interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>;
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml.orig b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml.orig
new file mode 100644
index 000000000000..3a82aec9021c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml.orig
@@ -0,0 +1,122 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek DPI and DP_INTF Controller
+
+maintainers:
+  - CK Hu <ck.hu@mediatek.com>
+  - Jitao shi <jitao.shi@mediatek.com>
+
+description: |
+  The MediaTek DPI and DP_INTF function blocks are a sink of the display
+  subsystem and provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422 pixel data on a
+  parallel output bus.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - mediatek,mt2701-dpi
+          - mediatek,mt7623-dpi
+          - mediatek,mt8173-dpi
+          - mediatek,mt8183-dpi
+          - mediatek,mt8186-dpi
+          - mediatek,mt8188-dp-intf
+          - mediatek,mt8192-dpi
+          - mediatek,mt8195-dp-intf
+      - items:
+          - enum:
+              - mediatek,mt6795-dpi
+          - const: mediatek,mt8183-dpi
+      - items:
+          - enum:
+              - mediatek,mt8365-dpi
+          - const: mediatek,mt8192-dpi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Pixel Clock
+      - description: Engine Clock
+      - description: DPI PLL
+
+  clock-names:
+    items:
+      - const: pixel
+      - const: engine
+      - const: pll
+
+  pinctrl-0: true
+  pinctrl-1: true
+
+  pinctrl-names:
+    items:
+      - const: default
+      - const: sleep
+
+  power-domains:
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      Output port node. This port should be connected to the input port of an
+      attached HDMI, LVDS or DisplayPort encoder chip.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - port
+
+allOf:
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - mediatek,mt6795-dpi
+                - mediatek,mt8173-dpi
+                - mediatek,mt8186-dpi
+    then:
+      properties:
+        power-domains: false
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8173-clk.h>
+
+    dpi0: dpi@1401d000 {
+        compatible = "mediatek,mt8173-dpi";
+        reg = <0x1401d000 0x1000>;
+        interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>;
+        clocks = <&mmsys CLK_MM_DPI_PIXEL>,
+             <&mmsys CLK_MM_DPI_ENGINE>,
+             <&apmixedsys CLK_APMIXED_TVDPLL>;
+        clock-names = "pixel", "engine", "pll";
+        pinctrl-names = "default", "sleep";
+        pinctrl-0 = <&dpi_pin_func>;
+        pinctrl-1 = <&dpi_pin_idle>;
+
+        port {
+            dpi0_out: endpoint {
+                remote-endpoint = <&hdmi0_in>;
+            };
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
index 2cbdd9ee449d..846de6c17d93 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
@@ -49,6 +49,30 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     maxItems: 1
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description:
+      Input and output ports can have multiple endpoints, each of those
+      connects to either the primary, secondary, etc, display pipeline.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Display Stream Compression input, usually from one of the DITHER
+          or MERGE blocks.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Display Stream Compression output to the input of the next desired
+          component in the display pipeline, for example to MERGE, DP_INTF,
+          DPI or DSI.
+
+    required:
+      - port@0
+      - port@1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
index a7aa8fcb0dd1..27ffbccc2a08 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
@@ -77,6 +77,26 @@ properties:
       Output port node. This port should be connected to the input
       port of an attached DSI panel or DSI-to-eDP encoder chip.
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description:
+      Input ports can have multiple endpoints, each of those connects
+      to either the primary, secondary, etc, display pipeline.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: DSI input port, usually from DITHER, DSC or MERGE
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          DSI output to an attached DSI panel, or a DSI-to-X encoder chip
+
+    required:
+      - port@0
+      - port@1
+
 required:
   - compatible
   - reg
@@ -86,7 +106,12 @@ required:
   - clock-names
   - phys
   - phy-names
-  - port
+
+oneOf:
+  - required:
+      - port
+  - required:
+      - ports
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml.orig b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml.orig
new file mode 100644
index 000000000000..a7aa8fcb0dd1
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml.orig
@@ -0,0 +1,126 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek DSI Controller
+
+maintainers:
+  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
+  - Philipp Zabel <p.zabel@pengutronix.de>
+  - Jitao Shi <jitao.shi@mediatek.com>
+
+description: |
+  The MediaTek DSI function block is a sink of the display subsystem and can
+  drive up to 4-lane MIPI DSI output. Two DSIs can be synchronized for dual-
+  channel output.
+
+allOf:
+  - $ref: /schemas/display/dsi-controller.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - mediatek,mt2701-dsi
+          - mediatek,mt7623-dsi
+          - mediatek,mt8167-dsi
+          - mediatek,mt8173-dsi
+          - mediatek,mt8183-dsi
+          - mediatek,mt8186-dsi
+          - mediatek,mt8188-dsi
+      - items:
+          - enum:
+              - mediatek,mt6795-dsi
+          - const: mediatek,mt8173-dsi
+      - items:
+          - enum:
+              - mediatek,mt8195-dsi
+              - mediatek,mt8365-dsi
+          - const: mediatek,mt8183-dsi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Engine Clock
+      - description: Digital Clock
+      - description: HS Clock
+
+  clock-names:
+    items:
+      - const: engine
+      - const: digital
+      - const: hs
+
+  resets:
+    maxItems: 1
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    items:
+      - const: dphy
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      Output port node. This port should be connected to the input
+      port of an attached DSI panel or DSI-to-eDP encoder chip.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+  - clocks
+  - clock-names
+  - phys
+  - phy-names
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8183-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/mt8183-power.h>
+    #include <dt-bindings/phy/phy.h>
+    #include <dt-bindings/reset/mt8183-resets.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        dsi0: dsi@14014000 {
+            compatible = "mediatek,mt8183-dsi";
+            reg = <0 0x14014000 0 0x1000>;
+            interrupts = <GIC_SPI 236 IRQ_TYPE_LEVEL_LOW>;
+            power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
+            clocks = <&mmsys CLK_MM_DSI0_MM>,
+                <&mmsys CLK_MM_DSI0_IF>,
+                <&mipi_tx0>;
+            clock-names = "engine", "digital", "hs";
+            resets = <&mmsys MT8183_MMSYS_SW0_RST_B_DISP_DSI0>;
+            phys = <&mipi_tx0>;
+            phy-names = "dphy";
+            port {
+                dsi0_out: endpoint {
+                    remote-endpoint = <&panel_in>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
index 677882348ede..98db47894eeb 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
@@ -110,6 +110,28 @@ properties:
       include/dt-bindings/gce/<chip>-gce.h, mapping to the register of display
       function block.
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description:
+      Input and output ports can have multiple endpoints, each of those
+      connects to either the primary, secondary, etc, display pipeline.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: ETHDR input, usually from one of the MERGE blocks.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          ETHDR output to the input of the next desired component in the
+          display pipeline, for example one of the available MERGE blocks,
+          or others.
+
+    required:
+      - port@0
+      - port@1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
index 6823d3ce5049..48542dc7e784 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
@@ -65,6 +65,25 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     maxItems: 1
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: GAMMA input, usually from one of the AAL blocks.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          GAMMA output to the input of the next desired component in the
+          display pipeline, for example one of the available DITHER or
+          POSTMASK blocks.
+
+    required:
+      - port@0
+      - port@1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml.orig b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml.orig
new file mode 100644
index 000000000000..6823d3ce5049
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml.orig
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,gamma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek display gamma correction
+
+maintainers:
+  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
+  - Philipp Zabel <p.zabel@pengutronix.de>
+
+description: |
+  Mediatek display gamma correction, namely GAMMA, provides a nonlinear
+  operation used to adjust luminance in display system.
+  GAMMA device node must be siblings to the central MMSYS_CONFIG node.
+  For a description of the MMSYS_CONFIG binding, see
+  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+  for details.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - mediatek,mt8173-disp-gamma
+          - mediatek,mt8183-disp-gamma
+          - mediatek,mt8195-disp-gamma
+      - items:
+          - enum:
+              - mediatek,mt6795-disp-gamma
+          - const: mediatek,mt8173-disp-gamma
+      - items:
+          - enum:
+              - mediatek,mt8186-disp-gamma
+              - mediatek,mt8188-disp-gamma
+              - mediatek,mt8192-disp-gamma
+              - mediatek,mt8195-disp-gamma
+              - mediatek,mt8365-disp-gamma
+          - const: mediatek,mt8183-disp-gamma
+      - items:
+          - enum:
+              - mediatek,mt8188-disp-gamma
+          - const: mediatek,mt8195-disp-gamma
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    description: A phandle and PM domain specifier as defined by bindings of
+      the power controller specified by phandle. See
+      Documentation/devicetree/bindings/power/power-domain.yaml for details.
+
+  clocks:
+    items:
+      - description: GAMMA Clock
+
+  mediatek,gce-client-reg:
+    description: The register of client driver can be configured by gce with
+      4 arguments defined in this property, such as phandle of gce, subsys id,
+      register offset and size. Each GCE subsys id is mapping to a client
+      defined in the header include/dt-bindings/gce/<chip>-gce.h.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/power/mt8173-power.h>
+    #include <dt-bindings/gce/mt8173-gce.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        gamma@14016000 {
+            compatible = "mediatek,mt8173-disp-gamma";
+            reg = <0 0x14016000 0 0x1000>;
+            interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_LOW>;
+            power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+            clocks = <&mmsys CLK_MM_DISP_GAMMA>;
+            mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x6000 0x1000>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
index dae839279950..0de9f64f3f84 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
@@ -77,6 +77,29 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     maxItems: 1
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description:
+      Input and output ports can have multiple endpoints, each of those
+      connects to either the primary, secondary, etc, display pipeline.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          MERGE input port, usually from DITHER, DPI, DSC, DSI, MDP_RDMA,
+          ETHDR or even from a different MERGE block
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          MERGE output to a DSC, DPI, DP_INTF, DSI, ETHDR, Write DMA, or
+          a different MERGE block, or others.
+
+    required:
+      - port@0
+      - port@1
+
   resets:
     description: reset controller
       See Documentation/devicetree/bindings/reset/reset.txt for details.
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml.orig b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml.orig
new file mode 100644
index 000000000000..d5cd69b7f501
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml.orig
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,merge.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek display merge
+
+maintainers:
+  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
+  - Philipp Zabel <p.zabel@pengutronix.de>
+
+description: |
+  Mediatek display merge, namely MERGE, is used to merge two slice-per-line
+  inputs into one side-by-side output.
+  MERGE device node must be siblings to the central MMSYS_CONFIG node.
+  For a description of the MMSYS_CONFIG binding, see
+  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+  for details.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: mediatek,mt8173-disp-merge
+      - items:
+          - const: mediatek,mt8195-disp-merge
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    description: A phandle and PM domain specifier as defined by bindings of
+      the power controller specified by phandle. See
+      Documentation/devicetree/bindings/power/power-domain.yaml for details.
+
+  clocks:
+    maxItems: 2
+    items:
+      - description: MERGE Clock
+      - description: MERGE Async Clock
+          Controlling the synchronous process between MERGE and other display
+          function blocks cross clock domain.
+
+  clock-names:
+    maxItems: 2
+    items:
+      - const: merge
+      - const: merge_async
+
+  mediatek,merge-fifo-en:
+    description:
+      The setting of merge fifo is mainly provided for the display latency
+      buffer to ensure that the back-end panel display data will not be
+      underrun, a little more data is needed in the fifo.
+      According to the merge fifo settings, when the water level is detected
+      to be insufficient, it will trigger RDMA sending ultra and preulra
+      command to SMI to speed up the data rate.
+    type: boolean
+
+  mediatek,merge-mute:
+    description: Support mute function. Mute the content of merge output.
+    type: boolean
+
+  mediatek,gce-client-reg:
+    description: The register of client driver can be configured by gce with
+      4 arguments defined in this property, such as phandle of gce, subsys id,
+      register offset and size. Each GCE subsys id is mapping to a client
+      defined in the header include/dt-bindings/gce/<chip>-gce.h.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    maxItems: 1
+
+  resets:
+    description: reset controller
+      See Documentation/devicetree/bindings/reset/reset.txt for details.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - power-domains
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+
+    merge@14017000 {
+        compatible = "mediatek,mt8173-disp-merge";
+        reg = <0 0x14017000 0 0x1000>;
+        power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
+        clocks = <&mmsys CLK_MM_DISP_MERGE>;
+    };
+
+    merge5: disp_vpp_merge5@1c110000 {
+        compatible = "mediatek,mt8195-disp-merge";
+        reg = <0 0x1c110000 0 0x1000>;
+        interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH 0>;
+        clocks = <&vdosys1 CLK_VDO1_VPP_MERGE4>,
+                 <&vdosys1 CLK_VDO1_MERGE4_DL_ASYNC>;
+        clock-names = "merge","merge_async";
+        power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+        mediatek,gce-client-reg = <&gce1 SUBSYS_1c11XXXX 0x0000 0x1000>;
+        mediatek,merge-fifo-en = <1>;
+        resets = <&vdosys1 MT8195_VDOSYS1_SW0_RST_B_MERGE4_DL_ASYNC>;
+    };
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
index 831c653caffd..71534febd49c 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
@@ -38,6 +38,28 @@ properties:
     items:
       - description: OD Clock
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description:
+      Input and output ports can have multiple endpoints, each of those
+      connects to either the primary, secondary, etc, display pipeline.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: OD input port, usually from an AAL block
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          OD output to the input of the next desired component in the
+          display pipeline, for example one of the available RDMA or
+          other blocks.
+
+    required:
+      - port@0
+      - port@1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
index c7dd0ef02dcf..bacdfe7d08a6 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
@@ -57,6 +57,28 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     maxItems: 1
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description:
+      Input and output ports can have multiple endpoints, each of those
+      connects to either the primary, secondary, etc, display pipeline.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: OVL input port from MMSYS, VDOSYS or other OVLs
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          OVL output to the input of the next desired component in the
+          display pipeline, for example one of the available COLOR, RDMA
+          or WDMA blocks.
+
+    required:
+      - port@0
+      - port@1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml.orig b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml.orig
new file mode 100644
index 000000000000..e3cef99d0f98
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml.orig
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,ovl-2l.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek display overlay 2 layer
+
+maintainers:
+  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
+  - Philipp Zabel <p.zabel@pengutronix.de>
+
+description: |
+  Mediatek display overlay 2 layer, namely OVL-2L, provides 2 more layer
+  for OVL.
+  OVL-2L device node must be siblings to the central MMSYS_CONFIG node.
+  For a description of the MMSYS_CONFIG binding, see
+  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+  for details.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: mediatek,mt8183-disp-ovl-2l
+      - items:
+          - const: mediatek,mt8192-disp-ovl-2l
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    description: A phandle and PM domain specifier as defined by bindings of
+      the power controller specified by phandle. See
+      Documentation/devicetree/bindings/power/power-domain.yaml for details.
+
+  clocks:
+    items:
+      - description: OVL-2L Clock
+
+  iommus:
+    description:
+      This property should point to the respective IOMMU block with master port as argument,
+      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
+
+  mediatek,gce-client-reg:
+    description: The register of client driver can be configured by gce with
+      4 arguments defined in this property, such as phandle of gce, subsys id,
+      register offset and size. Each GCE subsys id is mapping to a client
+      defined in the header include/dt-bindings/gce/<chip>-gce.h.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+  - clocks
+  - iommus
+
+additionalProperties: false
+
+examples:
+  - |
+
+    ovl_2l0: ovl@14009000 {
+        compatible = "mediatek,mt8183-disp-ovl-2l";
+        reg = <0 0x14009000 0 0x1000>;
+        interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_LOW>;
+        power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
+        clocks = <&mmsys CLK_MM_DISP_OVL0_2L>;
+        iommus = <&iommu M4U_PORT_DISP_2L_OVL0_LARB0>;
+        mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x9000 0x1000>;
+    };
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
index d55611c7ce5e..9ea796a033b2 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
@@ -75,6 +75,28 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     maxItems: 1
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description:
+      Input and output ports can have multiple endpoints, each of those
+      connects to either the primary, secondary, etc, display pipeline.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: OVL input port from MMSYS or one of multiple VDOSYS
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          OVL output to the input of the next desired component in the
+          display pipeline, for example one of the available COLOR, RDMA
+          or WDMA blocks.
+
+    required:
+      - port@0
+      - port@1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml.orig b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml.orig
new file mode 100644
index 000000000000..d55611c7ce5e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml.orig
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,ovl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek display overlay
+
+maintainers:
+  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
+  - Philipp Zabel <p.zabel@pengutronix.de>
+
+description: |
+  Mediatek display overlay, namely OVL, can do alpha blending from
+  the memory.
+  OVL device node must be siblings to the central MMSYS_CONFIG node.
+  For a description of the MMSYS_CONFIG binding, see
+  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+  for details.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - mediatek,mt2701-disp-ovl
+          - mediatek,mt8173-disp-ovl
+          - mediatek,mt8183-disp-ovl
+          - mediatek,mt8192-disp-ovl
+          - mediatek,mt8195-mdp3-ovl
+      - items:
+          - enum:
+              - mediatek,mt7623-disp-ovl
+              - mediatek,mt2712-disp-ovl
+          - const: mediatek,mt2701-disp-ovl
+      - items:
+          - enum:
+              - mediatek,mt6795-disp-ovl
+          - const: mediatek,mt8173-disp-ovl
+      - items:
+          - enum:
+              - mediatek,mt8188-disp-ovl
+              - mediatek,mt8195-disp-ovl
+          - const: mediatek,mt8183-disp-ovl
+      - items:
+          - enum:
+              - mediatek,mt8186-disp-ovl
+              - mediatek,mt8365-disp-ovl
+          - const: mediatek,mt8192-disp-ovl
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    description: A phandle and PM domain specifier as defined by bindings of
+      the power controller specified by phandle. See
+      Documentation/devicetree/bindings/power/power-domain.yaml for details.
+
+  clocks:
+    items:
+      - description: OVL Clock
+
+  iommus:
+    description:
+      This property should point to the respective IOMMU block with master port as argument,
+      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
+
+  mediatek,gce-client-reg:
+    description: The register of client driver can be configured by gce with
+      4 arguments defined in this property, such as phandle of gce, subsys id,
+      register offset and size. Each GCE subsys id is mapping to a client
+      defined in the header include/dt-bindings/gce/<chip>-gce.h.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+  - clocks
+  - iommus
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/power/mt8173-power.h>
+    #include <dt-bindings/gce/mt8173-gce.h>
+    #include <dt-bindings/memory/mt8173-larb-port.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        ovl0: ovl@1400c000 {
+            compatible = "mediatek,mt8173-disp-ovl";
+            reg = <0 0x1400c000 0 0x1000>;
+            interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_LOW>;
+            power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+            clocks = <&mmsys CLK_MM_DISP_OVL0>;
+            iommus = <&iommu M4U_PORT_DISP_OVL0>;
+            mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xc000 0x1000>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
index 11fe32e50a59..fb6fe4742624 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
@@ -52,6 +52,27 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     maxItems: 1
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description:
+      Input and output ports can have multiple endpoints, each of those
+      connects to either the primary, secondary, etc, display pipeline.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: POSTMASK input port, usually from GAMMA
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          POSTMASK output to the input of the next desired component in the
+          display pipeline, for example one of the available DITHER blocks.
+
+    required:
+      - port@0
+      - port@1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
index 4cadb245d028..878f676b581f 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
@@ -87,6 +87,28 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     maxItems: 1
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description:
+      Input and output ports can have multiple endpoints, each of those
+      connects to either the primary, secondary, etc, display pipeline.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: RDMA input port, usually from MMSYS, OD or OVL
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          RDMA output to the input of the next desired component in the
+          display pipeline, for example one of the available COLOR, DPI,
+          DSI, MERGE or UFOE blocks.
+
+    required:
+      - port@0
+      - port@1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml.orig b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml.orig
new file mode 100644
index 000000000000..4cadb245d028
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml.orig
@@ -0,0 +1,122 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,rdma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Read Direct Memory Access
+
+maintainers:
+  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
+  - Philipp Zabel <p.zabel@pengutronix.de>
+
+description: |
+  Mediatek Read Direct Memory Access(RDMA) component used to read the
+  data into DMA. It provides real time data to the back-end panel
+  driver, such as DSI, DPI and DP_INTF.
+  It contains one line buffer to store the sufficient pixel data.
+  RDMA device node must be siblings to the central MMSYS_CONFIG node.
+  For a description of the MMSYS_CONFIG binding, see
+  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+  for details.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - mediatek,mt2701-disp-rdma
+          - mediatek,mt8173-disp-rdma
+          - mediatek,mt8183-disp-rdma
+          - mediatek,mt8195-disp-rdma
+      - items:
+          - enum:
+              - mediatek,mt8188-disp-rdma
+          - const: mediatek,mt8195-disp-rdma
+      - items:
+          - enum:
+              - mediatek,mt7623-disp-rdma
+              - mediatek,mt2712-disp-rdma
+          - const: mediatek,mt2701-disp-rdma
+      - items:
+          - enum:
+              - mediatek,mt6795-disp-rdma
+          - const: mediatek,mt8173-disp-rdma
+      - items:
+          - enum:
+              - mediatek,mt8186-disp-rdma
+              - mediatek,mt8192-disp-rdma
+              - mediatek,mt8365-disp-rdma
+          - const: mediatek,mt8183-disp-rdma
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    description: A phandle and PM domain specifier as defined by bindings of
+      the power controller specified by phandle. See
+      Documentation/devicetree/bindings/power/power-domain.yaml for details.
+
+  clocks:
+    items:
+      - description: RDMA Clock
+
+  iommus:
+    description:
+      This property should point to the respective IOMMU block with master port as argument,
+      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
+
+  mediatek,rdma-fifo-size:
+    description:
+      rdma fifo size may be different even in same SOC, add this property to the
+      corresponding rdma.
+      The value below is the Max value which defined in hardware data sheet
+      mediatek,rdma-fifo-size of mt8173-rdma0 is 8K
+      mediatek,rdma-fifo-size of mt8183-rdma0 is 5K
+      mediatek,rdma-fifo-size of mt8183-rdma1 is 2K
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [8192, 5120, 2048]
+
+  mediatek,gce-client-reg:
+    description: The register of client driver can be configured by gce with
+      4 arguments defined in this property, such as phandle of gce, subsys id,
+      register offset and size. Each GCE subsys id is mapping to a client
+      defined in the header include/dt-bindings/gce/<chip>-gce.h.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+  - clocks
+  - iommus
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/power/mt8173-power.h>
+    #include <dt-bindings/gce/mt8173-gce.h>
+    #include <dt-bindings/memory/mt8173-larb-port.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        rdma0: rdma@1400e000 {
+            compatible = "mediatek,mt8173-disp-rdma";
+            reg = <0 0x1400e000 0 0x1000>;
+            interrupts = <GIC_SPI 182 IRQ_TYPE_LEVEL_LOW>;
+            power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+            clocks = <&mmsys CLK_MM_DISP_RDMA0>;
+            iommus = <&iommu M4U_PORT_DISP_RDMA0>;
+            mediatek,rdma-fifo-size = <8192>;
+            mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xe000 0x1000>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
index 39e3e2d4a0db..61a5e22effbf 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
@@ -43,6 +43,27 @@ properties:
     items:
       - description: UFOe Clock
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description:
+      Input and output ports can have multiple endpoints, each of those
+      connects to either the primary, secondary, etc, display pipeline.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: UFOE input, usually from one of the RDMA blocks.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          UFOE output to the input of the next desired component in the
+          display pipeline, usually one of the available DSI blocks.
+
+    required:
+      - port@0
+      - port@1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml.orig b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml.orig
new file mode 100644
index 000000000000..f9f00a518edf
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml.orig
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,wdma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Write Direct Memory Access
+
+maintainers:
+  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
+  - Philipp Zabel <p.zabel@pengutronix.de>
+
+description: |
+  Mediatek Write Direct Memory Access(WDMA) component used to write
+  the data into DMA.
+  WDMA device node must be siblings to the central MMSYS_CONFIG node.
+  For a description of the MMSYS_CONFIG binding, see
+  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+  for details.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: mediatek,mt8173-disp-wdma
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    description: A phandle and PM domain specifier as defined by bindings of
+      the power controller specified by phandle. See
+      Documentation/devicetree/bindings/power/power-domain.yaml for details.
+
+  clocks:
+    items:
+      - description: WDMA Clock
+
+  iommus:
+    description:
+      This property should point to the respective IOMMU block with master port as argument,
+      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
+
+  mediatek,gce-client-reg:
+    description: The register of client driver can be configured by gce with
+      4 arguments defined in this property, such as phandle of gce, subsys id,
+      register offset and size. Each GCE subsys id is mapping to a client
+      defined in the header include/dt-bindings/gce/<chip>-gce.h.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+  - clocks
+  - iommus
+
+additionalProperties: false
+
+examples:
+  - |
+
+    wdma0: wdma@14011000 {
+        compatible = "mediatek,mt8173-disp-wdma";
+        reg = <0 0x14011000 0 0x1000>;
+        interrupts = <GIC_SPI 185 IRQ_TYPE_LEVEL_LOW>;
+        power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+        clocks = <&mmsys CLK_MM_DISP_WDMA0>;
+        iommus = <&iommu M4U_PORT_DISP_WDMA0>;
+        mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x1000 0x1000>;
+    };
diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml.orig b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml.orig
new file mode 100644
index 000000000000..bf0f7f1f71e0
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml.orig
@@ -0,0 +1,250 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM Mali Bifrost GPU
+
+maintainers:
+  - Rob Herring <robh@kernel.org>
+
+properties:
+  $nodename:
+    pattern: '^gpu@[a-f0-9]+$'
+
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - amlogic,meson-g12a-mali
+              - mediatek,mt8183-mali
+              - realtek,rtd1619-mali
+              - renesas,r9a07g044-mali
+              - renesas,r9a07g054-mali
+              - rockchip,px30-mali
+              - rockchip,rk3568-mali
+          - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
+      - items:
+          - enum:
+              - mediatek,mt8192-mali
+          - const: arm,mali-valhall-jm # Mali Valhall GPU model/revision is fully discoverable
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 3
+    items:
+      - description: Job interrupt
+      - description: MMU interrupt
+      - description: GPU interrupt
+      - description: Event interrupt
+
+  interrupt-names:
+    minItems: 3
+    items:
+      - const: job
+      - const: mmu
+      - const: gpu
+      - const: event
+
+  clocks:
+    minItems: 1
+    maxItems: 3
+
+  clock-names: true
+
+  mali-supply: true
+
+  sram-supply: true
+
+  operating-points-v2: true
+
+  power-domains:
+    minItems: 1
+    maxItems: 5
+
+  power-domain-names:
+    minItems: 1
+    maxItems: 5
+
+  resets:
+    minItems: 1
+    maxItems: 3
+
+  reset-names: true
+
+  "#cooling-cells":
+    const: 2
+
+  dynamic-power-coefficient:
+    $ref: '/schemas/types.yaml#/definitions/uint32'
+    description:
+      A u32 value that represents the running time dynamic
+      power coefficient in units of uW/MHz/V^2. The
+      coefficient can either be calculated from power
+      measurements or derived by analysis.
+
+      The dynamic power consumption of the GPU is
+      proportional to the square of the Voltage (V) and
+      the clock frequency (f). The coefficient is used to
+      calculate the dynamic power as below -
+
+      Pdyn = dynamic-power-coefficient * V^2 * f
+
+      where voltage is in V, frequency is in MHz.
+
+  dma-coherent: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+
+additionalProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: amlogic,meson-g12a-mali
+    then:
+      properties:
+        power-domains:
+          maxItems: 1
+        power-domain-names: false
+      required:
+        - resets
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,r9a07g044-mali
+              - renesas,r9a07g054-mali
+    then:
+      properties:
+        interrupts:
+          minItems: 4
+        interrupt-names:
+          minItems: 4
+        clocks:
+          minItems: 3
+        clock-names:
+          items:
+            - const: gpu
+            - const: bus
+            - const: bus_ace
+        power-domains:
+          maxItems: 1
+        power-domain-names: false
+        resets:
+          minItems: 3
+        reset-names:
+          items:
+            - const: rst
+            - const: axi_rst
+            - const: ace_rst
+      required:
+        - clock-names
+        - power-domains
+        - resets
+        - reset-names
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8183-mali
+    then:
+      properties:
+        power-domains:
+          minItems: 3
+          maxItems: 3
+        power-domain-names:
+          items:
+            - const: core0
+            - const: core1
+            - const: core2
+
+      required:
+        - sram-supply
+        - power-domains
+        - power-domain-names
+    else:
+      properties:
+        sram-supply: false
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3568-mali
+    then:
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          items:
+            - const: gpu
+            - const: bus
+        power-domains:
+          maxItems: 1
+        power-domain-names: false
+      required:
+        - clock-names
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    gpu@ffe40000 {
+      compatible = "amlogic,meson-g12a-mali", "arm,mali-bifrost";
+      reg = <0xffe40000 0x10000>;
+      interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
+             <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>,
+             <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>;
+      interrupt-names = "job", "mmu", "gpu";
+      clocks = <&clk 1>;
+      mali-supply = <&vdd_gpu>;
+      operating-points-v2 = <&gpu_opp_table>;
+      resets = <&reset 0>, <&reset 1>;
+    };
+
+    gpu_opp_table: opp-table {
+      compatible = "operating-points-v2";
+
+      opp-533000000 {
+        opp-hz = /bits/ 64 <533000000>;
+        opp-microvolt = <1250000>;
+      };
+      opp-450000000 {
+        opp-hz = /bits/ 64 <450000000>;
+        opp-microvolt = <1150000>;
+      };
+      opp-400000000 {
+        opp-hz = /bits/ 64 <400000000>;
+        opp-microvolt = <1125000>;
+      };
+      opp-350000000 {
+        opp-hz = /bits/ 64 <350000000>;
+        opp-microvolt = <1075000>;
+      };
+      opp-266000000 {
+        opp-hz = /bits/ 64 <266000000>;
+        opp-microvolt = <1025000>;
+      };
+      opp-160000000 {
+        opp-hz = /bits/ 64 <160000000>;
+        opp-microvolt = <925000>;
+      };
+      opp-100000000 {
+        opp-hz = /bits/ 64 <100000000>;
+        opp-microvolt = <912500>;
+      };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/leds/leds-mt6323.txt.orig b/Documentation/devicetree/bindings/leds/leds-mt6323.txt.orig
new file mode 100644
index 000000000000..73353692efa1
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-mt6323.txt.orig
@@ -0,0 +1,60 @@
+Device Tree Bindings for LED support on MT6323 PMIC
+
+MT6323 LED controller is subfunction provided by MT6323 PMIC, so the LED
+controllers are defined as the subnode of the function node provided by MT6323
+PMIC controller that is being defined as one kind of Muti-Function Device (MFD)
+using shared bus called PMIC wrapper for each subfunction to access remote
+MT6323 PMIC hardware.
+
+For MT6323 MFD bindings see:
+Documentation/devicetree/bindings/mfd/mt6397.txt
+For MediaTek PMIC wrapper bindings see:
+Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
+
+Required properties:
+- compatible : Must be "mediatek,mt6323-led"
+- address-cells : Must be 1
+- size-cells : Must be 0
+
+Each led is represented as a child node of the mediatek,mt6323-led that
+describes the initial behavior for each LED physically and currently only four
+LED child nodes can be supported.
+
+Required properties for the LED child node:
+- reg : LED channel number (0..3)
+
+Optional properties for the LED child node:
+- label : See Documentation/devicetree/bindings/leds/common.txt
+- linux,default-trigger : See Documentation/devicetree/bindings/leds/common.txt
+- default-state: See Documentation/devicetree/bindings/leds/common.txt
+
+Example:
+
+	mt6323: pmic {
+		compatible = "mediatek,mt6323";
+
+		...
+
+		mt6323led: leds {
+			compatible = "mediatek,mt6323-led";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@0 {
+				reg = <0>;
+				label = "LED0";
+				linux,default-trigger = "timer";
+				default-state = "on";
+			};
+			led@1 {
+				reg = <1>;
+				label = "LED1";
+				default-state = "off";
+			};
+			led@2 {
+				reg = <2>;
+				label = "LED2";
+				default-state = "on";
+			};
+		};
+	};
diff --git a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml.orig b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml.orig
new file mode 100644
index 000000000000..5728e750761f
--- /dev/null
+++ b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml.orig
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Universal Flash Storage (UFS) Controller
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+allOf:
+  - $ref: ufs-common.yaml
+
+properties:
+  compatible:
+    oneOf:
+      - const: mediatek,mt8183-ufshci
+      - items:
+          - enum:
+              - mediatek,mt8192-ufshci
+              - mediatek,mt8195-ufshci
+          - const: mediatek,mt8183-ufshci
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: ufs
+
+  phys:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+  vcc-supply: true
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - phys
+  - reg
+  - vcc-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8183-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        ufs@ff3c0000 {
+            compatible = "mediatek,mt8183-ufshci";
+            reg = <0 0x11270000 0 0x2300>;
+            interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_LOW>;
+            phys = <&ufsphy>;
+
+            clocks = <&infracfg_ao CLK_INFRA_UFS>;
+            clock-names = "ufs";
+            freq-table-hz = <0 0>;
+
+            vcc-supply = <&mt_pmic_vemc_ldo_reg>;
+        };
+    };
-- 
2.46.0

