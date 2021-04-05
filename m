Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14051353C57
	for <lists+dri-devel@lfdr.de>; Mon,  5 Apr 2021 10:22:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 397196E165;
	Mon,  5 Apr 2021 08:22:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79CE56E165
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Apr 2021 08:22:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BEAAC61380;
 Mon,  5 Apr 2021 08:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617610972;
 bh=OBjkDZNvCWrnrWazlvd5R4b8wfkUXI/VhfiExOzp7Tk=;
 h=From:To:Cc:Subject:Date:From;
 b=TLDtn4e8CuY2Z2v76iJrz6l6I9JHdI07PL+FkJJsbeHp6fQ3qiG+5JAnP3ZKz82bX
 3s7uRpNL/6eWWlGhx8bs8fZaeXasOBUZk2zROgDKp2EwLTmrSp0E0R0v6sNm2Zd6n9
 BqFPUL7z9MkSzW5hcN3pRFIzw9WkuRqArO9k5M13j/ql04IUox0GjxMcFUP3aeUlJI
 3N3LJ54wekSPWcrqEx5KGvxOomSXBn7+WJ12zD2cWfKecnwJDTpF2/lo4GkbNz0mdA
 TyZhXhOfX0PcpDHc5GCgpLmWL6A3oXwOvxASHluTfYdjKMI8W+wRNIe4btFLsewgr3
 d6iFJtmF0p0oQ==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Subject: [GIT PULL] mediatek drm next for 5.13
Date: Mon,  5 Apr 2021 16:22:48 +0800
Message-Id: <20210405082248.3578-1-chunkuang.hu@kernel.org>
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
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Wang Qing <wangqing@vivo.com>, Boris Brezillon <boris.brezillon@collabora.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>,
 tangchunyou <tangchunyou@yulong.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Dave & Daniel:

This includes:

1. Fine tune the line time for EOTp.
2. Add support mt8192 dpi.
3. Make crtc config-updating atomic.
4. Don't support hdmi connector creation.

Regards,
Chun-Kuang.

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-5.13

for you to fetch changes up to 2e477391522354e763aa62ee3e281c1ad9e8eb1b:

  drm/mediatek: Don't support hdmi connector creation (2021-04-01 22:05:20 +0800)

----------------------------------------------------------------
Mediatek DRM Next for Linux 5.13

1. Fine tune the line time for EOTp.
2. Add support mt8192 dpi.
3. Make crtc config-updating atomic.
4. Don't support hdmi connector creation.

----------------------------------------------------------------
Boris Brezillon (1):
      drm/mediatek: Add missing MODULE_DEVICE_TABLE()

Chun-Kuang Hu (1):
      drm/mediatek: crtc: Make config-updating atomic

Dafna Hirschfeld (3):
      MAINTAINERS: Add linux-mediatek ML for drm Mediatek drivers
      drm/mediatek: Switch the hdmi bridge ops to the atomic versions
      drm/mediatek: Don't support hdmi connector creation

Jitao Shi (3):
      drm/mediatek: dsi: Use symbolized register definition
      drm/mediatek: dsi: Fine tune the line time caused by EOTp
      dt-bindings: mediatek,dpi: add mt8192 to mediatek,dpi

Rex-BC Chen (2):
      drm/mediatek: dpi: Add check for max clock rate in mode_valid
      drm/mediatek: dpi: Add config for mt8192

Rob Herring (1):
      dt-bindings: display: mediatek, dpi: Convert to use graph schema

Wang Qing (1):
      drm/mediatek: dpi: Delete redundant printing of return value

tangchunyou (1):
      drm/mediatek: cec: Delete redundant printing of return value

 .../bindings/display/mediatek/mediatek,dpi.yaml    |  12 +-
 MAINTAINERS                                        |   1 +
 drivers/gpu/drm/mediatek/mtk_cec.c                 |   6 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |  32 +++-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |  19 ++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |   1 +
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |   9 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                | 175 +++++++++------------
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c            |   1 +
 9 files changed, 130 insertions(+), 126 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
