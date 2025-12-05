Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C54CA5CFF
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 02:15:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A219710E9ED;
	Fri,  5 Dec 2025 01:15:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RPlcRiay";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB38410E9ED
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 01:15:43 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-8b2627269d5so136119585a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 17:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764897342; x=1765502142; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SaJBV5sNyhFD5JJYG4l7l+EPV32kKs11r9nEjhPwKMY=;
 b=RPlcRiayaXGuMuEwkGLB1A4iAoJOX7XqiuW5yQ0HQ/x+IZJe2w0UG2bTJDx5n4eWMJ
 rLUyelP6qKnhaBonkUN4gs5IYEyUVlrq+brMLVsyLNvUn8jGre4I9MoHnhGoKmjil5Pm
 Du6V7bdJW+9bk/4padwkaMCHMYX8hVCy/MSDKcB76A4vSX9dhleBQZk+P8Q9yO++nCzR
 K1jyd9JOHQZYVZHXDOY0VfHNRxWbukSWAu/1hp0lY94TBWwJypaBDPEtsSqEh3yVLJoe
 9PtErOs3M2gYF8P+gkr7R/SceDdtl6plI2sMD4LDxD6GrL5LMFZgFKdk0+w5+Jv1C5/+
 Y18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764897342; x=1765502142;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SaJBV5sNyhFD5JJYG4l7l+EPV32kKs11r9nEjhPwKMY=;
 b=tB/oYZ9kFfJSBS7WpVxfgm7C7n9JNpj0SKhDQNLzpm0bZ5FabsD14fXX4IuCO1vUrI
 S8qM+Ex6sCCWD4QwtU/V25+GFB4FDQhlIp8hxYm7mCACv2PpyFYxYK5C7GLIUkC1sif3
 ikvzQSWvPKgcOogL9tVm6brVFI/sI9ZfjYd8Ggp5UsDnoKtsYacLVDQy2fOAjp667KCG
 uzWH0ULsv2wpy0H4mt61NraYz6d4WlyR3tIGnxfkg9a9OWz7ZNkfG+MbMDtc5OqJ+OdE
 fM/12GQKdk7vKVcCQL9waX51GhCZ/cqBFB8LCXlsyUzAnHEqKtMIpeYeSzGzYBDXBjYR
 q2aw==
X-Gm-Message-State: AOJu0Yyhthlfx4ndXJ2NpcVJDpulv9sBmIH6JSwAAQEOiL6Q5/fDPvRQ
 +JCYEFgtc5iPftsubhryeNQmoS6HwbdqTJuTF7Gn+nQtAZTh1dX2lOCpDF/+ztHnHPd3vSY7DGo
 vtrdqyPi9IG4OrL+58YNuQuZHrEMT74c=
X-Gm-Gg: ASbGncvBeiNCDj3W/Q/ZIBu39kbMwF3U2hKw9T4RQFksRwG7PQKSlm/Lo4PqYPfNeOH
 q42phBbfjcGNAQCypw8KQoNzk7lcuZ3XEPbx02lRCQScCEp/BcRp1HuCGi0Gb3hsBS6tdkqZN/r
 GvuuTF3XXRqkOCCAk0VC1ISFAHDtslK28kzkOBuqqVd6bEFYMgr2Pjg1M6SfCeGv1W2fHU8nprL
 z5jl6AjZC34/zNJS3RwCsHciGfHiabh23av3Ex71CapK7LBbgYWXJQBZbXgOlEnuA5Y+E5Cd4gJ
 lk90UtF6KROou/1SzM2MY7cOEbkMRrjxa3lrsxU=
X-Google-Smtp-Source: AGHT+IEA5aDZEeTXM47JJEFfhAc+4v2V35xSG+212oDplzsWdyzc/pnoSf4I3fXrNY+J8g/d79OiompKrdKhbLcY5rM=
X-Received: by 2002:a05:620a:7104:b0:892:ce2b:f84d with SMTP id
 af79cd13be357-8b5e592817fmr1087871785a.33.1764897342384; Thu, 04 Dec 2025
 17:15:42 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 5 Dec 2025 11:15:30 +1000
