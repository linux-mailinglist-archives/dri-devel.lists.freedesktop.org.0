Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D63D9509777
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 08:26:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A57610F453;
	Thu, 21 Apr 2022 06:26:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1F2110F44E;
 Thu, 21 Apr 2022 06:26:30 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id u15so7854985ejf.11;
 Wed, 20 Apr 2022 23:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to;
 bh=cd1egrVMwW6VynWrNSFyUHI/QPQ/T4PEowZfARpEMYo=;
 b=OcHukgust1pXfGtFgT4ZSrPYVWPPReFZv1OKeBBvlTAbJMG+zbyO1XGHFsWmispyx+
 L4ANORg4QZ50gMscSf2rAJlDhZmyM0JG+xv5BCdvVNfUuCalsbpa+93u3YaviyD7Ko3Z
 Y3KC0FOARL1TazkV8fzHleniLoOal9sbgtUkaDhqC3d7ApEtmFoYSdcNYtIs0eIkL6bY
 009NksmndEKHSE9CNDqfFPKptH4XHu0vtcHL6C0iH3xduqOUS2ZcnqTYM+kDw3Dxo+Bi
 /O7VdT6vZ9bEKu7B1hxbAk27jCiL4b2RIMt9QmChdvvJIAoNAfzUJQIWW2aZIx36YhYB
 5ieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to;
 bh=cd1egrVMwW6VynWrNSFyUHI/QPQ/T4PEowZfARpEMYo=;
 b=6GuAhFAUboyR1JbbZKC0/k/NjWSNZaqX/t3PgU3b3KmMbwEy6v1WUBChjFm2XgB705
 N1zHG4vzL/5SGiRmbvbgTluBPJt/rwKsA6yMG1F4lZbJlAzCLR4ctITYybPI+SiEOdhv
 i0dVSEZGEYiIV2LkjRWZ8vD9hvMhqCAs6gMIfLjoP9hAH9LDRpd2NtaiwNoqiX1YDdrO
 VLkzfaTJDCiXkelMEGAap0WUNZU2M3lL9Yv9E49M23yxyXsNIbo498mwxrMplvHvJwUO
 L/POlK4pEnqUoIdDiv00ItNZ4nFQSmoxMnnVw4gxPhLQ2WxYZVfpfmQVug1ctKr6lRNJ
 /ZZQ==
X-Gm-Message-State: AOAM530gqYT/zojiCKK0NisBAQWso1uK2P6kk5txruUXOsqVn5NyFowW
 bSPS0Zl+W5Gs+RcYEnZ5fN4=
X-Google-Smtp-Source: ABdhPJxU7lLXxpZENOm11+GPWGbpLlKpzt/pl7vrTjNHecZMJg29IpbJl7RzSZz7ECwc0eMfANF6+A==
X-Received: by 2002:a17:907:2ce5:b0:6f0:1d2c:118d with SMTP id
 hz5-20020a1709072ce500b006f01d2c118dmr1439715ejc.715.1650522389220; 
 Wed, 20 Apr 2022 23:26:29 -0700 (PDT)
Received: from ?IPV6:2a02:908:1252:fb60:74ec:39fd:9a7c:7ff3?
 ([2a02:908:1252:fb60:74ec:39fd:9a7c:7ff3])
 by smtp.gmail.com with ESMTPSA id
 wc23-20020a170907125700b006efa5c8ba7esm4240546ejb.116.2022.04.20.23.26.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 23:26:28 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------vdznHasFmNx4e2RAlAoQXvZx"
Message-ID: <8ce90f44-d318-65ba-045a-18cbecf1734a@gmail.com>
Date: Thu, 21 Apr 2022 08:26:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/ttm: fix ttm tt init fail when size exceeds kmalloc
 limit
Content-Language: en-US
To: "Wang, Yang(Kevin)" <KevinYang.Wang@amd.com>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Lazar, Lijo"
 <Lijo.Lazar@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20220420085612.1664787-1-KevinYang.Wang@amd.com>
 <00dfec71-cf38-d6d9-8775-0ae88f59224e@amd.com>
 <CO6PR12MB54733101E19842B59668482B82F59@CO6PR12MB5473.namprd12.prod.outlook.com>
 <65ef352b-59c8-e802-5285-afc59e56fa9b@amd.com>
 <CO6PR12MB547340CB065269B1731812B182F59@CO6PR12MB5473.namprd12.prod.outlook.com>
 <572ed15c-b47e-e7b3-850a-cb0d5259af04@gmail.com>
 <CO6PR12MB54735D4B8E05AB1C17D356AE82F59@CO6PR12MB5473.namprd12.prod.outlook.com>
 <71f3ac77-b6ed-e503-8e05-dcf9d2c2811a@amd.com>
 <CO6PR12MB547334A5A8E66A578D131C6D82F59@CO6PR12MB5473.namprd12.prod.outlook.com>
 <075258d7-16af-a664-0406-2b2862efe05f@amd.com>
 <b5f6cd30-d7c7-c615-9723-68746e35b4de@amd.com>
 <6d1ec935-3b41-fef6-efe3-577f8316edd2@amd.com>
 <CO6PR12MB5473F2A9C21F68886DDF140082F49@CO6PR12MB5473.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CO6PR12MB5473F2A9C21F68886DDF140082F49@CO6PR12MB5473.namprd12.prod.outlook.com>
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

This is a multi-part message in MIME format.
--------------vdznHasFmNx4e2RAlAoQXvZx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 21.04.22 um 04:15 schrieb Wang, Yang(Kevin):
>
> [AMD Official Use Only]
>
>
>
>
> ------------------------------------------------------------------------
> *From:* Kuehling, Felix <Felix.Kuehling@amd.com>
> *Sent:* Thursday, April 21, 2022 5:21 AM
> *To:* Lazar, Lijo <Lijo.Lazar@amd.com>; Koenig, Christian 
> <Christian.Koenig@amd.com>; Wang, Yang(Kevin) 
> <KevinYang.Wang@amd.com>; Christian König 
> <ckoenig.leichtzumerken@gmail.com>; dri-devel@lists.freedesktop.org 
> <dri-devel@lists.freedesktop.org>; amd-gfx@lists.freedesktop.org 
> <amd-gfx@lists.freedesktop.org>
> *Subject:* Re: [PATCH] drm/ttm: fix ttm tt init fail when size exceeds 
> kmalloc limit
>
> On 2022-04-20 09:23, Lazar, Lijo wrote:
> >
> >
> > On 4/20/2022 6:26 PM, Christian König wrote:
> >> Am 20.04.22 um 14:54 schrieb Wang, Yang(Kevin):
> >>>
> >>> [AMD Official Use Only]
> >>>
> >>>
> >>> Hi Chris,
> >>>
> >>> 1) Change the test case to use something larger than 1TiB.
> >>> sure, we can increase the size of BO and make test pass,
> >>> but if user really want to allocate 1TB GTT BO, we have no reason to
> >>> let it fail? right?
> >>
> >> No, the reason is the underlying core kernel doesn't allow kvmalloc
> >> allocations with GFP_ZERO which are large enough to hold the array of
> >> allocated pages for this.
> >>
> >> We are working on top of the core Linux kernel and should *NEVER*
> >> ever add workarounds like what was suggested here. >
> >
> > AFAIU, for the purpose of ttm use, fallback to vmalloc is fine.
> >
> >  * Please note that any use of gfp flags outside of GFP_KERNEL is
> > careful to not
> >  * fall back to vmalloc.
> >  *
>
> That's weird, because kvcalloc does the same thing. If that were not
> able to fall back to vmalloc, it would be pretty useless.
>
>     static inline __alloc_size(1, 2) void *kvcalloc(size_t n, size_t 
> size, gfp_t flags)
>     {
>              return kvmalloc_array(n, size, flags | __GFP_ZERO);
>     }
>
> Maybe kvcalloc is the function we TTM should be using here anyway,
> instead of open-coding the kvmalloc_array call with an extra GFP flag.
>
> Regards,
>    Felix
>
> Yes, I agree with your point, and in amdkfd driver code, we have the 
> same risk in svm_range_dma_map_dev().

