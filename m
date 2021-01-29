Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F783308D7F
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 20:38:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 925CD6EC12;
	Fri, 29 Jan 2021 19:38:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07CCA6EC0D
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 19:38:13 +0000 (UTC)
Received: by mail-qv1-xf32.google.com with SMTP id es14so5021734qvb.3
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 11:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4fGzrN6PFTAJYkRPyb9kzsjSHgmSvwhuhlysknOYXYA=;
 b=i6oSb7UAaMqU4PIDGWm0yU7Y/uPJJh1eDrYwsw3CF/XyUsSZAr9es25MVA2DGtlBFz
 u7rhUfXmjPZeIKdsIN/pY4LwCDQzqLl8oYX0AUHSjMyfQs+BHCa7KAOE/Naw9LO7Vxrw
 ZRjzLLaejtrFnBuNSrHN5Hc6hyow6BWajlW8OC9xDNUtK4a8CJE6R8q4P0lCCOHWOd+B
 JM50toQNcZke7C0UdF60Zcnt0cqe1wUU1qzLZ8gZuK7e9qQnS3BjBA9E0f6RvLWm18lR
 5InP1O48dP07vCLuj4Eq+I3ISlmtCgGEbWfxwiwOJPqGd46oObORvcm3qVMzSBMcE/c9
 7lGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4fGzrN6PFTAJYkRPyb9kzsjSHgmSvwhuhlysknOYXYA=;
 b=EOw5GIh00uV7WLP+iP0ga9jJcQTYIihHb4e+7eA/zMf+DVMi8PopohKhdgkt/dLmkt
 PjKDntzAAP+v//z2QPkepat3msf5q13BKmFk46ro8iBwH3wzbbG54qGzagX6AYJKgFYx
 BcO/Y7mHaIBCXWOJ1lispiYBjTy9ktIfCkN6YgG63Xwz5guAFWi4i0GRfRMuMKrc5uwl
 ynykagBsrWxN0udoUiFmmKy2CMEnhFwz+j3JLD7py9mGlEQaBA33SHSQ7ZqqrIeLX1z7
 /tNQbW//4jaYkEfyxUZBzxFOKQvh9GYF3iDRgOHfvFwgAHnIWiEbAfbymG+r+/SwaPg5
 /WwA==
X-Gm-Message-State: AOAM532qzZjFNDGztZQRSJy2377wZRf9bhde0uxkwZSR8UJYTsfT4MXK
 PrMDyUYWqjFertWZ6F39Q+s=
X-Google-Smtp-Source: ABdhPJytot/Qn5Gn2Zuh5rqErTSAuk9UolhUla6tra+YOX2FqMS77YGZywgL7wPppFvu2Vop4MVMlg==
X-Received: by 2002:a0c:b4d1:: with SMTP id h17mr5299486qvf.53.1611949091101; 
 Fri, 29 Jan 2021 11:38:11 -0800 (PST)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id r17sm6389910qta.78.2021.01.29.11.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 11:38:10 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Dave Airlie <airlied@gmail.com>
Subject: [GIT PULL] drm/tegra: Changes for v5.12-rc1
Date: Fri, 29 Jan 2021 20:38:07 +0100
Message-Id: <20210129193807.3653456-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  ssh://git.freedesktop.org/git/tegra/linux.git tags/drm/tegra/for-5.12-rc1

for you to fetch changes up to dcdfe2712b68f1e9dbf4f1a96ad59b80e5cc0ef7:

  drm/tegra: Fix reference leak when pm_runtime_get_sync() fails (2021-01-15 17:24:51 +0100)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Changes for v5.12-rc1

Adds support for newer firmware image versions of the Video Image
Composer (VIC) and adds a comment clarifying the use of the STREAMID
registers. Fixes a couple of issues with display and gr2d on older
Tegra SoCs such as Tegra114, as well as a runtime PM reference leak.

----------------------------------------------------------------
Dmitry Osipenko (3):
      drm/tegra: dc: Enable display controller driver for Tegra114
      drm/tegra: gr2d: Correct swapped device-tree compatibles
      drm/tegra: gr2d: Add compatible for Tegra114

Mikko Perttunen (2):
      drm/tegra: falcon: Support newer VIC firmware
      drm/tegra: vic: Add comments on STREAMID registers

Qinglang Miao (1):
      drm/tegra: Fix reference leak when pm_runtime_get_sync() fails

 drivers/gpu/drm/tegra/dc.c     |  2 +-
 drivers/gpu/drm/tegra/drm.c    |  2 ++
 drivers/gpu/drm/tegra/dsi.c    |  2 +-
 drivers/gpu/drm/tegra/falcon.c |  9 +++++----
 drivers/gpu/drm/tegra/gr2d.c   |  9 +++++++--
 drivers/gpu/drm/tegra/hdmi.c   |  2 +-
 drivers/gpu/drm/tegra/hub.c    |  2 +-
 drivers/gpu/drm/tegra/sor.c    |  2 +-
 drivers/gpu/drm/tegra/vic.c    | 35 ++++++++++++++++++++++++++---------
 9 files changed, 45 insertions(+), 20 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
