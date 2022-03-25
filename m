Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D480C4E79D3
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 18:17:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65BAC10E967;
	Fri, 25 Mar 2022 17:17:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3373E10E905
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 17:17:34 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id h4so11729948wrc.13
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 10:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iVJcDPmEgKq4qwyUYhvyaA6cTfOyiuUQ6gGO8WmCn74=;
 b=OYxux9AOIaLyTM7DmfP+iMgHcb/gM9z2am4SqhcDVrX/lMM85ujmZj29XuUOIWvtCj
 50/C5ZYCkR9VvdHiN9roe6sffczUg388yFiqAT+oLy+6ZWPC49yZQA/i2wss7bflfmNM
 7Yq7y7rQyxIPsGnflwqY1EAGnhogngoht22qZGvs1BlEIxz5rVW1pnNwlHWLnjisOFLk
 Exsqis8ypGaDbt/oJAI/jrrYyFUC5frzD5wYFgLlwQs4JXZz7R33xDpHiTqZxfAnVIo6
 xqnZ/GUSaUHAVohTuH7KVeDfw37YUw7YVkCr1bGiOm56wmtW8j3UXSTlHl2UYHuyOuyv
 F+/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iVJcDPmEgKq4qwyUYhvyaA6cTfOyiuUQ6gGO8WmCn74=;
 b=VZSWGP+GWFhsIrAl9hBcrZXDZsD+sRgpKKmMGWuY7hctj+VKkCMjFM1YbS2Ivtymtq
 XRWeA0Ln/Ah6iKLS+gU0b1hz46K+Y/NN7FAb1zojOK6ZTM2ur67Rr8i2KoICH3AufhMt
 pHwY9b3GcLKiCZx3IbMV2kWEgdIPYfCmo1HQw+uxZCDcJmeKRnLUt+1K+2EmjHRwUbSL
 P5wdiDosCwvrhNTIRHzc6PDg4RW+HNEAdSRfk+he831ZQLP90/xzlCHS7DorBMuE3GNq
 niBuXaCWpDOo3rb2oqkyEJgz6Hx6mi/Yk4BkH1CfholebAJeSATTXmjvJdS4pUWJlv6m
 k2KQ==
X-Gm-Message-State: AOAM5314dv/829QWX4J+9z1nCcXp3MoMcBQ6A2HH0e77QQWErb2ns6AO
 L7tK1/Aa5DyJZmuQZVR4LjI37Q==
X-Google-Smtp-Source: ABdhPJyiJFD0TJzBf7TXeoSL2Ki6XILvr15gChqrOD3CPSQs3QzLHg1jjKySsBy46ykDzHhAmhO2kg==
X-Received: by 2002:a5d:6c67:0:b0:204:ff0:87a8 with SMTP id
 r7-20020a5d6c67000000b002040ff087a8mr10164770wrz.627.1648228652521; 
 Fri, 25 Mar 2022 10:17:32 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6240-cc41-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6240:cc41:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a5d6390000000b00203ffebddf3sm7547464wru.99.2022.03.25.10.17.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 10:17:32 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, matthias.bgg@gmail.com,
 chunfeng.yun@mediatek.com, kishon@ti.com, vkoul@kernel.org, deller@gmx.de,
 ck.hu@mediatek.com, jitao.shi@mediatek.com,
 angelogioacchino.delregno@collabora.com
Subject: [PATCH 22/22] drm/mediatek: DP audio support for mt8195
Date: Fri, 25 Mar 2022 18:15:11 +0100
Message-Id: <20220325171511.23493-23-granquet@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220325171511.23493-1-granquet@baylibre.com>
References: <20220325171511.23493-1-granquet@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, markyacoub@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds audio support to the DP driver for mt8195 with up to 8
channels.

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 711 +++++++++++++++++++++++++++++-
 1 file changed, 692 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index de2a1c1b4f8c..6519d64d1823 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -123,9 +123,16 @@ enum mtk_dp_color_depth {
 	MTK_DP_COLOR_DEPTH_UNKNOWN = 5,
 };
 
+struct mtk_dp_audio_cfg {
+	int sample_rate;
+	int word_length_bits;
+	int channels;
+};
+
 struct mtk_dp_info {
 	enum mtk_dp_color_depth depth;
 	enum mtk_dp_color_format format;
+	struct mtk_dp_audio_cfg audio_caps;
 	struct mtk_dp_timings timings;
 };
 
@@ -165,13 +172,19 @@ struct mtk_dp {
 	struct clk *dp_tx_clk;
 
 	bool enabled;
+	bool audio_enable;
 
 	bool has_fec;
 	/* Protects the mtk_dp struct */
 	struct mutex dp_lock;
 
+	/* Protects the plugged_cb as it's used in both bridge ops and audio */
+	struct mutex update_plugged_status_lock;
+
 	hdmi_codec_plugged_cb plugged_cb;
 	struct device *codec_dev;
+	/* Protects the eld data as it's used in both bridge ops and audio */
+	struct mutex eld_lock;
 	u8 connector_eld[MAX_ELD_BYTES];
 	struct drm_connector *conn;
 	bool need_debounce;
@@ -504,15 +517,317 @@ static int mtk_dp_pg_disable(struct mtk_dp *mtk_dp)
 	return ret;
 }
 
