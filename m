Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B566D66B2A1
	for <lists+dri-devel@lfdr.de>; Sun, 15 Jan 2023 17:43:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 421EA10E13E;
	Sun, 15 Jan 2023 16:43:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8AF210E13E;
 Sun, 15 Jan 2023 16:43:03 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 z8-20020a05600c220800b003d33b0bda11so2923294wml.0; 
 Sun, 15 Jan 2023 08:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r2XFHI9hzlymkwecU7/N6nJzjS0uK7bZYTYKVdGKd/8=;
 b=nw2y2GaNl48dcEBWnmbk+WCMN4j/IyUqgOOZakXplo6S7fhbjXLJlX0fpKqxwUXQGu
 82oaLZ1FPiDlTIshz1oTwAsuB0OLlZ/q9W4/mC+BP5UqLvmJDvMAwqR2ogR7UEmREqDx
 qVKs9utmq0/Z3pBT7ZH4S1ZH8RzJj/ay5vg4vsFxS5kimX09N1w5xB0vnNhPEBTAEHJa
 9gpK/clvzjDt740MA6XcU5qSwT45aqHOfD8WUZI7/55RCGF06OYN7pLfGnoVPmwEv2K0
 ct9JRRSGKyxQb9ulzv61PQgIsr7nJC7nYVXTXT+mdiNSffQUO01ryFCuyITr1zMtpKiV
 9E7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r2XFHI9hzlymkwecU7/N6nJzjS0uK7bZYTYKVdGKd/8=;
 b=YA2twIfvpTsFcWwpuJVHrq/VuDkuIiJltHjcS+G5PvvUpuvxqNo+H6lInJJ8j3UfJy
 zXY+8sjm+1m4rsmxJmHpyL6VzdJxTgq/VIYACUtnutBocl+H2bhqdsLWq9JGIGRkMQvk
 C1Rp6MZtPCripwvZn9L6buVYdEVbQbqJIFJdAsqTa2mCbLVP8hGMO3zEh70RwJe2sXaI
 iR/2SPoGDKW3AUQnjYvtmjBc4tL+dbFWSR39bj+Y4mkL9Uev3evA9cz7vQbE8C8uXmx8
 SMUaYXAWmLm/l1yajt+ijzP4xYYEi9UR8HnBHavTuPzXOuI8q6Jl2GP0r5SmDRsPmzYj
 CUhw==
X-Gm-Message-State: AFqh2kry6xN+yCcJEo1pLeV61HB36J9mQa9V4ETVEAiJ4l9rWpF6it/B
 zUvjD3WV0faMV9ey+Afw5Fc=
X-Google-Smtp-Source: AMrXdXtwa3nCbXxMmDvWXjk6rTf324dW5nzxkNB6CydWoeJRFUKj5t6wW1hzj3Lv4e3vVsLNyiJheA==
X-Received: by 2002:a05:600c:3b93:b0:3d3:43ae:4d10 with SMTP id
 n19-20020a05600c3b9300b003d343ae4d10mr67483761wms.11.1673800982037; 
 Sun, 15 Jan 2023 08:43:02 -0800 (PST)
Received: from ?IPV6:2a02:908:1256:79a0:a615:2979:ed92:fafd?
 ([2a02:908:1256:79a0:a615:2979:ed92:fafd])
 by smtp.gmail.com with ESMTPSA id
 l14-20020a05600c1d0e00b003da105437besm14457102wms.29.2023.01.15.08.43.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Jan 2023 08:43:01 -0800 (PST)
