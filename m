Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D74D67A52F1
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 21:22:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EAA110E2D0;
	Mon, 18 Sep 2023 19:22:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F3610E2C7
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 19:22:18 +0000 (UTC)
X-UUID: a8b86e8c565811ee8051498923ad61e6-20230919
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=/UOv9xZiXKefNR6q5rMt8+g3tJ4eyURnjoxNDdrYYPY=; 
 b=qclhOeUWvzH1H0Egt7GLgJAyJrbI9L848aDHO5gSdrT6YkL2RHFiF9pRR98ni5ye6sU5yyKNjX93lEOEPLwpEIowgDdc6KUZ4s5eeT/IUZjfn1lpGrt2sCZThzNY6HACvJqptDj3VWfe1PYD3A2gFNU3XVkqdu/PciIUorn+uCg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31, REQID:21fafd34-8548-47c5-9548-315a8f4112a1, IP:0,
 U
 RL:0,TC:0,Content:100,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:100
X-CID-META: VersionHash:0ad78a4, CLOUDID:00dafabe-14cc-44ca-b657-2d2783296e72,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:801|102,TC:nil,Content:3,EDM:-3,IP:n
 il,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR
 :NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a8b86e8c565811ee8051498923ad61e6-20230919
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1727443107; Tue, 19 Sep 2023 03:22:08 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 19 Sep 2023 03:22:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 19 Sep 2023 03:22:06 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 00/15] Add CMDQ secure driver for SVP
Date: Tue, 19 Sep 2023 03:21:49 +0800
Message-ID: <20230918192204.32263-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.467400-8.000000
X-TMASE-MatchedRID: 7eVHqPQV5C/JmaR8yBHGWNRZ1mKTfKthE21NSmBqEKfOxDyJFXIPjjFa
 TRf5dTetwavfQ6gcAlY7b3Js3F6vVGymsXpN1zOArDFtme53Kvsuhg66Itb65XyKcwQTdriqZSg
 PkksZfMCRWd5j2pelskrNzRlf/eAmxHJTZUnf9cgD2WXLXdz+AX9oOiiWbcZdRi9INZ1ZpGEwrA
 JnuG4aIS/rjK1CMnpugDLqnrRlXrZ8nn9tnqel2MZW5ai5WKlyMMz1R7/AueTvlEkaSw9lGL93v
 k9lpGptRcLjcbUyXX7JxRwU0I1U81K2ZEtDP2FLo548hMsDjb15pPWcZ/qZbFb8T69FNrV2jofs
 MjQaxVwyYjbiqIQ3CsykhtyXcigD6rVdgBjDT2oh1j2M6LiVMg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.467400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 8B037BF6E71F03E6BA839CFECE3F62CBC7C30FEDB63D7993BBFEE9AEF3E9DB932000:8
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Elvis Wang <Elvis.Wang@mediatek.com>,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For the Secure Video Path (SVP) feature, inculding the memory stored
secure video content, the registers of display HW pipeline and the
HW configure operations are required to execute in the secure world.

So using a CMDQ secure driver to make all display HW registers
configuration secure DRAM access permision settings execute by GCE
secure thread in the secure world.

We are landing this feature on mt8188 and mt8195 currently.

Jason-JH.Lin (15):
  dt-bindings: mailbox: Add property for CMDQ secure driver
  dt-bindings: gce: mt8195: Add CMDQ_SYNC_TOKEN_SECURE_THR_EOF event id
  soc: mailbox: Add SPR definition for GCE
  soc: mailbox: Add cmdq_pkt_logic_command to support math operation
  mailbox: mediatek: Add cmdq_pkt_write_s_reg_value to CMDQ driver
  mailbox: mediatek: Add cmdq_mbox_stop to disable GCE thread
  mailbox: mediatek: Add loop pkt flag and irq handling for loop command
  soc: mediatek: Add cmdq_pkt_finalize_loop to CMDQ driver
  mailbox: mediatek: Add secure CMDQ driver support for CMDQ driver
  mailbox: mediatek: Add CMDQ secure mailbox driver
  soc: mediatek: Add cmdq_insert_backup_cookie before EOC for secure pkt
  mailbox: mediatek: Add CMDQ driver support for mt8188
  mailbox: mediatek: Add mt8188 support for CMDQ secure driver
  mailbox: mediatek: Add mt8195 support for CMDQ secure driver
  arm64: dts: mediatek: mt8195: Add CMDQ secure driver support for gce0

 .../mailbox/mediatek,gce-mailbox.yaml         |   30 +-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      |    2 +
 drivers/mailbox/Makefile                      |    2 +-
 drivers/mailbox/mtk-cmdq-mailbox.c            |   67 +-
 drivers/mailbox/mtk-cmdq-sec-mailbox.c        | 1103 +++++++++++++++++
 drivers/mailbox/mtk-cmdq-sec-tee.c            |  202 +++
 drivers/soc/mediatek/mtk-cmdq-helper.c        |   81 ++
 include/dt-bindings/gce/mt8195-gce.h          |    6 +
 include/linux/mailbox/mtk-cmdq-mailbox.h      |   15 +
 .../linux/mailbox/mtk-cmdq-sec-iwc-common.h   |  293 +++++
 include/linux/mailbox/mtk-cmdq-sec-mailbox.h  |   83 ++
 include/linux/mailbox/mtk-cmdq-sec-tee.h      |   31 +
 include/linux/soc/mediatek/mtk-cmdq.h         |   65 +
 13 files changed, 1971 insertions(+), 9 deletions(-)
 create mode 100644 drivers/mailbox/mtk-cmdq-sec-mailbox.c
 create mode 100644 drivers/mailbox/mtk-cmdq-sec-tee.c
 create mode 100644 include/linux/mailbox/mtk-cmdq-sec-iwc-common.h
 create mode 100644 include/linux/mailbox/mtk-cmdq-sec-mailbox.h
 create mode 100644 include/linux/mailbox/mtk-cmdq-sec-tee.h

-- 
2.18.0

