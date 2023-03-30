Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3306CF98D
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 05:26:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2DDA10ECBC;
	Thu, 30 Mar 2023 03:26:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B22B810ECC3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 03:26:22 +0000 (UTC)
X-UUID: a12516ceceaa11edb6b9f13eb10bd0fe-20230330
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=GxBeCh6RM3G8NOC3XFvl2usolXzqoj9++sY2YNJMdro=; 
 b=mHT0ciApD7Rfw01hxrw7vmvuqj/rJU0MCG/ABr4iz8vK+l4p88WVw4h7FlzXp+cR01sNV7LlAk6gXVozhuLDPDRpVR7GZSqXznKDpHB1rH3jTlsRKWbp1wBbgHhwhdGof1xMP78ljTJBOGd80fuwaC8rLzTKWa7r7qVFnsXP4sI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22, REQID:a35de0f0-e8da-40a1-bc3b-5a3e8149e5f5, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:95
X-CID-INFO: VERSION:1.1.22, REQID:a35de0f0-e8da-40a1-bc3b-5a3e8149e5f5, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
 :quarantine,TS:95
X-CID-META: VersionHash:120426c, CLOUDID:68545af7-ddba-41c3-91d9-10eeade8eac7,
 B
 ulkID:230330112617X4P2O3KI,BulkQuantity:0,Recheck:0,SF:38|29|28|17|19|48,T
 C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
 ,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: a12516ceceaa11edb6b9f13eb10bd0fe-20230330
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 337355238; Thu, 30 Mar 2023 11:26:16 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Thu, 30 Mar 2023 11:26:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Thu, 30 Mar 2023 11:26:15 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 0/2] drm/mediatek: Add ovl_adaptor get format function
Date: Thu, 30 Mar 2023 11:26:12 +0800
Message-ID: <20230330032614.18837-1-nancy.lin@mediatek.com>
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
Cc: shawn.sung@mediatek.com, singo.chang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "Nancy.Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add ovl_adaptor get_format and get_num_formats component function.
The two functions are needed for getting the supported format in
mtk_plane_init().

Changes in v3:
 - modify for reviewer's comment in v2.
   - add mdp-rdma get supported format api for ovl_adaptor driver.

Changes in v2:
 - remove change id

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>

This series are based on the following patch:
[1] [v8,1/3] drm/mediatek: Refactor pixel format logic
  - 20230309210416.1167020-2-greenjustin@chromium.org

Nancy.Lin (2):
  drm/mediatek: Add mdp_rdma get format function
  drm/mediatek: Add ovl_adaptor get format function

 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  5 ++++
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 14 +++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |  2 ++
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c       | 24 +++++++++++++++++++
 4 files changed, 45 insertions(+)

-- 
2.18.0