+static int mtk_dp_audio_setup_channels(struct mtk_dp *mtk_dp,
+				       struct mtk_dp_audio_cfg *cfg)
+{
+	int ret;
+	u32 channel_enable_bits;
+
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC1_P0_3324,
+			    AUDIO_SOURCE_MUX_DP_ENC1_P0_DPRX,
+			   AUDIO_SOURCE_MUX_DP_ENC1_P0_MASK, ret, out);
+
+	/* audio channel count change reset */
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC1_P0_33F4, BIT(9), BIT(9), ret, out);
+
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC1_P0_3304,
+			    AU_PRTY_REGEN_DP_ENC1_P0_MASK,
+			   AU_PRTY_REGEN_DP_ENC1_P0_MASK, ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC1_P0_3304,
+			    AU_CH_STS_REGEN_DP_ENC1_P0_MASK,
+			   AU_CH_STS_REGEN_DP_ENC1_P0_MASK, ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC1_P0_3304,
+			    AUDIO_SAMPLE_PRSENT_REGEN_DP_ENC1_P0_MASK,
+			   AUDIO_SAMPLE_PRSENT_REGEN_DP_ENC1_P0_MASK, ret, out);
+
+	switch (cfg->channels) {
+	case 2:
+		channel_enable_bits = AUDIO_2CH_SEL_DP_ENC0_P0_MASK |
+				      AUDIO_2CH_EN_DP_ENC0_P0_MASK;
+		break;
+	case 8:
+	default:
+		channel_enable_bits = AUDIO_8CH_SEL_DP_ENC0_P0_MASK |
+				      AUDIO_8CH_EN_DP_ENC0_P0_MASK;
+		break;
+	}
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3088,
+			    channel_enable_bits | AU_EN_DP_ENC0_P0_MASK,
+			   AUDIO_2CH_SEL_DP_ENC0_P0_MASK | AUDIO_2CH_EN_DP_ENC0_P0_MASK |
+			   AUDIO_8CH_SEL_DP_ENC0_P0_MASK |
+			   AUDIO_8CH_EN_DP_ENC0_P0_MASK | AU_EN_DP_ENC0_P0_MASK, ret, out);
+
+	/* audio channel count change reset */
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC1_P0_33F4, 0, BIT(9), ret, out);
+
+	/* enable audio reset */
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC1_P0_33F4, BIT(0), BIT(0), ret, out);
+
+out:
+	return ret;
+}
+
+static int mtk_dp_audio_channel_status_set(struct mtk_dp *mtk_dp,
+					   struct mtk_dp_audio_cfg *cfg)
+{
+	int ret;
+	struct snd_aes_iec958 iec = { 0 };
+
+	switch (cfg->sample_rate) {
+	case 32000:
+		iec.status[3] = IEC958_AES3_CON_FS_32000;
+		break;
+	case 44100:
+		iec.status[3] = IEC958_AES3_CON_FS_44100;
+		break;
+	case 48000:
+		iec.status[3] = IEC958_AES3_CON_FS_48000;
+		break;
+	case 88200:
+		iec.status[3] = IEC958_AES3_CON_FS_88200;
+		break;
+	case 96000:
+		iec.status[3] = IEC958_AES3_CON_FS_96000;
+		break;
+	case 192000:
+		iec.status[3] = IEC958_AES3_CON_FS_192000;
+		break;
+	default:
+		iec.status[3] = IEC958_AES3_CON_FS_NOTID;
+		break;
+	}
+
+	switch (cfg->word_length_bits) {
+	case 16:
+		iec.status[4] = IEC958_AES4_CON_WORDLEN_20_16;
+		break;
+	case 20:
+		iec.status[4] = IEC958_AES4_CON_WORDLEN_20_16 |
+			IEC958_AES4_CON_MAX_WORDLEN_24;
+		break;
+	case 24:
+		iec.status[4] = IEC958_AES4_CON_WORDLEN_24_20 |
+			IEC958_AES4_CON_MAX_WORDLEN_24;
+		break;
+	default:
+		iec.status[4] = IEC958_AES4_CON_WORDLEN_NOTID;
+	}
+
+	/* IEC 60958 consumer channel status bits */
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_308C,
+			    0,
+			   CH_STATUS_0_DP_ENC0_P0_MASK, ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3090,
+			    iec.status[3] << 8,
+			   CH_STATUS_1_DP_ENC0_P0_MASK, ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3094, iec.status[4],
+			    CH_STATUS_2_DP_ENC0_P0_MASK, ret, out);
+
+out:
+	return ret;
+}
+
+static int mtk_dp_audio_sdp_asp_set_channels(struct mtk_dp *mtk_dp,
+					     int channels)
+{
+	if (channels != 2 && channels != 8)
+		channels = 8;
+
+	return mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_312C,
+			   (channels - 1) << ASP_HB3_DP_ENC0_P0_SHIFT,
+			   ASP_HB2_DP_ENC0_P0_MASK | ASP_HB3_DP_ENC0_P0_MASK);
+}
+
+static int mtk_dp_audio_set_divider(struct mtk_dp *mtk_dp)
+{
+	return mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_30BC,
+			   AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,
+			   AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MASK);
+}
+
 static bool mtk_dp_plug_state(struct mtk_dp *mtk_dp)
 {
 	return !!(mtk_dp_read(mtk_dp, MTK_DP_TRANS_P0_3414) &
 		  HPD_DB_DP_TRANS_P0_MASK);
 }
 
