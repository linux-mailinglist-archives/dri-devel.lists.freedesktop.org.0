Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 710CF80254D
	for <lists+dri-devel@lfdr.de>; Sun,  3 Dec 2023 17:06:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98A4410E08A;
	Sun,  3 Dec 2023 16:05:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A86B10E281
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Dec 2023 16:05:52 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a186e5d1056so482707566b.0
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Dec 2023 08:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701619551; x=1702224351; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OipUSxzsD6S96lKe3pW1Ij829Lf4+CHy2Zyn/H1QfkU=;
 b=Va44EBTwC2/bUSbvXMCRi5vOuuwchnnbhsGBrdwVG1E0P0m8CZ1MZyGOJgzqX3vIPM
 oNXLeMezHwZDhZ/6dd7Qz7s0uibVItCZNqo/bZJCScuVFAbhw4bMXmmWBR8wFSyaTx/i
 VJh6FqnIh0z7R5qHh1cWr9Asz4J90ZA3Bta5E+t7WX2Rzi1uldyjgYSguSMWmqqlA8lX
 FQ9bqmkNRQTjokClNPiDNNNdYKsnraVgWskkfQA5+uDMKxwAd8O48t5vQvPPDNjiuk6b
 t6xf7HCCd3tXmE1Ycb1fr6U4rOPGDy4YkJsohsHnHEtvG5UkpA07lsU1U1JMyi7/XlZ7
 MM3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701619551; x=1702224351;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OipUSxzsD6S96lKe3pW1Ij829Lf4+CHy2Zyn/H1QfkU=;
 b=qDEbx5PXaoezD1EAXDvrtnmkrKpMC+IFGuJR0vxi9NQsztBD/EWNqvsodd+PBMYKBv
 HcUPppPrc4mQjZ8fVkxyyYEv8plVgZDZCdyL1mGmg4n3VwfdZ2xlaZ99T3GqOCQyocjt
 fsSJjfD4AvZS/gEb/8Edg3kkjrSCJQW7v6zuBQ88rBlHbHSj9ulUgkJrVuih19xxqC1S
 4IoUWbmKkK/ZlbkzkhiZtYs3aKlFrjSRVEj6u5f39zBrt1FyM0x2ctLFQq0YOFhTF6Xs
 Iy6plbt1UXq31q07Kh2OAF0NtreY4mH5AQNKnrGPu5vuIscr6WOqYgqBjGLiod3PiD+N
 vmrw==
X-Gm-Message-State: AOJu0YxlTR+FKBzca29JYScg+bhrgbV7yvnj1wtWRphevYiyufEbjBEs
 UkmMQiUpwyvgUNQh0wILSw==
X-Google-Smtp-Source: AGHT+IGWEjoREz6AbM1QO1M7NbnNBqGeWAPmrFYVApnunoUDw4fGNyQWKE4A95j88C9iyPV6OhCmIA==
X-Received: by 2002:a17:906:4c:b0:a04:1f99:3b48 with SMTP id
 12-20020a170906004c00b00a041f993b48mr2632548ejg.74.1701619550620; 
 Sun, 03 Dec 2023 08:05:50 -0800 (PST)
Received: from ?IPV6:2a02:810b:f40:4300:3594:d4c7:658b:6ef7?
 ([2a02:810b:f40:4300:3594:d4c7:658b:6ef7])
 by smtp.gmail.com with ESMTPSA id
 fw15-20020a170906c94f00b009fca9484a62sm1011681ejb.200.2023.12.03.08.05.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Dec 2023 08:05:49 -0800 (PST)
Message-ID: <4dec2316-f840-44ab-a07a-3d7f0e5e6d8f@gmail.com>
Date: Sun, 3 Dec 2023 17:05:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] ARM: dts: rockchip: Add power-controller for RK3128
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
References: <20231202125144.66052-1-knaerzche@gmail.com>
 <6926340.F8r316W7xa@diego> <7a6eed43-477a-48a4-bd64-4528da920ffd@gmail.com>
 <4891026.6YUMPnJmAY@diego>
Content-Language: en-US
From: Alex Bee <knaerzche@gmail.com>
In-Reply-To: <4891026.6YUMPnJmAY@diego>
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

