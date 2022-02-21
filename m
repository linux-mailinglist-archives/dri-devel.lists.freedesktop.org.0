Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2C44BD42F
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 04:28:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 640F810E286;
	Mon, 21 Feb 2022 03:28:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC6C10E283;
 Mon, 21 Feb 2022 03:28:32 +0000 (UTC)
Received: by mail-oo1-xc36.google.com with SMTP id
 i10-20020a4aab0a000000b002fccf890d5fso11550870oon.5; 
 Sun, 20 Feb 2022 19:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=evzbx3hFkrG4LEm3hNJUfV0Qe4cnm6Z7bXfWh+oqgHA=;
 b=q1zGywxqEbABgk5qGo/5ZgnOjAUyxdDin3JN4tmRVsT/QUo5H2mlPReuWGyQPa6Pkq
 kIeqcgDUIuCKhgDSRwp3JN8vVyzGKfD6+Tqtn++FHpZow3PJkgW4RAbKPYF8eDlKWMMI
 eRForIbQFRMd6yIZ5rA8/5eCajF4y411hFjVKwxS9yLjPhsD5doEQiKqgdt6GdKmRycz
 mDRrhYjSCfzJe0AsySBagpk3OCmMOp7OzGFtL/K++ppJTfCIGYRAnyWAOpm7jDohJ2HH
 4UnEmlGfThpXRTUjH1xPKj0SxwWtaarM957Vm23s1Vji0E3QzSuA4lW83aB/CpcBj9qz
 my/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=evzbx3hFkrG4LEm3hNJUfV0Qe4cnm6Z7bXfWh+oqgHA=;
 b=lqoy+f/3Ixby6u0ZNDYGlL+1zGzNy4d7gP4ibRJq3F0Hw172GwYqxFBV2mMs3XBerS
 Holx3uVcwPBcllA6eGVxjLuv8w/Q6kdvibdl5gUZNR0D4AHZAop4xTAKlOCC+mD4AKs1
 F76S5XS24xryz1MlQ9e4ApqSvLENiC1MoeBwcyslj/tYEdQZEkTL78ik1OvUbJH54yRL
 gaEz7SjLh3li/ayxcwS4P7jE5r+g0wbJP0BIWsJMcgORj/RAL1krqCR0nzcl9M43BWxb
 O86pq2RqwIiIyD6EVYrEaZNHBn+67izmRdPIBCitaZHN9xsUnaojX5BVxNkvOAh89U9z
 YOSg==
X-Gm-Message-State: AOAM532zUo6vGg3HJhCdvjJs6lRLrjKshfxcWqSQX4KJctgddNfPtJtx
 8XWaAsSH/9jkH+Kv+jNKSD8vhCOmOxF3mNAMa1U=
X-Google-Smtp-Source: ABdhPJze/QDI5+XORX3C0oWeqbkGGqE1CNJ0uMuUTZ6HYLNRuKfPlfE4AmCZlgdh7rwc5tf4xgO0Asq3+la9pXqOY7g=
X-Received: by 2002:a05:6870:148a:b0:d3:b909:926c with SMTP id
 k10-20020a056870148a00b000d3b909926cmr6698908oab.129.1645414111191; Sun, 20
 Feb 2022 19:28:31 -0800 (PST)
MIME-Version: 1.0
References: <20220217090440.4468-1-qiang.yu@amd.com>
 <5d3fdd2c-e74a-49f4-2b28-32c06483236f@amd.com>
 <CAKGbVbtLTBJPF5eTu4rABUTBa8eqjQvqjo1AEUrzgPgYgCREuA@mail.gmail.com>
 <dac70c05-e712-d2e3-2267-278380895f1e@amd.com>
 <CAKGbVbvtLbDiKrX80-dMnipdLkTE+FP=g_mx37e12fuMtA1Y4Q@mail.gmail.com>
 <ca27a9c6-f390-a938-dd66-ac23f3b44dc4@amd.com>
 <CAKGbVbv4UFCybS_OFj5UkDgevbrB5qe3pv+0nHv9WdefYhy6Ww@mail.gmail.com>
 <6711073b-8771-5750-33f7-b72333b411c6@amd.com>
 <CAKGbVbvR+msXjrsXmDM8QTmsCP03hL5-q5CTJBYu4mm=NQd01A@mail.gmail.com>
 <a11b7073-6597-8e87-b724-33acab32e791@gmail.com>
 <CAKGbVbuJ-QdeoMTg=_O=1x5A5tbqZftsjt8aCCoVkAekci0USA@mail.gmail.com>
 <d830bb82-63ea-2de6-6d10-3a401ac0dcf0@amd.com>
 <CAKGbVbtorRius+Sq1_3SPUF3JzA00U747noSGhx7eP8Vn1rSDg@mail.gmail.com>
 <47c3a681-379e-18d4-86da-c48721081911@gmail.com>
