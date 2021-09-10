Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B0440673F
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 08:36:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8BA46E975;
	Fri, 10 Sep 2021 06:36:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 587146E975
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 06:36:12 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id z19so964705edi.9
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Sep 2021 23:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=rlvph/CrbxucPqly9ZzYcphNoUoNkAw0Kq3SShaViaI=;
 b=GRVK/o0I81Jkzs7CsUx8L+Yp32oLchqoBCJFJlmvQ5Nr8EzzEpRPILY2WwmtT3IEPp
 zDxStT2i5MBF0gr8V+Or9WMhN1ptBInoHNF2T/5rOyavbVutqth6qzjNCwSFqhnWB+Gr
 wN7fQRJUf07Pj6DEpOVAHOnsBlqgu93lQuBESL/jkP+9OIiqP4OyW10hzn+Os8xzZLkh
 jnsppUsXysB3hRg3buiUboYoi3CRav9qZ8ZsH8d129nkjrYRN77mwTMvDfCIicCiCqLw
 xQc3WAFT6YPfsjcTfDg+sljQeZ6RqsKIuRZBtHr+Gl7mq7JgKQc6w86gB45mE9sG5SB+
 HuaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=rlvph/CrbxucPqly9ZzYcphNoUoNkAw0Kq3SShaViaI=;
 b=LKpQOhjxzxsDBW6bjoj4Q9NLdy2zuRZa6JNRtZlqb9xVJoeOStkJ/4kOVbbWDHYBDx
 HG6eiINuAT3EMFMy8/r7Bw9So6tXCgYH+fYdunaBsT0cK9Rlhw3piMYd4mbnEomIxG+r
 O+o7Za/YV+r3EP7IyitsGflgIJoEQ9/f6nlodlwbEUCFviBrFDqrVQVZz+pJpkYphLcH
 UUWTTMAohp69UzdU8qpY7oiCz/ZFkNZOXGcnmIsoW0HALvhwc6X/S5r+zqIgUVDknTvH
 dMaLH/hJ1zSR+2qiJYCxW0Vke164UKGYRgkt+PssMmUnxCkU3WufR9lu7HMZ8e2Qd2V4
 yk1w==
X-Gm-Message-State: AOAM533YyQkmG9tVn+r37l09vgsea1DpZmTS/FA/FfyxXokq/8vx8TDT
 fUG0d8atpjccttX8mOMWCruZL/yozZUdgELmTB4=
X-Google-Smtp-Source: ABdhPJwSC0h/aU/YFG9nD6eaO9ktObCLLhrCvmz8UkrdxmhUzZbmydT/AlM95vReB6Iw9Q1fVYyuBhgvtu47HjhUsYg=
X-Received: by 2002:a05:6402:b0e:: with SMTP id
 bm14mr7327591edb.371.1631255770538; 
 Thu, 09 Sep 2021 23:36:10 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 10 Sep 2021 16:35:59 +1000
Message-ID: <CAPM=9twEpMNJou1DVwpTLAv7sfacBmFgXSef4BmVv2+w8exRVg@mail.gmail.com>
Subject: [git pull] drm fixes for 5.15-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

Just an initial bunch of fixes for the merge window, amdgpu is most of
them with a few ttm fixes and an fbdev avoid multiply overflow fix.

Dave.

drm-next-2021-09-10:
drm fixes for 5.15-rc1

ttm:
- Fix ttm_bo_move_memcpy() when ttm_resource is subclassed.
- Fix ttm deadlock if target BO isn't idle
- ttm build fix
- ttm docs fix

dma-buf:
- config option fixes

fbdev:
- limit resolutions to avoid int overflow

i915:
- stddef change.

amdgpu:
- Misc cleanups, typo fixes
- EEPROM fix
- Add some new PCI IDs
- Scatter/Gather display support for Yellow Carp
- PCIe DPM fix for RKL platforms
- RAS fix

amdkfd:
- SVM fix

vc4:
- static function fix

mgag200:
- fix uninit var

panfrost:
- lock_region fixes

 - Make some dma-buf config options depend on DMA_SHARED_BUFFER.
    - Handle multiplication overflow of fbdev xres/yres in the core.
