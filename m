Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F4E8AD594
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 22:06:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 067F0112D37;
	Mon, 22 Apr 2024 20:06:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jB3ryj8v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66F09112D37
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 20:06:29 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-51abd580902so3153590e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 13:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713816387; x=1714421187; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qxag7ElmBq2J0SNGaZ2Jsj7zD9XRYmia0SkaU81ZBXo=;
 b=jB3ryj8vJ2uq9gwKHZB6p+Jg9wbCsnKyJh0P1zsex56q8PNZdLRr4NI+v5pclfLfuo
 4ebIWYB98mMXhbpJWmrREq5hMAudZCTzZSbY51fzs2PIw4ZuIWFZNSCB8SsYXGK5+lIp
 +yb+YEYGb9qagj4cRMatca4LwEnoelqBosZHyyhWIzjBVE4KbvbF3Ly/WqmZQJd4ZvBH
 QkuRGN3itEzZZVVDN8qV32kvjKbRhX0d44TJivVJKQ/yp0V23TyS+/JQX1LW7KzELxJq
 ZZT8SqG9bZIwQAKYFpRInzrgPBOrbvEzcK+BHLvOpNFGUm1/4DHkIIDEpngA48DVaZyY
 nEZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713816387; x=1714421187;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qxag7ElmBq2J0SNGaZ2Jsj7zD9XRYmia0SkaU81ZBXo=;
 b=PFHUUQY5g5A9Zuxe+dT4bedr8rtebSmg7Mg50rrtXSbJxxBogovZqJSQDAyfzGsLc7
 yBlDpvye8uPGIc17d4Y/jhZVC5kkUHFtnEVdXkTOFD+jd7Xt8IEIllV+jb22zPu8q+J3
 2W8Ai+k7bUZD9+hIAVYVBHrJHzykeqW3I/u7T3N/6yKjoypS54cBjKFeiTt5yzsYqzce
 FfYmnT/14OAVKDrHdwW/MMrxeyMmKZZPlAHKz8wUoELXmXa5Us/FF1OvHhSBhHjGVnD9
 TVtR2kwIT3qCiWwTqY/UnVV4gRAy2Svbd+YWnad6w7HWEcy07eTtNK8WolVKnysr9Sz5
 9ymQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGcgjFfRwbjgteFMAGnjCjUK1zQWG3EimKjlgp7cPTsmO0+7x+KUh58qoOGkR6/ukfn15zoO7/dMuPfNdv7eJ+kSPTb5pDii+wdUP4si31
X-Gm-Message-State: AOJu0Yypo1gdxOOWbQPAq5dUhOqKKhUUskkzg7XerG6k7fhMspxAfmjj
 y4zC3n1UqRDC11TrqwuWr54c7Y4YTWNatabCQFXEu1EzUWW++OziBaw0WEI/NhA=
X-Google-Smtp-Source: AGHT+IFKRzJn5Y3fbci6M+062EmnXK4HLaS55hTHZT1r8HiXQ0ASlDALlzJt1N9v8o3vICMLlO6Cow==
X-Received: by 2002:a19:ca08:0:b0:519:2470:b1c5 with SMTP id
 a8-20020a19ca08000000b005192470b1c5mr204233lfg.10.1713816387326; 
 Mon, 22 Apr 2024 13:06:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 k8-20020a05651239c800b00517746176ebsm1811680lfu.49.2024.04.22.13.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 13:06:26 -0700 (PDT)
Date: Mon, 22 Apr 2024 23:06:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Phong LE <ple@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 7/9] drm-bridge: it66121: Use fwnode API to acquire
 device properties
Message-ID: <ugo62mcrvo5csp7umzvn3jhffh625agnjr3rtujnbgm7gxvgtr@re4q2xg46iqn>
References: <20240422191903.255642-1-sui.jingfeng@linux.dev>
 <20240422191903.255642-8-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240422191903.255642-8-sui.jingfeng@linux.dev>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 23, 2024 at 03:19:01AM +0800, Sui Jingfeng wrote:
