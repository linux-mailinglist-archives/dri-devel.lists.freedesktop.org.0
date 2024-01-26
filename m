Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A5C83E20C
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 19:58:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7065610FD8B;
	Fri, 26 Jan 2024 18:57:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24A7810FD7C
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 18:57:43 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a277339dcf4so64768466b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 10:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706295399; x=1706900199; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Gti1+B8tGjXlteOQj/tt8iuBvT2SWcmifU1EIzDFjfQ=;
 b=nJ12WokJ2oL5LlKI5BJQElD97WhPWX2Qy+4yVU+yLj8EshtCGkS9f8Q6VpxfjL59t1
 d9p6sA3viuTVbdq/ONoq+TwxmA4TQeYgttvl6SEwGZRC7nRqRxuOzIFesBn0ONnxaXLS
 1g7BCPsqjq4J9OtN6+0NfXAnLvvfrDkSgazWEBvE2Y9Y01QSeNUf0H2acjHv5gR/4YOF
 GM6BmHyS/RnL//EPCfFLbfftU+D6+8aedSTrkRuQlgSM0lOzp/gD7QDdXakxBqWL8jOv
 1rxv3HiCIAvHrR/PrVQGkTo+jK1kt/783AiDb+t/pqiFten8rDViQfuxlJNsVmaDtYsu
 ui2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706295399; x=1706900199;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Gti1+B8tGjXlteOQj/tt8iuBvT2SWcmifU1EIzDFjfQ=;
 b=rJp+M5T0HtB9ZdfpFTLBLDv9PXe+ITLKJvdHJfvRxXf+SywQ0lOvabnPG9gIrsrE59
 TVYbbLvVhdjpy04vPD2MMW9QBcnKwU5ulvSlOOI1TZE2PQi+NFP/VuxJU2NV1sSpS/ak
 JQCirpIbrMEdYd9yNliYwE0HLOjco4WK0EBYSi2CmCcwUyuutI0a12705OIX5U5+UgIP
 MdIgNwPTPrdqrQMvFcX1oihKb4Ua3GrMwIWSrKuz8zkPTBC3dFwfBVYfErdME9CzGtWO
 9XuDgpBSdRP2/njE4ck/E84Bk3twnk3gK3iEgy18UpAmKdnXpqrugGBHXiPOrHBQGkxf
 o40w==
X-Gm-Message-State: AOJu0Yyq5U2LWHXwPbf9qdAleY5NSJogFxoRArbyt3B4AQAoCutYiT1Y
 DE6DnUNPk+dYvvYyLrjvnyfZMhN6FDvG2EliNGLiE+tTcfpjbAISa4m9GLNo9dWNeSIEmHqRgC0
 wyCdnorXNh7T7FtjrsgKbin3frPg=
X-Google-Smtp-Source: AGHT+IGqPwNVdOCQ7WttxaqVxMiTeiJj2ZRh6EkMftojTy5mdayujmQ2gMsy2m4AmTHmV4GSqeZlr8KSA84WuFAwy60=
X-Received: by 2002:a17:906:adcb:b0:a2f:15b8:cbcd with SMTP id
 lb11-20020a170906adcb00b00a2f15b8cbcdmr65521ejb.8.1706295398982; Fri, 26 Jan
 2024 10:56:38 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 27 Jan 2024 04:56:27 +1000
Message-ID: <CAPM=9tzGRDXLt3NqDcmhZHU7i2hBsL3Xn_zsTpGfOdMJH5tH9w@mail.gmail.com>
Subject: [git pull] drm fixes for 6.8-rc2
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

Hey Linus,

Lots going on for rc2, ivpu has a bunch of stabilisation and debugging
work, then amdgpu and xe are the main fixes. i915, exynos have a few,
then some misc panel and bridge fixes.

