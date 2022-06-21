Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DA0553193
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 14:03:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96BE810EA9F;
	Tue, 21 Jun 2022 12:03:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36B0610EA9F
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 12:03:43 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id eo8so19107907edb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 05:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=20hOXgHS4fSMKzf2+VEVhuMt/xTY7rwW+BkuR688jQI=;
 b=G0fDoM6iYkilX2J2us0oDAnu2OXLTFoGwQGcIQ61gW+KroUP3F34RD4BJ1IlsFeOKi
 8f8+8bvCxI+BjoQhqGDC8Bmih/uM2UMNh0HfP5LHcTP5thFbXw57Wl/JjRk3EIaphPgC
 /r9iH8r0MZLQ/ZiseG3jh/J+adm1eZ8inUGHNLerNsDK1bRyGyI9t7y5tTAvDDVdeB1B
 xwLgffZMmNEJhBSsXCtiJaQ53o6MWqYnFwBx1ozBtod/JlyyMz+pR8DZEdtPNbe/8IO5
 pZskEbg504lpOOtekPsnMcsUaoBfJ2WNfNfE5rDxevNShYsJWXp++OGVY0izxGKuJIRl
 k4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=20hOXgHS4fSMKzf2+VEVhuMt/xTY7rwW+BkuR688jQI=;
 b=lR3cM9+LPAnWWvdDVDN8ade8NfTQ+LkX1IK6+sM8KbfQx681StAjjdIBmTqaRrwj//
 3PjoogMGKmEM5MSNhSxKLjL7ilIBHl/r6RucOrIG3V/ucJPrrEYVNpi+2shsO6JLvfMJ
 AXl3MsqwwlQ18E5LaBsbrmn2tvn50Q7SuMl8jnT23xJLWQT3mWlO9aGp4AQsDb0HBjVq
 AtdWv/PDVRaM78SJ/87LEoUPrkAvhryYD2gpYnquuXCN3i4VzwwzG+Qx9qCsmIZzvx2K
 usVKSLksbXvcWjEz2U3VAMGkAuhKejlqCsCoFb3NIjROy+kAirmWeGrYzpALY5v8H8pd
 JP8w==
X-Gm-Message-State: AJIora8GnsAxWVEQuOles6AyABTbgUveyXtp1wApF5oImx2SWcz3uQqi
 mrzPM1OHkT9ZU9qKFWCCdeU6GQ==
X-Google-Smtp-Source: AGRyM1vuqpi73lfGfP1AhQV/V6GZDUbkiFuWxRqJMB+M0pVkbVaH3yMP1muhb8X6319Kpo4FNFG3DQ==
X-Received: by 2002:a05:6402:3689:b0:435:95b0:edf2 with SMTP id
 ej9-20020a056402368900b0043595b0edf2mr3480378edb.279.1655813021696; 
 Tue, 21 Jun 2022 05:03:41 -0700 (PDT)
Received: from [192.168.0.220] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 n12-20020a170906840c00b00706c50870a0sm7470520ejx.194.2022.06.21.05.03.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jun 2022 05:03:41 -0700 (PDT)
Message-ID: <3e02909d-131a-7899-f02b-fa0afcbef1d9@linaro.org>
Date: Tue, 21 Jun 2022 14:03:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 03/15] dt-bindings: leds: mt6370: Add Mediatek mt6370
 current sink type LED indicator
Content-Language: en-US
To: szuni chen <szunichen@gmail.com>
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
 <20220613111146.25221-4-peterwu.pub@gmail.com>
 <91e9e3af-8208-7535-1864-08744f934593@linaro.org>
 <CA+hk2fZbh0=8gurGS95XpXrYyF3NbwFbFMcygcrW_q10m0zinA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CA+hk2fZbh0=8gurGS95XpXrYyF3NbwFbFMcygcrW_q10m0zinA@mail.gmail.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linux PM <linux-pm@vger.kernel.org>, linux-iio <linux-iio@vger.kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, USB <linux-usb@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 ChiYuan Huang <cy_huang@richtek.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Pavel Machek <pavel@ucw.cz>, Matthias Brugger <matthias.bgg@gmail.com>,
 ChiaEn Wu <peterwu.pub@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/06/2022 05:07, szuni chen wrote:
> Dear Krzysztof,
> 
> Thank you for the valuable command.
> 
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> 於 2022年6月17日 週五 清晨5:09寫道：
>>
>> On 13/06/2022 04:11, ChiaEn Wu wrote:
>>> From: ChiYuan Huang <cy_huang@richtek.com>
>>>
>>> Add Mediatek mt6370 current sink type LED indicator binding documentation.
>>>
>>> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
>>> ---
>>>  .../leds/mediatek,mt6370-indicator.yaml       | 48 +++++++++++++++++++
>>>  1 file changed, 48 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
>>> new file mode 100644
>>> index 000000000000..42b96c8047a3
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
>>> @@ -0,0 +1,48 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/leds/mediatek,mt6370-indicator.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: LED driver for MT6370 PMIC from MediaTek Integrated.
>>> +
>>> +maintainers:
>>> +  - Alice Chen <alice_chen@richtek.com>
>>> +
>>> +description: |
>>> +  This module is part of the MT6370 MFD device.
>>> +  Add MT6370 LED driver include 4-channel RGB LED support Register/PWM/Breath Mode
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: mediatek,mt6370-indicator
>>> +
>>> +  "#address-cells":
>>> +    const: 1
>>> +
>>> +  "#size-cells":
>>> +    const: 0
>>> +
>>> +patternProperties:
>>> +  "^(multi-)?led@[0-3]$":
>>
>> If this is multi-led, then you should reference
>> /schemas/leds/leds-pwm-multicolor.yaml
>>
>> See other examples using it.
> 
> In my opinion, leds-pwm-multicolor.yaml is used for external pwm
> signals, and needs to assign an external pwm property.
> But our pwm leds use an internal clock to generate the pwm signal. Is
> leds-class-multicolor.yaml more appropriate?

Yeah, I meant the latter but pasted wrong file.
/schemas/leds/leds-class-multicolor.yaml#

Best regards,
Krzysztof
