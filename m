Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEDE96E8BD
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 06:42:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61A5810E907;
	Fri,  6 Sep 2024 04:42:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FjB/DFtN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5D2410E907
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 04:42:37 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a86910caf9cso481898766b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2024 21:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725597756; x=1726202556; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/HNTgh0Gw7k2vbgdhNpFyVMrFhVun9hfimao1T3fhE4=;
 b=FjB/DFtNVRXQpAwz3rXkB0yOJop/4sWQyfHA/HmZjzPB9J1D1LZod9pXxAG3HrSb20
 4Tn3OaZw+DOoLdT3sauFsusj2Os02wD4cJtADNuBZClfZhmaX2yZco4aR7tqMCp1ltMk
 /3qZ7DXCATVph1j6GGsagIITre+TAcCD9MXpenuhfu+vm6ZEc6I2M/sHzNs2hyI+mH5t
 TIryxC9zh6Q0FdrSvpdeunNUBSp/joJtTeq1LmVLoLUlrF0fjcpi2IDy7YiiXY5Wxd5u
 a9xKC85T/kU6RSL8HpQXmtNPbWXQmznFGZTFkceYR3nhbfNqFhb0rcA+QvgG5Rtrptg2
 wFsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725597756; x=1726202556;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/HNTgh0Gw7k2vbgdhNpFyVMrFhVun9hfimao1T3fhE4=;
 b=Ni3YjvdR6j1BsbKbkqf/uAg05Ft0Mu5eNWw8O9FrKY1Mv2z6Kz7x2f1AppEkGHXySV
 jPXc4bhi9YiRPlHyXHFljPH3EojlYFgRubC5awfm8UUKESE9zpKtUNCMqgOGP64L+dX/
 /cGPYufyUvjXjun0S5a0tdNduFp+cX0JkYld2JodKgoyK0ODxGrUJAoPoA1cHY+enitU
 p0veILSTyykoNsq168LmRoFzYVKTzyfYpWaLt01oyzFCPX++0o3apHlS10F42BISEYHB
 S7Xb26+6yA/kL2whxNlldehQMwHKmq2gzbRlopeMO6XJk+kIBSDGHf9xuClsbmaL3Kzf
 D5tQ==
X-Gm-Message-State: AOJu0Yycuj5RxG4A+wP8MrXEb6owmqCDJVEZhAb6C/mdOlk6OSk/iH8L
 SaNhdaHVPqhPwBiIfRLAeWLAVJo+O/SFjKAKehuYQ3hWpcq0DtUNYJupHkE0yLOmP02JYHYVlf6
 pUX0GtfESLsRIGhkIoiCdOHP3MMM=
X-Google-Smtp-Source: AGHT+IFkdH+PKjAfxOEWEApI1PAeMzo3NRnrgpgvh8In4iDMY2t0zHfT2XRFQJXd4EDMBNQCzq9u5iiqxe+gnrfDilA=
X-Received: by 2002:a17:906:d7dd:b0:a86:9fac:6939 with SMTP id
 a640c23a62f3a-a8a8644482bmr137611966b.30.1725597755552; Thu, 05 Sep 2024
 21:42:35 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 6 Sep 2024 14:42:24 +1000
Message-ID: <CAPM=9twtq1CjWbeNnVKRaquctv6GHYSixXofFbprS4Dk5iBkGg@mail.gmail.com>
Subject: [git pull] drm fixes for 6.11-rc7
To: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>
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

This has a fair few patches in it, but I reviewed them all and they
seem like real things, amdgpu, i915 and xe each have a bunch of fixes
for various things, then there is a some bridge suspend/resume
ordering fixes for a recent rework, and then some single driver
changes in a few others.

Nothing looks too serious, hopefully next week is quiet.

Dave.

drm-fixes-2024-09-06:
drm fixes for 6.11-rc7

amdgpu:
- IPS workaround
- Fix compatibility with older MES firmware
- Fix CPU spikes when clearing VRAM
- Backlight fix
- PMO fix
- Revert SWSMU change to fix regression

xe:
- GSC loading fix
- PCODE mutex fix
- Suspend/Resume fixes
- RPM fixes

i915:
- Do not attempt to load the GSC multiple times
- Fix readout degamma_lut mismatch on ilk/snb
- Mark debug_fence_init_onstack() with __maybe_unused
- fence: Mark debug_fence_free() with __maybe_unused
- display: Add mechanism to use sink model when applying quirk
- display: Increase Fast Wake Sync length as a quirk

komeda:
- zpos normalization fix

nouveau:
- incorrect register fix

imagination:
- memory leak fix

bridge:
- hdmi/bridge rework fixes

panthor:
- cache coherency fix
- hi priority access fix

