Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A4453BA4C
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 15:59:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F0241129B1;
	Thu,  2 Jun 2022 13:59:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4DBB1129B1
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 13:58:58 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id fd25so6389817edb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 06:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=xl2jygig3bKkpYx+EUxe9wQPOU+AZ5rTVngrpx7kwik=;
 b=lLmTJ7W9nApDvWIuXiY6fGueNSV2LzEDh3RCpbYjCWfTdsUd6nWirkpfR71joEzeTv
 0M+GXEEkJHlpG8gfW91r0dpt3mUZsHcyOUDXdlnV6/FtwvQzh2duPQw7eXEVNzHKyiRL
 LqcMqrM9hpLhqjRnBbmj+Rw8M0t+wI5BZsKnPiZXZJdUam91mxbsYcelwR34UGsEl8Tk
 A+NB62zpq0MZ9xxH7RelvEv4RdD//U+Jef4jDNgVZqV7587tkWpQ9XXgzVhBKJDt6zrz
 knsrGqvAPWaqzYNGw3zP/hUI7L3h/++wvZv0PwigslLwekBejJhnRxWw2nJS4M5Tcv9Q
 l8iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xl2jygig3bKkpYx+EUxe9wQPOU+AZ5rTVngrpx7kwik=;
 b=1l3ujq8rSB0/ppvLtaez/Kyy5Jm8YkdUfuoSw2Bm6DrJDdGQ0k+/v0aJsagrG+hGnN
 wDnW7CudbY9dxDmSkzAGGxNM4rT1eubeI8Wo5M/pL5oAqRTvKFmfZru8mtO/kukcnhdP
 CHcNdWPaiD732nL9VDDJ2J4JwRkTFbVcMw6gzyGwvxu6OKgWvQ2v8wMHZUrAhUOVB4PT
 8GQVf3RuHLO1tZXVgMQFdRGpAVcTF3UiZK88ixHO0KTz1DF92v6bC9QHd5v6YRfwhUJE
 zoSQ4subPCDTOHk2OX0e0Vtz8q09xxm7gMlIGhpz3DgU+PqwLh/8PA9VyBvZCLlssmxp
 dmww==
X-Gm-Message-State: AOAM531+h6KSi/hil+BQ3H+lzVKDqTnlLNmDc+scdO+UmXfGwrfnf2WV
 DWrle6vNmrcH2zoVDVTJhrT0gg==
X-Google-Smtp-Source: ABdhPJzMhbKs1YwQWj4X8ECBojb/7UwLUEdrJ1vXgsV+O02awxeW+R0U7efax0xzp1uyPBM6BAySlQ==
X-Received: by 2002:a05:6402:a41:b0:42b:e6ed:4170 with SMTP id
 bt1-20020a0564020a4100b0042be6ed4170mr5777371edb.344.1654178337203; 
 Thu, 02 Jun 2022 06:58:57 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 f1-20020a056402160100b0042de839eb2csm2463093edv.27.2022.06.02.06.58.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jun 2022 06:58:56 -0700 (PDT)
Message-ID: <e3aa9c7e-bf2d-dd55-8b3f-ca51f569771d@linaro.org>
Date: Thu, 2 Jun 2022 15:58:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] dt-bindings: backlight: rt4831: Add the new property
 for ocp level selection
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <1653534995-30794-1-git-send-email-u0084500@gmail.com>
 <1653534995-30794-2-git-send-email-u0084500@gmail.com>
 <1c7ab94c-a736-c629-bd8c-8a974803e2b9@linaro.org>
 <CADiBU39jZ6TdYZoH80m4R-X2_fUXZOvDA4yUd_TQdPzBJLE+JA@mail.gmail.com>
 <076d53d3-6062-686f-8e45-14c5f936bbf6@linaro.org>
 <20220602135604.GA2194286-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220602135604.GA2194286-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 ChiYuan Huang <u0084500@gmail.com>, jingoohan1@gmail.com, deller@gmx.de,
 lucas_tsai@richtek.com, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, lkml <linux-kernel@vger.kernel.org>,
 cy_huang <cy_huang@richtek.com>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee.jones@linaro.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/06/2022 15:56, Rob Herring wrote:
> On Thu, May 26, 2022 at 12:32:12PM +0200, Krzysztof Kozlowski wrote:
>> On 26/05/2022 10:13, ChiYuan Huang wrote:
>>> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> 於 2022年5月26日 週四 下午4:06寫道：
>>>>
>>>> On 26/05/2022 05:16, cy_huang wrote:
>>>>> From: ChiYuan Huang <cy_huang@richtek.com>
>>>>>
>>>>> Add the new property for ocp level selection.
>>>>>
>>>>> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
>>>>> ---
>>>>>  .../bindings/leds/backlight/richtek,rt4831-backlight.yaml         | 8 ++++++++
>>>>>  include/dt-bindings/leds/rt4831-backlight.h                       | 5 +++++
>>>>>  2 files changed, 13 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml
>>>>> index e0ac686..c1c59de 100644
>>>>> --- a/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml
>>>>> +++ b/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml
>>>>> @@ -47,6 +47,14 @@ properties:
>>>>>      minimum: 0
>>>>>      maximum: 3
>>>>>
>>>>> +  richtek,bled-ocp-sel:
>>>>
>>>> Skip "sel" as it is a shortcut of selection. Name instead:
>>>> "richtek,backlight-ocp"
>>>>
>>> OK, if so, do I need to rename all properties from 'bled' to 'backlight' ?
>>> If  only this property is naming as 'backlight'. it may conflict with
>>> the others like as "richtek,bled-ovp-sel".
>>
>> Ah, no, no need.
>>
>>>>
>>>>> +    description: |
>>>>> +      Backlight OCP level selection, currently support 0.9A/1.2A/1.5A/1.8A
>>>>
>>>> Could you explain here what is OCP (unfold the acronym)?
>>> Yes. And the full name is 'over current protection'.
>>
>> Thanks and this leads to second thing - you encode register value
>> instead of logical value. This must be a logical value in mA, so
>> "richtek,bled-ocp-microamp".
> 
> We already have common properties for setting current of LEDs. We should 
> use that here I think.

It might not be exactly the same. We have "led-max-microamp" which is
the maximum allowed current. I guess over-current protection level  is
slightly higher (e.g. led-max-microamp + 1). IOW, led-max-microamp is
something which still can be set and used by system/hardware. OCP should
not.


Best regards,
Krzysztof