X-Gm-Features: AWmQ_bkeyLABu8IOSDfi0PLzj4XZO8-QIzWUUJjp1Hk3OQABsWyiBkQyy66AvC4
Message-ID: <CAPM=9tzSsXFDmudyA4UWEDTXp0mBaS+XSUWTZhxK49Bm1MREbg@mail.gmail.com>
Subject: [git pull] drm next part 2 for 6.19-rc1
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

Hi Linus,

As mentioned in the first PR there was some additional intel code for
color operations we wanted to land. However I discovered I missed a
pull for the xe vfio driver which I had sorted into 6.20 in my brain,
until Thomas mentioned it.

This contains the xe vfio code, a bunch of xe fixes that were waiting
and the i915 color management support. I'd like to include it as part
of keeping the two main vendors on the same page and giving a good
cross-driver experience for userspace when it starts using it.

Let me know if it causes any problems on your end,

Thanks,
Dave.

drm-next-2025-12-05:
drm next part 2 for 6.19-rc1

vfio:
- add a vfio_pci variant driver for Intel

xe/i915 display:
- add plane color management support

xe:
- Add scope-based cleanup helper for runtime PM
- vfio xe driver prerequisites and exports
- fix vfio link error
- Fix a memory leak
- Fix a 64-bit division
- vf migration fix
- LRC pause fix
The following changes since commit 0692602defb0c273f80dec9c564ca50726404aca=
:

  Merge tag 'amd-drm-next-6.19-2025-12-02' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next (2025-12-03
09:43:49 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2025-12-05

for you to fetch changes up to c7685d11108acb387e44e3d81194d0d8959eaa44:

  Merge tag 'topic/drm-intel-plane-color-pipeline-2025-12-04' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
(2025-12-05 10:27:57 +1000)

----------------------------------------------------------------
drm next part 2 for 6.19-rc1

vfio:
- add a vfio_pci variant driver for Intel

xe/i915 display:
- add plane color management support

xe:
- Add scope-based cleanup helper for runtime PM
- vfio xe driver prerequisites and exports
- fix vfio link error
- Fix a memory leak
- Fix a 64-bit division
- vf migration fix
- LRC pause fix

----------------------------------------------------------------
Arnd Bergmann (1):
      drm/xe/pf: fix VFIO link error

Chaitanya Kumar Borah (8):
      drm/i915/display: Add identifiers for driver specific blocks
      drm/i915: Add intel_color_op
      drm/i915/color: Add helper to create intel colorop
      drm/i915/color: Create a transfer function color pipeline
      drm/i915/color: Add framework to program CSC
      drm/i915/color: Preserve sign bit when int_bits is Zero
      drm/i915/color: Add registers for 3D LUT
      drm/i915/color: Add 3D LUT to color pipeline

Dave Airlie (4):
      Merge tag 'topic/xe-vfio-2025-12-01' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
      Merge tag 'topic/xe-vfio-2025-12-04' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
      Merge tag 'drm-xe-next-fixes-2025-12-04' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
      Merge tag 'topic/drm-intel-plane-color-pipeline-2025-12-04' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next

Matt Roper (1):
      drm/xe/pm: Add scope-based cleanup helper for runtime PM

Matthew Brost (1):
      drm/xe/vf: Start re-emission from first unsignaled job during VF migr=
ation

Michal Wajdeczko (1):
      drm/xe/pf: Use div_u64 when calculating GGTT profile

Micha=C5=82 Winiarski (4):
      drm/xe/pf: Enable SR-IOV VF migration
      drm/xe/pci: Introduce a helper to allow VF access to PF xe_device
      drm/xe/pf: Export helpers for VFIO
      vfio/xe: Add device specific vfio_pci driver variant for Intel graphi=
cs

Mika Kuoppala (1):
      drm/xe: Fix memory leak when handling pagefault vma

Thomas Hellstr=C3=B6m (1):
      Merge drm/drm-next into drm-xe-next-fixes

Tomasz Lis (1):
      drm/xe: Protect against unset LRC when pausing submissions

Uma Shankar (7):
      drm/i915/color: Add plane CTM callback for D12 and beyond
      drm/i915: Add register definitions for Plane Degamma
      drm/i915: Add register definitions for Plane Post CSC
      drm/i915/color: Add framework to program PRE/POST CSC LUT
      drm/i915/color: Program Pre-CSC registers
      drm/i915/color: Program Plane Post CSC Registers
      drm/i915/color: Enable Plane Color Pipelines

 MAINTAINERS                                        |   7 +
 drivers/gpu/drm/i915/Makefile                      |   2 +
 drivers/gpu/drm/i915/display/intel_color.c         | 335 ++++++++++++
 drivers/gpu/drm/i915/display/intel_color.h         |   8 +-
 .../gpu/drm/i915/display/intel_color_pipeline.c    |  99 ++++
 .../gpu/drm/i915/display/intel_color_pipeline.h    |  14 +
 drivers/gpu/drm/i915/display/intel_color_regs.h    |  29 ++
 drivers/gpu/drm/i915/display/intel_colorop.c       |  35 ++
 drivers/gpu/drm/i915/display/intel_colorop.h       |  15 +
 drivers/gpu/drm/i915/display/intel_display.c       |   5 +-
 .../gpu/drm/i915/display/intel_display_limits.h    |   9 +
 drivers/gpu/drm/i915/display/intel_display_types.h |   9 +
 drivers/gpu/drm/i915/display/intel_plane.c         |  55 ++
 drivers/gpu/drm/i915/display/skl_universal_plane.c |  21 +
 .../drm/i915/display/skl_universal_plane_regs.h    | 115 +++++
 drivers/gpu/drm/xe/Makefile                        |   6 +
 drivers/gpu/drm/xe/xe_gpu_scheduler.h              |   5 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c         |   2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c      |   9 +
 drivers/gpu/drm/xe/xe_guc_submit.c                 |  47 +-
 drivers/gpu/drm/xe/xe_pagefault.c                  |   1 -
 drivers/gpu/drm/xe/xe_pci.c                        |  17 +
 drivers/gpu/drm/xe/xe_pci.h                        |   3 +
 drivers/gpu/drm/xe/xe_pm.c                         |  21 +
 drivers/gpu/drm/xe/xe_pm.h                         |  17 +
 drivers/gpu/drm/xe/xe_sched_job_types.h            |   4 +-
 drivers/gpu/drm/xe/xe_sriov_pf_migration.c         |  35 +-
 drivers/gpu/drm/xe/xe_sriov_pf_migration.h         |   1 +
 drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h   |   4 +-
 drivers/gpu/drm/xe/xe_sriov_vfio.c                 |  80 +++
 drivers/vfio/pci/Kconfig                           |   2 +
 drivers/vfio/pci/Makefile                          |   2 +
 drivers/vfio/pci/xe/Kconfig                        |  12 +
 drivers/vfio/pci/xe/Makefile                       |   3 +
 drivers/vfio/pci/xe/main.c                         | 573 +++++++++++++++++=
++++
 include/drm/intel/xe_sriov_vfio.h                  | 143 +++++
 36 files changed, 1713 insertions(+), 32 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_color_pipeline.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_color_pipeline.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_colorop.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_colorop.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vfio.c
 create mode 100644 drivers/vfio/pci/xe/Kconfig
 create mode 100644 drivers/vfio/pci/xe/Makefile
 create mode 100644 drivers/vfio/pci/xe/main.c
 create mode 100644 include/drm/intel/xe_sriov_vfio.h