> Make this driver DT-independent by calling the freshly created helpers,
> which reduce boilerplate and open the door for otherwise use cases. No
> functional changes for DT based systems.
> 
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> ---
>  drivers/gpu/drm/bridge/ite-it66121.c | 57 +++++++++++++++++-----------
>  1 file changed, 35 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
> index 925e42f46cd8..688dc1830654 100644
> --- a/drivers/gpu/drm/bridge/ite-it66121.c
> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> @@ -15,7 +15,6 @@
>  #include <linux/bitfield.h>
>  #include <linux/property.h>
>  #include <linux/regmap.h>
> -#include <linux/of_graph.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/regulator/consumer.h>
> @@ -1480,7 +1479,7 @@ static int it66121_audio_codec_init(struct it66121_ctx *ctx, struct device *dev)
>  
>  	dev_dbg(dev, "%s\n", __func__);
>  
> -	if (!of_property_read_bool(dev->of_node, "#sound-dai-cells")) {
> +	if (!fwnode_property_present(dev_fwnode(dev), "#sound-dai-cells")) {
>  		dev_info(dev, "No \"#sound-dai-cells\", no audio\n");
>  		return 0;
>  	}
> @@ -1503,13 +1502,36 @@ static const char * const it66121_supplies[] = {
>  	"vcn33", "vcn18", "vrf12"
>  };
>  
> +static int it66121_read_bus_width(struct fwnode_handle *fwnode, u32 *bus_width)
> +{
> +	struct fwnode_handle *endpoint;
> +	u32 val;
> +	int ret;
> +
> +	endpoint = fwnode_graph_get_endpoint_by_id(fwnode, 0, 0, 0);
> +	if (!endpoint)
> +		return -EINVAL;
> +
> +	ret = fwnode_property_read_u32(endpoint, "bus-width", &val);
> +	fwnode_handle_put(endpoint);
> +	if (ret)
> +		return ret;
> +
> +	if (val != 12 && val != 24)
> +		return -EINVAL;
> +
> +	*bus_width = val;
> +
> +	return 0;
> +}

Ideally this should come as two patches. First patch extracts the
function, second patch changes the driver to use fwnode / property API.

> +
>  static int it66121_probe(struct i2c_client *client)
>  {
>  	u32 revision_id, vendor_ids[2] = { 0 }, device_ids[2] = { 0 };
> -	struct device_node *ep;
>  	int ret;
>  	struct it66121_ctx *ctx;
>  	struct device *dev = &client->dev;
> +	struct fwnode_handle *fwnode = dev_fwnode(dev);
>  
>  	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
>  		dev_err(dev, "I2C check functionality failed.\n");
> @@ -1520,29 +1542,20 @@ static int it66121_probe(struct i2c_client *client)
>  	if (!ctx)
>  		return -ENOMEM;
>  
> -	ep = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
> -	if (!ep)
> -		return -EINVAL;
> -
>  	ctx->dev = dev;
>  	ctx->client = client;
>  	ctx->info = i2c_get_match_data(client);
>  
> -	of_property_read_u32(ep, "bus-width", &ctx->bus_width);
> -	of_node_put(ep);
> -
> -	if (ctx->bus_width != 12 && ctx->bus_width != 24)
> -		return -EINVAL;
> -
> -	ep = of_graph_get_remote_node(dev->of_node, 1, -1);
> -	if (!ep) {
> -		dev_err(ctx->dev, "The endpoint is unconnected\n");
> -		return -EINVAL;
> -	}
> +	ret = it66121_read_bus_width(fwnode, &ctx->bus_width);
> +	if (ret)
> +		return ret;
>  
> -	ctx->next_bridge = of_drm_find_bridge(ep);
> -	of_node_put(ep);
> -	if (!ctx->next_bridge) {
> +	ctx->next_bridge = drm_bridge_find_next_bridge_by_fwnode(fwnode, 1);
> +	if (IS_ERR(ctx->next_bridge)) {
> +		ret = PTR_ERR(ctx->next_bridge);
> +		dev_err(dev, "Error in founding the next bridge: %d\n", ret);
> +		return ret;

return dev_err_probe(dev, ret, "msg"), if your function doesn't do this.
If it does, just return ret.

> +	} else if (!ctx->next_bridge) {
>  		dev_dbg(ctx->dev, "Next bridge not found, deferring probe\n");
>  		return -EPROBE_DEFER;
>  	}
> @@ -1577,8 +1590,8 @@ static int it66121_probe(struct i2c_client *client)
>  		return -ENODEV;
>  	}
>  
> +	drm_bridge_set_node(&ctx->bridge, fwnode);
>  	ctx->bridge.funcs = &it66121_bridge_funcs;
> -	ctx->bridge.of_node = dev->of_node;
>  	ctx->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
>  	ctx->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID;
>  	if (client->irq > 0) {
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
