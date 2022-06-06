Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9D653E100
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 08:20:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 023DC10F750;
	Mon,  6 Jun 2022 06:20:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7040D10F750
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 06:20:25 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id q1so26935714ejz.9
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Jun 2022 23:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=F/BITtmLWc1VtxM65EqQjDPMCYQMAuoqz8dLA7WWjls=;
 b=S7fiGYjkD4hCmOxEBPhVlPYrksvpFVRkVWt7637cDHckBJf5TCtLnmB9UkOmZKTIKF
 ZLq2E6ClOr44GI0ySPWu8fcv61ODO7R7TZkolOKRsI5miFRej3Sk0Ez3u9iUUrvcJ5sD
 cAe8JXXs9pMWUQrp3HLptyxSBK/Dp/Kxb5sEbCn1ddt6aBXwzyPUPn7+QvK0OpZFNJ1S
 3g3yffxJw5Emt0ODfIJsXbgP0bmEDOP7Bw2xD88HDF2FIF6NYDreWrcOhAPuEekY79bd
 EbakCJ2/E0EsEoUb9/nLOZLwS+QfCORF4eCHplr5b7slcx0Fg9kERBNrirNO5aeJAadX
 ZL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=F/BITtmLWc1VtxM65EqQjDPMCYQMAuoqz8dLA7WWjls=;
 b=Fe1P2BmECFQaqdIGBK5/xqqhw5kjRlHu5ilAgHIeyCU4Uf+nkN8x5tZfO9ErbZrkbg
 9TY7hL4+xuv777zgiE+MzDp5dToZGS6Rgs/PROsXga3AlmYwXQKwlKEK2YZQaHaXAxqc
 v5cyCcPsRfPhyJrXy3xo0SHvrI41k1hpVuAvdcnYJNvhfwYYgJGxt4JbE569hKP2IbcE
 XUKncAXxBkrMqkl4sotFAlT+Q/08o2P4v9IT2lXpzeSkEpvQZ1mRq2sLBXsUiGYq+x/f
 a8AX6s2W7EqVGkl59NxcLJq1oykk0C0ONlLXgiFVhUgmcYg5ji2ozFrhwkNpJ2bSR6mW
 v4Xw==
X-Gm-Message-State: AOAM533SOuTGsFv43wRD/r8WgE+cdlF4wZhHfFvAVLY/E1km4g7yFTtL
 2/qtGxyWjuny8QFUp66wBJ6Ajg==
X-Google-Smtp-Source: ABdhPJzAfxWKgaolZMJ1kBvo3MGRFufwf7UUXNcLCeJtJs0PDGTLYJF6eHuRcJkYjoAgJxuWKltYiw==
X-Received: by 2002:a17:906:4fce:b0:6f4:f41c:3233 with SMTP id
 i14-20020a1709064fce00b006f4f41c3233mr19013888ejw.117.1654496423905; 
 Sun, 05 Jun 2022 23:20:23 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 n19-20020a05640205d300b0042de8155fa1sm8150758edx.0.2022.06.05.23.20.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Jun 2022 23:20:23 -0700 (PDT)
Message-ID: <5af6d6ff-c5e3-f764-fa9c-a2c3d7365082@linaro.org>
Date: Mon, 6 Jun 2022 08:20:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] dt-bindings: backlight: rt4831: Add the new property
 for ocp level selection
