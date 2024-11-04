Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8939BBA9E
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 17:54:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5CA310E489;
	Mon,  4 Nov 2024 16:54:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GNRgtKd2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 137B410E488;
 Mon,  4 Nov 2024 16:54:29 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-3a3aeb19ea2so16410505ab.0; 
 Mon, 04 Nov 2024 08:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730739268; x=1731344068; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Aow437kkXpAe5g9V7AdsRJo4FnK0hAm9Zw+vMmQfPGE=;
 b=GNRgtKd2knBPlXbtnB1ryGnSpKJ3yGGFmF2e2wG5X2+bYlnnkf6WHZaOjiN7c2kpBb
 veGQn7bElFAabIFfojc7tP1GJ5YOFMR41TUony7fFleQ7zY+Yw6ZVQT6Y4BhpXqDb4Bq
 bQR83yKrwf4dJKNM2Mpxz4AKIsMyvpZPGarE1yipci4DfgElrH4zCzw6DoDvrc/vAuR2
 8f2K7iFTxOgdr5kD/9J10mBA1zOaTw5bKcTSiWCedS+7HxMDBWD+/+juUOqZmakgX8VN
 xTXglAtK+nJcjPAJcutc3hgCLdacBb2PvSzncRKubG4cv13B5jDc0My/9+u5EGfGk+OB
 cTAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730739268; x=1731344068;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Aow437kkXpAe5g9V7AdsRJo4FnK0hAm9Zw+vMmQfPGE=;
 b=l9vwnKTxst2LFYszNiSHvmE4yzE/PtLwzWrfsEcMfIDKPysvrHB/mxkeI+PMNw+uid
 cBIm/D9O/wzwuCt0dsMLLHcZ7tHetrodFKxEPC6E37TGjC7W0VNeEr7KbSCt0mAZHaWU
 j0975Rv6gGaFaR3ImA9E+qYRpRLmTmT4mRivB8uM/rpxDUJIwDfRZ+wDCSc+pZjhDL8a
 5HFKRS4C6TGngSkYgxAVd5PMZHvuYF/vvpkoA7INimQYi3v19usSyMxOAPm7pyXzaghF
 NgIuvSkfh0SxbGlSQCEHsGl6qAygNlGXvi6alw878wCWQta6YWu2W9uxqTj4wtnBDokD
 iwtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWh9PPEiv2kFMTJZ77kKOAJmKRth8h31BNy95ZQDsb43FhuEcGl1WPFCKdFeKoa7oUq3rVqJHC/W9s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsJM0LyVjawrkFZXFulx4rkoeHWDLzVZHIqtkN0+phBz4YlRAl
 yrmmVq/njPoZIJUSd/kuAoG3NOMf3dD2phCf+JxfTmHfAeTnu2aLOd5wYGds8TVB0UxM7wX94A/
 ZH/xiCUxXfL2qii/1ciGvHbZPt30=
X-Google-Smtp-Source: AGHT+IGkKB/ahqDlWLmEwv6DoJbRUpqg/GBMhf7DFFrb+gxRQ8+oqafUoL+oLxcfiLFlFK30d37eKC2E+AkrVSwfP4g=
X-Received: by 2002:a92:c246:0:b0:3a0:8d2f:2914 with SMTP id
 e9e14a558f8ab-3a4ed2fe5f9mr323276335ab.23.1730739268099; Mon, 04 Nov 2024
 08:54:28 -0800 (PST)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 4 Nov 2024 08:54:16 -0800
Message-ID: <CAF6AEGuGL6k3CKXZ0Qv-FTQ589+_PWNtid6i7MmVJLopBm2sYg@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-next-2024-11-04 for v6.13
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Simona,

A second late pull for v6.13, mainly to get in big/churny but
mechanical (mass dp symbol renames and kerneldoc cleanups) changes to
avoid merge conflicts in the next cycle.

The following changes since commit 4a6fd06643afa99989a0e6b848e125099674227b:

  Merge remote-tracking branch 'drm-misc/drm-misc-next' into msm-next