Message-ID: <27d2a3eb-541f-fd5b-6a92-77e49c74d1b4@gmail.com>
Date: Sun, 15 Jan 2023 17:43:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/6] drm/amdgpu: Generalize KFD dmabuf import
Content-Language: en-US
To: Felix Kuehling <felix.kuehling@amd.com>,
 "Chen, Xiaogang" <xiaogang.chen@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230112013157.750568-1-Felix.Kuehling@amd.com>
 <20230112013157.750568-2-Felix.Kuehling@amd.com>
 <cab37a40-9737-1b77-3a3f-87965d4c70b2@amd.com>
 <9b5b20e0-e04b-f7f6-9459-42d5a4bb44c7@amd.com>
 <1437874c-4b4b-191f-4486-de6ac69e99cc@amd.com>
 <19873c87-5d01-30dd-84d2-ced61b236fa0@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <19873c87-5d01-30dd-84d2-ced61b236fa0@amd.com>
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
Cc: christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 14.01.23 um 00:15 schrieb Felix Kuehling:
> On 2023-01-13 18:00, Chen, Xiaogang wrote:
>>
>> On 1/13/2023 4:26 PM, Felix Kuehling wrote:
>>> On 2023-01-12 17:41, Chen, Xiaogang wrote:
>>>>
>>>> On 1/11/2023 7:31 PM, Felix Kuehling wrote:
>>>>> Use proper amdgpu_gem_prime_import function to handle all kinds of
>>>>> imports. Remember the dmabuf reference to enable proper multi-GPU
>>>>> attachment to multiple VMs without erroneously re-exporting the
>>>>> underlying BO multiple times.
>>>>>
>>>>> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
>>>>> ---
>>>>>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 38 
>>>>> ++++++++++---------
>>>>>   1 file changed, 21 insertions(+), 17 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c 
>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>>>>> index 6f236ded5f12..e13c3493b786 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>>>>> @@ -2209,30 +2209,27 @@ int 
>>>>> amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
>>>>>       struct amdgpu_bo *bo;
>>>>>       int ret;
>>>>>   -    if (dma_buf->ops != &amdgpu_dmabuf_ops)
>>>>> -        /* Can't handle non-graphics buffers */
>>>>> -        return -EINVAL;
>>>>> -
>>>>> -    obj = dma_buf->priv;
>>>>> -    if (drm_to_adev(obj->dev) != adev)
>>>>> -        /* Can't handle buffers from other devices */
>>>>> -        return -EINVAL;
>>>>> +    obj = amdgpu_gem_prime_import(adev_to_drm(adev), dma_buf);
>>>>> +    if (IS_ERR(obj))
>>>>> +        return PTR_ERR(obj);
>>>>>         bo = gem_to_amdgpu_bo(obj);
>>>>>       if (!(bo->preferred_domains & (AMDGPU_GEM_DOMAIN_VRAM |
>>>>> -                    AMDGPU_GEM_DOMAIN_GTT)))
>>>>> +                    AMDGPU_GEM_DOMAIN_GTT))) {
>>>>>           /* Only VRAM and GTT BOs are supported */
>>>>> -        return -EINVAL;
>>>>> +        ret = -EINVAL;
>>>>> +        goto err_put_obj;
>>>>> +    }
>>>>>         *mem = kzalloc(sizeof(struct kgd_mem), GFP_KERNEL);
>>>>> -    if (!*mem)
>>>>> -        return -ENOMEM;
>>>>> +    if (!*mem) {
>>>>> +        ret = -ENOMEM;
>>>>> +        goto err_put_obj;
>>>>> +    }
>>>>>         ret = drm_vma_node_allow(&obj->vma_node, drm_priv);
>>>>> -    if (ret) {
>>>>> -        kfree(*mem);
>>>>> -        return ret;
>>>>> -    }
>>>>> +    if (ret)
>>>>> +        goto err_free_mem;
>>>>>         if (size)
>>>>>           *size = amdgpu_bo_size(bo);
>>>>
>>>> Hi Felix:
>>>>
>>>> I have a question when using amdgpu_gem_prime_import. It will allow 
>>>> importing a dmabuf to different gpus, then can we still call 
>>>> amdgpu_bo_mmap_offset on the generated bo if 
>>>> amdgpu_amdkfd_gpuvm_import_dmabuf also ask mmap_offset?
>>>
>>> The mmap  offset comes from drm_vma_node_offset_addr. The DRM VMA 
>>> address is allocated when ttm_bo_init_reserved calls 
>>> drm_vma_offset_add, so there should be no problem querying the 
>>> mmap_offset. Whether mmapping of an imported BO is actually 
>>> supported is a different question. As far as I can see, it should be 
>>> possible. That said, currently ROCm (libhsakmt) uses only original 
>>> BOs for CPU mappings, not imported BOs.
>>>
>>> Regards,
>>>   Felix
>>
>> The mmap_offset is actually not returned to user space. I just wonder 
>> if here we should get mmap_offset of imported vram buffer if allow bo 
>> be imported to difference gpus. If a vram buffer is imported to same 
>> gpu device amdgpu_bo_mmap_offset is ok, otherwise I think 
>> amdgpu_bo_mmap_offset would not give correct mmap_offset for the 
>> device that the buffer is  imported to.
>
> When the BO is imported into the same GPU, you get a reference to the 
> same BO, so the imported BO has the same mmap_offset as the original BO.
>
> When the BO is imported into a different GPU, it is a new BO with a 
> new mmap_offset.

That won't work.

> I don't think this is incorrect.

No, this is completely incorrect. It mixes up the reverse tracking of 
mappings and might crash the system. This is the reason why we can't 
mmap() imported BOs.

> mmapping the memory with that new offset should still work. The 
> imported BO is created with ttm_bo_type_sg, and AFAICT ttm_bo_vm.c 
> supports mapping of SG BOs.

Actually it shouldn't. This can go boom really easily.

When you have imported a BO the only correct way of to mmap() it is to 
do so on the original exporter.

Regards,
Christian.

>
> Regards,
>   Felix
>
>
>>
>> Maybe we should remove mmap_offset parameter of 
>> amdgpu_amdkfd_gpuvm_import_dmabuf since we do not return it to user 
>> space anyway. With that:
>>
>> Reviewed-by: Xiaogang Chen <Xiaoganng.Chen@amd.com>
>>
>> Regards
>>
>> Xiaogang
>>
>>
>>>
>>>
>>>>
>>>>> @@ -2249,7 +2246,8 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct 
>>>>> amdgpu_device *adev,
>>>>>           | KFD_IOC_ALLOC_MEM_FLAGS_WRITABLE
>>>>>           | KFD_IOC_ALLOC_MEM_FLAGS_EXECUTABLE;
>>>>>   -    drm_gem_object_get(&bo->tbo.base);
>>>>> +    get_dma_buf(dma_buf);
>>>>> +    (*mem)->dmabuf = dma_buf;
>>>>>       (*mem)->bo = bo;
>>>>>       (*mem)->va = va;
>>>>>       (*mem)->domain = (bo->preferred_domains & 
>>>>> AMDGPU_GEM_DOMAIN_VRAM) ?
>>>>> @@ -2261,6 +2259,12 @@ int 
>>>>> amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
>>>>>       (*mem)->is_imported = true;
>>>>>         return 0;
>>>>> +
>>>>> +err_free_mem:
>>>>> +    kfree(*mem);
>>>>> +err_put_obj:
>>>>> +    drm_gem_object_put(obj);
>>>>> +    return ret;
>>>>>   }
>>>>>     /* Evict a userptr BO by stopping the queues if necessary

