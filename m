Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6389FA851D2
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 04:59:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B5910EAA2;
	Fri, 11 Apr 2025 02:59:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ngSJG4th";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EAC310EAA2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 02:59:09 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-ac2aeada833so290036866b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 19:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744340347; x=1744945147; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nZ0UXX5rmwhU8MmPlx7qZ8dxJyAZJmnso6STaMXzld0=;
 b=ngSJG4thEvJtkBCKVzCcMiRwuvqHchEj7grbcJkyP7vPua8eedxi/TR5aO6oiaHS8n
 KlnD3g0poiSXQMryUgNrpyB1pJ39R6NZzsxS6ZS4Di2+BlLGBNYkAFweMhvBuHOuIem/
 LmRiZX5UopRHrxUi+UirnalbXUGqk7hcXuDV7pokeCm8RAFQ6/Ti2/N6qQ1x3VXbHnZL
 wFRtOgwWj5TST+kLnneev39ZIUD4nYz5YdxBBJItWPcRaxO4Ltl5f62bxV2aSPbsGw1x
 QHJIhGpDbX9LY7ETPUuEOgVSkpRyt4yRhGFzbRZMhUzOapboUIyT7m3hO2WAdb4S9I30
 CWKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744340347; x=1744945147;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nZ0UXX5rmwhU8MmPlx7qZ8dxJyAZJmnso6STaMXzld0=;
 b=C4e0eZU0SnP2pMrG4mx2J/0uYUtS2gQYNtPgL7b6ceYZ1v07xZg17++806WKKADIjo
 K1pVP6/Tip6LkmlV7+cmm3VscTDQLnulb7vtrkfBlZYq5r4/ILSYRELcNiz5lRPerlTW
 Mq8Ev1RH/aKKW4UKw+l90l3M1CVLIRwwy+9zR1NKQgX9G7SRtjUXJGAMCgYdo3BhFQRL
 /xF4FqAYn6UFOJ2YSctF0YRqU3wGqLiPrnTvo4ss95O8B+Cpn7v39W68hrTKxgCbrMPR
 KQ81atDhNz9c8QuqW/3CHpLN6uaJu+ZptC1KcZp4crUYeYWEqBOR1hmDZX9G1fRbmwJk
 u/NA==
X-Gm-Message-State: AOJu0YxrHUNgve4GIy+FDGJluSMESBHnfFZcCuxY5iuKVzhuSs+whCHI
 vaTT+MGMLhXmSjDe+knJsB/qUnp9OXOQoZkl2X6VBdWNGdaAFiDieffGoorKTYKhyw37PlHqmqk
 c0PRll1464P6hgK7HOuG60kg38EE=
X-Gm-Gg: ASbGncvLzXt0FhgxmQQ/Xf/BpNO3PUBBPJ56sCug6o+3ZS2pZ0jSZmD+MriwzUXrApF
 mzT0xSlWBjYSMLkwb1dLERJ0OaEBeQJmm7qWkbOjQAqDoe5R0KELtJdeuihQpEkKM3rf3zVlc84
 tMUwWYAQ3xJfgLjphec0XdEudSasNiFSw=
X-Google-Smtp-Source: AGHT+IH3L9zdTZh2es/SHzw7ZXSbYmp/lP24phPG8997KCq537YomgMJstwXSvqwZnUWdZZzDvKIgHvmOdYjHCDIWXA=
X-Received: by 2002:a17:907:da16:b0:ac7:81b0:62c9 with SMTP id
 a640c23a62f3a-acad17d0392mr100784866b.20.1744340347029; Thu, 10 Apr 2025
 19:59:07 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 11 Apr 2025 12:58:55 +1000
X-Gm-Features: ATxdqUEJbBw5XfOBdOkrPRMx_nMZ8FqgFObT-5QGaNFz9fyWqIw_ERJWeGXyzjE
Message-ID: <CAPM=9tzvTUFpUeme8Aom4734ycaAK1b1gJFnjH3hHmg756UMGg@mail.gmail.com>
Subject: [git pull] drm fixes for 6.15-rc2
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

Weekly fixes, as expected it has a bit more in it than probably usual
for rc2. amdgpu/xe/i915 lead the way with fixes all over for a bunch
of other drivers. Nothing major stands out from what I can see.

Regards,
Dave.

