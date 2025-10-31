Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C21F0C25FFC
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 17:07:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B399210EBE6;
	Fri, 31 Oct 2025 16:07:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="ZDm+MkT2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 555FE10EBE5
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 16:07:23 +0000 (UTC)
X-UUID: aa9d8192b67311f0b33aeb1e7f16c2b6-20251101
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=H0ntjPd1uWqBa6fGimNsiyFY278h7Oo7cVnnsBmheKw=; 
 b=ZDm+MkT2kUf/JKxzo4ciFnW2EjXAy0omhfPbbjIxmn3B4d3XrBdytEQZjGvseeNvoUXI77HCkU0mw0a92BbJbNTPFxxd8xDSRTDKZasNzAPZYMSTQRy9guRi4MnZIw0gTgfskprES/5WF7RSMLNric2aB1odMzR4JAlKU3gxoUw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6, REQID:9abfc457-840b-4c97-8ebc-0c6b09f9cafc, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:a9d874c, CLOUDID:1a22e76a-d4bd-4ab9-8221-0049857cc502,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
 0,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
 ,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: aa9d8192b67311f0b33aeb1e7f16c2b6-20251101
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 899490704; Sat, 01 Nov 2025 00:07:14 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sat, 1 Nov 2025 00:07:13 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Sat, 1 Nov 2025 00:07:12 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Nicolas Dufresne
 <nicolas@ndufresne.ca>, Jason-JH Lin <jason-jh.lin@mediatek.com>, Nancy Lin
 <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Paul-PL
 Chen <paul-pl.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>, Xiandong
 Wang <xiandong.wang@mediatek.com>, Sirius Wang <sirius.wang@mediatek.com>,
 Fei Shao <fshao@chromium.org>, Chen-yu Tsai <wenst@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
 Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>
Subject: [PATCH 0/2] Remove shift_pa from CMDQ jump functions (series 3/4)
Date: Sat, 1 Nov 2025 00:06:48 +0800
Message-ID: <20251031160712.1657810-1-jason-jh.lin@mediatek.com>
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

From: Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>

This series removes the shift_pa parameter from CMDQ jump functions and
updates affected drivers.

Series application order:
  1. [Fixes] Refine DMA address handling for the command buffer
  - https://lore.kernel.org/all/20251022171847.379470-1-jason-jh.lin@mediatek.com/
  2. [Series 1/4] Add GCE support for MT8196 and update CMDQ APIs
  - https://lore.kernel.org/all/20251031155838.1650833-1-jason-jh.lin@mediatek.com/
  3. [Series 2/4] Migrate subsystems to new CMDQ APIs
  - https://lore.kernel.org/all/20251031160309.1654761-1-jason-jh.lin@mediatek.com/
  4. [Series 3/4] Remove shift_pa from CMDQ jump functions (this series)
  5. [Series 4/4] Remove deprecated CMDQ APIs

Please apply this series after the CMDQ API migration series[2/4],
and before the final cleanup series.
---

Jason-JH Lin (2):
  soc: mediatek: mtk-cmdq: Remove shift_pa parameter from
    cmdq_pkt_jump()
  media: platform: mtk-mdp3: Use cmdq_pkt_jump_rel() without shift_pa

 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    |  2 +-
 .../platform/mediatek/mdp3/mtk-mdp3-core.c    |  2 --
 .../platform/mediatek/mdp3/mtk-mdp3-core.h    |  1 -
 drivers/soc/mediatek/mtk-cmdq-helper.c        |  6 +++---
 include/linux/soc/mediatek/mtk-cmdq.h         | 20 ++++++++-----------
 5 files changed, 12 insertions(+), 19 deletions(-)

-- 
2.43.0

