Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC343ECBD1
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 01:55:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ECF289BFC;
	Sun, 15 Aug 2021 23:55:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD8DF89BFC
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Aug 2021 23:55:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 10A9F61179;
 Sun, 15 Aug 2021 23:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629071714;
 bh=LI53ozqpoNEdsKyU0Gl373eJPPlLxM+pXGycg62tEJY=;
 h=From:To:Cc:Subject:Date:From;
 b=d/Ct5z6pxWo73cdS4KLwq+xLqhR36StQgXFmTVtYsEqu6fNw5hZyuFxDWVxjw/5Po
 9FG6PR5gfuCaIexNhU6/u0xrKNoorUaDW2AduHPHJx5k/HOf8LdWzfCs51IunErsgD
 /SentkRLZuzNC3Wtrj3QUnSxljSuVWHuqXGzq+g/sJyOcF9pm/6AD16v8VK5elIpeL
 LzDTYebyt2Yil4zx30T7fTdLMi8HA9ZdtIZ5YeLDJDrGyTYqTSiO12fdytMG2zFhGI
 RGp8pbxFngYIhdCRAyRQvGIYOWDvwbVTnSwrA50VzadEFOJR6xAXPOLmIBkzpl8Ab9
 ZB9Szq6vQ03KQ==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Cc: Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Fabien Parent <fparent@baylibre.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Subject: [GIT PULL] mediatek drm next for 5.15
Date: Mon, 16 Aug 2021 07:55:10 +0800
Message-Id: <20210815235510.6597-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.25.1
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

1. MT8133 AAL support, adjust rdma fifo threshold formula.
2. Implement mmap as GEM object function.
3. Add support for MT8167.
4. Test component initialization earlier in the function mtk_drm_crtc_create.
5. CMDQ refinement.

Regards,
Chun-Kuang.


The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-5.15

for you to fetch changes up to 6e7dcd92644baebdb137e3af900064ceebcaca23:

  drm/mediatek: Clear pending flag when cmdq packet is done (2021-08-12 08:16:24 +0800)

----------------------------------------------------------------
Mediatek DRM Next for Linux 5.15

1. MT8133 AAL support, adjust rdma fifo threshold formula.
2. Implement mmap as GEM object function.
3. Add support for MT8167.
4. Test component initialization earlier in the function mtk_drm_crtc_create.
5. CMDQ refinement.

----------------------------------------------------------------
Chun-Kuang Hu (4):
      drm/mediatek: Use mailbox rx_callback instead of cmdq_task_cb
      drm/mediatek: Remove struct cmdq_client
      drm/mediatek: Detect CMDQ execution timeout
      drm/mediatek: Add cmdq_handle in mtk_crtc

Dafna Hirschfeld (1):
      drm/mediatek: Test component initialization earlier in the function mtk_drm_crtc_create

Fabien Parent (2):
      dt-bindings: display: mediatek: dsi: add documentation for MT8167 SoC
      drm/mediatek: Add support for main DDP path on MT8167

Thomas Zimmermann (1):
      drm/mediatek: Implement mmap as GEM object function

Yongqiang Niu (4):
      drm/mediatek: Adjust rdma fifo threshold calculate formula
      drm/mediatek: Separate aal sub driver
      drm/mediatek: Add mt8183 aal support
      drm/mediatek: Clear pending flag when cmdq packet is done

 .../bindings/display/mediatek/mediatek,dsi.txt     |   2 +-
 drivers/gpu/drm/mediatek/Makefile                  |   3 +-
 drivers/gpu/drm/mediatek/mtk_disp_aal.c            | 167 ++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_drv.h            |   9 ++
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |   6 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c            | 173 +++++++++++++++++----
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c        |  42 +----
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  59 +++++--
 drivers/gpu/drm/mediatek/mtk_drm_drv.h             |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_gem.c             |  44 ++----
 drivers/gpu/drm/mediatek/mtk_drm_gem.h             |   3 -
 11 files changed, 386 insertions(+), 123 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_aal.c
