Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A4E2EF609
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 17:53:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C6606E83B;
	Fri,  8 Jan 2021 16:53:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABA1E6E83B
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 16:53:39 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id 15so12008153oix.8
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jan 2021 08:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UB13OrqKGkLXdprxD/0nLtY4+n0oG4J3RFcVQd7ngbs=;
 b=ecOdReHBaist9VVZra781h8I3exeVvlBmHs/z56VqNoY/rzkDECpkPKbybYFWljSLz
 LrKTlrriJh5AqF9+d6XTjYHOrsmIL1o9I1bLdy8qmaVy476uT/2mRHujJTQjvhqRRnSX
 zeai8Wr2Fof1QlRWYsDD8SpeIbVjjpq6GylpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UB13OrqKGkLXdprxD/0nLtY4+n0oG4J3RFcVQd7ngbs=;
 b=lLDUFX6Fl26TTDEfICplw8JO+YzX8PwOTHIuIvo/D/gotxlEvQrkXHGYHzvl0qKdwQ
 /fMsj+zmKeU+KqKrxIyNtT+QCk1aKVVznMvQB5+WRhwOob9cEmbG88cqQJXY7LS/xY+b
 cFW1L8Lh8iAqR6a3rtlVipX6gf8a6Oj8XFgpnMETyynPqvNcFWBevR8fdOJXbCBnWPW7
 E8pWBIq89EwDEmUlFayEacPMu1bB7uxQI0t85pBm4d/aeUZ/AjKAC16JsjAU33JsKZ32
 GqT4ZCgTDNuXHTz4P6DU3Ir1Xmd/mLHpUQk9J3sGslzsDhGrKyrdtb1z9jE6efj0wS7E
 Y54Q==
X-Gm-Message-State: AOAM533bnks1+A7+z3xgMiJcKpJmSnsmYbIWLm+xdxVlIOveIHBuFivj
 AEhT30wH27lukufjgIStsE77toDjN5dEHmqrClJd5Q==
X-Google-Smtp-Source: ABdhPJydG3w8NUQ6SEc4P3Ctha/3J7/32Ggl2/jocimfGOTFCOMfwPSZkO3I/tSa6rde02Ctpp8xhjZp0GbSD24Z7vY=
X-Received: by 2002:aca:4e11:: with SMTP id c17mr2809699oib.14.1610124818682; 
 Fri, 08 Jan 2021 08:53:38 -0800 (PST)
MIME-Version: 1.0
References: <20210107030127.20393-1-Felix.Kuehling@amd.com>
 <X/bTFWL3HYVc8LEF@phenom.ffwll.local>
 <6daf9ebc-507e-6e83-04dd-d7c5fc6998d6@amd.com>
 <X/hux3eX8Ywf61h7@phenom.ffwll.local>
 <ed44f9cf-a7fc-f02b-dfd7-26b14310bc79@amd.com>
 <CAKMK7uF3GHAMuW2EL7TuX6b0TdVpkUB9wG4vOz_oMwCLL9K4BQ@mail.gmail.com>
 <277c78a5-0652-22e1-baaf-6c9da4746eb4@amd.com>
In-Reply-To: <277c78a5-0652-22e1-baaf-6c9da4746eb4@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 8 Jan 2021 17:53:27 +0100
Message-ID: <CAKMK7uGsxHMZ3kvD1Horh_zX8JvqdpcvSct1c-VyjQd8iyESQg@mail.gmail.com>
Subject: Re: [PATCH 00/35] Add HMM-based SVM memory manager to KFD
To: Felix Kuehling <felix.kuehling@amd.com>
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
Cc: Alex Sierra <alex.sierra@amd.com>, "Yang, Philip" <philip.yang@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 8, 2021 at 5:36 PM Felix Kuehling <felix.kuehling@amd.com> wrote:
>
>
> Am 2021-01-08 um 11:06 a.m. schrieb Daniel Vetter:
> > On Fri, Jan 8, 2021 at 4:58 PM Felix Kuehling <felix.kuehling@amd.com> wrote:
> >> Am 2021-01-08 um 9:40 a.m. schrieb Daniel Vetter:
> >>> On Thu, Jan 07, 2021 at 11:25:41AM -0500, Felix Kuehling wrote:
> >>>> Am 2021-01-07 um 4:23 a.m. schrieb Daniel Vetter:
> >>>>> On Wed, Jan 06, 2021 at 10:00:52PM -0500, Felix Kuehling wrote:
> >>>>>> This is the first version of our HMM based shared virtual memory manager
> >>>>>> for KFD. There are still a number of known issues that we're working through
> >>>>>> (see below). This will likely lead to some pretty significant changes in
> >>>>>> MMU notifier handling and locking on the migration code paths. So don't
> >>>>>> get hung up on those details yet.
> >>>>>>
> >>>>>> But I think this is a good time to start getting feedback. We're pretty
> >>>>>> confident about the ioctl API, which is both simple and extensible for the
> >>>>>> future. (see patches 4,16) The user mode side of the API can be found here:
> >>>>>> https://github.com/RadeonOpenCompute/ROCT-Thunk-Interface/blob/fxkamd/hmm-wip/src/svm.c
> >>>>>>
> >>>>>> I'd also like another pair of eyes on how we're interfacing with the GPU VM
> >>>>>> code in amdgpu_vm.c (see patches 12,13), retry page fault handling (24,25),
> >>>>>> and some retry IRQ handling changes (32).
> >>>>>>
> >>>>>>
> >>>>>> Known issues:
> >>>>>> * won't work with IOMMU enabled, we need to dma_map all pages properly
> >>>>>> * still working on some race conditions and random bugs
> >>>>>> * performance is not great yet
> >>>>> Still catching up, but I think there's another one for your list:
> >>>>>
> >>>>>  * hmm gpu context preempt vs page fault handling. I've had a short
> >>>>>    discussion about this one with Christian before the holidays, and also
> >>>>>    some private chats with Jerome. It's nasty since no easy fix, much less
> >>>>>    a good idea what's the best approach here.
> >>>> Do you have a pointer to that discussion or any more details?
> >>> Essentially if you're handling an hmm page fault from the gpu, you can
> >>> deadlock by calling dma_fence_wait on a (chain of, possibly) other command
> >>> submissions or compute contexts with dma_fence_wait. Which deadlocks if
> >>> you can't preempt while you have that page fault pending. Two solutions:
> >>>
> >>> - your hw can (at least for compute ctx) preempt even when a page fault is
> >>>   pending
> >> Our GFXv9 GPUs can do this. GFXv10 cannot.
> > Uh, why did your hw guys drop this :-/
> >
> >>> - lots of screaming in trying to come up with an alternate solution. They
> >>>   all suck.
> >> My idea for GFXv10 is to avoid preemption for memory management purposes
> >> and rely 100% on page faults instead. That is, if the memory manager
> >> needs to prevent GPU access to certain memory, just invalidate the GPU
> >> page table entries pointing to that memory. No waiting for fences is
> >> necessary, except for the SDMA job that invalidates the PTEs, which runs
> >> on a special high-priority queue that should never deadlock. That should
> >> prevent the CPU getting involved in deadlocks in kernel mode. But you
> >> can still deadlock the GPU in user mode if all compute units get stuck
> >> in page faults and can't switch to any useful work any more. So it's
> >> possible that we won't be able to use GPU page faults on our GFXv10 GPUs.
> > This only works if _everything_ in the system works like this, since
> > you're defacto breaking the cross-driver contract. As soon as there's
> > some legacy gl workload (userptr) or another driver involved, this
> > approach falls apart.
>
> I think the scenario you have in mind involves a dma_fence that depends
> on the resolution of a GPU page fault. With our user mode command
> submission model for compute contexts, there are no DMA fences that get
> signaled by compute jobs that could get stuck on page faults.
>
> The legacy GL workload would not get GPU page faults. The only way it
> could get stuck is, if all CUs are stuck on page faults and the command
> processor can't find any HW resources to execute it on. That's my user
> mode deadlock scenario below. So yeah, you're right, kernel mode can't
> avoid getting involved in that unless everything uses user mode command
> submissions.
>
> If (big if) we switched to user mode command submission for all compute
> and graphics contexts, and no longer use DMA fences to signal their
> completion, I think that would solve the problem as far as the kernel is
> concerned.

We can't throw dma_fence away because it's uapi built into various
compositor protocols. Otherwise we could pull a wddm2 like microsoft
did on windows and do what you're describing. So completely getting
rid of dma_fences (even just limited on newer gpus) is also a decadel
effort at least, since that's roughly how long it'll take to sunset
and convert everything over.

The other problem is that we're now building more stuff on top of
dma_resv like the dynamic dma-buf p2p stuff, now integrated into rdma.
I think even internally in the kernel it would be a massive pain to
untangle our fencing sufficiently to make this all happen without
loops. And I'm not even sure whether we could prevent deadlocks by
splitting dma_fence up into the userspace sync parts and the kernel
internal sync parts since they leak into each another.

