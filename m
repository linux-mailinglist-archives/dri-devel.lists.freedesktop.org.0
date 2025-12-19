Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBA2CD1ABA
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 20:45:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C417410F07E;
	Fri, 19 Dec 2025 19:45:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QRLcGOeL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BC7810F07E
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 19:45:04 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-8b9d2e33e2dso311144285a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 11:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766173504; x=1766778304; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AmtmIycBRnp7CarvXqxL0Pg3UuhtbW4hf103AWuPItM=;
 b=QRLcGOeLqkgvL9GrydRToxA1Kb6QEDaClz+Wkb5MFuJ0qyIG1v3dh8lFCRmiQBYqzz
 4lwmK7ZtxD2ejyN5IJ6Exr6bMlXyi5gQPmh19BcHo2PcDiqP0bCj2ZfFTLuA6CRiJ3QQ
 pLQkkC3a2q/hEJD89wQEPt4P3s7Q0MnRnQ2urW0JqNlbzlf3PeNYRzGdeARy0XZ61zSA
 4O/c2OYcPYMjKrDOdB5kXQDes6MCZfe7lxBE+DhKKKPinn9TRHXzm1l9UOAKS1h0lDt8
 L4z6Gd+ZEY7W6xxCPn6dMXOFodfJQglLGFhCLPXlBBjKu0TT87Cqs5mRbG4Jw3sRPHX8
 jAmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766173504; x=1766778304;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AmtmIycBRnp7CarvXqxL0Pg3UuhtbW4hf103AWuPItM=;
 b=Q8OSlrg4IBOQwYXPWcBw/fxpLYk+Ni0a+DgSdiOaB6Ea5ZoaFMShQhO81Zlq8PiBKN
 R8QMmtFCDQZD1uqXcfTBR+tAYy3YnAdsecEuPHI9R+9Hpc41JkK5Xa69Orq8U8abFp5Q
 D26NiGaEsvVcId737UnLiWaBoHgK9fe51AVk2S4DBfVdev4V7VAmmkkaOrCe6ke99eem
 GLv/Nj8tDG8LezKNdkQX73C+JjIY+w4OdAs+0MY5ZG3nJKA3xEuU8AASCQ740TATnrHo
 L9u/hyvLZV+QJhRAb+nQlktpxVib9LDKRzuPmvoWFgcL10wlBp/Tg4EVP3DlX7Rv0N9h
 qazg==
X-Gm-Message-State: AOJu0YzVljHg9l2XVXIS1UfZu8p6RuuRUb17qP1kx0BnrTaQvj0a6P+M
 VidOk3rOvc1r+wPQzWHVC0s6ZDlVqe9kfvQW7xnZ2dYuTdDJsFHfipcEgkHG0SgeXTBjnZ25+xN
 IfhwlYoyz8KRa4AW6ZmlnvSLvgXyI/ZA=
X-Gm-Gg: AY/fxX7CRR6MUda8vG4YyGd7rS+/BWFXD12WN+sGmt4H4TTyJf4yCF4pmrMMExdOn75
 PWt2iye1QVasQWK4wwvNtBiLRc7H9JoyAjUEKz4dB3oYbMQPK5Ao2m9/Oj1P5NeOXWHhU7z3bQb
 InYaOXYvOLv6XZayFB4xFEv4d44sPj2dp0LwpD3rzNc8EK29AdAB6IP8corLSmDscvons9WE+49
 ZSp1zGuFWIfsShwa9pa/Pmr/9G8blUvKUBVJdy74NQFxCa6tg9IeU/qzD65BgoWwlIzkg==
X-Google-Smtp-Source: AGHT+IGNUdF03OMzNnLXm7z3IkCrevMsGSX6N9fpIL3IYr4jyXUk42SLuldD48005fsohjv5tZZrgWB+t7lsXaYXcPM=
X-Received: by 2002:a05:620a:404d:b0:8b0:f04c:9f0f with SMTP id
 af79cd13be357-8c08fd03911mr729052985a.63.1766173503930; Fri, 19 Dec 2025
 11:45:03 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 20 Dec 2025 05:44:52 +1000
X-Gm-Features: AQt7F2r8sDwchbX8769MuAnFNPhrF3YjY-NOSI1cI0vRGslQzzIGHCVbehWcF4I
Message-ID: <CAPM=9tx7MZKWMgP1RhtHASS7-Fxz3eTPg1WLEgiYShuXoQ53fw@mail.gmail.com>
Subject: [git pull] drm fixes for 6.19-rc2
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

