Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5C18038AC
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 16:23:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71C6210E0AD;
	Mon,  4 Dec 2023 15:23:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E212A10E0AD
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 15:23:29 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-54bf9a54fe3so5877591a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 07:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701703408; x=1702308208; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mxYp/TPj2SDljkx7akhBocUojf/1bHbrDV2kmdKcuiw=;
 b=XGTLD10VlecrHtKK5uKHrXMwkJ2mFrulWv8KqQocOCkeZGxSy2wGZnqd7hrfB6fLGQ
 Utfihq3ZF7TOe0UdX6YEu2vSUvFgQXScouy2Jc+s0H6K+/pGPHJgNwrio1HIEWKAzL4H
 1fK9RpJqQm3ilC+bvQDpZ5XU3ZMQ6io/zK20qBN5In23TGj0vRE3aIhUkdQr9URTwP0z
 HEVfjeBUc5kG0qRXK6r1c3ljJd7pklhDMFNt8Y4LlbOW+qJTuvgavdX2L18JmItnFBSv
 EAH9dzRvUJb70TDtOv3+mSjG1R0GFYDm7wb275L6UWx7i0zrwn6y1cX+YwcaWp3sbmV+
 Uadg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701703408; x=1702308208;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mxYp/TPj2SDljkx7akhBocUojf/1bHbrDV2kmdKcuiw=;
 b=prF02oprXrxC7xABOGjRaN/POGKztdRcqBVIJmetZ7gbe9HFblIy4ZQgoJZCclTE6R
 h3+HFCBHbJtU5Wzo4+RuHMGihgruJDUp7tlCZxHIIKSqvkt+XFFji6UBHtoLwIcXNy9g
 OiTk4RvH9fXz74Xdu3YfVwooh58FLCx6Kaagj7b69EPPigcDQ9EeI5Ygri0F2Avrdvs1
 o7A/m79X0pLr1x+cjjnSRa09OKS7vlk/SOLMszk9J10WjTFdJAjOYk8hyiIYon/hln81
 OBLfuODHQNvt08aQijdRqSoo73jErWr1V1NiPUEhegYvAtEFKoljQnF+r69et/P1nWaQ
 JfQA==
X-Gm-Message-State: AOJu0YyLILFe/bQYmwEVS4i3VR+g6APWiiJ6p7c59CtbhhAgU4B4f7+h
 1YlTclYN7nLT1J/1olplWw==
X-Google-Smtp-Source: AGHT+IH6NaMxB0hD8p+w4THyQqPHgLUhFhYRDIhCfbDi49ieB3DqkYaAbCCN/8DRLm52i+pnC1Tesg==
X-Received: by 2002:a17:907:2daa:b0:a19:a1ba:8cc2 with SMTP id
 gt42-20020a1709072daa00b00a19a1ba8cc2mr3994784ejc.96.1701703407956; 
 Mon, 04 Dec 2023 07:23:27 -0800 (PST)
Received: from ?IPV6:2a02:810b:f40:4300:55ff:210b:5393:c9d7?
 ([2a02:810b:f40:4300:55ff:210b:5393:c9d7])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a170906bc4700b00a0f78db91c3sm5416316ejv.95.2023.12.04.07.23.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Dec 2023 07:23:27 -0800 (PST)
Message-ID: <e58f5aa5-a4d4-4334-a7ff-aa139ec7166f@gmail.com>
Date: Mon, 4 Dec 2023 16:23:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] ARM: dts: rockchip: Add power-controller for RK3128
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
References: <20231202125144.66052-1-knaerzche@gmail.com>
 <4891026.6YUMPnJmAY@diego> <4dec2316-f840-44ab-a07a-3d7f0e5e6d8f@gmail.com>
 <9588573.jRhZ6ZUK3Y@diego>
Content-Language: en-US
From: Alex Bee <knaerzche@gmail.com>
In-Reply-To: <9588573.jRhZ6ZUK3Y@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Heiko,

