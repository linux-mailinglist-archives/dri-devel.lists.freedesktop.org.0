Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6F02FCD1E
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jan 2021 10:05:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D6E89823;
	Wed, 20 Jan 2021 09:05:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E57C989993
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 09:05:04 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id c124so2109432wma.5
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 01:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=i4nqYNmBtc+ZihQZqVRLoQMrxMqI2N0HIeOSWshZ7jc=;
 b=U/ppbP6Nu6vLLKyyFl+NzyzWY7RFIHWDpf4tH5fP6rKIXH5IuYUKKTXb0NbEQYbeDR
 sCexJmPX8usTA1XxyVIArUqlwsdHlhOtm/oqHpSOG9HhI/kJhzc0DGHLTpnlNhDTxHHN
 X2OFXYnuC95OyjXTQrpU4sUmd3t/mIoIfhqro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=i4nqYNmBtc+ZihQZqVRLoQMrxMqI2N0HIeOSWshZ7jc=;
 b=gbO8gEmzEOOE7BO1qPTfztqREOPVOztRD95PklV3ERT3+YiEOHSmzPVtK2onbGMnzJ
 JicTgmKAI7R7APucYtSllLpMtMWgzOwjB0eoE7psO6FIND3b+I3280eiSrNTRumNgxhZ
 j9B3cq0hchu7/0bw8c9I8Dur9abLyplNCaGa2gO3++STBInPETSlfxJbjlPqrs14VrIe
 1GPgul93uMv5LxzKu85E+LWc7i9xz1fCfUDfTCeZMcrtXoDm26L1ApwO8xyE3+VsRmUD
 Fj6yVUc+AU+d7q49kczffpLYZ08rfohvhiI1bQ3FIz4wACRQ6UOsWTVpiz/6iIkKRkpR
 CnJw==
X-Gm-Message-State: AOAM5300dhGXPSswpZhoI7qL7tFtPSarJXhbbbiJmrif6A/TlzPhOjRV
 iqm1JUSYDNFhJE5XR08JPrcn3g==
X-Google-Smtp-Source: ABdhPJzaoAIDcoN9osllhZVE9DZkeWRMi/QvJrh/Np3HvHw9pC3hjBkgYkl1A5tTR8/i5lND5RkBCw==
X-Received: by 2002:a7b:c319:: with SMTP id k25mr3376185wmj.142.1611133503519; 
 Wed, 20 Jan 2021 01:05:03 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r10sm2688648wmd.15.2021.01.20.01.05.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 01:05:02 -0800 (PST)
Date: Wed, 20 Jan 2021 10:05:00 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Subject: Re: [PATCH v4 00/14] RFC Support hot device unplug in amdgpu
Message-ID: <YAfyPEB2gpMnW/PP@phenom.ffwll.local>
References: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
 <YAbpxbTifiupYJML@phenom.ffwll.local>
 <c4f911dc-99a9-387c-21d1-a3ca2cfd78da@amd.com>
 <CAKMK7uFKMgKAQSCgunjStuUTbuiwdR3zjwtn_Ms1XJjO0ML2EA@mail.gmail.com>
 <755e7c8a-5bd7-6414-8141-249a1ba5a865@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <755e7c8a-5bd7-6414-8141-249a1ba5a865@amd.com>
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
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>, Alex Deucher <Alexander.Deucher@amd.com>,
 Qiang Yu <yuq825@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 19, 2021 at 01:18:15PM -0500, Andrey Grodzovsky wrote:
> 
> On 1/19/21 1:08 PM, Daniel Vetter wrote:
> > On Tue, Jan 19, 2021 at 6:31 PM Andrey Grodzovsky
> > <Andrey.Grodzovsky@amd.com> wrote:
> > > 
> > > On 1/19/21 9:16 AM, Daniel Vetter wrote:
> > > > On Mon, Jan 18, 2021 at 04:01:09PM -0500, Andrey Grodzovsky wrote:
> > > > > Until now extracting a card either by physical extraction (e.g. eGPU with
> > > > > thunderbolt connection or by emulation through  syfs -> /sys/bus/pci/devices/device_id/remove)
> > > > > would cause random crashes in user apps. The random crashes in apps were
> > > > > mostly due to the app having mapped a device backed BO into its address
> > > > > space was still trying to access the BO while the backing device was gone.
> > > > > To answer this first problem Christian suggested to fix the handling of mapped
> > > > > memory in the clients when the device goes away by forcibly unmap all buffers the
> > > > > user processes has by clearing their respective VMAs mapping the device BOs.
> > > > > Then when the VMAs try to fill in the page tables again we check in the fault
> > > > > handlerif the device is removed and if so, return an error. This will generate a
> > > > > SIGBUS to the application which can then cleanly terminate.This indeed was done
> > > > > but this in turn created a problem of kernel OOPs were the OOPSes were due to the
> > > > > fact that while the app was terminating because of the SIGBUSit would trigger use
> > > > > after free in the driver by calling to accesses device structures that were already
> > > > > released from the pci remove sequence.This was handled by introducing a 'flush'
> > > > > sequence during device removal were we wait for drm file reference to drop to 0
> > > > > meaning all user clients directly using this device terminated.
> > > > > 
> > > > > v2:
> > > > > Based on discussions in the mailing list with Daniel and Pekka [1] and based on the document
> > > > > produced by Pekka from those discussions [2] the whole approach with returning SIGBUS and
> > > > > waiting for all user clients having CPU mapping of device BOs to die was dropped.
> > > > > Instead as per the document suggestion the device structures are kept alive until
> > > > > the last reference to the device is dropped by user client and in the meanwhile all existing and new CPU mappings of the BOs
> > > > > belonging to the device directly or by dma-buf import are rerouted to per user
> > > > > process dummy rw page.Also, I skipped the 'Requirements for KMS UAPI' section of [2]
> > > > > since i am trying to get the minimal set of requirements that still give useful solution
> > > > > to work and this is the'Requirements for Render and Cross-Device UAPI' section and so my
> > > > > test case is removing a secondary device, which is render only and is not involved
> > > > > in KMS.
> > > > > 
> > > > > v3:
> > > > > More updates following comments from v2 such as removing loop to find DRM file when rerouting
> > > > > page faults to dummy page,getting rid of unnecessary sysfs handling refactoring and moving
> > > > > prevention of GPU recovery post device unplug from amdgpu to scheduler layer.
> > > > > On top of that added unplug support for the IOMMU enabled system.
> > > > > 
> > > > > v4:
> > > > > Drop last sysfs hack and use sysfs default attribute.
> > > > > Guard against write accesses after device removal to avoid modifying released memory.
> > > > > Update dummy pages handling to on demand allocation and release through drm managed framework.
> > > > > Add return value to scheduler job TO handler (by Luben Tuikov) and use this in amdgpu for prevention
> > > > > of GPU recovery post device unplug
> > > > > Also rebase on top of drm-misc-mext instead of amd-staging-drm-next
> > > > > 
> > > > > With these patches I am able to gracefully remove the secondary card using sysfs remove hook while glxgears
> > > > > is running off of secondary card (DRI_PRIME=1) without kernel oopses or hangs and keep working
> > > > > with the primary card or soft reset the device without hangs or oopses
> > > > > 
> > > > > TODOs for followup work:
> > > > > Convert AMDGPU code to use devm (for hw stuff) and drmm (for sw stuff and allocations) (Daniel)
> > > > > Support plugging the secondary device back after unplug - currently still experiencing HW error on plugging back.
> > > > > Add support for 'Requirements for KMS UAPI' section of [2] - unplugging primary, display connected card.
> > > > > 
> > > > > [1] - Discussions during v3 of the patchset https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.spinics.net%2Flists%2Famd-gfx%2Fmsg55576.html&amp;data=04%7C01%7CAndrey.Grodzovsky%40amd.com%7C9055ea164ca14a0cbce108d8bca53d37%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637466765176719365%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=AqqeqmhF%2BZ1%2BRwMgtpmfoW1gtEnLGxiy3U5OMm%2BBqk8%3D&amp;reserved=0
> > > > > [2] - drm/doc: device hot-unplug for userspace https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.spinics.net%2Flists%2Fdri-devel%2Fmsg259755.html&amp;data=04%7C01%7CAndrey.Grodzovsky%40amd.com%7C9055ea164ca14a0cbce108d8bca53d37%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637466765176719365%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=oHHyRtTMTNQAnkzptG0B8%2FeeniU1z2DSca8L4yCYJcE%3D&amp;reserved=0
> > > > > [3] - Related gitlab ticket https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Famd%2F-%2Fissues%2F1081&amp;data=04%7C01%7CAndrey.Grodzovsky%40amd.com%7C9055ea164ca14a0cbce108d8bca53d37%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637466765176719365%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=inKlV%2F5QIPw%2BhHvLM46X27%2Fcjr%2FXyhxmrC0xYXBhHuE%3D&amp;reserved=0
> > > > btw have you tried this out with some of the igts we have? core_hotunplug
> > > > is the one I'm thinking of. Might be worth to extend this for amdgpu
> > > > specific stuff (like run some batches on it while hotunplugging).
> > > No, I mostly used just running glxgears while testing which covers already
> > > exported/imported dma-buf case and a few manually hacked tests in libdrm amdgpu
> > > test suite
> > > 
> > > 
> > > > Since there's so many corner cases we need to test here (shared dma-buf,
> > > > shared dma_fence) I think it would make sense to have a shared testcase
> > > > across drivers.
> > > 
> > > Not familiar with IGT too much, is there an easy way to setup shared dma bufs
> > > and fences
> > > use cases there or you mean I need to add them now ?
> > We do have test infrastructure for all of that, but the hotunplug test
> > doesn't have that yet I think.
> > 
> > > > Only specific thing would be some hooks to keep the gpu
> > > > busy in some fashion while we yank the driver.
> > > 
> > > Do you mean like staring X and some active rendering on top (like glxgears)
> > > automatically from within IGT ?
> > Nope, igt is meant to be bare metal testing so you don't have to drag
> > the entire winsys around (which in a wayland world, is not really good
> > for driver testing anyway, since everything is different). We use this
> > for our pre-merge ci for drm/i915.
> 
> 
> So i keep it busy by X/glxgers which is manual operation. What you suggest
> then is some client within IGT which opens the device and starts submitting jobs
> (which is much like what libdrm amdgpu tests already do) ? And this
> part is the amdgou specific code I just need to port from libdrm to here ?

