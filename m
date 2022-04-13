Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F1C4FED0A
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 04:37:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2178610E085;
	Wed, 13 Apr 2022 02:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE1CB10E085
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 02:37:33 +0000 (UTC)
X-UUID: b1cc66f9661c4a38b6abc7ea4038c5bd-20220413
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:045e66ee-4df1-4318-b48f-f754670b460f, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:95,FILE:0,RULE:Release_Ham,A
 CTION:release,TS:75
X-CID-INFO: VERSION:1.1.4, REQID:045e66ee-4df1-4318-b48f-f754670b460f, OB:0,
 LOB:
 0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:95,FILE:0,RULE:Spam_GS981B3D,A
 CTION:quarantine,TS:75
X-CID-META: VersionHash:faefae9, CLOUDID:b4b7f5a8-d103-4e36-82b9-b0e86991b3df,
 C
 OID:460889320a0c,Recheck:0,SF:13|15|28|17|19|48,TC:nil,Content:0,EDM:-3,Fi
 le:nil,QS:0,BEC:nil
X-UUID: b1cc66f9661c4a38b6abc7ea4038c5bd-20220413
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 772270675; Wed, 13 Apr 2022 10:37:26 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 13 Apr 2022 10:37:24 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 13 Apr 2022 10:37:21 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, Hans
 Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Subject: [PATCH v2, 0/3] add h264 decoder driver for mt8186
Date: Wed, 13 Apr 2022 10:37:17 +0800
Message-ID: <20220413023720.29297-1-yunfei.dong@mediatek.com>
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
 Steve Cho <stevecho@chromium.org>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Firstly, add mt8186 compatible and private data, then add document for
compatible "mediatek,mt8186-vcodec-dec". For mt8186 is single core
architecture, need to add new interface for h264 hardware decoder.

Patche 1 add mt8186 compatible and private data.
Patche 2 add mt8186 compatible document.
Patche 3 add h264 single core driver.
---
This patch depends on "support for MT8192 decoder"[1]

[1]  https://patchwork.kernel.org/project/linux-mediatek/cover/20220408120240.29571-1-yunfei.dong@mediatek.com/
---
changed with v1:
- rebase driver to the latest media_stage.
---
Yunfei Dong (3):
  dt-bindings: media: mediatek: vcodec: Adds decoder dt-bindings for
    mt8186
  media: mediatek: vcodec: Support MT8186
  media: mediatek: vcodec: add h264 decoder driver for mt8186

 .../media/mediatek,vcodec-subdev-decoder.yaml |   4 +-
 .../platform/mediatek/vcodec/mtk_vcodec_dec.h |   1 +
 .../mediatek/vcodec/mtk_vcodec_dec_drv.c      |   4 +
 .../vcodec/mtk_vcodec_dec_stateless.c         |  19 ++
 .../vcodec/vdec/vdec_h264_req_multi_if.c      | 177 +++++++++++++++++-
 5 files changed, 203 insertions(+), 2 deletions(-)

-- 
2.18.0

