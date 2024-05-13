Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 932B38C3E3C
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 11:38:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EF1110E293;
	Mon, 13 May 2024 09:38:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xsQWyYmh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A6D10E293
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 09:38:06 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-41dc9c83e57so28359395e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 02:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715593085; x=1716197885; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ZakEEfF/gL0Nf5L87QnDy2p/w280G1B+M/YPIdJS+74=;
 b=xsQWyYmhEAHQb5x2raxp6/XsP9h56N7/QgkQ2GUy3Qm7YEf896ep5Udgmdrzo18Ds7
 g6hUqQ7gBv+QUQVaRxVkDtx+jRnZPztP0Ybg8Asy9pSFlmw5e/KdMUanh6NdhtF7r5g9
 GT7RH7FcYPK/h0XRro3bY8XFZIhby5xAIsHOogSMcT4fQP/Q8JLqiedSk317ZlwsPDYQ
 dAUcg0iNp32ILVux8sNooS0I1XLGWDXwnABDyGuAYgdSbxCPpHP+XuQ9qL5c/ow2ZiJV
 XLVxcp/Grz+yqgkyxbAcAJyU9rdMGgxADmokQy/GyNKwdzAmD96X1Ep+8Z1W/dUE1AIk
 N60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715593085; x=1716197885;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZakEEfF/gL0Nf5L87QnDy2p/w280G1B+M/YPIdJS+74=;
 b=nJrVwhZbkGd7ZbhSmE4U2fXH0CQYhyuwmJpDhRHO896oT2g5x1qUkyb3TnYBfl/V1o
 f0jWFTjGxhIWk6LjdskWmMlXrpQ+alr2LyQbnyrMYNh7ZAkXM+JVKz5/4j6jo6T/Frpt
 xqQUGHKOEkCNaFzTqLbxIFy0wfCNhd9IXPI6+ySVVjK+KfeB4tuLjgNoD32Y+3kzda0f
 iolh7EqYXLCzP91rZ9M2xxZE/n7PIIsZCoN6gxW7kRdLWJrEZkgc3QHsc+OJXtDP+zRS
 1vH0RLMemhk5HZ6eL0DZodEs5xgNzmN3IUhFI9CITooGzG41zmG5KBy96zckKTdLBbW0
 igmg==
X-Gm-Message-State: AOJu0YwqVOVjR6hK/rwzu3EHimLHcurkVs/1oL02SAmbljyTa43VuFTF
 QQQSNd5mnYHZv4pcYAt6RG0oERSvb3X/sk346kIEEPzehCbMz/Qq4eLC2Bz1Li0=
X-Google-Smtp-Source: AGHT+IHfSgTeyVhBTWmBtZLIzJ4luTsv9/3g5Suea7200Xibi4Bu5PMKa/R7TxwhXXne07D7DK9d9A==
X-Received: by 2002:adf:ff8c:0:b0:34c:e0d6:bea6 with SMTP id
 ffacd0b85a97d-35049bbf670mr8493146f8f.29.1715593085254; 
 Mon, 13 May 2024 02:38:05 -0700 (PDT)
Received: from [10.91.0.75] ([149.14.240.163])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b79bc3bsm10638940f8f.13.2024.05.13.02.38.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 May 2024 02:38:04 -0700 (PDT)
Message-ID: <9caaa63d-cf5a-46f8-93db-9fbc00850d8f@linaro.org>
Date: Mon, 13 May 2024 11:38:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: panel-simple-dsi: Add generic panel-dsi
To: Johan Adolfsson <Johan.Adolfsson@axis.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 kernel <kernel@axis.com>
References: <20240418-foo-fix-v1-0-461bcc8f5976@axis.com>
 <20240418-foo-fix-v1-2-461bcc8f5976@axis.com>
 <c739a512-9a75-4f48-b5ef-801191c298f5@linaro.org>
 <PAWPR02MB928111F5EEB4A46B56A89B239B122@PAWPR02MB9281.eurprd02.prod.outlook.com>
 <29352160-4943-4271-97f5-34afd6f35df9@linaro.org>
 <PAWPR02MB9281B32E144205CCEEF0C53D9BE22@PAWPR02MB9281.eurprd02.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <PAWPR02MB9281B32E144205CCEEF0C53D9BE22@PAWPR02MB9281.eurprd02.prod.outlook.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/05/2024 11:34, Johan Adolfsson wrote:
> 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> 
>> Sent: den 22 april 2024 22:57
>> To: Johan Adolfsson <Johan.Adolfsson@axis.com>; Neil Armstrong <neil.armstrong@linaro.org>; Jessica Zhang <quic_jesszhan@quicinc.com>; Sam Ravnborg <sam@ravnborg.org>; Maarten Lankhorst <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>; David Airlie <airlied@gmail.com>; Daniel Vetter <daniel@ffwll.ch>; Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>; Conor Dooley <conor+dt@kernel.org>; Thierry Reding <thierry.reding@gmail.com>
>> Cc: dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; devicetree@vger.kernel.org; kernel <kernel@axis.com>
>> Subject: Re: [PATCH 2/2] dt-bindings: panel-simple-dsi: Add generic panel-dsi>
>>
>> On 22/04/2024 16:34, Johan Adolfsson wrote:
>>>
>>>
>>> -----Original Message-----
>>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Sent: den 19 april 2024 01:05
>>> To: Johan Adolfsson <Johan.Adolfsson@axis.com>; Neil Armstrong 
> ..
>>> Subject: Re: [PATCH 2/2] dt-bindings: panel-simple-dsi: Add generic 
>>> panel-dsi
>>>
>>>> On 18/04/2024 16:01, Johan Adolfsson wrote:
>>>>> panel-dsi is similar to panel-dpi with overridable timings
>>>>
>>>> ???
>>>
>>> I guess a more correct description would be "panel-dsi is a fallback 
>>> in a similar way that panel-dpi is in panel-dpi.yaml .."?
>>
>> I meant how does it explain the hardware.
> 
> In our case it's actually an FPGA that takes MIPI DSI input and can support multiple different kind of displays, and what I want to achieve
> is to avoid specifying a lot of different panel timings in the driver and have that in devicetree instead. 
> I appreciate any suggestions on how to phrase that in an acceptable manner.
> 
>>> ...
>>>>> a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.y
>>>>> am
>>>>> l
>>>>> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple-d
>>>>> +++ si
>>>>> +++ .yaml
>>>>> @@ -56,6 +56,8 @@ properties:
>>>>>        - samsung,sofef00
>>>>>          # Shangai Top Display Optoelectronics 7" TL070WSH30 1024x600 TFT LCD panel
>>>>>        - tdo,tl070wsh30
>>>>> +        # Generic dsi panel with timing overridable
>>>>> +      - panel-dsi
>>>>
>>>> ? Devices are not generic. This is very confusing and commit msg does not help me. Compatibles *must* be specific, see writing-bindings.
>>>
>>> I guess I see this a generic fallback, that handles any dsi panel as 
>>> long as the correct timing etc is specified in devictree, similar to what panel-dpi is in panel-dpi.yaml Maybe phrasing it similar to panel-dpi.yaml is better?
>>
>> But panel-dpi is quite different. You always have two compatibles. I don't see two compatibles here.
> 
> It doesn't really need two compatibles (in practice at least), the new generic panel-dsi could be enough - I do believe that devices can be generic,
> but I admit that I'm not really "fluent" in devicetree and binding descriptions.

I guess the first comment brought here a bit of naming issue... The
bindings are not "generic".

Best regards,
Krzysztof

