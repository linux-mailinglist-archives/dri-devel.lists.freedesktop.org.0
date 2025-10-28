Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93532C155E0
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 16:15:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0BAD10E5E7;
	Tue, 28 Oct 2025 15:15:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="n+lg9AMs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38FB710E5E7
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 15:15:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EE4E8488DA;
 Tue, 28 Oct 2025 15:15:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98E51C4CEE7;
 Tue, 28 Oct 2025 15:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761664551;
 bh=goD0CigqBRYX8ULfEFtywW6O3borlTpYBzrks6pK4t4=;
 h=From:To:Subject:Date:From;
 b=n+lg9AMsc5NeGcR/8LdtOfvFSm3eCSzXjS8tPTuEpM0EVb4pgSYR9tpkZMD8JPk30
 zsp0gUF5fA6a4fZIGIaKEhUU0BEWhGW+4xRL91bQ4cKMYc5q8AL2JJuDFNll8cwOWh
 //7pvz6thEtoU91YAFPJYMA6kZj93BFEBV8Xk0s5whj8lEm0JGKL+MZG3fCmXuRBvD
 fnnyXANIy+FIeJV2YammHmZEn5wf6URFYf0IMSCSFfZXUuwLFTdjSz0lC6P+Mv93OE
 T27aRgXyV5idFrDxlWJ0VIbCIUBsEKcGxNR0bZaY/AZ6Q89ZQM9GFTRBNrnKzpnC3G
 oogwQRJFCjZxg==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Johan Hovold <johan@kernel.org>
Subject: [GIT PULL] mediatek drm fixes - 20251028
Date: Tue, 28 Oct 2025 15:15:48 +0000
Message-Id: <20251028151548.3944-1-chunkuang.hu@kernel.org>
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
1. Fix device use-after-free on unbind

Regards,
Chun-Kuang.

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-fixes-20251028

for you to fetch changes up to 926d002e6d7e2f1fd5c1b53cf6208153ee7d380d:

  drm/mediatek: Fix device use-after-free on unbind (2025-10-28 14:56:16 +0000)

----------------------------------------------------------------
Mediatek DRM Fixes - 20251028

1. Fix device use-after-free on unbind

----------------------------------------------------------------
Johan Hovold (1):
      drm/mediatek: Fix device use-after-free on unbind

 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 10 ----------
 1 file changed, 10 deletions(-)
