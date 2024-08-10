Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D426F94DB91
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2024 10:46:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39B1610E0D8;
	Sat, 10 Aug 2024 08:46:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AmHpmIju";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D20710E0D8
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Aug 2024 08:46:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4C854CE0187;
 Sat, 10 Aug 2024 08:46:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25D43C4AF0B;
 Sat, 10 Aug 2024 08:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723279569;
 bh=uuGEKR0BKRSgVDib/MHJw9Zq0t+U20X3OrWUZeKAIIU=;
 h=From:To:Subject:Date:From;
 b=AmHpmIjuA6iOICMQNYDH2mgjmUkcvJR3POw7IOTy9WEVxiI44WQGL8JqL7rqwEaXu
 gqrgY1QYH6hcwlW4i7V0b0uWM/DblZ4I0tMk+Tyu43+uXE5V/AsT0IzHSxcB0Gobd7
 p9iNQHguLpqGTtY5S08AHo/z4oCCRbxyaCYXKM1PDwUhDcRt1TDUtXviqUd2xsl98i
 vROkVmxGtLaIC1xwlG7JBfcGZsk6NVqYz26spPI6al32dqYh4V6Qpyk7kChfRsR0Fm
 okMPnoGpH81/QNI6Gpmm+lD5vHQb2FOWYO43XzwqyxeJGzj0JvzVYqpqt7Y4oESla5
 uJwamBJtFIuWA==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [GIT PULL] mediatek drm fixes 20240805
Date: Sat, 10 Aug 2024 08:46:05 +0000
Message-Id: <20240810084605.3435-1-chunkuang.hu@kernel.org>
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

1. Set sensible cursor width/height values to fix crash

Regards,
Chun-Kuang.

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-fixes-20240805

for you to fetch changes up to 042b8711a0beafb2c3b888bebe3c300ab4c817fa:

  drm/mediatek: Set sensible cursor width/height values to fix crash (2024-08-05 13:06:20 +0000)

----------------------------------------------------------------
Mediatek DRM Fixes - 20240805

1. Set sensible cursor width/height values to fix crash

----------------------------------------------------------------
AngeloGioacchino Del Regno (1):
      drm/mediatek: Set sensible cursor width/height values to fix crash

 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