Worth mentioning are 3 regression reverts. One of the nouveau fixes in
6.7 for a serious deadlock had side effects, so I guess we will bring
back the deadlock until I can figure out what should be done properly.
There was a scheduler regression vs amdgpu which was reported in a few
places and is now fixed. There was an i915 vs simpledrm problem
resulting in black screens, that is reverted also.

I'll be working on a proper nouveau fix, it kinda looks like one of
those cases where someone tried to use an atomic where they should
have probably used a lock, but I'll see.

Dave.

drm-fixes-2024-01-27:
drm fixes for 6.8-rc2

fb:
- fix simpledrm/i915 regression by reverting change

scheduler:
- fix regression affecting amdgpu users due to sched draining

nouveau:
- revert 6.7 deadlock fix as it has side effects

dp:
- fix documentation warning

ttm:
- fix dummy page read on some platforms

bridge:
- anx7625 suspend fix
- sii902x: fix probing and audio registration
- parade-ps8640: fix suspend of bridge, aux fixes
- samsung-dsim: avoid using FORCE_STOP_STATE

panel:
- simple add missing bus flags
- fix samsung-s6d7aa0 flags

amdgpu:
- AC/DC power supply tracking fix
- Don't show invalid vram vendor data
- SMU 13.0.x fixes
- GART fix for umr on systems without VRAM
- GFX 10/11 UNORD_DISPATCH fixes
- IPS display fixes (required for S0ix on some platforms)
- Misc fixes

i915:
- DSI sequence revert to fix GitLab #10071 and DP test-pattern fix
- Drop -Wstringop-overflow (broken on GCC11)
- PSR fix for HSW

ivpu:
- fix recovery/reset support
- improve submit ioctl stability
- fix dev open/close races on unbind
- PLL disable reset fix
- deprecate context priority param
- improve debug buffer logging
- disable buffer sharing across VPU contexts
- free buffer sgt on unbind
- fix missing lock around shmem vmap
- add better boot diagnostics
- add more debug prints around mapping
- dump MMU events in case of timeout

v3d:
- NULL ptr dereference fix

exynos:
- fix stack usage
- fix incorrect type
- fix dt typo
- fix gsc runtime resume

xe:
- Make an ops struct static
- Fix an implicit 0 to NULL conversion
- A couple of 32-bit fixes
- A migration coherency fix for Lunar Lake.
- An error path vm id leak fix
- Remove PVC references in kunit tests
The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d=
:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2024-01-27

for you to fetch changes up to 987940f05735a960dd143214f7cc2d699885b625:

  Merge tag 'drm-misc-fixes-for-v6.8-rc2' of
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into
drm-fixes (2024-01-27 04:12:21 +1000)

----------------------------------------------------------------
drm fixes for 6.8-rc2

fb:
- fix simpledrm/i915 regression by reverting change

scheduler:
- fix regression affecting amdgpu users due to sched draining

nouveau:
- revert 6.7 deadlock fix as it has side effects

dp:
- fix documentation warning

ttm:
- fix dummy page read on some platforms

bridge:
- anx7625 suspend fix
- sii902x: fix probing and audio registration
- parade-ps8640: fix suspend of bridge, aux fixes
- samsung-dsim: avoid using FORCE_STOP_STATE

panel:
- simple add missing bus flags
- fix samsung-s6d7aa0 flags

amdgpu:
- AC/DC power supply tracking fix
- Don't show invalid vram vendor data
- SMU 13.0.x fixes
- GART fix for umr on systems without VRAM
- GFX 10/11 UNORD_DISPATCH fixes
- IPS display fixes (required for S0ix on some platforms)
- Misc fixes

i915:
- DSI sequence revert to fix GitLab #10071 and DP test-pattern fix
- Drop -Wstringop-overflow (broken on GCC11)

ivpu:
- fix recovery/reset support
- improve submit ioctl stability
- fix dev open/close races on unbind
- PLL disable reset fix
- deprecate context priority param
- improve debug buffer logging
- disable buffer sharing across VPU contexts
- free buffer sgt on unbind
- fix missing lock around shmem vmap
- add better boot diagnostics
- add more debug prints around mapping
- dump MMU events in case of timeout

