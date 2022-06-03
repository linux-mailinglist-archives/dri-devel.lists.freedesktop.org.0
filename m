Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F9B53C198
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 03:21:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C03A210ECF4;
	Fri,  3 Jun 2022 01:21:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8651510ECF4
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 01:21:36 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id v22so11324676ybd.5
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 18:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PQhXue3O/i2lj8iFeVs8377JSAEsLsDOgUUfIgqkUVM=;
 b=K9S611Jji4wsDyi5Dxr3DOsIuvL3itcjNx1uCu67o+uQf79fNdu0wFJSVZ6wgxqFoC
 LXyrxpswpt4TP8aXe3xNw2x2dQuMZnlu9NrJBpxHFY4kdNtZl+APPlF4P/x5BdI3mFID
 gsKEGuirT9G0jYPzapvcVIAfDIADCnudQwJFYVof7mq53hyy92IGcqNIvy1OfyR+0kw8
 lCMMsiBHeFFJ4brVKKiFM2S6vJ3zt3m2bF1Uq/r4gh3UiOWKkozNJq0sR4GwWed4XLeP
 tRrrCE62X1Ye+emCjErPPft9MoY5HqQfAgLSXXwVzXKjGF5zMq6BY93LJuKOUpQJ54sF
 sJag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PQhXue3O/i2lj8iFeVs8377JSAEsLsDOgUUfIgqkUVM=;
 b=CYXxMJze9LTuhypJMqM7wLRwPpU/24hLv4eMBi1RK6MPq6yYoiqVMCej7sR6lKjT8/
 chr1aKUkFpi7y0Kb2LFDIJBEp4drPsqA4wKKi2c4cq+mG6Sq1h473ZK1guJmI0tHbJx8
 fV5DCWxAaIX/lPUTNUg7AnlUDuJ5LLw0cfVzOcZ1NKNRQzPpfJbNaVnHNFY5LQ8tLrcB
 vEIkLsrNEkG3mk/j8fbpRW98an4DPhIqhrL1J4RFklAi3jJGvNcR+KWJkmj9bOiRvBJX
 CTZqIt88ddxXm681ZOv5AQMP/IUMB52HcjcDRtaG5g7zzyy3lGunQ+4ZqjuKIEavwXUx
 F8jA==
X-Gm-Message-State: AOAM5332H94pBSSqFPgF9wBgmVAns+D7SeHNo0zS6ZxMZ1n7NfymDQH/
 hZR3fvPV5vVkAjZBninSh23dY822k3pOBu8K09j/7w==
X-Google-Smtp-Source: ABdhPJz950Lihki8+dV5/YMvRwffunMcWJQhU0dnhkTnzWnomRAW+Xi3cXd2s/lfDuiVKlXORNjHtNKMnye0+tT/XBw=
X-Received: by 2002:a05:6902:108:b0:621:165e:5c1e with SMTP id
 o8-20020a056902010800b00621165e5c1emr8144363ybh.204.1654219295673; Thu, 02
 Jun 2022 18:21:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220601004014.158247-1-bas@basnieuwenhuizen.nl>
 <20220601004014.158247-4-bas@basnieuwenhuizen.nl>
 <e4d8ea99-ceb5-b0dc-362f-94e37b9ddc6b@amd.com>
 <CAP+8YyEy8R3nbJVFkqHnh=3VsmfWKsQyY45tcWTQhm3hujBRbg@mail.gmail.com>
 <e502a4b7-e927-2abf-9014-0b23d15d401b@amd.com>
 <CAP+8YyHdbrvA-sJ=VZccmLkyZ9WCO7CnOp5K0pMoXA=MrHLCsw@mail.gmail.com>
 <bd850268-8324-79cb-854f-b0c843f9581b@amd.com>