panel:
- change of compatible string

fbdev:
- deferred-io init with no struct page fix
The following changes since commit 431c1646e1f86b949fa3685efc50b660a364c2b6=
:

  Linux 6.11-rc6 (2024-09-01 19:46:02 +1200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-09-06

for you to fetch changes up to 141bb6bc73cf45e8b742d6fafa6734b6d5f82b77:

  Merge tag 'amd-drm-fixes-6.11-2024-09-05' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2024-09-06
11:31:02 +1000)

----------------------------------------------------------------
drm fixes for 6.11-rc7

amdgpu:
- IPS workaround
- Fix compatibility with older MES firmware
- Fix CPU spikes when clearing VRAM
- Backlight fix
- PMO fix
- Revert SWSMU change to fix regression

xe:
- GSC loading fix
- PCODE mutex fix
- Suspend/Resume fixes
- RPM fixes

i915:
- Do not attempt to load the GSC multiple times
- Fix readout degamma_lut mismatch on ilk/snb
- Mark debug_fence_init_onstack() with __maybe_unused
- fence: Mark debug_fence_free() with __maybe_unused
- display: Add mechanism to use sink model when applying quirk
- display: Increase Fast Wake Sync length as a quirk

komeda:
- zpos normalization fix

nouveau:
- incorrect register fix

imagination:
- memory leak fix

bridge:
- hdmi/bridge rework fixes

panthor:
- cache coherency fix
- hi priority access fix

panel:
- change of compatible string

fbdev:
- deferred-io init with no struct page fix

----------------------------------------------------------------
Adri=C3=A1n Larumbe (1):
      drm/panthor: flush FW AS caches in slow reset path

Alex Deucher (2):
      drm/amdgpu: always allocate cleared VRAM for GEM allocations
      Revert "drm/amdgpu: align pp_power_profile_mode with kernel docs"

Andy Shevchenko (2):
      drm/i915/fence: Mark debug_fence_init_onstack() with __maybe_unused
      drm/i915/fence: Mark debug_fence_free() with __maybe_unused

Daniele Ceraolo Spurio (2):
      drm/i915: Do not attempt to load the GSC multiple times
      drm/xe/gsc: Do not attempt to load the GSC multiple times

Dave Airlie (5):
      nouveau: fix the fwsec sb verification register.
      Merge tag 'drm-intel-fixes-2024-09-05' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2024-09-05' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
      Merge tag 'drm-misc-fixes-2024-09-05' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'amd-drm-fixes-6.11-2024-09-05' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes

Dillon Varone (1):
      drm/amd/display: Block timing sync for different signals in PMO

Dmitry Baryshkov (3):
      drm/display: stop depending on DRM_DISPLAY_HELPER
      drm/bridge-connector: move to DRM_DISPLAY_HELPER module
      drm/bridge-connector: reset the HDMI connector state

Imre Deak (1):
      drm/xe: Suspend/resume user access only during system s/r

Jack Xiao (1):
      drm/amdgpu/mes: add mes mapping legacy queue switch

Jouni H=C3=B6gander (2):
      drm/i915/display: Add mechanism to use sink model when applying quirk
      drm/i915/display: Increase Fast Wake Sync length as a quirk

Leo Li (2):
      drm/amd/display: Determine IPS mode by ASIC and PMFW versions
      drm/amd/display: Lock DC and exit IPS when changing backlight

Maarten Lankhorst (1):
      drm/xe/display: Match i915 driver suspend/resume sequences better

Mary Guillemard (1):
      drm/panthor: Restrict high priorities on group_create

Matt Coster (1):
      drm/imagination: Free pvr_vm_gpuva after unlink

Matt Roper (1):
      drm/xe/pcode: Treat pcode as per-tile rather than per-GT

Rodrigo Vivi (2):
      drm/xe: Add missing runtime reference to wedged upon gt_reset
      drm/xe/display: Avoid encoder_suspend at runtime suspend

Ryan Walklin (2):
      dt-bindings: display: panel: Rename WL-355608-A8 panel to rg35xx-*-pa=
nel
      drm: panel: nv3052c: Correct WL-355608-A8 panel compatible

Thomas Zimmermann (1):
      drm/fbdev-dma: Only install deferred I/O if necessary

Ville Syrj=C3=A4l=C3=A4 (1):
      drm/i915: Fix readout degamma_lut mismatch on ilk/snb