In-Reply-To: <47c3a681-379e-18d4-86da-c48721081911@gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Mon, 21 Feb 2022 11:28:20 +0800
Message-ID: <CAKGbVbvmxOCZWYvB+ZSL7oHJmbm8vPgM-NJzadrEG1E=2c2Eyg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: check vm bo eviction valuable at last
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 Qiang Yu <qiang.yu@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 18, 2022 at 6:24 PM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 18.02.22 um 11:16 schrieb Qiang Yu:
> > [SNIP]
> >>> If amdgpu_vm_ready() use evicting flag, it's still not equivalent to =
check
> >>> vm idle: true -> vm idle, false -> vm may be idle or busy.
> >> Yeah, but why should that be relevant?
> >>
> >> The amdgpu_vm_ready() return if we can do page table updates or not. I=
f
> >> the VM is idle or not is only relevant for eviction.
> >>
> >> In other words any CS or page table update makes the VM busy, but that
> >> only affects if the VM can be evicted or not.
> >>
> > My point is: we can't use amdgpu_vm_ready() to replace vm_is_busy(), so
> > currently we update vm even when vm is busy. So why not use:
Sorry, should be "vm is idle".

> > if (!amdgpu_vm_ready() || vm_is_busy()) return;
> > in amdgpu_gem_va_update_vm(), as you mentioned we prefer to not
> > update vm when it's idle.
>
> Because updating the VM while it is busy is perfectly fine, we do it all
> the time.
>
Yeah, as above, my typo.

> We should just not update it when it is already idle and was considered
> for eviction.
"and", not "or"?

> In this situation it makes most of the time sense to keep
> it idle and postpone the update till the next command submission.
>
> >>>>> Then we can keep the evicting flag accurate (after solving your
> >>>>> concern for this patch that eviction may fail latter by further del=
ay
> >>>>> the flag update after eviction success).
> >>>> That won't work. See we need to mark the VM as evicted before we
> >>>> actually evict them because otherwise somebody could use the VM in
> >>>> parallel and add another fence to it.
> >>>>
> >>> I see, make this too accurate should cost too much like holding the
> >>> eviction_lock when eviction. But just delay it in
> >>> amdgpu_ttm_bo_eviction_valuable()
> >>> could avoid most false positive case.
> >> Partially correct. Another fundamental problem is that we can't hold t=
he
> >> eviction lock because that would result in lock inversion and potentia=
l
> >> deadlock.
> >>
> >> We could set the flag later on, but as I said before that when we set
> >> the evicted flag when the VM is already idle is a desired effect.
> >>
> > As above, this confuse me as we can explicitly check vm idle when
> > user update vm, why bother to embed it in evicting flag implicitly?
>
> Well as I said it's irrelevant for the update if the VM is idle or not.
>
> To summarize the rules once more:
> 1. When VM page tables are used by CS or page tables updates it is
> considered busy, e.g. not idle.
>
> 2. When we want to evict a VM it must be idle. As soon as we considered
> this we should set the evicted flag to make sure to keep it idle as much
> as possible.
>
> 3. When we want to update the page tables we just need to check if the
> VM is idle or not.
>
But now we does not check vm idle directly in amdgpu_gem_va_update_vm().
If VM bo has not been considered for eviction, it could be either idle or b=
usy.

Just want to confirm if the fix should be only change amdgpu_vm_ready()
to use evicting flag or besides using evicting flag, also check vm_idle() i=
n
amdgpu_gem_va_update_vm().

Regards,
Qiang

> 4. When a CS happens we don't have another chance and make the VM busy
> again. And do all postponed page table updates.
>
Anyway,

> Regards,
> Christian.
>
> >
> > Check vm idle need to hold resv lock. Read your patch for adding
> > evicting flag is to update vm without resv lock. But user vm ops in
> > amdgpu_gem_va_update_vm() do hold the resv lock, so the difference
> > happens when calling amdgpu_vm_bo_update_mapping() from
> > svm_range_(un)map_to_gpu(). So embed vm idle in evicting flag
> > is for svm_range_(un)map_to_gpu() also do nothing when vm idle?
>
>
>
> >
> > Regards,
> > Qiang
> >
> >> Regards,
> >> Christian.
> >>
> >>> Regards,
> >>> Qiang
> >>>
> >>>> Regards,
> >>>> Christian.
> >>>>
> >>>>> Regards,
> >>>>> Qiang
> >>>>>
> >>>>>
> >>>>>> Regards,
> >>>>>> Christian.
> >>>>>>
> >>>>>>> Regards,
> >>>>>>> Qiang
> >>>>>>>
> >>>>>>>> Regards,
> >>>>>>>> Christian.
> >>>>>>>>
> >>>>>>>>> Regards,
> >>>>>>>>> Qiang
> >>>>>>>>>
> >>>>>>>>>> Regards,
> >>>>>>>>>> Christian.
> >>>>>>>>>>
> >>>>>>>>>>> Regards,
> >>>>>>>>>>> Qiang
> >>>>>>>>>>>
> >>>>>>>>>>>> What we should rather do is to fix amdgpu_vm_ready() to take=
 a look at
