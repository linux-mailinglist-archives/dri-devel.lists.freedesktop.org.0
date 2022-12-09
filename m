Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFE3648066
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 10:50:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 701ED10E50E;
	Fri,  9 Dec 2022 09:50:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A3E10E50E
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Dec 2022 09:50:15 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id b13so6215649lfo.3
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Dec 2022 01:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H+zrIqQHK0ez9ejwOlTNTa3xiba6ecsI0/WooCsBj0M=;
 b=MaA9T2A/3btdlwfzS0ARMaKjwas0cZ5evhLuh3Z0xyoDP9m13xs2SSvEivZmegh5n4
 l8C5D+aSmXfP3U1zF99g0lFBXqaEQZnmgfaRjZmQaROj9dtfRdypDR/+KfzM+z+Bzy+e
 R2oNlqoDHig1mb2AyozFPeiEV4bIxejTmKAgGD4BfzsELkvLxCoM5p86CFGqFb4cUjU0
 a9Khta1K3Vzo68rMjeAV6nxis0frMt3WMvv6wrJqs6ULh8J9FLyeDiEbRp9Ri5VUTkbd
 jKaioJa9UPFNuN08bRFPzH7twNvjebXXPggbXg+Uz/JesWQvnEUnpud5omJn0eEhQOCY
 AMTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H+zrIqQHK0ez9ejwOlTNTa3xiba6ecsI0/WooCsBj0M=;
 b=VGHGFvv86CDY+0UYx2rb8C2WoB1/WOLmCfvpuwufpE7GyrvULEcZ9ZvXQGAIH50rUG
 AnBL/Nk+AWHnSsm/cNu6yKVKvfxYZnJP7QiICwstLU5vV5azfPrjfwBHvUKCutCHvB34
 A7KF6E/f246vtZwRQGzlic5i/GgiVavKn20b43vcNVfA6bFsl9sJ40nF3NJVDQXWY4nJ
 pUUH7kGWFUMz510Dsc7WfBkweLY5vfwjKbnPyAskrXoB30BA3UaFHfTh+U6+1bBcq8No
 BCbFHTjudSCVdwswoLwBqwxM4nQJoQHk5Ptj6CrtqoxGZ/Dg0oHzwiIptMLpw4qRF6ay
 zg8w==
X-Gm-Message-State: ANoB5pkZxdy5IkBVmEYdG4BTTIUPWztooju+Z/Yr+NFaCoecGuyMBMqT
 RU3icL/06GMAJMsrCu5aL3kkMQ==
X-Google-Smtp-Source: AA0mqf6vN9HJtD/Aj4xr4S4ZDi4oKJS23YvlhM7RJM4JILeang3WJWpiuhO0Cd0wD4AZXkOMvn7ZmA==
X-Received: by 2002:a05:6512:b8e:b0:4b5:a5c7:3286 with SMTP id
 b14-20020a0565120b8e00b004b5a5c73286mr1788809lfv.9.1670579413456; 
 Fri, 09 Dec 2022 01:50:13 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 s29-20020ac25c5d000000b004b55f60c65asm187012lfp.284.2022.12.09.01.50.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 01:50:13 -0800 (PST)
Message-ID: <80cb69b4-811d-1cd9-297d-2d828fc988f4@linaro.org>
Date: Fri, 9 Dec 2022 10:50:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 1/2] dt-bindings: drm/bridge: ti-sn65dsi83: Add enable
 delay property
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221209083339.3780776-1-alexander.stein@ew.tq-group.com>
 <7463917.EvYhyI6sBW@steina-w>
 <e1844fdc-c640-747d-e38f-400669f2a1a8@linaro.org>
 <3394586.QJadu78ljV@steina-w>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <3394586.QJadu78ljV@steina-w>
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