Hope the diving went well, rc2 fixes for the week, mostly xe, with
amdgpu as usual. Then a smattering of small fixes across the
core/tests/panel and amdxdna.

I expect things will be quiet for rc3/4 as teams take a break, and I'm
travelling but will keep an eye on things.

Regards,
Dave.

drm-fixes-2025-12-20:
drm fixes for 6.19-rc2

core:
- fix gem handle leak on DRM_IOCTL_GEM_CHANGE_HANDLE

tests:
- add EDEADLK handling

amdgpu:
- Fix no_console_suspend handling
- DCN 3.5.x seamless boot fixes
- DP audio fix
- Fix race in GPU recovery
- SMU 14 OD fix

amdkfd:
- Event fix

xe:
- Limit num_syncs to prevent oversized kernel allocations
- Disallow 0 OA property values
- Disallow 0 EU stall property values
- Fix kobject leak
- Workaround
- Loop variable reference fix
- Fix a CONFIG corner-case incorrect number of argument
- Skip reason prefix while emitting array
- VF migration fix
- Fix context in mei interrupt top half
- Don't include the CCS metadata in the dma-buf sg-table
- VF queueing recovery work fix
- Increase TDF timeout
- GT reset registers vs scheduler ordering fix
- Adjust long-running workload timeslices
- Always set OA_OAGLBCTXCTRL_COUNTER_RESUME
- Fix a return value
- Drop preempt-fences when destroying imported dma-bufs
- Use usleep_range for accurate long-running workload timeslicing

amdxdna:
- don't load virtualized

panel:
- fix visionox-rm69299 Kconfig dependency
- sony-td4353-jdi probing fix
The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8=
:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-12-20

for you to fetch changes up to f66ac60dee28d092bc6a3af33a04147bfcb6ba30:

  Merge tag 'drm-xe-fixes-2025-12-19' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
(2025-12-19 10:56:13 +1000)

----------------------------------------------------------------
drm fixes for 6.19-rc2

core:
- fix gem handle leak on DRM_IOCTL_GEM_CHANGE_HANDLE

tests:
- add EDEADLK handling

amdgpu:
- Fix no_console_suspend handling
- DCN 3.5.x seamless boot fixes
- DP audio fix
- Fix race in GPU recovery
- SMU 14 OD fix

amdkfd:
- Event fix

xe:
- Limit num_syncs to prevent oversized kernel allocations
- Disallow 0 OA property values
- Disallow 0 EU stall property values
- Fix kobject leak
- Workaround
- Loop variable reference fix
- Fix a CONFIG corner-case incorrect number of argument
- Skip reason prefix while emitting array
- VF migration fix
- Fix context in mei interrupt top half
- Don't include the CCS metadata in the dma-buf sg-table
- VF queueing recovery work fix
- Increase TDF timeout
- GT reset registers vs scheduler ordering fix
- Adjust long-running workload timeslices
- Always set OA_OAGLBCTXCTRL_COUNTER_RESUME
- Fix a return value
- Drop preempt-fences when destroying imported dma-bufs
- Use usleep_range for accurate long-running workload timeslicing

amdxdna:
- don't load virtualized

panel:
- fix visionox-rm69299 Kconfig dependency
- sony-td4353-jdi probing fix

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu: fix a job->pasid access race in gpu recovery

Arnd Bergmann (1):
      drm/xe: fix drm_gpusvm_init() arguments

Ashutosh Dixit (3):
      drm/xe/oa: Always set OAG_OAGLBCTXCTRL_COUNTER_RESUME
      drm/xe/oa: Disallow 0 OA property values
      drm/xe/eustall: Disallow 0 EU stall property values

Brian Kocoloski (1):
      drm/amdkfd: Fix improper NULL termination of queue restore SMI
event string

Charlene Liu (1):
      drm/amd/display: Fix DP no audio issue

Dan Carpenter (1):
      drm/xe/xe_sriov_vfio: Fix return value in
xe_sriov_vfio_migration_supported()

Dave Airlie (3):
      Merge tag 'amd-drm-fixes-6.19-2025-12-17' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2025-12-18' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2025-12-19' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes

Guido G=C3=BCnther (1):
      drm/panel: visionox-rm69299: Depend on BACKLIGHT_CLASS_DEVICE

Jagmeet Randhawa (1):
      drm/xe: Increase TDF timeout

Jan Maslak (1):
      drm/xe: Restore engine registers before restarting schedulers
after GT reset

