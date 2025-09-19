Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01078B87D14
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 05:32:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 737DE10E928;
	Fri, 19 Sep 2025 03:32:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y2sdYx7v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D94ED10E928
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 03:32:29 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-b079c13240eso286926966b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 20:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758252748; x=1758857548; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ooofDMiH4HFG0EEg7RXIqPBnN/m1Kg0lPTZg7tt9ZG4=;
 b=Y2sdYx7vZJwoEpJLDFXXkex0DGKC9PlfAGixvhBiAwKHGkh7VsCdVqMHqqGOtwAiR7
 ThoKodbtVC04WxaOqxp0CNNqvD8pxsJuGbK/y7D558HndLF5KeZpOLq8u6wVYo+vUtXL
 2HIvesh6qjwFOJKeLZYi65/7E+E5KrmKLCd8fiKJ4PTa8PTN6OmGvqpCe4xl7SrOLgbj
 Ytu53NohcUk9bk4dkcU3iEymdxQntALFBf2D45DlyWmYFagVQH1/7retQsuWb37g9JKL
 cc4+QY1KyDDJuWUloOnHiq9JoYJ18V3FnRbH7dHtq/d7ILdsbZHTDVCdBu3n8OniATwG
 u3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758252748; x=1758857548;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ooofDMiH4HFG0EEg7RXIqPBnN/m1Kg0lPTZg7tt9ZG4=;
 b=YHv9qqVmQSCjyZP4VbKmosKVzpTagV93iutYaBEfldhKg9mMfWdIWrPExv0tJIqgiH
 jHv41KAgaywi4sivxvKm9GDiCVo1Sipm9Chfx5IkVuY2mwB9mBoSAP8/g7ALd1O48lbr
 ZS2x1pVYEARwQo1Lb0b3W0AjlzsR3UAOs4aq4RdmaINQaRW0sopYNmDCllW2pW+sqB/8
 EOTQcdQjcez0K3qDhW877naOWOnIqZg8WB6LHboAVcFuHuGCetHSsnL0n66RVlND5VUc
 iZ0vRz+TXGsTadS87oIkspyG+gPDl/LjqxGCQokIchfeM3CnnyT+aWlvxzyflR12B+NF
 Or2g==
X-Gm-Message-State: AOJu0Yw1z1Xgh2M2QIZn1XNUiZGdskDw01IijZ1Yn/Jcqyqnn+9n7f0v
 M6scZmxg7ka7e9h7lvU79xPtY8Z2hj0r2YFf1dP3FuE2SyeoVLPT1hOMUediLzQISEx+/RFtHKD
 m6tEufK/TI9hBRm67iDvnxV8MCISNnZs=
X-Gm-Gg: ASbGnctJP/5iIUcLv+kCn3WsRaZrBSVmSfG3P/HXOQbyS+0eB2HguvDpRXVTaCJcsbu
 vlUmWAc2R+RgoPnQwxA+5JPfF+lKLBLzmwUe9zpKoDsDr+AGsB5yfGSIk9VLFfZYALKhICBysmI
 fbJJi0ir7ZgP8/VeCGxeandl4D7pSpaACSqRwecmmjsjYA/1Q25ROtSdBT1woLF1I+YDFrxks/R
 wNxVQ==
X-Google-Smtp-Source: AGHT+IGw+X/9W3XV9luI4F9/vbade2aPJwKztbAKXXkZ9MjMWlFJ5BBWI1kPE2FV25oLM+14Bmayy9AAc+QA8NxUPcc=
X-Received: by 2002:a17:906:3c0c:b0:b07:e207:1530 with SMTP id
 a640c23a62f3a-b24ee6ef41dmr142878966b.26.1758252747992; Thu, 18 Sep 2025
 20:32:27 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 19 Sep 2025 13:32:16 +1000
X-Gm-Features: AS18NWAPYnEGuVm5VVwywtBO7jJYOlW93Cb3YKJLIjZJI9nNy0SThykk6dnRenM
Message-ID: <CAPM=9txMJGoLbbEHXCXKzx4=gYSKbKDpar7z5FOHaBgeLagr6Q@mail.gmail.com>
Subject: [git pull] drm fixes for 6.17-rc7
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

Weekly fixes for drm, it's a bit busier than I'd like on the xe side
this week, but otherwise amdgpu and some smaller fixes for i915/bridge
and a revert on docs.

Dave.

drm-fixes-2025-09-19:
drm fixes for 6.17-rc7

docs:
- fix docs build regression

i915:
- Honor VESA eDP backlight luminance control capability

bridge:
- anx7625: Fix NULL pointer dereference with early IRQ
- cdns-mhdp8546: Fix missing mutex unlock on error path

xe:
- Release kobject for the failure path
- SRIOV PF: Drop rounddown_pow_of_two fair
- Remove type casting on hwmon
- Defer free of NVM auxiliary container to device release
- Fix a NULL vs IS_ERR
- Add cleanup action in xe_device_sysfs_init
- Fix error handling if PXP fails to start
- Set GuC RCS/CCS yield policy

