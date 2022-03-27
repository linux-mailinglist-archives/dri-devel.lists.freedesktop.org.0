Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3284E8AB3
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 00:41:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C3DC10E5AB;
	Sun, 27 Mar 2022 22:41:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2BC510E59C
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Mar 2022 22:41:32 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id b19so17869031wrh.11
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Mar 2022 15:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pWDBUqHr7U7WLBcTgCiyJ33WLBjatxwS5P2S/A7RDBQ=;
 b=EKML6heEWBHkARE1qiyyx9JSgMXHlnAC3GeJ9osUMQ2zGSM7ND3Xi+XyFzs5YOhur0
 BixWyXwjKY1Bvi287WbFMAUD28tKYl4wTlgnwqrB5dfplYZfSlr4AygZXFwnkkIAE/BE
 9QQm2Dhbyk//EhHwq2J9srfdwMrFSsAZG/MAd7dlEEgZVufj8J19jQyR2x+YuwiT689N
 /7YnY1JGqYiuu5IPbx6yP7be6i/vgMm76KEuXqwM2FVa5NZhmfS+tHf71r2kEbWDRNUv
 MQPOBqcWz5DLzay0cqCkK7Ehenhj5Awoc5+BKpS4Cj58hdlcP5wpge1k1CqUXya4WiXT
 czwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pWDBUqHr7U7WLBcTgCiyJ33WLBjatxwS5P2S/A7RDBQ=;
 b=jC1/tZlYIi4Vt47OU9EGWE0QSqTpSlLYXyvQQowLCnStsHdd2MkKE9QChUoFKPq4OD
 PLwrm2bPgi6/x/dl+uybW1Gz8NxMpqZ/DjC+pZsqRgM9Liap340B5dpZe1J4jnJ6Ol28
 ICkIZyEaIELid/YwLxMesoVmsOqvrxbjhmSakSSdPjpj+XmNQS52E+WDnGN2gkWEyUVg
 VRqtwupMZ6mdi1LtrViaqPdN2uDOXg4QvmvelYD3SK0r/+SRqIvGJPM8iDFZf2T4dFoU
 xPArrA1axEBRgEfxMiUhbmGPllnTzn8vpUcTBGrSmtWpApIDiPMKS2Qjn9J6JMGf/iUY
 GFng==
X-Gm-Message-State: AOAM532w9mZRiGJ+4qpuEgePCavieMWvgla73KZZZPQBQcLtxcT3mzbs
 cmB1xrS6k51/B1VVrWpWk11z5Q==
X-Google-Smtp-Source: ABdhPJwhLfR00h+uYq+uYY1yJox6+UwpYi7/wrMRQVKm3YC6QqxytGi2LqTren81bWZCr8wuczbegQ==
X-Received: by 2002:a05:6000:2c9:b0:204:1cdb:8f8d with SMTP id
 o9-20020a05600002c900b002041cdb8f8dmr20055658wry.49.1648420891115; 
 Sun, 27 Mar 2022 15:41:31 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6341-357e-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6341:357e:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id
 v5-20020adfe4c5000000b001edc1e5053esm10400867wrm.82.2022.03.27.15.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 15:41:30 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: airlied@linux.ie, angelogioacchino.delregno@collabora.com,
 chunfeng.yun@mediatek.com, chunkuang.hu@kernel.org, ck.hu@mediatek.com,
 daniel@ffwll.ch, deller@gmx.de, jitao.shi@mediatek.com, kishon@ti.com,
 krzk+dt@kernel.org, maarten.lankhorst@linux.intel.com,
 matthias.bgg@gmail.com, mripard@kernel.org, p.zabel@pengutronix.de,
 robh+dt@kernel.org, tzimmermann@suse.de, vkoul@kernel.org
Subject: [PATCH v9 19/22] drm/mediatek: Add mt8195 External DisplayPort support
Date: Mon, 28 Mar 2022 00:39:24 +0200
Message-Id: <20220327223927.20848-20-granquet@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220327223927.20848-1-granquet@baylibre.com>
References: <20220327223927.20848-1-granquet@baylibre.com>
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

This patch adds External DisplayPort support to the mt8195 eDP driver.

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 301 +++++++++++++++++++++++++++---
 1 file changed, 278 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 7cd8459cf719..9e532408f12e 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -176,6 +176,11 @@ struct mtk_dp {
 	struct drm_connector *conn;
 };
 
