Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7856E4BB4B1
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 09:58:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A31110ED0E;
	Fri, 18 Feb 2022 08:58:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E8510ED0E;
 Fri, 18 Feb 2022 08:58:48 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 o128-20020a4a4486000000b003181707ed40so2732664ooa.11; 
 Fri, 18 Feb 2022 00:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HO+NYzAweF5NSNQIcj+ApFFIjSwZhjOLgSIzmJUeJMg=;
 b=BQ1H5l+C85MZethqvPrPb/V+0OwkmV8Kql0YqiiyxsDztgqSrfJQ26tDW4ICycRfQA
 td/obdHOIQG/YL9p6+T0+IUciFt/8xwOPvbss/0q2xleicKTiCEG96bU/kkUmjDOf/SP
 TyfhoAmzLEY6qGOwdTxSOfsPjuSEivQahTGnYXjgv+DnHTKzd8ZLlSezbtThR8lQwpph
 /MkoWHotZrRKQThOUOUfXJdgNSW5shbWk4WMAsOQ9LbM/b6khUxj8tmbCEqR+f3Ocjmc
 HJQxWv/vsjGBGl18/zPAlMfTddRVMFRRsC1o2AHvOMVoc553pWifdGjBsvXJXO6ALbkQ
 yZog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HO+NYzAweF5NSNQIcj+ApFFIjSwZhjOLgSIzmJUeJMg=;
 b=fg0cq6NOfloeoohvRUoE8koQMnMDBFRLRsM67QbI6/5A25Fza2tZHfy8mwhl0lWBy1
 KX9lDLkCMLN9foWAXEGENt015GRQIwS1JlhK4wOlXtMV3RFM6wcIzXSIBtiU016dwNWT
 JPqkGvoIWJ6X7rF6qgraN9Tz+fSiYOlgfCIkE2GdQMiX4TKRBO8g3KQY0k9k4iy4e2FD
 MpwQuqxUxpii5jtpOMBvePq1yonPFw4ZEtUT8hGQ+/acOHhX/7eUyEjWMDktfbQx9BKu
 Hc4fBpLKvuD3f/4obvVV1nG5IoJVJo3Bmeux0QpX3wddAw/fxvGXxUYlViOSW43UREtY
 AATg==
X-Gm-Message-State: AOAM5330r+9+u7AkX2uA0NHmiVZHrB46X2dlyrqnmkKcocg82O5XkzJR
 qrIC1RmoR4iW2nj3mbmwjYJKPaUPqp3jrKPeGlY=
X-Google-Smtp-Source: ABdhPJxSdT0C5lcIZpwpt6n6vJojk1ossrHFMmRdODrT7X39K+OBeFui96ZF91zw+Wj4jPYFyCBYM9cQpaarC9vyrhU=
X-Received: by 2002:a05:6870:148a:b0:d3:b909:926c with SMTP id
 k10-20020a056870148a00b000d3b909926cmr2219051oab.129.1645174727212; Fri, 18
 Feb 2022 00:58:47 -0800 (PST)
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
In-Reply-To: <a11b7073-6597-8e87-b724-33acab32e791@gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Fri, 18 Feb 2022 16:58:35 +0800
Message-ID: <CAKGbVbuJ-QdeoMTg=_O=1x5A5tbqZftsjt8aCCoVkAekci0USA@mail.gmail.com>
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

