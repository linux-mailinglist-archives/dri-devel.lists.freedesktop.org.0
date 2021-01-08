Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F8A2EF573
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 17:07:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F5086E837;
	Fri,  8 Jan 2021 16:07:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D646E839
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 16:07:10 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id n42so10064607ota.12
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jan 2021 08:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rc87f5rcCCpjuKD9UzipTakrSFwOvXYCMJeaB8uYEFs=;
 b=Zj7vtsigcTGkdoFGJTyED5S0D7tY00PF2LLmHYRmqZdXjLvXrBI/xlZ76GoSJjps18
 7TQ2d1zNy9BcZTZ6uWfAmDIUjftb4WrcQGUKSoVfHSRYjdVAkmtvxmYU8hbuvG7rv5PF
 BG9s0wpRBQQolgFQmPfFvDXiMblGzLbuiDZnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rc87f5rcCCpjuKD9UzipTakrSFwOvXYCMJeaB8uYEFs=;
 b=EQy+3ykwBD2Sp3jRothpfF6ywETeKsXFntYXJk7j70jXxSfNxw3jOHtwczdRzED+Hy
 1fh10XVo8vmr+wTxBxVbpMHYEEMNEuU7kvxcX2O16ALyS2YvRigD/VBq3lmwyFBOtho2
 9qEwTxK0DNECpoZzZiymFziraXRyGJBsOHG/JIpyTEx7ds9BdC1KlYEWW+d8CvbndXnd
 XBfX28Xxe3NPMSDsWMhhX3+43Kl5dsjad4gEQZLnGchtd2AzRrcdz0qOdw5X24IryQzw
 ATtbK2Km+xn27RmVh7DsNQuE0VpOJ2HiQACFa7x3m47HlPPgdjekimqrffZXNClkEBra
 EDIQ==
X-Gm-Message-State: AOAM531cYlSqGrxDwZRtt1cv9FtKQMgYcAlruJ9ae0AJ4/8nU7tfKQHn
 qvV1OJOSw4LNBaCDhcDbEACYLw5v4x7VFLTF+KR2qg==
X-Google-Smtp-Source: ABdhPJycCpGcqWJUPmSgstMxIYVT6KYz20KQqoKOmH1P+VcKoApiRxZPodagCRld7keCSL9g98154hNSvnVyQNgHnBk=
X-Received: by 2002:a05:6830:1bef:: with SMTP id
 k15mr2993042otb.303.1610122029943; 
 Fri, 08 Jan 2021 08:07:09 -0800 (PST)
MIME-Version: 1.0
References: <20210107030127.20393-1-Felix.Kuehling@amd.com>
 <X/bTFWL3HYVc8LEF@phenom.ffwll.local>
 <6daf9ebc-507e-6e83-04dd-d7c5fc6998d6@amd.com>
 <X/hux3eX8Ywf61h7@phenom.ffwll.local>
 <ed44f9cf-a7fc-f02b-dfd7-26b14310bc79@amd.com>
In-Reply-To: <ed44f9cf-a7fc-f02b-dfd7-26b14310bc79@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 8 Jan 2021 17:06:58 +0100
Message-ID: <CAKMK7uF3GHAMuW2EL7TuX6b0TdVpkUB9wG4vOz_oMwCLL9K4BQ@mail.gmail.com>
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

