Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E825F30F605
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 16:20:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D84196EDD6;
	Thu,  4 Feb 2021 15:20:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CB7D6EDD6
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 15:20:10 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id d16so3909911wro.11
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 07:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Ac3A+SbkL3baUw+xALykg/KWCv7Z54pm7tH0CMczysA=;
 b=bYsTXVuy7+1E87FLDBD8fmSP28PEXfnmjJ5qycx1OzIkP/e/spc4CQ+9z6YZcs34XS
 WBMjm2V02seh3okHmvFdFSML1ah0v/69h/+fX7CNcB0b60BHU8QzXq6LW9ctr/h+mvj5
 ztobewMjhySxtw8XsQbK3wVWqFiSQa7mbbllM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ac3A+SbkL3baUw+xALykg/KWCv7Z54pm7tH0CMczysA=;
 b=j0JkbKOykK/CqR1Y7PqrR9r/RKLk6u0zwIFnnuv1hzIygNZTLkqbWpOxYIMc8wKJMO
 5Yrx+Iu2hCn0UiFVIyONmIyA6YPMxsgiUXCZmD+A5BwrlKqAqmRNQsZZru34Z23EgZhj
 bI6g9wLd3V+anlaEf6jz24vNVRgh+Y2ySjkxacsC3AXIgeTMJeN7FtdT15+w7+DRS76C
 lly2SNb3LlaQE7894DxOukd77319Rdd0w9fMXTnYzbaOUD/pEQmgUzKTcE3FMWThE7DT
 LBD5HfahMmxB3CeeFUw3Wq+YtxtvQxHh6AY1RUFqaldsywfrm+YRZ7CrceuwtlmEKqr3
 9R+A==
X-Gm-Message-State: AOAM532QZShdzZzd9Yvf0sOeqf/M7kGBsq1vxmwO7jYIxeQ5HP5cpOAR
 ZI7xD93FeOMUpqMFkaNKDcGFR9VoIukWBAAK
X-Google-Smtp-Source: ABdhPJymR4Y4YE4thDA0Ch8NldqxVfvfj2DdMDiiTpOMKiRU6zezyB3BdBvzkirSlmhSJ2co4Y9jXQ==
X-Received: by 2002:a5d:4386:: with SMTP id i6mr9710757wrq.411.1612452009198; 
 Thu, 04 Feb 2021 07:20:09 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z185sm6958060wmb.0.2021.02.04.07.20.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 07:20:08 -0800 (PST)
Date: Thu, 4 Feb 2021 16:20:06 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Toni Spets <toni.spets@iki.fi>
Subject: Re: [PATCH] drm/rockchip: remove atomic helper dirtyfb
Message-ID: <YBwQpjdpzHy6ImxQ@phenom.ffwll.local>
References: <CAM+GfYH16EhimL6pYpgD1jutMoL6Ai2dAWQs=j71GqXbrm9J=A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAM+GfYH16EhimL6pYpgD1jutMoL6Ai2dAWQs=j71GqXbrm9J=A@mail.gmail.com>
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
Cc: Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 03, 2021 at 09:53:40PM +0200, Toni Spets wrote:
> The blocking implementation of the dirtyfb ioctl is extremely slow when
> used for damage tracking on RK3399. If this implementation is in place Xorg
> will default to using it and will slow down considerably when doing a lot
> of small draws. This is most apparent with the fvwm window manager on
> startup where it will almost lock up for many seconds seconds on RK3399.
> 
> Removing this implementation did not cause any visible issues on RK3399 but
> it did fix the performance issues on Xorg as it will disable damage
> tracking when the ioctl returns it's not supported.

Then you don't have a manual update panel.

Iirc there were patches to make this faster in recent kernels, on what
kernels did you try this?

Also X should only call this in the blocker handler, not all the time.

So yeah we need to make this faster, not break manual update panels.
-Daniel

> 
> -- 
> Toni Spets

> From 79984ee67c801f552e9eaf4d0cfb62101d1f0f2e Mon Sep 17 00:00:00 2001
> From: Toni Spets <toni.spets@iki.fi>
> Date: Wed, 3 Feb 2021 21:14:50 +0200
> Subject: [PATCH] drm/rockchip: remove atomic helper dirtyfb
> 
> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_fb.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
> index 3aa37e177667..2554fd1c8aeb 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
> @@ -21,7 +21,6 @@
>  static const struct drm_framebuffer_funcs rockchip_drm_fb_funcs = {
>  	.destroy       = drm_gem_fb_destroy,
>  	.create_handle = drm_gem_fb_create_handle,
> -	.dirty	       = drm_atomic_helper_dirtyfb,
>  };
>  
>  static struct drm_framebuffer *
> -- 
> 2.27.0
> 

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
