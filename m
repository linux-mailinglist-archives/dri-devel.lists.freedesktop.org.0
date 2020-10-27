Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4763629A7FD
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 10:36:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 118436E1A5;
	Tue, 27 Oct 2020 09:36:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C0946E1A8
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 09:36:35 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id s9so1062330wro.8
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 02:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=oKyhhlggIzQZEALt6LDXbEGeExFCJKLngSO4q056TRw=;
 b=SgiGfHua4PGRBgKddAU9OCyQ6gEct1idFssRqSbWwjGRJqXG169x46PTmvdjQceWZf
 fk5dAtJxunjnhbD4rbCsNxxDzknml/sX2Srv0TepflP0Th4ndJ/+cwJxg9Nb54onNn7a
 SioLMZC7T1foebo0tvNh9MYDlsSqwMmR1SUDo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oKyhhlggIzQZEALt6LDXbEGeExFCJKLngSO4q056TRw=;
 b=IE6eHMMu1ir5dg5t5XUWEtGQgEj/GW/SSn7cvhX3gP8XVGTMbZdBu3bXu9Tc01LLZF
 X9j/CoWZVzKducZVHho5QgPZVVX3HvOWQ+8QkPpFNRYzD4m3GE7yNaVpOPFfABtNwg4K
 ixPzHsoJlk5VzSJGtsIf7I0I+0UzNfEF9huN9y/iSGS09/mGy2Kv5UyzR34jVnbHUNET
 2uNHwjLk2dXDxB+GoldyX9/Ih0Du5cZZQ3ogu7UU2KUkAOFMVifpKVSJC6/QvsyaiDj+
 opdw5HpEKEKpEIrcyFQHOyJ12Bb1LSmjAgB/LKwEutTmUV32SOY/b5eNC9llXJ54uUyK
 pwTw==
X-Gm-Message-State: AOAM531gkWEbN/0GBP2D6vCFI/pTi6YPMSOzVuS6bEEYpUitZydD+TXT
 +33dAicL4FFAXgFVNtyOz4wiiiZvwtQR8P9w
X-Google-Smtp-Source: ABdhPJzHD8U/7HI5c4wsPD1H08r/8tFlxpBIJaaJcDdq1QoqLSTpEsPUJ2pxSZrV6BQcS2YaZr5g8A==
X-Received: by 2002:adf:c3c6:: with SMTP id d6mr1782755wrg.206.1603791394082; 
 Tue, 27 Oct 2020 02:36:34 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u15sm1268718wrm.77.2020.10.27.02.36.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 02:36:33 -0700 (PDT)
Date: Tue, 27 Oct 2020 10:36:31 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/doc: Document legacy_cursor_update better
Message-ID: <20201027093631.GJ401619@phenom.ffwll.local>
References: <20201023123925.2374863-1-daniel.vetter@ffwll.ch>
 <20201023123925.2374863-3-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201023123925.2374863-3-daniel.vetter@ffwll.ch>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 23, 2020 at 02:39:25PM +0200, Daniel Vetter wrote:
> It's the horror and shouldn't be used. Realized we're not clear on
> this in a discussion with Rob about what msm is doing to better
> support async commits.
> 
> v2: Refine existing todo item to include this (Thomas)
> 
> Cc: Sean Paul <sean@poorly.run>
> Cc: Rob Clark <robdclark@gmail.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>

Pushed this one with Rob's irc-ack, since the functional changes will take
a bit longer to figure out.
-Daniel

> ---
>  Documentation/gpu/todo.rst |  4 ++++
>  include/drm/drm_atomic.h   | 12 +++++++++++-
>  2 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 700637e25ecd..6b224ef14455 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -105,6 +105,10 @@ converted over to the new infrastructure.
>  One issue with the helpers is that they require that drivers handle completion
>  events for atomic commits correctly. But fixing these bugs is good anyway.
>  
> +Somewhat related is the legacy_cursor_update hack, which should be replaced with
> +the new atomic_async_check/commit functionality in the helpers in drivers that
> +still look at that flag.
> +
>  Contact: Daniel Vetter, respective driver maintainers
>  
>  Level: Advanced
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index d07c851d255b..413fd0ca56a8 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -308,7 +308,6 @@ struct __drm_private_objs_state {
>   * struct drm_atomic_state - the global state object for atomic updates
>   * @ref: count of all references to this state (will not be freed until zero)
>   * @dev: parent DRM device
> - * @legacy_cursor_update: hint to enforce legacy cursor IOCTL semantics
>   * @async_update: hint for asynchronous plane update
>   * @planes: pointer to array of structures with per-plane data
>   * @crtcs: pointer to array of CRTC pointers
> @@ -336,6 +335,17 @@ struct drm_atomic_state {
>  	 * drm_atomic_crtc_needs_modeset().
>  	 */
>  	bool allow_modeset : 1;
> +	/**
> +	 * @legacy_cursor_update:
> +	 *
> +	 * Hint to enforce legacy cursor IOCTL semantics.
> +	 *
> +	 * WARNING: This is thoroughly broken and pretty much impossible to
> +	 * implement correctly. Drivers must ignore this and should instead
> +	 * implement &drm_plane_helper_funcs.atomic_async_check and
> +	 * &drm_plane_helper_funcs.atomic_async_commit hooks. New users of this
> +	 * flag are not allowed.
> +	 */
>  	bool legacy_cursor_update : 1;
>  	bool async_update : 1;
>  	/**
> -- 
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
