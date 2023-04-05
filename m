Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BAE6D7726
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 10:42:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBEED10E884;
	Wed,  5 Apr 2023 08:42:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12FBE10E885
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 08:42:39 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-4fd1f2a0f82so10908a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 01:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680684158; x=1683276158;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=PybsCHaHSdQO2YcpfIMauDlX9vmYDuGRTW/bhpsY2v4=;
 b=F6thy3Bys/uF9tihV/E+j0cst8BqfQDuKcSAEg4J/yitph5su7RzfRfY62NMhTHogD
 HXBE3QEs79Wmwk8Ir11JQmlHYjL0G52bAKZuSenAseD8BPP8NzgmojgGZHN+unLnVpDc
 Ue6pzTuDOIwiXFZ7lCCmJ4kdzeluJylSPgD0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680684158; x=1683276158;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PybsCHaHSdQO2YcpfIMauDlX9vmYDuGRTW/bhpsY2v4=;
 b=j3wRliqHSBVQDuhyYEfbum1Fd4U9wpR0dYajo9+uUS5wIQfRAM4St//rssjk84a+z6
 D80fxJatUf/HmSzq45dyRAbsI+hJIoMBLvIeE0CPRSIRmxNp/w2W7sl8Dhis4H64lcL7
 9/IWXVw4+yurmJqXtmX6sB4fcPxcaNjCzfEIHfeWTobyQuFSrVJ62ohJk4/Yg5jygI8q
 haPF+7jOG1fcuZJGB6HmoZZiarld4KD3YA7qj376LUYDfO3CQTTDjZe6ep4qH7uYVuhO
 FIh4XFAy3q5fChjain4QbRqLaqR5BnQxJR/68vz2QiamesRUITk/u9j6UqfeRfhGo0gP
 StKg==
X-Gm-Message-State: AAQBX9d/fc4WQa08zB+tZsD/s+8jfhoXl/isFM1mDEtgbq4LyO9HTvCh
 e6R55yPCoSvOfAJSgawgol9fDw==
X-Google-Smtp-Source: AKy350YvqIXn1K/AWUEJPcGXc5n+t5kVVPUS0bM7fwQCptSIAq5H8MD6Z0D+vIJ+pHiIImdaRmQzrQ==
X-Received: by 2002:a17:906:1d5:b0:949:148d:82bc with SMTP id
 21-20020a17090601d500b00949148d82bcmr1187671ejj.2.1680684158075; 
 Wed, 05 Apr 2023 01:42:38 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 r3-20020a170906350300b00930876176e2sm7016384eja.29.2023.04.05.01.42.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 01:42:37 -0700 (PDT)
Date: Wed, 5 Apr 2023 10:42:35 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [RFC PATCH 00/10] Xe DRM scheduler and long running workload plans
Message-ID: <ZC00eytNbbsh2q3B@phenom.ffwll.local>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <SA1PR11MB69913F0A0038DA307701D44092939@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ZCxnuCvmknUuLydM@DUT025-TGLU.fm.intel.com>
 <018b891d-ec31-b8c2-f987-45a204ed77ed@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <018b891d-ec31-b8c2-f987-45a204ed77ed@amd.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 "robdclark@chromium.org" <robdclark@chromium.org>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "lina@asahilina.net" <lina@asahilina.net>, "Zeng, Oak" <oak.zeng@intel.com>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 05, 2023 at 09:30:11AM +0200, Christian König wrote:
> Am 04.04.23 um 20:08 schrieb Matthew Brost:
> > On Tue, Apr 04, 2023 at 12:02:03PM -0600, Zeng, Oak wrote:
> > > Hi Matt, Thomas,
> > > 
> > > Some very bold out of box thinking in this area:
> > > 
> > > 1. so you want to use drm scheduler and dma-fence for long running workload. Why you want to do this in the first place? What is the benefit? Drm scheduler is pretty much a software scheduler. Modern gpu has scheduler built at fw/hw level, as you said below for intel this is Guc. Can xe driver just directly submit job to Guc, bypassing drm scheduler?
> > > 
> > If we did that now we have 2 paths for dependency track, flow controling
> > the ring, resets / error handling / backend submission implementations.
> > We don't want this.
> 
> Well exactly that's the point: Why?
> 
> As far as I can see that are two completely distinct use cases, so you
> absolutely do want two completely distinct implementations for this.
> 
> > > 2. using dma-fence for long run workload: I am well aware that page fault (and the consequent memory allocation/lock acquiring to fix the fault) can cause deadlock for a dma-fence wait. But I am not convinced that dma-fence can't be used purely because the nature of the workload that it runs very long (indefinite). I did a math: the dma_fence_wait_timeout function's third param is the timeout which is a signed long type. If HZ is 1000, this is about 23 days. If 23 days is not long enough, can we just change the timeout parameter to signed 64 bits so it is much longer than our life time...
> > > 
> > > So I mainly argue we can't use dma-fence for long-run workload is not because the workload runs very long, rather because of the fact that we use page fault for long-run workload. If we enable page fault for short-run workload, we can't use dma-fence either. Page fault is the key thing here.
> > > 
> > > Now since we use page fault which is *fundamentally* controversial with dma-fence design, why now just introduce a independent concept such as user-fence instead of extending existing dma-fence?
> > > 
> > > I like unified design. If drm scheduler, dma-fence can be extended to work for everything, it is beautiful. But seems we have some fundamental problem here.
> > > 
> > Thomas's patches turn a dma-fence into KMD sync point (e.g. we just use
> > the signal / CB infrastructure) and enforce we don't use use these
> > dma-fences from the scheduler in memory reclaim paths or export these to
> > user space or other drivers. Think of this mode as SW only fence.
> 
> Yeah and I truly think this is an really bad idea.
> 
> The signal/CB infrastructure in the dma_fence turned out to be the
> absolutely nightmare I initially predicted. Sorry to say that, but in this
> case the "I've told you so" is appropriate in my opinion.
> 
> If we need infrastructure for long running dependency tracking we should
> encapsulate that in a new framework and not try to mangle the existing code
> for something it was never intended for.

Concurring hard (already typed that up somewhere else). I'd go one step
further and ask whether the kernel really has to handle dependencies for
these long-running compute jobs. The entire design with userspace memory
fences assumes that this is userspace's job.

Also for drm_syncobj we've also pushed a lot of the dependency handling to
userspace, with submit threads in mesa. So if there is any blocking to be
done (running out of ring space), why can't we sort that out the same way?
Meaning:
1. superfast direct-to-hw submit path (using doorbells or whatever)
2. submit ioctl which only succeds if it doesn't have to do any userspace
memory fence waits, otherwise you get EWOULDBLOCK
3. userspace sorts out the mess in a submit thread if it gets an
EWOULDBLOCK, because fundamentally the kernel cannot guarantee a
bottomless queue. If userspace wants bottomless, they need to handle the
allocating and delaying imo

You can even make 3 entirely as-needed, which means for the usual
fast-path you'll never see the userspace thread created unless you do hit
an EWOULDBLOCK.

If we insist that the kernel handles the long-running dependencies fully
then all we end up doing is implementing step 3, but entirely in the
kernel instead of userspace. And in the kernel every bug gets you halfway
to a CVE, and I just don't think that makes much sense for something which
is the fallback of the fallback - once you run out of ring space you're
not going to have a great day not matter what.

I'd go as far and say if we want step 3 in the kernel someone needs to
supply the real-world (i.e. real application running real workloads, not
some microbenchmark) benchmark to proof it's actually worth the pain.
Otherwise on-demand userspace submit thread.
-Daniel

