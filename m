Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 865A03F2689
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 07:36:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9D316E9FD;
	Fri, 20 Aug 2021 05:36:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57A5D6E9FD
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 05:36:41 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id u3so17768197ejz.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 22:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=8HzyFYkGUm5ggxOpUHPPxgTfMlNVBJb6lAA4BAh9pjM=;
 b=dEYJ+k4bztpDOfQzTp5VAzZcqsSCa5IqpCSrm7KZVOnLF29lsRqlTQUDxI6mPhDTGm
 l7hsBU3wfMnPrBvx5iNc60mh6SHoM4uAJipWJnf4iAu2FS+dy5YeNp80b3qFs2fHMKqW
 AkmwN7gp+w6WKZY3jLICLxEefDINC1nGqrzFOqq4zK80etGsxa+F4KsAdMKRvluBdJGn
 YBudOUys6LHwyBUaQo0+FrC5gdcDpON7FcTFdyT4HjCCyVWJkM/Eg4SUGvzzwkxZKELm
 b6/A5IJOAZtabGwez2lU9wMSop7krt+5pKM6RjWbR8vWK6unAlQFtFZwUxXX6D8Zi5Xn
 bQBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=8HzyFYkGUm5ggxOpUHPPxgTfMlNVBJb6lAA4BAh9pjM=;
 b=H2SnRF5Aq+cXmWp8gknVG8YZ8EcujBHa8CemJQRUU9MXRnu8Kr30GCJvC94hSOvSTC
 y22J6FLoXVkV0QH2bAAyC7cqWtnUc636O4F81dgSpwxZJ3TZ288BYxAi6TjB85UUKJiF
 Xra3SRB5yLG4Y0kdNpP8zvk6vaLYQOzBF3J257hfDnf8SpbUOX+BrvbjXJAnPGaflQZj
 /xalYmDNYfpbeeWWwkh2nBMWdKLw/Q6ymHwqP8mfJOv7RclgKtfxajEgrmvfCI8W20WJ
 g89bSGoS61wQxIcTHrAjPhcZStXfpJIvsU0awGANG0RDwos7nXWzJYb0tuCEbMUvTEIo
 Dozg==
X-Gm-Message-State: AOAM532JbasftkGPqHl6D1YWQMlcC02FPzWVJ+tY7YqDXMsEdITj3uny
 qprVSORf+LdBByPhtL+qsNkZzru4lEMdQZajhi2IpGt6pv4=
X-Google-Smtp-Source: ABdhPJwYdZFC2bD7+yMJibq52aaH/DpLCVkO59zugzXa0+QmbM/Kj96k4OO2UTg/ZOkexaap+emh/HLECtWaSmo3ZY4=
X-Received: by 2002:a17:907:2706:: with SMTP id
 w6mr19693731ejk.101.1629437799895; 
 Thu, 19 Aug 2021 22:36:39 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 20 Aug 2021 15:36:29 +1000
Message-ID: <CAPM=9tx-3de7XH+pbT8deG3E3BhfPde7rBCjRu0pSxtQ0tqGsQ@mail.gmail.com>
Subject: [git pull] drm fixes for 5.14-rc7
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

Regularly scheduled fixes. The ttm one solves a problem of GPU drivers
failing to load if debugfs is off in Kconfig, otherwise the i915 and
mediatek, and amdgpu fixes all fairly normal.

nouveau has a couple of display fixes, but it has a fix for a
longstanding race condition in it's memory manager code, and the fix
mostly removes some code that wasn't working properly and has no
userspace users. This fix makes the diffstat kinda larger but in a
negative way.

Let me know if any problems,
Dave.

drm-fixes-2021-08-20-3:
drm fixes for 5.14-rc7

core:
- fix drm_wait_vblank uapi copying bug

ttm:
- fix debugfs init when debugfs is off

amdgpu:
- vega10 SMU workload fix
- DCN VM fix
- DCN 3.01 watermark fix

amdkfd:
- SVM fix

nouveau:
- ampere display fixes
- remove MM misfeature to fix a longstanding race condition

i915:
- tweaked display workaround for all PCHs
- eDP MSO pipe sanity for ADL-P fix
- remove unused symbol export

mediatek:
- AAL output size setting
- Delete component in remove function
The following changes since commit 7c60610d476766e128cc4284bb6349732cbd6606:

  Linux 5.14-rc6 (2021-08-15 13:40:53 -1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-08-20-3

for you to fetch changes up to daa7772d477ec658dc1fd9127549a7996d8e0c2b:

  Merge tag 'amd-drm-fixes-5.14-2021-08-18' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2021-08-20
15:13:56 +1000)

----------------------------------------------------------------
drm fixes for 5.14-rc7

core:
- fix drm_wait_vblank uapi copying bug

ttm:
- fix debugfs init when debugfs is off

amdgpu:
- vega10 SMU workload fix
- DCN VM fix
- DCN 3.01 watermark fix

amdkfd:
- SVM fix

nouveau:
- ampere display fixes
- remove MM misfeature to fix a longstanding race condition

i915:
- tweaked display workaround for all PCHs
- eDP MSO pipe sanity for ADL-P fix
- remove unused symbol export

mediatek:
- AAL output size setting
- Delete component in remove function

----------------------------------------------------------------
Anshuman Gupta (1):
      drm/i915: Tweaked Wa_14010685332 for all PCHs

