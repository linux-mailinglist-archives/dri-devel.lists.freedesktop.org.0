Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C7E53368C
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 07:47:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A054E1125DE;
	Wed, 25 May 2022 05:47:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF83A1125DE
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 05:47:49 +0000 (UTC)
X-UUID: 9cdba63d1bd644c9b884b8750030e4a9-20220525
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:1a7feff1-630d-461f-8014-f945a40c480e, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:5
X-CID-META: VersionHash:2a19b09, CLOUDID:4e2a6147-4fb1-496b-8f1d-39e733fed1ea,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: 9cdba63d1bd644c9b884b8750030e4a9-20220525
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1984232510; Wed, 25 May 2022 13:47:43 +0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 25 May 2022 13:47:41 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 May 2022 13:47:41 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 25 May 2022 13:47:41 +0800
Message-ID: <eaed852506a753629d0d76334664c51d98477d14.camel@mediatek.com>
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
Date: Wed, 25 May 2022 13:47:41 +0800
In-Reply-To: <20220523104758.29531-19-granquet@baylibre.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
 <20220523104758.29531-19-granquet@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
> ---
>  

[snip]

> +
> +static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)

I don't have a DP spec. I find one in [1] but I'm not sure it's real
spec or not. If it's real, in section 3.1.3.2, it describe:

3.1.3.2 Hot Plug/Unplug Detection
One signal (HPD) is used by a device (an Upstream device) to detect
that a Downstream port on the device has been connected to another
device (the Downstream device). Implementation of HPD is optional for
an embedded link configuration. At least a “trickle power” must be
present both in the Upstream and Downstream devices for a Hot Plug
event to be detected. 

I focus on the statement "Implementation of HPD is optional for an
embedded link configuration". I'm not sure what does 'optional' mean.
Does it mean eDP panel without HPD signal is possible? If so, I think
driver should support eDP panel without HPD signal. Maybe I
misunderstanding this spec. Please explain for me.

Regards,
CK


[1] https://glenwing.github.io/docs/DP-1.2.pdf

> +{
> +	struct mtk_dp *mtk_dp = dev;
> +	int event;
> +	u8 buf[DP_RECEIVER_CAP_SIZE] = {};
> +
> +	event = mtk_dp_plug_state(mtk_dp) ? connector_status_connected
> :
> +						  connector_status_disc
> onnected;
> +
> +	if (event < 0)
> +		return IRQ_HANDLED;
> +
> +	if (mtk_dp->drm_dev) {
> +		dev_info(mtk_dp->dev, "drm_helper_hpd_irq_event\n");
> +		drm_helper_hpd_irq_event(mtk_dp->bridge.dev);
> +	}
> +
> +	if (mtk_dp->train_info.cable_state_change) {
> +		mtk_dp->train_info.cable_state_change = false;
> +
> +		mtk_dp->train_state = MTK_DP_TRAIN_STATE_STARTUP;
> +
> +		if (!mtk_dp->train_info.cable_plugged_in ||
> +		    !mtk_dp_plug_state(mtk_dp)) {
> +			mtk_dp_video_mute(mtk_dp, true);
> +
> +			mtk_dp_initialize_priv_data(mtk_dp);
> +			mtk_dp_set_idle_pattern(mtk_dp, true);
> +			if (mtk_dp->has_fec)
> +				mtk_dp_fec_enable(mtk_dp, false);
> +
> +			mtk_dp_update_bits(mtk_dp,
> MTK_DP_TOP_PWR_STATE,
> +					   DP_PWR_STATE_BANDGAP_TPLL,
> +					   DP_PWR_STATE_MASK);
> +		} else {
> +			mtk_dp_update_bits(mtk_dp,
> MTK_DP_TOP_PWR_STATE,
> +					   DP_PWR_STATE_BANDGAP_TPLL_LA
> NE,
> +					   DP_PWR_STATE_MASK);
> +			drm_dp_read_dpcd_caps(&mtk_dp->aux, buf);
> +			mtk_dp->train_info.link_rate =
> +				min_t(int, mtk_dp->max_linkrate,
> +				      buf[mtk_dp->max_linkrate]);
> +			mtk_dp->train_info.lane_count =
> +				min_t(int, mtk_dp->max_lanes,
> +				      drm_dp_max_lane_count(buf));
> +		}
> +	}
> +
> +	if (mtk_dp->train_info.irq_status & MTK_DP_HPD_INTERRUPT) {
> +		dev_dbg(mtk_dp->dev, "MTK_DP_HPD_INTERRUPT\n");
> +		mtk_dp->train_info.irq_status &= ~MTK_DP_HPD_INTERRUPT;
> +		mtk_dp_hpd_sink_event(mtk_dp);
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +

