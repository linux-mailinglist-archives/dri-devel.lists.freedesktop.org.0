Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67053549FCD
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 22:45:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D8710F99E;
	Mon, 13 Jun 2022 20:45:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60AB210F986
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 20:45:54 +0000 (UTC)
Received: from notapiano (pool-98-113-53-228.nycmny.fios.verizon.net
 [98.113.53.228])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id AFDF26601687;
 Mon, 13 Jun 2022 21:45:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1655153151;
 bh=76l2K+RJmkAuO2v5NyKzYT+03z3iePDevHfvs6kxmQI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DcAGmXiVIvfR1sb6fH0ApTBH/2EDbc1qlwYo7fFe/ScWAWddiZOHu+nJ0iP9DhgWb
 lo4bfdOXKOpXmyg5UL+p0FkRvYRgpvkk8u03ypVw0YaA4MjJjsNwdxD+DF6N8cWhbU
 ARken95M84md1y30O6794PnEoyG9VMMQVjFqy6WzT8d+vcWg1aX0TBDHBHcjtj3j0G
 QFB+8AaqfCEE++kUGPoURJHTMTjAGxyYeq/c/whkqXwzHHN19w4+Z4Dn8+56JG5EfU
 2Un4wKv+rnBUy0g0q2TYoSukw35/S1Dh8yUEw1HvCSj1vMKwzCcUZ+7w0MMxJJsom7
 S0zGaOI3UQuLw==
Date: Mon, 13 Jun 2022 16:45:44 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Prashant Malani <pmalani@chromium.org>
Subject: Re: [PATCH v2 5/7] drm/bridge: anx7625: Register number of Type C
 switches
Message-ID: <20220613204544.onfazkv4ciphddm3@notapiano>
References: <20220609181106.3695103-1-pmalani@chromium.org>
 <20220609181106.3695103-6-pmalani@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220609181106.3695103-6-pmalani@chromium.org>
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
Cc: heikki.krogerus@linux.intel.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, swboyd@chromium.org,
 Pin-Yen Lin <treapking@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Prashant,

On Thu, Jun 09, 2022 at 06:09:44PM +0000, Prashant Malani wrote:
> Parse the "switches" node, if available, and count and store the number
> of Type-C switches within it. Since we currently don't do anything with
> this info, no functional changes are expected from this change.
> 
> This patch sets a foundation for the actual registering of Type-C
> switches with the Type-C connector class framework.
> 
> Signed-off-by: Prashant Malani <pmalani@chromium.org>
> ---
> 
> Changes since v1:
> - No changes.
> 
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 20 ++++++++++++++++++++
>  drivers/gpu/drm/bridge/analogix/anx7625.h |  1 +
>  2 files changed, 21 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 53a5da6c49dd..07ed44c6b839 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -2581,6 +2581,22 @@ static void anx7625_runtime_disable(void *data)
>  	pm_runtime_disable(data);
>  }
>  
> +static int anx7625_register_typec_switches(struct device *device, struct anx7625_data *ctx)
> +{
> +	struct device_node *of = NULL;
> +	int ret = 0;
> +
> +	of = of_get_child_by_name(device->of_node, "switches");
> +	if (!of)
> +		return -ENODEV;
> +
> +	ctx->num_typec_switches = of_get_child_count(of);
> +	if (ctx->num_typec_switches <= 0)
> +		return -ENODEV;

Since the hardware only allows at most 2 switches (based on the dt-bindings),
you should have a define for that limit and check that it isn't exceeded here.

Thanks,
Nícolas

> +
> +	return ret;
> +}
> +
>  static int anx7625_i2c_probe(struct i2c_client *client,
>  			     const struct i2c_device_id *id)
>  {
> @@ -2686,6 +2702,10 @@ static int anx7625_i2c_probe(struct i2c_client *client,
>  	if (platform->pdata.intp_irq)
>  		queue_work(platform->workqueue, &platform->work);
>  
> +	ret = anx7625_register_typec_switches(dev, platform);
> +	if (ret)
> +		dev_info(dev, "Didn't register Type C switches, err: %d\n", ret);
> +
>  	platform->bridge.funcs = &anx7625_bridge_funcs;
>  	platform->bridge.of_node = client->dev.of_node;
>  	if (!anx7625_of_panel_on_aux_bus(&client->dev))
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
> index e257a84db962..d5cbca708842 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.h
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
> @@ -473,6 +473,7 @@ struct anx7625_data {
>  	struct drm_connector *connector;
>  	struct mipi_dsi_device *dsi;
>  	struct drm_dp_aux aux;
> +	int num_typec_switches;
>  };
>  
>  #endif  /* __ANX7625_H__ */
> -- 
> 2.36.1.476.g0c4daa206d-goog
> 
