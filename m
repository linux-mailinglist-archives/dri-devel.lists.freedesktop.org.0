Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E853662F59A
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 14:12:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 831E010E71C;
	Fri, 18 Nov 2022 13:11:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB5F10E71C
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 13:11:50 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id h12so6689883ljg.9
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 05:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gWNSpfNgmKIkoqMVV5tmWYlIFYhEHax9TrvGPimvErs=;
 b=v4nFmk80qIBizuw3D1YMYQGM+vnSIvdnLk9TyHIG0in5TwlQhnPkUxZ9S2wEGIO7+5
 NloDoVXNp29Tv+V2Ab46XHQlVhufLDrh990FfdE+BCoIabs2Kjsu5+aPGZVZoHtgLY4E
 Asv3aahR7nX4q3ptImiN2N8+/PiZfDlpXIUl1AV2LXskiukPE0YGDHopQfy42JWo9qrt
 RjcBxuxPFUEZJvL+xxHGOm3mC4odbJeVAynBHG5r5Luy+JASyjK9R5dMYXHe5TtcRUSw
 Bjx+cNlKFLPOsmFRX4yckjQy25Tw2A/rEuh0/jCHDai5aJj3brf0FiV2KlBCDADvWndd
 BnKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gWNSpfNgmKIkoqMVV5tmWYlIFYhEHax9TrvGPimvErs=;
 b=0+Y93MkH0EOcxY6f6SFFUKUoobdT0BeGKXTMF2s1yTc5kdRa2NQIid33J5VEixrHSj
 dT0YZTSEnCRRoUPx1mb+btDxOGhIa8Is15jP6dxdmrbEWu7/6WNKb+O0XnNTjPV4ctan
 gEL26nS4jPnSVzk83IGpfn1xqVWJQxEkBP2pevLOeZpRA0TzhJ2pCJQlOab5f0jbQS2v
 uIEweXqHKota+29f0C6Wd6u0wgNs4OJE0mxzAC5o+lLz/yg+mVAGYTmAYbqg0haX92QW
 jK6lx0Cne9fjxZNkTL/Aff/RAFU8Xtey9RKiTrwY9ojfHbOJ+C3EMswR9r/83vZu/pUA
 U8ow==
X-Gm-Message-State: ANoB5plvvjUlvlagMUY3DPvqwYVV2/mfuuE50FhcqYepgEQQ+VtUNSb5
 EufXE/erm3FBZQEG6IwbwH6PvA==
X-Google-Smtp-Source: AA0mqf5PKOpsepLXZQM4MZvGilr6TDpkzUoFgDlnpUqKg2bm3LymDyhlqEiF6bM8W2n4RIlehziIUw==
X-Received: by 2002:a05:651c:178d:b0:278:a59c:390c with SMTP id
 bn13-20020a05651c178d00b00278a59c390cmr2455317ljb.512.1668777108719; 
 Fri, 18 Nov 2022 05:11:48 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a195504000000b00492ce573726sm661503lfe.47.2022.11.18.05.11.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Nov 2022 05:11:48 -0800 (PST)
Message-ID: <5292cc1b-c951-c5c5-b2ef-c154baf6d7fd@linaro.org>
Date: Fri, 18 Nov 2022 14:11:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 01/23] dt-bindings: display: tegra: add bindings for
 Tegra20 VIP
Content-Language: en-US
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
References: <20221109141852.729246-1-luca.ceresoli@bootlin.com>
 <20221109141852.729246-2-luca.ceresoli@bootlin.com>
 <ca5f3b54-25bd-4dd5-799f-c7bda08cdef6@linaro.org>
 <20221118100800.4950aec0@booty>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221118100800.4950aec0@booty>
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
Cc: devicetree@vger.kernel.org, Richard Leitner <richard.leitner@skidata.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Dmitry Osipenko <digetx@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/11/2022 10:08, Luca Ceresoli wrote:
>   description: parallel video capture interface for the VI
> 
>>> +    type: object  
>>
>> Do you expect it to grow to more channels?
> 
> Not on Tegra20, it has one input only, but for other SoCs it's likely.
> Definitely some (including Tegra20 itself) have multiple CSI-2 inputs,
> and it's reasonable that this can apply to parallel input too.
> 
> Is this enough motivation to make room for more channels, or should I
> remove it since I have no plans to introduce support for other Tegra
> chips?

The best would be to add some more Tegra SoCs here, so that this @0
makes sense.

But I guess the block can be re-used in future, so it could also stay
like this.

> 
>>> +
>>> +    properties:
>>> +      reg: true  
>>
>> const: 0
>>
>>> +
>>> +      ports:
>>> +        $ref: /schemas/graph.yaml#/properties/ports
>>> +
>>> +        properties:
>>> +          port@0:
>>> +            $ref: /schemas/graph.yaml#/properties/port
>>> +            description:
>>> +              Port receiving the video stream from the sensor
>>> +
>>> +          port@1:
>>> +            $ref: /schemas/graph.yaml#/properties/port
>>> +            description:
>>> +              Port sending the video stream to the VI
>>> +
>>> +        required:
>>> +          - port@0
>>> +          - port@1
>>> +
>>> +    additionalProperties: false
>>> +
>>> +    required:
>>> +      - reg
>>> +      - ports
>>> +
>>> +unevaluatedProperties: false
>>> +
>>> +required:
>>> +  - compatible
>>> +  - "#address-cells"
>>> +  - "#size-cells"
>>> +  - channel@0
>>> +
>>> +# see nvidia,tegra20-vi.yaml for an example  
>>
>> That file does not have this compatible. At least not on next-20221109.
> 
> It's added in patch 2. It's a chicken-egg problem, should I add a third
> patch that adds this line only?
> 
> ACK for all other comments you wrote.

It's ok.

Best regards,
Krzysztof

