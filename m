Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 027E92E0B3C
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 14:59:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31FDE6E3D0;
	Tue, 22 Dec 2020 13:59:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C56026E3D0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 13:59:07 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id 3so2261889wmg.4
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 05:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dS7XmocBasqYGQw8giWvmqUCGMKbDHvna5qNWdEimKg=;
 b=hJUn+uN1CGDrW/ti3eRIQrvZqVSpVGnxnrgf1hCJS4jAiZPVQlbpLZDeqCHigtyULG
 GolvNStBrAa54SpeQu6NqzvBUFltfqjGXHadLsUPzVvInfk+Kpm8O/RUuvzpxIr/LJZW
 YKqcWUh+SCKfqDoUNp4KWR9nq2t1YnWAjPREM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dS7XmocBasqYGQw8giWvmqUCGMKbDHvna5qNWdEimKg=;
 b=MttaAdE4A5ANRKfIGn0XLvWh/pZMzewqffntNXS/BNWWrJ0asDLgpqDUwLanQDZ8De
 eab89lgB3ub7+xOexY8aOKByFRTfoN7LGCfgZ8fuRt2Zp3y0qxs4Hanyjm9muof6iHfe
 vhOUZMFDyW3HPXnqet0rVs91Ofc266eGtJk5brDayxO78NICfZ4jVkdY68YPQ1zoJQbz
 4O4fk2vglTzR0jdw9REjUmFBB6N+jRx17K8sMQBiKIR1OfcSBuAe4dQfuSoNKSuKriuO
 fcutXy0zJzzhaUjhxG+FcmB9dwQzzhvP/p4nIUuFSKYncC5EqIVGvXQlOO5MrVbNMHmc
 M6cA==
X-Gm-Message-State: AOAM531lOg+FY7Z11ACZdlFzf8+P5/GHux2XmGyLyzO9bRhtEB403cED
 rnCL8MelE0C4Qu8V5ILdzFXdBnk7C4JiO67o
X-Google-Smtp-Source: ABdhPJwMj16YN2EnrmGjKFPh/g56xs5VC8i8WSrUOsuS9VoXCboCuBtH5fQ4beBFfttxZZgl84XoJA==
X-Received: by 2002:a1c:7c03:: with SMTP id x3mr22389873wmc.17.1608645546497; 
 Tue, 22 Dec 2020 05:59:06 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s133sm27312969wmf.38.2020.12.22.05.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Dec 2020 05:59:05 -0800 (PST)
Date: Tue, 22 Dec 2020 14:59:04 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v4 2/5] drm/doc: document the type plane property
Message-ID: <X+H7qJI6gqPa57tL@phenom.ffwll.local>
References: <20201222133524.160842-1-contact@emersion.fr>
 <20201222133524.160842-3-contact@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201222133524.160842-3-contact@emersion.fr>
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

On Tue, Dec 22, 2020 at 02:35:21PM +0100, Simon Ser wrote:
> Add a new entry for "type" in the section for standard plane properties.
> 
> v3: improve paragraph about mixing legacy IOCTLs with explicit usage,
> not that a driver may support cursors without cursor planes (Daniel)

s/not/note/

> 
> v4: fixing rebase gone wrong
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> ---
>  drivers/gpu/drm/drm_plane.c | 58 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 54 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index b15b65e48555..9dce5be5780c 100644
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
>   * Each CRTC must have a unique primary plane userspace can attach to enable
>   * the CRTC. In other words, userspace must be able to attach a different
> @@ -72,6 +70,58 @@
>   *
>   * DRM planes have a few standardized properties:
>   *
> + * type:
> + *     Immutable property describing the type of the plane.
> + *
> + *     For user-space which has enabled the &DRM_CLIENT_CAP_UNIVERSAL_PLANES

s/UNIVERSAL_PLANES/ATOMIC/ here?

With just universal planes you don't have atomic test-only. But I guess it
also works as-is, I'm just not entirely clear what you want to state here.

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
> + *         Primary planes are implicitly used by the kernel in the legacy
> + *         IOCTLs &DRM_IOCTL_MODE_SETCRTC and &DRM_IOCTL_MODE_PAGE_FLIP.
> + *         Therefore user-space must not mix explicit usage of any primary
> + *         plane (e.g. through an atomic commit) with these legacy IOCTLs.

Empty line here for reading comfort in plain text? Same below.

Since you mention formats below, I also wonder whether we should state
here that xrgb8888 is generally supported, worst case through software
emulation. That's defacto the uapi we have to adhere to.

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
> + *         Cursor planes are implicitly used by the kernel in the legacy
> + *         IOCTLs &DRM_IOCTL_MODE_CURSOR and &DRM_IOCTL_MODE_CURSOR2.
> + *         Therefore user-space must not mix explicit usage of any cursor
> + *         plane (e.g. through an atomic commit) with these legacy IOCTLs.
> + *
> + *         Some drivers may support cursors even if no cursor plane is exposed.
> + *         In this case, the legacy cursor IOCTLs can be used to configure the
> + *         cursor.
> + *     "Overlay":
> + *         Neither primary nor cursor.
> + *
> + *         Overlay planes are the only planes exposed when the
> + *         &DRM_CLIENT_CAP_UNIVERSAL_PLANES capability is disabled.
> + *

Just some thoughts about, feel free to merge as-is.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

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
