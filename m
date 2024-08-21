Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1551295A816
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 01:22:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C53410E00C;
	Wed, 21 Aug 2024 23:22:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=cristian.ciocaltea@collabora.com header.b="altrLWij";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E85A910E00C
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 23:22:35 +0000 (UTC)
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724282547; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Z1kZ70M4AQmqO7ocFJ25E+U8KlGI+1YGZQuOSHbE+herSdaGkz/f7z4/tC0fl0o39rhCteScmhgD7aUvAtKwNB1ANnoewVtYnDkg6YatHgzcCMr+LRIvsa1TMYSYNTXacAfOTpfOiMILUqnPK/+dpje8ZSHKw5+mB97nlHaxb68=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1724282547;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=+ZBYReoU+D/75zzzqj2C41bM7dDfvJWCGG/dMUABDks=; 
 b=Z8xZ7vC82HSlrjbUdckzLb5Eo4EQr/TrWO1AjJlThgkyVRdWPK2koaU8j0UY8lfQamXDs1pdJJY9Z6cM6a39jxaP2M5qhmJ1pvkMUFAhh6ifAU/fa5whmVCEbA/O/PHehiunIfBpDHn2L02X7ibO6weWaQz/c/gQ9tGM3o4sYVs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=cristian.ciocaltea@collabora.com;
 dmarc=pass header.from=<cristian.ciocaltea@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724282547; 
 s=zohomail; d=collabora.com; i=cristian.ciocaltea@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=+ZBYReoU+D/75zzzqj2C41bM7dDfvJWCGG/dMUABDks=;
 b=altrLWijDDpGZiuNratl8pK6bSmLCgb+5lDP011AAJS5Y88O4stCpBrk6zFZ5Pqo
 8w5SyYzOeXGSrGzG3CeqWtE8pmhKp9azUpZPp4pdcnC3KuGcExyokfhR5L1GFPF1tb3
 /xD2fMYdnontTLWsU+iQlBpCnXh5WKBHpB6cbheY=
Received: by mx.zohomail.com with SMTPS id 1724282544339506.061756257801;
 Wed, 21 Aug 2024 16:22:24 -0700 (PDT)
Message-ID: <2085e998-a453-4893-9e80-3be68b0fb13d@collabora.com>
Date: Thu, 22 Aug 2024 02:22:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] dt-bindings: display: rockchip: Add schema for
 RK3588 HDMI TX Controller
To: Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Mark Yao <markyao0591@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 kernel@collabora.com, Alexandre ARNOUD <aarnoud@me.com>,
 Luis de Arquer <ldearquer@gmail.com>
References: <20240819-b4-rk3588-bridge-upstream-v4-0-6417c72a2749@collabora.com>
 <20240819-b4-rk3588-bridge-upstream-v4-3-6417c72a2749@collabora.com>
 <20240819-bobbing-purplish-99e48baa2304@spud>
 <ec84bc0b-c4c2-4735-9f34-52bc3a852aaf@collabora.com>
 <20240820-tropics-hunchback-6fdcd0b37f91@spud>
 <038073d0-d4b9-4938-9a51-ea2aeb4530f6@collabora.com>
 <20240821-evoke-mop-fb09ceef3597@spud>
 <5813cea2-4890-4fa9-8826-19be5bf3e161@collabora.com>
 <20240821-stretch-scam-09d7adc08a4c@spud>
 <7E8109D4-A353-4FE3-9152-3C3C6CB7D634@sntech.de>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Content-Language: en-US
In-Reply-To: <7E8109D4-A353-4FE3-9152-3C3C6CB7D634@sntech.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

On 8/22/24 12:38 AM, Heiko Stuebner wrote:
> 
> 
> Am 21. August 2024 23:28:55 MESZ schrieb Conor Dooley <conor@kernel.org>:
>> Cristian, Heiko,
>>
>> On Wed, Aug 21, 2024 at 11:38:01PM +0300, Cristian Ciocaltea wrote:
>>> On 8/21/24 6:07 PM, Conor Dooley wrote:
>>>> On Tue, Aug 20, 2024 at 11:12:45PM +0300, Cristian Ciocaltea wrote:
>>>>> On 8/20/24 7:14 PM, Conor Dooley wrote:
>>>>>> On Tue, Aug 20, 2024 at 03:37:44PM +0300, Cristian Ciocaltea wrote:
>>>>>>> On 8/19/24 7:53 PM, Conor Dooley wrote:
>>>>>>>> On Mon, Aug 19, 2024 at 01:29:30AM +0300, Cristian Ciocaltea wrote:
>>>>>>>>> +  rockchip,grf:
>>>>>>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>>>>>>>> +    description:
>>>>>>>>> +      Most HDMI QP related data is accessed through SYS GRF regs.
>>>>>>>>> +
>>>>>>>>> +  rockchip,vo1-grf:
>>>>>>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>>>>>>>> +    description:
>>>>>>>>> +      Additional HDMI QP related data is accessed through VO1 GRF regs.
>>>>>>>>
>>>>>>>> Why are these required? What prevents you looking up the syscons by
>>>>>>>> compatible?
>>>>>>>
>>>>>>> That is for getting the proper instance:
>>>>>>
>>>>>> Ah, that makes sense. I am, however, curious why these have the same
>>>>>> compatible when they have different sized regions allocated to them.
>>>>>
>>>>> Good question, didn't notice.  I've just checked the TRM and, in both
>>>>> cases, the maximum register offset is within the 0x100 range.  Presumably
>>>>> this is nothing but an inconsistency, as the syscons have been added in
>>>>> separate commits.
>>>>
>>>> Is that TRM publicly available? I do find it curious that devices sound
>>>> like they have different contents have the same compatible. In my view,
>>>> that is incorrect and they should have unique compatibles if the
>>>> contents (and therefore the programming model) differs.
>>>
>>> Don't know if there's an official location to get it from, but a quick
>>> search on internet shows a few repos providing them, e.g. [1].
>>>
>>> Comparing "6.14 VO0_GRF Register Description" at pg. 777 with "6.15 VO1_GRF
>>> Register Description" at pg. 786 (from Part1) reveals the layout is mostly
>>> similar, with a few variations though.
>>
>> Page references and everything, thank you very much. I don't think those
>> two GRFs should have the same compatibles, they're, as you say, similar
>> but not identical. Seems like a bug to me!
>>
>> Heiko, what do you think?
> 
> Yes, while the register names sound similar, looking at the bit
> definitions this evening revealed that they handle vastly different
> settings.
> 
> So I guess we should fix the compatibles. They are all about graphics
> stuff and HDMI actually is the first output, so right now WE can at least
> still claim the no-users joker ;-)

I couldn't find any driver doing a lookup for them by compatible, so I
think it's fine to fix them - should we go for "rockchip,rk3588-vo0-grf" and
"rockchip,rk3588-vo1-grf", respectively?

vo0_grf seems to be used by the usbdp phy nodes:

    usbdp_phy0: phy@fed80000 {
        compatible = "rockchip,rk3588-usbdp-phy";
        [...]
        rockchip,vo-grf = <&vo0_grf>;
        [...]

Same for "usbdp_phy1: phy@fed90000".

While vo1_grf is present in:

    vop: vop@fdd90000 {
        compatible = "rockchip,rk3588-vop";
        [...]
        rockchip,vo1-grf = <&vo1_grf>;
        [...]

I guess it's too late to drop them while updating the related drivers
accordingly, hence I wonder if we should keep using the phandles for this
HDMI thing as well, for consistency reasons.

Thanks,
Cristian

> Heiko
> 
>>
>>> [1] https://github.com/FanX-Tek/rk3588-TRM-and-Datasheet
>>>
>>>>>
>>>>>>> 	vo0_grf: syscon@fd5a6000 {
>>>>>>> 		compatible = "rockchip,rk3588-vo-grf", "syscon";
>>>>>>> 		reg = <0x0 0xfd5a6000 0x0 0x2000>;
>>>>>>> 		clocks = <&cru PCLK_VO0GRF>;
>>>>>>> 	};
>>>>>>>
>>>>>>> 	vo1_grf: syscon@fd5a8000 {
>>>>>>> 		compatible = "rockchip,rk3588-vo-grf", "syscon";
>>>>>>> 		reg = <0x0 0xfd5a8000 0x0 0x100>;
>>>>>>> 		clocks = <&cru PCLK_VO1GRF>;
>>>>>>> 	};
>>>>
> 
