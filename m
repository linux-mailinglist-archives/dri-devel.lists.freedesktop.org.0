Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1319DBD00
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 21:42:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 924BC10E111;
	Thu, 28 Nov 2024 20:42:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="m/Wh/2+e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7174210E111
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 20:42:31 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a9aa8895facso167828166b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 12:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732826549; x=1733431349; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=2KdlF9x9lgY8r5WheHdsB6PvqVgobDEaMbbXgNvbHM0=;
 b=m/Wh/2+e2NOdGvOGrIx1bu3AEHLhbBNmAQONIBuyMjKAGDBv6+lXhYB5xazBM/+yHb
 w+kdIfANq9ghTP5ru0CuuZqHcnWL5F1Fcgh52OAyD4UpgcWT9vAtonBhDlBPSEIdxS9j
 pI9sfTxh+tr1XipDBx6tneDzRmK/+/VKPuL3Y2EyE+EsEBMQd5iFowCLPhTA+pjncd81
 ASDn/fyDR1pjEjmrSxoLq4ICZFyjI9VyaBRFY+8rIOQD4dyryU0htW2VwpzgjX0MDekn
 Z+tyrwNQLWZNxLm4P303P9kR5J/Jh3hwbDE2aLJNtOsVe4RjPct+XZ5h+6LBNhTkZumQ
 2CDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732826549; x=1733431349;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2KdlF9x9lgY8r5WheHdsB6PvqVgobDEaMbbXgNvbHM0=;
 b=tE0OTwJ2IcBVmvZqnu6B0iufaR3NN+uuOLeRNhWMCITUVFFD9USjwmCzImIkR5xCdg
 NAbqojpN7ixdAAO6YNnvI//yN1ALU03sn85v826lt5LGXL2SIOXQWyTu0N/DAX9cSHGm
 m2KrgAATP+GXhqSflVgtNL572YpYNyfJmgubqY9uYADrYMr+DnInTQLU7M/OfC+H7Bbe
 2dzyHKqlWwARCjCZ92XemIC+CL/97YoXZe/B0fNYdgP/fOgAAivRm2p4vcpu8FfuKWmq
 xNoMrdBq0bJEaCuXKN7cfUcWQnvScBF2ApoVz+9hbQbca2XMfca/3W20UurkRyCqm284
 Eo6A==
X-Gm-Message-State: AOJu0YyKgk4VkSvZLv7NInlozVTtHyRAoHfB+JB+0Jc3C2mGKhUvvht+
 0dLS4jlpxMgvnn1PVn+iIGMH4uW6KYYjfcHu4kIizk529/MQESiNONcZFGUzbBBJM4rDXqFXI/F
 lhjXmVLyTmkntHSeLwehO3wrJIM4=
X-Gm-Gg: ASbGncvKOOVehPoH2OTCZS9zjLcOrFYGvOxFBR/TyGXQk8To32zuVbXxho2BY3xHYtu
 kL5ytePvkeQd9rsK1DPeUb7DN6FdgRw==
X-Google-Smtp-Source: AGHT+IFyI+TYy88fNKIfSHbBJWEK8n7Et57aFo2D52UyXwxq0DbKB/1iKKtJxVZFfocKE4ICU3WBS50mcnXHHDeC5Co=
X-Received: by 2002:a17:906:3d21:b0:aa5:3fa9:e90c with SMTP id
 a640c23a62f3a-aa580f56c51mr621818766b.32.1732826549342; Thu, 28 Nov 2024
 12:42:29 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 29 Nov 2024 06:42:18 +1000
Message-ID: <CAPM=9tzpFOhQN3yCb4+OpLsfYVrq4mLuUS+SP=H=gq=qSLDz7g@mail.gmail.com>
Subject: [git pull] drm fixes for 6.13-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

Merge window fixes, mostly amdgpu and xe, with a few other minor ones,
all looks fairly normal,

Dave.

drm-next-2024-11-29:
drm fixes for v6.13-rc1

i915:
- hdcp: Fix when the first read and write are retried

xe:
- Wake up waiters after wait condition set to true
- Mark the preempt fence workqueue as reclaim
- Update xe2 graphics name string
- Fix a couple of guc submit races
- Fix pat index usage in migrate
- Ensure non-cached migrate pagetable bo mappings
- Take a PM ref in the delayed snapshot capture worker

amdgpu:
- SMU 13.0.6 fixes
- XGMI fixes
- SMU 13.0.7 fixes
- Misc code cleanups
- Plane refcount fixes
- DCN 4.0.1 fixes
- DC power fixes
- DTO fixes
- NBIO 7.11 fixes
- SMU 14.0.x fixes
- Reset fixes
- Enable DC on LoongArch
- Sysfs hotplug warning fix
- Misc small fixes
- VCN 4.0.3 fix
- Slab usage fix
- Jpeg delayed work fix

amdkfd:
- wptr handling fixes

