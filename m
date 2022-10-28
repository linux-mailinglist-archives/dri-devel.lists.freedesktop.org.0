Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EF661090F
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 05:53:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5373710E0FF;
	Fri, 28 Oct 2022 03:53:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1FDA10E0FF
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 03:53:36 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id 8so2733267qka.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 20:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=csxtsYMGCIx4YxDQEX2STyxOPQoLuAotv7RhjPzEXxE=;
 b=frQgc4X++G6pmWKbB5E7HFSvwUjbTnmw5Nz4yKkVH9abORXczCbIqxJLWNaiJzBdiu
 Srsn3dM8jWiRoWmIj7RI59E4DnshQ6XnHmLFL/sn1uMEkTvBnWn0UKoEZNZSdIqSKqFY
 +ZyIMW108NkqP/VxqNbpwm2FwRUTomUYEDjFoviXJG3hg8LBUobPU1VsunqsfchlEpkE
 BAU5+k5a5SnrVi2oMzhI0vqhb3ZqOwNAr4nxeo/9d4Gk2KmhF1gshhVVeoukklj79q4V
 Vaf4nsK1nQKQzy+7Bt+poRzMqUW3b1P+YfRFjmN4YjJlXmbv0fsbswT65VNmSMwLqaAz
 MvTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=csxtsYMGCIx4YxDQEX2STyxOPQoLuAotv7RhjPzEXxE=;
 b=EJvs5Tt0hqg3Zw0jfpMG2UUNxll15je4AL7L1mBnW7cIWsLmFG7SychsesRlHlC6Ky
 4AS44IStDe88ncz0WhXOXE9NrZ4J255a0amN2BwnPGF5Kq5SEJjs8JmXFq4D8YXYU8vC
 /52Wz0nD7Az3bf1qvtjnb2iQv6kK1/VnwWOctBOprvyqeDwI1gvqpnMPWFgOZQW15Djr
 dCKUsZ/X87ClIp/2vFjcbgGJfhRfygHks3wDD7FZki9UQRGYpBrlo0oYExkkjrR8FEM5
 ebiGFt29btcamKEUK9rmPIYGcBbsgN5gmz+2l2JA76T6SqpDtEcCLUaDKskg5JglmvZF
 9Btw==
X-Gm-Message-State: ACrzQf2yYfTIfIM8zXTGvxsvFzrhxhjVEY/Zro8oLaY49PfMWY6MhSfh
 DBq7/YUJdra0bnFxkChNqNChpobgta6I+1TpBWyQMVTldzc=
X-Google-Smtp-Source: AMsMyM733oU4o4uxNY7fagMoGdT8I7WBIseobv9GurseIBaTQDJNhBXPp2HNOgsZUWXKpoN4fdChGNFVJC7K4m84YcY=
X-Received: by 2002:a37:5a46:0:b0:6f9:ffc5:a9cb with SMTP id
 o67-20020a375a46000000b006f9ffc5a9cbmr3667042qkb.638.1666929215862; Thu, 27
 Oct 2022 20:53:35 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 28 Oct 2022 13:53:24 +1000
Message-ID: <CAPM=9tz-_RXszedVsU-Wx64==1dihXzoMLzT6ghOD8ATwJ8rWA@mail.gmail.com>
Subject: [git pull] drm fixes for 6.1-rc3
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

Regularly scheduled fixes for drm, live from a Red Hat office for the
first time in a while.

The core has two fixes, one for scheduler leak and one for aperture
uninit read. Otherwise a single bridge fix, and msm, amdgpu/kfd and
i915 have a set of fixes each.

Regards,
Dave

drm-fixes-2022-10-28:
drm fixes for 6.1-rc3

sched:
- Stop leaking fences when killing a sched entity.

aperture:
- Avoid uninitialized read in aperture_remove_conflicting_pci_device()

bridge:
- Fix HPD on bridge/ps8640.

msm:
- Fix shrinker deadlock
- Fix crash during suspend after unbind
- Fix IRQ lifetime issues
- Fix potential memory corruption with too many bridges
- Fix memory corruption on GPU state capture

