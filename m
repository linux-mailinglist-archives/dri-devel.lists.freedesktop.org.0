Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0458B686C5A
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 18:02:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D40B10E42C;
	Wed,  1 Feb 2023 17:02:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6423A10E42C
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Feb 2023 17:02:24 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id v17so7729271qto.3
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Feb 2023 09:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rJPmzdZE4NSQdkz7wFZ0jochMCQuk6LumCoRhBy4k2I=;
 b=NpNPwPTDHN3G1uFG9+p7tm8cd/KNENYKAmYFQUOyf08E0frMjYiYZfKX4mZsZ0cDpw
 NLoXu0SWVmI5DdPr7w1WcuL4PAaYe4gHMVL0Zhj10V0urRokv4hUCXL99ZuUBRLDKKeU
 J0KQpzYzERo6dDnlKT6Bp6HXhTrMrVx5ZO0CU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rJPmzdZE4NSQdkz7wFZ0jochMCQuk6LumCoRhBy4k2I=;
 b=03kpsv2O3OGi25WOoARanGPNAPnZWt3oyXp/9fqwaz061QI2mH5nvGfYU0zno+BRwi
 EEisab1GjgLqlkFhO57xTHS8Ehz/qgSFPZNT8HmYMkj+lgMpZVuevtimTZXTyNWBHZ75
 T2Gew3AtLaQYLThZsrsXLpp067Qjxy3xK+2/WPIJQl5AZ5eNGYgywATYbreRmQGpJGPY
 W4thwiXoUzLRO7/6GCVPi6J3PlQhimaR+G5qhMprkN6pVtj6OJMvCNVgumTpgKxEOlWI
 MEuD6qWVCKyrsfMTDDZ+sbDK6dDn4SDskJLrySqHtyMIdi9lBqDqYpPR31HkUjDGk0IR
 mIkg==
X-Gm-Message-State: AO0yUKXkFeNhAM9eb450jmqb0F5ICziWMUhJCrhQyVvqTfTAXQ4cOJlk
 ohSaOzQtFj/E29Dmh60u2GucDQ==
X-Google-Smtp-Source: AK7set+lamIikr/kqNApkdCRwuHsSMZwS1FCEr1MBVspIUpKMXkXSsrzjcsl8UoPQDimWgcp/SqOxw==
X-Received: by 2002:ac8:59d4:0:b0:3b9:a4ae:9d17 with SMTP id
 f20-20020ac859d4000000b003b9a4ae9d17mr5576168qtf.3.1675270943345; 
 Wed, 01 Feb 2023 09:02:23 -0800 (PST)
Received: from greenjustin3.nyc.corp.google.com
 ([2620:0:1003:314:9334:99d8:1f91:70a])
 by smtp.gmail.com with ESMTPSA id
 z15-20020ac8430f000000b003b646a99aa6sm5549543qtm.77.2023.02.01.09.02.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 09:02:22 -0800 (PST)
From: Justin Green <greenjustin@chromium.org>
To: linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3 v7] drm/mediatek: Add support for 10-bit overlays
Date: Wed,  1 Feb 2023 12:02:07 -0500
Message-Id: <20230201170210.1253505-1-greenjustin@chromium.org>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
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
Cc: chunkuang.hu@kernel.org, Justin Green <greenjustin@chromium.org>,
 airlied@linux.ie, jason-jh.lin@mediatek.com, justin.yeh@mediatek.com,
 wenst@chromium.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series adds support for 10-bit overlays to the Mediatek DRM driver.
Specifically, we add support for AR30 and BA30 overlays on MT8195 devices and
lay the groundwork for supporting more 10-bit formats on more devices.

1. Refactor plane initialization logic to allow individual DDP components to
provide their supported pixel formats.

2. Add AR30 and BA30 support to overlay driver.

3. Enable AR30 and BA30 overlays on MT8195.


Version history:
v2:
 * Rebase and resolve merge conflicts with the AFBC patch.
v3:
 * Moved 10-bit support detection to mtk_disk_ovl.c
v4:
 * Moved formats to mtk_disp_ovl.c and mtk_disp_rdma.c
v5:
 * Minor style adjustments per checkpatch.pl
v6:
 * Refactor patch into patch series.
 * Add formats directly to private data.
v7:
 * Gate setting OVL_CLRFMT_EXT register on compatibility.
 * Split patches for adding 10-bit support and enabling 10-bit support on
   MT8195.


Justin Green (3):
  drm/mediatek: Refactor pixel format logic
  drm/mediatek: Add support for AR30 and BA30 overlays
  drm/mediatek: Enable AR30 and BA30 overlays on MT8195

 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  4 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     | 94 +++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c    | 38 +++++++++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |  4 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  4 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 20 +++++
 drivers/gpu/drm/mediatek/mtk_drm_plane.c    | 24 ++----
 drivers/gpu/drm/mediatek/mtk_drm_plane.h    |  3 +-
 8 files changed, 173 insertions(+), 18 deletions(-)

-- 
2.39.1.456.gfc5497dd1b-goog

