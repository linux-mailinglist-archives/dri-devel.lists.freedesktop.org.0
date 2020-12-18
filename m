Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5AA2DE79D
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 17:48:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F21EF892E4;
	Fri, 18 Dec 2020 16:48:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B013C892E4
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 16:48:02 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id w5so2881044wrm.11
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 08:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:mime-version
 :content-disposition:content-transfer-encoding;
 bh=bnEQw/aYrr7VNZqvVLf6g/s3MGtwQiwUxlyILhcpr3c=;
 b=fP9mY7r7X+jUcxGGzV80Xk2Oooyg0QVGqIsYdLKSFzC0/MZ9SWuxEQslTntRDMih3L
 +AP2jlMiZ3OXkqrgwPxNimxxDb4b4HlMOFZ1beEUKpYTFQNmDF+syc3RiOmgXIvp/5oF
 TML714tciIwDv6pEtWjIuXoaZKHt+DCkTP1u8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:mime-version:content-disposition
 :content-transfer-encoding;
 bh=bnEQw/aYrr7VNZqvVLf6g/s3MGtwQiwUxlyILhcpr3c=;
 b=jLmyAayISARDj+G0FaTxbteZs5KoL/PQEBW32dI5LxTXG4WXyt1b//wKsNxutdgI/r
 Dw6q85Thn2bHxfkRaO2PViAypDOc0OZObAcG+SM2UVlWq0am1i5Eaoi2E2sNs0zRiD3l
 YpSf2G8dusRIyxY8OFPaq9l4hq+wtpJkI+2CCByErf0Z3tj9gP1wqOPniL4m3hLwdoFO
 vX668h8p7jMI0DmwlCnCEHPeaqW0TKI9Scu6KeFb1fFPFIqfNyomEU02G469aATeTLEU
 Q+yjrnmuYKXWmhKAjzrAuXeWYcvCTbaHRY5yl/k2N2wll9GRzaDIjZnSvgF05S+Dsrd8
 2XGw==
X-Gm-Message-State: AOAM533pv0t7VoZXnws2+9vX8jKnZICyzG1NEvJ0iXgnSRObw+3Mp+PI
 Nwe9/GaSSHxYvrNt/cjWYzkhbA==
X-Google-Smtp-Source: ABdhPJzzowBIJfYzEjswi999hasqC8m6AvbxF3E90aEsN0Wt4tB7TO//uC40oFCE5q39zb5r16jlmA==
X-Received: by 2002:a5d:504b:: with SMTP id h11mr5392472wrt.337.1608310081326; 
 Fri, 18 Dec 2020 08:48:01 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f14sm11882659wme.14.2020.12.18.08.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Dec 2020 08:48:00 -0800 (PST)
Date: Fri, 18 Dec 2020 17:47:53 +0100
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PULL] drm-next, part 2 + fixes
Message-ID: <X9zdOXnqo6hzR5wu@phenom.ffwll.local>
Mail-Followup-To: Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@gmail.com>, Linux MM <linux-mm@kvack.org>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Linux MM <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

Merge window -fixes pull, but bigger: We've somehow missed one subtree
pull (which also contained the amdgpu multihop fix you cherry-pick, oops).
But that pull was pending for almost 3 weeks on the list and most of it
for even longer in linux-next, so really not seeing a reason why it should
be delayed. It contains vma_set_file helper, acked by Andrew and reviewed
by other mm folks, and a few other smaller things. Otherwise this is all
fixes, overview below&in the tag.

Dave's back next week, there's some minor things in-flight, you'll get a
nice Christmas pull before -rc1 I think. I'll be around until Tue next
week still.

Cheers, Daniel

PS: I remembered my pgp passphrase, somewhat shocking :-)

drm-next-2020-12-18:
UAPI Changes:

- Only enable char/agp uapi when CONFIG_DRM_LEGACY is set

Cross-subsystem Changes:

