Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 003737581E0
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 18:16:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 076A210E37D;
	Tue, 18 Jul 2023 16:16:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3A87B10E37D;
 Tue, 18 Jul 2023 16:16:18 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8AxTevRurZk9NcGAA--.12403S3;
 Wed, 19 Jul 2023 00:16:17 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxniPRurZkMX0zAA--.35913S3; 
 Wed, 19 Jul 2023 00:16:17 +0800 (CST)
Message-ID: <06b291d4-9cab-5179-2a90-a73449ddb2dd@loongson.cn>
Date: Wed, 19 Jul 2023 00:16:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1 3/8] drm/etnaviv: Drop the second argument of the
 etnaviv_gem_new_impl()
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>,
 Sui Jingfeng <sui.jingfeng@linux.dev>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230623100822.274706-1-sui.jingfeng@linux.dev>
 <20230623100822.274706-4-sui.jingfeng@linux.dev>
 <862358e67a6f118b11ba16fb94828e9d1635cb66.camel@pengutronix.de>
 <e3a05204-61fe-2318-5f06-fd12addfe2e9@loongson.cn>
 <ee96ed1a1ff12656f6e6542ae928fb526a9758fe.camel@pengutronix.de>
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <ee96ed1a1ff12656f6e6542ae928fb526a9758fe.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxniPRurZkMX0zAA--.35913S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj97XoW5WF1fGFyUKFWUWFy7XFyxp5X_Ary8JoWSv3
 W3Ja1rGF95tws0k342gFn8A3yUC345Ga4Yq3WDAw4vqay7try7Wa1ftFWIvF10kF47Xwnr
 Ka43uwsrXFn5l-sFpf9Il3svdjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8wcxFpf9Il3
 svdxBIdaVrn0xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIY
 CTnIWjp_UUUY77kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcI
 k0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK
 021l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r
 1j6r4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r1j
 6r4UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrV
 ACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWU
 JVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIc
 xG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v2
 6r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2
 Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_
 Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMI
 IF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zwZ7UUUUU=
 =
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
Cc: loongson-kernel@lists.loongnix.cn, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/7/18 16:12, Lucas Stach wrote:
> Hi Jingfeng,
>
> Am Dienstag, dem 18.07.2023 um 02:34 +0800 schrieb suijingfeng:
>> Hi,  Lucas
>>
>>
>> Thanks for you guidance!
>>
>>
>> On 2023/7/17 17:51, Lucas Stach wrote:
>>> Hi Jingfeng,
>>>
>>> Am Freitag, dem 23.06.2023 um 18:08 +0800 schrieb Sui Jingfeng:
>>>> From: Sui Jingfeng <suijingfeng@loongson.cn>
>>>>
>>>> Because it is not used by the etnaviv_gem_new_impl() function,
>>>> no functional change.
>>>>
>>> I think it would make sense to move into the opposite direction: in
>>> both callsites of etnaviv_gem_new_impl we immediately call
>>> drm_gem_object_init with the size.
>> Really?
>>
>> But there are multiple call path to the etnaviv_gem_new_impl() function.
>>
>>
>> Code path 1 (PRIME):
>>
>>> - etnaviv_gem_prime_import_sg_table()
>>> --  etnaviv_gem_new_private()
>>> --- etnaviv_gem_new_impl(dev, size, flags, ops, &obj)
>>> --- drm_gem_private_object_init(dev, obj, size)
>>
>> Code path 2 (USERPTR):
>>
>>> - etnaviv_gem_new_userptr()
>>> --  etnaviv_gem_new_private()
>>> --- etnaviv_gem_new_impl(dev, size, flags, ops, &obj)
>>> --- drm_gem_private_object_init(dev, obj, size)
>>
>> Code path 3 (construct a GEM buffer object for the user-space):
>>
>>> - etnaviv_ioctl_gem_new()
>>> -- etnaviv_gem_new_handle()
>>> --- etnaviv_gem_new_impl(dev, size, flags, &etnaviv_gem_shmem_ops, &obj);
>>> ---  drm_gem_object_init(dev, obj, size);
>>
>> If I understand this correctly:
>>
>>
>> Code path 1 is for cross device (and cross driver) buffer-sharing,
>>
>> Code path 2 is going to share the buffer the userspace,
>>
>>
>> *Only* the code path 3 is to construct a GEM buffer object for the
>> user-space the userspace,
>>
>> that is say, *only* the code path 3 need to do the backing memory
>> allocation work for the userspace.
>>
>> thus it need to call drm_gem_object_init() function, which really the
>> shmem do the backing memory
>>
>> allocation.
>>
>>
>> The code path 1 and the code path 2 do not need the kernel space
>> allocate the backing memory.
>>
>> Because they are going to share the buffer already allocated by others.
>>
>> thus, code path 2 and code path 3 should call drm_gem_private_object_init(),
>>
>> *not* the drm_gem_object_init() function.
>>
>>
>> When import buffer from the a specific KMS driver,
>>
>> then etnaviv_gem_prime_import_sg_table() will be called.
>>
>>
>> I guess you means that drm_gem_private_object_init() (not the
>> drm_gem_object_init() function)here ?
>>
>>
>>> A better cleanup would be to make
>>> use of the size parameter and move this object init call into
>>> etnaviv_gem_new_impl.
>> If I following you guidance, how do I differentiate the cases
>>
>> when to call drm_gem_private_object_init() not drm_gem_object_init() ?
>>
>> and when call drm_gem_object_init() not drm_gem_private_object_init()?
>>
>>
>> I don't think you are right here.
>>
> Yes, clearly I was not taking into account the differences between
> drm_gem_private_object_init and drm_gem_object_init properly. Please
> disregard my comment, this patch is good as-is.

