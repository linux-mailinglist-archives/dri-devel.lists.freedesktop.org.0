Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DCC21310C
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 03:46:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33FDF6E8AF;
	Fri,  3 Jul 2020 01:46:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45D596E8AF
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 01:46:47 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id d16so19380911edz.12
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jul 2020 18:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=qLfiDSVGg8dEfX7H/ROzYciq9xBdzFyzcF564zjEEEg=;
 b=brYMw3xgb295hMMOFsRoJbIg9S3lYWKCJj1HKtFyykC5xptIURUn/5m87F8t3s1P20
 NZ8HfGOqrZvbxxG4Kme5nRQ3ymD9yBRfDjC7IzQ3zW/K8iRI+SMQzTi5WOpMjC6Caw0P
 1+J+wlelVd3JTTISG4OiewowQ21jHNmJD4nKLirrFflSL1CJ+hXKIJHgakBsT09Tz+91
 noeOb4D3PDtudeqHf/LzNAAyeuQRTMCzXO/AKHSErGpuANbuDyAmy6SV83wDzyfufB4d
 EKHpGmOpUhCzqDr+ZAxaFSZSGWn0P61TaZVGp+2YyfW4aYe7h+St/SgWjuWp9oi1cOdD
 TuNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=qLfiDSVGg8dEfX7H/ROzYciq9xBdzFyzcF564zjEEEg=;
 b=tSa5dwW78+P38W7AMWMXHRr5HxflJzQtPsG/Ls+uAuxxCIv/yL/aTI6XqK9YnUazM1
 XMiGpFy10A4mboyGGyhw0irc9gNCyVLkroJt/GHN7EUi0qFnmrOWx+oOq3zth6kUfJi2
 7XKL3JQsMnDWhTEqnyJkQ3KzA8vwSyYwC2RSH3TK1hawXV/D9heJgXWSNsShrOnT+xfv
 tS0nFM0TLppfZ0G7znDUoTNlKrMloAN0PcLbDAm5g8lPKWzg+lCkSuPP/n9MS+uy2ouY
 xKLsecT4UFintT8XyZedR1AVGOxS/EtMwKtxPTl84nwQBbsdsQrvnxI7/r06aQAGEUuc
 PU7w==
X-Gm-Message-State: AOAM531jKV7T7W2NpTahRYJFqaFNwde7HNgpPdG08FMkjxm3DqE9IAF4
 dc/lHIIrDFDM2z4Sqwv/iW2yuP+x31aGWWz8c4k=
X-Google-Smtp-Source: ABdhPJyvQTydtXIP+ZxCaDjd7fW3WuNA6PUXIaUEdGV3/8+NR9OWrkU+8hc5H1HlpWfRv1RXbg0x8uaTa7xWXK75/XM=
X-Received: by 2002:aa7:ce84:: with SMTP id y4mr36809935edv.113.1593740805713; 
 Thu, 02 Jul 2020 18:46:45 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 3 Jul 2020 11:46:34 +1000
Message-ID: <CAPM=9tx-1Z5fRAAENHe-qnpBPvaQfn24-84QR-vnivH5-qQDEg@mail.gmail.com>
Subject: [git pull] drm fixes for 5.8-rc4
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Linus,

Pretty usual rc4 pull, two usual amdgpu, i915 pulls, and some misc arm
driver fixes.
The bigger bit is including the asm sources for some GPU shaders that
were contained in the i915 driver, otherwise it's pretty much business
as usual.

Dave.

drm-fixes-2020-07-03:
drm fixes for 5.8-rc4

dma-buf:
- fix a use-after-free bug

amdgpu:
- Fix for vega20 boards without RAS support
- DC bandwidth revalidation fix
- Fix Renoir vram info fetching
- Fix hwmon freq printing

i915:
- GVT fixes
  - Two missed MMIO handler fixes for SKL/CFL
  - Fix mask register bits check
  - Fix one lockdep error for debugfs entry access
- Include asm sources for render cache clear batches

msm:
- memleak fix
- display block fix
- address space fixes

exynos:
- error value and reference count fix
- error print removal

sun4i:
- remove HPD polling
The following changes since commit 9ebcfadb0610322ac537dd7aa5d9cbc2b2894c68:

  Linux 5.8-rc3 (2020-06-28 15:00:24 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-07-03

for you to fetch changes up to 1298a549e22abe36c82208406c7069280553c7dd:

  Merge tag 'drm-misc-fixes-2020-07-02' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2020-07-03
11:18:21 +1000)

----------------------------------------------------------------
drm fixes for 5.8-rc4

dma-buf:
- fix a use-after-free bug

amdgpu:
- Fix for vega20 boards without RAS support
- DC bandwidth revalidation fix
- Fix Renoir vram info fetching
- Fix hwmon freq printing

