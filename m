Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 678779BB4CD
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 13:41:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B101010E404;
	Mon,  4 Nov 2024 12:41:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tKWGsS9e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B17AC10E404
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 12:41:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8048BA42EF1;
 Mon,  4 Nov 2024 12:39:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9655C4CED2;
 Mon,  4 Nov 2024 12:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730724069;
 bh=HUZRVqiCqIrgTa00GuAmGvhav56zInoweQzJ+8ji5V4=;
 h=From:To:Cc:Subject:Date:From;
 b=tKWGsS9erAqZ/C1fDYLoPetAt0+dBpZyYQlmWDxjix8nF8MOd619CMpc2S3tXpYga
 rrOs+mLQ6hM7tk7lRXYx1sZWEbVYYWohx2LW7B2MtRiUkOaFDb9El5gACfbxrc4n//
 oH39A3FAsdiYa8LddiA61uttrfVi2QY6af0mVIS62egEm9KQmc6hH7SRRVfngU0CqT
 dEhRw8zgbBxNGk+B04WRMvc1InAju1uyUXtuT2Kaoad9lbH0nax+VQMZHERntiDsy+
 +Lsmy9KkfpReixwfB09FkdRYmrfrht7YY1rNrvreLaTRjuq+7r4QQx8+TUoojK2hJs
 PrtF1Djn1aD+w==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [GIT PULL] mediatek drm next for 6.13
Date: Mon,  4 Nov 2024 12:41:03 +0000
Message-Id: <20241104124103.8041-1-chunkuang.hu@kernel.org>
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

1. Add support for OF graphs
2. Fix child node refcount handling and use scoped

Regards,
Chun-Kuang.

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-6.13

for you to fetch changes up to fd620fc25d88a1e490eaa9f72bc31962be1b4741:

  drm/mediatek: Switch to for_each_child_of_node_scoped() (2024-11-04 12:23:15 +0000)

----------------------------------------------------------------
Mediatek DRM Next for Linux 6.13

1. Add support for OF graphs
2. Fix child node refcount handling and use scoped

----------------------------------------------------------------
AngeloGioacchino Del Regno (2):
      dt-bindings: display: mediatek: Add OF graph support for board path
      drm/mediatek: Implement OF graphs support for display paths

Javier Carrasco (2):
      drm/mediatek: Fix child node refcount handling in early exit
      drm/mediatek: Switch to for_each_child_of_node_scoped()

 .../bindings/display/mediatek/mediatek,aal.yaml    |  40 ++++
 .../bindings/display/mediatek/mediatek,ccorr.yaml  |  21 ++
 .../bindings/display/mediatek/mediatek,color.yaml  |  22 ++
 .../bindings/display/mediatek/mediatek,dither.yaml |  22 ++
 .../bindings/display/mediatek/mediatek,dpi.yaml    |  25 +-
 .../bindings/display/mediatek/mediatek,dsc.yaml    |  24 ++
 .../bindings/display/mediatek/mediatek,dsi.yaml    |  27 ++-
 .../bindings/display/mediatek/mediatek,ethdr.yaml  |  22 ++
 .../bindings/display/mediatek/mediatek,gamma.yaml  |  19 ++
 .../bindings/display/mediatek/mediatek,merge.yaml  |  23 ++
 .../bindings/display/mediatek/mediatek,od.yaml     |  22 ++
 .../bindings/display/mediatek/mediatek,ovl-2l.yaml |  22 ++
 .../bindings/display/mediatek/mediatek,ovl.yaml    |  22 ++
 .../display/mediatek/mediatek,postmask.yaml        |  21 ++
 .../bindings/display/mediatek/mediatek,rdma.yaml   |  22 ++
 .../bindings/display/mediatek/mediatek,ufoe.yaml   |  21 ++
 drivers/gpu/drm/mediatek/mtk_disp_drv.h            |   1 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c    |  43 +++-
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |  21 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             | 256 ++++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h             |   2 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |  14 +-
 22 files changed, 685 insertions(+), 27 deletions(-)
