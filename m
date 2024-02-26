Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB2A86744C
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 13:06:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ACF510F0F4;
	Mon, 26 Feb 2024 12:06:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kc9JrEcE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E20010F0F8
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 12:06:35 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-5645960cd56so3305419a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 04:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708949193; x=1709553993; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=jZb3RsfWCFtGnSiN/0Ua3do7F7uOiKDfXi71EwZXwms=;
 b=kc9JrEcE7hyjDkd/Fh0BdK+3/881VA92wzNj2dEQezAiNrvJSonbMTRRBA84zJ/U5V
 kmBaeSbVZEqG0dFtFPgoW2yqQKouV9sFCfDbmFbBIOgEAwbLEXRJ7pxSvv7OPgxS6ct2
 PmFpCQHo874Sqc0whNhqKrcC770zK4Thb9y4iufFingYlrzgwQWjyGHa2RPeU8PC7wFn
 V4XCgWUAtJK3cnLQbhvPGXrW4UE5mAyk5A64sYQJ2G16ObbFKjsulNtmHV9f1QHzRHSY
 czBa/XEsohfJp5xJVPEnGD3fkFl86xxfahrW5KbUTigfBHTuUKQp5tjc+qgTtZj5VGQu
 vBrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708949193; x=1709553993;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jZb3RsfWCFtGnSiN/0Ua3do7F7uOiKDfXi71EwZXwms=;
 b=azlgnx4mm8zvcBTba9paMbJy+qHXStFgzkts3ZVrHuplNa3WziCLuASuHIpLYwQtUJ
 Tx8XeW1rBdI+lWvByZVKw87l0z8e0d2Pix+X4RLMf6rHRtWXVHEsjJZd5XpHxBOaQHbT
 HvGwuCnNLWxRMZwbAVC3C//dGgjPItd1qm26Msy18l102BYEI+4qZqduWVmVFeu9dfRC
 Un+917hgB/TjJT+CHy/hlFsaEsMr0Ei8PituabdlsXN1apkR6MMWTvjpezJVg7ZmzReO
 51Fqhi6Hcez2MB++NQiWSlYMH4FzeBqzY52+RLO0NVaHPQfarnl5aZ0GF4UgEy+jz47m
 Sh7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU83H2MTcU/rEjcnbLbGCZFeo0g4sXcfh/y+tke0V9HdlRGqIl+1DNupSZdFzigDjWDdvsbmdItKdc/T8gdunJn/arSzCYPaHjY5zQcOAci
X-Gm-Message-State: AOJu0YyfXW88htQZNrvTkWfjEgwLfL0eA25WIkdmAOJfVd4LwsNWUvGB
 hrIb6sP8H1mhJY8WXVQoROKhpMHkpHABvr9Z25Ek1DBC5vX7LTxy5AOZKRYu0bI=
X-Google-Smtp-Source: AGHT+IHVPJHNRwyZQ5ZsC6Nz8Lo7dv2F89RO73gTPCFNLMkhI8Kq4cIvhrc3ArE0rurSQnQGJyHI5g==
X-Received: by 2002:a05:6402:1817:b0:564:4221:9aa9 with SMTP id
 g23-20020a056402181700b0056442219aa9mr4623645edy.38.1708949193002; 
 Mon, 26 Feb 2024 04:06:33 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.116])
 by smtp.gmail.com with ESMTPSA id
 n9-20020a056402060900b0056200715130sm2301671edv.54.2024.02.26.04.06.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 04:06:32 -0800 (PST)
Message-ID: <e1fd8cbd-060b-4d15-8256-6d8dbba545da@linaro.org>
Date: Mon, 26 Feb 2024 13:06:29 +0100
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
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAM5zL5q0oKoTMR0jSwYVAChCOJ9iKYPRFiU1vH4qDqhHALKz4w@mail.gmail.com>
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

On 26/02/2024 11:59, Paweł Anikiel wrote:
>>> +properties:
>>> +  compatible:
>>> +    const: intel,dprx-20.0.1
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  interrupts:
>>> +    maxItems: 1
>>> +
>>> +  intel,max-link-rate:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    description: Max link rate configuration parameter
>>
>> Please do not duplicate property name in description. It's useless.
>> Instead explain what is this responsible for.
>>
>> Why max-link-rate would differ for the same dprx-20.0.1? And why
>> standard properties cannot be used?
>>
>> Same for all questions below.
> 
> These four properties are the IP configuration parameters mentioned in
> the device description. When generating the IP core you can set these
> parameters, which could make them differ for the same dprx-20.0.1.
> They are documented in the user guide, for which I also put a link in
> the description. Is that enough? Or should I also document these
> parameters here?

user-guide is something for users, like user-space programmers or
end-users. I would never open it to look for any information related to
hardware.

Anyway, external resources are a no-go. We have it clearly in submitting
patches:

https://elixir.bootlin.com/linux/v6.8-rc6/source/Documentation/process/submitting-patches.rst#L130

> 
>>
>>> +
>>> +  intel,max-lane-count:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    description: Max lane count configuration parameter
>>> +
>>> +  intel,multi-stream-support:
>>> +    type: boolean
>>> +    description: Multi-Stream Transport support configuration parameter
>>> +
>>> +  intel,max-stream-count:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    description: Max stream count configuration parameter
>>> +
>>> +  port:
>>> +    $ref: /schemas/graph.yaml#/properties/port
>>> +    description: SST main link
>>
>> I don't understand why you have both port and ports. Shouldn't this be
>> under ports?
> 
> I put both so that you can use the shorter port property when the
> device only has one port (i.e. no MST support). It would work fine
> without it. If you think that's unnecessary, I can remove it (and use
> the ports property even if there is only one).

No, it is fine, but then you need allOf: which will restrict to only one
of them: either port or ports.

Best regards,
Krzysztof

