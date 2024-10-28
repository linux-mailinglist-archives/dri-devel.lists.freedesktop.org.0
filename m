Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D81C89B3251
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 14:58:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9270310E4BD;
	Mon, 28 Oct 2024 13:58:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZyNlD4KZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41ABC10E4BD
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 13:58:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 58BD3A4196D;
 Mon, 28 Oct 2024 13:56:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFE90C4CEE8;
 Mon, 28 Oct 2024 13:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730123933;
 bh=K/7KTDMPuENamkKkqsHNo5G/p+HSdxlk0n5hK36PN1E=;
 h=From:To:Subject:Date:From;
 b=ZyNlD4KZ+2/tN8m2oNbRkgZ62v9n/PBN1xJ4oeicGBphk8guST/GZKioUccJbN0Ol
 GO7BC9tJ+BHiDmXMN2gr2nrat0AJBaXEB/IoGhOETkjfo+9kgiLsjuUTeOX3po6Ou6
 XDKiX4CW2vw6t5F6gm5yQdmXZ8jkSd4YlzQT7eiBF6rTDw1lEZwTB0xJQ+7R7wuH3u
 4ZHmHIrLl40v1xI4I69W0L15XId6+ds9jEtZJeJ3S8IUqbP95RqwCWepCGYTxoRlVu
 gMtC556IKZZ5H4eqQSHdP1Bmh+1z0AFsDnSqOav0vrwOGozdBAvaf0zsRBEa1/2pye
 rjrrMZCJUeeDQ==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Hsin-Te Yuan <yuanhsinte@chromium.org>,
 Liankun Yang <liankun.yang@mediatek.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Macpaul Lin <macpaul.lin@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>
Subject: [GIT PULL] mediatek drm fixes 20241028
Date: Mon, 28 Oct 2024 13:58:46 +0000
Message-Id: <20241028135846.3570-1-chunkuang.hu@kernel.org>
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

1. Fix degradation problem of alpha blending
2. Fix color format MACROs in OVL
3. Fix get efuse issue for MT8188 DPTX
4. Fix potential NULL dereference in mtk_crtc_destroy()
5. Correct dpi power-domains property
6. Add split subschema property constraints

Regards,
Chun-Kuang.

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-fixes-20241028

for you to fetch changes up to 3ad0edc46fb7668e75583ee6ebcce684f62ec4dc:

  dt-bindings: display: mediatek: split: add subschema property constraints (2024-10-23 14:47:39 +0000)

----------------------------------------------------------------
Mediatek DRM Fixes - 20241028

1. Fix degradation problem of alpha blending
2. Fix color format MACROs in OVL
3. Fix get efuse issue for MT8188 DPTX
4. Fix potential NULL dereference in mtk_crtc_destroy()
5. Correct dpi power-domains property
6. Add split subschema property constraints

----------------------------------------------------------------
Dan Carpenter (1):
      drm/mediatek: Fix potential NULL dereference in mtk_crtc_destroy()

Hsin-Te Yuan (1):
      drm/mediatek: Fix color format MACROs in OVL

Jason-JH.Lin (5):
      drm/mediatek: ovl: Fix XRGB format breakage for blend_modes unsupported SoCs
      drm/mediatek: ovl: Refine ignore_pixel_alpha comment and placement
      drm/mediatek: ovl: Remove the color format comment for ovl_fmt_convert()
      drm/mediatek: ovl: Add blend_modes to driver data
      drm/mediatek: Add blend_modes to mtk_plane_init() for different SoCs

Liankun Yang (1):
      drm/mediatek: Fix get efuse issue for MT8188 DPTX

Macpaul Lin (1):
      dt-bindings: display: mediatek: dpi: correct power-domains property

Moudy Ho (1):
      dt-bindings: display: mediatek: split: add subschema property constraints

 .../bindings/display/mediatek/mediatek,dpi.yaml    | 24 +++---
 .../bindings/display/mediatek/mediatek,split.yaml  | 19 +++++
 drivers/gpu/drm/mediatek/mtk_crtc.c                |  4 +-
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c            |  2 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h            | 10 +++
 drivers/gpu/drm/mediatek/mtk_disp_drv.h            |  2 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            | 74 ++++++++++++++-----
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c    |  7 ++
 drivers/gpu/drm/mediatek/mtk_dp.c                  | 85 +++++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_ethdr.c               |  7 ++
 drivers/gpu/drm/mediatek/mtk_ethdr.h               |  1 +
 drivers/gpu/drm/mediatek/mtk_plane.c               | 15 ++--
 drivers/gpu/drm/mediatek/mtk_plane.h               |  4 +-
 13 files changed, 208 insertions(+), 46 deletions(-)
