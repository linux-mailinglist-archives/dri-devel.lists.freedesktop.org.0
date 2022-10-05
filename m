Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C975F4EF0
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 05:42:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 587A310E112;
	Wed,  5 Oct 2022 03:42:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F14D910E112
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Oct 2022 03:42:02 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id bj12so32800682ejb.13
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Oct 2022 20:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Rja10dJYLFVPA31GrFITVv+ZPzbny44P7OkW8GZo5EA=;
 b=RoVqey0Oadp0elWjHuyY7pfQA0h7v8je/Zj4/TbwmWm1TIce3M9jUv7u1jG6fKPIr+
 A/yKe0G5R8sK+5pE3vibCIGjVAj4qu/F/8bMpD5RDE43+NJ92niUJ7hbjfr7QnDDq9MI
 xYnQXCCu/K7lRGAFL2CZm3MfnCkz+OPQ+XqXKhGk6OyvLps6G5CVHd4Jl52ksPbGpJ29
 UHP85D6jqCXFuL3rQ2IsvxOGsAZl5sJ5fNLLhg56HUoyh8cLKyZvcDDHy2zp0KCM05aZ
 SoJJk3+rUA4dTSk+yiZPyLi0QJkuqnuFnH8ggvEiCvbFPai5iBbRfLo52eeJQUUFyEM+
 7gIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Rja10dJYLFVPA31GrFITVv+ZPzbny44P7OkW8GZo5EA=;
 b=BSEYb2esGW7V4aQvfWov6jecP4ljBc9ENWEgyMfzhbWAmbrY8aMmpVXoTZSSnGSNEQ
 yMSO/r+rs/EzI84SVVdv5yzblzOFbBTwf16REEBjyhc7dPrQjz7GpXSzwU5MvOIb+4cD
 DyroSkx6+T7BStkTH7ItQetYHRZjw7HJOkLHZqYyiJWPhgJyJnyQD7WMB8yOWaiVTiUd
 PwX48zw7MlqE2y/gawzGUYfwnNU6sac3AUTNBAnfzv07gKAeaclszmXqOd/0C1AO7mC4
 JtIhgds1+w7FTCrFvzm6rwyRadnNaeNNWSzwchHSt7a+WzzU/zWELQMtPnxUnbDCciii
 zhNA==
X-Gm-Message-State: ACrzQf02LX3ti9ajRKcFeYkhNIWlg42cNTRxh/mwqdzzyqdGnPqkW6fw
 MVG1snAjFpu40peowqoZhLRDY+9w1NyXOmhqXD4=
X-Google-Smtp-Source: AMsMyM7+r7zqXo9HJR+nJR494J1Lepd/sLW/TAiJ5TzvoBfmXXDVwe/7is8aL5mF42CmJInZWY5PLZ961VTbaG6B3PA=
X-Received: by 2002:a17:906:db02:b0:780:24e:cf9 with SMTP id
 xj2-20020a170906db0200b00780024e0cf9mr22005547ejb.460.1664941320675; Tue, 04
 Oct 2022 20:42:00 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 5 Oct 2022 13:41:47 +1000
Message-ID: <CAPM=9tzs4n8dDQ_XVVPS_5jrBgsNkhDQvf-B_XmUg+EG_M2i4Q@mail.gmail.com>
Subject: [git pull] drm for 6.1-rc1
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

This is the main drm pull request for 6.1-rc1.

Lots of stuff all over, some new AMD IP support and gang
submit support. i915 has further DG2 and Meteorlake pieces,
and a bunch of i915 display refactoring. msm has a shrinker
rework. There are also a bunch of conversions to use
kunit.

This has two external pieces, some MEI changes needed for
future Intel discrete GPUs. These should be acked by Greg.
There is also a cross maintainer shared tree with some
backlight rework from Hans in here.

This is very conflict heavy, mostly the correct answer is picking
the version from drm-next. I've put a completed merge here:

https://cgit.freedesktop.org/~airlied/linux/log/?h=3Ddrm-next-6.1-merged

Hopefully you get similar answers.

Dave.

drm-next-2022-10-05:
drm pull for 6.1-rc1

core:
- convert selftests to kunit
- managed init for more objects
- move to idr_init_base
- rename fb and gem cma helpers to dma
- hide unregistered connectors from getconnector ioctl
- DSC passthrough aux support
- backlight handling improvements
- add dma_resv_assert_held to vmap/vunmap

edid:
- move luminance calculation to core

fbdev:
- fix aperture helper usage

fourcc:
- add more format helpers
- add DRM_FORMAT_Cxx, DRM_FORMAT_Rxx, DRM_FORMAT_Dxx
- add packed AYUV8888, XYUV8888
- add some kunit tests

ttm:
- allow bos without backing store
- rewrite placement to use intersect/compatible functions

dma-buf:
- docs update
- improve signalling when debugging

udmabuf:
- fix failure path GPF

dp:
- drop dp/mst legacy code
- atomic mst state support
- audio infoframe packing

panel:
- Samsung LTL101AL01
- B120XAN01.0
- R140NWF5 RH
- DMT028VGHMCMI-1A T
- AUO B133UAN02.1
- IVO M133NW4J-R3
- Innolux N120ACA-EA1

amdgpu:
- Gang submit support
- Mode2 reset for RDNA2
- New IP support:
  DCN 3.1.4, 3.2
  SMU 13.x
  NBIO 7.7
  GC 11.x
  PSP 13.x
  SDMA 6.x
  GMC 11.x
- DSC passthrough support
- PSP fixes for TA support
- vangogh GFXOFF stats
- clang fixes
- gang submit CS cleanup prep work
- fix VRAM eviction issues

amdkfd:
- GC 10.3 IP ISA fixes
- fix CRIU regression
- CPU fault on COW mapping fixes

i915:
- align fw versioning with kernel practices
- add display substruct to i915 private
- add initial runtime info to driver info
- split out HDCP and backlight registers
- MEI XeHP SDV GSC support
- add per-gt sysfs defaults
- TLB invalidation improvements
- Disable PCI BAR resize on 32-bit
- GuC firmware updates and compat changes
- GuC log timestamp translation
- DG2 preemption workaround changes
- DG2 improved HDMI pixel clocks support
- PCI BAR sanity checks
- Enable DC5 on DG2
- DG2 DMC fw bumped
- ADL-S PCI ID added
- Meteorlake enablement
- Rename ggtt_view to gtt_view
- host RPS fixes
- release mmaps on rpm suspend on discrete
- clocking and dpll refactoring
- VBT definitions and parsing updates
- SKL watermark code extracted to separate file
- allow seamless M/N changes on eDP panels
- BUG_ON removal and cleanups

msm:
- DPU: simplified VBIF configuration
-      cleanup CTL interfaces
- DSI: removed unused msm_display_dsc_config struct
-      switch regulator calls to new API
-      switched to PANEL_BRIDGE for direct attached panels
- DSI_PHY: convert drivers to parent_hws
- DP: cleanup pixel_rate handling
- HDMI: turned hdmi-phy-8996 into OF clk provider
- misc dt-bindings fixes
- choose eDP as primary display if it's available
- support getting interconnects from either the mdss or the mdp5/dpu
  device nodes
