Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9BF2C76E1
	for <lists+dri-devel@lfdr.de>; Sun, 29 Nov 2020 01:44:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D68D6E118;
	Sun, 29 Nov 2020 00:43:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0390F6E118
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Nov 2020 00:43:57 +0000 (UTC)
Received: from DESKTOP-GFFITBK.localdomain (218-161-90-76.HINET-IP.hinet.net
 [218.161.90.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8313F20731;
 Sun, 29 Nov 2020 00:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606610637;
 bh=ClpZnG4KbDSawHAMUICuJTAnCLgg14Cq4NIxma0Oi0w=;
 h=From:To:Cc:Subject:Date:From;
 b=sniNRVHCv+Dpo6IewIoB98rGw+1ZziWbV+BV9uzcrhRTeyGEYIS8bD24Spgk5c7Fm
 dw8h41kutKrBaevQBG1WWQGN5FwuXr8Aw03v+Qw/34K+GZYqBpN9A05LyWLGKp8tRl
 c7WwVKU7V94yU66MCQUdIKLKdDYb/zCL+sioQeyY=
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Subject: [GIT PULL] mediatek drm next for 5.11
Date: Sun, 29 Nov 2020 08:43:51 +0800
Message-Id: <20201129004351.16212-1-chunkuang.hu@kernel.org>
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, Robin Murphy <robin.murphy@arm.com>,
 Fabien Parent <fparent@baylibre.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Lee Jones <lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Dave & Daniel:

This includes:

1. Add MT8167 support
2. Cleanup function
3. Convert the dpi bindings to yaml
4. Drop local dma_parms
5. Fix formatting and provide missing member description
6. Introduce GEM object functions
7. Fix aliases name

Regards,
Chun-Kuang.

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-5.11

for you to fetch changes up to 414562b0ef36ce658f0ffec00e7039c7911e4cdc:

  drm/mediatek: Use correct aliases name for ovl (2020-11-28 16:56:55 +0800)

----------------------------------------------------------------
Mediatek DRM Next for Linux 5.11

1. Add MT8167 support
2. Cleanup function
3. Convert the dpi bindings to yaml
4. Drop local dma_parms
5. Fix formatting and provide missing member description
6. Introduce GEM object functions
7. Fix aliases name

----------------------------------------------------------------
Bernard Zhao (1):
      drm/mediatek: Optimize functions which do not need to return

Enric Balletbo i Serra (1):
      drm/mediatek: Use correct aliases name for ovl

Fabien Parent (3):
      dt-bindings: display: mediatek: disp: add documentation for MT8167 SoC
      drm/mediatek: Add disp-color MT8167 support
      drm/mediatek: Add DDP support for MT8167

Jitao Shi (1):
      dt-bindings: display: mediatek: convert the dpi bindings to yaml

Lee Jones (4):
      drm/mediatek/mtk_disp_rdma: Fix formatting and supply missing struct member description
      drm/mediatek/mtk_drm_drv: Staticise local function invoked by reference
      drm/mediatek/mtk_disp_color: Fix formatting and provide missing member description
      drm/mediatek/mtk_disp_ovl: Fix formatting and provide missing member description

Robin Murphy (1):
      drm/mediatek: Drop local dma_parms

Thomas Zimmermann (1):
      drm/mediatek: Introduce GEM object functions

 .../bindings/display/mediatek/mediatek,disp.txt    |  4 +-
 .../bindings/display/mediatek/mediatek,dpi.txt     | 42 ----------
 .../bindings/display/mediatek/mediatek,dpi.yaml    | 98 ++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_color.c          | 12 ++-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |  5 +-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |  5 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c             | 47 +++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c        |  2 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             | 36 ++------
 drivers/gpu/drm/mediatek/mtk_drm_drv.h             |  2 -
 drivers/gpu/drm/mediatek/mtk_drm_gem.c             | 11 +++
 drivers/gpu/drm/mediatek/mtk_hdmi.c                | 27 ++----
 12 files changed, 187 insertions(+), 104 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
