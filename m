Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC717980A4
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 04:45:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7266810E23D;
	Fri,  8 Sep 2023 02:45:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E4E10E23D
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 02:45:27 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-99bf3f59905so192362566b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Sep 2023 19:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694141125; x=1694745925; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AE7MLlyKzKnW8KbkXy/hN56gB9THGhL3oPrJXS0wp+Y=;
 b=NNPrwMpkkjyJu+SZRnY0zSiCXcjZjb7MXuONlLYmADkoChPeHzbvh06khYX7fg5u4W
 XnW0Ix7Oi8/JyruRmEHkh5umMtg97HDC+WwmWm1gvyc8GRbmP/s2RTt+xbcSUpVs1R4T
 jGxy645yCj8V5ujNSGYxWNcLNW4K4wQ4aSMHgkM5DBaoypHtTGN7w/pz1LFvPuDeCbwx
 pE1e4iGdbXsxftuFJkYGfHOKoxWBA+io0zKgKsG9y8HOLQKUXq8UvNetrWKKqxW4MXBB
 SuSrrAx5hBYWjfzBJ1Nlf3eDo69Y+EG4bn+fWiGKl71Be3+ggePc6BZzyTnAxHuxsRGD
 JyUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694141125; x=1694745925;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AE7MLlyKzKnW8KbkXy/hN56gB9THGhL3oPrJXS0wp+Y=;
 b=j+AUNpYKXAStI4DgI4uAPyJgWhTbvcRaiz75PnegV3v8eZj5feVnAP1huXumNwXnG4
 v/Qyr0dwLtKuInxwkAAtZzzzt8nx6foWVL3Bu1YyvRT0NQpQJFCSEa1f/xo3Y/jQYJTq
 /wOduYlffqqQIbG8PAuCOf8C4aeM0cE5BZdzl2h1uvKbSR4sJhTTzEJc8p4JIzygzDiI
 zggQcFGPQJyAItYe0cb6e6lt4kMFEOJHxkq+q1q9vAS3Aqe5NOJZvHo+JB+dCx2HdPFu
 H9iYhPKqUwpB6F2oxHMuBF3BgtMQn4DIxzB//nYan9XVqaZLvmvARDnAZFREqIRJuM5l
 HV6w==
X-Gm-Message-State: AOJu0YzpehG60+lsffwBtNBF8pDLmsUlTL82SydJI+J+VTS351fvfufA
 7CuMz9JAAPE6bALWx2IgXed00r3/16CB+DOk3aQ=
X-Google-Smtp-Source: AGHT+IHkaoqO2XBgmjUmmjkYRbPvStLOoioqR244T3VEXGe+YNSPrE+RQjnNrDNkHGFiCn9N+bgLv236T3DN3mtgIl8=
X-Received: by 2002:a17:906:d84:b0:9a9:e659:a8aa with SMTP id
 m4-20020a1709060d8400b009a9e659a8aamr680981eji.57.1694141125036; Thu, 07 Sep
 2023 19:45:25 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 8 Sep 2023 12:45:13 +1000
Message-ID: <CAPM=9tx-wOoVEc96nkOh=E5rDhsn-QM+QJF5oeYQK-yi2Cy8uQ@mail.gmail.com>
Subject: [git pull] drm fixes for 6.6-rc1
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

Regular rounds of rc1 fixes, a large bunch for amdgpu since it's 3
weeks in one go, one i915, one nouveau and one ivpu. I think there
might be a few more fixes in misc that I haven't pulled in yet, but we
should get them all for rc2.

Just a poke about the outstanding drm CI support pull request since I
haven't see any movement on that in the week, hopefully it's not as
difficult a problem as bcachefs :-)

Thanks,
Dave.

drm-next-2023-09-08:
drm fixes for 6.6-rc1

amdgpu:
- Display replay fixes
- Fixes for headless boards
- Fix documentation breakage
- RAS fixes
- Handle newer IP discovery tables
- SMU 13.0.6 fixes
- SR-IOV fixes
- Display vstartup fixes
- NBIO 7.9 fixes
- Display scaling mode fixes
- Debugfs power reporting fix
- GC 9.4.3 fixes
- Dirty framebuffer fixes for fbcon
- eDP fixes
- DCN 3.1.5 fix
- Display ODM fixes
- GPU core dump fix
- Re-enable zops property now that IGT test is fixed
- Fix possible UAF in CS code
- Cursor degamma fix

