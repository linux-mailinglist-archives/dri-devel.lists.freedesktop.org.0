Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 081D95377B6
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 11:34:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E88DE10E474;
	Mon, 30 May 2022 09:34:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EABFE10E474
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 09:34:52 +0000 (UTC)
X-UUID: 12292876a63e4114832784e67ff5dc24-20220530
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:c1a25a89-c40b-4e19-b549-b12d22ec7966, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:45
X-CID-INFO: VERSION:1.1.5, REQID:c1a25a89-c40b-4e19-b549-b12d22ec7966, OB:0,
 LOB:
 0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTIO
 N:release,TS:45
X-CID-META: VersionHash:2a19b09, CLOUDID:c6600148-4fb1-496b-8f1d-39e733fed1ea,
 C
 OID:c54cc7f13249,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,QS:0,BEC:nil
X-UUID: 12292876a63e4114832784e67ff5dc24-20220530
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 468274590; Mon, 30 May 2022 17:34:47 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 30 May 2022 17:34:46 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 30 May 2022 17:34:46 +0800
Message-ID: <719320a455d4dc5d142cea48577c3a1b0317bb9a.camel@mediatek.com>
Subject: Re: [PATCH v10 18/21] drm/mediatek: Add mt8195 Embedded DisplayPort
 driver
From: CK Hu <ck.hu@mediatek.com>
To: Guillaume Ranquet <granquet@baylibre.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, "Kishon
 Vijay Abraham I" <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, "Helge
 Deller" <deller@gmx.de>, Jitao shi <jitao.shi@mediatek.com>
Date: Mon, 30 May 2022 17:34:46 +0800
In-Reply-To: <20220523104758.29531-19-granquet@baylibre.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
 <20220523104758.29531-19-granquet@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Guillaume:

On Mon, 2022-05-23 at 12:47 +0200, Guillaume Ranquet wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> This patch adds a DisplayPort driver for the Mediatek mt8195 SoC.
> 
> It supports the mt8195, the embedded DisplayPort units. It offers
> DisplayPort 1.4 with up to 4 lanes.
> 
> The driver creates a child device for the phy. The child device will
> never exist without the parent being active. As they are sharing a
> register range, the parent passes a regmap pointer to the child so
> that
> both can work with the same register range. The phy driver sets
> device
> data that is read by the parent to get the phy device that can be
> used
> to control the phy properties.
> 
> This driver is based on an initial version by
> Jason-JH.Lin <jason-jh.lin@mediatek.com>.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> 

[snip]

