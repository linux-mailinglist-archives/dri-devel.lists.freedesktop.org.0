Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 015FC3DA7D7
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 17:49:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA9356EDE1;
	Thu, 29 Jul 2021 15:49:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8FEF6EDD4
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 15:49:21 +0000 (UTC)
X-UUID: aad2b7d456c54974bf7f417a805b4307-20210729
X-UUID: aad2b7d456c54974bf7f417a805b4307-20210729
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 13313127; Thu, 29 Jul 2021 23:49:15 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Jul 2021 23:49:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 29 Jul 2021 23:49:13 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Enric Balletbo Serra
 <eballetbo@gmail.com>
Subject: [PATCH v2 1/5] dt-bindings: arm: mediatek: mmsys: add mt8195 SoC
 binding
Date: Thu, 29 Jul 2021 23:49:08 +0800
Message-ID: <20210729154912.20051-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210729154912.20051-1-jason-jh.lin@mediatek.com>
References: <20210729154912.20051-1-jason-jh.lin@mediatek.com>
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
 fshao@chromium.org, David Airlie <airlied@linux.ie>, jason-jh.lin@mediatek.com,
 singo.chang@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Fabien Parent <fparent@baylibre.com>,
 nancy.lin@mediatek.com, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

1. There are 2 mmsys, namely vdosys0 and vdosys1 in mt8195.
   Each of them is bound to a display pipeline, so add their
   definition in mtk-mmsys documentation with 2 compatibles.

2. Add description for power-domain property.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
this patch is base on [1][2]

[1] dt-bindings: arm: mediatek: mmsys: convert to YAML format
- https://patchwork.kernel.org/project/linux-mediatek/patch/20210519161847.3747352-1-fparent@baylibre.com/
[2] dt-bindings: arm: mediatek: mmsys: add MT8365 SoC binding
- https://patchwork.kernel.org/project/linux-mediatek/patch/20210519161847.3747352-2-fparent@baylibre.com/
---
 .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml  | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
index 2d4ff0ce387b..68cb330d7595 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
@@ -30,6 +30,8 @@ properties:
               - mediatek,mt8173-mmsys
               - mediatek,mt8183-mmsys
               - mediatek,mt8365-mmsys
+              - mediatek,mt8195-vdosys0
+              - mediatek,mt8195-vdosys1
           - const: syscon
       - items:
           - const: mediatek,mt7623-mmsys
@@ -39,6 +41,12 @@ properties:
   reg:
     maxItems: 1
 
+  power-domains:
+    description:
+      A phandle and PM domain specifier as defined by bindings
+      of the power controller specified by phandle. See
+      Documentation/devicetree/bindings/power/power-domain.yaml for details.
+
   "#clock-cells":
     const: 1
 
-- 
2.18.0

