Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A7E1D1AD9
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 18:17:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ADF96E25C;
	Wed, 13 May 2020 16:17:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 375FE6E25C
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 16:17:13 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 04F3B207C4
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 16:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589386633;
 bh=LqHMqv+cs54oc1DGAOIwvhYA+eUxtjbD/21x+c7zW7Q=;
 h=From:Date:Subject:To:Cc:From;
 b=fq/2WmyHGrM5dZ688uGEcuSqe9mKSQ0Wg3B3Tm2aRh0sgsX6xy0wPrc8QVu0/rtgf
 7mnqdJFLs5uZU7BTpnIbWt9Y1dxpGxiyISyggz9R/jp0hxuXzBOM5F413aXeKQzM+t
 1jTiD14ootBIWZkieoipXtmA7azYd4bobbRf5EEU=
Received: by mail-ej1-f52.google.com with SMTP id z5so20369ejb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 09:17:12 -0700 (PDT)
X-Gm-Message-State: AGi0PuaxoRriWd0Le1Fw3SuZ3kTHVkmcHnN96WCoJG1101W+iqEKzl9u
 kEs/Brn1zVBhZRdnJ2hbArxC/LAowc4WZvxJ8g==
X-Google-Smtp-Source: APiQypJiwyFCj/xngtINH3ad241V/T5agFVkQac23GNp0Mcffi69VPaa3fS6ljkNwUHqspKhdrJDpZOwAHa1JPxGv/8=
X-Received: by 2002:a17:906:2503:: with SMTP id
 i3mr22035962ejb.293.1589386630979; 
 Wed, 13 May 2020 09:17:10 -0700 (PDT)
MIME-Version: 1.0
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 14 May 2020 00:16:59 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8gJNpWXcMnHiZzg_sgyiJ6BDsBYRxaLX0OXWRuLF1NCg@mail.gmail.com>
Message-ID: <CAAOTY_8gJNpWXcMnHiZzg_sgyiJ6BDsBYRxaLX0OXWRuLF1NCg@mail.gmail.com>
Subject: [GIT PULL] mediatek drm next for 5.8
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, Bernard Zhao <bernard@vivo.com>,
 YueHaibing <yuehaibing@huawei.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Anand K Mistry <amistry@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Dave & Daniel:

This include dpi pin mode swap, config mipi_tx current and impedance,
convert mtk-dpi to drm_bridge API, and some fixup.

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:
  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)
are available in the Git repository at:
  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git
tags/mediatek-drm-next-5.8
for you to fetch changes up to 23b29ff9f13a8fb5a12be9fedb8b614b9dede46a:
  drm/mediatek: Eliminate the magic number in array size (2020-05-10
09:08:30 +0800)
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
Enric Balletbo i Serra (7):
      dt-bindings: mediatek: Update mmsys binding to reflect it is a
system controller
      soc / drm: mediatek: Move routing control to mmsys device
      soc / drm: mediatek: Fix mediatek-drm device probing
      drm/mediatek: Remove debug messages for function calls
      drm/mediatek: mtk_dpi: Rename bridge to next_bridge
      drm/mediatek: mtk_dpi: Convert to bridge driver
      drm/mediatek: mtk_dpi: Use simple encoder
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
127 ++++++++++-------
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
 27 files changed, 778 insertions(+), 476 deletions(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8173-mm.c
 create mode 100644 drivers/soc/mediatek/mtk-mmsys.c
 create mode 100644 include/linux/soc/mediatek/mtk-mmsys.h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
