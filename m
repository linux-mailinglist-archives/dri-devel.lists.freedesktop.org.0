Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A10EB3694BF
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 16:30:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E6D6EB9F;
	Fri, 23 Apr 2021 14:30:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DBEB6EB9F
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 14:30:22 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id e25so19394983oii.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 07:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=s4Pheq9PDNIDsp1Djm9lWBkYRNBEd5f1JPLVoIAwO7s=;
 b=SneFwxJNf5hRMj0oAjotIQWgg9ctrLYRRb6VAWf/r5gxZo83SKAWBNWPTY1WTk77LC
 EjhJplhQpgjvQ5GjYtePYgOF6I+6Xnk5Y5sMjBKyxqzNHlIomSKFE05NCSEspzTpOEv4
 iTH4w2tQ8WLP7KdtGkZL7X2sDVNK9dYU8UaI/ddAkxD/e1S0gm95IN48RjaZvcPBUbyl
 bGPdFonuf3/BP6Vx6UgqEJS1B9YQNx+ndNRfS24M3F5Y9yr9vx19zic1KLu6uO1e37wi
 kDAb1jscvlZ+GBgMTFGFK6sxjek9nDdoRuotQswtzGVYYIMYzpA0wkcJjzfDbn/TmWB8
 5T5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=s4Pheq9PDNIDsp1Djm9lWBkYRNBEd5f1JPLVoIAwO7s=;
 b=ZULSE3YyJUKYZx1b07PBPRl7H8U15CqKXZkHTyScdviomQbboxLwMVZAUFNlIxooje
 u+Q+3ERhYQaH7xbE34H2X/2F77sLjkS7+EUX7Btgatl85zmhBvLlUFHUtD+zVU+aBXBI
 Uj1Ko+YP31DqWs2kiLkTg3P4u0iZN36xh8qq4c8hoVpXF+LS7wWBTrAryuBe/h3VjoQA
 +rfluktYvzK7SASHO3XgBd6M0Mp4Ctuf5A96E3q64HCDvC9Cnk2MLnpQr/NUElfykh0c
 eRoG+kolalfW4327wD6nG1aHQL1+FZWqgYpx7rCjVuI/t6xvdvVDuCS4mWlttf496YdQ
 aoFQ==
X-Gm-Message-State: AOAM532bPMVGrJSxHiVYUFPcAKy6zCB8CI9+MaJLNbPLz70oQzaP92HZ
 46hx+59N8GsxUqtAdb2wuQbtLA==
X-Google-Smtp-Source: ABdhPJysk9RqrcMBcWpAJANe1464voBGiez5PZ92w8aCCGoDOvrskGOhAjvXSKbdQav/N1+DfCj/vA==
X-Received: by 2002:aca:b387:: with SMTP id c129mr4088803oif.30.1619188221737; 
 Fri, 23 Apr 2021 07:30:21 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id 3sm1419707otw.58.2021.04.23.07.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 07:30:21 -0700 (PDT)
Date: Fri, 23 Apr 2021 09:30:19 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 09/27] drm/bridge: ti-sn65dsi86: More renames in prep
 for sub-devices
Message-ID: <YILZ+6bYlvGQquz+@builder.lan>
References: <20210416223950.3586967-1-dianders@chromium.org>
 <20210416153909.v4.9.I4b28c737933a44548662df42ccd37db89ec739c1@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210416153909.v4.9.I4b28c737933a44548662df42ccd37db89ec739c1@changeid>
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

