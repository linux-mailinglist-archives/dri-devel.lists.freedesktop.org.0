Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 276A244AA8A
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 10:24:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31EE56EA56;
	Tue,  9 Nov 2021 09:24:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E2246EA55
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 09:24:37 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id u18so31763355wrg.5
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Nov 2021 01:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=m955TQZGk9XrTyVWYClDym18dqFygGlN45TEs7nw+Co=;
 b=MMnfXuIkwsAsu0pA2DIf4osYOaLx1VlFUFhxWkZ9iiNryC6sjlU7XFxrTy+a8hnokC
 aDjdZUWpaNz1BxXiWj6+FlvzYCLCAPxrZ0Yd5cvw8IPLBParBUGPlhleZKsTH8jpG7Fh
 6pJtjALV5+v+42qKa3pqEBYxFeW4xAyG1wZEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=m955TQZGk9XrTyVWYClDym18dqFygGlN45TEs7nw+Co=;
 b=rWkK+nr33CKGGGWawQZTv0i5855D0AXwRvy4cD7B1yob1XYxxJfu6BjzNSuSlF9Xe4
 seohkoFNT2IGVyCfSeBylF3qnjC/Qv+dat5JheG8TTnNJeH2YhS/FRgR9OwF5evx9KZC
 w9XrqgLlcF56UUc2sisiyA7mZ9zZz87qQVkfgYQICtDWKFyp80FP2s1hTF9Tugcc5PLo
 64iYXfm2VhZl92YQ6R/G7GugTOl6YmgMxkiq2WAoPt3UtnbSv4et9JMddLYzB2pyX1/w
 Ugk2XNQKUO0uwZeKyCG9iwL33RDDwWgFOF5NHyYLlP8vFc0TrDBEwIb+tJTZ5w4T3Jop
 8sPw==
X-Gm-Message-State: AOAM530eOpJupLMVEi35xU4XYk9NVt+uj+vPQdk5mFYhBuIOxiaIusQC
 p7O2TXKr8EAMfIfXg4uJEuF+BA==
X-Google-Smtp-Source: ABdhPJxaRIVkvmieaiggWKmZte2XA6U+ZWCofOiYXBdl+zPumYQxV4Q9P1JHaLTgPU5cj4DYRIN66w==
X-Received: by 2002:adf:e747:: with SMTP id c7mr7404940wrn.38.1636449875705;
 Tue, 09 Nov 2021 01:24:35 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r17sm2157377wmq.11.2021.11.09.01.24.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 01:24:35 -0800 (PST)
Date: Tue, 9 Nov 2021 10:24:33 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: document DRM_IOCTL_MODE_GETFB2
Message-ID: <YYo+UeTjGWU11+u6@phenom.ffwll.local>
References: <20211109085601.170275-1-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211109085601.170275-1-contact@emersion.fr>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 09, 2021 at 08:56:10AM +0000, Simon Ser wrote:
> There are a few details specific to the GETFB2 IOCTL.
> 
> It's not immediately clear how user-space should check for the
> number of planes. Suggest using the pitches field.
> 
> The modifier array is filled with zeroes, ie. DRM_FORMAT_MOD_LINEAR.
> So explicitly tell user-space to not look at it unless the flag is
> set.
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> ---
>  include/uapi/drm/drm.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 3b810b53ba8b..9809078b0f51 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -1096,6 +1096,22 @@ extern "C" {
>  #define DRM_IOCTL_SYNCOBJ_TRANSFER	DRM_IOWR(0xCC, struct drm_syncobj_transfer)
>  #define DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL	DRM_IOWR(0xCD, struct drm_syncobj_timeline_array)
>  
> +/**
> + * DRM_IOCTL_MODE_GETFB2 - Get framebuffer metadata.
> + *
> + * This queries metadata about a framebuffer. User-space fills
> + * &drm_mode_fb_cmd2.fb_id as the input, and the kernels fills the rest of the
> + * struct as the output.
> + *
> + * If the client is not DRM master and doesn't have &CAP_SYS_ADMIN,
> + * &drm_mode_fb_cmd2.handles will be zeroed. Planes are valid until one has a
> + * zero &drm_mode_fb_cmd2.pitches -- this can be used to compute the number of
> + * planes.

Maybe explain that when actually importing the buffer userspace should
look for non-zeor handles instead, since some drivers/formats leave a
silly pitch value behind. Or at least I think that can happen. Just for
additional robustness?

> + *
> + * If the framebuffer has a format modifier, &DRM_MODE_FB_MODIFIERS will be set
> + * in &drm_mode_fb_cmd2.flags. Otherwise, &drm_mode_fb_cmd2.modifier has
> + * undefined contents.

Uh is this true? We should always clear values to avoid accidental leaks
and stuff.

> + */

I think kerneldoc for drm_mode_fb_cmd2 would be neat too, so we can
document how pitch is supposed to work and all that stuff.

Anyway lgtm otherwise.
-Daniel

>  #define DRM_IOCTL_MODE_GETFB2		DRM_IOWR(0xCE, struct drm_mode_fb_cmd2)
>  
>  /*
> -- 
> 2.33.1
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
