Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6ECD4E6B04
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 00:10:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B806A10E114;
	Thu, 24 Mar 2022 23:09:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5117610E114
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 23:09:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BBCFA6162D;
 Thu, 24 Mar 2022 23:09:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE958C340EC;
 Thu, 24 Mar 2022 23:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648163396;
 bh=koL0yw/ZGPvfN2cElH8U7dgkhIxPULfTtIaPQ3OmoqQ=;
 h=From:To:Cc:Subject:Date:From;
 b=CTYeZLrYwcwEEFtZIY14kEBvBnhvexZTucDHpM/f8bl9nUVKPtDXa0K+BwRuwonhF
 SKwxZ1SLUM9YzpmvfPHDNKhbK+3X0BcFKq8aRa2gBfajNJL9YgAkfZrIDv7Oj5rh2t
 ZSFXmIRsRge/rSBYAnGPGKVMe78TjiYeDeuF4BrvX6tTQsr8lKKoBv+uEocwvxUVHO
 vnK5/I1wijXnannR3MCvlUvfCixLd6gluaaqKYDJZfanyhJMQ4rmIXfmrCkGcU8LsE
 Ss/WvbW8dfYgn0V3vH7W7gNGL6p/zNcpRVUeZMV2jgdUF1rkLhvyvjbPyM3I7J/GL/
 Ra2lpp9fJleIA==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Subject: [GIT PULL] mediatek drm fixes - 20220325
Date: Fri, 25 Mar 2022 07:10:09 +0800
Message-Id: <1648163409-18338-1-git-send-email-chunkuang.hu@kernel.org>
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
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Dave & Daniel:

This includes:

1. Fix dt-binding issue.

Regards,
Chun-Kuang.

The following changes since commit 71941773e143369a73c9c4a3b62fbb60736a1182:

  Add linux-next specific files for 20220310 (2022-03-10 20:04:36 +1100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-fixes-20220325

for you to fetch changes up to 64884e592d71fd567fef7bdcb0736a5dae71ecb2:

  dt-bindings: display: mediatek: Fix examples on new bindings (2022-03-12 17:32:33 +0800)

----------------------------------------------------------------
Mediatek DRM Fixes - 20220325

1. Fix dt-binding issue.

----------------------------------------------------------------
AngeloGioacchino Del Regno (3):
      dt-bindings: display: mediatek, mutex: Fix mediatek, gce-events type
      dt-bindings: display: mediatek, ovl: Fix 'iommu' required property typo
      dt-bindings: display: mediatek: Fix examples on new bindings

jason-jh.lin (1):
      Revert "dt-bindings: display: mediatek: add ethdr definition for mt8195"

 .../bindings/display/mediatek/mediatek,aal.yaml    |  23 +++-
 .../bindings/display/mediatek/mediatek,ccorr.yaml  |  23 +++-
 .../bindings/display/mediatek/mediatek,color.yaml  |  23 +++-
 .../bindings/display/mediatek/mediatek,dither.yaml |  23 +++-
 .../bindings/display/mediatek/mediatek,dpi.yaml    |   3 +-
 .../bindings/display/mediatek/mediatek,dsc.yaml    |  23 +++-
 .../bindings/display/mediatek/mediatek,ethdr.yaml  | 147 ---------------------
 .../bindings/display/mediatek/mediatek,gamma.yaml  |  23 +++-
 .../bindings/display/mediatek/mediatek,merge.yaml  |  49 +++----
 .../bindings/display/mediatek/mediatek,mutex.yaml  |  27 ++--
 .../bindings/display/mediatek/mediatek,od.yaml     |  14 +-
 .../bindings/display/mediatek/mediatek,ovl-2l.yaml |  26 ++--
 .../bindings/display/mediatek/mediatek,ovl.yaml    |  28 ++--
 .../display/mediatek/mediatek,postmask.yaml        |  23 +++-
 .../bindings/display/mediatek/mediatek,rdma.yaml   |  28 ++--
 .../bindings/display/mediatek/mediatek,split.yaml  |  17 ++-
 .../bindings/display/mediatek/mediatek,ufoe.yaml   |  19 ++-
 .../bindings/display/mediatek/mediatek,wdma.yaml   |  26 ++--
 18 files changed, 262 insertions(+), 283 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
