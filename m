Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA20E2DC83D
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 22:19:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95A69897F0;
	Wed, 16 Dec 2020 21:19:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75064897F0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 21:19:22 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id m5so24513703wrx.9
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 13:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=X3uoSb6fXh1PRPKOz+v4+MIBSESV9s6UfbsTNMYHVzU=;
 b=d1WKpfkmx/pCdzv6v3uCfzKzZZvKm+KS5Qjocg+wy3NSEWIZFq+Z3VHdOXec653s3D
 3uCPBG7B1GvdpdUKSmNx7ZKqPr0QFY/vEBgGFx5iX4OQdKtdrApvmJ7ohzR3ZIpD0u8F
 2hszqlD5HbMzA9mfK7MKYSWCPoeplGBwyEl3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=X3uoSb6fXh1PRPKOz+v4+MIBSESV9s6UfbsTNMYHVzU=;
 b=f/QKzQSM2JmclWiXLxD6kIP/GhC8B9OFSELQAwaVqTFHmNCT3JgwZLjM+ics80Q/G2
 xufYDNrnPr7prN8mHwOzV7blqoBEN1RD+w19r4kClLiqeG2hESBZ8GMNGZUCMLhhjs2h
 xsHGFwNGcQ6f28ZnsApQB9ill+wkRrs6FlIFYopjkqr2MXctmUbD3GIyyS70987q2T6P
 IKVc+tgudW4xO3daYZuuFPVBJEiMybX94fyrzu+C81xXUpHt6fZX4Px77yqXM91Nbwve
 QUELEex/FvBCmtVlLhnkWYxlGRmaG8GN3BN8KtDeBD175RJ/LdGIUMACA45nBiSlhBlx
 b+Fg==
X-Gm-Message-State: AOAM532wrgIasHs1busJy4ofUsnxbS6468yrZT3rUCdK/gGbFlPwS3CY
 c7v3W5/y5yK9GOa76YqzkMsWrw==
X-Google-Smtp-Source: ABdhPJwu/S5mAAsi79cJGf1rbCygZjnhfO9jG6btwiZ53Lek4tmhUU/jPqBZ57XRRtUTBjpeEO36dA==
X-Received: by 2002:adf:a388:: with SMTP id l8mr40086378wrb.354.1608153561130; 
 Wed, 16 Dec 2020 13:19:21 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w8sm4829689wrl.91.2020.12.16.13.19.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 13:19:20 -0800 (PST)
Date: Wed, 16 Dec 2020 22:19:18 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 7/8] drm/doc: fix drm_plane_type docs
Message-ID: <X9p51qbZ6il8DH5T@phenom.ffwll.local>
References: <20201216202222.48146-1-contact@emersion.fr>
 <20201216202222.48146-8-contact@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201216202222.48146-8-contact@emersion.fr>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 16, 2020 at 09:22:21PM +0100, Simon Ser wrote:
> The docs for enum drm_plane_type mention legacy IOCTLs, however the
> plane type is not tied to legacy IOCTLs, the drm_cursor.primary and
> cursor fields are. Add a small paragraph to reference these.
> 
> Instead, document expectations for primary and cursor planes for
> non-legacy userspace. Note that these docs are for driver developers,
> not userspace developers, so internal kernel APIs are mentionned.
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> ---
>  include/drm/drm_plane.h | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index 1d82b264e5e4..94fdd0c68450 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -538,10 +538,14 @@ struct drm_plane_funcs {
>   *
>   * For compatibility with legacy userspace, only overlay planes are made
>   * available to userspace by default. Userspace clients may set the
> - * DRM_CLIENT_CAP_UNIVERSAL_PLANES client capability bit to indicate that they
> + * &DRM_CLIENT_CAP_UNIVERSAL_PLANES client capability bit to indicate that they
>   * wish to receive a universal plane list containing all plane types. See also
>   * drm_for_each_legacy_plane().
>   *
> + * In addition to setting each plane's type, drivers need to setup the
> + * &drm_crtc.primary and optionally &drm_crtc.cursor for legacy IOCTLs. See

				insert "pointers" here ^ for readability.

> + * drm_crtc_init_with_planes().
> + *
>   * WARNING: The values of this enum is UABI since they're exposed in the "type"
>   * property.
>   */
> @@ -557,19 +561,20 @@ enum drm_plane_type {
>  	/**
>  	 * @DRM_PLANE_TYPE_PRIMARY:
>  	 *
> -	 * Primary planes represent a "main" plane for a CRTC.  Primary planes
> -	 * are the planes operated upon by CRTC modesetting and flipping
> -	 * operations described in the &drm_crtc_funcs.page_flip and
> -	 * &drm_crtc_funcs.set_config hooks.

I think we should keep the notice which legacy entry hooks implicitly
operate on the primary plane. Not sure why you're removing the above
sentence. Maybe improve it by adding "See also &drm_crtc.primary." for
more context?

> +	 * A primary plane attached to a CRTC is the most likely to be able to
> +	 * light up the CRTC when no scaling/cropping is used and the plane
> +	 * covers the whole CRTC.
>  	 */
>  	DRM_PLANE_TYPE_PRIMARY,
>  
>  	/**
>  	 * @DRM_PLANE_TYPE_CURSOR:
>  	 *
> -	 * Cursor planes represent a "cursor" plane for a CRTC.  Cursor planes
> -	 * are the planes operated upon by the DRM_IOCTL_MODE_CURSOR and
> -	 * DRM_IOCTL_MODE_CURSOR2 IOCTLs.

Same here, I think it matters that this is used by legacy cursor ioctls.
Again perhaps a pointer to drm_crtc.cursor can help.
-Daniel

> +	 * A cursor plane attached to a CRTC is more likely to be able to be
> +	 * enabled when no scaling/cropping is used and the framebuffer has the
> +	 * size indicated by &drm_mode_config.cursor_width and
> +	 * &drm_mode_config.cursor_height. Additionally, if the driver doesn't
> +	 * support modifiers, the framebuffer should have a linear layout.
>  	 */
>  	DRM_PLANE_TYPE_CURSOR,
>  };
> -- 
> 2.29.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
