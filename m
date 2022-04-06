Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B0F4F52D2
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 05:30:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FC4210EF20;
	Wed,  6 Apr 2022 03:30:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2EBC10EF1C
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 03:30:38 +0000 (UTC)
X-UUID: 25e9510fe02c448d83413e50cd2d102d-20220406
X-UUID: 25e9510fe02c448d83413e50cd2d102d-20220406
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1309546133; Wed, 06 Apr 2022 11:30:34 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 6 Apr 2022 11:30:33 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 6 Apr 2022 11:30:33 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 6 Apr 2022 11:30:33 +0800
Message-ID: <27c2a754d4a3706aadf3dd0b64c607cf69a72bbf.camel@mediatek.com>
Subject: Re: [PATCH v10 3/4] dt-bindings: display: mediatek: add MT8186 SoC
 binding
From: CK Hu <ck.hu@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
 <matthias.bgg@gmail.com>, <robh+dt@kernel.org>
Date: Wed, 6 Apr 2022 11:30:33 +0800
In-Reply-To: <20220406030009.2357-4-rex-bc.chen@mediatek.com>
References: <20220406030009.2357-1-rex-bc.chen@mediatek.com>
 <20220406030009.2357-4-rex-bc.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski@canonical.com,
 airlied@linux.ie, jassisinghbrar@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, fparent@baylibre.com,
 linux-mediatek@lists.infradead.org, yongqiang.niu@mediatek.com,
 hsinyi@chromium.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Rex:

On Wed, 2022-04-06 at 11:00 +0800, Rex-BC Chen wrote:
> Add MT8186 SoC binding to AAL, CCORR, COLOR, DITHER, GAMMA, MUTEX,
> OVL, POSTMASK and RDMA.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,aal.yaml    | 4
> ++++
>  .../devicetree/bindings/display/mediatek/mediatek,ccorr.yaml  | 4
> ++++
>  .../devicetree/bindings/display/mediatek/mediatek,color.yaml  | 1 +
>  .../devicetree/bindings/display/mediatek/mediatek,dither.yaml | 1 +
>  .../devicetree/bindings/display/mediatek/mediatek,gamma.yaml  | 1 +
>  .../devicetree/bindings/display/mediatek/mediatek,mutex.yaml  | 1 +
>  .../devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml | 4
> ++++
>  .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml    | 4
> ++++
>  .../bindings/display/mediatek/mediatek,postmask.yaml          | 4
> ++++
>  .../devicetree/bindings/display/mediatek/mediatek,rdma.yaml   | 1 +
>  10 files changed, 25 insertions(+)
> 
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam
> l
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam
> l
> index cdb6d0819cca..cb4a2f39ff88 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam
> l
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam
> l
> @@ -30,6 +30,10 @@ properties:
>                - mediatek,mt8192-disp-aal
>                - mediatek,mt8195-disp-aal
>            - const: mediatek,mt8173-disp-aal
> +      - items:
> +          - enum:
> +              - mediatek,mt8186-disp-aal
> +          - const: mediatek,mt8183-disp-aal
>  
>    reg:
>      maxItems: 1
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y
> aml
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y
> aml
> index 7766c806c102..63fb02014a56 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y
> aml
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y
> aml
> @@ -29,6 +29,10 @@ properties:
>            - enum:
>                - mediatek,mt8195-disp-ccorr
>            - const: mediatek,mt8192-disp-ccorr
> +      - items:
> +          - enum:
> +              - mediatek,mt8186-disp-ccorr
> +          - const: mediatek,mt8183-disp-ccorr
>  
>    reg:
>      maxItems: 1
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y
> aml
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y
> aml
> index 0c9095b0411e..d2f89ee7996f 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y
> aml
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y
> aml
> @@ -36,6 +36,7 @@ properties:
>        - items:
>            - enum:
>                - mediatek,mt8183-disp-color
> +              - mediatek,mt8186-disp-color
>                - mediatek,mt8192-disp-color
>                - mediatek,mt8195-disp-color
>            - const: mediatek,mt8173-disp-color
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.
> yaml
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.
> yaml
> index 8180ed0a89ff..8ad8187c02d1 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.
> yaml
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.
> yaml
> @@ -26,6 +26,7 @@ properties:
>            - const: mediatek,mt8183-disp-dither
>        - items:
>            - enum:
> +              - mediatek,mt8186-disp-dither
>                - mediatek,mt8192-disp-dither
>                - mediatek,mt8195-disp-dither
>            - const: mediatek,mt8183-disp-dither
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.y
> aml
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.y
> aml
> index 5f1825b4512b..a89ea0ea7542 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.y
> aml
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.y
> aml
> @@ -27,6 +27,7 @@ properties:
>            - const: mediatek,mt8183-disp-gamma
>        - items:
>            - enum:
> +              - mediatek,mt8186-disp-gamma
>                - mediatek,mt8192-disp-gamma
>                - mediatek,mt8195-disp-gamma
>            - const: mediatek,mt8183-disp-gamma
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.y
> aml
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.y
> aml
> index b470fbb1b40a..3fdad71210b4 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.y
> aml
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.y
> aml
> @@ -29,6 +29,7 @@ properties:
>        - mediatek,mt8167-disp-mutex
>        - mediatek,mt8173-disp-mutex
>        - mediatek,mt8183-disp-mutex
> +      - mediatek,mt8186-disp-mutex
>        - mediatek,mt8192-disp-mutex
>        - mediatek,mt8195-disp-mutex
>  
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-
> 2l.yaml
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-
> 2l.yaml
> index da999ba53b7c..4e94f4e947ad 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-
> 2l.yaml
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-
> 2l.yaml
> @@ -25,6 +25,10 @@ properties:
>            - const: mediatek,mt8183-disp-ovl-2l
>        - items:
>            - const: mediatek,mt8192-disp-ovl-2l
> +      - items:
> +          - enum:
> +              - mediatek,mt8186-disp-ovl-2l
> +          - const: mediatek,mt8192-disp-ovl-2l
>  
>    reg:
>      maxItems: 1
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam
> l
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam
> l
> index 51f8235f1b1b..a2a27d0ca038 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam
> l
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam
> l
> @@ -38,6 +38,10 @@ properties:
>            - enum:
>                - mediatek,mt8195-disp-ovl
>            - const: mediatek,mt8183-disp-ovl
> +      - items:
> +          - enum:
> +              - mediatek,mt8186-disp-ovl
> +          - const: mediatek,mt8192-disp-ovl
>  
>    reg:
>      maxItems: 1
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmas
> k.yaml
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmas
> k.yaml
> index 2d769422e29f..654080bfbdfb 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmas
> k.yaml
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmas
> k.yaml
> @@ -23,6 +23,10 @@ properties:
>      oneOf:
>        - items:
>            - const: mediatek,mt8192-disp-postmask
> +      - items:
> +          - enum:
> +              - mediatek,mt8186-disp-postmask
> +          - const: mediatek,mt8192-disp-postmask
>  
>    reg:
>      maxItems: 1
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.ya
> ml
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.ya
> ml
> index 9a6756f185ee..0882ae86e6c4 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.ya
> ml
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.ya
> ml
> @@ -38,6 +38,7 @@ properties:
>            - const: mediatek,mt2701-disp-rdma
>        - items:
>            - enum:
> +              - mediatek,mt8186-disp-rdma
>                - mediatek,mt8192-disp-rdma
>            - const: mediatek,mt8183-disp-rdma
>  

