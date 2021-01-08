Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A559D2EF411
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 15:40:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 491E86E1FB;
	Fri,  8 Jan 2021 14:40:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4142D6E157
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 14:40:11 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id d13so9185999wrc.13
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jan 2021 06:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=pQQvT3gm3Vv0z6URrJr7P0zwZf5Kr1NC+GWRws2mRNQ=;
 b=OJhx8GVx63K0RrotDkQ3VXqQ1SCmQOaFAD9OVUuFIKEzrCFq2k4lyktbikT7xipcUX
 zEZoJ+hjgfD1e6eAXNuIzUc5Ab+KO5GtscxoRlPCOkRkgAziHWS6GhkXqXhJRnzhKpA4
 F50RLY5Fd1kFNyJ6PkcmbHF7aQzj3l+gKkfnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=pQQvT3gm3Vv0z6URrJr7P0zwZf5Kr1NC+GWRws2mRNQ=;
 b=iJKgz2CBj2cRSIIOzfE+tsUzBgptx89gIM3m0stIj3spwHjOSmVgMoGrlwKI2yqOYN
 2NTekQrKMF0wBteqrk//HAnWUO1rT4rK9LChSjfbfiaH6ZBBQKTolWh0ZPrYxMPcFLlx
 Mp1nIUwFht0dYxl7/LHqMly4A6VwTPxYY1Ev0fhvUrSoiktVK2yqVel/PZICOdJkfs6h
 yisyGdlfirC32LPYCdEVa/viHc3m1KtWUJZs4VgR4owSS4xgRaZU4BePxHx2HSe5Pdzq
 uOm3cr3tNtLidc739Y94sXp7XkserajeuThqR63BtiMcrHKnbEmA3O6Iicn0tDFwSisb
 /Iuw==
X-Gm-Message-State: AOAM531QSi0P/RrE4Hj5fXBDtQ5JjT9Jkdl8uGcptSdXryAYIFG0SK4a
 JvFCi2dMdhn63h3WvqiUO3eCHg==
X-Google-Smtp-Source: ABdhPJwuZ+YW4wcVDLXdHHGma/r3xMTXDs4w5I3TDHYkH7O6Z5fIZRUPo58VLfZzQbvwU70mZfAl8Q==
X-Received: by 2002:adf:8145:: with SMTP id 63mr3886416wrm.8.1610116809925;
 Fri, 08 Jan 2021 06:40:09 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s25sm14325786wrs.49.2021.01.08.06.40.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 06:40:09 -0800 (PST)
Date: Fri, 8 Jan 2021 15:40:07 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Felix Kuehling <felix.kuehling@amd.com>
Subject: Re: [PATCH 00/35] Add HMM-based SVM memory manager to KFD
Message-ID: <X/hux3eX8Ywf61h7@phenom.ffwll.local>
References: <20210107030127.20393-1-Felix.Kuehling@amd.com>
 <X/bTFWL3HYVc8LEF@phenom.ffwll.local>
 <6daf9ebc-507e-6e83-04dd-d7c5fc6998d6@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6daf9ebc-507e-6e83-04dd-d7c5fc6998d6@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: alex.sierra@amd.com, philip.yang@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 07, 2021 at 11:25:41AM -0500, Felix Kuehling wrote:
> Am 2021-01-07 um 4:23 a.m. schrieb Daniel Vetter:
> > On Wed, Jan 06, 2021 at 10:00:52PM -0500, Felix Kuehling wrote:
> >> This is the first version of our HMM based shared virtual memory manag=
er
> >> for KFD. There are still a number of known issues that we're working t=
hrough
> >> (see below). This will likely lead to some pretty significant changes =
in
> >> MMU notifier handling and locking on the migration code paths. So don't
> >> get hung up on those details yet.
> >>
> >> But I think this is a good time to start getting feedback. We're pretty
> >> confident about the ioctl API, which is both simple and extensible for=
 the
> >> future. (see patches 4,16) The user mode side of the API can be found =
here:
> >> https://github.com/RadeonOpenCompute/ROCT-Thunk-Interface/blob/fxkamd/=
hmm-wip/src/svm.c
> >>
> >> I'd also like another pair of eyes on how we're interfacing with the G=
PU VM
> >> code in amdgpu_vm.c (see patches 12,13), retry page fault handling (24=
,25),
> >> and some retry IRQ handling changes (32).
> >>
> >>
> >> Known issues:
> >> * won't work with IOMMU enabled, we need to dma_map all pages properly
> >> * still working on some race conditions and random bugs
> >> * performance is not great yet
> > Still catching up, but I think there's another one for your list:
> >
> >  * hmm gpu context preempt vs page fault handling. I've had a short
> >    discussion about this one with Christian before the holidays, and al=
so
> >    some private chats with Jerome. It's nasty since no easy fix, much l=
ess
> >    a good idea what's the best approach here.
> =

> Do you have a pointer to that discussion or any more details?

Essentially if you're handling an hmm page fault from the gpu, you can
deadlock by calling dma_fence_wait on a (chain of, possibly) other command
submissions or compute contexts with dma_fence_wait. Which deadlocks if
you can't preempt while you have that page fault pending. Two solutions:

- your hw can (at least for compute ctx) preempt even when a page fault is
  pending

