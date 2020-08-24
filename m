Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 024D02508A4
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 21:02:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB1B76E0C1;
	Mon, 24 Aug 2020 19:02:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 549E46E0C1;
 Mon, 24 Aug 2020 19:02:20 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id a5so10052537wrm.6;
 Mon, 24 Aug 2020 12:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=ixdaZBEf/bJWyqGfEyqLlCaukcoJXcmOC8zF6EigEiQ=;
 b=b92lgvNrxkMBO2nUp2LnX+1F0/5KZF+ViqMB5ECk2oj13w3XqbcypIfcJLLyp2jLg+
 Z60RfOmE77SnLGRAxUrRkUrcjJsJNn0wykgrju4NGWzPEv4kLAW6RNGoG0cE5y4kAGns
 L7zo/JD9/Cb2a/khaqB4L4Xmr4BmthPv+iUnX/J+y4Z1BQxwb+XxcYzwqxKO+n1WXoJO
 s9COolYeh7elE8E8MqVZmTe6taea2VMf/+Wy2lQ52VaOAOfj3Icp27Y4O/z4PNN2HS18
 CcSGo0A4zofnVyjWDxdHkdEHlYZBs0skLGE4DshyegNFGPdvHPTud/ucRJNrfO+LLkQB
 LGPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=ixdaZBEf/bJWyqGfEyqLlCaukcoJXcmOC8zF6EigEiQ=;
 b=Vkb2fwNSMlrDPCQH9dCUlOWUJoLqnAjTwkqd367kbwbxCh2XBriE3CY3iQbAhv7FCU
 ubw2B9cAHGXrMjfLKvSARd6OcotlE+/wKIP8uta5I0hCP6A+dsqCdy7xn8etj+r/iMng
 CmS6wyjNv5UNXJt6J5C5YP2XSZkdti9iIRq3jIa81uWpSIJj3lIrPG3tY5MRz5ZoIxEC
 70azJHLwlE6yh2tzoFJVPu3nGLUGPZ3EgRrD4kZs04YVC5/hEm0Vdle5UtYG+7uvIpcS
 4hjfH9oX9vOw1xsTDxKuRGuXU5YTbS/0/rDlku8jt522AR/Mo2YXURNaXrINXrPXzYZh
 qxRg==
X-Gm-Message-State: AOAM531Nc9jsLx+c8h4evpDsWhHMLB1rjS5Xk3pWi70adaw+SLXVvuU0
 ku5S9Z9IIlpNW9JQBPsXqFGUfOURKK6j0KqfsBxK+B3LAnqusg==
X-Google-Smtp-Source: ABdhPJxb7xgiv95iPUd8pl9/NHIiGN0yDxgN7uSKxdrP5bbjwtzZNBdQ02evVOM9lrbm73E/Ij0tP8RgxGTTGXfwZSA=
X-Received: by 2002:a5d:4a8a:: with SMTP id o10mr6668363wrq.327.1598295738854; 
 Mon, 24 Aug 2020 12:02:18 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 24 Aug 2020 12:03:06 -0700
Message-ID: <CAF6AEGt45A4ObyhEdC5Ga4f4cAf-NBSVRECu7df3Gh6-X4G3tQ@mail.gmail.com>
Subject: [pull] drm/msm: msm-fixes-v5.9
To: Dave Airlie <airlied@gmail.com>
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

Some fixes for v5.9 plus the one opp/bandwidth scaling patch ("drm:
msm: a6xx: use dev_pm_opp_set_bw to scale DDR") which was not included
in the initial pull due to dependency on patch landing thru OPP tree


The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-fixes-2020-08-24

for you to fetch changes up to 5e0c22d4a9ddae4e784a3e171b9d3d452b37aeb2:

  drm/msm/a6xx: fix frequency not always being restored on GMU resume
(2020-08-22 10:56:45 -0700)

----------------------------------------------------------------
Dmitry Baryshkov (1):
      drm/msm/a6xx: fix gmu start on newer firmware

Jonathan Marek (1):
      drm/msm/a6xx: fix frequency not always being restored on GMU resume

Kalyan Thota (2):
      drm/msm/dpu: Fix reservation failures in modeset
      drm/msm/dpu: Fix scale params in plane validation

Krishna Manikandan (1):
      drm/msm: add shutdown support for display platform_driver

Rob Clark (6):
      drm/msm/dpu: fix unitialized variable error
      drm/msm/adreno: fix updating ring fence
      drm/msm/gpu: make ringbuffer readonly
      drm/msm: enable vblank during atomic commits
      drm/msm/a6xx: fix crashdec section name typo
      drm/msm/a6xx: add module param to enable debugbus snapshot

Sharat Masetty (1):
      drm: msm: a6xx: use dev_pm_opp_set_bw to scale DDR

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c       | 38 ++++++++++++++++++++++-------
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  3 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c  |  4 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c     |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h     |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 20 ++++++++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |  4 +--
 drivers/gpu/drm/msm/msm_atomic.c            | 36 +++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.c               |  8 ++++++
 drivers/gpu/drm/msm/msm_ringbuffer.c        |  3 ++-
 12 files changed, 99 insertions(+), 25 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
