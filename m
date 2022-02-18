Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C15F44BBB4E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 15:57:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1148A10EE17;
	Fri, 18 Feb 2022 14:56:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A182910ED02
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 14:56:40 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id u1so15007802wrg.11
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 06:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5/RdwfwXY6UExlPUZ/iSZUzkntptWzw+gzqe04u2tXc=;
 b=teOdr4Geeboofp+YzIdEPzSvE3NWO+qYtS34DLXFevh2OrG3PgK1R05PYqZ34NfWEj
 K9J9AH2FHTjF6eJEogPkAU2egiiY8ydbZI9hQt2T38eyrTVHcCbpkEI0pJzxDXPudCjC
 aiMCpMDBdUlH1JD8XwOpnQvIf3TLu0HIh2J5DUgdNmEzRnaahI+SufvCljUKervuBg0e
 2JSG8U4QbIzBIw4+C5SBnj8X6ofFOn+oC+mYDIYKogNtT1BMxsUy6pCltbf0nk2C500Z
 y+jXnVyZICMmI1N5ipyKu1kH8+HAH3hOQq9vn04yaWbdTQh+FKc8kjC/RbaBXM61EbCs
 uJdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5/RdwfwXY6UExlPUZ/iSZUzkntptWzw+gzqe04u2tXc=;
 b=RJbNULjKuQ5wiuW0kWwItxQc7sobuejadMUtSQ9Leu6QV6TsjLSJt0n0Li1sPUs+42
 WkaNkWb4a5pj3CIrIMsAon+wkPceh5ZB7LrskH5ke3x/3+0bfg8PmkUZnnJ6OUFwTTrX
 uU8a79b8Q/qpyZIpmiknuwrT9B1dTgdhqyCiyESG+2CUAfMcjcETMXpV8orMUiUwBba8
 lvIXVCodm28C+pGaVl+pIeFZ+FsBON0HTPxiTg7Z6KiAnptL+Bj+LifQaqozyONQlkwO
 rKpBQ+C9Ccek0JHjgejO8EXecU+llXu25t6TMjfAeGwlHzmD7rXIW2yhw0yio4VR4i5h
 ZVHA==
X-Gm-Message-State: AOAM5336GKAPcY0hUE/4m2m5QyyMP9XSRl7BE7VRZdvz+NPzqWLDplUL
 HqFoT+Bo9nxRjwDlSn2OzMW01Q==
X-Google-Smtp-Source: ABdhPJwTAA/r115O/m7m50GKdOXuZIQvmOu58+iH3A7UbXVpx1rNID+oGt63TZWcYvyjI7gYUh4eRg==
X-Received: by 2002:a5d:6a8a:0:b0:1e3:310c:8b1e with SMTP id
 s10-20020a5d6a8a000000b001e3310c8b1emr6286505wru.717.1645196199091; 
 Fri, 18 Feb 2022 06:56:39 -0800 (PST)
Received: from localhost.localdomain
 (2a02-8440-6241-3b28-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6241:3b28:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id b10sm47431454wrd.8.2022.02.18.06.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 06:56:38 -0800 (PST)
From: Guillaume Ranquet <granquet@baylibre.com>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, matthias.bgg@gmail.com,
 chunfeng.yun@mediatek.com, kishon@ti.com, vkoul@kernel.org, deller@gmx.de,
 ck.hu@mediatek.com, jitao.shi@mediatek.com,
 angelogioacchino.delregno@collabora.com
Subject: [PATCH v8 19/19] drm/mediatek: DP audio support for mt8195
Date: Fri, 18 Feb 2022 15:54:37 +0100
Message-Id: <20220218145437.18563-20-granquet@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218145437.18563-1-granquet@baylibre.com>
References: <20220218145437.18563-1-granquet@baylibre.com>
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
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds audio support to the DP driver for mt8195 with up to 8
channels.

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 641 +++++++++++++++++++++++++++++-
 1 file changed, 640 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 4e880d8a8a186..837a000cc6560 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -121,9 +121,16 @@ enum mtk_dp_color_depth {
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
 
@@ -169,19 +176,50 @@ struct mtk_dp {
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
 	struct timer_list debounce_timer;
 };
 
+enum mtk_dp_sdp_type {
+	MTK_DP_SDP_NONE = 0x00,
+	MTK_DP_SDP_ACM = 0x01,
+	MTK_DP_SDP_ISRC = 0x02,
+	MTK_DP_SDP_AVI = 0x03,
+	MTK_DP_SDP_AUI = 0x04,
+	MTK_DP_SDP_SPD = 0x05,
+	MTK_DP_SDP_MPEG = 0x06,
+	MTK_DP_SDP_NTSC = 0x07,
+	MTK_DP_SDP_VSP = 0x08,
+	MTK_DP_SDP_VSC = 0x09,
+	MTK_DP_SDP_EXT = 0x0A,
+	MTK_DP_SDP_PPS0 = 0x0B,
+	MTK_DP_SDP_PPS1 = 0x0C,
+	MTK_DP_SDP_PPS2 = 0x0D,
+	MTK_DP_SDP_PPS3 = 0x0E,
+	MTK_DP_SDP_DRM = 0x10,
+	MTK_DP_SDP_MAX_NUM
+};
+
+struct mtk_dp_sdp_packet {
+	enum mtk_dp_sdp_type type;
+	struct dp_sdp sdp;
+};
+
 static struct regmap_config mtk_dp_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
@@ -457,12 +495,269 @@ static void mtk_dp_pg_disable(struct mtk_dp *mtk_dp)
 			   4 << PGEN_PATTERN_SEL_SHIFT, PGEN_PATTERN_SEL_MASK);
 }
 
