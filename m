Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F3E7189AD
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 20:56:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 884AA10E1DF;
	Wed, 31 May 2023 18:56:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E34C510E51B
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 18:56:49 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-97000a039b2so1065576566b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 11:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685559406; x=1688151406;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cSea+jHv5VzJ7O3URdOQ0RMo8b1SAY8L+HjdsXboNjs=;
 b=zUz6zuSoUXHVZpNijhpGWuMPKejgv3LQ14v2aQ8Q1jbPzp8MSz+OgK0VR5xbgpMtev
 wWl5fLewhQy5nW4MXD5LuaODzO5vA+EnPv1THVkE5AF/W6Ilczxu4FCB7rck6azDoCCi
 W8Bhn2nfoO1A+vBsK0QKM54BxL+k03CyJA6UKNpxM1/Q+7OgokQ0a56W+JpRiAL2MpGg
 45nVgXfC9VwfjN8cobXKIKVzPGRK4jP0L1OjQchQ8P53qAKT2MASLK1VkPDg7tyso4bl
 cCK+nyLZw0vaytDyqQ6i9rmp+jylUOYtReYEH77mML05zjMpL4mX9jyp4VCnmqxuMgR+
 REcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685559406; x=1688151406;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cSea+jHv5VzJ7O3URdOQ0RMo8b1SAY8L+HjdsXboNjs=;
 b=lRgSpg9oEOg9OPhNPANiaxoWKS0P6pTTnYzGDETyDnyvOOUMmVWex3Pwwvlcl0AXG2
 6s72i1yTx0ogiwEfOGoLVjbRXwaP1wM5yPEa3o7pq6l7gzRyyxXm6CjJDf5tNkYZQ0bb
 j1JS5JKFJoTKAI45ZIkuKzqUgngUb/9gXfN/EKu5X78paoMhnGnZA+Awsbx0aqLnY7Av
 uOROsUbs4ZuObPhU3au2IiDNu0ExkPH6G9MJ7ywi7JcyM71cnhfJk+jJFWIxE1Ifzk+f
 mVfGfgHlfFyK91+gnuIbuU3p+LrDIs/nYB2shzXxnqOGvhc39z2rI0TCF64c3o+u+bHm
 zlpw==
X-Gm-Message-State: AC+VfDw9GZisVHiQp0uiEM8ktDkywXLw27BOf8D3ttee/Xw6sQoz8nFc
 pNH+9MhBSUXQgzgRP89YQ9ld2w==
X-Google-Smtp-Source: ACHHUZ69HfZ0Sn5W1/MEF6Evu6R3NVMg+JqIgVvA5SVX7ScjPSXbbN5+f8VRRJ4+I9DiOjO/1ADvDA==
X-Received: by 2002:a17:907:9455:b0:966:2123:e0ca with SMTP id
 dl21-20020a170907945500b009662123e0camr6473689ejc.34.1685559405777; 
 Wed, 31 May 2023 11:56:45 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
 by smtp.gmail.com with ESMTPSA id
 gr10-20020a170906e2ca00b0096ace550467sm9560627ejb.176.2023.05.31.11.56.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 May 2023 11:56:45 -0700 (PDT)
Message-ID: <eb2b71df-6767-40f3-afc1-ef1552aeaee6@linaro.org>
Date: Wed, 31 May 2023 20:56:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] dt-bindings: samsung,mipi-dsim: Use port-base reference
Content-Language: en-US
To: Fabio Estevam <festevam@gmail.com>, neil.armstrong@linaro.org
References: <20230531014315.1198880-1-festevam@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230531014315.1198880-1-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: marex@denx.de, devicetree@vger.kernel.org, conor+dt@kernel.org,
 Fabio Estevam <festevam@denx.de>, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31/05/2023 03:43, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Use port-base reference for port@0 and port@1.
> 
> This fixes the following schema warning:
> 
> imx8mm-evk.dtb: dsi@32e10000: ports:port@1:endpoint: Unevaluated properties are not allowed ('data-lanes' was unexpected)
> From schema: Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
> 
> Fixes: 1f0d40d88f7a ("dt-bindings: bridge: Convert Samsung MIPI DSIM bridge to yaml")

No, you change correct binding into incorrect to hide warning, instead
of fixing root cause.

> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  .../devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
> index 9f61ebdfefa8..51879030dd6d 100644
> --- a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
> @@ -93,14 +93,14 @@ properties:
>  
>      properties:
>        port@0:
> -        $ref: /schemas/graph.yaml#/properties/port
> +        $ref: /schemas/graph.yaml#/$defs/port-base

No, because you allow now anything here.

>          description:
>            Input port node to receive pixel data from the
>            display controller. Exactly one endpoint must be
>            specified.
>  
>        port@1:
> -        $ref: /schemas/graph.yaml#/properties/port
> +        $ref: /schemas/graph.yaml#/$defs/port-base

This would have sense if you kept original intention, so
additionalProperties: false

Without it - you just break bindings to hide warning.



Best regards,
Krzysztof

