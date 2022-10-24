Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E20160BD79
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 00:34:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C36C10E080;
	Mon, 24 Oct 2022 22:34:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 104F310E080;
 Mon, 24 Oct 2022 22:34:07 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-13ae8117023so13535102fac.9; 
 Mon, 24 Oct 2022 15:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=WEZlKPYChGQr1+VGAAt6W/HLpia5/ZeW0QQ5/N5bwR0=;
 b=dW6LySjisQk//shmQcl7lUzXTj1nVF9WlPTS7i6LkISArKQSeQKwK18PPNx2JEsCfV
 +0yr+7G+kJTwA1c8lqdkn4biKDpZWTsH1+8WQw4HrV71awfl0H+O070JALvJGK0v2xh2
 dCOii3AQ2ysH6VDzv5WUnka79Lz1loNtqyUj+J2wms+7sNnFHH+mZBibFQM2+hSzWgpa
 /ACraTdetdXfCX69CNC908LLgqrfob60Ont5WC197a0DL06uO2xU8sHdqYnbs6BVs4Ci
 +puZO9qBYGB3JwSHjLMWyrjX52p3H7U5Z88ICz0d5HEeHWpPLTT6qvgCWcV3yiKn882z
 5M3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WEZlKPYChGQr1+VGAAt6W/HLpia5/ZeW0QQ5/N5bwR0=;
 b=4tzk6ZvG5zdOSdDfdbmtWGXTVspTCq6hYbky+NUgCvJ74p8d3f9Er0+6XKNISoD5/A
 GP9+VWVFQCwDqA1xtUNOM4mnaU+yVckSBjy0W75omz4g1wh18sku00kMWqviRsRCvlma
 UDt8iDc7zzP/kwo7Cwi0eiki/pmPDD507kI/QYp3yOEPObeV2mhAZGOxknR39WH0FxiY
 8wOSoZK1U+bF1KymVDKyS56O9UHBbV3tSjCu+xgv4dJXJeVmwCG+OZFeIuv5VVXK2lb8
 ch9iIXX86m8kVbd9Dr+MYyrA+YrJ9UokAdAvcd+YowJHDlXKZfkdUt8td2KBCRJ2cikl
 g3RA==
X-Gm-Message-State: ACrzQf3efFMPnp+sLR5znBTt47WjQNASfcHIeZ6YYUSdSaTewA/xWmC6
 wWfqA6rTxI+8U501g7ffNnQVZVIAIDQPI9bo/NE=
X-Google-Smtp-Source: AMsMyM5S3puKmXs+dNgDJ9sW/bgFwo+QT8mbJCuoqMrSpTojL+qxBiFfkuQW2TTs9sYvjk5HkEJjbAHOIqpfjY9AVG4=
X-Received: by 2002:a05:6871:6a4:b0:13b:a056:f97f with SMTP id
 l36-20020a05687106a400b0013ba056f97fmr5103622oao.38.1666650846113; Mon, 24
 Oct 2022 15:34:06 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 24 Oct 2022 15:34:15 -0700
Message-ID: <CAF6AEGveadezhqm=Sra7Jq4A3tFAp_eBmKKOoHLnapN03pVoLw@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2022-10-24 for v6.1-rc3
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
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

A few fixes for the v6.1 cycle.  Summary below.

The following changes since commit e8b595f7b058c7909e410f3e0736d95e8f909d01:

  drm/msm/hdmi: make hdmi_phy_8996 OF clk provider (2022-09-18 09:38:07 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2022-10-24

for you to fetch changes up to e0e86f25fd469ca76c1b50091372aed1ff99ca1a:

  drm/msm: Kconfig: Fix spelling mistake "throught" -> "through"
(2022-10-14 09:33:12 -0700)

----------------------------------------------------------------
msm-fixes for v6.1

- Fix shrinker deadlock
- Fix crash during suspend after unbind
- Fix IRQ lifetime issues
- Fix potential memory corruption with too many bridges
- Fix memory corruption on GPU state capture

----------------------------------------------------------------
Aashish Sharma (1):
      drm/msm: Remove redundant check for 'submit'

Akhil P Oommen (2):
      drm/msm/a6xx: Replace kcalloc() with kvzalloc()
      drm/msm/gpu: Fix crash during system suspend after unbind

Colin Ian King (1):
      drm/msm: Kconfig: Fix spelling mistake "throught" -> "through"

Johan Hovold (8):
      drm/msm: fix use-after-free on probe deferral
      drm/msm/dp: fix memory corruption with too many bridges
      drm/msm/dsi: fix memory corruption with too many bridges
      drm/msm/hdmi: fix memory corruption with too many bridges
      drm/msm/dp: fix IRQ lifetime
      drm/msm/dp: fix aux-bus EP lifetime
      drm/msm/dp: fix bridge lifetime
      drm/msm/hdmi: fix IRQ lifetime

Kuogee Hsieh (2):
      drm/msm/dp: add atomic_check to bridge ops
      drm/msm/dp: cleared DP_DOWNSPREAD_CTRL register before start link training

Nathan Huckleberry (1):
      drm/msm: Fix return type of mdp4_lvds_connector_mode_valid

Rob Clark (4):
      drm/msm/gem: Unpin objects slightly later
      drm/msm/a6xx: Fix kvzalloc vs state_kcalloc usage
      drm/msm/a6xx: Skip snapshotting unused GMU buffers
      drm/msm/a6xx: Remove state objects from list before freeing

 drivers/gpu/drm/msm/Kconfig                        |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        | 14 +++++++--
 drivers/gpu/drm/msm/adreno/adreno_device.c         | 10 ++++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |  7 ++++-
 .../gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c    |  5 ++--
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   | 13 ++++-----
 drivers/gpu/drm/msm/dp/dp_display.c                | 23 +++++++++++++--
 drivers/gpu/drm/msm/dp/dp_drm.c                    | 34 ++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_parser.c                 |  6 ++--
 drivers/gpu/drm/msm/dp/dp_parser.h                 |  5 ++--
 drivers/gpu/drm/msm/dsi/dsi.c                      |  6 ++++
 drivers/gpu/drm/msm/hdmi/hdmi.c                    |  7 ++++-
 drivers/gpu/drm/msm/msm_drv.c                      |  1 +
 drivers/gpu/drm/msm/msm_gem_submit.c               |  9 +++---
 drivers/gpu/drm/msm/msm_gpu.c                      |  2 ++
 drivers/gpu/drm/msm/msm_gpu.h                      |  4 +++
 drivers/gpu/drm/msm/msm_ringbuffer.c               |  3 +-
 17 files changed, 120 insertions(+), 31 deletions(-)
