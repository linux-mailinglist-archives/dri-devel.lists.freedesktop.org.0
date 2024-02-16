Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC20857E71
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 15:02:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B1C10EBDB;
	Fri, 16 Feb 2024 14:02:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NvxPmOgm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C864F10EBDB;
 Fri, 16 Feb 2024 14:02:52 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5128812662eso1097194e87.0; 
 Fri, 16 Feb 2024 06:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708092170; x=1708696970; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6kQc3WXN4WFItSvSprim/t3oN2PXm9mWVhafKA6dwGs=;
 b=NvxPmOgml+T6BFP7uqofrvgKnEZ1rVMyiA9gTIRd13OOkJivuaqtO3rWYbQIFuWbDQ
 zWZBOlTUKo/WIo2r18XB6wc1SY6Ou8n5Y/1y1nof/r4bO0V6kG2IsjUL4Qje/FvjYJYV
 8PfNhlEqAr6TYRbua5WDBhi0VklwDbyAG6+D/8gMiDCsTdnvYhoUDhL3pCpFh4C2tGF/
 qcaaYl17YqLj6iuG+QY7G8xmhTeVj3l4ECgYffQg12X1zLXNsi1SAyjF770n6Uh7K0/Y
 xLs1OyBfsvnbTKYGuI7XYLiap8kZuowX+P8cXf0eCdbk125Q9Jhrq09u5xzebW6PCSph
 /CpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708092170; x=1708696970;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6kQc3WXN4WFItSvSprim/t3oN2PXm9mWVhafKA6dwGs=;
 b=GqMXsPwEgmp0jARwHtApa+hArV1NcjAR7Lt6BDiae/6+vRgMoBvLbErB6GdWollNKG
 mbG83450reZG3Pzv2E/8hAPwEBW40Ny/FhO4y50P+7sWqTHSehOkYZmbfa/kIUHrRq60
 Imo780Oh2DR2QVE5YyMA3BP6VIbWfoqq/k94esEmjJpKRoaDEaqX2AisWLxKp4WzhouL
 E4CWP5yB+uHXzrxCWSaYX4Z2ETpUg2nuafss7ZFxIV3W/xpN5OKd0WHVb2Fx2VPNoZ94
 KJ0xFHN6SykZcMKMezGxBlw/R+dajy2qVlYkocnwr2muPdmX20z2h1MmNaN3+FzgO6pU
 iYqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5BkLjtzp19BIUwDxStz+lx1qZ8rmVRrz0ZjJIwCj3kl+xLtoCTiO3BSJGP9U/OytMvNeROTTpUL04o+ydJ7y1h1o9yo+sEmEd72S5k6sbyRixYM5Ke/5wleIJvtADSl3CIc6fRNIRpO6lKCp3OOHzniJN7VBCWYQjoMcWs6TYslugD5a7GR3KT/wlXpjGYw==
X-Gm-Message-State: AOJu0YyxF6EUpbWgLu5rzoOXuRH3E0b0XXqZDMRIKTxpkxOSDgdYKqxE
 R//osQV4Ar+S4kHaLnxlHie4T2JM3Kpug4Zb7YYupzhUFoKxb45G
X-Google-Smtp-Source: AGHT+IGwGcS5ue9p6fSA4N2fcytY4UkWE7f14+O+/3UexGm+Et8bZJsdamJr4iWzItvPQynTfxxEHA==
X-Received: by 2002:a05:6512:2828:b0:511:9550:31c3 with SMTP id
 cf40-20020a056512282800b00511955031c3mr4459594lfb.48.1708092169575; 
 Fri, 16 Feb 2024 06:02:49 -0800 (PST)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 l36-20020a05600c1d2400b004124525ff18sm1961090wms.26.2024.02.16.06.02.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Feb 2024 06:02:49 -0800 (PST)
Message-ID: <26d13e0c-c52a-4681-bea8-4a631b514edd@gmail.com>
Date: Fri, 16 Feb 2024 15:02:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] drm/buddy: Add defragmentation support
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: alexander.deucher@amd.com, felix.kuehling@amd.com,
 mario.limonciello@amd.com