drm-fixes-2025-04-11-1:
drm fixes for 6.15-rc2

tests:
- Clean up struct drm_display_mode in various places

i915:
- Fix scanline offset for LNL+ and BMG+
- Fix GVT unterminated-string-initialization build warning
- Fix DP rate limit when sink doesn't support TPS4
- Handle GDDR + ECC memory type detection
- Fix VRR parameter change check
- Fix fence not released on early probe errors
- Disable render power gating during live selftests

xe:
- Add another BMG PCI ID
- Fix UAFs on migration paths
- Fix shift-out-of-bounds access on TLB invalidation
- Ensure ccs_mode is correctly set on gt reset
- Extend some HW workarounds to Xe3
- Fix PM runtime get/put on sysfs files
- Fix u64 division on 32b
- Fix flickering due to missing L3 invalidations
- Fix missing error code return

amdgpu:
- MES FW version caching fixes
- Only use GTT as a fallback if we already have a backing store
- dma_buf fix
- IP discovery fix
- Replay and PSR with VRR fix
- DC FP fixes
- eDP fixes
- KIQ TLB invalidate fix
- Enable dmem groups support
- Allow pinning VRAM dma bufs if imports can do P2P
- Workload profile fixes
- Prevent possible division by 0 in fan handling

amdkfd:
- Queue reset fixes

imagination:
- Fix overflow
- Fix use-after-free

ivpu:
- Fix suspend/resume

nouveau:
- Do not deref dangling pointer

rockchip:
- Set DP/HDMI registers correctly

udmabuf:
- Fix overflow

virtgpu:
- Set reservation lock on dma-buf import
- Fix error handling in prepare_fb
The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8=
:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-04-11-1

for you to fetch changes up to 485442c6a523de1d293350e039a9d9df9c08704c:

  Merge tag 'drm-xe-fixes-2025-04-10' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
(2025-04-11 09:11:08 +1000)

----------------------------------------------------------------
drm fixes for 6.15-rc2

tests:
- Clean up struct drm_display_mode in various places

i915:
- Fix scanline offset for LNL+ and BMG+
- Fix GVT unterminated-string-initialization build warning
- Fix DP rate limit when sink doesn't support TPS4
- Handle GDDR + ECC memory type detection
- Fix VRR parameter change check
- Fix fence not released on early probe errors
- Disable render power gating during live selftests

xe:
- Add another BMG PCI ID
- Fix UAFs on migration paths
- Fix shift-out-of-bounds access on TLB invalidation
- Ensure ccs_mode is correctly set on gt reset
- Extend some HW workarounds to Xe3
- Fix PM runtime get/put on sysfs files
- Fix u64 division on 32b
- Fix flickering due to missing L3 invalidations
- Fix missing error code return

amdgpu:
- MES FW version caching fixes
- Only use GTT as a fallback if we already have a backing store
- dma_buf fix
- IP discovery fix
- Replay and PSR with VRR fix
- DC FP fixes
- eDP fixes
- KIQ TLB invalidate fix
- Enable dmem groups support
- Allow pinning VRAM dma bufs if imports can do P2P
- Workload profile fixes
- Prevent possible division by 0 in fan handling

amdkfd:
- Queue reset fixes

imagination:
- Fix overflow
- Fix use-after-free

ivpu:
- Fix suspend/resume

nouveau:
- Do not deref dangling pointer

rockchip:
- Set DP/HDMI registers correctly

udmabuf:
- Fix overflow

virtgpu:
- Set reservation lock on dma-buf import
- Fix error handling in prepare_fb

----------------------------------------------------------------
Alex Deucher (5):
      drm/amdgpu/mes11: optimize MES pipe FW version fetching
      drm/amdgpu/pm: add workload profile pause helper
      drm/amdgpu/pm/swsmu: implement pause workload profile
      drm/amdgpu: cancel gfx idle work in device suspend for s0ix
      drm/amdgpu/mes12: optimize MES pipe FW version fetching

Andy Yan (2):
      drm/rockchip: vop2: Fix interface enable/mux setting of DP1 on rk3588
      drm/rockchip: dw_hdmi_qp: Fix io init for dw_hdmi_qp_rockchip_resume

Ankit Nautiyal (1):
      drm/i915/vrr: Add vrr.vsync_{start, end} in vrr_params_changed

