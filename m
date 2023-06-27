Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0FA73F8B2
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 11:27:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3FDB10E035;
	Tue, 27 Jun 2023 09:27:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id A339B10E035
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 09:27:03 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Cx5cRlq5pkMgUDAA--.4810S3;
 Tue, 27 Jun 2023 17:27:01 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Dx4eRkq5pkxcQLAA--.48289S3; 
 Tue, 27 Jun 2023 17:27:01 +0800 (CST)
Message-ID: <26fd0468-df4f-7b9f-18fd-2609258c43be@loongson.cn>
Date: Tue, 27 Jun 2023 17:27:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/drm_gem.c: remove surplus else after return clause
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
References: <20230314125305.2278964-1-15330273260@189.cn>
 <cde47fd0-a8e4-36cf-3f0b-a1b473799db3@loongson.cn>
 <163af01e-01cc-008d-333f-964cba9f9130@suse.de>
 <670a1763-181a-0133-9b31-b790072b3af8@loongson.cn>
 <c2bdf8ea-b770-23a1-222b-1791ab0e3cec@suse.de>
 <ixkyytoxpsnw3ffumacdyyoj4qbs3zqob73oj6hzuzuwi25axm@roghs7ruhnik>
 <e6031336-3ac1-4279-7eac-221552859dff@suse.de>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <e6031336-3ac1-4279-7eac-221552859dff@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Dx4eRkq5pkxcQLAA--.48289S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxArW5CFyxuw48Zr1rtrWDAwc_yoWrtrWfpF
 yktayjkrZ8JF4ftr17tr1UZryYyw18Xa4UXrn5JF1DCr1qyF1jqr45XrWj9ryUJr4xGr1j
 qr4UXr4fZryUArXCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUU9Sb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
 1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
 67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
 AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C2
 67AKxVWUtVW8ZwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI
 8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWU
 CwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r
 1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBI
 daVFxhVjvjDU0xZFpf9x07jYSoJUUUUU=
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
Cc: David Airlie <airlied@linux.ie>, liyi <liyi@loongson.cn>,
 dri-devel@lists.freedesktop.org, Sui Jingfeng <15330273260@189.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/6/27 17:00, Thomas Zimmermann wrote:
> Hi
>
> Am 26.06.23 um 14:32 schrieb Maxime Ripard:
>> Hi,
>>
>> On Tue, Jun 20, 2023 at 06:18:31PM +0200, Thomas Zimmermann wrote:
>>> Am 20.06.23 um 18:06 schrieb Sui Jingfeng:
>>>> Hi,
>>>>
>>>> On 2023/6/20 22:43, Thomas Zimmermann wrote:
>>>>> Hi
>>>>>
>>>>> Am 20.06.23 um 06:08 schrieb Sui Jingfeng:
>>>>>> ping ?
>>>>>>
>>>>>> On 2023/3/14 20:53, Sui Jingfeng wrote:
>>>>>>>    else is not generally useful after return
>>>>>
>>>>> No indention please.
>>>>>
>>>> OK, will be fixed at the next version.
>>>>>>>
>>>>>>> Signed-off-by: Sui Jingfeng <15330273260@189.cn>
>>>>>>> ---
>>>>>>>    drivers/gpu/drm/drm_gem.c | 7 ++++---
>>>>>>>    1 file changed, 4 insertions(+), 3 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>>>>>>> index a6208e2c089b..364e3733af98 100644
>>>>>>> --- a/drivers/gpu/drm/drm_gem.c
>>>>>>> +++ b/drivers/gpu/drm/drm_gem.c
>>>>>>> @@ -1150,8 +1150,8 @@ int drm_gem_pin(struct drm_gem_object *obj)
>>>>>>>    {
>>>>>>>        if (obj->funcs->pin)
>>>>>>>            return obj->funcs->pin(obj);
>>>>>>> -    else
>>>>>>> -        return 0;
>>>>>>> +
>>>>>>> +    return 0;
>>>>>
>>>>> This change is ok.
>>>>>
>>>>>>>    }
>>>>>>>    void drm_gem_unpin(struct drm_gem_object *obj)
>>>>>>> @@ -1172,7 +1172,8 @@ int drm_gem_vmap(struct drm_gem_object
>>>>>>> *obj, struct iosys_map *map)
>>>>>>>        ret = obj->funcs->vmap(obj, map);
>>>>>>>        if (ret)
>>>>>>>            return ret;
>>>>>>> -    else if (iosys_map_is_null(map))
>>>>>>> +
>>>>>>> +    if (iosys_map_is_null(map))
>>>>>>>            return -ENOMEM;
>>>>>
>>>>> This is not correct. Calling iosys_map_is_null() is part of handling
>>>>> the return value from vmap, so the else is fine.
>>>>>
>>>> Are you serious ?
>>>>
>>>>
>>>> 1. Before apply this patch:
>>>>
>>>>
>>>> If the 'ret' is 0,  it stand for obj->funcs->vmap() is successful, 
>>>> then
>>>> if (iosys_map_is_null(map)) will be run.
>>>>
>>>> If the 'ret' is NOT 0, then it return immediately.
>>>>
>>>>
>>>> 2. After apply this patch:
>>>>
>>>>
>>>> If the 'ret' is NOT 0, it stand for obj->funcs->vmap() failed, then it
>>>> return immediately.
>>>>
>>>> If the 'ret' is 0, it stand for obj->funcs->vmap() is successful, then
>>>> the check if (iosys_map_is_null(map))
>>>>
>>>> will be run!
>>>>
>>>>
>>>> I feel strange about the core here, I think the check ' if
>>>> (iosys_map_is_null(map))' is not needed,
>>>>
>>>> the implement should responsible to handle all of possible errors.
>>>
>>> The ->vmap() callback can succeed with ret=0, but we still have no 
>>> memory.
>>> Then we return -ENOMEM. The call to _is_null(map) is part of the error
>>> handling for ->vmap(). That is a bit strange, but it as always 
>>> worked like
>>> that. Keeping all error handling in the same if-else block make all 
>>> this
>>> more obvious.
>>
>> Reading that patch, it wasn't obvious to me at all and could have made
>> the same patch.
>
> The vmap callback could return any errno code; plus a 0 with a NULL 
> pointer means -ENOMEM.  Doing this here simplifies the callers of 
> drm_gem_vmap and makes them more robust.  We'd otherwise duplicate the 
> test for NULL in each caller.
>
>>
>> Could we add a comment maybe to make it more obvious?
>
> A one-liner that states the given rational might make sense.
>
Yeah, I'm agree.

But I think this is a short-term solution.

We probably should duplicate the test for NULL in each driver in a long 
term.

Because we should to keep the align with TTM and SHMEM.


I means that TTM and SHMEM memory manager are good example to follow.

In TTM, Nearly all mapping related function will return -ENOMEM.


```

int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map)
{
         // ...

         if (!vaddr_iomem)
             return -ENOMEM;

         iosys_map_set_vaddr_iomem(map, vaddr_iomem);

     } else {
         // ...
         vaddr = vmap(ttm->pages, ttm->num_pages, 0, prot);
         if (!vaddr)
             return -ENOMEM;

         iosys_map_set_vaddr(map, vaddr);
     }

     return 0;
}

```


The drm_gem_shmem_vmap() function in the SHMEM helper,

also return -ENOMEM.


After reading the code, It seems that

this is necessary to consolidate the standard behavior,

avoid the various device drivers violate each other.


> Best regards
> Thomas
>
>>
>> Maxime
>
-- 
Jingfeng

