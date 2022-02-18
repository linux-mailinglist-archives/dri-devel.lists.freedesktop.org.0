Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F82F4BAFFE
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 04:08:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D5710E9FC;
	Fri, 18 Feb 2022 03:08:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BA5110E9F8;
 Fri, 18 Feb 2022 03:08:31 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 l12-20020a0568302b0c00b005a4856ff4ceso1077004otv.13; 
 Thu, 17 Feb 2022 19:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7NtFuMkC0v+umA0r2Z9wwdYfloaxCJo3MlkADJvxZNU=;
 b=SXJMDJViICup6JW1yK7qoZkGrOxj2/lnPdz13+a6GFTIAGDvuPzkKofUo2xG6GuoR0
 TrYYJMw6ipmoGl6xHR/eDY3PynqYNE+KZ3gmnJUXs3wq4K3+/MsQsqaUt0gscKt/mTI0
 X0JztZ2AUSTRU/bRvWUyIb/GxLIGAaj0RfD3x7xeD0JJFGy3g3E4eTe4FoJWGvAf6ZUA
 jE0YdzHRyZnx6BZyw2CwNXMNUyiGJpgE4p+2Z9IG2T0kNZgU96vw0QkFtlTJI8GKQi/W
 a7N31YN/tIjdEo1Evd4yMBplL91hQdAgx0juJoMODcyU4ksb3w7eLD+bQBThJskaf9Up
 TJew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7NtFuMkC0v+umA0r2Z9wwdYfloaxCJo3MlkADJvxZNU=;
 b=xY/n0orM3BigZ6x6gT+ukUpvg9sbNLmKlFHxL9TF+YZzUbl6yxzbpmRSvrBIbYvZmj
 mSYU8N+s/z4z2ef92y9JiJCOmPntYozv4F313lqjo4eCCIZgn+3fDDM5hX4v6W8EcAWk
 YMakxDcAD5mOSulRsglzkeCKBCI/hYbhXsf7NkSbTJYXVF/IjiD2zq87FEnPLVeWdWxo
 HR9Orel+JYiTRIEuI46MEqyEXd2s04/rjHXfxlQVT9FI3YOFj1YVlR9wq9mCDu4y5GLO
 zHrjzlXX3NPusM0CWF64e98Q5fRvyQp74vVxO9qN1t5pAjI2l9t53h73ijWkCnTW588M
 GR8g==
X-Gm-Message-State: AOAM531YkVWi6u8Q4vW75o6APvcnwlJ6ceHy9fFQh4KDCO67GTjBdvo4
 F0sK+PoaHlVNEmVTPAZKqAqEleul/M8EuVfqk5M=
X-Google-Smtp-Source: ABdhPJy+HKsYdlrtET3RMKtN7jSsmxokjX0+qXeY3PfQvy9JLMrgmsvCt9foGefr2crXrDSrEeTZOKad7+5MjqRb7Xc=
X-Received: by 2002:a05:6830:401a:b0:5a4:c82a:bc53 with SMTP id
 h26-20020a056830401a00b005a4c82abc53mr1932169ots.214.1645153710695; Thu, 17
 Feb 2022 19:08:30 -0800 (PST)
MIME-Version: 1.0
References: <20220217090440.4468-1-qiang.yu@amd.com>
 <5d3fdd2c-e74a-49f4-2b28-32c06483236f@amd.com>
 <CAKGbVbtLTBJPF5eTu4rABUTBa8eqjQvqjo1AEUrzgPgYgCREuA@mail.gmail.com>
 <dac70c05-e712-d2e3-2267-278380895f1e@amd.com>
 <CAKGbVbvtLbDiKrX80-dMnipdLkTE+FP=g_mx37e12fuMtA1Y4Q@mail.gmail.com>
 <ca27a9c6-f390-a938-dd66-ac23f3b44dc4@amd.com>
 <CAKGbVbv4UFCybS_OFj5UkDgevbrB5qe3pv+0nHv9WdefYhy6Ww@mail.gmail.com>
 <6711073b-8771-5750-33f7-b72333b411c6@amd.com>