> +
> +static void mtk_dp_read_link_status(struct mtk_dp *mtk_dp,
> +				    u8
> link_status[DP_LINK_STATUS_SIZE])
> +{
> +	drm_dp_dpcd_read(&mtk_dp->aux, DP_LANE0_1_STATUS, link_status,
> +			 DP_LINK_STATUS_SIZE);
> +}
> +
> +static int mtk_dp_train_tps_1(struct mtk_dp *mtk_dp,
> +			      u8 target_lane_count, int
> *iteration_count, u8 *lane_adjust,  int *status_control, u8
> *prev_lane_adjust)
> +{
> +	int ret;
> +	u8 val;
> +	u8 link_status[DP_LINK_STATUS_SIZE] = {};
> +
> +	ret = mtk_dp_training_set_scramble(mtk_dp, false);
> +	if (ret)
> +		return ret;
> +
> +	if (*status_control == 0) {
> +		ret = mtk_dp_train_set_pattern(mtk_dp, 1);
> +		if (ret)
> +			return ret;
> +
> +		val = DP_LINK_SCRAMBLING_DISABLE |
> +			DP_TRAINING_PATTERN_1;
> +		drm_dp_dpcd_writeb(&mtk_dp->aux,
> +				   DP_TRAINING_PATTERN_SET,
> +				DP_LINK_SCRAMBLING_DISABLE |
> +				DP_TRAINING_PATTERN_1);
> +		drm_dp_dpcd_read(&mtk_dp->aux,
> +				 DP_ADJUST_REQUEST_LANE0_1,
> +				lane_adjust,
> +				sizeof(*lane_adjust) * 2);
> +
> +		mtk_dp_train_update_swing_pre(mtk_dp,
> +					      target_lane_count,
> lane_adjust);
> +		*status_control = 1;
> +		(*iteration_count)++;
> +	}
> +
> +	drm_dp_link_train_clock_recovery_delay(&mtk_dp->aux,
> +					       mtk_dp->rx_cap);
> +	mtk_dp_read_link_status(mtk_dp, link_status);

drm_dp_dpcd_read_link_status(&mtk_dp->aux, link_status);

> +
> +	if (drm_dp_clock_recovery_ok(link_status,
> +				     target_lane_count)) {
> +		mtk_dp->train_info.cr_done = true;
> +		*iteration_count = 1;
> +		dev_dbg(mtk_dp->dev, "Link train CR pass\n");
> +		return 0;
> +	} else if (*prev_lane_adjust == link_status[4]) {
> +		(*iteration_count)++;
> +		if (*prev_lane_adjust &
> DP_ADJUST_VOLTAGE_SWING_LANE0_MASK) {
> +			dev_dbg(mtk_dp->dev, "Link train CQ fail\n");
> +			return -EINVAL;
> +		}
> +	} else {
> +		*prev_lane_adjust = link_status[4];
> +	}
> +	return -EAGAIN;
> +}
> +
> +static int mtk_dp_train_tps_2_3(struct mtk_dp *mtk_dp, u8
> target_linkrate,
> +				u8 target_lane_count, int
> *iteration_count, u8 *lane_adjust,  int *status_control, u8
> *prev_lane_adjust)
> +{
> +	int ret;
> +	u8 val;
> +	u8 link_status[DP_LINK_STATUS_SIZE] = {};
> +
> +	if (*status_control == 1) {
> +		if (mtk_dp->train_info.tps4) {
> +			ret = mtk_dp_train_set_pattern(mtk_dp, 4);
> +			if (ret)
> +				return -EINVAL;
> +
> +			val = DP_TRAINING_PATTERN_4;
> +		} else if (mtk_dp->train_info.tps3) {
> +			ret = mtk_dp_train_set_pattern(mtk_dp, 3);
> +			if (ret)
> +				return -EINVAL;
> +
> +			val = DP_LINK_SCRAMBLING_DISABLE |
> +				DP_TRAINING_PATTERN_3;
> +		} else {
> +			ret = mtk_dp_train_set_pattern(mtk_dp, 2);
> +			if (ret)
> +				return -EINVAL;
> +
> +			val = DP_LINK_SCRAMBLING_DISABLE |
> +				DP_TRAINING_PATTERN_2;
> +		}
> +		drm_dp_dpcd_writeb(&mtk_dp->aux,
> +				   DP_TRAINING_PATTERN_SET,
> +				val);
> +
> +		drm_dp_dpcd_read(&mtk_dp->aux,
> +				 DP_ADJUST_REQUEST_LANE0_1,
> +				lane_adjust,
> +				sizeof(*lane_adjust) * 2);
> +
> +		mtk_dp_train_update_swing_pre(mtk_dp,
> +					      target_lane_count,
> lane_adjust);
> +		*status_control = 2;
> +		(*iteration_count)++;
> +	}
> +
> +	drm_dp_link_train_channel_eq_delay(&mtk_dp->aux,
> +					   mtk_dp->rx_cap);
> +
> +	mtk_dp_read_link_status(mtk_dp, link_status);

drm_dp_dpcd_read_link_status(&mtk_dp->aux, link_status);

Regards,
CK

> +
> +	if (!drm_dp_clock_recovery_ok(link_status,
> +				      target_lane_count)) {
> +		mtk_dp->train_info.cr_done = false;
> +		mtk_dp->train_info.eq_done = false;
> +		dev_dbg(mtk_dp->dev, "Link train EQ fail\n");
> +		return -EINVAL;
> +	}
> +
> +	if (drm_dp_channel_eq_ok(link_status,
> +				 target_lane_count)) {
> +		mtk_dp->train_info.eq_done = true;
> +		dev_dbg(mtk_dp->dev, "Link train EQ pass\n");
> +		return 0;
> +	}
> +
> +	if (*prev_lane_adjust == link_status[4])
> +		(*iteration_count)++;
> +	else
> +		*prev_lane_adjust = link_status[4];
> +
> +	return -EAGAIN;
> +}
> +
> 

