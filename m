Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C5C5AA545
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 03:49:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CE8B10E47E;
	Fri,  2 Sep 2022 01:48:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A73310E47E
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Sep 2022 01:48:48 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-11ee4649dfcso1637691fac.1
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Sep 2022 18:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date;
 bh=HtXUO3+wI/1BqahfOxY5Y/H1z1rZCh2K/mxopL7ug7w=;
 b=kM3PlU5s/Opbp302SuEE7v6IdPtkg0HdN5VhcSe4cisZzrwF5ww1kbZ2r0FdsdCVNa
 6plNTlibZCaYXjglMBEAB9Ppo5v8sKoUWK8+wFpiZsHfY9YJ7tmHBmvdmuPhPwb3SI72
 WijFDhrnAOTFqWz+fyLSxo1Vm0/qW/Q053Rm47fIGh6QXNM8Wwi3mgh1XhOHMSIsi501
 n0rRzli6YS4/uorGd1MgvR78+QeJCFdXj8pvk3tQNeuN9RacX8VmlFF2vSfH+LmlIzJq
 IbvX7BLBvKw1CEQ2O265gpjsHaWZFwDbqshw5dS07ERUJlSGQF8i9XPhaSdSGbbJyUM0
 XOWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=HtXUO3+wI/1BqahfOxY5Y/H1z1rZCh2K/mxopL7ug7w=;
 b=7X1QiGt7bkRV/J0ECZ8Qrys+1O0Nfp2gBMYtVc2KCOUtBBnB9Ht5o/OLGcbKiuWom4
 SJ54Xlsgn0AB338ebG1kNgwvs1UYYevLMBnVo5sawnKU+VyYgCC4Hx5O7SPnB0HPXbFN
 WUdVzc2hOfyfF/EG7DSudlxAmoo59FOiOIue+J+zrHqE4z3+BARO326B/J+7mXcEQ/2d
 BFPwpTK4zqN1SEtxhLaZdBAEHUetig5z/WEK3c+TyJmeNTNngmXL7vpbA11UKxHQBjMY
 QbcaaP4wsp57mQF1tGnQX/MSi239gyOIatAZVx9o/wEI9YcR3KYhm495HIWY8u0F8bGz
 gFqQ==
X-Gm-Message-State: ACgBeo3BV20C5MHojrcXGz1wHvdRmnbkpbWyTMcCautaYiUNLeGr+uro
 LigG54rVlnw69LSPzpTKIa6mbLw3m1IPoCZUuME=
X-Google-Smtp-Source: AA6agR7bFVaOWpF9T5Z4DZrM3FpNwr7oWzAdLh7lyS4YDwO02LsWbPxJXZlWnBmuYJryH8ttTE+lKN5AN7cOn0VGeK0=
X-Received: by 2002:a05:6808:13cd:b0:343:41aa:4cbe with SMTP id
 d13-20020a05680813cd00b0034341aa4cbemr910915oiw.264.1662083327671; Thu, 01
 Sep 2022 18:48:47 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 2 Sep 2022 11:48:36 +1000
Message-ID: <CAPM=9twhqKoDa84xNhsRmrfApyu206m+58-1yHnxLj=r3pxvag@mail.gmail.com>
Subject: [git pull] drm fixes for 6.0-rc4
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

Regular fixes pull. One core dma-buf fix, then two weeks of i915
fixes, a lot of amdgpu fixes mostly for new IP, and a bunch of msm
fixes, mostly modesetting ones.

Nothing seems too bad at this point.

Dave.

drm-fixes-2022-09-02:
drm fixes for 6.0-rc4

dma-buf/dma-resv:
- Fence-handling fix

i915:
- GVT fixes including fix for a CometLake regression in mmio table
  and misc doc and typo fixes
- Fix CCS handling
- Fix for guc requests after reset
- Display DSI related fixes
- Display backlight related fixes
- Fix for a null pointer dereference
- HDMI related quirk for ECS Liva Q2 with GLK graphics
- Skip wm/ddb readout for disabled pipes

amdgpu:
- FRU error message fix
- MES 11 updates
- DCN 3.2.x fixes
- DCN 3.1.4 fixes
- Fix possible use after free in CS IOCTL
- SMU 13.0.x fixes
- Fix iolink reporting on devices with direct connections to CPU
- GFX10 tap delay firmware fixes

msm:
- Fix for inconsistent indenting in function msm_dsi_dphy_timing_calc_v3.
- Fix to make eDP the first connector in the connected list.
- Fix to populate intf_cfg correctly before calling reset_intf_cfg().
- Specify the correct number of DSI regulators for SDM660.
- Specify the correct number of DSI regulators for MSM8996.
- Fix for removing DP_RECOVERED_CLOCK_OUT_EN bit for tps4 link training
- Fix probe-deferral crash in gpu devfreq
- Fix gpu debugfs deadlock
The following changes since commit b90cb1053190353cc30f0fef0ef1f378ccc063c5=
:

  Linux 6.0-rc3 (2022-08-28 15:05:29 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-09-02

for you to fetch changes up to bfe632f6d0a1371784dd9a11fa5a9aa2dbf53bf1:

  Merge tag 'drm-intel-fixes-2022-09-01' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2022-09-02
11:26:50 +1000)

