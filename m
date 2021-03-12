Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A8A3383F8
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 03:49:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 038986EA9A;
	Fri, 12 Mar 2021 02:49:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4DC36EA9A
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 02:49:32 +0000 (UTC)
Received: by mail-oo1-xc36.google.com with SMTP id
 r17-20020a4acb110000b02901b657f28cdcso1198114ooq.6
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 18:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=EYVqRVBPVhizjxhXnWF45Gz26g8vdQA3COQqWInRBeA=;
 b=gL3L51OcWU67DmzWlOUOVcXvpiTxuMJpwzzNInvbPku7ZfttNYAc+vJTXP2pwN456X
 ezPUT2byJNG2YyVG7IIik1mPkyz9NjBjzxuYKRiFRa7CvXGRDLVP6zPuKYJCaNJJjd5U
 3unxTI+29QH0F6WNzop7rJz1boWKj7QEAc6b4HaV/Dd7NYx0zPkBHjDvCzFqqPTmfAor
 xsUpYumiFVqeXRvL/F8ckV7rZLXqwWxm0vhgvdOjmOyyi7ZS+QxKPzvGzNyWFjcBgjaf
 0NzS7W+VWwMhsuyYdahNOi3RQC01deewwBLdRixfZDlVZgTn0PPo1t553Ck7RAGtOJPE
 quSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EYVqRVBPVhizjxhXnWF45Gz26g8vdQA3COQqWInRBeA=;
 b=XkQlZSn9fiGKZ575jKM4q9K28DpD6IrnWUAs4w8GCmY0cPR+GrqEvLAiDYXLXdDmuQ
 YRapt1NLTpNw4r/o2XHDnfiYv7wKHVhkU67owq8F4K9d7nNETuSI7DKj+DDGhc8huFzC
 PEgRXSHIIE3CIRIdEN3uVjY9jFpbTKDCgHqWAUdUq1DirYKcjFu5jU0rc2uWYFEsjiRa
 sb3QHz9i7uwG8JTDG2Kd5D8GjTWl/9ouIafKM0DF5PpQODEpN7WOJQtUIGiZnPICRom+
 ifS545+BQfQPLkcZpF1AurOgeh3E7HE258imKGudZoQ0TIhvFYODieav7CoitctsLtbJ
 k4Mw==
X-Gm-Message-State: AOAM530FTlGsM2XKVDsTAqF42d2Yi1N9EgaCuiTZq+6jkAL0OArU656V
 ebcL7WNg3tE+9hm8SG6e0uD7gg==
X-Google-Smtp-Source: ABdhPJy05T1NPkkQXB9EoKTWk0BgQA2YbcX/Rl20SMQs0NEdv0PPCLfiCzrohW58ne4IcabfxTDOIA==
X-Received: by 2002:a4a:420d:: with SMTP id h13mr1638857ooj.24.1615517371923; 
 Thu, 11 Mar 2021 18:49:31 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id 64sm1102682otu.80.2021.03.11.18.49.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 18:49:31 -0800 (PST)
Date: Thu, 11 Mar 2021 20:49:29 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/3] drm/bridge: ti-sn65dsi86: Simplify refclk handling
Message-ID: <YErWuSV02RI4Ci1Y@builder.lan>
References: <20210304155144.1.Ic9c04f960190faad5290738b2a35d73661862735@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210304155144.1.Ic9c04f960190faad5290738b2a35d73661862735@changeid>
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
Cc: robdclark@chromium.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu 04 Mar 17:51 CST 2021, Douglas Anderson wrote:

> The clock framework makes it simple to deal with an optional clock.
> You can call clk_get_optional() and if the clock isn't specified it'll
> just return NULL without complaint. It's valid to pass NULL to
> enable/disable/prepare/unprepare. Let's make use of this to simplify
> things a tiny bit.
> 
> NOTE: this makes things look a tad bit asymmetric now since we check
> for NULL before clk_prepare_enable() but not for
> clk_disable_unprepare(). This seemed OK to me. We already have to
> check for NULL in the enable case anyway so why not avoid the extra
> call?
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index f27306c51e4d..942019842ff4 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -1261,14 +1261,9 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
>  		return ret;
>  	}
>  
> -	pdata->refclk = devm_clk_get(pdata->dev, "refclk");
> -	if (IS_ERR(pdata->refclk)) {
> -		ret = PTR_ERR(pdata->refclk);
> -		if (ret == -EPROBE_DEFER)
> -			return ret;
> -		DRM_DEBUG_KMS("refclk not found\n");
> -		pdata->refclk = NULL;
> -	}
> +	pdata->refclk = devm_clk_get_optional(pdata->dev, "refclk");
> +	if (IS_ERR(pdata->refclk))
> +		return PTR_ERR(pdata->refclk);
>  
>  	ret = ti_sn_bridge_parse_dsi_host(pdata);
>  	if (ret)
> -- 
> 2.30.1.766.gb4fecdf3b7-goog
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
