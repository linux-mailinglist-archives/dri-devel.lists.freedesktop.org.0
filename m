Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0318E9A1009
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 18:48:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7608D10E14C;
	Wed, 16 Oct 2024 16:48:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Fa1SAsvM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
 [209.85.166.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D73E110E14C;
 Wed, 16 Oct 2024 16:48:19 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id
 e9e14a558f8ab-3a3b4663e40so326285ab.2; 
 Wed, 16 Oct 2024 09:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729097299; x=1729702099; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=FnOzc/HN0SAiUbTsStSbFnNR06opn4+9p90Mwo7rsHM=;
 b=Fa1SAsvMz/2p/CdVNxLGFIZ4vBova8EhO1VZQI9k262rbZhcGXPNYXrJR4EMNskrNc
 VXeIePPNfNy51ETQkO2R7pbVX3uE2tIlJaniQYtzzfOVbcBxTZ718Ca6OFBrZXotbznJ
 4kF/q9O7DO9qyXI75ks5qyTypghkAAek+mkJrQHrc6CCicQkoItPYrOc7tqQuiTIaKMQ
 MWx/eVldNWbSexfXoxxrXsSErTCED6meq0+BlvxwHAoF37Dbhib2sI478/KjQrAjGjzK
 glc2ZiWKHpHTAnRrTHnIaYM4MccDpEHiEHtte8jktLyCCyQV37CFqlOAg8HxghfLzeyl
 gI+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729097299; x=1729702099;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FnOzc/HN0SAiUbTsStSbFnNR06opn4+9p90Mwo7rsHM=;
 b=Ftwok5wOqX8fwL+QyUO/IB35fsMAlK2a5GSGebDf6es2kcORrObKoHB4KeB/YLZmNK
 bnOVmdEVQn1DTlsmiQAO2dV4Vts/ybcHnJPBSWj5LLBg9/cory55gf4ifCi9MhB4vdWm
 7ps3cPFdgDM4Pol38lJ5kXeopqeyOS+PdbFrUBaM9b23efKmOp9bnqvUbBWH7MDu4iDg
 JU6Wzgln+QrcIMxIEXwmTjqg0G8ZObqnu68R3aNnLCw0qJlugALQvG5ketcQW+nIMht8
 ZNGIDSAxLu/Ph98wne0ekGZd11ZM8/2Fw2TKDPjVgRgIb4WxaHPiedtzyP2H90c2fU8u
 OaPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVE4N4+bpooPt+/5IvHHN3FqGqgTvNc2sHlr9C0gzfQUmfmtyx3WhC8IVrbgKF3HxcdkJoy0P1m+hQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUNzb9pVw9t2pUErJD2iBNop5DXuUjY9/KW+ozVEgnrRe35+9a
 Q/NpznUS+AqXyPiGAYqtFFXCMuh7q3RtXlJ6lJ1OUgZOVfywB6q4EkkS/UXO4qtS8V7Ah5NxWF7
 hdo98O0b+rNnPPCGSMzHI710+STb219lv
X-Google-Smtp-Source: AGHT+IHNIu60KcbuEcAqnZIAwcjakWjSZZvuFyc4t/al0ks/MvRG1vvC7yPjvgTLtnB88tUv1khfr1F0DM7GNiWgBao=
X-Received: by 2002:a05:6e02:20c2:b0:3a3:4164:eec9 with SMTP id
 e9e14a558f8ab-3a3bcdd63b4mr152137705ab.14.1729097298826; Wed, 16 Oct 2024
 09:48:18 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 16 Oct 2024 09:48:06 -0700
Message-ID: <CAF6AEGsp3Zbd_H3FhHdRz9yCYA4wxX4SenpYRSk=Mx2d8GMSuQ@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2024-10-16 for v6.12-rc4
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
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

Hi Dave,

A few fixes for v6.12, see description below

The following changes since commit 15302579373ed2c8ada629e9e7bcf9569393a48d:

  drm/msm/dpu: enable writeback on SM6350 (2024-09-02 02:53:44 +0300)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2024-10-16

for you to fetch changes up to 77ad507dbb7ec1ecd60fc081d03616960ef596fd:

  drm/msm/a6xx+: Insert a fence wait before SMMU table update
(2024-10-15 17:18:16 -0700)

----------------------------------------------------------------
Fixes for v6.12

Display:
- move CRTC resource assignment to atomic_check otherwise to make
  consecutive calls to atomic_check() consistent
- fix rounding / sign-extension issues with pclk calculation in
  case of DSC
- cleanups to drop incorrect null checks in dpu snapshots
- fix to use kvzalloc in dpu snapshot to avoid allocation issues
  in heavily loaded system cases
- Fix to not program merge_3d block if dual LM is not being used
- Fix to not flush merge_3d block if its not enabled otherwise
  this leads to false timeouts

GPU:
- a7xx: add a fence wait before SMMU table update

----------------------------------------------------------------
Dmitry Baryshkov (4):
      drm/msm/dpu: make sure phys resources are properly initialized
      drm/msm/dpu: move CRTC resource assignment to
dpu_encoder_virt_atomic_check
      drm/msm/dpu: check for overflow in _dpu_crtc_setup_lm_bounds()
      drm/msm/hdmi: drop pll_cmp_to_fdata from hdmi_phy_8998

Douglas Anderson (2):
      drm/msm: Avoid NULL dereference in msm_disp_state_print_regs()
      drm/msm: Allocate memory for disp snapshot with kvzalloc()

Jessica Zhang (2):
      drm/msm/dpu: Don't always set merge_3d pending flush
      drm/msm/dpu: don't always program merge_3d block

Jonathan Marek (2):
      drm/msm/dsi: improve/fix dsc pclk calculation
      drm/msm/dsi: fix 32-bit signed integer extension in pclk_rate calculation

Rob Clark (1):
      drm/msm/a6xx+: Insert a fence wait before SMMU table update

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 16 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           | 20 ++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 68 +++++++++++++---------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  7 ++-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  5 +-
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c  | 19 +++---
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |  4 +-
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c           |  9 ---
 8 files changed, 89 insertions(+), 59 deletions(-)
