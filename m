Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4436D85B7B0
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 10:37:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A12C10E248;
	Tue, 20 Feb 2024 09:37:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="TOKTE1Z+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D3910E248
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 09:37:21 +0000 (UTC)
X-UUID: a253937ecfd311ee9e680517dc993faa-20240220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Cpm4Z8YcqW1pU8FkfVmKvD7vvfltD+VL86sKjFeu79Q=; 
 b=TOKTE1Z+2mfZmeeF7x8+N/3z++RoqEyuTiMseAGR2zCsHwacViFUIxa4LUqj00sghdFhlE6suWRuh68pefGc9J0MEIcsNfKfSGZg+Z1J9mw/SUeFnwRNA1qqgoLIc6nq3OGYeu9PWAxJly0HfEK1BWMA92tmYaVcAOwb9DGlRHs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:a5cdefed-c24b-4598-99c1-40d00dcb5b7f, IP:0,
 U
 RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:25
X-CID-META: VersionHash:6f543d0, CLOUDID:9461808f-e2c0-40b0-a8fe-7c7e47299109,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: a253937ecfd311ee9e680517dc993faa-20240220
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 233379116; Tue, 20 Feb 2024 17:37:16 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 20 Feb 2024 17:37:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 20 Feb 2024 17:37:12 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Hsiao Chien Sung" <shawn.sung@mediatek.corp-partner.google.com>
Subject: [PATCH v3 0/1] Filter modes according to hardware capability
Date: Tue, 20 Feb 2024 17:37:10 +0800
Message-ID: <20240220093711.20546-1-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.759200-8.000000
X-TMASE-MatchedRID: ATi5SS6xZln8rQJMqxBG8BlckvO1m+JccuFRT+prg4ZGL0g1nVmkYZgC
 Mlq+sZ+fOyZ2mg3CStONpw2JbH/pLNm0JHSAKf2wA9lly13c/gFKPIx+MJF9o5soi2XrUn/J8m+
 hzBStansUGm4zriL0oQtuKBGekqUpnH7sbImOEBSNfc3Pw1BhgWBA1CBIH/I6EO0lIp72XzxQi5
 Kp9S4aVP1xKjgX1cLXC0qYZTpU9PeK4SmSDNGOLF6OHnj3Ynoi2s3WaI3nzqlJmt82E/eyBQGH0
 CAFIQWsmb5gmylW+PbGS+seVPx64j6Qrn3xh/cy
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.759200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 1182ACC9B0C5F753CD224FFF2226C5525ADE82CBFF4FA67B9CCCA626148E760C2000:8
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

This series is based on mediatek-drm-next branch of
kernel/git/chunkuang.hu/linux.git.

Changes in v3:
- Add more information to the comment

Changes in v2:
- Refined the filtering formula
- Add the .mode_valid hook to the hardware that causes the limitation

Hsiao Chien Sung (1):
  drm/mediatek: Filter modes according to hardware capability

 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  4 ++
 drivers/gpu/drm/mediatek/mtk_disp_merge.c     | 65 +++++++++++++++++++
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 17 +++++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c       | 17 +++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |  1 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   | 12 ++++
 6 files changed, 116 insertions(+)

--
2.18.0

