Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 862356A85DC
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 17:08:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2169C10E0F7;
	Thu,  2 Mar 2023 16:08:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C150410E0F7
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Mar 2023 16:08:35 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 444E46602F90;
 Thu,  2 Mar 2023 16:08:33 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1677773314;
 bh=kgwjSgi/JVL2L++uXQGRBSugLMzM6h5L2zTND4BSxeo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VWuTbRnTeevAyLNPC5rPeDrUPkxODD3nuGIzCey2puQPaj/m1PtEBgFso0wTRxLXx
 YKZ5u7GwqN5G8qAuBW04su4Fw5hOuTj6e7zmMw8jU2UudRyxRrD5TsIx6Hl0z4qJsh
 uE+dyEkFXm7yl969svg0AcV7IUDsOA64hTgvdMdKkIhzEbTTzC35WxVc70h2TjwWUi
 nyu1kZREC9sVc2uQWXJv92+X5pNF69sTQq3zdbYa/8fQby/kzToZ9UBsrEZUYW2j7f
 G2hG81nk6zJceZ5J3GjGAkXpv8m9VBZqoWIkM+V/yrTCRDAe+5lWpbi7qrP1JfMSlR
 oQ8vD7bYJgsnQ==
Message-ID: <0969ff46-3fba-f679-7943-52da7528185a@collabora.com>
Date: Thu, 2 Mar 2023 17:08:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] dt-bindings: display: mediatek: Compatible list cleanup
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20230302141234.169985-1-y.oudjana@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230302141234.169985-1-y.oudjana@protonmail.com>
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
Cc: devicetree@vger.kernel.org, Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 02/03/23 15:12, Yassine Oudjana ha scritto:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Several DT bindings of MediaTek display blocks make unnecessary use of
> "oneOf" and "items". Remove them and replace them with enums where
> necessary.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
> Changes since v1:
> - Leave enums with 1 element as they are.
> 
>   .../bindings/display/mediatek/mediatek,ccorr.yaml   |  7 +++----
>   .../bindings/display/mediatek/mediatek,color.yaml   | 10 ++++------
>   .../bindings/display/mediatek/mediatek,dither.yaml  |  3 +--
>   .../bindings/display/mediatek/mediatek,dsc.yaml     |  4 +---
>   .../bindings/display/mediatek/mediatek,gamma.yaml   |  7 +++----
>   .../bindings/display/mediatek/mediatek,merge.yaml   |  8 +++-----
>   .../bindings/display/mediatek/mediatek,od.yaml      |  8 +++-----
>   .../bindings/display/mediatek/mediatek,ovl-2l.yaml  |  7 +++----
>   .../bindings/display/mediatek/mediatek,ovl.yaml     | 13 +++++--------
>   .../display/mediatek/mediatek,postmask.yaml         |  3 +--
>   .../bindings/display/mediatek/mediatek,rdma.yaml    | 13 +++++--------
>   .../bindings/display/mediatek/mediatek,split.yaml   |  4 +---
>   .../bindings/display/mediatek/mediatek,ufoe.yaml    |  4 +---
>   .../bindings/display/mediatek/mediatek,wdma.yaml    |  4 +---
>   14 files changed, 35 insertions(+), 60 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> index b04820c95b22..dc22bd522523 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> @@ -21,10 +21,9 @@ description: |
>   properties:
>     compatible:
>       oneOf:
> -      - items:
> -          - const: mediatek,mt8183-disp-ccorr
> -      - items:
> -          - const: mediatek,mt8192-disp-ccorr
> +      - enum:
> +          - mediatek,mt8183-disp-ccorr
> +          - mediatek,mt8192-disp-ccorr

This change is ok.

>         - items:
>             - enum:
>                 - mediatek,mt8188-disp-ccorr
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
> index 62306c88f485..d0ea77fc4b06 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
> @@ -22,12 +22,10 @@ description: |
>   properties:
>     compatible:
>       oneOf:
> -      - items:
> -          - const: mediatek,mt2701-disp-color
> -      - items:
> -          - const: mediatek,mt8167-disp-color
> -      - items:
> -          - const: mediatek,mt8173-disp-color
> +      - enum:
> +          - mediatek,mt2701-disp-color
> +          - mediatek,mt8167-disp-color
> +          - mediatek,mt8173-disp-color

OK.

>         - items:
>             - enum:
>                 - mediatek,mt7623-disp-color
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
> index 5c7445c174e5..9d74de63fe63 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
> @@ -22,8 +22,7 @@ description: |
>   properties:
>     compatible:
>       oneOf:
> -      - items:
> -          - const: mediatek,mt8183-disp-dither
> +      - const: mediatek,mt8183-disp-dither

OK.

>         - items:
>             - enum:
>                 - mediatek,mt8186-disp-dither
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
> index 49248864514b..37bf6bf4a1ab 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
> @@ -19,9 +19,7 @@ description: |
>   
>   properties:
>     compatible:
> -    oneOf:
> -      - items:
> -          - const: mediatek,mt8195-disp-dsc
> +    const: mediatek,mt8195-disp-dsc

This will grow, and you'll get devicetree declaring something like:

compatible = "mediatek,(different-new-chip)-disp-dsc";

and

compatible = "mediatek,(current-chip)-disp-dsc", "mediatek,mt8195-disp-dsc";

Note: Some smartphone SoCs (Dimensity series) do have the same disp-dsc as
the Chromebook variant MT8195! :-)

>   
>     reg:
>       maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
> index a5c6a91fac71..6c2be9d6840b 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
> @@ -21,10 +21,9 @@ description: |
>   properties:
>     compatible:
>       oneOf:
> -      - items:
> -          - const: mediatek,mt8173-disp-gamma
> -      - items:
> -          - const: mediatek,mt8183-disp-gamma
> +      - enum:
> +          - mediatek,mt8173-disp-gamma
> +          - mediatek,mt8183-disp-gamma

