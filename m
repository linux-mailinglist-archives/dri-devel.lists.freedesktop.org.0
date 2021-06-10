Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A09B03A2FF3
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 17:57:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 903F86ED64;
	Thu, 10 Jun 2021 15:57:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04DCB6ED64;
 Thu, 10 Jun 2021 15:57:18 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id z8so2892410wrp.12;
 Thu, 10 Jun 2021 08:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=0XQj9iBk0d0enFecyQCfBbt7C3fYu8DOKP1wgHfow9A=;
 b=Kbhknve1t+m6hcTJfurnuq0cJBOeysTUuX2xuUlY0dk/mlIu9FA68r3mBcLcVasNCr
 A4Z6vIzkzq98Ghaj1VIiFTrBku8l6msw92HdG2e4giYKr0+bAgcDa9yySvRg3rupy5qW
 Ns5wwFcmIgnSCa22P4to062Y2Wy+cChHeIZ6SafetcwzJChlhSKF48/iubE3kYPcY/8N
 UWougPG7uzwvF7bmOyMQ6Sc8T1NbY5VLqfpsiGLG81YPCU5F35RPwLjN71u4bYyT3Twa
 6E7yr57ErTishfB0NRGZTotoZ6IQOcEZN66Uj+PmYEyOeJesCNIdo+fjcdGFIkzf8vmP
 lfww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=0XQj9iBk0d0enFecyQCfBbt7C3fYu8DOKP1wgHfow9A=;
 b=N5gIaK6WOhCm8RlkN7kWB/RCC2DcGp5St0A3L24iqcZk+RluhlEKHCIab/MbWR8gS0
 wqRiS/bxmQQwEXxsVzroHSo69Qjp6Xzne9YROzkUflkP5j9DnPffuTG7OlaQ9DU0uD0L
 gDS2Yitlr+AJgBecnwyGq59zTX48PL3EMQygM8p1ZWHsV9Qs4JvL8kW1Nd7wK5hJ4PS8
 itA2iLOnKokAuncO6wmdcwlEewSBFjAihCpWsyBesJf5wPXCVl27wkDcHCRgcBT5r2Le
 aKdBTSX1M9mNx0zeOEI4wM5kJCfwgeOaGWVJX5m99n2bbGJ4Y6z/mUUqUHHj0U41ThlL
 wNRg==
X-Gm-Message-State: AOAM531/KC6jZG3ngAXJ8yGeMK/XJvi9bWSikV6EZ7RXX9rBBrYcJtpX
 lFOQIGzl/+ZqISkFoTRPNJtjQem55MpLBsLn8WhNYUXg7gQ=
X-Google-Smtp-Source: ABdhPJxlnpakzn0rO/KvwhuyfvuvJzb6Mq+7HJi6kkLlkKplfRNpwa2l6lIRLvC7ciiJv2Vy+S+FqQk4pY45FyjVERo=
X-Received: by 2002:adf:f552:: with SMTP id j18mr6569688wrp.28.1623340636636; 
 Thu, 10 Jun 2021 08:57:16 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 10 Jun 2021 09:01:11 -0700
Message-ID: <CAF6AEGvbcz0=QxGYnX9u7cD1SCvFSx20dzrZuOccjtRRBTJd5Q@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2021-06-10 for v5.13-rc6
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
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave & Daniel,

A few late fixes for v5.13.  This supersedes the previous fixes pull
and adds a fix for a DSI issue which was preventing display from
coming up on coachz.

The following changes since commit f2f46b878777e0d3f885c7ddad48f477b4dea247:

  drm/msm/dp: initialize audio_comp when audio starts (2021-05-06
16:26:57 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-fixes-2021-06-10

for you to fetch changes up to 170b763597d3a0a79f135e4d83a38462c3964fdf:

  drm/msm/dsi: Stash away calculated vco frequency on recalc
(2021-06-10 07:57:48 -0700)

----------------------------------------------------------------
Alexey Minnekhanov (1):
      drm/msm: Init mm_list before accessing it for use_vram path

Jonathan Marek (3):
      drm/msm/a6xx: update/fix CP_PROTECT initialization
      drm/msm/a6xx: fix incorrectly set uavflagprd_inv field for A650
      drm/msm/a6xx: avoid shadow NULL reference in failure path

Stephen Boyd (1):
      drm/msm/dsi: Stash away calculated vco frequency on recalc

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 155 +++++++++++++++++++++--------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h      |   2 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c  |   1 +
 drivers/gpu/drm/msm/msm_gem.c              |   7 ++
 5 files changed, 124 insertions(+), 42 deletions(-)
