Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 558D084F939
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 17:05:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C4510E48B;
	Fri,  9 Feb 2024 16:05:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LFqTPcb9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F1810F6B5
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Feb 2024 16:05:50 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-41028900b83so9383525e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Feb 2024 08:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707494749; x=1708099549; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dU7XC8yrx8uLH4o5YTzJ9EPFwQMjaxjgIoA5T1WdSW0=;
 b=LFqTPcb9vYeJwTWkvAzKM9yu6YH4RNyH/OLUSvETXffPDcRYeAFXApycYMqJO0gtMo
 5h0JCVYsRxtj/DGjo0a07dpjiIjoIoW8Sg7mDu9d+qBJNDqyBKIJBoWw6K6A7IkOikGy
 2Q8+Tf2GbxWgea5ljo6hfN27eb+xpdUnCHvwoxPYCr0dzblnwwi9Lb8qLcWoEbMWugHO
 xg3en1tQFqrg79G0JTw6gd5SBq4KnD7vmXHA0IjrcTBl6hzR4zp/bhvnkdLXNiVy+s4i
 IYbbM7bXgO8Yljgd322jV5jJNdxhPTkmCi+lVI90Ln9mfVseRzZK9kuh+/H5EFk9Yv1u
 l7mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707494749; x=1708099549;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dU7XC8yrx8uLH4o5YTzJ9EPFwQMjaxjgIoA5T1WdSW0=;
 b=RXTmRsNNzn/UlgtoUmwfoGH8mwh0M6zY+2cZ2V5aLMhxcvqNM/Eft5kVnACDkO+Nje
 dIzFzp7qVGWc4APlma3BT3z99BdAAr69TtRYdGZ0IuRnRNYcITB3obEDSe+deiebLw6F
 GLXMw2f5desfryNG9qFPxWiJMxOKgTgMhGxoBnG3g54pW+8TVzej/0s1fRx24LsayB+D
 f4P0szU1wyfHbH0qPo3lieVMJ3aLG5FxqEXW5lgH2V3BrOdpZ31eoeAUjLLWAT6ux8o+
 L5V3i5ojzN8JLf0UipTnqSfox45IA8CJOWUvx+iD4T5WQF9VT9+bdx4MM3AXqGm0yHoh
 bAGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWB6PcVZyiPn0js4IzrzLeAmG2rGaVmmadnqw2PT1mrBoSzaRQ9WydIskgFe+Az8PziBDKQHlQ0B0G5v9FuedoSN/FgBap1CTEISZY5v86S
X-Gm-Message-State: AOJu0YzQtmr9qYFuqcW18HrxA4p9L1fqUBpTuftkh9mDfbkxyYnV8Ro6
 nUh7plK/A5qnmZLcMyOC44UC/OIiYRfY5WdBtgHMC5GSVQV4ufBVKwG9SbcT3K4=
X-Google-Smtp-Source: AGHT+IF5diPOevfT66pSbPcGsOM6N1ab4z+PF5lVLCdtUkqtAoLWrRb89zB19B9s6Puen9kLsJSLwA==
X-Received: by 2002:a05:600c:601c:b0:410:726b:6f87 with SMTP id
 az28-20020a05600c601c00b00410726b6f87mr1431235wmb.32.1707494748759; 
 Fri, 09 Feb 2024 08:05:48 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXWz4n3G6o0K3MtBV4aKrRagGXwmWlUCBDVSyel9pNSPtPevQyhPdsQlasqRepxCp32X1KPEwL1bJBI7GxhQGVOSokFHTOIvRrRpSggLoNRpSKldfwhrTItjjEcY4fh8IbPfX727kKuo2g2assdQ/rzsAi/keKkKVcrbNncGK7hAmidqKqm6NGBbBf+j0wt5MZzx7QBPPEqbWZPv+GTrZZUX/5PA9Mbgp+SRnat0k/lZshKyi8S9rAquhjVUWDFBvqlWwVYZnCBYtfRhjpXfqklu8xO19XgBtinX6WqRjrxdVyp6A/hGFBQABv9X6Pd/uAfiT6D5zneLxgzKSH7rZaurJlS0+gkkO7yV6TbNOkWvsCRZinOX6dyEy2rubaZxU4wAiJJlRFBQaGiRf12Hn6fYdsNY6W6KNe7D4BtGVSifi0ZKxrFRUVqquToPNYCsjiaUlKn8LsInDUhHhtAqkhk4g5bmExpNKPdtgYQml/d0w7OTTdUFkm6pzzmx+b5Q39kK7sMLtIJgSpHt8T6+++W8n07rWQ9S0wautwOFLCOHROBKm+WhnNlr7mVGyYOPAWodeCt5wimNyEij1yFF41Vp8HBgKLEGjfGJjEtqf8Rvqlqo98VuYbbN6673nCvo8WuKtMGLzaWPTDbOJQPjxKD3YlxCz7KELREdBi7YNLjqRUf8OSi+iQhzQjS5Qp2CJehLT+cbVPuW2j46d0EzkEoNh57LMYThOD74bgsaaii5hB2dSe9YcLCwLIC4nTku7I2ZDA132Unt9f3T9YJmr71AbnY6PfGB/zRqzOJsZJCdCzP/KMEoI1iao6s2dOt3x9SMElpnca08ofAJOhJeNtmOhq9uupOeDhyXH/lVA2jxlj+fv4QKwW5WtHl8sXwlpHT/kXO+aOzAQ3McNtAdy6GACICbhaQPy2uDRHY+TFQvs1uv/pbmCksa9h+dc+/ou/Ihk
 iCgTOIskM40pDbCxVgDf0m0DcRqtp2/7HnQS5R+LeFwK6n0OBqyKfOSM4=
