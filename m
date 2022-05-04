Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD9E51B1C0
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 00:22:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5560210F6CF;
	Wed,  4 May 2022 22:22:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74D0810F6CF
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 22:22:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 30DC2B82791;
 Wed,  4 May 2022 22:22:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B33A8C385A4;
 Wed,  4 May 2022 22:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651702961;
 bh=u0N155SWtOz1s9JJf+rKZJXEN795NA99QtHjC9yXwMg=;
 h=From:To:Cc:Subject:Date:From;
 b=VlSQexwAxmaPtAE+anI/70FQFfOaUAwKMwn8hFFGmKo72f/jkVGbne0pO1liJAxBW
 foy0y0TQnXwbwsQvlLFAjsK/D1ZikrGGqdoVwx1EVdoeeFX6Y7bXlMpXPL60t2Lvit
 KehQJm1MdQ47hmCdqe1SkKNh7hd3I6qrtwOqXxFyPdRvwHh/49Z5xzUtMaJCnnt0ZE
 drCQSqj8NJV3svCR5jWNeXE1b/p9lRXm8nGswiPWwl64OmPk8AlngYqCwNN6Ju/7B3
 1l2N2k/0vxk5BQTeLhhCQ3n/0mjRA0nJ0D2hbE5LgNGGNhRFAysTJWxGlFOzxy2Wuf
 RDvM9AGwfwhtw==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Subject: [GIT PULL] mediatek drm next for 5.19
Date: Thu,  5 May 2022 06:22:45 +0800
Message-Id: <1651702965-23630-1-git-send-email-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Xinlei Lee <xinlei.lee@mediatek.com>,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, Miles Chen <miles.chen@mediatek.com>,
 Yang Li <yang.lee@linux.alibaba.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Dave & Daniel:

This includes:

1. Add display support for MT8186
2. Miscellaneous refinement and fixup.

Regards,
Chun-Kuang.

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-5.19

for you to fetch changes up to b8b8eeda63d60d434fcb0351ed45daf9f2d15afd:

  drm/mediatek: mtk_dsi: Remove unnecessary print function dev_err() (2022-05-05 05:36:49 +0800)

----------------------------------------------------------------
Mediatek DRM Next for Linux 5.19

1. Add display support for MT8186
2. Miscellaneous refinement and fixup.

----------------------------------------------------------------
AngeloGioacchino Del Regno (2):
      drm/mediatek: mtk_drm_plane: Use kmalloc in mtk_plane_duplicate_state
      drm/mediatek: mtk_drm_crtc: Use kmalloc in mtk_drm_crtc_duplicate_state

Chen-Yu Tsai (1):
      drm/mediatek: Fix DPI component detection for MT8192

Miles Chen (1):
      drm/mediatek: Fix mtk_cec_mask()

Nícolas F. R. A. Prado (1):
      drm/mediatek: dpi: Use mt8183 output formats for mt8192

Rex-BC Chen (6):
      drm/mediatek: Add vblank register/unregister callback functions
      dt-bindings: display: mediatek: revise enum to const
      dt-bindings: display: mediatek: change to use enum for mutex
      dt-bindings: display: mediatek: add MT8186 SoC binding
      dt-bindings: display: mediatek: Update disp_aal binding for MT8183
      dt-bindings: display: mediatek: Update disp_aal binding for MT8192 and MT8195

Xinlei Lee (1):
      dt-bindings: display: mediatek: dpi: Add compatible for MediaTek MT8186

Yang Li (1):
      drm/mediatek: mtk_dsi: Remove unnecessary print function dev_err()

Yongqiang Niu (2):
      drm/mediatek: Add display support for MT8186
      drm/mediatek: Add lut diff flag for new gamma hardware support

 .../bindings/display/mediatek/mediatek,aal.yaml    | 11 ++++---
 .../bindings/display/mediatek/mediatek,ccorr.yaml  |  5 +++-
 .../bindings/display/mediatek/mediatek,color.yaml  |  7 ++---
 .../bindings/display/mediatek/mediatek,dither.yaml |  4 +--
 .../bindings/display/mediatek/mediatek,dpi.yaml    |  1 +
 .../bindings/display/mediatek/mediatek,gamma.yaml  |  4 +--
 .../bindings/display/mediatek/mediatek,mutex.yaml  | 25 +++++++---------
 .../bindings/display/mediatek/mediatek,ovl-2l.yaml |  4 +++
 .../bindings/display/mediatek/mediatek,ovl.yaml    |  8 +++--
 .../display/mediatek/mediatek,postmask.yaml        |  4 +++
 .../bindings/display/mediatek/mediatek,rdma.yaml   |  7 ++---
 drivers/gpu/drm/mediatek/mtk_cec.c                 |  2 +-
 drivers/gpu/drm/mediatek/mtk_disp_aal.c            |  2 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h            | 18 +++++++-----
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c          | 34 ++++++++++++++++++----
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            | 22 ++++++++++----
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c           | 20 +++++++++----
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |  4 +--
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c            | 17 +++++++++--
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c        |  4 +++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h        | 29 +++++++++++++-----
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             | 31 ++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_plane.c           |  2 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |  1 -
 24 files changed, 192 insertions(+), 74 deletions(-)