Am 03.12.23 um 17:42 schrieb Heiko Stübner:
> Hi Alex,
>
> Am Sonntag, 3. Dezember 2023, 17:05:47 CET schrieb Alex Bee:
>> Am 02.12.23 um 18:46 schrieb Heiko Stübner:
>>> Am Samstag, 2. Dezember 2023, 17:36:15 CET schrieb Alex Bee:
>>>> Am 02.12.23 um 16:51 schrieb Heiko Stübner:
>>>>> Am Samstag, 2. Dezember 2023, 13:51:41 CET schrieb Alex Bee:
>>>>>> Add power controller and qos nodes for RK3128 in order to use
>>>>>> them as powerdomains.
>>>>> does the power-domain controller work with the incomplete set of
>>>>> pm-domains too?
>>>> Yes, it does - the missing domains can request idle only and can't be
>>>> powered on/off - if no one requests idle they are just up all the time.
>>>>
>>>>> What I have in mind is
>>>>> - adding the power-controller node with the existing set of power-domains
>>>>> - the gpu pm-domain is in there
>>>>> - adding the gpu parts
>>>> My main concern about adding them later was the change of the ABI after
>>>> they've been exposed in the SoC DT. If that's not an issue - sure: I can
>>>> add them in a separate series.
>>> An ABI change would be _changing_ the domain-ids in the rk3128-power.h
>>> I think :-) .
>> Well, an addition is still a change.
>>> Right now the existing domain ids in the header are already exposed to the
>>> world, so someone could already use them, but not the new ones.
>> I'm fully aware that nothing would ever hard fail anywhere if the new
>> domain ids get added later.
>>
>> Nevertheless we start using here an ABI which is known to be incomplete.
>> For no reason, as the patches (which I am now asked to remove from this
>> series) for completion are already there (here).
>>
>> Anyway, if you prefer it this way: I'm pleased to do so.
> I was more thinking of accelerating the gpu-part of the series, as that
> really is just waiting for the power-domain node that already has driver
> support and domain-ids present.
>
> It looks like you're feeling more strongly about that though, so I'll
> definitly not pressure you ;-) .

I'm really not insisting on this - I just didn't understand why you 
would want this. And honestly I haven't considered merging timeline as 
an argument.

So sure: Let's get the low hanging fruits merged for 6.8. Having the 
power domains in the DT will also help for my upcoming hdmi / vop series.

Alex

