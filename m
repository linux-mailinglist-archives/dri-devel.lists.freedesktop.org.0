Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FB82FBE8C
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 19:08:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E410897F3;
	Tue, 19 Jan 2021 18:08:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 895D98920D
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 18:08:35 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id x13so20657773oto.8
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 10:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XLeHfF66siRv2kyP04Uj40JdcBQRFT+WLY0vuagzd2Y=;
 b=CSgODeVUQZkwLXh27ppo7vzJe2TNNJ4sGCKreXEOschCuB+o1Fqrrc1NBtYM1hAhfB
 dUFfQfV3eIAZ+Pf6RIP+OKWfY8zQfY6MBxHqN+Ei1AsdkwhwpiYP6/PEQUwl3cp8Wome
 wGMv/X9l+t9UwXseaHTBFgrK2ZPtAGh9ZelKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XLeHfF66siRv2kyP04Uj40JdcBQRFT+WLY0vuagzd2Y=;
 b=Rt8iYMo20oWR0o2ard9X0xxu0iXbTb9kqi+zx5e0ZaVvlaL+/71BAHibydw4HxkOnU
 a4ZFyXrW1bvjowK7vLnSSe4N4LvrFP55oc+0W3zV4ywJWSjBj0WbmwsbgboZekBGttLU
 b28w2ghNAUsgwJik2xm6J8ecBpRHO4VK7/CNO4/63jIme8D2Ns0JwG5FNZhENlSzFZ8R
 heRipwwFgMqVhpj4pfR7pu1X8nGiVt7JaP2b8iBmwyVY29qz+Rmm6PpEwZWFCX8FCWjW
 OdEmUApz/LRPSFA+7dYI41hzLnvyELPlZSYPzu7az8qjPoiKygRmtXgHh6nYGViliQ/b
 oKOA==
X-Gm-Message-State: AOAM5305yxfw4WWbGo6sewZpkve6M4nt/m0l7ITwdT2Aiz41++/cmVlY
 J7sFSmUGal1O4t0uDL4GSoUIq00cqfyDPAQjhPlMtJc/exE=
X-Google-Smtp-Source: ABdhPJy87Ef+cLQxOSlaSDAa90IFlR0yDGe78415hOj6Xvs8DumAddRWdpGtdkXLFPdmkcAL2xcHLc23dQi3zd2j6W8=
X-Received: by 2002:a9d:ea6:: with SMTP id 35mr4306878otj.188.1611079714817;
 Tue, 19 Jan 2021 10:08:34 -0800 (PST)
MIME-Version: 1.0
References: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
 <YAbpxbTifiupYJML@phenom.ffwll.local>
 <c4f911dc-99a9-387c-21d1-a3ca2cfd78da@amd.com>
In-Reply-To: <c4f911dc-99a9-387c-21d1-a3ca2cfd78da@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 19 Jan 2021 19:08:23 +0100
Message-ID: <CAKMK7uFKMgKAQSCgunjStuUTbuiwdR3zjwtn_Ms1XJjO0ML2EA@mail.gmail.com>
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

