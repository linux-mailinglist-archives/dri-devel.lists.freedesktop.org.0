Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C03736282
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 06:05:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3E8310E254;
	Tue, 20 Jun 2023 04:05:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E602C10E171;
 Tue, 20 Jun 2023 04:05:48 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-986d871a9beso543592966b.1; 
 Mon, 19 Jun 2023 21:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687233945; x=1689825945;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nm07gp91z67yPaALmSjYb88FFAKhVI+8hZk5Prh28Fs=;
 b=kAgePDIpzh0aog05Un30bBD7p1QWD0FQeyvk0nloNgxLvqPrcy+e4UN4YAJQUq+zlF
 K2FhBM5DT5HH22ViU038bM3deTX3elSbg4zxCP+yzFkcgAXVLuh33vGDST81htWe3m5T
 iP5qlOHjuRCZ/itzw+y4yboQVZgcllboMddOAt98MB2CBBUNpdUMCdG/t8lSvmbzR8eL
 kcUYbPzhJhTmLeZ0JTui9AxfsXMwcpp0apR9sOC3qpnNKKJRpWg7tnJC9ZqcGxxAM7xF
 YilZPTPte+wVYbKnSGqehfInjVG63c3euT6nccL/J95mZGS48Mc2YnWTjmJhO5oC/Lz0
 3DMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687233945; x=1689825945;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nm07gp91z67yPaALmSjYb88FFAKhVI+8hZk5Prh28Fs=;
 b=e5Cl3UXsrPrCM7fMvy4eptCGQ/hWlHVH7AXk2i+t4lVxT5WFbDHoGDc/jmxvvLFvas
 HWNaTenqVF8Yg+j1065z4IPFduSDBxcEEGoOs+Y1SgPfv1e/NA4OU+pU3k68jFxWm2M/
 kjKGSso3PAIN6TCignNFbILfMJ1vhqtmAu5ME3+ezQdp2ii42Mfx9YEe1obVrTskpGnw
 MzKsJv2x59/pFUnnrJSqndJS1C0wTLyBOZuECyc62de1r913Iz1jkiiy5hi4WI8tmSox
 eVyDeILtiTljuW+MpM7+pZu014vEh5FhWy6VY6L5bSlXZ1t3RvcYp7NgWAPjYqokRDCa
 47zg==
X-Gm-Message-State: AC+VfDzS3E/8phdg5z5lJ0T2iuZpizGA7CuwWD6Yj1Wafeq6QxM8inqu
 rlCEwl+hwaIHVPVGpLnMNWXciwrlFhhqXaYDFKs=
X-Google-Smtp-Source: ACHHUZ4cbELwdYCslrEvaIJg8Kf5eH+KI25uU+mc3xiEzFnDaXrsOCkCY+dAXOj9Y3spwUsAigTz+P7pAEpN26UcG2Q=
X-Received: by 2002:a17:906:9748:b0:989:d9d:d8f7 with SMTP id
 o8-20020a170906974800b009890d9dd8f7mr1343689ejy.5.1687233945348; Mon, 19 Jun
 2023 21:05:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230620004217.4700-1-dakr@redhat.com>
 <2c92bae3-0003-3c53-8ef1-6e12e5413995@redhat.com>
In-Reply-To: <2c92bae3-0003-3c53-8ef1-6e12e5413995@redhat.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 20 Jun 2023 14:05:33 +1000
Message-ID: <CAPM=9tzMzfuMN_iGD-97_o=QQEDT6Mbb9_u=z_o49TeT7=XUFA@mail.gmail.com>
Subject: Re: [PATCH drm-next v5 00/14] [RFC] DRM GPUVA Manager & Nouveau
 VM_BIND UAPI
To: Danilo Krummrich <dakr@redhat.com>
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
Cc: matthew.brost@intel.com, willy@infradead.org,
 dri-devel@lists.freedesktop.org, corbet@lwn.net, nouveau@lists.freedesktop.org,
 ogabbay@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 mripard@kernel.org, linux-mm@kvack.org, boris.brezillon@collabora.com,
 Donald Robson <Donald.Robson@imgtec.com>, tzimmermann@suse.de,
 Liam.Howlett@oracle.com, bagasdotme@gmail.com, christian.koenig@amd.com,
 jason@jlekstrand.net, bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since this is feature is nouveau only currently and doesn't disturb
