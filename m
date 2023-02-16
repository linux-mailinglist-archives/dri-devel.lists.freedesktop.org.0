Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D617D699D24
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 20:46:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4EE310E368;
	Thu, 16 Feb 2023 19:46:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1616210E368
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 19:46:36 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 o19-20020a05600c379300b003e21af96703so1368023wmr.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 11:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=sNQg8heKEIkC0fOCcXKLRiB77tJXgkN14tFZ1NhYopk=;
 b=MGi33RwjvLeGcKZ3DPREygI7IsPRh2rJ/BwhcWpmdD/wrBdZWSA4rcph2PH00cx0dn
 Aqa/mMC9ZpU4SLveRGIqSUp3dCDoWwQZGZcNJYYr50K4YlDYLlKz1Q9e14rLz7VevaQY
 D4gZyp1AlqSxhfEX4rdwI8W7VsYNKeGQAorvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sNQg8heKEIkC0fOCcXKLRiB77tJXgkN14tFZ1NhYopk=;
 b=3PfhFAZztJ2bcPWlkoJH+dVlsZQHthWJbL8P0ybIW3v0UT/NmqQ3xACF1hKwwSgusp
 XgbiVjgIiKVOHK7oyjK/MYzhUeLdeaWu/2S2xeNyNDecxYmjrrlIPtfFzi2k4gxmxVh2
 mamXI9CcvhKDiKuINvPR9PahJyovFqm5G1whPyoPJBC48jt5ZDEi2T75av3Azydcsvo1
 tOiVLWmOTKOKSkNTzg0jCv6iXXG+3FSIK87A8ZdcG/DjmjNlhxj8c0yBKnCp9yQnhUHi
 c1Q6YbdlfHJ/EqQnwikgKK6JuOVj2dQnT21s7OOrrmYHkJrfApdnLlQcIJ+IcedkH0n5
 XAFQ==
X-Gm-Message-State: AO0yUKXu0nQrOiYfMcdjJdghlBvISpfbORBPtPiDChCtNUmXxFObAdIx
 ZLu4dFnkGsEqUkTjqv9OyFwB2A==
X-Google-Smtp-Source: AK7set9K3PtG67ak5iRkZK8XM/JWpYr8mKpf+TYxxMa4HxsFeW3yWsQ5tLCQuA2JyMr3PcXRoItX0g==
X-Received: by 2002:a7b:c3cb:0:b0:3e2:dbb:5627 with SMTP id
 t11-20020a7bc3cb000000b003e20dbb5627mr3152956wmj.3.1676576794467; 
 Thu, 16 Feb 2023 11:46:34 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 bi5-20020a05600c3d8500b003dd9232f036sm6303937wmb.23.2023.02.16.11.46.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 11:46:33 -0800 (PST)
Date: Thu, 16 Feb 2023 20:46:32 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 1/2] drm: document DRM_IOCTL_PRIME_HANDLE_TO_FD and
 PRIME_FD_TO_HANDLE
Message-ID: <Y+6IGDbSivtH68Bm@phenom.ffwll.local>
References: <20230216130934.156541-1-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230216130934.156541-1-contact@emersion.fr>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: Pekka Paalanen <ppaalanen@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 16, 2023 at 01:09:41PM +0000, Simon Ser wrote:
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Daniel Stone <daniel@fooishbar.org>
> ---
>  include/uapi/drm/drm.h | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 4cb956a52aee..54b2313c8332 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -1012,7 +1012,24 @@ extern "C" {
>  #define DRM_IOCTL_UNLOCK		DRM_IOW( 0x2b, struct drm_lock)
>  #define DRM_IOCTL_FINISH		DRM_IOW( 0x2c, struct drm_lock)
>  
> +/**
> + * DRM_IOCTL_PRIME_HANDLE_TO_FD - Convert a GEM handle to a DMA-BUF FD.
> + *
> + * User-space sets &drm_prime_handle.handle with the GEM handle to export and
> + * &drm_prime_handle.flags, and gets back a DMA-BUF file descriptor in
> + * &drm_prime_handle.fd.

I think it'd be good to mention here that export could fail for any number
of driver specific reason, e.g. because the driver doesn't support dma-buf
export at all, or it's not supported for this specific gem handle because
it's a special one. And therefore generic clients need to be able to cope
with some kind of fallback path ideally.

Also I think it'd be good to mention that export support is announced with
the DRM_PRIME_CAP_EXPORT flag in the DRM_CAP_PRIME GETCAP ioctl
capability.

> + */
>  #define DRM_IOCTL_PRIME_HANDLE_TO_FD    DRM_IOWR(0x2d, struct drm_prime_handle)
> +/**
> + * DRM_IOCTL_PRIME_FD_TO_HANDLE - Convert a DMA-BUF FD to a GEM handle.
> + *
> + * User-space sets &drm_prime_handle.fd with a DMA-BUF file descriptor to
> + * import, and gets back a GEM handle in &drm_prime_handle.handle.
> + * &drm_prime_handle.flags is unused.

Same here, some mention that import can fail for any reason (many drivers
do not support importing to anything else than the exporting device). Also
DRM_PRIME_CAP_IMPORT for querying.

> + *
> + * If an existing GEM handle refers to the memory object backing the DMA-BUF,
> + * that GEM handle is returned.

I think we need to state clearly that this means importers who get unknown
buffers must have a userspace lookup structure to catch these handle
deduplications and refcount objects properly.

With these additions: Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> + */
>  #define DRM_IOCTL_PRIME_FD_TO_HANDLE    DRM_IOWR(0x2e, struct drm_prime_handle)
>  
>  #define DRM_IOCTL_AGP_ACQUIRE		DRM_IO(  0x30)
> -- 
> 2.39.1
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