Am 02.12.23 um 18:46 schrieb Heiko Stübner:
> Hi Alex,
>
> Am Samstag, 2. Dezember 2023, 17:36:15 CET schrieb Alex Bee:
>> Am 02.12.23 um 16:51 schrieb Heiko Stübner:
>>> Am Samstag, 2. Dezember 2023, 13:51:41 CET schrieb Alex Bee:
>>>> Add power controller and qos nodes for RK3128 in order to use
>>>> them as powerdomains.
>>> does the power-domain controller work with the incomplete set of
>>> pm-domains too?
>> Yes, it does - the missing domains can request idle only and can't be
>> powered on/off - if no one requests idle they are just up all the time.
>>
>>> What I have in mind is
>>> - adding the power-controller node with the existing set of power-domains
>>> - the gpu pm-domain is in there
>>> - adding the gpu parts
>> My main concern about adding them later was the change of the ABI after
>> they've been exposed in the SoC DT. If that's not an issue - sure: I can
>> add them in a separate series.
> An ABI change would be _changing_ the domain-ids in the rk3128-power.h
> I think :-) .
Well, an addition is still a change.
> Right now the existing domain ids in the header are already exposed to the
> world, so someone could already use them, but not the new ones.

I'm fully aware that nothing would ever hard fail anywhere if the new 
domain ids get added later.

Nevertheless we start using here an ABI which is known to be incomplete. 
For no reason, as the patches (which I am now asked to remove from this 
series) for completion are already there (here).

Anyway, if you prefer it this way: I'm pleased to do so.

Alex

