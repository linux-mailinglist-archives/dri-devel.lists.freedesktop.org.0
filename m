Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF2654BB9B
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 22:25:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20024112D26;
	Tue, 14 Jun 2022 20:25:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD6F112D26
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 20:24:58 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id h18so7411711ilj.7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 13:24:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Prhy9A37ks1LcK4a+DeU6wJg8EaLF2YElpfIpuhjq5k=;
 b=X+hP7Cd7+5c4k2ZXN21eVCGP5aG3tZAtoADDrtOTQIcvQCpgQdZyjXLkKlkuRNh5y7
 p6tc0NPamxUeuVn8AxElvmJ5Nqy17I9QzX5z5kfbwBRj9XjBrVihH4yWWcawdByOETPi
 ZehPX5FJkjxEGkiMp88UIR8c4oziqqlMFvgbr39y/OW4UwDmAAOlHuO/zPPlN/dzTjhE
 3W2mx6feY2V/cpYFJPLxixG2Y3EZ+ciOcDqPzHAtN5J74YY3t76nLXmNT19M3mEyHztu
 3MU5GEd1jFcnkoGuYw2UHnDtF9MFI0DydABrV+pE4HKR+EuY/eLSWzJnmBqf1MGQowpO
 3UOw==
X-Gm-Message-State: AJIora9aC0jG8U/Xm7bgQjpqA1EFCqW8dv9G50CrU7EAsY7juQteRJl0
 F75H8bNTr72Gb34bicrCBA==
X-Google-Smtp-Source: AGRyM1vF7TJBKpD4DYZTQWlZ5S4iATGPfvcxpkyfqWopgl8NXoI8/XPuak8qVqPSqHwTLaejygTYLA==
X-Received: by 2002:a05:6e02:1b04:b0:2d1:af55:eb92 with SMTP id
 i4-20020a056e021b0400b002d1af55eb92mr3936723ilv.227.1655238298241; 
 Tue, 14 Jun 2022 13:24:58 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id
 w20-20020a029694000000b00331d98c9a7fsm5258030jai.40.2022.06.14.13.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 13:24:57 -0700 (PDT)
Received: (nullmailer pid 2419397 invoked by uid 1000);
 Tue, 14 Jun 2022 20:24:55 -0000
Date: Tue, 14 Jun 2022 14:24:55 -0600
From: Rob Herring <robh@kernel.org>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Subject: Re: [PATCH v11 01/12] dt-bindings: mediatek,dpi: Add DP_INTF
 compatible
Message-ID: <20220614202455.GA2415891-robh@kernel.org>
References: <20220613064841.10481-1-rex-bc.chen@mediatek.com>
 <20220613064841.10481-2-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220613064841.10481-2-rex-bc.chen@mediatek.com>
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
Cc: chunkuang.hu@kernel.org, granquet@baylibre.com, jitao.shi@mediatek.com,
 devicetree@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, msp@baylibre.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org,
 wenst@chromium.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 13, 2022 at 02:48:30PM +0800, Bo-Chen Chen wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> DP_INTF is similar to DPI but does not have the exact same feature set
> or register layouts.
> 
> DP_INTF is the sink of the display pipeline that is connected to the
> DisplayPort controller and encoder unit. It takes the same clocks as
> DPI.
> 
> In this patch, we also do these string replacement:
> - s/mediatek/MediaTek/ in title.
> - s/Mediatek/MediaTek/ in description.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>  .../bindings/display/mediatek/mediatek,dpi.yaml     | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> index 77ee1b923991..ca1b48e78581 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> @@ -4,16 +4,16 @@
>  $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: mediatek DPI Controller Device Tree Bindings
> +title: MediaTek DPI and DP_INTF Controller
>  
>  maintainers:
>    - CK Hu <ck.hu@mediatek.com>
>    - Jitao shi <jitao.shi@mediatek.com>
>  
>  description: |
> -  The Mediatek DPI function block is a sink of the display subsystem and
> -  provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422 pixel data on a parallel
> -  output bus.
> +  The MediaTek DPI and DP_INTF function blocks are a sink of the display
> +  subsystem and provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422 pixel data on a
> +  parallel output bus.
>  
>  properties:
>    compatible:
> @@ -24,6 +24,7 @@ properties:
>        - mediatek,mt8183-dpi
>        - mediatek,mt8186-dpi
>        - mediatek,mt8192-dpi
> +      - mediatek,mt8195-dp_intf
>  
>    reg:
>      maxItems: 1
> @@ -36,12 +37,14 @@ properties:
>        - description: Pixel Clock
>        - description: Engine Clock
>        - description: DPI PLL
> +      - description: Clock gate for PLL
>  
>    clock-names:
>      items:
>        - const: pixel
>        - const: engine
>        - const: pll
> +      - const: pll_gate

You just added a new required clock for everyone.

>  
>    pinctrl-0: true
>    pinctrl-1: true
> @@ -55,7 +58,7 @@ properties:
>      $ref: /schemas/graph.yaml#/properties/port
>      description:
>        Output port node. This port should be connected to the input port of an
> -      attached HDMI or LVDS encoder chip.
> +      attached HDMI, LVDS or DisplayPort encoder chip.
>  
>  required:
>    - compatible
> -- 
> 2.18.0
> 
> 
