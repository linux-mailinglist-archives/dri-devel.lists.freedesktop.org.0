Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E8E606C86
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 02:37:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 063C310E294;
	Fri, 21 Oct 2022 00:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5302D10E294
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 00:37:47 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id d26so3433304ejc.8
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 17:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=N9JzvfS9O+EbweznXiTBcEQbOEkl2pnGtGUVAn/P3LE=;
 b=kaxgzXomD6F9reHPyLw0Yop2cEiip9OlRnQvGdD7sb7tK/1WbrQJCxfj59xNBymB76
 iIvEbOA3inPGEIfQvN+AfNwkC8/V/ggwOC0x8hvxnG7dd9lxJmSGjuCEmULa9FiJtqIz
 tJXchW8JjVAsTRDW5ik5etzCUVTIrp/EtNViDDjH64meE+nYOBXAw6N5DFeg+pBkRgOC
 XtkkTxoSkPbYO0RWRiXGSIJgvOy92u/90VIxe+WU0z8OjH2Ir34UIw+dG9lE+GZaWIJV
 jNi7C3d6/8bykrZ3k21iS9cSyXlcxTgLPNSSRepeNt4ah0258JmpUENUckbwee8E8R0B
 +qWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N9JzvfS9O+EbweznXiTBcEQbOEkl2pnGtGUVAn/P3LE=;
 b=vE80JpTMF+mzIwo/ERz2A8kXtzRWe7VGrxJMEzT8UshQRKVpgskOyeDIsFB5xkzBBw
 iAgmfW6h0Cpzi4Mh+Gi0V7WkQ1DWarGtjLSDYlVWGmgliZqz+L6Sxuqb5GCNTkdZME11
 /g71sZBM1XEIMe0pCoS52w8hTc469MmfGaUGkKfIvp2kaeiB3tXNiJpsTwbeYW3UmJmL
 3N5LrpfdVtFwHTIsWnQ1MLULu2PqLsM/IREeGpEewJPxK6vY+DZuLZdXQcnsAhYsQlvK
 YDib55kvWb0zSs73nG/43JpL5m0LZhjjE7fnBaolBaT+70pGYk5K7LTGVxVdWnSKMrEU
 9dNg==
X-Gm-Message-State: ACrzQf3zSYGZVjkf/lYhIYCyXGdU1Yjel0jdOn90WdnHMF5jwrDUEhOB
 sC9SyX7z5XyYt7BujNxSH1UfQpBnlisAY+AHoCM=
X-Google-Smtp-Source: AMsMyM6fHevdICVJB+NLRZRZGqKXiSKeIvrSjvipU5PiH7iuf+QLnXrrODo7FfxdEbL4iPZE8gnetm3rO9vLcl8JAwM=
X-Received: by 2002:a17:906:5a44:b0:78d:4c17:9856 with SMTP id
 my4-20020a1709065a4400b0078d4c179856mr13264057ejc.477.1666312665398; Thu, 20
 Oct 2022 17:37:45 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 21 Oct 2022 10:37:33 +1000
Message-ID: <CAPM=9tzqUzVrUMtmXT1AQAkjec6DziLkuLriKZJVXb6aTWkhXQ@mail.gmail.com>
Subject: [git pull] drm fixes for 6.1-rc2
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

Usual fixes for the week. The amdgpu contains fixes for two
regressions, one reported in response to rc1 which broke on SI GPUs,
and one gfx9 APU regression. Otherwise it's mostly fixes for new IP,
and some GPU reset fixes. vc4 is just HDMI fixes, and panfrost has
some mnor types fixes.

Dave.

drm-fixes-2022-10-21:
drm fixes for 6.1-rc2

core:
- fix connector DDC pointer
- fix buffer overflow in format_helper_test

amdgpu:
- Mode2 reset fixes for Sienna Cichlid
- Revert broken fan speed sensor fix
- SMU 13.x fixes
- GC 11.x fixes
- RAS fixes
- SR-IOV fixes
- Fix BO move breakage on SI
- Misc compiler fixes
- Fix gfx9 APU regression caused by PCI AER fix

vc4:
- HDMI fixes

panfrost:
- compiler fixes
The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780=
:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-10-21

for you to fetch changes up to cbc543c59e8e7c8bc8604d6ac3e18a029e3d5118:

  Merge tag 'drm-misc-fixes-2022-10-20' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2022-10-21
09:56:14 +1000)

----------------------------------------------------------------
drm fixes for 6.1-rc2

core:
- fix connector DDC pointer
- fix buffer overflow in format_helper_test

amdgpu:
- Mode2 reset fixes for Sienna Cichlid
- Revert broken fan speed sensor fix
- SMU 13.x fixes
- GC 11.x fixes
- RAS fixes
- SR-IOV fixes
- Fix BO move breakage on SI
- Misc compiler fixes
- Fix gfx9 APU regression caused by PCI AER fix

vc4:
- HDMI fixes

panfrost:
- compiler fixes

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu: fix sdma doorbell init ordering on APUs

Arunpravin Paneer Selvam (1):
      drm/amdgpu: Fix for BO move issue

