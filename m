Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A926A28C8
	for <lists+dri-devel@lfdr.de>; Sat, 25 Feb 2023 11:10:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A14A10E12B;
	Sat, 25 Feb 2023 10:10:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46FC310E1FA
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 00:10:31 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id i34so11948616eda.7
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 16:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FG34AE8MhUZ3fPb2VVOJazM6h86kRZhD0FvHH2BAnqA=;
 b=lKppD3b4Q1gMG71VWhGReXVl0AQyJ0iPWHTJeZX31sguGqZrPa/NjbMTjNcG8KvBcO
 +Im4vVjp8jff17hs7+VLrrD6aRwRlFU3dWgNk9I+u0kXVmgciSoHAq1YnCWUVUhFhY7N
 lz/3UwVcLVaw5EqcTiVxvjYJQLWvTsMwMmO1zncW9ZN4zPK5Q4a9wShNhNlOttJV6jdL
 C9SaBs/wldNUUVj6a1VrZVbayHDzGZlJvhjI4SZlPVwjoNDYcPU9VKI7/CjJtiAKw6Fj
 3nSJgGinGA4p1WsaoHjS/HBkWQj5pNvWnO6GEZXbmolso1mE3WFU1rxDOPfkZoYMop62
 gTOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FG34AE8MhUZ3fPb2VVOJazM6h86kRZhD0FvHH2BAnqA=;
 b=7rLB2VEv9FLETcJ0QFe3r+0FGEB4vOOG1FHHu1ULqzjO6CO11r8xrND22tnyKeftfI
 OtWIkthRajsGL/YmV23WEFNeilsB0zqN0gQOcfM5sfOebEJXOSvYVJkbVhC+VNcj+UvX
 pvrhUt8lbQuxNRTOp14qI+/DFk5e5mtGbTIs6BJotugABmzqOBc0f4hSmbVtVaZEQ074
 jSwxtjeSS1H0MuaolLEhaqnNxsaA3Lyg/GjpdTi/JoZNmBdbhMnxOdBmrPzkYxzKOOHj
 xEWhzyPCZ3mOJNLNES76BtXggNvu7szbCZN1nw9x3bWMpUwEUYu38vML6DCFtqT2Uhqk
 Z9CQ==
X-Gm-Message-State: AO0yUKUeswfzctPnFNEYf+OazRg2KjasObKL7SsQn+a66hLjyQWVBfy8
 cieyCshmXahbz/Y1hgW2m2S3jDxlJB2is9hYqao=
X-Google-Smtp-Source: AK7set8KbF9pVwe7S/+PNhub3Lh3KcLvb1yAeyqRoHPu9Ybckn8zIfNgzO9fip+oRbZW2rkQwxFio4kSUPTRkNPMyf8=
X-Received: by 2002:a50:c016:0:b0:4af:601d:ad1 with SMTP id
 r22-20020a50c016000000b004af601d0ad1mr2009474edb.0.1677111028765; Wed, 22 Feb
 2023 16:10:28 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 23 Feb 2023 10:10:14 +1000
Message-ID: <CAPM=9txhVJ3t_3-wMdWH7F+=_BbW19NYxAnm2cceP2uHR47_5w@mail.gmail.com>
Subject: drm next for 6.3-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 25 Feb 2023 10:10:08 +0000
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

This is the main drm feature pull request for 6.3. There are a bunch
of changes all over in the usual places. I got two conflicts when I
did a test pull, and I think you should be fine handling both of them,
one in amdgpu and one in i915, if you need help let me know. There
were some media/i2c common trees pulled but everything should be acked
fine from those.

Highlights:
- habanalabs moves from misc to accel
- first accel driver for Intel VPU (Versatile Processing Unit) inference en=
gine
- dropped all the ancient legacy DRI1 drivers. I think it's been at
least 10 years since anyone has heard about these.
- Intel DG2 updates and prelim Meteorlake enablement
- etnaviv adds support for Versilicon NPU device (a GPU like engine
with inference accelerators)

Dave.

drm-next-2023-02-23:
drm next for 6.3-rc1

Removals:
- remove legacy dri1 drivers -
- i810, mga, r128, savage, sis, tdfx, via

New driver:
- intel VPU accelerator driver
- habanalabs comes via drm tree now

drm/core:
- use drm_dbg_ helpers in several places
- Document defaults for CRTC backgrounds
- Document use of drm_minor

edid:
- improve mode parsing and refactoring

connector:
- support analog TV mode property

media:
- add some common formats

udmabuf:
- add vmap/vunmap methods

fourcc:
- add XRGB1555 and RGB565 formats
- document open source user waiver

firmware:
- fix color-format selection for system framebuffer

format-helper:
- Add conversion from XRGB8888 to various sysfb formats
- Make XRGB8888 the only driver-emulated legacy format
- Add conversion from XRGB8888 to XBGR8888 and ABGR8888

fb-helper:
- fix preferred depth and bpp values across drivers
- Avoid blank consoles from selecting an incorrect color format

probe-helper:
- Enable/disable HPD on connectors

scheduler:
- Fix lockup in drm_sched_entity_kill()
- Deprecate drm_sched_resubmit_jobs()

bridge:
- remove unused functions
- implement i2c probe_new in various drivers
- ite-it6505: Locking fixes, Cache EDID data
- ite-it66121: Support IT6610 chip
- lontium-tl9611: Fix HDMI on DragonBoard 845c
- parade-ps8640: Use atomic bridge functions
- Support i.MX93 LDB plus DT bindings

debugfs:
- add per device helpers and convert drivers

displayport:
- mst fixes
- add DP adaptive sync DPCD definitions

fbdev:
- always pick 32bpp as default
- remove some unused code

simpledrm:
- support system memory framebuffers

panel:
- add orientation quirks for Lenovo Yoga Tab 3 X90F and DynaBook K50
- Use ktime_get_boottime() to measure power-down delay
- Fix auto-suspend delay
- Visionox VTDR6130 AMOLED DSI
- Support Himax HX8394
- Convert many drivers to common generic DSI write-sequence helper
- AUO A030JTN01

ttm:
- drop bo wait wrapper
- fix MIPS build

habanalabs:
- moved driver to accel subsystem
- gaudi2 decoder error improvement
- more trace events
- Gaudi2 abrupt reset by firmware support
- add uAPI to flush memory transactions
- add uAPI to pass through userspace reqs to fw
- remove dma-buf export by handle

amdgpu:
- add new INFO queries for peak and min sclk/mclk for profile modes
- Add PCIe info to the INFO IOCTL
- secure display support for multiple displays
- DML optimizations
- DCN 3.2 updates
- PSR updates
- DP 2.1 updates
- SR-IOV RAS updates
- VCN RAS support
- SMU 13.x updates
- Switch 1 element arrays to flexible arrays
- Add RAS support for DF 4.3
- Stack size improvements
- S0ix rework
- Allow 0 as a vram limit on APUs
- Handle profiling modes for SMU13.x
- Fix possible segfault in failure case
- Rework FW requests to happen in early_init for all IPs so
  that we don't lose the sbios console if FW is missing
- Fix power reporting on certain firmwares for CZN/RN
- Allow S0ix without BIOS support
- Enable freesync over PCon
- Re-enable the AGP aperture on GMC 11.x

amdkfd:
- Error handling fixes
- PASID fixes
- Fix for cleared VRAM BOs
- Fix cleanup if GPUVM creation fails
- Memory accounting fix
- Use resource_size rather than open codeing it
- GC11 mGPU fix

radeon:
- Switch 1 element arrays to flexible arrays
- Fix memory leak on shutdown
- move to new logging

i915:
- Meteorlake display/OA/GSC fw/workarounds enabling
- DP MST DSC support
- Gamma/degamma readout support for the state checker
- Enable SDP split support for DP 2.0
- Add probe blocking support to i915.force_probe parameter
- Enable Xe HP 4tile support
- Avoid display direct calls to uncore
- Fix HuC delayed load memory leaks
- Add DG2 workarounds Wa_18018764978 and Wa_18019271663
- Improve suspend / resume times with VT-d scanout workaround active
- Fix DG2 visual corruption on small BAR systems by not forgetting to
copy CCS aux state
- Fix TLB invalidation for Gen12.50 video and compute engines
- Enable HF-EEODB by switching HDMI, DP and LVDS to use struct drm_edid
- Start using unversioned DMC firmware paths for new platforms
- ELD refactor: Stop using hardware buffer, precompute ELD
- lots of display code refactoring

nouveau:
- drop legacy ioctl support
- replace 0-sized array

msm:
- dpu/dsi/mdss: Support for SM8350, SM8450 SM8550 and SC8280XP platform
- Added bindings for SM8150
- dpu: Partial support for DSC on SM8150 and SM8250
- dpu: Fixed color transformation matrix being lost on suspend/resume
- dp: Support SDM845 and SC8280XP platforms
- dp: Support for limiting DP link rate via DT property
- dsi: Validate display modes according to the DSI OPP table
- dsi: DSI PHY support for the SM6375 platform
- Add MSM_SUBMIT_BO_NO_IMPLICI
- a2xx: Support to load legacy firmware
- a6xx: GPU devcore dump updates for a650/a660
- GPU devfreq tuning and fixes
- Turn 8960 HDMI PHY into clock provider,
- Make 8960 HDMI PHY use PXO clock from DT

etnaviv:
- experimental versilicon NPU support
- report GPU load via fdinfo format
- MMU fault message improvements

tegra:
- rework syncpoint interrupt

mediatek:
- DSI timing fix
- fix config deps

ast:
- various fixes

exynos:
- restore bridge chain order fixes

gud:
- convert to shadow plane buffers
- perform flushing synchronously during atomic update
- Use new debugfs helpers

arm/hdlcd:
- Use new debugfs helper

ili9486:
- Support 16-bit pixel data

imx:
- Split off IPUv3 driver

mipi-dbi:
- convert to DRM shadow-plane helpers
- rsp driver changes
- Support separate I/O-voltage supply

mxsfb:
- Depend on ARCH_MXS or ARCH_MXC

sun4i:
- convert to new TV mode property

vc4:
- convert to new TV mode property
- kunit tests
- Support RGB565 and RGB666 formats
- convert dsi driver to bridge
- Various HVS an CRTC fixes

v3d:
- Do not opencode drm_gem_object_lookup()

virtio:
- improve tracing

vkms:
- support small cursors in IGT tests
- Fix SEGFAULT from incorrect GEM-buffer mapping

