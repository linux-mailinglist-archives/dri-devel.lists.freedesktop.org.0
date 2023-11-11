Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4147E8A9C
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 12:17:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E11DB10E276;
	Sat, 11 Nov 2023 11:17:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3EB110E276
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 11:17:45 +0000 (UTC)
X-UUID: ed1ba80a808311eea33bb35ae8d461a2-20231111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=h0jwM9zWwa5D3l5JQgrd0AZPHaBGPLCLDPqIefNNn9w=; 
 b=M3Pyx07EbPyVhoaPt7nZ/FX16J/WlhF9ReDp2DytfLanRl1hkcg6DJdyygoeHF2cbwXDCfRX82H8qu2ioElOiHgeLvmHJGj2MW1aJeNBT/qKTxMah3Qdlug+Tmq7Xql32hK/AcLwgauDx1jtXqluSjT8HK/5nO3HQAQUqaFm+do=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33, REQID:eeace6ff-da5e-403e-a8d4-6413bef47f5d, IP:0,
 U
 RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:25
X-CID-META: VersionHash:364b77b, CLOUDID:7ff2f05f-c89d-4129-91cb-8ebfae4653fc,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:1,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: ed1ba80a808311eea33bb35ae8d461a2-20231111
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw01.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 769761032; Sat, 11 Nov 2023 19:17:40 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 11 Nov 2023 19:17:37 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 11 Nov 2023 19:17:36 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 <christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 6/8] dt-bindings: reserved-memory: Add secure CMA reserved
 memory range
Date: Sat, 11 Nov 2023 19:15:57 +0800
Message-ID: <20231111111559.8218-7-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231111111559.8218-1-yong.wu@mediatek.com>
References: <20231111111559.8218-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.888000-8.000000
X-TMASE-MatchedRID: y64C6oV0e4cXSulpnju2H8LPXKYZysJRecvjbu/xDjpMOjKUxCZwrxVq
 ALLbOC6VBRj5e39v/eGsMR/ATxTHjSWvhQBtQUwTyeVujmXuYYX+yhO1yCoLfDP3WYNhkszluHQ
 5SWRKq/0I49goOhQ2+ItfNuTBizUEQF24kZp9Ww+eAiCmPx4NwGmRqNBHmBvejvEeq6gAkYbfaY
 87m2dqx9934/rDAK3zCaXr04pRMJA1yGL4+nAmxJD/HwNezREOO8fzLmP53G+oHvd3pfFwUF+/A
 KUOIHlXyFVWUnr9FwsfFdcY8tD7GQ6w2+Ixe72XP1JC+7l10KltUY6LqdlQnFr3vnlc+D6eVZOb
 rZkNVZRlRd/nfa56MV7IEEqsePYG
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.888000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: C04951FF99BF27E30025E22F729504596E746D2DEA39644EF37717C76995E8582000:8
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
Cc: dri-devel@lists.freedesktop.org, John Stultz <jstultz@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jeffrey Kardatzke <jkardatzke@google.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Vijayanand Jitta <quic_vjitta@quicinc.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, Yong Wu <yong.wu@mediatek.com>,
 jianjiao.zeng@mediatek.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org,
 linux-mediatek@lists.infradead.org, Joakim Bech <joakim.bech@linaro.org>,
 tjmercier@google.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a binding for describing the secure CMA reserved memory range. The
memory range also will be defined in the TEE firmware. It means the TEE
will be configured with the same address/size that is being set in this
DT node.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 .../reserved-memory/secure_cma_region.yaml    | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/secure_cma_region.yaml

diff --git a/Documentation/devicetree/bindings/reserved-memory/secure_cma_region.yaml b/Documentation/devicetree/bindings/reserved-memory/secure_cma_region.yaml
new file mode 100644
index 000000000000..8ab559595fbe
--- /dev/null
+++ b/Documentation/devicetree/bindings/reserved-memory/secure_cma_region.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reserved-memory/secure_cma_region.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Secure Reserved CMA Region
+
+description:
+  This binding describes a CMA region that can dynamically transition
+between secure and non-secure states that a TEE can allocate memory
+from.
+
+maintainers:
+  - Yong Wu <yong.wu@mediatek.com>
+
+allOf:
+  - $ref: reserved-memory.yaml
+
+properties:
+  compatible:
+    const: secure_cma_region
+
+required:
+  - compatible
+  - reg
+  - reusable
+
+unevaluatedProperties: false
+
+examples:
+  - |
+
+    reserved-memory {
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        reserved-memory@80000000 {
+            compatible = "secure_cma_region";
+            reusable;
+            reg = <0x80000000 0x18000000>;
+        };
+    };
-- 
2.25.1