> 
> Christian.
> 
> > 
> > Matt
> > > Thanks,
> > > Oak
> > > 
> > > > -----Original Message-----
> > > > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
> > > > Matthew Brost
> > > > Sent: April 3, 2023 8:22 PM
> > > > To: dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> > > > Cc: robdclark@chromium.org; thomas.hellstrom@linux.intel.com; airlied@linux.ie;
> > > > lina@asahilina.net; boris.brezillon@collabora.com; Brost, Matthew
> > > > <matthew.brost@intel.com>; christian.koenig@amd.com;
> > > > faith.ekstrand@collabora.com
> > > > Subject: [RFC PATCH 00/10] Xe DRM scheduler and long running workload plans
> > > > 
> > > > Hello,
> > > > 
> > > > As a prerequisite to merging the new Intel Xe DRM driver [1] [2], we
> > > > have been asked to merge our common DRM scheduler patches first as well
> > > > as develop a common solution for long running workloads with the DRM
> > > > scheduler. This RFC series is our first attempt at doing this. We
> > > > welcome any and all feedback.
> > > > 
> > > > This can we thought of as 4 parts detailed below.
> > > > 
> > > > - DRM scheduler changes for 1 to 1 relationship between scheduler and
> > > > entity (patches 1-3)
> > > > 
> > > > In Xe all of the scheduling of jobs is done by a firmware scheduler (the
> > > > GuC) which is a new paradigm WRT to the DRM scheduler and presents
> > > > severals problems as the DRM was originally designed to schedule jobs on
> > > > hardware queues. The main problem being that DRM scheduler expects the
> > > > submission order of jobs to be the completion order of jobs even across
> > > > multiple entities. This assumption falls apart with a firmware scheduler
> > > > as a firmware scheduler has no concept of jobs and jobs can complete out
> > > > of order. A novel solution for was originally thought of by Faith during
> > > > the initial prototype of Xe, create a 1 to 1 relationship between scheduler
> > > > and entity. I believe the AGX driver [3] is using this approach and
> > > > Boris may use approach as well for the Mali driver [4].
> > > > 
> > > > To support a 1 to 1 relationship we move the main execution function
> > > > from a kthread to a work queue and add a new scheduling mode which
> > > > bypasses code in the DRM which isn't needed in a 1 to 1 relationship.
> > > > The new scheduling mode should unify all drivers usage with a 1 to 1
> > > > relationship and can be thought of as using scheduler as a dependency /
> > > > infligt job tracker rather than a true scheduler.
> > > > 
> > > > - Generic messaging interface for DRM scheduler
> > > > 
> > > > Idea is to be able to communicate to the submission backend with in band
> > > > (relative to main execution function) messages. Messages are backend
> > > > defined and flexable enough for any use case. In Xe we use these
> > > > messages to clean up entites, set properties for entites, and suspend /
> > > > resume execution of an entity [5]. I suspect other driver can leverage
> > > > this messaging concept too as it a convenient way to avoid races in the
> > > > backend.
> > > > 
> > > > - Support for using TDR for all error paths of a scheduler / entity
> > > > 
> > > > Fix a few races / bugs, add function to dynamically set the TDR timeout.
> > > > 
> > > > - Annotate dma-fences for long running workloads.
> > > > 
> > > > The idea here is to use dma-fences only as sync points within the
> > > > scheduler and never export them for long running workloads. By
> > > > annotating these fences as long running we ensure that these dma-fences
> > > > are never used in a way that breaks the dma-fence rules. A benefit of
> > > > thus approach is the scheduler can still safely flow control the
> > > > execution ring buffer via the job limit without breaking the dma-fence
> > > > rules.
> > > > 
> > > > Again this a first draft and looking forward to feedback.
> > > > 
> > > > Enjoy - Matt
> > > > 
> > > > [1] https://gitlab.freedesktop.org/drm/xe/kernel
> > > > [2] https://patchwork.freedesktop.org/series/112188/
> > > > [3] https://patchwork.freedesktop.org/series/114772/
> > > > [4] https://patchwork.freedesktop.org/patch/515854/?series=112188&rev=1
> > > > [5] https://gitlab.freedesktop.org/drm/xe/kernel/-/blob/drm-xe-
> > > > next/drivers/gpu/drm/xe/xe_guc_submit.c#L1031
> > > > 
> > > > Matthew Brost (8):
> > > >    drm/sched: Convert drm scheduler to use a work queue rather than
> > > >      kthread
> > > >    drm/sched: Move schedule policy to scheduler / entity
> > > >    drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
> > > >    drm/sched: Add generic scheduler message interface
> > > >    drm/sched: Start run wq before TDR in drm_sched_start
> > > >    drm/sched: Submit job before starting TDR
> > > >    drm/sched: Add helper to set TDR timeout
> > > >    drm/syncobj: Warn on long running dma-fences
> > > > 
> > > > Thomas Hellström (2):
> > > >    dma-buf/dma-fence: Introduce long-running completion fences
> > > >    drm/sched: Support long-running sched entities
> > > > 
> > > >   drivers/dma-buf/dma-fence.c                 | 142 +++++++---
> > > >   drivers/dma-buf/dma-resv.c                  |   5 +
> > > >   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  14 +-
> > > >   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |  15 +-
> > > >   drivers/gpu/drm/drm_syncobj.c               |   5 +-
> > > >   drivers/gpu/drm/etnaviv/etnaviv_sched.c     |   5 +-
> > > >   drivers/gpu/drm/lima/lima_sched.c           |   5 +-
> > > >   drivers/gpu/drm/msm/adreno/adreno_device.c  |   6 +-
> > > >   drivers/gpu/drm/msm/msm_ringbuffer.c        |   5 +-
> > > >   drivers/gpu/drm/panfrost/panfrost_job.c     |   5 +-
> > > >   drivers/gpu/drm/scheduler/sched_entity.c    | 127 +++++++--
> > > >   drivers/gpu/drm/scheduler/sched_fence.c     |   6 +-
> > > >   drivers/gpu/drm/scheduler/sched_main.c      | 278 +++++++++++++++-----
> > > >   drivers/gpu/drm/v3d/v3d_sched.c             |  25 +-
> > > >   include/drm/gpu_scheduler.h                 | 130 +++++++--
> > > >   include/linux/dma-fence.h                   |  60 ++++-
> > > >   16 files changed, 649 insertions(+), 184 deletions(-)
> > > > 
> > > > --
> > > > 2.34.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
