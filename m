Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8A457FCB3
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 11:51:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 517FC18AA78;
	Mon, 25 Jul 2022 09:51:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A4E010E6C6
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 09:51:18 +0000 (UTC)
X-UUID: ae0c1fc3a6f64bfd8b86a4940db392a4-20220725
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:315449f2-28d8-481d-b6b7-0a706ad04402, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:5
X-CID-META: VersionHash:0f94e32, CLOUDID:7c1edfd3-912a-458b-a623-74f605a77e93,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:nil,BEC:nil,COL:0
X-UUID: ae0c1fc3a6f64bfd8b86a4940db392a4-20220725
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1604583661; Mon, 25 Jul 2022 17:51:12 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 25 Jul 2022 17:51:11 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 25 Jul 2022 17:51:11 +0800
Message-ID: <f0c930400e4a5b3723df2d257cc4bc51ee7a2806.camel@mediatek.com>
Subject: Re: [PATCH v14 06/10] drm/mediatek: Add MT8195 External DisplayPort
 support
From: CK Hu <ck.hu@mediatek.com>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <matthias.bgg@gmail.com>, <deller@gmx.de>,
 <airlied@linux.ie>
Date: Mon, 25 Jul 2022 17:51:11 +0800
In-Reply-To: <20220712111223.13080-7-rex-bc.chen@mediatek.com>
References: <20220712111223.13080-1-rex-bc.chen@mediatek.com>
 <20220712111223.13080-7-rex-bc.chen@mediatek.com>
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
> From: Guillaume Ranquet <granquet@baylibre.com>
> 
> This patch adds External DisplayPort support to the mt8195 eDP
> driver.
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---

[snip]

> @@ -1489,13 +1543,34 @@ static int mtk_dp_init_port(struct mtk_dp
> *mtk_dp)
>  static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
>  {
>  	struct mtk_dp *mtk_dp = dev;
> +	int event;
> +
> +	event = mtk_dp_plug_state(mtk_dp) ?
> +		connector_status_connected :
> connector_status_disconnected;
> +
> +	if (event < 0)
> +		return IRQ_HANDLED;

event is useless, so drop it.

Regards,
CK

> +
> +	dev_dbg(mtk_dp->dev, "drm_helper_hpd_irq_event\n");
> +	drm_helper_hpd_irq_event(mtk_dp->bridge.dev);
>  
>  	if (mtk_dp->train_info.cable_state_change) {
>  		mtk_dp->train_info.cable_state_change = false;
>  
> -		mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> -				   DP_PWR_STATE_BANDGAP_TPLL_LANE,
> -				   DP_PWR_STATE_MASK);
> +		if (!mtk_dp->train_info.cable_plugged_in) {
> +			mtk_dp_video_mute(mtk_dp, true);
> +
> +			mtk_dp_initialize_priv_data(mtk_dp);
> +			mtk_dp_set_idle_pattern(mtk_dp, true);
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
> +		}
>  	}
>  
>  	if (mtk_dp->train_info.irq_sta.hpd_inerrupt) {
> @@ -1597,6 +1672,24 @@ static int mtk_dp_dt_parse(struct mtk_dp
> *mtk_dp,
>  	return 0;
>  }
>  

