Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCF34706FA
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 18:26:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8904310E620;
	Fri, 10 Dec 2021 17:26:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA9610E620
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 17:26:40 +0000 (UTC)
X-UUID: 0a5f46073efc4afeb2408acb8cd5efd5-20211211
X-UUID: 0a5f46073efc4afeb2408acb8cd5efd5-20211211
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <flora.fu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1998795543; Sat, 11 Dec 2021 01:26:36 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 11 Dec 2021 01:26:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 11 Dec 2021 01:26:34 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Yong Wu <yong.wu@mediatek.com>, Pi-Cheng Chen
 <pi-cheng.chen@mediatek.com>
Subject: [PATCH 02/17] dt-bindings: memory: mediatek: Add MT8192 apu iommu
 bindings
Date: Sat, 11 Dec 2021 01:25:50 +0800
Message-ID: <20211210172605.30618-3-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211210172605.30618-1-flora.fu@mediatek.com>
References: <20211210172605.30618-1-flora.fu@mediatek.com>
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
Cc: JB Tsai <jb.tsai@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Flora Fu <flora.fu@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MT8192 has one APU iommu hardware and add apu iommu bindings.

Signed-off-by: Flora Fu <flora.fu@mediatek.com>

---
 .../devicetree/bindings/iommu/mediatek,iommu.yaml          | 7 +++++--
 include/dt-bindings/memory/mt8192-larb-port.h              | 4 ++++
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
index c528a299afa9..14fae9642ec9 100644
--- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
@@ -77,6 +77,7 @@ properties:
           - mediatek,mt8173-m4u  # generation two
           - mediatek,mt8183-m4u  # generation two
           - mediatek,mt8192-m4u  # generation two
+          - mediatek,mt8192-iommu-apu        # generation two
           - mediatek,mt8195-iommu-vdo        # generation two
           - mediatek,mt8195-iommu-vpp        # generation two
           - mediatek,mt8195-iommu-infra      # generation two
@@ -154,6 +155,7 @@ allOf:
         compatible:
           enum:
             - mediatek,mt8192-m4u
+            - mediatek,mt8192-iommu-apu
             - mediatek,mt8195-iommu-vdo
             - mediatek,mt8195-iommu-vpp
 
@@ -165,8 +167,9 @@ allOf:
       not:
         properties:
           compatible:
-            contains:
-              const: mediatek,mt8195-iommu-infra
+            enum:
+              - mediatek,mt8192-iommu-apu
+              - mediatek,mt8195-iommu-infra
 
     then:
       required:
diff --git a/include/dt-bindings/memory/mt8192-larb-port.h b/include/dt-bindings/memory/mt8192-larb-port.h
index 23035a52c675..908d6831bf99 100644
--- a/include/dt-bindings/memory/mt8192-larb-port.h
+++ b/include/dt-bindings/memory/mt8192-larb-port.h
@@ -240,4 +240,8 @@
 #define M4U_PORT_L20_IPE_RSC_RDMA0		MTK_M4U_ID(20, 4)
 #define M4U_PORT_L20_IPE_RSC_WDMA		MTK_M4U_ID(20, 5)
 
+#define IOMMU_PORT_APU_DATA			MTK_M4U_ID(0, 0)
+#define IOMMU_PORT_APU_VLM			MTK_M4U_ID(0, 1)
+#define IOMMU_PORT_APU_VPU			MTK_M4U_ID(0, 2)
+
 #endif
-- 
2.18.0