Yes, sounds like a good idea to me as well to change that.

Regards,
Christian.

>
> Best Regards,
> Kevin
>
> >
> > Actually the current implementation documents the behavior, but it is
> > deep inside the implementation to be noticeable - at least not obvious
> > while using kvmalloc_array.
> >
> > Thanks,
> > Lijo
> >
> >> Regards,
> >> Christian.
> >>
> >>> the system availed memory about 2T, but it will still fail.
> >>>
> >>> 2) Change kvmalloc to allow GFP_ZERO allocations even in the vmalloc
> >>> fallback path.
> >>>     the 5.18 kernel will add this patch to fix this issue .
> >>>
> >>> Best Regards,
> >>> Kevin
> >>> 
> ------------------------------------------------------------------------
> >>>
> >>> *From:* Koenig, Christian <Christian.Koenig@amd.com>
> >>> *Sent:* Wednesday, April 20, 2022 8:42 PM
> >>> *To:* Wang, Yang(Kevin) <KevinYang.Wang@amd.com>; Christian König
> >>> <ckoenig.leichtzumerken@gmail.com>; dri-devel@lists.freedesktop.org
> >>> <dri-devel@lists.freedesktop.org>; amd-gfx@lists.freedesktop.org
> >>> <amd-gfx@lists.freedesktop.org>
> >>> *Subject:* Re: [PATCH] drm/ttm: fix ttm tt init fail when size
> >>> exceeds kmalloc limit
> >>> Hi Kevin,
> >>>
> >>> yes and that is perfectly valid and expected behavior. There is
> >>> absolutely no need to change anything in TTM here.
> >>>
> >>> What we could do is:
> >>> 1) Change the test case to use something larger than 1TiB.
> >>> 2) Change kvmalloc to allow GFP_ZERO allocations even in the vmalloc
> >>> fallback path.
> >>>
> >>> Regards,
> >>> Christian.
> >>>
> >>> Am 20.04.22 um 14:39 schrieb Wang, Yang(Kevin):
> >>>>
> >>>> [AMD Official Use Only]
> >>>>
> >>>>
> >>>> Hi Chirs,
> >>>>
> >>>> yes, right, the amdgpu drive rwill use amdgpu_bo_validate_size()
> >>>> function to verify bo size,
> >>>> but when driver try to allocate VRAM domain bo fail, the amdgpu
> >>>> driver will fall back to allocate domain = (GTT | VRAM)  bo.
> >>>> please check following code, it will cause the 2nd time to allocate
> >>>> bo fail during allocate 256Mb buffer to store dma address (via
> >>>> kvmalloc()).
> >>>>
> >>>> initial_domain = (u32)(0xffffffff & args->in.domains);
> >>>> retry:
> >>>>         r = amdgpu_gem_object_create(adev, size, args->in.alignment,
> >>>>                    initial_domain,
> >>>>                    flags, ttm_bo_type_device, resv, &gobj);
> >>>>         if (r && r != -ERESTARTSYS) {
> >>>>                 if (flags & AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED) {
> >>>>       flags &= ~AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
> >>>>       goto retry;
> >>>>                 }
> >>>>
> >>>>                 if (initial_domain == AMDGPU_GEM_DOMAIN_VRAM) {
> >>>>       initial_domain |= AMDGPU_GEM_DOMAIN_GTT;
> >>>>       goto retry;
> >>>>                 }
> >>>> DRM_DEBUG("Failed to allocate GEM object (%llu, %d, %llu, %d)\n",
> >>>>               size, initial_domain, args->in.alignment, r);
> >>>>         }
> >>>>
> >>>> Best Regards,
> >>>> Kevin
> >>>>
> >>>> 
> ------------------------------------------------------------------------
> >>>>
> >>>> *From:* Christian König <ckoenig.leichtzumerken@gmail.com>
> >>>> <mailto:ckoenig.leichtzumerken@gmail.com 
> <mailto:ckoenig.leichtzumerken@gmail.com>>
> >>>> *Sent:* Wednesday, April 20, 2022 7:55 PM
> >>>> *To:* Wang, Yang(Kevin) <KevinYang.Wang@amd.com>
> >>>> <mailto:KevinYang.Wang@amd.com <mailto:KevinYang.Wang@amd.com>>; 
> Koenig, Christian
> >>>> <Christian.Koenig@amd.com> <mailto:Christian.Koenig@amd.com 
> <mailto:Christian.Koenig@amd.com>>;
> >>>> dri-devel@lists.freedesktop.org
> >>>> <mailto:dri-devel@lists.freedesktop.org 
> <mailto:dri-devel@lists.freedesktop.org>>
> >>>> <dri-devel@lists.freedesktop.org>
> >>>> <mailto:dri-devel@lists.freedesktop.org 
> <mailto:dri-devel@lists.freedesktop.org>>;
> >>>> amd-gfx@lists.freedesktop.org
> >>>> <mailto:amd-gfx@lists.freedesktop.org 
> <mailto:amd-gfx@lists.freedesktop.org>>
> >>>> <amd-gfx@lists.freedesktop.org> 
> <mailto:amd-gfx@lists.freedesktop.org 
> <mailto:amd-gfx@lists.freedesktop.org>>
> >>>> *Subject:* Re: [PATCH] drm/ttm: fix ttm tt init fail when size
> >>>> exceeds kmalloc limit
> >>>> Hi Kevin,
> >>>>
> >>>> no, the test case should already fail in amdgpu_bo_validate_size().
> >>>>
> >>>> If we have a system with 2TiB of memory where the test case could
> >>>> succeed then we should increase the requested size to something
> >>>> larger.
> >>>>
> >>>> And if the underlying core Linux kernel functions don't allow
> >>>> allocations as large as the requested one we should *NEVER* ever
> >>>> add workarounds like this.
> >>>>
> >>>> It is perfectly expected that this test case is not able to fulfill
> >>>> the desired allocation. That it fails during kvmalloc is
> >>>> unfortunate, but not a show stopper.
> >>>>
> >>>> Regards,
> >>>> Christian.
> >>>>
> >>>>
> >>>> Am 20.04.22 um 13:32 schrieb Wang, Yang(Kevin):
> >>>>>
> >>>>> [AMD Official Use Only]
> >>>>>
> >>>>>
> >>>>> Hi Chris,
> >>>>>
> >>>>> you misunderstood background about this case.
> >>>>>
> >>>>> although we expect this test case to fail, it should fail at the
> >>>>> location where the Bo actual memory is actually allocated. now the
> >>>>> code logic will cause the failure to allocate memory to store DMA
> >>>>> address.
> >>>>>
> >>>>> e.g: the case is failed in 2TB system ram machine, it should be
> >>>>> allocated successful, but it is failed.
> >>>>>
> >>>>> allocate 1TB BO, the ttm should allocate 1TB/4k * 8 buffer to
> >>>>> store allocate result (page address), this should not be failed
> >>>>> usually.
> >>>>>
> >>>>> There is a similar fix in upstream kernel 5.18, before this fix
> >>>>> entered the TTM code, this problem existed in TTM.
> >>>>>
> >>>>> kernel/git/torvalds/linux.git - Linux kernel source tree
> >>>>> 
> <https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v5.18-rc3&id=a421ef303008b0ceee2cfc625c3246fa7654b0ca
> >>>>> mm: allow !GFP_KERNEL allocations for kvmalloc
> >>>>>
> >>>>> Best Regards,
> >>>>> Kevin
> >>>>>
> >>>>> 
> ------------------------------------------------------------------------
> >>>>>
> >>>>> *From:* Koenig, Christian <Christian.Koenig@amd.com>
> >>>>> <mailto:Christian.Koenig@amd.com <mailto:Christian.Koenig@amd.com>>
> >>>>> *Sent:* Wednesday, April 20, 2022 6:53 PM
> >>>>> *To:* Wang, Yang(Kevin) <KevinYang.Wang@amd.com>
> >>>>> <mailto:KevinYang.Wang@amd.com <mailto:KevinYang.Wang@amd.com>>; 
> dri-devel@lists.freedesktop.org
> >>>>> <mailto:dri-devel@lists.freedesktop.org 
> <mailto:dri-devel@lists.freedesktop.org>>
> >>>>> <dri-devel@lists.freedesktop.org>
> >>>>> <mailto:dri-devel@lists.freedesktop.org 
> <mailto:dri-devel@lists.freedesktop.org>>;
> >>>>> amd-gfx@lists.freedesktop.org
> >>>>> <mailto:amd-gfx@lists.freedesktop.org 
> <mailto:amd-gfx@lists.freedesktop.org>>
> >>>>> <amd-gfx@lists.freedesktop.org>
> >>>>> <mailto:amd-gfx@lists.freedesktop.org 
> <mailto:amd-gfx@lists.freedesktop.org>>
> >>>>> *Subject:* Re: [PATCH] drm/ttm: fix ttm tt init fail when size
> >>>>> exceeds kmalloc limit
> >>>>> Am 20.04.22 um 11:07 schrieb Wang, Yang(Kevin):
> >>>>>>
> >>>>>> [AMD Official Use Only]
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> 
> ------------------------------------------------------------------------
> >>>>>>
> >>>>>> *From:* Koenig, Christian <Christian.Koenig@amd.com>
> >>>>>> <mailto:Christian.Koenig@amd.com <mailto:Christian.Koenig@amd.com>>
> >>>>>> *Sent:* Wednesday, April 20, 2022 5:00 PM
> >>>>>> *To:* Wang, Yang(Kevin) <KevinYang.Wang@amd.com>
> >>>>>> <mailto:KevinYang.Wang@amd.com 
> <mailto:KevinYang.Wang@amd.com>>; dri-devel@lists.freedesktop.org
> >>>>>> <mailto:dri-devel@lists.freedesktop.org 
> <mailto:dri-devel@lists.freedesktop.org>>
> >>>>>> <dri-devel@lists.freedesktop.org>
> >>>>>> <mailto:dri-devel@lists.freedesktop.org 
> <mailto:dri-devel@lists.freedesktop.org>>;
> >>>>>> amd-gfx@lists.freedesktop.org
> >>>>>> <mailto:amd-gfx@lists.freedesktop.org 
> <mailto:amd-gfx@lists.freedesktop.org>>
> >>>>>> <amd-gfx@lists.freedesktop.org>
> >>>>>> <mailto:amd-gfx@lists.freedesktop.org 
> <mailto:amd-gfx@lists.freedesktop.org>>
> >>>>>> *Subject:* Re: [PATCH] drm/ttm: fix ttm tt init fail when size
> >>>>>> exceeds kmalloc limit
> >>>>>> Am 20.04.22 um 10:56 schrieb Yang Wang:
> >>>>>> > if the __GFP_ZERO is set, the kvmalloc() can't fallback to use
> >>>>>> vmalloc()
> >>>>>>
> >>>>>> Hui what? Why should kvmalloc() not be able to fallback to 
> vmalloc()
> >>>>>> when __GFP_ZERO is set?
> >>>>>>
> >>>>>> And even that is really the case then that sounds like a bug in
> >>>>>> kvmalloc().
> >>>>>>
> >>>>>> Regards,
> >>>>>> Christian.
> >>>>>>
> >>>>>> [kevin]:
> >>>>>> it is really test case from libdrm amdgpu test, which try to
> >>>>>> allocate a big BO which will cause ttm tt init fail.
> >>>>>
> >>>>>
> >>>>> LOL! Guys, this test case is intended to fail!
> >>>>> *
> >>>>> *The test consists of allocating a buffer so ridiculous large that
> >>>>> it should never succeed and be rejected by the kernel driver.
> >>>>>
> >>>>> This patch here is a really clear NAK.
> >>>>>
> >>>>> Regards,
> >>>>> Christian.
> >>>>>
> >>>>>> it may be a kvmalloc() bug, and this patch can as a workaround
> >>>>>> in ttm before this issue fix.
> >>>>>>
> >>>>>> void *kvmalloc_node(size_t size, gfp_t flags, int node)
> >>>>>> {
> >>>>>> ...
> >>>>>>       if ((flags & GFP_KERNEL) != GFP_KERNEL)
> >>>>>>               return kmalloc_node(size, flags, node);
> >>>>>> ...
> >>>>>> }
> >>>>>>
> >>>>>> Best Regards,
> >>>>>> Kevin
> >>>>>>
> >>>>>> > to allocate memory, when request size is exceeds kmalloc limit,
> >>>>>> it will
> >>>>>> > cause allocate memory fail.
> >>>>>> >
> >>>>>> > e.g: when ttm want to create a BO with 1TB size, it maybe fail.
> >>>>>> >
> >>>>>> > Signed-off-by: Yang Wang <KevinYang.Wang@amd.com>
> >>>>>> <mailto:KevinYang.Wang@amd.com <mailto:KevinYang.Wang@amd.com>>
> >>>>>> > ---
> >>>>>> > drivers/gpu/drm/ttm/ttm_tt.c | 14 +++++++++++---
> >>>>>> >   1 file changed, 11 insertions(+), 3 deletions(-)
> >>>>>> >
> >>>>>> > diff --git a/drivers/gpu/drm/ttm/ttm_tt.c
> >>>>>> b/drivers/gpu/drm/ttm/ttm_tt.c
> >>>>>> > index 79c870a3bef8..9f2f3e576b8d 100644
> >>>>>> > --- a/drivers/gpu/drm/ttm/ttm_tt.c
> >>>>>> > +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> >>>>>> > @@ -97,9 +97,12 @@ int ttm_tt_create(struct ttm_buffer_object
> >>>>>> *bo, bool zero_alloc)
> >>>>>> >   static int ttm_tt_alloc_page_directory(struct ttm_tt *ttm)
> >>>>>> >   {
> >>>>>> >        ttm->pages = kvmalloc_array(ttm->num_pages, sizeof(void*),
> >>>>>> > - GFP_KERNEL | __GFP_ZERO);
> >>>>>> > + GFP_KERNEL);
> >>>>>> >        if (!ttm->pages)
> >>>>>> >                return -ENOMEM;
> >>>>>> > +
> >>>>>> > + memset(ttm->pages, 0, ttm->num_pages * sizeof(void *));
> >>>>>> > +
> >>>>>> >        return 0;
> >>>>>> >   }
> >>>>>> >
> >>>>>> > @@ -108,10 +111,12 @@ static int
> >>>>>> ttm_dma_tt_alloc_page_directory(struct ttm_tt *ttm)
> >>>>>> >        ttm->pages = kvmalloc_array(ttm->num_pages,
> >>>>>> > sizeof(*ttm->pages) +
> >>>>>> > sizeof(*ttm->dma_address),
> >>>>>> > - GFP_KERNEL | __GFP_ZERO);
> >>>>>> > + GFP_KERNEL);
> >>>>>> >        if (!ttm->pages)
> >>>>>> >                return -ENOMEM;
> >>>>>> >
> >>>>>> > + memset(ttm->pages, 0, ttm->num_pages *
> >>>>>> (sizeof(*ttm->pages) + sizeof(*ttm->dma_address)));
> >>>>>> > +
> >>>>>> >        ttm->dma_address = (void *)(ttm->pages + ttm->num_pages);
> >>>>>> >        return 0;
> >>>>>> >   }
> >>>>>> > @@ -120,9 +125,12 @@ static int
> >>>>>> ttm_sg_tt_alloc_page_directory(struct ttm_tt *ttm)
> >>>>>> >   {
> >>>>>> >        ttm->dma_address = kvmalloc_array(ttm->num_pages,
> >>>>>> > sizeof(*ttm->dma_address),
> >>>>>> > - GFP_KERNEL | __GFP_ZERO);
> >>>>>> > + GFP_KERNEL);
> >>>>>> >        if (!ttm->dma_address)
> >>>>>> >                return -ENOMEM;
> >>>>>> > +
> >>>>>> > + memset(ttm->dma_address, 0, ttm->num_pages *
> >>>>>> sizeof(*ttm->dma_address));
> >>>>>> > +
> >>>>>> >        return 0;
> >>>>>> >   }
> >>>>>> >
> >>>>>>
> >>>>>
> >>>>
> >>>
> >>

