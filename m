Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 831995A3838
	for <lists+dri-devel@lfdr.de>; Sat, 27 Aug 2022 16:55:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6057910E130;
	Sat, 27 Aug 2022 14:55:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2807510E130;
 Sat, 27 Aug 2022 14:55:01 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-11dca1c9c01so5624839fac.2; 
 Sat, 27 Aug 2022 07:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc;
 bh=71oNbZSndhwYBZLMwuwcdKtHK8hICgbu4SkrdHGyvgo=;
 b=VADkVaDFrfYfyMS5L6QaKumo8bJEIvIM3jOmOQwSQOYp5l6C7f5otO4udiSpuiSdST
 pplgFeKgaGXOGOlRRqCyIbGjFaKkQsk0yA1mr6efbvmUjQYxKhYVUjRRHa2+TQkOP1vB
 0gu6GpACZTFUcACSKTopz8EqquwyYcktukvrOZf+RcwBOoSnTxa11wrASpMzGpKmQA7S
 XQaHk7GBY92UPjaoE+xX/z8Zi9I9TWGsmYUORxIgdFAdx5/55xO8+530rpvtUzKoY4Ze
 EoBAgUkshuvmafEqNRl9JSAzvRp3HKm4PnuaGszW0gmMv8KXSvjijaXtJr4KewhD9Vya
 ppQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc;
 bh=71oNbZSndhwYBZLMwuwcdKtHK8hICgbu4SkrdHGyvgo=;
 b=lLkbfnr2RxtATaHzn7AG7PW5GZpdsAJFp8pCJLH3T2pYFy+QZPnMuBZItS2SxwXU8B
 GfzCW4wbbtQ2sPMK+yCpOkTMRUkeaWrFzWSLH53l4fweYJWFJ5DssEghxBBdd4w3FU63
 XOO2DQd1whfubfP/1ytaKDNDL6qsiJqWKOw8v9QCN9cZuhzMdk+vf7jdewSAu0rsyFTK
 W3VrpA272zBNfZomIwUjqeJ04VbPWIeJIhY1mFLSqvJS+/up4WJiIXpgwJ/mC20PI6FT
 tUWPkIni1sVeorZj65DymSJ7sQ5EtGWivt3c2Usok/uSCJqTRG0Uf6UeEvO+qVFORrCG
 bovA==
X-Gm-Message-State: ACgBeo3z8zHKHQgSpB/bT0tnGpXoqnQRmJ0Haw2QvwGGkKecAIZCbF46
 dzc7xIkY7gHKVajlueM3I+WKHNYz3Awuw5fjRJc=
X-Google-Smtp-Source: AA6agR5p7lBN/SwHjcKbGWMaSSJ2WyTAkbH2cPGyeYXe1G8vUyraBERGrhqhlzU2aEDBsi3Nx/YMQiaGWNNTzDyNs2c=
X-Received: by 2002:a05:6870:b692:b0:11d:482f:3642 with SMTP id
 cy18-20020a056870b69200b0011d482f3642mr4125585oab.38.1661612100391; Sat, 27
 Aug 2022 07:55:00 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 27 Aug 2022 07:55:36 -0700
Message-ID: <CAF6AEGtuY=jd44itwTkLXVqhnoKgY0BswPTrxDTxCiPG3WbmLA@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2022-08-27 for v6.0
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
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(one more time without forgetting dri-devel this time)

Hi Dave,

A few fixes for the v6.0 cycle.  I meant to send this a bit earlier
but ended up at the bottom of other rabbit holes.  Summary below (and
in tag msg)

The following changes since commit cb77085b1f0a86ef9dfba86b5f3ed6c3340c2ea3:

  drm/msm/dpu: Fix for non-visible planes (2022-07-08 08:10:58 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2022-08-27

for you to fetch changes up to 174974d8463b77c2b4065e98513adb204e64de7d:

  drm/msm/rd: Fix FIFO-full deadlock (2022-08-15 10:19:53 -0700)

----------------------------------------------------------------
Fixes for v6.0

- Fix for inconsistent indenting in function msm_dsi_dphy_timing_calc_v3.
  This fixes a smatch warning reported by kbot
- Fix to make eDP the first connector in the connected list. This was
  mainly done to address a screen corruption issue we were seeing on
  sc7280 boards which have eDP as the primary display. The corruption
  itself is from usermode but we decided to fix it this way because
  things work correct with the primary display as the first one for
  usermode
- Fix to populate intf_cfg correctly before calling reset_intf_cfg().
  Without this, the display pipeline is not torn down correctly for
  writeback
- Specify the correct number of DSI regulators for SDM660. It should
  have been 1 but 2 was mentioned
- Specify the correct number of DSI regulators for MSM8996. It should
  have been 3 but 2 was mentioned
- Fix for removing DP_RECOVERED_CLOCK_OUT_EN bit for tps4 link training
  for DP. This was causing link training failures and hence no display
  for a specific DP to HDMI cable on chromebooks
- Fix probe-deferral crash in gpu devfreq
- Fix gpu debugfs deadlock

----------------------------------------------------------------
Abhinav Kumar (1):
      drm/msm/dpu: populate wb or intf before reset_intf_cfg

Bjorn Andersson (1):
      drm/msm/gpu: Drop qos request if devm_devfreq_add_device() fails

Douglas Anderson (2):
      drm/msm/dsi: Fix number of regulators for msm8996_dsi_cfg
      drm/msm/dsi: Fix number of regulators for SDM660

Kuogee Hsieh (2):
      drm/msm/dp: make eDP panel as the first connected connector
      drm/msm/dp: delete DP_RECOVERED_CLOCK_OUT_EN to fix tps4

Rob Clark (1):
      drm/msm/rd: Fix FIFO-full deadlock

sunliming (1):
      drm/msm/dsi: fix the inconsistent indenting

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 6 ++++++
 drivers/gpu/drm/msm/dp/dp_ctrl.c            | 2 +-
 drivers/gpu/drm/msm/dsi/dsi_cfg.c           | 4 ++--
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c       | 2 +-
 drivers/gpu/drm/msm/msm_drv.c               | 2 ++
 drivers/gpu/drm/msm/msm_gpu_devfreq.c       | 2 ++
 drivers/gpu/drm/msm/msm_rd.c                | 3 +++
 7 files changed, 17 insertions(+), 4 deletions(-)
