Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 014E19F63DC
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 11:53:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9484E10EB66;
	Wed, 18 Dec 2024 10:53:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="YeRR4CJb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [IPv6:2a01:4f8:201:9162::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CEA710EB65
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 10:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1734519211;
 bh=EzGXzrdmDmG67qz3B2zS16R/SVMfvEfnxeN+QoREF1Q=;
 h=From:To:Cc:Subject:Date:From;
 b=YeRR4CJbxmqjOkjfozvf80dO+A/rwi1qILbZQfVMY8wTFsgh2k7Hcrtot6Bzqi1Ue
 8oB5QytCMIHNofLQjKExy1MXduovXTmjlBcyb2fZyjvg0mJwCTTM+IiZsVcaLlm2ql
 07O/snuC3nJg5BcO8Xn/lq8aUEWJgDHOlNH/8KczLO6qoSzwxoKMslKa0U5kY/yrkV
 lLBRUfnzzV4Z4Go032UD1BWh3XZF7C1dc1zCzhcl4e8gMIVtKXGrqhGeu9ogivJVav
 +QrLyzcTLX9qf5xUavQPnXxZqsbIdeGOgmyGxEDyQqbdIspNMNQLiU/2bgbaZCOhtt
 /5zdJdZYI/Zyg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id CA2A317E3610;
 Wed, 18 Dec 2024 11:53:29 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mchehab@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, moudy.ho@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, sebastian.fricke@collabora.com,
 macpaul.lin@mediatek.com
Subject: [PATCH v1 0/3] MediaTek MT8188 MDP3 Enablement
Date: Wed, 18 Dec 2024 11:53:17 +0100
Message-ID: <20241218105320.38980-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
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

This series adds the necessary bindings and devicetree nodes to enable
the entire Multimedia Data Path 3 (MDP3) macro-block, found in MediaTek's
MT8188 SoC.

This was tested on a MediaTek Genio 700 EVK board.

AngeloGioacchino Del Regno (3):
  dt-bindings: display: mediatek: Add compatibles for MT8188 MDP3
  dt-bindings: media: mediatek: mdp3: Add compatibles for MT8188 MDP3
  arm64: dts: mediatek: mt8188: Add all Multimedia Data Path 3 nodes

 .../display/mediatek/mediatek,aal.yaml        |   4 +
 .../display/mediatek/mediatek,color.yaml      |   4 +
 .../display/mediatek/mediatek,merge.yaml      |   4 +
 .../display/mediatek/mediatek,padding.yaml    |  10 +-
 .../bindings/media/mediatek,mdp3-fg.yaml      |   8 +-
 .../bindings/media/mediatek,mdp3-hdr.yaml     |   8 +-
 .../bindings/media/mediatek,mdp3-rsz.yaml     |   1 +
 .../bindings/media/mediatek,mdp3-stitch.yaml  |   8 +-
 .../bindings/media/mediatek,mdp3-tcc.yaml     |   8 +-
 .../bindings/media/mediatek,mdp3-tdshp.yaml   |   8 +-
 .../bindings/media/mediatek,mdp3-wrot.yaml    |   1 +
 arch/arm64/boot/dts/mediatek/mt8188.dtsi      | 313 ++++++++++++++++++
 12 files changed, 364 insertions(+), 13 deletions(-)

-- 
2.46.1

