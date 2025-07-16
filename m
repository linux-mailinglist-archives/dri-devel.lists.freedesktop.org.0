Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91856B06B37
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 03:39:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D6C10E719;
	Wed, 16 Jul 2025 01:39:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="QAuzT6Lq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1192 seconds by postgrey-1.36 at gabe;
 Wed, 16 Jul 2025 01:39:02 UTC
Received: from mail-m19731101.qiye.163.com (mail-m19731101.qiye.163.com
 [220.197.31.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9394110E734
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 01:39:02 +0000 (UTC)
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-2-entmail-virt205.gy.ntes
 [58.22.7.114]) by smtp.qiye.163.com (Hmail) with ESMTP id 1c21ae026;
 Wed, 16 Jul 2025 09:38:51 +0800 (GMT+08:00)
Message-ID: <91933881-e91e-4e3f-a027-1a28a30823ed@rock-chips.com>
Date: Wed, 16 Jul 2025 09:38:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: rockchip: rk3399-evb-ind: Add support for
 DisplayPort
To: Krzysztof Kozlowski <krzk@kernel.org>, Chaoyi Chen <kernel@airkyi.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20250715112456.101-1-kernel@airkyi.com>
 <20250715112456.101-6-kernel@airkyi.com>
 <c62d168b-92b5-44a2-9a9a-402d7f4815a2@kernel.org>
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <c62d168b-92b5-44a2-9a9a-402d7f4815a2@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQklOSlYeGE9NHU5DGE4eHk1WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCS0
 NVSktLVUpCWQY+
X-HM-Tid: 0a9810e26b8b03abkunm2384780b142b984
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PiI6Vjo4SDEzQgk3TgsMCwMQ
 Mj0wC1FVSlVKTE5JTUlCQk9LTUtNVTMWGhIXVRgTGhQCElUYEx4VOwkUGBBWGBMSCwhVGBQWRVlX
 WRILWUFZTkNVSUlVTFVKSk9ZV1kIAVlBSEJITTcG
DKIM-Signature: a=rsa-sha256;
 b=QAuzT6LqqsdRYzbgiQV0dzdyntiVHNrp/6t4TvOeZeNboxwtNUTzyldzugRxbhjyKOZ8NlArNywxKchxXvUB4wm/zoE9KD7sZsPgRwe0l9DPt4qQm7qka21rrg6UUIf7MziMjtmBrwi7GvrXQG91QQYTnAdRN0D9i1vZOrsBPi4=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=hOSQSL8Ks5IN7rF3LDLzamVst2rGAcbD12z6Zr7VP7c=;
 h=date:mime-version:subject:message-id:from;
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

Hi Krzysztof,

On 2025/7/15 19:37, Krzysztof Kozlowski wrote:
> On 15/07/2025 13:24, Chaoyi Chen wrote:
>>   /dts-v1/;
>> +#include <dt-bindings/usb/pd.h>
>>   #include "rk3399.dtsi"
>>   
>>   / {
>> @@ -19,6 +20,16 @@ chosen {
>>   		stdout-path = "serial2:1500000n8";
>>   	};
>>   
>> +	vbus_typec: vbus-typec-regulator {
> use consistent naming. How other regulators are called? foo-regulator?

Will fix in v2.


>
>> +		compatible = "regulator-fixed";
>> +		enable-active-high;
>> +		gpio = <&gpio1 RK_PC2 GPIO_ACTIVE_HIGH>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&vcc5v0_typec0_en>;
>> +		regulator-name = "vbus_typec";
>> +		vin-supply = <&vcc5v0_sys>;
>> +	};
>> +
>>   	vcc5v0_sys: regulator-vcc5v0-sys {
>>   		compatible = "regulator-fixed";
>>   		enable-active-high;
>> @@ -29,6 +40,16 @@ vcc5v0_sys: regulator-vcc5v0-sys {
>>   		regulator-max-microvolt = <5000000>;
>>   		regulator-min-microvolt = <5000000>;
>>   	};
>> +
>> +	sound: sound {
>> +		compatible = "rockchip,rk3399-gru-sound";
>> +		rockchip,cpu = <&i2s0 &spdif>;
>> +	};
>> +};
>> +
>> +&cdn_dp {
>> +	status = "okay";
>> +	phys = <&tcphy0_dp>;
>>   };
>>   
>>   &cpu_b0 {
>> @@ -341,6 +362,66 @@ regulator-state-mem {
>>   	};
>>   };
>>   
>> +&i2c4 {
>> +	i2c-scl-rising-time-ns = <475>;
>> +	i2c-scl-falling-time-ns = <26>;
>> +	status = "okay";
>> +
>> +	usbc0: fusb302@22 {
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

Thank you for the explanation. Will fix in v2.


>
>
>> +		compatible = "fcs,fusb302";
>> +		reg = <0x22>;
>> +		interrupt-parent = <&gpio1>;
>> +		interrupts = <RK_PA2 IRQ_TYPE_LEVEL_LOW>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&usbc0_int>;
>> +		vbus-supply = <&vbus_typec>;
>> +		status = "okay";
> Why? What disabled it?

Oh, that is redundant. Will drop it in v2.


>
>> +
>> +		usb_con: connector {
>> +			compatible = "usb-c-connector";
>> +			label = "USB-C";
> Best regards,
> Krzysztof
>
>
