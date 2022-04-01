Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C21E4EEE65
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 15:44:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2324610E15D;
	Fri,  1 Apr 2022 13:44:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6BB210E15D
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 13:44:38 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id r13so5976787ejd.5
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Apr 2022 06:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=dXg0BEPoxux+zW0v1jfz5+2BtoCnLEGuBTvWBm9Wyb8=;
 b=gMQkHynZ9sEfJqF3clbblelIVMJmE4P2GB9CnUpmZVa+05XLiBeyYyG4m4Ke+7TEKj
 T6tbD0DkZ9M6vNnSoFXGkwTLf66XUlGNjhfT7HTVktWhQ/rxt+oimLhRbxCgIXNaPjZZ
 w9wA9pr6XnNDAYzD7eROPoL2znvhkzesaYphAkAztT9dg8/TZONcwFloW/RYEQ0Nifs9
 A7Q9hogCHgGoMeXJuCM3gDHSKibzYq6Ii+eoKQmYrRoMIN0lVFIXJYHVMhUc9p7YMblT
 XZwpryUSoQ+WHTB4cubOHbDqb29eC3RfWMP//dHhCtPKpp4JUO/pvRQqpNwQBrRE2Io5
 dMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dXg0BEPoxux+zW0v1jfz5+2BtoCnLEGuBTvWBm9Wyb8=;
 b=my+62Snzt9hXVXquSgPTE9T8UsCRwC1YRamO1eDGhKaRFUJc++2Zx/MXpeDgzCvWKR
 BvU89TMHN6+IU+Vfvwkf6eTGouBbr6BedD76SzsLoLDh8/5VsDaI1O5Pbl2D6fIrDErU
 EuQsNJpC/TalptyqqGhpNPV0RFSUQrLsuaJnWkr0+3IVK1Nu7w8eZL3EycG7LfxWzXzn
 bbO7sQW2qbWu8314PxAY8ORa8NkCYK1kSsUPQzdhqYCQEtU+iNOfoXwDRhNKrxUTb0TU
 3IR9yFJhc4spztgmcv4aJ9xVO0zNeqnpwD/KxezWX3mKn5O/G+KeuKFSHxJTg8CwS/io
 RiSQ==
X-Gm-Message-State: AOAM531lF3LyrHpW6pDNYT3AVcUesSXTcChgGPGTjwA1Nx/X8LqDTWQO
 z07GejnDTHIysWxNK0xfMoew/A==
X-Google-Smtp-Source: ABdhPJwihxSeskTAiciGW/SRE57is3wc8uCqoR1NFACh7coD/3vgO5wXAcx2Wk0MvUyPduOGFoVYFA==
X-Received: by 2002:a17:906:1be1:b0:6ce:b0a8:17d with SMTP id
 t1-20020a1709061be100b006ceb0a8017dmr9336353ejg.413.1648820677476; 
 Fri, 01 Apr 2022 06:44:37 -0700 (PDT)
Received: from [192.168.0.170] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 x4-20020a170906b08400b006e493cb583esm1054581ejy.47.2022.04.01.06.44.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Apr 2022 06:44:37 -0700 (PDT)
Message-ID: <39d74fa6-275b-b2bf-c5ed-7bc3a91e7fba@linaro.org>
Date: Fri, 1 Apr 2022 15:44:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/4] dt-bindings: display: ssd1307fb: Add entry for SINO
 WEALTH SH1106
Content-Language: en-US
To: Chen-Yu Tsai <wens@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20220330190846.13997-1-wens@kernel.org>
 <20220330190846.13997-3-wens@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220330190846.13997-3-wens@kernel.org>
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
Cc: devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/03/2022 21:08, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
> 
> The SINO WEALTH SH1106 is an OLED display driver that is somewhat
> compatible with the SSD1306. It supports a slightly wider display,
> at 132 instead of 128 pixels. The basic commands are the same, but
> the SH1106 doesn't support the horizontal or vertical address modes.
> 
> Add a compatible string for it.
> 
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
> index 9baafd0c42dd..1ac016a2d847 100644
> --- a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
> +++ b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
> @@ -13,6 +13,7 @@ maintainers:
>  properties:
>    compatible:
>      enum:
> +      - sinowealth,sh1106-i2c
>        - solomon,ssd1305fb-i2c
>        - solomon,ssd1306fb-i2c
>        - solomon,ssd1307fb-i2c

Please update the allOf:if: blocks.

Best regards,
Krzysztof
