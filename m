Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5A340FCE6
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 17:41:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B72E6EDC8;
	Fri, 17 Sep 2021 15:41:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317806EE2A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 15:41:39 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id a10so18688901qka.12
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 08:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=sD9uOm5tvP8G0xyXDbxUkajObP/tQsvPQSYJ5ZYdDAM=;
 b=Rg3pQPgRu26LSb3Ym25tiFmMLVhLfw9SdEEPoUud66ykQ931PiVOz52pLoXgAwC0ox
 /mHm2+hTiXHgLGuu8t2OWBPxQeOxDuKiW2UWpQCJgV/9B2iyAFVPcdrDxhJyA8LPkxyJ
 OVEGgkK3fO0TjncIvsrXlzuOkF9DG2sCzr1V8nefKneQvr08Iin7PI1M/USyeat1+qSV
 cOlTWgRk5Y/SwKT1Vqv7vzUsbBQS0nxnQuYMU4VQRwxuRpApDeTEvusujkPUACV+t5Rr
 PqWzgleLdsIFdM+KfFpZGV0L6vGeeHDCvPQNK/XrwqX+BsWpcls4hgKiAqKiOlKNQk9K
 vi7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=sD9uOm5tvP8G0xyXDbxUkajObP/tQsvPQSYJ5ZYdDAM=;
 b=sFFEQCvo7FdBE0ngzcsY8bMiSRyKTUzxXjIHnSSgf0mXQ9zoDpXtjlIrgbmxhlKcYY
 on/wXhHwg0v3ZDrG/Hd4mRjQwuNwDZuoMfqEfKVhhrs7D8gHis7blBe08RNUzOanbt49
 5uGbOtOmDnknXZztZYKHsaV61TNjnQ8mbbCeNIQbFcUGIRmx/Z17XnbCFywhVNYTnOhr
 ngZPXox5IXBTyZ0+pJugN3k7clS4sGuZdVjr+okw1tS7VwqqL2pzOen9gQk3GP2EI+HZ
 8LY40nQY3LhwgnZBANgVqeSAvda7/qtf3j9zmshJwGgte7sfiKBBc0H2+2YJFaF6pYmx
 zcuA==
X-Gm-Message-State: AOAM530AprgCmEj/s3ByV1pyPXDi7sTp+PQGJE8cWxAdPrCMOFHZ8fBo
 luPgwLuoWoR+5r6WhYY6vCbb27Hp2LRqpw==
X-Google-Smtp-Source: ABdhPJyjGqSsuJH7awGUj/YMxh1AbnFOYdGXvCtauKtD0RAp5YpZ9/RTGbsIl79Pjc1kmnuFaGBLDw==
X-Received: by 2002:a37:a87:: with SMTP id 129mr3162058qkk.448.1631893298377; 
 Fri, 17 Sep 2021 08:41:38 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id 9sm4122038qtz.83.2021.09.17.08.41.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Sep 2021 08:41:37 -0700 (PDT)
Date: Fri, 17 Sep 2021 11:41:36 -0400
From: Sean Paul <sean@poorly.run>
To: Fernando Ramos <greenfoo@u92.eu>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: Re: [PATCH 09/15] drm/omapdrm: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Message-ID: <20210917154136.GJ2515@art_vandelay>
References: <20210916211552.33490-1-greenfoo@u92.eu>
 <20210916211552.33490-10-greenfoo@u92.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210916211552.33490-10-greenfoo@u92.eu>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Thu, Sep 16, 2021 at 11:15:46PM +0200, Fernando Ramos wrote:
> As requested in Documentation/gpu/todo.rst, replace driver calls to
> drm_modeset_lock_all() with DRM_MODESET_LOCK_ALL_BEGIN() and
> DRM_MODESET_LOCK_ALL_END()
> 
> Signed-off-by: Fernando Ramos <greenfoo@u92.eu>
> ---
>  drivers/gpu/drm/omapdrm/omap_fb.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_fb.c b/drivers/gpu/drm/omapdrm/omap_fb.c
> index 190afc564914..56013c3ef701 100644
> --- a/drivers/gpu/drm/omapdrm/omap_fb.c
> +++ b/drivers/gpu/drm/omapdrm/omap_fb.c
> @@ -62,13 +62,15 @@ static int omap_framebuffer_dirty(struct drm_framebuffer *fb,
>  				  unsigned num_clips)
>  {
>  	struct drm_crtc *crtc;
> +	struct drm_modeset_acquire_ctx ctx;
> +	int ret;
>  
> -	drm_modeset_lock_all(fb->dev);
> +	DRM_MODESET_LOCK_ALL_BEGIN(fb->dev, ctx, 0, ret);
>  
>  	drm_for_each_crtc(crtc, fb->dev)
>  		omap_crtc_flush(crtc);
>  
> -	drm_modeset_unlock_all(fb->dev);
> +	DRM_MODESET_LOCK_ALL_END(fb->dev, ctx, ret);
>  
>  	return 0;

Return ret here, with that,

Reviewed-by: Sean Paul <sean@poorly.run>


>  }
> -- 
> 2.33.0
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