+static bool mtk_dp_is_edp(struct mtk_dp *mtk_dp)
+{
+	return mtk_dp->next_bridge;
+}
+
 static struct mtk_dp *mtk_dp_from_bridge(struct drm_bridge *b)
 {
 	return container_of(b, struct mtk_dp, bridge);
@@ -741,6 +746,47 @@ static int mtk_dp_fec_enable(struct mtk_dp *mtk_dp, bool enable)
 			   FEC_EN_DP_TRANS_P0_MASK);
 }
 
+static u32 mtk_dp_swirq_get_clear(struct mtk_dp *mtk_dp)
+{
+	int ret;
+
+	u32 irq_status = mtk_dp_read(mtk_dp, MTK_DP_TRANS_P0_35D0) &
+			 SW_IRQ_FINAL_STATUS_DP_TRANS_P0_MASK;
+
+	if (irq_status) {
+		MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TRANS_P0_35C8, irq_status,
+				    SW_IRQ_CLR_DP_TRANS_P0_MASK, ret, out);
+		MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TRANS_P0_35C8, 0,
+				    SW_IRQ_CLR_DP_TRANS_P0_MASK, ret, out);
+	}
+
+	return irq_status;
+
+out:
+	return ret;
+}
+
+static u32 mtk_dp_hwirq_get_clear(struct mtk_dp *mtk_dp)
+{
+	int ret;
+
+	u8 irq_status = (mtk_dp_read(mtk_dp, MTK_DP_TRANS_P0_3418) &
+			 IRQ_STATUS_DP_TRANS_P0_MASK) >>
+			IRQ_STATUS_DP_TRANS_P0_SHIFT;
+
+	if (irq_status) {
+		MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TRANS_P0_3418, irq_status,
+				    IRQ_CLR_DP_TRANS_P0_MASK, ret, out);
+		MTK_UPD_BITS_OR_OUT(mtk_dp, MTK_DP_TRANS_P0_3418, 0,
+				    IRQ_CLR_DP_TRANS_P0_MASK, ret, out);
+	}
+
+	return irq_status;
+
+out:
+	return ret;
+}
+
 static int mtk_dp_hwirq_enable(struct mtk_dp *mtk_dp, bool enable)
 {
 	u32 val = 0;
@@ -932,26 +978,49 @@ static int mtk_dp_get_calibration_data(struct mtk_dp *mtk_dp)
 		return PTR_ERR(buf);
 	}
 
