Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB1B8B4784
	for <lists+dri-devel@lfdr.de>; Sat, 27 Apr 2024 21:17:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EEF3882B5;
	Sat, 27 Apr 2024 19:17:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="M0g+T588";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3634D10F543
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Apr 2024 19:17:25 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-51bafbe7509so4615247e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Apr 2024 12:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714245443; x=1714850243; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4Z4JVoTMGiLzVampw4rx9c82f2mlZ2d+hOB5M1MhVt0=;
 b=M0g+T588Jy4IfiJ94XOnMPAWQjxrus4BjpW6mOCEvBsYcoyks2ZenwL0AMjkF6K6Vj
 8OQtr09coMLOECvjC6NmlbhE9DW1meYwq7E8JS2LGR/XVWHyyim23ijlXacOCbwT0tpf
 rxePyRiyNgzmN58XYidGE0FsU5LXiJUWzIBFXNXGAZE3hCoqWEQf/xw4ld8EvCCKn738
 I1WBxIgW6pLqBrZT6kPByfb/oqeI4H15NefLgqnMxl8QHPj1G25gZw77iuYJ2gWYadt7
 yv73YipiTdr2dSUlE+BvzhQb+a0pzGcImYgrIKByf4whb1r/1cWs8CP8rEW0uxDnLMzI
 V58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714245443; x=1714850243;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Z4JVoTMGiLzVampw4rx9c82f2mlZ2d+hOB5M1MhVt0=;
 b=GWEz8UHe8jov83YQdOXmTDT1IKMCaKTpL/k3rZA1p/tpfDP9cZ1Rem+pogtrmZS8nH
 3jlbfibsigNx16Zjyb1U7JRefNbGbS0RoEIb5Mp8/IZYg4Iu4INQPdnMP0DoFEvYr0Zw
 YqGBfFxIQkM34Lr2ePCxf/1L/SSv2kPQXNHn/AJgbwIm+8IFy6yjN6/BES2j8e8/8IwO
 ROjQsSgcqxJLYsQEioMqvycECPqXS+GootxgPioA2xCU/JxZD17XZner9/CDlmet8LCn
 UXQlRl4+IqpFJyOxjLmGZGV1H+NhRlD+b2eR1uvASekiCrJ0xZbm6pNTT/1DB22WY+it
 iXsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpgOimKycyG2ahSAfGFltypxsi0ufvfrTpajXU0X70rmSMd9KzrGjZUH4S6rtdT9FWorVJa5qxwRfbXrC0U2ZuQqZw3sED27et6CSwBkYw
X-Gm-Message-State: AOJu0YwefraeM9Muv5Kxe6166LovTIoYkSvu7Tnj8LncplhJOVpST1Zz
 VROuEvn6YnHOcSBYFIzSFcqD4AKxhm0518xQtiXih+7ygjNDZokUO6JZGqN7Sss=
X-Google-Smtp-Source: AGHT+IEEy/dEs5oqn+r0GYD3ASZc92DTK/82biHH4kuJKEa0hsRRUtUYMXPPOsoiEKYcxafB7990Vg==
X-Received: by 2002:a05:6512:1592:b0:51d:5ffd:efe4 with SMTP id
 bp18-20020a056512159200b0051d5ffdefe4mr464125lfb.1.1714245442999; 
 Sat, 27 Apr 2024 12:17:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 w18-20020ac254b2000000b0051723af85casm120303lfk.238.2024.04.27.12.17.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Apr 2024 12:17:22 -0700 (PDT)
Date: Sat, 27 Apr 2024 22:17:20 +0300
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
Message-ID: <a2c4a2bwkesbp72bqoc6p2kdzhxaeb4hdohxae5othyvb6didw@asguw3ywktt6>
References: <20240422191903.255642-1-sui.jingfeng@linux.dev>
 <20240422191903.255642-9-sui.jingfeng@linux.dev>
 <gwpgunhe3frumjtxjapdw3nxlavrhseleddqqn6qpqeqg2ku56@ec6log4zl6ds>
 <da04552a-9466-4df9-8754-399b47dcbd5c@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da04552a-9466-4df9-8754-399b47dcbd5c@linux.dev>
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

