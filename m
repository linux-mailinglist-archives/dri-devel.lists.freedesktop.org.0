Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D3D4EB9E5
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 07:12:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EBD310F3B7;
	Wed, 30 Mar 2022 05:12:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E64710F3B6
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 05:12:12 +0000 (UTC)
X-UUID: 7195f69139614ad9b38bddfa96b19033-20220330
X-UUID: 7195f69139614ad9b38bddfa96b19033-20220330
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <miles.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1647154087; Wed, 30 Mar 2022 13:11:40 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 30 Mar 2022 13:11:39 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 30 Mar 2022 13:11:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 30 Mar 2022 13:11:38 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <granquet@baylibre.com>
Subject: Re: [PATCH v9 01/22] dt-bindings: mediatek,
 dpi: Add DP_INTF compatible
Date: Wed, 30 Mar 2022 13:11:38 +0800
Message-ID: <20220330051138.19264-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220327223927.20848-2-granquet@baylibre.com>
References: <20220327223927.20848-2-granquet@baylibre.com>
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
 msp@baylibre.com, chunfeng.yun@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 tzimmermann@suse.de, linux-kernel@vger.kernel.org, vkoul@kernel.org,
 krzk+dt@kernel.org, markyacoub@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Guillaume,

>DP_INTF is similar to DPI but does not have the exact same feature set
>or register layouts.
>
>DP_INTF is the sink of the display pipeline that is connected to the
>DisplayPort controller and encoder unit. It takes the same clocks as
>DPI.
>
>Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
>Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>Reviewed-by: Rob Herring <robh@kernel.org>
>---
> .../bindings/display/mediatek/mediatek,dpi.yaml       | 11 ++++++-----
> 1 file changed, 6 insertions(+), 5 deletions(-)
>
>diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
>index dd2896a40ff0..2dba80ad3b18 100644
>--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
>+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
>@@ -4,16 +4,16 @@
> $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
> $schema: http://devicetree.org/meta-schemas/core.yaml#
> 
>-title: mediatek DPI Controller Device Tree Bindings
>+title: mediatek DPI/DP_INTF Controller
         ^^^^^^^^
Would you mind changing this 'mediatek' to 'MediaTek'?

> 
> maintainers:
>   - CK Hu <ck.hu@mediatek.com>
>   - Jitao shi <jitao.shi@mediatek.com>
> 
> description: |
>-  The Mediatek DPI function block is a sink of the display subsystem and
>

s/Mediatek/MediaTek/

Could you replace all 'Mediatek' with 'MediaTek' of this series, please?
We have set up a chcker inside our organization to capture this case,
hopefully we will see less 'Mediatek' in the future.

>-  provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422 pixel data on a parallel
>-  output bus.
>+  The Mediatek DPI and DP_INTF function blocks are a sink of the display

s/Mediatek/MediaTek/

thanks,
Miles

>+  subsystem and provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422 pixel data on a
>+  parallel output bus.
> 
> properties:
>   compatible:
>@@ -23,6 +23,7 @@ properties:
>       - mediatek,mt8173-dpi
>       - mediatek,mt8183-dpi
>       - mediatek,mt8192-dpi
>+      - mediatek,mt8195-dpintf
> 
>   reg:
>     maxItems: 1
>@@ -54,7 +55,7 @@ properties:
>     $ref: /schemas/graph.yaml#/properties/port
>     description:
>       Output port node. This port should be connected to the input port of an
>-      attached HDMI or LVDS encoder chip.
>+      attached HDMI, LVDS or DisplayPort encoder chip.
> 
> required:
>   - compatible
>-- 
>2.34.1
>
>
