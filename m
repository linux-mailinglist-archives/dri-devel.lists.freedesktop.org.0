Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A9E7CB714
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 01:37:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D28C10E242;
	Mon, 16 Oct 2023 23:37:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 380E910E242
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 23:37:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9C0C861193;
 Mon, 16 Oct 2023 23:37:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48DA9C433C8;
 Mon, 16 Oct 2023 23:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697499423;
 bh=flxy/IWr/8XwqeqSwSf+S0EMXqElTsnCWVl7sX/1ZpA=;
 h=From:To:Subject:Date:From;
 b=lybGVmEtnZqifsco0fh6YhDVq/Kj0xv+rNs8mYNEuqCcx1MFxMm3PsxX8sbu5hLvC
 bUMdWFNvF28KyyyVBUK46vTE9+Aer2uL0dQQpyx0TLBa37k42cKlCT3mRTma0WRDL2
 sh/W4IlUFXyZH1B3B6K99PFU3KYr1pJU71uiORXyw1GXMt4jH8YSSLAzgmBbMcIwrJ
 q2B29c8qxDNw4Ccv8uMc1S0vD0ePSQf7eVK63d8pHXmKXlbHt/r4cUM10DJ/krZ+3n
 kGuuJkzUbVIXA2wABMbmpNeP1jHD7iRzJlBBDvNMCSZj+4xL1apeR5fhzqJ3Ir0c6e
 hbg2XwNHXBP+w==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>
Subject: [GIT PULL] mediatek drm fixes 20231017
Date: Mon, 16 Oct 2023 23:36:59 +0000
Message-Id: <20231016233659.3639-1-chunkuang.hu@kernel.org>
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

1. Correctly free sg_table in gem prime vmap

Regards,
Chun-Kuang.

The following changes since commit 58720809f52779dc0f08e53e54b014209d13eebb:

  Linux 6.6-rc6 (2023-10-15 13:34:39 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-fixes-20231017

for you to fetch changes up to dcc583c225e659d5da34b4ad83914fd6b51e3dbf:

  drm/mediatek: Correctly free sg_table in gem prime vmap (2023-10-16 15:44:03 +0000)

----------------------------------------------------------------
Mediatek DRM Fixes - 20231017

1. Correctly free sg_table in gem prime vmap

----------------------------------------------------------------
Chen-Yu Tsai (1):
      drm/mediatek: Correctly free sg_table in gem prime vmap

 drivers/gpu/drm/mediatek/mtk_drm_gem.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
