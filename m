Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E4A4D2619
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 02:53:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD1E10E20E;
	Wed,  9 Mar 2022 01:52:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D24210E201;
 Wed,  9 Mar 2022 01:52:57 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id x15so743707wru.13;
 Tue, 08 Mar 2022 17:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=DRolm/pjPpwXjBsNzyPivKT1VP/HfTnUyLPT4KbhwIA=;
 b=AYWf/940N7BjBvgT3kZA/MQ/JRplQXi8rJ5TX3RSp+GTFeiW+IgoduTSwyftX2fwUT
 KBMPlBWm9bwuQTOPfheaFvUtQ1fg20q6hg+r2O8MdvNLC9UgNU+Jet2NZsMCpy2NmFp/
 bSi8b7DA1SBi7DhKOIgGirEFAIKwTKiQCVs6vkTVXXP5PH5kxqcn0jSvsOeaQAlFm4aJ
 a0M3KXSyD6CjOUxV7T53RqUlASLXM4e3WCgHZ4zQ1VpKBLjf4BnzpKY1SAVTKUzt9AHS
 MTfCyqustZ00b03/sQlBAcmWPHQRCBOnqFmMRnAjYoPtuzhZmAWBEWWF5/8TQ0Ys7mOj
 pqpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=DRolm/pjPpwXjBsNzyPivKT1VP/HfTnUyLPT4KbhwIA=;
 b=XSUvKYhOHKLR0kCluQgfkHhyyX47duu91Io6PvhT+sC/qmRVqR+z9njQVVd4iH9S2D
 VZ0hUVlnAW8uQX+iKsqgVrtGi6mqWT/TCGgOs7n84VRPpz9Lv1iKsdmwB0T+Q3/m7Xzo
 di6eURf9h1oAz/WWyPjhN0zMDD/VNRtAR4P61Gb1OdPfxSTv8XcvyRhg6Te8y6b9woxR
 fJQuUPzdWsqywUay3ZMKfn1BGWe7p32JTvmR0/DoAcVudj/Bjq3cQt+z1QoD6E9HNRTn
 qni7ebgxv/tgZIA3nV9/38qALutJabSZZKf+/qktyOfvkOReoBHwN9tB5Xz3J0ByJ3OK
 OOig==
X-Gm-Message-State: AOAM532ysd2MX7E8ojzPJjGtpA8EV2m1F7h4glOkUUNy1IGlkZWOp0E6
 KyAR89L9MNA1OQQ0MuN1GOI99JzLCdf0ugtB4os=
X-Google-Smtp-Source: ABdhPJzCacRqXQsnY1FN9kqvExgwrcL2s/HF6jgcv+Uy5ST4+qG2xTodxDyNGg0883e3N8tHEcX3Jj3T/MVm3t3fmXY=
X-Received: by 2002:adf:914f:0:b0:1ed:bb92:d0cc with SMTP id
 j73-20020adf914f000000b001edbb92d0ccmr14384019wrj.297.1646790775618; Tue, 08
 Mar 2022 17:52:55 -0800 (PST)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 8 Mar 2022 17:53:25 -0800
Message-ID: <CAF6AEGvwHFHEd+9df-0aBOCfmw+ULvTS3f18sJuq_cvGKLDSjw@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-next-2022-03-08 for 5.18
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
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave & Daniel,

Follow-up pull req for v5.18 to pull in some important fixes.

The following changes since commit afab9d91d872819f98a792c32c302d9e3261f1a1:

  drm/msm/adreno: Expose speedbin to userspace (2022-02-25 13:29:57 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-next-2022-03-08

for you to fetch changes up to 05afd57f4d34602a652fdaf58e0a2756b3c20fd4:

  drm/msm/gpu: Fix crash on devices without devfreq support (v2)
(2022-03-08 13:55:23 -0800)

----------------------------------------------------------------
Dan Carpenter (1):
      drm/msm/adreno: fix cast in adreno_get_param()

Dmitry Baryshkov (1):
      dt-bindings: display/msm: add missing brace in dpu-qcm2290.yaml

Rob Clark (8):
      drm/msm: Update generated headers
      drm/msm: Add SET_PARAM ioctl
      drm/msm: Add SYSPROF param (v2)
      drm/msm/a6xx: Zap counters across context switch
      drm/msm: Add MSM_SUBMIT_FENCE_SN_IN
      drm/msm/a6xx: Fix missing ARRAY_SIZE() check
      drm/msm: Fix dirtyfb refcounting
      drm/msm/gpu: Fix crash on devices without devfreq support (v2)

Rob Herring (1):
      dt-bindings: display/msm: Drop bogus interrupt flags cell on MDSS nodes

 .../bindings/display/msm/dpu-msm8998.yaml          |   4 +-
 .../bindings/display/msm/dpu-qcm2290.yaml          |   5 +-
 drivers/gpu/drm/msm/adreno/a2xx.xml.h              |  26 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |   1 +
 drivers/gpu/drm/msm/adreno/a3xx.xml.h              |  30 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |   1 +
 drivers/gpu/drm/msm/adreno/a4xx.xml.h              | 112 +++-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |   1 +
 drivers/gpu/drm/msm/adreno/a5xx.xml.h              |  63 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   1 +
 drivers/gpu/drm/msm/adreno/a6xx.xml.h              | 674 +++++++++++++--------
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h          |  26 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  42 +-
 drivers/gpu/drm/msm/adreno/adreno_common.xml.h     |  31 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |  22 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   2 +
 drivers/gpu/drm/msm/adreno/adreno_pm4.xml.h        |  46 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4.xml.h           |  37 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5.xml.h           |  37 +-
 drivers/gpu/drm/msm/disp/mdp_common.xml.h          |  37 +-
 drivers/gpu/drm/msm/dsi/dsi.xml.h                  |  37 +-
 drivers/gpu/drm/msm/dsi/dsi_phy_10nm.xml.h         |  37 +-
 drivers/gpu/drm/msm/dsi/dsi_phy_14nm.xml.h         |  37 +-
 drivers/gpu/drm/msm/dsi/dsi_phy_20nm.xml.h         |  37 +-
 drivers/gpu/drm/msm/dsi/dsi_phy_28nm.xml.h         |  37 +-
 drivers/gpu/drm/msm/dsi/dsi_phy_28nm_8960.xml.h    |  37 +-
 drivers/gpu/drm/msm/dsi/dsi_phy_5nm.xml.h          | 480 ---------------
 drivers/gpu/drm/msm/dsi/dsi_phy_7nm.xml.h          |  43 +-
 drivers/gpu/drm/msm/dsi/mmss_cc.xml.h              |  37 +-
 drivers/gpu/drm/msm/dsi/sfpb.xml.h                 |  37 +-
 drivers/gpu/drm/msm/hdmi/hdmi.xml.h                |  37 +-
 drivers/gpu/drm/msm/hdmi/qfprom.xml.h              |  37 +-
 drivers/gpu/drm/msm/msm_drv.c                      |  31 +-
 drivers/gpu/drm/msm/msm_fb.c                       |   4 +-
 drivers/gpu/drm/msm/msm_gem_submit.c               |  42 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |   2 +
 drivers/gpu/drm/msm/msm_gpu.h                      |  29 +
 drivers/gpu/drm/msm/msm_gpu_devfreq.c              |  30 +-
 drivers/gpu/drm/msm/msm_submitqueue.c              |  39 ++
 include/uapi/drm/msm_drm.h                         |  32 +-
 40 files changed, 1144 insertions(+), 1156 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/dsi/dsi_phy_5nm.xml.h
