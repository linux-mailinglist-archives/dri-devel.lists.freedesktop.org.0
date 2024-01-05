Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCF38250CF
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 10:25:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E296B10E59F;
	Fri,  5 Jan 2024 09:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 654 seconds by postgrey-1.36 at gabe;
 Fri, 05 Jan 2024 09:24:56 UTC
Received: from mail-m15593.qiye.163.com (mail-m15593.qiye.163.com
 [101.71.155.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 971F710E59F
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 09:24:56 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=KSM370iFKjmw5xxrk6/QzaAkCHdhqtuv0hlvvSEvcmnQsIbTaoBRQ+eK0zJeDVa8sr6Jk7akmw5IQ2GDgQXF5O4mEuzR6f9qezacvcPdc475m6T+7tn0hprSt/f8dGel64uVjr/KEKMRL5/aGuhQF2qAm0dV5iKMMy1XwwJvHIM=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
 bh=B2Kpa4LwHRxteTEkl0iXK8SA2qrb5sEeEowWu1YDokw=;
 h=date:mime-version:subject:message-id:from;
Received: from [172.16.12.141] (unknown [58.22.7.114])
 by mail-m12779.qiye.163.com (Hmail) with ESMTPA id 3AD6E780511;
 Fri,  5 Jan 2024 17:13:58 +0800 (CST)
Message-ID: <6812a957-dafd-4687-8094-074d8d2b5471@rock-chips.com>
Date: Fri, 5 Jan 2024 17:13:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/rockchip: vop2: Drop unused if_dclk_rate variable
Content-Language: en-US
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Sandy Huang <hjc@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20240104143951.85219-1-cristian.ciocaltea@collabora.com>
 <20240104143951.85219-2-cristian.ciocaltea@collabora.com>
 <5867171.29KlJPOoH8@diego>
 <b017a3e2-f658-4a95-b972-6ffb87acfdc3@collabora.com>
From: Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <b017a3e2-f658-4a95-b972-6ffb87acfdc3@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkhLGVZCH0hNQ0ofHU0fSENVEwETFh
 oSFyQUDg9ZV1kYEgtZQVlOQ1VJSVVMVUpKT1lXWRYaDxIVHRRZQVlPS0hVSk1PSE1DVUpLS1VKQk
 tLWQY+
X-HM-Tid: 0a8cd8e69206b24fkuuu3ad6e780511
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NE06Ogw5PTwfLj88PksRTiEu
 MQ4aCw1VSlVKTEtPT09NS0hCSUlMVTMWGhIXVRoVHwJVAhoVOwkUGBBWGBMSCwhVGBQWRVlXWRIL
 WUFZTkNVSUlVTFVKSk9ZV1kIAVlBTkJOTDcG
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

Hi Cristian:

On 1/5/24 03:12, Cristian Ciocaltea wrote:
> Hi Heiko,
> 
> On 1/4/24 17:58, Heiko Stübner wrote:
>> Hi Christian, Andy,
>>
>> Am Donnerstag, 4. Januar 2024, 15:39:50 CET schrieb Cristian Ciocaltea:
>>> Commit 5a028e8f062f ("drm/rockchip: vop2: Add support for rk3588")
>>> introduced a variable which ended up being unused.  Remove it.
>>>
>>> rockchip_drm_vop2.c:1688:23: warning: variable ‘if_dclk_rate’ set but not used [-Wunused-but-set-variable]
>>>
>>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>>
>> in general, please don't send non-series patches as replies to other patches.
>> It confuses tooling like b4 way too often, as this patch is not designated
>> as a 2/2 (similar to the first one not being 1/2).
> 
> That was unintentional, sorry!  I wrongly assumed 'git send-email' is
> able to correctly handle multiple patches which are not part of a
> series.  I'm not sure if the '--no-thread' flag would have helped.
> 
>>> ---
>>>   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 2 --
>>>   1 file changed, 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>>> index 44508c2dd614..923985d4161b 100644
>>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>>> @@ -1685,7 +1685,6 @@ static unsigned long rk3588_calc_cru_cfg(struct vop2_video_port *vp, int id,
>>>   	unsigned long dclk_core_rate = v_pixclk >> 2;
>>>   	unsigned long dclk_rate = v_pixclk;
>>>   	unsigned long dclk_out_rate;
>>> -	unsigned long if_dclk_rate;
>>>   	unsigned long if_pixclk_rate;
>>>   	int K = 1;
>>>   
>>> @@ -1700,7 +1699,6 @@ static unsigned long rk3588_calc_cru_cfg(struct vop2_video_port *vp, int id,
>>>   		}
>>>   
>>>   		if_pixclk_rate = (dclk_core_rate << 1) / K;
>>> -		if_dclk_rate = dclk_core_rate / K;
>>>   		/*
>>>   		 * *if_pixclk_div = dclk_rate / if_pixclk_rate;
>>>   		 * *if_dclk_div = dclk_rate / if_dclk_rate;
>>>   		 */
>> 		*if_pixclk_div = 2;
>> 		*if_dclk_div = 4;
>>
>> with the code continuing with those static constants but the comment
>> showing a forumula, I do hope Andy can provide a bit of insight into
>> what is happening here.
>>
>> I.e. I'd really like to understand if that really is just a remnant or
>> something different is needed.
> 
> The current implementation is not able to handle all display modes
> supported by connected displays, e.g. in my testing environment I
> encountered issues with 2560x1440-75.00Hz, 2048x1152-60.00Hz,
> 1024x768-60.00Hz.  Additionally, it doesn't seem to cope well with
> non-integer refresh rates like 59.94, 29.97, 23.98, etc.

I think this is because the thee PLL from cru can't divide accurate clock for these
non-integer refresh rates.
> 
> My temporary workaround relies on using the HDMI PHY PLL in conjunction
> with a downstream-based hack to compute the clock rates.  I'm not sure
> that would be an upstreamable solution, so I would let Andy shed some
> light on the topic.

Yes, use PLL from HDMI PHY can give more flexible clock rates to support more display mode.
We also use it in our bsp kernel, but one thing should  keep in mind that  use HDMI PHY pll
as dclk source can only work for HDMI 2.0 or bellow, if can't be used in hdmi 2.1 mode(such as 4K120),
so we need to switch the clock source by hdmi work mode.

The difficult thing is how to make this accepted by upstream.
> 
> Thanks,
> Cristian
> 
>>
>> Heiko
>>
>>
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