-static void mtk_dp_aux_irq_clear(struct mtk_dp *mtk_dp)
+static int mtk_dp_sdp_trigger_packet(struct mtk_dp *mtk_dp,
+				     enum mtk_dp_sdp_type type)
+{
+	int ret;
+
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC1_P0_3280, type,
+			    SDP_PACKET_TYPE_DP_ENC1_P0_MASK, ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC1_P0_3280, SDP_PACKET_W_DP_ENC1_P0,
+			    SDP_PACKET_W_DP_ENC1_P0, ret, out);
+
+out:
+	return ret;
+}
+
+static void mtk_dp_sdp_set_data(struct mtk_dp *mtk_dp, u8 *data_bytes)
+{
+	mtk_dp_bulk_16bit_write(mtk_dp, MTK_DP_ENC1_P0_3200, data_bytes, 0x10);
+}
+
+static void mtk_dp_sdp_set_header(struct mtk_dp *mtk_dp,
+				  enum mtk_dp_sdp_type type,
+				  struct dp_sdp_header *header)
+{
+	u32 db_addr;
+
+	switch (type) {
+	case MTK_DP_SDP_DRM:
+		db_addr = MTK_DP_ENC0_P0_3138;
+		break;
+	case MTK_DP_SDP_PPS0:
+	case MTK_DP_SDP_PPS1:
+	case MTK_DP_SDP_PPS2:
+	case MTK_DP_SDP_PPS3:
+		db_addr = MTK_DP_ENC0_P0_3130;
+		break;
+	default:
+		db_addr = MTK_DP_ENC0_P0_30D8 + (type - MTK_DP_SDP_ACM) * 8;
+	}
+
+	mtk_dp_bulk_16bit_write(mtk_dp, db_addr, (u8 *)header, 4);
+}
+
+static const u32 mtk_dp_sdp_type_to_reg[MTK_DP_SDP_MAX_NUM] = {
+	/* MTK_DP_SDP_NONE => */ 0x0,
+	/* MTK_DP_SDP_ACM  => */ MTK_DP_ENC0_P0_30B4,
+	/* MTK_DP_SDP_ISRC => */ MTK_DP_ENC0_P0_30B4 + 1,
+	/* MTK_DP_SDP_AVI  => */ MTK_DP_ENC0_P0_30A4 + 1,
+	/* MTK_DP_SDP_AUI  => */ MTK_DP_ENC0_P0_30A8,
+	/* MTK_DP_SDP_SPD  => */ MTK_DP_ENC0_P0_30A8 + 1,
+	/* MTK_DP_SDP_MPEG => */ MTK_DP_ENC0_P0_30AC,
+	/* MTK_DP_SDP_NTSC => */ MTK_DP_ENC0_P0_30AC + 1,
+	/* MTK_DP_SDP_VSP  => */ MTK_DP_ENC0_P0_30B0,
+	/* MTK_DP_SDP_VSC  => */ MTK_DP_ENC0_P0_30B8,
+	/* MTK_DP_SDP_EXT  => */ MTK_DP_ENC0_P0_30B0 + 1,
+	/* MTK_DP_SDP_PPS0 => */ MTK_DP_ENC0_P0_31E8,
+	/* MTK_DP_SDP_PPS1 => */ MTK_DP_ENC0_P0_31E8,
+	/* MTK_DP_SDP_PPS2 => */ MTK_DP_ENC0_P0_31E8,
+	/* MTK_DP_SDP_PPS3 => */ MTK_DP_ENC0_P0_31E8,
+	/* MTK_DP_SDP_DRM  => */ MTK_DP_ENC0_P0_31DC,
+};
+
+static int mtk_dp_disable_sdp(struct mtk_dp *mtk_dp, enum mtk_dp_sdp_type type)
+{
+	if (type == MTK_DP_SDP_NONE)
+		return -EINVAL;
+
+	/* Disable periodic send */
+	return mtk_dp_update_bits(mtk_dp, mtk_dp_sdp_type_to_reg[type] & 0xfffc, 0,
+			   0xFF << ((mtk_dp_sdp_type_to_reg[type] & 3) * 8));
+}
+
+static int mtk_dp_setup_sdp(struct mtk_dp *mtk_dp,
+			    struct mtk_dp_sdp_packet *packet)
+{
+	int ret;
+
+	mtk_dp_sdp_set_data(mtk_dp, packet->sdp.db);
+	mtk_dp_sdp_set_header(mtk_dp, packet->type, &packet->sdp.sdp_header);
+
+	mtk_dp_disable_sdp(mtk_dp, packet->type);
+
+	switch (packet->type) {
+	case MTK_DP_SDP_NONE:
+		break;
+	case MTK_DP_SDP_ISRC:
+		MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_31EC,
+				    0x1C << ISRC1_HB3_DP_ENC0_P0_SHIFT,
+				   ISRC1_HB3_DP_ENC0_P0_MASK, ret, out);
+		MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC1_P0_3280, MTK_DP_SDP_ISRC,
+				    SDP_PACKET_TYPE_DP_ENC1_P0_MASK, ret, out);
+
+		if (packet->sdp.sdp_header.HB3 & BIT(2))
+			MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_30BC,
+					    BIT(ISRC_CONT_DP_ENC0_P0_SHIFT),
+					   ISRC_CONT_DP_ENC0_P0_MASK, ret, out);
+		else
+			MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_30BC, 0,
+					    ISRC_CONT_DP_ENC0_P0_MASK, ret, out);
+
+		MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC1_P0_3280,
+				    SDP_PACKET_W_DP_ENC1_P0,
+				   SDP_PACKET_W_DP_ENC1_P0, ret, out);
+		MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_30B4,
+				    5 << ISRC_CFG_DP_ENC0_P0_SHIFT,
+				   ISRC_CFG_DP_ENC0_P0_MASK, ret, out);
+		break;
+	case MTK_DP_SDP_DRM:
+		mtk_dp_sdp_trigger_packet(mtk_dp, packet->type);
+		MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_31DC,
+				    5 << HDR0_CFG_DP_ENC0_P0_SHIFT,
+				   HDR0_CFG_DP_ENC0_P0_MASK, ret, out);
+
+		mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_31EC,
+				   0x1C << ISRC1_HB3_DP_ENC0_P0_SHIFT,
+				   ISRC1_HB3_DP_ENC0_P0_MASK);
+		mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3280, MTK_DP_SDP_ISRC,
+				   SDP_PACKET_TYPE_DP_ENC1_P0_MASK);
+
+		if (packet->sdp.sdp_header.HB3 & BIT(2))
+			mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_30BC,
+					   BIT(ISRC_CONT_DP_ENC0_P0_SHIFT),
+					   ISRC_CONT_DP_ENC0_P0_MASK);
+		else
+			mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_30BC, 0,
+					   ISRC_CONT_DP_ENC0_P0_MASK);
+
+		mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3280,
+				   SDP_PACKET_W_DP_ENC1_P0,
+				   SDP_PACKET_W_DP_ENC1_P0);
+		mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_30B4,
+				   5 << ISRC_CFG_DP_ENC0_P0_SHIFT,
+				   ISRC_CFG_DP_ENC0_P0_MASK);
+		break;
+	case MTK_DP_SDP_ACM:
+	case MTK_DP_SDP_AVI:
+	case MTK_DP_SDP_AUI:
+	case MTK_DP_SDP_SPD:
+	case MTK_DP_SDP_MPEG:
+	case MTK_DP_SDP_NTSC:
+	case MTK_DP_SDP_VSP:
+	case MTK_DP_SDP_VSC:
+	case MTK_DP_SDP_EXT:
+	case MTK_DP_SDP_PPS0:
+	case MTK_DP_SDP_PPS1:
+	case MTK_DP_SDP_PPS2:
+	case MTK_DP_SDP_PPS3:
+		mtk_dp_sdp_trigger_packet(mtk_dp, packet->type);
+		/* Enable periodic sending */
+		MTK_UPD_BITS_OR_OUT(mtk_dp,
+				    mtk_dp_sdp_type_to_reg[packet->type] & 0xfffc,
+				   0x05 << ((mtk_dp_sdp_type_to_reg[packet->type] & 3) * 8),
+				   0xff << ((mtk_dp_sdp_type_to_reg[packet->type] & 3) * 8),
+				   ret, out);
+		break;
+	default:
+		break;
+	}
+
+out:
+	return ret;
+}
+
+static int mtk_dp_sdp_vsc_ext_disable(struct mtk_dp *mtk_dp)
 {
-	mtk_dp_write(mtk_dp, MTK_DP_AUX_P0_3640,
+	int ret;
+
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_30A0, 0,
+			    BIT(7) | BIT(8) | BIT(12), ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC1_P0_328C, 0, BIT(7), ret, out);
+
+out:
+	return ret;
+}
+
+static int mtk_dp_aux_irq_clear(struct mtk_dp *mtk_dp)
+{
+	return mtk_dp_write(mtk_dp, MTK_DP_AUX_P0_3640,
 		     BIT(AUX_400US_TIMEOUT_IRQ_AUX_TX_P0_SHIFT) |
 		     BIT(AUX_RX_DATA_RECV_IRQ_AUX_TX_P0_SHIFT) |
 		     BIT(AUX_RX_ADDR_RECV_IRQ_AUX_TX_P0_SHIFT) |
@@ -849,28 +1164,33 @@ static int mtk_dp_initialize_settings(struct mtk_dp *mtk_dp)
 	return ret;
 }
 
-static void mtk_dp_initialize_hpd_detect_settings(struct mtk_dp *mtk_dp)
+static int mtk_dp_initialize_hpd_detect_settings(struct mtk_dp *mtk_dp)
 {
-	// Debounce threshold
-	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3410,
+	int ret;
+
+	/* Debounce threshold */
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TRANS_P0_3410,
 			   8 << HPD_DEB_THD_DP_TRANS_P0_SHIFT,
-			   HPD_DEB_THD_DP_TRANS_P0_MASK);
-	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3410,
+			   HPD_DEB_THD_DP_TRANS_P0_MASK, ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TRANS_P0_3410,
 			   (HPD_INT_THD_DP_TRANS_P0_LOWER_500US |
 			    HPD_INT_THD_DP_TRANS_P0_UPPER_1100US)
 				   << HPD_INT_THD_DP_TRANS_P0_SHIFT,
-			   HPD_INT_THD_DP_TRANS_P0_MASK);
+			   HPD_INT_THD_DP_TRANS_P0_MASK, ret, out);
 