Ben Skeggs (6):
      drm/nouveau: recognise GA107
      drm/nouveau/disp: power down unused DP links during init
      drm/nouveau/kms/nv50: workaround EFI GOP window channel format differences
      drm/nouveau/fifo/nv50-: rip out dma channels
      drm/nouveau: block a bunch of classes from userspace
      drm/nouveau: rip out nvkm_client.super

Dan Moulding (1):
      drm: ttm: Don't bail from ttm_global_init if debugfs_create_dir fails

Dave Airlie (5):
      Merge tag 'drm-misc-fixes-2021-08-18' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge branch 'linux-5.14' of git://github.com/skeggsb/linux into drm-fixes
      Merge tag 'drm-intel-fixes-2021-08-18' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'mediatek-drm-fixes-5.14-2' of
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux
into drm-fixes
      Merge tag 'amd-drm-fixes-5.14-2021-08-18' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes

Jake Wang (1):
      drm/amd/display: Ensure DCN save after VM setup

Jani Nikula (2):
      drm/i915/edp: fix eDP MSO pipe sanity checks for ADL-P
      drm/i915/dp: remove superfluous EXPORT_SYMBOL()

Kenneth Feng (2):
      Revert "drm/amd/pm: fix workload mismatch on vega10"
      drm/amd/pm: change the workload type for some cards

Mark Yacoub (1):
      drm: Copy drm_wait_vblank to user before returning

Yifan Zhang (1):
      drm/amdkfd: fix random KFDSVMRangeTest.SetGetAttributesTest test failure

Zhan Liu (1):
      drm/amd/display: Use DCN30 watermark calc for DCN301

jason-jh.lin (2):
      drm/mediatek: Add AAL output size configuration
      drm/mediatek: Add component_del in OVL and COLOR remove function

 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |  8 ++
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  6 ++
 drivers/gpu/drm/amd/display/dc/core/dc_vm_helper.c |  3 +
 drivers/gpu/drm/amd/display/dc/dc.h                |  1 +
 .../drm/amd/display/dc/dcn301/dcn301_resource.c    | 96 +---------------------
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c | 12 +++
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.h |  1 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c  |  1 +
 drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h  |  1 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  5 ++
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c  | 15 +++-
 drivers/gpu/drm/drm_ioc32.c                        |  4 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           | 24 +++---
 drivers/gpu/drm/i915/display/intel_display_power.c | 16 ++--
 .../gpu/drm/i915/display/intel_dp_link_training.c  |  1 -
 drivers/gpu/drm/i915/i915_irq.c                    | 21 -----
 drivers/gpu/drm/mediatek/mtk_disp_color.c          |  2 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |  2 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c        |  2 +
 drivers/gpu/drm/nouveau/dispnv50/disp.c            | 27 ++++++
 drivers/gpu/drm/nouveau/dispnv50/head.c            | 13 ++-
 drivers/gpu/drm/nouveau/dispnv50/head.h            |  1 +
 drivers/gpu/drm/nouveau/include/nvif/cl0080.h      |  3 +-
 drivers/gpu/drm/nouveau/include/nvif/class.h       |  2 -
 drivers/gpu/drm/nouveau/include/nvif/client.h      |  1 -
 drivers/gpu/drm/nouveau/include/nvif/driver.h      |  2 +-
 drivers/gpu/drm/nouveau/include/nvkm/core/client.h |  1 -
 drivers/gpu/drm/nouveau/include/nvkm/core/ioctl.h  |  2 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h  |  1 -
 drivers/gpu/drm/nouveau/nouveau_abi16.c            |  2 -
 drivers/gpu/drm/nouveau/nouveau_chan.c             | 19 +----
 drivers/gpu/drm/nouveau/nouveau_drm.c              |  3 +-
 drivers/gpu/drm/nouveau/nouveau_mem.c              | 15 +---
 drivers/gpu/drm/nouveau/nouveau_nvif.c             |  4 +-
 drivers/gpu/drm/nouveau/nouveau_svm.c              |  9 --
 drivers/gpu/drm/nouveau/nouveau_usif.c             | 57 ++++++++++---
 drivers/gpu/drm/nouveau/nvif/client.c              |  3 +-
 drivers/gpu/drm/nouveau/nvif/object.c              |  3 +-
 drivers/gpu/drm/nouveau/nvkm/core/ioctl.c          |  4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c  | 21 +++++
 drivers/gpu/drm/nouveau/nvkm/engine/device/user.c  |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c      |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.h      |  1 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c    |  9 ++
 drivers/gpu/drm/nouveau/nvkm/engine/dma/user.c     | 15 ----
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/Kbuild    |  2 -
 .../gpu/drm/nouveau/nvkm/engine/fifo/channv50.h    |  2 -
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/dmag84.c  | 94 ---------------------
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/dmanv50.c | 92 ---------------------
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/g84.c     |  1 -
 .../gpu/drm/nouveau/nvkm/engine/fifo/gpfifogk104.c |  2 -
 .../gpu/drm/nouveau/nvkm/engine/fifo/gpfifogv100.c |  2 -
 .../gpu/drm/nouveau/nvkm/engine/fifo/gpfifotu102.c |  2 -
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv50.c    |  1 -
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.c     |  6 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.h     |  1 -
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c     |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c     | 27 ++----
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c      |  6 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c | 16 ++--
 drivers/gpu/drm/ttm/ttm_device.c                   |  2 -
 61 files changed, 224 insertions(+), 477 deletions(-)
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/dmag84.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/dmanv50.c
