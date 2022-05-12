Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5013052439E
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 05:46:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D10610ECFD;
	Thu, 12 May 2022 03:46:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B7F410EC83
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 03:46:31 +0000 (UTC)
X-UUID: b63919b42fed420e9c97fc87154d63e6-20220512
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:7b832b96-4761-4c43-85e2-02194e1f61f8, OB:0,
 LO
 B:30,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:95,FILE:0,RULE:Release_Ham,
 ACTION:release,TS:75
X-CID-INFO: VERSION:1.1.4, REQID:7b832b96-4761-4c43-85e2-02194e1f61f8, OB:0,
 LOB:
 30,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:95,FILE:0,RULE:Spam_GS981B3D,
 ACTION:quarantine,TS:75
X-CID-META: VersionHash:faefae9, CLOUDID:0f1a24f6-13a6-4067-b017-3b2864319134,
 C
 OID:485a8ad21be1,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,File:nil
 ,QS:0,BEC:nil
X-UUID: b63919b42fed420e9c97fc87154d63e6-20220512
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1429110879; Thu, 12 May 2022 11:46:27 +0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 12 May 2022 11:46:26 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 May 2022 11:46:25 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 12 May 2022 11:46:24 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, "Hans
 Verkuil" <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Subject: [PATCH v4, 2/3] media: mediatek: vcodec: Support MT8186
Date: Thu, 12 May 2022 11:46:19 +0800
Message-ID: <20220512034620.30500-3-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220512034620.30500-1-yunfei.dong@mediatek.com>
References: <20220512034620.30500-1-yunfei.dong@mediatek.com>
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

Adds MT8186's compatible "mediatek,mt8186-vcodec-dec".
Adds MT8186's device private data mtk_vdec_single_core_pdata.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../platform/mediatek/vcodec/mtk_vcodec_dec.h |  1 +
 .../mediatek/vcodec/mtk_vcodec_dec_drv.c      |  4 ++++
 .../vcodec/mtk_vcodec_dec_stateless.c         | 19 +++++++++++++++++++
 3 files changed, 24 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.h b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.h
index 66cd6d2242c3..4572f92826f2 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.h
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.h
@@ -69,6 +69,7 @@ extern const struct media_device_ops mtk_vcodec_media_ops;
 extern const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata;
 extern const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata;
 extern const struct mtk_vcodec_dec_pdata mtk_lat_sig_core_pdata;
+extern const struct mtk_vcodec_dec_pdata mtk_vdec_single_core_pdata;
 
 
 /*
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
index 5da4572c5b14..b417a6ab2176 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
@@ -458,6 +458,10 @@ static const struct of_device_id mtk_vcodec_match[] = {
 		.compatible = "mediatek,mt8192-vcodec-dec",
 		.data = &mtk_lat_sig_core_pdata,
 	},
+	{
+		.compatible = "mediatek,mt8186-vcodec-dec",
+		.data = &mtk_vdec_single_core_pdata,
+	},
 	{},
 };
 
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
index f1a77f0a8a81..16d55785d84b 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
@@ -491,3 +491,22 @@ const struct mtk_vcodec_dec_pdata mtk_lat_sig_core_pdata = {
 	.is_subdev_supported = true,
 	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
 };
+
+const struct mtk_vcodec_dec_pdata mtk_vdec_single_core_pdata = {
+	.init_vdec_params = mtk_init_vdec_params,
+	.ctrls_setup = mtk_vcodec_dec_ctrls_setup,
+	.vdec_vb2_ops = &mtk_vdec_request_vb2_ops,
+	.vdec_formats = mtk_video_formats,
+	.num_formats = &num_formats,
+	.default_out_fmt = &default_out_format,
+	.default_cap_fmt = &default_cap_format,
+	.vdec_framesizes = mtk_vdec_framesizes,
+	.num_framesizes = &num_framesizes,
+	.uses_stateless_api = true,
+	.worker = mtk_vdec_worker,
+	.flush_decoder = mtk_vdec_flush_decoder,
+	.cap_to_disp = mtk_vdec_stateless_cap_to_disp,
+	.get_cap_buffer = vdec_get_cap_buffer,
+	.is_subdev_supported = true,
+	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
+};
-- 
2.18.0

