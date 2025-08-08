Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C173B1DFE9
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 02:16:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C14C410E04B;
	Fri,  8 Aug 2025 00:16:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gOXRkpiD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 538CA10E04B
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 00:16:40 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-af95b919093so238162166b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Aug 2025 17:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754612199; x=1755216999; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xPZdVNrW41q7DAUdB/VwINcIYpzwK89g+W8F6J/ucRg=;
 b=gOXRkpiDwPfE/qDdHfboPpcgbaeFaXroWdb4wzipMaSZikPS0dAR3rkc1cIoSoiUX8
 jYF2Ux0hkHSsBlrticfOQ8+bDBMctnXNlUW/ZeICBzjK0xLCW3VcfUeu7ksIeurykAUW
 /syTyDt+OVavg7nKeb0HTQ7vOm/gD1vket9Lhv9KlLs1cQLNU2jPaFxNUEPyf+XGFGRs
 1lquF7jEg4QwNFbJdkpTDtxO/OKyimsaVzTgvAxPR9fendUkS6TlDr5Um4zWrvMQE/fB
 4B57d+MHGncVNVQkUtMVv0VxO91KKAFfzUTYSvhrnqFs2uBI1o8ZMb+BYiw93kTLRBrW
 yZBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754612199; x=1755216999;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xPZdVNrW41q7DAUdB/VwINcIYpzwK89g+W8F6J/ucRg=;
 b=NQIyzHZ2NGiQLp7ib3BnCWdkxEHMps0Bn7z2kVq3PqSpr48F07taRK9/aZweby483E
 teaXj4oMXS9c200H7RJB6YgtJzFJxxOqpOEWv5328lyfCwYp5cKr0O+kSbPxwzUfEF2x
 pzsqI3cMOFIssM6nXmktH5YuhR1D3AeZnF8Kp5Sfr+g0T34H9Zu+bFyY1Msf9KY6emUK
 oRVeRZBwlx20GPrsIO4EFo3nnt6uTqZYPguBsmQPBghr7cpfuC82nHcgt0tIuVo++v7s
 iabaSID17Xg7Dn3qXGPR/s359hDRPUnFIMpKDzzlSJysnDdfHu7BjzDkhlQEi7MoaxgB
 nyLw==
X-Gm-Message-State: AOJu0YxuGnwj2o9PvbdL1BBszjjWWhRN0g6Tv6B5GVS3Yp8QoeY7EF5B
 cfXO5ESgBTer37S0TQDAum/1zWOBQvLCMoINPiT4wShpUcg9qMlRvI1UiKDF4ke3+7nzDRgGiyV
 4FjZCCB7pcWCE8vp9HZkuGTBwmEaY4m0=
X-Gm-Gg: ASbGncuqwwOzhotEApu3+2YSWGutyuEzPRq0Lg8UciUqqEjq9VKlIOR6+ZaLY8Wu4gB
 B+nrHA6G+sVO5v9VE7Z49nF2DjhTmPOpBpF28pAayyZlNjdbiqGkq6n/oCjEVnS2POg18bW40g/
 9her6u9KPqEL5L1YOp7ntQfKimlXDY5iY1iALpCGfhA3P02XojxkoITcoNxovVMZJY7vU0BXBkc
 cchXoY=
X-Google-Smtp-Source: AGHT+IErqhWifOxmRixsHlVmwEN0sUCALdizsuJhfaUdm/bGCaRd6+b2LkZMY91Lo/KMC85PC1FvmDekjDKHl83jpZY=
X-Received: by 2002:a17:907:2d0f:b0:ae3:75e5:ff7a with SMTP id
 a640c23a62f3a-af9c645ebe4mr74395166b.19.1754612198377; Thu, 07 Aug 2025
 17:16:38 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 8 Aug 2025 10:16:27 +1000
X-Gm-Features: Ac12FXzHyEAjfibVQ_rlFFljGomoJYSyp-4Yp7BFpHsG5N6OKVX7Q0fCwHzbdYw
Message-ID: <CAPM=9tzJAoCXiwvR6tpSv5QctkKu+JAbKZBEbM+M+z+fZOkAOw@mail.gmail.com>
Subject: [git pull] drm fixes for 6.17-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Simona Vetter <simona@ffwll.ch>
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

Hey Linus,

This is the fixes that built up in the merge window, mostly amdgpu and
xe with one i915 display fix, seems like things are pretty good for
rc1.

Regards,
Dave.

drm-next-2025-08-08:
drm fixes for 6.17-rc1

i915:
- DP LPFS fixes

xe:
- SRIOV: PF fixes and removal of need of module param
- Fix driver unbind around Devcoredump
- Mark xe driver as BROKEN if kernel page size is not 4kB

amdgpu:
- GC 9.5.0 fixes
- SMU fix
- DCE 6 DC fixes
- mmhub client ID fixes
- VRR fix
- Backlight fix
- UserQ fix
- Legacy reset fix
- Misc fixes