--------------vdznHasFmNx4e2RAlAoQXvZx
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Am 21.04.22 um 04:15 schrieb Wang, Yang(Kevin):<br>
    <blockquote type="cite"
cite="mid:CO6PR12MB5473F2A9C21F68886DDF140082F49@CO6PR12MB5473.namprd12.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <style type="text/css" style="display:none;">P {margin-top:0;margin-bottom:0;}</style>
      <p
        style="font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;"
        align="Left">
        [AMD Official Use Only]<br>
      </p>
      <br>
      <div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);">
          <br>
        </div>
        <div style="font-family:Calibri,Arial,Helvetica,sans-serif;
          font-size:12pt; color:rgb(0,0,0)">
          <br>
        </div>
        <hr tabindex="-1" style="display:inline-block; width:98%">
        <div id="divRplyFwdMsg" dir="ltr"><font style="font-size:11pt"
            face="Calibri, sans-serif" color="#000000"><b>From:</b>
            Kuehling, Felix <a class="moz-txt-link-rfc2396E" href="mailto:Felix.Kuehling@amd.com">&lt;Felix.Kuehling@amd.com&gt;</a><br>
            <b>Sent:</b> Thursday, April 21, 2022 5:21 AM<br>
            <b>To:</b> Lazar, Lijo <a class="moz-txt-link-rfc2396E" href="mailto:Lijo.Lazar@amd.com">&lt;Lijo.Lazar@amd.com&gt;</a>; Koenig,
            Christian <a class="moz-txt-link-rfc2396E" href="mailto:Christian.Koenig@amd.com">&lt;Christian.Koenig@amd.com&gt;</a>; Wang,
            Yang(Kevin) <a class="moz-txt-link-rfc2396E" href="mailto:KevinYang.Wang@amd.com">&lt;KevinYang.Wang@amd.com&gt;</a>; Christian König
            <a class="moz-txt-link-rfc2396E" href="mailto:ckoenig.leichtzumerken@gmail.com">&lt;ckoenig.leichtzumerken@gmail.com&gt;</a>;
            <a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>
            <a class="moz-txt-link-rfc2396E" href="mailto:dri-devel@lists.freedesktop.org">&lt;dri-devel@lists.freedesktop.org&gt;</a>;
            <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>
            <a class="moz-txt-link-rfc2396E" href="mailto:amd-gfx@lists.freedesktop.org">&lt;amd-gfx@lists.freedesktop.org&gt;</a><br>
            <b>Subject:</b> Re: [PATCH] drm/ttm: fix ttm tt init fail
            when size exceeds kmalloc limit</font>
          <div> </div>
        </div>
        <div class="BodyFragment"><font size="2"><span
              style="font-size:11pt">
              <div class="PlainText elementToProof"><br>
                On 2022-04-20 09:23, Lazar, Lijo wrote:<br>
                &gt;<br>
                &gt;<br>
                &gt; On 4/20/2022 6:26 PM, Christian König wrote:<br>
                &gt;&gt; Am 20.04.22 um 14:54 schrieb Wang, Yang(Kevin):<br>
                &gt;&gt;&gt;<br>
                &gt;&gt;&gt; [AMD Official Use Only]<br>
                &gt;&gt;&gt;<br>
                &gt;&gt;&gt;<br>
                &gt;&gt;&gt; Hi Chris,<br>
                &gt;&gt;&gt;<br>
                &gt;&gt;&gt; 1) Change the test case to use something
                larger than 1TiB.<br>
                &gt;&gt;&gt; sure, we can increase the size of BO and
                make test pass,<br>
                &gt;&gt;&gt; but if user really want to allocate 1TB GTT
                BO, we have no reason to <br>
                &gt;&gt;&gt; let it fail? right?<br>
                &gt;&gt;<br>
                &gt;&gt; No, the reason is the underlying core kernel
                doesn't allow kvmalloc <br>
                &gt;&gt; allocations with GFP_ZERO which are large
                enough to hold the array of <br>
                &gt;&gt; allocated pages for this.<br>
                &gt;&gt;<br>
                &gt;&gt; We are working on top of the core Linux kernel
                and should *NEVER* <br>
                &gt;&gt; ever add workarounds like what was suggested
                here. &gt;<br>
                &gt;<br>
                &gt; AFAIU, for the purpose of ttm use, fallback to
                vmalloc is fine.<br>
                &gt;<br>
                &gt;  * Please note that any use of gfp flags outside of
                GFP_KERNEL is <br>
                &gt; careful to not<br>
                &gt;  * fall back to vmalloc.<br>
                &gt;  *<br>
                <br>
                That's weird, because kvcalloc does the same thing. If
                that were not <br>
                able to fall back to vmalloc, it would be pretty
                useless.<br>
                <br>
                    static inline __alloc_size(1, 2) void
                *kvcalloc(size_t n, size_t size, gfp_t flags)<br>
                    {<br>
                             return kvmalloc_array(n, size, flags |
                __GFP_ZERO);<br>
                    }<br>
                <br>
                Maybe kvcalloc is the function we TTM should be using
                here anyway, <br>
                instead of open-coding the kvmalloc_array call with an
                extra GFP flag.<br>
                <br>
                Regards,<br>
                   Felix</div>
              <div class="PlainText elementToProof"><br>
              </div>
              <div class="PlainText elementToProof">Yes, I agree with
                your point, and in amdkfd driver code, we have the same
                risk in svm_range_dma_map_dev().<br>
              </div>
            </span></font></div>
      </div>
    </blockquote>
    <br>
    Yes, sounds like a good idea to me as well to change that.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite"