On Sun, Apr 28, 2024 at 02:43:20AM +0800, Sui Jingfeng wrote:
> Hi,
> 
> 
> On 2024/4/23 04:08, Dmitry Baryshkov wrote:
> > On Tue, Apr 23, 2024 at 03:19:02AM +0800, Sui Jingfeng wrote:
> > > Make this driver DT-independent by calling the freshly created helpers,
> > > which reduce boilerplate and open the door for otherwise use cases. No
> > > functional changes for DT based systems.
> > > 
> > > Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> > > ---
> > >   drivers/gpu/drm/bridge/ti-tfp410.c | 41 +++++++++++++++---------------
> > >   1 file changed, 21 insertions(+), 20 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
> > > index c7bef5c23927..58dc7492844f 100644
> > > --- a/drivers/gpu/drm/bridge/ti-tfp410.c
> > > +++ b/drivers/gpu/drm/bridge/ti-tfp410.c
> > > @@ -266,8 +266,9 @@ static const struct drm_bridge_timings tfp410_default_timings = {
> > >   static int tfp410_parse_timings(struct tfp410 *dvi, bool i2c)
> > >   {
> > > +	struct fwnode_handle *fwnode = dev_fwnode(dvi->dev);
> > >   	struct drm_bridge_timings *timings = &dvi->timings;
> > > -	struct device_node *ep;
> > > +	struct fwnode_handle *ep;
> > >   	u32 pclk_sample = 0;
> > >   	u32 bus_width = 24;
> > >   	u32 deskew = 0;
> > > @@ -288,14 +289,14 @@ static int tfp410_parse_timings(struct tfp410 *dvi, bool i2c)
> > >   	 * and EDGE pins. They are specified in DT through endpoint properties
> > >   	 * and vendor-specific properties.
> > >   	 */
> > > -	ep = of_graph_get_endpoint_by_regs(dvi->dev->of_node, 0, 0);
> > > +	ep = fwnode_graph_get_endpoint_by_id(fwnode, 0, 0, 0);
> > >   	if (!ep)
> > >   		return -EINVAL;
> > >   	/* Get the sampling edge from the endpoint. */
> > > -	of_property_read_u32(ep, "pclk-sample", &pclk_sample);
> > > -	of_property_read_u32(ep, "bus-width", &bus_width);
> > > -	of_node_put(ep);
> > > +	fwnode_property_read_u32(ep, "pclk-sample", &pclk_sample);
> > > +	fwnode_property_read_u32(ep, "bus-width", &bus_width);
> > > +	fwnode_handle_put(ep);
> > >   	timings->input_bus_flags = DRM_BUS_FLAG_DE_HIGH;
> > > @@ -324,7 +325,7 @@ static int tfp410_parse_timings(struct tfp410 *dvi, bool i2c)
> > >   	}
> > >   	/* Get the setup and hold time from vendor-specific properties. */
> > > -	of_property_read_u32(dvi->dev->of_node, "ti,deskew", &deskew);
> > > +	fwnode_property_read_u32(fwnode, "ti,deskew", &deskew);
> > >   	if (deskew > 7)
> > >   		return -EINVAL;
> > > @@ -336,12 +337,12 @@ static int tfp410_parse_timings(struct tfp410 *dvi, bool i2c)
> > >   static int tfp410_init(struct device *dev, bool i2c)
> > >   {
> > > -	struct device_node *node;
> > > +	struct fwnode_handle *fwnode = dev_fwnode(dev);
> > >   	struct tfp410 *dvi;
> > >   	int ret;
> > > -	if (!dev->of_node) {
> > > -		dev_err(dev, "device-tree data is missing\n");
> > > +	if (!fwnode) {
> > > +		dev_err(dev, "firmware data is missing\n");
> > >   		return -ENXIO;
> > >   	}
> > > @@ -352,8 +353,8 @@ static int tfp410_init(struct device *dev, bool i2c)
> > >   	dvi->dev = dev;
> > >   	dev_set_drvdata(dev, dvi);
> > > +	drm_bridge_set_node(&dvi->bridge, fwnode);
> > >   	dvi->bridge.funcs = &tfp410_bridge_funcs;
> > > -	dvi->bridge.of_node = dev->of_node;
> > >   	dvi->bridge.timings = &dvi->timings;
> > >   	dvi->bridge.type = DRM_MODE_CONNECTOR_DVID;
> > > @@ -362,15 +363,15 @@ static int tfp410_init(struct device *dev, bool i2c)
> > >   		return ret;
> > >   	/* Get the next bridge, connected to port@1. */
> > > -	node = of_graph_get_remote_node(dev->of_node, 1, -1);
> > > -	if (!node)
> > > -		return -ENODEV;
> > > -
> > > -	dvi->next_bridge = of_drm_find_bridge(node);
> > > -	of_node_put(node);
> > > -
> > > -	if (!dvi->next_bridge)
> > > +	dvi->next_bridge = drm_bridge_find_next_bridge_by_fwnode(fwnode, 1);
> > > +	if (IS_ERR(dvi->next_bridge)) {
> > > +		ret = PTR_ERR(dvi->next_bridge);
> > > +		dev_err(dev, "Error in founding the next bridge: %d\n", ret);
> > > +		return ret;
> > Same comment regarding dev_err_probe().
> > 
> > LGTM otherwise.
> 
> 
> My drm_bridge_find_next_bridge_by_fwnode() function won't return -EPROBE_DEFER,
> this is known for sure. this can be used as a prior(priori) knowledge. This is
> intentionally by design.
> 
> 
> Calling the dev_err_probe() just introduce extra overhead on non EPROBE_DEFER
> cases. Hence, It is useless to use dev_err_probe() at here.
> 
> 
> > > +	} else if (!dvi->next_bridge) {
> > > +		dev_dbg(dev, "Next bridge not found, deferring probe\n");
> > >   		return -EPROBE_DEFER;
> > Looking at the bolerplate code, I think it would be better to make
> > drm_bridge_find_next_bridge_by_fwnode() reutrn -EPROBE_DEFER on its own.
> > 
> The drm_bridge_find_next_bridge_by_fwnode() function itself can not
> reliable detect if the driver(the remote bridge) already probed or not.
> 
> Hence, as a core helper function, we can not guarantee that return
> -EPROBE_DEFER is always correct.
> 
> While, return NULL is always correct. The NULL can stand for two meanings.
> One is that the next bridge is really don't exist, may happen when the
> caller provided a wrong fwnode argument.

Please take a look at drm_of_find_panel_or_bridge(). Returning specific
error code is always better than returning just NULL. As you have
pointed yourself, there are (at least) two cases when your function
returns NULL. Caller can not identify them unless the function returns
proper error code.

> Another case is that the next bridge exists but not probed yet, and
> drm_bridge_find_next_bridge_by_fwnode() can return NULL when it gets called
> too early.
> 
> Therefore, it is better to left to the users of this function to process
> the NULL return value. As driver instances has some extra prior knowledge.
> And can be controlled by drm bridge driver author.

he driver has no prior knowledge if there is a remote fwnode/ofnode or
if there is none.

> 
> > > +	}
> > >   	/* Get the powerdown GPIO. */
> > >   	dvi->powerdown = devm_gpiod_get_optional(dev, "powerdown",
> > > @@ -422,10 +423,10 @@ static struct platform_driver tfp410_platform_driver = {
> > >   /* There is currently no i2c functionality. */
> > >   static int tfp410_i2c_probe(struct i2c_client *client)
> > >   {
> > > +	struct fwnode_handle *fwnode = dev_fwnode(&client->dev);
> > >   	int reg;
> > > -	if (!client->dev.of_node ||
> > > -	    of_property_read_u32(client->dev.of_node, "reg", &reg)) {
> > > +	if (!fwnode || fwnode_property_read_u32(fwnode, "reg", &reg)) {
> > >   		dev_err(&client->dev,
> > >   			"Can't get i2c reg property from device-tree\n");
> > >   		return -ENXIO;
> > > -- 
> > > 2.34.1
> > > 
> -- 
> Best regards,
> Sui
> 

-- 
With best wishes
Dmitry
