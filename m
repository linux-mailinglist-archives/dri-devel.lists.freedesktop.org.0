Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB364CE747
	for <lists+dri-devel@lfdr.de>; Sat,  5 Mar 2022 22:49:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F0A010E3C7;
	Sat,  5 Mar 2022 21:49:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 793E610E3C7
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Mar 2022 21:49:09 +0000 (UTC)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C70603F1CB
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Mar 2022 21:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1646516947;
 bh=xIGwC4dMVAbcNM9VbnP/VQuX2kHBkqPx10EnWit2MpM=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=DYLBzoBy7CVUeD37FMqOFo4vuWl/sr34iyf1e/FF7NiO1ODMnJP5CJA1EFqwt4bN9
 nHRUnC5pzKCMPnNh1+22NbpxSTKmZInnYh84TXgbRXYLShsAlu4B2uOnM6YuTkq02P
 efjkZo8valUdoWd5kctOxNTEvodcp0n2njkvahBgI2bnZyPHKfYXIoWQMlhi+sq7vP
 1PHbnYj1zbHsTnwzGK+4k5jSuyCdAivFLBdRERg4H5FFa1a4BOu+2kb1KOlilP3TPL
 3GzYXCTP6abia/8BNSI+rT3CauQytKC95Lr1gG8CylJZeyFNy5efXZqXyFp/nCrpgL
 xVpmGeTb6hjqQ==
Received: by mail-ej1-f72.google.com with SMTP id
 l24-20020a170906a41800b006da873d66b6so4743675ejz.3
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Mar 2022 13:49:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xIGwC4dMVAbcNM9VbnP/VQuX2kHBkqPx10EnWit2MpM=;
 b=a3dzff/CIx/VFRw6W72ynaLSJ/wkuhKkYQ3ylKRWlanOsbKiywjNlgOdpb45sLka9C
 JUKh5WoaKFporXq02eQTGbTXbx9Jz/z8gOZxCskViTm9OgnwfMhfhv23fHhpJtFGYZSm
 59X2nnqYPK78/aeaww71s4Tg6sbagqFVOylKBLiKd7q87BkvnCxJdJdIV3GSlPJKEJk/
 Az4brlS+3DhxYfdFgvi3NVfU0EXKHg926dKmmL1378hm6PuTLFe79tZLAMqbToPxLl5r
 VSnL269UEKLxVG5NOpgBbKmvGbQ1qBMN59EhgtjJQPPv8J94aNmFEYbSNrAqw2XSBYOU
 lsZw==
X-Gm-Message-State: AOAM531/dW/cD0KjpclQo/Kc/0FVRyMXWyxPWxmrRaCvcWspHRvFXVul
 Bw7iyn0Bm0YuwMoeARBTGEUGT3GlEG8kav9lfoPl0oi5IHpbmVbEKpuP50qCVJXxx3yyBBFsCjq
 ArmMx1xDPHxOJyoLtJPPHxbNGLjS/Ot+zBeFK8PknNjO/FQ==
X-Received: by 2002:a17:906:a10:b0:6ce:7107:598b with SMTP id
 w16-20020a1709060a1000b006ce7107598bmr3838140ejf.653.1646516947421; 
 Sat, 05 Mar 2022 13:49:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyr2kT1aeQLLJO9FBVlLCJJEpNgkXx6haeqI+gPwVq8L5czrgAUT8X08CZ0HwZ0nOoFqxAA7Q==
X-Received: by 2002:a17:906:a10:b0:6ce:7107:598b with SMTP id
 w16-20020a1709060a1000b006ce7107598bmr3838131ejf.653.1646516947209; 
 Sat, 05 Mar 2022 13:49:07 -0800 (PST)
Received: from [192.168.0.140] (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108]) by smtp.gmail.com with ESMTPSA id
 z21-20020a1709063a1500b006da6436819dsm3247439eje.173.2022.03.05.13.49.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Mar 2022 13:49:06 -0800 (PST)
Message-ID: <44308465-db4c-80e7-2beb-b0f676d16edf@canonical.com>
Date: Sat, 5 Mar 2022 22:49:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/2] dt-bindings: gpu: Convert aspeed-gfx bindings to
 yaml
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Rob Herring <robh+dt@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>
References: <20220304000311.970267-1-joel@jms.id.au>
 <20220304000311.970267-3-joel@jms.id.au>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220304000311.970267-3-joel@jms.id.au>
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
Cc: devicetree@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
 linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/03/2022 01:03, Joel Stanley wrote:
> Convert the bindings to yaml and add the ast2600 compatible string.
> 
> The legacy mfd description was put in place before the gfx bindings
> existed, to document the compatible that is used in the pinctrl
> bindings.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  .../devicetree/bindings/gpu/aspeed,gfx.yaml   | 69 +++++++++++++++++++
>  .../devicetree/bindings/gpu/aspeed-gfx.txt    | 41 -----------
>  .../devicetree/bindings/mfd/aspeed-gfx.txt    | 17 -----
>  3 files changed, 69 insertions(+), 58 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/gpu/aspeed,gfx.yaml
>  delete mode 100644 Documentation/devicetree/bindings/gpu/aspeed-gfx.txt
>  delete mode 100644 Documentation/devicetree/bindings/mfd/aspeed-gfx.txt
> 
> diff --git a/Documentation/devicetree/bindings/gpu/aspeed,gfx.yaml b/Documentation/devicetree/bindings/gpu/aspeed,gfx.yaml
> new file mode 100644
> index 000000000000..8ddc4fa6e8e4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/aspeed,gfx.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpu/aspeed,gfx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED GFX display device
> +
> +maintainers:
> +  - Joel Stanley <joel@jms.id.au>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - aspeed,ast2400-gfx
> +          - aspeed,ast2500-gfx
> +          - aspeed,ast2600-gfx

That's different than original bindings - new patch. It's not currently
supported, so adding it is more than just updating bindings to current
state.

> +      - const: syscon
> +
> +  reg:
> +    minItems: 1

maxItems?

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  memory-region: true
> +
> +  syscon: true

You need at least description. I see old bindings did not mention it
(except that it is required)... I think you also need a type, because it
is not a standard property.

> +
> +  reg-io-width: true

Some constraints? Can it be anything from syscon schema?

Best regards,
Krzysztof
