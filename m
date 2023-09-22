Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 938797AB3A4
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 16:29:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B6FB10E673;
	Fri, 22 Sep 2023 14:29:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400AD10E62A
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 07:21:26 +0000 (UTC)
X-UUID: a05d4402591811ee8051498923ad61e6-20230922
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=4uZFSmnFEs5Ua6ODsDr+OVdD1n3NlUn69ZZSBBhNAQY=; 
 b=QOVrkKeVQwqLwcqvj3+uIDp/jfaTM8xEtyhq0BLw7wFdm9lmKbau9AJJu/HsmSpjv+hEVoDLAykfPUv3Gyb5ud/3foOHcoMK4BTI34ehF3VC920lB8xIc4wsS8xtjtGvdymB7pnXUfDaJgHIjXbmxr/6Wee4+ukuu7pFR6ivgsI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:0407026d-33a7-461f-8882-50c5ef34fa3f, IP:0,
 U
 RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:25
X-CID-META: VersionHash:5f78ec9, CLOUDID:d78a00f0-9a6e-4c39-b73e-f2bc08ca3dc5,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: a05d4402591811ee8051498923ad61e6-20230922
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <moudy.ho@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1629845234; Fri, 22 Sep 2023 15:21:19 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Sep 2023 15:21:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Sep 2023 15:21:18 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v6 09/16] dt-bindings: media: mediatek: mdp3: add component
 STITCH for MT8195
Date: Fri, 22 Sep 2023 15:21:09 +0800
Message-ID: <20230922072116.11009-10-moudy.ho@mediatek.com>
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

Add the fundamental hardware configuration of component STITCH,
which is controlled by MDP3 on MT8195.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 .../bindings/media/mediatek,mdp3-tcc.yaml     | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml

diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
new file mode 100644
index 000000000000..245e2134c74a
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mdp3-tcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Media Data Path 3 TCC
+
+maintainers:
+  - Matthias Brugger <matthias.bgg@gmail.com>
+
+description:
+  One of Media Data Path 3 (MDP3) components used to support
+  HDR gamma curve conversion HDR displays.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8195-mdp3-tcc
+
+  reg:
+    maxItems: 1
+
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
+  clocks:
+    minItems: 1
+
+required:
+  - compatible
+  - reg
+  - mediatek,gce-client-reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8195-clk.h>
+    #include <dt-bindings/gce/mt8195-gce.h>
+
+    display@1400b000 {
+        compatible = "mediatek,mt8195-mdp3-tcc";
+        reg = <0x1400b000 0x1000>;
+        mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0xb000 0x1000>;
+        clocks = <&vppsys0 CLK_VPP0_MDP_TCC>;
+    };
-- 
2.18.0

