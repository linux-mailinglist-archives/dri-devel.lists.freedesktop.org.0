Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C114AAB5537
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 14:52:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EBDF10E37E;
	Tue, 13 May 2025 12:52:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DGw7Fryp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BF2210E37E
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 12:52:35 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43cec5cd73bso37993025e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 05:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747140753; x=1747745553; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ovgqc7rC+0i7F6t3MyfCH1QXEeImfFeRKV44bs3pIag=;
 b=DGw7Fryp3fGLNLOHXZkMeMrzlMNog/+oiY8fKgWKxzd67XugDMyPQsdJESHEisTQU/
 Ky621ZCvMlJcXDbghEUkjNNvWfm3TmsYqQeVHLz+IJgtw290p83sd4VQyjCp6Hymodjj
 T1bTUAM9/OPxzn/wP4IVquhLkUdIM9jWx6JLgxAdro6nUIuu70KjBUWxq17ptTP8S6d6
 M2W6hGsvxZFDlFb+E9h8BEU9x+xJ7dozl0Wnap39d3zWgp4fEb80+ns8l6ydGfCZRxj/
 EwXxPoKUDQiaIpRTki0jDxxxyIbMdjzK80/qAMOU+hU1fYIza9RTPczip+M3Wh9QwcpN
 oPvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747140753; x=1747745553;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ovgqc7rC+0i7F6t3MyfCH1QXEeImfFeRKV44bs3pIag=;
 b=L4U2S5iM28HoxudGMqVASPn7hyKvvKN+HD16DrE7YHClg18dBQRumbFXwZmuBUub4J
 Ggxw2nnotM0kCj7S6V754/IrPbepO20czOfLcjsDiIXfC5pE7evoR7S9s9x0vZ65eKOX
 8S2vhV6jAQby3Z0WYTXXlB3GZjq39M9ZC+YGchx+anQhKk/gcRDHFxH46uM9S682pN08
 zM465/0Zxt+UlbtvF94E1EF7QUsN8UVjUdFLTjMBgLIMBEMVQdW/vqot7+H/W8kTQ4a4
 Jxwx3LZKInR4TtfpizGHfBXBaxxXIq8tAKn2wK70IyEfXyYELppf+7TynDvMIZoEB7L7
 R/pQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUL7L0F44hmNg5LpUJD+RXT8QTzW+n1KNopeck9bJv+V05Ch2QjHYWol8jUZ71mrUAvzOtad/zvnV8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpkNch5wdKVnaoDXLq06nOge3CYAiPOTTbr0Mh4CiMB0H5piMZ
 YPJgL61Ng6VGkO9Z9UmVnP5Ebt14fLF1t7SZuIc75euhpNZr65tH3FMOLgYr
X-Gm-Gg: ASbGnctG7vWC9UVgIo45Kba9cXRrf5Gguvnev6+3N9a3APDiped/5umHnhG2NBRFapy
 CW0CYuINLQlZm1wGJ4CgMTpEnf3y6yv7oBacpz+cld/HiSzJAdxXtGc/EpXdSezS88fN58Oa7it
 PCsQvOml1IyJpyPYJ1V3Zln1oGXmPS39OJL4AjtocHefrHlUECYKhtf2LcEsMCx3ki+ylVInc+O
 ibloZQLvkeLh0oPhfWP20xUeSwbGA9jWPmKWiYf/Cpd78BRT824rc83aTe9xFTUjt4eJjhBUHRP
 pFfXk9s8XJdUSM8Cc5OhpDggZysFm0y2/EZc1TU3KSAr8cNHfnPBE+JblBXVxtL2Hxna7r1cx1M
 pAiNG8sE13FxzWgHtPg5hDlkGkGHysMZcBavErb+XBMU=
X-Google-Smtp-Source: AGHT+IFf2bg52RNZJGo+rHY7+s+82rwvjasfaCxzOtsKjPH7EPA41e/9YLFWhnk4k4f0C/ZQm+pFYQ==
X-Received: by 2002:a05:600c:444c:b0:43d:5ec:b2f4 with SMTP id
 5b1f17b1804b1-442d6d3dcc8mr174303035e9.10.1747140753345; 
 Tue, 13 May 2025 05:52:33 -0700 (PDT)
