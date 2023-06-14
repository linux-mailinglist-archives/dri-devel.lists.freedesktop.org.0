Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5B2730B27
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 01:05:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BFE310E029;
	Wed, 14 Jun 2023 23:05:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE6F10E486
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 23:05:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1ACDF63C87;
 Wed, 14 Jun 2023 23:05:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7579BC433C0;
 Wed, 14 Jun 2023 23:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686783913;
 bh=GXEACpeKS/kEkNmq4/tnq2tJnmg2eDAniZKIVQk6qK0=;
 h=From:To:Cc:Subject:Date:From;
 b=grXnTfH2TSmc0YqpkgCu872+dnaiD7wbpimI/wgh4HDbGeWQIMgnysgOpSeehf/Su
 cuHJeLYqHClIWT14htEYM7lAX/TKSOJ7JGjfIicSvTOiUuuzxP1djeDbGJsb7KpK2e
 oglM6TryxkdQtEpzM4emYPJXusBkWG/N32u5DHwMrmr58VlwKKavJEAx1GtzxXrQqJ
 Vqt0Dm0jNy3eblyaGLLA15PBGK8ZeK0OepM7koBWJRT13Y/yeHp1eUd+3Jk26PodCE
 NC5Arnjb8eFFnizmYOI9gfdT8wRHhLw3hbGg5Dezt/JqIDeEFaroLxJgm4zYDRXt/w
 pKOBp6U80FRKQ==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Subject: [GIT PULL] mediatek drm next for 6.5
Date: Wed, 14 Jun 2023 22:58:03 +0000
Message-Id: <20230614225803.2547-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
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
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Dave & Daniel:

This includes:

1. Add display binding document for MT6795

Regards,
Chun-Kuang.

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-6.5

for you to fetch changes up to 4080a0e7b36b7bb103dc739779a338d412c78943:

  dt-bindings: display: mediatek: od: Add compatible for MediaTek MT6795 (2023-06-12 16:18:22 +0000)

----------------------------------------------------------------
Mediatek DRM Next for Linux 6.5

1. Add display binding document for MT6795

----------------------------------------------------------------
AngeloGioacchino Del Regno (12):
      dt-bindings: display: mediatek: dpi: Add compatible for MediaTek MT6795
      dt-bindings: display: mediatek: aal: Add compatible for MediaTek MT6795
      dt-bindings: display: mediatek: dsi: Add compatible for MediaTek MT6795
      dt-bindings: display: mediatek: ovl: Add compatible for MediaTek MT6795
      dt-bindings: display: mediatek: rdma: Add compatible for MediaTek MT6795
      dt-bindings: display: mediatek: wdma: Add compatible for MediaTek MT6795
      dt-bindings: display: mediatek: color: Add compatible for MediaTek MT6795
      dt-bindings: display: mediatek: gamma: Add compatible for MediaTek MT6795
      dt-bindings: display: mediatek: merge: Add compatible for MediaTek MT6795
      dt-bindings: display: mediatek: split: Add compatible for MediaTek MT6795
      dt-bindings: display: mediatek: ufoe: Add compatible for MediaTek MT6795
      dt-bindings: display: mediatek: od: Add compatible for MediaTek MT6795

 .../bindings/display/mediatek/mediatek,aal.yaml    |  1 +
 .../bindings/display/mediatek/mediatek,color.yaml  |  1 +
 .../bindings/display/mediatek/mediatek,dpi.yaml    | 23 +++++++++++++---------
 .../bindings/display/mediatek/mediatek,dsi.yaml    | 19 +++++++++++-------
 .../bindings/display/mediatek/mediatek,gamma.yaml  |  4 ++++
 .../bindings/display/mediatek/mediatek,merge.yaml  |  3 +++
 .../bindings/display/mediatek/mediatek,od.yaml     |  3 +++
 .../bindings/display/mediatek/mediatek,ovl.yaml    |  4 ++++
 .../bindings/display/mediatek/mediatek,rdma.yaml   |  4 ++++
 .../bindings/display/mediatek/mediatek,split.yaml  |  3 +++
 .../bindings/display/mediatek/mediatek,ufoe.yaml   |  3 +++
 .../bindings/display/mediatek/mediatek,wdma.yaml   |  3 +++
 12 files changed, 55 insertions(+), 16 deletions(-)