On Tue, Jan 19, 2021 at 6:31 PM Andrey Grodzovsky
<Andrey.Grodzovsky@amd.com> wrote:
>
>
> On 1/19/21 9:16 AM, Daniel Vetter wrote:
> > On Mon, Jan 18, 2021 at 04:01:09PM -0500, Andrey Grodzovsky wrote:
> >> Until now extracting a card either by physical extraction (e.g. eGPU with
> >> thunderbolt connection or by emulation through  syfs -> /sys/bus/pci/devices/device_id/remove)
> >> would cause random crashes in user apps. The random crashes in apps were
> >> mostly due to the app having mapped a device backed BO into its address
> >> space was still trying to access the BO while the backing device was gone.
> >> To answer this first problem Christian suggested to fix the handling of mapped
> >> memory in the clients when the device goes away by forcibly unmap all buffers the
> >> user processes has by clearing their respective VMAs mapping the device BOs.
> >> Then when the VMAs try to fill in the page tables again we check in the fault
> >> handlerif the device is removed and if so, return an error. This will generate a
> >> SIGBUS to the application which can then cleanly terminate.This indeed was done
> >> but this in turn created a problem of kernel OOPs were the OOPSes were due to the
> >> fact that while the app was terminating because of the SIGBUSit would trigger use
> >> after free in the driver by calling to accesses device structures that were already
> >> released from the pci remove sequence.This was handled by introducing a 'flush'
> >> sequence during device removal were we wait for drm file reference to drop to 0
> >> meaning all user clients directly using this device terminated.
> >>
> >> v2:
> >> Based on discussions in the mailing list with Daniel and Pekka [1] and based on the document
> >> produced by Pekka from those discussions [2] the whole approach with returning SIGBUS and
> >> waiting for all user clients having CPU mapping of device BOs to die was dropped.
> >> Instead as per the document suggestion the device structures are kept alive until
> >> the last reference to the device is dropped by user client and in the meanwhile all existing and new CPU mappings of the BOs
> >> belonging to the device directly or by dma-buf import are rerouted to per user
> >> process dummy rw page.Also, I skipped the 'Requirements for KMS UAPI' section of [2]
> >> since i am trying to get the minimal set of requirements that still give useful solution
> >> to work and this is the'Requirements for Render and Cross-Device UAPI' section and so my
> >> test case is removing a secondary device, which is render only and is not involved
> >> in KMS.
> >>
> >> v3:
> >> More updates following comments from v2 such as removing loop to find DRM file when rerouting
> >> page faults to dummy page,getting rid of unnecessary sysfs handling refactoring and moving
> >> prevention of GPU recovery post device unplug from amdgpu to scheduler layer.
> >> On top of that added unplug support for the IOMMU enabled system.
> >>
> >> v4:
> >> Drop last sysfs hack and use sysfs default attribute.
> >> Guard against write accesses after device removal to avoid modifying released memory.
> >> Update dummy pages handling to on demand allocation and release through drm managed framework.
> >> Add return value to scheduler job TO handler (by Luben Tuikov) and use this in amdgpu for prevention
> >> of GPU recovery post device unplug
> >> Also rebase on top of drm-misc-mext instead of amd-staging-drm-next
> >>
> >> With these patches I am able to gracefully remove the secondary card using sysfs remove hook while glxgears
> >> is running off of secondary card (DRI_PRIME=1) without kernel oopses or hangs and keep working
> >> with the primary card or soft reset the device without hangs or oopses
> >>
> >> TODOs for followup work:
> >> Convert AMDGPU code to use devm (for hw stuff) and drmm (for sw stuff and allocations) (Daniel)
> >> Support plugging the secondary device back after unplug - currently still experiencing HW error on plugging back.
> >> Add support for 'Requirements for KMS UAPI' section of [2] - unplugging primary, display connected card.
> >>
> >> [1] - Discussions during v3 of the patchset https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.spinics.net%2Flists%2Famd-gfx%2Fmsg55576.html&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7C4b12f8caf53645eaf0c608d8bc84d7fa%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637466626035281917%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=E73dK7r1OBt1T9UcSt6kYbxYk9LL22EgizbpvkjfZ0c%3D&amp;reserved=0
> >> [2] - drm/doc: device hot-unplug for userspace https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.spinics.net%2Flists%2Fdri-devel%2Fmsg259755.html&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7C4b12f8caf53645eaf0c608d8bc84d7fa%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637466626035291908%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=EAzrOrNd14IA6gjjCVi9mAQJQZbcrFQbRNC3bN9gVQc%3D&amp;reserved=0
> >> [3] - Related gitlab ticket https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Famd%2F-%2Fissues%2F1081&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7C4b12f8caf53645eaf0c608d8bc84d7fa%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637466626035291908%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=Pmd1WS79YGhU65XNsLtz9s3B6Oc1Dq%2FG4v2t1QDYrFQ%3D&amp;reserved=0
> > btw have you tried this out with some of the igts we have? core_hotunplug
> > is the one I'm thinking of. Might be worth to extend this for amdgpu
> > specific stuff (like run some batches on it while hotunplugging).
>
> No, I mostly used just running glxgears while testing which covers already
> exported/imported dma-buf case and a few manually hacked tests in libdrm amdgpu
> test suite
>
>
> >
> > Since there's so many corner cases we need to test here (shared dma-buf,
> > shared dma_fence) I think it would make sense to have a shared testcase
> > across drivers.
>
>
> Not familiar with IGT too much, is there an easy way to setup shared dma bufs
> and fences
> use cases there or you mean I need to add them now ?

We do have test infrastructure for all of that, but the hotunplug test
doesn't have that yet I think.

> > Only specific thing would be some hooks to keep the gpu
> > busy in some fashion while we yank the driver.
>
>
> Do you mean like staring X and some active rendering on top (like glxgears)
> automatically from within IGT ?

Nope, igt is meant to be bare metal testing so you don't have to drag
the entire winsys around (which in a wayland world, is not really good
for driver testing anyway, since everything is different). We use this
for our pre-merge ci for drm/i915.