Asher Song (1):
      drm/amdgpu: Revert "drm/amdgpu: getting fan speed pwm for vega10 prop=
erly"

Christian K=C3=B6nig (2):
      drm/sched: add DRM_SCHED_FENCE_DONT_PIPELINE flag
      drm/amdgpu: use DRM_SCHED_FENCE_DONT_PIPELINE for VM updates

Danijel Slivka (1):
      drm/amdgpu: set vm_update_mode=3D0 as default for Sienna Cichlid
in SRIOV case

Dave Airlie (4):
      Merge tag 'drm-misc-fixes-2022-10-13' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'amd-drm-fixes-6.1-2022-10-19' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'amd-drm-fixes-6.1-2022-10-20' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2022-10-20' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes

David Gow (1):
      drm: tests: Fix a buffer overflow in format_helper_test

Evan Quan (3):
      drm/amd/pm: fulfill SMU13.0.0 cstate control interface
      drm/amd/pm: fulfill SMU13.0.7 cstate control interface
      drm/amd/pm: disable cstate feature for gpu reset scenario

Guenter Roeck (1):
      drm/amd/display: Increase frame size limit for display_mode_vba_util_=
32.o

Kenneth Feng (5):
      drm/amd/pm: temporarily disable thermal alert on smu_v13_0_10
      drm/amd/pm: remove the pptable id override on smu_v13_0_10
      drm/amd/amdgpu: enable gfx clock gating features on smu_v13_0_10
      drm/amd/pm: skip loading pptable from driver on secure board for
smu_v13_0_10
      drm/amd/pm: enable thermal alert on smu_v13_0_10

Likun Gao (1):
      drm/amdgpu: skip mes self test for gc 11.0.3

Maxime Ripard (4):
      drm/vc4: Add module dependency on hdmi-codec
      drm/vc4: hdmi: Enforce the minimum rate at runtime_resume
      drm/vc4: hdmi: Check the HSM rate at runtime_resume
      drm/connector: Set DDC pointer in drmm_connector_init

Nathan Chancellor (1):
      drm/amdkfd: Fix type of reset_type parameter in hqd_destroy() callbac=
k

Steven Price (2):
      drm/panfrost: Remove type name from internal structs
      drm/panfrost: replace endian-specific types with native ones

Thomas Zimmermann (1):
      Merge drm/drm-fixes into drm-misc-fixes

Tim Huang (2):
      drm/amd/pm: update SMU IP v13.0.4 driver interface version
      drm/amd/pm: add SMU IP v13.0.4 IF version define to V7

Victor Zhao (3):
      Revert "drm/amdgpu: add debugfs amdgpu_reset_level"
      Revert "drm/amdgpu: let mode2 reset fallback to default when failure"
      drm/amdgpu: Refactor mode2 reset logic for v11.0.7

YiPeng Chai (3):
      drm/amdgpu: Enable gmc soft reset on gmc_v11_0_3
      drm/amdgpu: Enable ras support for mp0 v13_0_0 and v13_0_10
      drm/amdgpu: Add sriov vf ras support in amdgpu_ras_asic_supported

Yifan Zha (1):
      drm/amdgpu: Program GC registers through RLCG interface in gfx_v11/gm=
c_v11

YuBiao Wang (1):
      drm/amdgpu: dequeue mes scheduler during fini

ZhenGuo Yin (1):
      drm/amd/pm: Init pm_attr_list when dpm is disabled

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  4 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |  2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 15 +++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            | 25 +++++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c          | 14 -------
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h          |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |  3 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  3 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |  6 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |  4 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  6 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c        |  9 ++++-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  3 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             | 18 +++++----
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             | 45 ++++++++++++++++++=
++--
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c              |  1 -
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |  1 -
 drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c              |  1 -
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |  5 ---
 drivers/gpu/drm/amd/amdgpu/sienna_cichlid.c        | 25 ++++++++----
 drivers/gpu/drm/amd/amdgpu/soc15.c                 | 21 ++++++++++
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |  7 +++-
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |  2 +-
 drivers/gpu/drm/amd/include/kgd_kfd_interface.h    |  5 ++-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  4 +-
 .../drm/amd/pm/powerplay/hwmgr/vega10_thermal.c    | 25 ++++++------
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  4 +-
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_4.h | 17 +++++++-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |  2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |  8 ++++
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |  9 +++++
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |  6 +--
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   | 11 ++++++
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   | 12 ++++++
 drivers/gpu/drm/drm_connector.c                    |  2 +-
 drivers/gpu/drm/panfrost/panfrost_dump.c           | 36 ++++++++---------
 drivers/gpu/drm/scheduler/sched_entity.c           |  3 +-
 drivers/gpu/drm/tests/drm_format_helper_test.c     |  2 +-
 drivers/gpu/drm/vc4/vc4_drv.c                      |  1 +
 drivers/gpu/drm/vc4/vc4_hdmi.c                     | 29 ++++++++++++++
 include/drm/gpu_scheduler.h                        |  9 +++++
 include/uapi/drm/panfrost_drm.h                    | 36 +++++++++--------
 45 files changed, 314 insertions(+), 134 deletions(-)
