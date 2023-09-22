Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 402F27AB3A3
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 16:29:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FFB710E67E;
	Fri, 22 Sep 2023 14:29:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ECD410E631
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 07:21:29 +0000 (UTC)
X-UUID: a052dcb0591811ee8051498923ad61e6-20230922
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=o9TyNrz3SR4xQQtRCtzAKiPKHJh47LnMYSwL+P8jdFQ=; 
 b=aT6TVU3q56sW/jIItTte1afQvQhDqxWQFRONPy1hU2h9zaTkBZfK6dF8MRQuF46O9Yy0/SL874z2GRTmPWqu72MuvRIkEEgd+/mTJ9pM7CTsso9bL2cC4421NJdWkAGhBxbVKvFYvRAQWC6mL6hgskMoFg3j81BplNckL20lTC4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:7c8529fd-a94e-43bd-8175-1415a823eab2, IP:0,
 U
 RL:25,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:d1ff54c3-1e57-4345-9d31-31ad9818b39f,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: a052dcb0591811ee8051498923ad61e6-20230922
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <moudy.ho@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1304453392; Fri, 22 Sep 2023 15:21:19 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Sep 2023 15:21:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Sep 2023 15:21:17 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v6 05/16] dt-bindings: media: mediatek: mdp3: add support
 MT8195 RDMA
Date: Fri, 22 Sep 2023 15:21:05 +0800
Message-ID: <20230922072116.11009-6-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230922072116.11009-1-moudy.ho@mediatek.com>
References: <20230922072116.11009-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--9.713800-8.000000
X-TMASE-MatchedRID: O8Jgwx2XgRPhE4ic2WIDe2BDygfqHJtpCt59Uh3p/NX7SBmDTxVcWopb
 wG9fIuITLSHDQi/tZU+OEmLXxEuoAga1NXbjqus0tw+xHnsmQjNr9+Kgn2XgeCNGK7UC7ElMj9F
 j+RtK2eCJh4lfRksIUEUHNW/Q98GjJnLCYm9iI2lIRA38P/dwbiFNSRSGhTH1Qmp51f2+39lrQg
 SRg6yiRRmgGxBaKosCPyxPFILKgxtf4BpTN+neE7dQIb8hCnY+fS0Ip2eEHnyFh/DzryTTlvc8O
 Jc7+0VJjoczmuoPCq1MRatPwfJPwaLUKJgmeE5OOoIt+KrTpqHr+QpBUoNuBClkx3v7Ew13Qwym
 txuJ6y0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--9.713800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 207E40E0AF5C08A661AF19D7796BDAEE95BBD0DB0C4DC5FB06006ED372971E992000:8
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
 dri-devel@lists.freedesktop.org, Moudy
 Ho <moudy.ho@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Support for MT8195 RDMA has been added, allowing for
the configuration of multiple MDP3 pipes.
Furthermore, this particular device does not require
sharing SRAM with RSZ.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 .../media/mediatek,mdp3-rdma-8195.yaml        | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-rdma-8195.yaml

diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma-8195.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma-8195.yaml
new file mode 100644
index 000000000000..f10139aec3c5
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma-8195.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma-8195.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT8195 Read Direct Memory Access
+
+maintainers:
+  - Matthias Brugger <matthias.bgg@gmail.com>
+  - Moudy Ho <moudy.ho@mediatek.com>
+
+description: |
+  MediaTek Read Direct Memory Access(RDMA) component used to do read DMA.
+  This type of component is configured when there are multiple MDP3 pipelines
+  that belong to different MMSYS subsystems.
+  It contains one line buffer to store the sufficient pixel data, and
+  must be siblings to the central MMSYS_CONFIG node.
+  For a description of the MMSYS_CONFIG binding, see
+  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+  for details.
+
+allOf:
+  - $ref: mediatek,mdp3-rdma-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: mediatek,mt8195-mdp3-rdma
+
+  clocks:
+    maxItems: 1
+
+  mboxes:
+    maxItems: 5
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8195-clk.h>
+    #include <dt-bindings/gce/mt8195-gce.h>
+    #include <dt-bindings/power/mt8195-power.h>
+    #include <dt-bindings/memory/mt8195-memory-port.h>
+
+    dma-controller@14001000 {
+        compatible = "mediatek,mt8195-mdp3-rdma";
+        reg = <0x14001000 0x1000>;
+        mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x1000 0x1000>;
+        mediatek,gce-events = <CMDQ_EVENT_VPP0_MDP_RDMA_SOF>,
+                              <CMDQ_EVENT_VPP0_MDP_RDMA_FRAME_DONE>;
+        power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS0>;
+        iommus = <&iommu_vpp M4U_PORT_L4_MDP_RDMA>;
+        clocks = <&vppsys0 CLK_VPP0_MDP_RDMA>;
+        mboxes = <&gce1 12 CMDQ_THR_PRIO_1>,
+                 <&gce1 13 CMDQ_THR_PRIO_1>,
+                 <&gce1 14 CMDQ_THR_PRIO_1>,
+                 <&gce1 21 CMDQ_THR_PRIO_1>,
+                 <&gce1 22 CMDQ_THR_PRIO_1>;
+        #dma-cells = <1>;
+    };
-- 
2.18.0