Received: from toolbox (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch.
 [83.173.201.248]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd328455sm215109515e9.2.2025.05.13.05.52.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 May 2025 05:52:33 -0700 (PDT)
Date: Tue, 13 May 2025 14:52:31 +0200
From: Max Krummenacher <max.oss.09@gmail.com>
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: dianders@chromium.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org,
 tomi.valkeinen@ideasonboard.com, max.krummenacher@toradex.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 kieran.bingham+renesas@ideasonboard.com,
 linux-kernel@vger.kernel.org, devarsht@ti.com
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort
 connector type
Message-ID: <aCNAjz1wt2lPukXv@toolbox>
References: <20250508115433.449102-1-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508115433.449102-1-j-choudhary@ti.com>
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

Hi

On Thu, May 08, 2025 at 05:24:33PM +0530, Jayesh Choudhary wrote:
> By default, HPD was disabled on SN65DSI86 bridge. When the driver was
> added (commit "a095f15c00e27"), the HPD_DISABLE bit was set in pre-enable
> call which was moved to other function calls subsequently.
> Later on, commit "c312b0df3b13" added detect utility for DP mode. But with
> HPD_DISABLE bit set, all the HPD events are disabled[0] and the debounced
> state always return 1 (always connected state)
> 
> Also, with the suspend and resume calls before every register access, the
> bridge starts with disconnected state and the HPD state is reflected
> correctly only after debounce time (400ms). However, adding this delay
> in the detect function causes frame drop and visible glitch in display.
> 
> So to get the detect utility working properly for DP mode without any
> performance issues in display, instead of reading HPD state from the
> register, rely on aux communication. Use 'drm_dp_dpcd_read_link_status'
> to find if we have something connected at the sink.
> 
> [0]: <https://www.ti.com/lit/gpn/SN65DSI86> (Pg. 32)
> 
> Fixes: c312b0df3b13 ("drm/bridge: ti-sn65dsi86: Implement bridge connector operations for DP")
> Cc: Max Krummenacher <max.krummenacher@toradex.com>
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
> 
> v1 patch link which was sent as RFC:
> <https://patchwork.kernel.org/project/dri-devel/patch/20250424105432.255309-1-j-choudhary@ti.com/>
> 
> Changelog v1->v2:
> - Drop additional property in bindings and use conditional.
> - Instead of register read for HPD state, use dpcd read which returns 0
>   for success and error codes for no connection
> - Add relevant history for the required change in commit message
> - Drop RFC subject-prefix in v2 as v2 is in better state after discussion
>   in v1 and Max's mail thread
> - Add "Cc:" tag 
> 
> This approach does not make suspend/resume no-op and no additional
> delay needs to be added in the detect hook which causes frame drops.
> 
> Here, I am adding conditional to HPD_DISABLE bit even when we are
> not using the register read to get HPD state. This is to prevent
> unnecessary register updates in every resume call.
> (It was adding to latency and leading to ~2-3 frame drop every 10 sec)
> 
> Tested and verified on TI's J784S4-EVM platform:
> - Display comes up
> - Detect utility works with a couple of seconds latency.
>   But I guess without interrupt support, this is acceptable.
> - No frame-drop observed
>  
> Discussion thread for Max's patch:
> <https://patchwork.kernel.org/project/dri-devel/patch/20250501074805.3069311-1-max.oss.09@gmail.com/>
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 60224f476e1d..9489e78b6da3 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -352,8 +352,10 @@ static void ti_sn65dsi86_enable_comms(struct ti_sn65dsi86 *pdata,
>  	 * change this to be conditional on someone specifying that HPD should
>  	 * be used.
>  	 */
> -	regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
> -			   HPD_DISABLE);
> +
> +	if (pdata->bridge.type == DRM_MODE_CONNECTOR_eDP)
> +		regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
> +				   HPD_DISABLE);
>  
>  	pdata->comms_enabled = true;
>  
> @@ -1194,13 +1196,14 @@ static enum drm_connector_status ti_sn_bridge_detect(struct drm_bridge *bridge)
>  {
>  	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
>  	int val = 0;
> +	u8 link_status[DP_LINK_STATUS_SIZE];
>  
> -	pm_runtime_get_sync(pdata->dev);
> -	regmap_read(pdata->regmap, SN_HPD_DISABLE_REG, &val);
> -	pm_runtime_put_autosuspend(pdata->dev);
> +	val = drm_dp_dpcd_read_link_status(&pdata->aux, link_status);
>  
> -	return val & HPD_DEBOUNCED_STATE ? connector_status_connected
> -					 : connector_status_disconnected;
> +	if (val < 0)
> +		return connector_status_disconnected;
> +	else
> +		return connector_status_connected;
>  }
>  
>  static const struct drm_edid *ti_sn_bridge_edid_read(struct drm_bridge *bridge,
> -- 
> 2.34.1
> 

This fixes the issues I have with detecting a not connected monitor on
boot.

As my HW has enable under software control but the power supplies not there
seem to be an issue to properly bring up the bridge after a disconnect and
then reconnect. I can work around that in the device tree by not adding the
optional enable gpio.

As such on a HW with a DP connector and a DP monitor:
Tested-by: Max Krummenacher <max.krummenacher@toradex.com>
