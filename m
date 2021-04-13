Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A79DE35E141
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 16:19:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BD126E1CE;
	Tue, 13 Apr 2021 14:19:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F6126E364
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 14:19:14 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id a4so16665436wrr.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 07:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Fi0X5ngufa7sgrbv8TvEdS+d6/dhvYtSaS3N9CJXdBU=;
 b=AxoNdYAh0Wa8FshIPKUkPDxq5jlpEMHa+AfBqsNITE2pghHkRmEAoNaOHpnM5sAyJO
 855QMyvy9gKDthcg/X0MXOE+k93HEorhnXzebCctoS17SUX0N5h2gvd9AcOJdYXh2guV
 TlgtJmlon2JY48i1snuaLt3kSgHwmX9WJoi48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Fi0X5ngufa7sgrbv8TvEdS+d6/dhvYtSaS3N9CJXdBU=;
 b=b6dYuclPTcOBsGL5BkTa8Ox0hM4pb9uXyffk4Cgj3eHD8EXF96FLpRgxlF0obslEh5
 1rKZVcz/khYU2IAGtosQ9zKGXFmL4640C1vI9/1swKWHaUueggDsdkdpVfVklu9OBjnk
 wMAEQw4W6j+HQqWJBkuHZhIBW6vfCRpLLG3ZI630gYQXDcTm5WGubLzztSsgaw4KsMod
 QPJ3FTMRQdBYbpHNwmDhnJOfMVzoUu2shl8BBngS1u91d5x7J9jo5BG+SO1p4OXuESos
 ZVr7fWo1+MazFZKosZ2jyS9x5QHv5qxY4v3jwltjdf3JTD9haJopznlHsv2vDlo9uWHc
 0QUw==
X-Gm-Message-State: AOAM530YPYeYc6vr9GeufIH+kE9uVSCrFvt5Q5GC7RxAlRQReyZ3VgFM
 IeIr5X5A07hrnm2k/pki+PEhqQ==
X-Google-Smtp-Source: ABdhPJzVwIvl6NplT2o9Dj6Lxa9G/b/tuxHA5FAJcm8eFKkjI50305D6SHHnDP+oNFkTsKNALNgHcA==
X-Received: by 2002:adf:e48f:: with SMTP id i15mr37234879wrm.197.1618323553168; 
 Tue, 13 Apr 2021 07:19:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e33sm2471716wmp.43.2021.04.13.07.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 07:19:12 -0700 (PDT)
Date: Tue, 13 Apr 2021 16:19:10 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH 12/12] drm/modifiers: Enforce consistency between the cap
 an IN_FORMATS
Message-ID: <YHWoXkAdoD3NL2Fk@phenom.ffwll.local>
References: <20210413094904.3736372-1-daniel.vetter@ffwll.ch>
 <20210413094904.3736372-12-daniel.vetter@ffwll.ch>
 <20210413145602.70f674b1@eldfell>
 <YHWmkZYqUeZKQN9R@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YHWmkZYqUeZKQN9R@phenom.ffwll.local>
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 13, 2021 at 04:11:29PM +0200, Daniel Vetter wrote:
> On Tue, Apr 13, 2021 at 02:56:02PM +0300, Pekka Paalanen wrote:
> > On Tue, 13 Apr 2021 11:49:03 +0200
> > Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > 
> > > It's very confusing for userspace to have to deal with inconsistencies
> > > here, and some drivers screwed this up a bit. Most just ommitted the
> > > format list when they meant to say that only linear modifier is
> > > allowed, but some also meant that only implied modifiers are
> > > acceptable (because actually none of the planes registered supported
> > > modifiers).
> > > 
> > > Now that this is all done consistently across all drivers, document
> > > the rules and enforce it in the drm core.
> > > 
> > > Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > Cc: Maxime Ripard <mripard@kernel.org>
> > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > Cc: David Airlie <airlied@linux.ie>
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > ---
> > >  drivers/gpu/drm/drm_plane.c   | 16 +++++++++++++++-
> > >  include/drm/drm_mode_config.h |  2 ++
> > >  2 files changed, 17 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> > > index 0dd43882fe7c..16a7e3e57f7f 100644
> > > --- a/drivers/gpu/drm/drm_plane.c
> > > +++ b/drivers/gpu/drm/drm_plane.c
> > > @@ -128,6 +128,11 @@
> > >   *     pairs supported by this plane. The blob is a struct
> > >   *     drm_format_modifier_blob. Without this property the plane doesn't
> > >   *     support buffers with modifiers. Userspace cannot change this property.
> > > + *
> > > + *     Note that userspace can check the DRM_CAP_ADDFB2_MODIFIERS driver
> > > + *     capability for general modifier support. If this flag is set then every
> > > + *     plane will have the IN_FORMATS property, even when it only supports
> > > + *     DRM_FORMAT_MOD_LINEAR.
> > 
> > Ooh, that's even better. But isn't that changing the meaning of the
> > cap? Isn't the cap older than IN_FORMATS?
> 
> Hm indeed. But also how exactly are you going to user modifiers without
> IN_FORMATS ... it's a bit hard. I think this is all because we've enabled
> modifiers piece-by-piece and never across the entire thing (e.g. with
> compositor and protocols), so the missing pieces only became apparent
> later on.

