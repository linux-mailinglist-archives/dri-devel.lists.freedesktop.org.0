Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 284C478C9C4
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 18:39:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EA6510E44A;
	Tue, 29 Aug 2023 16:39:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0318910E44A
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 16:39:07 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-99bdeae1d0aso596020466b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 09:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693327146; x=1693931946;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mT6oXCgbaIv6xrqOFaIzIhxDtL6iZZ50u0IzIYTJFvk=;
 b=UbpJ7e7KL9EA1LdgNzK++gknXGMcs5LEHN2Tg0CeDsF+V9PItbRrgw/2Ku4q8TwrAp
 /RQ1y2sSi1awYmyzllT307gT/U58cJraYSsxN95ED0sro3l7z88tmalAh+KdYXAjWsP8
 /xjnDZBG9isx7G5Le0dfa7+U6ZfZT02AXuqG/bfoLSM/GgmIlaYPjxQWsWdX+Y/Zyft7
 tVhVwMBuU1nMKzoUbdrj76MOohFRzOQusMnMlUPlkquLmeGFjDnyxQApNkg67s57PDYm
 HmbuAeEBTugqvKOdz+7hNePKJMaG9evwGwAJOn7GuGmIjPpUBce61xVuTYAo+TMy+KIp
 DBOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693327146; x=1693931946;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mT6oXCgbaIv6xrqOFaIzIhxDtL6iZZ50u0IzIYTJFvk=;
 b=Sp6yGpe2VHqjQTciPatvChcEyPBXNmQNaUvekNHVlF6wmAR4cjTVi5K+F6q5TgrGyP
 MektuqtleZPf1QMHzT05VKBHdlFKOUb/dfkrEQSJq00f2rAw4ivKQstleiSxghlbcqVG
 urxyt9M/ExvNvkoakHPO2uKaaY13zC2nL4okSHbDfR5ZD3o54c/objpM4+6hMvQRDYjP
 L81oZyUQ4eyKY25WRo6azxz8zVf7+KfV/CnHZF0D9A8gcuvRcKdcl91qD4GALpYhXphd
 ik7kTL6S0GdjpZPPIhwnyM0eZcqXave8MoXnq32s2JgeoD31K0Z/j+wxb6LMl3EGUqx9
 +yFw==
X-Gm-Message-State: AOJu0YyPo6fGDwFJGM7kupx4poxrjHcBMS4smhkktVilBJriatg8aXs1
 HLemK6nmFGtOuGO+p8vq/NmJLsFrAa3RRt7FCtw=
X-Google-Smtp-Source: AGHT+IESQ+U8zTLIIt37ys6oP/s6v/+8nspiHQlBTB0sN17RPl6ikUPDnr2RZG5aF5IG0fNLxxKcTw==
X-Received: by 2002:a17:906:8a55:b0:9a2:1853:a0be with SMTP id
 gx21-20020a1709068a5500b009a21853a0bemr10616171ejc.72.1693327146367; 
 Tue, 29 Aug 2023 09:39:06 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.196])
 by smtp.gmail.com with ESMTPSA id
 jj26-20020a170907985a00b00988e953a586sm6147826ejc.61.2023.08.29.09.39.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Aug 2023 09:39:05 -0700 (PDT)
Message-ID: <4982cfd7-4930-f205-09e8-fc5028183dba@linaro.org>
Date: Tue, 29 Aug 2023 18:39:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v1 1/2] dt-bindings: backlight: Add MPS MP3309C
Content-Language: en-US
To: Flavio Suligoi <f.suligoi@asem.it>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20230829101546.483189-1-f.suligoi@asem.it>
 <6dfae492-5533-df97-5c72-373d5e89444f@linaro.org>
 <DU2PR01MB8034C85013ECF222D12BAAA4F9E7A@DU2PR01MB8034.eurprd01.prod.exchangelabs.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <DU2PR01MB8034C85013ECF222D12BAAA4F9E7A@DU2PR01MB8034.eurprd01.prod.exchangelabs.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/08/2023 16:18, Flavio Suligoi wrote:
> Hi Krzysztof,
> 
> Thanks for your quick replay and corrections!
> Just some questions about some of your remarks:
> 
>>> @@ -0,0 +1,202 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) %YAML 1.2
>>> +---
>>
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  mps,dimming-mode:
>>> +    description: The dimming mode (PWM or analog by I2C commands).
>>> +    $ref: '/schemas/types.yaml#/definitions/string'
>>
>> Drop quotes, you should see warnings for this.
>>
>> It does not look like you tested the bindings, at least after quick look. Please
>> run `make dt_binding_check` (see
>> Documentation/devicetree/bindings/writing-schema.rst for instructions).
>> Maybe you need to update your dtschema and yamllint.
>>
>>> +    enum:
>>> +      - pwm
>>> +      - analog-i2c
>>
>> Why do you think this is a property of a board? Is PWM signal optional?
>> If so, its presence would define it. Otherwise it seems you want to control the
>> driver.
>>
> 
> The MP3309C device always need a I2C bus to rd/wr its internal registers.
> But the brightness can be controlled in one of the following ways (mutually exclusive,
> but mandatory):
> - a PWM input signal
>     or
> - a I2C command
> So, the driver needs a property to select the dimming mode used; this property is mandatory.

No, it's not a proof. Don't mix properties and hardware signals.

> This is the reason of the existence of the ' mps,dimming-mode' property.
> PWM signal is not optional, it is required if and only if the 'pwm' dimming mode is used.

So the pwms determine the mode. That's it, no need for this property.


> If the 'analog-i2c' dimming mode is used, instead, the PWM signal must not be used.
> So the property 'mps,dimming-mode' controls how the MP3309C is used.
> I can add more details about this in the description section.

No, drop the property or explain more, e.g. is I2C mode of control used
while having PWMs signals connected?

> ...
>  
>>> +
>>> +  mps,overvoltage-protection-13v:
>>> +    description: overvoltage protection set to 13.5V.
>>> +    type: boolean
>>> +  mps,overvoltage-protection-24v:
>>> +    description: overvoltage protection set to 24V.
>>> +    type: boolean
>>> +  mps,overvoltage-protection-35v:
>>> +    description: overvoltage protection set to 35.5V.
>>> +    type: boolean
>>
>> Nope for these three. Use -microvolt suffix for one property.
> 
> Ok
> 
>>
>>> +
>>> +  mps,reset-gpios:
>>> +    description: optional GPIO to reset an external device (LCD panel, FPGA,
>>> +      etc.) when the backlight is switched on.
>>> +    maxItems: 1
>>
>> No, you should not add here GPIOs for other devices.
> 
> Do you mean that I have to remove this property or that I have to move it somewhere else?
> I added this feature because sometimes, in embedded boards, you need a pulse signal to

How you described it, this is not the property of this device.

> use after the backlight probing, for example to reset another device in sync with the backlight
> probe.

There is no term as "probe" in hardware, so you describe drivers.

> Do you think I have to remove this feature from the driver?

You cannot request GPIO after removing it from the bindings, obviously,
but whether your backlight should reset something else? Don't care,
don't know. I talk about bindings.

> 
> ...
> 
>>> +allOf:
>>> +  - $ref: common.yaml#
>>> +  - if:
>>> +      properties:
>>> +        mps,dimming-mode:
>>> +          contains:
>>> +            enum:
>>> +              - pwm
>>> +    then:
>>> +      required:
>>> +        - pwms
>>
>> So this proves the point - mps,dimming-mode looks redundant and not
>> hardware related.
> 
> See my previous comment.

No, it still proves the point till you explain why pwms cannot be used
to determine this. Read my messages.

Best regards,
Krzysztof

