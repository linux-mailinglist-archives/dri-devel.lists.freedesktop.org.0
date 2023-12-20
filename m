Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC53819C42
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 11:09:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFE7910E54C;
	Wed, 20 Dec 2023 10:09:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C63A10E21F
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 10:09:04 +0000 (UTC)
X-UUID: ca2551ce9f1f11eea5db2bebc7c28f94-20231220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=tJf5yBrmP9+h3QbyKaZHSTjQbagz9H0rJQiO4PcgBeM=; 
 b=tzsDckxivlCoqe/6LBp/NJGpzGkucW2VQj47WSNxkbETMvdYsrLWeOBgBFPtl9QNEvD81RtY0xFfgkQdf6CMcUiMLisSxLexU6WDCI2Ns0RY4am00z74bYRUrv/8dzYMwUPuKwSAhclekw5t+wE009102/Gf9uiD2cYsIyG0P0c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35, REQID:3540aef8-907b-4aad-884f-b83571c482ec, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5d391d7, CLOUDID:547cfa81-8d4f-477b-89d2-1e3bdbef96d1,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ca2551ce9f1f11eea5db2bebc7c28f94-20231220
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw01.mediatek.com (envelope-from <moudy.ho@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1235464029; Wed, 20 Dec 2023 18:08:57 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Dec 2023 18:08:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Dec 2023 18:08:57 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v10 15/16] dt-bindings: display: mediatek: split: add
 compatible for MT8195
Date: Wed, 20 Dec 2023 18:08:52 +0800
Message-ID: <20231220100853.20616-16-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231220100853.20616-1-moudy.ho@mediatek.com>
References: <20231220100853.20616-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.601900-8.000000
X-TMASE-MatchedRID: iSQL5szRvdEmeoNhEXvE7GNW0DAjL5p++OI6XsK3BWHfUZT83lbkEItz
 U8iLelfKk5fnUPZTc0s2rGI383MBk6LCTO1UKypvSEQN/D/3cG6H7D1bP/FcOlmmz7LVVfOpZBw
 rIERGz+EZoBsQWiqLArpjAjMHHtZlHxPMjOKY7A8LbigRnpKlKTpcQTtiHDgW5Q+Bm+TIeXAeWq
 FdbyWvC5jmE9ANWG0Ol5kCTqXarhuP6/1EAjxJyV4Vqu1jjx3ewtvdkgBWssu8enuHvqOd7i18q
 lBVnRX0wZBgUyJVEbl6Fw8/PpTMRaVvmiAyeA2kc5MSfkiJFI5p3LlElBHTlw==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.601900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 2C204B67FA4184FFB7BA7E558FD1464141EEFDFF9275A3FDC2BBEF0A63451AB92000:8
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
 dri-devel@lists.freedesktop.org, Moudy
 Ho <moudy.ho@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add compatible string and GCE property for MT8195 SPLIT, of
which is operated by MDP3.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../display/mediatek/mediatek,split.yaml      | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
index a8a5c9608598..e4affc854f3d 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
@@ -23,6 +23,7 @@ properties:
     oneOf:
       - enum:
           - mediatek,mt8173-disp-split
+          - mediatek,mt8195-mdp3-split
       - items:
           - const: mediatek,mt6795-disp-split
           - const: mediatek,mt8173-disp-split
@@ -38,6 +39,21 @@ properties:
       the power controller specified by phandle. See
       Documentation/devicetree/bindings/power/power-domain.yaml for details.
 
+  mediatek,gce-client-reg:
+    description:
+      The register of display function block to be set by gce. There are 4 arguments,
+      such as gce node, subsys id, offset and register size. The subsys id that is
+      mapping to the register of display function blocks is defined in the gce header
+      include/dt-bindings/gce/<chip>-gce.h of each chips.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      items:
+        - description: phandle of GCE
+        - description: GCE subsys id
+        - description: register offset
+        - description: register size
+    maxItems: 1
+
   clocks:
     items:
       - description: SPLIT Clock
@@ -48,6 +64,17 @@ required:
   - power-domains
   - clocks
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8195-mdp3-split
+
+    then:
+      required:
+        - mediatek,gce-client-reg
+
 additionalProperties: false
 
 examples:
-- 
2.18.0

