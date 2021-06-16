Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FF03A95CC
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 11:16:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF0C89A88;
	Wed, 16 Jun 2021 09:16:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5EA389A88
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 09:16:18 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id v9so1815648wrx.6
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 02:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VuU2P/MyGYM6RxpI7fo/PQuftfbqNmxoVc02nqwlfD4=;
 b=XG/OJYTVoxDusjZv7vFlMRPnGVFpUZ8mF0A9/HEez1Pp8Mb6/LMN/zS1UhB5hON43t
 W4c5Hpw+wnnN1zJGlWEoM6yy6gYd8+oaZll1DbeF0hDft+wyqYOcIJRbDgemqOCkQCb1
 HOpk4kyRu0Oe6KgOJCcLPKUDgOSwncO+Rbz03ZoUD2J9J7UUeCNm/SdRvFzuohxfX89q
 96nftncOP3gILyHxxY1FYiXCAK6Sjc1sYeJcX54Phvrt2KppEYe1ewHmIPr48jJmEwr3
 ORqoFz+qdCF3swTvCSWfp2uWF8RbRBynYEJjYKLlHc9mwMaFjvkkFplNCNmScXPQ7RmE
 fJdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=VuU2P/MyGYM6RxpI7fo/PQuftfbqNmxoVc02nqwlfD4=;
 b=pqKOOcZ0t1ocNCsVE0qPb9GH1wJzdi2yhi7de4dJY7VbPmQZ8h8ii2tkzXjgI3MeDX
 ZKH+idbQOxtW9jKf0rS0gAV++jBaLNZcJRcEef6I/dJHXrO38LsgUBVDd9DOlnkexYJJ
 0kNVJVxy9CSqaAxcxGT/7Ekpmc7BgxhCauXSa3vez0L5/I76gebbbLgpu/183j7236KA
 ZJD3U/EQPLzOk4beiyh0JxB1nL013tugW/VUsGEmhOp1y2T3R5WNMKy7J2M1NlkeV6q4
 EDcbRHwRn4xPOgChqxtiKHoYRb+RG/upiYoqzPjuHl4HZAKWl4wFG/eLHEvR1jvnCmuM
 zdIw==
X-Gm-Message-State: AOAM531KspNvhW+ILmDdAD8LAfwrrJSXGhJOYlb5n9yWLWDFMbBdqbKu
 V9F6hZ3bAMOD3TIeVeFcQ58dMQ==
X-Google-Smtp-Source: ABdhPJzuaA9lMuWR5AGBHFP6E2vRmzOMsIahc9F7SJMRqikyv1guP5EuBfS9UExQhI0Npr7O8PWMuA==
X-Received: by 2002:a5d:6584:: with SMTP id q4mr4108585wru.230.1623834977248; 
 Wed, 16 Jun 2021 02:16:17 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:1dbd:a958:ade:3ee6?
 ([2a01:e0a:90c:e290:1dbd:a958:ade:3ee6])
 by smtp.gmail.com with ESMTPSA id h46sm1653801wrh.44.2021.06.16.02.16.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 02:16:16 -0700 (PDT)
Subject: Re: [PATCH v8 3/4] drm/bridge: anx7625: add MIPI DPI input feature
To: Xin Ji <xji@analogixsemi.com>, Robert Foss <robert.foss@linaro.org>,
 Nicolas Boichat <drinkcat@google.com>, Andrzej Hajda <a.hajda@samsung.com>
References: <cover.1623725300.git.xji@analogixsemi.com>
 <d23737053c54d4c6f9a05da12e807264298a3063.1623725300.git.xji@analogixsemi.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <622199f2-0faf-1c92-d718-b983a9e77c4c@baylibre.com>
