Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA1A2EE7FA
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 22:52:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F076E53E;
	Thu,  7 Jan 2021 21:52:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F556E4B7;
 Thu,  7 Jan 2021 21:52:41 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id t30so7090572wrb.0;
 Thu, 07 Jan 2021 13:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=jBwDEco46WJrZ4/CdIGCsb6+UYHdqspvbvO5PyUFa+8=;
 b=qf9+wJXVL0hedizSsg83AjGvVuKjH/bAq226wJ8sK+mhwN4xirQytTbCmwECupbprn
 7eJvY57EbEoUI8wRBH51hBKdBlaK6Klqs2D7ye188Yy1NuzppB7zVhjrN8sPiNNTVoxf
 Scg775uxaWZf2kqC066zboogy6sYyWwH5Fbcq/CjD3GVtNVNsy1aJZeXL4/VwOOq8DEo
 1L+Tic5n5I/+GjolhPj3ta7vs20LIZ7Bh1Ij+FVUnMZLOor6S/L/DPnV+3fFVL+x/LV4
 tGHHsngOh4Z6H+63O44u0d/impVrn6fEPsh6VspkVuuXlU1O64uWBjYYI0ppmfcDx7z9
 eXOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=jBwDEco46WJrZ4/CdIGCsb6+UYHdqspvbvO5PyUFa+8=;
 b=STrUnoo6HNPcwfqeuqkx/9ZyKFja20x64DDrOPfChvdsZt8dhxCqu77rsanNgeW9+r
 0V9dAofAsWyHyhu83Bwr8tgpD5mL0oMyi3BXsKVQb3MSWaPmKz031Gf0DOevInBvZkOy
 i2NPp13eQJys5Ee81YXWxPXfcF7DcMdlEyvf9x1WyW6Z9osUe15PqiRZYST3ax6bt0wY
 mDtIViEkDzd598exPjnwufVhOcFgZWuUdfAi95jNASpK5tWzTGp+DMgY4ZVr8/ExV4nv
 Zy7mqGKHU9wreqaoOaghhoRcn9VICUlMvegs1TQ8AQ1ZSLDcRg4IoPB7WUmCf+CwcYvB
 X9lQ==
X-Gm-Message-State: AOAM530aiDSfFmYQOsmM1y8nhRVUziwJSsnLdl6uxd3QqzI6DSgk7jzU
 xUEyO2DzISXrdWNRRiMRr1nxb/cnMJxMjOHI89o4DcsA
X-Google-Smtp-Source: ABdhPJwYcBtCcsJ3K5mBMg+ivUv+S2pcnin4WMfDGyw3yeGfJ0Xm1I2+hC7pXlosZuqWI4YgOt53wRrPA/Z7D5oJhLE=
X-Received: by 2002:adf:a3c1:: with SMTP id m1mr641279wrb.28.1610056360377;
 Thu, 07 Jan 2021 13:52:40 -0800 (PST)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 7 Jan 2021 13:54:59 -0800
Message-ID: <CAF6AEGtWMhzyD6kejmViZeZ+zfJxRvfq-R2t_zA+DcDiTxsYRQ@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2021-01-07
To: Dave Airlie <airlied@gmail.com>
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
 Abhinav Kumar <abhinavk@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

A few misc fixes

The following changes since commit e319a1b956f785f618611857cd946dca2bb68542:

  drm/msm: add IOMMU_SUPPORT dependency (2020-12-05 08:25:52 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-fixes-2021-01-07

for you to fetch changes up to 00fd44a1a4700718d5d962432b55c09820f7e709:

  drm/msm: Only enable A6xx LLCC code on A6xx (2021-01-07 09:23:05 -0800)

----------------------------------------------------------------
Craig Tatlor (1):
      drm/msm: Call msm_init_vram before binding the gpu

Iskren Chernev (3):
      drm/msm: Fix null dereference in _msm_gem_new
      drm/msm: Ensure get_pages is called when locked
      drm/msm: Add modparam to allow vram carveout

Konrad Dybcio (1):
      drm/msm: Only enable A6xx LLCC code on A6xx

Kuogee Hsieh (1):
      drm/msm/dp: postpone irq_hpd event during connection pending state

Rob Clark (1):
      drm/msm: Fix WARN_ON() splat in _free_object()

 drivers/gpu/drm/msm/adreno/a2xx_gpu.c      |  6 ++++--
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c      |  6 ++++--
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c      |  6 ++++--
 drivers/gpu/drm/msm/adreno/adreno_device.c |  4 ++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 21 ++++++++++++---------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  6 ++++++
 drivers/gpu/drm/msm/dp/dp_display.c        |  7 +++++++
 drivers/gpu/drm/msm/dp/dp_panel.c          | 12 +++++++++---
 drivers/gpu/drm/msm/msm_drv.c              |  8 ++++----
 drivers/gpu/drm/msm/msm_gem.c              | 13 +++++++++----
 10 files changed, 63 insertions(+), 26 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