radeon:
- Use ttm_bo_move_null()
- Constify struct pci_device_id
- Fix spurious hotplug
- HPD fix

rockchip
- fix 32-bit build
The following changes since commit a163b895077861598be48c1cf7f4a88413c28b22:

  Merge tag 'drm-xe-next-fixes-2024-11-15' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next (2024-11-18
13:38:46 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2024-11-29

for you to fetch changes up to 9794b89c50f7fc972c6b4ddc69693c9f9d1ae7d7:

  Merge tag 'drm-xe-next-fixes-2024-11-28' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next (2024-11-29
04:59:28 +1000)

----------------------------------------------------------------
drm fixes for v6.13-rc1

i915:
- hdcp: Fix when the first read and write are retried

xe:
- Wake up waiters after wait condition set to true
- Mark the preempt fence workqueue as reclaim
- Update xe2 graphics name string
- Fix a couple of guc submit races
- Fix pat index usage in migrate
- Ensure non-cached migrate pagetable bo mappings
- Take a PM ref in the delayed snapshot capture worker

amdgpu:
- SMU 13.0.6 fixes
- XGMI fixes
- SMU 13.0.7 fixes
- Misc code cleanups
- Plane refcount fixes
- DCN 4.0.1 fixes
- DC power fixes
- DTO fixes
- NBIO 7.11 fixes
- SMU 14.0.x fixes
- Reset fixes
- Enable DC on LoongArch
- Sysfs hotplug warning fix
- Misc small fixes
- VCN 4.0.3 fix
- Slab usage fix
- Jpeg delayed work fix

amdkfd:
- wptr handling fixes

radeon:
- Use ttm_bo_move_null()
- Constify struct pci_device_id
- Fix spurious hotplug
- HPD fix

rockchip
- fix 32-bit build

----------------------------------------------------------------
Alex Deucher (3):
      drm/amdgpu/gmc7: fix wait_for_idle callers
      drm/amdgpu/jpeg: cancel the jpeg worker
      Revert "drm/radeon: Delay Connector detecting when HPD singals
is unstable"

Aric Cyr (1):
      drm/amd/display: 3.2.310

Arnd Bergmann (1):
      drm/rockchip: avoid 64-bit division

Asad Kamal (3):
      drm/amd/pm: Update data types used for uapi i/f
      drm/amd/pm: Add gpu_metrics_v1_7
      drm/amd/pm: Get xgmi link status for XGMI_v_6_4_0

Austin Zheng (1):
      drm/amd/display: Populate Power Profile In Case of Early Return

Bhavin Sharma (2):
      drm/amd/pm: remove redundant tools_size check
      drm/amd/display: remove redundant is_dsc_possible check

Chris Park (1):
      drm/amd/display: Ignore scalar validation failure if pipe is phantom

Christophe JAILLET (1):
      drm/radeon: Constify struct pci_device_id

Dave Airlie (5):
      Merge tag 'drm-intel-next-fixes-2024-11-21' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      Merge tag 'drm-xe-next-fixes-2024-11-21' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
      Merge tag 'amd-drm-fixes-6.13-2024-11-22' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-misc-next-fixes-2024-11-28' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'drm-xe-next-fixes-2024-11-28' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next

Dillon Varone (1):
      drm/amd/display: Enable Request rate limiter during C-State on dcn401

Huacai Chen (2):
      drm/radeon: Use ttm_bo_move_null() in radeon_bo_move()
      drm/amd/display: Allow building DC with clang on LoongArch

Jesse.zhang@amd.com (2):
      drm/amdgpu: Add sysfs interface for vcn reset mask
      drm/amdgpu: Fix sysfs warning when hotplugging

Joshua Aberback (1):
      drm/amd/display: Fix handling of plane refcount

Kenneth Feng (3):
      drm/amdgpu/pm: add gen5 display to the user on smu v14.0.2/3
      drm/amd/pm: disable pcie speed switching on Intel platform for
smu v14.0.2/3
      drm/amd/pm: skip setting the power source on smu v14.0.2/3

Lijo Lazar (4):
      drm/amdgpu: Add init level for post reset reinit
      drm/amdgpu: Use reset recovery state checks
      drm/amdkfd: Use the correct wptr size
      drm/amd/pm: Remove arcturus min power limit

Mario Limonciello (2):
      drm/amd: Add some missing straps from NBIO 7.11.0
      drm/amd: Fix initialization mistake for NBIO 7.11 devices

Matt Roper (1):
      drm/xe: Update xe2_graphics name string

Matthew Auld (4):
      drm/xe/guc_submit: fix race around pending_disable
      drm/xe/guc_submit: fix race around suspend_pending
      drm/xe/migrate: fix pat index usage
      drm/xe/migrate: use XE_BO_FLAG_PAGETABLE

Matthew Brost (2):
      drm/xe: Mark preempt fence workqueue as reclaim
      drm/xe: Take PM ref in delayed snapshot capture worker

Nirmoy Das (1):
      drm/xe/ufence: Wake up waiters after setting ufence->signalled

Ovidiu Bunea (1):
      drm/amd/display: Remove PIPE_DTO_SRC_SEL programming from set_dtbclk_dto

Samson Tam (2):
      drm/amd/display: add public taps API in SPL
      drm/amd/display: allow chroma 1:1 scaling when sharpness is off

Steven 'Steve' Kendall (1):
      drm/radeon: Fix spurious unplug event on radeon HDMI

Suraj Kandpal (1):
      drm/i915/hdcp: Fix when the first read and write are retried

Umio Yasuno (1):
      drm/amd/pm: update current_socclk and current_uclk in
gpu_metrics on smu v13.0.7

Victor Zhao (1):
      drm/amdkfd: make sure ring buffer is flushed before update wptr

Vitaly Prosyak (1):
      drm/amdgpu: fix usage slab after free

Xiang Liu (1):
      drm/amdgpu/vcn: reset fw_shared when VCPU buffers corrupted on vcn v4.0.3

Yihan Zhu (1):
      drm/amd/display: update pipe selection policy to check head pipe

Zicheng Qu (2):
      drm/amd/display: Fix null check for pipe_ctx->plane_state in
dcn20_program_pipe
      drm/amd/display: Fix null check for pipe_ctx->plane_state in
hwss_setup_dpp

 drivers/gpu/drm/amd/amdgpu/aldebaran.c             |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  29 ++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c           |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c    |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c          |   5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h          |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |  37 +++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c            |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |  41 +++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h           |   2 +
 drivers/gpu/drm/amd/amdgpu/df_v3_6.c               |   4 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c              |  18 +++-
 drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c           |   2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c           |   2 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_11.c            |   9 ++
 drivers/gpu/drm/amd/amdgpu/sienna_cichlid.c        |   2 +
 drivers/gpu/drm/amd/amdgpu/smu_v13_0_10.c          |   2 +
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |   9 ++
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            |  39 +++++--
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c            |  10 ++
 drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.c      |   7 +-
 drivers/gpu/drm/amd/display/Kconfig                |  15 +--
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   7 +-
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |   3 +
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |   8 ++
 drivers/gpu/drm/amd/display/dc/dc.h                |   2 +-
 .../gpu/drm/amd/display/dc/dccg/dcn35/dcn35_dccg.c |  15 +--
 .../dml21/src/dml2_core/dml2_core_dcn4_calcs.c     |   6 ++
 .../amd/display/dc/dml2/dml2_dc_resource_mgmt.c    |  23 +++-
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        |  13 +--
 .../drm/amd/display/dc/hubbub/dcn10/dcn10_hubbub.h |   8 +-
 .../drm/amd/display/dc/hubbub/dcn20/dcn20_hubbub.h |   1 +
 .../amd/display/dc/hubbub/dcn401/dcn401_hubbub.c   |  24 ++++-
 .../amd/display/dc/hubbub/dcn401/dcn401_hubbub.h   |   7 +-
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |   6 +-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |  13 ++-
 drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h   |   2 +-
 .../display/dc/resource/dcn401/dcn401_resource.h   |   3 +-
 drivers/gpu/drm/amd/display/dc/spl/dc_spl.c        |  97 +++++++++++------
 drivers/gpu/drm/amd/display/dc/spl/dc_spl.h        |   2 +
 .../amd/include/asic_reg/nbio/nbio_7_11_0_offset.h |   2 +
 .../include/asic_reg/nbio/nbio_7_11_0_sh_mask.h    |  13 +++
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     | 118 ++++++++++++++++++++-
 .../drm/amd/pm/powerplay/smumgr/vega12_smumgr.c    |  24 ++---
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   8 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v14_0.h       |   2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |   6 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |  12 ++-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |   2 +
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c     |   2 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |  37 +++++--
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |   3 +
 drivers/gpu/drm/i915/display/intel_hdcp.c          |  32 +++---
 drivers/gpu/drm/radeon/radeon_audio.c              |  12 ++-
 drivers/gpu/drm/radeon/radeon_connectors.c         |  10 --
 drivers/gpu/drm/radeon/radeon_drv.c                |   3 +-
 drivers/gpu/drm/radeon/radeon_ttm.c                |   3 +-
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c     |   2 +-
 drivers/gpu/drm/xe/xe_devcoredump.c                |   6 ++
 drivers/gpu/drm/xe/xe_device.c                     |   3 +-
 drivers/gpu/drm/xe/xe_guc_submit.c                 |  34 ++++--
 drivers/gpu/drm/xe/xe_migrate.c                    |   6 +-
 drivers/gpu/drm/xe/xe_pci.c                        |   2 +-
 drivers/gpu/drm/xe/xe_sync.c                       |   6 +-
 75 files changed, 692 insertions(+), 195 deletions(-)