rcar-du:
- fixes and improvements
The following changes since commit 6d796c50f84ca79f1722bb131799e5a5710c4700=
:

  Linux 6.2-rc6 (2023-01-29 13:59:43 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-next-2023-02-23

for you to fetch changes up to a48bba98380cb0b43dcd01d276c7efc282e3c33f:

  msm/fbdev: fix unused variable warning with clang. (2023-02-23 09:48:05 +=
1000)

----------------------------------------------------------------
drm next for 6.3-rc1

Removals:
- remove legacy dri1 drivers -
- i810, mga, r128, savage, sis, tdfx, via

New driver:
- intel VPU accelerator driver
- habanalabs comes via drm tree now

drm/core:
- use drm_dbg_ helpers in several places
- Document defaults for CRTC backgrounds
- Document use of drm_minor

edid:
- improve mode parsing and refactoring

connector:
- support analog TV mode property

media:
- add some common formats

udmabuf:
- add vmap/vunmap methods

fourcc:
- add XRGB1555 and RGB565 formats
- document open source user waiver

firmware:
- fix color-format selection for system framebuffer

format-helper:
- Add conversion from XRGB8888 to various sysfb formats
- Make XRGB8888 the only driver-emulated legacy format
- Add conversion from XRGB8888 to XBGR8888 and ABGR8888

fb-helper:
- fix preferred depth and bpp values across drivers
- Avoid blank consoles from selecting an incorrect color format

probe-helper:
- Enable/disable HPD on connectors

scheduler:
- Fix lockup in drm_sched_entity_kill()
- Deprecate drm_sched_resubmit_jobs()

bridge:
- remove unused functions
- implement i2c probe_new in various drivers
- ite-it6505: Locking fixes, Cache EDID data
- ite-it66121: Support IT6610 chip
- lontium-tl9611: Fix HDMI on DragonBoard 845c
- parade-ps8640: Use atomic bridge functions
- Support i.MX93 LDB plus DT bindings

debugfs:
- add per device helpers and convert drivers

displayport:
- mst fixes
- add DP adaptive sync DPCD definitions

fbdev:
- always pick 32bpp as default
- remove some unused code

simpledrm:
- support system memory framebuffers

panel:
- add orientation quirks for Lenovo Yoga Tab 3 X90F and DynaBook K50
- Use ktime_get_boottime() to measure power-down delay
- Fix auto-suspend delay
- Visionox VTDR6130 AMOLED DSI
- Support Himax HX8394
- Convert many drivers to common generic DSI write-sequence helper
- AUO A030JTN01

ttm:
- drop bo wait wrapper
- fix MIPS build

habanalabs:
- moved driver to accel subsystem
- gaudi2 decoder error improvement
- more trace events
- Gaudi2 abrupt reset by firmware support
- add uAPI to flush memory transactions
- add uAPI to pass through userspace reqs to fw
- remove dma-buf export by handle

amdgpu:
- add new INFO queries for peak and min sclk/mclk for profile modes
- Add PCIe info to the INFO IOCTL
- secure display support for multiple displays
- DML optimizations
- DCN 3.2 updates
- PSR updates
- DP 2.1 updates
- SR-IOV RAS updates
- VCN RAS support
- SMU 13.x updates
- Switch 1 element arrays to flexible arrays
- Add RAS support for DF 4.3
- Stack size improvements
- S0ix rework
- Allow 0 as a vram limit on APUs
- Handle profiling modes for SMU13.x
- Fix possible segfault in failure case
- Rework FW requests to happen in early_init for all IPs so
  that we don't lose the sbios console if FW is missing
- Fix power reporting on certain firmwares for CZN/RN
- Allow S0ix without BIOS support
- Enable freesync over PCon
- Re-enable the AGP aperture on GMC 11.x

amdkfd:
- Error handling fixes
- PASID fixes
- Fix for cleared VRAM BOs
- Fix cleanup if GPUVM creation fails
- Memory accounting fix
- Use resource_size rather than open codeing it
- GC11 mGPU fix

radeon:
- Switch 1 element arrays to flexible arrays
- Fix memory leak on shutdown
- move to new logging

i915:
- Meteorlake display/OA/GSC fw/workarounds enabling
- DP MST DSC support
- Gamma/degamma readout support for the state checker
- Enable SDP split support for DP 2.0
- Add probe blocking support to i915.force_probe parameter
- Enable Xe HP 4tile support
- Avoid display direct calls to uncore
- Fix HuC delayed load memory leaks
- Add DG2 workarounds Wa_18018764978 and Wa_18019271663
- Improve suspend / resume times with VT-d scanout workaround active
- Fix DG2 visual corruption on small BAR systems by not forgetting to
copy CCS aux state
- Fix TLB invalidation for Gen12.50 video and compute engines
- Enable HF-EEODB by switching HDMI, DP and LVDS to use struct drm_edid
- Start using unversioned DMC firmware paths for new platforms
- ELD refactor: Stop using hardware buffer, precompute ELD
- lots of display code refactoring

nouveau:
- drop legacy ioctl support
- replace 0-sized array

msm:
- dpu/dsi/mdss: Support for SM8350, SM8450 SM8550 and SC8280XP platform
- Added bindings for SM8150
- dpu: Partial support for DSC on SM8150 and SM8250
- dpu: Fixed color transformation matrix being lost on suspend/resume
- dp: Support SDM845 and SC8280XP platforms
- dp: Support for limiting DP link rate via DT property
- dsi: Validate display modes according to the DSI OPP table
- dsi: DSI PHY support for the SM6375 platform
- Add MSM_SUBMIT_BO_NO_IMPLICI
- a2xx: Support to load legacy firmware
- a6xx: GPU devcore dump updates for a650/a660
- GPU devfreq tuning and fixes
- Turn 8960 HDMI PHY into clock provider,
- Make 8960 HDMI PHY use PXO clock from DT

etnaviv:
- experimental versilicon NPU support
- report GPU load via fdinfo format
- MMU fault message improvements

tegra:
- rework syncpoint interrupt

mediatek:
- DSI timing fix
- fix config deps

ast:
- various fixes

exynos:
- restore bridge chain order fixes

gud:
- convert to shadow plane buffers
- perform flushing synchronously during atomic update
- Use new debugfs helpers

arm/hdlcd:
- Use new debugfs helper

ili9486:
- Support 16-bit pixel data

imx:
- Split off IPUv3 driver

mipi-dbi:
- convert to DRM shadow-plane helpers
- rsp driver changes
- Support separate I/O-voltage supply

mxsfb:
- Depend on ARCH_MXS or ARCH_MXC

sun4i:
- convert to new TV mode property

vc4:
- convert to new TV mode property
- kunit tests
- Support RGB565 and RGB666 formats
- convert dsi driver to bridge
- Various HVS an CRTC fixes

v3d:
- Do not opencode drm_gem_object_lookup()

virtio:
- improve tracing

vkms:
- support small cursors in IGT tests
- Fix SEGFAULT from incorrect GEM-buffer mapping

rcar-du:
- fixes and improvements

----------------------------------------------------------------
Aaron Liu (1):
      drm/amdgpu: update ta_secureDisplay_if.h to v27.00.00.08

Abel Vesa (2):
      drm/panel-edp: fix name for IVO product id 854b
      drm/panel-edp: add IVO M133NW4J panel entry

Abhinav Kumar (2):
      drm/msm/dsi: add a helper method to compute the dsi byte clk
      drm/msm/dsi: implement opp table based check for
dsi_mgr_bridge_mode_valid()

Adam Skladowski (1):
      dt-bindings: msm: dsi-phy-28nm: Document fam-b compatible

Akhil P Oommen (4):
      drm/msm/adreno: Fix null ptr access in adreno_gpu_cleanup()
      drm/msm: Fix failure paths in msm_drm_init()
      drm/msm/a6xx: Update a6xx gpu coredump
      drm/msm/a6xx: Update ROQ size in coredump

Alaa Emad (1):
      drm/vkms: change min cursor size to accept smaller values

Alan Liu (3):
      drm/amd/display: Implement multiple secure display
      drm/amd/display: Fix when disabling secure_display
      drm/amd/display: Improvements in secure display

Alan Previn (2):
      drm/i915/pxp: Promote pxp subsystem to top-level of i915
      drm/i915/pxp: Use drm_dbg if arb session failed due to fw version

Alex Deucher (31):
      drm/amdgpu/gmc9: don't touch gfxhub registers during S0ix
      drm/amdgpu/gmc10: don't touch gfxhub registers during S0ix
      drm/amdgpu/gmc11: don't touch gfxhub registers during S0ix
      drm/amdgpu: don't mess with SDMA clock or powergating in S0ix
      drm/amdgpu: for S0ix, skip SDMA 5.x+ suspend/resume
      Revert "drm/amdgpu: disallow gfxoff until GC IP blocks complete
s2idle resume"
      Revert "drm/amdgpu: force exit gfxoff on sdma resume for rmb s0ix"
      drm/amdgpu: skip MES for S0ix as well since it's part of GFX
      drm/amdkfd: simplify cases
      drm/amdgpu/pm: update hwmon power documentation
      drm/amdgpu/nv: don't expose AV1 if VCN0 is harvested
      drm/amdgpu/vcn3: fail to schedule IB for AV1 if VCN0 is harvested
      drm/amdgpu/soc21: don't expose AV1 if VCN0 is harvested
      drm/amdgpu/vcn4: fail to schedule IB for AV1 if VCN0 is harvested
      drm/amd/display: disable S/G display on DCN 3.1.5
      drm/amd/display: disable S/G display on DCN 3.1.4
      Documentation/gpu: update dGPU asic info table
      drm/amdgpu/vcn4: add missing encoder cap
      drm/amd/display: Properly handle additional cases where DCN is
not supported
      drm/amd/display: disable S/G display on DCN 2.1.0
      drm/amd/display: disable S/G display on DCN 3.1.2/3
      drm/amd/display: properly handling AGP aperture in vm setup
      Revert "Revert "drm/amdgpu/gmc11: enable AGP aperture""
      Revert "drm/amd/display: disable S/G display on DCN 3.1.4"
      drm/amd/pm/smu7: move variables to where they are used
      drm/amdgpu/gmc11: fix system aperture set when AGP is enabled
      drm/amd/display: minor cleanup of vm_setup
      drm/amdgpu: add S/G display parameter
      Revert "drm/amd/display: disable S/G display on DCN 3.1.2/3"
      Revert "drm/amd/display: disable S/G display on DCN 2.1.0"
      Revert "drm/amd/display: disable S/G display on DCN 3.1.5"

Alexander Stein (2):
      drm/bridge: sii902x: Use dev_err_probe
      drm: bridge: ldb: Warn if LDB clock does not match requested
link frequency

Alexey Kodanev (1):
      drm/amd/display: drop unnecessary NULL checks in debugfs

Allen Ballway (1):
      drm: panel-orientation-quirks: Add quirk for DynaBook K50

Allen-KH Cheng (1):
      dt-bindings: display: mediatek: Fix the fallback for
mediatek,mt8186-disp-ccorr

Alvin Lee (12):
      drm/amd/display: Block subvp if center timing is in use
      drm/amd/display: Clear link res when merging a pipe split
      drm/amd/display: Block FPO / SubVP (DRR) on HDMI VRR configs
      drm/amd/display: Turn on phantom OTG before disabling phantom pipe
      drm/amd/display: Request min clocks after disabling pipes on init
      drm/amd/display: Allow subvp on vactive pipes that are 2560x1440@60
      drm/amd/display: Allow idle optimization after turning off all pipes
      drm/amd/display: Disable SubVP for PSR panels
      drm/amd/display: Use |=3D when assigning wm_optimized_required
      drm/amd/display: Set init freq for DCFCLK DS
      drm/amd/display: Set max vratio for prefetch to 7.9 for YUV420 MPO
      drm/amd/display: Fix prefetch vratio check

Andi Shyti (2):
      drm/i915: Limit the display memory alignment to 32 bit instead of 64
      Revert "drm/i915: Improve on suspend / resume time with VT-d enabled"

Andrew Davis (1):
      drm/tidss: Set max DMA segment size

Andrzej Hajda (4):
      drm/i915: remove struct_member macro
      drm/i915: fix TLB invalidation for Gen12.50 video and compute engines
      drm/i915: use proper helper in igt_vma_move_to_active_unlocked
      drm/i915/selftest: use igt_vma_move_to_active_unlocked if possible

Andrzej Kacprowski (2):
      accel/ivpu: Fix FW API data alignment issues
      accel/ivpu: Send VPU_JSM_MSG_CONTEXT_DELETE when deleting context

Animesh Manna (1):
      drm/i915/mtl: update scaler source and destination limits for MTL

Ankit Nautiyal (4):
      drm/i915/ddi: Align timeout for DDI_BUF_CTL active with Bspec
      drm/i915/ddi: Add missing wait-for-active for HDMI aligning with
bspec updates
      drm/i915/display: Drop check for doublescan mode in modevalid
      drm/i915/display: Prune Interlace modes for Display >=3D12

Anthony Koo (2):
      drm/amd/display: [FW Promotion] Release 0.0.150.0
      drm/amd/display: [FW Promotion] Release 0.0.153.0

Anusha Srivatsa (3):
      drm/i915/display: Add missing checks for cdclk crawling
      drm/i915/display: Add CDCLK Support for MTL
      drm/i915/display: Add missing CDCLK Squash support for MTL

Aravind Iddamsetty (1):
      drm/i915/mtl: Media GT and Render GT share common GGTT

Aric Cyr (10):
      drm/amd/display: 3.2.216
      drm/amd/display: Reorder dc_state fields to optimize clearing the str=
uct
      drm/amd/display: 3.2.217
      drm/amd/display: 3.2.218
      drm/amd/display: 3.2.219
      drm/amd/display: 3.2.220
      drm/amd/display: Revert "avoid disable otg when dig was disabled"
      drm/amd/display: 3.2.221
      drm/amd/display: 3.2.222
      drm/amd/display: Promote DAL to 3.2.223

Arnd Bergmann (12):
      drm/amd/display: fix duplicate assignments
      drm/amd/pm: avoid large variable on kernel stack
      drm: panel: visionox: add backlight dependency
      vc4: fix build failure in vc4_dsi_dev_probe()
      drm/amd/display: fix dp_retrieve_lttpr_cap() return value
      drm/amd/display: fix hdmi_encoded_link_bw definition
      drm/i915/selftest: fix intel_selftest_modify_policy argument types
      accel: fix CONFIG_DRM dependencies
      accel/ivpu: avoid duplicate assignment
      drm/vc4: allow DRM_VC4_KUNIT_TEST to be a loadable module
      drm/amdgpu: fix enum odm_combine_mode mismatch
      drm/amd/display: fix link_validation build failure

Arthur Grillo (6):
      drm/amd/display: Turn global functions into static
      drm/amd/display: Add function prototypes to headers
      drm/amd/amdgpu: Add function prototypes to headers
      drm/amd/display: Add previously missing includes
      drm/amd/display: Fix excess arguments on kernel-doc
      drm/amd/display: Make variables declaration inside ifdef guard

Arun R Murthy (1):
      drm/i915/dp: change aux_ctl reg read to polling read

Asahi Lina (1):
      drm/shmem-helper: Fix locking for drm_gem_shmem_get_pages_sgt()

Ashutosh Dixit (2):
      drm/i915/hwmon: Silence "mailbox access failed" warning in snb_pcode_=
read
      drm/i915/hwmon: Display clamped PL1 limit

Aurabindo Pillai (9):
      drm/amd/display: set ignore msa parameter only if freesync is enabled
      Revert "drm/amd/display: Demote Error Level When ODM Transition Suppo=
rted"
      drm/amd/display: fix an error check condition for synced pipes
      drm/amd/display: Revert "ignore msa parameter only if freesync is ena=
bled"
      drm/amd/display: set allow_freesync parameter in DM
      drm/amd/display: Fix timing not changning when freesync video is enab=
led
      drm/amd/display: Fix null pointer deref error on rotation
      drm/amd/display: fix k1 k2 divider programming for phantom streams
      drm/amd/display: disable SubVP + DRR to prevent underflow

Ayush Gupta (1):
      drm/amd/display: temporary fix for page faulting

Bagas Sanjaya (3):
      Documentation: accel: escape wildcard in special file path
      habanalabs: Fix list of /sys/class/habanalabs/hl<n>/status
      drm/i915/doc: Escape wildcard in method names

Bhawanpreet Lakha (3):
      drm/amd/display: Fix dsc mismatch of acquire and validation of dsc en=
gine
      drm/amd/display: Change i2c speed for hdcp
      drm/amd/display: Add support for multiple overlay planes

Biju Das (1):
      dt-bindings: display: bridge: renesas,rzg2l-mipi-dsi: Document
RZ/V2L support

Bjorn Andersson (10):
      dt-bindings: msm/dp: Add SDM845 and SC8280XP compatibles
      drm/msm/dp: Stop using DP id as index in desc
      drm/msm/dp: Add DP and EDP compatibles for SC8280XP
      drm/msm/dp: Add SDM845 DisplayPort instance
      drm/msm/dp: Rely on hpd_enable/disable callbacks
      drm/msm/dp: Implement hpd_notify()
      dt-bindings: display/msm: Add binding for SC8280XP MDSS
      drm/msm/dpu: Introduce SC8280XP
      drm/msm: Introduce SC8280XP MDSS
      drm/msm/dp: Remove INIT_SETUP delay

Brandon Syu (1):
      drm/amd/display: fix mapping to non-allocated address

Bryan O'Donoghue (3):
      dt-bindings: msm: dsi-controller-main: Add vdd* descriptions back in
      dt-bindings: msm: dsi-controller-main: Add compatible strings
for every current SoC
      dt-bindings: msm: dsi-controller-main: Document clocks on a per
compatible basis

Cai Huoqing (10):
      drm: Remove the obsolete driver-i810
      drm: Remove the obsolete driver-mga
      drm: Remove the obsolete driver-r128
      drm: Remove the obsolete driver-savage
      drm: Remove the obsolete driver-sis
      drm: Remove the obsolete driver-tdfx
      drm: Remove the obsolete driver-via
      drm: Add comments to Kconfig
      drm: Remove some obsolete drm pciids(tdfx, mga, i810, savage,
r128, sis, via)
      MAINTAINERS: Remove some obsolete drivers info(tdfx, mga, i810,
savage, r128, sis)

Candice Li (3):
      drm/amdgpu: Add df v4_3 headers
      drm/amdgpu: Add poison mode query for df v4_3
      drm/amd/pm: Support RAS fatal error mode1 reset on smu v13_0_0
and v13_0_10

Carlo Caione (2):
      drm/tiny: ili9486: Enable driver module autoloading
      drm/tiny: ili9486: Do not assume 8-bit only SPI controllers

Carmit Carmel (1):
      habanalabs/gaudi2: fix log for sob value overflow/underflow

Charlene Liu (4):
      Revert "drm/amd/display: correct static_screen_event_mask"
      drm/amd/display: add hubbub_init related
      drm/amd/display: contional remove disable dig_fifo when blank
      drm/amd/display: add NULL pointer check

Chris Morgan (2):
      media: uapi: add MEDIA_BUS_FMT_RGB565_1X24_CPADHI
      drm/vc4: dpi: Support RGB565 format

Chris Wilson (9):
      drm/i915: Wrap all access to i915_vma.node.start|size
      drm/i915: Introduce guard pages to i915_vma
      drm/i915: Refine VT-d scanout workaround
      drm/i915/migrate: Account for the reserved_space
      drm/i915/gem: Typecheck page lookups
      drm/i915: Check for integer truncation on scatterlist creation
      drm/i915: Remove truncation warning for large objects
      drm/i915/gt: Reset twice
      drm/i915/selftests: Unwind hugepages to drop wakeref on error

Christian Gmeiner (1):
      drm/etnaviv: print MMU exception cause

Christian K=C3=B6nig (24):
      drm/ttm: remove ttm_bo_(un)lock_delayed_workqueue
      drm/ttm: use per BO cleanup workers
      drm/ttm: merge ttm_bo_api.h and ttm_bo_driver.h v2
      drm/ttm: use ttm_bo_wait_ctx instead of ttm_bo_wait
      drm/i915: stop using ttm_bo_wait
      drm/qxl: stop using ttm_bo_wait
      drm/amdgpu: use VRAM|GTT for a bunch of kernel allocations
      drm/amdgpu: rename vram_scratch into mem_scratch
      drm/amdgpu: cleanup visible vram size handling
      drm/amdgpu: allow zero as vram limit
      drm/ttm: fix some minor kerneldoc issues
      drm/amdgpu: fix cleaning up reserved VMID on release
      drm/amdgpu: fix amdgpu_job_free_resources v2
      drm/scheduler: cleanup define
      drm/scheduler: deprecate drm_sched_resubmit_jobs
      drm/nouveau: stop using ttm_bo_wait
      drm/ttm/vmwgfx: move ttm_bo_wait into VMWGFX
      drm/i915: audit bo->resource usage v3
      drm/ttm: stop allocating dummy resources during BO creation
      drm/ttm: stop allocating a dummy resource for pipelined gutting
      drm/ttm: prevent moving of pinned BOs
      drm/ttm: revert "prevent moving of pinned BOs"
      drm/ttm: revert "stop allocating a dummy resource for pipelined gutti=
ng"
      drm/ttm: revert "stop allocating dummy resources during BO creation"

Christophe Branchereau (3):
      drm/panel: add the orisetech ota5601a
      dt-bindings: display/panel: Add the Focaltech gpt3
      drm/panel: Add driver for the AUO A030JTN01 TFT LCD

ChunyouTang (1):
      drm/gem-shmem: When drm_gem_object_init failed, should release object

Colin Ian King (2):
      accel/ivpu: Fix spelling mistake "tansition" -> "transition"
      drm/amd/display: Fix spelling mistakes of function name in error mess=
age

Cruise Hung (1):
      drm/amd/display: Fix DPIA link encoder assignment issue

Dan Carpenter (2):
      drm/amdgpu: Add a missing tab
      drm/simpledrm: Fix an NULL vs IS_ERR() bug

Dani Liberman (5):
      habanalabs/gaudi2: remove use of razwi info received from f/w
      habanalabs/gaudi2: read mmio razwi information
      habanalabe/gaudi2: add cfg base when displaying razwi addresses
      habanalabs/gaudi2: print page fault axi transaction id
      habanalabs/gaudi2: fix emda range registers razwi handling

Daniel Mentz (1):
      drm/mipi-dsi: Fix byte order of 16-bit DCS set/get brightness

Daniel Miess (4):
      drm/amd/display: Correct bw_params population
      drm/amd/display: Add missing brackets in calculation
      drm/amd/display: Adjust downscaling limits for dcn314
      Revert "drm/amd/display: Correct bw_params population"

Daniel Vetter (8):
      Merge tag 'drm-misc-next-2022-11-24' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'drm-misc-next-2023-01-03' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      drm/fourcc: Document open source user waiver
      drm: document better that drivers shouldn't use drm_minor directly
      Merge tag 'drm-intel-gt-next-2023-01-18' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'drm-misc-next-2023-01-19' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge v6.2-rc6 into drm-next
      Merge tag 'drm-misc-next-fixes-2023-02-09' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next

Daniele Ceraolo Spurio (8):
      drm/i915/huc: fix leak of debug object in huc load fence on driver un=
load
      drm/i915/huc: always init the delayed load fence
      drm/i915/guc: enable GuC GGTT invalidation from the start
      drm/i915/uc: Introduce GSC FW
      drm/i915/gsc: Skip the version check when fetching the GSC FW
      drm/i915/gsc: GSC firmware loading
      drm/i915/gsc: Do a driver-FLR on unload if GSC was loaded
      drm/i915/mtl: MTL has one GSC CS on the media GT

Danilo Krummrich (1):
      dma-buf: actually set signaling bit for private stub fences

Darrell Kavanagh (1):
      drm: panel-orientation-quirks: Add quirk for Lenovo IdeaPad Duet 3 10=
IGL5

Dave Airlie (25):
      Merge tag 'amd-drm-next-6.3-2023-01-06' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'amd-drm-next-6.3-2023-01-13' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-misc-next-2023-01-12' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'drm-intel-next-2023-01-12' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'amd-drm-next-6.3-2023-01-20' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-misc-next-2023-01-24' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      amdgpu: fix build on non-DCN platforms.
      Merge tag 'drm-misc-next-2023-01-26' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'drm-habanalabs-next-2023-01-26' of
https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux into
drm-next
      Merge tag 'drm-intel-next-2023-01-27' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'drm-next-20230127' of
git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux into
drm-next
      Merge tag 'drm/tegra/for-6.3-rc1' of
https://gitlab.freedesktop.org/drm/tegra into drm-next
      Merge tag 'amd-drm-next-6.3-2023-01-27' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'exynos-drm-next-for-v6.3' of
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into
drm-next
      Merge tag 'mediatek-drm-next-6.3' of
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux
into drm-next
      Merge tag 'drm-msm-next-2023-01-30' of
https://gitlab.freedesktop.org/drm/msm into drm-next
      Merge tag 'drm-intel-gt-next-2023-02-01' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'drm-misc-next-fixes-2023-02-02' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'amd-drm-next-6.3-2023-02-03' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge branch 'etnaviv/next' of
https://git.pengutronix.de/git/lst/linux into drm-next
      Merge tag 'drm-misc-next-fixes-2023-02-16' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'amd-drm-next-6.3-2023-02-17' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-intel-next-fixes-2023-02-17' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'drm-misc-next-fixes-2023-02-21' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      msm/fbdev: fix unused variable warning with clang.

Dave Stevenson (25):
      drm/vc4: dpi: Change the default DPI format to being 18bpp, not 24.
      drm/vc4: dpi: Fix format mapping for RGB565
      drm/mediatek: dp: Replace usage of drm_bridge_chain_ functions
      drm/bridge: Introduce pre_enable_prev_first to alter bridge init orde=
r
      drm/panel: Add prepare_prev_first flag to drm_panel
      drm/bridge: Document the expected behaviour of DSI host controllers
      drm/vc4: dsi: Rename bridge to out_bridge
      drm/vc4: dsi: Move initialisation to encoder_mode_set
      drm/vc4: dsi: Remove splitting the bridge chain from the driver
      drm/vc4: dsi: Convert to use atomic operations
      drm/vc4: dsi: Convert to using a bridge instead of encoder
      drm/vc4: dsi: Remove entry to ULPS from vc4_dsi post_disable
      drm/bridge: panel: Set pre_enable_prev_first from drmm_panel_bridge_a=
dd
      drm/vc4: hvs: Configure the HVS COB allocations
      drm/vc4: hvs: Set AXI panic modes
      drm/vc4: hvs: SCALER_DISPBKGND_AUTOHS is only valid on HVS4
      drm/vc4: hvs: Correct interrupt masking bit assignment for HVS5
      drm/vc4: hvs: Support zpos on all planes
      drm/vc4: hvs: Fix colour order for xRGB1555 on HVS5
      drm/vc4: hvs: Add DRM 210101010 RGB formats
      drm/vc4: plane: Allow using 0 as a pixel order value
      drm/vc4: plane: Omit pixel_order from the hvs_format for hvs5 only fo=
rmats
      drm/vc4: plane: Add 3:3:2 and 4:4:4:4 RGB/RGBX/RGBA formats
      drm/vc4: Add comments for which HVS_PIXEL_ORDER_xxx defines apply
      drm/vc4: hdmi: Correct interlaced timings again

David (Ming Qiang) Wu (1):
      drm/amdgpu: limit AV1 to the first instance on VCN4 encode

Deepak R Varma (15):
      drm/sprd: remove redundant error logging
      drm/amdkfd: Use resource_size() helper function
      drm/amd/display: No need for Null pointer check before kfree
      drm/i915/display: Avoid full proxy f_ops for DRRS debug attributes
      drm/i915/fbc: Avoid full proxy f_ops for FBC debug attributes
      drm/amd/display: Conversion to bool not necessary
      drm/amd/pm/powerplay/smumgr: use bitwise or for addition
      drm/amd/pm/powerplay/hwmgr: use bitwise or for bitmasks addition
      drm/amd/pm/powerplay/smumgr/ci: use bitwise or for bitmasks addition
      drm/amd/display: use swap() helper macro in bios_parser
      drm/i915/display: Convert i9xx_pipe_crc_auto_source to void
      drm/nouveau/devinit: Convert function disable() to be void
      drm/mediatek: dp: Remove extra semicolon
      drm/amd/display: Remove duplicate/repeating expression
      drm/amd/display: Remove duplicate/repeating expressions

Dillon Varone (13):
      drm/amd/display: Add debug bit to disable unbounded requesting
      drm/amd/display: Reduce expected sdp bandwidth for dcn321
      drm/amd/display: run subvp validation with supported vlevel
      drm/amd/display: Implement FIFO enable sequence on DCN32
      drm/amd/display: Optimize subvp and drr validation
      drm/amd/display: Account for DCC Meta pitch in DML MALL surface
calculations
      drm/amd/display: Account for Subvp Phantoms in DML MALL surface
calculations
      drm/amd/display: Use DML for MALL SS and Subvp allocation calculation=
s
      drm/amd/display: cleanup function args in dml
      drm/amd/display: set active bit for desktop with VSDBv3
      drm/amd/display: Remove DISPCLK dentist programming for dcn32
      drm/amd/display: Account for MPO planes in dcn32 mall alloc calculati=
ons
      drm/amd/display: Disable MALL SS and messages for PSR supported confi=
gs

Dmitry Baryshkov (78):
      drm/poll-helper: merge drm_kms_helper_poll_disable() and _fini()
      drm/probe-helper: enable and disable HPD on connectors
      drm/bridge_connector: rely on drm_kms_helper_poll_* for HPD enablemen=
t
      drm/imx/dcss: stop using drm_bridge_connector_en/disable_hpd()
      drm/msm/hdmi: stop using drm_bridge_connector_en/disable_hpd()
      drm/omap: stop using drm_bridge_connector_en/disable_hpd()
      drm/bridge_connector: drop drm_bridge_connector_en/disable_hpd()
      dt-bindings: display/msm: add sm8350 and sm8450 DSI PHYs
      drm/msm/dsi/phy: rework register setting for 7nm PHY
      drm/msm/mdp4: convert to drm_crtc_handle_vblank()
      drm/msm/mdp5: convert to drm_crtc_handle_vblank()
      dt-bindings: display/msm: *mdss.yaml: split required properties claus=
es
      drm/msm: clean event_thread->worker in case of an error
      dt-bindings: display/msm: gpu: add rbcpr clock
      dt-bindings: display/msm: qcom, sdm845-mdss: document the DP device
      dt-bindings: display/msm: *dpu.yaml: split required properties clause=
s
      dt-bindings: display/msm: add support for the display on SM8450
      drm/msm/dpu: merge all MDP TOP registers to dpu_hwio.h
      drm/msm/dpu: add support for MDP_TOP blackhole
      drm/msm/dpu: add support for SM8450
      drm/msm: mdss add support for SM8450
      drm/msm/dpu: disable DSC blocks for SM8350
      drm/msm/a2xx: support loading legacy (iMX) firmware
      dt-bindings: display/msm: qcom, mdss: fix HDMI PHY node names
      drm/msm/dpu: remove dpu_encoder_virt_ops
      drm/msm/dpu: merge two CRTC debugfs dirs
      drm/msm/dpu: enable sourcesplit for sc7180/sc7280
      drm/bridge: lt9611: fix sleep mode setup
      drm/bridge: lt9611: fix HPD reenablement
      drm/bridge: lt9611: fix polarity programming
      drm/bridge: lt9611: fix programming of video modes
      drm/bridge: lt9611: fix clock calculation
      drm/bridge: lt9611: pass a pointer to the of node
      drm/bridge: lt9611: rework the mode_set function
      drm/bridge: lt9611: attach to the next bridge
      drm/bridge: lt9611: fix sync polarity for DVI output
      drm/bridge: lt9611: simplify video timings programming
      drm/bridge: lt9611: rework infoframes handling
      drm/bridge: lt9611: stop filtering modes via the table
      drm/bridge: lt9611: properly program the dual host mode
      dt-bindings: display/msm: convert MDP5 schema to YAML format
      dt-bindings: display/msm: add SoC-specific compats to qcom, mdp5.yaml
      dt-bindings: display/msm: add core clock to the mdss bindings
      dt-bindings: display/msm: rename mdss nodes to display-subsystem
      dt-bindings: display/msm: rename mdp nodes to display-controller
      drm/msm/dpu: fix blend setup for DMA4 and DMA5 layers
      drm/msm/dpu: simplify ctl_setup_blendstage calculation
      drm/msm/dpu: simplify blend configuration
      drm/msm/dpu: enable DPU_MDP_AUDIO_SELECT for sc8180x
      drm/msm/dpu: add missing dpu_encoder kerneldoc
      dt-bindings: display/msm: add qcom, sc8280xp-edp to list of eDP devic=
es
      dt-bindings: display/msm: qcom, sc8280xp-mdss: add DP / eDP child nod=
es
      drm/msm/dpu: point sc8280xp_dpu_cfg to sc8280xp_regdma
      drm/msm/dpu: use sm8350_regdma on SM8350 platform
      drm/msm/dsi: add support for DSI-PHY on SM8350 and SM8450
      drm/msm/dsi: add support for DSI 2.6.0
      drm/msm/dsi: correct byte intf clock rate for 14nm DSI PHY
      Merge branches 'msm-next-lumag-core', 'msm-next-lumag-dpu',
'msm-next-lumag-dp', 'msm-next-lumag-dsi', 'msm-next-lumag-hdmi',
'msm-next-lumag-mdp5' and 'msm-next-lumag-mdp4' into msm-next-lumag
      Merge branch 'msm-next-lumag' into HEAD
      dt-bindings: display/msm: dsi-controller-main: remove #address/#size-=
cells
      dt-bindings: display/msm: dsi-controller-main: account for apq8064
      dt-bindings: display/msm: dsi-controller-main: allow using fewer lane=
s
      dt-binbings: display/msm: dsi-controller-main: add missing supplies
      drm/msm/dpu: sc7180: add missing WB2 clock control
      drm/msm: use strscpy instead of strncpy
      drm/msm/dpu: drop stale comment from struct dpu_mdp_cfg doc
      drm/msm/dpu: add missing ubwc_swizzle setting to catalog
      drm/msm/dpu: fix sm8450 CTL configuration
      drm/msm/dsi: properly handle the case of empty OPP table in
dsi_mgr_bridge_mode_valid
      dt-bindings: phy: qcom, hdmi-phy-other: use pxo clock
      dt-bindings: phy: qcom, hdmi-phy-other: mark it as clock provider
      drm/msm/hdmi: switch hdmi_pll_8960 to use parent_data
      drm/msm/hdmi: make hdmi_phy_8960 OF clk provider
      drm/msm/dpu: handle UBWC 1.0 in dpu_hw_sspp_setup_format
      drm/msm/dpu: correct the UBWC version on sm6115
      drm/msm/dpu: set pdpu->is_rt_pipe early in dpu_plane_sspp_atomic_upda=
te()
      drm/probe_helper: extract two helper functions
      drm/probe_helper: sort out poll_running vs poll_enabled

Dmitry Osipenko (1):
      drm/scheduler: Fix lockup in drm_sched_entity_kill()

Dmytro Laktyushkin (2):
      drm/amd/display: fix dc_get_edp_link_panel_inst to only consider
links with panels
      drm/amd/display: fix multi edp panel instancing

Drew Davenport (6):
      drm/panel-edp: Use ktime_get_boottime for delays
      drm/panel-samsung-atna33xc20: Use ktime_get_boottime for delays
      drm/panel-simple: Use ktime_get_boottime for delays
      drm/bridge/parade-ps8640: Extend autosuspend
      drm/panel-samsung-atna33xc20: Extend autosuspend delay
      drm/i915/display: Check source height is > 0

Eric Huang (2):
      drm/amdkfd: Add sync after creating vram bo
      drm/amdkfd: Fix NULL pointer error for GC 11.0.1 on mGPU

Evan Quan (16):
      drm/amd/pm: drop unused SMU v13 API
      drm/amd/pm: fulfill swsmu peak profiling mode shader/memory clock set=
tings
      drm/amd/pm: fulfill powerplay peak profiling mode shader/memory
clock settings
      drm/amdgpu: expose peak profiling mode shader/memory clocks
      drm/amdgpu: expose the minimum shader/memory clock frequency
      drm/amdgpu: bump minor version number for DEV_INFO and SENSOR
IOCTLs update
      drm/amd/pm: add support for WINDOW3D profile mode on SMU13.0.0
      drm/amd/pm: bump SMU13.0.0 driver_if header to version 0x34
      drm/amd/pm: correct the fan speed retrieving in PWM for some SMU13 as=
ics
      drm/amd/pm: correct the reference clock for fan speed(rpm) calculatio=
n
      drm/amd/pm: add the missing mapping for PPT feature on SMU13.0.0
and 13.0.7
      drm/amd/pm: add missing AllowIHInterrupt message mapping for SMU13.0.=
0
      drm/amdgpu: enable HDP SD for gfx 11.0.3
      drm/amd/pm: add SMU 13.0.7 missing GetPptLimit message mapping
      drm/amd/pm: bump SMU 13.0.0 driver_if header version
      drm/amd/pm: bump SMU 13.0.7 driver_if header version

Fangzhi Zuo (2):
      drm/amd/display: Demote Error Level When ODM Transition Supported
      drm/amd/display: Add Debug Log for MST and PCON

Frieder Schrempf (1):
      drm/bridge: ti-sn65dsi83: Fix delay after reset deassert to match spe=
c

Friedrich Vock (1):
      drm/amdgpu: Use the TGID for trace_amdgpu_vm_update_ptes

Geert Uytterhoeven (3):
      drm/fourcc: Add missing big-endian XRGB1555 and RGB565 formats
      drm: mxsfb: DRM_IMX_LCDIF should depend on ARCH_MXC
      drm: mxsfb: DRM_MXSFB should depend on ARCH_MXS || ARCH_MXC

George Shen (1):
      drm/amd/display: Unassign does_plane_fit_in_mall function from dcn3.2

Graham Sider (1):
      drm/amdgpu: update wave data type to 3 for gfx11

Guchun Chen (1):
      drm/amd/pm/smu13: BACO is supported when it's in BACO state

Guilherme G. Piccoli (4):
      drm/amdgpu/vcn: Adjust firmware names indentation
      drm/amdgpu/vcn: Remove redundant indirect SRAM HW model check
      drm/amd/display: Trivial swizzle-related code clean-ups
      drm/amdgpu/fence: Fix oops due to non-matching drm_sched init/fini

Gustavo A. R. Silva (2):
      drm/i915/guc: Replace zero-length arrays with flexible-array members
      habanalabs: Replace zero-length arrays with flexible-array members

Gustavo Sousa (8):
      drm/i915/dmc: Update DG2 DMC version to v2.08
      drm/i915/dmc: Do not require specific versions
      drm/i915/gt: Cover rest of SVG unit MCR registers
      drm/i915/doc: Document where to implement register workarounds
      drm/i915/gt: Move LSC_CHICKEN_BIT* workarounds to correct function
      drm/i915/gt: Convert PSS_MODE2 to multicast register
      drm/i915/dmc: Prepare to use unversioned paths
      drm/i915/dmc: Use unversioned path for ADLP

Gwan-gyeong Mun (3):
      drm/i915: Check for integer truncation on the configuration of ttm pl=
ace
      drm/i915: Check if the size is too big while creating shmem file
      drm/i915: Use error code as -E2BIG when the size of gem ttm
object is too large

Hamza Mahfooz (6):
      drm/amd/display: fix PSR-SU/DSC interoperability support
      drm/amd/display: fix possible buffer overflow relating to secure disp=
lay
      drm/amd/display: fix issues with driver unload
      drm/amd/display: use a more appropriate return value in
dp_retrieve_lttpr_cap()
      drm/amd/display: fix read errors pertaining to dp_lttpr_status_show()
      drm/amd/display: don't call dc_interrupt_set() for disabled crtcs

Hans de Goede (2):
      drm: panel-orientation-quirks: Add quirk for Lenovo Yoga Tab 3 X90F
      drm/amd/display: Drop CONFIG_BACKLIGHT_CLASS_DEVICE ifdefs

Hawking Zhang (1):
      drm/amdgpu: allow query error counters for specific IP block

Hersen Wu (1):
      drm/amd/display: fix linux dp link lost handled only one time

Hui Tang (1):
      drm/msm/dpu: check for null return of devm_kzalloc() in
dpu_writeback_init()

Ian Chen (1):
      drm/amd/display: Revert Reduce delay when sink device not able
to ACK 00340h write

Ilya Bakoulin (2):
      drm/amd/display: Speed up DML fast_validate path
      drm/amd/display: Speed up DML fast_validate path

Imre Deak (9):
      drm/display/dp_mst: Fix down/up message handling after sink disconnec=
t
      drm/display/dp_mst: Fix down message handling after a packet
reception error
      drm/display/dp_mst: Fix payload addition on a disconnected sink
      drm/i915: Enable a PIPEDMC whenever its corresponding pipe is enabled
      drm/i915/dp_mst: Add the MST topology state for modesetted CRTCs
      drm/display/dp_mst: Handle old/new payload states in
drm_dp_remove_payload()
      drm/display/dp_mst: Add drm_atomic_get_old_mst_topology_state()
      drm/i915/dp_mst: Fix payload removal during output disabling
      drm/i915: Fix system suspend without fbdev being initialized

Jacek Lawrynowicz (7):
      accel/ivpu: Introduce a new DRM driver for Intel VPU
      accel/ivpu: Add Intel VPU MMU support
      accel/ivpu: Add GEM buffer object management
      accel/ivpu: Add IPC driver and JSM messages
      accel/ivpu: Implement firmware parsing and booting
      accel/ivpu: Add command buffer submission logic
      accel/ivpu: Add PM support

Jack Xiao (1):
      drm/amd/amdgpu: fix warning during suspend

Jagan Teki (4):
      drm: exynos: dsi: Fix MIPI_DSI*_NO_* mode flags
      drm: exynos: dsi: Properly name HSA/HBP/HFP/HSE bits
      drm: panel: Enable prepare_prev_first flag for samsung-s6e panels
      drm: exynos: dsi: Restore proper bridge chain order

Jane Jian (1):
      drm/amdgpu/smu: skip pptable init under sriov

Jani Nikula (77):
      drm/i915/hti: avoid theoretically possible negative shift
      drm/i915/guc: make default_lists const data
      drm/audio: make drm_audio_component.h self-contained
      drm/i915/gt: remove some limited use register access wrappers
      drm/i915/fbc: drop uncore locking around i8xx/i965 fbc nuke
      drm/i915/backlight: use VLV_DISPLAY_BASE for VLV/CHV backlight regist=
ers
      drm/i915/backlight: drop DISPLAY_MMIO_BASE() use from backlight regis=
ters
      drm/i915/backlight: mass rename dev_priv to i915
      drm/i915/backlight: drop drm_device local variables in favor of i915
      drm/i915/backlight: convert DRM_DEBUG_KMS() to drm_dbg_kms()
      drm/i915/de: return the old register value from intel_de_rmw()
      drm/i915/crt: drop a bunch of unnecessary register variables
      drm/i915/crt: switch to intel_de_* register accessors in display code
      drm/i915/power: switch to intel_de_* register accessors in display co=
de
      drm/i915/dmc: switch to intel_de_* register accessors in display code
      drm/i915/dp-aux: switch to intel_de_* register accessors in display c=
ode
      drm/i915/gmbus: switch to intel_de_* register accessors in display co=
de
      drm/i915/wm: switch to intel_de_* register accessors in display code
      drm/i915/snps: switch to intel_de_* register accessors in display cod=
e
      drm/i915/tc: switch to intel_de_* register accessors in display code
      drm/i915/display: no need for gt/gen8_ppgtt.h
      drm/i915: add new "soc" sub-directory and move PCH and DRAM code ther=
e
      drm/i915/dsi: add support for ICL+ native MIPI GPIO sequence
      drm/i915/dsi: fix MIPI_BKLT_EN_1 native GPIO index
      Merge drm/drm-next into drm-intel-next
      drm/i915/display: drop redundant display/ from #includes
      drm/i915/irq: split out vblank/scanline code to intel_vblank.[ch]
      drm/i915/display: move more scanline functions to intel_vblank.[ch]
      drm/i915/display: use common function for checking scanline is moving
      drm/i915/vblank: use intel_de_read()
      drm/i915/vblank: add and use intel_de_read64_2x32() to read vblank co=
unter
      drm/i915: add struct i915_dsm to wrap dsm members together
      drm/i915: drop cast from DEFINE_RES_MEM() usage
      drm/i915: remove a couple of superfluous i915_drm.h includes
      drm/i915: move snps_phy_failed_calibration to display sub-struct
under snps
      drm/i915: move pch_ssc_use to display sub-struct under dpll
      drm/i915: move chv_dpll_md and bxt_phy_grc to display sub-struct
under state
      drm/edid: fix AVI infoframe aspect ratio handling
      drm/edid: fix parsing of 3D modes from HDMI VSDB
      drm/edid: parse VICs from CTA VDB early
      drm/edid: Use the pre-parsed VICs
      drm/edid: use VIC in AVI infoframe if sink lists it in CTA VDB
      drm/edid: rename struct drm_display_info *display to *info
      drm/edid: refactor CTA Y420CMDB parsing
      drm/edid: split CTA Y420VDB info and mode parsing
      drm/edid: fix and clarify HDMI VSDB audio latency parsing
      drm/edid: add helper for HDMI VSDB audio latency field length
      drm/edid: store quirks in display info
      drm/edid: stop passing quirks around
      drm/edid: merge ELD handling to update_display_info()
      drm/edid: move EDID BPC quirk application to update_display_info()
      drm/i915: add i915_config.h and move relevant declarations there
      drm/i915: move I915_IDLE_ENGINES_TIMEOUT next to its only user
      drm/i915: drop a number of unnecessary forward declarations
      drm/i915: move a few HAS_ macros closer to their place
      drm/i915: move I915_GEM_GPU_DOMAINS to i915_gem.h
      drm/i915: move I915_COLOR_UNEVICTABLE to i915_gem_gtt.h
      drm/i915: move GT_FREQUENCY_MULTIPLIER and GEN9_FREQ_SCALER to intel_=
rps.h
      drm/edid: split HDMI VSDB info and mode parsing
      drm/edid: refactor _drm_edid_connector_update() and rename
      drm/edid: add separate drm_edid_connector_add_modes()
      drm/edid: remove redundant _drm_connector_update_edid_property()
      Merge drm/drm-next into drm-intel-next
      drm/i915: add gmch substruct to struct drm_i915_private
      drm/i915/gmch: split out soc/intel_gmch
      drm/i915/gmch: mass rename dev_priv to i915
      drm/i915/gmch: move VGA set state to GMCH code
      drm/i915/display: add intel_display_limits.h for key enums
      drm/i915/params: use generics for parameter printing
      drm/i915/params: use generics for parameter dup
      drm/i915/params: use generics for parameter free
      drm/i915/params: use generics for parameter debugfs file creation
      drm/i915/edid: convert DP, HDMI and LVDS to drm_edid
      drm/i915/bios: convert intel_bios_init_panel() to drm_edid
      drm/i915/opregion: convert intel_opregion_get_edid() to struct drm_ed=
id
      drm/i915/panel: move panel fixed EDID to struct intel_panel
      drm/i915/bios: set default backlight controller index

Janusz Krzysztofik (2):
      drm/i915: Fix negative value passed as remaining time
      drm/i915: Never return 0 if not all requests retired

Javier Martinez Canillas (19):
      drm/mipi-dsi: Fix mipi_dsi_dcs_write_seq() macro definition format
      drm/mipi-dsi: Add a mipi_dsi_dcs_write_seq() macro
      dt-bindings: display: Add Himax HX8394 panel controller
      MAINTAINERS: Add entry for Himax HX8394 panel controller driver
      drm/panel-asus-z00t-tm5p5-n35596: Drop custom DSI write macros
      drm/panel-sitronix-st7703: Drop custom DSI write macros
      drm/panel-leadtek-ltk050h3146w: Drop custom DSI write macro
      drm/panel-elida-kd35t133: Drop custom DSI write macro
      drm/panel-boe-bf060y8m-aj0: Drop custom DSI write macro
      drm/panel-novatek-nt35950: Drop custom DSI write macro
      drm/panel-jdi-fhd-r63452: Drop custom DSI write macros
      drm/panel-samsung-s6e88a0-ams452ef01: Drop custom DSI write macro
      drm/panel-samsung-sofef00: Drop custom DSI write macro
      drm/panel-sharp-ls060t1sx01: Drop custom DSI write macro
      drm/panel-mantix-mlaf057we51: Drop custom DSI write macro
      drm/panel-sony-tulip-truly-nt35521: Drop custom DSI write macro
      drm/panel-xinpeng-xpp055c272: Drop custom DSI write macro
      fbdev: Remove unused struct fb_deferred_io .first_io field
      drm/ssd130x: Silence a `dubious: x & !y` warning

Jeffrey Hugo (3):
      MAINTAINERS/ACCEL: Add include/drm/drm_accel.h to the accel entry
      accel: Add .mmap to DRM_ACCEL_FOPS
      docs: accel: Fix debugfs path

JesseZhang (1):
      amd/amdgpu: remove test ib on hw ring

Jessica Zhang (1):
      drm/msm/dpu: Reapply CTM if modeset is needed

Jiapeng Chong (4):
      drm/amd/display: Remove the unused function dmub_outbox_irq_info_func=
s
      drm/amd/display: Remove useless else if
      drm/amd/display: Remove the unused variable ds_port
      drm/amd/display: Remove the unused variable pre_connection_type

Jiasheng Jiang (8):
      drm/msm/hdmi: Add missing check for alloc_ordered_workqueue
      drm/msm/gem: Add check for kmalloc
      drm/msm: Add missing check and destroy for alloc_ordered_workqueue
      drm/msm/dsi: Add missing check for alloc_ordered_workqueue
      drm/msm/dsi: Drop the redundant fail label
      drm/msm/dpu: Add check for cstate
      drm/msm/dpu: Add check for pstates
      drm/msm/mdp5: Add check for kzalloc

Jingwen Zhu (2):
      drm/amd/display: avoid disable otg when dig was disabled
      drm/amd/display: avoid disable otg when dig was disabled

Joerg Quinten (3):
      media: uapi: add MEDIA_BUS_FMT_BGR666_1X18
      media: uapi: add MEDIA_BUS_FMT_BGR666_1X24_CPADHI
      drm/vc4: dpi: Support BGR666 formats

John Harrison (16):
      drm/i915/uc: Fix table order verification to check all FW types
      drm/i915/uc: Rationalise delimiters in filename macros
      drm/i915/uc: More refactoring of UC version numbers
      drm/i915/guc: Use GuC submission API version number
      drm/i915/guc: Fix a static analysis warning
      drm/i915/uc: Fix two issues with over-size firmware files
      drm/i915/gt: Start adding module oriented dmesg output
      drm/i915/guc: Fix locking when searching for a hung request
      drm/i915: Fix request ref counting during error capture & debugfs dum=
p
      drm/i915: Fix up locking around dumping requests lists
      drm/i915: Allow error capture without a request
      drm/i915: Allow error capture of a pending request
      drm/i915/guc: Look for a guilty context when an engine reset fails
      drm/i915/guc: Add a debug print on GuC triggered reset
      drm/i915/guc: Rename GuC register state capture node to be more obvio=
us
      drm/i915/mtl: Wa_22011802037: don't complain about missing regs on MT=
L

John Stultz (1):
      MAINTAINERS: Add Sumit Semwal and Yongqin Liu as reviwers for
kirin DRM driver

Jonathan Cavitt (2):
      drm/i915/gsc: Disable GSC engine and power well if FW is not selected
      drm/i915: Enable XE_HP 4Tile support

Jonathan Gray (2):
      drm/amd/display: avoid unaligned access warnings
      drm/amd/pm: avoid unaligned access warnings

Jonathan Kim (1):
      drm/amdgpu: remove unconditional trap enable on add gfx11 queues

Jonathan Neusch=C3=A4fer (1):
      drm/amdgpu: Fix a typo ("boradcast")

Joshua Ashton (2):
      drm/amd/display: Calculate output_color_space after pixel
encoding adjustment
      drm/amd/display: Fix COLOR_SPACE_YCBCR2020_TYPE matrix

Jos=C3=A9 Roberto de Souza (1):
      drm/i915/gsc: Only initialize GSC in tile 0

Jouni H=C3=B6gander (5):
      drm/i915/mtl: Initial display workarounds
      drm/i915/psr: Add continuous full frame bit together with single
      drm/i915/psr: Implement Wa_14015648006
      drm/i915/psr: Implement Wa_14014971492
      drm/i915/mtl: Apply Wa_14013475917 for all MTL steppings

Kamil Trzci=C5=84ski (1):
      drm: panel: Add Himax HX8394 panel controller driver

Kees Cook (1):
      drm/nouveau/fb/ga102: Replace zero-length array of trailing
structs with flex-array

Kenneth Feng (2):
      drm/amd/amdgpu: enable athub cg 11.0.3
      drm/amd/amdgpu: implement mode2 reset on smu_v13_0_10

Kent Russell (2):
      drm/amdgpu: Fix incorrect filenames in sysfs comments
      drm/amdgpu: Add unique_id support for GC 11.0.1/2

Khaled Almahallawy (1):
      drm/i915/display: Don't disable DDI/Transcoder when setting phy
test pattern

Koby Elbaz (5):
      habanalabs/gaudi2: avoid reconfiguring the same PB registers
      habanalabs: refactor razwi/page-fault information structures
      habanalabs: protect access to dynamic mem 'user_mappings'
      habanalabs: block soft-reset on an unusable device
      habanalabs/gaudi2: find decode error root cause

Koji Matsuoka (1):
      drm: rcar-du: lvds: Fix stop sequence

Konrad Dybcio (7):
      drm/msm/dpu1: Remove INTF4 IRQ from SDM845 IRQ mask
      dt-bindings: display/msm: Add SM8150 MDSS & DPU
      dt-bindings: display/msm: Add SM8150 MDSS & DPU
      dt-bindings: display/msm: Add SM6375 DSI PHY
      drm/msm/dsi: Add phy configuration for SM6375
      dt-bindings: msm/dsi: Don't require vdds-supply on 7nm PHY
      drm/msm/dsi: Allow 2 CTRLs on v2.5.0

Konstantin Meskhidze (1):
      drm: amd: display: Fix memory leakage

Krzysztof Kozlowski (2):
      dt-bindings: display: msm: drop unneeded list for single compatible
      dt-bindings: display: msm: drop redundant part of title

Kuogee Hsieh (4):
      dt-bindings: msm/dp: add data-lanes and link-frequencies property
      drm/msm/dp: parse data-lanes as property of dp_out endpoint
      drm/msm/dp: Add capability to parser and retrieve max DP link
supported rate from link-frequencies property of dp_out endpoint
      drm/msm/dp: add support of max dp link rate

Lang Yu (2):
      drm/amdgpu: correct MEC number for gfx11 APUs
      drm/amdgpu: allow multipipe policy on ASICs with one MEC

Leo (Hanghong) Ma (3):
      drm/amd/display: Revert Scaler HCBlank issue workaround
      drm/amd/display: Add HDMI manufacturer OUI and device id read
      drm/amd/display: Fix FreeSync active bit issue

Leo Chen (1):
      drm/amd/display: Adding braces to prepare for future changes to
behavior of if block

Leo Li (1):
      drm/amd/display: Fail atomic_check early on normalize_zpos error

Leo Liu (1):
      drm/amdgpu: Use the sched from entity for amdgpu_cs trace

Leon Huang (1):
      drm/amd/display: Fix only one ABM pipe enabled under ODM combined cas=
e

Li Ma (2):
      drm/amdgpu: enable imu firmware for GC 11.0.4
      drm/amdgpu: declare firmware for new MES 11.0.4

Liang He (1):
      gpu: ipu-v3: common: Add of_node_put() for reference returned by
of_graph_get_port_by_id()

Lijo Lazar (1):
      drm/amd/pm: Allocate dummy table only if needed

Likun Gao (1):
      drm/amdgpu: adjust the sequence to check soft reset

Liu Ying (2):
      dt-bindings: display: bridge: ldb: Add i.MX93 LDB
      drm/bridge: fsl-ldb: Add i.MX93 LDB support

Liwei Song (1):
      drm/radeon: free iio for atombios when driver shutdown

Luben Tuikov (1):
      drm/amdgpu: Fix potential NULL dereference

Luca Coelho (2):
      drm/i915/mtl: limit second scaler vertical scaling in ver >=3D 14
      drm/i915: update src and dst scaler limits for display ver 12 and 13

Lucas De Marchi (4):
      drm/i915: ratelimit errors in display engine irq
      drm/i915: Remove __maybe_unused from mtl_info
      drm/i915/mtl: Fix bcs default context
      drm/i915: Fix GEN8_MISCCPCTL

Lucas Stach (8):
      drm/imx: move IPUv3 driver into separate subdirectory
      drm/etnaviv: update hardware headers from rnndb
      drm/etnaviv: split fence lock
      drm/etnaviv: convert user fence tracking to XArray
      drm/scheduler: track GPU active time per entity
      drm/etnaviv: allocate unique ID per drm_file
      drm/etnaviv: export client GPU usage statistics via fdinfo
      drm/etnaviv: show number of NN cores in GPU debugfs info

Lukasz Wiecaszek (1):
      udmabuf: add vmap and vunmap methods to udmabuf_ops

Lyude Paul (1):
      drm/amdgpu/display/mst: Fix mst_state->pbn_div and slot count assignm=
ents

Ma Jun (1):
      drm/amdgpu: Fix the warning info when unload or remove amdgpu

Maarten Lankhorst (1):
      drm/i915/de: Add more macros to remove all direct calls to uncore

Marco Pagani (1):
      habanalabs: fix double assignment in MMU V1

Marek Ol=C5=A1=C3=A1k (1):
      drm/amdgpu: return the PCIe gen and lanes from the INFO ioctl

Marek Szyprowski (2):
      drm/meson: dw-hdmi: Fix devm_regulator_*get_enable*() conversion
      drm/bridge: tc358764: Enable pre_enable_prev_first flag

Marek Vasut (1):
      drm/bridge: tc358767: Set default CLRSIPO count

Marijn Suijten (10):
      drm/msm/dpu: Print interrupt index in addition to the mask
      drm/msm/dpu: Wire up DSC mask for active CTL configuration
      drm/msm/dsi: Use DSC slice(s) packet size to compute word count
      drm/msm/dsi: Flip greater-than check for slice_count and slice_per_in=
tf
      drm/msm/dpu: Reject topologies for which no DSC blocks are available
      drm/msm/dpu: Remove num_enc from topology struct in favour of num_dsc
      drm/msm/dpu: Implement DSC binding to PP block for CTL V1
      drm/msm/dpu: Add DSC configuration for SM8150 and SM8250
      drm/msm/dpu: Disallow unallocated resources to be returned
      drm/msm/dpu: Add DSC hardware blocks to register snapshot

Mario Limonciello (58):
      drm/amd: Delay removal of the firmware framebuffer
      drm/amd: Add a legacy mapping to "amdgpu_ucode_ip_version_decode"
      drm/amd: Convert SMUv11 microcode to use `amdgpu_ucode_ip_version_dec=
ode`
      drm/amd: Convert SMUv13 microcode to use `amdgpu_ucode_ip_version_dec=
ode`
      drm/amd: Add a new helper for loading/validating microcode
      drm/amd: Use `amdgpu_ucode_request` helper for SDMA
      drm/amd: Convert SDMA to use `amdgpu_ucode_ip_version_decode`
      drm/amd: Make SDMA firmware load failures less noisy.
      drm/amd: Use `amdgpu_ucode_*` helpers for VCN
      drm/amd: Load VCN microcode during early_init
      drm/amd: Load MES microcode during early_init
      drm/amd: Use `amdgpu_ucode_*` helpers for MES
      drm/amd: Remove superfluous assignment for `adev->mes.adev`
      drm/amd: Use `amdgpu_ucode_*` helpers for GFX9
      drm/amd: Load GFX9 microcode during early_init
      drm/amd: Use `amdgpu_ucode_*` helpers for GFX10
      drm/amd: Load GFX10 microcode during early_init
      drm/amd: Use `amdgpu_ucode_*` helpers for GFX11
      drm/amd: Load GFX11 microcode during early_init
      drm/amd: Parse both v1 and v2 TA microcode headers using same functio=
n
      drm/amd: Avoid BUG() for case of SRIOV missing IP version
      drm/amd: Load PSP microcode during early_init
      drm/amd: Use `amdgpu_ucode_*` helpers for PSP
      drm/amd/display: Load DMUB microcode during early_init
      drm/amd: Use `amdgpu_ucode_release` helper for DMUB
      drm/amd: Use `amdgpu_ucode_*` helpers for SMU
      drm/amd: Load SMU microcode during early_init
      drm/amd: Optimize SRIOV switch/case for PSP microcode load
      drm/amd: Use `amdgpu_ucode_*` helpers for GFX6
      drm/amd: Use `amdgpu_ucode_*` helpers for GFX7
      drm/amd: Use `amdgpu_ucode_*` helpers for GFX8
      drm/amd: Use `amdgpu_ucode_*` helpers for GMC6
      drm/amd: Use `amdgpu_ucode_*` helpers for GMC7
      drm/amd: Use `amdgpu_ucode_*` helpers for GMC8
      drm/amd: Use `amdgpu_ucode_*` helpers for SDMA2.4
      drm/amd: Use `amdgpu_ucode_*` helpers for SDMA3.0
      drm/amd: Use `amdgpu_ucode_*` helpers for SDMA on CIK
      drm/amd: Use `amdgpu_ucode_*` helpers for UVD
      drm/amd: Use `amdgpu_ucode_*` helpers for VCE
      drm/amd: Use `amdgpu_ucode_*` helpers for CGS
      drm/amd: Use `amdgpu_ucode_*` helpers for GPU info bin
      drm/amd: Use `amdgpu_ucode_*` helpers for DMCU
      drm/amd: Use `amdgpu_ucode_release` helper for powerplay
      drm/amd: Use `amdgpu_ucode_release` helper for si
      drm/amd: make amdgpu_ucode_validate static
      drm/amd: Avoid ASSERT for some message failures
      drm/amd: fix some dead code in `gfx_v9_0_init_cp_compute_microcode`
      drm/amd: Fix renoir/green sardine MP0 IP version detection
      drm/amd: Remove needless break for legacy IP discovery MP0 9.0.0
      drm/amd: Evaluate early init for all IP blocks even if one fails
      Documentation/gpu: Add MP0 version to apu-asic-info-table
      Documentation/gpu: Update lines for GREEN_SARDINE and YELLOW_CARP
      Documentation/gpu: Add Mendocino to apu-asic-info-table
      Documentation/gpu: Add Raphael to apu-asic-info-table
      drm/amd/display: Decrease messaging about DP alt mode state to debug
      drm/amd: decrease message about missing PSP runtime database to debug
      drm/amd: Allow s0ix without BIOS support
      drm/amd: Fix initialization for nbio 4.3.0

Martin Leung (1):
      Revert "drm/amd/display: Speed up DML fast_validate path"

Mateusz Kwiatkowski (4):
      drm/vc4: vec: Check for VEC output constraints
      drm/vc4: vec: Add support for more analog TV standards
      drm/vc4: crtc: Fix timings for VEC modes
      drm/vc4: vec: Support progressive modes

Matt Atwood (3):
      drm/i915/dg2: Introduce Wa_18018764978
      drm/i915/dg2: Introduce Wa_18019271663
      drm/i915: Fix memory leaks in scatterlist

Matt Roper (15):
      drm/i915/gt: Manage uncore->lock while waiting on MCR register
      drm/i915/gt: Correct kerneldoc for intel_gt_mcr_wait_for_reg()
      drm/i915/gt: Pass gt rather than uncore to lowest-level reads/writes
      drm/i915/gt: Add dedicated MCR lock
      drm/i915/mcr: Hold forcewake and MCR lock over PPAT setup
      drm/i915/mtl: Add hardware-level lock for steering
      drm/i915/mtl: Check full IP version when applying hw steering semapho=
re
      drm/i915/gen12: Apply recommended L3 hashing mask
      drm/i915/dg2: Return Wa_22012654132 to just specific steppings
      drm/i915/mtl: Add initial gt workarounds
      drm/i915: Move/adjust register definitions related to Wa_22011450934
      drm/i915/xehp: GAM registers don't need to be re-applied on engine re=
sets
      drm/i915/mtl: Correct implementation of Wa_18018781329
      drm/i915/xehp: Annotate a couple more workaround registers as MCR
      drm/i915/pvc: Annotate two more workaround/tuning registers as MCR

Matthew Auld (5):
      drm/i915/selftests: use live_subtests for live_migrate
      drm/i915/selftests: exercise emit_pte() with nearly full ring
      drm/i915/migrate: fix corner case in CCS aux copying
      drm/i915/ttm: consider CCS for backup objects
      drm/i915: improve the catch-all evict to handle lock contention

Matti Vaittinen (2):
      drm/bridge: sii902x: Use devm_regulator_bulk_get_enable()
      drm/meson: dw-hdmi: Use devm_regulator_*get_enable*()

Maxime Ripard (52):
      drm/tests: client: Mention that we can't use MODULE_ macros
      drm/connector: Rename legacy TV property
      drm/connector: Only register TV mode property if present
      drm/connector: Rename drm_mode_create_tv_properties
      drm/connector: Add TV standard property
      drm/modes: Add a function to generate analog display modes
      drm/connector: Add a function to lookup a TV mode by its name
      drm/modes: Introduce the tv_mode property as a command-line option
      drm/modes: Properly generate a drm_display_mode from a named mode
      drm/client: Remove match on mode name
      drm/modes: Introduce more named modes
      drm/atomic-helper: Add a TV properties reset helper
      drm/atomic-helper: Add an analog TV atomic_check implementation
      drm/vc4: vec: Use TV Reset implementation
      drm/vc4: vec: Convert to the new TV mode property
      drm/sun4i: tv: Convert to the new TV mode property
      drm/atomic: Constify the old/new state accessors
      drm/vc4: Constify container_of wrappers
      drm/vc4: kms: Constify the HVS old/new state helpers
      drm/vc4: kms: Sort the CRTCs by output before assigning them
      drm/vc4: txp: Reorder the variable assignments
      drm/vc4: Add TXP encoder type
      drm/vc4: txp: Initialise the CRTC before the encoder and connector
      drm/vc4: crtc: Pass the device and data in vc4_crtc_init
      drm/vc4: crtc: Provide a CRTC name
      drm/tests: helpers: Add missing export
      drm/doc: Fix title underline length
      drm/modes: Use strscpy() to copy command-line mode name
      drm/tests: probe_helper: Fix uninitialized variable
      drm/tests: helpers: Move the helper header to include/drm
      drm/tests: Introduce a config option for the KUnit helpers
      drm/tests: helpers: Document drm_kunit_device_init()
      drm/tests: helpers: Switch to EXPORT_SYMBOL_GPL
      drm/tests: helpers: Rename the device init helper
      drm/tests: helpers: Remove the name parameter
      drm/tests: helpers: Create the device in another function
      drm/tests: helpers: Switch to a platform_device
      drm/tests: helpers: Make sure the device is bound
      drm/tests: helpers: Allow for a custom device struct to be allocated
      drm/tests: helpers: Allow to pass a custom drm_driver
      drm/tests: Add a test for DRM managed actions
      drm/vc4: Move HVS state to main header
      drm/vc4: crtc: Introduce a lower-level crtc init helper
      drm/vc4: crtc: Make encoder lookup helper public
      drm/vc4: hvs: Provide a function to initialize the HVS structure
      drm/vc4: tests: Introduce a mocking infrastructure
      drm/vc4: tests: Fail the current test if we access a register
      drm/vc4: tests: Add unit test suite for the PV muxing
      Documentation: gpu: vc4: Add KUnit Tests Section
      drm/vc4: Improve the KUnit documentation
      drm/bridge: panel: Prevent ERR_PTR Dereference
      drm/vc4: hvs: Ignore atomic_flush if we're disabled

Ma=C3=ADra Canal (14):
      drm/debugfs: create device-centered debugfs functions
      drm: use new debugfs device-centered functions on DRM core files
      drm/debugfs: create debugfs late register functions
      drm/vc4: use new debugfs device-centered functions
      drm/v3d: use new debugfs device-centered functions
      drm/vkms: use new debugfs device-centered functions
      drm/todo: update the debugfs clean up task
      drm/vc4: drop all currently held locks if deadlock happens
      drm/v3d: replace open-coded implementation of drm_gem_object_lookup
      drm/gud: use new debugfs device-centered functions
      drm/arm/hdlcd: use new debugfs device-centered functions
      drm/debugfs: use octal permissions instead of symbolic permissions
      drm/debugfs: add descriptions to struct parameters
      drm/vkms: reintroduce prepare_fb and cleanup_fb functions

Melissa Wen (9):
      drm/v3d: cleanup BOs properly when lookup_bos fails
      drm/v3d: replace obj lookup steps with drm_gem_objects_lookup
      drm/amd/display: fix cursor offset on rotation 180
      drm/amd/display: ident braces in dcn30_acquire_post_bldn_3dlut correc=
tly
      drm/amd/display: clean code-style issues in dcn30_set_mpc_shaper_3dlu=
t
      drm/amd/display: camel case cleanup in color_gamma file
      drm/amd/display: unset initial value for tf since it's never used
      drm/amd/display: remove unused func declaration from resource headers
      drm/amd/display: remove unused _calculate_degamma_curve function

Miaoqian Lin (1):
      drm/i915: Fix documentation for intel_uncore_forcewake_put__locked

Michal Wajdeczko (8):
      drm/i915/guc: Add GuC oriented print macros
      drm/i915/guc: Update GuC messages in intel_guc.c
      drm/i915/guc: Update GuC messages in intel_guc_ads.c
      drm/i915/guc: Update GuC messages in intel_guc_ct.c
      drm/i915/guc: Update GuC messages in intel_guc_fw.c
      drm/i915/guc: Update GuC messages in intel_guc_log.c
      drm/i915/guc: Update GuC messages in intel_guc_submission.c
      drm/i915/guc: Update GT/GuC messages in intel_uc.c

Michel D=C3=A4nzer (1):
      Revert "drm/amd/display: Enable Freesync Video Mode by default"

Mikko Kovanen (1):
      drm/i915/dsi: fix VBT send packet port selection for dual link DSI

Mikko Perttunen (7):
      gpu: host1x: Fix mask for syncpoint increment register
      gpu: host1x: Don't skip assigning syncpoints to channels
      drm/tegra: firewall: Check for is_addr_reg existence in IMM check
      gpu: host1x: Implement syncpoint wait using DMA fences
      gpu: host1x: Implement job tracking using DMA fences
      gpu: host1x: Rewrite syncpoint interrupt handling
      gpu: host1x: External timeout/cancellation for fences

Miles Chen (2):
      drm/mediatek: Use NULL instead of 0 for NULL pointer
      drm/mediatek: Include missing headers

Moti Haimovski (2):
      habanalabs: extend fatal messages to contain PCI info
      habanalabs: enhance info printed on FW load errors

Mukul Joshi (1):
      drm/amdkfd: Fix kernel warning during topology setup

Mustapha Ghaddar (5):
      drm/amd/display: Add DPIA NOTIFICATION logic
      drm/amd/display: Update BW alloc after new DMUB logic
      drm/amd/display: Update dmub header to match DMUB
      drm/amd/display: Add Function declaration in dc_link
      drm/amd/display: upstream link_dp_dpia_bw.c

Nasir Osman (2):
      drm/amd/display: Remove stutter only configurations
      drm/amd/display: Disable unbounded request mode during rotation

Nathan Lu (1):
      dt-bindings: display: mediatek: modify VDOSYS0 display device
tree Documentations for MT8188

Neil Armstrong (9):
      dt-bindings: display: panel: document the Visionox VTDR6130
AMOLED DSI Panel
      drm/panel: add visionox vtdr6130 DSI panel driver
      drm/msm/dpu: add support for SM8550
      drm/msm: mdss: add support for SM8550
      drm/panel: vtdr6130: fix unused ret in visionox_vtdr6130_bl_update_st=
atus
      dt-bindings: display/msm: document the SM8550 DSI PHY
      drm/msm/dsi: add support for DSI-PHY on SM8550
      drm/msm/dsi: add support for DSI 2.7.0
      dt-bindings: display: panel: visionox,vtdr6130: add missing reg prope=
rty

Nicholas Kazlauskas (7):
      drm/amd/display: Defer DIG FIFO disable after VID stream enable
      drm/amd/display: Fix Z8 support configurations
      drm/amd/display: Reset DMUB mailbox SW state after HW reset
      drm/amd/display: Move DCN314 DOMAIN power control to DMCUB
      drm/amd/display: Enable P-state validation checks for DCN314
      drm/amd/display: Update Z8 SR exit/enter latencies
      drm/amd/display: Disable HUBP/DPP PG on DCN314 for now

Nirmoy Das (7):
      drm/i915/selftests: Remove hardcoded value with a macro
      drm/i915: Use helper func to find out map type
      drm/i915: Use "%zu" to format size_t
      drm/i915: Reserve enough fence slot for i915_vma_unbind_async
      drm/i915: Update docs in intel_wakeref.h
      drm/radeon: Do not use deprecated drm log API
      drm_print: Remove deprecated DRM_DEBUG_KMS_RATELIMITED()

Noralf Tr=C3=B8nnes (8):
      drm/probe-helper: Provide a TV get_modes helper
      drm/gud: Fix UBSAN warning
      drm/gud: Don't retry a failed framebuffer flush
      drm/gud: Split up gud_flush_work()
      drm/gud: Prepare buffer for CPU access in gud_flush_work()
      drm/gud: Use the shadow plane helper
      drm/gud: Enable synchronous flushing by default
      drm/gud: Fix missing include

N=C3=ADcolas F. R. A. Prado (1):
      drm/mediatek: Clean dangling pointer on bind error path

Oded Gabbay (6):
      habanalabs/uapi: move uapi file to drm
      habanalabs: move driver to accel subsystem
      habanalabs/gaudi2: update asic register files
      habanalabs/gaudi2: update f/w files
      habanalabs: update f/w files
      habanalabs: move some prints to debug level

Ofir Bitton (10):
      habanalabs: don't notify user about clk throttling due to power
      habanalabs/gaudi2: count interrupt causes
      habanalabs/gaudi2: remove duplicated event prints
      habanalabs/gaudi2: support abrupt device reset event
      habanalabs/gaudi2: dump event description even if no cause
      habanalabs/gaudi: allow device acquire while in debug mode
      habanalabs: update device status sysfs documentation
      habanalabs: refactor user interrupt type
      habanalabs: optimize command submission completion timestamp
      habanalabs/gaudi2: unsecure tpc kernel_config registers

Ohad Sharabi (14):
      habanalabs: make set_dram_properties an ASIC function
      habanalabs: update DRAM props according to preboot data
      habanalabs: define traces for COMMS protocol
      habanalabs: trace COMMS protocol
      habanalabs: remove support to export dmabuf from handle
      habanalabs: helper function to validate export params
      habanalabs: modify export dmabuf API
      habanalabs: fix dmabuf to export only required size
      habanalabs/gaudi2: wait for preboot ready if HW state is dirty
      habanalabs: fix asic-specific functions documentation
      habanalabs: add uapi to flush inbound HBM transactions
      habanalabs: add set engines masks ASIC function
      habanalabs: define events to trace PCI LBW access
      habanalabs: trace LBW reads/writes

Otto Pfl=C3=BCger (3):
      drm/mipi-dbi: Support separate I/O regulator
      drm/tiny: panel-mipi-dbi: Read I/O supply from DT
      dt-bindings: display: panel: mipi-dbi-spi: Add io-supply

Paul Cercueil (23):
      drm: atmel-hlcdc: Remove #ifdef guards for PM related functions
      drm: imx/dcss: Remove #ifdef guards for PM related functions
      drm: panfrost: Remove #ifdef guards for PM related functions
      drm: rcar-du: Remove #ifdef guards for PM related functions
      drm: shmobile: Remove #ifdef guards for PM related functions
      drm: tilcdc: Remove #ifdef guards for PM related functions
      drm: vboxvideo: Remove #ifdef guards for PM related functions
      drm: gm12u320: Remove #ifdef guards for PM related functions
      drm/i915/gt: Remove #ifdef guards for PM related functions
      drm: exynos: Remove #ifdef guards for PM related functions
      dt-bindings: display: bridge: it66121: Add compatible string for IT66=
10
      drm: bridge: it66121: Use devm_regulator_bulk_get_enable()
      drm: bridge: it66121: Use regmap_noinc_read()
      drm: bridge: it66121: Write AVI infoframe with regmap_bulk_write()
      drm: bridge: it66121: Fix wait for DDC ready
      drm: bridge: it66121: Don't use DDC error IRQs
      drm: bridge: it66121: Don't clear DDC FIFO twice
      drm: bridge: it66121: Set DDC preamble only once before reading EDID
      drm: bridge: it66121: Move VID/PID to new it66121_chip_info structure
      drm: bridge: it66121: Add support for the IT6610
      dt-bindings: display/panel: Add AUO A030JTN01
      drm/tegra: Remove #ifdef guards for PM related functions
      drm/etnaviv: Remove #ifdef guards for PM related functions

Paulo Miguel Almeida (1):
      drm/radeon: Replace 1-element arrays with flexible-array members

Peter Robinson (1):
      drm: rcar-du: Depend on DRM_RCAR_DU for components on that SoC

Philip Yang (5):
      drm/amdkfd: Fix kfd_process_device_init_vm error handling
      drm/amdkfd: Fix double release compute pasid
      drm/amdkfd: Cleanup vm process info if init vm failed
      drm/amdkfd: Page aligned memory reserve size
      drm/amdkfd: Support process XNACK mode dynamic change

Philipp Zabel (1):
      drm/imx: ipuv3-plane: Fix overlay plane width

Pierre-Eric Pelloux-Prayer (1):
      drm/amdgpu: print bo inode number instead of ptr

Pin-yen Lin (2):
      drm/bridge: it6505: Guard bridge power in IRQ handler
      drm/bridge: it6505: Add caching for EDID

Praful Swarnakar (1):
      drm/amd/display: Remove redundant logs from DSC code

Qingqing Zhuo (2):
      drm/amd/display: force connector state when bpc changes during compli=
ance
      Revert "drm/amd/display: enable DPG when disabling plane for phantom =
pipe"

Rahul T R (5):
      dt-bindings: display: bridge: Convert cdns,dsi.txt to yaml
      dt-bindings: display: bridge: cdns,dsi: Add compatible for dsi on j72=
1e
      drm/bridge: cdns-dsi: Move to drm/bridge/cadence
      drm/bridge: cdns-dsi: Create a header file
      drm/bridge: cdns-dsi: Add support for J721E wrapper

Randolph Sapp (1):
      drm: tidss: Fix pixel format definition

Randy Dunlap (6):
      drm/doc: make drm-uapi igt-tests more readable
      drm/amd/display: fix dc/core/dc.c kernel-doc
      drm/atomic-helper: fix kernel-doc problems
      drm/connector: fix a kernel-doc bad line warning
      drm/client: fix kernel-doc warning in drm_client.h
      drm/amd/amdgpu: add complete header search path

Richard Acayan (2):
      drm/panel: sofef00: Use 16-bit brightness function
      drm/panel: vtdr6130: Use 16-bit brightness function

Rob Clark (13):
      drm/virtio: Spiff out cmd queue/response traces
      drm/i915: Fix potential context UAFs
      drm/msm: Add MSM_SUBMIT_BO_NO_IMPLICIT
      drm/msm/gpu: Add devfreq tuning debugfs
      drm/msm/gpu: Bypass PM QoS constraint for idle clamp
      drm/msm/gpu: Add default devfreq thresholds
      drm/mediatek: Remove dependency on GEM DMA helper
      drm/mediatek: Drop unbalanced obj unref
      drm/i915: Avoid potential vm use-after-free
      drm/mediatek: Remove unused GEM DMA header include
      drm/i915: Fix potential bit_17 double-free
      PM / devfreq: Fix build issues with devfreq disabled
      drm/shmem: Cleanup drm_gem_shmem_create_with_handle()

Robert Foss (7):
      Merge branch 'i2c/client_device_id_helper-immutable' of
https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux into
drm-misc-next
      drm/bridge: lt9611: Fix PLL being unable to lock
      dt-bindings: display: msm: Add qcom, sm8350-dpu binding
      dt-bindings: display: msm: Add qcom, sm8350-mdss binding
      drm/msm/dpu: Add SM8350 to hw catalog
      drm/msm/dpu: Add support for SM8350
      drm/msm: Add support for SM8350

Robin Chen (1):
      drm/amd/display: Pass DSC slice height to PSR FW

Rodrigo Siqueira (1):
      drm/amd/display: Remove unused code

Rodrigo Vivi (3):
      Merge drm/drm-next into drm-intel-gt-next
      drm/i915: Expand force_probe to block probe of devices as well.
      drm/i915/debugfs: Get rid of single use macros.

Roman Li (3):
      drm/amd/display: Fix potential null-deref in dm_resume
      drm/amd/display: Clear MST topology if it fails to resume
      drm/amd/display: Set hvm_enabled flag for S/G mode

Saaem Rizvi (3):
      drm/amd/display: Remove SubVp support if src/dst rect does not
equal stream timing
      drm/amd/display: Add extra mblk for DCC
      drm/amd/display: Correcting prefetch mode for fast validate

Saleemkhan Jamadar (1):
      drm/amdgpu: enable VCN DPG for GC IP v11.0.4

Sam Ravnborg (2):
      drm/bridge: ps8640: Use atomic variants of drm_bridge_funcs
      drm/bridge: Drop unused drm_bridge_chain functions

Samson Tam (5):
      drm/amd/display: Check for PSR in no memory request case
      drm/amd/display: Uninitialized variables causing 4k60 UCLK to
stay at DPM1 and not DPM0
      drm/amd/display: adjust MALL size available for DCN32 and DCN321
      drm/amd/display: fix MALL size hardcoded for DCN321
      drm/amd/display: enable DPG when disabling plane for phantom pipe

Sasa Dragic (1):
      drm/i915: re-disable RC6p on Sandy Bridge

Sean Paul (1):
      drm/docs: Explicitly document default CRTC background behavior

Shang XiaoJing (2):
      drm: Fix potential null-ptr-deref due to drmm_mode_config_init()
      drm/vc4: vec: Use pm_runtime_resume_and_get() in vc4_vec_encoder_enab=
le()

Siddh Raman Pant (3):
      drm: Remove usage of deprecated DRM_DEBUG_PRIME
      drm/drm_blend: Remove usage of deprecated DRM_DEBUG_ATOMIC
      drm/drm_lease: Remove usage of deprecated DRM_DEBUG_LEASE

Simon Ser (1):
      doc: add dma-buf IOCTL code to table

Srinivasan Shanmugam (1):
      drm/amd/display: fix some coding style issues

Stanislav Lisovskiy (8):
      drm: Add missing DP DSC extended capability definitions.
      drm/i915: Fix intel_dp_mst_compute_link_config
      drm/i915: Extract drm_dp_atomic_find_vcpi_slots cycle to separate fun=
ction
      drm/i915: Add DSC support to MST path
      drm/i915: Extract VESA DSC bpp alignment to separate function
      drm/i915: Bpp/timeslot calculation fixes for DP MST DSC
      drm/i915/mtl: Add support of Tile4 to MTL
      drm/i915: Fix timeslots argument for DP DSC SST case

Stanislaw Gruszka (2):
      accel/ivpu: Set dma max_segment_size
      accel/ivpu: Fix old dma_buf api usage

Stanley.Yang (4):
      drm/amdgpu: correct umc poison mode set value
      drm/amdgpu: remove enable ras cmd call trace
      drm/amdgpu: support check xgmi/walf error mask bit for aldebaran
      drm/amdgpu: correct query xgmi3x16 pcs error status

Stefan Eichenberger (1):
      drm/bridge: lt8912b: Add hot plug detection

Stylon Wang (2):
      drm/amd/display: Guard Freesync HDMI parsing with dc_lock
      drm/amd/display: Properly reuse completion structure

Sung Joon Kim (3):
      drm/display: Add missing Adaptive Sync DPCD definitions
      drm/amd/display: Enable AdaptiveSync in DC interface
      drm/amd/display: Enable Freesync over PCon

Swapnil Patel (1):
      drm/amd/display: patch cases with unknown plane state to prevent warn=
ing

Swati Sharma (1):
      drm/i915/dsc: Refactor dsc gen checks

T.J. Mercier (1):
      dma-buf: A collection of typo and documentation fixes

Tal Cohen (1):
      habanalabs: support receiving ascii message from preboot f/w

Tamir Gilad-Raz (1):
      habanalabs: adjacent timestamps should be more accurate

Tao Zhou (8):
      drm/amdgpu: add RAS poison consumption handler for AI SRIOV
      drm/amdgpu: add RAS poison consumption handler for NV SRIOV
      drm/amdgpu: add RAS poison consumption handler for SRIOV
      drm/amdgpu: add VCN poison consumption handler for SRIOV
      drm/amdgpu: skip RAS error injection in SRIOV
      drm/amdgpu: update VCN/JPEG RAS setting
      drm/amdgpu: define RAS query poison mode function
      drm/amdgpu: retire unused get_umc_v6_7_channel_index

Taylor, Clinton A (1):
      drm/i915/hdmi: SPD infoframe update for discrete

Thierry Reding (12):
      dt-bindings: display: simple-framebuffer: Support system memory
framebuffers
      dt-bindings: display: simple-framebuffer: Document 32-bit BGR format
      dt-bindings: reserved-memory: Support framebuffer reserved memory
      drm/simpledrm: Use struct iosys_map consistently
      drm/simpledrm: Add support for system memory framebuffers
      drm/format-helper: Support the AB24/XB24 formats
      drm/simpledrm: Support the XB24/AB24 format
      MAINTAINERS: Update Tegra DRM tree
      gpu: host1x: Use tegra_dev_iommu_get_stream_id()
      drm/tegra: Use tegra_dev_iommu_get_stream_id()
      drm/tegra: vic: Use tegra_dev_iommu_get_stream_id()
      drm/tegra: nvdec: Use tegra_dev_iommu_get_stream_id()

Thomas Wei=C3=9Fschuh (1):
      dma-buf: make kobj_type structure constant

Thomas Zimmermann (100):
      fbdev: Make fb_modesetting_disabled() static inline
      Revert "drm/fb-helper: Remove damage worker"
      Revert "drm/fb-helper: Schedule deferred-I/O worker after
writing to framebuffer"
      Revert "drm/fb-helper: Perform damage handling in deferred-I/O helper=
"
      Merge drm/drm-next into drm-misc-next
      drm/hisilicon/hibmc: Fix preferred depth and bpp
      drm/logicvc: Fix preferred fbdev cpp
      drm/cirrus: Decouple fbdev bpp value from color depth
      drm/ofdrm: Set preferred depth from format of scanout buffer
      drm/simpledrm: Set preferred depth from format of scanout buffer
      drm/solomon: Set preferred color depth and bpp to the correct values
      drm/fb-helper: Don't use the preferred depth for the BPP default
      drm/simple-kms: Remove drm_gem_simple_display_pipe_prepare_fb()
      drm/ili9225: Call MIPI DBI mode_valid helper
      drm/st7586: Call MIPI DBI mode_valid helper
      drm/mipi-dbi: Initialize default driver functions with macro
      drm/mipi-dbi: Prepare framebuffer copy operation in pipe-update helpe=
rs
      drm/mipi-dbi: Support shadow-plane state
      drm/mipi-dbi: Use shadow-plane mappings
      drm/mipi-dbi: Move drm_dev_{enter, exit}() out from fb_dirty function=
s
      drm/ast: Init iosys_map pointer as I/O memory for damage handling
      firmware/sysfb: Fix EFI/VESA format selection
      drm/format-helper: Comment on RGB888 byte order
      drm/format-helper: Fix test-input format conversion
      drm/format-helper: Store RGB565 in little-endian order
      drm/format-helper: Type fixes in format-helper tests
      drm/format-helper: Flip src/dst-format branches in blit helper
      drm/format-helper: Add conversion from XRGB8888 to ARGB8888
      drm/format-helper: Add conversion from XRGB8888 to ARGB2101010
      drm/format-helper: Add conversion from XRGB8888 to 15-bit RGB555 form=
ats
      drm/fh-helper: Split fbdev single-probe helper
      drm/fb-helper: Fix single-probe color-format selection
      drm/format-helper: Simplify drm_fb_build_fourcc_list()
      drm/format-helper: Remove unnecessary conversion helpers
      drm/fb-helper: Replace bpp/depth parameter by color mode
      drm/nouveau: Remove support for legacy contexts/buffers
      fbcon: Remove trailing whitespaces
      Revert "fbcon: don't lose the console font across generic->chip
driver switch"
      drm/gma500: Do not set struct fb_info.apertures
      drm/i915: Do not set struct fb_info.apertures
      drm/radeon: Do not set struct fb_info.apertures
      drm/fb-helper: Do not allocate unused apertures structure
      fbdev/clps711x-fb: Do not set struct fb_info.apertures
      fbdev/hyperv-fb: Do not set struct fb_info.apertures
      vfio-mdev/mdpy-fb: Do not set struct fb_info.apertures
      fbdev/efifb: Add struct efifb_par for driver data
      fbdev/efifb: Do not use struct fb_info.apertures
      fbdev/offb: Allocate struct offb_par with framebuffer_alloc()
      fbdev/offb: Do not use struct fb_info.apertures
      fbdev/simplefb: Do not use struct fb_info.apertures
      fbdev/vesafb: Remove trailing whitespaces
      fbdev/vesafb: Do not use struct fb_info.apertures
      fbdev/vga16fb: Do not use struct fb_info.apertures
      drm/fbdev: Remove aperture handling and FBINFO_MISC_FIRMWARE
      drm: Include <linux/backlight.h> where needed
      drm: Include <linux/of.h> where needed
      drm: Don't include <linux/fb.h> in drm_crtc_helper.h
      drm/amdgpu: Do not include <linux/fb.h>
      drm/panel: Do not include <linux/fb.h>
      drm: Define enum mode_set_atomic in drm_modeset_helper_tables.h
      drm/amdgpu: Do not include <drm/drm_fb_helper.h>
      drm/nouveau: Do not include <drm/drm_fb_helper.h>
      drm/radeon: Remove trailing whitespaces
      drm/radeon: Do not include <drm/drm_fb_helper.h>
      drm/ttm: Include <linux/vmalloc.h> to fix MIPS build
      drm/amdgpu: Fix coding style
      drm: Remove unnecessary include statements for drm_crtc_helper.h
      drm/amdgpu: Remove unnecessary include statements for drm_crtc_helper=
.h
      drm/arm/komeda: Remove unnecessary include statements for
drm_crtc_helper.h
      drm/aspeed: Remove unnecessary include statements for drm_crtc_helper=
.h
      drm/ast: Remove unnecessary include statements for drm_crtc_helper.h
      drm/bridge: Remove unnecessary include statements for drm_crtc_helper=
.h
      drm/gma500: Remove unnecessary include statements for drm_crtc_helper=
.h
      drm/i2c/ch7006: Remove unnecessary include statements for
drm_crtc_helper.h
      drm/ingenic: Remove unnecessary include statements for drm_crtc_helpe=
r.h
      drm/kmb: Remove unnecessary include statements for drm_crtc_helper.h
      drm/logicvc: Remove unnecessary include statements for drm_crtc_helpe=
r.h
      drm/nouveau: Remove unnecessary include statements for drm_crtc_helpe=
r.h
      drm/radeon: Remove unnecessary include statements for drm_crtc_helper=
.h
      drm/rockchip: Remove unnecessary include statements for drm_crtc_help=
er.h
      drm/shmobile: Remove unnecessary include statements for drm_crtc_help=
er.h
      drm/sprd: Remove unnecessary include statements for drm_crtc_helper.h
      drm/sun4i: Remove unnecessary include statements for drm_crtc_helper.=
h
      drm/tidss: Remove unnecessary include statements for drm_crtc_helper.=
h
      drm/udl: Remove unnecessary include statements for drm_crtc_helper.h
      drm/vboxvideo: Remove unnecessary include statements for drm_crtc_hel=
per.h
      drm/crtc-helper: Remove most include statements from drm_crtc_helper.=
h
      Merge drm/drm-next into drm-misc-next
      Merge drm/drm-next into drm-misc-next
      drm/client: Test for connectors before sending hotplug event
      drm/client: Add hotplug_failed flag
      drm/fb-helper: Introduce drm_fb_helper_unprepare()
      drm/fbdev-generic: Initialize fb-helper structure in generic setup
      drm/fb-helper: Remove preferred_bpp parameter from fbdev internals
      drm/fb-helper: Initialize fb-helper's preferred BPP in prepare functi=
on
      drm/fbdev-generic: Minimize hotplug error handling
      drm/fbdev-generic: Minimize client unregistering
      drm/fbdev-generic: Inline clean-up helpers into drm_fbdev_fb_destroy(=
)
      drm/fbdev-generic: Rename struct fb_info 'fbi' to 'info'
      drm/fb-helper: Remove drm_fb_helper_unprepare() from drm_fb_helper_fi=
ni()

Tim Huang (3):
      drm/amdgpu: skip mes self test after s0i3 resume for MES IP v11.0
      drm/amdgpu: skip psp suspend for IMU enabled ASICs mode2 reset
      drm/amd/pm: drop unneeded dpm features disablement for SMU 13.0.4/11

Tom Chung (1):
      drm/amd/display: Fix video glitch while drag window in PSR-SU

Tom Rix (4):
      habanalabs: remove redundant memset
      drm/amd/display: reduce else-if to else in dcn10_blank_pixel_data()
      drm/amd/display: reduce else-if to else in dcn32_calculate_dlg_params=
()
      drm/amd/display: set should_disable_otg storage-class-specifier to st=
atic

Tomer Tayar (11):
      habanalabs: remove releasing of user threads from device release
      habanalabs: abort waiting user threads upon error
      habanalabs: don't allow user to destroy CB handle more than once
      habanalabs: use dev_dbg() when hl_mmap_mem_buf_get() fails
      habanalabs: skip device idle check in hpriv_release if in reset
      habanalabs: fix handling of wait CS for interrupting signals
      habanalabs: put fences in case of unexpected wait status
      habanalabs: fix dma-buf release handling if dma_buf_fd() fails
      habanalabs: verify that kernel CB is destroyed only once
      habanalabs: run error handling if scrub_device_mem fails after reset
      habanalabs: clear in_compute_reset when escalating to hard reset

Tomeu Vizoso (3):
      drm/etnaviv: Add nn_core_count to chip feature struct
      drm/etnaviv: Warn when probing on NPUs
      drm/etnaviv: add HWDB entry for VIPNano-QI.7120.0055

Tomi Valkeinen (19):
      drm/omap: dsi: Fix excessive stack usage
      drm/omap: Fix kernel docs
      media: Add 2-10-10-10 RGB formats
      media: Add Y210, Y212 and Y216 formats
      media: renesas: vsp1: Change V3U to be gen4
      media: renesas: vsp1: Add V4H SoC version
      media: renesas: vsp1: Add new formats (2-10-10-10 ARGB, Y210, Y212)
      drm: rcar-du: Bump V3U to gen 4
      drm: rcar-du: Add new formats (2-10-10-10 ARGB, Y210)
      dt-bindings: display: renesas,du: Provide bindings for r8a779g0
      dt-bindings: display: bridge: renesas,dsi-csi2-tx: Add r8a779g0
      drm: rcar-du: Add r8a779g0 support
      drm: rcar-du: dsi: Add r8A779g0 support
      drm: rcar-du: dsi: Add 'select RESET_CONTROLLER'
      drm: rcar-du: lvds: Add runtime PM
      drm: rcar-du: lvds: Add reset control
      drm: rcar-du: Add quirk for H3 ES1.x pclk workaround
      drm: rcar-du: Fix setting a reserved bit in DPLLCR
      drm: rcar-du: Stop accessing non-existent registers on gen4

Tony Tascioglu (2):
      drm/amd/display: Optimize link power-down when link powered externall=
y
      drm/amd/display: Skip backlight control delay on external powered lin=
ks

Tvrtko Ursulin (6):
      drm/i915: Fix workarounds on Gen2-3
      drm: Replace DRM_DEBUG with drm_dbg_core in file and ioctl handling
      drm/i915: Do not cover all future platforms in TLB invalidation
      drm/i915: Use uabi engines for the default engine map
      Merge drm/drm-next into drm-intel-gt-next
      drm/i915/selftests: Flush all tiles on test exit

Umesh Nerlige Ramappa (7):
      i915/uncore: Acquire fw before loop in intel_uncore_read64_2x32
      drm/i915/selftest: Bump up sample period for busy stats selftest
      drm/i915/perf: Do not parse context image for HSW
      drm/i915/mtl: Resize noa_wait BO size to save restore GPR regs
      drm/i915/mtl: Add Wa_14015846243 to fix OA vs CS timestamp mismatch
      drm/i915/mtl: Update OA mux whitelist for MTL
      drm/i915/mtl: Add OA support by enabling 32 bit OAG formats for MTL

Uwe Kleine-K=C3=B6nig (37):
      drm/bridge: ti-sn65dsi86: Convert to i2c's .probe_new()
      drm/bridge: chrontel-ch7033: Convert to i2c's .probe_new()
      drm/bridge/analogix/anx6345: Convert to i2c's .probe_new()
      drm/bridge/analogix/anx78xx: Convert to i2c's .probe_new()
      drm/bridge: anx7625: Convert to i2c's .probe_new()
      drm/bridge: icn6211: Convert to i2c's .probe_new()
      drm/bridge: it6505: Convert to i2c's .probe_new()
      drm/bridge: it66121: Convert to i2c's .probe_new()
      drm/bridge: lt8912b: Convert to i2c's .probe_new()
      drm/bridge: lt9211: Convert to i2c's .probe_new()
      drm/bridge: lt9611: Convert to i2c's .probe_new()
      drm/bridge: lt9611uxc: Convert to i2c's .probe_new()
      drm/bridge: megachips: Convert to i2c's .probe_new()
      drm/bridge: nxp-ptn3460: Convert to i2c's .probe_new()
      drm/bridge: sii902x: Convert to i2c's .probe_new()
      drm/bridge: sii9234: Convert to i2c's .probe_new()
      drm/bridge: sii8620: Convert to i2c's .probe_new()
      drm/bridge: tc358767: Convert to i2c's .probe_new()
      drm/bridge: tc358768: Convert to i2c's .probe_new()
      drm/bridge/tc358775: Convert to i2c's .probe_new()
      drm/bridge: tfp410: Convert to i2c's .probe_new()
      drm/bridge: adv7511: Convert to i2c's .probe_new()
      drm/bridge: parade-ps8622: Convert to i2c's .probe_new()
      drm/bridge: ti-sn65dsi83: Convert to i2c's .probe_new()
      drm/drv: Make use of local variable driver in drm_dev_register()
      drm/mxsfb: improve clk handling for axi clk
      drm/i2c/ch7006: Convert to i2c's .probe_new()
      drm/i2c/sil164: Convert to i2c's .probe_new()
      drm/i2c/tda9950: Convert to i2c's .probe_new()
      drm/i2c/tda998x: Convert to i2c's .probe_new()
      drm/panel: olimex-lcd-olinuxino: Convert to i2c's .probe_new()
      drm/panel: raspberrypi-touchscreen: Convert to i2c's .probe_new()
      drm: Only select I2C_ALGOBIT for drivers that actually need it
      MAINTAINERS: drm/hisilicon: Drop Chen Feng
      drm/vc4: dsi: Drop unused i2c include
      drm/imx/dcss: Drop if blocks with always false condition
      drm/imx/dcss: Don't call dev_set_drvdata(..., NULL);

Ville Syrj=C3=A4l=C3=A4 (88):
      drm/i915/dvo: Remove unused panel_wants_dither
      drm/i915/dvo: Don't leak connector state on DVO init failure
      drm/i915/dvo: Actually initialize the DVO encoder type
      drm/i915/dvo: Introduce intel_dvo_connector_type()
      drm/i915/dvo: Eliminate useless 'port' variable
      drm/i915/dvo: Flatten intel_dvo_init()
      drm/i915/dvo: s/intel_encoder/encoder/ etc.
      drm/i915/dvo: s/dev_priv/i915/
      drm/i915/dvo: Use per device debugs
      drm/i915/display: Do both crawl and squash when changing cdclk
      drm/i915: Remove non-existent pipes from bigjoiner pipe mask
      drm/i915: Fix adl+ degamma LUT size
      drm/i915: s/gamma/post_csc_lut/
      drm/i915: Add glk+ degamma readout
      drm/i915: Read out CHV CGM degamma
      drm/i915: Add gamma/degamma readout for bdw+
      drm/i915: Add gamma/degamma readout for ivb/hsw
      drm/i915: Make ilk_read_luts() capable of degamma readout
      drm/i915: Prep for C8 palette readout
      drm/i915: Make .read_luts() mandatory
      drm/i915: Finish the LUT state checker
      drm/i915: Rework legacy LUT handling
      drm/i915: Use hw degamma LUT for sw gamma on glk with YCbCr output
      drm/i915: Use gamma LUT for RGB limited range compression
      drm/i915: Add 10bit gamma mode for gen2/3
      drm/i915/dvo/ch7xxx: Fix suspend/resume
      drm/i915/dvo/sil164: Nuke pointless return statements
      drm/i915/dvo/sil164: Fix suspend/resume
      drm/i915/dvo: Parametrize DVO/DVO_SRCDIM registers
      drm/i915/dvo: Define a few more DVO register bits
      drm/i915/dvo: Rename the "active data order" bits
      drm/i915/dvo: Use REG_BIT() & co. for DVO registers
      drm/i915/dvo: Use intel_de_rmw() for DVO enable/disable
      drm/i915/dvo: Extract intel_dvo_regs.h
      drm/i915/dvo: Log about what was detected on which DVO port
      drm/i915: Fix VLV/CHV HDMI/DP audio enable
      drm/i915/vrr: Make registers latch in a consitent place on icl/tgl
      drm/i915/vrr: Fix guardband/vblank exit length calculation for adl+
      drm/i915/vrr: Reorder transcoder vs. vrr enable/disable
      drm/i915/vrr: Be more careful with the bits in TRANS_VRR_CTL
      drm/i915: Introduce intel_panel_init_alloc()
      drm/i915: Do panel VBT init early if the VBT declares an
explicit panel type
      drm/i915: Generalize the PPS vlv_pipe_check() stuff
      drm/i915: Try to use the correct power sequencer intiially on bxt/glk
      drm/i915: Extend dual PPS handlind for ICP+
      drm/i915: Reject unusable power sequencers
      drm/i915: Print the PPS registers using consistent format
      drm/i915: Fix whitespace
      drm/i915: Improve PPS debugs
      drm/i915: Shorten GAMMA_MODE_MODE_12BIT_MULTI_SEGMENTED a bit
      drm/i915: Clean up GAMMA_MODE defines
      drm/i915: Define skl+ palette anti-collision bit
      drm/i915: Clean up various indexed LUT registers
      drm/i915: Standardize auto-increment LUT load procedure
      drm/i915: Document LUT "max" register precision
      drm/i915: Move the DSB->mmio fallback into the LUT code
      drm/i915: Move the DSB setup/cleaup into the color code
      drm/i915: Make DSB lower level
      drm/i915: Disable DSB usage specifically for LUTs
      Revert "drm/i915: Disable DSB usage for now"
      drm/i915: Use ilk_lut_write*() for all ilk+ gamma modes
      drm/i915/dsb: Stop with the RMW
      drm/i915/dsb: Inline DSB_CTRL writes into intel_dsb_commit()
      drm/i915/dsb: Align DSB register writes to 8 bytes
      drm/i915/dsb: Fix DSB command buffer size checks
      drm/i915/dsb: Extract assert_dsb_has_room()
      drm/i915/dsb: Extract intel_dsb_emit()
      drm/i915/dsb: Improve the indexed reg write checks
      drm/i915/dsb: Handle the indexed vs. not inside the DSB code
      drm/i915/dsb: Introduce intel_dsb_align_tail()
      drm/i915/dsb: Allow the caller to pass in the DSB buffer size
      drm/i915/dsb: Add mode DSB opcodes
      drm/i915/audio: Don't program the hardware ELD buffer on ilk+
      drm/i915/audio: Don't program the hardware ELD buffer on hsw+
      drm/i915/audio: Introduce a struct for the acomp audio state
      drm/i915/audio: Precompute the ELD
      drm/i915/audio: Don't enable audio with bogus ELD
      drm/i915/audio: Hardware ELD readout
      drm/i915/sdvo: Precompute the ELD
      drm/i915/sdvo: Only use "presence detect" for has_audio readout
      drm/i915/sdvo: Do ELD hardware readout
      drm/i915/audio: Hook up ELD into the state checker
      drm/i915/audio: Include ELD in the state dump
      drm/i915/audio: s/ilk/ibx/
      drm/i915/audio: Clean up the PCH type checks
      drm/i915: Fix VBT DSI DVO port handling
      drm/i915: Populate encoder->devdata for DSI on icl+
      drm/i915: Pick the backlight controller based on VBT on ICP+

Vinay Belgaumkar (1):
      drm/i915/mtl: Enable Idle Messaging for GSC CS

Vinod Govindapillai (1):
      drm/i915: Enable SDP split for DP2.0

Vitaly Prosyak (2):
      Revert "drm/amdgpu: TA unload messages are not actually sent to
psp when amdgpu is uninstalled"
      drm/amdgpu: always sending PSP messages LOAD_ASD and UNLOAD_TA

Vladimir Stempen (1):
      drm/amd/display: fix FCLK pstate change underflow

Wadim Egorov (1):
      drm/bridge: sii902x: Allow reset line to be tied to a sleepy
GPIO controller

Wayne Boyer (1):
      drm/i915/pvc: Implement recommended caching policy

Wayne Lin (6):
      drm/amdgpu/display/mst: limit payload to be updated one by one
      drm/amdgpu/display/mst: update mst_mgr relevant variable when long HP=
D
      drm/drm_print: correct format problem
      drm/display/dp_mst: Correct the kref of port.
      drm/amdgpu/display/mst: adjust the naming of mst_port and port
of aconnector
      drm/amdgpu/display/mst: adjust the logic in 2nd phase of updating pay=
load

Wen Yang (1):
      drm/amd/display: fix array-bounds errors in dc_stream_remove_writebac=
k()

Wenjing Liu (23):
      drm/amd/display: use encoder type independent hwss instead of
accessing enc directly
      drm/amd/display: add support for three new square pattern
variants from DP2.1 specs
      drm/amd/display: move dccg programming from link hwss hpo dp to hwss
      drm/amd/display: update pixel rate div in enable stream
      drm/amd/display: allow hpo and dio encoder switching during dp
retrain test
      drm/amd/display: refactor hpd logic from dc_link to link_hpd
      drm/amd/display: refactor ddc logic from dc_link_ddc to link_ddc
      drm/amd/display: move dpcd logic from dc_link_dpcd to link_dpcd
      drm/amd/display: move dc_link_dpia logic to link_dp_dpia
      drm/amd/display: move dp link training logic to link_dp_training
      drm/amd/display: move dp phy related logic to link_dp_phy
      drm/amd/display: move dp capability related logic to link_dp_capabili=
ty
      drm/amd/display: create accessories, hwss and protocols sub
folders in link
      drm/amd/display: move eDP panel control logic to link_edp_panel_contr=
ol
      drm/amd/display: move dp irq handler functions from dc_link_dp
to link_dp_irq_handler
      drm/amd/display: move dp cts functions from dc_link_dp to link_dp_cts
      drm/amd/display: merge dc_link_dp into dc_link
      drm/amd/display: add rc_params_override option in dc_dsc_config
      drm/amd/display: break down dc_link.c
      drm/amd/display: do not set RX back to SST mode for non 0 mst stream =
count
      drm/amd/display: Extract temp drm mst deallocation wa into its
own function
      drm/amd/display: on dp link lost event toggle dpms for master pipe on=
ly
      drm/amd/display: move public dc link function implementation to
dc_link_exports

Wesley Chalmers (2):
      drm/amd/display: Do not set DRR on pipe commit
      drm/amd/display: Do not commit pipe when updating DRR

XU pengfei (1):
      habanalabs: remove unnecessary (void*) conversions

Xia Fukun (1):
      drm/i915/bios: fix a memory leak in generate_lfp_data_ptrs

Xiaogang Chen (1):
      drm/amdkfd: Prevent user space using both svm and kfd api to
register same user buffer

Xin Ji (1):
      drm/bridge: anx7625: keep last configure timing

Xinlei Lee (3):
      drm/mediatek: Set dpi format in mmsys
      drm/mediatek: Add mt8186 dpi compatibles and platform data
      drm/mediatek: dsi: Reduce the time of dsi from LP11 to sending cmd

Yang Li (4):
      drm/amd/display: Remove unneeded semicolon
      drm/amdgpu: clean up some inconsistent indentings
      drm/amd/display: Simplify bool conversion
      drm/amd/display: clean up some inconsistent indentings

Ye Xingchen (1):
      drm/amd/display: remove duplicate include header

Yi Yang (1):
      drm/amd/display: Remove redundant assignment to variable dc

YiPeng Chai (11):
      drm/amdgpu: Fixed bug on error when unloading amdgpu
      drm/amdgpu: Add gfx ras function on gfx v11_0_3
      amd/amdgpu: Add RLC_RLCS_FED_STATUS_* to gc v11_0_3 ip headers
      drm/amdgpu: Add gfx ras poison consumption irq handling on gfx v11_0_=
3
      drm/amdgpu: Add gfx cp ecc error irq handling on gfx v11_0_3
      drm/amdgpu: Perform gpu reset after gfx finishes processing ras
poison consumption on gfx_v11_0_3
      drm/amdgpu: Remove unnecessary ras block support check
      drm/amdgpu: Adjust ras support check condition for special asic
      drm/amdgpu: Optimize gfx ras block initialization code for gfx v9_0
      drm/amdgpu: Add sdma ras function on sdma v6_0_3
      drm/amdgpu: Optimize sdma ras block initialization code for sdma v4_0

Yifan Zha (3):
      drm/amdgpu: Skip specific mmhub and sdma registers accessing under sr=
iov
      drm/amdgpu: Remove writing GRBM_GFX_CNTL in RLCG interface under SRIO=
V
      drm/amdgpu: Revert programming GRBM_GFX_* in RLCG interface to
support GFX9

Yiqing Yao (1):
      drm/amdgpu: Enable vclk dclk node for gc11.0.3

Yuan Can (4):
      drm/bridge: megachips: Fix error handling in i2c_register_driver()
      drm/vkms: Fix memory leak in vkms_init()
      drm/vkms: Fix null-ptr-deref in vkms_release()
      drm/omapdrm: Remove unused struct csc_coef_rgb2yuv

Yushan Zhou (1):
      drm/tegra: Remove redundant null checks before kfree

allen chen (2):
      dt-bindings: it6505: add properties to restrict output bandwidth
      drm/bridge: add it6505 driver to read data-lanes and
link-frequencies from dt

farah kassabri (7):
      habanalabs: read binning info from preboot
      habanalabs: set log level for descriptor validation to debug
      habanalabs: fix wrong variable type used for vzalloc
      habanalabs: pass-through request from user to f/w
      habanalabs: check pad and reserved fields in ioctls
      habanalabs: bugs fixes in timestamps buff alloc
      habanalabs: fix bug in timestamps registration code

hersen wu (4):
      drm/amd/display: save restore hdcp state when display is
unplugged from mst hub
      drm/amd/display: phase3 mst hdcp for multiple displays
      drm/amd/display: phase2 enable mst hdcp multiple displays
      drm/amd/display: hdcp not enabled on connector 0

hongao (1):
      drm/amd/display: Fix set scaling doesn's work

jie1zhan (1):
      drm/amdgpu: Correct the power calcultion for Renior/Cezanne.

ruanjinjie (1):
      drm/mediatek: mtk_drm_crtc: Add checks for devm_kcalloc

tal albo (1):
      habanalabs/gaudi2: fix BMON 3rd address range

xurui (1):
      drm/amdgpu: Retry DDC probing on DVI on failure if we got an HPD inte=
rrupt

ye xingchen (2):
      drm/amd/display: remove duplicate included header files
      drm/amdgpu/display: remove duplicate include header in files

 Documentation/ABI/testing/sysfs-driver-habanalabs  |   14 +-
 Documentation/accel/introduction.rst               |    6 +-
 .../bindings/display/bridge/cdns,dsi.txt           |  112 -
 .../bindings/display/bridge/cdns,dsi.yaml          |  180 +
 .../bindings/display/bridge/fsl,ldb.yaml           |   16 +-
 .../bindings/display/bridge/ite,it6505.yaml        |   68 +-
 .../bindings/display/bridge/ite,it66121.yaml       |    4 +-
 .../display/bridge/renesas,dsi-csi2-tx.yaml        |    3 +-
 .../bindings/display/bridge/renesas,dsi.yaml       |    1 +
 .../bindings/display/mediatek/mediatek,aal.yaml    |    1 +
 .../bindings/display/mediatek/mediatek,ccorr.yaml  |    3 +-
 .../bindings/display/mediatek/mediatek,color.yaml  |    1 +
 .../bindings/display/mediatek/mediatek,dither.yaml |    1 +
 .../bindings/display/mediatek/mediatek,gamma.yaml  |    1 +
 .../bindings/display/mediatek/mediatek,ovl.yaml    |    1 +
 .../display/mediatek/mediatek,postmask.yaml        |    1 +
 .../bindings/display/mediatek/mediatek,rdma.yaml   |    4 +
 .../bindings/display/msm/dp-controller.yaml        |   31 +-
 .../bindings/display/msm/dpu-common.yaml           |   12 +-
 .../bindings/display/msm/dsi-controller-main.yaml  |  285 +-
 .../bindings/display/msm/dsi-phy-28nm.yaml         |    1 +
 .../bindings/display/msm/dsi-phy-7nm.yaml          |    5 +-
 .../bindings/display/msm/dsi-phy-common.yaml       |    7 +-
 .../devicetree/bindings/display/msm/gpu.yaml       |    2 +
 .../devicetree/bindings/display/msm/mdp5.txt       |  132 -
 .../bindings/display/msm/mdss-common.yaml          |    9 +-
 .../devicetree/bindings/display/msm/qcom,mdp5.yaml |  156 +
 .../devicetree/bindings/display/msm/qcom,mdss.yaml |   55 +-
 .../bindings/display/msm/qcom,msm8998-dpu.yaml     |   12 +-
 .../bindings/display/msm/qcom,msm8998-mdss.yaml    |   14 +-
 .../bindings/display/msm/qcom,qcm2290-dpu.yaml     |   12 +-
 .../bindings/display/msm/qcom,qcm2290-mdss.yaml    |    6 +-
 .../bindings/display/msm/qcom,sc7180-dpu.yaml      |   12 +-
 .../bindings/display/msm/qcom,sc7180-mdss.yaml     |   12 +-
 .../bindings/display/msm/qcom,sc7280-dpu.yaml      |    9 +-
 .../bindings/display/msm/qcom,sc7280-mdss.yaml     |    9 +-
 .../bindings/display/msm/qcom,sc8280xp-dpu.yaml    |  122 +
 .../bindings/display/msm/qcom,sc8280xp-mdss.yaml   |  151 +
 .../bindings/display/msm/qcom,sdm845-dpu.yaml      |   12 +-
 .../bindings/display/msm/qcom,sdm845-mdss.yaml     |   20 +-
 .../bindings/display/msm/qcom,sm6115-dpu.yaml      |    5 +-
 .../bindings/display/msm/qcom,sm6115-mdss.yaml     |    3 +-
 .../bindings/display/msm/qcom,sm8150-dpu.yaml      |   92 +
 .../bindings/display/msm/qcom,sm8150-mdss.yaml     |  332 +
 .../bindings/display/msm/qcom,sm8250-dpu.yaml      |    7 +
 .../bindings/display/msm/qcom,sm8250-mdss.yaml     |   14 +-
 .../bindings/display/msm/qcom,sm8350-dpu.yaml      |  120 +
 .../bindings/display/msm/qcom,sm8350-mdss.yaml     |  223 +
 .../bindings/display/msm/qcom,sm8450-dpu.yaml      |  139 +
 .../bindings/display/msm/qcom,sm8450-mdss.yaml     |  345 +
 .../bindings/display/panel/auo,a030jtn01.yaml      |   60 +
 .../bindings/display/panel/focaltech,gpt3.yaml     |   56 +
 .../bindings/display/panel/himax,hx8394.yaml       |   76 +
 .../bindings/display/panel/panel-mipi-dbi-spi.yaml |    8 +-
 .../bindings/display/panel/visionox,vtdr6130.yaml  |   63 +
 .../devicetree/bindings/display/renesas,du.yaml    |    2 +
 .../bindings/display/simple-framebuffer.yaml       |    7 +
 .../bindings/phy/qcom,hdmi-phy-other.yaml          |   27 +-
 .../bindings/reserved-memory/framebuffer.yaml      |   52 +
 Documentation/fb/modedb.rst                        |    5 +
 Documentation/gpu/amdgpu/apu-asic-info-table.csv   |   18 +-
 Documentation/gpu/amdgpu/dgpu-asic-info-table.csv  |    2 +
 Documentation/gpu/amdgpu/driver-misc.rst           |    2 +-
 Documentation/gpu/drm-kms-helpers.rst              |    7 +
 Documentation/gpu/drm-kms.rst                      |    6 +
 Documentation/gpu/drm-uapi.rst                     |   12 +-
 Documentation/gpu/todo.rst                         |   13 +-
 Documentation/gpu/vc4.rst                          |   19 +
 Documentation/userspace-api/ioctl/ioctl-number.rst |    1 +
 .../userspace-api/media/v4l/pixfmt-packed-yuv.rst  |   49 +-
 .../userspace-api/media/v4l/pixfmt-rgb.rst         |  194 +
 .../userspace-api/media/v4l/subdev-formats.rst     |  111 +
 MAINTAINERS                                        |   62 +-
 drivers/Makefile                                   |    1 +
 drivers/accel/Kconfig                              |    8 +-
 drivers/accel/Makefile                             |    4 +
 drivers/{misc =3D> accel}/habanalabs/Kconfig         |    8 +-
 drivers/{misc =3D> accel}/habanalabs/Makefile        |    2 +-
 drivers/{misc =3D> accel}/habanalabs/common/Makefile |    0
 drivers/{misc =3D> accel}/habanalabs/common/asid.c   |    0
 .../habanalabs/common/command_buffer.c             |   22 +-
 .../habanalabs/common/command_submission.c         |  133 +-
 .../{misc =3D> accel}/habanalabs/common/context.c    |    0
 .../{misc =3D> accel}/habanalabs/common/debugfs.c    |    0
 .../{misc =3D> accel}/habanalabs/common/decoder.c    |    0
 drivers/{misc =3D> accel}/habanalabs/common/device.c |  109 +-
 .../habanalabs/common/firmware_if.c                |  189 +-
 .../{misc =3D> accel}/habanalabs/common/habanalabs.h |  122 +-
 .../habanalabs/common/habanalabs_drv.c             |    6 +-
 .../habanalabs/common/habanalabs_ioctl.c           |  101 +-
 .../{misc =3D> accel}/habanalabs/common/hw_queue.c   |    0
 drivers/{misc =3D> accel}/habanalabs/common/hwmon.c  |    0
 drivers/{misc =3D> accel}/habanalabs/common/irq.c    |   38 +-
 drivers/{misc =3D> accel}/habanalabs/common/memory.c |  369 +-
 .../{misc =3D> accel}/habanalabs/common/memory_mgr.c |    3 +-
 .../{misc =3D> accel}/habanalabs/common/mmu/Makefile |    0
 .../{misc =3D> accel}/habanalabs/common/mmu/mmu.c    |    2 +-
 .../{misc =3D> accel}/habanalabs/common/mmu/mmu_v1.c |    1 -
 .../habanalabs/common/mmu/mmu_v2_hr.c              |    0
 .../{misc =3D> accel}/habanalabs/common/pci/Makefile |    0
 .../{misc =3D> accel}/habanalabs/common/pci/pci.c    |   10 +-
 .../{misc =3D> accel}/habanalabs/common/security.c   |  174 +
 drivers/accel/habanalabs/common/security.h         |  163 +
 .../{misc =3D> accel}/habanalabs/common/state_dump.c |    2 +-
 drivers/{misc =3D> accel}/habanalabs/common/sysfs.c  |    0
 drivers/{misc =3D> accel}/habanalabs/gaudi/Makefile  |    0
 drivers/{misc =3D> accel}/habanalabs/gaudi/gaudi.c   |   27 +-
 drivers/{misc =3D> accel}/habanalabs/gaudi/gaudiP.h  |    2 +-
 .../habanalabs/gaudi/gaudi_coresight.c             |    3 +-
 .../habanalabs/gaudi/gaudi_security.c              |    0
 drivers/{misc =3D> accel}/habanalabs/gaudi2/Makefile |    0
 drivers/{misc =3D> accel}/habanalabs/gaudi2/gaudi2.c | 1175 +--
 .../{misc =3D> accel}/habanalabs/gaudi2/gaudi2P.h    |   39 +-
 .../habanalabs/gaudi2/gaudi2_coresight.c           |   10 +-
 .../habanalabs/gaudi2/gaudi2_coresight_regs.h      |    0
 .../habanalabs/gaudi2/gaudi2_masks.h               |    0
 .../habanalabs/gaudi2/gaudi2_security.c            |   37 +-
 drivers/{misc =3D> accel}/habanalabs/goya/Makefile   |    0
 drivers/{misc =3D> accel}/habanalabs/goya/goya.c     |   12 +
 drivers/{misc =3D> accel}/habanalabs/goya/goyaP.h    |    2 +-
 .../habanalabs/goya/goya_coresight.c               |    2 +-
 .../{misc =3D> accel}/habanalabs/goya/goya_hwmgr.c   |    0
 .../habanalabs/goya/goya_security.c                |    0
 .../habanalabs/include/common/cpucp_if.h           |   96 +-
 .../habanalabs/include/common/hl_boot_if.h         |  151 +-
 .../habanalabs/include/common/qman_if.h            |    0
 .../include/gaudi/asic_reg/cpu_if_regs.h           |    0
 .../include/gaudi/asic_reg/dma0_core_masks.h       |    0
 .../include/gaudi/asic_reg/dma0_core_regs.h        |    0
 .../include/gaudi/asic_reg/dma0_qm_masks.h         |    0
 .../include/gaudi/asic_reg/dma0_qm_regs.h          |    0
 .../include/gaudi/asic_reg/dma1_core_regs.h        |    0
 .../include/gaudi/asic_reg/dma1_qm_regs.h          |    0
 .../include/gaudi/asic_reg/dma2_core_regs.h        |    0
 .../include/gaudi/asic_reg/dma2_qm_regs.h          |    0
 .../include/gaudi/asic_reg/dma3_core_regs.h        |    0
 .../include/gaudi/asic_reg/dma3_qm_regs.h          |    0
 .../include/gaudi/asic_reg/dma4_core_regs.h        |    0
 .../include/gaudi/asic_reg/dma4_qm_regs.h          |    0
 .../include/gaudi/asic_reg/dma5_core_regs.h        |    0
 .../include/gaudi/asic_reg/dma5_qm_regs.h          |    0
 .../include/gaudi/asic_reg/dma6_core_regs.h        |    0
 .../include/gaudi/asic_reg/dma6_qm_regs.h          |    0
 .../include/gaudi/asic_reg/dma7_core_regs.h        |    0
 .../include/gaudi/asic_reg/dma7_qm_regs.h          |    0
 .../gaudi/asic_reg/dma_if_e_n_down_ch0_regs.h      |    0
 .../gaudi/asic_reg/dma_if_e_n_down_ch1_regs.h      |    0
 .../include/gaudi/asic_reg/dma_if_e_n_regs.h       |    0
 .../gaudi/asic_reg/dma_if_e_s_down_ch0_regs.h      |    0
 .../gaudi/asic_reg/dma_if_e_s_down_ch1_regs.h      |    0
 .../include/gaudi/asic_reg/dma_if_e_s_regs.h       |    0
 .../gaudi/asic_reg/dma_if_w_n_down_ch0_regs.h      |    0
 .../gaudi/asic_reg/dma_if_w_n_down_ch1_regs.h      |    0
 .../include/gaudi/asic_reg/dma_if_w_n_regs.h       |    0
 .../gaudi/asic_reg/dma_if_w_s_down_ch0_regs.h      |    0
 .../gaudi/asic_reg/dma_if_w_s_down_ch1_regs.h      |    0
 .../include/gaudi/asic_reg/dma_if_w_s_regs.h       |    0
 .../include/gaudi/asic_reg/gaudi_blocks.h          |    0
 .../habanalabs/include/gaudi/asic_reg/gaudi_regs.h |    2 +
 .../include/gaudi/asic_reg/mme0_ctrl_regs.h        |    0
 .../include/gaudi/asic_reg/mme0_qm_masks.h         |    0
 .../include/gaudi/asic_reg/mme0_qm_regs.h          |    0
 .../include/gaudi/asic_reg/mme1_ctrl_regs.h        |    0
 .../include/gaudi/asic_reg/mme2_ctrl_regs.h        |    0
 .../include/gaudi/asic_reg/mme2_qm_regs.h          |    0
 .../include/gaudi/asic_reg/mme3_ctrl_regs.h        |    0
 .../include/gaudi/asic_reg/mmu_up_regs.h           |    0
 .../include/gaudi/asic_reg/nic0_qm0_masks.h        |    0
 .../include/gaudi/asic_reg/nic0_qm0_regs.h         |    0
 .../include/gaudi/asic_reg/nic0_qm1_regs.h         |    0
 .../include/gaudi/asic_reg/nic1_qm0_regs.h         |    0
 .../include/gaudi/asic_reg/nic1_qm1_regs.h         |    0
 .../include/gaudi/asic_reg/nic2_qm0_regs.h         |    0
 .../include/gaudi/asic_reg/nic2_qm1_regs.h         |    0
 .../include/gaudi/asic_reg/nic3_qm0_regs.h         |    0
 .../include/gaudi/asic_reg/nic3_qm1_regs.h         |    0
 .../include/gaudi/asic_reg/nic4_qm0_regs.h         |    0
 .../include/gaudi/asic_reg/nic4_qm1_regs.h         |    0
 .../include/gaudi/asic_reg/nif_rtr_ctrl_0_regs.h   |    0
 .../include/gaudi/asic_reg/nif_rtr_ctrl_1_regs.h   |    0
 .../include/gaudi/asic_reg/nif_rtr_ctrl_2_regs.h   |    0
 .../include/gaudi/asic_reg/nif_rtr_ctrl_3_regs.h   |    0
 .../include/gaudi/asic_reg/nif_rtr_ctrl_4_regs.h   |    0
 .../include/gaudi/asic_reg/nif_rtr_ctrl_5_regs.h   |    0
 .../include/gaudi/asic_reg/nif_rtr_ctrl_6_regs.h   |    0
 .../include/gaudi/asic_reg/nif_rtr_ctrl_7_regs.h   |    0
 .../include/gaudi/asic_reg/psoc_cpu_pll_regs.h     |    0
 .../include/gaudi/asic_reg/psoc_etr_regs.h         |    0
 .../gaudi/asic_reg/psoc_global_conf_masks.h        |    0
 .../include/gaudi/asic_reg/psoc_global_conf_regs.h |    0
 .../include/gaudi/asic_reg/psoc_timestamp_regs.h   |    0
 .../include/gaudi/asic_reg/sif_rtr_ctrl_0_regs.h   |    0
 .../include/gaudi/asic_reg/sif_rtr_ctrl_1_regs.h   |    0
 .../include/gaudi/asic_reg/sif_rtr_ctrl_2_regs.h   |    0
 .../include/gaudi/asic_reg/sif_rtr_ctrl_3_regs.h   |    0
 .../include/gaudi/asic_reg/sif_rtr_ctrl_4_regs.h   |    0
 .../include/gaudi/asic_reg/sif_rtr_ctrl_5_regs.h   |    0
 .../include/gaudi/asic_reg/sif_rtr_ctrl_6_regs.h   |    0
 .../include/gaudi/asic_reg/sif_rtr_ctrl_7_regs.h   |    0
 .../habanalabs/include/gaudi/asic_reg/stlb_regs.h  |    0
 .../include/gaudi/asic_reg/tpc0_cfg_masks.h        |    0
 .../include/gaudi/asic_reg/tpc0_cfg_regs.h         |    0
 .../include/gaudi/asic_reg/tpc0_qm_masks.h         |    0
 .../include/gaudi/asic_reg/tpc0_qm_regs.h          |    0
 .../include/gaudi/asic_reg/tpc1_cfg_regs.h         |    0
 .../include/gaudi/asic_reg/tpc1_qm_regs.h          |    0
 .../include/gaudi/asic_reg/tpc2_cfg_regs.h         |    0
 .../include/gaudi/asic_reg/tpc2_qm_regs.h          |    0
 .../include/gaudi/asic_reg/tpc3_cfg_regs.h         |    0
 .../include/gaudi/asic_reg/tpc3_qm_regs.h          |    0
 .../include/gaudi/asic_reg/tpc4_cfg_regs.h         |    0
 .../include/gaudi/asic_reg/tpc4_qm_regs.h          |    0
 .../include/gaudi/asic_reg/tpc5_cfg_regs.h         |    0
 .../include/gaudi/asic_reg/tpc5_qm_regs.h          |    0
 .../include/gaudi/asic_reg/tpc6_cfg_regs.h         |    0
 .../include/gaudi/asic_reg/tpc6_qm_regs.h          |    0
 .../include/gaudi/asic_reg/tpc7_cfg_regs.h         |    0
 .../include/gaudi/asic_reg/tpc7_qm_regs.h          |    0
 .../habanalabs/include/gaudi/gaudi.h               |    0
 .../habanalabs/include/gaudi/gaudi_async_events.h  |    0
 .../include/gaudi/gaudi_async_ids_map_extended.h   |    0
 .../habanalabs/include/gaudi/gaudi_coresight.h     |    0
 .../habanalabs/include/gaudi/gaudi_fw_if.h         |    0
 .../habanalabs/include/gaudi/gaudi_masks.h         |    0
 .../habanalabs/include/gaudi/gaudi_packets.h       |    0
 .../habanalabs/include/gaudi/gaudi_reg_map.h       |    0
 .../include/gaudi2/arc/gaudi2_arc_common_packets.h |  211 +
 .../gaudi2/asic_reg/arc_farm_arc0_acp_eng_regs.h   |    0
 .../gaudi2/asic_reg/arc_farm_arc0_aux_masks.h      |    0
 .../gaudi2/asic_reg/arc_farm_arc0_aux_regs.h       |    0
 .../asic_reg/arc_farm_arc0_dup_eng_axuser_regs.h   |    0
 .../gaudi2/asic_reg/arc_farm_arc0_dup_eng_regs.h   |    0
 .../asic_reg/arc_farm_kdma_ctx_axuser_masks.h      |    0
 .../asic_reg/arc_farm_kdma_ctx_axuser_regs.h       |    0
 .../gaudi2/asic_reg/arc_farm_kdma_ctx_masks.h      |    0
 .../gaudi2/asic_reg/arc_farm_kdma_ctx_regs.h       |    0
 .../gaudi2/asic_reg/arc_farm_kdma_kdma_cgm_regs.h  |    0
 .../include/gaudi2/asic_reg/arc_farm_kdma_masks.h  |    0
 .../include/gaudi2/asic_reg/arc_farm_kdma_regs.h   |    0
 .../include/gaudi2/asic_reg/cpu_if_regs.h          |    0
 .../gaudi2/asic_reg/dcore0_dec0_cmd_masks.h        |    0
 .../include/gaudi2/asic_reg/dcore0_dec0_cmd_regs.h |    0
 .../asic_reg/dcore0_edma0_core_ctx_axuser_regs.h   |    0
 .../gaudi2/asic_reg/dcore0_edma0_core_ctx_regs.h   |    0
 .../gaudi2/asic_reg/dcore0_edma0_core_masks.h      |    0
 .../gaudi2/asic_reg/dcore0_edma0_core_regs.h       |    0
 .../gaudi2/asic_reg/dcore0_edma0_qm_arc_aux_regs.h |    0
 .../dcore0_edma0_qm_axuser_nonsecured_regs.h       |    0
 .../gaudi2/asic_reg/dcore0_edma0_qm_cgm_regs.h     |    0
 .../gaudi2/asic_reg/dcore0_edma0_qm_masks.h        |    0
 .../include/gaudi2/asic_reg/dcore0_edma0_qm_regs.h |    0
 .../asic_reg/dcore0_edma1_core_ctx_axuser_regs.h   |    0
 .../dcore0_edma1_qm_axuser_nonsecured_regs.h       |    0
 .../gaudi2/asic_reg/dcore0_hmmu0_mmu_masks.h       |   15 +-
 .../gaudi2/asic_reg/dcore0_hmmu0_mmu_regs.h        |    0
 .../gaudi2/asic_reg/dcore0_hmmu0_stlb_masks.h      |   41 +-
 .../gaudi2/asic_reg/dcore0_hmmu0_stlb_regs.h       |    0
 .../include/gaudi2/asic_reg/dcore0_mme_acc_regs.h  |    0
 ...dcore0_mme_ctrl_lo_arch_agu_cout0_master_regs.h |    0
 .../dcore0_mme_ctrl_lo_arch_agu_cout0_slave_regs.h |    0
 ...dcore0_mme_ctrl_lo_arch_agu_cout1_master_regs.h |    0
 .../dcore0_mme_ctrl_lo_arch_agu_cout1_slave_regs.h |    0
 .../dcore0_mme_ctrl_lo_arch_agu_in0_master_regs.h  |    0
 .../dcore0_mme_ctrl_lo_arch_agu_in0_slave_regs.h   |    0
 .../dcore0_mme_ctrl_lo_arch_agu_in1_master_regs.h  |    0
 .../dcore0_mme_ctrl_lo_arch_agu_in1_slave_regs.h   |    0
 .../dcore0_mme_ctrl_lo_arch_agu_in2_master_regs.h  |    0
 .../dcore0_mme_ctrl_lo_arch_agu_in2_slave_regs.h   |    0
 .../dcore0_mme_ctrl_lo_arch_agu_in3_master_regs.h  |    0
 .../dcore0_mme_ctrl_lo_arch_agu_in3_slave_regs.h   |    0
 .../dcore0_mme_ctrl_lo_arch_agu_in4_master_regs.h  |    0
 .../dcore0_mme_ctrl_lo_arch_agu_in4_slave_regs.h   |    0
 .../dcore0_mme_ctrl_lo_arch_base_addr_regs.h       |    0
 .../dcore0_mme_ctrl_lo_arch_non_tensor_end_regs.h  |    6 +-
 ...dcore0_mme_ctrl_lo_arch_non_tensor_start_regs.h |    0
 .../dcore0_mme_ctrl_lo_arch_tensor_a_regs.h        |    0
 .../dcore0_mme_ctrl_lo_arch_tensor_b_regs.h        |    0
 .../dcore0_mme_ctrl_lo_arch_tensor_cout_regs.h     |    0
 .../gaudi2/asic_reg/dcore0_mme_ctrl_lo_masks.h     |    9 +-
 .../asic_reg/dcore0_mme_ctrl_lo_mme_axuser_regs.h  |    0
 .../gaudi2/asic_reg/dcore0_mme_ctrl_lo_regs.h      |    0
 .../asic_reg/dcore0_mme_qm_arc_acp_eng_regs.h      |    0
 .../gaudi2/asic_reg/dcore0_mme_qm_arc_aux_regs.h   |    0
 .../dcore0_mme_qm_arc_dup_eng_axuser_regs.h        |    0
 .../asic_reg/dcore0_mme_qm_arc_dup_eng_regs.h      |    0
 .../dcore0_mme_qm_axuser_nonsecured_regs.h         |    0
 .../asic_reg/dcore0_mme_qm_axuser_secured_regs.h   |    0
 .../gaudi2/asic_reg/dcore0_mme_qm_cgm_regs.h       |    0
 .../include/gaudi2/asic_reg/dcore0_mme_qm_regs.h   |    0
 .../gaudi2/asic_reg/dcore0_mme_sbte0_masks.h       |    0
 .../dcore0_mme_sbte0_mstr_if_axuser_regs.h         |    0
 .../asic_reg/dcore0_mme_wb0_mstr_if_axuser_regs.h  |    0
 .../gaudi2/asic_reg/dcore0_rtr0_ctrl_regs.h        |    0
 .../dcore0_rtr0_mstr_if_rr_prvt_hbw_regs.h         |    0
 .../dcore0_rtr0_mstr_if_rr_prvt_lbw_regs.h         |    0
 .../dcore0_rtr0_mstr_if_rr_shrd_hbw_regs.h         |    0
 .../dcore0_rtr0_mstr_if_rr_shrd_lbw_regs.h         |    0
 .../gaudi2/asic_reg/dcore0_sync_mngr_glbl_masks.h  |    0
 .../gaudi2/asic_reg/dcore0_sync_mngr_glbl_regs.h   |    0
 .../dcore0_sync_mngr_mstr_if_axuser_masks.h        |    0
 .../dcore0_sync_mngr_mstr_if_axuser_regs.h         |    0
 .../gaudi2/asic_reg/dcore0_sync_mngr_objs_masks.h  |    0
 .../gaudi2/asic_reg/dcore0_sync_mngr_objs_regs.h   |    0
 .../gaudi2/asic_reg/dcore0_tpc0_cfg_axuser_regs.h  |    0
 .../gaudi2/asic_reg/dcore0_tpc0_cfg_kernel_regs.h  |    0
 .../dcore0_tpc0_cfg_kernel_tensor_0_regs.h         |    0
 .../gaudi2/asic_reg/dcore0_tpc0_cfg_masks.h        |    0
 .../gaudi2/asic_reg/dcore0_tpc0_cfg_qm_regs.h      |    0
 .../asic_reg/dcore0_tpc0_cfg_qm_sync_object_regs.h |    0
 .../asic_reg/dcore0_tpc0_cfg_qm_tensor_0_regs.h    |    0
 .../include/gaudi2/asic_reg/dcore0_tpc0_cfg_regs.h |    0
 .../gaudi2/asic_reg/dcore0_tpc0_cfg_special_regs.h |    0
 .../asic_reg/dcore0_tpc0_eml_busmon_0_regs.h       |    0
 .../gaudi2/asic_reg/dcore0_tpc0_eml_etf_regs.h     |    0
 .../gaudi2/asic_reg/dcore0_tpc0_eml_funnel_regs.h  |    0
 .../gaudi2/asic_reg/dcore0_tpc0_eml_spmu_regs.h    |    0
 .../gaudi2/asic_reg/dcore0_tpc0_eml_stm_regs.h     |    0
 .../gaudi2/asic_reg/dcore0_tpc0_qm_arc_aux_regs.h  |    0
 .../dcore0_tpc0_qm_axuser_nonsecured_regs.h        |    0
 .../gaudi2/asic_reg/dcore0_tpc0_qm_cgm_regs.h      |    0
 .../include/gaudi2/asic_reg/dcore0_tpc0_qm_regs.h  |    0
 .../dcore0_vdec0_brdg_ctrl_axuser_dec_regs.h       |    0
 ...dcore0_vdec0_brdg_ctrl_axuser_msix_abnrm_regs.h |    0
 .../dcore0_vdec0_brdg_ctrl_axuser_msix_l2c_regs.h  |    0
 .../dcore0_vdec0_brdg_ctrl_axuser_msix_nrm_regs.h  |    0
 .../dcore0_vdec0_brdg_ctrl_axuser_msix_vcd_regs.h  |    0
 .../gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_masks.h |    6 +-
 .../gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_regs.h  |    0
 .../asic_reg/dcore0_vdec0_ctrl_special_regs.h      |    0
 .../gaudi2/asic_reg/dcore1_mme_ctrl_lo_regs.h      |    0
 .../gaudi2/asic_reg/dcore1_sync_mngr_glbl_regs.h   | 1203 ++++
 .../gaudi2/asic_reg/dcore3_mme_ctrl_lo_regs.h      |    0
 .../gaudi2/asic_reg/gaudi2_blocks_linux_driver.h   |    0
 .../include/gaudi2/asic_reg/gaudi2_regs.h          |    1 +
 .../include/gaudi2/asic_reg/nic0_qm0_cgm_regs.h    |    0
 .../include/gaudi2/asic_reg/nic0_qm0_regs.h        |    0
 .../gaudi2/asic_reg/nic0_qm_arc_aux0_regs.h        |    0
 .../include/gaudi2/asic_reg/nic0_qpc0_regs.h       |    0
 .../nic0_umr0_0_completion_queue_ci_1_regs.h       |    0
 .../asic_reg/nic0_umr0_0_unsecure_doorbell0_regs.h |    0
 .../include/gaudi2/asic_reg/pcie_aux_regs.h        |    0
 .../include/gaudi2/asic_reg/pcie_dbi_regs.h        |    3 +-
 .../include/gaudi2/asic_reg/pcie_dec0_cmd_masks.h  |    0
 .../include/gaudi2/asic_reg/pcie_dec0_cmd_regs.h   |    0
 .../pcie_vdec0_brdg_ctrl_axuser_dec_regs.h         |    0
 .../pcie_vdec0_brdg_ctrl_axuser_msix_abnrm_regs.h  |    0
 .../pcie_vdec0_brdg_ctrl_axuser_msix_l2c_regs.h    |    0
 .../pcie_vdec0_brdg_ctrl_axuser_msix_nrm_regs.h    |    0
 .../pcie_vdec0_brdg_ctrl_axuser_msix_vcd_regs.h    |    0
 .../gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_masks.h   |    3 +-
 .../gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_regs.h    |    0
 .../gaudi2/asic_reg/pcie_vdec0_ctrl_special_regs.h |    0
 .../include/gaudi2/asic_reg/pcie_wrap_regs.h       |    0
 .../gaudi2/asic_reg/pcie_wrap_special_regs.h       |    0
 .../gaudi2/asic_reg/pdma0_core_ctx_axuser_regs.h   |    0
 .../include/gaudi2/asic_reg/pdma0_core_ctx_regs.h  |    0
 .../include/gaudi2/asic_reg/pdma0_core_masks.h     |    0
 .../include/gaudi2/asic_reg/pdma0_core_regs.h      |    0
 .../gaudi2/asic_reg/pdma0_core_special_masks.h     |    0
 .../gaudi2/asic_reg/pdma0_qm_arc_aux_regs.h        |    0
 .../asic_reg/pdma0_qm_axuser_nonsecured_regs.h     |    0
 .../gaudi2/asic_reg/pdma0_qm_axuser_secured_regs.h |    0
 .../include/gaudi2/asic_reg/pdma0_qm_cgm_regs.h    |    0
 .../include/gaudi2/asic_reg/pdma0_qm_masks.h       |    0
 .../include/gaudi2/asic_reg/pdma0_qm_regs.h        |    0
 .../gaudi2/asic_reg/pdma1_core_ctx_axuser_regs.h   |    0
 .../asic_reg/pdma1_qm_axuser_nonsecured_regs.h     |    0
 .../include/gaudi2/asic_reg/pmmu_hbw_stlb_masks.h  |    3 +-
 .../include/gaudi2/asic_reg/pmmu_hbw_stlb_regs.h   |    0
 .../include/gaudi2/asic_reg/pmmu_pif_regs.h        |    0
 .../include/gaudi2/asic_reg/psoc_etr_masks.h       |    0
 .../include/gaudi2/asic_reg/psoc_etr_regs.h        |    0
 .../gaudi2/asic_reg/psoc_global_conf_masks.h       |   27 +-
 .../gaudi2/asic_reg/psoc_global_conf_regs.h        |    0
 .../gaudi2/asic_reg/psoc_reset_conf_masks.h        |    0
 .../include/gaudi2/asic_reg/psoc_reset_conf_regs.h |    0
 .../include/gaudi2/asic_reg/psoc_timestamp_regs.h  |    0
 .../include/gaudi2/asic_reg/rot0_desc_regs.h       |    0
 .../include/gaudi2/asic_reg/rot0_masks.h           |    0
 .../include/gaudi2/asic_reg/rot0_qm_arc_aux_regs.h |    0
 .../asic_reg/rot0_qm_axuser_nonsecured_regs.h      |    0
 .../include/gaudi2/asic_reg/rot0_qm_cgm_regs.h     |    0
 .../include/gaudi2/asic_reg/rot0_qm_regs.h         |    0
 .../habanalabs/include/gaudi2/asic_reg/rot0_regs.h |    0
 .../include/gaudi2/asic_reg/xbar_edge_0_regs.h     |    0
 .../include/gaudi2/asic_reg/xbar_mid_0_regs.h      |    0
 .../habanalabs/include/gaudi2/gaudi2.h             |    0
 .../include/gaudi2/gaudi2_async_events.h           |    1 +
 .../include/gaudi2/gaudi2_async_ids_map_extended.h |    2 +
 .../habanalabs/include/gaudi2/gaudi2_coresight.h   |    0
 .../habanalabs/include/gaudi2/gaudi2_fw_if.h       |   23 +-
 .../habanalabs/include/gaudi2/gaudi2_packets.h     |    4 +-
 .../habanalabs/include/gaudi2/gaudi2_reg_map.h     |   16 +-
 .../include/gaudi2/gaudi2_special_blocks.h         |  157 +
 .../include/goya/asic_reg/cpu_ca53_cfg_masks.h     |    0
 .../include/goya/asic_reg/cpu_ca53_cfg_regs.h      |    0
 .../habanalabs/include/goya/asic_reg/cpu_if_regs.h |    0
 .../include/goya/asic_reg/cpu_pll_regs.h           |    0
 .../include/goya/asic_reg/dma_ch_0_masks.h         |    0
 .../include/goya/asic_reg/dma_ch_0_regs.h          |    0
 .../include/goya/asic_reg/dma_ch_1_regs.h          |    0
 .../include/goya/asic_reg/dma_ch_2_regs.h          |    0
 .../include/goya/asic_reg/dma_ch_3_regs.h          |    0
 .../include/goya/asic_reg/dma_ch_4_regs.h          |    0
 .../include/goya/asic_reg/dma_macro_masks.h        |    0
 .../include/goya/asic_reg/dma_macro_regs.h         |    0
 .../include/goya/asic_reg/dma_nrtr_masks.h         |    0
 .../include/goya/asic_reg/dma_nrtr_regs.h          |    0
 .../include/goya/asic_reg/dma_qm_0_masks.h         |    0
 .../include/goya/asic_reg/dma_qm_0_regs.h          |    0
 .../include/goya/asic_reg/dma_qm_1_regs.h          |    0
 .../include/goya/asic_reg/dma_qm_2_regs.h          |    0
 .../include/goya/asic_reg/dma_qm_3_regs.h          |    0
 .../include/goya/asic_reg/dma_qm_4_regs.h          |    0
 .../habanalabs/include/goya/asic_reg/goya_blocks.h |    0
 .../habanalabs/include/goya/asic_reg/goya_masks.h  |    0
 .../habanalabs/include/goya/asic_reg/goya_regs.h   |    0
 .../habanalabs/include/goya/asic_reg/ic_pll_regs.h |    0
 .../habanalabs/include/goya/asic_reg/mc_pll_regs.h |    0
 .../include/goya/asic_reg/mme1_rtr_masks.h         |    0
 .../include/goya/asic_reg/mme1_rtr_regs.h          |    0
 .../include/goya/asic_reg/mme2_rtr_regs.h          |    0
 .../include/goya/asic_reg/mme3_rtr_regs.h          |    0
 .../include/goya/asic_reg/mme4_rtr_regs.h          |    0
 .../include/goya/asic_reg/mme5_rtr_regs.h          |    0
 .../include/goya/asic_reg/mme6_rtr_regs.h          |    0
 .../include/goya/asic_reg/mme_cmdq_masks.h         |    0
 .../include/goya/asic_reg/mme_cmdq_regs.h          |    0
 .../habanalabs/include/goya/asic_reg/mme_masks.h   |    0
 .../include/goya/asic_reg/mme_qm_masks.h           |    0
 .../habanalabs/include/goya/asic_reg/mme_qm_regs.h |    0
 .../habanalabs/include/goya/asic_reg/mme_regs.h    |    0
 .../habanalabs/include/goya/asic_reg/mmu_masks.h   |    0
 .../habanalabs/include/goya/asic_reg/mmu_regs.h    |    0
 .../include/goya/asic_reg/pci_nrtr_masks.h         |    0
 .../include/goya/asic_reg/pci_nrtr_regs.h          |    0
 .../include/goya/asic_reg/pcie_aux_regs.h          |    0
 .../include/goya/asic_reg/pcie_wrap_regs.h         |    0
 .../include/goya/asic_reg/psoc_emmc_pll_regs.h     |    0
 .../include/goya/asic_reg/psoc_etr_regs.h          |    0
 .../include/goya/asic_reg/psoc_global_conf_masks.h |    0
 .../include/goya/asic_reg/psoc_global_conf_regs.h  |    0
 .../include/goya/asic_reg/psoc_mme_pll_regs.h      |    0
 .../include/goya/asic_reg/psoc_pci_pll_regs.h      |    0
 .../include/goya/asic_reg/psoc_spi_regs.h          |    0
 .../include/goya/asic_reg/psoc_timestamp_regs.h    |    0
 .../include/goya/asic_reg/sram_y0_x0_rtr_regs.h    |    0
 .../include/goya/asic_reg/sram_y0_x1_rtr_regs.h    |    0
 .../include/goya/asic_reg/sram_y0_x2_rtr_regs.h    |    0
 .../include/goya/asic_reg/sram_y0_x3_rtr_regs.h    |    0
 .../include/goya/asic_reg/sram_y0_x4_rtr_regs.h    |    0
 .../habanalabs/include/goya/asic_reg/stlb_masks.h  |    0
 .../habanalabs/include/goya/asic_reg/stlb_regs.h   |    0
 .../include/goya/asic_reg/tpc0_cfg_masks.h         |    0
 .../include/goya/asic_reg/tpc0_cfg_regs.h          |    0
 .../include/goya/asic_reg/tpc0_cmdq_masks.h        |    0
 .../include/goya/asic_reg/tpc0_cmdq_regs.h         |    0
 .../include/goya/asic_reg/tpc0_eml_cfg_masks.h     |    0
 .../include/goya/asic_reg/tpc0_eml_cfg_regs.h      |    0
 .../include/goya/asic_reg/tpc0_nrtr_masks.h        |    0
 .../include/goya/asic_reg/tpc0_nrtr_regs.h         |    0
 .../include/goya/asic_reg/tpc0_qm_masks.h          |    0
 .../include/goya/asic_reg/tpc0_qm_regs.h           |    0
 .../include/goya/asic_reg/tpc1_cfg_regs.h          |    0
 .../include/goya/asic_reg/tpc1_cmdq_regs.h         |    0
 .../include/goya/asic_reg/tpc1_qm_regs.h           |    0
 .../include/goya/asic_reg/tpc1_rtr_regs.h          |    0
 .../include/goya/asic_reg/tpc2_cfg_regs.h          |    0
 .../include/goya/asic_reg/tpc2_cmdq_regs.h         |    0
 .../include/goya/asic_reg/tpc2_qm_regs.h           |    0
 .../include/goya/asic_reg/tpc2_rtr_regs.h          |    0
 .../include/goya/asic_reg/tpc3_cfg_regs.h          |    0
 .../include/goya/asic_reg/tpc3_cmdq_regs.h         |    0
 .../include/goya/asic_reg/tpc3_qm_regs.h           |    0
 .../include/goya/asic_reg/tpc3_rtr_regs.h          |    0
 .../include/goya/asic_reg/tpc4_cfg_regs.h          |    0
 .../include/goya/asic_reg/tpc4_cmdq_regs.h         |    0
 .../include/goya/asic_reg/tpc4_qm_regs.h           |    0
 .../include/goya/asic_reg/tpc4_rtr_regs.h          |    0
 .../include/goya/asic_reg/tpc5_cfg_regs.h          |    0
 .../include/goya/asic_reg/tpc5_cmdq_regs.h         |    0
 .../include/goya/asic_reg/tpc5_qm_regs.h           |    0
 .../include/goya/asic_reg/tpc5_rtr_regs.h          |    0
 .../include/goya/asic_reg/tpc6_cfg_regs.h          |    0
 .../include/goya/asic_reg/tpc6_cmdq_regs.h         |    0
 .../include/goya/asic_reg/tpc6_qm_regs.h           |    0
 .../include/goya/asic_reg/tpc6_rtr_regs.h          |    0
 .../include/goya/asic_reg/tpc7_cfg_regs.h          |    0
 .../include/goya/asic_reg/tpc7_cmdq_regs.h         |    0
 .../include/goya/asic_reg/tpc7_nrtr_regs.h         |    0
 .../include/goya/asic_reg/tpc7_qm_regs.h           |    0
 .../include/goya/asic_reg/tpc_pll_regs.h           |    0
 .../{misc =3D> accel}/habanalabs/include/goya/goya.h |    0
 .../habanalabs/include/goya/goya_async_events.h    |    0
 .../habanalabs/include/goya/goya_coresight.h       |    0
 .../habanalabs/include/goya/goya_fw_if.h           |    0
 .../habanalabs/include/goya/goya_packets.h         |    0
 .../habanalabs/include/goya/goya_reg_map.h         |    0
 .../habanalabs/include/hw_ip/mmu/mmu_general.h     |    0
 .../habanalabs/include/hw_ip/mmu/mmu_v1_0.h        |    0
 .../habanalabs/include/hw_ip/mmu/mmu_v1_1.h        |    0
 .../habanalabs/include/hw_ip/mmu/mmu_v2_0.h        |    0
 .../habanalabs/include/hw_ip/pci/pci_general.h     |    0
 drivers/accel/ivpu/Kconfig                         |   15 +
 drivers/accel/ivpu/Makefile                        |   16 +
 drivers/accel/ivpu/TODO                            |   11 +
 drivers/accel/ivpu/ivpu_drv.c                      |  655 ++
 drivers/accel/ivpu/ivpu_drv.h                      |  190 +
 drivers/accel/ivpu/ivpu_fw.c                       |  434 ++
 drivers/accel/ivpu/ivpu_fw.h                       |   38 +
 drivers/accel/ivpu/ivpu_gem.c                      |  749 ++
 drivers/accel/ivpu/ivpu_gem.h                      |  127 +
 drivers/accel/ivpu/ivpu_hw.h                       |  170 +
 drivers/accel/ivpu/ivpu_hw_mtl.c                   | 1084 +++
 drivers/accel/ivpu/ivpu_hw_mtl_reg.h               |  280 +
 drivers/accel/ivpu/ivpu_hw_reg_io.h                |  115 +
 drivers/accel/ivpu/ivpu_ipc.c                      |  510 ++
 drivers/accel/ivpu/ivpu_ipc.h                      |   93 +
 drivers/accel/ivpu/ivpu_job.c                      |  615 ++
 drivers/accel/ivpu/ivpu_job.h                      |   67 +
 drivers/accel/ivpu/ivpu_jsm_msg.c                  |  180 +
 drivers/accel/ivpu/ivpu_jsm_msg.h                  |   23 +
 drivers/accel/ivpu/ivpu_mmu.c                      |  883 +++
 drivers/accel/ivpu/ivpu_mmu.h                      |   50 +
 drivers/accel/ivpu/ivpu_mmu_context.c              |  398 ++
 drivers/accel/ivpu/ivpu_mmu_context.h              |   50 +
 drivers/accel/ivpu/ivpu_pm.c                       |  329 +
 drivers/accel/ivpu/ivpu_pm.h                       |   38 +
 drivers/accel/ivpu/vpu_boot_api.h                  |  349 +
 drivers/accel/ivpu/vpu_jsm_api.h                   | 1008 +++
 drivers/dma-buf/dma-buf-sysfs-stats.c              |    2 +-
 drivers/dma-buf/dma-buf.c                          |   14 +-
 drivers/dma-buf/dma-fence.c                        |    2 +-
 drivers/dma-buf/udmabuf.c                          |   28 +
 drivers/firmware/sysfb_simplefb.c                  |   43 +-
 drivers/gpu/drm/Kconfig                            |   67 +-
 drivers/gpu/drm/Makefile                           |    9 +-
 drivers/gpu/drm/amd/amdgpu/Kconfig                 |    2 +
 drivers/gpu/drm/amd/amdgpu/Makefile                |    7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |   10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   31 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h        |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c            |   11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c     |   24 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h             |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  125 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |    4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   25 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_encoders.c       |    1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.h         |    1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |    8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |    7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   51 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |    9 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c            |    1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |   42 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |   59 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h           |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  344 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  215 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c          |    7 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.c            |    9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           |   62 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h           |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c  |    8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.h  |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h          |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   27 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |  255 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |   44 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |   21 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            |   18 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |  210 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |    9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c          |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |  166 +-
 drivers/gpu/drm/amd/amdgpu/atombios_crtc.c         |    1 -
 drivers/gpu/drm/amd/amdgpu/atombios_encoders.c     |    1 -
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c              |   16 +-
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |    9 +-
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c             |    9 +-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |    9 +-
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |    9 +-
 drivers/gpu/drm/amd/amdgpu/df_v1_7.c               |    2 +-
 drivers/gpu/drm/amd/amdgpu/df_v4_3.c               |   61 +
 .../link/link_hwss_hpo_frl.h =3D> amdgpu/df_v4_3.h}  |   15 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  155 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  245 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0_3.c           |   88 +
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0_3.h           |   29 +
 drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c              |   33 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c              |   71 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |   97 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |  175 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c           |    2 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.c           |    2 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c           |    2 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0.c           |   13 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0_3.c         |   10 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |   39 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |   17 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c              |   16 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c              |   18 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |   18 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   39 +-
 drivers/gpu/drm/amd/amdgpu/imu_v11_0.c             |    7 +-
 drivers/gpu/drm/amd/amdgpu/mes_v10_1.c             |  108 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |  109 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c            |    2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c            |    2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c            |    2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c            |    2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0.c            |   37 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_1.c          |    6 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_2.c          |   12 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c            |    2 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c              |    6 +
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.h              |    1 +
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |    6 +
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.h              |    1 +
 drivers/gpu/drm/amd/amdgpu/nbio_v4_3.c             |    8 +-
 drivers/gpu/drm/amd/amdgpu/nv.c                    |  101 +-
 drivers/gpu/drm/amd/amdgpu/psp_v10_0.c             |   80 +-
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c             |  131 +-
 drivers/gpu/drm/amd/amdgpu/psp_v12_0.c             |   78 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |   27 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.c           |   14 +-
 drivers/gpu/drm/amd/amdgpu/psp_v3_1.c              |   16 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c             |   18 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c             |   18 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |   68 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |   30 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |   63 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |   74 +-
 drivers/gpu/drm/amd/amdgpu/smu_v13_0_10.c          |  303 +
 drivers/gpu/drm/amd/amdgpu/smu_v13_0_10.h          |   32 +
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |   67 +-
 drivers/gpu/drm/amd/amdgpu/ta_secureDisplay_if.h   |   24 +-
 drivers/gpu/drm/amd/amdgpu/umc_v6_7.c              |    7 -
 drivers/gpu/drm/amd/amdgpu/umc_v8_10.c             |   24 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |    5 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |    5 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |    5 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |    9 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |   71 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |   23 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |   11 -
 .../drm/amd/amdkfd/kfd_device_queue_manager_v9.c   |   27 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |    3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |    2 +
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |   14 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |    1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  786 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   83 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c  |  165 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h  |   26 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |   10 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |  205 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |  153 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.h |   17 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |  196 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |   91 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |   22 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h    |    1 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |    3 +
 drivers/gpu/drm/amd/display/dc/Makefile            |    5 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser.c  |    1 -
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |   17 +-
 .../gpu/drm/amd/display/dc/bios/command_table2.c   |   14 +-
 .../gpu/drm/amd/display/dc/bios/command_table2.h   |    3 +-
 drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |    1 +
 .../amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c   |    3 +-
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   |    1 +
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c |    2 +-
 .../drm/amd/display/dc/clk_mgr/dcn314/dcn314_smu.c |    3 +
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |   28 +-
 .../amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c |    2 +-
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |  101 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  156 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      | 4948 +------------
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   | 7553 ----------------=
----
 .../gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c  |   61 +-
 .../gpu/drm/amd/display/dc/core/dc_link_exports.c  |  103 +
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  121 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stat.c      |    1 +
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |   11 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |  220 +-
 drivers/gpu/drm/amd/display/dc/dc_bios_types.h     |    3 +-
 drivers/gpu/drm/amd/display/dc/dc_ddc_types.h      |   31 +
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |    2 +-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |  170 +-
 drivers/gpu/drm/amd/display/dc/dc_hdmi_types.h     |  134 +
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |   24 +
 drivers/gpu/drm/amd/display/dc/dc_link.h           |  199 +-
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |    5 +-
 drivers/gpu/drm/amd/display/dc/dc_types.h          |  112 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_aux.h       |    2 +-
 .../gpu/drm/amd/display/dc/dce/dce_link_encoder.c  |    1 -
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |    1 +
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |  102 +-
 .../amd/display/dc/dce110/dce110_hw_sequencer.h    |    2 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c  |    2 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.h    |   12 +-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |   30 +-
 .../drm/amd/display/dc/dcn10/dcn10_link_encoder.c  |    1 -
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.h  |    3 +-
 .../amd/display/dc/dcn10/dcn10_stream_encoder.c    |   15 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c   |   37 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |  119 +-
 .../drm/amd/display/dc/dcn20/dcn20_link_encoder.c  |    1 -
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |   17 +-
 .../amd/display/dc/dcn20/dcn20_stream_encoder.c    |   22 +-
 .../amd/display/dc/dcn201/dcn201_link_encoder.c    |    1 -
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hwseq.c |    6 +-
 .../drm/amd/display/dc/dcn21/dcn21_link_encoder.c  |    1 -
 .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |    6 +-
 .../amd/display/dc/dcn30/dcn30_dio_link_encoder.c  |    1 -
 .../display/dc/dcn30/dcn30_dio_stream_encoder.c    |   26 +
 .../display/dc/dcn30/dcn30_dio_stream_encoder.h    |    4 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |   53 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c  |    9 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.h  |    2 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |   24 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.h  |    3 +-
 .../display/dc/dcn301/dcn301_dio_link_encoder.c    |    1 -
 .../drm/amd/display/dc/dcn301/dcn301_resource.c    |    3 +-
 .../drm/amd/display/dc/dcn302/dcn302_resource.c    |   16 +
 .../drm/amd/display/dc/dcn303/dcn303_resource.c    |    6 +-
 .../amd/display/dc/dcn31/dcn31_dio_link_encoder.c  |    1 -
 .../display/dc/dcn31/dcn31_hpo_dp_link_encoder.c   |    5 +-
 .../display/dc/dcn31/dcn31_hpo_dp_stream_encoder.c |   25 +
 .../gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.c    |   18 +
 .../gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.h    |   12 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c |   63 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.h |    4 -
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c  |    4 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_optc.c  |   29 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_optc.h  |    5 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |    2 +-
 .../display/dc/dcn314/dcn314_dio_stream_encoder.c  |   13 +-
 .../display/dc/dcn314/dcn314_dio_stream_encoder.h  |    4 +
 .../gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c   |   30 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.h   |    2 +
 .../gpu/drm/amd/display/dc/dcn314/dcn314_init.c    |    6 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_optc.c    |    3 +-
 .../drm/amd/display/dc/dcn314/dcn314_resource.c    |   66 +-
 .../drm/amd/display/dc/dcn314/dcn314_resource.h    |    4 +
 .../drm/amd/display/dc/dcn316/dcn316_resource.c    |    2 +-
 .../amd/display/dc/dcn32/dcn32_dio_link_encoder.c  |    1 -
 .../display/dc/dcn32/dcn32_dio_stream_encoder.c    |   34 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.c    |   29 +
 .../gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.h    |   19 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubp.c  |    6 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubp.h  |    2 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c |  242 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.h |    2 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c  |    4 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  |   70 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.h  |   22 +-
 .../amd/display/dc/dcn32/dcn32_resource_helpers.c  |  209 +-
 .../display/dc/dcn321/dcn321_dio_link_encoder.c    |    1 -
 .../drm/amd/display/dc/dcn321/dcn321_resource.c    |   18 +-
 drivers/gpu/drm/amd/display/dc/dm_helpers.h        |    7 +
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |   58 +-
 .../amd/display/dc/dml/dcn20/display_mode_vba_20.c |    8 +-
 .../display/dc/dml/dcn20/display_mode_vba_20v2.c   |   10 +-
 .../amd/display/dc/dml/dcn21/display_mode_vba_21.c |   12 +-
 .../gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c   |    2 +-
 .../amd/display/dc/dml/dcn31/display_mode_vba_31.c |    4 +
 .../gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c |    7 +-
 .../display/dc/dml/dcn314/display_mode_vba_314.c   |    6 +-
 .../dc/dml/dcn314/display_rq_dlg_calc_314.c        |    2 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |  212 +-
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.c |   74 +-
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.h |    3 +-
 .../dc/dml/dcn32/display_mode_vba_util_32.c        |   64 +-
 .../dc/dml/dcn32/display_mode_vba_util_32.h        |   10 +-
 .../gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c |    7 +-
 .../gpu/drm/amd/display/dc/dml/display_mode_lib.h  |    1 +
 .../drm/amd/display/dc/dml/display_mode_structs.h  |    1 +
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.c  |    2 +
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.h  |    2 +
 drivers/gpu/drm/amd/display/dc/dsc/dscc_types.h    |    5 +-
 drivers/gpu/drm/amd/display/dc/dsc/rc_calc_dpi.c   |   10 +-
 .../amd/display/dc/gpio/dcn20/hw_factory_dcn20.c   |    6 +-
 .../amd/display/dc/gpio/dcn30/hw_factory_dcn30.c   |    6 +-
 .../amd/display/dc/gpio/dcn32/hw_factory_dcn32.c   |    6 +-
 drivers/gpu/drm/amd/display/dc/gpio/ddc_regs.h     |    7 +
 drivers/gpu/drm/amd/display/dc/hdcp/hdcp_msg.c     |    5 +-
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |   51 +-
 drivers/gpu/drm/amd/display/dc/inc/dc_link_ddc.h   |  133 -
 drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h    |  267 -
 drivers/gpu/drm/amd/display/dc/inc/dc_link_dpia.h  |  105 -
 drivers/gpu/drm/amd/display/dc/inc/hw/aux_engine.h |    8 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h   |    1 +
 .../gpu/drm/amd/display/dc/inc/hw/stream_encoder.h |   17 +
 .../drm/amd/display/dc/inc/hw/timing_generator.h   |    1 +
 drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h  |    1 +
 drivers/gpu/drm/amd/display/dc/inc/link.h          |  157 +
 drivers/gpu/drm/amd/display/dc/inc/resource.h      |   13 +-
 .../amd/display/dc/irq/dcn201/irq_service_dcn201.c |    7 +-
 drivers/gpu/drm/amd/display/dc/link/Makefile       |   37 +-
 .../amd/display/dc/link/accessories/link_dp_cts.c  | 1046 +++
 .../amd/display/dc/link/accessories/link_dp_cts.h  |   33 +
 .../dc/link/{ =3D> accessories}/link_dp_trace.c      |   18 +-
 .../dc/link/{ =3D> accessories}/link_dp_trace.h      |    6 +-
 .../amd/display/dc/link/accessories/link_fpga.c    |   95 +
 .../amd/display/dc/link/accessories/link_fpga.h    |   30 +
 .../amd/display/dc/link/{ =3D> hwss}/link_hwss_dio.c |   17 +-
 .../amd/display/dc/link/{ =3D> hwss}/link_hwss_dio.h |    1 +
 .../display/dc/link/{ =3D> hwss}/link_hwss_dpia.c    |    0
 .../display/dc/link/{ =3D> hwss}/link_hwss_dpia.h    |    0
 .../display/dc/link/{ =3D> hwss}/link_hwss_hpo_dp.c  |   42 +-
 .../display/dc/link/{ =3D> hwss}/link_hwss_hpo_dp.h  |    1 +
 .../gpu/drm/amd/display/dc/link/link_detection.c   | 1323 ++++
 .../gpu/drm/amd/display/dc/link/link_detection.h   |   30 +
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    | 2528 +++++++
 drivers/gpu/drm/amd/display/dc/link/link_dpms.h    |   40 +
 drivers/gpu/drm/amd/display/dc/link/link_factory.c |  577 ++
 drivers/gpu/drm/amd/display/dc/link/link_factory.h |   29 +
 .../gpu/drm/amd/display/dc/link/link_resource.c    |  114 +
 .../gpu/drm/amd/display/dc/link/link_resource.h    |   31 +
 .../gpu/drm/amd/display/dc/link/link_validation.c  |  398 ++
 .../gpu/drm/amd/display/dc/link/link_validation.h  |   28 +
 .../dc_link_ddc.c =3D> link/protocols/link_ddc.c}    |  410 +-
 .../link/protocols/link_ddc.h}                     |   70 +-
 .../display/dc/link/protocols/link_dp_capability.c | 2246 ++++++
 .../display/dc/link/protocols/link_dp_capability.h |   79 +
 .../amd/display/dc/link/protocols/link_dp_dpia.c   |  106 +
 .../display/dc/link/protocols/link_dp_dpia.h}      |   42 +-
 .../display/dc/link/protocols/link_dp_dpia_bw.c    |  441 ++
 .../dc/link/{ =3D> protocols}/link_dp_dpia_bw.h      |   36 +-
 .../dc/link/protocols/link_dp_irq_handler.c        |  389 +
 .../link_dp_irq_handler.h}                         |   11 +-
 .../amd/display/dc/link/protocols/link_dp_phy.c    |  208 +
 .../amd/display/dc/link/protocols/link_dp_phy.h    |   56 +
 .../display/dc/link/protocols/link_dp_training.c   | 1701 +++++
 .../display/dc/link/protocols/link_dp_training.h   |  182 +
 .../dc/link/protocols/link_dp_training_128b_132b.c |  259 +
 .../dc/link/protocols/link_dp_training_128b_132b.h |   42 +
 .../dc/link/protocols/link_dp_training_8b_10b.c    |  414 ++
 .../dc/link/protocols/link_dp_training_8b_10b.h    |   61 +
 .../dc/link/protocols/link_dp_training_auxless.c   |   79 +
 .../dc/link/protocols/link_dp_training_auxless.h   |   35 +
 .../protocols/link_dp_training_dpia.c}             |  312 +-
 .../dc/link/protocols/link_dp_training_dpia.h      |   41 +
 .../link_dp_training_fixed_vs_pe_retimer.c         |  579 ++
 .../link_dp_training_fixed_vs_pe_retimer.h         |   45 +
 .../dc_link_dpcd.c =3D> link/protocols/link_dpcd.c}  |   13 +-
 .../display/dc/{inc =3D> link/protocols}/link_dpcd.h |    5 +-
 .../dc/link/protocols/link_edp_panel_control.c     |  833 +++
 .../dc/link/protocols/link_edp_panel_control.h     |   33 +
 .../drm/amd/display/dc/link/protocols/link_hpd.c   |  240 +
 .../drm/amd/display/dc/link/protocols/link_hpd.h   |   47 +
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |   17 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  124 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |   12 +
 .../gpu/drm/amd/display/dmub/src/dmub_srv_stat.c   |   21 +
 .../drm/amd/display/include/ddc_service_types.h    |    6 +
 drivers/gpu/drm/amd/display/include/dpcd_defs.h    |    5 +-
 .../drm/amd/display/include/link_service_types.h   |    7 +-
 .../drm/amd/display/modules/color/color_gamma.c    |  140 +-
 .../drm/amd/display/modules/color/color_gamma.h    |    3 -
 .../drm/amd/display/modules/freesync/freesync.c    |   74 +-
 .../drm/amd/display/modules/inc/mod_info_packet.h  |   36 +
 .../amd/display/modules/info_packet/info_packet.c  |   55 +
 .../drm/amd/display/modules/power/power_helpers.c  |   31 +
 .../drm/amd/display/modules/power/power_helpers.h  |    3 +
 drivers/gpu/drm/amd/include/amd_shared.h           |    1 +
 .../drm/amd/include/asic_reg/df/df_4_3_offset.h    |   30 +
 .../drm/amd/include/asic_reg/df/df_4_3_sh_mask.h   |  157 +
 .../drm/amd/include/asic_reg/gc/gc_11_0_3_offset.h |    8 +
 .../amd/include/asic_reg/gc/gc_11_0_3_sh_mask.h    |   50 +
 .../amd/include/asic_reg/xgmi/xgmi_6_1_0_sh_mask.h |   87 +
 .../amd/include/ivsrcid/gfx/irqsrcs_gfx_11_0_0.h   |    2 +
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |    3 +
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |   18 +
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |   10 +-
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |    1 +
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c         |   11 +-
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |   13 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c   |   16 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |   87 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c    |   16 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c  |   32 +-
 .../pm/powerplay/hwmgr/vega10_processpptables.c    |    1 -
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c  |   23 +-
 .../pm/powerplay/hwmgr/vega12_processpptables.c    |    1 -
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c  |   21 +-
 .../pm/powerplay/hwmgr/vega20_processpptables.c    |    1 -
 drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h       |    2 +
 .../gpu/drm/amd/pm/powerplay/inc/smu11_driver_if.h |    2 +
 .../gpu/drm/amd/pm/powerplay/inc/smu9_driver_if.h  |    2 +
 .../amd/pm/powerplay/inc/vega12/smu9_driver_if.h   |    2 +
 .../gpu/drm/amd/pm/powerplay/smumgr/ci_smumgr.c    |    3 +-
 .../drm/amd/pm/powerplay/smumgr/iceland_smumgr.c   |    2 +-
 .../gpu/drm/amd/pm/powerplay/smumgr/smu10_smumgr.c |   10 +-
 .../gpu/drm/amd/pm/powerplay/smumgr/tonga_smumgr.c |    2 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   57 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |    2 +
 .../swsmu/inc/pmfw_if/smu11_driver_if_arcturus.h   |    2 +
 .../pm/swsmu/inc/pmfw_if/smu11_driver_if_navi10.h  |    2 +
 .../inc/pmfw_if/smu11_driver_if_sienna_cichlid.h   |    2 +
 .../swsmu/inc/pmfw_if/smu13_driver_if_aldebaran.h  |    2 +
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h |    7 +-
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_7.h |   31 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_0_ppsmc.h   |    1 +
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |    3 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |    9 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |    6 +
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |   51 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |   67 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   80 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |    1 +
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |    6 +
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h             |    3 +
 drivers/gpu/drm/arm/display/komeda/komeda_crtc.c   |    1 -
 drivers/gpu/drm/arm/display/komeda/komeda_drv.c    |    1 +
 drivers/gpu/drm/arm/display/komeda/komeda_kms.h    |    1 -
 drivers/gpu/drm/arm/hdlcd_drv.c                    |   24 +-
 drivers/gpu/drm/armada/armada_fbdev.c              |    7 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c           |    1 -
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c            |    1 -
 drivers/gpu/drm/aspeed/aspeed_gfx_out.c            |    1 -
 drivers/gpu/drm/ast/Kconfig                        |    2 +
 drivers/gpu/drm/ast/ast_drv.c                      |    1 -
 drivers/gpu/drm/ast/ast_main.c                     |    1 -
 drivers/gpu/drm/ast/ast_mode.c                     |    3 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c       |    9 +-
 drivers/gpu/drm/bridge/Kconfig                     |   11 -
 drivers/gpu/drm/bridge/Makefile                    |    1 -
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |    5 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c |    6 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c |    5 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |    7 +-
 drivers/gpu/drm/bridge/cadence/Kconfig             |   21 +
 drivers/gpu/drm/bridge/cadence/Makefile            |    3 +
 .../bridge/{cdns-dsi.c =3D> cadence/cdns-dsi-core.c} |   83 +-
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h     |   84 +
 drivers/gpu/drm/bridge/cadence/cdns-dsi-j721e.c    |   51 +
 drivers/gpu/drm/bridge/cadence/cdns-dsi-j721e.h    |   16 +
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |    1 -
 drivers/gpu/drm/bridge/chipone-icn6211.c           |    5 +-
 drivers/gpu/drm/bridge/chrontel-ch7033.c           |    5 +-
 drivers/gpu/drm/bridge/fsl-ldb.c                   |   80 +-
 drivers/gpu/drm/bridge/ite-it6505.c                |  133 +-
 drivers/gpu/drm/bridge/ite-it66121.c               |  321 +-
 drivers/gpu/drm/bridge/lontium-lt8912b.c           |   26 +-
 drivers/gpu/drm/bridge/lontium-lt9211.c            |    5 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            |  346 +-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |    5 +-
 .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   |   16 +-
 drivers/gpu/drm/bridge/nxp-ptn3460.c               |    5 +-
 drivers/gpu/drm/bridge/panel.c                     |   13 +-
 drivers/gpu/drm/bridge/parade-ps8622.c             |    6 +-
 drivers/gpu/drm/bridge/parade-ps8640.c             |   22 +-
 drivers/gpu/drm/bridge/sii902x.c                   |   38 +-
 drivers/gpu/drm/bridge/sii9234.c                   |    5 +-
 drivers/gpu/drm/bridge/sil-sii8620.c               |    5 +-
 drivers/gpu/drm/bridge/tc358764.c                  |    1 +
 drivers/gpu/drm/bridge/tc358767.c                  |   12 +-
 drivers/gpu/drm/bridge/tc358768.c                  |    6 +-
 drivers/gpu/drm/bridge/tc358775.c                  |    5 +-
 drivers/gpu/drm/bridge/ti-sn65dsi83.c              |    8 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |    5 +-
 drivers/gpu/drm/bridge/ti-tfp410.c                 |    5 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c      |   71 +-
 drivers/gpu/drm/drm_atomic.c                       |   23 +-
 drivers/gpu/drm/drm_atomic_state_helper.c          |  124 +
 drivers/gpu/drm/drm_atomic_uapi.c                  |    4 +
 drivers/gpu/drm/drm_blend.c                        |   13 +-
 drivers/gpu/drm/drm_bridge.c                       |  294 +-
 drivers/gpu/drm/drm_bridge_connector.c             |   27 +-
 drivers/gpu/drm/drm_bufs.c                         |   12 +-
 drivers/gpu/drm/drm_client.c                       |   21 +-
 drivers/gpu/drm/drm_client_modeset.c               |    4 -
 drivers/gpu/drm/drm_connector.c                    |  174 +-
 drivers/gpu/drm/drm_context.c                      |   36 +-
 drivers/gpu/drm/drm_debugfs.c                      |  110 +-
 drivers/gpu/drm/drm_drv.c                          |    7 +-
 drivers/gpu/drm/drm_edid.c                         |  528 +-
 drivers/gpu/drm/drm_fb_helper.c                    |  321 +-
 drivers/gpu/drm/drm_fbdev_generic.c                |  130 +-
 drivers/gpu/drm/drm_file.c                         |   18 +-
 drivers/gpu/drm/drm_format_helper.c                |  496 +-
 drivers/gpu/drm/drm_fourcc.c                       |    4 +
 drivers/gpu/drm/drm_framebuffer.c                  |   11 +-
 drivers/gpu/drm/drm_gem.c                          |   19 +-
 drivers/gpu/drm/drm_gem_atomic_helper.c            |   31 +-
 drivers/gpu/drm/drm_gem_dma_helper.c               |    4 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c             |   73 +-
 drivers/gpu/drm/drm_gem_ttm_helper.c               |    2 +
 drivers/gpu/drm/drm_gem_vram_helper.c              |   12 +-
 drivers/gpu/drm/drm_internal.h                     |    5 +
 drivers/gpu/drm/drm_ioc32.c                        |   13 +-
 drivers/gpu/drm/drm_ioctl.c                        |   25 +-
 drivers/gpu/drm/drm_lease.c                        |   66 +-
 drivers/gpu/drm/drm_mipi_dbi.c                     |  158 +-
 drivers/gpu/drm/drm_mipi_dsi.c                     |   52 +
 drivers/gpu/drm/drm_mode_config.c                  |   10 +-
 drivers/gpu/drm/drm_modes.c                        |  551 +-
 drivers/gpu/drm/drm_panel_orientation_quirks.c     |   39 +-
 drivers/gpu/drm/drm_plane.c                        |    5 +
 drivers/gpu/drm/drm_plane_helper.c                 |    1 -
 drivers/gpu/drm/drm_probe_helper.c                 |  160 +-
 drivers/gpu/drm/drm_simple_kms_helper.c            |    2 +-
 drivers/gpu/drm/etnaviv/etnaviv_drv.c              |   54 +-
 drivers/gpu/drm/etnaviv/etnaviv_drv.h              |    5 +
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c       |    9 +-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c              |   66 +-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h              |    8 +-
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c             |   36 +
 drivers/gpu/drm/etnaviv/etnaviv_sched.c            |   18 +-
 drivers/gpu/drm/etnaviv/state_hi.xml.h             |   86 +-
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c      |   13 +-
 drivers/gpu/drm/exynos/exynos7_drm_decon.c         |   12 +-
 drivers/gpu/drm/exynos/exynos_dp.c                 |   11 +-
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            |   50 +-
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c          |    7 +-
 drivers/gpu/drm/exynos/exynos_drm_fimc.c           |   11 +-
 drivers/gpu/drm/exynos/exynos_drm_fimd.c           |   11 +-
 drivers/gpu/drm/exynos/exynos_drm_g2d.c            |   10 +-
 drivers/gpu/drm/exynos/exynos_drm_mic.c            |   11 +-
 drivers/gpu/drm/exynos/exynos_drm_rotator.c        |   12 +-
 drivers/gpu/drm/exynos/exynos_drm_scaler.c         |   12 +-
 drivers/gpu/drm/gma500/Kconfig                     |    2 +
 drivers/gpu/drm/gma500/backlight.c                 |    2 +
 drivers/gpu/drm/gma500/cdv_device.c                |    1 +
 drivers/gpu/drm/gma500/cdv_intel_crt.c             |    2 +
 drivers/gpu/drm/gma500/cdv_intel_display.c         |    1 +
 drivers/gpu/drm/gma500/cdv_intel_dp.c              |    1 +
 drivers/gpu/drm/gma500/cdv_intel_hdmi.c            |    2 +
 drivers/gpu/drm/gma500/cdv_intel_lvds.c            |    2 +
 drivers/gpu/drm/gma500/framebuffer.c               |   13 +-
 drivers/gpu/drm/gma500/gma_display.c               |    2 +
 drivers/gpu/drm/gma500/oaktrail_crtc.c             |    1 +
 drivers/gpu/drm/gma500/oaktrail_hdmi.c             |    2 +
 drivers/gpu/drm/gma500/oaktrail_lvds.c             |    1 +
 drivers/gpu/drm/gma500/psb_device.c                |    1 +
 drivers/gpu/drm/gma500/psb_intel_display.c         |    3 +
 drivers/gpu/drm/gma500/psb_intel_drv.h             |    1 -
 drivers/gpu/drm/gma500/psb_intel_lvds.c            |    2 +
 drivers/gpu/drm/gma500/psb_intel_sdvo.c            |    2 +
 drivers/gpu/drm/gud/gud_connector.c                |   10 +-
 drivers/gpu/drm/gud/gud_drv.c                      |   18 +-
 drivers/gpu/drm/gud/gud_internal.h                 |    1 +
 drivers/gpu/drm/gud/gud_pipe.c                     |  223 +-
 drivers/gpu/drm/hisilicon/hibmc/Kconfig            |    2 +
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c    |    4 +-
 drivers/gpu/drm/i2c/ch7006_drv.c                   |   14 +-
 drivers/gpu/drm/i2c/ch7006_priv.h                  |    1 -
 drivers/gpu/drm/i2c/sil164_drv.c                   |    4 +-
 drivers/gpu/drm/i2c/tda9950.c                      |    5 +-
 drivers/gpu/drm/i2c/tda998x_drv.c                  |    4 +-
 drivers/gpu/drm/i810/Makefile                      |    8 -
 drivers/gpu/drm/i810/i810_dma.c                    | 1266 ----
 drivers/gpu/drm/i810/i810_drv.c                    |  101 -
 drivers/gpu/drm/i810/i810_drv.h                    |  246 -
 drivers/gpu/drm/i915/Kconfig                       |   17 +-
 drivers/gpu/drm/i915/Makefile                      |   20 +-
 drivers/gpu/drm/i915/display/dvo_ch7xxx.c          |   22 +-
 drivers/gpu/drm/i915/display/dvo_sil164.c          |   13 +-
 drivers/gpu/drm/i915/display/g4x_dp.c              |    2 +
 drivers/gpu/drm/i915/display/g4x_hdmi.c            |    2 +
 drivers/gpu/drm/i915/display/icl_dsi.c             |    5 +-
 drivers/gpu/drm/i915/display/intel_atomic.c        |   85 +-
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |    1 +
 drivers/gpu/drm/i915/display/intel_audio.c         |  328 +-
 drivers/gpu/drm/i915/display/intel_audio.h         |    9 +
 drivers/gpu/drm/i915/display/intel_backlight.c     |  573 +-
 .../gpu/drm/i915/display/intel_backlight_regs.h    |   27 +-
 drivers/gpu/drm/i915/display/intel_bios.c          |  115 +-
 drivers/gpu/drm/i915/display/intel_bios.h          |   13 +-
 drivers/gpu/drm/i915/display/intel_bw.h            |    2 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |  216 +-
 drivers/gpu/drm/i915/display/intel_cdclk.h         |    2 +-
 drivers/gpu/drm/i915/display/intel_color.c         | 1269 +++-
 drivers/gpu/drm/i915/display/intel_color.h         |   10 +-
 drivers/gpu/drm/i915/display/intel_connector.c     |    7 +-
 drivers/gpu/drm/i915/display/intel_crt.c           |   53 +-
 drivers/gpu/drm/i915/display/intel_crtc.c          |    1 +
 .../gpu/drm/i915/display/intel_crtc_state_dump.c   |   17 +
 drivers/gpu/drm/i915/display/intel_ddi.c           |   30 +-
 drivers/gpu/drm/i915/display/intel_de.h            |   46 +-
 drivers/gpu/drm/i915/display/intel_display.c       |  219 +-
 drivers/gpu/drm/i915/display/intel_display.h       |  123 +-
 drivers/gpu/drm/i915/display/intel_display_core.h  |   34 +-
 .../gpu/drm/i915/display/intel_display_limits.h    |  124 +
 drivers/gpu/drm/i915/display/intel_display_power.c |    2 +-
 .../gpu/drm/i915/display/intel_display_power_map.c |    1 +
 drivers/gpu/drm/i915/display/intel_display_trace.h |    1 +
 drivers/gpu/drm/i915/display/intel_display_types.h |   39 +-
 drivers/gpu/drm/i915/display/intel_dmc.c           |  135 +-
 drivers/gpu/drm/i915/display/intel_dmc.h           |    5 +-
 drivers/gpu/drm/i915/display/intel_dmc_regs.h      |   10 +
 drivers/gpu/drm/i915/display/intel_dp.c            |  306 +-
 drivers/gpu/drm/i915/display/intel_dp.h            |   19 +
 drivers/gpu/drm/i915/display/intel_dp_aux.c        |   41 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |  310 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.h        |    4 +
 drivers/gpu/drm/i915/display/intel_dpio_phy.c      |    9 +-
 drivers/gpu/drm/i915/display/intel_dpll.c          |    2 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |    4 +-
 drivers/gpu/drm/i915/display/intel_drrs.c          |    8 +-
 drivers/gpu/drm/i915/display/intel_dsb.c           |  328 +-
 drivers/gpu/drm/i915/display/intel_dsb.h           |   14 +-
 drivers/gpu/drm/i915/display/intel_dvo.c           |  410 +-
 drivers/gpu/drm/i915/display/intel_dvo_dev.h       |    7 +-
 drivers/gpu/drm/i915/display/intel_dvo_regs.h      |   54 +
 drivers/gpu/drm/i915/display/intel_fb.c            |    2 +-
 drivers/gpu/drm/i915/display/intel_fb_pin.c        |    2 +-
 drivers/gpu/drm/i915/display/intel_fbc.c           |   32 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c         |   31 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c         |   46 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |   53 +-
 drivers/gpu/drm/i915/display/intel_hti.c           |    3 +
 drivers/gpu/drm/i915/display/intel_lvds.c          |   53 +-
 drivers/gpu/drm/i915/display/intel_modeset_setup.c |    4 +-
 drivers/gpu/drm/i915/display/intel_opregion.c      |   29 +-
 drivers/gpu/drm/i915/display/intel_opregion.h      |    4 +-
 drivers/gpu/drm/i915/display/intel_panel.c         |   19 +-
 drivers/gpu/drm/i915/display/intel_panel.h         |    5 +-
 drivers/gpu/drm/i915/display/intel_pch_refclk.c    |   10 +-
 drivers/gpu/drm/i915/display/intel_pipe_crc.c      |   23 +-
 drivers/gpu/drm/i915/display/intel_plane_initial.c |    2 +-
 drivers/gpu/drm/i915/display/intel_pps.c           |  360 +-
 drivers/gpu/drm/i915/display/intel_pps.h           |    2 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |  101 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c          |   47 +-
 drivers/gpu/drm/i915/display/intel_snps_phy.c      |   17 +-
 drivers/gpu/drm/i915/display/intel_tc.c            |   55 +-
 drivers/gpu/drm/i915/display/intel_tv.c            |    4 +-
 drivers/gpu/drm/i915/display/intel_vblank.c        |  441 ++
 drivers/gpu/drm/i915/display/intel_vblank.h        |   23 +
 drivers/gpu/drm/i915/display/intel_vdsc.c          |   11 +-
 drivers/gpu/drm/i915/display/intel_vga.c           |   32 +-
 drivers/gpu/drm/i915/display/intel_vrr.c           |   55 +-
 drivers/gpu/drm/i915/display/skl_scaler.c          |   49 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.c |    2 +-
 drivers/gpu/drm/i915/display/skl_watermark.c       |   42 +-
 drivers/gpu/drm/i915/display/skl_watermark.h       |    2 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c             |    4 +-
 drivers/gpu/drm/i915/gem/i915_gem_clflush.c        |    1 +
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |   29 +-
 drivers/gpu/drm/i915/gem/i915_gem_create.c         |    3 +-
 drivers/gpu/drm/i915/gem/i915_gem_domain.c         |   16 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |   35 +-
 drivers/gpu/drm/i915/gem/i915_gem_internal.c       |    7 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c           |    2 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |    7 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |  303 +-
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |    2 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c          |   27 +-
 drivers/gpu/drm/i915/gem/i915_gem_phys.c           |    4 +
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c          |   25 +-
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c       |    2 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |   42 +-
 drivers/gpu/drm/i915/gem/i915_gem_tiling.c         |   13 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |   58 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c       |   58 +-
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c        |    6 +-
 .../gpu/drm/i915/gem/selftests/huge_gem_object.c   |    6 +-
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c    |   10 +-
 .../drm/i915/gem/selftests/i915_gem_client_blt.c   |   23 +-
 .../drm/i915/gem/selftests/i915_gem_coherency.c    |    2 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_context.c  |   35 +-
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |   10 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_object.c   |    8 +-
 drivers/gpu/drm/i915/gem/selftests/igt_gem_utils.c |   15 +-
 drivers/gpu/drm/i915/gem/selftests/igt_gem_utils.h |    2 +-
 drivers/gpu/drm/i915/gt/gen7_renderclear.c         |    2 +-
 drivers/gpu/drm/i915/gt/intel_context.c            |    4 +-
 drivers/gpu/drm/i915/gt/intel_context.h            |    3 +-
 drivers/gpu/drm/i915/gt/intel_engine.h             |    6 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |  103 +-
 drivers/gpu/drm/i915/gt/intel_engine_pm.c          |   18 +
 drivers/gpu/drm/i915/gt/intel_engine_regs.h        |    1 +
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |   33 +-
 .../gpu/drm/i915/gt/intel_execlists_submission.h   |    4 +
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |  191 +-
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c       |    4 +-
 drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c          |    6 +-
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h       |    7 +
 drivers/gpu/drm/i915/gt/intel_gsc.c                |    8 +
 drivers/gpu/drm/i915/gt/intel_gt.c                 |  167 +-
 drivers/gpu/drm/i915/gt/intel_gt.h                 |    5 +
 drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c     |    8 +-
 drivers/gpu/drm/i915/gt/intel_gt_debugfs.c         |    2 -
 drivers/gpu/drm/i915/gt/intel_gt_irq.c             |   11 +-
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c             |  141 +-
 drivers/gpu/drm/i915/gt/intel_gt_mcr.h             |    2 +
 drivers/gpu/drm/i915/gt/intel_gt_pm.c              |   17 +-
 drivers/gpu/drm/i915/gt/intel_gt_print.h           |   51 +
 drivers/gpu/drm/i915/gt/intel_gt_regs.h            |   45 +-
 drivers/gpu/drm/i915/gt/intel_gt_sysfs.c           |    4 +-
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c        |   42 +-
 drivers/gpu/drm/i915/gt/intel_gt_types.h           |   20 +-
 drivers/gpu/drm/i915/gt/intel_gtt.c                |   34 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h                |   30 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c                |    6 +-
 drivers/gpu/drm/i915/gt/intel_migrate.c            |    6 +-
 drivers/gpu/drm/i915/gt/intel_mocs.c               |    3 +
 drivers/gpu/drm/i915/gt/intel_rc6.c                |   12 +-
 drivers/gpu/drm/i915/gt/intel_renderstate.c        |    2 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |   18 +-
 drivers/gpu/drm/i915/gt/intel_ring_submission.c    |    2 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |    1 +
 drivers/gpu/drm/i915/gt/intel_rps.h                |    3 +
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |  316 +-
 drivers/gpu/drm/i915/gt/selftest_engine_cs.c       |    8 +-
 drivers/gpu/drm/i915/gt/selftest_execlists.c       |   30 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c       |   15 +-
 drivers/gpu/drm/i915/gt/selftest_lrc.c             |   20 +-
 drivers/gpu/drm/i915/gt/selftest_migrate.c         |  173 +-
 drivers/gpu/drm/i915/gt/selftest_mocs.c            |    4 +-
 drivers/gpu/drm/i915/gt/selftest_reset.c           |    2 +-
 drivers/gpu/drm/i915/gt/selftest_ring_submission.c |    2 +-
 drivers/gpu/drm/i915/gt/selftest_rps.c             |   12 +-
 drivers/gpu/drm/i915/gt/selftest_workarounds.c     |   20 +-
 drivers/gpu/drm/i915/gt/shmem_utils.c              |    7 +-
 drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h      |    6 +-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c          |  210 +
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h          |   15 +
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c          |  137 +
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h          |   47 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |   47 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h             |   11 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c         |    8 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c     |    8 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c          |   23 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c          |   22 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c         |   38 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_print.h       |   48 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |  120 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c          |    2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c              |   99 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.h              |    3 +
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           |  291 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h           |   23 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h       |    3 +-
 drivers/gpu/drm/i915/gvt/cmd_parser.c              |    1 +
 drivers/gpu/drm/i915/gvt/display.c                 |    1 +
 drivers/gpu/drm/i915/gvt/dmabuf.c                  |   10 +-
 drivers/gpu/drm/i915/gvt/fb_decoder.h              |    2 +-
 drivers/gpu/drm/i915/i915_cmd_parser.c             |    4 +-
 drivers/gpu/drm/i915/i915_config.c                 |    5 +-
 drivers/gpu/drm/i915/i915_config.h                 |   23 +
 drivers/gpu/drm/i915/i915_debugfs.c                |    8 +-
 drivers/gpu/drm/i915/i915_debugfs_params.c         |   33 +-
 drivers/gpu/drm/i915/i915_deps.c                   |    2 +-
 drivers/gpu/drm/i915/i915_driver.c                 |  194 +-
 drivers/gpu/drm/i915/i915_drv.h                    |  134 +-
 drivers/gpu/drm/i915/i915_gem.c                    |   22 +-
 drivers/gpu/drm/i915/i915_gem.h                    |    7 +
 drivers/gpu/drm/i915/i915_gem_evict.c              |   51 +-
 drivers/gpu/drm/i915/i915_gem_gtt.h                |    5 +-
 drivers/gpu/drm/i915/i915_gpu_error.c              |   92 +-
 drivers/gpu/drm/i915/i915_gpu_error.h              |    2 +-
 drivers/gpu/drm/i915/i915_hwmon.c                  |   43 +-
 drivers/gpu/drm/i915/i915_irq.c                    |  436 +-
 drivers/gpu/drm/i915/i915_irq.h                    |    6 -
 drivers/gpu/drm/i915/i915_params.c                 |   91 +-
 drivers/gpu/drm/i915/i915_params.h                 |    1 +
 drivers/gpu/drm/i915/i915_pci.c                    |   53 +-
 drivers/gpu/drm/i915/i915_perf.c                   |   51 +-
 drivers/gpu/drm/i915/i915_reg.h                    |  110 +-
 drivers/gpu/drm/i915/i915_request.c                |    1 +
 drivers/gpu/drm/i915/i915_scatterlist.c            |   13 +
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c      |    2 +-
 drivers/gpu/drm/i915/i915_utils.h                  |    4 +-
 drivers/gpu/drm/i915/i915_vma.c                    |   80 +-
 drivers/gpu/drm/i915/i915_vma.h                    |   52 +-
 drivers/gpu/drm/i915/i915_vma_resource.c           |    4 +-
 drivers/gpu/drm/i915/i915_vma_resource.h           |   17 +-
 drivers/gpu/drm/i915/i915_vma_types.h              |    3 +-
 drivers/gpu/drm/i915/intel_device_info.c           |    7 +
 drivers/gpu/drm/i915/intel_device_info.h           |    2 +-
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c        |    1 +
 drivers/gpu/drm/i915/intel_mchbar_regs.h           |    2 +
 drivers/gpu/drm/i915/intel_memory_region.c         |    2 +-
 drivers/gpu/drm/i915/intel_pm.c                    |   11 +-
 drivers/gpu/drm/i915/intel_pm_types.h              |    2 +-
 drivers/gpu/drm/i915/intel_region_ttm.c            |   17 +-
 drivers/gpu/drm/i915/intel_runtime_pm.h            |    2 +-
 drivers/gpu/drm/i915/intel_uncore.c                |   59 +
 drivers/gpu/drm/i915/intel_uncore.h                |   13 +
 drivers/gpu/drm/i915/intel_wakeref.h               |   21 +-
 drivers/gpu/drm/i915/pxp/intel_pxp.c               |  128 +-
 drivers/gpu/drm/i915/pxp/intel_pxp.h               |    9 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_cmd.c           |    8 +-
 .../gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h |    1 +
 drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c       |   36 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.h       |    4 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_huc.c           |   11 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_irq.c           |   18 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_pm.c            |    6 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c       |   10 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c           |   35 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_types.h         |    8 +
 drivers/gpu/drm/i915/selftests/i915_gem.c          |    6 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c      |    4 +
 drivers/gpu/drm/i915/selftests/i915_request.c      |   20 +-
 drivers/gpu/drm/i915/selftests/igt_flush_test.c    |   28 +-
 drivers/gpu/drm/i915/selftests/igt_spinner.c       |    8 +-
 drivers/gpu/drm/i915/selftests/mock_gtt.c          |    2 +-
 drivers/gpu/drm/i915/selftests/scatterlist.c       |    4 +
 drivers/gpu/drm/i915/{ =3D> soc}/intel_dram.c        |    0
 drivers/gpu/drm/i915/{ =3D> soc}/intel_dram.h        |    0
 drivers/gpu/drm/i915/soc/intel_gmch.c              |  171 +
 drivers/gpu/drm/i915/soc/intel_gmch.h              |   18 +
 drivers/gpu/drm/i915/{ =3D> soc}/intel_pch.c         |    0
 drivers/gpu/drm/i915/{ =3D> soc}/intel_pch.h         |    0
 drivers/gpu/drm/i915/vlv_sideband.c                |    1 +
 drivers/gpu/drm/imx/Kconfig                        |   41 +-
 drivers/gpu/drm/imx/Makefile                       |   10 +-
 drivers/gpu/drm/imx/dcss/dcss-dev.c                |   23 +-
 drivers/gpu/drm/imx/dcss/dcss-dev.h                |    7 +-
 drivers/gpu/drm/imx/dcss/dcss-drv.c                |   15 +-
 drivers/gpu/drm/imx/dcss/dcss-kms.c                |    2 -
 drivers/gpu/drm/imx/ipuv3/Kconfig                  |   41 +
 drivers/gpu/drm/imx/ipuv3/Makefile                 |   11 +
 drivers/gpu/drm/imx/{ =3D> ipuv3}/dw_hdmi-imx.c      |    0
 drivers/gpu/drm/imx/{ =3D> ipuv3}/imx-drm-core.c     |    0
 drivers/gpu/drm/imx/{ =3D> ipuv3}/imx-drm.h          |    0
 drivers/gpu/drm/imx/{ =3D> ipuv3}/imx-ldb.c          |    0
 drivers/gpu/drm/imx/{ =3D> ipuv3}/imx-tve.c          |    0
 drivers/gpu/drm/imx/{ =3D> ipuv3}/ipuv3-crtc.c       |    0
 drivers/gpu/drm/imx/{ =3D> ipuv3}/ipuv3-plane.c      |    0
 drivers/gpu/drm/imx/{ =3D> ipuv3}/ipuv3-plane.h      |    0
 drivers/gpu/drm/imx/{ =3D> ipuv3}/parallel-display.c |    0
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |    1 -
 drivers/gpu/drm/kmb/kmb_crtc.c                     |    1 -
 drivers/gpu/drm/kmb/kmb_plane.c                    |    1 -
 drivers/gpu/drm/logicvc/logicvc_drm.c              |   13 +-
 drivers/gpu/drm/logicvc/logicvc_interface.c        |    1 -
 drivers/gpu/drm/logicvc/logicvc_mode.c             |    1 -
 drivers/gpu/drm/mediatek/Kconfig                   |    1 -
 drivers/gpu/drm/mediatek/mtk_cec.c                 |    2 +
 drivers/gpu/drm/mediatek/mtk_disp_aal.c            |    1 +
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c          |    1 +
 drivers/gpu/drm/mediatek/mtk_disp_color.c          |    1 +
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c          |    1 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |    1 +
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |    1 +
 drivers/gpu/drm/mediatek/mtk_dp.c                  |    6 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |   32 +
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |    2 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |    5 +-
 drivers/gpu/drm/mediatek/mtk_drm_gem.c             |   11 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |    3 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c            |    3 +
 drivers/gpu/drm/meson/meson_dw_hdmi.c              |   23 +-
 drivers/gpu/drm/mga/Makefile                       |   11 -
 drivers/gpu/drm/mga/mga_dma.c                      | 1168 ---
 drivers/gpu/drm/mga/mga_drv.c                      |  104 -
 drivers/gpu/drm/mga/mga_drv.h                      |  685 --
 drivers/gpu/drm/mga/mga_ioc32.c                    |  197 -
 drivers/gpu/drm/mga/mga_irq.c                      |  169 -
 drivers/gpu/drm/mga/mga_state.c                    | 1099 ---
 drivers/gpu/drm/mga/mga_warp.c                     |  167 -
 drivers/gpu/drm/mgag200/Kconfig                    |    2 +
 drivers/gpu/drm/msm/Kconfig                        |    7 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |   27 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpu.h              |    1 +
 drivers/gpu/drm/msm/adreno/a6xx.xml.h              |   18 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |    2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |   61 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |   66 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |    4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |   17 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |   30 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |   47 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |   18 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   12 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |   14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  872 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   19 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |  147 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c         |   27 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h         |    4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  |   30 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |    3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |    7 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |    6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         |   25 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h           |   21 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   20 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |   15 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |   14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c      |    2 +
 drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c           |    9 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c          |    5 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c           |    9 +-
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.c       |    3 +
 drivers/gpu/drm/msm/dp/dp_display.c                |  157 +-
 drivers/gpu/drm/msm/dp/dp_display.h                |    1 +
 drivers/gpu/drm/msm/dp/dp_drm.c                    |    3 +
 drivers/gpu/drm/msm/dp/dp_drm.h                    |    4 +
 drivers/gpu/drm/msm/dp/dp_panel.c                  |    7 +-
 drivers/gpu/drm/msm/dp/dp_panel.h                  |    1 +
 drivers/gpu/drm/msm/dp/dp_parser.c                 |   50 +-
 drivers/gpu/drm/msm/dp/dp_parser.h                 |    2 +
 drivers/gpu/drm/msm/dsi/dsi.h                      |    3 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |   22 +-
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |    2 +
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |   69 +-
 drivers/gpu/drm/msm/dsi/dsi_manager.c              |   20 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   12 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |    4 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |  243 +-
 drivers/gpu/drm/msm/hdmi/hdmi.c                    |    6 +-
 drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c           |   21 +-
 drivers/gpu/drm/msm/msm_debugfs.c                  |   12 +
 drivers/gpu/drm/msm/msm_drv.c                      |   18 +-
 drivers/gpu/drm/msm/msm_drv.h                      |   12 +-
 drivers/gpu/drm/msm/msm_fbdev.c                    |    8 +-
 drivers/gpu/drm/msm/msm_fence.c                    |    2 +-
 drivers/gpu/drm/msm/msm_gem_submit.c               |   15 +
 drivers/gpu/drm/msm/msm_gpu.h                      |   15 +-
 drivers/gpu/drm/msm/msm_gpu_devfreq.c              |  148 +-
 drivers/gpu/drm/msm/msm_mdss.c                     |   16 +
 drivers/gpu/drm/mxsfb/Kconfig                      |    2 +
 drivers/gpu/drm/mxsfb/mxsfb_drv.c                  |   10 +-
 drivers/gpu/drm/nouveau/Kconfig                    |   14 +-
 drivers/gpu/drm/nouveau/dispnv04/crtc.c            |    2 +-
 drivers/gpu/drm/nouveau/dispnv04/dac.c             |    2 +-
 drivers/gpu/drm/nouveau/dispnv04/dfp.c             |    2 +-
 drivers/gpu/drm/nouveau/dispnv04/tvmodesnv17.c     |    1 -
 drivers/gpu/drm/nouveau/dispnv04/tvnv04.c          |    2 +-
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c          |    7 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |    2 +-
 drivers/gpu/drm/nouveau/dispnv50/head.c            |    1 -
 drivers/gpu/drm/nouveau/include/nvfw/hs.h          |    2 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c               |    7 +-
 drivers/gpu/drm/nouveau/nouveau_bo.h               |    3 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c              |   12 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h              |    3 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c              |   11 +-
 drivers/gpu/drm/nouveau/nouveau_mem.c              |    3 +-
 drivers/gpu/drm/nouveau/nouveau_mem.h              |    2 +-
 drivers/gpu/drm/nouveau/nouveau_prime.c            |    1 +
 drivers/gpu/drm/nouveau/nouveau_sgdma.c            |    1 +
 drivers/gpu/drm/nouveau/nouveau_vga.c              |    1 -
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/base.c |    3 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g84.c  |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g98.c  |    4 +-
 .../gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c    |    4 +-
 .../gpu/drm/nouveau/nvkm/subdev/devinit/gm107.c    |    4 +-
 .../gpu/drm/nouveau/nvkm/subdev/devinit/gt215.c    |    4 +-
 .../gpu/drm/nouveau/nvkm/subdev/devinit/mcp89.c    |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv50.c |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv50.h |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/priv.h |    2 +-
 drivers/gpu/drm/omapdrm/dss/dispc.c                |    5 -
 drivers/gpu/drm/omapdrm/dss/dsi.c                  |   26 +-
 drivers/gpu/drm/omapdrm/omap_drv.c                 |   41 -
 drivers/gpu/drm/omapdrm/omap_fbdev.c               |    6 +-
 drivers/gpu/drm/omapdrm/omap_gem.c                 |    2 +-
 drivers/gpu/drm/omapdrm/omap_irq.c                 |    4 +-
 drivers/gpu/drm/panel/Kconfig                      |   38 +
 drivers/gpu/drm/panel/Makefile                     |    4 +
 .../gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c   |   96 +-
 drivers/gpu/drm/panel/panel-auo-a030jtn01.c        |  308 +
 drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c     |   42 +-
 drivers/gpu/drm/panel/panel-edp.c                  |   11 +-
 drivers/gpu/drm/panel/panel-elida-kd35t133.c       |   46 +-
 drivers/gpu/drm/panel/panel-himax-hx8394.c         |  451 ++
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c       |    6 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c      |    1 -
 drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c       |   58 +-
 drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c |  106 +-
 drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c   |   24 +-
 drivers/gpu/drm/panel/panel-novatek-nt35950.c      |   14 +-
 drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c |    5 +-
 drivers/gpu/drm/panel/panel-orisetech-ota5601a.c   |  364 +
 .../gpu/drm/panel/panel-raspberrypi-touchscreen.c  |    6 +-
 drivers/gpu/drm/panel/panel-ronbo-rb070d30.c       |    2 +-
 drivers/gpu/drm/panel/panel-samsung-atna33xc20.c   |   10 +-
 drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c      |    5 +-
 drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c   |    4 +-
 .../drm/panel/panel-samsung-s6e88a0-ams452ef01.c   |   44 +-
 drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c      |    3 +-
 drivers/gpu/drm/panel/panel-samsung-sofef00.c      |   33 +-
 drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c    |   19 +-
 drivers/gpu/drm/panel/panel-simple.c               |    6 +-
 drivers/gpu/drm/panel/panel-sitronix-st7703.c      |  341 +-
 .../gpu/drm/panel/panel-sony-tulip-truly-nt35521.c |  398 +-
 drivers/gpu/drm/panel/panel-visionox-vtdr6130.c    |  350 +
 drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c   |  112 +-
 drivers/gpu/drm/panfrost/panfrost_device.c         |   10 +-
 drivers/gpu/drm/panfrost/panfrost_device.h         |    4 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c            |    7 +-
 drivers/gpu/drm/qxl/qxl_cmd.c                      |   16 +-
 drivers/gpu/drm/qxl/qxl_drv.h                      |    3 +-
 drivers/gpu/drm/qxl/qxl_ttm.c                      |    4 +-
 drivers/gpu/drm/r128/Makefile                      |   10 -
 drivers/gpu/drm/r128/ati_pcigart.c                 |  228 -
 drivers/gpu/drm/r128/ati_pcigart.h                 |   31 -
 drivers/gpu/drm/r128/r128_cce.c                    |  944 ---
 drivers/gpu/drm/r128/r128_drv.c                    |  116 -
 drivers/gpu/drm/r128/r128_drv.h                    |  544 --
 drivers/gpu/drm/r128/r128_ioc32.c                  |  199 -
 drivers/gpu/drm/r128/r128_irq.c                    |  118 -
 drivers/gpu/drm/r128/r128_state.c                  | 1641 -----
 drivers/gpu/drm/radeon/Kconfig                     |    2 +
 drivers/gpu/drm/radeon/atombios.h                  |   10 +-
 drivers/gpu/drm/radeon/atombios_crtc.c             |    3 +-
 drivers/gpu/drm/radeon/atombios_encoders.c         |    1 +
 drivers/gpu/drm/radeon/r300.c                      |    1 -
 drivers/gpu/drm/radeon/radeon.h                    |    3 +-
 drivers/gpu/drm/radeon/radeon_acpi.c               |    2 +-
 drivers/gpu/drm/radeon/radeon_asic.c               |    1 -
 drivers/gpu/drm/radeon/radeon_connectors.c         |    2 +-
 drivers/gpu/drm/radeon/radeon_device.c             |    6 +-
 drivers/gpu/drm/radeon/radeon_display.c            |    1 +
 drivers/gpu/drm/radeon/radeon_dp_auxch.c           |    5 +-
 drivers/gpu/drm/radeon/radeon_drv.c                |    2 -
 drivers/gpu/drm/radeon/radeon_encoders.c           |    1 -
 drivers/gpu/drm/radeon/radeon_fb.c                 |   10 +-
 drivers/gpu/drm/radeon/radeon_irq_kms.c            |    1 -
 drivers/gpu/drm/radeon/radeon_legacy_crtc.c        |    5 +-
 drivers/gpu/drm/radeon/radeon_legacy_encoders.c    |    2 +-
 drivers/gpu/drm/radeon/radeon_legacy_tv.c          |    1 -
 drivers/gpu/drm/radeon/radeon_mode.h               |    2 +-
 drivers/gpu/drm/radeon/radeon_pm.c                 |    4 +-
 drivers/gpu/drm/radeon/radeon_prime.c              |    2 +
 drivers/gpu/drm/radeon/radeon_ttm.c                |    4 +-
 drivers/gpu/drm/rcar-du/Kconfig                    |    6 +
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c             |   39 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c              |   82 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.h              |    2 +
 drivers/gpu/drm/rcar-du/rcar_du_group.c            |   26 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c              |   30 +
 drivers/gpu/drm/rcar-du/rcar_du_regs.h             |    8 +-
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c              |   50 +-
 drivers/gpu/drm/rcar-du/rcar_lvds.c                |   92 +-
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c            |  497 +-
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h       |    6 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |    1 -
 drivers/gpu/drm/savage/Makefile                    |    9 -
 drivers/gpu/drm/savage/savage_bci.c                | 1082 ---
 drivers/gpu/drm/savage/savage_drv.c                |   91 -
 drivers/gpu/drm/savage/savage_drv.h                |  580 --
 drivers/gpu/drm/savage/savage_state.c              | 1169 ---
 drivers/gpu/drm/scheduler/sched_main.c             |   19 +-
 drivers/gpu/drm/shmobile/shmob_drm_crtc.c          |    2 +
 drivers/gpu/drm/shmobile/shmob_drm_drv.c           |   10 +-
 drivers/gpu/drm/shmobile/shmob_drm_plane.c         |    1 -
 drivers/gpu/drm/sis/Makefile                       |   10 -
 drivers/gpu/drm/sis/sis_drv.c                      |  143 -
 drivers/gpu/drm/sis/sis_drv.h                      |   80 -
 drivers/gpu/drm/sis/sis_mm.c                       |  363 -
 drivers/gpu/drm/solomon/ssd130x.c                  |   15 +-
 drivers/gpu/drm/sprd/sprd_dpu.c                    |    5 +-
 drivers/gpu/drm/sprd/sprd_drm.c                    |    1 -
 drivers/gpu/drm/sprd/sprd_dsi.c                    |    1 -
 drivers/gpu/drm/sun4i/sun4i_tv.c                   |  141 +-
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c              |    2 +-
 drivers/gpu/drm/tdfx/Makefile                      |    8 -
 drivers/gpu/drm/tdfx/tdfx_drv.c                    |   90 -
 drivers/gpu/drm/tegra/dpaux.c                      |    6 +-
 drivers/gpu/drm/tegra/fb.c                         |    8 +-
 drivers/gpu/drm/tegra/firewall.c                   |    3 +
 drivers/gpu/drm/tegra/nvdec.c                      |   16 +-
 drivers/gpu/drm/tegra/submit.c                     |   19 +-
 drivers/gpu/drm/tegra/vic.c                        |   39 +-
 drivers/gpu/drm/tests/Makefile                     |    8 +-
 drivers/gpu/drm/tests/drm_client_modeset_test.c    |  110 +-
 drivers/gpu/drm/tests/drm_cmdline_parser_test.c    |   68 +
 drivers/gpu/drm/tests/drm_connector_test.c         |   76 +
 drivers/gpu/drm/tests/drm_format_helper_test.c     |  384 +-
 drivers/gpu/drm/tests/drm_kunit_helpers.c          |  105 +-
 drivers/gpu/drm/tests/drm_kunit_helpers.h          |   11 -
 drivers/gpu/drm/tests/drm_managed_test.c           |   71 +
 drivers/gpu/drm/tests/drm_modes_test.c             |  158 +
 drivers/gpu/drm/tests/drm_probe_helper_test.c      |  218 +
 drivers/gpu/drm/tidss/tidss_crtc.c                 |    1 -
 drivers/gpu/drm/tidss/tidss_dispc.c                |    6 +-
 drivers/gpu/drm/tidss/tidss_drv.c                  |    1 -
 drivers/gpu/drm/tidss/tidss_encoder.c              |    2 +-
 drivers/gpu/drm/tidss/tidss_kms.c                  |    1 -
 drivers/gpu/drm/tidss/tidss_plane.c                |    1 -
 drivers/gpu/drm/tilcdc/tilcdc_drv.c                |    9 +-
 drivers/gpu/drm/tiny/cirrus.c                      |    2 +-
 drivers/gpu/drm/tiny/gm12u320.c                    |   15 +-
 drivers/gpu/drm/tiny/hx8357d.c                     |    5 +-
 drivers/gpu/drm/tiny/ili9163.c                     |    6 +-
 drivers/gpu/drm/tiny/ili9225.c                     |   36 +-
 drivers/gpu/drm/tiny/ili9341.c                     |    5 +-
 drivers/gpu/drm/tiny/ili9486.c                     |   20 +-
 drivers/gpu/drm/tiny/mi0283qt.c                    |    5 +-
 drivers/gpu/drm/tiny/ofdrm.c                       |   40 +-
 drivers/gpu/drm/tiny/panel-mipi-dbi.c              |   10 +-
 drivers/gpu/drm/tiny/simpledrm.c                   |  140 +-
 drivers/gpu/drm/tiny/st7586.c                      |   39 +-
 drivers/gpu/drm/tiny/st7735r.c                     |    5 +-
 drivers/gpu/drm/ttm/ttm_bo.c                       |  227 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c                  |  131 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c                    |   19 +-
 drivers/gpu/drm/ttm/ttm_device.c                   |   26 +-
 drivers/gpu/drm/ttm/ttm_execbuf_util.c             |    6 +-
 drivers/gpu/drm/ttm/ttm_pool.c                     |    3 +-
 drivers/gpu/drm/ttm/ttm_range_manager.c            |    2 +-
 drivers/gpu/drm/ttm/ttm_resource.c                 |    3 +-
 drivers/gpu/drm/ttm/ttm_tt.c                       |    3 +-
 drivers/gpu/drm/udl/udl_drv.c                      |    2 +-
 drivers/gpu/drm/udl/udl_modeset.c                  |    1 -
 drivers/gpu/drm/v3d/v3d_debugfs.c                  |   22 +-
 drivers/gpu/drm/v3d/v3d_gem.c                      |   62 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.c               |    8 +-
 drivers/gpu/drm/vboxvideo/vbox_main.c              |    1 -
 drivers/gpu/drm/vc4/Kconfig                        |   16 +
 drivers/gpu/drm/vc4/Makefile                       |    7 +
 drivers/gpu/drm/vc4/tests/.kunitconfig             |   13 +
 drivers/gpu/drm/vc4/tests/vc4_mock.c               |  200 +
 drivers/gpu/drm/vc4/tests/vc4_mock.h               |   63 +
 drivers/gpu/drm/vc4/tests/vc4_mock_crtc.c          |   41 +
 drivers/gpu/drm/vc4/tests/vc4_mock_output.c        |  138 +
 drivers/gpu/drm/vc4/tests/vc4_mock_plane.c         |   47 +
 drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c     | 1039 +++
 drivers/gpu/drm/vc4/vc4_bo.c                       |   10 +-
 drivers/gpu/drm/vc4/vc4_crtc.c                     |  215 +-
 drivers/gpu/drm/vc4/vc4_debugfs.c                  |   36 +-
 drivers/gpu/drm/vc4/vc4_dpi.c                      |   34 +-
 drivers/gpu/drm/vc4/vc4_drv.c                      |    5 +-
 drivers/gpu/drm/vc4/vc4_drv.h                      |  148 +-
 drivers/gpu/drm/vc4/vc4_dsi.c                      |  189 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |   28 +-
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h                |    4 +
 drivers/gpu/drm/vc4/vc4_hvs.c                      |  272 +-
 drivers/gpu/drm/vc4/vc4_kms.c                      |  139 +-
 drivers/gpu/drm/vc4/vc4_plane.c                    |  139 +-
 drivers/gpu/drm/vc4/vc4_regs.h                     |   20 +-
 drivers/gpu/drm/vc4/vc4_txp.c                      |   62 +-
 drivers/gpu/drm/vc4/vc4_v3d.c                      |   14 +-
 drivers/gpu/drm/vc4/vc4_vec.c                      |  365 +-
 drivers/gpu/drm/via/Makefile                       |    8 -
 drivers/gpu/drm/via/via_3d_reg.h                   | 1771 -----
 drivers/gpu/drm/via/via_dri1.c                     | 3630 ----------
 drivers/gpu/drm/virtio/virtgpu_drv.h               |    3 +
 drivers/gpu/drm/virtio/virtgpu_trace.h             |   26 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c                |   13 +-
 drivers/gpu/drm/vkms/vkms_drv.c                    |   27 +-
 drivers/gpu/drm/vkms/vkms_drv.h                    |    4 +-
 drivers/gpu/drm/vkms/vkms_plane.c                  |   36 +-
 drivers/gpu/drm/vmwgfx/ttm_object.h                |   10 +
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c             |    2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |    1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |    4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c            |    2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_gmr.c                |    1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c      |    1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_system_manager.c     |    1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c         |    1 -
 drivers/gpu/host1x/cdma.c                          |   14 +-
 drivers/gpu/host1x/cdma.h                          |    2 +
 drivers/gpu/host1x/context.c                       |    8 +-
 drivers/gpu/host1x/debug.c                         |    7 +-
 drivers/gpu/host1x/dev.c                           |    4 +-
 drivers/gpu/host1x/dev.h                           |   10 +-
 drivers/gpu/host1x/fence.c                         |  118 +-
 drivers/gpu/host1x/fence.h                         |   19 +-
 drivers/gpu/host1x/hw/channel_hw.c                 |   60 +-
 drivers/gpu/host1x/hw/hw_host1x06_uclass.h         |    2 +-
 drivers/gpu/host1x/hw/hw_host1x07_uclass.h         |    2 +-
 drivers/gpu/host1x/hw/hw_host1x08_uclass.h         |    2 +-
 drivers/gpu/host1x/hw/intr_hw.c                    |   74 +-
 drivers/gpu/host1x/hw/syncpt_hw.c                  |    3 -
 drivers/gpu/host1x/intr.c                          |  334 +-
 drivers/gpu/host1x/intr.h                          |   83 +-
 drivers/gpu/host1x/job.c                           |   12 +-
 drivers/gpu/host1x/syncpt.c                        |   98 +-
 drivers/gpu/host1x/syncpt.h                        |    3 +-
 drivers/gpu/ipu-v3/ipu-common.c                    |    1 +
 drivers/media/platform/renesas/vsp1/vsp1_drv.c     |    4 +-
 drivers/media/platform/renesas/vsp1/vsp1_hgo.c     |    4 +-
 drivers/media/platform/renesas/vsp1/vsp1_lif.c     |    1 +
 drivers/media/platform/renesas/vsp1/vsp1_pipe.c    |   18 +
 drivers/media/platform/renesas/vsp1/vsp1_regs.h    |   26 +-
 drivers/media/platform/renesas/vsp1/vsp1_rpf.c     |   64 +-
 drivers/media/platform/renesas/vsp1/vsp1_video.c   |    4 +-
 drivers/media/platform/renesas/vsp1/vsp1_wpf.c     |    4 +-
 drivers/media/v4l2-core/v4l2-ioctl.c               |    6 +
 drivers/misc/Kconfig                               |    1 -
 drivers/misc/Makefile                              |    1 -
 .../include/gaudi2/arc/gaudi2_arc_common_packets.h |  213 -
 drivers/video/fbdev/clps711x-fb.c                  |   10 +-
 drivers/video/fbdev/core/fb_defio.c                |    4 -
 drivers/video/fbdev/core/fbcon.c                   |   41 +-
 drivers/video/fbdev/core/fbmem.c                   |   33 -
 drivers/video/fbdev/core/fbsysfs.c                 |    1 -
 drivers/video/fbdev/efifb.c                        |   35 +-
 drivers/video/fbdev/hyperv_fb.c                    |   17 +-
 drivers/video/fbdev/offb.c                         |   33 +-
 drivers/video/fbdev/simplefb.c                     |   19 +-
 drivers/video/fbdev/vesafb.c                       |   37 +-
 drivers/video/fbdev/vga16fb.c                      |   15 +-
 include/drm/display/drm_dp.h                       |   15 +-
 include/drm/display/drm_dp_mst_helper.h            |    6 +-
 include/drm/drm_accel.h                            |    3 +-
 include/drm/drm_atomic.h                           |   32 +-
 include/drm/drm_atomic_state_helper.h              |    4 +
 include/drm/drm_audio_component.h                  |    3 +
 include/drm/drm_bridge.h                           |   36 +-
 include/drm/drm_bridge_connector.h                 |    2 -
 include/drm/drm_client.h                           |    8 +
 include/drm/drm_connector.h                        |  100 +-
 include/drm/drm_crtc_helper.h                      |   16 +-
 include/drm/drm_debugfs.h                          |   59 +
 include/drm/drm_device.h                           |   32 +-
 include/drm/drm_drv.h                              |    7 -
 include/drm/drm_edid.h                             |    2 +
 include/drm/drm_fb_helper.h                        |   21 +-
 include/drm/drm_fixed.h                            |    1 +
 include/drm/drm_format_helper.h                    |   16 +-
 include/drm/drm_gem.h                              |    1 +
 include/drm/drm_gem_atomic_helper.h                |    2 -
 include/drm/drm_gem_ttm_helper.h                   |    3 +-
 include/drm/drm_gem_vram_helper.h                  |    4 +-
 include/drm/drm_kunit_helpers.h                    |   91 +
 include/drm/drm_mipi_dbi.h                         |   43 +-
 include/drm/drm_mipi_dsi.h                         |   43 +-
 include/drm/drm_mode_config.h                      |   12 +-
 include/drm/drm_modes.h                            |   17 +
 include/drm/drm_modeset_helper_vtables.h           |   28 +-
 include/drm/drm_panel.h                            |   10 +
 include/drm/drm_pciids.h                           |  112 -
 include/drm/drm_plane.h                            |    4 +-
 include/drm/drm_print.h                            |    5 +-
 include/drm/drm_probe_helper.h                     |    1 +
 include/drm/drm_simple_kms_helper.h                |    4 +-
 include/drm/gpu_scheduler.h                        |    8 +-
 include/drm/ttm/{ttm_bo_api.h =3D> ttm_bo.h}         |  370 +-
 include/drm/ttm/ttm_bo_driver.h                    |  303 -
 include/drm/ttm/ttm_device.h                       |    7 +-
 include/drm/ttm/ttm_execbuf_util.h                 |    4 +-
 include/linux/devfreq.h                            |    7 +-
 include/linux/dma-buf.h                            |    4 +-
 include/linux/fb.h                                 |   23 -
 include/linux/host1x.h                             |   10 +-
 include/linux/platform_data/simplefb.h             |    1 +
 include/trace/events/habanalabs.h                  |   75 +
 include/uapi/drm/amdgpu_drm.h                      |   12 +-
 include/uapi/drm/drm_fourcc.h                      |   12 +
 .../{misc/habanalabs.h =3D> drm/habanalabs_accel.h}  |   33 +-
 include/uapi/drm/i810_drm.h                        |  292 -
 include/uapi/drm/ivpu_accel.h                      |  306 +
 include/uapi/drm/mga_drm.h                         |  429 --
 include/uapi/drm/msm_drm.h                         |    4 +-
 include/uapi/drm/r128_drm.h                        |  336 -
 include/uapi/drm/savage_drm.h                      |  220 -
 include/uapi/drm/sis_drm.h                         |   77 -
 include/uapi/drm/via_drm.h                         |  282 -
 include/uapi/linux/media-bus-format.h              |    5 +-
 include/uapi/linux/videodev2.h                     |   11 +
 samples/vfio-mdev/mdpy-fb.c                        |    8 -
 1772 files changed, 61278 insertions(+), 49930 deletions(-)
 delete mode 100644
