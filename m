Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC8F8FCA45
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 13:20:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70E0610E780;
	Wed,  5 Jun 2024 11:20:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="jdysX0/4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B7410E772
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 11:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1717586407;
 bh=PwQ4nkZTr13w8UmaT1MKqhoIOXEfRekN9y/JnHclfHg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jdysX0/4ybigksWBmqW//DS7kvXK9T6TJtlC12uc9ncXxCRwkj94WL/YGMZ3yI8yS
 cJSXO8PRfPYaH9PLkcypJ5Yk0LwdDq0mFjAKGGuMKJl1iNwumAWABsIa/38t7X9wA6
 Xg0rrmyxAo1I4+BzVymWmRvH1ayicWsyK1T7p5HrJAaV++FGn+88CBcvqVPuzZPie2
 u714gEXpF9+naABQI5EqL8w6d8KVvs0/kQLDNOezF3ivl83InzkOPbY4BWdzgpKemm
 JMHZU+ivgCir23aBkMui6jFnw8WxUrFyRPiu7c2zmeXrdT+DWn/IVYckYMWQDXr13g
 DNyBFclf4uQdQ==
Received: from [100.115.223.179] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id A23DC3781139;
 Wed,  5 Jun 2024 11:20:05 +0000 (UTC)
Message-ID: <d17341c2-3f97-41d6-8125-bff838149798@collabora.com>
Date: Wed, 5 Jun 2024 14:20:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/14] Add initial support for the Rockchip RK3588 HDMI TX
 Controller
To: Andy Yan <andyshrk@163.com>, Maxime Ripard <mripard@kernel.org>
Cc: neil.armstrong@linaro.org, Heiko Stuebner <heiko@sntech.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sandy Huang <hjc@rock-chips.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Mark Yao <markyao0591@gmail.com>,
 Andy Yan <andy.yan@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 kernel@collabora.com, Alexandre ARNOUD <aarnoud@me.com>,
 Luis de Arquer <ldearquer@gmail.com>, Algea Cao <algea.cao@rock-chips.com>
References: <20240601-b4-rk3588-bridge-upstream-v1-0-f6203753232b@collabora.com>
 <a4b22708-e85d-448a-8145-244b49bca053@linaro.org>
 <ab0a6372-091b-4293-8907-a4b3ff4845c0@rock-chips.com>
 <11359776.NyiUUSuA9g@phil> <ef60403f-078f-411a-867b-9b551e863f56@linaro.org>
 <b8066150-c147-4eb6-9f7a-2bd0268c274e@collabora.com>
 <4456bc5a.9b2d.18fe7b76790.Coremail.andyshrk@163.com>
 <01bde68a-88a7-46eb-860c-1375aa730bec@linaro.org>
 <20240605-logical-piculet-of-democracy-6bc732@houat>
 <6328b7e5.a1dd.18fe7ce019d.Coremail.andyshrk@163.com>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Content-Language: en-US
In-Reply-To: <6328b7e5.a1dd.18fe7ce019d.Coremail.andyshrk@163.com>
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

On 6/5/24 12:49 PM, Andy Yan wrote:
> 
> Hi,
> At 2024-06-05 17:39:48, "Maxime Ripard" <mripard@kernel.org> wrote:
>> On Wed, Jun 05, 2024 at 11:28:41AM GMT, neil.armstrong@linaro.org wrote:
>>> Hi,
>>>
>>> On 05/06/2024 11:25, Andy Yan wrote:
>>>>
>>>> Hi,
>>>>
>>>> At 2024-06-05 04:33:57, "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com> wrote:
>>>>> On 6/3/24 4:08 PM, neil.armstrong@linaro.org wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On 03/06/2024 15:03, Heiko Stuebner wrote:
>>>>>>> Am Montag, 3. Juni 2024, 14:14:17 CEST schrieb Andy Yan:
>>>>>>>> Hi Neil:
>>>>>>>>
>>>>>>>> On 6/3/24 16:55, Neil Armstrong wrote:
>>>>>>>>> Hi Christian,
>>>>>>>>>
>>>>>>>>> On 01/06/2024 15:12, Cristian Ciocaltea wrote:
>>>>>>>>>> The RK3588 SoC family integrates a Quad-Pixel (QP) variant of the
>>>>>>>>>> Synopsys DesignWare HDMI TX controller used in the previous SoCs.
>>>>>>>>>>
>>>>>>>>>> It is HDMI 2.1 compliant and supports the following features, among
>>>>>>>>>> others:
>>>>>>>>>>
>>>>>>>>> .
>>>>>>>>>
>>>>>>>>> ..
>>>>>>>>>
>>>>>>>>>> * SCDC I2C DDC access
>>>>>>>>>> * TMDS Scrambler enabling 2160p@60Hz with RGB/YCbCr4:4:4
>>>>>>>>>> * YCbCr4:2:0 enabling 2160p@60Hz at lower HDMI link speeds
>>>>>>>>>> * Multi-stream audio
>>>>>>>>>> * Enhanced Audio Return Channel (EARC)
>>>>>>>>> -> Those features were already supported by the HDMI 2.0a compliant
>>>>>>>>> HW, just
>>>>>>>>> list the _new_ features for HDMI 2.1
>>>>>>>>>
>>>>>>>>> I did a quick review of your patchset and I don't understand why you
>>>>>>>>> need
>>>>>>>>> to add a separate dw-hdmi-qp.c since you only need simple variants
>>>>>>>>> of the I2C
>>>>>>>>> bus, infoframe and bridge setup.
>>>>>>>>>
>>>>>>>>> Can you elaborate further ? isn't this Quad-Pixel (QP) TX controller
>>>>>>>>> version
>>>>>>>>> detectable at runtime ?
>>>>>>>>>
>>>>>>>>> I would prefer to keep a single dw-hdmi driver if possible.
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>> The QP HDMI controller is a completely different variant with totally
>>>>>>>> different
>>>>>>>> registers layout, see PATCH 13/14.
>>>>>>>> I think make it a separate driver will be easier for development and
>>>>>>>> maintenance.
>>>>>>>
>>>>>>> I'm with Andy here. Trying to navigate a driver for two IP blocks really
>>>>>>> sounds taxing especially when both are so different.
>>>>>
>>>>> Thank you all for the valuable feedback!
>>>>>
>>>>>> I agree, I just wanted more details than "variant of the
>>>>>> Synopsys DesignWare HDMI TX controller", if the register mapping is 100%
>>>>>> different, and does not match at all with the old IP, then it's indeed time
>>>>>> to make a brand new driver, but instead of doing a mix up, it's time to
>>>>>> extract
>>>>>> the dw-hdmi code that could be common helpers into a dw-hdmi-common module
>>>>>> and use them.
>>>>>
>>>>> Sounds good, will handle this in v2.
>>>>>
>>>>>> As I see, no "driver" code can be shared, only DRM plumbings, so perhaps
>>>>>> those
>>>>>> plumbing code should go into the DRM core ?
>>>>>>
>>>>>> In any case, please add more details on the cover letter, including the
>>>>>> detailed
>>>>>> HW differrence and the design you chose so support this new IP.
>>>>>
>>>>> Andy, could you please help with a summary of the HW changes?
>>>>> The information I could provide is rather limited, since I don't have
>>>>> access to any DW IP datasheets and I'm also not familiar enough with the
>>>>> old variant.
>>>>>
>>>>   Accurately, we should refer to it as an entirely new IP，it has nothing in common with
>>>> the current mainline dw-hdmi。 The only  commonality is that they both come from
>>>> Synopsys DesignWare：
>>>> （1）It has a 100% different register mapping
>>>> （2）It supports FRL and DSC
>>>> （3）different configuration flow in many places。
>>>>
>>>> So I have the same feeling with Heiko and Maxime：
>>>> The DW_HDMI_QP should have a  separate driver and with it's  own CONFIG  such as DRM_DW_HDMI_QP  in Kconfig.
>>>> and the rockchip part should also be split from dw_hdmi-rockchip.c.
>>>> I am sorry we mixed them in dw_hdmi-rockchip.c when we develop the bsp driver，but we really regretted this decision
>>>> when  we repeatedly broke compatibility with dw-hdmi on other socs。
>>>
>>> Yes please, and as I say, if there's code common with the old dw-hdmi, please add a common
>>> module if this code can't be moved in core bridge helpers.
>>
>> And chances are that the common code is actually there to deal with HDMI
>> spec itself and not really the hardware, which is solved by moving both
>> drivers to the HDMI helpers that just got merged.

I will make use of the new HDMI helpers and see if there is anything
else remaining in terms of common code.

> Yes, +1.
> I don't think we need to share some common code with dw-hdmi here.

Ok, I will completely separate the new driver's code, including the
Rockchip glue layer.

Thanks,
Cristian
