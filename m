Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14098A675D2
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 15:03:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56B7E10E493;
	Tue, 18 Mar 2025 14:03:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="VlsfvZpm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 291C710E493
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 14:03:01 +0000 (UTC)
X-UUID: ae148c50040111f08eb9c36241bbb6fb-20250318
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=9L3QuRg7qq4jIR4VvfIWIj1a6A5KXUIfQeOYZvj+5jY=; 
 b=VlsfvZpmzdg7JIMW2j+qA9NAlvKdVqzdR8asSOFcONlRLDJzuXabeqENeJXfLAOGWNa9jkps76r7FE/2nCijAVN/FKMeaJmPgIW0VSNZvCB75T19noa6nWUYJDF8NqRXbT8LjG76ketNwMT5ktuvZNgJt2BLBf9fC4FS80yXuvE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1, REQID:180a371a-3f60-4070-a275-7aadcc0a94b3, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:0ef645f, CLOUDID:b7d3878c-f5b8-47d5-8cf3-b68fe7530c9a,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
 l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ae148c50040111f08eb9c36241bbb6fb-20250318
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw02.mediatek.com (envelope-from <liankun.yang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 974564621; Tue, 18 Mar 2025 22:02:51 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 18 Mar 2025 22:02:49 +0800
Received: from mszsdclx1211.gcn.mediatek.inc (10.16.7.31) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 18 Mar 2025 22:02:49 +0800
From: Liankun Yang <liankun.yang@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>, 
 <simona@ffwll.ch>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <jitao.shi@mediatek.com>,
 <mac.shen@mediatek.com>, <peng.liu@mediatek.com>,
 <liankun.yang@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/1] *** SUBJECT HERE ***
Date: Tue, 18 Mar 2025 22:02:20 +0800
Message-ID: <20250318140236.13650-1-liankun.yang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

*** BLURB HERE ***

Liankun Yang (1):
  drm/mediatek: Adjust bandwidth limit for DP

Applied to mediatek-drm-fixes [1]
  drm/mediatek: Fix mode valid issue for dp.
  drm/mediatek: Fix YCbCr422 color format issue for DP.

 drivers/gpu/drm/mediatek/mtk_dp.c | 39 ++++++++++++++++---------------
 1 file changed, 20 insertions(+), 19 deletions(-)

-- 
2.45.2