In-Reply-To: <6711073b-8771-5750-33f7-b72333b411c6@amd.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Fri, 18 Feb 2022 11:08:18 +0800
Message-ID: <CAKGbVbvR+msXjrsXmDM8QTmsCP03hL5-q5CTJBYu4mm=NQd01A@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: check vm bo eviction valuable at last
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
 dri-devel <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org,
 Qiang Yu <qiang.yu@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 17, 2022 at 8:22 PM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 17.02.22 um 11:58 schrieb Qiang Yu:
> > On Thu, Feb 17, 2022 at 6:39 PM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >>
> >>
> >> Am 17.02.22 um 11:13 schrieb Qiang Yu:
> >>> On Thu, Feb 17, 2022 at 5:46 PM Christian K=C3=B6nig
> >>> <christian.koenig@amd.com> wrote:
> >>>> Am 17.02.22 um 10:40 schrieb Qiang Yu:
> >>>>> On Thu, Feb 17, 2022 at 5:15 PM Christian K=C3=B6nig
> >>>>> <christian.koenig@amd.com> wrote:
> >>>>>> Am 17.02.22 um 10:04 schrieb Qiang Yu:
> >>>>>>> Workstation application ANSA/META get this error dmesg:
> >>>>>>> [drm:amdgpu_gem_va_ioctl [amdgpu]] *ERROR* Couldn't update BO_VA =
(-16)
> >>>>>>>
> >>>>>>> This is caused by:
> >>>>>>> 1. create a 256MB buffer in invisible VRAM
> >>>>>>> 2. CPU map the buffer and access it causes vm_fault and try to mo=
ve
> >>>>>>>        it to visible VRAM
> >>>>>>> 3. force visible VRAM space and traverse all VRAM bos to check if
> >>>>>>>        evicting this bo is valuable
> >>>>>>> 4. when checking a VM bo (in invisible VRAM), amdgpu_vm_evictable=
()
> >>>>>>>        will set amdgpu_vm->evicting, but latter due to not in vis=
ible
> >>>>>>>        VRAM, won't really evict it so not add it to amdgpu_vm->ev=
icted
> >>>>>>> 5. before next CS to clear the amdgpu_vm->evicting, user VM ops
> >>>>>>>        ioctl will pass amdgpu_vm_ready() (check amdgpu_vm->evicte=
d)
> >>>>>>>        but fail in amdgpu_vm_bo_update_mapping() (check
> >>>>>>>        amdgpu_vm->evicting) and get this error log
> >>>>>>>
> >>>>>>> This error won't affect functionality as next CS will finish the
> >>>>>>> waiting VM ops. But we'd better make the amdgpu_vm->evicting
> >>>>>>> correctly reflact the vm status and clear the error log.
> >>>>>> Well NAK, that is intentional behavior.
> >>>>>>
> >>>>>> The VM page tables where considered for eviction, so setting the f=
lag is
> >>>>>> correct even when the page tables later on are not actually evicte=
d.
> >>>>>>
> >>>>> But this will unnecessarily stop latter user VM ops in ioctl before=
 CS
> >>>>> even when the VM bos are not evicted.
> >>>>> Won't this have any negative effect when could do better?
> >>>> No, this will have a positive effect. See the VM was already conside=
red
> >>>> for eviction because it is idle.
> >>>>
> >>>> Updating it immediately doesn't necessarily make sense, we should wa=
it
> >>>> with that until its next usage.
> >>>>
> >>>> Additional to that this patch doesn't really fix the problem, it jus=
t
> >>>> mitigates it.
> >>>>
> >>>> Eviction can fail later on for a couple of reasons and we absolutely
> >>>> need to check the flag instead of the list in amdgpu_vm_ready().
> >>> The flag only for both flag and list? Looks like should be both as
> >>> the list indicate some vm page table need to be updated and could
> >>> delay the user update with the same logic as you described above.
> >> I think checking the flag should be enough. The issue is that the list
> >> was there initially, but to avoid race conditions we added the flag wi=
th
> >> separate lock protection later on.
> >>
> > But list and flag does not align always, there are cases like
> > list-empty/flag-set (this problem) and list-non-empty/flag-unset (non-v=
m bo
> > eviction). If only check flag list-non-empty/flag-unset change behavior=
.
>
> Yeah, but I think that the flag unset list-non-empty case would be
> correctly handled if we only test the flag.
>
> In other words we can update the page tables as long as they are not
> partially or fully evicted and that's not the case when non-vm BOs are
> evicted.
>
This sounds like two standard for the same thing, because this problem
does not evict page tables too. But I see your point is:
There's a difference that this problem's case can make sure vm is idle,
and we prefer to delay vm updates when vm is idle.

