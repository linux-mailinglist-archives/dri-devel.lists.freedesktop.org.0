Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF0887A239
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 05:17:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5242E10F58D;
	Wed, 13 Mar 2024 04:16:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ffpQ9XRQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07ADD10F58D
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 04:16:53 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-513bf5a2555so1569570e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 21:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710303412; x=1710908212; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fKudODp3bFUUOF1QUnwb2edLLjX+nV2trcG4eg1F5dA=;
 b=ffpQ9XRQcu8ZvwlizdgrCMLLltEP4uaNIr2tXIbGSGq+gXnWfZ56ynhzcFY8NXKaRX
 6VtNdwTX6c3X56WISc25o+Jfn+Wu9K8JYaWmphi+cnQCFvk4gVUk5rGyrE8Sv5iriwef
 53XOocIGh7WNFpi6KoxBArrFy2cNw/zclqwG1lyWVIbPjN+oXuCdgUwkeuJdCjVFkYUx
 cbYrxTxqa+t5KSsz9EsheWGcGyqKX6qc+LpadtqQUXalnODD8W7Ca8lkGWUILKCO2WhW
 Jzn8oUYNwZZ+4igsSTzWYjTrp49knolyoGE/96F4YSCtQyzgik67a6fJeJbDktXESkQi
 pleQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710303412; x=1710908212;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fKudODp3bFUUOF1QUnwb2edLLjX+nV2trcG4eg1F5dA=;
 b=Vv5Jqltfgz3eRG/e/1ginI4qphfQHMuta7/S8c5uZH/8YlcofTc9A1duurc8+cz2Gj
 6vyh6gZork+HkO7jICC1wBODH3Y7AKpLnoAn+WO1F/sLnAhDYsdQgHkc7YoDXWRIeXTa
 6mu0emKD7LwmFKj6Q9X+xcotT8Ozljj0/fjPv5au8E+4hjw6eUIjB68MP9KPHMIYeKhc
 mB6FTe2KYUu8C4yvLF/PJfIXvDt8luumdMuawFf9kHPjGZQ0PhJJTFEwbwxNxlQPe9qo
 V8baT6s/M6us3P6CZdIelfJ1mmMN1sRzumqirdzMraHDUbjKF/wtNBMv2s/jXxrruWDx
 b1DQ==
X-Gm-Message-State: AOJu0YySfMA1pAbGyE6ImrhIOHQKUAZUU7m/6hQHd1TsQDz8tP+hdSaQ
 UUMCm/3f1z+YOa7Z+WdArMiNOX+nSEmaZh1J/WNKWTGdpIl56JQxpZNirEmUZv2ONe3ZDcPkCEi
 zRvLHCbyGGfmpkBn/TEAxLqvoQmA=
X-Google-Smtp-Source: AGHT+IEc7YCS1lAFtlB1IEZvQa3thm17VBDDyuHLcziLYnR6eOlXG3zoLGod1dGWqGs3l8TUZc94pIZcSv3k09GLM54=
X-Received: by 2002:a05:6512:5c7:b0:513:24ba:466a with SMTP id
 o7-20020a05651205c700b0051324ba466amr6000509lfo.53.1710303410187; Tue, 12 Mar
 2024 21:16:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9twR+WnE3GGqyeh1cuGVmpADPTwDPK10625RP--rLrqkxA@mail.gmail.com>
In-Reply-To: <CAPM=9twR+WnE3GGqyeh1cuGVmpADPTwDPK10625RP--rLrqkxA@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 13 Mar 2024 14:16:37 +1000
Message-ID: <CAPM=9tyTCEMb6uc9+Gfc3wDXpa4-Dso1gN-k7UQjGPZTpVtptQ@mail.gmail.com>
Subject: Re: [git pull] drm for 6.9-rc1
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

On Wed, 13 Mar 2024 at 14:06, Dave Airlie <airlied@gmail.com> wrote:
>
> Hi Linus,
>
> This is the main drm pull request for 6.9.
>
> This is mostly self contained, some backlight bits in powerpc,
> and possibly some minor media/sound related nits.
>
> I've done a trial merge into your tree from a few hours ago, there
> are definitely some slighty messy conflicts, I've pushed a sample
> branch here:

Just realised I forgot to go back and fill it in
https://cgit.freedesktop.org/~airlied/linux/log/?h=3Ddrm-next-6.9-merged