> > But just to get it started
> > you can throw in entirely amdgpu specific subtests and just share some of
> > the test code.
> > -Daniel
>
>
> Im general, I wasn't aware of this test suite and looks like it does what i test
> among other stuff.
> I will definitely  try to run with it although the rescan part will not work as
> plugging
> the device back is in my TODO list and not part of the scope for this patchset
> and so I will
> probably comment the re-scan section out while testing.

amd gem has been using libdrm-amd thus far iirc, but for things like
this I think it'd be worth to at least consider switching. Display
team has already started to use some of the test and contribute stuff
(I think the VRR testcase is from amd).
-Daniel

>
> Andrey
>
>
> >
> >> Andrey Grodzovsky (13):
> >>    drm/ttm: Remap all page faults to per process dummy page.
> >>    drm: Unamp the entire device address space on device unplug
> >>    drm/ttm: Expose ttm_tt_unpopulate for driver use
> >>    drm/sched: Cancel and flush all oustatdning jobs before finish.
> >>    drm/amdgpu: Split amdgpu_device_fini into early and late
> >>    drm/amdgpu: Add early fini callback
> >>    drm/amdgpu: Register IOMMU topology notifier per device.
> >>    drm/amdgpu: Fix a bunch of sdma code crash post device unplug
> >>    drm/amdgpu: Remap all page faults to per process dummy page.
> >>    dmr/amdgpu: Move some sysfs attrs creation to default_attr
> >>    drm/amdgpu: Guard against write accesses after device removal
> >>    drm/sched: Make timeout timer rearm conditional.
> >>    drm/amdgpu: Prevent any job recoveries after device is unplugged.
> >>
> >> Luben Tuikov (1):
> >>    drm/scheduler: Job timeout handler returns status
> >>
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu.h               |  11 +-
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c      |  17 +--
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c        | 149 ++++++++++++++++++++--
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c           |  20 ++-
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c         |  15 ++-
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c          |   2 +-
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h          |   1 +
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c           |   9 ++
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c       |  25 ++--
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c           |  26 ++--
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h           |   3 +-
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c           |  19 ++-
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c           |  12 +-
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c        |  10 ++
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h        |   2 +
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c           |  53 +++++---
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h           |   3 +
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c           |   1 +
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c          |  70 ++++++++++
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h          |  52 +-------
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c           |  21 ++-
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c            |   8 +-
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c      |  14 +-
> >>   drivers/gpu/drm/amd/amdgpu/cik_ih.c               |   2 +-
> >>   drivers/gpu/drm/amd/amdgpu/cz_ih.c                |   2 +-
> >>   drivers/gpu/drm/amd/amdgpu/iceland_ih.c           |   2 +-
> >>   drivers/gpu/drm/amd/amdgpu/navi10_ih.c            |   2 +-
> >>   drivers/gpu/drm/amd/amdgpu/psp_v11_0.c            |  16 +--
> >>   drivers/gpu/drm/amd/amdgpu/psp_v12_0.c            |   8 +-
> >>   drivers/gpu/drm/amd/amdgpu/psp_v3_1.c             |   8 +-
> >>   drivers/gpu/drm/amd/amdgpu/si_ih.c                |   2 +-
> >>   drivers/gpu/drm/amd/amdgpu/tonga_ih.c             |   2 +-
> >>   drivers/gpu/drm/amd/amdgpu/vega10_ih.c            |   2 +-
> >>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  12 +-
> >>   drivers/gpu/drm/amd/include/amd_shared.h          |   2 +
> >>   drivers/gpu/drm/drm_drv.c                         |   3 +
> >>   drivers/gpu/drm/etnaviv/etnaviv_sched.c           |  10 +-
> >>   drivers/gpu/drm/lima/lima_sched.c                 |   4 +-
> >>   drivers/gpu/drm/panfrost/panfrost_job.c           |   9 +-
> >>   drivers/gpu/drm/scheduler/sched_main.c            |  18 ++-
> >>   drivers/gpu/drm/ttm/ttm_bo_vm.c                   |  82 +++++++++++-
> >>   drivers/gpu/drm/ttm/ttm_tt.c                      |   1 +
> >>   drivers/gpu/drm/v3d/v3d_sched.c                   |  32 ++---
> >>   include/drm/gpu_scheduler.h                       |  17 ++-
> >>   include/drm/ttm/ttm_bo_api.h                      |   2 +
> >>   45 files changed, 583 insertions(+), 198 deletions(-)
> >>
> >> --
> >> 2.7.4
> >>



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
