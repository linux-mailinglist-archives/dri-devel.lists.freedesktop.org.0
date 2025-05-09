Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B90AB1D39
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 21:19:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51AB710EAC3;
	Fri,  9 May 2025 19:19:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VVSRJreN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A209410EAC3
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 19:19:40 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-ad220f139adso184905666b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 12:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746818379; x=1747423179; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VzB/umn34JPN16y9zjrFz51ufK1HJCEqBWxx7qBjw90=;
 b=VVSRJreNVGVWiEKovo+1/kTVBuvTi0fvY/mhkyxqH3t5vN903h8MkaA5qlQ3IjdFCY
 1OdcOzRQBmOGVre2MtMtqXL7DLCtU0Pgqw9XlpzbhbxOMPDCFAgsYgfiAJcuXHRropwv
 XuYcnI6aKfzxnSjelJMQIqk5DrL17TyMUy0Y6dYuDK00nM5e+SvI86x9XaBUmnl5ls1I
 OkjJ3Td3RwqOkNSNuHKUMwi0LGfvv2n3Em5WcINJ5FsrCH0OJ6iySON43DhS2dEoYx2A
 lPDIq7CXWwX2S4GlBWvZi4/QMiXK/BJS1dk+lp18enRV+4jpSc79+TLvd4wuOQkc/yol
 QxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746818379; x=1747423179;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VzB/umn34JPN16y9zjrFz51ufK1HJCEqBWxx7qBjw90=;
 b=b0lLkzS4htAgt2BmaFsxj+jvQm3nxQ1ip+2c3L5IF9md6YFaskfkfoCw1HOUXcODXx
 QqCBoWTYtGCEqiAoZjZhr62N7eI27UvRTLbLjcdlezNwmOIHDMAhpyVf5FKVNUJdiQMu
 /EqgsObn+Ad/OwG/SrVGT2Lu5nuKRv5Ls2cTVX1ME+lGI4s795p5JSksxFd2SGYRnSL0
 mBQdJIS/L+EBUaUvRPFqZnKSQ9I/WqrmNvspS1AT+GY+iF3dGuwKh274HL0Lh26d2nQb
 lrvQYSi7vxSzK5DE6HqT9o+yffr6k8sTm2lBWWLlThsnEvKFLXkifCuCSMTJGv6tjmMV
 Xo/Q==
X-Gm-Message-State: AOJu0YwD2QESLwzowbdIysXI/XYB0G/gnmVagaPRtwRKiGHpkB1USpQ+
 kctgXFVRRT9P/vxXPleZPDQrbsaEfw8HfuKNKUJ+3WPKTr2Zqf2JF+1s/Phu7EwVGEnqnTVBkU5
 PbK5/i/rneG4Cr+FOKozGdXaeOLs=
X-Gm-Gg: ASbGncvP3a2iAb69JyHDb7aR6mZUm+nIZ0kaN9Vd2rBijL9ulhHNTmRKJalgKB2FIPb
 LXt6icQC/SNBLKy50b4zXuxI95ob0Yjjy5dKaoSNKS8hImXWXYwB3cRzIqWr99/jwOiZ53aDNpb
 pAt2F8PXyUkxCpc95Lgcc5PnlmGXC2b+7LBg2V3ZJsxQ==
X-Google-Smtp-Source: AGHT+IGtLeECCuBB7dBInHNDCtrxruOGDXeY+EBwBu8tivOfxkDQ8+JenCtoiPui3aQDf6wEPCIW7EgRwdWt4sgw8hU=
X-Received: by 2002:a17:907:179a:b0:ad2:2f00:175c with SMTP id
 a640c23a62f3a-ad22f0018dfmr114181866b.50.1746818378698; Fri, 09 May 2025
 12:19:38 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 10 May 2025 05:19:27 +1000
X-Gm-Features: ATxdqUEfO0Ap1TmurLlvIj5CRSOldZiSN269hFszSyhtjoKQpcf-yWCkfJoLqCo
Message-ID: <CAPM=9txyi2mTEZtVzeR71wmaSvXNXrn-TFQbPm5n1_LQqRy8zQ@mail.gmail.com>
Subject: [git pull] drm fixes for 6.15-rc6
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

