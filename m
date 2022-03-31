Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 626F74ED1E3
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 04:48:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC53410F3B2;
	Thu, 31 Mar 2022 02:48:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B9A10F3B0
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 02:48:48 +0000 (UTC)
X-UUID: a6eabd5f6c944e25b048385f9a559ffd-20220331
X-UUID: a6eabd5f6c944e25b048385f9a559ffd-20220331
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 344175455; Thu, 31 Mar 2022 10:48:44 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 31 Mar 2022 10:48:42 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 31 Mar 2022 10:48:40 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, Hans
 Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Subject: [PATCH v8, 09/17] media: mediatek: vcodec: Add format to support MT21C
Date: Thu, 31 Mar 2022 10:47:53 +0800
Message-ID: <20220331024801.29229-10-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331024801.29229-1-yunfei.dong@mediatek.com>
References: <20220331024801.29229-1-yunfei.dong@mediatek.com>
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
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Steve Cho <stevecho@chromium.org>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Needs to use mediatek compressed mode for mt8192 decoder.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c    | 7 ++++++-
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h    | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
index 4904aa890cf4..ef67a9606625 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
@@ -81,7 +81,7 @@ static const struct mtk_stateless_control mtk_stateless_controls[] = {
 
 #define NUM_CTRLS ARRAY_SIZE(mtk_stateless_controls)
 
-static struct mtk_video_fmt mtk_video_formats[2];
+static struct mtk_video_fmt mtk_video_formats[3];
 static struct mtk_codec_framesizes mtk_vdec_framesizes[1];
 
 static struct mtk_video_fmt default_out_format;
@@ -331,6 +331,7 @@ static void mtk_vcodec_add_formats(unsigned int fourcc,
 		num_framesizes++;
 		break;
 	case V4L2_PIX_FMT_MM21:
+	case V4L2_PIX_FMT_MT21C:
 		mtk_video_formats[count_formats].fourcc = fourcc;
 		mtk_video_formats[count_formats].type = MTK_FMT_FRAME;
 		mtk_video_formats[count_formats].num_planes = 2;
@@ -356,6 +357,10 @@ static void mtk_vcodec_get_supported_formats(struct mtk_vcodec_ctx *ctx)
 		mtk_vcodec_add_formats(V4L2_PIX_FMT_MM21, ctx);
 		cap_format_count++;
 	}
+	if (ctx->dev->dec_capability & MTK_VDEC_FORMAT_MT21C) {
+		mtk_vcodec_add_formats(V4L2_PIX_FMT_MT21C, ctx);
+		cap_format_count++;
+	}
 	if (ctx->dev->dec_capability & MTK_VDEC_FORMAT_H264_SLICE) {
 		mtk_vcodec_add_formats(V4L2_PIX_FMT_H264_SLICE, ctx);
 		out_format_count++;
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
index d74a9e0e74fe..75a1c6df6594 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
@@ -350,6 +350,7 @@ enum mtk_vdec_hw_arch {
  */
 enum mtk_vdec_format_types {
 	MTK_VDEC_FORMAT_MM21 = 0x20,
+	MTK_VDEC_FORMAT_MT21C = 0x40,
 	MTK_VDEC_FORMAT_H264_SLICE = 0x100,
 };
 
-- 
2.18.0

