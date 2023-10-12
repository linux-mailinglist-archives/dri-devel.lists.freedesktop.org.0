Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E007C67BF
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 10:41:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D1C810E454;
	Thu, 12 Oct 2023 08:40:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B0410E443
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 08:40:44 +0000 (UTC)
X-UUID: 05fed93e68db11eea33bb35ae8d461a2-20231012
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=BIhy7dikDjCtKTCaaw/bkjDH4vFLLuEjeJtVKZZeoY4=; 
 b=cG258VWRJIqivBpcXoJAOX2MEEagaxLc2Qoy2DmOsc2QlyG8jTYbPp4cHUfOs7j6HddskIopupmNWIJrgb7ZgHt7/7D6a7Wi3ke3uftxli8CnQYamJTD7O0BttJIpQUUK9KyY9ZD2ZhbEtVvuqDJtTUOvZYKB6pNYaHuYiAWKx4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:8ba33f1d-0fcf-4e89-ad3c-a80228ffa899, IP:0,
 U
 RL:25,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:0fddd8bf-14cc-44ca-b657-2d2783296e72,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 05fed93e68db11eea33bb35ae8d461a2-20231012
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <moudy.ho@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1831359816; Thu, 12 Oct 2023 16:40:40 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 12 Oct 2023 16:40:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 12 Oct 2023 16:40:39 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v7 02/16] dt-bindings: media: mediatek: mdp3: merge the
 indentical RDMA under display
Date: Thu, 12 Oct 2023 16:40:23 +0800
Message-ID: <20231012084037.19376-3-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231012084037.19376-1-moudy.ho@mediatek.com>
References: <20231012084037.19376-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Moudy Ho <moudy.ho@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To simplify maintenance and avoid branches, the identical component
should be merged and placed in the path belonging to the MDP
(from display/* to media/*).

In addition, currently only MDP utilizes RDMA through CMDQ, and the
necessary properties for "mediatek,gce-events", and "mboxes" have been
set up for this purpose.
Within DISP, it directly receives component interrupt signals.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 .../display/mediatek/mediatek,mdp-rdma.yaml   | 88 -------------------
 .../bindings/media/mediatek,mdp3-rdma.yaml    | 55 +++++++++---
 2 files changed, 45 insertions(+), 98 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml
deleted file mode 100644
index dd12e2ff685c..000000000000
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml
+++ /dev/null
@@ -1,88 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: MediaTek MDP RDMA
-
-maintainers:
-  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
-  - Philipp Zabel <p.zabel@pengutronix.de>
-
-description:
-  The MediaTek MDP RDMA stands for Read Direct Memory Access.
-  It provides real time data to the back-end panel driver, such as DSI,
-  DPI and DP_INTF.
-  It contains one line buffer to store the sufficient pixel data.
-  RDMA device node must be siblings to the central MMSYS_CONFIG node.
-  For a description of the MMSYS_CONFIG binding, see
-  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml for details.
-
-properties:
-  compatible:
-    const: mediatek,mt8195-vdo1-rdma
-
-  reg:
-    maxItems: 1
-
-  interrupts:
-    maxItems: 1
-
-  power-domains:
-    maxItems: 1
-
-  clocks:
-    items:
-      - description: RDMA Clock
-
-  iommus:
-    maxItems: 1
-
-  mediatek,gce-client-reg:
-    description:
-      The register of display function block to be set by gce. There are 4 arguments,
-      such as gce node, subsys id, offset and register size. The subsys id that is
-      mapping to the register of display function blocks is defined in the gce header
-      include/dt-bindings/gce/<chip>-gce.h of each chips.
-    $ref: /schemas/types.yaml#/definitions/phandle-array
-    items:
-      items:
-        - description: phandle of GCE
-        - description: GCE subsys id
-        - description: register offset
-        - description: register size
-    maxItems: 1
-
-required:
-  - compatible
-  - reg
-  - power-domains
-  - clocks
-  - iommus
-  - mediatek,gce-client-reg
-
-additionalProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/interrupt-controller/arm-gic.h>
-    #include <dt-bindings/clock/mt8195-clk.h>
-    #include <dt-bindings/power/mt8195-power.h>
-    #include <dt-bindings/gce/mt8195-gce.h>
-    #include <dt-bindings/memory/mt8195-memory-port.h>
-
-    soc {
-        #address-cells = <2>;
-        #size-cells = <2>;
-
-        rdma@1c104000 {
-            compatible = "mediatek,mt8195-vdo1-rdma";
-            reg = <0 0x1c104000 0 0x1000>;
-            interrupts = <GIC_SPI 495 IRQ_TYPE_LEVEL_HIGH 0>;
-            clocks = <&vdosys1 CLK_VDO1_MDP_RDMA0>;
-            power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
-            iommus = <&iommu_vdo M4U_PORT_L2_MDP_RDMA0>;
-            mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0x4000 0x1000>;
-        };
-    };
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
index 3e128733ef53..c043204cf210 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
@@ -20,8 +20,9 @@ description: |
 
 properties:
   compatible:
-    items:
-      - const: mediatek,mt8183-mdp3-rdma
+    enum:
+      - mediatek,mt8183-mdp3-rdma
+      - mediatek,mt8195-vdo1-rdma
 
   reg:
     maxItems: 1
@@ -49,17 +50,18 @@ properties:
     maxItems: 1
 
   clocks:
-    items:
-      - description: RDMA clock
-      - description: RSZ clock
+    minItems: 1
+    maxItems: 2
 
   iommus:
     maxItems: 1
 
   mboxes:
-    items:
-      - description: used for 1st data pipe from RDMA
-      - description: used for 2nd data pipe from RDMA
+    minItems: 1
+    maxItems: 2
+
+  interrupts:
+    maxItems: 1
 
   '#dma-cells':
     const: 1
@@ -68,13 +70,46 @@ required:
   - compatible
   - reg
   - mediatek,gce-client-reg
-  - mediatek,gce-events
   - power-domains
   - clocks
   - iommus
-  - mboxes
   - '#dma-cells'
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8183-mdp3-rdma
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: RDMA clock
+            - description: RSZ clock (shared SRAM with RDMA)
+
+        mboxes:
+          items:
+            - description: used for 1st data pipe from RDMA
+            - description: used for 2nd data pipe from RDMA
+
+      required:
+        - mboxes
+        - mediatek,gce-events
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8195-vdo1-rdma
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: RDMA clock
+
 additionalProperties: false
 
 examples:
-- 
2.18.0

