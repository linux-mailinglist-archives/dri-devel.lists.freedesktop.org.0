Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6844B54E9
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 16:36:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2655310E14C;
	Mon, 14 Feb 2022 15:36:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C4E710E14C
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 15:36:33 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id e7so34156825ejn.13
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 07:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=E0HUTHY5HWa3gNuhCg7jsM+b7kIHnYDpa9qKpPkmaxI=;
 b=TbWfQGoTsog0n0bfCIZd2FRpe/z8wPkPOSejLYuDSRGkfx4n6DR0IKzHH+N7/oJRIE
 8fuLL+vhKEKc2JdYH/8oq0Sg3iAhw9/u0qmgoJM2w/fRIygMQZ1j2QUicI8F4Tnfd9Xz
 5d6TcYUD15jpjaUv3HSErPD7pgzdODvCuLRbxhkWwKxc353xcg7iZtcq9a3eJYrw6jFo
 FthoAD5qPCGtXoXjN76z4IexRQG9lAJ2Pq5soE+v8Pe/yZF9bxoLMrh2em8hP6vTpdw1
 uvH9iZxqT5eTMm0RCajjKbrVrkjSGKsuc84Uj5suAHe2SAopV0ocQQf63X2822nG+CQD
 qtNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=E0HUTHY5HWa3gNuhCg7jsM+b7kIHnYDpa9qKpPkmaxI=;
 b=ZWV+aWLHg2BMTc8296U5KXzSrIoNlsTxIplYB3J4Ieh1uIedA2jN2C01A55GQK/kIG
 Q+8Ve0LoaS4eJDSRXW875xDAEjwdEFsgjwZFP1aWWe1ubVU5Y/hK2IaSEMMBnINMH9sS
 x+Cim3S0LI6DQXtnxOgQAHYfZS/0khFXTtScpNmg9+Rvkk5Zi6SyTcwIDZz0x/RYaEIu
 bqs3RPnGJClFhcE4CAUi7JJuKwP207EKnNRIPHQUxC0VXHEo+vrJXsGVPI9er6moFdv1
 CFd7QBsnWTTWkZp6AQp/BDeybh95wn3sJNzZzGQrOG+nkpcuHt+LKJemcV8PS/BUpKZz
 EnXg==
X-Gm-Message-State: AOAM530XGm0E6AkGt10mamMpnY//Etf/b5yZWJtcBHbM6VOl6IYzyijp
 CFQ/5PLnluYeiZt2XG6+jD4=
X-Google-Smtp-Source: ABdhPJwKKNSQF5UOrvehpXJ/vezBnYTrAsRGCao90Kzl+PZjZcYmkvb7LdYPxUnwCW6vmp9WhgqOlg==
X-Received: by 2002:a17:907:1b11:: with SMTP id
 mp17mr82562ejc.541.1644852991514; 
 Mon, 14 Feb 2022 07:36:31 -0800 (PST)
Received: from ?IPV6:2a02:908:1252:fb60:2a37:737a:e023:f7be?
 ([2a02:908:1252:fb60:2a37:737a:e023:f7be])
 by smtp.gmail.com with ESMTPSA id f29sm1575724ejl.12.2022.02.14.07.36.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 07:36:31 -0800 (PST)
Message-ID: <084fdc8b-f75e-b146-e42f-a162c51cebee@gmail.com>
Date: Mon, 14 Feb 2022 16:36:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 02/11] drm/ttm: add common accounting to the resource mgr
 v3
Content-Language: en-US
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20220214093439.2989-1-christian.koenig@amd.com>
 <20220214093439.2989-2-christian.koenig@amd.com>
 <CAM0jSHO-h5i8yrX+eDf8P-5GL=4m-5t3ENkEb0HHjU3pU5fomw@mail.gmail.com>
 <331d7611-2af6-cd22-7c7e-9e7188300d78@gmail.com>
 <CAM0jSHM-VqDa8R9Kv_5oS2e2uqRPiY=UAtfwhBJt=2dNFbTPjg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CAM0jSHM-VqDa8R9Kv_5oS2e2uqRPiY=UAtfwhBJt=2dNFbTPjg@mail.gmail.com>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 felix.kuehling@amd.com, ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.02.22 um 15:29 schrieb Matthew Auld:
> On Mon, 14 Feb 2022 at 13:23, Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Am 14.02.22 um 11:34 schrieb Matthew Auld:
>>> On Mon, 14 Feb 2022 at 09:34, Christian König
>>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>>> It makes sense to have this in the common manager for debugging and
>>>> accounting of how much resources are used.
>>>>
>>>> v2: cleanup kerneldoc a bit
>>>> v3: drop the atomic, update counter under lock instead
>>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> Reviewed-by: Huang Rui <ray.huang@amd.com> (v1)
>>>> Tested-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
>>>> ---
>>>>    drivers/gpu/drm/ttm/ttm_resource.c | 30 ++++++++++++++++++++++++++++++
>>>>    include/drm/ttm/ttm_resource.h     | 11 +++++++++--
>>>>    2 files changed, 39 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
>>>> index ae40e144e728..bbb8a0f7aa14 100644
>>>> --- a/drivers/gpu/drm/ttm/ttm_resource.c
>>>> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
>>>> @@ -41,6 +41,8 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
>>>>                           const struct ttm_place *place,
>>>>                           struct ttm_resource *res)
>>>>    {
>>>> +       struct ttm_resource_manager *man;
>>>> +
>>>>           res->start = 0;
>>>>           res->num_pages = PFN_UP(bo->base.size);
>>>>           res->mem_type = place->mem_type;
>>>> @@ -50,6 +52,11 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
>>>>           res->bus.is_iomem = false;
>>>>           res->bus.caching = ttm_cached;
>>>>           res->bo = bo;
>>>> +
>>>> +       man = ttm_manager_type(bo->bdev, place->mem_type);
>>>> +       spin_lock(&bo->bdev->lru_lock);
>>>> +       man->usage += bo->base.size;
>>>> +       spin_unlock(&bo->bdev->lru_lock);
>>>>    }
>>>>    EXPORT_SYMBOL(ttm_resource_init);
>>>>
>>>> @@ -65,6 +72,9 @@ EXPORT_SYMBOL(ttm_resource_init);
>>>>    void ttm_resource_fini(struct ttm_resource_manager *man,
>>>>                          struct ttm_resource *res)
>>>>    {
>>>> +       spin_lock(&man->bdev->lru_lock);
>>>> +       man->usage -= res->bo->base.size;
>>>> +       spin_unlock(&man->bdev->lru_lock);
>>>>    }
>>>>    EXPORT_SYMBOL(ttm_resource_fini);
>>>>
>>>> @@ -166,6 +176,7 @@ void ttm_resource_manager_init(struct ttm_resource_manager *man,
>>>>           spin_lock_init(&man->move_lock);
>>>>           man->bdev = bdev;
>>>>           man->size = size;
>>>> +       man->usage = 0;
>>>>
>>>>           for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
>>>>                   INIT_LIST_HEAD(&man->lru[i]);
>>>> @@ -226,6 +237,24 @@ int ttm_resource_manager_evict_all(struct ttm_device *bdev,
>>>>    }
>>>>    EXPORT_SYMBOL(ttm_resource_manager_evict_all);
>>>>
>>>> +/**
>>>> + * ttm_resource_manager_usage
>>>> + *
>>>> + * @man: A memory manager object.
>>>> + *
>>>> + * Return how many resources are currently used.
>>> Maybe mention the units here?
>>>
>>> "Return how many resources are currently used, in bytes."
>> Well exactly that's not correct. The whole idea here is that these are
>> driver defined units.
> Ok, I was assuming bo->base.size to operate in bytes(the kernel-doc
> seems to indicate that) and ttm_resource_{init, fini} are using this
> to track the man->usage.

Yeah, good point. That one is the next on my TODO list to fix.

Christian.

>
>> E.g. for the AMDGPU OA and GWS resources it's essentially a hardware block.
>>
>> Regards,
>> Christian.
>>
>>> Anyway,
>>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>>>
>>>> + */
>>>> +uint64_t ttm_resource_manager_usage(struct ttm_resource_manager *man)
>>>> +{
>>>> +       uint64_t usage;
>>>> +
>>>> +       spin_lock(&man->bdev->lru_lock);
>>>> +       usage = man->usage;
>>>> +       spin_unlock(&man->bdev->lru_lock);
>>>> +       return usage;
>>>> +}
>>>> +EXPORT_SYMBOL(ttm_resource_manager_usage);
>>>> +
>>>>    /**
>>>>     * ttm_resource_manager_debug
>>>>     *
>>>> @@ -238,6 +267,7 @@ void ttm_resource_manager_debug(struct ttm_resource_manager *man,
>>>>           drm_printf(p, "  use_type: %d\n", man->use_type);
>>>>           drm_printf(p, "  use_tt: %d\n", man->use_tt);
>>>>           drm_printf(p, "  size: %llu\n", man->size);
>>>> +       drm_printf(p, "  usage: %llu\n", ttm_resource_manager_usage(man));
>>>>           if (man->func->debug)
>>>>                   man->func->debug(man, p);
>>>>    }
>>>> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
>>>> index 555a11fb8a7f..323c14a30c6b 100644
>>>> --- a/include/drm/ttm/ttm_resource.h
>>>> +++ b/include/drm/ttm/ttm_resource.h
>>>> @@ -27,6 +27,7 @@
>>>>
>>>>    #include <linux/types.h>
>>>>    #include <linux/mutex.h>
>>>> +#include <linux/atomic.h>
>>>>    #include <linux/dma-buf-map.h>
>>>>    #include <linux/dma-fence.h>
>>>>    #include <drm/drm_print.h>
>>>> @@ -130,10 +131,15 @@ struct ttm_resource_manager {
>>>>           struct dma_fence *move;
>>>>
>>>>           /*
>>>> -        * Protected by the global->lru_lock.
>>>> +        * Protected by the bdev->lru_lock.
>>>>            */
>>>> -
>>>>           struct list_head lru[TTM_MAX_BO_PRIORITY];
>>>> +
>>>> +       /**
>>>> +        * @usage: How much of the resources are used, protected by the
>>>> +        * bdev->lru_lock.
>>>> +        */
>>>> +       uint64_t usage;
>>>>    };
>>>>
>>>>    /**
>>>> @@ -283,6 +289,7 @@ void ttm_resource_manager_init(struct ttm_resource_manager *man,
>>>>    int ttm_resource_manager_evict_all(struct ttm_device *bdev,
>>>>                                      struct ttm_resource_manager *man);
>>>>
>>>> +uint64_t ttm_resource_manager_usage(struct ttm_resource_manager *man);
>>>>    void ttm_resource_manager_debug(struct ttm_resource_manager *man,
>>>>                                   struct drm_printer *p);
>>>>
>>>> --
>>>> 2.25.1
>>>>

