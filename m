Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DAE668B1E
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 06:15:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73B3F10E98B;
	Fri, 13 Jan 2023 05:15:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20FAC10E98B
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 05:15:32 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id ss4so42478351ejb.11
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 21:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=E5f8Tk8nG32JDX610wYSz4l32RwyWxZLZ7Rx+rniEqA=;
 b=TLQvpDF3lCjDWdDxkqOQ02L9FABV/4KXq3zJthoJTH85by0OVKDhpuKgjIVTxFbLAC
 u3DSU/7k1Hs4VjTle56xLH7kxbyHz6ra42KV0RlwpKcFBpYOzqcT9bo6HetfHpJWRMXx
 wzvxqVCM3uuAzc8GnnevWH1T7fEdHt+INm2GAtIiG4HEGMWgvg/RjF+J4WFagMvNnz9p
 tIJWPyxL+kK1Wi+cSyZqy1VqljXlCyLaYnFS0BuFVHy+jzLCbyrdSLrEeHHPTAXNoAak
 6aOulsIR5vHUP5Egcv9BXAZsfyoSthG+i/D8qvr0SIS1iyIHyTGBozks+CWYFkpQ5His
 WI0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E5f8Tk8nG32JDX610wYSz4l32RwyWxZLZ7Rx+rniEqA=;
 b=mnXvgUSJVIik3g3cENbDvsAad6pIf6x5PjkBsNQd07//5c/23VR6xAt9A/ywnMMWYY
 RJOlvoNqWChUBxHXi32XRgzuwdNZzzH4fQcdefa5ybhbt/hj7a0ULmw61BqDeV/xV/2e
 F9I8rrwnP5s/LJRuXRv16bD9duTdDAB37rAomsIu0TO+IlZmG5rS3cj+0nP0IygfnXFa
 ZT75y3Y9qhfGhvNUGQJ48MhC1nIqHOj9mnDP/rZUqw58TKiMieJ5iCDF3UoeYGJyaLfV
 JzDOcVRMDCjV92eky6Ygrxit6kM9vlbQ69jfZXcQ6vjZTk3F3Nd7L51QtxHEjqw+GmaM
 2d1w==
X-Gm-Message-State: AFqh2krJAAhSwaTs+nyYj/SXu/lKebgUICwfF0D5RNoFbegmVTnAEqoU
 naSapAUWaHQVvjUFuAIAZPzcKJHvK78E47RynCg=
X-Google-Smtp-Source: AMrXdXsZPFafHKKzcRuKl1Qoz0pXHE05Yajy7PyIYglwFzawYiEszZadYupS0xiwrELowFDfh1UQ7IJE6V9+J9A24YA=
X-Received: by 2002:a17:907:b610:b0:84d:1e4c:2e9 with SMTP id
 vl16-20020a170907b61000b0084d1e4c02e9mr1725692ejc.476.1673586930396; Thu, 12
 Jan 2023 21:15:30 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 13 Jan 2023 15:15:17 +1000
Message-ID: <CAPM=9tyS7pXX12Ks+b=iSbUAdfLW=U-uGKo4SkKz6yGiCsusNg@mail.gmail.com>
Subject: [git pull] drm fixes for 6.2-rc4
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

Back from a week off, managed to do a couple of dives (one with happy
manta ray about 3-4m away for 5mins).

Thanks to Daniel for taking care of fixes last week.

There is a bit of a post-holiday build up here I expect, small fixes
across the board, amdgpu and msm being the main leaders, with others
having a few. One code removal patch for nouveau.

Regards,
Dave.

drm-fixes-2023-01-13:
drm fixes for 6.2-rc4

buddy:
- benchmark regression fix for top-down buddy allocation

panel:
- add Lenovo panel orientation quirk

ttm:
- fix kernel oops regression

amdgpu:
- fix missing fence references
- fix missing pipeline sync fencing
- SMU13 fan speed fix
- SMU13 fix power cap handling
- SMU13 BACO fix
- Fix a possible segfault in bo validation error case
- Delay removal of firmware framebuffer
- Fix error when unloading