Received: from [192.168.1.20] ([178.197.222.62])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a05600c4e4400b004100ad7d265sm1104330wmq.39.2024.02.09.08.05.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Feb 2024 08:05:48 -0800 (PST)
Message-ID: <e2e1490b-0e07-43ae-ab67-2efd6f21987e@linaro.org>
Date: Fri, 9 Feb 2024 17:05:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: display: bridge: add sam9x75-lvds
 compatible
Content-Language: en-US
To: Dharma.B@microchip.com, krzk@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 Manikandan.M@microchip.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux@armlinux.org.uk,
 Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@tuxon.dev, geert+renesas@glider.be, arnd@arndb.de,
 palmer@rivosinc.com, akpm@linux-foundation.org, gerg@linux-m68k.org,
 rdunlap@infradead.org, vbabka@suse.cz, linux-arm-kernel@lists.infradead.org
Cc: robh@kernel.org
References: <20240207102802.200220-1-dharma.b@microchip.com>
 <20240207102802.200220-2-dharma.b@microchip.com>
 <2219df60-7235-4c37-b79c-25e7225cb7a9@kernel.org>
 <b314e446-e79c-4fa0-9b86-c58fa96133bc@microchip.com>
 <c82a3843-1b58-46ea-994a-8350544aa30d@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <c82a3843-1b58-46ea-994a-8350544aa30d@microchip.com>
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

On 09/02/2024 16:02, Dharma.B@microchip.com wrote:
> On 09/02/24 7:50 pm, Dharma B wrote:
>> On 08/02/24 2:31 pm, Krzysztof Kozlowski wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know 
>>> the content is safe
>>>
>>> On 07/02/2024 11:27, Dharma Balasubiramani wrote:
>>>> Add the 'sam9x75-lvds' compatible binding, which describes the Low 
>>>> Voltage
>>>> Differential Signaling (LVDS) Controller found on some Microchip's 
>>>> sam9x7
>>>> series System-on-Chip (SoC) devices. This binding will be used to define
>>>> the properties and configuration for the LVDS Controller in DT.
>>>>
>>>> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
>>>
>>> Not tested...
>>>
>>> Please use scripts/get_maintainers.pl to get a list of necessary people
>>> and lists to CC. It might happen, that command when run on an older
>>> kernel, gives you outdated entries. Therefore please be sure you base
>>> your patches on recent Linux kernel.
>>>
>>> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
>>> people, so fix your workflow. Tools might also fail if you work on some
>>> ancient tree (don't, instead use mainline), work on fork of kernel
>>> (don't, instead use mainline) or you ignore some maintainers (really
>>> don't). Just use b4 and everything should be fine, although remember
>>> about `b4 prep --auto-to-cc` if you added new patches to the patchset.
>>>
>>> You missed at least devicetree list (maybe more), so this won't be
>>> tested by automated tooling. Performing review on untested code might be
>>> a waste of time.
>>
>> Apologies for the oversight, somehow it got missed.
> 
> The get_maintainer.pl seems to be inconsistent with the results.
> 
> linux$ ./scripts/get_maintainer.pl *patch | wc -l
> ./scripts/get_maintainer.pl: file '0000-cover-letter.patch' doesn't 
> appear to be a patch.  Add -f to options?
> 31
> linux$ ./scripts/get_maintainer.pl *patch | wc -l
> ./scripts/get_maintainer.pl: file '0000-cover-letter.patch' doesn't 
> appear to be a patch.  Add -f to options?
> 29
> linux$ ./scripts/get_maintainer.pl *patch | wc -l
> ./scripts/get_maintainer.pl: file '0000-cover-letter.patch' doesn't 
> appear to be a patch.  Add -f to options?
> 30
> linux$ ./scripts/get_maintainer.pl *patch | wc -l
> ./scripts/get_maintainer.pl: file '0000-cover-letter.patch' doesn't 
> appear to be a patch.  Add -f to options?
> 30

Why would you add 30 addresses, including many unrelated people, to the
cc-list? You must add only maintainers (so also reviewers) and mailing
lists.

Best regards,
Krzysztof

