Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCAD987EAF
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 08:51:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D271910EC28;
	Fri, 27 Sep 2024 06:50:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="t7qU4SGE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41EED10E1D6
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 06:50:52 +0000 (UTC)
X-UUID: d29c078e7c9c11ef8b96093e013ec31c-20240927
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=o9viVYcO8aNN6w4qtlrLEQocIgbO7sam0vRHSWJsSzE=; 
 b=t7qU4SGEfjjpgWT0CrHFZUl7oaACV1o24xDN5yhdKSm58lGjBgq8pY54rr2FEdcdr7dsZC20+MRANKX9KxeBoW1q0VswCwdJyN2f2BLg9MKomJiDQzgxXQb3ZW8ePnQtwm/4ceDonOLhSW4bqDP1zKGfhlSQI278Tk+mQalVjXk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:eef88275-e92f-4fa7-9eda-06ff21cd2ad1, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6dc6a47, CLOUDID:d9c1a69e-8e9a-4ac1-b510-390a86b53c0a,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d29c078e7c9c11ef8b96093e013ec31c-20240927
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw02.mediatek.com (envelope-from <macpaul.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1396667911; Fri, 27 Sep 2024 14:50:46 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 27 Sep 2024 14:50:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 27 Sep 2024 14:50:43 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yong Wu <yong.wu@mediatek.com>, "Joerg
 Roedel" <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK Hu
 <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>, Tinghan Shen
 <tinghan.shen@mediatek.com>, Seiya Wang <seiya.wang@mediatek.com>, Ben Lok
 <ben.lok@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, "Nancy . Lin"
 <nancy.lin@mediatek.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, Alexandre Mergnat
 <amergnat@baylibre.com>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, Sen Chu <sen.chu@mediatek.com>, "Chris-qj
 chen" <chris-qj.chen@mediatek.com>, MediaTek Chromebook Upstream
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai
 <wenst@chromium.org>
Subject: [PATCH v3 3/5] arm64: dts: mediatek: mt8395-genio-1200-evk: Fix
 dtbs_check error for phy
Date: Fri, 27 Sep 2024 14:50:39 +0800
Message-ID: <20240927065041.15247-3-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240927065041.15247-1-macpaul.lin@mediatek.com>
References: <20240927065041.15247-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.841900-8.000000
X-TMASE-MatchedRID: zCWA9GkRdEXwBTQ+XvV6VZdc7I2df+ms2D9FbDg9BP7HkH7uosEn7E/3
 ZkXeY1OAsdosXJJWMVwSc9Me4enxyKXzgcphDfm8i/b+LxU2p47Dx2NobQWtm3td2pOTSxFkZvo
 +mFW19mDftLFtxOSbQ4Ay6p60ZV62fJ5/bZ6npdjGVuWouVipcjAGbKlbRjKT1oeFEpXgY4R2cs
 iM2ZNrXCkQwQp8jWDV1FmTk6ph5l9KExYgiTytN6BnGq9kNZm0dvYOSQ2POAuEeo2QbLGzt21Rj
 oup2VCcWve+eVz4Pp5Vk5utmQ1VlGVF3+d9rnoxpI8EFEZVbig=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.841900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 72096D519EB39C5F442D061C47D1581668AC1771DA1106EA6093E5F78DFE193A2000:8
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

The ethernet-phy node in mt8395-genio-1200-evk.dts was triggering a
dtbs_check error. The error message was:
  eth-phy0@1: $nodename:0: 'eth-phy0@1' does not match
              '^ethernet-phy(@[a-f0-9]+)?$'
Fix this issue by replacing 'eth-phy' node to generic 'ethernet-phy'.

Fixes: f2b543a191b6 ("arm64: dts: mediatek: add device-tree for Genio 1200 EVK board")
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Changes for v2 and v3:
 - No change.

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
index 1ef6262b65c9..b4b48eb93f3c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
@@ -187,7 +187,7 @@ mdio {
 		compatible = "snps,dwmac-mdio";
 		#address-cells = <1>;
 		#size-cells = <0>;
-		eth_phy0: eth-phy0@1 {
+		eth_phy0: ethernet-phy@1 {
 			compatible = "ethernet-phy-id001c.c916";
 			reg = <0x1>;
 		};
-- 
2.45.2

