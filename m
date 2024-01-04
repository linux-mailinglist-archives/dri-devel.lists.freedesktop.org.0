Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C22C88248BC
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 20:12:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D89B210E46D;
	Thu,  4 Jan 2024 19:12:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7666710E46D
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 19:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1704395547;
 bh=H5jcJXHHsnb0KDKtbYg8I4ZDhU9wIwvX0Jm1PSTYmdc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=z3cAeGYiSpKdzPhNU+Czu3DKgz9WmFQsf48G2Q5tT5lZMpU8UpWwlyhLmLVZZg/SI
 5j1pX/Q57Ayi+J9LRwwzUQb3qE7wIboeFA/pxPM2E0gqUZWwZwm66jg5QZx3/e9BJ6
 Djh6KVn+Las4BNgeafr6WiWDvgyW2OqSLiLiw7jk2FXHmXdbtpKpFZrDvwvYkGL7J4
 U+7OevGeOUFdg2H1F4puyTHBn/Ko3RF02Mc6hl/2l/UL26ukidN8NzHQ9Puvg+7q1G
 oR1WnHu3MnwSHmlOGYm6ifUjRnOk9VrouUMEQTGbI0b/7iV39nnmsWRk5ctL4q8NPz
 DIg6qdI4Xq95g==
Received: from [100.115.223.179] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1E17B37813E4;
 Thu,  4 Jan 2024 19:12:27 +0000 (UTC)
Message-ID: <b017a3e2-f658-4a95-b972-6ffb87acfdc3@collabora.com>
Date: Thu, 4 Jan 2024 21:12:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/rockchip: vop2: Drop unused if_dclk_rate variable
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20240104143951.85219-1-cristian.ciocaltea@collabora.com>
 <20240104143951.85219-2-cristian.ciocaltea@collabora.com>
 <5867171.29KlJPOoH8@diego>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <5867171.29KlJPOoH8@diego>
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
Cc: linux-rockchip@lists.infradead.org, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Heiko,

On 1/4/24 17:58, Heiko Stübner wrote:
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

That was unintentional, sorry!  I wrongly assumed 'git send-email' is
able to correctly handle multiple patches which are not part of a
series.  I'm not sure if the '--no-thread' flag would have helped.

>> ---
>>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> index 44508c2dd614..923985d4161b 100644
>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> @@ -1685,7 +1685,6 @@ static unsigned long rk3588_calc_cru_cfg(struct vop2_video_port *vp, int id,
>>  	unsigned long dclk_core_rate = v_pixclk >> 2;
>>  	unsigned long dclk_rate = v_pixclk;
>>  	unsigned long dclk_out_rate;
>> -	unsigned long if_dclk_rate;
>>  	unsigned long if_pixclk_rate;
>>  	int K = 1;
>>  
>> @@ -1700,7 +1699,6 @@ static unsigned long rk3588_calc_cru_cfg(struct vop2_video_port *vp, int id,
>>  		}
>>  
>>  		if_pixclk_rate = (dclk_core_rate << 1) / K;
>> -		if_dclk_rate = dclk_core_rate / K;
>>  		/*
>>  		 * *if_pixclk_div = dclk_rate / if_pixclk_rate;
>>  		 * *if_dclk_div = dclk_rate / if_dclk_rate;
>>  		 */
> 		*if_pixclk_div = 2;
> 		*if_dclk_div = 4;
> 
> with the code continuing with those static constants but the comment
> showing a forumula, I do hope Andy can provide a bit of insight into
> what is happening here.
> 
> I.e. I'd really like to understand if that really is just a remnant or
> something different is needed.

The current implementation is not able to handle all display modes
supported by connected displays, e.g. in my testing environment I
encountered issues with 2560x1440-75.00Hz, 2048x1152-60.00Hz,
1024x768-60.00Hz.  Additionally, it doesn't seem to cope well with
non-integer refresh rates like 59.94, 29.97, 23.98, etc.

My temporary workaround relies on using the HDMI PHY PLL in conjunction
with a downstream-based hack to compute the clock rates.  I'm not sure
that would be an upstreamable solution, so I would let Andy shed some
light on the topic.

Thanks,
Cristian

> 
> Heiko
> 
> 
