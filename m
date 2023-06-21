Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5203A737F7F
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 12:23:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DE1510E43D;
	Wed, 21 Jun 2023 10:23:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4075D10E436
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 10:22:56 +0000 (UTC)
X-UUID: 92e90480101d11eeb20a276fd37b9834-20230621
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=EggFaisyYLlZMGKDdteaS6RHQn0kmzvukFhtmqjl8zM=; 
 b=fkcpt4dMTOC5ixSXKk1wgqDep85GFjchHwuX5OrHVODaNFu7T8NUYIzYE9/LhAragdrMvVVWUzXpjRWcGf82oQJjcw5Vn0lXpmpqZ/kfaFBdPeTJy4B9EN9VlYIQs+v/14nPlNszN8oxAYaiUn+YEerpq2Ct65fiYddCk4iDGsY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.27, REQID:fd8469c3-a066-4b30-8b64-6f9538eae72d, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:01c9525, CLOUDID:a8bf243f-de1e-4348-bc35-c96f92f1dcbb,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 92e90480101d11eeb20a276fd37b9834-20230621
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 821007181; Wed, 21 Jun 2023 18:22:49 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 21 Jun 2023 18:22:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 21 Jun 2023 18:22:48 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Alexandre Mergnat
 <amergnat@baylibre.com>
Subject: [PATCH v3 0/4] Fix mediatek-drm coverity issues
Date: Wed, 21 Jun 2023 18:22:43 +0800
Message-ID: <20230621102247.10116-1-jason-jh.lin@mediatek.com>
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
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add this patch series to fix some mediatek-drm coverity issues.

Change in v3:
1. swap Fixes and Signed tag.
2. change cast (__u64) to '=' then ' *='.

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
 drivers/gpu/drm/mediatek/mtk_drm_gem.c   |  3 ++-
 drivers/gpu/drm/mediatek/mtk_drm_plane.c | 28 ++++++++++++------------
 4 files changed, 22 insertions(+), 21 deletions(-)

-- 
2.18.0