References: <20240208155000.339325-1-Arunpravin.PaneerSelvam@amd.com>
 <20240208155000.339325-3-Arunpravin.PaneerSelvam@amd.com>
 <af43196c-d926-454b-8914-c5753f5d3799@intel.com>
 <8f218231-68ae-4a9f-880c-11a37fac91f2@amd.com>
 <292710a7-27be-497d-b6a7-67f964e41ed5@intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <292710a7-27be-497d-b6a7-67f964e41ed5@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.02.24 um 14:21 schrieb Matthew Auld:
> On 16/02/2024 12:33, Christian König wrote:
>> Am 16.02.24 um 13:23 schrieb Matthew Auld:
>>> On 08/02/2024 15:50, Arunpravin Paneer Selvam wrote:
>>>> Add a function to support defragmentation.
>>>>
>>>> v1: Defragment the memory beginning from min_order
>>>>      till the required memory space is available.
>>>>
>>>> Signed-off-by: Arunpravin Paneer Selvam 
>>>> <Arunpravin.PaneerSelvam@amd.com>
>>>> Suggested-by: Matthew Auld <matthew.auld@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/drm_buddy.c | 67 
>>>> +++++++++++++++++++++++++++++++------
>>>>   include/drm/drm_buddy.h     |  3 ++
>>>
>>> No users?
>>
>> Other question is how can a buddy allocator fragment in the first place?
>
> The fragmentation is due to pages now being tracked as dirty/clear. 
> Should the allocator merge together a page that is dirty with a page 
> that is cleared? When should it do that? User wants to be able to keep 
> the two separate if possible. For example, freeing one single dirty 
> page can dirty a huge swathe of your already cleared pages if they are 
> merged together. Or do you have some some other ideas here?

Sorry, that was not what I meant. I should probably have been clearer.

That dirty and clean pages are now kept separated is obvious, but why do 
you need to de-fragment them at some point?

Christian.

