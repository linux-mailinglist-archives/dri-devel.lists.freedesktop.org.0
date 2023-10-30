Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2147DBD4A
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 17:01:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65CA010E328;
	Mon, 30 Oct 2023 16:01:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5576910E0F3;
 Mon, 30 Oct 2023 16:01:24 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2c5b7764016so48952761fa.1; 
 Mon, 30 Oct 2023 09:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698681682; x=1699286482; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=i171CPazjUp4MNk6P3+jEOtLNJ0at3DXnR3w7sZGchw=;
 b=nOuYvO9O0NC8ryPqTVwYFgdFVgGhHpUi7JkIzaj++viFIkc5c6gvWfdGHn71bJJE2l
 hTHxmh4z4CdiF7Xf5gp6Ef07AWjDDSw2uES45qJCVHJ19ZHZ1vM6LNLCEjdDmJmp2//G
 P8njA052WbSVxNYEVF/EI6ZCRHjtVExRzMqYvDjDhi37nO4p4bdv+TVnXeLB9x54ILOH
 Qw9j3A7yLn7Ebyu737IRuGm9tv//Jh5BGieeSFsagg2z7r1wXpaCBiGdC8HhIFyMLzQu
 9jS98Gs7yHcsIzTtoObjk2VAeWoZ/q9VtplLjynqwSFaU+oJKs9LOAuGVffsPCtxrRZ9
 bdug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698681682; x=1699286482;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i171CPazjUp4MNk6P3+jEOtLNJ0at3DXnR3w7sZGchw=;
 b=QhWakBeIkBmXeU98KwCzmA8kMOE4eVaXnauTrdCGP4tueZTkCeklDr3Uy772TrX94+
 oc5zmaEOuiS7rkmGru1attXTazKLu0YZrln98ec1XVejED1fYhUJWkMartntamXHPY66
 bgtGzYPFBkvcAn5t3o4lpfm3l5ZhRyB9tz7KYA/evgb9/7HxYnYLwtJvAJfc/97kXNji
 aMXAZwdAyvhwy9PCGl99c47IVM98cdthbtcKEA3/GzADGmVhQ0lN1Wrb1bfrN8rtQfUH
 saau4HnOGV7CM1i5TDXypVi6f0jHLSsux6UFg34+8y20BQ1tpaWHEnKUdRKWk9/Xy0n8
 4VnA==
X-Gm-Message-State: AOJu0Yz2xEf0S3R2UXb2HsYnn5gQlJeeeBRuqc43UdIO3FQZZCG+2/ff
 gDSAjuwElzJxjL9MQXdkC5Q=
X-Google-Smtp-Source: AGHT+IHT8OuTnl2cKAtI40MBwtuDih7dKb+Dx2mHXuQnFTSJGDBs9FJNtZRtvliIHMaC70JvAy0A1g==
X-Received: by 2002:a2e:5056:0:b0:2c5:1640:3c97 with SMTP id
 v22-20020a2e5056000000b002c516403c97mr8600044ljd.22.1698681682133; 
 Mon, 30 Oct 2023 09:01:22 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 t3-20020a1c7703000000b004042dbb8925sm12906628wmi.38.2023.10.30.09.01.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Oct 2023 09:01:21 -0700 (PDT)