Arnd Bergmann (1):
      drm/xe: avoid plain 64-bit division

Badal Nilawar (1):
      drm/i915: Disable RPG during live selftest

Brendan King (2):
      drm/imagination: take paired job reference
      drm/imagination: fix firmware memory leaks

Chris Bainbridge (1):
      drm/nouveau: prime: fix ttm_bo_delayed_delete oops

Christian K=C3=B6nig (2):
      drm/amdgpu: immediately use GTT for new allocations
      drm/amdgpu: allow pinning DMA-bufs into VRAM if all importers can do =
P2P

Dave Airlie (4):
      Merge tag 'drm-intel-fixes-2025-04-09' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'amd-drm-fixes-6.15-2025-04-09' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2025-04-10' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2025-04-10' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes

Denis Arefev (1):
      drm/amd/pm/smu11: Prevent division by zero

Dmitry Osipenko (2):
      drm/virtio: Don't attach GEM to a non-created context in gem_object_o=
pen()
      drm/virtio: Fix missed dmabuf unpinning in error path of prepare_fb()

Emily Deng (1):
      drm/amdkfd: sriov doesn't support per queue reset

Flora Cui (1):
      drm/amdgpu/ip_discovery: add missing ip_discovery fw

Huacai Chen (3):
      drm/amd/display: Protect FPU in dml21_copy()
      drm/amd/display: Protect FPU in dml2_init()/dml21_init()
      drm/amd/display: Protect FPU in dml2_validate()/dml21_validate()

Jacek Lawrynowicz (3):
      accel/ivpu: Fix warning in ivpu_ipc_send_receive_internal()
      accel/ivpu: Fix deadlock in ivpu_ms_cleanup()
      accel/ivpu: Fix PM related deadlocks in MS IOCTLs

Jani Nikula (1):
      drm/i915/gvt: fix unterminated-string-initialization warning

Janusz Krzysztofik (1):
      drm/i915/huc: Fix fence not released on early probe errors

Jay Cornwall (1):
      drm/amdgpu: Increase KIQ invalidate_tlbs timeout

Jonathan Kim (1):
      drm/amdkfd: limit sdma queue reset caps flagging for gfx9

Julia Filipchuk (1):
      drm/xe/xe3lpg: Apply Wa_14022293748, Wa_22019794406

Kenneth Feng (1):
      drm/amd/display: pause the workload setting in dm

Kenneth Graunke (1):
      drm/xe: Invalidate L3 read-only cachelines for geometry streams too

Maarten Lankhorst (1):
      drm/amdgpu: Add cgroups implementation

Mario Limonciello (2):
      drm/amd/display: Add HP Probook 445 and 465 to the quirk list
for eDP on DP1
      drm/amd/display: Add HP Elitebook 645 to the quirk list for eDP on DP=
1

Matt Roper (1):
      drm/xe/bmg: Add one additional PCI ID

Matthew Auld (1):
      drm/amdgpu/dma_buf: fix page_link check

Matthew Brost (1):
      drm/xe: Use local fence in error path of xe_migrate_clear

Maxime Ripard (7):
      drm/tests: helpers: Create kunit helper to destroy a drm_display_mode
      drm/tests: modeset: Fix drm_display_mode memory leak
      drm/tests: modeset: Fix drm_display_mode memory leak
      drm/tests: cmdline: Fix drm_display_mode memory leak
      drm/tests: modes: Fix drm_display_mode memory leak
      drm/tests: modes: Fix drm_display_mode memory leak
      drm/tests: probe-helper: Fix drm_display_mode memory leak

Niranjana Vishwanathapura (1):
      drm/xe: Ensure fixed_slice_mode gets set after ccs_mode change

Rodrigo Vivi (1):
      drm/xe: Restore EIO errno return when GuC PC start fails

Rolf Eike Beer (1):
      drm/sti: remove duplicate object names

Tejas Upadhyay (1):
      drm/xe/hw_engine: define sysfs_ops on all directories

Thomas Hellstr=C3=B6m (2):
      drm/xe/svm: Fix a potential bo UAF
      drm/xe: Fix an out-of-bounds shift when invalidating TLB

Thomas Zimmermann (1):
      Merge drm/drm-fixes into drm-misc-fixes

Tom Chung (1):
      drm/amd/display: Do not enable Replay and PSR while VRR is on in