> > I do think it can be rescued with what I call gang scheduling of
> > engines: I.e. when a given engine is running a context (or a group of
> > engines, depending how your hw works) that can cause a page fault, you
> > must flush out all workloads running on the same engine which could
> > block a dma_fence (preempt them, or for non-compute stuff, force their
> > completion). And the other way round, i.e. before you can run a legacy
> > gl workload with a dma_fence on these engines you need to preempt all
> > ctxs that could cause page faults and take them at least out of the hw
> > scheduler queue.
>
> Yuck! But yeah, that would work. A less invasive alternative would be to
> reserve some compute units for graphics contexts so we can guarantee
> forward progress for graphics contexts even when all CUs working on
> compute stuff are stuck on page faults.

Won't this hurt compute workloads? I think we need something were at
least pure compute or pure gl/vk workloads run at full performance.
And without preempt we can't take anything back when we need it, so
would have to always upfront reserve some cores just in case.

> > Just reserving an sdma engine for copy jobs and ptes updates and that
> > stuff is necessary, but not sufficient.
> >
> > Another approach that Jerome suggested is to track the reverse
> > dependency graph of all dma_fence somehow and make sure that direct
> > reclaim never recurses on an engine you're serving a pagefault for.
> > Possible in theory, but in practice I think not feasible to implement
> > because way too much work to implement.
>
> I agree.
>
>
> >
> > Either way it's imo really nasty to come up with a scheme here that
> > doesn't fail in some corner, or becomes really nasty with inconsistent
> > rules across different drivers and hw :-(
>
> Yeah. The cleanest approach is to avoid DMA fences altogether for
> device/engines that can get stuck on page faults. A user mode command
> submission model would do that.
>
> Reserving some compute units for graphics contexts that signal fences
> but never page fault should also work.

The trouble is you don't just need engines, you need compute
resources/cores behind them too (assuming I'm understading correctly
how this works on amd hw). Otherwise you end up with a gl context that
should complete to resolve the deadlock, but can't because it can't
run it's shader because all the shader cores are stuck in compute page
faults somewhere. Hence the gang scheduling would need to be at a
level were you can guarantee full isolation of hw resources, either
because you can preempt stuck compute kernels and let gl shaders run,
or because of hw core partitiion or something else. If you cant, you
need to gang schedule the entire gpu.

I think in practice that's not too ugly since for pure compute
workloads you're not going to have a desktop running most likely. And
for developer machines we should be able to push the occasional gfx
update through the gpu still without causing too much stutter on the
desktop or costing too much perf on the compute side. And pure gl/vk
or pure compute workloads should keep running at full performance.
-Daniel



>
> Regards,
>   Felix
>
>
> >
> > Cheers, Daniel
> >
> >> Regards,
> >>   Felix
> >>
> >>> Note that the dma_fence_wait is hard requirement, because we need that for
> >>> mmu notifiers and shrinkers, disallowing that would disable dynamic memory
> >>> management. Which is the current "ttm is self-limited to 50% of system
> >>> memory" limitation Christian is trying to lift. So that's really not
> >>> a restriction we can lift, at least not in upstream where we need to also
> >>> support old style hardware which doesn't have page fault support and
> >>> really has no other option to handle memory management than
> >>> dma_fence_wait.
> >>>
> >>> Thread was here:
> >>>
> >>> https://lore.kernel.org/dri-devel/CAKMK7uGgoeF8LmFBwWh5mW1k4xWjuUh3hdSFpVH1NBM7K0=edA@mail.gmail.com/
> >>>
> >>> There's a few ways to resolve this (without having preempt-capable
> >>> hardware), but they're all supremely nasty.
> >>> -Daniel
> >>>
> >>>> Thanks,
> >>>>   Felix
> >>>>
> >>>>
> >>>>> I'll try to look at this more in-depth when I'm catching up on mails.
> >>>>> -Daniel
> >>>>>
> >>>>>> Alex Sierra (12):
> >>>>>>   drm/amdgpu: replace per_device_list by array
> >>>>>>   drm/amdkfd: helper to convert gpu id and idx
> >>>>>>   drm/amdkfd: add xnack enabled flag to kfd_process
> >>>>>>   drm/amdkfd: add ioctl to configure and query xnack retries
> >>>>>>   drm/amdkfd: invalidate tables on page retry fault
> >>>>>>   drm/amdkfd: page table restore through svm API
> >>>>>>   drm/amdkfd: SVM API call to restore page tables
> >>>>>>   drm/amdkfd: add svm_bo reference for eviction fence
> >>>>>>   drm/amdgpu: add param bit flag to create SVM BOs
> >>>>>>   drm/amdkfd: add svm_bo eviction mechanism support
> >>>>>>   drm/amdgpu: svm bo enable_signal call condition
> >>>>>>   drm/amdgpu: add svm_bo eviction to enable_signal cb
> >>>>>>
> >>>>>> Philip Yang (23):
> >>>>>>   drm/amdkfd: select kernel DEVICE_PRIVATE option
> >>>>>>   drm/amdkfd: add svm ioctl API
> >>>>>>   drm/amdkfd: Add SVM API support capability bits
> >>>>>>   drm/amdkfd: register svm range
> >>>>>>   drm/amdkfd: add svm ioctl GET_ATTR op
> >>>>>>   drm/amdgpu: add common HMM get pages function
> >>>>>>   drm/amdkfd: validate svm range system memory
> >>>>>>   drm/amdkfd: register overlap system memory range
> >>>>>>   drm/amdkfd: deregister svm range
> >>>>>>   drm/amdgpu: export vm update mapping interface
> >>>>>>   drm/amdkfd: map svm range to GPUs
> >>>>>>   drm/amdkfd: svm range eviction and restore
> >>>>>>   drm/amdkfd: register HMM device private zone
> >>>>>>   drm/amdkfd: validate vram svm range from TTM
> >>>>>>   drm/amdkfd: support xgmi same hive mapping
> >>>>>>   drm/amdkfd: copy memory through gart table
> >>>>>>   drm/amdkfd: HMM migrate ram to vram
> >>>>>>   drm/amdkfd: HMM migrate vram to ram
> >>>>>>   drm/amdgpu: reserve fence slot to update page table
> >>>>>>   drm/amdgpu: enable retry fault wptr overflow
> >>>>>>   drm/amdkfd: refine migration policy with xnack on
> >>>>>>   drm/amdkfd: add svm range validate timestamp
> >>>>>>   drm/amdkfd: multiple gpu migrate vram to vram
> >>>>>>
> >>>>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c    |    3 +
> >>>>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |    4 +-
> >>>>>>  .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c  |   16 +-
> >>>>>>  .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |   13 +-
> >>>>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c        |   83 +
> >>>>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_mn.h        |    7 +
> >>>>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.h    |    5 +
> >>>>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |   90 +-
> >>>>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |   47 +-
> >>>>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |   10 +
> >>>>>>  drivers/gpu/drm/amd/amdgpu/vega10_ih.c        |   32 +-
> >>>>>>  drivers/gpu/drm/amd/amdgpu/vega20_ih.c        |   32 +-
> >>>>>>  drivers/gpu/drm/amd/amdkfd/Kconfig            |    1 +
> >>>>>>  drivers/gpu/drm/amd/amdkfd/Makefile           |    4 +-
> >>>>>>  drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  170 +-
> >>>>>>  drivers/gpu/drm/amd/amdkfd/kfd_iommu.c        |    8 +-
> >>>>>>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c      |  866 ++++++
> >>>>>>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.h      |   59 +
> >>>>>>  drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |   52 +-
> >>>>>>  drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  200 +-
> >>>>>>  .../amd/amdkfd/kfd_process_queue_manager.c    |    6 +-
> >>>>>>  drivers/gpu/drm/amd/amdkfd/kfd_svm.c          | 2564 +++++++++++++++++
> >>>>>>  drivers/gpu/drm/amd/amdkfd/kfd_svm.h          |  135 +
> >>>>>>  drivers/gpu/drm/amd/amdkfd/kfd_topology.c     |    1 +
> >>>>>>  drivers/gpu/drm/amd/amdkfd/kfd_topology.h     |   10 +-
> >>>>>>  include/uapi/linux/kfd_ioctl.h                |  169 +-
> >>>>>>  26 files changed, 4296 insertions(+), 291 deletions(-)
> >>>>>>  create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> >>>>>>  create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
> >>>>>>  create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> >>>>>>  create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_svm.h
> >>>>>>
> >>>>>> --
> >>>>>> 2.29.2
> >>>>>>
> >>>>>> _______________________________________________
> >>>>>> dri-devel mailing list
> >>>>>> dri-devel@lists.freedesktop.org
> >>>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >
> >



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
