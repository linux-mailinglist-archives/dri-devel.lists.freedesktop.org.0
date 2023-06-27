Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA7673F7D1
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 10:53:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2E8810E2BE;
	Tue, 27 Jun 2023 08:53:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id E52A310E2BE
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 08:53:07 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8BxHMdxo5pk5PYCAA--.4532S3;
 Tue, 27 Jun 2023 16:53:05 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxB81xo5pka7MLAA--.39710S3; 
 Tue, 27 Jun 2023 16:53:05 +0800 (CST)
Message-ID: <c820f54b-b423-ba03-b931-39fb2697b93b@loongson.cn>
Date: Tue, 27 Jun 2023 16:53:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/drm_gem.c: remove surplus else after return clause
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20230314125305.2278964-1-15330273260@189.cn>
 <cde47fd0-a8e4-36cf-3f0b-a1b473799db3@loongson.cn>
 <163af01e-01cc-008d-333f-964cba9f9130@suse.de>
 <670a1763-181a-0133-9b31-b790072b3af8@loongson.cn>
 <c2bdf8ea-b770-23a1-222b-1791ab0e3cec@suse.de>
 <ixkyytoxpsnw3ffumacdyyoj4qbs3zqob73oj6hzuzuwi25axm@roghs7ruhnik>
 <1c93f083-87c1-87d9-3faa-c3ba50e69a0c@loongson.cn>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <1c93f083-87c1-87d9-3faa-c3ba50e69a0c@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxB81xo5pka7MLAA--.39710S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW3WryUCFWUJrWfJFWUtr1UArc_yoW7Cw15pF
 yktayYkrZ8Jr4rXr17tw1UZFyYyw1UWayUWr95Ja4DCr4DtF1jqrWUXFWj9rWUJr4xGF4a
 qr45Xr13ZryUArXCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUB2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
 AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
 tVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
 8JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
 Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
 xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
 cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8V
 AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E
 14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4AhLUUUUU
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

On 2023/6/26 21:20, Sui Jingfeng wrote:
> Hi,
>
> On 2023/6/26 20:32, Maxime Ripard wrote:
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
>>>>> No indention please.
>>>>>
>>>> OK, will be fixed at the next version.
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
>>> The ->vmap() callback can succeed with ret=0, but we still have no 
>>> memory.
>>> Then we return -ENOMEM. The call to _is_null(map) is part of the error
>>> handling for ->vmap(). That is a bit strange, but it as always 
>>> worked like
>>> that. Keeping all error handling in the same if-else block make all 
>>> this
>>> more obvious.
>> Reading that patch, it wasn't obvious to me at all and could have made
>> the same patch.
>>
>> Could we add a comment maybe to make it more obvious?
>
> It could, but what should we to do ?
>
>
> It seems that it is true the  ->vmap() callback can succeed with ret=0,
>
> But I think this break the *convention*,
>
> the vmap() function at mm/vmalloc.c already said "Return: the address 
> of the area or %NULL on failure."
>
>
> The kernel's vmap() function return NULL on failure(may because the 
> space is not enough on 32-bit ARM SoCs).
>
> But the drm core's vmap hook just don't honor this.
>
>
> Take the drm/tegra as an example:
>
>
> ```
>
> static void *tegra_bo_mmap(struct host1x_bo *bo)
> {
>     struct tegra_bo *obj = host1x_to_tegra_bo(bo);
>     struct iosys_map map;
>     int ret;
>
>     if (obj->vaddr) {
>         return obj->vaddr;
>     } else if (obj->gem.import_attach) {
>         ret = dma_buf_vmap_unlocked(obj->gem.import_attach->dmabuf, 
> &map);
>         return ret ? NULL : map.vaddr;
>     } else {
>         return vmap(obj->pages, obj->num_pages, VM_MAP,
>                 pgprot_writecombine(PAGE_KERNEL));
>     }
> }
>
>
> static int tegra_gem_prime_vmap(struct dma_buf *buf, struct iosys_map 
> *map)
> {
>     struct drm_gem_object *gem = buf->priv;
>     struct tegra_bo *bo = to_tegra_bo(gem);
>     void *vaddr;
>
>     vaddr = tegra_bo_mmap(&bo->base);
>     if (IS_ERR(vaddr))
>         return PTR_ERR(vaddr);
>
>     iosys_map_set_vaddr(map, vaddr);
>
>     return 0;
> }
>
> ```
>
>
> On one of the all code path, 

> tegra_gem_prime_vmap() call vmap() fucntion to give the vmap the 
> caller wanted.

tegra_gem_prime_vmap() call vmap() function to map the memory the into 
kernel address space.


>
> but the tegra_gem_prime_vmap() function *only* think 'error' as 
> error(by calling IS_ERR(vaddr)),


The tegra_gem_prime_vmap() function only return a error code if 
IS_ERR(vaddr) is *true*.


>
> But I think the 'NULL' should also be counted as error.
>
I think the 'NULL'(vmap() return NULL) should be counted as error.
> For my patch(this patch),

> but the ultimate results is same for the case before apply this patch 
> and after apply this patch.
>
For my patch, the ultimate binary generated is same, 'before apply it' 
and 'after apply it',
> Their are also many other drivers have the same problem.
>
There are drivers have the same problem.


>
>> Maxime
>
-- 
Jingfeng

