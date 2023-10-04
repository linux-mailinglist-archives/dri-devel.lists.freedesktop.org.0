Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4B27B76A6
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 04:40:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1414710E335;
	Wed,  4 Oct 2023 02:40:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07DD210E324
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Oct 2023 02:40:24 +0000 (UTC)
X-UUID: 59f08b0a625f11eea33bb35ae8d461a2-20231004
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=JdWTdcNDf6wAkZfZYuOCwB5rWSf13DfxWBpKBToyRMo=; 
 b=ky0IVuSTqUc+50rLm/PE5H3MMqUYGtg1KLHLyplRoUTSDTRo15kcS40evY+da04pFZQHliKgmKWxHFeW9iu0N9IutTqQYkERXsNHQ0521aaErrohxoWQp3XHXsJ125xqtC5BCWijeosecFt3No8f2e/DpTykHlWu5jcZAlUL+pY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:aaac4986-87e1-49f6-8610-2b66b9dd6de2, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:89db6af0-9a6e-4c39-b73e-f2bc08ca3dc5,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 59f08b0a625f11eea33bb35ae8d461a2-20231004
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1480167666; Wed, 04 Oct 2023 10:40:16 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 4 Oct 2023 10:40:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 4 Oct 2023 10:40:14 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v11 0/9] Add connector dynamic selection capability
Date: Wed, 4 Oct 2023 10:40:04 +0800
Message-ID: <20231004024013.18956-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--14.549800-8.000000
X-TMASE-MatchedRID: HECydOu7ZluU2fVedEQUO1z+axQLnAVBIaLR+2xKRDIxBvTc7v9+ZyU0
 V2udwSKC5M3BSxL9NtlFAm5O+Q5wcPZomtZBUIXQhK8o4aoss8qMjqpeR/YVDUS/boWSGMtdh2d
 ZdoWeP4Xmp24rTXZI/g46Ehxwo1ljiahd50YTr4qUa50su1E7WywJzaIVMjGtFJMC9vnfmol576
 my5IxjutODPn6/D3UTG9zI5/9pjDck8jpRZkMC+UhwlOfYeSqx4b+uxQ/rA9Zo5YsPsbyLXemo2
 1PNMyiqvOj79KHQcVbDRpsDfF9TvaddX1GSqEt8H5YQyOg71ZZ9LQinZ4QefPcjNeVeWlqY+gtH
 j7OwNO0kL2NLniq3NQMhYXjNgfyh2JQ90sLLhV+6bmWwRthZFvQbLU9mGnJb
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--14.549800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: BBB2A75DEB64F3BF7A1745AE399587A67CF5AF5AF913BF2AD4CB2219F16CC1032000:8
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

To support DSI and eDP as main display connector without modifying
mtk-drm driver, we add connector dynamic selection capability.

Change in v11:
1. move some global variable to a scope.
2. move mtk_drm_crtc_update_output() after pm_runtime_resume_and_get().
3. move return 0 when error occurred into mtk_drm_find_comp_in_ddp_conn_path().

Change in v10:
1. rebase to Linux 6.6-rc3.
2. separate the common part of adding encoder_index interface for ddp_comp
   to a single patch.
3. separate the DP_INTF0 support dynamic selection to a single patch.
4. add the array size while allocating ddp_comp array in mtk_crtc.
5. add some comment for marking encoder_index to -1.

Change in v9:
1. change subject title and [PATCH v11 5/7] title.
2. separate [PATCH v11 4/7]
   and [PATCH v11 5/7].
3. fix typo and some grammar problems in commit message.

Change in v8:
1. add mtk_drm_crtc_path enum to replace array index of all_drm_priv.
2. separate add encoder_index function to another patch.
3. separate add dpi and dsi encoder_index function implementation to
   another patch.
4. separate add dsi conn_routes support to another patch.
5. set encoder_index to -1 if comp->dev doesn't not exist and add
   (encoder_index >= 0) checking before assigning conn_routes.
6. move conn_routes statement to the end of mtk_drm_crtc_create.

Change in v7:
1. separate 2 fixes patch from v6.
2. remove unnecessary null checking and variable.
3. move ddp_comp checking to crtc create.

Change in v6:
1. remove max_ddp_comp_nr.

Change in v5:
1. Change conn_routes array to single component enum id.

Change in v4:
1. Change variable naming from conn_route_num to num_conn_routes.
2. Change he encoder_index function return valuew from int to unsigned int.

Change in v3:
1. Change max_num comparison statement to max().

Change in v2:
1. rebase on linux-next: next-20230426
2. Fix alphabetical order and max_num condition check problem.

Change in v1:
1. based on mediatek-drm maintainer's tree / mediatek-drm-next branch:
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/log/?h=mediatek-drm-next

Jason-JH.Lin (9):
  drm/mediatek: Add mmsys_dev_num to mt8188 vdosys0 driver data
  drm/mediatek: Add crtc path enum for all_drm_priv array
  drm/mediatek: Fix using wrong drm private data to bind mediatek-drm
  drm/mediatek: Add encoder_index interface for mtk_ddp_comp_funcs
  drm/mediatek: Add connector dynamic selection capability
  drm/mediatek: dpi: Support dynamic connector selection
  drm/mediatek: Support dynamic selection of DP_INTF0 on MT8188 VDOSYS0
  drm/mediatek: dsi: Support dynamic connector selection
  drm/mediatek: Support dynamic selection of DSI0 on MT8188 VDOSYS0

 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  2 +
 drivers/gpu/drm/mediatek/mtk_dpi.c          |  9 +++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 72 ++++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |  5 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 32 ++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  8 +++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      | 45 ++++++++++---
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      | 15 ++++-
 drivers/gpu/drm/mediatek/mtk_dsi.c          |  9 +++
 9 files changed, 182 insertions(+), 15 deletions(-)

-- 
2.18.0