amdgpu:
- GC 11.0.1/4 cleaner shader support
- DC irq fix
- OD fix

amdkfd:
- S0ix fix
The following changes since commit f83ec76bf285bea5727f478a68b894f5543ca76e:

  Linux 6.17-rc6 (2025-09-14 14:21:14 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-09-19

for you to fetch changes up to feb96ccb33189244eaa5a7e8064e623976dbbfe3:

  Merge tag 'amd-drm-fixes-6.17-2025-09-18' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2025-09-19
12:35:09 +1000)

----------------------------------------------------------------
drm fixes for 6.17-rc7

docs:
- fix docs build regression

i915:
- Honor VESA eDP backlight luminance control capability

bridge:
- anx7625: Fix NULL pointer dereference with early IRQ
- cdns-mhdp8546: Fix missing mutex unlock on error path

xe:
- Release kobject for the failure path
- SRIOV PF: Drop rounddown_pow_of_two fair
- Remove type casting on hwmon
- Defer free of NVM auxiliary container to device release
- Fix a NULL vs IS_ERR
- Add cleanup action in xe_device_sysfs_init
- Fix error handling if PXP fails to start
- Set GuC RCS/CCS yield policy

amdgpu:
- GC 11.0.1/4 cleaner shader support
- DC irq fix
- OD fix

amdkfd:
- S0ix fix

----------------------------------------------------------------
Aaron Ma (1):
      drm/i915/backlight: Honor VESA eDP backlight luminance control capability

Alex Deucher (2):
      drm/amdkfd: add proper handling for S0ix
      drm/amdgpu: suspend KFD and KGD user queues for S0ix

Bagas Sanjaya (1):
      Revert "drm: Add directive to format code in comment"

Dan Carpenter (1):
      drm/xe: Fix a NULL vs IS_ERR() in xe_vm_add_compute_exec_queue()

Daniele Ceraolo Spurio (2):
      drm/xe: Fix error handling if PXP fails to start
      drm/xe/guc: Set RCS/CCS yield policy

Dave Airlie (4):
      Merge tag 'drm-intel-fixes-2025-09-17' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'drm-misc-fixes-2025-09-18' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2025-09-18' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
      Merge tag 'amd-drm-fixes-6.17-2025-09-18' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes

Ivan Lipski (1):
      drm/amd/display: Allow RX6xxx & RX7700 to invoke amdgpu_irq_get/put

Loic Poulain (1):
      drm: bridge: anx7625: Fix NULL pointer dereference with early IRQ

Mallesh Koujalagi (1):
      drm/xe/hwmon: Remove type casting

Mario Limonciello (1):
      drm/amd: Only restore cached manual clock settings in restore if
OD enabled

Michal Wajdeczko (1):
      drm/xe/pf: Drop rounddown_pow_of_two fair LMEM limitation

Nitin Gote (1):
      drm/xe: defer free of NVM auxiliary container to device release callback

Qi Xi (1):
      drm: bridge: cdns-mhdp8546: Fix missing mutex unlock on error path

Shuicheng Lin (1):
      drm/xe/tile: Release kobject for the failure path

Srinivasan Shanmugam (1):
      drm/amdgpu/gfx11: Add Cleaner Shader Support for GFX11.0.1/11.0.4 GPUs

Zongyao Bai (1):
      drm/xe/sysfs: Add cleanup action in xe_device_sysfs_init

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |  16 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |  12 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  24 ++---
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  15 +++
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |  36 +++++++
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  39 ++++++-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   2 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |   6 +-
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |   6 +-
 drivers/gpu/drm/drm_gpuvm.c                        |   2 -
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c  |   2 +-
 drivers/gpu/drm/xe/abi/guc_actions_abi.h           |   1 +
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h              |  25 +++++
 drivers/gpu/drm/xe/xe_device_sysfs.c               |   8 +-
 drivers/gpu/drm/xe/xe_exec_queue.c                 |  22 ++--
 drivers/gpu/drm/xe/xe_exec_queue_types.h           |   8 +-
 drivers/gpu/drm/xe/xe_execlist.c                   |  25 +++--
 drivers/gpu/drm/xe/xe_execlist_types.h             |   2 +-
 drivers/gpu/drm/xe/xe_gt.c                         |   3 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c         |   1 -
 drivers/gpu/drm/xe/xe_guc.c                        |   6 +-
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h       |   4 +-
 drivers/gpu/drm/xe/xe_guc_submit.c                 | 120 +++++++++++++++++----
 drivers/gpu/drm/xe/xe_guc_submit.h                 |   2 +
 drivers/gpu/drm/xe/xe_hwmon.c                      |  35 +++---
 drivers/gpu/drm/xe/xe_nvm.c                        |   5 +-
 drivers/gpu/drm/xe/xe_tile_sysfs.c                 |  12 ++-
 drivers/gpu/drm/xe/xe_vm.c                         |   4 +-
 28 files changed, 342 insertions(+), 101 deletions(-)
