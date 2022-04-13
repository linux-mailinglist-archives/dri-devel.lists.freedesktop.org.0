Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 304674FFCAD
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 19:28:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C348110E0CC;
	Wed, 13 Apr 2022 17:28:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59CD310E0CC;
 Wed, 13 Apr 2022 17:28:19 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id i20so3595673wrb.13;
 Wed, 13 Apr 2022 10:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=wmTTJc7cl6oOaGuqAfmrOjx/4kHHCDLsI0qGb1ByPRU=;
 b=Gv0EL/ZxgM6nD/QdcZ5kwRGNHJ/sBQhPXzudfQnBcFAvkiSRamLbDDwEAKzysR8fZi
 mphBn6flOXPHW3LAXs+Zd7s8O6qADVOFbZuBCNbn2gtGKkEymkN7XVYhG5DDDlAOWzOs
 utVWGr4rUfXkLa1DITlFJhpDRVozlE8qDeGyew1EEQNZA7eFCTEk6OI5rooUkOn6p++C
 APPgG08rQY1IRAV84oExr/vkG4PDnweWiJMBqkfM0CP9jT/jSpJtkEXo1thptFAYRnji
 oWb/VLM2mdQ30uAjW4CXZlO78guqimS2qA4OgPDAU8xJVc1JEWf1a/+qrr4bfQCW3i1a
 MPGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=wmTTJc7cl6oOaGuqAfmrOjx/4kHHCDLsI0qGb1ByPRU=;
 b=aecjPUJulwZVaJ5eXZtR11580t1vnPknA5u9Au1ctYCE5IwvKpyaLz1tlGRN4jyT7o
 5lcNF+/4C1PwiHeYaKdzqDaSLJn2Aut4WMxVY4Q67eNCzRR6hZo1Vz2jsXGWd5t/KcK+
 QSYBRNWPCIu+cH0fj7grUv07iXXO+4buyaFbF02yXyrRzHajEZUb30TxLUXCTvzo0src
 fWln0JJ+YpvRkxLp2srJI2NndVVlKdRN2yfCdKMxW7hLUWzgyynFKsCNHwZpiIJgX6dr
 Z0a/hl2T6JuPgVQV3NghBJgH278EBc1LsdRTsXygatTYFlVAVcF3Ga209MRFZcYQbpYF
 m0wg==
X-Gm-Message-State: AOAM532NQAWq2OCFPfbWE2riJxamqN4uf8q69TDU/dEsm7lkmIon6fn2
 zGrNMp3zR9JYovHjz8wnyZQm+Ds1wTxnRd6T81U=
X-Google-Smtp-Source: ABdhPJyZ1BaUvX4fdp9fHfEfMZEDBiKMqmJvGwIR/qqtcLJHzy6ocEtB/UGcnZkibsi6xA0n8HSz3NR+93CMmZd70x0=
X-Received: by 2002:adf:9111:0:b0:206:c9b:ce0d with SMTP id
 j17-20020adf9111000000b002060c9bce0dmr33934513wrj.418.1649870897772; Wed, 13
 Apr 2022 10:28:17 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 13 Apr 2022 10:29:20 -0700
Message-ID: <CAF6AEGvuTwx09MKwK68KWXqi4o7LxDGMUz1=Z7xOS+i=OV84Ug@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2022-04-13 for v5.18
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
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave & Daniel,

A few fixes for v5.18.

The following changes since commit 05afd57f4d34602a652fdaf58e0a2756b3c20fd4:

  drm/msm/gpu: Fix crash on devices without devfreq support (v2)
(2022-03-08 13:55:23 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-fixes-2022-04-13

for you to fetch changes up to 390d645877ffd6dcb55f162d618045b2779217b3:

  drm/msm/gpu: Avoid -Wunused-function with !CONFIG_PM_SLEEP
(2022-04-11 18:35:31 -0700)

----------------------------------------------------------------
Dmitry Baryshkov (1):
      dt-bindings: display/msm: another fix for the dpu-qcm2290 example

Kuogee Hsieh (1):
      drm/msm/dp: add fail safe mode outside of event_mutex context

Marijn Suijten (1):
      drm/msm/dpu: Use indexed array initializer to prevent mismatches

Nathan Chancellor (1):
      drm/msm/gpu: Avoid -Wunused-function with !CONFIG_PM_SLEEP

Rob Clark (5):
      drm/msm/gpu: Rename runtime suspend/resume functions
      drm/msm/gpu: Park scheduler threads for system suspend
      drm/msm/gpu: Remove mutex from wait_event condition
      drm/msm: Add missing put_task_struct() in debugfs path
      drm/msm: Fix range size vs end confusion

Robin Murphy (1):
      drm/msm: Stop using iommu_present()

Stephen Boyd (1):
      drm/msm/dsi: Use connector directly in msm_dsi_manager_connector_init()

Xiaoke Wang (2):
      drm/msm/disp: check the return value of kzalloc()
      drm/msm/mdp5: check the return of kzalloc()

 .../bindings/display/msm/dpu-qcm2290.yaml          |  4 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c         | 80 +++++++++++++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  | 34 ++++-----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c         |  3 +
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c  |  2 +
 drivers/gpu/drm/msm/dp/dp_display.c                |  6 ++
 drivers/gpu/drm/msm/dp/dp_panel.c                  | 20 +++---
 drivers/gpu/drm/msm/dp/dp_panel.h                  |  1 +
 drivers/gpu/drm/msm/dsi/dsi_manager.c              |  2 +-
 drivers/gpu/drm/msm/msm_drv.c                      |  2 +-
 drivers/gpu/drm/msm/msm_gem.c                      |  1 +
 12 files changed, 109 insertions(+), 48 deletions(-)
