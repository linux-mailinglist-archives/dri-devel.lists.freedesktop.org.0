Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7204F7DFE41
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 04:17:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 294B410E374;
	Fri,  3 Nov 2023 03:17:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B3CB10E372
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Nov 2023 03:16:59 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-9d274222b5dso258021466b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Nov 2023 20:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698981417; x=1699586217; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=mXJn2/Q2rJmnGcRroh0Cfim0A2ee3ojnFxcG/hs5g88=;
 b=cqw0DNyucDVyq9rbt/2FWIzQ0AMay8t38p5+xtj1fTojDl4F5O1vJkzVPQMPRk4tR5
 C6H/zCvGd42nGmVIsxuz0mngxJCI8/tnIzQHHcnnde0NMstlyRk4IJXs2srDLycs+qM5
 F7ClV9QgEZKMNPVyj6A3OFoaLY00p2/4q5o0V2cwxMzi11v51Y2K8Pi6hmHhWoKhbKy9
 4efelquRYGD+UcYHKsv4tNGWLpCNREYz5MAyGfK3jsi+hN3VE8dBUbLM/llFz6xErjRM
 wydpP7xErvPfwi6jEVxii/aUItaAthiUTjnamizRfn7E3rWWsOthDcnvJYGgR4efeVZw
 aVYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698981417; x=1699586217;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mXJn2/Q2rJmnGcRroh0Cfim0A2ee3ojnFxcG/hs5g88=;
 b=k+MbTXm21kcQJkiEnak5whwUIUVXHK4U7gEwAIydQk0gY3hxd4BrVgaOJbJD/pSXaE
 XtbzexuEyKXHS/Lh0BRfikZiL4WXqPsH6cqTRDOjPh3BTVC0+gNwHpFoPzLelduRhx52
 iQ8ZxWg8PpfTvTReRNVsgZrYwztc0sI9/1V6DhyNzIkxfS0dgI1VsTg4XkZOW9IUJdli
 n/R5tfS+6ToGXz+a9uy5zwr4ZsT9urNfW+b6tvR12kWy1L5zUwQtJjhwfwJS21oCJzmQ
 3m19lCnHqaK3WH8gPdB4+szFTSwiWVi0mODDssyayAbqshM59grrp/Ik547jf3vV+TtV
 4/sA==
X-Gm-Message-State: AOJu0YxTouVxAsm62KMDntTkf5JqEBi1lERWBliY7Rrmxj7oxT6zev9e
 GE9o33Wk8m65HByN+ixzFikxcy3sJ+qcjPoRnq5mqmkMQY0=
X-Google-Smtp-Source: AGHT+IF22ULQbu0D36x/rrVgg2I2BcwMN/V0lDqHnaVI9PGy9lfV53gxJjeqoh9m1j60xaPsS7N2Avgp6TfFoZsXe0k=
X-Received: by 2002:a17:907:72d3:b0:9be:b43c:38db with SMTP id
 du19-20020a17090772d300b009beb43c38dbmr6474612ejc.5.1698981417184; Thu, 02
 Nov 2023 20:16:57 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 3 Nov 2023 13:16:45 +1000
Message-ID: <CAPM=9txa=48madkU8QgcVzmU9EBvThNM_dU-1meEhtrsgF8iPA@mail.gmail.com>
Subject: [git pull] drm nouveau support for GSP firmware - optional
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

As I mentioned in my main pullreq I had a chancy optional nouveau one
that is delayed after Ben's departure, but I'd really like to land
support for the NVIDIA Ada chips and this is the only way that can
happen. This new firmware supports Turing/Ampere/Ada, but it's off by
default to the Turing/Ampere cards, so this shouldn't have any
regressions due to it only being used by default on some very new
GPUs, that mostly will run the binary driver anyways.

But if you feel 6.7 is baked enough and want to leave this hanging
until 6.8, I'm not gonna lose too much sleep, but I'd really like to
get a baseline for this into master so we can start concentrating on
figuring out how to improve it to move forward,

You might notice also this has a lot of header files, which are
extracts from the NVIDIA open code base, ideally in the future we
could reduce that or use some sort of generator instead of what we
have now, so I don't expect this to be a massive set of header files
each time we add new firmware.

