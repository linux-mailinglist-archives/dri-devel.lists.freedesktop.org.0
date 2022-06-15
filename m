Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B5B54C234
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 08:52:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B92C10F055;
	Wed, 15 Jun 2022 06:52:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFCB010F055
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 06:52:30 +0000 (UTC)
X-UUID: d3299b6dc23f4adc9f40f3122bea368d-20220615
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6, REQID:a7a5cc91-7725-45fc-890a-77bc8eab09f0, OB:0,
 LO
 B:10,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:45
X-CID-INFO: VERSION:1.1.6, REQID:a7a5cc91-7725-45fc-890a-77bc8eab09f0, OB:0,
 LOB:
 10,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:45
X-CID-META: VersionHash:b14ad71, CLOUDID:7d398d48-4c92-421c-ad91-b806c0f58b2a,
 C
 OID:2235acb4fbb3,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: d3299b6dc23f4adc9f40f3122bea368d-20220615
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 930044266; Wed, 15 Jun 2022 14:52:27 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Wed, 15 Jun 2022 14:52:25 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 15 Jun 2022 14:52:25 +0800
Message-ID: <f8fbd1b522c3ecfbdacc290f028126045d9c0dc8.camel@mediatek.com>
Subject: Re: [PATCH v11 05/10] drm/mediatek: Add MT8195 Embedded DisplayPort
 driver
From: CK Hu <ck.hu@mediatek.com>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <matthias.bgg@gmail.com>, <deller@gmx.de>,
 <airlied@linux.ie>
Date: Wed, 15 Jun 2022 14:52:25 +0800
In-Reply-To: <20220610105522.13449-6-rex-bc.chen@mediatek.com>
References: <20220610105522.13449-1-rex-bc.chen@mediatek.com>
 <20220610105522.13449-6-rex-bc.chen@mediatek.com>
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
 granquet@baylibre.com, jitao.shi@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, msp@baylibre.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, wenst@chromium.org,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Bo-Chen:

On Fri, 2022-06-10 at 18:55 +0800, Bo-Chen Chen wrote:
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
> [Bo-Chen: Cleanup the drivers and modify comments from reviewers]
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---

[snip]

> +
> +static int mtk_dp_train_start(struct mtk_dp *mtk_dp)
> +{
> +	int ret = 0;
> +	u8 lane_count;
> +	u8 link_rate;
> +	u8 train_limit;
> +	u8 max_link_rate;
> +
> +	link_rate = mtk_dp->rx_cap[1];
> +	lane_count = mtk_dp->rx_cap[2] & 0x1F;
> +
> +	mtk_dp->train_info.link_rate = min(mtk_dp->max_linkrate,
> link_rate);
> +	mtk_dp->train_info.lane_count = min(mtk_dp->max_lanes,
> lane_count);
> +	link_rate = mtk_dp->train_info.link_rate;
> +	lane_count = mtk_dp->train_info.lane_count;
> +
> +	switch (link_rate) {
> +	case MTK_DP_LINKRATE_RBR:
> +	case MTK_DP_LINKRATE_HBR:
> +	case MTK_DP_LINKRATE_HBR2:
> +	case MTK_DP_LINKRATE_HBR25:
> +	case MTK_DP_LINKRATE_HBR3:
> +		break;
> +	default:
> +		mtk_dp->train_info.link_rate = MTK_DP_LINKRATE_HBR3;
> +		break;
> +	};
> +
> +	max_link_rate = link_rate;
> +	for (train_limit = 6; train_limit > 0; train_limit--) {
> +		mtk_dp->train_info.cr_done = false;
> +		mtk_dp->train_info.eq_done = false;
> +
> +		mtk_dp_train_change_mode(mtk_dp);
> +		ret = mtk_dp_train_flow(mtk_dp, link_rate, lane_count);
> +		if (ret)
> +			return ret;
> +
> +		if (!mtk_dp->train_info.cr_done) {

When mtk_dp_train_flow() return 0, it imply train_info.cr_done is true,
isn't it?

> +			switch (link_rate) {
> +			case MTK_DP_LINKRATE_RBR:
> +				lane_count = lane_count / 2;
> +				link_rate = max_link_rate;
> +				if (lane_count == 0)
> +					return -EIO;
> +				break;
> +			case MTK_DP_LINKRATE_HBR:
> +				link_rate = MTK_DP_LINKRATE_RBR;
> +				break;
> +			case MTK_DP_LINKRATE_HBR2:
> +				link_rate = MTK_DP_LINKRATE_HBR;
> +				break;
> +			case MTK_DP_LINKRATE_HBR3:
> +				link_rate = MTK_DP_LINKRATE_HBR2;
> +				break;
> +			default:
> +				return -EINVAL;
> +			};
> +		} else if (!mtk_dp->train_info.eq_done) {

When mtk_dp_train_flow() return 0, it imply train_info.eq_done is true,
isn't it?

Regards,
CK

> +			if (lane_count == 0)
> +				return -EIO;
> +
> +			lane_count /= 2;
> +		} else {
> +			break;
> +		}
> +	}
> +
> +	if (train_limit == 0)
> +		return -ETIMEDOUT;
> +
> +	return 0;
> +}

