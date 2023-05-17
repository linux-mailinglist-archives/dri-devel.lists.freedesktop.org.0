Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A220706326
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 10:41:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F20D10E3C5;
	Wed, 17 May 2023 08:41:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
 by gabe.freedesktop.org (Postfix) with ESMTP id C063D10E3C5
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 08:41:27 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:36902.606101932
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id CFB771002B1;
 Wed, 17 May 2023 16:41:22 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-75648544bd-prw2v with ESMTP id
 f2cf8a95b7ad40ae9100f5bdcd0d8cca for tzimmermann@suse.de; 
 Wed, 17 May 2023 16:41:23 CST
X-Transaction-ID: f2cf8a95b7ad40ae9100f5bdcd0d8cca
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <abecad9f-f6d7-1dca-68d3-a96b492a4c56@189.cn>
Date: Wed, 17 May 2023 16:41:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/drm_atomic_helper.c: fix a typo
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230517041602.3225325-1-suijingfeng@loongson.cn>
 <40689882-6771-97c7-f771-d57ceefd052a@suse.de>
Content-Language: en-US
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <40689882-6771-97c7-f771-d57ceefd052a@suse.de>
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
Cc: loongson-kernel@lists.loongnix.cn, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sui Jingfeng <15330273260@189.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, thanks a lot


Please help to take a look drm/loongson at 
https://patchwork.freedesktop.org/series/113566/ ?

let's merge it if no big problem?


On 2023/5/17 15:24, Thomas Zimmermann wrote:
> Merged. Thanks a lot.
>
> Am 17.05.23 um 06:16 schrieb Sui Jingfeng:
>> From: Sui Jingfeng <15330273260@189.cn>
>>
>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>> ---
>>   drivers/gpu/drm/drm_atomic_helper.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_atomic_helper.c 
>> b/drivers/gpu/drm/drm_atomic_helper.c
>> index e0ab555aad2c..41b8066f61ff 100644
>> --- a/drivers/gpu/drm/drm_atomic_helper.c
>> +++ b/drivers/gpu/drm/drm_atomic_helper.c
>> @@ -3154,7 +3154,7 @@ int drm_atomic_helper_update_plane(struct 
>> drm_plane *plane,
>>   EXPORT_SYMBOL(drm_atomic_helper_update_plane);
>>     /**
>> - * drm_atomic_helper_disable_plane - Helper for primary plane 
>> disable using * atomic
>> + * drm_atomic_helper_disable_plane - Helper for primary plane 
>> disable using atomic
>>    * @plane: plane to disable
>>    * @ctx: lock acquire context
>>    *
>