> >>>>>>>>>>>> the flag instead of the linked list.
> >>>>>>>>>>>>
> >>>>>>>>>>>> Regards,
> >>>>>>>>>>>> Christian.
> >>>>>>>>>>>>
> >>>>>>>>>>>>> Signed-off-by: Qiang Yu <qiang.yu@amd.com>
> >>>>>>>>>>>>> ---
> >>>>>>>>>>>>>         drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 85 ++++++=
++++++++-----------
> >>>>>>>>>>>>>         1 file changed, 47 insertions(+), 38 deletions(-)
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/driv=
ers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> >>>>>>>>>>>>> index 5a32ee66d8c8..88a27911054f 100644
> >>>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> >>>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> >>>>>>>>>>>>> @@ -1306,45 +1306,11 @@ uint64_t amdgpu_ttm_tt_pte_flags(st=
ruct amdgpu_device *adev, struct ttm_tt *ttm,
> >>>>>>>>>>>>>             return flags;
> >>>>>>>>>>>>>         }
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> -/*
> >>>>>>>>>>>>> - * amdgpu_ttm_bo_eviction_valuable - Check to see if we ca=
n evict a buffer
> >>>>>>>>>>>>> - * object.
> >>>>>>>>>>>>> - *
> >>>>>>>>>>>>> - * Return true if eviction is sensible. Called by ttm_mem_=
evict_first() on
> >>>>>>>>>>>>> - * behalf of ttm_bo_mem_force_space() which tries to evict=
 buffer objects until
> >>>>>>>>>>>>> - * it can find space for a new object and by ttm_bo_force_=
list_clean() which is
> >>>>>>>>>>>>> - * used to clean out a memory space.
> >>>>>>>>>>>>> - */
> >>>>>>>>>>>>> -static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buf=
fer_object *bo,
> >>>>>>>>>>>>> -                                         const struct ttm_=
place *place)
> >>>>>>>>>>>>> +static bool amdgpu_ttm_mem_eviction_valuable(struct ttm_bu=
ffer_object *bo,
> >>>>>>>>>>>>> +                                          const struct ttm=
_place *place)
> >>>>>>>>>>>>>         {
> >>>>>>>>>>>>>             unsigned long num_pages =3D bo->resource->num_p=
ages;
> >>>>>>>>>>>>>             struct amdgpu_res_cursor cursor;
> >>>>>>>>>>>>> -     struct dma_resv_list *flist;
> >>>>>>>>>>>>> -     struct dma_fence *f;
> >>>>>>>>>>>>> -     int i;
> >>>>>>>>>>>>> -
> >>>>>>>>>>>>> -     /* Swapout? */
> >>>>>>>>>>>>> -     if (bo->resource->mem_type =3D=3D TTM_PL_SYSTEM)
> >>>>>>>>>>>>> -             return true;
> >>>>>>>>>>>>> -
> >>>>>>>>>>>>> -     if (bo->type =3D=3D ttm_bo_type_kernel &&
> >>>>>>>>>>>>> -         !amdgpu_vm_evictable(ttm_to_amdgpu_bo(bo)))
> >>>>>>>>>>>>> -             return false;
> >>>>>>>>>>>>> -
> >>>>>>>>>>>>> -     /* If bo is a KFD BO, check if the bo belongs to the =
current process.
> >>>>>>>>>>>>> -      * If true, then return false as any KFD process need=
s all its BOs to
> >>>>>>>>>>>>> -      * be resident to run successfully
> >>>>>>>>>>>>> -      */
> >>>>>>>>>>>>> -     flist =3D dma_resv_shared_list(bo->base.resv);
> >>>>>>>>>>>>> -     if (flist) {
> >>>>>>>>>>>>> -             for (i =3D 0; i < flist->shared_count; ++i) {
> >>>>>>>>>>>>> -                     f =3D rcu_dereference_protected(flist=
->shared[i],
> >>>>>>>>>>>>> -                             dma_resv_held(bo->base.resv))=
;
> >>>>>>>>>>>>> -                     if (amdkfd_fence_check_mm(f, current-=
>mm))
> >>>>>>>>>>>>> -                             return false;
> >>>>>>>>>>>>> -             }
> >>>>>>>>>>>>> -     }
> >>>>>>>>>>>>>
> >>>>>>>>>>>>>             switch (bo->resource->mem_type) {
> >>>>>>>>>>>>>             case AMDGPU_PL_PREEMPT:
> >>>>>>>>>>>>> @@ -1377,10 +1343,53 @@ static bool amdgpu_ttm_bo_eviction_=
valuable(struct ttm_buffer_object *bo,
> >>>>>>>>>>>>>                     return false;
> >>>>>>>>>>>>>
> >>>>>>>>>>>>>             default:
> >>>>>>>>>>>>> -             break;
> >>>>>>>>>>>>> +             return ttm_bo_eviction_valuable(bo, place);
> >>>>>>>>>>>>>             }
> >>>>>>>>>>>>> +}
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> -     return ttm_bo_eviction_valuable(bo, place);
> >>>>>>>>>>>>> +/*
> >>>>>>>>>>>>> + * amdgpu_ttm_bo_eviction_valuable - Check to see if we ca=
n evict a buffer
> >>>>>>>>>>>>> + * object.
> >>>>>>>>>>>>> + *
> >>>>>>>>>>>>> + * Return true if eviction is sensible. Called by ttm_mem_=
evict_first() on
> >>>>>>>>>>>>> + * behalf of ttm_bo_mem_force_space() which tries to evict=
 buffer objects until
> >>>>>>>>>>>>> + * it can find space for a new object and by ttm_bo_force_=
list_clean() which is
> >>>>>>>>>>>>> + * used to clean out a memory space.
> >>>>>>>>>>>>> + */
> >>>>>>>>>>>>> +static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buf=
fer_object *bo,
> >>>>>>>>>>>>> +                                         const struct ttm_=
place *place)
> >>>>>>>>>>>>> +{
> >>>>>>>>>>>>> +     struct dma_resv_list *flist;
> >>>>>>>>>>>>> +     struct dma_fence *f;
> >>>>>>>>>>>>> +     int i;
> >>>>>>>>>>>>> +
> >>>>>>>>>>>>> +     /* Swapout? */
> >>>>>>>>>>>>> +     if (bo->resource->mem_type =3D=3D TTM_PL_SYSTEM)
> >>>>>>>>>>>>> +             return true;
> >>>>>>>>>>>>> +
> >>>>>>>>>>>>> +     /* If bo is a KFD BO, check if the bo belongs to the =
current process.
> >>>>>>>>>>>>> +      * If true, then return false as any KFD process need=
s all its BOs to
> >>>>>>>>>>>>> +      * be resident to run successfully
> >>>>>>>>>>>>> +      */
> >>>>>>>>>>>>> +     flist =3D dma_resv_shared_list(bo->base.resv);
> >>>>>>>>>>>>> +     if (flist) {
> >>>>>>>>>>>>> +             for (i =3D 0; i < flist->shared_count; ++i) {
> >>>>>>>>>>>>> +                     f =3D rcu_dereference_protected(flist=
->shared[i],
> >>>>>>>>>>>>> +                             dma_resv_held(bo->base.resv))=
;
> >>>>>>>>>>>>> +                     if (amdkfd_fence_check_mm(f, current-=
>mm))
> >>>>>>>>>>>>> +                             return false;
> >>>>>>>>>>>>> +             }
> >>>>>>>>>>>>> +     }
> >>>>>>>>>>>>> +
> >>>>>>>>>>>>> +     /* Check by different mem type. */
> >>>>>>>>>>>>> +     if (!amdgpu_ttm_mem_eviction_valuable(bo, place))
> >>>>>>>>>>>>> +             return false;
> >>>>>>>>>>>>> +
> >>>>>>>>>>>>> +     /* VM bo should be checked at last because it will ma=
rk VM evicting. */
> >>>>>>>>>>>>> +     if (bo->type =3D=3D ttm_bo_type_kernel)
> >>>>>>>>>>>>> +             return amdgpu_vm_evictable(ttm_to_amdgpu_bo(b=
o));
> >>>>>>>>>>>>> +
> >>>>>>>>>>>>> +     return true;
> >>>>>>>>>>>>>         }
> >>>>>>>>>>>>>
> >>>>>>>>>>>>>         static void amdgpu_ttm_vram_mm_access(struct amdgpu=
_device *adev, loff_t pos,
>
