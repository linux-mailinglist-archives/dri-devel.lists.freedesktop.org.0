Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35224426340
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 05:43:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D376E087;
	Fri,  8 Oct 2021 03:42:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D12536E087
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Oct 2021 03:42:53 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id t16so9181010eds.9
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Oct 2021 20:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=gzfRCng/ob32UAdS59rgRVkD8sP1P5E1PemtGQSpK3Q=;
 b=KhuPhs1dTdgJyiZffQ0ttkquY8w/UI7Q8m4krceYAF9q0HjPWJNWzEz1kLtFnm9H5i
 6FoZ7XqrQ2kIhW9u7/VYjDdlXd4/oehXIpLxgGYddQzKvFGjpc3cA4HBRWSZA8MGZwa4
 un8qrAF12KfZ7wlj1qzDwjMyp5WpNFPh7JPnmxBinN6cBc8lQ9OnnpOp7hTgOgOP9SdR
 01VN9JiWenM8ty4ai0TOt/46gC9Op81G0WBeGpYKIyWiuGgjvQSph+2qBmCs5MBIHeG/
 00Z154HrFkHXYnnqri/towwwcZlsJTzVIdXA0Y2ZY6sDyrVnKP5RXfuXILjgDED9AWEW
 ET5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=gzfRCng/ob32UAdS59rgRVkD8sP1P5E1PemtGQSpK3Q=;
 b=iUkSwu8eCVDsNDEUeYC8hs2yViCpshb2S2/SM7iCXQtYVxG91RJBoXb+xev+ucBkj1
 Vd/HsG0yqVhoBxdaOeyD/Yv7NmmF1pbdIFqNw8aeE2Xp1RaG+bO7NAZdFNkK2FrgA3Dd
 MgmKYOXQkqMpLJlnF3nwxSlt6FKA2vBbP2y/RpVangjHs9WYPglD83w4SBw8oZTEOKdc
 hqrDBPunnkmT4eEOJqy+t6p+3D0TtheX948n9+zYJFFB+GOLs7+mnzVaY3dlGXvK7QkQ
 Lea7+EtX4EgNkQ5orst6FtIYP10AybrEWJFdDhLPUVt+DOVRZvZhfDcX/AnNPAOYj+AO
 beIA==
X-Gm-Message-State: AOAM530OwD2AR2RNXVHT+sH6ZeYiNAbCKFyFedMb8EKI3kdNgRKi62lx
 VIgODjGTiGXnR6JG+dzkYmFz8ZS6C0P06Pg6gh8=
X-Google-Smtp-Source: ABdhPJyp+qZpg6yASkIJ5hdiLxk+3WaECOlbvCwut9OczSlrFHn2Y6OwIZqLgesVbLPWLSpUHayHR564cExXFxxPVvA=
X-Received: by 2002:a17:907:1199:: with SMTP id
 uz25mr1130137ejb.470.1633664572140; 
 Thu, 07 Oct 2021 20:42:52 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 8 Oct 2021 13:42:41 +1000
Message-ID: <CAPM=9txCVSSAQF8f_wR41sEBh_NjT-VSkbod6Pxcwb4dHu=WBw@mail.gmail.com>
Subject: [git pull] drm fixes for 5.15-rc5
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

I've returned from my tropical island retreat, even managed to bring
one of my kids on a dive with some turtles. Thanks to Daniel for doing
last week's work.

Otherwise this is the weekly fixes pull, it's a bit bigger because the
vc4 reverts in your tree caused some problems with fixes in the
drm-misc tree so it got left out last week, so this week has the misc
fixes rebased without the vc4 pieces. Otherwise it's i915, amdgpu with
the usual fixes and a scattering over other drivers.

I expect things should calm down a bit more next week.

Regards,
Dave.

drm-fixes-2021-10-08:
drm fixes for 5.15-rc5

core:
- Kconfig fix for fb_simple vs simpledrm.

i915:
- Fix RKL HDMI audio
- Fix runtime pm imbalance on i915_gem_shrink() error path
- Fix Type-C port access before hw/sw state sync
- Fix VBT backlight struct version/size check
- Fix VT-d async flip on SKL/BXT with plane stretch workaround

amdgpu:
- DCN 3.1 DP alt mode fixes
- S0ix gfxoff fix
- Fix DRM_AMD_DC_SI dependencies
- PCIe DPC handling fix
- DCN 3.1 scaling fix
- Documentation fix

