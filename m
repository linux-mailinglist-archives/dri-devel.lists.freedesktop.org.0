Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE423A392D1
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 06:44:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 130A810E62B;
	Tue, 18 Feb 2025 05:44:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Tx+U7mGh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C53A10E61B
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 05:44:14 +0000 (UTC)
X-UUID: 5ed603c8edbb11ef8eb9c36241bbb6fb-20250218
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=wKLpxBKCBvfsCSLQzgV9GkKPk2DekUh6tb2OhIr92UU=; 
 b=Tx+U7mGh/qJc6QcaG2K+CKMfDug7CnWBBQrz/Dc6OtcAUK+P5jOP+l50DKSLX4bYkjedb3r7fLxUJFYvEHocsj0Y/fJTjKMLoh94l2WjYwcGktgb56lrd4bgzGHjy7KJH9d8ZzKljX3T0+fouobinO5xUHNyPLGAf+Dv+q6ga5E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46, REQID:e16f2907-08fc-48a8-ac91-7236452cdfcd, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-30
X-CID-META: VersionHash:60aa074, CLOUDID:234e7ba3-3e52-4e5b-a515-5e42bbdb1515,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:2,IP:nil
 ,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
 1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5ed603c8edbb11ef8eb9c36241bbb6fb-20250218
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 4715822; Tue, 18 Feb 2025 13:44:07 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 18 Feb 2025 13:44:06 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 18 Feb 2025 13:44:06 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Jason-JH Lin
 <jason-jh.lin@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Singo Chang
 <singo.chang@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>, Xavier Chang
 <xavier.chang@mediatek.com>, Xiandong Wang <xiandong.wang@mediatek.com>,
 Sirius Wang <sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>,
 Pin-yen Lin <treapking@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>
Subject: [PATCH v4 0/8] Add GCE support for MT8196
Date: Tue, 18 Feb 2025 13:41:45 +0800
Message-ID: <20250218054405.2017918-1-jason-jh.lin@mediatek.com>
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

This patch series adds support for the MediaTek MT8196 SoC in the CMDQ
driver and related subsystems. The changes include adding compatible
names and iommus property, updating driver data to accommodate hardware
changes, and modifying the usage of CMDQ APIs to support non-subsys ID
hardware.

---
Change in v4:
1. Remove dt-binding header and add a gce header in dts folder.
2. Remove dot in sign-off name.
3. Change addr type from u32 to dma_addr_t for cmdq_reg_shift_addr() and
   cmdq_reg_revert_addr().

Change in v3:
1. Merge 2 dt-bindings pathes together and add more detail commit message.
2. Change type u32 to phys_addr_t for pa_base of struct cmdq_client_reg.
3. Remove cmdq_subsys_is_valid() and subsys_num in CMDQ driver.
4. Add CMDQ_SUBSYS_INVALID to check subsys instead of using
   cmdq_subsys_is_invalid().
5. Make use of CMDQ_THR_SPR0 define to the parameter of CMDQ APIs.
6. Rebase on the new MACRO in mtk-mdp3-comp.h.

Change in v2:
1. Remove the constant and fix warning in dt-bindings.
2. Remove the pa_base parameter of CMDQ APIs and related modification.
3. Move subsys checking to client drivers and use 2 alternative
   CMDQ APIs to achieve the same functionality.

---

Jason-JH Lin (8):
  dt-bindings: mailbox: mediatek: Add support for MT8196 GCE mailbox
  arm64: dts: mediatek: Add GCE header for MT8196
  mailbox: mtk-cmdq: Add driver data to support for MT8196
  soc: mediatek: mtk-cmdq: Add pa_base parsing for unsupported subsys ID
    hardware
  soc: mediatek: mtk-cmdq: Add mminfra_offset compatibility for DRAM
    address
  soc: mediatek: Add programming flow for unsupported subsys ID hardware
  drm/mediatek: Add programming flow for unsupported subsys ID hardware
  media: mediatek: mdp3: Add programming flow for unsupported subsys ID
    hardware

 .../mailbox/mediatek,gce-mailbox.yaml         |   4 +
 arch/arm64/boot/dts/mediatek/mt8196-gce.h     | 612 ++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c       |  33 +-
 drivers/mailbox/mtk-cmdq-mailbox.c            |  90 ++-
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    |  18 +-
 .../platform/mediatek/mdp3/mtk-mdp3-comp.h    |  79 ++-
 drivers/soc/mediatek/mtk-cmdq-helper.c        |  53 +-
 drivers/soc/mediatek/mtk-mmsys.c              |  14 +-
 drivers/soc/mediatek/mtk-mutex.c              |  11 +-
 include/linux/mailbox/mtk-cmdq-mailbox.h      |   2 +
 include/linux/soc/mediatek/mtk-cmdq.h         |   3 +
 11 files changed, 876 insertions(+), 43 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8196-gce.h

-- 
2.43.0

