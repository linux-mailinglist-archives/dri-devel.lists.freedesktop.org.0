Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5772C855F9E
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 11:41:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A55510E5C2;
	Thu, 15 Feb 2024 10:41:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="esBbUJao";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1439110E46A
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 10:41:39 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-51178bbb5d9so772933e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 02:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707993696; x=1708598496; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VUYBcKj53WAi3y6gltiMvu5JfERqWvi9YPUJbVOf3Mo=;
 b=esBbUJaoeHYSWL8UyNPEPgeO/FqxJXQGYJWudzR/vAL1BbviqDwR9kOOJann8tHiYu
 McxFM9+5OaOrBYyAzrIZmHAMIaYLrTNi2ppQ3Z8yFSwluhiowEzRQyqCKS9HU+GREsZB
 DdD3NA4xK/jdcIb46MD7ykKam+h7gG4DT6wyTELu+trXAp1HQBqz5Y5eV8yYjPq5ao1H
 0AF2AEMhN9dG3AN5Hhh20+DvZ2kkI0/TjH8XB4BUZQtpZgIdRrcP4s9Ta1WYTj8nGyTA
 j7cjOXsh03GLqYTl9+JpBCcJN4hs56etCz2Ij4erQ7Jw6946LGEbjdQaxUgwv7DeTDXk
 Ndvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707993696; x=1708598496;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VUYBcKj53WAi3y6gltiMvu5JfERqWvi9YPUJbVOf3Mo=;
 b=FptKb6JdOzv6rDBCftmr0dEy0/xkGSBFGkPB0e9kxCGiYFGKMQGox70kGDmmJKLVKH
 mYou6g0Lk/WwKgZrZKmdksOjZ3oVbSIjfF694E18G7cfsSzsWOXGcSF6cUWEhbJywT8S
 pet42gq998WF2+aTxjFu7AIHUFiX76lkPc34zls6sVAVTJ76GNzSHn18Fb0DFZ8iqp/3
 XST8jAX1NqEx79NLyoQVB5SOVN6+u3w/kGeSmIS1geFSLFEXRdYqfEeWpFIP8aafTIwP
 +5HLDWt45pEJi4zziDzsMwM7Gthrzc5VJT6wplh0nWhk4fPQoOZJsrWqXsNobE8GxIA/
 6hKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpy32Rmz1yZbygVlpV3FMLQTV8raG+1OoMUk/yFWB2QZ1t6X/7NjCqNtBFDVkO9kweGsq79ZdAS9wbeOuvrwFW+r54AsZjwsaHWLA4Qv51
X-Gm-Message-State: AOJu0YyS/UcOP1TWHh415HIMh+LQDnU9nBQpK1rfSjtmzbD4rq7OtvMh
 TZyr7MXg/T497ahhltQHm0KKMDTfxIBa8vKKNOL3MHNfzM3HP1vXfQ/ygDttSxY=
X-Google-Smtp-Source: AGHT+IEcAT4U/SeoV9QZ1GoMtyBdueDaX8N8avvtZi0g2w+pf1DVcF9RtUYsg2KCjzAVQ534XzYb1w==
X-Received: by 2002:a05:6512:3ca5:b0:511:87c6:3060 with SMTP id
 h37-20020a0565123ca500b0051187c63060mr1648595lfv.12.1707993696399; 
 Thu, 15 Feb 2024 02:41:36 -0800 (PST)
Received: from [192.168.192.135] (078088045141.garwolin.vectranet.pl.
 [78.88.45.141]) by smtp.gmail.com with ESMTPSA id
 t26-20020ac243ba000000b005119fdbac87sm189167lfl.289.2024.02.15.02.41.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Feb 2024 02:41:35 -0800 (PST)