>
>>
>> Christian.
>>
>>>
>>>>   2 files changed, 59 insertions(+), 11 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>>>> index 33ad0cfbd54c..fac423d2cb73 100644
>>>> --- a/drivers/gpu/drm/drm_buddy.c
>>>> +++ b/drivers/gpu/drm/drm_buddy.c
>>>> @@ -276,10 +276,12 @@ drm_get_buddy(struct drm_buddy_block *block)
>>>>   }
>>>>   EXPORT_SYMBOL(drm_get_buddy);
>>>>   -static void __drm_buddy_free(struct drm_buddy *mm,
>>>> -                 struct drm_buddy_block *block)
>>>> +static unsigned int __drm_buddy_free(struct drm_buddy *mm,
>>>> +                     struct drm_buddy_block *block,
>>>> +                     bool defrag)
>>>>   {
>>>>       struct drm_buddy_block *parent;
>>>> +    unsigned int order;
>>>>         while ((parent = block->parent)) {
>>>>           struct drm_buddy_block *buddy;
>>>> @@ -289,12 +291,14 @@ static void __drm_buddy_free(struct drm_buddy 
>>>> *mm,
>>>>           if (!drm_buddy_block_is_free(buddy))
>>>>               break;
>>>>   -        if (drm_buddy_block_is_clear(block) !=
>>>> -            drm_buddy_block_is_clear(buddy))
>>>> -            break;
>>>> +        if (!defrag) {
>>>> +            if (drm_buddy_block_is_clear(block) !=
>>>> +                drm_buddy_block_is_clear(buddy))
>>>> +                break;
>>>>   -        if (drm_buddy_block_is_clear(block))
>>>> -            mark_cleared(parent);
>>>> +            if (drm_buddy_block_is_clear(block))
>>>> +                mark_cleared(parent);
>>>> +        }
>>>
>>> Maybe check if the two blocks are incompatible and chuck a warn if 
>>> they are not? Main thing is not to hide issues with split blocks 
>>> that should have been merged before.
>>>
>>>> list_del(&buddy->link);
>>>>   @@ -304,8 +308,49 @@ static void __drm_buddy_free(struct 
>>>> drm_buddy *mm,
>>>>           block = parent;
>>>>       }
>>>>   +    order = drm_buddy_block_order(block);
>>>>       mark_free(mm, block);
>>>> +
>>>> +    return order;
>>>> +}
>>>> +
>>>> +/**
>>>> + * drm_buddy_defrag - Defragmentation routine
>>>> + *
>>>> + * @mm: DRM buddy manager
>>>> + * @min_order: minimum order in the freelist to begin
>>>> + * the defragmentation process
>>>> + *
>>>> + * Driver calls the defragmentation function when the
>>>> + * requested memory allocation returns -ENOSPC.
>>>> + */
>>>> +void drm_buddy_defrag(struct drm_buddy *mm,
>>>> +              unsigned int min_order)
>>>
>>> Just wondering if we need "full defag" also? We would probably need 
>>> to call this at fini() anyway.
>>>
>>>> +{
>>>> +    struct drm_buddy_block *block;
>>>> +    struct list_head *list;
>>>> +    unsigned int order;
>>>> +    int i;
>>>> +
>>>> +    if (min_order > mm->max_order)
>>>> +        return;
>>>> +
>>>> +    for (i = min_order - 1; i >= 0; i--) {
>>>
>>> Need to be careful with min_order = 0 ?
>>>
>>>> +        list = &mm->free_list[i];
>>>> +        if (list_empty(list))
>>>> +            continue;
>>>> +
>>>> +        list_for_each_entry_reverse(block, list, link) {
>>>
>>> Don't we need the safe_reverse() variant here, since this is 
>>> removing from the list?
>>>
>>>> +            if (!block->parent)
>>>> +                continue;
>>>> +
>>>> +            order = __drm_buddy_free(mm, block, 1);
>>>> +            if (order >= min_order)
>>>> +                return;
>>>> +        }
>>>> +    }
>>>>   }
>>>> +EXPORT_SYMBOL(drm_buddy_defrag);
>>>>     /**
>>>>    * drm_buddy_free_block - free a block
>>>> @@ -321,7 +366,7 @@ void drm_buddy_free_block(struct drm_buddy *mm,
>>>>       if (drm_buddy_block_is_clear(block))
>>>>           mm->clear_avail += drm_buddy_block_size(mm, block);
>>>>   -    __drm_buddy_free(mm, block);
>>>> +    __drm_buddy_free(mm, block, 0);
>>>>   }
>>>>   EXPORT_SYMBOL(drm_buddy_free_block);
>>>>   @@ -470,7 +515,7 @@ __alloc_range_bias(struct drm_buddy *mm,
>>>>       if (buddy &&
>>>>           (drm_buddy_block_is_free(block) &&
>>>>            drm_buddy_block_is_free(buddy)))
>>>> -        __drm_buddy_free(mm, block);
>>>> +        __drm_buddy_free(mm, block, 0);
>>>>       return ERR_PTR(err);
>>>>   }
>>>>   @@ -588,7 +633,7 @@ alloc_from_freelist(struct drm_buddy *mm,
>>>>     err_undo:
>>>>       if (tmp != order)
>>>> -        __drm_buddy_free(mm, block);
>>>> +        __drm_buddy_free(mm, block, 0);
>>>>       return ERR_PTR(err);
>>>>   }
>>>>   @@ -668,7 +713,7 @@ static int __alloc_range(struct drm_buddy *mm,
>>>>       if (buddy &&
>>>>           (drm_buddy_block_is_free(block) &&
>>>>            drm_buddy_block_is_free(buddy)))
>>>> -        __drm_buddy_free(mm, block);
>>>> +        __drm_buddy_free(mm, block, 0);
>>>>     err_free:
>>>>       if (err == -ENOSPC && total_allocated_on_err) {
>>>> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>>>> index d81c596dfa38..d0f63e7b5915 100644
>>>> --- a/include/drm/drm_buddy.h
>>>> +++ b/include/drm/drm_buddy.h
>>>> @@ -166,6 +166,9 @@ void drm_buddy_free_list(struct drm_buddy *mm,
>>>>                struct list_head *objects,
>>>>                unsigned int flags);
>>>>   +void drm_buddy_defrag(struct drm_buddy *mm,
>>>> +              unsigned int min_order);
>>>> +
>>>>   void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p);
>>>>   void drm_buddy_block_print(struct drm_buddy *mm,
>>>>                  struct drm_buddy_block *block,
>>

