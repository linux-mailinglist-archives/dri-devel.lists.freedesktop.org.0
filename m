Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D5C1516C9
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2020 09:08:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A826EDE1;
	Tue,  4 Feb 2020 08:08:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28B886E069
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2020 23:34:25 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id b9so8657898pgk.12
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2020 15:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=CRRDli79xE8LIu9zwaoq3HKVinZzj5LHxKyaS7ghdP8=;
 b=YouvTwznNYnoG+2f/OterSj77UFSEOFMw8fwMy4fgu8UlXX9NqGegRgyVlR03x50We
 FP/q0O3sHzgvntfxYyBg/ek2TGSmWxioJoesvHnkq0JKFn00Lwb3xrAF1Um74dcW0EgL
 wOwMYY/JFtoFnGQSVcOLgbGm66oB1jSHBDf9+DgaIuNbwSJuRWuBex24sA2ynzcZsKds
 WZ9TknN93NjOzLZ5XZt/wf89dPpK/aO0ZgHtt/Q9hk+eYNtt3qX3moG3v9YoDr4+Yv3E
 4fCoq9dbluTJDPuy/V7jfA332en3wkv7YA7UDdhKS4BxIYH8paUvjBRRIPsJX1rYy8Pq
 2mbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CRRDli79xE8LIu9zwaoq3HKVinZzj5LHxKyaS7ghdP8=;
 b=YqVGvormqIDBdOpXCEcqifcUo8RlFCh4KKoZk6QXWjbzC4GJqe2VApRoQuhJcSHPCd
 zU6jwwuGon6nU9O9mjxVbKPW7tOc9PPDEwGzbCGJzmr11Zx1c06Wi/RUtbL4WdrtV/7c
 wti46wVIIETPZnk7hDNYnvfCREhn5tpSSbSc1kwsfKXKt350NtuwMHXLUwy9XBimDYKl
 TpbcDpkZhb3x/JcXUvlMTvOYLsWKsw1GNlFgCNoxGUN6TkBKSwCKtPisQjbKgUL+mtU1
 Egw7dyLKnTNSG3xOmzlBAwTDjoFzP5Dh2K8aoRgj4SKYhgqVB0BpNIqheCMUqv/ZOlYO
 /Uyg==
X-Gm-Message-State: APjAAAXhsU0PY608e3q634e0Ik72FUsXx+VL/J5IUq2vUiGP/3qWVn93
 PjBKZJSK1SedsPKOA2TogXgGyg==
X-Google-Smtp-Source: APXvYqyD0yQtMSMVUy8QHav9nE32wkPgiPb4hwzH5mtiPqE1/LxdbmKtFgTTIVfpCqxgSMNoTDmxCw==
X-Received: by 2002:aa7:9f5e:: with SMTP id h30mr3472249pfr.137.1580772864660; 
 Mon, 03 Feb 2020 15:34:24 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id w131sm22329038pfc.16.2020.02.03.15.34.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 15:34:24 -0800 (PST)
Date: Mon, 3 Feb 2020 15:34:21 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 4/9] drm/bridge: ti-sn65dsi86: Config number of DP
 lanes Mo' Betta
Message-ID: <20200203233421.GD311651@builder>
References: <20191218223530.253106-1-dianders@chromium.org>
 <20191218143416.v3.4.If3e2d0493e7b6e8b510ea90d8724ff760379b3ba@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191218143416.v3.4.If3e2d0493e7b6e8b510ea90d8724ff760379b3ba@changeid>
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

> The driver used to say that the value to program into bridge register
> 0x93 was dp_lanes - 1.  Looking at the datasheet for the bridge, this
> is wrong.  The data sheet says:
> * 1 = 1 lane
> * 2 = 2 lanes
> * 3 = 4 lanes
> 
> A more proper way to express this encoding is min(dp_lanes, 3).
> 
> At the moment this change has zero effect because we've hardcoded the
> number of DP lanes to 4.  ...and (4 - 1) == min(4, 3).  How fortunate!
> ...but soon we'll stop hardcoding the number of lanes.
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
> index ab644baaf90c..d55d19759796 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -523,7 +523,7 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
>  			   CHA_DSI_LANES_MASK, val);
>  
>  	/* DP lane config */
> -	val = DP_NUM_LANES(pdata->dp_lanes - 1);
> +	val = DP_NUM_LANES(min(pdata->dp_lanes, 3));
>  	regmap_update_bits(pdata->regmap, SN_SSC_CONFIG_REG, DP_NUM_LANES_MASK,
>  			   val);
>  
> -- 
> 2.24.1.735.g03f4e72817-goog
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