>
> Heiko
>
>>> And a second series with
>>> - patch1 from here
>>> - a dts patch adding the additional pm-domains to rk3128.dtsi
>>> - I guess patch1 also should be split into a patch adding the binding-ids
>>>     and a separate patch for the code addition.
>> Yeah, I noticed this also :)
>>
>> Regards,
>>
>> Alex
>>
>>>
>>> Heiko
>>>
>>>> Signed-off-by: Alex Bee <knaerzche@gmail.com>
>>>> ---
>>>>    arch/arm/boot/dts/rockchip/rk3128.dtsi | 101 +++++++++++++++++++++++++
>>>>    1 file changed, 101 insertions(+)
>>>>
>>>> diff --git a/arch/arm/boot/dts/rockchip/rk3128.dtsi b/arch/arm/boot/dts/rockchip/rk3128.dtsi
>>>> index 4e8b38604ecd..b72905db04f7 100644
>>>> --- a/arch/arm/boot/dts/rockchip/rk3128.dtsi
>>>> +++ b/arch/arm/boot/dts/rockchip/rk3128.dtsi
>>>> @@ -8,6 +8,7 @@
>>>>    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>>    #include <dt-bindings/interrupt-controller/irq.h>
>>>>    #include <dt-bindings/pinctrl/rockchip.h>
>>>> +#include <dt-bindings/power/rk3128-power.h>
>>>>    
>>>>    / {
>>>>    	compatible = "rockchip,rk3128";
>>>> @@ -133,6 +134,106 @@ smp-sram@0 {
>>>>    	pmu: syscon@100a0000 {
>>>>    		compatible = "rockchip,rk3128-pmu", "syscon", "simple-mfd";
>>>>    		reg = <0x100a0000 0x1000>;
>>>> +
>>>> +		power: power-controller {
>>>> +			compatible = "rockchip,rk3128-power-controller";
>>>> +			#power-domain-cells = <1>;
>>>> +			#address-cells = <1>;
>>>> +			#size-cells = <0>;
>>>> +
>>>> +			power-domain@RK3128_PD_VIO {
>>>> +				reg = <RK3128_PD_VIO>;
>>>> +				clocks = <&cru ACLK_CIF>,
>>>> +					 <&cru HCLK_CIF>,
>>>> +					 <&cru DCLK_EBC>,
>>>> +					 <&cru HCLK_EBC>,
>>>> +					 <&cru ACLK_IEP>,
>>>> +					 <&cru HCLK_IEP>,
>>>> +					 <&cru ACLK_LCDC0>,
>>>> +					 <&cru HCLK_LCDC0>,
>>>> +					 <&cru PCLK_MIPI>,
>>>> +					 <&cru ACLK_RGA>,
>>>> +					 <&cru HCLK_RGA>,
>>>> +					 <&cru ACLK_VIO0>,
>>>> +					 <&cru ACLK_VIO1>,
>>>> +					 <&cru HCLK_VIO>,
>>>> +					 <&cru HCLK_VIO_H2P>,
>>>> +					 <&cru DCLK_VOP>,
>>>> +					 <&cru SCLK_VOP>;
>>>> +				pm_qos = <&qos_ebc>,
>>>> +					 <&qos_iep>,
>>>> +					 <&qos_lcdc>,
>>>> +					 <&qos_rga>,
>>>> +					 <&qos_vip>;
>>>> +				#power-domain-cells = <0>;
>>>> +			};
>>>> +
>>>> +			power-domain@RK3128_PD_VIDEO {
>>>> +				reg = <RK3128_PD_VIDEO>;
>>>> +				clocks = <&cru ACLK_VDPU>,
>>>> +					 <&cru HCLK_VDPU>,
>>>> +					 <&cru ACLK_VEPU>,
>>>> +					 <&cru HCLK_VEPU>,
>>>> +					 <&cru SCLK_HEVC_CORE>;
>>>> +				pm_qos = <&qos_vpu>;
>>>> +				#power-domain-cells = <0>;
>>>> +			};
>>>> +
>>>> +			power-domain@RK3128_PD_GPU {
>>>> +				reg = <RK3128_PD_GPU>;
>>>> +				clocks = <&cru ACLK_GPU>;
>>>> +				pm_qos = <&qos_gpu>;
>>>> +				#power-domain-cells = <0>;
>>>> +			};
>>>> +
>>>> +			power-domain@RK3128_PD_CRYPTO {
>>>> +				reg = <RK3128_PD_CRYPTO>;
>>>> +				clocks = <&cru HCLK_CRYPTO>,
>>>> +					 <&cru SCLK_CRYPTO>;
>>>> +				pm_qos = <&qos_crypto>;
>>>> +				#power-domain-cells = <0>;
>>>> +			};
>>>> +		};
>>>> +	};
>>>> +
>>>> +	qos_crypto: qos@10128080 {
>>>> +		compatible = "rockchip,rk3128-qos", "syscon";
>>>> +		reg = <0x10128080 0x20>;
>>>> +	};
>>>> +
>>>> +	qos_gpu: qos@1012d000 {
>>>> +		compatible = "rockchip,rk3128-qos", "syscon";
>>>> +		reg = <0x1012d000 0x20>;
>>>> +	};
>>>> +
>>>> +	qos_vpu: qos@1012e000 {
>>>> +		compatible = "rockchip,rk3128-qos", "syscon";
>>>> +		reg = <0x1012e000 0x20>;
>>>> +	};
>>>> +
>>>> +	qos_rga: qos@1012f000 {
>>>> +		compatible = "rockchip,rk3128-qos", "syscon";
>>>> +		reg = <0x1012f000 0x20>;
>>>> +	};
>>>> +
>>>> +	qos_ebc: qos@1012f080 {
>>>> +		compatible = "rockchip,rk3128-qos", "syscon";
>>>> +		reg = <0x1012f080 0x20>;
>>>> +	};
>>>> +
>>>> +	qos_iep: qos@1012f100 {
>>>> +		compatible = "rockchip,rk3128-qos", "syscon";
>>>> +		reg = <0x1012f100 0x20>;
>>>> +	};
>>>> +
>>>> +	qos_lcdc: qos@1012f180 {
>>>> +		compatible = "rockchip,rk3128-qos", "syscon";
>>>> +		reg = <0x1012f180 0x20>;
>>>> +	};
>>>> +
>>>> +	qos_vip: qos@1012f200 {
>>>> +		compatible = "rockchip,rk3128-qos", "syscon";
>>>> +		reg = <0x1012f200 0x20>;
>>>>    	};
>>>>    
>>>>    	gic: interrupt-controller@10139000 {
>>>>
>>>
>>>
>
>
>
