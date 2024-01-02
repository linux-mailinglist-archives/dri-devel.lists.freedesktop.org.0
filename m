Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D398222E2
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jan 2024 22:06:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B56610E151;
	Tue,  2 Jan 2024 21:06:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 582 seconds by postgrey-1.36 at gabe;
 Tue, 02 Jan 2024 21:06:35 UTC
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B77D10E151
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jan 2024 21:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 To: Subject: MIME-Version: Date: Message-ID; q=dns/txt; s=fe-e1b5cab7be;
 t=1704229590; bh=ccZgqPCrJ4T9GeS8WnNP4L0gon1xZyOTx7zhUGDzNNc=;
 b=eFzGEsrO52gXxlMzfgMof2sxoX4fCcXgcCH5lTQoL7Ur1WuKOiYvb3hTGCLDX61O9FvCV+FnE
 +tyf3t77ltZGcEvX1HMb96oo5JnhqsermjAR1qJRAsIOtSdXWDg3k56ACM7P8oUy0n5WnYUZCpL
 /lcbAfZXvl4/E8psq0EEm0xuheEzicAcd/f2BEnPOF7+w3LaRiMuQ8aOjfnXUxnWgBYkOgS/NYb
 Kk3D35c1gOXFaYT3ncnP4bwrsWBbg+qICuUWGFXGQJi4RWjrWqn1K2GRQ8hxj9BfSFsdnvxk2Ka
 MNnatrnSIThDosL00MGi3fq1xWmRaR1kyDjwWLn9HXMg==
Message-ID: <903e9d0c-a00c-4214-9f0e-dd676b13b428@kwiboo.se>
Date: Tue, 2 Jan 2024 21:56:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: rockchip: Add devicetree for Pine64
 PineTab2
Content-Language: en-US
To: "=?UTF-8?Q?Ond=C5=99ej_Jirman?=" <megi@xff.cz>, Manuel Traut
 <manut@mecka.net>, Neil Armstrong <neil.armstrong@linaro.org>, Jessica
 Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>, Mark
 Yao <markyao0591@gmail.com>, Diederik de Haas <didi.debian@cknow.org>,
 Segfault <awarnecke002@hotmail.com>, Arnaud Ferraris
 <aferraris@debian.org>, Danct12 <danct12@riseup.net>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20240102-pinetab2-v3-0-cb1aa69f8c30@mecka.net>
 <20240102-pinetab2-v3-4-cb1aa69f8c30@mecka.net>
 <775vjfucu2g2s6zzeutj7f7tapx3q2geccpxvv4ppcms4hxbq7@cbrdmlu2ryzp>
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <775vjfucu2g2s6zzeutj7f7tapx3q2geccpxvv4ppcms4hxbq7@cbrdmlu2ryzp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 6594787c1cdb56bea851e248
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

Hi Manuel and Ondřej,

On 2024-01-02 19:07, Ondřej Jirman wrote:
> Hello Manuel,

[...]

>> +
>> +&sfc {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&fspi_dual_io_pins>;
>> +	status = "okay";
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +
>> +	flash@0 {
>> +		compatible = "jedec,spi-nor";
>> +		reg = <0>;
>> +		spi-max-frequency = <24000000>;
> 
> That's a bit on the low side. The flash chip should work for all commands up to
> 80MHz https://megous.com/dl/tmp/b428ad9b85ac4633.png and SGM3157YC6 switch
> for the FSPI-CLK should have high enough bandwidth, too.

I agree that this is a little bit on the low side, it was a safe rate
that I used for U-Boot. U-Boot required an exact rate of the supported
sfc clk rates: 24, 50, 75, 100, 125 or 150 MHz.

Please also note that the SPI NOR flash chip used in PineTab2 is not a
GigaDevice GD25LQ128E, it should be a SiliconKaiser SK25LP128, same as
found in the Pine64 PinePhone Pro.

> 
>> +		spi-rx-bus-width = <2>;
> 
> GD25LQ128E supports quad I/O. Maybe try 4 if it will work.

The schematic only shows fspi D0 and D1 connected, and use the D2 line
for eMMC_RSTn, so spi-rx-bus-width = <2> should be correct.

> 
>> +		spi-tx-bus-width = <1>;
>> +	};
>> +};
>> +

Regards,
Jonas
