Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E3087F7F6
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 08:03:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E338710F18D;
	Tue, 19 Mar 2024 07:03:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="NOzqJoaY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C26A610F176
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 07:03:04 +0000 (UTC)
X-UUID: b8b93d66e5be11eeb8927bc1f75efef4-20240319
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=EYOFrIPj763jT3PLRcGM0ZquAZ54oz4DX2bz2jRJwIg=; 
 b=NOzqJoaYD0glVemcO98kmk7rjBVtRt4i8gruD4EErhnteiPf8iqcOJZbDZiqSVRuvV1VmeSz7UU70R7uXHf9FBGr7RpDRMeFzUGQ9D2BudIOizZHgg4NEHZH0FMv9H0LV3oRmbsBGOLiht26xPwratN/RzlDo6d+so8RV+2YUxg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:bcb19b6d-8a66-4aca-a5b3-bcebfa572858, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6f543d0, CLOUDID:d5850f00-c26b-4159-a099-3b9d0558e447,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b8b93d66e5be11eeb8927bc1f75efef4-20240319
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 613645592; Tue, 19 Mar 2024 15:03:00 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 19 Mar 2024 15:02:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 19 Mar 2024 15:02:58 +0800
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
Subject: [PATCH v2 00/14] Rename mtk_drm_* to mtk_*
Date: Tue, 19 Mar 2024 15:02:43 +0800
Message-ID: <20240319070257.6443-1-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
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

From: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>

Rename some unnecessary  "mtk_drm_*" to "mtk_*" because:
- Lower the matches when searching the native drm_* codes
- Reduce the code

Changes in v2:
- Sort header files alphabetically
- Seperate patches for renaming .c files to avoid conflicts

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
 .../mediatek/{mtk_drm_crtc.c => mtk_crtc.c}   | 213 +++++++++---------
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
 26 files changed, 275 insertions(+), 286 deletions(-)
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

