Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D98369538
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 16:56:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C5396EB9C;
	Fri, 23 Apr 2021 14:56:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3B0D6EB9C
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 14:56:18 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 k14-20020a9d7dce0000b02901b866632f29so45517447otn.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 07:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wkujAwLb9O/rrm3Yi4HThUcLCn5rqmLKN6hTLLP3m7M=;
 b=AAEnqBqO/BUPTeclCJsRwU8qIQfWXrMQZ447bhEgf6Q0iWY2TwqUQklE+lKS1wFpn7
 AOD+oZpozm8wam+D2G6vAY+2ieb4SX5YgPGIORe7fNvNi96Nx3ZCygvhfDmbZ/2PY9P7
 azVgzxh8Ww841tIgIy3v+va1BCYQNMUUmTDysDqomJy0LrjqusGILLG8EZndshPDZIqH
 fGoyRMWwcx5wzNK9utAUAqBSSty3lQGv1ij66N6zzJrVlPIt1xfLJHdQo9SKZ+h27Q3I
 Y1FRumW9B12mN2Sw0Wcraj630OPaJvJM1Sc19oZmVrm1s88tUjATxyLOw39rW8SESviL
 g5Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wkujAwLb9O/rrm3Yi4HThUcLCn5rqmLKN6hTLLP3m7M=;
 b=U9BMSd5G+FlW4aQBPPmpXzQv9fXG5M+DQWOP6+Kh5y7x1GxuB43e1G5/YKdgzOF8nW
 BITvYai0SbUlvTyElg9+svOa+MjDDChhD8iXPDJUSYRF+ckQoDrE1JeydA9sLrgPLemU
 1orLCNz1Molru7UJiOMDHjJJrn/keANfnBKzpzg4/vk6P32OQauyjnxh1nI7Jbp4davn
 W6et9nc3ir1coQDL7WzlXrZHvZmgFRNIGovULZzYe8BZM7jpEfQ3rTDufrqSfUO+0n6p
 COdma2BC0TqTghbcjGvV8IVFBcUxRec3rNzH4k69dgKqbu6Xji8yjB8Pq7ZbyCCfmN1I
 frkQ==
X-Gm-Message-State: AOAM533unWIdtNrJWxCr98DDBs2/LVbdeqv8F0VHP/JWptBYjMy3SCTX
 LZyrrZP4rMf5hs4v8NAUaxQJkA==
X-Google-Smtp-Source: ABdhPJyqYiwPxVLgniDoMg9bnzoLZWqDsYnTqw10U3odXx+PBYiQ8zWVdp+AHJCNMDcUttVopRjS+g==
X-Received: by 2002:a9d:648c:: with SMTP id g12mr3729413otl.299.1619189778220; 
 Fri, 23 Apr 2021 07:56:18 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id m127sm1311178oib.32.2021.04.23.07.56.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 07:56:17 -0700 (PDT)
Date: Fri, 23 Apr 2021 09:56:15 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 19/27] drm/bridge: ti-sn65dsi86: If refclk, DP AUX can
 happen w/out pre-enable
Message-ID: <YILgD5gGmWEwzvxZ@builder.lan>
References: <20210416223950.3586967-1-dianders@chromium.org>
 <20210416153909.v4.19.Ie8cf556114953c6e7634564cc0d3ddbd103cb96c@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210416153909.v4.19.Ie8cf556114953c6e7634564cc0d3ddbd103cb96c@changeid>
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

