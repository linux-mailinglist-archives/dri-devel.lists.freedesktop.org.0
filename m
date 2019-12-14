Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 835A711EEF4
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 01:01:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07FB96EE22;
	Sat, 14 Dec 2019 00:01:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1C3E6EE22
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Dec 2019 00:01:29 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id b19so558473wmj.4
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 16:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=mHgw1ZcDJF/uaOqo2Uf1yZFWVybb4SNnH1sWk6TnMB8=;
 b=duSN7bv0xdjWWPVVjGHWqgLC5xNVjNgzGjEEa0x1K+K0tEijNPJ/XsbRBXVFTSgu3H
 UkesZV1Hf0le6aIcYbdEKVH4HxdU6BN7VXlRH6tqhRPYT9FbTOkCBr1CaFbX9+2tfWqI
 YbARyjCbxpAKUPlYQ60b/GJYkDjaX5/DL/Ko0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=mHgw1ZcDJF/uaOqo2Uf1yZFWVybb4SNnH1sWk6TnMB8=;
 b=qXnS+7SfrMhQ53r13SiW6mpaRGcszsv74URR9FlccwXiU9Sv5GSXraOZXERClp3lk4
 f6knURj6+L/kfCMUtc99vP1s0/lwG1mxyU6NTtAwV7OAt2gez4jCS3drv9+1bE4GtuOA
 a2knn0wjYY0I6FjtD51+zp2OQP85UWhswvkzqP7XggJyMr9Mf90h1esyqDA3ofHrsU+b
 dPxv9/AA3fuy8HZCWQx3sQsr7j3wpWuOaoXSxRT67jAZkpAnQJQdF7xqgDJhP4B9TET5
 L71HAL/TSwxyQWTxN2u7YnenAG1LvOhIPACGWxcmc3MXXdSZQr4R1QGxvCbIOTQwn3wi
 JEnw==
X-Gm-Message-State: APjAAAWU66UYM8l4GIhwyLG1gktqMJpVierGUdiOSi/NiX5FPHvLF3Z5
 ntoWSlYBWk8cWG7c+k1OEpX1lKzw7Bo=
X-Google-Smtp-Source: APXvYqwxHgFPLNfIZfJCyVFQUmkD7ynYr66fpU740/fS6zvb23m/rPBq14YLU/ZSNDmbXPp7IWgr6Q==
X-Received: by 2002:a05:600c:108a:: with SMTP id
 e10mr15521769wmd.38.1576281688335; 
 Fri, 13 Dec 2019 16:01:28 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id d6sm11910773wmb.6.2019.12.13.16.01.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 16:01:27 -0800 (PST)
Date: Sat, 14 Dec 2019 01:01:25 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: "Li, Juston" <juston.li@intel.com>
Subject: Re: [Intel-gfx] [RESEND PATCH v2] drm: Add getfb2 ioctl
Message-ID: <20191214000125.GO624164@phenom.ffwll.local>
References: <20191003183125.4520-1-juston.li@intel.com>
 <20191213213603.GK1208@intel.com>
 <aa2c2e05adc88b77b4a571cfb85517d7377afaa3.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aa2c2e05adc88b77b4a571cfb85517d7377afaa3.camel@intel.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "daniels@collabora.com" <daniels@collabora.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 13, 2019 at 10:52:03PM +0000, Li, Juston wrote:
> On Fri, 2019-12-13 at 23:36 +0200, Ville Syrj=E4l=E4 wrote:
> > On Thu, Oct 03, 2019 at 11:31:25AM -0700, Juston Li wrote:
> > > From: Daniel Stone <daniels@collabora.com>
> > > =

> > > getfb2 allows us to pass multiple planes and modifiers, just like
> > > addfb2
> > > over addfb.
> > > =

> > > Changes since v1:
> > >  - unused modifiers set to 0 instead of DRM_FORMAT_MOD_INVALID
> > >  - update ioctl number
> > > =

> > > Signed-off-by: Daniel Stone <daniels@collabora.com>
> > > Signed-off-by: Juston Li <juston.li@intel.com>
> > > ---
> > >  drivers/gpu/drm/drm_crtc_internal.h |   2 +
> > >  drivers/gpu/drm/drm_framebuffer.c   | 110
> > > ++++++++++++++++++++++++++++
> > >  drivers/gpu/drm/drm_ioctl.c         |   1 +
> > >  include/uapi/drm/drm.h              |   2 +
> > >  4 files changed, 115 insertions(+)
> > > =

> > > diff --git a/drivers/gpu/drm/drm_crtc_internal.h
> > > b/drivers/gpu/drm/drm_crtc_internal.h
> > > index c7d5e4c21423..16f2413403aa 100644
> > > --- a/drivers/gpu/drm/drm_crtc_internal.h
> > > +++ b/drivers/gpu/drm/drm_crtc_internal.h
> > > @@ -216,6 +216,8 @@ int drm_mode_rmfb_ioctl(struct drm_device *dev,
> > >  			void *data, struct drm_file *file_priv);
> > >  int drm_mode_getfb(struct drm_device *dev,
> > >  		   void *data, struct drm_file *file_priv);
> > > +int drm_mode_getfb2_ioctl(struct drm_device *dev,
> > > +			  void *data, struct drm_file *file_priv);
> > >  int drm_mode_dirtyfb_ioctl(struct drm_device *dev,
> > >  			   void *data, struct drm_file *file_priv);
> > >  =

