Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2DB636E90
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 00:49:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41E7210E64A;
	Wed, 23 Nov 2022 23:49:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665F510E64A
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 23:49:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A7A8361F64;
 Wed, 23 Nov 2022 23:48:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93248C433D6;
 Wed, 23 Nov 2022 23:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669247339;
 bh=60qY6zuvc6YQxUkOpZg/HwdONSAOl74Rznw66aYgEQM=;
 h=From:To:Cc:Subject:Date:From;
 b=P6iIXbVEjocAalQgwYYlPM59WQ+CkEM/gz3kzlIkppkaS6AogK+iMnaxAlCTekB0A
 Y2vKT2LJPdezq++7zPTUEm4dunU7p2lMNkrqou2BvH2+Cn5zKQJT3HpDDSsNefchQ8
 Or3JW/JB1VavZRw3GiWvC55pPqD72hAaemoqvBDhZEsxIl+PKJilH8Dl0BCn4q8I6H
 TMiqIzI3/+ZlmfSVds4ffKMeqErWtekWoouOp8aOCN5Jsh1pOnnudBGpVU2i6ERZ0T
 oPaYja3tYcFzEyfJydwA3kKbg9gE7984QLBT9SfnL+e4J1s+HRbZH5aXMdAi/dVeU7
 VWi6HONmXTR7A==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Subject: [GIT PULL] mediatek drm next for 6.2
Date: Wed, 23 Nov 2022 23:48:55 +0000
Message-Id: <20221123234855.2485-1-chunkuang.hu@kernel.org>
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
Cc: Nathan Chancellor <nathan@kernel.org>, Gil Dekel <gildekel@chromium.org>,
 Xinlei Lee <xinlei.lee@mediatek.com>, Justin Green <greenjustin@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Dave & Daniel:

This includes:

1. Fixup of dpi and hdmi
2. Move panel connector to head
3. Add MT8188 dpi support
4. Add MT8195 AFBC support

Regards,
Chun-Kuang.

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-6.2

for you to fetch changes up to 76cdcb87d391a8e426d81b26be0afc221291cfc2:

  drm/mediatek: Add MT8195 ovl driver support (2022-11-23 16:18:42 +0000)

----------------------------------------------------------------
Mediatek DRM Next for Linux 6.2

1. Fixup of dpi and hdmi
2. Move panel connector to head
3. Add MT8188 dpi support
4. Add MT8195 AFBC support

----------------------------------------------------------------
Gil Dekel (1):
      drm/mediatek: Make eDP panel as the first connected connector

Justin Green (2):
      drm/mediatek: Add AFBC support to Mediatek DRM driver
      drm/mediatek: Add MT8195 ovl driver support

Nathan Chancellor (1):
      drm/mediatek: Fix return type of mtk_hdmi_bridge_mode_valid()

Xinlei Lee (1):
      drm/mediatek: Modify dpi power on/off sequence.

xinlei lee (2):
      dt-bindings: display: mediatek: dpi: Add compatible for MediaTek MT8188
      drm/mediatek: Add mt8188 dpi compatibles and platform data

 .../bindings/display/mediatek/mediatek,dpi.yaml    |  1 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            | 57 ++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_dpi.c                 | 29 +++++++--
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  8 +++
 drivers/gpu/drm/mediatek/mtk_drm_plane.c           | 74 +++++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_plane.h           |  8 +++
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |  7 +-
 7 files changed, 170 insertions(+), 14 deletions(-)
