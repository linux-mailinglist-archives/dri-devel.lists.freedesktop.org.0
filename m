Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAA07FEFCB
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 14:13:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A08B10E6F9;
	Thu, 30 Nov 2023 13:13:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F1D10E25B;
 Thu, 30 Nov 2023 13:13:31 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2c9bd3ec4f6so11558731fa.2; 
 Thu, 30 Nov 2023 05:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701350009; x=1701954809; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lpjcQrbyaMdmyLXpX/iGu48uj7cMcqKRf2l/C1Dyy50=;
 b=NCcImykd9IqbZHzDqtVLsnubC4Alo19HqrCKzHGID6VTPxMvdoBksngul9nCUoum6F
 +w3dcsAyEvdmc+WyWaw4k07FxfdlhJf40MUETQ9Mlfyc8DgAOcdpOrWPsZEAi3G6mYvA
 3SMVWSW8fErS1lRDr/z7zhInwau71BytvBE14RMU9+ghMsE+HfazIZ7Y+jbDq6iYjrOS
 ACQmvNJ2SXwhPrIpK1BJXSH0B4DBnpdkiX8kZKVJgMi9py34+UOeTfzUEJYOrZSNu94X
 CzHuI9tlnd3DuAYuKy7YgU4P1e6s8b4WPFsTWnpwCX7iyOTUyrSFdCURoTlf22iWLE/H
 9tOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701350009; x=1701954809;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lpjcQrbyaMdmyLXpX/iGu48uj7cMcqKRf2l/C1Dyy50=;
 b=ikmeSxlhf4p5V4XIc6/nYhvJT/Q5mfNxKjGnkZliDUbnSgKSM7MmaCRSYk+2OvEe90
 6ip33c2BmSr3OQUFl0wm2IpsJScxm/afzdRyv6biiRLTe/PZiiTYUJcFenYefzw4cbHc
 T7npRFN7XIuILB3N5BK5MWxk9iPZwU2sFHVrrCNsqltu2ODncIG6ZzxAZp8qthDoWv7H
 /VPCMbPuZY85QJ8t/Cqvc/LfQeomBBIV6MINkMxwjVNyrNnsEe6YNblLF+3gJo13N3f4
 jdzIY07bh4Cc64qkOTASaBCxT/f4nBGcdPYDD1BKTXx4tOzXHK6+zK5/lP3dwuPi9YNu
 Eqqw==
X-Gm-Message-State: AOJu0Yxu0KxtxwpK+PCGVJzx+Zude4OZuCkb7z1F9iTxd2+hPG1Ectqs
 p8uf+dqsSWNLtQIuzszNuOg=
X-Google-Smtp-Source: AGHT+IGFwbXGvZm6h2L64MDvDIfekqdCwaSBjEHRIKuP+f7ELf3eTER+oogJ6cLeo0TfBhXnd2/w1g==
X-Received: by 2002:a2e:8650:0:b0:2c9:ac5f:f959 with SMTP id
 i16-20020a2e8650000000b002c9ac5ff959mr6584316ljj.39.1701350008891; 
 Thu, 30 Nov 2023 05:13:28 -0800 (PST)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 p36-20020a05600c1da400b0040b478da760sm1951924wms.48.2023.11.30.05.13.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Nov 2023 05:13:28 -0800 (PST)
Message-ID: <9853f121-be57-4be1-9fc6-247254a12653@gmail.com>
Date: Thu, 30 Nov 2023 14:13:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: add shared fdinfo stats
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, Alex Deucher <alexdeucher@gmail.com>
References: <20231117195626.13599-1-alexander.deucher@amd.com>
 <a42a4321-9dce-4c76-9578-8ea665b874f8@gmail.com>
 <CADnq5_NiHRhDJt+bkdy35GPfTaTUdSRrf_aVVQobfFgayHP2hw@mail.gmail.com>
 <CAF6AEGvVdnTsj1DZjOYn6YaygEqsJDkAUzbF_thgAw2CTLfBxA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CAF6AEGvVdnTsj1DZjOYn6YaygEqsJDkAUzbF_thgAw2CTLfBxA@mail.gmail.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Rob Clark <robdclark@chromium.org>, amd-gfx@lists.freedesktop.org,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 28.11.23 um 18:52 schrieb Rob Clark:
> On Tue, Nov 28, 2023 at 6:28 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>> On Tue, Nov 28, 2023 at 9:17 AM Christian König
>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>> Am 17.11.23 um 20:56 schrieb Alex Deucher:
>>>> Add shared stats.  Useful for seeing shared memory.
>>>>
>>>> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>>>> ---
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c |  4 ++++
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 11 +++++++++++
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  6 ++++++
>>>>    3 files changed, 21 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
>>>> index 5706b282a0c7..c7df7fa3459f 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
>>>> @@ -97,6 +97,10 @@ void amdgpu_show_fdinfo(struct drm_printer *p, struct drm_file *file)
>>>>                   stats.requested_visible_vram/1024UL);
>>>>        drm_printf(p, "amd-requested-gtt:\t%llu KiB\n",
>>>>                   stats.requested_gtt/1024UL);
>>>> +     drm_printf(p, "drm-shared-vram:\t%llu KiB\n", stats.vram_shared/1024UL);
>>>> +     drm_printf(p, "drm-shared-gtt:\t%llu KiB\n", stats.gtt_shared/1024UL);
>>>> +     drm_printf(p, "drm-shared-cpu:\t%llu KiB\n", stats.cpu_shared/1024UL);
>>>> +
>>>>        for (hw_ip = 0; hw_ip < AMDGPU_HW_IP_NUM; ++hw_ip) {
>>>>                if (!usage[hw_ip])
>>>>                        continue;
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>>> index d79b4ca1ecfc..c24f7b2c04c1 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>>> @@ -1287,25 +1287,36 @@ void amdgpu_bo_get_memory(struct amdgpu_bo *bo,
>>>>                          struct amdgpu_mem_stats *stats)
>>>>    {
>>>>        uint64_t size = amdgpu_bo_size(bo);
>>>> +     struct drm_gem_object *obj;
>>>>        unsigned int domain;
>>>> +     bool shared;
>>>>
>>>>        /* Abort if the BO doesn't currently have a backing store */
>>>>        if (!bo->tbo.resource)
>>>>                return;
>>>>
>>>> +     obj = &bo->tbo.base;
>>>> +     shared = obj->handle_count > 1;
>>> Interesting approach but I don't think that this is correct.
>>>
>>> The handle_count is basically how many GEM handles are there for BO, so
>>> for example it doesn't catch sharing things with V4L.
>>>
>>> What we should probably rather do is to take a look if
>>> bo->tbo.base.dma_buf is NULL or not.
>> +Rob, dri-devel
>>
>> This is what the generic drm helper code does.  See
>> drm_show_memory_stats().  If that is not correct that code should
>> probably be fixed too.
> OTOH, v4l doesn't expose fdinfo.  What "shared" is telling you is
> whether the BO is counted multiple times when you look at all
> processes fdinfo.

Oh, then that's not fully correct either.

You can have multiple handles for the same GEM object in a single client 
as well.

This for example happens when you interact with KMS to get an handle for 
a displayed BO.

DRM flink was one of the major other reasons, but I hope we are not 
using that widely any more.

What exactly is the purpose? To avoid counting a BO multiple times 
because you go over the handles in the common code?

If yes than I would say use obj->handle_count in the common code and 
ob->dma_buf in amdgpu because that is certainly unique.

Regards,
Christian.

>
> But I guess it would be ok to look for obj->handle_count > 1 || obj->dma_buf
>
> BR,
> -R
>
>> Alex
>>
>>> Regards,
>>> Christian.
>>>
>>>
>>>> +
>>>>        domain = amdgpu_mem_type_to_domain(bo->tbo.resource->mem_type);
>>>>        switch (domain) {
>>>>        case AMDGPU_GEM_DOMAIN_VRAM:
>>>>                stats->vram += size;
>>>>                if (amdgpu_bo_in_cpu_visible_vram(bo))
>>>>                        stats->visible_vram += size;
>>>> +             if (shared)
>>>> +                     stats->vram_shared += size;
>>>>                break;
>>>>        case AMDGPU_GEM_DOMAIN_GTT:
>>>>                stats->gtt += size;
>>>> +             if (shared)
>>>> +                     stats->gtt_shared += size;
>>>>                break;
>>>>        case AMDGPU_GEM_DOMAIN_CPU:
>>>>        default:
>>>>                stats->cpu += size;
>>>> +             if (shared)
>>>> +                     stats->cpu_shared += size;
>>>>                break;
>>>>        }
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
>>>> index d28e21baef16..0503af75dc26 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
>>>> @@ -138,12 +138,18 @@ struct amdgpu_bo_vm {
>>>>    struct amdgpu_mem_stats {
>>>>        /* current VRAM usage, includes visible VRAM */
>>>>        uint64_t vram;
>>>> +     /* current shared VRAM usage, includes visible VRAM */
>>>> +     uint64_t vram_shared;
>>>>        /* current visible VRAM usage */
>>>>        uint64_t visible_vram;
>>>>        /* current GTT usage */
>>>>        uint64_t gtt;
>>>> +     /* current shared GTT usage */
>>>> +     uint64_t gtt_shared;
>>>>        /* current system memory usage */
>>>>        uint64_t cpu;
>>>> +     /* current shared system memory usage */
>>>> +     uint64_t cpu_shared;
>>>>        /* sum of evicted buffers, includes visible VRAM */
>>>>        uint64_t evicted_vram;
>>>>        /* sum of evicted buffers due to CPU access */

