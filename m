Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D201721ADD
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 00:29:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EDE310E110;
	Sun,  4 Jun 2023 22:29:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF7F10E10F;
 Sun,  4 Jun 2023 22:29:27 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-558a79941c6so760272eaf.3; 
 Sun, 04 Jun 2023 15:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685917766; x=1688509766;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=0HYIe7NBs3P4VaCcSqqfBcyZi2lvil1HmX6vOv0yNEs=;
 b=Q/2KGS45cvdOZ9hNhKmQXnE6X8tXuMiyNxBwA7vPtUgEZvZHp9XTAgnmJzDiqhd4T3
 Pmsk4nQGquBXMafK41YK+fdbuxsEw0yu/SDXaErGB2HFawdcslVCuTfLjZIovKgzQVJN
 rqgSqdAQj3Rnc9MCdvrEgQk/qBYTbDxy53LjNOyRF6vrcDzrIJn5hwIBB6NSbLxnXd9X
 KYOXp05O+CIJJslcTQzmkhfRBLiF7RN89+TPd4EBOnc8ZTBdReT7Wse4xRDS4g2Gumv+
 py+7nAAQGFAwa05SE+Iuv4U/vsoXhROy8t6LIYW3Ot5mVBXIAM1xCko3Vy2KeRNKdqVP
 3QEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685917766; x=1688509766;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0HYIe7NBs3P4VaCcSqqfBcyZi2lvil1HmX6vOv0yNEs=;
 b=MY1xH47n+eCS/HacFfQe/wMW6KpsPlrCUgjDvSxm/Ty1nNr75ejNh20jG4nNKsisSk
 W2NUzEP8Uu8rmYnJIiHvltiEdHMxq3YSuYUGUexJwflMIcWrpmUN26IfVSOs9E/z0Crm
 +5dhx399q96smqhswGjEYZ1Jwj0uoK+EyQ3iVPhCf+2pVg2NTcLUVmK/UJdXaxE+U9DC
 wMUjJJ/K7TYfHC/y8e39D9+1d/uiO+Nk3c2YIjbjb7eX6+cfWpNTLOlJHoqkWayNTupE
 u/qaxy8LBCaVpkSoic2FJ3TkVjdHR1w8buanu+1o/gQyUqRNunavu0bQTui9+47sk4o8
 pbAg==
X-Gm-Message-State: AC+VfDyHaWd5pr60nSCcayta0URi6XqA7bZMDS8Qq7dSSIM4Ceg+p89z
 u7dcKRlkiBr26GS7iux1Qogp8aJcyiTa7FaZVs4=
X-Google-Smtp-Source: ACHHUZ4jbbYC91lwNstgBF4Cg9ALfDPcvokzPLiT9nXdqsg66TSnmhhB/lR59A34A8B7NIHdzVg9VH79OKPi21U+vHk=
X-Received: by 2002:a4a:97ca:0:b0:555:7682:7644 with SMTP id
 x10-20020a4a97ca000000b0055576827644mr10516748ooi.2.1685917765747; Sun, 04
 Jun 2023 15:29:25 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Sun, 4 Jun 2023 15:29:14 -0700
Message-ID: <CAF6AEGuHujkFjRa6ys36Uyh0KUr4Hd16u1EMqJo8tOZ3ifVubQ@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2023-06-04 for v6.4-rc6
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
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

A few late fixes for v6.4.. meant to send this out last week but got
distracted setting my new x13s.

The following changes since commit 5c054db54c43a5fcb5cc81012361f5e3fac37637:

  drm/msm: Be more shouty if per-process pgtables aren't working
(2023-05-17 08:53:47 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2023-06-04

for you to fetch changes up to 203a878ae6f483fa6a99895f90bddd425626b9d2:

  drm/msm/a6xx: initialize GMU mutex earlier (2023-06-04 09:59:03 -0700)

----------------------------------------------------------------
A few more late fixes for v6.4-rc6

+ Fix max segment size to address splat on newer a6xx
+ Disable PSR by default w/ modparam to re-enable, since there
  still seems to be a lingering issue
+ Fix HPD issue
+ Fix issue with unitialized GMU mutex

----------------------------------------------------------------
Abhinav Kumar (1):
      drm/msm/dp: add module parameter for PSR

Dmitry Baryshkov (1):
      drm/msm/a6xx: initialize GMU mutex earlier

Kuogee Hsieh (1):
      drm/msm/dp: enable HDP plugin/unplugged interrupts at hpd_enable/disable

Rob Clark (1):
      drm/msm: Set max segment size earlier

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  2 -
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  2 +
 drivers/gpu/drm/msm/dp/dp_catalog.c   | 15 ++++++-
 drivers/gpu/drm/msm/dp/dp_catalog.h   |  3 +-
 drivers/gpu/drm/msm/dp/dp_display.c   | 77 +++++++++++------------------------
 drivers/gpu/drm/msm/msm_drv.c         |  4 +-
 6 files changed, 44 insertions(+), 59 deletions(-)
