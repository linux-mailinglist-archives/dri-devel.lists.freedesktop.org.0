Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4FA9E4BA9
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 02:13:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D8C710E377;
	Thu,  5 Dec 2024 01:13:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="WISiTRVX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m1973170.qiye.163.com (mail-m1973170.qiye.163.com
 [220.197.31.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4A1110E377
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 01:13:38 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 4bd352ea;
 Thu, 5 Dec 2024 09:13:33 +0800 (GMT+08:00)
Message-ID: <42035ebe-09b7-4005-912a-8ec72d5dabcc@rock-chips.com>
Date: Thu, 5 Dec 2024 09:13:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v1 04/10] phy: phy-rockchip-samsung-hdptx: Add support for
 eDP mode
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org,
 cristian.ciocaltea@collabora.com, l.stach@pengutronix.de,
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com,
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20241127075157.856029-1-damon.ding@rock-chips.com>
 <2131853.KlZ2vcFHjT@diego>
 <6e1f35c0-5ea8-414f-b3ea-4e7222c605ef@rock-chips.com>
 <2886747.Y6S9NjorxK@diego>
 <h4giob7bcrh7qmtepti6huym2llw4ujfmeff76vrgpahb5zy6x@dz6zghsifww5>
 <2342f342-672c-447e-90d8-674b748af6a4@rock-chips.com>
 <abzu2chif2g3urxoqbm3gbe6cciexbmqvn44qezrx4hgllfkkn@7bzi5jl3stqe>
Content-Language: en-US
In-Reply-To: <abzu2chif2g3urxoqbm3gbe6cciexbmqvn44qezrx4hgllfkkn@7bzi5jl3stqe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU9KGVZKQ0xMHUgfSBoaSkJWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
 NVSktLVUpCS0tZBg++
X-HM-Tid: 0a93946120e103a3kunm4bd352ea
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6KxQ6Gio*LTIoPwgsQxQ0MBIp
 HU4aFB1VSlVKTEhISE1KSUpOSE1PVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFDTkxDNwY+
DKIM-Signature: a=rsa-sha256;
 b=WISiTRVXtAaRWpgjq9W3YiO1ccva6uGhJR5I55wb5jjk+7wL5cmCiXq8LSmI6luTAGZJJIA0Taa3iYC+zAV32L1jHVfqsTJvVDLBcs676kw51sHKnI6yu6FUvD0S/qRkAQpLLmNcLoJcQw4o1rv5Eh7Xs6VLjqsf+MpB1JnwefA=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=8qvutCjvz03YvJgS0BHFHA7ySObcGdDLiuBFsNcLkEg=;
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

Hi Sebastian,

