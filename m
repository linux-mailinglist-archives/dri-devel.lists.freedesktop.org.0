Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B87FF828CF2
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 19:58:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B827410E50D;
	Tue,  9 Jan 2024 18:58:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9680710E50D
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 18:58:27 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-50e9e5c97e1so3773180e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jan 2024 10:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704826706; x=1705431506; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rgmCh2ekmuUXnKy6j0CsM91c8YxZihReaCB8lSs25HA=;
 b=hbeHcjNHC38eqwCfMe+baUlHjfDl1t8y/zadLoRGm6BTc6DTjQT6Jd6DP5SKlkziB1
 iNxb0t9pe2g+nRjpCM0+wqZCgQN5cLn6MtBN50RZlbnvAIf+VQ34qinAuzkWay8Z1Jic
 UJ7lVdkVW0ktw9vgkTKb45gwvtjMxFux3sZYH3rpZr0oFDY+VFFKq8EPE4SYh08wXkao
 eMGMFqqTvVUel+0pGPaN6MyyIaQEQEOpxRuLviZOcSlZvEUifxSKg05aPFJvCX5eCECT
 KwOrR24qW8Y7M9Sagnxr15hztPRfUeTPdt2TgeARU4uA06S1ja6pL1vSHakQqPZTbjoE
 L/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704826706; x=1705431506;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rgmCh2ekmuUXnKy6j0CsM91c8YxZihReaCB8lSs25HA=;
 b=hiht4U5WpROmvPp/TaCTr5uIJvdAOtDP788s23uZq53nGSJC4FzyIhgcuojfLalWFl
 JfT5MnnXEyMyC5wunMkZj9VlVS/0NuS89qgm7AWxHefN2kiswrl21L9t4+DjjqyAhPLI
 V7V5MwK4x2hUgczisB/GQ1PH9xMcmVCrmsnNrprT6JPdqxVVJEeqSGKw8m0VmTPTQEDX
 CP+1zNGgkBrKhFfhcJc6/ALbkLLUa3xQ3Mtw7dAvCLyaRGDGsC0CHIOezmQ9ysUDNSpL
 uKAGfp3+zw8PgZ3WTNsUH1mM4FQpisUbrjTZ+tdggjMt9GtB6F908iGPZgDlq8Ve9qn9
 8oKg==
X-Gm-Message-State: AOJu0YwNrY8Eq8eMdIArAbzWRT9wAMnJae5CmObfWl/2Y2Hte/HQm4DC
 EuvSJMlhC/1MIEwXGcGBEAzwpjZPAG296w==
X-Google-Smtp-Source: AGHT+IGlkHOAQE2+lOWLgxjKX7k8xSgdaVWFv4UBzhVDTaJKwfJdDqqIstqcDJYTgIYb0fSRcDnnrg==
X-Received: by 2002:a19:5e5d:0:b0:50e:b46f:4383 with SMTP id
 z29-20020a195e5d000000b0050eb46f4383mr2149227lfi.133.1704826705600; 
 Tue, 09 Jan 2024 10:58:25 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.112])
 by smtp.gmail.com with ESMTPSA id
 z14-20020a19650e000000b0050e7d22a9b8sm435713lfb.89.2024.01.09.10.58.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jan 2024 10:58:24 -0800 (PST)
Message-ID: <980a51fc-c410-46c3-bcb1-b82c33a88ef3@linaro.org>
Date: Tue, 9 Jan 2024 19:58:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 02/11] dt-bindings: gpu: Add PowerVR Series5 SGX
 GPUs
Content-Language: en-US
To: Andrew Davis <afd@ti.com>, Frank Binns <frank.binns@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>,
 "H . Nikolaus Schaller" <hns@goldelico.com>, Adam Ford <aford173@gmail.com>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, =?UTF-8?Q?Beno=C3=AEt_Cousson?=
 <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>, Paul Cercueil <paul@crapouillou.net>
References: <20240108183302.255055-1-afd@ti.com>
 <20240108183302.255055-3-afd@ti.com>
 <e68b3b0c-7a03-4771-b6e8-c1a263e31425@linaro.org>
 <c3664f43-431a-421f-8d2a-a3d2cc6f8777@ti.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <c3664f43-431a-421f-8d2a-a3d2cc6f8777@ti.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/01/2024 17:53, Andrew Davis wrote:
> On 1/9/24 5:32 AM, Krzysztof Kozlowski wrote:
>> On 08/01/2024 19:32, Andrew Davis wrote:
>>> The Imagination PowerVR Series5 "SGX" GPU is part of several SoCs from
>>> multiple vendors. Describe how the SGX GPU is integrated in these SoC,
>>> including register space and interrupts. Clocks, reset, and power domain
>>> information is SoC specific.
>>>
>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>> ---
>>>   .../bindings/gpu/img,powervr-sgx.yaml         | 124 ++++++++++++++++++
>>>   MAINTAINERS                                   |   1 +
>>>   2 files changed, 125 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/gpu/img,powervr-sgx.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-sgx.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-sgx.yaml
>>> new file mode 100644
>>> index 0000000000000..bb821e1184de9
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-sgx.yaml
>>> @@ -0,0 +1,124 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +# Copyright (c) 2023 Imagination Technologies Ltd.
>>
>> Your email has @TI domain, are you sure you attribute your copyrights to
>> Imagination?
>>
> 
> The file started as a copy/paste from a IMG copyrighted file, even
> though it is now almost completely re-written I've left their (c)
> for good measure. I'll add an additional TI (c).
> 
>> ...
>>
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  interrupts:
>>> +    maxItems: 1
>>> +
>>> +  clocks: true
>>
>> Missing min/maxItems
>>
> 
> These are set in the allOf/if/then blocks below, seems

I know, but we expect them here.

https://elixir.bootlin.com/linux/v5.19-rc6/source/Documentation/devicetree/bindings/clock/samsung,exynos7-clock.yaml#L57

> if I don't set them to at least something here then I get
> a warning:
> 
>     'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> even if I define them in the allOf block below. I don't
> know what the min/max should be until I check the compatible
> in the allOf block.

As always: the widest constraints.


...

> Logic in YAML always seems messy to me, here it is in pseudo C:
> 
> if (compatible == allwinner,sun6i-a31-gpu ||
>      compatible == ingenic,jz4780-gpu) {
> 	if (compatible == allwinner,sun6i-a31-gpu)
> 		clocks: ...
> 	if (compatible == ingenic,jz4780-gpu)
> 		clocks: ...
> 	required:
> 		- clocks
> 		- clock-names
> } else { /* disallow for all others */
> 	properties:
> 		clocks: false
> 		clock-names: false
> }

OK, I see, that's the limitation of YAML. The point is that this code is
not readable, so just list all fallbacks or variants.



Best regards,
Krzysztof

