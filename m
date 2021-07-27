Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E261B3D7A5E
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 18:01:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E9DE6E995;
	Tue, 27 Jul 2021 16:01:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C4FF6E977;
 Tue, 27 Jul 2021 16:01:09 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 f14-20020a05600c154eb02902519e4abe10so2219686wmg.4; 
 Tue, 27 Jul 2021 09:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=fWpsiDeQTO8Umc8Q7ThOZBRvsvug1xPlx+gEHjpKDo8=;
 b=NhSFf8RALH6r8ytAzyNnJjlDi7K3ZO2hoQov4SieOYP7hnmw/e9ee7qfc/BcRkisHV
 w+LXRefabeKfixiOZ49LJ2Gq9TS7gLeQn3H3BvhQeJMi5Eco9Epn6n+ibO8enowAT9en
 zCkdjNkk9ZKc9sWDfI6vaxLd4nvthjJR7FOi4WkHLDfm3Spe/7cDw7nV9fKf8UXsbD1r
 9+e3nr2B5lT8rll0WXlHtW2Dn4IkYvNYxNce6+ljmBzaESd1RtbymOWcyLVAR1v4uGmd
 N+Q3c7lGS8/EpA5mK3aYsSSZ6lTMKJts3qTmWIqMe7oYF7o8K1DG2RiMh7louHmwyITd
 9wgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=fWpsiDeQTO8Umc8Q7ThOZBRvsvug1xPlx+gEHjpKDo8=;
 b=pcbcna1qr/UYgmBSKjgybduqqTTdW66HIyvpOjEBvvwM/jpfEubMKGe2WVNYyHfByD
 9uNteVgu4EMemFhyMsZIA1NWLi/bkjql3E5WrkEhTJzyPcqdgGV+SFp0AYWkX0JB1464
 Kccik1wIv3bP8BHQt5HnF1Bi5ozsMMnGEf2hyBiW/Lu5/NCE4o+KyZL4g/8cTyWNH/F0
 O8A1JswrMVCJvD7jo0TsffK91rF30uf0HRmOGNQLwQ57h2ChOxNs2L8WbWEgQbL/7sBE
 NLfdGYjeNdAnI0TfuQdRr2Cc9kpeP4/0AT0EvknnoLuZpNGJSgvjcB2grddlybbm9pcg
 +S4g==
X-Gm-Message-State: AOAM5337wNqRp1NtNQqR/XgGM3rBzS25E+88w47H6u71+KXx9cezAmuo
 TkDXTQeT5kWPUj5h+C8ATO6i/CuhP8HJZNteV9c=
X-Google-Smtp-Source: ABdhPJxN2KtavHy/pdkhzu3eo2D9p8fkth7CptRD+0XpNLWfxXlcUGZNjiZbbC6EfWX1xl8ICrC13JS3KrlzMfjGrlI=
X-Received: by 2002:a05:600c:19cb:: with SMTP id
 u11mr13331594wmq.175.1627401667801; 
 Tue, 27 Jul 2021 09:01:07 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 27 Jul 2021 09:05:17 -0700
Message-ID: <CAF6AEGubeV_uzWhsqp_+EmQmPcPatnqWOQnARoing2YvQOHbyg@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2021-07-27 for v5.14-rc4
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

A few fixes for v5.14, including a fix for a crash if display triggers
an iommu fault (which tends to happen at probe time on devices with
bootloader fw that leaves display enabled as kernel starts)

The following changes since commit ff1176468d368232b684f75e82563369208bc371:

  Linux 5.14-rc3 (2021-07-25 15:35:14 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-fixes-2021-07-27

for you to fetch changes up to fc71c9e6f41f9912d22a75dfa76bc10811af7e22:

  drm/msm/dp: Initialize dp->aux->drm_dev before registration
(2021-07-27 08:14:58 -0700)

----------------------------------------------------------------
Bjorn Andersson (1):
      drm/msm/dp: Initialize the INTF_CONFIG register

Kuogee Hsieh (2):
      drm/msm/dp: use dp_ctrl_off_link_stream during PHY compliance test run
      drm/msm/dp: signal audio plugged change at dp_pm_resume

Rob Clark (1):
      drm/msm: Fix display fault handling

Robert Foss (1):
      drm/msm/dpu: Fix sm8250_mdp register length

Sean Paul (1):
      drm/msm/dp: Initialize dp->aux->drm_dev before registration

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  2 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c            |  1 +
 drivers/gpu/drm/msm/dp/dp_ctrl.c               |  2 +-
 drivers/gpu/drm/msm/dp/dp_display.c            |  5 +++++
 drivers/gpu/drm/msm/msm_iommu.c                | 11 ++++++++++-
 5 files changed, 18 insertions(+), 3 deletions(-)
