Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A591A2145
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 14:04:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD336EA44;
	Wed,  8 Apr 2020 12:04:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51F506EA44
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 12:04:49 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id a25so7542831wrd.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Apr 2020 05:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=OBnPwGNSGc7YJF6/MDIm1ZT+7em3pqRoLIRd/7b9PxA=;
 b=OdPalx7xuX4cjKnOHWh9tRuE5bTeRqir5JEhzSbax2+5ltx0Bo82JE5nTq2jKSyUNo
 EnQyjl56VgC34kFmXVjM5F3zPYcSq2VER8j1v36UD8n+FNghQuOZRUpdlfu2ZIuYnOR3
 0QpjV4mQsG1i9Sf/WuB0iVARtp9CBtX+ZYcK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=OBnPwGNSGc7YJF6/MDIm1ZT+7em3pqRoLIRd/7b9PxA=;
 b=txhR2OyjvuNoG5NwR145sG6mAlyJx0+1AAZKjhYleEKy46DvrVWy1W3qZCMp6EIzR+
 gXR7ptcNb5je9LYC8DcwR6mrIokP1nK8RTN3It8U/S2GgM22oiqRgpGDh65sNE2ru2oq
 70PtiK9zaLifLNOy4umcglGcgp/QpMq8z+4iLiuXgDLze/svh0U5tGKTauO3RdaorYmr
 qNt3ysPcVnhQyLptJY2wF3kMWmr+CqzwwnETNhe1VCsYPFJwUJd3E4s5hOBytyLdN2b2
 PXMaLYjW5tw666x7F9CsACkjHo/R6OtWhJ/0JcseJFGjnzwL9H5RevZJPVSuAV94cxVA
 Rb4g==
X-Gm-Message-State: AGi0PuaoEqY4slhPhjTbbGmeXjpfYU/PgTLRHnNYDkvcIjSUK9t+bdYG
 tuoYY+ipvpMNmkS1iNU5W4j6/WoiUkE=
X-Google-Smtp-Source: APiQypJXFUS9vFZ2P9v4AgkbysWA38eTSvtMPkZ8z0bqKgeLMkvmrgrnq8Osd1i+8L1IowleNPNkGQ==
X-Received: by 2002:a5d:4d51:: with SMTP id a17mr8282635wru.317.1586347487880; 
 Wed, 08 Apr 2020 05:04:47 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a67sm6981132wmc.30.2020.04.08.05.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 05:04:46 -0700 (PDT)
Date: Wed, 8 Apr 2020 14:04:44 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 2/3] gpu/drm: ingenic: Switch emulated fbdev to 16bpp
Message-ID: <20200408120444.GJ3456981@phenom.ffwll.local>
Mail-Followup-To: Paul Cercueil <paul@crapouillou.net>,
 David Airlie <airlied@linux.ie>, od@zcrc.me,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20200226043041.289764-1-paul@crapouillou.net>
 <20200226043041.289764-2-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200226043041.289764-2-paul@crapouillou.net>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: David Airlie <airlied@linux.ie>, od@zcrc.me,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 26, 2020 at 01:30:40AM -0300, Paul Cercueil wrote:
> The fbdev emulation is only ever used on Ingenic SoCs to run old SDL1
> based games at 16bpp (rgb565). Recent applications generally talk to
> DRM directly, and can request their favourite pixel format; so we can
> make everybody happy by switching the emulated fbdev to 16bpp.
> 
> v2: No change
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/gpu/drm/ingenic/ingenic-drm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c b/drivers/gpu/drm/ingenic/ingenic-drm.c
> index 5493a80d7d2f..3f8cc98d41fe 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
> @@ -807,7 +807,7 @@ static int ingenic_drm_probe(struct platform_device *pdev)
>  		goto err_devclk_disable;
>  	}
>  
> -	ret = drm_fbdev_generic_setup(drm, 32);
> +	ret = drm_fbdev_generic_setup(drm, 16);

This will conflict with Thomas' work to remove the error code, so might
need a rebase. Now for the patch itself your supposed to set
drm_device->mode_config.preferred_bpp and leave this here as 0. That way
userspace can also know what's the best option.

Maybe in the future we could auto-compute the preferred_bpp from just
taking the first format of the first primary plane, but atm not there.

With the above change:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>  	if (ret)
>  		dev_warn(dev, "Unable to start fbdev emulation: %i", ret);
>  
> -- 
> 2.25.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
