Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D18C2867E83
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 18:30:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D081B10E4BB;
	Mon, 26 Feb 2024 17:30:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="P7emh10t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF0410E549
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 17:30:20 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5648d92919dso4399879a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 09:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708968618; x=1709573418; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bn0hlznCVxSrsNV/WAQtHRCks7XQUrAy3V66ZRa2PDM=;
 b=P7emh10tk1WBjbMQMZg5Du1F2yOv4HN+vJ+MGzsHeSHIOZkJ23vzb6+glBrcvbxPQE
 O/AGnTG2RhqrQ9FUKWv7ISDHMD1wECyyVKrsCE3nZkdYl8aIxj5UEnMOWC7ZQgv+2MhH
 NJ9vuhtMUnWrbWoSKNmgmtnazFDEGzGn2m5ZyX93+ScZqG1TJbwfqWBxmBXF3dJaxo5W
 Z6MOfUSlLNAjA47wCQSDU2suqMT94wv1Qoa9DuXSugOBhR/snAtklJDSQ+D3HTOAaJo1
 lPyX8F/op/fq6srRZkqugoIUAGVcbtlDJtCfNi+P7MCA8BSiMbintARkHXvrDvHn+5xK
 v7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708968618; x=1709573418;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bn0hlznCVxSrsNV/WAQtHRCks7XQUrAy3V66ZRa2PDM=;
 b=Mk2UC5EqEvlZ3W+oHOvuamVJ6akzrWRQ1tEmoGIDvF8TW7kOe8dhgcCyC9NSDL0Xs6
 Uxy/OFnYCe3mnCKdjZdHg60DEC9LV3JfhmW9GMHxeowyhjS+xKG1g91s4a2l1XIZNuJu
 MrWI6kzgDSRG6DlM0p27YurYeOohTc+BYbh81ujBUdLEr5I/72k3lMkAzeZQUhclJsMu
 vPB8xZzMar+GcBXkogWsZCG0rh51/8cCMo5FTEsRgZMPe3XQ62iohNfEWT9JuU8tmRx9
 sYmsXCg3Qhyt4x+pDyRskdqpR0rmlmd1SwlWKpY7mjmGhThNdDVu6WkqKpHdZ9HJnjs7
 1IXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwrid7n6Q4efqaWqGawu7OXaGSKvU0mCYFBsux2IcVeCFnE3fHhQcx8CAzYpf4ui526l6iq2G8mPmXZz08F6n3JE7j8KxPLgn0bWuA5q0U
X-Gm-Message-State: AOJu0YxHgLfPkF0o08qzHmijVLnoxzeY+HRPT87dKw3H0ROujbdHfSWg
 sZEGqVYqWeGpOWZzunv/hjidBq9qQuOdr9FVObbybajosjM2YEhhTm+9QyNXpyY=
X-Google-Smtp-Source: AGHT+IG8yQL0DnwMkE7tO/Ue3mKmFvDANmQ6n4REJ3Ms098bEXROFPOY0/p47S5xVHX4c0v1D6R+7Q==
X-Received: by 2002:a17:906:f20a:b0:a3d:169a:220c with SMTP id
 gt10-20020a170906f20a00b00a3d169a220cmr4246800ejb.24.1708968618530; 
 Mon, 26 Feb 2024 09:30:18 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.116])
 by smtp.gmail.com with ESMTPSA id
 z22-20020a1709060ad600b00a3d125b9c0asm2574985ejf.81.2024.02.26.09.30.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 09:30:18 -0800 (PST)
Message-ID: <e210b318-dcd7-4c0e-b08e-e1c4da1a8cd9@linaro.org>
Date: Mon, 26 Feb 2024 18:30:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] ARM: dts: chameleonv3: Add video device nodes
Content-Language: en-US
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
 <20240221160215.484151-10-panikiel@google.com>
 <310cefcb-a4d5-4f4f-a482-ba2ff08a57f6@linaro.org>
 <CAM5zL5rQsYuo3+rW9+YPmvUg9PtNiR0Dy59e8Kf787ranfLh3Q@mail.gmail.com>
 <e2ae7bfc-fb51-4a60-bb52-c6ccca7a4189@linaro.org>
 <CAM5zL5pz0K5ro4-UjiYojM4h9Lqo_af5ZmH1FoZ_ajde_3+Dcg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAM5zL5pz0K5ro4-UjiYojM4h9Lqo_af5ZmH1FoZ_ajde_3+Dcg@mail.gmail.com>
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

On 26/02/2024 13:27, Paweł Anikiel wrote:
> On Mon, Feb 26, 2024 at 1:07 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 26/02/2024 12:09, Paweł Anikiel wrote:
>>> On Mon, Feb 26, 2024 at 10:15 AM Krzysztof Kozlowski
>>> <krzysztof.kozlowski@linaro.org> wrote:
>>>>
>>>> On 21/02/2024 17:02, Paweł Anikiel wrote:
>>>>> Add device nodes for the video system present on the Chameleon v3.
>>>>> It consists of six framebuffers and two Intel Displayport receivers.
>>>>>
>>>>> Signed-off-by: Paweł Anikiel <panikiel@google.com>
>>>>> ---
>>>>
>>>> ...
>>>>
>>>>> +             dprx_sst: dp-receiver@c0064000 {
>>>>> +                     compatible = "intel,dprx-20.0.1";
>>>>> +                     reg = <0xc0064000 0x800>;
>>>>> +                     interrupt-parent = <&dprx_sst_irq>;
>>>>> +                     interrupts = <0 IRQ_TYPE_EDGE_RISING>;
>>>>> +                     intel,max-link-rate = <0x1e>;
>>>>
>>>> Rate is not in hex! Rate is in Hz, at least usually...
>>>>
>>>> Fix your bindings...
>>>
>>> This is the DisplayPort link rate, for which the allowed values are
>>> 8.1 Gbps, 5.4 Gbps, 2.7 Gbps, or 1.62 Gbps. The standard way to encode
>>> them (used in the DisplayPort DPCD registers and this device's
>>
>> Then it is in bps or some other units:
>>
>> https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/property-units.yaml
>>
>>> configuration) is by multiples of 0.27Gbps. This value (AFAIK) is
>>> usually represented in hex, so 8.1Gbps would be 0x1e.
>>
>> No, the value is represented in logical units. Frequency in Hz. Rate in
>> bps/kbps/etc. Voltage in volts.
> 
> Okay, thanks for the info. So if I understand correctly, the max link
> rate should be represented in bps in the devicetree, and then be

or kbps

> converted to the per 0.27Gbps value by the driver?

If driver needs some register-based value, then yes.

> 
> One problem is that the values here are too large to be represented in
> bps (since the datatype is uint32). Can the property be in Mbps
> instead?

Can be. You can submit a patch to dtschema (patch to DT spec list or
github pull request) adding '-mbps' as well.

Best regards,
Krzysztof

