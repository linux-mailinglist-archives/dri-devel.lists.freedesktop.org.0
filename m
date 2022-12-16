Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C45664EC08
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 14:22:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8068A10E119;
	Fri, 16 Dec 2022 13:22:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7BE410E119
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 13:22:05 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id z26so3422024lfu.8
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 05:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RNCf2UgJngQuJz1n80wEvS0loAh/KFuMJfH8wEByOew=;
 b=K4OK+Gd6LS+KWQr2cK2MKGlRrZ8f7Zs2mBOxBnd9uWxWHAaopXPyYOsTo+BRtKT5WZ
 wJjyGRflyKietQEiqF66osK2N7XTrn5ZlG97ZrzCEDYqFSBTmgOdzsKa1rrZtNyorm/g
 bOFFY7X/Ddu9hKXsqIbNtGpRwuycqhh1QtwlB2asA4xW982Tr5EmTuxG3P+9z/4Cjrfg
 +qwYY36aVQl7f/eeFWBGuh0sA7ZVYFjNc1SOQBAo0vdb5ouxC7NsAYNVRPSWQJAOBAL8
 SaIECp8Vv3T6abrPqd37FIQuOxVr9ziMnpa0+mBuJVNaMLgQu12l5Fz4tCH+VtHslaHf
 My2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RNCf2UgJngQuJz1n80wEvS0loAh/KFuMJfH8wEByOew=;
 b=ZiiuIkkeAfKXxbrw8L9DaiZmvhpWHYkH/QAiK9udvDxO0RyKCVmkYJFuwBemtzgEDC
 jOqJPxBUjgZvrgkKLx61vnVVAg798DD+Q2aejs4lF/7FwkrqZX2q6HaJHXB96etymvYP
 ZMkIlj+4AC1efM6FaBhIPsgGqNrBhCvVJkYA1pxCF0oN65qmkQFzB2q8+iCSv9IcAzK+
 2wXhLH+yc7BvqZgZWfzYXOneoaZFu4/JA7AI/Vm3SrqqMDvRnqpLvN5c/32tr09buo1/
 XI0yHWYW5GhYQCG3BuwxFFp/Lnwuh/TWClgUCVQ27X2UnZMsZiZioovUx7JQhauf3QGT
 +UxA==
X-Gm-Message-State: ANoB5pmoqqrCu8cVQN5yPwNZq3QTjo0kk1Q2j7KLHQs08I7OJoqpUxGW
 AQgY2RrWg1Cz3sxlP8TnPdTegrFMeRxxYYDF
X-Google-Smtp-Source: AA0mqf62tids3S49qFwaQg9e0oPPfVRcEta0fP5KwomNnTkFlqzKJqRTfCF40M6m/4kJF3FHW7kcSg==
X-Received: by 2002:ac2:5a43:0:b0:4b5:90c5:281c with SMTP id
 r3-20020ac25a43000000b004b590c5281cmr8818446lfn.19.1671196924021; 
 Fri, 16 Dec 2022 05:22:04 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 o9-20020ac25e29000000b004b6f00832cesm219363lfg.166.2022.12.16.05.22.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 05:22:03 -0800 (PST)
Message-ID: <1114488b-7e73-6086-2f76-cb71ef6056f6@linaro.org>
Date: Fri, 16 Dec 2022 14:22:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 01/10] dt-bindings: display: bridge: it66121: Add
 compatible string for IT6610
To: Paul Cercueil <paul@crapouillou.net>, Robert Foss <robert.foss@linaro.org>
References: <20221214125821.12489-1-paul@crapouillou.net>
 <20221214125821.12489-2-paul@crapouillou.net>
 <CAG3jFytgK0noWteGvXTdSm9as9Q=qfhf_ep3Z8Wv2ofmLzGb=A@mail.gmail.com>
 <c78e92ae3cbea037abdd31ecd64e997c8dd1def2.camel@crapouillou.net>
 <bb2b5b72-42b3-3a6c-d865-9e338e34aba0@linaro.org>
 <d1f6d19d3218d9f1acc9b38e44af413f72f8a824.camel@crapouillou.net>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <d1f6d19d3218d9f1acc9b38e44af413f72f8a824.camel@crapouillou.net>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Phong LE <ple@baylibre.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, list@opendingux.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/12/2022 13:21, Paul Cercueil wrote:
> Hi Krzysztof,
> 
> Le vendredi 16 décembre 2022 à 12:21 +0100, Krzysztof Kozlowski a
> écrit :
>> On 16/12/2022 11:46, Paul Cercueil wrote:
>>
>>>>>  properties:
>>>>>    compatible:
>>>>> -    const: ite,it66121
>>>>> +    enum:
>>>>> +      - ite,it66121
>>>>> +      - ite,it6610
>>
>> These should be ordered alphabetically. What's with the tendency of
>> adding always to the end?
> 
> I'm too used to the "inverse christmas tree" sort :)

Since these are not variables and they will not get shorter, any
christmas tree sorting here is the same conflict-prone as adding to the end.

> 
> I can send a quickfix patch if you really want alphabetical order.

No, no need.


Best regards,
Krzysztof

