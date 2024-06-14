Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD2F9090FA
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 19:06:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BCAF10EDEE;
	Fri, 14 Jun 2024 17:06:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dBGWelZt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3853810EDF5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 17:06:01 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-52bc3130ae6so2690612e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 10:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718384759; x=1718989559; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4oQ+8v3ZSZDyosSqJbQ1i0USr4Ajcvwft5S/gDbK4NE=;
 b=dBGWelZt8lql76xIGXS/aRJyed8Gpvo7UeFXGa5yqZhsP8aFnTS4xRlai+JCdpvVei
 yB6nEuptldYQOeo/TaWUVwAYiPoo2ZDxwYk+wZKrorBhGQaajNugpWbHUaOL0Onk+YDc
 0xw6+mrgkPDAMja0y36foHmd77nB7h74eYoewcUT0BcQN+q8KLMymoAe823Tyc9sXrDN
 VbbRiwTIMFLaq9tA6GKjDrVh18zHGMBM4w3PLno4BSCM0jQ/ZcpLV/bO8rKdzEhnuj+Y
 CLmDD1Q9Z9Ab2/vZD4HfA0j5/JUs1FFx34wz/m2SAVV/roK7I7CSu1GCp85JzmIkA5yK
 6zlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718384759; x=1718989559;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4oQ+8v3ZSZDyosSqJbQ1i0USr4Ajcvwft5S/gDbK4NE=;
 b=U8/b25/75+yM3Wy3/IR9VXoVsYcXXHgE76Ya9MKAuUXTlqgwPM+zbHWtfBTMcPvCll
 7Oa/s9nKBEbSXCJTSKwaZfmQdW8p8Ycx1yufYjjcUCkAOTLe8dLJSZnCrJrWaDF4ZgVi
 WxbSkuNPbHhDuCo5GHGU6FOFSV8Hu1ZP6RlO0LA0VoOQd2YRPJHBEEIsP74zcW5U1zIr
 wd1teSAAdWsL1u15ET39WeEoxRJqy2CF+mQ4HRz1BQQoWa8WPBmbSXmRE/Or+FYb+jdV
 pzN+ASG22SOtRiD/iLxuIPa+EK4Y2qWfaEuaPWjpf0ED/Y8mxy8HfjZvCesboAIFH+1l
 k1CQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEGVquyv5KnJbyszOeVIk+mjcStCaISBizFreLDskGZQsaeSkryc3vkUJShyeg4cpB+LNKJovIy1CJcOFl3aC1m028vM7tVY9fD9ddP2xN
X-Gm-Message-State: AOJu0Yzi8MHO2crZYfmcIIQ2BI1+6pBYEKrw3wZ7zQVPimwrku3IR1K0
 aoOjYmhgx9as7vqvGoP2efWbfz7WhCz2LN8L1N2vS8Fwpsoe4RBrzj7ifAUwvMQ=
X-Google-Smtp-Source: AGHT+IHEAa2ctfNlWB7LE1F2JZ0GffkDuID6Gd6TAZyfJFI6ndEpuiRlldSqif5KGHWP4eaJ+vvVzw==
X-Received: by 2002:a19:7601:0:b0:529:b5ea:fda5 with SMTP id
 2adb3069b0e04-52ca6e908b8mr1902909e87.53.1718384759132; 
 Fri, 14 Jun 2024 10:05:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca288cd87sm545268e87.304.2024.06.14.10.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 10:05:58 -0700 (PDT)
Date: Fri, 14 Jun 2024 20:05:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org, 
 benjamin.tissoires@redhat.co, dianders@google.com, hsinyi@google.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/4] drm/panel: jd9365da: Support for kd101ne3-40ti
 MIPI-DSI panel.
Message-ID: <7r3gmrhy3tsoyxn6zmcduxhagszrnaugcv6tatfa3be7s2sehc@qkb5k4epyu5b>
References: <20240614145510.22965-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240614145510.22965-4-lvzhaoxiong@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614145510.22965-4-lvzhaoxiong@huaqin.corp-partner.google.com>
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

