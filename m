Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C85181A85
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 14:57:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B186E1FB;
	Wed, 11 Mar 2020 13:57:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BFB36E1FB
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 13:57:00 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id n8so2194012wmc.4
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 06:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eP5B12Iin5AOGx+bY3oMJduGL6svVsZhG2x1oXXR+cM=;
 b=zNLw9uQxLElP8LuET1P9o4KdhzosxlRz4R8y6Cg5HPqv1Jhv0uS92raV0LAe7ps+7C
 YLkXl5cejzD73MpJPUFispu8IScfXL4G70GUEPjI9XpfggH/a/02vx5++1a0PlChNHLk
 1eVExK0Y+7YOAqUjR+oVK2GVExIamCX+DruQI7j3Y/K0eW/m618ZMQEN/M+TGSS1a14+
 jbKqvKLEs9Xe7VT5hVh3XrVrBgSLA1CVkCWiVSDCCH9kwuTAMjZ5r4RDEGN/0Y4uFdVp
 ES9s0nkRM5SieZIzoHqAydDhrmJtj839ghHnAFjuJbdidlzSe1zX6rMGflsjmsxlpoF6
 wMpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=eP5B12Iin5AOGx+bY3oMJduGL6svVsZhG2x1oXXR+cM=;
 b=oahzpuLs+Go/bwebbKpNNWnX3W1/oLWg9adn4ZBjN7PSqFeQ9pUdf12LF/71RJJMNy
 EMCKHGvXuJUjwcqbSB7gB/Oy2I49lPcdhuwWuEzEikEHOvEYN5009OfxPPy2Do38Qy/0
 WLDxBaq4Oc4iBomyI+FwD/iog2TMu3g/u8X8tNu9BI5bmXvT7DzFF8EqlzL13jDurg6J
 s3Db+iUiFxGL4T0K8b+YyHW6H6sH5EOopKqObkQ/YosAJ2t5aEtW4L8mbOt9ZJqL3CJq
 q3CIGJ7EoWO0RUfz3Cip4vUs8Mj8tk6VTOULROMvOao+LNHmKVC+BvOh6DMlb4WPBs3g
 yg+w==
X-Gm-Message-State: ANhLgQ1Dz5v+loJhBUgIQPG2TtEv1EklL9tmYgDddcHcBab99VYzXKYa
 VuffmgHSYJ9MQupCVJzmK8BrWA==
X-Google-Smtp-Source: ADFU+vuVCbxLxvwDV80YtRJPYtrM3jSj45mkKh6Zy9tISMTyxX1rJG46k0FTnRLAAsbDxBLEJOqRhQ==
X-Received: by 2002:a05:600c:22d8:: with SMTP id
 24mr1527490wmg.108.1583935018691; 
 Wed, 11 Mar 2020 06:56:58 -0700 (PDT)
Received: from [10.1.3.173]
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id e1sm59569460wrx.90.2020.03.11.06.56.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Mar 2020 06:56:58 -0700 (PDT)
Subject: Re: [PATCH v13 5/6] drm/mediatek: dpi sample mode support
To: Jitao Shi <jitao.shi@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20200311071823.117899-1-jitao.shi@mediatek.com>
 <20200311071823.117899-6-jitao.shi@mediatek.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <1753781a-7b99-bc1a-22e4-2df2f45a6419@baylibre.com>