-	// Connect threshold 1.5ms + 5 x 0.1ms = 2ms
-	// Disconnect threshold 1.5ms + 5 x 0.1ms = 2ms
-	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3410,
+	/* Connect threshold 1.5ms + 5 x 0.1ms = 2ms */
+	/* Disconnect threshold 1.5ms + 5 x 0.1ms = 2ms */
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TRANS_P0_3410,
 			   (5 << HPD_DISC_THD_DP_TRANS_P0_SHIFT) |
 				   (5 << HPD_CONN_THD_DP_TRANS_P0_SHIFT),
 			   HPD_DISC_THD_DP_TRANS_P0_MASK |
-				   HPD_CONN_THD_DP_TRANS_P0_MASK);
-	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3430,
+				   HPD_CONN_THD_DP_TRANS_P0_MASK, ret, out);
+	MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TRANS_P0_3430,
 			   HPD_INT_THD_ECO_DP_TRANS_P0_HIGH_BOUND_EXT,
-			   HPD_INT_THD_ECO_DP_TRANS_P0_MASK);
+			   HPD_INT_THD_ECO_DP_TRANS_P0_MASK, ret, out);
+
+out:
+	return ret;
 }
 
 static int mtk_dp_initialize_aux_settings(struct mtk_dp *mtk_dp)