amdgpu_dm_commit_planes()

Ville Syrj=C3=A4l=C3=A4 (2):
      drm/i915: Fix scanline_offset for LNL+ and BMG+
      drm/i915/dp: Reject HBR3 when sink doesn't support TPS4

Vivek Kasireddy (2):
      drm/virtio: Fix flickering issue seen with imported dmabufs
      drm/i915/xe2hpd: Identify the memory type for SKUs with GDDR + ECC

Xiaogang Chen (1):
      udmabuf: fix a buf size overflow issue during udmabuf creation

 drivers/accel/ivpu/ivpu_debugfs.c                  |   4 +-
 drivers/accel/ivpu/ivpu_ipc.c                      |   3 +-
 drivers/accel/ivpu/ivpu_ms.c                       |  24 +++++
 drivers/dma-buf/udmabuf.c                          |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   7 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |  27 ++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |  19 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |   4 +
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |   4 +
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |  21 ++--
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |   9 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  21 ++++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |  17 +++-
 .../drm/amd/display/dc/dml2/dml21/dml21_wrapper.c  |  17 +++-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c |   9 ++
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |   1 +
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |  19 ++++
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |   2 +
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  36 ++++++-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |   1 +
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |   2 +-
 drivers/gpu/drm/i915/display/intel_bw.c            |  14 ++-
 drivers/gpu/drm/i915/display/intel_display.c       |   4 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |  51 ++++++++--
 drivers/gpu/drm/i915/display/intel_vblank.c        |   4 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c                |  19 +---
 drivers/gpu/drm/i915/gt/uc/intel_huc.c             |  11 +--
 drivers/gpu/drm/i915/gt/uc/intel_huc.h             |   1 +
 drivers/gpu/drm/i915/gt/uc/intel_uc.c              |   1 +
 drivers/gpu/drm/i915/gvt/opregion.c                |   7 +-
 drivers/gpu/drm/i915/i915_drv.h                    |   1 +
 drivers/gpu/drm/i915/selftests/i915_selftest.c     |  18 ++++
 drivers/gpu/drm/i915/soc/intel_dram.c              |   4 +
 drivers/gpu/drm/imagination/pvr_fw.c               |  27 ++++--
 drivers/gpu/drm/imagination/pvr_job.c              |   7 ++
 drivers/gpu/drm/imagination/pvr_queue.c            |   4 +
 drivers/gpu/drm/nouveau/nouveau_bo.c               |   3 +
 drivers/gpu/drm/nouveau/nouveau_gem.c              |   3 -
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c     |  23 +----
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c       |   6 +-
 drivers/gpu/drm/sti/Makefile                       |   2 -
 drivers/gpu/drm/tests/drm_client_modeset_test.c    |   9 +-
 drivers/gpu/drm/tests/drm_cmdline_parser_test.c    |  10 +-
 drivers/gpu/drm/tests/drm_kunit_helpers.c          |  22 +++++
 drivers/gpu/drm/tests/drm_modes_test.c             |  26 +++++
 drivers/gpu/drm/tests/drm_probe_helper_test.c      |   8 +-
 drivers/gpu/drm/virtio/virtgpu_gem.c               |  11 ++-
 drivers/gpu/drm/virtio/virtgpu_plane.c             |  20 ++--
 drivers/gpu/drm/virtio/virtgpu_prime.c             |   1 +
 drivers/gpu/drm/xe/instructions/xe_gpu_commands.h  |   1 +
 drivers/gpu/drm/xe/xe_device_types.h               |   1 +
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c        |  12 ++-
 drivers/gpu/drm/xe/xe_guc_pc.c                     |   1 +
 drivers/gpu/drm/xe/xe_hw_engine.c                  |  12 +--
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c      | 108 ++++++++++-------=
----
 drivers/gpu/drm/xe/xe_migrate.c                    |   6 +-
 drivers/gpu/drm/xe/xe_ring_ops.c                   |  13 ++-
 drivers/gpu/drm/xe/xe_svm.c                        |   7 +-
 drivers/gpu/drm/xe/xe_wa_oob.rules                 |   2 +
 include/drm/drm_kunit_helpers.h                    |   3 +
 include/drm/intel/pciids.h                         |   1 +
 64 files changed, 543 insertions(+), 197 deletions(-)
