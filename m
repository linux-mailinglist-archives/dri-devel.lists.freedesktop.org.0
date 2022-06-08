Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B952954212E
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 06:39:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC15710E191;
	Wed,  8 Jun 2022 04:39:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A21A10E00F
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 04:39:00 +0000 (UTC)
X-UUID: daceccb019b247a690ad129ba33eff11-20220608
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:98355afb-0358-4d0c-9b74-6bb74d069b0c, OB:10,
 L
 OB:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,RULE:Release_Ham,A
 CTION:release,TS:90
X-CID-INFO: VERSION:1.1.5, REQID:98355afb-0358-4d0c-9b74-6bb74d069b0c, OB:10,
 LOB
 :0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,RULE:Spam_GS981B3D,A
 CTION:quarantine,TS:90
X-CID-META: VersionHash:2a19b09, CLOUDID:69a0947e-c8dc-403a-96e8-6237210dceee,
 C
 OID:1047e9c84de5,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,QS:0,BEC:nil
X-UUID: daceccb019b247a690ad129ba33eff11-20220608
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1353079219; Wed, 08 Jun 2022 12:38:56 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 8 Jun 2022 12:38:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 8 Jun 2022 12:38:54 +0800
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <robh+dt@kernel.org>, 
 <krzysztof.kozlowski+dt@linaro.org>
Subject: [RESEND v5 0/3] MediaTek MT8195 display binding
Date: Wed, 8 Jun 2022 12:38:49 +0800
Message-ID: <20220608043852.4980-1-rex-bc.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Bo-Chen Chen <rex-bc.chen@mediatek.com>,
 airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, nancy.lin@mediatek.com,
 linux-mediatek@lists.infradead.org, pavel@ucw.cz, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add this series to present MediaTek display binding for MT8195.
The reason I send this series is Jason and Nancy's binding patches are
never received by devicetree mail server.
Therefore, I help them to resend binding patches.

Changes for resend v5:
1. Fix binding check error in [1/3] and [3/3].
2. v5 is not received by devicetree mail server, so I resend them.

Changes for resend v4:
1. Rebase to v5.19-rc1 which iommu series is included.
2. Add my signed-off.
3. v4 is not received by devicetree mail server, add more cc and resend.
4. This patch is from Nancy's v22 series:[2].

[2]: https://patchwork.kernel.org/project/linux-mediatek/list/?series=645240

Changes for v3:
1. Fix rdma and ethdr binding doc.
2. Nancy's series: [1].
3. This series is based on linux-next: next-20220511.

Changes for v2:
1. This patch is based on linux next-20220506.
2. Jason's patches are accepted and I drop them.

[1]: https://lore.kernel.org/all/20220512053128.31415-1-nancy.lin@mediatek.com/

Nancy.Lin (3):
  dt-bindings: mediatek: add vdosys1 RDMA definition for mt8195
  dt-bindings: reset: mt8195: add vdosys1 reset control bit
  dt-bindings: mediatek: add ethdr definition for mt8195

 .../display/mediatek/mediatek,ethdr.yaml      | 188 ++++++++++++++++++
 .../display/mediatek/mediatek,mdp-rdma.yaml   |  88 ++++++++
 include/dt-bindings/reset/mt8195-resets.h     |  45 +++++
 3 files changed, 321 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml

-- 
2.18.0

