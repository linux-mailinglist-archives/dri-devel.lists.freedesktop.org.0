Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC2AB12DFA
	for <lists+dri-devel@lfdr.de>; Sun, 27 Jul 2025 09:16:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59F1B10E131;
	Sun, 27 Jul 2025 07:16:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="jVYaZ339";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D83610E131
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jul 2025 07:16:25 +0000 (UTC)
X-UUID: 968f79406ab911f0b33aeb1e7f16c2b6-20250727
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=P2axRt7kp87WizBRx7EY7gZVCvOymR2hXiii9+E/OHk=; 
 b=jVYaZ339EmIYINjHEHF6WTvQPH9YokUnGYuklbrNGM3FW9zzEPpL3IhmU4X+1kJVhrMxNn5H4HAAeNwN+4f7FCo8KWyia4INv0uqnc7OssLxrM4G6lYk8QShRgzgra2TcA7MYfJ1TTDvSf7OzhUmhGB7++g8gaUFs7TJ2aVnMQ8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2, REQID:fc5b87d7-ba67-4ccd-9ab1-402e0f4192d1, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:9eb4ff7, CLOUDID:475dd208-aadc-4681-92d7-012627504691,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|15|50,EDM:-3,IP
 :nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
 LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 968f79406ab911f0b33aeb1e7f16c2b6-20250727
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <jay.liu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 957084052; Sun, 27 Jul 2025 15:16:17 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sun, 27 Jul 2025 15:16:14 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Sun, 27 Jul 2025 15:16:13 +0800
From: Jay Liu <jay.liu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Jay Liu <jay.liu@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hsin-Yi
 Wang <hsinyi@chromium.org>, CK Hu <ck.hu@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 0/7] porting pq compnent for MT8196
Date: Sun, 27 Jul 2025 15:15:50 +0800
Message-ID: <20250727071609.26037-1-jay.liu@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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

From: 20220315152503 created <jay.liu@mediatek.com>

add ccorr/dither/gamma/tdshp support for MT8196

Change in v2:
- Modify the ccorr driver code to optimize the ctm_set process and avoid affecting other ICs.
- Modify the tdshp driver code to remove unnecessary code.
- Update the dt-bindings of tdshp, including clocks, description, examples, etc.

This patch series id base on [1]
[1] Add components to support PQ in display path for MT8196
    - https://patchwork.kernel.org/project/linux-mediatek/list/?series=955361
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Jay Liu (7):
  drm/mediatek: Add CCORR component support for MT8196
  drm/mediatek: fix CCORR mtk_ctm_s31_32_to_s1_n function issue
  drm/mediatek: Add TDSHP component support for MT8196
  dt-bindings: display: mediatek: disp-tdshp: Add support for MT8196
  dt-bindings: display: mediatek: ccorr: Add support for MT8196
  dt-bindings: display: mediatek: dither: Add support for MT8196
  dt-bindings: display: mediatek: gamma: Add support for MT8196

 .../display/mediatek/mediatek,ccorr.yaml      |  1 +
 .../display/mediatek/mediatek,disp-tdshp.yaml | 50 ++++++++++++++++++
 .../display/mediatek/mediatek,dither.yaml     |  1 +
 .../display/mediatek/mediatek,gamma.yaml      |  1 +
 drivers/gpu/drm/mediatek/mtk_crtc.c           |  5 +-
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c       | 52 ++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h       |  8 +--
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c     | 30 +++--------
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  2 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  2 +
 10 files changed, 122 insertions(+), 30 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,disp-tdshp.yaml

-- 
2.46.0

