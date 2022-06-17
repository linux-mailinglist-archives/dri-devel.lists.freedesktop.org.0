Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A53254F0B2
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 07:44:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33F3711A63B;
	Fri, 17 Jun 2022 05:44:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2D7211A63B
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 05:44:42 +0000 (UTC)
X-UUID: 00b27e5b925e4066b4c04cdcbd4fcf9a-20220617
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6, REQID:203689c6-47fb-4887-8da9-daca6b6e5d4b, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:45
X-CID-INFO: VERSION:1.1.6, REQID:203689c6-47fb-4887-8da9-daca6b6e5d4b, OB:0,
 LOB:
 0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:45
X-CID-META: VersionHash:b14ad71, CLOUDID:2b4198f6-e099-41ba-a32c-13b8bfe63214,
 C
 OID:8561c84f02bb,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: 00b27e5b925e4066b4c04cdcbd4fcf9a-20220617
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1576596920; Fri, 17 Jun 2022 13:44:37 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 17 Jun 2022 13:44:36 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Fri, 17 Jun 2022 13:44:36 +0800
Message-ID: <cfd1b024a388cc2506a8f836795b50c75844c9d2.camel@mediatek.com>
Subject: Re: [PATCH 3/7] dt-bindings: display: mediatek: add bindings for
 MT8365 SoC
From: CK Hu <ck.hu@mediatek.com>
To: Fabien Parent <fparent@baylibre.com>, <matthias.bgg@gmail.com>,
 <jitao.shi@mediatek.com>, <krzysztof.kozlowski+dt@linaro.org>,
 <robh+dt@kernel.org>
Date: Fri, 17 Jun 2022 13:44:35 +0800
In-Reply-To: <20220530201436.902505-3-fparent@baylibre.com>
References: <20220530201436.902505-1-fparent@baylibre.com>
 <20220530201436.902505-3-fparent@baylibre.com>
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
> Add MT8365 binding documentation for all the display components that
> are
> compatible with the compatible string from other SoCs.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  .../bindings/display/mediatek/mediatek,aal.yaml |  1 +
>  .../display/mediatek/mediatek,ccorr.yaml        |  1 +
>  .../display/mediatek/mediatek,color.yaml        |  1 +
>  .../display/mediatek/mediatek,dither.yaml       |  1 +
>  .../bindings/display/mediatek/mediatek,dsi.yaml | 17 +++++++++++--
> ----
>  .../display/mediatek/mediatek,gamma.yaml        |  1 +
>  .../display/mediatek/mediatek,mutex.yaml        |  1 +
>  .../bindings/display/mediatek/mediatek,ovl.yaml |  1 +
>  .../display/mediatek/mediatek,rdma.yaml         |  1 +
>  9 files changed, 19 insertions(+), 6 deletions(-)
> 
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam
> l
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam
> l
> index d4d585485e7b..d47bc72f09c0 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam
> l
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam
> l
> @@ -33,6 +33,7 @@ properties:
>                - mediatek,mt8186-disp-aal
>                - mediatek,mt8192-disp-aal
>                - mediatek,mt8195-disp-aal
> +              - mediatek,mt8365-disp-aal
>            - const: mediatek,mt8183-disp-aal
>  
>    reg:
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y
> aml
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y
> aml
> index 63fb02014a56..fc999e614718 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y
> aml
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y
> aml
> @@ -32,6 +32,7 @@ properties:
>        - items:
>            - enum:
>                - mediatek,mt8186-disp-ccorr
> +              - mediatek,mt8365-disp-ccorr
>            - const: mediatek,mt8183-disp-ccorr
>  
>    reg:
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y
> aml
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y
> aml
> index d2f89ee7996f..9d081da433e8 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y
> aml
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y
> aml
> @@ -39,6 +39,7 @@ properties:
>                - mediatek,mt8186-disp-color
>                - mediatek,mt8192-disp-color
>                - mediatek,mt8195-disp-color
> +              - mediatek,mt8365-disp-color
>            - const: mediatek,mt8173-disp-color
>    reg:
>      maxItems: 1
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.
> yaml
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.
> yaml
> index 8ad8187c02d1..a7706cd65675 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.
> yaml
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.
> yaml
> @@ -29,6 +29,7 @@ properties:
>                - mediatek,mt8186-disp-dither
>                - mediatek,mt8192-disp-dither
>                - mediatek,mt8195-disp-dither
> +              - mediatek,mt8365-disp-dither
>            - const: mediatek,mt8183-disp-dither
>  
>    reg:
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yam
> l
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yam
> l
> index fa5bdf28668a..d17ea215960c 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yam
> l
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yam
> l
> @@ -22,12 +22,17 @@ allOf:
>  
>  properties:
>    compatible:
> -    enum:
> -      - mediatek,mt2701-dsi
> -      - mediatek,mt7623-dsi
> -      - mediatek,mt8167-dsi
> -      - mediatek,mt8173-dsi
> -      - mediatek,mt8183-dsi
> +    oneOf:
> +      - enum:
> +          - mediatek,mt2701-dsi
> +          - mediatek,mt7623-dsi
> +          - mediatek,mt8167-dsi
> +          - mediatek,mt8173-dsi
> +          - mediatek,mt8183-dsi
> +      - items:
> +          - enum:
> +              - mediatek,mt8365-dsi
> +          - const: mediatek,mt8183-dsi
>  
>    reg:
>      maxItems: 1
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.y
> aml
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.y
> aml
> index a89ea0ea7542..f54859cfc97b 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.y
> aml
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.y
> aml
> @@ -30,6 +30,7 @@ properties:
>                - mediatek,mt8186-disp-gamma
>                - mediatek,mt8192-disp-gamma
>                - mediatek,mt8195-disp-gamma
> +              - mediatek,mt8365-disp-gamma
>            - const: mediatek,mt8183-disp-gamma
>  
>    reg:
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.y
> aml
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.y
> aml
> index 3fdad71210b4..f4a12dfae77b 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.y
> aml
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.y
> aml
> @@ -32,6 +32,7 @@ properties:
>        - mediatek,mt8186-disp-mutex
>        - mediatek,mt8192-disp-mutex
>        - mediatek,mt8195-disp-mutex
> +      - mediatek,mt8365-disp-mutex
>  
>    reg:
>      maxItems: 1
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam
> l
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam
> l
> index a2a27d0ca038..20e4ca4fc915 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam
> l
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam
> l
> @@ -41,6 +41,7 @@ properties:
>        - items:
>            - enum:
>                - mediatek,mt8186-disp-ovl
> +              - mediatek,mt8365-disp-ovl
>            - const: mediatek,mt8192-disp-ovl
>  
>    reg:
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.ya
> ml
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.ya
> ml
> index 0882ae86e6c4..3bc914785976 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.ya
> ml
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.ya
> ml
> @@ -40,6 +40,7 @@ properties:
>            - enum:
>                - mediatek,mt8186-disp-rdma
>                - mediatek,mt8192-disp-rdma
> +              - mediatek,mt8365-disp-rdma
>            - const: mediatek,mt8183-disp-rdma
>  
>    reg:

