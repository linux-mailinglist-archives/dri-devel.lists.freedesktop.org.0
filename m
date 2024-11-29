Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DCD9DBEBD
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 03:44:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4657310ECBD;
	Fri, 29 Nov 2024 02:44:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="bL/N3Unq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m3279.qiye.163.com (mail-m3279.qiye.163.com
 [220.197.32.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EE6010ECBD
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 02:44:02 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 42b18083;
 Fri, 29 Nov 2024 10:43:57 +0800 (GMT+08:00)
Message-ID: <6e1f35c0-5ea8-414f-b3ea-4e7222c605ef@rock-chips.com>
Date: Fri, 29 Nov 2024 10:43:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/10] phy: phy-rockchip-samsung-hdptx: Add support for
 eDP mode
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 rfoss@kernel.org, vkoul@kernel.org, sebastian.reichel@collabora.com,
 cristian.ciocaltea@collabora.com, l.stach@pengutronix.de,
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com,
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20241127075157.856029-1-damon.ding@rock-chips.com>
 <4260470.1IzOArtZ34@diego>
 <8df0acc8-b7aa-453f-b55c-30144f51d7cf@rock-chips.com>
 <2131853.KlZ2vcFHjT@diego>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <2131853.KlZ2vcFHjT@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0seTVZOHUxJTx1MQh8eT0lWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZS1VLVUtVS1kG
X-HM-Tid: 0a9375cdbbee03a3kunm42b18083
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pk06MTo5DzIoFSEqNTY2LAo6
 Iz0KCj1VSlVKTEhJQ09DSUhCTU5MVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFITk9LNwY+
DKIM-Signature: a=rsa-sha256;
 b=bL/N3Unq55qSkA26JYoRtN15Zz23QknxZHD/t3byhVLAxtGQaDu8Vi0Y838Nayz2QgaE46cZpnKAmZ/I0Q41VPh89kl26riBDRD6ePNIsmUD9gvj5luW7GmvLFlikXGeWmb033lk9ZmjxL6Ht8auxKsmbc/UY9vu1VhuKgKFw88=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=kpe86r9iOvjOisEL0baYQ/8aMf7jHymtGoN0ZQJx9H0=;
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

Hi Heiko,

On 2024/11/27 19:04, Heiko Stübner wrote:
> Hi Damon,
> 
> Am Mittwoch, 27. November 2024, 12:00:10 CET schrieb Damon Ding:
>> Hi Heiko:
>>
>> On 2024/11/27 17:29, Heiko Stübner wrote:
>>> Hi Damon,
>>>
>>> Am Mittwoch, 27. November 2024, 08:51:51 CET schrieb Damon Ding:
>>>> Add basic support for RBR/HBR/HBR2 link rates, and the voltage swing and
>>>> pre-emphasis configurations of each link rate have been verified according
>>>> to the eDP 1.3 requirements.
>>>>
>>>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>>> ---
>>>
>>> [ ... huge block of DP phy support ...]
>>>
>>> yes that block was huge, but I also don't see a way to split that up in a
>>> useful way, so it should be fine.
>>>
>>
>> As for the huge block of DP phy support, I will try to use the existing
>> rk_hdptx_multi_reg_write() to set regs in next version, maybe the way
>> can make the codes more concise.
> 
> I actually did like the the dp-side of the phy code.
> 
> That you need to add all the DP stuff can't be helped and I actually find
> real functions nicer than having anonymous register writes.
> 
> I.e. the hdmi-side with its register lists does write "magic" values to
> registers.
> 
> So personally I'd just leave the dp-functions as is please, until someone
> does complain (I was not trying to complain, just mentioned why I cut
> it from the reply :-) )
> 
> 
> Thanks
> Heiko
> 
> 
>>>> +static int rk_hdptx_phy_set_mode(struct phy *phy, enum phy_mode mode,
>>>> +				 int submode)
>>>> +{
>>>> +	return 0;
>>>> +}
>>>
>>> I think it might make sense to go the same way as the DCPHY and also
>>> naneng combophy, to use #phy-cells = 1 to select the phy-mode via DT .
>>>
>>> See [0] for Sebastians initial suggestion regarding the DC-PHY.
>>> The naneng combophy already uses that scheme of mode-selection too.
>>>
>>> There is of course the issue of backwards-compatibility, but that can be
>>> worked around in the binding with something like:
>>>
>>>    '#phy-cells':
>>>       enum: [0, 1]
>>>       description: |
>>>         If #phy-cells is 0, PHY mode is set to PHY_TYPE_HDMI
>>>         If #phy-cells is 1 mode is set in the PHY cells. Supported modes are:
>>>           - PHY_TYPE_HDMI
>>>           - PHY_TYPE_DP
>>>         See include/dt-bindings/phy/phy.h for constants.
>>>
>>> PHY_TYPE_HDMI needs to be added to include/dt-bindings/phy/phy.h
>>> but PHY_TYPE_DP is already there.
>>>
>>> That way we would standardize on one form of accessing phy-types
>>> on rk3588 :-) .
>>>
>>> Also see the Mediatek CSI rx phy doing this too already [1]
>>>
>>>
>>> Heiko
>>>
>>> [0] https://lore.kernel.org/linux-rockchip/udad4qf3o7kt45nuz6gxsvsmprh4rnyfxfogopmih6ucznizih@7oj2jrnlfonz/
>>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml
>>>
>>
>> It is really a nice way to separate HDMI and DP modes.

I apologize for reopening the discussion about the phy-types setting.

With the .set_mode() of struct phy_ops, the HDMI and eDP dynamic 
switching can be achieved, which just depends on the right setting of
enum phy_mode in include/linux/phy/phy.h. So the previous way of 
configuring phy mode may be also good.

And other phys may want to support dynamic switching too, like the 
Rockchip USBDP combo phy.

>>
>>>
>>>
>>>
>>>
>>
>> Best regards,
>> Damon
>>
>>
> 
> 
> 
> 
> 
> 
Best regards,
Damon