On 2024/12/2 22:41, Sebastian Reichel wrote:
> Hi,
> 
> On Mon, Dec 02, 2024 at 11:28:13AM +0800, Damon Ding wrote:
>> Hi,
>>
>> On 2024/12/2 6:59, Sebastian Reichel wrote:
>>> Hi,
>>>
>>> On Sat, Nov 30, 2024 at 09:25:12PM +0100, Heiko Stübner wrote:
>>>> Am Freitag, 29. November 2024, 03:43:57 CET schrieb Damon Ding:
>>>>> On 2024/11/27 19:04, Heiko Stübner wrote:
>>>>>> Am Mittwoch, 27. November 2024, 12:00:10 CET schrieb Damon Ding:
>>>>>>> On 2024/11/27 17:29, Heiko Stübner wrote:
>>>>>>>> Am Mittwoch, 27. November 2024, 08:51:51 CET schrieb Damon Ding:
>>>>>>>>> +static int rk_hdptx_phy_set_mode(struct phy *phy, enum phy_mode mode,
>>>>>>>>> +				 int submode)
>>>>>>>>> +{
>>>>>>>>> +	return 0;
>>>>>>>>> +}
>>>>>>>> analogix_dp_phy_power_on
>>>>>>>> I think it might make sense to go the same way as the DCPHY and also
>>>>>>>> naneng combophy, to use #phy-cells = 1 to select the phy-mode via DT .
>>>>>>>>
>>>>>>>> See [0] for Sebastians initial suggestion regarding the DC-PHY.
>>>>>>>> The naneng combophy already uses that scheme of mode-selection too.
>>>>>>>>
>>>>>>>> There is of course the issue of backwards-compatibility, but that can be
>>>>>>>> worked around in the binding with something like:
>>>>>>>>
>>>>>>>>      '#phy-cells':
>>>>>>>>         enum: [0, 1]
>>>>>>>>         description: |
>>>>>>>>           If #phy-cells is 0, PHY mode is set to PHY_TYPE_HDMI
>>>>>>>>           If #phy-cells is 1 mode is set in the PHY cells. Supported modes are:
>>>>>>>>             - PHY_TYPE_HDMI
>>>>>>>>             - PHY_TYPE_DP
>>>>>>>>           See include/dt-bindings/phy/phy.h for constants.
>>>>>>>>
>>>>>>>> PHY_TYPE_HDMI needs to be added to include/dt-bindings/phy/phy.h
>>>>>>>> but PHY_TYPE_DP is already there.
>>>>>>>>
>>>>>>>> That way we would standardize on one form of accessing phy-types
>>>>>>>> on rk3588 :-) .
>>>>>>>>
>>>>>>>> Also see the Mediatek CSI rx phy doing this too already [1]
>>>>>>>>
>>>>>>>>
>>>>>>>> Heiko
>>>>>>>>
>>>>>>>> [0] https://lore.kernel.org/linux-rockchip/udad4qf3o7kt45nuz6gxsvsmprh4rnyfxfogopmih6ucznizih@7oj2jrnlfonz/
>>>>>>>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml
>>>>>>>>
>>>>>>>
>>>>>>> It is really a nice way to separate HDMI and DP modes.
>>>>>
>>>>> I apologize for reopening the discussion about the phy-types setting.
>>>>
>>>> there is definitly no need to apologize. We're trying to find the best
>>>> solution afterall :-) .
>>>>
>>>>> With the .set_mode() of struct phy_ops, the HDMI and eDP dynamic
>>>>> switching can be achieved, which just depends on the right setting of
>>>>> enum phy_mode in include/linux/phy/phy.h. So the previous way of
>>>>> configuring phy mode may be also good.
>>>>
>>>> I think the deciding factor is, is there a use-case for needing to switch
>>>> modes at runtime.
>>>>
>>>> I do think the mode for the dc-phy and also the hdptx-phy is pretty much
>>>> decided by the board design.
>>>>
>>>> I.e. when you end up in a DP-connector (or eDP-panel) on your board you
>>>> need DP mode, and when you end up in a hdmi-connector you need the
>>>> HDMI phy mode.
>>>>
>>>> So I think the phy-mode for the hdptx-phy is largely dictated by the static
>>>> board definition (like devicetree), hence going with the dt-argument for
>>>> the mode.
>>>>
>>>> Like similar to the Naneng combophy, selecting its mode via argument
>>>> because deciding if it ends up in a sata port is a board-design thing.
>>>>
>>>> Is there a use-case where you need to switch at runtime between
>>>> HDMI and eDP? Like starting the phy in eDP mode but then needing
>>>> to switch to HDMI mode, while the device is running?
>>
>> Indeed, we have the board as you described, on which the DP-connector and
>> HDMI-connector both have been configured.
>>
>> And the dynamic switching is more useful for RK3576, which has the same
>> eDP/HDMI design as RK3588 but only one eDP controller/HDMI controller/HDPTX
>> phy. We can only enable both of eDP/HDMI by this way.
>>
>>>
>>> I believe the eDP controller can only use the PHY in eDP mode and
>>> the HDMI controller can only use it in HDMI mode. So in order to
>>> support runtime switching, the following options are possible:
>>>
>>> 1. Enable both controllers, the PHY decides which one is really
>>>      used, the other one is basically a non-functional dummy device
>>>      until the PHY is reconfigured. This requires the set_mode()
>>>      callback, since the HDMI and eDP drivers both expect their
>>>      PHY to be enabled.
>>>
>>> 2. Properly enable / disable the used controller, so that only one
>>>      controller is active at the same time. In this case the switching
>>>      is handled one layer above and the PHY has nothing to do with it.
>>>      The phy_enable call from each controller would just set it up in
>>>      the right mode.
>>>
>>> I guess option 1 is the hacked solution, which is easier to
>>> implement as DRM's hotplug abilities are quite limited at the moment
>>> as far as I know. I think the second solution looks much cleaner and
>>> should be prefered for upstream. That solution does not require
>>> calling set_mode() for runtime switching making this whole argument
>>> void :)
>>>
>>
>> Your friendly and detailed analysis has brought me some valuable insights.
>> :)
>>
>> The option 2 is really a better way to support the dynamic switching, and we
>> still need the .set_mode() to select the configurations for either eDP or
>> HDMI in HDPTX phy at the controller level. Would you mind
>> elaborating on the useful way to choose the phy mode for the second
>> solution?
> 
> The xlate function to handle the arguments is called when the PHY
> device is looked up. So the devm_phy_get(dp->dev, "dp") call in
> analogix_dp_probe() would setup the PHY in DP mode.
> 
> Similarily the call to devm_of_phy_get_by_index() in
> dw_hdmi_qp_rockchip_bind() would set the PHY in HDMI mode.
> 
> So the PHY mode is correct as long as only one controller driver
> is bound at the same time.
> 

