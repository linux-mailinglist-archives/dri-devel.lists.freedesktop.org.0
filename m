Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 136AD64822B
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 13:10:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE3B10E526;
	Fri,  9 Dec 2022 12:10:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2ECC10E528
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Dec 2022 12:10:03 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id l8so4690067ljh.13
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Dec 2022 04:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k5WIxqfQSR2lRs3gflGKk0qWcnHYNZM4RqnFvL4b+RI=;
 b=yQvKJD5zwK/C+a0zsslV/TPt+2SRvd5/dusYz0vi7h3XvaZ+LsZg2kgfQ02cyU94Vk
 QvB8XEsjBW/jcOcCE8jkZybwOy9BIc3ByeA14rw6eXMzOR8dEmxpsODxF6c9JVtgesaP
 GDmJD+MliNiP+VQj8X61GIlcoDghBYSEwwzlUvUoVAV09R0SG/DVfV1jXiSBfJ0+z7wo
 snMp+cvHs5en2DhjRk8//Zem0lF5zM6K4KtOiUA6CaSVgO/wsY1quYVjrwJb7gyRcUCO
 11f40NyK92RbGI9fxJ0AP0KwnZJQfRxwfBXX7LNUsO8bIeRlP5U3wvP4Zm7/fpy62V1S
 zqHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k5WIxqfQSR2lRs3gflGKk0qWcnHYNZM4RqnFvL4b+RI=;
 b=q5hyK/L3NJdDFbK3wdb45Hibs+fu7siu4CQF0qKzUbcsDocGgYOM9fQ73AoZDzSMWT
 cZYxvYQAWuczu5gmuy53Tc+ixwp/ZUwhGsQdXNj1mxCm2aKgLyFUzq3ll7I4lBT59UZo
 UYGFyk5xeQctXdiO1YhLat2QIxUx14vgA8++NECvwCxPU5jyOIxsNcT26eVp/WUklq+s
 gVPq6vCEwHURHFgmKIdwYlGTBuberCYVlXQzFbIjz9R5b4gOkg8tovlxvN3Ucbwe4Vhd
 amYNVIvzg2RGiiOWoOBGdDu1RVRpSwSoM2Hi7xlk99L3Zt9Avi13n0r1SEgiITCBUI6o
 57nA==
X-Gm-Message-State: ANoB5pnIGL4uSA4DPzHJY9jjj0h8OrIsHfQhP1R3igWuq6U6npEndgM4
 OS/Zjv4AZXtuSmCsD4qCh7nECw==
X-Google-Smtp-Source: AA0mqf5vwT9wjXwY5J1i2zHLwPj1hV8XpNpG3eiMGnRcl2+y8eO3VGKkApaT1zs8VfEY2hA7Ckf1kA==
X-Received: by 2002:a2e:a274:0:b0:279:86e6:8633 with SMTP id
 k20-20020a2ea274000000b0027986e68633mr1224629ljm.30.1670587802131; 
 Fri, 09 Dec 2022 04:10:02 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 u5-20020a05651c130500b00279a15e635asm194953lja.58.2022.12.09.04.10.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 04:10:01 -0800 (PST)
Message-ID: <91535d1b-300e-79a1-5f6b-8401cf1b7b2c@linaro.org>
Date: Fri, 9 Dec 2022 13:10:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 1/2] dt-bindings: drm/bridge: ti-sn65dsi83: Add enable
 delay property
Content-Language: en-US
To: Marek Vasut <marex@denx.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221209083339.3780776-1-alexander.stein@ew.tq-group.com>
 <7463917.EvYhyI6sBW@steina-w>
 <e1844fdc-c640-747d-e38f-400669f2a1a8@linaro.org>
 <3394586.QJadu78ljV@steina-w> <df7e4c0d-2e30-a808-584f-d302233c2931@denx.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <df7e4c0d-2e30-a808-584f-d302233c2931@denx.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/12/2022 13:02, Marek Vasut wrote:
> On 12/9/22 10:36, Alexander Stein wrote:
>> Hello Krzysztof,
> 
> Hi,
> 
>> Am Freitag, 9. Dezember 2022, 10:07:45 CET schrieb Krzysztof Kozlowski:
>>> On 09/12/2022 09:54, Alexander Stein wrote:
>>>> Hello Krzysztof,
>>>>
>>>> thanks for the fast feedback.
>>>>
>>>> Am Freitag, 9. Dezember 2022, 09:39:49 CET schrieb Krzysztof Kozlowski:
>>>>> On 09/12/2022 09:33, Alexander Stein wrote:
>>>>>> It takes some time until the enable GPIO has settled when turning on.
>>>>>> This delay is platform specific and may be caused by e.g. voltage
>>>>>> shifts, capacitors etc.
>>>>>>
>>>>>> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>>>>>> ---
>>>>>>
>>>>>>   .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml      | 4 ++++
>>>>>>   1 file changed, 4 insertions(+)
>>>>>>
>>>>>> diff --git
>>>>>> a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
>>>>>> b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
>>>>>> index 48a97bb3e2e0d..3f50d497cf8ac 100644
>>>>>> --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
>>>>>>
>>>>>> @@ -32,6 +32,10 @@ properties:
>>>>>>       maxItems: 1
>>>>>>       description: GPIO specifier for bridge_en pin (active high).
>>>>>>
>>>>>> +  ti,enable-delay-us:
>>>>>> +    default: 10000
>>>>>> +    description: Enable time delay for enable-gpios
>>>>>
>>>>> Aren't you now mixing two separate delays? One for entire block on (I
>>>>> would assume mostly fixed delay) and one depending on regulators
>>>>> (regulator-ramp-delay, regulator-enable-ramp-delay). Maybe you miss the
>>>>> second delays in your power supply? If so, the first one might be fixed
>>>>> and hard-coded in the driver?
>>>>
>>>> Apparently there are two different delays: reset time (t_reset) of 10ms as
>>>> specified by datasheet. This is already ensured by a following delay after
>>>> requesting enable_gpio as low and switching the GPIO to low in disable
>>>> path.
>>>>
>>>> When enabling this GPIO it takes some time until it is valid on the chip,
>>>> this is what this series is about. It's highly platform specific.
>>>>
>>>> Unfortunately this is completely unrelated to the vcc-supply regulator.
>>>> This one has to be enabled before the enable GPIO can be enabled. So
>>>> there is no regulator-ramp-delay.
>>>
>>> Your driver does one after another - regulator followed immediately by
>>> gpio - so this as well can be a delay from regulator (maybe not ramp but
>>> enable delay).
> 
> The chip has two separate input pins:
> 
> VCC -- power supply that's regulator
> EN -- reset line, that's GPIO
> 
> Alexander is talking about EN line here.

I know, but mainline boards seems to be missing power supply, so that
raises questions.

Whether voltage on some input pin reaches specified level is hardly a
problem of only this bridge. OTOH, datasheet describes another delay
which is specific to the chip and which is fixed - t_en/ten/Ten.


Best regards,
Krzysztof

