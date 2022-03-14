Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A64494D7DFF
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 10:00:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6E710E63A;
	Mon, 14 Mar 2022 09:00:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D7C810E4FB
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 09:00:44 +0000 (UTC)
X-UUID: 7b66c8882d1a4804a8d93fb35d0c1f2e-20220314
X-UUID: 7b66c8882d1a4804a8d93fb35d0c1f2e-20220314
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1619217444; Mon, 14 Mar 2022 17:00:36 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 14 Mar 2022 17:00:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 14 Mar 2022 17:00:35 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>, <robh+dt@kernel.org>
Subject: [PATCH V7 2/5] dt-bindings: display: mediatek: revise enum to const
Date: Mon, 14 Mar 2022 17:00:30 +0800
Message-ID: <20220314090033.25773-3-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220314090033.25773-1-rex-bc.chen@mediatek.com>
References: <20220314090033.25773-1-rex-bc.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, jassisinghbrar@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 yongqiang.niu@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 fparent@baylibre.com, linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There won't be more than 1 fallback for these bindings, so we modify
them to use const instead of enum.

Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/display/mediatek/mediatek,aal.yaml  | 3 +--
 .../bindings/display/mediatek/mediatek,ccorr.yaml           | 3 +--
 .../bindings/display/mediatek/mediatek,color.yaml           | 6 ++----
 .../bindings/display/mediatek/mediatek,dither.yaml          | 3 +--
 .../bindings/display/mediatek/mediatek,gamma.yaml           | 3 +--
 .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml  | 6 ++----
 .../devicetree/bindings/display/mediatek/mediatek,rdma.yaml | 6 ++----
 7 files changed, 10 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
index 6c8c83988a24..eaf23428b30d 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
@@ -31,8 +31,7 @@ properties:
               - mediatek,mt8183-disp-aal
               - mediatek,mt8192-disp-aal
               - mediatek,mt8195-disp-aal
-          - enum:
-              - mediatek,mt8173-disp-aal
+          - const: mediatek,mt8173-disp-aal
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
index 0ed53b6238f0..7766c806c102 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
@@ -28,8 +28,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8195-disp-ccorr
-          - enum:
-              - mediatek,mt8192-disp-ccorr
+          - const: mediatek,mt8192-disp-ccorr
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
index 3ad842eb5668..0c9095b0411e 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
@@ -32,15 +32,13 @@ properties:
           - enum:
               - mediatek,mt7623-disp-color
               - mediatek,mt2712-disp-color
-          - enum:
-              - mediatek,mt2701-disp-color
+          - const: mediatek,mt2701-disp-color
       - items:
           - enum:
               - mediatek,mt8183-disp-color
               - mediatek,mt8192-disp-color
               - mediatek,mt8195-disp-color
-          - enum:
-              - mediatek,mt8173-disp-color
+          - const: mediatek,mt8173-disp-color
   reg:
     maxItems: 1
 
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
index 6657549af165..8180ed0a89ff 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
@@ -28,8 +28,7 @@ properties:
           - enum:
               - mediatek,mt8192-disp-dither
               - mediatek,mt8195-disp-dither
-          - enum:
-              - mediatek,mt8183-disp-dither
+          - const: mediatek,mt8183-disp-dither
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
index 78442339314f..5f1825b4512b 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
@@ -29,8 +29,7 @@ properties:
           - enum:
               - mediatek,mt8192-disp-gamma
               - mediatek,mt8195-disp-gamma
-          - enum:
-              - mediatek,mt8183-disp-gamma
+          - const: mediatek,mt8183-disp-gamma
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
index f77094e61443..51f8235f1b1b 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
@@ -33,13 +33,11 @@ properties:
           - enum:
               - mediatek,mt7623-disp-ovl
               - mediatek,mt2712-disp-ovl
-          - enum:
-              - mediatek,mt2701-disp-ovl
+          - const: mediatek,mt2701-disp-ovl
       - items:
           - enum:
               - mediatek,mt8195-disp-ovl
-          - enum:
-              - mediatek,mt8183-disp-ovl
+          - const: mediatek,mt8183-disp-ovl
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
index e8c72afa0630..9a6756f185ee 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
@@ -35,13 +35,11 @@ properties:
           - enum:
               - mediatek,mt7623-disp-rdma
               - mediatek,mt2712-disp-rdma
-          - enum:
-              - mediatek,mt2701-disp-rdma
+          - const: mediatek,mt2701-disp-rdma
       - items:
           - enum:
               - mediatek,mt8192-disp-rdma
-          - enum:
-              - mediatek,mt8183-disp-rdma
+          - const: mediatek,mt8183-disp-rdma
 
   reg:
     maxItems: 1
-- 
2.31.0

