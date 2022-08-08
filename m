Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B85A458C23C
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 05:57:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9716714A8FF;
	Mon,  8 Aug 2022 03:56:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9E6014A90D
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 03:56:46 +0000 (UTC)
X-UUID: af5e956206154a859f2519af9cd0bb84-20220808
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=DhhuJpteKCARl6+29dVpGy2mE4S43byCxsk+XzHe+vI=; 
 b=ul9ivRcvxQmuJV8WSiZ17iKgyUD6ltfzZV4Wzbdhl9joLfGujiYOXO25c+wX/RnsTmRKcD0sHvfQAXzluTQPRBDr9F3K0mnDQDgbi0MZ0rB/k8unoFuIjCQ82Xil0rBXMnX2WNsYFGIKADg3w5MDowxMevW3J/1+CYA68WP6/ZM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:ae45cef8-719d-4c32-9673-62d4bfd5148f, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:45
X-CID-INFO: VERSION:1.1.8, REQID:ae45cef8-719d-4c32-9673-62d4bfd5148f, OB:0,
 LOB:
 0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTIO
 N:release,TS:45
X-CID-META: VersionHash:0f94e32, CLOUDID:6143fa48-f57f-4088-93dd-066979cdb4e6,
 C
 OID:b4c7827d053a,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: af5e956206154a859f2519af9cd0bb84-20220808
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 239268617; Mon, 08 Aug 2022 11:56:39 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 8 Aug 2022 11:56:38 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 8 Aug 2022 11:56:38 +0800
Message-ID: <9b39b3cebd144083e770a8d44bb275b4297d8c21.camel@mediatek.com>
Subject: Re: [PATCH v16 4/8] drm/mediatek: Add MT8195 External DisplayPort
 support
From: CK Hu <ck.hu@mediatek.com>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <matthias.bgg@gmail.com>, <deller@gmx.de>,
 <airlied@linux.ie>
Date: Mon, 8 Aug 2022 11:56:38 +0800
In-Reply-To: <20220805101459.3386-5-rex-bc.chen@mediatek.com>
References: <20220805101459.3386-1-rex-bc.chen@mediatek.com>
 <20220805101459.3386-5-rex-bc.chen@mediatek.com>
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