v3d:
- NULL ptr dereference fix

exynos:
- fix stack usage
- fix incorrect type
- fix dt typo
- fix gsc runtime resume

xe:
- Make an ops struct static
- Fix an implicit 0 to NULL conversion
- A couple of 32-bit fixes
- A migration coherency fix for Lunar Lake.
- An error path vm id leak fix
- Remove PVC references in kunit tests

----------------------------------------------------------------
Alex Deucher (2):
      drm/amdgpu/gfx10: set UNORD_DISPATCH in compute MQDs
      drm/amdgpu/gfx11: set UNORD_DISPATCH in compute MQDs

Alvin Lee (1):
      drm/amd/display: Add Replay IPS register for DMUB command table

Arnd Bergmann (2):
      drm/panel/raydium-rm692e5: select CONFIG_DRM_DISPLAY_DP_HELPER
      drm/exynos: fix accidental on-stack copy of exynos_drm_plane

Artur Weber (1):
      drm/panel: samsung-s6d7aa0: drop DRM_BUS_FLAG_DE_HIGH for lsl080al02

Bagas Sanjaya (1):
      drm/dp_mst: Separate @failing_port list in
drm_dp_mst_atomic_check_mgr() comment

ChunTao Tso (1):
      drm/amd/display: Replay + IPS + ABM in Full Screen VPB

Dave Airlie (9):
      Merge tag 'drm-intel-next-fixes-2024-01-19' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'drm-misc-next-fixes-2024-01-19' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'exynos-drm-fixes-for-v6.8-rc2' of
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into
drm-fixes
      Merge tag 'drm-xe-fixes-2024-01-25' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
      Merge tag 'amd-drm-fixes-6.8-2024-01-25' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2024-01-26' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'drm-intel-fixes-2024-01-26' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Revert "nouveau: push event block/allowing out of the fence context"
      Merge tag 'drm-misc-fixes-for-v6.8-rc2' of
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into
drm-fixes

Douglas Anderson (2):
      drm/bridge: parade-ps8640: Wait for HPD when doing an AUX transfer
      drm/bridge: parade-ps8640: Make sure we drop the AUX mutex in
the error case

Fedor Pchelkin (2):
      drm/ttm: fix ttm pool initialization for no-dma-device drivers
      drm/exynos: gsc: minor fix for loop iteration in gsc_runtime_resume

Hawking Zhang (1):
      drm/amdgpu: Fix null pointer dereference

Himal Prasad Ghimiray (1):
      drm/xe/xe2: Use XE_CACHE_WB pat index

Hsin-Yi Wang (1):
      drm/bridge: anx7625: Ensure bridge is suspended in disable()

Inki Dae (1):
      drm/exynos: fix incorrect type issue

Jacek Lawrynowicz (8):
      accel/ivpu: Fix for missing lock around drm_gem_shmem_vmap()
      accel/ivpu: Free buffer sgt on unbind
      accel/ivpu: Disable buffer sharing among VPU contexts
      accel/ivpu: Improve buffer object debug logs
      accel/ivpu: Disable PLL after VPU IP reset during FLR
      accel/ivpu: Fix dev open/close races with unbind
      accel/ivpu: Improve stability of ivpu_submit_ioctl()
      accel/ivpu: Improve recovery and reset support

Kenneth Feng (1):
      drm/amd/pm: update the power cap setting

Khaled Almahallawy (1):
      drm/i915/dp: Fix passing the correct DPCD_REV for
drm_dp_set_phy_test_pattern

Lijo Lazar (3):
      drm/amdgpu: Avoid fetching vram vendor information
      drm/amdgpu: Show vram vendor only if available
      drm/amd/pm: Fetch current power limit from FW

