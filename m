Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6747A18E7A
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 10:38:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF2410E21E;
	Wed, 22 Jan 2025 09:37:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="cz1XtlH0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m49227.qiye.163.com (mail-m49227.qiye.163.com
 [45.254.49.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB1010E21E
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 09:37:58 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 9675abc2;
 Wed, 22 Jan 2025 17:37:54 +0800 (GMT+08:00)
Message-ID: <ba369b98-9a2a-421a-9251-4db3c1dcedd9@rock-chips.com>
Date: Wed, 22 Jan 2025 17:37:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/20] drm/rockchip: analogix_dp: Add support to get
 panel from the DP AUX bus
From: Damon Ding <damon.ding@rock-chips.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org,
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, andy.yan@rock-chips.com, hjc@rock-chips.com,
 algea.cao@rock-chips.com, kever.yang@rock-chips.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
References: <20250109032725.1102465-1-damon.ding@rock-chips.com>
 <20250109032725.1102465-13-damon.ding@rock-chips.com>
 <d7zpv6qt52mhny54dejw4yqlp2k2c437op7qmepqe27pufplqk@64xvohrz7h2q>
 <330041c4-aaee-4b41-8ccd-e2807415c709@rock-chips.com>
Content-Language: en-US
In-Reply-To: <330041c4-aaee-4b41-8ccd-e2807415c709@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUhIGlYZTUxCGBgaSUtMTE5WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
 NVSktLVUpCS0tZBg++
X-HM-Tid: 0a948d601d8703a3kunm9675abc2
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OBQ6CQw5FjISDi8qFTpKNx88
 OAwaFDdVSlVKTEhMTkhDTUxOQkxOVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJQkpINwY+
DKIM-Signature: a=rsa-sha256;
 b=cz1XtlH0WFZV+qfxxgiKI+00+Zhi4vQtANGA9k2JuGnZ9MA5lXD1IKZQY2QU84VWYgvk7IK3u/T3JDDNjjtVXFFs07czupDXqcJOFSRfEhZ6JNmukR2pw1uYdVCsXnRhH7J8jzkP0dQH2H82JAriqKTgAktE/gx4t2jvBYHeh/Y=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=CWIxW9kTl68Z5+0J5bhE6cyWfkVb0EOPaTfIzuCrrMI=;
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

Hi Dmitry,

On 2025/1/22 16:17, Damon Ding wrote:
> Hi Dmitry,
> 
> On 2025/1/9 20:48, Dmitry Baryshkov wrote:
>> On Thu, Jan 09, 2025 at 11:27:17AM +0800, Damon Ding wrote:
>>> Move drm_of_find_panel_or_bridge() a little later and combine it with
>>> component_add() into a new function rockchip_dp_link_panel(). The 
>>> function
>>> will serve as done_probing() callback of devm_of_dp_aux_populate_bus(),
>>> aiding to support for obtaining the eDP panel via the DP AUX bus.
>>>
>>> If failed to get the panel from the DP AUX bus, it will then try the 
>>> other
>>> way to get panel information through the platform bus.
>>>
>>> In addition, use dev_err() instead of drm_err() in rockchip_dp_poweron()
>>> , which will be called before rockchip_dp_bind().
>>>
>>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>>
>>> ---
>>>
>>> Changes in v4:
>>> - Use done_probing() to call drm_of_find_panel_or_bridge() and
>>>    component_add() when getting panel from the DP AUX bus
>>>
>>> Changes in v5:
>>> - Use the functions exported by the Analogix side to get the pointers of
>>>    struct analogix_dp_plat_data and struct drm_dp_aux.
>>> - Use dev_err() instead of drm_err() in rockchip_dp_poweron().
>>>
>>> ---
>>>   .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 41 ++++++++++++++-----
>>>   1 file changed, 30 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/ 
>>> drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>>> index 0957d3c5d31d..3ae01b870f49 100644
>>> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>>> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>>> @@ -124,13 +124,13 @@ static int rockchip_dp_poweron(struct 
>>> analogix_dp_plat_data *plat_data)
>>>       ret = clk_prepare_enable(dp->pclk);
>>>       if (ret < 0) {
>>> -        drm_err(dp->drm_dev, "failed to enable pclk %d\n", ret);
>>> +        dev_err(dp->dev, "failed to enable pclk %d\n", ret);
>>
>>
>> why?
>>
> 
> The &rockchip_dp_device.drm_dev will be assigned in rockchip_dp_bind(), 
> which is called after probing process. The PM operations have been 
> advanced to the probing for the AUX transmission, so the dev_err() may 
> be better than drm_err().
> 

Using drm_...() uniformly may be better [0].

>>>           return ret;
>>>       }
>>>       ret = rockchip_dp_pre_init(dp);
>>>       if (ret < 0) {
>>> -        drm_err(dp->drm_dev, "failed to dp pre init %d\n", ret);
>>> +        dev_err(dp->dev, "failed to dp pre init %d\n", ret);
>>>           clk_disable_unprepare(dp->pclk);
>>>           return ret;
>>>       }
>>

Best regards,
Damon

[0]https://patchwork.kernel.org/project/linux-rockchip/patch/20250109032725.1102465-6-damon.ding@rock-chips.com/#26209891