amdkfd:
- SVM fix when clearing vram
- GC11 fix for multi-GPU

i915:
- Reserve enough fence slot for i915_vma_unbind_vsync
- Fix potential use after free
- Reset engines twice in case of reset failure
- Use multi-cast registers for SVG Unit registers

msm:
- display:
- doc warning fixes
- dt attribs cleanups
- memory leak fix
- error handling in hdmi probe fix
- dp_aux_isr incorrect signalling fix
- shutdown path fix
- accel:
- a5xx: fix quirks to be a bitmask
- a6xx: fix gx halt to avoid 1s hang
- kexec shutdown fix
- fix potential double free

vmwgfx:
- drop rcu usage to make code more robust

virtio:
- fix use-after-free in gem handle code

nouveau:
- drop unused nouveau_fbcon.c
The following changes since commit b7bfaa761d760e72a969d116517eaa12e404c262=
:

  Linux 6.2-rc3 (2023-01-08 11:49:43 -0600)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-01-13

for you to fetch changes up to e695bc7e542358978434c8489a5a164d2bbefae8:

  Merge tag 'drm-msm-fixes-2023-01-12' of
https://gitlab.freedesktop.org/drm/msm into drm-fixes (2023-01-13
13:01:22 +1000)

----------------------------------------------------------------
drm fixes for 6.2-rc4

buddy:
- benchmark regression fix for top-down buddy allocation

panel:
- add Lenovo panel orientation quirk

ttm:
- fix kernel oops regression

amdgpu:
- fix missing fence references
- fix missing pipeline sync fencing
- SMU13 fan speed fix
- SMU13 fix power cap handling
- SMU13 BACO fix
- Fix a possible segfault in bo validation error case
- Delay removal of firmware framebuffer
- Fix error when unloading

amdkfd:
- SVM fix when clearing vram
- GC11 fix for multi-GPU

i915:
- Reserve enough fence slot for i915_vma_unbind_vsync
- Fix potential use after free
- Reset engines twice in case of reset failure
- Use multi-cast registers for SVG Unit registers

msm:
- display:
- doc warning fixes
- dt attribs cleanups
- memory leak fix
- error handing in hdmi probe fix
- dp_aux_isr incorrect signalling fix
- shutdown path fix
- accel:
- a5xx: fix quirks to be a bitmask
- a6xx: fix gx halt to avoid 1s hang
- kexec shutdown fix
- fix potential double free

vmwgfx:
- drop rcu usage to make code more robust

virtio:
- fix use-after-free in gem handle code

nouveau:
- drop unused nouveau_fbcon.c

----------------------------------------------------------------
Adam Skladowski (1):
      dt-bindings: display: msm: Rename mdss node name in example

Akhil P Oommen (1):
      drm/msm/a6xx: Avoid gx gbit halt during rpm suspend

Arunpravin Paneer Selvam (1):
      drm: Optimize drm buddy top-down allocation method

Bryan O'Donoghue (4):
      dt-bindings: msm: dsi-phy-28nm: Add missing qcom,
dsi-phy-regulator-ldo-mode
      dt-bindings: msm: dsi-controller-main: Fix operating-points-v2 constr=
aint
      dt-bindings: msm: dsi-controller-main: Fix power-domain constraint
      dt-bindings: msm: dsi-controller-main: Fix description of core clock

Chris Wilson (1):
      drm/i915/gt: Reset twice

Christian K=C3=B6nig (3):
      drm/amdgpu: fix another missing fence reference in the CS code
      drm/amdgpu: fix missing dma_fence_put in error path
      drm/amdgpu: fix pipeline sync v2

Christophe JAILLET (1):
      drm/msm/hdmi: Fix the error handling path of msm_hdmi_dev_probe()

Dave Airlie (4):
      Merge tag 'drm-misc-fixes-2023-01-12' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'amd-drm-fixes-6.2-2023-01-11' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-intel-fixes-2023-01-12' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'drm-msm-fixes-2023-01-12' of
https://gitlab.freedesktop.org/drm/msm into drm-fixes

