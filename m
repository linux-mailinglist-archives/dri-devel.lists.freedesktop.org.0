Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB689822F81
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 15:29:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BFD010E2AF;
	Wed,  3 Jan 2024 14:29:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 586 seconds by postgrey-1.36 at gabe;
 Wed, 03 Jan 2024 14:29:41 UTC
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B957E10E29B
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 14:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1704292177;
 bh=3c19w6vY1jyD7/GphZNPpueD7bdTp6aOk8Eg2b52Ujc=;
 b=Xrq0Li2sjqXcku2XaYiiNc5heFhqZS//6TLn7xnizKKiycvIw/3+QYvTxhS4L8NhwMXPLg+qO
 2N/QgV45tZ/gyB0IAEElbf6hH7HSN9xmEHFo5doZUxwhyDaJHIoRCWR9SwLvCJ8ESSVn6GE0vwG
 3D5ircwEP1u16m08e0C3D/brAPuvmQq//C+AAwxGewUGD79e0aLEBtV16l9KrFFZIgBvLNS1eMN
 udAs6/fCQG5snFaNRecymBBUjTiw5gJfwJv3Knq+WEQ9EqPH3vs9wAYaLDcV2IIC5oI2KfzVlRS
 ZQpgbggvIwuZH5XGjvGp5x8h+cNXx8CyZ3V9CurfQP3A==
Message-ID: <6efe305c-4ab4-43c1-ab6d-64bdf1d81a2f@kwiboo.se>
Date: Wed, 3 Jan 2024 15:19:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: rockchip: Add devicetree for Pine64
 PineTab2
Content-Language: en-US
To: Manuel Traut <manut@mecka.net>
References: <20240102-pinetab2-v3-0-cb1aa69f8c30@mecka.net>
 <20240102-pinetab2-v3-4-cb1aa69f8c30@mecka.net>
 <775vjfucu2g2s6zzeutj7f7tapx3q2geccpxvv4ppcms4hxbq7@cbrdmlu2ryzp>
 <903e9d0c-a00c-4214-9f0e-dd676b13b428@kwiboo.se> <ZZVjzwgANJMdHnuo@mecka.net>
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <ZZVjzwgANJMdHnuo@mecka.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 65956cf5cdaacf2fcbc351f3
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
Cc: Diederik de Haas <didi.debian@cknow.org>, Danct12 <danct12@riseup.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-rockchip@lists.infradead.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Yao <markyao0591@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Segfault <awarnecke002@hotmail.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megi@xff.cz>,
 Arnaud Ferraris <aferraris@debian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Manuel,

On 2024-01-03 14:40, Manuel Traut wrote:
> Hi Jonas and Ondřej,
> 
>>>> +&sfc {
>>>> +	pinctrl-names = "default";
>>>> +	pinctrl-0 = <&fspi_dual_io_pins>;
>>>> +	status = "okay";
>>>> +	#address-cells = <1>;
>>>> +	#size-cells = <0>;
>>>> +
>>>> +	flash@0 {
>>>> +		compatible = "jedec,spi-nor";
>>>> +		reg = <0>;
>>>> +		spi-max-frequency = <24000000>;
>>>
>>> That's a bit on the low side. The flash chip should work for all commands up to
>>> 80MHz https://megous.com/dl/tmp/b428ad9b85ac4633.png and SGM3157YC6 switch
>>> for the FSPI-CLK should have high enough bandwidth, too.
>>
>> I agree that this is a little bit on the low side, it was a safe rate
>> that I used for U-Boot. U-Boot required an exact rate of the supported
>> sfc clk rates: 24, 50, 75, 100, 125 or 150 MHz.
>>
>> Please also note that the SPI NOR flash chip used in PineTab2 is not a
>> GigaDevice GD25LQ128E, it should be a SiliconKaiser SK25LP128, same as
>> found in the Pine64 PinePhone Pro.
> 
> The schematics for v2.0 reference a GD25LQ128EWIGR. I never checked the jedec
> id. How did you retrieve this information, or is it maybe a difference in v0.1
> and 2.0?

This was when working on mainline U-Boot for the PineTab2 (and other
rk356x devices). See [1] for a pending U-Boot patch that is waiting on a
proper mainline linux devicetree for the PT2.

The JEDEC ID is reported as 0x257018 on my v2.0 production unit, and
does not match the JEDEC ID for GD25LQ128E (0xc86018) referenced in
the schematics.

I found that the JEDEC ID 0x257018 was referenced in prior patches
related to the SK25LP128 SPI NOR flash chip used in Pine64 PinePhone Pro.

I have only ever tested the 24 MHz rate, but I am expecting that e.g.
100 MHz also should work. Will not be able to test on my PT2 until at
earliest next week.

[1] https://github.com/Kwiboo/u-boot-rockchip/commit/66562d6eaf2c11a9f97fcdba379d3ceda8aa70ef

Regards,
Jonas

> 
>>>> +		spi-rx-bus-width = <2>;
>>>
>>> GD25LQ128E supports quad I/O. Maybe try 4 if it will work.
>>
>> The schematic only shows fspi D0 and D1 connected, and use the D2 line
>> for eMMC_RSTn, so spi-rx-bus-width = <2> should be correct.
> 
> ack
> 
> Since it is only needed for bootloader updates and environment its maybe better
> to stay on the safe side?
> 
> But I can test faster frequency if you want me to do..
> 
> Regards
> Manuel