- gem: Shrinker + LRU re-work:
- adds a shared GEM LRU+shrinker helper and moves msm over to that
- reduces lock contention between retire and submit by avoiding the
  need to acquire obj lock in retire path (and instead using resv
  seeing obj's busyness in the shrinker
- fix reclaim vs submit issues
- GEM fault injection for triggering userspace error paths
- Map/unmap optimization
- Improved robustness for a6xx GPU recovery

virtio:
- Improve error and edge conditions handling
- Convert to use managed helpers
- stop exposing LINEAR modifier

mgag200:
- split modeset handling per model

udl:
- suspend/disconnect handling improvements

vc4:
- rework HDMI power up
- depend on PM
- better unplugging support

ast:
- resolution handling improvements

ingenic:
- Add JZ4760(B) support
- avoid a modeset when sharpness property is unchanged
- use the new PM ops

it6505:
- power seq and clock updates

ssd130x:
- regmap bulk write
- use atomic helpers instead of simple helpers

via:
- rename via_drv to via_dri1, consolidate all code.

radeon:
- drop DP MST experimental support
- delayed work flush fix
- use time_after

ti-sn65dsi86:
- DP support

mediatek:
- MT8195 DP support
- drop of_gpio header
- remove unneeded result
- small DP code improvements

vkms:
- RGB565, XRGB64 and ARGB64 support

sun4i:
- tv: convert to atomic

rcar-du:
- Synopsys DW HDMI bridge DT bindings update

exynos:
- use drm_display_info.is_hdmi
- correct return of mixer_mode_valid and hdmi_mode_valid

omap:
- refcounting fix

rockchip:
- RK3568 support
- RK3399 gamma support
The following changes since commit 1c23f9e627a7b412978b4e852793c5e3c3efc555=
:

  Linux 6.0-rc2 (2022-08-21 17:32:54 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-next-2022-10-05

for you to fetch changes up to 65898687cf7392c372ea8d04a88617e2cb794465:

  Merge tag 'amd-drm-next-6.1-2022-09-30' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next (2022-10-04
09:42:24 +1000)

----------------------------------------------------------------
drm pull for 6.1-rc1

core:
- convert selftests to kunit
- managed init for more objects
- move to idr_init_base
- rename fb and gem cma helpers to dma
- hide unregistered connectors from getconnector ioctl
- DSC passthrough aux support
- backlight handling improvements
- add dma_resv_assert_held to vmap/vunmap

edid:
- move luminance calculation to core

fbdev:
- fix aperture helper usage

fourcc:
- add more format helpers
- add DRM_FORMAT_Cxx, DRM_FORMAT_Rxx, DRM_FORMAT_Dxx
- add packed AYUV8888, XYUV8888
- add some kunit tests

ttm:
- allow bos without backing store
- rewrite placement to use intersect/compatible functions

dma-buf:
- docs update
- improve signalling when debugging

udmabuf:
- fix failure path GPF

dp:
- drop dp/mst legacy code
- atomic mst state support
- audio infoframe packing

panel:
- Samsung LTL101AL01
- B120XAN01.0
- R140NWF5 RH
- DMT028VGHMCMI-1A T
- AUO B133UAN02.1
- IVO M133NW4J-R3
- Innolux N120ACA-EA1

amdgpu:
- Gang submit support
- Mode2 reset for RDNA2
- New IP support:
  DCN 3.1.4, 3.2
  SMU 13.x
  NBIO 7.7
  GC 11.x
  PSP 13.x
  SDMA 6.x
  GMC 11.x
- DSC passthrough support
- PSP fixes for TA support
- vangogh GFXOFF stats
- clang fixes
- gang submit CS cleanup prep work
- fix VRAM eviction issues

amdkfd:
- GC 10.3 IP ISA fixes
- fix CRIU regression
- CPU fault on COW mapping fixes

i915:
- align fw versioning with kernel practices
- add display substruct to i915 private
- add initial runtime info to driver info
- split out HDCP and backlight registers
- MEI XeHP SDV GSC support
- add per-gt sysfs defaults
- TLB invalidation improvements
- Disable PCI BAR resize on 32-bit
- GuC firmware updates and compat changes
- GuC log timestamp translation
- DG2 preemption workaround changes
- DG2 improved HDMI pixel clocks support
- PCI BAR sanity checks
- Enable DC5 on DG2
- DG2 DMC fw bumped
- ADL-S PCI ID added
- Meteorlake enablement
- Rename ggtt_view to gtt_view
- host RPS fixes
- release mmaps on rpm suspend on discrete
- clocking and dpll refactoring
- VBT definitions and parsing updates
- SKL watermark code extracted to separate file
- allow seamless M/N changes on eDP panels
- BUG_ON removal and cleanups

msm:
- DPU: simplified VBIF configuration
-      cleanup CTL interfaces
- DSI: removed unused msm_display_dsc_config struct
-      switch regulator calls to new API
-      switched to PANEL_BRIDGE for direct attached panels
- DSI_PHY: convert drivers to parent_hws
- DP: cleanup pixel_rate handling
- HDMI: turned hdmi-phy-8996 into OF clk provider
- misc dt-bindings fixes
- choose eDP as primary display if it's available
- support getting interconnects from either the mdss or the mdp5/dpu
  device nodes
- gem: Shrinker + LRU re-work:
- adds a shared GEM LRU+shrinker helper and moves msm over to that
- reduces lock contention between retire and submit by avoiding the
  need to acquire obj lock in retire path (and instead using resv
  seeing obj's busyness in the shrinker
- fix reclaim vs submit issues
- GEM fault injection for triggering userspace error paths
- Map/unmap optimization
- Improved robustness for a6xx GPU recovery

virtio:
- Improve error and edge conditions handling
- Convert to use managed helpers
- stop exposing LINEAR modifier

mgag200:
- split modeset handling per model

udl:
- suspend/disconnect handling improvements

vc4:
- rework HDMI power up
- depend on PM
- better unplugging support

ast:
- resolution handling improvements

ingenic:
- Add JZ4760(B) support
- avoid a modeset when sharpness property is unchanged
- use the new PM ops

it6505:
- power seq and clock updates

ssd130x:
- regmap bulk write
- use atomic helpers instead of simple helpers

via:
- rename via_drv to via_dri1, consolidate all code.

radeon:
- drop DP MST experimental support
- delayed work flush fix
- use time_after

ti-sn65dsi86:
- DP support

mediatek:
- MT8195 DP support
- drop of_gpio header
- remove unneeded result
- small DP code improvements

vkms:
- RGB565, XRGB64 and ARGB64 support

sun4i:
- tv: convert to atomic

rcar-du:
- Synopsys DW HDMI bridge DT bindings update

exynos:
- use drm_display_info.is_hdmi
- correct return of mixer_mode_valid and hdmi_mode_valid

omap:
- refcounting fix

rockchip:
- RK3568 support
- RK3399 gamma support

----------------------------------------------------------------
Abhinav Kumar (1):
      drm/msm/dpu: populate wb or intf before reset_intf_cfg

Adri=C3=A1n Larumbe (5):
      drm/panfrost: Add specific register offset macros for JS and MMU AS
      drm/panfrost: Add support for devcoredump
      drm/meson: reorder driver deinit sequence to fix use-after-free bug
      drm/meson: explicitly remove aggregate driver at module unload time
      drm/meson: remove drm bridges at aggregate driver unbind time

Akhil P Oommen (7):
      drm/msm: Remove unnecessary pm_runtime_get/put
      drm/msm: Take single rpm refcount on behalf of all submits
      drm/msm: Correct pm_runtime votes in recover worker
      drm/msm: Fix cx collapse issue during recovery
      drm/msm/a6xx: Ensure CX collapse during gpu recovery
      drm/msm/a6xx: Improve gpu recovery sequence
      drm/msm/a6xx: Handle GMU prepare-slumber hfi failure

Alan Previn (1):
      drm/i915/guc: Add a helper for log buffer size

Alex Deucher (7):
      drm/amd/display: fix documentation for amdgpu_dm_update_freesync_caps=
()
      drm/amdgpu: add HDP remap functionality to nbio 7.7
      drm/amdgpu: fix warning about missing imu prototype
      drm/amdgpu: move nbio ih_doorbell_range() into ih code for vega
      drm/amdgpu: move nbio sdma_doorbell_range() into sdma code for vega
      drm/amdgpu: make sure to init common IP before gmc
      drm/amdgpu: don't register a dirty callback for non-atomic

Alex Sierra (1):
      drm/amdgpu: ensure no PCIe peer access for CPU XGMI iolinks

Alexander Usyskin (5):
      drm/i915/gsc: add slow_firmware flag to the gsc device definition
      drm/i915/gsc: add GSC XeHP SDV platform definition
      mei: gsc: wait for reset thread on stop
      mei: extend timeouts on slow devices
      mei: drop ready bits check after start

Alisa Khabibrakhmanova (1):
      drm/via: Add new condition to via_dma_cleanup()

Alvin Lee (25):
      drm/amd/display: Free phantom plane and stream properly
      drm/amd/display: Add interface to track PHY state
      drm/amd/display: Uncomment SubVP scaling case
      drm/amd/display: Don't choose SubVP display if ActiveMargin > 0
      drm/amd/display: Only commit SubVP state after pipe programming
      drm/amd/display: SubVP missing scaling case
      drm/amd/display: Update MBLK calculation for SubVP
      drm/amd/display: SW cursor fallback for SubVP
      drm/amd/display: Update viewport position for phantom pipes
      drm/amd/display: Refactor SubVP calculation to remove FPU
      drm/amd/display: Fix pipe split prediction
      drm/amd/display: Only consider pixle rate div policy for DCN32+
      drm/amd/display: For ODM seamless transition require AUTO mode
      drm/amd/display: Add debug option for allocating extra way for cursor
      drm/amd/display: SubVP pipe split case
      drm/amd/display: Disable SubVP on driver disable
      drm/amd/display: Fix SubVP way calculation
      drm/amd/display: Uncomment SubVP pipe split assignment in driver
      drm/amd/display: Don't allocate DET for phantom pipes
      drm/amd/display: Do second pass through DML for DET calculation
      drm/amd/display: Update DCN32 to use new SR latencies
      drm/amd/display: Disable MALL when TMZ surface
      drm/amd/display: Update MALL SS NumWays calculation
      drm/amd/display: Fix CAB allocation calculation
      drm/amd/display: Only use ODM2:1 policy for high pixel rate displays

Alvin =C5=A0ipraga (2):
      drm: bridge: adv7511: fix CEC power down control register offset
      drm: bridge: adv7511: unregister cec i2c device after cec adapter

Andrzej Hajda (4):
      drm/i915/selftests: allow misaligned_pin test work with unmappable me=
mory
      drm/i915/hpd: suspend MST at the end of intel_modeset_driver_remove
      drm/i915/fbdev: suspend HPD before fbdev unregistration
      drm/i915/fbdev: do not create fbdev if HPD is suspended

Andr=C3=A9 Almeida (4):
      drm/amd: Add detailed GFXOFF stats to debugfs
      drm/amd/pm: Implement GFXOFF's entry count and residency for vangogh
      Documentation/gpu: Document GFXOFF's count and residency
      drm/amdgpu: Document gfx_off members of struct amdgpu_gfx

Ankit Nautiyal (2):
      drm/i915/hdmi: Prune modes that require HDMI2.1 FRL
      drm/i915/vdsc: Set VDSC PIC_HEIGHT before using for DP DSC

Anshuman Gupta (2):
      drm/i915: Refactor userfault_wakeref to re-use
      drm/i915/dgfx: Release mmap on rpm suspend

Anthony Koo (3):
      drm/amd/display: [FW Promotion] Release 0.0.130.0
      drm/amd/display: [FW Promotion] Release 0.0.132.0
      drm/amd/display: [FW Promotion] Release 0.0.134.0

Anusha Srivatsa (3):
      drm/i915/display: Cleanup intel_phy_is_combo()
      drm/i915: Pass drm_i915_private struct instead of gt for
gen11_gu_misc_irq_handler/ack()
      drm/i915/dg2: Add support for DC5 state

Aric Cyr (12):
      drm/amd/display: 3.2.199
      drm/amd/display: 3.2.200
      drm/amd/display: 3.2.201
      drm/amd/display: Optimizations for DML math
      drm/amd/display: Fix divide by zero in DML
      drm/amd/display: Don't adjust VRR unnecessarily
      drm/amd/display: 3.2.202
      drm/amd/display: 3.2.203
      drm/amd/display: 3.2.204
      drm/amd/display: Remove interface for periodic interrupt 1
      drm/amd/display: Fix audio on display after unplugging another
      drm/amd/display: 3.2.205

Arthur Grillo (1):
      drm: selftest: convert drm_mm selftest to KUnit

Arun R Murthy (1):
      drm/i915/display: avoid warnings when registering dual panel backligh=
t

Arunpravin Paneer Selvam (9):
      Revert "drm/amdgpu: move internal vram_mgr function into the C file"
      Revert "drm/amdgpu: fix start calculation in amdgpu_vram_mgr_new"
      drm/ttm: Add new callbacks to ttm res mgr
      drm/ttm: Implement intersect/compatible functions
      drm/amdgpu: Implement intersect/compatible functions
      drm/i915: Implement intersect/compatible functions
      drm/nouveau: Implement intersect/compatible functions
      drm/ttm: Switch to using the new res callback
      drm/amdgpu: Fix VRAM eviction issue

Arvind Yadav (5):
      dma-buf: Remove the signaled bit status check
      dma-buf: set signaling bit for the stub fence
      dma-buf: Enable signaling on fence for selftests
      dma-buf: dma_fence_wait must enable signaling
      drm/sched: Use parent fence instead of finished

Asher Song (2):
      drm/amd/display: remove a duplicated declaration
      drm/amdgpu: fix a compiling error in old kernels

Ashutosh Dixit (3):
      drm/i915/gt: Create gt/gtN/.defaults/ for per gt sysfs defaults
      drm/i915/gt: Expose per-gt RPS defaults in sysfs
      drm/i915/gt: Fix perf limit reasons bit positions

Aurabindo Pillai (16):
      drm/amd/display: change to runtime initialization for reg
offsets for DCN32
      drm/amd/display: change to runtime initialization for reg
offsets for DCN321
      drm/amd/display: program k1/k2 divider for virtual signal for DCN32
      drm/amd/display: Fix CAB cursor size allocation for DCN32/321
      drm/amd/display: disable display fresh from MALL on an edge case
for DCN321
      drm/amd/display: use actual cursor size instead of max for CAB alloca=
tion
      drm/amd/display: Revert "program k1/k2 divider for virtual
signal for DCN32"
      drm/amd/display: Use correct plane for CAB cursor size allocation
      drm/amd/display: Revert "Fallback to SW cursor if SubVP + cursor too =
big"
      drm/amd/display: add workaround for subvp cursor corruption for DCN32=
/321
      drm/amd/display: Fix register definitions for DCN32/321
      drm/amd/display: Remove some unused definitions from DCN32/321
      drm/amd/display: Enable committing subvp config
      drm/amd/display: skip phantom pipes when checking for pending flip
      drm/amd/display: skip phantom pipes when checking for pending flip
      drm/amd/display: fix a divide by zero error

Beniamin Sandu (1):
      drm/nouveau/hwmon: use simplified HWMON_CHANNEL_INFO macro

Bernard Zhao (4):
      drm/amd: fix potential memory leak
      drm/amd: fix potential memory leak
      drm/amd: remove possible condition with no effect (if =3D=3D else)
      drm/amd: remove possible condition with no effect (if =3D=3D else)

Biju Das (2):
      drm: rcar-du: Drop unused encoder header files
      drm: rcar-du: Use %p4cc to print 4CC format

Bjorn Andersson (1):
      drm/msm/gpu: Drop qos request if devm_devfreq_add_device() fails

Bo Liu (1):
      drm/i915/irq: Fix a "the the" typo

Bo-Chen Chen (7):
      drm/mediatek: dp: Add multiple bridge types support
      drm/mediatek: dp: Add multiple smc commands support
      drm/mediatek: dp: Add multiple calibration data formats support
      drm/mediatek: dp: Determine device of next_bridge
      drm/mediatek: dp: Reduce indentation in mtk_dp_bdg_detect()
      drm/mediatek: dp: Remove unused register definitions
      drm/mediatek: dp: Fix compiler warning in mtk_dp_video_mute()

Bokun Zhang (1):
      drm/amdgpu: Add amdgpu suspend-resume code path under SRIOV

Brandon Syu (1):
      drm/amd/display: Add debug option for exiting idle optimizations
on cursor updates

Candice Li (5):
      drm/amdgpu: Check num_gfx_rings for gfx v9_0 rb setup.
      drm/amdgpu: Rely on MCUMC_STATUS for umc v8_10 correctable error
counter only
      drm/amdgpu: Enable full reset when RAS is supported on gc v11_0_0
      drm/amdgpu: Add EEPROM I2C address for smu v13_0_0
      drm/amdgpu: Skip reset error status for psp v13_0_0

Carsten Haitzler (2):
      drm/komeda: Add legacy FB support so VT's work as expected
      drm/komeda - At init write GCU control block to handle already on DPU

Charlene Liu (7):
      drm/amd/display: fix wrong register access
      drm/amd/display: update header files
      drm/amd/display: add debug option for dramclk_change_latency in apu
      drm/amd/display: Expose few dchubbub functions
      drm/amd/display: update dccg based on HW delta
      drm/amd/display: correct num_dsc based on HW cap
      drm/amd/display: add debug keys for override bios settings.

Chen-Yu Tsai (2):
      drm/bridge: parade-ps8640: Fix regulator supply order
      drm/panel-edp: Add Innolux N120ACA-EA1 panel entry

Chengming Gui (3):
      drm/amd/amdgpu: avoid soft reset check when gpu recovery disabled
      drm/amd/amdgpu: skip ucode loading if ucode_size =3D=3D 0
      drm/amd/amdgpu: add rlc_firmware_header_v2_4 to amdgpu_firmware_heade=
r

Chia-I Wu (1):
      drm/virtio: set fb_modifiers_not_supported

Chris Morgan (4):
      dt-bindings: Add byteswap order to chrontel ch7033
      drm/bridge: chrontel-ch7033: Add byteswap order setting
      dt-bindings: display: rockchip-dsi: add rk3568 compatible
      drm/rockchip: dsi: add rk3568 support

Chris Park (2):
      drm/amd/display: Correct I2C register offset
      drm/amd/display: Port DCN30 420 logic to DCN32

Chris Wilson (13):
      drm/i915/reset: Handle reset timeouts under unrelated kernel hangs
      drm/i915: Suppress oom warning for shmemfs object allocation failure
      drm/i915/gt: Ignore TLB invalidations on idle engines
      drm/i915/gt: Invalidate TLB of the OA unit at TLB invalidations
      drm/i915/gt: Skip TLB invalidations once wedged
      drm/i915/gt: Batch TLB invalidations
      drm/i915/gem: Remove shared locking on freeing objects
      drm/i915/guc: Use streaming loads to speed up dumping the guc log
      drm/i915/gt: Explicitly clear BB_OFFSET for new contexts
      drm/i915/selftests: Check for incomplete LRI from the context image
      drm/i915/selftest: Always cancel semaphore on error
      drm/i915/selftest: Clear the output buffers before GPU writes
      drm/i915/gt: Use i915_vm_put on ppgtt_create error paths

Christian K=C3=B6nig (26):
      drm/ttm: rename and cleanup ttm_bo_init
      drm/amdgpu: audit bo->resource usage
      drm/nouveau: audit bo->resource usage
      drm/ttm: audit bo->resource usage v2
      dma-buf: revert "return only unsignaled fences in
dma_fence_unwrap_for_each v3"
      drm/amdgpu: reapply "fix start calculation in amdgpu_vram_mgr_new""
      drm/amdgpu: re-apply "move internal vram_mgr function into the C file=
""
      dma-buf/dma_resv_usage: update explicit sync documentation
      drm/sched: move calling drm_sched_entity_select_rq
      drm/amdgpu: remove SRIOV and MCBP dependencies from the CS
      drm/amdgpu: move setting the job resources
      drm/amdgpu: revert "partial revert "remove ctx->lock" v2"
      drm/amdgpu: use DMA_RESV_USAGE_BOOKKEEP v2
      drm/amdgpu: cleanup CS init/fini and pass1
      drm/amdgpu: reorder CS code
      dma-buf: fix dma_fence_default_wait() signaling check
      drm/amdgpu: cleanup CS pass2 v6
      drm/amdgpu: cleanup error handling in amdgpu_cs_parser_bos
      drm/amdgpu: move entity selection and job init earlier during CS
      drm/amdgpu: revert "fix limiting AV1 to the first instance on VCN3" v=
3
      drm/amdgpu: cleanup instance limit on VCN4 v4
      drm/amdgpu: add gang submit backend v2
      drm/amdgpu: add gang submit frontend v6
      drm/amdgpu: properly initialize return value during CS
      drm/amdgpu: bump minor for gang submit
      drm/ttm: add dma_resv_assert_held() calls to vmap/vunmap

Christoph Niedermaier (2):
      dt-bindings: display: simple: Add Multi-Inno Technology MI0800FT-9 pa=
nel
      drm/panel: simple: Add Multi-Inno Technology MI0800FT-9

Christophe JAILLET (1):
      drm/bochs: Fix some error handling paths in bochs_pci_probe()

Clint Taylor (1):
      drm/i915/mtl: Fix rawclk for Meteorlake PCH

Colin Ian King (1):
      drm/amdkfd: Fix spelling mistake "detroyed" -> "destroyed"

Cruise Hung (1):
      drm/amd/display: Fix DP MST timeslot issue when fallback happened

Dan Carpenter (3):
      drm/bridge: Avoid uninitialized variable warning
      drm/vmwgfx: clean up some error pointer checking
      virtio-gpu: fix shift wrapping bug in virtio_gpu_fence_event_create()

Daniel Miess (1):
      drm/amd/display: Add shift and mask for ICH_RESET_AT_END_OF_LINE

Daniel Vetter (2):
      fbdev: Make registered_fb[] private to fbmem.c
      Merge tag 'drm-misc-next-2022-08-20-1' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next

Daniele Ceraolo Spurio (4):
      drm/i915/guc: support v69 in parallel to v70
      drm/i915/guc: Don't send policy update for child contexts.
      drm/i915/guc: skip scrub_ctbs selftest if reset is disabled
      drm/i915/guc: clear stalled request after a reset

Danilo Krummrich (22):
      drm/virtio: plane: use drm managed resources
      drm/virtio: kms: use drm managed resources
      drm/amdgpu: use idr_init_base() to initialize mgr->ctx_handles
      drm/amdgpu: use idr_init_base() to initialize fpriv->bo_list_handles
      drm: use idr_init_base() to initialize master->magic_map
      drm: use idr_init_base() to initialize master->lessee_idr
      drm: use idr_init_base() to initialize mode_config.object_idr
      drm: use idr_init_base() to initialize mode_config.tile_idr
      drm/sis: use idr_init_base() to initialize dev_priv->object_idr
      drm/v3d: use idr_init_base() to initialize v3d_priv->perfmon.idr
      drm/via: use idr_init_base() to initialize dev_priv->object_idr
      drm/todo: remove task for idr_init_base()
      drm/fb: remove unused includes of drm_fb_cma_helper.h
      drm/fb: rename FB CMA helpers to FB DMA helpers
      drm/gem: rename GEM CMA helpers to GEM DMA helpers
      drm/gem: rename struct drm_gem_dma_object.{paddr =3D> dma_addr}
      drm/todo: remove task to rename CMA helpers
      drm/virtio: remove drm_plane_cleanup() destroy hook
      drm/vc4: hdmi: unlock mutex when device is unplugged
      drm/vc4: plane: protect device resources after removal
      drm/vc4: crtc: protect device resources after removal
      drm/vc4: hvs: protect drm_print_regset32()

Dave Airlie (17):
      Merge tag 'drm-intel-gt-next-2022-08-24' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'drm-misc-next-2022-09-09' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'amd-drm-next-6.1-2022-09-08' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-intel-gt-next-2022-09-09' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'drm-intel-next-2022-08-29' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'drm-intel-gt-next-2022-09-16' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'drm-intel-next-2022-09-16-1' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'amd-drm-next-6.1-2022-09-16' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'du-next-20220907' of
git://linuxtv.org/pinchartl/media into drm-next
      Merge tag 'exynos-drm-next-for-v6.1' of
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into
drm-next
      Merge tag 'mediatek-drm-next-6.1' of
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux
into drm-next
      Merge tag 'drm-msm-next-2022-09-22' of
https://gitlab.freedesktop.org/drm/msm into drm-next
      Merge tag 'drm-misc-next-2022-09-23' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'amd-drm-next-6.1-2022-09-23' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-intel-next-fixes-2022-09-29' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'drm-misc-next-2022-09-30' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'amd-drm-next-6.1-2022-09-30' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next

David Belanger (2):
      drm/amdkfd: Added GFX 11.0.3 Support
      drm/amdgpu: Enable SA software trap.

David Gow (1):
      drm/amd/display: fix overflow on MIN_I64 definition

Derek Lai (1):
      drm/amd/display: do not change pipe split policy for RV2

Diego Santa Cruz (1):
      drm/i915/glk: ECS Liva Q2 needs GLK HDMI port timing quirk

Dillon Varone (1):
      drm/amd/display: Fix various dynamic ODM transitions on DCN32

Dmitry Baryshkov (27):
      drm/bridge: ti-sn65dsi86: fetch bpc using drm_atomic_state
      drm/bridge: ti-sn65dsi86: support DRM_BRIDGE_ATTACH_NO_CONNECTOR
      drm/msm/dpu: use drm_dsc_config instead of msm_display_dsc_config
      drm/msm/dsi: use drm_dsc_config instead of msm_display_dsc_config
      dt-bindings: display/msm/gpu: allow specifying several IOMMU nodes
      dt-bindings: display/msm/gmu: account for different GMU variants
      dt-bindings: display/msm/mdp4: require 4 IOMMUs
      drm/msm: lookup the ICC paths in both mdp5/dpu and mdss devices
      drm/msm/dpu: index dpu_kms->hw_vbif using vbif_idx
      drm/msm/dpu: fix error handling around dpu_hw_vbif_init
      drm/msm/dpu: drop VBIF indices
      drm/msm/dpu: drop unused memory allocation
      drm/msm/dpu: drop unused variable from dpu_kms_mdp_snapshot()
      drm/msm/dpu: rip out master planes support
      drm/msm/dpu: do not limit the zpos property
      drm/msm/dpu: inline dpu_plane_get_ctl_flush
      drm/msm/dpu: get rid of cached flush_mask
      dt-bindings: msm/dp: mark vdda supplies as deprecated
      dt-bindings: msm/dp: add missing properties
      dt-bindings: msm/dp: handle DP vs eDP difference
      drm/msm/dsi: drop the hpd worker
      drm/mipi-dsi: pass DSC data through the struct mipi_dsi_device
      drm/msm/dsi: fetch DSC pps payload from struct mipi_dsi_device
      drm/panel: drop DSC pps pointer
      drm/msm/dsi: switch to DRM_PANEL_BRIDGE
      dt-bindings: phy: qcom, hdmi-phy-qmp: add clock-cells and XO clock
      drm/msm/hdmi: make hdmi_phy_8996 OF clk provider

Dmitry Osipenko (9):
      drm/virtio: Correct drm_gem_shmem_get_sg_table() error handling
      drm/virtio: Check whether transferred 2D BO is shmem
      drm/virtio: Unlock reservations on virtio_gpu_object_shmem_init() err=
or
      drm/virtio: Unlock reservations on dma_resv_reserve_fences() error
      drm/virtio: Use appropriate atomic state in virtio_gpu_plane_cleanup_=
fb()
      drm/virtio: Simplify error handling of virtio_gpu_object_create()
      drm/virtio: Improve DMA API usage for shmem BOs
      drm/virtio: Use dev_is_pci()
      drm/virtio: Return proper error codes instead of -1

Dmytro Laktyushkin (2):
      drm/amd/display: fix dcn315 memory channel count and width read
      drm/amd/display: increase dcn315 pstate change latency

Douglas Anderson (8):
      MAINTAINERS: Add myself as a reviewer for panel-edp.c
      drm/panel-edp: Fix typo in kerneldoc comment (appers=3D>appears)
      drm/msm/dsi: Fix number of regulators for msm8996_dsi_cfg
      drm/msm/dsi: Fix number of regulators for SDM660
      drm/msm/dsi: Don't set a load before disabling a regulator
      drm/msm/dsi: Use the new regulator bulk feature to specify the load
      drm/msm/dsi: Take advantage of devm_regulator_bulk_get_const()
      drm/msm/dsi: Improve dsi_phy_driver_probe() probe error handling

Duncan Ma (2):
      drm/amd/display: Fix OTG H timing reset for dcn314
      drm/amd/display: Correct dram channel width for dcn314

Eric Bernstein (1):
      drm/amd/display: Remove assert for odm transition case

Ethan Wellenreiter (2):
      drm/amd/display: Re-initialize viewport after pipe merge
      drm/amd/display: Fix check for stream and plane

Evan Quan (10):
      drm/amd/pm: update SMU 13.0.0 driver_if header
      drm/amd/pm: use vbios carried pptable for those supported SKUs
      drm/amd/pm: use vbios carried pptable for all SMU13.0.7 SKUs
      drm/amd/pm: bump SMU 13.0.0 driver_if header version
      drm/amd/pm: add missing SetMGpuFanBoostLimitRpm mapping for SMU 13.0.=
7
      drm/amd/pm: add support for 3794 pptable for SMU13.0.0
      drm/amd/pm: drop the pptable related workarounds for SMU 13.0.0
      drm/amdgpu: avoid gfx register accessing during gfxoff
      drm/amd/pm: enable gfxoff feature for SMU 13.0.0
      drm/amd/pm: use adverse selection for dpm features unsupported by dri=
ver

Felix Kuehling (2):
      drm/amdkfd: Allocate doorbells only when needed
      drm/amdkfd: Fix UBSAN shift-out-of-bounds warning

Francesco Dolcini (2):
      drm/bridge: lt8912b: clarify lvds output status
      drm/bridge: lt8912b: fix corrupted image output

Frank Min (3):
      drm/amdgpu: support psp v13_0_10 ip block
      drm/amdgpu: add new ip block for PSP 13.0
      drm/amdgpu: add gc v11_0_3 ip headers

Gabe Teeger (2):
      drm/amd/display: Cursor lag with PSR1 eDP
      drm/amd/display: Cleanup PSR flag

Gaosheng Cui (6):
      drm/i915: remove unused i915_gem_lmem_obj_ops declaration
      drm/vmwgfx: remove unused vmw_bo_is_vmw_bo() declaration
      drm/radeon/r600_cs: remove r600_cs_legacy_get_tiling_conf() declarati=
on
      drm/radeon: remove unused declarations for radeon
      drm/gma500: remove unused declarations in psb_intel_drv.h
      drm/amd/pm: remove unused declarations in hardwaremanager.h

Geert Uytterhoeven (14):
      drm/fourcc: Add drm_format_info_bpp() helper
      drm/fourcc: Add drm_format_info.is_color_indexed flag
      drm/client: Use actual bpp when allocating frame buffers
      drm/framebuffer: Use actual bpp for DRM_IOCTL_MODE_GETFB
      drm/fourcc: Add DRM_FORMAT_C[124]
      drm/fb-helper: Add support for DRM_FORMAT_C[124]
      drm/gem-fb-helper: Use actual bpp for size calculations
      drm/fourcc: Clarify the meaning of single-channel "red"
      drm/fourcc: Add DRM_FORMAT_R[124]
      drm/fourcc: Add DRM_FORMAT_D[1248]
      drm/mode: Improve drm_mode_fb_cmd2 documentation
      drm/fb: Improve drm_framebuffer.offsets documentation
      drm/format-helper: Fix endianness in drm_fb_*_to_*() conversion helpe=
rs
      drm/gud: Fix endianness in gud_xrgb8888_to_color() helper

George Shen (3):
      drm/amd/display: Fix DCN32 DPSTREAMCLK_CNTL programming
      drm/amd/display: Fix urgent latency override for DCN32/DCN321
      drm/amd/display: Update dummy P-state search to use DCN32 DML

Gerd Hoffmann (1):
      drm/bochs: fix blanking

Graham Sider (5):
      drm/amdgpu: Update mes_v11_api_def.h
      drm/amdkfd: fix MQD init for GFX11 in init_mqd
      drm/amdgpu: pass queue size and is_aql_queue to MES
      drm/amdkfd: fix dropped interrupt in kfd_int_process_v11
      drm/amdgpu: remove switch from amdgpu_gmc_noretry_set

Greg Kroah-Hartman (1):
      drm/amd/display: fix memory leak when using debugfs_lookup()

Guchun Chen (5):
      drm/amdgpu: use adev_to_drm to get drm device
      drm/amdgpu: use dev_info to benefit mGPU case
      drm/amdgpu: disable FRU access on special SIENNA CICHLID card
      drm/amdgpu: prevent toc firmware memory leak
      drm/amd/pm: disable BACO entry/exit completely on several sienna
cichlid cards

Guillaume Ranquet (2):
      drm/mediatek: dp: Add MT8195 External DisplayPort support
      drm/mediatek: dp: Audio support for MT8195

Guo Zhengkui (1):
      drm: omapdrm: dss: replace ternary operator with max()

Hamza Mahfooz (9):
      drm/dp_mst: add passthrough_aux to struct drm_dp_mst_port
      drm/amd/display: consider DSC pass-through during mode validation
      drm/amd/display: implement DSC pass-through support
      drm/amd/display: include soc._clock_tmp[] into DC's scratch region
      drm/amd/display: fix i386 frame size warning
      drm/amd/display: fix indentation in commit_planes_for_stream()
      drm/bridge: it6505: use drm_debug_enabled() in it6505_debug_print()
      drm/amdgpu: use dirty framebuffer helper
      drm/amd/display: fix array-bounds error in dc_stream_remove_writeback=
()

Hans de Goede (42):
      ACPI: video: Add acpi_video_backlight_use_native() helper
      drm/i915: Don't register backlight when another backlight should
be used (v2)
      drm/amdgpu: Don't register backlight when another backlight
should be used (v3)
      drm/radeon: Don't register backlight when another backlight
should be used (v3)
      drm/nouveau: Don't register backlight when another backlight
should be used (v2)
      ACPI: video: Drop backlight_device_get_by_type() call from
acpi_video_get_backlight_type()
      ACPI: video: Remove acpi_video_bus from list before tearing it down
      ACPI: video: Simplify acpi_video_unregister_backlight()
      ACPI: video: Make backlight class device registration a separate step=
 (v2)
      ACPI: video: Remove code to unregister acpi_video backlight when
a native backlight registers
      drm/i915: Call acpi_video_register_backlight() (v3)
      drm/nouveau: Register ACPI video backlight when nv_backlight
registration fails (v2)
      drm/amdgpu: Register ACPI video backlight when skipping amdgpu
backlight registration
      drm/radeon: Register ACPI video backlight when skipping radeon
backlight registration
      platform/x86: nvidia-wmi-ec-backlight: Move fw interface
definitions to a header (v2)
      ACPI: video: Refactor acpi_video_get_backlight_type() a bit
      ACPI: video: Add Nvidia WMI EC brightness control detection (v3)
      ACPI: video: Add Apple GMUX brightness control detection
      platform/x86: nvidia-wmi-ec-backlight: Use acpi_video_get_backlight_t=
ype()
      platform/x86: apple-gmux: Stop calling acpi/video.h functions
      platform/x86: toshiba_acpi: Stop using acpi_video_set_dmi_backlight_t=
ype()
      platform/x86: acer-wmi: Move backlight DMI quirks to acpi/video_detec=
t.c
      platform/x86: asus-wmi: Drop DMI chassis-type check from
backlight handling
      platform/x86: asus-wmi: Move acpi_backlight=3Dvendor quirks to
ACPI video_detect.c
      platform/x86: asus-wmi: Move acpi_backlight=3Dnative quirks to
ACPI video_detect.c
      platform/x86: samsung-laptop: Move
acpi_backlight=3D[vendor|native] quirks to ACPI video_detect.c
      ACPI: video: Remove acpi_video_set_dmi_backlight_type()
      ACPI: video: Drop "Samsung X360" acpi_backlight=3Dnative quirk
      ACPI: video: Drop NL5x?U, PF4NU1F and PF5?U?? acpi_backlight=3Dnative=
 quirks
      ACPI: video: Fix indentation of video_detect_dmi_table[] entries
      drm/todo: Add entry about dealing with brightness control on
devices with > 1 panel
      drm/gma500: Fix (vblank) IRQs not working after suspend/resume
      drm/gma500: Remove runtime_allowed dead code in psb_unlocked_ioctl()
      drm/gma500: Remove never set dev_priv->rpm_enabled flag
      drm/gma500: Remove a couple of not useful function wrappers
      drm/gma500: Rewrite power management code
      drm/gma500: Remove unnecessary suspend/resume wrappers
      drm/gma500: Refactor backlight support (v2)
      drm/gma500: Change registered backlight device type to raw/native
      drm/gma500: Use backlight_get_brightness() to get the brightness
      drm/gma500: Don't register backlight when another backlight should be=
 used
      drm/gma500: Call acpi_video_register_backlight()

Harish Chegondi (1):
      drm/i915/dg2: Add Wa_1509727124

Harshit Mogalapalli (1):
      drm/vkms: fix variable dereferenced before check warning

Hawking Zhang (30):
      drm/amdgpu: drop gc 11_0_0 golden settings
      drm/amdgpu: initialize common sw config for v11_0_3
      drm/amdgpu: add new ip block for SOC21
      drm/amdgpu: declare firmware for new SDMA 6.0.3
      drm/amdgpu: add new ip block for sdma 6.0
      drm/amdgpu: add new ip block for LSDMA 6.0
      drm/amdgpu: only init tap_delay ucode when it's included in ucode bin=
ary
      drm/amdgpu: initialize gmc sw config for v11_0_3
      drm/amdgpu: add new ip block for GMC 11.0
      drm/amdgpu: declare firmware for new GC 11.0.3
      drm/amdgpu: declare firmware for new MES 11.0.3
      drm/amdgpu: init gfx config for gfx v11_0_3
      drm/amdgpu: enable imu_rlc_ram programming for v11_0_3
      drm/amdgpu: Set GC family for GC 11.0.3
      drm/amdgpu: add new ip block for GFX 11.0
      drm/amdgpu: add new ip block for MES 11.0.3
      drm/amdgpu: save rlcv/rlcp ucode version in amdgpu_gfx
      drm/amdgpu: support print rlc v2_x ucode hdr
      drm/amdgpu: add two new subquery ids
      drm/amdgpu: add rlcv/rlcp version info to debugfs
      drm/amdgpu: add helper to init rlc fw in header v2_0
      drm/amdgpu: add helper to init rlc fw in header v2_1
      drm/amdgpu: add helper to init rlc fw in header v2_2
      drm/amdgpu: add helper to init rlc fw in header v2_3
      drm/amdgpu: add helper to init rlc fw in header v2_4
      drm/amdgpu: add helper to init rlc firmware
      drm/amdgpu/gfx9: switch to amdgpu_gfx_rlc_init_microcode
      drm/amdgpu/gfx10: switch to amdgpu_gfx_rlc_init_microcode
      drm/amdgpu/gfx11: switch to amdgpu_gfx_rlc_init_microcode
      drm/amdgpu: add rlc_sr_cntl_list to firmware array

Horace Chen (7):
      drm/amdgpu: add CHIP_IP_DISCOVERY support for virtualization
      drm/amdgpu: add sriov nbio callback structure
      drm/amdgpu: add a compute pipe reset for RS64
      drm/amdgpu: enable WPTR_POLL_ENABLE for sriov on sdma_v6_0
      drm/amdgpu: refine virtualization psp fw skip check
      drm/amdgpu: sriov remove vcn_4_0 and jpeg_4_0
      drm/amdgpu: Support PSP 13.0.10 on SR-IOV

Hsin-Yi Wang (1):
      drm/bridge: ps8640: Add double reset T4 and T5 to power-on sequence

Hugh Cole-Baker (2):
      drm/rockchip: define gamma registers for RK3399
      drm/rockchip: support gamma control on RK3399

Hugo Hu (1):
      drm/amd/display: update gamut remap if plane has changed

Ian Chen (4):
      drm/amd/display: Refactor edp dsc codes.
      drm/amd/display: Add comments.
      drm/amd/display: Refactor edp panel power sequencer(PPS) codes
      drm/amd/display: Add ABM control to panel_config struct.

Igor Torrente (9):
      drm: vkms: Replace hardcoded value of `vkms_composer.map` to
DRM_FORMAT_MAX_PLANES
      drm: vkms: Rename `vkms_composer` to `vkms_frame_info`
      drm: drm_atomic_helper: Add a new helper to deal with the
writeback connector validation
      drm: vkms: get the reference to `drm_framebuffer` instead if coping i=
t
      drm: vkms: Add fb information to `vkms_writeback_job`
      drm: vkms: Refactor the plane composer to accept new formats
      drm: vkms: Supports to the case where primary plane doesn't match the=
 CRTC
      drm: vkms: Adds XRGB_16161616 and ARGB_1616161616 formats
      drm: vkms: Add support to the RGB565 format

Ilya Bakoulin (2):
      drm/amd/display: Change AUX NACK behavior
      drm/amd/display: Change EDID fallback condition

Imre Deak (10):
      drm/i915/tgl+: Fix HDMI transcoder clock vs. DDI BUF disabling order
      drm/i915/d12+: Disable DMC handlers during loading/disabling the firm=
ware
      drm/i915/d13: Add Wa_16015201720 disabling clock gating for PIPEDMC-A=
/B
      drm/i915/xelpd: Fix unclaimed accesses while loading PIPEDMC-C/D
      drm/i915/tc: Fix PHY ownership programming in HDMI legacy mode
      drm/i915/mtl: Add VBT port and AUX_CH mapping
      drm/i915/dp_mst: Fix mst_mgr lookup during atomic check
      drm/dp_mst: Avoid deleting payloads for connectors staying enabled
      drm/i915/mtl: Add display power wells
      drm/i915/mtl: Add DP AUX support on TypeC ports

Iswara Nagulendran (1):
      drm/amd/display: Fix primary EDP link detection

Jaehyun Chung (1):
      drm/amd/display: Assume connectors are on single slot

Jammy Huang (2):
      drm/ast: Add resolution support for 1152x864@75
      drm/ast: Fix video broken in some resolutions on ast2600

Jane Jian (4):
      drm/amdgpu/vcn: Disable CG/PG for SRIOV
      drm/amdgpu/vcn: Add vcn/vcn1 in white list to load its firmware
under sriov
      drm/amdgpu/vcn: Add sriov VCN v4_0 unified queue support
      drm/amdgpu/vcn: Add MMSCH v4_0 support for sriov

Jani Nikula (92):
      drm/i915/hdcp: split out hdcp registers to a separate file
      drm/i915/hdcp: replace BIT() with REG_BIT() in register definitions
      drm/i915/backlight: split out backlight registers to a separate file
      drm/i915/dsi: filter invalid backlight and CABC ports
      drm/i915/dsi: fix dual-link DSI backlight and CABC ports for display =
11+
      drm/i915/dsi: use VBT backlight and CABC port definitions directly
      drm/i915/mtl: Meteorlake and later support DP 2.0
      drm/i915/utils: remove unused KBps/MBps/GBps macros
      drm/i915/guc: remove runtime info printing from time stamp logging
      drm/i915: combine device info printing into one
      drm/i915: add initial runtime info into device info
      drm/i915: move graphics.ver and graphics.rel to runtime info
      drm/i915: move fbc_mask to runtime info
      drm/i915: move page_sizes to runtime info
      drm/i915: move ppgtt_type and ppgtt_size to runtime info
      drm/i915: move has_pooled_eu to runtime info
      drm/i915: move memory_regions to runtime info
      drm/i915: move platform_engine_mask to runtime info
      drm/i915: move pipe_mask and cpu_transcoder_mask to runtime info
      drm/i915: move has_hdcp to runtime info
      drm/i915: move has_dmc to runtime info
      drm/i915: move has_dsc to runtime info
      drm/i915: add display sub-struct to drm_i915_private
      drm/i915: move cdclk_funcs to display.funcs
      drm/i915: move dpll_funcs to display.funcs
      drm/i915: move hotplug_funcs to display.funcs
      drm/i915: move wm_disp funcs to display.funcs
      drm/i915: move fdi_funcs to display.funcs
      drm/i915: move color_funcs to display.funcs
      drm/i915: move and group gmbus members under display.gmbus
      drm/i915: move and group pps members under display.pps
      drm/i915: move dmc to display.dmc
      drm/i915: move and split audio under display.audio and display.funcs
      drm/i915: move dpll under display.dpll
      drm/i915: move and group fbdev under display.fbdev
      drm/i915: move wm to display.wm
      drm/i915: move hotplug to display.hotplug
      drm/i915: move overlay to display.overlay
      drm/i915: move and group sagv under display.sagv
      drm/i915/vrr: drop window2_delay member from i915
      drm/i915: move INTEL_FRONTBUFFER_* macros to intel_frontbuffer.h
      drm/i915: split gem quirks from display quirks
      Merge drm/drm-next into drm-intel-next
      drm/dp: add drm_dp_phy_name() for getting DP PHY name
      drm/i915: move and group hdcp under display.hdcp
      drm/i915: move and group max_bw and bw_obj under display.bw
      drm/i915: move opregion to display.opregion
      drm/i915: move and group cdclk under display.cdclk
      drm/i915: move backlight to display.backlight
      drm/i915: move mipi_mmio_base to display.dsi
      drm/i915: move vbt to display.vbt
      drm/i915: move fbc to display.fbc
      drm/i915: move and group power related members under display.power
      drm/i915: move and group fdi members under display.fdi
      drm/i915: move fb_tracking under display sub-struct
      drm/i915: move dbuf under display sub-struct
      drm/i915: move and group modeset_wq and flip_wq under display.wq
      drm/i915/quirks: abstract checking for display quirks
      drm/i915/quirks: abstract quirks further by making quirk ids an enum
      drm/i915: move quirks under display sub-struct
      drm/i915: move atomic_helper under display sub-struct
      drm/i915: move and group properties under display.properties
      drm/i915/gmbus: split out gmbus regs in a separate file
      drm/i915/gmbus: whitespace cleanup in reg definitions
      drm/i915/gmbus: add wrapper for gmbus mmio base
      drm/i915/gmbus: stop using implicit dev_priv in register definitions
      drm/i915/reg: stop using implicit dev_priv in DSPCLK_GATE_D
      drm/i915/gmbus: mass dev_priv -> i915 rename
      drm/i915/crt: remove BUG_ON()
      drm/i915/dpll: replace BUG_ON() with drm_WARN_ON()
      drm/i915/pch: replace BUG_ON() with drm_WARN_ON()
      drm/i915/perf: replace BUG_ON() with WARN_ON()
      drm/i915/fence: replace BUG_ON() with BUILD_BUG_ON()
      drm/i915: remove unused macro I915_GTT_OFFSET_NONE
      drm/i915: remove unused i915_gem_set_global_seqno() declaration
      drm/i915: un-inline i915_gem_drain_workqueue()
      drm/i915: un-inline i915_gem_drain_freed_objects()
      drm/i915: split out i915_gem.c declarations to i915_gem.h
      Revert "drm/i915: Add DSC support to MST path"
      Revert "drm/i915: Extract drm_dp_atomic_find_vcpi_slots cycle to
separate function"
      Revert "drm/i915: Fix intel_dp_mst_compute_link_config"
      Revert "drm: Add missing DP DSC extended capability definitions."
      drm/i915/dsb: hide struct intel_dsb better
      Merge drm/drm-next into drm-intel-next
      drm/i915/dp: use drm_dp_phy_name() for logging
      drm/i915/ipc: refactor and rename IPC functions
      drm/i915/ipc: move IPC debugfs to skl_watermark.c
      drm/i915/ipc: register debugfs only if IPC available
      drm/i915/display: move IPC under display wm sub-struct
      drm/i915/ipc: use intel_uncore_rmw() to enable/disable
      drm/i915/display: remove ipc_enabled from struct drm_i915_private
      drm/i915: fix device info for devices without display

Jason Wang (4):
      drm/i915/gt: Remove unneeded semicolon
      drm/i915/selftests: Fix comment typo
      drm/gma500: Fix comment typo
      drm/msm/dpu: Fix comment typo

Javier Martinez Canillas (10):
      drm: Use size_t type for len variable in drm_copy_field()
      drm: Prevent drm_copy_field() to attempt copying a NULL pointer
      drm/ssd130x: Use new regmap bulk write support to drop custom bus
      drm/bridge: ti-sn65dsi86: Use dev_err_probe() to avoid polluting the =
log
      drm/msm: Make .remove and .shutdown HW shutdown consistent
      drm/ssd130x: Replace simple display helpers with the atomic helpers
      drm/plane-helper: Add a drm_plane_helper_atomic_check() helper
      drm/msm: Make .remove and .shutdown HW shutdown consistent
      drm/ssd130x: Use drm_atomic_get_new_plane_state()
      drm/ssd130x: Synchronize access to dma-buf imported GEM BOs

JeromeHong (1):
      drm/amd/display: Avoid force minimal transaction in case of
surface_count equal to 0

Jiadong.Zhu (2):
      drm/amdgpu: Correct the position in patch_cond_exec
      drm/amdgpu: Remove fence_process in count_emitted

Jianglei Nie (2):
      drm/nouveau: fix a use-after-free in nouveau_gem_prime_import_sg_tabl=
e()
      drm/nouveau/nouveau_bo: fix potential memory leak in nouveau_bo_alloc=
()

Jiapeng Chong (14):
      drm/amd/display: make enc32_stream_encoder_dvi_set_stream_attribute s=
tatic
      drm/amd/display: make dscl32_calc_lb_num_partitions static
      drm/amd/display: make dcn32_link_encoder_is_in_alt_mode and
dcn32_link_encoder_get_max_link_cap static
      drm/amd/display: make mpc32_program_shaper and mpc32_program_3dlut st=
atic
      drm/amd/display: Remove the unused function copy_stream_update_to_str=
eam()
      drm/amd/display: make some functions static
      drm/amd/display: make
enc314_stream_encoder_dvi_set_stream_attribute static
      drm/amd/display: make optc314_phantom_crtc_post_enable static
      drm/amd/display: make some functions static
      drm/amd/display: make mmhubbub32_config_mcif_buf static
      drm/amd/display: make some functions static
      drm/amd/display: make some functions static
      drm/amd/display: make optc32_phantom_crtc_post_enable,
optc32_setup_manual_trigger and optc32_set_drr static
      drm/atomic-helper: Fix kernel-doc

Jilin Yuan (4):
      drm/gma500: fix repeated words in comments
      drm/tidss: fix repeated words in comments
      drm/amd/display: fix repeated words in comments
      drm/vboxvideo: fix repeated words in comments

JinZe.Xu (1):
      drm/amd/display: Assign link type before check dsc workaround.

Jingyu Wang (5):
      drm/amdgpu: cleanup coding style in amdgpu_acpi.c
      drm/amdgpu: cleanup coding style in amdgpu_sync.c file
      drm/amdgpu: cleanup coding style in amdgpu_amdkfd.c
      drm/amdgpu: cleanup coding style in amdgpu_amdkfd_gpuvm.c
      drm/amdgpu/display: remove unneeded "default n" options

Jinpeng Cui (2):
      drm/amd/display: remove redundant vertical_line_start variable
      drm/amdkfd: remove redundant variables err and ret

Jitao Shi (1):
      drm/mediatek: dp: Add hpd debounce

Johan Hovold (1):
      drm/panel-edp: add AUO B133UAN02.1 panel entry

John Clements (4):
      drm/amdgpu: added firmware module for psp 13.0.10
      drm/amdgpu: added supported smu 13.0.10 sw pptable
      drm/amdgpu: enable smu block for smu 13.0.10
      drm/amdgpu: added support for ras driver loading

John Harrison (14):
      drm/i915/guc: Don't use pr_err when not necessary
      drm/i915/selftest: Cope with not having an RCS engine
      drm/i915/guc: Don't abort on CTB_UNUSED status
      drm/i915/dg2: Update DG2 to GuC v70.4.1
      drm/i915/guc: Fix capture size warning and bump the size
      drm/i915/guc: Add GuC <-> kernel time stamp translation information
      drm/i915/guc: Record CTB info in error logs
      drm/i915/guc: Make GuC log sizes runtime configurable
      drm/i915/guc: Reduce spam from error capture
      drm/i915/uc: Support for version reduced and multiple firmware files
      drm/i915/uc: Add patch level version number support
      drm/i915/uc: Fix issues with overriding firmware files
      drm/i915/uc: Update to latest GuC and use new-format GuC/HuC names
      drm/i915/guc: Fix release build bug in 'remove log size module parame=
ters'

Joonas Lahtinen (1):
      drm/i915/guc: Remove log size module parameters

Josip Pavic (2):
      drm/amd/display: do not compare integers of different widths
      drm/amd/display: log vertical interrupt 1 for debug

Jos=C3=A9 Exp=C3=B3sito (7):
      drm/format-helper: Fix test on big endian architectures
      drm/format-helper: Rename test cases to make them more generic
      drm/format-helper: Support multiple target formats results
      drm/format-helper: Add KUnit tests for drm_fb_xrgb8888_to_rgb565()
      drm/format-helper: Add KUnit tests for drm_fb_xrgb8888_to_rgb888()
      drm/format-helper: Add KUnit tests for drm_fb_xrgb8888_to_xrgb2101010=
()
      drm/format-helper: Add KUnit tests for drm_fb_xrgb8888_to_gray8()

Jos=C3=A9 Roberto de Souza (4):
      Revert "drm/i915/display: Ensure PSR gets disabled if no
encoders in new state"
      drm/i915/psr: Disable PSR before disable pipe
      drm/i915/display/mtl: Extend MBUS programming
      drm/i915: Add new ADL-S pci id

Jouni H=C3=B6gander (11):
      drm/i915/display: Ensure PSR gets disabled if no encoders in new stat=
e
      drm: New function to get luminance range based on static hdr metadata
      drm/amdgpu_dm: Rely on split out luminance calculation function
      drm/i915: Use luminance range calculated during edid parsing
      drm/i915/backlight: Disable pps power hook for aux based backlight
      drm/i915/psr: Equation changed for sending start/stop on prior line
      drm/i915/psr: Disable PSR2 when SDP is sent on prior line
      drm/i915/display: Use original src in psr2 sel fetch area calculation
      drm/i915/display: Use drm helper instead of own loop for damage clips
      drm: Use original src rect while initializing damage iterator
      drm/tests: Set also mock plane src_x, src_y, src_w and src_h

Juston Li (1):
      drm/i915/pxp: don't start pxp without mei_pxp bind

Khaled Almahallawy (1):
      drm/dp: Don't rewrite link config when setting phy test pattern

Krzysztof Kozlowski (5):
      dt-bindings: display/msm: dpu-msm8998: add missing DPU opp-table
      dt-bindings: display/msm: dpu-qcm2290: add missing DPU opp-table
      dt-bindings: display/msm: dpu-sc7180: add missing DPU opp-table
      dt-bindings: display/msm: dpu-sc7280: add missing DPU opp-table
      dt-bindings: display/msm: dpu-sdm845: add missing DPU opp-table

Kuogee Hsieh (3):
      drm/msm/dp: make eDP panel as the first connected connector
      drm/msm/dp: delete DP_RECOVERED_CLOCK_OUT_EN to fix tps4
      drm/msm/dp: correct 1.62G link rate at dp_catalog_ctrl_config_msa()

Lad Prabhakar (1):
      dt-bindings: display: bridge: renesas,dw-hdmi: Add resets property

Laurent Pinchart (4):
      drm/fourcc: Add formats for packed YUV 4:4:4 AVUY and XVUY permutatio=
ns
      drm/bridge: ti-sn65dsi86: Support DisplayPort (non-eDP) mode
      drm/bridge: ti-sn65dsi86: Implement bridge connector operations for D=
P
      drm: rcar-du: Drop leftovers variables from Makefile

Le Ma (1):
      drm/amdgpu: correct the memcpy size for ip discovery firmware

Lee, Alvin (1):
      drm/amd/display: Added debug option for forcing subvp num ways

Leo (Hanghong) Ma (2):
      drm/amd/display: Add support for visual confirm color
      drm/amd/display: Add visual confirm color support for SubVP

Leo Chen (6):
      drm/amd/display: Adding log clock table from SMU
      drm/amd/display: add a override flag as wa for some specific dongle
      drm/amd/display: Missing HPO instance added
      drm/amd/display: Fixing DIG FIFO Error
      drm/amd/display: Adding log for spread_spectrum_info
      drm/amd/display: Various logs added

Leo Li (3):
      drm/amd/display: Fix double cursor on non-video RGB MPO
      drm/amd/display: Prevent OTG shutdown during PSR SU
      drm/amdgpu: Fix mc_umc_status used uninitialized warning

Lewis Huang (1):
      drm/amd/display: Refine aux transaction before retrieve caps

Li Ma (1):
      drm/amd/pm:add new gpu_metrics_v2_3 to acquire average temperature in=
fo

Li Zhong (1):
      drivers/amd/pm: check the return value of amdgpu_bo_kmap

Li zeming (1):
      drm/ttm: Remove unnecessary '0' values from ret

Liang He (4):
      drm/bridge: anx7625: Fix refcount bug in anx7625_parse_dt()
      drm/bridge: tc358767: Add of_node_put() when breaking out of loop
      drm:pl111: Add of_node_put() when breaking out of
for_each_available_child_of_node()
      drm/omap: dss: Fix refcount leak bugs

Lijo Lazar (3):
      drm/amdgpu: Don't enable LTR if not supported
      drm/amdgpu: Disable verbose for p2p dist calc
      drm/amdgpu: Use simplified API for p2p dist calc

Likun Gao (12):
      drm/amdgpu: add MGCG perfmon setting for gfx11
      drm/amdgpu: add function to init CP microcode
      drm/amdgpu/gfx9: use common function to init cp fw
      drm/amdgpu/gfx10: use common function to init CP fw
      drm/amdgpu/gfx11: use common function to init cp fw
      drm/amdgpu: add function to init SDMA microcode
      drm/amdgpu/sdma4: use common function to init sdma fw
      drm/amdgpu/sdma5: use common function to init sdma fw
      drm/amdgpu: support sdma struct v2 fw init
      drm/amdgpu/sdma6: use common function to init sdma fw
      drm/amdgpu: fix compiler warning for amdgpu_gfx_cp_init_microcode
      drm/amdgpu: fix sdma v4 init microcode error

Linus Walleij (1):
      drm/tve200: Fix smatch warning

Liu Zixian (1):
      drm: correct comments

Liviu Dudau (1):
      drm/komeda: Fix handling of atomic commits in the atomic_commit_tail =
hook

Lucas De Marchi (7):
      Revert "drm/i915/dg2: extend Wa_1409120013 to DG2"
      drm/i915/gt: Use MEDIA_VER() when handling media fuses
      drm/i915/gt: Extract function to apply media fuses
      drm/i915: Skip applying copy engine fuses
      drm/i915: Invert if/else ladder for frequency read
      drm/i915/gt: Extract per-platform function for frequency read
      drm/i915: Invert if/else ladder for stolen init

Lucas Stach (4):
      drm/bridge: tc358767: don't fixup mode sync polarity
      drm/bridge: tc358767: increase CLRSIPO count
      drm/bridge: tc358767: disable main link PHYs on main link disable
      drm: bridge: dw_hdmi: only trigger hotplug event on link change

Lyude Paul (18):
      drm/nouveau/kms/nv140-: Disable interlacing
      drm/amdgpu/dc/mst: Rename dp_mst_stream_allocation(_table)
      drm/amdgpu/dm/mst: Rename get_payload_table()
      drm/display/dp_mst: Rename drm_dp_mst_vcpi_allocation
      drm/display/dp_mst: Call them time slots, not VCPI slots
      drm/display/dp_mst: Fix confusing docs for
drm_dp_atomic_release_time_slots()
      drm/display/dp_mst: Add some missing kdocs for atomic MST structs
      drm/display/dp_mst: Add helper for finding payloads in atomic MST sta=
te
      drm/display/dp_mst: Add nonblocking helpers for DP MST
      drm/display/dp_mst: Don't open code modeset checks for releasing
time slots
      drm/display/dp_mst: Fix modeset tracking in
drm_dp_atomic_release_vcpi_slots()
      drm/nouveau/kms: Cache DP encoders in nouveau_connector
      drm/nouveau/kms: Pull mst state in for all modesets
      drm/display/dp_mst: Add helpers for serializing SST <-> MST transitio=
ns
      drm/display/dp_mst: Drop all ports from topology on CSNs before
queueing link address work
      drm/display/dp_mst: Maintain time slot allocations when deleting payl=
oads
      drm/radeon: Drop legacy MST support
      drm/display/dp_mst: Move all payload info into the atomic state

Madhumitha Tolakanahalli Pradeep (2):
      drm/i915/dmc: Update DG2 DMC firmware to v2.07
      drm/i915/mtl: Update CHICKEN_TRANS* register addresses

Magali Lemes (1):
      drm/amd/display: remove unused header

Marek Vasut (20):
      drm/panel/panel-sitronix-st7701: Make DSI mode flags common to ST7701
      drm/panel/panel-sitronix-st7701: Enable DSI burst mode, LPM,
non-continuous clock
      drm/panel/panel-sitronix-st7701: Make voltage supplies common to ST77=
01
      drm/panel/panel-sitronix-st7701: Make gamma correction TFT specific
      drm/panel/panel-sitronix-st7701: Infer vertical line count from TFT m=
ode
      drm/panel/panel-sitronix-st7701: Adjust porch control bitfield name
      drm/panel/panel-sitronix-st7701: Infer horizontal pixel count
from TFT mode
      drm/panel/panel-sitronix-st7701: Parametrize voltage and timing
      drm/panel/panel-sitronix-st7701: Split GIP and init sequences
      dt-bindings: display: panel: sitronix,st7701: Add Densitron
DMT028VGHMCMI-1A TFT
      drm/panel/panel-sitronix-st7701: Add Densitron DMT028VGHMCMI-1A TFT
      drm/lcdif: Clean up headers
      drm/lcdif: Consistently use plain timings
      drm/lcdif: Clean up debug prints and comments
      drm/lcdif: switch to devm_drm_of_get_bridge
      drm: bridge: icn6211: Add and use hs_rate and lp_rate
      dt-bindings: display: bridge: icn6211: Add support for external REFCL=
K
      drm: bridge: icn6211: Add support for external REFCLK
      drm/bridge: tc358767: Handle bridge past DPI output
      drm/bridge: lvds-codec: Fix error checking of
drm_of_lvds_get_data_mapping()

Marijn Suijten (8):
      drm/msm/dsi/phy: Reindent and reflow multiline function calls
      drm/msm/dsi_phy_28nm_8960: Use stack memory for temporary clock names
      drm/msm/dsi/phy: Replace hardcoded char-array length with sizeof()
      drm/msm/dsi_phy_28nm_8960: Replace parent names with clk_hw pointers
      drm/msm/dsi_phy_28nm: Replace parent names with clk_hw pointers
      drm/msm/dsi_phy_14nm: Replace parent names with clk_hw pointers
      drm/msm/dsi_phy_10nm: Replace parent names with clk_hw pointers
      drm/msm/dsi_phy_7nm: Replace parent names with clk_hw pointers

Markus Schneider-Pargmann (3):
      dt-bindings: mediatek,dp: Add Display Port binding
      video/hdmi: Add audio_infoframe packing for DP
      drm/mediatek: Add MT8195 Embedded DisplayPort driver

Martin J=C3=BCcker (2):
      dt-bindings: display: simple: add support for Samsung LTL101AL01
      drm/panel: simple: add support for the Samsung LTL101AL01 panel

Martin Tsai (1):
      drm/amd/display: Correct cursor position on horizontal mirror

Mateusz Kwiatkowski (3):
      drm/vc4: vec: Refactor VEC TV mode setting
      drm/vc4: vec: Remove redundant atomic_mode_set
      drm/vc4: vec: Fix timings for VEC modes

Matt Roper (22):
      drm/i915: Add Wa_14016291713
      drm/i915/gt: Add dedicated function for non-ctx register tuning setti=
ngs
      drm/i915/dg2: Add additional tuning settings
      drm/i915/mtl: MMIO range is now 4MB
      drm/i915/mtl: Don't mask off CCS according to DSS fusing
      drm/i915/dg2: Incorporate Wa_16014892111 into DRAW_WATERMARK tuning
      Revert "drm/i915/dg2: Add preemption changes for Wa_14015141709"
      drm/i915/ats-m: Add thread execution tuning setting
      drm/i915: Move locking and unclaimed check into
mmio_debug_{suspend, resume}
      drm/i915: Only hook up uncore->debug for primary uncore
      drm/i915: Use managed allocations for extra uncore objects
      drm/i915: Drop intel_gt_tile_cleanup()
      drm/i915: Prepare more multi-GT initialization
      drm/i915: Rename and expose common GT early init routine
      drm/i915: Use a DRM-managed action to release the PCI bridge device
      drm/i915: Initialize MMIO access for each GT
      drm/i915: Handle each GT on init/release and suspend/resume
      drm/i915/uncore: Add GSI offset to uncore
      drm/i915/mtl: Add gsi_offset when emitting aux table invalidation
      drm/i915/xelpmp: Expose media as another GT
      drm/i915/mtl: Use primary GT's irq lock for media GT
      drm/i915/mtl: Hook up interrupts for standalone media

Matthew Auld (5):
      drm/i915/ttm: don't leak the ccs state
      drm/i915/ttm: remove calc_ctrl_surf_instr_size
      drm/i915/ttm: fix CCS handling
      Revert "drm/i915/guc: Add delay to disable scheduling after pin
count goes to zero"
      drm/i915: consider HAS_FLAT_CCS() in needs_ccs_pages

Matthew Brost (4):
      drm/i915/guc: Fix issues with live_preempt_cancel
      drm/i915/guc: Support larger contexts on newer hardware
      drm/i915/selftests: Use correct selfest calls for live tests
      drm/i915/guc: Add delay to disable scheduling after pin count goes to=
 zero

Mauro Carvalho Chehab (3):
      drm/i915/gt: document with_intel_gt_pm_if_awake()
      drm/i915/gt: describe the new tlb parameter at i915_vma_resource
      drm/i915: pass a pointer for tlb seqno at vma_invalidate_tlb()

Max Tseng (1):
      drm/amd/display: Cursor Info Update refactor

Maxime Ripard (92):
      drm/vc4: hdmi: Depends on CONFIG_PM
      drm/vc4: hdmi: Rework power up
      Merge drm/drm-next into drm-misc-next
      drm/mipi-dsi: Detach devices when removing the host
      drm/crtc: Introduce drmm_crtc_init_with_planes
      drm/encoder: Introduce drmm_encoder_init
      drm/connector: Reorder headers
      drm/connector: Mention the cleanup after drm_connector_init
      drm/connector: Clarify when drm_connector_unregister is needed
      drm/connector: Consolidate Connector Initialization
      drm/connector: Check for destroy implementation
      drm/connector: Introduce drmm_connector_init
      drm/bridge: panel: Introduce drmm_panel_bridge_add
      drm/bridge: panel: Introduce drmm_of_get_bridge
      drm/vc4: drv: Call component_unbind_all()
      drm/vc4: drv: Use drm_dev_unplug
      drm/vc4: crtc: Create vblank reporting function
      drm/vc4: hvs: Protect device resources after removal
      drm/vc4: hvs: Remove planes currently allocated before taking down
      drm/vc4: plane: Take possible_crtcs as an argument
      drm/vc4: crtc: Remove manual plane removal on error
      drm/vc4: plane: Switch to drmm_universal_plane_alloc()
      drm/vc4: crtc: Move debugfs_name to crtc_data
      drm/vc4: crtc: Switch to drmm_kzalloc
      drm/vc4: crtc: Switch to DRM-managed CRTC initialization
      drm/vc4: dpi: Remove vc4_dev dpi pointer
      drm/vc4: dpi: Embed DRM structures into the private structure
      drm/vc4: dpi: Switch to drmm_kzalloc
      drm/vc4: dpi: Return an error if we can't enable our clock
      drm/vc4: dpi: Remove unnecessary drm_of_panel_bridge_remove call
      drm/vc4: dpi: Add action to disable the clock
      drm/vc4: dpi: Switch to DRM-managed encoder initialization
      drm/vc4: dpi: Switch to drmm_of_get_bridge
      drm/vc4: dpi: Protect device resources
      drm/vc4: dsi: Embed DRM structures into the private structure
      drm/vc4: dsi: Switch to DRM-managed encoder initialization
      drm/vc4: dsi: Switch to drmm_of_get_bridge
      drm/vc4: dsi: Fix the driver structure lifetime
      drm/vc4: dsi: Switch to devm_pm_runtime_enable
      drm/vc4: hdmi: Switch to drmm_kzalloc
      drm/vc4: hdmi: Remove call to drm_connector_unregister()
      drm/vc4: hdmi: Switch to DRM-managed encoder initialization
      drm/vc4: hdmi: Switch to DRM-managed connector initialization
      drm/vc4: hdmi: Switch to device-managed ALSA initialization
      drm/vc4: hdmi: Switch to device-managed CEC initialization
      drm/vc4: hdmi: Use a device-managed action for DDC
      drm/vc4: hdmi: Switch to DRM-managed kfree to build regsets
      drm/vc4: hdmi: Use devm to register hotplug interrupts
      drm/vc4: hdmi: Move audio structure offset checks
      drm/vc4: hdmi: Protect device resources after removal
      drm/vc4: hdmi: Switch to devm_pm_runtime_enable
      drm/vc4: txp: Remove vc4_dev txp pointer
      drm/vc4: txp: Remove duplicate regset
      drm/vc4: txp: Switch to drmm_kzalloc
      drm/vc4: txp: Remove call to drm_connector_unregister()
      drm/vc4: txp: Protect device resources
      drm/vc4: vec: Remove vc4_dev vec pointer
      drm/vc4: vec: Embed DRM structures into the private structure
      drm/vc4: vec: Switch to drmm_kzalloc
      drm/vc4: vec: Remove call to drm_connector_unregister()
      drm/vc4: vec: Switch to DRM-managed encoder initialization
      drm/vc4: vec: Switch to DRM-managed connector initialization
      drm/vc4: vec: Protect device resources after removal
      drm/vc4: vec: Switch to devm_pm_runtime_enable
      drm/vc4: debugfs: Protect device resources
      drm/vc4: debugfs: Return an error on failure
      drm/vc4: debugfs: Simplify debugfs registration
      drm/vc4: Switch to drmm_mutex_init
      drm/vc4: perfmon: Add missing mutex_destroy
      drm/vc4: v3d: Stop disabling interrupts
      drm/vc4: v3d: Rework the runtime_pm setup
      drm/vc4: v3d: Switch to devm_pm_runtime_enable
      drm/vc4: vec: Remove empty mode_fixup
      drm/vc4: vec: Convert to atomic helpers
      drm/sun4i: tv: Remove unused mode_valid
      drm/sun4i: tv: Convert to atomic hooks
      drm/sun4i: tv: Remove useless function
      drm/sun4i: tv: Remove useless destroy function
      drm/sun4i: tv: Rename error label
      drm/sun4i: tv: Add missing reset assertion
      drm/sun4i: tv: Merge mode_set into atomic_enable
      drm/sun4i: tv: Include drm_atomic.h
      drm/vc4: hdmi: Constify drm_display_mode
      drm/vc4: hdmi: Remove unused argument in vc4_hdmi_supports_scrambling
      drm/vc4: hdmi: Remove mutex in detect
      drm/vc4: hdmi: Simplify the hotplug handling
      drm/vc4: hdmi: Switch to detect_ctx
      drm/vc4: hdmi: Move vc4_hdmi_supports_scrambling() around
      drm/vc4: hdmi: Reset link on hotplug
      drm/scdc: Document hotplug gotchas
      Merge drm/drm-next into drm-misc-next
      Merge tag 'backlight-detect-refactor-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86
into drm-misc-next

Maya Matuszczyk (2):
      drm: panel-orientation-quirks: Add quirk for Anbernic Win600
      drm: panel-orientation-quirks: Add quirk for Aya Neo Air

Ma=C3=ADra Canal (14):
      drm: selftest: convert drm_damage_helper selftest to KUnit
      drm: selftest: convert drm_cmdline_parser selftest to KUnit
      drm: selftest: convert drm_rect selftest to KUnit
      drm: selftest: convert drm_format selftest to KUnit
      drm: selftest: convert drm_plane_helper selftest to KUnit
      drm: selftest: convert drm_dp_mst_helper selftest to KUnit
      drm: selftest: convert drm_framebuffer selftest to KUnit
      drm: selftest: convert drm_buddy selftest to KUnit
      drm/tests: Split up test cases in igt_check_drm_format_min_pitch
      drm/vc4: Drop of_gpio header
      drm/amd/display: Include missing header
      drm/mediatek: Drop of_gpio header
      drm/tests: Split drm_framebuffer_create_test into parameterized tests
      drm/tests: Change "igt_" prefix to "drm_test_"

Meenakshikumar Somasundaram (1):
      drm/amd/display: Display distortion after hotplug 5K tiled display

Melissa Wen (5):
      Documentation/amdgpu_dm: Add DM color correction documentation
      Documentation/amdgpu/display: add DC color caps info
      drm/amd/display: add doc entries for MPC blending configuration
      Documentation/gpu/amdgpu/amdgpu_dm: add DM docs for pixel blend mode
      drm/vkms: fix 32bit compilation error by replacing macros

Michael Strauss (3):
      drm/amd/display: Add DC debug option to force LTTPR mode
      drm/amd/display: Assume an LTTPR is always present on fixed_vs links
      drm/amd/display: Refactor LTTPR mode selection

Micha=C5=82 Winiarski (5):
      drm/i915/guc: Route semaphores to GuC for Gen12+
      drm/cmdline-parser: Merge negative tests
      drm/cmdline-parser: Use assert when needed
      drm/format: Use appropriate types in expect/assert
      drm/format: Split into more granular test cases

Minghao Chi (1):
      drm: bridge/dw-hdmi-ahb-audio: use strscpy() is more robust and safer

Mitul Golani (1):
      drm/i915/display: Fix warning callstack for imbalance wakeref

Mukul Joshi (2):
      drm/amdgpu: Fix page table setup on Arcturus
      drm/amdgpu: Update PTE flags with TF enabled

Nagulendran, Iswara (1):
      drm/amd/display: Reverted DSC programming sequence change

Nathan Chancellor (9):
      drm/simpledrm: Fix return type of
simpledrm_simple_display_pipe_mode_valid()
      drm/amd/display: Reduce number of arguments of
dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport()
      drm/amd/display: Reduce number of arguments of
dml32_CalculatePrefetchSchedule()
      drm/amd/display: Reduce number of arguments of dml31's
CalculateWatermarksAndDRAMSpeedChangeSupport()
      drm/amd/display: Reduce number of arguments of dml31's
CalculateFlipSchedule()
      drm/amd/display: Mark dml30's UseMinimumDCFCLK() as noinline for
stack usage
      drm/msm/dsi: Remove use of device_node in dsi_host_parse_dt()
      drm/amd/display: Reduce number of arguments of dml314's
CalculateWatermarksAndDRAMSpeedChangeSupport()
      drm/amd/display: Reduce number of arguments of dml314's
CalculateFlipSchedule()

Nathan Huckleberry (2):
      drm/i915: Fix return type of mode_valid function hook
      drm/exynos: Fix return type for mixer_mode_valid and hdmi_mode_valid

Nicholas Kazlauskas (6):
      drm/amd/display: Hook up DCN314 specific dml implementation
      drm/amd/display: Relax swizzle checks for video non-RGB formats on DC=
N314
      drm/amd/display: Disable OTG WA for the plane_state NULL case on DCN3=
14
      drm/amd/display: Do DIO FIFO enable after DP video stream enable
      drm/amd/display: Wrap OTG disable workaround with FIFO control
      drm/amd/display: Add explicit FIFO disable for DP blank

Niranjana Vishwanathapura (1):
      drm/i915: Rename ggtt_view as gtt_view

Nirmoy Das (4):
      drm/i915: disable pci resize on 32-bit machine
      drm/i915/ttm: Abort suspend on i915_ttm_backup failure
      drm/i915: Set correct domains values at _i915_vma_move_to_active
      drm/i915: Do not cleanup obj with NULL bo->resource

N=C3=ADcolas F. R. A. Prado (2):
      drm/panel-edp: Add panel entry for R140NWF5 RH
      drm/panel-edp: Add panel entry for B120XAN01.0

Patrik Jakobsson (1):
      drm/gma500: Fix SDVO command debug printing

Paul Cercueil (5):
      dt-bindings/display: ingenic: Add compatible string for the JZ4760(B)
      drm/ingenic: Fix MODULE_LICENSE() string
      drm/ingenic: Add support for the JZ4760(B)
      drm/ingenic: Don't request full modeset if property is not modified
      drm/ingenic: Use the new PM macros

Pavle Kotarac (2):
      drm/amd/display: Added new DCN301 Asic Id
      drm/amd/display: Removing 2 phys

Philip Yang (12):
      drm/amdkfd: handle CPU fault on COW mapping
      drm/amdkfd: Remove prefault before migrating to VRAM
      drm/amdkfd: Migrate in CPU page fault use current mm
      drm/amdgpu: SDMA update use unlocked iterator
      drm/amdgpu: Rename vm invalidate lock to status_lock
      drm/amdgpu: Use vm status_lock to protect relocated list
      drm/amdgpu: Use vm status_lock to protect vm idle list
      drm/amdgpu: Use vm status_lock to protect vm moved list
      drm/amdgpu: Use vm status_lock to protect vm evicted list
      drm/amdgpu: Use vm status_lock to protect pt free
      drm/amdgpu: Fix amdgpu_vm_pt_free warning
      drm/amdkfd: Track unified memory when switching xnack mode

Philippe Schenker (2):
      drm/bridge: lt8912b: add vsync hsync
      drm/bridge: lt8912b: set hdmi or dvi mode

Pin-Yen Lin (1):
      drm/bridge: it6505: Power on downstream device in .atomic_enable

Pin-yen Lin (1):
      drm/bridge: it6505: Fix the order of DP_SET_POWER commands

Piotr Pi=C3=B3rkowski (2):
      drm/i915: Use of BARs names instead of numbers
      drm/i915: Sanitycheck PCI BARs

Prike Liang (1):
      drm/amdkfd: Fix isa version for the GC 10.3.7

Qu Huang (1):
      drm/amdgpu: mmVM_L2_CNTL3 register not initialized correctly

Radhakrishna Sripada (11):
      drm/i915: Skip Bit12 fw domain reset for gen12+
      drm/i915/mtl: Add PCH support
      drm/i915/mtl: Add support for MTL in Display Init sequences
      drm/i915: Extract wm latency adjustment to its own function
      drm/i915/mtl: memory latency data from LATENCY_LPX_LPY for WM
      drm/i915/mtl: Update memory bandwidth parameters
      drm/i915/mtl: Reuse adl-p DBUF calculations
      drm/i915: Move display and media IP version to runtime info
      drm/i915/mtl: Add gmbus and gpio support
      drm/i915/mtl: Obtain SAGV values from MMIO instead of GT pcode mailbo=
x
      drm/i915/mtl: Update MBUS_DBOX credits

Rafael J. Wysocki (1):
      drm: amd: amdgpu: ACPI: Add comment about ACPI_FADT_LOW_POWER_S0

Rafael Mendonca (2):
      drm/amdgpu: Fix memory leak in hpd_rx_irq_create_workqueue()
      drm/vmwgfx: Fix memory leak in vmw_mksstat_add_ioctl()

Rahul Kumar Singh (1):
      drm/i915/guc: Add selftest for a hung GuC

Rajneesh Bhardwaj (1):
      drm/amdkfd: Fix CRIU restore op due to doorbell offset

Randy Dunlap (3):
      drm/panel: use 'select' for Ili9341 panel driver helpers
      drm: fix drm_mipi_dbi build errors
      drm/scheduler: quieten kernel-doc warnings

Rob Clark (21):
      drm/virtio: Fix same-context optimization
      drm/msm: Reorder lock vs submit alloc
      drm/msm: Small submit cleanup
      drm/msm: Split out idr_lock
      drm/msm/gem: Check for active in shrinker path
      drm/msm/gem: Rename update_inactive
      drm/msm/gem: Rename to pin/unpin_pages
      drm/msm/gem: Consolidate pin/unpin paths
      drm/msm/gem: Remove active refcnt
      drm/gem: Add LRU/shrinker helper
      drm/msm/gem: Convert to using drm_gem_lru
      drm/msm/gem: Unpin buffers earlier
      drm/msm/gem: Consolidate shrinker trace
      drm/msm/gem: Evict active GEM objects when necessary
      drm/msm/gem: Add msm_gem_assert_locked()
      drm/msm/gem: Convert to lockdep assert
      drm/msm: Add fault-injection support
      drm/msm/iommu: optimize map/unmap
      drm/msm: De-open-code some CP_EVENT_WRITE
      drm/msm/rd: Fix FIFO-full deadlock
      drm/msm: Fix build break with recent mm tree

Robert Foss (4):
      Revert "dt-bindings: Add byteswap order to chrontel ch7033"
      Revert "drm/bridge: ti-sn65dsi86: Implement bridge connector
operations for DP"
      Revert "Revert "drm/bridge: ti-sn65dsi86: Implement bridge
connector operations for DP""
      Revert "drm/bridge: chrontel-ch7033: Add byteswap order setting"

Robin Chen (2):
      drm/amd/display: Cursor flicker when entering PSRSU
      drm/amd/display: Revise Sink device string ID

Robin Murphy (3):
      drm/arm/hdlcd: Take over EFI framebuffer properly
      drm/arm/hdlcd: Simplify IRQ install/uninstall
      drm/panfrost: Update io-pgtable API

Rodrigo Siqueira (13):
      drm/amd/display: Add documentation to some of the cursor struct
      drm/amd/display: Add basic kernel doc to CRC code under DC
      drm/amd/display: Add some extra kernel doc to amdgpu_dm
      drm/amd/display: Document pipe split policy
      drm/amd/display: Expand documentation for timing
      drm/amd/display: Document some of the DML structs
      drm/amd/display: Remove unused code
      Documentation/gpu: Add info table for ASICs
      Documentation/gpu: Add an explanation about the DCN pipeline
      Documentation/gpu: Add Multiplane Overlay doc
      drm/amd/display: Fix compilation errors on DCN314
      drm/amd/display: Enable dlg and vba compilation for dcn314
      drm/amd/display: Ignore k1/k2 values for virtual signal

Rodrigo Vivi (4):
      Merge drm/drm-next into drm-intel-next
      drm/i915/slpc: Fix inconsistent locked return
      drm/i915/slpc: Let's fix the PCODE min freq table setup for SLPC
      drm/i915: Don't try to disable host RPS when this was never enabled.

Roman Li (2):
      drm/amd/display: enable PCON support for dcn314
      drm/amd/display: Remove redundant check in atomic_check

Ruijing Dong (1):
      drm/amdgpu/vcn: update vcn4 fw shared data structure

Saaem Rizvi (1):
      drm/amd/display: HDMI ODM Combine Policy Correction

Sam Ravnborg (13):
      drm/via: Rename via_drv to via_dri1
      drm/via: Embed via_dma in via_dri1
      drm/via: Embed via_map in via_dri1
      drm/via: Embed via_mm in via_dri1
      drm/via: Embed via_video in via_dri1
      drm/via: Embed via_irq in via_dri1
      drm/via: Embed via_dmablit in via_dri1
      drm/via: Embed via_verifier in via_dri1
      drm/via: Embed via_drv.h in via_dri1
      drm/via: Update to the latest via_3d_reg header
      drm/via: Use SPDX tag for MIT license in via_3d_reg header
      drm/via: Make macros readable in the via_3d_reg header
      drm/via: Fix style issues in via_3d_reg header

Samson Tam (2):
      drm/amd/display: fix odm 2:1 policy not being applied
consistently in 4k144 modes
      drm/amd/display: fill in clock values when DPM is not enabled

Samuel Holland (1):
      drm/sun4i: Update Kconfig defaults and descriptions

Sean Hong (8):
      drm/panel-edp: Add INX N116BCN-EA1
      drm/panel-edp: Add BOE NT116WHM-N21 (HW: V8.1)
      drm/panel-edp: Add BOE NT116WHM-N21
      drm/panel-edp: Add AUO B116XAK01.6
      drm/panel-edp: Add INX N116BCA-EA2
      drm/panel-edp: Fix delays for INX N116BCN-EA1 (HW: C4)
      drm/panel-edp: Fix delays for INX N116BCA-EA2 (HW: C1)
      drm/panel-edp: Add BOE NT116WHM-N4C (HW: V8.1)

Sherry Wang (1):
      drm/amd/display: correct hostvm flag

Shiwu Zhang (1):
      drm/amdkfd: Use the consolidated MQD manager functions for GFX11

Simon Ser (6):
      drm/dp_mst: fix drm_dp_dpcd_read return value checks
      drm: fix whitespace in drm_plane_create_color_properties()
      drm: hide unregistered connectors from GETCONNECTOR IOCTL
      drm/atomic-helper: print message on driver connector check failure
      drm/atomic-helper: log EINVAL cause in drm_atomic_helper_async_check(=
)
      drm/framebuffer: convert to drm_dbg_kms()

Slark Xiao (1):
      drm: Fix typo 'the the' in comment

Sonny Jiang (3):
      drm/amdgpu: Enable pg/cg flags on GC11_0_3 for VCN
      drm/amdgpu: Enable VCN DPG for GC11_0_1
      drm/amdgpu: Enable sram on vcn_4_0_2

Stanislav Lisovskiy (6):
      drm/i915/dg2: Bump up CDCLK for DG2
      drm/i915: Start using REG_BIT* macros with CDCLK registers
      drm: Add missing DP DSC extended capability definitions.
      drm/i915: Fix intel_dp_mst_compute_link_config
      drm/i915: Extract drm_dp_atomic_find_vcpi_slots cycle to separate fun=
ction
      drm/i915: Add DSC support to MST path

Steev Klimaszewski (1):
      drm/panel-edp: add IVO M133NW4J-R3 panel entry

Stephen Boyd (4):
      drm/msm/dp: Reorganize code to avoid forward declaration
      drm/msm/dp: Remove pixel_rate from struct dp_ctrl
      drm/msm/dp: Get rid of dp_ctrl_on_stream_phy_test_report()
      drm/msm/dp: Silence inconsistent indent warning

Swati Sharma (2):
      drm/i915/display: Add debug print for scaler filter
      drm/i915/dsc: convert dsc debugfs entry from output_bpp to input_bpc

Taimur Hassan (7):
      drm/amd/display: Set ODM policy based on number of DSC slices
      drm/amd/display: Remove assert from PHY state update
      drm/amd/display: Allow PHY state update between same states
      drm/amd/display: Round cursor width up for MALL allocation
      drm/amd/display: Avoid avoid unnecessary pixel rate divider programmi=
ng
      drm/amd/display: Fix typo in get_pixel_rate_div
      drm/amd/display: Avoid unnecessary pixel rate divider programming

Takanari Hayama (3):
      media: vsp1: Add premultiplied alpha support
      drm: rcar-du: Add DRM_MODE_BLEND_PREMULTI support
      drm: rcar-du: Add DRM_MODE_BLEND_PIXEL_NONE support

Takashi Iwai (14):
      drm/udl: Replace semaphore with a simple wait queue
      drm/udl: Sync pending URBs at suspend / disconnect
      drm/udl: Kill pending URBs at suspend and disconnect
      drm/udl: Replace BUG_ON() with WARN_ON()
      drm/udl: Restore display mode on resume
      Revert "drm/udl: Kill pending URBs at suspend and disconnect"
      drm/udl: Suppress error print for -EPROTO at URB completion
      drm/udl: Increase the default URB list size to 20
      drm/udl: Drop unneeded alignment
      drm/udl: Pass rectangle directly to udl_handle_damage()
      drm/udl: Fix potential URB leaks
      drm/udl: Fix inconsistent urbs.count value during udl_free_urb_list()
      drm/udl: Don't re-initialize stuff at retrying the URB list allocatio=
n
      drm/udl: Sync pending URBs at the end of suspend

Tales Aparecida (2):
      drm/amd/display: fix minor codestyle problems
      drm/amd/display: remove unneeded defines from bios parser

Tao Zhou (4):
      drm/amdgpu: export umc error address convert interface
      drm/amdgpu: support to convert dedicated umc mca address
      drm/amdgpu: use RAS error address convert api in mca notifier
      drm/amdgpu: add page retirement handling for CPU RAS

Taylor, Clinton A (1):
      drm/i915/dg2: Add additional HDMI pixel clock frequencies

Tetsuo Handa (1):
      gpu/drm/bridge/cadence: avoid flush_scheduled_work() usage

Thierry Reding (1):
      drm/aperture: Fix some kerneldoc comments

Thomas Zimmermann (68):
      fbdev: Remove trailing whitespaces
      fbdev/vga16fb: Create EGA/VGA devices in sysfb code
      fbdev/vga16fb: Auto-generate module init/exit code
      fbdev/core: Remove remove_conflicting_pci_framebuffers()
      fbdev: Convert drivers to aperture helpers
      fbdev: Remove conflicting devices on PCI bus
      video/aperture: Disable and unregister sysfb devices via aperture hel=
pers
      video: Provide constants for VGA I/O range
      video/aperture: Remove conflicting VGA devices, if any
      fbdev: Acquire framebuffer apertures for firmware devices
      fbdev: Remove conflict-handling code
      fbdev: Fix order of arguments to aperture_remove_conflicting_devices(=
)
      drm/vmwgfx: Remove trailing whitespace
      drm/atomic-helper: Move DRM_PLANE_HELPER_NO_SCALING to atomic helpers
      drm/atomic-helper: Remove _HELPER_ infix from DRM_PLANE_HELPER_NO_SCA=
LING
      drm: Remove unnecessary include statements of drm_plane_helper.h
      drm/plane-helper: Export individual helpers
      drm/armada: Use drm_plane_helper_destroy()
      drm/fsl-dcu: Use drm_plane_helper_destroy()
      drm/mgag200: Split mgag200_modeset_init()
      drm/mgag200: Move DAC-register setup into model-specific code
      drm/mgag200: Move ER/EW3 register initialization to per-model code
      drm/mgag200: Acquire I/O-register lock in atomic_commit_tail function
      drm/mgag200: Store primary plane's color format in CRTC state
      drm/mgag200: Reorganize before dropping simple-KMS helpers
      drm/mgag200: Replace simple-KMS with regular atomic helpers
      drm/mgag200: Set SCROFF in primary-plane code
      drm/mgag200: Add per-device callbacks
      drm/mgag200: Provide per-device callbacks for BMC synchronization
      drm/mgag200: Provide per-device callbacks for PIXPLLC
      drm/mgag200: Move mode-config to model-specific code
      drm/mgag200: Move CRTC atomic_enable to model-specific code
      drm/mgag200: Remove type field from struct mga_device
      Merge drm/drm-next into drm-misc-next
      drm/simpledrm: Remove mem field from device structure
      drm/simpledrm: Inline device-init helpers
      drm/simpledrm: Remove pdev field from device structure
      drm/simpledrm: Compute framebuffer stride if not set
      drm/simpledrm: Convert to atomic helpers
      iosys-map: Add IOSYS_MAP_INIT_VADDR_IOMEM()
      drm/format-helper: Provide drm_fb_blit()
      drm/format-helper: Merge drm_fb_memcpy() and drm_fb_memcpy_toio()
      drm/format-helper: Convert drm_fb_swab() to struct iosys_map
      drm/format-helper: Rework XRGB8888-to-RGBG332 conversion
      drm/format-helper: Rework XRGB8888-to-RGBG565 conversion
      drm/format-helper: Rework XRGB8888-to-RGB888 conversion
      drm/format-helper: Rework RGB565-to-XRGB8888 conversion
      drm/format-helper: Rework RGB888-to-XRGB8888 conversion
      drm/format-helper: Rework XRGB8888-to-XRGB2101010 conversion
      drm/format-helper: Rework XRGB8888-to-GRAY8 conversion
      drm/format-helper: Rework XRGB8888-to-MONO conversion
      drm/format-helper: Move destination-buffer handling into internal hel=
per
      drm/format-helper: Rename parameter vmap to src
      drm/udl: Add reset_resume
      drm/udl: Enable damage clipping
      drm/probe-helper: Add drm_connector_helper_get_modes_fixed()
      drm/probe-helper: Add drm_crtc_helper_mode_valid_fixed()
      drm/modes: Add initializer macro DRM_MODE_INIT()
      drm/format-helper: Add drm_fb_build_fourcc_list() helper
      drm/plane: Remove drm_plane_init()
      drm/plane: Allocate planes with drm_universal_plane_alloc()
      drm/plane-helper: Warn if atomic drivers call non-atomic helpers
      drm/plane-helper: Provide DRM_PLANE_NON_ATOMIC_FUNCS initializer macr=
o
      drm/simpledrm: Compute linestride with drm_format_info_min_pitch()
      drm/simpledrm: Use drm_atomic_get_new_plane_state()
      drm/simpledrm: Remove !fb check from atomic_update
      drm/simpledrm: Iterate over damage clips
      drm/simpledrm: Synchronize access to GEM BOs

Tim Huang (5):
      drm/amdgpu: enable GFXOFF allow control for GC IP v11.0.1
      drm/amdgpu: add TX_POWER_CTRL_1 macro definitions for NBIO IP v7.7.0
      drm/amdgpu: add NBIO IP v7.7.0 Clock Gating support
      drm/amdgpu: enable NBIO IP v7.7.0 Clock Gating
      drm/amdgpu: add sdma instance check for gfx11 CGCG

Tom Rix (3):
      drm/nouveau/bios: set info only when the return is not 0
      drm/vmwgfx: cleanup comments
      drm/rockchip: remove vop_writel from vop1 driver

Tom St Denis (3):
      drm/amd/amdgpu: Add missing CGTS*TCC_DISABLE to 10.3 headers
      drm/amd/amdgpu: update GC 10.3.0 pwrdec
      drm/amd/amdgpu: Add missing XGMI hive registers for mmhub 9.4.1

Tomas Winkler (7):
      mei: add kdoc for struct mei_aux_device
      mei: add slow_firmware flag to the mei auxiliary device
      mei: gsc: use polling instead of interrupts
      mei: mkhi: add memory ready command
      mei: gsc: setup gsc extended operational memory
      mei: debugfs: add pxp mode to devstate in debugfs
      drm/i915/gsc: allocate extended operational memory in LMEM

Tomi Valkeinen (8):
      drm/bridge: ti-sn65dsi86: Reject modes with too large blanking
      drm: rcar-du: Remove unnecessary include
      drm: rcar-du: Fix r8a779a0 color issue
      drm: rcar-du: lvds: Rename pclk enable/disable functions
      drm: rcar-du: dsi: Properly stop video mode TX
      drm: rcar-du: dsi: Improve DSI shutdown
      drm: rcar-du: Fix DSI enable & disable sequence
      drm: rcar-du: dsi: Fix VCLKSET write

Umesh Nerlige Ramappa (1):
      drm/i915/guc: Cancel GuC engine busyness worker synchronously

Uwe Kleine-K=C3=B6nig (3):
      drm/panel: simple: Make panel_simple_remove() return void
      drm/panel-novatek-nt35510: Emit an error message if power off fails
      drm/mipi-dsi: Make remove callback return void

Vandita Kulkarni (2):
      drm/i915/dsc/mtl: Update the DSC minor version
      drm/i915/dsc/mtl: Enable alternate ICH method

Victor Zhao (6):
      drm/amdgpu: add mode2 reset for sienna_cichlid
      drm/amdgpu: let mode2 reset fallback to default when failure
      drm/amdgpu: add debugfs amdgpu_reset_level
      drm/amdgpu: save and restore gc hub regs
      drm/amdgpu: revert context to stop engine before mode2 reset
      drm/amdgpu: reduce reset time

Vignesh Chander (3):
      drm/amdgpu: skip set_topology_info for VF
      drm/amdgpu: Fix hive reference count leak
      drm/amdgpu: Skip put_reset_domain if it doesn't exist

Ville Syrj=C3=A4l=C3=A4 (44):
      drm/i915/mtl: Introduce FBC B
      drm/i915: Skip wm/ddb readout for disabled pipes
      drm/i915/bios: Dump PNPID and panel name
      drm/i915/bios: Copy the whole MIPI sequence block
      drm/i915: Allow more varied alternate fixed modes for panels
      drm/i915/bios: Validate fp_timing terminator presence
      drm/i915/bios: Use hardcoded fp_timing size for generating LFP
data pointers
      drm/i915: Implement WaEdpLinkRateDataReload
      Revert "drm/i915/display: Re-add check for low voltage sku for
max dp source rate"
      drm/i915: Unify VBT version number comments
      drm/i915: Add some more VBT version number comments
      drm/i915: Properly define the DP redriver VBT bits
      drm/i915: Define VBT eDP/DP max lane count bits
      drm/i915: Add the VBT LTTPR transparent vs. non-transparent bits
      drm/i915: Define VBT max HDMI FRL rate bits
      drm/i915: Document the sets of bits in the driver features block
      drm/i915: Define more VBT driver features block bits
      drm/i915: Define all possible VBT device handles
      drm/i915: Rename some VBT bits
      drm/i915: Parse DP/eDP max lane count from VBT
      drm/i915: Relocate intel_crtc_dotclock()
      drm/i915: Shuffle some PLL code around
      drm/i915: Extract HAS_DOUBLE_BUFFERED_M_N()
      drm/i915/dsi: Extract {vlv,bxt}_get_pclk()
      drm/i915: Do .crtc_compute_clock() earlier
      drm/i915: Reassign DPLLs only for crtcs going throug .compute_config(=
)
      drm/i915: Feed the DPLL output freq back into crtc_state
      drm/i915: Compute clocks earlier
      drm/i915: Make M/N checks non-fuzzy
      drm/i915: Make all clock checks non-fuzzy
      drm/i915: Set active dpll early for icl+
      drm/i915: Nuke fastet state copy hacks
      drm/i915: Skip intel_modeset_pipe_config_late() if the pipe is not en=
abled
      drm/i915: Add intel_panel_highest_mode()
      drm/i915: Allow M/N change during fastset on bdw+
      drm/i915: Use a fixed N value always
      drm/i915: Round TMDS clock to nearest
      drm/i915: Split intel_read_wm_latency() into per-platform versions
      drm/i915: Extract skl_watermark.c
      drm/i915: Use REG_FIELD_GET() to extract skl+ wm latencies
      drm/i915/bios: Fix VBT ACPI DPMS bit polarity
      drm/i915/bios: Add the "Disable compression for the Display
Port/HDMI external display" bit
      drm/i915: Fix TV encoder clock computation
      drm/i915: Force DPLL calculation for TC ports after readout

Vinay Belgaumkar (1):
      drm/i915/guc/slpc: Allow SLPC to use efficient frequency

Vitaly Lubart (3):
      drm/i915/gsc: skip irq initialization if using polling
      mei: bus: export common mkhi definitions into a separate header
      mei: gsc: add transition to PXP mode in resume flow

Vivek Kasireddy (1):
      udmabuf: Set ubuf->sg =3D NULL if the creation of sg table fails

Vladimir Stempen (1):
      drm/amd/display: Fix black flash when switching from ODM2to1 to ODMBy=
pass

Wang Fudong (1):
      drm/amd/display: set dig fifo read start level to 7 before dig fifo r=
eset

Wang Jingjin (1):
      drm/vc4: Add explicit declaration of 'drmm_of_get_bridge'

Wenjing Liu (5):
      drm/amd/display: rework recent update PHY state commit
      drm/amd/display: support proper mst payload removal when link is
not in mst mode in dc
      drm/amd/display: solve regression in update phy state refactor
      drm/amd/display: add missing null check
      drm/amd/display: polling vid stream status in hpo dp blank

Xin Ji (2):
      drm/bridge: anx7625: Support HDMI_I2S audio format
      drm/bridge: anx7625: Set HPD irq detect window to 2ms

Xu Panda (1):
      drm/amd/display/amdgpu_dm: remove duplicate included header files

XueBing Chen (1):
      dma-buf/sync_file: use strscpy to replace strlcpy

Yang Li (14):
      drm/amd/display: remove unneeded semicolon
      drm/amd/display: clean up one inconsistent indenting
      drm/amd/display: clean up some inconsistent indentings
      drm/amd/display: clean up some inconsistent indentings
      drm/amd/display: clean up some inconsistent indentings
      drm/amd/display: clean up some inconsistent indentings
      drm/amd/display: Simplify bool conversion
      drm/amd/display: remove possible condition with no effect (if =3D=3D =
else)
      drm/amd/display: clean up some inconsistent indentings
      drm/amd/display: clean up some inconsistent indentings
      drm/amd/display: clean up some inconsistent indentings
      drm/amd/display: clean up some inconsistent indentings
      drm/amd/display: clean up some inconsistent indentings
      drm/amd/display: clean up some inconsistent indentings

Yang Wang (4):
      drm/amd/pm: add smu_v13_0_10 support
      drm/amd/pm: add smu_v13_0_10 driver if version
      drm/amdgpu: add gfxhub_v3_0_3 support
      drm/amdgpu: change the alignment size of TMR BO to 1M

Yang Yingliang (2):
      drm/amdgpu: add missing pci_disable_device() in
amdgpu_pmops_runtime_resume()
      drm/mediatek: dp: change mtk_dp_driver to static

Yao Wang1 (1):
      drm/amd/display: Limit user regamma to a valid value

YiPeng Chai (7):
      drm/amdgpu: Move psp_xgmi_terminate call from
amdgpu_xgmi_remove_device to psp_hw_fini
      drm/amdgpu: fix hive reference leak when adding xgmi device
      drm/amdgpu: TA unload messages are not actually sent to psp when
amdgpu is uninstalled
      drm/amdgpu: Adjust removal control flow for smu v13_0_2
      drm/amdgpu: Fixed psp fence and memory issues when removing amdgpu de=
vice
      drm/amd/pm: Remove redundant check condition
      drm/amdgpu: Fixed ras warning when uninstalling amdgpu

Yifan Zha (8):
      drm/amdgpu: Use PSP program IH_RB_CNTL registers under SRIOV
      drm/amdgpu: Skip the program of MMMC_VM_AGP_* in SRIOV on MMHUB v3_0_=
0
      drm/amdgpu: skip "Issue additional private vm invalidation to
MMHUB" on SRIOV
      drm/amdgpu: Skip the VRAM base offset on SRIOV
      drm/amdgpu: Skip program SDMA0_SEM_WAIT_FAIL_TIMER_CNTL under SRIOV V=
F
      drm/amdgpu: Use RLCG to program GRBM_GFX_CNTL during full access time
      drm/admgpu: Skip CG/PG on SOC21 under SRIOV VF
      drm/amd: Skip smu_v13 register irq on SRIOV VF

Yifan Zhang (4):
      drm/amdgpu/mes: zero the sdma_hqd_mask of 2nd SDMA engine for SDMA 6.=
0.1
      drm/amdkfd: print address in hex format rather than decimal
      drm/amdgpu: correct doorbell range/size value for CSDMA_DOORBELL_RANG=
E
      drm/amdgpu: add MES and MES-KIQ version in debugfs

Yihao Han (1):
      drm/amd/display: fix boolconv.cocci warning

Yu Zhe (1):
      drm/radeon: use time_after(a,b) to replace "a>b"

YuBiao Wang (1):
      drm/amdgpu: Fix use-after-free in amdgpu_cs_ioctl

Yuan Can (2):
      drm/panel: panel-edp: Use dev_err_probe() to simplify code
      drm/panel: simple: Use dev_err_probe() to simplify code

Yury Zhuravlev (1):
      drm/amdgpu: getting fan speed pwm for vega10 properly

Zack Rusin (2):
      drm/vmwgfx: Remove unused hugepage support
      drm: Remove the drm_get_unmapped_area() helper

Zeng Jingxiang (1):
      gpu: lontium-lt9611: Fix NULL pointer dereference in
lt9611_connector_init()

Zhanjun Dong (1):
      drm/i915/guc: Check for ct enabled while waiting for response

Zhenneng Li (1):
      drm/radeon: add a force flush to delay work when radeon

Zheyu Ma (1):
      drm/bridge: megachips: Fix a null pointer dereference bug

Zongmin Zhou (2):
      drm/qxl: fix the suspend/resume issue on qxl device
      drm/qxl: drop set_prod_notify parameter from qxl_ring_create

allen chen (3):
      drm/bridge: it6505: Modified power sequence
      drm/bridge: it6505: Add i2c api power on check
      drm/bridge: it6505: Modified video clock calculation and video
debug message

hongao (2):
      drm/amdgpu: fix initial connector audio value
      drm/exynos: replace drm_detect_hdmi_monitor() with
drm_display_info.is_hdmi

min tang (2):
      drm/amd/display: Fix comment typo
      drm/amd/display: Unneeded semicolon

muansari (1):
      drm/amd/display: Modify DML to adjust Vstartup Position

pengfuyuan (1):
      drm/arm: Fix spelling typo in comments

ruanjinjie (1):
      drm/ast: make ast_modeset static

shaomin Deng (3):
      drm/mgag200:remove rebundant word "or" in comments
      drm:delete the repeated word "the" in comments
      drm:remove rebundant word "in" in comments

shaoyunl (3):
      drm/amdgpu: use sjt mec fw on aldebaran for sriov
      drm/amdgpu: Remove the additional kfd pre reset call for sriov
      drm/amdgpu: Use per device reset_domain for XGMI on sriov configurati=
on

sunliming (2):
      drm/amd/display: Fix variable dereferenced before check
      drm/msm/dsi: fix the inconsistent indenting

wangjianli (3):
      subdev/clk: fix repeated words in comments
      drm/rockchip: vop: fix repeated words in comment
      amd/amdkfd: fix repeated words in comments

ye xingchen (9):
      drm/mediatek: Remove the unneeded result
      drm/amdgpu: Remove the unneeded result variable
      drm/amdgpu: Remove the unneeded result variable 'r'
      drm/omap: dmm_tiler:Remove the print function dev_err()
      drm/radeon/ci_dpm: Remove the unneeded result variable
      drm/radeon: Remove the unneeded result variable
      drm/msm/dsi: Remove the unneeded result variable
      drm/amd/pm: Remove the unneeded result variable
      drm/amd/pm: Remove unneeded result variable

zhang songyi (2):
      drm/amd/display: Remove the unneeded result variable
      drm/amdgpu: Remove the unneeded result variable

zhikzhai (1):
      drm/amd/display: skip audio setup when audio stream is enabled

=C5=81ukasz Bartosik (1):
      drm/i915: fix null pointer dereference

 .../bindings/display/bridge/chipone,icn6211.yaml   |     9 +
 .../bindings/display/bridge/renesas,dw-hdmi.yaml   |     5 +
 .../devicetree/bindings/display/ingenic,lcd.yaml   |     2 +
 .../bindings/display/mediatek/mediatek,dp.yaml     |   116 +
 .../bindings/display/msm/dp-controller.yaml        |    47 +-
 .../bindings/display/msm/dpu-msm8998.yaml          |     4 +
 .../bindings/display/msm/dpu-qcm2290.yaml          |     3 +
 .../bindings/display/msm/dpu-sc7180.yaml           |     3 +
 .../bindings/display/msm/dpu-sc7280.yaml           |     3 +
 .../bindings/display/msm/dpu-sdm845.yaml           |     4 +
 .../devicetree/bindings/display/msm/gmu.yaml       |   166 +-
 .../devicetree/bindings/display/msm/gpu.yaml       |     3 +-
 .../devicetree/bindings/display/msm/mdp4.yaml      |     2 +-
 .../bindings/display/panel/panel-simple.yaml       |     4 +
 .../bindings/display/panel/sitronix,st7701.yaml    |     4 +
 .../display/rockchip/dw_mipi_dsi_rockchip.txt      |     1 +
 .../devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml |    15 +-
 Documentation/gpu/amdgpu/apu-asic-info-table.csv   |     8 +
 Documentation/gpu/amdgpu/dgpu-asic-info-table.csv  |    24 +
 Documentation/gpu/amdgpu/display/dc-glossary.rst   |     2 +-
 Documentation/gpu/amdgpu/display/dcn-overview.rst  |    59 +
 .../gpu/amdgpu/display/dcn2_cm_drm_current.svg     |  1370 +
 .../gpu/amdgpu/display/dcn3_cm_drm_current.svg     |  1529 +
 .../gpu/amdgpu/display/display-manager.rst         |   141 +
 Documentation/gpu/amdgpu/display/index.rst         |     1 +
 Documentation/gpu/amdgpu/display/mpo-cursor.svg    |   435 +
 Documentation/gpu/amdgpu/display/mpo-overview.rst  |   242 +
 .../multi-display-hdcp-mpo-less-pipe-ex.svg        |   220 +
 .../gpu/amdgpu/display/multi-display-hdcp-mpo.svg  |   171 +
 .../gpu/amdgpu/display/pipeline_4k_no_split.svg    |   958 +
 .../gpu/amdgpu/display/pipeline_4k_split.svg       |  1062 +
 .../display/single-display-mpo-multi-video.svg     |   339 +
 .../gpu/amdgpu/display/single-display-mpo.svg      |   266 +
 Documentation/gpu/amdgpu/driver-misc.rst           |    17 +
 Documentation/gpu/amdgpu/thermal.rst               |    18 +-
 Documentation/gpu/drm-kms-helpers.rst              |     8 +-
 Documentation/gpu/drm-kms.rst                      |     2 +
 Documentation/gpu/drm-mm.rst                       |    16 +-
 Documentation/gpu/todo.rst                         |   104 +-
 Documentation/gpu/vkms.rst                         |     7 +-
 MAINTAINERS                                        |     6 +
 drivers/acpi/Kconfig                               |     1 +
 drivers/acpi/acpi_video.c                          |    64 +-
 drivers/acpi/video_detect.c                        |   428 +-
 drivers/dma-buf/dma-fence.c                        |    22 +-
 drivers/dma-buf/st-dma-fence-chain.c               |     4 +
 drivers/dma-buf/st-dma-fence-unwrap.c              |    22 +
 drivers/dma-buf/st-dma-fence.c                     |    16 +
 drivers/dma-buf/st-dma-resv.c                      |    10 +
 drivers/dma-buf/sync_file.c                        |     8 +-
 drivers/dma-buf/udmabuf.c                          |     9 +-
 drivers/firmware/sysfb.c                           |     4 +
 drivers/gpu/drm/Kconfig                            |    39 +-
 drivers/gpu/drm/Makefile                           |     7 +-
 drivers/gpu/drm/amd/amdgpu/Makefile                |     7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |     9 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |    21 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |    10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |    32 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c     |     7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |  1742 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h             |    10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |     6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h            |     1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |   170 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   164 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |    19 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |    13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |    43 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |     1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c     |     9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   181 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |    20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfxhub.h         |     3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |    48 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |    26 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c        |    38 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |    55 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h            |    10 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |    50 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |     3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |     2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h           |     1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |     4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |    66 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |     7 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |    38 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |    10 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c          |    21 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h          |     5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |     3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.c            |   272 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.h            |     4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           |   133 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h           |     4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c           |     4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h          |    12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |    48 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |   168 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |     6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |     6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |    19 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |    57 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |     5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |     4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   100 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |     9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c          |    44 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c        |    12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |    68 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |    26 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h           |     1 +
 drivers/gpu/drm/amd/amdgpu/atombios_encoders.c     |    14 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   281 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   396 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |   223 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c           |   108 +
 drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0_3.c         |   511 +
 drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0_3.h         |    29 +
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |    19 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |     7 +-
 drivers/gpu/drm/amd/amdgpu/ih_v6_0.c               |    26 +-
 drivers/gpu/drm/amd/amdgpu/imu_v11_0.c             |     6 +
 drivers/gpu/drm/amd/amdgpu/imu_v11_0_3.c           |   145 +
 drivers/gpu/drm/amd/amdgpu/imu_v11_0_3.h           |    29 +
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |    11 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c            |     1 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0.c            |    10 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c            |    12 +-
 drivers/gpu/drm/amd/amdgpu/mmsch_v4_0.h            |   140 +
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c              |     1 +
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |     1 +
 drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c              |     1 +
 drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c             |     9 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v4_3.c             |    44 +
 drivers/gpu/drm/amd/amdgpu/nbio_v4_3.h             |     1 +
 drivers/gpu/drm/amd/amdgpu/nbio_v6_1.c             |     9 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c             |     9 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_7.c             |    93 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |     9 +
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |   115 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |    49 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |    74 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |    87 +-
 drivers/gpu/drm/amd/amdgpu/sienna_cichlid.c        |   303 +
 .../inc/dml_wrapper.h =3D> amdgpu/sienna_cichlid.h}  |    14 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |    25 -
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |    43 +-
 drivers/gpu/drm/amd/amdgpu/umc_v6_7.c              |    58 +-
 drivers/gpu/drm/amd/amdgpu/umc_v8_10.c             |    12 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |    17 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |   343 +-
 drivers/gpu/drm/amd/amdgpu/vega10_ih.c             |     4 +
 drivers/gpu/drm/amd/amdgpu/vega20_ih.c             |     4 +
 drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h     |   771 +-
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx10.asm |    21 +
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |    54 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |     3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |    14 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |    47 +-
 drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c          |    12 +
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c   |     6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |    57 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c   |    89 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |     5 -
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |     7 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |    82 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h               |     3 +-
 drivers/gpu/drm/amd/display/Kconfig                |     2 -
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   171 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |    47 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c    |   109 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |     1 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |   181 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |   209 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |     7 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h    |     8 -
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |     8 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |   103 +-
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   |    57 +-
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c |    75 +-
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |    84 +-
 .../amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c |    11 +-
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |    14 +
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   203 +-
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |    38 +
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |   130 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c  |    18 +
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |   439 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dpia.c |    33 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |    42 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |     5 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |   141 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |   164 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |     2 +
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |   148 +-
 drivers/gpu/drm/amd/display/dc/dc_link.h           |    30 +-
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |     8 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_audio.c     |     2 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_aux.c       |    12 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |     7 +-
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |   156 +-
 .../amd/display/dc/dce110/dce110_hw_sequencer.h    |    20 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.c   |     5 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c  |     9 +-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |   153 +-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.h  |     3 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_init.c  |     4 +
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c  |    47 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.h  |     2 +
 .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  |    18 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dccg.h  |     1 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.h   |   220 -
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c  |     9 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |    38 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_init.c  |     4 +
 .../gpu/drm/amd/display/dc/dcn20/dcn20_mmhubbub.c  |     3 +-
 .../gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c   |     3 +-
 .../gpu/drm/amd/display/dc/dcn201/dcn201_init.c    |     4 +
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c  |     4 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |    21 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_init.c  |     4 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_mmhubbub.h  |     8 -
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |     7 +-
 .../gpu/drm/amd/display/dc/dcn301/dcn301_init.c    |     4 +
 .../drm/amd/display/dc/dcn301/dcn301_resource.c    |     5 +-
 .../drm/amd/display/dc/dcn302/dcn302_resource.c    |     3 +-
 .../drm/amd/display/dc/dcn303/dcn303_resource.c    |     1 +
 .../amd/display/dc/dcn31/dcn31_dio_link_encoder.c  |     3 +
 .../display/dc/dcn31/dcn31_hpo_dp_stream_encoder.c |     6 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.c    |     2 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.h    |     2 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c |     2 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c  |     4 +
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |     3 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c    |    53 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_dccg.h    |    70 +-
 .../display/dc/dcn314/dcn314_dio_stream_encoder.c  |    29 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c   |    19 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.h   |     2 -
 .../gpu/drm/amd/display/dc/dcn314/dcn314_init.c    |     5 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_optc.c    |     5 +-
 .../drm/amd/display/dc/dcn314/dcn314_resource.c    |    18 +-
 .../drm/amd/display/dc/dcn315/dcn315_resource.c    |     1 -
 .../drm/amd/display/dc/dcn316/dcn316_resource.c    |     1 -
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c  |    69 +-
 .../amd/display/dc/dcn32/dcn32_dio_link_encoder.c  |     4 +-
 .../display/dc/dcn32/dcn32_dio_stream_encoder.c    |     7 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dpp.c   |     2 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.c    |    24 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.h    |    29 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubp.c  |    24 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c |   417 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.h |    16 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c  |     7 +
 .../gpu/drm/amd/display/dc/dcn32/dcn32_mmhubbub.c  |     2 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_mmhubbub.h  |    10 -
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.c   |     6 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.c  |     6 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  |   776 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.h  |  1172 +-
 .../amd/display/dc/dcn32/dcn32_resource_helpers.c  |   217 +-
 .../drm/amd/display/dc/dcn321/dcn321_resource.c    |   682 +-
 drivers/gpu/drm/amd/display/dc/dm_helpers.h        |    12 +-
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |     3 +
 .../gpu/drm/amd/display/dc/dml/calcs/bw_fixed.c    |    14 +-
 .../drm/amd/display/dc/dml/calcs/dcn_calc_auto.c   |    22 +-
 .../drm/amd/display/dc/dml/calcs/dcn_calc_math.c   |    16 +-
 .../gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c   |    32 +-
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |    34 +-
 .../display/dc/dml/dcn20/display_mode_vba_20v2.c   |    10 +-
 .../amd/display/dc/dml/dcn21/display_mode_vba_21.c |     8 +-
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |   305 +-
 .../gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c |    45 +-
 .../gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c   |   101 +-
 .../amd/display/dc/dml/dcn31/display_mode_vba_31.c |   430 +-
 .../gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c |    12 +-
 .../display/dc/dml/dcn314/display_mode_vba_314.c   |   443 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |   290 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.h   |    18 +-
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.c |   272 +-
 .../dc/dml/dcn32/display_mode_vba_util_32.c        |   395 +-
 .../dc/dml/dcn32/display_mode_vba_util_32.h        |    53 +-
 .../gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c |    14 +-
 .../gpu/drm/amd/display/dc/dml/display_mode_lib.c  |    12 +
 .../gpu/drm/amd/display/dc/dml/display_mode_lib.h  |     1 +
 .../drm/amd/display/dc/dml/display_mode_structs.h  |    37 +-
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.c  |     1 +
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.h  |    11 +-
 .../gpu/drm/amd/display/dc/dml/dml_inline_defs.h   |     9 +-
 drivers/gpu/drm/amd/display/dc/dml/dml_wrapper.c   |  1884 -
 .../amd/display/dc/dml/dml_wrapper_translation.c   |   284 -
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |     4 +
 drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h    |     5 +
 drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h    |     1 +
 .../drm/amd/display/dc/inc/hw/clk_mgr_internal.h   |     2 +
 drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h  |    14 +
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h        |    91 +-
 .../drm/amd/display/dc/inc/hw/timing_generator.h   |    14 +-
 drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h  |    38 +-
 .../drm/amd/display/dc/inc/hw_sequencer_private.h  |     2 +
 drivers/gpu/drm/amd/display/dc/inc/link_hwss.h     |     6 +-
 drivers/gpu/drm/amd/display/dc/inc/resource.h      |     6 +
 .../gpu/drm/amd/display/dc/link/link_hwss_dio.c    |     4 +-
 .../gpu/drm/amd/display/dc/link/link_hwss_dio.h    |     2 +-
 .../gpu/drm/amd/display/dc/link/link_hwss_dpia.c   |     2 +-
 .../gpu/drm/amd/display/dc/link/link_hwss_hpo_dp.c |     6 +-
 .../drm/amd/display/dc/virtual/virtual_link_hwss.c |     8 +
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |     1 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |    69 +-
 drivers/gpu/drm/amd/display/include/dal_asic_id.h  |     1 +
 .../drm/amd/display/include/ddc_service_types.h    |     4 +-
 .../drm/amd/display/include/link_service_types.h   |    15 +-
 .../drm/amd/display/modules/color/color_gamma.c    |     4 +
 .../drm/amd/include/asic_reg/gc/gc_10_3_0_offset.h |   108 +
 .../amd/include/asic_reg/gc/gc_10_3_0_sh_mask.h    |  1469 +-
 .../drm/amd/include/asic_reg/gc/gc_11_0_3_offset.h | 12086 +++++
 .../amd/include/asic_reg/gc/gc_11_0_3_sh_mask.h    | 44640 +++++++++++++++=
++++
 .../include/asic_reg/mmhub/mmhub_9_4_1_offset.h    |     4 +
 .../include/asic_reg/mmhub/mmhub_9_4_1_sh_mask.h   |     8 +
 .../amd/include/asic_reg/nbio/nbio_7_7_0_offset.h  |     2 +
 .../amd/include/asic_reg/nbio/nbio_7_7_0_sh_mask.h |    13 +
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |    58 +
 drivers/gpu/drm/amd/include/mes_v11_api_def.h      |     4 +-
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |    45 +
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |     3 -
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |     3 +
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |     5 +-
 .../drm/amd/pm/powerplay/hwmgr/vega10_thermal.c    |    25 +-
 .../pm/powerplay/hwmgr/vega12_processpptables.c    |     5 +-
 .../gpu/drm/amd/pm/powerplay/inc/hardwaremanager.h |     2 -
 .../drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c |     4 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |    34 +
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |    22 +
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h |    31 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v11_0_7_ppsmc.h   |     4 +-
 .../drm/amd/pm/swsmu/inc/pmfw_if/smu_v11_5_ppsmc.h |     5 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |     6 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |     9 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |    65 +
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |   236 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |    72 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   130 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |    36 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |     3 +
 drivers/gpu/drm/amd/pm/swsmu/smu_internal.h        |     3 +
 drivers/gpu/drm/arm/Kconfig                        |     4 +-
 drivers/gpu/drm/arm/display/Kconfig                |     2 +-
 drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c   |     3 +-
 drivers/gpu/drm/arm/display/komeda/komeda_crtc.c   |     5 +-
 drivers/gpu/drm/arm/display/komeda/komeda_drv.c    |     2 +
 .../drm/arm/display/komeda/komeda_framebuffer.c    |    12 +-
 drivers/gpu/drm/arm/display/komeda/komeda_kms.c    |    31 +-
 drivers/gpu/drm/arm/display/komeda/komeda_kms.h    |     2 +
 .../drm/arm/display/komeda/komeda_pipeline_state.c |     2 +-
 drivers/gpu/drm/arm/display/komeda/komeda_plane.c  |     1 -
 drivers/gpu/drm/arm/hdlcd_crtc.c                   |    11 +-
 drivers/gpu/drm/arm/hdlcd_drv.c                    |    77 +-
 drivers/gpu/drm/arm/malidp_drv.c                   |     9 +-
 drivers/gpu/drm/arm/malidp_mw.c                    |     8 +-
 drivers/gpu/drm/arm/malidp_planes.c                |    35 +-
 drivers/gpu/drm/arm/malidp_regs.h                  |     2 +-
 drivers/gpu/drm/armada/armada_crtc.c               |     1 -
 drivers/gpu/drm/armada/armada_gem.c                |     6 +-
 drivers/gpu/drm/armada/armada_overlay.c            |     8 +-
 drivers/gpu/drm/armada/armada_plane.c              |     2 +-
 drivers/gpu/drm/aspeed/Kconfig                     |     2 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c           |    10 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c            |     7 +-
 drivers/gpu/drm/ast/ast_drv.c                      |     2 +-
 drivers/gpu/drm/ast/ast_mode.c                     |    28 +-
 drivers/gpu/drm/ast/ast_tables.h                   |     7 +
 drivers/gpu/drm/atmel-hlcdc/Kconfig                |     2 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c       |     6 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c    |     9 +-
 drivers/gpu/drm/bridge/adv7511/adv7511.h           |     5 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_cec.c       |     4 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |     5 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |    38 +-
 drivers/gpu/drm/bridge/analogix/anx7625.h          |     6 +
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |     3 +-
 drivers/gpu/drm/bridge/chipone-icn6211.c           |    48 +-
 drivers/gpu/drm/bridge/ite-it6505.c                |    27 +-
 drivers/gpu/drm/bridge/lontium-lt8912b.c           |    39 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            |     3 +-
 .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   |     4 +-
 drivers/gpu/drm/bridge/panel.c                     |    74 +
 drivers/gpu/drm/bridge/parade-ps8640.c             |     9 +-
 .../gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c    |     6 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |    13 +-
 drivers/gpu/drm/bridge/tc358762.c                  |     4 +-
 drivers/gpu/drm/bridge/tc358764.c                  |     4 +-
 drivers/gpu/drm/bridge/tc358767.c                  |    90 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |   119 +-
 drivers/gpu/drm/display/drm_dp_helper.c            |    43 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c      |  1149 +-
 drivers/gpu/drm/display/drm_scdc_helper.c          |    13 +
 drivers/gpu/drm/drm_aperture.c                     |    10 +-
 drivers/gpu/drm/drm_atomic_helper.c                |    84 +-
 drivers/gpu/drm/drm_auth.c                         |     4 +-
 drivers/gpu/drm/drm_bridge.c                       |     4 +-
 drivers/gpu/drm/drm_client.c                       |     4 +-
 drivers/gpu/drm/drm_color_mgmt.c                   |     2 +-
 drivers/gpu/drm/drm_connector.c                    |   135 +-
 drivers/gpu/drm/drm_crtc.c                         |    94 +-
 drivers/gpu/drm/drm_crtc_helper.c                  |     1 -
 drivers/gpu/drm/drm_damage_helper.c                |    11 +-
 drivers/gpu/drm/drm_edid.c                         |    52 +-
 drivers/gpu/drm/drm_encoder.c                      |    75 +-
 .../{drm_fb_cma_helper.c =3D> drm_fb_dma_helper.c}   |    67 +-
 drivers/gpu/drm/drm_fb_helper.c                    |   101 +-
 drivers/gpu/drm/drm_file.c                         |   143 +-
 drivers/gpu/drm/drm_format_helper.c                |   702 +-
 drivers/gpu/drm/drm_fourcc.c                       |    55 +-
 drivers/gpu/drm/drm_framebuffer.c                  |    70 +-
 drivers/gpu/drm/drm_gem.c                          |   170 +
 .../{drm_gem_cma_helper.c =3D> drm_gem_dma_helper.c} |   302 +-
 drivers/gpu/drm/drm_gem_framebuffer_helper.c       |    12 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c             |     2 +-
 drivers/gpu/drm/drm_gem_vram_helper.c              |     6 +-
 drivers/gpu/drm/drm_ioctl.c                        |     8 +-
 drivers/gpu/drm/drm_mipi_dbi.c                     |    49 +-
 drivers/gpu/drm/drm_mipi_dsi.c                     |     5 +-
 drivers/gpu/drm/drm_mode_config.c                  |     7 +-
 drivers/gpu/drm/drm_modeset_helper.c               |    66 +-
 drivers/gpu/drm/drm_panel_orientation_quirks.c     |    18 +
 drivers/gpu/drm/drm_plane.c                        |    70 +-
 drivers/gpu/drm/drm_plane_helper.c                 |   114 +-
 drivers/gpu/drm/drm_probe_helper.c                 |    64 +
 drivers/gpu/drm/drm_simple_kms_helper.c            |     5 +-
 drivers/gpu/drm/exynos/exynos_drm_plane.c          |     1 -
 drivers/gpu/drm/exynos/exynos_hdmi.c               |     6 +-
 drivers/gpu/drm/exynos/exynos_mixer.c              |     2 +-
 drivers/gpu/drm/fsl-dcu/Kconfig                    |     2 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c          |     7 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_kms.c          |     1 -
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c        |    18 +-
 drivers/gpu/drm/gma500/Kconfig                     |     2 +
 drivers/gpu/drm/gma500/backlight.c                 |   102 +-
 drivers/gpu/drm/gma500/cdv_device.c                |    54 +-
 drivers/gpu/drm/gma500/cdv_intel_dp.c              |     2 +-
 drivers/gpu/drm/gma500/gma_display.c               |    19 +-
 drivers/gpu/drm/gma500/gma_display.h               |     2 -
 drivers/gpu/drm/gma500/oaktrail_crtc.c             |     2 +-
 drivers/gpu/drm/gma500/oaktrail_device.c           |    70 +-
 drivers/gpu/drm/gma500/oaktrail_lvds.c             |     1 -
 drivers/gpu/drm/gma500/opregion.c                  |     6 +-
 drivers/gpu/drm/gma500/power.c                     |   166 +-
 drivers/gpu/drm/gma500/power.h                     |    18 -
 drivers/gpu/drm/gma500/psb_device.c                |    73 +-
 drivers/gpu/drm/gma500/psb_drv.c                   |    52 +-
 drivers/gpu/drm/gma500/psb_drv.h                   |    25 +-
 drivers/gpu/drm/gma500/psb_intel_display.c         |     2 -
 drivers/gpu/drm/gma500/psb_intel_drv.h             |     5 -
 drivers/gpu/drm/gma500/psb_intel_sdvo.c            |    62 +-
 drivers/gpu/drm/gma500/psb_irq.c                   |    30 +-
 drivers/gpu/drm/gma500/psb_irq.h                   |     2 +-
 drivers/gpu/drm/gud/gud_pipe.c                     |    34 +-
 drivers/gpu/drm/hisilicon/kirin/Kconfig            |     2 +-
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c    |    15 +-
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c    |     3 +-
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c        |     9 +-
 drivers/gpu/drm/i915/Kconfig                       |     2 +
 drivers/gpu/drm/i915/Makefile                      |     4 +-
 drivers/gpu/drm/i915/display/g4x_dp.c              |     4 +-
 drivers/gpu/drm/i915/display/hsw_ips.c             |     2 +-
 drivers/gpu/drm/i915/display/i9xx_plane.c          |     7 +-
 drivers/gpu/drm/i915/display/icl_dsi.c             |    22 +-
 drivers/gpu/drm/i915/display/intel_acpi.c          |    27 +
 drivers/gpu/drm/i915/display/intel_acpi.h          |     3 +
 drivers/gpu/drm/i915/display/intel_atomic.c        |     9 +-
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |     3 +-
 drivers/gpu/drm/i915/display/intel_audio.c         |   102 +-
 drivers/gpu/drm/i915/display/intel_backlight.c     |    84 +-
 .../gpu/drm/i915/display/intel_backlight_regs.h    |   124 +
 drivers/gpu/drm/i915/display/intel_bios.c          |   392 +-
 drivers/gpu/drm/i915/display/intel_bios.h          |     1 +
 drivers/gpu/drm/i915/display/intel_bw.c            |   152 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |   293 +-
 drivers/gpu/drm/i915/display/intel_cdclk.h         |     4 +-
 drivers/gpu/drm/i915/display/intel_color.c         |    35 +-
 drivers/gpu/drm/i915/display/intel_connector.c     |     8 +-
 drivers/gpu/drm/i915/display/intel_crt.c           |    13 +-
 drivers/gpu/drm/i915/display/intel_crtc.c          |     1 -
 .../gpu/drm/i915/display/intel_crtc_state_dump.c   |     9 +-
 drivers/gpu/drm/i915/display/intel_cursor.c        |     7 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |    89 +-
 drivers/gpu/drm/i915/display/intel_display.c       |   383 +-
 drivers/gpu/drm/i915/display/intel_display.h       |     8 +-
 drivers/gpu/drm/i915/display/intel_display_core.h  |   418 +
 .../gpu/drm/i915/display/intel_display_debugfs.c   |   147 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |   153 +-
 .../gpu/drm/i915/display/intel_display_power_map.c |   119 +-
 .../drm/i915/display/intel_display_power_well.c    |   129 +-
 .../drm/i915/display/intel_display_power_well.h    |    16 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |     5 +-
 drivers/gpu/drm/i915/display/intel_dmc.c           |   142 +-
 drivers/gpu/drm/i915/display/intel_dmc.h           |     1 +
 drivers/gpu/drm/i915/display/intel_dmc_regs.h      |     2 +
 drivers/gpu/drm/i915/display/intel_dp.c            |   156 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.c        |    57 +-
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c  |    15 +-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c       |     1 +
 .../gpu/drm/i915/display/intel_dp_link_training.c  |   105 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |   105 +-
 drivers/gpu/drm/i915/display/intel_dpio_phy.c      |     2 +-
 drivers/gpu/drm/i915/display/intel_dpll.c          |   111 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |   326 +-
 drivers/gpu/drm/i915/display/intel_dsb.c           |    30 +
 drivers/gpu/drm/i915/display/intel_dsb.h           |    28 -
 drivers/gpu/drm/i915/display/intel_dsi.c           |     2 +-
 drivers/gpu/drm/i915/display/intel_dsi.h           |     3 -
 .../gpu/drm/i915/display/intel_dsi_dcs_backlight.c |    14 +-
 drivers/gpu/drm/i915/display/intel_dvo_dev.h       |     4 +-
 drivers/gpu/drm/i915/display/intel_fb.c            |    18 +-
 drivers/gpu/drm/i915/display/intel_fb_pin.c        |     4 +-
 drivers/gpu/drm/i915/display/intel_fb_pin.h        |     4 +-
 drivers/gpu/drm/i915/display/intel_fbc.c           |    18 +-
 drivers/gpu/drm/i915/display/intel_fbc.h           |     1 +
 drivers/gpu/drm/i915/display/intel_fbdev.c         |    40 +-
 drivers/gpu/drm/i915/display/intel_fdi.c           |    20 +-
 drivers/gpu/drm/i915/display/intel_frontbuffer.c   |    56 +-
 drivers/gpu/drm/i915/display/intel_frontbuffer.h   |    18 +
 drivers/gpu/drm/i915/display/intel_gmbus.c         |   290 +-
 drivers/gpu/drm/i915/display/intel_gmbus.h         |     1 +
 drivers/gpu/drm/i915/display/intel_gmbus_regs.h    |    81 +
 drivers/gpu/drm/i915/display/intel_hdcp.c          |   163 +-
 drivers/gpu/drm/i915/display/intel_hdcp_regs.h     |   270 +
 drivers/gpu/drm/i915/display/intel_hdmi.c          |    12 +-
 drivers/gpu/drm/i915/display/intel_hotplug.c       |   116 +-
 drivers/gpu/drm/i915/display/intel_lpe_audio.c     |    47 +-
 drivers/gpu/drm/i915/display/intel_lvds.c          |     4 +-
 drivers/gpu/drm/i915/display/intel_modeset_setup.c |    15 +-
 .../gpu/drm/i915/display/intel_modeset_verify.c    |     8 +-
 drivers/gpu/drm/i915/display/intel_opregion.c      |    42 +-
 drivers/gpu/drm/i915/display/intel_overlay.c       |    16 +-
 drivers/gpu/drm/i915/display/intel_panel.c         |    45 +-
 drivers/gpu/drm/i915/display/intel_panel.h         |     3 +
 drivers/gpu/drm/i915/display/intel_pch_refclk.c    |    16 +-
 drivers/gpu/drm/i915/display/intel_pch_refclk.h    |     1 +
 drivers/gpu/drm/i915/display/intel_plane_initial.c |     2 +-
 drivers/gpu/drm/i915/display/intel_pps.c           |    51 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |    43 +-
 drivers/gpu/drm/i915/display/intel_quirks.c        |    25 +-
 drivers/gpu/drm/i915/display/intel_quirks.h        |    14 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c          |    18 +-
 drivers/gpu/drm/i915/display/intel_snps_phy.c      |  1116 +
 drivers/gpu/drm/i915/display/intel_sprite.c        |     9 +-
 drivers/gpu/drm/i915/display/intel_tc.c            |     4 +-
 drivers/gpu/drm/i915/display/intel_tv.c            |    23 +-
 drivers/gpu/drm/i915/display/intel_vbt_defs.h      |   346 +-
 drivers/gpu/drm/i915/display/intel_vdsc.c          |     5 +-
 drivers/gpu/drm/i915/display/intel_vrr.c           |    14 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.c |    11 +-
 drivers/gpu/drm/i915/display/skl_watermark.c       |  3562 ++
 drivers/gpu/drm/i915/display/skl_watermark.h       |    80 +
 drivers/gpu/drm/i915/display/vlv_dsi.c             |    30 +-
 drivers/gpu/drm/i915/display/vlv_dsi_pll.c         |   141 +-
 drivers/gpu/drm/i915/display/vlv_dsi_regs.h        |   188 +-
 drivers/gpu/drm/i915/gem/i915_gem_domain.c         |     4 +-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.h           |     2 -
 drivers/gpu/drm/i915/gem/i915_gem_mman.c           |    39 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.h           |     1 +
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |     5 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |     2 +-
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |     3 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c          |     4 +-
 drivers/gpu/drm/i915/gem/i915_gem_pm.c             |     2 +-
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c          |     6 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |    62 +-
 drivers/gpu/drm/i915/gem/i915_gem_tiling.c         |     4 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |    86 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c         |     7 +-
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c    |    18 +-
 .../drm/i915/gem/selftests/i915_gem_client_blt.c   |     2 +-
 .../drm/i915/gem/selftests/i915_gem_coherency.c    |     2 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c   |     2 +-
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |    10 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_object.c   |     2 +-
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c               |    16 +-
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c           |    15 +-
 drivers/gpu/drm/i915/gt/gen8_engine_cs.h           |     3 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c               |    58 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |   158 +-
 drivers/gpu/drm/i915/gt/intel_engine_regs.h        |     1 +
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |    16 +-
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c       |     3 +-
 drivers/gpu/drm/i915/gt/intel_gsc.c                |   106 +-
 drivers/gpu/drm/i915/gt/intel_gsc.h                |     3 +
 drivers/gpu/drm/i915/gt/intel_gt.c                 |   114 +-
 drivers/gpu/drm/i915/gt/intel_gt.h                 |     4 +-
 drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c     |   174 +-
 drivers/gpu/drm/i915/gt/intel_gt_irq.c             |    35 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.h              |     8 +
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c      |     4 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm_irq.c          |     8 +-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h            |    23 +
 drivers/gpu/drm/i915/gt/intel_gt_sysfs.c           |    10 +-
 drivers/gpu/drm/i915/gt/intel_gt_sysfs.h           |     6 +
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c        |    34 +
 drivers/gpu/drm/i915/gt/intel_gt_types.h           |    45 +-
 drivers/gpu/drm/i915/gt/intel_gtt.c                |     3 +
 drivers/gpu/drm/i915/gt/intel_gtt.h                |     3 -
 drivers/gpu/drm/i915/gt/intel_llc.c                |    19 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c                |    50 +-
 drivers/gpu/drm/i915/gt/intel_migrate.c            |    81 +-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c              |     2 +-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c        |    17 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |     8 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |    88 +-
 drivers/gpu/drm/i915/gt/intel_rps.h                |     2 +
 drivers/gpu/drm/i915/gt/intel_sa_media.c           |    47 +
 drivers/gpu/drm/i915/gt/intel_sa_media.h           |    15 +
 drivers/gpu/drm/i915/gt/intel_sseu.c               |     5 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |    85 +-
 drivers/gpu/drm/i915/gt/selftest_execlists.c       |    16 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c       |    12 +-
 drivers/gpu/drm/i915/gt/selftest_lrc.c             |   115 +-
 drivers/gpu/drm/i915/gt/selftest_slpc.c            |     9 +
 .../drm/i915/gt/uc/abi/guc_communication_ctb_abi.h |     8 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |    94 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h             |     2 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c         |    10 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c     |   113 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.h     |     1 -
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c          |    45 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c         |   229 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.h         |    42 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h         |     4 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c        |    98 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |    69 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c              |    12 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           |   476 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h           |    39 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h       |     8 +-
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c          |    40 +-
 .../gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c    |   159 +
 .../gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c    |    10 +-
 drivers/gpu/drm/i915/gvt/cfg_space.c               |     5 +-
 drivers/gpu/drm/i915/gvt/edid.c                    |     3 +-
 drivers/gpu/drm/i915/gvt/handlers.c                |     4 +-
 drivers/gpu/drm/i915/i915_debugfs.c                |    63 +-
 drivers/gpu/drm/i915/i915_driver.c                 |   147 +-
 drivers/gpu/drm/i915/i915_drv.h                    |   531 +-
 drivers/gpu/drm/i915/i915_gem.c                    |    56 +-
 drivers/gpu/drm/i915/i915_gem.h                    |    43 +
 drivers/gpu/drm/i915/i915_getparam.c               |     2 +-
 drivers/gpu/drm/i915/i915_gpu_error.c              |    84 +-
 drivers/gpu/drm/i915/i915_gpu_error.h              |    21 +-
 drivers/gpu/drm/i915/i915_irq.c                    |   100 +-
 drivers/gpu/drm/i915/i915_pci.c                    |   308 +-
 drivers/gpu/drm/i915/i915_pci.h                    |     6 +
 drivers/gpu/drm/i915/i915_perf.c                   |     3 +-
 drivers/gpu/drm/i915/i915_reg.h                    |   557 +-
 drivers/gpu/drm/i915/i915_sw_fence.c               |     2 -
 drivers/gpu/drm/i915/i915_sw_fence.h               |     6 +-
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c      |    73 +
 drivers/gpu/drm/i915/i915_utils.h                  |     4 -
 drivers/gpu/drm/i915/i915_vma.c                    |    43 +-
 drivers/gpu/drm/i915/i915_vma.h                    |    18 +-
 drivers/gpu/drm/i915/i915_vma_resource.c           |     4 +
 drivers/gpu/drm/i915/i915_vma_types.h              |    42 +-
 drivers/gpu/drm/i915/intel_device_info.c           |    97 +-
 drivers/gpu/drm/i915/intel_device_info.h           |    97 +-
 drivers/gpu/drm/i915/intel_dram.c                  |    41 +-
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c        |     1 +
 drivers/gpu/drm/i915/intel_mchbar_regs.h           |     3 +
 drivers/gpu/drm/i915/intel_pch.c                   |     9 +-
 drivers/gpu/drm/i915/intel_pch.h                   |     4 +
 drivers/gpu/drm/i915/intel_pci_config.h            |     7 +
 drivers/gpu/drm/i915/intel_pm.c                    |  4062 +-
 drivers/gpu/drm/i915/intel_pm.h                    |    65 +-
 drivers/gpu/drm/i915/intel_uncore.c                |   112 +-
 drivers/gpu/drm/i915/intel_uncore.h                |    40 +-
 drivers/gpu/drm/i915/pxp/intel_pxp.c               |    19 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c       |     4 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_irq.c           |    14 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c       |     4 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c      |     4 +-
 .../gpu/drm/i915/selftests/i915_live_selftests.h   |     1 +
 drivers/gpu/drm/i915/selftests/i915_perf.c         |     2 +-
 drivers/gpu/drm/i915/selftests/i915_request.c      |     4 +-
 drivers/gpu/drm/i915/selftests/i915_vma.c          |    70 +-
 drivers/gpu/drm/i915/selftests/mock_gem_device.c   |     9 +-
 drivers/gpu/drm/imx/Kconfig                        |     2 +-
 drivers/gpu/drm/imx/dcss/Kconfig                   |     2 +-
 drivers/gpu/drm/imx/dcss/dcss-kms.c                |     6 +-
 drivers/gpu/drm/imx/dcss/dcss-plane.c              |    18 +-
 drivers/gpu/drm/imx/imx-drm-core.c                 |    10 +-
 drivers/gpu/drm/imx/imx-drm.h                      |     2 +-
 drivers/gpu/drm/imx/ipuv3-crtc.c                   |     3 +-
 drivers/gpu/drm/imx/ipuv3-plane.c                  |    33 +-
 drivers/gpu/drm/ingenic/Kconfig                    |     2 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |    58 +-
 drivers/gpu/drm/ingenic/ingenic-ipu.c              |    17 +-
 drivers/gpu/drm/kmb/Kconfig                        |     2 +-
 drivers/gpu/drm/kmb/kmb_drv.c                      |     6 +-
 drivers/gpu/drm/kmb/kmb_plane.c                    |    15 +-
 drivers/gpu/drm/logicvc/Kconfig                    |     4 +-
 drivers/gpu/drm/logicvc/logicvc_crtc.c             |     2 +-
 drivers/gpu/drm/logicvc/logicvc_drm.c              |    10 +-
 drivers/gpu/drm/logicvc/logicvc_interface.c        |     2 +-
 drivers/gpu/drm/logicvc/logicvc_layer.c            |    11 +-
 drivers/gpu/drm/logicvc/logicvc_mode.c             |     3 +-
 drivers/gpu/drm/mcde/Kconfig                       |     2 +-
 drivers/gpu/drm/mcde/mcde_display.c                |     8 +-
 drivers/gpu/drm/mcde/mcde_drv.c                    |    10 +-
 drivers/gpu/drm/mediatek/Kconfig                   |    11 +-
 drivers/gpu/drm/mediatek/Makefile                  |     2 +
 drivers/gpu/drm/mediatek/mtk_dp.c                  |  2663 ++
 drivers/gpu/drm/mediatek/mtk_dp_reg.h              |   350 +
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |     1 -
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |     1 -
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |     7 +-
 drivers/gpu/drm/mediatek/mtk_drm_gem.c             |     4 +-
 drivers/gpu/drm/mediatek/mtk_drm_plane.c           |     9 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |     1 -
 drivers/gpu/drm/meson/Kconfig                      |     2 +-
 drivers/gpu/drm/meson/meson_drv.c                  |    24 +-
 drivers/gpu/drm/meson/meson_drv.h                  |     7 +
 drivers/gpu/drm/meson/meson_encoder_cvbs.c         |    13 +
 drivers/gpu/drm/meson/meson_encoder_cvbs.h         |     1 +
 drivers/gpu/drm/meson/meson_encoder_hdmi.c         |    13 +
 drivers/gpu/drm/meson/meson_encoder_hdmi.h         |     1 +
 drivers/gpu/drm/meson/meson_overlay.c              |    19 +-
 drivers/gpu/drm/meson/meson_plane.c                |    13 +-
 drivers/gpu/drm/mgag200/Makefile                   |     4 +-
 drivers/gpu/drm/mgag200/mgag200_bmc.c              |    99 +
 drivers/gpu/drm/mgag200/mgag200_drv.c              |    21 +-
 drivers/gpu/drm/mgag200/mgag200_drv.h              |   208 +-
 drivers/gpu/drm/mgag200/mgag200_g200.c             |   254 +-
 drivers/gpu/drm/mgag200/mgag200_g200eh.c           |   277 +-
 drivers/gpu/drm/mgag200/mgag200_g200eh3.c          |   181 +-
 drivers/gpu/drm/mgag200/mgag200_g200er.c           |   315 +-
 drivers/gpu/drm/mgag200/mgag200_g200ev.c           |   316 +-
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c          |   192 +-
 drivers/gpu/drm/mgag200/mgag200_g200se.c           |   431 +-
 drivers/gpu/drm/mgag200/mgag200_g200wb.c           |   326 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c             |   726 +-
 drivers/gpu/drm/mgag200/mgag200_pll.c              |   997 -
 drivers/gpu/drm/mgag200/mgag200_reg.h              |     2 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |     2 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |     2 +-
 drivers/gpu/drm/msm/adreno/a6xx.xml.h              |     4 +
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |    83 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |    45 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |    50 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h           |     1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |    37 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |     2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |     9 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |     2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |    78 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |    35 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c         |    74 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h         |     4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |     6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |     3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |     4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |    27 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |    94 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h          |    22 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c           |    65 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |     9 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c                |     2 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |   150 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.h                   |     1 -
 drivers/gpu/drm/msm/dp/dp_link.c                   |     5 +-
 drivers/gpu/drm/msm/dsi/dsi.c                      |    37 +-
 drivers/gpu/drm/msm/dsi/dsi.h                      |    31 +-
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |   172 +-
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |     3 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |   299 +-
 drivers/gpu/drm/msm/dsi/dsi_manager.c              |   288 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   162 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |     5 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c         |   185 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |    87 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c         |    14 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c         |   145 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c    |   102 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |   188 +-
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c           |    25 +-
 drivers/gpu/drm/msm/msm_debugfs.c                  |     8 +
 drivers/gpu/drm/msm/msm_drv.c                      |    50 +-
 drivers/gpu/drm/msm/msm_drv.h                      |    89 +-
 drivers/gpu/drm/msm/msm_gem.c                      |   179 +-
 drivers/gpu/drm/msm/msm_gem.h                      |   123 +-
 drivers/gpu/drm/msm/msm_gem_prime.c                |     4 +-
 drivers/gpu/drm/msm/msm_gem_shrinker.c             |   164 +-
 drivers/gpu/drm/msm/msm_gem_submit.c               |    78 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |    24 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |    14 +-
 drivers/gpu/drm/msm/msm_gpu_devfreq.c              |     2 +
 drivers/gpu/drm/msm/msm_gpu_trace.h                |    36 +-
 drivers/gpu/drm/msm/msm_io_utils.c                 |    22 +
 drivers/gpu/drm/msm/msm_iommu.c                    |   101 +-
 drivers/gpu/drm/msm/msm_rd.c                       |     3 +
 drivers/gpu/drm/msm/msm_ringbuffer.c               |     4 -
 drivers/gpu/drm/msm/msm_submitqueue.c              |     1 +
 drivers/gpu/drm/mxsfb/Kconfig                      |     4 +-
 drivers/gpu/drm/mxsfb/lcdif_drv.c                  |    27 +-
 drivers/gpu/drm/mxsfb/lcdif_drv.h                  |     1 +
 drivers/gpu/drm/mxsfb/lcdif_kms.c                  |    25 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c                  |     6 +-
 drivers/gpu/drm/mxsfb/mxsfb_kms.c                  |    39 +-
 drivers/gpu/drm/nouveau/dispnv04/crtc.c            |    43 +-
 drivers/gpu/drm/nouveau/dispnv04/overlay.c         |    13 +-
 drivers/gpu/drm/nouveau/dispnv50/base507c.c        |     5 +-
 drivers/gpu/drm/nouveau/dispnv50/curs507a.c        |     5 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |   198 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.h            |     2 +
 drivers/gpu/drm/nouveau/dispnv50/ovly507e.c        |     5 +-
 drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c        |     5 +-
 drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c        |     1 -
 drivers/gpu/drm/nouveau/nouveau_acpi.c             |    10 +
 drivers/gpu/drm/nouveau/nouveau_acpi.h             |     4 +
 drivers/gpu/drm/nouveau/nouveau_backlight.c        |    13 +
 drivers/gpu/drm/nouveau/nouveau_bo.c               |    13 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c        |    21 +-
 drivers/gpu/drm/nouveau/nouveau_connector.h        |     3 +
 drivers/gpu/drm/nouveau/nouveau_hwmon.c            |    85 +-
 drivers/gpu/drm/nouveau/nouveau_mem.c              |    29 +
 drivers/gpu/drm/nouveau/nouveau_mem.h              |     6 +
 drivers/gpu/drm/nouveau/nouveau_prime.c            |     1 -
 drivers/gpu/drm/nouveau/nouveau_ttm.c              |    24 +
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/pmu.c     |     5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.c    |     2 +-
 drivers/gpu/drm/omapdrm/dss/dispc.c                |     2 +-
 drivers/gpu/drm/omapdrm/dss/dss.c                  |     3 +
 drivers/gpu/drm/omapdrm/omap_crtc.c                |     1 -
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c           |     4 +-
 drivers/gpu/drm/omapdrm/omap_overlay.c             |     1 -
 drivers/gpu/drm/omapdrm/omap_plane.c               |     1 -
 drivers/gpu/drm/panel/Kconfig                      |     4 +-
 .../gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c   |     4 +-
 drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c     |     4 +-
 drivers/gpu/drm/panel/panel-boe-himax8279d.c       |     4 +-
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c     |     4 +-
 drivers/gpu/drm/panel/panel-dsi-cm.c               |     4 +-
 drivers/gpu/drm/panel/panel-ebbg-ft8719.c          |     4 +-
 drivers/gpu/drm/panel/panel-edp.c                  |    42 +-
 drivers/gpu/drm/panel/panel-elida-kd35t133.c       |     4 +-
 drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c  |     4 +-
 .../gpu/drm/panel/panel-feiyang-fy07024di26a30d.c  |     4 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c       |     7 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c      |     4 +-
 drivers/gpu/drm/panel/panel-innolux-p079zca.c      |     4 +-
 drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c       |     4 +-
 drivers/gpu/drm/panel/panel-jdi-lt070me05000.c     |     4 +-
 drivers/gpu/drm/panel/panel-khadas-ts050.c         |     4 +-
 drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c |     4 +-
 drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c |     4 +-
 drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c |     4 +-
 drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c   |     4 +-
 drivers/gpu/drm/panel/panel-novatek-nt35510.c      |     9 +-
 drivers/gpu/drm/panel/panel-novatek-nt35560.c      |     4 +-
 drivers/gpu/drm/panel/panel-novatek-nt35950.c      |     4 +-
 drivers/gpu/drm/panel/panel-novatek-nt36672a.c     |     4 +-
 drivers/gpu/drm/panel/panel-orisetech-otm8009a.c   |     4 +-
 drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c |     4 +-
 .../gpu/drm/panel/panel-panasonic-vvx10f034n00.c   |     4 +-
 drivers/gpu/drm/panel/panel-raydium-rm67191.c      |     4 +-
 drivers/gpu/drm/panel/panel-raydium-rm68200.c      |     4 +-
 drivers/gpu/drm/panel/panel-ronbo-rb070d30.c       |     4 +-
 drivers/gpu/drm/panel/panel-samsung-s6d16d0.c      |     4 +-
 drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c      |     4 +-
 drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c   |     4 +-
 drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c  |     3 +-
 .../drm/panel/panel-samsung-s6e88a0-ams452ef01.c   |     4 +-
 drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c      |     4 +-
 drivers/gpu/drm/panel/panel-samsung-sofef00.c      |     4 +-
 drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c    |     6 +-
 drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c    |     4 +-
 drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c    |     4 +-
 drivers/gpu/drm/panel/panel-simple.c               |    88 +-
 drivers/gpu/drm/panel/panel-sitronix-st7701.c      |   547 +-
 drivers/gpu/drm/panel/panel-sitronix-st7703.c      |     4 +-
 .../gpu/drm/panel/panel-sony-tulip-truly-nt35521.c |     4 +-
 drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c       |     4 +-
 drivers/gpu/drm/panel/panel-truly-nt35597.c        |     3 +-
 drivers/gpu/drm/panel/panel-visionox-rm69299.c     |     3 +-
 drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c   |     4 +-
 drivers/gpu/drm/panfrost/Kconfig                   |     1 +
 drivers/gpu/drm/panfrost/Makefile                  |     3 +-
 drivers/gpu/drm/panfrost/panfrost_dump.c           |   249 +
 drivers/gpu/drm/panfrost/panfrost_dump.h           |    12 +
 drivers/gpu/drm/panfrost/panfrost_job.c            |     3 +
 drivers/gpu/drm/panfrost/panfrost_mmu.c            |    44 +-
 drivers/gpu/drm/panfrost/panfrost_regs.h           |    42 +-
 drivers/gpu/drm/pl111/Kconfig                      |     2 +-
 drivers/gpu/drm/pl111/pl111_display.c              |     8 +-
 drivers/gpu/drm/pl111/pl111_drv.c                  |     9 +-
 drivers/gpu/drm/pl111/pl111_versatile.c            |     1 +
 drivers/gpu/drm/qxl/qxl_cmd.c                      |     8 -
 drivers/gpu/drm/qxl/qxl_display.c                  |     4 +-
 drivers/gpu/drm/qxl/qxl_drv.c                      |     3 +-
 drivers/gpu/drm/qxl/qxl_drv.h                      |     2 -
 drivers/gpu/drm/qxl/qxl_kms.c                      |     4 +-
 drivers/gpu/drm/qxl/qxl_object.c                   |     2 +-
 drivers/gpu/drm/radeon/Makefile                    |     2 +-
 drivers/gpu/drm/radeon/atombios_crtc.c             |    11 +-
 drivers/gpu/drm/radeon/atombios_encoders.c         |    66 +-
 drivers/gpu/drm/radeon/ci_dpm.c                    |     6 +-
 drivers/gpu/drm/radeon/r600_cs.c                   |     2 -
 drivers/gpu/drm/radeon/radeon.h                    |     3 -
 drivers/gpu/drm/radeon/radeon_atombios.c           |     2 -
 drivers/gpu/drm/radeon/radeon_connectors.c         |    61 +-
 drivers/gpu/drm/radeon/radeon_device.c             |     4 +-
 drivers/gpu/drm/radeon/radeon_display.c            |     1 -
 drivers/gpu/drm/radeon/radeon_dp_mst.c             |   778 -
 drivers/gpu/drm/radeon/radeon_drv.c                |     9 +-
 drivers/gpu/drm/radeon/radeon_encoders.c           |    25 +-
 drivers/gpu/drm/radeon/radeon_irq_kms.c            |    10 +-
 drivers/gpu/drm/radeon/radeon_legacy_encoders.c    |     7 +
 drivers/gpu/drm/radeon/radeon_mode.h               |    41 -
 drivers/gpu/drm/radeon/radeon_object.c             |     6 +-
 drivers/gpu/drm/radeon/radeon_pm.c                 |     2 +-
 drivers/gpu/drm/rcar-du/Kconfig                    |     2 +-
 drivers/gpu/drm/rcar-du/Makefile                   |     7 -
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c             |    34 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c              |     9 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.h              |     3 +
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c          |     9 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c              |    41 +-
 drivers/gpu/drm/rcar-du/rcar_du_plane.c            |    31 +-
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c              |    35 +-
 drivers/gpu/drm/rcar-du/rcar_du_writeback.c        |     4 +-
 drivers/gpu/drm/rcar-du/rcar_lvds.c                |     8 +-
 drivers/gpu/drm/rcar-du/rcar_lvds.h                |    10 +-
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c            |    69 +-
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h            |    31 +
 drivers/gpu/drm/rockchip/Kconfig                   |     2 +-
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c    |    51 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |     2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c        |     4 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |   122 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.h        |     2 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |     1 -
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c        |    24 +-
 drivers/gpu/drm/rockchip/rockchip_vop_reg.h        |     1 +
 drivers/gpu/drm/scheduler/sched_main.c             |    10 +-
 drivers/gpu/drm/selftests/Makefile                 |     8 -
 drivers/gpu/drm/selftests/drm_buddy_selftests.h    |    15 -
 drivers/gpu/drm/selftests/drm_cmdline_selftests.h  |    68 -
 drivers/gpu/drm/selftests/drm_mm_selftests.h       |    28 -
 drivers/gpu/drm/selftests/drm_modeset_selftests.h  |    40 -
 drivers/gpu/drm/selftests/drm_selftest.c           |   109 -
 drivers/gpu/drm/selftests/drm_selftest.h           |    41 -
 drivers/gpu/drm/selftests/test-drm_buddy.c         |   994 -
 .../gpu/drm/selftests/test-drm_cmdline_parser.c    |  1141 -
 drivers/gpu/drm/selftests/test-drm_damage_helper.c |   668 -
 drivers/gpu/drm/selftests/test-drm_format.c        |   280 -
 .../gpu/drm/selftests/test-drm_modeset_common.c    |    32 -
 .../gpu/drm/selftests/test-drm_modeset_common.h    |    52 -
 drivers/gpu/drm/selftests/test-drm_rect.c          |   223 -
 drivers/gpu/drm/shmobile/Kconfig                   |     2 +-
 drivers/gpu/drm/shmobile/shmob_drm_crtc.c          |    15 +-
 drivers/gpu/drm/shmobile/shmob_drm_drv.c           |     6 +-
 drivers/gpu/drm/shmobile/shmob_drm_kms.c           |     3 +-
 drivers/gpu/drm/shmobile/shmob_drm_kms.h           |     2 +-
 drivers/gpu/drm/shmobile/shmob_drm_plane.c         |    21 +-
 drivers/gpu/drm/sis/sis_drv.c                      |     2 +-
 drivers/gpu/drm/solomon/ssd130x-spi.c              |    21 +-
 drivers/gpu/drm/solomon/ssd130x.c                  |   263 +-
 drivers/gpu/drm/solomon/ssd130x.h                  |     9 +-
 drivers/gpu/drm/sprd/Kconfig                       |     2 +-
 drivers/gpu/drm/sprd/sprd_dpu.c                    |    15 +-
 drivers/gpu/drm/sprd/sprd_drm.c                    |     6 +-
 drivers/gpu/drm/sti/Kconfig                        |     2 +-
 drivers/gpu/drm/sti/sti_crtc.c                     |     1 -
 drivers/gpu/drm/sti/sti_cursor.c                   |    14 +-
 drivers/gpu/drm/sti/sti_drv.c                      |     7 +-
 drivers/gpu/drm/sti/sti_gdp.c                      |    18 +-
 drivers/gpu/drm/sti/sti_hqvdp.c                    |    18 +-
 drivers/gpu/drm/sti/sti_plane.c                    |     3 +-
 drivers/gpu/drm/sti/sti_plane.h                    |     1 -
 drivers/gpu/drm/stm/Kconfig                        |     2 +-
 drivers/gpu/drm/stm/drv.c                          |    11 +-
 drivers/gpu/drm/stm/ltdc.c                         |    17 +-
 drivers/gpu/drm/sun4i/Kconfig                      |    28 +-
 drivers/gpu/drm/sun4i/sun4i_backend.c              |    17 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c                  |     9 +-
 drivers/gpu/drm/sun4i/sun4i_frontend.c             |    26 +-
 drivers/gpu/drm/sun4i/sun4i_layer.c                |     1 -
 drivers/gpu/drm/sun4i/sun4i_tv.c                   |    64 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c                |     4 +-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c             |    27 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c             |    27 +-
 drivers/gpu/drm/tegra/dc.c                         |     1 -
 drivers/gpu/drm/tegra/fb.c                         |     2 +-
 drivers/gpu/drm/tegra/plane.c                      |     1 -
 drivers/gpu/drm/tests/Makefile                     |     4 +-
 drivers/gpu/drm/tests/drm_buddy_test.c             |   756 +
 drivers/gpu/drm/tests/drm_cmdline_parser_test.c    |   991 +
 drivers/gpu/drm/tests/drm_damage_helper_test.c     |   639 +
 .../drm_dp_mst_helper_test.c}                      |    89 +-
 drivers/gpu/drm/tests/drm_format_helper_test.c     |   370 +-
 drivers/gpu/drm/tests/drm_format_test.c            |   359 +
 .../drm_framebuffer_test.c}                        |   120 +-
 .../test-drm_mm.c =3D> tests/drm_mm_test.c}          |  1253 +-
 .../drm_plane_helper_test.c}                       |   155 +-
 drivers/gpu/drm/tests/drm_rect_test.c              |   214 +
 drivers/gpu/drm/tidss/Kconfig                      |     2 +-
 drivers/gpu/drm/tidss/tidss_crtc.c                 |     4 +-
 drivers/gpu/drm/tidss/tidss_dispc.c                |    28 +-
 drivers/gpu/drm/tidss/tidss_drv.c                  |     6 +-
 drivers/gpu/drm/tidss/tidss_kms.c                  |     3 +-
 drivers/gpu/drm/tidss/tidss_plane.c                |     1 -
 drivers/gpu/drm/tilcdc/Kconfig                     |     2 +-
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c               |    10 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c                |     6 +-
 drivers/gpu/drm/tilcdc/tilcdc_plane.c              |    10 +-
 drivers/gpu/drm/tiny/Kconfig                       |    22 +-
 drivers/gpu/drm/tiny/arcpgu.c                      |    14 +-
 drivers/gpu/drm/tiny/bochs.c                       |    14 +-
 drivers/gpu/drm/tiny/cirrus.c                      |    19 +-
 drivers/gpu/drm/tiny/hx8357d.c                     |     7 +-
 drivers/gpu/drm/tiny/ili9163.c                     |     7 +-
 drivers/gpu/drm/tiny/ili9225.c                     |    12 +-
 drivers/gpu/drm/tiny/ili9341.c                     |     7 +-
 drivers/gpu/drm/tiny/ili9486.c                     |     7 +-
 drivers/gpu/drm/tiny/mi0283qt.c                    |     7 +-
 drivers/gpu/drm/tiny/panel-mipi-dbi.c              |     7 +-
 drivers/gpu/drm/tiny/repaper.c                     |    42 +-
 drivers/gpu/drm/tiny/simpledrm.c                   |   594 +-
 drivers/gpu/drm/tiny/st7586.c                      |    17 +-
 drivers/gpu/drm/tiny/st7735r.c                     |     7 +-
 drivers/gpu/drm/ttm/ttm_bo.c                       |   172 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c                  |    11 +-
 drivers/gpu/drm/ttm/ttm_range_manager.c            |    33 +
 drivers/gpu/drm/ttm/ttm_resource.c                 |    64 +-
 drivers/gpu/drm/tve200/Kconfig                     |     2 +-
 drivers/gpu/drm/tve200/tve200_display.c            |    12 +-
 drivers/gpu/drm/tve200/tve200_drv.c                |    10 +-
 drivers/gpu/drm/udl/udl_drv.c                      |    19 +-
 drivers/gpu/drm/udl/udl_drv.h                      |     5 +-
 drivers/gpu/drm/udl/udl_main.c                     |   128 +-
 drivers/gpu/drm/udl/udl_modeset.c                  |    49 +-
 drivers/gpu/drm/udl/udl_transfer.c                 |    46 +-
 drivers/gpu/drm/v3d/v3d_drv.c                      |     1 -
 drivers/gpu/drm/v3d/v3d_gem.c                      |     4 +-
 drivers/gpu/drm/v3d/v3d_perfmon.c                  |     2 +-
 drivers/gpu/drm/vboxvideo/vbox_mode.c              |    12 +-
 drivers/gpu/drm/vboxvideo/vboxvideo.h              |     2 +-
 drivers/gpu/drm/vc4/Kconfig                        |     3 +-
 drivers/gpu/drm/vc4/vc4_bo.c                       |    79 +-
 drivers/gpu/drm/vc4/vc4_crtc.c                     |   149 +-
 drivers/gpu/drm/vc4/vc4_debugfs.c                  |    72 +-
 drivers/gpu/drm/vc4/vc4_dpi.c                      |   131 +-
 drivers/gpu/drm/vc4/vc4_drv.c                      |    28 +-
 drivers/gpu/drm/vc4/vc4_drv.h                      |    65 +-
 drivers/gpu/drm/vc4/vc4_dsi.c                      |   131 +-
 drivers/gpu/drm/vc4/vc4_gem.c                      |    22 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |   982 +-
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |    15 +-
 drivers/gpu/drm/vc4/vc4_hvs.c                      |   145 +-
 drivers/gpu/drm/vc4/vc4_irq.c                      |     4 +-
 drivers/gpu/drm/vc4/vc4_kms.c                      |     1 -
 drivers/gpu/drm/vc4/vc4_perfmon.c                  |     1 +
 drivers/gpu/drm/vc4/vc4_plane.c                    |    71 +-
 drivers/gpu/drm/vc4/vc4_render_cl.c                |    40 +-
 drivers/gpu/drm/vc4/vc4_txp.c                      |    63 +-
 drivers/gpu/drm/vc4/vc4_v3d.c                      |    73 +-
 drivers/gpu/drm/vc4/vc4_validate.c                 |    28 +-
 drivers/gpu/drm/vc4/vc4_validate_shaders.c         |     2 +-
 drivers/gpu/drm/vc4/vc4_vec.c                      |   273 +-
 drivers/gpu/drm/via/Makefile                       |     2 +-
 drivers/gpu/drm/via/via_3d_reg.h                   |   349 +-
 drivers/gpu/drm/via/via_dma.c                      |   744 -
 drivers/gpu/drm/via/via_dmablit.c                  |   807 -
 drivers/gpu/drm/via/via_dmablit.h                  |   140 -
 drivers/gpu/drm/via/via_dri1.c                     |  3630 ++
 drivers/gpu/drm/via/via_drv.c                      |   124 -
 drivers/gpu/drm/via/via_drv.h                      |   229 -
 drivers/gpu/drm/via/via_irq.c                      |   388 -
 drivers/gpu/drm/via/via_map.c                      |   132 -
 drivers/gpu/drm/via/via_mm.c                       |   241 -
 drivers/gpu/drm/via/via_verifier.c                 |  1110 -
 drivers/gpu/drm/via/via_verifier.h                 |    62 -
 drivers/gpu/drm/via/via_video.c                    |    94 -
 drivers/gpu/drm/virtio/virtgpu_display.c           |     2 +
 drivers/gpu/drm/virtio/virtgpu_drv.c               |    53 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h               |     5 +-
 drivers/gpu/drm/virtio/virtgpu_gem.c               |     4 +-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c             |     4 +-
 drivers/gpu/drm/virtio/virtgpu_kms.c               |    23 +-
 drivers/gpu/drm/virtio/virtgpu_object.c            |    65 +-
 drivers/gpu/drm/virtio/virtgpu_plane.c             |    40 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c                |    21 +-
 drivers/gpu/drm/vkms/Makefile                      |     1 +
 drivers/gpu/drm/vkms/vkms_composer.c               |   314 +-
 drivers/gpu/drm/vkms/vkms_drv.h                    |    33 +-
 drivers/gpu/drm/vkms/vkms_formats.c                |   286 +
 drivers/gpu/drm/vkms/vkms_formats.h                |    12 +
 drivers/gpu/drm/vkms/vkms_plane.c                  |    56 +-
 drivers/gpu/drm/vkms/vkms_writeback.c              |    39 +-
 .../gpu/drm/vmwgfx/device_include/vm_basic_types.h |     2 +-
 drivers/gpu/drm/vmwgfx/ttm_object.h                |     4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c                 |    14 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf_res.c         |     8 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |    13 -
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |     1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c            |     4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |    11 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h                |     2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c                |     1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c                |     1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c           |     8 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c               |     3 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_simple_resource.c    |     2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c               |     1 -
 drivers/gpu/drm/xlnx/Kconfig                       |     2 +-
 drivers/gpu/drm/xlnx/zynqmp_disp.c                 |    13 +-
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c                |     8 +-
 drivers/media/platform/renesas/vsp1/vsp1_drm.c     |     2 +
 drivers/misc/mei/bus-fixup.c                       |   106 +-
 drivers/misc/mei/client.c                          |    16 +-
 drivers/misc/mei/debugfs.c                         |    19 +-
 drivers/misc/mei/gsc-me.c                          |    77 +-
 drivers/misc/mei/hbm.c                             |    14 +-
 drivers/misc/mei/hw-me-regs.h                      |     9 +-
 drivers/misc/mei/hw-me.c                           |   138 +-
 drivers/misc/mei/hw-me.h                           |    17 +-
 drivers/misc/mei/hw-txe.c                          |     4 +-
 drivers/misc/mei/hw.h                              |     7 +-
 drivers/misc/mei/init.c                            |    35 +-
 drivers/misc/mei/main.c                            |     4 +-
 drivers/misc/mei/mei_dev.h                         |    35 +-
 drivers/misc/mei/mkhi.h                            |    55 +
 drivers/misc/mei/pci-me.c                          |     4 +-
 drivers/platform/x86/Kconfig                       |     1 +
 drivers/platform/x86/acer-wmi.c                    |    66 -
 drivers/platform/x86/apple-gmux.c                  |     3 -
 drivers/platform/x86/asus-nb-wmi.c                 |    21 -
 drivers/platform/x86/asus-wmi.c                    |    13 -
 drivers/platform/x86/asus-wmi.h                    |     2 -
 drivers/platform/x86/eeepc-wmi.c                   |    25 +-
 drivers/platform/x86/nvidia-wmi-ec-backlight.c     |    82 +-
 drivers/platform/x86/samsung-laptop.c              |    87 -
 drivers/platform/x86/toshiba_acpi.c                |    16 -
 drivers/staging/sm750fb/sm750.c                    |    15 +-
 drivers/video/aperture.c                           |    69 +-
 drivers/video/fbdev/arkfb.c                        |     5 +
 drivers/video/fbdev/asiliantfb.c                   |     5 +
 drivers/video/fbdev/aty/aty128fb.c                 |    57 +-
 drivers/video/fbdev/aty/atyfb_base.c               |     7 +-
 drivers/video/fbdev/aty/radeon_base.c              |    83 +-
 drivers/video/fbdev/carminefb.c                    |     5 +
 drivers/video/fbdev/chipsfb.c                      |    13 +-
 drivers/video/fbdev/cirrusfb.c                     |     5 +
 drivers/video/fbdev/core/fbmem.c                   |   219 +-
 drivers/video/fbdev/cyber2000fb.c                  |     5 +
 drivers/video/fbdev/geode/gx1fb_core.c             |     5 +
 drivers/video/fbdev/geode/gxfb_core.c              |     5 +
 drivers/video/fbdev/geode/lxfb_core.c              |     5 +
 drivers/video/fbdev/gxt4500.c                      |     5 +
 drivers/video/fbdev/hyperv_fb.c                    |     6 +-
 drivers/video/fbdev/i740fb.c                       |     5 +
 drivers/video/fbdev/i810/i810_main.c               |   315 +-
 drivers/video/fbdev/imsttfb.c                      |    36 +-
 drivers/video/fbdev/intelfb/intelfbdrv.c           |     5 +
 drivers/video/fbdev/kyro/fbdev.c                   |     5 +
 drivers/video/fbdev/matrox/matroxfb_base.c         |     5 +
 drivers/video/fbdev/mb862xx/mb862xxfbdrv.c         |     5 +
 drivers/video/fbdev/neofb.c                        |    41 +-
 drivers/video/fbdev/nvidia/nvidia.c                |     7 +-
 drivers/video/fbdev/pm2fb.c                        |     5 +
 drivers/video/fbdev/pm3fb.c                        |     5 +
 drivers/video/fbdev/pvr2fb.c                       |     5 +
 drivers/video/fbdev/riva/fbdev.c                   |    67 +-
 drivers/video/fbdev/s3fb.c                         |     5 +
 drivers/video/fbdev/savage/savagefb_driver.c       |     5 +
 drivers/video/fbdev/sis/sis_main.c                 |     5 +
 drivers/video/fbdev/skeletonfb.c                   |   210 +-
 drivers/video/fbdev/sm712fb.c                      |     5 +
 drivers/video/fbdev/sstfb.c                        |    43 +-
 drivers/video/fbdev/sunxvr2500.c                   |     5 +
 drivers/video/fbdev/sunxvr500.c                    |     5 +
 drivers/video/fbdev/tdfxfb.c                       |     5 +
 drivers/video/fbdev/tgafb.c                        |    17 +-
 drivers/video/fbdev/tridentfb.c                    |     5 +
 drivers/video/fbdev/vermilion/vermilion.c          |     7 +-
 drivers/video/fbdev/vga16fb.c                      |   191 +-
 drivers/video/fbdev/via/via-core.c                 |     5 +
 drivers/video/fbdev/vt8623fb.c                     |     5 +
 drivers/video/hdmi.c                               |    82 +-
 include/acpi/video.h                               |     9 +-
 include/drm/display/drm_dp.h                       |     3 +
 include/drm/display/drm_dp_helper.h                |     2 +
 include/drm/display/drm_dp_mst_helper.h            |   237 +-
 include/drm/drm_atomic_helper.h                    |    12 +
 include/drm/drm_bridge.h                           |    12 +
 include/drm/drm_connector.h                        |    26 +
 include/drm/drm_crtc.h                             |     9 +
 include/drm/drm_encoder.h                          |     6 +
 .../{drm_fb_cma_helper.h =3D> drm_fb_dma_helper.h}   |    10 +-
 include/drm/drm_file.h                             |     9 -
 include/drm/drm_format_helper.h                    |    69 +-
 include/drm/drm_fourcc.h                           |     4 +
 include/drm/drm_framebuffer.h                      |     8 +-
 include/drm/drm_gem.h                              |    57 +-
 .../{drm_gem_cma_helper.h =3D> drm_gem_dma_helper.h} |   158 +-
 include/drm/drm_gem_shmem_helper.h                 |     2 +-
 include/drm/drm_mipi_dbi.h                         |     2 +
 include/drm/drm_mipi_dsi.h                         |     4 +-
 include/drm/drm_modes.h                            |    35 +-
 include/drm/drm_panel.h                            |     7 -
 include/drm/drm_plane.h                            |    52 +-
 include/drm/drm_plane_helper.h                     |    40 +-
 include/drm/drm_probe_helper.h                     |     9 +-
 include/drm/gpu_scheduler.h                        |     9 +-
 include/drm/i915_pciids.h                          |     1 +
 include/drm/ttm/ttm_bo_api.h                       |    93 +-
 include/drm/ttm/ttm_bo_driver.h                    |     2 +-
 include/drm/ttm/ttm_resource.h                     |    40 +
 include/linux/dma-resv.h                           |    16 +-
 include/linux/fb.h                                 |    10 -
 include/linux/hdmi.h                               |     7 +-
 include/linux/iosys-map.h                          |    15 +-
 include/linux/mei_aux.h                            |    12 +
 .../platform_data/x86/nvidia-wmi-ec-backlight.h    |    76 +
 include/media/vsp1.h                               |     2 +
 include/uapi/drm/amdgpu_drm.h                      |     8 +
 include/uapi/drm/drm_fourcc.h                      |    34 +-
 include/uapi/drm/drm_mode.h                        |     8 +-
 include/uapi/drm/panfrost_drm.h                    |    47 +
 include/video/vga.h                                |    20 +-
 1230 files changed, 115744 insertions(+), 38384 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
 create mode 100644 Documentation/gpu/amdgpu/apu-asic-info-table.csv
 create mode 100644 Documentation/gpu/amdgpu/dgpu-asic-info-table.csv
 create mode 100644 Documentation/gpu/amdgpu/display/dcn2_cm_drm_current.sv=