the current nouveau code paths, I'd like to try and get this work in
tree so other drivers can work from it.

If there are any major objections to this, I'm happy to pull it back
out again, but I'd like to get some acks/rb in the next couple of days
in order to land some of it.

Dave.


>
> forgot to add your email address to the patch series - sorry about that.
>
> This series (v5) contains the Documentation changes you requested.
>
> - Danilo
>
> On 6/20/23 02:42, Danilo Krummrich wrote:
> > This patch series provides a new UAPI for the Nouveau driver in order t=
o
> > support Vulkan features, such as sparse bindings and sparse residency.
> >
> > Furthermore, with the DRM GPUVA manager it provides a new DRM core feat=
ure to
> > keep track of GPU virtual address (VA) mappings in a more generic way.
> >
> > The DRM GPUVA manager is indented to help drivers implement userspace-m=
anageable
> > GPU VA spaces in reference to the Vulkan API. In order to achieve this =
goal it
> > serves the following purposes in this context.
> >
> >      1) Provide infrastructure to track GPU VA allocations and mappings=
,
> >         making use of the maple_tree.
> >
> >      2) Generically connect GPU VA mappings to their backing buffers, i=
n
> >         particular DRM GEM objects.
> >
> >      3) Provide a common implementation to perform more complex mapping
> >         operations on the GPU VA space. In particular splitting and mer=
ging
> >         of GPU VA mappings, e.g. for intersecting mapping requests or p=
artial
> >         unmap requests.
> >
> > The new VM_BIND Nouveau UAPI build on top of the DRM GPUVA manager, its=
elf
> > providing the following new interfaces.
> >
> >      1) Initialize a GPU VA space via the new DRM_IOCTL_NOUVEAU_VM_INIT=
 ioctl
> >         for UMDs to specify the portion of VA space managed by the kern=
el and
> >         userspace, respectively.
> >
> >      2) Allocate and free a VA space region as well as bind and unbind =
memory
> >         to the GPUs VA space via the new DRM_IOCTL_NOUVEAU_VM_BIND ioct=
l.
> >
> >      3) Execute push buffers with the new DRM_IOCTL_NOUVEAU_EXEC ioctl.
> >
> > Both, DRM_IOCTL_NOUVEAU_VM_BIND and DRM_IOCTL_NOUVEAU_EXEC, make use of=
 the DRM
> > scheduler to queue jobs and support asynchronous processing with DRM sy=
ncobjs
> > as synchronization mechanism.
> >
> > By default DRM_IOCTL_NOUVEAU_VM_BIND does synchronous processing,
> > DRM_IOCTL_NOUVEAU_EXEC supports asynchronous processing only.
> >
> > The new VM_BIND UAPI for Nouveau makes also use of drm_exec (execution =
context
> > for GEM buffers) by Christian K=C3=B6nig. Since the patch implementing =
drm_exec was
> > not yet merged into drm-next it is part of this series, as well as a sm=
all fix
> > for this patch, which was found while testing this series.
> >
> > This patch series is also available at [1].
> >
> > There is a Mesa NVK merge request by Dave Airlie [2] implementing the
> > corresponding userspace parts for this series.
> >
> > The Vulkan CTS test suite passes the sparse binding and sparse residenc=
y test
> > cases for the new UAPI together with Dave's Mesa work.
> >
> > There are also some test cases in the igt-gpu-tools project [3] for the=
 new UAPI
> > and hence the DRM GPU VA manager. However, most of them are testing the=
 DRM GPU
> > VA manager's logic through Nouveau's new UAPI and should be considered =
just as
> > helper for implementation.
> >
> > However, I absolutely intend to change those test cases to proper kunit=
 test
> > cases for the DRM GPUVA manager, once and if we agree on it's usefulnes=
s and
> > design.
> >
> > [1] https://gitlab.freedesktop.org/nouvelles/kernel/-/tree/new-uapi-drm=
-next /
> >      https://gitlab.freedesktop.org/nouvelles/kernel/-/merge_requests/1
> > [2] https://gitlab.freedesktop.org/nouveau/mesa/-/merge_requests/150/
> > [3] https://gitlab.freedesktop.org/dakr/igt-gpu-tools/-/tree/wip_nouvea=
u_vm_bind
> >
> > Changes in V2:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >    Nouveau:
> >      - Reworked the Nouveau VM_BIND UAPI to avoid memory allocations in=
 fence
