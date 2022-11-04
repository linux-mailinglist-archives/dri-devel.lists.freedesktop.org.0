Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD29618EDD
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 04:21:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68EE310E052;
	Fri,  4 Nov 2022 03:21:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E14410E052
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 03:21:15 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id k2so2403653qkk.7
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Nov 2022 20:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qR+9PV1W56hl2vc+Dfe+aRwSNmJzZrOxDcC/ue9b5Y0=;
 b=lmzgjtihIMIiLluOFHNc570O556umHqo+3geJZKZIE+DMYc+BUrFT3YFo6ulZXBzMz
 BMef6f/yERPzUtq/ilj1uXCKkZ67JHtyNjB2EIGOABcTACziAPYWyMlWgTuBpgBWMbaG
 3Qz4finm+aPmY5pVrIvvIYAbloeEZlKeLJuJfpjjzDT8dONSlt//ipIqJniDb2GDX8a4
 F4xNOuhWd5kvQ7Qcwq/fE8sONK9p16f82k+T2mdMDb4Jqm6vdUuz16i5QYzl6oem6Mid
 j1Aq3CGk+ijOH5DwKfFMHBa7iyk8wfD4nsMdPZqIso/x+8cPAUXvEmNvFZZZ6YUWZWR1
 JSFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qR+9PV1W56hl2vc+Dfe+aRwSNmJzZrOxDcC/ue9b5Y0=;
 b=aDWvbgylMR0/aKEceCM4ZHwKlfhqCS0l3lk1LwDrYi0v18hW8sFVPyAcwTkRPp3pBb
 zIz9pSXBN1aCB16dgtMwbWclAF2uh0ah6yaGKC/JreXCk4FA0tT6XQB/NSQEfj/DeEGo
 AWQ5a1lbgYdIvSgcK5uKhcsGgJUXjf2NNHWY3OVCBdmR8Per9zRKEM7bsPP0pPaUT4zX
 5Ql/0+eKI16Y7hl7IGsGkWLS5jtE6Ka2GG4ytTEwcrV2MFElTMwlMoWFz24omQK5VlEq
 t+wH8J3Hde3Nsr8EyWoYHOgX7suVqXSPAFDop2Yx3yWdoZmWnu2RH1td2YR8+sZCLsId
 IMdw==
X-Gm-Message-State: ACrzQf1JCfaY74FQA+FlOt5qVLWBw06ECr2F/IwGnDM4igfCHgEmv6uO
 flpL0/ZFE9C3nvlOk7HJgNBzL36kww6531e/AnM=
X-Google-Smtp-Source: AMsMyM4gqCXx4VnDU0H8GOp2a966UpJKWz5rHplEQhfEVKZubokBZWn66KUwuNQ2Lo8Zu0FWNCCdTkenEJMkCqzCO7s=
X-Received: by 2002:a05:620a:1009:b0:6fa:1245:ce4 with SMTP id
 z9-20020a05620a100900b006fa12450ce4mr25138714qkj.483.1667532074052; Thu, 03
 Nov 2022 20:21:14 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 4 Nov 2022 13:21:02 +1000
Message-ID: <CAPM=9ty0XRutgBy8fg13q-h-jm3uKQ+x1XyoT_6UcT5i+5uN9A@mail.gmail.com>
Subject: [git pull] drm fixes for 6.1-rc4
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

This is the weekly fixes for rc4. Misc fixes across rockchip, imx,
amdgpu and i915. The biggest change is for amdkfd where the trap
handler needs an updated fw from a header which makes it a bit larger.
I hadn't noticed this particular file before so I'm going to figure
out what the magic is for, but the fix should be fine for now.

Dave.

drm-fixes-2022-11-04-1:
drm fixes for 6.1-rc4

amdgpu:
- DCN 3.1.4 fixes
- DCN 3.2.x fixes
- GC 11.x fixes
- Virtual display fix
- Fail suspend if resources can't be evicted
- SR-IOV fix
- Display PSR fix

amdkfd:
- Fix possible NULL pointer deref
- GC 11.x trap handler fix

i915:
- Add locking around DKL PHY register accesses
- Stop abusing swiotlb_max_segment
- Filter out invalid outputs more sensibly
- Setup DDC fully before output init
- Simplify intel_panel_add_edid_alt_fixed_modes()
- Grab mode_config.mutex during LVDS init to avoid WARNs

rockchip:
- fix probing issues
- fix framebuffer without iommu
- fix vop selection
- fix NULL ptr access

imx:
- Fix Kconfig.
- fix mode_valid function
The following changes since commit 30a0b95b1335e12efef89dd78518ed3e4a71a763=
:

  Linux 6.1-rc3 (2022-10-30 15:19:28 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-11-04-1

for you to fetch changes up to 6295f1d8b4503ad8a18519b781dd2d1fe5e88c52:

  Merge tag 'drm-intel-fixes-2022-11-03' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2022-11-04
09:30:18 +1000)

----------------------------------------------------------------
drm fixes for 6.1-rc4

amdgpu:
- DCN 3.1.4 fixes
- DCN 3.2.x fixes
- GC 11.x fixes
- Virtual display fix
- Fail suspend if resources can't be evicted
- SR-IOV fix
- Display PSR fix

amdkfd:
- Fix possible NULL pointer deref
- GC 11.x trap handler fix

i915:
- Add locking around DKL PHY register accesses
- Stop abusing swiotlb_max_segment
- Filter out invalid outputs more sensibly
- Setup DDC fully before output init
- Simplify intel_panel_add_edid_alt_fixed_modes()
- Grab mode_config.mutex during LVDS init to avoid WARNs

rockchip:
- fix probing issues
- fix framebuffer without iommu
- fix vop selection
- fix NULL ptr access

