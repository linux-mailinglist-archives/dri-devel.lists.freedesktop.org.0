Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02670349B42
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 21:52:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9C826E0D0;
	Thu, 25 Mar 2021 20:52:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE8AE6E0C6;
 Thu, 25 Mar 2021 20:52:05 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 d8-20020a1c1d080000b029010f15546281so3820721wmd.4; 
 Thu, 25 Mar 2021 13:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=bYspDUN33apg0LraByMLCJKAyWJ3G5vDe8LyXsNfZRY=;
 b=XdqNvHvtj2wwZghDS0ZrF5SEObW3kGDNluXnssbsGIIJbHZpqhyIisxSc1KYVDonmi
 GLE9j2z+P2P8x89LmxVPdJ2fv/Ypb9NNJHGpwJ/AG3gbr/x7gC6eHxq9U/AZ8Q6dO54z
 X/1LYwdpp9lCf2m7/z6gp00EyVB1GycjuzcI11nxPAlwlqI2EOPpIV9UfBgD8CewamP3
 iIkQdr9knbaCgyBVi+stQslK39Jp7Of6q4NWQ4ugZJUdLdyEqHxRzCLrd42UnnXG5CX1
 Ril/kC2Yxf1gsk6jJjfvJl57/8pSdHNnaVhesSha4FRgaMoBY3dO4Fu3siZIJX7AHkJ4
 1Qwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=bYspDUN33apg0LraByMLCJKAyWJ3G5vDe8LyXsNfZRY=;
 b=QDAtG8GOVBptDOHk3G2/v1P6mCLWHGpPjJV4k+PoORoLf0YxokICIRX70kNUMLnuKK
 PRPjWyAmmM7V8eXNCaATwGsdXpPooV7hlOo7E1/u5WcDGj1y7TEtP7QwPz4bwm1iNhI3
 7KEbZNmI6w/xi6cmReXsISwrLedZ8/0GRmLxcNaYOn1J84eD4qeh2LjMwTG7tW4enShl
 ysdECwJKLZwigJCiwlpEzMzXVerf25rmc+ud4o3pu7Qj15U8nfxej427XsUbbe50ZQiv
 si9oBSRKTomoUMx7oROAJzdHV8Lp/S+HcOCoMnq/cw8OI65zm8kaGZ+v6DiaCAnDVIno
 ZTaQ==
X-Gm-Message-State: AOAM53178RXA1jgGgP71lKWvATU4TaVTO1rRYCd8J6bppG7be/TqvOro
 M7CKLuiqEavpX+vg9ksad8cmowcEk5p2pzDmJlo=
X-Google-Smtp-Source: ABdhPJwSBd9Il6DJf6VK0zFKB/+y7G1sSZMcI3jwvMolZAQKlXZlx2+PVU1MtRcxj2RheR+K74bk/HYi4yOdHC700eE=
X-Received: by 2002:a1c:66c4:: with SMTP id a187mr9794034wmc.164.1616705524328; 
 Thu, 25 Mar 2021 13:52:04 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 25 Mar 2021 13:55:18 -0700
Message-ID: <CAF6AEGuZ1gpy4o-2wsLxhY_nRMEt95GTUPhDeS1ad20X4jasVg@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-next-2021-02-07 for v5.12-rc5
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

(resend without missing list cc's)

A few fixes for v5.12

The following changes since commit 182b4a2d251305201b6f9cae29067f7112f05835:

  drm/msm/dp: Add a missing semi-colon (2021-02-07 09:57:04 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-next-2021-02-07

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
