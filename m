Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D498AD5A4
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 22:08:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23BA510E034;
	Mon, 22 Apr 2024 20:08:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MilZg4DH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95F0110E034
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 20:08:05 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5193363d255so6432239e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 13:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713816483; x=1714421283; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NVxew0E36HKPg7AKuhliQt/Kpg8mBmNBvlWMdBa5HCE=;
 b=MilZg4DHKMyu/AQHjquVE7zZtryZgDK/j+4MdGXzBcrNiP7lJnHL7NCr3/lO2+KcHV
 LRlxWMg4SglG/Q+yxb7ajX6t4zWgZq7rs1VPseOcHXEhDNAJVxBI+zOsjaQDUxcf/OIh
 /6is4/hfxR8MLdssCLlPQTuRh1AvrsGzkVdymdBqk8IO7UluZoUEK58WmL5kpeIa4zGd
 AK5Z7IjlHtfYJz4BcPeNSGeoXCilVGOMJZujx0h6jsjqKJqnWtGu36JN9Z5FjHy2FNed
 QGTTk7gJi2AsmEcVQvWUQne5hLYEgOAdTgnXZI9cw8viqJrHrwvC5ADZzzO65dnH6ieq
 3fdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713816483; x=1714421283;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NVxew0E36HKPg7AKuhliQt/Kpg8mBmNBvlWMdBa5HCE=;
 b=KIT3/5cyucDSVDrK/PVcDPTNZB9uOlWfXN7YSlEdMqsLQ3Daji+wpOvf+4bjO84NlR
 EK5QVV7Bke/EJb/AcbDjo6ZwbY7MP4yfKpTx54RHA4J61ksJS1LhMVbXk9y59Bs8v2Sr
 6Vcm0eyQRPXEHK8y4bwWW+7Jd+AsMkcdL9xrPiV4HEYJPMaVEUOAZDLKFI2mdSb0rj15
 y0Joho3s2YFnvik8CJWklkypLdouhncthhHBy0sxfjXkgJvhKynWLfP1u4LyVufQRYxJ
 o6CSZ3GOj9H8bHJ2sMmOu+psrpYxBOjY2beU9DdRg0oq/jQlL1aafWT12+78/E8ewuFV
 Dksg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcu3kXoO8IHVOCteicyAd6RHZcBZtg3usMfpjF5ktTanW//j+st+NzNH8azM0mnzq0DtVUOg5zLrgdLkmC2A2JsL8I9ckbbitE9+MZ0Oxl
X-Gm-Message-State: AOJu0YzF3fagCBOEDMynM4DQCQLErDwCw1nxBkXJlli04j6RezA2YLKC
 AA7Hj9wk4yjtr9DfaoOAnxfwV4E1HU19+Z+fSc3+Eqx5McNe0LDjUCwUUgQGjkI=
X-Google-Smtp-Source: AGHT+IFPGYLrnfC3K/xb3EGS4ldKQPJdw5ZGmVAcLa4hP1Zp5GAI5xifZBtuZ2/Dsg9KJmM0cwpD/g==
X-Received: by 2002:a19:7516:0:b0:51a:c21b:73fb with SMTP id
 y22-20020a197516000000b0051ac21b73fbmr6120268lfe.44.1713816483582; 
 Mon, 22 Apr 2024 13:08:03 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a19770e000000b005188ea5d2b5sm1855484lfc.303.2024.04.22.13.08.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 13:08:03 -0700 (PDT)
Date: Mon, 22 Apr 2024 23:08:01 +0300
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
Subject: Re: [PATCH v4 8/9] drm/bridge: tfp410: Use fwnode API to acquire
 device properties
Message-ID: <gwpgunhe3frumjtxjapdw3nxlavrhseleddqqn6qpqeqg2ku56@ec6log4zl6ds>
References: <20240422191903.255642-1-sui.jingfeng@linux.dev>
 <20240422191903.255642-9-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240422191903.255642-9-sui.jingfeng@linux.dev>
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