On Fri, Jan 8, 2021 at 4:58 PM Felix Kuehling <felix.kuehling@amd.com> wrote:
>
> Am 2021-01-08 um 9:40 a.m. schrieb Daniel Vetter:
> > On Thu, Jan 07, 2021 at 11:25:41AM -0500, Felix Kuehling wrote:
> >> Am 2021-01-07 um 4:23 a.m. schrieb Daniel Vetter:
> >>> On Wed, Jan 06, 2021 at 10:00:52PM -0500, Felix Kuehling wrote:
> >>>> This is the first version of our HMM based shared virtual memory manager
> >>>> for KFD. There are still a number of known issues that we're working through
> >>>> (see below). This will likely lead to some pretty significant changes in
> >>>> MMU notifier handling and locking on the migration code paths. So don't
> >>>> get hung up on those details yet.
> >>>>
> >>>> But I think this is a good time to start getting feedback. We're pretty
> >>>> confident about the ioctl API, which is both simple and extensible for the
> >>>> future. (see patches 4,16) The user mode side of the API can be found here:
> >>>> https://github.com/RadeonOpenCompute/ROCT-Thunk-Interface/blob/fxkamd/hmm-wip/src/svm.c
> >>>>
> >>>> I'd also like another pair of eyes on how we're interfacing with the GPU VM
> >>>> code in amdgpu_vm.c (see patches 12,13), retry page fault handling (24,25),
> >>>> and some retry IRQ handling changes (32).
> >>>>
> >>>>
> >>>> Known issues:
> >>>> * won't work with IOMMU enabled, we need to dma_map all pages properly
> >>>> * still working on some race conditions and random bugs
> >>>> * performance is not great yet
> >>> Still catching up, but I think there's another one for your list:
> >>>
> >>>  * hmm gpu context preempt vs page fault handling. I've had a short
> >>>    discussion about this one with Christian before the holidays, and also
> >>>    some private chats with Jerome. It's nasty since no easy fix, much less
> >>>    a good idea what's the best approach here.
> >> Do you have a pointer to that discussion or any more details?
> > Essentially if you're handling an hmm page fault from the gpu, you can
> > deadlock by calling dma_fence_wait on a (chain of, possibly) other command
> > submissions or compute contexts with dma_fence_wait. Which deadlocks if
> > you can't preempt while you have that page fault pending. Two solutions:
> >
> > - your hw can (at least for compute ctx) preempt even when a page fault is
> >   pending
>
> Our GFXv9 GPUs can do this. GFXv10 cannot.

Uh, why did your hw guys drop this :-/

> > - lots of screaming in trying to come up with an alternate solution. They
> >   all suck.
>
> My idea for GFXv10 is to avoid preemption for memory management purposes
> and rely 100% on page faults instead. That is, if the memory manager
> needs to prevent GPU access to certain memory, just invalidate the GPU
> page table entries pointing to that memory. No waiting for fences is
> necessary, except for the SDMA job that invalidates the PTEs, which runs
> on a special high-priority queue that should never deadlock. That should
> prevent the CPU getting involved in deadlocks in kernel mode. But you
> can still deadlock the GPU in user mode if all compute units get stuck
> in page faults and can't switch to any useful work any more. So it's
> possible that we won't be able to use GPU page faults on our GFXv10 GPUs.

This only works if _everything_ in the system works like this, since
you're defacto breaking the cross-driver contract. As soon as there's
some legacy gl workload (userptr) or another driver involved, this
approach falls apart.

I do think it can be rescued with what I call gang scheduling of
engines: I.e. when a given engine is running a context (or a group of
engines, depending how your hw works) that can cause a page fault, you
must flush out all workloads running on the same engine which could
block a dma_fence (preempt them, or for non-compute stuff, force their
completion). And the other way round, i.e. before you can run a legacy
gl workload with a dma_fence on these engines you need to preempt all
ctxs that could cause page faults and take them at least out of the hw
scheduler queue.

Just reserving an sdma engine for copy jobs and ptes updates and that
stuff is necessary, but not sufficient.

Another approach that Jerome suggested is to track the reverse
dependency graph of all dma_fence somehow and make sure that direct
reclaim never recurses on an engine you're serving a pagefault for.
Possible in theory, but in practice I think not feasible to implement
because way too much work to implement.