Date: Wed, 11 Mar 2020 14:56:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200311071823.117899-6-jitao.shi@mediatek.com>
Content-Language: en-US
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 huijuan.xie@mediatek.com, stonea168@163.com, cawa.cheng@mediatek.com,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mediatek@lists.infradead.org, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/03/2020 08:18, Jitao Shi wrote:
> DPI can sample on falling, rising or both edge.
> When DPI sample the data both rising and falling edge.
> It can reduce half data io pins.
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 27 +++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 087f5ce732e1..2871e68e7767 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -75,6 +75,7 @@ struct mtk_dpi {
>  	enum mtk_dpi_out_bit_num bit_num;
>  	enum mtk_dpi_out_channel_swap channel_swap;
>  	int refcount;
> +	u32 pclk_sample;
>  };
>  
>  static inline struct mtk_dpi *mtk_dpi_from_encoder(struct drm_encoder *e)
> @@ -348,6 +349,13 @@ static void mtk_dpi_config_disable_edge(struct mtk_dpi *dpi)
>  		mtk_dpi_mask(dpi, dpi->conf->reg_h_fre_con, 0, EDGE_SEL_EN);
>  }
>  
> +static void mtk_dpi_enable_pclk_sample_dual_edge(struct mtk_dpi *dpi)
> +{
> +	mtk_dpi_mask(dpi, DPI_DDR_SETTING, DDR_EN | DDR_4PHASE,
> +		     DDR_EN | DDR_4PHASE);
> +	mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, EDGE_SEL, EDGE_SEL);
> +}
> +
>  static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
>  					enum mtk_dpi_out_color_format format)
>  {
> @@ -439,7 +447,8 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
>  	pll_rate = clk_get_rate(dpi->tvd_clk);
>  
>  	vm.pixelclock = pll_rate / factor;
> -	clk_set_rate(dpi->pixel_clk, vm.pixelclock);
> +	clk_set_rate(dpi->pixel_clk,
> +		     vm.pixelclock * (dpi->pclk_sample > 1 ? 2 : 1));
>  	vm.pixelclock = clk_get_rate(dpi->pixel_clk);
>  
>  	dev_dbg(dpi->dev, "Got  PLL %lu Hz, pixel clock %lu Hz\n",
> @@ -450,7 +459,8 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
>  	limit.y_bottom = 0x0010;
>  	limit.y_top = 0x0FE0;
>  
> -	dpi_pol.ck_pol = MTK_DPI_POLARITY_FALLING;
> +	dpi_pol.ck_pol = dpi->pclk_sample == 1 ?
> +			 MTK_DPI_POLARITY_RISING : MTK_DPI_POLARITY_FALLING;
>  	dpi_pol.de_pol = MTK_DPI_POLARITY_RISING;
>  	dpi_pol.hsync_pol = vm.flags & DISPLAY_FLAGS_HSYNC_HIGH ?
>  			    MTK_DPI_POLARITY_FALLING : MTK_DPI_POLARITY_RISING;
> @@ -504,6 +514,8 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
>  	mtk_dpi_config_color_format(dpi, dpi->color_format);
>  	mtk_dpi_config_2n_h_fre(dpi);
>  	mtk_dpi_config_disable_edge(dpi);
> +	if (dpi->pclk_sample > 1)
> +		mtk_dpi_enable_pclk_sample_dual_edge(dpi);
>  	mtk_dpi_sw_reset(dpi, false);
>  
>  	return 0;
> @@ -693,6 +705,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
>  static int mtk_dpi_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> +	struct device_node *ep;
>  	struct mtk_dpi *dpi;
>  	struct resource *mem;
>  	int comp_id;
> @@ -705,6 +718,16 @@ static int mtk_dpi_probe(struct platform_device *pdev)
>  	dpi->dev = dev;
>  	dpi->conf = (struct mtk_dpi_conf *)of_device_get_match_data(dev);
>  
> +	ep = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
> +	if (!ep) {
> +		dev_err(dev, "Failed get the endpoint port\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Get the sampling edge from the endpoint. */
> +	of_property_read_u32(ep, "pclk-sample", &dpi->pclk_sample);
> +	of_node_put(ep);

Instead of having hard-coded value in DT, you should switch to bridge bus
format negotiation instead.

Boris pushed support a few weeks ago and the dw-hdmi bridge has been updated
to work with it and negotiate the format between the encoder and the bridge.

Phong is pushing the it66121 bridge driver which is used on a MT8183 board, and
should make use of that to handle the dual edge support between the 8183 dpi and
the it66121 bridge.

Neil

> +
>  	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	dpi->regs = devm_ioremap_resource(dev, mem);
>  	if (IS_ERR(dpi->regs)) {
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
