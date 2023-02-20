Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CC069C82D
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 11:02:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D337610E65A;
	Mon, 20 Feb 2023 10:02:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48B5C10E64D;
 Mon, 20 Feb 2023 10:01:59 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id x10so1560655edd.13;
 Mon, 20 Feb 2023 02:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=swEqgYB8OsNnxvBfnmM7hvaPOz1vuvKhnnv203lT0+M=;
 b=GCfttIV+nMaPwVQ3v8ZPiT2Oj2+08RJ47wU2YBC1bSh/SrLJXaomCmeNuizbB3G9RQ
 rL4lUdz0Od1aKPfBC3LJmZIOE+9qCYoaiErCUQvRYRVSMKsMil/cyl0Zr2t2uqJsUJLI
 nwVvBS/D0vOIxp3mIZgcseFUTCKaTBwMCsjyf3LEcmwhraJsuGwRqiMDOej8qkeLmFt9
 QOngW/qUc5tKOgN7nwFoR0TKxCghR2DFoXsLjo3p3O155mt3gEsv8+tZ7yOQ/mvLx+Di
 E42b1FFTS4gEwz4AJWQfr2LXixKsHxv/W/zFM/PXSBmk2IMFTs8OKyZfhlwDJfgzc2QO
 Xtnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=swEqgYB8OsNnxvBfnmM7hvaPOz1vuvKhnnv203lT0+M=;
 b=mtIiaytq7iWghTiuqpewf0BPGlo6jhIRDodHc3hWYv7XQ/GZDE9RZDAz6prqqkhM27
 iYP5rZLQWiG0+dli/fKaaocX2w5RaAt/X7blxi/nN5cdrrAquq+DXyFj14PthRKhQeVP
 5/nBO/v1H1ey3CNEs7iQtsp3O05D5NGnFMw9my4GJ7LzLvQR916dd50407G0tzlyIAAM
 fh9qlnRV5v8qHDsl59KZ0CuwWmE6KkXSQBCzn+e0yhJzZl/7MHkGJkPnwGLKKl6yX/5V
 kCHBqbN9sNqUAWvPNyaP1HWhU5b7tP44H5gw4L2zQvphAzVZgzCZqfEDMGyspFCYdALj
 /rqQ==
X-Gm-Message-State: AO0yUKWLv2CcXPPvdApHSYfH3C+nBom7v/EvK6ZVzJ2g7pLHphpHWkbd
 DTt1qnuwQKP0n1JmIG78ljU=
X-Google-Smtp-Source: AK7set9PXlhBlinVM8SD6OFXl4L66YhrGLYQ9r16IxLLAcMibSwgUl/W+0GRd/4MMwadGTKl53l5bA==
X-Received: by 2002:a17:907:a42a:b0:8b1:730b:a296 with SMTP id
 sg42-20020a170907a42a00b008b1730ba296mr16455985ejc.15.1676887317563; 
 Mon, 20 Feb 2023 02:01:57 -0800 (PST)
Received: from ?IPV6:2a02:908:1256:79a0:dede:81be:2cf1:ada5?
 ([2a02:908:1256:79a0:dede:81be:2cf1:ada5])
 by smtp.gmail.com with ESMTPSA id
 my22-20020a1709065a5600b008bc2c2134c5sm3099224ejc.216.2023.02.20.02.01.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 02:01:56 -0800 (PST)
Message-ID: <b7bb9888-b1d3-0d89-1e4f-bc25475b0071@gmail.com>
Date: Mon, 20 Feb 2023 11:01:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] drm/gem: Expose the buffer object handle to userspace last
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20230214125050.1205394-1-tvrtko.ursulin@linux.intel.com>
 <f1256a51-5c4d-ab44-3867-931f7d2c0695@amd.com>
 <767620c4-385f-c0e8-dcb1-513ef4402ad0@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <767620c4-385f-c0e8-dcb1-513ef4402ad0@linux.intel.com>
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
Cc: Rob Clark <robdclark@chromium.org>, lima@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, nouveau@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Ben Skeggs <bskeggs@redhat.com>, David Herrmann <dh.herrmann@gmail.com>,
 spice-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 20.02.23 um 10:55 schrieb Tvrtko Ursulin:
>
> Hi,
>
> On 14/02/2023 13:59, Christian König wrote:
>> Am 14.02.23 um 13:50 schrieb Tvrtko Ursulin:
>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>
>>> Currently drm_gem_handle_create_tail exposes the handle to userspace
>>> before the buffer object constructions is complete. This allowing
>>> of working against a partially constructed object, which may also be in
>>> the process of having its creation fail, can have a range of negative
>>> outcomes.
>>>
>>> A lot of those will depend on what the individual drivers are doing in
>>> their obj->funcs->open() callbacks, and also with a common failure mode
>>> being -ENOMEM from drm_vma_node_allow.
>>>
>>> We can make sure none of this can happen by allocating a handle last,
>>> although with a downside that more of the function now runs under the
>>> dev->object_name_lock.
>>>
>>> Looking into the individual drivers open() hooks, we have
>>> amdgpu_gem_object_open which seems like it could have a potential 
>>> security
>>> issue without this change.
>>>
>>> A couple drivers like qxl_gem_object_open and vmw_gem_object_open
>>> implement no-op hooks so no impact for them.
>>>
>>> A bunch of other require a deeper look by individual owners to asses 
>>> for
>>> impact. Those are lima_gem_object_open, nouveau_gem_object_open,
>>> panfrost_gem_open, radeon_gem_object_open and 
>>> virtio_gpu_gem_object_open.
>>>
>>> Putting aside the risk assesment of the above, some common scenarios to
>>> think about are along these lines:
>>>
>>> 1)
>>> Userspace closes a handle by speculatively "guessing" it from a second
>>> thread.
>>>
>>> This results in an unreachable buffer object so, a memory leak.
>>>
>>> 2)
>>> Same as 1), but object is in the process of getting closed (failed
>>> creation).
>>>
>>> The second thread is then able to re-cycle the handle and idr_remove 
>>> would
>>> in the first thread would then remove the handle it does not own 
>>> from the
>>> idr.
>>>
>>> 3)
>>> Going back to the earlier per driver problem space - individual impact
>>> assesment of allowing a second thread to access and operate on a 
>>> partially
>>> constructed handle / object. (Can something crash? Leak information?)
>>>
>>> In terms of identifying when the problem started I will tag some 
>>> patches
>>> as references, but not all, if even any, of them actually point to a
>>> broken state. I am just identifying points at which more opportunity 
>>> for
>>> issues to arise was added.
>>
>> Yes I've looked into this once as well, but couldn't completely solve 
>> it for some reason.
>>
>> Give me a day or two to get this tested and all the logic swapped 
>> back into my head again.
>
> Managed to recollect what the problem with earlier attempts was?

