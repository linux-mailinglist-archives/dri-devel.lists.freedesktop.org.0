Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C0029A7EF
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 10:34:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 771CD6E08C;
	Tue, 27 Oct 2020 09:33:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C1466E08C
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 09:33:55 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id g12so1039305wrp.10
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 02:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ub2OQ9S7t1kcBGYAcEMMt+aJ2+YepKfrmcjGDAX1O4g=;
 b=IVxeO6Vr9iH8EoAazuEDyvS4Qnu8Qz5nbl4rDuw5V1brxHiOyXx6id5gwEh5ZNDrwP
 Z+RallfzodY5UGkcDM5QsYTqT0RZskyAf+6S0BPuPpXz5GA62KzuTs0QCOmdxGHAaASA
 +i5SgBFaQLJWfVtCh9ZgL/Ncr8LJ6Q6wImPYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=Ub2OQ9S7t1kcBGYAcEMMt+aJ2+YepKfrmcjGDAX1O4g=;
 b=SPS8S3DFpkwAYRn/MAnxokO09E3Bg4DD3CBRleFl3z36HXbbFe49ATRdxi26tnICjI
 2gROOgdEjQ/67GejOtaX6wxlj3DEn/nKI331lgovQb00VxwimI47iADch4P4eb7W6t5N
 Z0F/i+jqw9FvKMU6boftp66Tcubo9A/hOmNtkKEClvNPbOoVQWIX2S6PuB0dFXEFbRlM
 bTjS3GMViFapo//xXkG016YoV+LBgC2C9QZAfOdzPIBToaB8hg1Sd/NU6Vg7XPtHR812
 fnHGEuhnpEtgpVnQweoPs0qf3H5QYXutBIEpAvw9gtJpjPAxizanDUUY9RAX8XePYMst
 Y3sA==
X-Gm-Message-State: AOAM530Wx/kKZ95ZFefPu3a6R5kHUXJ/xTCD+v68jIlrYkZ6dmekWdJ2
 YZqY7pIDtwmZRTn4+JEPWMVjzg==
X-Google-Smtp-Source: ABdhPJxgfnIDYgOvbEbTrCnvCeptzJB/xcXyPJfOrqGWQibdGcD2ePVfDRbdpz8P+44fRAsO2M4ynQ==
X-Received: by 2002:a5d:6a86:: with SMTP id s6mr1726334wru.344.1603791234191; 
 Tue, 27 Oct 2020 02:33:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b5sm1218224wrs.97.2020.10.27.02.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 02:33:53 -0700 (PDT)
Date: Tue, 27 Oct 2020 10:33:50 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 4/4] drm/gma500: avoid Woverride-init warning
Message-ID: <20201027093350.GI401619@phenom.ffwll.local>
Mail-Followup-To: Arnd Bergmann <arnd@kernel.org>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 David Airlie <airlied@linux.ie>,
 Stefan Christ <contact@stefanchrist.eu>,
 Arnd Bergmann <arnd@arndb.de>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Emil Velikov <emil.velikov@collabora.com>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20201026194110.3817470-1-arnd@kernel.org>
 <20201026194110.3817470-4-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201026194110.3817470-4-arnd@kernel.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Stefan Christ <contact@stefanchrist.eu>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 26, 2020 at 08:41:04PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> gcc -Wextra notices that one of the fields in psbfb_roll_ops has two
> initializers:
> 
> drivers/gpu/drm/gma500/framebuffer.c:185:20: warning: initialized field overwritten [-Woverride-init]
> 
> Open-code this instead, leaving out the extraneous initializers for
> .fb_pan_display.
> 
> Fixes: 3da6c2f3b730 ("drm/gma500: use DRM_FB_HELPER_DEFAULT_OPS for fb_ops")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Scrollback is dead, so I'm not sure it's even worth to keep all this. I'd
just garbage-collect this, maybe als the entire accelerator code and just
leave psbfb_unaccel_ops behind ...
-Daniel

> ---
>  drivers/gpu/drm/gma500/framebuffer.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/gma500/framebuffer.c b/drivers/gpu/drm/gma500/framebuffer.c
> index 54d9876b5305..a56a6b53fac6 100644
> --- a/drivers/gpu/drm/gma500/framebuffer.c
> +++ b/drivers/gpu/drm/gma500/framebuffer.c
> @@ -177,7 +177,14 @@ static const struct fb_ops psbfb_ops = {
>  
>  static const struct fb_ops psbfb_roll_ops = {
>  	.owner = THIS_MODULE,
> -	DRM_FB_HELPER_DEFAULT_OPS,
> +	.fb_check_var = drm_fb_helper_check_var,
> +	.fb_set_par = drm_fb_helper_set_par,
> +	.fb_setcmap = drm_fb_helper_setcmap,
> +	.fb_blank = drm_fb_helper_blank,
> +	.fb_debug_enter = drm_fb_helper_debug_enter,
> +	.fb_debug_leave = drm_fb_helper_debug_leave,
> +	.fb_ioctl = drm_fb_helper_ioctl,
> +
>  	.fb_setcolreg = psbfb_setcolreg,
>  	.fb_fillrect = drm_fb_helper_cfb_fillrect,
>  	.fb_copyarea = drm_fb_helper_cfb_copyarea,
> -- 
> 2.27.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