amdkfd:
- Fix potential memory leak
- IOMMUv2 init fixes

vc4:
- compiler fix
- (there were some hdmi fixes but things got reverted, sort it out later)

nouveau:
- Cursor fix
- Fix ttm buffer moves for ampere gpu's by adding minimal acceleration supp=
ort.
- memory leak fixes

rockchip:
- crtc/clk fixup

panel:
- ili9341 Fix DT bindings indent
- y030xx067a - yellow tint init seq fix

gbefb:
- Fix gbefb when built with COMPILE_TEST.
The following changes since commit 9e1ff307c779ce1f0f810c7ecce3d95bbae40896=
:

  Linux 5.15-rc4 (2021-10-03 14:08:47 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-10-08

for you to fetch changes up to bf79045e0ef5f0fb2a0619f9d0782665d07b2d66:

  Merge tag 'amd-drm-fixes-5.15-2021-10-06' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2021-10-08
11:40:21 +1000)

----------------------------------------------------------------
drm fixes for 5.15-rc5

core:
- Kconfig fix for fb_simple vs simpledrm.

i915:
- Fix RKL HDMI audio
- Fix runtime pm imbalance on i915_gem_shrink() error path
- Fix Type-C port access before hw/sw state sync
- Fix VBT backlight struct version/size check
- Fix VT-d async flip on SKL/BXT with plane stretch workaround

amdgpu:
- DCN 3.1 DP alt mode fixes
- S0ix gfxoff fix
- Fix DRM_AMD_DC_SI dependencies
- PCIe DPC handling fix
- DCN 3.1 scaling fix
- Documentation fix

amdkfd:
- Fix potential memory leak
- IOMMUv2 init fixes

vc4:
- compiler fix
- (there were some hdmi fixes but things got reverted, sort it out later)

nouveau:
- Cursor fix
- Fix ttm buffer moves for ampere gpu's by adding minimal acceleration supp=
ort.
- memory leak fixes

rockchip:
- crtc/clk fixup

panel:
- ili9341 Fix DT bindings indent
- y030xx067a - yellow tint init seq fix

gbefb:
- Fix gbefb when built with COMPILE_TEST.

----------------------------------------------------------------
Alex Deucher (2):
      Documentation/gpu: remove spurious "+" in amdgpu.rst
      drm/amdgpu/display: fix dependencies for DRM_AMD_DC_SI

Arnd Bergmann (1):
      fbdev: simplefb: fix Kconfig dependencies

Ben Skeggs (3):
      drm/nouveau/kms/tu102-: delay enabling cursor until after assign_wind=
ows
      drm/nouveau/ga102-: support ttm buffer moves via copy engine
      drm/nouveau/fifo/ga102: initialise chid on return from channel creati=
on

Chris Morgan (1):
      drm/rockchip: Update crtc fixup to account for fractional clk change

Christophe Branchereau (1):
      drm/panel: abt-y030xx067a: yellow tint fix

Dave Airlie (3):
      Merge tag 'drm-intel-fixes-2021-10-07' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'drm-misc-fixes-2021-10-06' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'amd-drm-fixes-5.15-2021-10-06' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes

Edmund Dea (1):
      drm/kmb: Enable alpha blended second plane

George Shen (1):
      drm/amd/display: Skip override for preferred link settings
during link training

Guchun Chen (1):
      drm/amdgpu: handle the case of pci_channel_io_frozen only in
amdgpu_pci_resume

Hansen (1):
      drm/amd/display: Fix detection of 4 lane for DPALT

Imre Deak (1):
      drm/i915/tc: Fix TypeC port init/resume time sanitization

Jeremy Cline (1):
      drm/nouveau: avoid a use-after-free when BO init fails

Jernej Skrabec (1):
      drm/sun4i: dw-hdmi: Fix HDMI PHY clock setup

Jude Shih (1):
      drm/amd/display: USB4 bring up set correct address

Kai-Heng Feng (1):
      drm/i915/audio: Use BIOS provided value for RKL HDA link

Krzysztof Kozlowski (1):
      dt-bindings: panel: ili9341: correct indentation

Lang Yu (1):
      drm/amdkfd: fix a potential ttm->sg memory leak

Lijo Lazar (1):
      drm/amdgpu: During s0ix don't wait to signal GFXOFF

Liu, Zhan (2):
      drm/amd/display: Fix B0 USB-C DP Alt mode
      drm/amd/display: Fix DCN3 B0 DP Alt Mapping

