Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D33A473400F
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jun 2023 12:12:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3E7510E08C;
	Sat, 17 Jun 2023 10:12:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BEE210E08C
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jun 2023 10:12:23 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-986864cfe5dso234735466b.1
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jun 2023 03:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686996740; x=1689588740;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TgP7Xo0/BI+q/hHqVMJMUYkrnaQIXgCa1ZtLOmCe39I=;
 b=WY/Al9fg2u/uL7+ehIIXuN3VmIYDiGimoYGFQeZU7j8AvPZCB+bcbRw/+WqHtBruYr
 ETErEbysbq115pvxQot3y8VruE74oD1UwQMYIRagJLyOxXLehg4EwLAlNRfH0kRRSkDz
 wSLNCUUueHDn9G0f2kA7bNDD86wzffQKqbq5sO3Ow2jlbhRsG0hn646D5aEmZre6NfVe
 s4SOKzNa4tdpcPXF8+sMQGyOQSUfUytKGY9n8FPEaGDgKgEeSfm5ddwC9IlXMquMhlL1
 84g4IDdebc+bMhNpNSMw1kE0850ioi+5VEaN9QcNCz4LhNBPQ2QCw83m1zPCHLrb82xI
 JWJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686996740; x=1689588740;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TgP7Xo0/BI+q/hHqVMJMUYkrnaQIXgCa1ZtLOmCe39I=;
 b=H8UmUcJwkBXyjbJwqd3tP7GYjDQEdIwkDyAr1Q5V/8OxQKx7RiRFG9txSulKltUOYK
 4DfcUyU1neaXsiEtlI+0WPOmBqQa61y/W3CwlWoJz8gXGaoJ4Ld33TyI0K2sWEdix+ps
 nAEEhSxoEBdgqZFDdwkH1Wi8jbui/BGzoOm7JCZvwsu1d9s7NUOagT5uc82NMsmrQgfE
 cdSoQBY0Sn8x1J3gXVxY9/GBaokutN9YqnXnkRyrgXtSeOQn55q280COtyJ5IO2MGPSB
 vQHeYCEsQfJdODMEHmquWUHKTdUfLV2QuHbgX0ZYDNSQeNH6v5xmbjTRGLOzbFdKx6eN
 ANoA==
X-Gm-Message-State: AC+VfDyYVarFQ3ljUaSzSlyd1XSKrHJWPhkiuJgpsczYeQzeDMrGhQJg
 UbXX7j2rM/zTj3tD6DqRLb6lTA==
X-Google-Smtp-Source: ACHHUZ6Yrsd8H0C60FMXwj8vhCdlHIXessbhg49bscbUVgRS9oFYMYBeaKA0rC+pw4cm1EFHhY8Ygg==
X-Received: by 2002:a17:907:d26:b0:977:d468:827 with SMTP id
 gn38-20020a1709070d2600b00977d4680827mr4767373ejc.17.1686996739862; 
 Sat, 17 Jun 2023 03:12:19 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 i24-20020a170906115800b0098642e99c26sm1980189eja.174.2023.06.17.03.12.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Jun 2023 03:12:19 -0700 (PDT)
Message-ID: <17576d81-a342-0b77-367a-eb9f2b97b734@linaro.org>
Date: Sat, 17 Jun 2023 12:12:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/3] dt-bindings: backlight: lm3630a: add entries to
 control boost frequency
Content-Language: en-US
To: Maximilian Weigand <mweigand2017@gmail.com>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
References: <20230602-lm3630a_boost_frequency-v1-0-076472036d1a@mweigand.net>
 <20230602-lm3630a_boost_frequency-v1-2-076472036d1a@mweigand.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230602-lm3630a_boost_frequency-v1-2-076472036d1a@mweigand.net>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Maximilian Weigand <mweigand@mweigand.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/06/2023 21:08, Maximilian Weigand wrote:
> From: Maximilian Weigand <mweigand@mweigand.net>
> 
> Add 'ti,boost_use_1mhz' to switch between 500 kHz and 1 MHz boost
> converter switching frequency, and add 'ti,boost_frequency_shift' to
> activate a frequency shift to 560 kHz or 1.12 MHz, respectively.
> 
> Signed-off-by: Maximilian Weigand <mweigand@mweigand.net>
> ---
>  .../bindings/leds/backlight/lm3630a-backlight.yaml           | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
> index 3c9b4054ed9a..ef7ea0ad2d25 100644
> --- a/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
> +++ b/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
> @@ -33,6 +33,18 @@ properties:
>      description: GPIO to use to enable/disable the backlight (HWEN pin).
>      maxItems: 1
>  
> +  ti,boost_use_1mhz:

No underscores in property names.

> +    description: |

Do not need '|' unless you need to preserve formatting.

> +      If present, change the boost converter switching frequency from the
> +      default 500 kHz to 1 MHz. Refer to data sheet for hardware requirements.
> +    type: boolean
> +
> +  ti,boost_frequency_shift:
> +    description: |
> +      If present, change boost converter switching frequency from 500 kHz to
> +      560 kHz or from 1 Mhz to 1.12 Mhz, respectively.

So just make it a property choosing the frequency, not bools, with
proper unit suffix.


Best regards,
Krzysztof

