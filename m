Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 907108864B0
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 02:28:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDCFE11231F;
	Fri, 22 Mar 2024 01:28:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="t5+q2IjU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D01AB11230A
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 01:28:20 +0000 (UTC)
X-UUID: 7225d100e7eb11ee935d6952f98a51a9-20240322
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=YUf9Bpw3wICYiwqtGH7qoo2KJtiElIy8h+i2gA9rinE=; 
 b=t5+q2IjUSJE8FqhWQoJaYWa92SMxm9l87TKfTVm11No16kXGoEpjBOHN3om4e49exrpE3mu3MSrdKzPlACo7bUErIWyg1QTDj/ze5l5Edr1biyBQjd4aZy3wdHu5zCsIniUFbthuLGshcMC6jQfNp0+6UlSe0DLiJ8vwjAFRwbs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:ddfb7232-90b9-4a55-b692-40400838bdd2, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6f543d0, CLOUDID:c9a6c981-4f93-4875-95e7-8c66ea833d57,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7225d100e7eb11ee935d6952f98a51a9-20240322
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1576643871; Fri, 22 Mar 2024 09:28:11 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Mar 2024 09:28:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Mar 2024 09:28:09 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>, Hsiao Chien Sung
 <shawn.sung@mediatek.corp-partner.google.com>
Subject: [PATCH v4 00/14] Rename mtk_drm_* to mtk_*
Date: Fri, 22 Mar 2024 09:27:54 +0800
Message-ID: <20240322012808.26234-1-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--16.007000-8.000000
X-TMASE-MatchedRID: 90G6ca/P0SM/5uXNh96gfjl/LoO+pjoA1cuIRwt/4Mjb6Y+fnTZUL80U
 /azwU24yYfroVIh1m0C4hZmY35M3T0FKjjgcgwapaK+MsTwM+1mH7D1bP/FcOjRCaZSKE/OslSB
 IvH74wfKcja777HRNuk7WDVwHg5SjAM0/G7XUdeO6kMgL3jbYOhvSLX87MvP1T+JjZQGVgumjxY
 yRBa/qJcFwgTvxipFajoczmuoPCq2UTGVAhB5EbQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--16.007000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 80A2B61020311C98EBCDB6CA4D8DA2170E11795AA2D541DEAB6167E5E95BD9352000:8
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

From: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>

Rename some unnecessary  "mtk_drm_*" to "mtk_*" to:
- Lower the matches when searching the native drm_* codes
- Reduce the code size

Changes in v4:
- Fix patch error

Changes in v3:
- Fix typo and patch error

Changes in v2:
- Sort header files alphabetically
- Seperate patches for renaming .c files to avoid conflicts

This series is based on c958e86e9cc1b of mediatek-drm-next.

Hsiao Chien Sung (14):
  drm/mediatek: Rename "mtk_drm_crtc" to "mtk_crtc"
  drm/mediatek: Rename "mtk_drm_ddp_comp" to "mtk_ddp_comp"
  drm/mediatek: Rename "mtk_drm_plane" to "mtk_plane"
  drm/mediatek: Rename "mtk_drm_gem" to "mtk_gem"
  drm/mediatek: Rename "mtk_drm_hdmi" to "mtk_hdmi"
  drm/mediatek: Rename files "mtk_drm_crtc.h" to "mtk_crtc.h"
  drm/mediatek: Rename files "mtk_drm_crtc.c" to "mtk_crtc.c"
  drm/mediatek: Rename files "mtk_drm_ddp_comp.h" to "mtk_ddp_comp.h"
  drm/mediatek: Rename files "mtk_drm_ddp_comp.c" to "mtk_ddp_comp.c"
  drm/mediatek: Rename files "mtk_drm_plane.h" to "mtk_plane.h"
  drm/mediatek: Rename files "mtk_drm_plane.c" to "mtk_plane.c"
  drm/mediatek: Rename files "mtk_drm_gem.h" to "mtk_gem.h"
  drm/mediatek: Rename files "mtk_drm_gem.c" to "mtk_gem.c"
  drm/mediatek: Rename mtk_ddp_comp functions

 drivers/gpu/drm/mediatek/Makefile             |  12 +-
 .../mediatek/{mtk_drm_crtc.c => mtk_crtc.c}   | 210 +++++++++---------
 drivers/gpu/drm/mediatek/mtk_crtc.h           |  28 +++
 .../{mtk_drm_ddp_comp.c => mtk_ddp_comp.c}    |  51 +++--
 .../{mtk_drm_ddp_comp.h => mtk_ddp_comp.h}    |   9 +-
 drivers/gpu/drm/mediatek/mtk_disp_aal.c       |   4 +-
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c     |   4 +-
 drivers/gpu/drm/mediatek/mtk_disp_color.c     |   4 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |   2 +-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c     |   4 +-
 drivers/gpu/drm/mediatek/mtk_disp_merge.c     |   2 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       |   4 +-
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   |   4 +-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c      |   4 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c            |   4 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h       |  30 ---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  32 +--
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   4 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c            |   6 +-
 drivers/gpu/drm/mediatek/mtk_ethdr.c          |   4 +-
 .../drm/mediatek/{mtk_drm_gem.c => mtk_gem.c} |  65 +++---
 .../drm/mediatek/{mtk_drm_gem.h => mtk_gem.h} |  23 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c           |  14 +-
 drivers/gpu/drm/mediatek/mtk_padding.c        |   4 +-
 .../mediatek/{mtk_drm_plane.c => mtk_plane.c} |  26 +--
 .../mediatek/{mtk_drm_plane.h => mtk_plane.h} |   4 +-
 26 files changed, 275 insertions(+), 283 deletions(-)
 rename drivers/gpu/drm/mediatek/{mtk_drm_crtc.c => mtk_crtc.c} (82%)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_crtc.h
 rename drivers/gpu/drm/mediatek/{mtk_drm_ddp_comp.c => mtk_ddp_comp.c} (94%)
 rename drivers/gpu/drm/mediatek/{mtk_drm_ddp_comp.h => mtk_ddp_comp.h} (98%)
 delete mode 100644 drivers/gpu/drm/mediatek/mtk_drm_crtc.h
 rename drivers/gpu/drm/mediatek/{mtk_drm_gem.c => mtk_gem.c} (76%)
 rename drivers/gpu/drm/mediatek/{mtk_drm_gem.h => mtk_gem.h} (62%)
 rename drivers/gpu/drm/mediatek/{mtk_drm_plane.c => mtk_plane.c} (94%)
 rename drivers/gpu/drm/mediatek/{mtk_drm_plane.h => mtk_plane.h} (95%)

--
2.18.0