i915:
- GVT fixes
  - Two missed MMIO handler fixes for SKL/CFL
  - Fix mask register bits check
  - Fix one lockdep error for debugfs entry access
- Include asm sources for render cache clear batches

msm:
- memleak fix
- display block fix
- address space fixes

exynos:
- error value and reference count fix
- error print removal

sun4i:
- remove HPD polling

----------------------------------------------------------------
Alex Deucher (2):
      drm/amdgpu/atomfirmware: fix vram_info fetching for renoir
      drm/amdgpu: use %u rather than %d for sclk/mclk

Bernard Zhao (1):
      drm/msm: fix potential memleak in error branch

Chen Tao (1):
      drm/msm/dpu: fix error return code in dpu_encoder_init

Chen-Yu Tsai (1):
      drm: sun4i: hdmi: Remove extra HPD polling

Colin Xu (4):
      drm/i915/gvt: Add one missing MMIO handler for D_SKL_PLUS
      drm/i915/gvt: Fix two CFL MMIO handling caused by regression.
      drm/i915/gvt: Fix incorrect check of enabled bits in mask registers
      drm/i915/gvt: Use GFP_ATOMIC instead of GFP_KERNEL in atomic context

Dave Airlie (5):
      Merge tag 'drm-msm-fixes-2020-06-25' of
https://gitlab.freedesktop.org/drm/msm into drm-fixes
      Merge tag 'exynos-drm-fixes-for-v5.8-rc4' of
git://git.kernel.org/.../daeinki/drm-exynos into drm-fixes
      Merge tag 'drm-intel-fixes-2020-07-01' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'amd-drm-fixes-5.8-2020-07-01' of
git://people.freedesktop.org/~agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2020-07-02' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes

Eric Anholt (2):
      drm/msm: Fix address space size after refactor.
      drm/msm: Fix setup of a6xx create_address_space.

Ivan Mironov (1):
      drm/amd/powerplay: Fix NULL dereference in lock_bus() on Vega20 w/o RAS

Jani Nikula (1):
      Merge tag 'gvt-fixes-2020-06-17' of
https://github.com/intel/gvt-linux into drm-intel-fixes

John Stultz (1):
      drm/msm: Fix 0xfffflub in "Refactor address space initialization"

Jordan Crouse (1):
      drm/msm: Fix up the rest of the messed up address sizes

Kalyan Thota (1):
      drm/msm/dpu: request for display color blocks based on hw catalog entry

Krishna Manikandan (1):
      drm/msm/dpu: allow initialization of encoder locks during encoder init

Marek Szyprowski (1):
      drm/exynos: Properly propagate return value in drm_iommu_attach_device()

Navid Emamdoost (1):
      drm/exynos: fix ref count leak in mic_pre_enable

Nicholas Kazlauskas (1):
      drm/amd/display: Only revalidate bandwidth on medium and fast updates

Rodrigo Vivi (1):
      drm/i915: Include asm sources for {ivb, hsw}_clear_kernel.c

Sumit Semwal (1):
      dma-buf: Move dma_buf_release() from fops to dentry_ops

Tamseel Shams (1):
      drm/exynos: Remove dev_err() on platform_get_irq() failure

 drivers/dma-buf/dma-buf.c                          |  54 +++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c             |   4 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  10 +-
 .../gpu/drm/amd/powerplay/smumgr/vega20_smumgr.c   |  11 +-
 drivers/gpu/drm/exynos/exynos_drm_dma.c            |   4 +-
 drivers/gpu/drm/exynos/exynos_drm_g2d.c            |   1 -
 drivers/gpu/drm/exynos/exynos_drm_mic.c            |   4 +-
 drivers/gpu/drm/i915/gt/shaders/README             |  46 ++++++++
 .../gpu/drm/i915/gt/shaders/clear_kernel/hsw.asm   | 119 +++++++++++++++++++++
 .../gpu/drm/i915/gt/shaders/clear_kernel/ivb.asm   | 117 ++++++++++++++++++++
 drivers/gpu/drm/i915/gvt/debugfs.c                 |   2 +-
 drivers/gpu/drm/i915/gvt/handlers.c                |  24 +++--
 drivers/gpu/drm/i915/gvt/mmio_context.h            |   6 +-
 drivers/gpu/drm/i915/gvt/reg.h                     |   5 +
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |   2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |   2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |   2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  18 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |   2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |   2 +-
 drivers/gpu/drm/msm/msm_submitqueue.c              |   4 +-
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |   5 +-
 25 files changed, 373 insertions(+), 76 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/shaders/README
 create mode 100644 drivers/gpu/drm/i915/gt/shaders/clear_kernel/hsw.asm
 create mode 100644 drivers/gpu/drm/i915/gt/shaders/clear_kernel/ivb.asm
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