(2024-10-30 09:49:12 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-next-2024-11-04

for you to fetch changes up to 86313a9cd152330c634b25d826a281c6a002eb77:

  drm/msm/dpu: rework documentation comments (2024-11-03 18:21:39 +0200)

----------------------------------------------------------------
Late updates for v6.13

MDSS:
- cleanup UBWC registers handling

DP:
- Mass-rename the symbols

DPU:
- SSPP handling cleanup
- Move kerneldoc comments from headers to source files
- Misc small fixes

----------------------------------------------------------------
Dmitry Baryshkov (15):
      drm/msm/dp: prefix all symbols with msm_dp_
      drm/msm/dp: rename edp_ bridge functions and struct
      drm/msm/dp: tidy up platform data names
      drm/msm: move msm_display_topology to the DPU driver
      drm/msm: move MAX_H_TILES_PER_DISPLAY to the DPU driver
      drm/msm: drop MAX_BRIDGES define
      drm/msm/dpu: use drm_rect_fp_to_int()
      drm/msm/dpu: move pstate->pipe initialization to dpu_plane_atomic_check
      drm/msm/dpu: drop virt_formats from SSPP subblock configuration
      drm/msm/dpu: move scaling limitations out of the hw_catalog
      drm/msm/dpu: split dpu_plane_atomic_check()
      drm/msm/dpu: move rot90 checking to dpu_plane_atomic_check_sspp()
      drm/msm: move MDSS registers to separate header file
      drm/msm/mdss: use register definitions instead of hand-coding them
      drm/msm/dpu: rework documentation comments

Zichen Xie (1):
      drm/msm/dpu: cast crtc_clk calculation to u64 in _dpu_core_perf_calc_clk()

 drivers/gpu/drm/msm/Makefile                       |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h       |  46 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c      |  25 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h      |  27 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  31 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h           |  38 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 179 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        | 107 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  90 --
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |   6 +
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   6 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        |  11 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h        |   7 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  28 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   8 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c         |   8 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h         |   8 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |   9 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |   9 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c         |   7 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h         |  14 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c     |   7 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c        |   8 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h        |   8 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  |  52 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |   6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |   8 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |   8 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          |   7 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h          |   7 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c     |   8 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h     |   8 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |   9 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h    |   9 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |   9 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         |   7 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h         |   9 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c        |   7 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h        |   7 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |   8 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h          |   8 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  22 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |  34 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          | 247 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h          |  28 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |  46 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |  50 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c           |  13 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.h           |  18 -
 drivers/gpu/drm/msm/dp/dp_audio.c                  | 294 +++----
 drivers/gpu/drm/msm/dp/dp_audio.h                  |  38 +-
 drivers/gpu/drm/msm/dp/dp_aux.c                    | 148 ++--
 drivers/gpu/drm/msm/dp/dp_aux.h                    |  18 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c                | 734 ++++++++---------
 drivers/gpu/drm/msm/dp/dp_catalog.h                | 118 +--
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   | 482 +++++------
 drivers/gpu/drm/msm/dp/dp_ctrl.h                   |  40 +-
 drivers/gpu/drm/msm/dp/dp_debug.c                  |  68 +-
 drivers/gpu/drm/msm/dp/dp_debug.h                  |  10 +-
 drivers/gpu/drm/msm/dp/dp_display.c                | 904 ++++++++++-----------
 drivers/gpu/drm/msm/dp/dp_display.h                |  18 +-
 drivers/gpu/drm/msm/dp/dp_drm.c                    | 142 ++--
 drivers/gpu/drm/msm/dp/dp_drm.h                    |  22 +-
 drivers/gpu/drm/msm/dp/dp_link.c                   | 432 +++++-----
 drivers/gpu/drm/msm/dp/dp_link.h                   |  44 +-
 drivers/gpu/drm/msm/dp/dp_panel.c                  | 254 +++---
 drivers/gpu/drm/msm/dp/dp_panel.h                  |  42 +-
 drivers/gpu/drm/msm/dp/dp_utils.c                  |  20 +-
 drivers/gpu/drm/msm/dp/dp_utils.h                  |   8 +-
 drivers/gpu/drm/msm/msm_drv.h                      |  18 -
 drivers/gpu/drm/msm/msm_mdss.c                     |  35 +-
 drivers/gpu/drm/msm/registers/display/mdp5.xml     |  16 -
 drivers/gpu/drm/msm/registers/display/mdss.xml     |  29 +
 74 files changed, 2626 insertions(+), 2643 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/registers/display/mdss.xml
