Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD88463ADF6
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 17:40:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C99A10E2F6;
	Mon, 28 Nov 2022 16:39:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77AF510E2F3;
 Mon, 28 Nov 2022 16:39:50 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id q186so12153015oia.9;
 Mon, 28 Nov 2022 08:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=DOBbN+yGOTJblq8Kcqb5gYmtWCZuirUERvLLETmfmEA=;
 b=KUq+4Fh4suvdwDSsDUXMUw66rZgOGwzs52q9I+3ENYDittdcKSClLo3UVV0ayEQS8S
 sEcG7ClD7waTLdN+lVHKkhU3oz16kp7OE6Lur5QBk3zKpyo+Q/6tbuYbXCv9Z9/x4mcI
 eK0IXLICIFWXzwTYhmIZWYHvO0PYUgMiPy/rwf9hZdcjUvBGVMujN+aDpWQqv73WjJ77
 dqgvR6UVM8bBYOeyv/pJE/OkOmjMSvP2lJ4aYmxX3d03SmrhVy9cYndhYZaqDDYRY+6t
 rhD5DQsCuDSzSusgMHGsqjK1sCf/K1O7RuR5k0+gACNL4NYQha9AX+ywkBJXNE/5IkD8
 0ajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DOBbN+yGOTJblq8Kcqb5gYmtWCZuirUERvLLETmfmEA=;
 b=62ORqzQgX8zDxVEJJ7Ia9mYaLH6FEIh4LYnxJ1OSRUgKiOKFcx8D7sQszq9vco13wv
 liG2eVhzx4zcHQU+qYT1ZMmcYeKpNR36zc7IE88BeYsiOPSSu01UMxVT4U0V0FARNS09
 OkWurdGVE4YnIWHs3X98XAs7fQz1wgaMWJ8rUl1lYrX5rhhHexoLCO6pXqwMoDRMHBGM
 j1DXjfw7rzqnZT8bqLNF4s7HBjIQ0Jpzx5qlu1EbZdHUfw9jS3X9YlmphL5oyQZcHrhh
 ONn3RMx7ymVi9YIdi5TvaRFeuCH1GRyoXUNdOdLcKq5y5+mxEjyAV+sIWXe3OTMZDrSF
 a9sQ==
X-Gm-Message-State: ANoB5pnR6eFtwRKWy13H24e7FjUOQl4RaDNztKm3eJdA1awlQjlZs0xx
 zsNIPprzF82nTszc2xtaABOytSQ93TAJQo0pNoRknQbKrOA=
X-Google-Smtp-Source: AA0mqf4S1IOj9AcvlZXtlLm+aCrlaJsKesQnaEcd5iOyI1R7KhOltGzgZn7tfxhi3OaspVR4xjnoH45OM9whV4iQPIs=
X-Received: by 2002:aca:3984:0:b0:35b:94a8:4f89 with SMTP id
 g126-20020aca3984000000b0035b94a84f89mr7535447oia.183.1669653589598; Mon, 28
 Nov 2022 08:39:49 -0800 (PST)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 28 Nov 2022 08:39:39 -0800
Message-ID: <CAF6AEGvT1h_S4d=YRgphgR8i7aMaxQaNW8mru7QaoUo9uiUk2A@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-next-2022-11-28 for v6.2
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

Here are the gpu/gem bits for v6.2.  Dmitry already sent a separate
pull request[1] for the display bits.  Summary below and in tag.

[1] https://patchwork.kernel.org/project/dri-devel/patch/20221126102141.721353-1-dmitry.baryshkov@linaro.org/

The following changes since commit 7f7a942c0a338c4a2a7b359bdb2b68e9896122ec:

  Merge tag 'drm-next-20221025' of git://linuxtv.org/pinchartl/media
into drm-next (2022-10-27 14:44:15 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-next-2022-11-28

for you to fetch changes up to d73b1d02de0858b96f743e1e8b767fb092ae4c1b:

  drm/msm: Hangcheck progress detection (2022-11-17 10:39:12 -0800)

----------------------------------------------------------------
msm-next for v6.2 (the gpu/gem bits)

- Remove exclusive-fence hack that caused over-synchronization
- Fix speed-bin detection vs. probe-defer
- Enable clamp_to_idle on 7c3
- Improved hangcheck detection

----------------------------------------------------------------
Rob Clark (6):
      drm/msm: Remove exclusive-fence hack
      drm/msm/a6xx: Fix speed-bin detection vs probe-defer
      drm/msm: Enable clamp_to_idle for 7c3
      drm/msm: Enable unpin/eviction by default
      drm/msm/adreno: Simplify read64/write64 helpers
      drm/msm: Hangcheck progress detection

 drivers/gpu/drm/msm/adreno/a4xx_gpu.c       |  3 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c       | 27 ++++------
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c   |  4 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 84 ++++++++++++++++++-----------
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  3 +-
 drivers/gpu/drm/msm/msm_drv.c               |  1 -
 drivers/gpu/drm/msm/msm_drv.h               |  8 ++-
 drivers/gpu/drm/msm/msm_gem_shrinker.c      |  2 +-
 drivers/gpu/drm/msm/msm_gem_submit.c        |  3 +-
 drivers/gpu/drm/msm/msm_gpu.c               | 31 ++++++++++-
 drivers/gpu/drm/msm/msm_gpu.h               | 22 +++++---
 drivers/gpu/drm/msm/msm_ringbuffer.h        | 28 ++++++++++
 12 files changed, 150 insertions(+), 66 deletions(-)