Weekly drm fixes, bit bigger than last week, but overall amdgpu/xe
with some ivpu bits and a random few fixes, and dropping the
ttm_backup struct which wrapped struct file and was recently frowned
at.

Thanks,
Dave.

drm-fixes-2025-05-10:
drm fixes for 6.15-rc6

drm:
- Fix overflow when generating wedged event

ttm:
- Fix documentation
- Remove struct ttm_backup

panel:
- simple: Fix timings for AUO G101EVN010

amdgpu:
- DC FP fixes
- Freesync fix
- DMUB AUX fixes
- VCN fix
- Hibernation fixes
- HDP fixes

xe:
- Prevent PF queue overflow
- Hold all forcewake during mocs test
- Remove GSC flush on reset path
- Fix forcewake put on error path
- Fix runtime warning when building without svm

i915:
- Fix oops on resume after disconnecting DP MST sinks during suspend
- Fix SPLC num_waiters refcounting

ivpu:
- Increase timeouts
- Fix deadlock in cmdq ioctl
- Unlock mutices in correct order

v3d:
- Avoid memory leak in job handling
The following changes since commit 92a09c47464d040866cf2b4cd052bc60555185fb=
:

  Linux 6.15-rc5 (2025-05-04 13:55:04 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-05-10

for you to fetch changes up to c2c64ed09c7b44a893d22c8b8ddb3ba7265494f3:

  Merge tag 'drm-intel-fixes-2025-05-09' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
(2025-05-10 05:07:18 +1000)

----------------------------------------------------------------
drm fixes for 6.15-rc6

drm:
- Fix overflow when generating wedged event

ttm:
- Fix documentation
- Remove struct ttm_backup

panel:
- simple: Fix timings for AUO G101EVN010

amdgpu:
- DC FP fixes
- Freesync fix
- DMUB AUX fixes
- VCN fix
- Hibernation fixes
- HDP fixes

xe:
- Prevent PF queue overflow
- Hold all forcewake during mocs test
- Remove GSC flush on reset path
- Fix forcewake put on error path
- Fix runtime warning when building without svm

i915:
- Fix oops on resume after disconnecting DP MST sinks during suspend
- Fix SPLC num_waiters refcounting

ivpu:
- Increase timeouts
- Fix deadlock in cmdq ioctl
- Unlock mutices in correct order

v3d:
- Avoid memory leak in job handling

----------------------------------------------------------------
Alex Deucher (7):
      Revert "drm/amd: Stop evicting resources on APUs in suspend"
      drm/amdgpu: fix pm notifier handling
      drm/amdgpu/hdp4: use memcfg register to post the write for HDP flush
      drm/amdgpu/hdp5: use memcfg register to post the write for HDP flush
      drm/amdgpu/hdp5.2: use memcfg register to post the write for HDP flus=
h
      drm/amdgpu/hdp6: use memcfg register to post the write for HDP flush
      drm/amdgpu/hdp7: use memcfg register to post the write for HDP flush

Alex Hung (1):
      drm/amd/display: Remove unnecessary DC_FP_START/DC_FP_END

Aurabindo Pillai (1):
      drm/amd/display: more liberal vmin/vmax update for freesync

Austin Zheng (1):
      drm/amd/display: Call FP Protect Before Mode Programming/Mode Support

Daniele Ceraolo Spurio (1):
      drm/xe/gsc: do not flush the GSC worker from the reset path

Dave Airlie (4):
      Merge tag 'drm-misc-fixes-2025-05-08' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'amd-drm-fixes-6.15-2025-05-08' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-xe-fixes-2025-05-09' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
      Merge tag 'drm-intel-fixes-2025-05-09' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes

Feng Jiang (1):
      drm: Fix potential overflow issue in event_string array

Imre Deak (1):
      drm/i915/dp: Fix determining SST/MST mode during MTP TU state computa=
tion

Jacek Lawrynowicz (2):
      accel/ivpu: Increase state dump msg timeout
      accel/ivpu: Fix pm related deadlocks in cmdq ioctls

Karol Wachowski (1):
      accel/ivpu: Correct mutex unlock order in job submission

Kevin Baker (1):
      drm/panel: simple: Update timings for AUO G101EVN010

Matthew Brost (1):
      drm/xe: Add page queue multiplier

Ma=C3=ADra Canal (1):
      drm/v3d: Add job to pending list if the reset was skipped

Roman Li (1):
      drm/amd/display: Fix invalid context error in dml helper

Ruijing Dong (1):
      drm/amdgpu/vcn: using separate VCN1_AON_SOC offset

Shuicheng Lin (2):
      drm/xe: Release force wake first then runtime power
      drm/xe: Add config control for svm flush work

Tejas Upadhyay (1):
      drm/xe/tests/mocs: Hold XE_FORCEWAKE_ALL for LNCF regs

Thomas Hellstr=C3=B6m (2):
      drm/ttm: Fix ttm_backup kerneldoc
      drm/ttm: Remove the struct ttm_backup abstraction

Vinay Belgaumkar (1):
      drm/i915/slpc: Balance the inc/dec for num_waiters

Wayne Lin (5):
      drm/amd/display: Shift DMUB AUX reply command if necessary
      drm/amd/display: Fix the checking condition in dmub aux handling
      drm/amd/display: Remove incorrect checking in dmub aux handler
      drm/amd/display: Copy AUX read reply data whenever length > 0
      drm/amd/display: Fix wrong handling for AUX_DEFER case

 drivers/accel/ivpu/ivpu_hw.c                       |  2 +-
 drivers/accel/ivpu/ivpu_job.c                      | 35 ++++++++++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           | 18 ---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 29 ++++----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            | 10 +----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |  1 -
 drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c              |  7 +++-
 drivers/gpu/drm/amd/amdgpu/hdp_v5_0.c              |  7 +++-
 drivers/gpu/drm/amd/amdgpu/hdp_v5_2.c              | 12 +++++-
 drivers/gpu/drm/amd/amdgpu/hdp_v6_0.c              |  7 +++-
 drivers/gpu/drm/amd/amdgpu/hdp_v7_0.c              |  7 +++-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |  1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |  1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |  1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |  4 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            |  1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c            |  1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c            |  3 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 36 +++++++++---------
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    | 28 ++++++++++++--
 .../drm/amd/display/dc/dml2/dml21/dml21_wrapper.c  |  8 ++--
 .../amd/display/dc/dml2/dml2_translation_helper.c  | 14 +++----
 .../amd/display/dc/resource/dcn32/dcn32_resource.c |  6 ---
 drivers/gpu/drm/drm_drv.c                          |  2 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |  2 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                | 14 +++++--
 drivers/gpu/drm/panel/panel-simple.c               | 25 ++++++------
 drivers/gpu/drm/ttm/ttm_backup.c                   | 44 ++++++------------=
----
 drivers/gpu/drm/ttm/ttm_pool.c                     |  6 +--
 drivers/gpu/drm/ttm/ttm_tt.c                       |  2 +-
 drivers/gpu/drm/v3d/v3d_sched.c                    | 28 ++++++++++----
 drivers/gpu/drm/xe/tests/xe_mocs.c                 |  7 +++-
 drivers/gpu/drm/xe/xe_gsc.c                        | 22 +++++++++++
 drivers/gpu/drm/xe/xe_gsc.h                        |  1 +
 drivers/gpu/drm/xe/xe_gsc_proxy.c                  | 11 ++++++
 drivers/gpu/drm/xe/xe_gsc_proxy.h                  |  1 +
 drivers/gpu/drm/xe/xe_gt.c                         |  2 +-
 drivers/gpu/drm/xe/xe_gt_debugfs.c                 |  9 +++--
 drivers/gpu/drm/xe/xe_gt_pagefault.c               | 11 +++++-
 drivers/gpu/drm/xe/xe_svm.c                        | 12 ++++++
 drivers/gpu/drm/xe/xe_svm.h                        |  8 ++++
 drivers/gpu/drm/xe/xe_uc.c                         |  8 +++-
 drivers/gpu/drm/xe/xe_uc.h                         |  1 +
 drivers/gpu/drm/xe/xe_vm.c                         |  3 +-
 include/drm/ttm/ttm_backup.h                       | 18 ++++-----
 include/drm/ttm/ttm_tt.h                           |  2 +-
 47 files changed, 285 insertions(+), 195 deletions(-)
