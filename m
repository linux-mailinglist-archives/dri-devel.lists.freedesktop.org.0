Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C23168094E6
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 22:48:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00F7D10E98D;
	Thu,  7 Dec 2023 21:48:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B75F10E98D
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 21:48:23 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a1d48f0223dso39032366b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 13:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1701985702; x=1702590502; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uI0jRHj7VODfH4U6CJEg4o2q+ZQ87eCIjC7S4l3yc8I=;
 b=R4cmi+Gd3Nr/zU1R7zNE/Ikrr03+ZOty70cyfLkw5b2kcT+EIjJdqp6nah/xzGaAWS
 Y6o3wP3GlzpPVinQVrSatJJTSLGCcy3c2ezh5bVRJOnG5ItOYLfmTwczhAKneqpPZDQB
 iHU9tzAIvURDXUWR5caE+FHVEPUeMDG+BWMvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701985702; x=1702590502;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uI0jRHj7VODfH4U6CJEg4o2q+ZQ87eCIjC7S4l3yc8I=;
 b=nxtOWAgfOWSkZAXHAqM1f4RpYBZ7thfo0ny/9rUCrGx/jHS/WpwzO2EE59gpNIfPZz
 5H27HygbvkzehnLgU7Y1NjUrDmRX/WG6Ios9HGOfMqmVYmKR0iuM1F3D+RQPaWrsgjCh
 zJY3ftNQsenSBp1WKtO6T+iSqd8vg4oUcPNY9fb/Q04vAmpRJsmU6tnMPUymLpuqUKqV
 XE0yC3ClaEFoDYj0PerqRWT32GCakHjBdga/GaQg7gKjdhXQeJsapUugTJKrQV8Ul8Pn
 mbdL7vnI7hZAtXsiU1ftOFYkgSzxKkCLWWhSDv2nTnk3iWtei9B9v6WfP7RK/uX7mNuf
 JcCg==
X-Gm-Message-State: AOJu0Ywsfv/FAzGm4EOjSVt12T44qI9UJwFEagZdIMf6C+lUY5rqKPTF
 eYUVrykxpBUU7QQDfwKFGiGdcA==
X-Google-Smtp-Source: AGHT+IEZ4rgLK4Y5Hlx2PBPyCo8bsYfy1mqF21LRuZX+r/iEpsmPHQ3XsLAC4SZazSpqdioxzNBTFg==
X-Received: by 2002:a17:907:9708:b0:a1c:dce4:1daf with SMTP id
 jg8-20020a170907970800b00a1cdce41dafmr4948037ejc.2.1701985701902; 
 Thu, 07 Dec 2023 13:48:21 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 tz8-20020a170907c78800b009e5ce1acb01sm223362ejc.103.2023.12.07.13.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 13:48:21 -0800 (PST)
Date: Thu, 7 Dec 2023 22:48:19 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 4/5] drm/atomic: Make the drm_atomic_state documentation
 less ambiguous
Message-ID: <ZXI9o-wCPh74-krX@phenom.ffwll.local>
References: <20231204121707.3647961-1-mripard@kernel.org>
 <20231204121707.3647961-4-mripard@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204121707.3647961-4-mripard@kernel.org>
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

On Mon, Dec 04, 2023 at 01:17:06PM +0100, Maxime Ripard wrote:
> The current documentation of drm_atomic_state says that it's the "global
> state object". This is confusing since, while it does contain all the
> objects affected by an update and their respective states, if an object
> isn't affected by this update it won't be part of it.
> 
> Thus, it's not truly a "global state", unlike object state structures
> that do contain the entire state of a given object.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

So this is probably the biggest naming fumble I've committed, because this
is the drm_atomic_commit structure: It's not just a state structure, but
it represents the transition from a set of old to new states. Which is
also why we have both old and new state pointers in it.

> ---
>  include/drm/drm_atomic.h | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index 914574b58ae7..81ad7369b90d 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -346,11 +346,19 @@ struct __drm_private_objs_state {
>  };
>  
>  /**
> - * struct drm_atomic_state - the global state object for atomic updates
> + * struct drm_atomic_state - Atomic Update structure

I think we're using "commit" more often than "update"

> + *
> + * This structure is the kernel counterpart of @drm_mode_atomic and contains
> + * all the objects affected by an atomic modeset update and their states.

My suggestion:

This structure is the kernel counterpart of @drm_mode_atomic and
represents an atomic commit that transitions from an old to a new display
state. It contains all the objects affected by an atomic commits and both
the new state structures and pointers to the old state structures for
these.

>   *
>   * States are added to an atomic update by calling drm_atomic_get_crtc_state(),
>   * drm_atomic_get_plane_state(), drm_atomic_get_connector_state(), or for
>   * private state structures, drm_atomic_get_private_obj_state().
> + *
> + * NOTE: While this structure looks to be global and affecting the whole DRM
> + * device, it only contains the objects affected by the atomic commit.
> + * Unaffected objects will not be part of that update, unless they have been
> + * explicitly added by either the framework or the driver.

Since you remove the global in the header summary I wouldn't reintroduce
it here. Seems to just add to the confusion again instead of clarifying.

If you want maybe clarify that an atomic commit does not need to contain
all the objects of a &drm_device, or something like that.

With the comments suitably addressed:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>


>   */
>  struct drm_atomic_state {
>  	/**
> -- 
> 2.43.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
