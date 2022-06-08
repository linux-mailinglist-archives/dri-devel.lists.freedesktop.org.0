Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28067542AC1
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 11:07:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04FE210E2D5;
	Wed,  8 Jun 2022 09:07:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ECC310E2D5
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 09:07:30 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id d14so623503eda.12
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 02:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rGAq4iJpxrWH26r4v3kGADYD/+3w1lhJSCcD5FIQXdU=;
 b=O0xd2Hdn/TXw/TpQcEa4m6r6LaJMi3/Wjf8zui/j3m4s1mNB1Ak508t1pdTQu7PR3j
 Qy3Yt3JJIP4c9RPAsZBuYMm9vYU1hF2OSlXA9WPI5sKXggrKJwzrFcN/mpJDlnPWaSmX
 rQj8hHoM0cklzvFtBuT1VEji2jaNz8c66zbSAdDjePPg170tpP9rsobsg4nVyge+ngV+
 ybNN8BdagbF7r+qKjyJHO3xwLDQ2k7b51Zm99s16yP0LzD3hFEdsbhWevO/ULRqceoxm
 PGNEJzRhwBRZeSyu+YwWjGbrSiAN/AuNJiRIMz8VAn3IurSzVPzRQ9e9QEUg1kgGY362
 2n7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rGAq4iJpxrWH26r4v3kGADYD/+3w1lhJSCcD5FIQXdU=;
 b=QrM6e52JGMt8G2AZdbe9mGBzk+QCwToJmuFMpO1+U0j8ThITCIN4aOIbzFR8tCyO6e
 zG0UKgL+VF5bkFQlWouvXU6rhuCS1w0G7pz/nD9l291rgLmLWoj10ojgAzl/qjo32HNa
 HwCrEF0sw8qeojdjO5tr/ZRXCrPQAj0nV7TaqW8MRvbLBJyC3vS6a1x0/1l54jrobLz8
 BA697ymL5pA6W0cRdVJL++O0mm6UoV823bZg3qebtPmhO69RnIiIiqeTABU3Q8w73gGq
 xmwMq3dVSj4B5mgxlOhuBMfh4VvSTnZs828yGmoyfjTKAe2ltZ6u2/0xQSVWnH4KgT2U
 WdWA==
X-Gm-Message-State: AOAM532n7xErHaeQ5P0qRH8/57WBY6jYYuug8ypQ8H3mFjXLYu6N3xPd
 vkE0tuLJ5qQqa9iZzhZSYMAsPw==
X-Google-Smtp-Source: ABdhPJza6k5S7+pmqbQfI8gdRti+QgJDdbBtfUOc7HjAeExYq9Q1uMmaVNDhDI7HMIbSJ/vcySsU3A==
X-Received: by 2002:a05:6402:b03:b0:42d:ce84:387a with SMTP id
 bm3-20020a0564020b0300b0042dce84387amr38840161edb.3.1654679249188; 
 Wed, 08 Jun 2022 02:07:29 -0700 (PDT)
Received: from [192.168.0.190] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 ft29-20020a170907801d00b0071145c2f494sm5101080ejc.27.2022.06.08.02.07.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 02:07:28 -0700 (PDT)
Message-ID: <e3add370-de7d-db41-0a35-489fda0a3f60@linaro.org>
Date: Wed, 8 Jun 2022 11:07:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/2] dt-bindings: backlight: rt4831: Add the new ocp
 level property
Content-Language: en-US
To: cy_huang <u0084500@gmail.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, lee.jones@linaro.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
References: <1654677674-15417-1-git-send-email-u0084500@gmail.com>
 <1654677674-15417-2-git-send-email-u0084500@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1654677674-15417-2-git-send-email-u0084500@gmail.com>
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
 lucas_tsai@richtek.com, deller@gmx.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cy_huang@richtek.com, pavel@ucw.cz,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/06/2022 10:41, cy_huang wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add 'richtek,bled-ocp-microamp' property to make it chooseable.
> 
> The wrong backlight ocp level may affect the backlight channel output
> current smaller than configured.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
> Since v2:
> - Change the property name from 'richtek,bled-ocp-sel' to 'richtek,bled-ocp-microamp'.
> 
> ---
>  .../devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml
> index e0ac686..0f4beeb 100644
> --- a/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml
> +++ b/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml
> @@ -47,6 +47,11 @@ properties:
>      minimum: 0
>      maximum: 3
>  
> +  richtek,bled-ocp-microamp:
> +    description: |
> +      Backlight over current protection level, unit in microamp.

Skip last part. Unit comes from property name.

> The current
> +      supported level is 0.9A/1.2A/1.5A/1.8A.

Define here enum instead of this text.

Best regards,
Krzysztof
