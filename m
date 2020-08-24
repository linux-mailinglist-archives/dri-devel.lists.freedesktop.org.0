Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 469C024FA29
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 11:53:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05CC26E171;
	Mon, 24 Aug 2020 09:53:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE3B66E171
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 09:53:36 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id p17so2341572wrj.8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 02:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:autocrypt:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e5XKNJgSnPPuqTFxU2qq9xdRZvRb9N1c3AxvSMq4xzI=;
 b=Vp6UDytzYtsyr7GZJoLYyabnbY3b9NR6EXX6cpEGEFcnibXyIzOqd/1jLNQl6kWlvv
 KneMyhoarCyH5lIZHorvTyB6lztAobfPANUTlM464bckXpiYR8P3hk3JNITQmffCtI2g
 RAxvST2c1GcpEoBukkfFNQ5J91HLHZ0xkbS+ggLcJvx4BunIbGRXOWQ9jFPgsQcC4Ik2
 BJTEMh8uRW/dtRcXZvHdzjCPNWPDgWEv0oBZw1NigWjBvCOs9ksQ0vqpxktvk87RwrVl
 wI06MnjMBGi+j2xcxeUkDSsY6P/Zt6n6GHflAET9qWCw21vQUF1zT4ZZzfv1aTaUoY5t
 coDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=e5XKNJgSnPPuqTFxU2qq9xdRZvRb9N1c3AxvSMq4xzI=;
 b=WHI3QkQHtVcSveqYcvQ7wlSuSzCToEkDNRaE8JNTCS4CP1lDbEHVZ37RYnb4+4fskW
 +4UxF+WjNa5En1gyC8dMO5O8wv6aezQkTwdZ95VVs+TbyVIvUOjLMKXUm1wDrj9Kj96Q
 FRXVtKaax6ipRey04E71I/pR30kvp8VYq5lMurRVC8ArEeA35T617fIysT4hGROA78mB
 CcDQ56+IKV/Nzxz8l5D0EPvkz46jW9ILlQtRUCV8vzK1ZDu6bmcNYLJbgolHInbHm6LJ
 K5atiK1rB4/pbR9MkhXHG6fn3ZPXyhHKq16BakDEzU2jr1dGpuwFo1/gVFPjRWlLl7KS
 wP5w==
X-Gm-Message-State: AOAM531qdbfHNX/AIqIHd/ErB1qb9UzxKCsxE8q5bkHiLaGVFtmxRDKF
 rwo1kY3bzl5sjZ4GcyA2L8Owog==
X-Google-Smtp-Source: ABdhPJyEVB6G8coYF0MZc2X/fqrlEfSPckB2U18sLiFLQxpVx0dg1wcEMubAwIK0bX1FydoWw0NleQ==
X-Received: by 2002:a5d:43ca:: with SMTP id v10mr4983620wrr.299.1598262815147; 
 Mon, 24 Aug 2020 02:53:35 -0700 (PDT)
Received: from [10.1.2.12] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id u3sm22073632wml.44.2020.08.24.02.53.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Aug 2020 02:53:34 -0700 (PDT)
Subject: Re: [PATCH 3/6] drm: bridge: dw-hdmi: Introduce
 previous_pixelclock/previous_tmdsclock
To: Algea Cao <algea.cao@rock-chips.com>, a.hajda@samsung.com,
 kuankuan.y@gmail.com, hjc@rock-chips.com, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, sam@ravnborg.org, airlied@linux.ie,
 heiko@sntech.de, jernej.skrabec@siol.net, Laurent.pinchart@ideasonboard.com,
 laurent.pinchart+renesas@ideasonboard.com, jonas@kwiboo.se,
 mripard@kernel.org, darekm@google.com, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, cychiang@chromium.org,
 linux-kernel@vger.kernel.org, jbrunet@baylibre.com,
 maarten.lankhorst@linux.intel.com, daniel@ffwll.ch
References: <20200812083120.743-1-algea.cao@rock-chips.com>
 <20200812083459.989-1-algea.cao@rock-chips.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <fd42150f-45fc-1664-eeab-7b8e9e99ed60@baylibre.com>
