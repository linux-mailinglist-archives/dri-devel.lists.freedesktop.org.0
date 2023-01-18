Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDF9671748
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 10:18:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9231D10E210;
	Wed, 18 Jan 2023 09:18:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 943E610E1F5
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 09:18:37 +0000 (UTC)
X-UUID: 139659e2971111ed945fc101203acc17-20230118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=uWVRgR/ln+/38QVR0gXqYzqLESpxkY2yEXnYWdBeJ4A=; 
 b=sOnXAnoVHKQl6QPF4kN20ZgBH5YEhb3sJ4G3bY7qkP9dg/X3DsRcbts+qKZ2rOLse1OEGuHqyivZo8JMmw1jkelmD1qb5EvTvxEqbU21VdDuX+U4/zO43ga833w7ZwsXmb5ledYDLAhf7MyH1d5swmvV28lopyJIEXyJPXxhC80=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18, REQID:92713461-2396-4aca-ae49-57b9335c8682, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:3ca2d6b, CLOUDID:ac1a2af6-ff42-4fb0-b929-626456a83c14,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 139659e2971111ed945fc101203acc17-20230118
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <allen-kh.cheng@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1935262506; Wed, 18 Jan 2023 17:18:31 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 18 Jan 2023 17:18:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 18 Jan 2023 17:18:30 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 0/9] Add and update some driver nodes for MT8186 SoC
Date: Wed, 18 Jan 2023 17:18:20 +0800
Message-ID: <20230118091829.755-1-allen-kh.cheng@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series is based on matthias github, for-next.

Changes since v1:
 - Remove the unnecessary trailing number
 - Add aliases for ovl* and rdma*

Allen-KH Cheng (9):
  arm64: dts: mediatek: mt8186: Add MTU3 nodes
  dt-bindings: spmi: spmi-mtk-pmif: Document mediatek,mt8195-spmi as
    fallback of mediatek,mt8186-spmi
  arm64: dts: mediatek: mt8186: Add SPMI node
  arm64: dts: mediatek: mt8186: Add ADSP mailbox nodes
  arm64: dts: mediatek: mt8186: Add ADSP node
  arm64: dts: mediatek: mt8186: Add audio controller node
  arm64: dts: mediatek: mt8186: Add DPI node
  dt-bindings: display: mediatek: Fix the fallback for
    mediatek,mt8186-disp-ccorr
  arm64: dts: mediatek: mt8186: Add display nodes

 .../display/mediatek/mediatek,ccorr.yaml      |   2 +-
 .../bindings/spmi/mtk,spmi-mtk-pmif.yaml      |  11 +-
 arch/arm64/boot/dts/mediatek/mt8186.dtsi      | 342 ++++++++++++++++++
 3 files changed, 351 insertions(+), 4 deletions(-)

-- 
2.18.0

