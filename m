Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E925C1228E0
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 11:32:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD0FB6E99E;
	Tue, 17 Dec 2019 10:32:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 480 seconds by postgrey-1.36 at gabe;
 Mon, 16 Dec 2019 12:16:05 UTC
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1A7D6E0BC
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 12:16:05 +0000 (UTC)
Received: from localhost (unknown [192.168.167.235])
 by lucky1.263xmail.com (Postfix) with ESMTP id 870654C155;
 Mon, 16 Dec 2019 20:00:33 +0800 (CST)
X-MAIL-GRAY: 1
X-MAIL-DELIVERY: 0
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [172.16.12.170] (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P6439T140595418887936S1576497632255958_; 
 Mon, 16 Dec 2019 20:00:33 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <fe66bc1cc6d4f292d8f04f4015343336>
X-RL-SENDER: andy.yan@rock-chips.com
X-SENDER: yxj@rock-chips.com
X-LOGIN-NAME: andy.yan@rock-chips.com
X-FST-TO: linux-arm-kernel@lists.infradead.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
Subject: =?UTF-8?Q?Re=3a_=5bPATCH_09/12=5d_drm/rockchip=3a_lvds=3a_Add_PX30_?=
 =?UTF-8?B?c3VwcG9ydOOAkOivt+azqOaEj++8jOmCruS7tueUsWxpbnV4LXJvY2tjaGlwLWJv?=
 =?UTF-8?Q?unces+andy=2eyan=3drock-chips=2ecom=40lists=2einfradead=2eorg?=
 =?UTF-8?B?5Luj5Y+R44CR?=
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
 linux-rockchip@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>
References: <20191213181051.25983-1-miquel.raynal@bootlin.com>
 <20191213181051.25983-10-miquel.raynal@bootlin.com>
From: Andy Yan <andy.yan@rock-chips.com>
Message-ID: <02b3373e-790b-5f0c-40a0-7cc423a0dac5@rock-chips.com>
Date: Mon, 16 Dec 2019 20:00:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191213181051.25983-10-miquel.raynal@bootlin.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 17 Dec 2019 10:31:56 +0000
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 linux-arm-kernel@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Miquel:

Thanks for your work here.

A discussion about the grf write macro bellow.

On 12/14/19 2:10 AM, Miquel Raynal wrote:
> Introduce PX30 LVDS support. This means adding the relevant helper
> functions, a specific probe and also the initialization of a specific
> PHY.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>   drivers/gpu/drm/rockchip/rockchip_lvds.c | 173 +++++++++++++++++++++++
>   drivers/gpu/drm/rockchip/rockchip_lvds.h |  14 ++
>   2 files changed, 187 insertions(+)
>
> diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
> index a0c203dcd66f..e550c2f102e0 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
> @@ -10,6 +10,7 @@
>   #include <linux/component.h>
>   #include <linux/mfd/syscon.h>
>   #include <linux/of_graph.h>
> +#include <linux/phy/phy.h>
>   #include <linux/pinctrl/devinfo.h>
>   #include <linux/platform_device.h>
>   #include <linux/pm_runtime.h>
> @@ -54,6 +55,7 @@ struct rockchip_lvds {
>   	void __iomem *regs;
>   	struct regmap *grf;
>   	struct clk *pclk;
> +	struct phy *dphy;
>   	const struct rockchip_lvds_soc_data *soc_data;
>   	int output; /* rgb lvds or dual lvds output */
>   	int format; /* vesa or jeida format */
> @@ -322,6 +324,133 @@ static void rk3288_lvds_encoder_disable(struct drm_encoder *encoder)
>   	drm_panel_unprepare(lvds->panel);
>   }
>   
> +static int px30_lvds_poweron(struct rockchip_lvds *lvds)
> +{
> +	int ret;
> +
> +	ret = pm_runtime_get_sync(lvds->dev);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(lvds->dev, "failed to get pm runtime: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* Enable LVDS mode */
> +	return regmap_update_bits(lvds->grf, PX30_LVDS_GRF_PD_VO_CON1,
> +				  PX30_LVDS_MODE_EN(1) | PX30_LVDS_P2S_EN(1),
> +				  PX30_LVDS_MODE_EN(1) | PX30_LVDS_P2S_EN(1));
> +}
> +
> +static void px30_lvds_poweroff(struct rockchip_lvds *lvds)
> +{
> +	regmap_update_bits(lvds->grf, PX30_LVDS_GRF_PD_VO_CON1,
> +			   PX30_LVDS_MODE_EN(1) | PX30_LVDS_P2S_EN(1),
> +			   PX30_LVDS_MODE_EN(0) | PX30_LVDS_P2S_EN(0));
> +
> +	pm_runtime_put(lvds->dev);
> +}
> +
> +static int px30_lvds_grf_config(struct drm_encoder *encoder,
> +				struct drm_display_mode *mode)
> +{
> +	struct rockchip_lvds *lvds = encoder_to_lvds(encoder);
> +	u8 nhsync = !(mode->flags & DRM_MODE_FLAG_PHSYNC);
> +	u8 nvsync = !(mode->flags & DRM_MODE_FLAG_PVSYNC);
> +	u8 ndclk = !(mode->flags & DRM_MODE_FLAG_PCSYNC);
> +	int ret;
> +
> +	if (lvds->output != DISPLAY_OUTPUT_LVDS) {
> +		DRM_DEV_ERROR(lvds->dev, "Unsupported display output %d\n",
> +			      lvds->output);
> +		return -EINVAL;
> +	}
> +
> +	if (nhsync ^ nvsync) {
> +		DRM_DEV_ERROR(lvds->dev, "Unsupported Hsync/Vsync polarity\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Set format */
> +	ret = regmap_update_bits(lvds->grf, PX30_LVDS_GRF_PD_VO_CON1,
> +				 PX30_LVDS_FORMAT(lvds->format),
> +				 PX30_LVDS_FORMAT(lvds->format));
> +	if (ret)
> +		return ret;
> +
> +	/* Control Hsync/Vsync polarity */
> +	ret = regmap_update_bits(lvds->grf, PX30_LVDS_GRF_PD_VO_CON0,
> +				 PX30_LVDS_TIE_CLKS(1),
> +				 PX30_LVDS_TIE_CLKS(1));
> +	if (ret)
> +		return ret;
> +
> +	/* Set Hsync/Vsync polarity */
> +	ret = regmap_update_bits(lvds->grf, PX30_LVDS_GRF_PD_VO_CON0,
> +				 PX30_LVDS_INVERT_CLKS(1),
> +				 PX30_LVDS_INVERT_CLKS(nhsync));
> +	if (ret)
> +		return ret;
> +
> +	/* Set dclk polarity */
> +	return regmap_update_bits(lvds->grf, PX30_LVDS_GRF_PD_VO_CON0,
> +				  PX30_LVDS_INVERT_DCLK(1),
> +				  PX30_LVDS_INVERT_DCLK(ndclk));
> +}
> +
> +static int px30_lvds_set_vop_source(struct rockchip_lvds *lvds,
> +				    struct drm_encoder *encoder)
> +{
> +	int vop;
> +
> +	vop = drm_of_encoder_active_endpoint_id(lvds->dev->of_node, encoder);
> +	if (vop < 0)
> +		return vop;
> +
> +	return regmap_update_bits(lvds->grf, PX30_LVDS_GRF_PD_VO_CON1,
> +				  PX30_LVDS_VOP_SEL(1),
> +				  PX30_LVDS_VOP_SEL(vop));
> +}
> +
> +static void px30_lvds_encoder_enable(struct drm_encoder *encoder)
> +{
> +	struct rockchip_lvds *lvds = encoder_to_lvds(encoder);
> +	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
> +	int ret;
> +
> +	drm_panel_prepare(lvds->panel);
> +
> +	ret = px30_lvds_poweron(lvds);
> +	if (ret) {
> +		DRM_DEV_ERROR(lvds->dev, "failed to power on LVDS: %d\n", ret);
> +		drm_panel_unprepare(lvds->panel);
> +		return;
> +	}
> +
> +	ret = px30_lvds_grf_config(encoder, mode);
> +	if (ret) {
> +		DRM_DEV_ERROR(lvds->dev, "failed to configure LVDS: %d\n", ret);
> +		drm_panel_unprepare(lvds->panel);
> +		return;
> +	}
> +
> +	ret = px30_lvds_set_vop_source(lvds, encoder);
> +	if (ret) {
> +		DRM_DEV_ERROR(lvds->dev, "failed to set VOP source: %d\n", ret);
> +		drm_panel_unprepare(lvds->panel);
> +		return;
> +	}
> +
> +	drm_panel_enable(lvds->panel);
> +}
> +
> +static void px30_lvds_encoder_disable(struct drm_encoder *encoder)
> +{
> +	struct rockchip_lvds *lvds = encoder_to_lvds(encoder);
> +
> +	drm_panel_disable(lvds->panel);
> +	px30_lvds_poweroff(lvds);
> +	drm_panel_unprepare(lvds->panel);
> +}
> +
>   static const
>   struct drm_encoder_helper_funcs rk3288_lvds_encoder_helper_funcs = {
>   	.enable = rk3288_lvds_encoder_enable,
> @@ -329,6 +458,13 @@ struct drm_encoder_helper_funcs rk3288_lvds_encoder_helper_funcs = {
>   	.atomic_check = rockchip_lvds_encoder_atomic_check,
>   };
>   
> +static const
> +struct drm_encoder_helper_funcs px30_lvds_encoder_helper_funcs = {
> +	.enable = px30_lvds_encoder_enable,
> +	.disable = px30_lvds_encoder_disable,
> +	.atomic_check = rockchip_lvds_encoder_atomic_check,
> +};
> +
>   static const struct drm_encoder_funcs rockchip_lvds_encoder_funcs = {
>   	.destroy = drm_encoder_cleanup,
>   };
> @@ -379,16 +515,53 @@ static int rk3288_lvds_probe(struct platform_device *pdev,
>   	return 0;
>   }
>   
> +static int px30_lvds_probe(struct platform_device *pdev,
> +			   struct rockchip_lvds *lvds)
> +{
> +	int ret;
> +
> +	/* MSB */
> +	ret =  regmap_update_bits(lvds->grf, PX30_LVDS_GRF_PD_VO_CON1,
> +				  PX30_LVDS_MSBSEL(1),
> +				  PX30_LVDS_MSBSEL(1));
> +	if (ret)
> +		return ret;
> +
> +	/* PHY */
> +	lvds->dphy = devm_phy_get(&pdev->dev, "dphy");
> +	if (IS_ERR(lvds->dphy))
> +		return PTR_ERR(lvds->dphy);
> +
> +	phy_init(lvds->dphy);
> +	if (ret)
> +		return ret;
> +
> +	phy_set_mode(lvds->dphy, PHY_MODE_LVDS);
> +	if (ret)
> +		return ret;
> +
> +	return phy_power_on(lvds->dphy);
> +}
> +
>   static const struct rockchip_lvds_soc_data rk3288_lvds_data = {
>   	.probe = rk3288_lvds_probe,
>   	.helper_funcs = &rk3288_lvds_encoder_helper_funcs,
>   };
>   
> +static const struct rockchip_lvds_soc_data px30_lvds_data = {
> +	.probe = px30_lvds_probe,
> +	.helper_funcs = &px30_lvds_encoder_helper_funcs,
> +};
> +
>   static const struct of_device_id rockchip_lvds_dt_ids[] = {
>   	{
>   		.compatible = "rockchip,rk3288-lvds",
>   		.data = &rk3288_lvds_data
>   	},
> +	{
> +		.compatible = "rockchip,px30-lvds",
> +		.data = &px30_lvds_data
> +	},
>   	{}
>   };
>   MODULE_DEVICE_TABLE(of, rockchip_lvds_dt_ids);
> diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.h b/drivers/gpu/drm/rockchip/rockchip_lvds.h
> index e41e9ab3c306..7cfb102b4854 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_lvds.h
> +++ b/drivers/gpu/drm/rockchip/rockchip_lvds.h
> @@ -106,4 +106,18 @@
>   #define LVDS_VESA_18				2
>   #define LVDS_JEIDA_18				3
>   
> +#define WRITE_EN(v, h, l)  ((GENMASK(h, l) << 16) | (v << l))


How about rename WRITE_EN to HIWORD_UPDATE to keep align with other 
modules that write grf: such as 
dwmac-rk.c/dw-mipi-dsi-rockhip.c/dw-hdmi-rockchip.c

> +
> +#define PX30_LVDS_GRF_PD_VO_CON0		0x434
> +#define   PX30_LVDS_TIE_CLKS(val)		WRITE_EN(val,  8,  8)
> +#define   PX30_LVDS_INVERT_CLKS(val)		WRITE_EN(val,  9,  9)
> +#define   PX30_LVDS_INVERT_DCLK(val)		WRITE_EN(val,  5,  5)
> +
> +#define PX30_LVDS_GRF_PD_VO_CON1		0x438
> +#define   PX30_LVDS_FORMAT(val)			WRITE_EN(val, 14, 13)
> +#define   PX30_LVDS_MODE_EN(val)		WRITE_EN(val, 12, 12)
> +#define   PX30_LVDS_MSBSEL(val)			WRITE_EN(val, 11, 11)
> +#define   PX30_LVDS_P2S_EN(val)			WRITE_EN(val,  6,  6)
> +#define   PX30_LVDS_VOP_SEL(val)		WRITE_EN(val,  1,  1)
> +
>   #endif /* _ROCKCHIP_LVDS_ */


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
