Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A09144DC5
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 09:31:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2F4B89AC3;
	Wed, 22 Jan 2020 08:31:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F15489AC3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 08:31:43 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id p17so6196782wmb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 00:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=vETm/cqCDdvu8YgJ91D8ovTzZmiZ5bghni5xOlGJa50=;
 b=Sft5dCWICznPBdMLL1VP3xutOvmmI3zIZgFi/qdZISt6LRrNscYorefEQHLmYYRqKZ
 KWT4w5opqDO9q1wJ/VME8d/ENGgll01J2LRNIXjHL/OZHCcKtF46ZGASluDEo5y65SYF
 ATntM9icj+qqTQKmpkuGxqOEMJWaRDDP2qOnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vETm/cqCDdvu8YgJ91D8ovTzZmiZ5bghni5xOlGJa50=;
 b=l+l6YEIycmpU7+YqcsmBF5+NL+ODZGYrWk87vpMxuDzHBim9/q+gV5AQF1RBVnB3HN
 qkNIQTPeJC6aywGVLfTMBfKxKP2oXZjexN6G99pOD8mka7hd4DOXU7NeeXPSc512GLdC
 FzCdZrHtE8kPGtz1FSluwjFtN/6TeuN7nEL8gIV9VNfKpoWJCcw+NbGw5ajEs2py52Lj
 DBSQ686g8V2PZzQyR4LW1ajRI/koUBGy6IqC8jsKMCLHCe9UKzc1foOGLNx8QVcQiT70
 bRT9JICPeSnh4L78N8dhg5YNYD9NRglw+B7z+HOyqKFbF9Jsg5afV6ttpXsDCzgSHJwk
 0N4g==
X-Gm-Message-State: APjAAAXhOMD51pYHRnUXx+z4IiSPrN/Yr9JiHpivqPB3kWz9VRqIlByL
 LWOmZywShS5vqECCAogihjuLieI1OEgz4A==
X-Google-Smtp-Source: APXvYqyGHGDtB9jvhm0wcfvsN8ff+Y7NBcqJOhea2NMz8SRwNiCQCQfPW7Aub5jBelErwtQJogOSOQ==
X-Received: by 2002:a1c:f218:: with SMTP id s24mr1749861wmc.128.1579681902143; 
 Wed, 22 Jan 2020 00:31:42 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g7sm55799243wrq.21.2020.01.22.00.31.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 00:31:41 -0800 (PST)
Date: Wed, 22 Jan 2020 09:31:39 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 1/4] drm: Add drm_crtc_has_vblank()
Message-ID: <20200122083139.GP43062@phenom.ffwll.local>
References: <20200120122051.25178-1-tzimmermann@suse.de>
 <20200120122051.25178-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200120122051.25178-2-tzimmermann@suse.de>
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
Cc: david@lechnology.com, oleksandr_andrushchenko@epam.com, airlied@linux.ie,
 sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, hdegoede@redhat.com,
 kraxel@redhat.com, xen-devel@lists.xenproject.org, emil.velikov@collabora.com,
 sean@poorly.run, laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 20, 2020 at 01:20:48PM +0100, Thomas Zimmermann wrote:
> The new interface drm_crtc_has_vblank() return true if vblanking has
> been initialized for a certain CRTC, or false otherwise. This function
> will be useful for initializing CRTC state.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_vblank.c | 21 +++++++++++++++++++++
>  include/drm/drm_vblank.h     |  1 +
>  2 files changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 1659b13b178c..c20102899411 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -501,6 +501,27 @@ int drm_vblank_init(struct drm_device *dev, unsigned int num_crtcs)
>  }
>  EXPORT_SYMBOL(drm_vblank_init);
>  
> +/**
> + * drm_crtc_has_vblank - test if vblanking has been initialized for
> + *                       a CRTC
> + * @crtc: the CRTC
> + *
> + * Drivers may call this function to test if vblank support is
> + * initialized for a CRTC. For most hardware this means that vblanking
> + * can also be enabled on the CRTC.
> + *
> + * Returns:
> + * True if vblanking has been initialized for the given CRTC, false
> + * otherwise.
> + */
> +bool drm_crtc_has_vblank(const struct drm_crtc *crtc)

So making this specific to a CRTC sounds like a good idea. But it's not
the reality, drm_vblank.c assumes that either everything or nothing
supports vblanks.

The reason for dev->num_crtcs is historical baggage, it predates kms by a
few years. For kms drivers the only two valid values are either 0 or
dev->mode_config.num_crtcs. Yes that's an entire different can of worms
that's been irking me since forever (ideally drm_vblank_init would somehow
loose the num_crtcs argument for kms drivers, but some drivers call this
before they've done all the drm_crtc_init calls so it's complicated).

Hence drm_dev_has_vblank as I suggested. That would also allow you to
replace a bunch of if (dev->num_crtcs) checks in drm_vblank.c, which
should help quite a bit in code readability.

Cheers, Daniel

> +{
> +	struct drm_device *dev = crtc->dev;
> +
> +	return crtc->index < dev->num_crtcs;
> +}
> +EXPORT_SYMBOL(drm_crtc_has_vblank);
> +
>  /**
>   * drm_crtc_vblank_waitqueue - get vblank waitqueue for the CRTC
>   * @crtc: which CRTC's vblank waitqueue to retrieve
> diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
> index c16c44052b3d..531a6bc12b7e 100644
> --- a/include/drm/drm_vblank.h
> +++ b/include/drm/drm_vblank.h
> @@ -206,6 +206,7 @@ struct drm_vblank_crtc {
>  };
>  
>  int drm_vblank_init(struct drm_device *dev, unsigned int num_crtcs);
> +bool drm_crtc_has_vblank(const struct drm_crtc *crtc);
>  u64 drm_crtc_vblank_count(struct drm_crtc *crtc);
>  u64 drm_crtc_vblank_count_and_time(struct drm_crtc *crtc,
>  				   ktime_t *vblanktime);
> -- 
> 2.24.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