On 09/12/2022 10:36, Alexander Stein wrote:
> Hello Krzysztof,
> 
> Am Freitag, 9. Dezember 2022, 10:07:45 CET schrieb Krzysztof Kozlowski:
>> On 09/12/2022 09:54, Alexander Stein wrote:
>>> Hello Krzysztof,
>>>
>>> thanks for the fast feedback.
>>>
>>> Am Freitag, 9. Dezember 2022, 09:39:49 CET schrieb Krzysztof Kozlowski:
>>>> On 09/12/2022 09:33, Alexander Stein wrote:
>>>>> It takes some time until the enable GPIO has settled when turning on.
>>>>> This delay is platform specific and may be caused by e.g. voltage
>>>>> shifts, capacitors etc.
>>>>>
>>>>> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>>>>> ---
>>>>>
>>>>>  .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml      | 4 ++++
>>>>>  1 file changed, 4 insertions(+)
>>>>>
>>>>> diff --git
>>>>> a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
>>>>> b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
>>>>> index 48a97bb3e2e0d..3f50d497cf8ac 100644
>>>>> --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
>>>>> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
>>>>>
>>>>> @@ -32,6 +32,10 @@ properties:
>>>>>      maxItems: 1
>>>>>      description: GPIO specifier for bridge_en pin (active high).
>>>>>
>>>>> +  ti,enable-delay-us:
>>>>> +    default: 10000
>>>>> +    description: Enable time delay for enable-gpios
>>>>
>>>> Aren't you now mixing two separate delays? One for entire block on (I
>>>> would assume mostly fixed delay) and one depending on regulators
>>>> (regulator-ramp-delay, regulator-enable-ramp-delay). Maybe you miss the
>>>> second delays in your power supply? If so, the first one might be fixed
>>>> and hard-coded in the driver?
>>>
>>> Apparently there are two different delays: reset time (t_reset) of 10ms as
>>> specified by datasheet. This is already ensured by a following delay after
>>> requesting enable_gpio as low and switching the GPIO to low in disable
>>> path.
>>>
>>> When enabling this GPIO it takes some time until it is valid on the chip,
>>> this is what this series is about. It's highly platform specific.
>>>
>>> Unfortunately this is completely unrelated to the vcc-supply regulator.
>>> This one has to be enabled before the enable GPIO can be enabled. So
>>> there is no regulator-ramp-delay.
>>
>> Your driver does one after another - regulator followed immediately by
>> gpio - so this as well can be a delay from regulator (maybe not ramp but
>> enable delay).
> 
> But this will introduce a section which must not be interrupted or delayed. 
> This is impossible as the enable gpio is attached to an i2c expander in my 
> case.
> 
> Given the following time chart:
> 
>  vcc                  set             EN
> enable               GPIO             PAD
>   |                    |               |
>   |                    |<-- t_raise -->|
>   | <-- t_vcc_gpio --> |               |
>   | <--        t_enable_delay      --> |
> 
> t_raise is the time from changing the GPIO output at the expander until 
> voltage on the EN (input) pad from the bridge has reached high voltage level.
> This is an electrical characteristic I can not change and have to take into 
> account.
> t_vcc_gpio is the time from enabling supply voltage to enabling the bridge 
> (removing from reset). Minimum t_vcc_gpio is something which can be addressed 
> by the regulator and is no problem so far. But there is no upper bound to it.
> 
> If I understand you correctly, you want to specify t_enable_delay in a 
> regulator property. This only works if you can upper bound t_vcc_gpio which is 
> not possible due to e.g. scheduling and i2c bus contention.
> 
> IMHO that's why there needs to be an configurable delay in the bridge driver.

What I am saying that you might be here mixing two separate delays:
regulator enable and/or ramp delay (which more or less matches your
t_vcc_gpio) and t_raise. I don't know about which board we talk, but the
mainline users of this bridge do not have even regulator supply,
therefore its enable time might be not factored.

Why this all raising questions? Because only your t_vcc_gpio should be
board dependent, right? Your bridge has fixed internal delays - from
datasheet: ten, tdis and treset. Nothing in your device is board
specific, thus I assume any enable delay is coming from power supply.

Probably experiment to prove it would be to keep power supply enabled
always and check on the scope of EN pin.

Anyway, even if this is variable delay on your EN input pin, it is still
input to the device and based on your time-diagram it is not a property
of the device. Property of the device could be:

EN-pad goes high <--------------> output pins stable

which is either:
1. ten already described in datasheet,
2. not the case here.

Best regards,
Krzysztof