Ok I worked git log -Gallow_fb_modifiers and there's 3 drivers which
enabled modifiers before IN_FORMATS was merged:
- i915
- msm/mdp4 (for the tiled NV12 format thing)
- tegra

> I'm not sure whether compositors really want to support this, I guess
> worst case we could disable the cap on these old kernels.
> 
> > What about the opposite? Is it allowed to have even a single IN_FORMATS
> > if you don't have the cap?
> 
> That direction is enforced since 5.1, because some drivers screwed it up
> and confusion in userspace ensued.
> 
> Should I add a bug that on kernels older than 5.1 the situation is more
> murky and there's lots of bugs?

I guess we should recommend to userspace that if they spot an
inconsistency between IN_FORMATS across planes and the cap then maybe they
want to disable modifier support because it might be all kinds of broken?
-Daniel

> 
> > 
> > >   */
> > >  
> > >  static unsigned int drm_num_planes(struct drm_device *dev)
> > > @@ -277,8 +282,14 @@ static int __drm_universal_plane_init(struct drm_device *dev,
> > >  			format_modifier_count++;
> > >  	}
> > >  
> > > -	if (format_modifier_count)
> > > +	/* autoset the cap and check for consistency across all planes */
> > > +	if (format_modifier_count) {
> > > +		WARN_ON(!config->allow_fb_modifiers &&
> > > +			!list_empty(&config->plane_list));
> > 
> > What does this mean?
> 
> If allow_fb_modifiers isn't set yet (we do that in the line below) and we
> are _not_ the first plane that gets added to the driver (that's done
> towards the end of the function) then that means there's already a plane
> registered without modifiers and hence IN_FORMAT. Which we then warn
> about.
> 
> > 
> > >  		config->allow_fb_modifiers = true;
> > > +	} else {
> > > +		WARN_ON(config->allow_fb_modifiers);
> 
> This warning here checks the other case of an earlier plane with
> modifiers, but the one we're adding now doesn't have them.
> -Daniel
> 
> > > +	}
> > >  
> > >  	plane->modifier_count = format_modifier_count;
> > >  	plane->modifiers = kmalloc_array(format_modifier_count,
> > > @@ -360,6 +371,9 @@ static int __drm_universal_plane_init(struct drm_device *dev,
> > >   * drm_universal_plane_init() to let the DRM managed resource infrastructure
> > >   * take care of cleanup and deallocation.
> > >   *
> > > + * Drivers supporting modifiers must set @format_modifiers on all their planes,
> > > + * even those that only support DRM_FORMAT_MOD_LINEAR.
> > 
> > Good.
> > 
> > > + *
> > >   * Returns:
> > >   * Zero on success, error code on failure.
> > >   */
> > > diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> > > index ab424ddd7665..1ddf7783fdf7 100644
> > > --- a/include/drm/drm_mode_config.h
> > > +++ b/include/drm/drm_mode_config.h
> > > @@ -909,6 +909,8 @@ struct drm_mode_config {
> > >  	 * @allow_fb_modifiers:
> > >  	 *
> > >  	 * Whether the driver supports fb modifiers in the ADDFB2.1 ioctl call.
> > > +	 * Note that drivers should not set this directly, it is automatically
> > > +	 * set in drm_universal_plane_init().
> > >  	 *
> > >  	 * IMPORTANT:
> > >  	 *
> > 
> > Thanks,
> > pq
> 
> 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
