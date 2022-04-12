Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C8D4FD7CF
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 12:31:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E10910E49E;
	Tue, 12 Apr 2022 10:31:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B51D10E49E
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 10:31:26 +0000 (UTC)
X-UUID: 17f84c6bba8847ebb667292610c8b43d-20220412
X-UUID: 17f84c6bba8847ebb667292610c8b43d-20220412
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1588826275; Tue, 12 Apr 2022 18:31:17 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 12 Apr 2022 18:31:16 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 12 Apr 2022 18:31:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 12 Apr 2022 18:31:15 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v18 01/10] dt-bindings: arm: mediatek: mmsys: add power and
 gce properties
Date: Tue, 12 Apr 2022 18:31:05 +0800
Message-ID: <20220412103114.19922-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220412103114.19922-1-jason-jh.lin@mediatek.com>
References: <20220412103114.19922-1-jason-jh.lin@mediatek.com>
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
Cc: fshao@chromium.org, David Airlie <airlied@linux.ie>,
 singo.chang@mediatek.com, dri-devel@lists.freedesktop.org,
 Fabien Parent <fparent@baylibre.com>, linux-stm32@st-md-mailman.stormreply.com,
 roy-cw.yeh@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Rex-BC
 Chen <rex-bc.chen@mediatek.com>, devicetree@vger.kernel.org,
 nancy.lin@mediatek.com, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, linux-arm-kernel@lists.infradead.org,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, linux-kernel@vger.kernel.org,
 moudy.ho@mediatek.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Power:
1. Add description for power-domains property.

GCE:
1. Add description for mboxes property.
2. Add description for mediatek,gce-client-reg property.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 .../bindings/arm/mediatek/mediatek,mmsys.yaml | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
index b31d90dc9eb4..6c2c3edcd443 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
@@ -41,6 +41,30 @@ properties:
   reg:
     maxItems: 1
 
+  power-domains:
+    description:
+      A phandle and PM domain specifier as defined by bindings
+      of the power controller specified by phandle. See
+      Documentation/devicetree/bindings/power/power-domain.yaml for details.
+
+  mboxes:
+    description:
+      Using mailbox to communicate with GCE, it should have this
+      property and list of phandle, mailbox specifiers. See
+      Documentation/devicetree/bindings/mailbox/mtk-gce.txt for details.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+
+  mediatek,gce-client-reg:
+    description:
+      The register of client driver can be configured by gce with 4 arguments
+      defined in this property, such as phandle of gce, subsys id,
+      register offset and size.
+      Each subsys id is mapping to a base address of display function blocks
+      register which is defined in the gce header
+      include/dt-bindings/gce/<chip>-gce.h.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    maxItems: 1
+
   "#clock-cells":
     const: 1
 
@@ -56,9 +80,16 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/power/mt8173-power.h>
+    #include <dt-bindings/gce/mt8173-gce.h>
+
     mmsys: syscon@14000000 {
         compatible = "mediatek,mt8173-mmsys", "syscon";
         reg = <0x14000000 0x1000>;
+        power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
         #clock-cells = <1>;
         #reset-cells = <1>;
+        mboxes = <&gce 0 CMDQ_THR_PRIO_HIGHEST>,
+                 <&gce 1 CMDQ_THR_PRIO_HIGHEST>;
+        mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
     };
-- 
2.18.0

