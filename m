Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3E95730E3
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 10:22:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A37199654B;
	Wed, 13 Jul 2022 08:22:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E36139652C
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jul 2022 08:22:19 +0000 (UTC)
X-UUID: a43b601f061e426a85f8b533d8140218-20220713
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:60600421-3364-45f5-a5f9-953964b8a25a, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:54,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:54
X-CID-INFO: VERSION:1.1.8, REQID:60600421-3364-45f5-a5f9-953964b8a25a, OB:0,
 LOB:
 0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:54,FILE:0,RULE:Release_HamU,ACTI
 ON:release,TS:54
X-CID-META: VersionHash:0f94e32, CLOUDID:850e5dd7-5d6d-4eaf-a635-828a3ee48b7c,
 C
 OID:1182dfb5da53,Recheck:0,SF:28|16|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: a43b601f061e426a85f8b533d8140218-20220713
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 253897115; Wed, 13 Jul 2022 16:22:16 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Wed, 13 Jul 2022 16:22:15 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 13 Jul 2022 16:22:15 +0800
Message-ID: <6ba15d8532b726bd1a16cf2956140b2cba5d74f7.camel@mediatek.com>
Subject: Re: [PATCH v14 05/10] drm/mediatek: Add MT8195 Embedded DisplayPort
 driver
From: CK Hu <ck.hu@mediatek.com>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <matthias.bgg@gmail.com>, <deller@gmx.de>,
 <airlied@linux.ie>
Date: Wed, 13 Jul 2022 16:22:15 +0800
In-Reply-To: <20220712111223.13080-6-rex-bc.chen@mediatek.com>
References: <20220712111223.13080-1-rex-bc.chen@mediatek.com>
 <20220712111223.13080-6-rex-bc.chen@mediatek.com>
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
 granquet@baylibre.com, jitao.shi@mediatek.com, liangxu.xu@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 msp@baylibre.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, wenst@chromium.org,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Bo-Chen:

On Tue, 2022-07-12 at 19:12 +0800, Bo-Chen Chen wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> This patch adds a embedded displayport driver for the MediaTek mt8195
> SoC.
> 
> It supports the MT8195, the embedded DisplayPort units. It offers
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
> Jitao shi <jitao.shi@mediatek.com>
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---

[snip]

> +
> +static int mtk_dp_bridge_atomic_check(struct drm_bridge *bridge,
> +				      struct drm_bridge_state
> *bridge_state,
> +				      struct drm_crtc_state
> *crtc_state,
> +				      struct drm_connector_state
> *conn_state)
> +{
> +	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
> +	struct drm_crtc *crtc = conn_state->crtc;
> +	unsigned int input_bus_format;
> +
> +	input_bus_format = bridge_state->input_bus_cfg.format;
> +
> +	dev_dbg(mtk_dp->dev, "input format 0x%04x, output format
> 0x%04x\n",
> +		bridge_state->input_bus_cfg.format,
> +		 bridge_state->output_bus_cfg.format);
> +
> +	if (input_bus_format == MEDIA_BUS_FMT_YUYV8_1X16)
> +		mtk_dp->info.format = DP_PIXELFORMAT_YUV422;
> +	else
> +		mtk_dp->info.format = DP_PIXELFORMAT_RGB;
> +
> +	if (!crtc) {
> +		drm_err(mtk_dp->drm_dev,
> +			"Can't enable bridge as connector state doesn't
> have a crtc\n");
> +		return -EINVAL;
> +	}
> +
> +	mtk_dp_parse_drm_mode_timings(mtk_dp, &crtc_state-
> >adjusted_mode);
> +	if (mtk_dp_parse_capabilities(mtk_dp)) {

mtk_dp_bridge_atomic_enable() would call mtk_dp_parse_capabilities(),
so this is redundant.

Regards,
CK

> +		drm_err(mtk_dp->drm_dev,
> +			"Can't enable bridge as nothing is plugged
> in\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +

