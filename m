Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5C51E21E2
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 14:29:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAC916E176;
	Tue, 26 May 2020 12:29:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E624F6E176
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 12:29:48 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id u26so1052903wmn.1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 05:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y230r+Ddol1M9ve3nhIsJQdcvD+QKUWtZpGQcDpUxIc=;
 b=hqfyLgQ0k/zA+nbpg7eGkkX03cxHD4KhcS3G+KJjWPA9igiZOQ3Wprv6IQTuqeexLO
 O7SKDSIsgp7ituAuHwJZkF40zbG0lkhWMUW3EfhJCvAzqVfbLVHz/der0L/2A3xUn6+G
 eBGXBFca5GEuWVEJcPgibRm6Ez/wqa7PGDfJnMkzT3A311sXQMMD/A3gs25+bUTCrKTr
 rxUiKkqyoFle8v7m9ZGmxC9Et7PSsNdMBKHYB1FtGifwPMOIjD8oyL/kbE2mPJyPj62Q
 j2ObJcd5YSOCwSvDqxfFYRIk3HqxXWiTfk1vLOmcUG5QBbpwFKesYIPFg1MKup2ctILL
 3ISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Y230r+Ddol1M9ve3nhIsJQdcvD+QKUWtZpGQcDpUxIc=;
 b=mjoffcYnmlspj5Unz2SKKOJwlc2ia9yECiPNwnsna9lfFC/voh6njefnwNDI9X32AO
 NorWq4N/0Qlo6967inbtTkcFcIoiXbbljPag0ZcbLdqiquIOVWnOKXtcXrC66UrQrRBT
 avlz0nVIpLjyyFSeu5fiBNKLIYPBwF9xN+J7O6FCG0iuOi6A+KnyY27eBO8GytYXycVA
 mAvwV+uWAL050M2UFeYa9vYD+21bJx94yhw/YUya1fmvGrjfJ5Z/7QEqYbbU4OJQIhT+
 JYoMZlweAw2D1b4BKzhT8oW4KXb8XPkMHHrYHgWbbNwqZoNHMUyQXPntNv/RusT7Z+58
 51dQ==
X-Gm-Message-State: AOAM531MqdcYtBoMg5W6WmwBbRBPb8PR0+ubYvE6DsOe+AGwfUME2q8y
 coK23R4fP+vXAn0eSrhmCe7AUQ==
X-Google-Smtp-Source: ABdhPJzxKOpRhbvQDSX4+9IsbCHicqyzzMx5o7tTUcd6sZQdzu2v3yaBZPLACZWvlyjI/7iuTPOMlQ==
X-Received: by 2002:a1c:998c:: with SMTP id b134mr1282922wme.78.1590496187224; 
 Tue, 26 May 2020 05:29:47 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:acf8:18a8:b3a5:a17b?
 ([2a01:e35:2ec0:82b0:acf8:18a8:b3a5:a17b])
 by smtp.gmail.com with ESMTPSA id q5sm1157605wrm.62.2020.05.26.05.29.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 May 2020 05:29:46 -0700 (PDT)