Either way it's imo really nasty to come up with a scheme here that
doesn't fail in some corner, or becomes really nasty with inconsistent
rules across different drivers and hw :-(

Cheers, Daniel

>
> Regards,
>   Felix
>
> >
> > Note that the dma_fence_wait is hard requirement, because we need that for
> > mmu notifiers and shrinkers, disallowing that would disable dynamic memory
> > management. Which is the current "ttm is self-limited to 50% of system
> > memory" limitation Christian is trying to lift. So that's really not
> > a restriction we can lift, at least not in upstream where we need to also
> > support old style hardware which doesn't have page fault support and
> > really has no other option to handle memory management than
> > dma_fence_wait.
> >
> > Thread was here:
> >
> > https://lore.kernel.org/dri-devel/CAKMK7uGgoeF8LmFBwWh5mW1k4xWjuUh3hdSFpVH1NBM7K0=edA@mail.gmail.com/
> >
> > There's a few ways to resolve this (without having preempt-capable
> > hardware), but they're all supremely nasty.
> > -Daniel
> >
> >> Thanks,
> >>   Felix
> >>
> >>
> >>> I'll try to look at this more in-depth when I'm catching up on mails.
> >>> -Daniel
> >>>
> >>>> Alex Sierra (12):
> >>>>   drm/amdgpu: replace per_device_list by array
> >>>>   drm/amdkfd: helper to convert gpu id and idx
> >>>>   drm/amdkfd: add xnack enabled flag to kfd_process
> >>>>   drm/amdkfd: add ioctl to configure and query xnack retries
> >>>>   drm/amdkfd: invalidate tables on page retry fault
> >>>>   drm/amdkfd: page table restore through svm API
> >>>>   drm/amdkfd: SVM API call to restore page tables
> >>>>   drm/amdkfd: add svm_bo reference for eviction fence
> >>>>   drm/amdgpu: add param bit flag to create SVM BOs
> >>>>   drm/amdkfd: add svm_bo eviction mechanism support
> >>>>   drm/amdgpu: svm bo enable_signal call condition
> >>>>   drm/amdgpu: add svm_bo eviction to enable_signal cb
> >>>>
> >>>> Philip Yang (23):
> >>>>   drm/amdkfd: select kernel DEVICE_PRIVATE option
> >>>>   drm/amdkfd: add svm ioctl API
> >>>>   drm/amdkfd: Add SVM API support capability bits
> >>>>   drm/amdkfd: register svm range
> >>>>   drm/amdkfd: add svm ioctl GET_ATTR op
> >>>>   drm/amdgpu: add common HMM get pages function
> >>>>   drm/amdkfd: validate svm range system memory
> >>>>   drm/amdkfd: register overlap system memory range
> >>>>   drm/amdkfd: deregister svm range
> >>>>   drm/amdgpu: export vm update mapping interface
> >>>>   drm/amdkfd: map svm range to GPUs
> >>>>   drm/amdkfd: svm range eviction and restore
> >>>>   drm/amdkfd: register HMM device private zone
> >>>>   drm/amdkfd: validate vram svm range from TTM
> >>>>   drm/amdkfd: support xgmi same hive mapping
> >>>>   drm/amdkfd: copy memory through gart table
> >>>>   drm/amdkfd: HMM migrate ram to vram
> >>>>   drm/amdkfd: HMM migrate vram to ram
> >>>>   drm/amdgpu: reserve fence slot to update page table
> >>>>   drm/amdgpu: enable retry fault wptr overflow
> >>>>   drm/amdkfd: refine migration policy with xnack on
> >>>>   drm/amdkfd: add svm range validate timestamp
> >>>>   drm/amdkfd: multiple gpu migrate vram to vram
> >>>>
> >>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c    |    3 +
> >>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |    4 +-
> >>>>  .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c  |   16 +-
> >>>>  .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |   13 +-
> >>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c        |   83 +
> >>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_mn.h        |    7 +
> >>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.h    |    5 +
> >>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |   90 +-
> >>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |   47 +-
> >>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |   10 +
> >>>>  drivers/gpu/drm/amd/amdgpu/vega10_ih.c        |   32 +-
> >>>>  drivers/gpu/drm/amd/amdgpu/vega20_ih.c        |   32 +-
> >>>>  drivers/gpu/drm/amd/amdkfd/Kconfig            |    1 +
> >>>>  drivers/gpu/drm/amd/amdkfd/Makefile           |    4 +-
> >>>>  drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  170 +-
> >>>>  drivers/gpu/drm/amd/amdkfd/kfd_iommu.c        |    8 +-
> >>>>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c      |  866 ++++++
> >>>>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.h      |   59 +
> >>>>  drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |   52 +-
> >>>>  drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  200 +-
> >>>>  .../amd/amdkfd/kfd_process_queue_manager.c    |    6 +-
> >>>>  drivers/gpu/drm/amd/amdkfd/kfd_svm.c          | 2564 +++++++++++++++++
> >>>>  drivers/gpu/drm/amd/amdkfd/kfd_svm.h          |  135 +
> >>>>  drivers/gpu/drm/amd/amdkfd/kfd_topology.c     |    1 +
> >>>>  drivers/gpu/drm/amd/amdkfd/kfd_topology.h     |   10 +-
> >>>>  include/uapi/linux/kfd_ioctl.h                |  169 +-
> >>>>  26 files changed, 4296 insertions(+), 291 deletions(-)
> >>>>  create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> >>>>  create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
> >>>>  create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> >>>>  create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_svm.h
> >>>>
> >>>> --
> >>>> 2.29.2
> >>>>
> >>>> _______________________________________________
> >>>> dri-devel mailing list
> >>>> dri-devel@lists.freedesktop.org
> >>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
