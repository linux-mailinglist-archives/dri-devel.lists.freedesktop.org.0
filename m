Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CF24F5A48
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 11:47:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4A9B10F25B;
	Wed,  6 Apr 2022 09:47:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6201410F25B
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 09:47:05 +0000 (UTC)
X-UUID: 19c4f01cbce549e09253314650db3da8-20220406
X-UUID: 19c4f01cbce549e09253314650db3da8-20220406
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 496445204; Wed, 06 Apr 2022 17:47:01 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 6 Apr 2022 17:46:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 6 Apr 2022 17:46:55 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>
Subject: [PATCH 1/3] dt-bindings: display: mediatek: Correct disp_aal binding
 for MT8183
Date: Wed, 6 Apr 2022 17:46:52 +0800
Message-ID: <20220406094654.29722-2-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220406094654.29722-1-rex-bc.chen@mediatek.com>
References: <20220406094654.29722-1-rex-bc.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, jason-jh.lin@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, nancy.lin@mediatek.com,
 linux-mediatek@lists.infradead.org, yongqiang.niu@mediatek.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 allen-kh.cheng@mediatek.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver data of MT8183 and MT8173 are different.
The value of has_gamma for MT8173 is true while the value of MT8183 is
false. Therefore, the compatible of disp_aal for MT8183 is not suitable
for the compatible for MT8173.

Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,aal.yaml  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
index cb4a2f39ff88..f118075e4a89 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
@@ -21,12 +21,12 @@ description: |
 properties:
   compatible:
     oneOf:
-      - items:
-          - const: mediatek,mt8173-disp-aal
+      - enum:
+          - mediatek,mt8173-disp-aal
+          - mediatek,mt8183-disp-aal
       - items:
           - enum:
               - mediatek,mt2712-disp-aal
-              - mediatek,mt8183-disp-aal
               - mediatek,mt8192-disp-aal
               - mediatek,mt8195-disp-aal
           - const: mediatek,mt8173-disp-aal
-- 
2.18.0

