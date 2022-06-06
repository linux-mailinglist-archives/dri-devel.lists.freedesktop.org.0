Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0B053E0A1
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 07:11:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9F5F1125A4;
	Mon,  6 Jun 2022 05:11:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E47CC11259C
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 05:11:37 +0000 (UTC)
X-UUID: b90dc76aab8445e0975b15471b83c89f-20220606
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:646d8357-28e2-4d69-8057-c6a9539acc69, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:47,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:42
X-CID-INFO: VERSION:1.1.5, REQID:646d8357-28e2-4d69-8057-c6a9539acc69, OB:0,
 LOB:
 0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:47,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:42
X-CID-META: VersionHash:2a19b09, CLOUDID:ecca447e-c8dc-403a-96e8-6237210dceee,
 C
 OID:d1a002376914,Recheck:0,SF:28|100|17|19|48|101,TC:nil,Content:0,EDM:-3,
 IP:nil,URL:1,File:nil,QS:0,BEC:nil
X-UUID: b90dc76aab8445e0975b15471b83c89f-20220606
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1777165115; Mon, 06 Jun 2022 13:11:34 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Mon, 6 Jun 2022 13:11:32 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Mon, 6 Jun 2022 13:11:32 +0800
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <robh+dt@kernel.org>, 
 <krzysztof.kozlowski+dt@linaro.org>
Subject: [RESEND v4 0/3] MediaTek MT8195 display binding
Date: Mon, 6 Jun 2022 13:11:28 +0800
Message-ID: <20220606051131.14182-1-rex-bc.chen@mediatek.com>
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