>
> But I guess the split into IDs and driver change should still be
> done, especially as the dt-binding-header likely will want an Ack
> from the DT maintainers.
>
> And the power-domain change will go through the new pmdomain
> subsystem.
>
>
> Heiko
>
>
>>>>> And a second series with
>>>>> - patch1 from here
>>>>> - a dts patch adding the additional pm-domains to rk3128.dtsi
>>>>> - I guess patch1 also should be split into a patch adding the binding-ids
>>>>>      and a separate patch for the code addition.
>>>> Yeah, I noticed this also :)
>>>>
>>>> Regards,
>>>>
>>>> Alex
>>>>
>>>>> Heiko
>>>>>
>>>>>> Signed-off-by: Alex Bee <knaerzche@gmail.com>
>>>>>> ---
>>>>>>     arch/arm/boot/dts/rockchip/rk3128.dtsi | 101 +++++++++++++++++++++++++
>>>>>>     1 file changed, 101 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm/boot/dts/rockchip/rk3128.dtsi b/arch/arm/boot/dts/rockchip/rk3128.dtsi
>>>>>> index 4e8b38604ecd..b72905db04f7 100644
>>>>>> --- a/arch/arm/boot/dts/rockchip/rk3128.dtsi
>>>>>> +++ b/arch/arm/boot/dts/rockchip/rk3128.dtsi
>>>>>> @@ -8,6 +8,7 @@
>>>>>>     #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>>>>     #include <dt-bindings/interrupt-controller/irq.h>
>>>>>>     #include <dt-bindings/pinctrl/rockchip.h>
>>>>>> +#include <dt-bindings/power/rk3128-power.h>
>>>>>>     
>>>>>>     / {
>>>>>>     	compatible = "rockchip,rk3128";
>>>>>> @@ -133,6 +134,106 @@ smp-sram@0 {
>>>>>>     	pmu: syscon@100a0000 {
>>>>>>     		compatible = "rockchip,rk3128-pmu", "syscon", "simple-mfd";
>>>>>>     		reg = <0x100a0000 0x1000>;
>>>>>> +
>>>>>> +		power: power-controller {
>>>>>> +			compatible = "rockchip,rk3128-power-controller";
>>>>>> +			#power-domain-cells = <1>;
>>>>>> +			#address-cells = <1>;
>>>>>> +			#size-cells = <0>;
>>>>>> +
>>>>>> +			power-domain@RK3128_PD_VIO {
>>>>>> +				reg = <RK3128_PD_VIO>;
>>>>>> +				clocks = <&cru ACLK_CIF>,
>>>>>> +					 <&cru HCLK_CIF>,
>>>>>> +					 <&cru DCLK_EBC>,
>>>>>> +					 <&cru HCLK_EBC>,
>>>>>> +					 <&cru ACLK_IEP>,
>>>>>> +					 <&cru HCLK_IEP>,
>>>>>> +					 <&cru ACLK_LCDC0>,
>>>>>> +					 <&cru HCLK_LCDC0>,
>>>>>> +					 <&cru PCLK_MIPI>,
>>>>>> +					 <&cru ACLK_RGA>,
>>>>>> +					 <&cru HCLK_RGA>,
>>>>>> +					 <&cru ACLK_VIO0>,
>>>>>> +					 <&cru ACLK_VIO1>,
>>>>>> +					 <&cru HCLK_VIO>,
>>>>>> +					 <&cru HCLK_VIO_H2P>,
>>>>>> +					 <&cru DCLK_VOP>,
>>>>>> +					 <&cru SCLK_VOP>;
>>>>>> +				pm_qos = <&qos_ebc>,
>>>>>> +					 <&qos_iep>,
>>>>>> +					 <&qos_lcdc>,
>>>>>> +					 <&qos_rga>,
>>>>>> +					 <&qos_vip>;
>>>>>> +				#power-domain-cells = <0>;
>>>>>> +			};
>>>>>> +
>>>>>> +			power-domain@RK3128_PD_VIDEO {
>>>>>> +				reg = <RK3128_PD_VIDEO>;
>>>>>> +				clocks = <&cru ACLK_VDPU>,
>>>>>> +					 <&cru HCLK_VDPU>,
>>>>>> +					 <&cru ACLK_VEPU>,
>>>>>> +					 <&cru HCLK_VEPU>,
>>>>>> +					 <&cru SCLK_HEVC_CORE>;
>>>>>> +				pm_qos = <&qos_vpu>;
>>>>>> +				#power-domain-cells = <0>;
>>>>>> +			};
>>>>>> +
>>>>>> +			power-domain@RK3128_PD_GPU {
>>>>>> +				reg = <RK3128_PD_GPU>;
>>>>>> +				clocks = <&cru ACLK_GPU>;
>>>>>> +				pm_qos = <&qos_gpu>;
>>>>>> +				#power-domain-cells = <0>;
>>>>>> +			};
>>>>>> +
>>>>>> +			power-domain@RK3128_PD_CRYPTO {
>>>>>> +				reg = <RK3128_PD_CRYPTO>;
>>>>>> +				clocks = <&cru HCLK_CRYPTO>,
>>>>>> +					 <&cru SCLK_CRYPTO>;
>>>>>> +				pm_qos = <&qos_crypto>;
>>>>>> +				#power-domain-cells = <0>;
>>>>>> +			};
>>>>>> +		};
>>>>>> +	};
>>>>>> +
>>>>>> +	qos_crypto: qos@10128080 {
>>>>>> +		compatible = "rockchip,rk3128-qos", "syscon";
>>>>>> +		reg = <0x10128080 0x20>;
>>>>>> +	};
>>>>>> +
>>>>>> +	qos_gpu: qos@1012d000 {
>>>>>> +		compatible = "rockchip,rk3128-qos", "syscon";
>>>>>> +		reg = <0x1012d000 0x20>;
>>>>>> +	};
>>>>>> +
>>>>>> +	qos_vpu: qos@1012e000 {
>>>>>> +		compatible = "rockchip,rk3128-qos", "syscon";
>>>>>> +		reg = <0x1012e000 0x20>;
>>>>>> +	};
>>>>>> +
>>>>>> +	qos_rga: qos@1012f000 {
>>>>>> +		compatible = "rockchip,rk3128-qos", "syscon";
>>>>>> +		reg = <0x1012f000 0x20>;
>>>>>> +	};
>>>>>> +
>>>>>> +	qos_ebc: qos@1012f080 {
>>>>>> +		compatible = "rockchip,rk3128-qos", "syscon";
>>>>>> +		reg = <0x1012f080 0x20>;
>>>>>> +	};
>>>>>> +
>>>>>> +	qos_iep: qos@1012f100 {
>>>>>> +		compatible = "rockchip,rk3128-qos", "syscon";
>>>>>> +		reg = <0x1012f100 0x20>;
>>>>>> +	};
>>>>>> +
>>>>>> +	qos_lcdc: qos@1012f180 {
>>>>>> +		compatible = "rockchip,rk3128-qos", "syscon";
>>>>>> +		reg = <0x1012f180 0x20>;
>>>>>> +	};
>>>>>> +
>>>>>> +	qos_vip: qos@1012f200 {
>>>>>> +		compatible = "rockchip,rk3128-qos", "syscon";
>>>>>> +		reg = <0x1012f200 0x20>;
>>>>>>     	};
>>>>>>     
>>>>>>     	gic: interrupt-controller@10139000 {
>>>>>>
>>>>>
>>>
>>>
>
>
>