----------------------------------------------------------------
drm fixes for 6.0-rc3

dma-buf/dma-resv:
- Fence-handling fix

i915:
- GVT fixes including fix for a CommetLake regression in mmio table
  and misc doc and typo fixes
- Fix CCS handling
- Fix for guc requests after reset
- Display DSI related fixes
- Display backlight related fixes
- Fix for a null pointer dereference
- HDMI related quirk for ECS Liva Q2 with GLK graphics
- Skip wm/ddb readout for disabled pipes

amdgpu:
- FRU error message fix
- MES 11 updates
- DCN 3.2.x fixes
- DCN 3.1.4 fixes
- Fix possible use after free in CS IOCTL
- SMU 13.0.x fixes
- Fix iolink reporting on devices with direct connections to CPU
- GFX10 tap delay firmware fixes

msm:
- Fix for inconsistent indenting in function msm_dsi_dphy_timing_calc_v3.
- Fix to make eDP the first connector in the connected list.
- Fix to populate intf_cfg correctly before calling reset_intf_cfg().
- Specify the correct number of DSI regulators for SDM660.
- Specify the correct number of DSI regulators for MSM8996.
- Fix for removing DP_RECOVERED_CLOCK_OUT_EN bit for tps4 link training
- Fix probe-deferral crash in gpu devfreq
- Fix gpu debugfs deadlock

----------------------------------------------------------------
Abhinav Kumar (1):
      drm/msm/dpu: populate wb or intf before reset_intf_cfg

Alex Sierra (1):
      drm/amdgpu: ensure no PCIe peer access for CPU XGMI iolinks

Alex Williamson (1):
      drm/i915/gvt: Fix Comet Lake

Arun R Murthy (2):
      drm/i915/display: avoid warnings when registering dual panel backligh=
t
      drm/i915/display: avoid warnings when registering dual panel backligh=
t

Aurabindo Pillai (4):
      drm/amd/display: Fix CAB cursor size allocation for DCN32/321
      drm/amd/display: disable display fresh from MALL on an edge case
for DCN321
      drm/amd/display: use actual cursor size instead of max for CAB alloca=
tion
      drm/amd/display: Use correct plane for CAB cursor size allocation

Bjorn Andersson (1):
      drm/msm/gpu: Drop qos request if devm_devfreq_add_device() fails

Charlene Liu (1):
      drm/amd/display: fix wrong register access

Chengming Gui (1):
      drm/amd/amdgpu: skip ucode loading if ucode_size =3D=3D 0

Christian K=C3=B6nig (1):
      dma-buf/dma-resv: check if the new fence is really later

Colin Ian King (1):
      drm/i915/reg: Fix spelling mistake "Unsupport" -> "Unsupported"

Daniele Ceraolo Spurio (2):
      drm/i915/guc: clear stalled request after a reset
      drm/i915/guc: clear stalled request after a reset

Dave Airlie (5):
      Merge tag 'drm-intel-fixes-2022-08-26' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'drm-misc-fixes-2022-08-31' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'amd-drm-fixes-6.0-2022-08-31' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-msm-fixes-2022-08-27' of
https://gitlab.freedesktop.org/drm/msm into drm-fixes
      Merge tag 'drm-intel-fixes-2022-09-01' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes

Diego Santa Cruz (1):
      drm/i915/glk: ECS Liva Q2 needs GLK HDMI port timing quirk

Douglas Anderson (2):
      drm/msm/dsi: Fix number of regulators for msm8996_dsi_cfg
      drm/msm/dsi: Fix number of regulators for SDM660

Duncan Ma (1):
      drm/amd/display: Fix OTG H timing reset for dcn314

Ethan Wellenreiter (2):
      drm/amd/display: Re-initialize viewport after pipe merge
      drm/amd/display: Fix check for stream and plane

Evan Quan (3):
      drm/amd/pm: use vbios carried pptable for those supported SKUs
      drm/amd/pm: use vbios carried pptable for all SMU13.0.7 SKUs
      drm/amd/pm: bump SMU 13.0.0 driver_if header version

George Shen (1):
      drm/amd/display: Fix DCN32 DPSTREAMCLK_CNTL programming

Graham Sider (1):
      drm/amdgpu: Update mes_v11_api_def.h

Guchun Chen (1):
      drm/amdgpu: disable FRU access on special SIENNA CICHLID card

Hawking Zhang (1):
      drm/amdgpu: only init tap_delay ucode when it's included in ucode bin=
