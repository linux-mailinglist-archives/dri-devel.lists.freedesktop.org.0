Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E703539A392
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 16:44:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A8576F485;
	Thu,  3 Jun 2021 14:44:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F11BE6F485
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 14:44:48 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id og14so4318305ejc.5
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 07:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZXLqiOa12mOANiH6iRvvdtf+Rzu4NjYP7cxzBWRRCz4=;
 b=O0htkDFetyqZPg96aJ4tEwmk+QMgeSEg2Cv+gVKdr6Z9NSw8vhRn3vABWRYmsuLHWT
 kv8mSJepTmxi9cEk5vQn320xfh7Wrv83OUHQOUxybeGIFOcvRWtVBQAEhYyZ8jvNP5u5
 p1wScg4sc0rmtwnV3JhF47uPFshJkPPG8l7oxYgxOj+8qR7tXCmneMODUHQUqYfUzZoA
 GS2KG5PSdqIZFAVQjQDnRGnJreoKxTdiYCe29qlY2Mk8eoJRykrysnitYGIvOeTgotaB
 j5J+7da/rB3JTRrZnuJDyCHIUEx8Jlq4w7nsRTlTG95O8gUjyjRVMegoTs1C1F9vebHS
 RXEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZXLqiOa12mOANiH6iRvvdtf+Rzu4NjYP7cxzBWRRCz4=;
 b=p+N1jgK0dJgz38mqkY7g0oIpQRUae/WcEQyD07Hsyscb4VmShSh+Hkzy6gt6eTKMsg
 fYYym9N7kU/Jh6w5E2pIA/eX1ZywIX4bkJCIBQMgY57ct4hmahY3V/ycCS3wL31GMloL
 MN2qd43XT+60/YvEYC/1jeok6q7Kajv5QbZv/QU4u+frumedOGEl6wB0QEuJme5CFjkx
 jrz1Lwa2WzpjNzWrmH0wWMlEj0VVyx18Yo9nqsRzla6lA6SbaRVE4OWyHUKX9O+bInbZ
 tw9ysIxJKIiQX+azaeVcj6Ku62mzljC+ZSTaoPvIk8gp1+MxA5MEvtPaWi3iWh6yhKvn
 Fo7Q==
X-Gm-Message-State: AOAM531vSjatvV6hh1KnHK0y7FBgZCRpXoRUN3Q9XzF7BcCRjYXnvMzN
 T/C6jamz3F8NQ/V7+gTxf0OrYpG/4WU=
X-Google-Smtp-Source: ABdhPJyStZwDn50aWLKiU71mTpym6Ev22KVpxVwBfFs2WgoyNdMlal60WPPy4AWvFhNSuuJ3djKucg==
X-Received: by 2002:a17:907:7b9e:: with SMTP id
 ne30mr24962413ejc.389.1622731487699; 
 Thu, 03 Jun 2021 07:44:47 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id v1sm1558622ejw.117.2021.06.03.07.44.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 07:44:46 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Dave Airlie <airlied@gmail.com>
Subject: [GIT PULL] drm/tegra: Fixes for v5.13-rc5
Date: Thu,  3 Jun 2021 16:46:24 +0200
Message-Id: <20210603144624.788861-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.31.1
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

Hi Dave,

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  ssh://git.freedesktop.org/git/tegra/linux.git tags/drm/tegra/for-5.13-rc5

for you to fetch changes up to 671cc352acd3e2b2832b59787ed8027d9f80ccc9:

  drm/tegra: Correct DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT (2021-05-31 14:29:44 +0200)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Fixes for v5.13-rc5

The most important change here fixes a race condition that causes either
HDA or (more frequently) display to malfunction because they race for
enabling the SOR power domain at probe time.

Other than that, there's a couple of build warnings for issues
introduced in v5.13 as well as some minor fixes, such as reference leak
plugs.

----------------------------------------------------------------
Dmitry Osipenko (1):
      drm/tegra: Correct DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT

Lyude Paul (1):
      drm/tegra: Get ref for DP AUX channel, not its ddc adapter

Nathan Chancellor (1):
      drm/tegra: Fix shift overflow in tegra_shared_plane_atomic_update

Pavel Machek (CIP) (1):
      drm/tegra: sor: Do not leak runtime PM reference

Thierry Reding (3):
      gpu: host1x: Split up client initalization and registration
      drm/tegra: sor: Fully initialize SOR before registration
      drm/tegra: sor: Fix AUX device reference leak

 drivers/gpu/drm/tegra/drm.h |  2 +-
 drivers/gpu/drm/tegra/hub.c |  2 +-
 drivers/gpu/drm/tegra/sor.c | 70 +++++++++++++++++++++++++++------------------
 drivers/gpu/host1x/bus.c    | 30 +++++++++++++++----
 include/linux/host1x.h      | 30 +++++++++++++++----
 5 files changed, 92 insertions(+), 42 deletions(-)
