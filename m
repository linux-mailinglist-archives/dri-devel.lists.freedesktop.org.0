Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1751D6E35
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 02:06:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A620D89D46;
	Mon, 18 May 2020 00:06:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86A5689D46
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 00:06:34 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 059302081A
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 00:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589760394;
 bh=LeR4+EuxTF9HvWrcrcTAkCiB30AEQHBjIa6B1Vqmk50=;
 h=From:Date:Subject:To:From;
 b=n4nmrWAHGqu43/jYxtNeka6fAxGOqniBJvr/DK30jANFFlAL0lLZxajxKiKAfuT/K
 P21gvx3qxj9wS8cTpftw/cs48PEF9sEyd6uMg/DVH3BRm3TZnAfSsk3YoEB035x8o6
 sTz2L3rO8UzDwlkccR+kdm1vZzrib8OR09Y2vT2I=
Received: by mail-ed1-f50.google.com with SMTP id b91so7016694edf.3
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 17:06:33 -0700 (PDT)
X-Gm-Message-State: AOAM530A83GHRkJB7/t9RdjtRXhNLzNnJIVpYgNKMfoeOiIB4oo2YQv6
 vJZzmZn21p4qcelAIP1eXBTpSZamn6rnCh9ihA==
X-Google-Smtp-Source: ABdhPJxVLRseciM0ruSfMPREomFv8I8KV6q9J3+1yH0SCIFVeVAjvQtfmLcHAd3ocnI2iRj3HCJpZBaVWXPQnsQw56E=
X-Received: by 2002:a50:e1c5:: with SMTP id m5mr5720901edl.47.1589760392355;
 Sun, 17 May 2020 17:06:32 -0700 (PDT)
MIME-Version: 1.0
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 18 May 2020 08:06:19 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8tz9nNbCHFJhk9xX8fm9Jd8ETcdNCQfE31AOjZLpNKog@mail.gmail.com>
Message-ID: <CAAOTY_8tz9nNbCHFJhk9xX8fm9Jd8ETcdNCQfE31AOjZLpNKog@mail.gmail.com>
Subject: [GIT PULL v2] mediatek drm next for 5.8
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Bernard Zhao <bernard@vivo.com>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Anand K Mistry <amistry@chromium.org>, 
 YueHaibing <yuehaibing@huawei.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Jitao Shi <jitao.shi@mediatek.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Dave & Daniel:

This include dpi pin mode swap, config mipi_tx current and impedance,
and some fixup. I drop drm_bridge patches in this version.

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:
  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)
are available in the Git repository at:
  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git
tags/mediatek-drm-next-5.8
for you to fetch changes up to 007d274a017bb4e2ef7b922c2f54f40cf2073664:
  drm/mediatek: Eliminate the magic number in array size (2020-05-16
17:08:47 +0800)
----------------------------------------------------------------
Mediatek DRM Next for Linux 5.8
----------------------------------------------------------------
Anand K Mistry (1):
      drm/mediatek: Stop iterating dma addresses when sg_dma_len() == 0
Bernard Zhao (2):
      drm/mediatek: Cleanup coding style in mediatek a bit
      drm/mediatek: Eliminate the magic number in array size
Chun-Kuang Hu (1):
      Merge tag 'v5.7-next-drm-stable' of
ssh://gitolite.kernel.org/.../matthias.bgg/linux into
mediatek-drm-next
Enric Balletbo i Serra (4):
      dt-bindings: mediatek: Update mmsys binding to reflect it is a
system controller
      soc / drm: mediatek: Move routing control to mmsys device
      soc / drm: mediatek: Fix mediatek-drm device probing
      drm/mediatek: Remove debug messages for function calls
Hsin-Yi Wang (1):
      drm/mediatek: Fix device passed to cmdq
Jitao Shi (6):
      dt-bindings: display: mediatek: control dpi pins mode to avoid leakage
      drm/mediatek: set dpi pin mode to gpio low to avoid leakage current
      dt-bindings: display: mediatek: add property to control mipi tx
drive current
      dt-bindings: display: mediatek: get mipitx calibration data from nvmem
      drm/mediatek: add the mipitx driving control
      drm/mediatek: config mipitx impedance with calibration data
Matthias Brugger (2):
      drm/mediatek: Omit warning on probe defers
      clk / soc: mediatek: Move mt8173 MMSYS to platform driver
YueHaibing (1):
      drm/mediatek: Fix Kconfig warning
 Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt   |   7 +-
 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt |   6 +
 Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt |  10 ++
 drivers/clk/mediatek/Kconfig                                        |   7 +
 drivers/clk/mediatek/Makefile                                       |   1 +
 drivers/clk/mediatek/clk-mt8173-mm.c                                |
146 +++++++++++++++++++
 drivers/clk/mediatek/clk-mt8173.c                                   |
104 --------------
 drivers/gpu/drm/mediatek/Kconfig                                    |   1 +
 drivers/gpu/drm/mediatek/mtk_disp_color.c                           |   5 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c                             |   5 +-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c                            |   5 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c                                  |
 43 +++++-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c                             |  27 ++--
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c                              |
259 +---------------------------------
 drivers/gpu/drm/mediatek/mtk_drm_ddp.h                              |   7 -
 drivers/gpu/drm/mediatek/mtk_drm_drv.c                              |
 50 +++----
 drivers/gpu/drm/mediatek/mtk_drm_drv.h                              |   2 +-
 drivers/gpu/drm/mediatek/mtk_drm_gem.c                              |   3 +
 drivers/gpu/drm/mediatek/mtk_dsi.c                                  |   8 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                                 |  22 ++-
 drivers/gpu/drm/mediatek/mtk_mipi_tx.c                              |
 54 +++++++
 drivers/gpu/drm/mediatek/mtk_mipi_tx.h                              |   4 +
 drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c                       |  28 ++++
 drivers/soc/mediatek/Kconfig                                        |   8 ++
 drivers/soc/mediatek/Makefile                                       |   1 +
 drivers/soc/mediatek/mtk-mmsys.c                                    |
337 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/soc/mediatek/mtk-mmsys.h                              |  20 +++
 27 files changed, 739 insertions(+), 431 deletions(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8173-mm.c
 create mode 100644 drivers/soc/mediatek/mtk-mmsys.c
 create mode 100644 include/linux/soc/mediatek/mtk-mmsys.h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
