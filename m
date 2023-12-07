Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E5B809466
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 22:34:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB1310E0C9;
	Thu,  7 Dec 2023 21:34:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5978A10E0C9
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 21:34:10 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-54c68c8009eso385719a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 13:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1701984849; x=1702589649; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rDltz1HHy6UCuuTYykcaDJWWWZVlgjuJuZQK5Q/dZ40=;
 b=JzxiwJv92ldnJDsEsyl2q0IlevuvCReMB3AoE7H+pyZjHoYNrh0h4mF414/swTGZ3a
 iRjkS5lS3OJqlmcdU45X7SlU09rxMoQzN+rjZ7UCmVZHkmXIhtS+iqtQgMRZNn/JfDfj
 Z5ILnTLEKjXb5jtyGr3O/Ob07MMX6iTK60Xks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701984849; x=1702589649;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rDltz1HHy6UCuuTYykcaDJWWWZVlgjuJuZQK5Q/dZ40=;
 b=hzk0aFHAzNHcXKr5rcqXX9UK8ILzXj7GOM+Jgi0O2dIVdqXUz+Omi9vigHt6nqE0G7
 ZISf6uiD0RJZnHUXLVX1oA7MIoxror+Sc3/nnPdMySIs/vavIDfBQOlZ/US8TVp+lM+h
 BbiPcNmP604XP9y9s6wid+Y8nD59pleIiEP3Xa8C8Ew99Qg3SCchuxp34sFy2RIOgKf2
 7Yf0afi7soRJ9yvhYYRB/+blbK0HUcbkllw7QPePYGVCy4hr2ZP6Ofvw5M9uFadtuKor
 OS/80uiw4tqkVrSSLF5e4ULU7iD5Q45ad0nvVlicDK/KWIdF5EKYnLgCM4Dr7PcVZ5vb
 ebRA==
X-Gm-Message-State: AOJu0Yx7gwy4i/HlxnJK+ou9A4E5hvwZpME1Xs7oeceZTmwGXs6em5LU
 1gSwBHX8bhUtHKDk8jwuau6nZw==
X-Google-Smtp-Source: AGHT+IFyNN4bCITyJmU1Awh2JkXha+HuLvP+3lKrUA5MxTzSerlFhMJxzrNxY/2+R7CfVlFrAfyEjw==
X-Received: by 2002:a05:6402:51cc:b0:54c:672c:c361 with SMTP id
 r12-20020a05640251cc00b0054c672cc361mr4332804edd.4.1701984848651; 
 Thu, 07 Dec 2023 13:34:08 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 dg12-20020a0564021d0c00b0054c9635b24esm232851edb.21.2023.12.07.13.34.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 13:34:07 -0800 (PST)
Date: Thu, 7 Dec 2023 22:34:06 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 1/5] drm/atomic: Move the drm_atomic_state field doc inline
Message-ID: <ZXI6TojujZ4CJsMR@phenom.ffwll.local>
References: <20231204121707.3647961-1-mripard@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204121707.3647961-1-mripard@kernel.org>
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

On Mon, Dec 04, 2023 at 01:17:03PM +0100, Maxime Ripard wrote:
> Some fields of drm_atomic_state have been documented in-line, but some
> were documented in the main kerneldoc block before the structure.
> 
> Since the former is the preferred option in DRM, let's move all the
> fields to an inline documentation.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  include/drm/drm_atomic.h | 50 ++++++++++++++++++++++++++++++++--------
>  1 file changed, 40 insertions(+), 10 deletions(-)
> 
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index cf8e1220a4ac..2a08030fcd75 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -347,24 +347,22 @@ struct __drm_private_objs_state {
>  
>  /**
>   * struct drm_atomic_state - the global state object for atomic updates
> - * @ref: count of all references to this state (will not be freed until zero)
> - * @dev: parent DRM device
> - * @async_update: hint for asynchronous plane update
> - * @planes: pointer to array of structures with per-plane data
> - * @crtcs: pointer to array of CRTC pointers
> - * @num_connector: size of the @connectors and @connector_states arrays
> - * @connectors: pointer to array of structures with per-connector data
> - * @num_private_objs: size of the @private_objs array
> - * @private_objs: pointer to array of private object pointers
> - * @acquire_ctx: acquire context for this atomic modeset state update
>   *
>   * States are added to an atomic update by calling drm_atomic_get_crtc_state(),
>   * drm_atomic_get_plane_state(), drm_atomic_get_connector_state(), or for
>   * private state structures, drm_atomic_get_private_obj_state().
>   */
>  struct drm_atomic_state {
> +	/**
> +	 * @ref:
> +	 *
> +	 * Count of all references to this update (will not be freed until zero).
> +	 */
>  	struct kref ref;
>  
> +	/**
> +	 * @dev: Parent DRM Device.
> +	 */
>  	struct drm_device *dev;
>  
>  	/**
> @@ -388,7 +386,12 @@ struct drm_atomic_state {
>  	 * flag are not allowed.
>  	 */
>  	bool legacy_cursor_update : 1;
> +
> +	/**
> +	 * @async_update: hint for asynchronous plane update
> +	 */
>  	bool async_update : 1;
> +
>  	/**
>  	 * @duplicated:
>  	 *
> @@ -398,13 +401,40 @@ struct drm_atomic_state {
>  	 * states.
>  	 */
>  	bool duplicated : 1;
> +
> +	/**
> +	 * @planes: pointer to array of structures with per-plane data
> +	 */
>  	struct __drm_planes_state *planes;
> +
> +	/**
> +	 * @crtcs: pointer to array of CRTC pointers
> +	 */
>  	struct __drm_crtcs_state *crtcs;
> +
> +	/**
> +	 * @num_connector: size of the @connectors and @connector_states arrays
> +	 */
>  	int num_connector;
> +
> +	/**
> +	 * @connectors: pointer to array of structures with per-connector data
> +	 */
>  	struct __drm_connnectors_state *connectors;
> +
> +	/**
> +	 * @num_private_objs: size of the @private_objs array
> +	 */
>  	int num_private_objs;
> +
> +	/**
> +	 * @private_objs: pointer to array of private object pointers
> +	 */
>  	struct __drm_private_objs_state *private_objs;
>  
> +	/**
> +	 * @acquire_ctx: acquire context for this atomic modeset state update
> +	 */
>  	struct drm_modeset_acquire_ctx *acquire_ctx;
>  
>  	/**
> -- 
> 2.43.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
