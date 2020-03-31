Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 017C61990AF
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 11:13:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0F2189DD2;
	Tue, 31 Mar 2020 09:13:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB03A89DD2
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 09:13:36 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id t128so1629406wma.0
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 02:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1Vfzw7KX7Tn1/4kdoX4gqvVCcauAo/CwK6/Pv0leSvI=;
 b=iOD1RHussWS4xxh+zJ9qOw1Khw+v5dDftBa2TN53Fzu5IZhQ8ye4K0EZpoxBbXKD65
 Psi8srGs7GoEr3/1gcRC91IVqt597tV9gHrUd2aSuJKfxuuS16hlmLLJ/axxQfR8KIOg
 D1J4GDTMzVTJ4lG4bNDyvsT9E/xvp7f5HfeRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1Vfzw7KX7Tn1/4kdoX4gqvVCcauAo/CwK6/Pv0leSvI=;
 b=FYG5dRJuX8dKyGD103MjfvX/m2O4mIZCUP8CJK6j4jpVePCZAgyPHnk912IKDoILiB
 gORIl+Z/P3Yyy1DB1K51ljhQlGLKU8l2n75jYU/uQNS6rLEbUofNn068OoQTwf3mJaL4
 J+DTylUJ+ycQEdjKsedSWLOr/8mrKn5o9rXcn8KtbpbYLbGWmSIHILi+TejfrPN5Npxi
 5t8SIiCLw5v/Y+jDF6UGjMjvHQe/Vvurr7UqKuDtRnloNDT53u47+do7bNDSm67/Ctwc
 zN1xXYxr4nGvGZ0NVmscLXcJuhHMNmMiEDoKEPES6VisgWhFRnQYFtonbQONKULKOKSW
 EU7A==
X-Gm-Message-State: ANhLgQ1vLXk3TN0WuB0B2Our5JBV94lc8CB+WAt4bopr+WQJeepJZSC9
 PRDGTlEhnTTwH8etsxUUIE/mzINxJY8dMQ==
X-Google-Smtp-Source: ADFU+vtbaJR/OSjaYI6Z5896xv9I41kM3DceV5Ft7DY0TDoLXW2Xz0K0eGpokAl+/cjUA0coPq9TIA==
X-Received: by 2002:a05:600c:214a:: with SMTP id
 v10mr2355322wml.71.1585646015532; 
 Tue, 31 Mar 2020 02:13:35 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b15sm25489082wru.70.2020.03.31.02.13.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 02:13:34 -0700 (PDT)
Date: Tue, 31 Mar 2020 11:13:32 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: add docs about the IN_FORMATS plane property
Message-ID: <20200331091332.GL2363188@phenom.ffwll.local>
References: <mHOtz80Wa-x3A5Lz5ETTM65VUMfW1j6b-iCuvIy1RzOM1EloHPqAb2MnbU8ygZi0ABaLrxuN6pzu0v3QRn83125C0bXuHoo-DQWWEd80fdw=@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mHOtz80Wa-x3A5Lz5ETTM65VUMfW1j6b-iCuvIy1RzOM1EloHPqAb2MnbU8ygZi0ABaLrxuN6pzu0v3QRn83125C0bXuHoo-DQWWEd80fdw=@emersion.fr>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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

On Sun, Mar 29, 2020 at 02:45:08PM +0000, Simon Ser wrote:
> This is a standard property attached to planes in drm_universal_plane_init
> when drm_mode_config.allow_fb_modifiers is true.
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Daniel Stone <daniel@fooishbar.org>
> ---
>  drivers/gpu/drm/drm_blend.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> index 121481f6aa71..88eedee018d3 100644
> --- a/drivers/gpu/drm/drm_blend.c
> +++ b/drivers/gpu/drm/drm_blend.c
> @@ -183,6 +183,12 @@
>   *		 plane does not expose the "alpha" property, then this is
>   *		 assumed to be 1.0
>   *
> + * IN_FORMATS:
> + *	Blob property which contains the set of buffer format and modifier
> + *	pairs supported by this plane. The blob is a drm_format_modifier_blob
> + *	struct. Without this property the plane doesn't support buffers with
> + *	modifiers. Userspace cannot change this property.

Feels mildly misplaced among the blending properties, but we don't (yet)
have a section to describe all the modifer/pixel format stuff and how it's
all supposed to work together. So for now probably as good as it gets.

Merged to drm-misc-next, thanks for your patch.
-Daniel

> + *
>   * Note that all the property extensions described here apply either to the
>   * plane or the CRTC (e.g. for the background color, which currently is not
>   * exposed and assumed to be black).
> -- 
> 2.26.0
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
