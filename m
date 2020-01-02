Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1F012E534
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2020 11:58:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BFA96E05D;
	Thu,  2 Jan 2020 10:58:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5291A89836
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2020 04:02:17 +0000 (UTC)
X-UUID: 0d51fe1358bb42918202e6427289dd1e-20200102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=7wLu6VmQu6UVnJpXdVr9q3D+QkDfPwKQ1g0hCwiH1Ys=; 
 b=OF+6jTOYqwUOPpGkuq6ORXT6gs8ikO70KJiIOI+FD1Ln9wHuEwZEHXvE7mwPhmGM3XBnk23xLUXuS0rPvCrSpCyeD4b0NoBBGFFNCZ86ok5xbBYt5oju6Nknuy0hUUi2YPQ3EHFIMxrtx5e46lzsWVLaPaHALbi8bjpjNl4RGBo=;
X-UUID: 0d51fe1358bb42918202e6427289dd1e-20200102
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by
 mailgw01.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1752573210; Thu, 02 Jan 2020 12:02:13 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 2 Jan 2020 12:01:43 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 2 Jan 2020 12:01:32 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v6, 00/14] add drm support for MT8183
Date: Thu, 2 Jan 2020 12:00:10 +0800
Message-ID: <1577937624-14313-1-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Thu, 02 Jan 2020 10:58:15 +0000
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

This series are based on 5.5-rc1 and provid 14 patch
to support mediatek SOC MT8183

Change since v5
- fix reviewed issue in v5

Change since v4
- fix reviewed issue in v4

Change since v3
- fix reviewed issue in v3
- fix type error in v3
- fix conflict with iommu patch

Change since v2
- fix reviewed issue in v2
- add mutex node into dts file

Changes since v1:
- fix reviewed issue in v1
- add dts for mt8183 display nodes
- adjust display clock control flow in patch 22
- add vmap support for mediatek drm in patch 23
- fix page offset issue for mmap function in patch 24
- enable allow_fb_modifiers for mediatek drm in patch 25

Yongqiang Niu (14):
  arm64: dts: add display nodes for mt8183
  drm/mediatek: move dsi/dpi select input into mtk_ddp_sel_in
  drm/mediatek: make sout select function  format same with select input
  drm/mediatek: add mmsys private data for ddp path config
  drm/mediatek: move rdma sout from mtk_ddp_mout_en into
    mtk_ddp_sout_sel
  drm/mediatek: add connection from OVL0 to OVL_2L0
  drm/mediatek: add connection from RDMA0 to COLOR0
  drm/mediatek: add connection from RDMA1 to DSI0
  drm/mediatek: add connection from OVL_2L0 to RDMA0
  drm/mediatek: add connection from OVL_2L1 to RDMA1
  drm/mediatek: add connection from DITHER0 to DSI0
  drm/mediatek: add connection from RDMA0 to DSI0
  drm/mediatek: add fifo_size into rdma private data
  drm/mediatek: add support for mediatek SOC MT8183

 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 103 +++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c  |  18 ++
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c |  27 ++-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c  |   4 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c   | 291 +++++++++++++++++++++++--------
 drivers/gpu/drm/mediatek/mtk_drm_ddp.h   |   7 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c   |  51 ++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.h   |   3 +
 8 files changed, 434 insertions(+), 70 deletions(-)

-- 
1.8.1.1.dirty
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