I have study your patch in the past frequently.

As you could solve very complex(and difficulty) bugs.

So I still believe that you know everything about etnaviv.

I'm just wondering that you are designing the traps. But I'm not sure.

Okay, still acceptable.

Because communicate will you is interesting.

Thank you.

> Regards,
> Lucas
>
>>> Regards,
>>> Lucas
>>>
>>>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>>>> ---
>>>>    drivers/gpu/drm/etnaviv/etnaviv_gem.c | 7 +++----
>>>>    1 file changed, 3 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
>>>> index b5f73502e3dd..be2f459c66b5 100644
>>>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
>>>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
>>>> @@ -542,7 +542,7 @@ static const struct drm_gem_object_funcs etnaviv_gem_object_funcs = {
>>>>    	.vm_ops = &vm_ops,
>>>>    };
>>>>    
>>>> -static int etnaviv_gem_new_impl(struct drm_device *dev, u32 size, u32 flags,
>>>> +static int etnaviv_gem_new_impl(struct drm_device *dev, u32 flags,
>>>>    	const struct etnaviv_gem_ops *ops, struct drm_gem_object **obj)
>>>>    {
>>>>    	struct etnaviv_gem_object *etnaviv_obj;
>>>> @@ -591,8 +591,7 @@ int etnaviv_gem_new_handle(struct drm_device *dev, struct drm_file *file,
>>>>    
>>>>    	size = PAGE_ALIGN(size);
>>>>    
>>>> -	ret = etnaviv_gem_new_impl(dev, size, flags,
>>>> -				   &etnaviv_gem_shmem_ops, &obj);
>>>> +	ret = etnaviv_gem_new_impl(dev, flags, &etnaviv_gem_shmem_ops, &obj);
>>>>    	if (ret)
>>>>    		goto fail;
>>>>    
>>>> @@ -627,7 +626,7 @@ int etnaviv_gem_new_private(struct drm_device *dev, size_t size, u32 flags,
>>>>    	struct drm_gem_object *obj;
>>>>    	int ret;
>>>>    
>>>> -	ret = etnaviv_gem_new_impl(dev, size, flags, ops, &obj);
>>>> +	ret = etnaviv_gem_new_impl(dev, flags, ops, &obj);
>>>>    	if (ret)
>>>>    		return ret;
>>>>    