g
 create mode 100644 Documentation/gpu/amdgpu/display/dcn3_cm_drm_current.sv=
g
 create mode 100644 Documentation/gpu/amdgpu/display/mpo-cursor.svg
 create mode 100644 Documentation/gpu/amdgpu/display/mpo-overview.rst
 create mode 100644
Documentation/gpu/amdgpu/display/multi-display-hdcp-mpo-less-pipe-ex.svg
 create mode 100644 Documentation/gpu/amdgpu/display/multi-display-hdcp-mpo=
.svg
 create mode 100644 Documentation/gpu/amdgpu/display/pipeline_4k_no_split.s=
vg
 create mode 100644 Documentation/gpu/amdgpu/display/pipeline_4k_split.svg
 create mode 100644
Documentation/gpu/amdgpu/display/single-display-mpo-multi-video.svg
 create mode 100644 Documentation/gpu/amdgpu/display/single-display-mpo.svg
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0_3.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0_3.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/imu_v11_0_3.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/imu_v11_0_3.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mmsch_v4_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/sienna_cichlid.c
 rename drivers/gpu/drm/amd/{display/dc/inc/dml_wrapper.h =3D>
amdgpu/sienna_cichlid.h} (81%)
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dml/dml_wrapper.c
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dml/dml_wrapper_translat=
ion.c
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/gc/gc_11_0_3_offse=
t.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/gc/gc_11_0_3_sh_ma=
sk.h
 rename drivers/gpu/drm/{drm_fb_cma_helper.c =3D> drm_fb_dma_helper.c} (60%=
)
 rename drivers/gpu/drm/{drm_gem_cma_helper.c =3D> drm_gem_dma_helper.c} (6=
1%)
 create mode 100644 drivers/gpu/drm/i915/display/intel_backlight_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_core.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_gmbus_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_hdcp_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/skl_watermark.c
 create mode 100644 drivers/gpu/drm/i915/display/skl_watermark.h
 create mode 100644 drivers/gpu/drm/i915/gt/intel_sa_media.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_sa_media.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_reg.h
 create mode 100644 drivers/gpu/drm/mgag200/mgag200_bmc.c
 delete mode 100644 drivers/gpu/drm/mgag200/mgag200_pll.c
 create mode 100644 drivers/gpu/drm/panfrost/panfrost_dump.c
 create mode 100644 drivers/gpu/drm/panfrost/panfrost_dump.h
 delete mode 100644 drivers/gpu/drm/radeon/radeon_dp_mst.c
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h
 delete mode 100644 drivers/gpu/drm/selftests/Makefile
 delete mode 100644 drivers/gpu/drm/selftests/drm_buddy_selftests.h
 delete mode 100644 drivers/gpu/drm/selftests/drm_cmdline_selftests.h
 delete mode 100644 drivers/gpu/drm/selftests/drm_mm_selftests.h
 delete mode 100644 drivers/gpu/drm/selftests/drm_modeset_selftests.h
 delete mode 100644 drivers/gpu/drm/selftests/drm_selftest.c
 delete mode 100644 drivers/gpu/drm/selftests/drm_selftest.h
 delete mode 100644 drivers/gpu/drm/selftests/test-drm_buddy.c
 delete mode 100644 drivers/gpu/drm/selftests/test-drm_cmdline_parser.c
 delete mode 100644 drivers/gpu/drm/selftests/test-drm_damage_helper.c
 delete mode 100644 drivers/gpu/drm/selftests/test-drm_format.c
 delete mode 100644 drivers/gpu/drm/selftests/test-drm_modeset_common.c
 delete mode 100644 drivers/gpu/drm/selftests/test-drm_modeset_common.h
 delete mode 100644 drivers/gpu/drm/selftests/test-drm_rect.c
 create mode 100644 drivers/gpu/drm/tests/drm_buddy_test.c
 create mode 100644 drivers/gpu/drm/tests/drm_cmdline_parser_test.c
 create mode 100644 drivers/gpu/drm/tests/drm_damage_helper_test.c
 rename drivers/gpu/drm/{selftests/test-drm_dp_mst_helper.c =3D>
tests/drm_dp_mst_helper_test.c} (71%)
 create mode 100644 drivers/gpu/drm/tests/drm_format_test.c
 rename drivers/gpu/drm/{selftests/test-drm_framebuffer.c =3D>
tests/drm_framebuffer_test.c} (80%)
 rename drivers/gpu/drm/{selftests/test-drm_mm.c =3D> tests/drm_mm_test.c} =
