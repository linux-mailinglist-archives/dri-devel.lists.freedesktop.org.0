Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42640B5249F
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 01:18:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 230CE10E2E2;
	Wed, 10 Sep 2025 23:18:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="R8wkdR/x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CFD210E2E2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 23:18:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CBE1344134;
 Wed, 10 Sep 2025 23:18:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 940E6C4CEEB;
 Wed, 10 Sep 2025 23:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757546296;
 bh=N5qouKpM2Ppup08aA4wGO8T0cYYdFaA7krwQNVXFOa8=;
 h=From:To:Subject:Date:From;
 b=R8wkdR/xZqh9h8dQ8OgrLd0hxHhROQR6+U5hZQqQSLN1wDUPcvHoVDrOyJ+w/K04b
 cdX4KJFdDFBZpML1QclyFjHwdc0PiXTtnlLbbkvrOMmg7zke1HRCovttpQFS+WKz4N
 UBr9gasCrMM0FPDJJvLFDdTLL38B1abv4y/rvJ/VuRhPvmP4bbX4IJ1PyE6QyIK1rr
 RHXIHDFmQjfyC2spXkMx2cUFAHZzmx9dxD1hC5UjEJNS8QBPJKKgCMvG78g7KtC2c+
 4o77Z9f3ySgPEqov8qkL0Qyeuvk06XwvzsTb0AwFVOPhY2RT64MZKf1B5xL8PE0v9V
 8Kj+xU+v6IfCA==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Johan Hovold <johan@kernel.org>
Subject: [GIT PULL] mediatek drm fixes - 20250910
Date: Wed, 10 Sep 2025 23:18:13 +0000
Message-Id: <20250910231813.3526-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Dave & Daniel:

This includes:
1. fix potential OF node use-after-free

Regards,
Chun-Kuang.

The following changes since commit c34414883f773412964404d77cd2fea04c6f7d60:

  drm/mediatek: mtk_hdmi: Fix inverted parameters in some regmap_update_bits calls (2025-08-28 23:15:41 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-fixes-20250910

for you to fetch changes up to 9ba2556cef1df746fad4d691c8290e235b23c7d1:

  drm/mediatek: clean up driver data initialisation (2025-09-10 12:52:59 +0000)

----------------------------------------------------------------
Mediatek DRM Fixes - 20250910

1. fix potential OF node use-after-free

----------------------------------------------------------------
Johan Hovold (2):
      drm/mediatek: fix potential OF node use-after-free
      drm/mediatek: clean up driver data initialisation

 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)
