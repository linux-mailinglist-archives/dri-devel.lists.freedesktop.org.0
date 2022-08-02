Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB66587590
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 04:38:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9A331131FD;
	Tue,  2 Aug 2022 02:37:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C47E1131DF
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Aug 2022 02:37:48 +0000 (UTC)
X-UUID: 7305bfd08916458db23097bec1684a8b-20220802
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:c8efce48-b5fb-473f-a47f-10a30b19863a, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:5
X-CID-META: VersionHash:0f94e32, CLOUDID:fd1cfe24-a982-4824-82d2-9da3b6056c2a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:nil,BEC:nil,COL:0
X-UUID: 7305bfd08916458db23097bec1684a8b-20220802
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1751676348; Tue, 02 Aug 2022 10:37:42 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 2 Aug 2022 10:37:41 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 2 Aug 2022 10:37:41 +0800
Message-ID: <4d54b439fab8b888598677e1e52fb098c9b93e03.camel@mediatek.com>
Subject: Re: [PATCH v15 06/11] drm/mediatek: Add MT8195 External DisplayPort
 support
From: CK Hu <ck.hu@mediatek.com>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <matthias.bgg@gmail.com>, <deller@gmx.de>,
 <airlied@linux.ie>
Date: Tue, 2 Aug 2022 10:37:41 +0800
In-Reply-To: <20220727045035.32225-7-rex-bc.chen@mediatek.com>
References: <20220727045035.32225-1-rex-bc.chen@mediatek.com>
 <20220727045035.32225-7-rex-bc.chen@mediatek.com>
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

