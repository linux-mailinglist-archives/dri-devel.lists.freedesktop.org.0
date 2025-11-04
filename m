Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B299FC301D6
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 10:00:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D19A310E58C;
	Tue,  4 Nov 2025 09:00:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="YOUU5Xq0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 618F410E58C
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 09:00:08 +0000 (UTC)
X-UUID: a5e43718b95c11f0b33aeb1e7f16c2b6-20251104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=5V/Vz/H8HM7LchfMCgMJIzRqE49QYJch3AIZX3W5lns=; 
 b=YOUU5Xq0LuMjGkUosfD+LrR/zgy9bAUAy8mkE6TOqZsjVk1ieVKYuCo1c6YYq0ir8+TbfDqZMHaTLCLiohJJIqYa+o1xwBsgi0p/HM4wYfG4UZBXuU3ciaO+mXqyMtY0cBbNN28QXagzJSJvU7B7ZVJxUb39OHvKFTlT9H07ytI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6, REQID:446a5c81-18e9-4894-afdf-a74b4e83fa2a, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:a9d874c, CLOUDID:726e056b-d4bd-4ab9-8221-0049857cc502,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
 0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
 A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a5e43718b95c11f0b33aeb1e7f16c2b6-20251104
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <liankun.yang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1963540864; Tue, 04 Nov 2025 17:00:01 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 4 Nov 2025 17:00:00 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Tue, 4 Nov 2025 16:59:59 +0800
From: Liankun Yang <liankun.yang@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>, 
 <simona@ffwll.ch>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <mac.shen@mediatek.com>,
 <peng.liu@mediatek.com>, <liankun.yang@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 0/2] Adjust bandwidth limit for DP
Date: Tue, 4 Nov 2025 16:55:10 +0800
Message-ID: <20251104085957.1175-1-liankun.yang@mediatek.com>
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

DP link training checks the current PHY link signal quality.
After DP detects an HPD connection, it should first determine
the current link signal quality in order to select the resolution.

Since the EDP is already fixed to use the EDP panel,
the current training information and resolution are basically fixed.
EDP exists and its process differs from DP. Therefore,
it is necessary to isolate the parsing capability,
panel power, training state and enable state.

For example, the platform support DP 4lane 5.4G,
but panel A support DP 2lane 5.4G.

This is a time sequence:

1. Plug in panel A. According to the platform, it can output 4K 60Hz.
2. Timing mode set 4K 60Hz.
3. Atomic enable(Based on panel A ability, training pass 2lane 5.4G).
4. Finally, due to 2lane 5.4G bandwidth limitation, the platform cannot
output 4K 60Hz, resulting in a black sreen.

If apply this patch.

1. Plug in panel A.
2. Training pass 2lane 5.4G
3. Timing mode set 2K 60Hz(Based on the 2lane 5.4G bandwidth limit).
4. Atomic enable for output screen.

Liankun Yang (2):
  drm/mediatek: Adjust bandwidth limit for DP
  drm/mediatek: Add isolation to edp

 drivers/gpu/drm/mediatek/mtk_dp.c | 57 ++++++++++++++++++++-----------
 1 file changed, 38 insertions(+), 19 deletions(-)

-- 
2.45.2

