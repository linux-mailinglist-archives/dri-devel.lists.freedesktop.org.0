Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E87123694B3
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 16:28:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 026866E0F2;
	Fri, 23 Apr 2021 14:28:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 280B76E0F2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 14:28:27 +0000 (UTC)
Received: by mail-oo1-xc2e.google.com with SMTP id
 c12-20020a4ae24c0000b02901bad05f40e4so10707970oot.4
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 07:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wtbJVGM5y94hRYoKh+0s0hnjZf4JimAo+QXWJgDNM8U=;
 b=FevsveuggHfAyjquo4WjsGYRLczs1GtYqUlsoBnHMGW6q+h5BxCRVj5dWjiUZUnfMn
 Z8hHkWLcDODZtKlDP8usCYgIll48hkc+/O1tYAHlX3ZrV3TEFpkXECAE2wTikwc3jpZa
 XBvNvXYkDJ8vQtVyrKhQTh+bLFAFse2tcZy8igmD70xaIjOhRqGWLhdrFFoDi5LJUpBG
 JGTG3Bg/3+cITOYeW8doXVTx/xlwxbPO6z0u5ZwksM6NQ8PHKI4XkZk55hBnyD2CKdNu
 6Ob26ULI1VsNVDNm6oEIP7RQNaoUiurdEI3BKLxfFtDIZXjQYcO0cfYhc+0SeHPOwtWc
 bavA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wtbJVGM5y94hRYoKh+0s0hnjZf4JimAo+QXWJgDNM8U=;
 b=gM20uJYJBpZ3F2ZaqKtOwhsfskAAnFBtCHVIu/mLSvXefRqByxk/1yp7BNkHrzJkh6
 eArJ3DhmQx173EcGYEHG6wfmrIrhpnXeXRtyS5RCz2RoQ0NypbEraNMoFm5AQkrt+ogj
 phZCpQ+z2SqSABl0dLkn1i3rjiqJLhBv9wySKfuGBLFoV36H2jXJF+2r6tVSpE0ETL/s
 YQhTb5AwHOFycFwiN0lC/B1/fOAyDJst7hvmtsfQrLtLQmnoPXO5sgaq9N0PUhZEd4vH
 iHMBfNa4kEjW4e8ytAX3uJGenb0QpJsifCaoKBXewlRcSTB0HCP/lLRLiNOMokvhQ7mq
 27Rw==
X-Gm-Message-State: AOAM533yXRiwRkBLepusDjZs/DYUmJwmRzSTrGK8OHy4yYe08KMgRf+e
 Sw1Y5zXznUQuDXc0ylBFRiGE/w==
X-Google-Smtp-Source: ABdhPJzPzezsRHHoBWEwFF32VPZnHqs6a9u5GA0GX8OndPXX3LPTc2g1FtKkzAk0KVp5QhU5/1TW5A==
X-Received: by 2002:a05:6820:20a:: with SMTP id
 i10mr3260801oob.6.1619188106248; 
 Fri, 23 Apr 2021 07:28:26 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id y8sm1297785oie.28.2021.04.23.07.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 07:28:25 -0700 (PDT)
Date: Fri, 23 Apr 2021 09:28:23 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 08/27] drm/bridge: ti-sn65dsi86: Rename the main
 driver data structure
Message-ID: <YILZh2QJrasCUScW@builder.lan>
References: <20210416223950.3586967-1-dianders@chromium.org>
 <20210416153909.v4.8.Ib03e88304a9ea1c503f1b9567be5cbf8b7c5761c@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210416153909.v4.8.Ib03e88304a9ea1c503f1b9567be5cbf8b7c5761c@changeid>
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

