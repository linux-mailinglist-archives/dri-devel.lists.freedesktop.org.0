Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9EE312B14
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 08:27:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9F346E1A2;
	Mon,  8 Feb 2021 07:27:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9072A6E1A2
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 07:27:26 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id y11so13331752otq.1
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Feb 2021 23:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=77SlRXY41EX7vM6z6jR6GpSnhsHC7SPgRUF9Om86vOY=;
 b=E87yPebh0295qU9obzFEum2c27XRV6XRuJXjri8/DNOlBom9vsRxVxI5l8uBPayZtp
 yw1gB2fsAKMrnBRYKnZjYs1KWm2y+41sff7gkM+U4uss4T5xTS53wrUCd3pHfziEivb4
 NWmZBOSdDeXwh/u3gdVc1oQHMJlR5lRea8PVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=77SlRXY41EX7vM6z6jR6GpSnhsHC7SPgRUF9Om86vOY=;
 b=n7NaBRbWaJKCPcHs7al/HpZj4zzzfwDWw5kT9+nzxsKu9F42ZNiaFD3OhMljvUVnH/
 O7ISkkxvIe5AWod2GYPhyy5WMEDlei+wN0hdM0CU2WvDfmugUNitzoDKLZIgIah6CguY
 vVrtNe+qWgWEMWLafRw5EP7sxGxZ+7M9XyEslMHj3aJbEhl1BWhKfWdGk/O+w3cU0eZJ
 43ASro4JaNs9IJMMh5JsrAT+fl408uXFn/XGwIld3Zjo3f3ZoEx2JqUNuY93R4njGc6I
 H0Ycs4RSk13DueAvpSw6t4fTPWN5iHHsaMMFwhFstqPacMA6fYIyS4r9+ReuKdKn6HvF
 MQXw==
X-Gm-Message-State: AOAM5310dmQzo4MB40FaQChkX//r7emVejhdRNQUHWnsPjk1uMwavlH8
 qKncU/+hzPMc67nQcSbWuG0JHsQX1aqWbnj7BuqKFA==
X-Google-Smtp-Source: ABdhPJwhdxE2oT7jOR2b0UQPA1aZ6FR1h2vImN4gmRCrZ4gF1E6wmL4XQCfBQeB9/bPEArm2zx9V+sbvIiTI62lBTgU=
X-Received: by 2002:a9d:b85:: with SMTP id 5mr12015674oth.281.1612769245674;
 Sun, 07 Feb 2021 23:27:25 -0800 (PST)
MIME-Version: 1.0
References: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
 <YAbpxbTifiupYJML@phenom.ffwll.local>
 <c4f911dc-99a9-387c-21d1-a3ca2cfd78da@amd.com>
 <CAKMK7uFKMgKAQSCgunjStuUTbuiwdR3zjwtn_Ms1XJjO0ML2EA@mail.gmail.com>
 <755e7c8a-5bd7-6414-8141-249a1ba5a865@amd.com>
 <YAfyPEB2gpMnW/PP@phenom.ffwll.local>
 <8ea4b2d7-d5f3-3708-724d-c70520603283@amd.com>
 <CAKMK7uE11MonjPB3dmy6u=b029am1p2KqJ57DgLUGu-9QgtebA@mail.gmail.com>
 <75e782f1-4cb9-9210-87d2-e7d2a76782f1@amd.com>
In-Reply-To: <75e782f1-4cb9-9210-87d2-e7d2a76782f1@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 8 Feb 2021 08:27:13 +0100
Message-ID: <CAKMK7uH=ycuBQ5qbujA8kwcrExAC4YAM26W-7wJjE7RS4zPiHw@mail.gmail.com>
Subject: Re: [PATCH v4 00/14] RFC Support hot device unplug in amdgpu
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Qiang Yu <yuq825@gmail.com>,
 Greg KH <gregkh@linuxfoundation.org>, Alex Deucher <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 8, 2021 at 6:59 AM Andrey Grodzovsky
