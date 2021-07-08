Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5503BF8D3
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 13:20:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 227AB6E1FB;
	Thu,  8 Jul 2021 11:20:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 464486E1FB
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 11:20:44 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 w15-20020a056830144fb02904af2a0d96f3so5482870otp.6
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 04:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pN2WFeKUp9zT/C4OZ0cC/0hoOF8SzrmuQfznwQeE9Yk=;
 b=f66xs9NOnKM1rYmZjvTqWLSki0FmeZConHyGwBlSdxJ/iPAjczfilMxMtcZclxSTGe
 mGiBGAeYyzvygb5Ufn+vqEZHvcQtt5EV+AyLwEO+ZKN9Hlb6p3KQoGBnldRb2W0dPvrO
 XAs4hdkxlObdqEFUDgehNza+vxW0a+gYdPA/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pN2WFeKUp9zT/C4OZ0cC/0hoOF8SzrmuQfznwQeE9Yk=;
 b=rNg9/uJAjImzUr7oMVahrPnUk7vsmZaeIbv1sbYy+0PuwQXFGkZHJRqoztEbAjcV8/
 oNV2u4tLS8ZJYHO3XYE0TCu0OgXOQX8Z1lDJ+h+GkBb4s+15yiOOtg5rpQBNUU59C5W9
 GxF9tvBynVabIYmYhVmhrfuIrpmKRNO7EARptUaOvoFTGwDdulsVHI54TQ9+UmQuXcZ+
 ORpZXjSY1IjPliOuihOtZmnS3wezO41ZunVpFr8iGUNcunRSZqskT8H2kWCczYq/Xodv
 X3V1RbmdeJf+/UyIxKqLjFsGgToRl1eLCJ56Ysv5IeTW6j2zs+8++lJoGYnk12gCFtY+
 KOEA==
X-Gm-Message-State: AOAM5309wf1pApSwIOKeKOvCDTRmJqRdNuTbJAhoTJaGLAct5tLT5Iqv
 fg+ASTLM60+JhglkplmMgTorbSZdcGcq6+QV3oZeAQ==
X-Google-Smtp-Source: ABdhPJw6ErjJlcYYW3FqH1yws1XTgRQx8biR8gxWBQ4cQHqdiA1cv3R6IlK1zB6Fs7663cJmFvYcm1H4TTk7/iCE5iE=
X-Received: by 2002:a9d:27a4:: with SMTP id c33mr23772935otb.281.1625743243424; 
 Thu, 08 Jul 2021 04:20:43 -0700 (PDT)
MIME-Version: 1.0
References: <a5c5647e-e0ce-cc6d-c473-685679739051@amd.com>
 <CAKMK7uGTSe9FZCup=6D2G3MWGuxoUiV3Qjau-pQyaqOAX8OTug@mail.gmail.com>
 <8387b5f8-a5f6-fc2d-48e6-4bb0768ac642@amd.com>
 <CAKMK7uFu7V0QzsbMGPJPnMjXOB7FrKB_d+oDwkFMVaEvgy5EOQ@mail.gmail.com>
 <7933a995-0c95-9339-5385-a24681f6df3a@amd.com>
 <CAKMK7uE3bd2whKVBA4uWmzKBp7fjcVKexVFc=TB+ZRxdYT7VNg@mail.gmail.com>
 <b4824514-4ffd-a5f0-9bbc-d89cdd4e7b50@amd.com>
 <CAKMK7uF7E4G9D_W+YRV_ZrJLtUFXqWZfN78VdrVC=byMux78LQ@mail.gmail.com>
 <CAKMK7uEwFUq2KnSjk0YgdbKKvhh2ifsyURO0E5RzzhWzzMtovQ@mail.gmail.com>
 <4369ee92-7eba-3faa-4d9c-08901d3506aa@amd.com>
 <YObNNcSZL0CBXvQK@phenom.ffwll.local>
 <700b6419-4d3c-9cc8-f8bd-0d7d134df546@amd.com>
In-Reply-To: <700b6419-4d3c-9cc8-f8bd-0d7d134df546@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 8 Jul 2021 13:20:32 +0200
Message-ID: <CAKMK7uE4H2nsAYSAQGB0R7YTHUFvfNmshE2Bqy0uSdHomPxo=A@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] drm/sched: Split drm_sched_job_init
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
Cc: Emma Anholt <emma@anholt.net>, Adam Borowski <kilobyte@angband.pl>,
 David Airlie <airlied@linux.ie>, Viresh Kumar <viresh.kumar@linaro.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Sonny Jiang <sonny.jiang@amd.com>, Nirmoy Das <nirmoy.das@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Lee Jones <lee.jones@linaro.org>,
 Jack Zhang <Jack.Zhang1@amd.com>, lima@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Steven Price <steven.price@arm.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>, Dave Airlie <airlied@redhat.com>,
 Dennis Li <Dennis.Li@amd.com>, Chen Li <chenli@uniontech.com>,
 Paul Menzel <pmenzel@molgen.mpg.de>, Kees Cook <keescook@chromium.org>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 Kevin Wang <kevin1.wang@amd.com>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Nick Terrell <terrelln@fb.com>, Deepak R Varma <mh12gx2825@gmail.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Qiang Yu <yuq825@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 8, 2021 at 12:54 PM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 08.07.21 um 12:02 schrieb Daniel Vetter:
> > On Thu, Jul 08, 2021 at 09:53:00AM +0200, Christian K=C3=B6nig wrote:
> >> Am 08.07.21 um 09:19 schrieb Daniel Vetter:
> >>> On Thu, Jul 8, 2021 at 9:09 AM Daniel Vetter <daniel.vetter@ffwll.ch>=
 wrote:
> >>>> On Thu, Jul 8, 2021 at 8:56 AM Christian K=C3=B6nig <christian.koeni=
g@amd.com> wrote:
> >>>>> Am 07.07.21 um 18:32 schrieb Daniel Vetter:
> >>>>>> On Wed, Jul 7, 2021 at 2:58 PM Christian K=C3=B6nig <christian.koe=
nig@amd.com> wrote:
> >>>>>>> Am 07.07.21 um 14:13 schrieb Daniel Vetter:
> >>>>>>>> On Wed, Jul 7, 2021 at 1:57 PM Christian K=C3=B6nig <christian.k=
oenig@amd.com> wrote:
> >>>>>>>>> Am 07.07.21 um 13:14 schrieb Daniel Vetter:
> >>>>>>>>>> On Wed, Jul 7, 2021 at 11:30 AM Christian K=C3=B6nig
> >>>>>>>>>> <christian.koenig@amd.com> wrote:
> >>>>>>>>>>> Am 02.07.21 um 23:38 schrieb Daniel Vetter:
> >>>>>>>>>>>> This is a very confusingly named function, because not just =
does it
> >>>>>>>>>>>> init an object, it arms it and provides a point of no return=
 for
> >>>>>>>>>>>> pushing a job into the scheduler. It would be nice if that's=
 a bit
> >>>>>>>>>>>> clearer in the interface.
> >>>>>>>>>>>>
> >>>>>>>>>>>> But the real reason is that I want to push the dependency tr=
acking
> >>>>>>>>>>>> helpers into the scheduler code, and that means drm_sched_jo=
b_init
> >>>>>>>>>>>> must be called a lot earlier, without arming the job.
> >>>>>>>>>>>>
> >>>>>>>>>>>> v2:
> >>>>>>>>>>>> - don't change .gitignore (Steven)
> >>>>>>>>>>>> - don't forget v3d (Emma)
> >>>>>>>>>>>>
> >>>>>>>>>>>> v3: Emma noticed that I leak the memory allocated in
> >>>>>>>>>>>> drm_sched_job_init if we bail out before the point of no ret=
urn in
> >>>>>>>>>>>> subsequent driver patches. To be able to fix this change
> >>>>>>>>>>>> drm_sched_job_cleanup() so it can handle being called both b=
efore and
> >>>>>>>>>>>> after drm_sched_job_arm().
> >>>>>>>>>>> Thinking more about this, I'm not sure if this really works.
> >>>>>>>>>>>
> >>>>>>>>>>> See drm_sched_job_init() was also calling drm_sched_entity_se=
lect_rq()
> >>>>>>>>>>> to update the entity->rq association.
> >>>>>>>>>>>
> >>>>>>>>>>> And that can only be done later on when we arm the fence as w=
ell.
> >>>>>>>>>> Hm yeah, but that's a bug in the existing code I think: We alr=
eady
> >>>>>>>>>> fail to clean up if we fail to allocate the fences. So I think=
 the
> >>>>>>>>>> right thing to do here is to split the checks into job_init, a=
nd do
> >>>>>>>>>> the actual arming/rq selection in job_arm? I'm not entirely su=
re
> >>>>>>>>>> what's all going on there, the first check looks a bit like tr=
ying to
> >>>>>>>>>> schedule before the entity is set up, which is a driver bug an=
d should
> >>>>>>>>>> have a WARN_ON?
> >>>>>>>>> No you misunderstood me, the problem is something else.
> >>>>>>>>>
> >>>>>>>>> You asked previously why the call to drm_sched_job_init() was s=
o late in
> >>>>>>>>> the CS.
> >>>>>>>>>
> >>>>>>>>> The reason for this was not alone the scheduler fence init, but=
 also the
> >>>>>>>>> call to drm_sched_entity_select_rq().
> >>>>>>>> Ah ok, I think I can fix that. Needs a prep patch to first make
> >>>>>>>> drm_sched_entity_select infallible, then should be easy to do.
> >>>>>>>>
> >>>>>>>>>> The 2nd check around last_scheduled I have honeslty no idea wh=
at it's
> >>>>>>>>>> even trying to do.
> >>>>>>>>> You mean that here?
> >>>>>>>>>
> >>>>>>>>>              fence =3D READ_ONCE(entity->last_scheduled);
> >>>>>>>>>              if (fence && !dma_fence_is_signaled(fence))
> >>>>>>>>>                      return;
> >>>>>>>>>
> >>>>>>>>> This makes sure that load balancing is not moving the entity to=
 a
