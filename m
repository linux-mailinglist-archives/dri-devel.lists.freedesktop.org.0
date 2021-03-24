Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA1C347202
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 08:06:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0481B89CAD;
	Wed, 24 Mar 2021 07:06:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C30AE6E2C0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 03:01:22 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id BA4B412EE;
 Tue, 23 Mar 2021 23:01:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 23 Mar 2021 23:01:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 to:cc:references:from:subject:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=u
 1fXNeBzs7omAL13kJEw9tGpAjKdIaBTjIuzN3j2LV0=; b=aOWFkBiCaqPh2rLAA
 0caOBKGLMTfdguD661RwNVoKZPcToDRIP6vbBPDka3NRfyapGwSyJukvMNekbV9J
 kEvSp4JJ63r3V7tLRs2Uv1UxBpibxXUJM5wx8fZGtJRJW0WbxG0jM9UI1ZNWQnc4
 dcXSJ0E73jWulY6/PAW6zoCaSESbgoEPDBjJiAAJc3jiWamlgwTAH52uhXd5NDUm
 JImuSjfhtrNSukVF9sEgkiX3jOvpZIb1aqVATzVxkbKXSihWpRsJqPd7J/yA/ZI5
 yOyMeY9pPlEzrU3b8pzkxSPMpK5jLfW7znxffmtU66mYISOcAG0y50ZoF52SmIb1
 WnNnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=u1fXNeBzs7omAL13kJEw9tGpAjKdIaBTjIuzN3j2L
 V0=; b=UDJ0opYQaUMKhQSByps+U9LMIZXhE9N7zxPWM14IxoEYDNn48pEOlL4F+
 WpnGuK0RfFmjjjis+xntGr7wPq7wDzVjiHTdj7Jcj2096w+2Zg2CPHf9OMp8J/dz
 RTuoBGG1su0FMbQ8ehpR1JLzaTVWt7lXgjtm5CveWidF1LtNeSAEh8Lc+kevtM09
 1ZtbD892SJ4cV/84auy20cXICAqbDUNSEUTh2lIyce6kE/YQ+DZ/MhVUjzOZQb5Y
 oWTsa7EGqPnXIl8yIni2QF2CH6MA/u71DMWTkcTaUlG/oJi0V2S2fxP7z92pxEKY
 22aJX9t9NMeUXxudfvx+AiplZLiWw==
X-ME-Sender: <xms:f6taYNvP90h5E3ChMJM74FVa9fh4kvZhYjtxDi8GyiM_jh8I-17ZNw>
 <xme:f6taYKwtvtuf2S8eP7-zFQTD3v2X8oFrRMgxqfFomWOOezuI7FCCu5hZAifDm_fEM
 ZIeEwfMq9TT0KFq5A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudegjedgheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepvfhfhffukffffgggjggtgfesthekredttdefjeenucfhrhhomhepufgrmhhu
 vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
 ftrfgrthhtvghrnhepvddttdejieduudfgffevteekffegffeguddtgfefkeduvedukeff
 hedtfeevuedvnecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgr
 nhgurdhorhhg
X-ME-Proxy: <xmx:f6taYP6sJos2ivnj9sMAU9sgdgGiikYnJ3GG6yHMLJWElIMZWr8FLw>
 <xmx:f6taYMXT3W6qPouwFIAgAEJ6XlyQAfMo-tW4xmNSlVVrro5eT5xLPw>
 <xmx:f6taYD0x0MQVl8FCubGTeDSaqWwxbnxGFk7KfctEvVnGTg4xxEwhwg>
 <xmx:gataYEu4oeLPTdv7a13g0HPolexxhI40A2coRt9NXOOnFc0e8CRDZA>
Received: from [70.135.148.151]
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 99DC924033F;
 Tue, 23 Mar 2021 23:01:19 -0400 (EDT)
To: Jagan Teki <jagan@amarulasolutions.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
References: <20210322140152.101709-1-jagan@amarulasolutions.com>
 <20210322140152.101709-3-jagan@amarulasolutions.com>
From: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v4 2/4] drm: sun4i: dsi: Add bridge support
Message-ID: <b1f29eaa-6022-3180-f2fa-11d34ac3d9b1@sholland.org>
Date: Tue, 23 Mar 2021 22:01:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20210322140152.101709-3-jagan@amarulasolutions.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 24 Mar 2021 07:06:07 +0000
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
Cc: linux-sunxi@googlegroups.com, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/22/21 9:01 AM, Jagan Teki wrote:
> Some display panels would come up with a non-DSI output which
> can have an option to connect DSI interface by means of bridge
> converter.
> 
> This DSI to non-DSI bridge converter would require a bridge
> driver that would communicate the DSI controller for bridge
> functionalities.
> 
> So, add support for bridge functionalities in Allwinner DSI
> controller.
> 
> Cc: Samuel Holland <samuel@sholland.org>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Note: 
> Samuel Holland, The existing kms hotplug dropped in order to 
> attach the bridge properly. 
> 
> However, I did try several ways to support hotplug with the 
> bridge but it's resulting in a deadlock where bind never attach 
> bridge until bridge pointer found and bridge pointer cannot 
> found until bind finishes. Any inputs on this would be appreciated.

