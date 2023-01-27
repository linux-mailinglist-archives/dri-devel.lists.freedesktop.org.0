Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2CD67EBCD
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 18:01:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8A9E10E9B3;
	Fri, 27 Jan 2023 17:01:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32B810E9B3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 17:01:21 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id k4so9925409eje.1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 09:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dzFTpXHUhXTDotyX20Wwv2xLYaCo/6ROJzl2fHpPAUI=;
 b=mCAlWu96wiqEEyvexcLIqK4hsOnBxfYdTJ5jVseyB+41EBRMy1SkCbfr0JmnpinZVt
 kSJgIzPDUwMCzLpkrewarCP5UAe1J8DBefCfMu36VtU2RphRvEqKyc01DfSKNodZwvJF
 pjlw38NqrUDtVjSJIyWtSEpXKmoI6os+aevNkcdxwayqnZbL/qsODA/ziAaVc/HeeVOL
 L+dv82xZFCahMAK97/Ztu+FbsUxmzoC6cZcXUNfrtBHqg/eBw3KwCUp8Cq8I0SWBzxSH
 tQkbPnY584gkS5xzMBU6rVjM6tm/7fLha1fVx4Q6UTWOvG5zRWS0njWCPp5IQMUt2132
 Vitw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dzFTpXHUhXTDotyX20Wwv2xLYaCo/6ROJzl2fHpPAUI=;
 b=BE3/TV4Z+mGh0iruyA0GJh299BHLB422wMp95vlImAdlkmh4g3m7Q9jyIn8LXY2y6d
 tjcBgP0G4S+xiMcIhgttwD8/GHmiEIcJ5/5/zA5B41i3MBcA0z9tGBvXbQldXVlC5Fxu
 Mbl5z/k5Hxp8++0UrQsjBVdgfk6+gai7WEe9g8gGsXVnJwh00RHA29vYWHcOV1VJKJDX
 xmRwkYkuWRnpgcZmAWmtUaVuV5kzwHiTwRDZXIDwO0zOCN9/vWFaXVKuZSEZ58e9k+79
 9TyOutYycGDazk35gSa21N/V1hGUKXtLq17ZJmDgpJ0zDQyx9gWwKYRnVsvvCi0yUvk2
 eYyQ==
X-Gm-Message-State: AO0yUKV0WFnqsZq/8k0s1fJDFcyr+pcjuHn90Kh9G3PsT7fEI4ogGofi
 fhW/3TntdApNC8EOIh9xw7o=
X-Google-Smtp-Source: AK7set/uLNVyKvPS3oX3hGAfVuWPYn6yydQWuoSBzkfIuhTvvD9ZlhhBKDBF+aTltFCZCUnhlebFbQ==
X-Received: by 2002:a17:906:b742:b0:878:7557:bc with SMTP id
 fx2-20020a170906b74200b00878755700bcmr5883469ejb.41.1674838880297; 
 Fri, 27 Jan 2023 09:01:20 -0800 (PST)
Received: from localhost
 (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 dk2-20020a170906f0c200b00877e1bb54b0sm2536626ejb.53.2023.01.27.09.01.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 09:01:19 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Dave Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [GIT PULL] drm/tegra: Changes for v6.3-rc1
Date: Fri, 27 Jan 2023 18:01:19 +0100
Message-Id: <20230127170119.495943-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.39.1
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/tegra.git tags/drm/tegra/for-6.3-rc1

for you to fetch changes up to 2abdd44e3126e29cc310cbf5f1eda7ca7d979df3:

  drm/tegra: nvdec: Use tegra_dev_iommu_get_stream_id() (2023-01-27 17:49:44 +0100)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Changes for v6.3-rc1

This set of changes includes a rework of the custom syncpoint interrupt
code to take better advantage of existing DRM/KMS infrastructure.

There's also various bits of cleanup and fixes included.

----------------------------------------------------------------
Mikko Perttunen (7):
      gpu: host1x: Fix mask for syncpoint increment register
      gpu: host1x: Don't skip assigning syncpoints to channels
      drm/tegra: firewall: Check for is_addr_reg existence in IMM check
      gpu: host1x: Implement syncpoint wait using DMA fences
      gpu: host1x: Implement job tracking using DMA fences
      gpu: host1x: Rewrite syncpoint interrupt handling
      gpu: host1x: External timeout/cancellation for fences

Paul Cercueil (1):
      drm/tegra: Remove #ifdef guards for PM related functions

Thierry Reding (5):
      MAINTAINERS: Update Tegra DRM tree
      gpu: host1x: Use tegra_dev_iommu_get_stream_id()
      drm/tegra: Use tegra_dev_iommu_get_stream_id()
      drm/tegra: vic: Use tegra_dev_iommu_get_stream_id()
      drm/tegra: nvdec: Use tegra_dev_iommu_get_stream_id()

Yushan Zhou (1):
      drm/tegra: Remove redundant null checks before kfree

 MAINTAINERS                                |   2 +-
 drivers/gpu/drm/tegra/dpaux.c              |   6 +-
 drivers/gpu/drm/tegra/firewall.c           |   3 +
 drivers/gpu/drm/tegra/nvdec.c              |  16 +-
 drivers/gpu/drm/tegra/submit.c             |  19 +-
 drivers/gpu/drm/tegra/vic.c                |  39 ++--
 drivers/gpu/host1x/cdma.c                  |  14 +-
 drivers/gpu/host1x/cdma.h                  |   2 +
 drivers/gpu/host1x/context.c               |   8 +-
 drivers/gpu/host1x/debug.c                 |   7 +-
 drivers/gpu/host1x/dev.c                   |   4 +-
 drivers/gpu/host1x/dev.h                   |  10 +-
 drivers/gpu/host1x/fence.c                 | 118 +++++-----
 drivers/gpu/host1x/fence.h                 |  19 +-
 drivers/gpu/host1x/hw/channel_hw.c         |  60 +++---
 drivers/gpu/host1x/hw/hw_host1x06_uclass.h |   2 +-
 drivers/gpu/host1x/hw/hw_host1x07_uclass.h |   2 +-
 drivers/gpu/host1x/hw/hw_host1x08_uclass.h |   2 +-
 drivers/gpu/host1x/hw/intr_hw.c            |  74 ++-----
 drivers/gpu/host1x/hw/syncpt_hw.c          |   3 -
 drivers/gpu/host1x/intr.c                  | 334 +++++------------------------
 drivers/gpu/host1x/intr.h                  |  83 +------
 drivers/gpu/host1x/job.c                   |  12 +-
 drivers/gpu/host1x/syncpt.c                |  98 ++-------
 drivers/gpu/host1x/syncpt.h                |   3 +-
 include/linux/host1x.h                     |  10 +-
 26 files changed, 285 insertions(+), 665 deletions(-)