Lucas De Marchi (5):
      drm/i915: Drop -Wstringop-overflow
      drm/xe: Use _ULL for u64 division
      drm/xe/mmio: Cast to u64 when printing
      drm/xe/display: Avoid calling readq()
      drm/xe: Remove PVC from xe_wa kunit tests

Ma Jun (1):
      drm/amdgpu/pm: Fix the power source flag error

Markus Niebel (1):
      drm: panel-simple: add missing bus flags for Tianma tm070jvhg[30/33]

Matthew Brost (1):
      drm/sched: Drain all entities in DRM sched run job worker

Maxime Ripard (1):
      Merge v6.8-rc1 into drm-misc-fixes

Ma=C3=ADra Canal (1):
      drm/v3d: Free the job and assign it to NULL if initialization fails

Michael Walle (1):
      drm: bridge: samsung-dsim: Don't use FORCE_STOP_STATE

Micha=C5=82 Winiarski (1):
      drm/tests: mm: Call drm_mm_print in drm_test_mm_debug

Moti Haimovski (1):
      drm/xe/vm: bugfix in xe_vm_create_ioctl

Nicholas Kazlauskas (1):
      drm/amd/display: Allow IPS2 during Replay

Pin-yen Lin (1):
      drm/bridge: parade-ps8640: Ensure bridge is suspended in .post_disabl=
e()

Rob Herring (1):
      dt-bindings: display: samsung,exynos-mixer: Fix 'regs' typo

Roman Li (4):
      drm/amd/display: Add IPS checks before dcn register access
      drm/amd/display: Disable ips before dc interrupt setting
      drm/amd: Add a DC debug mask for IPS
      drm/amd/display: "Enable IPS by default"

Srinivasan Shanmugam (1):
      drm/amd/display: Fix uninitialized variable usage in core_link_
'read_dpcd() & write_dpcd()' functions

Thomas Hellstr=C3=B6m (2):
      drm/xe/dmabuf: Make xe_dmabuf_ops static
      drm/xe: Use a NULL pointer instead of 0.

Thomas Zimmermann (1):
      Revert "drivers/firmware: Move sysfb_init() from device_initcall
to subsys_initcall_sync"

Tom St Denis (1):
      drm/amd/amdgpu: Assign GART pages to AMD device mapping

Tomi Valkeinen (2):
      drm/bridge: sii902x: Fix probing race issue
      drm/bridge: sii902x: Fix audio codec unregistration

Umesh Nerlige Ramappa (1):
      drm/i915/perf: Update handling of MMIO triggered reports

Ville Syrj=C3=A4l=C3=A4 (2):
      Revert "drm/i915/dsi: Do display on sequence later on icl+"
      drm/i915/psr: Only allow PSR in LPSP mode on HSW non-ULT

Wachowski, Karol (5):
      accel/ivpu: Dump MMU events in case of VPU boot timeout
      accel/ivpu: Call diagnose failure in ivpu_mmu_cmdq_sync()
      accel/ivpu: Add debug prints for MMU map/unmap operations
      accel/ivpu: Add diagnostic messages when VPU fails to boot or suspend
      accel/ivpu: Deprecate DRM_IVPU_PARAM_CONTEXT_PRIORITY param

Yang Wang (1):
      drm/amd/pm: udpate smu v13.0.6 message permission

Yangyu Chen (1):
      drm/ttm: allocate dummy_read_page without DMA32 on fail

 .../display/samsung/samsung,exynos-mixer.yaml      |   6 +-
 drivers/accel/ivpu/ivpu_debugfs.c                  |  20 ++-
 drivers/accel/ivpu/ivpu_drv.c                      | 126 +++++++++-------
 drivers/accel/ivpu/ivpu_drv.h                      |   5 +-
 drivers/accel/ivpu/ivpu_gem.c                      | 142 +++++++----------=
