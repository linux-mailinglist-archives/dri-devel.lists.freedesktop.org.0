Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB1A3CC4B5
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jul 2021 19:08:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 153266EA8C;
	Sat, 17 Jul 2021 17:08:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Sat, 17 Jul 2021 09:09:31 UTC
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35E076EA1C
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jul 2021 09:09:31 +0000 (UTC)
X-UUID: 7ba9eef7431f4d118748ff013e949d11-20210717
X-UUID: 7ba9eef7431f4d118748ff013e949d11-20210717
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 553190909; Sat, 17 Jul 2021 17:04:25 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Jul 2021 17:04:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 17 Jul 2021 17:04:24 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
Subject: [PATCH v1 01/10] dt-bindings: mediatek: add pseudo-ovl definition for
 mt8195
Date: Sat, 17 Jul 2021 17:03:59 +0800
Message-ID: <20210717090408.28283-2-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210717090408.28283-1-nancy.lin@mediatek.com>
References: <20210717090408.28283-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-Mailman-Approved-At: Sat, 17 Jul 2021 17:08:05 +0000
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

1. Add pseudo-ovl definition file for mt8195 display.
2. Add mediatek,pseudo-ovl.yaml to decribe pseudo-ovl module in details.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
---
 .../display/mediatek/mediatek,disp.yaml       |   5 +
 .../display/mediatek/mediatek,pseudo-ovl.yaml | 105 ++++++++++++++++++
 2 files changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,pseudo-ovl.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml
index aac1796e3f6b..bb6d28572b48 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml
@@ -230,6 +230,11 @@ properties:
       - items:
           - const: mediatek,mt8173-disp-od
 
+      # PSEUDO-OVL: see Documentation/devicetree/bindings/display/mediatek/mediatek,pseudo-ovl.yaml
+      # for details.
+      - items:
+          - const: mediatek,mt8195-disp-pseudo-ovl
+
   reg:
     description: Physical base address and length of the function block register space.
 
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,pseudo-ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,pseudo-ovl.yaml
new file mode 100644
index 000000000000..9059d96ce70e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,pseudo-ovl.yaml
@@ -0,0 +1,105 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,pseudo-ovl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: mediatek pseudo ovl Device Tree Bindings
+
+maintainers:
+  - CK Hu <ck.hu@mediatek.com>
+  - Nancy.Lin <nancy.lin@mediatek.com>
+
+description: |
+  The Mediatek pseudo ovl function block is composed of eight RDMA and
+  four MERGE devices. It's encapsulated as an overlay device, which supports
+  4 layers.
+
+properties:
+  compatible:
+    oneOf:
+      # pseudo ovl controller
+      - items:
+          - const: mediatek,mt8195-disp-pseudo-ovl
+      # RDMA: read DMA
+      - items:
+          - const: mediatek,mt8195-vdo1-rdma
+      # MERGE: merge streams from two RDMA sources
+      - items:
+          - const: mediatek,mt8195-vdo1-merge
+  reg:
+    maxItems: 1
+  interrupts:
+    maxItems: 1
+  iommus:
+    description: The compatible property is DMA function blocks.
+      Should point to the respective IOMMU block with master port as argument,
+      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for
+      details.
+    maxItems: 1
+  clocks:
+    maxItems: 2
+  clock-names:
+    maxItems: 2
+  power-domains:
+    maxItems: 1
+  mediatek,gce-client-reg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: The register of display function block to be set by gce.
+      There are 4 arguments in this property, gce node, subsys id, offset and
+      register size. The subsys id is defined in the gce header of each chips
+      include/include/dt-bindings/gce/<chip>-gce.h, mapping to the register of
+      display function block.
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const:
+              - mediatek,mt8195-vdo1-merge
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: merge clock
+            - description: merge async clock
+        clock-names:
+          items:
+            - const: merge
+            - const: merge_async
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+
+    vdo1_rdma@1c104000 {
+            compatible = "mediatek,mt8195-vdo1-rdma",
+                         "mediatek,mt8195-disp-pseudo-ovl";
+            reg = <0 0x1c104000 0 0x1000>;
+            interrupts = <GIC_SPI 495 IRQ_TYPE_LEVEL_HIGH 0>;
+            clocks = <&vdosys1 CLK_VDO1_MDP_RDMA0>;
+            power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+            iommus = <&iommu_vdo M4U_PORT_L2_MDP_RDMA0>;
+            mediatek,gce-client-reg = <&gce1 SUBSYS_1c10XXXX 0x4000 0x1000>;
+    };
+
+    disp_vpp_merge@1c10c000 {
+            compatible = "mediatek,mt8195-vdo1-merge";
+            reg = <0 0x1c10c000 0 0x1000>;
+            interrupts = <GIC_SPI 503 IRQ_TYPE_LEVEL_HIGH 0>;
+            clocks = <&vdosys1 CLK_VDO1_VPP_MERGE0>,
+                     <&vdosys1 CLK_VDO1_MERGE0_DL_ASYNC>;
+            clock-names = "merge","merge_async";
+            power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+            mediatek,gce-client-reg = <&gce1 SUBSYS_1c10XXXX 0xc000 0x1000>;
+    };
+
+...
-- 
2.18.0

