Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B93C71516C7
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2020 09:08:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD856EDDF;
	Tue,  4 Feb 2020 08:08:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 331A26ED6A
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2020 23:45:13 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id fa20so506649pjb.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2020 15:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=G6Bxx9TbIG0iY9oRVMNU9c056800TubVW/1xZmxYimU=;
 b=BS2opUho7qkDJYHP42XaqdEJFYhNQcO6Ijt3iC3262X2h0sS7oHTZDGcTL9gurt+Tx
 1FUoMi3Em+Mlx04ikIRH2PtuMrayXZNUcYuY0VRxb32QixT6yOzYhP2LL+1KwsYZfyZA
 mpFHLliKcZAohbuIhHVYk4RKmMNSUGDKZsl3IUAnTEB9b4g4K/JiYNMUljIQq1e8Zlxd
 vsAVojJsK6FBXa9e+gAJrIXlX9CjlBUPEGecZg7pgfOS/R1XsUIoFcl5l/ptEIy5XQjR
 mo8wJp+g9+puNFeSBZiOLSO7Yj0Gif/NBFvoUWLO1KACtvDjxqsnW8x/gJyTZ6ozpOea
 iDfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=G6Bxx9TbIG0iY9oRVMNU9c056800TubVW/1xZmxYimU=;
 b=T+zZXygGYJbr69/HXLVDcB8d3k1BcbxZspYNIbgroSsyIKGZhw1f+tD21h0WfEhPau
 K4KMBH9oprzJbOI/2wmVsupJtiXuoVKCmeImTQF11Bf57fEFDeeg3AZwLbhsd5ohSp+1
 xVfrIytW4flGQggiwgaXSQ0b85v3oE9kJMS2MlSAkXbH2RphXGtTCzqr6Gy/Z6IcYR2F
 f+Pm07wK6T6vF4C243lbYIyipr11vRCabKxibFYao92WCDFyLfr0pA/k11cTECQYSjhx
 AXuRMhSpQxLm9ZtOVqUY6odyNB+x9fuQ1LJ8a81XuOHfEGvQiWUjTBYYZlSWxmXu71kW
 x3Gw==
X-Gm-Message-State: APjAAAW0Oy5myFPpWMMXY3SYAYoiRQ/Vy1a8V6+i+YfZgYefdkkAsguG
 ntY/qlbbdaJ9psiDOba5dcShZQ==
X-Google-Smtp-Source: APXvYqzR84D/Z5QnedxPsJ3+pJD7lDPLfohlOhX1hEdzsbf14l56KWV6lClbPw6RDzHJOgIpOYwHQQ==
X-Received: by 2002:a17:902:a711:: with SMTP id
 w17mr8133895plq.152.1580773512589; 
 Mon, 03 Feb 2020 15:45:12 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id m12sm21180648pfh.37.2020.02.03.15.45.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 15:45:11 -0800 (PST)
Date: Mon, 3 Feb 2020 15:45:09 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 0/9] drm/bridge: ti-sn65dsi86: Improve support for AUO
 B116XAK01 + other DP
Message-ID: <20200203234509.GJ311651@builder>
References: <20191218223530.253106-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191218223530.253106-1-dianders@chromium.org>
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
 Andrzej Hajda <a.hajda@samsung.com>, Jonas Karlman <jonas@kwiboo.se>,
 seanpaul@chromium.org, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed 18 Dec 14:35 PST 2019, Douglas Anderson wrote:

> This series contains a pile of patches that was created to support
> hooking up the AUO B116XAK01 panel to the eDP side of the bridge.  In
> general it should be useful for hooking up a wider variety of DP
> panels to the bridge, especially those with lower resolution and lower
> bits per pixel.
> 
> The overall result of this series:
> * Allows panels with fewer than 4 DP lanes hooked up to work.
> * Optimizes the link rate for panels with 6 bpp.
> * Supports trying more than one link rate when training if the main
>   link rate didn't work.
> * Avoids invalid link rates.
> 
> It's not expected that this series will break any existing users but
> testing is always good.
> 
> To support the AUO B116XAK01, we could actually stop at the ("Use
> 18-bit DP if we can") patch since that causes the panel to run at a
> link rate of 1.62 which works.  The patches to try more than one link
> rate were all developed prior to realizing that I could just use
> 18-bit mode and were validated with that patch reverted.
> 
> These patches were tested on sdm845-cheza atop mainline as of
> 2019-12-13 and also on another board (the one with AUO B116XAK01) atop
> a downstream kernel tree.
> 
> This patch series doesn't do anything to optimize the MIPI link and
> only focuses on the DP link.  For instance, it's left as an exercise
> to the reader to see if we can use the 666-packed mode on the MIPI
> link and save some power (because we could lower the clock rate).
> 
> I am nowhere near a display expert and my knowledge of DP and MIPI is
> pretty much zero.  If something about this patch series smells wrong,
> it probably is.  Please let know and I'll try to fix it.
> 

Thanks for the patches Doug, this fixes the rate and DP lane-count
issues I'm seeing on my Lenovo Yoga C630 with the current
implementation.

Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Changes in v3:
> - Init rate_valid table, don't rely on stack being 0 (oops).
> - Rename rate_times_200khz to rate_per_200khz.
> - Loop over the ti_sn_bridge_dp_rate_lut table, making code smaller.
> - Use 'true' instead of 1 for bools.
> - Added note to commit message noting DP 1.4+ isn't well tested.
> 
> Changes in v2:
> - Squash in maybe-uninitialized fix from Rob Clark.
> - Patch ("Avoid invalid rates") replaces ("Skip non-standard DP rates")
> 
> Douglas Anderson (9):
>   drm/bridge: ti-sn65dsi86: Split the setting of the dp and dsi rates
>   drm/bridge: ti-sn65dsi86: zero is never greater than an unsigned int
>   drm/bridge: ti-sn65dsi86: Don't use MIPI variables for DP link
>   drm/bridge: ti-sn65dsi86: Config number of DP lanes Mo' Betta
>   drm/bridge: ti-sn65dsi86: Read num lanes from the DP sink
>   drm/bridge: ti-sn65dsi86: Use 18-bit DP if we can
>   drm/bridge: ti-sn65dsi86: Group DP link training bits in a function
>   drm/bridge: ti-sn65dsi86: Train at faster rates if slower ones fail
>   drm/bridge: ti-sn65dsi86: Avoid invalid rates
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 259 +++++++++++++++++++++-----
>  1 file changed, 216 insertions(+), 43 deletions(-)
> 
> -- 
> 2.24.1.735.g03f4e72817-goog
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