- vma_set_file helper to make vma->vm_file changing less brittle,
  acked by Andrew

Core Changes:

- dma-buf heaps improvements
- pass full atomic modeset state to driver callbacks
- shmem helpers: cached bo by default
- cleanups for fbdev, fb-helpers
- better docs for drm modes and SCALING_FITLER uapi
- ttm: fix dma32 page pool regression

Driver Changes:

- multi-hop regression fixes for amdgpu, radeon, nouveau
- lots of small amdgpu hw enabling fixes (display, pm, ...)
- fixes for imx, mcde, meson, some panels, virtio, qxl, i915, all
  fairly minor
- some cleanups for legacy drm/fbdev drivers

Cheers, Daniel

The following changes since commit 1d36dffa5d887715dacca0f717f4519b7be5e498:

  Merge tag 'drm-next-2020-12-11' of git://anongit.freedesktop.org/drm/drm =
(2020-12-14 11:07:56 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-next-2020-12-18

for you to fetch changes up to 4efd7faba5e0687ae9143b7e6a19547ede20a7dd:

  Merge tag 'drm-intel-next-fixes-2020-12-18' of git://anongit.freedesktop.=
org/drm/drm-intel into drm-next (2020-12-18 16:22:10 +0100)

----------------------------------------------------------------
UAPI Changes:

- Only enable char/agp uapi when CONFIG_DRM_LEGACY is set

Cross-subsystem Changes:

- vma_set_file helper to make vma->vm_file changing less brittle,
  acked by Andrew

Core Changes:

- dma-buf heaps improvements
- pass full atomic modeset state to driver callbacks
- shmem helpers: cached bo by default
- cleanups for fbdev, fb-helpers
- better docs for drm modes and SCALING_FITLER uapi
- ttm: fix dma32 page pool regression

Driver Changes:

- multi-hop regression fixes for amdgpu, radeon, nouveau
- lots of small amdgpu hw enabling fixes (display, pm, ...)
- fixes for imx, mcde, meson, some panels, virtio, qxl, i915, all
  fairly minor
- some cleanups for legacy drm/fbdev drivers

----------------------------------------------------------------
Aditya Swarup (1):
      drm/i915/tgl: Fix REVID macros for TGL to fetch correct stepping

Alex Deucher (10):
      drm/amdgpu/display: move link_bandwidth_kbps under CONFIG_DRM_AMD_DC_=
DCN
      drm/amdgpu: split BOCO and ATPX handling
      drm/amdgpu: add check for ACPI power resources
      drm/amdgpu: update amdgpu_device_supports_boco()
      drm/amdgpu: support runtime pm for GPUs that support BOCO
      drm/amdgpu: no need to call pci_ignore_hotplug for _PR3
      drm/amdgpu: simplify logic in atpx resume handling
      drm/amdgpu: print what method we are using for runtime pm
      drm/amdgpu: fix regression in vbios reservation handling on headless
      drm/amdgpu/disply: fix documentation warnings in display manager

Anthoine Bourgeois (3):
      drm/virtio: suffix create blob call with _ioctl like any ioctl
      drm/virtio: fix a file name comment reference
      virtio-gpu api: Add a comment on VIRTIO_GPU_SHM_ID_HOST_VISIBLE

Anthony Koo (1):
      drm/amd/display: [FW Promotion] Release 0.0.46

Aric Cyr (4):
      drm/amd/display: HP Reverb G2 VR fails to light up
      drm/amd/display: Only update FP2 for full updates
      drm/amd/display: Fix cleanup typo in MPCC visual confirm
      drm/amd/display: 3.2.116

Bernard Zhao (1):
      drm/via: fix assignment in if condition

Chris Wilson (2):
      Revert "drm/i915: re-order if/else ladder for hpd_irq_setup"
      drm/i915: Fix mismatch between misplaced vma check and vma insert

Christian K=F6nig (7):
      drm/amdgpu: fix check order in amdgpu_bo_move
      mm: mmap: fix fput in error path v2
      mm: introduce vma_set_file function v5
      drm/ttm: fix DMA32 handling in the global page pool
      drm/amdgpu: limit the amdgpu_vm_update_ptes trace point
      drm/radeon: fix check order in radeon_bo_move
      drm/qxl: don't allocate a dma_address array

Colin Ian King (2):
      drm/mcde: fix masking and bitwise-or on variable val
      drm/amdgpu: Fix spelling mistake "Heterogenous" -> "Heterogeneous"

Daniel Vetter (6):
      char/agp: Disable frontend without CONFIG_DRM_LEGACY
      Merge tag 'drm-misc-next-2020-11-27-1' of git://anongit.freedesktop.o=
rg/drm/drm-misc into drm-next
      dma-buf: Fix kerneldoc formatting
      Merge tag 'drm-misc-next-fixes-2020-12-15' of git://anongit.freedeskt=
op.org/drm/drm-misc into drm-next
      Merge tag 'amd-drm-fixes-5.11-2020-12-16' of git://people.freedesktop=
.org/~agd5f/linux into drm-next
      Merge tag 'drm-intel-next-fixes-2020-12-18' of git://anongit.freedesk=
top.org/drm/drm-intel into drm-next

Dave Airlie (1):
      drm/nouveau: fix multihop when move doesn't work.

Eric Bernstein (1):
      drm/amd/display: add dcn30_link_encoder_validate_output_with_stream t=
o header

Evan Quan (12):
      drm/amd/pm: support power source switch on Sienna Cichlid
      drm/amd/pm: correct power limit setting for SMU V11
      drm/amd/pm: correct the gpo control for sienna cichlid
      drm/amd/pm: expose the firmware_capability from firmware_info table
      drm/amdgpu: new macro for determining 2ND_USB20PORT support
      drm/amd/pm: new SMC message for 2nd usb2.0 port workaround
      drm/amd/pm: fulfill sienna cichlid 2nd usb2.0 port workaround
      drm/amd/pm: typo fix (CUSTOM -> COMPUTE)
      drm/amd/pm: fulfill the sienna cichlid UMD PSTATE profiling clocks
      drm/amd/pm: correct the data structure for activity monitor coeff exc=
hange
      drm/amd/pm: update the data strucutre for SMU metrics exchange
      drm/amd/pm: add deep sleep control for uclk and fclk

Felipe (1):
      drm/amd/display: Fix OGAM LUT calculation precision

Flora Cui (1):
      drm/amd/display: drop retired CONFIG_DRM_AMD_DC_DCN3_0

Guido G=FCnther (1):
      drm: mxsfb: Silence -EPROBE_DEFER while waiting for bridge

Gurchetan Singh (2):
      drm/virtio: use fence_id when processing fences
      drm/virtio: rename sync_seq and last_seq

Gustavo A. R. Silva (4):
      drm: Fix fall-through warnings for Clang
      drm/via: Fix fall-through warnings for Clang
      video: fbdev: lxfb_ops: Fix fall-through warnings for Clang
      video: fbdev: pm2fb: Fix fall-through warnings for Clang

Jake Wang (1):
      drm/amd/display: updated wm table for Renoir

Jiange Zhao (1):
      drm/amdgpu/SRIOV: Extend VF reset request wait period

Jiansong Chen (1):
      drm/amdkfd: correct pipe offset calculation

John Stultz (5):
      dma-buf: system_heap: Rework system heap to use sgtables instead of p=
agelists
      dma-buf: heaps: Move heap-helper logic into the cma_heap implementati=
on
      dma-buf: heaps: Remove heap-helpers code
      dma-buf: heaps: Skip sync if not mapped
      dma-buf: system_heap: Allocate higher order pages if available

Laurentiu Palcu (3):
      drm/imx/dcss: fix rotations for Vivante tiled formats
      drm/imx/dcss: fix coccinelle warning
      drm/imx/dcss: allow using nearest neighbor interpolation scaling

Leo (Hanghong) Ma (1):
      drm/amd/display: Add DP info frame update for dcn30

Likun Gao (1):
      drm/amdgpu: add judgement for suspend/resume sequence

Linus Walleij (7):
      drm/panel: s6e63m0: Fix and extend MCS table
      drm/panel: s6e63m0: Implement 28 backlight levels
      drm/panel: s6e63m0: Fix init sequence
      drm/mcde: Fix RGB/BGR bug
      drm/mcde: Break out DSI set-up routine
      drm/mcde: Support DPI output
      drm/mcde: Fix uninitialized value

Lionel Landwerlin (1):
      drm/i915/perf: also include Gen11 in OATAILPTR workaround

Luben Tuikov (1):
      drm/amdgpu: Fix missing prototype warning

Lukas F. Hartmann (2):
      dt-bindings: display/panel: add Innolux N125HCE-GN1
      panel-simple: add Innolux N125HCE-GN1

Maarten Lankhorst (1):
      dma-buf/dma-resv: Respect num_fences when initializing the shared fen=
ce list.

Marc Zyngier (2):
      drm/meson: dw-hdmi: Disable clocks on driver teardown
      drm/meson: dw-hdmi: Enable the iahb clock early enough

Martin Leung (1):
      drm/amd/display: delay fp2 programming until vactive before lock

Max Tseng (1):
      drm/amd/display: Add missing DP_SEC register definitions and masks

Maxime Ripard (1):
      drm: Pass the full state to connectors atomic functions

Rodrigo Siqueira (2):
      drm/amd/display: Drop unnecessary function call
      drm/amd/display: Add get_dig_frontend implementation for DCEx

Simon Ser (4):
      drm: improve kernel-docs in drm_mode.h
      drm: document drm_mode_get_connector
      drm: document drm_mode_modeinfo
      drm: fix kernel-doc warnings for SCALING_FILTER

Souptick Joarder (2):
      drm/amd/display: Fixed kernel test robot warning
      drm/amd/display: Adding prototype for dccg21_update_dpp_dto()

Stanley.Yang (1):
      drm/amdgpu: skip load smu and sdma microcode on sriov for SIENNA_CICH=
LID

Tao Zhou (2):
      drm/amdgpu: set mode1 reset as default for dimgrey_cavefish
      drm/amdgpu: print mmhub client name for dimgrey_cavefish

Thomas Zimmermann (12):
      drm/shmem-helper: Use cached mappings by default
      drm/shmem-helper: Removed drm_gem_shmem_create_object_cached()
      drm/fb-helper: Call dirty helper after writing to fbdev
      drm/fb-helper: Unmap client buffer during shutdown
      drm/client: Depend on GEM object kmap ref-counting
      drm/fb-helper: Rename dirty worker to damage worker
      drm/fb-helper: Return early in damage worker
      drm/fb-helper: Separate shadow-buffer flushing and calling dirty call=
back
      drm/fb-helper: Move damage blit code and its setup into separate rout=
ine
      drm/fb-helper: Restore damage area upon errors
      drm/fb-helper: Copy dma-buf map before flushing shadow fb
      drm/fb-helper: Acquire modeset lock around shadow-buffer flushing

Tom Rix (2):
      drm/amdgpu: remove h from printk format specifier
      drm/radeon: remove h from printk format specifier

Victor Lu (1):
      drm/amd/display: Change pstate expected timeout warning to 180us on l=
inux

Wayne Lin (1):
      drm/amd/display: Fix to be able to stop crc calculation

Xiaomeng Hou (3):
      drm/amd/pm: update the smu v11.5 smc header for vangogh
      drm/amd/pm: inform SMU RLC status thus enable/disable DPM feature for=
 vangogh
      drm/amdgpu/sdma5.2: soft reset sdma blocks before setup and start sdma

Yifan Zhang (1):
      drm/amdkfd: correct amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu log.

 .../bindings/display/panel/panel-simple.yaml       |   2 +
 Documentation/driver-api/dma-buf.rst               |   2 +-
 drivers/char/agp/Makefile                          |   6 +-
 drivers/char/agp/agp.h                             |   5 +
 drivers/dma-buf/dma-buf.c                          |  19 +-
 drivers/dma-buf/dma-resv.c                         |   2 +-
 drivers/dma-buf/heaps/Makefile                     |   1 -
 drivers/dma-buf/heaps/cma_heap.c                   | 329 ++++++++++++---
 drivers/dma-buf/heaps/heap-helpers.c               | 274 -------------
 drivers/dma-buf/heaps/heap-helpers.h               |  53 ---
 drivers/dma-buf/heaps/system_heap.c                | 414 ++++++++++++++++-=
--
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  43 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  25 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |  17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h          |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  53 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |   4 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c            |   1 +
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c              |  11 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.h              |   3 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |  11 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.h              |   1 +
 drivers/gpu/drm/amd/amdgpu/nv.c                    |   1 +
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |  42 +-
 drivers/gpu/drm/amd/amdkfd/Kconfig                 |   2 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |   4 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  29 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |  21 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c  |  13 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |   5 +-
 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  |  12 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  20 +
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |   3 -
 drivers/gpu/drm/amd/display/dc/dc.h                |   2 +-
 .../gpu/drm/amd/display/dc/dce/dce_link_encoder.c  |  44 +-
 .../gpu/drm/amd/display/dc/dce/dce_link_encoder.h  |   2 +
 .../display/dc/dce120/dce120_timing_generator.c    |   2 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.c    |   6 +-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |   2 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c  |  15 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.h  |   2 +-
 .../amd/display/dc/dcn10/dcn10_stream_encoder.h    |   6 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |  29 +-
 .../amd/display/dc/dcn20/dcn20_stream_encoder.h    |   2 +
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_dccg.h  |   1 +
 .../amd/display/dc/dcn30/dcn30_dio_link_encoder.c  |   2 +-
 .../amd/display/dc/dcn30/dcn30_dio_link_encoder.h  |   4 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |   2 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c  |   2 +-
 .../drm/amd/display/dc/inc/hw/timing_generator.h   |   2 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  62 +--
 .../drm/amd/display/modules/color/color_gamma.c    |  22 +-
 drivers/gpu/drm/amd/include/atomfirmware.h         |   1 +
 drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h            |   1 +
 drivers/gpu/drm/amd/pm/inc/smu_types.h             |   4 +-
 drivers/gpu/drm/amd/pm/inc/smu_v11_0_7_ppsmc.h     |   6 +-
 drivers/gpu/drm/amd/pm/inc/smu_v11_5_ppsmc.h       |   2 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  10 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    | 287 ++++++++-----
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.h    |   4 +
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |  46 ++-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |   9 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.h   |   4 +
 drivers/gpu/drm/drm_atomic_helper.c                |   8 +-
 drivers/gpu/drm/drm_blend.c                        |   2 +-
 drivers/gpu/drm/drm_bufs.c                         |   1 +
 drivers/gpu/drm/drm_client.c                       |   4 -
 drivers/gpu/drm/drm_crtc.c                         |  12 +-
 drivers/gpu/drm/drm_fb_helper.c                    | 155 ++++---
 drivers/gpu/drm/drm_gem_shmem_helper.c             |  40 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem.c              |   4 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |   7 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c         |   3 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c           |   5 +-
 drivers/gpu/drm/i915/i915_drv.h                    |  12 +-
 drivers/gpu/drm/i915/i915_irq.c                    |  27 +-
 drivers/gpu/drm/i915/i915_perf.c                   |   2 +-
 drivers/gpu/drm/imx/dcss/dcss-dev.h                |   3 +
 drivers/gpu/drm/imx/dcss/dcss-plane.c              |  24 +-
 drivers/gpu/drm/imx/dcss/dcss-scaler.c             |  47 ++-
 drivers/gpu/drm/lima/lima_gem.c                    |   2 +-
 drivers/gpu/drm/mcde/Kconfig                       |   1 +
 drivers/gpu/drm/mcde/Makefile                      |   2 +-
 drivers/gpu/drm/mcde/mcde_clk_div.c                | 192 +++++++++
 drivers/gpu/drm/mcde/mcde_display.c                | 456 ++++++++++++++++-=
----
 drivers/gpu/drm/mcde/mcde_display_regs.h           |  91 +++-
 drivers/gpu/drm/mcde/mcde_drm.h                    |  10 +
 drivers/gpu/drm/mcde/mcde_drv.c                    |  46 ++-
 drivers/gpu/drm/meson/meson_dw_hdmi.c              |  51 ++-
 drivers/gpu/drm/mgag200/mgag200_drv.c              |   1 -
 drivers/gpu/drm/msm/msm_gem.c                      |   4 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c                  |  10 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |   5 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c               |  31 +-
 drivers/gpu/drm/omapdrm/omap_gem.c                 |   3 +-
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.c      | 345 ++++++++++++----
 drivers/gpu/drm/panel/panel-simple.c               |  28 ++
 drivers/gpu/drm/panfrost/panfrost_gem.c            |   2 +-
 drivers/gpu/drm/qxl/qxl_ttm.c                      |   2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c                |  54 ++-
 drivers/gpu/drm/radeon/radeon_uvd.c                |   2 +-
 drivers/gpu/drm/radeon/radeon_vce.c                |   2 +-
 drivers/gpu/drm/ttm/ttm_pool.c                     |  22 +
 drivers/gpu/drm/udl/udl_drv.c                      |   2 -
 drivers/gpu/drm/v3d/v3d_bo.c                       |   2 +-
 drivers/gpu/drm/vc4/vc4_txp.c                      |   4 +-
 drivers/gpu/drm/vgem/vgem_drv.c                    |   3 +-
 drivers/gpu/drm/via/via_irq.c                      |   1 +
 drivers/gpu/drm/via/via_verifier.c                 |   7 +-
 drivers/gpu/drm/virtio/virtgpu_debugfs.c           |   4 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h               |   8 +-
 drivers/gpu/drm/virtio/virtgpu_fence.c             |  13 +-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c             |   7 +-
 drivers/gpu/drm/virtio/virtgpu_object.c            |   1 -
 drivers/gpu/drm/vkms/vkms_drv.c                    |   1 -
 drivers/gpu/drm/vkms/vkms_writeback.c              |   7 +-
 drivers/staging/android/ashmem.c                   |   6 +-
 drivers/video/fbdev/geode/lxfb_ops.c               |   1 +
 drivers/video/fbdev/pm2fb.c                        |   1 +
 include/drm/drm_fb_helper.h                        |  14 +-
 include/drm/drm_gem_shmem_helper.h                 |   7 +-
 include/drm/drm_modes.h                            |   3 +
 include/drm/drm_modeset_helper_vtables.h           |  13 +-
 include/linux/dma-buf-map.h                        |   2 +-
 include/linux/mm.h                                 |   2 +
 include/uapi/drm/drm_mode.h                        | 165 ++++++--
 include/uapi/linux/virtio_gpu.h                    |   4 +
 mm/mmap.c                                          |   2 +-
 mm/util.c                                          |  12 +
 136 files changed, 2806 insertions(+), 1255 deletions(-)
 delete mode 100644 drivers/dma-buf/heaps/heap-helpers.c
 delete mode 100644 drivers/dma-buf/heaps/heap-helpers.h
 create mode 100644 drivers/gpu/drm/mcde/mcde_clk_div.c

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
