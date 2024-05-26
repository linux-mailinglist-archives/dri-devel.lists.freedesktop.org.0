Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 907888CF493
	for <lists+dri-devel@lfdr.de>; Sun, 26 May 2024 16:45:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5DA410ECE1;
	Sun, 26 May 2024 14:45:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="jhJyZkhK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EFC010ECFA
 for <dri-devel@lists.freedesktop.org>; Sun, 26 May 2024 14:44:51 +0000 (UTC)
X-UUID: 7f4f40bc1b6e11efbfff99f2466cf0b4-20240526
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=5iqv6x/ghbzUOX83DTvSQ+4xvQ/d9I2EOAPbwfRk/TA=; 
 b=jhJyZkhK9j4XP7X1dsdHIBLH0fG+zBK+5WztohqyA0H7XVw5vqwdo3cAh06WFZZdAJLY9AwWtXPcEyB7IpM+wGJ62/sYDDrwMb2F6FBuQdbA7FsdbWJ6B5YRA9Pk05+QRgXFmDZed4eu3W76Lb1LDnn+RMfXhNzWdK6gi0IsWFU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38, REQID:5f7acd1a-c93d-4ce4-8526-be88a65538b4, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:82c5f88, CLOUDID:d7a85384-4f93-4875-95e7-8c66ea833d57,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7f4f40bc1b6e11efbfff99f2466cf0b4-20240526
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1658814221; Sun, 26 May 2024 22:44:46 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sun, 26 May 2024 22:44:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sun, 26 May 2024 22:44:44 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: Conor Dooley <conor+dt@kernel.org>, Jason-ch Chen
 <jason-ch.chen@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH RESEND,
 v6 2/8] dt-bindings: mailbox: Add property for CMDQ secure driver
Date: Sun, 26 May 2024 22:44:37 +0800
Message-ID: <20240526144443.14345-3-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240526144443.14345-1-jason-jh.lin@mediatek.com>
References: <20240526144443.14345-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.815100-8.000000
X-TMASE-MatchedRID: OXh+vcntO3AXSulpnju2H23NvezwBrVmgYy8y+HaPlZOCtCDJNptxlkx
 R/OK+HA0Qv/RxZk9D1F8EK4uBc8FBrM5yFdOCNfRJLZygv5HzOXt/okBLaEo+JIuII6CcB9zTr4
 Kjlf+TXdryn58a4qF0HVUSbHuxOT/JogLSXP5a/d0BEBFOTiHn1sChor7BLiNzsQ8iRVyD45ZoZ
 UwtnkREuLzNWBegCW2wgn7iDBesS15zdAzex5xZi7QVrcw6a2RkF3QJQiIzo4J/ae5Bj5hUe1+s
 HjxVjEGRUQ1pOGS5K+UTGVAhB5EbQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.815100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 8BC45171C859439C88226BB04643934A9F8341B3FAD9BAB923E5E34DB624BF5D2000:8
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

1. Add mboxes property to define a GCE loopping thread as a secure IRQ
handler.
The CMDQ secure driver requests a mbox channel and sends a looping
command to the GCE thread. The looping command will wait for a secure
packet done event signal from secure world and then jump back to the
first instuction. Each time it waits for an event, it notifies the
CMDQ driver to perform the same action as the IRQ handler.

2. Add gce-events property from gce-props.yaml to define a
secure packet done signal in secure world.
There are 1024 events IDs for GCE to use to execute instructions in
the specific event happened. These events could be signaled by HW or SW
and their value would be different in different SoC because of HW event
IDs distribution range from 0 to 1023.
If we set a static event ID: 855 for mt8188, it might be conflict the
event ID original set in mt8195.
So we define an event ID that will be set when GCE runs to the end of
secure cmdq packet in the secure world.

This can reduce the latency of software communication between normal
world and secure world. In addition, we can also remove the complex
logic after the secure packet done in the secure world.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 .../devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
index cef9d7601398..6e5e848d61d9 100644
--- a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
@@ -49,6 +49,10 @@ properties:
     items:
       - const: gce
 
+  mboxes:
+    items:
+      - description: GCE looping thread as a secure IRQ handler
+
 required:
   - compatible
   - "#mbox-cells"
@@ -57,6 +61,8 @@ required:
   - clocks
 
 allOf:
+  - $ref: /schemas/mailbox/mediatek,gce-props.yaml#
+
   - if:
       not:
         properties:
@@ -67,7 +73,7 @@ allOf:
       required:
         - clock-names
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.18.0