On Fri, 2022-08-05 at 18:14 +0800, Bo-Chen Chen wrote:
> From: Guillaume Ranquet <granquet@baylibre.com>
> 
> This patch adds External DisplayPort support to the mt8195 eDP
> driver.
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c     | 190 +++++++++++++++++++++---
> --
>  drivers/gpu/drm/mediatek/mtk_dp_reg.h |   4 +
>  2 files changed, 158 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c
> b/drivers/gpu/drm/mediatek/mtk_dp.c
> index 59fee814075b..00971ea2fadf 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -77,6 +77,7 @@ struct mtk_dp {
>  	struct dp_cal_data cal_data;
>  	u8 max_lanes;
>  	u8 max_linkrate;
> +	const struct mtk_dp_data *data;
>  
>  	struct drm_device *drm_dev;
>  	struct drm_bridge bridge;
> @@ -96,6 +97,12 @@ struct mtk_dp {
>  	struct drm_connector *conn;
>  };
>  
> +struct mtk_dp_data {
> +	int bridge_type;
> +	unsigned int smp_cmd;
> +	unsigned int cali_data_fmt;
> +};
> +
>  static struct regmap_config mtk_dp_regmap_config = {
>  	.reg_bits = 32,
>  	.val_bits = 32,
> @@ -347,6 +354,14 @@ static bool mtk_dp_plug_state(struct mtk_dp
> *mtk_dp)
>  	return mtk_dp->train_info.cable_plugged_in;
>  }
>  
> +static bool mtk_dp_plug_state_avoid_pulse(struct mtk_dp *mtk_dp)
> +{
> +	bool ret;
> +
> +	return !(readx_poll_timeout(mtk_dp_plug_state, mtk_dp, ret,
> ret,
> +				    4000, 7 * 4000));
> +}

Separate this to an independent patch which avoid pulse.

> +
>  static void mtk_dp_aux_irq_clear(struct mtk_dp *mtk_dp)
>  {
>  	mtk_dp_write(mtk_dp, MTK_DP_AUX_P0_3640,
> @@ -784,35 +799,73 @@ static void mtk_dp_get_calibration_data(struct
> mtk_dp *mtk_dp)
>  		return;
>  	}
>  
> -	cal_data->glb_bias_trim =
> -		check_cal_data_valid(mtk_dp, 1, 0x1e,
> -				     (buf[3] >> 27) & 0x1f, 0xf);
> -	cal_data->clktx_impse =
> -		check_cal_data_valid(mtk_dp, 1, 0xe,
> -				     (buf[0] >> 9) & 0xf, 0x8);
> -	cal_data->ln_tx_impsel_pmos[0] =
> -		check_cal_data_valid(mtk_dp, 1, 0xe,
> -				     (buf[2] >> 28) & 0xf, 0x8);
> -	cal_data->ln_tx_impsel_nmos[0] =
> -		check_cal_data_valid(mtk_dp, 1, 0xe,
> -				     (buf[2] >> 24) & 0xf, 0x8);
> -	cal_data->ln_tx_impsel_pmos[1] =
> -		check_cal_data_valid(mtk_dp, 1, 0xe,
> -				     (buf[2] >> 20) & 0xf, 0x8);
> -	cal_data->ln_tx_impsel_nmos[1] =
> -		check_cal_data_valid(mtk_dp, 1, 0xe,
> -				     (buf[2] >> 16) & 0xf, 0x8);
> -	cal_data->ln_tx_impsel_pmos[2] =
> -		check_cal_data_valid(mtk_dp, 1, 0xe,
> -				     (buf[2] >> 12) & 0xf, 0x8);
> -	cal_data->ln_tx_impsel_nmos[2] =
> -		check_cal_data_valid(mtk_dp, 1, 0xe,
> -				     (buf[2] >> 8) & 0xf, 0x8);
> -	cal_data->ln_tx_impsel_pmos[3] =
> -		check_cal_data_valid(mtk_dp, 1, 0xe,
> -				     (buf[2] >> 4) & 0xf, 0x8);
> -	cal_data->ln_tx_impsel_nmos[3] =
> -		check_cal_data_valid(mtk_dp, 1, 0xe, buf[2] & 0xf,
> 0x8);
> +	/*
> +	 * To save the efuse bits, we place the calibration data for DP
> and eDP
> +	 * using method which could save the efuse bits. For this, the
> efuse
> +	 * orders of DP and eDP are different.
> +	 */
> +
> +	if (mtk_dp->data->cali_data_fmt ==
> MTK_DP_CALI_DATA_FMT_MT8195_EDP) {

Separate this to an independent patch which support different
cali_data_fmt.

> +		cal_data->glb_bias_trim =
> +			check_cal_data_valid(mtk_dp, 1, 0x1e,
> +					     (buf[3] >> 27) & 0x1f,
> 0xf);
> +		cal_data->clktx_impse =
> +			check_cal_data_valid(mtk_dp, 1, 0xe,
> +					     (buf[0] >> 9) & 0xf, 0x8);
> +		cal_data->ln_tx_impsel_pmos[0] =
> +			check_cal_data_valid(mtk_dp, 1, 0xe,
> +					     (buf[2] >> 28) & 0xf,
> 0x8);
> +		cal_data->ln_tx_impsel_nmos[0] =
> +			check_cal_data_valid(mtk_dp, 1, 0xe,
> +					     (buf[2] >> 24) & 0xf,
> 0x8);
> +		cal_data->ln_tx_impsel_pmos[1] =
> +			check_cal_data_valid(mtk_dp, 1, 0xe,
> +					     (buf[2] >> 20) & 0xf,
> 0x8);
> +		cal_data->ln_tx_impsel_nmos[1] =
> +			check_cal_data_valid(mtk_dp, 1, 0xe,
> +					     (buf[2] >> 16) & 0xf,
> 0x8);
> +		cal_data->ln_tx_impsel_pmos[2] =
> +			check_cal_data_valid(mtk_dp, 1, 0xe,
> +					     (buf[2] >> 12) & 0xf,
> 0x8);
> +		cal_data->ln_tx_impsel_nmos[2] =
> +			check_cal_data_valid(mtk_dp, 1, 0xe,
> +					     (buf[2] >> 8) & 0xf, 0x8);
> +		cal_data->ln_tx_impsel_pmos[3] =
> +			check_cal_data_valid(mtk_dp, 1, 0xe,
> +					     (buf[2] >> 4) & 0xf, 0x8);
> +		cal_data->ln_tx_impsel_nmos[3] =
> +			check_cal_data_valid(mtk_dp, 1, 0xe, buf[2] &
> 0xf, 0x8);
> +	} else {
> +		cal_data->glb_bias_trim =
> +			check_cal_data_valid(mtk_dp, 1, 0x1e,
> +					     (buf[0] >> 27) & 0x1f,
> 0xf);
> +		cal_data->clktx_impse =
> +			check_cal_data_valid(mtk_dp, 1, 0xe,
> +					     (buf[0] >> 13) & 0xf,
> 0x8);
> +		cal_data->ln_tx_impsel_pmos[0] =
> +			check_cal_data_valid(mtk_dp, 1, 0xe,
> +					     (buf[1] >> 28) & 0xf,
> 0x8);
> +		cal_data->ln_tx_impsel_nmos[0] =
> +			check_cal_data_valid(mtk_dp, 1, 0xe,
> +					     (buf[1] >> 24) & 0xf,
> 0x8);
> +		cal_data->ln_tx_impsel_pmos[1] =
> +			check_cal_data_valid(mtk_dp, 1, 0xe,
> +					     (buf[1] >> 20) & 0xf,
> 0x8);
> +		cal_data->ln_tx_impsel_nmos[1] =
> +			check_cal_data_valid(mtk_dp, 1, 0xe,
> +					     (buf[1] >> 16) & 0xf,
> 0x8);
> +		cal_data->ln_tx_impsel_pmos[2] =
> +			check_cal_data_valid(mtk_dp, 1, 0xe,
> +					     (buf[1] >> 12) & 0xf,
> 0x8);
> +		cal_data->ln_tx_impsel_nmos[2] =
> +			check_cal_data_valid(mtk_dp, 1, 0xe,
> +					     (buf[1] >> 8) & 0xf, 0x8);
> +		cal_data->ln_tx_impsel_pmos[3] =
> +			check_cal_data_valid(mtk_dp, 1, 0xe,
> +					     (buf[1] >> 4) & 0xf, 0x8);
> +		cal_data->ln_tx_impsel_nmos[3] =
> +			check_cal_data_valid(mtk_dp, 1, 0xe, buf[1] &
> 0xf, 0x8);
> +	}
>  
>  	kfree(buf);
>  }
> @@ -932,7 +985,7 @@ static void mtk_dp_video_mute(struct mtk_dp
> *mtk_dp, bool enable)
>  			   VIDEO_MUTE_SEL_DP_ENC0_P0_MASK |
>  			   VIDEO_MUTE_SW_DP_ENC0_P0_MASK);
>  
> -	mtk_dp_sip_atf_call(mtk_dp, MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE,
> enable);
> +	mtk_dp_sip_atf_call(mtk_dp, mtk_dp->data->smp_cmd, enable);

