Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97587B3816D
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 13:41:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7054810E7E7;
	Wed, 27 Aug 2025 11:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="WYzz/VNk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC26410E7BB
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 11:40:17 +0000 (UTC)
X-UUID: 963dc5ac833a11f0bd5779446731db89-20250827
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=J8gnlV72WZgKZtB2F8l1wKF5O8kipZ2VREg53WszLKc=; 
 b=WYzz/VNkYHchOMW80pcuv9pNkdYTo716dEITFN2uC2B604ZJny5I8Qnfx/9k/TIh9cEjgUtb8cDZHF2Y2wxEw81gIDLanc6QPUV2X8aIOxdrgmjYolcbD386hnmoMctuoyem3YTkewY0hxHmoe9jtNEr3e+rCSnPfw5YVL6cYnw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3, REQID:2c54b6e8-3156-48dc-a91f-1d35117d775f, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-30
X-CID-META: VersionHash:f1326cf, CLOUDID:78b6ec44-18c5-4075-a135-4c0afe29f9d6,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:-5,Content:0|15|50,EDM:2,IP:n
 il,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
 ,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 963dc5ac833a11f0bd5779446731db89-20250827
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1541416151; Wed, 27 Aug 2025 19:40:10 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 27 Aug 2025 19:40:08 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 27 Aug 2025 19:40:07 +0800
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
Subject: [PATCH v7 00/20] Add GCE support for MT8196
Date: Wed, 27 Aug 2025 19:37:32 +0800
Message-ID: <20250827114006.3310175-1-jason-jh.lin@mediatek.com>
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

This patch series adds support for the MediaTek MT8196 SoC in the CMDQ
driver and related subsystems. The changes include adding compatible
names and iommus property, updating driver data to accommodate hardware
changes, and modifying the usage of CMDQ APIs to support non-subsys ID
hardware.

---

Change in v7:
1. Rename cmdq_reg_shift_addr() and cmdq_reg_revert_addr() to 
   cmdq_convert_gce_addr() and cmdq_revert_gce_addr().
2. Change cmdq_vm_toggle to cmdq_vm_init().

Change in v6:
1. Move the removal patches to the end of series.
2. Fix build error for cmdq_pkt_jump_rel_temp patch.

Change in RESEND v5:
1. Separate the removal of cmdq_get_shift_pa() from [PATCH v5 03/19] to a
   single patch [PATCH RESEND v5 10/20].

Change in v5:
1. Rebase on tag: next-20250424 + patch [1].
2. Split adding driver data for MT8196 patch to 3 independent patch
   and add more detail commit message to each patch.
3. Refine passing shift_pa as the parameter in API to storing it into
   the cmdq_pkt.
4. Refine DMA address potential issue in cmdq mailbox driver.
5. Change the mminfra_offset related mbox API to passing it by cmdq_pkt.
6. Add new cmdq_pkt_write_pa() and cmdq_pkt_write_subsys() APIs to
   replace the cmdq_pkt_write().

[1] mailbox: mtk-cmdq: Refine GCE_GCTL_VALUE setting
- https://patchwork.kernel.org/project/linux-mediatek/patch/20250421035650.441383-1-jason-jh.lin@mediatek.com/

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

Jason-JH Lin (20):
  arm64: dts: mediatek: Add GCE header for MT8196
  mailbox: mtk-cmdq: Refine DMA address handling for the command buffer
  mailbox: mtk-cmdq: Add cmdq private data to cmdq_pkt for generating
    instruction
  soc: mediatek: mtk-cmdq: Add cmdq_get_mbox_priv() in cmdq_pkt_create()
  soc: mediatek: mtk-cmdq: Add cmdq_pkt_jump_rel_temp() for removing
    shift_pa
  mailbox: mtk-cmdq: Add GCE hardware virtualization configuration
  mailbox: mtk-cmdq: Add mminfra_offset configuration for DRAM
    transaction
  mailbox: mtk-cmdq: Add driver data to support for MT8196
  soc: mediatek: mtk-cmdq: Add pa_base parsing for hardware without
    subsys ID support
  soc: mediatek: mtk-cmdq: Add new APIs to replace cmdq_pkt_write() and
    cmdq_pkt_write_mask()
  soc: mediatek: mtk-cmdq: Add mminfra_offset adjustment for DRAM
    addresses
  soc: mediatek: Add programming flow for unsupported subsys ID hardware
  drm/mediatek: Add programming flow for unsupported subsys ID hardware
  media: platform: mtk-mdp3: Add programming flow for unsupported subsys
    ID hardware
  media: platform: mtk-mdp3: Change cmdq_pkt_jump_rel() to
    cmdq_pkt_jump_rel_temp()
  soc: mediatek: mtk-cmdq: Remove shift_pa parameter from
    cmdq_pkt_jump()
  media: platform: mtk-mdp3: Use cmdq_pkt_jump_rel() without shift_pa
  soc: mediatek: mtk-cmdq: Remove cmdq_pkt_jump() and
    cmdq_pkt_jump_rel_temp()
  soc: mediatek: mtk-cmdq: Remove cmdq_pkt_write() and
    cmdq_pkt_write_mask()
  mailbox: mtk-cmdq: Remove unsued cmdq_get_shift_pa()

 arch/arm64/boot/dts/mediatek/mt8196-gce.h     | 612 ++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c       |  24 +-
 drivers/mailbox/mtk-cmdq-mailbox.c            | 111 +++-
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    |  16 +-
 .../platform/mediatek/mdp3/mtk-mdp3-comp.h    |  70 +-
 .../platform/mediatek/mdp3/mtk-mdp3-core.c    |   2 -
 .../platform/mediatek/mdp3/mtk-mdp3-core.h    |   1 -
 drivers/soc/mediatek/mtk-cmdq-helper.c        |  68 +-
 drivers/soc/mediatek/mtk-mmsys.c              |  12 +-
 drivers/soc/mediatek/mtk-mutex.c              |   8 +-
 include/linux/mailbox/mtk-cmdq-mailbox.h      |  19 +-
 include/linux/soc/mediatek/mtk-cmdq.h         |  83 ++-
 12 files changed, 937 insertions(+), 89 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8196-gce.h

-- 
2.43.0

