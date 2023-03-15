Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F160C6BBECB
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 22:18:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A63DA10E9D5;
	Wed, 15 Mar 2023 21:18:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A04B810E35E;
 Wed, 15 Mar 2023 21:18:30 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-17ab3a48158so6281288fac.1; 
 Wed, 15 Mar 2023 14:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678915110;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=bdnBdXjPaPq22bh3GzRy4ABzX+bcEMJKNRNVLLGgBsg=;
 b=ZuL2udCMxwn5gI+q6+YtLJPvHyiQauuHTEAkzSR37Mf9S/l7ajIqmQYYZluoNVYV+S
 r7amWms85839VXN9elIXHTNnEMMNzZ9mSnouOURlIUn1OqIBuKDwrVokNg5NZn4MRVad
 on9OwOrcpEr8EgFzS++1+/nbd734g0uOW0dDjD1WuLoRsoLrBFZfKkGxNHyNSm1KikhZ
 RGtkIuPeyeG0Yiis8XNXkMsa/nXaUxBH4zwTpWSKJUy8dOB2w6rXrXioQ5tcda+wjtDm
 407b2/CM+yuUzPwLKZXlqnBsRGbY+hp6Jl1QCSLgxnAB/AH51dnHL06bIRUsoPsRUqBg
 2Wxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678915110;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bdnBdXjPaPq22bh3GzRy4ABzX+bcEMJKNRNVLLGgBsg=;
 b=6PKeelg5KZkDgRnKuUpA+MJ5UKOh/PZXsMAiYRDqACmYHfuJbNiZvZW6X/6Laf6jkU
 a3MPln0wTVLdoNyAKEgdU9Zui/V9LwbBKmy/cz8N+/FInjnLN7Oq3UWnI5+rirvi8z16
 FgC7m4fGQ/MBozO3YSM8IOJOlo1fxNUOeuhx+3D8xyaqviUuGwhahNajnnepVkz2PNim
 bFbMWRIccYuEe/mYbGwwjRMtkmJ7yE5L2YRmvRPy086iTUEyX30ic5g4YSv+BnXsTG7j
 fSeiPCAUPXh4nMt13eqHv+65foBMGiIPPNfijZhvoHKNjhBb+Sbwb6fXoSUPJCYp3G7r
 aZ6w==
X-Gm-Message-State: AO0yUKXZchb/iuA65rOtkpzSi8KT2NQVxqOCP+bbA7SDZBHTGUCxUuSP
 Pw7obgK5FoGSKaN+1AaikxMJLxrRrq58CLU9DyU=
X-Google-Smtp-Source: AK7set/jIUXiHKsEUbCoIzuLYS6XHPxHBp77q+c5ZikbCCIGYHgBEO0xRM1r9B0hFYKNvoXYN55JfPSCWpuoRnXBB38=
X-Received: by 2002:a05:6870:11d1:b0:17a:d52e:77de with SMTP id
 17-20020a05687011d100b0017ad52e77demr891023oav.5.1678915109865; Wed, 15 Mar
 2023 14:18:29 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 15 Mar 2023 14:18:18 -0700
Message-ID: <CAF6AEGurNEeARQjVRH3gVcE+qznnfd_NB2n-1s+Tsozcm0t8oQ@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-next-2023-03-15 for v6.4
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

As discussed, an early msm-next pull req for v6.4 with PSR and related
core helper bits.

The following changes since commit dbd7a2a941b8cbf9e5f79a777ed9fe0090eebb61:

  PM / devfreq: Fix build issues with devfreq disabled (2023-01-30
07:37:40 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-next-2023-03-15

for you to fetch changes up to 1844e680d56bb0c4e0489138f2b7ba2dc1c988e3:

  drm/msm/dp: set self refresh aware based on PSR support (2023-03-13
04:43:50 +0300)

----------------------------------------------------------------
msm-next for v6.4

Early pull req with PSR and related drm core helpers

----------------------------------------------------------------
Vinod Polimera (14):
      drm: add helper functions to retrieve old and new crtc
      drm/bridge: use atomic enable/disable callbacks for panel bridge
      drm/bridge: add psr support for panel bridge callbacks
      drm/msm/disp/dpu: check for crtc enable rather than crtc active
to release shared resources
      drm/msm/disp/dpu: get timing engine status from intf status register
      drm/msm/disp/dpu: wait for extra vsync till timing engine status
is disabled
      drm/msm/disp/dpu: reset the datapath after timing engine disable
      drm/msm/dp: use atomic callbacks for DP bridge ops
      drm/msm/dp: Add basic PSR support for eDP
      drm/msm/dp: use the eDP bridge ops to validate eDP modes
      drm/msm/disp/dpu: use atomic enable/disable callbacks for
encoder functions
      drm/msm/disp/dpu: add PSR support for eDP interface in dpu driver
      drm/msm/disp/dpu: update dpu_enc crtc state on crtc
enable/disable during self refresh
      drm/msm/dp: set self refresh aware based on PSR support

 drivers/gpu/drm/bridge/panel.c                     |  68 +++++++-
 drivers/gpu/drm/drm_atomic.c                       |  60 +++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  40 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  26 +++-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  22 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   2 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c                |  80 ++++++++++
 drivers/gpu/drm/msm/dp/dp_catalog.h                |   4 +
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |  80 ++++++++++
 drivers/gpu/drm/msm/dp/dp_ctrl.h                   |   3 +
 drivers/gpu/drm/msm/dp/dp_display.c                |  36 +++--
 drivers/gpu/drm/msm/dp/dp_display.h                |   2 +
 drivers/gpu/drm/msm/dp/dp_drm.c                    | 173 ++++++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_drm.h                    |   9 +-
 drivers/gpu/drm/msm/dp/dp_link.c                   |  36 +++++
 drivers/gpu/drm/msm/dp/dp_panel.c                  |  22 +++
 drivers/gpu/drm/msm/dp/dp_panel.h                  |   6 +
 drivers/gpu/drm/msm/dp/dp_reg.h                    |  27 ++++
 include/drm/drm_atomic.h                           |   7 +
 22 files changed, 683 insertions(+), 43 deletions(-)
