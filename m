Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB982525EAE
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 11:25:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8069810F70F;
	Fri, 13 May 2022 09:25:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7708A10F70F
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 09:25:35 +0000 (UTC)
X-UUID: 6bada44bb66542f2bb8134204929bfc5-20220513
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:83ad1d57-ae0f-4dfc-8eeb-64bf0eea7f5d, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:-5
X-CID-META: VersionHash:2a19b09, CLOUDID:11891cf2-ab23-4aed-a67b-f96514452486,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: 6bada44bb66542f2bb8134204929bfc5-20220513
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 899157921; Fri, 13 May 2022 17:25:29 +0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 13 May 2022 17:25:28 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 13 May 2022 17:25:28 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 13 May 2022 17:25:26 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, "Hans
 Verkuil" <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Subject: [PATCH v6, 0/7] support mt8195 decoder
Date: Fri, 13 May 2022 17:25:19 +0800
Message-ID: <20220513092526.9670-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 Steve Cho <stevecho@chromium.org>, devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Firstly, add mt8195 soc lat hardware and compatible, then add documents.
For vp8 only support MM21 mode, H264/vp9 support MT21C, need to separate
them. Lastly, enable H264 inner racing mode to reduce hardware latency.

Patch 1~4 add mt8195 soc lat hardware and compatible, then add documents.
Patch 5 using different format for different codecs.
Patch 6 prevent kernel crash when scp reboot.
Patch 7 enable H264 inner racing mode to reduce hardware latency.
---
This patch depends on "add h264 decoder driver for mt8186"[1]

[1]  https://patchwork.kernel.org/project/linux-mediatek/cover/20220512034620.30500-1-yunfei.dong@mediatek.com/
---
changed with v5:
- fix __iomem not reasonable, align share memory to dram.
changed with v4:
- fix sparse and smatch check fail for patch 7.
changed with v3:
- rebase driver to the latest media_stage.
changed with v2:
- add detail explanation for lat soc hardware for patch 1.
changed with v1:
- separate "Init VP9 stateless decode params" patch and remove it to another one.
- add reviewed-by in patch v3/v4/v6
---
Yunfei Dong (7):
  dt-bindings: media: mediatek: vcodec: Adds decoder dt-bindings for lat
    soc
  media: mediatek: vcodec: Add to support lat soc hardware
  dt-bindings: media: mediatek: vcodec: Adds decoder dt-bindings for
    mt8195
  media: mediatek: vcodec: Adds compatible for mt8195
  media: mediatek: vcodec: Different codec using different capture
    format
  media: mediatek: vcodec: prevent kernel crash when scp ipi timeout
  media: mediatek: vcodec: Add to support H264 inner racing mode

 .../media/mediatek,vcodec-subdev-decoder.yaml | 52 +++++++++++++------
 .../platform/mediatek/vcodec/mtk_vcodec_dec.c | 41 +++++++++++++++
 .../mediatek/vcodec/mtk_vcodec_dec_drv.c      |  8 +++
 .../mediatek/vcodec/mtk_vcodec_dec_hw.c       | 12 +++--
 .../mediatek/vcodec/mtk_vcodec_dec_hw.h       |  2 +
 .../mediatek/vcodec/mtk_vcodec_dec_pm.c       | 50 ++++++++++++++++++
 .../platform/mediatek/vcodec/mtk_vcodec_drv.h | 12 +++++
 .../vcodec/vdec/vdec_h264_req_multi_if.c      | 25 +++++++--
 .../platform/mediatek/vcodec/vdec_vpu_if.c    |  5 ++
 9 files changed, 183 insertions(+), 24 deletions(-)

-- 
2.18.0