The intended behavior is that sun6i_dsi_bind() is independent of any DSI
device. And sun6i_dsi_attach() must only be called after bind completes
and the DRM device is registered. This design allows the rest of the
display engine (such as the HDMI output) to work even if no panel is
listed in the device tree, or if a panel driver is missing.

> Changes for v4:
> - none
> Changes for v3:
> - updated with new API's 
> 
>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 34 +++++++++++++++++---------
>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h |  2 +-
>  2 files changed, 23 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> index 2e9e7b2d4145..39321299dc27 100644
> --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> @@ -773,6 +773,9 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
>  	if (dsi->panel)
>  		drm_panel_prepare(dsi->panel);
>  
> +	if (dsi->panel_bridge)
> +		dsi->panel_bridge->funcs->pre_enable(dsi->panel_bridge);
> +
>  	/*
>  	 * FIXME: This should be moved after the switch to HS mode.
>  	 *
> @@ -788,6 +791,9 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
>  	if (dsi->panel)
>  		drm_panel_enable(dsi->panel);
>  
> +	if (dsi->panel_bridge)
> +		dsi->panel_bridge->funcs->enable(dsi->panel_bridge);
> +
>  	sun6i_dsi_start(dsi, DSI_START_HSC);
>  
>  	udelay(1000);
> @@ -804,6 +810,9 @@ static void sun6i_dsi_encoder_disable(struct drm_encoder *encoder)
>  	if (dsi->panel) {
>  		drm_panel_disable(dsi->panel);
>  		drm_panel_unprepare(dsi->panel);
> +	} else if (dsi->panel_bridge) {
> +		dsi->panel_bridge->funcs->disable(dsi->panel_bridge);
> +		dsi->panel_bridge->funcs->post_disable(dsi->panel_bridge);
>  	}
>  
>  	phy_power_off(dsi->dphy);
> @@ -964,23 +973,17 @@ static int sun6i_dsi_attach(struct mipi_dsi_host *host,
>  			    struct mipi_dsi_device *device)
>  {
>  	struct sun6i_dsi *dsi = host_to_sun6i_dsi(host);
> -	struct drm_panel *panel;
>  	int ret;
>  
>  	ret = drm_of_find_panel_or_bridge(dsi->dev->of_node, 0, 0,
> -					  &panel, NULL);
> +					  &dsi->panel, &dsi->panel_bridge);
>  	if (ret)
>  		return ret;
>  
> -	if (!dsi->drm || !dsi->drm->registered)
> -		return -EPROBE_DEFER;
> -
> -	dsi->panel = panel;
>  	dsi->device = device;
>  
> -	drm_kms_helper_hotplug_event(dsi->drm);
> -
> -	dev_info(host->dev, "Attached device %s\n", device->name);
> +	dev_info(host->dev, "Attached %s %s\n",
> +		 device->name, dsi->panel ? "panel" : "bridge");
>  
>  	return 0;
>  }
> @@ -991,9 +994,10 @@ static int sun6i_dsi_detach(struct mipi_dsi_host *host,
>  	struct sun6i_dsi *dsi = host_to_sun6i_dsi(host);
>  
>  	dsi->panel = NULL;
> +	dsi->panel_bridge = NULL;
>  	dsi->device = NULL;
>  
> -	drm_kms_helper_hotplug_event(dsi->drm);
> +	drm_of_panel_bridge_remove(dsi->dev->of_node, 0, 0);
>  
>  	return 0;
>  }
> @@ -1082,7 +1086,13 @@ static int sun6i_dsi_bind(struct device *dev, struct device *master,
>  
>  	drm_connector_attach_encoder(&dsi->connector, &dsi->encoder);
>  
> -	dsi->drm = drm;
> +	if (dsi->panel_bridge) {
> +		ret = drm_bridge_attach(&dsi->encoder, dsi->panel_bridge, NULL, 0);
> +		if (ret) {
> +			dev_err(dsi->dev, "Couldn't attach drm bridge\n");
> +			goto err_cleanup_connector;
> +		}
> +	}

You initialize dsi->panel_bridge in sun6i_dsi_attach() above, but that
function may run long after sun6i_dsi_bind() has completed -- for
example if this driver is built in, but the panel/bridge driver is built
as a module. So you cannot reference dsi->panel_bridge from this function.

Regards,
Samuel

>  
>  	return 0;
>  
> @@ -1096,7 +1106,7 @@ static void sun6i_dsi_unbind(struct device *dev, struct device *master,
>  {
>  	struct sun6i_dsi *dsi = dev_get_drvdata(dev);
>  
> -	dsi->drm = NULL;
> +	drm_encoder_cleanup(&dsi->encoder);
>  }
>  
>  static const struct component_ops sun6i_dsi_ops = {
> diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
> index c863900ae3b4..370ecb356a63 100644
> --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
> +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
> @@ -29,8 +29,8 @@ struct sun6i_dsi {
>  
>  	struct device		*dev;
>  	struct mipi_dsi_device	*device;
> -	struct drm_device	*drm;
>  	struct drm_panel	*panel;
> +	struct drm_bridge	*panel_bridge;
>  };
>  
>  static inline struct sun6i_dsi *host_to_sun6i_dsi(struct mipi_dsi_host *host)
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
