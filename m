Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EFE4D7DFD
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 10:00:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84CF010E551;
	Mon, 14 Mar 2022 09:00:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF38310E4FB
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 09:00:42 +0000 (UTC)
X-UUID: 7fad5f1c71b340fb8b3b4cd74310b6b9-20220314
X-UUID: 7fad5f1c71b340fb8b3b4cd74310b6b9-20220314
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1264437347; Mon, 14 Mar 2022 17:00:37 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 14 Mar 2022 17:00:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 14 Mar 2022 17:00:35 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>, <robh+dt@kernel.org>
Subject: [PATCH V7 3/5] dt-bindings: display: mediatek: change to use enum for
 mutex
Date: Mon, 14 Mar 2022 17:00:31 +0800
Message-ID: <20220314090033.25773-4-rex-bc.chen@mediatek.com>
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

All single entry cases in mutex can be merged as a single enum.

Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../display/mediatek/mediatek,mutex.yaml      | 24 +++++++------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
index 00e6a1041a9b..b470fbb1b40a 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
@@ -23,21 +23,15 @@ description: |
 
 properties:
   compatible:
-    oneOf:
-      - items:
-          - const: mediatek,mt2701-disp-mutex
-      - items:
-          - const: mediatek,mt2712-disp-mutex
-      - items:
-          - const: mediatek,mt8167-disp-mutex
-      - items:
-          - const: mediatek,mt8173-disp-mutex
-      - items:
-          - const: mediatek,mt8183-disp-mutex
-      - items:
-          - const: mediatek,mt8192-disp-mutex
-      - items:
-          - const: mediatek,mt8195-disp-mutex
+    enum:
+      - mediatek,mt2701-disp-mutex
+      - mediatek,mt2712-disp-mutex
+      - mediatek,mt8167-disp-mutex
+      - mediatek,mt8173-disp-mutex
+      - mediatek,mt8183-disp-mutex
+      - mediatek,mt8192-disp-mutex
+      - mediatek,mt8195-disp-mutex
+
   reg:
     maxItems: 1
 
-- 
2.31.0

