Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D9172E1B5
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 13:32:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35E6F10E3A2;
	Tue, 13 Jun 2023 11:32:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50CB910E3AA
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 11:32:21 +0000 (UTC)
X-UUID: f13eb2f009dd11ee9cb5633481061a41-20230613
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=xI7mns31ZaPhmhLU3qbUofxdeX746+32X8z3Yt0wwcE=; 
 b=tAY3Z9Z/EBk8OtX2XvpG6e22UExsnOwQ5Wt/KNqHlc1pcr28j3qpKU/vFMuZGnQLdLQny5BQ5M3s0a51eJp2Tstc+HvSQYhq7qoOixK5RzD63/wMowbOrJccbIi0+spWLazy3ddWzsim2Mi6JIA7r+Ih0CULb8/ajFk1kG8mZ20=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.26, REQID:75dd7652-c4f6-4ab8-a0bc-400e46b03628, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:95
X-CID-INFO: VERSION:1.1.26, REQID:75dd7652-c4f6-4ab8-a0bc-400e46b03628, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
 :quarantine,TS:95
X-CID-META: VersionHash:cb9a4e1, CLOUDID:3746ef6e-2f20-4998-991c-3b78627e4938,
 B
 ulkID:230613193216ZV6I0SK0,BulkQuantity:0,Recheck:0,SF:38|29|28|17|19|48,T
 C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
 ,OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR, TF_CID_SPAM_SDM, TF_CID_SPAM_ASC,
 TF_CID_SPAM_FAS, TF_CID_SPAM_FSD
X-UUID: f13eb2f009dd11ee9cb5633481061a41-20230613
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 897742987; Tue, 13 Jun 2023 19:32:13 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 13 Jun 2023 19:32:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 13 Jun 2023 19:32:12 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Alexandre Mergnat
 <amergnat@baylibre.com>
Subject: [PATCH v2 0/4] Fix mediatek-drm coverity issues
Date: Tue, 13 Jun 2023 19:32:06 +0800
Message-ID: <20230613113210.24949-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add this patch series to fix some mediatek-drm coverity issues.

Change in v2:
1. remove kfree(pkt) in mtk_drm_crtc_create_pkt().
2. change the statement of cnt reach to MAX_CRTC.
3. drop the mtk_gem_obj initialized patch.
4. change casting from unsined long to __u64.
5. add 'int offset' for multiplier calculation.
6. drop the unrelavaent modification in dereference null check patch.

Jason-JH.Lin (4):
  drm/mediatek: Remove freeing not dynamic allocated memory
  drm/mediatek: Add cnt checking for coverity issue
  drm/mediatek: Add casting before assign
  drm/mediatek: Fix dereference before null check

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c  |  7 ++----
 drivers/gpu/drm/mediatek/mtk_drm_drv.c   |  5 ++++-
 drivers/gpu/drm/mediatek/mtk_drm_gem.c   |  2 +-
 drivers/gpu/drm/mediatek/mtk_drm_plane.c | 28 ++++++++++++------------
 4 files changed, 21 insertions(+), 21 deletions(-)

-- 
2.18.0

