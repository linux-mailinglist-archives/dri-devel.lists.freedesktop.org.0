Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAE687538F
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 16:43:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A0111137EB;
	Thu,  7 Mar 2024 15:43:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FYQSQGWM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 821B61137EC;
 Thu,  7 Mar 2024 15:43:04 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5643ae47cd3so1354952a12.3; 
 Thu, 07 Mar 2024 07:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709826182; x=1710430982; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=QbfY0jQ/d1E5iuzWIwYW6yuawL+XChB5sPZ7SPtuav0=;
 b=FYQSQGWMwoWlv5piwZzPPAacARhdkEMiMyycr+VM9zlZcuRp3J/GCbBIovLiLcH8Hq
 UgFvZ84xpHyv51zqJbpG4CuRYz/lvjgDctqo7OCin8bqEcL0v2PFkKRP0SyHWuH9NcGE
 ceFk7sac8GCnjglahY3ojWfL2voga+4Jf1XjIMtaaJHsd3srPS2pdri6RLBM97S2X6d6
 Ea96m2XAsgvx9uCFQsxKE8ZzM0LvrFfswB7Tkg+pPziI2ErwhIrXOaWolQDuMRiUMPg+
 cgvT5twXkjsjmTwWdPJovrgKVk7CLHXOiCIR8Z8CsjHpwxCum2mVTCMmkhYYhINJRAOb
 s1BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709826182; x=1710430982;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QbfY0jQ/d1E5iuzWIwYW6yuawL+XChB5sPZ7SPtuav0=;
 b=aZoG+4meVsxN4wCJ5oUXceOnOULBpU0b5uvSg5j24cBXZF9UITfNf9Oi3xHXfsN39C
 De5gBJjTbok/i+fibaJCS1Sb7/xts/Ip4nYIek6w4XUP2ACu30dTrtWB515WHexGmyG0
 93DI0P67XjpO2oP17hclWUUclqJCImV/jZ1sR7YAVq+ce15l+iH2mpPDeDf7n6/ssHht
 rO/FqrA4HRuugBXekKjPQMskwpPaBCjAC3usxAMnWs5sQaLFlUk/eXnf0OPMDWToerjs
 OX9doRWSkHSoFkAzDvNHJG0O+xYCFtQqa2dcoJl/dX3Z3JTOXvHnfhp7MJTm2SIOq1Xb
 YU/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCULpPQ5QYCxmN4Ii3XadQf4SRNrfkJfGuSjk+NO/9xOeaH2GQ4OEDIO2lr+4t2wLGoCYa0x9x7QqPDxMaB3ox+k8Ywy/6PEyoMtUtmtc+9g
X-Gm-Message-State: AOJu0Yy1iZTNTiBrgH2JzmWYuJ6d/lxwxHrrpcmkXPBENpNFMuzWtjz4
 8/pbA08bcHfCIwMqG8fTdldcx+GAv/j918Kt3yiZHSrkbdeA6/ElWf5HdEhtmoe4AnMBs4IEh3J
 zgZv4Lca0vsUTubQb57K/9JWA2XY=
X-Google-Smtp-Source: AGHT+IEr9qo/sl8eNI6sxdX5u4sxd7sET4jEQ3xcDqXBSae2OwHSkckftNM2xzoDZp6UHAKqUfZlQZkVq2caijUeJo4=
X-Received: by 2002:a50:cd5d:0:b0:565:e060:5567 with SMTP id
 d29-20020a50cd5d000000b00565e0605567mr102617edj.31.1709826182359; Thu, 07 Mar
 2024 07:43:02 -0800 (PST)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 7 Mar 2024 07:42:50 -0800
Message-ID: <CAF6AEGvedk6OCOZ-NNtGf_pNiGuK9uvWj1MCDZLX9Jo2nHS=Zg@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-next-2024-03-07 for v6.9
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>, 
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

This is the last bit for v6.9, which was waiting on
drm-misc-next-2024-02-29.  Description below.

The following changes since commit 177bce60cd10a4ffdc9881bf6f2dff7880408c1d:

  Merge tag 'drm-misc-next-2024-02-29' into msm-next (2024-03-03 18:32:11 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-next-2024-03-07

for you to fetch changes up to 4be445f5b6b6810baf397b2d159bd07c3573fd75:

  drm/msm/dpu: capture snapshot on the first commit_done timeout
(2024-03-04 11:44:03 +0200)

----------------------------------------------------------------
Late updates for v6.9, the main part is CDM (YUV over DP) which was
waiting for drm-misc-next-2024-02-29.

DPU:
- Add support for YUV420 over DP
- Patchset to ease debugging of vblank timeouts
- Small cleanup

----------------------------------------------------------------
Dmitry Baryshkov (3):
      drm/msm/dpu: make "vblank timeout" more useful
      drm/msm/dpu: split dpu_encoder_wait_for_event into two functions
      drm/msm/dpu: capture snapshot on the first commit_done timeout

Kuogee Hsieh (1):
      drm/msm/dpu: add support of new peripheral flush mechanism

Paloma Arellano (18):
      drm/msm/dpu: allow certain formats for CDM for DP
      drm/msm/dpu: add division of drm_display_mode's hskew parameter
      drm/msm/dpu: pass mode dimensions instead of fb size in CDM setup
      drm/msm/dpu: allow dpu_encoder_helper_phys_setup_cdm to work for DP
      drm/msm/dpu: move dpu_encoder_helper_phys_setup_cdm to dpu_encoder
      drm/msm/dp: rename wide_bus_en to wide_bus_supported
      drm/msm/dp: store mode YUV420 information to be used by rest of DP
      drm/msm/dp: check if VSC SDP is supported in DP programming
      drm/msm/dpu: move widebus logic to its own API
      drm/msm/dp: program config ctrl for YUV420 over DP
      drm/msm/dp: change clock related programming for YUV420 over DP
      drm/msm/dp: move parity calculation to dp_utils
      drm/msm/dp: add VSC SDP support for YUV420 over DP
      drm/msm/dp: enable SDP and SDE periph flush update
      drm/msm/dpu: modify encoder programming for CDM over DP
      drm/msm/dpu: modify timing engine programming for YUV420 over DP
      drm/msm/dpu: reserve CDM blocks for DP if mode is YUV420
      drm/msm/dp: allow YUV420 mode for DP connector when CDM available

 drivers/gpu/drm/msm/Makefile                       |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 244 +++++++++++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |  26 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  26 ++-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  32 ++-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    | 100 +--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c         |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |  17 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |  10 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   6 +-
 drivers/gpu/drm/msm/dp/dp_audio.c                  | 101 ++-------
 drivers/gpu/drm/msm/dp/dp_catalog.c                | 115 +++++++++-
 drivers/gpu/drm/msm/dp/dp_catalog.h                |   9 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |  17 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |  82 +++++--
 drivers/gpu/drm/msm/dp/dp_drm.c                    |   6 +-
 drivers/gpu/drm/msm/dp/dp_drm.h                    |   3 +-
 drivers/gpu/drm/msm/dp/dp_panel.c                  |  53 +++++
 drivers/gpu/drm/msm/dp/dp_panel.h                  |   2 +
 drivers/gpu/drm/msm/dp/dp_reg.h                    |   9 +
 drivers/gpu/drm/msm/dp/dp_utils.c                  |  96 ++++++++
 drivers/gpu/drm/msm/dp/dp_utils.h                  |  36 +++
 drivers/gpu/drm/msm/msm_drv.h                      |  32 +--
 23 files changed, 736 insertions(+), 291 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/dp/dp_utils.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_utils.h
