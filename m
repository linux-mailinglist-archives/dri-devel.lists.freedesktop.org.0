Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 716047F6A34
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 02:39:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7ACD10E794;
	Fri, 24 Nov 2023 01:39:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6315410E794
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 01:39:06 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a00cbb83c80so201353166b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 17:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700789945; x=1701394745; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=MCjIjD8tavb0cbgjvIEQTL7WpfbPqahU1xHEzB2I5uM=;
 b=jPHObpJkUzxrs0pC6UmCGzYRCi64IMFqNY5ZabwcMUD279pcusUoLDoyDP+Rcgn1sA
 aXpcgshFoZrJzIPKFKuWpAxO0UPMrib9kerkGp/zFcySh0EhWiRUQQfxGzfe8Yj5X4jC
 4+DgH2ckWeWqhltsiRDhBE+hPRyKNQL+o3WjbJ805s44joC3/aHxq8D+Xnzt/nYtwmTC
 LAXuV+YuNQm7XzP/IcBbCIAXVO6N3LcQeAUooR2n7RfQ9uwiNfSqo9v4ofCO1cheslBi
 5kgq4Yv2Z7QVJAcbXw1DOlskPdWCuW9zPv30Td8tZSIQUWoznWKDHygUUxj/MdIqDytC
 JCzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700789945; x=1701394745;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MCjIjD8tavb0cbgjvIEQTL7WpfbPqahU1xHEzB2I5uM=;
 b=xHAvjfOAdjJoDbcaU5/V53d5LES4h9vQeGG9EtqnwaATl8ZcTaIqMT2dUZAeR9C9Cn
 JyG/6UPhYJgem0V5C5b+fbKubVZnB4tS2K7S8+BMfbhnCc8Z/3+dzk1d1pDG/Aa6YhoW
 f58Vg+4jgptELhU6GUCFq0RMF3Qms8m+SW1D8GGLG7FHG1lp06qWrfcFN2qv13FvgjCM
 AK5DgP1h1BM1QcEFmNlPh25LnH9eTbwUxMq371oV5mUPbMC1lN0e1YTxo7ZSh+NerhgP
 9rKjqBN2xBiNwZVqSXhhMsCiUXQIeCZ1Ym+Med5uWN/zpg6fAaQ4AtwBAVe7+KU8gps8
 nibA==
X-Gm-Message-State: AOJu0Yw4XuqwMHSkO6dPusrCvkoAUeMBg5nm7Sj47K2Pzt82UmxJnq0s
 myjJKBaTkTbFyAb2fjUQKJtn2yOgthwVTEWuEOvm0E21ofU=
X-Google-Smtp-Source: AGHT+IFMWsDCoDTnUOis1NEZFxzHDDlNlqWsjIu1KiRS8KmbJxKLEmmKnV3HPDf4zStiqHzmYEqYOYCsUEvKAdWFLas=
X-Received: by 2002:a17:906:b21a:b0:9ff:5b5c:12a6 with SMTP id
 p26-20020a170906b21a00b009ff5b5c12a6mr753905ejz.40.1700789944473; Thu, 23 Nov
 2023 17:39:04 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 24 Nov 2023 11:38:52 +1000
Message-ID: <CAPM=9txezDxgPxV4UJ-RPVxuAqO4k2kdDj-oUAyFdP+CztJPzg@mail.gmail.com>
Subject: [git pull] drm fixes for 6.7-rc3
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
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

Back to regular scheduled fixes pull request, mainly a bunch of msm,
some i915 and otherwise a few scattered, one memory crasher in the
nouveau GSP paths is helping stabilise that work.

Regards,
Dave.

drm-fixes-2023-11-24:
drm fixes for 6.7-rc3

msm:
- Fix the VREG_CTRL_1 for 4nm CPHY to match downstream
- Remove duplicate call to drm_kms_helper_poll_init() in msm_drm_init()
- Fix the safe_lut_tbl[] for sc8280xp to match downstream
- Don't attach the drm_dp_set_subconnector_property() for eDP
- Fix to attach drm_dp_set_subconnector_property() for DP. Otherwise
  there is a bootup crash on multiple targets
- Remove unnecessary NULL check left behind during cleanup

i915:
- Fix race between DP MST connectore registration and setup
- Fix GT memory leak on probe error path

panel:
- Fixes for innolux and auo,b101uan08.3 panel.
- Fix Himax83102-j02 timings.

