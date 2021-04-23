Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4A73694F1
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 16:41:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A07F6EBA3;
	Fri, 23 Apr 2021 14:41:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 076F06EBA3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 14:41:28 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id n184so23375754oia.12
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 07:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=FePZXkucMceLOfDt03Vpu6abm992vMdpP+oGJ2jOjNw=;
 b=m6fpWplmKwdwXU4JK/IzeVTFzLzC28YWwbXoD+y/NaLLaErrITDCBfoyGoqFlIdHtw
 2Ai/wBaQ/xW7RyPPeV2dMP1pp+WVF4QImf73t/ouSQmci0HuziElWSVp2RdH1RIVvkWH
 /ucHbwRkH0n8TZ9bcizSv996O93ISQEPrkQBlCjrKx53OY1o1SFfhyB1MsGb45PeKr8F
 EtXs/0kpF1Sfi19AoeE8Y7oDxDgMiKcts7PNmyofMsCGA5xnz+EG/AXo6gBir5R3VmnJ
 SJt7pUeTT+NKIbktxIgXSSdyGduCcevrzTTlVtayEjH0KOnCIV4g/n8PI9x2USqEP0UZ
 6gKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FePZXkucMceLOfDt03Vpu6abm992vMdpP+oGJ2jOjNw=;
 b=g1mNqRD+/D5fECo9Fc9pu13EHz6ZoCbs6O93nc2UK54eHD9e1S6lHgK2c1sWK0ZAoj
 XR5KyjaOe7dht2TCaMrXNUWF3Vr/MsgBr/+WM4iNCIZCrvojR1JBppC618yF56JQvStE
 U1XwRbhub+ETQdpkR4tULK7sGVFLKsDQDXuPkjhKmVJyEm4FMhIKRT2MQs7rChicmFGG
 lfL4DH4QcKPcYjsoin3WoqdYBhDbvqspE8EiBbGLSud5mB5xGG2DL5wdmxhqn1bb51Pk
 kwZfpMO6mDsRX5Io/WRLOPLDj2YSrLqDfTlmrEukYYjYcveuGipslEakOheIYcmJd513
 AjNQ==
X-Gm-Message-State: AOAM532+vzssDuSzMHrZR0dkXdRdhfpNx/kc9TrLn1qZAv6RwJ5lseXd
 NBq9DhDtX+CCzheDKl6/+6Ksc1XSUhk7mQ==
X-Google-Smtp-Source: ABdhPJxwatmNfPYAnerhrE6CQ2lbmlzjbgp9e+EIKP+DoG9PcKGhtuAVJ9evo923JktvZP5xV9BSBA==
X-Received: by 2002:a05:6808:1305:: with SMTP id
 y5mr4378294oiv.142.1619188887294; 
 Fri, 23 Apr 2021 07:41:27 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id j20sm1228593ooc.29.2021.04.23.07.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 07:41:26 -0700 (PDT)
Date: Fri, 23 Apr 2021 09:41:24 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 14/27] drm/bridge: ti-sn65dsi86: Move all the
 chip-related init to the start
Message-ID: <YILclD/XF1Ww6H7g@builder.lan>
References: <20210416223950.3586967-1-dianders@chromium.org>
 <20210416153909.v4.14.Ide8ba40feb2e43bc98a11edbb08d696d62dcd83e@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210416153909.v4.14.Ide8ba40feb2e43bc98a11edbb08d696d62dcd83e@changeid>
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

> This is just code motion of the probe routine to move all the things
> that are for the "whole chip" (instead of the GPIO parts or the
> MIPI-to-eDP parts) together at the start of probe. This is in
> preparation for breaking the driver into sub-drivers.
> 
> Since we're using devm for all of the "whole chip" stuff this is
> actually quite easy now.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 53f1f7b3022f..57bc489a0412 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -1253,12 +1253,6 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
>  		return PTR_ERR(pdata->regmap);
>  	}
>  
> -	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &pdata->panel, NULL);
> -	if (ret) {
> -		DRM_ERROR("could not find any panel node\n");
> -		return ret;
> -	}
> -
>  	pdata->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
>  	if (IS_ERR(pdata->enable_gpio)) {
>  		DRM_ERROR("failed to get enable gpio from DT\n");
> @@ -1266,8 +1260,6 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
>  		return ret;
>  	}
>  
> -	ti_sn_bridge_parse_lanes(pdata, dev->of_node);
> -
>  	ret = ti_sn65dsi86_parse_regulators(pdata);
>  	if (ret) {
>  		DRM_ERROR("failed to parse regulators\n");
> @@ -1278,12 +1270,22 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
>  	if (IS_ERR(pdata->refclk))
>  		return PTR_ERR(pdata->refclk);
>  
> -	ret = ti_sn_bridge_parse_dsi_host(pdata);
> +	pm_runtime_enable(dev);
> +	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_runtime_disable, dev);
>  	if (ret)
>  		return ret;
>  
> -	pm_runtime_enable(dev);
> -	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_runtime_disable, dev);
> +	ti_sn65dsi86_debugfs_init(pdata);
> +
> +	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &pdata->panel, NULL);
> +	if (ret) {
> +		DRM_ERROR("could not find any panel node\n");
> +		return ret;
> +	}
> +
> +	ti_sn_bridge_parse_lanes(pdata, dev->of_node);
> +
> +	ret = ti_sn_bridge_parse_dsi_host(pdata);
>  	if (ret)
>  		return ret;
>  
> @@ -1301,8 +1303,6 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
>  
>  	drm_bridge_add(&pdata->bridge);
>  
> -	ti_sn65dsi86_debugfs_init(pdata);
> -
>  	return 0;
>  }
>  
> -- 
> 2.31.1.368.gbe11c130af-goog
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
