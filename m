Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E23D5BE415
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 13:04:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDF1510E180;
	Tue, 20 Sep 2022 11:04:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FEF310E180
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 11:04:28 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 125716601F41;
 Tue, 20 Sep 2022 12:04:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663671867;
 bh=/cwEGJDldfhxezHKjygxaVeRgio2wsx4hwitR0sWTcs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hCFEYpXQ7J7boCdxS/7OlpLB5eJpj7W3WaOW/IPl2hbKVjykNhtaffKEXGzFGZkHa
 NRHipVyC1GwnJ8GbhKssoSBPd9o3ddZR2Fv+SiG7AltBDUTH0j55WCptXE+Mx+PFYO
 ydededIggqqVDOW288JruoZVVJk7ePFFt/hSn57+4vab5tdJIYTqK70VWDgtyHoSI5
 MHf3Tpc4OwB6i89x3CljNlh6O2iqxZtqvFgx4qKdIowe2BM3SS1a7yWOfLXBz4gwBj
 2h1rY3dJlOX8Q6am/J8VOXUsMfjDQHQbZkjNGVStCwKcv/4uaxHT2XepJjSC5TEcmA
 N+qpVdeQZiLKw==
Message-ID: <7f69403d-5261-3e92-6093-8714a9f524e1@collabora.com>
Date: Tue, 20 Sep 2022 13:04:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v1 11/17] drm/mediatek: hdmi: add mt8195 support
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>, Vinod Koul <vkoul@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20220919-v1-0-4844816c9808@baylibre.com>
 <20220919-v1-11-4844816c9808@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220919-v1-11-4844816c9808@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, Pablo Sun <pablo.sun@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 19/09/22 18:56, Guillaume Ranquet ha scritto:
> Adds hdmi and hdmi-ddc support for mt8195.
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> 
> diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
> index 008ec69da67b..f1ef6c8ae2b8 100644
> --- a/drivers/gpu/drm/mediatek/Makefile
> +++ b/drivers/gpu/drm/mediatek/Makefile
> @@ -24,6 +24,8 @@ mediatek-drm-hdmi-objs := mtk_cec.o \
>   			  mtk_hdmi.o \
>   			  mtk_hdmi_ddc.o \
>   			  mtk_hdmi_common.o \
> +			  mtk_mt8195_hdmi.o \
> +			  mtk_mt8195_hdmi_ddc.o \
>   
>   obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mediatek-drm-hdmi.o
>   
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
> index 9fe086e2cd7c..f6bfe6c1c0be 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
> @@ -226,14 +226,22 @@ int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi, struct platform_device *pdev,
>   				goto put_device;
>   			}
>   		}
> -	}
>   
> -	i2c_np = of_parse_phandle(remote, "ddc-i2c-bus", 0);
> -	if (!i2c_np) {
> -		of_node_put(pdev->dev.of_node);
> -		dev_err(dev, "Failed to find ddc-i2c-bus");
> -		ret = -EINVAL;
> -		goto put_device;
> +		i2c_np = of_parse_phandle(remote, "ddc-i2c-bus", 0);
> +		if (!i2c_np) {
> +			of_node_put(pdev->dev.of_node);
> +			dev_err(dev, "Failed to find ddc-i2c-bus");
> +			ret = -EINVAL;
> +			goto put_device;
> +		}
> +	} else {
> +		i2c_np = of_parse_phandle(pdev->dev.of_node, "ddc-i2c-bus", 0);
> +		if (!i2c_np) {
> +			of_node_put(pdev->dev.of_node);
> +			dev_err(dev, "Failed to find ddc-i2c-bus");
> +			ret = -EINVAL;
> +			goto put_device;
> +		}
>   	}
>   
>   	hdmi->ddc_adpt = of_find_i2c_adapter_by_node(i2c_np);
> @@ -372,6 +380,17 @@ static const struct mtk_hdmi_conf mtk_hdmi_conf_mt8173 = {
>   	.num_clocks = MTK_MT8183_HDMI_CLK_COUNT,
>   };
>   
> +static const struct mtk_hdmi_conf mtk_hdmi_conf_mt8195 = {
> +	.has_frame_colorimetry = true,
> +	.bridge_funcs = &mtk_mt8195_hdmi_bridge_funcs,
> +	.mtk_hdmi_output_init = mtk_hdmi_output_init_mt8195,
> +	.mtk_hdmi_clk_disable = mtk_hdmi_clk_disable_mt8195,
> +	.mtk_hdmi_clk_enable = mtk_hdmi_clk_enable_mt8195,
> +	.set_hdmi_codec_pdata = set_hdmi_codec_pdata_mt8195,
> +	.mtk_hdmi_clock_names = mtk_hdmi_clk_names_mt8195,
> +	.num_clocks = MTK_MT8195_HDMI_CLK_COUNT,
> +};
> +
>   static const struct of_device_id mtk_drm_hdmi_of_ids[] = {
>   	{ .compatible = "mediatek,mt2701-hdmi",
>   	  .data = &mtk_hdmi_conf_mt2701,
> @@ -382,6 +401,9 @@ static const struct of_device_id mtk_drm_hdmi_of_ids[] = {
>   	{ .compatible = "mediatek,mt8173-hdmi",
>   	  .data = &mtk_hdmi_conf_mt8173,
>   	},
> +	{ .compatible = "mediatek,mt8195-hdmi",
> +	  .data = &mtk_hdmi_conf_mt8195,
> +	},
>   	{}
>   };
>   MODULE_DEVICE_TABLE(of, mtk_drm_hdmi_of_ids);
> @@ -430,6 +452,7 @@ static struct platform_driver mtk_hdmi_driver = {
>   static struct platform_driver * const mtk_hdmi_drivers[] = {
>   	&mtk_hdmi_ddc_driver,
>   	&mtk_cec_driver,
> +	&mtk_hdmi_mt8195_ddc_driver,
>   	&mtk_hdmi_driver,
>   };
>   
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.h b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
> index 75a9b62dccee..737306611fb9 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
> @@ -27,6 +27,7 @@
>   
>   #include "mtk_cec.h"
>   #include "mtk_hdmi.h"
> +#include "mtk_mt8195_hdmi.h"
>   
>   struct mtk_hdmi_conf {
>   	bool tz_disabled;
> diff --git a/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c b/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c
> new file mode 100644
> index 000000000000..39e07a6dd490
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c
> @@ -0,0 +1,1387 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2022 MediaTek Inc.
> + * Copyright (c) 2022 BayLibre, SAS
> + */
> +
> +#include <linux/arm-smccc.h>
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/delay.h>
> +#include <linux/debugfs.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/of_platform.h>
> +#include <linux/of.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_gpio.h>
> +#include <linux/of_graph.h>
> +#include <linux/pm_wakeup.h>
> +#include <linux/timer.h>
> +
> +#include <drm/drm_displayid.h>
> +#include <drm/drm_edid.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/display/drm_scdc_helper.h>
> +
> +#include "mtk_drm_crtc.h"
> +#include "mtk_hdmi_common.h"
> +#include "mtk_mt8195_hdmi.h"
> +#include "mtk_mt8195_hdmi_regs.h"
> +
> +#define RGB444_8bit BIT(0)
> +#define RGB444_10bit BIT(1)
> +#define RGB444_12bit BIT(2)
> +#define RGB444_16bit BIT(3)
> +
> +#define YCBCR444_8bit BIT(4)
> +#define YCBCR444_10bit BIT(5)
> +#define YCBCR444_12bit BIT(6)
> +#define YCBCR444_16bit BIT(7)
> +
> +#define YCBCR422_8bit_NO_SUPPORT BIT(8)
> +#define YCBCR422_10bit_NO_SUPPORT BIT(9)
> +#define YCBCR422_12bit BIT(10)
> +#define YCBCR422_16bit_NO_SUPPORT BIT(11)
> +
> +#define YCBCR420_8bit BIT(12)
> +#define YCBCR420_10bit BIT(13)
> +#define YCBCR420_12bit BIT(14)
> +#define YCBCR420_16bit BIT(15)
> +
> +#define BYTES_TO_UINT32(msb, b1, b2, lsb)                                      \
> +	((((msb) & 0xff) << 24) + (((b1) & 0xff) << 16) + (((b2) & 0xff) << 8) +     \
> +	 (((lsb) & 0xff)))
> +
> +const char *const mtk_hdmi_clk_names_mt8195[MTK_MT8195_HDMI_CLK_COUNT] = {
> +	[MTK_MT8195_HDIM_HDCP_SEL] = "hdcp_sel",
> +	[MTK_MT8195_HDMI_HDCP_24M_SEL] = "hdcp24_sel",
> +	[MTK_MT8195_HDMI_VPP_SPLIT_HDMI] = "split_hdmi",
> +};
> +
> +static inline struct mtk_hdmi *hdmi_ctx_from_conn(struct drm_connector *c)
> +{
> +	return container_of(c, struct mtk_hdmi, conn);
> +}
> +
> +static inline void mtk_hdmi_clr_all_int_status(struct mtk_hdmi *hdmi)
> +{
> +	/*clear all tx irq*/
> +	mtk_hdmi_write(hdmi, TOP_INT_CLR00, 0xffffffff);
> +	mtk_hdmi_write(hdmi, TOP_INT_CLR00, 0x00000000);
> +	mtk_hdmi_write(hdmi, TOP_INT_CLR01, 0xffffffff);
> +	mtk_hdmi_write(hdmi, TOP_INT_CLR01, 0x00000000);
> +}
> +
> +static inline void mtk_hdmi_disable_all_int(struct mtk_hdmi *hdmi)
> +{
> +	/*disable all tx irq*/
> +	mtk_hdmi_write(hdmi, TOP_INT_MASK00, 0x00000000);
> +	mtk_hdmi_write(hdmi, TOP_INT_MASK01, 0x00000000);
> +}
> +
> +static inline void mtk_hdmi_en_hdcp_reauth_int(struct mtk_hdmi *hdmi,
> +					       bool enable)
> +{
> +	if (enable)
> +		mtk_hdmi_mask(hdmi, TOP_INT_MASK00,
> +			      HDCP2X_RX_REAUTH_REQ_DDCM_INT_UNMASK,
> +			      HDCP2X_RX_REAUTH_REQ_DDCM_INT_UNMASK);
> +	else
> +		mtk_hdmi_mask(hdmi, TOP_INT_MASK00,
> +			      HDCP2X_RX_REAUTH_REQ_DDCM_INT_MASK,
> +			      HDCP2X_RX_REAUTH_REQ_DDCM_INT_UNMASK);
> +}
> +
> +static inline void mtk_hdmi_enable_hpd_pord_irq(struct mtk_hdmi *hdmi,
> +						bool enable)
> +{
> +	if (enable)
> +		mtk_hdmi_mask(hdmi, TOP_INT_MASK00, 0x0000000f, 0x0000000f);
> +	else
> +		mtk_hdmi_mask(hdmi, TOP_INT_MASK00, 0x00000000, 0x0000000f);
> +}
> +
> +static inline void mtk_hdmi_clr_htplg_pord_irq(struct mtk_hdmi *hdmi)
> +{
> +	mtk_hdmi_mask(hdmi, TOP_INT_CLR00, 0x0000000f, 0x0000000f);
> +	mtk_hdmi_mask(hdmi, TOP_INT_CLR00, 0x00000000, 0x0000000f);
> +}
> +
> +static inline void mtk_hdmi_set_sw_hpd(struct mtk_hdmi *hdmi, bool high)
> +{
> +	if (high)
> +		mtk_hdmi_mask(hdmi, HDMITX_CONFIG, 0x1 << HDMITX_SW_HPD_SHIFT,
> +			      HDMITX_SW_HPD);
> +	else
> +		mtk_hdmi_mask(hdmi, HDMITX_CONFIG, 0x0 << HDMITX_SW_HPD_SHIFT,
> +			      HDMITX_SW_HPD);
> +}
> +
> +static inline void mtk_hdmi_force_hdcp_hpd(struct mtk_hdmi *hdmi)
> +{
> +	/* force HDCP HPD to 1*/
> +	mtk_hdmi_mask(hdmi, HDCP2X_CTRL_0, HDCP2X_HPD_OVR, HDCP2X_HPD_OVR);
> +	mtk_hdmi_mask(hdmi, HDCP2X_CTRL_0, HDCP2X_HPD_SW, HDCP2X_HPD_SW);
> +}
> +
> +static void mtk_hdmi_disable_hdcp_encrypt(struct mtk_hdmi *hdmi)
> +{
> +	mtk_hdmi_mask(hdmi, HDCP2X_CTRL_0, 0x0 << HDCP2X_ENCRYPT_EN_SHIFT,
> +		      HDCP2X_ENCRYPT_EN);
> +	mtk_hdmi_mask(hdmi, HDCP1X_CTRL, 0x0 << HDCP1X_ENC_EN_SHIFT,
> +		      HDCP1X_ENC_EN);
> +}
> +
> +static void mtk_hdmi_yuv420_downsample(struct mtk_hdmi *hdmi, bool enable)
> +{
> +	if (enable) {
> +		mtk_hdmi_mask(hdmi, HDMITX_CONFIG,
> +			      HDMI_YUV420_MODE | HDMITX_SW_HPD,
> +			      HDMI_YUV420_MODE | HDMITX_SW_HPD);
> +		mtk_hdmi_mask(hdmi, VID_DOWNSAMPLE_CONFIG,
> +			      C444_C422_CONFIG_ENABLE, C444_C422_CONFIG_ENABLE);
> +		mtk_hdmi_mask(hdmi, VID_DOWNSAMPLE_CONFIG,
> +			      C422_C420_CONFIG_ENABLE, C422_C420_CONFIG_ENABLE);
> +		mtk_hdmi_mask(hdmi, VID_DOWNSAMPLE_CONFIG, 0,
> +			      C422_C420_CONFIG_BYPASS);
> +		mtk_hdmi_mask(hdmi, VID_DOWNSAMPLE_CONFIG,
> +			      C422_C420_CONFIG_OUT_CB_OR_CR,
> +			      C422_C420_CONFIG_OUT_CB_OR_CR);
> +		mtk_hdmi_mask(hdmi, VID_OUT_FORMAT,
> +			      OUTPUT_FORMAT_DEMUX_420_ENABLE,
> +			      OUTPUT_FORMAT_DEMUX_420_ENABLE);
> +	} else {
> +		mtk_hdmi_mask(hdmi, HDMITX_CONFIG, 0 | HDMITX_SW_HPD,
> +			      HDMI_YUV420_MODE | HDMITX_SW_HPD);
> +		mtk_hdmi_mask(hdmi, VID_DOWNSAMPLE_CONFIG, 0,
> +			      C444_C422_CONFIG_ENABLE);
> +		mtk_hdmi_mask(hdmi, VID_DOWNSAMPLE_CONFIG, 0,
> +			      C422_C420_CONFIG_ENABLE);
> +		mtk_hdmi_mask(hdmi, VID_DOWNSAMPLE_CONFIG,
> +			      C422_C420_CONFIG_BYPASS, C422_C420_CONFIG_BYPASS);
> +		mtk_hdmi_mask(hdmi, VID_DOWNSAMPLE_CONFIG, 0,
> +			      C422_C420_CONFIG_OUT_CB_OR_CR);
> +		mtk_hdmi_mask(hdmi, VID_OUT_FORMAT, 0,
> +			      OUTPUT_FORMAT_DEMUX_420_ENABLE);
> +	}
> +}
> +
> +static bool mtk_hdmi_tmds_over_340M(struct mtk_hdmi *hdmi)
> +{
> +	unsigned long pixel_clk, tmds_clk;
> +
> +	pixel_clk = hdmi->mode.clock * 1000;
> +
> +	/* TMDS clk frequency */
> +	if (hdmi->color_depth == HDMI_8_BIT)
> +		tmds_clk = pixel_clk;
> +	else if (hdmi->color_depth == HDMI_10_BIT)
> +		tmds_clk = pixel_clk * 5 / 4;
> +	else if (hdmi->color_depth == HDMI_12_BIT)
> +		tmds_clk = pixel_clk * 3 / 2;
> +	else if (hdmi->color_depth == HDMI_16_BIT)
> +		tmds_clk = pixel_clk * 2;
> +	else
> +		/* Invalid color_depth */
> +		return false;
> +
> +	if (tmds_clk >= 340000000 && hdmi->csp != HDMI_COLORSPACE_YUV420)
> +		return true;
> +
> +	return false;
> +}
> +
> +static inline void mtk_hdmi_enable_scrambling(struct mtk_hdmi *hdmi,
> +					      bool enable)
> +{
> +	usleep_range(100, 150);
> +
> +	if (enable)
> +		mtk_hdmi_mask(hdmi, TOP_CFG00, SCR_ON | HDMI2_ON,
> +			      SCR_ON | HDMI2_ON);
> +	else
> +		mtk_hdmi_mask(hdmi, TOP_CFG00, SCR_OFF | HDMI2_OFF,
> +			      SCR_ON | HDMI2_ON);
> +}
> +
> +static void mtk_hdmi_hw_vid_black(struct mtk_hdmi *hdmi, bool black)
> +{
> +	if (black)
> +		mtk_hdmi_mask(hdmi, TOP_VMUTE_CFG1, REG_VMUTE_EN, REG_VMUTE_EN);
> +	else
> +		mtk_hdmi_mask(hdmi, TOP_VMUTE_CFG1, 0, REG_VMUTE_EN);
> +}
> +
> +static void mtk_hdmi_hw_reset(struct mtk_hdmi *hdmi)
> +{
> +	mtk_hdmi_mask(hdmi, HDMITX_CONFIG, 0x0 << HDMITX_SW_RSTB_SHIFT,
> +		      HDMITX_SW_RSTB);
> +	udelay(5);
> +	mtk_hdmi_mask(hdmi, HDMITX_CONFIG, 0x1 << HDMITX_SW_RSTB_SHIFT,
> +		      HDMITX_SW_RSTB);
> +}
> +
> +static void mtk_hdmi_enable_hdmi_mode(struct mtk_hdmi *hdmi, bool enable)
> +{
> +	if (enable)
> +		mtk_hdmi_mask(hdmi, TOP_CFG00, HDMI_MODE_HDMI, HDMI_MODE_HDMI);
> +	else
> +		mtk_hdmi_mask(hdmi, TOP_CFG00, HDMI_MODE_DVI, HDMI_MODE_HDMI);
> +}
> +
> +static bool mtk_hdmi_sink_is_hdmi_device(struct mtk_hdmi *hdmi)
> +{
> +	if (hdmi->dvi_mode)
> +		return false;
> +	else
> +		return true;
> +}
> +
> +static void mtk_hdmi_set_deep_color(struct mtk_hdmi *hdmi, bool is_hdmi_sink)
> +{
> +	unsigned int deep_color = 0;
> +
> +	/* ycbcr422 12bit no deep color */
> +	if (hdmi->csp == HDMI_COLORSPACE_YUV422) {
> +		deep_color = DEEPCOLOR_MODE_8BIT;
> +	} else {
> +		switch (hdmi->color_depth) {
> +		case HDMI_8_BIT:
> +			deep_color = DEEPCOLOR_MODE_8BIT;
> +			break;
> +		case HDMI_10_BIT:
> +			deep_color = DEEPCOLOR_MODE_10BIT;
> +			break;
> +		case HDMI_12_BIT:
> +			deep_color = DEEPCOLOR_MODE_12BIT;
> +			break;
> +		case HDMI_16_BIT:
> +			deep_color = DEEPCOLOR_MODE_16BIT;
> +			break;
> +		default:
> +			WARN(1, "Unssupported color depth %d\n",
> +			     hdmi->color_depth);
> +		}
> +	}
> +
> +	mtk_hdmi_mask(hdmi, TOP_CFG00, deep_color, DEEPCOLOR_MODE_MASKBIT);
> +
> +	/* GCP */
> +	mtk_hdmi_mask(hdmi, TOP_CFG00, 0, DEEPCOLOR_PAT_EN);
> +	if (is_hdmi_sink && deep_color != DEEPCOLOR_MODE_8BIT)
> +		mtk_hdmi_mask(hdmi, TOP_MISC_CTLR, DEEP_COLOR_ADD,
> +			      DEEP_COLOR_ADD);
> +	else
> +		mtk_hdmi_mask(hdmi, TOP_MISC_CTLR, 0, DEEP_COLOR_ADD);
> +}
> +
> +static void mtk_hdmi_hw_audio_infoframe(struct mtk_hdmi *hdmi, u8 *buffer,
> +					u8 len)
> +{
> +	enum hdmi_infoframe_type frame_type;
> +	u8 frame_ver;
> +	u8 frame_len;
> +	u8 checksum;
> +
> +	frame_type = buffer[0];
> +	frame_ver = buffer[1];
> +	frame_len = buffer[2];
> +	checksum = buffer[3];
> +
> +	mtk_hdmi_mask(hdmi, TOP_INFO_EN, AUD_DIS_WR | AUD_DIS,
> +		      AUD_EN_WR | AUD_EN);
> +	mtk_hdmi_mask(hdmi, TOP_INFO_RPT, AUD_RPT_DIS, AUD_RPT_EN);
> +
> +	mtk_hdmi_write(hdmi, TOP_AIF_HEADER,
> +		       BYTES_TO_UINT32(0, frame_len, frame_ver, frame_type));
> +	mtk_hdmi_write(hdmi, TOP_AIF_PKT00,
> +		       BYTES_TO_UINT32(buffer[6], buffer[5], buffer[4],
> +				       buffer[3]));
> +	mtk_hdmi_write(hdmi, TOP_AIF_PKT01,
> +		       BYTES_TO_UINT32(0, 0, buffer[8], buffer[7]));
> +	mtk_hdmi_write(hdmi, TOP_AIF_PKT02, 0);
> +	mtk_hdmi_write(hdmi, TOP_AIF_PKT03, 0);
> +	mtk_hdmi_mask(hdmi, TOP_INFO_RPT, AUD_RPT_EN, AUD_RPT_EN);
> +	mtk_hdmi_mask(hdmi, TOP_INFO_EN, AUD_EN_WR | AUD_EN,
> +		      AUD_EN_WR | AUD_EN);
> +}
> +
> +static void mtk_hdmi_hw_avi_infoframe(struct mtk_hdmi *hdmi, u8 *buffer, u8 len)
> +{
> +	mtk_hdmi_mask(hdmi, TOP_INFO_EN, AVI_DIS_WR | AVI_DIS,
> +		      AVI_EN_WR | AVI_EN);
> +	mtk_hdmi_mask(hdmi, TOP_INFO_RPT, AVI_RPT_DIS, AVI_RPT_EN);
> +
> +	mtk_hdmi_write(hdmi, TOP_AVI_HEADER,
> +		       BYTES_TO_UINT32(0, buffer[2], buffer[1], buffer[0]));
> +
> +	mtk_hdmi_write(hdmi, TOP_AVI_PKT00,
> +		       BYTES_TO_UINT32(buffer[6], buffer[5], buffer[4],
> +				       buffer[3]));
> +
> +	mtk_hdmi_write(hdmi, TOP_AVI_PKT01,
> +		       BYTES_TO_UINT32(0, buffer[9], buffer[8], buffer[7]));
> +
> +	mtk_hdmi_write(hdmi, TOP_AVI_PKT02,
> +		       BYTES_TO_UINT32(buffer[13], buffer[12], buffer[11],
> +				       buffer[10]));
> +
> +	mtk_hdmi_write(hdmi, TOP_AVI_PKT03,
> +		       BYTES_TO_UINT32(0, buffer[16], buffer[15], buffer[14]));
> +
> +	mtk_hdmi_write(hdmi, TOP_AVI_PKT04, 0);
> +	mtk_hdmi_write(hdmi, TOP_AVI_PKT05, 0);
> +
> +	mtk_hdmi_mask(hdmi, TOP_INFO_RPT, AVI_RPT_EN, AVI_RPT_EN);
> +	mtk_hdmi_mask(hdmi, TOP_INFO_EN, AVI_EN_WR | AVI_EN,
> +		      AVI_EN_WR | AVI_EN);
> +}
> +
> +static void mtk_hdmi_hw_spd_infoframe(struct mtk_hdmi *hdmi, u8 *buffer, u8 len)
> +{
> +	mtk_hdmi_mask(hdmi, TOP_INFO_EN, SPD_DIS_WR | SPD_DIS,
> +		      SPD_EN_WR | SPD_EN);
> +	mtk_hdmi_mask(hdmi, TOP_INFO_RPT, SPD_RPT_DIS, SPD_RPT_EN);
> +
> +	mtk_hdmi_write(hdmi, TOP_SPDIF_HEADER,
> +		       BYTES_TO_UINT32(0, buffer[2], buffer[1], buffer[0]));
> +
> +	mtk_hdmi_write(hdmi, TOP_SPDIF_PKT00,
> +		       BYTES_TO_UINT32(buffer[6], buffer[5], buffer[4], buffer[3]));
> +
> +	mtk_hdmi_write(hdmi, TOP_SPDIF_PKT01,
> +		       BYTES_TO_UINT32(0, buffer[9], buffer[8], buffer[7]));
> +
> +	mtk_hdmi_write(hdmi, TOP_SPDIF_PKT02,
> +		       BYTES_TO_UINT32(buffer[13], buffer[12], buffer[11], buffer[10]));
> +
> +	mtk_hdmi_write(hdmi, TOP_SPDIF_PKT03,
> +		       BYTES_TO_UINT32(0, buffer[16], buffer[15], buffer[14]));
> +
> +	mtk_hdmi_write(hdmi, TOP_SPDIF_PKT04,
> +		       BYTES_TO_UINT32(buffer[20], buffer[19], buffer[18], buffer[17]));
> +
> +	mtk_hdmi_write(hdmi, TOP_SPDIF_PKT05,
> +		       BYTES_TO_UINT32(0, buffer[23], buffer[22], buffer[21]));
> +
> +	mtk_hdmi_write(hdmi, TOP_SPDIF_PKT06,
> +		       BYTES_TO_UINT32(buffer[27], buffer[26], buffer[25], buffer[24]));
> +
> +	mtk_hdmi_write(hdmi, TOP_SPDIF_PKT07,
> +		       BYTES_TO_UINT32(0, 0, 0, buffer[28]));
> +
> +	mtk_hdmi_mask(hdmi, TOP_INFO_RPT, SPD_RPT_EN, SPD_RPT_EN);
> +	mtk_hdmi_mask(hdmi, TOP_INFO_EN, SPD_EN_WR | SPD_EN,
> +		      SPD_EN_WR | SPD_EN);
> +}
> +
> +static int mtk_hdmi_setup_audio_infoframe(struct mtk_hdmi *hdmi)
> +{
> +	struct hdmi_codec_params *params = &hdmi->aud_param.codec_params;
> +	struct hdmi_audio_infoframe frame;
> +	u8 buffer[14];
> +	ssize_t err;
> +
> +	memcpy(&frame, &params->cea, sizeof(struct hdmi_audio_infoframe));
> +
> +	err = hdmi_audio_infoframe_pack(&frame, buffer, sizeof(buffer));
> +	if (err < 0)
> +		return err;
> +
> +	mtk_hdmi_hw_audio_infoframe(hdmi, buffer, sizeof(buffer));
> +	return 0;
> +}
> +
> +static void mtk_hdmi_hw_send_aud_packet(struct mtk_hdmi *hdmi, bool enable)
> +{
> +	if (enable)
> +		mtk_hdmi_mask(hdmi, AIP_TXCTRL, 0, AUD_PACKET_DROP);
> +	else
> +		mtk_hdmi_mask(hdmi, AIP_TXCTRL, AUD_PACKET_DROP,
> +			      AUD_PACKET_DROP);
> +}
> +
> +static inline void mtk_hdmi_hw_send_av_mute(struct mtk_hdmi *hdmi)
> +{
> +	/*GCP packet */
> +	mtk_hdmi_mask(hdmi, TOP_CFG01, 0, CP_CLR_MUTE_EN);
> +	mtk_hdmi_mask(hdmi, TOP_CFG01, 0, CP_SET_MUTE_EN);
> +	mtk_hdmi_mask(hdmi, TOP_INFO_RPT, 0, CP_RPT_EN);
> +	mtk_hdmi_mask(hdmi, TOP_INFO_EN, 0, CP_EN | CP_EN_WR);
> +
> +	mtk_hdmi_mask(hdmi, TOP_CFG01, 0, CP_CLR_MUTE_EN);
> +	mtk_hdmi_mask(hdmi, TOP_CFG01, CP_SET_MUTE_EN, CP_SET_MUTE_EN);
> +	mtk_hdmi_mask(hdmi, TOP_INFO_RPT, CP_RPT_EN, CP_RPT_EN);
> +	mtk_hdmi_mask(hdmi, TOP_INFO_EN, CP_EN | CP_EN_WR, CP_EN | CP_EN_WR);
> +}
> +
> +static inline void mtk_hdmi_hw_send_av_unmute(struct mtk_hdmi *hdmi)
> +{
> +	/*GCP packet */
> +	mtk_hdmi_mask(hdmi, TOP_CFG01, 0, CP_CLR_MUTE_EN);
> +	mtk_hdmi_mask(hdmi, TOP_CFG01, 0, CP_SET_MUTE_EN);
> +	mtk_hdmi_mask(hdmi, TOP_INFO_RPT, 0, CP_RPT_EN);
> +	mtk_hdmi_mask(hdmi, TOP_INFO_EN, 0, CP_EN | CP_EN_WR);
> +
> +	mtk_hdmi_mask(hdmi, TOP_CFG01, CP_CLR_MUTE_EN, CP_CLR_MUTE_EN);
> +	mtk_hdmi_mask(hdmi, TOP_CFG01, 0, CP_SET_MUTE_DIS);
> +	mtk_hdmi_mask(hdmi, TOP_INFO_RPT, CP_RPT_EN, CP_RPT_EN);
> +	mtk_hdmi_mask(hdmi, TOP_INFO_EN, CP_EN | CP_EN_WR, CP_EN | CP_EN_WR);
> +}
> +
> +static void mtk_hdmi_hw_ncts_enable(struct mtk_hdmi *hdmi, bool enable)
> +{
> +	unsigned int data;
> +
> +	mtk_hdmi_read(hdmi, AIP_CTRL, &data);
> +
> +	if (enable)
> +		data |= CTS_SW_SEL;
> +	else
> +		data &= ~CTS_SW_SEL;
> +
> +	mtk_hdmi_write(hdmi, AIP_CTRL, data);
> +}
> +
> +static void mtk_hdmi_hw_aud_set_channel_status(struct mtk_hdmi *hdmi,
> +					       u8 *channel_status)
> +{
> +	/* actually, only the first 5 or 7 bytes of Channel Status
> +	 * contain useful information
> +	 */
> +	mtk_hdmi_write(hdmi, AIP_I2S_CHST0,
> +		       BYTES_TO_UINT32(channel_status[3], channel_status[2],
> +				       channel_status[1], channel_status[0]));
> +	mtk_hdmi_write(hdmi, AIP_I2S_CHST1,
> +		       BYTES_TO_UINT32(0, channel_status[6], channel_status[5],
> +				       channel_status[4]));
> +}
> +
> +struct hdmi_acr_n {
> +	unsigned int clock;
> +	unsigned int n[3];
> +};
> +
> +/* Recommended N values from HDMI specification, tables 7-1 to 7-3 */
> +static const struct hdmi_acr_n hdmi_rec_n_table[] = {
> +	/* Clock, N: 32kHz 44.1kHz 48kHz */
> +	{ 25175, { 4576, 7007, 6864 } },
> +	{ 74176, { 11648, 17836, 11648 } },
> +	{ 148352, { 11648, 8918, 5824 } },
> +	{ 296703, { 5824, 4459, 5824 } },
> +	{ 297000, { 3072, 4704, 5120 } },
> +	{ 0, { 4096, 6272, 6144 } }, /* all other TMDS clocks */
> +};
> +
> +/**
> + * hdmi_recommended_n() - Return N value recommended by HDMI specification
> + * @freq: audio sample rate in Hz
> + * @clock: rounded TMDS clock in kHz
> + */
> +static int hdmi_recommended_n(unsigned int freq, unsigned int clock)
> +{
> +	const struct hdmi_acr_n *recommended;
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(hdmi_rec_n_table) - 1; i++) {
> +		if (clock == hdmi_rec_n_table[i].clock)
> +			break;
> +	}
> +
> +	if (i == ARRAY_SIZE(hdmi_rec_n_table))
> +		return -EINVAL;
> +
> +	recommended = hdmi_rec_n_table + i;
> +
> +	switch (freq) {
> +	case 32000:
> +		return recommended->n[0];
> +	case 44100:
> +		return recommended->n[1];
> +	case 48000:
> +		return recommended->n[2];
> +	case 88200:
> +		return recommended->n[1] * 2;
> +	case 96000:
> +		return recommended->n[2] * 2;
> +	case 176400:
> +		return recommended->n[1] * 4;
> +	case 192000:
> +		return recommended->n[2] * 4;
> +	default:
> +		return (128 * freq) / 1000;
> +	}
> +}
> +
> +static unsigned int hdmi_mode_clock_to_hz(unsigned int clock)
> +{
> +	switch (clock) {
> +	case 25175:
> +		return 25174825; /* 25.2/1.001 MHz */
> +	case 74176:
> +		return 74175824; /* 74.25/1.001 MHz */
> +	case 148352:
> +		return 148351648; /* 148.5/1.001 MHz */
> +	case 296703:
> +		return 296703297; /* 297/1.001 MHz */
> +	default:
> +		return clock * 1000;
> +	}
> +}
> +
> +static unsigned int hdmi_expected_cts(unsigned int audio_sample_rate,
> +				      unsigned int tmds_clock, unsigned int n)
> +{
> +	return DIV_ROUND_CLOSEST_ULL((u64)hdmi_mode_clock_to_hz(tmds_clock) * n,
> +				     128 * audio_sample_rate);
> +}
> +
> +static void mtk_hdmi_hw_aud_set_ncts(struct mtk_hdmi *hdmi,
> +				     unsigned int sample_rate,
> +				     unsigned int clock)
> +{
> +	unsigned int ncts;
> +	int n;
> +
> +	n = hdmi_recommended_n(sample_rate, clock);
> +
> +	if (n == -EINVAL) {
> +		DRM_ERROR("Invalid sample rate: %u\n", sample_rate);
> +		return;
> +	}
> +
> +	ncts = hdmi_expected_cts(sample_rate, clock, n);
> +	mtk_hdmi_write(hdmi, AIP_N_VAL, n);
> +	mtk_hdmi_write(hdmi, AIP_CTS_SVAL, ncts);
> +}
> +
> +static void mtk_hdmi_aud_enable_packet(struct mtk_hdmi *hdmi, bool enable)
> +{
> +	mtk_hdmi_hw_send_aud_packet(hdmi, enable);
> +}
> +
> +static void mtk_hdmi_aud_on_off_hw_ncts(struct mtk_hdmi *hdmi, bool on)
> +{
> +	mtk_hdmi_hw_ncts_enable(hdmi, on);
> +}
> +
> +static void mtk_hdmi_audio_dsd_config(struct mtk_hdmi *hdmi,
> +				      unsigned char chnum, bool dsd_bypass)
> +{
> +	mtk_hdmi_mask(hdmi, AIP_CTRL, DSD_EN, SPDIF_EN | DSD_EN | HBRA_ON);
> +	mtk_hdmi_mask(hdmi, AIP_TXCTRL, DSD_MUTE_DATA, DSD_MUTE_DATA);
> +	if (dsd_bypass)
> +		mtk_hdmi_write(hdmi, TOP_AUD_MAP, 0x75316420);
> +	else
> +		mtk_hdmi_write(hdmi, TOP_AUD_MAP, 0x04230150);
> +
> +	mtk_hdmi_mask(hdmi, AIP_SPDIF_CTRL, 0, I2S2DSD_EN);
> +}
> +
> +static inline void mtk_hdmi_hw_i2s_fifo_map(struct mtk_hdmi *hdmi,
> +					    unsigned int fifo_mapping)
> +{
> +	mtk_hdmi_mask(hdmi, AIP_I2S_CTRL, fifo_mapping,
> +		      FIFO3_MAP | FIFO2_MAP | FIFO1_MAP | FIFO0_MAP);
> +}
> +
> +static inline void mtk_hdmi_hw_i2s_ch_number(struct mtk_hdmi *hdmi,
> +					     unsigned int chnum)
> +{
> +	mtk_hdmi_mask(hdmi, AIP_CTRL, chnum << I2S_EN_SHIFT, I2S_EN);
> +}
> +
> +static void mtk_hdmi_hw_i2s_ch_mapping(struct mtk_hdmi *hdmi,
> +				       unsigned char chnum,
> +				       unsigned char mapping)
> +{
> +	unsigned int bdata;
> +
> +	switch (chnum) {
> +	case 2:
> +		bdata = 0x1;
> +		break;
> +	case 3:
> +		bdata = 0x3;
> +		break;
> +	case 6:
> +		if (mapping == 0x0E) {
> +			bdata = 0xf;
> +			break;
> +		}
> +		fallthrough;
> +	case 5:
> +		bdata = 0x7;
> +		break;
> +	case 7:
> +	case 8:
> +		bdata = 0xf;
> +		break;
> +	default:
> +		bdata = 0x1;
> +	}
> +
> +	mtk_hdmi_hw_i2s_fifo_map(hdmi, (MAP_SD3 << 6) | (MAP_SD2 << 4) |
> +					       (MAP_SD1 << 2) | (MAP_SD0 << 0));
> +	mtk_hdmi_hw_i2s_ch_number(hdmi, bdata);
> +
> +	if (chnum == 2)
> +		mtk_hdmi_mask(hdmi, AIP_TXCTRL, LAYOUT0, LAYOUT1);
> +	else
> +		mtk_hdmi_mask(hdmi, AIP_TXCTRL, LAYOUT1, LAYOUT1);
> +}
> +
> +static void mtk_hdmi_i2s_data_fmt(struct mtk_hdmi *hdmi, unsigned char fmt)
> +{
> +	unsigned int u4Data;
> +
> +	mtk_hdmi_read(hdmi, AIP_I2S_CTRL, &u4Data);
> +	u4Data &= ~(WS_HIGH | I2S_1ST_BIT_NOSHIFT | JUSTIFY_RIGHT);
> +
> +	switch (fmt) {
> +	case HDMI_I2S_MODE_RJT_24BIT:
> +	case HDMI_I2S_MODE_RJT_16BIT:
> +		u4Data |= (WS_HIGH | I2S_1ST_BIT_NOSHIFT | JUSTIFY_RIGHT);
> +		u4Data |= (WS_HIGH | I2S_1ST_BIT_NOSHIFT | JUSTIFY_RIGHT);
> +		break;
> +
> +	case HDMI_I2S_MODE_LJT_24BIT:
> +	case HDMI_I2S_MODE_LJT_16BIT:
> +		u4Data |= (WS_HIGH | I2S_1ST_BIT_NOSHIFT);
> +		u4Data |= (WS_HIGH | I2S_1ST_BIT_NOSHIFT);
> +		break;
> +
> +	case HDMI_I2S_MODE_I2S_24BIT:
> +	case HDMI_I2S_MODE_I2S_16BIT:
> +	default:
> +		break;
> +	}
> +	mtk_hdmi_write(hdmi, AIP_I2S_CTRL, u4Data);
> +}
> +
> +static inline void mtk_hdmi_i2s_sck_edge(struct mtk_hdmi *hdmi,
> +					 unsigned int edge)
> +{
> +	mtk_hdmi_mask(hdmi, AIP_I2S_CTRL, edge, SCK_EDGE_RISE);
> +}
> +
> +static inline void mtk_hdmi_i2s_cbit_order(struct mtk_hdmi *hdmi,
> +					   unsigned int cbit)
> +{
> +	mtk_hdmi_mask(hdmi, AIP_I2S_CTRL, cbit, CBIT_ORDER_SAME);
> +}
> +
> +static inline void mtk_hdmi_i2s_vbit(struct mtk_hdmi *hdmi, unsigned int vbit)
> +{
> +	mtk_hdmi_mask(hdmi, AIP_I2S_CTRL, vbit, VBIT_COM);
> +}
> +
> +static inline void mtk_hdmi_i2s_data_direction(struct mtk_hdmi *hdmi,
> +					       unsigned int data_dir)
> +{
> +	mtk_hdmi_mask(hdmi, AIP_I2S_CTRL, data_dir, DATA_DIR_LSB);
> +}
> +
> +static inline void mtk_hdmi_hw_audio_type(struct mtk_hdmi *hdmi,
> +					  unsigned int spdif_i2s)
> +{
> +	mtk_hdmi_mask(hdmi, AIP_CTRL, spdif_i2s << SPDIF_EN_SHIFT, SPDIF_EN);
> +}
> +
> +static unsigned char mtk_hdmi_get_i2s_ch_mapping(struct mtk_hdmi *hdmi,
> +						 unsigned char channel_type)
> +{
> +	unsigned char channelmap = 0x00;
> +
> +	switch (channel_type) {
> +	case HDMI_AUD_CHAN_TYPE_1_1:
> +	case HDMI_AUD_CHAN_TYPE_2_1:
> +		channelmap = 0x01;
> +		break;
> +
> +	case HDMI_AUD_CHAN_TYPE_3_0:
> +		channelmap = 0x02;
> +		break;
> +
> +	case HDMI_AUD_CHAN_TYPE_3_1:
> +		channelmap = 0x03;
> +		break;
> +
> +	case HDMI_AUD_CHAN_TYPE_3_0_LRS:
> +	case HDMI_AUD_CHAN_TYPE_4_0:
> +		channelmap = 0x08;
> +		break;
> +
> +	case HDMI_AUD_CHAN_TYPE_5_1:
> +		channelmap = 0x0B;
> +		break;
> +
> +	case HDMI_AUD_CHAN_TYPE_4_1_CLRS:
> +	case HDMI_AUD_CHAN_TYPE_6_0:
> +	case HDMI_AUD_CHAN_TYPE_6_0_CS:
> +	case HDMI_AUD_CHAN_TYPE_6_0_CH:
> +	case HDMI_AUD_CHAN_TYPE_6_0_OH:
> +	case HDMI_AUD_CHAN_TYPE_6_0_CHR:
> +		channelmap = 0x0E;
> +		break;
> +
> +	case HDMI_AUD_CHAN_TYPE_1_0:
> +	case HDMI_AUD_CHAN_TYPE_2_0:
> +	case HDMI_AUD_CHAN_TYPE_3_1_LRS:
> +	case HDMI_AUD_CHAN_TYPE_4_1:
> +	case HDMI_AUD_CHAN_TYPE_5_0:
> +	case HDMI_AUD_CHAN_TYPE_4_0_CLRS:
> +	case HDMI_AUD_CHAN_TYPE_6_1:
> +	case HDMI_AUD_CHAN_TYPE_6_1_CS:
> +	case HDMI_AUD_CHAN_TYPE_6_1_CH:
> +	case HDMI_AUD_CHAN_TYPE_6_1_OH:
> +	case HDMI_AUD_CHAN_TYPE_6_1_CHR:
> +	case HDMI_AUD_CHAN_TYPE_7_0:
> +	case HDMI_AUD_CHAN_TYPE_7_0_LH_RH:
> +	case HDMI_AUD_CHAN_TYPE_7_0_LSR_RSR:
> +	case HDMI_AUD_CHAN_TYPE_7_0_LC_RC:
> +	case HDMI_AUD_CHAN_TYPE_7_0_LW_RW:
> +	case HDMI_AUD_CHAN_TYPE_7_0_LSD_RSD:
> +	case HDMI_AUD_CHAN_TYPE_7_0_LSS_RSS:
> +	case HDMI_AUD_CHAN_TYPE_7_0_LHS_RHS:
> +	case HDMI_AUD_CHAN_TYPE_7_0_CS_CH:
> +	case HDMI_AUD_CHAN_TYPE_7_0_CS_OH:
> +	case HDMI_AUD_CHAN_TYPE_7_0_CS_CHR:
> +	case HDMI_AUD_CHAN_TYPE_7_0_CH_OH:
> +	case HDMI_AUD_CHAN_TYPE_7_0_CH_CHR:
> +	case HDMI_AUD_CHAN_TYPE_7_0_OH_CHR:
> +	case HDMI_AUD_CHAN_TYPE_7_0_LSS_RSS_LSR_RSR:
> +	case HDMI_AUD_CHAN_TYPE_8_0_LH_RH_CS:
> +	case HDMI_AUD_CHAN_TYPE_7_1:
> +	case HDMI_AUD_CHAN_TYPE_7_1_LH_RH:
> +	case HDMI_AUD_CHAN_TYPE_7_1_LSR_RSR:
> +	case HDMI_AUD_CHAN_TYPE_7_1_LC_RC:
> +	case HDMI_AUD_CHAN_TYPE_7_1_LW_RW:
> +	case HDMI_AUD_CHAN_TYPE_7_1_LSD_RSD:
> +	case HDMI_AUD_CHAN_TYPE_7_1_LSS_RSS:
> +	case HDMI_AUD_CHAN_TYPE_7_1_LHS_RHS:
> +	case HDMI_AUD_CHAN_TYPE_7_1_CS_CH:
> +	case HDMI_AUD_CHAN_TYPE_7_1_CS_OH:
> +	case HDMI_AUD_CHAN_TYPE_7_1_CS_CHR:
> +	case HDMI_AUD_CHAN_TYPE_7_1_CH_OH:
> +	case HDMI_AUD_CHAN_TYPE_7_1_CH_CHR:
> +	case HDMI_AUD_CHAN_TYPE_7_1_OH_CHR:
> +	case HDMI_AUD_CHAN_TYPE_7_1_LSS_RSS_LSR_RSR:
> +		channelmap = 0x00;
> +		break;
> +	}
> +
> +	return channelmap;
> +}
> +
> +static inline void mtk_hdmi_hw_i2s_ch_swap(struct mtk_hdmi *hdmi,
> +					   unsigned char swapbit)
> +{
> +	mtk_hdmi_mask(hdmi, AIP_SPDIF_CTRL, swapbit << 20, 0x0F << 20);
> +}
> +
> +static void mtk_hdmi_hbr_config(struct mtk_hdmi *hdmi, bool dsd_bypass)
> +{
> +	if (dsd_bypass) {
> +		mtk_hdmi_mask(hdmi, AIP_CTRL, HBRA_ON,
> +			      SPDIF_EN | DSD_EN | HBRA_ON);
> +		mtk_hdmi_mask(hdmi, AIP_CTRL, I2S_EN, I2S_EN);
> +	} else {
> +		mtk_hdmi_mask(hdmi, AIP_CTRL, SPDIF_EN,
> +			      SPDIF_EN | DSD_EN | HBRA_ON);
> +		mtk_hdmi_mask(hdmi, AIP_CTRL, SPDIF_INTERNAL_MODULE,
> +			      SPDIF_INTERNAL_MODULE);
> +		mtk_hdmi_mask(hdmi, AIP_CTRL, HBR_FROM_SPDIF, HBR_FROM_SPDIF);
> +		mtk_hdmi_mask(hdmi, AIP_CTRL, CTS_CAL_N4, CTS_CAL_N4);
> +	}
> +}
> +
> +static inline void mtk_hdmi_hw_spdif_config(struct mtk_hdmi *hdmi)
> +{
> +	mtk_hdmi_mask(hdmi, AIP_SPDIF_CTRL, WR_1UI_UNLOCK, WR_1UI_LOCK);
> +	mtk_hdmi_mask(hdmi, AIP_SPDIF_CTRL, FS_UNOVERRIDE, FS_OVERRIDE_WRITE);
> +	mtk_hdmi_mask(hdmi, AIP_SPDIF_CTRL, WR_2UI_UNLOCK, WR_2UI_LOCK);
> +	mtk_hdmi_mask(hdmi, AIP_SPDIF_CTRL, 0x4 << MAX_1UI_WRITE_SHIFT,
> +		      MAX_1UI_WRITE);
> +	mtk_hdmi_mask(hdmi, AIP_SPDIF_CTRL, 0x9 << MAX_2UI_WRITE_SHIFT,
> +		      MAX_2UI_WRITE);
> +	mtk_hdmi_mask(hdmi, AIP_SPDIF_CTRL, 0x4 << AUD_ERR_THRESH_SHIFT,
> +		      AUD_ERR_THRESH);
> +	mtk_hdmi_mask(hdmi, AIP_SPDIF_CTRL, I2S2DSD_EN, I2S2DSD_EN);
> +}
> +
> +static void mtk_hdmi_aud_set_input(struct mtk_hdmi *hdmi)
> +{
> +	unsigned char ChMapping;
> +
> +	mtk_hdmi_write(hdmi, TOP_AUD_MAP,
> +		       C_SD7 + C_SD6 + C_SD5 + C_SD4 + C_SD3 + C_SD2 + C_SD1 +
> +			       C_SD0);
> +	mtk_hdmi_mask(hdmi, AIP_SPDIF_CTRL, 0, 0x0F << 20);
> +	mtk_hdmi_mask(hdmi, AIP_CTRL, 0,
> +		      SPDIF_EN | DSD_EN | HBRA_ON | CTS_CAL_N4 |
> +			      HBR_FROM_SPDIF | SPDIF_INTERNAL_MODULE);
> +	mtk_hdmi_mask(hdmi, AIP_TXCTRL, 0, DSD_MUTE_DATA | LAYOUT1);
> +
> +	if (hdmi->aud_param.aud_input_type == HDMI_AUD_INPUT_I2S) {
> +		if (hdmi->aud_param.aud_codec == HDMI_AUDIO_CODING_TYPE_DSD) {
> +			mtk_hdmi_audio_dsd_config(hdmi, hdmi->aud_param.codec_params.channels, 0);
> +			mtk_hdmi_hw_i2s_ch_mapping(hdmi, hdmi->aud_param.codec_params.channels, 1);
> +		} else {
> +			mtk_hdmi_i2s_data_fmt(hdmi, hdmi->aud_param.aud_i2s_fmt);
> +			mtk_hdmi_i2s_sck_edge(hdmi, SCK_EDGE_RISE);
> +			mtk_hdmi_i2s_cbit_order(hdmi, CBIT_ORDER_SAME);
> +			mtk_hdmi_i2s_vbit(hdmi, VBIT_PCM);
> +			mtk_hdmi_i2s_data_direction(hdmi, DATA_DIR_MSB);
> +			mtk_hdmi_hw_audio_type(hdmi, HDMI_AUD_INPUT_I2S);
> +			ChMapping = mtk_hdmi_get_i2s_ch_mapping(hdmi, hdmi->aud_param.aud_input_chan_type);
> +			mtk_hdmi_hw_i2s_ch_mapping(hdmi, hdmi->aud_param.codec_params.channels, ChMapping);
> +			mtk_hdmi_hw_i2s_ch_swap(hdmi, LFE_CC_SWAP);
> +		}
> +	} else {
> +		if (hdmi->aud_param.aud_input_type == HDMI_AUD_INPUT_SPDIF &&
> +		    (hdmi->aud_param.aud_codec ==
> +		      HDMI_AUDIO_CODING_TYPE_DTS_HD ||
> +		     hdmi->aud_param.aud_codec ==
> +		      HDMI_AUDIO_CODING_TYPE_MLP) &&
> +		    hdmi->aud_param.codec_params.sample_rate == 768000) {
> +			mtk_hdmi_hbr_config(hdmi, false);
> +		} else {
> +			mtk_hdmi_hw_spdif_config(hdmi);
> +			mtk_hdmi_hw_i2s_ch_mapping(hdmi, 2, 0);
> +		}
> +	}
> +}
> +
> +static void mtk_hdmi_aud_set_sw_ncts(struct mtk_hdmi *hdmi,
> +				     struct drm_display_mode *display_mode)
> +{
> +	unsigned int sample_rate = hdmi->aud_param.codec_params.sample_rate;
> +
> +	mtk_hdmi_aud_on_off_hw_ncts(hdmi, false);
> +
> +	mtk_hdmi_hw_aud_set_ncts(hdmi, sample_rate, display_mode->clock);
> +}
> +
> +static inline void mtk_hdmi_hw_audio_input_enable(struct mtk_hdmi *hdmi,
> +						  unsigned int enable)
> +{
> +	if (enable)
> +		mtk_hdmi_mask(hdmi, AIP_CTRL, AUD_IN_EN, AUD_IN_EN);
> +	else
> +		mtk_hdmi_mask(hdmi, AIP_CTRL, 0x0 << AUD_IN_EN_SHIFT,
> +			      AUD_IN_EN);
> +}
> +
> +static void mtk_hdmi_aip_ctrl_init(struct mtk_hdmi *hdmi)
> +{
> +	mtk_hdmi_mask(hdmi, AIP_CTRL,
> +		      AUD_SEL_OWRT | NO_MCLK_CTSGEN_SEL | CTS_REQ_EN,
> +		      AUD_SEL_OWRT | NO_MCLK_CTSGEN_SEL | MCLK_EN | CTS_REQ_EN);
> +	mtk_hdmi_mask(hdmi, AIP_TPI_CTRL, TPI_AUDIO_LOOKUP_DIS,
> +		      TPI_AUDIO_LOOKUP_EN);
> +}
> +
> +static void mtk_hdmi_audio_reset(struct mtk_hdmi *hdmi, bool rst)
> +{
> +	if (rst)
> +		mtk_hdmi_mask(hdmi, AIP_TXCTRL,
> +			      RST4AUDIO | RST4AUDIO_FIFO | RST4AUDIO_ACR,
> +			      RST4AUDIO | RST4AUDIO_FIFO | RST4AUDIO_ACR);
> +	else
> +		mtk_hdmi_mask(hdmi, AIP_TXCTRL, 0,
> +			      RST4AUDIO | RST4AUDIO_FIFO | RST4AUDIO_ACR);
> +}
> +
> +static void mtk_hdmi_aud_output_config(struct mtk_hdmi *hdmi,
> +				       struct drm_display_mode *display_mode)
> +{
> +	mtk_hdmi_aud_enable_packet(hdmi, false);
> +	mtk_hdmi_audio_reset(hdmi, true);
> +	mtk_hdmi_aip_ctrl_init(hdmi);
> +	mtk_hdmi_aud_set_input(hdmi);
> +	mtk_hdmi_hw_aud_set_channel_status(hdmi, hdmi->aud_param.codec_params.iec.status);
> +	mtk_hdmi_setup_audio_infoframe(hdmi);
> +	mtk_hdmi_hw_audio_input_enable(hdmi, true);
> +	mtk_hdmi_audio_reset(hdmi, false);
> +	mtk_hdmi_aud_set_sw_ncts(hdmi, display_mode);
> +	usleep_range(25, 50);
> +	mtk_hdmi_aud_on_off_hw_ncts(hdmi, true);
> +	mtk_hdmi_aud_enable_packet(hdmi, true);
> +}
> +
> +void mtk_hdmi_output_init_mt8195(struct mtk_hdmi *hdmi)
> +{
> +	struct hdmi_audio_param *aud_param = &hdmi->aud_param;
> +
> +	aud_param->aud_codec = HDMI_AUDIO_CODING_TYPE_PCM;
> +	aud_param->aud_sampe_size = HDMI_AUDIO_SAMPLE_SIZE_16;
> +	aud_param->aud_input_type = HDMI_AUD_INPUT_I2S;
> +	aud_param->aud_i2s_fmt = HDMI_I2S_MODE_I2S_24BIT;
> +	aud_param->aud_mclk = HDMI_AUD_MCLK_128FS;
> +	aud_param->aud_input_chan_type = HDMI_AUD_CHAN_TYPE_2_0;
> +
> +	hdmi->hpd = HDMI_PLUG_OUT;
> +	hdmi->set_csp_depth = RGB444_8bit;
> +	hdmi->csp = HDMI_COLORSPACE_RGB;
> +	hdmi->color_depth = HDMI_8_BIT;
> +	hdmi->colorimtery = HDMI_COLORIMETRY_NONE;
> +	hdmi->extended_colorimetry = HDMI_EXTENDED_COLORIMETRY_RESERVED;
> +	hdmi->quantization_range = HDMI_QUANTIZATION_RANGE_DEFAULT;
> +	hdmi->ycc_quantization_range = HDMI_YCC_QUANTIZATION_RANGE_LIMITED;
> +}
> +
> +static void mtk_hdmi_reset_colorspace_setting(struct mtk_hdmi *hdmi)
> +{
> +	hdmi->set_csp_depth = RGB444_8bit;
> +	hdmi->csp = HDMI_COLORSPACE_RGB;
> +	hdmi->color_depth = HDMI_8_BIT;
> +	hdmi->colorimtery = HDMI_COLORIMETRY_NONE;
> +	hdmi->extended_colorimetry = HDMI_EXTENDED_COLORIMETRY_RESERVED;
> +	hdmi->quantization_range = HDMI_QUANTIZATION_RANGE_DEFAULT;
> +	hdmi->ycc_quantization_range = HDMI_YCC_QUANTIZATION_RANGE_LIMITED;
> +}
> +
> +static void mtk_hdmi_change_video_resolution(struct mtk_hdmi *hdmi)
> +{
> +	bool is_over_340M = false;
> +	bool is_hdmi_sink = false;
> +
> +	mtk_hdmi_hw_reset(hdmi);
> +	mtk_hdmi_set_sw_hpd(hdmi, true);
> +	usleep_range(2, 5);
> +
> +	mtk_hdmi_write(hdmi, HDCP_TOP_CTRL, 0x0);
> +	mtk_hdmi_en_hdcp_reauth_int(hdmi, true);
> +	mtk_hdmi_enable_hpd_pord_irq(hdmi, true);
> +	mtk_hdmi_force_hdcp_hpd(hdmi);
> +
> +	is_hdmi_sink = mtk_hdmi_sink_is_hdmi_device(hdmi);
> +	mtk_hdmi_set_deep_color(hdmi, is_hdmi_sink);
> +	mtk_hdmi_enable_hdmi_mode(hdmi, is_hdmi_sink);
> +
> +	usleep_range(5, 10);
> +	mtk_hdmi_hw_vid_black(hdmi, true);
> +	mtk_hdmi_hw_send_av_unmute(hdmi);
> +
> +	mtk_hdmi_mask(hdmi, TOP_CFG01, NULL_PKT_VSYNC_HIGH_EN,
> +		      NULL_PKT_VSYNC_HIGH_EN | NULL_PKT_EN);
> +
> +	is_over_340M = mtk_hdmi_tmds_over_340M(hdmi);
> +	mtk_hdmi_enable_scrambling(hdmi, is_over_340M);
> +
> +	if (hdmi->csp == HDMI_COLORSPACE_YUV420)
> +		mtk_hdmi_yuv420_downsample(hdmi, true);
> +	else
> +		mtk_hdmi_yuv420_downsample(hdmi, false);
> +}
> +
> +static void mtk_hdmi_output_set_display_mode(struct mtk_hdmi *hdmi,
> +					     struct drm_display_mode *mode)
> +{
> +	int ret;
> +	union phy_configure_opts opts = {
> +		.dp = { .link_rate = hdmi->mode.clock * 1000 }
> +	};
> +
> +	ret = phy_configure(hdmi->phy, &opts);
> +	if (ret)
> +		dev_err(hdmi->dev, "Setting clock=%d failed: %d", mode->clock, ret);
> +
> +	mtk_hdmi_change_video_resolution(hdmi);
> +	mtk_hdmi_aud_output_config(hdmi, mode);
> +}
> +
> +int mtk_hdmi_clk_enable_mt8195(struct mtk_hdmi *hdmi)
> +{
> +	int ret;
> +
> +	ret = clk_prepare_enable(hdmi->clk[MTK_MT8195_HDIM_HDCP_SEL]);
> +	if (ret)
> +		return ret;
> +	ret = clk_prepare_enable(hdmi->clk[MTK_MT8195_HDMI_HDCP_24M_SEL]);
> +	if (ret)
> +		return ret;
> +	ret = clk_prepare_enable(hdmi->clk[MTK_MT8195_HDMI_VPP_SPLIT_HDMI]);
> +
> +	return ret;
> +}
> +
> +void mtk_hdmi_clk_disable_mt8195(struct mtk_hdmi *hdmi)
> +{
> +	clk_disable_unprepare(hdmi->clk[MTK_MT8195_HDIM_HDCP_SEL]);
> +	clk_disable_unprepare(hdmi->clk[MTK_MT8195_HDMI_HDCP_24M_SEL]);
> +	clk_disable_unprepare(hdmi->clk[MTK_MT8195_HDMI_VPP_SPLIT_HDMI]);
> +}
> +
> +static void mtk_hdmi_hpd_event(enum hdmi_hpd_state hpd, struct device *dev)
> +{
> +	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
> +
> +	if (hdmi && hdmi->bridge.encoder && hdmi->bridge.encoder->dev)
> +		drm_helper_hpd_irq_event(hdmi->bridge.encoder->dev);
> +}
> +
> +static enum hdmi_hpd_state mtk_hdmi_hpd_pord_status(struct mtk_hdmi *hdmi)
> +{
> +	unsigned int hpd_status;
> +
> +	mtk_hdmi_read(hdmi, HPD_DDC_STATUS, &hpd_status);
> +	if ((hpd_status & (HPD_PIN_STA | PORD_PIN_STA)) ==
> +	    (HPD_PIN_STA | PORD_PIN_STA))
> +		return HDMI_PLUG_IN_AND_SINK_POWER_ON;
> +	else if ((hpd_status & (HPD_PIN_STA | PORD_PIN_STA)) == PORD_PIN_STA)
> +		return HDMI_PLUG_IN_ONLY;
> +	else
> +		return HDMI_PLUG_OUT;
> +}
> +
> +static irqreturn_t mtk_hdmi_isr(int irq, void *arg)
> +{
> +	struct mtk_hdmi *hdmi = arg;
> +	unsigned int int_status;
> +	int ret = IRQ_HANDLED;
> +
> +	mtk_hdmi_read(hdmi, TOP_INT_STA00, &int_status);
> +
> +	/* handle hpd interrupt */
> +	if (int_status & (PORD_F_INT_STA | PORD_R_INT_STA | HTPLG_F_INT_STA |
> +			  HTPLG_R_INT_STA)) {
> +		mtk_hdmi_enable_hpd_pord_irq(hdmi, false);
> +		mtk_hdmi_clr_htplg_pord_irq(hdmi);
> +		ret = IRQ_WAKE_THREAD;
> +	}
> +
> +	/*clear all tx irq*/
> +	mtk_hdmi_clr_all_int_status(hdmi);
> +
> +	return ret;
> +}
> +
> +static irqreturn_t mtk_hdmi_hpd_work_handle(int irq, void *arg)
> +{
> +	struct mtk_hdmi *hdmi = arg;
> +	enum hdmi_hpd_state hpd;
> +
> +	hpd = mtk_hdmi_hpd_pord_status(hdmi);
> +	if (hpd != hdmi->hpd) {
> +		hdmi->hpd = hpd;
> +		mtk_hdmi_hpd_event(hpd, hdmi->dev);
> +	}
> +
> +	mtk_hdmi_enable_hpd_pord_irq(hdmi, true);
> +	return IRQ_HANDLED;
> +}
> +
> +static int mtk_hdmi_enable_disable(struct mtk_hdmi *hdmi, bool enable)
> +{
> +	int ret;
> +
> +	if (enable && !hdmi->hdmi_enabled) {
> +		if (!hdmi->power_clk_enabled) {
> +			/* power domain on */
> +			ret = pm_runtime_get_sync(hdmi->dev);
> +
> +			/* clk on */
> +			mtk_hdmi_clk_enable_mt8195(hdmi);
> +			hdmi->power_clk_enabled = true;
> +		}
> +
> +		if (!hdmi->irq_registered) {
> +			/* disable all tx interrupts */
> +			mtk_hdmi_disable_all_int(hdmi);
> +			/* request irq */
> +			hdmi->hdmi_irq =
> +				irq_of_parse_and_map(hdmi->dev->of_node, 0);
> +			ret = request_threaded_irq(hdmi->hdmi_irq, mtk_hdmi_isr,
> +						   mtk_hdmi_hpd_work_handle,
> +						   IRQF_TRIGGER_HIGH, "hdmiirq",
> +						   hdmi);
> +			hdmi->irq_registered = true;
> +			/* enable hpd interrupt */
> +			mtk_hdmi_set_sw_hpd(hdmi, true);
> +			mtk_hdmi_enable_hpd_pord_irq(hdmi, true);
> +		}
> +
> +	} else if (!enable && hdmi->hdmi_enabled) {
> +		if (hdmi->irq_registered) {
> +			/* free irq */
> +			free_irq(hdmi->hdmi_irq, NULL);
> +			hdmi->irq_registered = false;
> +		}
> +
> +		if (hdmi->power_clk_enabled) {
> +			/* clk disable */
> +			mtk_hdmi_clk_disable_mt8195(hdmi);
> +			/* power domain off */
> +			ret = pm_runtime_put_sync(hdmi->dev);
> +			hdmi->power_clk_enabled = false;
> +		}
> +	}
> +
> +	hdmi->hdmi_enabled = enable;
> +
> +	return 0;
> +}
> +
> +static const struct drm_prop_enum_list csp_depth_props[] = {
> +	{ __builtin_ffs(RGB444_8bit), "RGB444_8bit" },
> +	{ __builtin_ffs(RGB444_10bit), "RGB444_10bit" },
> +	{ __builtin_ffs(RGB444_12bit), "RGB444_10bit" },
> +	{ __builtin_ffs(RGB444_16bit), "RGB444_16bit" },
> +	{ __builtin_ffs(YCBCR444_8bit), "YCBCR444_8bit" },
> +	{ __builtin_ffs(YCBCR444_10bit), "YCBCR444_10bit" },
> +	{ __builtin_ffs(YCBCR444_12bit), "YCBCR444_12bit" },
> +	{ __builtin_ffs(YCBCR444_16bit), "YCBCR444_16bit" },
> +	{ __builtin_ffs(YCBCR422_8bit_NO_SUPPORT), "YCBCR422_8bit_NO_SUPPORT" },
> +	{ __builtin_ffs(YCBCR422_10bit_NO_SUPPORT),
> +	  "YCBCR422_10bit_NO_SUPPORT" },
> +	{ __builtin_ffs(YCBCR422_12bit), "YCBCR422_12bit" },
> +	{ __builtin_ffs(YCBCR422_16bit_NO_SUPPORT),
> +	  "YCBCR422_16bit_NO_SUPPORT" },
> +	{ __builtin_ffs(YCBCR420_8bit), "YCBCR420_8bit" },
> +	{ __builtin_ffs(YCBCR420_10bit), "YCBCR420_10bit" },
> +	{ __builtin_ffs(YCBCR420_12bit), "YCBCR420_12bit" },
> +	{ __builtin_ffs(YCBCR420_16bit), "YCBCR420_16bit" },
> +};
> +
> +static void mtk_hdmi_convert_colorspace_depth(struct mtk_hdmi *hdmi)
> +{
> +	switch (hdmi->set_csp_depth) {
> +	case RGB444_8bit:
> +		hdmi->csp = HDMI_COLORSPACE_RGB;
> +		hdmi->color_depth = HDMI_8_BIT;
> +		break;
> +	case RGB444_10bit:
> +		hdmi->csp = HDMI_COLORSPACE_RGB;
> +		hdmi->color_depth = HDMI_10_BIT;
> +		break;
> +	case RGB444_12bit:
> +		hdmi->csp = HDMI_COLORSPACE_RGB;
> +		hdmi->color_depth = HDMI_12_BIT;
> +		break;
> +	case RGB444_16bit:
> +		hdmi->csp = HDMI_COLORSPACE_RGB;
> +		hdmi->color_depth = HDMI_16_BIT;
> +		break;
> +	case YCBCR444_8bit:
> +		hdmi->csp = HDMI_COLORSPACE_YUV444;
> +		hdmi->color_depth = HDMI_8_BIT;
> +		break;
> +	case YCBCR444_10bit:
> +		hdmi->csp = HDMI_COLORSPACE_YUV444;
> +		hdmi->color_depth = HDMI_10_BIT;
> +		break;
> +	case YCBCR444_12bit:
> +		hdmi->csp = HDMI_COLORSPACE_YUV444;
> +		hdmi->color_depth = HDMI_12_BIT;
> +		break;
> +	case YCBCR444_16bit:
> +		hdmi->csp = HDMI_COLORSPACE_YUV444;
> +		hdmi->color_depth = HDMI_16_BIT;
> +		break;
> +	case YCBCR422_12bit:
> +		hdmi->csp = HDMI_COLORSPACE_YUV422;
> +		hdmi->color_depth = HDMI_12_BIT;
> +		break;
> +	case YCBCR420_8bit:
> +		hdmi->csp = HDMI_COLORSPACE_YUV420;
> +		hdmi->color_depth = HDMI_8_BIT;
> +		break;
> +	case YCBCR420_10bit:
> +		hdmi->csp = HDMI_COLORSPACE_YUV420;
> +		hdmi->color_depth = HDMI_10_BIT;
> +		break;
> +	case YCBCR420_12bit:
> +		hdmi->csp = HDMI_COLORSPACE_YUV420;
> +		hdmi->color_depth = HDMI_12_BIT;
> +		break;
> +	case YCBCR420_16bit:
> +		hdmi->csp = HDMI_COLORSPACE_YUV420;
> +		hdmi->color_depth = HDMI_16_BIT;
> +		break;
> +	default:
> +
> +		hdmi->csp = HDMI_COLORSPACE_RGB;
> +		hdmi->color_depth = HDMI_8_BIT;
> +	}
> +}
> +
> +static int mtk_hdmi_conn_get_modes(struct drm_connector *conn)
> +{
> +	struct mtk_hdmi *hdmi = hdmi_ctx_from_conn(conn);
> +	struct edid *edid;
> +	int ret;
> +
> +	if (!hdmi->ddc_adpt)
> +		return -ENODEV;
> +
> +	edid = drm_get_edid(conn, hdmi->ddc_adpt);
> +	if (!edid)
> +		return -ENODEV;
> +
> +	hdmi->dvi_mode = !drm_detect_hdmi_monitor(edid);
> +
> +	drm_connector_update_edid_property(conn, edid);
> +
> +	ret = drm_add_edid_modes(conn, edid);
> +
> +	kfree(edid);
> +
> +	return ret;
> +}
> +
> +static int mtk_hdmi_conn_mode_valid(struct drm_connector *conn,
> +				    struct drm_display_mode *mode)
> +{
> +	if (mode->clock < 27000)
> +		return MODE_CLOCK_LOW;
> +	if (mode->clock > 594000)
> +		return MODE_CLOCK_HIGH;
> +
> +	return drm_mode_validate_size(mode, 0x1fff, 0x1fff);
> +}
> +
> +static struct drm_encoder *mtk_hdmi_conn_best_enc(struct drm_connector *conn)
> +{
> +	struct mtk_hdmi *hdmi = hdmi_ctx_from_conn(conn);
> +
> +	return hdmi->bridge.encoder;
> +}
> +
> +static const struct drm_connector_helper_funcs mtk_hdmi_connector_helper_funcs = {
> +	.get_modes = mtk_hdmi_conn_get_modes,
> +	.mode_valid = mtk_hdmi_conn_mode_valid,
> +	.best_encoder = mtk_hdmi_conn_best_enc,
> +};
> +
> +/*
> + * Bridge callbacks
> + */
> +
> +static int mtk_hdmi_bridge_attach(struct drm_bridge *bridge,
> +				  enum drm_bridge_attach_flags flags)
> +{
> +	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
> +	int ret;
> +
> +	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> +		DRM_ERROR("The flag DRM_BRIDGE_ATTACH_NO_CONNECTOR must be supplied\n");
> +		return -EINVAL;
> +	}
> +	if (hdmi->next_bridge) {
> +		ret = drm_bridge_attach(bridge->encoder, hdmi->next_bridge, bridge, flags);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	pm_runtime_enable(hdmi->dev);
> +	mtk_hdmi_enable_disable(hdmi, true);
> +
> +	return 0;
> +}
> +
> +static void mtk_hdmi_bridge_disable(struct drm_bridge *bridge,
> +				    struct drm_bridge_state *old_bridge_state)
> +{
> +	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
> +
> +	if (!hdmi->enabled)
> +		return;
> +
> +	mtk_hdmi_hw_send_av_mute(hdmi);
> +	usleep_range(50000, 50050);
> +	mtk_hdmi_hw_vid_black(hdmi, true);
> +	mtk_hdmi_disable_hdcp_encrypt(hdmi);
> +	usleep_range(50000, 50050);
> +
> +	hdmi->enabled = false;
> +}
> +
> +static void mtk_hdmi_bridge_post_disable(struct drm_bridge *bridge,
> +					 struct drm_bridge_state *old_state)
> +{
> +	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
> +
> +	if (!hdmi->powered)
> +		return;
> +
> +	phy_power_off(hdmi->phy);
> +
> +	hdmi->powered = false;
> +
> +	mtk_hdmi_reset_colorspace_setting(hdmi);
> +}
> +
> +static void mtk_hdmi_bridge_pre_enable(struct drm_bridge *bridge,
> +				       struct drm_bridge_state *old_state)
> +{
> +	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
> +	union phy_configure_opts opts = {
> +		.dp = { .link_rate = hdmi->mode.clock * 1000 }
> +	};
> +
> +	mtk_hdmi_convert_colorspace_depth(hdmi);
> +	mtk_hdmi_output_set_display_mode(hdmi, &hdmi->mode);
> +	/* configuring phy clock link with appropriate rate */
> +	phy_configure(hdmi->phy, &opts);
> +	phy_power_on(hdmi->phy);
> +	hdmi->powered = true;
> +}
> +
> +static void mtk_hdmi_bridge_enable(struct drm_bridge *bridge,
> +				   struct drm_bridge_state *old_state)
> +{
> +	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
> +	u8 buffer_spd[HDMI_INFOFRAME_SIZE(SPD)];
> +	u8 buffer_avi[HDMI_INFOFRAME_SIZE(AVI)];
> +
> +	phy_power_on(hdmi->phy);
> +	mtk_hdmi_send_infoframe(hdmi, buffer_spd, sizeof(buffer_spd),
> +				buffer_avi, sizeof(buffer_avi), &hdmi->mode);
> +	mtk_hdmi_hw_spd_infoframe(hdmi, buffer_spd, sizeof(buffer_spd));
> +	mtk_hdmi_hw_avi_infoframe(hdmi, buffer_avi, sizeof(buffer_avi));
> +
> +	mtk_hdmi_hw_vid_black(hdmi, false);
> +
> +	hdmi->enabled = true;
> +}
> +
> +static enum drm_connector_status mtk_hdmi_bridge_detect(struct drm_bridge *bridge)
> +{
> +	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
> +
> +	if (hdmi->hpd != HDMI_PLUG_IN_AND_SINK_POWER_ON &&
> +	    hdmi->hpd != HDMI_PLUG_IN_ONLY) {
> +		hdmi->support_csp_depth = RGB444_8bit;
> +		hdmi->set_csp_depth = RGB444_8bit;
> +		hdmi->csp = HDMI_COLORSPACE_RGB;
> +		hdmi->color_depth = HDMI_8_BIT;
> +		hdmi->colorimtery = HDMI_COLORIMETRY_NONE;
> +		hdmi->extended_colorimetry = HDMI_EXTENDED_COLORIMETRY_RESERVED;
> +		hdmi->quantization_range = HDMI_QUANTIZATION_RANGE_DEFAULT;
> +		hdmi->ycc_quantization_range =
> +			HDMI_YCC_QUANTIZATION_RANGE_LIMITED;
> +	}
> +
> +	return (hdmi->hpd != HDMI_PLUG_OUT) ? connector_status_connected :
> +						    connector_status_disconnected;
> +}
> +
> +const struct drm_bridge_funcs mtk_mt8195_hdmi_bridge_funcs = {
> +	.attach = mtk_hdmi_bridge_attach,
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
> +	.mode_fixup = mtk_hdmi_bridge_mode_fixup,
> +	.atomic_disable = mtk_hdmi_bridge_disable,
> +	.atomic_post_disable = mtk_hdmi_bridge_post_disable,
> +	.mode_set = mtk_hdmi_bridge_mode_set,
> +	.atomic_pre_enable = mtk_hdmi_bridge_pre_enable,
> +	.atomic_enable = mtk_hdmi_bridge_enable,
> +	.get_edid = mtk_hdmi_bridge_get_edid,
> +	.detect = mtk_hdmi_bridge_detect,
> +};
> diff --git a/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.h b/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.h
> new file mode 100644
> index 000000000000..f59aea51dc74
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2022 MediaTek Inc.
> + * Copyright (c) 2022 BayLibre, SAS
> + */
> +
> +#ifndef _MTK_HDMI_MT8195_CTRL_H
> +#define _MTK_HDMI_MT8195_CTRL_H
> +
> +#include <linux/hdmi.h>
> +#include <drm/drm_bridge.h>
> +
> +struct mtk_hdmi;
> +
> +extern struct platform_driver mtk_hdmi_mt8195_ddc_driver;
> +extern const struct drm_bridge_funcs mtk_mt8195_hdmi_bridge_funcs;
> +void mtk_hdmi_output_init_mt8195(struct mtk_hdmi *hdmi);
> +int mtk_hdmi_clk_enable_mt8195(struct mtk_hdmi *hdmi);
> +void mtk_hdmi_clk_disable_mt8195(struct mtk_hdmi *hdmi);
> +
> +enum mtk_hdmi_clk_id_mt8195 {
> +	MTK_MT8195_HDIM_HDCP_SEL,
> +	MTK_MT8195_HDMI_HDCP_24M_SEL,
> +	MTK_MT8195_HDMI_VPP_SPLIT_HDMI,
> +	MTK_MT8195_HDMI_CLK_COUNT,
> +};
> +
> +extern const char *const mtk_hdmi_clk_names_mt8195[MTK_MT8195_HDMI_CLK_COUNT];
> +#endif /* _MTK_HDMI_MT8195_CTRL_H */
> diff --git a/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.c b/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.c
> new file mode 100644
> index 000000000000..a6b734b215a9
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.c
> @@ -0,0 +1,539 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + * Copyright (c) 2021 BayLibre, SAS
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/time.h>
> +#include <linux/delay.h>
> +#include <linux/errno.h>
> +#include <linux/err.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/regmap.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_platform.h>
> +#include <linux/semaphore.h>
> +#include <linux/clk.h>
> +#include <linux/i2c.h>
> +#include <linux/mutex.h>
> +
> +#include <drm/drm_edid.h>
> +
> +#include "mtk_mt8195_hdmi_regs.h"
> +#include "mtk_mt8195_hdmi.h"
> +
> +#define EDID_ID 0x50
> +#define DDC2_CLOK 572 /* BIM=208M/(v*4) = 90Khz */
> +#define DDC2_CLOK_EDID 832 /* BIM=208M/(v*4) = 62.5Khz */
> +
> +struct mtk_hdmi_ddc {
> +	/* Serialize read/write operations */
> +	struct mutex mtx;
> +	struct i2c_adapter adap;
> +	struct clk *clk;
> +	void __iomem *regs;
> +};
> +
> +enum sif_bit_t_hdmi {
> +	SIF_8_BIT_HDMI, /* /< [8 bits data address.] */
> +	SIF_16_BIT_HDMI, /* /< [16 bits data address.] */
> +};
> +
> +static inline unsigned int mtk_ddc_read(struct mtk_hdmi_ddc *ddc,
> +					unsigned short reg, u32 *val)

You don't need this function.

> +{
> +	return regmap_read(ddc->regs, reg, val);
> +}
> +
> +static inline void mtk_ddc_write(struct mtk_hdmi_ddc *ddc, unsigned short reg,
> +				 unsigned int val)

Same here.

> +{
> +	regmap_write(ddc->regs, reg, val);
> +}
> +
> +static inline void mtk_ddc_mask(struct mtk_hdmi_ddc *ddc, unsigned int reg,
> +				unsigned int val, unsigned int mask)

And again.

> +{
> +	regmap_update_bits(ddc->regs, reg, mask, val);
> +}
> +
> +static void hdmi_ddc_request(struct mtk_hdmi_ddc *ddc)
> +{
> +	mtk_ddc_mask(ddc, HDCP2X_POL_CTRL, HDCP2X_DIS_POLL_EN,
> +		     HDCP2X_DIS_POLL_EN);
> +}
> +
> +static void DDC_WR_ONE(struct mtk_hdmi_ddc *ddc, unsigned int addr_id,

Lower case for function names, please.

> +		       unsigned int offset_id, unsigned char wr_data)
> +{
> +	u32 val;
> +
> +	mtk_ddc_read(ddc, HDCP2X_DDCM_STATUS, &val);
> +
> +	if (val & DDC_I2C_BUS_LOW) {
> +		mtk_ddc_mask(ddc, DDC_CTRL, (CLOCK_SCL << DDC_CMD_SHIFT),
> +			     DDC_CMD);
> +		usleep_range(250, 300);
> +	}
> +	mtk_ddc_mask(ddc, HPD_DDC_CTRL, DDC2_CLOK << DDC_DELAY_CNT_SHIFT,
> +		     DDC_DELAY_CNT);
> +	mtk_ddc_write(ddc, SI2C_CTRL, SI2C_ADDR_READ << SI2C_ADDR_SHIFT);

Check include/linux/bitfield.h - I see lots of open coded FIELD_PREP(...) here
and in other functions of this file :-)

> +	mtk_ddc_mask(ddc, SI2C_CTRL, wr_data << SI2C_WDATA_SHIFT, SI2C_WDATA);
> +	mtk_ddc_mask(ddc, SI2C_CTRL, SI2C_WR, SI2C_WR);
> +
> +	mtk_ddc_write(ddc, DDC_CTRL,
> +		      (SEQ_WRITE_REQ_ACK << DDC_CMD_SHIFT) +
> +			      (1 << DDC_DIN_CNT_SHIFT) +
> +			      (offset_id << DDC_OFFSET_SHIFT) + (addr_id << 1));
> +
> +	usleep_range(1000, 1250);
> +	mtk_ddc_read(ddc, HDCP2X_DDCM_STATUS, &val);
> +
> +	if ((val & DDC_I2C_NO_ACK) | DDC_I2C_BUS_LOW) {

I think here you were meaning

	if (val & (DDC_I2C_NO_ACK | DDC_I2C_BUS_LOW)) {

> +		mtk_ddc_read(ddc, HDCP2X_DDCM_STATUS, &val);

Why are you reading the same register again? I don't think that this will
ever change in the order of a few nanoseconds...

> +		if (val & DDC_I2C_BUS_LOW) {
> +			mtk_ddc_mask(ddc, DDC_CTRL,
> +				     (CLOCK_SCL << DDC_CMD_SHIFT), DDC_CMD);
> +			usleep_range(250, 300);
> +		}
> +	}
> +}
> +
> +static unsigned char
> +ddcm_read_hdmi(struct mtk_hdmi_ddc *ddc,
> +	       unsigned int u4_clk_div, unsigned char uc_dev, unsigned int u4_addr,
> +	       enum sif_bit_t_hdmi uc_addr_type, unsigned char *puc_value,
> +	       unsigned int u4_count)
> +{
> +	unsigned int i, temp_length, loop_counter, temp_ksvlist, device_n;
> +	unsigned int uc_read_count, uc_idx;
> +	unsigned long ddc_start_time, ddc_end_time, ddc_timeout;
> +	u32 val;
> +
> +	if (!puc_value || !u4_count || !u4_clk_div)
> +		return 0;
> +
> +	uc_idx = 0;
> +	mtk_ddc_read(ddc, HDCP2X_DDCM_STATUS, &val);
> +	if (val & DDC_I2C_BUS_LOW) {
> +		mtk_ddc_mask(ddc, DDC_CTRL, (CLOCK_SCL << DDC_CMD_SHIFT),
> +			     DDC_CMD);
> +		usleep_range(250, 300);
> +	}
> +
> +	mtk_ddc_mask(ddc, DDC_CTRL, (CLEAR_FIFO << DDC_CMD_SHIFT), DDC_CMD);
> +
> +	if (u4_addr == 0x43) {

I don't really understand what's that 0x43 magic address, please add a comment
in the code explaining that and a definition for it.

> +		mtk_ddc_write(ddc, DDC_CTRL,
> +			      (SEQ_READ_NO_ACK << DDC_CMD_SHIFT) +
> +				      (u4_count << DDC_DIN_CNT_SHIFT) +
> +				      (u4_addr << DDC_OFFSET_SHIFT) +
> +				      (uc_dev << 1));

..snip..

> +			usleep_range(5000, 5500);
> +			ddc_start_time = jiffies;
> +			ddc_timeout = temp_length + 5;
> +			ddc_end_time = ddc_start_time + ddc_timeout * HZ / 1000;
> +			while (1) {

This block can be expressed in one call.

ret = regmap_read_poll_timeout(regmap, HPD_DDC_STATUS, &val,
			       !(val & DDC_I2C_IN_PROG), 2000, ddc_timeout_us);

> +				mtk_ddc_read(ddc, HPD_DDC_STATUS, &val);
> +				if ((val & DDC_I2C_IN_PROG) == 0)
> +					break;
> +
> +				if (time_after(jiffies, ddc_end_time)) {
> +					pr_info("[HDMI][DDC] error: time out\n");
> +					return 0;
> +				}
> +				usleep_range(1000, 1500);
> +			}

..snip..

> +
> +static unsigned char fg_ddc_data_read(struct mtk_hdmi_ddc *ddc,

static unsigned bool

> +				      unsigned char b_dev,
> +				      unsigned char b_data_addr,
> +				      unsigned char b_data_count,
> +				      unsigned char *pr_data)
> +{
> +	bool flag;
> +

int ret;

mutex_lock()
ret = vddc_read(....)
mutex_unlock();

return !!ret;

> +	mutex_lock(&ddc->mtx);
> +
> +	hdmi_ddc_request(ddc);
> +	if (vddc_read(ddc, DDC2_CLOK, (unsigned char)b_dev,
> +		      (unsigned int)b_data_addr, SIF_8_BIT_HDMI,
> +		      (unsigned char *)pr_data,
> +		      (unsigned int)b_data_count) == b_data_count) {
> +		flag = true;
> +	} else {
> +		flag = false;
> +	}
> +
> +	mutex_unlock(&ddc->mtx);
> +	return flag;
> +}
> +
> +static unsigned char fg_ddc_data_write(struct mtk_hdmi_ddc *ddc,

static void? or can hdmi_ddc_request/ddc_wr_one return a failure?

> +				       unsigned char b_dev,
> +				       unsigned char b_data_addr,
> +				       unsigned char b_data_count,
> +				       unsigned char *pr_data)
> +{
> +	unsigned int i;
> +
> +	mutex_lock(&ddc->mtx);
> +
> +	hdmi_ddc_request(ddc);
> +	for (i = 0; i < b_data_count; i++)
> +		DDC_WR_ONE(ddc, b_dev, b_data_addr + i, *(pr_data + i));
> +
> +	mutex_unlock(&ddc->mtx);
> +	return 1;
> +}
> +

..snip..

> +
> +static int mtk_hdmi_ddc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct mtk_hdmi_ddc *ddc;
> +	int ret;
> +
> +	ddc = devm_kzalloc(dev, sizeof(struct mtk_hdmi_ddc), GFP_KERNEL);
> +	if (!ddc)
> +		return -ENOMEM;
> +
> +	ddc->regs = syscon_regmap_lookup_by_compatible("mediatek,mt8195-hdmi");
> +	if (IS_ERR(ddc->regs))
> +		return dev_err_probe(dev, PTR_ERR(ddc->regs), "Unable to get mt8195-hdmi syscon");
> +
> +	ddc->clk = devm_clk_get(dev, "ddc-i2c");

I think that just "ddc" is also fine, as name.

Besides, you can shorten this out:

	ddc->clk = devm_clk_get_enabled(dev, "ddc");

> +	if (IS_ERR(ddc->clk)) {
> +		dev_err(dev, "get ddc_clk failed: %p ,\n", ddc->clk);
> +		return PTR_ERR(ddc->clk);
> +	}
> +	ret = clk_prepare_enable(ddc->clk);
> +	if (ret) {
> +		dev_err(dev, "enable ddc clk failed!\n");
> +		return ret;
> +	}
> +
> +	mutex_init(&ddc->mtx);
> +
> +	strscpy(ddc->adap.name, "mediatek-hdmi-ddc", sizeof(ddc->adap.name));
> +	ddc->adap.owner = THIS_MODULE;
> +	ddc->adap.class = I2C_CLASS_DDC;
> +	ddc->adap.algo = &mtk_hdmi_ddc_algorithm;
> +	ddc->adap.retries = 3;
> +	ddc->adap.dev.of_node = dev->of_node;
> +	ddc->adap.algo_data = ddc;
> +	ddc->adap.dev.parent = &pdev->dev;
> +
> +	ret = i2c_add_adapter(&ddc->adap);

ret = devm_i2c_add_adapter(&ddc->adap);

> +	if (ret < 0) {
> +		dev_err(dev, "failed to add bus to i2c core\n");
> +		goto err_clk_disable;
> +	}
> +
> +	platform_set_drvdata(pdev, ddc);
> +	return 0;
> +
> +err_clk_disable:
> +	clk_disable_unprepare(ddc->clk);
> +	return ret;
> +}
> +

Regards,
Angelo

