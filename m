Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDC2648069
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 10:51:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E59EE10E510;
	Fri,  9 Dec 2022 09:51:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD5C10E50F
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Dec 2022 09:51:10 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id a7so4366061ljq.12
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Dec 2022 01:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WmNxA0xMKY6NE0mrIyzBIF0KSGbClhaHO3jVAK7ow4A=;
 b=zsKHFut1fusmlRzaqC6gMptvhABkJGSOQq5hIJ1I/r4cVG37+7a4t2IrovMr/jKJ5D
 zr/ZJQAnUraIV3Qp1/b4YieH7bfXONmIwxOzIAOSjCU9jsNWYps8VvuFTfriN3fL6sLI
 YyhohW0mbWOODBqXOGtUpJzzpNXx3Eij6AnMtNtGObdJaoVQ67Ye5cy1/j8rcE89nVnN
 vneQn0ZqN46biXdgVYBFnAV4XMh45q7z76Zcp3yvHwaMlelg+Pyb1DsSGLHD+2pn7maS
 SI/mNY6F3yHZJjgUd5V/MevrhrfqgdDMr7ogRGskvdICHCT/7vx//tKKeH49XNfzHTL0
 42MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WmNxA0xMKY6NE0mrIyzBIF0KSGbClhaHO3jVAK7ow4A=;
 b=uiXxAFMkJ51FFAYssNiyiuSRYgLSuVjL5YSpI5EiIZlMzfnxuPAzRn8MIG2NfR/pWw
 B7iFucprlrYW53tqBqQunKPuCsm50Ubi4codFbbnZrCpYRH0/ytQbdbdV/Hk0aGUjuyg
 9ZNdQngB3XarBpmwQ7SodA5fFjo54JpqmxwMF9ZQRZKMTTLBTwGoBrlRQjBKV/blUXpS
 bPrfqtwd+PB/deF579uUqC9kRP2o7ivdCIlN87ULW1iGURLb7d9G1e/HGWlJeo9AcviX
 Gkcbo1vwwegjrmZIetyj+nY5Lf6eLIcAXIuhdOi++lJJDqWdgn99wVfmIwSLy1rIDun7
 9CiQ==
X-Gm-Message-State: ANoB5pke2uxpihgECdfHdZ72AxiebZ8bM9c1xw06QFFmPiReFWYVDNKe
 C1okVGOFYAaBp9atJ4xkbe7HZw==
X-Google-Smtp-Source: AA0mqf6Re9jhCKkdjDDp6XJh14UAiK81Ds3CPU63T7hDPmrfSeN+RaMCPt/WdrVE5gYX7Y2+b1Ai1w==
X-Received: by 2002:a2e:9bd2:0:b0:27a:2eff:f5f4 with SMTP id
 w18-20020a2e9bd2000000b0027a2efff5f4mr1022053ljj.8.1670579468673; 
 Fri, 09 Dec 2022 01:51:08 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 u5-20020a05651c130500b00279a15e635asm153428lja.58.2022.12.09.01.51.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 01:51:08 -0800 (PST)
Message-ID: <f95197a3-4849-bf4b-521e-f073a54db280@linaro.org>
Date: Fri, 9 Dec 2022 10:51:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 1/2] dt-bindings: drm/bridge: ti-sn65dsi83: Add enable
 delay property
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221209083339.3780776-1-alexander.stein@ew.tq-group.com>
 <7463917.EvYhyI6sBW@steina-w>
 <e1844fdc-c640-747d-e38f-400669f2a1a8@linaro.org>
 <3394586.QJadu78ljV@steina-w>
 <80cb69b4-811d-1cd9-297d-2d828fc988f4@linaro.org>
In-Reply-To: <80cb69b4-811d-1cd9-297d-2d828fc988f4@linaro.org>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/12/2022 10:50, Krzysztof Kozlowski wrote:
> On 09/12/2022 10:36, Alexander Stein wrote:
>> Hello Krzysztof,
>>
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
>>>>>>  .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml      | 4 ++++
>>>>>>  1 file changed, 4 insertions(+)
>>>>>>
>>>>>> diff --git
>>>>>> a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
>>>>>> b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
>>>>>> index 48a97bb3e2e0d..3f50d497cf8ac 100644
>>>>>> --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
>>>>>>
>>>>>> @@ -32,6 +32,10 @@ properties:
>>>>>>      maxItems: 1
>>>>>>      description: GPIO specifier for bridge_en pin (active high).
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
>>
>> But this will introduce a section which must not be interrupted or delayed. 
>> This is impossible as the enable gpio is attached to an i2c expander in my 
>> case.
>>
>> Given the following time chart:
>>
>>  vcc                  set             EN
>> enable               GPIO             PAD
>>   |                    |               |
>>   |                    |<-- t_raise -->|
>>   | <-- t_vcc_gpio --> |               |
>>   | <--        t_enable_delay      --> |
>>
>> t_raise is the time from changing the GPIO output at the expander until 
>> voltage on the EN (input) pad from the bridge has reached high voltage level.
>> This is an electrical characteristic I can not change and have to take into 
>> account.
>> t_vcc_gpio is the time from enabling supply voltage to enabling the bridge 
>> (removing from reset). Minimum t_vcc_gpio is something which can be addressed 
>> by the regulator and is no problem so far. But there is no upper bound to it.
>>
>> If I understand you correctly, you want to specify t_enable_delay in a 
>> regulator property. This only works if you can upper bound t_vcc_gpio which is 
>> not possible due to e.g. scheduling and i2c bus contention.
>>
>> IMHO that's why there needs to be an configurable delay in the bridge driver.
> 
> What I am saying that you might be here mixing two separate delays:
> regulator enable and/or ramp delay (which more or less matches your
> t_vcc_gpio) and t_raise. I don't know about which board we talk, but the
> mainline users of this bridge do not have even regulator supply,
> therefore its enable time might be not factored.
> 
> Why this all raising questions? Because only your t_vcc_gpio should be
> board dependent, right? Your bridge has fixed internal delays - from
> datasheet: ten, tdis and treset. Nothing in your device is board
> specific, thus I assume any enable delay is coming from power supply.
> 
> Probably experiment to prove it would be to keep power supply enabled
> always and check on the scope of EN pin.
> 
> Anyway, even if this is variable delay on your EN input pin, it is still
> input to the device and based on your time-diagram it is not a property
> of the device. Property of the device could be:
> 
> EN-pad goes high <--------------> output pins stable
> 
> which is either:
> 1. ten already described in datasheet,
> 2. not the case here.


Ah, I forgot, otherwise this is a generic property of every system not
specific to your bridge. Thus it should be modeled somewhere else or in
in generic way.

Best regards,
Krzysztof

