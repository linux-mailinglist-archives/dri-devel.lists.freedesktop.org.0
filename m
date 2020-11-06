Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A45832A8E42
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 05:21:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD766EA45;
	Fri,  6 Nov 2020 04:21:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF77E6EA4E
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 04:21:25 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id gn41so70676ejc.4
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 20:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=5vlB4Pwupr/T1jamz8zGENU8bbSe7aYkeAEFPVdv4HI=;
 b=PLcQ2A3AM3YI40g0sx7qWNTvrgXqXvMONJfcBg5BNwrSZuixWzekn8cCUcX05ikTx4
 xdc4kPhXlEjok/1O/h+PUkW0B8Ls2IjoRvaxJllzc/8pCTm0vim3BTy6YqXQgdxCbpLL
 G3K/fVdTmNqyTaiZ8aPSvHWybqEYbulB5ltN4a//1t0j+i23sCfZ/F/TOHzc8CgoQ92v
 GBjzuvnrpbA2gp1/rQAH3IJGg2VEM45Nx7+HNxvjZ5n/BvzeoXKuvLd7AfRs/9TFFKDY
 szJF1JwwD7sD7zTs/0FvZGm5d37SW7rrK5VCjMjrvwoLvZlbjUfRuA60jihdF9zSdv8O
 GgGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=5vlB4Pwupr/T1jamz8zGENU8bbSe7aYkeAEFPVdv4HI=;
 b=iueyd4nyiqN5bP0rrjQ+mERL3UZWmTaZz0bCx1BKf7vu6Pmh0O8+PDGDrIxZmfRkiQ
 ByvYA1D1WUhtVH5vD5/KVmT9LPT6L3eLSEA2d+UkwxvvmVVIbwj804Kz6D1pjxZvz0bL
 YgPexSglOPAoyrGVxSzUVXGaxNOXf7BBpjT1AXa4YcvseFCZKcwlSMYsmIuff6qYIEGu
 ANZdfecbj2KRpuXEUyWxMy7I5Dj9P9F3rxFX7e4Rbjlzz2pgnmqtbvk7QUPhjGXxGshi
 bcIjjdj5iVxUAT3AKi8XoMm9CrOQyraeX1uB9Qp/JRhLSemab4oQXVeEOjQKfrvizAjl
 AdHw==
X-Gm-Message-State: AOAM530BcUMiwFvL0EeUC4GKJu+pmSZHKB95lOnheR4wi1aQvZy6KwsU
 xsNhyNMqiK1fvj3sxP7tjfFxB0oKa7wZfcUzlwY=
X-Google-Smtp-Source: ABdhPJyTAp6j3UAjKQ2OMteR5ZqSg6wlPrzyqQv2lIeKHoWAGEEDGSY6AO29OZvElShNrbv7vkO9jskvaaWuqyBo+rU=
X-Received: by 2002:a17:906:7f95:: with SMTP id
 f21mr192349ejr.340.1604636484257; 
 Thu, 05 Nov 2020 20:21:24 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 6 Nov 2020 14:21:13 +1000
Message-ID: <CAPM=9twEfV=TerAqTaQAo+3wUUewUxeij48bCph9XC1tdX3Pew@mail.gmail.com>
Subject: [git pull] drm fixes for 5.10-rc3
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

It's Friday here so that means another installment of drm fixes to
distract you from the counting process.

Changes all over the place, the amdgpu changes contain support for a
new GPU that is close to current one already in the tree (Green
Sardine) so it shouldn't have much side effects.

Otherwise imx has a few cleanup patches and fixes, amdgpu and i915
have around the usual smattering of fixes, fonts got constified, and
vc4/panfrost has some minor fixes. All in all a fairly regular rc3.

I think we have an outstanding nouveau regression, but the author is
looking into the fix, so should be here next week.

I now return you to counting.
Dave.

drm-fixes-2020-11-06-1:
drm fixes for 5.10-rc3

