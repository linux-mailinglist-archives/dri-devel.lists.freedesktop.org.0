Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6972B6D4612
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 15:46:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A2410E172;
	Mon,  3 Apr 2023 13:46:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.103])
 by gabe.freedesktop.org (Postfix) with ESMTP id A10C410E172
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 13:46:08 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:55990.294498728
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id 541D910021F;
 Mon,  3 Apr 2023 21:46:02 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-7b48884fd-tj646 with ESMTP id
 a19d329c6bca43c0b4603e9a39071ed7 for tzimmermann@suse.de; 
 Mon, 03 Apr 2023 21:46:04 CST
X-Transaction-ID: a19d329c6bca43c0b4603e9a39071ed7
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <1205553a-381a-bab0-4265-eca0bfcd8b9d@189.cn>
Date: Mon, 3 Apr 2023 21:46:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [1/7] drm/tegra: Include <linux/of.h>
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, javierm@redhat.com, airlied@gmail.com, daniel@ffwll.ch
References: <20230330083607.12834-2-tzimmermann@suse.de>
 <14d8245f-d3ab-64a1-7cc0-52ec77dcd13f@189.cn>
 <ffb0005d-d871-1317-8b16-d6fe3771a35e@suse.de>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <ffb0005d-d871-1317-8b16-d6fe3771a35e@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/4/3 18:42, Thomas Zimmermann wrote:
>
>
> Am 30.03.23 um 14:51 schrieb Sui Jingfeng:
>>
>> Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn 
>> <mailto:suijingfeng@loongson.cn>>
>
> Thanks a lot.
>

I send my mail with Thunderbird mail client, don't know this does this 
look like this.

Sorry about that. It should be:


Reviewed-by:  Sui Jingfeng <suijingfeng@loongson.cn>


Please correct it manually, others patches also look good to me.

Yet, it beyond my ability to review, I still digging  your patch and 
learning from it. :)

>>
>>
>> On 2023/3/30 16:36, Thomas Zimmermann wrote:
>>> Include <linux/of.h> to get the contained declarations. No functional
>>> changes.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>>>   drivers/gpu/drm/tegra/output.c | 2 ++
>>>   drivers/gpu/drm/tegra/rgb.c    | 1 +
>>>   2 files changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/tegra/output.c 
>>> b/drivers/gpu/drm/tegra/output.c
>>> index a8925dcd7edd..d31c87f48da0 100644
>>> --- a/drivers/gpu/drm/tegra/output.c
>>> +++ b/drivers/gpu/drm/tegra/output.c
>>> @@ -4,6 +4,8 @@
>>>    * Copyright (C) 2012 NVIDIA CORPORATION.  All rights reserved.
>>>    */
>>> +#include <linux/of.h>
>>> +
>>>   #include <drm/drm_atomic_helper.h>
>>>   #include <drm/drm_of.h>
>>>   #include <drm/drm_panel.h>
>>> diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
>>> index ff8fce36d2aa..3f060282cd8d 100644
>>> --- a/drivers/gpu/drm/tegra/rgb.c
>>> +++ b/drivers/gpu/drm/tegra/rgb.c
>>> @@ -5,6 +5,7 @@
>>>    */
>>>   #include <linux/clk.h>
>>> +#include <linux/of.h>
>>>   #include <drm/drm_atomic_helper.h>
>>>   #include <drm/drm_bridge_connector.h>
>
