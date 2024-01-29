Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFC583FE6E
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 07:31:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FBCD10E0A1;
	Mon, 29 Jan 2024 06:31:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 633C31124C3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 06:31:05 +0000 (UTC)
X-UUID: f6451cfcbe6f11eea2298b7352fd921d-20240129
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=RIQoT27GcYuuJ+QhfUoHjqOEFRPYloQJzRhu1bfSFyk=; 
 b=RBt2SaF43ekmbOxBB5pVQBCiupegyT8L1GQTa7sXa68eyIOLOjaQe4fxQGhDU1WIONcMczBLnmMMl8N3w/XR3+9LSgoBESKBUMWos6v2bMczGsSDo5PWHkcTXG3/xB0+l33SURo6RGcLnN6O0Fg8UZj+6Ps1tfj1UFJnICVDfGM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.36, REQID:5e8cd2b6-4756-43c9-9a50-e2e15ea17989, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:6e16cf4, CLOUDID:9aa95c83-8d4f-477b-89d2-1e3bdbef96d1,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f6451cfcbe6f11eea2298b7352fd921d-20240129
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 111755880; Mon, 29 Jan 2024 14:30:57 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 29 Jan 2024 14:30:56 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 29 Jan 2024 14:30:54 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Jeffrey Kardatzke <jkardatzke@google.com>,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>
Subject: [PATCH v4,15/22] media: mediatek: vcodec: Add one plane format
Date: Mon, 29 Jan 2024 14:30:18 +0800
Message-ID: <20240129063025.29251-16-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240129063025.29251-1-yunfei.dong@mediatek.com>
References: <20240129063025.29251-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--6.687000-8.000000
X-TMASE-MatchedRID: SJCrnFkDoFv1f6EBkUtKacu00lnG8+PWqQ9UezeTkThjHFhWIf8DgWb6
 PphVtfZg1Bh8AQwURElq7k1NHAqvK9pkOfaFflnAdXu122+iJtqH7D1bP/FcOvHFoBcOsKezcam
 vz988laL3cuxjGnQlwIAy6p60ZV62SwOSQ/fMiOrdB/CxWTRRu25FeHtsUoHuAcFKPL0sGcRPy5
 a1EU1tr466zVpODusNRGNNTyZV6iJoBmTSwRxjXg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--6.687000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 69ADA67086B33733C482C43682C906382C2EE46B253CA828B12F16EF60EE0EEF2000:8
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
Cc: devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Steve Cho <stevecho@chromium.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Matthias Brugger <matthias.bgg@gmail.com>,
 John Stultz <jstultz@google.com>, linux-arm-kernel@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, linux-mediatek@lists.infradead.org, "T
 . J . Mercier" <tjmercier@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Yong Wu <yong.wu@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adding capture formats to support V4L2_PIX_FMT_MS21. This format has
one plane and only be used for secure video playback at current period.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c    | 4 +++-
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c   | 9 ++++++++-
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
index ba742f0e391d..604fdc8ee3ce 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
@@ -49,7 +49,9 @@ static bool mtk_vdec_get_cap_fmt(struct mtk_vcodec_dec_ctx *ctx, int format_inde
 		num_frame_count++;
 	}
 
-	if (num_frame_count == 1 || (!ctx->is_10bit_bitstream && fmt->fourcc == V4L2_PIX_FMT_MM21))
+	if ((!ctx->is_10bit_bitstream && fmt->fourcc == V4L2_PIX_FMT_MM21) ||
+	    (ctx->is_secure_playback && fmt->fourcc == V4L2_PIX_FMT_MS21) ||
+	    num_frame_count == 1)
 		return true;
 
 	q_data = &ctx->q_data[MTK_Q_DATA_SRC];
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index d54b3833790d..cc42c942eb8a 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -229,7 +229,7 @@ static const struct mtk_stateless_control mtk_stateless_controls[] = {
 
 #define NUM_CTRLS ARRAY_SIZE(mtk_stateless_controls)
 
-static struct mtk_video_fmt mtk_video_formats[9];
+static struct mtk_video_fmt mtk_video_formats[10];
 
 static struct mtk_video_fmt default_out_format;
 static struct mtk_video_fmt default_cap_format;
@@ -770,6 +770,11 @@ static void mtk_vcodec_add_formats(unsigned int fourcc,
 		mtk_video_formats[count_formats].type = MTK_FMT_FRAME;
 		mtk_video_formats[count_formats].num_planes = 2;
 		break;
+	case V4L2_PIX_FMT_MS21:
+		mtk_video_formats[count_formats].fourcc = fourcc;
+		mtk_video_formats[count_formats].type = MTK_FMT_FRAME;
+		mtk_video_formats[count_formats].num_planes = 1;
+		break;
 	default:
 		mtk_v4l2_vdec_err(ctx, "Can not add unsupported format type");
 		return;
@@ -798,6 +803,8 @@ static void mtk_vcodec_get_supported_formats(struct mtk_vcodec_dec_ctx *ctx)
 		cap_format_count++;
 	}
 	if (ctx->dev->dec_capability & MTK_VDEC_FORMAT_MM21) {
+		mtk_vcodec_add_formats(V4L2_PIX_FMT_MS21, ctx);
+		cap_format_count++;
 		mtk_vcodec_add_formats(V4L2_PIX_FMT_MM21, ctx);
 		cap_format_count++;
 	}
-- 
2.18.0