> Like the previous patch ("drm/bridge: ti-sn65dsi86: Rename the main
> driver data structure") this is just a no-op rename in preparation for
> splitting the driver up a bit.
> 
> Here I've attempted to rename functions / structures making sure that
> anything applicable to the whole chip (instead of just the MIPI to eDP
> bridge part) included "sn65dsi86" somewhere in the name instead of
> just "ti_sn_bridge".
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 84 +++++++++++++--------------
>  1 file changed, 42 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index f00ceb9dda29..57574132e200 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -164,30 +164,30 @@ struct ti_sn65dsi86 {
>  #endif
>  };
>  
> -static const struct regmap_range ti_sn_bridge_volatile_ranges[] = {
> +static const struct regmap_range ti_sn65dsi86_volatile_ranges[] = {
>  	{ .range_min = 0, .range_max = 0xFF },
>  };
>  
>  static const struct regmap_access_table ti_sn_bridge_volatile_table = {
> -	.yes_ranges = ti_sn_bridge_volatile_ranges,
> -	.n_yes_ranges = ARRAY_SIZE(ti_sn_bridge_volatile_ranges),
> +	.yes_ranges = ti_sn65dsi86_volatile_ranges,
> +	.n_yes_ranges = ARRAY_SIZE(ti_sn65dsi86_volatile_ranges),
>  };
>  
> -static const struct regmap_config ti_sn_bridge_regmap_config = {
> +static const struct regmap_config ti_sn65dsi86_regmap_config = {
>  	.reg_bits = 8,
>  	.val_bits = 8,
>  	.volatile_table = &ti_sn_bridge_volatile_table,
>  	.cache_type = REGCACHE_NONE,
>  };
>  
> -static void ti_sn_bridge_write_u16(struct ti_sn65dsi86 *pdata,
> +static void ti_sn65dsi86_write_u16(struct ti_sn65dsi86 *pdata,
>  				   unsigned int reg, u16 val)
>  {
>  	regmap_write(pdata->regmap, reg, val & 0xFF);
>  	regmap_write(pdata->regmap, reg + 1, val >> 8);
>  }
>  
> -static int __maybe_unused ti_sn_bridge_resume(struct device *dev)
> +static int __maybe_unused ti_sn65dsi86_resume(struct device *dev)
>  {
>  	struct ti_sn65dsi86 *pdata = dev_get_drvdata(dev);
>  	int ret;
> @@ -203,7 +203,7 @@ static int __maybe_unused ti_sn_bridge_resume(struct device *dev)
>  	return ret;
>  }
>  
> -static int __maybe_unused ti_sn_bridge_suspend(struct device *dev)
> +static int __maybe_unused ti_sn65dsi86_suspend(struct device *dev)
>  {
>  	struct ti_sn65dsi86 *pdata = dev_get_drvdata(dev);
>  	int ret;
> @@ -217,8 +217,8 @@ static int __maybe_unused ti_sn_bridge_suspend(struct device *dev)
>  	return ret;
>  }
>  
> -static const struct dev_pm_ops ti_sn_bridge_pm_ops = {
> -	SET_RUNTIME_PM_OPS(ti_sn_bridge_suspend, ti_sn_bridge_resume, NULL)
> +static const struct dev_pm_ops ti_sn65dsi86_pm_ops = {
> +	SET_RUNTIME_PM_OPS(ti_sn65dsi86_suspend, ti_sn65dsi86_resume, NULL)
>  	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>  				pm_runtime_force_resume)
>  };
> @@ -245,7 +245,7 @@ static int status_show(struct seq_file *s, void *data)
>  
>  DEFINE_SHOW_ATTRIBUTE(status);
>  
> -static void ti_sn_debugfs_init(struct ti_sn65dsi86 *pdata)
> +static void ti_sn65dsi86_debugfs_init(struct ti_sn65dsi86 *pdata)
>  {
>  	pdata->debugfs = debugfs_create_dir(dev_name(pdata->dev), NULL);
>  
> @@ -253,7 +253,7 @@ static void ti_sn_debugfs_init(struct ti_sn65dsi86 *pdata)
>  			&status_fops);
>  }
>  
> -static void ti_sn_debugfs_remove(struct ti_sn65dsi86 *pdata)
> +static void ti_sn65dsi86_debugfs_remove(struct ti_sn65dsi86 *pdata)
>  {
>  	debugfs_remove_recursive(pdata->debugfs);
>  	pdata->debugfs = NULL;
> @@ -261,14 +261,14 @@ static void ti_sn_debugfs_remove(struct ti_sn65dsi86 *pdata)
>  
>  /* Connector funcs */
>  static struct ti_sn65dsi86 *
> -connector_to_ti_sn_bridge(struct drm_connector *connector)
> +connector_to_ti_sn65dsi86(struct drm_connector *connector)
>  {
>  	return container_of(connector, struct ti_sn65dsi86, connector);
>  }
>  
>  static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
>  {
> -	struct ti_sn65dsi86 *pdata = connector_to_ti_sn_bridge(connector);
> +	struct ti_sn65dsi86 *pdata = connector_to_ti_sn65dsi86(connector);
>  	struct edid *edid = pdata->edid;
>  	int num, ret;
>  
> @@ -314,12 +314,12 @@ static const struct drm_connector_funcs ti_sn_bridge_connector_funcs = {
>  	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>  };
>  
> -static struct ti_sn65dsi86 *bridge_to_ti_sn_bridge(struct drm_bridge *bridge)
> +static struct ti_sn65dsi86 *bridge_to_ti_sn65dsi86(struct drm_bridge *bridge)
>  {
>  	return container_of(bridge, struct ti_sn65dsi86, bridge);
>  }
>  
> -static int ti_sn_bridge_parse_regulators(struct ti_sn65dsi86 *pdata)
> +static int ti_sn65dsi86_parse_regulators(struct ti_sn65dsi86 *pdata)
>  {
>  	unsigned int i;
>  	const char * const ti_sn_bridge_supply_names[] = {
> @@ -337,7 +337,7 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
>  			       enum drm_bridge_attach_flags flags)
>  {
>  	int ret, val;
> -	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn_bridge(bridge);
> +	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
>  	struct mipi_dsi_host *host;
>  	struct mipi_dsi_device *dsi;
>  	const struct mipi_dsi_device_info info = { .type = "ti_sn_bridge",
> @@ -425,12 +425,12 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
>  
>  static void ti_sn_bridge_detach(struct drm_bridge *bridge)
>  {
> -	drm_dp_aux_unregister(&bridge_to_ti_sn_bridge(bridge)->aux);
> +	drm_dp_aux_unregister(&bridge_to_ti_sn65dsi86(bridge)->aux);
>  }
>  
>  static void ti_sn_bridge_disable(struct drm_bridge *bridge)
>  {
> -	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn_bridge(bridge);
> +	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
>  
>  	drm_panel_disable(pdata->panel);
>  
> @@ -648,9 +648,9 @@ static void ti_sn_bridge_set_video_timings(struct ti_sn65dsi86 *pdata)
>  	if (mode->flags & DRM_MODE_FLAG_PVSYNC)
>  		vsync_polarity = CHA_VSYNC_POLARITY;
>  
> -	ti_sn_bridge_write_u16(pdata, SN_CHA_ACTIVE_LINE_LENGTH_LOW_REG,
> +	ti_sn65dsi86_write_u16(pdata, SN_CHA_ACTIVE_LINE_LENGTH_LOW_REG,
>  			       mode->hdisplay);
> -	ti_sn_bridge_write_u16(pdata, SN_CHA_VERTICAL_DISPLAY_SIZE_LOW_REG,
> +	ti_sn65dsi86_write_u16(pdata, SN_CHA_VERTICAL_DISPLAY_SIZE_LOW_REG,
>  			       mode->vdisplay);
>  	regmap_write(pdata->regmap, SN_CHA_HSYNC_PULSE_WIDTH_LOW_REG,
>  		     (mode->hsync_end - mode->hsync_start) & 0xFF);
> @@ -751,7 +751,7 @@ static int ti_sn_link_training(struct ti_sn65dsi86 *pdata, int dp_rate_idx,
>  
>  static void ti_sn_bridge_enable(struct drm_bridge *bridge)
>  {
> -	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn_bridge(bridge);
> +	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
>  	bool rate_valid[ARRAY_SIZE(ti_sn_bridge_dp_rate_lut)] = { };
>  	const char *last_err_str = "No supported DP rate";
>  	int dp_rate_idx;
> @@ -822,7 +822,7 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
>  
>  static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
>  {
> -	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn_bridge(bridge);
> +	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
>  
>  	pm_runtime_get_sync(pdata->dev);
>  
> @@ -853,7 +853,7 @@ static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
>  
>  static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
>  {
> -	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn_bridge(bridge);
> +	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
>  
>  	drm_panel_unprepare(pdata->panel);
>  
> @@ -871,7 +871,7 @@ static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
>  	.post_disable = ti_sn_bridge_post_disable,
>  };
>  
> -static struct ti_sn65dsi86 *aux_to_ti_sn_bridge(struct drm_dp_aux *aux)
> +static struct ti_sn65dsi86 *aux_to_ti_sn65dsi86(struct drm_dp_aux *aux)
>  {
>  	return container_of(aux, struct ti_sn65dsi86, aux);
>  }
> @@ -879,7 +879,7 @@ static struct ti_sn65dsi86 *aux_to_ti_sn_bridge(struct drm_dp_aux *aux)
>  static ssize_t ti_sn_aux_transfer(struct drm_dp_aux *aux,
>  				  struct drm_dp_aux_msg *msg)
>  {
> -	struct ti_sn65dsi86 *pdata = aux_to_ti_sn_bridge(aux);
> +	struct ti_sn65dsi86 *pdata = aux_to_ti_sn65dsi86(aux);
>  	u32 request = msg->request & ~(DP_AUX_I2C_MOT | DP_AUX_I2C_WRITE_STATUS_UPDATE);
>  	u32 request_val = AUX_CMD_REQ(msg->request);
>  	u8 *buf = msg->buffer;
> @@ -1213,7 +1213,7 @@ static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,
>  	pdata->ln_polrs = ln_polrs;
>  }
>  
> -static int ti_sn_bridge_probe(struct i2c_client *client,
> +static int ti_sn65dsi86_probe(struct i2c_client *client,
>  			      const struct i2c_device_id *id)
>  {
>  	struct ti_sn65dsi86 *pdata;
> @@ -1230,7 +1230,7 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
>  		return -ENOMEM;
>  
>  	pdata->regmap = devm_regmap_init_i2c(client,
> -					     &ti_sn_bridge_regmap_config);
> +					     &ti_sn65dsi86_regmap_config);
>  	if (IS_ERR(pdata->regmap)) {
>  		DRM_ERROR("regmap i2c init failed\n");
>  		return PTR_ERR(pdata->regmap);
> @@ -1257,7 +1257,7 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
>  
>  	ti_sn_bridge_parse_lanes(pdata, client->dev.of_node);
>  
> -	ret = ti_sn_bridge_parse_regulators(pdata);
> +	ret = ti_sn65dsi86_parse_regulators(pdata);
>  	if (ret) {
>  		DRM_ERROR("failed to parse regulators\n");
>  		return ret;
> @@ -1291,12 +1291,12 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
>  
>  	drm_bridge_add(&pdata->bridge);
>  
> -	ti_sn_debugfs_init(pdata);
> +	ti_sn65dsi86_debugfs_init(pdata);
>  
>  	return 0;
>  }
>  
> -static int ti_sn_bridge_remove(struct i2c_client *client)
> +static int ti_sn65dsi86_remove(struct i2c_client *client)
>  {
>  	struct ti_sn65dsi86 *pdata = i2c_get_clientdata(client);
>  
> @@ -1310,7 +1310,7 @@ static int ti_sn_bridge_remove(struct i2c_client *client)
>  
>  	kfree(pdata->edid);
>  
> -	ti_sn_debugfs_remove(pdata);
> +	ti_sn65dsi86_debugfs_remove(pdata);
>  
>  	drm_bridge_remove(&pdata->bridge);
>  
> @@ -1321,29 +1321,29 @@ static int ti_sn_bridge_remove(struct i2c_client *client)
>  	return 0;
>  }
>  
> -static struct i2c_device_id ti_sn_bridge_id[] = {
> +static struct i2c_device_id ti_sn65dsi86_id[] = {
>  	{ "ti,sn65dsi86", 0},
>  	{},
>  };
> -MODULE_DEVICE_TABLE(i2c, ti_sn_bridge_id);
> +MODULE_DEVICE_TABLE(i2c, ti_sn65dsi86_id);
>  
> -static const struct of_device_id ti_sn_bridge_match_table[] = {
> +static const struct of_device_id ti_sn65dsi86_match_table[] = {
>  	{.compatible = "ti,sn65dsi86"},
>  	{},
>  };
> -MODULE_DEVICE_TABLE(of, ti_sn_bridge_match_table);
> +MODULE_DEVICE_TABLE(of, ti_sn65dsi86_match_table);
>  
> -static struct i2c_driver ti_sn_bridge_driver = {
> +static struct i2c_driver ti_sn65dsi86_driver = {
>  	.driver = {
>  		.name = "ti_sn65dsi86",
> -		.of_match_table = ti_sn_bridge_match_table,
> -		.pm = &ti_sn_bridge_pm_ops,
> +		.of_match_table = ti_sn65dsi86_match_table,
> +		.pm = &ti_sn65dsi86_pm_ops,
>  	},
> -	.probe = ti_sn_bridge_probe,
> -	.remove = ti_sn_bridge_remove,
> -	.id_table = ti_sn_bridge_id,
> +	.probe = ti_sn65dsi86_probe,
> +	.remove = ti_sn65dsi86_remove,
> +	.id_table = ti_sn65dsi86_id,
>  };
> -module_i2c_driver(ti_sn_bridge_driver);
> +module_i2c_driver(ti_sn65dsi86_driver);
>  
>  MODULE_AUTHOR("Sandeep Panda <spanda@codeaurora.org>");
>  MODULE_DESCRIPTION("sn65dsi86 DSI to eDP bridge driver");
> -- 
> 2.31.1.368.gbe11c130af-goog
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
