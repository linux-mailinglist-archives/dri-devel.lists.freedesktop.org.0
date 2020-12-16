Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D102DC848
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 22:23:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A29D0899D4;
	Wed, 16 Dec 2020 21:23:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A60899D4
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 21:23:53 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id n16so2717796wmc.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 13:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=X98rQTREhloXbxUFMbTkiNNt8W3RPYt7XesKzAet9EQ=;
 b=chEwVrKUhe2QjCAegFXgj55KkloXF3nSxlS9zc7A7CC4FKuRX9sDsACSw967MTqqMx
 k8iK54qNuyc0c+6HqKnXDASDhEmzVRUqKDe0EFQBhr5FoftiWO+A0sfnHgGi8CjfSdbd
 pUoYk5Vpxl5NazmPIvjNJ2N4KC9kTgcoUgNQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=X98rQTREhloXbxUFMbTkiNNt8W3RPYt7XesKzAet9EQ=;
 b=UQwxFLjljXroNDnl7tRyZFqenTx2PJarrXw9phpYMcG7HCmt+vA9PlO67cQPenmuRK
 lMYTRdCd3CAhmuxzHYs3lkBVc+2PIPWrB+/c5uTuKwFqWwG2TyN8wDjlz3ZTMIrmquYh
 Q2Ln1W9jIjtF67OV+4e7k/QlQLHFPHnveWJOvdZBCC1H9TEQOX8xRyN86+1vQ4IWn+6b
 FRcsp1Ebuyrh8KMBYo7NVeonMbZhKKzQ7XC0+qQLWgF2L21rNtME4Mgq8486U1qHKDcE
 xbfO+0EBJ1UkQd7gyuCMMjxVj1HVH6IZfZlSJq18/BI6Fn7AczI8FyZ5NSgNSU0Od6ny
 pG1A==
X-Gm-Message-State: AOAM533ArX91WBPE+Msocr+s00u1OrTI5Plp0yN24qjNRYKrVCk8AQ67
 NGMqY2UfgrMS1ZPgsxVeq4Zcig==
X-Google-Smtp-Source: ABdhPJwfSQM3Jd/Qn6VWKLEcaUalSerApNWduAtQOETKIjJgqWCC69w0cKCWKbCje0SzUGTFmtJmVA==
X-Received: by 2002:a1c:b7d4:: with SMTP id h203mr5369550wmf.59.1608153831811; 
 Wed, 16 Dec 2020 13:23:51 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s13sm4532065wmj.28.2020.12.16.13.23.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 13:23:51 -0800 (PST)
Date: Wed, 16 Dec 2020 22:23:49 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 8/8] drm/doc: document the type plane property
Message-ID: <X9p65bX22V6SndAA@phenom.ffwll.local>
References: <20201216202222.48146-1-contact@emersion.fr>
 <20201216202222.48146-9-contact@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201216202222.48146-9-contact@emersion.fr>
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

On Wed, Dec 16, 2020 at 09:22:22PM +0100, Simon Ser wrote:
> Add a new entry for "type" in the section for standard plane properties.
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>

Looks solid, bunch of comments for extensions and more clarity below.
-Daniel

> ---
>  drivers/gpu/drm/drm_plane.c | 39 +++++++++++++++++++++++++++++++++----
>  1 file changed, 35 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 4c1a45ac18e6..e21e0caaca0f 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -49,10 +49,8 @@
>   * &struct drm_plane (possibly as part of a larger structure) and registers it
>   * with a call to drm_universal_plane_init().
>   *
> - * The type of a plane is exposed in the immutable "type" enumeration property,
> - * which has one of the following values: "Overlay", "Primary", "Cursor" (see
> - * enum drm_plane_type). A plane can be compatible with multiple CRTCs, see
> - * &drm_plane.possible_crtcs.
> + * Each plane has a type, see enum drm_plane_type. A plane can be compatible
> + * with multiple CRTCs, see &drm_plane.possible_crtcs.
>   *
>   * Legacy uAPI doesn't expose the primary and cursor planes directly. DRM core
>   * relies on the driver to set the primary and optionally the cursor plane used
> @@ -66,6 +64,39 @@
>   *
>   * DRM planes have a few standardized properties:
>   *
> + * type:
> + *     Immutable property describing the type of the plane.
> + *
> + *     For user-space which has enabled the &DRM_CLIENT_CAP_UNIVERSAL_PLANES

While we're at this: Does the kerneldoc for this cap mention that it's
implicitly enabled when you're enabling atomic?

Maybe worth repeating here too.

> + *     capability, the plane type is just a hint and is mostly superseded by
> + *     atomic test-only commits. The type hint can still be used to come up
> + *     more easily with a plane configuration accepted by the driver.
> + *
> + *     The value of this property can be one of the following:
> + *
> + *     "Primary":
> + *         To light up a CRTC, attaching a primary plane is the most likely to
> + *         work if it covers the whole CRTC and doesn't have scaling or
> + *         cropping set up.
> + *
> + *         Drivers may support more features for the primary plane, user-space
> + *         can find out with test-only atomic commits.

We need to mention here that this is the implicit plane used by the
PAGE_FLIP and SETCRTC ioctl (maybe spell them out in full since these are
userspace docs).

> + *     "Cursor":
> + *         To enable this plane, using a framebuffer configured without scaling
> + *         or cropping and with the following properties is the most likely to
> + *         work:
> + *
> + *         - If the driver provides the capabilities &DRM_CAP_CURSOR_WIDTH and
> + *           &DRM_CAP_CURSOR_HEIGHT, create the framebuffer with this size.
> + *           Otherwise, create a framebuffer with the size 64x64.
> + *         - If the driver doesn't support modifiers, create a framebuffer with
> + *           a linear layout. Otherwise, use the IN_FORMATS plane property.

Same here, I think we should mention this is used implicitly (but only on
some drivers, there atomic drivers which do _not_ expose their cursor as a
cursor plane).

> + *
> + *         Drivers may support more features for the cursor plane, user-space
> + *         can find out with test-only atomic commits.
> + *     "Overlay":
> + *         Neither primary nor cursor.

This should mention that these are the only planes exposed when universal
planes isnt set.

> + *
>   * IN_FORMATS:
>   *     Blob property which contains the set of buffer format and modifier
>   *     pairs supported by this plane. The blob is a drm_format_modifier_blob
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