- lots of screaming in trying to come up with an alternate solution. They
  all suck.

Note that the dma_fence_wait is hard requirement, because we need that for
mmu notifiers and shrinkers, disallowing that would disable dynamic memory
management. Which is the current "ttm is self-limited to 50% of system
memory" limitation Christian is trying to lift. So that's really not
a restriction we can lift, at least not in upstream where we need to also
support old style hardware which doesn't have page fault support and
really has no other option to handle memory management than
dma_fence_wait.

Thread was here:

https://lore.kernel.org/dri-devel/CAKMK7uGgoeF8LmFBwWh5mW1k4xWjuUh3hdSFpVH1=
NBM7K0=3DedA@mail.gmail.com/

There's a few ways to resolve this (without having preempt-capable
hardware), but they're all supremely nasty.
-Daniel

> =

> Thanks,
> =A0 Felix
> =

> =

> >
> > I'll try to look at this more in-depth when I'm catching up on mails.
> > -Daniel
> >
> >> Alex Sierra (12):
> >>   drm/amdgpu: replace per_device_list by array
> >>   drm/amdkfd: helper to convert gpu id and idx
> >>   drm/amdkfd: add xnack enabled flag to kfd_process
> >>   drm/amdkfd: add ioctl to configure and query xnack retries
> >>   drm/amdkfd: invalidate tables on page retry fault
> >>   drm/amdkfd: page table restore through svm API
> >>   drm/amdkfd: SVM API call to restore page tables
> >>   drm/amdkfd: add svm_bo reference for eviction fence
> >>   drm/amdgpu: add param bit flag to create SVM BOs
> >>   drm/amdkfd: add svm_bo eviction mechanism support
> >>   drm/amdgpu: svm bo enable_signal call condition
> >>   drm/amdgpu: add svm_bo eviction to enable_signal cb
> >>
> >> Philip Yang (23):
> >>   drm/amdkfd: select kernel DEVICE_PRIVATE option
> >>   drm/amdkfd: add svm ioctl API
> >>   drm/amdkfd: Add SVM API support capability bits
> >>   drm/amdkfd: register svm range
> >>   drm/amdkfd: add svm ioctl GET_ATTR op
> >>   drm/amdgpu: add common HMM get pages function
> >>   drm/amdkfd: validate svm range system memory
> >>   drm/amdkfd: register overlap system memory range
> >>   drm/amdkfd: deregister svm range
> >>   drm/amdgpu: export vm update mapping interface
> >>   drm/amdkfd: map svm range to GPUs
> >>   drm/amdkfd: svm range eviction and restore
> >>   drm/amdkfd: register HMM device private zone
> >>   drm/amdkfd: validate vram svm range from TTM
> >>   drm/amdkfd: support xgmi same hive mapping
> >>   drm/amdkfd: copy memory through gart table
> >>   drm/amdkfd: HMM migrate ram to vram
> >>   drm/amdkfd: HMM migrate vram to ram
> >>   drm/amdgpu: reserve fence slot to update page table
> >>   drm/amdgpu: enable retry fault wptr overflow
> >>   drm/amdkfd: refine migration policy with xnack on
> >>   drm/amdkfd: add svm range validate timestamp
> >>   drm/amdkfd: multiple gpu migrate vram to vram
> >>
> >>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c    |    3 +
> >>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |    4 +-
> >>  .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c  |   16 +-
> >>  .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |   13 +-
> >>  drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c        |   83 +
> >>  drivers/gpu/drm/amd/amdgpu/amdgpu_mn.h        |    7 +
> >>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.h    |    5 +
> >>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |   90 +-
> >>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |   47 +-
> >>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |   10 +
> >>  drivers/gpu/drm/amd/amdgpu/vega10_ih.c        |   32 +-
> >>  drivers/gpu/drm/amd/amdgpu/vega20_ih.c        |   32 +-
> >>  drivers/gpu/drm/amd/amdkfd/Kconfig            |    1 +
> >>  drivers/gpu/drm/amd/amdkfd/Makefile           |    4 +-
> >>  drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  170 +-
> >>  drivers/gpu/drm/amd/amdkfd/kfd_iommu.c        |    8 +-
> >>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c      |  866 ++++++
> >>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.h      |   59 +
> >>  drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |   52 +-
> >>  drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  200 +-
> >>  .../amd/amdkfd/kfd_process_queue_manager.c    |    6 +-
> >>  drivers/gpu/drm/amd/amdkfd/kfd_svm.c          | 2564 +++++++++++++++++
> >>  drivers/gpu/drm/amd/amdkfd/kfd_svm.h          |  135 +
> >>  drivers/gpu/drm/amd/amdkfd/kfd_topology.c     |    1 +
> >>  drivers/gpu/drm/amd/amdkfd/kfd_topology.h     |   10 +-
> >>  include/uapi/linux/kfd_ioctl.h                |  169 +-
> >>  26 files changed, 4296 insertions(+), 291 deletions(-)
> >>  create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> >>  create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
> >>  create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> >>  create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_svm.h
> >>
> >> -- =

> >> 2.29.2
> >>
> >> _______________________________________________
> >> dri-devel mailing list
> >> dri-devel@lists.freedesktop.org
> >> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
