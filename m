Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CB948E6D1
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 09:48:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA77310E1D5;
	Fri, 14 Jan 2022 08:48:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92AF210E1D5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 08:48:41 +0000 (UTC)
X-UUID: 80396baf14724dd5903fc256f122d274-20220114
X-UUID: 80396baf14724dd5903fc256f122d274-20220114
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 531684747; Fri, 14 Jan 2022 16:48:37 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 14 Jan 2022 16:48:36 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 14 Jan 2022 16:48:36 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 Jan 2022 16:48:36 +0800
Message-ID: <b6a98bf399ce1174d717a23c9062dfc6d062650b.camel@mediatek.com>
Subject: Re: [RFC PATCH 2/2] drm/mediatek: add mtk8195 hdmi display driver
From: CK Hu <ck.hu@mediatek.com>
To: Guillaume Ranquet <granquet@baylibre.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
Date: Fri, 14 Jan 2022 16:48:35 +0800
In-Reply-To: <20211108000847.14320-3-granquet@baylibre.com>
References: <20211108000847.14320-1-granquet@baylibre.com>
 <20211108000847.14320-3-granquet@baylibre.com>
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
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Guillaume:

On Mon, 2021-11-08 at 01:08 +0100, Guillaume Ranquet wrote:
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Change-Id: I6399dec26cfe56a338c2ca96989cb7cbd14e292b
> ---
>  drivers/gpu/drm/mediatek/Kconfig              |    9 +
>  drivers/gpu/drm/mediatek/Makefile             |    2 +
>  drivers/gpu/drm/mediatek/mtk_hdmi_common.c    |  219 +-
>  drivers/gpu/drm/mediatek/mtk_hdmi_common.h    |   24 +-
>  drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c    | 1835
> +++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.h    |   26 +
>  .../gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.c    |  530 +++++
>  .../gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.h    |   20 +
>  .../gpu/drm/mediatek/mtk_mt8195_hdmi_regs.h   |  329 +++
>  9 files changed, 2932 insertions(+), 62 deletions(-)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.h
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.h
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_regs.h
> 
> diff --git a/drivers/gpu/drm/mediatek/Kconfig
> b/drivers/gpu/drm/mediatek/Kconfig
> index 0df75bceb74e..76cc402cbd75 100644
> --- a/drivers/gpu/drm/mediatek/Kconfig
> +++ b/drivers/gpu/drm/mediatek/Kconfig
> @@ -31,3 +31,12 @@ config DRM_MEDIATEK_HDMI
>  	help
>  	  DRM/KMS HDMI driver for Mediatek SoCs
>  
> +config DRM_MEDIATEK_HDMI_MT8195_SUSPEND_LOW_POWER
> +	tristate "DRM HDMI SUSPEND LOW POWER Support for Mediatek
> mt8195 SoCs"
> +	depends on DRM_MEDIATEK_HDMI
> +	help
> +	  DRM/KMS HDMI SUSPEND_LOW_POWER for Mediatek SoCs.
> +	  Choose this option if you want to disable/enable
> +	  clock and power domain when platform enter suspend,
> +	  and this config depends on DRM_MEDIATEK_HDMI.
> +
> diff --git a/drivers/gpu/drm/mediatek/Makefile
> b/drivers/gpu/drm/mediatek/Makefile
> index 107b6fbbdbf7..477c0648643c 100644
> --- a/drivers/gpu/drm/mediatek/Makefile
> +++ b/drivers/gpu/drm/mediatek/Makefile
> @@ -26,6 +26,8 @@ mediatek-drm-hdmi-objs := mtk_cec.o \
>  			  mtk_hdmi.o \
>  			  mtk_hdmi_ddc.o \
>  			  mtk_hdmi_common.o \
> +			  mtk_mt8195_hdmi.o \
> +			  mtk_mt8195_hdmi_ddc.o \
>  
>  obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mediatek-drm-hdmi.o
>  
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
> b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
> index 3c38a3e73920..19083be0978a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
> @@ -1,5 +1,15 @@
>  #include "mtk_hdmi_common.h"
>  
> +const char *const
> mtk_hdmi_clk_names_mt8195[MTK_MT8195_HDMI_CLK_COUNT] = {
> +	[MTK_MT8195_HDMI_CLK_UNIVPLL_D6D4] = "univpll_d6_d4",
> +	[MTK_MT8195_HDMI_CLK_MSDCPLL_D2] = "msdcpll_d2",
> +	[MTK_MT8195_HDMI_CLK_HDMI_APB_SEL] = "hdmi_apb_sel",
> +	[MTK_MT8195_HDMI_UNIVPLL_D4D8] = "univpll_d4_d8",
> +	[MTK_MT8195_HDIM_HDCP_SEL] = "hdcp_sel",
> +	[MTK_MT8195_HDMI_HDCP_24M_SEL] = "hdcp24_sel",
> +	[MTK_MT8195_HDMI_VPP_SPLIT_HDMI] = "split_hdmi",
> +};
> +
>  const char * const
> mtk_hdmi_clk_names_mt8183[MTK_MT8183_HDMI_CLK_COUNT] = {
>  	[MTK_MT8183_HDMI_CLK_HDMI_PIXEL] = "pixel",
>  	[MTK_MT8183_HDMI_CLK_HDMI_PLL] = "pll",
> @@ -138,6 +148,18 @@ int mtk_hdmi_setup_avi_infoframe(struct mtk_hdmi
> *hdmi, u8 *buffer, size_t bufsz
>  		return err;
>  	}
>  
> +	if(hdmi->conf && hdmi->conf->is_mt8195) {
> +		frame.colorimetry = hdmi->colorimtery;
> +		//no need, since we cannot support other extended
> colorimetry?
> +		if (frame.colorimetry == HDMI_COLORIMETRY_EXTENDED)
> +			frame.extended_colorimetry = hdmi-
> >extended_colorimetry;

Separate colorimetry related part to an independent patch and use hdmi-
>conf->colorimetry_support instead of hdmi->conf->is_mt8195.

> +
> +		/* quantiation range:limited or full */
> +		if (frame.colorspace == HDMI_COLORSPACE_RGB)
> +			frame.quantization_range = hdmi-
> >quantization_range;
> +		else
> +			frame.ycc_quantization_range = hdmi-
> >ycc_quantization_range;
> +	}
>  	err = hdmi_avi_infoframe_pack(&frame, buffer, bufsz);
>  
>  	if (err < 0) {
> @@ -155,6 +177,11 @@ void mtk_hdmi_send_infoframe(struct mtk_hdmi
> *hdmi, u8 *buffer_spd, size_t bufsz
>  	mtk_hdmi_setup_spd_infoframe(hdmi, buffer_spd, bufsz_spd,
> "mediatek", "On-chip HDMI");
>  }
>  
> +static struct mtk_hdmi_ddc *hdmi_ddc_ctx_from_mtk_hdmi(struct
> mtk_hdmi *hdmi)
> +{
> +	return container_of(hdmi->ddc_adpt, struct mtk_hdmi_ddc, adap);
> +}
> +
>  int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
>  				   struct platform_device *pdev, const
> char *const *clk_names, size_t num_clocks)
>  {
> @@ -173,39 +200,41 @@ int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi
> *hdmi,
>  		return ret;
>  	}
>  
> -	/* The CEC module handles HDMI hotplug detection */
> -	cec_np = of_get_compatible_child(np->parent, "mediatek,mt8173-
> cec");
> -	if (!cec_np) {
> -		dev_err(dev, "Failed to find CEC node\n");
> -		return -EINVAL;
> -	}
> +	if (!hdmi->conf || !hdmi->conf->is_mt8195) {
> +		/* The CEC module handles HDMI hotplug detection */

Separate CEC hoplug related part to an independent patch.

> +		cec_np = of_get_compatible_child(np->parent,
> "mediatek,mt8173-cec");
> +		if (!cec_np) {
> +			dev_err(dev, "Failed to find CEC node\n");
> +			return -EINVAL;
> +		}
>  
> -	cec_pdev = of_find_device_by_node(cec_np);
> -	if (!cec_pdev) {
> -		dev_err(hdmi->dev, "Waiting for CEC device %pOF\n",
> -				cec_np);
> +		cec_pdev = of_find_device_by_node(cec_np);
> +		if (!cec_pdev) {
> +			dev_err(hdmi->dev, "Waiting for CEC device
> %pOF\n",
> +					cec_np);
> +			of_node_put(cec_np);
> +			return -EPROBE_DEFER;
> +		}
>  		of_node_put(cec_np);
> -		return -EPROBE_DEFER;
> -	}
> -	of_node_put(cec_np);
> -	hdmi->cec_dev = &cec_pdev->dev;
> -	/*
> -	 * The mediatek,syscon-hdmi property contains a phandle link to
> the
> -	 * MMSYS_CONFIG device and the register offset of the
> HDMI_SYS_CFG
> -	 * registers it contains.
> -	 */
> -	regmap = syscon_regmap_lookup_by_phandle(np, "mediatek,syscon-
> hdmi");
> -	ret = of_property_read_u32_index(np, "mediatek,syscon-hdmi", 1,
> -			&hdmi->sys_offset);
> -	if (IS_ERR(regmap))
> -		ret = PTR_ERR(regmap);
> -	if (ret) {
> -		dev_err(dev,
> -				"Failed to get system configuration
> registers: %d\n",
> -				ret);
> -		goto put_device;
> +		hdmi->cec_dev = &cec_pdev->dev;
> +		/*
> +		 * The mediatek,syscon-hdmi property contains a phandle
> link to the
> +		 * MMSYS_CONFIG device and the register offset of the
> HDMI_SYS_CFG

Separate HDMI_SYS_CFG related part to an independent patch.

> +		 * registers it contains.
> +		 */
> +		regmap = syscon_regmap_lookup_by_phandle(np,
> "mediatek,syscon-hdmi");
> +		ret = of_property_read_u32_index(np, "mediatek,syscon-
> hdmi", 1,
> +				&hdmi->sys_offset);
> +		if (IS_ERR(regmap))
> +			ret = PTR_ERR(regmap);
> +		if (ret) {
> +			dev_err(dev,
> +					"Failed to get system
> configuration registers: %d\n",
> +					ret);
> +			goto put_device;
> +		}
> +		hdmi->sys_regmap = regmap;
>  	}
> -	hdmi->sys_regmap = regmap;
>  
>  	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	if (!mem) {
> @@ -219,20 +248,22 @@ int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi
> *hdmi,
>  		goto put_device;
>  	}
>  
> -	remote = of_graph_get_remote_node(np, 1, 0);
> -	if (!remote) {
> -		ret = -EINVAL;
> -		goto put_device;
> -	}
> -
> -	if (!of_device_is_compatible(remote, "hdmi-connector")) {
> -		hdmi->next_bridge = of_drm_find_bridge(remote);
> -		if (!hdmi->next_bridge) {
> -			dev_err(dev, "Waiting for external bridge\n");
> -			of_node_put(remote);
> -			ret = -EPROBE_DEFER;
> +	if (!hdmi->conf || !hdmi->conf->is_mt8195) {
> +		remote = of_graph_get_remote_node(np, 1, 0);
> +		if (!remote) {
> +			ret = -EINVAL;
>  			goto put_device;
>  		}
> +
> +		if (!of_device_is_compatible(remote, "hdmi-connector")) 
> {
> +			hdmi->next_bridge = of_drm_find_bridge(remote);
> +			if (!hdmi->next_bridge) {
> +				dev_err(dev, "Waiting for external
> bridge\n");
> +				of_node_put(remote);
> +				ret = -EPROBE_DEFER;
> +				goto put_device;
> +			}
> +		}
>  	}
>  
>  	i2c_np = of_parse_phandle(pdev->dev.of_node, "ddc-i2c-bus", 0);
> @@ -251,9 +282,16 @@ int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi
> *hdmi,
>  		goto put_device;
>  	}
>  
> +	//TODO: rework this... this is ugly
> +	if (hdmi->conf && hdmi->conf->is_mt8195) {
> +		ddc = hdmi_ddc_ctx_from_mtk_hdmi(hdmi);
> +		ddc->regs = hdmi->regs;
> +	}

Separate ddc related part to an independent patch.

> +
>  	return 0;
>  put_device:
> -	put_device(hdmi->cec_dev);
> +	if (!hdmi->conf || !hdmi->conf->is_mt8195)
> +		put_device(hdmi->cec_dev);
>  	return ret;
>  }
>  
> @@ -265,7 +303,10 @@ static int mtk_hdmi_register_audio_driver(struct
> device *dev)
>  		.data = hdmi,
>  	};
>  
> -	set_hdmi_codec_pdata_mt8183(&codec_data);
> +	if(hdmi->conf && hdmi->conf->is_mt8195)
> +		set_hdmi_codec_pdata_mt8195(&codec_data);
> +	else
> +		set_hdmi_codec_pdata_mt8183(&codec_data);

set_hdmi_codec_pdata_mt8195() and set_hdmi_codec_pdata_mt8183() has the
same statement:

	codec_data->ops = &mtk_hdmi_audio_codec_ops;
	codec_data->max_i2s_channels = 2;
	codec_data->i2s = 1;

I think you could move these three lines out of that function, and set
ops as

	codec_data->ops = hdmi->conf->audio_codec_ops;

>  
>  	pdev = platform_device_register_data(dev, HDMI_CODEC_DRV_NAME,
>  					     PLATFORM_DEVID_AUTO,
> &codec_data,
> @@ -297,15 +338,23 @@ int mtk_drm_hdmi_probe(struct platform_device
> *pdev)
>  		return ret;
>  	}
>  
> -	ret = mtk_hdmi_dt_parse_pdata(hdmi, pdev,
> mtk_hdmi_clk_names_mt8183, ARRAY_SIZE(mtk_hdmi_clk_names_mt8183));
> +	if(hdmi->conf && hdmi->conf->is_mt8195)
> +		ret = mtk_hdmi_dt_parse_pdata(hdmi, pdev,
> mtk_hdmi_clk_names_mt8195, ARRAY_SIZE(mtk_hdmi_clk_names_mt8195));
> +	else
> +		ret = mtk_hdmi_dt_parse_pdata(hdmi, pdev,
> mtk_hdmi_clk_names_mt8183, ARRAY_SIZE(mtk_hdmi_clk_names_mt8183));
>  
>  	if (ret)
>  		return ret;
>  
>  	platform_set_drvdata(pdev, hdmi);
>  
> -	mtk_hdmi_output_init_mt8183(hdmi);
> -	hdmi->bridge.funcs = &mtk_mt8183_hdmi_bridge_funcs;
> +	if (hdmi->conf && hdmi->conf->is_mt8195) {
> +		mtk_hdmi_output_init_mt8195(hdmi);
> +		hdmi->bridge.funcs = &mtk_mt8195_hdmi_bridge_funcs;
> +	} else {
> +		mtk_hdmi_output_init_mt8183(hdmi);
> +		hdmi->bridge.funcs = &mtk_mt8183_hdmi_bridge_funcs;
> +	}

mtk_hdmi_output_init_mt8195() and mtk_hdmi_output_init_mt8183() has
common code, try to merge the common part.

I review partially here. And I would keep on reviewing the rest.

Regards,
CK

>  
>  	hdmi->bridge.of_node = pdev->dev.of_node;
>  	drm_bridge_add(&hdmi->bridge);
> @@ -324,7 +373,10 @@ int mtk_drm_hdmi_remove(struct platform_device
> *pdev)
>  
>  	drm_bridge_remove(&hdmi->bridge);
>  
> -	mtk_hdmi_clk_disable_mt8183(hdmi);
> +	if(hdmi->conf && hdmi->conf->is_mt8195)
> +		mtk_hdmi_clk_disable_mt8195(hdmi);
> +	else
> +		mtk_hdmi_clk_disable_mt8183(hdmi);
>  	i2c_put_adapter(hdmi->ddc_adpt);
>  
>  	return 0;
> @@ -339,6 +391,13 @@ static const struct mtk_hdmi_conf
> mtk_hdmi_conf_mt8167 = {
>  	.cea_modes_only = true,
>  };
>  
> 