Documentation/devicetree/bindings/display/bridge/cdns,dsi.txt
 create mode 100644
Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/msm/mdp5.txt
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,mdp5=
.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-dpu.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-mdss.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sm8150-dpu.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sm8350-dpu.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/auo,a030jtn01.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/focaltech,gpt3.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml
 create mode 100644
Documentation/devicetree/bindings/reserved-memory/framebuffer.yaml
 create mode 100644 drivers/accel/Makefile
 rename drivers/{misc =3D> accel}/habanalabs/Kconfig (81%)
 rename drivers/{misc =3D> accel}/habanalabs/Makefile (88%)
 rename drivers/{misc =3D> accel}/habanalabs/common/Makefile (100%)
 rename drivers/{misc =3D> accel}/habanalabs/common/asid.c (100%)
 rename drivers/{misc =3D> accel}/habanalabs/common/command_buffer.c (95%)
 rename drivers/{misc =3D> accel}/habanalabs/common/command_submission.c (9=
6%)
 rename drivers/{misc =3D> accel}/habanalabs/common/context.c (100%)
 rename drivers/{misc =3D> accel}/habanalabs/common/debugfs.c (100%)
 rename drivers/{misc =3D> accel}/habanalabs/common/decoder.c (100%)
 rename drivers/{misc =3D> accel}/habanalabs/common/device.c (95%)
 rename drivers/{misc =3D> accel}/habanalabs/common/firmware_if.c (93%)
 rename drivers/{misc =3D> accel}/habanalabs/common/habanalabs.h (97%)
 rename drivers/{misc =3D> accel}/habanalabs/common/habanalabs_drv.c (98%)
 rename drivers/{misc =3D> accel}/habanalabs/common/habanalabs_ioctl.c (93%=
)
 rename drivers/{misc =3D> accel}/habanalabs/common/hw_queue.c (100%)
 rename drivers/{misc =3D> accel}/habanalabs/common/hwmon.c (100%)
 rename drivers/{misc =3D> accel}/habanalabs/common/irq.c (94%)
 rename drivers/{misc =3D> accel}/habanalabs/common/memory.c (92%)
 rename drivers/{misc =3D> accel}/habanalabs/common/memory_mgr.c (99%)
 rename drivers/{misc =3D> accel}/habanalabs/common/mmu/Makefile (100%)
 rename drivers/{misc =3D> accel}/habanalabs/common/mmu/mmu.c (99%)
 rename drivers/{misc =3D> accel}/habanalabs/common/mmu/mmu_v1.c (99%)
 rename drivers/{misc =3D> accel}/habanalabs/common/mmu/mmu_v2_hr.c (100%)
 rename drivers/{misc =3D> accel}/habanalabs/common/pci/Makefile (100%)
 rename drivers/{misc =3D> accel}/habanalabs/common/pci/pci.c (97%)
 rename drivers/{misc =3D> accel}/habanalabs/common/security.c (76%)
 create mode 100644 drivers/accel/habanalabs/common/security.h
 rename drivers/{misc =3D> accel}/habanalabs/common/state_dump.c (99%)
 rename drivers/{misc =3D> accel}/habanalabs/common/sysfs.c (100%)
 rename drivers/{misc =3D> accel}/habanalabs/gaudi/Makefile (100%)
 rename drivers/{misc =3D> accel}/habanalabs/gaudi/gaudi.c (99%)
 rename drivers/{misc =3D> accel}/habanalabs/gaudi/gaudiP.h (99%)
 rename drivers/{misc =3D> accel}/habanalabs/gaudi/gaudi_coresight.c (99%)
 rename drivers/{misc =3D> accel}/habanalabs/gaudi/gaudi_security.c (100%)
 rename drivers/{misc =3D> accel}/habanalabs/gaudi2/Makefile (100%)
 rename drivers/{misc =3D> accel}/habanalabs/gaudi2/gaudi2.c (92%)
 rename drivers/{misc =3D> accel}/habanalabs/gaudi2/gaudi2P.h (95%)
 rename drivers/{misc =3D> accel}/habanalabs/gaudi2/gaudi2_coresight.c (99%=
)
 rename drivers/{misc =3D> accel}/habanalabs/gaudi2/gaudi2_coresight_regs.h=
 (100%)
 rename drivers/{misc =3D> accel}/habanalabs/gaudi2/gaudi2_masks.h (100%)
 rename drivers/{misc =3D> accel}/habanalabs/gaudi2/gaudi2_security.c (99%)
 rename drivers/{misc =3D> accel}/habanalabs/goya/Makefile (100%)
 rename drivers/{misc =3D> accel}/habanalabs/goya/goya.c (99%)
 rename drivers/{misc =3D> accel}/habanalabs/goya/goyaP.h (99%)
 rename drivers/{misc =3D> accel}/habanalabs/goya/goya_coresight.c (99%)
 rename drivers/{misc =3D> accel}/habanalabs/goya/goya_hwmgr.c (100%)
 rename drivers/{misc =3D> accel}/habanalabs/goya/goya_security.c (100%)
 rename drivers/{misc =3D> accel}/habanalabs/include/common/cpucp_if.h (94%=
)
 rename drivers/{misc =3D> accel}/habanalabs/include/common/hl_boot_if.h (8=
3%)
 rename drivers/{misc =3D> accel}/habanalabs/include/common/qman_if.h (100%=
)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/cpu_if_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/dma0_core_masks.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/dma0_core_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/dma0_qm_masks.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/dma0_qm_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/dma1_core_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/dma1_qm_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/dma2_core_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/dma2_qm_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/dma3_core_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/dma3_qm_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/dma4_core_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/dma4_qm_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/dma5_core_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/dma5_qm_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/dma6_core_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/dma6_qm_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/dma7_core_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/dma7_qm_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/dma_if_e_n_down_ch0_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/dma_if_e_n_down_ch1_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/dma_if_e_n_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/dma_if_e_s_down_ch0_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/dma_if_e_s_down_ch1_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/dma_if_e_s_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/dma_if_w_n_down_ch0_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/dma_if_w_n_down_ch1_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/dma_if_w_n_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/dma_if_w_s_down_ch0_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/dma_if_w_s_down_ch1_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/dma_if_w_s_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/gaudi_blocks.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/gaudi_regs.h (99%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/mme0_ctrl_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/mme0_qm_masks.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/mme0_qm_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/mme1_ctrl_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/mme2_ctrl_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/mme2_qm_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/mme3_ctrl_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/mmu_up_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/nic0_qm0_masks.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/nic0_qm0_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/nic0_qm1_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/nic1_qm0_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/nic1_qm1_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/nic2_qm0_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/nic2_qm1_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/nic3_qm0_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/nic3_qm1_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/nic4_qm0_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/nic4_qm1_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_0_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_1_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_2_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_3_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_4_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_5_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_6_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_7_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/psoc_cpu_pll_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/psoc_etr_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/psoc_global_conf_masks.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/psoc_global_conf_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/psoc_timestamp_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_0_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_1_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_2_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_3_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_4_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_5_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_6_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_7_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/stlb_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/tpc0_cfg_masks.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/tpc0_cfg_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/tpc0_qm_masks.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/tpc0_qm_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/tpc1_cfg_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/tpc1_qm_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/tpc2_cfg_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/tpc2_qm_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/tpc3_cfg_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/tpc3_qm_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/tpc4_cfg_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/tpc4_qm_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/tpc5_cfg_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/tpc5_qm_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/tpc6_cfg_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/tpc6_qm_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/tpc7_cfg_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/asic_reg/tpc7_qm_regs.h (100%)
 rename drivers/{misc =3D> accel}/habanalabs/include/gaudi/gaudi.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/gaudi_async_events.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/gaudi_async_ids_map_extended.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi/gaudi_coresight.h (100%)
 rename drivers/{misc =3D> accel}/habanalabs/include/gaudi/gaudi_fw_if.h (1=
00%)
 rename drivers/{misc =3D> accel}/habanalabs/include/gaudi/gaudi_masks.h (1=
00%)
 rename drivers/{misc =3D> accel}/habanalabs/include/gaudi/gaudi_packets.h =
(100%)
 rename drivers/{misc =3D> accel}/habanalabs/include/gaudi/gaudi_reg_map.h =
(100%)
 create mode 100644
drivers/accel/habanalabs/include/gaudi2/arc/gaudi2_arc_common_packets.h
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/arc_farm_arc0_acp_eng_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/arc_farm_arc0_aux_masks.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/arc_farm_arc0_aux_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/arc_farm_arc0_dup_eng_axuser_regs=
.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/arc_farm_arc0_dup_eng_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_ctx_axuser_masks.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_ctx_axuser_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_ctx_masks.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_ctx_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_kdma_cgm_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_masks.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/cpu_if_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_dec0_cmd_masks.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_dec0_cmd_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_core_ctx_axuser_regs=
.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_core_ctx_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_core_masks.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_core_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_qm_arc_aux_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_qm_axuser_nonsecured=
_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_qm_cgm_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_qm_masks.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_qm_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_edma1_core_ctx_axuser_regs=
.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_edma1_qm_axuser_nonsecured=
_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_hmmu0_mmu_masks.h
(99%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_hmmu0_mmu_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_hmmu0_stlb_masks.h
(97%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_hmmu0_stlb_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_acc_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_cout0=
_master_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_cout0=
_slave_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_cout1=
_master_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_cout1=
_slave_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in0_m=
aster_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in0_s=
lave_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in1_m=
aster_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in1_s=
lave_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in2_m=
aster_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in2_s=
lave_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in3_m=
aster_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in3_s=
lave_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in4_m=
aster_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in4_s=
lave_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_base_addr=
_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_non_tenso=
r_end_regs.h
(98%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_non_tenso=
r_start_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_tensor_a_=
regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_tensor_b_=
regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_tensor_co=
ut_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_masks.h
(99%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_mme_axuser_reg=
s.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_arc_acp_eng_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_arc_aux_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_arc_dup_eng_axuser_=
regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_arc_dup_eng_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_axuser_nonsecured_r=
egs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_axuser_secured_regs=
.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_cgm_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_sbte0_masks.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_sbte0_mstr_if_axuser_r=
egs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_wb0_mstr_if_axuser_reg=
s.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_rtr0_ctrl_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_rtr0_mstr_if_rr_prvt_hbw_r=
egs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_rtr0_mstr_if_rr_prvt_lbw_r=
egs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_rtr0_mstr_if_rr_shrd_hbw_r=
egs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_rtr0_mstr_if_rr_shrd_lbw_r=
egs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_sync_mngr_glbl_masks.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_sync_mngr_glbl_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_sync_mngr_mstr_if_axuser_m=
asks.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_sync_mngr_mstr_if_axuser_r=
egs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_sync_mngr_objs_masks.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_sync_mngr_objs_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_axuser_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_kernel_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_kernel_tensor_0_r=
egs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_masks.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_qm_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_qm_sync_object_re=
gs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_qm_tensor_0_regs.=
h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_special_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_eml_busmon_0_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_eml_etf_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_eml_funnel_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_eml_spmu_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_eml_stm_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_qm_arc_aux_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_qm_axuser_nonsecured_=
regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_qm_cgm_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_qm_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_axuser_dec=
_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_axuser_msi=
x_abnrm_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_axuser_msi=
x_l2c_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_axuser_msi=
x_nrm_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_axuser_msi=
x_vcd_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_masks.h
(99%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_ctrl_special_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore1_mme_ctrl_lo_regs.h
(100%)
 create mode 100644
drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore1_sync_mngr_glbl_regs=
.h
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/dcore3_mme_ctrl_lo_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/gaudi2_blocks_linux_driver.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/gaudi2_regs.h (99%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/nic0_qm0_cgm_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/nic0_qm0_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/nic0_qm_arc_aux0_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/nic0_qpc0_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/nic0_umr0_0_completion_queue_ci_1=
_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/nic0_umr0_0_unsecure_doorbell0_re=
gs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/pcie_aux_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/pcie_dbi_regs.h (99%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/pcie_dec0_cmd_masks.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/pcie_dec0_cmd_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_axuser_dec_r=
egs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_axuser_msix_=
abnrm_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_axuser_msix_=
l2c_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_axuser_msix_=
nrm_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_axuser_msix_=
vcd_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_masks.h
(99%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_ctrl_special_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/pcie_wrap_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/pcie_wrap_special_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/pdma0_core_ctx_axuser_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/pdma0_core_ctx_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/pdma0_core_masks.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/pdma0_core_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/pdma0_core_special_masks.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/pdma0_qm_arc_aux_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/pdma0_qm_axuser_nonsecured_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/pdma0_qm_axuser_secured_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/pdma0_qm_cgm_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/pdma0_qm_masks.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/pdma0_qm_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/pdma1_core_ctx_axuser_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/pdma1_qm_axuser_nonsecured_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/pmmu_hbw_stlb_masks.h (99%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/pmmu_hbw_stlb_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/pmmu_pif_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/psoc_etr_masks.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/psoc_etr_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/psoc_global_conf_masks.h
(99%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/psoc_global_conf_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/psoc_reset_conf_masks.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/psoc_reset_conf_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/psoc_timestamp_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/rot0_desc_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/rot0_masks.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/rot0_qm_arc_aux_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/rot0_qm_axuser_nonsecured_regs.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/rot0_qm_cgm_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/rot0_qm_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/rot0_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/xbar_edge_0_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/asic_reg/xbar_mid_0_regs.h (100%)
 rename drivers/{misc =3D> accel}/habanalabs/include/gaudi2/gaudi2.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/gaudi2_async_events.h (99%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/gaudi2_async_ids_map_extended.h (99%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/gaudi2/gaudi2_coresight.h (100%)
 rename drivers/{misc =3D> accel}/habanalabs/include/gaudi2/gaudi2_fw_if.h =
(82%)
 rename drivers/{misc =3D> accel}/habanalabs/include/gaudi2/gaudi2_packets.=
h (98%)
 rename drivers/{misc =3D> accel}/habanalabs/include/gaudi2/gaudi2_reg_map.=
h (83%)
 create mode 100644
drivers/accel/habanalabs/include/gaudi2/gaudi2_special_blocks.h
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/cpu_ca53_cfg_masks.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/cpu_ca53_cfg_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/cpu_if_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/cpu_pll_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/dma_ch_0_masks.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/dma_ch_0_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/dma_ch_1_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/dma_ch_2_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/dma_ch_3_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/dma_ch_4_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/dma_macro_masks.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/dma_macro_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/dma_nrtr_masks.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/dma_nrtr_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/dma_qm_0_masks.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/dma_qm_0_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/dma_qm_1_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/dma_qm_2_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/dma_qm_3_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/dma_qm_4_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/goya_blocks.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/goya_masks.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/goya_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/ic_pll_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/mc_pll_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/mme1_rtr_masks.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/mme1_rtr_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/mme2_rtr_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/mme3_rtr_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/mme4_rtr_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/mme5_rtr_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/mme6_rtr_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/mme_cmdq_masks.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/mme_cmdq_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/mme_masks.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/mme_qm_masks.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/mme_qm_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/mme_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/mmu_masks.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/mmu_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/pci_nrtr_masks.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/pci_nrtr_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/pcie_aux_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/pcie_wrap_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/psoc_emmc_pll_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/psoc_etr_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/psoc_global_conf_masks.h
(100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/psoc_global_conf_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/psoc_mme_pll_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/psoc_pci_pll_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/psoc_spi_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/psoc_timestamp_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/sram_y0_x0_rtr_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/sram_y0_x1_rtr_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/sram_y0_x2_rtr_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/sram_y0_x3_rtr_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/sram_y0_x4_rtr_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/stlb_masks.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/stlb_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/tpc0_cfg_masks.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/tpc0_cfg_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/tpc0_cmdq_masks.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/tpc0_cmdq_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/tpc0_eml_cfg_masks.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/tpc0_eml_cfg_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/tpc0_nrtr_masks.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/tpc0_nrtr_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/tpc0_qm_masks.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/tpc0_qm_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/tpc1_cfg_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/tpc1_cmdq_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/tpc1_qm_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/tpc1_rtr_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/tpc2_cfg_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/tpc2_cmdq_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/tpc2_qm_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/tpc2_rtr_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/tpc3_cfg_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/tpc3_cmdq_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/tpc3_qm_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/tpc3_rtr_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/tpc4_cfg_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/tpc4_cmdq_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/tpc4_qm_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/tpc4_rtr_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/tpc5_cfg_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/tpc5_cmdq_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/tpc5_qm_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/tpc5_rtr_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/tpc6_cfg_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/tpc6_cmdq_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/tpc6_qm_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/tpc6_rtr_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/tpc7_cfg_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/tpc7_cmdq_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/tpc7_nrtr_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/tpc7_qm_regs.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/asic_reg/tpc_pll_regs.h (100%)
 rename drivers/{misc =3D> accel}/habanalabs/include/goya/goya.h (100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/goya/goya_async_events.h (100%)
 rename drivers/{misc =3D> accel}/habanalabs/include/goya/goya_coresight.h =
(100%)
 rename drivers/{misc =3D> accel}/habanalabs/include/goya/goya_fw_if.h (100=
%)
 rename drivers/{misc =3D> accel}/habanalabs/include/goya/goya_packets.h (1=
00%)
 rename drivers/{misc =3D> accel}/habanalabs/include/goya/goya_reg_map.h (1=
00%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/hw_ip/mmu/mmu_general.h (100%)
 rename drivers/{misc =3D> accel}/habanalabs/include/hw_ip/mmu/mmu_v1_0.h (=
100%)
 rename drivers/{misc =3D> accel}/habanalabs/include/hw_ip/mmu/mmu_v1_1.h (=
100%)
 rename drivers/{misc =3D> accel}/habanalabs/include/hw_ip/mmu/mmu_v2_0.h (=
100%)
 rename drivers/{misc =3D>
accel}/habanalabs/include/hw_ip/pci/pci_general.h (100%)
 create mode 100644 drivers/accel/ivpu/Kconfig
 create mode 100644 drivers/accel/ivpu/Makefile
 create mode 100644 drivers/accel/ivpu/TODO
 create mode 100644 drivers/accel/ivpu/ivpu_drv.c
 create mode 100644 drivers/accel/ivpu/ivpu_drv.h
 create mode 100644 drivers/accel/ivpu/ivpu_fw.c
 create mode 100644 drivers/accel/ivpu/ivpu_fw.h
 create mode 100644 drivers/accel/ivpu/ivpu_gem.c
 create mode 100644 drivers/accel/ivpu/ivpu_gem.h
 create mode 100644 drivers/accel/ivpu/ivpu_hw.h
 create mode 100644 drivers/accel/ivpu/ivpu_hw_mtl.c
 create mode 100644 drivers/accel/ivpu/ivpu_hw_mtl_reg.h
 create mode 100644 drivers/accel/ivpu/ivpu_hw_reg_io.h
 create mode 100644 drivers/accel/ivpu/ivpu_ipc.c
 create mode 100644 drivers/accel/ivpu/ivpu_ipc.h
 create mode 100644 drivers/accel/ivpu/ivpu_job.c
 create mode 100644 drivers/accel/ivpu/ivpu_job.h
 create mode 100644 drivers/accel/ivpu/ivpu_jsm_msg.c
 create mode 100644 drivers/accel/ivpu/ivpu_jsm_msg.h
 create mode 100644 drivers/accel/ivpu/ivpu_mmu.c
 create mode 100644 drivers/accel/ivpu/ivpu_mmu.h
 create mode 100644 drivers/accel/ivpu/ivpu_mmu_context.c
 create mode 100644 drivers/accel/ivpu/ivpu_mmu_context.h
 create mode 100644 drivers/accel/ivpu/ivpu_pm.c
 create mode 100644 drivers/accel/ivpu/ivpu_pm.h
 create mode 100644 drivers/accel/ivpu/vpu_boot_api.h
 create mode 100644 drivers/accel/ivpu/vpu_jsm_api.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/df_v4_3.c
 rename drivers/gpu/drm/amd/{display/dc/link/link_hwss_hpo_frl.h =3D>
amdgpu/df_v4_3.h} (79%)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfx_v11_0_3.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfx_v11_0_3.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/smu_v13_0_10.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/smu_v13_0_10.h
 delete mode 100644 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/core/dc_link_exports.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dc_hdmi_types.h
 delete mode 100644 drivers/gpu/drm/amd/display/dc/inc/dc_link_ddc.h
 delete mode 100644 drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h
 delete mode 100644 drivers/gpu/drm/amd/display/dc/inc/dc_link_dpia.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/inc/link.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_cts.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_cts.h
 rename drivers/gpu/drm/amd/display/dc/link/{ =3D>
accessories}/link_dp_trace.c (89%)
 rename drivers/gpu/drm/amd/display/dc/link/{ =3D>
accessories}/link_dp_trace.h (91%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/accessories/link_fp=
ga.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/accessories/link_fp=
ga.h
 rename drivers/gpu/drm/amd/display/dc/link/{ =3D> hwss}/link_hwss_dio.c (9=
3%)
 rename drivers/gpu/drm/amd/display/dc/link/{ =3D> hwss}/link_hwss_dio.h (9=
9%)
 rename drivers/gpu/drm/amd/display/dc/link/{ =3D> hwss}/link_hwss_dpia.c (=
100%)
 rename drivers/gpu/drm/amd/display/dc/link/{ =3D> hwss}/link_hwss_dpia.h (=
100%)
 rename drivers/gpu/drm/amd/display/dc/link/{ =3D> hwss}/link_hwss_hpo_dp.c=
 (85%)
 rename drivers/gpu/drm/amd/display/dc/link/{ =3D> hwss}/link_hwss_hpo_dp.h=
 (98%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_detection.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_detection.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_dpms.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_dpms.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_factory.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_factory.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_resource.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_resource.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_validation.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_validation.h
 rename drivers/gpu/drm/amd/display/dc/{core/dc_link_ddc.c =3D>
link/protocols/link_ddc.c} (57%)
 rename drivers/gpu/drm/amd/display/{include/i2caux_interface.h =3D>
dc/link/protocols/link_ddc.h} (52%)
 create mode 100644
drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_d=
pia.c
 rename drivers/gpu/drm/{tdfx/tdfx_drv.h =3D>
amd/display/dc/link/protocols/link_dp_dpia.h} (52%)
 create mode 100644
drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_dpia_bw.c
 rename drivers/gpu/drm/amd/display/dc/link/{ =3D>
protocols}/link_dp_dpia_bw.h (59%)
 create mode 100644
drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_irq_handler.c
 rename drivers/gpu/drm/amd/display/dc/link/{link_dp_dpia_bw.c =3D>
protocols/link_dp_irq_handler.h} (86%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_p=
hy.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_p=
hy.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training_128b_132b.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training_128b_132b.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training_8b_10b.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training_8b_10b.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training_auxless.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training_auxless.h
 rename drivers/gpu/drm/amd/display/dc/{core/dc_link_dpia.c =3D>
link/protocols/link_dp_training_dpia.c} (82%)
 create mode 100644
drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training_dpia.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training_fixed_vs_pe_=
retimer.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training_fixed_vs_pe_=
retimer.h
 rename drivers/gpu/drm/amd/display/dc/{core/dc_link_dpcd.c =3D>
link/protocols/link_dpcd.c} (97%)
 rename drivers/gpu/drm/amd/display/dc/{inc =3D> link/protocols}/link_dpcd.=
h (95%)
 create mode 100644
drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_control.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_control.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/protocols/link_hpd.=
c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/protocols/link_hpd.=
h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/df/df_4_3_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/df/df_4_3_sh_mask.=
h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/xgmi/xgmi_6_1_0_sh_mask.h
 rename drivers/gpu/drm/bridge/{cdns-dsi.c =3D> cadence/cdns-dsi-core.c} (9=
7%)
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-dsi-j721e.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-dsi-j721e.h
 delete mode 100644 drivers/gpu/drm/i810/Makefile
 delete mode 100644 drivers/gpu/drm/i810/i810_dma.c
 delete mode 100644 drivers/gpu/drm/i810/i810_drv.c
 delete mode 100644 drivers/gpu/drm/i810/i810_drv.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_limits.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_dvo_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_vblank.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_vblank.h
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_print.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_print.h
 create mode 100644 drivers/gpu/drm/i915/i915_config.h
 rename drivers/gpu/drm/i915/{ =3D> soc}/intel_dram.c (100%)
 rename drivers/gpu/drm/i915/{ =3D> soc}/intel_dram.h (100%)
 create mode 100644 drivers/gpu/drm/i915/soc/intel_gmch.c
 create mode 100644 drivers/gpu/drm/i915/soc/intel_gmch.h
 rename drivers/gpu/drm/i915/{ =3D> soc}/intel_pch.c (100%)
 rename drivers/gpu/drm/i915/{ =3D> soc}/intel_pch.h (100%)
 create mode 100644 drivers/gpu/drm/imx/ipuv3/Kconfig
 create mode 100644 drivers/gpu/drm/imx/ipuv3/Makefile
 rename drivers/gpu/drm/imx/{ =3D> ipuv3}/dw_hdmi-imx.c (100%)
 rename drivers/gpu/drm/imx/{ =3D> ipuv3}/imx-drm-core.c (100%)
 rename drivers/gpu/drm/imx/{ =3D> ipuv3}/imx-drm.h (100%)
 rename drivers/gpu/drm/imx/{ =3D> ipuv3}/imx-ldb.c (100%)
 rename drivers/gpu/drm/imx/{ =3D> ipuv3}/imx-tve.c (100%)
 rename drivers/gpu/drm/imx/{ =3D> ipuv3}/ipuv3-crtc.c (100%)
 rename drivers/gpu/drm/imx/{ =3D> ipuv3}/ipuv3-plane.c (100%)
 rename drivers/gpu/drm/imx/{ =3D> ipuv3}/ipuv3-plane.h (100%)
 rename drivers/gpu/drm/imx/{ =3D> ipuv3}/parallel-display.c (100%)
 delete mode 100644 drivers/gpu/drm/mga/Makefile
 delete mode 100644 drivers/gpu/drm/mga/mga_dma.c
 delete mode 100644 drivers/gpu/drm/mga/mga_drv.c
 delete mode 100644 drivers/gpu/drm/mga/mga_drv.h
 delete mode 100644 drivers/gpu/drm/mga/mga_ioc32.c
 delete mode 100644 drivers/gpu/drm/mga/mga_irq.c
 delete mode 100644 drivers/gpu/drm/mga/mga_state.c
 delete mode 100644 drivers/gpu/drm/mga/mga_warp.c
 create mode 100644 drivers/gpu/drm/panel/panel-auo-a030jtn01.c
 create mode 100644 drivers/gpu/drm/panel/panel-himax-hx8394.c
 create mode 100644 drivers/gpu/drm/panel/panel-orisetech-ota5601a.c
 create mode 100644 drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
 delete mode 100644 drivers/gpu/drm/r128/Makefile
 delete mode 100644 drivers/gpu/drm/r128/ati_pcigart.c
 delete mode 100644 drivers/gpu/drm/r128/ati_pcigart.h
 delete mode 100644 drivers/gpu/drm/r128/r128_cce.c
 delete mode 100644 drivers/gpu/drm/r128/r128_drv.c
 delete mode 100644 drivers/gpu/drm/r128/r128_drv.h
 delete mode 100644 drivers/gpu/drm/r128/r128_ioc32.c
 delete mode 100644 drivers/gpu/drm/r128/r128_irq.c
 delete mode 100644 drivers/gpu/drm/r128/r128_state.c
 delete mode 100644 drivers/gpu/drm/savage/Makefile
 delete mode 100644 drivers/gpu/drm/savage/savage_bci.c
 delete mode 100644 drivers/gpu/drm/savage/savage_drv.c
 delete mode 100644 drivers/gpu/drm/savage/savage_drv.h
 delete mode 100644 drivers/gpu/drm/savage/savage_state.c
 delete mode 100644 drivers/gpu/drm/sis/Makefile
 delete mode 100644 drivers/gpu/drm/sis/sis_drv.c
 delete mode 100644 drivers/gpu/drm/sis/sis_drv.h
 delete mode 100644 drivers/gpu/drm/sis/sis_mm.c
 delete mode 100644 drivers/gpu/drm/tdfx/Makefile
 delete mode 100644 drivers/gpu/drm/tdfx/tdfx_drv.c
 create mode 100644 drivers/gpu/drm/tests/drm_connector_test.c
 delete mode 100644 drivers/gpu/drm/tests/drm_kunit_helpers.h
 create mode 100644 drivers/gpu/drm/tests/drm_managed_test.c
 create mode 100644 drivers/gpu/drm/tests/drm_modes_test.c
 create mode 100644 drivers/gpu/drm/tests/drm_probe_helper_test.c
 create mode 100644 drivers/gpu/drm/vc4/tests/.kunitconfig
 create mode 100644 drivers/gpu/drm/vc4/tests/vc4_mock.c
 create mode 100644 drivers/gpu/drm/vc4/tests/vc4_mock.h
 create mode 100644 drivers/gpu/drm/vc4/tests/vc4_mock_crtc.c
 create mode 100644 drivers/gpu/drm/vc4/tests/vc4_mock_output.c
 create mode 100644 drivers/gpu/drm/vc4/tests/vc4_mock_plane.c
 create mode 100644 drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
 delete mode 100644 drivers/gpu/drm/via/Makefile
 delete mode 100644 drivers/gpu/drm/via/via_3d_reg.h
 delete mode 100644 drivers/gpu/drm/via/via_dri1.c
 delete mode 100644
drivers/misc/habanalabs/include/gaudi2/arc/gaudi2_arc_common_packets.h
 create mode 100644 include/drm/drm_kunit_helpers.h
 rename include/drm/ttm/{ttm_bo_api.h =3D> ttm_bo.h} (66%)
 delete mode 100644 include/drm/ttm/ttm_bo_driver.h
 rename include/uapi/{misc/habanalabs.h =3D> drm/habanalabs_accel.h} (98%)
 delete mode 100644 include/uapi/drm/i810_drm.h
 create mode 100644 include/uapi/drm/ivpu_accel.h
 delete mode 100644 include/uapi/drm/mga_drm.h
 delete mode 100644 include/uapi/drm/r128_drm.h
 delete mode 100644 include/uapi/drm/savage_drm.h
 delete mode 100644 include/uapi/drm/sis_drm.h
 delete mode 100644 include/uapi/drm/via_drm.h