amdkfd:
- HMM fixes
- Interrupt masking fix
- GFX11 MQD fixes

i915:
- Mark requests for GuC virtual engines to avoid use-after-free

nouveau:
- Fix fence state in nouveau_fence_emit()

ivpu:
- replace strncpy
The following changes since commit 3698a75f5a98d0a6599e2878ab25d30a82dd836a=
:

  Merge tag 'drm-intel-next-fixes-2023-08-24' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next (2023-08-25
12:55:55 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-next-2023-09-08

for you to fetch changes up to 43ffcd6fa1635f479ad73145dfbba59edc2b3b28:

  Merge tag 'amd-drm-fixes-6.6-2023-09-06' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next (2023-09-08
10:44:07 +1000)

----------------------------------------------------------------
drm fixes for 6.6-rc1

amdgpu:
- Display replay fixes
- Fixes for headless boards
- Fix documentation breakage
- RAS fixes
- Handle newer IP discovery tables
- SMU 13.0.6 fixes
- SR-IOV fixes
- Display vstartup fixes
- NBIO 7.9 fixes
- Display scaling mode fixes
- Debugfs power reporting fix
- GC 9.4.3 fixes
- Dirty framebuffer fixes for fbcon
- eDP fixes
- DCN 3.1.5 fix
- Display ODM fixes
- GPU core dump fix
- Re-enable zops property now that IGT test is fixed
- Fix possible UAF in CS code
- Cursor degamma fix

amdkfd:
- HMM fixes
- Interrupt masking fix
- GFX11 MQD fixes

i915:
- Mark requests for GuC virtual engines to avoid use-after-free

nouveau:
- Fix fence state in nouveau_fence_emit()

ivpu:
- replace strncpy

----------------------------------------------------------------
Alex Deucher (1):
      drm/amd/pm: fix debugfs pm_info output

Alex Sierra (2):
      drm/amdkfd: retry after EBUSY is returned from hmm_ranges_get_pages
      drm/amdkfd: use mask to get v9 interrupt sq data bits correctly

Andrzej Hajda (1):
      drm/i915: mark requests for GuC virtual engines to avoid use-after-fr=
ee

Andr=C3=A9 Almeida (1):
      drm/amdgpu: Allocate coredump memory in a nonblocking way

Asad Kamal (3):
      drm/amd/pm: Update SMUv13.0.6 PMFW headers
      drm/amd/pm: Add critical temp for GC v9.4.3
      drm/amd/pm: Fix critical temp unit of SMU v13.0.6

Bhawanpreet Lakha (1):
      drm/amd/display: Enable Replay for static screen use cases

Bokun Zhang (1):
      drm/amdgpu/pm: Add notification for no DC support

Candice Li (1):
      drm/amdgpu: Only support RAS EEPROM on dGPU platform

Christian K=C3=B6nig (1):
      drm/amdgpu: fix amdgpu_cs_p1_user_fence

ChunTao Tso (1):
      drm/amd/display: set minimum of VBlank_nom

Danilo Krummrich (1):
      drm/nouveau: fence: fix undefined fence state after emit

Dave Airlie (3):
      Merge tag 'drm-misc-next-fixes-2023-09-01' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'drm-intel-next-fixes-2023-08-31' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'amd-drm-fixes-6.6-2023-09-06' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next

Fudong Wang (1):
      drm/amd/display: Add smu write msg id fail retry process

Gabe Teeger (1):
      drm/amd/display: Remove wait while locked

Hamza Mahfooz (7):
      drm/amd/display: fix mode scaling (RMX_.*)
      drm/amdgpu: register a dirty framebuffer callback for fbcon
      drm/amd/display: register edp_backlight_control() for DCN301
      Revert "Revert "drm/amd/display: Implement zpos property""
      Revert "drm/amd/display: Remove v_startup workaround for dcn3+"
      drm/amd/display: limit the v_startup workaround to ASICs older than D=
CN3.1
      drm/amd/display: prevent potential division by zero errors

Hawking Zhang (4):
      drm/amdgpu: Fix the return for gpu mode1_reset
      drm/amdgpu: Add umc_info v4_0 structure
      drm/amdgpu: Support query ecc cap for aqua_vanjaram
      drm/amdgpu: Free ras cmd input buffer properly

Horace Chen (1):
      drm/amdkfd: use correct method to get clock under SRIOV

Jay Cornwall (1):
      drm/amdkfd: Add missing gfx11 MQD manager callbacks

Justin Stitt (1):
      accel/ivpu: refactor deprecated strncpy

Le Ma (2):
      drm/amdgpu: update mall info v2 from discovery
      drm/amdgpu: update gc_info v2_1 from discovery

Lijo Lazar (6):
      Documentation/gpu: Update amdgpu documentation
      drm/amdgpu: Unset baco dummy mode on nbio v7.9
      drm/amdgpu: Add bootloader status check
      drm/amdgpu: Add bootloader wait for PSP v13
      drm/amdgpu: Add SMU v13.0.6 default reset methods
      drm/amdgpu: Restrict bootloader wait to SMUv13.0.6

Mangesh Gadre (2):
      drm/amdgpu: Remove SRAM clock gater override by driver
      drm/amdgpu: Updated TCP/UTCL1 programming

Melissa Wen (1):
      drm/amd/display: enable cursor degamma for DCN3+ DRM legacy gamma

Ovidiu Bunea (1):
      drm/amd/display: Roll back unit correction

Rajneesh Bhardwaj (1):
      drm/amdgpu: Hide xcp partition sysfs under SRIOV

Reza Amini (1):
      drm/amd/display: Correct unit conversion for vstartup

Samir Dhume (1):
      drm/amdgpu/jpeg - skip change of power-gating state for sriov

SungHuai Wang (1):
      drm/amd/display: fix static screen detection setting

Tao Zhou (1):
      drm/amdgpu: use read-modify-write mode for gfx v9_4_3 SQ setting

Wenjing Liu (3):
      Partially revert "drm/amd/display: update add plane to context
logic with a new algorithm"
      drm/amd/display: update blank state on ODM changes
      drm/amd/display: always switch off ODM before committing more streams

YiPeng Chai (1):
      drm/amdgpu: Enable ras for mp0 v13_0_6 sriov

 Documentation/gpu/amdgpu/driver-misc.rst           |   8 +-
 drivers/accel/ivpu/ivpu_jsm_msg.c                  |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   |  18 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |  18 +---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  30 +++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |  15 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |  26 ++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  11 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  15 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |   3 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |  26 ++---
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c           |   6 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c             |  18 ++++
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |  40 ++++++-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c   |   3 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |   2 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  24 ++++-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |   9 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |  16 +++
 drivers/gpu/drm/amd/display/dc/Makefile            |   1 +
 .../drm/amd/display/dc/clk_mgr/dcn315/dcn315_smu.c |  20 +++-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  68 ++++++++----
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |  47 ++------
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |  17 +++
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.h |   2 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_init.c  |   2 +-
 .../gpu/drm/amd/display/dc/dcn301/dcn301_init.c    |   1 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c  |   2 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_init.c    |   2 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c  |   2 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  | 118 +++++++++++++++++=
+++-
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |  25 +----
 .../gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c |  21 +++-
 .../drm/amd/display/modules/freesync/freesync.c    |   9 +-
 drivers/gpu/drm/amd/include/amd_shared.h           |   2 +
 drivers/gpu/drm/amd/include/atomfirmware.h         |  18 ++++
 drivers/gpu/drm/amd/include/discovery.h            |  38 ++++++-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  11 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |   5 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_0_ppsmc.h   |   5 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_pmfw.h    |   4 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_ppsmc.h   |  16 ++-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |   4 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |   8 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   2 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |  54 +++++++++-
 drivers/gpu/drm/i915/gt/intel_engine_types.h       |   1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |   3 +
 drivers/gpu/drm/i915/i915_request.c                |   7 +-
 drivers/gpu/drm/nouveau/dispnv04/crtc.c            |   9 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c               |   8 +-
 drivers/gpu/drm/nouveau/nouveau_chan.c             |   6 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c             |   9 +-
 drivers/gpu/drm/nouveau/nouveau_exec.c             |  11 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c            |  32 ++++--
 drivers/gpu/drm/nouveau/nouveau_fence.h            |   5 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c              |   5 +-
 62 files changed, 684 insertions(+), 227 deletions(-)
