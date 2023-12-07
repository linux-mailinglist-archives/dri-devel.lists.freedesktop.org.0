Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BA48094D1
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 22:42:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCDAA10E08F;
	Thu,  7 Dec 2023 21:41:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE7F010E08F
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 21:41:55 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5491de618b2so315852a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 13:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1701985314; x=1702590114; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XmtCz0XrUFtBmH3gUQsr8aOpTaRLvMEsvWSQ3lt619Q=;
 b=irAowOaEucEKAzlvIzhie/fXkWAvkvjZznRFXceR1iFEFB3Y7vtQAHLXsI7AuqXKjp
 Pzw/nbiIrTptf1cFNSVgMPkybTEqzGsnkytX3uB8/ezrYK6FJ16AKP/aR9AewiYyB4E2
 IcW8oB48CCxHYBowBJ0oJqr3PaiEA6qR9T/7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701985314; x=1702590114;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XmtCz0XrUFtBmH3gUQsr8aOpTaRLvMEsvWSQ3lt619Q=;
 b=cW08rbPdEWxnqTkGWqhDffy36cR/UFjZH7nMGCBiO9Y/NC4w9RuDQUY9EuEaeRH/Rg
 N2UbzK1U3IomLXgnFqT8J5Q98yGZE7S50QBX2nde1t8vKUsBR+zcdexXbkotdFgMoKZr
 TnuovYdG8R5U+7jvqHUKAY9bmv+i7uJKq9eqFeNg8zvcqpLMPNsbEGKE8Gh+1KnZQO6z
 BN2PS0vITnV9HUUsKaaOg5bXlLztHz898nTm8zkEl1OvB5z7/Ezosp/7AKTDwp4WmWKJ
 8grvweLqSlhLMzRee/1mgHr/y5O3yx4gA+KEps1FnY2nyq5BukoIbH4sAssPaSATJ3r0
 9H1Q==
X-Gm-Message-State: AOJu0Yx5WI3+chCC91VxYsUxWM/C/u6JSISjlbOKu5CvYLUaY5XvVh8M
 fLSLbPtbboU9KFFNq6ihDGcTaw==
X-Google-Smtp-Source: AGHT+IFrI0e/sh/wXgJUtAI5RsXBEx9+BhtZqFknlGC8AC8eMqA/jN3hKRkpXA25AH+SBPS7tMjdOQ==
X-Received: by 2002:a17:906:34cd:b0:a1c:9083:ea77 with SMTP id
 h13-20020a17090634cd00b00a1c9083ea77mr4254422ejb.0.1701985314292; 
 Thu, 07 Dec 2023 13:41:54 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 cx7-20020a170907168700b009fc576e26e6sm220295ejd.80.2023.12.07.13.41.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 13:41:53 -0800 (PST)
Date: Thu, 7 Dec 2023 22:41:51 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 3/5] drm/atomic: Rework the object doc a bit
Message-ID: <ZXI8HyiCxN8yvSyu@phenom.ffwll.local>
References: <20231204121707.3647961-1-mripard@kernel.org>
 <20231204121707.3647961-3-mripard@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204121707.3647961-3-mripard@kernel.org>
X-Operating-System: Linux phenom 6.5.0-4-amd64 
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 04, 2023 at 01:17:05PM +0100, Maxime Ripard wrote:
> The doc for the planes, crtcs, connectors and private_objs fields
> mention that they are pointers to an array of structures with
> per-$OBJECT data.
> 
> While these fields are indeed pointers to an array, each item of that
> array contain a pointer to the object structure affected by the update,
> and its old and new state. There's no per-object data there.
> 
> Let's rephrase those fields a bit to better match the current situation.

Yeah that wasn't updated as part of 5d943aa6c0d4 ("drm: Consolidate crtc
arrays in drm_atomic_state") and b8b5342b699b ("drm: Consolidate plane
arrays in drm_atomic_state"). With that added to the commit message:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  include/drm/drm_atomic.h | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index 13cecdc1257d..914574b58ae7 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -403,12 +403,18 @@ struct drm_atomic_state {
>  	bool duplicated : 1;
>  
>  	/**
> -	 * @planes: pointer to array of structures with per-plane data
> +	 * @planes:
> +	 *
> +	 * Pointer to array of @drm_plane and @drm_plane_state part of this
> +	 * update.
>  	 */
>  	struct __drm_planes_state *planes;
>  
>  	/**
> -	 * @crtcs: pointer to array of CRTC pointers
> +	 * @crtcs:
> +	 *
> +	 * Pointer to array of @drm_crtc and @drm_crtc_state part of this
> +	 * update.
>  	 */
>  	struct __drm_crtcs_state *crtcs;
>  
> @@ -418,7 +424,10 @@ struct drm_atomic_state {
>  	int num_connector;
>  
>  	/**
> -	 * @connectors: pointer to array of structures with per-connector data
> +	 * @connectors:
> +	 *
> +	 * Pointer to array of @drm_connector and @drm_connector_state part of
> +	 * this update.
>  	 */
>  	struct __drm_connnectors_state *connectors;
>  
> @@ -428,7 +437,10 @@ struct drm_atomic_state {
>  	int num_private_objs;
>  
>  	/**
> -	 * @private_objs: pointer to array of private object pointers
> +	 * @private_objs:
> +	 *
> +	 * Pointer to array of @drm_private_obj and @drm_private_obj_state part
> +	 * of this update.
>  	 */
>  	struct __drm_private_objs_state *private_objs;
>  
> -- 
> 2.43.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
