Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7826690233
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 09:34:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0965B10E950;
	Thu,  9 Feb 2023 08:34:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com
 [IPv6:2607:f8b0:4864:20::a2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 132EC10E950
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 08:34:09 +0000 (UTC)
Received: by mail-vk1-xa2d.google.com with SMTP id 9so561804vkq.9
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Feb 2023 00:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gWuuUdo7aS+R+xwyMPT4inxSLLiy9YRKAIGpnfs3mMw=;
 b=mnc8Ifx6QnAPmYWW1FKA6DpGkfoRhUGOlwZyawmaWZUYXBRs3P3lMZ6UuiJN+OVnrP
 JYO03+hkMmh17dEbozQueyLF/rseofZe1Ytt3Bf02eSA13fv7UUEzVDkYLMk6yry8LOM
 c7xhnpHflipzPwMHeJMaqdWdhYrJCxv4p+PSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gWuuUdo7aS+R+xwyMPT4inxSLLiy9YRKAIGpnfs3mMw=;
 b=nNIvZkQ8k0ZmJRSEF5A3qqaqN9AkWQANlIqWQlKYRH4qNs81QJHNfCFxHdbS56pVuB
 6kIRERdAy980XKpl7x2eLJPBzCClPAfbaJsA4xgOBFniA8CALVvYNDZTAiBW5V5YCjid
 xEej46cuQCjfrR4tOgawM5anfz0/yFHD1rT2jr/JY6LbYuyxaIuyABuhp4uByojI5tVs
 /9OPSuvEDGipOQSFE8jZFBAhTCTH4Les1MpwZHzCrgl5uItRjvV9haBm1s5qjmP/hHQ0
 HtS8myWxJ4kheJOkxsp8ZsKNOHBIee/eQUilWDogWCaJuo3tiAniz1tT5pmOFtjX+Bru
 VUwQ==
X-Gm-Message-State: AO0yUKVcsWVtqxaErKYgRwRoeYEDEDgEyQbfWn2KtMNn4rC6pSkDkZT9
 vhCghUGDGfX5ORDwv2pHHQPnt69/GEKFHe0TkuW+hg==
X-Google-Smtp-Source: AK7set8pBou1qM81NL3KNWeDM08Kg7jVEwCB11009P47SaV8veeMsx+j8GewJrleWgySAp8Llo1VSXqxEKvDZ4DLKFA=
X-Received: by 2002:a1f:9493:0:b0:3ea:7394:e9ef with SMTP id
 w141-20020a1f9493000000b003ea7394e9efmr2102117vkd.11.1675931648111; Thu, 09
 Feb 2023 00:34:08 -0800 (PST)
MIME-Version: 1.0
References: <20230208103709.116896-1-angelogioacchino.delregno@collabora.com>
 <20230208103709.116896-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230208103709.116896-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 9 Feb 2023 16:33:57 +0800
Message-ID: <CAGXv+5FXqEJaADrhgu-tPfEPPkP1B=bo_KytBH55xCRea4CmTQ@mail.gmail.com>
Subject: Re: [PATCH 2/9] dt-bindings: gpu: mali-bifrost: Allow up to 5 power
 domains for MT8192
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, tomeu.vizoso@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 steven.price@arm.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 alyssa.rosenzweig@collabora.com, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 8, 2023 at 6:37 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> MediaTek MT8192 (and similar) needs five power domains for the
> Mali GPU and no sram-supply: change the binding to allow so.
>

mt8192 compatible was already added, so this should have:

Fixes: 5d82e74a97c2 ("dt-bindings: Add compatible for Mali Valhall (JM)")

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/gpu/arm,mali-bifrost.yaml        | 34 +++++++++++++++++--
>  1 file changed, 31 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> index 69212f3b1328..e7aba66ddb8f 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> @@ -61,7 +61,7 @@ properties:
>
>    power-domains:
>      minItems: 1
> -    maxItems: 3
> +    maxItems: 5
>
>    resets:
>      minItems: 1
> @@ -141,6 +141,18 @@ allOf:
>          - power-domains
>          - resets
>          - reset-names
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - mediatek,mt8183-mali
> +                - mediatek,mt8192-mali
> +    then:
> +      properties:
> +        power-domains:
> +          maxItems: 1
>    - if:
>        properties:
>          compatible:
> @@ -161,10 +173,26 @@ allOf:
>          - sram-supply
>          - power-domains
>          - power-domain-names
> -    else:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8192-mali
> +    then:
>        properties:
>          power-domains:
> -          maxItems: 1
> +          minItems: 5
> +        power-domain-names:
> +          items:
> +            - const: core0
> +            - const: core1
> +            - const: core2
> +            - const: core3
> +            - const: core4
> +
> +      required:
> +        - power-domains
> +        - power-domain-names
>    - if:
>        properties:
>          compatible:
> --
> 2.39.1
>
