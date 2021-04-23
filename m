Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5692A369547
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 16:59:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FF416EBFE;
	Fri, 23 Apr 2021 14:59:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52B166EBFE
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 14:59:17 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 c8-20020a9d78480000b0290289e9d1b7bcso31472517otm.4
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 07:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Eeg2Cdj7IqiRDIpGWDL+djvwkAbqWFueQTDOXtzqyV0=;
 b=llqMPs2cQF2iF8MbJi5mQ+GplbFcna5rRdIDTYCe+MZFvzoEElcATWzMHaNHV4RCNy
 WmGk+wpNjwswhvfDpkvusvFgtH3OkEI3ei2O4ekYKDXOsNJFxToxZufir5szAmAeB6HC
 qHb4Pvm9brJmeEM0slxVEtotsR+hD+a4TY2lI8zxho+kGzxUZ9dsXU6JKLZksl9Pti4z
 c7stZs4ozAirbotRZ3g5PFrD7sOk/kdrfN5q1zx7HHFYhN76I4in3HFi/oEprEb8ALTj
 lCWC5Y+jjCyGNhfO1CfPWGDcJ5VXivhhqpfv/57t3m1tR0lryEFuP9hbrmc7beRAW/ok
 cUIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Eeg2Cdj7IqiRDIpGWDL+djvwkAbqWFueQTDOXtzqyV0=;
 b=JKowkgAopOME5MKwWbb9rzlbti6xofL+po5oDTcKJv5V/eQQfgLLUz5jt7+jAm1AIp
 4x/V2AoR7WwUh7aCkRQoMUDRzE+p3/TF/x6VfQGDCTxpaC9HBxaOGNVfNn8YLzElO9qo
 OvUWlDCCPhMfTuxw3ehnUWthoD83Yip2TVhop+zzDwXJkdD7mjWtpqcEIipWTYrDlBH/
 KBJZMhJua6jLip58rrnuaOgyiFUZkqSJ+n9gMY36lnnQMLPv9H2UEfqGm5yXbzJ70DsM
 +BCj7nQqIvdXqqvb3JnkVaK5XGIxw9rCjVw4HxDkGTpEcvNcWuUk4FrsOZLdbbmoCZjR
 OY0Q==
X-Gm-Message-State: AOAM530b5Xh7a3QJGEupnGIikcw6SedCX34Q9iVIa1GIBj94t7t1Scng
 X5yv2cETsFUVPH1T6nuuVvxTXw==
X-Google-Smtp-Source: ABdhPJyPspT+h1LQZ7BDvlkSJWpSkZMti9S33XeGe2+KpIGOxPsTkIlm5BtXNMUKRso6XfVaf2emXg==
X-Received: by 2002:a05:6830:91e:: with SMTP id
 v30mr3739310ott.180.1619189956533; 
 Fri, 23 Apr 2021 07:59:16 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id t19sm1441111otm.40.2021.04.23.07.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 07:59:16 -0700 (PDT)
Date: Fri, 23 Apr 2021 09:59:14 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 20/27] drm/bridge: ti-sn65dsi86: Promote the AUX
 channel to its own sub-dev
Message-ID: <YILgwpg/uPgIario@builder.lan>
References: <20210416223950.3586967-1-dianders@chromium.org>
 <20210416153909.v4.20.Ie9daa320d907fff73f893f74b898197e399cce59@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210416153909.v4.20.Ie9daa320d907fff73f893f74b898197e399cce59@changeid>
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
Cc: robdclark@chromium.org, Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, dri-devel@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
 Stephen Boyd <swboyd@chromium.org>, Wolfram Sang <wsa@kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robert Foss <robert.foss@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri 16 Apr 17:39 CDT 2021, Douglas Anderson wrote:

