Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5752DD11B
	for <lists+dri-devel@lfdr.de>; Thu, 17 Dec 2020 13:13:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D24C6E25B;
	Thu, 17 Dec 2020 12:13:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ABF56E25B
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 12:13:16 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id c5so22705331wrp.6
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 04:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=esEEH5x8LEUhmdjd2HPdPV7semV1acEF8gAV37tduPo=;
 b=bOt6HZPR8BbPpoJkg75nB2LshDMIEfsnC7z166v0bEwGuS/Enuj7i+s5UEKRbm/t3N
 xzVi6kTxbG8lWGP1zHsvYFa8dw4PpIleJJZX8VHBFv1E7BvqPXfLyIHA2Iy3z/JiqZRe
 1fK7t4dZsXzgH2DqFfGSDedoo4gYOg60o2dtA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=esEEH5x8LEUhmdjd2HPdPV7semV1acEF8gAV37tduPo=;
 b=D6URGxApYbFUUjpWiH9wUk3e/i7x5MBvoGwJ0ffWAx4Kp9stiPBOawgGWda+TzACZO
 AvsdoU37F3zDsh6BxgP3B4cr0K1VBgLKwSHVHKfSWqwmQiY0BHB0qLrL1HP82TR2Tuit
 l7g9JDy6/CccklXobsASmdJcgHZOOHBPbXVTVLXqi50W1KrRe6U0kgGBKMhFLVXjXie5
 1p0xT2XE0pbb0OurASQfuUNVs2BunyF7W4nJh2b4qJ8Z8e3b+erMaf0/j2v9luQ4Bcj6
 LiC2OLk1Ji05S3Rf2KfkbcfiEoM4lFBJs4VsOjyGP+I4pAvuaavGot63NFoOtVLw8YGO
 UMtw==
X-Gm-Message-State: AOAM533qvSc1hov2x6f4ZhhmrscLfJ8xDr0z6eRV+OB4QPJQHZCNJ0Nb
 tX7bA1d07IPFULpMpXNDnEOZ7g==
X-Google-Smtp-Source: ABdhPJxMYKcIhvbfjEvIagWpIwKG4G7tbDllycPFnfP7HfsN6QJ/O+ljnmWC22rC/FdGEQvBvk7TKA==
X-Received: by 2002:adf:828b:: with SMTP id 11mr3743034wrc.180.1608207194984; 
 Thu, 17 Dec 2020 04:13:14 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l8sm9123679wrb.73.2020.12.17.04.13.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 04:13:14 -0800 (PST)
Date: Thu, 17 Dec 2020 13:13:12 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2 5/9] drm/doc: document the type plane property
Message-ID: <X9tLWIfo+catSo4V@phenom.ffwll.local>
References: <20201217113220.102271-1-contact@emersion.fr>
 <20201217113220.102271-6-contact@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201217113220.102271-6-contact@emersion.fr>
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

On Thu, Dec 17, 2020 at 12:32:16PM +0100, Simon Ser wrote:
> Add a new entry for "type" in the section for standard plane properties.
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> ---
>  drivers/gpu/drm/drm_plane.c | 52 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 48 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 4a66374dc355..fef63bb7d293 100644
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
> @@ -66,6 +64,52 @@
>   *
>   * DRM planes have a few standardized properties:
>   *
> + * type:
> + *     Immutable property describing the type of the plane.
> + *
> + *     For user-space which has enabled the &DRM_CLIENT_CAP_UNIVERSAL_PLANES
> + *     capability, the plane type is just a hint and is mostly superseded by
> + *     atomic test-only commits. The type hint can still be used to come up
> + *     more easily with a plane configuration accepted by the driver. Note that
> + *     &DRM_CLIENT_CAP_UNIVERSAL_PLANES is implicitly enabled by
> + *     &DRM_CLIENT_CAP_ATOMIC.
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
> + *
> + *         User-space must not mix the legacy IOCTLs &DRM_IOCTL_MODE_SETCRTC or
> + *         &DRM_IOCTL_MODE_PAGE_FLIP with atomic commits involving a primary
	s/a primary/any primary/

to make it a bit stronger

> + *         plane.

You can also use primary planes through the setplane ioctl. Also this
doesn't explain why, which is maybe a bit head scratching.

I'd put something like "Primary planes are used implicitly by the kernel
in the legacy IOCTLs SETCRTC & FLIP. Therefore userspace must not mix
explicit usage of any primary plane (e.g. through ATOMIC IOCTL) with these
legacy IOCTL." Feel free to bikeshed further.

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
> + *
> + *         Drivers may support more features for the cursor plane, user-space
> + *         can find out with test-only atomic commits.
> + *
> + *         User-space must not mix the legacy IOCTLs &DRM_IOCTL_MODE_CURSOR or
> + *         &DRM_IOCTL_MODE_CURSOR2 with atomic commits involving a cursor
> + *         plane.

Same here.

Maybe we should also note that cursors are not necessarily exposed as
cursor planes, even for drivers supporting atomic modeset.
-Daniel

> + *     "Overlay":
> + *         Neither primary nor cursor.
> + *
> + *         Overlay planes are the only planes exposed when the
> + *         &DRM_CLIENT_CAP_UNIVERSAL_PLANES capability is disabled.
> + *
>   * IN_FORMATS:
>   *     Blob property which contains the set of buffer format and modifier
>   *     pairs supported by this plane. The blob is a struct
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
