Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1460F4E678A
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 18:13:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A52710E9A3;
	Thu, 24 Mar 2022 17:13:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A860910E9A3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 17:13:26 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j18so7566130wrd.6
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 10:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BZHjLI8Q9iTyTsxdiaqtHTZe2JshQcF30jnheEuD1tQ=;
 b=kHxl4vU7WLM2+qKK0eHx83TKYTUF90pm3cidkmpT52CFpK3xgYYXGBXBoDSUq+Htl+
 7Epq23iUft95+hgb128l79lrOzmPtTAdwayTszPAT1QkEqIuByQatSBG+qz4dVBkBJUe
 pDqTKZ91b5ayjNnWG8XUcpzXOoRFJE39RwTiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BZHjLI8Q9iTyTsxdiaqtHTZe2JshQcF30jnheEuD1tQ=;
 b=J9Ah8RT1ThW2YEj53YXOh0yyNL5sGX5fUvdh0tCEd1LoCn6miQPtc16dbmG/jJLhVU
 TwCqsiSbLJ6kKmk5jCPAmvHd9iQT/Z3y/uuW/elnUNQDntARt9rl4YiyB2vP+MLz9Sgf
 g4bDLVcbv4EmXL4LhMjnCGdkeOXB8j4ANCoxqbpa8iRl6vDNpE7CaSob18b684xblwRf
 udMXp71H4yYcZI3qa6QPUP2gXGjhJWux+476C+1AmT/pMFOipVcEq7reeJB6qpPaDGst
 ON1lVKS7wNYDXa0biuow7DEnpGYTc1hmHwOTjc4ATjghqSBmI/2qnZHunvKIOBtvUwAU
 g40A==
X-Gm-Message-State: AOAM530oVDr++y6KMty+FSHBx4iBCgNVGY7TvX0jtmF0VPRL5M0PgKwN
 2znnJJ4UvIiL54gVwL/jWvptAA==
X-Google-Smtp-Source: ABdhPJwHc7HpLjZ+3X07z52sZFGy1igNQBlAlNVQ/5Cg/nKSs9PEZozpcbR6T2h01VQcowSOhS9TsA==
X-Received: by 2002:a5d:47a8:0:b0:204:72:7051 with SMTP id
 8-20020a5d47a8000000b0020400727051mr5434057wrb.451.1648142005119; 
 Thu, 24 Mar 2022 10:13:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 n37-20020a05600c3ba500b0038cc9d6ff5bsm2775312wms.4.2022.03.24.10.13.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 10:13:24 -0700 (PDT)
Date: Thu, 24 Mar 2022 18:13:22 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 1/4] drm/atomic: Print the state every commit
Message-ID: <YjymstSJgT6nSj2l@phenom.ffwll.local>
References: <20220324144724.1306133-1-maxime@cerno.tech>
 <20220324144724.1306133-2-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220324144724.1306133-2-maxime@cerno.tech>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 24, 2022 at 03:47:21PM +0100, Maxime Ripard wrote:
> The DRM_UT_STATE controls whether we're calling
> drm_atomic_print_new_state() whenever a new state is committed. However,
> that call is made in the drm_mode_atomic_ioctl(), whereas we have
> multiple users of the drm_atomic_commit() function in the kernel
> (framebuffer emulation, drm_atomic_helper_dirtyfb, etc.). Similarly,
> it's only called for a blocking atomic commit.
> 
> This leads to multiple states being committed but never actually
> displayed even though we asked to have verbose atomic state debugging.
> 
> Let's move the call to drm_atomic_print_new_state() to
> drm_atomic_commit() and drm_atomic_nonblocking_commit() to make sure we
> don't miss any.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Iirc the idea was that if you get a printing for every nonblocking then
the logs get completely flooded. git blame + mailing lists should bring up
the people who's ack you need (and maybe cc on v2 of this).

I think we might need a new DRM_UT_NONBLOCKING_STATE or something like
that to handle this.
-Daniel

> ---
>  drivers/gpu/drm/drm_atomic.c      | 8 ++++++++
>  drivers/gpu/drm/drm_atomic_uapi.c | 3 ---
>  2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 88cd992df356..ee2496ff3dcc 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -1423,6 +1423,7 @@ EXPORT_SYMBOL(drm_atomic_check_only);
>  int drm_atomic_commit(struct drm_atomic_state *state)
>  {
>  	struct drm_mode_config *config = &state->dev->mode_config;
> +	struct drm_printer p = drm_info_printer(state->dev->dev);
>  	int ret;
>  
>  	ret = drm_atomic_check_only(state);
> @@ -1431,6 +1432,9 @@ int drm_atomic_commit(struct drm_atomic_state *state)
>  
>  	drm_dbg_atomic(state->dev, "committing %p\n", state);
>  
> +	if (drm_debug_enabled(DRM_UT_STATE))
> +		drm_atomic_print_new_state(state, &p);
> +
>  	return config->funcs->atomic_commit(state->dev, state, false);
>  }
>  EXPORT_SYMBOL(drm_atomic_commit);
> @@ -1452,6 +1456,7 @@ EXPORT_SYMBOL(drm_atomic_commit);
>  int drm_atomic_nonblocking_commit(struct drm_atomic_state *state)
>  {
>  	struct drm_mode_config *config = &state->dev->mode_config;
> +	struct drm_printer p = drm_info_printer(state->dev->dev);
>  	int ret;
>  
>  	ret = drm_atomic_check_only(state);
> @@ -1460,6 +1465,9 @@ int drm_atomic_nonblocking_commit(struct drm_atomic_state *state)
>  
>  	drm_dbg_atomic(state->dev, "committing %p nonblocking\n", state);
>  
> +	if (drm_debug_enabled(DRM_UT_STATE))
> +		drm_atomic_print_new_state(state, &p);
> +
>  	return config->funcs->atomic_commit(state->dev, state, true);
>  }
>  EXPORT_SYMBOL(drm_atomic_nonblocking_commit);
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index 9781722519c3..e9bb136c7a7c 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -1458,9 +1458,6 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>  	} else if (arg->flags & DRM_MODE_ATOMIC_NONBLOCK) {
>  		ret = drm_atomic_nonblocking_commit(state);
>  	} else {
> -		if (drm_debug_enabled(DRM_UT_STATE))
> -			drm_atomic_print_new_state(state, &p);
> -
>  		ret = drm_atomic_commit(state);
>  	}
>  
> -- 
> 2.35.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
