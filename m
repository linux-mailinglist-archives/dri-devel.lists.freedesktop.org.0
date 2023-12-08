Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E1A809B36
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 05:54:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF8D110E12E;
	Fri,  8 Dec 2023 04:54:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5954710E12E
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 04:54:34 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a1d93da3eb7so201119666b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 20:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702011273; x=1702616073; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/NPSVNV86/gWAz2b/XLZN3N1S3hmdyNSP82JFLWw5pI=;
 b=Q6+6OLO3SWMiVEDV59hM8KPSddhYakPewJB7nCPmlp/Fw05xKNAlXLWjUn2qMbKZ0c
 kRRPm92w8faFGIDx5f4K9Ga7JNV3I7ERJKrHYkdIURxB+MeXS5rxYSZrhQuUdGBUVaxf
 r2uV1O7/b5k7hz9SWzP8w1H5oYL3MekX5USVke208T08mLoJU4KYrzPb0puu90nUZELZ
 ur1hOLNoE7Hc+lCxczO5aL0LOGHK0Y4BPbp7CRoKVL1FByuadrG1iTj0CheNbwKh1Kuc
 xae4mXnYGXL2SSQ4jvKsvxQV+6hEIF7YVais4hh4avt2Vf7sELRbkrx4eWz+yqf3ZMQ6
 1GEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702011273; x=1702616073;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/NPSVNV86/gWAz2b/XLZN3N1S3hmdyNSP82JFLWw5pI=;
 b=D8V8OEw8NSnWNOEbVO+NY/MxY/WUjdbPdn+7ylHo+dAWgU+DqFE/0lt9+0qjOM7Coo
 qsTWAf59i6qG0nM7aHm9/x/QwCkLYMHJdcJniQfaG08JpWYG0Rnc0fPhHZ7HcuqldeqA
 gqzyykigHXgXHMy71elJZrEitRFbeZPWSy+p861KTY+8f5P0d3wthW3Y4Pe4bfz8PzNs
 mOQj2C97usZ2Lpj25IL1YZ1QyFTl8tpMW1C53CSaGj1fTzlDBHmY9nHqXe+9e/f7eTUI
 qmatxQCwXoau+0X3yPdRJArYb2leqlnOxNBU/KwBLnG0EQUbNdIqCf+luagcNoGNvTHS
 lwlA==
X-Gm-Message-State: AOJu0YwKOlCi+UaUKCn0Equ04btKtaLkfps0s0u///deWlR+Y/Qhs8DW
 JQ+u4OaU/xTBsVH7caxnpQRZwLSPbxVtIPzFeLjIi8mZRt4=
X-Google-Smtp-Source: AGHT+IFLB57OGDBP8fo1a89v+gmIGr/S4E0K1KWoKUVGdn1jiPJKq+fR/olscdWIuA9wyvOkHThrqyxe6UOTFzGvTh4=
X-Received: by 2002:a17:906:e0d6:b0:a1c:aa9e:17e4 with SMTP id
 gl22-20020a170906e0d600b00a1caa9e17e4mr1931099ejb.49.1702011272323; Thu, 07
 Dec 2023 20:54:32 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 8 Dec 2023 14:54:20 +1000
Message-ID: <CAPM=9tw7vc_BOsPH0xAwFvx_ZCQyZ24ofp3pUt1MQe9QA_U5Mg@mail.gmail.com>
Subject: [git pull] drm fixes for 6.7-rc5
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

Regular weekly fixes, mostly amdgpu and i915 as usual. A couple of
nouveau, panfrost, one core and one bridge Kconfig.

Seems about normal for rc5,

Regards,
Dave.

drm-fixes-2023-12-08:
drm fixes for v6.7-rc5

atomic-helpers:
- invoke end_fb_access while owning plane state

i915:
- fix a missing dep for a previous fix
- Relax BXT/GLK DSI transcoder hblank limits
- Fix DP MST .mode_valid_ctx() return values
- Reject DP MST modes that require bigjoiner (as it's not yet
supported on DP MST)
- Fix _intel_dsb_commit() variable type to allow negative values

nouveau:
- document some bits of gsp rm
- flush vmm more on tu102 to avoid hangs

panfrost:
- fix imported dma-buf objects residency
- fix device freq update

bridge:
- tc358768 - fix Kconfig

amdgpu:
- Disable MCBP on gfx9
- DC vbios fix
- eDP fix
- dml2 UBSAN fix
- SMU 14 fix
- RAS fixes
- dml KASAN/KCSAN fix
- PSP 13 fix
- Clockgating fixes
- Suspend fix

exynos:
- fix pointer dereference
- fix wrong error check
The following changes since commit 33cc938e65a98f1d29d0a18403dbbee050dcad9a=
:

  Linux 6.7-rc4 (2023-12-03 18:52:56 +0900)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-12-08

for you to fetch changes up to b7b5a56acec819bb8dcd03c687e97a091b29d28f:

  Merge tag 'exynos-drm-next-for-v6.7-rc5' of
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into
drm-fixes (2023-12-08 13:55:32 +1000)

----------------------------------------------------------------
drm fixes for v6.7-rc5

atomic-helpers:
- invoke end_fb_access while owning plane state

i915:
- fix a missing dep for a previous fix
- Relax BXT/GLK DSI transcoder hblank limits
- Fix DP MST .mode_valid_ctx() return values
- Reject DP MST modes that require bigjoiner (as it's not yet
supported on DP MST)
- Fix _intel_dsb_commit() variable type to allow negative values

nouveau:
- document some bits of gsp rm
- flush vmm more on tu102 to avoid hangs

