Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FE3A455CF
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 07:42:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AA2B10E855;
	Wed, 26 Feb 2025 06:42:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="G1tBCsMr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3816010E855
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 06:41:59 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5439a6179a7so631786e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 22:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740552117; x=1741156917; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=slhhH1OWDPhNxuUWfIi9e2TTyh07XT8L5EcIfOsNnAc=;
 b=G1tBCsMrnPQMrB1kG8r/COvGYR/UZSh83E1bJ7sVEw5i9ar4mgbzmF0S0RlnAl74Zm
 LJsJh6axT4QXFf+ZCdMRsAGpz599+ooke5m/jqF6MD6cDbwjPwYTZFcsvtQ9WWejlYKE
 eLZVaGGTKgAGfQq56/Gwr+/gXj9ZNrAginBgDPtoto6oywbI0meoHOWrgLDjiNpTpajo
 dNcpwHSJHyZzwop/wQvSSrQYuWTrMVPUo7jMz1HK4EhwARL115VhqHcEjK15CqndZPK4
 PTWnSMDUfRUtR1d4K9t7Qwgk4yrp8oJb5p3fR4uOC9x1m5/ADSVk6aADIh9HAJWxPh1b
 2Eig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740552117; x=1741156917;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=slhhH1OWDPhNxuUWfIi9e2TTyh07XT8L5EcIfOsNnAc=;
 b=kX3kLM7HhUvdaGRVe2U0hCNTU/eJIirHZ8egUZ4rrNtqHNPbIG2FpgfEHwCANrCb4z
 LTzo4RkeJ2UFubi4kFwf0iAGKMddpnNg3PDFdqYhe0ulJfT30sCTMp1zvlXdX05hFPs/
 NPoPu7FRpxmpCTa7toa4ojQRrOk6pBd1j33qNGyFAhD6cFgLKwRo7xwU7GD21iUZ0M4C
 RoLkma+fZSL8b0/I9/PoBGHdUPXYOZwtX3qvurhm7xUjUBVDUVACubPAklsVwZhvBpZ4
 a12BMoOZAugNie1jUmAVFUqFb/ojrBgu4KNQtSxPA69bsIZVx+k/w5YT68YyJkvW/g0k
 7yAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVU8xuEVeNB3Whn86Tnn22fogmBkK90GDutFfVYuuhvKugEtvkucBsgkna3lQ8qxJpFhmvON6Hyi98=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzj9ZCFE45BB2PFBa4aJJZU3V1+Pl+B5CqHJX2G0AWCpbVaXin5
 dQ/eLzBg/Sz7DfgzoZT+cp00XDa8eV0KhAZIV4eqv1z6n7gAK+n+y0scSRmF5F0=
X-Gm-Gg: ASbGnctyeRdsCd4ePFL3YiH5DxbT7+tSMJtN5Fr1LOND7wr8FiM8laI9JDFJHoF2INA
 5sQqlZOkLRClu7VRQY5te5kkqpUDV+9yFA3sck/a1yLPWefRwPY5o3vZOIfbXdNU/EDZmXKCBaG
 db8WN2Qy9j7XrnXfNcVZ8V0ba90Wg5thoOeFms5gQLUQ1ba+WzRs0eKmt/fcAriFjHG8Z2wnyhl
 PDTJV8+RP7leacyzPdzidtsizNF4J9ia81xGhwM0plH2AE4hFzhh8UQY+Ng6DE8E4uLb8Wlbo+C
 it/z5Ms/3veYHLOaFMQSa8cR4C5Y3RtTZqhNw9UIN06tm5o1P+Md7xuWy8OQZytLGUpK0lG3e2C
 fnXIwbQ==
X-Google-Smtp-Source: AGHT+IF8CNQ53YpP1ppilap6LhhTVanQkQOb2cwMukzGWQfv2mevxc1ON9jFy4KyLi6x6nClDMW1fw==
X-Received: by 2002:a05:6512:e8b:b0:545:dc8:9376 with SMTP id
 2adb3069b0e04-546e3c9c979mr9782380e87.5.1740552117486; 
 Tue, 25 Feb 2025 22:41:57 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-548514fa052sm359461e87.228.2025.02.25.22.41.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 22:41:57 -0800 (PST)
Date: Wed, 26 Feb 2025 08:41:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, 
 Herve Codina <herve.codina@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v4 07/15] drm/bridge: Add helper to reset bridge pipeline