+static void mtk_dp_audio_setup_channels(struct mtk_dp *mtk_dp,
+					struct mtk_dp_audio_cfg *cfg)
+{
+	u32 channel_enable_bits;
+
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3324,
+			   AUDIO_SOURCE_MUX_DP_ENC1_P0_DPRX,
+			   AUDIO_SOURCE_MUX_DP_ENC1_P0_MASK);
+
+	//audio channel count change reset
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_33F4, BIT(9), BIT(9));
+
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3304,
+			   AU_PRTY_REGEN_DP_ENC1_P0_MASK,
+			   AU_PRTY_REGEN_DP_ENC1_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3304,
+			   AU_CH_STS_REGEN_DP_ENC1_P0_MASK,
+			   AU_CH_STS_REGEN_DP_ENC1_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3304,
+			   AUDIO_SAMPLE_PRSENT_REGEN_DP_ENC1_P0_MASK,
+			   AUDIO_SAMPLE_PRSENT_REGEN_DP_ENC1_P0_MASK);
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
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3088,
+			   channel_enable_bits | AU_EN_DP_ENC0_P0_MASK,
+			   AUDIO_2CH_SEL_DP_ENC0_P0_MASK | AUDIO_2CH_EN_DP_ENC0_P0_MASK |
+			   AUDIO_8CH_SEL_DP_ENC0_P0_MASK |
+			   AUDIO_8CH_EN_DP_ENC0_P0_MASK | AU_EN_DP_ENC0_P0_MASK);
+
+	//audio channel count change reset
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_33F4, 0, BIT(9));
+
+	//enable audio reset
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_33F4, BIT(0), BIT(0));
+}
+
+static void mtk_dp_audio_channel_status_set(struct mtk_dp *mtk_dp,
+					    struct mtk_dp_audio_cfg *cfg)
+{
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
+	// IEC 60958 consumer channel status bits
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_308C,
+			   0,
+			   CH_STATUS_0_DP_ENC0_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3090,
+			   iec.status[3] << 8,
+			   CH_STATUS_1_DP_ENC0_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3094, iec.status[4],
+			   CH_STATUS_2_DP_ENC0_P0_MASK);
+}
+
+static void mtk_dp_audio_sdp_asp_set_channels(struct mtk_dp *mtk_dp,
+					      int channels)
+{
+	if (channels != 2 && channels != 8)
+		channels = 8;
+
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_312C,
+			   (channels - 1) << ASP_HB3_DP_ENC0_P0_SHIFT,
+			   ASP_HB2_DP_ENC0_P0_MASK | ASP_HB3_DP_ENC0_P0_MASK);
+}
+
+static void mtk_dp_audio_set_divider(struct mtk_dp *mtk_dp)
+{
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_30BC,
+			   AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,
+			   AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MASK);
+}
+
 static bool mtk_dp_plug_state(struct mtk_dp *mtk_dp)
 {
 	return !!(mtk_dp_read(mtk_dp, MTK_DP_TRANS_P0_3414) &
 		  HPD_DB_DP_TRANS_P0_MASK);
 }
 
