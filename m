Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D34A786369
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 00:32:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBB6A10E478;
	Wed, 23 Aug 2023 22:32:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D3910E478
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 22:32:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 58CE662B94
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 22:31:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DAC5C433C8
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 22:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692829918;
 bh=VJ3FDsQLtsFaOLutSkEya6nnUp0/Yr92VbJ58AMjlYA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=TiJ+GeT2zHLkW9BxDewhBXBBJDBzavNvIUEx6zH5a+BIxA+ITd0H7dCS/I2tUBIAm
 Ecj/vLfSomicgNzhyiNtU6EMrjoZl0WVDxJRR67gS7TnQQVeWQ9T+1ajbQrUGiYGoz
 CLRLVyp045BkO8IQ6TasM06YiUDZOrsyNfzgoqOaGTenaqT+lFQh4xszJyVXnG59Qy
 XJRGdRyI74N6PeGdkS15PBQwQrzkPxmFebbvl5iQMVBxiFSFeb27m/9E+DLwo/+4mY
 JsriJC6hJiiCJ6q9a4rsoo7aM+50d8tp/fF1YZy3fUF06/RCuBXafQdEMFYwpDxCJj
 V469zb7xjPYgw==
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-1c0fa9dd74fso4106938fac.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 15:31:58 -0700 (PDT)
X-Gm-Message-State: AOJu0YzaNSHMAPEZCDRR3xKR5bxNxxW5wjpbdd+KzVNiFQNaz3vy2al0
 qVPs7pTMHagxI2QcQ8UnNz2owL9Lb6Kmw0FwJto=
X-Google-Smtp-Source: AGHT+IEs+NFuXPKug7C2Ca+pWt4iWIo18bHwzImDfHMzO3mGxeBhyfkg+YTyOjiyfHbBUG73zNlMJi21/sZPlejk86k=
X-Received: by 2002:a05:6870:2155:b0:1be:f311:4a2b with SMTP id
 g21-20020a056870215500b001bef3114a2bmr18319535oae.24.1692829917725; Wed, 23
 Aug 2023 15:31:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230816082531.164695-1-sarah.walker@imgtec.com>
In-Reply-To: <20230816082531.164695-1-sarah.walker@imgtec.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 24 Aug 2023 07:31:21 +0900
X-Gmail-Original-Message-ID: <CAK7LNARQZjudwHe=u-Q1_y4HwpeamL-RiMnJ3fcPy93gaeQefA@mail.gmail.com>
Message-ID: <CAK7LNARQZjudwHe=u-Q1_y4HwpeamL-RiMnJ3fcPy93gaeQefA@mail.gmail.com>
Subject: Re: [PATCH v5 00/17] Imagination Technologies PowerVR DRM driver
To: Sarah Walker <sarah.walker@imgtec.com>
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
Cc: mripard@kernel.org, matthew.brost@intel.com, tzimmermann@suse.de,
 luben.tuikov@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, afd@ti.com, boris.brezillon@collabora.com,
 dakr@redhat.com, donald.robson@imgtec.com, hns@goldelico.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 18, 2023 at 4:35=E2=80=AFAM Sarah Walker <sarah.walker@imgtec.c=
om> wrote:
>
> This patch series adds the initial DRM driver for Imagination Technologie=
s PowerVR
> GPUs, starting with those based on our Rogue architecture. It's worth poi=
nting
> out that this is a new driver, written from the ground up, rather than a
> refactored version of our existing downstream driver (pvrsrvkm).
>
> This new DRM driver supports:
> - GEM shmem allocations
> - dma-buf / PRIME
> - Per-context userspace managed virtual address space
> - DRM sync objects (binary and timeline)
> - Power management suspend / resume
> - GPU job submission (geometry, fragment, compute, transfer)
> - META firmware processor
> - MIPS firmware processor
> - GPU hang detection and recovery
>
> Currently our main focus is on the AXE-1-16M GPU. Testing so far has been=
 done
> using a TI SK-AM62 board (AXE-1-16M GPU). Firmware for the AXE-1-16M can =
be
> found here:
> https://gitlab.freedesktop.org/frankbinns/linux-firmware/-/tree/powervr
>
> A Vulkan driver that works with our downstream kernel driver has already =
been
> merged into Mesa [1][2]. Support for this new DRM driver is being maintai=
ned in
> a merge request [3], with the branch located here:
> https://gitlab.freedesktop.org/frankbinns/mesa/-/tree/powervr-winsys
>
> Job stream formats are documented at:
> https://gitlab.freedesktop.org/mesa/mesa/-/blob/f8d2b42ae65c2f16f36a43e0a=
e39d288431e4263/src/imagination/csbgen/rogue_kmd_stream.xml
>
> The Vulkan driver is progressing towards Vulkan 1.0. We're code complete,=
 and
