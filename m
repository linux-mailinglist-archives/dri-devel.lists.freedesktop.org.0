Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9A64EAB81
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 12:42:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6047D10E81C;
	Tue, 29 Mar 2022 10:42:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7DE110E81C
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 10:42:43 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id h16so10018394wmd.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 03:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=f3iBbK5fy2drNJnHSVd6h7L8RLpAs5pbHayacM7gQx0=;
 b=Nt78WXBKY+MY3+gr7xrFbMs04A5JgW4P5Hmd599UBhQBR7XU0sztciOhTjgTLJoBZx
 5/YqXihN7sBYpKymfVax90fPW3K+7HOUrmshJEaPR5X48tPrU6usCZLMe2yYujwCvtsw
 p6YScdT6Eq5nn0msocyNsxo2JWuqJFXPmx54pAaJWbo/ATPgSvuOnFaohfvW5FktMgXd
 5GUdSZx7vH2paIueNF6BeyOLtb98kzSiiKiGC0qu//dXk9j4KoZqsAjmb1d5T2QOeCyP
 BXKGIamIzxi0ScmxTfurAE4jsL7PZtE0ICPQGtYfA4Ov8cnT/BRcHPcrFJU4OM+b9/wG
 0pkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=f3iBbK5fy2drNJnHSVd6h7L8RLpAs5pbHayacM7gQx0=;
 b=jLg8OF2J8HcK1WBqVtmBx+pYa00UqZlCPFYYjYNqQl3iulY90HQy3Ro60ja7v2bYqr
 miMsuWtW3+p0QQSU8Wy07SuMId9sloIy58JHFiXeju0k64f/cl6w5NihcYBdUG+HR6o0
 aIQgCZPtByRXhNmrckpyjX89uH7YpO40j36w+b7LSGnq0HzvtMx1CMssKgGZmwZAQHPE
 m7WwFZJfIcEa5FsEo4RtyJbSVnhcdMANSkKIhunL6ErhcDlOzmQ8sK0ePYcxwOsSXH5z
 L1/z+hO7DiSrnmqERWhb9JxJxFL7iupF/FFB1uNwkz02O7gSr+Bwy+p960w/82GF9K8i
 9XQA==
X-Gm-Message-State: AOAM530SmXtt22bk15SWZssnG4MIAywoMnHdDQur2LYTEg4rYbZlZkNZ
 w7DtHUxrfHmEYw3hAVb0RlQ=
X-Google-Smtp-Source: ABdhPJwB/NXK19sx39DAWQg5uHNzUaed7dLgj4bbX1z3ETXRa6KA+QTBRYPZmGbtTluMMiRRs7y9PA==
X-Received: by 2002:a05:600c:3d86:b0:38d:581:89ad with SMTP id
 bi6-20020a05600c3d8600b0038d058189admr5993185wmb.42.1648550562084; 
 Tue, 29 Mar 2022 03:42:42 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 g17-20020a05600c4ed100b0038ca32d0f26sm2099039wmq.17.2022.03.29.03.42.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 03:42:41 -0700 (PDT)
Message-ID: <dc80d7f7-7a7b-62fb-fbd6-346dba9fdac5@gmail.com>
Date: Tue, 29 Mar 2022 12:42:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v9 01/22] dt-bindings: mediatek,dpi: Add DP_INTF compatible
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>, airlied@linux.ie,
 angelogioacchino.delregno@collabora.com, chunfeng.yun@mediatek.com,
 chunkuang.hu@kernel.org, ck.hu@mediatek.com, daniel@ffwll.ch, deller@gmx.de,
 jitao.shi@mediatek.com, kishon@ti.com, krzk+dt@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 p.zabel@pengutronix.de, robh+dt@kernel.org, tzimmermann@suse.de,
 vkoul@kernel.org
References: <20220327223927.20848-1-granquet@baylibre.com>
 <20220327223927.20848-2-granquet@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220327223927.20848-2-granquet@baylibre.com>
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
 linux-arm-kernel@lists.infradead.org, markyacoub@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 28/03/2022 00:39, Guillaume Ranquet wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> DP_INTF is similar to DPI but does not have the exact same feature set
> or register layouts.
> 
> DP_INTF is the sink of the display pipeline that is connected to the
> DisplayPort controller and encoder unit. It takes the same clocks as
> DPI.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   .../bindings/display/mediatek/mediatek,dpi.yaml       | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> index dd2896a40ff0..2dba80ad3b18 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> @@ -4,16 +4,16 @@
>   $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
>   $schema: http://devicetree.org/meta-schemas/core.yaml#
>   
> -title: mediatek DPI Controller Device Tree Bindings
> +title: mediatek DPI/DP_INTF Controller
>   
>   maintainers:
>     - CK Hu <ck.hu@mediatek.com>
>     - Jitao shi <jitao.shi@mediatek.com>
>   
>   description: |
> -  The Mediatek DPI function block is a sink of the display subsystem and
> -  provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422 pixel data on a parallel
> -  output bus.
> +  The Mediatek DPI and DP_INTF function blocks are a sink of the display
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
> @@ -54,7 +55,7 @@ properties:
>       $ref: /schemas/graph.yaml#/properties/port
>       description:
>         Output port node. This port should be connected to the input port of an
> -      attached HDMI or LVDS encoder chip.
> +      attached HDMI, LVDS or DisplayPort encoder chip.
>   
>   required:
>     - compatible
