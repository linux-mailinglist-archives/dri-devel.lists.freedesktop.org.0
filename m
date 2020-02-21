Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEB2166F54
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 06:52:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20E946E1F5;
	Fri, 21 Feb 2020 05:52:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC1536E1F5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 05:52:22 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id v19so492632oic.12
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 21:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=mqeICZcUxu4LuwyGnA3qI8w5qh4uiHvHEFBa89ydINo=;
 b=sSol/wrAVRFF3bef2sdrfZQOxW8WILk7+xXzBMuKBoft9jdjmHnyn4iutTzAar6w0d
 RFwXTF9Nmix5D6nRZUTyAk9IIX1+npXoZ6fxkonS6AU/3NoufyjCyCWl3BZ6l+yt0Kbz
 iJRkrW+runEQ58GhcLlvIYCwTNlb1Vs3o16NIKRP/zwjCin9P+4opkMIHtBkqwBAOlsB
 4L93mJEi3OgivcOXC6djAFCEYwFz9nJ9SyXhs1Fr5BxMoVUSyhRaVvAah2kfZ00s8tt2
 ZxrNK43a059DRiX5Ihz+UMqpFUQXhOQMmDGYKGZt0KqjoCkYS/M894Cs4dun3XlTMzuw
 yrEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=mqeICZcUxu4LuwyGnA3qI8w5qh4uiHvHEFBa89ydINo=;
 b=ijG8z7SIRDTz0u2Uvkq33MicT7tN7LN+iKrxsI4rVdwWzhA8TKhBMpHC7Ur3+4nRkV
 f8M5DttUg/MiGEKbd29YzaZw4TrOkDvTTETzsxwGXvGB0Hv29Es+m22kwNuBm2ybkQlQ
 iFXt21rzvwiBLcc7u5yLad71CyzPMYjVDj517E/gdqrOKFhKdnfOXJB9TSX5Ou+J/WlR
 BJ6VtOFrwmtifBQkifyXCmXTnevL0SX2A1doM8ut4/AOsOCkmICWiTevi/XnaPZAVyq5
 UCUWG9Lx2QLqak2CDMUNQbF2neiEHbMo1NpFAT/0Jnh2q4HRtIrIBWf8Ay7z5TqsNiyr
 RD8Q==
X-Gm-Message-State: APjAAAWqasc71G1zUfiJ+6S5GqT4dSlxbN1TCffgk5SC+xn3fitEXOdB
 lQDFjuPoRkoppNTE7DwiR8UTXRoJ/ZC90YUWilM=
X-Google-Smtp-Source: APXvYqwlrKB5tCAb/ZclvlwPq65jLkSayN26DwXfW42EjiEXj9b5JW0VTvVClhd/ZAzBHQyhA+BOJO/nodnSd9CvpWA=
X-Received: by 2002:aca:4d06:: with SMTP id a6mr652759oib.27.1582264341675;
 Thu, 20 Feb 2020 21:52:21 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 21 Feb 2020 15:52:10 +1000
Message-ID: <CAPM=9tyKU17ntxT9JEbWf+ZhiQ3pMOQtjLVGmDViR43Boj7zdA@mail.gmail.com>
Subject: [git pull] drm fixes for 5.6-rc3
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

Varied PR for rc3, i915 is the largest, they are seeing some ACPI
problems with their CI which hopefully get solved soon. msm has a
bunch of fixes for new hw added in the merge, a bunch of amdgpu fixes,
and nouveau adds support for some new firmwares for turing tu11x GPUs
that were just released into linux-firmware by nvidia, they operate
the same as the ones we already have for tu10x so should be fine to
hook up. Otherwise it's just misc fixes for panfrost and sun4i.

Regards,
Dave.

drm-fixes-2020-02-21:
drm fixes for 5.6-rc3

core:
- Allow only 1 rotation argument, and allow 0 rotation in video cmdline.

i915:
- Workaround missing Display Stream Compression (DSC) state readout by
 forcing modeset when its enabled at probe
- Fix EHL port clock voltage level requirements
- Fix queuing retire workers on the virtual engine
- Fix use of partially initialized waiters
- Stop using drm_pci_alloc/drm_pci/free
- Fix rewind of RING_TAIL by forcing a context reload
- Fix locking on resetting ring->head
- Propagate our bug filing URL change to stable kernels

panfrost:
- Small compiler warning fix for panfrost.
- Fix when using performance counters in panfrost when using per fd
address space.