Separate this to an independent patch which support different smp_cmd.

>  }
>  
>  static void mtk_dp_power_enable(struct mtk_dp *mtk_dp)
> @@ -1232,6 +1285,9 @@ static int mtk_dp_parse_capabilities(struct
> mtk_dp *mtk_dp)
>  	drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER,
> DP_SET_POWER_D0);
>  	usleep_range(2000, 5000);
>  
> +	if (!mtk_dp_plug_state(mtk_dp))
> +		return -ENODEV;
> +
>  	drm_dp_read_dpcd_caps(&mtk_dp->aux, mtk_dp->rx_cap);
>  
>  	train_info->link_rate = min_t(int, mtk_dp->max_linkrate,
> @@ -1283,6 +1339,9 @@ static int mtk_dp_train_start(struct mtk_dp
> *mtk_dp)
>  	u8 train_limit;
>  	u8 max_link_rate;
>  
> +	if (!mtk_dp_plug_state_avoid_pulse(mtk_dp))
> +		return -ENODEV;
> +
>  	link_rate = mtk_dp->rx_cap[1];
>  	lane_count = mtk_dp->rx_cap[2] & 0x1F;
>  
> @@ -1457,9 +1516,20 @@ static irqreturn_t mtk_dp_hpd_event(int hpd,
> void *dev)
>  	else
>  		train_info->cable_plugged_in = false;
>  
> -	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> -			   DP_PWR_STATE_BANDGAP_TPLL_LANE,
> -			   DP_PWR_STATE_MASK);
> +	if (!train_info->cable_plugged_in) {
> +		mtk_dp_video_mute(mtk_dp, true);
> +
> +		mtk_dp_initialize_priv_data(mtk_dp);
> +		mtk_dp_set_idle_pattern(mtk_dp, true);
> +
> +		mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> +				   DP_PWR_STATE_BANDGAP_TPLL,
> +				   DP_PWR_STATE_MASK);
> +	} else {
> +		mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> +				   DP_PWR_STATE_BANDGAP_TPLL_LANE,
> +				   DP_PWR_STATE_MASK);
> +	}