@@ -1167,20 +1487,60 @@ static int mtk_dp_training_set_scramble(struct mtk_dp *mtk_dp, bool enable)
 			   DP_SCR_EN_DP_TRANS_P0_MASK);
 }
 
-static void mtk_dp_video_mute(struct mtk_dp *mtk_dp, bool enable)
+static int mtk_dp_video_mute(struct mtk_dp *mtk_dp, bool enable)
 {
+	int ret;
 	u32 val = BIT(VIDEO_MUTE_SEL_DP_ENC0_P0_SHIFT);
 
 	if (enable)
 		val |= BIT(VIDEO_MUTE_SW_DP_ENC0_P0_SHIFT);
-	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3000, val,
-			   VIDEO_MUTE_SEL_DP_ENC0_P0_MASK |
-			   VIDEO_MUTE_SW_DP_ENC0_P0_MASK);
+	ret = mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3000, val,
+				 VIDEO_MUTE_SEL_DP_ENC0_P0_MASK | VIDEO_MUTE_SW_DP_ENC0_P0_MASK);
+
+	if (ret)
+		return ret;
 
 	if (mtk_dp_is_edp(mtk_dp))
 		mtk_dp_sip_atf_call(MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE, enable);
 	else
 		mtk_dp_sip_atf_call(MTK_DP_SIP_ATF_VIDEO_UNMUTE, enable);
+
+	return 0;
+}
+
+static int mtk_dp_audio_mute(struct mtk_dp *mtk_dp, bool mute)
+{
+	int ret;
+
+	if (mute) {
+		MTK_UPD_BITS_OR_OUT(mtk_dp,
+				    MTK_DP_ENC0_P0_3030,
+				   BIT(VBID_AUDIO_MUTE_SW_DP_ENC0_P0_SHIFT) |
+				   BIT(VBID_AUDIO_MUTE_SEL_DP_ENC0_P0_SHIFT),
+				   VBID_AUDIO_MUTE_FLAG_SW_DP_ENC0_P0_MASK |
+				   VBID_AUDIO_MUTE_FLAG_SEL_DP_ENC0_P0_MASK, ret, out);
+
+		MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3088, 0,
+				    AU_EN_DP_ENC0_P0_MASK, ret, out);
+		MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_30A4, 0,
+				    AU_TS_CFG_DP_ENC0_P0_MASK, ret, out);
+
+	} else {
+		MTK_UPD_BITS_OR_OUT(mtk_dp,
+				    MTK_DP_ENC0_P0_3030, 0,
+				   VBID_AUDIO_MUTE_FLAG_SW_DP_ENC0_P0_MASK |
+				   VBID_AUDIO_MUTE_FLAG_SEL_DP_ENC0_P0_MASK, ret, out);
+
+		MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_3088,
+				    BIT(AU_EN_DP_ENC0_P0_SHIFT),
+				   AU_EN_DP_ENC0_P0_MASK, ret, out);
+		/* Send one every two frames */
+		MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_ENC0_P0_30A4, 0x0F,
+				    AU_TS_CFG_DP_ENC0_P0_MASK, ret, out);
+	}
+
+out:
+	return ret;
 }
 
 static int mtk_dp_power_enable(struct mtk_dp *mtk_dp)
@@ -1248,6 +1608,75 @@ static void mtk_dp_initialize_priv_data(struct mtk_dp *mtk_dp)
 	mtk_dp->info.timings.frame_rate = 60;
 
 	mtk_dp->has_fec = false;
+	mtk_dp->audio_enable = false;
+}
+
+static int mtk_dp_sdp_set_down_cnt_init(struct mtk_dp *mtk_dp,
+					u32 sram_read_start)
+{
+	u32 sdp_down_cnt_init = 0;
+	u32 dc_offset;
+
+	if (mtk_dp->info.timings.pix_rate_khz > 0)
+		sdp_down_cnt_init = sram_read_start *
+				    mtk_dp->train_info.link_rate * 2700 * 8 /
+				    (mtk_dp->info.timings.pix_rate_khz * 4);
+
+	switch (mtk_dp->train_info.lane_count) {
+	case 1:
+		sdp_down_cnt_init = sdp_down_cnt_init > 0x1A ?
+						  sdp_down_cnt_init :
+						  0x1A; /* 26 */
+		break;
+	case 2:
+		/* case for LowResolution && High Audio Sample Rate */
+		dc_offset = mtk_dp->info.timings.vtotal <= 525 ? 0x04 : 0x00;
+		sdp_down_cnt_init = sdp_down_cnt_init > 0x10 ?
+						  sdp_down_cnt_init :
+						  0x10 + dc_offset; /* 20 or 16 */
+		break;
+	case 4:
+	default:
+		sdp_down_cnt_init =
+			sdp_down_cnt_init > 0x06 ? sdp_down_cnt_init : 0x06; /*6 */
+		break;
+	}
+
+	return mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3040,
+			   sdp_down_cnt_init
+				   << SDP_DOWN_CNT_INIT_DP_ENC0_P0_SHIFT,
+			   SDP_DOWN_CNT_INIT_DP_ENC0_P0_MASK);
+}
+
+static int mtk_dp_sdp_set_down_cnt_init_in_hblank(struct mtk_dp *mtk_dp)
+{
+	int pix_clk_mhz;
+	u32 dc_offset;
+	u32 spd_down_cnt_init = 0;
+
+	pix_clk_mhz = mtk_dp->info.format == MTK_DP_COLOR_FORMAT_YUV_420 ?
+				    mtk_dp->info.timings.pix_rate_khz / 2000 :
+				    mtk_dp->info.timings.pix_rate_khz / 1000;
+
+	switch (mtk_dp->train_info.lane_count) {
+	case 1:
+		spd_down_cnt_init = 0x20;
+		break;
+	case 2:
+		dc_offset = (mtk_dp->info.timings.vtotal <= 525) ? 0x14 : 0x00;
+		spd_down_cnt_init = 0x18 + dc_offset;
+		break;
+	case 4:
+	default:
+		dc_offset = (mtk_dp->info.timings.vtotal <= 525) ? 0x08 : 0x00;
+		if (pix_clk_mhz > mtk_dp->train_info.link_rate * 27)
+			spd_down_cnt_init = 0x8;
+		else
+			spd_down_cnt_init = 0x10 + dc_offset;
+		break;
+	}
+	return mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3364, spd_down_cnt_init,
+			   SDP_DOWN_CNT_INIT_IN_HBLANK_DP_ENC1_P0_MASK);
 }
 
 static void mtk_dp_setup_tu(struct mtk_dp *mtk_dp)
