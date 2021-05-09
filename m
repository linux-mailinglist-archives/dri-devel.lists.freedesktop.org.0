Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35271377933
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 01:17:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BEA96E82A;
	Sun,  9 May 2021 23:17:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C40276E82A;
 Sun,  9 May 2021 23:17:35 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so10099741wmy.5; 
 Sun, 09 May 2021 16:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=ePciVVPEBMHi9XfKMWeqEPGTV/ZtJKjK01Vqdn8reZw=;
 b=n95Ng3tuJ4jJ044BYgsu1Kuwh1GV9Sw9uo///kvGaxWKPLOEEgrkpgYOUs7738QRh0
 sHL4/U/Ker7ltuW6goKvOL5sEXhFCudy803FrEHdw8dWiKrfmalwMeRTbjcq8tSML046
 /38J8MJzXBhfs5TBgdn+yMLWonViDHia/Yls/gLrpGWowDrKjU7HqF89GvwY8t5ZVV+W
 TipBUb9X7GCf2Sv58GSQ+lKekIXuu0OyPZAXrEzqN/g7fUW0PLd/pzQa3XAG+rhogBKs
 D0HNiyBWfXI/fg++1KpCVtGuhWM63PayBgN38S6I0uU6bJ3OHC2Pj9VHAJodDAQktCUS
 KNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=ePciVVPEBMHi9XfKMWeqEPGTV/ZtJKjK01Vqdn8reZw=;
 b=EVBoxPDkZlPF0srLHCozMpFUtm6MDTXCXC51QM4XWUphsoO39c6NQZJArNBYRsRidI
 lorb8b6jELHVHrhWrlWsCMIf1/Xd7frVMTsBnzg4NmRJrNit+bCD+orlZjjxMk1Euih1
 JlcXiQgDwjtH9GkPkkRX1/+jCfTFH6w+DU45HEzXPCauRGsT41U/rc9Yt4Y/32/DJhvQ
 TPk8idpI8rMGiPNIgSx52f6N6iBJyAmnVxsauQOjf/yHgVo9F9EuLoJHgWCFC7E4LZrt
 7E8Y2gg61l4aWoMYy/M5TSjZOpK8NTOKSbNiHux7529AxwEeijcq33hfEfc87HrODChi
 jjOg==
X-Gm-Message-State: AOAM532Fy4f+gIr9gcJmeQwUJb9y+5l5LVZ04utIPHKCSgRjlBq9iqhv
 Ag//Kxx3hvxUKH25MqSNxWwbaUCtMSg6pUcybCY=
X-Google-Smtp-Source: ABdhPJyowrQIMEmEuTa2jIzG7Bl2yCWb6/cU2OuM5B+6OrRhpVCUjezV1fRPp33YH/fBciOo9zuIuZjqs5ZHWZ+iOso=
X-Received: by 2002:a05:600c:249:: with SMTP id
 9mr22929827wmj.175.1620602254362; 
 Sun, 09 May 2021 16:17:34 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Sun, 9 May 2021 16:21:16 -0700
Message-ID: <CAF6AEGtmr-X=Cs8V0bJZMAuONcvn8-rfJGuMNXCO9Q39JYEaFQ@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2021-05-09 for v5.13-rc2
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

  https://gitlab.freedesktop.org/drm/msm.git

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
