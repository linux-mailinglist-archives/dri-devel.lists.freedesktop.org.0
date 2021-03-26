Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 262B2349E3F
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 01:54:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8EDB6EE94;
	Fri, 26 Mar 2021 00:54:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15BE46EE94;
 Fri, 26 Mar 2021 00:54:44 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id k128so2118645wmk.4;
 Thu, 25 Mar 2021 17:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=YuBwH1yrwebF7YZ6NybwekcKLEftOt6WeljGm7H4DDg=;
 b=JGegx6GQf4y5/ogeQ1Xy/BwSsztBssUrPHuyQ+aiS/vdP+FTBXcxY62BuhK6meFdy+
 sDeVoSkiZ0k4a8xDCoVio7bemOrg7zF0ewEy4mZNwwLJpDl3n7TywbTpBvjwN74fmjKV
 7Nh4rAom4G0hwVZwOLnkSd9pIPNBWcfxSHow7lsjrC48zZfHNkVGsgVhBgiMYIJQUmbR
 LIdbmzUkv9Cpsv3EM7GMApFZo+KZMQVM+C4+8drmsaD0tVB8pe13BmYjJQ6tnueAazKP
 fdg4nOK5zPHwi9Qnyk/mONnaSfPVpkvT057/8y5iRJqrt31W3T1YUXgWl19NedjSKts0
 bllw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=YuBwH1yrwebF7YZ6NybwekcKLEftOt6WeljGm7H4DDg=;
 b=J8Wn9qr1Iln/a79Gtpe7U5WzV0EHIHxhj4o2AuB/A42qNDMJbrCmSyhJWKpIGVEaAr
 8zXyZHAH9nCMFrHyJVVeX+g7IKbc3+bL/Yo3fSW/qUGZErcOs6777elkt48H6DGRbIHH
 xy71GZdmm8bldr6TK24pnlZxcjqgZEp44tpcAleuu1WYku042P/aKND25ZRlcOF5NuA0
 4q+J4cEaRvipTFA9qIyRRApNX/nLALGG7Q7ECb4fS0BtCG9a4MQAqfC30x4tY0LozMF+
 tNIR3H1SdKCLH6g1xhng+8dUV9hWXfodY3O4p5baOcpk0rPz/pitQrgZvlRUpM0Dr4d6
 XlMQ==
X-Gm-Message-State: AOAM530OSdLO9QjDoqQ0g7n1Sh+HWM4RJc0QDoljnDIwJGQCmdaGSI6z
 U2dgQcAYP0xZB9MWBY2Y2NBuuCXHBHZePCNF9eWRFCUyuAc=
X-Google-Smtp-Source: ABdhPJySjv2fOKFXb/unIYRFsUJMvBttGq7FJPdo71XAwOdq0KZm1mAm+csV/a/aLFrziqQozHhoMVGroVUZtwke9Mw=
X-Received: by 2002:a1c:4b15:: with SMTP id y21mr10634934wma.94.1616720082628; 
 Thu, 25 Mar 2021 17:54:42 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 25 Mar 2021 17:57:56 -0700
Message-ID: <CAF6AEGvmiMKRms_NVavD=NA_jbuexZUcqqL35ke7umqpp-TxMw@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2021-02-25 for v5.12-rc5
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
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
 Abhinav Kumar <abhinavk@codeaurora.org>, jordan@cosmicpenguin.net,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave & Daniel,

(resending one more time without git tag copy/paste fail)

A few fixes for v5.12

The following changes since commit 182b4a2d251305201b6f9cae29067f7112f05835:

  drm/msm/dp: Add a missing semi-colon (2021-02-07 09:57:04 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-fixes-2021-02-25

for you to fetch changes up to 627dc55c273dab308303a5217bd3e767d7083ddb:

  drm/msm/disp/dpu1: icc path needs to be set before dpu runtime
resume (2021-03-22 18:52:34 -0700)

----------------------------------------------------------------
Dmitry Baryshkov (4):
      drm/msm/dsi: fix check-before-set in the 7nm dsi_pll code
      drm/msm/dsi_pll_7nm: Solve TODO for multiplier frac_bits assignment
      drm/msm/dsi_pll_7nm: Fix variable usage for pll_lockdet_rate
      drm/msm: fix shutdown hook in case GPU components failed to bind

Douglas Anderson (1):
      drm/msm: Fix speed-bin support not to access outside valid memory

Fabio Estevam (1):
      drm/msm: Fix suspend/resume on i.MX5

Jonathan Marek (1):
      drm/msm: fix a6xx_gmu_clear_oob

Jordan Crouse (1):
      drm/msm: a6xx: Make sure the SQE microcode is safe

Kalyan Thota (1):
      drm/msm/disp/dpu1: icc path needs to be set before dpu runtime resume

Konrad Dybcio (1):
      drm/msm/adreno: a5xx_power: Don't apply A540 lm_setup to other GPUs

Rob Clark (1):
      drm/msm: Ratelimit invalid-fence message

Stephen Boyd (2):
      drm/msm/kms: Use nested locking for crtc lock instead of custom classes
      drm/msm/dp: Restore aux retry tuning logic

 drivers/gpu/drm/msm/adreno/a5xx_power.c   |   2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c     |   2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 108 ++++++++++++++++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c   |  12 ++--
 drivers/gpu/drm/msm/dp/dp_aux.c           |   7 ++
 drivers/gpu/drm/msm/dsi/pll/dsi_pll.c     |   2 +-
 drivers/gpu/drm/msm/dsi/pll/dsi_pll.h     |   6 +-
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c |  11 +--
 drivers/gpu/drm/msm/msm_atomic.c          |   7 +-
 drivers/gpu/drm/msm/msm_drv.c             |  12 ++++
 drivers/gpu/drm/msm/msm_fence.c           |   2 +-
 drivers/gpu/drm/msm/msm_kms.h             |   8 +--
 12 files changed, 119 insertions(+), 60 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
