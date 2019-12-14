Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A33C11EF01
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 01:07:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 732AB6EE23;
	Sat, 14 Dec 2019 00:07:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C91B6EE23
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Dec 2019 00:07:43 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id y11so561797wrt.6
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 16:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=geIx/nWQ0BpqVGVQsVk8KzxkfCCv3NpUyxjodfVFmZc=;
 b=FE+LH7VGWD2YVnwVryc8AR/nUGMxZvoq5poiP1yIRfG/jwEEV8Lu4LmBbRXf7o8H2U
 RkoXCnPbo7CxnwZUca1iBsJGPp999jHsgOVDhAuQr+gcH/xf6a4QyTBvCsx6VZ2lb+Oo
 dlfw7jlyAuMoQfz0wzDD/M+5nZeE/AN2w7yQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=geIx/nWQ0BpqVGVQsVk8KzxkfCCv3NpUyxjodfVFmZc=;
 b=PbLVp30jIeDzs3VHeC36QBd9v0U0QZbWQuubRMgNrmLPmClPPv7ryVejOAsK2hGCTF
 DCHiwszcCDeR/q4xC63KeJlfOklC+Fy/Q+zIF2XLkMo42KshisKRtkZGEyNs+JCt9+nY
 36lZA8x5hkW2Q3O3qWW8Rc1VHl6Sd2WkWlZzwuME5X1zybq12SDwfVfkxCrlPw5N1buD
 1/lTOuzY0Mp0uu8fdzCKlkggyvoJ76kfizxuagNEXlorgMWgWxNtiRim5RBxDvY3QNH/
 Bqd0437BpDZ7FQSIgyHP73CdiG39Xvw+6rrj9h+eA8bpTq4D9SG+bn4bnl6LSyH+aOXO
 tKMw==
X-Gm-Message-State: APjAAAVC0kYMovMeGEFSexTPp7P7Tr9p2p/UM4l1PRIQS/UQmXBuw1eP
 jNNbHn8A37YnumcYFbrAYr/P0g==
X-Google-Smtp-Source: APXvYqwxYCWfJRRSj199aMaUgb0YJevPf0BbXzzQoVl+o2Z1ZWFUB4UHGK3BMt+ufjNs8HxlASLylw==
X-Received: by 2002:a5d:5403:: with SMTP id g3mr15468210wrv.302.1576282061890; 
 Fri, 13 Dec 2019 16:07:41 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id s10sm11760046wrw.12.2019.12.13.16.07.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 16:07:41 -0800 (PST)
Date: Sat, 14 Dec 2019 01:07:38 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH 9/9] drm/bridge: ti-sn65dsi86: Skip non-standard DP rates
Message-ID: <20191214000738.GP624164@phenom.ffwll.local>
Mail-Followup-To: Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, robdclark@chromium.org,
 linux-arm-msm@vger.kernel.org, seanpaul@chromium.org,
 bjorn.andersson@linaro.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
References: <20191213234530.145963-1-dianders@chromium.org>
 <20191213154448.9.I1791f91dd22894da04f86699a7507d101d4385bc@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191213154448.9.I1791f91dd22894da04f86699a7507d101d4385bc@changeid>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
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
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, seanpaul@chromium.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 13, 2019 at 03:45:30PM -0800, Douglas Anderson wrote:
> The bridge chip supports these DP rates according to TI's spec:
> * 1.62 Gbps (RBR)
> * 2.16 Gbps
> * 2.43 Gbps
> * 2.7 Gbps (HBR)
> * 3.24 Gbps
> * 4.32 Gbps
> * 5.4 Gbps (HBR2)
> 
> As far as I can tell, only RBR, HBR, and HBR2 are part of the DP spec.
> If other rates work then I believe it's because the sink has allowed
> bending the spec a little bit.

I think you need to look at the eDP spec. And filter this stuff correctly
(there's more fields there for these somewhat irky edp timings). Simply
not using them works, but it's defeating the point of having these
intermediate clocks for edp panels.
-Daniel

> 
> I hoped that we could tell which rates would work and which rates
> didn't work based on whether link training passed or not.
> Unfortunately this wasn't so good on at least one panel hooked up to
> the bridge (AUO B116XAK01).  On that panel with 24 bpp configured:
> * 1.62: too small for 69500 kHz at 24 bpp
> * 2.16: link training failed
> * 2.43: link training passed, but garbage on screen
> * 2.7:  joy and happiness
> 
> Let's bypass all non-standard rates, which makes this panel happy
> working.  I'll still keep the code organized in such a way where it
> _could_ try the other rates, though, on the assumption that eventually
> someone will find a way to make use of them.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index cc8bef172f69..cb774ee536cd 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -454,6 +454,15 @@ static const unsigned int ti_sn_bridge_dp_rate_lut[] = {
>  	0, 1620, 2160, 2430, 2700, 3240, 4320, 5400
>  };
>  
> +/**
> + * A table indicating which of the rates in ti_sn_bridge_dp_rate_lut
> + * is as per the DP spec (AKA a standard) as opposed to an intermediate
> + * rate.
> + */
> +static const bool ti_sn_bridge_dp_rate_standard[] = {
> +	false, true, false, false, true, false, false, true
> +};
> +
>  static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn_bridge *pdata)
>  {
>  	unsigned int bit_rate_khz, dp_rate_mhz;
> @@ -660,6 +669,18 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
>  	for (dp_rate_idx = ti_sn_bridge_calc_min_dp_rate_idx(pdata);
>  	     dp_rate_idx <= max_dp_rate_idx;
>  	     dp_rate_idx++) {
> +		/*
> +		 * To be on the safe side, we'll skip all non-standard
> +		 * rates and move up to the next standard one.  This is
> +		 * because some panels will pass link training with a non-
> +		 * standard rate but just show garbage.  If the non-standard
> +		 * rates are useful we should figure out how to enable them
> +		 * through querying the panel, having a per-panel whitelist,
> +		 * or adding a DT property.
> +		 */
> +		if (!ti_sn_bridge_dp_rate_standard[dp_rate_idx])
> +			continue;
> +
>  		ret = ti_sn_link_training(pdata, dp_rate_idx, &last_err_str);
>  		if (!ret)
>  			break;
> -- 
> 2.24.1.735.g03f4e72817-goog
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
