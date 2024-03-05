Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DF6871EA1
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 13:11:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C0F8112578;
	Tue,  5 Mar 2024 12:11:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HZ59FvuN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C88D3112578;
 Tue,  5 Mar 2024 12:11:51 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-412e1b52934so13560815e9.1; 
 Tue, 05 Mar 2024 04:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709640710; x=1710245510; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=79jaKyfdpKy+1NMDJb03g6RVhJ14q9VXyWQQ+0hrcUc=;
 b=HZ59FvuNlKar0p3xhNltXRobUcjAJu75xGehGDTjxyj9HONFR8aZX3tHYd/ve3Mi6Y
 OSjdNqzlL46ayplStDlp6StnVzaiKzuy8QKje2nngFjPeW6iwxGYS4dji2WEcQxGkGjy
 WFJNzd5zmdvsbzqlGkBPxZ+Ar8gZetdV2+LWgUZ0aWDga1I+YkMcN5DI97+IuWpN/WQs
 3Jfg9IIir80IsLPsbu7Cn2iCgKj67MdfJRcvjegVCMfcpDE6EPERd4KO4AFeD7/OJfpR
 8Oqj7LwWxY10pyIKQuwG2iH8LMGpRQWvz+l3gdfa8KVSrUeGhOGZ3v58kUIPVyb6SynV
 5vDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709640710; x=1710245510;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=79jaKyfdpKy+1NMDJb03g6RVhJ14q9VXyWQQ+0hrcUc=;
 b=iDkZIcNkJGj3miZivdk0/0Fo242fhJbfjbr+KHY6oeCUZmPjhGO+mBSKNKX3wjH/7o
 Pt2cy2AzU3+vKvc7pta6VuJIxaZ/5bZpqxVhtBx8tXNirJVQO1ybe+THUUW8xvlNYfp3
 XE2zjpd1eljbHTRb2BOjSqMFwvaiaeszzh3CvehgIA8BKlOcZxOFNnOrYqXqYvC75qHp
 Q0JtGx4Z29npHdt2/Ex0LZTVDYCHvXq7KPMMrZVpJ3G4eE0Nb5ONFokYLYOubRw8PekR
 4Ig81hvWs28SKeC8cwt+p4lX94AMk2u4TOgE6EXJZIdgLOOki8m0ZFxJCArsjQ5kWK1Y
 1GIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqiN1jsmlgsJOL7y548arM01jOGB5NPGMkKwtfrIWwa+iyj6ILGpMOVqBgR4BHVb1pK2YaJ6zrNIrfHqFGhSB83J9hf9OaiAByHvXW2hlYycJkavCSAuB3yIqyfem5ouEzP4Ea6ume7noh7TkLkMSe6H3e255EFiu7cbiqV49rL04EEqADrCqSSMC9GvWnDA==
X-Gm-Message-State: AOJu0YzoUl8Nq1qGjQl3qco9RYyFkzy6fCancmto8nz0tyKkPZET1RVq
 lTwyj/Nt2A3wxslgMFCsxvw29VR+DS/1Inet9WGCPL2DleNg4Bdi
X-Google-Smtp-Source: AGHT+IHzQqU0+5WnRZPb1BDcCRMX2yZ2q2KRwjr10P/4VnWZ9Ct6ATEg/82gChlvVPfNXOWbcLcKvA==
X-Received: by 2002:a05:600c:1e22:b0:412:ef76:3d3d with SMTP id
 ay34-20020a05600c1e2200b00412ef763d3dmr664742wmb.18.1709640709584; 
 Tue, 05 Mar 2024 04:11:49 -0800 (PST)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a05600c4f4900b00412ec373ad4sm2004265wmq.27.2024.03.05.04.11.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Mar 2024 04:11:49 -0800 (PST)
Message-ID: <db55d7ac-0811-496f-81e3-56c742a9ae56@gmail.com>
Date: Tue, 5 Mar 2024 13:11:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/3] drm/buddy: Add user for defragmentation
Content-Language: en-US
To: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: christian.koenig@amd.com, alexander.deucher@amd.com,
 matthew.auld@intel.com, felix.kuehling@amd.com, mario.limonciello@amd.com
References: <20240304163220.3093-1-Arunpravin.PaneerSelvam@amd.com>
 <20240304163220.3093-3-Arunpravin.PaneerSelvam@amd.com>
 <77148946-83ef-4576-a26b-ec84f9a4c63a@gmail.com>
 <aaf76e24-787d-4ca7-b3af-3636d065c1f6@amd.com>
 <f0fae5dd-533b-4649-b338-935f4518036c@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <f0fae5dd-533b-4649-b338-935f4518036c@amd.com>
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