<Andrey.Grodzovsky@amd.com> wrote:
>
>
> On 1/20/21 10:59 AM, Daniel Vetter wrote:
> > On Wed, Jan 20, 2021 at 3:20 PM Andrey Grodzovsky
> > <Andrey.Grodzovsky@amd.com> wrote:
> >>
> >> On 1/20/21 4:05 AM, Daniel Vetter wrote:
> >>> On Tue, Jan 19, 2021 at 01:18:15PM -0500, Andrey Grodzovsky wrote:
> >>>> On 1/19/21 1:08 PM, Daniel Vetter wrote:
> >>>>> On Tue, Jan 19, 2021 at 6:31 PM Andrey Grodzovsky
> >>>>> <Andrey.Grodzovsky@amd.com> wrote:
> >>>>>> On 1/19/21 9:16 AM, Daniel Vetter wrote:
> >>>>>>> On Mon, Jan 18, 2021 at 04:01:09PM -0500, Andrey Grodzovsky wrote:
> >>>>>>>> Until now extracting a card either by physical extraction (e.g. eGPU with
> >>>>>>>> thunderbolt connection or by emulation through  syfs -> /sys/bus/pci/devices/device_id/remove)
> >>>>>>>> would cause random crashes in user apps. The random crashes in apps were
> >>>>>>>> mostly due to the app having mapped a device backed BO into its address
> >>>>>>>> space was still trying to access the BO while the backing device was gone.
> >>>>>>>> To answer this first problem Christian suggested to fix the handling of mapped
> >>>>>>>> memory in the clients when the device goes away by forcibly unmap all buffers the
> >>>>>>>> user processes has by clearing their respective VMAs mapping the device BOs.
> >>>>>>>> Then when the VMAs try to fill in the page tables again we check in the fault
> >>>>>>>> handlerif the device is removed and if so, return an error. This will generate a
> >>>>>>>> SIGBUS to the application which can then cleanly terminate.This indeed was done
> >>>>>>>> but this in turn created a problem of kernel OOPs were the OOPSes were due to the
> >>>>>>>> fact that while the app was terminating because of the SIGBUSit would trigger use
> >>>>>>>> after free in the driver by calling to accesses device structures that were already
> >>>>>>>> released from the pci remove sequence.This was handled by introducing a 'flush'
> >>>>>>>> sequence during device removal were we wait for drm file reference to drop to 0
> >>>>>>>> meaning all user clients directly using this device terminated.
> >>>>>>>>
> >>>>>>>> v2:
> >>>>>>>> Based on discussions in the mailing list with Daniel and Pekka [1] and based on the document
> >>>>>>>> produced by Pekka from those discussions [2] the whole approach with returning SIGBUS and
> >>>>>>>> waiting for all user clients having CPU mapping of device BOs to die was dropped.
> >>>>>>>> Instead as per the document suggestion the device structures are kept alive until
> >>>>>>>> the last reference to the device is dropped by user client and in the meanwhile all existing and new CPU mappings of the BOs
> >>>>>>>> belonging to the device directly or by dma-buf import are rerouted to per user
> >>>>>>>> process dummy rw page.Also, I skipped the 'Requirements for KMS UAPI' section of [2]
> >>>>>>>> since i am trying to get the minimal set of requirements that still give useful solution
> >>>>>>>> to work and this is the'Requirements for Render and Cross-Device UAPI' section and so my
> >>>>>>>> test case is removing a secondary device, which is render only and is not involved
> >>>>>>>> in KMS.
> >>>>>>>>
> >>>>>>>> v3:
> >>>>>>>> More updates following comments from v2 such as removing loop to find DRM file when rerouting
> >>>>>>>> page faults to dummy page,getting rid of unnecessary sysfs handling refactoring and moving
> >>>>>>>> prevention of GPU recovery post device unplug from amdgpu to scheduler layer.
> >>>>>>>> On top of that added unplug support for the IOMMU enabled system.
> >>>>>>>>
> >>>>>>>> v4:
> >>>>>>>> Drop last sysfs hack and use sysfs default attribute.
> >>>>>>>> Guard against write accesses after device removal to avoid modifying released memory.
> >>>>>>>> Update dummy pages handling to on demand allocation and release through drm managed framework.
> >>>>>>>> Add return value to scheduler job TO handler (by Luben Tuikov) and use this in amdgpu for prevention
> >>>>>>>> of GPU recovery post device unplug
> >>>>>>>> Also rebase on top of drm-misc-mext instead of amd-staging-drm-next
> >>>>>>>>
> >>>>>>>> With these patches I am able to gracefully remove the secondary card using sysfs remove hook while glxgears
> >>>>>>>> is running off of secondary card (DRI_PRIME=1) without kernel oopses or hangs and keep working
> >>>>>>>> with the primary card or soft reset the device without hangs or oopses
> >>>>>>>>
> >>>>>>>> TODOs for followup work:
> >>>>>>>> Convert AMDGPU code to use devm (for hw stuff) and drmm (for sw stuff and allocations) (Daniel)
> >>>>>>>> Support plugging the secondary device back after unplug - currently still experiencing HW error on plugging back.
> >>>>>>>> Add support for 'Requirements for KMS UAPI' section of [2] - unplugging primary, display connected card.
> >>>>>>>>
> >>>>>>>> [1] - Discussions during v3 of the patchset https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.spinics.net%2Flists%2Famd-gfx%2Fmsg55576.html&amp;data=04%7C01%7CAndrey.Grodzovsky%40amd.com%7Cf3fc3c7b55df40e165f408d8bd5c7364%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637467552072067767%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=fjgP9YubHCrILFxWmpVGSmurTJHkWw%2Bv4okyjSNsPxE%3D&amp;reserved=0
> >>>>>>>> [2] - drm/doc: device hot-unplug for userspace https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.spinics.net%2Flists%2Fdri-devel%2Fmsg259755.html&amp;data=04%7C01%7CAndrey.Grodzovsky%40amd.com%7Cf3fc3c7b55df40e165f408d8bd5c7364%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637467552072067767%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=11PYyAhOjLDEiNNho8WaMB%2FLkA5AuxK6g9XpbNiPIec%3D&amp;reserved=0
> >>>>>>>> [3] - Related gitlab ticket https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Famd%2F-%2Fissues%2F1081&amp;data=04%7C01%7CAndrey.Grodzovsky%40amd.com%7Cf3fc3c7b55df40e165f408d8bd5c7364%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637467552072077759%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=q%2F%2FXDKm9LOgw9mq4Ts4JoHR8Ysd8KmoM0NGLD98MsFw%3D&amp;reserved=0
> >>>>>>> btw have you tried this out with some of the igts we have? core_hotunplug
> >>>>>>> is the one I'm thinking of. Might be worth to extend this for amdgpu
> >>>>>>> specific stuff (like run some batches on it while hotunplugging).
> >>>>>> No, I mostly used just running glxgears while testing which covers already
> >>>>>> exported/imported dma-buf case and a few manually hacked tests in libdrm amdgpu
> >>>>>> test suite
> >>>>>>
> >>>>>>
> >>>>>>> Since there's so many corner cases we need to test here (shared dma-buf,
> >>>>>>> shared dma_fence) I think it would make sense to have a shared testcase
> >>>>>>> across drivers.
> >>>>>> Not familiar with IGT too much, is there an easy way to setup shared dma bufs
> >>>>>> and fences
> >>>>>> use cases there or you mean I need to add them now ?
> >>>>> We do have test infrastructure for all of that, but the hotunplug test
> >>>>> doesn't have that yet I think.
> >>>>>
> >>>>>>> Only specific thing would be some hooks to keep the gpu
> >>>>>>> busy in some fashion while we yank the driver.
> >>>>>> Do you mean like staring X and some active rendering on top (like glxgears)
> >>>>>> automatically from within IGT ?
> >>>>> Nope, igt is meant to be bare metal testing so you don't have to drag
> >>>>> the entire winsys around (which in a wayland world, is not really good
> >>>>> for driver testing anyway, since everything is different). We use this
> >>>>> for our pre-merge ci for drm/i915.
> >>>> So i keep it busy by X/glxgers which is manual operation. What you suggest
> >>>> then is some client within IGT which opens the device and starts submitting jobs
> >>>> (which is much like what libdrm amdgpu tests already do) ? And this
> >>>> part is the amdgou specific code I just need to port from libdrm to here ?
> >>> Yup. For i915 tests we have an entire library already for small workloads,
> >>> including some that just spin forever (useful for reset testing and could
> >>> also come handy for unload testing).
> >>> -Daniel
> >>
> >> Does it mean I would have to drag in the entire infrastructure code from
> >> within libdrm amdgpu code that allows for command submissions through
> >> our IOCTLs ?
> > No it's perfectly fine to use libdrm in igt tests, we do that too. I
> > just mean we have some additional helpers to submit specific workloads
> > for intel gpu, like rendercpy to move data with the 3d engine (just
> > using copy engines only isn't good enough sometimes for testing), or
> > the special hanging batchbuffers we use for reset testing, or in
> > general for having precise control over race conditions and things
> > like that.
> >
> > One thing that was somewhat annoying for i915 but shouldn't be a
> > problem for amdgpu is that igt builds on intel. So we have stub
> > functions for libdrm-intel, since libdrm-intel doesn't build on arm.
> > Shouldn't be a problem for you.
> > -Daniel
>
>
> Tested with igt hot-unplug test. Passed unbind_rebind, unplug-rescan,
> hot-unbind-rebind and hotunplug-rescan
> if disabling the rescan part as I don't support plug-back for now. Also added
> command submission for amdgpu.
> Attached a draft of submitting workload while unbinding the driver or simulating
> detach. Catched 2 issues with unpug if command submission in flight  during
> unplug -
> (unsignaled fence causing a hang in amdgpu_cs_sync and hitting a BUG_ON in
> gfx_v9_0_ring_emit_patch_cond_exec whic is expected i guess).
> Guess glxgears command submissions is at a much slower rate so this was missed.
> Is that what you meant for this test ?

Yup. Would be good if you can submit this one for inclusion.
-Daniel

>
> Andrey
>
>
> >
> >
> >> Andrey
> >>
> >>>> Andrey
> >>>>
> >>>>
> >>>>>>> But just to get it started
> >>>>>>> you can throw in entirely amdgpu specific subtests and just share some of
> >>>>>>> the test code.
> >>>>>>> -Daniel
> >>>>>> Im general, I wasn't aware of this test suite and looks like it does what i test
> >>>>>> among other stuff.
> >>>>>> I will definitely  try to run with it although the rescan part will not work as
> >>>>>> plugging
> >>>>>> the device back is in my TODO list and not part of the scope for this patchset
> >>>>>> and so I will
> >>>>>> probably comment the re-scan section out while testing.
> >>>>> amd gem has been using libdrm-amd thus far iirc, but for things like
> >>>>> this I think it'd be worth to at least consider switching. Display
> >>>>> team has already started to use some of the test and contribute stuff
> >>>>> (I think the VRR testcase is from amd).
> >>>>> -Daniel
> >>>>>
> >>>>>> Andrey
> >>>>>>
> >>>>>>
> >>>>>>>> Andrey Grodzovsky (13):
> >>>>>>>>       drm/ttm: Remap all page faults to per process dummy page.
> >>>>>>>>       drm: Unamp the entire device address space on device unplug
> >>>>>>>>       drm/ttm: Expose ttm_tt_unpopulate for driver use
> >>>>>>>>       drm/sched: Cancel and flush all oustatdning jobs before finish.
> >>>>>>>>       drm/amdgpu: Split amdgpu_device_fini into early and late
> >>>>>>>>       drm/amdgpu: Add early fini callback
> >>>>>>>>       drm/amdgpu: Register IOMMU topology notifier per device.
> >>>>>>>>       drm/amdgpu: Fix a bunch of sdma code crash post device unplug
> >>>>>>>>       drm/amdgpu: Remap all page faults to per process dummy page.
> >>>>>>>>       dmr/amdgpu: Move some sysfs attrs creation to default_attr
> >>>>>>>>       drm/amdgpu: Guard against write accesses after device removal
> >>>>>>>>       drm/sched: Make timeout timer rearm conditional.
> >>>>>>>>       drm/amdgpu: Prevent any job recoveries after device is unplugged.
> >>>>>>>>
> >>>>>>>> Luben Tuikov (1):
> >>>>>>>>       drm/scheduler: Job timeout handler returns status
> >>>>>>>>
> >>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu.h               |  11 +-
> >>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c      |  17 +--
> >>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_device.c        | 149 ++++++++++++++++++++--
> >>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c           |  20 ++-
> >>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c         |  15 ++-
> >>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c          |   2 +-
> >>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h          |   1 +
> >>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c           |   9 ++
> >>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c       |  25 ++--
> >>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c           |  26 ++--
> >>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h           |   3 +-
> >>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_job.c           |  19 ++-
> >>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c           |  12 +-
> >>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_object.c        |  10 ++
> >>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_object.h        |   2 +
> >>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c           |  53 +++++---
> >>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h           |   3 +
> >>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c           |   1 +
> >>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c          |  70 ++++++++++
> >>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h          |  52 +-------
> >>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c           |  21 ++-
> >>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c            |   8 +-
> >>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c      |  14 +-
> >>>>>>>>      drivers/gpu/drm/amd/amdgpu/cik_ih.c               |   2 +-
> >>>>>>>>      drivers/gpu/drm/amd/amdgpu/cz_ih.c                |   2 +-
> >>>>>>>>      drivers/gpu/drm/amd/amdgpu/iceland_ih.c           |   2 +-
> >>>>>>>>      drivers/gpu/drm/amd/amdgpu/navi10_ih.c            |   2 +-
> >>>>>>>>      drivers/gpu/drm/amd/amdgpu/psp_v11_0.c            |  16 +--
> >>>>>>>>      drivers/gpu/drm/amd/amdgpu/psp_v12_0.c            |   8 +-
> >>>>>>>>      drivers/gpu/drm/amd/amdgpu/psp_v3_1.c             |   8 +-
> >>>>>>>>      drivers/gpu/drm/amd/amdgpu/si_ih.c                |   2 +-
> >>>>>>>>      drivers/gpu/drm/amd/amdgpu/tonga_ih.c             |   2 +-
> >>>>>>>>      drivers/gpu/drm/amd/amdgpu/vega10_ih.c            |   2 +-
> >>>>>>>>      drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  12 +-
> >>>>>>>>      drivers/gpu/drm/amd/include/amd_shared.h          |   2 +
> >>>>>>>>      drivers/gpu/drm/drm_drv.c                         |   3 +
> >>>>>>>>      drivers/gpu/drm/etnaviv/etnaviv_sched.c           |  10 +-
> >>>>>>>>      drivers/gpu/drm/lima/lima_sched.c                 |   4 +-
> >>>>>>>>      drivers/gpu/drm/panfrost/panfrost_job.c           |   9 +-
> >>>>>>>>      drivers/gpu/drm/scheduler/sched_main.c            |  18 ++-
> >>>>>>>>      drivers/gpu/drm/ttm/ttm_bo_vm.c                   |  82 +++++++++++-
> >>>>>>>>      drivers/gpu/drm/ttm/ttm_tt.c                      |   1 +
> >>>>>>>>      drivers/gpu/drm/v3d/v3d_sched.c                   |  32 ++---
> >>>>>>>>      include/drm/gpu_scheduler.h                       |  17 ++-
> >>>>>>>>      include/drm/ttm/ttm_bo_api.h                      |   2 +
> >>>>>>>>      45 files changed, 583 insertions(+), 198 deletions(-)
> >>>>>>>>
> >>>>>>>> --
> >>>>>>>> 2.7.4
> >>>>>>>>
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