> >        signalling critical sections. Updates to the VA space are split =
up in three
> >        separate stages, where only the 2. stage executes in a fence sig=
nalling
> >        critical section:
> >
> >          1. update the VA space, allocate new structures and page table=
s
> >          2. (un-)map the requested memory bindings
> >          3. free structures and page tables
> >
> >      - Separated generic job scheduler code from specific job implement=
ations.
> >      - Separated the EXEC and VM_BIND implementation of the UAPI.
> >      - Reworked the locking parts of the nvkm/vmm RAW interface, such t=
hat
> >        (un-)map operations can be executed in fence signalling critical=
 sections.
> >
> >    GPUVA Manager:
> >      - made drm_gpuva_regions optional for users of the GPUVA manager
> >      - allow NULL GEMs for drm_gpuva entries
> >      - swichted from drm_mm to maple_tree for track drm_gpuva / drm_gpu=
va_region
> >        entries
> >      - provide callbacks for users to allocate custom drm_gpuva_op stru=
ctures to
> >        allow inheritance
> >      - added user bits to drm_gpuva_flags
> >      - added a prefetch operation type in order to support generating p=
refetch
> >        operations in the same way other operations generated
> >      - hand the responsibility for mutual exclusion for a GEM's
> >        drm_gpuva list to the user; simplified corresponding (un-)link f=
unctions
> >
> >    Maple Tree:
> >      - I added two maple tree patches to the series, one to support cus=
tom tree
> >        walk macros and one to hand the locking responsibility to the us=
er of the
> >        GPUVA manager without pre-defined lockdep checks.
> >
> > Changes in V3:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >    Nouveau:
> >      - Reworked the Nouveau VM_BIND UAPI to do the job cleanup (includi=
ng page
> >        table cleanup) within a workqueue rather than the job_free() cal=
lback of
> >        the scheduler itself. A job_free() callback can stall the execut=
ion (run()
> >        callback) of the next job in the queue. Since the page table cle=
anup
> >        requires to take the same locks as need to be taken for page tab=
le
> >        allocation, doing it directly in the job_free() callback would s=
till
> >        violate the fence signalling critical path.
> >      - Separated Nouveau fence allocation and emit, such that we do not=
 violate
> >        the fence signalling critical path in EXEC jobs.
> >      - Implement "regions" (for handling sparse mappings through PDEs a=
nd dual
> >        page tables) within Nouveau.
> >      - Drop the requirement for every mapping to be contained within a =
region.
> >      - Add necassary synchronization of VM_BIND job operation sequences=
 in order
> >        to work around limitations in page table handling. This will be =
addressed
> >        in a future re-work of Nouveau's page table handling.
> >      - Fixed a couple of race conditions found through more testing. Th=
anks to
> >        Dave for consitently trying to break it. :-)
> >
> >    GPUVA Manager:
> >      - Implement pre-allocation capabilities for tree modifications wit=
hin fence
> >        signalling critical sections.
> >      - Implement accessors to to apply tree modification while walking =
the GPUVA
> >        tree in order to actually support processing of drm_gpuva_ops th=
rough
> >        callbacks in fence signalling critical sections rather than thro=
ugh
> >        pre-allocated operation lists.
> >      - Remove merging of GPUVAs; the kernel has limited to none knowleg=
e about
> >        the semantics of mapping sequences. Hence, merging is purely spe=
culative.
> >        It seems that gaining a significant (or at least a measurable) p=
erformance
> >        increase through merging is way more likely to happen when users=
pace is
> >        responsible for merging mappings up to the next larger page size=
 if
> >        possible.
> >      - Since merging was removed, regions pretty much loose their right=
 to exist.
> >        They might still be useful for handling dual page tables or simi=
lar
> >        mechanisms, but since Nouveau seems to be the only driver having=
 a need