Subject: Re: [PATCH 21/27] drm: bridge: dw-hdmi: Pass drm_connector to
 internal functions as needed
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200526011505.31884-22-laurent.pinchart+renesas@ideasonboard.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <235cc8f1-bfba-cf3a-50f0-f6d1b977e9fb@baylibre.com>
Date: Tue, 26 May 2020 14:29:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200526011505.31884-22-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/05/2020 03:14, Laurent Pinchart wrote:
> To prepare for making connector creation optional in the driver, pass
> the drm_connector explicitly to the internal functions that require it.
> The functions that still access the connector from the dw_hdmi structure
> are dw_hdmi_connector_create() and __dw_hdmi_probe(). The former access
> is expected, as that's where the internal connector is created. The
> latter will be addressed separately.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 31 +++++++++++++----------
>  1 file changed, 18 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 16bffedb4715..b69c14b9de62 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -1632,18 +1632,17 @@ static void hdmi_tx_hdcp_config(struct dw_hdmi *hdmi)
>  }
>  
>  static void hdmi_config_AVI(struct dw_hdmi *hdmi,
> +			    const struct drm_connector *connector,
>  			    const struct drm_display_mode *mode)
>  {
>  	struct hdmi_avi_infoframe frame;
>  	u8 val;
>  
>  	/* Initialise info frame from DRM mode */
> -	drm_hdmi_avi_infoframe_from_display_mode(&frame,
> -						 &hdmi->connector, mode);
> +	drm_hdmi_avi_infoframe_from_display_mode(&frame, connector, mode);
>  
>  	if (hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_out_bus_format)) {
> -		drm_hdmi_avi_infoframe_quant_range(&frame, &hdmi->connector,
> -						   mode,
> +		drm_hdmi_avi_infoframe_quant_range(&frame, connector, mode,
>  						   hdmi->hdmi_data.rgb_limited_range ?
>  						   HDMI_QUANTIZATION_RANGE_LIMITED :
>  						   HDMI_QUANTIZATION_RANGE_FULL);
> @@ -1760,14 +1759,14 @@ static void hdmi_config_AVI(struct dw_hdmi *hdmi,
>  }
>  
>  static void hdmi_config_vendor_specific_infoframe(struct dw_hdmi *hdmi,
> +						  const struct drm_connector *connector,
>  						  const struct drm_display_mode *mode)
>  {
>  	struct hdmi_vendor_infoframe frame;
>  	u8 buffer[10];
>  	ssize_t err;
>  
> -	err = drm_hdmi_vendor_infoframe_from_display_mode(&frame,
> -							  &hdmi->connector,
> +	err = drm_hdmi_vendor_infoframe_from_display_mode(&frame, connector,
>  							  mode);
>  	if (err < 0)
>  		/*
> @@ -1813,9 +1812,10 @@ static void hdmi_config_vendor_specific_infoframe(struct dw_hdmi *hdmi,
>  			HDMI_FC_DATAUTO0_VSD_MASK);
>  }
>  
> -static void hdmi_config_drm_infoframe(struct dw_hdmi *hdmi)
> +static void hdmi_config_drm_infoframe(struct dw_hdmi *hdmi,
> +				      const struct drm_connector *connector)
>  {
> -	const struct drm_connector_state *conn_state = hdmi->connector.state;
> +	const struct drm_connector_state *conn_state = connector->state;
>  	struct hdmi_drm_infoframe frame;
>  	u8 buffer[30];
>  	ssize_t err;
> @@ -2118,9 +2118,9 @@ static void hdmi_disable_overflow_interrupts(struct dw_hdmi *hdmi)
>  }
>  
>  static int dw_hdmi_setup(struct dw_hdmi *hdmi,
> +			 const struct drm_connector *connector,
>  			 const struct drm_display_mode *mode)
>  {
> -	struct drm_connector *connector = &hdmi->connector;
>  	int ret;
>  
>  	hdmi_disable_overflow_interrupts(hdmi);
> @@ -2192,9 +2192,9 @@ static int dw_hdmi_setup(struct dw_hdmi *hdmi,
>  		dev_dbg(hdmi->dev, "%s HDMI mode\n", __func__);
>  
>  		/* HDMI Initialization Step F - Configure AVI InfoFrame */
> -		hdmi_config_AVI(hdmi, mode);
> -		hdmi_config_vendor_specific_infoframe(hdmi, mode);
> -		hdmi_config_drm_infoframe(hdmi);
> +		hdmi_config_AVI(hdmi, connector, mode);
> +		hdmi_config_vendor_specific_infoframe(hdmi, connector, mode);
> +		hdmi_config_drm_infoframe(hdmi, connector);
>  	} else {
>  		dev_dbg(hdmi->dev, "%s DVI mode\n", __func__);
>  	}
> @@ -2263,7 +2263,12 @@ static void initialize_hdmi_ih_mutes(struct dw_hdmi *hdmi)
>  static void dw_hdmi_poweron(struct dw_hdmi *hdmi)
>  {
>  	hdmi->bridge_is_on = true;
> -	dw_hdmi_setup(hdmi, &hdmi->previous_mode);
> +
> +	/*
> +	 * The curr_conn field is guaranteed to be valid here, as this function
> +	 * is only be called when !hdmi->disabled.
> +	 */
> +	dw_hdmi_setup(hdmi, hdmi->curr_conn, &hdmi->previous_mode);
>  }
>  
>  static void dw_hdmi_poweroff(struct dw_hdmi *hdmi)
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
