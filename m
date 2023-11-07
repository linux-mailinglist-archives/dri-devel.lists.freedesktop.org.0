Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE90A7E32BF
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 03:03:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB6BD10E49F;
	Tue,  7 Nov 2023 02:03:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A5D210E49F
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 02:03:14 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-9c53e8b7cf4so765095766b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 18:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699322592; x=1699927392; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dU4Qw2GINVAql19xsrhiUd3GEOwNexkdbZX6XUVtGec=;
 b=SMkXDZtI1VoekzntX2Ixhxp4utVeTLUBpdU3Up8T7mRkNEUouIjVWeAPXO9aZWjf90
 Lm6RT2ITaYAuwCe/A4M4w3WNL3Lqu8HsmiSHQxtHygv2WyqhL/EcmjQavezlSA9oriN0
 Y1ygOfXuDAgca999sQYKLzDUd+y9OGLjI4d1+pc3D+db+G3W4d//3wIj54O7FVPZD4Ng
 wnVJ8g4UPpuA/TZ3dbbcjcBL0ez8CduuPGZ4SUHlZare9+l7scCV599aCK9CqJCYdZOV
 s5+4Tq/BqUS/WEtNwWo2xj3sjl6hrMITNWMxveVJdAlmvl9CcfNn2bToCi5UaQuJwBP1
 5emA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699322592; x=1699927392;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dU4Qw2GINVAql19xsrhiUd3GEOwNexkdbZX6XUVtGec=;
 b=KCemsFiMYgFcF9q4++Utl1jeIurv8NwOmb/9Ldga2Tv/N/tMZ98diR6EbfzM7j1jMB
 BVFkIMPVca9OvqSWb1Qs314wfto+A+EvXOfmq/Bmqx0rumf8/RHtNnTsB9JfBR0IYTpV
 M6l/2CCTkqKrpBKHkHWUkoM+IrDi1Uhupdxf8Nw8NYxMJIAUmnPQrNj9yEAkALinpv2P
 QguKOQPMORF5Yg7RwJXzeWvhdtn1bMnEF1aV2yaRA61xx/BxGF0ugkBGnGTc7AqkNDWU
 vsgVMFP9s1hPLx2vl2H1sJUM5Ou6brTb9rbG/BUgY47MYhDZ/Rp4P8e5UaCMsQA5u0Rx
 x49A==
X-Gm-Message-State: AOJu0Yx4C10W7xFMicb43o1TirKnZ144Nq2n+BmR2TpueH3cylD3+H7M
 kvzoJUtnoz2oFZlnt8xQkr50EJ6kTsn4VRSU+Mk=
X-Google-Smtp-Source: AGHT+IEHQSGxgZT2Egj7uT0tv/QqfFdOoEhYT01rBJIyyZ5YCAcZVFfwXw4JhN7+h5GI8+f16UAUqfZxpxE50UhxKPE=
X-Received: by 2002:a17:907:7ea5:b0:9ad:9225:ced2 with SMTP id
 qb37-20020a1709077ea500b009ad9225ced2mr14573622ejc.62.1699322592231; Mon, 06
 Nov 2023 18:03:12 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 7 Nov 2023 12:03:00 +1000
Message-ID: <CAPM=9twtAbAqnZKRTk9tKLXpJeU6azx+TM4Ep3yJHQJtCFvK7Q@mail.gmail.com>
Subject: [git pull] drm next + fixes for 6.7-rc1
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

Geert pointed out I missed the renesas reworks in my main pull, so
this pull contains the renesas next work for atomic conversion and DT
support. It also contains a bunch of amdgpu and some small ssd13xx
fixes.

I'm going to be travelling from tomorrow, I should in theory have
access to send MRs on the road, but it relies on a VPN connection I'm
not confident in surviving long enough, we shall see.

Dave.

drm-next-2023-11-07:
drm next and fixes for 6.7-rc1

renesas:
- atomic conversion
- DT support

ssd13xx:
- dt binding fix for ssd132x
- Initialize ssd130x crtc_state to NULL.

amdgpu:
- Fix RAS support check
- RAS fixes
- MES fixes
- SMU13 fixes
- Contiguous memory allocation fix
- BACO fixes
- GPU reset fixes
- Min power limit fixes
- GFX11 fixes
- USB4/TB hotplug fixes
- ARM regression fix
- GFX9.4.3 fixes
- KASAN/KCSAN stack size check fixes
- SR-IOV fixes
- SMU14 fixes
- PSP13 fixes
- Display blend fixes
- Flexible array size fixes

amdkfd:
- GPUVM fix