fonts:
- constify font structures.

MAINTAINERS:
- Fix path for amdgpu power management

amdgpu:
- Add support for more navi1x SKUs
- Fix for suspend on CI dGPUs
- VCN DPG fix for Picasso
- Sienna Cichlid fixes
- Polaris DPM fix
- Add support for Green Sardine

amdkfd:
- Fix an allocation failure check

i915:
- Fix set domain's cache coherency
- Fixes around breadcrumbs
- Fix encoder lookup during PSR atomic
- Hold onto an explicit ref to i915_vma_work.pinned
- gvt: HWSP reset handling fix
- gvt: flush workaround
- gvt: vGPU context pin/unpin
- gvt: mmio cmd access fix for bxt/apl

imx:
- drop unused functions and callbacks
- reuse imx_drm_encoder_parse_of
- spinlock rework
- memory leak fix
- minor cleanups

vc4:
- resource cleanup fix

panfrost:
- madvise/shrinker fix
The following changes since commit 3cea11cd5e3b00d91caf0b4730194039b45c5891:

  Linux 5.10-rc2 (2020-11-01 14:43:51 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-11-06-1

for you to fetch changes up to 356583b956e620a7ef8086f14bfe971986a320b3:

  Merge tag 'drm-misc-fixes-2020-11-05' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2020-11-06
13:32:12 +1000)

----------------------------------------------------------------
drm fixes for 5.10-rc3

fonts:
- constify font structures.

MAINTAINERS:
- Fix path for amdgpu power management

amdgpu:
- Add support for more navi1x SKUs
- Fix for suspend on CI dGPUs
- VCN DPG fix for Picasso
- Sienna Cichlid fixes
- Polaris DPM fix
- Add support for Green Sardine

amdkfd:
- Fix an allocation failure check

i915:
- Fix set domain's cache coherency
- Fixes around breadcrumbs
- Fix encoder lookup during PSR atomic
- Hold onto an explicit ref to i915_vma_work.pinned
- gvt: HWSP reset handling fix
- gvt: flush workaround
- gvt: vGPU context pin/unpin
- gvt: mmio cmd access fix for bxt/apl

imx:
- drop unused functions and callbacks
- reuse imx_drm_encoder_parse_of
- spinlock rework
- memory leak fix
- minor cleanups

vc4:
- resource cleanup fix

panfrost:
- madvise/shrinker fix

----------------------------------------------------------------
Aaron Liu (1):
      drm/amdgpu: enable green_sardine_asd.bin loading (v2)

Alex Deucher (4):
      drm/amdgpu/powerplay: Only apply optimized mclk dpm policy on polaris
      drm/amdgpu/swsmu: remove duplicate call to smu_set_default_dpm_table
      drm/amdgpu: add Green_Sardine APU flag
      drm/amdgpu/display: remove DRM_AMD_DC_GREEN_SARDINE

Arnd Bergmann (1):
      drm/imx: tve remove extraneous type qualifier

Boris Brezillon (1):
      drm/panfrost: Fix a deadlock between the shrinker and madvise path

Chris Wilson (5):
      drm/i915/gem: Flush coherency domains on first set-domain-ioctl
      drm/i915/gt: Use the local HWSP offset during submission
      drm/i915/gt: Expose more parameters for emitting writes into the ring
      drm/i915/gt: Flush xcs before tgl breadcrumbs
      drm/i915: Hold onto an explicit ref to i915_vma_work.pinned

Colin Xu (4):
      drm/i915/gvt: Allow zero out HWSP addr on hws_pga_write
      drm/i915/gvt: Set SNOOP for PAT3 on BXT/APL to workaround GPU BB hang
      drm/i915/gvt: Only pin/unpin intel_context along with workload
      drm/i915/gvt: Fix mmio handler break on BXT/APL.

Dave Airlie (4):
      Merge tag 'imx-drm-next-2020-10-30' of