Am 05.03.24 um 12:14 schrieb Paneer Selvam, Arunpravin:
> On 3/5/2024 4:33 PM, Paneer Selvam, Arunpravin wrote:
>> Hi Christian,
>>
>> On 3/4/2024 10:09 PM, Christian König wrote:
>>> Am 04.03.24 um 17:32 schrieb Arunpravin Paneer Selvam:
>>>> Add amdgpu driver as user for the drm buddy
>>>> defragmentation.
>>>>
>>>> Signed-off-by: Arunpravin Paneer Selvam 
>>>> <Arunpravin.PaneerSelvam@amd.com>
>>>> ---
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 17 +++++++++++++++--
>>>>   drivers/gpu/drm/drm_buddy.c                  |  1 +
>>>>   2 files changed, 16 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>>> index e494f5bf136a..cff8a526c622 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>>> @@ -533,8 +533,21 @@ static int amdgpu_vram_mgr_new(struct 
>>>> ttm_resource_manager *man,
>>>>                          min_block_size,
>>>>                          &vres->blocks,
>>>>                          vres->flags);
>>>> -        if (unlikely(r))
>>>> -            goto error_free_blocks;
>>>> +        if (unlikely(r)) {
>>>> +            if (r == -ENOSPC) {
>>>> +                drm_buddy_defrag(mm, min_block_size);
>>>> +                r = drm_buddy_alloc_blocks(mm, fpfn,
>>>> +                               lpfn,
>>>> +                               size,
>>>> +                               min_block_size,
>>>> +                               &vres->blocks,
>>>> +                               vres->flags);
>>>
>>> That doesn't looks like something we should do.
>>>
>>> We might fallback when contiguous memory is requested, but certainly 
>>> not on normal allocation failure.
>> yes, defrag here not useful for normal allocations. But worried about 
>> the bigger min_block_size normal allocations.
>> In such cases, I think we should move this drm_buddy_defrag() call 
>> into buddy allocator file. For example if the required
>> size is 1024KiB and if min_block_size is 256KiB, the allocator first 
>> tries to find the 1024KiB block, when there is no single 1024KiB block,
>> the allocator goes one level below in freelist and tries to search 
>> for two 512KiB blocks and goes on. At one point of time if we have 
>> less space,
>> we might go further levels below to search four 256KiB blocks to 
>> satisfy the request.
>>
>> Assuming if the allocator cannot find the first 256KiB block, that 
>> time I think we might need to merge the two 128KiB blocks
>> through defragmentation function. And again for the second 256KiB 
>> block, we might need to call the defragmentation again to
>> merge two 128KiB blocks or four 64KiB blocks to form minimum 
>> alignment size of 256KiB. This goes on for the third and fourth
>> 256KiB blocks to complete the required size allocation of 1024KiB. 
>> Please let me know if my understanding is not correct.

I don't think we should do that. We essentially have to support two 
different use cases:

1. Non contiguous allocation with 2MiB min_block_size for everything 
larger than 2MiB. Using a block size as large as possible is desirable, 
but not something we enforce.

2. Contiguous allocations for display, firmware etc.. Here we need to 
enforce a large block size and can live with the additional overhead 
caused by force merging.

>
> As you have suggested we can also rename this as force merge or some 
> other names.

Yeah, but just an suggestion. You are way deeper in the code and 
handling than I'm, so feel free to name it whatever you think fits best.

Regards,
Christian.


>
> Thanks,
> Arun.
>>
>> Thanks,
>> Arun.
>>>
>>> Regards,
>>> Christian.
>>>
>>>> +                if (unlikely(r))
>>>> +                    goto error_free_blocks;
>>>> +            } else {
>>>> +                goto error_free_blocks;
>>>> +            }
>>>> +        }
>>>>             if (size > remaining_size)
>>>>               remaining_size = 0;
>>>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>>>> index 40131ed9b0cd..19440f8caec0 100644
>>>> --- a/drivers/gpu/drm/drm_buddy.c
>>>> +++ b/drivers/gpu/drm/drm_buddy.c
>>>> @@ -396,6 +396,7 @@ void drm_buddy_defrag(struct drm_buddy *mm,
>>>>           }
>>>>       }
>>>>   }
>>>> +EXPORT_SYMBOL(drm_buddy_defrag);
>>>>     /**
>>>>    * drm_buddy_free_block - free a block
>>>
>>
>

