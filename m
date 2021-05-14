Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA94381167
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 22:09:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 381846F451;
	Fri, 14 May 2021 20:09:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A576F451;
 Fri, 14 May 2021 20:09:01 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 p14-20020a05600c358eb029015c01f207d7so305806wmq.5; 
 Fri, 14 May 2021 13:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=9vee9zbKeJ08k4xe/XZutEWn1yTcRHSY9UUPRdL/HXQ=;
 b=gVYhbAwKpL+ipOCZsofpwGVTpgzbCcblvU3WaxpvrC2CMYY6UdIWABp8eoZaO5iN67
 l0DjlqBBn6qBKolaKOvBLfdlxqGqv5fw5Mm8LCjUZ0yQCcMCMcnIfWheVkcKqcM43rOU
 qOIyS1MOttsktudza5OEYdEmqF7ACmhT7C0bpUVpDd+TnKLVyPyYuxoEz16MdaYlYmxL
 tkP+9hYPxfrJynYZqwFbAke1nv5zoKgTvQY5cI3uNTmnvRAfOxmOzz003HaPMT5H1vUe
 ID1mjtkj7gD74zzbyCbf8PsH/V2Lk56d+jYMZUztQMJnM8UryNFcBdz8umAF4i+fhr39
 HNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=9vee9zbKeJ08k4xe/XZutEWn1yTcRHSY9UUPRdL/HXQ=;
 b=V7VXo8xRASYVNYkapxvFfEfQyZo+jSXMrn1EDfTJPS4TqIeEWxsfmWuMmUHeHzm71c
 sCNtcndXBX+aYnTyKtQ3iKMVg+a9ch9LhEILfmt3DwkadptWlnQcckHWSJan+VuddPHC
 R9DaxzOQEb1nQ/Mg96iVYT5ayAllXPEFqbPQaqHNxfzTOqioCEWWKETPZHhNp/pyzEZk
 OMDnMXYbGXB1rKasJyKvEzUaRL+fcw3NvSN3xc7kp+csuBJ9SZQ1sY5tkGqoedgNZvZJ
 mXl4m4lVmYj6VrmsZ0JSI8XYOZqjVZE4rbZYwFqhJisCItbB7NIC0ZO9QO/3B9TXh5Q2
 m2Yg==
X-Gm-Message-State: AOAM532BIR8DlII16mc+fvup4d3InaVpfAe+1hzlTQd1mCHsA/j2lUBO
 CzEc1HLn++WqzRlT32O0Q+LFOUQUmGdwadRIKS0=
X-Google-Smtp-Source: ABdhPJx1lkTJm9rKHYxi7GjduJl398gAg9pDy7QhR05IuHloVqkBr+xdhtf226DwAeMSoQsJqqj/3zgJ733l7f3xrLI=
X-Received: by 2002:a7b:cd8e:: with SMTP id y14mr6087258wmj.164.1621022940229; 
 Fri, 14 May 2021 13:09:00 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 14 May 2021 13:12:42 -0700
Message-ID: <CAF6AEGuqLZDAEJwUFKb6m+h3kyxgjDEKa3DPA1fHA69vxbXH=g@mail.gmail.com>
Subject: [resend][pull] drm/msm: drm-msm-fixes-2021-05-09 for v5.13-rc2
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave & Daniel,

First round of fixes for v5.13

The following changes since commit a29c8c0241654d5f3165d52e9307e4feff955621:

  drm/msm/disp/dpu1: fix display underruns during modeset. (2021-04-09
12:02:35 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-fixes-2021-05-09

for you to fetch changes up to f2f46b878777e0d3f885c7ddad48f477b4dea247:

  drm/msm/dp: initialize audio_comp when audio starts (2021-05-06
16:26:57 -0700)

----------------------------------------------------------------
Dmitry Baryshkov (2):
      drm/msm/dsi: dsi_phy_28nm_8960: fix uninitialized variable access
      drm/msm/dsi: fix msm_dsi_phy_get_clk_provider return code

Jonathan Marek (2):
      drm/msm: fix LLC not being enabled for mmu500 targets
      drm/msm: fix minor version to indicate MSM_PARAM_SUSPENDS support

Kuogee Hsieh (2):
      drm/msm/dp: check sink_count before update is_connected status
      drm/msm/dp: initialize audio_comp when audio starts

Rob Clark (1):
      drm/msm: Do not unpin/evict exported dma-buf's

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c           |  9 +++++----
 drivers/gpu/drm/msm/dp/dp_audio.c               |  1 +
 drivers/gpu/drm/msm/dp/dp_display.c             | 26 ++++++++++++++++---------
 drivers/gpu/drm/msm/dp/dp_display.h             |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c           |  2 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c |  4 ++++
 drivers/gpu/drm/msm/msm_drv.c                   |  2 +-
 drivers/gpu/drm/msm/msm_gem.c                   | 16 ++++++++++++++-
 drivers/gpu/drm/msm/msm_gem.h                   |  4 ++--
 9 files changed, 47 insertions(+), 18 deletions(-)