Separate this to an independent patch.

>  
>  	return IRQ_HANDLED;
>  }
> @@ -1503,6 +1573,21 @@ static int mtk_dp_dt_parse(struct mtk_dp
> *mtk_dp,
>  	return 0;
>  }
>  
> +static enum drm_connector_status mtk_dp_bdg_detect(struct drm_bridge
> *bridge)
> +{
> +	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
> +	enum drm_connector_status ret = connector_status_disconnected;
> +	u8 sink_count = 0;
> +
> +	if (mtk_dp_plug_state_avoid_pulse(mtk_dp)) {
> +		drm_dp_dpcd_readb(&mtk_dp->aux, DP_SINK_COUNT,
> &sink_count);
> +		if (DP_GET_SINK_COUNT(sink_count))
> +			ret = connector_status_connected;
> +	}
> +
> +	return ret;
> +}
> +
>  static struct edid *mtk_dp_get_edid(struct drm_bridge *bridge,
>  				    struct drm_connector *connector)
>  {
> @@ -1857,6 +1942,7 @@ static const struct drm_bridge_funcs
> mtk_dp_bridge_funcs = {
>  	.atomic_disable = mtk_dp_bridge_atomic_disable,
>  	.mode_valid = mtk_dp_bridge_mode_valid,
>  	.get_edid = mtk_dp_get_edid,
> +	.detect = mtk_dp_bdg_detect,
>  };
>  
>  static int mtk_dp_probe(struct platform_device *pdev)
> @@ -1871,6 +1957,7 @@ static int mtk_dp_probe(struct platform_device
> *pdev)
>  		return -ENOMEM;
>  
>  	mtk_dp->dev = dev;
> +	mtk_dp->data = (struct mtk_dp_data
> *)of_device_get_match_data(dev);
>  
>  	irq_num = platform_get_irq(pdev, 0);
>  	if (irq_num < 0)
> @@ -1878,9 +1965,15 @@ static int mtk_dp_probe(struct platform_device
> *pdev)
>  				     "failed to request dp irq
> resource\n");
>  
>  	mtk_dp->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 
> 1, 0);
> -	if (IS_ERR(mtk_dp->next_bridge))
> +	if (IS_ERR(mtk_dp->next_bridge) &&
> +	    PTR_ERR(mtk_dp->next_bridge) == -ENODEV) {
> +		dev_info(dev,
> +			 "No panel connected in devicetree, continue as
> external DP\n");
> +		mtk_dp->next_bridge = NULL;

Separate this to an independent patch.

> +	} else if (IS_ERR(mtk_dp->next_bridge)) {
>  		return dev_err_probe(dev, PTR_ERR(mtk_dp->next_bridge),
>  				     "Failed to get bridge\n");
> +	}
>  
>  	ret = mtk_dp_dt_parse(mtk_dp, pdev);
>  	if (ret)
> @@ -1923,7 +2016,7 @@ static int mtk_dp_probe(struct platform_device
> *pdev)
>  
>  	mtk_dp->bridge.ops =
>  		DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
> DRM_BRIDGE_OP_HPD;
> -	mtk_dp->bridge.type = DRM_MODE_CONNECTOR_eDP;
> +	mtk_dp->bridge.type = mtk_dp->data->bridge_type;

Separate this to an independent patch which add bridge_type to support
multiple bridge type.

>  
>  	drm_bridge_add(&mtk_dp->bridge);
>  
> @@ -1950,6 +2043,12 @@ static int mtk_dp_suspend(struct device *dev)
>  {
>  	struct mtk_dp *mtk_dp = dev_get_drvdata(dev);
>  
> +	if (mtk_dp_plug_state(mtk_dp)) {
> +		drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER,
> DP_SET_POWER_D3);
> +		/* Ensure the sink is off before shutting down power */
> +		usleep_range(2000, 3000);
> +	}

Separate this to an independent patch which ensure the sink is off
before shutting down power.

> +
>  	mtk_dp_power_disable(mtk_dp);
>  
>  	mtk_dp_hwirq_enable(mtk_dp, false);
> @@ -1981,8 +2080,27 @@ static int mtk_dp_resume(struct device *dev)
>  
>  static SIMPLE_DEV_PM_OPS(mtk_dp_pm_ops, mtk_dp_suspend,
> mtk_dp_resume);
>  
> +static const struct mtk_dp_data mt8195_edp_data = {
> +	.bridge_type = DRM_MODE_CONNECTOR_eDP,
> +	.smp_cmd = MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE,
> +	.cali_data_fmt = MTK_DP_CALI_DATA_FMT_MT8195_EDP,
> +};
> +
> +static const struct mtk_dp_data mt8195_dp_data = {
> +	.bridge_type = DRM_MODE_CONNECTOR_DisplayPort,
> +	.smp_cmd = MTK_DP_SIP_ATF_VIDEO_UNMUTE,
> +	.cali_data_fmt = MTK_DP_CALI_DATA_FMT_MT8195_DP,
> +};
> +
>  static const struct of_device_id mtk_dp_of_match[] = {
> -	{ .compatible = "mediatek,mt8195-edp-tx" },
> +	{
> +		.compatible = "mediatek,mt8195-edp-tx",
> +		.data = &mt8195_edp_data,
> +	},
> +	{
> +		.compatible = "mediatek,mt8195-dp-tx",
> +		.data = &mt8195_dp_data,
> +	},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, mtk_dp_of_match);
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp_reg.h
> b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
> index 3676d71bd816..c12742adaa3c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp_reg.h
> +++ b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
> @@ -14,6 +14,10 @@
>  #define SEC_OFFSET	0x4000
>  
>  #define MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE	(BIT(0) | BIT(5))
> +#define MTK_DP_SIP_ATF_VIDEO_UNMUTE	BIT(5)
> +
> +#define MTK_DP_CALI_DATA_FMT_MT8195_EDP	0
> +#define MTK_DP_CALI_DATA_FMT_MT8195_DP	1

This is not register definition, so move to mtk_dp.c

Regards,
CK

>  
>  #define DP_PHY_GLB_BIAS_GEN_00		0
>  #define RG_XTP_GLB_BIAS_INTR_CTRL	GENMASK(20, 16)