amdgpu:
- Stable pstate fix
- SMU 13.x updates
- SR-IOV fixes
- PCI AER fix
- GC 11.x fixes
- Display fixes
- Expose IMU firmware version for debugging
- Plane modifier fix
- S0i3 fix

amdkfd:
- Fix possible memory leak
- Fix GC 10.x cache info reporting

i915:
- Extend Wa_1607297627 to Alderlake-P
- Keep PCI autosuspend control 'on' by default on all dGPU
- Reset frl trained flag before restarting FRL training
The following changes since commit 247f34f7b80357943234f93f247a1ae6b6c3a740=
:

  Linux 6.1-rc2 (2022-10-23 15:27:33 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-10-28

for you to fetch changes up to b2196401949ed2517bec676928f837e6bbd01a65:

  Merge tag 'drm-misc-fixes-2022-10-27' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2022-10-28
13:00:15 +1000)

----------------------------------------------------------------
drm fixes for 6.1-rc3

sched:
- Stop leaking fences when killing a sched entity.

aperture:
- Avoid uninitialized read in aperture_remove_conflicting_pci_device()

bridge:
- Fix HPD on bridge/ps8640.

msm:
- Fix shrinker deadlock
- Fix crash during suspend after unbind
- Fix IRQ lifetime issues
- Fix potential memory corruption with too many bridges
- Fix memory corruption on GPU state capture

amdgpu:
- Stable pstate fix
- SMU 13.x updates
- SR-IOV fixes
- PCI AER fix
- GC 11.x fixes
- Display fixes
- Expose IMU firmware version for debugging
- Plane modifier fix
- S0i3 fix

amdkfd:
- Fix possible memory leak
- Fix GC 10.x cache info reporting

i915:
- Extend Wa_1607297627 to Alderlake-P
- Keep PCI autosuspend control 'on' by default on all dGPU
- Reset frl trained flag before restarting FRL training

----------------------------------------------------------------
Aashish Sharma (1):
      drm/msm: Remove redundant check for 'submit'

Akhil P Oommen (2):
      drm/msm/a6xx: Replace kcalloc() with kvzalloc()
      drm/msm/gpu: Fix crash during system suspend after unbind

Alvin Lee (1):
      drm/amd/display: Don't return false if no stream

Ankit Nautiyal (1):
      drm/i915/dp: Reset frl trained flag before restarting FRL training

Anshuman Gupta (1):
      drm/i915/dgfx: Keep PCI autosuspend control 'on' by default on all dG=
PU

Chengming Gui (1):
      drm/amdgpu: fix pstate setting issue

Christian K=C3=B6nig (1):
      drm/scheduler: fix fence ref counting

Colin Ian King (1):
      drm/msm: Kconfig: Fix spelling mistake "throught" -> "through"

Dave Airlie (4):
      Merge tag 'drm-msm-fixes-2022-10-24' of
https://gitlab.freedesktop.org/drm/msm into drm-fixes
      Merge tag 'amd-drm-fixes-6.1-2022-10-26-1' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-intel-fixes-2022-10-27-1' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'drm-misc-fixes-2022-10-27' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes

David Francis (1):
      drm/amd: Add IMU fw version to fw version queries

Douglas Anderson (1):
      drm/bridge: ps8640: Add back the 50 ms mystery delay after HPD

Jesse Zhang (1):
      drm/amdkfd: correct the cache info for gfx1036

Joaqu=C3=ADn Ignacio Aramend=C3=ADa (1):
      drm/amd/display: Revert logic for plane modifiers

Johan Hovold (8):
      drm/msm: fix use-after-free on probe deferral
      drm/msm/dp: fix memory corruption with too many bridges
      drm/msm/dsi: fix memory corruption with too many bridges
      drm/msm/hdmi: fix memory corruption with too many bridges
      drm/msm/dp: fix IRQ lifetime
      drm/msm/dp: fix aux-bus EP lifetime
      drm/msm/dp: fix bridge lifetime
      drm/msm/hdmi: fix IRQ lifetime

