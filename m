Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDC42E0782
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 09:55:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 791E96E1BD;
	Tue, 22 Dec 2020 08:55:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EAAC6E834
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 08:55:33 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id r3so13743580wrt.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 00:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=FocgHSa/1IBTCjJZBKS63e/YGZK7NDMxnQeUx2X5exE=;
 b=Dx3QqJctXvD0lH1xLd2cofvNmZyilh8P+T0RRaocu2BmBKM7L0Mo3FSDw70m8ym64m
 QhzV9QlIWdwdLs3EXA+5Mf+L1DGHv+niGqmKn8eM6flrF7+8ogJzEIENkfo+t4fYww+P
 DnAE0w+ZNADgJrU/FSMzw6VrKyh6ILAAnOLag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FocgHSa/1IBTCjJZBKS63e/YGZK7NDMxnQeUx2X5exE=;
 b=uaYx5RsauVc0rpVNz8QvVez1hGh3yBDPIsMbRettK42W26LmPzJVuVvyF0bt893gBO
 NCRLDMeU6/CBqH617WEH0BxknxOIzkYCHfZq+t7U1NlRHQwPYS/usyVP40IUquSNXFvz
 t4+g6BXh+vvWQvUMM3qory31w2icJzAJkP8N9X42gRrdReH5sUpXTp/pDqVwspOBUm8o
 virFpiidcjSEi3IkZFiFxmuIfnZwDBBN+6oQl8jlQj5VcsF0L1c+8SAxPUtpNM38i9r+
 zmgOcPGn3caghVE5lOI6OPUDx98ZFFK+0VWAnnaZxyxDhkERhJWMyPls/k7UGibbyAhF
 bkog==
X-Gm-Message-State: AOAM532MXLDmuIhJfVsPGurr5aFnnaN+gqONMJFZe+2SA26tNVL4GxUA
 coZRp5wgTj99UIxIc6buvpBp5gVu8rtbHyMT
X-Google-Smtp-Source: ABdhPJxFwknmj1qLY2RAEP3jNX1nWc3FCMDJnRpX4m47dDglA/bK0yZjxGhi0+yu5VB0IGWR/h7qOA==
X-Received: by 2002:a05:6000:124e:: with SMTP id
 j14mr23274942wrx.310.1608627331702; 
 Tue, 22 Dec 2020 00:55:31 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f14sm24774304wme.14.2020.12.22.00.55.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Dec 2020 00:55:30 -0800 (PST)
Date: Tue, 22 Dec 2020 09:55:28 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/fb-helper: Add a FIXME that generic_setup is
 very confusing
Message-ID: <X+G0gDNlSCGLyjGK@phenom.ffwll.local>
References: <20201211161113.3350061-1-daniel.vetter@ffwll.ch>
 <20201211161113.3350061-2-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201211161113.3350061-2-daniel.vetter@ffwll.ch>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 11, 2020 at 05:11:13PM +0100, Daniel Vetter wrote:
> I tried to fix this for real, but it's very sprawling and lots of
> drivers get this mildly wrong one way or the other.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>

Anyone feeling like an ack on this one?
-Daniel

> ---
>  drivers/gpu/drm/drm_fb_helper.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 596255edf023..27deed4af015 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -2494,6 +2494,11 @@ void drm_fbdev_generic_setup(struct drm_device *dev,
>  		return;
>  	}
>  
> +	/*
> +	 * FIXME: This mixes up depth with bpp, which results in a glorious
> +	 * mess, resulting in some drivers picking wrong fbdev defaults and
> +	 * others wrong preferred_depth defaults.
> +	 */
>  	if (!preferred_bpp)
>  		preferred_bpp = dev->mode_config.preferred_depth;
>  	if (!preferred_bpp)
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