Yup. For i915 tests we have an entire library already for small workloads,
including some that just spin forever (useful for reset testing and could
also come handy for unload testing).
-Daniel

> 
> Andrey
> 
> 
> > 
> > > > But just to get it started
> > > > you can throw in entirely amdgpu specific subtests and just share some of
> > > > the test code.
> > > > -Daniel
> > > 
> > > Im general, I wasn't aware of this test suite and looks like it does what i test
> > > among other stuff.
> > > I will definitely  try to run with it although the rescan part will not work as
> > > plugging
> > > the device back is in my TODO list and not part of the scope for this patchset
> > > and so I will
> > > probably comment the re-scan section out while testing.
> > amd gem has been using libdrm-amd thus far iirc, but for things like
> > this I think it'd be worth to at least consider switching. Display
> > team has already started to use some of the test and contribute stuff
> > (I think the VRR testcase is from amd).
> > -Daniel
> > 
> > > Andrey
> > > 
> > > 
> > > > > Andrey Grodzovsky (13):
> > > > >     drm/ttm: Remap all page faults to per process dummy page.
> > > > >     drm: Unamp the entire device address space on device unplug
> > > > >     drm/ttm: Expose ttm_tt_unpopulate for driver use
> > > > >     drm/sched: Cancel and flush all oustatdning jobs before finish.
> > > > >     drm/amdgpu: Split amdgpu_device_fini into early and late
> > > > >     drm/amdgpu: Add early fini callback
> > > > >     drm/amdgpu: Register IOMMU topology notifier per device.
> > > > >     drm/amdgpu: Fix a bunch of sdma code crash post device unplug
> > > > >     drm/amdgpu: Remap all page faults to per process dummy page.
> > > > >     dmr/amdgpu: Move some sysfs attrs creation to default_attr
> > > > >     drm/amdgpu: Guard against write accesses after device removal
> > > > >     drm/sched: Make timeout timer rearm conditional.
> > > > >     drm/amdgpu: Prevent any job recoveries after device is unplugged.
> > > > > 
> > > > > Luben Tuikov (1):
> > > > >     drm/scheduler: Job timeout handler returns status
> > > > > 
> > > > >    drivers/gpu/drm/amd/amdgpu/amdgpu.h               |  11 +-
> > > > >    drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c      |  17 +--
> > > > >    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c        | 149 ++++++++++++++++++++--
> > > > >    drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c           |  20 ++-
> > > > >    drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c         |  15 ++-
> > > > >    drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c          |   2 +-
> > > > >    drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h          |   1 +
> > > > >    drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c           |   9 ++
> > > > >    drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c       |  25 ++--
> > > > >    drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c           |  26 ++--
> > > > >    drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h           |   3 +-
> > > > >    drivers/gpu/drm/amd/amdgpu/amdgpu_job.c           |  19 ++-
> > > > >    drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c           |  12 +-
> > > > >    drivers/gpu/drm/amd/amdgpu/amdgpu_object.c        |  10 ++
> > > > >    drivers/gpu/drm/amd/amdgpu/amdgpu_object.h        |   2 +
> > > > >    drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c           |  53 +++++---
> > > > >    drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h           |   3 +
> > > > >    drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c           |   1 +
> > > > >    drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c          |  70 ++++++++++
> > > > >    drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h          |  52 +-------
> > > > >    drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c           |  21 ++-
> > > > >    drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c            |   8 +-
> > > > >    drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c      |  14 +-
> > > > >    drivers/gpu/drm/amd/amdgpu/cik_ih.c               |   2 +-
> > > > >    drivers/gpu/drm/amd/amdgpu/cz_ih.c                |   2 +-
> > > > >    drivers/gpu/drm/amd/amdgpu/iceland_ih.c           |   2 +-
> > > > >    drivers/gpu/drm/amd/amdgpu/navi10_ih.c            |   2 +-
> > > > >    drivers/gpu/drm/amd/amdgpu/psp_v11_0.c            |  16 +--
> > > > >    drivers/gpu/drm/amd/amdgpu/psp_v12_0.c            |   8 +-
> > > > >    drivers/gpu/drm/amd/amdgpu/psp_v3_1.c             |   8 +-
> > > > >    drivers/gpu/drm/amd/amdgpu/si_ih.c                |   2 +-
> > > > >    drivers/gpu/drm/amd/amdgpu/tonga_ih.c             |   2 +-
> > > > >    drivers/gpu/drm/amd/amdgpu/vega10_ih.c            |   2 +-
> > > > >    drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  12 +-
> > > > >    drivers/gpu/drm/amd/include/amd_shared.h          |   2 +
> > > > >    drivers/gpu/drm/drm_drv.c                         |   3 +
> > > > >    drivers/gpu/drm/etnaviv/etnaviv_sched.c           |  10 +-
> > > > >    drivers/gpu/drm/lima/lima_sched.c                 |   4 +-
> > > > >    drivers/gpu/drm/panfrost/panfrost_job.c           |   9 +-
> > > > >    drivers/gpu/drm/scheduler/sched_main.c            |  18 ++-
> > > > >    drivers/gpu/drm/ttm/ttm_bo_vm.c                   |  82 +++++++++++-
> > > > >    drivers/gpu/drm/ttm/ttm_tt.c                      |   1 +
> > > > >    drivers/gpu/drm/v3d/v3d_sched.c                   |  32 ++---
> > > > >    include/drm/gpu_scheduler.h                       |  17 ++-
> > > > >    include/drm/ttm/ttm_bo_api.h                      |   2 +
> > > > >    45 files changed, 583 insertions(+), 198 deletions(-)
> > > > > 
> > > > > --
> > > > > 2.7.4
> > > > > 
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
