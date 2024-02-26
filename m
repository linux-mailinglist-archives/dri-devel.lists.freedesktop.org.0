Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C6C867E79
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 18:29:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A86CB10E24A;
	Mon, 26 Feb 2024 17:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XX/9MV4J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA1FD10E24A
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 17:29:08 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-564fc495d83so3864167a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 09:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708968547; x=1709573347; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=xSHCqUQrlcyM1UtPy6CIgv/PhwbptcNSxQXzTOmXrHA=;
 b=XX/9MV4J5DXx6ujORpZY3+Mbqpuv1PtscIlShsm/vzukO/vGr6q8HcU9WoBxv7ABTj
 HPh0rbLQSv+Ovlue9/Q71pMVxXHk1vzaxTa2xxxAzbRB/BpK7W0gXgCWxRt34bmRhHMa
 qpW3SinLvqICWeP38kaQ0//ypUZWE8jzpBWqWuIEq/1EPvci/mdsh5SRc5M+DD0msfsR
 3Sh2IPJVfADt90tWYth3cNF0eju55k4OEW9QeCZxE+doBeopKHPfns5aXDgFAaf5Hedf
 FfjWxkp4ONZNqLkoT+w98YMdM13U8qeecGro1DdejI8zTl/wIhyGi+A0hX5wE+F0C8iQ
 6/cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708968547; x=1709573347;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xSHCqUQrlcyM1UtPy6CIgv/PhwbptcNSxQXzTOmXrHA=;
 b=Y/yPwOi6mEAPhScsfvr7TIJ2Bz3FeDyin/bqaFqjKVJSpo0alZsCmFL41DLiourOaq
 2+6Ca8U8KR+DS1Kr5xa2hRRiN0yRIzNW4T3KYDKRjh+MCHcFzSYH6IuqDgeelOwHGm0z
 iF9wrXZfdHAPB2QI65VPYvJ9Ib8LS9xBKRCvbMPh5BxqDBxTItkogo2xoaBesgxXIXeS
 x9vWMcw2jrG+VE18NHgIEgXhmPJjcuWE7KnsTKY8mzC2MsQa057n1tjB1FVhtoHdkYlb
 CGz5MKyqKr0gc5lDUN8AFAeN+/M2HPHTAxhxi9oDsdHIPwo/NbQ7UAXJjT0CX3Q/dkug
 KHvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrLgCMclzaXtOl2bdDZoJtct6/B18qB9pmpao3VCqBKbrmd+mLale14W2BNqlWnZh/BrgDUDznk2jgdoqfxdxZtsAWuRYCys6OCc36wpxc
X-Gm-Message-State: AOJu0YzsmvMuvy6qBTlINY0/XyR2cj9QY02/RwnQd4jbPIq1UdzxAH6w
 7FIt/SQEX5jwaS7RzdTKaEeKg/vhPhPRlAWVHY/GyqxL/RBotv5fXUuVdwustm8=
X-Google-Smtp-Source: AGHT+IGCBx2sVC3xleLhxR2xoPqUw5ldbavCbeDb+kP8NVH4vfw2fxcHj+dHBK2xmEv8DmrzZ98exQ==
X-Received: by 2002:a17:906:f15a:b0:a3f:ce31:64d6 with SMTP id
 gw26-20020a170906f15a00b00a3fce3164d6mr5106209ejb.10.1708968546911; 
 Mon, 26 Feb 2024 09:29:06 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.116])
 by smtp.gmail.com with ESMTPSA id
 z22-20020a1709060ad600b00a3d125b9c0asm2574985ejf.81.2024.02.26.09.29.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 09:29:06 -0800 (PST)
Message-ID: <890afb05-1b19-47b2-bfd8-5f6de0caeda3@linaro.org>
Date: Mon, 26 Feb 2024 18:29:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/9] media: dt-bindings: Add Intel Displayport RX IP
To: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>
Cc: airlied@gmail.com, akpm@linux-foundation.org, conor+dt@kernel.org,
 daniel@ffwll.ch, dinguyen@kernel.org, hverkuil-cisco@xs4all.nl,
 krzysztof.kozlowski+dt@linaro.org, maarten.lankhorst@linux.intel.com,
 mchehab@kernel.org, mripard@kernel.org, robh+dt@kernel.org,
 tzimmermann@suse.de, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, chromeos-krk-upstreaming@google.com,
 ribalda@chromium.org
References: <20240221160215.484151-1-panikiel@google.com>
 <20240221160215.484151-9-panikiel@google.com>
 <13aeb2ff-72f4-49d9-b65e-ddc31569a936@linaro.org>
 <CAM5zL5q0oKoTMR0jSwYVAChCOJ9iKYPRFiU1vH4qDqhHALKz4w@mail.gmail.com>
 <e1fd8cbd-060b-4d15-8256-6d8dbba545da@linaro.org>
 <CAM5zL5qxBM1xQ__t86gxUKMy8O3BzoCe_vTFxxsqFq7mw4-8EQ@mail.gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAM5zL5qxBM1xQ__t86gxUKMy8O3BzoCe_vTFxxsqFq7mw4-8EQ@mail.gmail.com>
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

On 26/02/2024 13:43, Paweł Anikiel wrote:
>>>>> +  intel,max-stream-count:
>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>>> +    description: Max stream count configuration parameter
>>>>> +
>>>>> +  port:
>>>>> +    $ref: /schemas/graph.yaml#/properties/port
>>>>> +    description: SST main link
>>>>
>>>> I don't understand why you have both port and ports. Shouldn't this be
>>>> under ports?
>>>
>>> I put both so that you can use the shorter port property when the
>>> device only has one port (i.e. no MST support). It would work fine
>>> without it. If you think that's unnecessary, I can remove it (and use
>>> the ports property even if there is only one).
>>
>> No, it is fine, but then you need allOf: which will restrict to only one
>> of them: either port or ports.
> 
> There already is an allOf below that says that ports is required for
> MST support and port is required otherwise. Isn't this enough?

Add both port and ports and see if it is enough.

Best regards,
Krzysztof