On Fri, Jun 14, 2024 at 10:55:09PM GMT, Zhaoxiong Lv wrote:
> The K&d kd101ne3-40ti is a 10.1" WXGA TFT-LCD panel, use
> jd9365da controller,which fits in nicely with the existing
> panel-jadard-jd9365da-h3 driver.Hence,we add a new compatible
> with panel specific config.
> 
> Although they have the same control IC, the two panels are different,
> and the timing will be slightly different, so we added some variables
> in struct jadard_panel_desc to control the timing
> 
> Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
> ---
> 
> Chage since V3:
> -  1. Give up creating a new driver and re-add K&d kd101ne3-40ti 
> -     configuration to the panel-jadard-jd9365da-h3.c driver.
> 
> V2:https://lore.kernel.org/all/20240601084528.22502-3-lvzhaoxiong@huaqin.corp-partner.google.com/
> 
> Chage since V2:
> 
> -  1. Use the new mipi_dsi_dcs_write_seq_multi() function.
> -  2. Modify Move mipi_dsi_dcs_set_display_off() and mipi_dsi_dcs_enter_sleep_mode() to disable(),
> -  and drop kingdisplay_panel_enter_sleep_mode().
> -  3. If prepare fails, disable GPIO before regulators.
> -  4. This function drm_connector_set_panel_orientation() is no longer used. Delete it.
> -  5. Drop ".shutdown = kingdisplay_panel_shutdown".
> 
> ---
>  .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  | 284 ++++++++++++++++++
>  1 file changed, 284 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> index b39f01d7002e..f6e130567707 100644
> --- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> +++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> @@ -27,6 +27,15 @@ struct jadard_panel_desc {
>  	enum mipi_dsi_pixel_format format;
>  	int (*init)(struct jadard *jadard);
>  	u32 num_init_cmds;
> +	bool lp11_before_reset;
> +	bool power_off_vcioo_before_reset;
> +	unsigned int vcioo_to_lp11_delay;
> +	unsigned int lp11_to_reset_delay;
> +	unsigned int exit_sleep_to_display_on_delay;
> +	unsigned int display_on_delay;
> +	unsigned int backlight_off_to_display_off_delay;
> +	unsigned int display_off_to_enter_sleep_delay;
> +	unsigned int enter_sleep_to_reset_down_delay;
>  };
>  
>  struct jadard {
> @@ -57,10 +66,18 @@ static int jadard_enable(struct drm_panel *panel)
>  	if (err < 0)
>  		DRM_DEV_ERROR(dev, "failed to exit sleep mode ret = %d\n", err);
>  
> +	/* tSLPOUT >= 120ms */

The comments are probably applicable to your panel, but not to the other
panels.

> +	if (jadard->desc->exit_sleep_to_display_on_delay)
> +		msleep(jadard->desc->exit_sleep_to_display_on_delay);

Maybe extend mipi_dsi_msleep to skip slipping if delay is 0 and then use
_multi here too?

> +
>  	err =  mipi_dsi_dcs_set_display_on(dsi);
>  	if (err < 0)
>  		DRM_DEV_ERROR(dev, "failed to set display on ret = %d\n", err);
>  
> +	/* tDISON >= 20ms */
> +	if (jadard->desc->display_on_delay)
> +		msleep(jadard->desc->display_on_delay);
> +
>  	return 0;
>  }
>  
> @@ -70,14 +87,26 @@ static int jadard_disable(struct drm_panel *panel)
>  	struct jadard *jadard = panel_to_jadard(panel);
>  	int ret;
>  
> +	/* tBLOFF:Backlight_to_0x28h >= 100ms */
> +	if (jadard->desc->backlight_off_to_display_off_delay)
> +		msleep(jadard->desc->backlight_off_to_display_off_delay);
> +
>  	ret = mipi_dsi_dcs_set_display_off(jadard->dsi);
>  	if (ret < 0)
>  		DRM_DEV_ERROR(dev, "failed to set display off: %d\n", ret);
>  
> +	/* tDISOFF >= 50ms */
> +	if (jadard->desc->display_off_to_enter_sleep_delay)
> +		msleep(jadard->desc->display_off_to_enter_sleep_delay);
> +
>  	ret = mipi_dsi_dcs_enter_sleep_mode(jadard->dsi);
>  	if (ret < 0)
>  		DRM_DEV_ERROR(dev, "failed to enter sleep mode: %d\n", ret);
>  
> +	/* tSLPIN >= 100ms */
> +	if (jadard->desc->enter_sleep_to_reset_down_delay)
> +		msleep(jadard->desc->enter_sleep_to_reset_down_delay);
> +
>  	return 0;
>  }
>  
> @@ -94,6 +123,21 @@ static int jadard_prepare(struct drm_panel *panel)
>  	if (ret)
>  		return ret;
>  
> +	/* tMIPI_ON >= 0ms */
> +	if (jadard->desc->vcioo_to_lp11_delay)
> +		msleep(jadard->desc->vcioo_to_lp11_delay);
> +
> +	if (jadard->desc->lp11_before_reset) {
> +		ret = mipi_dsi_dcs_nop(jadard->dsi);
> +		if (ret < 0)
> +			goto poweroff;
> +
> +		usleep_range(1000, 2000);
> +	}
> +	/* tRPWIRES >= 5ms */
> +	if (jadard->desc->lp11_to_reset_delay)
> +		msleep(jadard->desc->lp11_to_reset_delay);
> +
>  	gpiod_set_value(jadard->reset, 1);
>  	msleep(5);
>  
> @@ -125,6 +169,12 @@ static int jadard_unprepare(struct drm_panel *panel)
>  	gpiod_set_value(jadard->reset, 1);
>  	msleep(120);
>  
> +	if (jadard->desc->power_off_vcioo_before_reset) {
> +		gpiod_set_value(jadard->reset, 0);

The implemented behaviour contradicts with the name of the flag. If the
flag is set, then reset is down before powering down the vccio supply.

> +
> +		usleep_range(1000, 2000);
> +	}
> +
>  	regulator_disable(jadard->vdd);
>  	regulator_disable(jadard->vccio);
>  
> @@ -586,7 +636,237 @@ static const struct jadard_panel_desc cz101b4001_desc = {
>  	.lanes = 4,
>  	.format = MIPI_DSI_FMT_RGB888,
>  	.init = cz101b4001_init_cmds,
> +};
> +

