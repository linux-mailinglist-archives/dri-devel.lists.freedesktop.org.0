Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7FF49F323
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 06:46:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A759A10E7FB;
	Fri, 28 Jan 2022 05:46:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F5D10E7DB
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 05:46:47 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id p12so7556242edq.9
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 21:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=mbJSZf5gy3hnyEih7mJYLas+iYsAiaEKBB/Kw4odm/E=;
 b=QZbulDzwCneylQ0114C9HfTxud0AsgoQ1Hg5Bv/k9Txy6YovJzwW7C+EeyYFuZgyKd
 txDPU+os/xnqIQQ1aSj9UJ/FMbqkujm0T2Xpz5kpyzjqcmp79u/efHCjQzxAuweoRkIU
 e3fMweaW+oIqlJQXjUGqIiyVgGnnNqErfK8Q8Ce7dmPFfSM42yZsFRktntsA4bvp1jOp
 hVv0dW3KDmcVfiz0LRawn/oKaKVAn2PENe95j7Bk4VYTHmj+NW8h1rfe+eeS+SoWBqk6
 TAOoJvCN6QtAvI8eByREctK1DFoJP0GnHkRENK6UFH3LsWV6KoFeb1QUJgCHpnjTAS2f
 eB6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=mbJSZf5gy3hnyEih7mJYLas+iYsAiaEKBB/Kw4odm/E=;
 b=mNKgZQeyZCC4NTTP4Ob3lOC41f5WDOPV1VYrWkiNLXPmbt+D2zNjmTf6shxK46pbzt
 tmmDKL0DNYCITv6e/Oa6+LZ6uCv48SnsjyZgcsA765knR/iEUV7TYdkyb83lNixA98iu
 685Sehi1oFf4QXAwrA1MYujP/hlGDz8tJFzyKNeWmoqsdRxPdMtzDohc023cQfp89ChC
 1c2zi3GW72e0DswnEG4/5No8NIt0FKv1zHZxjKuPeGTAP9lTgs3PLSqdlxhjhe5n/QOp
 kYWVFVrxBR1zoY66238e3TK6nxS6T0c5nyY2E7yuqRKjfgc+rt21lXULJYkYXxsHvnkz
 qUaQ==
X-Gm-Message-State: AOAM533GEmE2bgPEz2WzUreqUIO9Y+H9lw0TUw2rEZLTRPJNvd27p8FL
 c67lmm10Z2hMzOt6Kj38E8JpCEOuv9mFKLIGLDs=
X-Google-Smtp-Source: ABdhPJwWFnYpwYuXrY3zZeNzTujZuUl5wDXmSHqgW2G24jYHMGcMA0MMOn4ZXsQ2Z6HIOgDH1yZ3GObCkt+nR1qS6gA=
X-Received: by 2002:a50:e616:: with SMTP id y22mr6613760edm.277.1643348806229; 
 Thu, 27 Jan 2022 21:46:46 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 28 Jan 2022 15:46:35 +1000
Message-ID: <CAPM=9tweQ-RgLm5oewCYqVzRuiQ6cSQrb2yzVYP_537V67pdDQ@mail.gmail.com>
Subject: [git pull] drm fixes for 5.17-rc2
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

This week's regular normal fixes. amdgpu and msm make up the bulk of
it, with a scattering of fixes elsewhere.

Dave.

drm-fixes-2022-01-28:
drm fixes for 5.17-rc2

atomic:
- fix CRTC handling during modeset

privacy-screen:
- honor acpi=3Doff

ttm:
- build fix for um

panel:
- add orientation quirk for 1NetBook OneXPlayer

amdgpu:
- Proper fix for otg synchronization logic regression
- DCN3.01 fixes
- Filter out secondary radeon PCI IDs
- udelay fixes
- Fix a memory leak in an error path

msm:
- parameter check fixes
- put_device balancing
- idle/suspend fixes

etnaviv:
- relax submit size checks

vc4:
- fix potential deadlock in DSI code

ast:
- revert 1600x900 mode change
The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07=
:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-01-28

for you to fetch changes up to db5aa1497d02e7770e40dd0d1bfcb4ea0b0d3906:

  Merge tag 'amd-drm-fixes-5.17-2022-01-26' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2022-01-28
14:59:44 +1000)

----------------------------------------------------------------
drm fixes for 5.17-rc2

atomic:
- fix CRTC handling during modeset

privcy-screen:
- honor acpi=3Doff

ttm:
- build fix for um

panel:
- add oreientation quirk for 1NetBook OneXPlayer

amdgpu:
- Proper fix for otg synchronization logic regression
- DCN3.01 fixes
- Filter out secondary radeon PCI IDs
- udelay fixes
- Fix a memory leak in an error path

msm:
- parameter check fixes
- put_device balancing
- idle/suspend fixes

etnaviv:
- relax submit size checks

vc4:
- fix potential deadlock in DSI code

ast:
- revert 1600x900 mode change

----------------------------------------------------------------
Alex Deucher (3):
      drm/amdgpu: filter out radeon secondary ids as well
      drm/amdgpu/display: adjust msleep limit in
