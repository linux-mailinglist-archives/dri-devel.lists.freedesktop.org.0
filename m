Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3954D1D2FE3
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 14:35:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 106416EB2D;
	Thu, 14 May 2020 12:35:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 146296EB2D
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 12:35:23 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id v12so3795856wrp.12
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 05:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=cMPqMUXRJ8HR36qud+AQIGafh+ptP/rX40+2ncxDmps=;
 b=F6bo7NYBe8KlL8c5Ee5aZ3Fg6TDASmUyQ2bsdJYvKKA5SUkjt3AsX9lByXqMhuh+aC
 1ocMJpC31cdVZNrN3tOfvow84NlAHBcY8fxofiZ/7pZwacMzcJpi/7gkm2Emn4P37tS2
 el5KCGCtum90arsPqhHV8s+udsUfg0+fmG6iU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=cMPqMUXRJ8HR36qud+AQIGafh+ptP/rX40+2ncxDmps=;
 b=DgBHgww4Y0cbhNM8AjCzjNykIPLrX29/nvtUiFFiAMIN1IS8z5mRecx1Dq5bEX25Y0
 mJYoDpz5YzzT5FrdMjiVAyIEoW1v/DGdQ84j30ozUS9sidZlouEjkk69UNbrw/T08LHp
 fVujTpQx0TYWm0xjEF7MxxiWf5YPia5DT+uLq6KpK2M27UWgaBqUL0krvV5E1QCYTwON
 c1z4nrUgWb3/OcnJxU9eErhXGCwKK6JL7uknVDl6qTCbkcsR3uvkXzXwsyONIyIrCZea
 sGKFAoNL9nB10OeQAjICHmsj04+r14orc0hdTFgo2LPvBLqP1W3TtcEZi2QTrsrrayvq
 9l5A==
X-Gm-Message-State: AOAM533TyvhD0pvQwa4n3eLGtfh2SkbHqdvT8UTmLm8HxINb4QknpBV8
 bWTC6uECLrT2N/f2+cFs+IR/25DZclA=
X-Google-Smtp-Source: ABdhPJwmonACH5Sm2rDdGYdlIeF/qAIci3tHAGRz7t2FPWQSo5MIFYNXGt6XqqtCZJDu4Hp1J6/jhA==
X-Received: by 2002:adf:e5cd:: with SMTP id a13mr5369336wrn.266.1589459721770; 
 Thu, 14 May 2020 05:35:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m3sm3804163wrn.96.2020.05.14.05.35.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 05:35:20 -0700 (PDT)
Date: Thu, 14 May 2020 14:35:18 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH] drm/vblank: remove outdated and noisy output
Message-ID: <20200514123518.GS206103@phenom.ffwll.local>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20200513201016.23047-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200513201016.23047-1-wsa+renesas@sang-engineering.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 13, 2020 at 10:10:16PM +0200, Wolfram Sang wrote:
> The R-Car DU driver calls drm_vblank_init via some helper functions in
> probe(). From what I checked, most drivers do this as well. I have a
> config now where DU always stays in deferred_probe state because of a
> missing dependency. This means that every time I rebind another driver
> like MMC, the vblank init message is displayed again when the DU driver
> is retried. Because the message doesn't really carry a useful
> information, I suggest to simply drop it.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Makes sense, queued up in drm-misc-next.
-Daniel

> ---
>  drivers/gpu/drm/drm_vblank.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index da7b0b0c1090..ce9bed24c2da 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -483,8 +483,6 @@ int drm_vblank_init(struct drm_device *dev, unsigned int num_crtcs)
>  		seqlock_init(&vblank->seqlock);
>  	}
>  
> -	DRM_INFO("Supports vblank timestamp caching Rev 2 (21.10.2013).\n");
> -
>  	return 0;
>  
>  err:
> -- 
> 2.20.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