@@ -1263,6 +1692,8 @@ static void mtk_dp_setup_tu(struct mtk_dp *mtk_dp)
 	}
 
 	mtk_dp_setup_encoder(mtk_dp);
+	mtk_dp_sdp_set_down_cnt_init_in_hblank(mtk_dp);
+	mtk_dp_sdp_set_down_cnt_init(mtk_dp, sram_read_start);
 }
 
 static void mtk_dp_calculate_pixrate(struct mtk_dp *mtk_dp)
@@ -1346,6 +1777,17 @@ static int mtk_dp_hpd_sink_event(struct mtk_dp *mtk_dp)
 	return 0;
 }
 
+static void mtk_dp_sdp_stop_sending(struct mtk_dp *mtk_dp)
+{
+	u8 packet_type;
+
+	for (packet_type = MTK_DP_SDP_ACM; packet_type < MTK_DP_SDP_MAX_NUM;
+	     packet_type++)
+		mtk_dp_disable_sdp(mtk_dp, packet_type);
+
+	mtk_dp_sdp_vsc_ext_disable(mtk_dp);
+}
+
 static void mtk_dp_train_update_swing_pre(struct mtk_dp *mtk_dp, int lanes,
 					  u8 dpcd_adjust_req[2])
 {
@@ -1601,6 +2043,52 @@ static bool mtk_dp_parse_capabilities(struct mtk_dp *mtk_dp)
 	return true;
 }
 
+static int mtk_dp_edid_parse_audio_capabilities(struct mtk_dp *mtk_dp,
+						struct mtk_dp_audio_cfg *cfg)
+{
+	struct cea_sad *sads;
+	int sad_count;
+	int i;
+	int ret = 0;
+
+	mutex_lock(&mtk_dp->edid_lock);
+	if (!mtk_dp->edid) {
+		mutex_unlock(&mtk_dp->edid_lock);
+		dev_err(mtk_dp->dev, "EDID not found!\n");
+		return -EINVAL;
+	}
+
+	sad_count = drm_edid_to_sad(mtk_dp->edid, &sads);
+	mutex_unlock(&mtk_dp->edid_lock);
+	if (sad_count <= 0) {
+		drm_info(mtk_dp->drm_dev, "The SADs is NULL\n");
+		return 0;
+	}
+
+	for (i = 0; i < sad_count; i++) {
+		int sample_rate;
+		int word_length;
+		/* Only PCM supported at the moment */
+		if (sads[i].format != HDMI_AUDIO_CODING_TYPE_PCM)
+			continue;
+
+		sample_rate = drm_cea_sad_get_sample_rate(&sads[i]);
+		word_length =
+			drm_cea_sad_get_uncompressed_word_length(&sads[i]);
+		if (sample_rate <= 0 || word_length <= 0)
+			continue;
+
+		cfg->channels = sads[i].channels;
+		cfg->word_length_bits = word_length;
+		cfg->sample_rate = sample_rate;
+		ret = 1;
+		break;
+	}
+	kfree(sads);
+
+	return ret;
+}
+
 static void mtk_dp_train_change_mode(struct mtk_dp *mtk_dp)
 {
 	phy_reset(mtk_dp->phy);
@@ -1725,7 +2213,15 @@ static int mtk_dp_train_handler(struct mtk_dp *mtk_dp)
 			}
 			break;
 
-		case MTK_DP_TRAIN_STATE_CHECKEDID:
+		case MTK_DP_TRAIN_STATE_CHECKEDID: {
+			int caps_found = mtk_dp_edid_parse_audio_capabilities(mtk_dp,
+				&mtk_dp->info.audio_caps);
+			mtk_dp->audio_enable = caps_found > 0;
+			if (!mtk_dp->audio_enable)
+				memset(&mtk_dp->info.audio_caps, 0,
+				       sizeof(mtk_dp->info.audio_caps));
+		}
+
 			mtk_dp->train_state = MTK_DP_TRAIN_STATE_TRAINING_PRE;
 			break;
 