Date: Mon, 24 Aug 2020 11:53:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200812083459.989-1-algea.cao@rock-chips.com>
Content-Language: en-US
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/08/2020 10:34, Algea Cao wrote:
> Introduce previous_pixelclock/previous_tmdsclock to
> determine whether PHY needs initialization. If phy is power off,
> or mpixelclock/mtmdsclock is different to previous value, phy is
> neet to be reinitialized.
> 
> Signed-off-by: Algea Cao <algea.cao@rock-chips.com>
> ---
> 
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 50 +++++++++++++++++++----
>  1 file changed, 43 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index a1a81fc768c2..1eb4736b9b59 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -101,6 +101,8 @@ static const u16 csc_coeff_rgb_full_to_rgb_limited[3][4] = {
>  struct hdmi_vmode {
>  	bool mdataenablepolarity;
>  
> +	unsigned int previous_pixelclock;
> +	unsigned int previous_tmdsclock;
>  	unsigned int mpixelclock;
>  	unsigned int mpixelrepetitioninput;
>  	unsigned int mpixelrepetitionoutput;
> @@ -890,6 +892,32 @@ static int hdmi_bus_fmt_color_depth(unsigned int bus_format)
>  	}
>  }
>  
> +static unsigned int
> +hdmi_get_tmdsclock(struct dw_hdmi *hdmi, unsigned long mpixelclock)
> +{
> +	unsigned int tmdsclock = mpixelclock;
> +	unsigned int depth =
> +		hdmi_bus_fmt_color_depth(hdmi->hdmi_data.enc_out_bus_format);
> +
> +	if (!hdmi_bus_fmt_is_yuv422(hdmi->hdmi_data.enc_out_bus_format)) {
> +		switch (depth) {
> +		case 16:
> +			tmdsclock = mpixelclock * 2;
> +			break;
> +		case 12:
> +			tmdsclock = mpixelclock * 3 / 2;
> +			break;
> +		case 10:
> +			tmdsclock = mpixelclock * 5 / 4;
> +			break;
> +		default:
> +			break;
> +		}
> +	}


Where does this come from ? Please introduce this on another patch.

Neil

> +
> +	return tmdsclock;
> +}
> +
>  /*
>   * this submodule is responsible for the video data synchronization.
>   * for example, for RGB 4:4:4 input, the data map is defined as
> @@ -1861,11 +1889,13 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
>  	int hblank, vblank, h_de_hs, v_de_vs, hsync_len, vsync_len;
>  	unsigned int vdisplay, hdisplay;
>  
> +	vmode->previous_pixelclock = vmode->mpixelclock;
>  	vmode->mpixelclock = mode->clock * 1000;
>  
>  	dev_dbg(hdmi->dev, "final pixclk = %d\n", vmode->mpixelclock);
>  
> -	vmode->mtmdsclock = vmode->mpixelclock;
> +	vmode->previous_tmdsclock = vmode->mtmdsclock;
> +	vmode->mtmdsclock = hdmi_get_tmdsclock(hdmi, vmode->mpixelclock);
>  
>  	if (!hdmi_bus_fmt_is_yuv422(hdmi->hdmi_data.enc_out_bus_format)) {
>  		switch (hdmi_bus_fmt_color_depth(
> @@ -2172,12 +2202,18 @@ static int dw_hdmi_setup(struct dw_hdmi *hdmi,
>  	hdmi_av_composer(hdmi, &connector->display_info, mode);
>  
>  	/* HDMI Initializateion Step B.2 */
> -	ret = hdmi->phy.ops->init(hdmi, hdmi->phy.data,
> -				  &connector->display_info,
> -				  &hdmi->previous_mode);
> -	if (ret)
> -		return ret;
> -	hdmi->phy.enabled = true;
> +	if (!hdmi->phy.enabled ||
> +	    hdmi->hdmi_data.video_mode.previous_pixelclock !=
> +	    hdmi->hdmi_data.video_mode.mpixelclock ||
> +	    hdmi->hdmi_data.video_mode.previous_tmdsclock !=
> +	    hdmi->hdmi_data.video_mode.mtmdsclock) {
> +		ret = hdmi->phy.ops->init(hdmi, hdmi->phy.data,
> +					  &connector->display_info,
> +					  &hdmi->previous_mode);
> +		if (ret)
> +			return ret;
> +		hdmi->phy.enabled = true;
> +	}
>  
>  	/* HDMI Initialization Step B.3 */
>  	dw_hdmi_enable_video_path(hdmi);
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