If so, why not just stop user vm update by checking vm busy in
amdgpu_gem_va_ioctl() to skip amdgpu_gem_va_update_vm()?

Then we can keep the evicting flag accurate (after solving your
concern for this patch that eviction may fail latter by further delay
the flag update after eviction success).

Regards,
Qiang


> Regards,
> Christian.
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
> >>>>>> What we should rather do is to fix amdgpu_vm_ready() to take a loo=
k at
> >>>>>> the flag instead of the linked list.
> >>>>>>
> >>>>>> Regards,
> >>>>>> Christian.
> >>>>>>
> >>>>>>> Signed-off-by: Qiang Yu <qiang.yu@amd.com>
> >>>>>>> ---
> >>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 85 ++++++++++++++-=
----------
> >>>>>>>      1 file changed, 47 insertions(+), 38 deletions(-)
> >>>>>>>
> >>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gp=
u/drm/amd/amdgpu/amdgpu_ttm.c
> >>>>>>> index 5a32ee66d8c8..88a27911054f 100644
> >>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> >>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> >>>>>>> @@ -1306,45 +1306,11 @@ uint64_t amdgpu_ttm_tt_pte_flags(struct a=
mdgpu_device *adev, struct ttm_tt *ttm,
> >>>>>>>          return flags;
> >>>>>>>      }
> >>>>>>>
> >>>>>>> -/*
> >>>>>>> - * amdgpu_ttm_bo_eviction_valuable - Check to see if we can evic=
t a buffer
> >>>>>>> - * object.
> >>>>>>> - *
> >>>>>>> - * Return true if eviction is sensible. Called by ttm_mem_evict_=
first() on
> >>>>>>> - * behalf of ttm_bo_mem_force_space() which tries to evict buffe=
r objects until
> >>>>>>> - * it can find space for a new object and by ttm_bo_force_list_c=
lean() which is
> >>>>>>> - * used to clean out a memory space.
> >>>>>>> - */
> >>>>>>> -static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_ob=
ject *bo,
> >>>>>>> -                                         const struct ttm_place =
*place)
> >>>>>>> +static bool amdgpu_ttm_mem_eviction_valuable(struct ttm_buffer_o=
bject *bo,
> >>>>>>> +                                          const struct ttm_place=
 *place)