-
 drivers/accel/ivpu/ivpu_gem.h                      |   3 +-
 drivers/accel/ivpu/ivpu_hw_37xx.c                  |  14 +-
 drivers/accel/ivpu/ivpu_hw_40xx.c                  |  29 +++-
 drivers/accel/ivpu/ivpu_ipc.c                      |   6 +-
 drivers/accel/ivpu/ivpu_job.c                      | 160 ++++++++++-------=
----
 drivers/accel/ivpu/ivpu_job.h                      |   3 +-
 drivers/accel/ivpu/ivpu_mmu.c                      |  22 ++-
 drivers/accel/ivpu/ivpu_mmu.h                      |   1 +
 drivers/accel/ivpu/ivpu_mmu_context.c              |   9 ++
 drivers/accel/ivpu/ivpu_pm.c                       |  52 ++++---
 drivers/accel/ivpu/ivpu_pm.h                       |   6 +-
 drivers/firmware/sysfb.c                           |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c           |   8 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |  17 ++-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c   |   1 +
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c   |   1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  21 ++-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c  |   5 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |   1 +
 drivers/gpu/drm/amd/display/dc/dc_types.h          |   5 +
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |   9 +-
 .../drm/amd/display/dc/link/protocols/link_dpcd.c  |   4 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  47 ++++++
 .../drm/amd/display/modules/power/power_helpers.c  |   5 +
 .../drm/amd/display/modules/power/power_helpers.h  |   1 +
 drivers/gpu/drm/amd/include/amd_shared.h           |   1 +
 drivers/gpu/drm/amd/include/amdgpu_reg_state.h     |   2 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  14 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |   2 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |   2 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |  54 ++++++-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |   4 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |  54 ++++++-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |   7 +-
 drivers/gpu/drm/bridge/analogix/anx7625.h          |   2 +
 drivers/gpu/drm/bridge/parade-ps8640.c             |  23 +++
 drivers/gpu/drm/bridge/samsung-dsim.c              |  32 +----
 drivers/gpu/drm/bridge/sii902x.c                   |  42 ++++--
 drivers/gpu/drm/display/drm_dp_mst_topology.c      |   2 +
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c      |   4 +-
 drivers/gpu/drm/exynos/exynos_drm_fimd.c           |   6 +-
 drivers/gpu/drm/exynos/exynos_drm_gsc.c            |   2 +-
 drivers/gpu/drm/i915/Makefile                      |   1 -
 drivers/gpu/drm/i915/display/icl_dsi.c             |   3 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |  14 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c            |  28 +---
 drivers/gpu/drm/nouveau/nouveau_fence.h            |   5 +-
 drivers/gpu/drm/panel/Kconfig                      |   2 +
 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c      |   2 +-
 drivers/gpu/drm/panel/panel-simple.c               |   2 +
 drivers/gpu/drm/scheduler/sched_main.c             |  15 +-
 drivers/gpu/drm/tests/drm_mm_test.c                |   5 +-
 drivers/gpu/drm/ttm/ttm_device.c                   |  21 ++-
 drivers/gpu/drm/v3d/v3d_submit.c                   |  35 ++++-
 .../xe/compat-i915-headers/gem/i915_gem_object.h   |  11 +-
 drivers/gpu/drm/xe/tests/xe_wa_test.c              |   3 -
 drivers/gpu/drm/xe/xe_device.c                     |   2 +-
 drivers/gpu/drm/xe/xe_dma_buf.c                    |   2 +-
 drivers/gpu/drm/xe/xe_hwmon.c                      |   2 +-
 drivers/gpu/drm/xe/xe_migrate.c                    |  14 +-
 drivers/gpu/drm/xe/xe_mmio.c                       |   4 +-
 drivers/gpu/drm/xe/xe_vm.c                         |  23 +--
 include/uapi/drm/ivpu_accel.h                      |  25 +++-
 71 files changed, 743 insertions(+), 467 deletions(-)