+static void mtk_dp_sdp_trigger_packet(struct mtk_dp *mtk_dp,
+				      enum mtk_dp_sdp_type type)
+{
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3280, type,
+			   SDP_PACKET_TYPE_DP_ENC1_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3280, SDP_PACKET_W_DP_ENC1_P0,
+			   SDP_PACKET_W_DP_ENC1_P0);
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
+static void mtk_dp_disable_sdp(struct mtk_dp *mtk_dp, enum mtk_dp_sdp_type type)
+{
+	if (type == MTK_DP_SDP_NONE)
+		return;
+
+	// Disable periodic send
+	mtk_dp_update_bits(mtk_dp, mtk_dp_sdp_type_to_reg[type] & 0xfffc, 0,
+			   0xFF << ((mtk_dp_sdp_type_to_reg[type] & 3) * 8));
+}
+
+static void mtk_dp_setup_sdp(struct mtk_dp *mtk_dp,
+			     struct mtk_dp_sdp_packet *packet)
+{
+	mtk_dp_sdp_set_data(mtk_dp, packet->sdp.db);
+	mtk_dp_sdp_set_header(mtk_dp, packet->type, &packet->sdp.sdp_header);
+
+	mtk_dp_disable_sdp(mtk_dp, packet->type);
+
+	switch (packet->type) {
+	case MTK_DP_SDP_NONE:
+		break;
+	case MTK_DP_SDP_ISRC:
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
+	case MTK_DP_SDP_DRM:
+		mtk_dp_sdp_trigger_packet(mtk_dp, packet->type);
+		mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_31DC,
+				   5 << HDR0_CFG_DP_ENC0_P0_SHIFT,
+				   HDR0_CFG_DP_ENC0_P0_MASK);
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
+		mtk_dp_update_bits(mtk_dp,
+				   mtk_dp_sdp_type_to_reg[packet->type] & 0xfffc,
+				   0x05 << ((mtk_dp_sdp_type_to_reg[packet->type] & 3) * 8),
+				   0xff << ((mtk_dp_sdp_type_to_reg[packet->type] & 3) * 8));
+		break;
+	default:
+		break;
+	}
+}
+
+static void mtk_dp_sdp_vsc_ext_disable(struct mtk_dp *mtk_dp)
+{
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_30A0, 0,
+			   BIT(7) | BIT(8) | BIT(12));
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_328C, 0, BIT(7));
+}
+
 static void mtk_dp_aux_irq_clear(struct mtk_dp *mtk_dp)
 {
 	mtk_dp_write(mtk_dp, MTK_DP_AUX_P0_3640,
@@ -1062,6 +1357,36 @@ static void mtk_dp_video_mute(struct mtk_dp *mtk_dp, bool enable)
 		mtk_dp_sip_atf_call(MTK_DP_SIP_ATF_VIDEO_UNMUTE, enable);
 }
 
+static void mtk_dp_audio_mute(struct mtk_dp *mtk_dp, bool mute)
+{
+	if (mute) {
+		mtk_dp_update_bits(mtk_dp,
+				   MTK_DP_ENC0_P0_3030,
+				   BIT(VBID_AUDIO_MUTE_SW_DP_ENC0_P0_SHIFT) |
+				   BIT(VBID_AUDIO_MUTE_SEL_DP_ENC0_P0_SHIFT),
+				   VBID_AUDIO_MUTE_FLAG_SW_DP_ENC0_P0_MASK |
+				   VBID_AUDIO_MUTE_FLAG_SEL_DP_ENC0_P0_MASK);
+
+		mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3088, 0,
+				   AU_EN_DP_ENC0_P0_MASK);
+		mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_30A4, 0,
+				   AU_TS_CFG_DP_ENC0_P0_MASK);
+
+	} else {
+		mtk_dp_update_bits(mtk_dp,
+				   MTK_DP_ENC0_P0_3030, 0,
+				   VBID_AUDIO_MUTE_FLAG_SW_DP_ENC0_P0_MASK |
+				   VBID_AUDIO_MUTE_FLAG_SEL_DP_ENC0_P0_MASK);
+
+		mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3088,
+				   BIT(AU_EN_DP_ENC0_P0_SHIFT),
+				   AU_EN_DP_ENC0_P0_MASK);
+		// Send one every two frames
+		mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_30A4, 0x0F,
+				   AU_TS_CFG_DP_ENC0_P0_MASK);
+	}
+}
+
 static void mtk_dp_power_enable(struct mtk_dp *mtk_dp)
 {
 	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_RESET_AND_PROBE, 0,
@@ -1105,6 +1430,75 @@ static void mtk_dp_initialize_priv_data(struct mtk_dp *mtk_dp)
 	mtk_dp->info.timings.frame_rate = 60;
 
 	mtk_dp->has_fec = false;
+	mtk_dp->audio_enable = false;
+}
+
+static void mtk_dp_sdp_set_down_cnt_init(struct mtk_dp *mtk_dp,
+					 u32 sram_read_start)
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
+						  0x1A; //26
+		break;
+	case 2:
+		// case for LowResolution && High Audio Sample Rate
+		dc_offset = mtk_dp->info.timings.vtotal <= 525 ? 0x04 : 0x00;
+		sdp_down_cnt_init = sdp_down_cnt_init > 0x10 ?
+						  sdp_down_cnt_init :
+						  0x10 + dc_offset; //20 or 16
+		break;
+	case 4:
+	default:
+		sdp_down_cnt_init =
+			sdp_down_cnt_init > 0x06 ? sdp_down_cnt_init : 0x06; //6
+		break;
+	}
+
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3040,
+			   sdp_down_cnt_init
+				   << SDP_DOWN_CNT_INIT_DP_ENC0_P0_SHIFT,
+			   SDP_DOWN_CNT_INIT_DP_ENC0_P0_MASK);
+}
+
+static void mtk_dp_sdp_set_down_cnt_init_in_hblank(struct mtk_dp *mtk_dp)
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
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3364, spd_down_cnt_init,
+			   SDP_DOWN_CNT_INIT_IN_HBLANK_DP_ENC1_P0_MASK);
 }
 
 static void mtk_dp_setup_tu(struct mtk_dp *mtk_dp)