-	cal_data->glb_bias_trim =
-		check_cal_data_valid(1, 0x1e, (buf[3] >> 27) & 0x1f, 0xf);
-	cal_data->clktx_impse =
-		check_cal_data_valid(1, 0xe, (buf[0] >> 9) & 0xf, 0x8);
-	cal_data->ln_tx_impsel_pmos[0] =
-		check_cal_data_valid(1, 0xe, (buf[2] >> 28) & 0xf, 0x8);
-	cal_data->ln_tx_impsel_nmos[0] =
-		check_cal_data_valid(1, 0xe, (buf[2] >> 24) & 0xf, 0x8);
-	cal_data->ln_tx_impsel_pmos[1] =
-		check_cal_data_valid(1, 0xe, (buf[2] >> 20) & 0xf, 0x8);
-	cal_data->ln_tx_impsel_nmos[1] =
-		check_cal_data_valid(1, 0xe, (buf[2] >> 16) & 0xf, 0x8);
-	cal_data->ln_tx_impsel_pmos[2] =
-		check_cal_data_valid(1, 0xe, (buf[2] >> 12) & 0xf, 0x8);
-	cal_data->ln_tx_impsel_nmos[2] =
-		check_cal_data_valid(1, 0xe, (buf[2] >> 8) & 0xf, 0x8);
-	cal_data->ln_tx_impsel_pmos[3] =
-		check_cal_data_valid(1, 0xe, (buf[2] >> 4) & 0xf, 0x8);
-	cal_data->ln_tx_impsel_nmos[3] =
-		check_cal_data_valid(1, 0xe, buf[2] & 0xf, 0x8);
+	if (mtk_dp_is_edp(mtk_dp)) {
+		cal_data->glb_bias_trim =
+			check_cal_data_valid(1, 0x1e, (buf[3] >> 27) & 0x1f, 0xf);
+		cal_data->clktx_impse =
+			check_cal_data_valid(1, 0xe, (buf[0] >> 9) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_pmos[0] =
+			check_cal_data_valid(1, 0xe, (buf[2] >> 28) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_nmos[0] =
+			check_cal_data_valid(1, 0xe, (buf[2] >> 24) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_pmos[1] =
+			check_cal_data_valid(1, 0xe, (buf[2] >> 20) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_nmos[1] =
+			check_cal_data_valid(1, 0xe, (buf[2] >> 16) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_pmos[2] =
+			check_cal_data_valid(1, 0xe, (buf[2] >> 12) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_nmos[2] =
+			check_cal_data_valid(1, 0xe, (buf[2] >> 8) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_pmos[3] =
+			check_cal_data_valid(1, 0xe, (buf[2] >> 4) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_nmos[3] =
+			check_cal_data_valid(1, 0xe, buf[2] & 0xf, 0x8);
+	} else {
+		cal_data->glb_bias_trim =
+			check_cal_data_valid(1, 0x1e, (buf[0] >> 27) & 0x1f, 0xf);
+		cal_data->clktx_impse =
+			check_cal_data_valid(1, 0xe, (buf[0] >> 13) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_pmos[0] =
+			check_cal_data_valid(1, 0xe, (buf[1] >> 28) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_nmos[0] =
+			check_cal_data_valid(1, 0xe, (buf[1] >> 24) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_pmos[1] =
+			check_cal_data_valid(1, 0xe, (buf[1] >> 20) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_nmos[1] =
+			check_cal_data_valid(1, 0xe, (buf[1] >> 16) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_pmos[2] =
+			check_cal_data_valid(1, 0xe, (buf[1] >> 12) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_nmos[2] =
+			check_cal_data_valid(1, 0xe, (buf[1] >> 8) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_pmos[3] =
+			check_cal_data_valid(1, 0xe, (buf[1] >> 4) & 0xf, 0x8);
+		cal_data->ln_tx_impsel_nmos[3] =
+			check_cal_data_valid(1, 0xe, buf[1] & 0xf, 0x8);
+	}
 
 	kfree(buf);
 
@@ -1080,7 +1149,10 @@ static void mtk_dp_video_mute(struct mtk_dp *mtk_dp, bool enable)
 			   VIDEO_MUTE_SEL_DP_ENC0_P0_MASK |
 			   VIDEO_MUTE_SW_DP_ENC0_P0_MASK);
 
-	mtk_dp_sip_atf_call(MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE, enable);
+	if (mtk_dp_is_edp(mtk_dp))
+		mtk_dp_sip_atf_call(MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE, enable);
+	else
+		mtk_dp_sip_atf_call(MTK_DP_SIP_ATF_VIDEO_UNMUTE, enable);
 }
 
 static int mtk_dp_power_enable(struct mtk_dp *mtk_dp)
@@ -1195,6 +1267,57 @@ static void mtk_dp_set_tx_out(struct mtk_dp *mtk_dp)
 	mtk_dp_setup_tu(mtk_dp);
 }
 
+static void mtk_dp_edid_free(struct mtk_dp *mtk_dp)
+{
+	mutex_lock(&mtk_dp->edid_lock);
+	kfree(mtk_dp->edid);
+	mtk_dp->edid = NULL;
+	mutex_unlock(&mtk_dp->edid_lock);
+}
+
+static int mtk_dp_hpd_sink_event(struct mtk_dp *mtk_dp)
+{
+	ssize_t ret;
+	u8 sink_count;
+	bool locked;
+	u8 link_status[DP_LINK_STATUS_SIZE] = {};
+	u32 sink_count_reg = DP_SINK_COUNT_ESI;
+	u32 link_status_reg = DP_LANE0_1_STATUS;
+
+	ret = drm_dp_dpcd_readb(&mtk_dp->aux, sink_count_reg, &sink_count);
+	if (ret < 0) {
+		drm_err(mtk_dp->drm_dev, "Read sink count failed: %ld\n", ret);
+		return ret;
+	}
+
+	ret = drm_dp_dpcd_read(&mtk_dp->aux, link_status_reg, link_status,
+			       sizeof(link_status));
+	if (!ret) {
+		drm_err(mtk_dp->drm_dev, "Read link status failed: %ld\n",
+			ret);
+		return ret;
+	}
+
+	locked = drm_dp_channel_eq_ok(link_status,
+				      mtk_dp->train_info.lane_count);
+	if (!locked && mtk_dp->train_state > MTK_DP_TRAIN_STATE_TRAINING_PRE)
+		mtk_dp->train_state = MTK_DP_TRAIN_STATE_TRAINING_PRE;
+
+	if (link_status[1] & DP_REMOTE_CONTROL_COMMAND_PENDING)
+		drm_dp_dpcd_writeb(&mtk_dp->aux, DP_DEVICE_SERVICE_IRQ_VECTOR,
+				   DP_REMOTE_CONTROL_COMMAND_PENDING);
+
+	if (DP_GET_SINK_COUNT(sink_count) &&
+	    (link_status[2] & DP_DOWNSTREAM_PORT_STATUS_CHANGED)) {
+		mtk_dp_edid_free(mtk_dp);
+		mtk_dp->train_info.check_cap_count = 0;
+		mtk_dp->train_state = MTK_DP_TRAIN_STATE_CHECKEDID;
+		msleep(20);
+	}
+
+	return 0;
+}
+
 static void mtk_dp_train_update_swing_pre(struct mtk_dp *mtk_dp, int lanes,
 					  u8 dpcd_adjust_req[2])
 {
@@ -1677,6 +1800,115 @@ static void mtk_dp_init_port(struct mtk_dp *mtk_dp)
 	mtk_dp_digital_sw_reset(mtk_dp);
 }
 
+static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
+{
+	struct mtk_dp *mtk_dp = dev;
+	int event;
+	u8 buf[DP_RECEIVER_CAP_SIZE] = {};
+
+	event = mtk_dp_plug_state(mtk_dp) ? connector_status_connected :
+						  connector_status_disconnected;
+
+	if (event < 0)
+		return IRQ_HANDLED;
+
+	if (mtk_dp->drm_dev) {
+		dev_info(mtk_dp->dev, "drm_helper_hpd_irq_event\n");
+		drm_helper_hpd_irq_event(mtk_dp->bridge.dev);
+	}
+
+	if (mtk_dp->train_info.cable_state_change) {
+		mtk_dp->train_info.cable_state_change = false;
+
+		mtk_dp->train_state = MTK_DP_TRAIN_STATE_STARTUP;
+
+		if (!mtk_dp->train_info.cable_plugged_in ||
+		    !mtk_dp_plug_state(mtk_dp)) {
+			mtk_dp_video_mute(mtk_dp, true);
+
+			mtk_dp_initialize_priv_data(mtk_dp);
+			mtk_dp_set_idle_pattern(mtk_dp, true);
+			if (mtk_dp->has_fec)
+				mtk_dp_fec_enable(mtk_dp, false);
+
+			mtk_dp_edid_free(mtk_dp);
+			mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
+					   DP_PWR_STATE_BANDGAP_TPLL,
+					   DP_PWR_STATE_MASK);
+		} else {
+			mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
+					   DP_PWR_STATE_BANDGAP_TPLL_LANE,
+					   DP_PWR_STATE_MASK);
+			drm_dp_read_dpcd_caps(&mtk_dp->aux, buf);
+			mtk_dp->train_info.link_rate =
+				min_t(int, MTK_DP_MAX_LINK_RATE,
+				      buf[DP_MAX_LINK_RATE]);
+			mtk_dp->train_info.lane_count =
+				min_t(int, MTK_DP_MAX_LANES,
+				      drm_dp_max_lane_count(buf));
+		}
+	}
+
+	if (mtk_dp->train_info.irq_status & MTK_DP_HPD_INTERRUPT) {
+		dev_dbg(mtk_dp->dev, "MTK_DP_HPD_INTERRUPT\n");
+		mtk_dp->train_info.irq_status &= ~MTK_DP_HPD_INTERRUPT;
+		mtk_dp_hpd_sink_event(mtk_dp);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t mtk_dp_hpd_isr_handler(struct mtk_dp *mtk_dp)
+{
+	bool connected;
+	u16 swirq_status = mtk_dp_swirq_get_clear(mtk_dp);
+	u8 hwirq_status = mtk_dp_hwirq_get_clear(mtk_dp);
+	struct mtk_dp_train_info *train_info = &mtk_dp->train_info;
+
+	train_info->irq_status |= hwirq_status | swirq_status;
+
+	if (!train_info->irq_status)
+		return IRQ_HANDLED;
+
+	connected = mtk_dp_plug_state(mtk_dp);
+	if (connected || !train_info->cable_plugged_in)
+		train_info->irq_status &= ~MTK_DP_HPD_DISCONNECT;
+	else if (!connected || train_info->cable_plugged_in)
+		train_info->irq_status &= ~MTK_DP_HPD_CONNECT;
+
+	if (!(train_info->irq_status &
+	      (MTK_DP_HPD_CONNECT | MTK_DP_HPD_DISCONNECT)))
+		return IRQ_HANDLED;
+
+	if (train_info->irq_status & MTK_DP_HPD_CONNECT) {
+		train_info->irq_status &= ~MTK_DP_HPD_CONNECT;
+		train_info->cable_plugged_in = true;
+	} else {
+		train_info->irq_status &= ~MTK_DP_HPD_DISCONNECT;
+		train_info->cable_plugged_in = false;
+		mtk_dp->train_state = MTK_DP_TRAIN_STATE_STARTUP;
+	}
+	train_info->cable_state_change = true;
+
+	return IRQ_WAKE_THREAD;
+}
+
+static irqreturn_t mtk_dp_hpd_event(int hpd, void *dev)
+{
+	struct mtk_dp *mtk_dp = dev;
+	u32 irq_status;
+
+	irq_status = mtk_dp_read(mtk_dp, MTK_DP_TOP_IRQ_STATUS);
+
+	if (!irq_status)
+		return IRQ_HANDLED;
+
+	if (irq_status & RGS_IRQ_STATUS_TRANSMITTER)
+		return mtk_dp_hpd_isr_handler(mtk_dp);
+
+	return IRQ_HANDLED;
+}
+
 static int mtk_dp_dt_parse(struct mtk_dp *mtk_dp,
 			   struct platform_device *pdev)
 {
@@ -2110,6 +2342,7 @@ static int mtk_dp_probe(struct platform_device *pdev)
 	struct mtk_dp *mtk_dp;
 	struct device *dev = &pdev->dev;
 	int ret;
+	int irq_num = 0;
 
 	mtk_dp = devm_kzalloc(dev, sizeof(*mtk_dp), GFP_KERNEL);
 	if (!mtk_dp)
@@ -2117,9 +2350,18 @@ static int mtk_dp_probe(struct platform_device *pdev)
 
 	mtk_dp->dev = dev;
 
+	irq_num = platform_get_irq(pdev, 0);
+	if (irq_num < 0)
+		return dev_err_probe(dev, irq_num, "failed to request dp irq resource\n");
+
 	mtk_dp->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
-	if (IS_ERR(mtk_dp->next_bridge))
+	if (IS_ERR(mtk_dp->next_bridge) && PTR_ERR(mtk_dp->next_bridge) == -ENODEV) {
+		dev_info(dev,
+			 "No panel connected in devicetree, continuing as external DP\n");
+		mtk_dp->next_bridge = NULL;
+	} else if (IS_ERR(mtk_dp->next_bridge)) {
 		return dev_err_probe(dev, PTR_ERR(mtk_dp->next_bridge), "Failed to get bridge\n");
+	}
 
 	ret = mtk_dp_dt_parse(mtk_dp, pdev);
 	if (ret)
@@ -2129,6 +2371,13 @@ static int mtk_dp_probe(struct platform_device *pdev)
 	mtk_dp->aux.name = "aux_mtk_dp";
 	mtk_dp->aux.transfer = mtk_dp_aux_transfer;
 
+	ret = devm_request_threaded_irq(dev, irq_num, mtk_dp_hpd_event,
+					mtk_dp_hpd_event_thread,
+					IRQ_TYPE_LEVEL_HIGH, dev_name(dev),
+					mtk_dp);
+	if (ret)
+		return dev_err_probe(dev, -EPROBE_DEFER, "failed to request mediatek dptx irq\n");
+
 	mutex_init(&mtk_dp->dp_lock);
 	mutex_init(&mtk_dp->edid_lock);
 
@@ -2145,8 +2394,13 @@ static int mtk_dp_probe(struct platform_device *pdev)
 	mtk_dp->bridge.of_node = dev->of_node;
 	mtk_dp->bridge.type = DRM_MODE_CONNECTOR_eDP;
 
-	mtk_dp->bridge.ops = DRM_BRIDGE_OP_EDID;
+	mtk_dp->bridge.ops =
+		DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
 	drm_bridge_add(&mtk_dp->bridge);
+	if (mtk_dp_is_edp(mtk_dp))
+		mtk_dp->bridge.type = DRM_MODE_CONNECTOR_eDP;
+	else
+		mtk_dp->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
 
 	pm_runtime_enable(dev);
 	pm_runtime_get_sync(dev);
@@ -2201,6 +2455,7 @@ static SIMPLE_DEV_PM_OPS(mtk_dp_pm_ops, mtk_dp_suspend, mtk_dp_resume);
 
 static const struct of_device_id mtk_dp_of_match[] = {
 	{ .compatible = "mediatek,mt8195-edp-tx", },
+	{ .compatible = "mediatek,mt8195-dp-tx", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_dp_of_match);
-- 
2.34.1

