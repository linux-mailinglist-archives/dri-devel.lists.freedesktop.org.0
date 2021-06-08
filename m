Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A0539FD99
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 19:29:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F4096E2D7;
	Tue,  8 Jun 2021 17:29:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 060F46E2D7;
 Tue,  8 Jun 2021 17:29:04 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso2502170wmh.4; 
 Tue, 08 Jun 2021 10:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=kh3U0W8lXjrBe5YvME2LiOdCRvieHJMJ/l2oE7LB1q4=;
 b=NRdrRyXDEwt/oe9k+Tty8IVcHBZsLVbq+DP2weSvJsQJprOLjbrKBH9FUSW/HidQ3B
 zpWUt05xhBz7+HDuKHLDIKkx1EOda4j7njFeASretr450sVoQSfu0xNkshyZYm6zMXry
 Ox0ZGApZjtDtUYHRFZ2K/q+d0+vAIYLdBFPe8TtxSMSsLS94ogtbcRP7PTVnB0J/y7uA
 2KfetVbjgfCAHev4ir3yRSup5tOfr/8kVB22oMCcVVm+w0Xcurcx4WMSzFMSyCPwkrTq
 oqQYkY5XY1k6BDgiugP9k2sDx12b83VYjao6popDUYt564Rs/qExfaP42rCXWH02vK9f
 U/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=kh3U0W8lXjrBe5YvME2LiOdCRvieHJMJ/l2oE7LB1q4=;
 b=pRFx1SU8F5rulefwlOFBi6II5VbndbeLswAje+bP8XxejjGnnUbfiFFzTGMZ8/0mEX
 UmNs7Uxtpw3EjE4Zu318dJYB39EIfIetxUEIfZ9iW6aiKZTYtkeu9BgNGSurCatL1ywc
 q3CxOMP4LiebyvfuFP+fGv7R3hHivKFbao+PiRI9g76Zv7Errc9CUKzNmCQIg6xouHph
 sqvWG3ICVR6f2g9YV/kcM6YlMJoOvhz/6+Q8PTs9bMNv7b7GaUvV3BfPgQkWO2829Xxq
 u/XfPKRQoDkcOuZzvYzJChcaoiUsX78+5nRQTkLssGKa8w4dZWKZvRCe20y8Z5U01wWQ
 L7Ug==
X-Gm-Message-State: AOAM532yafgQnr+IgXyWt78F7os3QD/CQTPAygwlR/8/QTciUTVdZMKX
 8jLdHjFiKV5lb3PUEqOje5Veg77aoOlAlNX6Xuo=
X-Google-Smtp-Source: ABdhPJzt6qeJVEAIrJtphShs6jULoPcjL95oJqnADSmPyn9ruBxnkpU2RrhQjbvVA/O4wV96WwrdqeYR1cAMSDyQ6e4=
X-Received: by 2002:a1c:23d6:: with SMTP id j205mr5660343wmj.94.1623173342589; 
 Tue, 08 Jun 2021 10:29:02 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 8 Jun 2021 10:32:56 -0700
Message-ID: <CAF6AEGs+zjKrj2_oU0ByF=UqBgh3oEOuNkNem3eg5HcFhffmBQ@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2021-06-08 for v5.13-rc6
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

A few late fixes for v5.13

The following changes since commit f2f46b878777e0d3f885c7ddad48f477b4dea247:

  drm/msm/dp: initialize audio_comp when audio starts (2021-05-06
16:26:57 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-fixes-2021-06-08

for you to fetch changes up to 924f4cba9e68bf2b4717e7941697db96c6f203be:

  drm/msm/a6xx: avoid shadow NULL reference in failure path
(2021-06-08 10:08:05 -0700)

----------------------------------------------------------------
Alexey Minnekhanov (1):
      drm/msm: Init mm_list before accessing it for use_vram path

Jonathan Marek (3):
      drm/msm/a6xx: update/fix CP_PROTECT initialization
      drm/msm/a6xx: fix incorrectly set uavflagprd_inv field for A650
      drm/msm/a6xx: avoid shadow NULL reference in failure path

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 155 +++++++++++++++++++++++++---------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |   2 +-
 drivers/gpu/drm/msm/msm_gem.c         |   7 ++
 3 files changed, 122 insertions(+), 42 deletions(-)
