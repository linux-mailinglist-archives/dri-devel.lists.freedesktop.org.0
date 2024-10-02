Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D7398CC49
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 07:16:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B7010E69F;
	Wed,  2 Oct 2024 05:16:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="TL/sHVuJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E058610E13A
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 05:16:34 +0000 (UTC)
X-UUID: 7b0a5f18807d11ef8b96093e013ec31c-20241002
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Bg67y45sJLDWjIhf42JgILUWAHQQxL5OwkXAp+pyoUM=; 
 b=TL/sHVuJ/HkEd0sGs5OyZ8Wm2AgpNJgS29R3/mC1HDOSSnP4iFS9MZPUCyVnzAj1lRv0wjMm9dQ7+/ZxVcEAG/izkWf/9Vegvge6AYD5OMA8TsWRa10zKDHGVGrciYjllEtfUz7/unR29FQIpplLIcovNeBdDVUXQqZFME+R2tI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:cfd62d70-5c99-4b64-99ec-bf71d2228481, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
 ON:release,TS:-30
X-CID-META: VersionHash:6dc6a47, CLOUDID:fb3c93bd-085c-4112-81e0-4d6de274b71a,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:1|19,IP:nil
 ,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
 1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 7b0a5f18807d11ef8b96093e013ec31c-20241002
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <macpaul.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1176561340; Wed, 02 Oct 2024 13:16:29 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 2 Oct 2024 13:16:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 2 Oct 2024 13:16:27 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yong Wu <yong.wu@mediatek.com>, "Joerg
 Roedel" <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Rohit
 Agarwal" <rohiagar@chromium.org>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, Alexandre Mergnat
 <amergnat@baylibre.com>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, "Sen
 Chu" <sen.chu@mediatek.com>, Chris-qj chen <chris-qj.chen@mediatek.com>,
 MediaTek Chromebook Upstream
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai
 <wenst@chromium.org>, Jitao Shi <jitao.shi@mediatek.com>
Subject: [PATCH v5 5/5] dt-bindings: display: mediatek: dpi: correct
 power-domains property
Date: Wed, 2 Oct 2024 13:16:20 +0800
Message-ID: <20241002051620.2050-5-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241002051620.2050-1-macpaul.lin@mediatek.com>
References: <20241002051620.2050-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--10.634400-8.000000
X-TMASE-MatchedRID: qW4A1GTxjidpqqYAQ+J6uSYRREGYqtmUmoKXVHfiMM9KUzR+o2IehUGW
 yClQhQkvKY6B7sY8Ci7dRIKCUEZlk77J5yv1W35KY1bQMCMvmn4wCmrLlx+Sdd9RlPzeVuQQ5Jl
 eqmLDfgeWjiti7ndJY6woSk24kDBQaxXbwRJk57z0hv/rD7WVZA+jS+LRpl81pzPA3TKVblhgIS
 cCiWkKENIS3Y3mrYfnGcJ+wyELRguQwm5+b+ZNPWwbuvhCHs3cmyqQJWNsuklnuv8pVwMzSaPFj
 JEFr+olwXCBO/GKkVqOhzOa6g8KrfkaNMSfS/D+K5v8OQfnaBP6qsC2xx+Wmy4ZRUSszZeETiVC
 Ktsw/v8=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--10.634400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 08878B16980C801A2C015D8BC46D98EC4BC1ADCE8371B370D402AF6CB3CBE6B22000:8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The MediaTek DPI module is typically associated with one of the
following multimedia power domains:
 - POWER_DOMAIN_DISPLAY
 - POWER_DOMAIN_VDOSYS
 - POWER_DOMAIN_MM
The specific power domain used varies depending on the SoC design.

These power domains are shared by multiple devices within the SoC.
In most cases, these power domains are enabled by other devices.
As a result, the DPI module of legacy SoCs often functions correctly
even without explicit configuration.

It is recommended to explicitly add the appropriate power domain
property to the DPI node in the device tree. Hence drop the
compatible checking for specific SoCs.

Fixes: 5474d49b2f79 ("dt-bindings: display: mediatek: dpi: Add power domains")
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../display/mediatek/mediatek,dpi.yaml        | 24 ++++++++-----------
 1 file changed, 10 insertions(+), 14 deletions(-)

Changes for v2:
 - Because of the corresponding dts fix has been reviewed with a Reviewed-by: tag.
   [1] https://lore.kernel.org/all/20240925080515.16377-1-macpaul.lin@mediatek.com/
   We still need this change to fix the 2 dtbs_check errors.
   So keeps no change here.

Changes for v3:
 - The origin patch is [2]
   https://lore.kernel.org/all/20240926111449.9245-2-macpaul.lin@mediatek.com/
 - Thanks for Conor's reminding, after MediaTek's internal discussion,
   This patch v3 is the replacement of [2] v2.
   Because the DPI module should has a explicit configuration with power domain.
 - Drop Acked-by: tag since v3 is nearly a new patch for different approach.

Changes for v4:
 - No change. Please help to review it again.

Changes for v5:
 - Add missing Reviewed-by Tag from Krzysztof. Thanks.

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index 3a82aec9021c..497c0eb4ed0b 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -63,6 +63,16 @@ properties:
       - const: sleep
 
   power-domains:
+    description: |
+      The MediaTek DPI module is typically associated with one of the
+      following multimedia power domains:
+        POWER_DOMAIN_DISPLAY
+        POWER_DOMAIN_VDOSYS
+        POWER_DOMAIN_MM
+      The specific power domain used varies depending on the SoC design.
+
+      It is recommended to explicitly add the appropriate power domain
+      property to the DPI node in the device tree.
     maxItems: 1
 
   port:
@@ -79,20 +89,6 @@ required:
   - clock-names
   - port
 
-allOf:
-  - if:
-      not:
-        properties:
-          compatible:
-            contains:
-              enum:
-                - mediatek,mt6795-dpi
-                - mediatek,mt8173-dpi
-                - mediatek,mt8186-dpi
-    then:
-      properties:
-        power-domains: false
-
 additionalProperties: false
 
 examples:
-- 
2.45.2