@@ -1120,6 +1514,8 @@ static void mtk_dp_setup_tu(struct mtk_dp *mtk_dp)
 	}
 
 	mtk_dp_setup_encoder(mtk_dp);
+	mtk_dp_sdp_set_down_cnt_init_in_hblank(mtk_dp);
+	mtk_dp_sdp_set_down_cnt_init(mtk_dp, sram_read_start);
 }
 
 static void mtk_dp_calculate_pixrate(struct mtk_dp *mtk_dp)
@@ -1211,6 +1607,17 @@ static void mtk_dp_hpd_sink_event(struct mtk_dp *mtk_dp)
 	}
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
@@ -1466,6 +1873,52 @@ static bool mtk_dp_parse_capabilities(struct mtk_dp *mtk_dp)
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
+		// Only PCM supported at the moment
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
@@ -1586,7 +2039,15 @@ static void mtk_dp_train_handler(struct mtk_dp *mtk_dp)
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
 
@@ -1598,6 +2059,7 @@ static void mtk_dp_train_handler(struct mtk_dp *mtk_dp)
 			ret = mtk_dp_train_start(mtk_dp);
 			if (!ret) {
 				mtk_dp_video_mute(mtk_dp, true);
+				mtk_dp_audio_mute(mtk_dp, true);
 				mtk_dp->train_state = MTK_DP_TRAIN_STATE_NORMAL;
 				mtk_dp_fec_enable(mtk_dp, mtk_dp->has_fec);
 			} else if (ret != -EAGAIN) {
@@ -1630,6 +2092,48 @@ static void mtk_dp_video_enable(struct mtk_dp *mtk_dp, bool enable)
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
@@ -1645,6 +2149,7 @@ static void mtk_dp_state_handler(struct mtk_dp *mtk_dp)
 	switch (mtk_dp->state) {
 	case MTK_DP_STATE_INITIAL:
 		mtk_dp_video_mute(mtk_dp, true);
+		mtk_dp_audio_mute(mtk_dp, true);
 		mtk_dp->state = MTK_DP_STATE_IDLE;
 		break;
 
@@ -1657,12 +2162,19 @@ static void mtk_dp_state_handler(struct mtk_dp *mtk_dp)
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
@@ -1716,11 +2228,13 @@ static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
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
@@ -1832,6 +2346,18 @@ static int mtk_dp_dt_parse(struct mtk_dp *mtk_dp,
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
@@ -2057,6 +2583,7 @@ static void mtk_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
 
 	mtk_dp_video_mute(mtk_dp, true);
+	mtk_dp_audio_mute(mtk_dp, true);
 	mtk_dp->state = MTK_DP_STATE_IDLE;
 	mtk_dp->train_state = MTK_DP_TRAIN_STATE_STARTUP;
 
@@ -2092,7 +2619,9 @@ static void mtk_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 		return;
 	}
 
+	mutex_lock(&mtk_dp->eld_lock);
 	memcpy(mtk_dp->connector_eld, mtk_dp->conn->eld, MAX_ELD_BYTES);
+	mutex_unlock(&mtk_dp->eld_lock);
 
 	conn_state =
 		drm_atomic_get_new_connector_state(old_state->base.state, mtk_dp->conn);
@@ -2264,6 +2793,104 @@ static void mtk_dp_debounce_timer(struct timer_list *t)
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
@@ -2311,9 +2938,20 @@ static int mtk_dp_probe(struct platform_device *pdev)
 
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
 	mtk_dp->phy_dev = platform_device_register_data(dev, "mediatek-dp-phy",
 							PLATFORM_DEVID_AUTO,
 							&mtk_dp->regs,
@@ -2360,6 +2998,7 @@ static int mtk_dp_remove(struct platform_device *pdev)
 	platform_device_unregister(mtk_dp->phy_dev);
 
 	mtk_dp_video_mute(mtk_dp, true);
+	mtk_dp_audio_mute(mtk_dp, true);
 	del_timer_sync(&mtk_dp->debounce_timer);
 
 	pm_runtime_disable(&pdev->dev);
-- 
2.34.1