ary

Jani Nikula (4):
      drm/i915/dsi: filter invalid backlight and CABC ports
      drm/i915/dsi: fix dual-link DSI backlight and CABC ports for display =
11+
      drm/i915/dsi: filter invalid backlight and CABC ports
      drm/i915/dsi: fix dual-link DSI backlight and CABC ports for display =
11+

Jiapeng Chong (3):
      drm/i915/gvt: Fix kernel-doc
      drm/i915/gvt: Fix kernel-doc
      drm/i915/gvt: Fix kernel-doc

Jouni H=C3=B6gander (2):
      drm/i915/backlight: Disable pps power hook for aux based backlight
      drm/i915/backlight: Disable pps power hook for aux based backlight

Julia Lawall (1):
      drm/i915/gvt: fix typo in comment

Kuogee Hsieh (2):
      drm/msm/dp: make eDP panel as the first connected connector
      drm/msm/dp: delete DP_RECOVERED_CLOCK_OUT_EN to fix tps4

Leo Chen (1):
      drm/amd/display: Missing HPO instance added

Matthew Auld (2):
      drm/i915/ttm: fix CCS handling
      drm/i915/ttm: fix CCS handling

Rob Clark (1):
      drm/msm/rd: Fix FIFO-full deadlock

Rodrigo Vivi (2):
      Merge tag 'gvt-fixes-2022-08-22' of
https://github.com/intel/gvt-linux into drm-intel-fixes
      Merge tag 'gvt-fixes-2022-08-22' of
https://github.com/intel/gvt-linux into drm-intel-fixes

Ville Syrj=C3=A4l=C3=A4 (1):
      drm/i915: Skip wm/ddb readout for disabled pipes

Vladimir Stempen (1):
      drm/amd/display: Fix black flash when switching from ODM2to1 to ODMBy=
pass

Wang Fudong (1):
      drm/amd/display: set dig fifo read start level to 7 before dig fifo r=
eset

YuBiao Wang (1):
      drm/amdgpu: Fix use-after-free in amdgpu_cs_ioctl

sunliming (1):
      drm/msm/dsi: fix the inconsistent indenting

=C5=81ukasz Bartosik (1):
      drm/i915: fix null pointer dereference

 drivers/dma-buf/dma-resv.c                         |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c     |  9 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |  5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             | 60 ++++++++++--------
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |  1 +
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  3 +-
 .../amd/display/dc/dcn31/dcn31_dio_link_encoder.c  |  3 +
 .../display/dc/dcn314/dcn314_dio_stream_encoder.c  |  1 +
 .../gpu/drm/amd/display/dc/dcn314/dcn314_optc.c    |  3 +-
 .../drm/amd/display/dc/dcn314/dcn314_resource.c    |  1 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c  |  8 +--
 .../display/dc/dcn32/dcn32_dio_stream_encoder.c    |  5 ++
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c | 68 +++++++++++++++---=
--
 .../amd/display/dc/dcn32/dcn32_resource_helpers.c  |  2 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |  9 +++
 .../gpu/drm/amd/display/dc/link/link_hwss_hpo_dp.c |  4 +-
 drivers/gpu/drm/amd/include/mes_v11_api_def.h      |  3 +-
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h |  2 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |  8 ++-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     | 23 +++----
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   | 72 ++++++++++++++++++=
+---
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   | 35 +++++++----
 drivers/gpu/drm/i915/display/icl_dsi.c             |  7 +++
 drivers/gpu/drm/i915/display/intel_backlight.c     | 37 ++++++-----
 drivers/gpu/drm/i915/display/intel_bios.c          | 10 +--
 drivers/gpu/drm/i915/display/intel_bw.c            | 16 ++---
 drivers/gpu/drm/i915/display/intel_dp.c            |  2 -
 drivers/gpu/drm/i915/display/intel_quirks.c        |  3 +
 drivers/gpu/drm/i915/display/vlv_dsi.c             |  7 +++
 drivers/gpu/drm/i915/gt/intel_migrate.c            | 44 +++++++------
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |  7 +++
 drivers/gpu/drm/i915/gvt/aperture_gm.c             |  4 +-
 drivers/gpu/drm/i915/gvt/gtt.c                     |  2 +-
 drivers/gpu/drm/i915/gvt/handlers.c                |  4 +-
 drivers/gpu/drm/i915/gvt/mmio_context.c            |  2 +-
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c        |  3 +-
 drivers/gpu/drm/i915/intel_pm.c                    |  8 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  6 ++
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |  2 +-
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |  4 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |  2 +-
 drivers/gpu/drm/msm/msm_drv.c                      |  2 +
 drivers/gpu/drm/msm/msm_gpu_devfreq.c              |  2 +
 drivers/gpu/drm/msm/msm_rd.c                       |  3 +
 46 files changed, 348 insertions(+), 162 deletions(-)