cite="mid:CO6PR12MB5473F2A9C21F68886DDF140082F49@CO6PR12MB5473.namprd12.prod.outlook.com">
      <div>
        <div class="BodyFragment"><font size="2"><span
              style="font-size:11pt">
              <div class="PlainText elementToProof">
                <br>
                Best Regards,<br>
                Kevin<br>
                <br>
                &gt;<br>
                &gt; Actually the current implementation documents the
                behavior, but it is <br>
                &gt; deep inside the implementation to be noticeable -
                at least not obvious <br>
                &gt; while using kvmalloc_array.<br>
                &gt;<br>
                &gt; Thanks,<br>
                &gt; Lijo<br>
                &gt;<br>
                &gt;&gt; Regards,<br>
                &gt;&gt; Christian.<br>
                &gt;&gt;<br>
                &gt;&gt;&gt; the system availed memory about 2T, but it
                will still fail.<br>
                &gt;&gt;&gt;<br>
                &gt;&gt;&gt; 2) Change kvmalloc to allow GFP_ZERO
                allocations even in the vmalloc <br>
                &gt;&gt;&gt; fallback path.<br>
                &gt;&gt;&gt;     the 5.18 kernel will add this patch to
                fix this issue .<br>
                &gt;&gt;&gt;<br>
                &gt;&gt;&gt; Best Regards,<br>
                &gt;&gt;&gt; Kevin<br>
                &gt;&gt;&gt;
                ------------------------------------------------------------------------
                <br>
                &gt;&gt;&gt;<br>
                &gt;&gt;&gt; *From:* Koenig, Christian
                <a class="moz-txt-link-rfc2396E" href="mailto:Christian.Koenig@amd.com">&lt;Christian.Koenig@amd.com&gt;</a><br>
                &gt;&gt;&gt; *Sent:* Wednesday, April 20, 2022 8:42 PM<br>
                &gt;&gt;&gt; *To:* Wang, Yang(Kevin)
                <a class="moz-txt-link-rfc2396E" href="mailto:KevinYang.Wang@amd.com">&lt;KevinYang.Wang@amd.com&gt;</a>; Christian König <br>
                &gt;&gt;&gt; <a class="moz-txt-link-rfc2396E" href="mailto:ckoenig.leichtzumerken@gmail.com">&lt;ckoenig.leichtzumerken@gmail.com&gt;</a>;
                <a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a> <br>
                &gt;&gt;&gt; <a class="moz-txt-link-rfc2396E" href="mailto:dri-devel@lists.freedesktop.org">&lt;dri-devel@lists.freedesktop.org&gt;</a>;
                <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a> <br>
                &gt;&gt;&gt; <a class="moz-txt-link-rfc2396E" href="mailto:amd-gfx@lists.freedesktop.org">&lt;amd-gfx@lists.freedesktop.org&gt;</a><br>
                &gt;&gt;&gt; *Subject:* Re: [PATCH] drm/ttm: fix ttm tt
                init fail when size <br>
                &gt;&gt;&gt; exceeds kmalloc limit<br>
                &gt;&gt;&gt; Hi Kevin,<br>
                &gt;&gt;&gt;<br>
                &gt;&gt;&gt; yes and that is perfectly valid and
                expected behavior. There is <br>
                &gt;&gt;&gt; absolutely no need to change anything in
                TTM here.<br>
                &gt;&gt;&gt;<br>
                &gt;&gt;&gt; What we could do is:<br>
                &gt;&gt;&gt; 1) Change the test case to use something
                larger than 1TiB.<br>
                &gt;&gt;&gt; 2) Change kvmalloc to allow GFP_ZERO
                allocations even in the vmalloc <br>
                &gt;&gt;&gt; fallback path.<br>
                &gt;&gt;&gt;<br>
                &gt;&gt;&gt; Regards,<br>
                &gt;&gt;&gt; Christian.<br>
                &gt;&gt;&gt;<br>
                &gt;&gt;&gt; Am 20.04.22 um 14:39 schrieb Wang,
                Yang(Kevin):<br>
                &gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt; [AMD Official Use Only]<br>
                &gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt; Hi Chirs,<br>
                &gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt; yes, right, the amdgpu drive rwill use
                amdgpu_bo_validate_size() <br>
                &gt;&gt;&gt;&gt; function to verify bo size,<br>
                &gt;&gt;&gt;&gt; but when driver try to allocate VRAM
                domain bo fail, the amdgpu <br>
                &gt;&gt;&gt;&gt; driver will fall back to allocate
                domain = (GTT | VRAM)  bo.<br>
                &gt;&gt;&gt;&gt; please check following code, it will
                cause the 2nd time to allocate <br>
                &gt;&gt;&gt;&gt; bo fail during allocate 256Mb buffer to
                store dma address (via <br>
                &gt;&gt;&gt;&gt; kvmalloc()).<br>
                &gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt; initial_domain = (u32)(0xffffffff &amp;
                args-&gt;in.domains);<br>
                &gt;&gt;&gt;&gt; retry:<br>
                &gt;&gt;&gt;&gt;         r =
                amdgpu_gem_object_create(adev, size,
                args-&gt;in.alignment,<br>
                &gt;&gt;&gt;&gt;                    initial_domain,<br>
                &gt;&gt;&gt;&gt;                    flags,
                ttm_bo_type_device, resv, &amp;gobj);<br>
                &gt;&gt;&gt;&gt;         if (r &amp;&amp; r !=
                -ERESTARTSYS) {<br>
                &gt;&gt;&gt;&gt;                 if (flags &amp;
                AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED) {<br>
                &gt;&gt;&gt;&gt;       flags &amp;=
                ~AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;<br>
                &gt;&gt;&gt;&gt;       goto retry;<br>
                &gt;&gt;&gt;&gt;                 }<br>
                &gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt;                 if (initial_domain ==
                AMDGPU_GEM_DOMAIN_VRAM) {<br>
                &gt;&gt;&gt;&gt;       initial_domain |=
                AMDGPU_GEM_DOMAIN_GTT;<br>
                &gt;&gt;&gt;&gt;       goto retry;<br>
                &gt;&gt;&gt;&gt;                 }<br>
                &gt;&gt;&gt;&gt; DRM_DEBUG("Failed to allocate GEM
                object (%llu, %d, %llu, %d)\n",<br>
                &gt;&gt;&gt;&gt;               size, initial_domain,
                args-&gt;in.alignment, r);<br>
                &gt;&gt;&gt;&gt;         }<br>
                &gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt; Best Regards,<br>
                &gt;&gt;&gt;&gt; Kevin<br>
                &gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt;
                ------------------------------------------------------------------------
                <br>
                &gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt; *From:* Christian König
                <a class="moz-txt-link-rfc2396E" href="mailto:ckoenig.leichtzumerken@gmail.com">&lt;ckoenig.leichtzumerken@gmail.com&gt;</a> <br>
                &gt;&gt;&gt;&gt; &lt;<a
                  href="mailto:ckoenig.leichtzumerken@gmail.com"
                  data-auth="NotApplicable" moz-do-not-send="true">mailto:ckoenig.leichtzumerken@gmail.com</a>&gt;<br>
                &gt;&gt;&gt;&gt; *Sent:* Wednesday, April 20, 2022 7:55
                PM<br>
                &gt;&gt;&gt;&gt; *To:* Wang, Yang(Kevin)
                <a class="moz-txt-link-rfc2396E" href="mailto:KevinYang.Wang@amd.com">&lt;KevinYang.Wang@amd.com&gt;</a> <br>
                &gt;&gt;&gt;&gt; &lt;<a
                  href="mailto:KevinYang.Wang@amd.com"
                  data-auth="NotApplicable" moz-do-not-send="true">mailto:KevinYang.Wang@amd.com</a>&gt;;
                Koenig, Christian
                <br>
                &gt;&gt;&gt;&gt; <a class="moz-txt-link-rfc2396E" href="mailto:Christian.Koenig@amd.com">&lt;Christian.Koenig@amd.com&gt;</a> &lt;<a
                  href="mailto:Christian.Koenig@amd.com"
                  data-auth="NotApplicable" moz-do-not-send="true">mailto:Christian.Koenig@amd.com</a>&gt;;
                <br>
                &gt;&gt;&gt;&gt; <a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a> <br>
                &gt;&gt;&gt;&gt; &lt;<a
                  href="mailto:dri-devel@lists.freedesktop.org"
                  data-auth="NotApplicable" moz-do-not-send="true">mailto:dri-devel@lists.freedesktop.org</a>&gt;
                <br>
                &gt;&gt;&gt;&gt; <a class="moz-txt-link-rfc2396E" href="mailto:dri-devel@lists.freedesktop.org">&lt;dri-devel@lists.freedesktop.org&gt;</a>
                <br>
                &gt;&gt;&gt;&gt; &lt;<a
                  href="mailto:dri-devel@lists.freedesktop.org"
                  data-auth="NotApplicable" moz-do-not-send="true">mailto:dri-devel@lists.freedesktop.org</a>&gt;;
                <br>
                &gt;&gt;&gt;&gt; <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a> <br>
                &gt;&gt;&gt;&gt; &lt;<a
                  href="mailto:amd-gfx@lists.freedesktop.org"
                  data-auth="NotApplicable" moz-do-not-send="true">mailto:amd-gfx@lists.freedesktop.org</a>&gt;
                <br>
                &gt;&gt;&gt;&gt; <a class="moz-txt-link-rfc2396E" href="mailto:amd-gfx@lists.freedesktop.org">&lt;amd-gfx@lists.freedesktop.org&gt;</a>
                &lt;<a href="mailto:amd-gfx@lists.freedesktop.org"
                  data-auth="NotApplicable" moz-do-not-send="true">mailto:amd-gfx@lists.freedesktop.org</a>&gt;<br>
                &gt;&gt;&gt;&gt; *Subject:* Re: [PATCH] drm/ttm: fix ttm
                tt init fail when size <br>
                &gt;&gt;&gt;&gt; exceeds kmalloc limit<br>
                &gt;&gt;&gt;&gt; Hi Kevin,<br>
                &gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt; no, the test case should already fail
                in amdgpu_bo_validate_size().<br>
                &gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt; If we have a system with 2TiB of memory
                where the test case could <br>
                &gt;&gt;&gt;&gt; succeed then we should increase the
                requested size to something <br>
                &gt;&gt;&gt;&gt; larger.<br>
                &gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt; And if the underlying core Linux kernel
                functions don't allow <br>
                &gt;&gt;&gt;&gt; allocations as large as the requested
                one we should *NEVER* ever <br>
                &gt;&gt;&gt;&gt; add workarounds like this.<br>
                &gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt; It is perfectly expected that this test
                case is not able to fulfill <br>
                &gt;&gt;&gt;&gt; the desired allocation. That it fails
                during kvmalloc is <br>
                &gt;&gt;&gt;&gt; unfortunate, but not a show stopper.<br>
                &gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt; Regards,<br>
                &gt;&gt;&gt;&gt; Christian.<br>
                &gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt; Am 20.04.22 um 13:32 schrieb Wang,
                Yang(Kevin):<br>
                &gt;&gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt;&gt; [AMD Official Use Only]<br>
                &gt;&gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt;&gt; Hi Chris,<br>
                &gt;&gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt;&gt; you misunderstood background about
                this case.<br>
                &gt;&gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt;&gt; although we expect this test case
                to fail, it should fail at the <br>
                &gt;&gt;&gt;&gt;&gt; location where the Bo actual memory
                is actually allocated. now the <br>
                &gt;&gt;&gt;&gt;&gt; code logic will cause the failure
                to allocate memory to store DMA <br>
                &gt;&gt;&gt;&gt;&gt; address.<br>
                &gt;&gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt;&gt; e.g: the case is failed in 2TB
                system ram machine, it should be <br>
                &gt;&gt;&gt;&gt;&gt; allocated successful, but it is
                failed.<br>
                &gt;&gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt;&gt; allocate 1TB BO, the ttm should
                allocate 1TB/4k * 8 buffer to <br>
                &gt;&gt;&gt;&gt;&gt; store allocate result (page
                address), this should not be failed <br>
                &gt;&gt;&gt;&gt;&gt; usually.<br>
                &gt;&gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt;&gt; There is a similar fix in upstream
                kernel 5.18, before this fix <br>
                &gt;&gt;&gt;&gt;&gt; entered the TTM code, this problem
                existed in TTM.<br>
                &gt;&gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt;&gt; kernel/git/torvalds/linux.git -
                Linux kernel source tree <br>
                &gt;&gt;&gt;&gt;&gt;