Message-ID: <sqsk3ievl3kujkljqosww233yio4uke5met7zqhzssmehzdck5@doaikab7bggr>
References: <20250225-bridge-connector-v4-0-7ecb07b09cad@kernel.org>
 <20250225-bridge-connector-v4-7-7ecb07b09cad@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225-bridge-connector-v4-7-7ecb07b09cad@kernel.org>
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

On Tue, Feb 25, 2025 at 05:43:55PM +0100, Maxime Ripard wrote:
> Let's provide an helper to make it easier for bridge drivers to
> power-cycle their bridge.
> 
> Co-developed-by: Simona Vetter <simona.vetter@ffwll.ch>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_bridge.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_bridge.h     |  2 ++
>  2 files changed, 46 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 8241c00e4506eceeb9bb4ba74a38d8f360c65d38..ca894531a2042fc9296c40a1f51a6cdea6e97ed7 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -24,10 +24,11 @@
>  #include <linux/err.h>
>  #include <linux/media-bus-format.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  
> +#include <drm/drm_atomic_helper.h>
>  #include <drm/drm_atomic_state_helper.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_debugfs.h>
>  #include <drm/drm_edid.h>
>  #include <drm/drm_encoder.h>
> @@ -1269,10 +1270,53 @@ void drm_bridge_hpd_notify(struct drm_bridge *bridge,
>  		bridge->hpd_cb(bridge->hpd_data, status);
>  	mutex_unlock(&bridge->hpd_mutex);
>  }
>  EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify);
>  
> +/**
> + * drm_bridge_reset_crtc - Reset the pipeline feeding a bridge
> + * @bridge: DRM bridge to reset
> + * @ctx: lock acquisition context
> + *
> + * Reset a @bridge pipeline. It will power-cycle all active components
> + * between the CRTC and connector that bridge is connected to.
> + *
> + * Returns:
> + *
> + * 0 on success or a negative error code on failure. If the error
> + * returned is EDEADLK, the whole atomic sequence must be restarted.
> + */
> +int drm_bridge_reset_crtc(struct drm_bridge *bridge,
> +			  struct drm_modeset_acquire_ctx *ctx)
> +{
> +	struct drm_connector *connector;
> +	struct drm_encoder *encoder = bridge->encoder;
> +	struct drm_device *dev = encoder->dev;
> +	struct drm_crtc *crtc;
> +	int ret;
> +
> +	ret = drm_modeset_lock(&dev->mode_config.connection_mutex, ctx);
> +	if (ret)
> +		return ret;
> +
> +	connector = drm_atomic_get_connector_for_encoder(encoder, ctx);
> +	if (IS_ERR(connector)) {
> +		ret = PTR_ERR(connector);
> +		goto out;
> +	}
> +

Should there be a check for connector->state before accessing
connector->state->crtc ?

> +	crtc = connector->state->crtc;
> +	ret = drm_atomic_helper_reset_crtc(crtc, ctx);
> +	if (ret)
> +		goto out;
> +
> +out:
> +	drm_modeset_unlock(&dev->mode_config.connection_mutex);
> +	return ret;
> +}
> +EXPORT_SYMBOL(drm_bridge_reset_crtc);
> +
>  #ifdef CONFIG_OF
>  /**
>   * of_drm_find_bridge - find the bridge corresponding to the device node in
>   *			the global bridge list
>   *
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 6fb1da7c195e99143a67a999d16fe361c1e3f4ab..32169e62463bb268a281a5903c0c9f448a1042b3 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -1085,10 +1085,12 @@ void drm_bridge_hpd_enable(struct drm_bridge *bridge,
>  				      enum drm_connector_status status),
>  			   void *data);
>  void drm_bridge_hpd_disable(struct drm_bridge *bridge);
>  void drm_bridge_hpd_notify(struct drm_bridge *bridge,
>  			   enum drm_connector_status status);
> +int drm_bridge_reset_crtc(struct drm_bridge *bridge,
> +			  struct drm_modeset_acquire_ctx *ctx);
>  
>  #ifdef CONFIG_DRM_PANEL_BRIDGE
>  bool drm_bridge_is_panel(const struct drm_bridge *bridge);
>  struct drm_bridge *drm_panel_bridge_add(struct drm_panel *panel);
>  struct drm_bridge *drm_panel_bridge_add_typed(struct drm_panel *panel,
> 
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry
