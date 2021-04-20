Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EA43654B1
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 11:00:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6106C89CF9;
	Tue, 20 Apr 2021 09:00:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C5026E4B3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 09:00:03 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id u17so57145242ejk.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 02:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=9F5hsOm0JtuvjD/yPuuw5z0LfYAYU4sjI4hsLbH0sgM=;
 b=E9X01uWn/XR87JKTU9p3LkAkx8zfJkkNMSHslhJRlSMkoTP2j/lPyom1DlFgIULdw8
 B9wfqCXJ14gjFb+x+Yg5J5QbW+FM0dDcF0bRO+eGIUV8sQexJNYfmXCadMVKW/zNS2xl
 FA9d6yP//V94LqedPnOdlZklUXEYm4J15wcGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=9F5hsOm0JtuvjD/yPuuw5z0LfYAYU4sjI4hsLbH0sgM=;
 b=FrrbM7bCqln0vy7tce/MId8gS9R/gaT+QFq8YelO0zKy8EEQuJCOtyngmtDXYz1cbr
 3q01oEsj4wVyIxNon1wM8LrB8XmHJjCO3wubQZbAGm5Xg9ROT+msPi9h65Q6x3tlFi03
 EHvLdb1RMxCR7IQIgAFcMrE806b9TQFzjiTv16TyVePu+pGvJ8rEvnBVi6h6cSaN2h24
 VHZNL5o8Y105gn1/Pug+MLVzdivHICsvRYVABYm91kOWlsOlwx8NHV96G6k3+jE/kkep
 wqnWX0rQSLN+SiRrc1keAez90to5B49zVytEk7K75v3JT4OrxHhgOujAPmfIlYKei9c4
 iiyQ==
X-Gm-Message-State: AOAM531H+I8iGHSFnTMdEEwBWGuOf8PkxmE0lopr5V959owImwHG9YLj
 h9w3e+UA6mygrloRr5/tPun97w==
X-Google-Smtp-Source: ABdhPJyvmFrrhA9NhzM91pmUYfDLeofpifqV3mla1nuhAHSBAQ9+HwIdKL817Myk10zbo2kMkMY4qw==
X-Received: by 2002:a17:906:a0d4:: with SMTP id
 bh20mr26420038ejb.348.1618909202229; 
 Tue, 20 Apr 2021 02:00:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l15sm14811698edb.48.2021.04.20.02.00.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 02:00:01 -0700 (PDT)
Date: Tue, 20 Apr 2021 11:00:00 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH 2/2] drm/gma500: remove trailing whitespaces
Message-ID: <YH6YEDr5n7QUxAQs@phenom.ffwll.local>
Mail-Followup-To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20210419081807.68000-1-krzysztof.kozlowski@canonical.com>
 <20210419081807.68000-2-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210419081807.68000-2-krzysztof.kozlowski@canonical.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 19, 2021 at 10:18:07AM +0200, Krzysztof Kozlowski wrote:
> Remove trailing whitespaces.  No functional change.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Both patches applied to drm-misc-next, thanks.
-Daniel

> ---
>  drivers/gpu/drm/gma500/backlight.c    |  4 +--
>  drivers/gpu/drm/gma500/cdv_intel_dp.c | 50 +++++++++++++--------------
>  2 files changed, 26 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/gma500/backlight.c b/drivers/gpu/drm/gma500/backlight.c
> index 35600d070cb5..9e90258541a4 100644
> --- a/drivers/gpu/drm/gma500/backlight.c
> +++ b/drivers/gpu/drm/gma500/backlight.c
> @@ -42,7 +42,7 @@ void gma_backlight_disable(struct drm_device *dev)
>  		dev_priv->backlight_device->props.brightness = 0;
>  		do_gma_backlight_set(dev);
>  	}
> -#endif	
> +#endif
>  }
>  
>  void gma_backlight_set(struct drm_device *dev, int v)
> @@ -54,7 +54,7 @@ void gma_backlight_set(struct drm_device *dev, int v)
>  		dev_priv->backlight_device->props.brightness = v;
>  		do_gma_backlight_set(dev);
>  	}
> -#endif	
> +#endif
>  }
>  
>  int gma_backlight_init(struct drm_device *dev)
> diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
> index 6d3ada39ff86..595b765ecc71 100644
> --- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
> +++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
> @@ -245,7 +245,7 @@ i2c_dp_aux_add_bus(struct i2c_adapter *adapter)
>                  if (W && !in_dbg_master()) msleep(W);                   \
>          }                                                               \
>          ret__;                                                          \
> -})      
> +})
>  
>  #define wait_for(COND, MS) _wait_for(COND, MS, 1)
>  
> @@ -386,7 +386,7 @@ static void cdv_intel_edp_panel_vdd_on(struct gma_encoder *intel_encoder)
>  	if (intel_dp->panel_on) {
>  		DRM_DEBUG_KMS("Skip VDD on because of panel on\n");
>  		return;
> -	}	
> +	}
>  	DRM_DEBUG_KMS("\n");
>  
>  	pp = REG_READ(PP_CONTROL);
> @@ -433,7 +433,7 @@ static bool cdv_intel_edp_panel_on(struct gma_encoder *intel_encoder)
>  		DRM_DEBUG_KMS("Error in Powering up eDP panel, status %x\n", REG_READ(PP_STATUS));
>  		intel_dp->panel_on = false;
>  	} else
> -		intel_dp->panel_on = true;	
> +		intel_dp->panel_on = true;
>  	msleep(intel_dp->panel_power_up_delay);
>  
>  	return false;
> @@ -449,7 +449,7 @@ static void cdv_intel_edp_panel_off (struct gma_encoder *intel_encoder)
>  
>  	pp = REG_READ(PP_CONTROL);
>  
> -	if ((pp & POWER_TARGET_ON) == 0) 
> +	if ((pp & POWER_TARGET_ON) == 0)
>  		return;
>  
>  	intel_dp->panel_on = false;
> @@ -464,7 +464,7 @@ static void cdv_intel_edp_panel_off (struct gma_encoder *intel_encoder)
>  	DRM_DEBUG_KMS("PP_STATUS %x\n", REG_READ(PP_STATUS));
>  
>  	if (wait_for((REG_READ(PP_STATUS) & idle_off_mask) == 0, 1000)) {
> -		DRM_DEBUG_KMS("Error in turning off Panel\n");	
> +		DRM_DEBUG_KMS("Error in turning off Panel\n");
>  	}
>  
>  	msleep(intel_dp->panel_power_cycle_delay);
> @@ -535,7 +535,7 @@ cdv_intel_dp_mode_valid(struct drm_connector *connector,
>  	    if (cdv_intel_dp_link_required(mode->clock, 24)
>  	     	> cdv_intel_dp_max_data_rate(max_link_clock, max_lanes))
>  		return MODE_CLOCK_HIGH;
> -		
> +
>  	}
>  	if (mode->clock < 10000)
>  		return MODE_CLOCK_LOW;
> @@ -606,7 +606,7 @@ cdv_intel_dp_aux_ch(struct gma_encoder *encoder,
>  		for (i = 0; i < send_bytes; i += 4)
>  			REG_WRITE(ch_data + i,
>  				   pack_aux(send + i, send_bytes - i));
> -	
> +
>  		/* Send the command and wait for it to complete */
>  		REG_WRITE(ch_ctl,
>  			   DP_AUX_CH_CTL_SEND_BUSY |
> @@ -623,7 +623,7 @@ cdv_intel_dp_aux_ch(struct gma_encoder *encoder,
>  				break;
>  			udelay(100);
>  		}
> -	
> +
>  		/* Clear done status and any errors */
>  		REG_WRITE(ch_ctl,
>  			   status |
> @@ -659,7 +659,7 @@ cdv_intel_dp_aux_ch(struct gma_encoder *encoder,
>  		      DP_AUX_CH_CTL_MESSAGE_SIZE_SHIFT);
>  	if (recv_bytes > recv_size)
>  		recv_bytes = recv_size;
> -	
> +
>  	for (i = 0; i < recv_bytes; i += 4)
>  		unpack_aux(REG_READ(ch_data + i),
>  			   recv + i, recv_bytes - i);
> @@ -870,7 +870,7 @@ cdv_intel_dp_i2c_init(struct gma_connector *connector,
>  	ret = i2c_dp_aux_add_bus(&intel_dp->adapter);
>  	if (is_edp(encoder))
>  		cdv_intel_edp_panel_vdd_off(encoder);
> -	
> +
>  	return ret;
>  }
>  
> @@ -1291,13 +1291,13 @@ cdv_intel_get_adjust_train(struct gma_encoder *encoder)
>  		if (this_p > p)
>  			p = this_p;
>  	}
> -	
> +
>  	if (v >= CDV_DP_VOLTAGE_MAX)
>  		v = CDV_DP_VOLTAGE_MAX | DP_TRAIN_MAX_SWING_REACHED;
>  
>  	if (p == DP_TRAIN_PRE_EMPHASIS_MASK)
>  		p |= DP_TRAIN_MAX_PRE_EMPHASIS_REACHED;
> -		
> +
>  	for (lane = 0; lane < 4; lane++)
>  		intel_dp->train_set[lane] = v | p;
>  }
> @@ -1358,7 +1358,6 @@ cdv_intel_dp_set_link_train(struct gma_encoder *encoder,
>  			uint32_t dp_reg_value,
>  			uint8_t dp_train_pat)
>  {
> -	
>  	struct drm_device *dev = encoder->base.dev;
>  	int ret;
>  	struct cdv_intel_dp *intel_dp = encoder->dev_priv;
> @@ -1384,7 +1383,6 @@ static bool
>  cdv_intel_dplink_set_level(struct gma_encoder *encoder,
>  			uint8_t dp_train_pat)
>  {
> -	
>  	int ret;
>  	struct cdv_intel_dp *intel_dp = encoder->dev_priv;
>  
> @@ -1462,7 +1460,7 @@ cdv_intel_dp_set_vswing_premph(struct gma_encoder *encoder, uint8_t signal_level
>  	/* ;gfx_dpio_set_reg(0x8124, 0x00004000) */
>  	index = 2 * premph + 1;
>  	cdv_sb_write(dev, ddi_reg->PreEmph2, dp_vswing_premph_table[index]);
> -	return;	
> +	return;
>  }
>  
>  
> @@ -1481,8 +1479,8 @@ cdv_intel_dp_start_link_train(struct gma_encoder *encoder)
>  
>  	DP |= DP_PORT_EN;
>  	DP &= ~DP_LINK_TRAIN_MASK;
> -		
> -	reg = DP;	
> +
> +	reg = DP;
>  	reg |= DP_LINK_TRAIN_PAT_1;
>  	/* Enable output, wait for it to become active */
>  	REG_WRITE(intel_dp->output_reg, reg);
> @@ -1556,7 +1554,7 @@ cdv_intel_dp_start_link_train(struct gma_encoder *encoder)
>  	if (!clock_recovery) {
>  		DRM_DEBUG_KMS("failure in DP patter 1 training, train set %x\n", intel_dp->train_set[0]);
>  	}
> -	
> +
>  	intel_dp->DP = DP;
>  }
>  
> @@ -1747,7 +1745,7 @@ static int cdv_intel_dp_get_modes(struct drm_connector *connector)
>  	if (is_edp(intel_encoder)) {
>  		struct drm_device *dev = connector->dev;
>  		struct drm_psb_private *dev_priv = dev->dev_private;
> -		
> +
>  		cdv_intel_edp_panel_vdd_off(intel_encoder);
>  		if (ret) {
>  			if (edp && !intel_dp->panel_fixed_mode) {
> @@ -1942,11 +1940,11 @@ static void cdv_disable_intel_clock_gating(struct drm_device *dev)
>  			DPCUNIT_CLOCK_GATE_DISABLE |
>  			DPLSUNIT_CLOCK_GATE_DISABLE |
>  			DPOUNIT_CLOCK_GATE_DISABLE |
> -		 	DPIOUNIT_CLOCK_GATE_DISABLE);	
> +			DPIOUNIT_CLOCK_GATE_DISABLE);
>  
>  	REG_WRITE(DSPCLK_GATE_D, reg_value);
>  
> -	udelay(500);		
> +	udelay(500);
>  }
>  
>  void
> @@ -1990,7 +1988,7 @@ cdv_intel_dp_init(struct drm_device *dev, struct psb_intel_mode_device *mode_dev
>  	gma_encoder->dev_priv=intel_dp;
>  	intel_dp->encoder = gma_encoder;
>  	intel_dp->output_reg = output_reg;
> -	
> +
>  	drm_encoder_helper_add(encoder, &cdv_intel_dp_helper_funcs);
>  	drm_connector_helper_add(connector, &cdv_intel_dp_connector_helper_funcs);
>  
> @@ -2027,7 +2025,7 @@ cdv_intel_dp_init(struct drm_device *dev, struct psb_intel_mode_device *mode_dev
>  		pp_on = REG_READ(PP_CONTROL);
>  		pp_on &= ~PANEL_UNLOCK_MASK;
>  	        pp_on |= PANEL_UNLOCK_REGS;
> -		
> +
>  		REG_WRITE(PP_CONTROL, pp_on);
>  
>  		pwm_ctrl = REG_READ(BLC_PWM_CTL2);
> @@ -2037,7 +2035,7 @@ cdv_intel_dp_init(struct drm_device *dev, struct psb_intel_mode_device *mode_dev
>                  pp_on = REG_READ(PP_ON_DELAYS);
>                  pp_off = REG_READ(PP_OFF_DELAYS);
>                  pp_div = REG_READ(PP_DIVISOR);
> -	
> +
>  		/* Pull timing values out of registers */
>                  cur.t1_t3 = (pp_on & PANEL_POWER_UP_DELAY_MASK) >>
>                          PANEL_POWER_UP_DELAY_SHIFT;
> @@ -2085,9 +2083,9 @@ cdv_intel_dp_init(struct drm_device *dev, struct psb_intel_mode_device *mode_dev
>  			goto err_connector;
>  		} else {
>          		DRM_DEBUG_KMS("DPCD: Rev=%x LN_Rate=%x LN_CNT=%x LN_DOWNSP=%x\n",
> -				intel_dp->dpcd[0], intel_dp->dpcd[1], 
> +				intel_dp->dpcd[0], intel_dp->dpcd[1],
>  				intel_dp->dpcd[2], intel_dp->dpcd[3]);
> -			
> +
>  		}
>  		/* The CDV reference driver moves pnale backlight setup into the displays that
>  		   have a backlight: this is a good idea and one we should probably adopt, however
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
