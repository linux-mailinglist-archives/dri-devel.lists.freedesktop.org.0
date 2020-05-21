Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 930C11DC4E1
	for <lists+dri-devel@lfdr.de>; Thu, 21 May 2020 03:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B6C6E8F3;
	Thu, 21 May 2020 01:46:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7006D6E8F3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 May 2020 01:46:17 +0000 (UTC)
Received: from DESKTOP-GFFITBK.localdomain (218-161-90-76.HINET-IP.hinet.net
 [218.161.90.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D7BC7206D4;
 Thu, 21 May 2020 01:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590025577;
 bh=ShWR05J+GX0ojhK27/EOzzCcTQLksxCASTY1PQgf/mo=;
 h=From:To:Cc:Subject:Date:From;
 b=zaB2mc7Bz/LDeMvhd14Fm+OKQB/TTuToxd3yF8B5RIJen0phXH91cXj0JfnricUVq
 p1I4B4m5DioI2vkKJG1uCN0YbsJhjt3HUDRf5B2bik49y5aKMM9VCDzyJkamrRkRpW
 QGHJwAH4Xrw+/aeJZjNFbQ1JrP8Twx2lgdsapqqk=
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Subject: [GIT PULL v3] mediatek drm next for 5.8
Date: Thu, 21 May 2020 09:46:12 +0800
Message-Id: <20200521014612.17175-1-chunkuang.hu@kernel.org>
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
Cc: Bernard Zhao <bernard@vivo.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Anand K Mistry <amistry@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Dave & Daniel:

This include dpi pin mode swap, config mipi_tx current and impedance,
and some fixup. I drop backmerge patches and related fixup in this version.

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-5.8

for you to fetch changes up to 3852489c79abe31101f07e395c63cce64de0c6d6:

  drm/mediatek: Eliminate the magic number in array size (2020-05-21 00:10:08 +0800)

----------------------------------------------------------------
Mediatek DRM Next for Linux 5.8

----------------------------------------------------------------
Anand K Mistry (1):
      drm/mediatek: Stop iterating dma addresses when sg_dma_len() == 0

Bernard Zhao (2):
      drm/mediatek: Cleanup coding style in mediatek a bit
      drm/mediatek: Eliminate the magic number in array size

Jitao Shi (6):
      dt-bindings: display: mediatek: control dpi pins mode to avoid leakage
      drm/mediatek: set dpi pin mode to gpio low to avoid leakage current
      dt-bindings: display: mediatek: add property to control mipi tx drive current
      dt-bindings: display: mediatek: get mipitx calibration data from nvmem
      drm/mediatek: add the mipitx driving control
      drm/mediatek: config mipitx impedance with calibration data

 .../bindings/display/mediatek/mediatek,dpi.txt     |  6 +++
 .../bindings/display/mediatek/mediatek,dsi.txt     | 10 ++++
 drivers/gpu/drm/mediatek/mtk_dpi.c                 | 31 +++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_gem.c             |  3 ++
 drivers/gpu/drm/mediatek/mtk_hdmi.c                | 18 +++-----
 drivers/gpu/drm/mediatek/mtk_mipi_tx.c             | 54 ++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_mipi_tx.h             |  4 ++
 drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c      | 28 +++++++++++
 8 files changed, 143 insertions(+), 11 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
