Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F20B4FB278
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 05:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8FAD10E924;
	Mon, 11 Apr 2022 03:58:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C70E910E924
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 03:58:50 +0000 (UTC)
X-UUID: 8557a3c71ad94995b451f8c39d3f439b-20220411
X-UUID: 8557a3c71ad94995b451f8c39d3f439b-20220411
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1549471564; Mon, 11 Apr 2022 11:58:45 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 11 Apr 2022 11:58:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 11 Apr 2022 11:58:44 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>,
 <matthias.bgg@gmail.com>
Subject: [PATCH V2 0/3] Update MediaTek disp_aal dt-binding
Date: Mon, 11 Apr 2022 11:58:40 +0800
Message-ID: <20220411035843.19847-1-rex-bc.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, jason-jh.lin@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, nancy.lin@mediatek.com,
 linux-mediatek@lists.infradead.org, yongqiang.niu@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 allen-kh.cheng@mediatek.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2:
1. Change to a proper subject.
2. Update dt-binding for MT8195.

The disp_aal dt-binding needs to be updated for MT8183, MT8192 and MT8195.
1. Update dt-binding and dts for MT8183.
2. Update dt-binding for MT8192 and MT8195.

This series is based on this series:
"add display support for MediaTek SoC MT8186":
Message id: 20220406030009.2357-1-rex-bc.chen@mediatek.com

Rex-BC Chen (3):
  dt-bindings: display: mediatek: Update disp_aal binding for MT8183
  arm64: dts: mt8183: Update disp_aal node compatible
  dt-bindings: display: mediatek: Update disp_aal binding for MT8192 and MT8195

 .../bindings/display/mediatek/mediatek,aal.yaml        | 10 +++++-----
 arch/arm64/boot/dts/mediatek/mt8183.dtsi               |  3 +--
 2 files changed, 6 insertions(+), 7 deletions(-)

-- 
2.18.0