On Wed, 2022-07-27 at 12:50 +0800, Bo-Chen Chen wrote:
> From: Guillaume Ranquet <granquet@baylibre.com>
> 
> This patch adds External DisplayPort support to the mt8195 eDP
> driver.
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c     | 181 +++++++++++++++++++++---
> --
>  drivers/gpu/drm/mediatek/mtk_dp_reg.h |   1 +
>  2 files changed, 146 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c
> b/drivers/gpu/drm/mediatek/mtk_dp.c
> index 06eeecedd49e..ce817cb59445 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -103,6 +103,11 @@ static struct regmap_config mtk_dp_regmap_config
> = {
>  	.name = "mtk-dp-registers",
>  };
>  
> +static bool mtk_dp_is_edp(struct mtk_dp *mtk_dp)
> +{
> +	return mtk_dp->next_bridge;

For external DP, it could also connect to a bridge IC which transfer DP
to HDMI or some interface else. Use the compatible to judge this edp or
dp.

> +}
> +
>  static struct mtk_dp *mtk_dp_from_bridge(struct drm_bridge *b)
>  {
>  	return container_of(b, struct mtk_dp, bridge);
> @@ -341,6 +346,19 @@ static void mtk_dp_pg_enable(struct mtk_dp
> *mtk_dp, bool enable)
>  			   4 << PGEN_PATTERN_SEL_SHIFT,
> PGEN_PATTERN_SEL_MASK);
>  }
>  
> +static bool mtk_dp_plug_state(struct mtk_dp *mtk_dp)
> +{
> +	return mtk_dp->train_info.cable_plugged_in;
> +}
> +
> +static bool mtk_dp_plug_state_avoid_pulse(struct mtk_dp *mtk_dp)
> +{
> +	bool ret;
> +
> +	return !(readx_poll_timeout(mtk_dp_plug_state, mtk_dp, ret,
> ret,
> +				    4000, 7 * 4000));
> +}
> +
>  static void mtk_dp_aux_irq_clear(struct mtk_dp *mtk_dp)
>  {
>  	mtk_dp_write(mtk_dp, MTK_DP_AUX_P0_3640,
> @@ -778,35 +796,67 @@ static void mtk_dp_get_calibration_data(struct
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
> +	if (mtk_dp_is_edp(mtk_dp)) {
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

Why not place glb_bias_trim value in nvmem buf[3] for both edp and dp
case? Place in the same nvmem position, the driver code would be
simple. 

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

Why not place ln_tx_impsel_nmos and ln_tx_impsel_pmos value in nvmem
buf[2] for both edp and dp case? Place in the same nvmem position, the
driver code would be simple. 

> +	}
>  
>  	kfree(buf);
>  }
> @@ -926,7 +976,10 @@ static void mtk_dp_video_mute(struct mtk_dp
> *mtk_dp, bool enable)
>  			   VIDEO_MUTE_SEL_DP_ENC0_P0_MASK |
>  			   VIDEO_MUTE_SW_DP_ENC0_P0_MASK);
>  
> -	mtk_dp_sip_atf_call(mtk_dp, MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE,
> enable);
> +	mtk_dp_sip_atf_call(mtk_dp,
> +			    mtk_dp_is_edp(mtk_dp) ?
> +			    MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE :
> +			    MTK_DP_SIP_ATF_VIDEO_UNMUTE, enable);

Use of_device_get_match_data to select MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE
or MTK_DP_SIP_ATF_VIDEO_UNMUTE.

>  }
>  
>  static void mtk_dp_power_enable(struct mtk_dp *mtk_dp)
> @@ -1226,6 +1279,9 @@ static int mtk_dp_parse_capabilities(struct
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
> @@ -1277,6 +1333,9 @@ static int mtk_dp_train_start(struct mtk_dp
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
> @@ -1412,6 +1471,9 @@ static irqreturn_t mtk_dp_hpd_event_thread(int
> hpd, void *dev)
>  {
>  	struct mtk_dp *mtk_dp = dev;
>  
> +	dev_dbg(mtk_dp->dev, "drm_helper_hpd_irq_event\n");
> +	drm_helper_hpd_irq_event(mtk_dp->bridge.dev);

Because edp also have hpd interrupt, so I would like both edp and dp
have the same control flow for hdp. So move this to edp patch.

> +
>  	if (mtk_dp->train_info.hpd_inerrupt) {
>  		dev_dbg(mtk_dp->dev, "MTK_DP_HPD_INTERRUPT\n");
>  		mtk_dp->train_info.hpd_inerrupt = false;
> @@ -1452,9 +1514,20 @@ static irqreturn_t mtk_dp_hpd_event(int hpd,
> void *dev)
>  		else
>  			train_info->cable_plugged_in = false;
>  
> -		mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> -				   DP_PWR_STATE_BANDGAP_TPLL_LANE,
> -				   DP_PWR_STATE_MASK);
> +		if (!train_info->cable_plugged_in) {
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
>  	return IRQ_HANDLED;
> @@ -1499,6 +1572,24 @@ static int mtk_dp_dt_parse(struct mtk_dp
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
> +	if (mtk_dp_is_edp(mtk_dp))
> +		return connector_status_connected;

Because edp also have hpd interrupt, so I would like both edp and dp
have the same control flow for hdp. So remove this.

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
> @@ -1512,7 +1603,8 @@ static struct edid *mtk_dp_get_edid(struct
> drm_bridge *bridge,
>  	drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER,
> DP_SET_POWER_D0);
>  	usleep_range(2000, 5000);
>  
> -	new_edid = drm_get_edid(connector, &mtk_dp->aux.ddc);
> +	if (mtk_dp_plug_state(mtk_dp))
> +		new_edid = drm_get_edid(connector, &mtk_dp->aux.ddc);

Please explain why only dp has this problem. If edp also has this
problem, move this to edp patch.

Regards,
CK

>  
>  	if (!enabled)
>  		drm_bridge_chain_post_disable(bridge);
> @@ -1852,6 +1944,7 @@ static const struct drm_bridge_funcs
> mtk_dp_bridge_funcs = {
>  	.atomic_disable = mtk_dp_bridge_atomic_disable,
>  	.mode_valid = mtk_dp_bridge_mode_valid,
>  	.get_edid = mtk_dp_get_edid,
> +	.detect = mtk_dp_bdg_detect,
>  };
>  
>  static int mtk_dp_probe(struct platform_device *pdev)
> @@ -1873,9 +1966,15 @@ static int mtk_dp_probe(struct platform_device
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
> +	} else if (IS_ERR(mtk_dp->next_bridge)) {
>  		return dev_err_probe(dev, PTR_ERR(mtk_dp->next_bridge),
>  				     "Failed to get bridge\n");
> +	}
>  
>  	ret = mtk_dp_dt_parse(mtk_dp, pdev);
>  	if (ret)
> @@ -1918,7 +2017,10 @@ static int mtk_dp_probe(struct platform_device
> *pdev)
>  
>  	mtk_dp->bridge.ops =
>  		DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
> DRM_BRIDGE_OP_HPD;
> -	mtk_dp->bridge.type = DRM_MODE_CONNECTOR_eDP;
> +	if (mtk_dp_is_edp(mtk_dp))
> +		mtk_dp->bridge.type = DRM_MODE_CONNECTOR_eDP;
> +	else
> +		mtk_dp->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
>  
>  	drm_bridge_add(&mtk_dp->bridge);
>  
> @@ -1945,6 +2047,12 @@ static int mtk_dp_suspend(struct device *dev)
>  {
>  	struct mtk_dp *mtk_dp = dev_get_drvdata(dev);
>  
> +	if (mtk_dp_plug_state(mtk_dp)) {
> +		drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER,
> DP_SET_POWER_D3);
> +		/* Ensure the sink is off before shutting down power */
> +		usleep_range(2000, 3000);
> +	}
> +
>  	mtk_dp_power_disable(mtk_dp);
>  
>  	mtk_dp_hwirq_enable(mtk_dp, false);
> @@ -1978,6 +2086,7 @@ static SIMPLE_DEV_PM_OPS(mtk_dp_pm_ops,
> mtk_dp_suspend, mtk_dp_resume);
>  
>  static const struct of_device_id mtk_dp_of_match[] = {
>  	{ .compatible = "mediatek,mt8195-edp-tx" },
> +	{ .compatible = "mediatek,mt8195-dp-tx" },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, mtk_dp_of_match);
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp_reg.h
> b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
> index 4ff8e9880dc9..59086eb82868 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp_reg.h
> +++ b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
> @@ -14,6 +14,7 @@
>  #define SEC_OFFSET	0x4000
>  
>  #define MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE	(BIT(0) | BIT(5))
> +#define MTK_DP_SIP_ATF_VIDEO_UNMUTE	BIT(5)
>  
>  #define DP_PHY_GLB_BIAS_GEN_00		0
>  #define RG_XTP_GLB_BIAS_INTR_CTRL	GENMASK(20, 16)