> >>>>>>>>> different scheduler while there are still jobs running from thi=
s entity
> >>>>>>>>> on the hardware,
> >>>>>>>> Yeah after a nap that idea crossed my mind too. But now I have l=
ocking
> >>>>>>>> questions, afaiui the scheduler thread updates this, without tak=
ing
> >>>>>>>> any locks - entity dequeuing is lockless. And here we read the f=
ence
> >>>>>>>> and then seem to yolo check whether it's signalled? What's preve=
nting
> >>>>>>>> a use-after-free here? There's no rcu or anything going on here =
at
> >>>>>>>> all, and it's outside of the spinlock section, which starts a bi=
t
> >>>>>>>> further down.
> >>>>>>> The last_scheduled fence of an entity can only change when there =
are
> >>>>>>> jobs on the entities queued, and we have just ruled that out in t=
he
> >>>>>>> check before.
> >>>>>> There aren't any barriers, so the cpu could easily run the two che=
cks
> >>>>>> the other way round. I'll ponder this and figure out where exactly=
 we
> >>>>>> need docs for the constraint and/or barriers to make this work as
> >>>>>> intended. As-is I'm not seeing how it does ...
> >>>>> spsc_queue_count() provides the necessary barrier with the atomic_r=
ead().
> >>>> atomic_t is fully unordered, except when it's a read-modify-write
> >>> Wasn't awake yet, I think the rule is read-modify-write and return
> >>> previous value gives you full barrier. So stuff like cmpxchg, but als=
o
> >>> a few others. See atomic_t.txt under ODERING heading (yes that
> >>> maintainer refuses to accept .rst so I can't just link you to the
> >>> right section, it's silly). get/set and even RMW atomic ops that don'=
t
> >>> return anything are all fully unordered.
> >> As far as I know that not completely correct. The rules around atomics=
 i
> >> once learned are:
> >>
> >> 1. Everything which modifies something is a write barrier.
> >> 2. Everything which returns something is a read barrier.
> >>
> >> And I know a whole bunch of use cases where this is relied upon in the=
 core
> >> kernel, so I'm pretty sure that's correct.
> > That's against what the doc says, and also it would mean stuff like
> > atomic_read_acquire or smp_mb__after/before_atomic is completely pointl=
ess.
> >
> > On x86 you're right, anywhere else where there's no total store orderin=
g I
> > you're wrong.
>
> Good to know. I always thought that atomic_read_acquire() was just for
> documentation purpose.

Maybe you mixed it up with C++ atomics (which I think are now also in
C)? Those are strongly ordered by default (you can get the weakly
ordered kernel-style one too). It's a bit unfortunate that the default
semantics are exactly opposite between kernel and userspace :-/

> > If there's code that relies on this it needs to be fixed and properly
> > documented. I did go through the squeue code a bit, and might be better=
 to
> > just replace this with a core data structure.
>
> Well the spsc was especially crafted for this use case and performed
> quite a bit better then a double linked list.

Yeah  double-linked list is awful.

> Or what core data structure do you have in mind?

Hm I thought there's a ready-made queue primitive, but there's just
llist.h. Which I think is roughly what the scheduler queue also does.
Minus the atomic_t for counting how many there are, and aside from the
tracepoints I don't think we're using those anywhere, we just check
for is_empty in the code (from a quick look only).
-Daniel

>
> Christian.
>
> > -Daniel
> >
> >> In this case the write barrier is the atomic_dec() in spsc_queue_pop()=
 and
> >> the read barrier is the aromic_read() in spsc_queue_count().
> >>
> >> The READ_ONCE() is actually not even necessary as far as I can see.
> >>
> >> Christian.
> >>
> >>> -Daniel
> >>>
> >>>
> >>>> atomic op, then it's a full barrier. So yeah you need more here. But
> >>>> also since you only need a read barrier on one side, and a write
> >>>> barrier on the other, you don't actually need a cpu barriers on x86.
> >>>> And READ_ONCE gives you the compiler barrier on one side at least, I
> >>>> haven't found it on the writer side yet.
> >>>>
> >>>>> But yes a comment would be really nice here. I had to think for a w=
hile
> >>>>> why we don't need this as well.
> >>>> I'm typing a patch, which after a night's sleep I realized has the
> >>>> wrong barriers. And now I'm also typing some doc improvements for
> >>>> drm_sched_entity and related functions.
> >>>>
> >>>>> Christian.
> >>>>>
> >>>>>> -Daniel
> >>>>>>
> >>>>>>> Christian.
> >>>>>>>
> >>>>>>>
> >>>>>>>> -Daniel
> >>>>>>>>
> >>>>>>>>> Regards
> >>>>>>>>> Christian.
> >>>>>>>>>
> >>>>>>>>>> -Daniel
> >>>>>>>>>>
> >>>>>>>>>>> Christian.
> >>>>>>>>>>>
> >>>>>>>>>>>> Also improve the kerneldoc for this.
> >>>>>>>>>>>>
> >>>>>>>>>>>> Acked-by: Steven Price <steven.price@arm.com> (v2)
> >>>>>>>>>>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> >>>>>>>>>>>> Cc: Lucas Stach <l.stach@pengutronix.de>
> >>>>>>>>>>>> Cc: Russell King <linux+etnaviv@armlinux.org.uk>
> >>>>>>>>>>>> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> >>>>>>>>>>>> Cc: Qiang Yu <yuq825@gmail.com>
> >>>>>>>>>>>> Cc: Rob Herring <robh@kernel.org>
> >>>>>>>>>>>> Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> >>>>>>>>>>>> Cc: Steven Price <steven.price@arm.com>
> >>>>>>>>>>>> Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> >>>>>>>>>>>> Cc: David Airlie <airlied@linux.ie>
> >>>>>>>>>>>> Cc: Daniel Vetter <daniel@ffwll.ch>
> >>>>>>>>>>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> >>>>>>>>>>>> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> >>>>>>>>>>>> Cc: Masahiro Yamada <masahiroy@kernel.org>
> >>>>>>>>>>>> Cc: Kees Cook <keescook@chromium.org>
> >>>>>>>>>>>> Cc: Adam Borowski <kilobyte@angband.pl>
> >>>>>>>>>>>> Cc: Nick Terrell <terrelln@fb.com>
> >>>>>>>>>>>> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> >>>>>>>>>>>> Cc: Paul Menzel <pmenzel@molgen.mpg.de>
> >>>>>>>>>>>> Cc: Sami Tolvanen <samitolvanen@google.com>
> >>>>>>>>>>>> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> >>>>>>>>>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
> >>>>>>>>>>>> Cc: Dave Airlie <airlied@redhat.com>
> >>>>>>>>>>>> Cc: Nirmoy Das <nirmoy.das@amd.com>
> >>>>>>>>>>>> Cc: Deepak R Varma <mh12gx2825@gmail.com>
> >>>>>>>>>>>> Cc: Lee Jones <lee.jones@linaro.org>
> >>>>>>>>>>>> Cc: Kevin Wang <kevin1.wang@amd.com>
> >>>>>>>>>>>> Cc: Chen Li <chenli@uniontech.com>
> >>>>>>>>>>>> Cc: Luben Tuikov <luben.tuikov@amd.com>
> >>>>>>>>>>>> Cc: "Marek Ol=C5=A1=C3=A1k" <marek.olsak@amd.com>
> >>>>>>>>>>>> Cc: Dennis Li <Dennis.Li@amd.com>
> >>>>>>>>>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >>>>>>>>>>>> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> >>>>>>>>>>>> Cc: Sonny Jiang <sonny.jiang@amd.com>
> >>>>>>>>>>>> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> >>>>>>>>>>>> Cc: Tian Tao <tiantao6@hisilicon.com>
> >>>>>>>>>>>> Cc: Jack Zhang <Jack.Zhang1@amd.com>
> >>>>>>>>>>>> Cc: etnaviv@lists.freedesktop.org
> >>>>>>>>>>>> Cc: lima@lists.freedesktop.org
> >>>>>>>>>>>> Cc: linux-media@vger.kernel.org
> >>>>>>>>>>>> Cc: linaro-mm-sig@lists.linaro.org
> >>>>>>>>>>>> Cc: Emma Anholt <emma@anholt.net>
> >>>>>>>>>>>> ---
> >>>>>>>>>>>>        drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c   |  2 ++
> >>>>>>>>>>>>        drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  2 ++
> >>>>>>>>>>>>        drivers/gpu/drm/etnaviv/etnaviv_sched.c  |  2 ++
> >>>>>>>>>>>>        drivers/gpu/drm/lima/lima_sched.c        |  2 ++
> >>>>>>>>>>>>        drivers/gpu/drm/panfrost/panfrost_job.c  |  2 ++
> >>>>>>>>>>>>        drivers/gpu/drm/scheduler/sched_entity.c |  6 ++--
> >>>>>>>>>>>>        drivers/gpu/drm/scheduler/sched_fence.c  | 17 +++++--=
--
> >>>>>>>>>>>>        drivers/gpu/drm/scheduler/sched_main.c   | 46 +++++++=
++++++++++++++---
> >>>>>>>>>>>>        drivers/gpu/drm/v3d/v3d_gem.c            |  2 ++
> >>>>>>>>>>>>        include/drm/gpu_scheduler.h              |  7 +++-
> >>>>>>>>>>>>        10 files changed, 74 insertions(+), 14 deletions(-)
> >>>>>>>>>>>>
> >>>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/driver=
s/gpu/drm/amd/amdgpu/amdgpu_cs.c
> >>>>>>>>>>>> index c5386d13eb4a..a4ec092af9a7 100644
> >>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> >>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> >>>>>>>>>>>> @@ -1226,6 +1226,8 @@ static int amdgpu_cs_submit(struct amd=
gpu_cs_parser *p,
> >>>>>>>>>>>>            if (r)
> >>>>>>>>>>>>                    goto error_unlock;
> >>>>>>>>>>>>
> >>>>>>>>>>>> +     drm_sched_job_arm(&job->base);
> >>>>>>>>>>>> +
> >>>>>>>>>>>>            /* No memory allocation is allowed while holding =
the notifier lock.
> >>>>>>>>>>>>             * The lock is held until amdgpu_cs_submit is fin=
ished and fence is
> >>>>>>>>>>>>             * added to BOs.
> >>>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drive=
rs/gpu/drm/amd/amdgpu/amdgpu_job.c
> >>>>>>>>>>>> index d33e6d97cc89..5ddb955d2315 100644
> >>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> >>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> >>>>>>>>>>>> @@ -170,6 +170,8 @@ int amdgpu_job_submit(struct amdgpu_job =
*job, struct drm_sched_entity *entity,
> >>>>>>>>>>>>            if (r)
> >>>>>>>>>>>>                    return r;
> >>>>>>>>>>>>
> >>>>>>>>>>>> +     drm_sched_job_arm(&job->base);
> >>>>>>>>>>>> +
> >>>>>>>>>>>>            *f =3D dma_fence_get(&job->base.s_fence->finished=
);
> >>>>>>>>>>>>            amdgpu_job_free_resources(job);
> >>>>>>>>>>>>            drm_sched_entity_push_job(&job->base, entity);
> >>>>>>>>>>>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drive=
rs/gpu/drm/etnaviv/etnaviv_sched.c
> >>>>>>>>>>>> index feb6da1b6ceb..05f412204118 100644
> >>>>>>>>>>>> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> >>>>>>>>>>>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> >>>>>>>>>>>> @@ -163,6 +163,8 @@ int etnaviv_sched_push_job(struct drm_sc=
hed_entity *sched_entity,
> >>>>>>>>>>>>            if (ret)
> >>>>>>>>>>>>                    goto out_unlock;
> >>>>>>>>>>>>
> >>>>>>>>>>>> +     drm_sched_job_arm(&submit->sched_job);
> >>>>>>>>>>>> +
> >>>>>>>>>>>>            submit->out_fence =3D dma_fence_get(&submit->sche=
d_job.s_fence->finished);
> >>>>>>>>>>>>            submit->out_fence_id =3D idr_alloc_cyclic(&submit=
->gpu->fence_idr,
> >>>>>>>>>>>>                                                    submit->o=
ut_fence, 0,
> >>>>>>>>>>>> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu=
/drm/lima/lima_sched.c
> >>>>>>>>>>>> index dba8329937a3..38f755580507 100644
> >>>>>>>>>>>> --- a/drivers/gpu/drm/lima/lima_sched.c
> >>>>>>>>>>>> +++ b/drivers/gpu/drm/lima/lima_sched.c
> >>>>>>>>>>>> @@ -129,6 +129,8 @@ int lima_sched_task_init(struct lima_sch=
ed_task *task,
> >>>>>>>>>>>>                    return err;
> >>>>>>>>>>>>            }
> >>>>>>>>>>>>
> >>>>>>>>>>>> +     drm_sched_job_arm(&task->base);
> >>>>>>>>>>>> +
> >>>>>>>>>>>>            task->num_bos =3D num_bos;
> >>>>>>>>>>>>            task->vm =3D lima_vm_get(vm);
> >>>>>>>>>>>>
> >>>>>>>>>>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drive=
rs/gpu/drm/panfrost/panfrost_job.c
> >>>>>>>>>>>> index 71a72fb50e6b..2992dc85325f 100644
> >>>>>>>>>>>> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> >>>>>>>>>>>> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> >>>>>>>>>>>> @@ -288,6 +288,8 @@ int panfrost_job_push(struct panfrost_jo=
b *job)
> >>>>>>>>>>>>                    goto unlock;
> >>>>>>>>>>>>            }
> >>>>>>>>>>>>
> >>>>>>>>>>>> +     drm_sched_job_arm(&job->base);
> >>>>>>>>>>>> +
> >>>>>>>>>>>>            job->render_done_fence =3D dma_fence_get(&job->ba=
se.s_fence->finished);
> >>>>>>>>>>>>
> >>>>>>>>>>>>            ret =3D panfrost_acquire_object_fences(job->bos, =
job->bo_count,
> >>>>>>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/driv=
ers/gpu/drm/scheduler/sched_entity.c
> >>>>>>>>>>>> index 79554aa4dbb1..f7347c284886 100644
> >>>>>>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> >>>>>>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> >>>>>>>>>>>> @@ -485,9 +485,9 @@ void drm_sched_entity_select_rq(struct d=
rm_sched_entity *entity)
> >>>>>>>>>>>>         * @sched_job: job to submit
> >>>>>>>>>>>>         * @entity: scheduler entity
> >>>>>>>>>>>>         *
> >>>>>>>>>>>> - * Note: To guarantee that the order of insertion to queue =
matches
> >>>>>>>>>>>> - * the job's fence sequence number this function should be
> >>>>>>>>>>>> - * called with drm_sched_job_init under common lock.
> >>>>>>>>>>>> + * Note: To guarantee that the order of insertion to queue =
matches the job's
> >>>>>>>>>>>> + * fence sequence number this function should be called wit=
h drm_sched_job_arm()
> >>>>>>>>>>>> + * under common lock.
> >>>>>>>>>>>>         *
> >>>>>>>>>>>>         * Returns 0 for success, negative error code otherwi=
se.
> >>>>>>>>>>>>         */
> >>>>>>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drive=
rs/gpu/drm/scheduler/sched_fence.c
> >>>>>>>>>>>> index 69de2c76731f..c451ee9a30d7 100644
> >>>>>>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_fence.c
> >>>>>>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> >>>>>>>>>>>> @@ -90,7 +90,7 @@ static const char *drm_sched_fence_get_tim=
eline_name(struct dma_fence *f)
> >>>>>>>>>>>>         *
> >>>>>>>>>>>>         * Free up the fence memory after the RCU grace perio=
d.
> >>>>>>>>>>>>         */
> >>>>>>>>>>>> -static void drm_sched_fence_free(struct rcu_head *rcu)
> >>>>>>>>>>>> +void drm_sched_fence_free(struct rcu_head *rcu)
> >>>>>>>>>>>>        {
> >>>>>>>>>>>>            struct dma_fence *f =3D container_of(rcu, struct =
dma_fence, rcu);
> >>>>>>>>>>>>            struct drm_sched_fence *fence =3D to_drm_sched_fe=
nce(f);
> >>>>>>>>>>>> @@ -152,11 +152,10 @@ struct drm_sched_fence *to_drm_sched_f=
ence(struct dma_fence *f)
> >>>>>>>>>>>>        }
> >>>>>>>>>>>>        EXPORT_SYMBOL(to_drm_sched_fence);
> >>>>>>>>>>>>
> >>>>>>>>>>>> -struct drm_sched_fence *drm_sched_fence_create(struct drm_s=
ched_entity *entity,
> >>>>>>>>>>>> -                                            void *owner)
> >>>>>>>>>>>> +struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sc=
hed_entity *entity,
> >>>>>>>>>>>> +                                           void *owner)
> >>>>>>>>>>>>        {
> >>>>>>>>>>>>            struct drm_sched_fence *fence =3D NULL;
> >>>>>>>>>>>> -     unsigned seq;
> >>>>>>>>>>>>
> >>>>>>>>>>>>            fence =3D kmem_cache_zalloc(sched_fence_slab, GFP=
_KERNEL);
> >>>>>>>>>>>>            if (fence =3D=3D NULL)
> >>>>>>>>>>>> @@ -166,13 +165,19 @@ struct drm_sched_fence *drm_sched_fenc=
e_create(struct drm_sched_entity *entity,
> >>>>>>>>>>>>            fence->sched =3D entity->rq->sched;
> >>>>>>>>>>>>            spin_lock_init(&fence->lock);
> >>>>>>>>>>>>
> >>>>>>>>>>>> +     return fence;
> >>>>>>>>>>>> +}
> >>>>>>>>>>>> +
> >>>>>>>>>>>> +void drm_sched_fence_init(struct drm_sched_fence *fence,
> >>>>>>>>>>>> +                       struct drm_sched_entity *entity)
> >>>>>>>>>>>> +{
> >>>>>>>>>>>> +     unsigned seq;
> >>>>>>>>>>>> +
> >>>>>>>>>>>>            seq =3D atomic_inc_return(&entity->fence_seq);
> >>>>>>>>>>>>            dma_fence_init(&fence->scheduled, &drm_sched_fenc=
e_ops_scheduled,
> >>>>>>>>>>>>                           &fence->lock, entity->fence_contex=
t, seq);
> >>>>>>>>>>>>            dma_fence_init(&fence->finished, &drm_sched_fence=
_ops_finished,
> >>>>>>>>>>>>                           &fence->lock, entity->fence_contex=
t + 1, seq);
> >>>>>>>>>>>> -
> >>>>>>>>>>>> -     return fence;
> >>>>>>>>>>>>        }
> >>>>>>>>>>>>
> >>>>>>>>>>>>        module_init(drm_sched_fence_slab_init);
> >>>>>>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/driver=
s/gpu/drm/scheduler/sched_main.c
> >>>>>>>>>>>> index 33c414d55fab..5e84e1500c32 100644
> >>>>>>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
> >>>>>>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> >>>>>>>>>>>> @@ -48,9 +48,11 @@
> >>>>>>>>>>>>        #include <linux/wait.h>
> >>>>>>>>>>>>        #include <linux/sched.h>
> >>>>>>>>>>>>        #include <linux/completion.h>
> >>>>>>>>>>>> +#include <linux/dma-resv.h>
> >>>>>>>>>>>>        #include <uapi/linux/sched/types.h>
> >>>>>>>>>>>>
> >>>>>>>>>>>>        #include <drm/drm_print.h>
> >>>>>>>>>>>> +#include <drm/drm_gem.h>
> >>>>>>>>>>>>        #include <drm/gpu_scheduler.h>
> >>>>>>>>>>>>        #include <drm/spsc_queue.h>
> >>>>>>>>>>>>
> >>>>>>>>>>>> @@ -569,7 +571,6 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs_ex=
t);
> >>>>>>>>>>>>
> >>>>>>>>>>>>        /**
> >>>>>>>>>>>>         * drm_sched_job_init - init a scheduler job
> >>>>>>>>>>>> - *
> >>>>>>>>>>>>         * @job: scheduler job to init
> >>>>>>>>>>>>         * @entity: scheduler entity to use
> >>>>>>>>>>>>         * @owner: job owner for debugging
> >>>>>>>>>>>> @@ -577,6 +578,9 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs_ex=
t);
> >>>>>>>>>>>>         * Refer to drm_sched_entity_push_job() documentation
> >>>>>>>>>>>>         * for locking considerations.
> >>>>>>>>>>>>         *
> >>>>>>>>>>>> + * Drivers must make sure drm_sched_job_cleanup() if this f=
unction returns
> >>>>>>>>>>>> + * successfully, even when @job is aborted before drm_sched=
_job_arm() is called.
> >>>>>>>>>>>> + *
> >>>>>>>>>>>>         * Returns 0 for success, negative error code otherwi=
se.
> >>>>>>>>>>>>         */
> >>>>>>>>>>>>        int drm_sched_job_init(struct drm_sched_job *job,
> >>>>>>>>>>>> @@ -594,7 +598,7 @@ int drm_sched_job_init(struct drm_sched_=
job *job,
> >>>>>>>>>>>>            job->sched =3D sched;
> >>>>>>>>>>>>            job->entity =3D entity;
> >>>>>>>>>>>>            job->s_priority =3D entity->rq - sched->sched_rq;
> >>>>>>>>>>>> -     job->s_fence =3D drm_sched_fence_create(entity, owner)=
;
> >>>>>>>>>>>> +     job->s_fence =3D drm_sched_fence_alloc(entity, owner);
> >>>>>>>>>>>>            if (!job->s_fence)
> >>>>>>>>>>>>                    return -ENOMEM;
> >>>>>>>>>>>>            job->id =3D atomic64_inc_return(&sched->job_id_co=
unt);
> >>>>>>>>>>>> @@ -606,13 +610,47 @@ int drm_sched_job_init(struct drm_sche=
d_job *job,
> >>>>>>>>>>>>        EXPORT_SYMBOL(drm_sched_job_init);
> >>>>>>>>>>>>
> >>>>>>>>>>>>        /**
> >>>>>>>>>>>> - * drm_sched_job_cleanup - clean up scheduler job resources
> >>>>>>>>>>>> + * drm_sched_job_arm - arm a scheduler job for execution
> >>>>>>>>>>>> + * @job: scheduler job to arm
> >>>>>>>>>>>> + *
> >>>>>>>>>>>> + * This arms a scheduler job for execution. Specifically it=
 initializes the
> >>>>>>>>>>>> + * &drm_sched_job.s_fence of @job, so that it can be attach=
ed to struct dma_resv
> >>>>>>>>>>>> + * or other places that need to track the completion of thi=
s job.
> >>>>>>>>>>>> + *
> >>>>>>>>>>>> + * Refer to drm_sched_entity_push_job() documentation for l=
ocking
> >>>>>>>>>>>> + * considerations.
> >>>>>>>>>>>>         *
> >>>>>>>>>>>> + * This can only be called if drm_sched_job_init() succeede=
d.
> >>>>>>>>>>>> + */
> >>>>>>>>>>>> +void drm_sched_job_arm(struct drm_sched_job *job)
> >>>>>>>>>>>> +{
> >>>>>>>>>>>> +     drm_sched_fence_init(job->s_fence, job->entity);
> >>>>>>>>>>>> +}
> >>>>>>>>>>>> +EXPORT_SYMBOL(drm_sched_job_arm);
> >>>>>>>>>>>> +
> >>>>>>>>>>>> +/**
> >>>>>>>>>>>> + * drm_sched_job_cleanup - clean up scheduler job resources
> >>>>>>>>>>>>         * @job: scheduler job to clean up
> >>>>>>>>>>>> + *
> >>>>>>>>>>>> + * Cleans up the resources allocated with drm_sched_job_ini=
t().
> >>>>>>>>>>>> + *
> >>>>>>>>>>>> + * Drivers should call this from their error unwind code if=
 @job is aborted
> >>>>>>>>>>>> + * before drm_sched_job_arm() is called.
> >>>>>>>>>>>> + *
> >>>>>>>>>>>> + * After that point of no return @job is committed to be ex=
ecuted by the
> >>>>>>>>>>>> + * scheduler, and this function should be called from the
> >>>>>>>>>>>> + * &drm_sched_backend_ops.free_job callback.
> >>>>>>>>>>>>         */
> >>>>>>>>>>>>        void drm_sched_job_cleanup(struct drm_sched_job *job)
> >>>>>>>>>>>>        {
> >>>>>>>>>>>> -     dma_fence_put(&job->s_fence->finished);
> >>>>>>>>>>>> +     if (!kref_read(&job->s_fence->finished.refcount)) {
> >>>>>>>>>>>> +             /* drm_sched_job_arm() has been called */
> >>>>>>>>>>>> +             dma_fence_put(&job->s_fence->finished);
> >>>>>>>>>>>> +     } else {
> >>>>>>>>>>>> +             /* aborted job before committing to run it */
> >>>>>>>>>>>> +             drm_sched_fence_free(&job->s_fence->finished.r=
cu);
> >>>>>>>>>>>> +     }
> >>>>>>>>>>>> +
> >>>>>>>>>>>>            job->s_fence =3D NULL;
> >>>>>>>>>>>>        }
> >>>>>>>>>>>>        EXPORT_SYMBOL(drm_sched_job_cleanup);
> >>>>>>>>>>>> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm=
/v3d/v3d_gem.c
> >>>>>>>>>>>> index 4eb354226972..5c3a99027ecd 100644
> >>>>>>>>>>>> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> >>>>>>>>>>>> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> >>>>>>>>>>>> @@ -475,6 +475,8 @@ v3d_push_job(struct v3d_file_priv *v3d_p=
riv,
> >>>>>>>>>>>>            if (ret)
> >>>>>>>>>>>>                    return ret;
> >>>>>>>>>>>>
> >>>>>>>>>>>> +     drm_sched_job_arm(&job->base);
> >>>>>>>>>>>> +
> >>>>>>>>>>>>            job->done_fence =3D dma_fence_get(&job->base.s_fe=
nce->finished);
> >>>>>>>>>>>>
> >>>>>>>>>>>>            /* put by scheduler job completion */
> >>>>>>>>>>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_s=
cheduler.h
> >>>>>>>>>>>> index 88ae7f331bb1..83afc3aa8e2f 100644
> >>>>>>>>>>>> --- a/include/drm/gpu_scheduler.h
> >>>>>>>>>>>> +++ b/include/drm/gpu_scheduler.h
> >>>>>>>>>>>> @@ -348,6 +348,7 @@ void drm_sched_fini(struct drm_gpu_sched=
uler *sched);
> >>>>>>>>>>>>        int drm_sched_job_init(struct drm_sched_job *job,
> >>>>>>>>>>>>                           struct drm_sched_entity *entity,
> >>>>>>>>>>>>                           void *owner);
> >>>>>>>>>>>> +void drm_sched_job_arm(struct drm_sched_job *job);
> >>>>>>>>>>>>        void drm_sched_entity_modify_sched(struct drm_sched_e=
ntity *entity,
> >>>>>>>>>>>>                                        struct drm_gpu_schedu=
ler **sched_list,
> >>>>>>>>>>>>                                           unsigned int num_s=
ched_list);
> >>>>>>>>>>>> @@ -387,8 +388,12 @@ void drm_sched_entity_set_priority(stru=
ct drm_sched_entity *entity,
> >>>>>>>>>>>>                                       enum drm_sched_priorit=
y priority);
> >>>>>>>>>>>>        bool drm_sched_entity_is_ready(struct drm_sched_entit=
y *entity);
> >>>>>>>>>>>>
> >>>>>>>>>>>> -struct drm_sched_fence *drm_sched_fence_create(
> >>>>>>>>>>>> +struct drm_sched_fence *drm_sched_fence_alloc(
> >>>>>>>>>>>>            struct drm_sched_entity *s_entity, void *owner);
> >>>>>>>>>>>> +void drm_sched_fence_init(struct drm_sched_fence *fence,
> >>>>>>>>>>>> +                       struct drm_sched_entity *entity);
> >>>>>>>>>>>> +void drm_sched_fence_free(struct rcu_head *rcu);
> >>>>>>>>>>>> +
> >>>>>>>>>>>>        void drm_sched_fence_scheduled(struct drm_sched_fence=
 *fence);
> >>>>>>>>>>>>        void drm_sched_fence_finished(struct drm_sched_fence =
*fence);
> >>>>>>>>>>>>
> >>>> --
> >>>> Daniel Vetter
> >>>> Software Engineer, Intel Corporation
> >>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fb=
log.ffwll.ch%2F&amp;data=3D04%7C01%7Cchristian.koenig%40amd.com%7C708679038=
1b9415f60e708d941f78266%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637613=
353580226578%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLC=
JBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D9GhYoGHD6TlcrW5dvT9Z%2BFukW=
%2F8%2BicK2t8180coEsJY%3D&amp;reserved=3D0
> >>>
> >>> --
> >>> Daniel Vetter
> >>> Software Engineer, Intel Corporation
> >>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fbl=
og.ffwll.ch%2F&amp;data=3D04%7C01%7Cchristian.koenig%40amd.com%7C7086790381=
b9415f60e708d941f78266%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C6376133=
53580236571%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DYt%2FirDjTmtDUjQS1xlYg4x5mz8=
2cHkNyLPkNNpO31ro%3D&amp;reserved=3D0
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
