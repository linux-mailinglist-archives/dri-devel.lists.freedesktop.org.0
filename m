Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 339A27D8E8F
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 08:16:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EF5410E92B;
	Fri, 27 Oct 2023 06:16:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 426CB10E928
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 06:15:59 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5409bc907edso2541743a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 23:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698387357; x=1698992157; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GGl8/RMBFfp5VYwmvr/754qt1ZaVMlj7AsP+0mYfPo4=;
 b=HiZe3K41MTOkwMTovFSe1VOquy8UJv/JuEaZIt1oUtBvx3uaxHK/ZLkrWSpe1wMhVQ
 mtBuT+tPWP0nLMyA+hhDInk/7TMjoV4vrqYW4Q3VZiV1nyeFHbrGOKtMZZy1HQchHqGY
 LIFt2LNwu4pFGpcnmkbCwzJ3tJbqRNHSMcLTIYZRXL1grVYg+Zg53X0cWOZhWDNwNjaf
 r9nFTcKn8r/G0skSBYRmJypWR5pjOxnaIJlPC6ARX/Gn0nkQ50570P6l9LZyxMBkAXp6
 BASogggMHuB8yShjxqdW0zXuu2DidBVcmtXRea36YZZ5/BbLQ0dTVXDxH+mD3eyKW1M2
 dv5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698387357; x=1698992157;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GGl8/RMBFfp5VYwmvr/754qt1ZaVMlj7AsP+0mYfPo4=;
 b=VNE8I8/7ACDMEq9AQCHs+a1g9h4aTGf8ZsUQAILfrXxZPytt0G517rtQ+MmKDcuK4S
 1Wimo61oRQlZpSD8xPAbBwG0YY9Kf2+milyPvP8uQuHam+EBG1eEGAsOEtQMDtNV6r7+
 OuFjPrcnHuZwqWY0QTn6qBANygf2fNUJYFavCrFp5x+YcRwoIA2SNM4YsXyaC+JPNyF9
 wIKqsxldQi8550RFBw9gVmwgpI+gYYIBDDslXW7rt0kpBI3puGcpl/8ugQ9ZPeoctMRE
 IRNULawE1j48UWEBa9Dj20OslfbjNs8SWW6eFPZWnHQrMzGJMYSQ/fADAtcM8MU6tDPX
 WvyQ==
X-Gm-Message-State: AOJu0YwsDBPnGMMF3lK5DcDGFyzoNo6cD+4IzfAItbzufwB9j+45i9aW
 x6Z5iquisqSWCdJWm1otujn38Rs5O9DaKn1yUMk=
X-Google-Smtp-Source: AGHT+IHW9VCdnEU/ZeQn6si2eRTfWELmb2oa/e4nb4MLFREVdolj4XT4+q93sWN7uAKHyr1cOU1HDtVKHLiUKiVX6Us=
X-Received: by 2002:a17:907:6eaa:b0:9be:d55a:81c5 with SMTP id
 sh42-20020a1709076eaa00b009bed55a81c5mr1864765ejc.60.1698387357405; Thu, 26
 Oct 2023 23:15:57 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 27 Oct 2023 16:15:45 +1000
Message-ID: <CAPM=9tyx-mqoKY77QsHSD1kEnn1dbg9yERCNn76wVY1Jw0+z_w@mail.gmail.com>
Subject: [git pull] drm fixes for 6.6 final
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

This is the final set of fixes for 6.6, just misc bits mainly in
amdgpu and i915, nothing too noteworthy.

Dave.

drm-fixes-2023-10-27:
drm fixes for 6.6 final

amdgpu:
- ignore duplicated BOs in CS parser
- remove redundant call to amdgpu_ctx_priority_is_valid()
- Extend VI APSM quirks to more platforms

amdkfd:
- reserve fence slot while locking BO

dp_mst:
- Fix NULL deref in get_mst_branch_device_by_guid_helper()

logicvc:
- Kconfig: Select REGMAP and REGMAP_MMIO

ivpu:
- Fix missing VPUIP interrupts

i915:
- Determine context valid in OA reports
- Hold GT forcewake during steering operations
- Check if PMU is closed before stopping event
The following changes since commit 05d3ef8bba77c1b5f98d941d8b2d4aeab8118ef1=
:

  Linux 6.6-rc7 (2023-10-22 12:11:21 -1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-10-27

for you to fetch changes up to 44117828ed5c129a8146585e81262c0025daa50f:

  Merge tag 'amd-drm-fixes-6.6-2023-10-25' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2023-10-27
12:17:26 +1000)

----------------------------------------------------------------
drm fixes for 6.6 final

amdgpu:
- ignore duplicated BOs in CS parser
- remove redundant call to amdgpu_ctx_priority_is_valid()
- Extend VI APSM quirks to more platforms

amdkfd:
- reserve fence slot while locking BO

dp_mst:
- Fix NULL deref in get_mst_branch_device_by_guid_helper()

logicvc:
- Kconfig: Select REGMAP and REGMAP_MMIO

ivpu:
- Fix missing VPUIP interrupts

i915:
- Determine context valid in OA reports
- Hold GT forcewake during steering operations
- Check if PMU is closed before stopping event

----------------------------------------------------------------
Christian K=C3=B6nig (2):
      drm/amdgpu: ignore duplicate BOs again
      drm/amdkfd: reserve a fence slot while locking the BO

Dave Airlie (3):
      Merge tag 'drm-misc-fixes-2023-10-26' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'drm-intel-fixes-2023-10-26' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'amd-drm-fixes-6.6-2023-10-25' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes

Karol Wachowski (1):
      accel/ivpu/37xx: Fix missing VPUIP interrupts

Luben Tuikov (1):
      drm/amdgpu: Remove redundant call to priority_is_valid()

Lukasz Majczak (1):
      drm/dp_mst: Fix NULL deref in get_mst_branch_device_by_guid_helper()

Mario Limonciello (1):
      drm/amd: Disable ASPM for VI w/ all Intel systems

Matt Roper (1):
      drm/i915/mcr: Hold GT forcewake during steering operations

Sui Jingfeng (1):
      drm/logicvc: Kconfig: select REGMAP and REGMAP_MMIO

Umesh Nerlige Ramappa (2):
      drm/i915/perf: Determine context valid in OA reports
      drm/i915/pmu: Check if pmu is closed before stopping event

 drivers/accel/ivpu/ivpu_hw_37xx.c                | 11 +++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c           |  3 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c          | 15 ++++++++-------
 drivers/gpu/drm/amd/amdgpu/vi.c                  |  2 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c    |  6 +++---
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c           | 24 ++++++++++++++++++++=
++--
 drivers/gpu/drm/i915/i915_perf.c                 |  4 ++--
 drivers/gpu/drm/i915/i915_pmu.c                  |  9 +++++++++
 drivers/gpu/drm/logicvc/Kconfig                  |  2 ++
 10 files changed, 55 insertions(+), 23 deletions(-)