(54%)
 rename drivers/gpu/drm/{selftests/test-drm_plane_helper.c =3D>
tests/drm_plane_helper_test.c} (51%)
 create mode 100644 drivers/gpu/drm/tests/drm_rect_test.c
 delete mode 100644 drivers/gpu/drm/via/via_dma.c
 delete mode 100644 drivers/gpu/drm/via/via_dmablit.c
 delete mode 100644 drivers/gpu/drm/via/via_dmablit.h
 create mode 100644 drivers/gpu/drm/via/via_dri1.c
 delete mode 100644 drivers/gpu/drm/via/via_drv.c
 delete mode 100644 drivers/gpu/drm/via/via_drv.h
 delete mode 100644 drivers/gpu/drm/via/via_irq.c
 delete mode 100644 drivers/gpu/drm/via/via_map.c
 delete mode 100644 drivers/gpu/drm/via/via_mm.c
 delete mode 100644 drivers/gpu/drm/via/via_verifier.c
 delete mode 100644 drivers/gpu/drm/via/via_verifier.h
 delete mode 100644 drivers/gpu/drm/via/via_video.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_formats.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_formats.h
 create mode 100644 drivers/misc/mei/mkhi.h
 rename include/drm/{drm_fb_cma_helper.h =3D> drm_fb_dma_helper.h} (56%)
 rename include/drm/{drm_gem_cma_helper.h =3D> drm_gem_dma_helper.h} (53%)
 create mode 100644 include/linux/platform_data/x86/nvidia-wmi-ec-backlight=
.h
