Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE29E22EA2D
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 12:40:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E117289D58;
	Mon, 27 Jul 2020 10:40:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF3389D58
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 10:40:47 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 3so7313715wmi.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 03:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QAGkxy7zDHqwfq3HR6Ep0RxFMMTvIif5jJbN4T7u8T0=;
 b=CW/VPSXTsqGNsByyHKn5qQLkyJKMqZTfdy0I6FAc8bU6LUVU67IHuEJDrKqTj7FJJ2
 Nud4pYYKQSJevTynBSKaPkQ9Gyap8A/u5Bi+29WdBj/6ezoBguSPMrH5HIsWrlEwLQA6
 YR0aYMiWWjCQQfpyenXbDy0yobOQM6ifeARnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QAGkxy7zDHqwfq3HR6Ep0RxFMMTvIif5jJbN4T7u8T0=;
 b=aMFbOlwjOuBE8gGxOuLBH73q/mbWZWpoqCy2X2GLapQGPQlmGQKXcClwIZ2iYj77SG
 c/92Mea2YOyc9yjBXi4oFBrx9bujB2q83uATepOpLk/oDqsLPkGfTPmTarn/T7HfonKB
 zz+g1Kk2N+KCquGvetcakR9Gavy7pFAOjOuUDCK7eFDCRbcI3w2VMoUDB8WR06ktD0cG
 lDEg9ocjZeuFdNxbC3gKapAh+/kGBm8Z7DDagGwvC4LFaltBJRIzMJLF4Zi6s1P5bx0E
 VlOI6O3c21JWDDsEC1HpKcb3Ql0jQFTmcsdK15kjFVg8kkDmYoRvGZI+2uIoDoiC4JMi
 zwJA==
X-Gm-Message-State: AOAM532WNqtLWbsntXmAP4WlF3KefiA4CVo21YkSQKOMjsiZeYx4eaoX
 NIzI2D1N5MTyWI7Few+lg9//xg==
X-Google-Smtp-Source: ABdhPJw+X1md0G79Cgzmhg5XANVN1gR3Nxk/a+aOwWwjQ1jzk31BJ1RUZQgLagH67Ncu9SKX0MVyEA==
X-Received: by 2002:a7b:ce04:: with SMTP id m4mr19528565wmc.1.1595846446333;
 Mon, 27 Jul 2020 03:40:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 111sm6228210wrc.53.2020.07.27.03.40.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 03:40:45 -0700 (PDT)
Date: Mon, 27 Jul 2020 12:40:43 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH 1/3] drm/ast: Do full modeset if the primary plane's
 format changes
Message-ID: <20200727104043.GU6419@phenom.ffwll.local>
References: <20200727073707.21097-1-tzimmermann@suse.de>
 <20200727073707.21097-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200727073707.21097-2-tzimmermann@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, emil.l.velikov@gmail.com,
 dri-devel@lists.freedesktop.org, kraxel@redhat.com, airlied@redhat.com,
 stable@vger.kernel.org, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 27, 2020 at 09:37:05AM +0200, Thomas Zimmermann wrote:
> The atomic modesetting code tried to distinguish format changes from
> full modesetting operations. In practice, this was buggy and the format
> registers were often updated even for simple pageflips.

Nah it's not buggy, it's intentional. Most hw can update formats in a flip
withouth having to shut down the hw to do so.


> Instead do a full modeset if the primary plane changes formats. It's
> just as rare as an actual mode change, so there will be no performance
> penalty.
> 
> The patch also replaces a reference to drm_crtc_state.allow_modeset with
> the correct call to drm_atomic_crtc_needs_modeset().
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 4961eb60f145 ("drm/ast: Enable atomic modesetting")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Emil Velikov <emil.l.velikov@gmail.com>
> Cc: "Y.C. Chen" <yc_chen@aspeedtech.com>
> Cc: <stable@vger.kernel.org> # v5.6+
> ---
>  drivers/gpu/drm/ast/ast_mode.c | 23 ++++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 154cd877d9d1..3680a000b812 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -527,8 +527,8 @@ static const uint32_t ast_primary_plane_formats[] = {
>  static int ast_primary_plane_helper_atomic_check(struct drm_plane *plane,
>  						 struct drm_plane_state *state)
>  {
> -	struct drm_crtc_state *crtc_state;
> -	struct ast_crtc_state *ast_crtc_state;
> +	struct drm_crtc_state *crtc_state, *old_crtc_state;
> +	struct ast_crtc_state *ast_crtc_state, *old_ast_crtc_state;
>  	int ret;
>  
>  	if (!state->crtc)
> @@ -550,6 +550,15 @@ static int ast_primary_plane_helper_atomic_check(struct drm_plane *plane,
>  
>  	ast_crtc_state->format = state->fb->format;
>  
> +	old_crtc_state = drm_atomic_get_old_crtc_state(state->state, state->crtc);
> +	if (!old_crtc_state)
> +		return 0;
> +	old_ast_crtc_state = to_ast_crtc_state(old_crtc_state);
> +	if (!old_ast_crtc_state)

The above two if checks should never fail, I'd wrap them in a WARN_ON.

> +		return 0;
> +	if (ast_crtc_state->format != old_ast_crtc_state->format)
> +		crtc_state->mode_changed = true;
> +
>  	return 0;
>  }
>  
> @@ -775,18 +784,18 @@ static void ast_crtc_helper_atomic_flush(struct drm_crtc *crtc,
>  
>  	ast_state = to_ast_crtc_state(crtc->state);
>  
> -	format = ast_state->format;
> -	if (!format)
> +	if (!drm_atomic_crtc_needs_modeset(crtc->state))
>  		return;
>  
> +	format = ast_state->format;
> +	if (drm_WARN_ON_ONCE(dev, !format))
> +		return; /* BUG: We didn't set format in primary check(). */

Hm that entire ast_state->format machinery looks kinda strange, can't you
just look up the primary plane state everywhere and that's it?
drm_framebuffer are fully invariant and refcounted to the state, so there
really shouldn't be any need to copy format around.

But that's maybe for a next patch. With the commit message clarified that
everything works as designed, and maybe the two WARN_ON added:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +
>  	vbios_mode_info = &ast_state->vbios_mode_info;
>  
>  	ast_set_color_reg(ast, format);
>  	ast_set_vbios_color_reg(ast, format, vbios_mode_info);
>  
> -	if (!crtc->state->mode_changed)
> -		return;
> -
>  	adjusted_mode = &crtc->state->adjusted_mode;
>  
>  	ast_set_vbios_mode_reg(ast, adjusted_mode, vbios_mode_info);
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