@@ -1737,6 +2233,7 @@ static int mtk_dp_train_handler(struct mtk_dp *mtk_dp)
 			ret = mtk_dp_train_start(mtk_dp);
 			if (!ret) {
 				mtk_dp_video_mute(mtk_dp, true);
+				mtk_dp_audio_mute(mtk_dp, true);
 				mtk_dp->train_state = MTK_DP_TRAIN_STATE_NORMAL;
 				mtk_dp_fec_enable(mtk_dp, mtk_dp->has_fec);
 			} else if (ret != -EAGAIN) {
@@ -1771,6 +2268,48 @@ static void mtk_dp_video_enable(struct mtk_dp *mtk_dp, bool enable)
 	}
 }
 
+static void mtk_dp_audio_sdp_setup(struct mtk_dp *mtk_dp,
+				   struct mtk_dp_audio_cfg *cfg)
+{
+	struct mtk_dp_sdp_packet packet;
+	struct hdmi_audio_infoframe frame;
+
+	hdmi_audio_infoframe_init(&frame);
+	frame.coding_type = HDMI_AUDIO_CODING_TYPE_PCM;
+	frame.channels = cfg->channels;
+	frame.sample_frequency = cfg->sample_rate;
+
+	switch (cfg->word_length_bits) {
+	case 16:
+		frame.sample_size = HDMI_AUDIO_SAMPLE_SIZE_16;
+		break;
+	case 20:
+		frame.sample_size = HDMI_AUDIO_SAMPLE_SIZE_20;
+		break;
+	case 24:
+	default:
+		frame.sample_size = HDMI_AUDIO_SAMPLE_SIZE_24;
+		break;
+	}
+
+	packet.type = MTK_DP_SDP_AUI;
+	hdmi_audio_infoframe_pack_for_dp(&frame, &packet.sdp,
+					 MTK_DP_DP_VERSION_11);
+
+	mtk_dp_audio_sdp_asp_set_channels(mtk_dp, cfg->channels);
+	mtk_dp_setup_sdp(mtk_dp, &packet);
+}
+
+static void mtk_dp_audio_setup(struct mtk_dp *mtk_dp,
+			       struct mtk_dp_audio_cfg *cfg)
+{
+	mtk_dp_audio_sdp_setup(mtk_dp, cfg);
+	mtk_dp_audio_channel_status_set(mtk_dp, cfg);
+
+	mtk_dp_audio_setup_channels(mtk_dp, cfg);
+	mtk_dp_audio_set_divider(mtk_dp);
+}
+
 static void mtk_dp_video_config(struct mtk_dp *mtk_dp)
 {
 	mtk_dp_mn_overwrite_disable(mtk_dp);
@@ -1786,6 +2325,7 @@ static void mtk_dp_state_handler(struct mtk_dp *mtk_dp)
 	switch (mtk_dp->state) {
 	case MTK_DP_STATE_INITIAL:
 		mtk_dp_video_mute(mtk_dp, true);
+		mtk_dp_audio_mute(mtk_dp, true);
 		mtk_dp->state = MTK_DP_STATE_IDLE;
 		break;
 
@@ -1798,12 +2338,19 @@ static void mtk_dp_state_handler(struct mtk_dp *mtk_dp)
 		mtk_dp_video_config(mtk_dp);
 		mtk_dp_video_enable(mtk_dp, true);
 
+		if (mtk_dp->audio_enable) {
+			mtk_dp_audio_setup(mtk_dp, &mtk_dp->info.audio_caps);
+			mtk_dp_audio_mute(mtk_dp, false);
+		}
+
 		mtk_dp->state = MTK_DP_STATE_NORMAL;
 		break;
 
 	case MTK_DP_STATE_NORMAL:
 		if (mtk_dp->train_state != MTK_DP_TRAIN_STATE_NORMAL) {
 			mtk_dp_video_mute(mtk_dp, true);
+			mtk_dp_audio_mute(mtk_dp, true);
+			mtk_dp_sdp_stop_sending(mtk_dp);
 			mtk_dp->state = MTK_DP_STATE_IDLE;
 		}
 		break;
@@ -1857,11 +2404,13 @@ static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
 		if (!mtk_dp->train_info.cable_plugged_in ||
 		    !mtk_dp_plug_state(mtk_dp)) {
 			mtk_dp_video_mute(mtk_dp, true);
+			mtk_dp_audio_mute(mtk_dp, true);
 
 			mtk_dp_initialize_priv_data(mtk_dp);
 			mtk_dp_set_idle_pattern(mtk_dp, true);
 			if (mtk_dp->has_fec)
 				mtk_dp_fec_enable(mtk_dp, false);
+			mtk_dp_sdp_stop_sending(mtk_dp);
 
 			mtk_dp_edid_free(mtk_dp);
 			mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
@@ -1972,6 +2521,18 @@ static int mtk_dp_dt_parse(struct mtk_dp *mtk_dp,
 	return 0;
 }
 
+static void mtk_dp_update_plugged_status(struct mtk_dp *mtk_dp)
+{
+	bool connected, has_audio;
+
+	mutex_lock(&mtk_dp->update_plugged_status_lock);
+	connected = mtk_dp_plug_state(mtk_dp);
+	has_audio = drm_detect_monitor_audio(mtk_dp->edid);
+	if (mtk_dp->plugged_cb && mtk_dp->codec_dev)
+		mtk_dp->plugged_cb(mtk_dp->codec_dev, connected & has_audio);
+	mutex_unlock(&mtk_dp->update_plugged_status_lock);
+}
+
 static enum drm_connector_status mtk_dp_bdg_detect(struct drm_bridge *bridge)
 {
 	return connector_status_connected;
@@ -2186,6 +2747,7 @@ static void mtk_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
 
 	mtk_dp_video_mute(mtk_dp, true);
+	mtk_dp_audio_mute(mtk_dp, true);
 	mtk_dp->state = MTK_DP_STATE_IDLE;
 	mtk_dp->train_state = MTK_DP_TRAIN_STATE_STARTUP;
 
@@ -2221,7 +2783,9 @@ static void mtk_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 		return;
 	}
 
+	mutex_lock(&mtk_dp->eld_lock);
 	memcpy(mtk_dp->connector_eld, mtk_dp->conn->eld, MAX_ELD_BYTES);
+	mutex_unlock(&mtk_dp->eld_lock);
 
 	conn_state =
 		drm_atomic_get_new_connector_state(old_state->base.state, mtk_dp->conn);
@@ -2388,6 +2952,104 @@ static void mtk_dp_debounce_timer(struct timer_list *t)
 	mtk_dp->need_debounce = true;
 }
 
+/*
+ * HDMI audio codec callbacks
+ */
+static int mtk_dp_audio_hw_params(struct device *dev, void *data,
+				  struct hdmi_codec_daifmt *daifmt,
+				  struct hdmi_codec_params *params)
+{
+	struct mtk_dp *mtk_dp = dev_get_drvdata(dev);
+	struct mtk_dp_audio_cfg cfg;
+
+	if (!mtk_dp->enabled) {
+		pr_err("%s, DP is not ready!\n", __func__);
+		return -ENODEV;
+	}
+
+	cfg.channels = params->cea.channels;
+	cfg.sample_rate = params->sample_rate;
+	cfg.word_length_bits = 24;
+
+	mtk_dp_audio_setup(mtk_dp, &cfg);
+
+	return 0;
+}
+
+static int mtk_dp_audio_startup(struct device *dev, void *data)
+{
+	struct mtk_dp *mtk_dp = dev_get_drvdata(dev);
+
+	mtk_dp_audio_mute(mtk_dp, false);
+
+	return 0;
+}
+
+static void mtk_dp_audio_shutdown(struct device *dev, void *data)
+{
+	struct mtk_dp *mtk_dp = dev_get_drvdata(dev);
+
+	mtk_dp_audio_mute(mtk_dp, true);
+}
+
+static int mtk_dp_audio_get_eld(struct device *dev, void *data, uint8_t *buf,
+				size_t len)
+{
+	struct mtk_dp *mtk_dp = dev_get_drvdata(dev);
+
+	if (mtk_dp->enabled)
+		memcpy(buf, mtk_dp->connector_eld, len);
+	else
+		memset(buf, 0, len);
+
+	return 0;
+}
+
+static int mtk_dp_audio_hook_plugged_cb(struct device *dev, void *data,
+					hdmi_codec_plugged_cb fn,
+					struct device *codec_dev)
+{
+	struct mtk_dp *mtk_dp = data;
+
+	mutex_lock(&mtk_dp->update_plugged_status_lock);
+	mtk_dp->plugged_cb = fn;
+	mtk_dp->codec_dev = codec_dev;
+	mutex_unlock(&mtk_dp->update_plugged_status_lock);
+
+	mtk_dp_update_plugged_status(mtk_dp);
+
+	return 0;
+}
+
+static const struct hdmi_codec_ops mtk_dp_audio_codec_ops = {
+	.hw_params = mtk_dp_audio_hw_params,
+	.audio_startup = mtk_dp_audio_startup,
+	.audio_shutdown = mtk_dp_audio_shutdown,
+	.get_eld = mtk_dp_audio_get_eld,
+	.hook_plugged_cb = mtk_dp_audio_hook_plugged_cb,
+	.no_capture_mute = 1,
+};
+
+static int mtk_dp_register_audio_driver(struct device *dev)
+{
+	struct mtk_dp *mtk_dp = dev_get_drvdata(dev);
+	struct hdmi_codec_pdata codec_data = {
+		.ops = &mtk_dp_audio_codec_ops,
+		.max_i2s_channels = 8,
+		.i2s = 1,
+		.data = mtk_dp,
+	};
+	struct platform_device *pdev;
+
+	pdev = platform_device_register_data(dev, HDMI_CODEC_DRV_NAME,
+					     PLATFORM_DEVID_AUTO, &codec_data,
+					     sizeof(codec_data));
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
+
+	return 0;
+}
+
 static int mtk_dp_probe(struct platform_device *pdev)
 {
 	struct mtk_dp *mtk_dp;
@@ -2431,9 +3093,20 @@ static int mtk_dp_probe(struct platform_device *pdev)
 
 	mutex_init(&mtk_dp->dp_lock);
 	mutex_init(&mtk_dp->edid_lock);
+	mutex_init(&mtk_dp->eld_lock);
 
 	platform_set_drvdata(pdev, mtk_dp);
 
+	if (!mtk_dp_is_edp(mtk_dp)) {
+		mutex_init(&mtk_dp->update_plugged_status_lock);
+		ret = mtk_dp_register_audio_driver(dev);
+		if (ret) {
+			dev_err(dev, "Failed to register audio driver: %d\n",
+				ret);
+			return ret;
+		}
+	}
+
 	mtk_dp_get_calibration_data(mtk_dp);
 
 	mtk_dp->phy = devm_phy_get(dev, "dp");
@@ -2467,6 +3140,7 @@ static int mtk_dp_remove(struct platform_device *pdev)
 	struct mtk_dp *mtk_dp = platform_get_drvdata(pdev);
 
 	mtk_dp_video_mute(mtk_dp, true);
+	mtk_dp_audio_mute(mtk_dp, true);
 	del_timer_sync(&mtk_dp->debounce_timer);
 
 	pm_runtime_disable(&pdev->dev);
-- 
2.34.1

