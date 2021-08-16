Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED51E3EE068
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 01:24:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 229D989686;
	Mon, 16 Aug 2021 23:24:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A35189686
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 23:24:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CDF1960F35;
 Mon, 16 Aug 2021 23:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629156271;
 bh=ggOlp86jLvFXdrrpvLp3lnX0LT4l9jJ9pLj48IP/iV4=;
 h=From:To:Cc:Subject:Date:From;
 b=efUUcFW7iw/ckqVFkFmjkV2G0RsYRtpI7zG9s93qOR4zru0xVfBnQxuzWa+WPlYOA
 vbbIWB2UvDhMhD/3ZKE8sDEQdgcpTgtrrDwxj6jcHABc74gAQNUKTHobFkUi0JPNq2
 lsUn7GFTP8osD7hbmevQBmQ9mA6EUjFEoGQZ3xtjLVgYayudaVqMnZWH7ghxF6FylY
 jcKVp1tfu4gwWWfD7LghweYNB5CqA9YG4MncZpC9e+kCHU0wk+PQTp3RGRfI+lC0cQ
 HIL0iAnv0fPlXISewTHbcG3rcmjKHUJIuqVZqIdgv8Z4Yg4y/8rqrmzD+YDhNnvq3d
 BETYovDTS8vDQ==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Cc: Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Fabien Parent <fparent@baylibre.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Subject: [GIT PULL v2] mediatek drm next for 5.15
Date: Tue, 17 Aug 2021 07:24:27 +0800
Message-Id: <20210816232427.13368-1-chunkuang.hu@kernel.org>
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

for you to fetch changes up to 9efb16c2fdd647d3888fd8dae84509f485cd554e:

  drm/mediatek: Clear pending flag when cmdq packet is done (2021-08-17 07:08:54 +0800)

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
