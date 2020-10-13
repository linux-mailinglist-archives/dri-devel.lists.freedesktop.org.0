Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 619C428DA37
	for <lists+dri-devel@lfdr.de>; Wed, 14 Oct 2020 09:04:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D42D26E9FC;
	Wed, 14 Oct 2020 07:04:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id D764D6E0B8
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 08:52:17 +0000 (UTC)
X-UUID: 2eca91f15b4648e78c5e2468ff22dda3-20201013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=yU/qMyuYQN6+jcF7wWybgjSPMFFe8LTU7oNijK5E7Ac=; 
 b=mdE5OkwS7XoF1a4imm1CsUV4/G8+WSHVxgdfw8rdWQpzpHCnrkgx9RT61h/4Bv7uiaiMh3j9ZM3yedCk1kCirp7aq/P9fYhDqe7flLGvTrns5Xx1nHF6pDNH9OthQONwqNZa4FKUa7pcW+lzL2gEqrRXbr6Nm4tuDDDCRCQi/B0=;
X-UUID: 2eca91f15b4648e78c5e2468ff22dda3-20201013
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <chunfeng.yun@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1789263465; Tue, 13 Oct 2020 16:52:13 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 13 Oct 2020 16:52:12 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 13 Oct 2020 16:52:12 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 3/8] dt-bindings: phy: convert phy-mtk-ufs.txt to YAML
 schema
Date: Tue, 13 Oct 2020 16:52:02 +0800
Message-ID: <20201013085207.17749-3-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201013085207.17749-1-chunfeng.yun@mediatek.com>
References: <20201013085207.17749-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Wed, 14 Oct 2020 07:03:59 +0000
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Min Guo <min.guo@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 linux-mediatek@lists.infradead.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert phy-mtk-ufs.txt to YAML schema mediatek,ufs-phy.yaml

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: fix binding check warning of reg in example
---
 .../bindings/phy/mediatek,ufs-phy.yaml        | 64 +++++++++++++++++++
 .../devicetree/bindings/phy/phy-mtk-ufs.txt   | 38 -----------
 2 files changed, 64 insertions(+), 38 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/mediatek,ufs-phy.yaml
 delete mode 100644 Documentation/devicetree/bindings/phy/phy-mtk-ufs.txt

diff --git a/Documentation/devicetree/bindings/phy/mediatek,ufs-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,ufs-phy.yaml
new file mode 100644
index 000000000000..3a9be82e7f13
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/mediatek,ufs-phy.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2020 MediaTek
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/mediatek,ufs-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Universal Flash Storage (UFS) M-PHY binding
+
+maintainers:
+  - Stanley Chu <stanley.chu@mediatek.com>
+  - Chunfeng Yun <chunfeng.yun@mediatek.com>
+
+description: |
+  UFS M-PHY nodes are defined to describe on-chip UFS M-PHY hardware macro.
+  Each UFS M-PHY node should have its own node.
+  To bind UFS M-PHY with UFS host controller, the controller node should
+  contain a phandle reference to UFS M-PHY node.
+
+properties:
+  $nodename:
+    pattern: "^ufs-phy@[0-9a-f]+$"
+
+  compatible:
+    const: mediatek,mt8183-ufsphy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Unipro core control clock.
+      - description: M-PHY core control clock.
+
+  clock-names:
+    items:
+      - const: unipro
+      - const: mp
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8183-clk.h>
+    ufsphy: ufs-phy@11fa0000 {
+        compatible = "mediatek,mt8183-ufsphy";
+        reg = <0x11fa0000 0xc000>;
+        clocks = <&infracfg CLK_INFRA_UNIPRO_SCK>,
+                 <&infracfg CLK_INFRA_UFS_MP_SAP_BCLK>;
+        clock-names = "unipro", "mp";
+        #phy-cells = <0>;
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/phy/phy-mtk-ufs.txt b/Documentation/devicetree/bindings/phy/phy-mtk-ufs.txt
deleted file mode 100644
index 5789029a1d42..000000000000
--- a/Documentation/devicetree/bindings/phy/phy-mtk-ufs.txt
+++ /dev/null
@@ -1,38 +0,0 @@
-MediaTek Universal Flash Storage (UFS) M-PHY binding
---------------------------------------------------------
-
-UFS M-PHY nodes are defined to describe on-chip UFS M-PHY hardware macro.
-Each UFS M-PHY node should have its own node.
-
-To bind UFS M-PHY with UFS host controller, the controller node should
-contain a phandle reference to UFS M-PHY node.
-
-Required properties for UFS M-PHY nodes:
-- compatible         : Compatible list, contains the following controller:
-                       "mediatek,mt8183-ufsphy" for ufs phy
-                       persent on MT81xx chipsets.
-- reg                : Address and length of the UFS M-PHY register set.
-- #phy-cells         : This property shall be set to 0.
-- clocks             : List of phandle and clock specifier pairs.
-- clock-names        : List of clock input name strings sorted in the same
-                       order as the clocks property. Following clocks are
-                       mandatory.
-                       "unipro": Unipro core control clock.
-                       "mp": M-PHY core control clock.
-
-Example:
-
-	ufsphy: phy@11fa0000 {
-		compatible = "mediatek,mt8183-ufsphy";
-		reg = <0 0x11fa0000 0 0xc000>;
-		#phy-cells = <0>;
-
-		clocks = <&infracfg_ao INFRACFG_AO_UNIPRO_SCK_CG>,
-			 <&infracfg_ao INFRACFG_AO_UFS_MP_SAP_BCLK_CG>;
-		clock-names = "unipro", "mp";
-	};
-
-	ufshci@11270000 {
-		...
-		phys = <&ufsphy>;
-	};
-- 
2.18.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