hongchi.peng (1):
      drm: komeda: Fix an issue related to normalized zpos

 ...608-a8.yaml =3D> anbernic,rg35xx-plus-panel.yaml} |  15 ++-
 MAINTAINERS                                        |   2 +-
 drivers/gpu/drm/Makefile                           |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |   1 +
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |  49 +++++++---
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |   9 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  39 +++++++-
 .../dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c  |   3 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   6 +-
 drivers/gpu/drm/arm/display/komeda/komeda_kms.c    |  10 +-
 drivers/gpu/drm/bridge/Kconfig                     |   1 +
 drivers/gpu/drm/display/Kconfig                    |  24 +++--
 drivers/gpu/drm/display/Makefile                   |   2 +
 .../gpu/drm/{ =3D> display}/drm_bridge_connector.c   |  13 ++-
 drivers/gpu/drm/drm_fbdev_dma.c                    |  83 ++++++++++++----
 drivers/gpu/drm/i915/display/intel_alpm.c          |   2 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |   4 +
 drivers/gpu/drm/i915/display/intel_dp.c            |   4 +
 drivers/gpu/drm/i915/display/intel_dp_aux.c        |  16 +++-
 drivers/gpu/drm/i915/display/intel_dp_aux.h        |   2 +-
 drivers/gpu/drm/i915/display/intel_modeset_setup.c |  31 +++++-
 drivers/gpu/drm/i915/display/intel_quirks.c        |  68 ++++++++++++++
 drivers/gpu/drm/i915/display/intel_quirks.h        |   6 ++
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c          |   2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h           |   5 +
 drivers/gpu/drm/i915/i915_sw_fence.c               |   8 +-
 drivers/gpu/drm/imagination/pvr_vm.c               |   4 +
 drivers/gpu/drm/imx/dcss/Kconfig                   |   2 +
 drivers/gpu/drm/imx/lcdc/Kconfig                   |   2 +
 drivers/gpu/drm/ingenic/Kconfig                    |   2 +
 drivers/gpu/drm/kmb/Kconfig                        |   2 +
 drivers/gpu/drm/mediatek/Kconfig                   |   2 +
 drivers/gpu/drm/meson/Kconfig                      |   2 +
 drivers/gpu/drm/msm/Kconfig                        |   1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c    |   2 +-
 drivers/gpu/drm/omapdrm/Kconfig                    |   2 +
 drivers/gpu/drm/panel/panel-newvision-nv3052c.c    |   2 +-
 drivers/gpu/drm/panthor/panthor_drv.c              |  23 +++++
 drivers/gpu/drm/panthor/panthor_fw.c               |   8 +-
 drivers/gpu/drm/panthor/panthor_mmu.c              |  21 ++++-
 drivers/gpu/drm/panthor/panthor_mmu.h              |   1 +
 drivers/gpu/drm/panthor/panthor_sched.c            |   2 +-
 drivers/gpu/drm/renesas/rcar-du/Kconfig            |   2 +
 drivers/gpu/drm/renesas/rz-du/Kconfig              |   2 +
 drivers/gpu/drm/renesas/shmobile/Kconfig           |   2 +
 drivers/gpu/drm/rockchip/Kconfig                   |   4 +
 drivers/gpu/drm/tegra/Kconfig                      |   1 +
 drivers/gpu/drm/tidss/Kconfig                      |   2 +
 .../gpu/drm/xe/compat-i915-headers/intel_pcode.h   |   8 +-
 .../gpu/drm/xe/compat-i915-headers/intel_uncore.h  |   7 ++
 drivers/gpu/drm/xe/display/xe_display.c            |  23 +++--
 drivers/gpu/drm/xe/xe_device_types.h               |   6 ++
 drivers/gpu/drm/xe/xe_gsc.c                        |  12 +++
 drivers/gpu/drm/xe/xe_gt.c                         |   7 +-
 drivers/gpu/drm/xe/xe_gt_types.h                   |   6 --
 drivers/gpu/drm/xe/xe_guc_pc.c                     |   2 +-
 drivers/gpu/drm/xe/xe_hwmon.c                      |   4 +-
 drivers/gpu/drm/xe/xe_pcode.c                      | 104 ++++++++++-------=
----
 drivers/gpu/drm/xe/xe_pcode.h                      |  16 ++--
 drivers/gpu/drm/xe/xe_tile.c                       |   3 +
 drivers/gpu/drm/xe/xe_uc_fw.h                      |   9 +-
 drivers/gpu/drm/xe/xe_vram_freq.c                  |   6 +-
 drivers/gpu/drm/xlnx/Kconfig                       |   1 +
 include/uapi/drm/panthor_drm.h                     |   6 +-
 66 files changed, 546 insertions(+), 178 deletions(-)
 rename Documentation/devicetree/bindings/display/panel/{wl-355608-a8.yaml
=3D> anbernic,rg35xx-plus-panel.yaml} (67%)
 rename drivers/gpu/drm/{ =3D> display}/drm_bridge_connector.c (97%)