&lt;<a class="moz-txt-link-freetext" href="https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v5.18-rc3&amp;id=a421ef303008b0ceee2cfc625c3246fa7654b0ca">https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v5.18-rc3&amp;id=a421ef303008b0ceee2cfc625c3246fa7654b0ca</a><br>
                &gt;&gt;&gt;&gt;&gt; mm: allow !GFP_KERNEL allocations
                for kvmalloc<br>
                &gt;&gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt;&gt; Best Regards,<br>
                &gt;&gt;&gt;&gt;&gt; Kevin<br>
                &gt;&gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt;&gt;
                ------------------------------------------------------------------------
                <br>
                &gt;&gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt;&gt; *From:* Koenig, Christian
                <a class="moz-txt-link-rfc2396E" href="mailto:Christian.Koenig@amd.com">&lt;Christian.Koenig@amd.com&gt;</a> <br>
                &gt;&gt;&gt;&gt;&gt; &lt;<a
                  href="mailto:Christian.Koenig@amd.com"
                  data-auth="NotApplicable" moz-do-not-send="true">mailto:Christian.Koenig@amd.com</a>&gt;<br>
                &gt;&gt;&gt;&gt;&gt; *Sent:* Wednesday, April 20, 2022
                6:53 PM<br>
                &gt;&gt;&gt;&gt;&gt; *To:* Wang, Yang(Kevin)
                <a class="moz-txt-link-rfc2396E" href="mailto:KevinYang.Wang@amd.com">&lt;KevinYang.Wang@amd.com&gt;</a> <br>
                &gt;&gt;&gt;&gt;&gt; &lt;<a
                  href="mailto:KevinYang.Wang@amd.com"
                  data-auth="NotApplicable" moz-do-not-send="true">mailto:KevinYang.Wang@amd.com</a>&gt;;
                <a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>
                <br>
                &gt;&gt;&gt;&gt;&gt; &lt;<a
                  href="mailto:dri-devel@lists.freedesktop.org"
                  data-auth="NotApplicable" moz-do-not-send="true">mailto:dri-devel@lists.freedesktop.org</a>&gt;
                <br>
                &gt;&gt;&gt;&gt;&gt;
                <a class="moz-txt-link-rfc2396E" href="mailto:dri-devel@lists.freedesktop.org">&lt;dri-devel@lists.freedesktop.org&gt;</a> <br>
                &gt;&gt;&gt;&gt;&gt; &lt;<a
                  href="mailto:dri-devel@lists.freedesktop.org"
                  data-auth="NotApplicable" moz-do-not-send="true">mailto:dri-devel@lists.freedesktop.org</a>&gt;;
                <br>
                &gt;&gt;&gt;&gt;&gt; <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a> <br>
                &gt;&gt;&gt;&gt;&gt; &lt;<a
                  href="mailto:amd-gfx@lists.freedesktop.org"
                  data-auth="NotApplicable" moz-do-not-send="true">mailto:amd-gfx@lists.freedesktop.org</a>&gt;
                <br>
                &gt;&gt;&gt;&gt;&gt;
                <a class="moz-txt-link-rfc2396E" href="mailto:amd-gfx@lists.freedesktop.org">&lt;amd-gfx@lists.freedesktop.org&gt;</a> <br>
                &gt;&gt;&gt;&gt;&gt; &lt;<a
                  href="mailto:amd-gfx@lists.freedesktop.org"
                  data-auth="NotApplicable" moz-do-not-send="true">mailto:amd-gfx@lists.freedesktop.org</a>&gt;<br>
                &gt;&gt;&gt;&gt;&gt; *Subject:* Re: [PATCH] drm/ttm: fix
                ttm tt init fail when size <br>
                &gt;&gt;&gt;&gt;&gt; exceeds kmalloc limit<br>
                &gt;&gt;&gt;&gt;&gt; Am 20.04.22 um 11:07 schrieb Wang,
                Yang(Kevin):<br>
                &gt;&gt;&gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt;&gt;&gt; [AMD Official Use Only]<br>
                &gt;&gt;&gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt;&gt;&gt;
                ------------------------------------------------------------------------
                <br>
                &gt;&gt;&gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt;&gt;&gt; *From:* Koenig, Christian
                <a class="moz-txt-link-rfc2396E" href="mailto:Christian.Koenig@amd.com">&lt;Christian.Koenig@amd.com&gt;</a> <br>
                &gt;&gt;&gt;&gt;&gt;&gt; &lt;<a
                  href="mailto:Christian.Koenig@amd.com"
                  data-auth="NotApplicable" moz-do-not-send="true">mailto:Christian.Koenig@amd.com</a>&gt;<br>
                &gt;&gt;&gt;&gt;&gt;&gt; *Sent:* Wednesday, April 20,
                2022 5:00 PM<br>
                &gt;&gt;&gt;&gt;&gt;&gt; *To:* Wang, Yang(Kevin)
                <a class="moz-txt-link-rfc2396E" href="mailto:KevinYang.Wang@amd.com">&lt;KevinYang.Wang@amd.com&gt;</a> <br>
                &gt;&gt;&gt;&gt;&gt;&gt; &lt;<a
                  href="mailto:KevinYang.Wang@amd.com"
                  data-auth="NotApplicable" moz-do-not-send="true">mailto:KevinYang.Wang@amd.com</a>&gt;;
                <a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>
                <br>
                &gt;&gt;&gt;&gt;&gt;&gt; &lt;<a
                  href="mailto:dri-devel@lists.freedesktop.org"
                  data-auth="NotApplicable" moz-do-not-send="true">mailto:dri-devel@lists.freedesktop.org</a>&gt;
                <br>
                &gt;&gt;&gt;&gt;&gt;&gt;
                <a class="moz-txt-link-rfc2396E" href="mailto:dri-devel@lists.freedesktop.org">&lt;dri-devel@lists.freedesktop.org&gt;</a> <br>
                &gt;&gt;&gt;&gt;&gt;&gt; &lt;<a
                  href="mailto:dri-devel@lists.freedesktop.org"
                  data-auth="NotApplicable" moz-do-not-send="true">mailto:dri-devel@lists.freedesktop.org</a>&gt;;
                <br>
                &gt;&gt;&gt;&gt;&gt;&gt; <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a> <br>
                &gt;&gt;&gt;&gt;&gt;&gt; &lt;<a
                  href="mailto:amd-gfx@lists.freedesktop.org"
                  data-auth="NotApplicable" moz-do-not-send="true">mailto:amd-gfx@lists.freedesktop.org</a>&gt;
                <br>
                &gt;&gt;&gt;&gt;&gt;&gt;
                <a class="moz-txt-link-rfc2396E" href="mailto:amd-gfx@lists.freedesktop.org">&lt;amd-gfx@lists.freedesktop.org&gt;</a> <br>
                &gt;&gt;&gt;&gt;&gt;&gt; &lt;<a
                  href="mailto:amd-gfx@lists.freedesktop.org"
                  data-auth="NotApplicable" moz-do-not-send="true">mailto:amd-gfx@lists.freedesktop.org</a>&gt;<br>
                &gt;&gt;&gt;&gt;&gt;&gt; *Subject:* Re: [PATCH] drm/ttm:
                fix ttm tt init fail when size <br>
                &gt;&gt;&gt;&gt;&gt;&gt; exceeds kmalloc limit<br>
                &gt;&gt;&gt;&gt;&gt;&gt; Am 20.04.22 um 10:56 schrieb
                Yang Wang:<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt; if the __GFP_ZERO is set,
                the kvmalloc() can't fallback to use <br>
                &gt;&gt;&gt;&gt;&gt;&gt; vmalloc()<br>
                &gt;&gt;&gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt;&gt;&gt; Hui what? Why should kvmalloc()
                not be able to fallback to vmalloc()<br>
                &gt;&gt;&gt;&gt;&gt;&gt; when __GFP_ZERO is set?<br>
                &gt;&gt;&gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt;&gt;&gt; And even that is really the
                case then that sounds like a bug in <br>
                &gt;&gt;&gt;&gt;&gt;&gt; kvmalloc().<br>
                &gt;&gt;&gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt;&gt;&gt; Regards,<br>
                &gt;&gt;&gt;&gt;&gt;&gt; Christian.<br>
                &gt;&gt;&gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt;&gt;&gt; [kevin]:<br>
                &gt;&gt;&gt;&gt;&gt;&gt; it is really test case from
                libdrm amdgpu test, which try to <br>
                &gt;&gt;&gt;&gt;&gt;&gt; allocate a big BO which will
                cause ttm tt init fail.<br>
                &gt;&gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt;&gt; LOL! Guys, this test case is
                intended to fail!<br>
                &gt;&gt;&gt;&gt;&gt; *<br>
                &gt;&gt;&gt;&gt;&gt; *The test consists of allocating a
                buffer so ridiculous large that <br>
                &gt;&gt;&gt;&gt;&gt; it should never succeed and be
                rejected by the kernel driver.<br>
                &gt;&gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt;&gt; This patch here is a really clear
                NAK.<br>
                &gt;&gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt;&gt; Regards,<br>
                &gt;&gt;&gt;&gt;&gt; Christian.<br>
                &gt;&gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt;&gt;&gt; it may be a kvmalloc() bug, and
                this patch can as a workaround <br>
                &gt;&gt;&gt;&gt;&gt;&gt; in ttm before this issue fix.<br>
                &gt;&gt;&gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt;&gt;&gt; void *kvmalloc_node(size_t
                size, gfp_t flags, int node)<br>
                &gt;&gt;&gt;&gt;&gt;&gt; {<br>
                &gt;&gt;&gt;&gt;&gt;&gt; ...<br>
                &gt;&gt;&gt;&gt;&gt;&gt;       if ((flags &amp;
                GFP_KERNEL) != GFP_KERNEL)<br>
                &gt;&gt;&gt;&gt;&gt;&gt;               return
                kmalloc_node(size, flags, node);<br>
                &gt;&gt;&gt;&gt;&gt;&gt; ...<br>
                &gt;&gt;&gt;&gt;&gt;&gt; }<br>
                &gt;&gt;&gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt;&gt;&gt; Best Regards,<br>
                &gt;&gt;&gt;&gt;&gt;&gt; Kevin<br>
                &gt;&gt;&gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt; to allocate memory, when
                request size is exceeds kmalloc limit, <br>
                &gt;&gt;&gt;&gt;&gt;&gt; it will<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt; cause allocate memory
                fail.<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt;<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt; e.g: when ttm want to
                create a BO with 1TB size, it maybe fail.<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt;<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt; Signed-off-by: Yang Wang
                <a class="moz-txt-link-rfc2396E" href="mailto:KevinYang.Wang@amd.com">&lt;KevinYang.Wang@amd.com&gt;</a> <br>
                &gt;&gt;&gt;&gt;&gt;&gt; &lt;<a
                  href="mailto:KevinYang.Wang@amd.com"
                  data-auth="NotApplicable" moz-do-not-send="true">mailto:KevinYang.Wang@amd.com</a>&gt;<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt; ---<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt;  
                drivers/gpu/drm/ttm/ttm_tt.c | 14 +++++++++++---<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt;   1 file changed, 11
                insertions(+), 3 deletions(-)<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt;<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt; diff --git
                a/drivers/gpu/drm/ttm/ttm_tt.c <br>
                &gt;&gt;&gt;&gt;&gt;&gt; b/drivers/gpu/drm/ttm/ttm_tt.c<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt; index
                79c870a3bef8..9f2f3e576b8d 100644<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt; ---
                a/drivers/gpu/drm/ttm/ttm_tt.c<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt; +++
                b/drivers/gpu/drm/ttm/ttm_tt.c<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt; @@ -97,9 +97,12 @@ int
                ttm_tt_create(struct ttm_buffer_object <br>
                &gt;&gt;&gt;&gt;&gt;&gt; *bo, bool zero_alloc)<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt;   static int
                ttm_tt_alloc_page_directory(struct ttm_tt *ttm)<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt;   {<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt;        ttm-&gt;pages =
                kvmalloc_array(ttm-&gt;num_pages, sizeof(void*),<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt; -                    
                GFP_KERNEL | __GFP_ZERO);<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt; + GFP_KERNEL);<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt;        if (!ttm-&gt;pages)<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt;                return
                -ENOMEM;<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt; +<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt; +    
                memset(ttm-&gt;pages, 0, ttm-&gt;num_pages * sizeof(void
                *));<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt; +<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt;        return 0;<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt;   }<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt;<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt; @@ -108,10 +111,12 @@
                static int <br>
                &gt;&gt;&gt;&gt;&gt;&gt;
                ttm_dma_tt_alloc_page_directory(struct ttm_tt *ttm)<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt;        ttm-&gt;pages =
                kvmalloc_array(ttm-&gt;num_pages,<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt; sizeof(*ttm-&gt;pages) +<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt;
                sizeof(*ttm-&gt;dma_address),<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt; - GFP_KERNEL |
                __GFP_ZERO);<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt; + GFP_KERNEL);<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt;        if (!ttm-&gt;pages)<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt;                return
                -ENOMEM;<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt;<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt; +    
                memset(ttm-&gt;pages, 0, ttm-&gt;num_pages * <br>
                &gt;&gt;&gt;&gt;&gt;&gt; (sizeof(*ttm-&gt;pages) +
                sizeof(*ttm-&gt;dma_address)));<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt; +<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt;        ttm-&gt;dma_address
                = (void *)(ttm-&gt;pages + ttm-&gt;num_pages);<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt;        return 0;<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt;   }<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt; @@ -120,9 +125,12 @@
                static int <br>
                &gt;&gt;&gt;&gt;&gt;&gt;
                ttm_sg_tt_alloc_page_directory(struct ttm_tt *ttm)<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt;   {<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt;        ttm-&gt;dma_address
                = kvmalloc_array(ttm-&gt;num_pages,<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt;
                sizeof(*ttm-&gt;dma_address),<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt; - GFP_KERNEL |
                __GFP_ZERO);<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt; + GFP_KERNEL);<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt;        if
                (!ttm-&gt;dma_address)<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt;                return
                -ENOMEM;<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt; +<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt; +    
                memset(ttm-&gt;dma_address, 0, ttm-&gt;num_pages * <br>
                &gt;&gt;&gt;&gt;&gt;&gt; sizeof(*ttm-&gt;dma_address));<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt; +<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt;        return 0;<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt;   }<br>
                &gt;&gt;&gt;&gt;&gt;&gt; &gt;<br>
                &gt;&gt;&gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;<br>
                &gt;&gt;<br>
              </div>
            </span></font></div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------vdznHasFmNx4e2RAlAoQXvZx--