> Let's reorganize how we init and turn on the reference clock in the
> code to allow us to turn it on early (even before pre_enable()) so
> that we can read the EDID early. This is handy for eDP because:
> - We always assume that a panel is there.
> - Once we report that a panel is there we get asked to read the EDID.
> - Pre-enable isn't called until we know what pixel clock we want to
>   use and we're ready to turn everything on. That's _after_ we get
>   asked to read the EDID.
> 
> NOTE: the above only works out OK if we "refclk" is provided. Though I
> don't have access to any hardware that uses ti-sn65dsi86 and _doesn't_
> provide a "refclk", I believe that we'll have trouble reading the EDID
> at bootup in that case. Specifically I believe that if there's no
> "refclk" we need the MIPI source clock to be active before we can
> successfully read the EDID. My evidence here is that, in testing, I
> couldn't read the EDID until I turned on the DPPLL in the bridge chip
> and that the DPPLL needs the input clock to be active.
> 
> Since this is hard to support, let's punt trying to handle this case
> if there's no "refclk". In that case we'll enable comms in
> pre_enable() like we always did.
> 
> I don't believe there are any users of the ti-sn65dsi86 bridge chip
> that _don't_ use "refclk". The bridge chip is _very_ inflexible in
> that mode. The only time I've seen that mode used was for some really
> early prototype hardware that was thrown in the e-waste bin years ago
> when we realized how inflexible it was.
> 
> Even if someone is using the bridge chip without the "refclk" they're
> in no worse shape than they were before the (fairly recent) commit
> 58074b08c04a ("drm/bridge: ti-sn65dsi86: Read EDID blob over DDC").
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 129 +++++++++++++++++++-------
>  1 file changed, 94 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index b3c699da7724..875e5dbe6594 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -132,6 +132,8 @@
>   * @dp_lanes:     Count of dp_lanes we're using.
>   * @ln_assign:    Value to program to the LN_ASSIGN register.
>   * @ln_polrs:     Value for the 4-bit LN_POLRS field of SN_ENH_FRAME_REG.
> + * @comms_enabled: If true then communication over the aux channel is enabled.
> + * @comms_mutex:   Protects modification of comms_enabled.
>   *
>   * @gchip:        If we expose our GPIOs, this is used.
>   * @gchip_output: A cache of whether we've set GPIOs to output.  This
> @@ -162,6 +164,8 @@ struct ti_sn65dsi86 {
>  	int				dp_lanes;
>  	u8				ln_assign;
>  	u8				ln_polrs;
> +	bool				comms_enabled;
> +	struct mutex			comms_mutex;
>  
>  #if defined(CONFIG_OF_GPIO)
>  	struct gpio_chip		gchip;
> @@ -250,6 +254,47 @@ static void ti_sn_bridge_set_refclk_freq(struct ti_sn65dsi86 *pdata)
>  			   REFCLK_FREQ(i));
>  }
>  
> +static void ti_sn65dsi86_enable_comms(struct ti_sn65dsi86 *pdata)
> +{
> +	mutex_lock(&pdata->comms_mutex);
> +
> +	/* configure bridge ref_clk */
> +	ti_sn_bridge_set_refclk_freq(pdata);
> +
> +	/*
> +	 * HPD on this bridge chip is a bit useless.  This is an eDP bridge
> +	 * so the HPD is an internal signal that's only there to signal that
> +	 * the panel is done powering up.  ...but the bridge chip debounces
> +	 * this signal by between 100 ms and 400 ms (depending on process,
> +	 * voltage, and temperate--I measured it at about 200 ms).  One
> +	 * particular panel asserted HPD 84 ms after it was powered on meaning
> +	 * that we saw HPD 284 ms after power on.  ...but the same panel said
> +	 * that instead of looking at HPD you could just hardcode a delay of
> +	 * 200 ms.  We'll assume that the panel driver will have the hardcoded
> +	 * delay in its prepare and always disable HPD.
> +	 *
> +	 * If HPD somehow makes sense on some future panel we'll have to
> +	 * change this to be conditional on someone specifying that HPD should
> +	 * be used.
> +	 */
> +	regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
> +			   HPD_DISABLE);
> +
> +	pdata->comms_enabled = true;
> +
> +	mutex_unlock(&pdata->comms_mutex);
> +}
> +
> +static void ti_sn65dsi86_disable_comms(struct ti_sn65dsi86 *pdata)
> +{
> +	mutex_lock(&pdata->comms_mutex);
> +
> +	pdata->comms_enabled = false;
> +	clk_disable_unprepare(pdata->refclk);
> +
> +	mutex_unlock(&pdata->comms_mutex);
> +}
> +
>  static int __maybe_unused ti_sn65dsi86_resume(struct device *dev)
>  {
>  	struct ti_sn65dsi86 *pdata = dev_get_drvdata(dev);
> @@ -263,6 +308,16 @@ static int __maybe_unused ti_sn65dsi86_resume(struct device *dev)
>  
>  	gpiod_set_value(pdata->enable_gpio, 1);
>  
> +	/*
> +	 * If we have a reference clock we can enable communication w/ the
> +	 * panel (including the aux channel) w/out any need for an input clock
> +	 * so we can do it in resume which lets us read the EDID before
> +	 * pre_enable(). Without a reference clock we need the MIPI reference
> +	 * clock so reading early doesn't work.
> +	 */
> +	if (pdata->refclk)
> +		ti_sn65dsi86_enable_comms(pdata);
> +
>  	return ret;
>  }
>  
> @@ -271,6 +326,9 @@ static int __maybe_unused ti_sn65dsi86_suspend(struct device *dev)
>  	struct ti_sn65dsi86 *pdata = dev_get_drvdata(dev);
>  	int ret;
>  
> +	if (pdata->refclk)
> +		ti_sn65dsi86_disable_comms(pdata);
> +
>  	gpiod_set_value(pdata->enable_gpio, 0);
>  
>  	ret = regulator_bulk_disable(SN_REGULATOR_SUPPLY_NUM, pdata->supplies);
> @@ -843,27 +901,8 @@ static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
>  
>  	pm_runtime_get_sync(pdata->dev);
>  
> -	/* configure bridge ref_clk */
> -	ti_sn_bridge_set_refclk_freq(pdata);
> -
> -	/*
> -	 * HPD on this bridge chip is a bit useless.  This is an eDP bridge
> -	 * so the HPD is an internal signal that's only there to signal that
> -	 * the panel is done powering up.  ...but the bridge chip debounces
> -	 * this signal by between 100 ms and 400 ms (depending on process,
> -	 * voltage, and temperate--I measured it at about 200 ms).  One
> -	 * particular panel asserted HPD 84 ms after it was powered on meaning
> -	 * that we saw HPD 284 ms after power on.  ...but the same panel said
> -	 * that instead of looking at HPD you could just hardcode a delay of
> -	 * 200 ms.  We'll assume that the panel driver will have the hardcoded
> -	 * delay in its prepare and always disable HPD.
> -	 *
> -	 * If HPD somehow makes sense on some future panel we'll have to
> -	 * change this to be conditional on someone specifying that HPD should
> -	 * be used.
> -	 */
> -	regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
> -			   HPD_DISABLE);
> +	if (!pdata->refclk)
> +		ti_sn65dsi86_enable_comms(pdata);
>  
>  	drm_panel_prepare(pdata->panel);
>  }
> @@ -874,7 +913,8 @@ static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
>  
>  	drm_panel_unprepare(pdata->panel);
>  
> -	clk_disable_unprepare(pdata->refclk);
> +	if (!pdata->refclk)
> +		ti_sn65dsi86_disable_comms(pdata);
>  
>  	pm_runtime_put_sync(pdata->dev);
>  }
> @@ -908,6 +948,20 @@ static ssize_t ti_sn_aux_transfer(struct drm_dp_aux *aux,
>  	if (len > SN_AUX_MAX_PAYLOAD_BYTES)
>  		return -EINVAL;
>  
> +	pm_runtime_get_sync(pdata->dev);
> +	mutex_lock(&pdata->comms_mutex);
> +
> +	/*
> +	 * If someone tries to do a DDC over AUX transaction before pre_enable()
> +	 * on a device without a dedicated reference clock then we just can't
> +	 * do it. Fail right away. This prevents non-refclk users from reading
> +	 * the EDID before enabling the panel but such is life.
> +	 */
> +	if (!pdata->comms_enabled) {
> +		ret = -EIO;
> +		goto exit;
> +	}
> +
>  	switch (request) {
>  	case DP_AUX_NATIVE_WRITE:
>  	case DP_AUX_I2C_WRITE:
> @@ -918,7 +972,8 @@ static ssize_t ti_sn_aux_transfer(struct drm_dp_aux *aux,
>  		msg->reply = 0;
>  		break;
>  	default:
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		goto exit;
>  	}
>  
>  	BUILD_BUG_ON(sizeof(addr_len) != sizeof(__be32));
> @@ -942,11 +997,11 @@ static ssize_t ti_sn_aux_transfer(struct drm_dp_aux *aux,
>  	ret = regmap_read_poll_timeout(pdata->regmap, SN_AUX_CMD_REG, val,
>  				       !(val & AUX_CMD_SEND), 0, 50 * 1000);
>  	if (ret)
> -		return ret;
> +		goto exit;
>  
>  	ret = regmap_read(pdata->regmap, SN_AUX_CMD_STATUS_REG, &val);
>  	if (ret)
> -		return ret;
> +		goto exit;
>  
>  	if (val & AUX_IRQ_STATUS_AUX_RPLY_TOUT) {
>  		/*
> @@ -954,13 +1009,14 @@ static ssize_t ti_sn_aux_transfer(struct drm_dp_aux *aux,
>  		 * but it hit a timeout. We ignore defers here because they're
>  		 * handled in hardware.
>  		 */
> -		return -ETIMEDOUT;
> +		ret = -ETIMEDOUT;
> +		goto exit;
>  	}
>  
>  	if (val & AUX_IRQ_STATUS_AUX_SHORT) {
>  		ret = regmap_read(pdata->regmap, SN_AUX_LENGTH_REG, &len);
>  		if (ret)
> -			return ret;
> +			goto exit;
>  	} else if (val & AUX_IRQ_STATUS_NAT_I2C_FAIL) {
>  		switch (request) {
>  		case DP_AUX_I2C_WRITE:
> @@ -972,18 +1028,19 @@ static ssize_t ti_sn_aux_transfer(struct drm_dp_aux *aux,
>  			msg->reply |= DP_AUX_NATIVE_REPLY_NACK;
>  			break;
>  		}
> -		return 0;
> +		len = 0;
> +		goto exit;
>  	}
>  
> -	if (request == DP_AUX_NATIVE_WRITE || request == DP_AUX_I2C_WRITE ||
> -	    len == 0)
> -		return len;
> +	if (request != DP_AUX_NATIVE_WRITE && request != DP_AUX_I2C_WRITE && len != 0)
> +		ret = regmap_bulk_read(pdata->regmap, SN_AUX_RDATA_REG(0), buf, len);
>  
> -	ret = regmap_bulk_read(pdata->regmap, SN_AUX_RDATA_REG(0), buf, len);
> -	if (ret)
> -		return ret;
> +exit:
> +	mutex_unlock(&pdata->comms_mutex);
> +	pm_runtime_mark_last_busy(pdata->dev);
> +	pm_runtime_put_autosuspend(pdata->dev);
>  
> -	return len;
> +	return ret ? ret : len;
>  }
>  
>  static int ti_sn_bridge_parse_dsi_host(struct ti_sn65dsi86 *pdata)
> @@ -1380,6 +1437,8 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
>  	dev_set_drvdata(dev, pdata);
>  	pdata->dev = dev;
>  
> +	mutex_init(&pdata->comms_mutex);
> +
>  	pdata->regmap = devm_regmap_init_i2c(client,
>  					     &ti_sn65dsi86_regmap_config);
>  	if (IS_ERR(pdata->regmap)) {
> -- 
> 2.31.1.368.gbe11c130af-goog
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
