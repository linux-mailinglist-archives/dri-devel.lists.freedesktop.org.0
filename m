Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F7254F08D
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 07:31:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B8DA11AC7F;
	Fri, 17 Jun 2022 05:31:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92B0811AC7F
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 05:31:34 +0000 (UTC)
X-UUID: 12b9b43634ac4a0ba8d185940e3d6f56-20220617
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6, REQID:c897e1e3-87b2-43f7-aef2-c22b961aae1b, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:b14ad71, CLOUDID:1ed397f6-e099-41ba-a32c-13b8bfe63214,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:nil,BEC:nil,COL:0
X-UUID: 12b9b43634ac4a0ba8d185940e3d6f56-20220617
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1417122557; Fri, 17 Jun 2022 13:31:30 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 17 Jun 2022 13:31:29 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Fri, 17 Jun 2022 13:31:29 +0800
Message-ID: <1c53c2c73875cf565b819f67267d0e725d49f3c2.camel@mediatek.com>
Subject: Re: [PATCH 1/7] dt-bindings: display: mediatek: dpi: add
 power-domains property
From: CK Hu <ck.hu@mediatek.com>
To: Fabien Parent <fparent@baylibre.com>, <matthias.bgg@gmail.com>,
 <jitao.shi@mediatek.com>, <krzysztof.kozlowski+dt@linaro.org>,
 <robh+dt@kernel.org>
Date: Fri, 17 Jun 2022 13:31:29 +0800
In-Reply-To: <20220530201436.902505-1-fparent@baylibre.com>
References: <20220530201436.902505-1-fparent@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: chunkuang.hu@kernel.org, devicetree@vger.kernel.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Fabien:

On Mon, 2022-05-30 at 22:14 +0200, Fabien Parent wrote:
> DPI is part of the display / multimedia block in MediaTek SoCs, and
> always have a power-domain (at least in the upstream device-trees).
> Add the power-domains property to the binding documentation.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml  | 6
> ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam
> l
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam
> l
> index 77ee1b923991..caf4c88708f4 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam
> l
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam
> l
> @@ -57,6 +57,9 @@ properties:
>        Output port node. This port should be connected to the input
> port of an
>        attached HDMI or LVDS encoder chip.
>  
> +  power-domains:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
> @@ -64,6 +67,7 @@ required:
>    - clocks
>    - clock-names
>    - port
> +  - power-domains
>  
>  additionalProperties: false
>  
> @@ -71,11 +75,13 @@ examples:
>    - |
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>      #include <dt-bindings/clock/mt8173-clk.h>
> +    #include <dt-bindings/power/mt8183-power.h>

Why do you include mt8183 power header file for mt8173 dpi node?

Regards,
CK

>  
>      dpi0: dpi@1401d000 {
>          compatible = "mediatek,mt8173-dpi";
>          reg = <0x1401d000 0x1000>;
>          interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>;
> +        power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
>          clocks = <&mmsys CLK_MM_DPI_PIXEL>,
>               <&mmsys CLK_MM_DPI_ENGINE>,
>               <&apmixedsys CLK_APMIXED_TVDPLL>;