Date: Wed, 16 Jun 2021 11:16:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <d23737053c54d4c6f9a05da12e807264298a3063.1623725300.git.xji@analogixsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: devel@driverdev.osuosl.org, Sheng Pan <span@analogixsemi.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Bernie Liang <bliang@analogixsemi.com>, Zhen Li <zhenli@analogixsemi.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Torsten Duwe <duwe@lst.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/06/2021 09:50, Xin Ji wrote:
> The basic anx7625 driver only support MIPI DSI rx signal input.
> This patch add MIPI DPI rx input configuration support, after apply
> this patch, the driver can support DSI rx or DPI rx by adding
> 'bus-type' in DT.
> 
> Reviewed-by: Robert Foss <robert.foss@linaro.org>
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 245 ++++++++++++++++------
>  drivers/gpu/drm/bridge/analogix/anx7625.h |  18 +-
>  2 files changed, 203 insertions(+), 60 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 048080e75016..fb2301a92704 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -152,18 +152,18 @@ static int anx7625_write_and(struct anx7625_data *ctx,
>  	return anx7625_reg_write(ctx, client, offset, (val & (mask)));
>  }
>  
> -static int anx7625_write_and_or(struct anx7625_data *ctx,
> -				struct i2c_client *client,
> -				u8 offset, u8 and_mask, u8 or_mask)
> +static int anx7625_config_bit_matrix(struct anx7625_data *ctx)
>  {
> -	int val;
> +	int i, ret;
>  
> -	val = anx7625_reg_read(ctx, client, offset);
> -	if (val < 0)
> -		return val;
> +	ret = anx7625_write_or(ctx, ctx->i2c.tx_p2_client,
> +			       AUDIO_CONTROL_REGISTER, 0x80);
> +	for (i = 0; i < 13; i++)
> +		ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
> +					 VIDEO_BIT_MATRIX_12 + i,
> +					 0x18 + i);
>  
> -	return anx7625_reg_write(ctx, client,
> -				 offset, (val & and_mask) | (or_mask));
> +	return ret;
>  }
>  
>  static int anx7625_read_ctrl_status_p0(struct anx7625_data *ctx)
> @@ -221,38 +221,6 @@ static int anx7625_video_mute_control(struct anx7625_data *ctx,
>  	return ret;
>  }
>  
> -static int anx7625_config_audio_input(struct anx7625_data *ctx)
> -{
> -	struct device *dev = &ctx->client->dev;
> -	int ret;
> -
> -	/* Channel num */
> -	ret = anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
> -				AUDIO_CHANNEL_STATUS_6, I2S_CH_2 << 5);
> -
> -	/* FS */
> -	ret |= anx7625_write_and_or(ctx, ctx->i2c.tx_p2_client,
> -				    AUDIO_CHANNEL_STATUS_4,
> -				    0xf0, AUDIO_FS_48K);
> -	/* Word length */
> -	ret |= anx7625_write_and_or(ctx, ctx->i2c.tx_p2_client,
> -				    AUDIO_CHANNEL_STATUS_5,
> -				    0xf0, AUDIO_W_LEN_24_24MAX);
> -	/* I2S */
> -	ret |= anx7625_write_or(ctx, ctx->i2c.tx_p2_client,
> -				AUDIO_CHANNEL_STATUS_6, I2S_SLAVE_MODE);
> -	ret |= anx7625_write_and(ctx, ctx->i2c.tx_p2_client,
> -				 AUDIO_CONTROL_REGISTER, ~TDM_TIMING_MODE);
> -	/* Audio change flag */
> -	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p0_client,
> -				AP_AV_STATUS, AP_AUDIO_CHG);
> -
> -	if (ret < 0)
> -		DRM_DEV_ERROR(dev, "fail to config audio.\n");
> -
> -	return ret;
> -}
> -
>  /* Reduction of fraction a/b */
>  static void anx7625_reduction_of_a_fraction(unsigned long *a, unsigned long *b)
>  {
> @@ -412,7 +380,7 @@ static int anx7625_dsi_video_timing_config(struct anx7625_data *ctx)
>  	ret |= anx7625_write_and(ctx, ctx->i2c.rx_p1_client,
>  			MIPI_LANE_CTRL_0, 0xfc);
>  	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client,
> -				MIPI_LANE_CTRL_0, 3);
> +				MIPI_LANE_CTRL_0, ctx->pdata.mipi_lanes - 1);
>  
>  	/* Htotal */
>  	htotal = ctx->dt.hactive.min + ctx->dt.hfront_porch.min +
> @@ -597,6 +565,76 @@ static int anx7625_dsi_config(struct anx7625_data *ctx)
>  	return ret;
>  }
>  
> +static int anx7625_api_dpi_config(struct anx7625_data *ctx)
> +{
> +	struct device *dev = &ctx->client->dev;
> +	u16 freq = ctx->dt.pixelclock.min / 1000;
> +	int ret;
> +
> +	/* configure pixel clock */
> +	ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> +				PIXEL_CLOCK_L, freq & 0xFF);
> +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> +				 PIXEL_CLOCK_H, (freq >> 8));
> +
> +	/* set DPI mode */
> +	/* set to DPI PLL module sel */
> +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> +				 MIPI_DIGITAL_PLL_9, 0x20);
> +	/* power down MIPI */
> +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> +				 MIPI_LANE_CTRL_10, 0x08);
> +	/* enable DPI mode */
> +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> +				 MIPI_DIGITAL_PLL_18, 0x1C);
> +	/* set first edge */
> +	ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
> +				 VIDEO_CONTROL_0, 0x06);
> +	if (ret < 0)
> +		DRM_DEV_ERROR(dev, "IO error : dpi phy set failed.\n");
> +
> +	return ret;
> +}
> +
> +static int anx7625_dpi_config(struct anx7625_data *ctx)
> +{
> +	struct device *dev = &ctx->client->dev;
> +	int ret;
> +
> +	DRM_DEV_DEBUG_DRIVER(dev, "config dpi\n");
> +
> +	/* DSC disable */
> +	ret = anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
> +				R_DSC_CTRL_0, ~DSC_EN);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(dev, "IO error : disable dsc failed.\n");
> +		return ret;
> +	}
> +
> +	ret = anx7625_config_bit_matrix(ctx);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(dev, "config bit matrix failed.\n");
> +		return ret;
> +	}
> +
> +	ret = anx7625_api_dpi_config(ctx);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(dev, "mipi phy(dpi) setup failed.\n");
> +		return ret;
> +	}
> +
> +	/* set MIPI RX EN */
> +	ret = anx7625_write_or(ctx, ctx->i2c.rx_p0_client,
> +			       AP_AV_STATUS, AP_MIPI_RX_EN);
> +	/* clear mute flag */
> +	ret |= anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
> +				 AP_AV_STATUS, (u8)~AP_MIPI_MUTE);
> +	if (ret < 0)
> +		DRM_DEV_ERROR(dev, "IO error : enable mipi rx failed.\n");
> +
> +	return ret;
> +}
> +
>  static void anx7625_dp_start(struct anx7625_data *ctx)
>  {
>  	int ret;
> @@ -607,9 +645,10 @@ static void anx7625_dp_start(struct anx7625_data *ctx)
>  		return;
>  	}
>  
> -	anx7625_config_audio_input(ctx);
> -
> -	ret = anx7625_dsi_config(ctx);
> +	if (ctx->pdata.is_dpi)
> +		ret = anx7625_dpi_config(ctx);
> +	else
> +		ret = anx7625_dsi_config(ctx);
>  
>  	if (ret < 0)
>  		DRM_DEV_ERROR(dev, "MIPI phy setup error.\n");
> @@ -1047,6 +1086,7 @@ static void anx7625_start_dp_work(struct anx7625_data *ctx)
>  		return;
>  	}
>  
> +	ctx->hpd_status = 1;
>  	ctx->hpd_high_cnt++;
>  
>  	/* Not support HDCP */
> @@ -1056,8 +1096,10 @@ static void anx7625_start_dp_work(struct anx7625_data *ctx)
>  	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xec, 0x10);
>  	/* Interrupt for DRM */
>  	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xff, 0x01);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(dev, "fail to setting HDCP/auth\n");
>  		return;
> +	}
>  
>  	ret = anx7625_reg_read(ctx, ctx->i2c.rx_p1_client, 0x86);
>  	if (ret < 0)
> @@ -1076,6 +1118,10 @@ static void anx7625_hpd_polling(struct anx7625_data *ctx)
>  	int ret, val;
>  	struct device *dev = &ctx->client->dev;
>  
> +	/* Interrupt mode, no need poll HPD status, just return */
> +	if (ctx->pdata.intp_irq)
> +		return;
> +
>  	ret = readx_poll_timeout(anx7625_read_hpd_status_p0,
>  				 ctx, val,
>  				 ((val & HPD_STATUS) || (val < 0)),
> @@ -1103,6 +1149,21 @@ static void anx7625_remove_edid(struct anx7625_data *ctx)
>  	ctx->slimport_edid_p.edid_block_num = -1;
>  }
>  
> +static void anx7625_dp_adjust_swing(struct anx7625_data *ctx)
> +{
> +	int i;
> +
> +	for (i = 0; i < ctx->pdata.dp_lane0_swing_reg_cnt; i++)
> +		anx7625_reg_write(ctx, ctx->i2c.tx_p1_client,
> +				  DP_TX_LANE0_SWING_REG0 + i,
> +				  ctx->pdata.lane0_reg_data[i] & 0xFF);
> +
> +	for (i = 0; i < ctx->pdata.dp_lane1_swing_reg_cnt; i++)
> +		anx7625_reg_write(ctx, ctx->i2c.tx_p1_client,
> +				  DP_TX_LANE1_SWING_REG0 + i,
> +				  ctx->pdata.lane1_reg_data[i] & 0xFF);
> +}
> +
>  static void dp_hpd_change_handler(struct anx7625_data *ctx, bool on)
>  {
>  	struct device *dev = &ctx->client->dev;
> @@ -1118,9 +1179,8 @@ static void dp_hpd_change_handler(struct anx7625_data *ctx, bool on)
>  	} else {
>  		DRM_DEV_DEBUG_DRIVER(dev, " HPD high\n");
>  		anx7625_start_dp_work(ctx);
> +		anx7625_dp_adjust_swing(ctx);
>  	}
> -
> -	ctx->hpd_status = 1;
>  }
>  
>  static int anx7625_hpd_change_detect(struct anx7625_data *ctx)
> @@ -1197,20 +1257,72 @@ static irqreturn_t anx7625_intr_hpd_isr(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
>  
> +static int anx7625_get_swing_setting(struct device *dev,
> +				     struct anx7625_platform_data *pdata)
> +{
> +	int num_regs;
> +
> +	if (of_get_property(dev->of_node,
> +			    "analogix,lane0-swing", &num_regs)) {
> +		if (num_regs > DP_TX_SWING_REG_CNT)
> +			num_regs = DP_TX_SWING_REG_CNT;
> +
> +		pdata->dp_lane0_swing_reg_cnt = num_regs;
> +		of_property_read_u32_array(dev->of_node, "analogix,lane0-swing",
> +					   pdata->lane0_reg_data, num_regs);
> +	}
> +
> +	if (of_get_property(dev->of_node,
> +			    "analogix,lane1-swing", &num_regs)) {
> +		if (num_regs > DP_TX_SWING_REG_CNT)
> +			num_regs = DP_TX_SWING_REG_CNT;
> +
> +		pdata->dp_lane1_swing_reg_cnt = num_regs;
> +		of_property_read_u32_array(dev->of_node, "analogix,lane1-swing",
> +					   pdata->lane1_reg_data, num_regs);
> +	}
> +
> +	return 0;
> +}
> +
>  static int anx7625_parse_dt(struct device *dev,
>  			    struct anx7625_platform_data *pdata)
>  {
> -	struct device_node *np = dev->of_node;
> +	struct device_node *np = dev->of_node, *ep0;
>  	struct drm_panel *panel;
>  	int ret;
> +	int bus_type, mipi_lanes;
>  
> +	anx7625_get_swing_setting(dev, pdata);
> +
> +	pdata->is_dpi = 1; /* default dpi mode */
>  	pdata->mipi_host_node = of_graph_get_remote_node(np, 0, 0);
>  	if (!pdata->mipi_host_node) {
>  		DRM_DEV_ERROR(dev, "fail to get internal panel.\n");
>  		return -ENODEV;
>  	}
>  
> -	DRM_DEV_DEBUG_DRIVER(dev, "found dsi host node.\n");
> +	bus_type = 5;
> +	mipi_lanes = MAX_LANES_SUPPORT;
> +	ep0 = of_graph_get_endpoint_by_regs(np, 0, 0);
> +	if (ep0) {
> +		if (of_property_read_u32(ep0, "bus-type", &bus_type))
> +			bus_type = 0;
> +
> +		mipi_lanes = of_property_count_u32_elems(ep0, "data-lanes");
> +	}
> +
> +	if (bus_type == 5) /* bus type is Parallel(DSI) */
> +		pdata->is_dpi = 0;

Maybe you can use the include/media/v4l2-fwnode.h V4L2_FWNODE_BUS_TYPE_ defines here instead.

Neil

> +
> +	pdata->mipi_lanes = mipi_lanes;
> +	if (pdata->mipi_lanes > MAX_LANES_SUPPORT || pdata->mipi_lanes <= 0)
> +		pdata->mipi_lanes = MAX_LANES_SUPPORT;
> +
> +	if (pdata->is_dpi)
> +		DRM_DEV_DEBUG_DRIVER(dev, "found MIPI DPI host node.\n");
> +	else
> +		DRM_DEV_DEBUG_DRIVER(dev, "found MIPI DSI host node.\n");
>  
>  	ret = drm_of_find_panel_or_bridge(np, 1, 0, &panel, NULL);
>  	if (ret < 0) {
> @@ -1273,9 +1385,13 @@ static enum drm_connector_status anx7625_sink_detect(struct anx7625_data *ctx)
>  {
>  	struct device *dev = &ctx->client->dev;
>  
> -	DRM_DEV_DEBUG_DRIVER(dev, "sink detect, return connected\n");
> +	DRM_DEV_DEBUG_DRIVER(dev, "sink detect\n");
> +
> +	if (ctx->pdata.panel_bridge)
> +		return connector_status_connected;
>  
> -	return connector_status_connected;
> +	return ctx->hpd_status ? connector_status_connected :
> +				     connector_status_disconnected;
>  }
>  
>  static int anx7625_attach_dsi(struct anx7625_data *ctx)
> @@ -1303,7 +1419,7 @@ static int anx7625_attach_dsi(struct anx7625_data *ctx)
>  		return -EINVAL;
>  	}
>  
> -	dsi->lanes = 4;
> +	dsi->lanes = ctx->pdata.mipi_lanes;
>  	dsi->format = MIPI_DSI_FMT_RGB888;
>  	dsi->mode_flags = MIPI_DSI_MODE_VIDEO	|
>  		MIPI_DSI_MODE_VIDEO_SYNC_PULSE	|
> @@ -1349,10 +1465,12 @@ static int anx7625_bridge_attach(struct drm_bridge *bridge,
>  		return -ENODEV;
>  	}
>  
> -	err = anx7625_attach_dsi(ctx);
> -	if (err) {
> -		DRM_DEV_ERROR(dev, "Fail to attach to dsi : %d\n", err);
> -		return err;
> +	if (!ctx->pdata.is_dpi) {
> +		err = anx7625_attach_dsi(ctx);
> +		if (err) {
> +			DRM_DEV_ERROR(dev, "Fail to attach to dsi : %d\n", err);
> +			return err;
> +		}
>  	}
>  
>  	if (ctx->pdata.panel_bridge) {
> @@ -1451,6 +1569,10 @@ static bool anx7625_bridge_mode_fixup(struct drm_bridge *bridge,
>  
>  	DRM_DEV_DEBUG_DRIVER(dev, "drm mode fixup set\n");
>  
> +	/* No need fixup for external monitor */
> +	if (!ctx->pdata.panel_bridge)
> +		return true;
> +
>  	hsync = mode->hsync_end - mode->hsync_start;
>  	hfp = mode->hsync_start - mode->hdisplay;
>  	hbp = mode->htotal - mode->hsync_end;
> @@ -1827,8 +1949,13 @@ static int anx7625_i2c_probe(struct i2c_client *client,
>  
>  	platform->bridge.funcs = &anx7625_bridge_funcs;
>  	platform->bridge.of_node = client->dev.of_node;
> -	platform->bridge.ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
> -	platform->bridge.type = DRM_MODE_CONNECTOR_eDP;
> +	platform->bridge.ops = DRM_BRIDGE_OP_EDID;
> +	if (!platform->pdata.panel_bridge)
> +		platform->bridge.ops |= DRM_BRIDGE_OP_HPD |
> +					DRM_BRIDGE_OP_DETECT;
> +	platform->bridge.type = platform->pdata.panel_bridge ?
> +				    DRM_MODE_CONNECTOR_eDP :
> +				    DRM_MODE_CONNECTOR_DisplayPort;
>  	drm_bridge_add(&platform->bridge);
>  
>  	DRM_DEV_DEBUG_DRIVER(dev, "probe done\n");
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
> index 034c3840028f..65db38e5da9a 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.h
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
> @@ -141,12 +141,20 @@
>  #define  HORIZONTAL_BACK_PORCH_H      0x22  /* Bit[7:4] are reserved */
>  
>  /******** END of I2C Address 0x72 *********/
> +
> +/***************************************************************/
> +/* Register definition of device address 0x7a */
> +#define DP_TX_SWING_REG_CNT		0x14
> +#define DP_TX_LANE0_SWING_REG0		0x00
> +#define DP_TX_LANE1_SWING_REG0		0x14
> +/******** END of I2C Address 0x7a *********/
> +
>  /***************************************************************/
>  /* Register definition of device address 0x7e */
>  
>  #define  I2C_ADDR_7E_FLASH_CONTROLLER  0x7E
>  
> -#define FLASH_LOAD_STA 0x05
> +#define FLASH_LOAD_STA          0x05
>  #define FLASH_LOAD_STA_CHK	BIT(7)
>  
>  #define  XTAL_FRQ_SEL    0x3F
> @@ -347,12 +355,20 @@ struct s_edid_data {
>  
>  /***************** Display End *****************/
>  
> +#define MAX_LANES_SUPPORT	4
> +
>  struct anx7625_platform_data {
>  	struct gpio_desc *gpio_p_on;
>  	struct gpio_desc *gpio_reset;
>  	struct regulator_bulk_data supplies[3];
>  	struct drm_bridge *panel_bridge;
>  	int intp_irq;
> +	int is_dpi;
> +	int mipi_lanes;
> +	int dp_lane0_swing_reg_cnt;
> +	int lane0_reg_data[DP_TX_SWING_REG_CNT];
> +	int dp_lane1_swing_reg_cnt;
> +	int lane1_reg_data[DP_TX_SWING_REG_CNT];
>  	u32 low_power_mode;
>  	struct device_node *mipi_host_node;
>  };
> 