Message-ID: <836a6052-ad23-4a5f-9eb5-a7b5361b568c@gmail.com>
Date: Mon, 30 Oct 2023 17:01:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] drm/exec: Pass in initial # of objects
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20231027165859.395638-1-robdclark@gmail.com>
 <20231027165859.395638-7-robdclark@gmail.com>
 <597b5bb3-ca75-4662-9904-12c4d8e9101a@amd.com>
 <CAF6AEGu1Z1k0bKrMZw4-RJSC-nbO=tuDOjQiPmi61_m_1nRCgA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CAF6AEGu1Z1k0bKrMZw4-RJSC-nbO=tuDOjQiPmi61_m_1nRCgA@mail.gmail.com>
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Karol Herbst <kherbst@redhat.com>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, dri-devel@lists.freedesktop.org,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rob Clark <robdclark@chromium.org>, Guchun Chen <guchun.chen@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 Dong Chenchen <dongchenchen2@huawei.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Philip Yang <Philip.Yang@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 linux-arm-msm@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Jonathan Kim <jonathan.kim@amd.com>, Lang Yu <Lang.Yu@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 30.10.23 um 14:38 schrieb Rob Clark:
> On Mon, Oct 30, 2023 at 1:05 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 27.10.23 um 18:58 schrieb Rob Clark:
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> In cases where the # is known ahead of time, it is silly to do the table
>>> resize dance.
>> Ah, yes that was my initial implementation as well, but I ditched that
>> because nobody actually used it.
>>
>> One comment below.
>>
>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c  |  2 +-
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c |  4 ++--
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c |  4 ++--
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c |  4 ++--
>>>    drivers/gpu/drm/drm_exec.c              | 15 ++++++++++++---
>>>    drivers/gpu/drm/nouveau/nouveau_exec.c  |  2 +-
>>>    drivers/gpu/drm/nouveau/nouveau_uvmm.c  |  2 +-
>>>    include/drm/drm_exec.h                  |  2 +-
>>>    8 files changed, 22 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> index efdb1c48f431..d27ca8f61929 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> @@ -65,7 +65,7 @@ static int amdgpu_cs_parser_init(struct amdgpu_cs_parser *p,
>>>        }
>>>
>>>        amdgpu_sync_create(&p->sync);
>>> -     drm_exec_init(&p->exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
>>> +     drm_exec_init(&p->exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
>>>        return 0;
>>>    }
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
>>> index 720011019741..796fa6f1420b 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
>>> @@ -70,7 +70,7 @@ int amdgpu_map_static_csa(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>>>        struct drm_exec exec;
>>>        int r;
>>>
>>> -     drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
>>> +     drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
>>>        drm_exec_until_all_locked(&exec) {
>>>                r = amdgpu_vm_lock_pd(vm, &exec, 0);
>>>                if (likely(!r))
>>> @@ -110,7 +110,7 @@ int amdgpu_unmap_static_csa(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>>>        struct drm_exec exec;
>>>        int r;
>>>
>>> -     drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
>>> +     drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
>>>        drm_exec_until_all_locked(&exec) {
>>>                r = amdgpu_vm_lock_pd(vm, &exec, 0);
>>>                if (likely(!r))
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> index ca4d2d430e28..16f1715148ad 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> @@ -203,7 +203,7 @@ static void amdgpu_gem_object_close(struct drm_gem_object *obj,
>>>        struct drm_exec exec;
>>>        long r;
>>>
>>> -     drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES);
>>> +     drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES, 0);
>>>        drm_exec_until_all_locked(&exec) {
>>>                r = drm_exec_prepare_obj(&exec, &bo->tbo.base, 1);
>>>                drm_exec_retry_on_contention(&exec);
>>> @@ -739,7 +739,7 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
>>>        }
>>>
>>>        drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
>>> -                   DRM_EXEC_IGNORE_DUPLICATES);
>>> +                   DRM_EXEC_IGNORE_DUPLICATES, 0);
>>>        drm_exec_until_all_locked(&exec) {
>>>                if (gobj) {
>>>                        r = drm_exec_lock_obj(&exec, gobj);
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
>>> index b6015157763a..3c351941701e 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
>>> @@ -1105,7 +1105,7 @@ int amdgpu_mes_ctx_map_meta_data(struct amdgpu_device *adev,
>>>
>>>        amdgpu_sync_create(&sync);
>>>
>>> -     drm_exec_init(&exec, 0);
>>> +     drm_exec_init(&exec, 0, 0);
>>>        drm_exec_until_all_locked(&exec) {
>>>                r = drm_exec_lock_obj(&exec,
>>>                                      &ctx_data->meta_data_obj->tbo.base);
>>> @@ -1176,7 +1176,7 @@ int amdgpu_mes_ctx_unmap_meta_data(struct amdgpu_device *adev,
>>>        struct drm_exec exec;
>>>        long r;
>>>
>>> -     drm_exec_init(&exec, 0);
>>> +     drm_exec_init(&exec, 0, 0);
>>>        drm_exec_until_all_locked(&exec) {
>>>                r = drm_exec_lock_obj(&exec,
>>>                                      &ctx_data->meta_data_obj->tbo.base);
>>> diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
>>> index 5d2809de4517..27d11c20d148 100644
>>> --- a/drivers/gpu/drm/drm_exec.c
>>> +++ b/drivers/gpu/drm/drm_exec.c
>>> @@ -69,16 +69,25 @@ static void drm_exec_unlock_all(struct drm_exec *exec)
>>>     * drm_exec_init - initialize a drm_exec object
>>>     * @exec: the drm_exec object to initialize
>>>     * @flags: controls locking behavior, see DRM_EXEC_* defines
>>> + * @nr: the initial # of objects
>>>     *
>>>     * Initialize the object and make sure that we can track locked objects.
>>> + *
>>> + * If nr is non-zero then it is used as the initial objects table size.
>>> + * In either case, the table will grow (be re-allocated) on demand.
>>>     */
>>> -void drm_exec_init(struct drm_exec *exec, uint32_t flags)
>>> +void drm_exec_init(struct drm_exec *exec, uint32_t flags, unsigned nr)
>>>    {
>>> +     size_t sz = PAGE_SIZE;
>>> +
>>> +     if (nr)
>>> +             sz = (size_t)nr * sizeof(void *);
>>> +
>>>        exec->flags = flags;
>>> -     exec->objects = kmalloc(PAGE_SIZE, GFP_KERNEL);
>>> +     exec->objects = kmalloc(sz, GFP_KERNEL);
>> Please use k*v*malloc() here since we can't predict how large that will be.
> or __GFP_NOWARN?  If userspace (or kasan) is cheeky and asks for ~0
> objects, we should probably just fail?

Oh, good point! If this value is controlled by userspace we must be much 
more careful.

Instead of __GFP_NOWARN or any other workaround we should use 
kvmalloc_array() here.

Maybe turn the code upside down, in other words something like this here:

if (!nr)
     nr = PAGE_SIZE / sizeof(void *);

exec->objects = kvmalloc_array(nr, sizeof(void *), GFP_KERNEL);
exec->max_objects = exec->objects ? nr : 0;


Regards,
Christian.

>
> BR,
> -R
>
>> With that fixed the patch is Reviewed-by: Christian König
>> <christian.koenig@amd.com>.
>>
>> Regards,
>> Christian.
>>
>>>        /* If allocation here fails, just delay that till the first use */
>>> -     exec->max_objects = exec->objects ? PAGE_SIZE / sizeof(void *) : 0;
>>> +     exec->max_objects = exec->objects ? sz / sizeof(void *) : 0;
>>>        exec->num_objects = 0;
>>>        exec->contended = DRM_EXEC_DUMMY;
>>>        exec->prelocked = NULL;
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.c b/drivers/gpu/drm/nouveau/nouveau_exec.c
>>> index 19024ce21fbb..f5930cc0b3fb 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_exec.c
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_exec.c
>>> @@ -103,7 +103,7 @@ nouveau_exec_job_submit(struct nouveau_job *job)
>>>
>>>        nouveau_uvmm_lock(uvmm);
>>>        drm_exec_init(exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
>>> -                         DRM_EXEC_IGNORE_DUPLICATES);
>>> +                         DRM_EXEC_IGNORE_DUPLICATES, 0);
>>>        drm_exec_until_all_locked(exec) {
>>>                struct drm_gpuva *va;
>>>
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>> index aae780e4a4aa..3a9331a1c830 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>> @@ -1288,7 +1288,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job)
>>>        }
>>>
>>>        drm_exec_init(exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
>>> -                         DRM_EXEC_IGNORE_DUPLICATES);
>>> +                         DRM_EXEC_IGNORE_DUPLICATES, 0);
>>>        drm_exec_until_all_locked(exec) {
>>>                list_for_each_op(op, &bind_job->ops) {
>>>                        struct drm_gpuva_op *va_op;
>>> diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
>>> index b5bf0b6da791..f1a66c048721 100644
>>> --- a/include/drm/drm_exec.h
>>> +++ b/include/drm/drm_exec.h
>>> @@ -135,7 +135,7 @@ static inline bool drm_exec_is_contended(struct drm_exec *exec)
>>>        return !!exec->contended;
>>>    }
>>>
>>> -void drm_exec_init(struct drm_exec *exec, uint32_t flags);
>>> +void drm_exec_init(struct drm_exec *exec, uint32_t flags, unsigned nr);
>>>    void drm_exec_fini(struct drm_exec *exec);
>>>    bool drm_exec_cleanup(struct drm_exec *exec);
>>>    int drm_exec_lock_obj(struct drm_exec *exec, struct drm_gem_object *obj);

