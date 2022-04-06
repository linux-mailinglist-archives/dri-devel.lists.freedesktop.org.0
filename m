Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 565254F52C9
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 05:26:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFAE110EED9;
	Wed,  6 Apr 2022 03:26:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A368810EEBF
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 03:26:24 +0000 (UTC)
X-UUID: fa20a524bf4842848135357a270be9bf-20220406
X-UUID: fa20a524bf4842848135357a270be9bf-20220406
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1929525275; Wed, 06 Apr 2022 11:26:17 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 6 Apr 2022 11:26:16 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 6 Apr 2022 11:26:16 +0800
Message-ID: <0656f45f2933518708b82195bd9c49351e394c16.camel@mediatek.com>
Subject: Re: [PATCH v10 1/4] dt-bindings: display: mediatek: revise enum to
 const
From: CK Hu <ck.hu@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
 <matthias.bgg@gmail.com>, <robh+dt@kernel.org>
Date: Wed, 6 Apr 2022 11:26:16 +0800
In-Reply-To: <20220406030009.2357-2-rex-bc.chen@mediatek.com>
References: <20220406030009.2357-1-rex-bc.chen@mediatek.com>
 <20220406030009.2357-2-rex-bc.chen@mediatek.com>
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
 dri-devel@lists.freedesktop.org, yongqiang.niu@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, fparent@baylibre.com,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Rex:

On Wed, 2022-04-06 at 11:00 +0800, Rex-BC Chen wrote:
> There won't be more than 1 fallback for these bindings, so we modify
> them to use const instead of enum.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,aal.yaml  | 3 +--
>  .../bindings/display/mediatek/mediatek,ccorr.yaml           | 3 +--
>  .../bindings/display/mediatek/mediatek,color.yaml           | 6 ++
> ----
>  .../bindings/display/mediatek/mediatek,dither.yaml          | 3 +--
>  .../bindings/display/mediatek/mediatek,gamma.yaml           | 3 +--
>  .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml  | 6 ++
> ----
>  .../devicetree/bindings/display/mediatek/mediatek,rdma.yaml | 6 ++
> ----
>  7 files changed, 10 insertions(+), 20 deletions(-)
> 
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam
> l
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam
> l
> index 61f0ed1e388f..cdb6d0819cca 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam
> l
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam
> l
> @@ -29,8 +29,7 @@ properties:
>                - mediatek,mt8183-disp-aal
>                - mediatek,mt8192-disp-aal
>                - mediatek,mt8195-disp-aal
> -          - enum:
> -              - mediatek,mt8173-disp-aal
> +          - const: mediatek,mt8173-disp-aal
>  
>    reg:
>      maxItems: 1
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y
> aml
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y
> aml
> index 0ed53b6238f0..7766c806c102 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y
> aml
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y
> aml
> @@ -28,8 +28,7 @@ properties:
>        - items:
>            - enum:
>                - mediatek,mt8195-disp-ccorr
> -          - enum:
> -              - mediatek,mt8192-disp-ccorr
> +          - const: mediatek,mt8192-disp-ccorr
>  
>    reg:
>      maxItems: 1
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y
> aml
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y
> aml
> index 3ad842eb5668..0c9095b0411e 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y
> aml
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y
> aml
> @@ -32,15 +32,13 @@ properties:
>            - enum:
>                - mediatek,mt7623-disp-color
>                - mediatek,mt2712-disp-color
> -          - enum:
> -              - mediatek,mt2701-disp-color
> +          - const: mediatek,mt2701-disp-color
>        - items:
>            - enum:
>                - mediatek,mt8183-disp-color
>                - mediatek,mt8192-disp-color
>                - mediatek,mt8195-disp-color
> -          - enum:
> -              - mediatek,mt8173-disp-color
> +          - const: mediatek,mt8173-disp-color
>    reg:
>      maxItems: 1
>  
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.
> yaml
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.
> yaml
> index 6657549af165..8180ed0a89ff 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.
> yaml
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.
> yaml
> @@ -28,8 +28,7 @@ properties:
>            - enum:
>                - mediatek,mt8192-disp-dither
>                - mediatek,mt8195-disp-dither
> -          - enum:
> -              - mediatek,mt8183-disp-dither
> +          - const: mediatek,mt8183-disp-dither
>  
>    reg:
>      maxItems: 1
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.y
> aml
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.y
> aml
> index 78442339314f..5f1825b4512b 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.y
> aml
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.y
> aml
> @@ -29,8 +29,7 @@ properties:
>            - enum:
>                - mediatek,mt8192-disp-gamma
>                - mediatek,mt8195-disp-gamma
> -          - enum:
> -              - mediatek,mt8183-disp-gamma
> +          - const: mediatek,mt8183-disp-gamma
>  
>    reg:
>      maxItems: 1
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam
> l
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam
> l
> index f77094e61443..51f8235f1b1b 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam
> l
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam
> l
> @@ -33,13 +33,11 @@ properties:
>            - enum:
>                - mediatek,mt7623-disp-ovl
>                - mediatek,mt2712-disp-ovl
> -          - enum:
> -              - mediatek,mt2701-disp-ovl
> +          - const: mediatek,mt2701-disp-ovl
>        - items:
>            - enum:
>                - mediatek,mt8195-disp-ovl
> -          - enum:
> -              - mediatek,mt8183-disp-ovl
> +          - const: mediatek,mt8183-disp-ovl
>  
>    reg:
>      maxItems: 1
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.ya
> ml
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.ya
> ml
> index e8c72afa0630..9a6756f185ee 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.ya
> ml
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.ya
> ml
> @@ -35,13 +35,11 @@ properties:
>            - enum:
>                - mediatek,mt7623-disp-rdma
>                - mediatek,mt2712-disp-rdma
> -          - enum:
> -              - mediatek,mt2701-disp-rdma
> +          - const: mediatek,mt2701-disp-rdma
>        - items:
>            - enum:
>                - mediatek,mt8192-disp-rdma
> -          - enum:
> -              - mediatek,mt8183-disp-rdma
> +          - const: mediatek,mt8183-disp-rdma
>  
>    reg:
>      maxItems: 1