Firstly, the term "the HDMI and eDP dynamic switching" can be somewhat 
misleading, because the eDP usually does not support hot plug. The 
RK3588 eDP is often used as DP, and it actually supports DP 1.2. 
Therefore, it is better to use the "the HDMI and DP dynamic switching" 
description.

Indeed, the devm_phy_get(dp->dev, "dp") and devm_of_phy_get_by_index() 
will help to get the phy reference in .probe() or .bind().

However, the phy_set_mode() may be still needed in the HDMI and DP 
dynamic switching application scenarios. We need the enum phy_mode 
PHY_MODE_DP/PHY_MODE_HDMI to differentiate the configuration processes 
in .power_on(), .power_off() and .configure() of struct phy_ops, which 
will be called in conjunction with plugging in and unplugging an HDMI or 
DP cable.

Therefore, I believe we should retain the .set_mode() function.

> Greetings,
> 
> -- Sebastian
> 
>>> FWIW I think the DT argument based mode setting and the runtime set_mode
>>> are not necessarily mutual exclusive. In theory one could support both
>>> and adding set_mode support later does not change any ABI as far as
>>> I can see. Basically handle it like pin mux/configuration settings,
>>> which are usually automatically handled by the device core based on
>>> DT information, except for some drivers which have special needs.
>>>
>>
>>>>> And other phys may want to support dynamic switching too, like the
>>>>> Rockchip USBDP combo phy.
>>>>
>>>> I guess USBDP is special in that in also does both modes dynamical
>>>> depending on its use (like type-c with option DP altmode)
>>>
>>> The USBDP PHY is indeed quite different from the PHYs in your list
>>> above, but for a different reason: All the combined PHYs you listed
>>> above only support one mode at the same time. E.g. you need to
>>> decide between PCIe, SATA and USB3 mode for the Naneng combophy.
>>>
>>> For the USBDP PHY the modes are not mutually exclusive. The USB
>>> controller can request the USBDP PHY in USB mode at the same time
>>> as the DP controller requests it in DP mode. Some additional
>>> registers configure how the lanes are being muxed. A typcial setup
>>> would be 2 lanes for USB3 and 2 lanes for DP.
>>>
>>> Greetings,
>>>
>>> -- Sebastian
>>
>> Best regards,
>> Damon
>>

Best regards,
Damon