[skipped]

> +
> +static const struct jadard_panel_desc kingdisplay_kd101ne3_40ti_desc = {
> +	.mode = {
> +		.clock		= 70595,

Please change this to something like:
(800 + 30 + 30 + 30) * (1280 + 30 + 4 + 8) * 60 / 1000

> +
> +		.hdisplay	= 800,
> +		.hsync_start	= 800 + 30,
> +		.hsync_end	= 800 + 30 + 30,
> +		.htotal		= 800 + 30 + 30 + 30,
> +
> +		.vdisplay	= 1280,
> +		.vsync_start	= 1280 + 30,
> +		.vsync_end	= 1280 + 30 + 4,
> +		.vtotal		= 1280 + 30 + 4 + 8,
> +
> +		.width_mm	= 135,
> +		.height_mm	= 216,
> +		.type		= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> +	},
> +	.lanes = 4,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.init = kingdisplay_kd101ne3_init_cmds,
> +	.lp11_before_reset = true,
> +	.power_off_vcioo_before_reset = true,
> +	.vcioo_to_lp11_delay = 5,
> +	.lp11_to_reset_delay = 10,
> +	.exit_sleep_to_display_on_delay = 120,
> +	.display_on_delay = 20,
> +	.backlight_off_to_display_off_delay = 100,
> +	.display_off_to_enter_sleep_delay = 50,
> +	.enter_sleep_to_reset_down_delay = 100,
>  };
>  
>  static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
> @@ -665,6 +945,10 @@ static const struct of_device_id jadard_of_match[] = {
>  		.compatible = "radxa,display-8hd-ad002",
>  		.data = &radxa_display_8hd_ad002_desc
>  	},
> +	{
> +		.compatible = "kingdisplay,kd101ne3-40ti",
> +		.data = &kingdisplay_kd101ne3_40ti_desc
> +	},

Keep it sorted, please.

>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, jadard_of_match);
> -- 
> 2.17.1
> 

-- 
With best wishes
Dmitry