> In preparation for splitting this driver into sub-drivers, let's
> rename the main data structure so it's clear that it's holding data
> for the whole device and not just the MIPI-eDP bridge part.
> 
> This is a no-op change.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 86 +++++++++++++--------------
>  1 file changed, 43 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 51db30d573c1..f00ceb9dda29 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -112,7 +112,7 @@
>  #define SN_LINK_TRAINING_TRIES		10
>  
>  /**
> - * struct ti_sn_bridge - Platform data for ti-sn65dsi86 driver.
> + * struct ti_sn65dsi86 - Platform data for ti-sn65dsi86 driver.
>   * @dev:          Pointer to our device.
>   * @regmap:       Regmap for accessing i2c.
>   * @aux:          Our aux channel.
> @@ -140,7 +140,7 @@
>   *                lock so concurrent users of our 4 GPIOs don't stomp on
>   *                each other's read-modify-write.
>   */
> -struct ti_sn_bridge {
> +struct ti_sn65dsi86 {
>  	struct device			*dev;
>  	struct regmap			*regmap;
>  	struct drm_dp_aux		aux;
> @@ -180,7 +180,7 @@ static const struct regmap_config ti_sn_bridge_regmap_config = {
>  	.cache_type = REGCACHE_NONE,
>  };
>  
> -static void ti_sn_bridge_write_u16(struct ti_sn_bridge *pdata,
> +static void ti_sn_bridge_write_u16(struct ti_sn65dsi86 *pdata,
>  				   unsigned int reg, u16 val)
>  {
>  	regmap_write(pdata->regmap, reg, val & 0xFF);
> @@ -189,7 +189,7 @@ static void ti_sn_bridge_write_u16(struct ti_sn_bridge *pdata,
>  
>  static int __maybe_unused ti_sn_bridge_resume(struct device *dev)
>  {
> -	struct ti_sn_bridge *pdata = dev_get_drvdata(dev);
> +	struct ti_sn65dsi86 *pdata = dev_get_drvdata(dev);
>  	int ret;
>  
>  	ret = regulator_bulk_enable(SN_REGULATOR_SUPPLY_NUM, pdata->supplies);
> @@ -205,7 +205,7 @@ static int __maybe_unused ti_sn_bridge_resume(struct device *dev)
>  
>  static int __maybe_unused ti_sn_bridge_suspend(struct device *dev)
>  {
> -	struct ti_sn_bridge *pdata = dev_get_drvdata(dev);
> +	struct ti_sn65dsi86 *pdata = dev_get_drvdata(dev);
>  	int ret;
>  
>  	gpiod_set_value(pdata->enable_gpio, 0);
> @@ -225,7 +225,7 @@ static const struct dev_pm_ops ti_sn_bridge_pm_ops = {
>  
>  static int status_show(struct seq_file *s, void *data)
>  {
> -	struct ti_sn_bridge *pdata = s->private;
> +	struct ti_sn65dsi86 *pdata = s->private;
>  	unsigned int reg, val;
>  
>  	seq_puts(s, "STATUS REGISTERS:\n");
> @@ -245,7 +245,7 @@ static int status_show(struct seq_file *s, void *data)
>  
>  DEFINE_SHOW_ATTRIBUTE(status);
>  
> -static void ti_sn_debugfs_init(struct ti_sn_bridge *pdata)
> +static void ti_sn_debugfs_init(struct ti_sn65dsi86 *pdata)
>  {
>  	pdata->debugfs = debugfs_create_dir(dev_name(pdata->dev), NULL);
>  
> @@ -253,22 +253,22 @@ static void ti_sn_debugfs_init(struct ti_sn_bridge *pdata)
>  			&status_fops);
>  }
>  
> -static void ti_sn_debugfs_remove(struct ti_sn_bridge *pdata)
> +static void ti_sn_debugfs_remove(struct ti_sn65dsi86 *pdata)
>  {
>  	debugfs_remove_recursive(pdata->debugfs);
>  	pdata->debugfs = NULL;
>  }
>  
>  /* Connector funcs */
> -static struct ti_sn_bridge *
> +static struct ti_sn65dsi86 *
>  connector_to_ti_sn_bridge(struct drm_connector *connector)
>  {
> -	return container_of(connector, struct ti_sn_bridge, connector);
> +	return container_of(connector, struct ti_sn65dsi86, connector);
>  }
>  
>  static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
>  {
> -	struct ti_sn_bridge *pdata = connector_to_ti_sn_bridge(connector);
> +	struct ti_sn65dsi86 *pdata = connector_to_ti_sn_bridge(connector);
>  	struct edid *edid = pdata->edid;
>  	int num, ret;
>  
> @@ -314,12 +314,12 @@ static const struct drm_connector_funcs ti_sn_bridge_connector_funcs = {
>  	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>  };
>  
> -static struct ti_sn_bridge *bridge_to_ti_sn_bridge(struct drm_bridge *bridge)
> +static struct ti_sn65dsi86 *bridge_to_ti_sn_bridge(struct drm_bridge *bridge)
>  {
> -	return container_of(bridge, struct ti_sn_bridge, bridge);
> +	return container_of(bridge, struct ti_sn65dsi86, bridge);
>  }
>  
> -static int ti_sn_bridge_parse_regulators(struct ti_sn_bridge *pdata)
> +static int ti_sn_bridge_parse_regulators(struct ti_sn65dsi86 *pdata)
>  {
>  	unsigned int i;
>  	const char * const ti_sn_bridge_supply_names[] = {
> @@ -337,7 +337,7 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
>  			       enum drm_bridge_attach_flags flags)
>  {
>  	int ret, val;
> -	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
> +	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn_bridge(bridge);
>  	struct mipi_dsi_host *host;
>  	struct mipi_dsi_device *dsi;
>  	const struct mipi_dsi_device_info info = { .type = "ti_sn_bridge",
> @@ -430,7 +430,7 @@ static void ti_sn_bridge_detach(struct drm_bridge *bridge)
>  
>  static void ti_sn_bridge_disable(struct drm_bridge *bridge)
>  {
> -	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
> +	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn_bridge(bridge);
>  
>  	drm_panel_disable(pdata->panel);
>  
> @@ -442,7 +442,7 @@ static void ti_sn_bridge_disable(struct drm_bridge *bridge)
>  	regmap_write(pdata->regmap, SN_PLL_ENABLE_REG, 0);
>  }
>  
> -static u32 ti_sn_bridge_get_dsi_freq(struct ti_sn_bridge *pdata)
> +static u32 ti_sn_bridge_get_dsi_freq(struct ti_sn65dsi86 *pdata)
>  {
>  	u32 bit_rate_khz, clk_freq_khz;
>  	struct drm_display_mode *mode =
> @@ -473,7 +473,7 @@ static const u32 ti_sn_bridge_dsiclk_lut[] = {
>  	460800000,
>  };
>  
> -static void ti_sn_bridge_set_refclk_freq(struct ti_sn_bridge *pdata)
> +static void ti_sn_bridge_set_refclk_freq(struct ti_sn65dsi86 *pdata)
>  {
>  	int i;
>  	u32 refclk_rate;
> @@ -500,7 +500,7 @@ static void ti_sn_bridge_set_refclk_freq(struct ti_sn_bridge *pdata)
>  			   REFCLK_FREQ(i));
>  }
>  
> -static void ti_sn_bridge_set_dsi_rate(struct ti_sn_bridge *pdata)
> +static void ti_sn_bridge_set_dsi_rate(struct ti_sn65dsi86 *pdata)
>  {
>  	unsigned int bit_rate_mhz, clk_freq_mhz;
>  	unsigned int val;
> @@ -518,7 +518,7 @@ static void ti_sn_bridge_set_dsi_rate(struct ti_sn_bridge *pdata)
>  	regmap_write(pdata->regmap, SN_DSIA_CLK_FREQ_REG, val);
>  }
>  
> -static unsigned int ti_sn_bridge_get_bpp(struct ti_sn_bridge *pdata)
> +static unsigned int ti_sn_bridge_get_bpp(struct ti_sn65dsi86 *pdata)
>  {
>  	if (pdata->connector.display_info.bpc <= 6)
>  		return 18;
> @@ -535,7 +535,7 @@ static const unsigned int ti_sn_bridge_dp_rate_lut[] = {
>  	0, 1620, 2160, 2430, 2700, 3240, 4320, 5400
>  };
>  
> -static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn_bridge *pdata)
> +static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn65dsi86 *pdata)
>  {
>  	unsigned int bit_rate_khz, dp_rate_mhz;
>  	unsigned int i;
> @@ -556,7 +556,7 @@ static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn_bridge *pdata)
>  	return i;
>  }
>  
> -static void ti_sn_bridge_read_valid_rates(struct ti_sn_bridge *pdata,
> +static void ti_sn_bridge_read_valid_rates(struct ti_sn65dsi86 *pdata,
>  					  bool rate_valid[])
>  {
>  	unsigned int rate_per_200khz;
> @@ -637,7 +637,7 @@ static void ti_sn_bridge_read_valid_rates(struct ti_sn_bridge *pdata,
>  	}
>  }
>  
> -static void ti_sn_bridge_set_video_timings(struct ti_sn_bridge *pdata)
> +static void ti_sn_bridge_set_video_timings(struct ti_sn65dsi86 *pdata)
>  {
>  	struct drm_display_mode *mode =
>  		&pdata->bridge.encoder->crtc->state->adjusted_mode;
> @@ -676,7 +676,7 @@ static void ti_sn_bridge_set_video_timings(struct ti_sn_bridge *pdata)
>  	usleep_range(10000, 10500); /* 10ms delay recommended by spec */
>  }
>  
> -static unsigned int ti_sn_get_max_lanes(struct ti_sn_bridge *pdata)
> +static unsigned int ti_sn_get_max_lanes(struct ti_sn65dsi86 *pdata)
>  {
>  	u8 data;
>  	int ret;
> @@ -691,7 +691,7 @@ static unsigned int ti_sn_get_max_lanes(struct ti_sn_bridge *pdata)
>  	return data & DP_LANE_COUNT_MASK;
>  }
>  
> -static int ti_sn_link_training(struct ti_sn_bridge *pdata, int dp_rate_idx,
> +static int ti_sn_link_training(struct ti_sn65dsi86 *pdata, int dp_rate_idx,
>  			       const char **last_err_str)
>  {
>  	unsigned int val;
> @@ -751,7 +751,7 @@ static int ti_sn_link_training(struct ti_sn_bridge *pdata, int dp_rate_idx,
>  
>  static void ti_sn_bridge_enable(struct drm_bridge *bridge)
>  {
> -	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
> +	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn_bridge(bridge);
>  	bool rate_valid[ARRAY_SIZE(ti_sn_bridge_dp_rate_lut)] = { };
>  	const char *last_err_str = "No supported DP rate";
>  	int dp_rate_idx;
> @@ -822,7 +822,7 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
>  
>  static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
>  {
> -	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
> +	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn_bridge(bridge);
>  
>  	pm_runtime_get_sync(pdata->dev);
>  
> @@ -853,7 +853,7 @@ static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
>  
>  static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
>  {
> -	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
> +	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn_bridge(bridge);
>  
>  	drm_panel_unprepare(pdata->panel);
>  
> @@ -871,15 +871,15 @@ static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
>  	.post_disable = ti_sn_bridge_post_disable,
>  };
>  
> -static struct ti_sn_bridge *aux_to_ti_sn_bridge(struct drm_dp_aux *aux)
> +static struct ti_sn65dsi86 *aux_to_ti_sn_bridge(struct drm_dp_aux *aux)
>  {
> -	return container_of(aux, struct ti_sn_bridge, aux);
> +	return container_of(aux, struct ti_sn65dsi86, aux);
>  }
>  
>  static ssize_t ti_sn_aux_transfer(struct drm_dp_aux *aux,
>  				  struct drm_dp_aux_msg *msg)
>  {
> -	struct ti_sn_bridge *pdata = aux_to_ti_sn_bridge(aux);
> +	struct ti_sn65dsi86 *pdata = aux_to_ti_sn_bridge(aux);
>  	u32 request = msg->request & ~(DP_AUX_I2C_MOT | DP_AUX_I2C_WRITE_STATUS_UPDATE);
>  	u32 request_val = AUX_CMD_REQ(msg->request);
>  	u8 *buf = msg->buffer;
> @@ -969,7 +969,7 @@ static ssize_t ti_sn_aux_transfer(struct drm_dp_aux *aux,
>  	return len;
>  }
>  
> -static int ti_sn_bridge_parse_dsi_host(struct ti_sn_bridge *pdata)
> +static int ti_sn_bridge_parse_dsi_host(struct ti_sn65dsi86 *pdata)
>  {
>  	struct device_node *np = pdata->dev->of_node;
>  
> @@ -1004,7 +1004,7 @@ static int tn_sn_bridge_of_xlate(struct gpio_chip *chip,
>  static int ti_sn_bridge_gpio_get_direction(struct gpio_chip *chip,
>  					   unsigned int offset)
>  {
> -	struct ti_sn_bridge *pdata = gpiochip_get_data(chip);
> +	struct ti_sn65dsi86 *pdata = gpiochip_get_data(chip);
>  
>  	/*
>  	 * We already have to keep track of the direction because we use
> @@ -1018,7 +1018,7 @@ static int ti_sn_bridge_gpio_get_direction(struct gpio_chip *chip,
>  
>  static int ti_sn_bridge_gpio_get(struct gpio_chip *chip, unsigned int offset)
>  {
> -	struct ti_sn_bridge *pdata = gpiochip_get_data(chip);
> +	struct ti_sn65dsi86 *pdata = gpiochip_get_data(chip);
>  	unsigned int val;
>  	int ret;
>  
> @@ -1043,7 +1043,7 @@ static int ti_sn_bridge_gpio_get(struct gpio_chip *chip, unsigned int offset)
>  static void ti_sn_bridge_gpio_set(struct gpio_chip *chip, unsigned int offset,
>  				  int val)
>  {
> -	struct ti_sn_bridge *pdata = gpiochip_get_data(chip);
> +	struct ti_sn65dsi86 *pdata = gpiochip_get_data(chip);
>  	int ret;
>  
>  	if (!test_bit(offset, pdata->gchip_output)) {
> @@ -1063,7 +1063,7 @@ static void ti_sn_bridge_gpio_set(struct gpio_chip *chip, unsigned int offset,
>  static int ti_sn_bridge_gpio_direction_input(struct gpio_chip *chip,
>  					     unsigned int offset)
>  {
> -	struct ti_sn_bridge *pdata = gpiochip_get_data(chip);
> +	struct ti_sn65dsi86 *pdata = gpiochip_get_data(chip);
>  	int shift = offset * 2;
>  	int ret;
>  
> @@ -1091,7 +1091,7 @@ static int ti_sn_bridge_gpio_direction_input(struct gpio_chip *chip,
>  static int ti_sn_bridge_gpio_direction_output(struct gpio_chip *chip,
>  					      unsigned int offset, int val)
>  {
> -	struct ti_sn_bridge *pdata = gpiochip_get_data(chip);
> +	struct ti_sn65dsi86 *pdata = gpiochip_get_data(chip);
>  	int shift = offset * 2;
>  	int ret;
>  
> @@ -1125,7 +1125,7 @@ static const char * const ti_sn_bridge_gpio_names[SN_NUM_GPIOS] = {
>  	"GPIO1", "GPIO2", "GPIO3", "GPIO4"
>  };
>  
> -static int ti_sn_setup_gpio_controller(struct ti_sn_bridge *pdata)
> +static int ti_sn_setup_gpio_controller(struct ti_sn65dsi86 *pdata)
>  {
>  	int ret;
>  
> @@ -1157,14 +1157,14 @@ static int ti_sn_setup_gpio_controller(struct ti_sn_bridge *pdata)
>  
>  #else
>  
> -static inline int ti_sn_setup_gpio_controller(struct ti_sn_bridge *pdata)
> +static inline int ti_sn_setup_gpio_controller(struct ti_sn65dsi86 *pdata)
>  {
>  	return 0;
>  }
>  
>  #endif
>  
> -static void ti_sn_bridge_parse_lanes(struct ti_sn_bridge *pdata,
> +static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,
>  				     struct device_node *np)
>  {
>  	u32 lane_assignments[SN_MAX_DP_LANES] = { 0, 1, 2, 3 };
> @@ -1216,7 +1216,7 @@ static void ti_sn_bridge_parse_lanes(struct ti_sn_bridge *pdata,
>  static int ti_sn_bridge_probe(struct i2c_client *client,
>  			      const struct i2c_device_id *id)
>  {
> -	struct ti_sn_bridge *pdata;
> +	struct ti_sn65dsi86 *pdata;
>  	int ret;
>  
>  	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
> @@ -1224,7 +1224,7 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
>  		return -ENODEV;
>  	}
>  
> -	pdata = devm_kzalloc(&client->dev, sizeof(struct ti_sn_bridge),
> +	pdata = devm_kzalloc(&client->dev, sizeof(struct ti_sn65dsi86),
>  			     GFP_KERNEL);
>  	if (!pdata)
>  		return -ENOMEM;
> @@ -1298,7 +1298,7 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
>  
>  static int ti_sn_bridge_remove(struct i2c_client *client)
>  {
> -	struct ti_sn_bridge *pdata = i2c_get_clientdata(client);
> +	struct ti_sn65dsi86 *pdata = i2c_get_clientdata(client);
>  
>  	if (!pdata)
>  		return -EINVAL;
> -- 
> 2.31.1.368.gbe11c130af-goog
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
