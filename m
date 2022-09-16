Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2845BAE54
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 15:38:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD5610ED36;
	Fri, 16 Sep 2022 13:38:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0E9910ED37
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 13:38:29 +0000 (UTC)
X-UUID: c5b8cf3c2770433080ec13f7067fbff4-20220916
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=H+SS6lfeWpWo2fZcJknMvka571dOGDvz57dChhn0FlM=; 
 b=HJ/Jg7P+/tqVHRImDqsRCC0Sc9tPXQWDn31mNSYEDhkA6iQS3fFemQtAfXWNm9MQyrTSaUO8iAXlH9Xg1Pn79iC9qmgt9Va4FJFi35f0wO3EOam9c6nowC6SMhi0B3SHRXUVx/6/BYlpERVcjGhxMIeg+EUXVBLLRVdIdIXul3g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:024f9688-420e-4e20-8803-995b87ae6f5d, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:95
X-CID-INFO: VERSION:1.1.11, REQID:024f9688-420e-4e20-8803-995b87ae6f5d, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
 :quarantine,TS:95
X-CID-META: VersionHash:39a5ff1, CLOUDID:f1597e8a-35ad-4537-90e7-b56a69d5f8a4,
 B
 ulkID:220916213826Y13N1T1V,BulkQuantity:0,Recheck:0,SF:28|17|19|48|823|824
 ,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL
 :0
X-UUID: c5b8cf3c2770433080ec13f7067fbff4-20220916
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1617441154; Fri, 16 Sep 2022 21:38:24 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 16 Sep 2022 21:38:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 16 Sep 2022 21:38:22 +0800
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>
Subject: [PATCH v2 0/3] Refactor MediaTek DP drivers
Date: Fri, 16 Sep 2022 21:38:18 +0800
Message-ID: <20220916133821.27980-1-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: granquet@baylibre.com, jitao.shi@mediatek.com, liangxu.xu@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 Bo-Chen Chen <rex-bc.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For this series, we do some clean-up and fix a build warning.
This series is based on linux-next-20220915.

Changes for v2:
1. Update commit message in "drm/mediatek: dp: Reduce indentation in mtk_dp_bdg_detect()".
2. Add fix tag for "drm/mediatek: dp: Fix warning in mtk_dp_video_mute()".

Bo-Chen Chen (3):
  drm/mediatek: dp: Reduce indentation in mtk_dp_bdg_detect()
  drm/mediatek: dp: Remove unused register definitions
  drm/mediatek: dp: Fix warning in mtk_dp_video_mute()

 drivers/gpu/drm/mediatek/mtk_dp.c     | 70 ++++++++++++++-------------
 drivers/gpu/drm/mediatek/mtk_dp_reg.h |  6 ---
 2 files changed, 36 insertions(+), 40 deletions(-)

-- 
2.18.0