ivpu:
- Fix ivpu MMIO reset.

ast:
- AST fix on connetor disconnection.

nouveau:
- gsp memory corruption fix.

rockchip:
- color fix.
The following changes since commit 98b1cc82c4affc16f5598d4fa14b1858671b2263:

  Linux 6.7-rc2 (2023-11-19 15:02:14 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-11-24

for you to fetch changes up to b3ca8a08d8ed0dc8a9e236d9294efd58554a7b05:

  Merge tag 'drm-intel-fixes-2023-11-23' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2023-11-24
11:18:29 +1000)

----------------------------------------------------------------
drm fixes for 6.7-rc3

msm:
- Fix the VREG_CTRL_1 for 4nm CPHY to match downstream
- Remove duplicate call to drm_kms_helper_poll_init() in msm_drm_init()
- Fix the safe_lut_tbl[] for sc8280xp to match downstream
- Don't attach the drm_dp_set_subconnector_property() for eDP
- Fix to attach drm_dp_set_subconnector_property() for DP. Otherwise
  there is a bootup crash on multiple targets
- Remove unnecessary NULL check left behind during cleanup

i915:
- Fix race between DP MST connectore registration and setup
- Fix GT memory leak on probe error path

panel:
- Fixes for innolux and auo,b101uan08.3 panel.
- Fix Himax83102-j02 timings.

ivpu:
- Fix ivpu MMIO reset.

ast:
- AST fix on connetor disconnection.

nouveau:
- gsp memory corruption fix.

rockchip:
- color fix.

----------------------------------------------------------------
Abel Vesa (1):
      drm/msm/dp: don't touch DP subconnector property in eDP case

Andrzej Hajda (1):
      drm/i915: do not clean GT table on error path

Bjorn Andersson (1):
      drm/msm/dpu: Add missing safe_lut_tbl in sc8280xp catalog

Cong Yang (1):
      drm/panel: boe-tv101wum-nl6: Fine tune Himax83102-j02 panel HFP and HBP

Dan Carpenter (1):
      drm/msm: remove unnecessary NULL check

Dave Airlie (4):
      nouveau/gsp: allocate enough space for all channel ids.
      Merge tag 'drm-msm-fixes-2023-11-21' of
https://gitlab.freedesktop.org/drm/msm into drm-fixes
      Merge tag 'drm-misc-fixes-2023-11-23' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'drm-intel-fixes-2023-11-23' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes

Dmitry Baryshkov (2):
      drm/msm: remove exra drm_kms_helper_poll_init() call
      drm/msm/dp: attach the DP subconnector property

Imre Deak (1):
      drm/i915/dp_mst: Fix race between connector registration and setup

Jacek Lawrynowicz (1):
      accel/ivpu/37xx: Fix hangs related to MMIO reset

Jonas Karlman (1):
      drm/rockchip: vop: Fix color for RGB888/BGR888 format on VOP full

Jonathan Marek (1):
      drm/msm/dsi: use the correct VREG_CTRL_1 value for 4nm cphy

Marek Vasut (2):
      drm/panel: simple: Fix Innolux G101ICE-L01 bus flags
      drm/panel: simple: Fix Innolux G101ICE-L01 timings

Thomas Zimmermann (1):
      drm/ast: Disconnect BMC if physical connector is connected

Xuxin Xiong (1):
      drm/panel: auo,b101uan08.3: Fine tune the panel power sequence

 drivers/accel/ivpu/ivpu_hw_37xx.c                  | 46 ++++++++--------
 drivers/gpu/drm/ast/ast_drv.h                      | 13 ++++-
 drivers/gpu/drm/ast/ast_mode.c                     | 62 +++++++++++++++++++---
 drivers/gpu/drm/i915/display/intel_dp_mst.c        | 16 +++---
 drivers/gpu/drm/i915/gt/intel_gt.c                 | 11 ----
 drivers/gpu/drm/i915/i915_driver.c                 |  4 +-
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |  1 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |  3 +-
 drivers/gpu/drm/msm/dp/dp_display.c                | 15 ++++--
 drivers/gpu/drm/msm/dp/dp_drm.c                    |  3 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |  2 +-
 drivers/gpu/drm/msm/msm_drv.c                      |  2 -
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c    |  2 +-
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c     |  9 ++--
 drivers/gpu/drm/panel/panel-simple.c               | 13 ++---
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        | 14 +++--
 16 files changed, 138 insertions(+), 78 deletions(-)
