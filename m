Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5D93D20D2
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 11:26:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46CE76EA14;
	Thu, 22 Jul 2021 09:26:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B70E26EA14
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 09:26:33 +0000 (UTC)
X-UUID: edd9ba5fff30483fb88e0d7c63b942fc-20210722
X-UUID: edd9ba5fff30483fb88e0d7c63b942fc-20210722
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2121166629; Thu, 22 Jul 2021 17:26:28 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Jul 2021 17:26:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 22 Jul 2021 17:26:28 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v1 5/5] dt-bindings: mediatek: display: add mt8195 SoC binding
Date: Thu, 22 Jul 2021 17:26:24 +0800
Message-ID: <20210722092624.14401-6-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210722092624.14401-1-jason-jh.lin@mediatek.com>
References: <20210722092624.14401-1-jason-jh.lin@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Jitao shi <jitao.shi@mediatek.com>,
 fshao@chromium.org, David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Fabien Parent <fparent@baylibre.com>, nancy.lin@mediatek.com,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add mt8195 SoC display binding.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 .../display/mediatek/mediatek,disp.yaml       | 24 +++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml
index f16ee592735d..db0491ddb1d2 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml
@@ -54,6 +54,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8192-disp-ovl
+              - mediatek,mt8195-disp-ovl
           - enum:
               - mediatek,mt8183-disp-ovl
 
@@ -73,6 +74,8 @@ properties:
           - const: mediatek,mt8173-disp-rdma
       - items:
           - const: mediatek,mt8183-disp-rdma
+      - items:
+          - const: mediatek,mt8195-disp-rdma
       - items:
           - enum:
               - mediatek,mt7623-disp-rdma
@@ -95,6 +98,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8192-disp-ccorr
+              - mediatek,mt8195-disp-ccorr
           - enum:
               - mediatek,mt8183-disp-ccorr
 
@@ -115,6 +119,7 @@ properties:
           - enum:
               - mediatek,mt8183-disp-color
               - mediatek,mt8192-disp-color
+              - mediatek,mt8195-disp-color
           - enum:
               - mediatek,mt8173-disp-color
 
@@ -124,6 +129,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8192-disp-dither
+              - mediatek,mt8195-disp-dither
           - enum:
               - mediatek,mt8183-disp-dither
 
@@ -135,6 +141,7 @@ properties:
               - mediatek,mt2712-disp-aal
               - mediatek,mt8183-disp-aal
               - mediatek,mt8192-disp-aal
+              - mediatek,mt8195-disp-aal
           - enum:
               - mediatek,mt8173-disp-aal
 
@@ -146,10 +153,17 @@ properties:
       - items:
           - enum:
               - mediatek,mt8192-disp-gamma
+              - mediatek,mt8195-disp-gamma
           - enum:
               - mediatek,mt8183-disp-gamma
 
+      # DSC: see Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml for details.
+      - items:
+          - const: mediatek,mt8195-disp-dsc
+
       # MERGE: merge streams from two RDMA sources
+      - items:
+          - const: mediatek,mt8195-disp-merge
 
       # POSTMASK: control round corner for display frame
       - items:
@@ -209,6 +223,8 @@ properties:
           - const: mediatek,mt8183-disp-mutex
       - items:
           - const: mediatek,mt8192-disp-mutex
+      - items:
+          - const: mediatek,mt8195-disp-mutex
 
       # OD: overdrive
       - items:
@@ -237,7 +253,7 @@ properties:
   mediatek,larb:
     description: The compatible property should be one of DMA function blocks,
       such as "mediatek,<chip>-disp-ovl", "mediatek,<chip>-disp-rdma" or
-      "mediatek,<chip>-disp-wdma". The supported chips are mt2701, mt8167 and mt8173.
+      "mediatek,<chip>-disp-wdma". The supported chips are mt2701, mt8167, mt8173 and mt8195.
       Should contain a phandle pointing to the local arbiter device as defined in
       Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml.
       It must sort according to the local arbiter index, like larb0, larb1, larb2...
@@ -248,7 +264,7 @@ properties:
   iommus:
     description: The compatible property should be one of DMA function blocks,
       such as "mediatek,<chip>-disp-ovl", "mediatek,<chip>-disp-rdma" or
-      "mediatek,<chip>-disp-wdma". The supported chips are mt2701, mt8167 and mt8173.
+      "mediatek,<chip>-disp-wdma". The supported chips are mt2701, mt8167, mt8173 and mt8195.
       Should point to the respective IOMMU block with master port as argument, see
       Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
 
@@ -442,3 +458,7 @@ examples:
         power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
         clocks = <&mmsys CLK_MM_DISP_OD>;
     };
+
+    dsc0: disp_dsc_wrap@1c009000 {
+        /* See mediatek,dsc.yaml for details */
+    };
-- 
2.18.0