> >        for this for now, regions were removed from the GPUVA manager.
> >      - Fixed a couple of maple_tree related issues; thanks to Liam for =
helping me
> >        out.
> >
> > Changes in V4:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >    Nouveau:
> >      - Refactored how specific VM_BIND and EXEC jobs are created and ho=
w their
> >        arguments are passed to the generic job implementation.
> >      - Fixed a UAF race condition where bind job ops could have been fr=
eed
> >        already while still waiting for a job cleanup to finish. This is=
 due to
> >        in certain cases we need to wait for mappings actually being unm=
apped
> >        before creating sparse regions in the same area.
> >      - Re-based the code onto drm_exec v4 patch.
> >
> >    GPUVA Manager:
> >      - Fixed a maple tree related bug when pre-allocating MA states.
> >        (Boris Brezillion)
> >      - Made struct drm_gpuva_fn_ops a const object in all occurrences.
> >        (Boris Brezillion)
> >
> > Changes in V5:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >    Nouveau:
> >      - Link and unlink GPUVAs outside the fence signalling critical pat=
h in
> >        nouveau_uvmm_bind_job_submit() holding the dma-resv lock. Mutual=
 exclusion
> >        of BO evicts causing mapping invalidation and regular mapping op=
erations
> >        is ensured with dma-fences.
> >
> >    GPUVA Manager:
> >      - Removed the separate GEMs GPUVA list lock. Link and unlink as we=
ll as
> >        iterating the GEM's GPUVA list should be protected with the GEM'=
s dma-resv
> >        lock instead.
> >      - Renamed DRM_GPUVA_EVICTED flag to DRM_GPUVA_INVALIDATED. Mapping=
s do not
> >        get eviced, they might get invalidated due to eviction.
> >      - Maple tree uses the 'unsinged long' type for node entries. While=
 this
> >        works for GPU VA spaces larger than 32-bit on 64-bit kernel, the=
 GPU VA
> >        space is limited to 32-bit on 32-bit kernels as well.
> >        As long as we do not have a 64-bit capable maple tree for 32-bit=
 kernels,
> >        the GPU VA manager contains checks to throw warnings when GPU VA=
 entries
