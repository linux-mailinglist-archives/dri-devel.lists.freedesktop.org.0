Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB94724AFFB
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 09:17:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E35C6E913;
	Thu, 20 Aug 2020 07:16:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 23C7D6E8A9
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 06:05:38 +0000 (UTC)
X-UUID: c578b6ffd56c483897870cd1f398118c-20200820
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=eMCqHf5VNCtvq/O+QRSOEtg5Xwd+1FDGSGsrpAcq+Zw=; 
 b=s+HZOyODiPZPySgERpgDUer2qNTepI6ICLm5Z1pTLUn6/+ykrk9iNJ9QOF8e17bWEjr006pIIZr/63sTEMcm2dNsINtuFzvQ13v1XJuG7bS8YeLMWOU5F+PWRUlna/n5qe0ctttUEe2pY1riFIFE0FgkxxZvJ8908xfrtO5578Q=;
X-UUID: c578b6ffd56c483897870cd1f398118c-20200820
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1576741474; Thu, 20 Aug 2020 14:05:33 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 Aug 2020 14:05:31 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 20 Aug 2020 14:05:30 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v1 00/21] add drm support for MT8192
Date: Thu, 20 Aug 2020 14:03:57 +0800
Message-ID: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Thu, 20 Aug 2020 07:14:47 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changes in v1:
- add some more ddp component
- add mt8192 mmsys support
- add ovl mount on support
- add 2 more clock into mutex device
- fix ovl smi_id_en and fb null software bug
- fix ddp compoent size config bug
- add mt8192 drm support
- add ddp bypass shadow register function
- add 8192 dts description

Yongqiang Niu (21):
  drm/mediatek: add component OVL_2L2
  drm/mediatek: add component POSTMASK
  drm/mediatek: add component RDMA4
  mtk-mmsys: add mt8192 mmsys support
  mtk-mmsys: add ovl mout on  support
  drm/mediatek: add disp config and mm 26mhz clock into mutex device
  drm/mediatek: enable OVL_LAYER_SMI_ID_EN for multi-layer usecase
  drm/mediatek: check if fb is null
  drm/mediatek: fix aal size config
  drm/mediatek: fix dither size config
  drm/mediatek: fix gamma size config
  drm/mediatek: fix ccorr size config
  drm/mediatek: add support for mediatek SOC MT8192
  drm/mediatek: add bypass shadow register function call for ddp
    component
  drm/mediatek: add color bypass shadow register function
  drm/mediatek: add ovl bypass shadow register function
  drm/mediatek: add rdma bypass shadow register function
  drm/mediatek: add dither bypass shadow register function
  drm/mediatek: add aal bypass shadow register function
  drm/mediatek: add ccorr bypass shadow register function
  arm64: dts: mt8192: add display node

 arch/arm64/boot/dts/mediatek/mt8192.dtsi    | 126 +++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_color.c   |  22 ++++
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     |  41 ++++++-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c    |  27 +++++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |   3 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c      |  84 +++++++++++--
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  80 +++++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   8 ++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  48 ++++++++
 drivers/soc/mediatek/mmsys/Makefile         |   1 +
 drivers/soc/mediatek/mmsys/mt8192-mmsys.c   | 182 ++++++++++++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c            |   8 ++
 include/linux/soc/mediatek/mtk-mmsys.h      |   6 +
 13 files changed, 623 insertions(+), 13 deletions(-)
 create mode 100644 drivers/soc/mediatek/mmsys/mt8192-mmsys.c

-- 
1.8.1.1.dirty
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
