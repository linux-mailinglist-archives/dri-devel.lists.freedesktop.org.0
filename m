Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1417E4D7F84
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 11:11:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55A1810E023;
	Mon, 14 Mar 2022 10:11:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7122C10E278
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 10:11:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 7CCF81F43E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647252661;
 bh=b2w70NbmjVX5A7b/dWmSdkbaIqzRrzDeMWiKzYH18pE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nSYYYNY793I6FVmjCqjLw89BMr6FRsg3G/t3DWOrScfJmsIF2PiByplHgsQzstJ4y
 Mfv3KEbu0tKUmk+LXtSHyMTCwsWz91eh6cd1vxhkii5kwCVyx90HKlTgmu5lVohPlB
 Gn3nz8H/VpDkp0snXlgTv94g3g2rg2iharRtZ0y1Fm2eVYTH3K9hQMeBRFQTkigneu
 gC7aYR4rJSs4kg3gsyazJOpQYoIy4lP4CtGPYdWhBOnz+IEfrwJIqdrc8i5PEkhkIf
 0yAh1KOWOM76xyr5c8Ol9D2F6xWTNKc6Je0H4V7Qb7RP+bh/Ls87isTYO2ZQRbIM8/
 cNSaZowAq+yGg==
Message-ID: <4a05db05-47c6-d035-06b7-b1bd65727601@collabora.com>
Date: Mon, 14 Mar 2022 11:10:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH V7 2/5] dt-bindings: display: mediatek: revise enum to
 const
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 matthias.bgg@gmail.com, robh+dt@kernel.org
References: <20220314090033.25773-1-rex-bc.chen@mediatek.com>
 <20220314090033.25773-3-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220314090033.25773-3-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, jassisinghbrar@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 yongqiang.niu@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 fparent@baylibre.com, linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 14/03/22 10:00, Rex-BC Chen ha scritto:
> There won't be more than 1 fallback for these bindings, so we modify
> them to use const instead of enum.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   .../devicetree/bindings/display/mediatek/mediatek,aal.yaml  | 3 +--
>   .../bindings/display/mediatek/mediatek,ccorr.yaml           | 3 +--
>   .../bindings/display/mediatek/mediatek,color.yaml           | 6 ++----
>   .../bindings/display/mediatek/mediatek,dither.yaml          | 3 +--
>   .../bindings/display/mediatek/mediatek,gamma.yaml           | 3 +--
>   .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml  | 6 ++----
>   .../devicetree/bindings/display/mediatek/mediatek,rdma.yaml | 6 ++----
>   7 files changed, 10 insertions(+), 20 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> index 6c8c83988a24..eaf23428b30d 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> @@ -31,8 +31,7 @@ properties:
>                 - mediatek,mt8183-disp-aal
>                 - mediatek,mt8192-disp-aal
>                 - mediatek,mt8195-disp-aal
> -          - enum:
> -              - mediatek,mt8173-disp-aal
> +          - const: mediatek,mt8173-disp-aal
>   
>     reg:
>       maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> index 0ed53b6238f0..7766c806c102 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> @@ -28,8 +28,7 @@ properties:
>         - items:
>             - enum:
>                 - mediatek,mt8195-disp-ccorr
> -          - enum:
> -              - mediatek,mt8192-disp-ccorr
> +          - const: mediatek,mt8192-disp-ccorr
>   
>     reg:
>       maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
> index 3ad842eb5668..0c9095b0411e 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
> @@ -32,15 +32,13 @@ properties:
>             - enum:
>                 - mediatek,mt7623-disp-color
>                 - mediatek,mt2712-disp-color
> -          - enum:
> -              - mediatek,mt2701-disp-color
> +          - const: mediatek,mt2701-disp-color
>         - items:
>             - enum:
>                 - mediatek,mt8183-disp-color
>                 - mediatek,mt8192-disp-color
>                 - mediatek,mt8195-disp-color
> -          - enum:
> -              - mediatek,mt8173-disp-color
> +          - const: mediatek,mt8173-disp-color
>     reg:
>       maxItems: 1
>   
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
> index 6657549af165..8180ed0a89ff 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
> @@ -28,8 +28,7 @@ properties:
>             - enum:
>                 - mediatek,mt8192-disp-dither
>                 - mediatek,mt8195-disp-dither
> -          - enum:
> -              - mediatek,mt8183-disp-dither
> +          - const: mediatek,mt8183-disp-dither
>   
>     reg:
>       maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
> index 78442339314f..5f1825b4512b 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
> @@ -29,8 +29,7 @@ properties:
>             - enum:
>                 - mediatek,mt8192-disp-gamma
>                 - mediatek,mt8195-disp-gamma
> -          - enum:
> -              - mediatek,mt8183-disp-gamma
> +          - const: mediatek,mt8183-disp-gamma
>   
>     reg:
>       maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
> index f77094e61443..51f8235f1b1b 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
> @@ -33,13 +33,11 @@ properties:
>             - enum:
>                 - mediatek,mt7623-disp-ovl
>                 - mediatek,mt2712-disp-ovl
> -          - enum:
> -              - mediatek,mt2701-disp-ovl
> +          - const: mediatek,mt2701-disp-ovl
>         - items:
>             - enum:
>                 - mediatek,mt8195-disp-ovl
> -          - enum:
> -              - mediatek,mt8183-disp-ovl
> +          - const: mediatek,mt8183-disp-ovl
>   
>     reg:
>       maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
> index e8c72afa0630..9a6756f185ee 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
> @@ -35,13 +35,11 @@ properties:
>             - enum:
>                 - mediatek,mt7623-disp-rdma
>                 - mediatek,mt2712-disp-rdma
> -          - enum:
> -              - mediatek,mt2701-disp-rdma
> +          - const: mediatek,mt2701-disp-rdma
>         - items:
>             - enum:
>                 - mediatek,mt8192-disp-rdma
> -          - enum:
> -              - mediatek,mt8183-disp-rdma
> +          - const: mediatek,mt8183-disp-rdma
>   
>     reg:
>       maxItems: 1