sun4xi:
- Fix dt binding

nouveau:
- tu11x modesetting fix
- ACR/GR firmware support for tu11x (fw is public now)

msm:
- fix UBWC on GPU and display side for sc7180
- fix DSI suspend/resume issue encountered on sc7180
- fix some breakage on so called "linux-android" devices
  (fallout from sc7180/a618 support, not seen earlier
  due to bootloader/firmware differences)
- couple other misc fixes

amdgpu:
- HDCP fixes
- xclk fix for raven
- GFXOFF fixes
The following changes since commit 11a48a5a18c63fd7621bb050228cebf13566e4d8:

  Linux 5.6-rc2 (2020-02-16 13:16:59 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-02-21

for you to fetch changes up to 97d9a4e9619a822c5baf6a63e6f5b80fee4d4213:

  Merge tag 'drm-intel-fixes-2020-02-20' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2020-02-21
12:46:54 +1000)

----------------------------------------------------------------
drm fixes for 5.6-rc3

core:
- Allow only 1 rotation argument, and allow 0 rotation in video cmdline.

i915:
- Workaround missing Display Stream Compression (DSC) state readout by
 forcing modeset when its enabled at probe
- Fix EHL port clock voltage level requirements
- Fix queuing retire workers on the virtual engine
- Fix use of partially initialized waiters
- Stop using drm_pci_alloc/drm_pci/free
- Fix rewind of RING_TAIL by forcing a context reload
- Fix locking on resetting ring->head
- Propagate our bug filing URL change to stable kernels

panfrost:
- Small compiler warning fix for panfrost.
- Fix when using performance counters in panfrost when using per fd
address space.

sun4xi:
- Fix dt binding

nouveau:
- tu11x modesetting fix
- ACR/GR firmware support for tu11x (fw is public now)

msm:
- fix UBWC on GPU and display side for sc7180
- fix DSI suspend/resume issue encountered on sc7180
- fix some breakage on so called "linux-android" devices
  (fallout from sc7180/a618 support, not seen earlier
  due to bootloader/firmware differences)
- couple other misc fixes

amdgpu:
- HDCP fixes
- xclk fix for raven
- GFXOFF fixes

----------------------------------------------------------------
Akhil P Oommen (1):
      drm/msm/a6xx: Correct the highestbank configuration

Alex Deucher (4):
      drm/amdgpu/soc15: fix xclk for raven
      drm/amdgpu/gfx9: disable gfxoff when reading rlc clock
      drm/amdgpu/gfx10: disable gfxoff when reading rlc clock
      drm/amdgpu/display: clean up hdcp workqueue handling

Ben Skeggs (2):
      drm/nouveau/acr/tu11x: initial support
      drm/nouveau/gr/tu11x: initial support

Bhawanpreet Lakha (2):
      drm/amd/display: fix backwards byte order in rx_caps.
      drm/amd/display: fix dtm unloading

Boris Brezillon (1):
      drm/panfrost: perfcnt: Reserve/use the AS attached to the
perfcnt MMU context

Brian Masney (1):
      drm/msm/mdp5: rate limit pp done timeout warnings

Chris Wilson (7):
      drm/i915/gem: Require per-engine reset support for non-persistent contexts
      drm/i915: Initialise basic fence before acquiring seqno
      drm/i915/gt: Prevent queuing retire workers on the virtual engine
      drm/i915/gt: Protect defer_request() from new waiters
      drm/i915: Wean off drm_pci_alloc/drm_pci_free
      drm/i915/execlists: Always force a context reload when rewinding RING_TAIL
      drm/i915/gt: Avoid resetting ring->head outside of its timeline mutex

Dave Airlie (5):
      Merge tag 'amd-drm-fixes-5.6-2020-02-19' of
git://people.freedesktop.org/~agd5f/linux into drm-fixes
      Merge tag 'drm-msm-fixes-2020-02-16' of
https://gitlab.freedesktop.org/drm/msm into drm-fixes
      Merge branch 'linux-5.6' of git://github.com/skeggsb/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2020-02-20' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'drm-intel-fixes-2020-02-20' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes

Evan Quan (1):
      drm/amd/powerplay: always refetch the enabled features status on
dpm enablement

Geert Uytterhoeven (1):
      drm/bridge: ti-tfp410: Update drm_connector_init_with_ddc() error message

Harigovindan P (2):
      drm/msm/dsi: save pll state before dsi host is powered off
      drm/msm/dsi/pll: call vco set rate explicitly

