Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EF6A1492B
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 06:23:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 929FA10EA50;
	Fri, 17 Jan 2025 05:23:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gN19N8bZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A426E10EA50
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 05:22:59 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ab2b29dfc65so260703266b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 21:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737091378; x=1737696178; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zw4Hu+YhlgJQbYkPRqu1/MawHxZK1MOf5MFkR+uUpp4=;
 b=gN19N8bZ9W/2mBhVoPP0+Yqmgy3sCSOcG4zt4uubc0DmBDc7HYtaIHXIoc0mlmjs6H
 6EVNulrD9+nS6EsWM3lt3/pqhHSh4OzEcmRWXfL865QI/5g58fDdwYB+sAlfo0TgHqjS
 qDUzVY/A9TIGOxGoCagFF+5g1fL/yfzfB/oXxyZ9hV7pKbtW4S4vfgnevRcWXGlRr6bx
 un27c3moC0GeeiuydtCA/VT0YuIY/Wq/jLUkv0Np2td7qqGn67T9dnOGLisbNV0CaO1I
 UN0t1bXoMAE2nbcrQAbXL1MU5/mRvKWj6iVmOrT2qn7LSdEbX6Qb6Ko+3zWtO0+KKgFN
 /MCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737091378; x=1737696178;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zw4Hu+YhlgJQbYkPRqu1/MawHxZK1MOf5MFkR+uUpp4=;
 b=IWC+2Zgp6EvuV0cm7KkHnfNBVOR4HX32tSdmZBPzG34KpGkXOLU7OBtMHdQ+nb22hI
 9T7LuReQv0/tUR9EiA8Wh4JzqnNzp7fvYOBWPjROkfpZrFwgDDaaexilfnLPib4cLJpo
 ppkcCN+lyZYiy5mobo6QQ44Rk6nD5PJYT+zntgaUTF9ZvRgvfo3XjU77djnXd6vQnUQ1
 QL/1Efu4fIpWNrA7WHj2gUBfxcENjv1EiVU610e4mItYXVBr00zZeUZmwbkK5ToysrA4
 zGly5w1+eJDn/LtpABbIuDMHlWp+qET1rxjHxfIDwalc25F8Ycl28om1S4oNeZW7NxLf
 Fvmw==
X-Gm-Message-State: AOJu0YwONiNIwr0OwetVXTAiftPX51YoKzFnbfQENv8TdZ35EazOD8K9
 +8j1jm7KU5Te1NRqK1JdsDTtW0e4JTrIgCr05TnqR6Gzf/6suA9GdSz6sQi5bMxWTJ900I/7DvM
 K4diO7yCWpfORh992kmlW758uy3QdfGqQ
X-Gm-Gg: ASbGncvbs/6XLaEEd5kAVVgkRD56QUVsP8Ok6OgNqW5pGJ6LOPkyNx7q8GXdh/rtBP+
 1TG2Yplmo6nfDl9fxR/bVavJIPyH0IrNH+t/wZ7HCoNu4a1N5DA==
X-Google-Smtp-Source: AGHT+IHpdxNr73H6OOrygrelDMR1Bab2xYMhjfCfSwAKYNTG5pBdUlw/3cNxx7yQmiWDo25Ni0G68D6NKmFoS9bMYAw=
X-Received: by 2002:a17:907:6d1d:b0:aae:c9bf:41b3 with SMTP id
 a640c23a62f3a-ab38b36bd3amr123209066b.37.1737091377286; Thu, 16 Jan 2025
 21:22:57 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 17 Jan 2025 15:22:44 +1000
X-Gm-Features: AbW1kvYCBRf2oQl0enTEQ2rekjwYgS1OlGhosYqwVOX2x2VKdul15L4Mqfg0URQ
Message-ID: <CAPM=9tw+ySbm80B=zHVhodMFoS_fqNw_v4yVURCv3cc9ukvYYg@mail.gmail.com>
Subject: [git pull] drm for 6.14-rc1 (sending early due to holidays)
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

I'm away for next 10 days, so in advance of the merge window opening
and to demonstrate that I can do it, here is an early pull request.

I've done a trial merge to your current tree and only had minor merge
conflicts, of course this may change over time, but I think you can
take care of them or ping someone to help.

There are two external interactions of note, the msm tree pull in some
opp tree, hopefully the opp tree arrives from the same git tree
however it normally does.

There is also a new cgroup controller for device memory, that is used
by drm, so is merging through my tree. This will hopefully help open
up gpu cgroup usage a bit more and move us forward.

There is a new accelerator driver for the AMD XDNA Ryzen AI NPUs.

Then the usual xe/amdgpu/i915/msm leaders and lots of
changes/refactors across the board,

I should be back by the end of the merge window, and Sima is around if
anything needs escalating.

Regards,
Dave.

drm-next-2025-01-17:
drm next for 6.14-rc1

core:
- device memory cgroup controller added
- Remove driver date from drm_driver
- Add drm_printer based hex dumper
- drm memory stats docs update
- scheduler documentation improvements

new driver:
- amdxdna - Ryzen AI NPU support

connector:
- add a mutex to protect ELD
- make connector setup two-step

panels:
- Introduce backlight quirks infrastructure
- New panels: KDB KD116N2130B12, Tianma TM070JDHG34-00,
- Multi-Inno Technology MI1010Z1T-1CP11

bridge:
- ti-sn65dsi83: Add ti,lvds-vod-swing optional properties
- Provide default implementation of atomic_check for HDMI bridges
- it605: HDCP improvements, MCCS Support

xe:
- make OA buffer size configurable
- GuC capture fixes
- add ufence and g2h flushes
- restore system memory GGTT mappings
- ioctl fixes
- SRIOV PF scheduling priority
- allow fault injection
- lots of improvements/refactors
- Enable GuC's WA_DUAL_QUEUE for newer platforms
- IRQ related fixes and improvements

i915:
- More accurate engine busyness metrics with GuC submission
- Ensure partial BO segment offset never exceeds allowed max
- Flush GuC CT receive tasklet during reset preparation
- Some DG2 refactor to fix DG2 bugs when operating with certain CPUs
- Fix DG1 power gate sequence
- Enabling uncompressed 128b/132b UHBR SST
- Handle hdmi connector init failures, and no HDMI/DP cases
- More robust engine resets on Haswell and older

i915/xe display:
- HDCP fixes for Xe3Lpd
- New GSC FW ARL-H/ARL-U
- support 3 VDSC engines 12 slices
- MBUS joining sanitisation
- reconcile i915/xe display power mgmt
- Xe3Lpd fixes
- UHBR rates for Thunderbolt

amdgpu:
- DRM panic support
- track BO memory stats at runtime
- Fix max surface handling in DC
- Cleaner shader support for gfx10.3 dGPUs
- fix drm buddy trim handling
- SDMA engine reset updates
- Fix doorbell ttm cleanup
- RAS updates
- ISP updates
- SDMA queue reset support
- Rework DPM powergating interfaces
- Documentation updates and cleanups
- DCN 3.5 updates
- Use a pm notifier to more gracefully handle VRAM eviction on suspend
or hibernate
- Add debugfs interfaces for forcing scheduling to specific engine instance=
s
- GG 9.5 updates
- IH 4.4 updates
- Make missing optional firmware less noisy
- PSP 13.x updates
- SMU 13.x updates
- VCN 5.x updates
- JPEG 5.x updates
- GC 12.x updates
- DC FAMS updates

amdkfd:
- GG 9.5 updates
- Logging improvements
- Shader debugger fixes
- Trap handler cleanup
- Cleanup includes
- Eviction fence wq fix

msm:
- MDSS:
- properly described UBWC registers
- added SM6150 (aka QCS615) support
- DPU:
- added SM6150 (aka QCS615) support
- enabled wide planes if virtual planes are enabled (by using two
SSPPs for a single plane)
- added CWB hardware blocks support
- DSI:
- added SM6150 (aka QCS615) support
- GPU:
- Print GMU core fw version
- GMU bandwidth voting for a740 and a750
- Expose uche trap base via uapi
- UAPI error reporting

rcar-du:
- Add r8a779h0 Support

ivpu:
- Fix qemu crash when using passthrough

nouveau:
- expose GSP-RM logging buffers via debugfs

panfrost:
- Add MT8188 Mali-G57 MC3 support

rockchip:
- Gamma LUT support

hisilicon:
- new HIBMC support

virtio-gpu:
- convert to helpers
- add prime support for scanout buffers

v3d:
- Add DRM_IOCTL_V3D_PERFMON_SET_GLOBAL

vc4:
- Add support for BCM2712

vkms:
- line-per-line compositing algorithm to improve performance

zynqmp:
- Add DP audio support

mediatek:
- dp: Add sdp path reset
- dp: Support flexible length of DP calibration data