Lukasz Majczak (1):
      drm/i915/bdb: Fix version check

Maarten Lankhorst (1):
      drm/i915: Fix runtime pm handling in i915_gem_shrink

Mark Brown (1):
      video: fbdev: gbefb: Only instantiate device when built for IP32

Maxime Ripard (1):
      drm/vc4: hdmi: Remove unused struct

Nikola Cornij (1):
      drm/amd/display: Limit display scaling to up to 4k for DCN 3.1

Randy Dunlap (1):
      DRM: delete DRM IRQ legacy midlayer docs

Ville Syrj=C3=A4l=C3=A4 (1):
      drm/i915: Extend the async flip VT-d w/a to skl/bxt

Yang Yingliang (2):
      drm/nouveau/kms/nv50-: fix file release memory leak
      drm/nouveau/debugfs: fix file release memory leak

Yifan Zhang (2):
      drm/amdkfd: remove redundant iommu cleanup code
      drm/amdgpu: init iommu after amdkfd device init

 .../bindings/display/panel/ilitek,ili9341.yaml     |   2 +-
 Documentation/gpu/amdgpu.rst                       |   4 +-
 Documentation/gpu/drm-internals.rst                |   9 -
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |  14 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |   8 +-
 drivers/gpu/drm/amd/display/Kconfig                |   2 +
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |   6 -
 .../drm/amd/display/dc/dcn10/dcn10_link_encoder.h  |   1 +
 .../amd/display/dc/dcn31/dcn31_dio_link_encoder.c  |  66 ++++-
 .../amd/display/dc/dcn31/dcn31_dio_link_encoder.h  |  14 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |   8 +-
 drivers/gpu/drm/amd/display/include/dal_asic_id.h  |   2 +-
 .../amd/include/asic_reg/dpcs/dpcs_4_2_0_offset.h  |  27 ++
 drivers/gpu/drm/i915/display/icl_dsi.c             |  10 +-
 drivers/gpu/drm/i915/display/intel_audio.c         |   5 +-
 drivers/gpu/drm/i915/display/intel_bios.c          |  22 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |   8 +-
 drivers/gpu/drm/i915/display/intel_display.c       |  20 +-
 drivers/gpu/drm/i915/display/intel_vbt_defs.h      |   5 +
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c       |   7 +-
 drivers/gpu/drm/i915/i915_reg.h                    |   5 +
 drivers/gpu/drm/i915/intel_pm.c                    |  12 +
 drivers/gpu/drm/kmb/kmb_drv.c                      |   8 +-
 drivers/gpu/drm/kmb/kmb_drv.h                      |   5 +
 drivers/gpu/drm/kmb/kmb_plane.c                    |  81 +++++-
 drivers/gpu/drm/kmb/kmb_plane.h                    |   5 +-
 drivers/gpu/drm/kmb/kmb_regs.h                     |   3 +
 drivers/gpu/drm/nouveau/dispnv50/crc.c             |   1 +
 drivers/gpu/drm/nouveau/dispnv50/head.c            |   2 +-
 drivers/gpu/drm/nouveau/include/nvif/class.h       |   2 +
 drivers/gpu/drm/nouveau/include/nvkm/engine/fifo.h |   1 +
 drivers/gpu/drm/nouveau/nouveau_bo.c               |   1 +
 drivers/gpu/drm/nouveau/nouveau_chan.c             |   6 +-
 drivers/gpu/drm/nouveau/nouveau_debugfs.c          |   1 +
 drivers/gpu/drm/nouveau/nouveau_drm.c              |   4 +
 drivers/gpu/drm/nouveau/nouveau_gem.c              |   4 +-
 drivers/gpu/drm/nouveau/nv84_fence.c               |   2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c  |   3 +
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/Kbuild    |   1 +
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c   | 311 +++++++++++++++++=
++++
 drivers/gpu/drm/nouveau/nvkm/subdev/top/ga100.c    |   7 +-
 drivers/gpu/drm/panel/panel-abt-y030xx067a.c       |   4 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |  26 +-
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c              |   7 +-
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h              |   4 +-
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c             |  97 ++++---
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |   8 -
 drivers/of/base.c                                  |   1 +
 drivers/video/fbdev/Kconfig                        |   5 +-
 drivers/video/fbdev/gbefb.c                        |   2 +-
 53 files changed, 712 insertions(+), 163 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c