Dave.
>
> This is also a PR from the tree hosted in fd.o gitlab (though I think I'v=
e
> probably done fixes from there without mentioning it), so there should
> be no problems.
>
> Highlights are usual, more AMD IP blocks for future hw, i915/xe changes,
> Displayport tunnelling support for i915, msm YUV over DP changes, new tes=
ts
> for ttm, but its mostly a lot of stuff all over the place from lots of pe=
ople.
>
> Let me know if there any problems (esp if I messed up the sample merge).
>
> Regards,
> Dave.
>
>
> drm-next-2024-03-13:
> drm for 6.9:
>
> core:
> - EDID cleanups
> - scheduler error handling fixes
> - managed: add drmm_release_action() with tests
> - add ratelimited drm debug print
> - DPCD PSR early transport macro
> - DP tunneling and bandwidth allocation helpers
> - remove built-in edids
> - dp: Avoid AUX transfers on powered-down displays
> - dp: Add VSC SDP helpers
>
> cross drivers:
> - use new drm print helpers
> - switch to ->read_edid callback
> - gem: add stats for shared buffers plus updates to amdgpu, i915, xe
>
> syncobj:
> - fixes to waiting and sleeping
>
> ttm:
> - add tests
> - fix errno codes
> - simply busy-placement handling
> - fix page decryption
>
> media:
> - tc358743: fix v4l device registration
>
> video:
> - move all kernel parameters for video behind CONFIG_VIDEO
>
> sound:
> - remove <drm/drm_edid.h> include from header
>
> ci:
> - add tests for msm
> - fix apq8016 runner
>
> efifb:
> - use copy of global screen_info state
>
> vesafb:
> - use copy of global screen_info state
>
> simplefb:
> - fix logging
>
> bridge:
> - ite-6505: fix DP link-training bug
> - samsung-dsim: fix error checking in probe
> - samsung-dsim: add bsh-smm-s2/pro boards
> - tc358767: fix regmap usage
> - imx: add i.MX8MP HDMI PVI plus DT bindings
> - imx: add i.MX8MP HDMI TX plus DT bindings
> - sii902x: fix probing and unregistration
> - tc358767: limit pixel PLL input range
> - switch to new drm_bridge_read_edid() interface
>
> panel:
> - ltk050h3146w: error-handling fixes
> - panel-edp: support delay between power-on and enable; use put_sync in
>   unprepare; support Mediatek MT8173 Chromebooks, BOE NV116WHM-N49 V8.0,
>   BOE NV122WUM-N41, CSO MNC207QS1-1 plus DT bindings
> - panel-lvds: support EDT ETML0700Z9NDHA plus DT bindings
> - panel-novatek: FRIDA FRD400B25025-A-CTK plus DT bindings
> - add BOE TH101MB31IG002-28A plus DT bindings
> - add EDT ETML1010G3DRA plus DT bindings
> - add Novatek NT36672E LCD DSI plus DT bindings
> - nt36523: support 120Hz timings, fix includes
> - simple: fix display timings on RK32FN48H
> - visionox-vtdr6130: fix initialization
> - add Powkiddy RGB10MAX3 plus DT bindings
> - st7703: support panel rotation plus DT bindings
> - add Himax HX83112A plus DT bindings
> - ltk500hd1829: add support for ltk101b4029w and admatec 9904370
> - simple: add BOE BP082WX1-100 8.2" panel plus DT bindungs
>
> panel-orientation-quirks:
> - GPD Win Mini
>
> amdgpu:
> - Validate DMABuf imports in compute VMs
> - Add RAS ACA framework
> - PSP 13 fixes
> - Misc code cleanups
> - Replay fixes
> - Atom interpretor PS, WS bounds checking
> - DML2 fixes
> - Audio fixes
> - DCN 3.5 Z state fixes
> - Remove deprecated ida_simple usage
> - UBSAN fixes
> - RAS fixes
> - Enable seq64 infrastructure
> - DC color block enablement
> - Documentation updates
> - DC documentation updates
> - DMCUB updates
> - ATHUB 4.1 support
> - LSDMA 7.0 support
> - JPEG DPG support
> - IH 7.0 support
> - HDP 7.0 support
> - VCN 5.0 support
> - SMU 13.0.6 updates
> - NBIO 7.11 updates
> - SDMA 6.1 updates
> - MMHUB 3.3 updates
> - DCN 3.5.1 support
> - NBIF 6.3.1 support
> - VPE 6.1.1 support
>
> amdkfd:
> - Validate DMABuf imports in compute VMs
> - SVM fixes
> - Trap handler updates and enhancements
> - Fix cache size reporting
> - Relocate the trap handler
>
> radeon:
> - Atom interpretor PS, WS bounds checking
> - Misc code cleanups
>
> xe:
> - new query for GuC submission version
> - Remove unused persistent exec_queues
> - Add vram frequency sysfs attributes
> - Add the flag XE_VM_BIND_FLAG_DUMPABLE
> - Drop pre-production workarounds
> - Drop kunit tests for unsupported platforms
> - Start pumbling SR-IOV support with memory based interrupts for VF
> - Allow to map BO in GGTT with PAT index corresponding to
>   XE_CACHE_UC to work with memory based interrupts
> - Add GuC Doorbells Manager as prep work SR-IOV
> - Implement additional workarounds for xe2 and MTL
> - Program a few registers according to perfomance guide spec for Xe2
> - Fix remaining 32b build issues and enable it back
> - Fix build with CONFIG_DEBUG_FS=3Dn
> - Fix warnings from GuC ABI headers
> - Introduce Relay Communication for SR-IOV for VF <-> GuC <-> PF
> - Release mmap mappings on rpm suspend
> - Disable mid-thread preemption when not properly supported by hardware
> - Fix xe_exec by reserving extra fence slot for CPU bind
> - Fix xe_exec with full long running exec queue
> - Canonicalize addresses where needed for Xe2 and add to devcoredum
> - Toggle USM support for Xe2
> - Only allow 1 ufence per exec / bind IOCTL
> - Add GuC firmware loading for Lunar Lake
> - Add XE_VMA_PTE_64K VMA flag
>
> i915:
> - Add more ADL-N PCI IDs
> - Enable fastboot also on older platforms
> - Early transport for panel replay and PSR
> - New ARL PCI IDs
> - DP TPS4 PHY test pattern support
> - Unify and improve VSC SDP for PSR and non-PSR cases
> - Refactor memory regions and improve debug logging
> - Rework global state serialization
> - Remove unused CDCLK divider fields
> - Unify HDCP connector logging format
> - Use display instead of graphics version in display code
> - Move VBT and opregion debugfs next to the implementation
> - Abstract opregion interface, use opaque type
> - MTL fixes
> - HPD handling fixes
> - Add GuC submission interface version query
> - Atomically invalidate userptr on mmu-notifier
> - Update handling of MMIO triggered reports
> - Don't make assumptions about intel_wakeref_t type
> - Extend driver code of Xe_LPG to Xe_LPG+
> - Add flex arrays to struct i915_syncmap
> - Allow for very slow HuC loading
> - DP tunneling and bandwidth allocation support
>
> msm:
> - Correct bindings for MSM8976 and SM8650 platforms
> - Start migration of MDP5 platforms to DPU driver
> - X1E80100 MDSS support
> - DPU:
> - Improve DSC allocation, fixing several important corner cases
> - Add support for SDM630/SDM660 platforms
> - Simplify dpu_encoder_phys_ops
> - Apply fixes targeting DSC support with a single DSC encoder
> - Apply fixes for HCTL_EN timing configuration
> - X1E80100 support
> - Add support for YUV420 over DP
> - GPU:
> - fix sc7180 UBWC config
> - fix a7xx LLC config
> - new gpu support: a305B, a750, a702
> - machine support: SM7150 (different power levels than other a618)
> - a7xx devcoredump support
>
> habanalabs:
> - configure IRQ affinity according to NUMA node
> - move HBM MMU page tables inside the HBM
> - improve device reset
> - check extended PCIe errors
>
> ivpu:
> - updates to firmware API
> - refactor BO allocation
>
> imx:
> - use devm_ functions during init
>
> hisilicon:
> - fix EDID includes
>
> mgag200:
> - improve ioremap usage
> - convert to struct drm_edid
> - Work around PCI write bursts
>
> nouveau:
> - disp: use kmemdup()
> - fix EDID includes
> - documentation fixes
>
> qaic:
> - fixes to BO handling
> - make use of DRM managed release
> - fix order of remove operations
>
> rockchip:
> - analogix_dp: get encoder port from DT
> - inno_hdmi: support HDMI for RK3128
> - lvds: error-handling fixes
>
> ssd130x:
> - support SSD133x plus DT bindings
>
> tegra:
> - fix error handling
>
> tilcdc:
> - make use of DRM managed release
>
> v3d:
> - show memory stats in debugfs
> - Support display MMU page size
>
> vc4:
> - fix error handling in plane prepare_fb
> - fix framebuffer test in plane helpers
>
> virtio:
> - add venus capset defines
>
> vkms:
> - fix OOB access when programming the LUT
> - Kconfig improvements
>
> vmwgfx:
> - unmap surface before changing plane state
> - fix memory leak in error handling
> - documentation fixes
> - list command SVGA_3D_CMD_DEFINE_GB_SURFACE_V4 as invalid
> - fix null-pointer deref in execbuf
> - refactor display-mode probing
> - fix fencing for creating cursor MOBs
> - fix cursor-memory lifetime
>
> xlnx:
> - fix live video input for ZynqMP DPSUB
>
> lima:
> - fix memory leak
>
> loongson:
> - fail if no VRAM present
>
> meson:
> - switch to new drm_bridge_read_edid() interface
>
> renesas:
> - add RZ/G2L DU support plus DT bindings
>
> mxsfb:
> - Use managed mode config
>
> sun4i:
> - HDMI: updates to atomic mode setting
>
> mediatek:
> - Add display driver for MT8188 VDOSYS1
> - DSI driver cleanups
> - Filter modes according to hardware capability
> - Fix a null pointer crash in mtk_drm_crtc_finish_page_flip
>
> etnaviv:
> - enhancements for NPU and MRT support
> The following changes since commit d206a76d7d2726f3b096037f2079ce0bd3ba32=
9b:
>
>   Linux 6.8-rc6 (2024-02-25 15:46:06 -0800)
>
> are available in the Git repository at:
>
>   https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2024-03-13
>
> for you to fetch changes up to 119b225f01e4d3ce974cd3b4d982c76a380c796d:
>
>   Merge tag 'amd-drm-next-6.9-2024-03-08-1' of
> https://gitlab.freedesktop.org/agd5f/linux into drm-next (2024-03-11
> 13:32:12 +1000)
>
> ----------------------------------------------------------------
> drm for 6.9:
>
> core:
> - EDID cleanups
> - scheduler error handling fixes
> - managed: add drmm_release_action() with tests
> - add ratelimited drm debug print
> - DPCD PSR early transport macro
> - DP tunneling and bandwidth allocation helpers
> - remove built-in edids
> - dp: Avoid AUX transfers on powered-down displays
> - dp: Add VSC SDP helpers
>
> cross drivers:
> - use new drm print helpers
> - switch to ->read_edid callback
> - gem: add stats for shared buffers plus updates to amdgpu, i915, xe
>
> syncobj:
> - fixes to waiting and sleeping
>
> ttm:
> - add tests
> - fix errno codes
> - simply busy-placement handling
> - fix page decryption
>
> media:
> - tc358743: fix v4l device registration
>
> video:
> - move all kernel parameters for video behind CONFIG_VIDEO
>
> sound:
> - remove <drm/drm_edid.h> include from header
>
> ci:
> - add tests for msm
> - fix apq8016 runner
>
> efifb:
> - use copy of global screen_info state
>
> vesafb:
> - use copy of global screen_info state
>
> simplefb:
> - fix logging
>
> bridge:
> - ite-6505: fix DP link-training bug
> - samsung-dsim: fix error checking in probe
> - samsung-dsim: add bsh-smm-s2/pro boards
> - tc358767: fix regmap usage
> - imx: add i.MX8MP HDMI PVI plus DT bindings
> - imx: add i.MX8MP HDMI TX plus DT bindings
> - sii902x: fix probing and unregistration
> - tc358767: limit pixel PLL input range
> - switch to new drm_bridge_read_edid() interface
>
> panel:
> - ltk050h3146w: error-handling fixes
> - panel-edp: support delay between power-on and enable; use put_sync in
>   unprepare; support Mediatek MT8173 Chromebooks, BOE NV116WHM-N49 V8.0,
>   BOE NV122WUM-N41, CSO MNC207QS1-1 plus DT bindings
> - panel-lvds: support EDT ETML0700Z9NDHA plus DT bindings
> - panel-novatek: FRIDA FRD400B25025-A-CTK plus DT bindings
> - add BOE TH101MB31IG002-28A plus DT bindings
> - add EDT ETML1010G3DRA plus DT bindings
> - add Novatek NT36672E LCD DSI plus DT bindings
> - nt36523: support 120Hz timings, fix includes
> - simple: fix display timings on RK32FN48H
> - visionox-vtdr6130: fix initialization
> - add Powkiddy RGB10MAX3 plus DT bindings
> - st7703: support panel rotation plus DT bindings
> - add Himax HX83112A plus DT bindings
> - ltk500hd1829: add support for ltk101b4029w and admatec 9904370
> - simple: add BOE BP082WX1-100 8.2" panel plus DT bindungs
>
> panel-orientation-quirks:
> - GPD Win Mini
>
> amdgpu:
> - Validate DMABuf imports in compute VMs
> - Add RAS ACA framework
> - PSP 13 fixes
> - Misc code cleanups
> - Replay fixes
> - Atom interpretor PS, WS bounds checking
> - DML2 fixes
> - Audio fixes
> - DCN 3.5 Z state fixes
> - Remove deprecated ida_simple usage
> - UBSAN fixes
> - RAS fixes
> - Enable seq64 infrastructure
> - DC color block enablement
> - Documentation updates
> - DC documentation updates
> - DMCUB updates
> - ATHUB 4.1 support
> - LSDMA 7.0 support
> - JPEG DPG support
> - IH 7.0 support
> - HDP 7.0 support
> - VCN 5.0 support
> - SMU 13.0.6 updates
> - NBIO 7.11 updates
> - SDMA 6.1 updates
> - MMHUB 3.3 updates
> - DCN 3.5.1 support
> - NBIF 6.3.1 support
> - VPE 6.1.1 support
>
> amdkfd:
> - Validate DMABuf imports in compute VMs
> - SVM fixes
> - Trap handler updates and enhancements
> - Fix cache size reporting
> - Relocate the trap handler
>
> radeon:
> - Atom interpretor PS, WS bounds checking
> - Misc code cleanups
>
> xe:
> - new query for GuC submission version
> - Remove unused persistent exec_queues
> - Add vram frequency sysfs attributes
> - Add the flag XE_VM_BIND_FLAG_DUMPABLE
> - Drop pre-production workarounds
> - Drop kunit tests for unsupported platforms
> - Start pumbling SR-IOV support with memory based interrupts for VF
> - Allow to map BO in GGTT with PAT index corresponding to
>   XE_CACHE_UC to work with memory based interrupts
> - Add GuC Doorbells Manager as prep work SR-IOV
> - Implement additional workarounds for xe2 and MTL
> - Program a few registers according to perfomance guide spec for Xe2
> - Fix remaining 32b build issues and enable it back
> - Fix build with CONFIG_DEBUG_FS=3Dn
> - Fix warnings from GuC ABI headers
> - Introduce Relay Communication for SR-IOV for VF <-> GuC <-> PF
> - Release mmap mappings on rpm suspend
> - Disable mid-thread preemption when not properly supported by hardware
> - Fix xe_exec by reserving extra fence slot for CPU bind
> - Fix xe_exec with full long running exec queue
> - Canonicalize addresses where needed for Xe2 and add to devcoredum
> - Toggle USM support for Xe2
> - Only allow 1 ufence per exec / bind IOCTL
> - Add GuC firmware loading for Lunar Lake
> - Add XE_VMA_PTE_64K VMA flag
>
> i915:
> - Add more ADL-N PCI IDs
> - Enable fastboot also on older platforms
> - Early transport for panel replay and PSR
> - New ARL PCI IDs
> - DP TPS4 PHY test pattern support
> - Unify and improve VSC SDP for PSR and non-PSR cases
> - Refactor memory regions and improve debug logging
> - Rework global state serialization
> - Remove unused CDCLK divider fields
> - Unify HDCP connector logging format
> - Use display instead of graphics version in display code
> - Move VBT and opregion debugfs next to the implementation
> - Abstract opregion interface, use opaque type
> - MTL fixes
> - HPD handling fixes
> - Add GuC submission interface version query
> - Atomically invalidate userptr on mmu-notifier
> - Update handling of MMIO triggered reports
> - Don't make assumptions about intel_wakeref_t type
> - Extend driver code of Xe_LPG to Xe_LPG+
> - Add flex arrays to struct i915_syncmap
> - Allow for very slow HuC loading
> - DP tunneling and bandwidth allocation support
>
> msm:
> - Correct bindings for MSM8976 and SM8650 platforms
> - Start migration of MDP5 platforms to DPU driver
> - X1E80100 MDSS support
> - DPU:
> - Improve DSC allocation, fixing several important corner cases
> - Add support for SDM630/SDM660 platforms
> - Simplify dpu_encoder_phys_ops
> - Apply fixes targeting DSC support with a single DSC encoder
> - Apply fixes for HCTL_EN timing configuration
> - X1E80100 support
> - Add support for YUV420 over DP
> - GPU:
> - fix sc7180 UBWC config
> - fix a7xx LLC config
> - new gpu support: a305B, a750, a702
> - machine support: SM7150 (different power levels than other a618)
> - a7xx devcoredump support
>
> habanalabs:
> - configure IRQ affinity according to NUMA node
> - move HBM MMU page tables inside the HBM
> - improve device reset
> - check extended PCIe errors
>
> ivpu:
> - updates to firmware API
> - refactor BO allocation
>
> imx:
> - use devm_ functions during init
>
> hisilicon:
> - fix EDID includes
>
> mgag200:
> - improve ioremap usage
> - convert to struct drm_edid
> - Work around PCI write bursts
>
> nouveau:
> - disp: use kmemdup()
> - fix EDID includes
> - documentation fixes
>
> qaic:
> - fixes to BO handling
> - make use of DRM managed release
> - fix order of remove operations
>
> rockchip:
> - analogix_dp: get encoder port from DT
> - inno_hdmi: support HDMI for RK3128
> - lvds: error-handling fixes
>
> ssd130x:
> - support SSD133x plus DT bindings
>
> tegra:
> - fix error handling
>
> tilcdc:
> - make use of DRM managed release
>
> v3d:
> - show memory stats in debugfs
> - Support display MMU page size
>
> vc4:
> - fix error handling in plane prepare_fb
> - fix framebuffer test in plane helpers
>
> virtio:
> - add venus capset defines
>
> vkms:
> - fix OOB access when programming the LUT
> - Kconfig improvements
>
> vmwgfx:
> - unmap surface before changing plane state
> - fix memory leak in error handling
> - documentation fixes
> - list command SVGA_3D_CMD_DEFINE_GB_SURFACE_V4 as invalid
> - fix null-pointer deref in execbuf
> - refactor display-mode probing
> - fix fencing for creating cursor MOBs
> - fix cursor-memory lifetime
>
> xlnx:
> - fix live video input for ZynqMP DPSUB
>
> lima:
> - fix memory leak
>
> loongson:
> - fail if no VRAM present
>
> meson:
> - switch to new drm_bridge_read_edid() interface
>
> renesas:
> - add RZ/G2L DU support plus DT bindings
>
> mxsfb:
> - Use managed mode config
>
> sun4i:
> - HDMI: updates to atomic mode setting
>
> mediatek:
> - Add display driver for MT8188 VDOSYS1
> - DSI driver cleanups
> - Filter modes according to hardware capability
> - Fix a null pointer crash in mtk_drm_crtc_finish_page_flip
>
> etnaviv:
> - enhancements for NPU and MRT support
>
> ----------------------------------------------------------------
> Abel Vesa (4):
>       dt-bindings: display/msm: Document the DPU for X1E80100
>       dt-bindings: display/msm: Document MDSS on X1E80100
>       drm/msm: mdss: Add X1E80100 support
>       drm/msm/dpu: Add X1E80100 support
>
> Abhinav Kumar (3):
>       drm/msm/dpu: fix the programming of INTF_CFG2_DATA_HCTL_EN
>       drm/dp: move intel_dp_vsc_sdp_pack() to generic helper
>       drm/dp: drop the size parameter from drm_dp_vsc_sdp_pack()
>
> Adam Ford (1):
>       drm/bridge: imx8mp-hdmi-pvi: Fix build warnings
>
> Adam Skladowski (2):
>       dt-bindings: dsi-controller-main: Document missing msm8976 compatib=
le
>       dt-bindings: msm: qcom, mdss: Include ommited fam-b compatible
>
> Alan Previn (2):
>       drm/i915/guc: Flush context destruction worker at suspend
>       drm/i915/guc: Close deregister-context race against CT-loss
>
> Alex Bee (14):
>       drm/rockchip: vop: Add output selection registers for RK312x
>       drm/rockchip: inno_hdmi: Fix video timing
>       drm/rockchip: inno_hdmi: Remove YUV-based csc coefficents
>       drm/rockchip: inno_hdmi: Drop irq struct member
>       drm/rockchip: inno_hdmi: Remove useless include
>       drm/rockchip: inno_hdmi: Subclass connector state
>       drm/rockchip: inno_hdmi: Correctly setup HDMI quantization range
>       drm/rockchip: inno_hdmi: Don't power up the phy after resetting
>       drm/rockchip: inno_hdmi: Split power mode setting
>       drm/rockchip: inno_hdmi: Add variant support
>       drm/rockchip: inno_hdmi: Add RK3128 support
>       drm/rockchip: inno_hdmi: Add basic mode validation
>       drm/rockchip: inno_hdmi: Drop custom fill_modes hook
>       drm/rockchip: inno_hdmi: Explicitly include drm_atomic.h
>
> Alex Deucher (20):
>       drm/amdgpu: add new INFO IOCTL query for input power
>       drm/amdgpu: move kiq_reg_write_reg_wait() out of amdgpu_virt.c
>       drm/amdgpu/pptable: convert some variable sized arrays to [] style
>       drm/amdgpu/gfx10: set UNORD_DISPATCH in compute MQDs
>       drm/amdgpu/gfx11: set UNORD_DISPATCH in compute MQDs
>       drm/amdgpu: convert some variable sized arrays to [] style
>       drm/amdgpu: update documentation on new chips
>       drm/amdgpu: fix typo in parameter description
>       drm/amdgpu/psp: update define to better align with its meaning
>       Documentation/gpu: Update documentation on drm-shared-*
>       drm: add drm_gem_object_is_shared_for_memory_stats() helper
>       drm: update drm_show_memory_stats() for dma-bufs
>       drm/amdgpu: add shared fdinfo stats
>       drm/i915: Update shared stats to use the new gem helper
>       drm/xe: Update shared stats to use the new gem helper
>       Revert "drm/amd/pm: resolve reboot exception for si oland"
>       Revert "drm/amd: Remove freesync video mode amdgpu parameter"
>       Reapply "Revert drm/amd/display: Enable Freesync Video Mode by defa=
ult"
>       drm/amd/display: handle range offsets in VRR ranges
>       drm/amdgpu: add VPE 6.1.1 discovery support
>
> Alexander Richards (2):
>       drm/amdgpu: check PS, WS index
>       drm/radeon: check PS, WS index
>
> Alexander Stein (10):
>       drm/bridge: tc358767: Use regmap_access_table for writeable registe=
rs
>       drm/bridge: tc358767: Fix order of register defines
>       drm/bridge: tc358767: Add more registers to non-writeable range
>       drm/bridge: tc358767: Sort volatile registers according to address
>       drm/bridge: tc358767: Add more volatile registers
>       drm/bridge: tc358767: Add precious register SYSSTAT
>       drm/bridge: tc358767: Add descriptions to register definitions
>       drm: panel: simple: convert LG LB070WV8 fixed mode into display tim=
ings
>       media: tc358743: register v4l2 async device only after successful s=
etup
>       drm: bridge: dw_hdmi: Set DRM bridge type
>
> Alexander Warnecke (1):
>       drm/panel: Add driver for BOE TH101MB31IG002-28A panel
>
> Allen Pan (2):
>       drm/amd/display: Add NULL-checks in dml2 assigned pipe search
>       drm/amd/display: correct static screen event mask
>
> Alvin Lee (8):
>       drm/amd/display: Add Replay IPS register for DMUB command table
>       drm/amd/display: Ensure populate uclk in bb construction
>       drm/amd/display: For FPO and SubVP/DRR configs program vmin/max sel
>       drm/amd/display: Populate invalid split index to be 0xF
>       Revert "drm/amd/display: For FPO and SubVP/DRR configs program
> vmin/max sel"
>       drm/amd/display: Update phantom pipe enable / disable sequence
>       drm/amd/display: Generalize new minimal transition path
>       drm/amd/display: Remove pixle rate limit for subvp
>
> Anatoliy Klymenko (4):
>       drm: xlnx: zynqmp_dpsub: Make drm bridge discoverable
>       drm: xlnx: zynqmp_dpsub: Fix timing for live mode
>       drm: xlnx: zynqmp_dpsub: Clear status register ASAP
>       drm: xlnx: zynqmp_dpsub: Filter interrupts against mask
>
> Andy Shevchenko (1):
>       drm/virtio: Spelling fixes
>
> AngeloGioacchino Del Regno (9):
>       drm/mediatek: dsi: Use GENMASK() for register mask definitions
>       drm/mediatek: dsi: Fix DSI RGB666 formats and definitions
>       drm/mediatek: dsi: Cleanup functions mtk_dsi_ps_control{_vact}()
>       drm/mediatek: dsi: Use bitfield macros where useful
>       drm/mediatek: dsi: Replace open-coded instance of HZ_PER_MHZ
>       drm/mediatek: dsi: Register DSI host after acquiring clocks and PHY
>       drm/mediatek: dsi: Simplify with dev_err_probe and remove gotos
>       drm/mediatek: dsi: Compress of_device_id entries and add sentinel
>       drm/mediatek: dsi: Use mipi_dsi_pixel_format_to_bpp() helper functi=
on
>
> Anirban Sk (1):
>       drm/i915/selftests: Increasing the sleep time for live_rc6_manual
>
> Ankit Nautiyal (1):
>       drm/i915/dp: Fix the max DSC bpc supported by source
>
> Anthony Koo (2):
>       drm/amd/display: [FW Promotion] Release 0.0.201.0
>       drm/amd/display: [FW Promotion] Release 0.0.202.0
>
> Aric Cyr (8):
>       drm/amd/display: Promote DAL to 3.2.268
>       drm/amd/display: Promote DAL to 3.2.269
>       drm/amd/display: Unify optimize_required flags and VRR adjustments
>       drm/amd/display: 3.2.270
>       drm/amd/display: 3.2.271
>       drm/amd/display: 3.2.272
>       drm/amd/display: Fix nanosec stat overflow
>       drm/amd/display: 3.2.273
>
> Armin Wolf (1):
>       drm/amd/display: Fix memory leak in dm_sw_fini()
>
> Arnd Bergmann (4):
>       drm/xe: circumvent bogus stringop-overflow warning
>       drm/xe: avoid function cast warnings
>       drm/xe/kunit: fix link failure with built-in xe
>       drm/xe/xe2: fix 64-bit division in pte_update_size
>
> Arunpravin Paneer Selvam (1):
>       drm/amdgpu: Enable seq64 manager and fix bugs
>
> Asad Kamal (5):
>       Revert "drm/amdgpu: Add pci usage to nbio v7.9"
>       Revert "drm/amdgpu: Add pcie usage callback to nbio"
>       drm/amdgpu: Remove pcie bw sys entry
>       drm/amd/pm: Skip reporting pcie width/speed on vfs
>       drm/amd/pm: Fix esm reg mask use to get pcie speed
>
> Ashutosh Dixit (2):
>       drm/xe/xe_gt_idle: Drop redundant newline in name
>       drm/xe: Fix modpost warning on xe_mocs kunit module
>
> Aurabindo Pillai (1):
>       drm/amd: Update atomfirmware.h for DCN401
>
> Avri Kehat (1):
>       accel/habanalabs: fix debugfs files permissions
>
> Badal Nilawar (3):
>       drm/xe/dgfx: Release mmap mappings on rpm suspend
>       drm/xe/xe_debugfs: Print skip_guc_pc in xe info
>       drm/hwmon: Fix abi doc warnings
>
> Bhanuprakash Modem (1):
>       drm/i915/display/debugfs: New entry "DRRS capable" to i915_drrs_sta=
tus
>
> Biju Das (6):
>       dt-bindings: display: Document Renesas RZ/G2L DU bindings
>       dt-bindings: display: renesas,rzg2l-du: Document RZ/V2L DU bindings
>       drm: renesas: Add RZ/G2L DU Support
>       MAINTAINERS: Update entries for Renesas DRM drivers
>       MAINTAINERS: Create entry for Renesas RZ DRM drivers
>       drm: renesas: rz-du: Fix redefinition errors related to rzg2l_du_vs=
p_*()
>
> Bjorn Helgaas (1):
>       drm/amdgpu: remove misleading amdgpu_pmops_runtime_idle() comment
>
> Brian Masney (1):
>       fbdev/simplefb: change loglevel when the power domains cannot be pa=
rsed
>
> Brian Welty (7):
>       drm/xe: Fix guc_exec_queue_set_priority
>       drm/xe: Fix modifying exec_queue priority in xe_migrate_init
>       drm/xe: Refactor __xe_exec_queue_create()
>       drm/xe: Add exec_queue.sched_props.job_timeout_ms
>       drm/xe: Finish refactoring of exec_queue_create
>       drm/xe: Remove set_job_timeout_ms() from exec_queue_ops
>       drm/xe: Fix bounds checking in __xe_bo_placement_for_flags()
>
> Camille Cho (1):
>       drm/amd/display: correct comment in set_default_brightness_aux()
>
> Candice Li (3):
>       drm/amdgpu: Do bad page retirement for deferred errors
>       drm/amdgpu: Log deferred error separately
>       drm/amd/pm: Retrieve UMC ODECC error count from aca bank
>
> Charlene Liu (8):
>       drm/amd/display: Add logging resource checks
>       drm/amd/display: Update P010 scaling cap
>       drm/amd/display: Revert "Rework DC Z10 restore"
>       Revert "drm/amd/display: initialize all the dpm level's stutter lat=
ency"
>       drm/amd/display: fix USB-C flag update after enc10 feature init
>       drm/amd/display: fix DP audio settings
>       drm/amd/display: enable fgcg by default
>       drm/amd/display: allow psr-su/replay for z8
>
> Chen Haonan (2):
>       drm/nouveau/disp: switch to use kmemdup() helper
>       drm/panel: Simplify with dev_err_probe()
>
> Chen Ni (1):
>       drm/tegra: dsi: Add missing check for of_find_device_by_node
>
> Chris Morgan (4):
>       dt-bindings: display: Add Powkiddy RGB10MAX3 panel
>       drm/panel: st7703: Add Powkiddy RGB10MAX3 Panel Support
>       dt-bindings: display: rocktech,jh057n00900: Document panel rotation
>       drm/panel: st7703: Add Panel Rotation Support
>
> Christian Gmeiner (2):
>       drm/etnaviv: add sensitive state for PE_RT_ADDR_4_PIPE(3, 0|1) addr=
ess
>       drm/etnaviv: Restore some id values
>
> Christian K=C3=B6nig (6):
>       drm/amdgpu: revert "Adjust removal control flow for smu v13_0_2"
>       drm/vmwgfx: remove vmw_vram_gmr_placement
>       drm/ttm: return ENOSPC from ttm_bo_mem_space v3
>       drm/i915: fix applying placement flag
>       drm/amdgpu: cleanup conditional execution
>       drm/amdgpu: workaround to avoid SET_Q_MODE packets v2
>
> Christophe JAILLET (9):
>       drm/tegra: dsi: Fix some error handling paths in tegra_dsi_probe()
>       drm/tegra: dsi: Fix missing pm_runtime_disable() in the error
> handling path of tegra_dsi_probe()
>       drm/tegra: hdmi: Fix some error handling paths in tegra_hdmi_probe(=
)
>       drm/tegra: rgb: Fix some error handling paths in tegra_dc_rgb_probe=
()
>       drm/tegra: rgb: Fix missing clk_put() in the error handling
> paths of tegra_dc_rgb_probe()
>       drm/tegra: output: Fix missing i2c_put_adapter() in the error
> handling paths of tegra_output_probe()
>       drm/amd/display: Fix a switch statement in
> populate_dml_output_cfg_from_stream_state()
>       drm/amdgpu: Remove usage of the deprecated ida_simple_xx() API
>       drm/xe/guc: Remove usage of the deprecated ida_simple_xx() API
>
> ChunTao Tso (1):
>       drm/amd/display: Replay + IPS + ABM in Full Screen VPB
>
> Colin Ian King (4):
>       drm/xe: Fix spelling mistake "gueue" -> "queue"
>       gpu: host1x: remove redundant assignment to variable space
>       drm/msm/dp: Fix spelling mistake "enale" -> "enable"
>       accel/habanalabs/goya: remove redundant assignment to pointer 'inpu=
t'
>
> Connor Abbott (4):
>       drm/msm: Import a7xx crashdump register lists from kgsl
>       drm/msm: Fix snapshotting a7xx indexed regs
>       drm/msm: More fully implement devcoredump for a7xx
>       drm/msm: Fix page fault client detection on a660 family and a7xx
>
> Dafna Hirschfeld (2):
>       drm/xe: Do not include current dir for generated/xe_wa_oob.h
>       drm/xe: Replace 'grouped target' in Makefile with pattern rule
>
> Dan Carpenter (6):
>       drm/xe/device: clean up on error in probe()
>       drm/xe/selftests: Fix an error pointer dereference bug
>       drm/xe: unlock on error path in xe_vm_add_compute_exec_queue()
>       drm/amd/display: Fix && vs || typos
>       firmware/sysfb: fix an error code in sysfb_init()
>       drm/imx/dcss: fix resource size calculation
>
> Dani Liberman (4):
>       drm/xe/irq: allocate all possible msix interrupts
>       accel/habanalabs/gaudi2: add interrupt affinity for user interrupts
>       accel/habanalabs: remove call to deprecated function
>       accel/habanalabs: fix error print
>
> Daniel Vetter (4):
>       Merge tag 'drm-misc-next-2024-02-22' of
> git://anongit.freedesktop.org/drm/drm-misc into drm-next
>       Merge tag 'drm-xe-next-2024-02-25' of
> ssh://gitlab.freedesktop.org/drm/xe/kernel into drm-next
>       Merge tag 'drm-habanalabs-next-2024-02-26' of
> https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux into
> drm-next
>       Merge v6.8-rc6 into drm-next
>
> Daniele Ceraolo Spurio (3):
>       drm/xe/guc: Use FAST_REQUEST for non-blocking H2G messages
>       drm/xe/gsc: Initialize GSC proxy
>       drm/xe/gsc: add support for GSC proxy interrupt
>
> Danila Tikhonov (1):
>       drm/msm/adreno: Add support for SM7150 SoC machine
>
> Dario Binacchi (7):
>       drm/bridge: samsung-dsim: check the return value only if necessary
>       drm/debugfs: drop unneeded DEBUG_FS guard
>       dt-bindings: nt35510: add compatible for FRIDA FRD400B25025-A-CTK
>       drm/panel: nt35510: move hardwired parameters to configuration
>       drm/panel: nt35510: support FRIDA FRD400B25025-A-CTK
>       drm: bridge: samsung-dsim: enter display mode in the enable() callb=
ack
>       drm: bridge: samsung-dsim: complete the CLKLANE_STOP setting
>
> Dave Airlie (19):
>       Merge tag 'drm-misc-next-2024-01-11' of
> git://anongit.freedesktop.org/drm/drm-misc into drm-next
>       Merge tag 'drm-misc-next-2024-02-08' of
> git://anongit.freedesktop.org/drm/drm-misc into drm-next
>       Merge tag 'amd-drm-next-6.9-2024-02-09' of
> https://gitlab.freedesktop.org/agd5f/linux into drm-next
>       Merge tag 'drm-intel-next-2024-02-07' of
> git://anongit.freedesktop.org/drm/drm-intel into drm-next
>       Merge tag 'drm-intel-gt-next-2024-02-15' of
> git://anongit.freedesktop.org/drm/drm-intel into drm-next
>       Merge tag 'drm-misc-next-2024-02-15' of
> git://anongit.freedesktop.org/drm/drm-misc into drm-next
>       Merge tag 'amd-drm-next-6.9-2024-02-19' of
> https://gitlab.freedesktop.org/agd5f/linux into drm-next
>       Merge tag 'drm-intel-next-2024-02-27-1' of
> git://anongit.freedesktop.org/drm/drm-intel into drm-next
>       Merge tag 'drm-intel-gt-next-2024-02-28' of
> git://anongit.freedesktop.org/drm/drm-intel into drm-next
>       Merge tag 'drm-misc-next-2024-02-29' of
> https://anongit.freedesktop.org/git/drm/drm-misc into drm-next
>       Merge tag 'mediatek-drm-next-6.9' of
> https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux
> into drm-next
>       Merge tag 'drm-msm-next-2024-02-29' of
> https://gitlab.freedesktop.org/drm/msm into drm-next
>       Merge tag 'drm-misc-next-fixes-2024-02-29' of
> https://anongit.freedesktop.org/git/drm/drm-misc into drm-next
>       Merge tag 'amd-drm-next-6.9-2024-03-01' of
> https://gitlab.freedesktop.org/agd5f/linux into drm-next
>       Merge tag 'drm-misc-next-fixes-2024-03-07' of
> https://anongit.freedesktop.org/git/drm/drm-misc into drm-next
>       Merge tag 'drm-xe-next-fixes-2024-03-04' of
> ssh://gitlab.freedesktop.org/drm/xe/kernel into drm-next
>       Merge tag 'drm-etnaviv-next-2024-03-07' of
> https://git.pengutronix.de/git/lst/linux into drm-next
>       Merge tag 'drm-msm-next-2024-03-07' of
> https://gitlab.freedesktop.org/drm/msm into drm-next
>       Merge tag 'amd-drm-next-6.9-2024-03-08-1' of
> https://gitlab.freedesktop.org/agd5f/linux into drm-next
>
> David McFarland (1):
>       drm/amd: Don't init MEC2 firmware when it fails to load
>
> Devarsh Thakkar (1):
>       dt-bindings: display: ti,am65x-dss: Add support for common1 region
>
> Dillon Varone (1):
>       drm/amd/display: Init link enc resources in dc_state only if
> res_pool presents
>
> Dmitry Baryshkov (43):
>       drm/msm/dsi: do not store internal bridge pointer
>       drm/msm/dsi: drop msm_dsi_device_connected() function
>       drm/msm/dsi: stop calling set_split_display
>       drm/msm/dsi: remove msm_dsi::encoder
>       drm/msm/mdp5: drop split display support
>       drm/msm/dp: drop unused parser definitions
>       drm/msm/dp: drop unused fields from dp_power_private
>       drm/msm/dp: parse DT from dp_parser_get
>       drm/msm/dp: inline dp_power_(de)init
>       drm/msm/dp: fold dp_power into dp_ctrl module
>       drm/msm/dp: simplify stream clocks handling
>       drm/msm/dp: stop parsing clock names from DT
>       drm/msm/dp: split dp_ctrl_clk_enable into four functuions
>       drm/msm/dp: move phy_configure_opts to dp_ctrl
>       drm/msm/dp: remove PHY handling from dp_catalog.c
>       drm/msm/dp: handle PHY directly in dp_ctrl
>       drm/msm/dp: move all IO handling to dp_catalog
>       drm/msm/dp: move link property handling to dp_panel
>       drm/msm/dp: move next_bridge handling to dp_display
>       drm/msm/dp: drop dp_parser
>       drm/msm/dpu: split irq_control into irq_enable and _disable
>       drm/msm/dpu: split _dpu_encoder_resource_control_helper()
>       drm/msm/dpu: drop dpu_encoder_phys_ops.atomic_mode_set
>       drm/msm/dpu: move writeback's atomic_check to dpu_writeback.c
>       drm/msm/dpu: drop dpu_encoder_phys_ops::atomic_check()
>       drm/msm/dsi: Document DSC related pclk_rate and hdisplay calculatio=
ns
>       drm: ci: use clk_ignore_unused for apq8016
>       drm/msm/mdss: generate MDSS data for MDP5 platforms
>       drm/msm/dpu: support binding to the mdp5 devices
>       drm/msm: add a kernel param to select between MDP5 and DPU drivers
>       drm/msm/dpu: add support for SDM660 and SDM630 platforms
>       drm/msm/dpu: finalise global state object
>       drm/msm/dpu: drop global_state_lock
>       drm/msm/mdp5: migrate SMP dumping to using atomic_print_state
>       drm/msm/mdp5: drop global_state_lock
>       drm/ci: skip suspend tests for both msm-sc7180 machines
>       drm/ci: update IGT test names
>       drm/ci: update msm-apq8096-fails list
>       drm/ci: mark universal-plane-sanity as failing on SC7180
>       drm/msm/a6xx: specify UBWC config for sc7180
>       drm/msm/dpu: make "vblank timeout" more useful
>       drm/msm/dpu: split dpu_encoder_wait_for_event into two functions
>       drm/msm/dpu: capture snapshot on the first commit_done timeout
>
> Dmytro Laktyushkin (2):
>       drm/amd/display: Fix dml2 assigned pipe search
>       drm/amd/display: Fix DPSTREAM CLK on and off sequence
>
> Donald Robson (1):
>       MAINTAINERS: Remove Donald Robson from powervr driver maintainers
>
> Douglas Anderson (2):
>       drm/panel: boe-tv101wum-nl6: make use of prepare_prev_first
>       drm/dp: Don't attempt AUX transfers when eDP panels are not powered
>
> Eric Huang (1):
>       amd/amdkfd: remove unused parameter
>
> Eric Yang (1):
>       drm/amd/display: fix invalid reg access on DCN35 FPGA
>
> Erick Archer (3):
>       drm/i915: Add flex arrays to struct i915_syncmap
>       drm/xe: Prefer struct_size over open coded arithmetic
>       accel/habanalabs: use kcalloc() instead of kzalloc()
>
> Erico Nunes (8):
>       drm/lima: reset async_reset on pp hard reset
>       drm/lima: reset async_reset on gp hard reset
>       drm/lima: set pp bus_stop bit before hard reset
>       drm/lima: set gp bus_stop bit before hard reset
>       drm/lima: handle spurious timeouts due to high irq latency
>       drm/lima: remove guilty drm_sched context handling
>       drm/lima: increase default job timeout to 10s
>       drm/lima: standardize debug messages by ip name
>
> Erik Kurzinger (3):
>       drm/syncobj: call drm_syncobj_fence_add_wait when WAIT_AVAILABLE
> flag is set
>       drm/syncobj: reject invalid flags in drm_syncobj_find_fence
>       drm/syncobj: call might_sleep before waiting for fence submission
>
> Ethan Bitnun (3):
>       drm/amd/display: Add delay before logging clks from hw
>       drm/amd/display: Adjust set_p_state calls to fix logging
>       drm/amd/display: Only log during optimize_bandwidth call
>
> Fangzhi Zuo (2):
>       drm/amd/display: Fix dcn35 8k30 Underflow/Corruption Issue
>       drm/amd/display: Fix MST Null Ptr for RV
>
> Farah Kassabri (2):
>       accel/habanalabs/gaudi2: move HMMU page tables to device memory
>       accel/habanalabs: remove hop size from asic properties
>
> Fedor Pchelkin (1):
>       drm/tegra: put drm_gem_object ref on error in tegra_fb_create
>
> Fei Yang (2):
>       drm/xe: correct the calculation of remaining size
>       drm/xe: correct the assertion for number of PTEs
>
> Felix Kuehling (5):
>       drm/amdgpu: Auto-validate DMABuf imports in compute VMs
>       drm/amdkfd: Bump KFD ioctl version
>       drm/amdgpu: Remove unnecessary NULL check
>       drm/amdgpu: Reduce VA_RESERVED_BOTTOM to 64KB
>       drm/amdkfd: Relocate TBA/TMA to opposite side of VM hole
>
> Flora Cui (1):
>       drm/amdkfd: init drm_client with funcs hook
>
> Friedrich Vock (1):
>       drm/amdgpu: Reset IH OVERFLOW_CLEAR bit
>
> Fudongwang (2):
>       drm/amd/display: Add GART memory support for dmcub
>       drm/amd/display: refine code for dmcub inbox1 ring buffer debug
>
> Gabe Teeger (1):
>       Revert "drm/amd/display: Send DTBCLK disable message on first commi=
t"
>
> Geert Uytterhoeven (1):
>       drm: Spelling s/hardward/hardware/g
>
> George Shen (5):
>       drm/amd/display: Add DP audio BW validation
>       drm/amd/display: Add debug option to force 1-tap chroma subsampling
>       drm/amd/display: Add left edge pixel for YCbCr422/420 + ODM pipe sp=
lit
>       Revert "drm/amd/display: Add left edge pixel for YCbCr422/420 +
> ODM pipe split"
>       drm/amd/display: Check DP Alt mode DPCS state via DMUB
>
> Ghanshyam Agrawal (1):
>       drm/vmwgfx: Fix typos in vmwgfx_execbuf.c
>
> GuoHua Chen (34):
>       drm/radeon: Clean up errors in si_dpm.c
>       drm/radeon/trinity_dpm: Clean up errors in trinity_dpm.c
>       drm/radeon: Clean up errors in trinity_dpm.c
>       drm/radeon: Clean up errors in radeon_atpx_handler.c
>       drm/radeon/r100: Clean up errors in r100.c
>       drm/radeon: Clean up errors in r600_dpm.h
>       drm/radeon: Clean up errors in ni.c
>       drm/radeon/dpm: Clean up errors in sumo_dpm.c
>       drm/radeon/ni_dpm: Clean up errors in ni_dpm.c
>       drm/radeon: Clean up errors in ni_dpm.c
>       drm/radeon: Clean up errors in smu7_discrete.h
>       drm/radeon/rv770: Clean up errors in rv770_dpm.c
>       drm/radeon/dpm: Clean up errors in trinity_dpm.h
>       drm/radeon/btc_dpm: Clean up errors in btc_dpm.c
>       drm/radeon/kms: Clean up errors in rv6xx_dpm.h
>       drm/radeon: Clean up errors in radeon_asic.c
>       drm/radeon: Clean up errors in uvd_v1_0.c
>       drm/radeon: Clean up errors in radeon_audio.h
>       drm/radeon: Clean up errors in rs400.c
>       drm/radeon: Clean up errors in radeon_audio.c
>       drm/radeon: Clean up errors in si_dpm.h
>       drm/radeon: Clean up errors in rs600.c
>       drm/radeon: Clean up errors in r600.c
>       drm/radeon/ci_dpm: Clean up errors in ci_dpm.c
>       drm/radeon: Clean up errors in rv770_smc.h
>       drm/radeon: Clean up errors in evergreen.c
>       gpu/drm/radeon: Clean up errors in evergreen.c
>       drm/radeon: Clean up errors in kv_smc.c
>       drm/radeon: Clean up errors in evergreen_reg.h
>       drm/radeon: Clean up errors in radeon_mode.h
>       drm/radeon: Clean up errors in rv515.c
>       drm/radeon: Clean up errors in r600_dpm.c
>       drm/radeon/kms: Clean up errors in smu7_fusion.h
>       drm/radeon/kms: Clean up errors in smu7.h
>
> Gustavo Sousa (6):
>       drm/i915/cdclk: Remove divider field from tables
>       drm/i915/xe2lpd: Update bxt_sanitize_cdclk()
>       drm/i915/cdclk: Extract bxt_cdclk_ctl()
>       drm/i915/cdclk: Reorder bxt_sanitize_cdclk()
>       drm/i915/cdclk: Re-use bxt_cdclk_ctl() when sanitizing
>       drm/i915: Update ADL-N PCI IDs
>
> Hamza Mahfooz (9):
>       drm/amd/display: add panel_power_savings sysfs entry to eDP connect=
ors
>       drm/amdgpu: make damage clips support configurable
>       drm/amdgpu: respect the abmlevel module parameter value if it is se=
t
>       drm/amd/display: add DCN351 version identifiers
>       drm/amd: add register headers for DCN351
>       drm/amd/display: add DMUB source files and changes for DCN351
>       drm/amd/display: add DCN351 IRQ changes
>       drm/amd/display: add DC changes for DCN351
>       drm/amd/display: add amdgpu_dm support for DCN351
>
> Haridhar Kalvala (1):
>       drm/i915/mtl: Add fake PCH for Meteor Lake
>
> Harish Chegondi (1):
>       drm/i915/xelpg: Extend driver code of Xe_LPG to Xe_LPG+
>
> Harry Wentland (4):
>       drm: Don't treat 0 as -1 in drm_fixp2int_ceil
>       drm/vkms: Create separate Kconfig file for VKMS
>       drm/vkms: Avoid reading beyond LUT array
>       drm/amd/display: Add dpp_get_gamut_remap functions
>
> Hawking Zhang (23):
>       drm/amdgpu: Replace DRM_* with dev_* in amdgpu_psp.c
>       drm/amdgpu: drop psp v13 query_boot_status implementation
>       drm/amdgpu: Init pcie_index/data address as fallback (v2)
>       drm/amdgpu: Add ras helper to query boot errors v2
>       drm/amdgpu: Query boot status if discovery failed
>       drm/amdgpu: Query boot status if boot failed
>       drm/amdgpu: Align ras block enum with firmware
>       drm/amdgpu: Query ras capablity from psp v2
>       drm/amdgpu: Centralize ras cap query to amdgpu_ras_check_supported
>       drm/amdgpu: Fix null pointer dereference
>       drm/amdgpu: Update boot time errors polling sequence
>       drm/amdgpu: Add athub v4_1_0 ip headers (v5)
>       drm/amdgpu: Add athub v4_1_0 ip block support
>       drm/amdgpu: Add lsdma v7_0_0 ip headers (v3)
>       drm/amdgpu: Add osssys v7_0_0 ip headers (v4)
>       drm/amdgpu: Add hdp v7_0_0 ip headers (v3)
>       drm/amdgpu: Add vcn v5_0_0 ip headers (v5)
>       drm/amdgpu: Add mp v14_0_2 ip headers (v5)
>       drm/amdgpu: Add psp v14_0 ip block support
>       drm/amdgpu: Do not toggle bif ras irq from guest
>       drm/amdgpu: Add nbif v6_3_1 ip headers (v5)
>       drm/amdgpu: Add pcie v6_1_0 ip headers (v5)
>       drm/amdgpu: Add nbif v6_3_1 ip block support
>
> Heiko Stuebner (5):
>       dt-bindings: vendor-prefixes: add prefix for admatec GmbH
>       dt-bindings: display: panel-lvds: Add compatible for admatec 990437=
0 panel
>       drm/panel: ltk500hd1829: make room for more similar panels
>       dt-bindings: display: ltk500hd1829: add variant compatible for
> ltk101b4029w
>       drm/panel: ltk500hd1829: add panel type for ltk101b4029w
>
> Hersen Wu (1):
>       drm/amd/display: add debugfs disallow edp psr
>
> Himal Prasad Ghimiray (1):
>       drm/xe/xe2: Use XE_CACHE_WB pat index
>
> Hsiao Chien Sung (3):
>       drm/mediatek: Add Padding to OVL adaptor
>       drm/mediatek: Support MT8188 VDOSYS1 in display driver
>       drm/mediatek: Filter modes according to hardware capability
>
> Hsin-Yi Wang (3):
>       drm/panel-edp: use put_sync in unprepare
>       Revert "drm/panel-edp: Add auo_b116xa3_mode"
>       drm/mediatek: Fix a null pointer crash in mtk_drm_crtc_finish_page_=
flip
>
> Huacai Chen (1):
>       drm/loongson: Error out if no VRAM detected
>
> Huang Rui (1):
>       drm/virtio: add definition for venus capset
>
> Ian Forbes (1):
>       drm/vmwgfx: Add SVGA_3D_CMD_DEFINE_GB_SURFACE_V4 to command array.
>
> Ilpo J=C3=A4rvinen (2):
>       drm/radeon: Use RMW accessors for changing LNKCTL2
>       drm/amdgpu: Use RMW accessors for changing LNKCTL2
>
> Ilya Bakoulin (1):
>       drm/amd/display: Clear OPTC mem select on disable
>
> Imre Deak (36):
>       drm/i915/dp: Fix the PSR debugfs entries wrt. MST connectors
>       drm/i915: Init DRM connector polled field early
>       drm/i915: Keep the connector polled state disabled after storm
>       drm/i915: Move audio deinit after disabling polling
>       drm/i915: Disable intel HPD poll after DRM poll init/enable
>       drm/i915: Suspend the framebuffer console during driver shutdown
>       drm/i915: Suspend the framebuffer console earlier during system sus=
pend
>       drm/i915: Prevent modesets during driver init/shutdown
>       drm/i915: Disable hotplug detection works during driver init/shutdo=
wn
>       drm/i915: Disable hotplug detection handlers during driver init/shu=
tdown
>       drm/i915: Add intel_digital_port lock/unlock hooks
>       drm/i915: Filter out glitches on HPD lines during hotplug detection
>       drm/i915/dp: Abort AUX on disconnected native DP ports
>       drm/i915: Prevent HW access during init from SDVO TV get_modes hook
>       drm/i915: Prevent HW access during init from connector get_modes ho=
oks
>       drm/dp: Add drm_dp_max_dprx_data_rate()
>       drm/dp: Add support for DP tunneling
>       drm/i915: Fix display bpp limit computation during system resume
>       drm/i915/dp: Add support to notify MST connectors to retry modesets
>       drm/i915/dp: Use drm_dp_max_dprx_data_rate()
>       drm/i915/dp: Factor out intel_dp_config_required_rate()
>       drm/i915/dp: Export intel_dp_max_common_rate/lane_count()
>       drm/i915/dp: Factor out intel_dp_update_sink_caps()
>       drm/i915/dp: Factor out intel_dp_read_dprx_caps()
>       drm/i915/dp: Add intel_dp_max_link_data_rate()
>       drm/i915/dp: Sync instead of try-sync commits when getting active p=
ipes
>       drm/i915/dp: Add support for DP tunnel BW allocation
>       drm/i915/dp: Add DP tunnel atomic state and check BW limit
>       drm/i915/dp: Account for tunnel BW limit in intel_dp_max_link_data_=
rate()
>       drm/i915/dp: Compute DP tunnel BW during encoder state computation
>       drm/i915/dp: Allocate/free DP tunnel BW during modeset
>       drm/i915/dp: Handle DP tunnel IRQs
>       drm/i915/dp: Call intel_dp_sync_state() always for DDI DP encoders
>       drm/i915/dp: Suspend/resume DP tunnels
>       drm/i915/dp: Read DPRX for all long HPD pulses
>       drm/i915/dp: Enable DP tunnel BW allocation mode
>
> Jacek Lawrynowicz (5):
>       accel/ivpu: Rename TILE_SKU_BOTH_MTL to TILE_SKU_BOTH
>       accel/ivpu: Remove legacy firmware name
>       accel/ivpu: Update FW API headers
>       accel/ivpu: Fix ivpu_reset_engine_fn merge issue
>       accel/ivpu: Rename VPU to NPU in message strings
>
> Jani Nikula (91):
>       drm/edid: replace __attribute__((packed)) with __packed
>       drm/ioc32: replace __attribute__((packed)) with __packed
>       drm/tegra: include drm/drm_edid.h only where needed
>       drm/i915/hdcp: unify connector logging format
>       drm/i915/hdcp: fix intel_hdcp_get_repeater_ctl() error return value
>       drm/i915/bios: remove some unused leftover declarations
>       drm/edid: prefer forward declarations over includes in drm_edid.h
>       drm/i915: don't make assumptions about intel_wakeref_t type
>       drm/i915/irq: use DISPLAY_VER instead of GRAPHICS_VER
>       drm/i915/dmc: use DISPLAY_VER instead of GRAPHICS_VER
>       drm/i915/hdcp: use DISPLAY_VER instead of GRAPHICS_VER
>       drm/i915/display: use IS_DISPLAY_VER instead of IS_GRAPHICS_VER
>       drm/i915/tv: use DISPLAY_VER instead of GRAPHICS_VER
>       drm/i915: don't make assumptions about intel_wakeref_t type
>       drm/mgag200: convert get modes to struct drm_edid
>       drm/probe-helper: remove unused drm_connector_helper_get_modes_from=
_ddc()
>       drm/nouveau: include drm/drm_edid.h only where needed
>       drm/hisilicon: include drm/drm_edid.h only where needed
>       drm/xe: display support should not depend on EXPERT
>       Merge drm/drm-next into drm-intel-next
>       drm/i915/bios: move i915_vbt debugfs to intel_bios.c
>       drm/i915/opregion: move i915_opregion debugfs to intel_opregion.c
>       drm/i915/opregion: abstract getting the opregion VBT
>       drm/i915/opregion: abstract ASLE presence check
>       drm/i915/gvt: use local INTEL_GVT_OPREGION_SIZE
>       drm/i915/opregion: make struct intel_opregion opaque
>       ASoC: hdmi-codec: drop drm/drm_edid.h include
>       drm/i915/opregion: remove unused lid_state
>       drm/xe: make xe_ttm_funcs const
>       drm/xe: make heci_gsc_irq_chip const
>       drm/xe: make hwmon_info const
>       drm/xe: make gpuvm_ops const
>       drm/xe: constify engine class sysfs attributes
>       drm/xe: don't build debugfs files when CONFIG_DEBUG_FS=3Dn
>       drm/amdgpu: prefer snprintf over sprintf
>       drm/imx: prefer snprintf over sprintf
>       drm/xe: move xe_display.[ch] under display/
>       drm/xe: drop display/ subdir from include directories
>       drm/nouveau/acr/ga102: remove unused but set variable
>       drm/nouveau/svm: remove unused but set variables
>       drm/bridge: add ->edid_read hook and drm_bridge_edid_read()
>       drm/bridge: switch to drm_bridge_edid_read()
>       drm/bridge: chrontel-ch7033: switch to drm_bridge_edid_read()
>       drm/bridge: lt8912b: use drm_bridge_edid_read()
>       drm/bridge: lt8912b: clear the EDID property on failures
>       drm/bridge: lt8912b: use ->edid_read callback
>       drm/bridge: lt9611uxc: use drm_bridge_edid_read()
>       drm: bridge: simple-bridge: use drm_bridge_edid_read()
>       drm: bridge: simple-bridge: clear the EDID property on failures
>       drm/bridge: tfp410: use drm_bridge_edid_read()
>       drm/bridge: tfp410: clear the EDID property on failures
>       drm/meson: switch to drm_bridge_edid_read()
>       drm/bridge: remove drm_bridge_get_edid() in favour of
> drm_bridge_edid_read()
>       drm/bridge: anx7625: switch to ->edid_read callback
>       drm/bridge: cdns-mhdp8546: switch to ->edid_read callback
>       drm/bridge: cdns-mhdp8546: clear the EDID property on failures
>       drm/bridge: display-connector: switch to ->edid_read callback
>       drm/bridge: it6505: switch to ->edid_read callback
>       drm: bridge: it66121: switch to ->edid_read callback
>       drm/bridge: lt9611: switch to ->edid_read callback
>       drm/bridge: lt9611uxc: switch to ->edid_read callback
>       drm/bridge: megachips: switch to ->edid_read callback
>       drm/bridge: nxp-ptn3460: switch to ->edid_read callback
>       drm/bridge: sii902x: use display info is_hdmi
>       drm/bridge: sii902x: switch to ->edid_read callback
>       drm/mediatek/dp: switch to ->edid_read callback
>       drm/mediatek/hdmi: switch to ->edid_read callback
>       drm/msm/hdmi: fix indent
>       drm/msm/hdmi: switch to ->edid_read callback
>       drm/omap/hdmi4: switch to ->edid_read callback
>       drm/omap/hdmi5: switch to ->edid_read callback
>       drm: xlnx: zynqmp_dpsub: switch to ->edid_read callback
>       drm: adv7511: switch to ->edid_read callback
>       drm: bridge: dw_hdmi: switch to ->edid_read callback
>       drm: bridge: dw_hdmi: clear the EDID property and CEC address on fa=
ilures
>       drm/bridge: tc358767: update the EDID property
>       drm/bridge: tc358767: switch to ->edid_read callback
>       drm/bridge: ti-sn65dsi86: switch to ->edid_read callback
>       drm/bridge: remove ->get_edid callback
>       drm/print: make drm_err_printer() device specific by using drm_err(=
)
>       drm/print: move enum drm_debug_category etc. earlier in drm_print.h
>       drm/print: add drm_dbg_printer() for drm device specific printer
>       drm/dp_mst: switch from drm_debug_printer() to device specific
> drm_dbg_printer()
>       drm/mode: switch from drm_debug_printer() to device specific
> drm_dbg_printer()
>       drm/dp: switch drm_dp_vsc_sdp_log() to struct drm_printer
>       drm/i915: switch from drm_debug_printer() to device specific
> drm_dbg_printer()
>       drm/i915: use drm_printf() with the drm_err_printer intead of pr_er=
r()
>       drm/xe: switch from drm_debug_printer() to device specific
> drm_dbg_printer()
>       drm: remove drm_debug_printer in favor of drm_dbg_printer
>       drm/xe: use drm based debugging instead of dev
>       drm/xe: fix arguments to drm_err_printer()
>
> Javier Martinez Canillas (5):
>       dt-bindings: display: ssd1307fb: Add vendor prefix to width and hei=
ght
>       dt-bindings: display: ssd132x: Add vendor prefix to width and heigh=
t
>       dt-bindings: display: Add SSD133x OLED controllers
>       drm/ssd130x: Add support for the SSD133x OLED controller family
>       drm: Move drm_set_preferred_mode() helper from drm_edid to drm_mode=
s
>
> Jay Cornwall (1):
>       drm/amdkfd: Use S_ENDPGM_SAVED in trap handler
>
> Jeff Johnson (1):
>       accel/qaic: Constify aic100_channels
>
> Jeffrey Hugo (3):
>       accel/qaic: Fix MHI channel struct field order
>       accel/qaic: Order pci_remove() operations in reverse of probe()
>       dt-bindings: drm/bridge: ti-sn65dsi86: Fix bouncing @codeaurora add=
ress
>
> Jesse Zhang (2):
>       Revert "drm/amdgpu: remove vm sanity check from
> amdgpu_vm_make_compute" for Raven
>       drm/amdgpu: remove unused code
>
> Jessica Zhang (3):
>       drm/panel: visionox-vtdr6130: Set prepare_prev_first flag
>       dt-bindings: visionox-rm69299: Update maintainers
>       drm/panel: visionox-r66451: Set prepare_prev_first flag
>
> Jianhua Lu (1):
>       drm/panel: nt36523: Set 120Hz fps for xiaomi,elish panels
>
> Jiapeng Chong (1):
>       drm/amd/display: Simplify the calculation of variables
>
> Jiri Slaby (SUSE) (22):
>       char/agp: remove agp_bridge_data::type
>       drm/i915: remove unused intel_dvo_dev_ops hooks
>       drm/i915: remove structs intel_vgpu_pipe_format and intel_vgpu_fb_f=
ormat
>       drm/i915: remove intel_dsi::{port_bits,hs}
>       drm/i915: remove intel_gvt_gtt::{mm_alloc_page_table, mm_free_page_=
table}
>       drm/i915: remove intel_gvt_mmio_info::{device, addr_range}
>       drm/i915: remove intel_vgpu_workload::{ring_context, restore_inhibi=
t}
>       drm/i915: remove intel_vbt_panel_data::edp::initialized
>       drm/i915: remove intel_guc::ads_engine_usage_size
>       drm/i915: remove i915_drm_client::id
>       drm/i915: remove i915_perf_stream::size_exponent
>       drm/i915: remove intel_vgpu_gtt::active_ppgtt_mm_bitmap
>       drm/i915: remove intel_vgpu_fence::base
>       drm/i915: remove intel_vgpu_opregion::mapped
>       drm/i915: remove intel_vgpu::intx_trigger
>       drm/i915: remove gvt_mmio_block::device
>       drm/i915: remove intel_gvt_irq_info::warned
>       drm/i915: remove intel_gvt_event_info::policy
>       drm/i915: remove intel_gvt_irq::pending_events
>       drm/i915: remove execute_cb::signal
>       drm/i915: remove i915_vma::obj_hash
>       drm/i915: remove intel_memory_region_ops::flags
>
> Jocelyn Falempe (1):
>       drm/mgag200: Add a workaround for low-latency
>
> Johan Jonker (2):
>       dt-bindings: display: rockchip: rockchip,dw-hdmi: remove port prope=
rty
>       dt-bindings: display: rockchip,dw-hdmi: add power-domains property
>
> John Harrison (6):
>       drm/i915/huc: Allow for very slow HuC loading
>       drm/i915/guc: Avoid circular locking issue on busyness flush
>       drm/xe/uc: Include patch version in expectations
>       drm/xe/guc: Update to GuC firmware 70.19.2
>       drm/xe/guc: Add support for LNL firmware
>       drm/i915/gt: Restart the heartbeat timer when forcing a pulse
>
> Jonathan Cavitt (1):
>       drm/i915/gem: Atomically invalidate userptr on mmu-notifier
>
> Jonathan Kim (2):
>       drm/amdkfd: fill in data for control stack header for gfx10
>       drm/amdkfd: fix process reference drop on debug ioctl
>
> Joseph Greathouse (1):
>       drm/amdkfd: Add cache line sizes to KFD topology
>
> Jos=C3=A9 Roberto de Souza (15):
>       drm/xe/uapi: Remove DRM_XE_VM_BIND_FLAG_ASYNC comment left over
>       drm/i915: Disable DSB in Xe KMD
>       drm/xe: Fix definition of intel_wakeref_t
>       drm/xe: Use intel_wakeref_t in intel_runtime_pm functions
>       drm/xe: Remove double new lines in devcoredump
>       drm/xe: Change devcoredump functions parameters to xe_sched_job
>       drm/xe: Nuke xe from xe_devcoredump
>       drm/xe: Print more device information in devcoredump
>       drm/xe: Print registers spread in 2 u32 as u64
>       drm/xe: Remove additional spaces in devcoredump HW Engines section
>       drm/xe: Fix crash in trace_dma_fence_init()
>       drm/xe: Use function to emit PIPE_CONTROL
>       drm/xe: Add functions to convert regular address to canonical
> address and back
>       drm/xe: Add batch buffer addresses to devcoredump
>       drm/xe: Add uAPI to query GuC firmware submission version
>
> Jouni H=C3=B6gander (20):
>       drm/i915/display: Remove intel_crtc_state->psr_vsc
>       drm/i915/display: Move colorimetry_support from intel_psr to intel_=
dp
>       drm/i915/display: Unify VSC SPD preparation
>       drm/i915/display: Fix vsc_sdp computation
>       drm/i915/display: Ignore only psr specific part of vsc sdp
>       drm/i915/display: Read PSR configuration before VSC SDP
>       drm/i915/display: Take care of VSC select field in video dip ctl re=
gister
>       drm: Add eDP 1.5 early transport definition
>       drm/i915/psr: Extend SU area to cover cursor fully if needed
>       drm/i915/psr: Carry su area in crtc_state
>       drm/i915/psr: Calculate and configure CUR_POS_ERLY_TPT
>       drm/i915/psr: Configure PIPE_SRCSZ_ERLY_TPT for psr2 early transpor=
t
>       drm/i915/psr: Enable psr2 early transport as possible
>       drm/i915/psr: Disable early transport by default
>       drm/i915/display: No need for full modeset due to psr
>       drm/i915/psr: CAN_PSR and CAN_PANEL_REPLAY can be now local defines
>       drm/i915/alpm: Add ALPM register definitions
>       drm/i915/psr: Add alpm_parameters struct
>       drm/i915/alpm: Calculate ALPM Entry check
>       drm/i915/alpm: Alpm aux wake configuration for lnl
>
> Juan Escamilla (2):
>       drm/i915/gt: Use rc6.supported flag from intel_gt for rc6_enable sy=
sfs
>       drm/i915/gt: Reflect the true and current status of rc6_enable
>
> Juha-Pekka Heikkila (1):
>       drm/i915/display: On Xe2 always enable decompression with tile4
>
> Justin Stitt (1):
>       drm/etnaviv: Replace strncpy with strscpy_pad
>
> Karolina Stolarek (4):
>       drm/ttm/tests: Add tests for ttm_resource and ttm_sys_man
>       drm/ttm/tests: Add tests for ttm_tt
>       drm/ttm/tests: Add tests for ttm_bo functions
>       drm/ttm/tests: Fix argument in ttm_tt_kunit_init()
>
> Karthik Poosa (3):
>       drm/xe/guc: Enable WA 14018913170
>       drm/xe/guc: Reduce a print from warn to debug
>       drm/xe/hwmon: Refactor xe hwmon
>
> Kenneth Feng (1):
>       drm/amd/pm: update the power cap setting
>
> Kent Russell (1):
>       drm/amdkfd: Fix L2 cache size reporting in GFX9.4.3
>
> Khaled Almahallawy (3):
>       drm/i915/dp: Use LINK_QUAL_PATTERN_* Phy test pattern names
>       drm/i915/dp: Add TPS4 PHY test pattern support
>       drm/i915/dp: Fix passing the correct DPCD_REV for
> drm_dp_set_phy_test_pattern
>
> Koby Elbaz (1):
>       accel/habanalabs: increase HL_MAX_STR to 64 bytes to avoid warnings
>
> Konrad Dybcio (2):
>       drm/panel: novatek-nt36523: Set prepare_prev_first
>       drm/msm/adreno: Add A702 support
>
> Krystian Pradzynski (1):
>       accel/ivpu: Add support for FW boot param system_time_us
>
> Kunwu Chan (4):
>       drm/amdgpu: Simplify the allocation of fence slab caches
>       drm/amdgpu: Simplify the allocation of mux_chunk slab caches
>       drm/amdgpu: Simplify the allocation of sync slab caches
>       drm/scheduler: Simplify the allocation of slab caches in
> drm_sched_fence_slab_init
>
> Kuogee Hsieh (3):
>       drm/msm/dpu: improve DSC allocation
>       drm/msm/dp: remove mdss_dp_test_bit_depth_to_bpc()
>       drm/msm/dpu: add support of new peripheral flush mechanism
>
> Lang Yu (6):
>       drm/amdkfd: reserve the BO before validating it
>       drm/amdgpu/vpe: add multi instance VPE support
>       drm/amdgpu/vpe: add PRED_EXE and COLLAB_SYNC OPCODE
>       drm/amdgpu/vpe: add collaborate mode support for VPE
>       drm/amdgpu/vpe: don't emit cond exec command under collaborate mode
>       drm/amdgpu/vpe: add VPE 6.1.1 support
>
> Laurent Morichetti (3):
>       drm/amdkfd: pass debug exceptions to second-level trap handler
>       drm/amdkfd: Increase the size of the memory reserved for the TBA
>       drm/amdkfd: Use SQC when TCP would fail in gfx10.1 context save
>
> Le Ma (1):
>       drm/amdgpu: move the drm client creation behind drm device registra=
tion
>
> Lenko Donchev (1):
>       drm/amd/display: Use kcalloc() instead of kzalloc()
>
> Leo (Hanghong) Ma (1):
>       drm/amd/display: Fix timing bandwidth calculation for HDMI
>
> Lewis Huang (1):
>       drm/amd/display: Only allow dig mapping to pwrseq in new asic
>
> Li Ma (2):
>       drm/amdgpu: remove asymmetrical irq disabling in jpeg 4.0.5 suspend
>       drm/amd/swsmu: modify the gfx activity scaling
>
> Lijo Lazar (10):
>       drm/amdgpu: Avoid fetching vram vendor information
>       drm/amdgpu: Show vram vendor only if available
>       drm/amd/pm: Fetch current power limit from FW
>       drm/amdgpu: Avoid fetching VRAM vendor info
>       drm/amdgpu: Fix HDP flush for VFs on nbio v7.9
>       drm/amd/pm: Allow setting max UCLK on SMU v13.0.6
>       drm/amdgpu: Add fatal error detected flag
>       drm/amdkfd: Skip packet submission on fatal error
>       drm/amdkfd: Add partition id field to location_id
>       drm/amd/pm: Increase SMUv13.0.6 mode-2 reset time
>
> Likun Gao (17):
>       drm/amd/swsmu: add judgement for vcn jpeg dpm set
>       drm/amdgpu: skip ucode bo reserve for RLC AUTOLOAD
>       drm/amdgpu: support rlc auotload type set
>       drm/amdgpu: Add lsdma v7_0 ip block support
>       drm/amdgpu/discovery: Add lsdma v7_0 ip block
>       drm/amdgpu: Add ih v7_0 ip block support
>       drm/amdgpu/discovery: Add ih v7_0 ip block
>       drm/amdgpu: Add hdp v7_0 ip block support
>       drm/amdgpu/discovery: Add hdp v7_0 ip block
>       drm/amdgpu: use spirom update wait_for helper for psp v14
>       drm/amdgpu: support psp ip block for psp v14
>       drm/amdgpu/psp: set autoload support by default
>       drm/amdgpu/psp: handle TMR type via flag
>       drm/amdgpu/psp: set boot_time_tmr flag
>       drm/amdgpu: add psp_timeout to limit PSP related operation
>       drm/amdgpu: support psp ip block discovery for psp v14
>       drm/amdgpu/discovery: add nbif v6_3_1 ip block
>
> Luca Weiss (4):
>       dt-bindings: display: panel: Add Himax HX83112A
>       drm/panel: Add driver for DJN HX83112A LCD panel
>       dt-bindings: display/msm: gpu: Allow multiple digits for patchid
>       drm/msm/adreno: Add A305B support
>
> Lucas De Marchi (21):
>       drm/xe: Fix warning on impossible condition
>       drm/xe: Disable 32bits build
>       drm/xe/xe2: Add workaround 16020183090
>       drm/xe/kunit: Drop xe_wa tests for pre-production DG2
>       drm/xe: Group normal kunit tests in a single module
>       drm/i915: Drop -Wstringop-overflow
>       drm/xe: Use _ULL for u64 division
>       drm/xe/mmio: Cast to u64 when printing
>       drm/xe/display: Avoid calling readq()
>       drm/xe: Fix cast on trace variable
>       drm/xe: Enable 32bits build
>       Merge drm/drm-next into drm-xe-next
>       drm/xe: Remove PVC from xe_wa kunit tests
>       drm/xe/xe2: Enable has_usm
>       drm/i915/xe2lpd: Move D2D enable/disable
>       drm/i915/xe2lpd: Move registers to PICA
>       drm/xe: Always allow to override firmware
>       drm/xe: Avoid cryptic message when there's no GuC definition
>       drm/xe: Enable 32bits build
>       Merge drm/drm-next into drm-xe-next
>       drm/xe: Use pointers in trace events
>
> Lucas Stach (6):
>       drm/rockchip: analogix_dp: get encoder port ID from DT
>       drm/etnaviv: disable MLCG and pulse eater on GPU reset
>       dt-bindings: display: imx: add binding for i.MX8MP HDMI PVI
>       drm/bridge: imx: add driver for HDMI TX Parallel Video Interface
>       dt-bindings: display: imx: add binding for i.MX8MP HDMI TX
>       drm/bridge: imx: add bridge wrapper driver for i.MX8MP DWC HDMI
>
> Lukas Bulwahn (1):
>       drm: Clean-up superfluously selecting VT_HW_CONSOLE_BINDING
>
> Ma Jun (12):
>       drm/amdgpu: Check extended configuration space register when
> system uses large bar
>       drm/amdgpu: Fix the null pointer when load rlc firmware
>       drm/amdgpu/pm: Fix the power source flag error
>       drm/amdgpu/pm: Add default case for smu IH process func
>       drm/amdgpu/pm: Use macro definitions in the smu IH process function
>       drm/amdgpu: Fix the warning info in mode1 reset
>       drm/amdgpu/pm: Use inline function for IP version check
>       drm/amdgpu: Drop redundant parameter in amdgpu_gfx_kiq_init_ring
>       drm/amdgpu: Fix the runtime resume failure issue
>       drm/amdgpu/pm: Fix the power1_min_cap value
>       drm/amdgpu/pm: Fix the error of pwm1_enable setting
>       drm/amdgpu: Use rpm_mode flag instead of checking it again for rpm
>
> Maarten Lankhorst (6):
>       drm/xe/snapshot: Remove drm_err on guc alloc failures
>       drm/xe: Clear all snapshot members after deleting coredump
>       drm/xe: Add uapi for dumpable bos
>       drm/xe: Annotate each dumpable vma as such
>       drm/xe: Add vm snapshot mutex for easily taking a vm snapshot
> during devcoredump
>       drm/xe: Implement VM snapshot support for BO's and userptr
>
> Maaz Mombasawala (2):
>       drm/vmwgfx: Make all surfaces shareable
>       drm/vmwgfx: Add SPDX header to vmwgfx_drm.h
>
> Mads Bligaard Nielsen (1):
>       drm/bridge: adv7511: fix crash on irq during probe
>
> Malkoot Khan (1):
>       accel/habanalabs: Remove unnecessary braces from if statement
>
> Manasi Navare (1):
>       drm/i915/dsc: Fix the macro that calculates DSCC_/DSCA_ PPS reg add=
ress
>
> Manuel Traut (1):
>       dt-bindings: display: panel: Add BOE TH101MB31IG002-28A panel
>
> Marek Vasut (3):
>       drm/bridge: tc358767: Limit the Pixel PLL input range
>       drm/mxsfb: Switch to drmm_mode_config_init
>       drm: lcdif: Switch to drmm_mode_config_init
>
> Marijn Suijten (2):
>       drm/msm/dsi: Replace dsi_get_bpp() with mipi_dsi header function
>       drm/msm/dpu: Only enable DSC_MODE_MULTIPLEX if dsc_merge is enabled
>
> Mario Limonciello (6):
>       Revert "drm/amd/pm: fix the high voltage and temperature issue"
>       drm/amd/display: Clear phantom stream count and plane count
>       drm/amd: Stop evicting resources on APUs in suspend
>       Revert "drm/amd: flush any delayed gfxoff on suspend entry"
>       drm/amd: Change `jpeg_v4_0_5_start_dpg_mode()` to void
>       drm/amd: Drop abm_level property
>
> Markus Elfring (2):
>       drm/sched: One function call less in drm_sched_init() after
> error detection
>       drm/sched: Return an error code only as a constant in drm_sched_ini=
t()
>
> Martin Blumenstingl (1):
>       drm/meson: improve encoder probe / initialization error handling
>
> Martin Krastev (2):
>       drm/vmwgfx: Refactor drm connector probing for display modes
>       drm/vmwgfx: Fix vmw_du_get_cursor_mob fencing of newly-created MOBs
>
> Martin Leung (1):
>       drm/amd/display: 3.2.267
>
> Martin Tsai (1):
>       drm/amd/display: should support dmub hw lock on Replay
>
> Matt Roper (7):
>       drm/xe/dg2: Drop pre-production workarounds
>       drm/xe/migrate: Cap PTEs written by MI_STORE_DATA_IMM to 510
>       drm/i915: Add additional ARL PCI IDs
>       drm/i915/xelpg: Extend some workarounds/tuning to gfx version 12.74
>       drm/xe: Stash GMD_ID value in xe_gt
>       drm/xe: Grab mem_access when disabling C6 on skip_guc_pc platforms
>       drm/xe: Convert job timeouts from assert to warning
>
> Matthew Auld (4):
>       drm/xe/exec: move fence reservation
>       drm/xe/exec: reserve fence slot for CPU bind
>       drm/xe/vm: don't ignore error when in_kthread
>       drm/xe/display: fix i915_gem_object_is_shmem() wrapper
>
> Matthew Brost (27):
>       drm/xe: Fix UBSAN splat in add_preempt_fences()
>       drm/xe: Fix exec IOCTL long running exec queue ring full condition
>       drm/xe/guc: Only take actions in CT irq handler if CTs are enabled
>       drm/xe: Add build on bug to assert page fault queue works
>       drm/xe: Invert page fault queue head / tail
>       drm/xe: Add build on bug to assert access counter queue works
>       drm/xe: Invert access counter queue head / tail
>       drm/xe/guc: Add more GuC CT states
>       drm/xe: Move TLB invalidation reset before HW reset
>       drm/xe/guc: Flush G2H handler when turning off CTs
>       drm/xe: Only allow 1 ufence per exec / bind IOCTL
>       drm/xe: Make all GuC ABI shift values unsigned
>       drm/xe: Use LRC prefix rather than CTX prefix in lrc desc defines
>       drm/xe: Fix loop in vm_bind_ioctl_ops_unwind
>       drm/xe: Drop rebind argument from xe_pt_prepare_bind
>       drm/xe: Take a reference in xe_exec_queue_last_fence_get()
>       drm/xe: Pick correct userptr VMA to repin on REMAP op failure
>       drm/xe: Map both mem.kernel_bb_pool and usm.bb_pool
>       drm/sched: Add Matthew Brost to maintainers
>       drm/xe: Assume large page size if VMA not yet bound
>       drm/xe: Remove TEST_VM_ASYNC_OPS_ERROR
>       drm/xe: Remove exec queue bind.fence_*
>       drm/xe: Fix xe_vma_set_pte_size
>       drm/xe: Add XE_VMA_PTE_64K VMA flag
>       drm/xe: Return 2MB page size for compact 64k PTEs
>       drm/xe: Add debug prints for skipping rebinds
>       drm/xe: Fix ref counting leak on page fault
>
> Maxime Ripard (31):
>       drm/atomic: Move the drm_atomic_state field doc inline
>       drm/atomic: Remove inexistent reference
>       drm/atomic: Rework the object doc a bit
>       drm/atomic: Make the drm_atomic_state documentation less ambiguous
>       drm/todo: Add entry to rename drm_atomic_state
>       drm/rockchip: inno_hdmi: Remove useless mode_fixup
>       drm/rockchip: inno_hdmi: Remove useless copy of drm_display_mode
>       drm/rockchip: inno_hdmi: Switch encoder hooks to atomic
>       drm/rockchip: inno_hdmi: Get rid of mode_set
>       drm/rockchip: inno_hdmi: no need to store vic
>       drm/rockchip: inno_hdmi: Remove unneeded has audio flag
>       drm/rockchip: inno_hdmi: Remove useless input format
>       drm/rockchip: inno_hdmi: Remove tmds rate from structure
>       drm/rockchip: inno_hdmi: Drop HDMI Vendor Infoframe support
>       drm/rockchip: inno_hdmi: Move infoframe disable to separate functio=
n
>       drm/rockchip: inno_hdmi: Switch to infoframe type
>       drm/rockchip: inno_hdmi: Remove unused drm device pointer
>       Merge drm/drm-next into drm-misc-next
>       drm/i915/tv: Fix TV mode
>       drm/sun4i: hdmi: Convert encoder to atomic
>       drm/sun4i: hdmi: Move mode_set into enable
>       drm/sun4i: hdmi: Switch to container_of_const
>       drm/sun4i: hdmi: Consolidate atomic_check and mode_valid
>       drm/edid/firmware: Remove built-in EDIDs
>       MAINTAINERS: Update drm.git URL
>       drm/tests: helpers: Include missing drm_drv header
>       drm/tests: helpers: Add atomic helpers
>       drm/tests: Add helper to create mock plane
>       drm/tests: Add helper to create mock crtc
>       drm/tests: connector: Add tests for drmm_connector_init
>       drm/sun4i: hdmi: Add missing drm_atomic header
>
> Ma=C3=ADra Canal (3):
>       drm/vc4: don't check if plane->state->fb =3D=3D state->fb
>       drm/v3d: Show the memory-management stats on debugfs
>       drm/v3d: Enable V3D to use different PAGE_SIZE
>
> Melissa Wen (10):
>       drm/amd/display: decouple color state from hw state log
>       drm/amd/display: read gamut remap matrix in fixed-point 31.32 forma=
t
>       drm/amd/display: fill up DCN3 DPP color state
>       drm/amd/display: add get_gamut_remap helper for MPC3
>       drm/amd/display: create DCN3-specific log for MPC state
>       drm/amd/display: hook up DCN30 color blocks data to DTN log
>       drm/amd/display: add DPP and MPC color caps to DTN log
>       drm/amd/display: hook up DCN20 color blocks data to DTN log
>       drm/amd/display: fix null-pointer dereference on edid reading
>       drm/amd/display: check dc_link before dereferencing
>
> Michael Strauss (3):
>       drm/amd/display: Remove Legacy FIXED_VS Transparent LT Sequence
>       drm/amd/display: Don't perform rate toggle on DP2-capable
> FIXED_VS retimers
>       drm/amd/display: Update FIXED_VS Retimer HWSS Test Pattern Sequence=
s
>
> Michal Wajdeczko (49):
>       drm/xe: Add command MI_LOAD_REGISTER_MEM
>       drm/xe: Define registers used by memory based irq processing
>       drm/xe: Update LRC context layout definitions
>       drm/xe: Update definition of GT_INTR_DW
>       drm/xe: Define IRQ offsets used by HW engines
>       drm/xe: Add XE_BO_NEEDS_UC flag to force UC mode instead WB
>       drm/xe/vf: Introduce Memory Based Interrupts Handler
>       drm/xe/vf: Update LRC with memory based interrupts data
>       drm/xe/vf: Setup memory based interrupts in GuC
>       drm/xe/vf: Add VF specific interrupt handler
>       drm/xe: Add GT oriented drm_printers
>       drm/xe: Report TLB timeout using GT oriented functions
>       drm/xe: Introduce GuC Doorbells Manager
>       drm/xe/kunit: Set SR-IOV mode of the fake device
>       drm/xe/kunit: Define helper functions to allocate fake xe device
>       drm/xe/kunit: Restore test->priv when done with fake xe device
>       drm/xe/kunit: Use xe kunit helper in RTP test
>       drm/xe/kunit: Use xe kunit helper in WA test
>       drm/xe/kunit: Enable CONFIG_LOCKDEP in tests
>       drm/xe/kunit: Add GuC Doorbells Manager tests
>       drm/xe: Allocate dedicated workqueue for SR-IOV workers
>       drm/xe: Define Virtual Function Identifier
>       drm/xe: Introduce GT-oriented SR-IOV logging macros
>       drm/xe/guc: Add helpers for HXG messages
>       drm/xe/guc: Update few GuC CTB ABI definitions
>       drm/xe/guc: Add Relay Communication ABI definitions
>       drm/xe/guc: Introduce Relay Communication for SR-IOV
>       drm/xe/kunit: Allow to replace xe_guc_ct_send_recv() with stub
>       drm/xe/kunit: Add GuC Relay kunit tests
>       drm/xe/guc: Start handling GuC Relay event messages
>       drm/xe: Fix compilation without CONFIG_KUNIT
>       drm/xe: Split GuC communication initialization
>       drm/xe/guc: Treat non-response message after BUSY as unexpected
>       drm/xe/guc: Return CTB response length
>       drm/xe/guc: Use HXG definitions on HXG messages
>       drm/xe: Allow to exclude part of GGTT from allocations
>       drm/xe: Fix potential deadlock in __fini_dbm
>       drm/xe: Use kstrdup while creating snapshot
>       drm/xe: Mark internal gmdid mappings as const
>       drm/xe/guc: Return CTB HXG response DATA0 if no buffer provided
>       drm/xe/guc: Add kernel-doc for xe_guc_ct_send_recv()
>       drm/xe/vf: Assume fixed GSM size if VF
>       drm/xe/vf: Don't try to capture engine data unavailable to VF
>       drm/xe/vf: Don't program MOCS if VF
>       drm/xe/vf: Don't initialize stolen memory manager if VF
>       drm/xe/vf: Don't check if LMEM is initialized if VF
>       drm/xe/vf: Don't enable hwmon if VF
>       drm/xe/vf: Don't program PAT if VF
>       drm/xe/vf: Don't support MCR registers if VF
>
> Micha=C5=82 Winiarski (10):
>       drm/managed: Add drmm_release_action
>       drm/tests: managed: Rename the suite name to match other DRM tests
>       drm/tests: managed: Add comments about test intent
>       drm/tests: managed: Extract device initialization into test init
>       drm/tests: managed: Add a simple test for drmm_managed_release
>       drm/tests: mm: Convert to drm_dbg_printer
>       drm/xe/guc: Allocate GuC data structures in system memory for initi=
al load
>       drm/xe/huc: Realloc HuC FW in vram for post-hwconfig
>       drm/xe/guc: Move GuC power control init to "post-hwconfig"
>       drm/xe: Initialize GuC earlier during probe
>
> Mika Kahola (5):
>       drm/i915/display: Fix C20 pll selection for state verification
>       drm/i915/display: Store hw clock for C20
>       drm/i915/display: Cleanup mplla/mpllb selection
>       drm/i915/display: Skip C10 state verification in case of fastset
>       drm/i915/display: Use helper to select C20 MPLLA/B
>
> Mika Kuoppala (1):
>       drm/xe: Remove obsolete async_ops from struct xe_vm
>
> Moti Haimovski (1):
>       drm/xe/vm: bugfix in xe_vm_create_ioctl
>
> Mounika Adhuri (1):
>       drm/amd/display: clkmgr unittest with removal of warn & rename
> DCN35 ips handshake for idle
>
> Muhammad Ahmed (1):
>       drm/amd/display: add power_state and pme_pending flag
>
> Mukul Joshi (2):
>       drm/amdgpu: Fix module unload hang with RAS enabled
>       drm/amdkfd: Use correct drm device for cgroup permission check
>
> Nathan Chancellor (1):
>       drm/amd/display: Increase frame-larger-than for all display_mode_vb=
a files
>
> Neil Armstrong (4):
>       dt-bindings: display/msm/gmu: Document Adreno 750 GMU
>       dt-bindings: arm-smmu: fix SM8[45]50 GPU SMMU if condition
>       dt-bindings: arm-smmu: Document SM8650 GPU SMMU
>       drm/msm: add support for A750 GPU
>
> Nicholas Kazlauskas (14):
>       drm/amd/display: Allow IPS2 during Replay
>       drm/amd/display: Port DENTIST hang and TDR fixes to OTG disable W/A
>       drm/amd/display: Rework DC Z10 restore
>       drm/amd/display: Set default Z8 minimum residency for DCN35
>       drm/amd/display: Allow Z8 for multiplane configurations on DCN35
>       drm/amd/display: Wait before sending idle allow and after idle disa=
llow
>       drm/amd/display: Wait for mailbox ready when powering up DMCUB
>       drm/amd/display: Add more checks for exiting idle in DC
>       drm/amd/display: Disable timeout in more places for dc_dmub_srv
>       drm/amd/display: Increase eval/entry delay for DCN35
>       drm/amd/display: Disable idle reallow as part of command/gpint exec=
ution
>       drm/amd/display: Add shared firmware state for DMUB IPS handshake
>       drm/amd/display: Increase ips2_eval delay for DCN35
>       drm/amd/display: Fix S4 hang polling on HW power up done for VBIOS =
DMCUB
>
> Nicholas Susanto (1):
>       drm/amd/display: Underflow workaround by increasing SR exit latency
>
> Nikita Zhandarovich (4):
>       drm/radeon: remove dead code in ni_mc_load_microcode()
>       drm/radeon/ni_dpm: remove redundant NULL check
>       drm/radeon/ni: Fix wrong firmware size logging in ni_init_microcode=
()
>       drm/amd/display: fix NULL checks for adev->dm.dc in amdgpu_dm_fini(=
)
>
> Nirmoy Das (5):
>       drm/print: Add drm_dbg_ratelimited
>       drm/i915: Ratelimit debug log in vm_fault_ttm
>       drm/xe/xe2: synchronise CS_CHICKEN1 with WMTP support
>       drm/xe/query: Use kzalloc for drm_xe_query_engines
>       drm/i915: Check before removing mm notifier
>
> Ofir Bitton (3):
>       accel/habanalabs/gaudi2: drain event lacks rd/wr indication
>       accel/habanalabs/hwmon: rate limit errors user can generate
>       accel/habanalabs: modify pci health check
>
> Ori Messinger (1):
>       drm/amdgpu: Enable GFXOFF for Compute on GFX11
>
> Ovidiu Bunea (1):
>       drm/amd/display: Fix DML2 watermark calculation
>
> Paloma Arellano (19):
>       drm/dp: add an API to indicate if sink supports VSC SDP
>       drm/msm/dpu: allow certain formats for CDM for DP
>       drm/msm/dpu: add division of drm_display_mode's hskew parameter
>       drm/msm/dpu: pass mode dimensions instead of fb size in CDM setup
>       drm/msm/dpu: allow dpu_encoder_helper_phys_setup_cdm to work for DP
>       drm/msm/dpu: move dpu_encoder_helper_phys_setup_cdm to dpu_encoder
>       drm/msm/dp: rename wide_bus_en to wide_bus_supported
>       drm/msm/dp: store mode YUV420 information to be used by rest of DP
>       drm/msm/dp: check if VSC SDP is supported in DP programming
>       drm/msm/dpu: move widebus logic to its own API
>       drm/msm/dp: program config ctrl for YUV420 over DP
>       drm/msm/dp: change clock related programming for YUV420 over DP
>       drm/msm/dp: move parity calculation to dp_utils
>       drm/msm/dp: add VSC SDP support for YUV420 over DP
>       drm/msm/dp: enable SDP and SDE periph flush update
>       drm/msm/dpu: modify encoder programming for CDM over DP
>       drm/msm/dpu: modify timing engine programming for YUV420 over DP
>       drm/msm/dpu: reserve CDM blocks for DP if mode is YUV420
>       drm/msm/dp: allow YUV420 mode for DP connector when CDM available
>
> Paul E. McKenney (1):
>       drm/xe: Fix build bug for GCC 11
>
> Paz Zcharya (1):
>       drm/i915/display: Include debugfs.h in intel_display_debugfs_params=
.c
>
> Peichen Huang (1):
>       drm/amd/display: Add usb4_bw_alloc_support flag
>
> Philip Yang (1):
>       drm/amdkfd: Correct partial migration virtual addr
>
> Philipp Stanner (3):
>       drm/tilcdc: request and mapp iomem with devres
>       drm/imx/dcss: request memory region
>       drm/imx/dcss: have all init functions use devres
>
> Pierre-Eric Pelloux-Prayer (1):
>       drm/amdgpu: disable ring_muxer if mcbp is off
>
> Pin-yen Lin (3):
>       drm/panel-edp: Add powered_on_to_enable delay
>       drm/edp-panel: Add panels delay entries
>       drm/panel-edp: Add some panels with conservative timings
>
> Pranjal Ramajor Asha Kanojiya (5):
>       accel/qaic: Deprecate ->size field from attach slice IOCTL structur=
e
>       accel/qaic: Remove bo->queued field
>       accel/qaic: Drop the reference to BO in error path of create BO IOC=
TL
>       accel/qaic: Call drm_gem_create_mmap_offset() once for each BO
>       accel/qaic: Leverage DRM managed APIs to release resources
>
> Prike Liang (3):
>       drm/amdgpu: skip to program GFXDEC registers for suspend abort
>       drm/amdgpu: reset gpu for s3 suspend abort case
>       drm/amdgpu: Enable gpu reset for S3 abort cases on Raven series
>
> Primoz Fiser (1):
>       drm/panel: simple: Add EDT ETML1010G3DRA panel
>
> Priyanka Dandamudi (1):
>       drm/xe/xe_bo_move: Enhance xe_bo_move trace
>
> Qiang Ma (1):
>       drm/amdgpu: Clear the hotplug interrupt ack bit before hpd initiali=
zation
>
> Quentin Schulz (4):
>       drm/rockchip: lvds: do not overwrite error code
>       drm/rockchip: lvds: do not print scary message when probing defer
>       drm/panel: ltk050h3146w: only print message when GPIO getting is
> not EPROBE_DEFER
>       drm/panel: ltk050h3146w: use dev_err_probe wherever possible
>
> R SUNDAR (1):
>       drm/amd/display: Removed redundant @ symbol to fix kernel-doc
> warnings in -next repo
>
> Rajneesh Bhardwaj (2):
>       drm/amdkfd: update SIMD distribution algo for GFXIP 9.4.2 onwards
>       drm/amdgpu: Fix implicit assumtion in gfx11 debug flags
>
> Randy Dunlap (19):
>       drm/i915/gem: reconcile Excess struct member kernel-doc warnings
>       drm/i915/gt: reconcile Excess struct member kernel-doc warnings
>       drm/i915/guc: reconcile Excess struct member kernel-doc warnings
>       drm/i915/perf: reconcile Excess struct member kernel-doc warnings
>       drm/vmwgfx: fix all kernel-doc warnings in stdu
>       drm/vmwgfx: fix kernel-doc Excess struct member 'base'
>       drm/nouveau/bios/init: drop kernel-doc notation
>       drm/nouveau/disp: don't misuse kernel-doc comments
>       drm/nouveau: don't misuse kernel-doc comments
>       drm/nouveau/gr/gf100: don't misuse kernel-doc comments
>       drm/nouveau/volt/gk20a: don't misuse kernel-doc comments
>       drm/doc: internals: remove section on PCI legacy support
>       dma-buf/dma-resv: fix spelling
>       dma-buf/dma-fence: fix spelling
>       drm/rect: fix kernel-doc typos
>       drm/panel: re-alphabetize the menu list
>       drivers/ps3: select VIDEO to provide cmdline functions
>       drm: drm_crtc: correct some comments
>       iosys-map: fix typo
>
> Raphael Gallais-Pou (3):
>       dt-bindings: panel: lvds: Append edt,etml0700z9ndha in panel-lvds
>       drm/panel: simple: fix flags on RK043FN48H
>       drm/panel: simple: push blanking limit on RK32FN48H
>
> Ravi Kumar Vodapalli (1):
>       drm/i915/display: update pll values in sync with Bspec for MTL
>
> Riana Tauro (1):
>       drm/xe/pm: add debug logs for D3cold
>
> Ricardo B. Marliere (5):
>       drm: display: make dp_aux_bus_type const
>       drm: mipi-dsi: make mipi_dsi_bus_type const
>       gpu: host1x: bus: make host1x_bus_type const
>       accel: constify the struct device_type usage
>       drm/amdkfd: make kfd_class constant
>
> Ritesh Kumar (3):
>       dt-bindings: display: panel: Add Novatek NT36672E LCD DSI
>       drm/panel: Add support for Novatek NT36672E panel driver
>       drm/panel: novatek-nt36672e: Include <linux/of.h>
>
> Rob Clark (5):
>       drm/ci: Add msm tests
>       Merge tag 'drm-misc-next-2024-02-08' into msm-next
>       drm/msm/adreno: Update generated headers
>       drm/msm/a7xx: Fix LLC typo
>       Merge tag 'drm-misc-next-2024-02-29' into msm-next
>
> Rob Herring (1):
>       dt-bindings: display: msm: sm8650-mdss: Add missing explicit
> "additionalProperties"
>
> Rodrigo Siqueira (19):
>       Documentation/gpu: Add basic page for HUBP
>       Documentation/gpu: Add simple doc page for DCHUBBUB
>       drm/amd/include: Add missing registers/mask for DCN316 and 350
>       Documentation/gpu: Add kernel doc entry for DPP
>       Documentation/gpu: Add kernel doc entry for MPC
>       Documentation/gpu: Add entry for OPP in the kernel doc
>       Documentation/gpu: Add entry for the DIO component
>       Documentation/gpu: Add an explanation about the DC weekly patches
>       Documentation/gpu: Introduce a simple contribution list for display=
 code
