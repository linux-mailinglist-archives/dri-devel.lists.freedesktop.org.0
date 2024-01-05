Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74757825960
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 18:49:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEB8E10E64E;
	Fri,  5 Jan 2024 17:49:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CCE110E65A
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 17:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1704476956;
 bh=oiTjNDE8zdxt2cMZq7xxs8JwiZDB7s9mhohrKDnY/2E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=vEBLtejKVsVkA/nSjHRUQnhjBOK6LO380L89stD1j4116VhjpGVphkIylt+u24RH5
 su3sUhTwunOUMgAvc3PuMdxBgz47Z+Tx2RUIyCf/jBMiOLReJffKvaYL4Dqa0eVrq0
 NfPodRzxZeUwMTlfId+M2rY6Sey7PidHirQaAtdXqQiQWYRvWDBI0kZW96OZ6iAr6W
 XLzf1Krv7tefrzgj56aSnHBBv4dPouS5M+QcVvkBIAgeOyOsbHfTB5ifnj0h429a8n
 2VQYwKnzc88v9ZEEhquHMlCzAzDzFUDDWHpGHudTEn9c/L2IS3Ok2g8h8r8FFW0/7m
 pFZl80/dkBpcQ==
Received: from [100.115.223.179] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 29C10378003D;
 Fri,  5 Jan 2024 17:49:15 +0000 (UTC)
Message-ID: <30114fa6-d83d-4563-9f3b-2975ddfd2752@collabora.com>
Date: Fri, 5 Jan 2024 19:49:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/rockchip: vop2: Drop unused if_dclk_rate variable
Content-Language: en-US
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Sandy Huang <hjc@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andy Yan <andy.yan@rock-chips.com>
References: <20240104143951.85219-1-cristian.ciocaltea@collabora.com>
 <5867171.29KlJPOoH8@diego>
 <acb52035-4f0c-430d-a2d2-26ab37805d7b@rock-chips.com>
 <13141620.VsHLxoZxqI@diego>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <13141620.VsHLxoZxqI@diego>
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

On 1/5/24 11:57, Heiko Stübner wrote:
> Hi,
> 
> Am Freitag, 5. Januar 2024, 10:04:55 CET schrieb Andy Yan:
>> On 1/4/24 23:58, Heiko Stübner wrote:
>>> Am Donnerstag, 4. Januar 2024, 15:39:50 CET schrieb Cristian Ciocaltea:
>>>> Commit 5a028e8f062f ("drm/rockchip: vop2: Add support for rk3588")
>>>> introduced a variable which ended up being unused.  Remove it.
>>>>
>>>> rockchip_drm_vop2.c:1688:23: warning: variable ‘if_dclk_rate’ set but not used [-Wunused-but-set-variable]
>>>>
>>>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

[...]

>>> with the code continuing with those static constants but the comment
>>> showing a forumula, I do hope Andy can provide a bit of insight into
>>> what is happening here.
>>>
>>> I.e. I'd really like to understand if that really is just a remnant or
>>> something different is needed.
>>
>> This is not a remnant, in my V1, I calculate all the div by formula, but Sascha prefer
>> more for a constants value[0], so I keep this formula as comments to indicate how these value come from.
>>
>> [0]https://patchwork.kernel.org/project/linux-rockchip/patch/20231114112855.1771372-1-andyshrk@163.com/
> 
> thanks for referencing the source of the change.
> Leaving the formula in there was the right choice I think
> 
> That still leaves the issue with the "unused" warning.
> 
> @Christan: in the hdmi block itself can you move the 
> 	if_dclk_rate = dclk_core_rate / K;
> to the comment block please? And possibly reference the use
> of the static values in the comment message.
> 
> The if_dclk_rate var declaration at the top of the function can of course
> go away.
> 
> That way we still keep documenting how these values came to be:

Requested changes submitted via v2:

https://lore.kernel.org/lkml/20240105174007.98054-1-cristian.ciocaltea@collabora.com/

Thanks,
Cristian
