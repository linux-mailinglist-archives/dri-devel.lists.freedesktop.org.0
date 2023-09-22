Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F917AB39B
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 16:29:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 360FD10E672;
	Fri, 22 Sep 2023 14:29:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE26C10E636
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 07:21:27 +0000 (UTC)
X-UUID: 9f8a240a591811ee8051498923ad61e6-20230922
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=bcjSCo54gfohaCZH+njaCeWE2w4vktmaE9kbYN5ds/k=; 
 b=n/Pp40Pyi1KUa6WEAa0chsIwjQaf1J1GLxAOaD7NBq/K5xbxnfmVoGyx/sXpL+xGIvoT+b0bD1LnMgYyjTXWwNT+v/fEvIIRlpzl+YLOUTNAe4dpe1gh4ietUCD2HbUXgqgmV/tSKn1DZZerkckdYXLB6riv/sIrlim/15GOJmU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:f6b7e33e-02d5-4694-96fe-cb3f75882aa2, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:5f78ec9, CLOUDID:d68a00f0-9a6e-4c39-b73e-f2bc08ca3dc5,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 9f8a240a591811ee8051498923ad61e6-20230922
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw02.mediatek.com (envelope-from <moudy.ho@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 645106737; Fri, 22 Sep 2023 15:21:18 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Sep 2023 15:21:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Sep 2023 15:21:17 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v6 01/16] dt-bindings: media: mediatek: mdp3: correct RDMA and
 WROT node with generic names
Date: Fri, 22 Sep 2023 15:21:01 +0800
Message-ID: <20230922072116.11009-2-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230922072116.11009-1-moudy.ho@mediatek.com>
References: <20230922072116.11009-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-Mailman-Approved-At: Fri, 22 Sep 2023 14:28:57 +0000
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

The DMA-related nodes RDMA/WROT in MDP3 should be changed to generic names.
In addition, fix improper space indent in example.

Fixes: 4ad7b39623ab ("media: dt-binding: mediatek: add bindings for MediaTek MDP3 components")
Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/media/mediatek,mdp3-rdma.yaml    | 29 +++++++++++--------
 .../bindings/media/mediatek,mdp3-wrot.yaml    | 23 +++++++++------
 2 files changed, 31 insertions(+), 21 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
index 7032c7e15039..3e128733ef53 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
@@ -61,6 +61,9 @@ properties:
       - description: used for 1st data pipe from RDMA
       - description: used for 2nd data pipe from RDMA
 
+  '#dma-cells':
+    const: 1
+
 required:
   - compatible
   - reg
@@ -70,6 +73,7 @@ required:
   - clocks
   - iommus
   - mboxes
+  - '#dma-cells'
 
 additionalProperties: false
 
@@ -80,16 +84,17 @@ examples:
     #include <dt-bindings/power/mt8183-power.h>
     #include <dt-bindings/memory/mt8183-larb-port.h>
 
-    mdp3_rdma0: mdp3-rdma0@14001000 {
-      compatible = "mediatek,mt8183-mdp3-rdma";
-      reg = <0x14001000 0x1000>;
-      mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x1000 0x1000>;
-      mediatek,gce-events = <CMDQ_EVENT_MDP_RDMA0_SOF>,
-                            <CMDQ_EVENT_MDP_RDMA0_EOF>;
-      power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
-      clocks = <&mmsys CLK_MM_MDP_RDMA0>,
-               <&mmsys CLK_MM_MDP_RSZ1>;
-      iommus = <&iommu>;
-      mboxes = <&gce 20 CMDQ_THR_PRIO_LOWEST>,
-               <&gce 21 CMDQ_THR_PRIO_LOWEST>;
+    dma-controller@14001000 {
+        compatible = "mediatek,mt8183-mdp3-rdma";
+        reg = <0x14001000 0x1000>;
+        mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x1000 0x1000>;
+        mediatek,gce-events = <CMDQ_EVENT_MDP_RDMA0_SOF>,
+                              <CMDQ_EVENT_MDP_RDMA0_EOF>;
+        power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
+        clocks = <&mmsys CLK_MM_MDP_RDMA0>,
+                 <&mmsys CLK_MM_MDP_RSZ1>;
+        iommus = <&iommu>;
+        mboxes = <&gce 20 CMDQ_THR_PRIO_LOWEST>,
+                 <&gce 21 CMDQ_THR_PRIO_LOWEST>;
+        #dma-cells = <1>;
     };
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
index 0baa77198fa2..64ea98aa0592 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
@@ -50,6 +50,9 @@ properties:
   iommus:
     maxItems: 1
 
+  '#dma-cells':
+    const: 1
+
 required:
   - compatible
   - reg
@@ -58,6 +61,7 @@ required:
   - power-domains
   - clocks
   - iommus
+  - '#dma-cells'
 
 additionalProperties: false
 
@@ -68,13 +72,14 @@ examples:
     #include <dt-bindings/power/mt8183-power.h>
     #include <dt-bindings/memory/mt8183-larb-port.h>
 
-    mdp3_wrot0: mdp3-wrot0@14005000 {
-      compatible = "mediatek,mt8183-mdp3-wrot";
-      reg = <0x14005000 0x1000>;
-      mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x5000 0x1000>;
-      mediatek,gce-events = <CMDQ_EVENT_MDP_WROT0_SOF>,
-                            <CMDQ_EVENT_MDP_WROT0_EOF>;
-      power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
-      clocks = <&mmsys CLK_MM_MDP_WROT0>;
-      iommus = <&iommu>;
+    dma-controller@14005000 {
+        compatible = "mediatek,mt8183-mdp3-wrot";
+        reg = <0x14005000 0x1000>;
+        mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x5000 0x1000>;
+        mediatek,gce-events = <CMDQ_EVENT_MDP_WROT0_SOF>,
+                              <CMDQ_EVENT_MDP_WROT0_EOF>;
+        power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
+        clocks = <&mmsys CLK_MM_MDP_WROT0>;
+        iommus = <&iommu>;
+        #dma-cells = <1>;
     };
-- 
2.18.0