Nope, that's way to long ago. I can only assume that I ran into problems 
with the object_name_lock.

Probably best to double check if that doesn't result in a lock inversion 
when somebody grabs the reservation lock in their ->load() callback.

Regards,
Christian.

>
> Regards,
>
> Tvrtko
>
>> Christian.
>>
>>>
>>> References: 304eda32920b ("drm/gem: add hooks to notify driver when 
>>> object handle is created/destroyed")
>>> References: ca481c9b2a3a ("drm/gem: implement vma access management")
>>> References: b39b5394fabc ("drm/gem: Add drm_gem_object_funcs")
>>> Cc: dri-devel@lists.freedesktop.org
>>> Cc: Rob Clark <robdclark@chromium.org>
>>> Cc: Ben Skeggs <bskeggs@redhat.com>
>>> Cc: David Herrmann <dh.herrmann@gmail.com>
>>> Cc: Noralf Trønnes <noralf@tronnes.org>
>>> Cc: David Airlie <airlied@gmail.com>
>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>> Cc: amd-gfx@lists.freedesktop.org
>>> Cc: lima@lists.freedesktop.org
>>> Cc: nouveau@lists.freedesktop.org
>>> Cc: Steven Price <steven.price@arm.com>
>>> Cc: virtualization@lists.linux-foundation.org
>>> Cc: spice-devel@lists.freedesktop.org
>>> Cc: Zack Rusin <zackr@vmware.com>
>>> ---
>>>   drivers/gpu/drm/drm_gem.c | 48 
>>> +++++++++++++++++++--------------------
>>>   1 file changed, 24 insertions(+), 24 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>>> index aa15c52ae182..e3d897bca0f2 100644
>>> --- a/drivers/gpu/drm/drm_gem.c
>>> +++ b/drivers/gpu/drm/drm_gem.c
>>> @@ -356,52 +356,52 @@ drm_gem_handle_create_tail(struct drm_file 
>>> *file_priv,
>>>                  u32 *handlep)
>>>   {
>>>       struct drm_device *dev = obj->dev;
>>> -    u32 handle;
>>>       int ret;
>>> WARN_ON(!mutex_is_locked(&dev->object_name_lock));
>>>       if (obj->handle_count++ == 0)
>>>           drm_gem_object_get(obj);
>>> +    ret = drm_vma_node_allow(&obj->vma_node, file_priv);
>>> +    if (ret)
>>> +        goto err_put;
>>> +
>>> +    if (obj->funcs->open) {
>>> +        ret = obj->funcs->open(obj, file_priv);
>>> +        if (ret)
>>> +            goto err_revoke;
>>> +    }
>>> +
>>>       /*
>>> -     * Get the user-visible handle using idr.  Preload and perform
>>> -     * allocation under our spinlock.
>>> +     * Get the user-visible handle using idr as the _last_ step.
>>> +     * Preload and perform allocation under our spinlock.
>>>        */
>>>       idr_preload(GFP_KERNEL);
>>>       spin_lock(&file_priv->table_lock);
>>> -
>>>       ret = idr_alloc(&file_priv->object_idr, obj, 1, 0, GFP_NOWAIT);
>>> -
>>>       spin_unlock(&file_priv->table_lock);
>>>       idr_preload_end();
>>> -    mutex_unlock(&dev->object_name_lock);
>>>       if (ret < 0)
>>> -        goto err_unref;
>>> -
>>> -    handle = ret;
>>> +        goto err_close;
>>> -    ret = drm_vma_node_allow(&obj->vma_node, file_priv);
>>> -    if (ret)
>>> -        goto err_remove;
>>> +    mutex_unlock(&dev->object_name_lock);
>>> -    if (obj->funcs->open) {
>>> -        ret = obj->funcs->open(obj, file_priv);
>>> -        if (ret)
>>> -            goto err_revoke;
>>> -    }
>>> +    *handlep = ret;
>>> -    *handlep = handle;
>>>       return 0;
>>> +err_close:
>>> +    if (obj->funcs->close)
>>> +        obj->funcs->close(obj, file_priv);
>>>   err_revoke:
>>>       drm_vma_node_revoke(&obj->vma_node, file_priv);
>>> -err_remove:
>>> -    spin_lock(&file_priv->table_lock);
>>> -    idr_remove(&file_priv->object_idr, handle);
>>> -    spin_unlock(&file_priv->table_lock);
>>> -err_unref:
>>> -    drm_gem_object_handle_put_unlocked(obj);
>>> +err_put:
>>> +    if (--obj->handle_count == 0)
>>> +        drm_gem_object_put(obj);
>>> +
>>> +    mutex_unlock(&dev->object_name_lock);
>>> +
>>>       return ret;
>>>   }
>>