git://git.pengutronix.de/git/pza/linux into drm-fixes
      Merge tag 'drm-intel-fixes-2020-11-05' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'amd-drm-fixes-5.10-2020-11-04' of
git://people.freedesktop.org/~agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2020-11-05' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes

Evan Quan (5):
      drm/amdgpu: perform srbm soft reset always on SDMA resume
      drm/amd/pm: correct the baco reset sequence for CI ASICs
      drm/amd/pm: enable baco reset for Hawaii
      drm/amd/pm: perform SMC reset on suspend/hibernation
      drm/amd/pm: do not use ixFEATURE_STATUS for checking smc running

Flora Cui (2):
      drm/amdgpu: disable DCN and VCN for Navi14 0x7340/C9 SKU
      drm/amdgpu: rename nv_is_headless_sku()

Imre Deak (1):
      drm/i915: Fix encoder lookup during PSR atomic check

Joe Perches (1):
      MAINTAINERS: Update AMD POWERPLAY pattern

John Clements (1):
      drm/amdgpu: resolved ASD loading issue on sienna

Kent Russell (1):
      amdkfd: Check kvmalloc return before memcpy

Lee Jones (1):
      Fonts: Replace discarded const qualifier

Likun Gao (1):
      drm/amdgpu: update golden setting for sienna_cichlid

Marco Felsch (1):
      drm/imx: parallel-display: fix edid memory leak

Maxime Ripard (7):
      drm/vc4: bo: Add a managed action to cleanup the cache
      drm/vc4: drv: Use managed drm_mode_config_init
      drm/vc4: gem: Add a managed action to cleanup the job queue
      drm/vc4: Use the helper to retrieve vc4_dev when needed
      drm/vc4: Use devm_drm_dev_alloc
      drm/vc4: kms: Add functions to create the state objects
      drm/vc4: drv: Remove unused variable

Philipp Zabel (9):
      gpu: ipu-v3: remove unused functions
      drm/imx: dw_hdmi-imx: use imx_drm_encoder_parse_of
      drm/imx: imx-tve: use regmap fast_io spinlock
      drm/imx: imx-tve: remove redundant enable tracking
      drm/imx: drop explicit drm_mode_config_cleanup
      drm/imx: dw_hdmi-imx: remove empty encoder_disable callback
      drm/imx: imx-ldb: reduce scope of edid_len
      drm/imx: parallel-display: remove unused function enc_to_imxpd()
      drm/imx: parallel-display: reduce scope of edid_len

Prike Liang (4):
      drm/amdgpu: add green_sardine support for gpu_info and ip block
setting (v2)
      drm/amdgpu: add soc15 common ip block support for green_sardine (v3)
      drm/amdgpu: add gfx support for green_sardine (v2)
      drm/amdgpu/sdma: add sdma engine support for green_sardine (v2)

Rodrigo Vivi (1):
      Merge tag 'gvt-fixes-2020-10-30' of
https://github.com/intel/gvt-linux into drm-intel-fixes

Roman Li (2):
      drm/amd/display: Add green_sardine support to DC
      drm/amd/display: Add green_sardine support to DM

Steven Price (1):
      drm/panfrost: Fix module unload

Thong Thai (1):
      drm/amdgpu: enable vcn support for green_sardine (v2)

Veerabadhran Gopalakrishnan (1):
      amd/amdgpu: Disable VCN DPG mode for Picasso

