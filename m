Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5B32C1981
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 00:41:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D36EB6E14F;
	Mon, 23 Nov 2020 23:41:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 580356E14F
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 23:41:35 +0000 (UTC)
Received: from DESKTOP-GFFITBK.localdomain (218-161-90-76.HINET-IP.hinet.net
 [218.161.90.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D5ACE20717;
 Mon, 23 Nov 2020 23:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606174894;
 bh=x50T4/BWkKqQyZJdtEgH9FkPlcfZQCayLZinZfHrUXI=;
 h=From:To:Cc:Subject:Date:From;
 b=TekI3Ps1UVMVo6m4zXPZZ5RaqWJ7ceDtKCwleboPycNYJkP78GmC/Ab0fLnGl7wCz
 MWW4glcQiGwpmfRGfnj5WxhO+WCzauC3ubsYUFAmyLTtVZP5Olr6OSGi5YttcaBa+7
 TE6A+CX40iBgTdqRjvq370F5yt2G8+CdaShHvE1Y=
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Subject: [GIT PULL] mediatek drm fixes for 5.10
Date: Tue, 24 Nov 2020 07:41:31 +0800
Message-Id: <20201123234131.387-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
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
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Dave & Daniel:

This includes:

1. Remove unused variable.
2. Modify horizontal front/back porch byte formula.

Regards,
Chun-Kuang.

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-fixes-5.10

for you to fetch changes up to 487778f8d22fcdebb6436f0a5f96484ffa237b0b:

  drm/mediatek: dsi: Modify horizontal front/back porch byte formula (2020-11-21 18:31:07 +0800)

----------------------------------------------------------------
Mediatek DRM Fixes for Linux 5.10

1. Remove unused variable.
2. Modify horizontal front/back porch byte formula.

----------------------------------------------------------------
CK Hu (1):
      drm/mediatek: dsi: Modify horizontal front/back porch byte formula

Enric Balletbo i Serra (1):
      drm/mediatek: mtk_dpi: Fix unused variable 'mtk_dpi_encoder_funcs'

 drivers/gpu/drm/mediatek/mtk_dpi.c |  9 ------
 drivers/gpu/drm/mediatek/mtk_dsi.c | 61 ++++++++++++++------------------------
 2 files changed, 22 insertions(+), 48 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