Jani Nikula (3):
      MAINTAINERS: Update drm/i915 bug filing URL
      drm/i915: Update drm/i915 bug filing URL
      drm/i915/dsc: force full modeset whenever DSC is enabled at probe

John Stultz (1):
      drm: msm: Fix return type of dsi_mgr_connector_mode_valid for kCFI

Jordan Crouse (3):
      drm/msm/a6xx: Remove unneeded GBIF unhalt
      drm/msm/a6xx: Update the GMU bus tables for sc7180
      drm/msm: Fix a6xx GMU shutdown sequence

Kalyan Thota (1):
      msm:disp:dpu1: add UBWC support for display on SC7180

Lyude Paul (1):
      drm/nouveau/kms/gv100-: Re-set LUT after clearing for modesets

Maarten Lankhorst (1):
      Merge v5.6-rc1 into drm-misc-fixes

Matt Roper (1):
      drm/i915/ehl: Update port clock voltage level requirements

Maxime Ripard (1):
      dt-bindings: display: sunxi: Fix compatible

Rob Clark (1):
      drm/msm/dpu: fix BGR565 vs RGB565 confusion

Stephan Gerhold (2):
      drm/modes: Make sure to parse valid rotation value from cmdline
      drm/modes: Allow DRM_MODE_ROTATE_0 when applying video mode parameters

Tomi Valkeinen (1):
      drm/bridge: tc358767: fix poll timeouts

YueHaibing (1):
      drm/panfrost: Remove set but not used variable 'bo'

changzhu (1):
      drm/amdgpu: add is_raven_kicker judgement for raven1

 .../bindings/display/allwinner,sun4i-a10-tcon.yaml |  6 +-
 MAINTAINERS                                        |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            | 26 +++++-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  2 +
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              | 13 ++-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |  7 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 10 ++-
 .../drm/amd/display/modules/hdcp/hdcp2_execution.c |  4 +-
 drivers/gpu/drm/amd/powerplay/smu_v11_0.c          |  6 +-
 drivers/gpu/drm/bridge/tc358767.c                  |  8 +-
 drivers/gpu/drm/bridge/ti-tfp410.c                 |  3 +-
 drivers/gpu/drm/drm_client_modeset.c               |  3 +-
 drivers/gpu/drm/drm_modes.c                        |  7 ++
 drivers/gpu/drm/i915/Kconfig                       |  5 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |  4 +-
 drivers/gpu/drm/i915/display/intel_display.c       | 20 ++++-
 drivers/gpu/drm/i915/gem/i915_gem_context.c        | 16 ++++
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |  3 -
 drivers/gpu/drm/i915/gem/i915_gem_phys.c           | 98 +++++++++++-----------
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c        |  3 +
 drivers/gpu/drm/i915/gt/intel_gt_requests.c        |  3 +
 drivers/gpu/drm/i915/gt/intel_lrc.c                | 61 +++++++-------
 drivers/gpu/drm/i915/gt/intel_ring.c               |  1 +
 drivers/gpu/drm/i915/gt/intel_ring.h               |  8 ++
 drivers/gpu/drm/i915/gt/intel_ring_types.h         |  7 +-
 drivers/gpu/drm/i915/gt/selftest_lrc.c             |  2 +-
 drivers/gpu/drm/i915/i915_gem.c                    |  8 +-
 drivers/gpu/drm/i915/i915_gpu_error.c              |  3 +-
 drivers/gpu/drm/i915/i915_request.c                | 21 +++--
 drivers/gpu/drm/i915/i915_scheduler.c              |  6 +-
 drivers/gpu/drm/i915/i915_utils.c                  |  5 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              | 37 ++++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 65 ++------------
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c              | 85 +++++++++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        |  4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c           | 58 ++++++++++++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c          |  4 +-
 drivers/gpu/drm/msm/dsi/dsi_manager.c              |  7 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |  4 -
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c         |  6 ++
 drivers/gpu/drm/nouveau/dispnv50/wndw.c            |  2 +
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c  |  4 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c     | 26 ++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/tu102.c    | 14 ++++
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gv100.c     |  2 +
 drivers/gpu/drm/panfrost/panfrost_job.c            |  6 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c            |  7 +-
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c        | 11 +--
 drivers/gpu/drm/selftests/drm_cmdline_selftests.h  |  1 +
 .../gpu/drm/selftests/test-drm_cmdline_parser.c    | 15 +++-
 50 files changed, 486 insertions(+), 243 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