Message-ID: <20ab318e-e79f-419e-b68b-85ae0e5ab128@linaro.org>
Date: Thu, 15 Feb 2024 11:41:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] drm/panel: Add driver for DJN HX83112A LCD panel
Content-Language: en-US
To: neil.armstrong@linaro.org, Luca Weiss <luca.weiss@fairphone.com>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg
 <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20240110-fp4-panel-v2-0-8ad11174f65b@fairphone.com>
 <20240110-fp4-panel-v2-2-8ad11174f65b@fairphone.com>
 <CACRpkdaWTfPDCin_L6pefHsokjNyO8Mo6hWPdzPLLi1EUkKUuA@mail.gmail.com>
 <CYBZEZ4IM6IL.VR04W7933VI@fairphone.com>
 <CACRpkdZQbVXfBa70nhDOqfWPbsh-6DgX-uvZOxr19pzMmF2giQ@mail.gmail.com>
 <CYCLSCKPPBOC.1B1MP3VOOC0Q8@fairphone.com>
 <cdc18e2a-b7eb-4b54-a513-481148fb3b0d@linaro.org>
 <CYCMVXHYVDCI.HVH1TR8MWEUK@fairphone.com>
 <CACRpkdacS9ojXUuogygkz6xxCf3mMq6GG_75sze8ukUu=rxVyw@mail.gmail.com>
 <f99d363c-d4a6-44b3-8057-3925f8dac1d5@linaro.org>
 <CYL76M5KT424.G3BC6JX74XVN@fairphone.com>
 <CZ4P5PWJTODV.3UJ89H6M8W07H@fairphone.com>
 <f9164049-6529-42c1-a35a-e91132c823b9@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <f9164049-6529-42c1-a35a-e91132c823b9@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14.02.2024 10:50, neil.armstrong@linaro.org wrote:
> On 14/02/2024 10:33, Luca Weiss wrote:
>> On Mon Jan 22, 2024 at 12:27 PM CET, Luca Weiss wrote:
>>> On Fri Jan 12, 2024 at 11:26 AM CET,  wrote:
>>>> On 12/01/2024 11:23, Linus Walleij wrote:
>>>>> On Fri, Jan 12, 2024 at 10:52 AM Luca Weiss <luca.weiss@fairphone.com> wrote:
>>>>>
>>>>>> Since there's zero indication Truly is involved in this panel in my
>>>>>> documentation - much less the number 5P65 - I'm not going to add that.
>>>>
>>>> Ack
>>>>
>>>>>
>>>>> OK then, I fold, thanks for looking into it.
>>>>> Keep the Himax hx83112a file name and symbols.
>>>>>
>>>>>> So in short this panel is the model 9A-3R063-1102B from DJN, which uses
>>>>>> a Himax HX83112A driver IC.
>>>>>
>>>>> So compatible = "djn,9a-3r063-1102b" since the setup sequences for
>>>>> hx83112a are clearly for this one display?
>>>>
>>>> Yep let's settle on that!
>>>
>>
>> Hi Neil and Linus,
>>
>> Any feedback about the below question?
>>
>> Regards
>> Luca
>>
>>> It's clear to me to use "djn,9a-3r063-1102b" in the driver now but what
>>> about dts?
>>>
>>> Currently here in v2 we have this:
>>> compatible = "fairphone,fp4-hx83112a-djn", "himax,hx83112a";
>>>
>>> Should this just become this?
>>> compatible = "djn,9a-3r063-1102b";
>>>
>>> Or e.g. this?
>>> compatible = "djn,9a-3r063-1102b", "himax,hx83112a";
>>>
>>> Or something else completely? Do we have some documentation / best
>>> practises around this maybe?
> 
> Sorry I totally missed the question.
> 
> Not sure if "himax,hx83112a" is needed here, the "djn,9a-3r063-1102b" is enough to know the IC is hx83112a.
> 
> I don't think you'll ever find a "djn,9a-3r063-1102b" with another controller IC ?
> 
> And "himax,hx83112a" alone as fallback is not enough to describe the panel hardware, so I think it should be dropped.

+1

Konrad
