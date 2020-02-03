Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FB81516CD
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2020 09:08:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F4D06EDEC;
	Tue,  4 Feb 2020 08:08:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D71B86E069
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2020 23:32:20 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id g6so6466619plt.2
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2020 15:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=bjBRbkXuM7e+Yrzus99X2qOeClLGUq0mOk80jUroNTQ=;
 b=f11sHAV3jAvM1bXJOrw/YZciwLMyi3wr8lABIITSLW+QDro1s9kpixO7CW7BE4GVsX
 BVISOC4A3wqtR0ig3nCNQwxS1bCKCdK0Fyk34s/E4BgKiInBGxLTgJeTqoywVTIB/OLR
 RxrphSseNxUG25/4OUfed2Boef5lf+FvaHdvRkgksQwDCAfwUtz0LOwKQLI9xdMIry5F
 pwn2wIL5N2oiL18XRU0V0q6dK/U/owXMNzyy6YbGGSxhQbnPqOb9pVCGJHd5Y6wnlrTI
 Y5UTeiANrjyKMFfce3YrKcKCtSRNC4XS6KBwuswld7HIA1RRWLjiDVG33Yve1wH26Ib9
 jT6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bjBRbkXuM7e+Yrzus99X2qOeClLGUq0mOk80jUroNTQ=;
 b=KAscWkS8luQ2uLEcSkJ02v4pgloE/hQ7nnicCZCSdeKv+a0txYEBU/lfxzLrFq8gtM
 d7OZBlqySewry5PDLL/tNxBaxlIi6+n1+d4qGFGonWzxxfrTwNgk1fd4C3dNfb/dkTDI
 TKDKXZd4UM9mRRBfCuBpoSr57b+UICGOhA2keyOJRnw4z2xJN6FtxFG+OZNQbJw7Or0Q
 AqfNfgBSd/gykqyY8k/UtrFKkoAR/Kv9zEeqFgq+uhxnibu1y0DYs1K/bKDDGHyK9HPz
 Bd/1aJj9P7IErMAng7d3Uz0SUV4SXBxzHdX3mlRa85x2JLVAGWuX/7IsHfm5Q0APCEbu
 0wAA==
X-Gm-Message-State: APjAAAXFhJ6BjATpWLzxQnQZ+9xMCeJUmqX1RACb6kahwdpItkgTiU/l
 kK/5Zl6SVGrHsIPzamO9ffT7Bw==
X-Google-Smtp-Source: APXvYqzQD/Xl43wlQXkOagtDcoO4afR50u0nYFhmCaIdIGafU52lJE7MBsFBXcyYsNMf6Wtyriy2iw==
X-Received: by 2002:a17:902:bd88:: with SMTP id
 q8mr24818096pls.13.1580772740218; 
 Mon, 03 Feb 2020 15:32:20 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id e2sm536341pjs.25.2020.02.03.15.32.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 15:32:19 -0800 (PST)
Date: Mon, 3 Feb 2020 15:32:17 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 2/9] drm/bridge: ti-sn65dsi86: zero is never greater
 than an unsigned int
Message-ID: <20200203233217.GB311651@builder>
References: <20191218223530.253106-1-dianders@chromium.org>
 <20191218143416.v3.2.Id445d0057bedcb0a190009e0706e9254c2fd48eb@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191218143416.v3.2.Id445d0057bedcb0a190009e0706e9254c2fd48eb@changeid>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Tue, 04 Feb 2020 08:08:21 +0000
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
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, seanpaul@chromium.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed 18 Dec 14:35 PST 2019, Douglas Anderson wrote:

> When we iterate over ti_sn_bridge_dp_rate_lut, there's no reason to
> start at index 0 which always contains the value 0.  0 is not a valid
> link rate.
> 
> This change should have no real effect but is a small cleanup.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Tested-by: Rob Clark <robdclark@gmail.com>
> Reviewed-by: Rob Clark <robdclark@gmail.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
> 
> Changes in v3: None
> Changes in v2: None
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 2fb9370a76e6..7b596af265e4 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -458,7 +458,7 @@ static void ti_sn_bridge_set_dp_rate(struct ti_sn_bridge *pdata)
>  	/* set DP data rate */
>  	dp_rate_mhz = ((bit_rate_mhz / pdata->dsi->lanes) * DP_CLK_FUDGE_NUM) /
>  							DP_CLK_FUDGE_DEN;
> -	for (i = 0; i < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut) - 1; i++)
> +	for (i = 1; i < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut) - 1; i++)
>  		if (ti_sn_bridge_dp_rate_lut[i] > dp_rate_mhz)
>  			break;
>  
> -- 
> 2.24.1.735.g03f4e72817-goog
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