On Fri, Feb 18, 2022 at 3:46 PM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 18.02.22 um 04:08 schrieb Qiang Yu:
> > On Thu, Feb 17, 2022 at 8:22 PM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >> Am 17.02.22 um 11:58 schrieb Qiang Yu:
> >>> On Thu, Feb 17, 2022 at 6:39 PM Christian K=C3=B6nig
> >>> <christian.koenig@amd.com> wrote:
> >>>>
> >>>> Am 17.02.22 um 11:13 schrieb Qiang Yu:
> >>>>> On Thu, Feb 17, 2022 at 5:46 PM Christian K=C3=B6nig
> >>>>> <christian.koenig@amd.com> wrote:
> >>>>>> Am 17.02.22 um 10:40 schrieb Qiang Yu:
> >>>>>>> On Thu, Feb 17, 2022 at 5:15 PM Christian K=C3=B6nig
> >>>>>>> <christian.koenig@amd.com> wrote:
> >>>>>>>> Am 17.02.22 um 10:04 schrieb Qiang Yu:
> >>>>>>>>> Workstation application ANSA/META get this error dmesg:
> >>>>>>>>> [drm:amdgpu_gem_va_ioctl [amdgpu]] *ERROR* Couldn't update BO_V=
A (-16)
> >>>>>>>>>
> >>>>>>>>> This is caused by:
> >>>>>>>>> 1. create a 256MB buffer in invisible VRAM
> >>>>>>>>> 2. CPU map the buffer and access it causes vm_fault and try to =
move
> >>>>>>>>>         it to visible VRAM
> >>>>>>>>> 3. force visible VRAM space and traverse all VRAM bos to check =
if
> >>>>>>>>>         evicting this bo is valuable
> >>>>>>>>> 4. when checking a VM bo (in invisible VRAM), amdgpu_vm_evictab=
le()
> >>>>>>>>>         will set amdgpu_vm->evicting, but latter due to not in =
visible
> >>>>>>>>>         VRAM, won't really evict it so not add it to amdgpu_vm-=
>evicted
> >>>>>>>>> 5. before next CS to clear the amdgpu_vm->evicting, user VM ops
> >>>>>>>>>         ioctl will pass amdgpu_vm_ready() (check amdgpu_vm->evi=
cted)
> >>>>>>>>>         but fail in amdgpu_vm_bo_update_mapping() (check
> >>>>>>>>>         amdgpu_vm->evicting) and get this error log
> >>>>>>>>>
> >>>>>>>>> This error won't affect functionality as next CS will finish th=
e
> >>>>>>>>> waiting VM ops. But we'd better make the amdgpu_vm->evicting
> >>>>>>>>> correctly reflact the vm status and clear the error log.
> >>>>>>>> Well NAK, that is intentional behavior.
> >>>>>>>>
> >>>>>>>> The VM page tables where considered for eviction, so setting the=
 flag is
> >>>>>>>> correct even when the page tables later on are not actually evic=
ted.
> >>>>>>>>
> >>>>>>> But this will unnecessarily stop latter user VM ops in ioctl befo=
re CS
> >>>>>>> even when the VM bos are not evicted.
> >>>>>>> Won't this have any negative effect when could do better?
> >>>>>> No, this will have a positive effect. See the VM was already consi=
dered
> >>>>>> for eviction because it is idle.
> >>>>>>
> >>>>>> Updating it immediately doesn't necessarily make sense, we should =
wait
> >>>>>> with that until its next usage.
> >>>>>>
> >>>>>> Additional to that this patch doesn't really fix the problem, it j=
ust
> >>>>>> mitigates it.
> >>>>>>
> >>>>>> Eviction can fail later on for a couple of reasons and we absolute=
ly
> >>>>>> need to check the flag instead of the list in amdgpu_vm_ready().
> >>>>> The flag only for both flag and list? Looks like should be both as
> >>>>> the list indicate some vm page table need to be updated and could
> >>>>> delay the user update with the same logic as you described above.
> >>>> I think checking the flag should be enough. The issue is that the li=
st
> >>>> was there initially, but to avoid race conditions we added the flag =
with
> >>>> separate lock protection later on.
> >>>>
> >>> But list and flag does not align always, there are cases like
> >>> list-empty/flag-set (this problem) and list-non-empty/flag-unset (non=
-vm bo
> >>> eviction). If only check flag list-non-empty/flag-unset change behavi=
or.
> >> Yeah, but I think that the flag unset list-non-empty case would be
> >> correctly handled if we only test the flag.
> >>
> >> In other words we can update the page tables as long as they are not
> >> partially or fully evicted and that's not the case when non-vm BOs are
> >> evicted.
> >>
> > This sounds like two standard for the same thing, because this problem
> > does not evict page tables too. But I see your point is:
> > There's a difference that this problem's case can make sure vm is idle,
> > and we prefer to delay vm updates when vm is idle.
> >
> > If so, why not just stop user vm update by checking vm busy in
> > amdgpu_gem_va_ioctl() to skip amdgpu_gem_va_update_vm()?
>
> That's exactly what amdgpu_gem_va_update_vm() is doing by calling
> amdgpu_vm_ready(). The problem is that amdgpu_vm_ready() looks at the
> wrong thing.
>
If amdgpu_vm_ready() use evicting flag, it's still not equivalent to check
vm idle: true -> vm idle, false -> vm may be idle or busy.

