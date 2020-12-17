Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8AB2DD10F
	for <lists+dri-devel@lfdr.de>; Thu, 17 Dec 2020 13:05:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAD9C893A2;
	Thu, 17 Dec 2020 12:05:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E9E893A2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 12:05:19 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id q75so5498371wme.2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 04:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DJ+Bq0vvS148IjiBRepCHroJ1FcYFDlwDvy6H1t8c4c=;
 b=LAR1kM1C9wSi7eJlEnFoAFbvQYNcrBgd8JXzXg4eFV1H+47bGzdXT25e9khV2RN9JT
 2aDjMaWdzh6oc5Norjcj5sHeT/6i+YxoC12Tm9+ySEF3wzzwdcvzkgUpREU3cpJnH46A
 gIdzecfyxXFCZobpsbwfQop/qJrXTvlouRbso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DJ+Bq0vvS148IjiBRepCHroJ1FcYFDlwDvy6H1t8c4c=;
 b=sSjjAnl0bb8hCt+U1GeSf/GWhYAjhm9ZFhodM29L6uH2SIb6jCxj3anKvwIv5awsM7
 WEza8X+xWao+xa0+aUhGrGxYetLdRkCIF3rSpttMwMKbwAaZZkETpTe+FqC1UfgbNbRk
 U0CNZq1i2Q3BdRgQXnRgxi5EGQ/M4Cq296ArIqF30Oyyh1RnuGVIey0+s9Ok+uhWJ0rV
 i0ZbqNFiZldcEvxKDd4Z5WLRDbB9XnAHAf99WYH+YHnneoKzBMnkfxbgjYyX7MHaddZH
 H1mdNQaROGO6vUL43j7tGJthYasWuNRZ0Is6JXulggt1CE3OmNT11oesU5J+xx27mHiI
 cGkA==
X-Gm-Message-State: AOAM531OsnK/1nCuUnQAVxURiIbHx/y8WI+OnAuZD2ngME/nPyVwvBeq
 924w81G+/Qq/RaQRhYioFmiebw==
X-Google-Smtp-Source: ABdhPJwmF3pSLgXYyPaCFgOl4YQfad7rkWwR2occMQD/Ru2C9BteQ/1D5xxTOCG5Idk8ShFiiFo7PQ==
X-Received: by 2002:a1c:80c3:: with SMTP id b186mr8078232wmd.20.1608206718112; 
 Thu, 17 Dec 2020 04:05:18 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p15sm8183044wrt.15.2020.12.17.04.05.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 04:05:17 -0800 (PST)
Date: Thu, 17 Dec 2020 13:05:15 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2 4/9] drm/doc: fix drm_plane_type docs
Message-ID: <X9tJe3zshEhTftjt@phenom.ffwll.local>
References: <20201217113220.102271-1-contact@emersion.fr>
 <20201217113220.102271-5-contact@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201217113220.102271-5-contact@emersion.fr>
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

On Thu, Dec 17, 2020 at 12:32:15PM +0100, Simon Ser wrote:
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
>  include/drm/drm_plane.h | 29 +++++++++++++++++++++--------
>  1 file changed, 21 insertions(+), 8 deletions(-)
> 
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index 1d82b264e5e4..5b180d07788e 100644
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
> + * &drm_crtc.primary and optionally &drm_crtc.cursor pointers for legacy
> + * IOCTLs. See drm_crtc_init_with_planes().
> + *
>   * WARNING: The values of this enum is UABI since they're exposed in the "type"
>   * property.
>   */
> @@ -557,19 +561,28 @@ enum drm_plane_type {
>  	/**
>  	 * @DRM_PLANE_TYPE_PRIMARY:
>  	 *
> -	 * Primary planes represent a "main" plane for a CRTC.  Primary planes
> -	 * are the planes operated upon by CRTC modesetting and flipping
> -	 * operations described in the &drm_crtc_funcs.page_flip and
> -	 * &drm_crtc_funcs.set_config hooks.
> +	 * A primary plane attached to a CRTC is the most likely to be able to
> +	 * light up the CRTC when no scaling/cropping is used and the plane
> +	 * covers the whole CRTC.
> +	 *
> +	 * In addition to setting a plane type to primary, drivers need to
> +	 * setup the &drm_crtc.primary pointer for legacy IOCTLs. See
> +	 * drm_crtc_init_with_planes().

After you brought it up I'm actually fine with not duplicating this.
Either way:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  	 */
>  	DRM_PLANE_TYPE_PRIMARY,
>  
>  	/**
>  	 * @DRM_PLANE_TYPE_CURSOR:
>  	 *
> -	 * Cursor planes represent a "cursor" plane for a CRTC.  Cursor planes
> -	 * are the planes operated upon by the DRM_IOCTL_MODE_CURSOR and
> -	 * DRM_IOCTL_MODE_CURSOR2 IOCTLs.
> +	 * A cursor plane attached to a CRTC is more likely to be able to be
> +	 * enabled when no scaling/cropping is used and the framebuffer has the
> +	 * size indicated by &drm_mode_config.cursor_width and
> +	 * &drm_mode_config.cursor_height. Additionally, if the driver doesn't
> +	 * support modifiers, the framebuffer should have a linear layout.
> +	 *
> +	 * In addition to setting a plane type to cursor, drivers need to setup
> +	 * the &drm_crtc.cursor pointer for legacy IOCTLs. See
> +	 * drm_crtc_init_with_planes().
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
