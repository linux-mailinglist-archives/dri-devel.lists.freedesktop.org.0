Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4125AA8B0
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 09:22:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E7B310E78B;
	Fri,  2 Sep 2022 07:22:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0079010E78B
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Sep 2022 07:22:42 +0000 (UTC)
X-UUID: 35051b864fc44fc0ab1da91be3e8e01b-20220902
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=jBUU3V4XFnZyK0U7HAevIpvYAVw8v4fGi9VKp93Zo6w=; 
 b=pNyXidXXMlC2ZvDheJW83d6iSa2UKteEBzbN9dYmiMYL1sUBZhzUy/f+2V/QJrnXjrnwK5hwLjNClR93XnRygPRH3R1yv3m1SUFH0atYcQjr+QAa5/qNyre+uxSJ4VPFDFTY1roRBhH+ngXGMV4QLz6q7WSL+qG3+d5XdMAoo64=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:42e1bdb2-12d5-43fa-a173-850779970c5c, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
 Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18, CLOUDID:1d7b6dd0-20bd-4e5e-ace8-00692b7ab380,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
 nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 35051b864fc44fc0ab1da91be3e8e01b-20220902
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1997302502; Fri, 02 Sep 2022 15:22:37 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 2 Sep 2022 15:22:36 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 2 Sep 2022 15:22:35 +0800
Message-ID: <475ece688e497d77779a29626daf9aef93dddf01.camel@mediatek.com>
Subject: Re: [PATCH v17 04/10] drm/mediatek: dp: Add multiple bridge types
 support
From: CK Hu <ck.hu@mediatek.com>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <matthias.bgg@gmail.com>, <deller@gmx.de>,
 <airlied@linux.ie>
Date: Fri, 2 Sep 2022 15:22:35 +0800
In-Reply-To: <20220901044149.16782-5-rex-bc.chen@mediatek.com>
References: <20220901044149.16782-1-rex-bc.chen@mediatek.com>
 <20220901044149.16782-5-rex-bc.chen@mediatek.com>
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

On Thu, 2022-09-01 at 12:41 +0800, Bo-Chen Chen wrote:
> The bridge types of eDP and DP are different. We add device data to
> this driver and add bridge_type to the device data to define them.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c
> b/drivers/gpu/drm/mediatek/mtk_dp.c
> index e2ec9b02b1aa..2696c1ac1a47 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -101,6 +101,7 @@ struct mtk_dp {
>  	struct drm_device *drm_dev;
>  	struct drm_dp_aux aux;
>  
> +	const struct mtk_dp_data *data;
>  	struct mtk_dp_info info;
>  	struct mtk_dp_train_info train_info;
>  
> @@ -109,6 +110,9 @@ struct mtk_dp {
>  	struct regmap *regs;
>  };
>  
> +struct mtk_dp_data {
> +	int bridge_type;
> +};
>  static const struct mtk_dp_efuse_fmt
> mtk_dp_efuse_data[MTK_DP_CAL_MAX] = {
>  	[MTK_DP_CAL_GLB_BIAS_TRIM] = {
>  		.idx = 3,
> @@ -1871,6 +1875,7 @@ static int mtk_dp_probe(struct platform_device
> *pdev)
>  		return -ENOMEM;
>  
>  	mtk_dp->dev = dev;
> +	mtk_dp->data = (struct mtk_dp_data
> *)of_device_get_match_data(dev);
>  
>  	irq_num = platform_get_irq(pdev, 0);
>  	if (irq_num < 0)
> @@ -1925,7 +1930,7 @@ static int mtk_dp_probe(struct platform_device
> *pdev)
>  
>  	mtk_dp->bridge.ops =
>  		DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
> DRM_BRIDGE_OP_HPD;
> -	mtk_dp->bridge.type = DRM_MODE_CONNECTOR_eDP;
> +	mtk_dp->bridge.type = mtk_dp->data->bridge_type;
>  
>  	drm_bridge_add(&mtk_dp->bridge);
>  
> @@ -1974,8 +1979,15 @@ static int mtk_dp_resume(struct device *dev)
>  
>  static SIMPLE_DEV_PM_OPS(mtk_dp_pm_ops, mtk_dp_suspend,
> mtk_dp_resume);
>  
> +static const struct mtk_dp_data mt8195_edp_data = {
> +	.bridge_type = DRM_MODE_CONNECTOR_eDP,
> +};
> +
>  static const struct of_device_id mtk_dp_of_match[] = {
> -	{ .compatible = "mediatek,mt8195-edp-tx" },
> +	{
> +		.compatible = "mediatek,mt8195-edp-tx",
> +		.data = &mt8195_edp_data,
> +	},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, mtk_dp_of_match);