>       drm/amd/display: Drop legacy code
>       drm/amd/display: Disable ODM by default for DCN35
>       drm/amd/display: Trivial code style adjustment
>       drm/amd/display: Drop some unnecessary guards
>       drm/amd/display: Remove break after return
>       drm/amd/display: Initialize variable with default value
>       drm/amd/display: Remove unused file
>       drm/amd/display: Add SMU timeout check and retry
>       drm/amd/display: Remove redundant FPU guard
>       drm/amd/display: Drop unnecessary header
>
> Rodrigo Vivi (5):
>       drm/doc/rfc: Remove Xe's pre-merge plan
>       drm/xe: Do not flood dmesg with guc log
>       drm/doc/rfc: Removing missing reference to xe.rst
>       drm/i915: Fix doc build issue on intel_cdclk.c
>       drm/i915: convert remaining intel_dp_vsc_sdp_pack
>
> Roman Li (5):
>       drm/amd/display: Add IPS checks before dcn register access
>       drm/amd/display: Disable ips before dc interrupt setting
>       drm/amd: Add a DC debug mask for IPS
>       drm/amd/display: "Enable IPS by default"
>       drm/amd/display: Fix array-index-out-of-bounds in dcn35_clkmgr
>
> Ruthuvikas Ravikumar (1):
>       drm/xe: Add mocs reset kunit
>
> Saleemkhan Jamadar (3):
>       drm/amdgpu: add ucode id for jpeg DPG support
>       drm/amdgpu/jpeg: add support for jpeg DPG mode
>       drm/amdgpu/jpeg: add support for jpeg multi instance
>
> Samasth Norway Ananda (1):
>       drm/amdgpu: fix wrong sizeof argument
>
> Samuel Dionne-Riel (1):
>       drm: panel-orientation-quirks: Add quirk for GPD Win Mini
>
> Shashank Sharma (1):
>       drm/amdgpu: change vm->task_info handling
>
> Shekhar Chauhan (2):
>       drm/xe/xe2_lpg: Add Wa_16018610683
>       drm/xe/xe2_lpg: Introduce performance guide changes
>
> Shradha Gupta (2):
>       drm: Check output polling initialized before disabling
>       drm: Check polling initialized before enabling in
> drm_helper_probe_single_connector_modes
>
> Shuicheng Lin (1):
>       drm/i915/guc: Change wa and EU_PERF_CNTL registers to MCR type
>
> Simon Ser (1):
>       drm/vc4: plane: check drm_gem_plane_helper_prepare_fb() return valu=
e
>
> Sohaib Nadeem (3):
>       drm/amd/display: increased min_dcfclk_mhz and min_fclk_mhz
>       Revert "drm/amd/display: increased min_dcfclk_mhz and min_fclk_mhz"
>       drm/amd/display: fixed integer types and null check locations
>
> Somalapuram Amaranath (1):
>       drm/ttm: replace busy placement with flags v6
>
> Sonny Jiang (7):
>       drm/amdgpu: add VCN_5_0_0 firmware support
>       drm/amdgpu: add VCN_5_0_0 IP block support
>       amdgpu/drm: Add vcn_v5_0_0_ip_block support
>       drm/amdgpu: Add JPEG5 support
>       drm/amdgpu/jpeg5: add power gating support
>       drm/amdgpu/jpeg5: Enable doorbell
>       drm/amdgpu: Add jpeg_v5_0_0 ip block support
>
> Srinivasan Shanmugam (29):
>       drm/amdkfd: Fix variable dereferenced before NULL check in
> 'kfd_dbg_trap_device_snapshot()'
>       drm/amd/display: Fix late derefrence 'dsc' check in
> 'link_set_dsc_pps_packet()'
>       drm/amd/display: Drop 'acrtc' and add 'new_crtc_state' NULL
> check for writeback requests.
>       drm/amdgpu: Cleanup inconsistent indenting in 'amdgpu_gfx_enable_kc=
q()'
>       drm/amd/display: Drop kdoc markers for some Panel Replay functions
>       drm/amd/display: Fix uninitialized variable usage in core_link_
> 'read_dpcd() & write_dpcd()' functions
>       drm/amd/display: Address kdoc for eDP Panel Replay feature in
> 'amdgpu_dm_crtc_set_panel_sr_feature()'
>       drm/amdgpu: Fix return type in 'aca_bank_hwip_is_matched()'
>       drm/amd/display: Fix a potential buffer overflow in
> 'dp_dsc_clock_en_read()'
>       drm/amd/display: Fix potential NULL pointer dereferences in
> 'dcn10_set_output_transfer_func()'
>       drm/amdgpu: Fix missing error code in 'gmc_v6/7/8/9_0_hw_init()'
>       drm/amd/display: Add NULL check for kzalloc in
> 'amdgpu_dm_atomic_commit_tail()'
>       drm/amd/display: Fix buffer overflow in
> 'get_host_router_total_dp_tunnel_bw()'
>       drm/amd/display: Fix 'panel_cntl' could be null in
> 'dcn21_set_backlight_level()'
>       drm/amd/display: Add NULL test for 'timing generator' in
> 'dcn21_set_pipe()'
>       drm/amdgpu: Fix potential out-of-bounds access in
> 'amdgpu_discovery_reg_base_init()'
>       drm/amd/display: Implement bounds check for stream encoder
> creation in DCN301
>       drm/amd/display: Initialize 'wait_time_microsec' variable in
> link_dp_training_dpia.c
>       drm/amd/display: Fix possible use of uninitialized
> 'max_chunks_fbc_mode' in 'calculate_bandwidth()'
>       drm/amd/display: Fix possible buffer overflow in
> 'find_dcfclk_for_voltage()'
>       drm/amd/display: Fix possible NULL dereference on device
> remove/driver unload
>       drm/amdgpu/display: Initialize gamma correction mode variable in
> dcn30_get_gamcor_current()
>       drm/amdgpu: Fix missing parameter descriptions in ih_v7_0.c
>       drm/amd/display: Add 'replay' NULL check in
> 'edp_set_replay_allow_active()'
>       drm/amd/display: Fix potential null pointer dereference in dc_dmub_=
srv
>       drm/amdgpu/display: Address kdoc for 'is_psr_su' in 'fill_dc_dirty_=
rects'
>       drm/amd/display: Prevent potential buffer overflow in map_hw_resour=
ces
>       drm/amdgpu: Fix missing break in ATOM_ARG_IMM Case of atom_get_src_=
int()
>       drm/amd/amdgpu: Fix potential ioremap() memory leaks in
> amdgpu_device_init()
>
> Stanislav Lisovskiy (1):
>       drm/i915: Add bigjoiner force enable option to debugfs
>
> Stanley.Yang (5):
>       drm/amdgpu: Show deferred error count for UMC
>       drm/amdgpu: Skip do PCI error slot reset during RAS recovery
>       drm/amdgpu: Fix ras features value calltrace
>       drm/amdgpu: Fix shared buff copy to user
>       drm/amdgpu: Fix ineffective ras_mask settings
>
> Sui Jingfeng (6):
>       drm/etnaviv: Drop the second argument of the etnaviv_gem_new_impl()
>       drm/etnaviv: Fix coding style
>       drm/etnaviv: Add helper functions to create and destroy platform de=
vice
>       drm/etnaviv: Add a helper to get the first available GPU device nod=
e
>       drm/etnaviv: Clean up etnaviv_gem_get_pages
>       drm/etnaviv: Drop the 'len' parameter of etnaviv_iommu_map() functi=
on
>
> Sujaritha Sundaresan (2):
>       drm/xe: Add vram frequency sysfs attributes
>       drm/xe: Fix typo in vram frequency sysfs documentation
>
> Sunil Khatri (1):
>       drm/amdgpu: add ring timeout information in devcoredump
>
> Suraj Kandpal (17):
>       drm/i915/hdcp: Fail Repeater authentication if Type1 device not pre=
sent
>       drm/xe/gsc: Add status check during gsc header readout
>       drm/i915/lnl: Add pkgc related register
>       drm/i915/lnl: Program PKGC_LATENCY register
>       drm/i915/hdcp: Move to direct reads for HDCP
>       drm/i915/hdcp: Move source hdcp2 checks into its own function
>       drm/i915/hdcp: Refactor intel_dp_hdcp2_capable
>       drm/i915/hdcp: Pass drm_dp_aux to read_bcaps function
>       drm/i915/hdcp: Rename hdcp capable functions
>       drm/i915/hdcp: Add new remote capability check shim function
>       drm/i915/hdcp: HDCP Capability for the downstream device
>       drm/i915/hdcp: Remove additional timing for reading mst hdcp messag=
e
>       drm/i915/hdcp: Extract hdcp structure from correct connector
>       drm/i915/hdcp: Don't enable HDCP2.2 directly from check_link
>       drm/i915/hdcp: Don't enable HDCP1.4 directly from check_link
>       drm/i915/hdcp: Allocate stream id after HDCP AKE stage
>       drm/i915/hdcp: Read Rxcaps for robustibility
>
> Swapnil Patel (1):
>       drm/amd/display: fix input states translation error for dcn35 & dcn=
351
>
> Taimur Hassan (1):
>       drm/amd/display: Send DTBCLK disable message on first commit
>
> Tal Risin (1):
>       accel/habanalabs: initialize maybe-uninitialized variables
>
> Tao Zhou (7):
>       drm/amdgpu: update error condition check for umc_v12_0_query_error_=
address
>       Revert "drm/amd/pm: smu v13_0_6 supports ecc info by default"
>       drm/amdgpu: update check condition of query for ras page retire
>       drm/amdgpu: disable RAS feature when fini
>       drm/amdgpu: add PSP RAS address query command
>       drm/amdgpu: use PSP address query command
>       drm/amdgpu: add deferred error check for UMC v12 address query
>
> Tejas Upadhyay (2):
>       drm/xe/xelpg: Extend Wa_14019877138 for Graphics 12.70/71
>       drm/i915/xelpg: Add workaround 14019877138
>
> Thierry Reding (1):
>       drm: Remove drm_num_crtcs() helper
>
> Thomas Hellstr=C3=B6m (17):
>       drm/xe/vm: Fix an error path
>       drm/xe: Use __iomem for the regs pointer
>       drm/xe: Annotate xe_mem_region::mapping with __iomem
>       drm/xe: Annotate multiple mmio pointers with __iomem
>       drm/xe: Annotate xe_ttm_stolen_mgr::mapping with __iomem
>       drm/xe/migrate: Fix CCS copy for small VRAM copy chunks
>       drm/xe/dmabuf: Make xe_dmabuf_ops static
>       drm/xe: Use a NULL pointer instead of 0.
>       drm/exec, drm/gpuvm: Prefer u32 over uint32_t
>       drm/xe: Document nested struct members according to guidelines
>       drm/xe: Annotate mcr_[un]lock()
>       drm/xe: Don't use __user error pointers
>       drm/xe/vm: Subclass userptr vmas
>       drm/xe/vm: Avoid reserving zero fences
>       drm/xe: Fix a missing argument to drm_err_printer
>       drm/xe/pt: Allow for stricter type- and range checking
>       drm/xe/uapi: Remove support for persistent exec_queues
>
> Thomas Zimmermann (33):
>       fbdev/efifb: Replace references to global screen_info by local poin=
ter
>       fbdev/efifb: Use screen_info pointer from device
>       fbdev/vesafb: Replace references to global screen_info by local poi=
nter
>       fbdev/vesafb: Use screen_info pointer from device
>       drm/mgag200: Fix caching setup for remapped video memory
>       Documentation/gpu: Reference articles on Linux graphics stack
>       video/cmdline: Introduce CONFIG_VIDEO for video=3D parameter
>       video/cmdline: Hide __video_get_options() behind CONFIG_FB_CORE
>       video/nomodeset: Select nomodeset=3D parameter with CONFIG_VIDEO
>       Merge drm/drm-next into drm-misc-next
>       video: Add helpers for decoding screen_info
>       video: Provide screen_info_get_pci_dev() to find screen_info's PCI =
device
>       firmware/sysfb: Set firmware-framebuffer parent device
>       fbdev/efifb: Remove PM for parent device
>       firmware/sysfb: Create firmware device only for enabled PCI devices
>       fbdev/efifb: Do not track parent device status
>       firmware/sysfb: Update screen_info for relocated EFI framebuffers
>       fbdev/efifb: Remove framebuffer relocation tracking
>       Merge drm/drm-next into drm-misc-next
>       Merge drm/drm-next into drm-misc-next-fixes
>       backlight/corgi-lcd: Include <linux/backlight.h>
>       drm/nouveau: Include <linux/backlight.h>
>       staging/fbtft: Include <linux/backlight.h>
>       fbdev: Do not include <linux/backlight.h> in header
>       fbdev: Do not include <linux/fs.h> in header
>       fbdev: Do not include <linux/notifier.h> in header
>       fbdev: Do not include <linux/slab.h> in header
>       fbdev: Clean up forward declarations in header file
>       fbdev: Clean up include statements in header file
>       Merge drm/drm-next into drm-misc-next-fixes
>       fbdev/chipsfb: Include <linux/backlight.h>
>       macintosh/via-pmu-backlight: Include <linux/backlight.h>
>       arch/powerpc: Remove <linux/fb.h> from backlight code
>
> Thong (1):
>       drm/amdgpu/soc21: update VCN 4 max HEVC encoding resolution
>
> Tim Huang (3):
>       drm/amdgpu: enable CGPG for GFX ip v11.5.1
>       drm/amdgpu: reserve more memory for MES runtime DRAM
>       drm/amd/pm: wait for completion of the EnableGfxImu message
>
> Tom Chung (2):
>       drm/amd/display: Enable Panel Replay for static screen use case
>       drm/amd/display: Preserve original aspect ratio in create stream
>
> Tom St Denis (1):
>       drm/amd/amdgpu: Assign GART pages to AMD device mapping
>
> Tomer Tayar (8):
>       accel/habanalabs: fix DRAM BAR base address calculation
>       accel/habanalabs: abort device reset for consecutive heartbeat fail=
ures
>       accel/habanalabs/gaudi2: fail memory memset when failing to copy
> QM packet to device
>       accel/habanalabs: modify print for skip loading linux FW to debug l=
og
>       accel/habanalabs/gaudi2: check extended errors according to PCIe
> addr_dec interrupt info
>       accel/habanalabs: fix glbl error cause handling
>       accel/habanalabs: handle reserved memory request when working with =
full FW
>       accel/habanalabs: keep explicit size of reserved memory for FW
>
> Tomeu Vizoso (1):
>       drm/etnaviv: Expose a few more chipspecs to userspace
>
> Tomi Valkeinen (4):
>       drm/bridge: sii902x: Fix probing race issue
>       drm/bridge: sii902x: Fix audio codec unregistration
>       drm/tidss: Fix initial plane zpos values
>       drm/tidss: Fix sync-lost issue with two displays
>
> Tony Lindgren (2):
>       dt-bindings: display: simple: Add boe,bp082wx1-100 8.2" panel
>       drm/panel: simple: Add BOE BP082WX1-100 8.2" panel
>
> Tvrtko Ursulin (3):
>       drm/i915: Add GuC submission interface version query
>       drm/i915: Add some boring kerneldoc
>       drm/i915: Fix possible null pointer dereference after
> drm_dbg_printer conversion
>
> Umesh Nerlige Ramappa (1):
>       drm/i915/perf: Update handling of MMIO triggered reports
>
> Veerabadhran Gopalakrishnan (3):
>       drm/amdgpu/vcn: Enable VCN 4.0.6 Support
>       drm/amdgpu/soc21: Added Video Capabilities for VCN 406
>       drm/amdgpu/soc21: Enabling PG and CG flags for VCN 4.0.6
>
> Vegard Nossum (1):
>       drm/nouveau: uapi: fix kerneldoc warnings
>
> Victor Lu (4):
>       drm/amdgpu: Improve error checking in amdgpu_virt_rlcg_reg_rw (v2)
>       drm/amdgpu: Do not program IH_CHICKEN in vega20_ih.c under SRIOV
>       drm/amdgpu: Use correct SRIOV macro for gmc_v9_0_vm_fault_interrupt=
_state
>       drm/amdgpu: Do not program SQ_TIMEOUT_CONFIG in SRIOV
>
> Victor Skvortsov (2):
>       drm/amdgpu: Add RAS_POISON_READY host response message
>       amdgpu/drm: Use vram manager for virtualization page retirement
>
> Vignesh Raman (3):
>       drm/ci: Update xfails for newly added msm tests
>       drm/ci: uprev mesa version: fix kdl commit fetch
>       drm/ci: add sc7180-trogdor-kingoftown
>
> Ville Syrj=C3=A4l=C3=A4 (62):
>       drm/mm: Allow CONFIG_DRM_MM_DEBUG with DRM=3Dm
>       Revert "drm/i915/dsi: Do display on sequence later on icl+"
>       drm/i915/psr: Only allow PSR in LPSP mode on HSW non-ULT
>       drm/i915: Replace a memset() with zero initialization
>       drm/i915: Decouple intel_crtc_vblank_evade_scanlines() from atomic =
commits
>       drm/i915: Reorder drm_vblank_put() vs. need_vlv_dsi_wa
>       drm/i915: Introduce struct intel_vblank_evade_ctx
>       drm/i915: Include need_vlv_dsi_wa in intel_vblank_evade_ctx
>       drm/i915: Extract intel_vblank_evade()
>       drm/i915: Move the min/max scanline sanity check into intel_vblank_=
evade()
>       drm/i915: Move intel_vblank_evade() & co. into intel_vblank.c
>       drm/i915: Perform vblank evasion around legacy cursor updates
>       Revert "drm/i915/xe2lpd: Treat cursor plane as regular plane for
> DDB allocation"
>       drm/i915: Try to preserve the current shared_dpll for fastset on
> type-c ports
>       drm/i915: Include the PLL name in the debug messages
>       drm/i915: Suppress old PLL pipe_mask checks for MG/TC/TBT PLLs
>       drm/i915: Convert PLL flags to booleans
>       drm/i915: Compute use_sagv_wm differently
>       drm/i915: Rework global state serializaiton
>       drm/i915: Extract intel_atomic_swap_state()
>       drm/i915/fbc: Allow FBC with CCS modifiers on SKL+
>       drm/i915/hdcp: Do intel_hdcp_component_init() much later during ini=
t
>       drm/i915/hdcp: Pin the hdcp gsc message high in ggtt
>       drm/i915: Use struct resource for memory region IO as well
>       drm/i915: Print memory region info during probe
>       drm/i915: Remove ad-hoc lmem/stolen debugs
>       drm/i915: Bypass LMEMBAR/GTTMMADR for MTL stolen memory access
>       drm/i915: Disable the "binder"
>       drm/i915: Rename the DSM/GSM registers
>       drm/i915: Fix PTE decode during initial plane readout
>       drm/i915: Fix region start during initial plane readout
>       drm/i915: Fix MTL initial plane readout
>       drm/i915: s/phys_base/dma_addr/
>       drm/i915: Split the smem and lmem plane readout apart
>       drm/i915: Simplify intel_initial_plane_config() calling convention
>       drm/i915/fbdev: Fix smem_start for LMEMBAR stolen objects
>       drm/i915: Tweak BIOS fb reuse check
>       drm/i915: Try to relocate the BIOS fb to the start of ggtt
>       drm/i915: Annotate more of the BIOS fb takeover failure paths
>       drm/i915/dp: Limit SST link rate to <=3D8.1Gbps
>       drm/i915: Correct for_each_old_global_obj_in_state() arguments
>       drm/i915/sdvo: Convert to per-device debugs
>       drm/i915/sdvo: Fix up code alignment
>       drm/i915/color: Use per-device debugs
>       drm/i915/fb: Use per-device debugs
>       drm/i915/bios: Switch to kms debugs
>       drm/i915/bios: Use per-device debugs for VBT related stuff
>       drm/i915/hdcp: Use per-device debugs
>       drm/i915/wm: Pass the whole i915 to intel_get_cxsr_latency()
>       drm/i915/wm: Use per-device debugs in pre-ilk wm code
>       drm/i915/wm: Use per-device debugs ilk wm code
>       drm/i915/dvo/ns2501: Nuke pointless casts
>       drm/i915/dvo: Use sizeof(*variable) instead of sizeof(type)
>       drm/i915: Fix PLL state check for gmch platforms
>       drm/i915: Include the CRTC name in the ELD buffer mismatch
>       drm/i915: Reuse ibx_dump_hw_state() for gmch platforms
>       drm/i915: Add PLL .compare_hw_state() vfunc
>       drm/i915: Enable fastboot across the board
>       drm/i915/cdclk: Extract cdclk_divider()
>       drm/i915/cdclk: Squash waveform is 16 bits
>       drm/i915/cdclk: Remove the hardcoded divider from
> cdclk_compute_crawl_and_squash_midpoint()
>       drm/i915/cdclk: Document CDCLK update methods
>
> Vinay Belgaumkar (2):
>       drm/xe: Check skip_guc_pc before setting SLPC flag
>       drm/i915/mtl: Wake GT before sending H2G message
>
> Vinod Govindapillai (1):
>       drm/xe: Modify the cfb size to be page size aligned for FBC
>
> Wachowski, Karol (2):
>       accel/ivpu: Use lazy allocation for doorbell IDs
>       accel/ivpu: Refactor BO creation functions
>
> Wayne Lin (2):
>       drm/amd/display: Align the returned error code with legacy DP
>       drm/amd/display: adjust few initialization order in dm
>
> Wenjing Liu (7):
>       drm/amd/display: Floor to mhz when requesting dpp disp clock
> changes to SMU
>       drm/amd/display: turn off windowed Mpo ODM feature for dcn321
>       drm/amd/display: fix incorrect mpc_combine array size
>       drm/amd/display: use correct phantom pipe when populating subvp pip=
e info
>       drm/amd/display: set odm_combine_policy based on context in dcn32 r=
esource
>       drm/amd/display: treat plane clip size change as MED update type
>       drm/amd/display: reenable windowed mpo odm support on dcn32 and dcn=
321
>
> Xiaoming Wang (1):
>       drm/xe/display: Fix memleak in display initialization
>
> XueBing Chen (9):
>       drm/radeon/kms: Clean up errors in radeon_pm.c
>       drm/radeon: Clean up errors in clearstate_ci.h
>       drm/radeon: Clean up errors in clearstate_cayman.h
>       drm/radeon/dpm: Clean up errors in evergreen_smc.h
>       drm/radeon: Clean up errors in ci_dpm.h
>       drm/radeon: Clean up errors in radeon.h
>       drm/radeon: Clean up errors in si.c
>       drm/radeon/evergreen_cs: Clean up errors in evergreen_cs.c
>       drm/radeon/ni_dpm: Clean up errors in nislands_smc.h
>
> Xuxin Xiong (1):
>       drm/panel-edp: Add several generic edp panels
>
> Yang Wang (23):
>       drm/amdgpu: implement RAS ACA driver framework
>       drm/amdgpu: add ACA kernel hardware error log support
>       drm/amdgpu: add ACA bank dump debugfs support
>       drm/amd/pm: add aca smu backend support for smu v13.0.6
>       drm/amdgpu: add amdgpu ras aca query interface
>       drm/amdgpu: add aca sysfs support
>       drm/amdgpu: add umc v12.0 ACA support
>       drm/amdgpu: add gfx v9.4.3 ACA support
>       drm/amdgpu: add sdma v4.4.2 ACA support
>       drm/amdgpu: add mmhub v1.8 ACA support
>       drm/amdgpu: add xgmi v6.4.0 ACA support
>       drm/amdgpu: replace MCA macro with ACA for XGMI
>       drm/amdgpu: fix UBSAN array-index-out-of-bounds for ras_block_strin=
g[]
>       drm/amd/pm: enable amdgpu smu send message log
>       drm/amd/pm: udpate smu v13.0.6 message permission
>       drm/amdgpu: skip call ras_late_init if ras block is not supported
>       drm/amdgpu: add aca sysfs remove support
>       drm/amdgpu: adjust aca init/fini sequence to match gpu reset
>       drm/amdgpu: use helper macro HW_ERR instead of Hardware error strin=
g
>       drm/amdgpu: implement smu send rma reason for smu v13.0.6
>       drm/amdgpu: send smu rma reason event in ras eeprom driver
>       drm/amdgpu: enable pp_od_clk_voltage for gfx 9.4.3 SRIOV
>       drm/amd/pm: disable pp_dpm_dcefclk node for gfx 11.0.3 sriov
>
> Yannic Moog (1):
>       dt-bindings: display: panel-simple: add ETML1010G3DRA
>
> YiPeng Chai (7):
>       drm/amdgpu: Add log info for umc_v12_0
>       drm/amdgpu: Prepare for asynchronous processing of umc page retirem=
ent
>       drm/amdgpu: Use asynchronous polling to handle umc_v12_0 poisoning
>       drm/amdgpu: add interface to check mca umc status
>       drm/amdgpu:Support retiring multiple MCA error address pages
>       drm/amdgpu: Support passing poison consumption ras block to SRIOV
>       drm/amdgpu: Need to resume ras during gpu reset for gfx v9_4_3 srio=
v
>
> Yifan Zhang (26):
>       drm/amdgpu: drm/amdgpu: remove golden setting for gfx 11.5.0
>       drm/amdgpu: remove asymmetrical irq disabling in vcn 4.0.5 suspend
>       drm/amdgpu/nbio: Add NBIO 7.11.1 Support
>       drm/amdgpu: add nbio 7.11.1 discovery support
>       drm/amdgpu: add smuio 14.0.1 support
>       drm/amdgpu: add PSP 14.0.1 support
>       drm/amdgpu: add psp 14.0.1 discovery support
>       drm/amdgpu: add sdma 6.1.1 firmware
>       drm/amdgpu: add SDMA 6.1.1 discovery support
>       drm/amdgpu: add MMHUB 3.3.1 support
>       drm/amdgpu: add GFXHUB 11.5.1 support
>       drm/amdgpu: add tmz support for GC IP v11.5.1
>       drm/amdgpu: enable gmc11 discovery support for GC 11.5.1
>       drm/amdgpu: add initial GC 11.5.1 soc21 support
>       drm/amdgpu: enable soc21 discovery support for GC 11.5.1
>       drm/amdgpu: add GC 11.5.1 to GC 11.5.0 family
>       drm/amdgpu: add firmware for GC 11.5.1
>       drm/amdgpu: add imu firmware support for GC 11.5.1
>       drm/amdgpu: add mes firmware support for GC 11.5.1
>       drm/amdgpu: initialize gfx11.5.1
>       drm/amdkfd: add KFD support for GC 11.5.1
>       drm/amdgpu: add GC 11.5.1 discovery support
>       drm/amdgpu: enable MES discovery for GC 11.5.1
>       drm/amdgpu: add vcn 4.0.6 discovery support
>       drm/amdgpu: add dcn3.5.1 support
>       drm/amdgpu: add smu 14.0.1 support
>
> Yiling Chen (1):
>       drm/amd/display: Fix static screen event mask definition change
>
> YuanShang (1):
>       drm/amd/amdgpu: Update RLC_SPM_MC_CNT by ring wreg in guest
>
> Zack Rusin (4):
>       drm/vmwgfx: Unmap the surface before resetting it on a plane state
>       drm/vmwgfx: Fix possible null pointer derefence with invalid contex=
ts
>       drm/ttm: Make sure the mapped tt pages are decrypted when needed
>       drm/vmwgfx: Fix the lifetime of the bo cursor memory
>
> Zhang Shurong (1):
>       drm/tegra: dpaux: Fix PM disable depth imbalance in tegra_dpaux_pro=
be
>
> Zhanjun Dong (1):
>       drm/xe/guc: Fix missing topology init
>
> Zhikai Zhai (1):
>       drm/amd/display: Add align done check
>
> Zhipeng Lu (2):
>       drm/vmwgfx: fix a memleak in vmw_gmrid_man_get_node
>       drm/lima: fix a memleak in lima_heap_alloc
>
> chenxuebing (31):
>       drm/edid: Clean up errors in drm_edid.c
>       drm/amdgpu: Clean up errors in navi10_ih.c
>       drm/amdgpu: Clean up errors in clearstate_gfx9.h
>       drm/amdgpu: Clean up errors in amdgpu_atomfirmware.h
>       drm/amd/amdgpu: Clean up errors in amdgpu_umr.h
>       drm/amd: Clean up errors in sdma_v2_4.c
>       drm/amdgpu: Clean up errors in amdgpu_rlc.c
>       drm/amd: Clean up errors in amdgpu_vkms.c
>       drm/amdgpu: Clean up errors in amdgpu_drv.c
>       drm/amdgpu: Clean up errors in gfx_v9_4.c
>       drm/amdgpu: Clean up errors in jpeg_v2_5.c
>       drm/amdgpu: Clean up errors in amdgpu_gmc.c
>       drm/amdgpu: Clean up errors in amdgpu.h
>       drm/amdgpu: Clean up errors in clearstate_si.h
>       drm/amdgpu: Clean up errors in umc_v6_0.c
>       drm/amd/include: Clean up errors in arct_ip_offset.h
>       drm/amdgpu: Clean up errors in atom-bits.h
>       drm/amdgpu: Clean up errors in navi12_ip_offset.h
>       drm/amdgpu: Clean up errors in kgd_pp_interface.h
>       drm/amd/include/vega10_ip_offset:Clean up errors in vega10_ip_offse=
t.h
>       drm/amd: Clean up errors in vega10_ip_offset.h
>       drm/amd/pp: Clean up errors in dm_pp_interface.h
>       drm/amdgpu: Clean up errors in dimgrey_cavefish_ip_offset.h
>       drm/amd/include/vangogh_ip_offset: Clean up errors in vangogh_ip_of=
fset.h
>       drm/amd/include/sienna_cichlid_ip_offset: Clean up errors in
> sienna_cichlid_ip_offset.h
>       drm/amdgpu: Clean up errors in cgs_common.h
>       drm/amd/include/navi14_ip_offset: Clean up errors in navi14_ip_offs=
et.h
>       drm/amdgpu: Clean up errors in v10_structs.h
>       drm/amd/amdgpu: Clean up errors in beige_goby_ip_offset.h
>       drm/amd/display: Clean up errors in renoir_ip_offset.h
>       drm/amd/include/vega20_ip_offset: Clean up errors in vega20_ip_offs=
et.h
>
> lima1002 (1):
>       drm/amdgpu/soc21: add mode2 asic reset for SMU IP v14.0.1
>
> shaoyunl (1):
>       drm/amdgpu: Only create mes event log debugfs when mes is enabled
>
> xiazhengqiao (1):
>       drm/bridge: Fixed a DP link training bug
>
>  Documentation/admin-guide/edid.rst                 |    35 +-
>  Documentation/admin-guide/kernel-parameters.txt    |    14 +-
>  .../display/bridge/fsl,imx8mp-hdmi-tx.yaml         |   102 +
>  .../bindings/display/bridge/ti,sn65dsi86.yaml      |     2 +-
>  .../bindings/display/imx/fsl,imx8mp-hdmi-pvi.yaml  |    84 +
>  .../bindings/display/msm/dsi-controller-main.yaml  |     2 +
>  .../devicetree/bindings/display/msm/gmu.yaml       |     1 +
>  .../devicetree/bindings/display/msm/gpu.yaml       |     6 +-
>  .../devicetree/bindings/display/msm/qcom,mdss.yaml |     1 +
>  .../bindings/display/msm/qcom,sm8650-dpu.yaml      |     4 +-
>  .../bindings/display/msm/qcom,sm8650-mdss.yaml     |     4 +
>  .../bindings/display/msm/qcom,x1e80100-mdss.yaml   |   251 +
>  .../display/panel/boe,th101mb31ig002-28a.yaml      |    58 +
>  .../bindings/display/panel/himax,hx83112a.yaml     |    74 +
>  .../display/panel/leadtek,ltk500hd1829.yaml        |     4 +-
>  .../bindings/display/panel/novatek,nt35510.yaml    |     4 +-
>  .../bindings/display/panel/novatek,nt36672e.yaml   |    66 +
>  .../bindings/display/panel/panel-lvds.yaml         |     4 +
>  .../bindings/display/panel/panel-simple.yaml       |     4 +
>  .../display/panel/rocktech,jh057n00900.yaml        |     3 +
>  .../bindings/display/panel/visionox,rm69299.yaml   |     3 +-
>  .../bindings/display/renesas,rzg2l-du.yaml         |   126 +
>  .../display/rockchip/rockchip,dw-hdmi.yaml         |    33 +-
>  .../bindings/display/solomon,ssd1307fb.yaml        |    20 +-
>  .../bindings/display/solomon,ssd132x.yaml          |    12 +-
>  .../bindings/display/solomon,ssd133x.yaml          |    45 +
>  .../bindings/display/ti/ti,am65x-dss.yaml          |     7 +-
>  .../devicetree/bindings/iommu/arm,smmu.yaml        |    17 +-
>  .../devicetree/bindings/vendor-prefixes.yaml       |     2 +
>  Documentation/gpu/amdgpu/dgpu-asic-info-table.csv  |     2 +
>  Documentation/gpu/amdgpu/display/dcn-blocks.rst    |    78 +
>  .../gpu/amdgpu/display/display-contributing.rst    |   168 +
>  .../gpu/amdgpu/display/display-manager.rst         |     3 -
>  Documentation/gpu/amdgpu/display/index.rst         |    78 +-
>  Documentation/gpu/drm-internals.rst                |    12 -
>  Documentation/gpu/drm-usage-stats.rst              |     2 +-
>  Documentation/gpu/introduction.rst                 |     2 +
>  Documentation/gpu/rfc/index.rst                    |     4 -
>  Documentation/gpu/rfc/xe.rst                       |   234 -
>  Documentation/gpu/todo.rst                         |    23 +
>  MAINTAINERS                                        |    18 +-
>  arch/powerpc/include/asm/backlight.h               |     5 +-
>  arch/powerpc/platforms/powermac/backlight.c        |    26 -
>  arch/powerpc/platforms/ps3/Kconfig                 |     1 +
>  drivers/accel/drm_accel.c                          |     2 +-
>  .../accel/habanalabs/common/command_submission.c   |     3 +-
>  drivers/accel/habanalabs/common/debugfs.c          |    18 +-
>  drivers/accel/habanalabs/common/device.c           |    55 +-
>  drivers/accel/habanalabs/common/firmware_if.c      |    25 +-
>  drivers/accel/habanalabs/common/habanalabs.h       |    43 +-
>  drivers/accel/habanalabs/common/hw_queue.c         |    17 +
>  drivers/accel/habanalabs/common/hwmon.c            |    29 +-
>  drivers/accel/habanalabs/common/mmu/Makefile       |     2 +-
>  drivers/accel/habanalabs/common/mmu/mmu.c          |   223 +-
>  drivers/accel/habanalabs/common/mmu/mmu_v1.c       |   354 +-
>  drivers/accel/habanalabs/common/mmu/mmu_v2.c       |   338 +
>  drivers/accel/habanalabs/common/mmu/mmu_v2_hr.c    |    24 +-
>  drivers/accel/habanalabs/common/security.c         |    33 +-
>  drivers/accel/habanalabs/common/security.h         |     3 +-
>  drivers/accel/habanalabs/gaudi/gaudi.c             |     9 +-
>  drivers/accel/habanalabs/gaudi2/gaudi2.c           |   308 +-
>  drivers/accel/habanalabs/gaudi2/gaudi2P.h          |    15 +-
>  drivers/accel/habanalabs/goya/goya.c               |    12 +-
>  drivers/accel/habanalabs/goya/goya_coresight.c     |     3 +-
>  .../habanalabs/include/hw_ip/mmu/mmu_general.h     |     2 +
>  drivers/accel/ivpu/ivpu_debugfs.c                  |    32 +-
>  drivers/accel/ivpu/ivpu_drv.c                      |    12 +-
>  drivers/accel/ivpu/ivpu_drv.h                      |     7 +-
>  drivers/accel/ivpu/ivpu_fw.c                       |    49 +-
>  drivers/accel/ivpu/ivpu_fw_log.c                   |     6 +-
>  drivers/accel/ivpu/ivpu_gem.c                      |    70 +-
>  drivers/accel/ivpu/ivpu_gem.h                      |     6 +-
>  drivers/accel/ivpu/ivpu_hw_37xx.c                  |    10 +-
>  drivers/accel/ivpu/ivpu_hw_40xx.c                  |    10 +-
>  drivers/accel/ivpu/ivpu_ipc.c                      |    12 +-
>  drivers/accel/ivpu/ivpu_job.c                      |    20 +-
>  drivers/accel/ivpu/ivpu_pm.c                       |    10 +-
>  drivers/accel/ivpu/vpu_boot_api.h                  |    46 +-
>  drivers/accel/ivpu/vpu_jsm_api.h                   |    32 +-
>  drivers/accel/qaic/mhi_controller.c                |     6 +-
>  drivers/accel/qaic/qaic.h                          |     3 +-
>  drivers/accel/qaic/qaic_data.c                     |    59 +-
>  drivers/accel/qaic/qaic_drv.c                      |   140 +-
>  drivers/char/agp/agp.h                             |     1 -
>  drivers/dma-buf/dma-fence.c                        |     8 +-
>  drivers/dma-buf/dma-resv.c                         |     4 +-
>  drivers/firmware/Kconfig                           |     1 +
>  drivers/firmware/sysfb.c                           |    53 +-
>  drivers/firmware/sysfb_simplefb.c                  |     5 +-
>  drivers/gpu/drm/Kconfig                            |    19 +-
>  drivers/gpu/drm/amd/amdgpu/Makefile                |    17 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h                |    18 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c            |   879 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_aca.h            |   202 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |    10 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |    15 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |    42 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c       |    24 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   |     3 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h   |     2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |     6 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c            |     3 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |     9 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |    65 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |    62 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |     8 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |     4 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |    71 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c         |     4 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |     4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |    41 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |    13 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |     4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |    56 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |     4 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |    21 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c            |     7 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |    18 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c           |    46 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.h           |    36 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |    17 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c            |    33 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mca.h            |     1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |     8 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h           |     2 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.c           |     8 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.h           |     3 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |    17 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |     6 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   251 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |    14 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   686 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |    66 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |     3 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c          |    26 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h          |     1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |    33 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.c       |     4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.c            |     2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.h            |     2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c          |    66 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.h          |     9 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c           |     4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |    11 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |     7 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |     1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |   155 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |    10 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_umr.h            |     4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c       |     2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |     6 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |    42 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |    88 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |     8 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |     3 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   255 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |    55 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c          |   110 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c            |    77 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.h            |     5 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |    81 +-
>  drivers/gpu/drm/amd/amdgpu/athub_v4_1_0.c          |   122 +
>  drivers/gpu/drm/amd/amdgpu/athub_v4_1_0.h          |    30 +
>  drivers/gpu/drm/amd/amdgpu/atom.c                  |    43 +-
>  drivers/gpu/drm/amd/amdgpu/atom.h                  |     2 +-
>  drivers/gpu/drm/amd/amdgpu/atombios_crtc.c         |    28 +-
>  drivers/gpu/drm/amd/amdgpu/atombios_dp.c           |     4 +-
>  drivers/gpu/drm/amd/amdgpu/atombios_encoders.c     |    16 +-
>  drivers/gpu/drm/amd/amdgpu/atombios_i2c.c          |     4 +-
>  drivers/gpu/drm/amd/amdgpu/cik.c                   |    41 +-
>  drivers/gpu/drm/amd/amdgpu/clearstate_gfx9.h       |    27 +-
>  drivers/gpu/drm/amd/amdgpu/clearstate_si.h         |    24 +-
>  drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |     2 +
>  drivers/gpu/drm/amd/amdgpu/dce_v11_0.c             |     2 +
>  drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |    22 +-
>  drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |    22 +-
>  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |    35 +-
>  drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   146 +-
>  drivers/gpu/drm/amd/amdgpu/gfx_v11_0_3.c           |     2 +-
>  drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c              |     4 +-
>  drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |    37 +-
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |    56 +-
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_4.c              |     5 +-
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |    99 +-
>  drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |    33 +-
>  drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |    35 +-
>  drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c              |     5 +-
>  drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c              |     5 +-
>  drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |    25 +-
>  drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |    43 +-
>  drivers/gpu/drm/amd/amdgpu/hdp_v7_0.c              |   142 +
>  drivers/gpu/drm/amd/amdgpu/hdp_v7_0.h              |    31 +
>  drivers/gpu/drm/amd/amdgpu/ih_v7_0.c               |   767 +
>  drivers/gpu/drm/amd/amdgpu/ih_v7_0.h               |    28 +
>  drivers/gpu/drm/amd/amdgpu/imu_v11_0.c             |     1 +
>  drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c             |    10 +-
>  drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c           |    16 +-
>  drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.h           |    15 +
>  drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c           |   491 +-
>  drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c           |   570 +
>  drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.h           |    29 +
>  drivers/gpu/drm/amd/amdgpu/lsdma_v7_0.c            |   121 +
>  drivers/gpu/drm/amd/amdgpu/lsdma_v7_0.h            |    31 +
>  drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |    15 +-
>  drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c            |    87 +
>  drivers/gpu/drm/amd/amdgpu/mmhub_v3_3.c            |     1 +
>  drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c              |     3 +-
>  drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |    29 +-
>  drivers/gpu/drm/amd/amdgpu/mxgpu_nv.h              |     1 +
>  drivers/gpu/drm/amd/amdgpu/navi10_ih.c             |     3 +-
>  drivers/gpu/drm/amd/amdgpu/nbif_v6_3_1.c           |   495 +
>  drivers/gpu/drm/amd/amdgpu/nbif_v6_3_1.h           |    33 +
>  drivers/gpu/drm/amd/amdgpu/nbio_v7_11.c            |     9 +-
>  drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c             |    63 -
>  drivers/gpu/drm/amd/amdgpu/psp_gfx_if.h            |     1 +
>  drivers/gpu/drm/amd/amdgpu/psp_v11_0.c             |     2 +-
>  drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |   104 +-
>  drivers/gpu/drm/amd/amdgpu/psp_v14_0.c             |   672 +
>  drivers/gpu/drm/amd/amdgpu/psp_v14_0.h             |    32 +
>  drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c             |    15 +-
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |    23 +-
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |    94 +-
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |    29 +-
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |    29 +-
>  drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |    30 +-
>  drivers/gpu/drm/amd/amdgpu/si.c                    |    41 +-
>  drivers/gpu/drm/amd/amdgpu/soc15.c                 |    49 +-
>  drivers/gpu/drm/amd/amdgpu/soc21.c                 |    38 +
>  drivers/gpu/drm/amd/amdgpu/ta_ras_if.h             |    36 +
>  drivers/gpu/drm/amd/amdgpu/umc_v12_0.c             |   263 +-
>  drivers/gpu/drm/amd/amdgpu/umc_v12_0.h             |     3 +
>  drivers/gpu/drm/amd/amdgpu/umc_v6_0.c              |     2 +-
>  drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c            |     3 +
>  drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c            |  1339 +
>  drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.h            |    37 +
>  drivers/gpu/drm/amd/amdgpu/vega20_ih.c             |    38 +-
>  drivers/gpu/drm/amd/amdgpu/vpe_6_1_fw_if.h         |     3 +-
>  drivers/gpu/drm/amd/amdgpu/vpe_v6_1.c              |   281 +-
>  drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h     |   545 +-
>  .../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx10.asm |   173 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |    24 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |    94 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_crat.h              |     1 +
>  drivers/gpu/drm/amd/amdkfd/kfd_debug.c             |     4 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_device.c            |    30 +-
>  .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |     4 +
>  drivers/gpu/drm/amd/amdkfd/kfd_events.c            |     6 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c       |    29 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_int_process_v10.c   |     7 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c   |     7 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |     7 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.c      |     8 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.h      |     2 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h       |    25 +
>  drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c    |    10 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |     6 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c        |    20 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |    10 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |     8 +-
>  drivers/gpu/drm/amd/display/TODO                   |   110 -
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   226 +-
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |     1 +
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |    72 +-
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |    55 +-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |     1 +
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c   |   119 +-
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_replay.h   |     4 +-
>  drivers/gpu/drm/amd/display/dc/basics/conversion.c |    34 +
>  drivers/gpu/drm/amd/display/dc/basics/conversion.h |     4 +
>  drivers/gpu/drm/amd/display/dc/basics/dce_calcs.c  |     2 -
>  .../gpu/drm/amd/display/dc/bios/command_table.c    |     2 +-
>  .../gpu/drm/amd/display/dc/bios/command_table2.c   |     2 +-
>  .../amd/display/dc/bios/command_table_helper2.c    |     1 +
>  drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |     3 -
>  .../amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c    |     2 +-
>  .../drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr.c |     2 -
>  .../amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr_clk.c |    79 -
>  .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  |     2 -
>  .../dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.c        |    15 +-
>  .../drm/amd/display/dc/clk_mgr/dcn301/dcn301_smu.c |    10 +-
>  .../drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.c   |     4 -
>  .../drm/amd/display/dc/clk_mgr/dcn314/dcn314_smu.c |     6 -
>  .../drm/amd/display/dc/clk_mgr/dcn315/dcn315_smu.c |     4 -
>  .../drm/amd/display/dc/clk_mgr/dcn316/dcn316_smu.c |     4 -
>  .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |    46 +-
>  .../dc/clk_mgr/dcn32/dcn32_clk_mgr_smu_msg.h       |     3 +-
>  .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |    39 +-
>  .../drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.c   |    27 +-
>  drivers/gpu/drm/amd/display/dc/core/dc.c           |   217 +-
>  drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |    23 +-
>  drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |    18 +
>  drivers/gpu/drm/amd/display/dc/core/dc_surface.c   |     2 +
>  drivers/gpu/drm/amd/display/dc/dc.h                |    23 +-
>  drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |   114 +-
>  drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |     3 +-
>  drivers/gpu/drm/amd/display/dc/dce/dce_audio.c     |   293 +-
>  drivers/gpu/drm/amd/display/dc/dce/dce_audio.h     |     3 +-
>  .../gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c  |     4 +
>  drivers/gpu/drm/amd/display/dc/dce/dmub_replay.c   |     4 +-
>  .../gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.c |    20 +
>  .../gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.h |     4 +-
>  drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.c   |     3 +-
>  drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.h   |     3 +
>  .../gpu/drm/amd/display/dc/dcn10/dcn10_dpp_cm.c    |    70 +-
>  drivers/gpu/drm/amd/display/dc/dcn10/dcn10_opp.c   |     7 +
>  drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp.c   |    31 +-
>  drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp.h   |     3 +
>  .../gpu/drm/amd/display/dc/dcn20/dcn20_dpp_cm.c    |    55 +
>  drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c   |    24 +-
>  drivers/gpu/drm/amd/display/dc/dcn201/dcn201_dpp.c |     1 +
>  drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c   |    38 +-
>  drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.h   |     2 +
>  .../gpu/drm/amd/display/dc/dcn30/dcn30_dpp_cm.c    |    54 +
>  drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c   |   106 +-
>  drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.h   |     4 +
>  .../amd/display/dc/dcn32/dcn32_dio_link_encoder.c  |    85 +-
>  .../amd/display/dc/dcn32/dcn32_dio_link_encoder.h  |     5 +
>  drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dpp.c   |     1 +
>  .../display/dc/dcn35/dcn35_dio_stream_encoder.h    |     1 +
>  drivers/gpu/drm/amd/display/dc/dm_cp_psp.h         |     3 +
>  drivers/gpu/drm/amd/display/dc/dml/Makefile        |     3 +
>  .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |    16 +-
>  .../gpu/drm/amd/display/dc/dml/dcn303/dcn303_fpu.c |    11 +
>  .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |     1 -
>  .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |    12 +-
>  .../gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c |   574 +
>  .../gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.h |    19 +
>  .../amd/display/dc/dml2/dml2_dc_resource_mgmt.c    |    41 +-
>  drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c   |     2 +-
>  drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c |     5 +
>  drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        |     5 +
>  drivers/gpu/drm/amd/display/dc/gpio/hw_factory.c   |     1 +
>  drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c |     1 +
>  drivers/gpu/drm/amd/display/dc/hdcp/hdcp_msg.c     |     2 -
>  drivers/gpu/drm/amd/display/dc/hwss/Makefile       |     8 +
>  .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |    56 +-
>  .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |    97 +-
>  .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |   109 +-
>  .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.h    |     2 +
>  .../drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c    |   167 +-
>  .../drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.h    |     6 +-
>  .../gpu/drm/amd/display/dc/hwss/dcn30/dcn30_init.c |     2 +-
>  .../drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c    |    20 +-
>  .../drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.h    |     4 +
>  .../gpu/drm/amd/display/dc/hwss/dcn31/dcn31_init.c |     2 +-
>  .../drm/amd/display/dc/hwss/dcn314/dcn314_init.c   |     2 +-
>  .../gpu/drm/amd/display/dc/hwss/dcn32/dcn32_init.c |     2 +-
>  .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |    21 +-
>  .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.h    |     3 +
>  .../gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c |     2 +-
>  .../drm/amd/display/dc/hwss/dcn351/CMakeLists.txt  |     4 -
>  .../drm/amd/display/dc/hwss/dcn351/dcn351_init.c   |     2 +-
>  drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h |     2 +
>  .../drm/amd/display/dc/hwss/hw_sequencer_private.h |     2 -
>  drivers/gpu/drm/amd/display/dc/inc/core_types.h    |    31 +-
>  drivers/gpu/drm/amd/display/dc/inc/hw/audio.h      |     3 +-
>  .../drm/amd/display/dc/inc/hw/clk_mgr_internal.h   |     6 +
>  drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h   |     6 +
>  drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h        |    39 +
>  drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h       |    15 +-
>  drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h        |   256 +-
>  drivers/gpu/drm/amd/display/dc/inc/hw/opp.h        |    16 +
>  .../drm/amd/display/dc/inc/hw/timing_generator.h   |     2 -
>  drivers/gpu/drm/amd/display/dc/irq/Makefile        |    11 +-
>  .../amd/display/dc/irq/dcn20/irq_service_dcn20.c   |     2 -
>  .../amd/display/dc/irq/dcn21/irq_service_dcn21.c   |     2 -
>  .../amd/display/dc/irq/dcn351/irq_service_dcn351.c |   409 +
>  .../amd/display/dc/irq/dcn351/irq_service_dcn351.h |    12 +
>  .../amd/display/dc/link/accessories/link_dp_cts.c  |    27 +-
>  .../drm/amd/display/dc/link/hwss/link_hwss_dio.h   |    10 +
>  .../link/hwss/link_hwss_dio_fixed_vs_pe_retimer.c  |    16 +-
>  .../hwss/link_hwss_hpo_fixed_vs_pe_retimer_dp.c    |    51 +-
>  .../gpu/drm/amd/display/dc/link/link_detection.c   |    18 +
>  drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |    58 +
>  .../gpu/drm/amd/display/dc/link/link_validation.c  |     2 -
>  .../amd/display/dc/link/protocols/link_dp_phy.c    |     6 +-
>  .../display/dc/link/protocols/link_dp_training.c   |     5 +-
>  .../link_dp_training_fixed_vs_pe_retimer.c         |   372 +-
>  .../link_dp_training_fixed_vs_pe_retimer.h         |     5 -
>  .../drm/amd/display/dc/link/protocols/link_dpcd.c  |     2 +-
>  .../dc/link/protocols/link_edp_panel_control.c     |     5 +-
>  drivers/gpu/drm/amd/display/dc/resource/Makefile   |     8 +
>  .../amd/display/dc/resource/dcn20/dcn20_resource.c |     2 -
>  .../amd/display/dc/resource/dcn30/dcn30_resource.c |    11 +
>  .../amd/display/dc/resource/dcn31/dcn31_resource.c |     2 -
>  .../amd/display/dc/resource/dcn32/dcn32_resource.c |     1 +
>  .../display/dc/resource/dcn321/dcn321_resource.c   |     1 +
>  .../amd/display/dc/resource/dcn35/dcn35_resource.c |     7 +-
>  .../display/dc/resource/dcn351/dcn351_resource.c   |  2156 +
>  .../display/dc/resource/dcn351/dcn351_resource.h   |    23 +
>  drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |    23 +-
>  drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |   145 +-
>  drivers/gpu/drm/amd/display/dmub/src/Makefile      |     1 +
>  drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20.c  |     3 +-
>  drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20.h  |     3 +-
>  drivers/gpu/drm/amd/display/dmub/src/dmub_dcn30.c  |     3 +-
>  drivers/gpu/drm/amd/display/dmub/src/dmub_dcn30.h  |     3 +-
>  drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c  |     3 +-
>  drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.h  |     3 +-
>  drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.c  |     5 +-
>  drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.h  |     3 +-
>  drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.c  |    20 +-
>  drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.h  |     8 +-
>  drivers/gpu/drm/amd/display/dmub/src/dmub_dcn351.c |    34 +
>  drivers/gpu/drm/amd/display/dmub/src/dmub_dcn351.h |    13 +
>  drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |   129 +-
>  drivers/gpu/drm/amd/display/include/audio_types.h  |    15 +
>  drivers/gpu/drm/amd/display/include/dal_asic_id.h  |     2 +
>  .../drm/amd/display/include/link_service_types.h   |     9 +
>  .../gpu/drm/amd/display/modules/inc/mod_stats.h    |     4 +-
>  drivers/gpu/drm/amd/include/amd_shared.h           |     2 +
>  drivers/gpu/drm/amd/include/arct_ip_offset.h       |     6 +-
>  .../include/asic_reg/athub/athub_4_1_0_offset.h    |   287 +
>  .../include/asic_reg/athub/athub_4_1_0_sh_mask.h   |  1348 +
>  .../amd/include/asic_reg/dcn/dcn_3_1_6_offset.h    |     4 +
>  .../amd/include/asic_reg/dcn/dcn_3_1_6_sh_mask.h   |    10 +
>  .../amd/include/asic_reg/dcn/dcn_3_5_0_offset.h    |    24 +
>  .../amd/include/asic_reg/dcn/dcn_3_5_0_sh_mask.h   |    65 +
>  .../amd/include/asic_reg/dcn/dcn_3_5_1_offset.h    | 15259 ++++++
>  .../amd/include/asic_reg/dcn/dcn_3_5_1_sh_mask.h   | 53464 +++++++++++++=
++++++
>  .../amd/include/asic_reg/hdp/hdp_7_0_0_offset.h    |   219 +
>  .../amd/include/asic_reg/hdp/hdp_7_0_0_sh_mask.h   |   735 +
>  .../include/asic_reg/lsdma/lsdma_7_0_0_offset.h    |   388 +
>  .../include/asic_reg/lsdma/lsdma_7_0_0_sh_mask.h   |  1411 +
>  .../drm/amd/include/asic_reg/mp/mp_14_0_2_offset.h |   468 +
>  .../amd/include/asic_reg/mp/mp_14_0_2_sh_mask.h    |   692 +
>  .../amd/include/asic_reg/nbif/nbif_6_3_1_offset.h  | 11287 ++++
>  .../amd/include/asic_reg/nbif/nbif_6_3_1_sh_mask.h | 32806 ++++++++++++
>  .../amd/include/asic_reg/nbio/nbio_7_11_0_offset.h |     2 +
>  .../amd/include/asic_reg/nbio/nbio_7_9_0_sh_mask.h |     8 -
>  .../amd/include/asic_reg/oss/osssys_7_0_0_offset.h |   279 +
>  .../include/asic_reg/oss/osssys_7_0_0_sh_mask.h    |  1029 +
>  .../amd/include/asic_reg/pcie/pcie_6_1_0_offset.h  |   630 +
>  .../amd/include/asic_reg/pcie/pcie_6_1_0_sh_mask.h |  4250 ++
>  .../amd/include/asic_reg/vcn/vcn_5_0_0_offset.h    |  1672 +
>  .../amd/include/asic_reg/vcn/vcn_5_0_0_sh_mask.h   |  7627 +++
>  drivers/gpu/drm/amd/include/atom-bits.h            |     2 +-
>  drivers/gpu/drm/amd/include/atomfirmware.h         |    32 +
>  drivers/gpu/drm/amd/include/beige_goby_ip_offset.h |     6 +-
>  drivers/gpu/drm/amd/include/cgs_common.h           |    23 +-
>  .../gpu/drm/amd/include/cyan_skillfish_ip_offset.h |     6 +-
>  .../drm/amd/include/dimgrey_cavefish_ip_offset.h   |     6 +-
>  drivers/gpu/drm/amd/include/dm_pp_interface.h      |     9 +-
>  drivers/gpu/drm/amd/include/kgd_pp_interface.h     |     6 +-
>  drivers/gpu/drm/amd/include/navi12_ip_offset.h     |     6 +-
>  drivers/gpu/drm/amd/include/navi14_ip_offset.h     |     6 +-
>  drivers/gpu/drm/amd/include/pptable.h              |     6 +-
>  drivers/gpu/drm/amd/include/renoir_ip_offset.h     |     6 +-
>  .../gpu/drm/amd/include/sienna_cichlid_ip_offset.h |     6 +-
>  drivers/gpu/drm/amd/include/v10_structs.h          |     3 +-
>  drivers/gpu/drm/amd/include/vangogh_ip_offset.h    |     6 +-
>  drivers/gpu/drm/amd/include/vega10_ip_offset.h     |     6 +-
>  drivers/gpu/drm/amd/include/vega20_ip_offset.h     |    78 +-
>  drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |    15 +
>  drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |    94 +-
>  drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |     1 +
>  drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c         |    29 +
>  .../gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c    |    42 +-
>  .../gpu/drm/amd/pm/powerplay/hwmgr/ppatomfwctrl.c  |     4 +-
>  drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |    42 +-
>  drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |     6 +
>  .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_ppsmc.h   |     3 +-
>  drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |     3 +-
>  drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |    13 +-
>  drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |     9 +-
>  .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |     9 +-
>  drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |    16 +-
>  drivers/gpu/drm/amd/pm/swsmu/smu12/smu_v12_0.c     |     2 +-
>  drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |    14 +-
>  drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |    18 +-
>  .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |     9 +-
>  .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |   332 +-
>  .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |     9 +-
>  drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c     |    20 +-
>  .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c   |     5 +-
>  drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |     9 +-
>  drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h             |    10 +
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |    69 +-
>  drivers/gpu/drm/bridge/analogix/anx7625.c          |    30 +-
>  .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |    28 +-
>  drivers/gpu/drm/bridge/chrontel-ch7033.c           |    12 +-
>  drivers/gpu/drm/bridge/display-connector.c         |     8 +-
>  drivers/gpu/drm/bridge/imx/Kconfig                 |    18 +
>  drivers/gpu/drm/bridge/imx/Makefile                |     2 +
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c       |   207 +
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c        |   154 +
>  drivers/gpu/drm/bridge/ite-it6505.c                |    21 +-
>  drivers/gpu/drm/bridge/ite-it66121.c               |    16 +-
>  drivers/gpu/drm/bridge/lontium-lt8912b.c           |    20 +-
>  drivers/gpu/drm/bridge/lontium-lt9611.c            |     9 +-
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |    19 +-
>  .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   |    18 +-
>  drivers/gpu/drm/bridge/nxp-ptn3460.c               |    22 +-
>  drivers/gpu/drm/bridge/samsung-dsim.c              |    18 +-
>  drivers/gpu/drm/bridge/sii902x.c                   |    38 +-
>  drivers/gpu/drm/bridge/simple-bridge.c             |    17 +-
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |    45 +-
>  drivers/gpu/drm/bridge/tc358767.c                  |   195 +-
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c              |     8 +-
>  drivers/gpu/drm/bridge/ti-tfp410.c                 |    18 +-
>  drivers/gpu/drm/ci/build.sh                        |     1 +
>  drivers/gpu/drm/ci/gitlab-ci.yml                   |    14 +-
>  drivers/gpu/drm/ci/test.yml                        |    31 +-
>  drivers/gpu/drm/ci/testlist.txt                    |  1937 +-
>  drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt    |     3 +-
>  drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt    |     2 -
>  drivers/gpu/drm/ci/xfails/msm-sc7180-fails.txt     |    30 -
>  drivers/gpu/drm/ci/xfails/msm-sc7180-flakes.txt    |    17 -
>  drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt     |     7 -
>  .../xfails/msm-sc7180-trogdor-kingoftown-fails.txt |    18 +
>  .../xfails/msm-sc7180-trogdor-kingoftown-skips.txt |     2 +
>  .../msm-sc7180-trogdor-lazor-limozeen-fails.txt    |    18 +
>  .../msm-sc7180-trogdor-lazor-limozeen-skips.txt    |     2 +
>  drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt     |     5 +-
>  drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt    |    28 +-
>  drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt     |     7 +-
>  drivers/gpu/drm/display/Kconfig                    |    21 +
>  drivers/gpu/drm/display/Makefile                   |     2 +
>  drivers/gpu/drm/display/drm_dp_aux_bus.c           |     2 +-
>  drivers/gpu/drm/display/drm_dp_helper.c            |   179 +-
>  drivers/gpu/drm/display/drm_dp_mst_topology.c      |    23 +-
>  drivers/gpu/drm/display/drm_dp_tunnel.c            |  1949 +
>  drivers/gpu/drm/drm_bridge.c                       |    17 +-
>  drivers/gpu/drm/drm_bridge_connector.c             |    16 +-
>  drivers/gpu/drm/drm_crtc.c                         |    23 +-
>  drivers/gpu/drm/drm_debugfs.c                      |     4 -
>  drivers/gpu/drm/drm_edid.c                         |    25 +-
>  drivers/gpu/drm/drm_edid_load.c                    |   162 +-
>  drivers/gpu/drm/drm_exec.c                         |     2 +-
>  drivers/gpu/drm/drm_file.c                         |     2 +-
>  drivers/gpu/drm/drm_gem_vram_helper.c              |     2 -
>  drivers/gpu/drm/drm_ioc32.c                        |     4 +-
>  drivers/gpu/drm/drm_managed.c                      |    39 +
>  drivers/gpu/drm/drm_mipi_dsi.c                     |     2 +-
>  drivers/gpu/drm/drm_mode_config.c                  |     2 +-
>  drivers/gpu/drm/drm_modes.c                        |    22 +
>  drivers/gpu/drm/drm_modeset_helper.c               |    19 +-
>  drivers/gpu/drm/drm_modeset_lock.c                 |     2 +-
>  drivers/gpu/drm/drm_panel_orientation_quirks.c     |    12 +
>  drivers/gpu/drm/drm_print.c                        |    29 +-
>  drivers/gpu/drm/drm_probe_helper.c                 |    57 +-
>  drivers/gpu/drm/drm_syncobj.c                      |     7 +-
>  drivers/gpu/drm/etnaviv/etnaviv_cmd_parser.c       |     1 +
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c              |    93 +-
>  drivers/gpu/drm/etnaviv/etnaviv_gem.c              |    12 +-
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c              |    33 +-
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.h              |    12 +
>  drivers/gpu/drm/etnaviv/etnaviv_hwdb.c             |    43 +
>  drivers/gpu/drm/etnaviv/etnaviv_mmu.c              |     4 +-
>  drivers/gpu/drm/etnaviv/etnaviv_perfmon.c          |     4 +-
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h    |     1 -
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c   |     1 +
>  drivers/gpu/drm/i915/Kconfig                       |    14 +
>  drivers/gpu/drm/i915/Kconfig.debug                 |     1 +
>  drivers/gpu/drm/i915/Makefile                      |     3 +
>  drivers/gpu/drm/i915/display/dvo_ch7017.c          |     2 +-
>  drivers/gpu/drm/i915/display/dvo_ch7xxx.c          |     2 +-
>  drivers/gpu/drm/i915/display/dvo_ivch.c            |     2 +-
>  drivers/gpu/drm/i915/display/dvo_ns2501.c          |     6 +-
>  drivers/gpu/drm/i915/display/dvo_sil164.c          |     2 +-
>  drivers/gpu/drm/i915/display/dvo_tfp410.c          |     2 +-
>  drivers/gpu/drm/i915/display/i9xx_plane.c          |    30 +
>  drivers/gpu/drm/i915/display/i9xx_plane.h          |     7 +
>  drivers/gpu/drm/i915/display/i9xx_wm.c             |    81 +-
>  drivers/gpu/drm/i915/display/intel_atomic.c        |    10 +
>  drivers/gpu/drm/i915/display/intel_atomic_plane.c  |     6 +-
>  drivers/gpu/drm/i915/display/intel_backlight.c     |     2 +-
>  drivers/gpu/drm/i915/display/intel_bios.c          |   109 +-
>  drivers/gpu/drm/i915/display/intel_bios.h          |     8 +-
>  drivers/gpu/drm/i915/display/intel_cdclk.c         |   426 +-
>  drivers/gpu/drm/i915/display/intel_color.c         |    11 +-
>  drivers/gpu/drm/i915/display/intel_crt.c           |     8 +
>  drivers/gpu/drm/i915/display/intel_crtc.c          |   128 +-
>  .../gpu/drm/i915/display/intel_crtc_state_dump.c   |     5 +-
>  drivers/gpu/drm/i915/display/intel_cursor.c        |    63 +-
>  drivers/gpu/drm/i915/display/intel_cx0_phy.c       |   261 +-
>  drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h  |    63 +-
>  drivers/gpu/drm/i915/display/intel_ddi.c           |    70 +-
>  drivers/gpu/drm/i915/display/intel_display.c       |   235 +-
>  drivers/gpu/drm/i915/display/intel_display_core.h  |    19 +-
>  .../gpu/drm/i915/display/intel_display_debugfs.c   |    94 +-
>  .../i915/display/intel_display_debugfs_params.c    |     1 +
>  .../gpu/drm/i915/display/intel_display_device.c    |     2 +-
>  .../gpu/drm/i915/display/intel_display_driver.c    |   188 +-
>  .../gpu/drm/i915/display/intel_display_driver.h    |     6 +
>  drivers/gpu/drm/i915/display/intel_display_irq.c   |    10 +-
>  drivers/gpu/drm/i915/display/intel_display_types.h |    62 +-
>  drivers/gpu/drm/i915/display/intel_dmc.c           |     2 +-
>  drivers/gpu/drm/i915/display/intel_dp.c            |   559 +-
>  drivers/gpu/drm/i915/display/intel_dp.h            |    23 +-
>  drivers/gpu/drm/i915/display/intel_dp_aux.c        |    29 +-
>  drivers/gpu/drm/i915/display/intel_dp_hdcp.c       |   149 +-
>  .../gpu/drm/i915/display/intel_dp_link_training.c  |    33 +-
>  .../gpu/drm/i915/display/intel_dp_link_training.h  |     1 +
>  drivers/gpu/drm/i915/display/intel_dp_mst.c        |    26 +-
>  drivers/gpu/drm/i915/display/intel_dp_tunnel.c     |   811 +
>  drivers/gpu/drm/i915/display/intel_dp_tunnel.h     |   133 +
>  drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |   186 +-
>  drivers/gpu/drm/i915/display/intel_dpll_mgr.h      |    21 +-
>  drivers/gpu/drm/i915/display/intel_drrs.c          |     6 +
>  drivers/gpu/drm/i915/display/intel_dsb.c           |     6 +-
>  drivers/gpu/drm/i915/display/intel_dsi.h           |     4 -
>  drivers/gpu/drm/i915/display/intel_dvo.c           |    10 +
>  drivers/gpu/drm/i915/display/intel_dvo_dev.h       |    25 -
>  drivers/gpu/drm/i915/display/intel_fb.c            |     7 +-
>  drivers/gpu/drm/i915/display/intel_fbc.c           |    13 +-
>  drivers/gpu/drm/i915/display/intel_fbdev_fb.c      |     5 +-
>  drivers/gpu/drm/i915/display/intel_global_state.c  |   137 +-
>  drivers/gpu/drm/i915/display/intel_global_state.h  |    13 +-
>  drivers/gpu/drm/i915/display/intel_gmbus.c         |     5 +-
>  drivers/gpu/drm/i915/display/intel_hdcp.c          |   296 +-
>  drivers/gpu/drm/i915/display/intel_hdcp.h          |     7 +-
>  drivers/gpu/drm/i915/display/intel_hdcp_gsc.c      |     2 +-
>  drivers/gpu/drm/i915/display/intel_hdcp_regs.h     |    28 +-
>  drivers/gpu/drm/i915/display/intel_hdmi.c          |    22 +-
>  drivers/gpu/drm/i915/display/intel_hotplug.c       |   165 +-
>  drivers/gpu/drm/i915/display/intel_hotplug.h       |     4 +
>  drivers/gpu/drm/i915/display/intel_hotplug_irq.c   |     6 +-
>  drivers/gpu/drm/i915/display/intel_link_bw.c       |    27 +-
>  drivers/gpu/drm/i915/display/intel_link_bw.h       |     2 +-
>  drivers/gpu/drm/i915/display/intel_opregion.c      |   182 +-
>  drivers/gpu/drm/i915/display/intel_opregion.h      |    47 +-
>  drivers/gpu/drm/i915/display/intel_panel.c         |     4 +
>  drivers/gpu/drm/i915/display/intel_plane_initial.c |   255 +-
>  drivers/gpu/drm/i915/display/intel_plane_initial.h |     4 +-
>  drivers/gpu/drm/i915/display/intel_pps.c           |     2 +-
>  drivers/gpu/drm/i915/display/intel_psr.c           |   202 +-
>  drivers/gpu/drm/i915/display/intel_psr.h           |     6 -
>  drivers/gpu/drm/i915/display/intel_psr_regs.h      |    63 +
>  drivers/gpu/drm/i915/display/intel_sdvo.c          |   230 +-
>  drivers/gpu/drm/i915/display/intel_tc.c            |    40 +-
>  drivers/gpu/drm/i915/display/intel_tc.h            |     2 +-
>  drivers/gpu/drm/i915/display/intel_tv.c            |     7 +-
>  drivers/gpu/drm/i915/display/intel_vblank.c        |   130 +
>  drivers/gpu/drm/i915/display/intel_vblank.h        |    12 +
>  drivers/gpu/drm/i915/display/skl_universal_plane.c |    33 +
>  drivers/gpu/drm/i915/display/skl_universal_plane.h |     2 +
>  drivers/gpu/drm/i915/display/skl_watermark.c       |   108 +-
>  drivers/gpu/drm/i915/display/skl_watermark.h       |     4 +-
>  drivers/gpu/drm/i915/display/skl_watermark_regs.h  |     4 +
>  drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |     8 -
>  drivers/gpu/drm/i915/gem/i915_gem_pm.c             |    10 +
>  drivers/gpu/drm/i915/gem/i915_gem_region.c         |     2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |    25 +-
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |    50 +-
>  drivers/gpu/drm/i915/gem/i915_gem_userptr.c        |    45 +-
>  drivers/gpu/drm/i915/gem/i915_gem_userptr.h        |    14 -
>  drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |    18 +-
>  drivers/gpu/drm/i915/gt/gen8_engine_cs.c           |     4 +-
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c          |     3 +-
>  drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c   |     6 +-
>  drivers/gpu/drm/i915/gt/intel_ggtt.c               |    10 +-
>  drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c        |    18 +-
>  drivers/gpu/drm/i915/gt/intel_gtt.c                |     3 +-
>  drivers/gpu/drm/i915/gt/intel_mocs.c               |     2 +-
>  drivers/gpu/drm/i915/gt/intel_rc6.c                |     2 +-
>  drivers/gpu/drm/i915/gt/intel_region_lmem.c        |    14 +-
>  drivers/gpu/drm/i915/gt/intel_reset.c              |     3 +-
>  drivers/gpu/drm/i915/gt/intel_workarounds.c        |    30 +-
>  drivers/gpu/drm/i915/gt/selftest_context.c         |     3 +-
>  .../gpu/drm/i915/gt/selftest_engine_heartbeat.c    |    10 +-
>  drivers/gpu/drm/i915/gt/selftest_rc6.c             |     4 +-
>  drivers/gpu/drm/i915/gt/selftest_tlb.c             |     4 +-
>  drivers/gpu/drm/i915/gt/uc/intel_guc.h             |     2 -
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c         |    21 +-
>  drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c          |    10 +-
>  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |   126 +-
>  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h  |     2 +
>  drivers/gpu/drm/i915/gt/uc/intel_huc.c             |    64 +-
>  drivers/gpu/drm/i915/gt/uc/intel_uc.c              |     4 +-
>  drivers/gpu/drm/i915/gvt/fb_decoder.h              |    11 -
>  drivers/gpu/drm/i915/gvt/gtt.h                     |     3 -
>  drivers/gpu/drm/i915/gvt/gvt.h                     |     5 -
>  drivers/gpu/drm/i915/gvt/interrupt.c               |     1 -
>  drivers/gpu/drm/i915/gvt/interrupt.h               |     2 -
>  drivers/gpu/drm/i915/gvt/kvmgt.c                   |     2 +-
>  drivers/gpu/drm/i915/gvt/mmio.h                    |     2 -
>  drivers/gpu/drm/i915/gvt/scheduler.h               |     2 -
>  drivers/gpu/drm/i915/i915_debugfs.c                |     2 +-
>  drivers/gpu/drm/i915/i915_driver.c                 |    28 +-
>  drivers/gpu/drm/i915/i915_drm_client.c             |     2 +-
>  drivers/gpu/drm/i915/i915_drm_client.h             |     2 -
>  drivers/gpu/drm/i915/i915_drv.h                    |     8 -
>  drivers/gpu/drm/i915/i915_gem.c                    |     5 -
>  drivers/gpu/drm/i915/i915_gpu_error.c              |     2 +-
>  drivers/gpu/drm/i915/i915_perf.c                   |     2 +-
>  drivers/gpu/drm/i915/i915_perf_types.h             |     1 -
>  drivers/gpu/drm/i915/i915_query.c                  |    35 +-
>  drivers/gpu/drm/i915/i915_reg.h                    |    18 +-
>  drivers/gpu/drm/i915/i915_request.c                |     1 -
>  drivers/gpu/drm/i915/i915_syncmap.c                |    19 +-
>  drivers/gpu/drm/i915/i915_utils.c                  |    17 +
>  drivers/gpu/drm/i915/i915_utils.h                  |     2 +
>  drivers/gpu/drm/i915/i915_vma_types.h              |     1 -
>  drivers/gpu/drm/i915/intel_memory_region.c         |    33 +-
>  drivers/gpu/drm/i915/intel_memory_region.h         |     5 +-
>  drivers/gpu/drm/i915/intel_region_ttm.c            |     8 +-
>  drivers/gpu/drm/i915/intel_uncore.c                |     5 +-
>  drivers/gpu/drm/i915/selftests/i915_active.c       |     8 +-
>  .../gpu/drm/i915/selftests/intel_memory_region.c   |     4 +-
>  drivers/gpu/drm/i915/soc/intel_pch.c               |    16 +-
>  drivers/gpu/drm/i915/soc/intel_pch.h               |     6 +-
>  drivers/gpu/drm/imx/dcss/dcss-blkctl.c             |    13 +-
>  drivers/gpu/drm/imx/dcss/dcss-ctxld.c              |    14 +-
>  drivers/gpu/drm/imx/dcss/dcss-dev.c                |    17 +-
>  drivers/gpu/drm/imx/dcss/dcss-dev.h                |     1 -
>  drivers/gpu/drm/imx/dcss/dcss-dpr.c                |    21 +-
>  drivers/gpu/drm/imx/dcss/dcss-drv.c                |    12 +-
>  drivers/gpu/drm/imx/dcss/dcss-dtg.c                |    26 +-
>  drivers/gpu/drm/imx/dcss/dcss-scaler.c             |    21 +-
>  drivers/gpu/drm/imx/dcss/dcss-ss.c                 |    12 +-
>  drivers/gpu/drm/imx/ipuv3/imx-ldb.c                |     2 +-
>  drivers/gpu/drm/ingenic/Kconfig                    |     1 -
>  drivers/gpu/drm/lima/lima_ctx.c                    |     2 +-
>  drivers/gpu/drm/lima/lima_ctx.h                    |     1 -
>  drivers/gpu/drm/lima/lima_gem.c                    |    23 +-
>  drivers/gpu/drm/lima/lima_gp.c                     |    39 +-
>  drivers/gpu/drm/lima/lima_l2_cache.c               |     6 +-
>  drivers/gpu/drm/lima/lima_mmu.c                    |    18 +-
>  drivers/gpu/drm/lima/lima_pmu.c                    |     3 +-
>  drivers/gpu/drm/lima/lima_pp.c                     |    37 +-
>  drivers/gpu/drm/lima/lima_sched.c                  |    38 +-
>  drivers/gpu/drm/lima/lima_sched.h                  |     3 +-
>  drivers/gpu/drm/loongson/lsdc_drv.c                |     2 +-
>  drivers/gpu/drm/loongson/lsdc_ttm.c                |     2 -
>  drivers/gpu/drm/mcde/Kconfig                       |     1 -
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h            |     4 +
>  drivers/gpu/drm/mediatek/mtk_disp_merge.c          |    65 +
>  drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c    |    43 +
>  drivers/gpu/drm/mediatek/mtk_dp.c                  |    31 +-
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |    29 +-
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c        |     1 +
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h        |    12 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c             |     4 +-
>  drivers/gpu/drm/mediatek/mtk_dsi.c                 |   310 +-
>  drivers/gpu/drm/mediatek/mtk_hdmi.c                |    26 +-
>  drivers/gpu/drm/meson/meson_drv.c                  |     6 +-
>  drivers/gpu/drm/meson/meson_encoder_cvbs.c         |    24 +-
>  drivers/gpu/drm/meson/meson_encoder_cvbs.h         |     2 +-
>  drivers/gpu/drm/meson/meson_encoder_dsi.c          |    23 +-
>  drivers/gpu/drm/meson/meson_encoder_dsi.h          |     2 +-
>  drivers/gpu/drm/meson/meson_encoder_hdmi.c         |    35 +-
>  drivers/gpu/drm/meson/meson_encoder_hdmi.h         |     2 +-
>  drivers/gpu/drm/mgag200/Kconfig                    |    12 +
>  drivers/gpu/drm/mgag200/mgag200_drv.c              |    26 +-
>  drivers/gpu/drm/mgag200/mgag200_mode.c             |    22 +-
>  drivers/gpu/drm/msm/Makefile                       |     5 +-
>  drivers/gpu/drm/msm/adreno/a2xx.xml.h              |    73 +-
>  drivers/gpu/drm/msm/adreno/a3xx.xml.h              |   131 +-
>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |    13 +-
>  drivers/gpu/drm/msm/adreno/a4xx.xml.h              |   182 +-
>  drivers/gpu/drm/msm/adreno/a5xx.xml.h              |   666 +-
>  drivers/gpu/drm/msm/adreno/a6xx.xml.h              |  5275 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |     8 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h          |   179 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |   220 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |   727 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |   311 +-
>  drivers/gpu/drm/msm/adreno/adreno_common.xml.h     |   260 +-
>  drivers/gpu/drm/msm/adreno/adreno_device.c         |    69 +-
>  .../gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h  |   928 +
>  .../gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h  |   753 +
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h            |    31 +-
>  drivers/gpu/drm/msm/adreno/adreno_pm4.xml.h        |   573 +-
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h |   291 +
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h |   225 +
>  .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   |   449 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |   347 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |    33 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |    41 +-
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |    95 +-
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |    92 +-
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |   188 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |     4 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |     3 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c         |     2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |    17 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |    10 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |    15 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |     1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   133 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |     1 -
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |   154 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          |    74 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c      |    61 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h      |     3 +-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c   |    42 -
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c       |    42 -
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c           |     2 -
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |    71 +-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h           |    10 -
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c           |    12 +-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.h           |     4 +-
>  drivers/gpu/drm/msm/dp/dp_audio.c                  |   101 +-
>  drivers/gpu/drm/msm/dp/dp_aux.c                    |     9 +-
>  drivers/gpu/drm/msm/dp/dp_aux.h                    |     2 +
>  drivers/gpu/drm/msm/dp/dp_catalog.c                |   271 +-
>  drivers/gpu/drm/msm/dp/dp_catalog.h                |    15 +-
>  drivers/gpu/drm/msm/dp/dp_ctrl.c                   |   375 +-
>  drivers/gpu/drm/msm/dp/dp_ctrl.h                   |    17 +-
>  drivers/gpu/drm/msm/dp/dp_debug.c                  |     3 +-
>  drivers/gpu/drm/msm/dp/dp_display.c                |   185 +-
>  drivers/gpu/drm/msm/dp/dp_display.h                |     3 +-
>  drivers/gpu/drm/msm/dp/dp_drm.c                    |     6 +-
>  drivers/gpu/drm/msm/dp/dp_drm.h                    |     3 +-
>  drivers/gpu/drm/msm/dp/dp_link.h                   |    23 -
>  drivers/gpu/drm/msm/dp/dp_panel.c                  |   119 +
>  drivers/gpu/drm/msm/dp/dp_panel.h                  |     2 +
>  drivers/gpu/drm/msm/dp/dp_parser.c                 |   327 -
>  drivers/gpu/drm/msm/dp/dp_parser.h                 |   155 -
>  drivers/gpu/drm/msm/dp/dp_power.c                  |   183 -
>  drivers/gpu/drm/msm/dp/dp_power.h                  |    95 -
>  drivers/gpu/drm/msm/dp/dp_reg.h                    |     9 +
>  drivers/gpu/drm/msm/dp/dp_utils.c                  |    96 +
>  drivers/gpu/drm/msm/dp/dp_utils.h                  |    36 +
>  drivers/gpu/drm/msm/dsi/dsi.c                      |    10 +-
>  drivers/gpu/drm/msm/dsi/dsi.h                      |    22 +-
>  drivers/gpu/drm/msm/dsi/dsi_host.c                 |    51 +-
>  drivers/gpu/drm/msm/dsi/dsi_manager.c              |    65 +-
>  drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |    33 +-
>  drivers/gpu/drm/msm/msm_drv.c                      |    33 +
>  drivers/gpu/drm/msm/msm_drv.h                      |    36 +-
>  drivers/gpu/drm/msm/msm_io_utils.c                 |    13 +
>  drivers/gpu/drm/msm/msm_kms.h                      |     4 -
>  drivers/gpu/drm/msm/msm_mdss.c                     |    64 +
>  drivers/gpu/drm/mxsfb/lcdif_drv.c                  |     7 +-
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c                  |     7 +-
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c            |     4 +-
>  drivers/gpu/drm/nouveau/dispnv50/disp.c            |     1 +
>  drivers/gpu/drm/nouveau/dispnv50/head.c            |     1 +
>  drivers/gpu/drm/nouveau/nouveau_bo.c               |    59 +-
>  drivers/gpu/drm/nouveau/nouveau_bo.h               |     1 -
>  drivers/gpu/drm/nouveau/nouveau_connector.h        |     2 +-
>  drivers/gpu/drm/nouveau/nouveau_ioc32.c            |     4 +-
>  drivers/gpu/drm/nouveau/nouveau_svm.c              |    10 +-
>  drivers/gpu/drm/nouveau/nvif/outp.c                |     3 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c     |     2 +-
>  drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c     |     3 +-
>  drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c    |   136 +-
>  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c   |     4 +-
>  drivers/gpu/drm/omapdrm/dss/hdmi4.c                |    22 +-
>  drivers/gpu/drm/omapdrm/dss/hdmi5.c                |    12 +-
>  drivers/gpu/drm/panel/Kconfig                      |   231 +-
>  drivers/gpu/drm/panel/Makefile                     |     3 +
>  drivers/gpu/drm/panel/panel-boe-himax8279d.c       |    18 +-
>  .../gpu/drm/panel/panel-boe-th101mb31ig002-28a.c   |   322 +
>  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c     |     2 +
>  drivers/gpu/drm/panel/panel-edp.c                  |   119 +-
>  drivers/gpu/drm/panel/panel-himax-hx83112a.c       |   372 +
>  drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c |    23 +-
>  drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c |   265 +-
>  drivers/gpu/drm/panel/panel-novatek-nt35510.c      |   424 +-
>  drivers/gpu/drm/panel/panel-novatek-nt36523.c      |     8 +-
>  drivers/gpu/drm/panel/panel-novatek-nt36672e.c     |   643 +
>  drivers/gpu/drm/panel/panel-samsung-atna33xc20.c   |     2 +
>  drivers/gpu/drm/panel/panel-simple.c               |    81 +-
>  drivers/gpu/drm/panel/panel-sitronix-st7703.c      |   104 +
>  drivers/gpu/drm/panel/panel-visionox-r66451.c      |     1 +
>  drivers/gpu/drm/panel/panel-visionox-vtdr6130.c    |     1 +
>  drivers/gpu/drm/pl111/Kconfig                      |     1 -
>  drivers/gpu/drm/qxl/qxl_object.c                   |     2 -
>  drivers/gpu/drm/qxl/qxl_ttm.c                      |     2 -
>  drivers/gpu/drm/radeon/atom-bits.h                 |     2 +-
>  drivers/gpu/drm/radeon/atom.c                      |    47 +-
>  drivers/gpu/drm/radeon/atom.h                      |     4 +-
>  drivers/gpu/drm/radeon/atombios_crtc.c             |    28 +-
>  drivers/gpu/drm/radeon/atombios_dp.c               |     4 +-
>  drivers/gpu/drm/radeon/atombios_encoders.c         |    38 +-
>  drivers/gpu/drm/radeon/atombios_i2c.c              |     2 +-
>  drivers/gpu/drm/radeon/btc_dpm.c                   |    90 +-
>  drivers/gpu/drm/radeon/ci_dpm.c                    |    31 +-
>  drivers/gpu/drm/radeon/ci_dpm.h                    |     6 +-
>  drivers/gpu/drm/radeon/cik.c                       |    40 +-
>  drivers/gpu/drm/radeon/clearstate_cayman.h         |     9 +-
>  drivers/gpu/drm/radeon/clearstate_ci.h             |     3 +-
>  drivers/gpu/drm/radeon/evergreen.c                 |    20 +-
>  drivers/gpu/drm/radeon/evergreen_cs.c              |     4 +-
>  drivers/gpu/drm/radeon/evergreen_reg.h             |    10 +-
>  drivers/gpu/drm/radeon/evergreen_smc.h             |     9 +-
>  drivers/gpu/drm/radeon/kv_dpm.c                    |     9 +-
>  drivers/gpu/drm/radeon/kv_smc.c                    |     2 +-
>  drivers/gpu/drm/radeon/ni.c                        |    33 +-
>  drivers/gpu/drm/radeon/ni_dpm.c                    |     3 -
>  drivers/gpu/drm/radeon/ni_dpm.h                    |    12 +-
>  drivers/gpu/drm/radeon/nislands_smc.h              |    51 +-
>  drivers/gpu/drm/radeon/r100.c                      |     2 +-
>  drivers/gpu/drm/radeon/r300_reg.h                  |     2 +-
>  drivers/gpu/drm/radeon/r600.c                      |     3 +-
>  drivers/gpu/drm/radeon/r600_dpm.c                  |     6 +-
>  drivers/gpu/drm/radeon/r600_dpm.h                  |     3 +-
>  drivers/gpu/drm/radeon/radeon.h                    |     6 +-
>  drivers/gpu/drm/radeon/radeon_asic.c               |     8 +-
>  drivers/gpu/drm/radeon/radeon_atombios.c           |    44 +-
>  drivers/gpu/drm/radeon/radeon_atpx_handler.c       |    12 +-
>  drivers/gpu/drm/radeon/radeon_audio.c              |    11 +-
>  drivers/gpu/drm/radeon/radeon_audio.h              |     6 +-
>  drivers/gpu/drm/radeon/radeon_mode.h               |     9 +-
>  drivers/gpu/drm/radeon/radeon_object.c             |     2 -
>  drivers/gpu/drm/radeon/radeon_pm.c                 |     4 +-
>  drivers/gpu/drm/radeon/radeon_ttm.c                |     8 +-
>  drivers/gpu/drm/radeon/radeon_uvd.c                |     1 -
>  drivers/gpu/drm/radeon/rs400.c                     |     4 +-
>  drivers/gpu/drm/radeon/rs600.c                     |     3 +-
>  drivers/gpu/drm/radeon/rv515.c                     |     3 +-
>  drivers/gpu/drm/radeon/rv6xx_dpm.h                 |     3 +-
>  drivers/gpu/drm/radeon/rv770_dpm.c                 |     4 +-
>  drivers/gpu/drm/radeon/rv770_smc.h                 |    27 +-
>  drivers/gpu/drm/radeon/si.c                        |   103 +-
>  drivers/gpu/drm/radeon/si_dpm.c                    |   132 +-
>  drivers/gpu/drm/radeon/si_dpm.h                    |    21 +-
>  drivers/gpu/drm/radeon/smu7.h                      |     6 +-
>  drivers/gpu/drm/radeon/smu7_discrete.h             |    51 +-
>  drivers/gpu/drm/radeon/smu7_fusion.h               |    42 +-
>  drivers/gpu/drm/radeon/sumo_dpm.c                  |    18 +-
>  drivers/gpu/drm/radeon/trinity_dpm.c               |    22 +-
>  drivers/gpu/drm/radeon/trinity_dpm.h               |     3 +-
>  drivers/gpu/drm/radeon/uvd_v1_0.c                  |     2 +-
>  drivers/gpu/drm/renesas/Kconfig                    |     1 +
>  drivers/gpu/drm/renesas/Makefile                   |     1 +
>  drivers/gpu/drm/renesas/rz-du/Kconfig              |    12 +
>  drivers/gpu/drm/renesas/rz-du/Makefile             |     8 +
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c      |   422 +
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.h      |    89 +
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c       |   175 +
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h       |    78 +
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c   |    72 +
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.h   |    32 +
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c       |   371 +
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h       |    43 +
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c       |   349 +
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h       |    82 +
>  drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |     3 +
>  drivers/gpu/drm/rockchip/inno_hdmi.c               |   549 +-
>  drivers/gpu/drm/rockchip/inno_hdmi.h               |     5 -
>  drivers/gpu/drm/rockchip/rockchip_lvds.c           |     3 +-
>  drivers/gpu/drm/rockchip/rockchip_vop_reg.c        |    13 +-
>  drivers/gpu/drm/rockchip/rockchip_vop_reg.h        |     3 +
>  drivers/gpu/drm/scheduler/sched_fence.c            |     4 +-
>  drivers/gpu/drm/scheduler/sched_main.c             |    11 +-
>  drivers/gpu/drm/solomon/ssd130x-spi.c              |     7 +
>  drivers/gpu/drm/solomon/ssd130x.c                  |   370 +
>  drivers/gpu/drm/solomon/ssd130x.h                  |     5 +-
>  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |   134 +-
>  drivers/gpu/drm/tegra/dpaux.c                      |    14 +-
>  drivers/gpu/drm/tegra/drm.h                        |     2 +-
>  drivers/gpu/drm/tegra/dsi.c                        |    59 +-
>  drivers/gpu/drm/tegra/fb.c                         |     1 +
>  drivers/gpu/drm/tegra/hdmi.c                       |    21 +-
>  drivers/gpu/drm/tegra/output.c                     |    17 +-
>  drivers/gpu/drm/tegra/rgb.c                        |    18 +-
>  drivers/gpu/drm/tegra/sor.c                        |     1 +
>  drivers/gpu/drm/tests/drm_connector_test.c         |   170 +-
>  drivers/gpu/drm/tests/drm_kunit_helpers.c          |   150 +
>  drivers/gpu/drm/tests/drm_managed_test.c           |    77 +-
>  drivers/gpu/drm/tests/drm_mm_test.c                |     2 +-
>  drivers/gpu/drm/tidss/tidss_crtc.c                 |    10 +
>  drivers/gpu/drm/tidss/tidss_plane.c                |     2 +-
>  drivers/gpu/drm/tilcdc/tilcdc_drv.c                |    19 +-
>  drivers/gpu/drm/ttm/tests/Makefile                 |     3 +
>  drivers/gpu/drm/ttm/tests/ttm_bo_test.c            |   622 +
>  drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c      |    48 +-
>  drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h      |     3 +
>  drivers/gpu/drm/ttm/tests/ttm_pool_test.c          |     3 +-
>  drivers/gpu/drm/ttm/tests/ttm_resource_test.c      |   335 +
>  drivers/gpu/drm/ttm/tests/ttm_tt_test.c            |   295 +
>  drivers/gpu/drm/ttm/ttm_bo.c                       |    30 +-
>  drivers/gpu/drm/ttm/ttm_bo_util.c                  |    13 +-
>  drivers/gpu/drm/ttm/ttm_resource.c                 |    76 +-
>  drivers/gpu/drm/ttm/ttm_tt.c                       |    15 +
>  drivers/gpu/drm/tve200/Kconfig                     |     1 -
>  drivers/gpu/drm/v3d/v3d_bo.c                       |    12 +-
>  drivers/gpu/drm/v3d/v3d_debugfs.c                  |    17 +-
>  drivers/gpu/drm/v3d/v3d_drv.h                      |     2 +
>  drivers/gpu/drm/v3d/v3d_irq.c                      |     2 +-
>  drivers/gpu/drm/v3d/v3d_mmu.c                      |     2 -
>  drivers/gpu/drm/vc4/vc4_hdmi.c                     |     1 +
>  drivers/gpu/drm/vc4/vc4_plane.c                    |    10 +-
>  drivers/gpu/drm/virtio/virtgpu_submit.c            |     6 +-
>  drivers/gpu/drm/vkms/Kconfig                       |    15 +
>  drivers/gpu/drm/vkms/vkms_composer.c               |    14 +-
>  drivers/gpu/drm/vmwgfx/ttm_object.c                |     6 +-
>  drivers/gpu/drm/vmwgfx/ttm_object.h                |     3 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.c                 |    33 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |     1 -
>  drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c            |    20 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c      |     5 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |   300 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.h                |     6 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c                |     5 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c               |     5 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c               |    21 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_surface.c            |    18 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c         |    32 -
>  drivers/gpu/drm/xe/.kunitconfig                    |     5 +
>  drivers/gpu/drm/xe/Kconfig                         |     3 +-
>  drivers/gpu/drm/xe/Kconfig.debug                   |     1 -
>  drivers/gpu/drm/xe/Makefile                        |    45 +-
>  drivers/gpu/drm/xe/abi/gsc_proxy_commands_abi.h    |    44 +
>  drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h     |   174 +
>  drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h |     3 +-
>  drivers/gpu/drm/xe/abi/guc_messages_abi.h          |     2 +
>  drivers/gpu/drm/xe/abi/guc_relay_actions_abi.h     |    79 +
>  .../gpu/drm/xe/abi/guc_relay_communication_abi.h   |   118 +
>  drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h  |    10 +-
>  .../drm/xe/compat-i915-headers/i915_gem_stolen.h   |     3 +
>  drivers/gpu/drm/xe/{ =3D> display}/xe_display.c      |     0
>  drivers/gpu/drm/xe/{ =3D> display}/xe_display.h      |     0
>  drivers/gpu/drm/xe/display/xe_plane_initial.c      |    67 +-
>  drivers/gpu/drm/xe/instructions/xe_mi_commands.h   |     3 +
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h           |     6 +
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h               |    27 +-
>  drivers/gpu/drm/xe/regs/xe_lrc_layout.h            |     9 +
>  drivers/gpu/drm/xe/regs/xe_pcode_regs.h            |    21 +
>  drivers/gpu/drm/xe/tests/Makefile                  |     7 +-
>  drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c      |   201 +
>  drivers/gpu/drm/xe/tests/xe_guc_relay_test.c       |   522 +
>  drivers/gpu/drm/xe/tests/xe_kunit_helpers.c        |    90 +
>  drivers/gpu/drm/xe/tests/xe_kunit_helpers.h        |    17 +
>  drivers/gpu/drm/xe/tests/xe_mocs.c                 |    36 +
>  drivers/gpu/drm/xe/tests/xe_mocs_test.c            |     1 +
>  drivers/gpu/drm/xe/tests/xe_mocs_test.h            |     1 +
>  drivers/gpu/drm/xe/tests/xe_pci.c                  |     3 +
>  drivers/gpu/drm/xe/tests/xe_pci_test.c             |     5 -
>  drivers/gpu/drm/xe/tests/xe_pci_test.h             |     2 +
>  drivers/gpu/drm/xe/tests/xe_rtp_test.c             |    10 +-
>  drivers/gpu/drm/xe/tests/xe_test_mod.c             |    10 +
>  drivers/gpu/drm/xe/tests/xe_wa_test.c              |    16 +-
>  drivers/gpu/drm/xe/xe_bo.c                         |   134 +-
>  drivers/gpu/drm/xe/xe_bo.h                         |     7 +-
>  drivers/gpu/drm/xe/xe_bo_types.h                   |     3 +
>  drivers/gpu/drm/xe/xe_debugfs.c                    |     1 +
>  drivers/gpu/drm/xe/xe_devcoredump.c                |    55 +-
>  drivers/gpu/drm/xe/xe_devcoredump.h                |     6 +-
>  drivers/gpu/drm/xe/xe_devcoredump_types.h          |    13 +-
>  drivers/gpu/drm/xe/xe_device.c                     |    75 +-
>  drivers/gpu/drm/xe/xe_device.h                     |    10 +
>  drivers/gpu/drm/xe/xe_device_types.h               |   166 +-
>  drivers/gpu/drm/xe/xe_drm_client.c                 |    14 +-
>  drivers/gpu/drm/xe/xe_exec.c                       |    42 +-
>  drivers/gpu/drm/xe/xe_exec_queue.c                 |   133 +-
>  drivers/gpu/drm/xe/xe_exec_queue.h                 |     3 +-
>  drivers/gpu/drm/xe/xe_exec_queue_types.h           |    55 +-
>  drivers/gpu/drm/xe/xe_execlist.c                   |     8 -
>  drivers/gpu/drm/xe/xe_ggtt.c                       |    81 +-
>  drivers/gpu/drm/xe/xe_ggtt.h                       |     3 +
>  drivers/gpu/drm/xe/xe_gsc.c                        |    71 +-
>  drivers/gpu/drm/xe/xe_gsc.h                        |     1 +
>  drivers/gpu/drm/xe/xe_gsc_proxy.c                  |   537 +
>  drivers/gpu/drm/xe/xe_gsc_proxy.h                  |    20 +
>  drivers/gpu/drm/xe/xe_gsc_submit.c                 |    20 +
>  drivers/gpu/drm/xe/xe_gsc_submit.h                 |     1 +
>  drivers/gpu/drm/xe/xe_gsc_types.h                  |    33 +
>  drivers/gpu/drm/xe/xe_gt.c                         |    92 +-
>  drivers/gpu/drm/xe/xe_gt.h                         |     2 +
>  drivers/gpu/drm/xe/xe_gt_mcr.c                     |    17 +
>  drivers/gpu/drm/xe/xe_gt_pagefault.c               |    44 +-
>  drivers/gpu/drm/xe/xe_gt_printk.h                  |    44 +
>  drivers/gpu/drm/xe/xe_gt_sriov_printk.h            |    34 +
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c        |    13 +-
>  drivers/gpu/drm/xe/xe_gt_topology.c                |     4 +-
>  drivers/gpu/drm/xe/xe_gt_types.h                   |   118 +-
>  drivers/gpu/drm/xe/xe_guc.c                        |   115 +-
>  drivers/gpu/drm/xe/xe_guc.h                        |     1 +
>  drivers/gpu/drm/xe/xe_guc_ads.c                    |     2 +-
>  drivers/gpu/drm/xe/xe_guc_ct.c                     |   255 +-
>  drivers/gpu/drm/xe/xe_guc_ct.h                     |    12 +-
>  drivers/gpu/drm/xe/xe_guc_ct_types.h               |    22 +-
>  drivers/gpu/drm/xe/xe_guc_db_mgr.c                 |   266 +
>  drivers/gpu/drm/xe/xe_guc_db_mgr.h                 |    22 +
>  drivers/gpu/drm/xe/xe_guc_fwif.h                   |     1 +
>  drivers/gpu/drm/xe/xe_guc_hwconfig.c               |     2 +-
>  drivers/gpu/drm/xe/xe_guc_hxg_helpers.h            |   108 +
>  drivers/gpu/drm/xe/xe_guc_log.c                    |     2 +-
>  drivers/gpu/drm/xe/xe_guc_pc.c                     |    19 +-
>  drivers/gpu/drm/xe/xe_guc_pc.h                     |     1 -
>  drivers/gpu/drm/xe/xe_guc_relay.c                  |   941 +
>  drivers/gpu/drm/xe/xe_guc_relay.h                  |    37 +
>  drivers/gpu/drm/xe/xe_guc_relay_types.h            |    36 +
>  drivers/gpu/drm/xe/xe_guc_submit.c                 |    88 +-
>  drivers/gpu/drm/xe/xe_guc_submit.h                 |     4 +-
>  drivers/gpu/drm/xe/xe_guc_submit_types.h           |    18 +-
>  drivers/gpu/drm/xe/xe_guc_types.h                  |    47 +-
>  drivers/gpu/drm/xe/xe_heci_gsc.c                   |     2 +-
>  drivers/gpu/drm/xe/xe_huc.c                        |    19 +
>  drivers/gpu/drm/xe/xe_huc.h                        |     1 +
>  drivers/gpu/drm/xe/xe_hw_engine.c                  |   144 +-
>  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c      |    38 +-
>  drivers/gpu/drm/xe/xe_hw_engine_types.h            |    82 +-
>  drivers/gpu/drm/xe/xe_hwmon.c                      |    32 +-
>  drivers/gpu/drm/xe/xe_irq.c                        |   136 +-
>  drivers/gpu/drm/xe/xe_lrc.c                        |    38 +
>  drivers/gpu/drm/xe/xe_lrc_types.h                  |     6 +-
>  drivers/gpu/drm/xe/xe_memirq.c                     |   430 +
>  drivers/gpu/drm/xe/xe_memirq.h                     |    26 +
>  drivers/gpu/drm/xe/xe_memirq_types.h               |    37 +
>  drivers/gpu/drm/xe/xe_migrate.c                    |    27 +-
>  drivers/gpu/drm/xe/xe_mmio.c                       |     9 +-
>  drivers/gpu/drm/xe/xe_mocs.c                       |    27 +-
>  drivers/gpu/drm/xe/xe_pat.c                        |     5 +
>  drivers/gpu/drm/xe/xe_pci.c                        |    10 +-
>  drivers/gpu/drm/xe/xe_pcode_api.h                  |     7 +
>  drivers/gpu/drm/xe/xe_pm.c                         |    38 +-
>  drivers/gpu/drm/xe/xe_pm.h                         |     1 +
>  drivers/gpu/drm/xe/xe_pt.c                         |     5 +-
>  drivers/gpu/drm/xe/xe_query.c                      |    50 +-
>  drivers/gpu/drm/xe/xe_reg_sr.c                     |     2 +-
>  drivers/gpu/drm/xe/xe_reg_whitelist.c              |     8 +
>  drivers/gpu/drm/xe/xe_ring_ops.c                   |    60 +-
>  drivers/gpu/drm/xe/xe_sched_job.c                  |    38 +
>  drivers/gpu/drm/xe/xe_sched_job.h                  |     5 +
>  drivers/gpu/drm/xe/xe_sched_job_types.h            |    11 +-
>  drivers/gpu/drm/xe/xe_sriov.c                      |    32 +
>  drivers/gpu/drm/xe/xe_sriov.h                      |     1 +
>  drivers/gpu/drm/xe/xe_sriov_types.h                |    12 +
>  drivers/gpu/drm/xe/xe_tile_sysfs.c                 |     3 +
>  drivers/gpu/drm/xe/xe_trace.h                      |    55 +-
>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c             |     8 +-
>  drivers/gpu/drm/xe/xe_tuning.c                     |     9 +-
>  drivers/gpu/drm/xe/xe_uc.c                         |    33 +-
>  drivers/gpu/drm/xe/xe_uc.h                         |     1 +
>  drivers/gpu/drm/xe/xe_uc_fw.c                      |    60 +-
>  drivers/gpu/drm/xe/xe_uc_fw_types.h                |     9 +-
>  drivers/gpu/drm/xe/xe_vm.c                         |   202 +-
>  drivers/gpu/drm/xe/xe_vm.h                         |     7 +-
>  drivers/gpu/drm/xe/xe_vm_types.h                   |    32 +-
>  drivers/gpu/drm/xe/xe_vram_freq.c                  |   128 +
>  drivers/gpu/drm/xe/xe_vram_freq.h                  |    13 +
>  drivers/gpu/drm/xe/xe_wa.c                         |   191 +-
>  drivers/gpu/drm/xe/xe_wa_oob.rules                 |    12 +-
>  drivers/gpu/drm/xe/xe_wait_user_fence.c            |     2 +-
>  drivers/gpu/drm/xe/xe_wopcm_types.h                |     4 +-
>  drivers/gpu/drm/xlnx/zynqmp_disp.c                 |     2 +-
>  drivers/gpu/drm/xlnx/zynqmp_dp.c                   |    22 +-
>  drivers/gpu/host1x/bus.c                           |     2 +-
>  drivers/gpu/host1x/bus.h                           |     2 +-
>  drivers/gpu/host1x/cdma.c                          |     3 +-
>  drivers/macintosh/via-pmu-backlight.c              |     1 +
>  drivers/media/i2c/tc358743.c                       |     7 +-
>  drivers/staging/fbtft/fb_ssd1351.c                 |     2 +
>  drivers/staging/sm750fb/Kconfig                    |     1 -
>  drivers/video/Kconfig                              |     9 +-
>  drivers/video/Makefile                             |     7 +-
>  drivers/video/backlight/corgi_lcd.c                |     1 +
>  drivers/video/cmdline.c                            |     2 +
>  drivers/video/fbdev/Kconfig                        |    35 -
>  drivers/video/fbdev/chipsfb.c                      |     1 +
>  drivers/video/fbdev/core/Kconfig                   |     2 +-
>  drivers/video/fbdev/core/fbmem.c                   |     2 -
>  drivers/video/fbdev/efifb.c                        |   225 +-
>  drivers/video/fbdev/geode/Kconfig                  |     3 -
>  drivers/video/fbdev/simplefb.c                     |     2 +-
>  drivers/video/fbdev/vesafb.c                       |    78 +-
>  drivers/video/screen_info_generic.c                |   146 +
>  drivers/video/screen_info_pci.c                    |   136 +
>  include/drm/display/drm_dp.h                       |    62 +
>  include/drm/display/drm_dp_helper.h                |    14 +-
>  include/drm/display/drm_dp_tunnel.h                |   248 +
>  include/drm/drm_atomic.h                           |    70 +-
>  include/drm/drm_bridge.h                           |    27 +-
>  include/drm/drm_edid.h                             |    46 +-
>  include/drm/drm_exec.h                             |     4 +-
>  include/drm/drm_fixed.h                            |     2 +-
>  include/drm/drm_gem.h                              |    13 +
>  include/drm/drm_gpuvm.h                            |     2 +-
>  include/drm/drm_kunit_helpers.h                    |    23 +
>  include/drm/drm_managed.h                          |     4 +
>  include/drm/drm_modes.h                            |     2 +
>  include/drm/drm_print.h                            |   223 +-
>  include/drm/drm_probe_helper.h                     |     1 -
>  include/drm/drm_rect.h                             |     4 +-
>  include/drm/i915_pciids.h                          |     7 +-
>  include/drm/ttm/ttm_placement.h                    |    10 +-
>  include/drm/ttm/ttm_resource.h                     |     8 +-
>  include/drm/ttm/ttm_tt.h                           |     9 +-
>  include/linux/fb.h                                 |    31 +-
>  include/linux/iosys-map.h                          |     2 +-
>  include/linux/screen_info.h                        |   126 +
>  include/linux/sysfb.h                              |     6 +-
>  include/sound/hdmi-codec.h                         |     1 -
>  include/uapi/drm/amdgpu_drm.h                      |     2 +
>  include/uapi/drm/etnaviv_drm.h                     |     5 +
>  include/uapi/drm/i915_drm.h                        |    16 +
>  include/uapi/drm/nouveau_drm.h                     |    56 +-
>  include/uapi/drm/qaic_accel.h                      |    13 +-
>  include/uapi/drm/vmwgfx_drm.h                      |     6 +-
>  include/uapi/drm/xe_drm.h                          |    33 +-
>  include/uapi/linux/kfd_ioctl.h                     |     3 +-
>  include/uapi/linux/virtio_gpu.h                    |     2 +
>  include/video/cmdline.h                            |     8 +-
>  tools/edid/1024x768.S                              |    43 -
>  tools/edid/1280x1024.S                             |    43 -
>  tools/edid/1600x1200.S                             |    43 -
>  tools/edid/1680x1050.S                             |    43 -
>  tools/edid/1920x1080.S                             |    43 -
>  tools/edid/800x600.S                               |    40 -
>  tools/edid/Makefile                                |    37 -
>  tools/edid/edid.S                                  |   274 -
>  tools/edid/hex                                     |     1 -
>  1198 files changed, 189574 insertions(+), 16526 deletions(-)
>  create mode 100644
> Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
>  create mode 100644
> Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pvi.yaml
>  create mode 100644
> Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
>  create mode 100644
> Documentation/devicetree/bindings/display/panel/boe,th101mb31ig002-28a.ya=
ml
>  create mode 100644
> Documentation/devicetree/bindings/display/panel/himax,hx83112a.yaml
>  create mode 100644
> Documentation/devicetree/bindings/display/panel/novatek,nt36672e.yaml
>  create mode 100644
> Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
>  create mode 100644
> Documentation/devicetree/bindings/display/solomon,ssd133x.yaml
>  create mode 100644 Documentation/gpu/amdgpu/display/dcn-blocks.rst
>  create mode 100644 Documentation/gpu/amdgpu/display/display-contributing=
.rst
>  delete mode 100644 Documentation/gpu/rfc/xe.rst
>  create mode 100644 drivers/accel/habanalabs/common/mmu/mmu_v2.c
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.h
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/athub_v4_1_0.c
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/athub_v4_1_0.h
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/hdp_v7_0.c
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/hdp_v7_0.h
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/ih_v7_0.c
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/ih_v7_0.h
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.h
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/lsdma_v7_0.c
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/lsdma_v7_0.h
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/nbif_v6_3_1.c
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/nbif_v6_3_1.h
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/psp_v14_0.c
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/psp_v14_0.h
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.h
>  delete mode 100644 drivers/gpu/drm/amd/display/TODO
>  delete mode 100644
> drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr_clk.c
>  create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.=
c
>  create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.=
h
>  delete mode 100644 drivers/gpu/drm/amd/display/dc/hwss/dcn351/CMakeLists=
.txt
>  create mode 100644
> drivers/gpu/drm/amd/display/dc/irq/dcn351/irq_service_dcn351.c
>  create mode 100644
> drivers/gpu/drm/amd/display/dc/irq/dcn351/irq_service_dcn351.h
>  create mode 100644
> drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
>  create mode 100644
> drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.h
>  create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn351.c
>  create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn351.h
>  create mode 100644
> drivers/gpu/drm/amd/include/asic_reg/athub/athub_4_1_0_offset.h
>  create mode 100644
> drivers/gpu/drm/amd/include/asic_reg/athub/athub_4_1_0_sh_mask.h
>  create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_5_1_of=
fset.h
>  create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_5_1_sh=
_mask.h
>  create mode 100644 drivers/gpu/drm/amd/include/asic_reg/hdp/hdp_7_0_0_of=
fset.h
>  create mode 100644 drivers/gpu/drm/amd/include/asic_reg/hdp/hdp_7_0_0_sh=
_mask.h
>  create mode 100644
> drivers/gpu/drm/amd/include/asic_reg/lsdma/lsdma_7_0_0_offset.h
>  create mode 100644
> drivers/gpu/drm/amd/include/asic_reg/lsdma/lsdma_7_0_0_sh_mask.h
>  create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mp/mp_14_0_2_off=
set.h
>  create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mp/mp_14_0_2_sh_=
mask.h
>  create mode 100644
> drivers/gpu/drm/amd/include/asic_reg/nbif/nbif_6_3_1_offset.h
>  create mode 100644
> drivers/gpu/drm/amd/include/asic_reg/nbif/nbif_6_3_1_sh_mask.h
>  create mode 100644
> drivers/gpu/drm/amd/include/asic_reg/oss/osssys_7_0_0_offset.h
>  create mode 100644
> drivers/gpu/drm/amd/include/asic_reg/oss/osssys_7_0_0_sh_mask.h
>  create mode 100644
> drivers/gpu/drm/amd/include/asic_reg/pcie/pcie_6_1_0_offset.h
>  create mode 100644
> drivers/gpu/drm/amd/include/asic_reg/pcie/pcie_6_1_0_sh_mask.h
>  create mode 100644 drivers/gpu/drm/amd/include/asic_reg/vcn/vcn_5_0_0_of=
fset.h
>  create mode 100644 drivers/gpu/drm/amd/include/asic_reg/vcn/vcn_5_0_0_sh=
_mask.h
>  create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
>  create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
>  delete mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-fails.txt
>  delete mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-flakes.txt
>  delete mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt
>  create mode 100644
> drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
>  create mode 100644
> drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
>  create mode 100644
> drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
>  create mode 100644
> drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
>  create mode 100644 drivers/gpu/drm/display/drm_dp_tunnel.c
>  create mode 100644 drivers/gpu/drm/i915/display/intel_dp_tunnel.c
>  create mode 100644 drivers/gpu/drm/i915/display/intel_dp_tunnel.h
>  delete mode 100644 drivers/gpu/drm/i915/gem/i915_gem_userptr.h
>  create mode 100644 drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h
>  create mode 100644 drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.=
h
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.=
h
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e8010=
0.h
>  delete mode 100644 drivers/gpu/drm/msm/dp/dp_parser.c
>  delete mode 100644 drivers/gpu/drm/msm/dp/dp_parser.h
>  delete mode 100644 drivers/gpu/drm/msm/dp/dp_power.c
>  delete mode 100644 drivers/gpu/drm/msm/dp/dp_power.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_utils.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_utils.h
>  create mode 100644 drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
>  create mode 100644 drivers/gpu/drm/panel/panel-himax-hx83112a.c
>  create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt36672e.c
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/Kconfig
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/Makefile
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.h
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.h
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h
>  create mode 100644 drivers/gpu/drm/ttm/tests/ttm_bo_test.c
>  create mode 100644 drivers/gpu/drm/ttm/tests/ttm_resource_test.c
>  create mode 100644 drivers/gpu/drm/ttm/tests/ttm_tt_test.c
>  create mode 100644 drivers/gpu/drm/vkms/Kconfig
>  create mode 100644 drivers/gpu/drm/xe/abi/gsc_proxy_commands_abi.h
>  create mode 100644 drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
>  create mode 100644 drivers/gpu/drm/xe/abi/guc_relay_actions_abi.h
>  create mode 100644 drivers/gpu/drm/xe/abi/guc_relay_communication_abi.h
>  rename drivers/gpu/drm/xe/{ =3D> display}/xe_display.c (100%)
>  rename drivers/gpu/drm/xe/{ =3D> display}/xe_display.h (100%)
>  create mode 100644 drivers/gpu/drm/xe/regs/xe_pcode_regs.h
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_guc_relay_test.c
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_test_mod.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gsc_proxy.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gsc_proxy.h
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_printk.h
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_db_mgr.c
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_db_mgr.h
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_hxg_helpers.h
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_relay.c
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_relay.h
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_relay_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_memirq.c
>  create mode 100644 drivers/gpu/drm/xe/xe_memirq.h
>  create mode 100644 drivers/gpu/drm/xe/xe_memirq_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_vram_freq.c
>  create mode 100644 drivers/gpu/drm/xe/xe_vram_freq.h
>  create mode 100644 drivers/video/screen_info_generic.c
>  create mode 100644 drivers/video/screen_info_pci.c
>  create mode 100644 include/drm/display/drm_dp_tunnel.h
>  delete mode 100644 tools/edid/1024x768.S
>  delete mode 100644 tools/edid/1280x1024.S
>  delete mode 100644 tools/edid/1600x1200.S
>  delete mode 100644 tools/edid/1680x1050.S
>  delete mode 100644 tools/edid/1920x1080.S
>  delete mode 100644 tools/edid/800x600.S
>  delete mode 100644 tools/edid/Makefile
>  delete mode 100644 tools/edid/edid.S
>  delete mode 100644 tools/edid/hex