Thanks,
Dave.

topic/nvidia-gsp-2023-11-03:
drm nouveau GSP support for 6.7-rc1

This is an optional pull request to add the initial
support for the NVIDIA GSP firmware to nouveau.

This firmware is a new direction for Turing+ GPUs,
and is only enabled by default on Ada generation.
Other generations need to use nouveau.config=NvGspRm=1

The GSP firmware takes nearly all the GPU init and
power management tasks onto a risc-v CPU on the GPU.

This patch series is mostly the work from Ben Skeggs,
and Dave added some patches to rebase it to the latest
firmware release which is where we will stay for as
long as possible as the firmwares have no ABI stability.
The following changes since commit 631808095a82e6b6f8410a95f8b12b8d0d38b161:

  Merge tag 'amd-drm-next-6.7-2023-10-27' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next (2023-10-31
12:37:19 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/topic/nvidia-gsp-2023-11-03

for you to fetch changes up to 8d55b0a940bb10592ffaad68d14314823ddf4cdf:

  nouveau/gsp: add some basic registry entries. (2023-11-03 12:57:23 +1000)

----------------------------------------------------------------
drm nouveau GSP support for 6.7-rc1

This is an optional pull request to add the initial
support for the NVIDIA GSP firmware to nouveau.

This firmware is a new direction for Turing+ GPUs,
and is only enabled by default on Ada generation.
Other generations need to use nouveau.config=NvGspRm=1

The GSP firmware takes nearly all the GPU init and
power management tasks onto a risc-v CPU on the GPU.

This patch series is mostly the work from Ben Skeggs,
and Dave added some patches to rebase it to the latest
firmware release which is where we will stay for as
long as possible as the firmwares have no ABI stability.

----------------------------------------------------------------
Ben Skeggs (44):
      drm/nouveau/mmu/tu102-: remove write to 0x100e68 during tlb invalidate
      drm/nouveau/nvkm: bump maximum number of NVDEC
      drm/nouveau/nvkm: bump maximum number of NVJPG
      drm/nouveau/gsp: prepare for GSP-RM
      drm/nouveau/acr/tu102-: prepare for GSP-RM
      drm/nouveau/bar/tu102-: prepare for GSP-RM
      drm/nouveau/bus/tu102-: prepare for GSP-RM
      drm/nouveau/devinit/tu102-: prepare for GSP-RM
      drm/nouveau/fault/tu102-: prepare for GSP-RM
      drm/nouveau/fb/tu102-: prepare for GSP-RM
      drm/nouveau/fuse/tu102-: prepare for GSP-RM
      drm/nouveau/gpio/tu102-: prepare for GSP-RM
      drm/nouveau/i2c/tu102-: prepare for GSP-RM
      drm/nouveau/imem/tu102-: prepare for GSP-RM
      drm/nouveau/ltc/tu102-: prepare for GSP-RM
      drm/nouveau/mc/tu102-: prepare for GSP-RM
      drm/nouveau/mmu/tu102-: prepare for GSP-RM
      drm/nouveau/pmu/tu102-: prepare for GSP-RM
      drm/nouveau/privring/tu102-: prepare for GSP-RM
      drm/nouveau/therm/tu102-: prepare for GSP-RM
      drm/nouveau/top/tu102-: prepare for GSP-RM
      drm/nouveau/vfn/tu102-: prepare for GSP-RM
      drm/nouveau/ce/tu102-: prepare for GSP-RM
      drm/nouveau/disp/tu102-: prepare for GSP-RM
      drm/nouveau/fifo/tu102-: prepare for GSP-RM
      drm/nouveau/gr/tu102-: prepare for GSP-RM
      drm/nouveau/nvdec/tu102-: prepare for GSP-RM
      drm/nouveau/nvenc/tu102-: prepare for GSP-RM
      drm/nouveau/sec2/tu102-: prepare for GSP-RM
      drm/nouveau/kms/tu102-: disable vbios parsing when running on RM
      drm/nouveau/nvkm: support loading fws into sg_table
      drm/nouveau/gsp/r535: add support for booting GSP-RM
      drm/nouveau/gsp/r535: add support for rm control
      drm/nouveau/gsp/r535: add support for rm alloc
      drm/nouveau/gsp/r535: add interrupt handling
      drm/nouveau/mmu/r535: initial support
      drm/nouveau/disp/r535: initial support
      drm/nouveau/fifo/r535: initial support
      drm/nouveau/ce/r535: initial support
      drm/nouveau/gr/r535: initial support
      drm/nouveau/nvdec/r535: initial support
      drm/nouveau/nvenc/r535: initial support
      drm/nouveau/nvjpg/r535: initial support
      drm/nouveau/ofa/r535: initial support

Dave Airlie (5):
      nouveau: fix r535 build on 32-bit arm.
      nouveau/disp: fix post-gsp build on 32-bit arm.
      nouveau/gsp: move to 535.113.01
      nouveau/gsp: fix message signature.
      nouveau/gsp: add some basic registry entries.

 drivers/gpu/drm/nouveau/dispnv50/core.c            |    1 +
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |  143 ++
 drivers/gpu/drm/nouveau/include/nvif/cl0080.h      |    3 +
 drivers/gpu/drm/nouveau/include/nvif/class.h       |   21 +
 drivers/gpu/drm/nouveau/include/nvkm/core/device.h |    1 +
 drivers/gpu/drm/nouveau/include/nvkm/core/falcon.h |    7 +
 .../gpu/drm/nouveau/include/nvkm/core/firmware.h   |    6 +-
 drivers/gpu/drm/nouveau/include/nvkm/core/layout.h |    6 +-
 drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h |   19 +
 .../gpu/drm/nouveau/include/nvkm/engine/falcon.h   |    4 +
 drivers/gpu/drm/nouveau/include/nvkm/engine/fifo.h |   19 +
 drivers/gpu/drm/nouveau/include/nvkm/engine/gr.h   |    1 +
 .../gpu/drm/nouveau/include/nvkm/engine/nvdec.h    |    3 +
 .../gpu/drm/nouveau/include/nvkm/engine/nvenc.h    |    3 +
 .../gpu/drm/nouveau/include/nvkm/engine/nvjpg.h    |    8 +
 drivers/gpu/drm/nouveau/include/nvkm/engine/ofa.h  |    9 +
 drivers/gpu/drm/nouveau/include/nvkm/subdev/bar.h  |    4 +
 drivers/gpu/drm/nouveau/include/nvkm/subdev/bios.h |    1 +
 drivers/gpu/drm/nouveau/include/nvkm/subdev/fb.h   |    6 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h  |  435 ++++
 .../gpu/drm/nouveau/include/nvkm/subdev/instmem.h  |    7 +
 drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h  |   11 +
 .../common/sdk/nvidia/inc/alloc/alloc_channel.h    |  170 ++
 .../common/sdk/nvidia/inc/class/cl0000.h           |   38 +
 .../common/sdk/nvidia/inc/class/cl0005.h           |   38 +
 .../common/sdk/nvidia/inc/class/cl0080.h           |   43 +
 .../common/sdk/nvidia/inc/class/cl2080.h           |   35 +
 .../sdk/nvidia/inc/class/cl2080_notification.h     |   62 +
 .../common/sdk/nvidia/inc/class/cl84a0.h           |   33 +
 .../common/sdk/nvidia/inc/class/cl90f1.h           |   31 +
 .../common/sdk/nvidia/inc/class/clc0b5sw.h         |   34 +
 .../sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073common.h  |   39 +
 .../sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073dfp.h     |  166 ++
 .../sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073dp.h      |  335 +++
 .../nvidia/inc/ctrl/ctrl0073/ctrl0073specific.h    |  216 ++
 .../sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073system.h  |   65 +
 .../sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080fifo.h    |   57 +
 .../sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080gpu.h     |   48 +
 .../sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080gr.h      |   31 +
 .../sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080bios.h    |   40 +
 .../sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080ce.h      |   35 +
 .../sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080event.h   |   41 +
 .../sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080fb.h      |   51 +
 .../sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080fifo.h    |   52 +
 .../sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h     |  100 +
 .../sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gr.h      |   41 +
 .../nvidia/inc/ctrl/ctrl2080/ctrl2080internal.h    |  162 ++
 .../common/sdk/nvidia/inc/ctrl/ctrl90f1.h          |   95 +
 .../sdk/nvidia/inc/ctrl/ctrla06f/ctrla06fgpfifo.h  |   42 +
 .../535.113.01/common/sdk/nvidia/inc/nvlimits.h    |   33 +
 .../nvrm/535.113.01/common/sdk/nvidia/inc/nvos.h   |  148 ++
 .../common/shared/msgq/inc/msgq/msgq_priv.h        |   46 +
 .../uproc/os/common/include/libos_init_args.h      |   52 +
 .../arch/nvalloc/common/inc/gsp/gsp_fw_sr_meta.h   |   79 +
 .../arch/nvalloc/common/inc/gsp/gsp_fw_wpr_meta.h  |  170 ++
 .../nvidia/arch/nvalloc/common/inc/rmRiscvUcode.h  |   82 +
 .../nvidia/arch/nvalloc/common/inc/rmgspseq.h      |  100 +
 .../535.113.01/nvidia/generated/g_allclasses.h     |   33 +
 .../535.113.01/nvidia/generated/g_chipset_nvoc.h   |   38 +
 .../nvrm/535.113.01/nvidia/generated/g_fbsr_nvoc.h |   31 +
 .../nvrm/535.113.01/nvidia/generated/g_gpu_nvoc.h  |   35 +
 .../nvidia/generated/g_kernel_channel_nvoc.h       |   62 +
 .../nvidia/generated/g_kernel_fifo_nvoc.h          |  119 ++
 .../535.113.01/nvidia/generated/g_mem_desc_nvoc.h  |   32 +
 .../nvrm/535.113.01/nvidia/generated/g_os_nvoc.h   |   44 +
 .../535.113.01/nvidia/generated/g_rpc-structures.h |  124 ++
 .../535.113.01/nvidia/generated/g_sdk-structures.h |   45 +
 .../nvidia/inc/kernel/gpu/gpu_acpi_data.h          |   74 +
 .../nvidia/inc/kernel/gpu/gpu_engine_type.h        |   86 +
 .../nvidia/inc/kernel/gpu/gsp/gsp_fw_heap.h        |   33 +
 .../nvidia/inc/kernel/gpu/gsp/gsp_init_args.h      |   57 +
 .../nvidia/inc/kernel/gpu/gsp/gsp_static_config.h  |  174 ++
 .../nvidia/inc/kernel/gpu/intr/engine_idx.h        |   57 +
 .../535.113.01/nvidia/inc/kernel/gpu/nvbitmask.h   |   33 +
 .../nvidia/inc/kernel/os/nv_memory_type.h          |   31 +
 .../nvidia/kernel/inc/vgpu/rpc_global_enums.h      |  262 +++
 .../nvidia/kernel/inc/vgpu/rpc_headers.h           |   51 +
 .../nvidia/kernel/inc/vgpu/sdk-structures.h        |   40 +
 drivers/gpu/drm/nouveau/include/nvrm/nvtypes.h     |   24 +
 drivers/gpu/drm/nouveau/nouveau_bios.c             |    5 +-
 drivers/gpu/drm/nouveau/nvif/disp.c                |    1 +
 drivers/gpu/drm/nouveau/nvkm/core/firmware.c       |   74 +-
 drivers/gpu/drm/nouveau/nvkm/engine/Kbuild         |    2 +
 drivers/gpu/drm/nouveau/nvkm/engine/ce/Kbuild      |    2 +
 drivers/gpu/drm/nouveau/nvkm/engine/ce/ga100.c     |    4 +
 drivers/gpu/drm/nouveau/nvkm/engine/ce/ga102.c     |    5 +
 drivers/gpu/drm/nouveau/nvkm/engine/ce/priv.h      |    3 +
 drivers/gpu/drm/nouveau/nvkm/engine/ce/r535.c      |  108 +
 drivers/gpu/drm/nouveau/nvkm/engine/ce/tu102.c     |    5 +
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c  |  190 +-
 drivers/gpu/drm/nouveau/nvkm/engine/device/priv.h  |    2 +
 drivers/gpu/drm/nouveau/nvkm/engine/device/user.c  |    1 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/Kbuild    |    3 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/ad102.c   |   52 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c    |    8 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.h    |    4 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/ga102.c   |    4 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gf119.c   |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c   |    6 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h     |    2 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c    |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c    |    3 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h    |   14 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c    | 1671 +++++++++++++++
 drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c   |    4 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c   |   31 +-
 drivers/gpu/drm/nouveau/nvkm/engine/falcon.c       |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/Kbuild    |    2 +
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c    |   11 +
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/cgrp.c    |    3 +
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c    |   55 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.h    |    3 +
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c   |    4 +
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c   |    7 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h    |    4 +
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c    |  664 ++++++
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.h    |    6 +
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c   |    4 +
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c   |    9 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/Kbuild      |    3 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ad102.c     |   46 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/base.c      |    6 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.c     |    4 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.h     |    2 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/r535.c      |  508 +++++
 drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c     |    5 +
 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/Kbuild   |    5 +
 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/ad102.c  |   44 +
 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/base.c   |    3 +-
 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/ga100.c  |   44 +
 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/ga102.c  |   16 +-
 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/gm107.c  |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/priv.h   |    7 +
 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.c   |  110 +
 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/tu102.c  |   44 +
 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/Kbuild   |    5 +
 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/ad102.c  |   44 +
 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/base.c   |    3 +-
 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/ga102.c  |   44 +
 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/gm107.c  |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/priv.h   |    5 +
 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/r535.c   |  110 +
 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/tu102.c  |   44 +
 drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/Kbuild   |    5 +
 drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/ad102.c  |   44 +
 drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/ga100.c  |   44 +
 drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/priv.h   |    8 +
 drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/r535.c   |  107 +
 drivers/gpu/drm/nouveau/nvkm/engine/ofa/Kbuild     |    6 +
 drivers/gpu/drm/nouveau/nvkm/engine/ofa/ad102.c    |   44 +
 drivers/gpu/drm/nouveau/nvkm/engine/ofa/ga100.c    |   44 +
 drivers/gpu/drm/nouveau/nvkm/engine/ofa/ga102.c    |   44 +
 drivers/gpu/drm/nouveau/nvkm/engine/ofa/priv.h     |    8 +
 drivers/gpu/drm/nouveau/nvkm/engine/ofa/r535.c     |  107 +
 drivers/gpu/drm/nouveau/nvkm/engine/sec2/Kbuild    |    2 +
 drivers/gpu/drm/nouveau/nvkm/engine/sec2/ga102.c   |    8 +-
 drivers/gpu/drm/nouveau/nvkm/engine/sec2/priv.h    |    3 +
 drivers/gpu/drm/nouveau/nvkm/engine/sec2/r535.c    |   54 +
 drivers/gpu/drm/nouveau/nvkm/engine/sec2/tu102.c   |    8 +-
 drivers/gpu/drm/nouveau/nvkm/falcon/Kbuild         |    1 +
 drivers/gpu/drm/nouveau/nvkm/falcon/base.c         |   16 +
 drivers/gpu/drm/nouveau/nvkm/falcon/ga100.c        |    6 +
 drivers/gpu/drm/nouveau/nvkm/falcon/ga102.c        |    6 +
 drivers/gpu/drm/nouveau/nvkm/falcon/tu102.c        |   28 +
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/ga102.c    |    4 +
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/tu102.c    |    3 +
 drivers/gpu/drm/nouveau/nvkm/subdev/bar/Kbuild     |    2 +
 drivers/gpu/drm/nouveau/nvkm/subdev/bar/base.c     |   10 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/bar/priv.h     |    3 +
 drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c     |  186 ++
 drivers/gpu/drm/nouveau/nvkm/subdev/bar/tu102.c    |    4 +
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/base.c    |    8 +
 drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.c    |    5 +
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/Kbuild |    2 +
 .../gpu/drm/nouveau/nvkm/subdev/devinit/ga100.c    |   15 +
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/priv.h |    3 +
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/r535.c |   51 +
 .../gpu/drm/nouveau/nvkm/subdev/devinit/tu102.c    |    4 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fault/tu102.c  |    8 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/Kbuild      |    2 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga100.c     |    5 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga102.c     |    4 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/priv.h      |    3 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/r535.c      |   87 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.c       |   46 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/tu102.c     |    5 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fuse/gm107.c   |    5 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gpio/ga102.c   |    5 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gpio/gk104.c   |    5 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/Kbuild     |    8 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c    |   57 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c     |   78 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c    |  359 ++++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c    |   74 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c    |  148 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gv100.c    |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h     |   57 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c     | 2236 ++++++++++++++++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c    |  198 ++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c    |   57 +
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/gm200.c    |    5 +
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/Kbuild |    2 +
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/base.c |   40 +-
 .../gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c    |    2 +
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv04.c |   45 +
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c |   27 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/priv.h |   13 +
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/r535.c |  333 +++
 drivers/gpu/drm/nouveau/nvkm/subdev/ltc/ga102.c    |    5 +
 drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp102.c    |    5 +
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/ga100.c     |    5 +
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/gp100.c     |    5 +
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/Kbuild     |    2 +
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c     |    4 +
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/priv.h     |    6 +
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c     |  123 ++
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/tu102.c    |    4 +
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c     |    6 +
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c      |    7 +
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c |    6 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp102.c    |    5 +
 .../gpu/drm/nouveau/nvkm/subdev/privring/gm200.c   |    5 +
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/gp100.c  |    5 +
 drivers/gpu/drm/nouveau/nvkm/subdev/top/ga100.c    |    7 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/top/gk104.c    |    7 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/vfn/Kbuild     |    2 +
 drivers/gpu/drm/nouveau/nvkm/subdev/vfn/ga100.c    |    5 +
 drivers/gpu/drm/nouveau/nvkm/subdev/vfn/priv.h     |    7 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/vfn/r535.c     |   50 +
 drivers/gpu/drm/nouveau/nvkm/subdev/vfn/tu102.c    |    5 +
 230 files changed, 14050 insertions(+), 140 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/include/nvkm/engine/nvjpg.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvkm/engine/ofa.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/alloc/alloc_channel.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/class/cl0000.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/class/cl0005.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/class/cl0080.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/class/cl2080.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/class/cl2080_notification.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/class/cl84a0.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/class/cl90f1.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/class/clc0b5sw.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073common.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073dfp.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073dp.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073specific.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073system.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080fifo.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080gpu.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080gr.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080bios.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080ce.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080event.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080fb.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080fifo.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gr.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080internal.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl90f1.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrla06f/ctrla06fgpfifo.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/nvlimits.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/nvos.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/shared/msgq/inc/msgq/msgq_priv.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/uproc/os/common/include/libos_init_args.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/arch/nvalloc/common/inc/gsp/gsp_fw_sr_meta.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/arch/nvalloc/common/inc/gsp/gsp_fw_wpr_meta.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/arch/nvalloc/common/inc/rmRiscvUcode.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/arch/nvalloc/common/inc/rmgspseq.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_allclasses.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_chipset_nvoc.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_fbsr_nvoc.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_gpu_nvoc.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_kernel_channel_nvoc.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_kernel_fifo_nvoc.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_mem_desc_nvoc.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_os_nvoc.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_rpc-structures.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_sdk-structures.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/gpu/gpu_acpi_data.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/gpu/gpu_engine_type.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/gpu/gsp/gsp_fw_heap.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/gpu/gsp/gsp_init_args.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/gpu/gsp/gsp_static_config.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/gpu/intr/engine_idx.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/gpu/nvbitmask.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/os/nv_memory_type.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/kernel/inc/vgpu/rpc_global_enums.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/kernel/inc/vgpu/rpc_headers.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/kernel/inc/vgpu/sdk-structures.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/nvtypes.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/ce/r535.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/ad102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/gr/ad102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/gr/r535.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/ad102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/ga100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/tu102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/ad102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/ga102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/r535.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/tu102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/Kbuild
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/ad102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/ga100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/priv.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/r535.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/ofa/Kbuild
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/ofa/ad102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/ofa/ga100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/ofa/ga102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/ofa/priv.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/ofa/r535.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/sec2/r535.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/falcon/tu102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/r535.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fb/r535.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/r535.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/vfn/r535.c