> are working towards passing conformance. The current combination of this =
kernel
> driver with the Mesa Vulkan driver (powervr-mesa-next branch) achieves 88=
.3% conformance.
>
> The code in this patch series, along with some of its history, can also b=
e found here:
> https://gitlab.freedesktop.org/frankbinns/powervr/-/tree/powervr-next
>
> This patch series has dependencies on a number of patches not yet merged.=
 They
> are listed below :
>
> drm/sched: Convert drm scheduler to use a work queue rather than kthread:
>   https://lore.kernel.org/dri-devel/20230404002211.3611376-2-matthew.bros=
t@intel.com/
> drm/sched: Move schedule policy to scheduler / entity:
>   https://lore.kernel.org/dri-devel/20230404002211.3611376-3-matthew.bros=
t@intel.com/
> drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy:
>   https://lore.kernel.org/dri-devel/20230404002211.3611376-4-matthew.bros=
t@intel.com/
> drm/sched: Start run wq before TDR in drm_sched_start:
>   https://lore.kernel.org/dri-devel/20230404002211.3611376-6-matthew.bros=
t@intel.com/
> drm/sched: Submit job before starting TDR:
>   https://lore.kernel.org/dri-devel/20230404002211.3611376-7-matthew.bros=
t@intel.com/
> drm/sched: Add helper to set TDR timeout:
>   https://lore.kernel.org/dri-devel/20230404002211.3611376-8-matthew.bros=
t@intel.com/
>
> [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/15243
> [2] https://gitlab.freedesktop.org/mesa/mesa/-/tree/main/src/imagination/=
vulkan
> [3] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/15507
>
> High level summary of changes:
>
> v5:
> * Retrieve GPU device information from firmware image header
> * Address issues with DT binding and example DTS
> * Update VM code for upstream GPU VA manager
> * BOs are always zeroed on allocation
> * Update copyright
>
> v4:
> * Implemented hang recovery via firmware hard reset
> * Add support for partial render jobs
> * Move to a threaded IRQ
> * Remove unnecessary read/write and clock helpers
> * Remove device tree elements not relevant to AXE-1-16M
> * Clean up resource acquisition
> * Remove unused DT binding attributes
>
> v3:
> * Use drm_sched for scheduling
> * Use GPU VA manager
> * Use runtime PM
> * Use drm_gem_shmem
> * GPU watchdog and device loss handling
> * DT binding changes: remove unused attributes, add additionProperties:fa=
lse
>
> v2:
> * Redesigned and simplified UAPI based on RFC feedback from XDC 2022
> * Support for transfer and partial render jobs
> * Support for timeline sync objects
>
> RFC v1: https://lore.kernel.org/dri-devel/20220815165156.118212-1-sarah.w=
alker@imgtec.com/
>
> RFC v2: https://lore.kernel.org/dri-devel/20230413103419.293493-1-sarah.w=
alker@imgtec.com/
>
> v3: https://lore.kernel.org/dri-devel/20230613144800.52657-1-sarah.walker=
@imgtec.com/
>
> v4: https://lore.kernel.org/dri-devel/20230714142355.111382-1-sarah.walke=
r@imgtec.com/
>
> Matt Coster (1):
>   sizes.h: Add entries between 32G and 64T
>
> Sarah Walker (16):
>   dt-bindings: gpu: Add Imagination Technologies PowerVR GPU
>   drm/imagination/uapi: Add PowerVR driver UAPI
>   drm/imagination: Add skeleton PowerVR driver
>   drm/imagination: Get GPU resources
>   drm/imagination: Add GPU register and FWIF headers
>   drm/imagination: Add GPU ID parsing and firmware loading
>   drm/imagination: Add GEM and VM related code
>   drm/imagination: Implement power management
>   drm/imagination: Implement firmware infrastructure and META FW support
>   drm/imagination: Implement MIPS firmware processor and MMU support
>   drm/imagination: Implement free list and HWRT create and destroy
>     ioctls
>   drm/imagination: Implement context creation/destruction ioctls
>   drm/imagination: Implement job submission and scheduling
>   drm/imagination: Add firmware trace to debugfs
>   drm/imagination: Add driver documentation
>   arm64: dts: ti: k3-am62-main: Add GPU device node [DO NOT MERGE]






I failed to compile this patch set.

I applied this series to linux next-20230822 and set CONFIG_DRM_POWERVR=3Dm=
.


I got this error.

  CC [M]  drivers/gpu/drm/imagination/pvr_ccb.o
In file included from drivers/gpu/drm/imagination/pvr_ccb.c:4:
drivers/gpu/drm/imagination/pvr_ccb.h:7:10: fatal error:
pvr_rogue_fwif.h: No such file or directory
    7 | #include "pvr_rogue_fwif.h"
      |          ^~~~~~~~~~~~~~~~~~
compilation terminated.



Did you forget to do 'git add' or am I missing something?


I do not see pvr_rogue_fwif.h
in the following diff stat.


>  .../devicetree/bindings/gpu/img,powervr.yaml  |   75 +
>  Documentation/gpu/drivers.rst                 |    2 +
>  Documentation/gpu/imagination/index.rst       |   14 +
>  Documentation/gpu/imagination/uapi.rst        |  174 +
>  .../gpu/imagination/virtual_memory.rst        |  462 ++
>  MAINTAINERS                                   |   10 +
>  arch/arm64/boot/dts/ti/k3-am62-main.dtsi      |    9 +
>  drivers/gpu/drm/Kconfig                       |    2 +
>  drivers/gpu/drm/Makefile                      |    1 +
>  drivers/gpu/drm/imagination/Kconfig           |   16 +
>  drivers/gpu/drm/imagination/Makefile          |   35 +
>  drivers/gpu/drm/imagination/pvr_ccb.c         |  641 ++
>  drivers/gpu/drm/imagination/pvr_ccb.h         |   71 +
>  drivers/gpu/drm/imagination/pvr_cccb.c        |  267 +
>  drivers/gpu/drm/imagination/pvr_cccb.h        |  109 +
>  drivers/gpu/drm/imagination/pvr_context.c     |  460 ++
>  drivers/gpu/drm/imagination/pvr_context.h     |  205 +
>  drivers/gpu/drm/imagination/pvr_debugfs.c     |   53 +
>  drivers/gpu/drm/imagination/pvr_debugfs.h     |   29 +
>  drivers/gpu/drm/imagination/pvr_device.c      |  651 ++
>  drivers/gpu/drm/imagination/pvr_device.h      |  704 ++
>  drivers/gpu/drm/imagination/pvr_device_info.c |  253 +
>  drivers/gpu/drm/imagination/pvr_device_info.h |  185 +
>  drivers/gpu/drm/imagination/pvr_drv.c         | 1515 ++++
>  drivers/gpu/drm/imagination/pvr_drv.h         |  129 +
>  drivers/gpu/drm/imagination/pvr_free_list.c   |  625 ++
>  drivers/gpu/drm/imagination/pvr_free_list.h   |  195 +
>  drivers/gpu/drm/imagination/pvr_fw.c          | 1470 ++++
>  drivers/gpu/drm/imagination/pvr_fw.h          |  508 ++
>  drivers/gpu/drm/imagination/pvr_fw_info.h     |  135 +
>  drivers/gpu/drm/imagination/pvr_fw_meta.c     |  554 ++
>  drivers/gpu/drm/imagination/pvr_fw_meta.h     |   14 +
>  drivers/gpu/drm/imagination/pvr_fw_mips.c     |  250 +
>  drivers/gpu/drm/imagination/pvr_fw_mips.h     |   38 +
>  .../gpu/drm/imagination/pvr_fw_startstop.c    |  301 +
>  .../gpu/drm/imagination/pvr_fw_startstop.h    |   13 +
>  drivers/gpu/drm/imagination/pvr_fw_trace.c    |  515 ++
>  drivers/gpu/drm/imagination/pvr_fw_trace.h    |   78 +
>  drivers/gpu/drm/imagination/pvr_gem.c         |  396 ++
>  drivers/gpu/drm/imagination/pvr_gem.h         |  184 +
>  drivers/gpu/drm/imagination/pvr_hwrt.c        |  549 ++
>  drivers/gpu/drm/imagination/pvr_hwrt.h        |  165 +
>  drivers/gpu/drm/imagination/pvr_job.c         |  770 ++
>  drivers/gpu/drm/imagination/pvr_job.h         |  161 +
>  drivers/gpu/drm/imagination/pvr_mmu.c         | 2523 +++++++
>  drivers/gpu/drm/imagination/pvr_mmu.h         |  108 +
>  drivers/gpu/drm/imagination/pvr_params.c      |  147 +
>  drivers/gpu/drm/imagination/pvr_params.h      |   72 +
>  drivers/gpu/drm/imagination/pvr_power.c       |  421 ++
>  drivers/gpu/drm/imagination/pvr_power.h       |   39 +
>  drivers/gpu/drm/imagination/pvr_queue.c       | 1455 ++++
>  drivers/gpu/drm/imagination/pvr_queue.h       |  179 +
>  .../gpu/drm/imagination/pvr_rogue_cr_defs.h   | 6193 +++++++++++++++++
>  .../imagination/pvr_rogue_cr_defs_client.h    |  159 +
>  drivers/gpu/drm/imagination/pvr_rogue_defs.h  |  179 +
>  drivers/gpu/drm/imagination/pvr_rogue_fwif.h  | 2208 ++++++
>  .../drm/imagination/pvr_rogue_fwif_check.h    |  491 ++
>  .../drm/imagination/pvr_rogue_fwif_client.h   |  371 +
>  .../imagination/pvr_rogue_fwif_client_check.h |  133 +
>  .../drm/imagination/pvr_rogue_fwif_common.h   |   60 +
>  .../drm/imagination/pvr_rogue_fwif_dev_info.h |  112 +
>  .../pvr_rogue_fwif_resetframework.h           |   28 +
>  .../gpu/drm/imagination/pvr_rogue_fwif_sf.h   | 1648 +++++
>  .../drm/imagination/pvr_rogue_fwif_shared.h   |  258 +
>  .../imagination/pvr_rogue_fwif_shared_check.h |  108 +
>  .../drm/imagination/pvr_rogue_fwif_stream.h   |   78 +
>  .../drm/imagination/pvr_rogue_heap_config.h   |  113 +
>  drivers/gpu/drm/imagination/pvr_rogue_meta.h  |  356 +
>  drivers/gpu/drm/imagination/pvr_rogue_mips.h  |  335 +
>  .../drm/imagination/pvr_rogue_mips_check.h    |   58 +
>  .../gpu/drm/imagination/pvr_rogue_mmu_defs.h  |  136 +
>  drivers/gpu/drm/imagination/pvr_stream.c      |  285 +
>  drivers/gpu/drm/imagination/pvr_stream.h      |   75 +
>  drivers/gpu/drm/imagination/pvr_stream_defs.c |  351 +
>  drivers/gpu/drm/imagination/pvr_stream_defs.h |   16 +
>  drivers/gpu/drm/imagination/pvr_sync.c        |  287 +
>  drivers/gpu/drm/imagination/pvr_sync.h        |   84 +
>  drivers/gpu/drm/imagination/pvr_vm.c          |  906 +++
>  drivers/gpu/drm/imagination/pvr_vm.h          |   60 +
>  drivers/gpu/drm/imagination/pvr_vm_mips.c     |  208 +
>  drivers/gpu/drm/imagination/pvr_vm_mips.h     |   22 +
>  include/linux/sizes.h                         |    9 +
>  include/uapi/drm/pvr_drm.h                    | 1303 ++++
>  83 files changed, 34567 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/img,powervr.yam=
l
>  create mode 100644 Documentation/gpu/imagination/index.rst
>  create mode 100644 Documentation/gpu/imagination/uapi.rst
>  create mode 100644 Documentation/gpu/imagination/virtual_memory.rst
>  create mode 100644 drivers/gpu/drm/imagination/Kconfig
>  create mode 100644 drivers/gpu/drm/imagination/Makefile
>  create mode 100644 drivers/gpu/drm/imagination/pvr_ccb.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_ccb.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_cccb.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_cccb.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_context.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_context.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_debugfs.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_debugfs.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_device.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_device.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_device_info.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_device_info.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_drv.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_drv.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_free_list.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_free_list.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_fw.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_fw.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_fw_info.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_fw_meta.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_fw_meta.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_fw_mips.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_fw_mips.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_fw_startstop.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_fw_startstop.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_fw_trace.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_fw_trace.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_gem.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_gem.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_hwrt.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_hwrt.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_job.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_job.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_mmu.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_mmu.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_params.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_params.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_power.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_power.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_queue.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_queue.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_cr_defs.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_cr_defs_client.=
h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_defs.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_client.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_client_che=
ck.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_common.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_dev_info.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_resetframe=
work.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_sf.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_shared.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_shared_che=
ck.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_stream.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_heap_config.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_meta.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_mips.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_mips_check.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_mmu_defs.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_stream.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_stream.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_stream_defs.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_stream_defs.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_sync.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_sync.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_vm.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_vm.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_vm_mips.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_vm_mips.h
>  create mode 100644 include/uapi/drm/pvr_drm.h
>
> --
> 2.41.0
>


--=20
Best Regards
Masahiro Yamada
