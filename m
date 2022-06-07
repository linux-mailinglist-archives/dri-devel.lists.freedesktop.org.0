Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2BC53F791
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 09:47:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0AD711A834;
	Tue,  7 Jun 2022 07:47:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7918E11A834
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 07:47:12 +0000 (UTC)
X-UUID: 54eab18635594d2d9b7003c83070b772-20220607
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:7be55fc0-ff08-4e14-85f1-1cc70b81aeb2, OB:10,
 L
 OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:45
X-CID-INFO: VERSION:1.1.5, REQID:7be55fc0-ff08-4e14-85f1-1cc70b81aeb2, OB:10,
 LOB
 :0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:45
X-CID-META: VersionHash:2a19b09, CLOUDID:a2a4e8e4-2ba2-4dc1-b6c5-11feb6c769e0,
 C
 OID:f74822fd2579,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,QS:0,BEC:nil
X-UUID: 54eab18635594d2d9b7003c83070b772-20220607
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 460672927; Tue, 07 Jun 2022 15:47:09 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Tue, 7 Jun 2022 15:47:07 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 7 Jun 2022 15:47:07 +0800
Message-ID: <f791f46c6307a18818574cb7fb8653bcc84aa9ad.camel@mediatek.com>
Subject: Re: [PATCH v10 18/21] drm/mediatek: Add mt8195 Embedded DisplayPort
 driver
From: CK Hu <ck.hu@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, Guillaume Ranquet
 <granquet@baylibre.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, "Daniel
 Vetter" <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, "Kishon
 Vijay Abraham I" <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, "Helge
 Deller" <deller@gmx.de>, Jitao shi <jitao.shi@mediatek.com>
Date: Tue, 7 Jun 2022 15:47:07 +0800
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

Hi, Rex:

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

[snip]

> +
> +static int mtk_dp_hpd_sink_event(struct mtk_dp *mtk_dp)
> +{
> +	ssize_t ret;
> +	u8 sink_count;
> +	bool locked;
> +	u8 link_status[DP_LINK_STATUS_SIZE] = {};
> +	u32 sink_count_reg = DP_SINK_COUNT_ESI;
> +	u32 link_status_reg = DP_LANE0_1_STATUS;
> +
> +	ret = drm_dp_dpcd_readb(&mtk_dp->aux, sink_count_reg,
> &sink_count);
> +	if (ret < 0) {
> +		drm_err(mtk_dp->drm_dev, "Read sink count failed:
> %ld\n", ret);
> +		return ret;
> +	}
> +
> +	ret = drm_dp_dpcd_read(&mtk_dp->aux, link_status_reg,
> link_status,
> +			       sizeof(link_status));
> +	if (!ret) {
> +		drm_err(mtk_dp->drm_dev, "Read link status failed:
> %ld\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	locked = drm_dp_channel_eq_ok(link_status,
> +				      mtk_dp->train_info.lane_count);
> +	if (!locked && mtk_dp->train_state >
> MTK_DP_TRAIN_STATE_TRAINING_PRE)

Before enter this function, mtk_dp->train_state is set to
MTK_DP_TRAIN_STATE_STARTUP, so this never happen, drop this.

> +		mtk_dp->train_state = MTK_DP_TRAIN_STATE_TRAINING_PRE;
> +
> +	if (link_status[1] & DP_REMOTE_CONTROL_COMMAND_PENDING)
> +		drm_dp_dpcd_writeb(&mtk_dp->aux,
> DP_DEVICE_SERVICE_IRQ_VECTOR,
> +				   DP_REMOTE_CONTROL_COMMAND_PENDING);
> +
> +	if (DP_GET_SINK_COUNT(sink_count) &&
> +	    (link_status[2] & DP_DOWNSTREAM_PORT_STATUS_CHANGED)) {
> +		mtk_dp->train_info.check_cap_count = 0;
> +		mtk_dp->train_state = MTK_DP_TRAIN_STATE_CHECKEDID;

Why change state from MTK_DP_TRAIN_STATE_STARTUP to
MTK_DP_TRAIN_STATE_CHECKEDID? In mtk_dp_train_handler(),
mtk_dp_parse_capabilities() is true then change to
MTK_DP_TRAIN_STATE_CHECKEDID. Give a reason why these two are
different.

Regards,
CK

> +		msleep(20);
> +	}
> +
> +	return 0;
> +}
> +

