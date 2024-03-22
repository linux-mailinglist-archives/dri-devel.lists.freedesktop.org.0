Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA8C886615
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 06:29:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E41B410F0EA;
	Fri, 22 Mar 2024 05:29:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="PJ1uqZMN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74ABA10F0EA
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 05:28:41 +0000 (UTC)
X-UUID: 0589b3b4e80d11ee935d6952f98a51a9-20240322
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Usnff8Er3rIMdWxKiqlOE5MgDyhxdLX0Yc3cR7W3AJY=; 
 b=PJ1uqZMNHUpsvTcLIKNJddosdl5BSdPzGZFfTGU7hxL56oExRdxtfS+BpcVNNhOiMxdyf9rx2mmWp+6hH81bmchPqFKfHMWAHJMXzcMZz3J5X3zDz+dbTv9aRPPGhf25gM20+FvdGqlEl29Rjx4R0PL4oG1uyQL54Sisvut5SHU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:8d7782ec-b57c-47f4-a8a3-d470fea787ee, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6f543d0, CLOUDID:b355cc81-4f93-4875-95e7-8c66ea833d57,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0589b3b4e80d11ee935d6952f98a51a9-20240322
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1811704977; Fri, 22 Mar 2024 13:28:32 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Mar 2024 13:28:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Mar 2024 13:28:30 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, CK Hu <ck.hu@mediatek.com>, "Nancy .
 Lin" <nancy.lin@mediatek.com>, Fei Shao <fshao@chromium.org>, Sean Paul
 <sean@poorly.run>, Jason Chen
 <jason-ch.chen@mediatek.corp-partner.google.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Hsiao Chien Sung" <shawn.sung@mediatek.com>
Subject: [PATCH v6 00/14] Support IGT in display driver
Date: Fri, 22 Mar 2024 13:28:15 +0800
Message-ID: <20240322052829.9893-1-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--14.182000-8.000000
X-TMASE-MatchedRID: Wqf52A9rT4YlLXaRonFeEbttJwl7IC+W0ZujfvihvDD7efdnqtsaE5as
 fA8Y/RCFuYLbYE0iLKKrIfOiZKnM2PZ+/QtM9+8zsyNb+yeIRAoZKp0SZ4P+dadrpTvh7T6o1Cn
 XdZXfWcq7VVZF0bPoryO67GkBYlEQhdUss4Ved7OjFYHTfcPkwiseSAhqf1rRTy+DUVdqPWjv0n
 IDaa/NCCsPhfgJ1E3VJyXNTsR1fWk08UV4fwLv343NgkEqAN0RTJDl9FKHbrmdohxAwFG9tKPFj
 JEFr+olwXCBO/GKkVqOhzOa6g8KrafYvrbPp2Htp4R90NpPmwV6x7wokKKR3oSH7qaGHa2mzDex
 lL339Ys=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--14.182000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 3B999CA0D36F1EE2A31A5B281889FA089D80BC4D465A175147ACF276B186E4F62000:8
X-MTK: N
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

From: Hsiao Chien Sung <shawn.sung@mediatek.com>

This series is based on 20240322012808.26234-1-shawn.sung@mediatek.com.

This series adds support for running IGT (Intel GPU Tool) tests
with MediaTek display driver. The following changes will be
applied:

1. Add a new API for creating GCE thread loop to retrieve CRCs
   from the hardware component
2. Support hardware CRC calculation in both VDOSYS0 and VDOSYS1
3. Support alpha blending in both VDOSYS0 and VDOSYS1

Changes in v6:
- Use drm_vblank_work to deffer the CRC work into bottom halves
- Separate the patches for "Premultiplied" and "None" alpha blending

Changes in v5:
- Add more descriptions to the codes
- Add DRM mode configs to the driver data
- Squash and rearrange the commits

Changes in v4:
- Separate the patch into smaller ones
- Change the title of some patches
- Revert the changes that are not related to the series

Changes in v3:
- Modify the dt-binding document of Mediatek OVL
- Set DRM mode configs accroding to the hardware capabilities
- Replace cmdq_pkt_jump_absolute() with cmdq_pkt_jump()

Changes in v2:
- Simplify CMDQ by adding commands that are currently used only
- Integrate CRC related codes into new APIs for Mixer and OVL to reuse
- Add CPU version CRC retrieval when CMDQ is disabled

Hsiao Chien Sung (14):
  soc: mediatek: Disable 9-bit alpha in ETHDR
  drm/mediatek: Add OVL compatible name for MT8195
  drm/mediatek: Add missing plane settings when async update
  drm/mediatek: Add DRM_MODE_ROTATE_0 to rotation property
  drm/mediatek: Set DRM mode configs accordingly
  drm/mediatek: Turn off the layers with zero width or height
  drm/mediatek: Support alpha blending in display driver
  drm/mediatek: Support "Pre-multiplied" alpha blending in OVL
  drm/mediatek: Support "Pre-multiplied" alpha blending in Mixer
  drm/mediatek: Support "None" alpha blending in OVL
  drm/mediatek: Support "None" alpha blending in Mixer
  drm/mediatek: Support CRC in display driver
  drm/mediatek: Support CRC in OVL
  drm/mediatek: Support CRC in OVL adaptor

 drivers/gpu/drm/mediatek/mtk_crtc.c           | 260 +++++++++++++++
 drivers/gpu/drm/mediatek/mtk_crtc.h           |  38 +++
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c       |   6 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h       |   9 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |   6 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       | 304 ++++++++++++++++--
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   |  23 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  24 ++
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   3 +
 drivers/gpu/drm/mediatek/mtk_ethdr.c          |  94 +++++-
 drivers/gpu/drm/mediatek/mtk_ethdr.h          |   5 +
 drivers/gpu/drm/mediatek/mtk_plane.c          |  15 +-
 drivers/soc/mediatek/mtk-mmsys.c              |   1 +
 13 files changed, 744 insertions(+), 44 deletions(-)

--
2.18.0