dp_wait_for_training_aux_rd_interval
      drm/amdgpu/display: use msleep rather than udelay for long delays

Bas Nieuwenhuizen (3):
      drm/amd/display: Fix FP start/end for dcn30_internal_validate_bw.
      drm/amd/display: Wrap dcn301_calculate_wm_and_dlg for FPU.
      drm/amdgpu/display: Remove t_srx_delay_us.

Dave Airlie (6):
      Revert "drm/ast: Support 1600x900 with 108MHz PCLK"
      Merge tag 'drm-misc-next-fixes-2022-01-21' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'drm-misc-fixes-2022-01-27' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'drm-msm-fixes-2022-01-25' of
https://gitlab.freedesktop.org/drm/msm into drm-fixes
      Merge branch 'etnaviv/fixes' of
https://git.pengutronix.de/git/lst/linux into drm-fixes
      Merge tag 'amd-drm-fixes-5.17-2022-01-26' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes

Jos=C3=A9 Exp=C3=B3sito (2):
      drm/msm/dpu: invalid parameter check in dpu_setup_dspp_pcc
      drm/msm/dsi: invalid parameter check in msm_dsi_phy_enable

Lucas Stach (1):
      drm/etnaviv: relax submit size limits

Manasi Navare (1):
      drm/atomic: Add the crtc to affected crtc only if uapi.enable =3D tru=
e

Meenakshikumar Somasundaram (1):
      drm/amd/display: Fix for otg synchronization logic

Miaoqian Lin (2):
      drm/msm/dsi: Fix missing put_device() call in dsi_get_phy
      drm/msm/hdmi: Fix missing put_device() call in msm_hdmi_get_phy

Padmanabha Srinivasaiah (1):
      drm/vc4: Fix deadlock on DSI device attach error

Raymond Jay Golo (1):
      drm: panel-orientation-quirks: Add quirk for the 1Netbook OneXPlayer

Rob Clark (3):
      drm/msm/a6xx: Add missing suspend_count increment
      drm/msm/gpu: Wait for idle before suspending
      drm/msm/gpu: Cancel idle/boost work on suspend

Thomas Zimmermann (1):
      Merge drm/drm-fixes into drm-misc-fixes

Tong Zhang (1):
      drm/privacy-screen: honor acpi=3Doff in detect_thinkpad_privacy_scree=
n

Xianting Tian (1):
      drm/msm: Fix wrong size calculation

Yang Li (1):
      drm/msm: remove variable set but not used

Zhan Liu (2):
      drm/amd/display: Correct MPC split policy for DCN301
      drm/amd/display: change FIFO reset condition to embedded display only

Zhou Qingyang (1):
      drm/amd/display/dc/calcs/dce_calcs: Fix a memleak in calculate_bandwi=
dth()

 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            | 81 ++++++++++++++++++=
++++
 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c   |  4 +-
 drivers/gpu/drm/amd/display/dc/calcs/dcn_calcs.c   |  1 -
 drivers/gpu/drm/amd/display/dc/core/dc.c           | 40 +++++++----
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |  6 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  | 54 +++++++++++++++
 drivers/gpu/drm/amd/display/dc/dc.h                |  1 +
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    | 10 ++-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |  4 +-
 .../drm/amd/display/dc/dcn301/dcn301_resource.c    | 13 +++-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |  3 +
 .../display/dc/dml/dcn20/display_rq_dlg_calc_20.c  |  2 -
 .../dc/dml/dcn20/display_rq_dlg_calc_20v2.c        |  2 -
 .../display/dc/dml/dcn21/display_rq_dlg_calc_21.c  |  2 -
 .../display/dc/dml/dcn30/display_rq_dlg_calc_30.c  |  2 -
 .../gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c |  2 +-
 .../gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.h |  2 +-
 .../drm/amd/display/dc/dml/display_mode_structs.h  |  1 -
 .../amd/display/dc/dml/display_rq_dlg_helpers.c    |  3 -
 .../amd/display/dc/dml/dml1_display_rq_dlg_calc.c  |  4 --
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |  1 +
 drivers/gpu/drm/amd/display/dc/inc/resource.h      | 11 +++
 drivers/gpu/drm/ast/ast_tables.h                   |  2 -
 drivers/gpu/drm/drm_atomic.c                       | 12 ++--
 drivers/gpu/drm/drm_panel_orientation_quirks.c     | 12 ++++
 drivers/gpu/drm/drm_privacy_screen_x86.c           |  3 +
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c       |  4 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  2 +
 drivers/gpu/drm/msm/adreno/adreno_device.c         | 18 +++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c        | 11 ++-
 drivers/gpu/drm/msm/dsi/dsi.c                      |  7 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |  4 +-
 drivers/gpu/drm/msm/hdmi/hdmi.c                    |  7 +-
 drivers/gpu/drm/msm/msm_drv.c                      |  5 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |  3 +
 drivers/gpu/drm/msm/msm_gpu.h                      |  3 +
 drivers/gpu/drm/msm/msm_gpu_devfreq.c              | 21 +++++-
 drivers/gpu/drm/vc4/vc4_dsi.c                      | 14 ++--
 38 files changed, 307 insertions(+), 70 deletions(-)