> >>>>>>>      {
> >>>>>>>          unsigned long num_pages =3D bo->resource->num_pages;
> >>>>>>>          struct amdgpu_res_cursor cursor;
> >>>>>>> -     struct dma_resv_list *flist;
> >>>>>>> -     struct dma_fence *f;
> >>>>>>> -     int i;
> >>>>>>> -
> >>>>>>> -     /* Swapout? */
> >>>>>>> -     if (bo->resource->mem_type =3D=3D TTM_PL_SYSTEM)
> >>>>>>> -             return true;
> >>>>>>> -
> >>>>>>> -     if (bo->type =3D=3D ttm_bo_type_kernel &&
> >>>>>>> -         !amdgpu_vm_evictable(ttm_to_amdgpu_bo(bo)))
> >>>>>>> -             return false;
> >>>>>>> -
> >>>>>>> -     /* If bo is a KFD BO, check if the bo belongs to the curren=
t process.
> >>>>>>> -      * If true, then return false as any KFD process needs all =
its BOs to
> >>>>>>> -      * be resident to run successfully
> >>>>>>> -      */
> >>>>>>> -     flist =3D dma_resv_shared_list(bo->base.resv);
> >>>>>>> -     if (flist) {
> >>>>>>> -             for (i =3D 0; i < flist->shared_count; ++i) {
> >>>>>>> -                     f =3D rcu_dereference_protected(flist->shar=
ed[i],
> >>>>>>> -                             dma_resv_held(bo->base.resv));
> >>>>>>> -                     if (amdkfd_fence_check_mm(f, current->mm))
> >>>>>>> -                             return false;
> >>>>>>> -             }
> >>>>>>> -     }
> >>>>>>>
> >>>>>>>          switch (bo->resource->mem_type) {
> >>>>>>>          case AMDGPU_PL_PREEMPT:
> >>>>>>> @@ -1377,10 +1343,53 @@ static bool amdgpu_ttm_bo_eviction_valuab=
le(struct ttm_buffer_object *bo,
> >>>>>>>                  return false;
> >>>>>>>
> >>>>>>>          default:
> >>>>>>> -             break;
> >>>>>>> +             return ttm_bo_eviction_valuable(bo, place);
> >>>>>>>          }
> >>>>>>> +}
> >>>>>>>
> >>>>>>> -     return ttm_bo_eviction_valuable(bo, place);
> >>>>>>> +/*
> >>>>>>> + * amdgpu_ttm_bo_eviction_valuable - Check to see if we can evic=
t a buffer
> >>>>>>> + * object.
> >>>>>>> + *
> >>>>>>> + * Return true if eviction is sensible. Called by ttm_mem_evict_=
first() on
> >>>>>>> + * behalf of ttm_bo_mem_force_space() which tries to evict buffe=
r objects until
> >>>>>>> + * it can find space for a new object and by ttm_bo_force_list_c=
lean() which is
> >>>>>>> + * used to clean out a memory space.
> >>>>>>> + */
> >>>>>>> +static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_ob=
ject *bo,
> >>>>>>> +                                         const struct ttm_place =
*place)
> >>>>>>> +{
> >>>>>>> +     struct dma_resv_list *flist;
> >>>>>>> +     struct dma_fence *f;
> >>>>>>> +     int i;
> >>>>>>> +
> >>>>>>> +     /* Swapout? */
> >>>>>>> +     if (bo->resource->mem_type =3D=3D TTM_PL_SYSTEM)
> >>>>>>> +             return true;
> >>>>>>> +
> >>>>>>> +     /* If bo is a KFD BO, check if the bo belongs to the curren=
t process.
> >>>>>>> +      * If true, then return false as any KFD process needs all =
its BOs to
> >>>>>>> +      * be resident to run successfully
> >>>>>>> +      */
> >>>>>>> +     flist =3D dma_resv_shared_list(bo->base.resv);
> >>>>>>> +     if (flist) {
> >>>>>>> +             for (i =3D 0; i < flist->shared_count; ++i) {
> >>>>>>> +                     f =3D rcu_dereference_protected(flist->shar=
ed[i],
> >>>>>>> +                             dma_resv_held(bo->base.resv));
> >>>>>>> +                     if (amdkfd_fence_check_mm(f, current->mm))
> >>>>>>> +                             return false;
> >>>>>>> +             }
> >>>>>>> +     }
> >>>>>>> +
> >>>>>>> +     /* Check by different mem type. */
> >>>>>>> +     if (!amdgpu_ttm_mem_eviction_valuable(bo, place))
> >>>>>>> +             return false;
> >>>>>>> +
> >>>>>>> +     /* VM bo should be checked at last because it will mark VM =
evicting. */
> >>>>>>> +     if (bo->type =3D=3D ttm_bo_type_kernel)
> >>>>>>> +             return amdgpu_vm_evictable(ttm_to_amdgpu_bo(bo));
> >>>>>>> +
> >>>>>>> +     return true;
> >>>>>>>      }
> >>>>>>>
> >>>>>>>      static void amdgpu_ttm_vram_mm_access(struct amdgpu_device *=
adev, loff_t pos,
>