> >        exceed the maple tree's storage capabilities.
> >      - Extended the Documentation and added example code as requested b=
y Donald
> >        Robson.
> >
> > Christian K=C3=B6nig (1):
> >    drm: execution context for GEM buffers v4
> >
> > Danilo Krummrich (13):
> >    maple_tree: split up MA_STATE() macro
> >    drm: manager to keep track of GPUs VA mappings
> >    drm: debugfs: provide infrastructure to dump a DRM GPU VA space
> >    drm/nouveau: new VM_BIND uapi interfaces
> >    drm/nouveau: get vmm via nouveau_cli_vmm()
> >    drm/nouveau: bo: initialize GEM GPU VA interface
> >    drm/nouveau: move usercopy helpers to nouveau_drv.h
> >    drm/nouveau: fence: separate fence alloc and emit
> >    drm/nouveau: fence: fail to emit when fence context is killed
> >    drm/nouveau: chan: provide nouveau_channel_kill()
> >    drm/nouveau: nvkm/vmm: implement raw ops to manage uvmm
> >    drm/nouveau: implement new VM_BIND uAPI
> >    drm/nouveau: debugfs: implement DRM GPU VA debugfs
> >
> >   Documentation/gpu/driver-uapi.rst             |   11 +
> >   Documentation/gpu/drm-mm.rst                  |   54 +
> >   drivers/gpu/drm/Kconfig                       |    6 +
> >   drivers/gpu/drm/Makefile                      |    3 +
> >   drivers/gpu/drm/drm_debugfs.c                 |   41 +
> >   drivers/gpu/drm/drm_exec.c                    |  278 +++
> >   drivers/gpu/drm/drm_gem.c                     |    3 +
> >   drivers/gpu/drm/drm_gpuva_mgr.c               | 1971 ++++++++++++++++
> >   drivers/gpu/drm/nouveau/Kbuild                |    3 +
> >   drivers/gpu/drm/nouveau/Kconfig               |    2 +
> >   drivers/gpu/drm/nouveau/dispnv04/crtc.c       |    9 +-
> >   drivers/gpu/drm/nouveau/include/nvif/if000c.h |   26 +-
> >   drivers/gpu/drm/nouveau/include/nvif/vmm.h    |   19 +-
> >   .../gpu/drm/nouveau/include/nvkm/subdev/mmu.h |   20 +-
> >   drivers/gpu/drm/nouveau/nouveau_abi16.c       |   24 +
> >   drivers/gpu/drm/nouveau/nouveau_abi16.h       |    1 +
> >   drivers/gpu/drm/nouveau/nouveau_bo.c          |  204 +-
> >   drivers/gpu/drm/nouveau/nouveau_bo.h          |    2 +-
> >   drivers/gpu/drm/nouveau/nouveau_chan.c        |   22 +-
> >   drivers/gpu/drm/nouveau/nouveau_chan.h        |    1 +
> >   drivers/gpu/drm/nouveau/nouveau_debugfs.c     |   39 +
> >   drivers/gpu/drm/nouveau/nouveau_dmem.c        |    9 +-
> >   drivers/gpu/drm/nouveau/nouveau_drm.c         |   27 +-
> >   drivers/gpu/drm/nouveau/nouveau_drv.h         |   94 +-
> >   drivers/gpu/drm/nouveau/nouveau_exec.c        |  418 ++++
> >   drivers/gpu/drm/nouveau/nouveau_exec.h        |   54 +
> >   drivers/gpu/drm/nouveau/nouveau_fence.c       |   23 +-
> >   drivers/gpu/drm/nouveau/nouveau_fence.h       |    5 +-
> >   drivers/gpu/drm/nouveau/nouveau_gem.c         |   62 +-
> >   drivers/gpu/drm/nouveau/nouveau_mem.h         |    5 +
> >   drivers/gpu/drm/nouveau/nouveau_prime.c       |    2 +-
> >   drivers/gpu/drm/nouveau/nouveau_sched.c       |  461 ++++
> >   drivers/gpu/drm/nouveau/nouveau_sched.h       |  123 +
> >   drivers/gpu/drm/nouveau/nouveau_svm.c         |    2 +-
> >   drivers/gpu/drm/nouveau/nouveau_uvmm.c        | 1979 ++++++++++++++++=
+
> >   drivers/gpu/drm/nouveau/nouveau_uvmm.h        |  107 +
> >   drivers/gpu/drm/nouveau/nouveau_vmm.c         |    4 +-
> >   drivers/gpu/drm/nouveau/nvif/vmm.c            |  100 +-
> >   .../gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c    |  213 +-
> >   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c |  197 +-
> >   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h |   25 +
> >   .../drm/nouveau/nvkm/subdev/mmu/vmmgf100.c    |   16 +-
> >   .../drm/nouveau/nvkm/subdev/mmu/vmmgp100.c    |   16 +-
> >   .../gpu/drm/nouveau/nvkm/subdev/mmu/vmmnv50.c |   27 +-
> >   include/drm/drm_debugfs.h                     |   25 +
> >   include/drm/drm_drv.h                         |    6 +
> >   include/drm/drm_exec.h                        |  119 +
> >   include/drm/drm_gem.h                         |   52 +
> >   include/drm/drm_gpuva_mgr.h                   |  682 ++++++
> >   include/linux/maple_tree.h                    |    7 +-
> >   include/uapi/drm/nouveau_drm.h                |  209 ++
> >   51 files changed, 7566 insertions(+), 242 deletions(-)
> >   create mode 100644 drivers/gpu/drm/drm_exec.c
> >   create mode 100644 drivers/gpu/drm/drm_gpuva_mgr.c
> >   create mode 100644 drivers/gpu/drm/nouveau/nouveau_exec.c
> >   create mode 100644 drivers/gpu/drm/nouveau/nouveau_exec.h
> >   create mode 100644 drivers/gpu/drm/nouveau/nouveau_sched.c
> >   create mode 100644 drivers/gpu/drm/nouveau/nouveau_sched.h
> >   create mode 100644 drivers/gpu/drm/nouveau/nouveau_uvmm.c
> >   create mode 100644 drivers/gpu/drm/nouveau/nouveau_uvmm.h
> >   create mode 100644 include/drm/drm_exec.h
> >   create mode 100644 include/drm/drm_gpuva_mgr.h
> >
> >
> > base-commit: 2222dcb0775d36de28992f56455ab3967b30d380
>
