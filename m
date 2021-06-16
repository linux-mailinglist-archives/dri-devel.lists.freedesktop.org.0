Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B00AF3A9E7A
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 17:03:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6FB189E01;
	Wed, 16 Jun 2021 15:03:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BF0089E01
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 15:03:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8785F61166;
 Wed, 16 Jun 2021 15:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623855786;
 bh=B/8cyiRgZZDp/y5oNNYykR0cKi9FuWzA1nHSD1KZPxI=;
 h=From:To:Cc:Subject:Date:From;
 b=qw3x2D+bjW8T0v5E585a/65ntpL2tBTKQ2UiYpvUWTwjnI3Rmi3sObEJho1KYU2NZ
 HG88CwDbupkDaSk2u+vWQ7176P5D63KJr3e9TZpnPdnYNaYIpgNfiywdW5VIw+RcGi
 2YdiUSXyzg69YPn5tGwwAi8rds5kiGUGQ2xAOo92LNVCbl6JHS+Um71YynQ7FDfvdY
 8C//A7PRxuL/yxh1vOb+rQ4zYftPvDuqvEXANbP8VZ9+tB9PNp+K8K1KkX+F5gAfDf
 +lGQFFMWfc3K/GT/2TwJ1M6VJ8eRwCGwVuw0wOFQo59Ma+cla6wljrE7uBs+8bt3Ur
 hsfadS98wzxdg==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Subject: [GIT PULL] mediatek drm next for 5.14
Date: Wed, 16 Jun 2021 23:03:00 +0800
Message-Id: <20210616150301.292-1-chunkuang.hu@kernel.org>
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
Cc: Rex-BC Chen <rex-bc.chen@mediatek.com>, Wang Li <wangli74@huawei.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Dave & Daniel:

This includes:

1. Add MT8167 HDMI support
2. Fix PM reference leak
3. Add MT8183 DPI dual edge support

Regards,
Chun-Kuang.

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-5.14

for you to fetch changes up to ec8747c52434b69cea2b18068e72f051e23d3839:

  drm/mediatek: dpi: Add bus format negotiation (2021-06-04 08:58:56 +0800)

----------------------------------------------------------------
Mediatek DRM Next for Linux 5.14

1. Add MT8167 HDMI support
2. Fix PM reference leak
3. Add MT8183 DPI dual edge support

----------------------------------------------------------------
Neil Armstrong (5):
      dt-bindings: display: mediatek, hdmi: Convert to use graph schema
      dt-bindings: mediatek: add mt8167 to hdmi, hdmi-ddc and cec bindings
      drm/mediatek: hdmi: Add check for CEA modes only
      drm/mediatek: hdmi: Add optional limit on maximal HDMI mode clock
      drm/mediatek: hdmi: Add MT8167 configuration

Rex-BC Chen (3):
      drm/mediatek: dpi: Add dual edge sample mode support
      drm/mediatek: dpi: Add output bus formats to driver data
      drm/mediatek: dpi: Add bus format negotiation

Wang Li (1):
      drm/mediatek: Fix PM reference leak in mtk_crtc_ddp_hw_init()

 .../bindings/display/mediatek/mediatek,cec.yaml    |  52 ++++++++
 .../display/mediatek/mediatek,hdmi-ddc.yaml        |  58 +++++++++
 .../bindings/display/mediatek/mediatek,hdmi.txt    | 136 ---------------------
 .../bindings/display/mediatek/mediatek,hdmi.yaml   | 133 ++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dpi.c                 | 129 ++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |   2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |  17 +++
 7 files changed, 384 insertions(+), 143 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