Dmitry Baryshkov (1):
      drm/msm: another fix for the headless Adreno GPU

Eric Huang (2):
      drm/amdkfd: Add sync after creating vram bo
      drm/amdkfd: Fix NULL pointer error for GC 11.0.1 on mGPU

Evan Quan (2):
      drm/amd/pm: correct the reference clock for fan speed(rpm) calculatio=
n
      drm/amd/pm: add the missing mapping for PPT feature on SMU13.0.0
and 13.0.7

Guchun Chen (1):
      drm/amd/pm/smu13: BACO is supported when it's in BACO state

Gustavo Sousa (1):
      drm/i915/gt: Cover rest of SVG unit MCR registers

Konrad Dybcio (3):
      dt-bindings: msm/dsi: Don't require vcca-supply on 14nm PHY
      dt-bindings: msm/dsi: Don't require vdds-supply on 10nm PHY
      drm/msm/adreno: Make adreno quirks not overwrite each other

Kuogee Hsieh (1):
      drm/msm/dp: do not complete dp_aux_cmd_fifo_tx() if irq is not
for aux transfer

Luben Tuikov (1):
      drm/amdgpu: Fix potential NULL dereference

Mario Limonciello (1):
      drm/amd: Delay removal of the firmware framebuffer

Miaoqian Lin (1):
      drm/msm/dpu: Fix memory leak in msm_mdss_parse_data_bus_icc_path

Nirmoy Das (1):
      drm/i915: Reserve enough fence slot for i915_vma_unbind_async

Patrick Thompson (1):
      drm: Add orientation quirk for Lenovo ideapad D330-10IGL

Rob Clark (2):
      drm/i915: Fix potential context UAFs
      drm/virtio: Fix GEM handle creation UAF

Thomas Zimmermann (1):
      drm/nouveau: Remove file nouveau_fbcon.c

Yang Li (1):
      drm/msm/dpu: Fix some kernel-doc comments

YiPeng Chai (1):
      drm/amdgpu: Fixed bug on error when unloading amdgpu

Zack Rusin (2):
      drm/vmwgfx: Remove rcu locks from user resources
      drm/ttm: Fix a regression causing kernel oops'es

 .../bindings/display/msm/dsi-controller-main.yaml  |   4 +-
 .../bindings/display/msm/dsi-phy-10nm.yaml         |   1 -
 .../bindings/display/msm/dsi-phy-14nm.yaml         |   1 -
 .../bindings/display/msm/dsi-phy-28nm.yaml         |   4 +
 .../bindings/display/msm/qcom,qcm2290-mdss.yaml    |   2 +-
 .../bindings/display/msm/qcom,sm6115-mdss.yaml     |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |  51 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   8 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   6 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c           |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |   2 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |   9 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |   8 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   1 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |   1 +
 drivers/gpu/drm/drm_buddy.c                        |  81 ++-
 drivers/gpu/drm/drm_panel_orientation_quirks.c     |   6 +
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |  24 +-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h            |   4 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |  34 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |   4 +-
 drivers/gpu/drm/i915/i915_vma.c                    |   2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  15 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |   7 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   1 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  10 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |   3 +-
 drivers/gpu/drm/msm/dp/dp_aux.c                    |   4 +
 drivers/gpu/drm/msm/hdmi/hdmi.c                    |  12 +-
 drivers/gpu/drm/msm/msm_drv.c                      |   2 +-
 drivers/gpu/drm/msm/msm_mdss.c                     |   6 +-
 drivers/gpu/drm/nouveau/nouveau_fbcon.c            | 613 -----------------=
----
 drivers/gpu/drm/ttm/ttm_bo_util.c                  |   2 +-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c             |  19 +-
 drivers/gpu/drm/vmwgfx/ttm_object.c                |  41 +-
 drivers/gpu/drm/vmwgfx/ttm_object.h                |  14 -
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c                 |  38 --
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |  18 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c            | 176 +++---
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c           |  33 --
 43 files changed, 332 insertions(+), 950 deletions(-)
 delete mode 100644 drivers/gpu/drm/nouveau/nouveau_fbcon.c
