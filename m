Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3A44C5939
	for <lists+dri-devel@lfdr.de>; Sun, 27 Feb 2022 05:03:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF0A410EAC0;
	Sun, 27 Feb 2022 04:03:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D8610EAC0
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Feb 2022 04:03:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0D6A1611F1;
 Sun, 27 Feb 2022 04:03:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDEF7C340E9;
 Sun, 27 Feb 2022 04:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645934590;
 bh=rmTOIdLXnxrduKcao1dMovx6h1XzyescCNxEZG4qyko=;
 h=From:To:Cc:Subject:Date:From;
 b=QZhfRs4jJNiMrrZ+zZ72wx9YJIy/drL3Vkx0IG0KNp7sX9xp/QeehHXHQrBMMiQjH
 9QY1WhEhkFAEx+2a9OyyST62NNhieGM670RIawU7xOE4FbUWxC4gT41WzDWNWICJcr
 eshRupQx2qaxq2Me9ndTmSusZmm0IA6ON0RQl19CE0p7xnhvpxl43gx1CX0+7fiz4B
 3Pb616UGRsU5pwocn5SDV6DVNn9wQbXlhAswvKUMsWOxMn4rHYF7GFyscLh0jUDHET
 LgnV5lvkj0cFKzmYhg7D5tRMDX+Mj101gD1DqJ2ds9DGa2JSo0RMODE/KGEy6cjx0/
 gXDgM25xF45hA==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Subject: [GIT PULL] mediatek drm next for 5.18
Date: Sun, 27 Feb 2022 12:03:03 +0800
Message-Id: <1645934583-2018-1-git-send-email-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.7.4
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
Cc: "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, Julien STEPHAN <jstephan@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Dave & Daniel:

This includes:

1. Transfer display binding document to yaml format.
2. Add mt8195 display device binding.
3. Allow commands to be sent during video mode.
4. Add wait_for_event for crtc disable by cmdq.

Regards,
Chun-Kuang.

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-5.18

for you to fetch changes up to aa2d5f2f168c8b380d4e94a32149cef16ed60efc:

  drm/mediatek: Add wait_for_event for crtc disable by cmdq (2022-02-27 11:19:07 +0800)

----------------------------------------------------------------
Mediatek DRM Next for Linux 5.18

1. Transfer display binding document to yaml format.
2. Add mt8195 display device binding.
3. Allow commands to be sent during video mode.
4. Add wait_for_event for crtc disable by cmdq.

----------------------------------------------------------------
Julien STEPHAN (1):
      drm/mediatek: Allow commands to be sent during video mode

Nancy.Lin (2):
      dt-bindings: display: mediatek: add vdosys1 MERGE property for mt8195
      dt-bindings: display: mediatek: add ethdr definition for mt8195

jason-jh.lin (5):
      dt-bindings: display: mediatek: disp: split each block to individual yaml
      dt-bindings: display: mediatek: dsc: add yaml for mt8195 SoC binding
      dt-bindings: display: mediatek: merge: add additional prop for mt8195
      dt-bindings: display: mediatek: add mt8195 SoC binding for vdosys0
      drm/mediatek: Add wait_for_event for crtc disable by cmdq

 .../bindings/display/mediatek/mediatek,aal.yaml    |  77 ++++++++
 .../bindings/display/mediatek/mediatek,ccorr.yaml  |  76 +++++++
 .../bindings/display/mediatek/mediatek,color.yaml  |  86 ++++++++
 .../bindings/display/mediatek/mediatek,disp.txt    | 219 ---------------------
 .../bindings/display/mediatek/mediatek,dither.yaml |  76 +++++++
 .../bindings/display/mediatek/mediatek,dsc.yaml    |  71 +++++++
 .../bindings/display/mediatek/mediatek,ethdr.yaml  | 147 ++++++++++++++
 .../bindings/display/mediatek/mediatek,gamma.yaml  |  77 ++++++++
 .../bindings/display/mediatek/mediatek,merge.yaml  | 110 +++++++++++
 .../bindings/display/mediatek/mediatek,mutex.yaml  |  83 ++++++++
 .../bindings/display/mediatek/mediatek,od.yaml     |  53 +++++
 .../bindings/display/mediatek/mediatek,ovl-2l.yaml |  88 +++++++++
 .../bindings/display/mediatek/mediatek,ovl.yaml    | 103 ++++++++++
 .../display/mediatek/mediatek,postmask.yaml        |  69 +++++++
 .../bindings/display/mediatek/mediatek,rdma.yaml   | 117 +++++++++++
 .../bindings/display/mediatek/mediatek,split.yaml  |  58 ++++++
 .../bindings/display/mediatek/mediatek,ufoe.yaml   |  61 ++++++
 .../bindings/display/mediatek/mediatek,wdma.yaml   |  86 ++++++++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |  12 ++
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |  33 +++-
 20 files changed, 1474 insertions(+), 228 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