The following changes since commit 8f0284f190e6a0aa09015090568c03f18288231a=
:

  Merge tag 'amd-drm-next-5.15-2021-08-27' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next (2021-08-30
09:06:03 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-next-2021-09-10

for you to fetch changes up to 70982eef4d7eebb47a3b1ef25ec1bc742f3a21cf:

  drm/ttm: Fix a deadlock if the target BO is not idle during swap
(2021-09-10 16:18:53 +1000)

----------------------------------------------------------------
drm fixes for 5.15-rc1

ttm:
- Fix ttm_bo_move_memcpy() when ttm_resource is subclassed.
- Fix ttm deadlock if target BO isn't idle
- ttm build fix
- ttm docs fix

dma-buf:
- config option fixes

fbdev:
- limit resolutions to avoid int overflow

i915:
- stddef change.

amdgpu:
- Misc cleanups, typo fixes
- EEPROM fix
- Add some new PCI IDs
- Scatter/Gather display support for Yellow Carp
- PCIe DPM fix for RKL platforms
- RAS fix

amdkfd:
- SVM fix

vc4:
- static function fix

mgag200:
- fix uninit var

panfrost:
- lock_region fixes

 - Make some dma-buf config options depend on DMA_SHARED_BUFFER.
    - Handle multiplication overflow of fbdev xres/yres in the core.

----------------------------------------------------------------
Aaron Liu (1):
      drm/amd/display: setup system context for APUs

Alex Deucher (1):
      drm/amdgpu: add some additional RDNA2 PCI IDs

Alex Sierra (1):
      drm/amdkfd: drop process ref count when xnack disable

Alyssa Rosenzweig (3):
      drm/panfrost: Simplify lock_region calculation
      drm/panfrost: Use u64 for size in lock_region
      drm/panfrost: Clamp lock region to Bifrost minimum

Angus Wang (1):
      drm/amd/display: cleanup idents after a revert

Anson Jacob (1):
      drm/amd/display: Fix memory leak reported by coverity

Colin Ian King (2):
      drm/mgag200: Fix uninitialized variable delta
      drm/amdgpu/swsmu: fix spelling mistake "minimun" -> "minimum"

Dave Airlie (3):
      Merge tag 'amd-drm-next-5.15-2021-09-01' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-misc-next-fixes-2021-09-03' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'drm-misc-next-fixes-2021-09-09' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next

Evan Quan (1):
      drm/amdgpu: reenable BACO support for 699F:C7 polaris12 SKU

Geert Uytterhoeven (3):
      dma-buf: DMABUF_MOVE_NOTIFY should depend on DMA_SHARED_BUFFER
      dma-buf: DMABUF_DEBUG should depend on DMA_SHARED_BUFFER
      dma-buf: DMABUF_SYSFS_STATS should depend on DMA_SHARED_BUFFER

Guchun Chen (1):
      drm/amdgpu: stop scheduler when calling hw_fini (v2)

Jason Ekstrand (2):
      drm/ttm: ttm_bo_device is now ttm_device
      drm/ttm: Include pagemap.h from ttm_tt.h

Jiapeng Chong (1):
      drm/vc4: hdmi: make vc4_hdmi_codec_pdata static

Jiawei Gu (1):
      drm/amdgpu: enable more pm sysfs under SRIOV 1-VF mode

Jing Yangyang (1):
      drm:dcn31: fix boolreturn.cocci warnings

John Clements (1):
      drm/amdgpu: Clear RAS interrupt status on aldebaran

Kees Cook (1):
      drm/amd/pm: And destination bounds checking to struct copy

Koba Ko (1):
      drm/amdgpu: Disable PCIE_DPM on Intel RKL Platform

Lang Yu (1):
      drm/amdgpu: show both cmd id and name when psp cmd failed

Luben Tuikov (2):
      drm/amdgpu: Fixes to returning VBIOS RAS EEPROM address
      drm/amdgpu: Process any VBIOS RAS EEPROM address

Michael Strauss (1):
      drm/amd/display: Initialize lt_settings on instantiation

Nicholas Kazlauskas (1):
      drm/amdgpu: Enable S/G for Yellow Carp

Philip Yang (1):
      drm/amdgpu: fix fdinfo race with process exit

Stephen Rothwell (1):
      drm/i915: use linux/stddef.h due to "isystem: trim/fixup
stdarg.h and other headers"

Tetsuo Handa (1):
      fbmem: don't allow too huge resolutions

Thomas Hellstr=C3=B6m (1):
      drm/ttm: Fix ttm_bo_move_memcpy() for subclassed struct ttm_resource

Yifan Zhang (1):
      drm/amdgpu: correct comments in memory type managers

YuBiao Wang (1):
      drm/amd/amdgpu: Add ready_to_reset resp for vega10

xinhui pan (2):
      drm/amdgpu: Fix a deadlock if previous GEM object allocation fails
      drm/ttm: Fix a deadlock if the target BO is not idle during swap

 Documentation/gpu/drm-mm.rst                       |  2 +-
 drivers/dma-buf/Kconfig                            |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   | 50 ++++++++++++++----=
----
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            | 17 ++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c         | 11 ++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |  8 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            | 23 +++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c        |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  8 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     | 25 +++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |  6 +--
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c              |  2 +
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.h              |  1 +
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c             | 30 ++++++++++---
 drivers/gpu/drm/amd/amdgpu/vi.c                    |  9 +---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |  3 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  2 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |  6 +--
 .../drm/amd/display/dc/dcn303/dcn303_resource.c    |  6 ++-
 .../drm/amd/display/dc/dcn31/dcn31_panel_cntl.c    |  4 +-
 .../display/dc/dml/dcn20/display_mode_vba_20v2.c   |  2 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  8 ++--
 drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h            | 24 +++++++++++
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    | 17 +++++++-
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |  6 +--
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |  8 ++--
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |  2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |  2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |  5 +--
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt_requests.h        |  2 +-
 drivers/gpu/drm/mgag200/mgag200_pll.c              |  1 +
 drivers/gpu/drm/panfrost/panfrost_mmu.c            | 31 +++++---------
 drivers/gpu/drm/panfrost/panfrost_regs.h           |  2 +
 drivers/gpu/drm/ttm/ttm_bo.c                       |  6 +--
 drivers/gpu/drm/ttm/ttm_bo_util.c                  |  7 ++-
 drivers/gpu/drm/ttm/ttm_tt.c                       |  1 -
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  2 +-
 drivers/video/fbdev/core/fbmem.c                   |  6 +++
 include/drm/ttm/ttm_tt.h                           |  3 +-
 41 files changed, 232 insertions(+), 127 deletions(-)
