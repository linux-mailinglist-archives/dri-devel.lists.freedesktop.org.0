Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB9073712B
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 18:07:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B34C510E2FB;
	Tue, 20 Jun 2023 16:06:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id F200810E192
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 16:06:52 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8AxV+mZzpFkhkQHAA--.12934S3;
 Wed, 21 Jun 2023 00:06:49 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxB92YzpFkpS0AAA--.721S3; 
 Wed, 21 Jun 2023 00:06:49 +0800 (CST)
Message-ID: <670a1763-181a-0133-9b31-b790072b3af8@loongson.cn>
Date: Wed, 21 Jun 2023 00:06:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/drm_gem.c: remove surplus else after return clause
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, Sui Jingfeng
 <15330273260@189.cn>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, liyi <liyi@loongson.cn>
References: <20230314125305.2278964-1-15330273260@189.cn>
 <cde47fd0-a8e4-36cf-3f0b-a1b473799db3@loongson.cn>
 <163af01e-01cc-008d-333f-964cba9f9130@suse.de>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <163af01e-01cc-008d-333f-964cba9f9130@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxB92YzpFkpS0AAA--.721S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7WF47try7Ar1DXw18trW3CFX_yoW8tF1Upr
 n7JFW5urZ8ZFWFqr12qF1UZFyakw4Ig34UWFn5XFn5Ar40yF1jgrZ8Zan09rWUJr4xGF4Y
 qrs8XFyfZFyjyrXCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUU9Eb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
 Jr0_Gr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
 x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1D
 McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7
 I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8
 JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14
 v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY
 67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2
 IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_
 Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8q2NtUUUUU==
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/6/20 22:43, Thomas Zimmermann wrote:
> Hi
>
> Am 20.06.23 um 06:08 schrieb Sui Jingfeng:
>> ping ?
>>
>> On 2023/3/14 20:53, Sui Jingfeng wrote:
>>>   else is not generally useful after return
>
> No indention please.
>
OK, will be fixed at the next version.
>>>
>>> Signed-off-by: Sui Jingfeng <15330273260@189.cn>
>>> ---
>>>   drivers/gpu/drm/drm_gem.c | 7 ++++---
>>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>>> index a6208e2c089b..364e3733af98 100644
>>> --- a/drivers/gpu/drm/drm_gem.c
>>> +++ b/drivers/gpu/drm/drm_gem.c
>>> @@ -1150,8 +1150,8 @@ int drm_gem_pin(struct drm_gem_object *obj)
>>>   {
>>>       if (obj->funcs->pin)
>>>           return obj->funcs->pin(obj);
>>> -    else
>>> -        return 0;
>>> +
>>> +    return 0;
>
> This change is ok.
>
>>>   }
>>>   void drm_gem_unpin(struct drm_gem_object *obj)
>>> @@ -1172,7 +1172,8 @@ int drm_gem_vmap(struct drm_gem_object *obj, 
>>> struct iosys_map *map)
>>>       ret = obj->funcs->vmap(obj, map);
>>>       if (ret)
>>>           return ret;
>>> -    else if (iosys_map_is_null(map))
>>> +
>>> +    if (iosys_map_is_null(map))
>>>           return -ENOMEM;
>
> This is not correct. Calling iosys_map_is_null() is part of handling 
> the return value from vmap, so the else is fine.
>
Are you serious ?


1. Before apply this patch:


If the 'ret' is 0,  it stand for obj->funcs->vmap() is successful, then 
if (iosys_map_is_null(map)) will be run.

If the 'ret' is NOT 0, then it return immediately.


2. After apply this patch:


If the 'ret' is NOT 0, it stand for obj->funcs->vmap() failed, then it 
return immediately.

If the 'ret' is 0, it stand for obj->funcs->vmap() is successful, then 
the check if (iosys_map_is_null(map))

will be run!


I feel strange about the core here, I think the check ' if 
(iosys_map_is_null(map))' is not needed,

the implement should responsible to handle all of possible errors.


But both case (1. and 2.) are same in the semantic, right?


> Best regards
> Thomas
>
>>>       return 0;
>>
>
-- 
Jingfeng