Jos=C3=A9 Roberto de Souza (1):
      drm/i915: Extend Wa_1607297627 to Alderlake-P

Kenneth Feng (2):
      drm/amd/pm: update driver-if header for smu_v13_0_10
      drm/amd/pm: allow gfxoff on gc_11_0_3

Kuogee Hsieh (2):
      drm/msm/dp: add atomic_check to bridge ops
      drm/msm/dp: cleared DP_DOWNSPREAD_CTRL register before start link tra=
ining

Lijo Lazar (1):
      drm/amdgpu: Remove ATC L2 access for MMHUB 2.1.x

Maarten Lankhorst (1):
      Merge remote-tracking branch 'drm/drm-fixes' into drm-misc-fixes

Micha=C5=82 Miros=C5=82aw (1):
      fbdev/core: Avoid uninitialized read in
aperture_remove_conflicting_pci_device()

Nathan Huckleberry (1):
      drm/msm: Fix return type of mdp4_lvds_connector_mode_valid

Prike Liang (2):
      drm/amdkfd: update gfx1037 Lx cache setting
      drm/amdgpu: disallow gfxoff until GC IP blocks complete s2idle resume

Rafael Mendonca (1):
      drm/amdkfd: Fix memory leak in kfd_mem_dmamap_userptr()

Rob Clark (4):
      drm/msm/gem: Unpin objects slightly later
      drm/msm/a6xx: Fix kvzalloc vs state_kcalloc usage
      drm/msm/a6xx: Skip snapshotting unused GMU buffers
      drm/msm/a6xx: Remove state objects from list before freeing

Rodrigo Siqueira (1):
      drm/amd/display: Remove wrong pipe control lock

Yiqing Yao (1):
      drm/amdgpu: Adjust MES polling timeout for sriov

YuBiao Wang (1):
      drm/amdgpu: skip mes self test for gc 11.0.3 in recover

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  18 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |  13 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h        |   1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   1 +
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |   9 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c            |  28 ++----
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              | 106 +++++++++++++++++=
++-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |  50 ++--------
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |  12 +--
 .../amd/display/dc/dcn32/dcn32_resource_helpers.c  |   2 +-
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h | 111 +++++++++++++++--=
----
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |   2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |   7 +-
 drivers/gpu/drm/bridge/parade-ps8640.c             |  25 ++++-
 drivers/gpu/drm/i915/display/intel_dp.c            |   2 +
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |   4 +-
 drivers/gpu/drm/i915/intel_runtime_pm.c            |  11 +-
 drivers/gpu/drm/msm/Kconfig                        |   2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |  14 ++-
 drivers/gpu/drm/msm/adreno/adreno_device.c         |  10 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |   7 +-
 .../gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c    |   5 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |  13 +--
 drivers/gpu/drm/msm/dp/dp_display.c                |  23 ++++-
 drivers/gpu/drm/msm/dp/dp_drm.c                    |  34 +++++++
 drivers/gpu/drm/msm/dp/dp_parser.c                 |   6 +-
 drivers/gpu/drm/msm/dp/dp_parser.h                 |   5 +-
 drivers/gpu/drm/msm/dsi/dsi.c                      |   6 ++
 drivers/gpu/drm/msm/hdmi/hdmi.c                    |   7 +-
 drivers/gpu/drm/msm/msm_drv.c                      |   1 +
 drivers/gpu/drm/msm/msm_gem_submit.c               |   9 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |   2 +
 drivers/gpu/drm/msm/msm_gpu.h                      |   4 +
 drivers/gpu/drm/msm/msm_ringbuffer.c               |   3 +-
 drivers/gpu/drm/scheduler/sched_entity.c           |   6 +-
 drivers/video/aperture.c                           |   5 +-
 include/uapi/drm/amdgpu_drm.h                      |   2 +
 41 files changed, 421 insertions(+), 161 deletions(-)