amdkfd:
- CRIU fix
- Debugfs fix
The following changes since commit 6531a2cf07ef156956840853692755cc7e1621b7=
:

  Merge tag 'drm-xe-next-fixes-2025-07-31' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next (2025-08-01
07:09:16 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2025-08-08

for you to fetch changes up to 64c627519474e687b876e6e50cc28ece16d10564:

  Merge tag 'amd-drm-fixes-6.17-2025-08-07' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next (2025-08-08
08:17:13 +1000)

----------------------------------------------------------------
drm fixes for 6.17-rc1

i915:
- DP LPFS fixes

xe:
- SRIOV: PF fixes and removal of need of module param
- Fix driver unbind around Devcoredump
- Mark xe driver as BROKEN if kernel page size is not 4kB

amdgpu:
- GC 9.5.0 fixes
- SMU fix
- DCE 6 DC fixes
- mmhub client ID fixes
- VRR fix
- Backlight fix
- UserQ fix
- Legacy reset fix
- Misc fixes

amdkfd:
- CRIU fix
- Debugfs fix

----------------------------------------------------------------
Alex Deucher (4):
      drm/amdgpu: update mmhub 3.0.1 client id mappings
      drm/amdgpu: update mmhub 3.3 client id mappings
      drm/amdgpu/discovery: fix fw based ip discovery
      drm/amdgpu: add missing vram lost check for LEGACY RESET

Amber Lin (1):
      drm/amdkfd: Destroy KFD debugfs after destroy KFD wq

Balasubramani Vivekanandan (1):
      drm/xe/devcoredump: Defer devcoredump initialization during probe

Dave Airlie (3):
      Merge tag 'drm-intel-next-fixes-2025-08-05' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      Merge tag 'drm-xe-next-fixes-2025-08-06' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
      Merge tag 'amd-drm-fixes-6.17-2025-08-07' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next

David Yat Sin (1):
      drm/amdkfd: Fix checkpoint-restore on multi-xcc

Jesse.Zhang (1):
      drm/amdgpu: Update SDMA firmware version check for user queue support

Jouni H=C3=B6gander (4):
      drm/i915/display: Write PHY_CMN1_CONTROL only when using AUXLess ALPM
      drm/i915/display: Avoid unnecessarily calling
intel_cx0_get_owned_lane_mask
      drm/i915/display: Ensure phy is accessible on lfps configuration
      drm/i915/display: Set C10_VDR_CTRL_MSGBUS_ACCESS before phy reg read

Lijo Lazar (3):
      drm/amdgpu: Update supported modes for GC v9.5.0
      drm/amdgpu: Update external revid for GC v9.5.0
      drm/amdgpu: Add NULL check for asic_funcs

Mario Limonciello (3):
      drm/amd: Restore cached power limit during resume
      drm/amd: Restore cached manual clock settings during resume
      drm/amd/display: Revert "drm/amd/display: Fix AMDGPU_MAX_BL_LEVEL val=
ue"

Michal Wajdeczko (3):
      drm/xe/pf: Enable SR-IOV PF mode by default
      drm/xe/pf: Disable PF restart worker on device removal
      drm/xe/pf: Make sure PF is ready to configure VFs

Michel D=C3=A4nzer (1):
      drm/amd/display: Add primary plane to commits for correct VRR handlin=
g

Simon Richter (1):
      Mark xe driver as BROKEN if kernel page size is not 4kB

Siyang Liu (1):
      drm/amd/display: fix a Null pointer dereference vulnerability

Timur Krist=C3=B3f (2):
      drm/amd/display: Don't overwrite dce60_clk_mgr
      drm/amd/display: Fix DCE 6.0 and 6.4 PLL programming.

Xaver Hugl (1):
      amdgpu/amdgpu_discovery: increase timeout limit for IFWI init

YuanShang (1):
      drm/amdgpu: Retain job->vm in amdgpu_job_prepare_job

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |  76 +++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |   7 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.c           |   3 +-
 drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c         |   5 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_1.c          |  57 +++++-----
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_3.c            | 121 +++++++++++++++++=
++--
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |   2 +
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_module.c            |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |  61 +++++++++--
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |  20 +++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   8 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |   9 ++
 drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |   1 -
 .../amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c    |   5 +
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  19 ++--
 .../amd/display/dc/resource/dce60/dce60_resource.c |  34 +++---
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  16 +++
 drivers/gpu/drm/i915/display/intel_cx0_phy.c       |  21 +++-
 drivers/gpu/drm/xe/Kconfig                         |   1 +
 drivers/gpu/drm/xe/xe_device.c                     |   8 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c                |  57 +++++++++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf.h                |   1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c        |   4 +-
 drivers/gpu/drm/xe/xe_guc_capture.c                |   6 +
 drivers/gpu/drm/xe/xe_module.c                     |   8 +-
 drivers/gpu/drm/xe/xe_pci_sriov.c                  |   7 +-
 drivers/gpu/drm/xe/xe_sriov_pf.c                   |  27 +++++
 drivers/gpu/drm/xe/xe_sriov_pf.h                   |   1 +
 31 files changed, 456 insertions(+), 141 deletions(-)