Jos=C3=A9 Exp=C3=B3sito (3):
      drm/tests: hdmi: Handle drm_kunit_helper_enable_crtc_connector()
returning EDEADLK
      drm/tests: Handle EDEADLK in drm_test_check_valid_clones()
      drm/tests: Handle EDEADLK in set_up_atomic_state()

Junxiao Chang (1):
      drm/me/gsc: mei interrupt top half should be in irq disabled context

Karol Wachowski (1):
      drm: Fix object leak in DRM_IOCTL_GEM_CHANGE_HANDLE

Maarten Lankhorst (1):
      Merge remote-tracking branch 'drm/drm-fixes' into drm-misc-fixes

Marijn Suijten (1):
      drm/panel: sony-td4353-jdi: Enable prepare_prev_first

Mario Limonciello (AMD) (2):
      accel/amdxdna: Block running under a hypervisor
      drm/amd: Resume the device in thaw() callback when console
suspend is disabled

Matthew Brost (3):
      drm/xe: Do not reference loop variable directly
      drm/xe: Adjust long-running workload timeslices to reasonable values
      drm/xe: Use usleep_range for accurate long-running workload timeslici=
ng

Raag Jadav (1):
      drm/xe/throttle: Skip reason prefix while emitting array

Ray Wu (2):
      drm/amd/display: Fix scratch registers offsets for DCN35
      drm/amd/display: Fix scratch registers offsets for DCN351

Satyanarayana K V P (1):
      drm/xe/vf: Fix queuing of recovery work

Shuicheng Lin (3):
      drm/xe: Fix freq kobject leak on sysfs_create_files failure
      drm/xe: Limit num_syncs to prevent oversized allocations
      drm/xe/oa: Limit num_syncs to prevent oversized allocations

Thomas Hellstr=C3=B6m (2):
      drm/xe/bo: Don't include the CCS metadata in the dma-buf sg-table
      drm/xe: Drop preempt-fences when destroying imported dma-bufs.

Tomasz Lis (1):
      drm/xe/vf: Stop waiting for ring space on VF post migration recovery

Vinay Belgaumkar (1):
      drm/xe: Apply Wa_14020316580 in xe_gt_idle_enable_pg()

mythilam (1):
      drm/amd/pm: restore SCLK settings after S0ix resume

 drivers/accel/amdxdna/aie2_pci.c                   |   6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   5 +-
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c        |   2 +-
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |   8 +-
 .../amd/display/dc/resource/dcn35/dcn35_resource.c |   8 +-
 .../display/dc/resource/dcn351/dcn351_resource.c   |   8 +-
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c     |   5 +
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c   |  37 +++++-
 drivers/gpu/drm/drm_gem.c                          |   8 +-
 drivers/gpu/drm/panel/Kconfig                      |   1 +
 drivers/gpu/drm/panel/panel-sony-td4353-jdi.c      |   2 +
 drivers/gpu/drm/tests/drm_atomic_state_test.c      |  40 +++++-
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 143 +++++++++++++++++=
++++
 drivers/gpu/drm/xe/xe_bo.c                         |  15 +--
 drivers/gpu/drm/xe/xe_device.c                     |   2 +-
 drivers/gpu/drm/xe/xe_dma_buf.c                    |   2 +-
 drivers/gpu/drm/xe/xe_eu_stall.c                   |   2 +-
 drivers/gpu/drm/xe/xe_exec.c                       |   3 +-
 drivers/gpu/drm/xe/xe_gt.c                         |   7 +-
 drivers/gpu/drm/xe/xe_gt_freq.c                    |   4 +-
 drivers/gpu/drm/xe/xe_gt_idle.c                    |   8 ++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c                |   2 +-
 drivers/gpu/drm/xe/xe_gt_throttle.c                |   2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c                 |  35 ++++-
 drivers/gpu/drm/xe/xe_heci_gsc.c                   |   4 +-
 drivers/gpu/drm/xe/xe_oa.c                         |  12 +-
 drivers/gpu/drm/xe/xe_sriov_vfio.c                 |   2 +-
 drivers/gpu/drm/xe/xe_svm.h                        |   2 +-
 drivers/gpu/drm/xe/xe_vm.c                         |   8 +-
 drivers/gpu/drm/xe/xe_vm_types.h                   |   2 +-
 drivers/gpu/drm/xe/xe_wa.c                         |   8 --
 drivers/gpu/drm/xe/xe_wa_oob.rules                 |   1 +
 include/uapi/drm/xe_drm.h                          |   1 +
 34 files changed, 331 insertions(+), 74 deletions(-)