On Tue, Apr 23, 2024 at 03:19:02AM +0800, Sui Jingfeng wrote:
> Make this driver DT-independent by calling the freshly created helpers,
> which reduce boilerplate and open the door for otherwise use cases. No
> functional changes for DT based systems.
> 
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> ---
>  drivers/gpu/drm/bridge/ti-tfp410.c | 41 +++++++++++++++---------------
>  1 file changed, 21 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
> index c7bef5c23927..58dc7492844f 100644
> --- a/drivers/gpu/drm/bridge/ti-tfp410.c
> +++ b/drivers/gpu/drm/bridge/ti-tfp410.c
> @@ -266,8 +266,9 @@ static const struct drm_bridge_timings tfp410_default_timings = {
>  
>  static int tfp410_parse_timings(struct tfp410 *dvi, bool i2c)
>  {
> +	struct fwnode_handle *fwnode = dev_fwnode(dvi->dev);
>  	struct drm_bridge_timings *timings = &dvi->timings;
> -	struct device_node *ep;
> +	struct fwnode_handle *ep;
>  	u32 pclk_sample = 0;
>  	u32 bus_width = 24;
>  	u32 deskew = 0;
> @@ -288,14 +289,14 @@ static int tfp410_parse_timings(struct tfp410 *dvi, bool i2c)
>  	 * and EDGE pins. They are specified in DT through endpoint properties
>  	 * and vendor-specific properties.
>  	 */
> -	ep = of_graph_get_endpoint_by_regs(dvi->dev->of_node, 0, 0);
> +	ep = fwnode_graph_get_endpoint_by_id(fwnode, 0, 0, 0);
>  	if (!ep)
>  		return -EINVAL;
>  
>  	/* Get the sampling edge from the endpoint. */
> -	of_property_read_u32(ep, "pclk-sample", &pclk_sample);
> -	of_property_read_u32(ep, "bus-width", &bus_width);
> -	of_node_put(ep);
> +	fwnode_property_read_u32(ep, "pclk-sample", &pclk_sample);
> +	fwnode_property_read_u32(ep, "bus-width", &bus_width);
> +	fwnode_handle_put(ep);
>  
>  	timings->input_bus_flags = DRM_BUS_FLAG_DE_HIGH;
>  
> @@ -324,7 +325,7 @@ static int tfp410_parse_timings(struct tfp410 *dvi, bool i2c)
>  	}
>  
>  	/* Get the setup and hold time from vendor-specific properties. */
> -	of_property_read_u32(dvi->dev->of_node, "ti,deskew", &deskew);
> +	fwnode_property_read_u32(fwnode, "ti,deskew", &deskew);
>  	if (deskew > 7)
>  		return -EINVAL;
>  
> @@ -336,12 +337,12 @@ static int tfp410_parse_timings(struct tfp410 *dvi, bool i2c)
>  
>  static int tfp410_init(struct device *dev, bool i2c)
>  {
> -	struct device_node *node;
> +	struct fwnode_handle *fwnode = dev_fwnode(dev);
>  	struct tfp410 *dvi;
>  	int ret;
>  
> -	if (!dev->of_node) {
> -		dev_err(dev, "device-tree data is missing\n");
> +	if (!fwnode) {
> +		dev_err(dev, "firmware data is missing\n");
>  		return -ENXIO;
>  	}
>  
> @@ -352,8 +353,8 @@ static int tfp410_init(struct device *dev, bool i2c)
>  	dvi->dev = dev;
>  	dev_set_drvdata(dev, dvi);
>  
> +	drm_bridge_set_node(&dvi->bridge, fwnode);
>  	dvi->bridge.funcs = &tfp410_bridge_funcs;
> -	dvi->bridge.of_node = dev->of_node;
>  	dvi->bridge.timings = &dvi->timings;
>  	dvi->bridge.type = DRM_MODE_CONNECTOR_DVID;
>  
> @@ -362,15 +363,15 @@ static int tfp410_init(struct device *dev, bool i2c)
>  		return ret;
>  
>  	/* Get the next bridge, connected to port@1. */
> -	node = of_graph_get_remote_node(dev->of_node, 1, -1);
> -	if (!node)
> -		return -ENODEV;
> -
> -	dvi->next_bridge = of_drm_find_bridge(node);
> -	of_node_put(node);
> -
> -	if (!dvi->next_bridge)
> +	dvi->next_bridge = drm_bridge_find_next_bridge_by_fwnode(fwnode, 1);
> +	if (IS_ERR(dvi->next_bridge)) {
> +		ret = PTR_ERR(dvi->next_bridge);
> +		dev_err(dev, "Error in founding the next bridge: %d\n", ret);
> +		return ret;

Same comment regarding dev_err_probe().

LGTM otherwise.

> +	} else if (!dvi->next_bridge) {
> +		dev_dbg(dev, "Next bridge not found, deferring probe\n");
>  		return -EPROBE_DEFER;

Looking at the bolerplate code, I think it would be better to make
drm_bridge_find_next_bridge_by_fwnode() reutrn -EPROBE_DEFER on its own.


> +	}
>  
>  	/* Get the powerdown GPIO. */
>  	dvi->powerdown = devm_gpiod_get_optional(dev, "powerdown",
> @@ -422,10 +423,10 @@ static struct platform_driver tfp410_platform_driver = {
>  /* There is currently no i2c functionality. */
>  static int tfp410_i2c_probe(struct i2c_client *client)
>  {
> +	struct fwnode_handle *fwnode = dev_fwnode(&client->dev);
>  	int reg;
>  
> -	if (!client->dev.of_node ||
> -	    of_property_read_u32(client->dev.of_node, "reg", &reg)) {
> +	if (!fwnode || fwnode_property_read_u32(fwnode, "reg", &reg)) {
>  		dev_err(&client->dev,
>  			"Can't get i2c reg property from device-tree\n");
>  		return -ENXIO;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