In-Reply-To: <bd850268-8324-79cb-854f-b0c843f9581b@amd.com>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Fri, 3 Jun 2022 03:21:47 +0200
Message-ID: <CAP+8YyGuU_fBMLkSuqBMk7uy-F=BAaopWS-Vxi=-E0P5LGbsRQ@mail.gmail.com>
Subject: Re: [RFC PATCH 3/5] drm/amdgpu: Allow explicit sync for VM ops.
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 1, 2022 at 11:01 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 01.06.22 um 10:48 schrieb Bas Nieuwenhuizen:
> > On Wed, Jun 1, 2022 at 10:40 AM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >> Am 01.06.22 um 10:16 schrieb Bas Nieuwenhuizen:
> >>> On Wed, Jun 1, 2022 at 10:03 AM Christian K=C3=B6nig
> >>> <christian.koenig@amd.com> wrote:
> >>>> Am 01.06.22 um 02:40 schrieb Bas Nieuwenhuizen:
> >>>>> This should be okay because moves themselves use KERNEL usage and
> >>>>> hence still sync with BOOKKEEP usage. Then any later submits still
> >>>>> wait on any pending VM operations.
> >>>>>
> >>>>> (i.e. we only made VM ops not wait on BOOKKEEP submits, not the oth=
er
> >>>>>     way around)
> >>>> Well NAK again. This allows access to freed up memory and is a compl=
ete
> >>>> no-go.
> >>> How does this allow access to freed memory? Worst I can see is that
> >>> the unmap happens earlier if the app/drivers gets the waits wrong,
> >>> which wouldn't give access after the underlying BO is freed?
> >> To free up memory we need to update the PTEs and then flush those out =
by
> >> invalidating the TLB.
> >>
> >> On gfx6, gfx7 and gfx8 and some broken gfx10 hw invalidating the TLB c=
an
> >> only be done while the VMID is idle.
> >>
> >> Only gfx9 can reliable invalidate the TLB while it is in use and even
> >> there it comes with quite some performance penalty (at TLB invalidatio=
n
> >> can take multiple seconds).
> >>
> >> Because of this what we do in the kernel driver is to sync to everythi=
ng
> >> when we unmap entries:
> >>
> >>           if (!(flags & AMDGPU_PTE_VALID))
> >>                   sync_mode =3D AMDGPU_SYNC_EQ_OWNER;
> >>           else
> >>                   sync_mode =3D AMDGPU_SYNC_EXPLICIT;
> >>
> >> This acts as a barrier for freeing the memory. In other words we
> >> intentionally add a bubble which syncs everything.
> >>
> >> I'm working for month on a concept how to do all this without causing
> >> the stalls you observer, but so far didn't came to much of a conclusio=
n.
> > That might cause an unmap operation too early, but for freeing up the
> > actual backing memory we still wait for all fences on the BO to finish
> > first, no? In that case, since BOOKKEEP fences are still added for
> > explicit sync, that should not be a problem, no?
> >
> > (If not, that sounds like the obvious fix for making this work?)
>
> The problem is we need to wait on fences *not* added to the buffer object=
.

What fences wouldn't be added to the buffer object that we need here?
>
> E.g. what we currently do here while freeing memory is:
> 1. Update the PTEs and make that update wait for everything!
> 2. Add the fence of that update to the freed up BO so that this BO isn't
> freed before the next CS.
>
> We might be able to fix this by adding the fences to the BO before
> freeing it manually, but I'm not 100% sure we can actually allocate
> memory for the fences in that moment.

I think we don't need to be able to. We're already adding the unmap
fence to the BO in the gem close ioctl, and that has the fallback that
if we can't allocate space for the fence in the BO, we wait on the
fence manually on the CPU. I think that is a reasonable fallback for
this as well?

For the TTM move path amdgpu_copy_buffer will wait on the BO resv and
then following submissions will trigger VM updates that will wait on
the amdgpu_copy_buffer jobs (and hence transitively) will wait on the
work.  AFAICT the amdgpu_bo_move does not trigger any VM updates by
itself, and the amdgpu_bo_move_notify is way after the move (and after
the ttm_bo_move_accel_cleanup which would free the old resource), so
any VM changes triggered by that would see the TTM copy and sync to
it.

I do have to fix some stuff indeed, especially for the GEM close but
with that we should be able to keep the same basic approach?
>
> Regards,
> Christian.
>
>
> >> Regards,
> >> Christian.
> >>
> >>>> Regards,
> >>>> Christian.
> >>>>
> >>>>> Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> >>>>> ---
> >>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c  | 2 +-
> >>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c | 2 +-
> >>>>>     2 files changed, 2 insertions(+), 2 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c b/drivers/g=
pu/drm/amd/amdgpu/amdgpu_vm_cpu.c
> >>>>> index f10332e1c6c0..31bc73fd1fae 100644
> >>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
> >>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
> >>>>> @@ -51,7 +51,7 @@ static int amdgpu_vm_cpu_prepare(struct amdgpu_vm=
_update_params *p,
> >>>>>         if (!resv)
> >>>>>                 return 0;
> >>>>>
> >>>>> -     return amdgpu_bo_sync_wait_resv(p->adev, resv, sync_mode, syn=
c_mode, p->vm, true);
> >>>>> +     return amdgpu_bo_sync_wait_resv(p->adev, resv, sync_mode, AMD=
GPU_SYNC_EXPLICIT, p->vm, true);
> >>>>>     }
> >>>>>
> >>>>>     /**
> >>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c b/drivers/=
gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> >>>>> index 63b484dc76c5..c8d5898bea11 100644
> >>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> >>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> >>>>> @@ -75,7 +75,7 @@ static int amdgpu_vm_sdma_prepare(struct amdgpu_v=
m_update_params *p,
> >>>>>         if (!resv)
> >>>>>                 return 0;
> >>>>>
> >>>>> -     return amdgpu_sync_resv(p->adev, &p->job->sync, resv, sync_mo=
de, sync_mode, p->vm);
> >>>>> +     return amdgpu_sync_resv(p->adev, &p->job->sync, resv, sync_mo=
de, AMDGPU_SYNC_EXPLICIT, p->vm);
> >>>>>     }
> >>>>>
> >>>>>     /**
>