Content-Language: en-US
To: ChiYuan Huang <u0084500@gmail.com>
References: <1653534995-30794-1-git-send-email-u0084500@gmail.com>
 <1653534995-30794-2-git-send-email-u0084500@gmail.com>
 <1c7ab94c-a736-c629-bd8c-8a974803e2b9@linaro.org>
 <CADiBU39jZ6TdYZoH80m4R-X2_fUXZOvDA4yUd_TQdPzBJLE+JA@mail.gmail.com>
 <076d53d3-6062-686f-8e45-14c5f936bbf6@linaro.org>
 <20220602135604.GA2194286-robh@kernel.org>
 <e3aa9c7e-bf2d-dd55-8b3f-ca51f569771d@linaro.org>
 <CADiBU3-dN0vtQBEqvVLFCUp4-MkhLbQRkOiCet+fO8WfkEW4MQ@mail.gmail.com>
 <12096a2c-98c3-9e77-785f-808cc3e1a0e4@linaro.org>
 <CADiBU3_REqNRb4UtT5OrVBKuhYL0NPAALisHTM76SrFCHUYMuA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CADiBU3_REqNRb4UtT5OrVBKuhYL0NPAALisHTM76SrFCHUYMuA@mail.gmail.com>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 lucas_tsai@richtek.com, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 lkml <linux-kernel@vger.kernel.org>, cy_huang <cy_huang@richtek.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee.jones@linaro.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/06/2022 03:39, ChiYuan Huang wrote:
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> 於 2022年6月6日 週一 上午12:11寫道：
>>
>> On 02/06/2022 17:31, ChiYuan Huang wrote:
>>> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> 於 2022年6月2日 週四 下午9:58寫道：
>>>>
>>>> On 02/06/2022 15:56, Rob Herring wrote:
>>>>> On Thu, May 26, 2022 at 12:32:12PM +0200, Krzysztof Kozlowski wrote:
>>>>>> On 26/05/2022 10:13, ChiYuan Huang wrote:
>>>>>>> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> 於 2022年5月26日 週四 下午4:06寫道：
>>>>>>>>
>>>>>>>> On 26/05/2022 05:16, cy_huang wrote:
>>>>>>>>> From: ChiYuan Huang <cy_huang@richtek.com>
>>>>>>>>>
>>>>>>>>> Add the new property for ocp level selection.
>>>>>>>>>
>>>>>>>>> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
>>>>>>>>> ---
>>>>>>>>>  .../bindings/leds/backlight/richtek,rt4831-backlight.yaml         | 8 ++++++++
>>>>>>>>>  include/dt-bindings/leds/rt4831-backlight.h                       | 5 +++++
>>>>>>>>>  2 files changed, 13 insertions(+)
>>>>>>>>>
>>>>>>>>> diff --git a/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml
>>>>>>>>> index e0ac686..c1c59de 100644
>>>>>>>>> --- a/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml
>>>>>>>>> +++ b/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml
>>>>>>>>> @@ -47,6 +47,14 @@ properties:
>>>>>>>>>      minimum: 0
>>>>>>>>>      maximum: 3
>>>>>>>>>
>>>>>>>>> +  richtek,bled-ocp-sel:
>>>>>>>>
>>>>>>>> Skip "sel" as it is a shortcut of selection. Name instead:
>>>>>>>> "richtek,backlight-ocp"
>>>>>>>>
>>>>>>> OK, if so, do I need to rename all properties from 'bled' to 'backlight' ?
>>>>>>> If  only this property is naming as 'backlight'. it may conflict with
>>>>>>> the others like as "richtek,bled-ovp-sel".
>>>>>>
>>>>>> Ah, no, no need.
>>>>>>
>>>>>>>>
>>>>>>>>> +    description: |
>>>>>>>>> +      Backlight OCP level selection, currently support 0.9A/1.2A/1.5A/1.8A
>>>>>>>>
>>>>>>>> Could you explain here what is OCP (unfold the acronym)?
>>>>>>> Yes. And the full name is 'over current protection'.
>>>>>>
>>>>>> Thanks and this leads to second thing - you encode register value
>>>>>> instead of logical value. This must be a logical value in mA, so
>>>>>> "richtek,bled-ocp-microamp".
>>>>>
>>>>> We already have common properties for setting current of LEDs. We should
>>>>> use that here I think.
>>>>
>>>> It might not be exactly the same. We have "led-max-microamp" which is
>>>> the maximum allowed current. I guess over-current protection level  is
>>>> slightly higher (e.g. led-max-microamp + 1). IOW, led-max-microamp is
>>>> something which still can be set and used by system/hardware. OCP should
>>>> not.
>>>>
>>> Yap, you're right.
>>
>> So I am right or Rob?
>>
> As I know, both are incorrect.
>>> From the modern backlight IC design, it uses the boost converter architecture.
>>> This OCP level is to limit the inductor current when the internal MOS
>>> switch turn on.
>>> Details can refer to the below wiki link
>>> https://en.wikipedia.org/wiki/Boost_converter
>>>
>>> And based on it, OVP is used to limit the inductor output voltage.
>>> Each channel maximum current is based on the IC affordable limit.
>>> It is more like as what you said 'led-max-microamp'.
>>>
>>> So boost voltage level may depend on the LED VF.
>>> The different series of LED may cause different boost voltage.
>>>
>>> RT4831's OVP/OCP is not just the protection, more like as the limit.
>>
>> This suggests Rob is right, so let's use led-max-microamp property?
>>
> No, the meaning is different. 'led-max-microamp' always means the
> channel output current.
> It already can be adjusted by backlight brightness node.
> 
> For example
> low voltage side (3.3~4.4V) to generate the boost voltage to 16~17V,
> even 20V for BLED Vout.
> This OCP is to limit the input current of low voltage side.
> 
> After the explanation, do you still think it's the same thing?

This sounds differently so I propose to use this dedicated property with
the changes I asked for.


Best regards,
Krzysztof
