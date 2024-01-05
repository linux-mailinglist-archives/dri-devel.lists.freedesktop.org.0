Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E84E8250A0
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 10:15:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB4BB10E58F;
	Fri,  5 Jan 2024 09:14:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 592 seconds by postgrey-1.36 at gabe;
 Fri, 05 Jan 2024 09:14:57 UTC
Received: from mail-m118114.qiye.163.com (mail-m118114.qiye.163.com
 [115.236.118.114])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25BCE10E58F
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 09:14:56 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=J49zP1kcxyDLDuYjM1j/Nm85RnUYMNpETkXTFJtmfMkDN7noi608Tk7coSGxV/XODolyLuQGAfQwK5z9r8GBmQTRolRWVBxr3xENAIZ/q631aqmpzcv2t/h44mHU7k8zm6iScrfG66xhRB6ZXc+4CrxCcpc58vsJz6ASrURiAxE=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
 bh=7Rpg1YBO3YN3stA5+Iw9eTT2absDZpy7ygnLlv2cEYU=;
 h=date:mime-version:subject:message-id:from;
Received: from [172.16.12.141] (unknown [58.22.7.114])
 by mail-m12779.qiye.163.com (Hmail) with ESMTPA id 799D37802A7;
 Fri,  5 Jan 2024 17:04:56 +0800 (CST)
Message-ID: <acb52035-4f0c-430d-a2d2-26ab37805d7b@rock-chips.com>
Date: Fri, 5 Jan 2024 17:04:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/rockchip: vop2: Drop unused if_dclk_rate variable
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Sandy Huang <hjc@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
References: <20240104143951.85219-1-cristian.ciocaltea@collabora.com>
 <20240104143951.85219-2-cristian.ciocaltea@collabora.com>
 <5867171.29KlJPOoH8@diego>
Content-Language: en-US
From: Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <5867171.29KlJPOoH8@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhlPTFZDH0lJTh0fQkJPTkJVEwETFh
 oSFyQUDg9ZV1kYEgtZQVlOQ1VJSVVMVUpKT1lXWRYaDxIVHRRZQVlPS0hVSk1PSU5IVUpLS1VKQk
 tLWQY+
X-HM-Tid: 0a8cd8de4dd6b24fkuuu799d37802a7
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Kxg6Pww*MDwZST8KPjc*F09R
 UTAaCRxVSlVKTEtPT09OT0JMSEhMVTMWGhIXVRoVHwJVAhoVOwkUGBBWGBMSCwhVGBQWRVlXWRIL
 WUFZTkNVSUlVTFVKSk9ZV1kIAVlBT09IQzcG
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
Cc: linux-rockchip@lists.infradead.org, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi:

On 1/4/24 23:58, Heiko Stübner wrote:
> Hi Christian, Andy,
> 
> Am Donnerstag, 4. Januar 2024, 15:39:50 CET schrieb Cristian Ciocaltea:
>> Commit 5a028e8f062f ("drm/rockchip: vop2: Add support for rk3588")
>> introduced a variable which ended up being unused.  Remove it.
>>
>> rockchip_drm_vop2.c:1688:23: warning: variable ‘if_dclk_rate’ set but not used [-Wunused-but-set-variable]
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> 
> in general, please don't send non-series patches as replies to other patches.
> It confuses tooling like b4 way too often, as this patch is not designated
> as a 2/2 (similar to the first one not being 1/2).
> 
>> ---
>>   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> index 44508c2dd614..923985d4161b 100644
>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> @@ -1685,7 +1685,6 @@ static unsigned long rk3588_calc_cru_cfg(struct vop2_video_port *vp, int id,
>>   	unsigned long dclk_core_rate = v_pixclk >> 2;
>>   	unsigned long dclk_rate = v_pixclk;
>>   	unsigned long dclk_out_rate;
>> -	unsigned long if_dclk_rate;
>>   	unsigned long if_pixclk_rate;
>>   	int K = 1;
>>   
>> @@ -1700,7 +1699,6 @@ static unsigned long rk3588_calc_cru_cfg(struct vop2_video_port *vp, int id,
>>   		}
>>   
>>   		if_pixclk_rate = (dclk_core_rate << 1) / K;
>> -		if_dclk_rate = dclk_core_rate / K;
>>   		/*
>>   		 * *if_pixclk_div = dclk_rate / if_pixclk_rate;
>>   		 * *if_dclk_div = dclk_rate / if_dclk_rate;
>>   		 */
> 		*if_pixclk_div = 2;
> 		*if_dclk_div = 4;
> 
> with the code continuing with those static constants but the comment
> showing a forumula, I do hope Andy can provide a bit of insight into
> what is happening here.
> 
> I.e. I'd really like to understand if that really is just a remnant or
> something different is needed.

This is not a remnant, in my V1, I calculate all the div by formula, but Sascha prefer
more for a constants value[0], so I keep this formula as comments to indicate how these value come from.

[0]https://patchwork.kernel.org/project/linux-rockchip/patch/20231114112855.1771372-1-andyshrk@163.com/
> 
> 
> Heiko
> 
> 