panfrost:
- fix imported dma-buf objects residency
- fix device freq update

bridge:
- tc358768 - fix Kconfig

amdgpu:
- Disable MCBP on gfx9
- DC vbios fix
- eDP fix
- dml2 UBSAN fix
- SMU 14 fix
- RAS fixes
- dml KASAN/KCSAN fix
- PSP 13 fix
- Clockgating fixes
- Suspend fix

exynos:
- fix pointer dereference
- fix wrong error check

----------------------------------------------------------------
Adri=C3=A1n Larumbe (2):
      drm/panfrost: Consider dma-buf imported objects as resident
      drm/panfrost: Fix incorrect updating of current device frequency

Alex Deucher (2):
      drm/amd/display: Increase frame warning limit with KASAN or KCSAN in =
dml
      drm/amdgpu: fix buffer funcs setting order on suspend

Alvin Lee (1):
      drm/amd/display: Use channel_width =3D 2 for vram table 3.0

Arnd Bergmann (1):
      drm/bridge: tc358768: select CONFIG_VIDEOMODE_HELPERS

Dave Airlie (6):
      nouveau/tu102: flush all pdbs on vmm flush
      Merge tag 'drm-intel-fixes-2023-12-01-1' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'drm-intel-fixes-2023-12-07' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'drm-misc-fixes-2023-12-07' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'amd-drm-fixes-6.7-2023-12-06' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'exynos-drm-next-for-v6.7-rc5' of
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into
drm-fixes

Hawking Zhang (1):
      drm/amdgpu: Update fw version for boot time error query

Inki Dae (1):
      drm/exynos: fix a wrong error checking

Ivan Lipski (1):
      drm/amd/display: Add monitor patch for specific eDP

Jiadong Zhu (1):
      drm/amdgpu: disable MCBP by default

Li Ma (1):
      drm/amd/swsmu: update smu v14_0_0 driver if version and metrics table

Lijo Lazar (4):
      drm/amdgpu: Restrict extended wait to PSP v13.0.6
      drm/amdgpu: Add NULL checks for function pointers
      drm/amdgpu: Update HDP 4.4.2 clock gating flags
      drm/amdgpu: Avoid querying DRM MGCG status

Roman Li (1):
      drm/amd/display: Fix array-index-out-of-bounds in dml2

Thomas Zimmermann (1):
      drm/atomic-helpers: Invoke end_fb_access while owning plane state

Timur Tabi (1):
      nouveau/gsp: document some aspects of GSP-RM

Ville Syrj=C3=A4l=C3=A4 (4):
      drm/i915: Check pipe active state in {planes,vrr}_{enabling,disabling=
}()
      drm/i915: Skip some timing checks on BXT/GLK DSI transcoders
      drm/i915/mst: Fix .mode_valid_ctx() return values
      drm/i915/mst: Reject modes that require the bigjoiner

Xiang Yang (1):
      drm/exynos: fix a potential error pointer dereference

Yang Wang (2):
      drm/amd/pm: support new mca smu error code decoding
      drm/amdgpu: optimize the printing order of error data

heminhong (1):
      drm/i915: correct the input parameter on _intel_dsb_commit()

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.h            |  2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            | 17 +++++
 drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c              |  5 ++
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             | 12 ++--
 drivers/gpu/drm/amd/amdgpu/soc15.c                 | 15 ++--
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |  6 ++
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |  8 ++-
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |  4 ++
 .../drm/amd/display/dc/dml2/display_mode_core.c    |  6 +-
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     | 17 +++++
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      | 10 +++
 .../pm/swsmu/inc/pmfw_if/smu14_driver_if_v14_0_0.h | 77 +++++++++++-------=
--
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |  9 ++-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c   | 46 +++++++++++-
 drivers/gpu/drm/bridge/Kconfig                     |  1 +
 drivers/gpu/drm/drm_atomic_helper.c                | 78 +++++++++++++-----=
--
 drivers/gpu/drm/exynos/exynos_drm_dma.c            |  8 +--
 drivers/gpu/drm/exynos/exynos_hdmi.c               |  2 +
 drivers/gpu/drm/i915/display/icl_dsi.c             |  7 ++
 drivers/gpu/drm/i915/display/intel_crt.c           |  5 ++
 drivers/gpu/drm/i915/display/intel_display.c       | 24 ++++++-
 drivers/gpu/drm/i915/display/intel_display.h       |  3 +
 drivers/gpu/drm/i915/display/intel_dp.c            |  4 ++
 drivers/gpu/drm/i915/display/intel_dp_mst.c        | 20 ++++--
 drivers/gpu/drm/i915/display/intel_dsb.c           |  2 +-
 drivers/gpu/drm/i915/display/intel_dvo.c           |  6 ++
 drivers/gpu/drm/i915/display/intel_hdmi.c          |  4 ++
 drivers/gpu/drm/i915/display/intel_lvds.c          |  5 ++
 drivers/gpu/drm/i915/display/intel_sdvo.c          |  8 ++-
 drivers/gpu/drm/i915/display/intel_tv.c            |  8 ++-
 drivers/gpu/drm/i915/display/vlv_dsi.c             | 18 ++++-
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |  2 +-
 .../common/shared/msgq/inc/msgq/msgq_priv.h        | 51 ++++++++++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c     | 82 ++++++++++++++++++=
++++
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c |  2 +-
 drivers/gpu/drm/panfrost/panfrost_devfreq.c        | 17 ++++-
 drivers/gpu/drm/panfrost/panfrost_gem.c            |  2 +-
 include/drm/drm_atomic_helper.h                    |  2 +
 39 files changed, 503 insertions(+), 98 deletions(-)
