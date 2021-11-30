Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A915464212
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 00:10:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED8446E03F;
	Tue, 30 Nov 2021 23:10:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD3C6E03F
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 23:10:16 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id z7so23515072lfi.11
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 15:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9AK1GJRUxxwNuwoBrLGoSOJFNKqVHQhLKUbE8ei09Fo=;
 b=PyPvqsasaTmSwk/nM+ISRUx+cnE3Qm9dW4HBLYLEhzTwmFHWE7dWTmBz5APhHJtiJT
 IunDl7PxcYbGlbbH14Tc+8rh9oGcvxZX4u7T4hx+wt1J4omIEK0xTQGVV5I2aadMMLw6
 clz3cdx93w0U+mve/K2JsMvamznGvFk74w1dZQm0gMs7MzRjF5VLahdsISL9W1/d8CiS
 JZ5rKoLDnKiQRFrkGn9K1KHPhF0ncGLaRWl/FaRZMV6rQdosuZz2DCbc78UIWZyRtu2D
 8OxOrJejOcUYvWScqcru/42pHbl4mkCPhz2mAKXshoU2R+vM7SpnqRC3uS2K2Hm28uF6
 VUQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9AK1GJRUxxwNuwoBrLGoSOJFNKqVHQhLKUbE8ei09Fo=;
 b=MHy2g9RzeSti2r+NThCBd8JRa4Mjf2LHt9Wu1gnQlp1qmMx4+qO0NCNGwYObSQXwqH
 AtkJCoRxuQoJJ2f2dN+GwrF1CGOkP04CcvVyAzUx1Nz9eHVaqCBX2/eT8UugVKAHC5aA
 kIMOELr8hyTIS1lWcdzjyvLLgPAeo/gBIeg6H8v5czLCxLFU+NT2NT1sL0ry4bmwSMtb
 IVtA2PEjHRivoWYL7tfHToq/DIGNPpZ0pidI46OvYNuequPbRsm6/DMBLl2DdSSVp0j6
 glGhW/O930a4pSxvnp6cb7/YxnNGMgRFuOPAri1rzH+IzYVmQw7wbQMSr4sLAUh+t90/
 dcgQ==
X-Gm-Message-State: AOAM532FdlS2x/88sBquIOIJgo/4VgKyOotsQJXacf9v5sepfolR2EF+
 yqI/gLOl1Hutbd/uBZujRKU=
X-Google-Smtp-Source: ABdhPJwU742CHSh+SdR7WnEFyG0sTjhEbgVGjUL59FrH2/nPrx+4ou2/uazsEtX92zlhly1gL+J9PA==
X-Received: by 2002:a05:6512:33c9:: with SMTP id
 d9mr2045014lfg.615.1638313815095; 
 Tue, 30 Nov 2021 15:10:15 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id k14sm2099846lfu.210.2021.11.30.15.10.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 15:10:14 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Graichen <thomas.graichen@gmail.com>
Subject: [PATCH v2 0/4] Restore Tegra DRM on Nyan Big Chromebook
Date: Wed,  1 Dec 2021 02:09:53 +0300
Message-Id: <20211130230957.30213-1-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset restores regressed SOR driver probing on Nyan Chromebook.

Changelog:

v2: - Changed host1x and Tegra DRM drivers such that DRM device is
      registered early now. This removes the need to change DRM core.

    - Introduced dev_err_probe() patch again. Previously Thierry rejected
      it, saying that he likes his variant more, but I kept that patch in
      grate kernel and it happened to be very handy to have because I
      instantly identified the problem in the DP AUX driver with it,
      which would've been much more difficult to do otherwise.
      Please apply it this time.

Dmitry Osipenko (4):
  gpu/host1x: Add init/deinit callbacks to host1x driver framework
  drm/tegra: Create DRM device early
  drm/tegra: dpaux: Restore DP AUX DDC registration order
  drm/tegra: Use dev_err_probe()

 drivers/gpu/drm/tegra/dc.c    | 13 +++-------
 drivers/gpu/drm/tegra/dpaux.c | 26 +++++++++++++-------
 drivers/gpu/drm/tegra/drm.c   | 46 +++++++++++++++++++++++++----------
 drivers/gpu/drm/tegra/drm.h   |  2 ++
 drivers/gpu/drm/tegra/hdmi.c  | 34 +++++++-------------------
 drivers/gpu/host1x/bus.c      | 15 ++++++++++++
 include/linux/host1x.h        |  4 +++
 7 files changed, 83 insertions(+), 57 deletions(-)

-- 
2.33.1

