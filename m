Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 076C94EB9E9
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 07:12:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD7DC10F3BF;
	Wed, 30 Mar 2022 05:12:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40C9010F3BF
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 05:12:30 +0000 (UTC)
X-UUID: c788adcedbfb4701b48689ef8bb3e588-20220330
X-UUID: c788adcedbfb4701b48689ef8bb3e588-20220330
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <miles.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 838381258; Wed, 30 Mar 2022 13:12:19 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Mar 2022 13:12:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 30 Mar 2022 13:12:17 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <granquet@baylibre.com>
Subject: Re: [PATCH v9 03/22] dt-bindings: mediatek,
 dp_phy: Add Display Port PHY binding
Date: Wed, 30 Mar 2022 13:12:17 +0800
Message-ID: <20220330051217.19789-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220327223927.20848-4-granquet@baylibre.com>
References: <20220327223927.20848-4-granquet@baylibre.com>
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
Cc: linux-fbdev@vger.kernel.org, devicetree@vger.kernel.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org, deller@gmx.de,
 kishon@ti.com, chunkuang.hu@kernel.org, jitao.shi@mediatek.com,
 chunfeng.yun@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 tzimmermann@suse.de, linux-kernel@vger.kernel.org, vkoul@kernel.org,
 krzk+dt@kernel.org, markyacoub@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>This phy controller is embedded in the Display Port Controller on mt8195 SoCs.
>
>Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>---
> .../bindings/phy/mediatek,dp-phy.yaml         | 43 +++++++++++++++++++
> 1 file changed, 43 insertions(+)
> create mode 100644 Documentation/devicetree/bindings/phy/mediatek,dp-phy.yaml
>
>diff --git a/Documentation/devicetree/bindings/phy/mediatek,dp-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,dp-phy.yaml
>new file mode 100644
>index 000000000000..1f5ffca4e140
>--- /dev/null
>+++ b/Documentation/devicetree/bindings/phy/mediatek,dp-phy.yaml
>@@ -0,0 +1,43 @@
>+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>+# Copyright (c) 2022 MediaTek
>+%YAML 1.2
>+---
>+$id: http://devicetree.org/schemas/phy/mediatek,dp-phy.yaml#
>+$schema: http://devicetree.org/meta-schemas/core.yaml#
>+
>+title: MediaTek Display Port PHY
>+
>+maintainers:
>+  - CK Hu <ck.hu@mediatek.com>
>+  - Jitao shi <jitao.shi@mediatek.com>
>+
>+description: |
>+  Device tree bindings for the Mediatek (embedded) Display Port PHY

s/Mediatek/MediaTek/

>+  present on some Mediatek SoCs.

s/Mediatek/MediaTek/

>+
>+properties:
>+  compatible:
>+    enum:
>+      - mediatek,mt8195-dp-phy
>+
>+  mediatek,dp-syscon:
>+    $ref: /schemas/types.yaml#/definitions/phandle
>+    description: Phandle to the Display Port node.
>+
>+  "#phy-cells":
>+    const: 0
>+
>+required:
>+  - compatible
>+  - mediatek,dp-syscon
>+  - "#phy-cells"
>+
>+additionalProperties: false
>+
>+examples:
>+  - |
>+    dp_phy: dp-phy {
>+      compatible = "mediatek,mt8195-dp-phy";
>+      mediatek,dp-syscon = <&dp_tx>;
>+      #phy-cells = <0>;
>+    };
>-- 
>2.34.1
>
>
