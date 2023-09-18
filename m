Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C767A52F9
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 21:22:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E1A10E2D7;
	Mon, 18 Sep 2023 19:22:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6806A10E2CB
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 19:22:16 +0000 (UTC)
X-UUID: a8ba440a565811ee8051498923ad61e6-20230919
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=AA6HVejvp6awQg2Gak+WLVNYgMCN9kZXJeFcHSpn1pg=; 
 b=UjuJAZnubSKjPRkABlZbxC8bLxZbt3JuBVyz4it1V4ZLNW0+Vn4oZ2lYjJH/JIMcvl6kOF4+QcMVzQ5JnEt7hXvIzbgfrY3YkmRx7402GZt/gz96och22+ymM8QcM0Mi7gKNBbdVv3qTC1Rfsk/pTURZwYXxUZ+BFVTLwS8qvD4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31, REQID:121d22cb-8030-48ad-91a0-dbd117989058, IP:0,
 U
 RL:0,TC:0,Content:38,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:38
X-CID-META: VersionHash:0ad78a4, CLOUDID:be0b1514-4929-4845-9571-38c601e9c3c9,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:3,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a8ba440a565811ee8051498923ad61e6-20230919
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1128183981; Tue, 19 Sep 2023 03:22:08 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 19 Sep 2023 03:22:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 19 Sep 2023 03:22:06 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 01/15] dt-bindings: mailbox: Add property for CMDQ secure
 driver
Date: Tue, 19 Sep 2023 03:21:50 +0800
Message-ID: <20230918192204.32263-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230918192204.32263-1-jason-jh.lin@mediatek.com>
References: <20230918192204.32263-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--10.597900-8.000000
X-TMASE-MatchedRID: iSQL5szRvdEXSulpnju2H6wxbZnudyr7ELbqrOgWzyfOxDyJFXIPjpM5
 rPAxB6p1j6kCfX0Edc5fvtuIsaf1ZSpMHNWH39YQXSKcwPTzq/J5y+Nu7/EOOgv/nTOPQovs3k1
 HMnSDPkfLqCJZs0VuwMJTJNWmePeVNyl1nd9CIt0URSScn+QSXt0H8LFZNFG7bkV4e2xSge4egJ
 CKnUjm4eHgAk/GRGDANamVZCBGTM1A7arqKflzisWFcyN1Agmm
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--10.597900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 7A111DE7BC234BF0F37F0DC80E0B29F8EB7F0415BBC63A13F4559B242582EBAC2000:8
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Elvis Wang <Elvis.Wang@mediatek.com>,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add mboxes to define a GCE loopping thread as a secure irq handler.
Add mediatek,event to define a GCE software event siganl as a secure
irq.

These 2 properties are required for CMDQ secure driver.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 .../mailbox/mediatek,gce-mailbox.yaml         | 30 +++++++++++++++----
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
index cef9d7601398..5c9aebe83d2d 100644
--- a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
@@ -49,6 +49,21 @@ properties:
     items:
       - const: gce
 
+  mboxes:
+    description:
+      A mailbox channel used as a secure irq handler in normal world.
+      Using mailbox to communicate with GCE to setup looping thread,
+      it should have this property and a phandle, mailbox specifiers.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+
+  mediatek,gce-events:
+    description:
+      The event id which is mapping to a software event signal to gce.
+      It is used as a secure irq for every secure gce threads.
+      The event id is defined in the gce header
+      include/dt-bindings/mailbox/mediatek,<chip>-gce.h of each chips.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
 required:
   - compatible
   - "#mbox-cells"
@@ -71,20 +86,23 @@ additionalProperties: false
 
 examples:
   - |
-    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/clock/mediatek,mt8188-clk.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/mailbox/mediatek,mt8188-gce.h>
 
     soc {
         #address-cells = <2>;
         #size-cells = <2>;
 
-        gce: mailbox@10212000 {
-            compatible = "mediatek,mt8173-gce";
-            reg = <0 0x10212000 0 0x1000>;
-            interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_LOW>;
+        gce0: mailbox@10320000 {
+            compatible = "mediatek,mt8188-gce";
+            reg = <0 0x10320000 0 0x4000>;
+            interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH 0>;
             #mbox-cells = <2>;
-            clocks = <&infracfg CLK_INFRA_GCE>;
+            clocks = <&infracfg_ao CLK_INFRA_AO_GCE>;
             clock-names = "gce";
+            mboxes = <&gce0 15 CMDQ_THR_PRIO_1>;
+            mediatek,gce-events = <CMDQ_SYNC_TOKEN_SECURE_THR_EOF>;
         };
     };
-- 
2.18.0

