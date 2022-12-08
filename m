Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C78CC646C45
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 10:53:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F5E510E485;
	Thu,  8 Dec 2022 09:53:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A33610E485
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Dec 2022 09:53:07 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id a7so969710ljq.12
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Dec 2022 01:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7u4aL/xpIdblYmbF/S8Sj8AuIu5jDM1rBtZZo4FjHsA=;
 b=oOYdGFZqrtgKOqOZAsi9qW9yDTBmTRR8FTdkdx8S0yyEY/xi/3ynl4iRHy+QBuLypz
 80SQgj6/Nmk0H5MzyD4B+RTrNPGbqnRGh+cLAV4xkFoSDEBT+62w1tWdtAe4nT5FZ3Wi
 6aVzbYOJuKeZ0PnGNCGfhdcx+TG05kc65H+8TykLS0fgQYpX3zb2kfKcWnrX75qVMaFV
 LemVmqHgOhi98IJxp9y54IvFICyyuXKCZuxcBsx2H6gX6OgXDy8QFgJKPD1RTHXN/xDc
 QW3uOaheniZ+GkhDsN2/gvy3mR3WdMvKL5bZ7yxWnLr4NxWusMhpbhG4jeEzPG4MKXfT
 TQcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7u4aL/xpIdblYmbF/S8Sj8AuIu5jDM1rBtZZo4FjHsA=;
 b=ALIgKMZy2OCoM8prmi2mzH/Al5ePo1MPRYaRMUajz6BXVC3iW1UJXCJ8o5LPZmyAGF
 xKEhWHav1mqtc/PRxoC6GzdENJxKNaKz5RCz8JK3MO5WkfKcUCAXc5pKxZtGVk8HUSUB
 /tJEOt0cPSoD46XSH3UHm2KtPkVB+8TCbeB7hpLgDVfki/hLzIfa/or2vuLDC6c/Z1DJ
 XxGfbYomI7Zbe/nuDp4l/+bWh/Tn2kda2ntNWhaMxf23/kM5CpZ0YXaV/cUiGXvmO/xz
 Jg7kYMkH+G1LU+327JEWvPUUbbdG7CJEX6AFJmGPDBzZjg+qJKEouTdHypa7lCehD+mV
 8UPw==
X-Gm-Message-State: ANoB5pkrjFuzP7fq0WF6p7WXhk0iAriSFpDolrCWwzvYbLM7a9My4tjX
 dbK67cwQy0QaKiy/LBHFHLUBeg==
X-Google-Smtp-Source: AA0mqf6NoOewg6gCSiROs5fwIGVTz6CRoTlYFRVgOMC46zrTxDXYoqYzYZzDfPqQUAYnVQjBKiajIg==
X-Received: by 2002:a2e:a54d:0:b0:278:f31b:2770 with SMTP id
 e13-20020a2ea54d000000b00278f31b2770mr25305817ljn.310.1670493185690; 
 Thu, 08 Dec 2022 01:53:05 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a05651220cd00b004b58500383bsm1078232lfr.272.2022.12.08.01.53.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Dec 2022 01:53:05 -0800 (PST)
Message-ID: <81b3ee7d-826c-b270-99d4-292e51e3cfdc@linaro.org>
Date: Thu, 8 Dec 2022 10:53:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 1/1] dt-bindings: lcdif: Fix constraints for imx8mp
Content-Language: en-US
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Marek Vasut <marex@denx.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221208094519.3561610-1-alexander.stein@ew.tq-group.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221208094519.3561610-1-alexander.stein@ew.tq-group.com>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/12/2022 10:45, Alexander Stein wrote:
> i.MX8MP uses 3 clocks, so soften the restrictions for clocks & clock-names.
> This SoC requires a power-domain for this peripheral to use. Add it as
> a required property.
> 
> Fixes: f5419cb0743f ("dt-bindings: lcdif: Add compatible for i.MX8MP")
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v2:
> * Squash both patches into one
> * Split the conditionals from fsl,imx6sx-lcdif
> * Mark power-domains as required for fsl,imx8mp-lcdif
> * Ignored the A-b & R-b due to reorganization
> 
> I'm not sure if this is the best way to add the constraints. I noticed that
> imx6sx also uses a power-domain, but imx6ul which is compatible to imx6sx does
> not, so they can't be merged.
> 
> I also have noticed that dtbs_check doesn't raise a warning when
> power-domains is actually missing.
> 
>  .../bindings/display/fsl,lcdif.yaml           | 31 ++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> index 876015a44a1e6..24014651f7dc8 100644
> --- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> +++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> @@ -52,6 +52,9 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> +  power-domains:
> +    maxItems: 1
> +
>    port:
>      $ref: /schemas/graph.yaml#/properties/port
>      description: The LCDIF output port
> @@ -81,7 +84,33 @@ allOf:
>            maxItems: 3
>        required:
>          - clock-names
> -    else:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx8mp-lcdif
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3
> +          maxItems: 3
> +        clock-names:
> +          minItems: 3
> +          maxItems: 3
> +        power-domains:
> +          minItems: 1

Drop power domains here.

> +      required:
> +        - clock-names
> +        - power-domains
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - fsl,imx6sx-lcdif
> +                - fsl,imx8mp-lcdif
> +    then:
>        properties:
>          clocks:
>            maxItems: 1

Best regards,
Krzysztof

