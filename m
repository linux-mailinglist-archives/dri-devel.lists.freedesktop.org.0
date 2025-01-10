Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2749A09EF8
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jan 2025 01:10:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF2F010E53F;
	Sat, 11 Jan 2025 00:10:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="duneBVLu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC39810F0B4
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 12:38:52 +0000 (UTC)
X-UUID: d5ba9254cf4f11efbd192953cf12861f-20250110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=sbyY/dLJKnwhMtn8olYX/SdnuBiSGSBddV3RnGGZbYM=; 
 b=duneBVLuuNrtAJ3qXgmXlB7+iRqF4Hm8MLQXMebhYYJBbRdfSCRp8pZzqOFp6IkIn4/LeZiRVdfX36ORlNbgPMZXyCN2dK+CBZ+OsmYmtKPO2ODwCMmihaJmkCqy1LuEqe2AvfNrt2ffoFHmpx0qw/VZNLMT+xRjRxQKlxkw8Ig=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46, REQID:58f8f350-0e20-4807-b949-056b41d7acba, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:60aa074, CLOUDID:b76f4e13-8831-4185-8e40-f83b1917e828,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
 l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d5ba9254cf4f11efbd192953cf12861f-20250110
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw02.mediatek.com (envelope-from <paul-pl.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 549763450; Fri, 10 Jan 2025 20:38:46 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 10 Jan 2025 20:38:45 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 10 Jan 2025 20:38:45 +0800
From: paul-pl.chen <paul-pl.chen@mediatek.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <chunkuang.hu@kernel.org>, <angelogioacchino.delregno@collabora.com>
CC: <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>,
 <jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>, <xiandong.wang@mediatek.com>,
 <sirius.wang@mediatek.com>, <paul-pl.chen@mediatek.com>,
 <sunny.shen@mediatek.com>, <fshao@chromium.org>, <treapking@chromium.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 00/12] Add Mediatek Soc DRM support for mt8196
Date: Fri, 10 Jan 2025 20:33:55 +0800
Message-ID: <20250110123835.2719824-1-paul-pl.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Mailman-Approved-At: Sat, 11 Jan 2025 00:10:20 +0000
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

From: "Paul-pl.Chen" <paul-pl.chen@mediatek.com>

Add support multiple mmsys instances in the one mediatek-drm instance.

Nancy.Lin (7):
  soc: mediatek: add mmsys support for MT8196
  soc: mediatek: mutex: add mutex support for MT8196
  drm/mediatek: add EXDMA support for MT8196
  drm/mediatek: add BLENDER support for MT8196
  drm/mediatek: add OUTPROC support for MT8196
  drm/mediatek: add ovlsys_adaptor support for MT8196
  drm/mediatek: Add support for multiple mmsys in the one mediatek-drm
    driver

Paul-pl.Chen (5):
  dt-bindings: arm: mediatek: mmsys: add compatible for MT8196
  dt-bindings: soc: mediatek: add mutex yaml for MT8196
  dt-bindings: display: mediatek: add EXDMA yaml for MT8196
  dt-bindings: display: mediatek: add BLENDER yaml for MT8196
  dt-bindings: display: mediatek: add OUTPROC yaml for MT8196

 .../bindings/arm/mediatek/mediatek,mmsys.yaml |   5 +
 .../display/mediatek/mediatek,blender.yaml    |  50 ++
 .../display/mediatek/mediatek,exdma.yaml      |  77 ++
 .../display/mediatek/mediatek,outproc.yaml    |  57 ++
 .../bindings/soc/mediatek/mediatek,mutex.yaml |   2 +
 drivers/gpu/drm/mediatek/Makefile             |   4 +
 drivers/gpu/drm/mediatek/mtk_crtc.c           | 350 ++++++--
 drivers/gpu/drm/mediatek/mtk_crtc.h           |   6 +-
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c       | 134 +++-
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h       |   6 +
 drivers/gpu/drm/mediatek/mtk_disp_blender.c   | 352 ++++++++
 drivers/gpu/drm/mediatek/mtk_disp_blender.h   |  17 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  66 +-
 drivers/gpu/drm/mediatek/mtk_disp_exdma.c     | 447 +++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_outproc.c   | 244 ++++++
 drivers/gpu/drm/mediatek/mtk_disp_outproc.h   |  22 +
 .../drm/mediatek/mtk_disp_ovlsys_adaptor.c    | 758 ++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        | 287 ++++++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |  28 +-
 drivers/soc/mediatek/mt8196-mmsys.h           | 447 +++++++++++
 drivers/soc/mediatek/mtk-mmsys.c              | 204 ++++-
 drivers/soc/mediatek/mtk-mmsys.h              |  18 +
 drivers/soc/mediatek/mtk-mutex.c              | 233 +++++-
 include/linux/soc/mediatek/mtk-mmsys.h        |  60 ++
 include/linux/soc/mediatek/mtk-mutex.h        |   2 +
 25 files changed, 3734 insertions(+), 142 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,blender.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,exdma.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,outproc.yaml
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_blender.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_blender.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_exdma.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_outproc.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_outproc.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ovlsys_adaptor.c
 create mode 100644 drivers/soc/mediatek/mt8196-mmsys.h

-- 
2.34.1

