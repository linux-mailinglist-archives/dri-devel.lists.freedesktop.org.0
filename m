Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B78CF4F5A45
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 11:47:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 621B710F254;
	Wed,  6 Apr 2022 09:47:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B9C10F24B
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 09:47:00 +0000 (UTC)
X-UUID: 0a38c940db9e494ea16a9483d4e7e7f1-20220406
X-UUID: 0a38c940db9e494ea16a9483d4e7e7f1-20220406
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1412427719; Wed, 06 Apr 2022 17:46:56 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Apr 2022 17:46:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 6 Apr 2022 17:46:55 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>
Subject: [PATCH 0/3] Correct disp_aal dt-binding
Date: Wed, 6 Apr 2022 17:46:51 +0800
Message-ID: <20220406094654.29722-1-rex-bc.chen@mediatek.com>
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
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, nancy.lin@mediatek.com,
 linux-mediatek@lists.infradead.org, yongqiang.niu@mediatek.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 allen-kh.cheng@mediatek.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are several dt-binding error for MT8183 and MT8192. Therefore,
we send this series to correct them.
1. Correct dt-binding and dts for MT8183.
2. Correct dt-binding for MT8192.

This series is based on this series:
"add display support for MediaTek SoC MT8186":
Message id: 20220406030009.2357-1-rex-bc.chen@mediatek.com

Rex-BC Chen (3):
  dt-bindings: display: mediatek: Correct disp_aal binding for MT8183
  arm64: dts: mt8183: Correct disp_aal node compatible
  dt-bindings: display: mediatek: Correct disp_aal binding for MT8192

 .../bindings/display/mediatek/mediatek,aal.yaml           | 8 ++++----
 arch/arm64/boot/dts/mediatek/mt8183.dtsi                  | 3 +--
 2 files changed, 5 insertions(+), 6 deletions(-)

-- 
2.18.0