etnaviv:
- add fdinfo memory support
- add explicit reset handling
The following changes since commit 9d89551994a430b50c4fffcb1e617a057fa76e20=
:

  Linux 6.13-rc6 (2025-01-05 14:13:40 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2025-01-17

for you to fetch changes up to 951a6bf30667307e7901aac5e74e50dadd5ccfc7:

  Merge tag 'drm-misc-next-fixes-2025-01-16' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
(2025-01-17 10:43:21 +1000)

----------------------------------------------------------------
drm next for 6.14-rc1

core:
- device memory cgroup controller added
- Remove driver date from drm_driver
- Add drm_printer based hex dumper
- drm memory stats docs update
- scheduler documentation improvements

new driver:
- amdxdna - Ryzen AI NPU support

connector:
- add a mutex to protect ELD
- make connector setup two-step

panels:
- Introduce backlight quirks infrastructure
- New panels: KDB KD116N2130B12, Tianma TM070JDHG34-00,
- Multi-Inno Technology MI1010Z1T-1CP11

bridge:
- ti-sn65dsi83: Add ti,lvds-vod-swing optional properties
- Provide default implementation of atomic_check for HDMI bridges
- it605: HDCP improvements, MCCS Support

xe:
- make OA buffer size configurable
- GuC capture fixes
- add ufence and g2h flushes
- restore system memory GGTT mappings
- ioctl fixes
- SRIOV PF scheduling priority
- allow fault injection
- lots of improvements/refactors
- Enable GuC's WA_DUAL_QUEUE for newer platforms
- IRQ related fixes and improvements

i915:
- More accurate engine busyness metrics with GuC submission
- Ensure partial BO segment offset never exceeds allowed max
- Flush GuC CT receive tasklet during reset preparation
- Some DG2 refactor to fix DG2 bugs when operating with certain CPUs
- Fix DG1 power gate sequence
- Enabling uncompressed 128b/132b UHBR SST
- Handle hdmi connector init failures, and no HDMI/DP cases
- More robust engine resets on Haswell and older

i915/xe display:
- HDCP fixes for Xe3Lpd
- New GSC FW ARL-H/ARL-U
- support 3 VDSC engines 12 slices
- MBUS joining sanitisation
- reconcile i915/xe display power mgmt
- Xe3Lpd fixes
- UHBR rates for Thunderbolt

amdgpu:
- DRM panic support
- track BO memory stats at runtime
- Fix max surface handling in DC
- Cleaner shader support for gfx10.3 dGPUs
- fix drm buddy trim handling
- SDMA engine reset updates
- Fix doorbell ttm cleanup
- RAS updates
- ISP updates
- SDMA queue reset support
- Rework DPM powergating interfaces
- Documentation updates and cleanups
- DCN 3.5 updates
- Use a pm notifier to more gracefully handle VRAM eviction on suspend
or hibernate
- Add debugfs interfaces for forcing scheduling to specific engine instance=
s
- GG 9.5 updates
- IH 4.4 updates
- Make missing optional firmware less noisy
- PSP 13.x updates
- SMU 13.x updates
- VCN 5.x updates
- JPEG 5.x updates
- GC 12.x updates
- DC FAMS updates

amdkfd:
- GG 9.5 updates
- Logging improvements
- Shader debugger fixes
- Trap handler cleanup
- Cleanup includes
- Eviction fence wq fix

msm:
- MDSS:
- properly described UBWC registers
- added SM6150 (aka QCS615) support
- DPU:
- added SM6150 (aka QCS615) support
- enabled wide planes if virtual planes are enabled (by using two
SSPPs for a single plane)
- added CWB hardware blocks support
- DSI:
- added SM6150 (aka QCS615) support
- GPU:
- Print GMU core fw version
- GMU bandwidth voting for a740 and a750
- Expose uche trap base via uapi
- UAPI error reporting

rcar-du:
- Add r8a779h0 Support

ivpu:
- Fix qemu crash when using passthrough

nouveau:
- expose GSP-RM logging buffers via debugfs

panfrost:
- Add MT8188 Mali-G57 MC3 support

rockchip:
- Gamma LUT support

hisilicon:
- new HIBMC support

virtio-gpu:
- convert to helpers
- add prime support for scanout buffers

v3d:
- Add DRM_IOCTL_V3D_PERFMON_SET_GLOBAL

vc4:
- Add support for BCM2712

vkms:
- line-per-line compositing algorithm to improve performance

zynqmp:
- Add DP audio support

mediatek:
- dp: Add sdp path reset
- dp: Support flexible length of DP calibration data

etnaviv:
- add fdinfo memory support
- add explicit reset handling

----------------------------------------------------------------
Abhinav Kumar (6):
      drm/msm/dp: do not touch the MMSS_DP_INTF_CONFIG for tpg
      drm/msm/dp: dont call dp_catalog_ctrl_mainlink_ctrl in
dp_ctrl_configure_source_params()
      drm/msm/dp: disable the opp table request even for dp_ctrl_off_link()
      drm/msm/dpu: check dpu_plane_atomic_print_state() for valid sspp
      drm/msm/dpu: filter out too wide modes if no 3dmux is present
      dt-bindings: display: msm: dp: update maintainer entry

Ahmad Fatoum (3):
      dt-bindings: vendor-prefixes: add prefix for Topland Electronics (H.K=
)
      dt-bindings: display: panel-simple: Document Topland TIAN-G07017-01
      drm: panel-simple: support TOPLAND TIAN G07017 LCD panel

Akash Goel (2):
      drm/panthor: Update memattr programing to align with GPU spec
      drm/panthor: Explicitly set the coherency mode

Alex Deucher (18):
      drm/amdgpu: update irq sec header for jpeg 5.0.0
      drm/amdgpu: update irq sec header for vcn 5.0.0
      drm/amdgpu: add ip_dump support for vcn 5.0.1
      drm/amdgpu: add sysfs reset mask for vcn 5.0.1
      drm/amdgpu/jpeg4.0.3: use num_jpeg_inst for SR-IOV
      drm/amdgpu/jpeg5.0.1: use num_jpeg_inst for SR-IOV
      drm/amdgpu: add generic display panic helper code
      drm/amd/display: add clear_tiling hubp callbacks
      drm/amd/display: add clear_tiling mi callbacks
      drm/amd/display/dc: add helper for panic updates
      drm/amd/display: add non-DC drm_panic support
      drm/amdgpu/nbio7.7: fix IP version check
      drm/amdgpu/nbio7.0: fix IP version check
      drm/amdgpu/nbio7.11: fix IP version check
      drm/amdgpu/mmhub4.1: fix IP version check
      drm/amdgpu/gfx12: fix IP version check
      drm/amdgpu/smu14.0.2: fix IP version check
      drm/amdgpu/smu13: update powersave optimizations

Alex Hung (3):
      drm/amd/display: Fix uninitialized variables in amdgpu_dm_debugfs
      drm/amd/display: Remove unnecessary amdgpu_irq_get/put
      drm/amd/display: Initialize denominator defaults to 1

Alex Sierra (5):
      drm/amd: define gc ip version local variable
      drm/amdgpu: Set proper MTYPE for GC 9.5.0
      drm/amd: update mtype flags for gfx 9.5.0
      drm/amdkfd: add gc 9.5.0 support on kfd
      drm/amdgpu: add ih cam support for IH 4.4.4

Alvin Lee (1):
      drm/amd/display: Update FAMS2 config cmd

Andrej Picej (2):
      dt-bindings: drm/bridge: ti-sn65dsi83: Add properties for
ti,lvds-vod-swing
      drm/bridge: ti-sn65dsi83: Add ti,lvds-vod-swing optional properties

Andrew Martin (3):
      drm/amdkfd: Uninitialized pointer read
      drm/amdkfd: Failed to check various return code
      drm/amdgpu: Failed to check various return code

Andy Yan (12):
      drm/rockchip: vop2: Don't spam logs in atomic update
      drm/rockchip: vop2: Fix cluster windows alpha ctrl regsiters offset
      drm/rockchip: vop2: Fix the mixer alpha setup for layer 0
      drm/rockchip: Fix Copyright description
      drm/rockchip: vop2: Add debugfs support
      drm/rockchip: vop2: Fix the windows switch between different layers
      drm/rockchip: vop2: Set AXI id for rk3588
      drm/rockchip: vop2: Setup delay cycle for Esmart2/3
      drm/rockchip: vop2: Check linear format for Cluster windows on rk3566=
/8
      drm/rockchip: vop2: Add check for 32 bpp format for rk3588
      drm/bridge: synopsys: Fix Copyright Writing Style of dw-hdmi-qp
      drm/rockchip: vop2: Support 32x8 superblock afbc

AngeloGioacchino Del Regno (1):
      drm/panfrost: Add GPU ID for MT8188 Mali-G57 MC3

Animesh Manna (2):
      drm/i915/psr: Disable psr1 if setup_time > vblank
      drm/i915/display: Adjust Added Wake Time with PKG_C_LATENCY

Ankit Nautiyal (24):
      drm/i915/dp: Update Comment for Valid DSC Slices per Line
      drm/i915/display: Prepare for dsc 3 stream splitter
      drm/i915/vdsc: Use VDSC0/VDSC1 for LEFT/RIGHT VDSC engine
      drm/i915/vdsc: Introduce 3rd VDSC engine VDSC2
      drm/i915/vdsc: Add support for read/write PPS for 3rd DSC engine
      drm/i915/dp: Ensure hactive is divisible by slice count
      drm/i915/dp: Enable 3 DSC engines for 12 slices
      drm/i915/dp: Limit max compressed bpp to 18 when forcing DSC
      drm/i915/display/xe3lpd: Avoid setting YUV420_MODE in PIPE_MISC
      drm/i915/dp: Refactor FEC support check in intel_dp_supports_dsc
      drm/i915/dp: Return early if DSC not supported
      drm/i915/dp: Separate out helper for compute fec_enable
      drm/i915/dp: Drop check for FEC in intel_dp_fec_compute_config
      drm/i915/dp: Remove HAS_DSC macro for intel_dp_dsc_max_src_input_bpc
      drm/i915/dp: Return int from dsc_max/min_src_input_bpc helpers
      drm/i915/dp_mst: Use helpers to get dsc min/max input bpc
      drm/i915/dp: Drop max_requested_bpc for dsc pipe_min/max bpp
      drm/i915/dp: Refactor pipe_bpp limits with dsc
      drm/i915/dp_mst: Use pipe_bpp->limits.{max/min}_bpp for dsc
      drm/i915/dp: Use clamp for pipe_bpp limits with DSC
      drm/i915/dp: Make dsc helpers accept const crtc_state pointers
      drm/i915/dp: Set the DSC link limits in
intel_dp_compute_config_link_bpp_limits
      drm/i915/dp_mst: Use link.{min/max}_bpp_x16
      drm/i915/dp: Return early if dsc is required but not supported

Apoorva Singh (2):
      drm/xe/xe3lpg: Add Wa_16024792527
      drm/i915/gt: Prevent uninitialized pointer reads

Aric Cyr (5):
      drm/amd/display: 3.2.311
      drm/amd/display: 3.2.312
      drm/amd/display: 3.2.313
      drm/amd/display: 3.2.314
      drm/amd/display: Optimize cursor position updates

Arnd Bergmann (5):
      drm/rockchip: avoid 64-bit division
      drm/log: select CONFIG_FONT_SUPPORT
      accel/amdxdna: use modern PM helpers
      accel/amdxdna: include linux/slab.h
      drm/msm: fix -Wformat-security warnings

Arthur Grillo (1):
      drm/vkms: Use drm_frame directly

Arun R Murthy (3):
      drm/i915/dp: use fsleep instead of usleep_range for LT
      drm/i915/dp: read Aux RD interval just before setting the FFE preset
      drm/i915/dp: Include the time taken by AUX Tx for timeout

Arunpravin Paneer Selvam (1):
      drm/amdgpu: Add a lock when accessing the buddy trim function

Asad Kamal (5):
      drm/amd/pm: Add smu_v13_0_12 support
      drm/amd/pm: Add mode2 support for SMU v13.0.12
      drm/amdgpu: Fetch refclock for SMU v13.0.12
      drm/amd/pm: Update SMUv13.0.6 PMFW headers
      drm/amd/pm: Fill max mem bw & total app clk counter

Ashutosh Dixit (2):
      drm/xe/oa: Fix "Missing outer runtime PM protection" warning
      drm/xe/oa/uapi: Expose an unblock after N reports OA property

Aurabindo Pillai (3):
      drm/amd: Update atomfirmware: add new retimer definition
      drm/amd/display: Add guards around MAX/MIN
      Revert "drm/amd/display: Optimize cursor position updates"

Ausef Yousof (2):
      drm/amd/display: Populate chroma prefetch parameters, DET buffer fix
      drm/amd/display: Overwriting dualDPP UBF values before usage

Austin Zheng (3):
      drm/amd/display: DML21 Update Prefetch Calculations
      drm/amd/display: DML21 Reintegration For Various Fixes
      drm/amd/display: Apply DML21 Patches

Bagas Sanjaya (1):
      drm/sched: Fix drm_sched_fini() docu generation

Baihan Li (5):
      drm/hisilicon/hibmc: add dp aux in hibmc drivers
      drm/hisilicon/hibmc: add dp link moduel in hibmc drivers
      drm/hisilicon/hibmc: add dp hw moduel in hibmc driver
      drm/hisilicon/hibmc: refactored struct hibmc_drm_private
      drm/hisilicon/hibmc: add dp module in hibmc

Balasubramani Vivekanandan (2):
      drm/xe: Set mask bits for CCS_MODE register
      drm/xe: Use the filelist from drm for ccs_mode change

Biju Das (2):
      drm: renesas: rz-du: Drop DU_MCR0_DPI_OE macro
      drm: renesas: rz-du: rzg2l_du_encoder: Fix max dot clock for DPI

Bokun Zhang (1):
      drm/amdgpu/vcn: reset fw_shared under SRIOV

Boris Brezillon (7):
      drm/panthor: Fix a typo in the FW iface flag definitions
      drm/panthor: Preserve the result returned by panthor_fw_resume()
      drm/panthor: Be robust against runtime PM resume failures in the
suspend path
      drm/panthor: Ignore devfreq_{suspend, resume}_device() failures
      drm/panthor: Be robust against resume failures
      drm/panthor: Fix the fast-reset logic
      drm/panthor: Report innocent group kill

Boyuan Zhang (8):
      drm/amd/pm: power up or down vcn by instance
      drm/amd/pm: add inst to smu_dpm_set_vcn_enable
      drm/amd/pm: add inst to set_powergating_by_smu
      drm/amd/pm: add inst to dpm_set_powergating_by_smu
      drm/amdgpu: add inst to amdgpu_dpm_enable_vcn
      drm/amdgpu: pass ip_block in set_powergating_state
      drm/amdgpu: pass ip_block in set_clockgating_state
      drm/amdgpu: move per inst variables to amdgpu_vcn_inst

Brandon Syu (1):
      drm/amd/display: modify init dc_power_state

Candice Li (5):
      drm/amdgpu: Add psp v14_0_3 ras support
      drm/amdgpu: Add umc v8_14_0 ip headers
      drm/amdgpu: Add umc v8_14 ras functions
      drm/amdgpu: Support nbif v6_3_1 fatal error handling
      drm/amdgpu: Enable psp v14_0_3 RAS support for non-SRIOV configuratio=
ns.

Charlene Liu (4):
      drm/amd/display: correct dcn351 dpm clk table based on pmfw_drv_if
      drm/amd/display: update dcn351 used clock offset
      drm/amd/display: init dc_power_state
      drm/amd/display: avoid reset DTBCLK at clock init

Chen-Yu Tsai (1):
      drm/panel: visionox-rm69299: Remove redundant assignments of panel fi=
elds

Chris Brandt (1):
      drm: renesas: rz-du: Increase supported resolutions

Chris Park (2):
      drm/amd/display: Update color space, bias and scale programming seque=
nce
      drm/amd/display: Block Invalid TMDS operation

Christian Gmeiner (3):
      drm/v3d: Stop active perfmon if it is being destroyed
      drm/etnaviv: Add fdinfo support for memory stats
      drm/v3d: Add DRM_IOCTL_V3D_PERFMON_SET_GLOBAL

Christian K=C3=B6nig (7):
      drm/xe: drop unused component dependencies
      drm/radeon: switch over to drm_exec v2
      drm/qxl: switch to using drm_exec v2
      drm/ttm: use GEM references for VM mappings
      drm/amdgpu: fix amdgpu_coredump
      drm/amdgpu: set the VM pointer to NULL in amdgpu_job_prepare
      drm/amdgpu: partially revert "reduce reset time"

Christophe JAILLET (2):
      drm/bridge: Constify struct i2c_device_id
      drm/amd/pm: Fix an error handling path in
vega10_enable_se_edc_force_stall_config()

Colin Ian King (1):
      drm/msm/a5xx: remove null pointer check on pdev

Cristian Ciocaltea (3):
      drm/rockchip: dw_hdmi_qp: Add support for RK3588 HDMI1 output
      drm/rockchip: dw_hdmi_qp: Simplify clock handling
      drm/display: hdmi: Do not read EDID on disconnected connectors

Cruise (1):
      drm/amd/display: Adjust DPCD read for DP tunneling

Dan Carpenter (4):
      drm/vc4: unlock on error in vc4_hvs_get_fifo_frame_count()
      opp: core: Fix off by one in dev_pm_opp_get_bw()
      drm/msm/gem: prevent integer overflow in msm_ioctl_gem_submit()
      drm/amdgpu: Fix shift type in amdgpu_debugfs_sdma_sched_mask_set()

Daniele Ceraolo Spurio (5):
      drm/i915/gsc: ARL-H and ARL-U need a newer GSC FW.
      drm/xe/gsc: Improve SW proxy error checking and logging
      drm/xe: Call invalidation_fence_fini for PT inval fences in error sta=
te
      drm/xe/guc: Enable WA_DUAL_QUEUE for newer platforms
      drm/xe/gsc: Make GSCCS disabling message less alarming

Danilo Krummrich (1):
      drm/nouveau: create module debugfs root

Danylo Piliaiev (1):
      drm/msm: Expose uche trap base via uapi

Dave Airlie (18):
      Merge tag 'drm-misc-next-2024-12-05' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'drm-xe-next-2024-12-11' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
      Merge tag 'drm-intel-gt-next-2024-12-18' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      Merge tag 'v6.13-rc3' into drm-next
      Merge tag 'amd-drm-next-6.14-2024-12-18' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-misc-next-2024-12-19' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'mediatek-drm-next-6.14' of
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux
into drm-next
      Merge tag 'drm-misc-next-2025-01-06' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'drm-xe-next-2025-01-07' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
      Merge tag 'drm-intel-next-2025-01-07' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      Merge tag 'drm-etnaviv-next-2025-01-08' of
https://git.pengutronix.de/git/lst/linux into drm-next
      Merge tag 'v6.13-rc6' into drm-next
      Merge tag 'cgroup-dmem-drm-v2' of
git://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux into
drm-next
      Merge tag 'drm-intel-gt-next-2025-01-10' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      Merge tag 'drm-xe-next-2025-01-10' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
      Merge tag 'amd-drm-next-6.14-2025-01-10' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-msm-next-2025-01-07' of
gitlab.freedesktop.org:drm/msm into drm-next
      Merge tag 'drm-misc-next-fixes-2025-01-16' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next

Dave Stevenson (9):
      drm/vc4: Use of_device_get_match_data to set generation
      drm/vc4: Fix reading of frame count on GEN5 / Pi4
      drm/vc4: drv: Add support for 2712 D-step
      drm/vc4: hvs: Add in support for 2712 D-step.
      drm/vc4: plane: Add support for 2712 D-step.
      drm/vc4: hdmi: Support 2712 D-step register map
      drm/vc4: Enable bg_fill if there are no planes enabled
      drm/vc4: Drop planes that are completely off-screen or 0 crtc size
      drm/vc4: plane: Remove WARN on state being set in plane_reset

Dennis Chan (2):
      drm/amd/display: Revised for Replay Pseudo vblank control
      drm/amd/display: Revised for Replay Pseudo vblank control

Dennis.Chan (1):
      drm/amd/display: Implement Replay Low Hz Visual Confirm

Derek Foreman (1):
      drm/connector: Allow clearing HDMI infoframes

Devarsh Thakkar (2):
      drm/tidss: Clear the interrupt status for interrupts being disabled
      drm/tidss: Fix race condition while handling interrupt registers

Dheeraj Reddy Jonnalagadda (1):
      drm/amdgpu: simplify return statement in amdgpu_ras_eeprom_init

Dillon Varone (5):
      drm/amd/display: Add support for FAMS2+ interface versions
      drm/amd/display: Add new message for DF throttling optimization on dc=
n401
      drm/amd/display: Re-validate streams on commit_streams
      drm/amd/display: Cleanup outdated interfaces in dcn401_clk_mgr
      drm/amd/display: Add SMU interface to get UMC count for dcn401

Dmitry Baryshkov (62):
      drm/msm/dp: set safe_to_exit_level before printing it
      drm/msm/dp: fix msm_dp_utils_pack_sdp_header interface
      dt-bindings: display/msm: qcom,sa8775p-mdss: fix the example
      drm/tests: hdmi: handle empty modes in find_preferred_mode()
      drm/tests: hdmi: rename connector creation function
      drm/tests: hdmi: return meaningful value from set_connector_edid()
      drm/display: hdmi: add generic mode_valid helper
      drm/sun4i: use drm_hdmi_connector_mode_valid()
      drm/vc4: use drm_hdmi_connector_mode_valid()
      drm/display: bridge_connector: use drm_bridge_connector_mode_valid()
      drm/bridge: lontium-lt9611: drop TMDS char rate check in mode_valid
      drm/bridge: dw-hdmi-qp: replace mode_valid with tmds_char_rate
      drm/sun4i: use drm_atomic_helper_connector_hdmi_check()
      drm/msm/dpu1: don't choke on disabling the writeback connector
      drm/msm/mdss: define bitfields for the UBWC_STATIC register
      drm/msm/mdss: reuse defined bitfields for UBWC 2.0
      drm/msm/mdss: use boolean values for macrotile_mode
      drm/msm/dpu: add support for virtual planes
      drm/msm/dpu: allow using two SSPP blocks for a single plane
      drm/msm/dpu: include SSPP allocation state into the dumped state
      drm/connector: add mutex to protect ELD from concurrent access
      drm/bridge: anx7625: use eld_mutex to protect access to connector->el=
d
      drm/bridge: ite-it66121: use eld_mutex to protect access to connector=
->eld
      drm/amd/display: use eld_mutex to protect access to connector->eld
      drm/exynos: hdmi: use eld_mutex to protect access to connector->eld
      drm/i915/audio: use eld_mutex to protect access to connector->eld
      drm/msm/dp: use eld_mutex to protect access to connector->eld
      drm/radeon: use eld_mutex to protect access to connector->eld
      drm/sti: hdmi: use eld_mutex to protect access to connector->eld
      drm/vc4: hdmi: use eld_mutex to protect access to connector->eld
      drm/msm/dp: drop msm_dp_panel_dump_regs() and msm_dp_catalog_dump_reg=
s()
      drm/msm/dp: use msm_dp_utils_pack_sdp_header() for audio packets
      drm/msm/dp: drop obsolete audio headers access through catalog
      drm/msm/dp: drop struct msm_dp_panel_in
      drm/msm/dp: stop passing panel to msm_dp_audio_get()
      drm/display: bridge_connector: provide atomic_check for HDMI bridges
      drm/bridge: ite-it6263: drop atomic_check() callback
      drm/bridge: lontium-lt9611: drop atomic_check() callback
      drm/bridge: dw-hdmi-qp: drop atomic_check() callback
      drm/msm/dpu: provide DSPP and correct LM config for SDM670
      drm/msm/dpu: link DSPP_2/_3 blocks on SM8150
      drm/msm/dpu: link DSPP_2/_3 blocks on SC8180X
      drm/msm/dpu: link DSPP_2/_3 blocks on SM8250
      drm/msm/dpu: link DSPP_2/_3 blocks on SM8350
      drm/msm/dpu: link DSPP_2/_3 blocks on SM8550
      drm/msm/dpu: link DSPP_2/_3 blocks on SM8650
      drm/msm/dpu: link DSPP_2/_3 blocks on X1E80100
      drm/msm: don't clean up priv->kms prematurely
      drm/msm/mdp4: correct LCDC regulator name
      drm/msm/dpu: get rid of struct dpu_rm_requirements
      ASoC: hdmi-codec: pass data to get_dai_id too
      ASoC: hdmi-codec: move no_capture_mute to struct hdmi_codec_pdata
      drm/connector: implement generic HDMI audio helpers
      drm/bridge: connector: add support for HDMI codec framework
      drm/bridge: lt9611: switch to using the DRM HDMI codec framework
      drm/display/hdmi: implement hotplug functions
      drm/bridge_connector: hook drm_atomic_helper_connector_hdmi_hotplug()
      drm/vc4: hdmi: switch to using generic HDMI Codec infrastructure
      drm/vc4: hdmi: stop rereading EDID in get_modes()
      drm/vc4: hdmi: use drm_atomic_helper_connector_hdmi_hotplug()
      drm/display: hdmi-state-helper: add drm_display_mode declaration
      drm/bridge: fix documentation for the hdmi_audio_prepare() callback

Dongwon Kim (2):
      drm/virtio: Use drm_gem_plane_helper_prepare_fb()
      drm/virtio: New fence for every plane update

Dr. David Alan Gilbert (10):
      drm/i915/gt: Remove unused execlists_unwind_incomplete_requests
      drm/bridge: cdns-mhdp8546: Remove unused functions
      drm/amd/display: Remove unused enable_surface_flip_reporting
      drm/amd/display: Remove unused dwb3_set_host_read_rate_control
      drm/amd/display: Remove unused dc_stream_warmup_writeback
      drm/amd/display: Remove unused mmhubbub_warmup field
      drm/amd/display: Remove unused dcn_find_dcfclk_suits_all
      drm/i915: Remove deadcode
      drm/i915: Remove unused intel_huc_suspend
      drm/i915: Remove unused intel_ring_cacheline_align

Dustin L. Howett (1):
      drm: panel-backlight-quirks: Add Framework 13 glossy and 2.8k panels

Easwar Hariharan (1):
      drm/etnaviv: Convert timeouts to secs_to_jiffies()

Esha Bharadwaj (3):
      drm/msm/dpu: Add CWB entry to catalog for SM8650
      drm/msm/dpu: add devcoredumps for cwb registers
      drm/msm/dpu: add CWB support to dpu_hw_wb

Eugene Kobyak (1):
      drm/i915: Fix NULL pointer dereference in capture_engine

Everest K.C. (1):
      drm/xe/guc: Fix dereference before NULL check

Fabio Estevam (1):
      dt-bindings: display: panel-lvds: Add compatible for AUO G084SN05 V9

Fangzhi Zuo (2):
      drm/amd/display: Fix Mode Cutoff in DSC Passthrough to DP2.1 Monitor
      drm/amd/display: Add Interface to Dump DSC Caps from dm

Fei Shao (1):
      drm/mediatek: dp: Support flexible length of DP calibration data

Francois Dugast (1):
      drm/xe: Allow fault injection in vm create and vm bind IOCTLs

Gabe Teeger (2):
      Revert "drm/amd/display: Revised for Replay Pseudo vblank"
      drm/amd/display: Limit Scaling Ratio on DCN3.01

George Shen (6):
      drm/amd/display: Disable MPC rate control on ODM pipe update
      drm/amd/display: Parse RECEIVE_PORT0_CAP capabilities from DPCD
      drm/amd/display: Add DP required HBlank size calc to link interface
      drm/amd/display: Add expanded HBlank field to dc_crtc_timing
      drm/amd/display: Add HBlank reduction DPCD write to DPMS sequence
      drm/amd/display: Add 6bpc RGB case for dcn32 output bpp calculations

Guoqing Jiang (1):
      drm/rockchip: Remove unnecessary checking

Gustavo Sousa (18):
      drm/i915/dmc_wl: Use i915_mmio_reg_offset() instead of reg.reg
      drm/xe: Mimic i915 behavior for non-sleeping MMIO wait
      drm/i915/dmc_wl: Use non-sleeping variant of MMIO wait
      drm/i915/dmc_wl: Check for non-zero refcount in release work
      drm/i915/dmc_wl: Get wakelock when disabling dynamic DC states
      drm/i915/dmc_wl: Use sentinel item for range tables
      drm/i915/dmc_wl: Extract intel_dmc_wl_reg_in_range()
      drm/i915/dmc_wl: Rename lnl_wl_range to powered_off_ranges
      drm/i915/dmc_wl: Track registers touched by the DMC
      drm/i915/dmc_wl: Allow simpler syntax for single reg in range tables
      drm/i915/dmc_wl: Deal with existing references when disabling
      drm/i915/dmc_wl: Couple enable/disable with dynamic DC states
      drm/i915/dmc_wl: Add and use HAS_DMC_WAKELOCK()
      drm/i915/dmc_wl: Sanitize enable_dmc_wl according to hardware support
      drm/i915/xe3lpd: Use DMC wakelock by default
      drm/i915/dmc_wl: Extract intel_dmc_wl_flush_release_work()
      drm/xe/display: Extract xe_display_pm_runtime_suspend_late()
      drm/xe/display: Flush DMC wakelock release work on runtime suspend

Gyeyoung Baek (1):
      drm/xe: Fix build error for XE_IOCTL_DBG macro

Harry VanZyllDeJong (2):
      drm/amd/display: populate VABC support in DMCUB
      drm/amd/display: Fix brightness adjustment on MiniLED

Hawking Zhang (5):
      drm/amdgpu: Apply gc v9_5_0 golden settings
      drm/amdgpu: Add psp v13_0_12 firmware specifiers
      drm/amdgpu: Load spdm_drv for psp v13_0_12
      drm/amdgpu: Enable RAS for psp v13_0_12
      drm/amdgpu: Init mmhub v1_8_1 ras func

Heiko Stuebner (4):
      drm/rockchip: vop2: fix rk3588 dp+dsi maxclk verification
      drm/bridge/synopsys: Add MIPI DSI2 host controller bridge
      dt-bindings: display: rockchip: Add schema for RK3588 DW DSI2 control=
ler
      drm/rockchip: Add MIPI DSI2 glue driver for RK3588

Hermes Wu (10):
      drm/bridge: it6505: Change definition of AUX_FIFO_MAX_SIZE
      drm/bridge: it6505: improve AUX operation for edid read
      drm/bridge: it6505: add AUX operation for HDCP KSV list read
      drm/bridge: it6505: Change definition MAX_HDCP_DOWN_STREAM_COUNT
      drm/bridge: it6505: fix HDCP Bstatus check
      drm/bridge: it6505: fix HDCP encryption when R0 ready
      drm/bridge: it6505: fix HDCP CTS KSV list read with UNIGRAF DPR-100.
      drm/bridge: it6505: fix HDCP CTS compare V matching
      drm/bridge: it6505: fix HDCP CTS KSV list wait timer
      drm/bridge: it6505: add I2C functionality on AUX

Ilia Levi (5):
      drm/xe: Use managed BO in memirq
      drm/xe: Make irq enabled flag atomic
      drm/xe/irq: Separate MSI and MSI-X flows
      drm/xe: Initial MSI-X support for HW engines
      drm/xe/irq: Manage MSI-X interrupts allocation

Imre Deak (15):
      drm/i915/ptl/dp_mst: Fix slave transcoder enabling wrt. DDI function
      drm/i915/adlp+/dp_mst: Align slave transcoder enabling with spec
wrt. DDI function
      drm/i915/dp_mst: Add a way to disable the DP2 config
      drm/i915/adlp+/dp_mst: Align slave transcoder sequences with
spec wrt. DP2 config
      drm/i915/adlp+/dp_mst: Align master transcoder disabling with
spec wrt. DP2 config
      drm/i915/dp_mst: Fix connector initialization in
intel_dp_add_mst_connector()
      drm/connector: Add a way to init/add a connector in separate steps
      drm/connector: Add FIXME for GETRESOURCES ioctl wrt. uninited connect=
ors
      drm/connector: Add deprecation notes for drm_connector_register/unreg=
ister
      drm/dp_mst: Register connectors via drm_connector_dynamic_register()
      drm/i915/dp_mst: Expose a connector to kernel users after it's
properly initialized
      drm/amd/dp_mst: Expose a connector to kernel users after it's
properly initialized
      drm/nouveau/dp_mst: Expose a connector to kernel users after
it's properly initialized
      drm/connector: Warn if a connector is registered/added incorrectly
      drm/tests: Add tests for drm_connector_dynamic_init()/register()

Iswara Nagulendran (1):
      drm/amd/display: Add VC for VESA Aux Backlight Control

Ivan Stepchenko (1):
      drm/amdgpu: Fix potential NULL pointer dereference in
atomctrl_get_smc_sclk_range_table

Jacek Lawrynowicz (1):
      accel/ivpu: Fix Qemu crash when running in passthrough

Jack Chang (1):
      drm/amd/display: Add replay desync error count tracking and
reset functionality

Jakub Kolakowski (1):
      drm/xe/vf: Don't check has flat ccs in bios on VF

Jani Nikula (120):
      drm/i915/sbi: add intel_sbi_{lock,unlock}()
      drm/i915/sbi: add a dedicated mutex for LPT/WPT IOSF sideband
      drm/i915: add a dedicated mutex for VLV/CHV IOSF sideband
      drm/i915: hide VLV PUNIT IOSF sideband qos handling better
      drm/i915/dp: demote source OUI read/write failure logging to debug
      drm/i915/psr: add LATENCY_REPORTING_REMOVED() register bit helper
      drm/i915/psr: stop using bitwise OR with booleans in wm_optimization_=
wa()
      drm/i915/display: identify discrete graphics
      drm/i915/display: convert HAS_D12_PLANE_MINIMIZATION() to struct
intel_display
      drm/i915/display: convert HAS_4TILE() to struct intel_display
      drm/i915/display: convert HAS_DOUBLE_BUFFERED_M_N() to struct
intel_display
      drm/i915/display: convert HAS_DP20() to struct intel_display
      drm/i915/display: convert HAS_GMBUS_BURST_READ() to struct intel_disp=
lay
      drm/i915/display: convert HAS_IPS() to struct intel_display
      drm/i915/display: convert HAS_MBUS_JOINING() to struct intel_display
      drm/i915/display: convert HAS_SAGV() to struct intel_display
      drm/i915/display: convert HAS_HW_SAGV_WM() to struct intel_display
      drm/i915/display: convert HAS_ULTRAJOINER() to struct intel_display
      drm/i915/display: rename i915 parameter to __display in feature helpe=
rs
      drm/i915/display: convert display device identification to
struct intel_display
      drm/i915/display: pass struct pci_dev * to intel_display_device_probe=
()
      drm/i915/display: add mobile platform group
      drm/i915/mst: pass primary encoder to primary encoder hooks
      drm/i915/mst: rename intel_encoder to encoder
      drm/i915/mst: introduce to_primary_encoder() and to_primary_dp()
      drm/i915/mst: use primary_encoder in fake mst encoder creation
      drm/i915/display: make CHICKEN_TRANS() display version aware
      drm/i915/mst: convert to struct intel_display
      drm/i915/mst: change naming from fake encoders to MST stream encoders
      drm/i915/dp: add comments about hooks called from MST stream encoders
      drm/i915/mst: pass intel_dp around in mst stream helpers
      drm/i915/mst: unify MST connector function naming to mst_connector_*
      drm/i915/mst: simplify mst_connector_get_hw_state()
      drm/i915/mst: unify MST topology callback naming to mst_topology_*
      drm/i915/ddi: use intel_ddi_* naming convention for encoder enable/di=
sable
      drm/i915/reg: convert DP_TP_CTL/DP_TP_STATUS to REG_BIT() and friends
      drm/i915/dp: refactor clear/wait for act sent
      drm/i915/ddi: rename temp to ddi_func_ctl in intel_ddi_read_func_ctl(=
)
      drm/i915/ddi: split up intel_ddi_read_func_ctl() by output type
      drm/i915/ddi: refactor intel_ddi_connector_get_hw_state()
      drm/i915/ddi: simplify intel_ddi_get_encoder_pipes() slightly
      drm/i915/overlay: convert to struct intel_display
      drm/i915/overlay: add intel_overlay_available() and use it
      drm/i915/plane: convert initial plane setup to struct intel_display
      drm/i915/irq: hide display_irqs_enabled access
      drm/i915/irq: emphasize display_irqs_enabled is only about VLV/CHV
      drm/i915/ddi: clarify intel_ddi_connector_get_hw_state() for DP MST
      drm/i915/display: prefer DISPLAY_VER over GRAPHICS_VER in display s/r
      drm/i915/dislay: convert i9xx_display_sr.[ch] to struct intel_display
      drm/i915/dp: use seq buf for printing rates
      drm/i915/display: convert for_each_power_well() to struct intel_displ=
ay
      drm/i915/display: convert for_each_power_domain_well() to struct
intel_display
      drm/i915/display: convert power wells to struct intel_display
      drm/i915/display: convert power domain code internally to struct
intel_display
      drm/i915/display: convert high level power interfaces to struct
intel_display
      drm/i915/display: convert power map to struct intel_display
      drm/i915/display: replace dig_port->saved_port_bits with flags
      drm/i915/display: remove unused for_each_crtc()
      drm/dp: extract drm_dp_dpcd_poll_act_handled()
      drm/dp: extract drm_dp_dpcd_write_payload()
      drm/dp: extract drm_dp_dpcd_clear_payload()
      drm/i915/cx0: split out mtl_get_cx0_buf_trans() to c10 and c20 varian=
ts
      drm/xen: remove redundant initialization info print
      accel/ivpu: remove DRIVER_DATE conditional drm_driver init
      drm: remove driver date from struct drm_driver and all drivers
      drm/i915/display: convert intel_display_driver.[ch] to struct
intel_display
      drm/i915/pps: debug log the remaining power cycle delay to wait
      drm/i915/pps: include panel power cycle delay in debugfs
      drm/i915/mst: add beginnings of DP MST documentation
      drm/print: add drm_print_hex_dump()
      drm/i915/display: use drm_print_hex_dump() for crtc state dump
      drm/i915/display: use drm_print_hex_dump() for buffer mismatch dumps
      drm/i915/display: clean up DP Adaptive Sync SDP state mismatch loggin=
g
      drm/i915/dp: add g4x_dp_compute_config()
      drm/i915/dp: move g4x_dp_set_clock() call to g4x_dp_compute_config()
      drm/i915: split out i9xx_wm_regs.h
      drm/i915: relocate _VGA_MSR_WRITE register definition
      drm/i915: move DDI_CLK_VALFREQ next to other Cx0 PHY registers
      drm/i915/mst: use intel_dp_compute_config_limits() for DP MST
      drm/i915/dp: s/intel_encoder/encoder/
      drm/i915/dp: s/intel_connector/connector/
      drm/i915/dp: convert to struct intel_display
      drm/i915/dp: convert interfaces to struct intel_display
      drm/i915/dp: finish link training conversion to struct intel_display
      drm/i915/gvt: always pass struct intel_display * to register macros
      drm/i915: extract intel_uncore_trace.[ch]
      drm/i915/display: add intel_display_conversion.c to hide stuff better
      drm/i915/uncore: add to_intel_uncore() and use it
      drm/i915/display: add struct drm_device to struct intel_display
conversion function
      drm/i915/display: drop i915_drv.h include from intel_display_trace.h
      drm/i915/display: drop unnecessary i915_drv.h includes
      drm/i915/dmc_wl: store register ranges in rodata
      drm/i915/ddi: change intel_ddi_init_{dp, hdmi}_connector() return typ=
e
      drm/i915/hdmi: propagate errors from intel_hdmi_init_connector()
      drm/i915/hdmi: add error handling in g4x_hdmi_init()
      drm/i915/ddi: gracefully handle errors from
intel_ddi_init_hdmi_connector()
      drm/i915/display: add intel_encoder_is_hdmi()
      drm/i915/ddi: only call shutdown hooks for valid encoders
      Merge drm/drm-next into drm-intel-next
      drm/mst: remove mgr parameter and debug logging from
drm_dp_get_vc_payload_bw()
      drm/i915/mst: drop connector parameter from intel_dp_mst_bw_overhead(=
)
      drm/i915/mst: drop connector parameter from intel_dp_mst_compute_m_n(=
)
      drm/i915/mst: change return value of mst_stream_find_vcpi_slots_for_b=
pp()
      drm/i915/mst: remove crtc_state->pbn
      drm/i915/mst: split out a helper for figuring out the TU
      drm/i915/mst: adapt intel_dp_mtp_tu_compute_config() for 128b/132b SS=
T
      drm/i915/ddi: enable 128b/132b TRANS_DDI_FUNC_CTL mode for UHBR SST
      drm/i915/ddi: 128b/132b SST also needs DP_TP_CTL_MODE_MST
      drm/i915/ddi: write payload for 128b/132b SST
      drm/i915/ddi: initialize 128b/132b SST DP2 VFREQ registers
      drm/i915/ddi: enable ACT handling for 128b/132b SST
      drm/i915/ddi: start distinguishing 128b/132b SST and MST at state rea=
dout
      drm/i915/ddi: handle 128b/132b SST in intel_ddi_read_func_ctl()
      drm/i915/ddi: disable trancoder port select for 128b/132b SST
      drm/i915/dp: compute config for 128b/132b SST w/o DSC
      drm/i915/pmdemand: convert to_intel_pmdemand_state() to a function
      drm/i915/pmdemand: make struct intel_pmdemand_state opaque
      drm/i915/pmdemand: convert to struct intel_display
      drm/i915/display: convert global state to struct intel_display
      drm/xe: remove unused xe_pciids.h harder, add missing PCI ID

Janusz Krzysztofik (1):
      drm/i915/selftests: Use preemption timeout on cleanup

Jay Cornwall (1):
      drm/amdkfd: Move gfx12 trap handler to separate file

Jeffrey Hugo (2):
      accel/qaic: Drop redundant vfree() null check in sahara
      accel/qaic: Fix typo for struct qaic_manage_trans_passthrough

Jens Glathe (1):
      drm/panel-edp: Add unknown BOE panel for HP Omnibook X14

Jesse Zhang (4):
      drm/amdgpu/sdma4.4.2: add apu support in sdma queue reset
      drm/amdgpu/pm: add definition PPSMC_MSG_ResetSDMA2
      drm/amdgpu/pm: Implement SDMA queue reset for different asic
      drm/amdgpu: enable gfx12 queue reset flag

Jesse.zhang@amd.com (8):
      drm/amdgpu/sdma7: Implement resume function for each instance
      drm/amdgpu/sdma7: implement queue reset callback for sdma7
      drm/amdgpu/mes12: Implement reset sdmav7 queue function by mmio
      drm/amdgpu/mes12: Implement reset gfx/compute queue function by mmio
      drm/amdgpu/sdma7: Add queue reset sysfs for sdmav7
      drm/amdgpu/gfx12: clean up kcq reset code
      drm/amdgpu/gfx11: clean up kcq reset code
      drm/amdkfd: fixed page fault when enable MES shader debugger

Jessica Zhang (4):
      drm/msm/dpu: Add VBIF to DPU snapshot
      drm/msm/dpu: Specify dedicated CWB pingpong blocks
      drm/msm/dpu: Add dpu_hw_cwb abstraction for CWB block
      drm/msm/dpu: Add RM support for allocating CWB

Jesus Narvaez (2):
      drm/i915/guc: Update guc_err message to show outstanding g2h response=
s
      drm/xe/guc: Adding steering info support for GuC register lists

Jiadong Zhu (3):
      drm/amd/pm: update smu_v13_0_6 smu header
      drm/amd/pm: implement dpm sdma reset function
      drm/amdgpu/sdma4.4.2: implement ring reset callback for sdma4.4.2

Jiang Liu (2):
      drm/amdgpu: tear down ttm range manager for doorbell in amdgpu_ttm_fi=
ni()
      drm/amdgpu: wrong array index to get ip block for PSP

Jiapeng Chong (2):
      drm/amd/display: use swap() in update_phy_id_mapping()
      kernel/cgroup: Remove the unused variable climit

Jiasheng Jiang (1):
      drm/i915: Fix memory leak by correcting cache object name in error ha=
ndler

Jinzhou Su (2):
      drm/amdgpu: Add secure display v2 command
      drm/amdgpu: return error when eeprom checksum failed

Jocelyn Falempe (8):
      drm/panic: Move drawing functions to drm_draw
      drm/log: Introduce a new boot logger to draw the kmsg on the screen
      drm/log: Do not draw if drm_master is taken
      drm/log: Color the timestamp, to improve readability
      drm/log: Implement suspend/resume
      drm/log: Add integer scaling support
      drm/client: Fix drm client endless Kconfig loop
      drm/amd/display: add DC drm_panic support

John Harrison (8):
      drm/xe/guc: Reduce default GuC log verbosity
      drm/xe/guc: Support crash dump notification from GuC
      drm/xe/guc: Add support for G2G communications
      drm/xe: Add a reason string to the devcoredump
      drm/xe: Move the coredump registration to the worker thread
      drm/xe: Add mutex locking to devcoredump
      drm/xe/guc: Fix for dead CT dump not re-arming
      drm/xe: Revert some changes that break a mesa debug tool

Jonathan Cavitt (1):
      drm/xe/xe_guc_ads: Add nonpriv registers to write list

Jonathan Kim (1):
      drm/amdgpu: fix gpu recovery disable with per queue reset

Joshua Aberback (1):
      drm/amd/display: Refactor dcn31_panel_construct to avoid assert

Jos=C3=A9 Roberto de Souza (2):
      drm/xe: Force write completion of MI_STORE_DATA_IMM
      Revert "drm/xe: Force write completion of MI_STORE_DATA_IMM"

Jouni H=C3=B6gander (1):
      drm/i915/psr: Disable Panel Replay as well if VRR is enabled

Karol Przybylski (2):
      drm: zynqmp_dp: Fix integer overflow in zynqmp_dp_rate_get()
      drm/amdgpu: Fix potential integer overflow in scheduler mask calculat=
ions

Karthi Kandasamy (4):
      drm/amd/display: expose DCN401 HUBP functions
      drm/amd/display: Update dc_tiling_info union to structure
      drm/amd/display: Ensure correct GFX tiling info passed to DML
      drm/amd/display: Remove unused read_ono_state function from Hwss modu=
le

Karunika Choo (1):
      drm/panthor: Simplify FW fast reset path

Kent Russell (1):
      drm/amdgpu: Remove unnecessary NULL check

Konrad Dybcio (2):
      drm/msm: registers: Add GMU FW version register
      drm/msm/a6xx: Print GMU core firmware version at boot

Krzysztof Karas (1):
      drm/i915: ensure segment offset never exceeds allowed max

Kun Liu (2):
      drm/amd/pm:  fix BUG: scheduling while atomic
      drm/amd/display: add CEC notifier to amdgpu driver

Kuninori Morimoto (1):
      gpu: drm: replace of_graph_get_next_endpoint()

LECOINTRE Philippe (1):
      drm/etnaviv: add optional reset support

Lancelot SIX (3):
      drm/amdkfd: update buffer_{store,load}_* modifiers for gfx940
      drm/amdkfd: Adjust CWSR trap handler for gfx950
      drm/amdkfd: Handle save/restore of lds allocated in 1280B blocks

Langyan Ye (1):
      drm/panel-edp: Add KDB KD116N2130B12

Le Ma (5):
      drm/amdgpu/gfx: add gfx950 microcode
      drm/amdgpu: add initial support for gfx950
      drm/amdkfd: update the cwsr area size for gfx950
      drm/amdgpu: add initial support for sdma444
      drm/amdgpu: add psp 13_0_12 version support

Leo Li (4):
      drm/amd/display: Make DMCUB tracebuffer debugfs chronological
      drm/amdgpu: rename register headers to dcn_2_0_1
      drm/amd/display: Do not wait for PSR disable on vbl enable
      drm/amd/display: Do not elevate mem_type change to full update

Li Liu (7):
      dt-bindings: display/msm: Add SM6150 DSI phy
      dt-bindings: display/msm: dsi-controller-main: Document SM6150
      dt-bindings: display/msm: Add SM6150 MDSS & DPU
      drm/msm: mdss: Add SM6150 support
      drm/msm/dpu: Add SM6150 support
      drm/msm/dsi: Add dsi phy support for SM6150
      drm/msm/dsi: Add support for SM6150

Liankun Yang (1):
      drm/mediatek: dp: Add sdp path reset

Lijo Lazar (7):
      drm/amdgpu: Prefer RAS recovery for scheduler hang
      drm/amdgpu: Simplify cleanup check for FRU sysfs
      drm/amdgpu: Remove gfxoff usage
      drm/amdgpu: Increase FRU File Id buffer size
      drm/amd/pm: Revert state if force level fails
      drm/amdgpu: Avoid VF for RAS recovery source check
      drm/amdgpu: Use dbg level for VBIOS check messages

Linus Walleij (1):
      MAINTAINERS: Assume maintainership of PL111

Liu Ying (2):
      drm/connector: hdmi: Do atomic check when necessary
      drm/tests: hdmi: Add connector disablement test

Liviu Dudau (1):
      drm/panthor: Fix compilation failure on panthor_fw.c

Lizhi Hou (26):
      accel/amdxdna: Add documentation for AMD NPU accelerator driver
      accel/amdxdna: Add a new driver for AMD AI Engine
      accel/amdxdna: Support hardware mailbox
      accel/amdxdna: Add hardware resource solver
      accel/amdxdna: Add hardware context
      accel/amdxdna: Add GEM buffer object management
      accel/amdxdna: Add command execution
      accel/amdxdna: Add suspend and resume
      accel/amdxdna: Add error handling
      accel/amdxdna: Add query functions
      accel/amdxdna: Add device status for aie2 devices
      accel/amdxdna: Replace mmput with mmput_async to avoid dead lock
      accel/amdxdna: Add query firmware version
      accel/amdxdna: Add RyzenAI-npu6 support
      accel/amdxdna: Replace idr api with xarray
      accel/amdxdna: Enhance power management settings
      accel/amdxdna: Read firmware interface version from registers
      accel/amdxdna: Add zero check for pad in ioctl input structures
      accel/amdxdna: Remove DRM_AMDXDNA_HWCTX_CONFIG_NUM
      accel/amdxdna: Declare npu device profile as static variables
      accel/amdxdna: Declare mailbox register base as __iomem pointer
      accel/amdxdna: Declare aie2_max_col as static
      accel/amdxdna: Use rcu_access_pointer for __rcu pointer
      accel/amdxdna: Declare force_cmdlist as static
      accel/amdxdna: Add __user to second parameter of aie2_query_status
      accel/amdxdna: Declare npu6_dev_priv as static

Louis Chauvet (9):
      drm/vkms: Remove index parameter from init_vkms_output
      drm/vkms: Code formatting
      drm/vkms: Add typedef and documentation for pixel_read and
pixel_write functions
      drm/vkms: Use const for input pointers in pixel_read an
pixel_write functions
      drm/vkms: Update pixels accessor to support packed and
multi-plane formats.
      drm/vkms: Avoid computing blending limits inside pre_mul_alpha_blend
      drm/vkms: Introduce pixel_read_direction enum
      drm/vkms: Re-introduce line-per-line composition algorithm
      drm/vkms: Remove useless drm_rotation_simplify

Luca Ceresoli (3):
      drm/bridge: ti-sn65dsi83: use dev_err_probe when failing to get
panel bridge
      dt-bindings: display: simple: Add Tianma TM070JDHG34-00 panel
      drm/panel: simple: Add Tianma TM070JDHG34-00 panel support

Lucas De Marchi (27):
      drm/xe: Move Wa 1607983814 to oob
      drm/xe: Fix drm-next merge
      drm/xe: Improve devcoredump documentation
      drm/xe: Wire up devcoredump in documentation
      drm/xe: Fix case for asserts in documentation
      drm/i915/pmu: Rename cpuhp_slot to cpuhp_state
      drm/i915/pmu: Stop setting event_init to NULL
      drm/i915/pmu: Replace closed with registered
      drm/i915/pmu: Remove pointless synchronize_rcu() call
      drm/xe: Add trace to lrc timestamp update
      drm/xe: Stop accumulating LRC timestamp on job_free
      drm/xe: Reword exec_queue and vm lock doc
      drm/xe: Add gt_id to xe_sched_job traces
      drm/xe: Wait on killed exec queues
      drm/xe: Sample gpu timestamp closer to exec queues
      drm/xe: Include xe_oa_types.h
      drm/xe: Drop HAS_HECI_*
      drm/xe: Split xe_gt_stat.h
      drm/xe: Sort again the info flags
      drm/xe/reg_sr: Remove register pool
      drm/xe/reg_sr: Convert whitelist to gt logging
      drm/xe/reg_sr: Stop setting all whitelist slots
      drm/xe: Apply whitelist to engine save-restore
      drm/xe: Fix fault on fd close after unbind
      drm/xe: Use q->xef for accessing xe file
      drm/xe: Fix tlb invalidation when wedging
      drm/xe: Remove "graphics tile" from kernel doc

Lucas Stach (1):
      drm/rockchip: analogix_dp: allow to work without panel

Maarten Lankhorst (4):
      Merge remote-tracking branch 'drm/drm-next' into drm-misc-next
      kernel/cgroup: Add "dmem" memory accounting cgroup
      drm/ttm: Handle cgroup based eviction in TTM
      drm/xe: Implement cgroup for vram

Marcin Bernatowicz (2):
      drm/xe/rtp: Add match helper to omit SR-IOV VF device
      drm/xe/vf: Don't apply Wa_22019338487 for VF

Marek Vasut (4):
      dt-bindings: display: simple: Document Multi-Inno Technology
MI0700A2T-30 panel
      drm/panel: simple: add Multi-Inno Technology MI0700A2T-30
      dt-bindings: display: simple: Document Multi-Inno Technology
MI1010Z1T-1CP11 panel
      drm/panel: simple: add Multi-Inno Technology MI1010Z1T-1CP11

Mario Limonciello (6):
      drm/amd: Invert APU check for amdgpu_device_evict_resources()
      drm/amd: Add Suspend/Hibernate notification callback support
      drm/amd: Add the capability to mark certain firmware as "required"
      drm/amd: Show an info message about optional firmware missing
      drm/amd: Update strapping for NBIO 2.5.0
      drm/amd: Require CONFIG_HOTPLUG_PCI_PCIE for BOCO

Martin Leung (1):
      drm/amd/display: Promote DC to 3.2.315

Matt Atwood (1):
      drm/xe/ptl: Add another PTL PCI ID

Matt Roper (1):
      drm/xe: Update xe2_graphics name string

Matthew Auld (10):
      drm/xe: improve hibernation on igpu
      drm/xe: handle flat ccs during hibernation on igpu
      drm/xe/vram: drop 2G block restriction
      drm/xe/vram: fix lpfn check
      drm/xe/trace: improve xe_sched_msg trace
      drm/xe/guc_submit: fix race around pending_disable
      drm/xe/guc_submit: fix race around suspend_pending
      drm/xe/migrate: fix pat index usage
      drm/xe/migrate: use XE_BO_FLAG_PAGETABLE
      drm/xe/display: fix ttm_bo_access() usage

Matthew Brost (21):
      drm/xe: Restore system memory GGTT mappings
      drm/xe: Fix possible exec queue leak in exec IOCTL
      drm/xe: Drop VM dma-resv lock on xe_sync_in_fence_get failure in
exec IOCTL
      drm/xe: Ensure all locks released in exec IOCTL
      drm/xe: Add xe_ring_lrc_is_idle() helper
      drm/xe: Add ring address to LRC snapshot
      drm/xe: Add ring start to LRC snapshot
      drm/xe: Add exec queue param to devcoredump
      drm/xe: Improve schedule disable response failure
      drm/xe: Change xe_engine_snapshot_capture_for_job to be for queue
      drm/xe: Wire devcoredump to LR TDR
      drm/xe: Mark preempt fence workqueue as reclaim
      drm/xe: Drop useless d3cold allowed message
      drm/xe: Add xe_bo_vm_access
      drm/ttm: Add ttm_bo_access
      drm/xe: Add xe_ttm_access_memory
      drm/xe: Take PM ref in delayed snapshot capture worker
      drm/xe/display: Update intel_bo_read_from_page to use ttm_bo_access
      drm/xe: Use ttm_bo_access in xe_vm_snapshot_capture_delayed
      drm/xe: Set XE_BO_FLAG_PINNED in migrate selftest BOs
      drm/xe: Only allow contiguous BOs to use xe_bo_vmap

Maud Spierings (1):
      dt-bindings: display: panel: samsung,atna56ac03: Document ATNA56AC03

Maxime Ripard (27):
      dt-bindings: display: Add BCM2712 HDMI bindings
      dt-bindings: display: Add BCM2712 HVS bindings
      dt-bindings: display: Add BCM2712 PixelValve bindings
      dt-bindings: display: Add BCM2712 MOP bindings
      dt-bindings: display: Add BCM2712 MOPLET bindings
      dt-bindings: display: Add BCM2712 KMS driver bindings
      drm/vc4: drv: Support BCM2712
      drm/vc4: hvs: Add support for BCM2712 HVS
      drm/vc4: crtc: Add support for BCM2712 PixelValves
      drm/vc4: hdmi: Add support for BCM2712 HDMI controllers
      drm/vc4: txp: Introduce structure to deal with revision differences
      drm/vc4: txp: Rename TXP data structure
      drm/vc4: txp: Add byte enable toggle bit
      drm/vc4: txp: Add horizontal and vertical size offset toggle bit
      drm/vc4: txp: Handle 40-bits DMA Addresses
      drm/vc4: txp: Move the encoder type in the variant structure
      drm/vc4: txp: Add a new TXP encoder type
      drm/vc4: txp: Add support for BCM2712 MOP
      drm/vc4: txp: Add BCM2712 MOPLET support
      drm/vc4: Add additional warn_on for incorrect revisions
      Merge drm/drm-next into drm-misc-next
      drm/drv: Add drmm managed registration helper for dmem cgroups.
      Merge drm/drm-next into drm-misc-next-fixes
      cgroup/dmem: Select PAGE_COUNTER
      cgroup/dmem: Fix parameters documentation
      drm/doc: Include new drm-compute documentation
      doc/cgroup: Fix title underline length

Ma=C3=ADra Canal (2):
      drm/v3d: Fix performance counter source settings on V3D 7.x
      drm/v3d: Fix miscellaneous documentation errors

Meera Patel (1):
      drm/amd/display: initialize uninitialized variable

Melissa Wen (3):
      drm/amd/display: fix page fault due to max surface definition mismatc=
h
      drm/amd/display: increase MAX_SURFACES to the value supported by hw
      drm/amd/display: fix divide error in DM plane scale calcs

Michael J. Ruhl (2):
      drm/xe/vsec: Support BMG devices
      drm/xe/vsec: Address static checker issue

Michael Strauss (1):
      drm/amd/display: Update chip_cap defines and usage

Michal Wajdeczko (15):
      drm/xe/pf: Fix potential GGTT allocation leak
      drm/xe/guc: Log content of the failed G2H message
      drm/xe/guc: Drop redundant logs about invalid G2H length
      drm/xe/guc: Don't read data from G2H prior to length check
      drm/xe/guc: Don't treat GuC generic CAT error as protocol error
      drm/xe/guc: Add VF_CFG_SCHED_PRIORITY_KEY KLV definition
      drm/xe/guc: Add VF_CFG_SCHED_PRIORITY to KLV helper
      drm/xe/pf: Add functions to configure VF scheduling priority
      drm/xe/pf: Allow to control scheduling priority using debugfs
      drm/xe/pf: Adjust scheduling priority based on policy change
      drm/xe/guc: Prefer GT oriented asserts in submit code
      drm/xe/guc: Prefer GT oriented logs in submit code
      drm/xe/pf: Drop 2GiB limit of fair LMEM allocation
      drm/xe: Introduce xe_gt_dbg_printer()
      drm/xe/pf: Use correct function to check LMEM provisioning

Michel D=C3=A4nzer (1):
      drm/amdgpu: Handle NULL bo->tbo.resource (again) in amdgpu_vm_bo_upda=
te

Mika Kahola (3):
      drm/i915/xe3lpd: Power request asserting/deasserting
      drm/i915/display: Use struct intel_display instead of struct
drm_i915_private
      drm/i915/display: UHBR rates for Thunderbolt

Mike Lothian (1):
      accel/amdxdna: Add include interrupt.h to amdxdna_mailbox.c

Min-Hua Chen (1):
      drm/rockchip: vop2: include rockchip_drm_drv.h

Mirsad Todorovac (2):
      drm/xe: fix the ERR_PTR() returned on failure to allocate tiny pt
      drm/admgpu: replace kmalloc() and memcpy() with kmemdup()

Natanel Roizenman (1):
      drm/amd/display: correct type mismatches in comparisons in DML2

Nathan Chancellor (2):
      drm/amd/display: Reapply fdedd77b0eb3
      drm/amd/display: Increase sanitizer frame larger than limit when
compile testing with clang

Neil Armstrong (8):
      opp: core: implement dev_pm_opp_get_bw
      OPP: add index check to assert to avoid buffer overflow in _read_freq=
()
      OPP: fix dev_pm_opp_find_bw_*() when bandwidth table not initialized
      drm/msm: adreno: add defines for gpu & gmu frequency table sizes
      drm/msm: adreno: add plumbing to generate bandwidth vote table for GM=
U
      drm/msm: adreno: dynamically generate GMU bw table
      drm/msm: adreno: find bandwidth index of OPP and set it along freq in=
dex
      drm/msm: adreno: enable GMU bandwidth for A740 and A750

Nicholas Kazlauskas (4):
      drm/amd/display: Add disable_ips_in_dpms_off flag for IPS
      drm/amd/display: Don't allow IPS2 in D0 for RCG Dynamic
      Revert "drm/amd/display: Don't allow IPS2 in D0 for RCG Dynamic"
      drm/amd/display: Apply (some) policy for DML2 formulation on DCN35/DC=
N351

Nicholas Susanto (1):
      Revert "drm/amd/display: Enable urgent latency adjustments for DCN35"

Niranjana Vishwanathapura (1):
      drm/xe: Allow bo mapping on multiple ggtts

Nirmoy Das (10):
      drm/xe: Move LNL scheduling WA to xe_device.h
      drm/xe/ufence: Flush xe ordered_wq in case of ufence timeout
      drm/xe/guc/tlb: Flush g2h worker in case of tlb timeout
      drm/xe: Take job list lock in xe_sched_first_pending_job
      drm/xe: Ignore GGTT TLB inval errors during GT reset
      drm/xe/ufence: Wake up waiters after setting ufence->signalled
      drm/xe/tests: Wait for clear fence operation to complete
      drm/xe: Use non-interruptible wait when moving BO to system
      drm/xe: Wait for migration job before unmapping pages
      drm/xe/tests: Move shrink test out of xe_bo

Nitin Gote (4):
      drm/i915/gt: Increase a time to retry RING_HEAD reset
      drm/i915/gt: Use ENGINE_TRACE for tracing.
      drm/i915/gt: Prefer IS_ENABLED() instead of defined() on config optio=
n
      drm/xe: Fix all typos in xe

Oak Zeng (2):
      drm/xe: Trace xe_bo_validate
      drm/xe: Avoid evicting object of the same vm in none fault mode

Peichen Huang (2):
      drm/amd/display: have pretrain for dpia
      drm/amd/display: improve dpia pre-train

Peter Shkenev (1):
      drm/virtio: Use generic dumb_map_offset implementation

Peterson (2):
      drm/amd/display: Check that hw cursor is not required when
falling back to subvp sw cursor
      drm/amd/display: Use resource_build_scaling_params for dcn20

Philip Yang (6):
      drm/amdgpu: Don't enable sdma 4.4.5 CTXEMPTY interrupt
      drm/amdkfd: KFD interrupt access ih_fifo data in-place
      drm/amdgpu: Optimize gfx v9 GPU page fault handling
      drm/amdkfd: Queue interrupt work to different CPU
      drm/amdkfd: Improve signal event slow path
      drm/amdgpu: Show warning message if IH ring overflow

Philipp Stanner (1):
      drm/lsdc: Request PCI BAR

Pierre-Eric Pelloux-Prayer (4):
      drm/virtio: Don't create a context with default param if
context_init is supported
      drm/amdgpu: don't access invalid sched
      drm/amdgpu: drop the amdgpu_device argument from amdgpu_ib_free
      drm/amdgpu: remove useless init from amdgpu_job_alloc

Piotr Zalewski (2):
      rockchip/drm: vop2: add support for gamma LUT
      drm/rockchip: vop2: don't check color_mgmt_changed in atomic_enable

Pratap Nirujogi (1):
      drm/amd/amdgpu: Add support for isp buffers

Prike Liang (3):
      drm/amdgpu: reduce the mmio writes in kiq setting
      drm/amdgpu: Avoid to release the FW twice in the validated error
      drm/amdgpu: reduce RLC safe mode request for gfx clock gating

Raag Jadav (5):
      drm/xe/throttle: Log throttle reasons
      drm/intel/pciids: Refactor DG2 PCI IDs into segment ranges
      drm/i915/dg2: Introduce DG2_D subplatform
      drm/i915: Introduce intel_cpu_info.c for CPU IDs
      drm/i915/dg2: Implement Wa_14022698537

Rafal Ostrowski (1):
      drm/amd/display: DML2.1 Post-Si Cleanup

Randy Dunlap (2):
      drm/xe/vm_doc: fix more doc typos
      drm/amdgpu: device: fix spellos and punctuation

Raphael Gallais-Pou (1):
      MAINTAINERS: add Raphael Gallais-Pou to DRM/STi maintainers

Rex Nie (1):
      drm/msm/hdmi: simplify code in pll_get_integloop_gain

Rob Clark (2):
      Merge remote-tracking branch 'pm/opp/linux-next' into HEAD
      drm/msm: UAPI error reporting

Rob Herring (Arm) (1):
      drm: Use of_property_present() for non-boolean properties

Robin Chen (1):
      drm/amd/display: Add a new flag for replay low hz

Rodrigo Siqueira (1):
      Revert "drm/amd/display: Fix green screen issue after suspend"

Rodrigo Vivi (14):
      drm/i915: Remove vga and gmbus seq out of i915_restore_display
      drm/i915/display: Convert i915_suspend into i9xx_display_sr
      drm/i915/display: Move regfile registers intel_display.restore
      drm/{i915, xe}/display: Move DP MST calls to display_driver
      drm/xe/display: Delay hpd_init resume
      drm/xe/display: Delay dsm handler registration
      drm/{i915, xe}: Move power_domains suspend/resume to display_power
      Merge drm/drm-next into drm-xe-next
      Merge drm/drm-next into drm-xe-next
      Merge drm/drm-next into drm-intel-next
      drm/i915/dg1: Fix power gate sequence.
      drm/xe/pm: Also avoid missing outer rpm warning on system suspend
      drm/xe/dg1: Fix power gate sequence.
      drm/xe: Introduce the RPa information

Roman Li (1):
      drm/amd/display: Add check for granularity in dml ceil/floor helpers

Ryan Seto (1):
      drm/amd/display: 3.2.316

Sai Teja Pottumuttu (1):
      drm/xe/oa/uapi: Make OA buffer size configurable

Samson Tam (6):
      drm/amd/display: Enable EASF based on luma taps only
      drm/amd/display: Add support for custom recout_width in SPL
      drm/amd/display: fix v tap calculation for non-adaptive scaling in SP=
L
      drm/amd/display: clean up SPL code
      drm/amd/display: fix init_adj offset for cositing in SPL
      drm/amd/display: Clean up SPL code

Sathishkumar S (5):
      drm/amdgpu: Add amdgpu_vcn_sched_mask debugfs
      drm/amdgpu: add irq source ids for VCN5_0/JPEG5_0
      drm/amdgpu: update macro for maximum jpeg rings
      drm/amdgpu: Add JPEG5_0_1 support
      drm/amdgpu: enable JPEG5_0_1 ip block

Sebastian Brzezinka (1):
      drm/i915/gt: Log reason for setting TAINT_WARN at reset

Shikang Fan (1):
      drm/amdgpu: Check fence emitted count to identify bad jobs

Shiwu Zhang (1):
      drm/amdgpu: Enable xgmi for gfx v9_5_0

Shunlu Zhang (1):
      drm/amd/display: delete legacy code

Simona Vetter (1):
      Merge tag 'drm-intel-next-2024-12-11' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next

Sk Anirban (2):
      drm/i915/selftests: Add delay to stabilize frequency in live_rps_powe=
r
      drm/i915/selftests: Implement frequency logging for energy
reading validation

Sonny Jiang (4):
      drm/amdgpu: Add VCN_5_0_1 firmware
      drm/amdgpu: Add VCN_5_0_1 codec query
      drm/amdgpu: Add VCN_5_0_1 support
      drm/amdgpu: Enable VCN_5_0_1 IP block

Srinivasan Shanmugam (8):
      drm/amd/amdgpu: Add missing kdoc 'inst' parameter in
'smu_dpm_set_power_gate' function
      drm/amd/amdgpu/vcn: Fix kdoc entries for VCN clock/power gating funct=
ions
      drm/amd/amdgpu: Add Descriptions to Process Isolation and
Cleaner Shader Sysfs Functions
      drm/amd/amdgpu: Add Annotations to Process Isolation functions
      drm/amd/display: Fix NULL pointer dereference in dmub_tracebuffer_sho=
w
      drm/amdgpu: Fix error handling in amdgpu_ras_add_bad_pages
      drm/amdgpu/gfx10: Add cleaner shader for GFX10.3.0
      drm/amdgpu/gfx10: Enable cleaner shader for GFX10.3.2/10.3.4/10.3.5 G=
PUs

Stanislav Lisovskiy (1):
      drm/i915/xe3: Use hw support for min/interim ddb allocations for
async flip

Stephan Gerhold (1):
      drm/msm/dpu: fix x1e80100 intf_6 underrun/vsync interrupt

Sui Jingfeng (7):
      drm/etnaviv: Drop unused data member from the etnaviv_gem_object stru=
cture
      drm/etnaviv: etnaviv_cmdbuf.c: Drop the unneeded
'etnaviv_perfmon.h' header
      drm/etnaviv: Fix page property being used for non writecombine buffer=
s
      drm/etnaviv: Drop the offset in page manipulation
      drm/etnaviv: Fix the debug log of the etnaviv_iommu_map()
      drm/etnaviv: Improve VA, PA, SIZE alignment checking
      drm/msm: Check return value of of_dma_configure()

Sung Lee (1):
      drm/amd/display: Log Hard Min Clocks and Phantom Pipe Status

Sunil Khatri (2):
      drm/amdgpu: Update the variable name to dma_buf
      drm/amdgpu: add "restore" missing variable comment

Suraj Kandpal (14):
      drm/i915/xe3lpd: Update HDCP rekeying bit
      drm/i915/hdcp: Handle HDCP Line Rekeying for HDCP 1.4
      drm/i915/hdcp: Fix when the first read and write are retried
      drm/i915/hdcp: Remove log for HDMI HDCP LIC check
      drm/i915/wm: Initialize max_latency variable to appropriate value
      drm/i915/wm: Refactor dpkgc value prepration
      drm/i915/wm: Use intel_display structure in DPKGC code
      drm/i915/display: Refactor DPKGC code to call it from atomic_commit_t=
ail
      drm/i915/wm: Modify latency programmed into PKG_C_LATENCY
      drm/i915/wm: Club initialized variables of same type together
      drm/i915/cx0_phy: Fix C10 pll programming sequence
      Revert "drm/i915/hdcp: Don't enable HDCP1.4 directly from check_link"
      drm/i915/dp: Use intel_display instead of drm_i915_private
      drm/i915/ddi: Optimize mtl_port_buf_ctl_program

Swati Sharma (1):
      drm/i915/dsc: Expose dsc sink max slice count via debugfs

Taimur Hassan (2):
      drm/amd/display: [FW Promotion] Release 0.0.246.0
      drm/amd/display: [FW Promotion] Release 0.0.248.0

Tao Zhou (21):
      drm/amdgpu: simplify RAS page retirement in one memory row
      drm/amdgpu: remove redundant RAS error address coversion code
      drm/amdgpu: store PA with column bits cleared for RAS bad page
      drm/amdgpu: make convert_ras_err_addr visible outside UMC block
      drm/amdgpu: reduce memory usage for umc_lookup_bad_pages_in_a_row
      drm/amdgpu: add return value for convert_ras_err_addr
      drm/amdgpu: add TA_RAS_INV_NODE value
      drm/amdgpu: add flag to indicate the type of RAS eeprom record
      drm/amdgpu: do RAS MCA2PA conversion in device init phase
      drm/amdgpu: store only one RAS bad page record for all pages in one r=
ow
      drm/amdgpu: retire RAS bad pages in different NPS modes
      drm/amdgpu: add function to find all memory pages in one physical row
      drm/amdgpu: support to find RAS bad pages via old TA
      drm/amdgpu: save UMC global channel index to eeprom
      drm/amdgpu: add a flag to indicate UMC channel index version
      drm/amdgpu: add interface to get die id from memory address
      drm/amdgpu: parse legacy RAS bad page mixed with new data in
various NPS modes
      drm/amdgpu: remove is_mca_add for ras_add_bad_pages
      drm/amdgpu: set UMC PA per NPS mode when PA is 0
      drm/amdgpu: split ras_eeprom_init into init and check functions
      drm/amdgpu: correct the calculation of RAS bad page

Thomas Hellstr=C3=B6m (4):
      drm/xe: Avoid the OOM killer on buffer object memory allocation
      drm/xe: Don't unnecessarily invoke the OOM killer on multiple binds
      Merge drm/drm-next into drm-xe-next
      drm/xe/tracing: Fix a potential TP_printk UAF

Thomas Wei=C3=9Fschuh (3):
      drm: Add panel backlight quirks
      drm/amd/display: Add support for minimum backlight quirk
      drm: panel-backlight-quirks: Add Framework 13 matte panel

Thomas Zimmermann (14):
      drm/rockchip: cdn-dp: Use drm_connector_helper_hpd_irq_event()
      drm: Move client code to clients/ subdirectory
      drm/client: Move public client header to clients/ subdirectory
      drm/fbdev-client: Unexport drm_fbdev_client_setup()
      drm/cirrus: Use virtual encoder and connector types
      drm/cirrus: Rename to cirrus-qemu
      drm/hibmc: Drop dependency on ARM64
      drm/vmwgfx: Remove initialization of connector status
      drm/fsl-dcu: Include <linux/of.h>
      drm/panel: Include <linux/of.h>
      drm/panel: panel-orisetech-otm8009a: Include <linux/mod_devicetable.h=
>
      drm/panel: panel-samsung-s6e3ha2: Include <linux/mod_devicetable.h>
      drm/panel: panel-samsung-s6e63m0: Include <linux/property.h>
      drm/tiny: panel-mipi-dbi: Include <linux/of.h>

Tim Huang (2):
      drm/amdgpu: fix incorrect active RB bitmap in setup RBs
      drm/amdgpu: fix incorrect number of active RBs for gfx12

Timur Tabi (2):
      drm/nouveau: retain device pointer in nvkm_gsp_mem object
      drm/nouveau: expose GSP-RM logging buffers via debugfs

Tom Chung (3):
      drm/amd/display: Fix PSR-SU not support but still call the
amdgpu_dm_psr_enable
      drm/amd/display: Disable replay and psr while VRR is enabled
      drm/amd/display: Use HW lock mgr for PSR1

Tomasz Lis (6):
      drm/xe/vf: React to MIGRATED interrupt
      drm/xe/vf: Document SRIOV VF restore flow
      drm/xe/vf: Send RESFIX_DONE message at end of VF restore
      drm/xe/vf: Start post-migration fixups with provisioning query
      drm/xe/vf: Defer fixups if migrated twice fast
      drm/xe/guc: Do not assert CTB state while sending MMIO

Tomi Valkeinen (15):
      drm/tidss: Fix issue in irq handling causing irq-flood issue
      drm/tidss: Remove unused OCP error flag
      drm/tidss: Remove extra K2G check
      drm/tidss: Add printing of underflows
      drm/tidss: Rename 'wait_lock' to 'irq_lock'
      drm/rcar-du: dsi: Fix PHY lock bit check
      drm/rcar-du: Write DPTSR only if the second source exists
      dt-bindings: display: renesas,du: Add missing constraints
      dt-bindings: display: renesas,du: Add r8a779h0
      dt-bindings: display: bridge: renesas,dsi-csi2-tx: Add r8a779h0
      drm/rcar-du: dsi: Add r8a779h0 support
      drm/rcar-du: Add support for r8a779h0
      dt-bindings: display/xlnx/zynqmp-dpsub: Add audio DMAs
      arm64: dts: zynqmp: Add DMA for DP audio
      drm: xlnx: zynqmp_dpsub: Add DP audio support

Tommaso Merciai (1):
      drm/bridge: ite-it6263: Support VESA-24 input format

Umesh Nerlige Ramappa (5):
      i915/guc: Reset engine utilization buffer before registration
      i915/guc: Ensure busyness counter increases motonically
      i915/guc: Accumulate active runtime on gt reset
      xe/oa: Fix query mode of operation for OAR/OAC
      xe/oa: Drop the unused logic to parse context image

Uwe Kleine-K=C3=B6nig (1):
      drm: Drop explicit initialization of struct
i2c_device_id::driver_data to 0

Victor Zhao (1):
      drm/amdgpu: fill the ucode bo during psp resume for SRIOV

Ville Syrj=C3=A4l=C3=A4 (52):
      drm/i915: Relocate the SKL wm sanitation code
      drm/i915: Extract pipe_mbus_dbox_ctl()
      drm/i915: Extract pipe_mbus_dbox_ctl_update()
      drm/i915: Extract mbus_ctl_join_update()
      drm/i915: Sanitize MBUS joining
      drm/i915: Simplify xelpdp_is_only_pipe_per_dbuf_bank()
      drm/i915/dsi: Stop using pixel_format_from_register_bits() to parse V=
BT
      drm/i915: Introduce HAS_DOUBLE_WIDE()
      drm/i915/cdclk: Extract intel_cdclk_guardband() and intel_cdclk_ppc()
      drm/i915/cdclk: Extract hsw_ips_min_cdclk()
      drm/i915/cdclk: Extract intel_audio_min_cdclk()
      drm/i915/cdclk: Factor out has_audio check in intel_audio_min_cdclk()
      drm/i915/cdclk: Extract vlv_dsi_min_cdclk()
      drm/i915/cdclk: Factor out INTEL_OUTPUT_DSI check in vlv_dsi_min_cdcl=
k()
      drm/i915/cdclk: Suck the compression_enable check into
intel_vdsc_min_cdclk()
      drm/i915/cdclk: Drop pointles max_t() usage in intel_vdsc_min_cdclk()
      drm/i915/cdclk: Relocate intel_vdsc_min_cdclk()
      drm/i915/cdclk: Unify cdclk max() parameter order
      drm/i915: Grab intel_display from the encoder to avoid potential oops=
ies
      drm/i915/crt: Split long line
      drm/i915/crt: Drop the unused ADPA_DPMS bit definitions
      drm/i915/crt: Use REG_BIT() & co.
      drm/i915/crt: Clean up ADPA_HOTPLUG_BITS definitions
      drm/i915/crt: Extract intel_crt_regs.h
      drm/i915/crt: s/pipe_config/crtc_state/
      drm/i915/crt: Drop pointless drm_device variables
      drm/i915/crt: Rename some variables
      drm/i915/crt: Nuke unused crt->connector
      drm/i915/scaler: s/intel_crtc/crtc/ etc.
      drm/i915/scaler: Remove redudant junk from skl_scaler.h
      drm/i915/scaler: Pass the whole atomic state into
intel_atomic_setup_scalers()
      drm/i915/scaler: Clean up intel_atomic_setup_scalers() a bit
      drm/i915/scaler: Convert the scaler code to intel_display
      drm/i915/scaler: Carve up intel_atomic_setup_scalers()
      drm/i915/scaler: Make scaler in_use a bool
      drm/i915/scaler: Extract intel_allocate_scaler()
      drm/i915: Don't reuse commit_work for the cleanup
      drm/i915: Intruduce display.wq.cleanup
      drm/i915/dpt: Evict all DPT VMAs on suspend
      Revert "drm/i915/dpt: Make DPT object unshrinkable"
      drm/i915/dsb: Don't use indexed register writes needlessly
      drm/i915/color: Stop using non-posted DSB writes for legacy LUT
      drm/i915/dsb: Nuke the MMIO->indexed register write logic
      drm/i915/pps: Store the power cycle delay without the +1
      drm/i915/pps: Decouple pps delays from VBT struct definition
      drm/i915/pps: Rename intel_pps_delay members
      drm/i915/lvds: Use struct intel_pps_delays for LVDS power sequencing
      drm/i915/pps: Spell out the eDP spec power sequencing delays a
bit more clearly
      drm/i915/pps: Extract msecs_to_pps_units()
      drm/i915/pps: Extract pps_units_to_msecs()
      drm/i915/pps: Eliminate pointless get_delay() macro
      drm/modes: Fix drm_mode_vrefres() docs

Vinay Belgaumkar (1):
      drm/xe/slpc: Remove unnecessary force wakes

Vinod Govindapillai (3):
      drm/i915/display: update to plane_wm register access function
      drm/i915/display: add a gelper to relative data rate handling
      drm/i915/xe3: do not configure auto min dbuf for cursor WMs

Vivek Kasireddy (5):
      drm/virtio: Implement VIRTIO_GPU_CMD_RESOURCE_DETACH_BACKING cmd
      drm/virtio: Add a helper to map and note the dma addrs and lengths
      drm/virtio: Add helpers to initialize and free the imported object
      drm/virtio: Import prime buffers from other devices as guest blobs
      drm/virtio: Add prepare and cleanup routines for imported dmabuf obj

Wayne Lin (11):
      drm/amd/display: Adjust dc_stream_forward_crc_window to accept
assignment of phy_id
      drm/amd/display: Fix phy id mapping issue for secure display
      drm/amd/display: Adjust secure_display_context data structure
      drm/amd/display: Add support for setting multiple CRC windows in dc
      drm/amd/display: Extend dc_stream_get_crc to support 2nd crc engine
      drm/amd/display: Adjust dm to use supported interfaces for
setting multiple crc windows
      drm/amd/display: Extend capability to get multiple ROI CRCs
      drm/amd/display: Validate mdoe under MST LCT=3D1 case as well
      drm/amd/display: Reduce accessing remote DPCD overhead
      drm/amd/display: Add support to configure CRC window on specific
CRC instance
      drm/amd/display: Extend secure display to support DisplayCRC mode

Xiaogang Chen (1):
      drm/amdkfd: Differentiate logging message for driver oversubscription

Xin Ji (1):
      drm/bridge:anx7625: Update HDCP content status

Yang Wang (3):
      drm/amdgpu: move common ACA ipid defines into amdgpu_aca.h
      drm/amdgpu: add ACA support for vcn v4.0.3
      drm/amdgpu: add ACA support for jpeg v4.0.3

Yihan Zhu (2):
      drm/amd/display: update sequential pg logic DCN35
      drm/amd/display: power up all gating blocks when releasing hw DCN35

Yiling Chen (1):
      drm/amd/display: Remove unnecessary eDP power down

Yunxiang Li (5):
      drm: add drm_memory_stats_is_zero
      drm: make drm-active- stats optional
      Documentation/gpu: Clarify drm memory stats definition
      drm/amdgpu: remove unused function parameter
      drm/amdgpu: track bo memory stats at runtime

Zhang He (1):
      drm/i915: Fixed an typo in i915_gem_gtt.c

Zhanjun Dong (3):
      drm/i915/guc: Flush ct receive tasklet during reset preparation
      drm/xe/guc: Remove duplicate source field
      drm/xe/guc: Fix missing init value and add register order check

Zhi Wang (2):
      nvkm/gsp: correctly advance the read pointer of GSP message queue
      nvkm: correctly calculate the available space of the GSP cmdq buffer

Zhongwei (1):
      drm/amd/display: remove clearance code of force_ffu_mode flag in
dmub_psr_copy_settings()

Zhu Lingshan (2):
      drm/amdkfd: wq_release signals dma_fence only when available
      drm/amdkfd: always include uapi header in priv.h

yfeng1 (1):
      drm/amdgpu: Fix for MEC SJT FW Load Fail on VF

 Documentation/accel/amdxdna/amdnpu.rst             |  281 ++++
 Documentation/accel/amdxdna/index.rst              |   11 +
 Documentation/accel/index.rst                      |    1 +
 Documentation/admin-guide/cgroup-v2.rst            |   58 +-
 Documentation/core-api/cgroup.rst                  |    9 +
 Documentation/core-api/index.rst                   |    1 +
 .../bindings/display/brcm,bcm2711-hdmi.yaml        |    2 +
 .../bindings/display/brcm,bcm2835-hvs.yaml         |    5 +-
 .../bindings/display/brcm,bcm2835-pixelvalve0.yaml |    3 +
 .../bindings/display/brcm,bcm2835-txp.yaml         |    5 +-
 .../bindings/display/brcm,bcm2835-vc4.yaml         |    1 +
 .../display/bridge/renesas,dsi-csi2-tx.yaml        |    1 +
 .../bindings/display/bridge/ti,sn65dsi83.yaml      |   34 +-
 .../bindings/display/msm/dp-controller.yaml        |    1 +
 .../bindings/display/msm/dsi-controller-main.yaml  |    2 +
 .../bindings/display/msm/dsi-phy-14nm.yaml         |    1 +
 .../bindings/display/msm/qcom,sa8775p-mdss.yaml    |    3 +-
 .../bindings/display/msm/qcom,sm6150-dpu.yaml      |  108 ++
 .../bindings/display/msm/qcom,sm6150-mdss.yaml     |  245 ++++
 .../bindings/display/panel/panel-lvds.yaml         |    2 +
 .../bindings/display/panel/panel-simple.yaml       |    8 +
 .../bindings/display/panel/samsung,atna33xc20.yaml |    2 +
 .../devicetree/bindings/display/renesas,du.yaml    |   67 +-
 .../rockchip/rockchip,rk3588-mipi-dsi2.yaml        |  120 ++
 .../bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml   |   10 +-
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 Documentation/gpu/drm-compute.rst                  |   54 +
 Documentation/gpu/drm-kms-helpers.rst              |    3 +
 Documentation/gpu/drm-usage-stats.rst              |   54 +-
 Documentation/gpu/index.rst                        |    1 +
 Documentation/gpu/xe/index.rst                     |    1 +
 Documentation/gpu/xe/xe_devcoredump.rst            |   14 +
 MAINTAINERS                                        |   17 +-
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi             |    7 +-
 drivers/accel/Kconfig                              |    1 +
 drivers/accel/Makefile                             |    1 +
 drivers/accel/amdxdna/Kconfig                      |   18 +
 drivers/accel/amdxdna/Makefile                     |   23 +
 drivers/accel/amdxdna/TODO                         |    3 +
 drivers/accel/amdxdna/aie2_ctx.c                   |  910 +++++++++++++
 drivers/accel/amdxdna/aie2_error.c                 |  360 +++++
 drivers/accel/amdxdna/aie2_message.c               |  776 +++++++++++
 drivers/accel/amdxdna/aie2_msg_priv.h              |  370 +++++
 drivers/accel/amdxdna/aie2_pci.c                   |  928 +++++++++++++
 drivers/accel/amdxdna/aie2_pci.h                   |  297 ++++
 drivers/accel/amdxdna/aie2_pm.c                    |  108 ++
 drivers/accel/amdxdna/aie2_psp.c                   |  146 ++
 drivers/accel/amdxdna/aie2_smu.c                   |  134 ++
 drivers/accel/amdxdna/aie2_solver.c                |  380 ++++++
 drivers/accel/amdxdna/aie2_solver.h                |  155 +++
 drivers/accel/amdxdna/amdxdna_ctx.c                |  550 ++++++++
 drivers/accel/amdxdna/amdxdna_ctx.h                |  162 +++
 drivers/accel/amdxdna/amdxdna_gem.c                |  622 +++++++++
 drivers/accel/amdxdna/amdxdna_gem.h                |   65 +
 drivers/accel/amdxdna/amdxdna_mailbox.c            |  561 ++++++++
 drivers/accel/amdxdna/amdxdna_mailbox.h            |  124 ++
 drivers/accel/amdxdna/amdxdna_mailbox_helper.c     |   61 +
 drivers/accel/amdxdna/amdxdna_mailbox_helper.h     |   42 +
 drivers/accel/amdxdna/amdxdna_pci_drv.c            |  429 ++++++
 drivers/accel/amdxdna/amdxdna_pci_drv.h            |  147 ++
 drivers/accel/amdxdna/amdxdna_sysfs.c              |   67 +
 drivers/accel/amdxdna/npu1_regs.c                  |  114 ++
 drivers/accel/amdxdna/npu2_regs.c                  |  113 ++
 drivers/accel/amdxdna/npu4_regs.c                  |  134 ++
 drivers/accel/amdxdna/npu5_regs.c                  |  113 ++
 drivers/accel/amdxdna/npu6_regs.c                  |  114 ++
 drivers/accel/habanalabs/common/habanalabs_drv.c   |    1 -
 drivers/accel/ivpu/ivpu_drv.c                      |    8 -
 drivers/accel/ivpu/ivpu_pm.c                       |    2 +-
 drivers/accel/qaic/qaic_drv.c                      |    1 -
 drivers/accel/qaic/sahara.c                        |    3 +-
 drivers/gpu/drm/Kconfig                            |   81 +-
 drivers/gpu/drm/Makefile                           |   11 +-
 drivers/gpu/drm/amd/amdgpu/Kconfig                 |    1 +
 drivers/gpu/drm/amd/amdgpu/Makefile                |    8 +-
 drivers/gpu/drm/amd/amdgpu/aldebaran.c             |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.h            |    5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c            |   20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |    8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |   10 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c  |    6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c           |   26 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c            |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  122 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   19 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |   80 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.h        |    5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.h            |    1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c         |   17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c     |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.h     |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |   12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   90 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c             |    6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ih.h             |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c            |    7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |   17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.h           |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |  212 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |   12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   60 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |    6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  353 ++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |   15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |   77 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h     |   21 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c          |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sa.c             |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           |    8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |   21 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |   10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |   81 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |   31 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c       |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |  113 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |   21 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  209 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |   26 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c          |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c            |   11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |    2 +-
 drivers/gpu/drm/amd/amdgpu/cik.c                   |    4 +-
 drivers/gpu/drm/amd/amdgpu/cik_ih.c                |    4 +-
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c              |   10 +-
 drivers/gpu/drm/amd/amdgpu/cz_ih.c                 |    4 +-
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |   31 +-
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c             |   31 +-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |   31 +-
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |   30 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   47 +-
 .../gpu/drm/amd/amdgpu/gfx_v10_0_cleaner_shader.h  |   56 +
 .../drm/amd/amdgpu/gfx_v10_3_0_cleaner_shader.asm  |  124 ++
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   47 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |   54 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.h             |    2 +
 drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c              |   14 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c              |   16 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |   46 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |   42 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c            |   14 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |   57 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.c           |    4 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |    6 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |    6 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c             |   24 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c              |    7 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c              |    9 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |    9 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   59 +-
 drivers/gpu/drm/amd/amdgpu/iceland_ih.c            |    4 +-
 drivers/gpu/drm/amd/amdgpu/ih_v6_0.c               |    8 +-
 drivers/gpu/drm/amd/amdgpu/ih_v6_1.c               |    8 +-
 drivers/gpu/drm/amd/amdgpu/ih_v7_0.c               |    8 +-
 drivers/gpu/drm/amd/amdgpu/imu_v11_0.c             |    3 +-
 drivers/gpu/drm/amd/amdgpu/imu_v12_0.c             |    3 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c             |   14 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c             |   14 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c             |   14 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c             |   14 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c           |  104 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c           |   14 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c           |   20 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.c           |  708 ++++++++++
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.h           |   29 +
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |    4 +-
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |  136 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c            |    2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c            |    1 -
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c             |   11 +-
 drivers/gpu/drm/amd/amdgpu/nbif_v6_3_1.c           |   81 ++
 drivers/gpu/drm/amd/amdgpu/nbif_v6_3_1.h           |    1 +
 drivers/gpu/drm/amd/amdgpu/nv.c                    |    6 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |   12 +
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c             |    8 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c             |   10 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |   14 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |  116 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |    8 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |    8 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |    6 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c             |  343 +++--
 drivers/gpu/drm/amd/amdgpu/si.c                    |    4 +-
 drivers/gpu/drm/amd/amdgpu/si_dma.c                |   10 +-
 drivers/gpu/drm/amd/amdgpu/si_ih.c                 |    4 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |   34 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |    8 +-
 drivers/gpu/drm/amd/amdgpu/soc24.c                 |   27 +-
 drivers/gpu/drm/amd/amdgpu/ta_ras_if.h             |    3 +
 drivers/gpu/drm/amd/amdgpu/ta_secureDisplay_if.h   |   24 +-
 drivers/gpu/drm/amd/amdgpu/tonga_ih.c              |    4 +-
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.c             |  265 ++--
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.h             |   17 +-
 drivers/gpu/drm/amd/amdgpu/umc_v8_14.c             |  160 +++
 drivers/gpu/drm/amd/amdgpu/umc_v8_14.h             |   51 +
 drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c              |    4 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c              |    8 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c              |   17 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c              |   17 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c              |    2 +-
 drivers/gpu/drm/amd/amdgpu/vce_v2_0.c              |    8 +-
 drivers/gpu/drm/amd/amdgpu/vce_v3_0.c              |   12 +-
 drivers/gpu/drm/amd/amdgpu/vce_v4_0.c              |    6 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |   25 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |   24 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |   33 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |   34 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |   40 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            |  121 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c            |   34 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c            |   79 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.h            |    5 +
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c            | 1118 ++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.h            |   29 +
 drivers/gpu/drm/amd/amdgpu/vega10_ih.c             |   11 +-
 drivers/gpu/drm/amd/amdgpu/vega20_ih.c             |   12 +-
 drivers/gpu/drm/amd/amdgpu/vi.c                    |    6 +-
 drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h     |  491 +++++++
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx10.asm |  202 +--
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx12.asm | 1126 ++++++++++++++++
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx9.asm  |   58 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |    1 +
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c             |   17 +
 drivers/gpu/drm/amd/amdkfd/kfd_debug.h             |    1 +
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |  135 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |    3 +
 .../drm/amd/amdkfd/kfd_device_queue_manager_v9.c   |    3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c            |   11 +
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |    2 +
 drivers/gpu/drm/amd/amdkfd/kfd_interrupt.c         |   64 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |   13 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c    |   41 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   14 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |    8 +-
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |   13 +-
 drivers/gpu/drm/amd/amdkfd/kfd_queue.c             |   10 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |   22 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |    5 +-
 drivers/gpu/drm/amd/display/Kconfig                |    2 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  219 ++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   16 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c  |  568 ++++++--
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h  |   55 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |    4 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.h |    2 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |  136 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |    6 +
 .../amd/display/amdgpu_dm/amdgpu_dm_irq_params.h   |    4 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |   59 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |   69 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h    |    5 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |   35 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.h  |    3 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |    9 +-
 drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile    |    2 +-
 drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |    5 +-
 .../amd/display/dc/clk_mgr/dcn201/dcn201_clk_mgr.c |    4 +-
 .../amd/display/dc/clk_mgr/dcn35/dcn351_clk_mgr.c  |  140 ++
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |  241 +++-
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.h   |    4 +
 .../drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.h   |   41 +-
 .../gpu/drm/amd/display/dc/clk_mgr/dcn401/dalsmc.h |    4 +-
 .../amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c |  311 ++---
 .../amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.h |    1 +
 .../dc/clk_mgr/dcn401/dcn401_clk_mgr_smu_msg.c     |   37 +
 .../dc/clk_mgr/dcn401/dcn401_clk_mgr_smu_msg.h     |    4 +
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  123 +-
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |   38 +
 .../gpu/drm/amd/display/dc/core/dc_link_exports.c  |    8 +
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |   16 +-
 drivers/gpu/drm/amd/display/dc/core/dc_state.c     |    8 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |   13 +-
 drivers/gpu/drm/amd/display/dc/core/dc_surface.c   |   53 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |   48 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |   37 +-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |   16 +
 drivers/gpu/drm/amd/display/dc/dc_dsc.h            |    5 +
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |  173 +--
 drivers/gpu/drm/amd/display/dc/dc_plane.h          |    3 +
 drivers/gpu/drm/amd/display/dc/dc_spl_translate.c  |   17 +-
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |   17 +-
 drivers/gpu/drm/amd/display/dc/dc_types.h          |   35 +-
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.c  |    3 +
 drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.c |   44 +-
 .../gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c  |    3 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |    3 +-
 .../drm/amd/display/dc/dce110/dce110_mem_input_v.c |    8 +-
 .../display/dc/dce110/dce110_timing_generator.c    |  193 ++-
 .../display/dc/dce110/dce110_timing_generator.h    |    2 +-
 .../display/dc/dce120/dce120_timing_generator.c    |  116 +-
 .../drm/amd/display/dc/dcn31/dcn31_panel_cntl.c    |   34 +-
 .../display/dc/dio/dcn31/dcn31_dio_link_encoder.c  |    5 +-
 .../display/dc/dio/dcn35/dcn35_dio_link_encoder.c  |   80 ++
 .../display/dc/dio/dcn35/dcn35_dio_link_encoder.h  |   18 +
 drivers/gpu/drm/amd/display/dc/dm_helpers.h        |    5 +
 .../gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c   |  132 --
 .../display/dc/dml/dcn30/display_rq_dlg_calc_30.c  |    1 +
 .../dc/dml/dcn32/display_mode_vba_util_32.c        |    4 +
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |    4 +-
 .../gpu/drm/amd/display/dc/dml/dml_inline_defs.h   |    8 +
 drivers/gpu/drm/amd/display/dc/dml2/Makefile       |   19 +-
 .../drm/amd/display/dc/dml2/display_mode_core.c    |   41 +-
 .../display/dc/dml2/display_mode_core_structs.h    |  109 +-
 .../drm/amd/display/dc/dml2/display_mode_util.c    |    6 +-
 .../dc/dml2/dml21/dml21_translation_helper.c       |  118 +-
 .../dc/dml2/dml21/dml21_translation_helper.h       |    2 -
 .../drm/amd/display/dc/dml2/dml21/dml21_utils.c    |  201 +--
 .../drm/amd/display/dc/dml2/dml21/dml21_utils.h    |    8 +-
 .../drm/amd/display/dc/dml2/dml21/dml21_wrapper.c  |    8 -
 .../dc/dml2/dml21/inc/bounding_boxes/dcn3_soc_bb.h |  401 ------
 .../dc/dml2/dml21/inc/bounding_boxes/dcn4_soc_bb.h |    3 +-
 .../dc/dml2/dml21/inc/dml_top_display_cfg_types.h  |   52 +-
 .../dml2/dml21/inc/dml_top_soc_parameter_types.h   |    2 +
 .../amd/display/dc/dml2/dml21/inc/dml_top_types.h  |   77 +-
 .../dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.c   |   42 +-
 .../dml21/src/dml2_core/dml2_core_dcn4_calcs.c     | 1416 +++++++++++++---=
----
 .../dml21/src/dml2_core/dml2_core_dcn4_calcs.h     |    2 +-
 .../dml21/src/dml2_core/dml2_core_shared_types.h   |  135 +-
 .../dc/dml2/dml21/src/dml2_core/dml2_core_utils.c  |  223 ++-
 .../dc/dml2/dml21/src/dml2_core/dml2_core_utils.h  |    6 +-
 .../dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c   |   59 +-
 .../dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c     |   12 +-
 .../dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c  |  426 +++---
 .../dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.h  |    7 +
 .../dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.c  |    1 -
 .../dml2/dml21/src/dml2_top/dml2_top_interfaces.c  |   50 +
 .../dc/dml2/dml21/src/dml2_top/dml2_top_legacy.c   |   10 +
 .../dc/dml2/dml21/src/dml2_top/dml2_top_legacy.h   |    9 +
 .../dml21/src/dml2_top/dml2_top_optimization.c     |  307 -----
 .../dml21/src/dml2_top/dml2_top_optimization.h     |   33 -
 .../dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c    | 1178 ++++++++++++++++
 .../{dml_top_mcache.h =3D> dml2_top_soc15.h}         |   19 +-
 .../dc/dml2/dml21/src/dml2_top/dml_top_mcache.c    |  549 --------
 .../amd/display/dc/dml2/dml21/src/inc/dml2_debug.c |    5 +
 .../amd/display/dc/dml2/dml21/src/inc/dml2_debug.h |   46 +-
 .../dml21/src/inc/dml2_internal_shared_types.h     |   58 +-
 .../drm/amd/display/dc/dml2/dml2_mall_phantom.c    |    2 +-
 .../amd/display/dc/dml2/dml2_translation_helper.c  |   54 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c |   49 +-
 .../amd/display/dc/dml2/dml_display_rq_dlg_calc.c  |   12 -
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        |   45 +
 .../gpu/drm/amd/display/dc/dwb/dcn30/dcn30_dwb.c   |   13 -
 .../gpu/drm/amd/display/dc/dwb/dcn30/dcn30_dwb.h   |    1 -
 .../gpu/drm/amd/display/dc/hubp/dcn10/dcn10_hubp.c |   19 +-
 .../gpu/drm/amd/display/dc/hubp/dcn10/dcn10_hubp.h |    6 +-
 .../gpu/drm/amd/display/dc/hubp/dcn20/dcn20_hubp.c |   19 +-
 .../gpu/drm/amd/display/dc/hubp/dcn20/dcn20_hubp.h |    4 +-
 .../drm/amd/display/dc/hubp/dcn201/dcn201_hubp.c   |    3 +-
 .../gpu/drm/amd/display/dc/hubp/dcn21/dcn21_hubp.c |    1 +
 .../gpu/drm/amd/display/dc/hubp/dcn30/dcn30_hubp.c |   21 +-
 .../gpu/drm/amd/display/dc/hubp/dcn30/dcn30_hubp.h |    6 +-
 .../gpu/drm/amd/display/dc/hubp/dcn31/dcn31_hubp.c |    1 +
 .../gpu/drm/amd/display/dc/hubp/dcn32/dcn32_hubp.c |    3 +-
 .../gpu/drm/amd/display/dc/hubp/dcn35/dcn35_hubp.c |    3 +-
 .../gpu/drm/amd/display/dc/hubp/dcn35/dcn35_hubp.h |    2 +-
 .../drm/amd/display/dc/hubp/dcn401/dcn401_hubp.c   |  131 +-
 .../drm/amd/display/dc/hubp/dcn401/dcn401_hubp.h   |   64 +-
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |  257 ++--
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.h    |   17 +-
 .../gpu/drm/amd/display/dc/hwss/dcn30/dcn30_init.c |    1 -
 .../drm/amd/display/dc/hwss/dcn301/dcn301_init.c   |    1 -
 .../gpu/drm/amd/display/dc/hwss/dcn31/dcn31_init.c |    3 +-
 .../drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c  |   12 +
 .../drm/amd/display/dc/hwss/dcn314/dcn314_init.c   |    3 +-
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    |   13 +-
 .../gpu/drm/amd/display/dc/hwss/dcn32/dcn32_init.c |    1 -
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |   53 +-
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.h    |    2 +
 .../gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c |    6 +-
 .../drm/amd/display/dc/hwss/dcn351/dcn351_init.c   |    1 -
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |  836 ++++++++++--
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h  |   11 +-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_init.c   |   11 +-
 drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h |   22 +-
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |    8 +-
 drivers/gpu/drm/amd/display/dc/inc/dcn_calcs.h     |    4 -
 drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h    |    3 +
 .../drm/amd/display/dc/inc/hw/clk_mgr_internal.h   |   59 +
 drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h       |   16 +-
 .../gpu/drm/amd/display/dc/inc/hw/link_encoder.h   |    8 +
 drivers/gpu/drm/amd/display/dc/inc/hw/mem_input.h  |    6 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/optc.h       |    2 +-
 .../drm/amd/display/dc/inc/hw/timing_generator.h   |    5 +-
 drivers/gpu/drm/amd/display/dc/inc/link.h          |    4 +
 .../amd/display/dc/irq/dcn201/irq_service_dcn201.c |    4 +-
 .../amd/display/dc/link/accessories/link_dp_cts.c  |    4 +-
 .../drm/amd/display/dc/link/hwss/link_hwss_dio.c   |    4 +-
 .../link/hwss/link_hwss_dio_fixed_vs_pe_retimer.c  |    2 +-
 .../drm/amd/display/dc/link/hwss/link_hwss_dpia.c  |   61 +-
 .../drm/amd/display/dc/link/hwss/link_hwss_dpia.h  |    3 +
 .../gpu/drm/amd/display/dc/link/link_detection.c   |    3 +-
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |   47 +-
 drivers/gpu/drm/amd/display/dc/link/link_factory.c |    3 +-
 .../gpu/drm/amd/display/dc/link/link_validation.c  |  179 +++
 .../gpu/drm/amd/display/dc/link/link_validation.h  |    5 +
 .../drm/amd/display/dc/link/protocols/link_ddc.c   |    2 +-
 .../display/dc/link/protocols/link_dp_capability.c |   36 +-
 .../dc/link/protocols/link_dp_irq_handler.c        |    8 +-
 .../amd/display/dc/link/protocols/link_dp_phy.c    |    2 +-
 .../display/dc/link/protocols/link_dp_training.c   |    4 +-
 .../gpu/drm/amd/display/dc/mpc/dcn30/dcn30_mpc.c   |   18 +
 .../gpu/drm/amd/display/dc/mpc/dcn30/dcn30_mpc.h   |    7 +
 .../gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c |  112 +-
 .../gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.h |   19 +
 .../gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c |  101 +-
 .../drm/amd/display/dc/optc/dcn401/dcn401_optc.c   |    4 +-
 .../amd/display/dc/resource/dcn10/dcn10_resource.c |    8 +-
 .../amd/display/dc/resource/dcn10/dcn10_resource.h |    1 +
 .../amd/display/dc/resource/dcn20/dcn20_resource.c |   60 +-
 .../display/dc/resource/dcn201/dcn201_resource.c   |    7 +-
 .../amd/display/dc/resource/dcn21/dcn21_resource.c |    1 +
 .../amd/display/dc/resource/dcn30/dcn30_resource.c |    1 +
 .../display/dc/resource/dcn301/dcn301_resource.c   |   11 +-
 .../display/dc/resource/dcn302/dcn302_resource.c   |    1 +
 .../display/dc/resource/dcn303/dcn303_resource.c   |    1 +
 .../amd/display/dc/resource/dcn31/dcn31_resource.c |    1 +
 .../display/dc/resource/dcn314/dcn314_resource.c   |    1 +
 .../display/dc/resource/dcn315/dcn315_resource.c   |    1 +
 .../display/dc/resource/dcn316/dcn316_resource.c   |    1 +
 .../amd/display/dc/resource/dcn32/dcn32_resource.c |    1 +
 .../display/dc/resource/dcn321/dcn321_resource.c   |    1 +
 .../amd/display/dc/resource/dcn35/dcn35_resource.c |   10 +-
 .../amd/display/dc/resource/dcn35/dcn35_resource.h |    1 +
 .../display/dc/resource/dcn351/dcn351_resource.c   |    3 +-
 .../display/dc/resource/dcn401/dcn401_resource.c   |   61 +-
 drivers/gpu/drm/amd/display/dc/spl/dc_spl.c        |  179 +--
 drivers/gpu/drm/amd/display/dc/spl/dc_spl_types.h  |   16 +-
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |    3 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  219 ++-
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |    4 -
 .../drm/amd/display/modules/power/power_helpers.c  |    9 +-
 .../drm/amd/display/modules/power/power_helpers.h  |    3 +-
 drivers/gpu/drm/amd/include/amd_shared.h           |    9 +-
 .../dcn/{dcn_2_0_3_offset.h =3D> dcn_2_0_1_offset.h} |    4 +-
 .../{dcn_2_0_3_sh_mask.h =3D> dcn_2_0_1_sh_mask.h}   |    4 +-
 .../amd/include/asic_reg/umc/umc_8_14_0_offset.h   |   29 +
 .../amd/include/asic_reg/umc/umc_8_14_0_sh_mask.h  |   37 +
 drivers/gpu/drm/amd/include/atomfirmware.h         |   17 +-
 .../drm/amd/include/ivsrcid/vcn/irqsrcs_vcn_5_0.h  |   47 +
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |    4 +-
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |  108 +-
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |    4 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c         |    8 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c         |    7 +-
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |    8 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c    |    2 +
 .../drm/amd/pm/powerplay/hwmgr/vega10_powertune.c  |    5 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   86 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |    8 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_pmfw.h    |   14 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_ppsmc.h   |    4 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |    4 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |    2 +
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |   20 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |    3 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |   31 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   12 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |   64 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |    1 +
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c     |   38 +-
 drivers/gpu/drm/arm/display/komeda/komeda_drv.c    |    2 +-
 drivers/gpu/drm/arm/display/komeda/komeda_kms.c    |    1 -
 drivers/gpu/drm/arm/hdlcd_drv.c                    |    3 +-
 drivers/gpu/drm/arm/malidp_drv.c                   |    3 +-
 drivers/gpu/drm/armada/armada_drv.c                |    3 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c            |    3 +-
 drivers/gpu/drm/ast/ast_drv.c                      |    3 +-
 drivers/gpu/drm/ast/ast_drv.h                      |    1 -
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c       |    3 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c     |    3 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c |    2 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |   80 +-
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c    |   28 -
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.h    |    3 -
 drivers/gpu/drm/bridge/chipone-icn6211.c           |    2 +-
 drivers/gpu/drm/bridge/chrontel-ch7033.c           |    2 +-
 drivers/gpu/drm/bridge/ite-it6263.c                |   37 +-
 drivers/gpu/drm/bridge/ite-it6505.c                |  337 ++++-
 drivers/gpu/drm/bridge/ite-it66121.c               |    6 +-
 drivers/gpu/drm/bridge/lontium-lt8912b.c           |    4 +-
 drivers/gpu/drm/bridge/lontium-lt9211.c            |    2 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            |  187 +--
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |    7 +-
 .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   |    8 +-
 drivers/gpu/drm/bridge/nxp-ptn3460.c               |    4 +-
 drivers/gpu/drm/bridge/sii902x.c                   |   11 +-
 drivers/gpu/drm/bridge/sii9234.c                   |    4 +-
 drivers/gpu/drm/bridge/sil-sii8620.c               |    4 +-
 drivers/gpu/drm/bridge/synopsys/Kconfig            |    6 +
 drivers/gpu/drm/bridge/synopsys/Makefile           |    1 +
 .../gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c    |    3 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       |   29 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h       |    2 +-
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c     | 1030 ++++++++++++++
 drivers/gpu/drm/bridge/tc358767.c                  |    2 +-
 drivers/gpu/drm/bridge/tc358768.c                  |    4 +-
 drivers/gpu/drm/bridge/ti-dlpc3433.c               |    2 +-
 drivers/gpu/drm/bridge/ti-sn65dsi83.c              |  149 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |    6 +-
 drivers/gpu/drm/bridge/ti-tfp410.c                 |    2 +-
 drivers/gpu/drm/clients/Kconfig                    |  123 ++
 drivers/gpu/drm/clients/Makefile                   |    8 +
 .../gpu/drm/clients/drm_client_internal.h          |   10 +-
 drivers/gpu/drm/{ =3D> clients}/drm_client_setup.c   |   34 +-
 drivers/gpu/drm/{ =3D> clients}/drm_fbdev_client.c   |    4 +-
 drivers/gpu/drm/clients/drm_log.c                  |  420 ++++++
 drivers/gpu/drm/display/Kconfig                    |    8 +
 drivers/gpu/drm/display/Makefile                   |    2 +
 drivers/gpu/drm/display/drm_bridge_connector.c     |  167 ++-
 drivers/gpu/drm/display/drm_dp_helper.c            |  125 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c      |  100 +-
 drivers/gpu/drm/display/drm_hdmi_audio_helper.c    |  190 +++
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |   91 ++
 drivers/gpu/drm/drm_connector.c                    |  174 ++-
 drivers/gpu/drm/drm_draw.c                         |  233 ++++
 drivers/gpu/drm/drm_draw_internal.h                |   56 +
 drivers/gpu/drm/drm_drv.c                          |   32 +
 drivers/gpu/drm/drm_edid.c                         |    6 +
 drivers/gpu/drm/drm_file.c                         |   23 +-
 drivers/gpu/drm/drm_mode_config.c                  |    9 +
 drivers/gpu/drm/drm_modes.c                        |    3 +-
 drivers/gpu/drm/drm_of.c                           |    4 +-
 drivers/gpu/drm/drm_panel.c                        |    3 +-
 drivers/gpu/drm/drm_panel_backlight_quirks.c       |   94 ++
 drivers/gpu/drm/drm_panic.c                        |  269 +---
 drivers/gpu/drm/drm_print.c                        |   23 +
 drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c           |    3 +-
 drivers/gpu/drm/etnaviv/etnaviv_drv.c              |   13 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem.c              |   28 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem.h              |    2 -
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c              |   41 +
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h              |    2 +
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c              |   26 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.c            |    4 +-
 drivers/gpu/drm/exynos/exynos_hdmi.c               |    4 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c          |    3 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c          |    1 +
 drivers/gpu/drm/gma500/psb_drv.c                   |    3 +-
 drivers/gpu/drm/gma500/psb_drv.h                   |    1 -
 drivers/gpu/drm/gud/gud_drv.c                      |    3 +-
 drivers/gpu/drm/hisilicon/hibmc/Kconfig            |    2 +-
 drivers/gpu/drm/hisilicon/hibmc/Makefile           |    3 +-
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c        |  164 +++
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h       |   63 +
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h     |   19 +
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c         |  220 +++
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h         |   28 +
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c       |  332 +++++
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h        |   76 ++
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c     |  118 ++
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c    |   17 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h    |   19 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c    |   37 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c   |   20 +-
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c    |    1 -
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c    |    2 +-
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c            |    4 +-
 drivers/gpu/drm/i2c/ch7006_drv.c                   |    2 +-
 drivers/gpu/drm/i2c/sil164_drv.c                   |    2 +-
 drivers/gpu/drm/i2c/tda9950.c                      |    4 +-
 drivers/gpu/drm/i2c/tda998x_drv.c                  |    4 +-
 drivers/gpu/drm/i915/Makefile                      |    5 +-
 drivers/gpu/drm/i915/display/dvo_ns2501.c          |    1 -
 drivers/gpu/drm/i915/display/g4x_dp.c              |   26 +-
 drivers/gpu/drm/i915/display/g4x_dp.h              |    6 -
 drivers/gpu/drm/i915/display/g4x_hdmi.c            |   36 +-
 drivers/gpu/drm/i915/display/g4x_hdmi.h            |    5 +-
 drivers/gpu/drm/i915/display/hsw_ips.c             |   20 +-
 drivers/gpu/drm/i915/display/hsw_ips.h             |    6 +-
 drivers/gpu/drm/i915/display/i9xx_display_sr.c     |   97 ++
 drivers/gpu/drm/i915/display/i9xx_display_sr.h     |   14 +
 drivers/gpu/drm/i915/display/i9xx_plane.c          |    1 +
 drivers/gpu/drm/i915/display/i9xx_wm.c             |    1 +
 drivers/gpu/drm/i915/display/i9xx_wm_regs.h        |  257 ++++
 drivers/gpu/drm/i915/display/icl_dsi.c             |    5 +-
 drivers/gpu/drm/i915/display/intel_acpi.c          |    3 +-
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |   28 +-
 drivers/gpu/drm/i915/display/intel_audio.c         |   57 +-
 drivers/gpu/drm/i915/display/intel_audio.h         |    1 +
 drivers/gpu/drm/i915/display/intel_backlight.c     |    1 +
 drivers/gpu/drm/i915/display/intel_bios.c          |   15 +-
 drivers/gpu/drm/i915/display/intel_bios.h          |    8 -
 drivers/gpu/drm/i915/display/intel_bw.c            |    5 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |  179 +--
 drivers/gpu/drm/i915/display/intel_color.c         |    1 +
 drivers/gpu/drm/i915/display/intel_combo_phy.c     |    1 +
 drivers/gpu/drm/i915/display/intel_crt.c           |  163 ++-
 drivers/gpu/drm/i915/display/intel_crt_regs.h      |   50 +
 drivers/gpu/drm/i915/display/intel_crtc.c          |    1 +
 .../gpu/drm/i915/display/intel_crtc_state_dump.c   |   14 +-
 drivers/gpu/drm/i915/display/intel_cursor.c        |    6 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy.c       |   43 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h  |   16 +
 drivers/gpu/drm/i915/display/intel_ddi.c           |  664 +++++----
 drivers/gpu/drm/i915/display/intel_ddi.h           |   12 +-
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c |   23 +-
 drivers/gpu/drm/i915/display/intel_de.h            |   18 +-
 drivers/gpu/drm/i915/display/intel_display.c       |  117 +-
 drivers/gpu/drm/i915/display/intel_display.h       |    3 -
 .../drm/i915/display/intel_display_conversion.c    |   14 +
 .../drm/i915/display/intel_display_conversion.h    |   10 +-
 drivers/gpu/drm/i915/display/intel_display_core.h  |   17 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |   11 +-
 .../i915/display/intel_display_debugfs_params.c    |    3 +-
 .../gpu/drm/i915/display/intel_display_device.c    |  278 ++--
 .../gpu/drm/i915/display/intel_display_device.h    |  155 ++-
 .../gpu/drm/i915/display/intel_display_driver.c    |  301 +++--
 .../gpu/drm/i915/display/intel_display_driver.h    |   38 +-
 drivers/gpu/drm/i915/display/intel_display_irq.c   |   52 +-
 .../gpu/drm/i915/display/intel_display_params.c    |   13 +-
 .../gpu/drm/i915/display/intel_display_params.h    |    2 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |  952 ++++++-------
 drivers/gpu/drm/i915/display/intel_display_power.h |   29 +-
 .../gpu/drm/i915/display/intel_display_power_map.c |   62 +-
 .../drm/i915/display/intel_display_power_well.c    |  567 ++++----
 .../drm/i915/display/intel_display_power_well.h    |   35 +-
 drivers/gpu/drm/i915/display/intel_display_reset.c |    4 +-
 .../gpu/drm/i915/display/intel_display_snapshot.c  |    4 +-
 drivers/gpu/drm/i915/display/intel_display_trace.h |    2 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |   51 +-
 drivers/gpu/drm/i915/display/intel_dmc.c           |    4 -
 drivers/gpu/drm/i915/display/intel_dmc_wl.c        |  315 ++++-
 drivers/gpu/drm/i915/display/intel_dmc_wl.h        |   14 +-
 drivers/gpu/drm/i915/display/intel_dp.c            | 1265 ++++++++--------=
-
 drivers/gpu/drm/i915/display/intel_dp.h            |   41 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.c        |    3 +-
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c  |    3 +-
 .../gpu/drm/i915/display/intel_dp_link_training.c  |   40 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |  928 +++++++------
 drivers/gpu/drm/i915/display/intel_dp_mst.h        |    7 +
 drivers/gpu/drm/i915/display/intel_dp_test.c       |    1 -
 drivers/gpu/drm/i915/display/intel_dp_tunnel.c     |    3 +-
 drivers/gpu/drm/i915/display/intel_dpio_phy.c      |    8 +-
 drivers/gpu/drm/i915/display/intel_dpll.c          |    1 +
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |    1 +
 drivers/gpu/drm/i915/display/intel_dpt.c           |    4 +-
 drivers/gpu/drm/i915/display/intel_dpt_common.c    |    1 +
 drivers/gpu/drm/i915/display/intel_drrs.c          |    4 +-
 drivers/gpu/drm/i915/display/intel_dsb.c           |   58 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c       |   20 +-
 drivers/gpu/drm/i915/display/intel_dvo.c           |    9 +-
 drivers/gpu/drm/i915/display/intel_fdi.c           |    1 +
 drivers/gpu/drm/i915/display/intel_global_state.c  |   42 +-
 drivers/gpu/drm/i915/display/intel_global_state.h  |    6 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c         |    3 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c          |   48 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |   19 +-
 drivers/gpu/drm/i915/display/intel_hdmi.h          |    2 +-
 drivers/gpu/drm/i915/display/intel_hotplug.c       |    4 +-
 drivers/gpu/drm/i915/display/intel_hotplug_irq.c   |    6 +-
 drivers/gpu/drm/i915/display/intel_hti.c           |    3 +-
 drivers/gpu/drm/i915/display/intel_link_bw.c       |    3 +-
 drivers/gpu/drm/i915/display/intel_load_detect.c   |    2 +-
 drivers/gpu/drm/i915/display/intel_lspcon.c        |    3 +-
 drivers/gpu/drm/i915/display/intel_lvds.c          |   49 +-
 drivers/gpu/drm/i915/display/intel_modeset_setup.c |   19 +-
 drivers/gpu/drm/i915/display/intel_overlay.c       |  184 +--
 drivers/gpu/drm/i915/display/intel_overlay.h       |   19 +-
 drivers/gpu/drm/i915/display/intel_panel.c         |    7 +-
 drivers/gpu/drm/i915/display/intel_pch_display.c   |    2 +
 drivers/gpu/drm/i915/display/intel_pch_refclk.c    |   27 +-
 drivers/gpu/drm/i915/display/intel_pfit.c          |    2 +-
 drivers/gpu/drm/i915/display/intel_pipe_crc.c      |    1 +
 drivers/gpu/drm/i915/display/intel_plane_initial.c |   56 +-
 drivers/gpu/drm/i915/display/intel_plane_initial.h |    4 +-
 drivers/gpu/drm/i915/display/intel_pmdemand.c      |  195 +--
 drivers/gpu/drm/i915/display/intel_pmdemand.h      |   51 +-
 drivers/gpu/drm/i915/display/intel_pps.c           |  174 +--
 drivers/gpu/drm/i915/display/intel_psr.c           |   88 +-
 drivers/gpu/drm/i915/display/intel_quirks.c        |    2 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c          |   12 +-
 drivers/gpu/drm/i915/display/intel_snps_phy.c      |    1 +
 drivers/gpu/drm/i915/display/intel_tc.c            |   41 +-
 drivers/gpu/drm/i915/display/intel_tv.c            |    5 +-
 drivers/gpu/drm/i915/display/intel_vbt_defs.h      |    8 +
 drivers/gpu/drm/i915/display/intel_vdsc.c          |   80 +-
 drivers/gpu/drm/i915/display/intel_vdsc.h          |    1 +
 drivers/gpu/drm/i915/display/intel_vdsc_regs.h     |   12 +-
 drivers/gpu/drm/i915/display/intel_vrr.c           |    3 +-
 drivers/gpu/drm/i915/display/skl_scaler.c          |  287 ++--
 drivers/gpu/drm/i915/display/skl_scaler.h          |   11 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.c |   51 +-
 .../drm/i915/display/skl_universal_plane_regs.h    |   15 +
 drivers/gpu/drm/i915/display/skl_watermark.c       |  867 +++++++-----
 drivers/gpu/drm/i915/display/skl_watermark.h       |    5 +
 drivers/gpu/drm/i915/display/vlv_dsi.c             |   28 +-
 drivers/gpu/drm/i915/display/vlv_dsi.h             |    7 +-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.c           |   23 -
 drivers/gpu/drm/i915/gem/i915_gem_lmem.h           |    2 -
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |    4 +-
 drivers/gpu/drm/i915/gt/intel_engine.h             |    3 -
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |    9 -
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |   19 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h                |    4 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |    9 +-
 drivers/gpu/drm/i915/gt/intel_ring.c               |   24 -
 drivers/gpu/drm/i915/gt/intel_ring.h               |    1 -
 drivers/gpu/drm/i915/gt/intel_ring_submission.c    |   30 +-
 drivers/gpu/drm/i915/gt/selftest_migrate.c         |    2 +-
 drivers/gpu/drm/i915/gt/selftest_rc6.c             |   17 +-
 drivers/gpu/drm/i915/gt/selftest_rps.c             |    1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c         |    2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |   12 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc.c             |   13 -
 drivers/gpu/drm/i915/gt/uc/intel_huc.h             |    1 -
 drivers/gpu/drm/i915/gvt/cmd_parser.c              |   17 +-
 drivers/gpu/drm/i915/gvt/display.c                 |   81 +-
 drivers/gpu/drm/i915/gvt/fb_decoder.c              |   21 +-
 drivers/gpu/drm/i915/gvt/handlers.c                |   45 +-
 drivers/gpu/drm/i915/i915_active.c                 |   18 -
 drivers/gpu/drm/i915/i915_active.h                 |    1 -
 drivers/gpu/drm/i915/i915_driver.c                 |  133 +-
 drivers/gpu/drm/i915/i915_driver.h                 |    1 -
 drivers/gpu/drm/i915/i915_drm_client.c             |    1 +
 drivers/gpu/drm/i915/i915_drv.h                    |   21 +-
 drivers/gpu/drm/i915/i915_gem_gtt.c                |    2 +-
 drivers/gpu/drm/i915/i915_getparam.c               |    5 +-
 drivers/gpu/drm/i915/i915_gpu_error.c              |    1 -
 drivers/gpu/drm/i915/i915_irq.c                    |   12 +-
 drivers/gpu/drm/i915/i915_mm.c                     |    4 +-
 drivers/gpu/drm/i915/i915_pmu.c                    |   50 +-
 drivers/gpu/drm/i915/i915_pmu.h                    |    4 +-
 drivers/gpu/drm/i915/i915_reg.h                    |  378 +-----
 drivers/gpu/drm/i915/i915_suspend.c                |  141 --
 drivers/gpu/drm/i915/i915_suspend.h                |   14 -
 drivers/gpu/drm/i915/i915_trace.h                  |   28 -
 drivers/gpu/drm/i915/intel_cpu_info.c              |   44 +
 drivers/gpu/drm/i915/intel_cpu_info.h              |   13 +
 drivers/gpu/drm/i915/intel_device_info.c           |    9 +
 drivers/gpu/drm/i915/intel_device_info.h           |    5 +-
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c        |    2 +
 drivers/gpu/drm/i915/intel_sbi.c                   |   22 +-
 drivers/gpu/drm/i915/intel_sbi.h                   |    4 +
 drivers/gpu/drm/i915/intel_uncore.c                |    7 +-
 drivers/gpu/drm/i915/intel_uncore.h                |    2 +
 drivers/gpu/drm/i915/intel_uncore_trace.c          |    7 +
 drivers/gpu/drm/i915/intel_uncore_trace.h          |   49 +
 drivers/gpu/drm/i915/selftests/igt_flush_test.c    |   12 +-
 drivers/gpu/drm/i915/selftests/mock_gem_device.c   |    2 +-
 drivers/gpu/drm/i915/vlv_sideband.c                |   28 +-
 drivers/gpu/drm/i915/vlv_sideband.h                |    3 +
 drivers/gpu/drm/i915/vlv_suspend.c                 |    1 +
 drivers/gpu/drm/imagination/pvr_drv.c              |    1 -
 drivers/gpu/drm/imagination/pvr_drv.h              |    1 -
 drivers/gpu/drm/imx/dcss/dcss-kms.c                |    3 +-
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c           |    3 +-
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c                |    3 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |    3 +-
 drivers/gpu/drm/kmb/kmb_drv.c                      |    3 +-
 drivers/gpu/drm/kmb/kmb_drv.h                      |    1 -
 drivers/gpu/drm/lima/lima_drv.c                    |    1 -
 drivers/gpu/drm/logicvc/logicvc_drm.c              |    3 +-
 drivers/gpu/drm/loongson/lsdc_drv.c                |   10 +-
 drivers/gpu/drm/mcde/mcde_drv.c                    |    3 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                  |   35 +-
 drivers/gpu/drm/mediatek/mtk_dp_reg.h              |    1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |    4 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |    2 +-
 drivers/gpu/drm/meson/meson_drv.c                  |    3 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c              |    3 +-
 drivers/gpu/drm/mgag200/mgag200_drv.h              |    1 -
 drivers/gpu/drm/msm/Makefile                       |    1 +
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |    6 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   15 +-
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |   22 +
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  203 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |   26 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |   12 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |    1 +
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c              |   54 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h              |    5 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |   24 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |    7 +
 .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    |   31 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h |   54 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |    2 +
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |    2 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h |  254 ++++
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |    2 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |    2 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |    4 +-
 .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    |    4 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |    6 +-
 .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   |   10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |   63 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |    2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |    1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   14 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.c         |   75 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.h         |   70 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   13 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |    4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   50 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |    4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  404 ++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h          |   13 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |  175 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |   18 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c      |    3 -
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c  |    2 +-
 drivers/gpu/drm/msm/dp/dp_audio.c                  |  267 +---
 drivers/gpu/drm/msm/dp/dp_audio.h                  |    3 -
 drivers/gpu/drm/msm/dp/dp_catalog.c                |  161 +--
 drivers/gpu/drm/msm/dp/dp_catalog.h                |   35 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |    2 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |   11 +-
 drivers/gpu/drm/msm/dp/dp_panel.c                  |   26 +-
 drivers/gpu/drm/msm/dp/dp_panel.h                  |   11 +-
 drivers/gpu/drm/msm/dp/dp_utils.c                  |   10 +-
 drivers/gpu/drm/msm/dp/dp_utils.h                  |    2 +-
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |    2 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |    1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |    2 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |    2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |    1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |   21 +
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c           |    2 +-
 drivers/gpu/drm/msm/msm_drv.c                      |    5 +-
 drivers/gpu/drm/msm/msm_drv.h                      |    7 +
 drivers/gpu/drm/msm/msm_gem_submit.c               |   67 +-
 drivers/gpu/drm/msm/msm_kms.c                      |    1 -
 drivers/gpu/drm/msm/msm_mdss.c                     |   79 +-
 drivers/gpu/drm/msm/msm_mdss.h                     |    4 +-
 drivers/gpu/drm/msm/msm_submitqueue.c              |    2 +-
 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml  |    5 +
 drivers/gpu/drm/msm/registers/display/mdss.xml     |   11 +-
 drivers/gpu/drm/mxsfb/lcdif_drv.c                  |    3 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c                  |    3 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |    7 +-
 drivers/gpu/drm/nouveau/include/nvif/log.h         |   51 +
 drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h  |   21 +
 drivers/gpu/drm/nouveau/nouveau_debugfs.c          |   16 +
 drivers/gpu/drm/nouveau/nouveau_debugfs.h          |   16 +
 drivers/gpu/drm/nouveau/nouveau_drm.c              |   45 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h              |    1 -
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c     |  508 ++++++-
 drivers/gpu/drm/omapdrm/omap_drv.c                 |    2 -
 drivers/gpu/drm/omapdrm/omap_fbdev.c               |    2 +-
 drivers/gpu/drm/panel/panel-edp.c                  |    8 +
 drivers/gpu/drm/panel/panel-orisetech-otm8009a.c   |    1 +
 .../gpu/drm/panel/panel-raspberrypi-touchscreen.c  |    2 +-
 drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c   |    1 +
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.c      |    1 +
 drivers/gpu/drm/panel/panel-simple.c               |  136 ++
 drivers/gpu/drm/panel/panel-visionox-rm69299.c     |    9 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c            |    1 -
 drivers/gpu/drm/panfrost/panfrost_gpu.c            |    4 +
 drivers/gpu/drm/panthor/panthor_devfreq.c          |   12 +-
 drivers/gpu/drm/panthor/panthor_devfreq.h          |    4 +-
 drivers/gpu/drm/panthor/panthor_device.c           |   90 +-
 drivers/gpu/drm/panthor/panthor_device.h           |   37 +
 drivers/gpu/drm/panthor/panthor_drv.c              |    6 +-
 drivers/gpu/drm/panthor/panthor_fw.c               |  140 +-
 drivers/gpu/drm/panthor/panthor_gpu.c              |   23 +-
 drivers/gpu/drm/panthor/panthor_mmu.c              |   26 +-
 drivers/gpu/drm/panthor/panthor_sched.c            |   22 +-
 drivers/gpu/drm/pl111/pl111_drv.c                  |    3 +-
 drivers/gpu/drm/qxl/Kconfig                        |    1 +
 drivers/gpu/drm/qxl/qxl_drv.c                      |    3 +-
 drivers/gpu/drm/qxl/qxl_drv.h                      |    8 +-
 drivers/gpu/drm/qxl/qxl_release.c                  |   68 +-
 drivers/gpu/drm/radeon/Kconfig                     |    1 +
 drivers/gpu/drm/radeon/radeon.h                    |    7 +-
 drivers/gpu/drm/radeon/radeon_audio.c              |    2 +
 drivers/gpu/drm/radeon/radeon_cs.c                 |   45 +-
 drivers/gpu/drm/radeon/radeon_drv.c                |    3 +-
 drivers/gpu/drm/radeon/radeon_drv.h                |    1 -
 drivers/gpu/drm/radeon/radeon_gem.c                |   39 +-
 drivers/gpu/drm/radeon/radeon_object.c             |   25 +-
 drivers/gpu/drm/radeon/radeon_object.h             |    2 +-
 drivers/gpu/drm/radeon/radeon_vm.c                 |   10 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c      |   21 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c    |   24 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c    |    4 +-
 .../gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h   |    1 -
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c      |    8 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c       |    3 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c   |   18 +
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c       |    6 +-
 drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c   |    3 +-
 drivers/gpu/drm/rockchip/Kconfig                   |   10 +
 drivers/gpu/drm/rockchip/Makefile                  |    1 +
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |    4 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |   13 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.h             |    2 +-
 drivers/gpu/drm/rockchip/cdn-dp-reg.c              |    2 +-
 drivers/gpu/drm/rockchip/cdn-dp-reg.h              |    2 +-
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c    |    2 +-
 drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c   |  487 +++++++
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        |    2 +-
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c     |  147 +-
 drivers/gpu/drm/rockchip/inno_hdmi.c               |    2 +-
 drivers/gpu/drm/rockchip/inno_hdmi.h               |    2 +-
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             |    2 +-
 drivers/gpu/drm/rockchip/rk3066_hdmi.h             |    2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |   11 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h        |    3 +-
 drivers/gpu/drm/rockchip/rockchip_drm_fb.c         |    2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_fb.h         |    2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c        |    2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.h        |    2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |    2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.h        |    2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |  598 ++++++++-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h       |   28 +-
 drivers/gpu/drm/rockchip/rockchip_lvds.c           |    2 +-
 drivers/gpu/drm/rockchip/rockchip_lvds.h           |    2 +-
 drivers/gpu/drm/rockchip/rockchip_rgb.c            |    2 +-
 drivers/gpu/drm/rockchip/rockchip_rgb.h            |    2 +-
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c       |  219 ++-
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c        |    2 +-
 drivers/gpu/drm/rockchip/rockchip_vop_reg.h        |    2 +-
 drivers/gpu/drm/solomon/ssd130x.c                  |    4 +-
 drivers/gpu/drm/sprd/sprd_drm.c                    |    2 -
 drivers/gpu/drm/sti/sti_drv.c                      |    4 +-
 drivers/gpu/drm/sti/sti_hdmi.c                     |    4 +-
 drivers/gpu/drm/stm/drv.c                          |    3 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c                  |    3 +-
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |   32 +-
 drivers/gpu/drm/tegra/drm.c                        |    4 +-
 drivers/gpu/drm/tests/drm_connector_test.c         |  463 +++++++
 drivers/gpu/drm/tests/drm_dp_mst_helper_test.c     |   17 +-
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |  461 +++++--
 drivers/gpu/drm/tests/drm_kunit_edid.h             |  102 ++
 drivers/gpu/drm/tidss/tidss_dispc.c                |   28 +-
 drivers/gpu/drm/tidss/tidss_drv.c                  |    5 +-
 drivers/gpu/drm/tidss/tidss_drv.h                  |    5 +-
 drivers/gpu/drm/tidss/tidss_irq.c                  |   34 +-
 drivers/gpu/drm/tidss/tidss_irq.h                  |    4 +-
 drivers/gpu/drm/tidss/tidss_plane.c                |    8 +
 drivers/gpu/drm/tidss/tidss_plane.h                |    2 +
 drivers/gpu/drm/tilcdc/tilcdc_drv.c                |    3 +-
 drivers/gpu/drm/tiny/Makefile                      |    2 +-
 drivers/gpu/drm/tiny/arcpgu.c                      |    6 +-
 drivers/gpu/drm/tiny/bochs.c                       |    3 +-
 drivers/gpu/drm/tiny/{cirrus.c =3D> cirrus-qemu.c}   |   10 +-
 drivers/gpu/drm/tiny/gm12u320.c                    |    4 +-
 drivers/gpu/drm/tiny/hx8357d.c                     |    3 +-
 drivers/gpu/drm/tiny/ili9163.c                     |    3 +-
 drivers/gpu/drm/tiny/ili9225.c                     |    3 +-
 drivers/gpu/drm/tiny/ili9341.c                     |    3 +-
 drivers/gpu/drm/tiny/ili9486.c                     |    3 +-
 drivers/gpu/drm/tiny/mi0283qt.c                    |    3 +-
 drivers/gpu/drm/tiny/ofdrm.c                       |    4 +-
 drivers/gpu/drm/tiny/panel-mipi-dbi.c              |    4 +-
 drivers/gpu/drm/tiny/repaper.c                     |    3 +-
 drivers/gpu/drm/tiny/sharp-memory.c                |    3 +-
 drivers/gpu/drm/tiny/simpledrm.c                   |    4 +-
 drivers/gpu/drm/tiny/st7586.c                      |    3 +-
 drivers/gpu/drm/tiny/st7735r.c                     |    3 +-
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c            |   18 +-
 drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c   |    4 +-
 drivers/gpu/drm/ttm/tests/ttm_resource_test.c      |    2 +-
 drivers/gpu/drm/ttm/ttm_bo.c                       |   52 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c                    |   54 +-
 drivers/gpu/drm/ttm/ttm_resource.c                 |   23 +-
 drivers/gpu/drm/tve200/tve200_drv.c                |    3 +-
 drivers/gpu/drm/udl/udl_drv.c                      |    3 +-
 drivers/gpu/drm/udl/udl_drv.h                      |    1 -
 drivers/gpu/drm/v3d/v3d_bo.c                       |    4 -
 drivers/gpu/drm/v3d/v3d_debugfs.c                  |    4 +-
 drivers/gpu/drm/v3d/v3d_drv.c                      |    3 +-
 drivers/gpu/drm/v3d/v3d_drv.h                      |    8 +
 drivers/gpu/drm/v3d/v3d_mmu.c                      |    8 +-
 drivers/gpu/drm/v3d/v3d_perfmon.c                  |   57 +-
 drivers/gpu/drm/v3d/v3d_performance_counters.h     |   12 +-
 drivers/gpu/drm/v3d/v3d_regs.h                     |   29 +-
 drivers/gpu/drm/v3d/v3d_sched.c                    |   26 +-
 drivers/gpu/drm/v3d/v3d_submit.c                   |   19 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.c               |    3 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.h               |    1 -
 drivers/gpu/drm/vc4/Kconfig                        |    1 +
 drivers/gpu/drm/vc4/tests/vc4_mock.c               |    8 +-
 drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c     |  106 +-
 drivers/gpu/drm/vc4/vc4_crtc.c                     |   96 +-
 drivers/gpu/drm/vc4/vc4_drv.c                      |   24 +-
 drivers/gpu/drm/vc4/vc4_drv.h                      |   54 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  216 +--
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |    6 +-
 drivers/gpu/drm/vc4/vc4_hdmi_phy.c                 |  640 +++++++++
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h                |  217 +++
 drivers/gpu/drm/vc4/vc4_hvs.c                      |  737 +++++++++-
 drivers/gpu/drm/vc4/vc4_kms.c                      |  105 +-
 drivers/gpu/drm/vc4/vc4_plane.c                    |  873 +++++++++++-
 drivers/gpu/drm/vc4/vc4_regs.h                     |  297 ++++
 drivers/gpu/drm/vc4/vc4_txp.c                      |   91 +-
 drivers/gpu/drm/vgem/vgem_drv.c                    |    2 -
 drivers/gpu/drm/virtio/virtgpu_drv.c               |    4 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h               |   21 +-
 drivers/gpu/drm/virtio/virtgpu_gem.c               |   23 +-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c             |    6 +-
 drivers/gpu/drm/virtio/virtgpu_object.c            |   24 +
 drivers/gpu/drm/virtio/virtgpu_plane.c             |  125 +-
 drivers/gpu/drm/virtio/virtgpu_prime.c             |  178 ++-
 drivers/gpu/drm/virtio/virtgpu_vq.c                |   35 +
 drivers/gpu/drm/vkms/vkms_composer.c               |  310 ++++-
 drivers/gpu/drm/vkms/vkms_crtc.c                   |    6 +-
 drivers/gpu/drm/vkms/vkms_drv.c                    |    9 +-
 drivers/gpu/drm/vkms/vkms_drv.h                    |   63 +-
 drivers/gpu/drm/vkms/vkms_formats.c                |  413 ++++--
 drivers/gpu/drm/vkms/vkms_formats.h                |    4 +-
 drivers/gpu/drm/vkms/vkms_output.c                 |   49 +-
 drivers/gpu/drm/vkms/vkms_plane.c                  |   19 +-
 drivers/gpu/drm/vkms/vkms_writeback.c              |    5 -
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |    3 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |    1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c                |    1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c               |    1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c               |    1 -
 drivers/gpu/drm/xe/Kconfig.debug                   |    4 +-
 drivers/gpu/drm/xe/Makefile                        |    6 +-
 drivers/gpu/drm/xe/abi/guc_actions_abi.h           |   20 +
 drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h     |   38 +
 drivers/gpu/drm/xe/abi/guc_capture_abi.h           |    2 +-
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h              |   20 +-
 .../gpu/drm/xe/compat-i915-headers/intel_uncore.h  |   16 +-
 .../{i915_trace.h =3D> intel_uncore_trace.h}         |    0
 drivers/gpu/drm/xe/display/ext/i915_irq.c          |   13 +-
 drivers/gpu/drm/xe/display/intel_bo.c              |   25 +-
 drivers/gpu/drm/xe/display/xe_display.c            |  116 +-
 drivers/gpu/drm/xe/display/xe_display.h            |    2 +
 drivers/gpu/drm/xe/display/xe_fb_pin.c             |   12 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c      |    8 +-
 drivers/gpu/drm/xe/regs/xe_engine_regs.h           |    3 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h               |    2 +
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h            |    3 +
 drivers/gpu/drm/xe/regs/xe_oa_regs.h               |    9 +-
 drivers/gpu/drm/xe/regs/xe_pmt.h                   |   19 +
 drivers/gpu/drm/xe/regs/xe_reg_defs.h              |    2 +-
 drivers/gpu/drm/xe/regs/xe_regs.h                  |    4 +
 drivers/gpu/drm/xe/tests/xe_bo.c                   |   23 +-
 drivers/gpu/drm/xe/tests/xe_live_test_mod.c        |    2 +
 drivers/gpu/drm/xe/tests/xe_migrate.c              |   13 +-
 drivers/gpu/drm/xe/tests/xe_mocs.c                 |    2 +-
 drivers/gpu/drm/xe/xe_assert.h                     |    8 +-
 drivers/gpu/drm/xe/xe_bb.c                         |    2 +-
 drivers/gpu/drm/xe/xe_bo.c                         |  190 ++-
 drivers/gpu/drm/xe/xe_bo.h                         |   33 +-
 drivers/gpu/drm/xe/xe_bo_doc.h                     |    2 +-
 drivers/gpu/drm/xe/xe_bo_evict.c                   |   14 +-
 drivers/gpu/drm/xe/xe_bo_types.h                   |    6 +-
 drivers/gpu/drm/xe/xe_devcoredump.c                |  121 +-
 drivers/gpu/drm/xe/xe_devcoredump.h                |    7 +-
 drivers/gpu/drm/xe/xe_devcoredump_types.h          |   10 +-
 drivers/gpu/drm/xe/xe_device.c                     |   17 +-
 drivers/gpu/drm/xe/xe_device.h                     |    3 +-
 drivers/gpu/drm/xe/xe_device_types.h               |   65 +-
 drivers/gpu/drm/xe/xe_drm_client.c                 |   83 +-
 drivers/gpu/drm/xe/xe_drv.h                        |    1 -
 drivers/gpu/drm/xe/xe_exec.c                       |    2 +-
 drivers/gpu/drm/xe/xe_exec_queue.c                 |   24 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h           |    4 +-
 drivers/gpu/drm/xe/xe_execlist.c                   |   10 +-
 drivers/gpu/drm/xe/xe_ggtt.c                       |   37 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler.h              |   10 +-
 drivers/gpu/drm/xe/xe_gsc_proxy.c                  |   47 +-
 drivers/gpu/drm/xe/xe_gt.c                         |   12 +-
 drivers/gpu/drm/xe/xe_gt.h                         |    2 +-
 drivers/gpu/drm/xe/xe_gt_freq.c                    |   15 +
 drivers/gpu/drm/xe/xe_gt_idle.c                    |   10 +-
 drivers/gpu/drm/xe/xe_gt_mcr.c                     |    8 +-
 drivers/gpu/drm/xe/xe_gt_mcr.h                     |    4 +
 drivers/gpu/drm/xe/xe_gt_pagefault.c               |    1 -
 drivers/gpu/drm/xe/xe_gt_printk.h                  |   31 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c         |   80 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h         |    3 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h   |    2 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c        |    5 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_helpers.h        |    2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c         |   27 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c                |   63 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h                |    2 +
 drivers/gpu/drm/xe/xe_gt_stats.c                   |    4 +-
 drivers/gpu/drm/xe/xe_gt_stats.h                   |    8 +-
 drivers/gpu/drm/xe/xe_gt_stats_types.h             |   15 +
 drivers/gpu/drm/xe/xe_gt_throttle.c                |    2 +
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c        |   29 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h        |    3 +-
 drivers/gpu/drm/xe/xe_gt_types.h                   |    4 +-
 drivers/gpu/drm/xe/xe_guc.c                        |  350 ++++-
 drivers/gpu/drm/xe/xe_guc_ads.c                    |   26 +-
 drivers/gpu/drm/xe/xe_guc_capture.c                |   35 +-
 drivers/gpu/drm/xe/xe_guc_capture.h                |    6 +-
 drivers/gpu/drm/xe/xe_guc_capture_types.h          |    4 +-
 drivers/gpu/drm/xe/xe_guc_ct.c                     |   36 +-
 drivers/gpu/drm/xe/xe_guc_fwif.h                   |    1 +
 drivers/gpu/drm/xe/xe_guc_klv_helpers.c            |    2 +
 drivers/gpu/drm/xe/xe_guc_pc.c                     |   79 +-
 drivers/gpu/drm/xe/xe_guc_pc.h                     |    1 +
 drivers/gpu/drm/xe/xe_guc_pc_types.h               |    2 +
 drivers/gpu/drm/xe/xe_guc_submit.c                 |  153 ++-
 drivers/gpu/drm/xe/xe_guc_types.h                  |   10 +
 drivers/gpu/drm/xe/xe_heci_gsc.c                   |    8 +-
 drivers/gpu/drm/xe/xe_hmm.c                        |    2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c                  |   20 +-
 drivers/gpu/drm/xe/xe_hw_engine.h                  |    4 +-
 drivers/gpu/drm/xe/xe_hw_engine_types.h            |    4 +-
 drivers/gpu/drm/xe/xe_hw_fence_types.h             |    2 +-
 drivers/gpu/drm/xe/xe_irq.c                        |  358 ++++-
 drivers/gpu/drm/xe/xe_irq.h                        |    8 +
 drivers/gpu/drm/xe/xe_lrc.c                        |   53 +-
 drivers/gpu/drm/xe/xe_lrc.h                        |    6 +-
 drivers/gpu/drm/xe/xe_macros.h                     |   12 +-
 drivers/gpu/drm/xe/xe_memirq.c                     |   26 +-
 drivers/gpu/drm/xe/xe_migrate.c                    |    2 +-
 drivers/gpu/drm/xe/xe_module.c                     |    2 +-
 drivers/gpu/drm/xe/xe_oa.c                         |  173 +--
 drivers/gpu/drm/xe/xe_oa_types.h                   |    8 +-
 drivers/gpu/drm/xe/xe_pci.c                        |    4 +-
 drivers/gpu/drm/xe/xe_pcode.c                      |    2 +-
 drivers/gpu/drm/xe/xe_pm.c                         |   13 +-
 drivers/gpu/drm/xe/xe_pt.c                         |    5 +-
 drivers/gpu/drm/xe/xe_query.c                      |    5 +-
 drivers/gpu/drm/xe/xe_reg_sr.c                     |   53 -
 drivers/gpu/drm/xe/xe_reg_whitelist.c              |   37 +
 drivers/gpu/drm/xe/xe_rtp.c                        |    5 +
 drivers/gpu/drm/xe/xe_rtp.h                        |   15 +-
 drivers/gpu/drm/xe/xe_sriov.c                      |    4 +
 drivers/gpu/drm/xe/xe_sriov_pf_helpers.h           |    2 +-
 drivers/gpu/drm/xe/xe_sriov_types.h                |   17 +
 drivers/gpu/drm/xe/xe_sriov_vf.c                   |  263 ++++
 drivers/gpu/drm/xe/xe_sriov_vf.h                   |   14 +
 drivers/gpu/drm/xe/xe_trace.h                      |   11 +-
 drivers/gpu/drm/xe/xe_trace_bo.h                   |   17 +-
 drivers/gpu/drm/xe/xe_trace_lrc.c                  |    9 +
 drivers/gpu/drm/xe/xe_trace_lrc.h                  |   52 +
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c               |   61 +-
 drivers/gpu/drm/xe/xe_uc_fw_types.h                |    2 +-
 drivers/gpu/drm/xe/xe_vm.c                         |   37 +-
 drivers/gpu/drm/xe/xe_vm.h                         |    1 -
 drivers/gpu/drm/xe/xe_vm_doc.h                     |   22 +-
 drivers/gpu/drm/xe/xe_vsec.c                       |  233 ++++
 drivers/gpu/drm/xe/xe_vsec.h                       |   11 +
 drivers/gpu/drm/xe/xe_wa.c                         |    6 +
 drivers/gpu/drm/xe/xe_wa_oob.rules                 |    3 +-
 drivers/gpu/drm/xen/xen_drm_front.c                |    6 -
 drivers/gpu/drm/xlnx/Kconfig                       |    9 +
 drivers/gpu/drm/xlnx/Makefile                      |    1 +
 drivers/gpu/drm/xlnx/zynqmp_disp.c                 |   48 -
 drivers/gpu/drm/xlnx/zynqmp_disp_regs.h            |    7 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c                   |   56 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.h                   |    7 +
 drivers/gpu/drm/xlnx/zynqmp_dp_audio.c             |  447 ++++++
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c                |   39 +-
 drivers/gpu/drm/xlnx/zynqmp_dpsub.h                |   15 +-
 drivers/gpu/drm/xlnx/zynqmp_kms.c                  |    3 +-
 drivers/opp/core.c                                 |   82 +-
 include/drm/bridge/dw_mipi_dsi2.h                  |   95 ++
 include/drm/{ =3D> clients}/drm_client_setup.h       |    0
 include/drm/display/drm_dp_helper.h                |    5 +
 include/drm/display/drm_dp_mst_helper.h            |    3 +-
 include/drm/display/drm_hdmi_audio_helper.h        |   22 +
 include/drm/display/drm_hdmi_state_helper.h        |   10 +
 include/drm/drm_bridge.h                           |   74 +
 include/drm/drm_connector.h                        |  143 +-
 include/drm/drm_drv.h                              |    7 +-
 include/drm/drm_file.h                             |    1 +
 include/drm/drm_gem.h                              |   14 +-
 include/drm/drm_print.h                            |    2 +
 include/drm/drm_utils.h                            |    4 +
 include/drm/intel/pciids.h                         |   58 +-
 include/drm/ttm/ttm_bo.h                           |    2 +
 include/drm/ttm/ttm_resource.h                     |   12 +-
 include/linux/cgroup_dmem.h                        |   66 +
 include/linux/cgroup_subsys.h                      |    4 +
 include/linux/page_counter.h                       |    2 +-
 include/linux/pm_opp.h                             |    7 +
 include/sound/hdmi-codec.h                         |    7 +-
 include/trace/events/amdxdna.h                     |  101 ++
 include/uapi/drm/amdxdna_accel.h                   |  501 +++++++
 include/uapi/drm/msm_drm.h                         |    1 +
 include/uapi/drm/panthor_drm.h                     |    9 +
 include/uapi/drm/qaic_accel.h                      |    2 +-
 include/uapi/drm/v3d_drm.h                         |   18 +
 include/uapi/drm/xe_drm.h                          |   16 +
 init/Kconfig                                       |   11 +
 kernel/cgroup/Makefile                             |    1 +
 kernel/cgroup/dmem.c                               |  857 ++++++++++++
 lib/fonts/Kconfig                                  |    2 +-
 mm/page_counter.c                                  |    4 +-
 sound/soc/codecs/hdmi-codec.c                      |    4 +-
 1195 files changed, 50651 insertions(+), 14924 deletions(-)
 create mode 100644 Documentation/accel/amdxdna/amdnpu.rst
 create mode 100644 Documentation/accel/amdxdna/index.rst
 create mode 100644 Documentation/core-api/cgroup.rst
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sm6150-dpu.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
 create mode 100644
Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-mipi-dsi=
2.yaml
 create mode 100644 Documentation/gpu/drm-compute.rst
 create mode 100644 Documentation/gpu/xe/xe_devcoredump.rst
 create mode 100644 drivers/accel/amdxdna/Kconfig
 create mode 100644 drivers/accel/amdxdna/Makefile
 create mode 100644 drivers/accel/amdxdna/TODO
 create mode 100644 drivers/accel/amdxdna/aie2_ctx.c
 create mode 100644 drivers/accel/amdxdna/aie2_error.c
 create mode 100644 drivers/accel/amdxdna/aie2_message.c
 create mode 100644 drivers/accel/amdxdna/aie2_msg_priv.h
 create mode 100644 drivers/accel/amdxdna/aie2_pci.c
 create mode 100644 drivers/accel/amdxdna/aie2_pci.h
 create mode 100644 drivers/accel/amdxdna/aie2_pm.c
 create mode 100644 drivers/accel/amdxdna/aie2_psp.c
 create mode 100644 drivers/accel/amdxdna/aie2_smu.c
 create mode 100644 drivers/accel/amdxdna/aie2_solver.c
 create mode 100644 drivers/accel/amdxdna/aie2_solver.h
 create mode 100644 drivers/accel/amdxdna/amdxdna_ctx.c
 create mode 100644 drivers/accel/amdxdna/amdxdna_ctx.h
 create mode 100644 drivers/accel/amdxdna/amdxdna_gem.c
 create mode 100644 drivers/accel/amdxdna/amdxdna_gem.h
 create mode 100644 drivers/accel/amdxdna/amdxdna_mailbox.c
 create mode 100644 drivers/accel/amdxdna/amdxdna_mailbox.h
 create mode 100644 drivers/accel/amdxdna/amdxdna_mailbox_helper.c
 create mode 100644 drivers/accel/amdxdna/amdxdna_mailbox_helper.h
 create mode 100644 drivers/accel/amdxdna/amdxdna_pci_drv.c
 create mode 100644 drivers/accel/amdxdna/amdxdna_pci_drv.h
 create mode 100644 drivers/accel/amdxdna/amdxdna_sysfs.c
 create mode 100644 drivers/accel/amdxdna/npu1_regs.c
 create mode 100644 drivers/accel/amdxdna/npu2_regs.c
 create mode 100644 drivers/accel/amdxdna/npu4_regs.c
 create mode 100644 drivers/accel/amdxdna/npu5_regs.c
 create mode 100644 drivers/accel/amdxdna/npu6_regs.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfx_v10_0_cleaner_shader.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfx_v10_3_0_cleaner_shader.a=
sm
 create mode 100644 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/umc_v8_14.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/umc_v8_14.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.h
 create mode 100644 drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx12.asm
 create mode 100644
drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn351_clk_mgr.c
 delete mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/bounding_boxes/dcn3_soc_bb.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_interfaces.=
c
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_legacy.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_legacy.h
 delete mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_optimizatio=
n.c
 delete mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_optimizatio=
n.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c
 rename drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/{dml_top_mca=
che.h
=3D> dml2_top_soc15.h} (59%)
 delete mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml_top_mcache.c
 rename drivers/gpu/drm/amd/include/asic_reg/dcn/{dcn_2_0_3_offset.h
=3D> dcn_2_0_1_offset.h} (99%)
 rename drivers/gpu/drm/amd/include/asic_reg/dcn/{dcn_2_0_3_sh_mask.h
=3D> dcn_2_0_1_sh_mask.h} (99%)
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/umc/umc_8_14_0_off=
set.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/umc/umc_8_14_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/ivsrcid/vcn/irqsrcs_vcn_5_0=
.h
 create mode 100644 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
 create mode 100644 drivers/gpu/drm/clients/Kconfig
 create mode 100644 drivers/gpu/drm/clients/Makefile
 rename include/drm/drm_fbdev_client.h =3D>
drivers/gpu/drm/clients/drm_client_internal.h (62%)
 rename drivers/gpu/drm/{ =3D> clients}/drm_client_setup.c (72%)
 rename drivers/gpu/drm/{ =3D> clients}/drm_fbdev_client.c (98%)
 create mode 100644 drivers/gpu/drm/clients/drm_log.c
 create mode 100644 drivers/gpu/drm/display/drm_hdmi_audio_helper.c
 create mode 100644 drivers/gpu/drm/drm_draw.c
 create mode 100644 drivers/gpu/drm/drm_draw_internal.h
 create mode 100644 drivers/gpu/drm/drm_panel_backlight_quirks.c
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
 create mode 100644 drivers/gpu/drm/i915/display/i9xx_display_sr.c
 create mode 100644 drivers/gpu/drm/i915/display/i9xx_display_sr.h
 create mode 100644 drivers/gpu/drm/i915/display/i9xx_wm_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_crt_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_conversion.c
 delete mode 100644 drivers/gpu/drm/i915/i915_suspend.c
 delete mode 100644 drivers/gpu/drm/i915/i915_suspend.h
 create mode 100644 drivers/gpu/drm/i915/intel_cpu_info.c
 create mode 100644 drivers/gpu/drm/i915/intel_cpu_info.h
 create mode 100644 drivers/gpu/drm/i915/intel_uncore_trace.c
 create mode 100644 drivers/gpu/drm/i915/intel_uncore_trace.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvif/log.h
 create mode 100644 drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c
 rename drivers/gpu/drm/tiny/{cirrus.c =3D> cirrus-qemu.c} (99%)
 rename drivers/gpu/drm/xe/compat-i915-headers/{i915_trace.h =3D>
intel_uncore_trace.h} (100%)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_pmt.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_stats_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf.h
 create mode 100644 drivers/gpu/drm/xe/xe_trace_lrc.c
 create mode 100644 drivers/gpu/drm/xe/xe_trace_lrc.h
 create mode 100644 drivers/gpu/drm/xe/xe_vsec.c
 create mode 100644 drivers/gpu/drm/xe/xe_vsec.h
 create mode 100644 drivers/gpu/drm/xlnx/zynqmp_dp_audio.c
 create mode 100644 include/drm/bridge/dw_mipi_dsi2.h
 rename include/drm/{ =3D> clients}/drm_client_setup.h (100%)
 create mode 100644 include/drm/display/drm_hdmi_audio_helper.h
 create mode 100644 include/linux/cgroup_dmem.h
 create mode 100644 include/trace/events/amdxdna.h
 create mode 100644 include/uapi/drm/amdxdna_accel.h
 create mode 100644 kernel/cgroup/dmem.c
