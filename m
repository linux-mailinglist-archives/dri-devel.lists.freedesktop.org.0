Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A57240638
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 14:54:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E79389D5F;
	Mon, 10 Aug 2020 12:54:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1134189D5F
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 12:54:36 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id p14so7540412wmg.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 05:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cXVCpCKL1uVayGvSllxex0eEWdulD9bwteh1DZcTZto=;
 b=UzLubG1tdjeoLrdGIZBztK+3GoP57kb01xgGm3CJ5WrvYKjtdh4vhai1TiMxSkwZfn
 hVZrxJo5GuoxhML6zMbgQJci/811kz6BtzwzUQVl+oKa1xTpy1M87Em6DHFUYLs3nPEK
 52pQzZ3Ieum4HTvS9JDmxQ+FipcbDfliiQLBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cXVCpCKL1uVayGvSllxex0eEWdulD9bwteh1DZcTZto=;
 b=ozE7ZWx2yPow1xqplSUjsbV4EuX8hwjphUPX522p2iPH2agfRo5Tb6vcJkkwign53G
 0Hbf3GdbyVCjmcdU6eRtxrgg47sDgF744gnT6w/Q1gPUAdbZgr4PpnceeX+eF+GN5+9M
 iTg0D938QOmQshlPxYywc40C0Ad99zIAnmC0iJak2u4iH2I114z18RHwTfAZj3MOYBtu
 7br7nfNKp52wl5CYHWzbESfU7eKpgHg9IddOdcd2/fnsF1I61r4uG+SRRBonruj9LGq0
 MwTiuM6qJa0UkmoWwtkJsQSLtN1453D+irpOr2dtk4N+PFhagX+L1Z54BA82Hs49dY6D
 X11g==
X-Gm-Message-State: AOAM533nqPGIQ5sk3+XM4mDWTi6dZhaoOcVH+UvhMxAIpFXjGD7w0flR
 Wj/EMSHbIdlsimvAj2pBtzbjRA==
X-Google-Smtp-Source: ABdhPJyJ5iP4BDvwpQsrlcyLzcIQ2eEsEN0ODuRTN9GYnktroYc0WwFSy4kmSFBrt2x8GBlbWj+MuA==
X-Received: by 2002:a05:600c:410b:: with SMTP id
 j11mr26322527wmi.38.1597064074672; 
 Mon, 10 Aug 2020 05:54:34 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 62sm21511525wrq.31.2020.08.10.05.54.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 05:54:33 -0700 (PDT)
Date: Mon, 10 Aug 2020 14:54:32 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/4 v2] drm/mcde: Improve pixel fetcher FIFO depth setting
Message-ID: <20200810125432.GP2352366@phenom.ffwll.local>
References: <20200808223122.1492124-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200808223122.1492124-1-linus.walleij@linaro.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Stephan Gerhold <stephan@gerhold.net>, newbytee@protonmail.com,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Aug 09, 2020 at 12:31:19AM +0200, Linus Walleij wrote:
> The pixel fetcher FIFO depth was just hardcoded to 48
> which works fine as long as the framebuffer is 32BPP
> and the DSI output is RGB888.
> 
> We will need more elaborate handling for some buffer
> formats and displays, so start to improve this function
> by setting reasonable defaults for 32, 24 and 16 BPP
> framebuffers.
> 
> Cc: newbytee@protonmail.com
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpu/drm/mcde/mcde_display.c | 34 +++++++++++++++++++++++++----
>  1 file changed, 30 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/mcde_display.c
> index cac660ac8803..cbc7c0c4955a 100644
> --- a/drivers/gpu/drm/mcde/mcde_display.c
> +++ b/drivers/gpu/drm/mcde/mcde_display.c
> @@ -333,7 +333,7 @@ static void mcde_configure_overlay(struct mcde *mcde, enum mcde_overlay ovl,
>  				   enum mcde_extsrc src,
>  				   enum mcde_channel ch,
>  				   const struct drm_display_mode *mode,
> -				   u32 format)
> +				   u32 format, int cpp)

Note that format->cpp is a bit outdated, since it doesn't work for planar
stuff. But I guess not a problem for you (for now at least). Blocky
formats like yuv don't set format->cpp, or at least not in the way you'd
expect.

Anyway now idea on the hw, but patch looks reasonable.

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  {
>  	u32 val;
>  	u32 conf1;
> @@ -342,6 +342,7 @@ static void mcde_configure_overlay(struct mcde *mcde, enum mcde_overlay ovl,
>  	u32 ljinc;
>  	u32 cr;
>  	u32 comp;
> +	u32 pixel_fetcher_watermark;
>  
>  	switch (ovl) {
>  	case MCDE_OVERLAY_0:
> @@ -426,8 +427,33 @@ static void mcde_configure_overlay(struct mcde *mcde, enum mcde_overlay ovl,
>  			format);
>  		break;
>  	}
> -	/* The default watermark level for overlay 0 is 48 */
> -	val |= 48 << MCDE_OVLXCONF2_PIXELFETCHERWATERMARKLEVEL_SHIFT;
> +
> +	/*
> +	 * Pixel fetch watermark level is max 0x1FFF pixels.
> +	 * Two basic rules should be followed:
> +	 * 1. The value should be at least 256 bits.
> +	 * 2. The sum of all active overlays pixelfetch watermark level
> +	 *    multiplied with bits per pixel, should be lower than the
> +	 *    size of input_fifo_size in bits.
> +	 * 3. The value should be a multiple of a line (256 bits).
> +	 */
> +	switch (cpp) {
> +	case 2:
> +		pixel_fetcher_watermark = 128;
> +		break;
> +	case 3:
> +		pixel_fetcher_watermark = 96;
> +		break;
> +	case 4:
> +		pixel_fetcher_watermark = 48;
> +		break;
> +	default:
> +		pixel_fetcher_watermark = 48;
> +		break;
> +	}
> +	dev_dbg(mcde->dev, "pixel fetcher watermark level %d pixels\n",
> +		pixel_fetcher_watermark);
> +	val |= pixel_fetcher_watermark << MCDE_OVLXCONF2_PIXELFETCHERWATERMARKLEVEL_SHIFT;
>  	writel(val, mcde->regs + conf2);
>  
>  	/* Number of bytes to fetch per line */
> @@ -932,7 +958,7 @@ static void mcde_display_enable(struct drm_simple_display_pipe *pipe,
>  	 * channel 0
>  	 */
>  	mcde_configure_overlay(mcde, MCDE_OVERLAY_0, MCDE_EXTSRC_0,
> -			       MCDE_CHANNEL_0, mode, format);
> +			       MCDE_CHANNEL_0, mode, format, cpp);
>  
>  	/*
>  	 * Configure pixel-per-line and line-per-frame for channel 0 and then
> -- 
> 2.26.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
