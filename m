Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2084534D54
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 12:32:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8204C10F079;
	Thu, 26 May 2022 10:32:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF4D810F061
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 10:32:15 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id rs12so2080842ejb.13
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 03:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=IhOoJiEVW1f9NZEh+LjhXs1p495IAP76V+trW0SBtRo=;
 b=fHJSBncXPQADirHt+O19VJemtFTXXzyJ9q03nrECjDpx0gclUcHS+ieBBLezoqaGC8
 fC9IFFI8ajtjcsHFcgywLvOMp38YGvBMAleD8t3/LJ+AzXKH8Ws0VP/al+A5cV+dvndp
 vbwzgeE6XPTvGSWaBMWaPbxOPw5U6SbRdTI6AzE9Ukhmj4/OFvziEXy8j39zUB7eEJhj
 FTN8mM+nJh+j543Nxch1kt4Eb2DiZFyFlU6AkDNnAYa7Thb88HRDsTB2Yf2h7GIIM3UL
 5G3W+O3JObh5EYYc+QDGbPhCcusMC6Vv+6UPGGM5+QCWxR3F7NvdX/5JM+LR+olH2syZ
 kYmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IhOoJiEVW1f9NZEh+LjhXs1p495IAP76V+trW0SBtRo=;
 b=Wfu5+4Wr0xcr/IWE0+AY/aEh1Dp/NRIyxDK1z1u3FtK+1W9GqAafr3d61A0szLqSkF
 X5k4Dkx8ptyLSkAD1Mn1H7Gw26+QN9uYDHVxXkfAhnquotMBaKVdEqmnwGXHb28Jfnxc
 ypQd6I8JvLnr/o/3xBU/E7ldgA4aoOK5XS5ECOhgRPQZmr9iF1UAmzbQIAwp7fmsDArQ
 n43JnnHoAUwLPSGrCrW+83Fpz4hHndOIc9LjQuc9ILM04Yvcq0D8OssPcV8cPcMVv8Zi
 6g8smvezwbGG1LdrVoX7AMycIqHGoB27Pmhi3PYIfUTxpiWdRUdbG6matCAQgih6ocOp
 g12Q==
X-Gm-Message-State: AOAM530kmOk5nVvUk7ehuycy52t5LfiBnLo5i6kImjME8BnsCELvOVup
 MhWcmyTqBlzlMO/ct61OpiXOlw==
X-Google-Smtp-Source: ABdhPJytcoRzpFy9P5lbgclcSPwMfqb4FHL8nr2e5PQ5uM1dp3kx1YyMinkEiWBL0zjylUDn4i5I3w==
X-Received: by 2002:a17:907:d21:b0:6fe:c340:616 with SMTP id
 gn33-20020a1709070d2100b006fec3400616mr22342567ejc.177.1653561134125; 
 Thu, 26 May 2022 03:32:14 -0700 (PDT)
Received: from [192.168.0.177] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 i8-20020a50c3c8000000b0042617ba63basm610186edf.68.2022.05.26.03.32.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 May 2022 03:32:13 -0700 (PDT)
Message-ID: <076d53d3-6062-686f-8e45-14c5f936bbf6@linaro.org>
Date: Thu, 26 May 2022 12:32:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/2] dt-bindings: backlight: rt4831: Add the new property
 for ocp level selection
Content-Language: en-US
To: ChiYuan Huang <u0084500@gmail.com>
References: <1653534995-30794-1-git-send-email-u0084500@gmail.com>
 <1653534995-30794-2-git-send-email-u0084500@gmail.com>
 <1c7ab94c-a736-c629-bd8c-8a974803e2b9@linaro.org>
 <CADiBU39jZ6TdYZoH80m4R-X2_fUXZOvDA4yUd_TQdPzBJLE+JA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CADiBU39jZ6TdYZoH80m4R-X2_fUXZOvDA4yUd_TQdPzBJLE+JA@mail.gmail.com>
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
 lucas_tsai@richtek.com, jingoohan1@gmail.com, deller@gmx.de,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 lkml <linux-kernel@vger.kernel.org>, cy_huang <cy_huang@richtek.com>,
 Rob Herring <robh+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee.jones@linaro.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/05/2022 10:13, ChiYuan Huang wrote:
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> 於 2022年5月26日 週四 下午4:06寫道：
>>
>> On 26/05/2022 05:16, cy_huang wrote:
>>> From: ChiYuan Huang <cy_huang@richtek.com>
>>>
>>> Add the new property for ocp level selection.
>>>
>>> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
>>> ---
>>>  .../bindings/leds/backlight/richtek,rt4831-backlight.yaml         | 8 ++++++++
>>>  include/dt-bindings/leds/rt4831-backlight.h                       | 5 +++++
>>>  2 files changed, 13 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml
>>> index e0ac686..c1c59de 100644
>>> --- a/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml
>>> +++ b/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml
>>> @@ -47,6 +47,14 @@ properties:
>>>      minimum: 0
>>>      maximum: 3
>>>
>>> +  richtek,bled-ocp-sel:
>>
>> Skip "sel" as it is a shortcut of selection. Name instead:
>> "richtek,backlight-ocp"
>>
> OK, if so, do I need to rename all properties from 'bled' to 'backlight' ?
> If  only this property is naming as 'backlight'. it may conflict with
> the others like as "richtek,bled-ovp-sel".

Ah, no, no need.

>>
>>> +    description: |
>>> +      Backlight OCP level selection, currently support 0.9A/1.2A/1.5A/1.8A
>>
>> Could you explain here what is OCP (unfold the acronym)?
> Yes. And the full name is 'over current protection'.

Thanks and this leads to second thing - you encode register value
instead of logical value. This must be a logical value in mA, so
"richtek,bled-ocp-microamp".

I see you already did some register-style for voltage. It's wrong but it
was done, so let it be. But let's don't make that a pattern...


>>
>>
>> Best regards,
>> Krzysztof


Best regards,
Krzysztof