radeon:
- Flexible array size fixes
The following changes since commit 631808095a82e6b6f8410a95f8b12b8d0d38b161=
:

  Merge tag 'amd-drm-next-6.7-2023-10-27' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next (2023-10-31
12:37:19 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-next-2023-11-07

for you to fetch changes up to 9ccde17d46554dbb2757c427f2cdf67688701f96:

  Merge tag 'amd-drm-next-6.7-2023-11-03' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next (2023-11-06
11:25:14 +1000)

----------------------------------------------------------------
drm next and fixes for 6.7-rc1

renesas:
- atomic conversion
- DT support

ssd13xx:
- dt binding fix for ssd132x
- Initialize ssd130x crtc_state to NULL.

amdgpu:
- Fix RAS support check
- RAS fixes
- MES fixes
- SMU13 fixes
- Contiguous memory allocation fix
- BACO fixes
- GPU reset fixes
- Min power limit fixes
- GFX11 fixes
- USB4/TB hotplug fixes
- ARM regression fix
- GFX9.4.3 fixes
- KASAN/KCSAN stack size check fixes
- SR-IOV fixes
- SMU14 fixes
- PSP13 fixes
- Display blend fixes
- Flexible array size fixes

amdkfd:
- GPUVM fix

radeon:
- Flexible array size fixes

----------------------------------------------------------------
Alex Deucher (7):
      drm/amdgpu/gfx10,11: use memcpy_to/fromio for MQDs
      drm/amdgpu: don't use ATRM for external devices
      drm/amdgpu: don't use pci_is_thunderbolt_attached()
      drm/amd: Fix UBSAN array-index-out-of-bounds for Powerplay headers
      drm/amdgpu: add a retry for IP discovery init
      drm/amdgpu/smu13: drop compute workload workaround
      drm/amdgpu: don't put MQDs in VRAM on ARM | ARM64

Arunpravin Paneer Selvam (1):
      drm/amdgpu: Fix the vram base start address

Candice Li (1):
      drm/amdgpu: Drop deferred error in uncorrectable error check

Dave Airlie (3):
      Merge tag 'shmob-drm-atomic-dt-tag2' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers
into drm-next
      Merge tag 'drm-misc-next-fixes-2023-11-02' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'amd-drm-next-6.7-2023-11-03' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next

Felix Kuehling (2):
      drm/amdkfd: Improve amdgpu_vm_handle_moved
      drm/amdgpu: Attach eviction fence on alloc

Geert Uytterhoeven (36):
      MAINTAINER: Create entry for Renesas SH-Mobile DRM drivers
      dt-bindings: display: Add Renesas SH-Mobile LCDC bindings
      media: uapi: Add MEDIA_BUS_FMT_RGB666_2X9_BE format
      drm: renesas: shmobile: Fix overlay plane disable
      drm: renesas: shmobile: Fix ARGB32 overlay format typo
      drm: renesas: shmobile: Correct encoder/connector types
      drm: renesas: shmobile: Add support for Runtime PM
      drm: renesas: shmobile: Restore indentation of shmob_drm_setup_clocks=
()
      drm: renesas: shmobile: Use %p4cc to print fourcc code
      drm: renesas: shmobile: Add missing YCbCr formats
      drm: renesas: shmobile: Improve shmob_drm_format_info table
      drm: renesas: shmobile: Improve error handling
      drm: renesas: shmobile: Convert to use devm_request_irq()
      drm: renesas: shmobile: Remove custom plane destroy callback
      drm: renesas: shmobile: Use drmm_universal_plane_alloc()
      drm: renesas: shmobile: Embed drm_device in shmob_drm_device
      drm: renesas: shmobile: Convert container helpers to static
inline functions
      drm: renesas: shmobile: Replace .dev_private with container_of()
      drm: renesas: shmobile: Use media bus formats in platform data
      drm: renesas: shmobile: Move interface handling to connector setup
      drm: renesas: shmobile: Unify plane allocation
      drm: renesas: shmobile: Rename shmob_drm_crtc.crtc
      drm: renesas: shmobile: Rename shmob_drm_connector.connector
      drm: renesas: shmobile: Rename shmob_drm_plane.plane
      drm: renesas: shmobile: Use drm_crtc_handle_vblank()
      drm: renesas: shmobile: Move shmob_drm_crtc_finish_page_flip()
      drm: renesas: shmobile: Wait for page flip when turning CRTC off
      drm: renesas: shmobile: Turn vblank on/off when enabling/disabling CR=
TC
      drm: renesas: shmobile: Shutdown the display on remove
      drm: renesas: shmobile: Cleanup encoder
      drm: renesas: shmobile: Atomic conversion part 1
      drm: renesas: shmobile: Atomic conversion part 2
      drm: renesas: shmobile: Use suspend/resume helpers
      drm: renesas: shmobile: Remove internal CRTC state tracking
      drm: renesas: shmobile: Atomic conversion part 3
      drm: renesas: shmobile: Add DT support

Hawking Zhang (3):
      drm/amdgpu: Add C2PMSG_109/126 reg field shift/masks
      drm/amdgpu: Add psp v13 function to query boot status
      drm/amdgpu: Query and report boot status

Ilya Bakoulin (2):
      drm/amd/display: Fix blend LUT programming
      drm/amd/display: Enable fast update on blendTF change

Javier Martinez Canillas (2):
      dt-bindings: display: ssd132x: Remove '-' before compatible enum
      drm/ssd130x: Fix possible uninitialized usage of crtc_state variable

Jos=C3=A9 Pekkarinen (1):
      drm/radeon: replace 1-element arrays with flexible-array members

Kenneth Feng (1):
      drm/amd/pm: fix the high voltage and temperature issue

Laurent Pinchart (5):
      drm: renesas: shmobile: Remove backlight support
      drm: renesas: shmobile: Don't set display info width and height twice
      drm: renesas: shmobile: Rename input clocks
      drm: renesas: shmobile: Remove support for SYS panels
      drm: renesas: shmobile: Use struct videomode in platform data

Li Ma (2):
      drm/amd/swsmu: update smu v14_0_0 driver if and metrics table
      drm/amd/swsmu: remove fw version check in sw_init.

Lijo Lazar (1):
      drm/amd/pm: Fix warnings

Lin.Cao (1):
      drm/amdgpu doorbell range should be set when gpu recovery

Ma Jun (4):
      drm/amd/pm: Fix error of MACO flag setting code
      drm/amd/pm: Return 0 as default min power limit for legacy asics
      drm/amd/pm: only check sriov vf flag once when creating hwmon sysfs
      drm/amdgpu: Optimize the asic type fix code

Mukul Joshi (2):
      drm/amdkfd: Populate cache info for GFX 9.4.3
      drm/amdkfd: Update cache info for GFX 9.4.3

Nathan Chancellor (1):
      drm/amd/display: Increase frame warning limit with KASAN or KCSAN in =
dml2

Perry Yuan (1):
      drm/amdgpu: ungate power gating when system suspend

Sung Joon Kim (1):
      drm/amd/display: Program plane color setting correctly

Tao Zhou (4):
      drm/amdgpu: check RAS supported first in ras_reset_error_count
      drm/amdgpu: set XGMI IP version manually for v6_4
      drm/amdgpu: use mode-2 reset for RAS poison consumption
      drm/amdgpu: check recovery status of xgmi hive in ras_reset_error_cou=
nt

Tim Huang (1):
      drm/amdgpu: fix GRBM read timeout when do mes_self_test

Tong Liu01 (1):
      drm/amdgpu: add unmap latency when gfx11 set kiq resources

Wayne Lin (1):
      drm/amd/display: Avoid NULL dereference of timing generator

Yang Wang (1):
      drm/amdgpu: remove unused macro HW_REV

Yifan Zhang (1):
      drm/amdgpu: remove amdgpu_mes_self_test in gpu recover

 .../bindings/display/renesas,shmobile-lcdc.yaml    | 130 +++++
 .../bindings/display/solomon,ssd132x.yaml          |   8 +-
 .../userspace-api/media/v4l/subdev-formats.rst     |  72 +++
 MAINTAINERS                                        |  13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   3 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  79 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c           |   5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  38 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |  26 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  35 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |  16 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  15 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  19 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  19 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |  15 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  28 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  13 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c             |   5 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |  78 +++
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.c             |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |  66 ++-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |  18 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   1 -
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |   4 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c   |   3 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.c  |   2 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.h  |   5 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.c   |   3 +
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_hubp.c  | 137 ++++-
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_hubp.h  |  14 +
 drivers/gpu/drm/amd/display/dc/dml2/Makefile       |   4 +
 .../amd/include/asic_reg/mp/mp_13_0_2_sh_mask.h    |  28 +
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |  30 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  27 +-
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |   3 +
 .../gpu/drm/amd/pm/powerplay/hwmgr/pptable_v1_0.h  |   4 +-
 .../drm/amd/pm/powerplay/hwmgr/vega10_pptable.h    |  24 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  33 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |   1 +
 .../pm/swsmu/inc/pmfw_if/smu14_driver_if_v14_0_0.h | 120 +---
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |   2 +
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |  17 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |  13 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |  58 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |   2 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |  27 +-
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c     |   4 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c   | 260 ++-------
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |   3 +
 drivers/gpu/drm/radeon/atombios.h                  |  42 +-
 drivers/gpu/drm/renesas/shmobile/Kconfig           |   3 +-
 drivers/gpu/drm/renesas/shmobile/Makefile          |   3 +-
 .../gpu/drm/renesas/shmobile/shmob_drm_backlight.c |  82 ---
 .../gpu/drm/renesas/shmobile/shmob_drm_backlight.h |  19 -
 drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c  | 650 +++++++++--------=
----
 drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h  |  27 +-
 drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c   | 179 +++---
 drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.h   |  18 +-
 drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.c   |  77 ++-
 drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.h   |   9 +-
 drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c | 326 ++++++-----
 drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.h |   5 +-
 drivers/gpu/drm/solomon/ssd130x.c                  |   2 +-
 include/drm/amd_asic_type.h                        |   5 +
 include/linux/platform_data/shmob_drm.h            |  57 +-
 include/uapi/linux/media-bus-format.h              |   3 +-
 72 files changed, 1718 insertions(+), 1345 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/display/renesas,shmobile-lcdc.yaml
 delete mode 100644 drivers/gpu/drm/renesas/shmobile/shmob_drm_backlight.c
 delete mode 100644 drivers/gpu/drm/renesas/shmobile/shmob_drm_backlight.h
