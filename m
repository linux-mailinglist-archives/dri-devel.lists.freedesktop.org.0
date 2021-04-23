Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B073694E7
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 16:39:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC7766EB9B;
	Fri, 23 Apr 2021 14:39:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C22A26EB9B
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 14:39:25 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id n140so49349375oig.9
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 07:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=I9MV5JyH6P4LcZ2fDNEMfCCgOEciWBlM45eAxADBLIQ=;
 b=jfQ5giClCQ+i8W6e5OshV7lriJfQRODdnG8kSfYWAHru1vZUimVaVXPgZiqdGMYkd3
 i+7zLQ4pJVAzrBjtNEgWyhHxY1F338mxE26iVYXQ1J3+PsKDRV36CM6+6O8RzMEaugCq
 aDdaIXgO8B1DTCbHtPAP6+PYYTvfaBgX9UrCiKKql4UQ29UYJsxHSfa0G1p3VfGlIvLY
 /KFCDYCkUr2XoX7iQyCF0RUcttULylRSInzTqkHaD0j7LD0uW/oFF2bbHT9XEvK9aCra
 ERrs+tyU8lYf9WObn8k7vI0j+B7kTw2lYGzwdUThODaAGzAKtang6KlpLBJwoJl8e9R/
 Jt2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=I9MV5JyH6P4LcZ2fDNEMfCCgOEciWBlM45eAxADBLIQ=;
 b=peJCSfW3I21TjkbjpYLXFbZlAZNudJIARLLar7MCBBN1GZAB9N4jRVwE2BHzkZv/Qk
 0Dp4KwD6z2lTJ4hn3t8M3R8APp2CY7HI65oHs9vljB6nPxluKPCdaiAO7dyf05Jpuanc
 Icn5Z7u50IEIs0KS/RkrFse+2LgbaKF6RZiouTwUaQCoKSg/H/6BWU3Fsl5DEG4b7Qtj
 cX5y0ZBu5TG+RLjzfdBUJjsI7QYAPZpXzjoZ7UtZcAAdk6QOGe1aLhuCMAIGVO96ast7
 ZoraqfJyAQ44WG0Wefk5oGLdzpiS/ETX/WASGKE9MIzdAtroRSvz171BObVU35o0XeaP
 rhKg==
X-Gm-Message-State: AOAM532wt2xY6QUGVJSoImOQOBBisWcdsUgyQhqYZrSj1kNAxhv9udEu
 CnpB4x8tS1LZSXh271yyAT1Eww==
X-Google-Smtp-Source: ABdhPJxVQ1s6ij+X+zfhhvI9MYkNm9WLqcvt633vB4X16M7nShv794knsCpkxzlL5HCG515umByBnw==
X-Received: by 2002:aca:eb4e:: with SMTP id j75mr4217266oih.125.1619188765058; 
 Fri, 23 Apr 2021 07:39:25 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id q23sm1395830otc.7.2021.04.23.07.39.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 07:39:24 -0700 (PDT)
Date: Fri, 23 Apr 2021 09:39:22 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 13/27] drm/bridge: ti-sn65dsi86: Use devm to do our
 runtime_disable
Message-ID: <YILcGg9tBRUasU5Q@builder.lan>
References: <20210416223950.3586967-1-dianders@chromium.org>
 <20210416153909.v4.13.I1e627eb5f316c0cf6595b120e6e262f5bf890300@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210416153909.v4.13.I1e627eb5f316c0cf6595b120e6e262f5bf890300@changeid>
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

> There's no devm_runtime_enable(), but it's easy to use
> devm_add_action_or_reset() and means we don't need to worry about the
> disable in our remove() routine or in error paths.
> 
> No functional changes intended by this change.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index a200e88fd006..53f1f7b3022f 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -1223,6 +1223,11 @@ static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,
>  	pdata->ln_polrs = ln_polrs;
>  }
>  
> +static void ti_sn65dsi86_runtime_disable(void *data)
> +{
> +	pm_runtime_disable(data);
> +}
> +
>  static int ti_sn65dsi86_probe(struct i2c_client *client,
>  			      const struct i2c_device_id *id)
>  {
> @@ -1278,12 +1283,13 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
>  		return ret;
>  
>  	pm_runtime_enable(dev);
> +	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_runtime_disable, dev);
> +	if (ret)
> +		return ret;
>  
>  	ret = ti_sn_setup_gpio_controller(pdata);
> -	if (ret) {
> -		pm_runtime_disable(dev);
> +	if (ret)
>  		return ret;
> -	}
>  
>  	pdata->aux.name = "ti-sn65dsi86-aux";
>  	pdata->aux.dev = dev;
> @@ -1316,8 +1322,6 @@ static int ti_sn65dsi86_remove(struct i2c_client *client)
>  
>  	drm_bridge_remove(&pdata->bridge);
>  
> -	pm_runtime_disable(pdata->dev);
> -
>  	of_node_put(pdata->host_node);
>  
>  	return 0;
> -- 
> 2.31.1.368.gbe11c130af-goog
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