Zhenyu Wang (1):
      Merge tag 'drm-intel-fixes-2020-10-29' into gvt-fixes

 MAINTAINERS                                        |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |  8 ++-
 drivers/gpu/drm/amd/amdgpu/cik.c                   |  4 +-
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c              | 27 ++++----
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  4 ++
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              | 12 +++-
 drivers/gpu/drm/amd/amdgpu/nv.c                    | 11 +--
 drivers/gpu/drm/amd/amdgpu/psp_v12_0.c             |  6 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |  6 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 | 14 ++--
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |  2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  6 ++
 drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |  5 ++
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  2 +
 drivers/gpu/drm/amd/display/include/dal_asic_id.h  |  4 ++
 drivers/gpu/drm/amd/include/amd_shared.h           |  1 +
 drivers/gpu/drm/amd/pm/inc/hwmgr.h                 |  1 +
 drivers/gpu/drm/amd/pm/inc/smumgr.h                |  2 +
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/ci_baco.c   |  7 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    | 34 +++++----
 .../gpu/drm/amd/pm/powerplay/smumgr/ci_smumgr.c    | 29 ++++++--
 drivers/gpu/drm/amd/pm/powerplay/smumgr/smumgr.c   |  8 +++
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          | 11 ---
 drivers/gpu/drm/i915/display/intel_psr.c           |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_domain.c         | 28 ++++----
 drivers/gpu/drm/i915/gt/intel_engine.h             | 55 +++++++++------
 drivers/gpu/drm/i915/gt/intel_lrc.c                | 31 ++++++---
 drivers/gpu/drm/i915/gt/intel_timeline.c           | 18 ++---
 drivers/gpu/drm/i915/gt/intel_timeline_types.h     |  2 +
 drivers/gpu/drm/i915/gvt/handlers.c                | 47 ++++++++++++-
 drivers/gpu/drm/i915/gvt/scheduler.c               | 15 ++--
 drivers/gpu/drm/i915/i915_vma.c                    |  6 +-
 drivers/gpu/drm/imx/dw_hdmi-imx.c                  | 17 +----
 drivers/gpu/drm/imx/imx-drm-core.c                 | 10 +--
 drivers/gpu/drm/imx/imx-ldb.c                      | 10 ++-
 drivers/gpu/drm/imx/imx-tve.c                      | 40 ++---------
 drivers/gpu/drm/imx/parallel-display.c             | 20 +-----
 drivers/gpu/drm/panfrost/panfrost_drv.c            |  5 +-
 drivers/gpu/drm/panfrost/panfrost_gem.c            |  4 +-
 drivers/gpu/drm/panfrost/panfrost_gem.h            |  2 +-
 drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c   | 14 +++-
 drivers/gpu/drm/vc4/vc4_bo.c                       |  9 +--
 drivers/gpu/drm/vc4/vc4_drv.c                      | 41 ++++-------
 drivers/gpu/drm/vc4/vc4_drv.h                      |  9 ++-
 drivers/gpu/drm/vc4/vc4_gem.c                      | 19 ++---
 drivers/gpu/drm/vc4/vc4_hvs.c                      |  4 +-
 drivers/gpu/drm/vc4/vc4_kms.c                      | 80 ++++++++++++++++------
 drivers/gpu/drm/vc4/vc4_v3d.c                      | 12 ++--
 drivers/gpu/ipu-v3/ipu-common.c                    | 67 ------------------
 include/video/imx-ipu-v3.h                         |  3 -
 lib/fonts/font_10x18.c                             |  2 +-
 lib/fonts/font_6x10.c                              |  2 +-
 lib/fonts/font_6x11.c                              |  2 +-
 lib/fonts/font_6x8.c                               |  2 +-
 lib/fonts/font_7x14.c                              |  2 +-
 lib/fonts/font_8x16.c                              |  2 +-
 lib/fonts/font_8x8.c                               |  2 +-
 lib/fonts/font_acorn_8x8.c                         |  2 +-
 lib/fonts/font_mini_4x6.c                          |  2 +-
 lib/fonts/font_pearl_8x8.c                         |  2 +-
 lib/fonts/font_sun12x22.c                          |  2 +-
 lib/fonts/font_sun8x16.c                           |  2 +-
 lib/fonts/font_ter16x32.c                          |  2 +-
 65 files changed, 439 insertions(+), 370 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