> > > diff --git a/drivers/gpu/drm/drm_framebuffer.c
> > > b/drivers/gpu/drm/drm_framebuffer.c
> > > index 57564318ceea..6db54f177443 100644
> > > --- a/drivers/gpu/drm/drm_framebuffer.c
> > > +++ b/drivers/gpu/drm/drm_framebuffer.c
> > > @@ -31,6 +31,7 @@
> > >  #include <drm/drm_file.h>
> > >  #include <drm/drm_fourcc.h>
> > >  #include <drm/drm_framebuffer.h>
> > > +#include <drm/drm_gem.h>
> > >  #include <drm/drm_print.h>
> > >  #include <drm/drm_util.h>
> > >  =

> > > @@ -548,7 +549,116 @@ int drm_mode_getfb(struct drm_device *dev,
> > >  =

> > >  out:
> > >  	drm_framebuffer_put(fb);
> > > +	return ret;
> > > +}
> > > +
> > > +/**
> > > + * drm_mode_getfb2 - get extended FB info
> > > + * @dev: drm device for the ioctl
> > > + * @data: data pointer for the ioctl
> > > + * @file_priv: drm file for the ioctl call
> > > + *
> > > + * Lookup the FB given its ID and return info about it.
> > > + *
> > > + * Called by the user via ioctl.
> > > + *
> > > + * Returns:
> > > + * Zero on success, negative errno on failure.
> > > + */
> > > +int drm_mode_getfb2_ioctl(struct drm_device *dev,
> > > +			  void *data, struct drm_file *file_priv)
> > > +{
> > > +	struct drm_mode_fb_cmd2 *r =3D data;
> > > +	struct drm_framebuffer *fb;
> > > +	unsigned int i;
> > > +	int ret;
> > > +
> > > +	if (!drm_core_check_feature(dev, DRIVER_MODESET))
> > > +		return -EINVAL;
> > > +
> > > +	fb =3D drm_framebuffer_lookup(dev, file_priv, r->fb_id);
> > > +	if (!fb)
> > > +		return -ENOENT;
> > > +
> > > +	/* For multi-plane framebuffers, we require the driver to place
> > > the
> > > +	 * GEM objects directly in the drm_framebuffer. For single-
> > > plane
> > > +	 * framebuffers, we can fall back to create_handle.
> > > +	 */
> > > +	if (!fb->obj[0] &&
> > > +	    (fb->format->num_planes > 1 || !fb->funcs->create_handle))
> > > {
> > > +		ret =3D -ENODEV;
> > > +		goto out;
> > > +	}
> > > +
> > > +	r->height =3D fb->height;
> > > +	r->width =3D fb->width;
> > > +	r->pixel_format =3D fb->format->format;
> > > +
> > > +	r->flags =3D 0;
> > > +	if (dev->mode_config.allow_fb_modifiers)
> > > +		r->flags |=3D DRM_MODE_FB_MODIFIERS;
> > > +
> > > +	for (i =3D 0; i < ARRAY_SIZE(r->handles); i++) {
> > > +		r->handles[i] =3D 0;
> > > +		r->pitches[i] =3D 0;
> > > +		r->offsets[i] =3D 0;
> > > +		r->modifier[i] =3D 0;
> > > +	}
> > >  =

> > > +	for (i =3D 0; i < fb->format->num_planes; i++) {
> > > +		int j;
> > > +
> > > +		r->pitches[i] =3D fb->pitches[i];
> > > +		r->offsets[i] =3D fb->offsets[i];
> > > +		if (dev->mode_config.allow_fb_modifiers)
> > > +			r->modifier[i] =3D fb->modifier;
> > > +
> > > +		/* If we reuse the same object for multiple planes,
> > > also
> > > +		 * return the same handle.
> > > +		 */
> > > +		for (j =3D 0; j < i; j++) {
> > > +			if (fb->obj[i] =3D=3D fb->obj[j]) {
> > > +				r->handles[i] =3D r->handles[j];
> > > +				break;
> > > +			}
> > > +		}
> > > +
> > > +		if (r->handles[i])
> > > +			continue;
> > > +
> > > +		if (fb->obj[i]) {
> > > +			ret =3D drm_gem_handle_create(file_priv, fb-
> > > >obj[i],
> > > +						    &r->handles[i]);
> > > +		} else {
> > > +			WARN_ON(i > 0);
> > > +			ret =3D fb->funcs->create_handle(fb, file_priv,
> > > +						       &r->handles[i]);
> > > +		}
> > =

> > getfb1 doesn't allow non-master/root to see the handles. Here we
> > don't
> > seem to have that same protection?
> =

> Hmm yeah sorry I missed the protections handling.
> I think we can just set the getfb2 ioctl flags as
> DRM_MASTER|DRM_ROOT_ONLY

Since this was missed, can you pls extend the igt to test for this? Iirc
the getfb igt makes sure non-root doesn't get this ...

Also for consistency I think doing the same as getfb would be good. Fewer
surprises.
-Daniel

> =

> > > +
> > > +		if (ret !=3D 0)
> > > +			goto out;
> > =

> > Could be just 'break;' and then we wouldn't even need the label.
> =

> Will do.
> =

> > =

> > Rest lgtm.
> > =

> =

> Much appreciated
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