This change is ok.

>         - items:
>             - enum:
>                 - mediatek,mt8186-disp-gamma
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
> index 69ba75777dac..c474ee6fa05b 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
> @@ -20,11 +20,9 @@ description: |
>   
>   properties:
>     compatible:
> -    oneOf:
> -      - items:
> -          - const: mediatek,mt8173-disp-merge
> -      - items:
> -          - const: mediatek,mt8195-disp-merge
> +    enum:
> +      - mediatek,mt8173-disp-merge
> +      - mediatek,mt8195-disp-merge

I'm mostly sure that you (yes, you, Yassine) will sooner or later write a
devicetree node containing the following compatible string on merge0:

compatible = "mediatek,mt6735-disp-merge", "mediatek,mt8173-disp-merge";

Am I wrong? :-)

In that case, that `oneOf:` will have to return back to this file, so it's
not worth removing it.

>   
>     reg:
>       maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
> index 853fcb9db2be..7e6bbf8b5c60 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
> @@ -20,11 +20,9 @@ description: |
>   
>   properties:
>     compatible:
> -    oneOf:
> -      - items:
> -          - const: mediatek,mt2712-disp-od
> -      - items:
> -          - const: mediatek,mt8173-disp-od
> +    enum:
> +      - mediatek,mt2712-disp-od
> +      - mediatek,mt8173-disp-od
>   

Same story with this one...

>     reg:
>       maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
> index 4e94f4e947ad..c7dd0ef02dcf 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
> @@ -21,10 +21,9 @@ description: |
>   properties:
>     compatible:
>       oneOf:
> -      - items:
> -          - const: mediatek,mt8183-disp-ovl-2l
> -      - items:
> -          - const: mediatek,mt8192-disp-ovl-2l
> +      - enum:
> +          - mediatek,mt8183-disp-ovl-2l
> +          - mediatek,mt8192-disp-ovl-2l

This change is ok.

>         - items:
>             - enum:
>                 - mediatek,mt8186-disp-ovl-2l
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
> index 065e526f950e..92e320d54ba2 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
> @@ -21,14 +21,11 @@ description: |
>   properties:
>     compatible:
>       oneOf:
> -      - items:
> -          - const: mediatek,mt2701-disp-ovl
> -      - items:
> -          - const: mediatek,mt8173-disp-ovl
> -      - items:
> -          - const: mediatek,mt8183-disp-ovl
> -      - items:
> -          - const: mediatek,mt8192-disp-ovl
> +      - enum:
> +          - mediatek,mt2701-disp-ovl
> +          - mediatek,mt8173-disp-ovl
> +          - mediatek,mt8183-disp-ovl
> +          - mediatek,mt8192-disp-ovl

This is ok too.

>         - items:
>             - enum:
>                 - mediatek,mt7623-disp-ovl
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
> index 27de64495401..12ec410bb921 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
> @@ -21,8 +21,7 @@ description: |
>   properties:
>     compatible:
>       oneOf:
> -      - items:
> -          - const: mediatek,mt8192-disp-postmask
> +      - const: mediatek,mt8192-disp-postmask

Should be fine as well.

>         - items:
>             - enum:
>                 - mediatek,mt8186-disp-postmask
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
> index 3ade2ece3fed..42059efad45d 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
> @@ -23,14 +23,11 @@ description: |
>   properties:
>     compatible:
>       oneOf:
> -      - items:
> -          - const: mediatek,mt2701-disp-rdma
> -      - items:
> -          - const: mediatek,mt8173-disp-rdma
> -      - items:
> -          - const: mediatek,mt8183-disp-rdma
> -      - items:
> -          - const: mediatek,mt8195-disp-rdma
> +      - enum:
> +          - mediatek,mt2701-disp-rdma
> +          - mediatek,mt8173-disp-rdma
> +          - mediatek,mt8183-disp-rdma
> +          - mediatek,mt8195-disp-rdma

OK.

>         - items:
>             - enum:
>                 - mediatek,mt8188-disp-rdma
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
> index 35ace1f322e8..54b7b0531144 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
> @@ -20,9 +20,7 @@ description: |
>   
>   properties:
>     compatible:
> -    oneOf:
> -      - items:
> -          - const: mediatek,mt8173-disp-split
> +    const: mediatek,mt8173-disp-split
>   


compatible = "mediatek,mt6795-disp-split", "mediatek,mt8173-disp-split";

I have exactly that in my local devicetree for Xperia M5 (not upstream yet) so
no, I wouldn't do that :-)

>     reg:
>       maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
> index b8bb135fe96b..87523b45a210 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
> @@ -21,9 +21,7 @@ description: |
>   
>   properties:
>     compatible:
> -    oneOf:
> -      - items:
> -          - const: mediatek,mt8173-disp-ufoe
> +    const: mediatek,mt8173-disp-ufoe
>   

Same, and I think UFOE is present on your MT6735 as well.

>     reg:
>       maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
> index 7d7cc1ab526b..52f233fe1c0f 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
> @@ -20,9 +20,7 @@ description: |
>   
>   properties:
>     compatible:
> -    oneOf:
> -      - items:
> -          - const: mediatek,mt8173-disp-wdma
> +    const: mediatek,mt8173-disp-wdma
>   

This is present on all MediaTek SoCs - literally. The issue is that the driver
currently does not support command mode panels for real, so this binding is...
...well, somehow in forgotten-land...

I would hope that command mode panels get implemented soon(er-than-later), but
I'll leave the choice to you and Krzysztof - I'm only providing the information
here. :-)

>     reg:
>       maxItems: 1

Thanks for the effort!

Cheers,
Angelo