> > Then we can keep the evicting flag accurate (after solving your
> > concern for this patch that eviction may fail latter by further delay
> > the flag update after eviction success).
>
> That won't work. See we need to mark the VM as evicted before we
> actually evict them because otherwise somebody could use the VM in
> parallel and add another fence to it.
>
I see, make this too accurate should cost too much like holding the
eviction_lock when eviction. But just delay it in
amdgpu_ttm_bo_eviction_valuable()
could avoid most false positive case.

Regards,
Qiang

> Regards,
> Christian.
>
> >
> > Regards,
> > Qiang
> >
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
> >>>>>> Regards,
> >>>>>> Christian.
> >>>>>>
> >>>>>>> Regards,
> >>>>>>> Qiang
> >>>>>>>
> >>>>>>>> What we should rather do is to fix amdgpu_vm_ready() to take a l=
ook at
> >>>>>>>> the flag instead of the linked list.
> >>>>>>>>
> >>>>>>>> Regards,
> >>>>>>>> Christian.
> >>>>>>>>
> >>>>>>>>> Signed-off-by: Qiang Yu <qiang.yu@amd.com>
> >>>>>>>>> ---
> >>>>>>>>>       drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 85 ++++++++++++=
++-----------
> >>>>>>>>>       1 file changed, 47 insertions(+), 38 deletions(-)
> >>>>>>>>>
> >>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/=
gpu/drm/amd/amdgpu/amdgpu_ttm.c
> >>>>>>>>> index 5a32ee66d8c8..88a27911054f 100644
> >>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> >>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> >>>>>>>>> @@ -1306,45 +1306,11 @@ uint64_t amdgpu_ttm_tt_pte_flags(struct=
 amdgpu_device *adev, struct ttm_tt *ttm,
> >>>>>>>>>           return flags;
> >>>>>>>>>       }
> >>>>>>>>>
> >>>>>>>>> -/*
> >>>>>>>>> - * amdgpu_ttm_bo_eviction_valuable - Check to see if we can ev=
ict a buffer
> >>>>>>>>> - * object.
> >>>>>>>>> - *
> >>>>>>>>> - * Return true if eviction is sensible. Called by ttm_mem_evic=
t_first() on
> >>>>>>>>> - * behalf of ttm_bo_mem_force_space() which tries to evict buf=
fer objects until
> >>>>>>>>> - * it can find space for a new object and by ttm_bo_force_list=
_clean() which is
> >>>>>>>>> - * used to clean out a memory space.
> >>>>>>>>> - */
> >>>>>>>>> -static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_=
object *bo,
> >>>>>>>>> -                                         const struct ttm_plac=
e *place)
> >>>>>>>>> +static bool amdgpu_ttm_mem_eviction_valuable(struct ttm_buffer=
_object *bo,
> >>>>>>>>> +                                          const struct ttm_pla=
ce *place)
> >>>>>>>>>       {
> >>>>>>>>>           unsigned long num_pages =3D bo->resource->num_pages;
> >>>>>>>>>           struct amdgpu_res_cursor cursor;
> >>>>>>>>> -     struct dma_resv_list *flist;
> >>>>>>>>> -     struct dma_fence *f;
> >>>>>>>>> -     int i;
> >>>>>>>>> -
> >>>>>>>>> -     /* Swapout? */
> >>>>>>>>> -     if (bo->resource->mem_type =3D=3D TTM_PL_SYSTEM)
> >>>>>>>>> -             return true;
> >>>>>>>>> -
> >>>>>>>>> -     if (bo->type =3D=3D ttm_bo_type_kernel &&
> >>>>>>>>> -         !amdgpu_vm_evictable(ttm_to_amdgpu_bo(bo)))
> >>>>>>>>> -             return false;
> >>>>>>>>> -
> >>>>>>>>> -     /* If bo is a KFD BO, check if the bo belongs to the curr=
ent process.
> >>>>>>>>> -      * If true, then return false as any KFD process needs al=
l its BOs to
> >>>>>>>>> -      * be resident to run successfully
> >>>>>>>>> -      */
> >>>>>>>>> -     flist =3D dma_resv_shared_list(bo->base.resv);
> >>>>>>>>> -     if (flist) {
> >>>>>>>>> -             for (i =3D 0; i < flist->shared_count; ++i) {
> >>>>>>>>> -                     f =3D rcu_dereference_protected(flist->sh=
ared[i],
> >>>>>>>>> -                             dma_resv_held(bo->base.resv));
> >>>>>>>>> -                     if (amdkfd_fence_check_mm(f, current->mm)=
)
> >>>>>>>>> -                             return false;
> >>>>>>>>> -             }
> >>>>>>>>> -     }
> >>>>>>>>>
> >>>>>>>>>           switch (bo->resource->mem_type) {
> >>>>>>>>>           case AMDGPU_PL_PREEMPT:
> >>>>>>>>> @@ -1377,10 +1343,53 @@ static bool amdgpu_ttm_bo_eviction_valu=
able(struct ttm_buffer_object *bo,
> >>>>>>>>>                   return false;
> >>>>>>>>>
> >>>>>>>>>           default:
> >>>>>>>>> -             break;
> >>>>>>>>> +             return ttm_bo_eviction_valuable(bo, place);
> >>>>>>>>>           }
> >>>>>>>>> +}
> >>>>>>>>>
> >>>>>>>>> -     return ttm_bo_eviction_valuable(bo, place);
> >>>>>>>>> +/*
> >>>>>>>>> + * amdgpu_ttm_bo_eviction_valuable - Check to see if we can ev=
ict a buffer
> >>>>>>>>> + * object.
> >>>>>>>>> + *
> >>>>>>>>> + * Return true if eviction is sensible. Called by ttm_mem_evic=
t_first() on
> >>>>>>>>> + * behalf of ttm_bo_mem_force_space() which tries to evict buf=
fer objects until
> >>>>>>>>> + * it can find space for a new object and by ttm_bo_force_list=
_clean() which is
> >>>>>>>>> + * used to clean out a memory space.
> >>>>>>>>> + */
> >>>>>>>>> +static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_=
object *bo,
> >>>>>>>>> +                                         const struct ttm_plac=
e *place)
> >>>>>>>>> +{
> >>>>>>>>> +     struct dma_resv_list *flist;
> >>>>>>>>> +     struct dma_fence *f;
> >>>>>>>>> +     int i;
> >>>>>>>>> +
> >>>>>>>>> +     /* Swapout? */
> >>>>>>>>> +     if (bo->resource->mem_type =3D=3D TTM_PL_SYSTEM)
> >>>>>>>>> +             return true;
> >>>>>>>>> +
> >>>>>>>>> +     /* If bo is a KFD BO, check if the bo belongs to the curr=
ent process.
> >>>>>>>>> +      * If true, then return false as any KFD process needs al=
l its BOs to
> >>>>>>>>> +      * be resident to run successfully
> >>>>>>>>> +      */
> >>>>>>>>> +     flist =3D dma_resv_shared_list(bo->base.resv);
> >>>>>>>>> +     if (flist) {
> >>>>>>>>> +             for (i =3D 0; i < flist->shared_count; ++i) {
> >>>>>>>>> +                     f =3D rcu_dereference_protected(flist->sh=
ared[i],
> >>>>>>>>> +                             dma_resv_held(bo->base.resv));
> >>>>>>>>> +                     if (amdkfd_fence_check_mm(f, current->mm)=
)
> >>>>>>>>> +                             return false;
> >>>>>>>>> +             }
> >>>>>>>>> +     }
> >>>>>>>>> +
> >>>>>>>>> +     /* Check by different mem type. */
> >>>>>>>>> +     if (!amdgpu_ttm_mem_eviction_valuable(bo, place))
> >>>>>>>>> +             return false;
> >>>>>>>>> +
> >>>>>>>>> +     /* VM bo should be checked at last because it will mark V=
M evicting. */
> >>>>>>>>> +     if (bo->type =3D=3D ttm_bo_type_kernel)
> >>>>>>>>> +             return amdgpu_vm_evictable(ttm_to_amdgpu_bo(bo));
> >>>>>>>>> +
> >>>>>>>>> +     return true;
> >>>>>>>>>       }
> >>>>>>>>>
> >>>>>>>>>       static void amdgpu_ttm_vram_mm_access(struct amdgpu_devic=
e *adev, loff_t pos,
>