> We'd like to be able to expose the DDC-over-AUX channel bus to our
> panel. This gets into a chicken-and-egg problem because:
> - The panel wants to get its DDC at probe time.
> - The ti-sn65dsi86 MIPI-to-eDP bridge code, which provides the DDC
>   bus, wants to get the panel at probe time.
> 
> By using a sub device we can fully create the AUX channel bits so that
> the panel can get them. Then the panel can finish probing and the
> bridge can probe.
> 
> To accomplish this, we also move registering the AUX channel out of
> the bridge's attach code and do it right at probe time. We use devm to
> manage cleanup.
> 
> NOTE: there's a little bit of a trick here. Though the AUX channel can
> run without the MIPI-to-eDP bits of the code, the MIPI-to-eDP bits
> can't run without the AUX channel. We could come up a complicated
> signaling scheme (have the MIPI-to-eDP bits return EPROBE_DEFER for a
> while or wait on some sort of completion), but it seems simple enough
> to just not even bother creating the bridge device until the AUX
> channel probes. That's what we'll do.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 82 ++++++++++++++++++++-------
>  1 file changed, 63 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 875e5dbe6594..8253098bcdbf 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -116,6 +116,7 @@
>   * struct ti_sn65dsi86 - Platform data for ti-sn65dsi86 driver.
>   * @bridge_aux:   AUX-bus sub device for MIPI-to-eDP bridge functionality.
>   * @gpio_aux:     AUX-bus sub device for GPIO controller functionality.
> + * @aux_aux:      AUX-bus sub device for eDP AUX channel functionality.
>   *
>   * @dev:          Pointer to the top level (i2c) device.
>   * @regmap:       Regmap for accessing i2c.
> @@ -148,6 +149,7 @@
>  struct ti_sn65dsi86 {
>  	struct auxiliary_device		bridge_aux;
>  	struct auxiliary_device		gpio_aux;
> +	struct auxiliary_device		aux_aux;
>  
>  	struct device			*dev;
>  	struct regmap			*regmap;
> @@ -483,18 +485,12 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
>  		return -EINVAL;
>  	}
>  
> -	ret = drm_dp_aux_register(&pdata->aux);
> -	if (ret < 0) {
> -		drm_err(bridge->dev, "Failed to register DP AUX channel: %d\n", ret);
> -		return ret;
> -	}
> -
>  	ret = drm_connector_init(bridge->dev, &pdata->connector,
>  				 &ti_sn_bridge_connector_funcs,
>  				 DRM_MODE_CONNECTOR_eDP);
>  	if (ret) {
>  		DRM_ERROR("Failed to initialize connector with drm\n");
> -		goto err_conn_init;
> +		return ret;
>  	}
>  
>  	drm_connector_helper_add(&pdata->connector,
> @@ -551,8 +547,6 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
>  	mipi_dsi_device_unregister(dsi);
>  err_dsi_host:
>  	drm_connector_cleanup(&pdata->connector);
> -err_conn_init:
> -	drm_dp_aux_unregister(&pdata->aux);
>  	return ret;
>  }
>  
> @@ -1316,11 +1310,6 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
>  	if (ret)
>  		return ret;
>  
> -	pdata->aux.name = "ti-sn65dsi86-aux";
> -	pdata->aux.dev = pdata->dev;
> -	pdata->aux.transfer = ti_sn_aux_transfer;
> -	drm_dp_aux_init(&pdata->aux);
> -
>  	pdata->bridge.funcs = &ti_sn_bridge_funcs;
>  	pdata->bridge.of_node = np;
>  
> @@ -1419,6 +1408,54 @@ static int ti_sn65dsi86_add_aux_device(struct ti_sn65dsi86 *pdata,
>  	return ret;
>  }
>  
> +static void ti_sn65dsi86_unregister_dp_aux(void *data)
> +{
> +	drm_dp_aux_unregister(data);
> +}
> +
> +static int ti_sn_aux_probe(struct auxiliary_device *adev,
> +			   const struct auxiliary_device_id *id)
> +{
> +	struct ti_sn65dsi86 *pdata = dev_get_drvdata(adev->dev.parent);
> +	int ret;
> +
> +	pdata->aux.name = "ti-sn65dsi86-aux";
> +	pdata->aux.dev = pdata->dev;
> +	pdata->aux.transfer = ti_sn_aux_transfer;
> +	drm_dp_aux_init(&pdata->aux);
> +
> +	ret = drm_dp_aux_register(&pdata->aux);
> +	if (ret < 0) {
> +		drm_err(pdata, "Failed to register DP AUX channel: %d\n", ret);
> +		return ret;
> +	}
> +	ret = devm_add_action_or_reset(&adev->dev,
> +				       ti_sn65dsi86_unregister_dp_aux, &pdata->aux);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * The eDP to MIPI bridge parts don't work until the AUX channel is
> +	 * setup so we don't add it in the main driver probe, we add it now.
> +	 */
> +	return ti_sn65dsi86_add_aux_device(pdata, &pdata->bridge_aux, "bridge");
> +}
> +
> +static const struct auxiliary_device_id ti_sn_aux_id_table[] = {
> +	{ .name = "ti_sn65dsi86.aux", },
> +	{},
> +};
> +
> +MODULE_DEVICE_TABLE(auxiliary, ti_sn_aux_id_table);
> +
> +static struct auxiliary_driver ti_sn_aux_driver = {
> +	.name = "aux",
> +	.probe = ti_sn_aux_probe,
> +	.id_table = ti_sn_aux_id_table,
> +};
> +
> +module_auxiliary_driver(ti_sn_aux_driver);

As with the earlier patch, please drop MODULE_DEVICE_TABLE() and rework
module_driver().

Regards,
Bjorn

> +
>  static int ti_sn65dsi86_probe(struct i2c_client *client,
>  			      const struct i2c_device_id *id)
>  {
> @@ -1477,10 +1514,11 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
>  	 * motiviation here is to solve the chicken-and-egg problem of probe
>  	 * ordering. The bridge wants the panel to be there when it probes.
>  	 * The panel wants its HPD GPIO (provided by sn65dsi86 on some boards)
> -	 * when it probes. There will soon be other devices (DDC I2C bus, PWM)
> -	 * that have the same problem. Having sub-devices allows the some sub
> -	 * devices to finish probing even if others return -EPROBE_DEFER and
> -	 * gets us around the problems.
> +	 * when it probes. The panel and maybe backlight might want the DDC
> +	 * bus. Soon the PWM provided by the bridge chip will have the same
> +	 * problem. Having sub-devices allows the some sub devices to finish
> +	 * probing even if others return -EPROBE_DEFER and gets us around the
> +	 * problems.
>  	 */
>  
>  	if (IS_ENABLED(CONFIG_OF_GPIO)) {
> @@ -1489,7 +1527,13 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
>  			return ret;
>  	}
>  
> -	return ti_sn65dsi86_add_aux_device(pdata, &pdata->bridge_aux, "bridge");
> +	/*
> +	 * NOTE: At the end of the AUX channel probe we'll add the aux device
> +	 * for the bridge. This is because the bridge can't be used until the
> +	 * AUX channel is there and this is a very simple solution to the
> +	 * dependency problem.
> +	 */
> +	return ti_sn65dsi86_add_aux_device(pdata, &pdata->aux_aux, "aux");
>  }
>  
>  static struct i2c_device_id ti_sn65dsi86_id[] = {
> -- 
> 2.31.1.368.gbe11c130af-goog
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
