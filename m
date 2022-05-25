Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73988533C04
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 13:55:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E2C10E13A;
	Wed, 25 May 2022 11:55:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A01BE10E13A
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 11:55:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 893E61F44CFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653479715;
 bh=nuxGWQWNesZ/7a6N1/y9rDh1aXO9s7JIDe0xC4nw6GQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=j9yTx8cauhT8UcAVv4U59s0oW4k8pz/Z6K1faqEFRrVipgEVU4Jv55Tslk4Us4zdn
 qelGzQ1noPB9csE56IIuB+fKDpZc5pnfYXAhBIQLYSItE6nPTl/Y/B6Cv3hGWjYDQP
 3jjkwRoUKkNMAtFTCNOaYAYgwjlm4+G1FhaN201qJOEwKLkvDbc6FE8kew5EWq8Sgu
 neVTNTi35gFOCfBXTVj6l2wpwsriJwCvwCwQldtO2r9Dbc+uqLJvHXY4RIU4p27NFI
 w7ek15EnwpP0EQxN3qTbEFz0J3kygxhtjj2xq6LO+TbHW9GTMMTmgMcqZORZmT5ptW
 kqVK/YQdIvofg==
Message-ID: <c1dacdd0-f25e-a522-5d5f-1ef2fe297094@collabora.com>
Date: Wed, 25 May 2022 13:55:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v10 01/21] dt-bindings: mediatek,dpi: Add DPINTF compatible
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Helge Deller <deller@gmx.de>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
 <20220523104758.29531-2-granquet@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220523104758.29531-2-granquet@baylibre.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 23/05/22 12:47, Guillaume Ranquet ha scritto:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> DPINTF is similar to DPI but does not have the exact same feature set
> or register layouts.
> 
> DPINTF is the sink of the display pipeline that is connected to the
> DisplayPort controller and encoder unit. It takes the same clocks as
> DPI.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>   .../bindings/display/mediatek/mediatek,dpi.yaml     | 13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> index dd2896a40ff0..6d9f6c11806e 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> @@ -4,16 +4,16 @@
>   $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
>   $schema: http://devicetree.org/meta-schemas/core.yaml#
>   
> -title: mediatek DPI Controller Device Tree Bindings
> +title: mediatek DPI/DPINTF Controller
>   
>   maintainers:
>     - CK Hu <ck.hu@mediatek.com>
>     - Jitao shi <jitao.shi@mediatek.com>
>   
>   description: |
> -  The Mediatek DPI function block is a sink of the display subsystem and
> -  provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422 pixel data on a parallel
> -  output bus.
> +  The Mediatek DPI and DPINTF function blocks are a sink of the display
> +  subsystem and provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422 pixel data on a
> +  parallel output bus.
>   
>   properties:
>     compatible:
> @@ -23,6 +23,7 @@ properties:
>         - mediatek,mt8173-dpi
>         - mediatek,mt8183-dpi
>         - mediatek,mt8192-dpi
> +      - mediatek,mt8195-dpintf
>   
>     reg:
>       maxItems: 1
> @@ -35,12 +36,14 @@ properties:
>         - description: Pixel Clock
>         - description: Engine Clock
>         - description: DPI PLL
> +      - description: Optional CK CG Clock
>   
>     clock-names:
>       items:
>         - const: pixel
>         - const: engine
>         - const: pll
> +      - const: ck_cg

This is my understanding on how the DisplayPort Interface clocks work on 8195:

The "engine" clock is for the *VPP Engine's DisplayPort ip/block*,
"pll" is for TVD PLL divider selection
"pixel" is the gate for the pixel clock to the connected display.

"ck_cg" is useless, as that's the parent of "pixel" (and will always be)... for
example, on mt8195... check clk/mediatek/clk-mt8195-vdo0.c - the
CLK_VDO0_DP_INTF0_DP_INTF clock already has CLK_TOP_EDP as its parent, hence
enabling the first will enable the latter.

That said... you can most probably avoid adding the ck_cg clock, as if you try
to turn that off while it's in use by its children, you'll be only decrementing
a refcount, but no "real action" will ever take place.


Regards,
Angelo
