Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 946637365E7
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 10:16:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43E6210E289;
	Tue, 20 Jun 2023 08:16:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8241910E284;
 Tue, 20 Jun 2023 08:16:32 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-1a36d569049so1241631fac.0; 
 Tue, 20 Jun 2023 01:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687248991; x=1689840991;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kjVZ4PN4isMB1Dobbg0vE41YrHLTNvt78CIQOX9sVwU=;
 b=UI0wBVbeWBC6SAjXdWm7xnrVk0Z16b4CanTaAKy0apy59G2UzxkFdeVstnwULQq9PG
 1t24jwuP9YbtAat77M5EovGu2wTZ+cMK9aE2Eh5GnIn9V/4TTE/NlJluOvnIFeOrqI5A
 z/nMvbgRpa4O6wRy3eDB+y0b/O2v07u0+21763eVqyk9YmIxcmY7RkVLa1PBhcGWg9ab
 q1jkXMKI4QJs7gE9pH5rdTGCIMNWx3kZGqqOys8cA0GYjbbHl+KxQJXwx/wZlUfYFMum
 8lsBXiWeoM3AM1NuYZ+4AOnxmbdlDWvnlSOFIZtgl+PyHzxxzrHB3Gsi53N8AsrrNyWl
 +6zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687248991; x=1689840991;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kjVZ4PN4isMB1Dobbg0vE41YrHLTNvt78CIQOX9sVwU=;
 b=kL9Tg73wTr1phNYCcWrwVfUEDa05RaV2vQXWuM66b9SBHFPZmJkubB1267CI3Uck1W
 VQfHZNBCTKQn3wqy/Tr2IIaAWbYlccvJZAon/HIINjsmFi2heIINH6nPX4rYHfFJ4EV7
 nrmGpNx2eIPaLfzRln6xXBRKYaAMf8879oFvW62yXFwr+gHLB9meb3wFZuYz2+Q9V6/Q
 dAeOW2dfe2K8RzDeydz3dqwVD33VyU3lS7jiuJFYOq/h1qRHUyEvR/zH0bt1XdismEgT
 L46frVZF8GTJmOrRKR8wWiwnP0Uni5gwRyAfOp8JDFFmquXwg9I1y/Rq1EdZB3whg8af
 Wk5A==
X-Gm-Message-State: AC+VfDzEwIsboN5E3LYe24T49QDfAp2RgpIxSFrK8GyphEct0HGC56LU
 hlbTcj5jsez1BNkPd2aLJqo=
X-Google-Smtp-Source: ACHHUZ4Lk92T1RP53eW84uDS0rFgaWwbD2ShWX2vIL2xa5FlvVRWUfnzY5Tsggtx8rN4UfsodVqVyg==
X-Received: by 2002:aca:f0d4:0:b0:394:6388:22bb with SMTP id
 o203-20020acaf0d4000000b00394638822bbmr8257740oih.5.1687248990671; 
 Tue, 20 Jun 2023 01:16:30 -0700 (PDT)
Received: from [10.104.2.174] (zz20184013906F627101.userreverse.dion.ne.jp.
 [111.98.113.1]) by smtp.gmail.com with ESMTPSA id
 fs9-20020a17090af28900b00256504e0937sm6860597pjb.34.2023.06.20.01.16.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jun 2023 01:16:30 -0700 (PDT)
Message-ID: <34606cc5-7ef8-3d68-659d-fcfa35dd10e8@gmail.com>
Date: Tue, 20 Jun 2023 17:16:26 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 06/13] drm/amdgpu: use the new drm_exec object for CS v2
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 francois.dugast@intel.com, felix.kuehling@amd.com,
 arunpravin.paneerselvam@amd.com, thomas_os@shipmail.org, dakr@redhat.com,
 luben.tuikov@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, matthew.brost@intel.com,
 boris.brezillon@collabora.com
References: <20230504115159.2245-1-christian.koenig@amd.com>
 <20230504115159.2245-7-christian.koenig@amd.com>
 <e163fa54-b016-1879-d1c0-840a4d3885b1@gmail.com>
 <08169925-eb0b-bc79-e6f1-1eaa26198f5e@gmail.com>
From: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
In-Reply-To: <08169925-eb0b-bc79-e6f1-1eaa26198f5e@gmail.com>
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

On 6/20/23 17:12, Christian König wrote:
> Am 20.06.23 um 06:07 schrieb Tatsuyuki Ishi:
>> +Boris and +Matthew in case you want to take over this patch set.
>>
>> Here are some review / testing comments, including those I posted before to ease tracking.
>>
>> On 5/4/23 20:51, Christian König wrote:
>>> Use the new component here as well and remove the old handling.
>>>
>>> v2: drop dupplicate handling
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h         |   1 -
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c |  71 ++-----
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h |   5 +-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c      | 210 +++++++++-----------
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h      |   7 +-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      |  22 --
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h      |   3 -
>>>   7 files changed, 115 insertions(+), 204 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> index 02b827785e39..eba3e4f01ea6 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> @@ -133,6 +141,8 @@ int amdgpu_bo_list_create(struct amdgpu_device *adev, struct drm_file *filp,
>>>         list->first_userptr = first_userptr;
>>>       list->num_entries = num_entries;
>>> +    sort(array, last_entry, sizeof(struct amdgpu_bo_list_entry),
>>> +         amdgpu_bo_list_entry_cmp, NULL);
>>
>> Previously amdgpu_bo_list_get_list sorted all entries, but this one only sorts userptr entries. I think this changes behavior?
> 
> The intention here is to sort all entries except the userptrs. Need to double check.

Sorry, I mistyped. You're right that it sorts all entries except the userptrs. The previous code seems to sort all entries including userptrs.

>>
>>> @@ -928,18 +874,56 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
>>>           e->user_invalidated = userpage_invalidated;
>>>       }
>>>   -    r = ttm_eu_reserve_buffers(&p->ticket, &p->validated, true,
>>> -                   &duplicates);
>>> -    if (unlikely(r != 0)) {
>>> -        if (r != -ERESTARTSYS)
>>> -            DRM_ERROR("ttm_eu_reserve_buffers failed.\n");
>>> -        goto out_free_user_pages;
>>> +    drm_exec_while_not_all_locked(&p->exec) {
>>> +        r = amdgpu_vm_lock_pd(&fpriv->vm, &p->exec);
>>> +        drm_exec_continue_on_contention(&p->exec);
>>
>> Duplicate handling is needed for pretty much every call of amdgpu_vm_lock_pd, as bo->tbo.base.resv == vm->root.bo->tbo.base.resv for AMDGPU_GEM_CREATE_VM_ALWAYS_VALID.
> 
> Well no. AMDGPU_GEM_CREATE_VM_ALWAYS_VALID means that BOs should *not* be part of the relocation list. So when those cause an EALREADY here then userspace has a bug.

Sounds fair, lemme check how RADV is handling this again.

Tatsuyuki

