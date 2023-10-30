Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7E17DB5A6
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 10:03:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7AB410E24F;
	Mon, 30 Oct 2023 09:03:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68EF710E24F
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 09:03:25 +0000 (UTC)
X-UUID: 2926fab4770311ee8051498923ad61e6-20231030
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=6f5of367GWFLTMNgQF+A8V5kJhe5SrZ87ZPUpmvkcm4=; 
 b=RsZzb4P8TIXw9wjF4L+TqwND1uWH66kDGK7oQQXtOrYMfKp6qrllPeqs9Ty22CVrgfTE3Mvh5f2Yg42n+vG8bZX9OrKQNBTbP/UV4Y6aeLJpTIhmPB0pgQOTpGV0Ksq3eLdkHVxkL7HtK7zoqCQiAWQs3B6EaKPjEfAUhXgzAUk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:045770b1-5fe1-4636-8b90-6dd8ad18418c, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:7a64eefb-4a48-46e2-b946-12f04f20af8c,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 2926fab4770311ee8051498923ad61e6-20231030
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1600321017; Mon, 30 Oct 2023 17:03:15 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 30 Oct 2023 17:03:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 30 Oct 2023 17:03:13 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "CK
 Hu" <ck.hu@mediatek.com>, Sean Paul <seanpaul@chromium.org>
Subject: [PATCH v2 0/1] Fix errors when reporting rotation capability
Date: Mon, 30 Oct 2023 17:03:11 +0800
Message-ID: <20231030090312.7758-1-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.989100-8.000000
X-TMASE-MatchedRID: Z2f9DQPf1tku/MJ2EBezoZVIEKhlTKps68AA1e32M+y7qpOHKudqc+OY
 +B3JL0OU6KyPWSN6DMyYGDWKq7IbHADNPxu11HXjH5YQyOg71ZZ9LQinZ4QefCP/VFuTOXUT3n8
 eBZjGmUzkwjHXXC/4IzsAVzN+Ov/sgmQ6bcMFV02WqAkkYaOobDqacQoxuIGZh+3MYihDJQAATk
 WR47xRfQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.989100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: B4943EC94F410E4ACB98F994AA7D9F27E0FFEE3BB02E92E35E4B3854B250ED0A2000:8
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hsiao Chien Sung <shawn.sung@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This commit is based on 20231024130048.14749-1-shawn.sung@mediatek.com.

This bug is found when running IGT tests.
For CRTCs that doesn't support rotation should still return
DRM_MODE_ROTATE_0. Returns the hardware capabilities accordingly.

Changes in v2:
- Restore DRM_MODE_ROTATE_180 (reflect x + reflect y = rotate 180)
- Define supported rotations in the driver data

Hsiao Chien Sung (1):
  drm/mediatek: Fix errors when reporting rotation capability

 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  1 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       | 30 ++++++++++---------
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   |  5 ++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |  1 +
 drivers/gpu/drm/mediatek/mtk_drm_plane.c      |  2 +-
 5 files changed, 24 insertions(+), 15 deletions(-)

--
2.39.2