imx:
- Fix Kconfig.
- fix mode_valid function

----------------------------------------------------------------
Alvin Lee (1):
      drm/amd/display: Enable timing sync on DCN32

Aurelien Jarno (1):
      drm/rockchip: dw_hdmi: filter regulator -EPROBE_DEFER error messages

Brian Norris (2):
      drm/rockchip: dsi: Clean up 'usage_mode' when failing to attach
      drm/rockchip: dsi: Force synchronous probe

Dave Airlie (3):
      Merge tag 'drm-misc-fixes-2022-11-02-1' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'amd-drm-fixes-6.1-2022-11-02' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-intel-fixes-2022-11-03' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes

Dillon Varone (2):
      drm/amd/display: Update latencies on DCN321
      drm/amd/display: Set memclk levels to be at least 1 for dcn32

Fangzhi Zuo (1):
      drm/amd/display: Ignore Cable ID Feature

Gavin Wan (1):
      drm/amdgpu: Disable GPU reset on SRIOV before remove pci.

George Shen (4):
      drm/amd/display: Fix DCN32 DSC delay calculation
      drm/amd/display: Use forced DSC bpp in DML
      drm/amd/display: Round up DST_after_scaler to nearest int
      drm/amd/display: Add DSC delay factor workaround

Graham Sider (2):
      drm/amdgpu: correct MES debugfs versions
      drm/amdgpu: disable GFXOFF during compute for GFX11

Hector Martin (1):
      drm/format-helper: Only advertise supported formats for conversion

Imre Deak (1):
      drm/i915/tgl+: Add locking around DKL PHY register accesses

Jay Cornwall (1):
      drm/amdkfd: update GFX11 CWSR trap handler

John Keeping (1):
      drm/rockchip: fix fbdev on non-IOMMU devices

Jun Lei (1):
      drm/amd/display: Limit dcn32 to 1950Mhz display clock

Leo Chen (1):
      drm/amd/display: Update DSC capabilitie for DCN314

Liu Ying (1):
      drm/imx: Kconfig: Remove duplicated 'select DRM_KMS_HELPER' line

Mario Limonciello (1):
      drm/amd: Fail the suspend if resources can't be evicted

Max Tseng (1):
      drm/amd/display: cursor update command incomplete

Michael Tretter (2):
      drm/rockchip: vop2: fix null pointer in plane_atomic_disable
      drm/rockchip: vop2: disable planes when disabling the crtc

Nathan Huckleberry (1):
      drm/imx: imx-tve: Fix return type of imx_tve_connector_mode_valid

Nevenko Stupar (1):
      drm/amd/display: Investigate tool reported FCLK P-state deviations

Ondrej Jirman (1):
      drm/rockchip: dsi: Fix VOP selection on SoCs that support it

Robert Beckett (1):
      drm/i915: stop abusing swiotlb_max_segment

Ville Syrj=C3=A4l=C3=A4 (4):
      drm/i915/sdvo: Filter out invalid outputs more sensibly
      drm/i915/sdvo: Setup DDC fully before output init
      drm/i915: Simplify intel_panel_add_edid_alt_fixed_modes()
      drm/i915/sdvo: Grab mode_config.mutex during LVDS init to avoid WARNs

Yang Li (1):
      drm/amdkfd: Fix NULL pointer dereference in svm_migrate_to_ram()

Yifan Zhang (1):
      drm/amdgpu: set fb_modifiers_not_supported in vkms

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |   7 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |   2 +
 drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h     | 764 +++++++++++------=
----
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx10.asm |   6 +
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |   4 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   3 +
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |  11 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |   1 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c  |   4 +
 .../drm/amd/display/dc/dcn314/dcn314_resource.c    |   2 +-
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |   1 +
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |   4 +-
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.c |  10 +-
 .../dc/dml/dcn32/display_mode_vba_util_32.c        |   7 +-
 .../dc/dml/dcn32/display_mode_vba_util_32.h        |   3 +-
 .../display/dc/dml/dcn32/display_rq_dlg_calc_32.c  |   4 +-
 .../gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c |  15 +-
 .../drm/amd/display/dc/dml/display_mode_structs.h  |   3 +
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.c  |   2 +-
 drivers/gpu/drm/drm_format_helper.c                |  66 +-
 drivers/gpu/drm/i915/Makefile                      |   1 +
 drivers/gpu/drm/i915/display/intel_ddi.c           |  68 +-
 drivers/gpu/drm/i915/display/intel_display_core.h  |   8 +
 .../drm/i915/display/intel_display_power_well.c    |   7 +-
 drivers/gpu/drm/i915/display/intel_dkl_phy.c       | 109 +++
 drivers/gpu/drm/i915/display/intel_dkl_phy.h       |  24 +
 drivers/gpu/drm/i915/display/intel_dp.c            |   2 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |  59 +-
 drivers/gpu/drm/i915/display/intel_lvds.c          |   3 +-
 drivers/gpu/drm/i915/display/intel_panel.c         |   4 +-
 drivers/gpu/drm/i915/display/intel_panel.h         |   2 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c          |  64 +-
 drivers/gpu/drm/i915/gem/i915_gem_internal.c       |  19 +-
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c          |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c        |   2 +-
 drivers/gpu/drm/i915/i915_driver.c                 |   1 +
 drivers/gpu/drm/i915/i915_reg.h                    |   3 +
 drivers/gpu/drm/i915/i915_scatterlist.h            |  34 +-
 drivers/gpu/drm/imx/Kconfig                        |   1 -
 drivers/gpu/drm/imx/imx-tve.c                      |   5 +-
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c    |  26 +-
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        |   3 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c        |   5 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |  10 +-
 48 files changed, 824 insertions(+), 589 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_dkl_phy.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_dkl_phy.h
