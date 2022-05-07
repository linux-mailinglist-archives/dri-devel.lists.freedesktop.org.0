Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7070451E33A
	for <lists+dri-devel@lfdr.de>; Sat,  7 May 2022 03:46:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE43D10F104;
	Sat,  7 May 2022 01:46:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ED2D10F104
 for <dri-devel@lists.freedesktop.org>; Sat,  7 May 2022 01:46:26 +0000 (UTC)
X-UUID: 8c2ba08f507041d78aad3b5c406289b3-20220507
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:80f0a7e4-7342-4102-9184-b76a07c54bf8, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:b4dde4b2-56b5-4c9e-8d83-0070b288eb6a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 8c2ba08f507041d78aad3b5c406289b3-20220507
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 162061621; Sat, 07 May 2022 09:46:22 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Sat, 7 May 2022 09:46:20 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Sat, 7 May 2022 09:46:18 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, "Hans
 Verkuil" <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Subject: [PATCH v5, 0/7] support mt8195 decoder
Date: Sat, 7 May 2022 09:46:11 +0800
Message-ID: <20220507014618.29412-1-yunfei.dong@mediatek.com>
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

[1]  https://patchwork.kernel.org/project/linux-mediatek/cover/20220507013625.29020-1-yunfei.dong@mediatek.com/
---
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
 .../platform/mediatek/vcodec/mtk_vcodec_drv.h | 11 ++++
 .../vcodec/vdec/vdec_h264_req_multi_if.c      | 29 ++++++++---
 .../platform/mediatek/vcodec/vdec_vpu_if.c    |  5 ++
 9 files changed, 183 insertions(+), 27 deletions(-)

-- 
2.18.0

