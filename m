Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED16732904
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 09:36:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93BF710E5BD;
	Fri, 16 Jun 2023 07:36:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7338F10E5BD
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 07:36:45 +0000 (UTC)
X-UUID: 87d962fa0c1811eeb20a276fd37b9834-20230616
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=T/mv5xRYC/u5WsUdo5O1+4NEiWJdjNNIXtIaO0oOIpI=; 
 b=NcNB2MIwRuuLOdgEhDqgadZWV5rN7D1jewFIBDTg40VEvQdSNPRLaI8aiPetUCR8w8HyxJ3c7hhhy5z9182L6IVU8ftWmpBfxoT333gX0lW6me6qRedgr5BXa+4uSdzyEufs2s0+B4PXzbzcOtq3imczNxtKOgPbt949xB6RAzY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.26, REQID:673f7cdb-11ba-4982-920f-bf4288710805, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:95
X-CID-INFO: VERSION:1.1.26, REQID:673f7cdb-11ba-4982-920f-bf4288710805, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
 :quarantine,TS:95
X-CID-META: VersionHash:cb9a4e1, CLOUDID:085da13e-de1e-4348-bc35-c96f92f1dcbb,
 B
 ulkID:2306161536416IGF0HCR,BulkQuantity:0,Recheck:0,SF:38|29|28|17|19|48,T
 C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
 ,OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR, TF_CID_SPAM_SDM, TF_CID_SPAM_ASC,
 TF_CID_SPAM_FAS, TF_CID_SPAM_FSD
X-UUID: 87d962fa0c1811eeb20a276fd37b9834-20230616
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <shuijing.li@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 725115000; Fri, 16 Jun 2023 15:36:39 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 16 Jun 2023 15:36:38 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 16 Jun 2023 15:36:37 +0800
From: Shuijing Li <shuijing.li@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>, 
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>
Subject: [PATCH v2,0/3] Add mt8188 compatiable for DSI cmd packet control
Date: Fri, 16 Jun 2023 15:36:56 +0800
Message-ID: <20230616073659.26536-1-shuijing.li@mediatek.com>
X-Mailer: git-send-email 2.40.1
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
Cc: devicetree@vger.kernel.org, jitao.shi@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Shuijing Li <shuijing.li@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add dt-binding documentation of DSI for MediaTek MT8188 SoC.
Because of the difference between SOC and DSI cmd packet control, for
MT8188, it is necessary to increase the DSI_CMDQ_SIZE control when
sending long packets to initialize the panel. Of course, this will not
affect the sending of short packets.

Base on the branch of linus/master v6.4.

Shuijing Li (3):
  dt-bindings: display: mediatek: dsi: Add compatible for MediaTek
    MT8188
  drm/mediatek: Add mt8188 dsi compatible to mtk_dsi.c
  drm/mediatek: dsi: Add dsi cmdq_ctl to send panel initial code

 .../bindings/display/mediatek/mediatek,dsi.yaml   |  1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c            |  2 ++
 drivers/gpu/drm/mediatek/mtk_dsi.c                | 15 +++++++++++++++
 3 files changed, 18 insertions(+)

-- 
2.40.1

